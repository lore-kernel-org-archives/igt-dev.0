Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E786EB61
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2020 12:07:54 +0000 (UTC)
Date: Fri, 3 Jul 2020 17:35:35 +0530
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Message-ID: <20200703120535.GA25159@arjun-NUC8i7BEH>
References: <20200703103352.24738-1-arjun.melkaveri@intel.com>
 <159377428922.22925.6510919255626776240@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159377428922.22925.6510919255626776240@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t]lib/sw_sync:Fixing modprobe for
 sw_sync to return if not supported
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 03, 2020 at 12:04:49PM +0100, Chris Wilson wrote:
> Quoting Arjun Melkaveri (2020-07-03 11:33:52)
> > Few tests that use "igt_require_sw_sync" , would not skip or assert the
> > test if it fails to load sw_sync module.
> > 
> > Mentioned error is seen and test continues executing .
> > "igt_kmod-DEBUG: Unknown symbol in module sw_sync or unknown parameter"
> > 
> > igt_require for modprobe in this file would skip the test if it fails
> > to load the module.
> 
> Which then fails when it is builtin.
> 
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> > ---
> >  lib/sw_sync.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/lib/sw_sync.c b/lib/sw_sync.c
> > index e860a2c1..ed8375ca 100644
> > --- a/lib/sw_sync.c
> > +++ b/lib/sw_sync.c
> > @@ -228,16 +228,17 @@ int sync_fence_status(int fence)
> >         return info.status;
> >  }
> >  
> > -static void modprobe(const char *driver)
> > +static int modprobe(const char *driver)
> >  {
> > -       igt_kmod_load(driver, NULL);
> > +       return igt_kmod_load(driver, NULL);
> >  }
> >  
> >  static bool kernel_has_sw_sync(void)
> >  {
> >         char buf[128];
> >  
> > -       modprobe("sw_sync");
> > +       /* Make sure our Kernel supports sw_sync and the module is loaded. */
> > +       igt_require(modprobe("sw_sync") == 0);
> >  
> >         return kernel_sw_sync_path(buf, sizeof(buf));
> 
> It's the return from this function that needs to be checked, and indeed
> is: igt_require_sw_sync().
> -Chris
Test is able to find the path, but throws "Unknown symbol in module
sw_sync or unknown parameter" error from modprobe-> igt_kmod_load .
execision continues as Return value from igt_kmod_load is not been checked .
I put that check only to make sure that modprob is success . 

-Arjun 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
