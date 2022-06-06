Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C99710F915
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 09:05:17 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id c2so2839523lfk.0
 for <igt-dev@lists.freedesktop.org>; Mon, 06 Jun 2022 02:05:17 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  6 Jun 2022 12:05:11 +0300
Message-Id: <20220606090511.26339-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220606090511.26339-1-juhapekka.heikkila@gmail.com>
References: <20220606090511.26339-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/intel_chipset: restore usage of
 has_flatccs flag
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

When older patches had been merged on top of newer patches
has_flatccs flag usage had gotten lost, put it back here.
While at it also set has_flatccs flag to take only one bit
since it is of boolean type.

CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_chipset.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 815474086..de4749e14 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -41,7 +41,7 @@ struct intel_device_info {
 	unsigned display_ver;
 	unsigned gt; /* 0 if unknown */
 	bool has_4tile : 1;
-	bool has_flatccs;
+	bool has_flatccs : 1;
 	bool is_mobile : 1;
 	bool is_whitney : 1;
 	bool is_almador : 1;
@@ -221,7 +221,6 @@ void intel_check_pch(void);
 
 #define HAS_4TILE(devid)	(intel_get_device_info(devid)->has_4tile)
 
-/* use HAS_4TILE here as all devices with 4-tile have flat ccs. */
-#define HAS_FLATCCS(devid)	HAS_4TILE(devid)
+#define HAS_FLATCCS(devid)	(intel_get_device_info(devid)->has_flatccs)
 
 #endif /* _INTEL_CHIPSET_H */
-- 
2.28.0
