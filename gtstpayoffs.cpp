#include "gtstpayoffs.h"

#include <numeric>
#include <cassert>

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Weffc++"
#pragma GCC diagnostic ignored "-Wunused-but-set-parameter"
#pragma GCC diagnostic ignored "-Wunused-local-typedefs"
#include <boost/numeric/conversion/cast.hpp>

#include "gtstpayoff.h"
#include "trace.h"
#pragma GCC diagnostic pop

ribi::gtst::Payoffs::Payoffs()
  : m_v{}
{

}

void ribi::gtst::Payoffs::Add(boost::shared_ptr<Payoff> payoff)
{
  assert(payoff);
  m_v.push_back(payoff);
}

int ribi::gtst::Payoffs::GetSize() const
{
  return boost::numeric_cast<int>(m_v.size());
}

bool ribi::gtst::Payoffs::IsEmpty() const
{
  return m_v.empty();
}

const boost::shared_ptr<const ribi::gtst::Payoff> ribi::gtst::Payoffs::GetLast() const
{
  assert(!m_v.empty());
  return m_v.back();
}

///Get the sum of the last n obtained payoffs
double ribi::gtst::Payoffs::GetLast(const int n) const
{
  #define DEBUG_TEMP_732487276655432842
  #ifdef  DEBUG_TEMP_732487276655432842
  if (n > boost::numeric_cast<int>(m_v.size()))
  {
    TRACE(n);
    TRACE(m_v.size());
  }
  #endif

  assert(n <= boost::numeric_cast<int>(m_v.size()));
  return std::accumulate(
    m_v.end() - n, m_v.end(),
    0.0,
    [](double& sum, const boost::shared_ptr<Payoff> p)
    {
      return sum + p->m_payoff;
    }
  );
}

double ribi::gtst::Payoffs::GetTotal() const
{
  return std::accumulate(
    m_v.begin(),m_v.end(),0.0,
    [](double& sum,const boost::shared_ptr<Payoff>& payoff)
    {
      return sum + payoff->m_payoff;
    }
  );
}

