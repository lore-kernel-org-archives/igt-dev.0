Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2874F10E422
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 18:47:55 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-578d791dd91so7052080a12.0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 11:47:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 11:47:45 -0700
Message-ID: <20230926184748.199187-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/3] lib/drmtest: Use module table for
 chipset_to_str()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Helen Koike <helen.koike@collabora.com>,
 Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Use the existing table, so there is one fewer place to update to add
support for a new driver.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/drmtest.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index e1da66c877e9..2cfa8a899d53 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -601,30 +601,11 @@ static void cancel_work_at_exit_render(int sig)
 
 static const char *chipset_to_str(int chipset)
 {
-	switch (chipset) {
-	case DRIVER_INTEL:
-		return "intel";
-	case DRIVER_V3D:
-		return "v3d";
-	case DRIVER_VC4:
-		return "vc4";
-	case DRIVER_VGEM:
-		return "vgem";
-	case DRIVER_AMDGPU:
-		return "amdgpu";
-	case DRIVER_PANFROST:
-		return "panfrost";
-	case DRIVER_MSM:
-		return "msm";
-	case DRIVER_XE:
-		return "xe";
-	case DRIVER_VMWGFX:
-		return "vmwgfx";
-	case DRIVER_ANY:
-		return "any";
-	default:
-		return "other";
-	}
+	for (const struct module *m = modules; m->module; m++)
+		if (m->bit == chipset)
+			return m->module;
+
+	return (chipset == DRIVER_ANY) ? "any" : "other";
 }
 
 /**
-- 
2.41.0
