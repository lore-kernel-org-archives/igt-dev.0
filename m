Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A29F54AAE
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 13:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD30110E6A8;
	Tue, 24 Mar 2026 13:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmJ2JCzs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA1110E661
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 13:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774357965; x=1805893965;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XPjwQV3uHY3MyNZPCXRADvKrVGPCktYwRfdcdmKiCIM=;
 b=bmJ2JCzs1bZoznP+3ealh7b42vdfS+rEDw+Nh23WfaL5zUo+UTiucRXS
 NFWy56LPri2Y/hC7XFkaDqOKSDhunepccKteGcapGStD4dX52msNppsOX
 IZgGngm0DleWT2TxvIKMErQixTOtZNPKwaVGHvf1wNz8ao8+uzgUtTjyV
 f5p0TlgvHhoHA6Hp4SpJuCoVMis/SAgT0rFqlCyVb9AvyZts7+XI1wwyQ
 T2qgbsBlMCZ8nbfW58jdPU0Oc01JeIIxo7BgJ47pGsCCedYnWPV4R+rdK
 o/V92VaVJFWawOx+l7o1WKHqIsuPdX9h/I5q1w//y9dA1zlRgsIJ0UGFL A==;
X-CSE-ConnectionGUID: qTXYU/cLRGmJCfFkB+pXoA==
X-CSE-MsgGUID: 1hiDl3S6ROWr6gPtoAnURA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75440590"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75440590"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:12:44 -0700
X-CSE-ConnectionGUID: X2rebEFFT1yrMeWkDXOl4w==
X-CSE-MsgGUID: ZGhmsa4oS/SM2GtWLd+0Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="262281263"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:12:42 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v2 0/6] RFC: Add attachments support
Date: Tue, 24 Mar 2026 14:12:36 +0100
Message-ID: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series introduces support for hook/test written attachments.
It is somehow limited and stiff but allows to write anything test/hook
wants to attachments directory and if naming contract will be fulfiled
content in base64 form will be included in appropriate subtest/dynsubtest
results.json part.

Series targets our need to include guc logs for failed tests especially
in the point of time when it occurs.

v2: - added clearing of attachments dir in overwrite mode
    - guc-log hook script is now installed to igt datadir/hooks dir
    - added hook-exec-allowlist to selectively execute hook scripts

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>

Zbigniew Kempczyński (6):
  runner: Rename dirfd to avoid clash with dirfd()
  runner: Create attachments directory to use by hooks
  runner: Add attachments directory content in subtests results
  scripts/hooks: Example guc log copy script to attachments dir
  runner: Rename parsing function
  runner: Add hook-exec-allowlist to execute hooks selectively

 lib/igt_hook.c                    |  4 ++
 runner/executor.c                 | 88 ++++++++++++++++++++++++----
 runner/executor.h                 |  2 +
 runner/resultgen.c                | 97 +++++++++++++++++++++++++++++++
 runner/settings.c                 | 31 +++++++---
 runner/settings.h                 |  2 +
 scripts/hooks/guc_copy_on_fail.sh | 24 ++++++++
 scripts/meson.build               |  2 +
 8 files changed, 230 insertions(+), 20 deletions(-)
 create mode 100755 scripts/hooks/guc_copy_on_fail.sh

-- 
2.43.0

