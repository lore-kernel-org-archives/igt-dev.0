Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA14A10E48A
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 08:09:33 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Aug 2023 11:08:27 +0300
Message-Id: <20230818080827.1889393-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915: Take into account fbc_status
 "stolen memory not initialised"
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

Earlier non initialized memory caused fbc_status debugfs interface not
being created at all. This was considered as "Unsupported chipset" by
certain igt testcases. Now fbc_status is informing "stolen memory not
initialised". Consider this again as "Unsupported chipset"

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9131
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_fbcon_fbt.c            | 3 ++-
 tests/i915/kms_frontbuffer_tracking.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_fbcon_fbt.c b/tests/i915/kms_fbcon_fbt.c
index e65cbda93..2cb0ffdb4 100644
--- a/tests/i915/kms_fbcon_fbt.c
+++ b/tests/i915/kms_fbcon_fbt.c
@@ -103,7 +103,8 @@ static bool fbc_supported_on_chipset(int device, int debugfs_fd)
 	if (ret < 0)
 		return false;
 
-	return !strstr(buf, "FBC unsupported on this chipset\n");
+	return !strstr(buf, "FBC unsupported on this chipset\n") &&
+		!strstr(buf, "stolen memory not initialised\n");
 }
 
 static bool connector_can_fbc(drmModeConnectorPtr connector)
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 3e8f15bb0..136426204 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -1444,7 +1444,8 @@ static bool fbc_supported_on_chipset(void)
 	if (*buf == '\0')
 		return false;
 
-	return !strstr(buf, "FBC unsupported on this chipset\n");
+	return !strstr(buf, "FBC unsupported on this chipset\n") &&
+		!strstr(buf, "stolen memory not initialised\n");
 }
 
 static void setup_fbc(void)
-- 
2.34.1
