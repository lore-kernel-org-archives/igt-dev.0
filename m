Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403E4C4725D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 14:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DA610E9B7;
	Fri, 19 Jan 2024 14:28:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19C910E9B7
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705674514; x=1737210514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nHPpCKSDOd1GtzNTeQRCj7/fNWcMd+mPQcUdO6DW0o8=;
 b=BIDOUIaf2VsK/kniX77JVW51XIoGyKbWI2CDTPOyxO55TTnVZMgqfkWS
 XywG1u5/hkENy4CifdD0zE/O5FiUdJuudHNQKRxA0HTOhAhv3gwQE/iAa
 xxA8ZHCgdgps+Qv/BTrZkTZ8jgzu6VbIkMlCg+g4nvy2TD7FzW0v4vTgL
 e9eq7wNJht3CHLGoqVLyCMypo+iJxqn6h5QEQei7B+akXT5PhGagSAOkD
 pYeM8BC6g0mu4eNNCjGpS8TeJyODueVWkhzaqnsf0MxVDyffnUZ35lzRu
 2VkG0CRSuSGDyLladUzOlNOOrYQRBAozWLEwx/E2eS34WWEAEqI38pQnj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="14278416"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="14278416"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 06:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="1031963527"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="1031963527"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 06:28:31 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 0/4] Add d3 mmap test
Date: Fri, 19 Jan 2024 19:58:19 +0530
Message-Id: <20240119142823.1711688-1-anshuman.gupta@intel.com>
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

Add d3 mmap test
Resending it after adding RB on second patch and fixing the
HAX patch to get CI results.

Anshuman Gupta (4):
  test/xe_pm: Add exit handler to close fw handle
  lib/igt_pm: Add helper to get/set auto_suspenddelay_ms
  tests/xe_pm: Add d3-mmap IGT test
  HAX: Add d3-mmap to xe-fast-feedback

 lib/igt_pm.c                             |  53 +++++++--
 lib/igt_pm.h                             |   2 +
 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/xe_pm.c                      | 133 +++++++++++++++++++++--
 4 files changed, 169 insertions(+), 21 deletions(-)

-- 
2.25.1

