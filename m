Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22882892EF
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2020 13:53:08 +0000 (UTC)
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Date: Wed, 22 Jul 2020 19:17:58 +0530
Message-Id: <20200722134758.26412-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_big_fb: Use igt_assert on
 bufmgr
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
To: igt-dev@lists.freedesktop.org, petri.latvala@intel.com, pankaj.laxminarayan.bharadiya@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

NULL bufmgr pointer leads to SIGSEGV. Assert on NULL bufmgr so that
correct failure reason will get dumped in the stack trace.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
* changes since v1:
 - Make the error message more helpful [Petri]

 tests/kms_big_fb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index a754b2997..48caa5cd1 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -607,6 +607,7 @@ igt_main
 {
 	igt_fixture {
 		drmModeResPtr res;
+		const struct intel_device_info *info;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 
@@ -649,6 +650,10 @@ igt_main
 			data.render_copy = igt_get_render_copyfunc(data.devid);
 
 		data.bufmgr = drm_intel_bufmgr_gem_init(data.drm_fd, 4096);
+		info = intel_get_device_info(data.devid);
+		igt_assert_f(data.bufmgr, "Update libdrm for %s support\n",
+			     info->gen ? info->codename : "<unknown chipset>");
+
 		data.batch = intel_batchbuffer_alloc(data.bufmgr, data.devid);
 	}
 
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
