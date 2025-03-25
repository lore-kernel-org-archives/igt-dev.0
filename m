Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3707C36008
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 20:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B02210E058;
	Tue, 25 Mar 2025 20:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPC5I00L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1E210E058
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 20:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742932950; x=1774468950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TdBNqn4JnnsCefoW8zo2YvtbqIvZJN7iwK6cVGY9zJk=;
 b=KPC5I00LsGiTbadDKsG4RviV2BnSXL3KdxMgdc5gorArPuXN8LDMwEm4
 Em9Nnej4nMGmntl8kfCo69dhooN7QeRggEXNx17ETERdp+JGsR4h0O+sC
 b+Pirh8GrtE1w3zY6+f5H6/2j2Pm+DOTWARL1cV9AqqgL7CVjTFCEJc1n
 xguCCjx6tKNXLBX6fACWzBG7m2eP6Ahux4TTOfXJPw/pEM9vZlJiVIrXj
 VJ22o0+4koSVAMZsmqK8k1F77/nrqe1NjuRfPMJgCfQ9k9GeFkCxa6GpL
 YOWEh2qeCgQd57+do8PPg/3mxZJrX5//kYlaz6H2CWZ4Ekxuj2d3iepji Q==;
X-CSE-ConnectionGUID: LS7d0eUvSLKhxnwsvZw0dA==
X-CSE-MsgGUID: TFL4jWF+TBaQKnqG/sYCIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55565026"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="55565026"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 13:02:29 -0700
X-CSE-ConnectionGUID: w93Uo9DtQoqkbe2RV8jzVw==
X-CSE-MsgGUID: 6OmOCfbGQu2sp/QlZXF7OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124201692"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 13:02:28 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 0/2] Fix VRR multi display issue
Date: Wed, 26 Mar 2025 01:32:07 +0530
Message-ID: <20250325200209.3329037-1-ramanaidu.naladala@intel.com>
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

when use multi display config test is consider only first display
config for vrr test.

Naladala Ramanaidu (2):
  tests/kms_vrr: Fix vrr multi-display issue
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 174 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 278 +----------------------
 tests/kms_vrr.c                          |  11 +-
 3 files changed, 21 insertions(+), 442 deletions(-)

-- 
2.43.0

