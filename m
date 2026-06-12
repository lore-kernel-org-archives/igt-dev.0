Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D340CD98CC
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 04:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49A110E097;
	Fri, 12 Jun 2026 04:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7Mk2A+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA6910E097
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 04:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781239848; x=1812775848;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RUUopCsUNwJPHqvb1FEOff+fi9oWrN1cB8hKk7+ZRZU=;
 b=U7Mk2A+1dEDVloZ0xVxxIpasvyTij3t+QilBgdxqljcAzW5fOgYNemb1
 rKKpEFZurNfTLyYalBeeayRnjC1Yen574p9tEX4SB+hz9F6knFAGmwSN+
 4LnbrmdVBve6vC6wij3hHO5bJzKp5ZURyxn4/0iGlocufmcxTRH0XQKmn
 4Tsog2jgDziHqa9Oq9cf/lMFtzGOKARg6KJepXSQNcgN7eO9Pun5Et6S+
 OZ26JmIenTQcjMHGNZDyVpNERuJnUxSR+l7oIMEN5y5YOSxEtjESxCjq8
 qxs4+w4LQs6aVqVUFkOsSGJlxw/2IDgfQlTiqJqRG9PNfRsBVecoKWHuI A==;
X-CSE-ConnectionGUID: z4zemPl6SYeXZpDz0KTEpw==
X-CSE-MsgGUID: 0iE80gGXRjWp8GggpQZ3NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85906879"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="85906879"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 21:50:48 -0700
X-CSE-ConnectionGUID: 0bsKGSidQkaVR8A6nWCjNw==
X-CSE-MsgGUID: GYTyjFKFTGuwDkFGH6smiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="251010501"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 21:50:46 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com, pravalika.gurram@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [i-g-t v2] tests/intel/xe_madvise: Skip purge tests under low RAM
Date: Fri, 12 Jun 2026 10:20:34 +0530
Message-ID: <20260612045035.1942635-1-arvind.yadav@intel.com>
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

The purge tests create memory pressure to trigger BO eviction. If the
system is already low on RAM, this extra pressure can push the machine
into OOM and kill the test before it can clean up.

Check available RAM before starting the pressure allocation and skip when
there is not enough memory.

v2:
  - Drop unrelated chunk/max_t() changes. (Kamil)
  - Keep the original overpressure calculation. (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index cdb115d7e..3fc8b5f65 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -101,11 +101,17 @@ static void trigger_memory_pressure(int fd)
 	overpressure = mem_size / 2;
 	if (overpressure < (64 << 20))
 		overpressure = 64 << 20;
+	max_objs = DIV_ROUND_UP(mem_size + overpressure, chunk);
+
+	/*
+	 * Pressure BOs are faulted in and kept alive until cleanup. If the
+	 * system is already low on RAM, this can cause OOM.
+	 */
+	igt_require_memory(max_objs, chunk, CHECK_RAM);
 
 	/* Separate VM so pressure BOs don't interfere with the test */
 	vm = xe_vm_create(fd, 0, 0);
 
-	max_objs = (mem_size + overpressure) / chunk + 1;
 	handles = malloc(max_objs * sizeof(*handles));
 	igt_assert(handles);
 
-- 
2.43.0

