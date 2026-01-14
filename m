Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4169FD31A13
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF8A10E5CD;
	Wed, 14 Jan 2026 06:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ca9YAtL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5BC10E5CD
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768373984; x=1799909984;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jeNUH73MF7Oc48zQCrGAZJHaoBN5wH12tikFotrRTqk=;
 b=Ca9YAtL/0ThR37L992wjgszmSI/crkSmPcTNDDFLp1h1fqZfklMqKmLy
 aVO9pDfWR4KkjHRFIPpVSznKwIBjEmMOLS79TKd4sE6jqPv7w5LnqWf2D
 G5mZbKxhGPxxmV/nXDszCQxywXTD2gsqqV0f6+8QD31jCaM3WTcHH3V22
 fWwczrdun75yO5oRHyyl14En3iG03gukIqRwvqHJGLaLN8uRNddXZv610
 fDjw0NeaqqdvhV9Y7VlZQvfZ9ELNtg1/jCmJsDvbM+DcoA2AnE4g/0dao
 esIrZz1XG6fMg2ieaUgBkZFw0UDk13URW/CIzwoFJHgZGnl/x43goT19t w==;
X-CSE-ConnectionGUID: 1XBQBTEpRKqCNsDyloS3ng==
X-CSE-MsgGUID: 0HLPbSQQQJ6qRsEYlTEhnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69647901"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69647901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:59:44 -0800
X-CSE-ConnectionGUID: unerWUkVR9CdHnpEJ1JJ6g==
X-CSE-MsgGUID: buw+7e3qQL+CIMPQ53/58Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="205159936"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 22:59:42 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH i-g-t 8/9] tests/intel/xe_exec_reset: Resolve failures in
 cat-error tests
Date: Wed, 14 Jan 2026 12:29:24 +0530
Message-ID: <20260114065925.197958-9-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Resolve failures cm-cat-error, cat-error subtests
due to inconsistencies in check conditions.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/xe/xe_legacy.c          | 2 +-
 tests/intel/xe_exec_reset.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 33237f01e..7880b7ff4 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -227,7 +227,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	if (!use_capture_mode &&
-	    !(flags & (GT_RESET | ENGINE_RESET | CANCEL | COMPRESSION))) {
+	    !(flags & (GT_RESET | ENGINE_RESET | CAT_ERROR | CANCEL | COMPRESSION))) {
 		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
 		     i < n_execs + extra_execs; i++)
 			igt_assert_eq(data[i].data, 0xc0ffee);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index a71988a0b..acf9be80b 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -485,7 +485,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
 
-	if (!(flags & (GT_RESET | CANCEL | ENGINE_RESET))) {
+	if (!(flags & (GT_RESET | CANCEL | ENGINE_RESET | CAT_ERROR))) {
 		for (i = 1; i < n_execs; i++)
 			igt_assert_eq(data[i].data, 0xc0ffee);
 	}
-- 
2.43.0

