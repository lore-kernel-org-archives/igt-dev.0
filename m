Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CBEC021A4
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 00:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B551010E097;
	Tue, 25 Feb 2025 00:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1vfeyUy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0C710E097
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 00:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740443510; x=1771979510;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lJDzz+6ceFTuPTO0iq/uvXOK9Uloe2QCFtXoXQix31k=;
 b=R1vfeyUyOCKz66oFF9gqCQKugjm/CoYReT9QwaIq2Ok8HJBqt6kusQEC
 xKOLO24eJg9Lgy+uonl0uXDxOs7vr63ZD82oBoAq8qOgqo026wgI3lBnT
 eDnp7LOtqIwbb9LIZg6BufF930k4dQLr1hJ8jPK3j7gqOE6DN2MqdFnTL
 7AU+BYlPb+qPzOeF8xqjYB6qpq5A0vFwY9sOlci76fujKKKckkTpfdjW4
 ZMT7CqzDRy27MLIY6Jm9VE40QIh66uDWnQqA5d4bPLXOfohBK/vU9+cZW
 coVZCc/g+7/VnaNsopCRG+mEUvaC0FMYOemeS4umi92Q+rT5tXg5ki2cy Q==;
X-CSE-ConnectionGUID: xjJke0SAQqOrssPuox9Wjw==
X-CSE-MsgGUID: BItStk7bTz20zdiD33m2Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51863653"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="51863653"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 16:31:50 -0800
X-CSE-ConnectionGUID: KCekm5s2SmqRvCTVJInQqQ==
X-CSE-MsgGUID: 1wwc/NhuSYCFXzXpMq1SKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="120840099"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 16:31:50 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v4 0/7] Xe: Add tests for PXP
Date: Mon, 24 Feb 2025 16:31:31 -0800
Message-ID: <20250225003140.2738645-1-daniele.ceraolospurio@intel.com>
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

Given that PXP introduces new interfaces and behaviors, we need to
update existing IGTs and add new ones to cover all the new scenarios.

Minor changes have been done to common functions to propagate the
PXP info and error returns.

v3: part of the v2 series has been split off and merged (see [1]) to
allow the kernel side to be merged without IGT failures. This is rebased
on top of that and addresses the review comments on v2 on the remaining
patches.

v4: fix termination test fixtures

[1] https://patchwork.freedesktop.org/series/144158/
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Daniele Ceraolo Spurio (7):
  drm-uapi/xe: Sync with PXP uapi updates
  tests/intel/xe_vm: Update invalid flag subtest with valid PXP flag
  tests/intel/xe_query: Add test for PXP status query
  tests/intel/xe_pxp: Add PXP object and queue creation tests
  tests/intel/xe_pxp: Test PXP submissions
  tests/intel/xe_pxp: Termination tests
  tests/intel/xe_pxp: Test encrypted FBs

 include/drm-uapi/xe_drm.h |  123 +++-
 lib/intel_batchbuffer.c   |   45 +-
 lib/intel_batchbuffer.h   |    1 +
 lib/xe/xe_ioctl.c         |   26 +-
 lib/xe/xe_ioctl.h         |    4 +-
 tests/intel/xe_mmap.c     |    1 +
 tests/intel/xe_pxp.c      | 1183 +++++++++++++++++++++++++++++++++++++
 tests/intel/xe_query.c    |   61 ++
 tests/intel/xe_vm.c       |   23 +
 tests/meson.build         |    1 +
 10 files changed, 1445 insertions(+), 23 deletions(-)
 create mode 100644 tests/intel/xe_pxp.c

-- 
2.43.0

