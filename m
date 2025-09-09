Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CC0CAC583
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 13:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349FF10E708;
	Tue,  9 Sep 2025 13:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIYQo5Sl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BFE10E708
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 13:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757423360; x=1788959360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YjByxMpppArZZxTGJppR4ez3NwUvb2z0Z48KOp6dI04=;
 b=BIYQo5Sl9MPBj4c9vxmK0RtRX0i9Y2zI39R/yHKq2gwduP0yqyHwfFeT
 f4x7DQQrvb0zbebwGvEGf6VGsG3gGI+vNAtmY+nfRyM2HrCp5YK32kvUQ
 hJ6O6BKqDCNDm6g7OKYw9QoVhholCMIhzJAFGbcbzidxJZ46LHwfDiAxz
 kc3MmH6UTccofUVzY8DKPptxTGDP5kcthH5EULwlwHCur/cppJq/tq7r6
 Zl8efTt5nnt+lKHjzdxqxTxxDmAbkIwF1RiPqCMbMYf41UTUCEP+iNKoK
 oAyRPnftwPk13+IRljbi2DOE1PjNhZ2sxkt3BVT1WRPvgvnuk+CGIMrQf Q==;
X-CSE-ConnectionGUID: Ie07mpKkSYCNKnUtbfnOSQ==
X-CSE-MsgGUID: 5q1ftkkKRheW0t3w49SUrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59644841"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59644841"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:08:23 -0700
X-CSE-ConnectionGUID: cAokygnGTa+GX6MomjM97g==
X-CSE-MsgGUID: oJkzFVo8ThGVY3bgCxGuxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172998492"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:08:21 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_compute: check root-only write
 permission for ccs_mode
Date: Tue,  9 Sep 2025 15:08:06 +0200
Message-ID: <20250909130808.54117-1-peter.senna@linux.intel.com>
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

I've recently sent a patch that created a dedicated security check to
verify that 13 files are only accessible by the root user. The problem
with the first submission was that it was not very maintainable because
it duplicated code that is required to find the files in sysfs.

This series takes a different and more maintainable approach: instead of
adding new tests, it extends existing ones. Specifically, this series:
- Adds the helper function
  `bool igt_fs_check_root_perm(int dirfd, const char *pathname)` to
   lib/igt_fs.c.

- Uses `igt_fs_check_root_perm()` in the `test_ccs_mode()` function
  in tests/intel/xe_compute.c to verify that the "ccs_mode" sysfs
  attribute is writable only by root.

Intentionally ignoring checkpatch warnings:
 - WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IWGRP' are not preferred.
   Consider using octal permissions '0020'.
   #53: FILE: lib/igt_fs.c:164:
   +       if (st.st_mode & S_IWGRP)

 - WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IWOTH' are not preferred.
   Consider using octal permissions '0002'.
   #56: FILE: lib/igt_fs.c:167:
   +       if (st.st_mode & S_IWOTH)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Kamil Konieczny  <kamil.konieczny@linux.intel.com>

Peter Senna Tschudin (2):
  lib/igt_fs: add igt_fs_check_root_perm() helper
  tests/intel/xe_compute: check root-only write permission for ccs_mode

 lib/igt_fs.c             | 28 ++++++++++++++++++++++++++++
 lib/igt_fs.h             |  1 +
 tests/intel/xe_compute.c |  7 +++++++
 3 files changed, 36 insertions(+)

-- 
2.43.0

