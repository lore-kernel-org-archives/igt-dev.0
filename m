Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7021CD6D229
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 19:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4F910E1D4;
	Wed, 27 Nov 2024 19:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1mF0CZ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9CC10E1D4
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 19:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732734411; x=1764270411;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B4+7gunf7UoHOkVbKs/6QF6UqxxovTnoF5HQt0nIFtU=;
 b=I1mF0CZ9Beabz+jVN1NHlXVoFPv03iXrM7IyehUUiG6aleUia+PPpqe9
 jAPc5UDfJnx/7dlCQhaQeujZqxKLNs8OqFTUXTvmpG+JynANNyDOPbUe3
 h/R/1a4FttCYRwt5z7V5VMbn4NzAEnFvg2E9+0lcf8YnS3Ovs8XwJk5n4
 R7N/Vu7n2V41wL+/Wn+tgpkg2E3vNFGCNnampPPcvxlQ9sG6M1IZAKCho
 +XF8CDen18JryXDjncyT4qVCprlVkBfvtbt3p8DKoqqxrf/uHdvWMnD8p
 aejmP5rV5sML+Hmwcd9/tabt7Tvvxwjhq6/LKj5hm6J/DP7DU9hizHTnR Q==;
X-CSE-ConnectionGUID: QLnnHju8QWi1oIPFyJiVzw==
X-CSE-MsgGUID: xc1WCFvUSSOPJoFsu4IIyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="50355533"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="50355533"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 11:06:51 -0800
X-CSE-ConnectionGUID: MjiyOo7GSBaPya5hGzr57A==
X-CSE-MsgGUID: nzccsXRwQOKTm6b76FuPQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="122851634"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 11:06:50 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 0/2] Update skip messages in scaling modes
Date: Thu, 28 Nov 2024 00:35:28 +0530
Message-ID: <20241127190530.3421021-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

These changes improve the clarity of test logs, making it easier
to understand why certain tests are skipped.

Naladala Ramanaidu (2):
  tests/kms_scaling_modes: Add informative messages for skipped scaling
    mode tests
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 171 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 282 +----------------------
 tests/kms_scaling_modes.c                |   9 +-
 3 files changed, 15 insertions(+), 447 deletions(-)

-- 
2.43.0

