Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031AEC4725D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 11:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A5610E16B;
	Fri, 19 Jan 2024 11:57:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A6310E16B
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 11:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705665467; x=1737201467;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2BNdcCNMgREmPHuOZ0IpHUk+4HqaJzhkJxGD3lkCuyg=;
 b=Zb3lGtBVXmtfjU21bIos8qsjqdxFjPyoeGwCwcBJegBd7r8TeVI29ZCI
 5NjoASbF3SqJCLdC8ov62p2Jy51TJaP5sEA/56fyjOzdBaWbVuGjkBXfY
 gANSjHma7Qo6zhfIO3nwig+bl5M0nbM6uZwRfd9sa7EW+rD9/FskfhLMb
 DSR2Gjx8oUbQij37p6l6rz0pGV9h4l1dqLbGlGIorVHJV9Ih/bmz3Ry7C
 YR8UIP66Mse+CzPG3LmmjpLQp5xLRt58+2S85HyljMhC3lPhr+PUilQyV
 iKh5GMQk0W1ANPl940neHMr/D/3DA9Qj/bWqP18V3O2qZ0UcPOWMpPu8l g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="465008131"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="465008131"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 03:57:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="788346345"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="788346345"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 03:57:44 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 0/4] Add d3 mmap test
Date: Fri, 19 Jan 2024 17:25:50 +0530
Message-Id: <20240119115554.1699060-1-anshuman.gupta@intel.com>
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
Cc: kamil.konieczny@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add d3 mmap test.

Anshuman Gupta (4):
  test/xe_pm: Add exit handler to close fw handle
  lib/igt_pm: Add helper to get/set auto_suspenddelay_ms
  tests/xe_pm: Add d3-mmap IGT test
  HAX: Add d3-mmap to xe-fast-feedback

 lib/igt_pm.c                             |  53 +++++++--
 lib/igt_pm.h                             |   2 +
 tests/intel-ci/xe-fast-feedback.testlist |   1 +
 tests/intel/xe_pm.c                      | 133 +++++++++++++++++++++--
 4 files changed, 168 insertions(+), 21 deletions(-)

-- 
2.25.1

