Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8745C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 10:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8101310E99F;
	Thu,  3 Apr 2025 10:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QI7i4Ce2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B21B10E99F
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 10:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743675966; x=1775211966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qsOnjp45TliBOCKZyR3WbKLLURmijsmvxuln0MgB+tI=;
 b=QI7i4Ce2Qmn6ZpC9gc81e6XTDkRxv46xzg++p+tkamS7cLMVDZyj5IJ9
 Jt6mhpE7zThmEEtPUsCAc4G8bz1k1VXvgQYgoNYqzgjW3R6yl6lja3zB8
 FI2MvaJMBQWIq1dZOvF6TV4FfeW84dBbRzAEISgjogcaw5GunOjQgAGli
 k1LK1FZ/nDWdQW/4SZPZvjQU58hlQ1Jz6SiPjwPABl/MzZRQOw+d3U9//
 nFGf5OwP1Wf4ChzO8IY6odKycwX0NOLYUj4fAOY4KWuxL8NQ3Y3fQX8jd
 2XIxrEwhyARi4cMreaarsRHun7ypczECn3WrVZfIbP+diuzvD4gRMa6rD Q==;
X-CSE-ConnectionGUID: KrXiVmKYQY60mC/H8nWZXw==
X-CSE-MsgGUID: 7kXZ6EnzSIGFdvFYrDPU4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62475583"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="62475583"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:26:06 -0700
X-CSE-ConnectionGUID: EN7fem12SjC6zg6OxZQIuw==
X-CSE-MsgGUID: UsL3HLB3TxCdAz9Lela5uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126768347"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 03:26:05 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] Fix display_mode test for joiner output
Date: Thu,  3 Apr 2025 16:11:47 +0530
Message-Id: <20250403104149.2033579-1-jeevan.b@intel.com>
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


Jeevan B (2):
  lib/igt_kms: Prevent bigjoiner assignment if next pipe is already in
    use
  Revert "tests/kms_display_modes: Skip test if joiner display is
    connected"

 lib/igt_kms.c             | 8 ++++++++
 tests/kms_display_modes.c | 9 ---------
 2 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.25.1

