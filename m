Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48526ECE0
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Sep 2021 06:44:32 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Thu, 23 Sep 2021 12:15:26 +0530
Message-Id: <20210923064526.18615-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/core_hotunplug: Drop log level for
 preventively unloading snd driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, Jeevan B <jeevan.b@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

change igt_warn to igt_info when unloading the snd module before
unbinding i915 until WA is fixed. As this "todo reminder" is
flagged as BAT failure and showing up in all sorts of top-bugs
lists for various platforms.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/core_hotunplug.c | 2 +-
 tests/device_reset.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 2d73e27f..b3661668 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -164,7 +164,7 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix,
 			igt_lsof("/dev/snd");
 			igt_skip("Audio is in use, skipping\n");
 		} else {
-			igt_warn("Preventively unloaded snd_hda_intel\n");
+			igt_info("Preventively unloaded snd_hda_intel\n");
 		}
 	}
 
diff --git a/tests/device_reset.c b/tests/device_reset.c
index e6a468e6..982ba5ef 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -201,7 +201,7 @@ static void driver_unbind(struct device_fds *dev)
 			igt_lsof("/dev/snd");
 			igt_skip("Audio is in use, skipping\n");
 		} else {
-			igt_warn("Preventively unloaded snd_hda_intel\n");
+			igt_info("Preventively unloaded snd_hda_intel\n");
 		}
 	}
 
-- 
2.19.1
