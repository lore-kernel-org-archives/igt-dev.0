Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C25BC3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 11:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E11A10E05D;
	Wed, 31 Jul 2024 11:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3Cs4bwc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCACF10E05D
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 11:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722426685; x=1753962685;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3GFFGpVEIqGEIbXTH1qma+FWPFgzHAdE21i6D46isP4=;
 b=H3Cs4bwccykfYh8gpm+69vjGANaefhvnCjYdcURRlK+NmkUefubhoqrx
 z6H/BpFfgN4PV9KPu2OS/r7N0tQ0TXFYr2thnp5coMy9G8CCyzxdiwUlO
 JUHe6jHBmPzQ0Kq3JtahlbRclJYq8joBAw+EkhmQ6e9/QMyFjqVCHKvWX
 89FTRPtzsIiulT1s4T1UNDAaTMk55jGCq0Ab1r7eg4vz51av1GMmPRgBN
 Y2uXR03acLVUBh9U/3gn7T8iuQOxT48a3TRUHcS5qfaYGHiBGgN979ewl
 XgyMVgY7q3rSGi806dXOuwFj/zwkDs/RSVxlBPB0sRPfjHe80wY0SQuMy w==;
X-CSE-ConnectionGUID: dZKlnsi3SGuKFV0buNRrZQ==
X-CSE-MsgGUID: ssCGh0rkSW+vJgClzFwVpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30925549"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="30925549"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 04:51:25 -0700
X-CSE-ConnectionGUID: Xz6uS3/FTBS+tuCyQSN5Sg==
X-CSE-MsgGUID: sro6QOjdRPK37j4GGe+1Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="77932510"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 04:51:23 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, kunal1.joshi@intel.com,
 animesh.manna@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] New test to validate link-off between active
 regions (LOBF)
Date: Wed, 31 Jul 2024 17:32:13 +0530
Message-Id: <20240731120215.2946412-1-jeevan.b@intel.com>
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

Add debugfs entry to validate LOBF status and create a new
test to validate.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  lib/igt_kms: Added library functions for LOBF status
  tests/kms_vrr: Add new test to validate LOBF

 lib/igt_kms.c   | 23 ++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 79 insertions(+), 2 deletions(-)

-- 
2.25.1

