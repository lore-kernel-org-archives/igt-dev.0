Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164CAEA4E27
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 08:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C018B10E95F;
	Wed,  4 Mar 2026 08:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YiKOePAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2F710E95F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 08:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772611627; x=1804147627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3nkZm6rp3Y8JjQUpRQOdn2d/qNwT85U1q7QE0an2Ses=;
 b=YiKOePAFcpEHAEnrzkCUhoV97ngJq5LYqSaWnxTI0sdAkB+B7mF3QZel
 UwiYDpHlbjV3T5PgC55+KFypSwre4LhzG+E5LH9XW4oyxWsXDXVYDZOER
 YKh/vR+h9LbUBSlSc/WKLZdpjkAL4c1vUDJssGk4WuizHqg4t9X1+JOHW
 2y00MAgHJh4ANKAo3DThzaTa/VU90+SgUAaaMlWcuerPxhfcD+8AiZ5Uv
 nWNmQKhObxABF3smuSABJ7Xt2SnuuSeAVjz0zlKKD5WoR1eDONM3z+X0N
 swuCAIDZ1c8MqoFkJ71lRrzEZAJyIaqAFQKj/BjYLbQ7pL02nBH8kjpLk w==;
X-CSE-ConnectionGUID: 4YDerpgeT2+ZhY9+qRHWJQ==
X-CSE-MsgGUID: uyGsTfd8TTa1FcLvKzbsVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73539065"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73539065"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 00:07:05 -0800
X-CSE-ConnectionGUID: 57GDTh76S8ybJ07N2Bqj/Q==
X-CSE-MsgGUID: mMqvMEOBTHymdl4on9i9wQ==
X-ExtLoop1: 1
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa003.fm.intel.com with ESMTP; 04 Mar 2026 00:07:03 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 0/2] Add helper to select non-joiner mode
Date: Wed,  4 Mar 2026 13:47:44 +0530
Message-Id: <20260304081746.2083480-1-pranay.samala@intel.com>
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

The kms_sharpness_filter test currently fails on outputs that default to
joiner modes. This series adds a helper function to find suitable mode 
that doesn't require Bigjoiner/Ultrajoiner, and uses it in the test to 
switch to non-joiner mode instead, allowing the test to run successfully 
and avoid false failures.

Pranay Samala (2):
  lib/igt_kms: Add helper to get non-joiner mode
  tests/intel/kms_sharpness_filter: Detect and bypass joiner modes

 lib/igt_kms.c                      | 31 ++++++++++++++++++++++++++++++
 lib/igt_kms.h                      |  1 +
 tests/intel/kms_sharpness_filter.c | 16 +++++++++++++++
 3 files changed, 48 insertions(+)

-- 
2.34.1

