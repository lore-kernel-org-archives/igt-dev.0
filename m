Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59F5CAC5B3
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 12:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924AE10E162;
	Wed, 24 Sep 2025 12:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCJnkSu8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E470210E722
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 12:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758717707; x=1790253707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WawbjLCClKj81qFGqTSvxtnljVMdahgRARnkl1rvSm4=;
 b=bCJnkSu8BGiXGOPbcNQa7QDR7N2A5/2zGdSRCFtLrVooGRWa8sugIA1H
 lCKJ7GtIoMAOP4+ba+X5lFV5YUZKsSTuI4CzpGKyTmTYoNddYGCKI8Tvq
 3OfIyAlxO2FX0gItLBLiii0YUhp0uCtmSb497JQ6hN/0+obVXN2QZeZLg
 Hoobjt64h79bPrdanmqBEt6gMgLbV1HCgijofrYzgtKbOrCpI7xRmLIxt
 BnOP570p64Tti/hFBi/nMcmZ3E/LD8iWmPP2YolOBE07tebRxt9bKApl4
 Cj5+r2kuOawRcKj0u1BjGuMqOG4XuUP5mSn+4//2Q1D+ZA10CSGwksFnQ Q==;
X-CSE-ConnectionGUID: vtFpPbuxQwySY1SJTr5ICQ==
X-CSE-MsgGUID: 26+yYu9DTUGWl2nw9NFMzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61182094"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="61182094"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:47 -0700
X-CSE-ConnectionGUID: kpzyuMwnSZS2oxRZPj4wdA==
X-CSE-MsgGUID: Mkm8/0aNSxyONtPZJS4lDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="177459886"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:45 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v5 i-g-t 3/6] tests/xe_eudebug_online: Allow dead client in
 set-breakpoint-sigint-debugger
Date: Wed, 24 Sep 2025 14:41:20 +0200
Message-Id: <20250924124123.14792-4-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924124123.14792-1-dominik.karol.piatkowski@intel.com>
References: <20250924124123.14792-1-dominik.karol.piatkowski@intel.com>
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

There is a chance that the client will become dead during
set-breakpoint-sigint-debugger test - avoid tripping over the assert by
allowing this situation during this test.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Acked-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 535f00818..aa58e5f99 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1569,6 +1569,7 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 
 		data = online_debug_data_create(hwe);
 		s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+		s->client->allow_dead_client = true;
 		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
 						open_trigger);
 		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
-- 
2.34.1

