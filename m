Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFFBCF9C6B
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 19:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE75610E739;
	Tue, 24 Sep 2024 19:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7UJdZcp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9235810E739
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 19:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727207891; x=1758743891;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+qREveRKJ17mkH19H/+abML4xmA86yHykopPApl93lI=;
 b=Z7UJdZcp6CSyFNWjkxWpfYgxmfdmAtQLuoK1JK8pM/eGMbsid/MDQ04s
 0Q0xjbtnG3NttXzifeS/PqfvwPscVBZfs5+PUntOQ3Q2DW1BCMyGh9aYa
 TBo4UbTK3+WvF6OY5/ue0SEpw5As0fN5FVTPV9RXL+ClWEPDf0rvADA7/
 ZHYzFsP18AMqA+6SAxByLSvScpwvbXPGDg3xGodFgVxUm0uOysWJh+hpD
 T2yGl5wdP3fScHKWn6umd4QE/EA6/AV3o31aNIn5gxVy5IrpWL0slZ+q0
 VFKTQYZSfJsG65OGK+dd6HwuiYOEFRmwOwya0nMIP8NX5H2O4+LZT38lL A==;
X-CSE-ConnectionGUID: NxLNr1p/T/aI2D92kxul0A==
X-CSE-MsgGUID: uSxzys3CTxmGU7UkWnU+cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="25741467"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="25741467"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 12:58:11 -0700
X-CSE-ConnectionGUID: KKfEhLMdRkeZ5xb99wFV2A==
X-CSE-MsgGUID: xpzCTLTZTo6wbpddxPZadQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="102294045"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.174])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 12:58:10 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v3 0/2] Add test for fault injection
Date: Tue, 24 Sep 2024 21:54:56 +0200
Message-ID: <20240924195754.102650-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Exercise the use of fault-inject.h in the driver at probe time
introduced by https://patchwork.freedesktop.org/series/138654/

Francois Dugast (2):
  lib/igt_sysfs: Promote driver rebind function
  tests/intel/xe_fault_injection: Add new test for fault injection

 lib/igt_sysfs.c                  |  54 +++++++++
 lib/igt_sysfs.h                  |   9 ++
 tests/intel/xe_fault_injection.c | 200 +++++++++++++++++++++++++++++++
 tests/intel/xe_wedged.c          |  36 +-----
 tests/meson.build                |   1 +
 5 files changed, 269 insertions(+), 31 deletions(-)
 create mode 100644 tests/intel/xe_fault_injection.c

-- 
2.43.0

