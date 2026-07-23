Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E2AC531CF
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 13:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F1C10E586;
	Thu, 23 Jul 2026 13:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIHrux3+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6965D10E589
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 13:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784814247; x=1816350247;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9QRT+SHwhpLU9jSYihm4IryJiZQ/tGO5UdiFz5bXsVs=;
 b=DIHrux3+B2CggvDgkwrtikgefbj7m/2b7lqW5GiqiWPj6Mq5/mPYTeXf
 Em1zx/96iwMymihNbvgmKkchoLyrTFXTnEmqgBG/dfUOsa5sV7jPwpBq+
 qIMeCucJfVsDDisrCmN2sGed9vXKc66Oki4zNP6DN2tS1pny9MAg/Xoc3
 vB5V1GxsQITJergfoqWuvvnok3xXjFjm1Cy5k2n8w8xqdpOOsTF5xsAXo
 1ZTcMivsvwkFG8o043t9C7NiyKfRsrswrpuFb66xt0M5kcHb7GVtGHtk1
 EZJr/gUIB2ztuC/xLeIy/zhvxvxinlkZG64fFcnaDlwqJJWo7rrJ1jan+ g==;
X-CSE-ConnectionGUID: HvBR+n8aS6iOObAnZv9a6g==
X-CSE-MsgGUID: lC1FqjzRQkWcscXgJj+cFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95823292"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="95823292"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 06:44:06 -0700
X-CSE-ConnectionGUID: jzr5BkjIRuy8v5qC3lEMWQ==
X-CSE-MsgGUID: Tp40NGVaRcmTEgVxcMqNrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255041847"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 06:44:04 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 0/2] Add platform-specific joiner exception mode
 handling
Date: Thu, 23 Jul 2026 19:13:52 +0530
Message-ID: <20260723134355.337709-1-sowmiya.s@intel.com>
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

On NVL (display_ver=35), a higher max_dotclock causes modes like
6144x3456@60 to pass the standard igt_bigjoiner_possible() checks,
yet the kernel still enables joiner for them. Introduce per-platform
exception mode lists (e.g. nvl_joiner_exception_modes[]) dispatched
via IS_NOVALAKE() in a new mode_needs_joiner_exception() helper, and
wire it into igt_bigjoiner_possible(). Also add IS_NOVALAKE() to
intel_chipset.h as a combined IS_NOVALAKE_S() || IS_NOVALAKE_P() macro.
Fix intel_boundary_non_joiner_mode_found() to skip exception modes,
preventing test_basic_max_non_joiner from incorrectly selecting a
joiner-required mode as a non-joiner boundary mode.

Sowmiya S (2):
  lib/igt_kms: Add platform-specific joiner exception mode handling
  lib/igt_kms: Skip joiner exception modes in boundary non-joiner search

 lib/igt_kms.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 3 deletions(-)

-- 
2.43.0

