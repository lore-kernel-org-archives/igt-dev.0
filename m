Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E71C2BB85
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 08:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067E510F0E0;
	Fri, 21 Jun 2024 08:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlqRFQQ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC7410F0DF
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718960126; x=1750496126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PuQKkkcL4l7H7blCDQr6wAeMSPwhuvGulJkHYHb74XY=;
 b=mlqRFQQ0oyvI3+KNld973eFA6NfW+O5+og0hoIJSvS8kmvyvixS8tDOk
 Cdz+VcFJWgVSaVqPpgCBAXmU1z7WVQs2mdjB5x/uaYqaULOnbyG7fTEFT
 8eU/Flpin4OCtZfKIY5Ib0yeIwVIlIICRIbKbZ8oTTc03PDAoNatgAzsg
 OsxM4O6I7h67TpDCZ5YEaH9eQbzI6HYaSrih9eOPq99q0MkrEEt4xqenG
 2WIp7q1HhpU66RDqUMnQMPxvyNG2djNNNpnU72pv+J5pomGjUDWtaO9hs
 d48uI6hmFrn4auhzGjE/uhxcat3a6iDJiLwBVbPNwBTzgQC8hCwD1nbZu A==;
X-CSE-ConnectionGUID: +j/T3/beQfKrOhCzmNwR8w==
X-CSE-MsgGUID: FDu9EURrSJeZ5HyLzG+rMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41387674"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="41387674"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 01:55:26 -0700
X-CSE-ConnectionGUID: bk0usD/dRxyVMtzyLSf3eg==
X-CSE-MsgGUID: U4CcyIvoQ86rkd440JuxOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="42609082"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 01:55:24 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [i-g-t 4/4] tests/kms_vrr: Fix virtual mode for CMRR subtest
Date: Fri, 21 Jun 2024 14:17:11 +0530
Message-ID: <20240621084711.68444-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240621084711.68444-1-bhanuprakash.modem@intel.com>
References: <20240621084711.68444-1-bhanuprakash.modem@intel.com>
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

Instead of tweaking the mode->clock, change the mode->vtotal
to create the virtual mode.

Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6f90f4729..f12d23c3c 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -809,9 +809,9 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	kmstest_dump_mode(&mode);
 
 	if (!found) {
-		igt_info("No CMRR mode found on %s, try to tweak the clock.\n", output->name);
+		igt_info("No CMRR mode found on %s, try to tweak the mode.\n", output->name);
 
-		mode.clock = (mode.htotal * mode.vtotal * (mode.vrefresh + VREFRESH_MODIFIER)) / 1000;
+		virtual_rr_vrr_range_mode(&mode, mode.vrefresh + VREFRESH_MODIFIER);
 
 		igt_info("Tweaked mode: ");
 		kmstest_dump_mode(&mode);
-- 
2.43.2

