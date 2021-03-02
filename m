Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DD889E7C
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 12:39:13 +0000 (UTC)
Date: Tue, 2 Mar 2021 14:39:35 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YD4yB/x4tv3Du7vG@platvala-desk.ger.corp.intel.com>
References: <20210225083553.7540-1-petri.latvala@intel.com>
 <161468568208.13469.12406365697364305928@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161468568208.13469.12406365697364305928@build.alporthouse.com>
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

On Tue, Mar 02, 2021 at 11:48:02AM +0000, Chris Wilson wrote:
> Quoting Petri Latvala (2021-02-25 08:35:53)
> > Instead of producing skips for the rest when one selftest taints the
> > kernel, stop running them altogether. Having the skips produced yields
> > no value and just makes future improvements (like correctly tagging
> > tests that cause taints) harder. In effect, this gets us back to the
> > old setup when tainting made igt_runner immediately kill the test and
> > similarly made us not get spurious results for the rest of the
> > selftests.
> 
> Skip isn't spurious here. I don't see how this impacts tagging the
> earlier tests. So the only question for me is whether SKIP or NOTRUN is
> more applicable. And skip is far more informative when run by hand...

When run by hand on an already tainted kernel, the first (specified)
selftest still gets a skip and others don't get executed.

The immediate value I'll be getting from this is my ongoing work on
the ugly igt@runner@aborted pseudoresult to instead mark the last
executed test as 'ABORT' result when igt_runner decides to abort the
execution (due to a taint). If we have skips, I'd need to do some
selftest-specific handling to not mark the last executed dynamic
subtest, but the last non-skipping dynamic subtest.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
