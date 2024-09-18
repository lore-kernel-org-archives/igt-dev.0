Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49780CCD19A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 11:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0354E10E1D0;
	Wed, 18 Sep 2024 11:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ON+K4niG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBE910E1D0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 11:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726657806; x=1758193806;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9JE7E+H/GF6fQ3f2RlEYSLnpqE5+JZ9AjiTyJomNLNc=;
 b=ON+K4niGi+IJFRdtKNyIDZe8xWUyYDZVoMI407G0/ONnv3TCvMbtPRWk
 fzIOIczG+E46uoh3jXqNvylFuueXDeKEar87q+utpaMwp3pPNhKXCPbVn
 VUSiqFdQpBlYsjB/oNZoZda4JCRvv8Nrf7WCxGIHdFej4Z1ZgqiVk/nHx
 Qy3nTKhSXLAvEA3daoj6eZCwkB61kQi93cZUFJ/fdCXvigw02hG3gFBDy
 FNjOzr4hGOi3xUvCYwjAVZ/pnE2MB23OEzbCIXizg5XHVVvU9Ya5vGzNz
 5lf7n19tor9ye2BXNykn6JgYI8UB95iTmzT6K5bHR5Olxw+Z9s4ZirJn6 Q==;
X-CSE-ConnectionGUID: J2stzcDeRZWHxldnlLGEVQ==
X-CSE-MsgGUID: xtFoLS/oQrGxXcDsQlIh/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25682174"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25682174"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:10:05 -0700
X-CSE-ConnectionGUID: QstmosuzTCGKeFk8oYuOeg==
X-CSE-MsgGUID: FiYUjNC9TMCwHp09RpCQeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69499894"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:10:02 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 kunal1.joshi@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v4 0/3] Add tests for ultrajoiner validation
Date: Wed, 18 Sep 2024 16:37:51 +0530
Message-Id: <20240918110754.26140-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
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

This series adds subtests to validate basic ultrajoiner modeset and
negative tests to validate invalid pipe configs on both ultrajoiner
capable display and on non ultrajoiner capable display using the force
joiner debugfs option.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (3):
  tests/kms_joiner: Add tests for ultrajoiner validation
  lib/kms: Update force joiner helpers to accomodate ultrajoiner
  tests/kms_joiner: Add subtests for force ultrajoiner validation

 lib/igt_kms.c                                 |  77 +++++-
 lib/igt_kms.h                                 |  19 +-
 .../intel/{kms_big_joiner.c => kms_joiner.c}  | 255 ++++++++++++++++--
 tests/meson.build                             |   2 +-
 4 files changed, 318 insertions(+), 35 deletions(-)
 rename tests/intel/{kms_big_joiner.c => kms_joiner.c} (61%)

-- 
2.39.1

