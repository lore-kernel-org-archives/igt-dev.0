Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9D610E555
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 14:05:23 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Aug 2023 19:35:18 +0530
Message-Id: <20230824140519.1171540-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/xe/xe_module_load: load
 snd_hda_intel module
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

snd_hda_intel kernel module is required to validate HD-audio.
Load this module along with other modules.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/xe/xe_module_load.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/xe/xe_module_load.c b/tests/xe/xe_module_load.c
index 575d57268..75ee948a7 100644
--- a/tests/xe/xe_module_load.c
+++ b/tests/xe/xe_module_load.c
@@ -93,6 +93,7 @@ static void load_and_check_xe(const char *opts)
 static const char * const unwanted_drivers[] = {
 	"xe",
 	"i915",
+	"snd_hda_intel",
 	NULL
 };
 
-- 
2.25.1
