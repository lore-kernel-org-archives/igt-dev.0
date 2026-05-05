Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB8EFF885A
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 03:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3C110E021;
	Tue,  5 May 2026 03:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJKFIYin";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C71110E021
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 03:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777953061; x=1809489061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p+D7chTezWYZ7WQv8aPHzA4+BNMroJUk3kcSrnFTbEo=;
 b=dJKFIYinR4qMpD8Qqwi2MSAwVZSuJFxh9v6bDo/6aXiq8cOnVnO2+Cuy
 6mRxyuuNZny4Y3hVuKNgNWblqkWW6i14s6OD8avFl5Te7klBN55tSxVsF
 QssxQ6rwALZgKYo20NeR6J6MB+vOu8S8bQVYSpr7tcuOizSdl0jzS8bQf
 J0nKgQifmeaBrFqM6x/y5hNZlioYmQgCy4YAYtGcJNrRjMf88dcDySaYJ
 ShDuX5yeEo/fxJZ8MzJ0jHsMmo/KHv2lSjtzsJbtg/SGBFlbtcjE7qQ9G
 vc8Ip3Zs3labln9okQQIhAmHszifbybavBVv9c1TJoKY+1Hqm9+jBEJlf A==;
X-CSE-ConnectionGUID: UAhKwpWIR+W0J++UVXuYIw==
X-CSE-MsgGUID: tD4vdyDmS0CAEM8tHAulvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="104265461"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="104265461"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 20:51:01 -0700
X-CSE-ConnectionGUID: cMpGZRP2TzOqy7D8L/aTBQ==
X-CSE-MsgGUID: FeHE5gwtRCm8j4GnuR6acQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="259048901"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa002.fm.intel.com with ESMTP; 04 May 2026 20:50:59 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 2/3] tests/kms_hdr: Move test_fini() for proper
 cleanup
Date: Tue,  5 May 2026 09:31:43 +0530
Message-Id: <20260505040144.28354-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505040144.28354-1-pranay.samala@intel.com>
References: <20260505040144.28354-1-pranay.samala@intel.com>
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

Move test_fini() out of individual test functions to right
after the igt_dynamic_f() block.

Previously, if an igt_require_f() or igt_assert() inside
the dynamic subtest caused a skip or failure, test_fini()
would never execute since the longjmp exits the dynamic block.
By placing test_fini() after igt_dynamic_f(), cleanup
(pipe_crc free, fb removal, display reset) is guaranteed to
run regardless of how the dynamic subtest exits.

-v2: Remove cleanup label (Karthik)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_hdr.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index c4680298a..56d0d2cd2 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -304,8 +304,6 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 
 	/* CRC capture is clamped to 8bpc, so capture should match. */
 	igt_assert_crc_equal(&ref_crc, &new_crc);
-
-	test_fini(data);
 }
 
 /* Returns true if an output supports max bpc property. */
@@ -367,6 +365,8 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 					      test_bpc_switch_on_output(data,
 								       crtc,
 								       output, hdr_test_formats[i], flags);
+
+				test_fini(data);
 			}
 
 			/* One pipe is enough */
@@ -527,7 +527,7 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	if (flags & TEST_INVALID_HDR) {
 		igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown EOTF [0-9]+\""), 0);
-		goto cleanup;
+		return;
 	}
 
 	if (flags & TEST_BRIGHTNESS) {
@@ -562,9 +562,6 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 		igt_force_dsc_disable(data->fd, output->name);
 		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
 	}
-
-cleanup:
-	test_fini(data);
 }
 
 /* Fills some test values for HDR metadata targeting SDR. */
@@ -686,7 +683,6 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
 	}
 
-	test_fini(data);
 }
 
 static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
@@ -700,8 +696,6 @@ static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size - 1), -EINVAL);
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size * 2), -EINVAL);
-
-	test_fini(data);
 }
 
 /* Returns true if an output supports HDR metadata property. */
@@ -815,6 +809,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 					if (flags & TEST_INVALID_METADATA_SIZES)
 						test_invalid_metadata_sizes(data, output);
 				}
+
+				test_fini(data);
 			}
 
 			/* One pipe is enough */
-- 
2.34.1

