Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1B410E1D9
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 11:52:47 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Apr 2023 17:17:12 +0530
Message-Id: <20230426114725.2244653-33-bhanuprakash.modem@intel.com>
In-Reply-To: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
References: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 32/45] tests/kms_cursor_crc: Add XE support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_cursor_crc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index cc9dfcb1d..3a353a032 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -143,7 +143,7 @@ static bool chv_cursor_broken(data_t *data, int x)
 {
 	uint32_t devid;
 
-	if (!is_i915_device(data->drm_fd))
+	if (!is_intel_device(data->drm_fd))
 		return false;
 
 	devid = intel_get_drm_devid(data->drm_fd);
@@ -152,7 +152,7 @@ static bool chv_cursor_broken(data_t *data, int x)
 	 * CHV gets a FIFO underrun on pipe C when cursor x coordinate
 	 * is negative and the cursor visible.
 	 *
-	 * i915 is fixed to return -EINVAL on cursor updates with those
+	 * intel is fixed to return -EINVAL on cursor updates with those
 	 * negative coordinates, so require cursor update to fail with
 	 * -EINVAL in that case.
 	 *
-- 
2.40.0
