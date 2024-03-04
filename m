Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEA6C54E41
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 10:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2BE10FF32;
	Mon,  4 Mar 2024 10:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkAcLWUQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C5D10FF32
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709547547; x=1741083547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V3d/ZaHAVyx49+cclezkwqeiV7wdrJy3bbqSJzdxu3E=;
 b=gkAcLWUQRXVj69E3Dj4N3DGSUOTeekXSavJ53jmd3NX0sMTo2M9zl4wk
 Xr8eNTfjaZlvkvoSJnFOGciAWuJZDD5ay7M1uqOmkflhUYa/ovq/wweEA
 XQxl46h9J11K+ONu5ysP361hjZ5/UxrghrC3pyOviqTWXT4dpPDn3KXi8
 FmDmDMl/ga/Nj2v9708Mkn/sz20QgBk1dXN5cbPm74Jax46uJVFckawzR
 G3DbXQB0s5XETthcoyQvl2lipgBWeZi30NVkueUAEcVfWuF4aP2LE0HE/
 JMsWik7DxzYpF9fe8sJ4MIwkbT5XN4R+QPD83NgeDJwHLmGsdo1cMOpT2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3887900"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3887900"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:19:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8897981"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:19:05 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel-ci: Block PSR + DRRS tests
Date: Mon,  4 Mar 2024 15:42:52 +0530
Message-ID: <20240304101252.3242812-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304101252.3242812-1-bhanuprakash.modem@intel.com>
References: <20240304101252.3242812-1-bhanuprakash.modem@intel.com>
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

As Driver prefers PSR over DRRS, we can't enable PSR & DRRS
together. Hence block PSR + DRRS subtests in CI.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/blacklist.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 4427804d5..4fdefb90d 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -73,6 +73,11 @@ igt@gem_exec_alignment@pi-shared
 ###############################################
 igt@kms_frontbuffer_tracking@.*drrs.*
 ###############################################
+# Invalid combo:- PSR + DRRS can't be tested
+# together
+###############################################
+igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*
+###############################################
 # Tends to generate invalid configurations
 # using CCS planes or configurations that
 # exceed HW capabilities resulting in sporadic
-- 
2.43.0

