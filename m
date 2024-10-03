Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B698CF8571
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 09:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F63510E7E2;
	Thu,  3 Oct 2024 09:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mD8P4ivF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAA410E7E2
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 09:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727948900; x=1759484900;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=umuimWHjZtPYGFfpOQUOu7+U8L7DaBkugMK3pRa28Uc=;
 b=mD8P4ivFon/RcrRPEqdnZWbWLdpmpeepUTgZApJYfMz5VK5ZPlzyEZdP
 +AqxXO70hB1LQV1qpMdOvOUanaoVOSUl9bt5zJ99JLHP2PVI/4dsIMsOV
 99RkiGbDBEDHVj0EfDAQ6VRLG3VX/TM3bMAqsBXTdWTeooXYedoP9U6j3
 FvtHSvw1KvEI1AxW+3AtL5dJvROr9fRUJwcqn4jGnctLldQFH1MtzyQgG
 /4yNJLXi46eX+9uOMEl8Uv5uB/amUOWSvWXKv9lHJAHnYAreU5+Q3lmtC
 rCTvgRzMb9X6bXMOpkYT6BWg54JWeJR3pcK904a8RJ8GEXBln0T62X3KW g==;
X-CSE-ConnectionGUID: +BG3ukXDRe+S3pXM6Eok2w==
X-CSE-MsgGUID: i8exWYCsT02FCzrlmlZaLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27021991"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27021991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 02:48:15 -0700
X-CSE-ConnectionGUID: qMrMiLQxSTC3hwX5skzCEQ==
X-CSE-MsgGUID: sJR53ZxlRo2O76bYn3YlAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="105065613"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 02:48:14 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 0/1] tests/kms_async_flips: Async flips suspend
 resume test
Date: Thu,  3 Oct 2024 15:17:09 +0530
Message-Id: <20241003094710.2650821-1-santhosh.reddy.guddati@intel.com>
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

This patch introduces a new subtest to validate async flips during
suspend and resume cycle.

Santhosh Reddy Guddati (1):
  tests/kms_async_flips: Async flips suspend resume test

 tests/kms_async_flips.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.34.1

