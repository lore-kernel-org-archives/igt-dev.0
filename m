Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC886606A31B
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=YIOWDMfi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9154D10E1AC;
	Wed, 21 Oct 2026 15:23:32 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54FF10FD6E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=GS0x84EG98ClphlOG4YQS570/cPhF3/mrj+U49PDjr4=; b=
 YIOWDMfizphAjzvhy6TraUigwteO+PJc2huRt8CH5FV3kUWJPVE9NtxOZDztnAL6hpdhhFaHBRmo2
 TsmSygInP5TAFIyA+pj01feur9sUcSHcKEDQrAUU5GZWIyb5Srk3NDc4jDG8O11/neq/nDjhIlM/H
 T+WXdpAFkW5TgCpY3zY6/rI/6VG7SioxcpSvSkdFOsO6arD3QHJzjRnbjtfaiZ8mchlH7eWBJOtqf
 s+7L9jmCwBhelDyZyLu+Sc3VSfYDGyUT8qEbWCOSg/XS6JBbN1xThqlknTfrS/OESHd3xzqLQC3Ls
 IHRWIVL4Fj/Wmz1pi6lhX6BlZll4y2Fu3Q==;
Received: from 62-87-103-230.red-acceso.airtel.net ([62.87.103.230]
 helo=killbill.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xJY6l-005l0E-TB; Wed, 21 Oct 2026 17:20:04 +0200
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
Subject: [PATCH i-g-t v6 3/8] tests/kms_properties: don't check colorop if no
 plane color pipeline prop
Date: Wed, 21 Oct 2026 17:18:27 +0200
Message-ID: <20261021151929.62529-4-mwen@igalia.com>
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

Don't check the colorop properties on planes that do not support them
(for example, on AMD driver cursor planes). If the COLOR_PIPELINE
property of the plane is not available, the plane does not support
colorop pipelines and there is no point in checking the colorop
properties in this case.

Reviewed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/kms_properties.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 93bf1ea26..2b4cb152b 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -247,6 +247,10 @@ static void run_colorop_property_tests(igt_display_t *display,
 		     &fb);
 
 	for_each_plane_on_crtc(crtc, plane) {
+		/* skip planes that don't support color pipelines */
+		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
 		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
 			 igt_crtc_name(crtc), plane->index,
 			 kmstest_plane_type_name(plane->type), output->name);
-- 
2.53.0

