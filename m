Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D39F531D6
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 21:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B4E10E16E;
	Mon, 13 Apr 2026 21:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMRYvoS9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D3D10E16E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 21:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776115179; x=1807651179;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Q0XxVS+2qrSMeWMwOn0PIV3TO4AIrHCFdrO9Nb7b/I=;
 b=OMRYvoS98fHukoc46ptn7HyKJgJAUTjWN6tKUZR9c5/BsoiFeWuXpXbU
 IPzfNuWa/EVCOo14BQVWJ95hOjcF0XoKDrAXRlmFHHmAKbTcc6vjDzQ3K
 KDrdh0SGe9cr+3QFYtUqSRYqEoJlhMnfg0XXQmFYIEly65vUbwO3s7p/E
 i24VIy/N+DIDrssKDkv8Mz1ZjO4V/S/fb2sszoWNl4qVymk0rBssObqlN
 lB3xY9dDfdGfncskwH7O8CG8Q5lq5s3P3DQ1pFXAwzklWsmT9RHMlLWGc
 4xiMTQ1NmdcdBcxq3ggtiub9uNDNcPvbucE87VAjprUd5jXQjOc7RViGm g==;
X-CSE-ConnectionGUID: 8/sTGT1pTzKkcZZXqs8aUA==
X-CSE-MsgGUID: iaTpmPrcQ8mmM0lvHYpVOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87362602"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="87362602"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 14:19:31 -0700
X-CSE-ConnectionGUID: XI2tdJJwSwqEUTRVHwM5HA==
X-CSE-MsgGUID: zdUjWLYtRuORSWWPW8FugA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="253283235"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT4407ARLH.fm.intel.com) ([10.105.10.107])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 14:19:30 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: apoorva.singh@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, daniel.charles@intel.com,
 fei.yang@intel.com, katarzyna.piecielska@intel.com,
 priyanka.dandamudi@intel.com, kamil.konieczny@linux.intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t v2 1/3] tests/intel/xe_exec_reset: Add a comment about
 return for syncobj wait
Date: Mon, 13 Apr 2026 21:19:25 +0000
Message-ID: <20260413211928.54789-1-stuart.summers@intel.com>
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

