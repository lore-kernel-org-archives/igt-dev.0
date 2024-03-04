Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62A3C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 10:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C2C10E54A;
	Mon,  4 Mar 2024 10:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmZSBf9X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEF110E54A
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 10:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709549727; x=1741085727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=corUu5JPh3GfznF3GELoCUbhrvcKAxSZ5IpCdYREcu4=;
 b=EmZSBf9XLHEKN1YS6oCr+uShF1xOfYO21TkkKQZxl1jOY2HtOrLpnVMS
 s5qxC0K9XH4Zm5apcSgKpkpoA9W4Z9NUOPNkkv6iNVHM7EAMqNqtQ7Hfn
 fZ+Za5y30Z1Yswx9jDA2iaDgHiKVHbW6DC2rskIsk3carukfn3LpJ2apy
 QVE2P286H1U08L0G38dqJswy358M6+gwz5rH78XTLZxOMEDD2BlJK6O/w
 +YA35fJRVdXnvPSItQ5v+NEm1y9uMrFUBWyAqGCjhcCGO6Jxxol7oa78T
 B21I7GDWFkcbSr2RIFKf3WEe3nwFiWGz7p5PkVzzoIwWvSF+RNZ2TG/j7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="21493445"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="21493445"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8867937"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:53:20 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/2] HAX: Test CCS tests in BAT
Date: Mon,  4 Mar 2024 16:17:10 +0530
Message-ID: <20240304104710.3253030-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304104710.3253030-1-bhanuprakash.modem@intel.com>
References: <20240304104710.3253030-1-bhanuprakash.modem@intel.com>
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 28 ++++++++++++++++++++++++
 tests/intel-ci/xe-fast-feedback.testlist | 19 ++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..0f6a3b882 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -55,6 +55,34 @@ igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
 igt@i915_pciid
+igt@kms_async_flips@async-flip-with-page-flip-events
+igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs
+igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs
+igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs
+igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs
+igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs
+igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs
+igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs
+igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs
+igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs
+igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs
+igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs
+igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs
+igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs
+igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs
+igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs
+igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs
+igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs
+igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs
+igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs
+igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs
+igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs
+igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs
+igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs
+igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs
+igt@kms_flip_tiling@flip-change-tiling
+igt@kms_plane@pixel-format
+igt@kms_plane@pixel-format-source-clamping
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 17863b6b1..5a55d60f8 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -164,6 +164,25 @@ igt@xe_pat@pat-index-xe2
 igt@xe_waitfence@abstime
 igt@xe_waitfence@engine
 igt@xe_waitfence@reltime
+igt@kms_async_flips@async-flip-with-page-flip-events
+igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs
+igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs
+igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs
+igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs
+igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs
+igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs
+igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs
+igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs
+igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs
+igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs
+igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs
+igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs
+igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs
+igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs
+igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs
+igt@kms_flip_tiling@flip-change-tiling
+igt@kms_plane@pixel-format
+igt@kms_plane@pixel-format-source-clamping
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
-- 
2.43.0

