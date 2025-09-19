Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5728CA1013
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 04:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D8E10E932;
	Fri, 19 Sep 2025 04:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m69GJB7s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8A910E930
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 04:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758257441; x=1789793441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CIrjcELE3fzZ5+/dC2V0T7mDA+IY58srkCXUYeAJapc=;
 b=m69GJB7shMV8v4ZqAfRn0295atAvURcYkH4Z+mvzxU7ELGdQjGkvJBM1
 MxZU0wWO56Q7tb/YYfgwc4cO+EcpSWxC2dHmLkwaumnx9hJRqeFe6z8Lb
 t1mOadaericmpSRuXydwlF9vkSoOquHrHICMPXW6ynvnozjlPCNFCNuxf
 dfpnuf0Ftu5uaj7U7jnn+QLdPD3I1ECcKG+VHYyKoiH+dx3phYyrMJliR
 bVCD/leeuw+JaVr1TYnadKPKK/74zXQTx8ujcNPBXzxQO+MCvUj0MfWOZ
 nvRQcgfTWHeWUgI3595Y6oPgPA7mV/Pb1x4HzAIukSbkYVKVUmn7g3C8T Q==;
X-CSE-ConnectionGUID: lRAYs2muRRiNmNZGqx6qDg==
X-CSE-MsgGUID: C22vw2cmT6mBaJzZ6/wP2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60531892"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="60531892"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 21:50:40 -0700
X-CSE-ConnectionGUID: mZDLbn2JSR2SMNimlTN46Q==
X-CSE-MsgGUID: nHfcUtpnSeWAkyiTXIED/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="179745518"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 21:50:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t v2 0/2] tests/intel/xe_configfs: Test ctx_restore_*
Date: Thu, 18 Sep 2025 21:50:19 -0700
Message-ID: <20250918-configfs-ctx-restore-v2-0-5df035e27e42@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250918-configfs-ctx-restore-81654186cd39
X-Mailer: b4 0.15-dev-b03c7
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

Add tests for the newly added ctx_restore_post_bb and
ctx_restore_mid_bb.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v2:
- Check the HW contains the expected values in the registers
- Also test ctx_restore_mid_bb
- Remove unneeded "out" variable, but also make sure an invalid option
  is not accidentally accepted
- Link to v1: https://lore.kernel.org/r/20250906055220.803070-2-lucas.demarchi@intel.com
---
Lucas De Marchi (2):
      tests/intel/xe_configfs: Save pci_device
      tests/intel/xe_configfs: Check ctx_restore_post_bb

 tests/intel/xe_configfs.c | 180 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 178 insertions(+), 2 deletions(-)

base-commit: 98f7b89b27822867b511113bd7f7e578506ce8eb
change-id: 20250918-configfs-ctx-restore-81654186cd39

Lucas De Marchi

