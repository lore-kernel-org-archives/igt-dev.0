Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E756E9E9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 20:43:27 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <d0f50a44-de04-6a6a-1618-8503b9332e48@intel.com>
References: <20200210193908.1754-1-antonio.argenziano@intel.com>
 <158136652484.5235.15265352592478927262@skylake-alporthouse-com>
 <d0f50a44-de04-6a6a-1618-8503b9332e48@intel.com>
Message-ID: <158136739158.5235.2524948672415490151@skylake-alporthouse-com>
Date: Mon, 10 Feb 2020 20:43:11 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_balancer: Skip the
 test if no engines are available
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Antonio Argenziano (2020-02-10 20:41:25)
> 
> 
> On 10/02/20 12:28, Chris Wilson wrote:
> > Quoting Antonio Argenziano (2020-02-10 19:39:08)
> >> The test needs to have at least some engines to run, if no engines are
> >> present flag it as a skip rather than have a pass. This patch also fixes
> >> the error check for perf_i915_open().
> >>
> >> Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
> >>
> >> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> >> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> >> ---
> >>   tests/i915/gem_exec_balancer.c | 20 +++++++++++++++++++-
> >>   1 file changed, 19 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> >> index 150eba0d..df816feb 100644
> >> --- a/tests/i915/gem_exec_balancer.c
> >> +++ b/tests/i915/gem_exec_balancer.c
> >> @@ -61,7 +61,7 @@ static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
> >>          int fd;
> >>   
> >>          fd = perf_i915_open(i915, I915_PMU_ENGINE_BUSY(class, instance));
> >> -       if (fd != -1) {
> >> +       if (fd >= 0) {
> >>                  close(fd);
> >>                  return true;
> >>          }
> >> @@ -113,6 +113,23 @@ list_engines(int i915, uint32_t class_mask, unsigned int *out)
> >>          return engines;
> >>   }
> >>   
> >> +static bool has_engines(int i915)
> >> +{
> > 
> > igt_require(igt_i915_perf_type(i915)); /* or whatever it was called */ ?
> 
> Keep it in the fixture?

Preference would be something like

static bool has_perf_engines(int i915)
{
	return igt_i915_perf_type(i915));
}

igt_fixture:
	igt_require(has_perf_engines(i915));
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
