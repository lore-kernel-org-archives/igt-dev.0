Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4080C10E453
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 18:47:57 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5780040cb81so7394889a12.1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 11:47:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 11:47:46 -0700
Message-ID: <20230926184748.199187-2-robdclark@gmail.com>
In-Reply-To: <20230926184748.199187-1-robdclark@gmail.com>
References: <20230926184748.199187-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/3] lib/drmtest: Add drm_find_chipset()
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

Add helper to map driver name to chipset.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/drmtest.c | 14 ++++++++++++++
 lib/drmtest.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 2cfa8a899d53..4d826df744ae 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -608,6 +608,20 @@ static const char *chipset_to_str(int chipset)
 	return (chipset == DRIVER_ANY) ? "any" : "other";
 }
 
+/**
+ * drm_find_chipset:
+ * @name: The driver name
+ *
+ * Map the driver name to DRIVER_xyz value.
+ */
+int drm_find_chipset(const char *name)
+{
+	for (const struct module *m = modules; m->module; m++)
+		if (!strcmp(name, m->module))
+			return m->bit;
+	return 0;
+}
+
 /**
  * drm_open_driver:
  * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 97ab6e759edf..9a71e1041ce8 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -99,6 +99,7 @@ void __set_forced_driver(const char *name);
 #define ALIGN_DOWN(x, a)	ALIGN((x) - ((a) - 1), (a))
 
 void drm_load_module(unsigned int chipset);
+int drm_find_chipset(const char *name);
 int drm_open_driver(int chipset);
 int drm_open_driver_master(int chipset);
 int drm_open_driver_render(int chipset);
-- 
2.41.0
