Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61E7C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BF410EBE9;
	Thu, 21 Mar 2024 15:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+hUHFI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D7510EBE9
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711033853; x=1742569853;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ulrinkuNP4DNlfazir3uy/3BeAX4OtWY1r4s0xh0GM8=;
 b=J+hUHFI2dVja5ztMFSZ5nj1SOQZA+KSMhz8LBtPPZVMI27my7xFBjtt7
 U4kRVSXd9MclSiydgO9dAL/OKiHIJ0y8loJabw2FYuXWReO+gUYFM0UzU
 SQvr/ZH119ho+K24EhYxoF+hjo0WgtM+e05cdjMaSBQggHOf2kfP586Uy
 /wnx9jWp1Kac4S1eyTjhYSW4PGN0hm3j4yitdNH9qLUuwvMhQUNnWxVmi
 s94h1BQ6UqSkzQTbmnKpI3YAVeb3XfehhLFyPbMY9IJA1yww17Bfi576F
 9uJP9RMdBzWHZ+VXz19us4C179GZN9t33X+uXccf3PrP/YdhJRiBVKdw+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16575630"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="16575630"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19011267"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by fmviesa005.fm.intel.com with ESMTP; 21 Mar 2024 08:10:50 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 0/2] Add mocs tests
Date: Thu, 21 Mar 2024 20:46:35 +0530
Message-Id: <20240321151637.3320911-1-janga.rahul.kumar@intel.com>
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add below mocs tests:
1. Test to read and dump mocs debugfs entry
2. Test to check mocs values retained over suspend/resume.

Below patch add mocs debugfs in kernel:
https://patchwork.freedesktop.org/patch/583858/


Janga Rahul Kumar (2):
  tests/intel/xe_debugfs: Extend gt test to check mocs entry
  tests/intel/xe_pm: Add mocs suspend resume test

 tests/intel/xe_debugfs.c |  5 +++++
 tests/intel/xe_pm.c      | 43 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

-- 
2.25.1

