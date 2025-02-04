Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4A4C02193
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 18:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F2710E079;
	Tue,  4 Feb 2025 18:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRv1OFrs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DBC10E079
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2025 18:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692722; x=1770228722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q4xoIJjF8jR+/VNyc3W5/Cnb0t2pRuDlzIvF17uwI4w=;
 b=NRv1OFrsXTemn/T/Z3NXaCmbCCRMbpTmIUM1c1Ju1VzfreuRIRgB9sTK
 /z7HGi4rSCfqHV8nA/kwoU2+V4W5KHbW1R3lfqkiuSdR7TiPqJfNfQvRy
 uVqUp6QNXnYSpWqToIehO8KSss9O1dvG28bQaXlUroev51RBv/JrYf9V/
 kpyjuqtUKa60qweCdLJ/YmcNl7jEqnR1TuriUjd18DQP1kwbux6F6es4M
 8+pms56sIf1L6q9PeigX0T2RmuSHluMgsbnLq9B0uargrRoXka0j0QCTq
 kIC8YY8NLoxzyOTY6FZVV1q/9FQrxwdTSA5coXvDnFanOTlGzcAcXS8N0 g==;
X-CSE-ConnectionGUID: IMV7vO6UTaaaEJVNpt+9ow==
X-CSE-MsgGUID: uc+DjBPTQNCE8YCgB2HXyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50652596"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50652596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:12:02 -0800
X-CSE-ConnectionGUID: iTpwnJJkSEyZFyFzuziJ/Q==
X-CSE-MsgGUID: KBi8jQZoQuOpV3lXpgF8bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110509537"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 10:12:00 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/3] tests/intel/kms_joiner: Add a new test to validate
 non-joiner mode
Date: Tue,  4 Feb 2025 23:57:31 +0530
Message-Id: <20250204182734.793645-1-jeevan.b@intel.com>
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

Added new lib changes to find non_joiner_mode and updated test.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (3):
  lib/igt_kms: Add lib changes to check joiner is enabled
  lib/igt_kms: Add support to check joiner mode limit
  tests/intel/kms_joiner: Add a new test to validate non-joiner mode

 lib/igt_kms.c            | 66 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h            |  3 ++
 tests/intel/kms_joiner.c | 54 ++++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+)

-- 
2.25.1

