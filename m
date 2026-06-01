Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDC4CD6E4C
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 08:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BAB112F56;
	Mon,  1 Jun 2026 08:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DoU926S8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050BB112F55
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780301594; x=1811837594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=APdewfcYwwAqHcCdcX7c3HG7Z2T6RIckGMsNbGRgd94=;
 b=DoU926S80PfIE4HQ1ptwFq9oc38x8r5HioLmzZJWj7c77zLIbG2MVRAs
 n0+JSJADkaBjq6vbO+9gzn/Ij3255NitiO1dEnB4plw3c11aZ1swr5GYs
 PNM2jZy6rh7j+iUD3aJwc2YxniTQuA8jwighmp1npGBs3anqK/L7FVAYF
 Zp64YYm9KbYz5hvxg8/fVi/wJAevUJqYCldH/q043nmmunfdzUc8224HA
 oavKYC7MKHsU+vgrXhjt1dYoyYEjhr3U8rFN8m0iTNfy0N62uHo5b4OXc
 ks9elY+QLTlapD0ioIwekFgggq3x2kuAXA4rYaAURXArsibkr9qWecmcv w==;
X-CSE-ConnectionGUID: oh3zaNbZQcKcQKuJHYO8Cg==
X-CSE-MsgGUID: 2XF+br1fQLO6tWELnMAFig==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80906133"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="80906133"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 01:13:14 -0700
X-CSE-ConnectionGUID: +02Fyw0/T0We6cUWcUIdCw==
X-CSE-MsgGUID: +4iQBgnwQGe8/tbsNPs1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="245337454"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa004.fm.intel.com with ESMTP; 01 Jun 2026 01:13:12 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 0/2] Enable multi-format testing for pipe color tests
Date: Mon,  1 Jun 2026 13:54:08 +0530
Message-Id: <20260601082410.798948-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series adds multi-format coverage to kms_color pipe color tests.

To ensure deterministic behavior across YUV formats, the first patch
updates framebuffer creation to explicitly specify YCbCr encoding/range 
instead of relying on implicit defaults.

The second patch extends gamma, degamma, and CTM tests to run across
multiple pixel formats at the dynamic subtest level. This adds coverage
for format-dependent color pipeline behavior while avoiding redundant
testing on platforms where only a single format is applicable.

v2:
- Add DRM_FORMAT_P010 format

v3:
- Update commit message (Swati)

v4:
- Split the patches (Swati)

Pranay Samala (2):
  tests/kms_color: Use explicit YCbCr encoding/range in FB creation
  tests/kms_color: Add multi-format coverage for pipe color tests

 tests/kms_color.c | 225 +++++++++++++++++++++++++++++-----------------
 1 file changed, 144 insertions(+), 81 deletions(-)

-- 
2.34.1

