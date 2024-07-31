Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C933BC3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 14:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8508510E64A;
	Wed, 31 Jul 2024 14:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IR05GPxu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC5410E64A
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722437813; x=1753973813;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SJxL9dn0SiWU0ANk8XhOX2DF6km8lz229O1ocF2/ylc=;
 b=IR05GPxu8J5I5FNqDv4P6dERe0ePx3EGZOW5pIMCk8j1TzMwBILlHUeG
 A4rMb1A1auXEXTwaV0V9Dy1GOOnhGqC588LEvsPxpy1NcxMu3Komohg9t
 hXHU8OkxvG0EC43NiLhW306+MUhK+wMN9wSuJpkXv3zNY6TSmrnfiLdGc
 h/rmhzZlZrKipnCNqgGqmpYRyTXeZy6wxp4jOdE7Fvb8C5ulDRvYbSg+u
 5Tgd4XKxbCCoYjow8CMs1WE4hAWWF5pQBHDKcLb3AX59Rk9iTNiNybCWl
 avuNjdnJ8DCzcwRN6VS5xlNgp5upnr1BYZuvNhlXtFs0R94NMb1Lp7TeY Q==;
X-CSE-ConnectionGUID: GuZAHP/iTfy/6C+k4xIKAw==
X-CSE-MsgGUID: DL4EMbJRT5ytUP+X1THfEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37839404"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="37839404"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:56:51 -0700
X-CSE-ConnectionGUID: GWke5Bh9SiGt9ghS0ZcDGQ==
X-CSE-MsgGUID: N8avO+ZjQl+nRY8kJawMPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54635780"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:56:49 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, kunal1.joshi@intel.com,
 animesh.manna@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/3] New test to validate link-off between active
 regions (LOBF)
Date: Wed, 31 Jul 2024 20:37:38 +0530
Message-Id: <20240731150741.2952335-1-jeevan.b@intel.com>
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

Add debugfs entry to validate LOBF status and create a new
test to validate and fix typo.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (3):
  lib/igt_kms: Added library functions for LOBF status
  tests/kms_vrr: Add new test to validate LOBF
  tests/kms_vrr: Fix typo in igt_describe

 lib/igt_kms.c   | 23 +++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 82 insertions(+), 3 deletions(-)

-- 
2.25.1

