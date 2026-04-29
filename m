Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D13CFF8867
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 09:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A45D10EF2E;
	Wed, 29 Apr 2026 09:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUfkY0PX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA40B10EF12
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777454951; x=1808990951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AFHIuVM9HYtg+48w+Qf5yz67RuTFb/jnMdA/glD0OtE=;
 b=jUfkY0PXAwZGKIGmGcTPW1Nd7WJDszsQXPAArZaFfnyJdvrFNHXma1nS
 Py+qDzroWMVqbX+qoWcmK1tmF2JJFEQ/sIJVyhgf4dVf1uEbo8+gU01Sg
 YLqfB5HS3/xndb0XeCSBSXRmRJUSmdPnKCML3WqszzM1Tm+GhN1oVRdf3
 02Q4HWDN4doWbsRQ/Wjs65QGKYFM/1QiW1lgyvxStCv986Ukt13NjUKkI
 UF2hovWVIEz4aCc071xfa/mrw2wNWIFRK8zrzcbFhn4bVn4B92PI58BeT
 O+wO38uGbCLvM/CNc+3TXU7XOM5PGYutHglA8SkD3AIFQjDwOJfBsrecB g==;
X-CSE-ConnectionGUID: i6LJTkl0QHuiem2N5aQz4Q==
X-CSE-MsgGUID: B3Dlo8hBTR2Qlo6yAhTwPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95798164"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="95798164"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:29:11 -0700
X-CSE-ConnectionGUID: haiHe6j4TKylYf48CsUxHw==
X-CSE-MsgGUID: gLPTx0JAQZeTJCh3O5DHpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="234223144"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa009.jf.intel.com with ESMTP; 29 Apr 2026 02:29:10 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 2/3] tests/kms_hdr: Move test_fini() for proper cleanup
Date: Wed, 29 Apr 2026 15:09:54 +0530
Message-Id: <20260429093955.3726263-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429093955.3726263-1-pranay.samala@intel.com>
References: <20260429093955.3726263-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_hdr.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index c4680298a..e880b280e 100644
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
@@ -564,7 +564,7 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 	}
 
 cleanup:
-	test_fini(data);
+	return;
 }
 
 /* Fills some test values for HDR metadata targeting SDR. */
@@ -686,7 +686,6 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
 	}
 
-	test_fini(data);
 }
 
 static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
@@ -700,8 +699,6 @@ static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size - 1), -EINVAL);
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size * 2), -EINVAL);
-
-	test_fini(data);
 }
 
 /* Returns true if an output supports HDR metadata property. */
@@ -815,6 +812,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 					if (flags & TEST_INVALID_METADATA_SIZES)
 						test_invalid_metadata_sizes(data, output);
 				}
+
+				test_fini(data);
 			}
 
 			/* One pipe is enough */
-- 
2.34.1

