Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5948210E041
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Dec 2023 13:35:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t 2/4] tests/intel/kms_frontbuffer_tracking: Drop unused macros
Date: Wed, 27 Dec 2023 19:00:18 +0530
Message-Id: <20231227133020.685916-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20231227133020.685916-1-bhanuprakash.modem@intel.com>
References: <20231227133020.685916-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
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

Cleanup only, no functional change: Drop all unused macros
from the code.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e10803b62..5324a0bef 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1877,8 +1877,6 @@ static void __debugfs_read_crtc(const char *param, char *buf, int len)
 }
 
 #define debugfs_read_crtc(p, arr) __debugfs_read_crtc(p, arr, sizeof(arr))
-#define debugfs_write_crtc(p, arr) __debugfs_write_crtc(p, arr, sizeof(arr))
-#define debugfs_read_connector(p, arr) __debugfs_read_connector(p, arr, sizeof(arr))
 
 static bool is_drrs_high(void)
 {
-- 
2.40.0
