Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2F510E041
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Dec 2023 13:35:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t 1/4] lib/i915/intel_drrs: Fix igt helper to get drrs status
Date: Wed, 27 Dec 2023 19:00:17 +0530
Message-Id: <20231227133020.685916-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

intel_is_drrs_supported() helper is giving False if DRRS
supports on selected pipe which is not correct. Fix the
helper to give True if DRRS supports on selected pipe.

Fixes: c6f857e46 lib/i915/drrs: Add drrs helpers
Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/i915/intel_drrs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/i915/intel_drrs.c b/lib/i915/intel_drrs.c
index deaec90d3..25c15fc0f 100644
--- a/lib/i915/intel_drrs.c
+++ b/lib/i915/intel_drrs.c
@@ -32,7 +32,7 @@ bool intel_is_drrs_supported(int device, enum pipe pipe)
 	if (*buf == '\0')
 		return false;
 
-	return !strcasestr(buf, "DRRS enabled:");
+	return strcasestr(buf, "DRRS enabled:");
 }
 
 /**
-- 
2.40.0
