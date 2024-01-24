Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ADDC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 11:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501A810E9C3;
	Wed, 24 Jan 2024 11:50:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860A910E9C3
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 11:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706097032; x=1737633032;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=65kKFwLGKWAGNjh2CoZY8yGgpn9n/6bJSdBmE9gjONM=;
 b=e8XmHzz8umU3+MndCUcd1XL1sZL8FABVGGBxvE6f1KxJpLJSiAVeZYNU
 w3kWl5cNtkiioeQCbIxcmTG4s8Eh8zU7HREDk5zSAEjfHDLBZBK7gF95V
 UiLP7LMgnU6mwfrZNGHgYrWOyIGGJa1VTpTUrGI96wkO3wT/cEJJ8UhRd
 sFqcMZHx9CaPS247v9spqNIQST780aZDUvJP+65jD41xzYHW6RD7KyorD
 kPxVXimuv5dwb2JY9/DpdI4+6Jv23ijgk6TWkp/cZ2S/yyDW4b54YeyeA
 fVMnVRGIiOPlbHYy22J6hPVGl1oeW5WxxcaeryktyN12frlYMbsTcjZfH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="398978588"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="398978588"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 03:50:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959483550"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="959483550"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 03:50:29 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v6 0/4] Add d3 mmap test
Date: Wed, 24 Jan 2024 17:20:15 +0530
Message-Id: <20240124115019.2067089-1-anshuman.gupta@intel.com>
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
  HAX: Add d3-mmap to xe-fast-feedback

 lib/igt_pm.c                             |  56 ++++++++--
 lib/igt_pm.h                             |   2 +
 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/xe_pm.c                      | 135 +++++++++++++++++++++--
 4 files changed, 174 insertions(+), 21 deletions(-)

-- 
2.25.1

