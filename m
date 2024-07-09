Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7BCC3DA4E
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C6210E5B4;
	Tue,  9 Jul 2024 15:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZsW9AlSy";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EB910E5AE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 337F520004;
 Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P6dyepR5gpzHbgXgQDMLB3gisyTA60DJmZUdyJb+HUs=;
 b=ZsW9AlSyxts84kQ2ysqXn2/wuo1FQNpfSRadbKoyCsgnWGyvWChotlAgRvYw5VXGz/3Oiw
 TwLGVbKwtwtEozSSLRPZCe9nQw8mX8H3HwCbNfX9cSpwYspsqrokWCh92TlZCdKHOdak74
 gF27xQ5urrlZLVQvZ60K7IME5LbAtUoR9nIvv+4ufh5q01RekmGmaVsUHhRI/6bg+Z1gb5
 YyG3EX0xsLsXIgkJwXBjydU9iy2MtdHbN5tXvH/vDLcsfk/h888FumeT5JU5chH08R64Zh
 g4iotQ9l/T4fJFXeRRa+JbKbqOkesikZEs/6erpGkOHJzJ8yO9BxDFhw8Au1XA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:28 +0200
Subject: [PATCH i-g-t v2 12/39] lib/chamelium/v2: Extract chamelium v2
 wrapper into its own directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-12-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5453;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=pf2uuEzOkomiQ64lZTFLtZ8zT19WywqDxJL4KLdhZEw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViX2Y8+Zu4x1KieEMHudZrcpwjJhkzY8Zdzt
 235npjtwLGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YlwAKCRAgrS7GWxAs
 4qLmEADCgWboMICRtMBgtTG9mHz62PY68xIZZyJuyC6MXb1nRvQa9Ej27AlrwcCe3lmOeX2rcrH
 kyQWhWM99iP+mzNj1m/9wYhmjpyemzK/4VYC0TomULBzo7pzS1tL3q7g7GvjBENiuN+muzeDePl
 tAumORrzVZWKDISGiRr4S74LxI9b4e8/u1EcgPB55Kuqii8saxSFzIGEuU5gWac19bc/eR9hgRM
 jLlcatBLbqteubkBstpccN3giAyiaSZoRl18S4iyTfXgrXGtixbzftx0mW6fyo5NqppLUz5nJxO
 XO7kh/4wkJv/lNJrPDGIKia/d/y1huqQte7PnZ10QGE955qRzGAzHvl6Ihwnef/fBpAgFxbf8do
 aflF5nsp8YkgzubocDFVg2hhRGLpOxoO0pNfK0H4wurQJjnfGG8GORNan3FcbKE4nKFbSMb7epn
 SwEMb/EndwvQdLEpvd2VDFwyx9FF8dPTDtpDHnSopzdNC3Gv+zaDLoWL5Tv7TddYoOGXXgACU14
 LU7RQTmjmds/ODz1V+qmOw8BOoCFCx0E76T0wA4Y1bhaRQs+Ifjy0TSpDHu0HImsqnBGRdCNwWh
 krC1BzAxAPjEvgwhqWmCNBx+pcFuH5a0CCzywMJYPQa4bqoaq438v6n3psYLmzBfgYfEI+jBLpD
 qG8hlXZjT59idFw==
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
index 45e0eec72d12..e12ac94c423f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -61,7 +61,7 @@
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM
-#include "igt_chamelium.h"
+#include "chamelium/v2/igt_chamelium.h"
 #endif
 
 /**
diff --git a/lib/meson.build b/lib/meson.build
index 7577bee9d35e..c617a92a6a6e 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -190,7 +190,10 @@ endif
 
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
2.44.2

