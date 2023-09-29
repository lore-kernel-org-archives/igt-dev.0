Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 29 Sep 2023 08:40:10 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <ZRbv2jgIi1xN298e@unerlige-ril>
References: <20230929110949.342325-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929110949.342325-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tools/intel_gpu_top: Restore user
 friendly error message
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 29, 2023 at 12:09:49PM +0100, Tvrtko Ursulin wrote:
>From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
>We have a nice error message displayed when an user with insufficient
>permissions tries to run the tool, but that got lost while Meteorlake
>support was added. Bring it back in.
>
>v2:
> * Propagate unexpected errno on multi-tile systems too. (Umesh)
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> tools/intel_gpu_top.c | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
>
>diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>index 87e9681e53b4..10601e66b18e 100644
>--- a/tools/intel_gpu_top.c
>+++ b/tools/intel_gpu_top.c
>@@ -554,9 +554,9 @@ static int get_num_gts(uint64_t type)
>
> 		close(fd);
> 	}
>-	assert(!errno || errno == ENOENT);
>-	assert(cnt > 0);
>-	errno = 0;
>+
>+	if (!cnt || (errno && errno != ENOENT))
>+		cnt = -errno;

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>
> 	return cnt;
> }
>@@ -590,6 +590,8 @@ static int pmu_init(struct engines *engines)
> 	engines->fd = -1;
> 	engines->num_counters = 0;
> 	engines->num_gts = get_num_gts(type);
>+	if (engines->num_gts <= 0)
>+		return -1;
>
> 	engines->irq.config = I915_PMU_INTERRUPTS;
> 	fd = _open_pmu(type, engines->num_counters, &engines->irq, engines->fd);
>-- 
>2.39.2
>
