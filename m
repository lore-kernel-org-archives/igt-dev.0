Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C07106F2FC
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 08:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B536810E30A;
	Thu, 26 Mar 2026 08:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zd1PYIAu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E0510E30A
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 08:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774514592; x=1806050592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kx1VgIeCUK/6mYSOfCJ2P8ZYBWk5IqZEs/QtH6L4m9k=;
 b=Zd1PYIAu1UE99dXxZyUZWGyaU3o8lhD/tANwh7JtvUnZ0nzzvgtXu59W
 ZK6uHpKodQBLd2v/UkwoB+9gninCqg6pGi+ozDGoRM9APzqAuJp4Z3x+U
 g60EmEOf0pQivCI9YcyiCFn9RHw9LscIolfcAa9VocptRr56L9B3OPN6w
 Pj+nr5IJddux6hQcBmD9700s96Iaj3+4VtCKV1doSezVvZ6O/sagOHqkf
 0Y6/DwPvRJUpEU+vBv5ojpbK7eLUbvAczW3rzqlrvi6FcYKmhC/bpovQd
 gKAR2BFRjse6Rwz/+ypF99D42VxHhCecSfQ3H0le/wq64BsrqQ+M/ODPv Q==;
X-CSE-ConnectionGUID: jPkvOJXAQMiWsTcJVMYLUg==
X-CSE-MsgGUID: g/cLt30gQe+vK8r5iJO5iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75450309"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75450309"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:43:11 -0700
X-CSE-ConnectionGUID: fyUlFkLdTOCMy6YchxuLUw==
X-CSE-MsgGUID: ntx4w1DWTNC4k8ZJcWPu9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224874912"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:43:10 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v5 0/5] intel-ci: Add Xe FULL chamelium run type and
 testlist improvements
Date: Thu, 26 Mar 2026 14:34:12 +0530
Message-ID: <20260326090417.864673-1-sowmiya.s@intel.com>
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

This series adds Xe driver support for FULL chamelium CI runs by
introducing the Xe FULL chamelium run type in kms_test_config.json,
sharing the existing chamelium-only.testlist between i915 and Xe,
and using driver-specific blocklists to handle platform differences.

Additionally, it improves testlist reliability by moving suspend/resume
tests to the end to avoid system hangs affecting main test execution,
migrating inline test exclusions to blocklists for consistent filtering,
and adding non-deterministic random-plane tests to xe blocklist.

v2:
-Update commit message

v3:
-Sort tests alphabetically (Kamil)

v4:
-Add detailed comment (Swati)

v5:
-Retain *-planes-random chamelium test in Xe blocklist (Swati)

Mohammed Bilal (5):
  intel-ci: Move suspend/resume chamelium tests to end
  intel: Add Xe FULL chamelium run type to kms_test_config
  intel-ci: Add VGA chamelium exclusion to Xe blocklist
  intel-ci: Enable hdmi 4k resolution test in chamelium testlist
  intel-ci: Add *-planes-random chamelium test to Xe blocklist

 tests/intel-ci/chamelium-only.testlist | 22 ++++++++++++----------
 tests/intel-ci/xe.blocklist.txt        | 15 +++++++++++++++
 tests/intel/kms_test_config.json       |  9 +++++----
 3 files changed, 32 insertions(+), 14 deletions(-)

-- 
2.48.1

