Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1149DCD6E74
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 06:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA1C11A467;
	Fri,  5 Jun 2026 06:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hM3F2+Pj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747CB112AAA
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 06:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780641008; x=1812177008;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=brGX6O6WkMWcy/k6C4f9DYl6NLJyJv23YnkGGENTlDY=;
 b=hM3F2+PjwEedIK0U15tBXyMQ1Chhw+2KZvJ/FOrDbMJugNcU0HOKvkKU
 gYDXrHldMl9mFPEwYuOBB7ULMNpxOljTBt0QKGPSQ2fXc95dwqcXoXdCv
 UWKeCGtrhkZDYqlscpHJ1510FsAxXCWOr8aCmGQQ3Q0nw2hV7v1nO6wNP
 F4848MHoPe71jDy/H64pEPSHnVLiwSmaZEorBGQOXvsZ8B5pZcRsyZunZ
 Q1AFrD4esocKg405XHZ4W0QYISO3/vk7+dLdaQ9ifwUcI1gPaosWcXdpt
 eQJnc5Bh55O85Sskvuii4IXK/adcPctSOm/zFJoJ3emJYmVut1MoT5WTY g==;
X-CSE-ConnectionGUID: /y89FpGnSTmsGvhreaAFyQ==
X-CSE-MsgGUID: jBGUzpNkQH+A34GHz7SGBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85362744"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="85362744"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 23:30:08 -0700
X-CSE-ConnectionGUID: rJ4SgB48ShSi+lLW/rk6kA==
X-CSE-MsgGUID: dhrXI9zdQ1a8M1MJDV5hXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="240576113"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa010.fm.intel.com with ESMTP; 04 Jun 2026 23:30:06 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v5 0/2] Enable multi-format testing for pipe color tests
Date: Fri,  5 Jun 2026 12:11:01 +0530
Message-Id: <20260605064103.855630-1-pranay.samala@intel.com>
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

v5:
- Consolidate format structure with bpc info (Swati)
- Move format support check out of dynamic subtest scope (Swati)
- Add a common FB helper to centralize framebuffer creation (Swati)
- Keep RGB formats on the existing igt_create_fb() path (Swati)
- Use explicit range/encoding only for YUV formats (Swati)

Pranay Samala (2):
  tests/kms_color: Prepare FB creation for explicit YUV color range
    handling
  tests/kms_color: Add multi-format coverage for pipe color tests

 tests/kms_color.c | 221 ++++++++++++++++++++++++----------------------
 1 file changed, 117 insertions(+), 104 deletions(-)

-- 
2.34.1

