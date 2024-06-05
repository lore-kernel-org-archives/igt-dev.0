Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A024BC27C53
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 14:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B9510E7E6;
	Wed,  5 Jun 2024 14:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="F9QaipfD";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECD110E620
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 14:30:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C2834000F;
 Wed,  5 Jun 2024 14:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1717597819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MhLAQwVQkGOrdUZN3aEQUc7bsMRmEtqzPcpXDLmUysk=;
 b=F9QaipfDmadXw79AZbYeXKIW2kesXtkb0vhgWCIedNyn7M+bW7mh558x02Ph5++qPGuJ5R
 56Uo4i6UFk9dm/+Klwa0/f4wcWJaCliIk+ToEaWKO8t48GCnym4ETBX+cs/UUvDIzI/R/H
 QBORb8qIyRci4c7uxniHrZkYIlFMFSZ7vcfwEw3GWnQrr1pWUWwH3yJK7C8xJdSXRXqX3C
 IFQvwpm3vg/uySGmkSIUbxpGHmnP5xspzM58T6Yjbsda9cZIxd69rkdSN+KeQ4PDzSRNBI
 po64/mu40Nq3Gvh8jWUaASvt+GWUrq8rVPIEcv2ar8t5bUn0BjN/Qk5l+2Ip/g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 05 Jun 2024 16:30:14 +0200
Subject: [PATCH i-g-t RFC 02/13] lib/chamelium: Extract chamelium v2
 wrapper into its own directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dev-remove-static-ports-v1-2-665f25b7a4db@bootlin.com>
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5431;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jO3eXXx2evw9qfI2pe5y0j9zlggY3GfSd7XyxHI3Y/U=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmYHZ3BoaNOG24jv+EPlYyRTuu5a8kVoflcTstG
 l/Kh5vxS7yJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZmB2dwAKCRAgrS7GWxAs
 4tf1D/4urnS740d6t4zYo4CRB/r4fUwdAOfhSIZzYxTSM641PflXEi82SHnEmiU444KqYRhz6JE
 RD8f7GtBeCrqZGaO04etEwHFr0fMtq66iaSoT6crGrQOFe5EGH0ZBt1bifoAB1f90cAJN6InTjA
 mWsK9JNAkEaRjGzT/dz5rEQ3mAyl48RC2TgkeVS17aTv4vqrxHFoxPa0s1WCsUoQA+Qg+IdYE6w
 VuZATXFkch+K5L3LsbEQ8qOws7QWa15r86aaG/raDdfhLvhV+PljbwCLpkBVFjhYDTzqZsPvmss
 Yio8z6c66S/sRqrXGOCGAAN8ANzI/HUsjWSzg8Y8vFOxLlhywzhChxxJBGhQDBShP0BxB9w7CCl
 6+seGhJtnUEbH56oXMTQPJNFnilqBk0hGvhpNqMHETZDhWlWxS5uh6zzPTgT7ni6svsUYwK9e+G
 YhVEhzs79sXKIWnGsk4Pke+4LJTGAyRbIslqFHZIzR7nbtAL7J9puBc516IIR3clGqc0c7BsCB+
 sq8lWcQkOiI2oVZ80lEztFvJnNypqM7cqrkcwdNzDnu0emrdLy7fW6KYT11wWpQQFC7jcSAcbf1
 +w8gJHVMwVzpMpiU55R8M4YsqAi7Klz1pXhm8zC8ouLw+BMtXUpXODRtj8LwAJk/j6evb8SL+gc
 0SBu/RBQ0gim4NA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

In preparation for the Chamelium v3, the support for Chamelium v2 is being
extracted into its own directory.

The two Chamelium versions have different sets of functionality (audio,
MST, CRC computation, etc.). As the current wrapper is already complex,
extracting the v2 part into its own directory allows for the v3 wrapper to
be written without breaking any existing tests or complicating the
existing code.

The current identified complexities that necessitate a thorough rework of
the existing v2 wrapper are:

 - Not all ports are discoverable in v3 (MST ports are not physical
   ports, but they can have EDID, be plugged, etc.), and they can change
   over time.
 - The v3 is unable to perform CRC computation, so many tests must be
   rewritten or adapted to work.
 - Not all ports can be plugged at once, which is a feature used by the
   existing v2 wrapper to set up the Chamelium.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/{ => chamelium/v2}/igt_chamelium.c        | 2 +-
 lib/{ => chamelium/v2}/igt_chamelium.h        | 0
 lib/{ => chamelium/v2}/igt_chamelium_stream.c | 2 +-
 lib/{ => chamelium/v2}/igt_chamelium_stream.h | 0
 lib/igt.h                                     | 4 ++--
 lib/igt_kms.c                                 | 2 +-
 lib/meson.build                               | 5 ++++-
 lib/monitor_edids/monitor_edids_helper.h      | 2 +-
 tests/chamelium/v2/kms_chamelium_edid.c       | 2 +-
 tests/kms_feature_discovery.c                 | 2 +-
 10 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/chamelium/v2/igt_chamelium.c
