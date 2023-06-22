Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0F310E4DA
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 07:00:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:24:12 +0530
Message-Id: <20230622065422.2235134-14-bhanuprakash.modem@intel.com>
In-Reply-To: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
References: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 i-g-t 13/23] tests/chamelium: Use drm_close_driver()
 to close the drm fd
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

To close the drm file descriptor, use igt helper drm_close_driver()
instead of using close().

Cc: Mark Yacoub <markyacoub@chromium.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/chamelium/kms_chamelium_audio.c  | 2 +-
 tests/chamelium/kms_chamelium_edid.c   | 2 +-
 tests/chamelium/kms_chamelium_frames.c | 2 +-
 tests/chamelium/kms_chamelium_hpd.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index 6c6177fc5..8fbc1f80e 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -870,6 +870,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 4a52e6922..446bbd204 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -585,6 +585,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index 22a7ba936..a56afada4 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -1102,6 +1102,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index efd40ba54..8b3189ca0 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -564,6 +564,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
-- 
2.40.0
