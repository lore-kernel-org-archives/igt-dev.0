Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 24 Aug 2020 12:26:50 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200824092650.GG7444@platvala-desk.ger.corp.intel.com>
References: <20200821153807.18613-1-janusz.krzysztofik@linux.intel.com>
 <159803163552.16198.17489156056346233245@emeril.freedesktop.org>
 <3a286dc2f27ed0961b0e0246f8102f21a93b42c6.camel@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a286dc2f27ed0961b0e0246f8102f21a93b42c6.camel@linux.intel.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Fixes_and_enhancements_=28rev4=29?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 10:42:10AM +0200, Janusz Krzysztofik wrote:
> On Fri, 2020-08-21 at 17:40 +0000, Patchwork wrote:
> > Patch Details
> > Series:	tests/core_hotunplug: Fixes and enhancements (rev4)
> > URL:	https://patchwork.freedesktop.org/series/79671/
> > State:	failure
> > Details:	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/index.html
> > CI Bug Log - changes from CI_DRM_8913_full -> IGTPW_4901_full
> > Summary
> > FAILURE
> > 
> > Serious unknown changes coming with IGTPW_4901_full absolutely need to be
> > verified manually.
> > 
> > If you think the reported changes have nothing to do with the changes
> > introduced in IGTPW_4901_full, please notify your bug team to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> > 
> > External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/index.html
> > 
> > Possible new issues
> > Here are the unknown changes that may have been introduced in IGTPW_4901_full:
> > 
> > IGT changes
> > Possible regressions
> > {igt@core_hotunplug@hotrebind-lateclose} (NEW):
> > 
> > shard-snb: NOTRUN -> FAIL
> > 
> > shard-glk: NOTRUN -> FAIL
> > 
> > shard-kbl: NOTRUN -> FAIL
> 
> This is an existing but formerly not reported GPU hang driver issue
> exhibited by the test, not a regression.  The issue needs to be fixed
> in the driver for the test to succeed.  As one can see from CI reports,
> the test succesfuly recovers from that condition and subsequent tests
> are not affected.
>   
> > 
> > {igt@core_hotunplug@hotunbind-lateclose} (NEW):
> > 
> > shard-hsw: NOTRUN -> INCOMPLETE +3 similar issues
> 
> This is a known driver issue, already reported by igt@device
> _reset@unbind-reset-rebind.  This test shows clearly that the issue has
> nothing to do with device reset, only with driver unbind-rebind cycle. 
> The driver needs to be fixed for the kernel warning not be triggered
> and the tests succeed.

Is there an ETA for the driver fix?

> 
> I think the *bind* subtests in their current shape are perfectly ready
> for inclusion in CI runs.

Agreed otherwise, except for the known incomplete. Introducing new
incompletes without a fix in sight is real bad.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
