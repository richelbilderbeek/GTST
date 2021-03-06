//---------------------------------------------------------------------------
/*
GTST, Game Theory Server
Copyright (C) 2011-2015 Richel Bilderbeek

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
*/
//---------------------------------------------------------------------------
//From http://www.richelbilderbeek.nl/ProjectGtst.htm
//---------------------------------------------------------------------------
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Weffc++"
#pragma GCC diagnostic ignored "-Wunused-but-set-parameter"
#pragma GCC diagnostic ignored "-Wunused-local-typedefs"
#include <boost/numeric/conversion/bounds.hpp>

#include "gtstgroupfinished.h"
#pragma GCC diagnostic pop

ribi::gtst::GroupFinished::GroupFinished(Server * const server)
  : Group(server)
{

}

void ribi::gtst::GroupFinished::AddFinishedParticipant(boost::shared_ptr<Participant> participant)
{
  this->AddParticipant(participant);
  boost::shared_ptr<State> state(new StateFinished);
  participant->SetState(state.get());
}

///GroupFinished its ID is the highest maximum int
int ribi::gtst::GroupFinished::GetId() const
{
  return boost::numeric::bounds<int>::highest();
}

