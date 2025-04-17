Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB00C369C9
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 22:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BB610E3CB;
	Thu, 17 Apr 2025 22:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WG93PAbI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4072610E3CB
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 22:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744929578; x=1776465578;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sakWgAJR0VxnJhSZ5oTy5bCL9lliiBg//I2ilxmU8Gw=;
 b=WG93PAbIM0ZZjE6J7uZZfjiUO9NduKVBQyZ594yC9+UXUhdeRjkMB9SU
 C5Eq5eoaxEmh6s3I37n0Ltc3Z7ZyLCq/d5Uu93rMByFgSXzimQ2D+bXAM
 RkBCgNioARGIc/wd+HWRD9pOE58AqSDQXeupIMiyE3fPbsBcimqRUoCLw
 TWGtN+Lcy5AEQ/mnpIi8KcBTZa7U35BIAIaV+z+Vsz7mvNrfowWipk7CH
 syfk40bCngDjhhnlNz5q1yFrCNJmva4kfWW4JS13llrmN9itNpGcPtNT0
 fKd4AYyJG24FmMWvasYoPfXvFhE+hTM0hPjclBsgr6X+jxnx4z8H5OozX w==;
X-CSE-ConnectionGUID: sfS7RqZnQiudZ5OyLmc83g==
X-CSE-MsgGUID: +6gruRlEToW2NOamqO885g==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="56729248"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="56729248"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 15:39:38 -0700
X-CSE-ConnectionGUID: +20AFtIBS0m9dtAIELVyOg==
X-CSE-MsgGUID: QhUkaDbZSz6oBfWhWsfNzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="168152873"
Received: from dut4086lnl.fm.intel.com (HELO DUT4086LNL..) ([10.105.10.85])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 15:39:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Save and restore errno in
 get_stream_status
Date: Thu, 17 Apr 2025 15:39:31 -0700
Message-ID: <20250417223931.5504-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.45.2
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

Turns out that get_stream_status resets errno and anything that checks
errno afterwards fails. This resulted in a bunch of test failures. Fix
it by saving and restoring errno within get_stream_status.

v2: Go back to calling get_stream_status unconditionally (Ashutosh)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4804
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 1fc8bfaafee2..a219f80fdcf3 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -380,9 +380,11 @@ static void set_fd_flags(int fd, int flags)
 static u32 get_stream_status(int fd)
 {
 	struct drm_xe_oa_stream_status status;
+	int _e = errno;
 
 	do_ioctl(fd, DRM_XE_OBSERVATION_IOCTL_STATUS, &status);
 	igt_debug("oa status %llx\n", status.oa_status);
+	errno = _e; 
 
 	return status.oa_status;
 }
-- 
2.45.2

