Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E50CEBF8E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 10:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEAB10E1F7;
	Fri, 27 Sep 2024 10:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOsV8huf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463C410E1F7
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 10:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727432482; x=1758968482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n2paFyV68hJQbOkS9PsY5Y7sWiW6h+WmmZHW7xLrFuY=;
 b=QOsV8hufsfyuMohujW++lYsudqDn93bgQXGjGNtYrmB9pFXLnOnwpj8q
 9jeuRbwEUm3MwUTwFR+zSwXrbGBG6PI9GEtn9LEq3DlmQix++yt4veYng
 d+0h6krHgMSvu2qVZ9nBLVaElBBPZaEgUYKeFDeHVdic2pJkG4WtfCX6t
 kN7lvDkOF2EswoWvt2+HHSRSC0uJcPZizcc0PNUoRysKRLWwEDScX1qMM
 v36hxHuufWTq1AAhEz+Jj9RE2vDvDp0Wpy2MaTZIf6iJ41SMZKtGRcl8j
 IzZpBF391+eptCAul/rVj6sITJZPr3uS/lz4Tu71iASEMT3uvHEIumvse A==;
X-CSE-ConnectionGUID: NljmJRYITR6OfZQfP5N3Ag==
X-CSE-MsgGUID: N7sbmbXLRi+CRcCgHXVhMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37137189"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="37137189"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 03:21:21 -0700
X-CSE-ConnectionGUID: rcyLR9MlRUeBsZvec2Z7Jg==
X-CSE-MsgGUID: Cz4T7L+yRcKDU975vpSdBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="73283220"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 03:21:20 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 0/2] Backlight control on HDR-enabled eDP panels
Date: Fri, 27 Sep 2024 15:50:36 +0530
Message-Id: <20240927102038.1001578-1-santhosh.reddy.guddati@intel.com>
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

Validate backlight control by changing brightness on HDR enabled eDP
panels via sysfs.

Santhosh Reddy Guddati (2):
  tests/kms_hdr: Add brightness tests for hdr
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 183 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 289 +----------------------
 tests/kms_hdr.c                          | 144 +++++++++++
 3 files changed, 168 insertions(+), 448 deletions(-)

-- 
2.34.1

