Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23EBC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 16 Aug 2024 21:49:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB0710E7F9;
	Fri, 16 Aug 2024 21:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WAoxZ1QS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0289010E7F9
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2024 21:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723844979; x=1755380979;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+e86C5rCiSN6SHCOTh+ILa6aDM/d9TqUnnW8znbVYzg=;
 b=WAoxZ1QSLXgl1gTBKAAedDjpEe3S3VL1wirbd/imRUGm5OPU4VMa2a1g
 KGdTMvrhGBMPQPnYjFyW5Rmjt2fdHTUAYltJEOYSZoE2LNY5LqeLMnG9c
 4PbIaRQtjL8mxDpc7U06G78LUUOQUCEJkYiw7JInAQz0Jxsq3EYSKLpyY
 CDZ8qAgWRY9HvAMD0/QdNAfzocGGUpNUf3yu4fqo/QNb/9JvDTqrNxpFi
 brgaKit+omoNwZfRl1vRlCW0B1ZLaHft/oeB6/HdT1vDgoSKMYzM9muq8
 6dxJgBH67XlzHx+iYFKU0cFgOXy2mlJYZyeWXnX4CBJ4m16z7xxxntJr0 w==;
X-CSE-ConnectionGUID: dIOqfFT0SFOIEkuiQu4ntw==
X-CSE-MsgGUID: bKwn2VcsToKcFWiiMuM7HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21700224"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="21700224"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 14:49:38 -0700
X-CSE-ConnectionGUID: tQsrE010R0CyG9Y89d1qAA==
X-CSE-MsgGUID: Pogrpr5KSzCzaPEpAOaacA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59485315"
Received: from jcavitt.jf.intel.com ([10.165.125.150])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 14:49:38 -0700
From: Jonathan-Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 nirmoy.das@intel.com, chris.p.wilson@linux.intel.com,
 john.c.harrison@intel.com
Subject: [PATCH i-g-t] tests/intel/gem_spin_batch: Skip compute engines on DG2
 due to w/a
Date: Fri, 16 Aug 2024 14:31:10 -0700
Message-Id: <20240816213110.718186-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

Much like MTL, there's a w/a on DG2 that prevent the execution of
multiple non-preemptible processes on RCS and CCS.  So, prevent the
running of CCS engines in the 'spin-all-new' test, extending the MTL
solution to DG2.

Suggested-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Jonathan-Cavitt <jonathan.cavitt@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>
CC: Chris Wilson <chris.p.wilson@linux.intel.com>
---
 tests/intel/gem_spin_batch.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
index 682a062180..85408a4c0d 100644
--- a/tests/intel/gem_spin_batch.c
+++ b/tests/intel/gem_spin_batch.c
@@ -161,16 +161,24 @@ spin_on_all_engines(int fd, const intel_ctx_t *ctx,
 }
 
 /*
- * Wa_14019159160:
- * An RCS/CCS workaround on MTL means that contexts from different address spaces
- * cannot run in parallel, they must be timesliced. However, a non-preemptible
- * spinner cannot be timesliced. Thus the PARALLEL_SPIN_NEW_CTX test cannot be run
- * across both RCS and CCS engines, one or other must be skipped for the test to
- * not hit a heartbeat timeout and be killed.
+ * Wa_14019159160:MTL
+ * Wa_114014494547:DG2
+ * An RCS/CCS workaround on some platforms means that contexts from different
+ * address spaces cannot run in parallel, they must be timesliced. However, a
+ * non-preemptible spinner cannot be timesliced. Thus the PARALLEL_SPIN_NEW_CTX
+ * test cannot be run across both RCS and CCS engines, one or other must be
+ * skipped for the test to not hit a heartbeat timeout and be killed.
  */
 static bool skip_bad_engine(int fd, const struct intel_execution_engine2 *e)
 {
-	return IS_METEORLAKE(intel_get_drm_devid(fd)) && (e->class == I915_ENGINE_CLASS_COMPUTE);
+	uint32_t devid = intel_get_drm_devid(fd);
+
+	if (IS_METEORLAKE(devid) && (e->class == I915_ENGINE_CLASS_COMPUTE))
+		return true;
+	else if (IS_DG2(devid) && (e->class == I915_ENGINE_CLASS_COMPUTE))
+		return true;
+	else
+		return false;
 }
 
 static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
-- 
2.25.1

