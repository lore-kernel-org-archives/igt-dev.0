Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1A9CD3424
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 04:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0939410EC6F;
	Wed,  6 May 2026 04:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1ZfK0Oe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F0010E0E0
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 04:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778040283; x=1809576283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BB3+knCjr6FDukYx+R9zn/rtcyBrs70k8ADtt5AqaFI=;
 b=Y1ZfK0OeaV22A/3gTFSsV93YA131ELEAEhbnyCGsUX0JdRCZ4JvWR9Aw
 IG52WvTHH8W3u8GO09QSn3FxJZvzEX0ADjZM76ewX6UbP8pHpQetKLC35
 QUyCmx8kU4P/baDyw2jHo0TeZVAeip/J1QyJW8EhRvmJ+In9ZiGPsp6Zb
 7hJu7rBoYQbMeqe8TXO7VBZFlGNhV+OhvvTyXC6/HDN7sbcOkNGLVfUCa
 pCb1RnXGQYsx2LCPBA6xLnCApDxIKJrXCOEkS1L0H3NnW+j14EcF8Q9wl
 JJyf49DS8vxLIEkw7xW3Afy5x/vpF2pl5laGXVCpMQT7lp1CvFjOYqGcX w==;
X-CSE-ConnectionGUID: /RTcR/ijQbm8+G7tcU65Yw==
X-CSE-MsgGUID: rAneS9vkRHu9f/J8C0+VwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104381085"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="104381085"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 21:04:43 -0700
X-CSE-ConnectionGUID: +MOX+VfKQnW4pDTveAivCA==
X-CSE-MsgGUID: Wu6kMal2TqCBNQF4xdbQrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="235010139"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa006.jf.intel.com with ESMTP; 05 May 2026 21:04:41 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 2/3] tests/kms_hdr: Move test_fini() for proper
 cleanup
Date: Wed,  6 May 2026 09:45:26 +0530
Message-Id: <20260506041527.56862-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506041527.56862-1-pranay.samala@intel.com>
References: <20260506041527.56862-1-pranay.samala@intel.com>
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

v2:
- Remove cleanup label (Karthik)

v3:
- Rebase

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_hdr.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 3cd14c074..ded375a23 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -236,8 +236,6 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 
 	/* CRC capture is clamped to 8bpc, so capture should match. */
 	igt_assert_crc_equal(&ref_crc, &new_crc);
-
-	test_fini(data);
 }
 
 /* Returns true if an output supports max bpc property. */
@@ -299,6 +297,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 					      test_bpc_switch_on_output(data,
 								       crtc,
 								       output, hdr_test_formats[i], flags);
+				test_fini(data);
 			}
 
 			/* One pipe is enough */
@@ -384,7 +383,7 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	if (flags & TEST_INVALID_HDR) {
 		igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown EOTF [0-9]+\""), 0);
-		goto cleanup;
+		return;
 	}
 
 	if (flags & TEST_BRIGHTNESS) {
@@ -419,9 +418,6 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 		igt_force_dsc_disable(data->fd, data->output->name);
 		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
 	}
-
-cleanup:
-	test_fini(data);
 }
 
 static void test_static_swap(data_t *data, igt_crtc_t *crtc,
@@ -511,8 +507,6 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 		igt_force_dsc_disable(data->fd, data->output->name);
 		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
 	}
-
-	test_fini(data);
 }
 
 static void test_invalid_metadata_sizes(data_t *data)
@@ -526,8 +520,6 @@ static void test_invalid_metadata_sizes(data_t *data)
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size - 1), -EINVAL);
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size * 2), -EINVAL);
-
-	test_fini(data);
 }
 
 static void test_hdr(data_t *data, uint32_t flags)
@@ -635,6 +627,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 					if (flags & TEST_INVALID_METADATA_SIZES)
 						test_invalid_metadata_sizes(data);
 				}
+
+				test_fini(data);
 			}
 
 			/* One pipe is enough */
-- 
2.34.1

