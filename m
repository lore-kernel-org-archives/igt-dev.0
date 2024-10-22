Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0592BD2C564
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 14:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A301A10E6A1;
	Tue, 22 Oct 2024 14:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lo2m0Tty";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A83910E69E
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 14:49:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E70AFF804;
 Tue, 22 Oct 2024 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729608582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJQLE8JK6ylYjXoE38A2L8A9LeRMMjEoWdWpfk8EgWA=;
 b=lo2m0Ttyem69i4+rlybczz0Ml4if5FdOABX9tqJ8Iav+WeD8JCOgu0nbMPvaVZHBNHokQ8
 58vX2ItjCL+go06WzCF2FUuyF5ZYoUF2A594BGsXG3bRlhscfxZkieMm9D/HMgqSAahtZ+
 G1pfx7rMJ4erHEe6jfGQlsjwItRgcgXoYtR3Z1vIrRCqfpoIMV53h2CbA7ORdOBXrxT99N
 B/wF0nP4wjt0PoFXoai/x3ZYshVo+O+CGjZXygo1TmEWGNDfopOu/UmUxyotLoB8pSdiWm
 ZWefnCN3Awa2l/lqsn2yg8+Sfx2eUpeGEwOBYZLYeYJVUGxGL7YvmvvPo/gykA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 16:49:34 +0200
Subject: [PATCH i-g-t 2/4] lib/chamelium/v2: Extract chamelium v2 wrapper
 into its own directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-03-cv2-split-v1-2-9f7cc8591ff9@bootlin.com>
References: <20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com>
In-Reply-To: <20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com, 
 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5453;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tAudZsjiQEKumU5HL8ZxvBhKbTgSlTnQtfBUZLg5p8M=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF7uCbDULFxLkuTnMJ7HOKx57nOI5uEZmYC14g
 vo1KjYC3dmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxe7ggAKCRAgrS7GWxAs
 4k8yEAClSwPDysJPL+t3Xsbea5W1p7yWMneE3/NCLsxXME+NJlrj47TXu+g3tTyfRFQQ3/SVUFy
 zrCUBVP0Y4dhmHtxRz3stUfA1wiyyZioHK6sG432dEaRjqteRdM9YP3cwhNkW1lv88wo2bj6Gvi
 xe1GAS4g458VxNYrQg7P8cV2JdYb87ouGl04Gq2IW1tvr+mk9yQ5pEDrUOlZr2LTRdv97UK/yBj
 9ldPe6QGNrSKwc0cFy6xcG1DzLGlh1YWQK32FCKodA0qw8I3PHCHyX4aMomN91MJlh6AcAOWs5B
 j+L1bAvWJ0kvE4lYjDsnjGpwen1Q4fAv8qvzWkKn+G3sYChHfy9YCbiCyCN0rCfr51/q+okxtNF
 a7b6Y+cX+j/PAy7QV4x1LV5kda31znwF1wsE6bPizT1rUT5Rpc+dCibqTbOHh4kOHoXw5WObFXq
 84mnNgAFu4JOcYk3gmQiwOPqMi6bo0UGSU0UxOsGmMHBnBoICrACpMp+A1/bgJbMiLUk63kHIiv
 PJUG4CBexjjAzi7+ppatsU44DUmq7hLLvX8tc+RDFZPH0JHuKwI5/jLI03yB3p71uEc329WxEon
 22Z/KGqLPoHH2vI2u9pIDin7Nw1HDrLQd/sobfSNjTpow63AEDa2xksIk0AZ0o/DHvBE8KF8Br/
 VlX2kbE+/ijBCcA==
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
index 620fbbf7d94f..2218c6cd694d 100644
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
index 58c39e098016..f68d9b28eaa6 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -44,8 +44,8 @@
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
index 82d63d6e6229..8d4efde9b584 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -62,7 +62,7 @@
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM
-#include "igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium.h"
 #endif
 
 /**
diff --git a/lib/meson.build b/lib/meson.build
index c3556a921adf..dc70704bd919 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -191,7 +191,10 @@ endif
 
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
index 50b08530826a..fed9a676fd97 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -16,7 +16,7 @@
 #include <stdbool.h>
 
 #include "igt_core.h"
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
2.46.2

