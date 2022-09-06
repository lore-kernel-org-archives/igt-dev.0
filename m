Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCE610E0E8
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 18:33:44 +0000 (UTC)
Date: Tue, 6 Sep 2022 11:33:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <YxeSgtBTpA8ywENo@unerlige-ril>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
 <20220823203059.7716-1-umesh.nerlige.ramappa@intel.com>
 <dd2b7501-0106-66c2-b91f-62749d457505@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <dd2b7501-0106-66c2-b91f-62749d457505@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 18/23] i915/perf: Fix DG2 A0 report
 header
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 05:23:54PM +0300, Lionel Landwerlin wrote:
>On 23/08/2022 23:30, Umesh Nerlige Ramappa wrote:
>>Timestamp is still 32 bits in DG2 A0. Fix that. Specify variants of DG2
>>that have the OA format header bug
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>
>Are A0 chipsets available outside of Intel?

No. I plan to remove A0 specific WAs in the follow up revisions.

Thanks,
Umesh
>
>Maybe it's not worth bothering with this workaround?
>
>
>Either way :
>
>
>Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>
>
>>---
>>  tests/i915/perf.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 44 insertions(+), 1 deletion(-)
>>
>>diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>>index 52de5d38..6951735b 100644
>>--- a/tests/i915/perf.c
>>+++ b/tests/i915/perf.c
>>@@ -40,6 +40,7 @@
>>  #include "i915/gem.h"
>>  #include "i915/perf.h"
>>+#include "i915_pciids.h"
>>  #include "igt.h"
>>  #include "igt_perf.h"
>>  #include "igt_sysfs.h"
>>@@ -503,6 +504,47 @@ cs_timestamp_frequency(int fd)
>>  	return value;
>>  }
>>+/*
>>+ * Hacky ways until IGT is fully aware of steppings:
>>+ *
>>+ * WA is permanent for G11. For other DG2s, bug is fixed from B0 onwards.
>>+ * Steps A0 and A1 correspond to 0 and 1 revid values.
>>+ */
>>+struct perf_dev_info {
>>+	bool is_dg2_g11;
>>+};
>>+
>>+static const struct perf_dev_info dg2_g11_info = {
>>+	.is_dg2_g11 = true,
>>+};
>>+
>>+static const struct pci_id_match perf_dev_match[] = {
>>+	INTEL_DG2_G11_IDS(&dg2_g11_info),
>>+};
>>+
>>+static const struct perf_dev_info *__dev_info(uint32_t device_id)
>>+{
>>+	static const struct perf_dev_info *cache;
>>+	static int _iter;
>>+
>>+	if (_iter)
>>+		goto out;
>>+
>>+	for (_iter = 0; _iter < ARRAY_SIZE(perf_dev_match); _iter++)
>>+		if (device_id == perf_dev_match[_iter].device_id)
>>+			cache = (void *) perf_dev_match[_iter].match_data;
>>+
>>+out:
>>+	return cache;
>>+}
>>+
>>+#define IS_DG2_G11(__d) (__dev_info(__d) ? __dev_info(__d)->is_dg2_g11 : false)
>>+#define IS_DG2_A0(__d) (IS_DG2(__d) && (intel_perf->devinfo.revision == 0))
>>+#define IS_DG2_A1(__d) (IS_DG2(__d) && (intel_perf->devinfo.revision == 1))
>>+
>>+#define HAS_OA_FORMAT_64BIT_HDR_BUG(__d) \
>>+	(IS_DG2_G11(__d) || IS_DG2_A0(__d) || IS_DG2_A1(__d))
>>+
>>  static uint64_t
>>  cs_timebase_scale(uint32_t u32_delta)
>>  {
>>@@ -514,7 +556,8 @@ oa_timestamp(const uint32_t *report, enum drm_i915_oa_format format)
>>  {
>>  	struct oa_format fmt = get_oa_format(format);
>>-	return fmt.report_hdr_64bit ? *(uint64_t *)&report[2] : report[1];
>>+	return fmt.report_hdr_64bit && !HAS_OA_FORMAT_64BIT_HDR_BUG(devid) ?
>>+		*(uint64_t *)&report[2] : report[1];
>>  }
>>  static uint64_t
>
>
