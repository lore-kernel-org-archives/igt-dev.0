Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8713ED25933
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 04:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B7A10E278;
	Tue, 27 Jan 2026 04:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvETv2Ol";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C0D10E272
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 04:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769487145; x=1801023145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8w2psa62mldmkW9H7cJCyIuxp9SSylZglX/PtpqWX8I=;
 b=NvETv2Oll2OeoC0BW8X6w+lXljBvCDWC0rkHReT/FqOL2AGBYLwayaAi
 G8VtXlr0osEpXUPbiCLJ646HCDQa3ybHDuMIqk4zGEk8ByJqMzoHzZxuc
 OTF4AIzrSlC8HQTG0L21qBrpUkpNbBVRCqLkyQxIr7mxXTSv8RTUEHuuV
 OeU2blS9SxSb3DfApXAEXtb9NkKM7abPkzDxgj4CUSQC0PRQQVnpK3pXU
 w4XuJ9mSdK3GWM+o/KrAgqaI2uy9eRyh+Zym8WQYGmZCF0FhUkEU2hTkz
 xhlfw+3jisMDjYIKnDh2R0gB5c36hfn6/IRn5Jz2vFiofOtMn+IotNuAk g==;
X-CSE-ConnectionGUID: n57kLKJpQvuXXGaebdHqKg==
X-CSE-MsgGUID: +UOCU9buTXGZZebfKu12yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81783923"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81783923"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 20:12:25 -0800
X-CSE-ConnectionGUID: YVlgmyEDQUeabmEfXVhGjw==
X-CSE-MsgGUID: 0+caLC5dRW24UsODRiM15A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="212724523"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 20:12:23 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused invalid_fb
 parameter
Date: Tue, 27 Jan 2026 10:02:31 +0530
Message-ID: <20260127043233.254107-8-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127043233.254107-1-sowmiya.s@intel.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
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

Remove the invalid_fb/output_fb parameter since it is not used
anywhere in the test. Reuse the fixture's input_fb for both
8-bit and 10-bit formats to simplify the setup.

v7: Remove invalid_fb in a separate patch as per review (Suraj)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 58118b8da..8d5bf5294 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -297,7 +297,7 @@ static void test_invalid_parameters(igt_output_t *output, igt_fb_t *valid_fb, ig
 	}
 }
 
-static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *invalid_fb)
+static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)
 {
 
 	int ret;
@@ -706,19 +706,11 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 			    (!strstr(igt_format_str(test_format), "BGR")))
 				continue;
 			igt_dynamic_f("writeback-fb-id-%s", igt_format_str(test_format)) {
-				igt_fb_t output_fb;
-
-				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-						      get_default_fb_format(&display, bpc),
-						      igt_fb_mod_to_tiling(0),
-						      &output_fb);
-
 				igt_skip_on(data.dump_check || data.list_modes);
 				igt_skip_on_f(!(data.supported_colors & (1 << i)),
 					      "DRM_FORMAT_%s is not supported\n",
 					      igt_format_str(test_format));
-				writeback_fb_id(output, &input_fb, &output_fb);
-				igt_remove_fb(display.drm_fd, &output_fb);
+				writeback_fb_id(output, (bpc == 8) ? &input_fb : &input_fb_10bit);
 			}
 		}
 	}
-- 
2.43.0

