Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1BBE9D418
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FB310E6F6;
	Wed,  4 Feb 2026 16:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EF/Y3G53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F94A10E6F5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770224294; x=1801760294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gjyALV/bRR2FR+rYv8uPriUQRbHcjASEGCjD3UbaVVQ=;
 b=EF/Y3G5307AOaFVTA1MBVcwA0ka12+YqytlkYGK9fE+CWkyFs6M3W+bu
 d9zky01zrd6Hm55RebBA+xAYv2p/lEk531k14RlZ3e9bPCPPFrGOQ4ujE
 /KwiAMLEx1MizuHeFLfre9xPNSAYcovepb06mUNG0QcbgutcxdCyeMhRm
 eCtQ+jz2/WUwHfTaCFp7jojbVbPUJAWxJMtJJ14z8pq7arPb36h+7NMay
 CqP8CAc7N9YnAsJXuIyx9Jw1TIIM2tl4t+gCTGdxA2lkIp4HMzHuhVyhd
 NqmT3bT0N6XhiXqqUgYlBtsA2ScyMHJDDdrQOsj8xYe8vhtzt7ZrG58Cl A==;
X-CSE-ConnectionGUID: h33KZr8mRz+IyRB7mSHO1Q==
X-CSE-MsgGUID: IpHORWtrSyGERECu8KRsag==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71580090"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71580090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:57:57 -0800
X-CSE-ConnectionGUID: GHF327T+TYe2pAcrGf4C2A==
X-CSE-MsgGUID: GtPQ+YtVQ4SLI0qM8Tfx6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210253022"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:57:55 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v8 7/9] tests/kms_writeback: Refactor writeback-fb-id
 subtest
Date: Wed,  4 Feb 2026 22:48:16 +0530
Message-ID: <20260204171819.292327-8-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204171819.292327-1-sowmiya.s@intel.com>
References: <20260204171819.292327-1-sowmiya.s@intel.com>
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

Remove individual tests for each format for the
test writeback-fb-id and introduce dynamic subtest
generation based on the formats supported. Framebuffer
creation was now part of the subtest level based on format.

v4: squashed the FB creation function with this commit (Suraj)
v5: -Update dynamic subtest documentation (Suraj)
    -Rename input_fb to in_fb
    -Set plane to in_fb and remove unused input_fb as an arg to
     writeback-fb-id function.
v6: -Remove in_fb inside subtest and reuse input_fb from
     fixture (Suraj)
v7: -Join nested if conditions (Suraj)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_writeback.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 0c423d58c..d17e2df47 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -51,9 +51,6 @@
  * SUBTEST: writeback-check-output
  * Description: Check writeback output with CRC validation
  *
- * SUBTEST: writeback-fb-id-XRGB2101010
- * Description: Validate WRITEBACK_FB_ID with valid and invalid options
- *
  * SUBTEST: writeback-fb-id
  * Description: Validate WRITEBACK_FB_ID with valid and invalid options
  *
@@ -700,17 +697,23 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
-	igt_subtest("writeback-fb-id") {
-		igt_skip_on(data.dump_check || data.list_modes);
-		igt_skip_on_f(!(data.supported_colors & XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
-		writeback_fb_id(output, &input_fb);
-	}
+	igt_subtest_with_dynamic_f("writeback-fb-id") {
+		for (int i = 0; i < ARRAY_SIZE(fourcc); i++) {
+			uint32_t test_format = fourcc[i];
 
-	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid and invalid options");
-	igt_subtest("writeback-fb-id-XRGB2101010") {
-		igt_skip_on(data.dump_check || data.list_modes);
-		igt_skip_on_f(!(data.supported_colors & XRGB2101010), "DRM_FORMAT_XRGB2101010 is unsupported\n");
-		writeback_fb_id(output, &input_fb_10bit);
+			if (is_intel_device(display.drm_fd) &&
+			    (!strstr(igt_format_str(test_format), "BGR")))
+				continue;
+			igt_dynamic_f("writeback-fb-id-%s", igt_format_str(test_format)) {
+				int bpc = igt_drm_format_get_bpc(test_format);
+
+				igt_skip_on(data.dump_check || data.list_modes);
+				igt_skip_on_f(!(data.supported_colors & (1 << i)),
+					      "DRM_FORMAT_%s is not supported\n",
+					      igt_format_str(test_format));
+				writeback_fb_id(output, (bpc == 8) ? &input_fb : &input_fb_10bit);
+			}
+		}
 	}
 
 	igt_describe("Check writeback output with CRC validation");
-- 
2.43.0

