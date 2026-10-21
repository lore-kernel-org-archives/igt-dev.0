Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0312F606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=oSehor+v
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD93410E317;
	Wed, 21 Oct 2026 15:27:28 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED4D10E02C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 15:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=YrrmFwsc1ulDxtCoBHTG+PdgiW2ud9F5BO+Tlz3FGPg=; b=
 oSehor+vaRQs+kH0lwfm0m1dLdCjonyvVPyQ4WqcGUhwMqSqArRojLRafswxhpEsQ7oGXpbOf3RWm
 lawo3B3EniSfCn3G6KWu8E0pZoxAQUAbah1D+Ay+bqcer5xusDPSwflYow+A/LA1rZFUfq69J4raY
 YYRDzfila8wptZ0CxrijpyXsl+9rQgwBoY3gDY4XxODu6oRiR8Cd3xYawXSkOK4bTGy59QEeOb4Ix
 C38CmdvCaItL9IkyHhGlL5uTESdpDASFDx6OW9S/ez1T1HYJDwo5gULfthA7j0pEGtsJBV9QImOFC
 FEGPptfcxbZbVXQAudsKObWjtQvV1LrmbA==;
Received: from 62-87-103-230.red-acceso.airtel.net ([62.87.103.230]
 helo=killbill.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xJY6u-005l0E-6u; Wed, 21 Oct 2026 17:20:12 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH i-g-t v6 7/8] tests/intel/kms_color_pipeline: move
 driver-specific test to intel's folder
Date: Wed, 21 Oct 2026 17:18:31 +0200
Message-ID: <20261021151929.62529-8-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021151929.62529-1-mwen@igalia.com>
References: <20261021151929.62529-1-mwen@igalia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Acked-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/{ => intel}/kms_color_pipeline.c | 2 +-
 tests/meson.build                      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename tests/{ => intel}/kms_color_pipeline.c (99%)

diff --git a/tests/kms_color_pipeline.c b/tests/intel/kms_color_pipeline.c
similarity index 99%
rename from tests/kms_color_pipeline.c
rename to tests/intel/kms_color_pipeline.c
index 88419db8a..7286718f6 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/intel/kms_color_pipeline.c
@@ -624,7 +624,7 @@ int igt_main()
 	data_t data = {};
 
 	igt_fixture() {
-		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
 		/*
 		 * Plane color pipeline support requires atomic modesetting.
diff --git a/tests/meson.build b/tests/meson.build
index 519a9e727..bb8bef0f9 100644
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
@@ -251,6 +250,7 @@ intel_kms_progs = [
 	'kms_busy',
 	'kms_ccs',
 	'kms_cdclk',
+	'kms_color_pipeline',
 	'kms_dirtyfb',
 	'kms_dp_link_training',
         'kms_dp_linktrain_fallback',
-- 
2.53.0

