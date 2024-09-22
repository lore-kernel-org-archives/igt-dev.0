Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A6ECF9C6D
	for <igt-dev@archiver.kernel.org>; Sun, 22 Sep 2024 21:13:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9EA10E351;
	Sun, 22 Sep 2024 21:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/gu7ECZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A0B10E1E3
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Sep 2024 21:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727039631; x=1758575631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oqHpdb64FOaIXyIVY+OYj00PcxLuTs9ZJ+sUPAhZ7uY=;
 b=d/gu7ECZaZViUW0pGtVn6OtT4+6uALMDAJ3x0YuUt8NMX0wcLG4fof/8
 PHUmV+rH1SqVVRJcJar0dWv9o69jEjjuqGcgIhkooP99TQ8OcZQ2KV0Pt
 PG+KjZnDGATiX7vRH29yoTh5pN6igh/OQozG9CtrZDx5h2+aCa3R5NvQ2
 0f7GpMCGQjL6Oun+DM5UCB3cpr+6Ruj2Q/FDUpzHz47gYwE3G0hAZUDhx
 cc4lBOWAXfisF2giQjDDlQTT4ENbTtkQFKXOw8+qbNFsP0Bt41LuCQ+VC
 FDcwcctZ0H4RM7Q0OQZJZGmuaCWd90teI6gPqhcgWStNXQG+1bS1NBh+9 A==;
X-CSE-ConnectionGUID: h2RnZsH0QFOd+2vyTFSluw==
X-CSE-MsgGUID: yqyfkfrbTT6dwumz+iBegw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36641008"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="36641008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 14:13:50 -0700
X-CSE-ConnectionGUID: Rz4GhCgTQFuU+3Ls4whe7w==
X-CSE-MsgGUID: FGdZMXlrQSOdu7bpKT3QVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71188096"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 14:13:48 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/7] add test to validate fallback
Date: Mon, 23 Sep 2024 02:55:42 +0530
Message-Id: <20240922212549.1361889-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

[1] provides debugfs interfaces to force link training
failures, retrain link, set/get current/max link rate/lane count.

add new test using newly exposed interfaces to validate fallback.

[1] https://patchwork.freedesktop.org/series/133624/

Kunal Joshi (7):
  lib/igt_kms: add DP link management helper functions
  lib/igt_kms: add helper to set connector link status
  lib/igt_kms: allow set and reset value to be same
  lib/igt_kms: add function to reset link params
  lib/igt_kms.c: refactor parse_path_connector
  tests/intel/kms_dp_linktrain_fallback: add test for validating
    fallback
  HAX: Do not merge

 lib/igt_kms.c                            | 405 ++++++++++++++++++++++-
 lib/igt_kms.h                            |  13 +
 tests/intel-ci/fast-feedback.testlist    |   1 +
 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/kms_dp_linktrain_fallback.c  | 397 ++++++++++++++++++++++
 tests/meson.build                        |   1 +
 6 files changed, 806 insertions(+), 13 deletions(-)
 create mode 100644 tests/intel/kms_dp_linktrain_fallback.c

-- 
2.43.0

