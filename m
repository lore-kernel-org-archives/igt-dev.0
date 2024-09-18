Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0D7CCD1A3
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFBA10E58B;
	Wed, 18 Sep 2024 12:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZa/Av2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000C910E58A
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661139; x=1758197139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PUuhXRCrEnXhU1k4cMTTNCp6LgJPumdpSRPzWprvUmE=;
 b=LZa/Av2OyP5SRnNu1vxxaQOQ8c0gKRGKyNn1DzQvaDtXmQT/pUub8jb1
 7YIgVFRlRDy40FO+PUU25zN87q5S8GMzedBMj0LLyEDxsY8X9YnKIajKe
 9KS2JVhmE7NZmgMYHTVoA3OAflvaG2oqTTqiML729V6U63pOr6fE2VbBN
 Ejljq/ACOVtoR8pPBdoLvLCdjwbbE0CnfwP1HnXC4nv9v0spb7ijSWR4k
 0Y/OXw3kAhO7Ge7vmHl6buVC90hw6ByTtV9K6kILO2h2dzKZKmEXM93ov
 7dYk1lPtSNI9rB3EPDj4ASQaLU07Pa08gbtceu6SW+r2haHwh1a06k3sm A==;
X-CSE-ConnectionGUID: G1vl4P2hRCaTEpQAUrrnrg==
X-CSE-MsgGUID: MAslMUPQRDOtPSmlhAdyvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687524"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687524"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:05:39 -0700
X-CSE-ConnectionGUID: QAPkTfrdRM6Hj5Dxv/R/Zg==
X-CSE-MsgGUID: tUtG+IsdQdC+7IoTd+4iig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634446"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:05:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:05:36 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 06/18] lib/igt_fb: Add 10bpc compression format for
 the blitter
Date: Wed, 18 Sep 2024 15:05:06 +0300
Message-ID: <20240918120518.30258-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
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

Pick the correct compression format for the block copy when
using a 2:10:10:10 pixel format.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 7f87d40ed3d6..213ee7e9aa69 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2911,6 +2911,7 @@ const struct {
 	enum blt_compression_type type;
 	uint32_t return_value;
 } compression_mappings[] = {
+	{ DRM_FORMAT_XRGB2101010, COMPRESSION_TYPE_3D, 0xc },
 	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_3D, 0x8 },
 	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_MEDIA, 8 },
 	{ DRM_FORMAT_XYUV8888, COMPRESSION_TYPE_MEDIA, 9 },
-- 
2.44.2

