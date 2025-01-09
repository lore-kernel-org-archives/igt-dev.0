Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4574E77199
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 20:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FA310E051;
	Thu,  9 Jan 2025 20:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XIu13c++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3A210E051
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 20:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736453457; x=1767989457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=45PO1tChnIrU7fcNDS5fbmYDF0BJf/PaXx07341B1v0=;
 b=XIu13c++1xncAHN3+jlSbYZJZDQvByaibkjqBoTEtNPgD6eCF3gC9GRZ
 caixcp0M4ugvY0/HP/68ALAOTQolAsVk3NZKWXojcXnlUkXowfTtGrxX0
 B0aC0YqkLK/bskFF4vFzsDQaPFazG+OXQrjZs1jiWdqvhVPOe8wilW/x2
 WPbN9zxuZL0NY9fc0PyXWxgorE+JhHZEw/m1lDTOTv9+RTLSZjoYrPwAe
 T/LwjwyEqY9rHdX5zNfUUyg+JiAbaOPbkjtfitK3YzjAw8n28bHfWCWgi
 bDqCY6AKWnrxkx4lB/6qY0Muwd1z0lAMwRyZITXziND+mCzd8MpKC0+YW w==;
X-CSE-ConnectionGUID: KF8skgBKQUSyGkxDf/Obqg==
X-CSE-MsgGUID: B3807nq5QPO8v718c1EAdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47312943"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="47312943"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:10:56 -0800
X-CSE-ConnectionGUID: +ugwkqCwTtekVZYjIUtiug==
X-CSE-MsgGUID: Hg9TcCiLQQaoRIQbHu+hLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="108421180"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 12:10:55 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 0/2] Remove redundant hotplug detection assertion
Date: Fri, 10 Jan 2025 01:39:09 +0530
Message-ID: <20250109200911.1243517-1-ramanaidu.naladala@intel.com>
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

Remove Hotplug assertion from chamelium edid test.

Naladala Ramanaidu (2):
  tests/chamelium/kms_chamelium_edid: Fix hotplug detection with
    connector reprobe
  HAX patch do not merge

 tests/chamelium/kms_chamelium_edid.c     |   4 +-
 tests/intel-ci/fast-feedback.testlist    | 171 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 276 +----------------------
 3 files changed, 10 insertions(+), 441 deletions(-)

-- 
2.43.0

