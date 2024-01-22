Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69EBC47DDC
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 02:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AB910E1C1;
	Mon, 22 Jan 2024 02:45:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694B410E1C1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jan 2024 02:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705891519; x=1737427519;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7OwYy9Zgfd/5zaVr9ocM6p58AvNUKci4n5pnMOipdLg=;
 b=LlfDwxOgKUwN4EpRBGCkWh71EbfOjh0QAJqRSl9jAVrsKf/MsT7yL6ax
 0YK1/K69QHchTHpCf8eM3bq6FDo2rKjgre/hC7J/IJNsIJ/P5XiioMSqN
 vKhLVYdkErM5bdSRWKczVrNvdrSt6QN39yZBkMmnkG0qTejpf76H+K4ol
 7OTqt2enTKxCfGmhALLpf7hNbFApU5jgd2UbeoFuYtjI70zgrFHEwHm1P
 0YXoU7yoPobv5RyLnn07KtrYAcfDZnBVXuExqFPTeEwOKlhtytbdHcyzz
 71iubrj9X5hPeEi4NGtZvMgCLgOZBoeMbGERSHWBM5upjCli2iOtM3RWK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="22569998"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="22569998"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 18:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="819533104"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="819533104"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orsmga001.jf.intel.com with ESMTP; 21 Jan 2024 18:45:10 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v4 0/3] tests/xe_waitfence: removed invalid_engine subtest
Date: Mon, 22 Jan 2024 08:15:40 +0530
Message-Id: <20240122024543.456795-1-krishnaiah.bommu@intel.com>
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

tests/xe_waitfence: remove invalid_engine subtest from xe_waitfence

engine and instance members are removed from drm_xe_wait_user_fence,
hence invalid_engine subtest is invalid and removing it.
kernel implementation:
        https://patchwork.freedesktop.org/series/127365/

failure link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1067

tests/xe_waitfence: Removed drm_xe_sync data in exec_queue_reset_wait

drm_xe_sync flags are declared wrongly and drm_xe_sync data is not used
in this test, hence removing drm_xe_sync which is unused.

failure link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1081

tests/xe_waitfence: Removed duplicate code in waitfence

Removed duplicate code in xe_waitfence@waitfence.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Bommu Krishnaiah (3):
  tests/xe_waitfence: remove invalid_engine subtest from xe_waitfence
  tests/xe_waitfence: Removed drm_xe_sync data in exec_queue_reset_wait
  tests/xe_waitfence: Removed duplicate code in waitfence

 lib/xe/xe_ioctl.c          | 35 -------------------------------
 lib/xe/xe_ioctl.h          |  2 --
 tests/intel/xe_waitfence.c | 42 ++------------------------------------
 3 files changed, 2 insertions(+), 77 deletions(-)

-- 
2.25.1

