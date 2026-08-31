Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E64C61DFD
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 17:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D163610E60D;
	Mon, 31 Aug 2026 17:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FN6D1gdo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1110E10E620
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 17:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788198923; x=1819734923;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9gFfvU4kLHlFqYSD/r+Jk+bv4CjJJI/bskIff1CQyJc=;
 b=FN6D1gdoO6LSRlpPsO/Jt2AOGJm+BO19n5iu4w/NlpXxX8I0UxUF7qoG
 gvpHVL8NCxSTE/4iLhnXUyFnZ+dN2jKaoRkxn1F+KJRZMVhkXV/NHnMJx
 Ulj5jkIGGPbGTUbIgkDq9tKTnGPixBilJYnDwDSPCtvBuuLuZqDsB8DRP
 IkyOwObRuVHEg5q4VfEaHFH3krJstTodAXpgyRwRUj0XASPgqNMrmuSvf
 lgzn3WpKTAyE6Mss+kbbcHmyCJEFJudBcVLn3rvYptJpw3rtxfdcNj3W/
 bDS/aZdPMu3H+/62rZSfkMTW16P6mxhE1NV8oQuZdRm98h/UFkikwv0kc Q==;
X-CSE-ConnectionGUID: G1DYDLI8RH6maJQ4IH2fSA==
X-CSE-MsgGUID: St/Suv1iSKGyEwFywSQs+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="99774489"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="99774489"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 10:55:23 -0700
X-CSE-ConnectionGUID: VEEkk+2xSMioYNOhsYWndg==
X-CSE-MsgGUID: M+nG7bycS3q+Jj32HkbJLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="265146839"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 10:55:21 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/3] tests/intel/xe_exec_basic: Timeline syncobj coverage
Date: Mon, 31 Aug 2026 19:55:08 +0200
Message-ID: <20260831175512.1379368-1-jan.maslak@intel.com>
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

Xe accepts both binary and timeline drm syncobjs on its exec and vm bind
IOCTLs, but xe_exec_basic only ever exercised binary ones. We have broken
timeline syncobj handling in Xe more than once, and each time it was
Vulkan that caught it rather than IGT. The most recent case was a NULL
pointer dereference in xe_exec_ioctl(), fixed by commit 2f9405aaa429
("drm/xe: Fix NULL pointer dereference in xe_exec_ioctl").

This series adds timeline syncobj coverage to xe_exec_basic in three
steps:

Patch 1 converts the hand written subtest list into setup and workload
tables, so the subtest matrix is generated from data. No subtests are
added or removed.

Patch 2 adds a syncobj mode as a further matrix dimension. Every existing
setup and workload combination now also runs with timeline syncobjs under
a "-timeline" name suffix. In that mode the vm bind signals a timeline
point and the exec waits on it, so the bind to exec dependency crosses
both IOCTLs as a timeline, and execution completion is a timeline point
too. This takes the file from 162 to 288 subtests.

Patch 3 adds timeline-syncobj-exec-completed-point-in, a regression test
for the most recent case mentioned above. The matrix in patch 2 always
waits on the most recently signalled point, which cannot reproduce it.
The bug needs an exec waiting on a point that has already completed and
whose timeline has since advanced.

Only the exec IOCTL is covered here. Matching vm bind coverage is planned
as a follow up series, once the approach in this one is agreed.

All 289 subtests pass on LNL and BMG. Patch 3 additionally reproduces the
crash on a kernel with the fix reverted, and passes with it applied.

Jan Maslak (3):
  tests/intel/xe_exec_basic: Make subtest matrix data-driven
  tests/intel/xe_exec_basic: Add timeline syncobj coverage
  tests/intel/xe_exec_basic: Add old-point timeline regression test

 tests/intel/xe_exec_basic.c | 639 +++++++++++++++++++++++++++---------
 1 file changed, 481 insertions(+), 158 deletions(-)

-- 
2.43.0
