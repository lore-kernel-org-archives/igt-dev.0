Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF2CCD98F0
	for <igt-dev@archiver.kernel.org>; Sun, 21 Jun 2026 18:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5299C10E3CF;
	Sun, 21 Jun 2026 18:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7FKt3T4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E42488668
 for <igt-dev@lists.freedesktop.org>; Sun, 21 Jun 2026 18:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782065648; x=1813601648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LRHCiUuL/UvNQN2ipJkd8xctpUefM5+/xYIvPrN3C1s=;
 b=B7FKt3T4wVGT9TSfYqPUyiJ7SjX+to66rUncXu9LcgYXL2/btc0EWc+x
 mMoe6VoERVgB1d50jmHZM3kqjpkWMnfDXKv3DbB/Lfqloj7I37Ki1YceL
 GhstAJQZ2UUkrdijAsZv46u3vCRxWerN23Ie9EXHXYlQ9w21ZsK3W3RQP
 PD3b5BKda9WBcyz9vPwCAUI5R4io1FRi7Plm9POnjTUmUPuME74lpjfq3
 d7C9DgQvbMJe7oAc/zEcQPbOq4EZc5qP8/GCk/e51C14iUrYYAXMBQ21W
 Gf/dxCiszdNwSUi3ETNx42NWB+Q+vZsL2/rgFmV5d1tR3ziD9sLkyO+NE w==;
X-CSE-ConnectionGUID: 7nLakmkcQFidWP1j/HQ9bQ==
X-CSE-MsgGUID: mE+9iPesQ5KpBByEJP23pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="94200606"
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; d="scan'208";a="94200606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 11:14:07 -0700
X-CSE-ConnectionGUID: DJQUCgYkQHSZbewRzES77g==
X-CSE-MsgGUID: djgog3/JS9+PFOBO6WMZlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; d="scan'208";a="244695298"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jun 2026 11:14:06 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v6 0/2] Enable multi-format testing for pipe color tests
Date: Sun, 21 Jun 2026 23:55:04 +0530
Message-Id: <20260621182506.2970102-1-pranay.samala@intel.com>
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

v6:
- Add FP16 format to the format list
- Combine declaration and assignment for mtk_10bpc_only (Swati)
- Use per-format depth in gamma/degamma tests for 10-bit accuracy (Swati)
- Rename fb creation helper name (Swati)
- Make YCbCr encoding and range explicit helper parameters (Swati)

Pranay Samala (2):
  tests/kms_color: Prepare FB creation for explicit YUV color range
    handling
  tests/kms_color: Add multi-format coverage for pipe color tests

 tests/kms_color.c | 264 +++++++++++++++++++++++++++-------------------
 1 file changed, 153 insertions(+), 111 deletions(-)

-- 
2.34.1

