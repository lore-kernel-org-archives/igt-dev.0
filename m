Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D40BD5D69A
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 22:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A6A10E31D;
	Thu,  7 Nov 2024 22:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cf789yQr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8ED10E17D
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731019976; x=1762555976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X3pqtH3tUn8vFCefFOrBskKigFdYD+hrK9QBFDhurwI=;
 b=Cf789yQr9vbUIQWex1I3ZZvbXeFTOCPgwfKe64BTgW3XqVu0BET7vdga
 Bm03ulPQNsQrypFPg8yeXuNvb84WGq3qM5pa/A/KOFTymN1rBb6BISyrB
 koEx4/a1noWmhYJuT1J32dML3rdw+8NzouL/utKxQsIlc+exhL+3S9xIh
 f3tMAEv7580FS0kEhSQa4/x4MjF3t3QsApSBNI8eGVXYEbgaInOY3vinn
 Ina/UGu6oc7WC35nfQyBskyD/bmecmEtwTfxQSMDtE+1pZWwJ1+OwF1B7
 Hv7dF3XlLrPOsgdjpxbJ9dPDIey0EkjDFwvD6xu9ZMmSbIWdHxrOwZWbE Q==;
X-CSE-ConnectionGUID: r8EbYrCxS3uMnCGdHSGwFA==
X-CSE-MsgGUID: pveEKFAxTXqBW0tSLrJdKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31114835"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="31114835"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 14:52:56 -0800
X-CSE-ConnectionGUID: gQ+7iY0uQia47PFaMgLRUQ==
X-CSE-MsgGUID: hvJeICkBTamtPEoaMZ3+TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="85675160"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 14:52:55 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v5 0/3] test/intel/xe_sysfs: Restore sysfs params correctly
Date: Thu,  7 Nov 2024 22:52:51 +0000
Message-ID: <20241107225254.302010-1-jonathan.cavitt@intel.com>
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

The xe_sysfs_timeslice_duration and xe_sysfs_preempt_timeout tests do
not correctly restore modified sysfs params on test failure.
Additionally, xe_sysfs_timeslice_duration modifies but does not restore
preempt_timeout_us.  Repair these issues.

v3: Fix several formatting issues (Kamil)

v4: Do not compare possibly unassigned variable (Kamil)
    Whitespace and commit name fixes (Kamil)

v5: Add new helper funciton, igt_sysfs_get_next_engine
    Fix igt_sysfs_scanf/printf usage in tests (Kamil)

Jonathan Cavitt (3):
  lib/igt_sysfs: Add igt_sysfs_get_next_engine
  tests/intel/xe_sysfs*: Restore values on test failure
  tests/intel/xe_sysfs_timeslice_duration: Restore preempt timeout

 lib/igt_sysfs.c                           | 36 +++++++++++
 lib/igt_sysfs.h                           |  1 +
 tests/intel/xe_sysfs_preempt_timeout.c    | 55 +++++++++++++----
 tests/intel/xe_sysfs_timeslice_duration.c | 73 +++++++++++++++++++----
 4 files changed, 145 insertions(+), 20 deletions(-)

-- 
2.43.0

