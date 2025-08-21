Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DF6CA0FE0
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 09:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71E110E911;
	Thu, 21 Aug 2025 09:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nR5m5fNd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0499E10E91F
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 09:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755769971; x=1787305971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LRznxVUR/Doj0r7kC4csNqqkyWO9BYE95aJ57GzAwac=;
 b=nR5m5fNdAbEFQyt0wQ5S+FbjVFNJr/Plsw9aRgjuvFAUXszyp97b9TVS
 dAsyjtbDT70zdTDRuvhMnVVsmW4ArBh+6AbWhxRCYYOJOto7Zpxhhs8Wa
 zaKyZZ/3Gn6LvxE/elcrLxnZs2djqtsM7TluyxJQttNqeQwGyon7fxaLy
 y2SMTPtCgHp7kddOp3Z8ZpUxue+5N7a7GDg+jjYboDedFLaYEVUTVesE8
 j/gs/+WdJrh+Dt1ZRE88xfUa3750YESTw2OEeGPnu88iMBR5E96eQN3te
 YqgrM2M1NQIGNWN07xLu+x1ogzNGEqNdyUQcYWTTI2jaTpokdAMufkl5/ w==;
X-CSE-ConnectionGUID: kA0RiJzDQQedby7quOnZfQ==
X-CSE-MsgGUID: 5JaBVnOITZCgYW2nBHsecQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69155414"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="69155414"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 02:52:51 -0700
X-CSE-ConnectionGUID: FLClYjNNQMSXCqjQeWhG6w==
X-CSE-MsgGUID: zB1int1pRbS6S9HCknxYLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="168733035"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2025 02:52:49 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, karthik.b.s@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH v2 i-g-t 3/3] tests/kms_hdr: Handle HDR panels requiring DSC
Date: Thu, 21 Aug 2025 15:05:11 +0530
Message-Id: <20250821093511.937552-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250821093511.937552-1-chaitanya.kumar.borah@intel.com>
References: <20250821093511.937552-1-chaitanya.kumar.borah@intel.com>
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

Some panels needs DSC to support HDR (at least in higher modes).
In cases like these the output bpc and crc comparison fails if
the SDR/non-HDR mode does not require DSC. Therefore, force DSC
when in SDR mode so that output bpc and crc can be compared.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_hdr.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index ee64543a0..a9adf2e94 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -97,6 +97,7 @@ enum {
 	TEST_INVALID_METADATA_SIZES = 1 << 4,
 	TEST_INVALID_HDR = 1 << 5,
 	TEST_BRIGHTNESS = 1 << 6,
+	TEST_NEEDS_DSC = 1 << 7,
 };
 
 /* BPC connector state. */
@@ -491,9 +492,20 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 	igt_plane_set_size(data->primary, data->w, data->h);
 	set_hdr_output_metadata(data, NULL);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+
+	if (flags & TEST_NEEDS_DSC) {
+		igt_force_dsc_enable(data->fd, output->name);
+		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
+	}
+
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
 
+	if (flags & TEST_NEEDS_DSC) {
+		igt_force_dsc_disable(data->fd, output->name);
+		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
+	}
+
 	/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
 	set_hdr_output_metadata(data, &hdr);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
@@ -518,11 +530,22 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 	/* Disable HDR metadata and drop back to 8bpc. We expect a modeset for exiting. */
 	set_hdr_output_metadata(data, NULL);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+
+	if (flags & TEST_NEEDS_DSC) {
+		igt_force_dsc_enable(data->fd, output->name);
+		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
+	}
+
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
 
 	igt_assert_crc_equal(&ref_crc, &new_crc);
 
+	if (flags & TEST_NEEDS_DSC) {
+		igt_force_dsc_disable(data->fd, output->name);
+		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
+	}
+
 cleanup:
 	test_fini(data);
 	igt_remove_fb(data->fd, &afb);
@@ -558,7 +581,7 @@ static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
 	meta->hdmi_metadata_type1.max_cll = 0;
 }
 
-static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
+static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, new_crc;
@@ -577,9 +600,20 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_plane_set_fb(data->primary, &afb);
 	igt_plane_set_size(data->primary, data->w, data->h);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+
+	if (flags & TEST_NEEDS_DSC) {
+		igt_force_dsc_enable(data->fd, output->name);
+		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
+	}
+
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
 
+	if (flags & TEST_NEEDS_DSC) {
+		igt_force_dsc_disable(data->fd, output->name);
+		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
+	}
+
 	/* Enter HDR, a modeset is allowed here. */
 	fill_hdr_output_metadata_st2048(&hdr);
 	set_hdr_output_metadata(data, &hdr);
@@ -602,6 +636,10 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
 	else
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
+	if (flags & TEST_NEEDS_DSC) {
+		igt_force_dsc_enable(data->fd, output->name);
+		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
+	}
 	/* Enter SDR via metadata, no modeset allowed for
 	 * amd driver, whereas a modeset is required for
 	 * intel driver. */
@@ -623,6 +661,11 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
 	/* Verify that the CRC didn't change while cycling metadata. */
 	igt_assert_crc_equal(&ref_crc, &new_crc);
 
+	if (flags & TEST_NEEDS_DSC) {
+		igt_force_dsc_disable(data->fd, output->name);
+		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
+	}
+
 	test_fini(data);
 	igt_remove_fb(data->fd, &afb);
 }
@@ -717,6 +760,11 @@ static void test_hdr(data_t *data, uint32_t flags)
 				break;
 			}
 
+			if (igt_is_dsc_enabled(data->fd, output->name))
+				flags |= TEST_NEEDS_DSC;
+			else
+				flags &= ~TEST_NEEDS_DSC;
+
 			set_hdr_output_metadata(data, NULL);
 			igt_display_commit2(display, display->is_atomic ?
 					    COMMIT_ATOMIC : COMMIT_LEGACY);
@@ -731,7 +779,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 					     TEST_INVALID_HDR | TEST_BRIGHTNESS))
 					test_static_toggle(data, pipe, output, flags);
 				if (flags & TEST_SWAP)
-					test_static_swap(data, pipe, output);
+					test_static_swap(data, pipe, output, flags);
 				if (flags & TEST_INVALID_METADATA_SIZES)
 					test_invalid_metadata_sizes(data, output);
 			}
-- 
2.25.1

