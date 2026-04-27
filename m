Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D72FF8867
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 21:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C326E10E96C;
	Mon, 27 Apr 2026 21:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fiiGfQ/p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1234910E07E
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 21:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777324836; x=1808860836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Q0XxVS+2qrSMeWMwOn0PIV3TO4AIrHCFdrO9Nb7b/I=;
 b=fiiGfQ/pnHBAswfmIS2daBCSVTU1QWWyGegvxWaAt4ePi/2ugDPcoqHp
 ne9ootCghe7cr338CNOTcduMRJZnnYNA2ZHZM7SYyF5b0XzENKNPbNbHy
 +6isFR//khuMAFfUFv7SjbYGDW3+zCvrdNnADXmBE9qB52d3g5ngBQtXP
 jY7tyNmzAGTzWcvVe/4mwU7+eeZYrgbw9v9AE3fJE+VhNaZRU9B2ScfAG
 gEQAdTuPnAjIoyC78LQzs2Vk7g/1hqH+6dlijOAIxd/K6hYrr3OEsNkwr
 Yl480dupYYzWpUT4LbJP/kTrfuOJaEWEgLfZO2q3TyU6NQtcR181j19r2 Q==;
X-CSE-ConnectionGUID: lIO1A8Y9Rj2knFmdWb0rHg==
X-CSE-MsgGUID: sqw1hrMCSaqXX9DL1te2Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78104255"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78104255"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 14:20:35 -0700
X-CSE-ConnectionGUID: iaVEd8xESYOz/LDPe1q/3Q==
X-CSE-MsgGUID: 0VnHWuoOTMyndGXqTJWewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="234034919"
Received: from dut4344arlh.fm.intel.com ([10.105.10.102])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 14:20:36 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, niranjana.vishwanathapura@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/xe_exec_reset: Add a comment about
 return for syncobj wait
Date: Mon, 27 Apr 2026 21:20:31 +0000
Message-ID: <20260427212034.18486-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427212034.18486-1-stuart.summers@intel.com>
References: <20260427212034.18486-1-stuart.summers@intel.com>
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

Add a comment to the syncobj wait after a hanging submission
to indicate that even for the hang case, we expect the syncobj
wait to return successfully as opposed to the wait ufence case
where we only return successful if hardware did in fact execute
the batch through the MI_USER_INTERRUPT to satisfy the wait ufence.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/xe/xe_legacy.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 084445305..6aeddc578 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -181,8 +181,13 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		return;
 	}
 
-	for (i = 0; i < n_exec_queues && n_execs; i++)
+	for (i = 0; i < n_exec_queues && n_execs; i++) {
+		/*
+		 * Expectation here is that on reset, submissions will
+		 * still satisfy the syncobj_wait.
+		 */
 		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, NULL));
+	}
 
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-- 
2.43.0

