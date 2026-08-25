Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B241DC61DBE
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 14:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D3010EA6E;
	Tue, 25 Aug 2026 14:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDmaLOLP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565BF10E1E0
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787667493; x=1819203493;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L12ZS/Ah9xZB/FTri0lm+GHCM4kzDwEwCLQIKSJyq+w=;
 b=QDmaLOLPTUscv91hB3QefZO0YJ+1X3nkNj+SdiuH4/jTewAf1Qgrqfv5
 iUsS5Y6cU1kiFLg8IFvNIqqaHdPBnuicy1oaKL1lSwQvQUa9qFlbha/8D
 wHB1vFLzAG8xNLUGDlj3ZLeHVC14tLYEFg3gDpvLa82w1patAk16WFgBM
 IGaC5CARin1butqCoMmauF7WJVNA4Um+y84aJWuceQECu1d2cumbDNQgx
 jVPr5SL7dvST9w/xlZ6FVCqUpUyXFzhJQygCgIZu9FB2W0KTWb9d7QOIl
 0IsRali5D01mdjqfLjWrUsun+7mD8plCWxOYfBwXEdpG/OBbWbqNJd148 A==;
X-CSE-ConnectionGUID: w75fbFP3S4+5F7abIzJuKw==
X-CSE-MsgGUID: zKCeiczsRwiRvztbg9JmVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87082820"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="87082820"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:18:12 -0700
X-CSE-ConnectionGUID: aCb2iYERTIuvvcI5ErDYIA==
X-CSE-MsgGUID: IEUD0gryRoWlB1lNAXveig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="267337616"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:18:11 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, jakub1.kolakowski@intel.com,
 adam.miszczak@linux.intel.com, lukasz.laguna@intel.com
Subject: [PATCH v1 0/2] Support test execution with pre-enabled VFs
Date: Tue, 25 Aug 2026 16:18:04 +0200
Message-ID: <20260825141806.2278653-1-lukasz.laguna@intel.com>
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

Some SR-IOV checks can be reused in VMTB scenarios where VFs are already
enabled. This series adds support for running the relevant subtests with
VFS_ENABLED=1, allowing the existing VFs to be reused instead of
assuming the test must enable them. Subtests that require test-managed
VF enabling are skipped in that case.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Lukasz Laguna (2):
  tests/intel/xe_sriov_ggtt: Support execution with pre-enabled VFs
  tests/intel/xe_sriov_vram: Support execution with pre-enabled VFs

 lib/igt_sriov_device.c      | 26 ++++++++++------
 tests/intel/xe_sriov_ggtt.c | 56 +++++++++++++++++++++++++++--------
 tests/intel/xe_sriov_vram.c | 59 +++++++++++++++++++++++++++----------
 3 files changed, 105 insertions(+), 36 deletions(-)

-- 
2.43.0

