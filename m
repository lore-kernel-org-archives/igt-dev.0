Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09F2C982FA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 07:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE2F10EBAE;
	Tue, 22 Sep 2026 07:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUw71xYp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486C710E52B
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 07:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790060986; x=1821596986;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L12ZS/Ah9xZB/FTri0lm+GHCM4kzDwEwCLQIKSJyq+w=;
 b=SUw71xYpZVN5t1b+qtUMA/mJaoWT0DwZF6mr6L1wGWKHvk3eWrmH/7cz
 /rJ+lPv+4O5EpwbkR89bVxeJa1Yvl3MGBwgpU/rBuEJXBlK/2U7wQGWan
 +sURMxmtIg140eHWBwrtlIHRyAPDHaNeAOL9IzAQNqq+rz7ADYPjoyVD+
 2D8/YpmloqRfn38TI8jgtjwscCsWblg7TlHledTszeDpMkiZCiFgVIxPe
 PpDo4MfiMdSIlqbjRZxGRYhkb+MQ4kofbWfk7DwsXfKephDX7pAOZ3w0/
 PG69dNgw9hDlxIDRDEh9JJfXKgLWhhD6PIaHlP2GDgnNzUDF8YCMlQil/ g==;
X-CSE-ConnectionGUID: zNs6/HLxQVSLOa1+OdBtGw==
X-CSE-MsgGUID: //++UrYFQyuSt9ZeLqNivA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101987101"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101987101"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 00:09:46 -0700
X-CSE-ConnectionGUID: s7vvviBqTTyno6d7FVL6Bw==
X-CSE-MsgGUID: QTDGc2z3TV2acLNqFDNusQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4113955"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 00:09:46 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
Subject: [PATCH v2 0/2] Support test execution with pre-enabled VFs
Date: Tue, 22 Sep 2026 09:09:38 +0200
Message-ID: <20260922070940.3006983-1-lukasz.laguna@intel.com>
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

