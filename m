Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D543FC3ABB2
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 01:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E3F10E1CC;
	Thu, 29 May 2025 01:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jC7EmfXp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC2410E1CC
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 01:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748483763; x=1780019763;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lox2n8xd4VdDhjvxgVGzK8hev379p8DHOH8q1xeoy8Y=;
 b=jC7EmfXpJZB6u8+lD5fWWVZHNFhvkTpFFRqV5XQyU/A/wusNDGZ4+tnW
 HWNeU1IC85GnLzit0DuHPrN9wXYyJ92zZh88ucCnx2quf3j3V1y4N5r0n
 w/yehuAAT3HmWiyNWFM4S+wJ1exsnS8EeAqpW76jAqyDQf/0NcI2U63YW
 Bt4OG4tIs6n7bBIwb0qMig6/w9KEt3N+I5vbagChFT2i47QtEQf+NOWvD
 ZAdoLrQKtnqjBPbVU5C46mM4pLlSKpCEhzdGebN0KW+wLBGuqKU9AYLcZ
 RkUKulIbN6JiPiviSNC6EgJEe6H5Xjpw3b+jf0BR3p9/8OzTx+KkDaTaW g==;
X-CSE-ConnectionGUID: hwKozbSYQ/C3nSurJ8tKHA==
X-CSE-MsgGUID: I7e+dnVfTM+daU2O8/h9+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61585212"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61585212"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 18:56:02 -0700
X-CSE-ConnectionGUID: ivkTadnKTuaIkQq/DROrQQ==
X-CSE-MsgGUID: Sb+auG9KTzCG0IQWgSyXjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="166569800"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 18:56:00 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 0/2] whitelist for HDCP panels
Date: Thu, 29 May 2025 07:25:20 +0530
Message-Id: <20250529015522.298460-1-santhosh.reddy.guddati@intel.com>
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

Add whitelist functionality for monitor EDID checks.
Introduce a whitelist mechanism to handle specific monitors
that are known to face issues with certain features, such as HDCP.

This change is intended to skip test on those panels which are
blacklisted.

Santhosh Reddy Guddati (2):
  lib/igt_panel: Skip hdcp tests on unsupported panels
  tests/kms_content_protection: Whitelist check for panel support

 lib/igt_edid.c                 | 27 +++++++++++++++++++
 lib/igt_edid.h                 |  1 +
 lib/igt_panel.c                | 35 +++++++++++++++++++++++++
 lib/igt_panel.h                | 17 ++++++++++++
 lib/meson.build                |  1 +
 tests/kms_content_protection.c | 47 ++++++++++++++++++++++++++++++++++
 6 files changed, 128 insertions(+)
 create mode 100644 lib/igt_panel.c
 create mode 100644 lib/igt_panel.h

-- 
2.34.1

