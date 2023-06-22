Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF1B10E4D9
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 07:00:50 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:24:07 +0530
Message-Id: <20230622065422.2235134-9-bhanuprakash.modem@intel.com>
In-Reply-To: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
References: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 i-g-t 08/23] tests/nouveau_crc: Close the fd before
 exit
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

Close the file descriptor before exiting the test.

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 tests/nouveau_crc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 785d39bde..d5aa0e650 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -409,7 +409,9 @@ igt_main
 			close(data.nv_crc_dir);
 		}
 	}
-	igt_fixture
-		igt_display_fini(&data.display);
 
+	igt_fixture {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
 }
-- 
2.40.0
