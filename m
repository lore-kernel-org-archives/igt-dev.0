Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF62CA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 08:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B12410EA8E;
	Fri, 22 Aug 2025 08:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abV+XTyI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D9410EA8E
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 08:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755851482; x=1787387482;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fnssuxAzCzPkImOzZBO+G/PjHkMb6nHwZ71QpMpEBLk=;
 b=abV+XTyICASenBI7sD9oO+iMRdfd52xshf0BaLNSEOi9Dfx+VDD8BW7r
 tWmUpp4Ai9aQS287huoX3HRplO+srZ0rtHPDQqn1EPSvAGYe4oYnXHhvB
 Pv/cP0nXdRQS1S4AVo3b38j+h5XMRJmTEJmiiF3bmnE5gnsSmOx+7OHhp
 5d6oFuBJERZjEnoOT5MV8agAeW/BYOyiM37rC90veSbY4VL0eAzzMCFC4
 qGIV8Nd6MSYs06SqkD7Dm6FRw1kSIEfFUikT/VVxnd7yAPpZ7S+VDKrzY
 8KUTzUyMFE2bwpJ+zBBTJ1ka2Xdnq8ByyCR7r8T3lbSE5mVQOlpBp7SuL A==;
X-CSE-ConnectionGUID: jUs2f44TQcihq+wwYz48Vw==
X-CSE-MsgGUID: HbzVwJOkTeWxqkk3lV0sPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61801493"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="61801493"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 01:31:21 -0700
X-CSE-ConnectionGUID: Hk8Kx5xBTQ+Lyb5U8xG4qA==
X-CSE-MsgGUID: IhXJIbZ+RIe4qnqjwO2LaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="169478970"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa010.fm.intel.com with ESMTP; 22 Aug 2025 01:31:19 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 0/5] Madvise Tests in IGT
Date: Fri, 22 Aug 2025 08:31:13 +0000
Message-ID: <20250822083118.496366-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Revision 1:
Added madvise tests in IGT which validate different features related
to attributes passed. Madvise tests related to Atomic operation,
Preferred Loc have been added and validated. Madvise tests are called as
part of different struct section and available as madvise-<test-name> in
list of subtests.

ver2:
- added back subtest which was deleted due to rebasing

Nishit Sharma (5):
  include/drm-uap: Added drm_xe_madvise structure
  lib/xe: Added xe_vm_madvise ioctl support
  lib/xe: Helper added to get memory attributes
  tests/intel/xe_exec_system_allocator: Added preferred_loc_smem test
  tests/intel/xe_exec_system_allocator: Added atomic_batch test in IGT

 include/drm-uapi/xe_drm.h              | 289 +++++++++-
 lib/xe/xe_ioctl.c                      | 148 +++++
 lib/xe/xe_ioctl.h                      |   9 +-
 tests/intel/xe_exec_system_allocator.c | 716 ++++++++++++++++++++++---
 4 files changed, 1075 insertions(+), 87 deletions(-)

-- 
2.43.0

