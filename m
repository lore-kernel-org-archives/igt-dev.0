Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D01C47422
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 02:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4550310E318;
	Mon, 22 Jan 2024 02:45:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21AD10E1C1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jan 2024 02:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705891519; x=1737427519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7a9SdKBlY4kxEdKHNCn3hOgs4E+js6w2CqyiNfAHohs=;
 b=l8QkcWVQxBlUzTySm9JW4LQLVHnOChZGRdPEZVVzV0t/rfipdROeJ2oF
 pBgcvJZjwwZ1AKzvFmO5/G/tqaQ1CnxaodrjFRaGPVF6PMgaT/96uiT9x
 XXSprxJqFpWlXoJCAqCISlwwaBDvRNWONbyN2BmxTzwrgMFT8+c68Jp1k
 dyd2vS8UcbB30zF5tDS4CtjPmhdBFviEttxWLZRk2/pQhw9/Sp/6RMwHn
 lKc037jVhTsibfd719Oibh/slDPJwR2H/u9crCbgkVX5PBVdvE0MUg8SY
 gvTHoLrsMFl1k7305RuKz8ythh5n7harYsEsDc5MAtTTk/CeYUWfteXEp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="22570004"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="22570004"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 18:45:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="819533115"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="819533115"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orsmga001.jf.intel.com with ESMTP; 21 Jan 2024 18:45:13 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v4 2/3] tests/xe_waitfence: Removed drm_xe_sync data in
 exec_queue_reset_wait
Date: Mon, 22 Jan 2024 08:15:42 +0530
Message-Id: <20240122024543.456795-3-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240122024543.456795-1-krishnaiah.bommu@intel.com>
References: <20240122024543.456795-1-krishnaiah.bommu@intel.com>
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

drm_xe_sync flags are declared wrongly and drm_xe_sync data is not used
in this test, hence removing drm_xe_sync which is unused.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_waitfence.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index dfdb97fb5..e6354b3ff 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -221,16 +221,8 @@ exec_queue_reset_wait(int fd)
 		uint32_t data;
 	} *data;
 
-#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
-	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_TYPE_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
-			.timeline_value = USER_FENCE_VALUE },
-	};
-
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
-		.num_syncs = 1,
-		.syncs = to_user_pointer(sync),
 	};
 
 	uint32_t vm = xe_vm_create(fd, 0, 0);
-- 
2.25.1

