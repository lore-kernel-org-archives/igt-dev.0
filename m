Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0ACC48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 23:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8350210E817;
	Mon, 26 Feb 2024 23:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ynq+u5ko";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4314010E833
 for <IGT-Dev@lists.freedesktop.org>; Mon, 26 Feb 2024 23:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708991982; x=1740527982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HrZNXKVIC6U0MbGD+E6NxARQlU7FIq11++pLwmdUueA=;
 b=Ynq+u5kon5tl54H/91xb5BxmzllWAxLPBvdJamVWteZfLx8ciEEnfGxc
 8Wfu2MJ2WS48z6o+VrbqkKzNhAxTOeP2D6adNKNVr5SNXRvFx2KWWkBaC
 oB5YaCql3qFG5/k4TuSX4vaOHeoQmWMCOEEu7HCn+G8vCHLrcCimuHxuR
 4DZId6RS3+gJ0kFlDPXt7c4/paj42u77DsRGifFETjXkIwmP2zi8D6Q9/
 lDtPSyicN/TOAWwEfO0nwrTYaX1E4QwftVqUCPHfEl5BbX/Ntkzdi2l7v
 lAVo1710/89uAY2OAG2U5W7YFYVb+YN1mS1rqgx5BgCNAc6pM5fUfYw14 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3471587"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3471587"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 15:59:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7050620"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2024 15:59:40 -0800
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/gem_exec_schedule: Add w/a tag to prior
 update for MTL RCS/CCS w/a
Date: Mon, 26 Feb 2024 15:57:36 -0800
Message-ID: <20240226235737.2150915-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226235737.2150915-1-John.C.Harrison@Intel.com>
References: <20240226235737.2150915-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

This test was recently updated to not fall foul of a particular
workaround. The w/a tag itself was missed, however. So, add that in to
make it easier to find in the future.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/intel/gem_exec_schedule.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index 3fd91b2fae80..8612929cc403 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -444,6 +444,7 @@
 IGT_TEST_DESCRIPTION("Check that we can control the order of execution");
 
 /*
+ * Wa_16019325821
  * The RCS/CCS workaround on MTL means that if spinners are sent to both RCS
  * and CCS engines concurrently then the system is effectively dead and will
  * require a reset of both engines to recover. Even pre-emptible spinners
-- 
2.43.0

