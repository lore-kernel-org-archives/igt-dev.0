Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175D310E03F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 11:47:54 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Sep 2022 17:19:07 +0530
Message-Id: <20220909114911.1852-2-swati2.sharma@intel.com>
In-Reply-To: <20220909114911.1852-1-swati2.sharma@intel.com>
References: <20220909114911.1852-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] tests/i915/i915_pm_dc: Add test
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/i915_pm_dc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index f664a2a2c..40811ae52 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -44,6 +44,8 @@
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
 #define KMS_POLL_DISABLE 0
 
+IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
+
 bool kms_poll_saved_state;
 
 typedef struct {
@@ -473,7 +475,6 @@ static void kms_poll_state_restore(int sig)
 	}
 }
 
-IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
 int main(int argc, char *argv[])
 {
 	data_t data = {};
-- 
2.25.1
