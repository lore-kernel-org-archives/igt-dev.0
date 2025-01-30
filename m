Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF88C0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 23:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B6F10E9F8;
	Thu, 30 Jan 2025 23:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koMq3Bx4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE1010E0ED
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 23:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738280233; x=1769816233;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xv3w3budoPeQoYEYblAO/VXiuSsFZkSOJKhjUtUdLqg=;
 b=koMq3Bx4PfUJWDE6JHJkA2Wnet8ejNdQKdLmQ3VFaZcHLP4kluuwGiI0
 wCk6B9iuBhQIf8bt2zrNjffWo88DENVKKKv4WKPjncNWC2LMFnFR/2vbR
 TNDn1y8PZAVjwnJM4dhA2ge2GtLmqDSQ8R7JEYjlKQgb+VJdq3LsF6Sjp
 5SxPXkoXrYQLXTziGQlhMzph4QZI6jq6cqmRbRzuwLlTRMOLY+iwUzD7j
 E1WcGrBCT0h3N05bOiak7iUXnvC7n7rgEbBy8YbZ5HxsZFirOyyJkvBiv
 apvw9phNB77bLXWHobHZSNZJCddDWbfMdddhCjkVkablVo0gEtPFLrkpj Q==;
X-CSE-ConnectionGUID: iDTEI1kjQpCeTXLMcWrMNg==
X-CSE-MsgGUID: oQRWzbkdTDOVbIEUDgDfxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="56278794"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="56278794"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 15:37:13 -0800
X-CSE-ConnectionGUID: cHNUuecaSq+84j1NHA5G9g==
X-CSE-MsgGUID: dRoTDz7lRgetSylurtwi1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="109619102"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 15:37:11 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] Add DRRS verification in VRR test
Date: Fri, 31 Jan 2025 05:22:44 +0530
Message-Id: <20250130235246.4142758-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add a check to validate DRRS switching.

Naladala Ramanaidu (2):
  tests/kms_vrr: Add function to return vblank timestamp
  tests/kms_vrr: Add DRRS verification in seamless RR test

 tests/kms_vrr.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 6 deletions(-)

-- 
2.25.1

