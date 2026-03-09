Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E11DEFCD9B
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 11:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C5A10E10A;
	Mon,  9 Mar 2026 11:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eORzWnQB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB0F10E10A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 11:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773056555; x=1804592555;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YbAaey+LaNey1YBl3yGDAvkNnIjnoVvjR5MeMJ3EwHc=;
 b=eORzWnQBi8LsupUowirOumSlO3q2FqCWdbbVDIC3qwnDe2Uu/YlReu9h
 +iZJv6ur/CTw6ZYHY2E1ZD18x6bEXPAn9FPybKrcclL7lbQ3hNAQFa6cf
 a5pKcpV4zwW5H0MxX6uVkCVw5nGCtH6hrEOVIbJkcSx5jG4cB1aLnTHxF
 06Gi/ePudSBgsK+K7HcTGrjXl9WcZEct3EueVmEuY1gmBIUcQ56f4guc0
 S4OEe/Mcc3h7EhFtoMDDnUgkIFFJEMRI4r/+7pzNVZUKbWM1FRxbexHBW
 MHDXAIdNAIGzcaUSr97LDtm0cRtSFXkKo7dX7s39GmP+bbLUdk+iJHhq3 Q==;
X-CSE-ConnectionGUID: 2WvO/eaoRDW7NszSSvN1Tw==
X-CSE-MsgGUID: FY8wYx2+TyWnd8fH+9bOww==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="99546076"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="99546076"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:42:34 -0700
X-CSE-ConnectionGUID: VbIi3oSVRjK7bPDqW7fJog==
X-CSE-MsgGUID: +y+IFCBNTA6CurIRqs436A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="223832086"
Received: from jsokolow-alderlakeclientplatform.igk.intel.com ([172.28.176.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:42:31 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Jan Maslak <jan.maslak@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Himanshu Girotra <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 1/1] tests/xe_eudebug: wait a little for shader to write
 all values
Date: Mon,  9 Mar 2026 12:47:27 +0100
Message-ID: <20260309114727.649473-1-jan.sokolowski@intel.com>
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

Add a sleep(1) in vm_bind_clear_test_trigger so that
vm-bind-clear-thread has time to properly clear the memory.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Jan Maslak <jan.maslak@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel/xe_eudebug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 134f31766..55b5931b3 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2435,6 +2435,8 @@ static void vm_bind_clear_test_trigger(struct xe_eudebug_debugger *d,
 			igt_assert_lte(0, fd);
 
 			delta = (random() % eo->range) & -4;
+			/* Let's wait a little so that all values are written ok */
+			sleep(1);
 			r = pread(fd, &v, sizeof(v), eo->addr + delta);
 			igt_assert_eq(r, sizeof(v));
 			igt_assert_eq_u32(v, 0);
-- 
2.43.0

