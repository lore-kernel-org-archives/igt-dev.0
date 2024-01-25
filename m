Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC1AC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 15:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA11810F91E;
	Thu, 25 Jan 2024 15:41:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3593D10F91E
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706197285; x=1737733285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L2Wv8Y+xemVink4zNWw/zHsiA7tBSYV59EA+WHu3ntE=;
 b=aN8QAkJawR3oKit0IJvA5iEkEqZlrGE82DSvh0BinF0cFU/v/lLC2SHB
 azvhGUMuIfq66PSAxRPUM6nfhjUnqkza3MTKmm3VcKnqh8OYpUGsVwGw2
 r0T9q/+jXrsB8OBa7DVxGgmyn8HyrkekEjNBPgJzgn4OHtJgtGdo6yBs/
 K5Zhb+4Tfhg8QrTLvuGkET6TfJzgK7p+X7CWcK7lk9h5pRAbzh+hHD/Z4
 ws4VD0yCmMbz41ETkBHNEJpfI1JduCLONRDMvBbCmiVciusbvXuLbPuvB
 2cDcbMVjRe+HTUR7zAYHI9U0+uKgRfJvtAD2eVVf0ZwzBHTHL4QXGGTVe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="20743780"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20743780"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 07:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="35137494"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 07:41:24 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v7 0/4] Add d3 mmap test
Date: Thu, 25 Jan 2024 21:11:10 +0530
Message-Id: <20240125154114.2164080-1-anshuman.gupta@intel.com>
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

Add d3 mmap test.

Anshuman Gupta (4):
  test/xe_pm: Add exit handler to close fw handle
  lib/igt_pm: Add helper to get/set auto_suspenddelay_ms
  tests/xe_pm: Add d3-mmap IGT test
  HAX/DO_NOT_MERGE: Add d3-mmap to xe-fast-feedback

 lib/igt_pm.c                             |  58 ++++++++--
 lib/igt_pm.h                             |   2 +
 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/xe_pm.c                      | 135 +++++++++++++++++++++--
 4 files changed, 176 insertions(+), 21 deletions(-)

-- 
2.25.1

