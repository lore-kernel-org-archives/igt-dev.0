Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3AB6E135
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 13:22:47 +0000 (UTC)
Date: Tue, 2 Mar 2021 15:23:08 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YD48PM60jGITDHni@platvala-desk.ger.corp.intel.com>
References: <20210225083553.7540-1-petri.latvala@intel.com>
 <161468568208.13469.12406365697364305928@build.alporthouse.com>
 <YD4yB/x4tv3Du7vG@platvala-desk.ger.corp.intel.com>
 <161469026970.16094.600012892357124517@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161469026970.16094.600012892357124517@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/kmod: Stop producing results at all
 for kernel selftests on taint
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

On Tue, Mar 02, 2021 at 01:04:29PM +0000, Chris Wilson wrote:
> Quoting Petri Latvala (2021-03-02 12:39:35)
> > On Tue, Mar 02, 2021 at 11:48:02AM +0000, Chris Wilson wrote:
> > > Quoting Petri Latvala (2021-02-25 08:35:53)
> > > > Instead of producing skips for the rest when one selftest taints the
> > > > kernel, stop running them altogether. Having the skips produced yields
> > > > no value and just makes future improvements (like correctly tagging
> > > > tests that cause taints) harder. In effect, this gets us back to the
> > > > old setup when tainting made igt_runner immediately kill the test and
> > > > similarly made us not get spurious results for the rest of the
> > > > selftests.
> > > 
> > > Skip isn't spurious here. I don't see how this impacts tagging the
> > > earlier tests. So the only question for me is whether SKIP or NOTRUN is
> > > more applicable. And skip is far more informative when run by hand...
> > 
> > When run by hand on an already tainted kernel, the first (specified)
> > selftest still gets a skip and others don't get executed.
> > 
> > The immediate value I'll be getting from this is my ongoing work on
> > the ugly igt@runner@aborted pseudoresult to instead mark the last
> > executed test as 'ABORT' result when igt_runner decides to abort the
> > execution (due to a taint). If we have skips, I'd need to do some
> > selftest-specific handling to not mark the last executed dynamic
> > subtest, but the last non-skipping dynamic subtest.
> 
> The problem does not seem to be intrinsic to igt_kselftests, as any
> dynamic subtest that triggers a taint will then proceed to run the next
> igt_dynamic which may pass, fail or skip. The runner may not have a
> chance to check for a taint until the end of the subtest. It sounds like
> a job for the igt_runner <-> igt channel.

Would also require checking for taint mid-execution...

Anyway best practices for dynamic subtests is to never skip, but
instead not exist at all. I suppose I could instead mark every single
dynamic subtest as abort when abort happens.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
