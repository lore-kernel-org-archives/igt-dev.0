Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A00C4725D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 16:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C2D10EA16;
	Fri, 19 Jan 2024 16:52:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00F510EA24
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705683177; x=1737219177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UDNg/oolDN93g6JXFYcK3yocA58fOZW5J8f2x1yYe+M=;
 b=IBdwGvXisE84IOW15qoPdcz1D+dTwlGjzSx8KBLTTHh181wNXx/i94+R
 mjMg3cFuB1FRfYbTz0DNgpMyNDqhZLunf1oilsH9bJtdcFQA8ERmDTofS
 BLhQEoBi69UM/uqminGo/qQVYk1J0MaPVSIXCyIm+5ATcBXK/R15e/iqJ
 j733Glbw2eT+3GT2XfE4m4HdelCw2p7ZGyhxa4+z+QjwfnMqxkQqvShDH
 mLIwYkaNPW8ZCTyPFsmwYxI+FWkuQpo7zQDB5uBF90VSiZpEDBExt8/77
 eqy6kkVWXEtU32d0kkkH7s4vUD/yPGJWwbD0Z1xcYOgGjEHMM/vfhctUG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="671924"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="671924"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 08:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="819113400"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="819113400"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 08:52:50 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] Couple of fixes to guc_pc tests
Date: Fri, 19 Jan 2024 22:34:46 +0530
Message-Id: <20240119170448.1889777-1-badal.nilawar@intel.com>
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
Cc: rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

v2: Dropped the patch "test/intel/xe_guc_pc: Skip freq_*_idle
    tests on PVC"
v3: Fix review comment in patch2 (Anshuman)

Badal Nilawar (2):
  tests/intel/xe_gt_freq: Fix freq_low_max test
  tests/intel/xe_gt_freq: Skip GuC PC tests if GuC PC not supported

 tests/intel/xe_gt_freq.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.25.1

