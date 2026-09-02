Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E827C624D3
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 18:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A281A10F30A;
	Wed,  2 Sep 2026 18:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aJ+mzfOy";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A5610F305
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=PNDoB6PVbakcbvbLuTTqXYfXefo9Lc2yK6qLTd6SypI=; b=
 aJ+mzfOy+Kn7DveV6OGd3z/6biJirUGDexsTa9cU3zaR4yFf3Zm6wqTNHgifpMpduzqQTA9nkl3Ft
 YyicJ0YrMRpa/SlGhPBONPtnOlvlUuaKgqU4Ve8lS99/4f8krvXqL9evLzb+kBjFoXoJBLnZHll1Z
 enxSw+E04Rvbsmw22KuPDzkTAl65c4AVbaGFyWsBZ9/DqIWA2/mEBrq0II/OetQUNy7PWdmHObos+
 eBcAGaQVg3w3zUkMPg3DRpfxhbiuAZz0QJXd84wNGgW1d1EeUukcPoEkqwuQuNpuxw98BcMBuZ22k
 PCq0k565Xawf3Ov1LqgNuJUnaNXgOoxPPQ==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x1pGK-00DxQx-I7; Wed, 02 Sep 2026 20:00:40 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH i-g-t v5 7/8] tests/intel/kms_color_pipeline: move
 driver-specific test to intel's folder
Date: Wed,  2 Sep 2026 19:58:07 +0200
Message-ID: <20260902180016.303482-8-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902180016.303482-1-mwen@igalia.com>
References: <20260902180016.303482-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

As stated in test docs, the kms_color_pipeline isn't driver-agnostic. It
validates color transformations using CRC, which is less accurate than
comparing writeback buffers, but the i915 and xe drivers require CRC
validation when the writeback connector is not supported: kms_colorop
tests don't run when writeback is not supported. Since other drivers
that support colorops also support writeback, this CRC option is
currently only required by Intel; therefore, move kms_color_pipeline
test to the Intel folder and only open Intel's drivers (not any).

If the CRC-based colorop test is useful for some other driver, the
required generalizations and switch to the common folder should be made.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/{ => intel}/kms_color_pipeline.c | 2 +-
 tests/meson.build                      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename tests/{ => intel}/kms_color_pipeline.c (99%)

diff --git a/tests/kms_color_pipeline.c b/tests/intel/kms_color_pipeline.c
similarity index 99%
rename from tests/kms_color_pipeline.c
rename to tests/intel/kms_color_pipeline.c
index f71416ce1..3d41b811b 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/intel/kms_color_pipeline.c
@@ -353,7 +353,7 @@ int igt_main()
 	data_t data = {};
 
 	igt_fixture() {
-		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
 		/*
 		 * Plane color pipeline support requires atomic modesetting.
diff --git a/tests/meson.build b/tests/meson.build
index 1ac89bab7..c1a436420 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -25,7 +25,6 @@ test_progs = [
 	'kms_atomic_transition',
 	'kms_bw',
 	'kms_color',
-	'kms_color_pipeline',
 	'kms_concurrent',
 	'kms_colorop',
 	'kms_content_protection',
@@ -250,6 +249,7 @@ intel_kms_progs = [
 	'kms_busy',
 	'kms_ccs',
 	'kms_cdclk',
+	'kms_color_pipeline',
 	'kms_dirtyfb',
 	'kms_dp_link_training',
         'kms_dp_linktrain_fallback',
-- 
2.53.0

