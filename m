Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09141067044
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606B310E02C;
	Thu, 12 Mar 2026 15:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iw0OVhEK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8990610E02C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773329133; x=1804865133;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GDFYh0ObzMjna7lUQAEKc2o4TG7A9jQHXrLD2ogr2xQ=;
 b=Iw0OVhEKj/ZH+sx1jJ6EneVk1+Fbb5v9P3Bn3IRvL4EW95/aIRM4U1ZB
 xid+6ZdGRmwzTa8GCzy14FRAGDSOlE2lxnLfMZagyrV8s59NWfyJ/Etz9
 FsT7eK0bE2eufCPjwRrAKbfYeG5/Epr5H2ZXLozeIpzK+vTtOzmSuVH0a
 cxAo/ovKrX/pzRLA//rwM7odx176gjmNRYFTyT2Vxis2JOn7T3nscN4MB
 Deg79aYqWXiUXeF8h0ydOhi3ERmwe5AyHc+LfxfR26x/MIbDsTOyK4oqu
 qbflN9uNzmvIhoCjKNkhf3e1cnJbZcRJ+bK2svSOBeDWRhTdfiN4E1hMV w==;
X-CSE-ConnectionGUID: QOo62LdsRh+agKMNzImSAw==
X-CSE-MsgGUID: mF8zxw2pQMaltkKqN+umWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85902414"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="85902414"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:25:33 -0700
X-CSE-ConnectionGUID: 4NpwFiS2SmCa7alAtVUqbA==
X-CSE-MsgGUID: v/8O8YSHSLu5zW6lb34MuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225297237"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:25:30 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v2 0/5] intel-ci: Add Xe FULL chamelium run type and testlist
 improvements
Date: Thu, 12 Mar 2026 20:52:28 +0530
Message-ID: <20260312152233.3280893-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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


Mohammed Bilal (5):
  intel-ci: Move suspend/resume chamelium tests to end
  intel: Add Xe FULL chamelium run type to kms_test_config
  intel-ci: Add VGA chamelium exclusion to Xe blocklist
  intel-ci: Add *-planes-random chamelium test to Xe blocklist
  intel-ci: Enable hdmi 4k resolution test in chamelium testlist

 tests/intel-ci/chamelium-only.testlist | 18 ++++++++----------
 tests/intel-ci/xe.blocklist.txt        | 15 +++++++++++++++
 tests/intel/kms_test_config.json       |  9 +++++----
 3 files changed, 28 insertions(+), 14 deletions(-)

-- 
2.48.1

