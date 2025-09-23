Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DD9CAC5B0
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 21:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DA010E66B;
	Tue, 23 Sep 2025 21:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1BiY/7x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A959B10E1CD
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 21:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758662018; x=1790198018;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6mz6kd7kgy/Vdg4RXGVv0zOu1c8Zqjl113/qWZte/18=;
 b=j1BiY/7xVKA5T1HFOeSeSl0iurp7G3Le2gmSoVQG7SqHw4w3RcUsxEhB
 xaRAJa7tENtthjTuDExjXGAi8DM3/3WO0T7BjU+xj6Iss/PvC0Poh8exA
 2EZeDwE9FQGseA7pnOYbKyM+D26TQ4KrgAn32D0UTnk75uIhRy2InEc95
 pAWtUXm7PyMb/D+7SzxqidEWARmHi9mG/x16DCD7MLUt8c1+z2Q+vmYKj
 l6/4iQe9UH4LYMjrsC65SYbXS/cANNBm8jnzHvd3xKM8ytt6qH7q6W2V1
 a/oWv6zLhoHb3HFGxO367q9GySI9PgcLOtKw9dnkZuzqukBgUbkEejtc0 w==;
X-CSE-ConnectionGUID: wp89no4jSFOhjAku8rYIaw==
X-CSE-MsgGUID: tLSgn/NwROKGUH9aDLG8Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71624698"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="71624698"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:13:38 -0700
X-CSE-ConnectionGUID: m7o4cAE9TwK5vgkRNkiEbg==
X-CSE-MsgGUID: z8W6y4USTrG6CFuMP7Lwwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207616532"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:13:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v3 0/5] Add tests to help verify VF migration
Date: Tue, 23 Sep 2025 14:13:28 -0700
Message-Id: <20250923211333.766147-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

These are proving helpful to find VF migration issues.

Matt

Matthew Brost (5):
  tests/intel/xe_exec_reset: Add job cancel tests
  tests/intel/xe_exec_reset: Add timeslice preempt test
  tests/intel/xe_exec_reset: Long spin tests
  tests/intel/xe_exec_reset: Add
    long-spin-sys-reuse-many-preempt-threads
  tests/intel/xe_exec_reset: Add
    long-spin-comp-reuse-many-preempt-threads

 lib/xe/xe_legacy.c          |  91 ++++++++++++--
 tests/intel/xe_exec_reset.c | 241 +++++++++++++++++++++++++++++++++++-
 2 files changed, 319 insertions(+), 13 deletions(-)

-- 
2.34.1

