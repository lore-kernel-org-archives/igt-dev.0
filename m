Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF98CAC5A5
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 04:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA37010E067;
	Tue, 23 Sep 2025 04:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DHTda+c3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D87110E067
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 04:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758600176; x=1790136176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1KzmiNNhRH5anwpR9NZwelpMhL0NkdA8nP5BZj3vk0E=;
 b=DHTda+c3Y9qBUN+NAIvLDYG/v4IHmHY7JDi0fZfo97jCcRLS/Vnvy/4c
 sdCNLI+B/YgYhoqbhCyQDwC3+e4/YKGNk786jyyoBj1dalYVVb/gqtkwO
 E35J2KM01XvMTGNpnE1LJqXbzXzPv3RP3zi3nqSwRGFhDkGplTaEHx3Pg
 W/4pJ2YPJt0+y9oq+kMgMKxUmSJZcI9ubNnI1AFm9wkOXhZXwGslUdmh+
 NAavBFhv4Y8gSaWso8VI6wUMgFCRGCCmUU/B94Dmerg9NB8nVTuR9P3pj
 0SrBaIoPm/x1aOiatiWNqDk8qRpzYlV22Kb3g6HlI3nYZyYSbEPc1/CsB w==;
X-CSE-ConnectionGUID: J2qUK9ylQyeac9M3Ue7JpA==
X-CSE-MsgGUID: dqUg3d+VT/KoEzQ+p0qiJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64676678"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64676678"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 21:02:56 -0700
X-CSE-ConnectionGUID: u5diXgi4QBS8zonKulawUQ==
X-CSE-MsgGUID: 6jsg/L6qSdS0qlqgYEDg3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="176729645"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 21:02:54 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/1] tests/kms_plane: Optimize pixel format testing
 for simulation mode
Date: Tue, 23 Sep 2025 09:32:43 +0530
Message-ID: <20250923040243.3664141-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

To improve test efficiency in simulation mode, logic was added to
skip pixel format tests involving the "linear" modifier, which is
known to be slow due to framebuffer fill operations. Additionally,
test execution was limited to a single plane to further reduce
runtime.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index f7b672c7a..1de789ca2 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1106,6 +1106,16 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 		    f.modifier == ref.modifier)
 			continue;
 
+		/*
+		 * Filling framebuffers with the "linear" format is relatively slow,
+		 * which significantly increases the duration of the test. To
+		 * improve timing and efficiency in simulation mode, linear formats
+		 * are skipped.
+		 */
+		if (!strcmp(igt_fb_modifier_name(f.modifier), "linear") &&
+		    igt_run_in_simulation())
+			continue;
+
 		if (skip_format_mod(data, f.format, f.modifier, &tested_formats)) {
 			igt_info("Skipping format " IGT_FORMAT_FMT " / modifier "
 				 IGT_MODIFIER_FMT " on %s.%u\n",
@@ -1229,6 +1239,13 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 			continue;
 		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
 			test_format_plane(data, pipe, output, plane, &primary_fb);
+
+		/*
+		 * In simulation mode, we only run the pixel format test on the first plane
+		 * to reduce test execution time.
+		 */
+		if (igt_run_in_simulation())
+			break;
 	}
 
 	test_fini(data);
-- 
2.43.0

