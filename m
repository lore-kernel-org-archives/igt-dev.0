Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7BCC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 10:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9E110E029;
	Wed, 12 Jun 2024 10:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QABB3osB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE72F10E813
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 10:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718189922; x=1749725922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DYAXFArlJFAWZfRkIfzFDcYmehEZ6n1jbUA92cTyYdM=;
 b=QABB3osBNPMUYchY61LQeak+IA1eMVcmVX0CX+mljXURLZf3XIF/yGpy
 sH2+UaCi4/900cIX6dbjehTi/OXCEpkKQu3p/9fTDOaoHZdu0sxHoNqnJ
 HCYMok4lTOO9e5o6PHVJnU9o/iQ4zvDDlyP3UfbBE82JQ2WWh2gmk0oiY
 QcHey0wCBQ99oUIoGWnLuF4Z8e3c8xDGjLk95KdJ3d5vutvYk196pTZND
 8e6Ez/ZLtIqHRY1PCJZYJeMR8ZFCDHrvjlXRKso3EL1hddNDSMwsioB9K
 X/LyP1gPKr6YC+0g62RK1R/9EpNy74e9//v+EwYFsXvEVg/QWZspiQWmV A==;
X-CSE-ConnectionGUID: RFgakD48TTGLI4J2zfCPfg==
X-CSE-MsgGUID: nNlhyALXRJmQfZs8F/GHfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="12036465"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="12036465"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:58:41 -0700
X-CSE-ConnectionGUID: Lj2YWUhHS2GJ1BZzxDgYgw==
X-CSE-MsgGUID: MK4lQWiVSdeylWuZQWbaNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39867164"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:58:39 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] Early Transport Support
Date: Wed, 12 Jun 2024 16:36:43 +0530
Message-Id: <20240612110645.1110374-1-jeevan.b@intel.com>
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

Add early trasport helper and checks to validate early trasport support
on the supported display.

Jeevan B (2):
  lib/igt_psr: Added library functions for early trasport
  tests/intel/kms_psr2_sf: Add checks for early transport

 lib/igt_psr.c             | 15 +++++++++++++++
 lib/igt_psr.h             |  3 +++
 tests/intel/kms_psr2_sf.c | 18 +++++++++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)

-- 
2.25.1

