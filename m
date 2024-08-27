Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9F6C54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE5710E19D;
	Tue, 27 Aug 2024 05:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsGkLs3x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3AF10E05F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737374; x=1756273374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RPkJxcLY6WCT/kasFL4XK64as+3zEqz7gFfAzorGTcg=;
 b=VsGkLs3xkq/n4qVKz/kQLhwdGMq0kuhwjHqRpN1/O3/9kqJjip+kScm/
 b9bz4G1rU1OeuCoSQ2cvt0KxpWjZD60uuOcGJ3bf74ZDyp381nR2f/nhg
 6pO6QuJAulDGoKO/whZOKcIz7/5uAzYDLY7Mwscrv1HlQxOstUE16FOfy
 csS9eKjpaKDDxPzwwM63H21af4qDSUlbn4Fci2UBnvhLHVL0HpGNmVFdm
 rku74vMiIP03wo97ZRT0GxPS9E8xzxir0acDbwAl+SGpZrc5tLe8fanS0
 CtZxPud6nlI7/hvC0aPPljeuyvJb+DM45e0xGeGFVgmisaR/8ojv/xWIx g==;
X-CSE-ConnectionGUID: PoYBHuLjSRy7mFjeV8zdwA==
X-CSE-MsgGUID: PGVH1MbwRPG4Z6kz4odH6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23372154"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23372154"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:42:54 -0700
X-CSE-ConnectionGUID: 9xT8ngFSREeQh8HjdEva/g==
X-CSE-MsgGUID: HfcjvQiuRr660LURBDajzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="67556991"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:42:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 07/10] tests/intel/xe_drm_fdinfo: Half the execution time
Date: Mon, 26 Aug 2024 22:42:19 -0700
Message-ID: <20240827054223.1671414-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827054223.1671414-1-lucas.demarchi@intel.com>
References: <20240827054223.1671414-1-lucas.demarchi@intel.com>
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

No need to do 500 msec per subtest. As we add more tests, the total
execution time of ~ 2.5 sec per subtest make it take too long. Sleep
half the time to lower the execution time.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 96468e1be..f7a359540 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -73,7 +73,7 @@ struct pceu_cycles {
 	uint64_t total_cycles;
 };
 
-const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 2;
+const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 4;
 
 static const char *engine_map[] = {
 	"rcs",
-- 
2.43.0

