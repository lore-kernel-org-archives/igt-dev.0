Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010386EAB6
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2020 13:45:17 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri,  7 Feb 2020 19:15:26 +0530
Message-Id: <20200207134527.17205-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/2] tests/intel_dp_compliance: use
 device coherent mapping instead of mmap_gtt
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
To: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As tiling is not used we use the device coherent mapping instead of
mmap_gtt.

v2:
  instead of skipping device coherent mapping is used. [Ashutosh]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 tools/intel_dp_compliance.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 5cc3d37a71d6..2d42cb1a7b6f 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -451,9 +451,9 @@ static int setup_framebuffers(struct connector *dp_conn)
 	igt_assert(dp_conn->fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->pixmap = gem_mmap__gtt(drm_fd,
+	dp_conn->pixmap = gem_mmap__device_coherent(drm_fd,
 					dp_conn->fb_video_pattern.gem_handle,
-					dp_conn->fb_video_pattern.size,
+					0, dp_conn->fb_video_pattern.size,
 					PROT_READ | PROT_WRITE);
 	if (dp_conn->pixmap == NULL)
 		return -1;
@@ -481,9 +481,9 @@ static int setup_failsafe_framebuffer(struct connector *dp_conn)
 	igt_assert(dp_conn->failsafe_fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->failsafe_pixmap = gem_mmap__gtt(drm_fd,
+	dp_conn->failsafe_pixmap = gem_mmap__device_coherent(drm_fd,
 						 dp_conn->fb_failsafe_pattern.gem_handle,
-						 dp_conn->fb_failsafe_pattern.size,
+						 0, dp_conn->fb_failsafe_pattern.size,
 						 PROT_READ | PROT_WRITE);
 	if (dp_conn->failsafe_pixmap == NULL)
 		return -1;
@@ -518,9 +518,9 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
 	igt_assert(dp_conn->test_pattern.fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->test_pattern.pixmap = gem_mmap__gtt(drm_fd,
+	dp_conn->test_pattern.pixmap = gem_mmap__device_coherent(drm_fd,
 						     dp_conn->test_pattern.fb_pattern.gem_handle,
-						     dp_conn->test_pattern.fb_pattern.size,
+						     0, dp_conn->test_pattern.fb_pattern.size,
 						     PROT_READ | PROT_WRITE);
 	if (dp_conn->test_pattern.pixmap == NULL)
 		return -1;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
