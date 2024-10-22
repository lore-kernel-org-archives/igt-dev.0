Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FF6D2C565
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 14:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4EE10E6AE;
	Tue, 22 Oct 2024 14:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="epYEFyV1";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78BC10E699
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 14:49:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB77BFF802;
 Tue, 22 Oct 2024 14:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729608583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RW7iB2W91KMbadVlF9B8kiPPxBDfelhRmsjvKlQBdr4=;
 b=epYEFyV1/Hy6fH02XA8xQRD9fp+UHVKHPJEB5suu10srouDoqYEA3/K/a94UkRCEG7S6QM
 Uw88fCU1TUt0svLKV4geuO8a2nOdEb+nK/veMbBoi0TV5mns0kzYH4YLYJvpi5mlXuDkLV
 r8m413yZWBGXdpNkSwfCuVa1sWdNH5+iNuyazgOZ0bAAESXbux+7FD+nmKJv7R4gscR37H
 S2y3w2pGmIQVamRoLILhdqXS+gI4gfmvPzq/V0bfIcdwLrL/103j+AEpyl+UODLiyiesDO
 yTg10VRAK4EOHzOB45YumFeJlFnSJdzCdcLAFR2jiyH74LZjxvvF+i2Zjs/9/w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 16:49:36 +0200
Subject: [PATCH i-g-t 4/4] lib/chamelium/v2: Rename HAVE_CHAMELIUM to
 HAVE_CHAMELIUM_V2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-03-cv2-split-v1-4-9f7cc8591ff9@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3893;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=QH/cI3bItcrRYkYdRVthCpb5h2LPDaE/dushTpfYxPQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF7uCV9XSAmT4OU4UrlGhRTzeba389f1GxuHLE
 ikg4QPoql6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxe7ggAKCRAgrS7GWxAs
 4kbfEADJ8gPRU+IF+L8bKbGUy4X/ho6ImrNnae2/rMAHHVpXLjLjdmyvyuruqSrL3PxINOD+XzS
 YcKm/lKOA5m37hIPMBxhq2ZGFessOnETWo2oRAFcgZyoHKEby0fPz9QkvYt9gL/W8cHo8c4bCPc
 DiUFnF+ZXso9VX+L4l8OXw83aX1OQWZRgNNVaAZhsq0v4AavxL9OyWLw7p/3pfZVcbMainxu6Xy
 EyuNBPgKlGaKsgKecU5/do5opylxdSel8hw/VoaWKS1iJWtXOwbmsbDtHqNH6b1MO1wDpqtT2dE
 cdjvwDwRjU8/LS1Pi602z6P8NglRnRo5CPlqru8chzIrSuGF5btKvdHUtvo6K6Vm/ATIB0XIlhw
 6giA4CllZxlzxMIcCYQpW42xJ12JmYlJsK5p9DHHRd5PgxKQhFrhgHCbBHNoEcv/mIi43kPUw18
 KhJEn+C5ykAMPQVjFCs77RAnu/wdYgrIXq763C+xuJVZl8G6EkUkROdJ8PtHJUcrUY602oj2aHT
 b7NoSa3HCTFz4uV7Qql8UxjuLLK0Dfo4Fe2t+IJvXIxtliIrmUwXrZxIxa8PRQJhysp86juciML
 o9Vfx75esuna7TmkEXuWPDwYRjBHfKPtL5W18hSCaXDusHDTH8mpgcH/cCIWcrKDyW1hAZGYvvZ
 HtVfC8f0UQ+THCA==
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

To avoid confusion in source file between the two chamelium version,
rename the HAVE_CHAMELIUM define to HAVE_CHAMELIUM_V2.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt.h                     | 2 +-
 lib/igt_kms.c                 | 4 ++--
 meson.build                   | 2 +-
 tests/kms_color_helper.h      | 2 +-
 tests/kms_feature_discovery.c | 4 ++--
 tests/kms_tiled_display.c     | 6 +++---
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/igt.h b/lib/igt.h
index f68d9b28eaa6..4bd845c07579 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -41,7 +41,7 @@
 #include "igt_sizes.h"
 #include "igt_stats.h"
 #include "igt_dsc.h"
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 #include "igt_alsa.h"
 #include "igt_audio.h"
 #include "chamelium/v2/igt_chamelium.h"
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8d4efde9b584..56003ceaf9dc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -61,7 +61,7 @@
 #include "igt_rc.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 #include "chamelium/v2/igt_chamelium.h"
 #endif
 
@@ -2908,7 +2908,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (!resources)
 		goto out;
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 	{
 		struct chamelium *chamelium;
 
diff --git a/meson.build b/meson.build
index df0f7b718986..b4b1026acb4c 100644
--- a/meson.build
+++ b/meson.build
@@ -183,7 +183,7 @@ alsa = dependency('alsa', required : build_chamelium_v2)
 libcurl = dependency('libcurl', required : build_chamelium_v2)
 
 if xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found() and gsl.found() and alsa.found() and libcurl.found()
-	config.set('HAVE_CHAMELIUM', 1)
+	config.set('HAVE_CHAMELIUM_V2', 1)
 	chamelium_v2 = declare_dependency(dependencies : [
 		xmlrpc,
 		xmlrpc_util,
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 23463b944b6f..910de27bf61f 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -57,7 +57,7 @@ typedef struct {
 	uint32_t color_depth;
 	uint64_t degamma_lut_size;
 	uint64_t gamma_lut_size;
-	#ifdef HAVE_CHAMELIUM
+	#ifdef HAVE_CHAMELIUM_V2
 	struct chamelium *chamelium;
 	struct chamelium_port **ports;
 	int port_count;
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index edb0186361a8..76e958c84d51 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -35,7 +35,7 @@
  */
 
 #include "igt.h"
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 #include "chamelium/v2/igt_chamelium.h"
 #endif
 #include "igt_kms.h"
@@ -140,7 +140,7 @@ igt_main {
 			}
 		}
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 		igt_describe("Make sure that Chamelium is configured and reachable.");
 		igt_subtest("chamelium") {
 			struct chamelium *chamelium =
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index ce42b890b0e8..fca3d4d23bcf 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -82,7 +82,7 @@ typedef struct {
 	struct timeval first_ts;
 	int linetime_us;
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 	struct chamelium *chamelium;
 	struct chamelium_port **ports;
 	int port_count;
@@ -394,7 +394,7 @@ static bool got_all_page_flips(data_t *data)
 	return true;
 }
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 static void test_with_chamelium(data_t *data)
 {
 	int i, count = 0;
@@ -607,7 +607,7 @@ igt_main
 		test_cleanup(&data);
 	}
 
-#ifdef HAVE_CHAMELIUM
+#ifdef HAVE_CHAMELIUM_V2
 	igt_describe("Make sure the Tiled CRTCs are synchronized and we get "
 		     "page flips for all tiled CRTCs in one vblank (executes on chamelium).");
 	igt_subtest_f("basic-test-pattern-with-chamelium") {

-- 
2.46.2

