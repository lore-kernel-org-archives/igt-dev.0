Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538B710E40B
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Feb 2022 18:39:10 +0000 (UTC)
From: James Xiong <james.xiong@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Feb 2022 10:26:08 -0800
Message-Id: <20220223182608.14203-1-james.xiong@intel.com>
Subject: [igt-dev] [PATCH 1/1] tests/i915/kms_frontbuffer_tracking: ignore
 case when checking DRRS support
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

commit caab25dc9e36 ("drm/i915/display: Fix DRRS debugfs")
switched to macro yesno and changed i915_drrs_status from
"DRRS Supported: Yes" to "yes". ignore case when checking if
drrs is supported to avoid false result.

Signed-off-by: James Xiong <james.xiong@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 532bfbb9..329375b0 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -795,7 +795,7 @@ static bool is_drrs_supported(void)
 	char buf[MAX_DRRS_STATUS_BUF_LEN];
 
 	debugfs_read("i915_drrs_status", buf);
-	return strstr(buf, "DRRS Supported: Yes");
+	return strcasestr(buf, "DRRS Supported: Yes");
 }
 
 static bool is_drrs_inactive(void)
-- 
2.17.1
