Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67D5C47422
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 14:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABF410E835;
	Thu, 18 Jan 2024 14:44:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E83310E835
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 14:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705589083; x=1737125083;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=63y7MMAQ9NfHS5HMjUt/SByMmO+RQ/BJaOkz9x9FE8A=;
 b=WEXFcvEfn3xg2eyPG44iqxSNQqfxyErkcXNS0oIeLLkuQGubjvHgK+S5
 M7zDLD5S4+iEVlnCVDn674czD5DfnPy2zNcknzHf6LivtEHPCbV6XQtee
 AIwRtT2XpAtmWy+aVekhm1k06QVMeygCtk6tBHmE1pJpLLadv5MR9HLPg
 VzJJdqG5CGvWrt2WVE/mZkL8vMKKSshJ0UaQVt224oMgmz3IeUvSS5o5n
 CHgCfLrQD3nb2/XJsBOa388Ym3ukVdSoKKi+Dgt0v17lAjpz4rNqfMzG6
 fcqLq8BNlOLCMeP6bEpZ/C5ER2VAMHUiGc6C5N0JF6B2FBJNFut+SOkc1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="400129990"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="400129990"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 06:44:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="903844455"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="903844455"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 06:44:41 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] Couple of fixes to guc_pc tests
Date: Thu, 18 Jan 2024 20:26:34 +0530
Message-Id: <20240118145636.1775115-1-badal.nilawar@intel.com>
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

v2: Dropped the patch "test/intel/xe_guc_pc: Skip freq_*_idle
    tests on PVC"

Badal Nilawar (2):
  test/intel/xe_gt_freq: Fix freq_low_max test
  tests/intel/xe_gt_freq: Skip GuC PC tests if SLPC not enabled

 tests/intel/xe_gt_freq.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

-- 
2.25.1