similarity index 99%
rename from lib/igt_chamelium.c
rename to lib/chamelium/v2/igt_chamelium.c
index 016d5356630c..f38b30463e21 100644
--- a/lib/igt_chamelium.c
+++ b/lib/chamelium/v2/igt_chamelium.c
@@ -37,7 +37,7 @@
 #include <pixman.h>
 #include <cairo.h>
 
-#include "igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium.h"
 #include "igt_core.h"
 #include "igt_aux.h"
 #include "igt_edid.h"
diff --git a/lib/igt_chamelium.h b/lib/chamelium/v2/igt_chamelium.h
similarity index 100%
rename from lib/igt_chamelium.h
rename to lib/chamelium/v2/igt_chamelium.h
diff --git a/lib/igt_chamelium_stream.c b/lib/chamelium/v2/igt_chamelium_stream.c
similarity index 99%
rename from lib/igt_chamelium_stream.c
rename to lib/chamelium/v2/igt_chamelium_stream.c
index a8cd19e51b0b..8d96e654947d 100644
--- a/lib/igt_chamelium_stream.c
+++ b/lib/chamelium/v2/igt_chamelium_stream.c
@@ -33,7 +33,7 @@
 #include <sys/types.h>
 #include <sys/socket.h>
 
-#include "igt_chamelium_stream.h"
+#include "chamelium/v2/igt_chamelium_stream.h"
 #include "igt_core.h"
 #include "igt_rc.h"
 
diff --git a/lib/igt_chamelium_stream.h b/lib/chamelium/v2/igt_chamelium_stream.h
similarity index 100%
rename from lib/igt_chamelium_stream.h
rename to lib/chamelium/v2/igt_chamelium_stream.h
diff --git a/lib/igt.h b/lib/igt.h
index 7af3d10cbcd3..cf91e92eb2d4 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -45,8 +45,8 @@
 #ifdef HAVE_CHAMELIUM
 #include "igt_alsa.h"
 #include "igt_audio.h"
-#include "igt_chamelium.h"
-#include "igt_chamelium_stream.h"
+#include "chamelium/v2/igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium_stream.h"
 #endif
 #include "instdone.h"
 #include "intel_batchbuffer.h"
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index af63d13b1da3..4a61c3560999 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -60,7 +60,7 @@
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM
-#include "igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium.h"
 #endif
 
 /**
diff --git a/lib/meson.build b/lib/meson.build
index e2f740c116f8..74080e339c19 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -189,7 +189,10 @@ endif
 
 if chamelium.found()
 	lib_deps += chamelium
-	lib_sources += [ 'igt_chamelium.c', 'igt_chamelium_stream.c' ]
+	lib_sources += [
+		'chamelium/v2/igt_chamelium.c',
+		'chamelium/v2/igt_chamelium_stream.c'
+	]
 	lib_sources += 'monitor_edids/monitor_edids_helper.c'
 endif
 
diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
index 05679f0897f3..63a183409293 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -13,7 +13,7 @@
 
 #include <stdint.h>
 
-#include "igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium.h"
 
 /* Max Length can be increased as needed, when new EDIDs are added. */
 #define EDID_NAME_MAX_LEN 28
diff --git a/tests/chamelium/v2/kms_chamelium_edid.c b/tests/chamelium/v2/kms_chamelium_edid.c
index 8438f5f156b7..772654f37de8 100644
--- a/tests/chamelium/v2/kms_chamelium_edid.c
+++ b/tests/chamelium/v2/kms_chamelium_edid.c
@@ -41,7 +41,7 @@
 
 #include "config.h"
 #include "igt.h"
-#include "igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium.h"
 #include "igt_edid.h"
 #include "igt_eld.h"
 #include "igt_vc4.h"
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 5bca9ad76684..edb0186361a8 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -36,7 +36,7 @@
 
 #include "igt.h"
 #ifdef HAVE_CHAMELIUM
-#include "igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium.h"
 #endif
 #include "igt_kms.h"
 #include "igt_psr.h"

-- 
2.43.2

