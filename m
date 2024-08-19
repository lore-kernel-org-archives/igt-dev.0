Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0167DC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 09:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DC310E096;
	Mon, 19 Aug 2024 09:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1zKLxpA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD58F10E096
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 09:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724058858; x=1755594858;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GQglcRLgNTmIzHf3Q2+0Khp6222q4Ju76CZnzlFBZLM=;
 b=P1zKLxpAjbwHRdftpdE0uE2fSNZh8LOo57Rq1X00kjQwhIJKQq9TqHIw
 mMoTU58mQu0/ktJbJsTHhYvnspsbfrOAPOC8J4owfx/g6aEdXMe0e3XEN
 dIDfmbeLMAOYTYGYCapjuvssObKlCddr8C15rIt4+o1Bp+1lyIxZVKSls
 fMq3BCYUfUgpJaLdOBMeCYBKuLTqW1BIhsVuO0B7Bbf9DSvgYrvQh9PB6
 z7jQOdoYZ+A2JegL3aiWpUQkBlazVea3JbBVwST/a2X0eQW41mxiDg5v3
 2ki32IfdxrzLo6RS5LXTjjF0/U18Us0verUzQcrXp7DIb9iUkNmYQ+JhI A==;
X-CSE-ConnectionGUID: hgXQKnXiQAuX7+wCn/i0aQ==
X-CSE-MsgGUID: nE9rPZkiSICQcUUHMAjRtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44816288"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="44816288"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:14:18 -0700
X-CSE-ConnectionGUID: XF8NrkMpSY2aO/rmIgonQg==
X-CSE-MsgGUID: Zo8wwAeORfGdN/KESqPMag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60884141"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 02:14:16 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 00/12] add test to validate fallback
Date: Mon, 19 Aug 2024 14:56:03 +0530
Message-Id: <20240819092615.3669803-1-kunal1.joshi@intel.com>
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

Kunal Joshi (12):
  lib/igt_kms: add enum for link rate and lane count
  lib/igt_kms: add function to force/read a target link rate/lane count
  lib/igt_kms: add function to get max link rate/lane count
  lib/igt_kms: add function to force link retrain
  lib/igt_kms: add function to force link training failure
  lib/igt_kms: add function to check if retrain disabled
  lib/igt_kms: add function to check force link training failure support
  lib/igt_kms: add helper to get pending lt failures
  lib/igt_kms: add helper to get pending retrain count
  lib/igt_kms: add helper to set connector link status
  tests/intel/kms_dp_fallback: add test for validating fallback
  HAX: Do not merge

 lib/igt_kms.c                            | 421 +++++++++++++++++
 lib/igt_kms.h                            |  41 ++
 tests/intel-ci/fast-feedback.testlist    |   1 +
 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/kms_fallback.c               | 555 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 6 files changed, 1021 insertions(+)
 create mode 100644 tests/intel/kms_fallback.c

-- 
2.43.0

