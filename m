Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC4910EF99
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 18:43:17 +0000 (UTC)
Date: Thu, 30 Mar 2023 11:43:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <ZCXYPRSrp34AHxSD@orsosgc001.jf.intel.com>
References: <20230330003656.1294873-1-umesh.nerlige.ramappa@intel.com>
 <20230330003656.1294873-8-umesh.nerlige.ramappa@intel.com>
 <b814b211-c882-7b46-7afe-506418bc5b0c@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <b814b211-c882-7b46-7afe-506418bc5b0c@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] tools/intel_gpu_top: Add support
 for gt specific counters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, badal.nilawar@intel.com,
 arjun.melkaveri@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 10:25:47AM +0100, Tvrtko Ursulin wrote:
>
>On 30/03/2023 01:36, Umesh Nerlige Ramappa wrote:
>>With MTL frequency and rc6 counters are gt specific. Add support for
>>intel_gpu_top to show these counters separately.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>  include/drm-uapi/i915_drm.h | 14 ++++++----
>>  tools/intel_gpu_top.c       | 56 ++++++++++++++++++++++++++-----------
>>  2 files changed, 49 insertions(+), 21 deletions(-)
>>
>>diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
>>index 3b5e3b51..1a0c43e7 100644
>>--- a/include/drm-uapi/i915_drm.h
>>+++ b/include/drm-uapi/i915_drm.h
>>@@ -290,6 +290,7 @@ enum drm_i915_pmu_engine_sample {
>>  	(((__u64)__I915_PMU_ENGINE(0xff, 0xff, 0xf) + 1 + (x)) | \
>>  	((__u64)(gt) << __I915_PMU_GT_SHIFT))
>>+/* Aggregate from all gts */
>>  #define __I915_PMU_OTHER(x) ___I915_PMU_OTHER(0, x)
>>  #define I915_PMU_ACTUAL_FREQUENCY	__I915_PMU_OTHER(0)
>>@@ -300,11 +301,14 @@ enum drm_i915_pmu_engine_sample {
>>  #define I915_PMU_LAST /* Deprecated - do not use */ I915_PMU_RC6_RESIDENCY
>>-#define __I915_PMU_ACTUAL_FREQUENCY(gt)		___I915_PMU_OTHER(gt, 0)
>>-#define __I915_PMU_REQUESTED_FREQUENCY(gt)	___I915_PMU_OTHER(gt, 1)
>>-#define __I915_PMU_INTERRUPTS(gt)		___I915_PMU_OTHER(gt, 2)
>>-#define __I915_PMU_RC6_RESIDENCY(gt)		___I915_PMU_OTHER(gt, 3)
>>-#define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)	___I915_PMU_OTHER(gt, 4)
>>+/* GT specific counters */
>>+#define ____I915_PMU_OTHER(gt, x) ___I915_PMU_OTHER(((gt) + 1), x)
>>+
>>+#define __I915_PMU_ACTUAL_FREQUENCY(gt)		____I915_PMU_OTHER(gt, 0)
>>+#define __I915_PMU_REQUESTED_FREQUENCY(gt)	____I915_PMU_OTHER(gt, 1)
>>+#define __I915_PMU_INTERRUPTS(gt)		____I915_PMU_OTHER(gt, 2)
>>+#define __I915_PMU_RC6_RESIDENCY(gt)		____I915_PMU_OTHER(gt, 3)
>>+#define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)	____I915_PMU_OTHER(gt, 4)
>>  /* Each region is a minimum of 16k, and there are at most 255 of them.
>>   */
>>diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>>index a4302aa3..9fc8b996 100644
>>--- a/tools/intel_gpu_top.c
>>+++ b/tools/intel_gpu_top.c
>>@@ -87,6 +87,7 @@ struct engine_class {
>>  	unsigned int num_engines;
>>  };
>>+#define MAX_GTS 4
>>  struct engines {
>>  	unsigned int num_engines;
>>  	unsigned int num_classes;
>>@@ -105,14 +106,16 @@ struct engines {
>>  	struct pmu_counter imc_writes;
>>  	unsigned int num_imc;
>>-	struct pmu_counter freq_req;
>>-	struct pmu_counter freq_act;
>>+	struct pmu_counter freq_req[MAX_GTS];
>>+	struct pmu_counter freq_act[MAX_GTS];
>>  	struct pmu_counter irq;
>>-	struct pmu_counter rc6;
>>+	struct pmu_counter rc6[MAX_GTS];
>>  	bool discrete;
>>  	char *device;
>>+	int num_gts;
>>+
>>  	/* Do not edit below this line.
>>  	 * This structure is reallocated every time a new engine is
>>  	 * found and size is increased by sizeof (engine).
>>@@ -532,7 +535,7 @@ static void imc_reads_open(struct pmu_counter *pmu, struct engines *engines)
>>  static int pmu_init(struct engines *engines)
>>  {
>>  	unsigned int i;
>>-	int fd;
>>+	int fd, ret;
>>  	uint64_t type = igt_perf_type_id(engines->device);
>>  	engines->fd = -1;
>>@@ -543,14 +546,30 @@ static int pmu_init(struct engines *engines)
>>  	if (fd < 0)
>>  		return -1;
>>-	engines->freq_req.config = I915_PMU_REQUESTED_FREQUENCY;
>>-	_open_pmu(type, engines->num_counters, &engines->freq_req, engines->fd);
>>+	engines->num_gts = 1;
>>+	for (i = 0; i < MAX_GTS; i++) {
>>+		engines->freq_req[i].config = __I915_PMU_REQUESTED_FREQUENCY(i);
>>-	engines->freq_act.config = I915_PMU_ACTUAL_FREQUENCY;
>>-	_open_pmu(type, engines->num_counters, &engines->freq_act, engines->fd);
>>+		errno = 0;
>>+		ret = _open_pmu(type, engines->num_counters, &engines->freq_req[i], engines->fd);
>>+		if (ret >= 0)
>>+			continue;
>>-	engines->rc6.config = I915_PMU_RC6_RESIDENCY;
>>-	_open_pmu(type, engines->num_counters, &engines->rc6, engines->fd);
>>+		if (errno != ENOENT)
>>+			return ret;
>>+
>>+		engines->num_gts = i;
>>+		errno = 0;
>>+		break;
>>+	}
>>+
>>+	for (i = 0; i < engines->num_gts; i++) {
>>+		engines->freq_act[i].config = __I915_PMU_ACTUAL_FREQUENCY(i);
>>+		_open_pmu(type, engines->num_counters, &engines->freq_act[i], engines->fd);
>>+
>>+		engines->rc6[i].config = __I915_PMU_RC6_RESIDENCY(i);
>>+		_open_pmu(type, engines->num_counters, &engines->rc6[i], engines->fd);
>>+	}
>>  	for (i = 0; i < engines->num_engines; i++) {
>>  		struct engine *engine = engine_ptr(engines, i);
>>@@ -653,10 +672,12 @@ static void pmu_sample(struct engines *engines)
>>  	engines->ts.prev = engines->ts.cur;
>>  	engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
>>-	update_sample(&engines->freq_req, val);
>>-	update_sample(&engines->freq_act, val);
>>+	for (i = 0; i < engines->num_gts; i++) {
>>+		update_sample(&engines->freq_req[i], val);
>>+		update_sample(&engines->freq_act[i], val);
>>+		update_sample(&engines->rc6[i], val);
>>+	}
>>  	update_sample(&engines->irq, val);
>>-	update_sample(&engines->rc6, val);
>>  	for (i = 0; i < engines->num_engines; i++) {
>>  		struct engine *engine = engine_ptr(engines, i);
>>@@ -1727,8 +1748,10 @@ print_header(const struct igt_device_card *card,
>>  		.items = period_items,
>>  	};
>>  	struct cnt_item freq_items[] = {
>>-		{ &engines->freq_req, 4, 0, 1.0, t, 1, "requested", "req" },
>>-		{ &engines->freq_act, 4, 0, 1.0, t, 1, "actual", "act" },
>>+		{ &engines->freq_req[0], 8, 0, 1.0, t, 1, "requested-gt0", "req-gt0" },
>>+		{ &engines->freq_act[0], 8, 0, 1.0, t, 1, "actual-gt0", "act-gt0" },
>>+		{ &engines->freq_req[1], 8, 0, 1.0, t, 1, "requested-gt1", "req-gt1" },
>>+		{ &engines->freq_act[1], 8, 0, 1.0, t, 1, "actual-gt1", "act-gt1" },
>
>Why is width going to 8? 9999 MHz is not enough? ;)
>
>[Comes back later..]
>
>Ah for the header label.. hm.. maybe we should try putting the GT information into the parent. It would looks nicer, be more logical, even for JSON output we now have:
>
>Terminal:
>
> Freq MHz      ...
> req  act      ...
>
>JSON:
>
>        "rc6": {
>                "value": 29.309568,
>                "unit": "%"
>        },
>You propose something like:
>
> Freq MHz      		Freq MHz		...
> req-gt0  act-gt0	req-gt0  act-gt0	...
>
>        "rc6": {
>                "value-gt0": 29.309568,
>                "value-gt1": 29.309568,
>                "unit": "%"
>        },
>
>Which is not very nice UI wise. How about something like:
>
> Freq GT0 MHz   Freq GT1 MHz	...
> req  act	req  act	...

I can try to do that^

>
>JSON should potentially be an array:
>
>        "rc6": [{
>		"gt": 0,
>                "value": 29.309568,
>                "unit": "%"
>        },
>		"gt": 0,
>                "value": 29.309568,
>                "unit": "%"
>        }],
>
>Or at least:
>
>        "rc6": {
>                "value": 29.309568,
>                "unit": "%"
>        },
>        "rc6-gt1": {
>                "value": 29.309568,
>                "unit": "%"
>        },
>
>Which also brings the point if maybe we shouldn't change the output for pre-MTL platforms. The approach is not IMHO even consistent with the proposed kernel change to have the aggregated counters, which I don't think I agree with at all.

I thought the gt0 is the default way to go even for older platforms, so 
showing that. Old intel_gpu_top binaries should still work with new 
kernel since the intent is to still support the legacy events.

Maybe we have a switch that will show individual gt values only if users 
demands to see it. If not, the UI is as before.

Thanks,
Umesh

>
>Let me mull it all over.

>
>Regards,
>
>Tvrtko
>
>>  		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "MHz" },
>>  		{ },
>>  	};
>>@@ -1748,7 +1771,8 @@ print_header(const struct igt_device_card *card,
>>  		.items = irq_items,
>>  	};
>>  	struct cnt_item rc6_items[] = {
>>-		{ &engines->rc6, 3, 0, 1e9, t, 100, "value", "%" },
>>+		{ &engines->rc6[0], 6, 0, 1e9, t, 100, "value-gt0", "%-gt0" },
>>+		{ &engines->rc6[1], 6, 0, 1e9, t, 100, "value-gt1", "%-gt1" },
>>  		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "%" },
>>  		{ },
>>  	};
