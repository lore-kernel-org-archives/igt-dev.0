Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58414CD98F2
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 12:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092D210E68C;
	Mon, 22 Jun 2026 12:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0sLLKGp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D73910E67D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782130822; x=1813666822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TOznKqkZx6WWCUTIeAok3BHzhRFuolm50ZYFI2Ox0Aw=;
 b=b0sLLKGpvYMrx7KVRU3eOZLRSNzMUu2WXkJ7QqEwVmJT6BqGYENuGtqV
 JjschSmd+vH8JaXvp2wkdscRhvdJEKpIQBh63Yvtjh25ylOcFvF4PpBWF
 wMJVIrC99oWec2APdGDJZ6/RLTPflhVo/NWqtWdWDB8OGR0ZuQsgbYy4Y
 x/XcsoxsYzjsesaGQUXK2Hor4fBlmTT/0S3sfAGCec2rD+ccaW8qRsQgI
 Ro/3b7l5+mWajFP1tojZSkzqwUsMlhx4zRBJ34cnpmcQea96ScCrrczoL
 HVBU9HgwnZqgCGfg7H6v00/DTYlm8JVKmsNNNg8Ctz0ziQfjaTlbX20WW w==;
X-CSE-ConnectionGUID: XJHvcCpGRVCLpw11UC7CuA==
X-CSE-MsgGUID: S5c3P4ceQlyn79M6l5pZRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82967180"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82967180"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 05:20:22 -0700
X-CSE-ConnectionGUID: ZUT/Z+bQQsi77QnLDIPLnQ==
X-CSE-MsgGUID: p/OtFK1VRoep6xZr034jWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="245063632"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 05:20:21 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v2 0/2] tests/intel: Add Xe timeline syncobj coverage
Date: Mon, 22 Jun 2026 14:20:07 +0200
Message-ID: <20260622122009.3350724-1-jan.maslak@intel.com>
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

This series adds Xe-specific timeline syncobj coverage for both
xe_exec and xe_vm_bind.

The main motivation is the xe_exec input case: waiting on an older
completed timeline point after the same syncobj has already advanced to
a later point. That is the shape that exposed the historical xe_exec
NULL-fence regression.

The series is split by interface:

 - patch 1 adds the exec coverage, including the regression-oriented
   completed-point input case and a timeline output case
 - patch 2 adds matching vm_bind coverage for the same timeline syncobj
   behavior

Validation summary:

 - on a fixed kernel, all four subtests pass
 - on an intentionally faulty kernel matching the old behavior, both
   vm_bind subtests pass, xe_exec output passes, and only the xe_exec
   completed-point input subtest fails

v2:
 - Switch from drmGetCap() to igt_has_drm_cap() as per Kamil Konieczny's
   review feedback

Jan Maslak (2):
  tests/intel/xe_exec_basic: Add timeline syncobj exec tests
  tests/intel/xe_vm: Add timeline syncobj vm_bind tests

 tests/intel/xe_exec_basic.c | 223 ++++++++++++++++++++++++++++++++++++
 tests/intel/xe_vm.c         | 142 +++++++++++++++++++++++
 2 files changed, 365 insertions(+)

-- 
2.43.0

