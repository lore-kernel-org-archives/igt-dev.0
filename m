Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C8DC54F54
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 14:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9002210F288;
	Fri, 31 Jul 2026 14:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SO1xH/5u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789FC10E20D
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 14:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785507517; x=1817043517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nkB9OpQeVsX20f4sHqFgDcjeOMOyAerSJmOw6Kv8cAQ=;
 b=SO1xH/5ucEViYirGL7FhEBxp422reoDL8vBP1xn4ipGFVa6Su2MYkYDW
 v3/tE8bYRE4OVy9CJK3mSkjSEy9QhANRPPRqqmQ8wdA63THdeZlBKJ6gc
 JcNV7OvMOuJdObZYHC5z8ls8UpsLCEOqHxqLCE4E/qDLsitnUWLgUblZW
 6ONwQwLH3b+ioX77EmdtdAZItCuL3Fp8FotmK0Yt7M6gDr1y4agcByVh5
 u7DxszuHXd82ktg1r621ASoSlcZ/Ud9O3ySiBcBJRLki34aGTdLtCWFdN
 sWIBhra+RJ17DlkpYcR+kvzNNkt2Yk4P5Z3eb9MnOZmQuiAbc1gblWlO8 A==;
X-CSE-ConnectionGUID: NnVng/hmSBS3dcBlqwaemQ==
X-CSE-MsgGUID: X2qxKCKqSYSgrIGxhDAWgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="89945058"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="89945058"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 07:18:37 -0700
X-CSE-ConnectionGUID: MqTkNv89TwCjRiUoBGXtUw==
X-CSE-MsgGUID: j44MFPEHTJa7QlFRYmtXHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="262550909"
Received: from unknown (HELO localhost) ([10.94.249.102])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 07:18:35 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com, zbigniew.kempczynski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 3/3] tests/xe_sriov_scheduling: fix ticks_delta check
 for non-inverted logic
Date: Fri, 31 Jul 2026 16:18:06 +0200
Message-ID: <20260731141806.890207-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731141806.890207-1-marcin.bernatowicz@linux.intel.com>
References: <20260731141806.890207-1-marcin.bernatowicz@linux.intel.com>
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

xe_spin now stores elapsed ticks directly in ticks_delta (not inverted).
Update subm_is_work_complete() accordingly.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 47cc5d9b0..5d30b961d 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -189,7 +189,7 @@ static void subm_exec_slot(struct subm *s, unsigned int slot)
 
 static bool subm_is_work_complete(struct subm *s, unsigned int slot)
 {
-	return s->expected_ticks <= ~s->spin[slot]->ticks_delta;
+	return s->expected_ticks <= s->spin[slot]->ticks_delta;
 }
 
 static bool subm_is_exec_queue_banned(struct subm *s)
-- 
2.43.0

