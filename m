Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A23D5C0F5
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 16:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35ECE10E9EB;
	Fri,  8 Nov 2024 16:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJlhGbDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F05E10E9EB
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731081636; x=1762617636;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ISb9XmwOSTokR8AJhj44bNjRXqCNl0oKJyM4SxF5xc8=;
 b=eJlhGbDgDvD9AMBod9+eJ/MhbMJz4GtM5GGfBdJoAHkYABj4dpQpo3q0
 P5M9JK6SHK0n8ZHUuGi8UySaAs4NAQ1FbCs950brTvmlVNYntC5LiZQAS
 FSF46aOob8MZ3+a3VUdKQCr+FUgW/YzXxN5R+NvR4ptdLBkE9C93MHKOb
 ofV4AaiH5ra1XqCwEbhtuDsXrKzzK6gvwrPh9qqSkUn7Pxf7wXLbK/QsQ
 xFIi6qbK0sSmFpgbOiOjva9A0DmwrPypcPOcaL/ma3UW7Bi5IeFBSu/Er
 dgnmT0kEV/dMXdrYtS00AMOKSFlmFLwYULHtTN4UKYB6XAGQjQYQ5iJZ9 A==;
X-CSE-ConnectionGUID: lr4y5j6cR/2plbktzgMHXw==
X-CSE-MsgGUID: UeHleFq/QUSHcnSUghbE7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30738366"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30738366"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:00:34 -0800
X-CSE-ConnectionGUID: Ja0eSv+9TFaPLRVvTGNOTA==
X-CSE-MsgGUID: rTpZtXMtTiGVLWCeqHi3eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86422982"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.246])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:00:33 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/5] xe_fault_injection improvements
Date: Fri,  8 Nov 2024 16:59:28 +0100
Message-ID: <20241108160021.1202234-1-francois.dugast@intel.com>
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

The first 3 patches are a resend of [1]. The last 2 patches extend the
use of fault injection beyond probe time, to make KMD fail when calling
certain IOCTLs and thus trigger more code paths. If this approach is
accepted, it can easily be extended to more IOCTLs.

[1] https://patchwork.freedesktop.org/series/139777

Francois Dugast (5):
  tests/intel/xe_fault_injection: Use a static list of functions
  lib/igt_sysfs: Add igt_sysfs_{get,set}_s32
  tests/intel/xe_fault_injection: Use igt_sysfs helpers
  tests/intel/xe_fault_injection: Inject errors during vm create IOCTL
  tests/intel/xe_fault_injection: Inject errors during vm bind IOCTL

 lib/igt_sysfs.c                  |  71 +++++++
 lib/igt_sysfs.h                  |   5 +
 tests/intel/xe_fault_injection.c | 320 +++++++++++++++++++++----------
 3 files changed, 299 insertions(+), 97 deletions(-)

-- 
2.43.0

