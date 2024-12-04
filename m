Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9765E7716F
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 05:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C3310EC00;
	Wed,  4 Dec 2024 05:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpKaRoKE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F116E10EBFE
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 05:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733291670; x=1764827670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dLrvwtSElpB8lSbLVzyUA1qaFL5k7x5gZR6iZ528PPI=;
 b=jpKaRoKEKAcKvnbKt38GtkfE4yky7wfwu04G+UpZFUDVcUmCB7j5YIdH
 xZf4NvRUkbg6D1IbcbR36Z4rBKbYV4XXv0fwXDHdusqeAn0rsLoxxf0tY
 jNmUuVVjGSmbNYBafAUjRPP/NhfLrEW1r+vCZQawjdDmg10uSZb5T23TU
 cU9oE5jtiXQD7vr3DcXi+cSoCMEsVM5tpUrbegiX0ovYSNRP3jSkZ4W7a
 +kxav65iVq4JPRJx1AbkNktJtntXs/6pqYZglPO2oeYwgDQSSUfZfNHAA
 QmWzA1Q7a8lspgjxj2UFzVlt4PkiT0E2/9b0kECCP9zFFk74ZIaPaSvj/ g==;
X-CSE-ConnectionGUID: cSDhwfrZQJmpXlcHRBHnEw==
X-CSE-MsgGUID: FmqwektaRVmM9Hu08SS8CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33461018"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="33461018"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 21:54:30 -0800
X-CSE-ConnectionGUID: CAOn9vhiQpaP5XL0gpE6OA==
X-CSE-MsgGUID: wC3/O+TPS+O2eOj35PeEpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98677581"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 21:54:28 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Jeevan B <jeevan.b@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/4] tests/kms_display_modes: Skip test if joiner
 display is connected
Date: Wed,  4 Dec 2024 11:39:23 +0530
Message-Id: <20241204060924.1155970-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204060924.1155970-1-jeevan.b@intel.com>
References: <20241204060924.1155970-1-jeevan.b@intel.com>
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

High-resolution displays that support joiner modes can cause extended mode
tests to fail. This commit introduces a check to skip these tests if a
joiner mode display is connected, ensuring the test suite runs smoothly
without unnecessary failures.

v2: Add output name in skip message.
v3: Update logic.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_display_modes.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index f1d8ab03d..e41c60cc0 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -232,6 +232,12 @@ static void run_extendedmode_test(data_t *data) {
 
 	for_each_pipe(display, pipe1) {
 		for_each_valid_output_on_pipe(display, pipe1, output1) {
+
+			if (is_joiner_mode(data->drm_fd, output1)) {
+				igt_info("Skipping joiner output %s", output1->name);
+				continue;
+			}
+
 			for_each_pipe(display, pipe2) {
 				if (pipe1 == pipe2)
 					continue;
@@ -318,6 +324,10 @@ igt_main
 		igt_display_require_output(&data.display);
 
 		for_each_connected_output(&data.display, output) {
+			if (is_joiner_mode(data.drm_fd, output)) {
+				igt_info("Skipping joiner output %s", output->name);
+				continue;
+			}
 			data.mst_output[count++] = output;
 			if (output_is_dp_mst(&data, output, dp_mst_outputs))
 				dp_mst_outputs++;
-- 
2.25.1

