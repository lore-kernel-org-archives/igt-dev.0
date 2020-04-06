Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 6 Apr 2020 12:01:49 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200406090149.GK9497@platvala-desk.ger.corp.intel.com>
References: <20200406085309.1585743-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200406085309.1585743-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Add the missing
 igt_dynamic to dynamic rcs* test selection
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Apr 06, 2020 at 09:53:09AM +0100, Chris Wilson wrote:
> An important ingredient to using igt_subtest_with_dynamic is to include
> an igt_dynamic at some point.
> 
> Reported-by: Petri Latvala <petri.latvala@intel.com>
> Fixes: 311cb1b360b7 ("i915/perf_pmu: Dynamic active engine tests")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Petri Latvala <petri.latvala@intel.com>

Thanks,

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


If someone (tm) is feeling like there's not enough to do, perf_pmu
could use a refactoring with the dynamic subtests to do


igt_subtest_with_dynamic() {
  igt_require(system-wide things);

  igt_dynamic_f() { igt_require(engine-specific thing); }
}

so that skips happen for a whole subtest at a time for things like gen
checks.


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
