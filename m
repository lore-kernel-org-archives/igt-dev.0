Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA98CD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 10:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5C610E20E;
	Tue, 26 Mar 2024 10:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwVg5zZM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8BB10E20E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 10:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711449181; x=1742985181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pDDmAq9M7GxsPgs+La+EwmPbDs3GInMp2ZN38qiAzzw=;
 b=dwVg5zZMUO990SJBXgLArPIR0PvQZ7PEcWoOKIROFms+crX7aRoKwazh
 Pg4ZkNMzfdNlAlL/i2866lw1+tQO8TcljU08Cumlzbx3d/BdOZx8sdM15
 M2+EW0Z14JDOtn8GquQ6G+/YX3gJeMyOA05aOumhIJV/Xtui3UDiqASws
 Bf7dEXzbD+4TzmxZPpHIiFwEWINhFFsxtLOTEgPbZarutP9vSp5HHg+ko
 XfBMV56uo/S/2EKuUIlFJcYD8fNjuEsivdfx0IVVwm6lkeA2jR2sBKUUc
 94gmqBuXPSsrenf3p0r4BPW/POQv+lSzX//bl4kROvgPaS1FVLQw1X6+4 w==;
X-CSE-ConnectionGUID: JXaxcHbkQ3mAz5azzz4DEw==
X-CSE-MsgGUID: /EGwtCX6Qzqa0uEZM1Xucw==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17123942"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17123942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 03:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="15886976"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 03:32:59 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: [V2 i-g-t] meson: Turn on few warns
Date: Tue, 26 Mar 2024 15:56:12 +0530
Message-ID: <20240326102612.746321-1-bhanuprakash.modem@intel.com>
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

dangling-pointer:
    Warn usage of pointers to objects after their lifetime has ended.
int-conversion:
    Warn about incompatible integer to pointer and pointer to
    integer conversions.

V2: Drop unused-variable

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index cee8a7446..223a09853 100644
--- a/meson.build
+++ b/meson.build
@@ -57,8 +57,10 @@ cc_args = [
 
 	'-Werror=address',
 	'-Werror=array-bounds',
+	'-Werror=dangling-pointer',
 	'-Werror=implicit',
 	'-Werror=init-self',
+	'-Werror=int-conversion',
 	'-Werror=int-to-pointer-cast',
 	'-Werror=main',
 	'-Werror=missing-braces',
-- 
2.43.2

