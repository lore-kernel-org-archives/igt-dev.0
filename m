Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEE2C2BA18
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 06:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051DE10E570;
	Tue, 18 Jun 2024 06:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DH4bgmRc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A453010E570
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 06:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718692189; x=1750228189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8WqjClTbr/5oEJeZpXMHggkohyWwPys/Pbli/svItIw=;
 b=DH4bgmRcdHn/ChUe8jV4hqQ+SzmbdXFVWlIPH4WDoN4giDv4UNU03In8
 m+4hHud315A+1YSfuaEGFiuZaF/YWCAerfrYHeLYHrrAEm81JD6HDIMH6
 /vRhbQyoFRQkn18gG8ra6l1N54UtprfpcJC6FawE3XbqsXEyQabDCbLOt
 wKkjKvNbGhW/4ibZKhB8MBsynqugOgRqsaFXxPtjIh84aFtBrO3lOHftH
 NtRGawYAjZ3cDA6omeWvDbvdWquEc9wiZIqdeMCHnK6IEjzjOb/Dz+tYU
 QuATkywaC2GhsfCKR6zalg5ojKJUGKy++qannHr5zlq6b9lCUpYKIINDV g==;
X-CSE-ConnectionGUID: 0Slc8oPyRJ6n5n1+//7deQ==
X-CSE-MsgGUID: W/BfhF5FSLOeebAI2F8kPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26177398"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26177398"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:29:48 -0700
X-CSE-ConnectionGUID: TnwXHh6QS/6k2f1lrbrcVQ==
X-CSE-MsgGUID: PlZyusZWRwOcVywizp/NYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41360309"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:29:48 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V6 0/6] Force joiner support in bigjoiner checks
Date: Tue, 18 Jun 2024 11:51:44 +0530
Message-ID: <20240618062150.4004768-1-bhanuprakash.modem@intel.com>
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

Bhanuprakash Modem (6):
  lib/igt_kms: Check validity of the selcted pipe/output combo
  tests/kms: Drop redundant check for pipe/output combo validity
  tests/chamelium: Use lib helper to check the pipe/output combo
    validity
  tests/intel/kms: Use lib helper to check the pipe/output combo
    validity
  tests/kms_dither: Use lib helper to check the pipe/output combo
    validity
  tests/kms_hdr: Use lib helper to check the pipe/output combo validity

 lib/igt_kms.c                          |  9 ++-
 tests/chamelium/kms_chamelium_helper.c | 12 +++-
 tests/chamelium/kms_chamelium_hpd.c    |  5 +-
 tests/intel/kms_pm_backlight.c         |  7 +-
 tests/intel/kms_psr.c                  | 17 +++--
 tests/kms_content_protection.c         |  3 -
 tests/kms_dither.c                     | 24 ++++---
 tests/kms_hdr.c                        | 90 +++++++++++++++-----------
 tests/kms_properties.c                 |  3 -
 tests/kms_vrr.c                        | 22 +++----
 10 files changed, 108 insertions(+), 84 deletions(-)

-- 
2.43.2

