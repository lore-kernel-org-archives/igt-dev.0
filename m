Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9354C83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 09:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683AE10E63C;
	Wed,  2 Jul 2025 09:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nz0uKQ0H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB5C10E63C
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447978; x=1782983978;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nz4rmxAkwS4Z7qEgJyZq8Ql43ZimIj3p/2r9h2t7h5k=;
 b=nz0uKQ0Hw6CbBQOyzLISno7Cp+Lvv9Bg/MXlP8OguiKGufdt7HVY7GE9
 iKi7pOHWdP84YjW34dwStUGZWyJJZ+3eVFRItoCP73pL4pP3uagI+pf/1
 F+xZRJp8sB0aDrXIppE12SqfKcJTc8XmHdVmfyEejC547AItxryhm1dLk
 032obrzU30kXJbTFgOI7kI9s+YiwpYyR9oElac94Pq1/vu89LnlUj0mn/
 iTnbdaFNcEr3TdA+c1GJ1wYrOJA/ZJcN7wAuOcUjUkWj65oMZ5qs0eYZ6
 27r5ps1LZGtXrYK6LecfsNS8eNlndjodm+0jyfnasgJthMH2mx2JXVOtg Q==;
X-CSE-ConnectionGUID: resT92o8QQinUj/YKpS3jg==
X-CSE-MsgGUID: dLfrZxGIRu6qCXYda/g3JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64333791"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64333791"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:19:37 -0700
X-CSE-ConnectionGUID: nXYUffpeSjCejHHlt6VV8Q==
X-CSE-MsgGUID: oFpqlK0JRoKE2SntTD++SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="154507361"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:19:35 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com, jeevan.b@intel.com,
 swati2.sharma@intel.com, pranay.samala@intel.com,
 kamil.konieczny@linux.intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_cursor_crc: optimise cursor crc on
 simulation
Date: Wed,  2 Jul 2025 14:46:43 +0530
Message-Id: <20250702091643.967483-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Reduce the number of test crc iterations on simulation to avoid timeouts
on simulation.

V2: Avoid usage of extra variable to check run_in_simuation (Pranay)
V3: Initialise max and avoid unnecessary bump (Kamil)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_cursor_crc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index cacd2402c..8a465dc6b 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -490,10 +490,15 @@ static void test_crc_offscreen(data_t *data)
 static void test_crc_sliding(data_t *data)
 {
 	int i;
+	int max;
+
 	struct {
 		igt_crc_t crc[3];
 	} rounds[16] = {};
 
+	/* In simulation, we only run a few rounds to keep the test fast */
+	max = igt_run_in_simulation() ? 4 : 16;
+
 	/* Make sure cursor moves smoothly and pixel-by-pixel, and that there are
 	 * no alignment issues. Horizontal, vertical and diagonal test.
 	 */
@@ -502,7 +507,7 @@ static void test_crc_sliding(data_t *data)
 	cursor_enable(data);
 	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
 
-	for (i = 0; i < ARRAY_SIZE(rounds); i++) {
+	for (i = 0; i < max; i++) {
 		do_single_test(data, i, 0, true, &rounds[i].crc[0]);
 		do_single_test(data, 0, i, true, &rounds[i].crc[1]);
 		do_single_test(data, i, i, true, &rounds[i].crc[2]);
@@ -510,7 +515,7 @@ static void test_crc_sliding(data_t *data)
 
 	/* SW test */
 	cursor_disable(data);
-	for (i = 0; i < ARRAY_SIZE(rounds); i++) {
+	for (i = 0; i < max; i++) {
 		do_single_test(data, i, 0, false, &rounds[i].crc[0]);
 		do_single_test(data, 0, i, false, &rounds[i].crc[1]);
 		do_single_test(data, i, i, false, &rounds[i].crc[2]);
@@ -526,6 +531,9 @@ static void test_crc_random(data_t *data)
 
 	/* Random cursor placement */
 
+	if (igt_run_in_simulation() && max > 10)
+		max = 10;
+
 	/* HW test */
 	cursor_enable(data);
 	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
-- 
2.34.1

