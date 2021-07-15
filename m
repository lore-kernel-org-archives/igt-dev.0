Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744796E575
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jul 2021 07:13:49 +0000 (UTC)
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Thu, 15 Jul 2021 07:13:39 +0000
Message-ID: <BN0PR11MB57432ABF6CCAA09A1F24BE02AF129@BN0PR11MB5743.namprd11.prod.outlook.com>
References: <20210715064731.4484-1-anshuman.gupta@intel.com>
In-Reply-To: <20210715064731.4484-1-anshuman.gupta@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_pm_dc: Fix platform version
 check
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
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Anshuman Gupta
Sent: Thursday, July 15, 2021 12:18 PM
To: igt-dev@lists.freedesktop.org
Subject: [igt-dev] [PATCH i-g-t] tests/i915_pm_dc: Fix platform version check

setup_dc_dpms() disables i915 runtime suspend to execute dc{5,6}-dpms for the platforms has DC9 states to avoid counter reset issue. With recent changes now AT_LEAST_GEN() macro checks for grphics_ver, fix it with display_ver.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c index 0301fecc..3fe40e9d 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -337,7 +337,7 @@ static void cleanup_dc_dpms(data_t *data)  static void setup_dc_dpms(data_t *data)  {
 	if (IS_BROXTON(data->devid) || IS_GEMINILAKE(data->devid) ||
-	    AT_LEAST_GEN(data->devid, 11)) {
+	    intel_display_ver(data->devid) >= 11) {
 		igt_disable_runtime_pm();
 		data->runtime_suspend_disabled = true;
 	} else {
--
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
