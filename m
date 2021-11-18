Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60CB6E9F7
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Nov 2021 08:31:50 +0000 (UTC)
Date: Thu, 18 Nov 2021 10:30:46 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YZYPNjRGTdoNfyl3@platvala-desk.ger.corp.intel.com>
References: <20211117104229.18663-1-petri.latvala@intel.com>
 <87mtm2wx3l.wl-ashutosh.dixit@intel.com>
 <87h7cawmgj.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7cawmgj.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] igt_core: Fix docs for SLOW_QUICK
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 12:34:20PM -0800, Dixit, Ashutosh wrote:
> On Wed, 17 Nov 2021 08:44:30 -0800, Dixit, Ashutosh wrote:
> >
> > On Wed, 17 Nov 2021 02:42:29 -0800, Petri Latvala wrote:
> > >
> > > The macro is for choosing between two values depending on whether IGT
> > > has been told it's running in simulation mode. The parameter names and
> > > their documentation was the opposite of what actually happened.
> > >
> > > The only user, gem_lut_handle, uses the macro correctly, having the
> > > "use this value in simulation mode" value as the second parameter.
> > >
> > > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> > > Cc: Arkadiusz Hiler <arek@hiler.eu>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > ---
> > >  lib/igt_core.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/lib/igt_core.h b/lib/igt_core.h
> > > index 6b8dbf34..077e1bf3 100644
> > > --- a/lib/igt_core.h
> > > +++ b/lib/igt_core.h
> > > @@ -1170,7 +1170,7 @@ bool igt_run_in_simulation(void);
> > >   * Simple macro to select between two values (e.g. number of test rounds or test
> > >   * buffer size) depending upon whether i-g-t is run in simulation mode or not.
> > >   */
> > > -#define SLOW_QUICK(slow,quick) (igt_run_in_simulation() ? (quick) : (slow))
> > > +#define SLOW_QUICK(quick,slow) (igt_run_in_simulation() ? (slow) : (quick))
> >
> > Previous code assumes slow/quick refer to number of iterations whereas this
> > patch assumes slow/quick refer to similation speed, correct? It seems to be
> > 12 of one, dozen of the other to me. How about:
> >
> > #define SLOW_QUICK(x, y) (igt_run_in_simulation() ? (y) : (x))
> >
> > :-)
> >
> > I prefer the previous interpretation where quick is assumed to be much
> > smaller than slow.
> 
> Well I guess the "simulation" value can be both less than or more than the
> hw value ("keep number of iterations in simulation low" or "increase
> timeout in simulation"). Another idea to make this clear:
> 
> #define SLOW_QUICK(hw, sim) (igt_run_in_simulation() ? (sim) : (hw))

Yeah, I like that one. That avoids the confusion of whether "slow"
means slow test or slow platform. v2 incoming.


-- 
Petri Latvala
