Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED13CF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 20:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC7010E496;
	Mon, 23 Sep 2024 20:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVlgS7dr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E55810E496
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 20:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727124366; x=1758660366;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lxeL/QHCaolTpDIczJEypmbOOXanaSwr4xRYTPOtfnk=;
 b=QVlgS7dr/8GAwpm4ji1i9cZEOdGX/OOQqiqfpBIplWpyEmsSLmdmRvAO
 hReLUWro8fXskRirvU9ipG/ymh1C4MEQ0luAn6127R3Pr3wWYE/ZZXFLN
 c5BmOC59vueDwST/83brWCjBzrJu4Y5NQETGjB3HII3dYd7KZEStG91hH
 8ZCbvl3ZrFzQ8ojyBjjxK+ceVgKri6H0p1s3+ZMbB989+rku9Cb4K/vQq
 JOPaGL1UC4kwtKvwSQQWDe7Efzu5gC2q/AOkn/Nc6SXVi1kZD2uQhtaq5
 Olpond8t1q3Q5wjUSAJYfAxRK8eE8Xc7EW3RjXHV4wvgL4Q7XRxKg9EEI w==;
X-CSE-ConnectionGUID: /qI+rxXBTUiArER43gPn3Q==
X-CSE-MsgGUID: APHBIXshR3mQhzmQTXvTag==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25955990"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="25955990"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:46:06 -0700
X-CSE-ConnectionGUID: 4xKkN7enQAeSIaOJzkpIEg==
X-CSE-MsgGUID: pfj0b/uPTC+nSd79uhLpDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71326700"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 13:46:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 23:46:03 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/6] tests/kms_frontbuffer_tracking: Simplify tiling vs.
 platform tests
Date: Mon, 23 Sep 2024 23:45:53 +0300
Message-ID: <20240923204557.32123-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
References: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The gen12+ check seems pointless when we already check for
4tile specifically, so just get rid of it. Also drop the
redundant comments.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index f1bef9ab85ff..0646af62e51c 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4766,17 +4766,13 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 					igt_require(igt_draw_supports_method(drm.fd, t.method));
 
-					/* Tiling Y is only supported on GEN9+ */
 					if (t.tiling == TILING_Y) {
 						igt_require(AT_LEAST_GEN(drm.devid, 9));
 						igt_require(!intel_get_device_info(drm.devid)->has_4tile);
 					}
 
-					/* Tiling 4 is only supported on GEN12+ */
-					if (t.tiling == TILING_4) {
-						igt_require(AT_LEAST_GEN(drm.devid, 12));
+					if (t.tiling == TILING_4)
 						igt_require(intel_get_device_info(drm.devid)->has_4tile);
-					}
 
 					if (tiling_is_valid(t.feature, t.tiling))
 						draw_subtest(&t);
-- 
2.44.2

