Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8C6C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 12:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029CA10F817;
	Tue, 23 Apr 2024 12:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xhf7Ecnh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B07910F7FE
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 12:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713875577; x=1745411577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=shayE73ixPc1kRo1+rr3FFhQ8XhGO1NQcNoWKsZF/+E=;
 b=Xhf7EcnhTXEu5Cttgg8myXfkEQ31mHdFhWRX7edxdA//6QhabmxA/4vr
 rXsgQlG67sGs7k9GDOz0jup8A0BDZVMkvLMQ/5mBG7IrUgA855af0vE74
 0BAXQLyKbwRVl5aYU2f6lh3KNCzBTMhP4IntVVXL4WF374PKxyT+A0Hp/
 713VRSfXqVphsvEcflevVqpm9K7GsNshO/uhwYtMqxnYcIqn94tdzGq9o
 zQCxekbhRGTTFMFBAam9VrZ8dyReuHk1/f66r0EMwR89P6+xtE64ZV1gL
 FAbn6aG2bu0Sg8O+k5+4g6EGV1K/QLAg0KxuW+gsZ7jJV9z1D0wfZYay1 g==;
X-CSE-ConnectionGUID: bVxBxvyhRIGsYuhKAuLEWQ==
X-CSE-MsgGUID: cG37gTjIR3eISNqxwgYB1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20067045"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20067045"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:32:56 -0700
X-CSE-ConnectionGUID: w4SO/82wQv6AYht9M6osZg==
X-CSE-MsgGUID: HPaeZTX6QdCnobJzLxCrSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24361314"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:32:54 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V4 0/7] Force joiner support in bigjoiner checks
Date: Tue, 23 Apr 2024 17:56:29 +0530
Message-ID: <20240423122636.1241111-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

As we recently introduced the option (through debugfs) to
force the bigjoiner, needs to extend the support in bigjoiner
checks to handle the force joiner.

Bhanuprakash Modem (7):
  lib/igt_kms: Update force joiner debugfs check
  lib/igt_kms: New helper to check force joiner status
  lib/igt_kms: Force joiner support in bigjoiner checks
  tests/intel/kms_pm_lpsp: Force joiner support in bigjoiner checks
  tests/kms_flip: Force joiner support in bigjoiner checks
  tests/kms_setmode: Force joiner support in bigjoiner checks
  HAX: Test force joiner on BAT

 lib/igt_kms.c                | 61 ++++++++++++++++++++++++++++++------
 lib/igt_kms.h                |  3 +-
 tests/intel/kms_big_joiner.c |  2 +-
 tests/intel/kms_pm_lpsp.c    |  3 ++
 tests/kms_flip.c             | 30 +++++++++++++++---
 tests/kms_pipe_crc_basic.c   |  6 ++++
 tests/kms_setmode.c          | 22 ++++++++++---
 7 files changed, 108 insertions(+), 19 deletions(-)

-- 
2.43.2

