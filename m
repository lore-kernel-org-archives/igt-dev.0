Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A6BFB5164
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 22:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B23B10E2BF;
	Mon,  6 Apr 2026 22:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+2c+Ata";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43A310E2BF
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 22:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775512870; x=1807048870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F9TIAVEriPIMIxNwZmo2pOKpzV7HKTgyyzYW1+Mp+Ws=;
 b=j+2c+AtaV2d9WfE6yf0l7CFf6KbE+AT08oMV2/Wfo3EF/HHgP0WWY3Xr
 EAmUCZOfPgAFqdhuVi4h3PjeMRVO0ZDCqX7D07LZPwECix9CUk8ck4cBE
 udI1neMNpjOLA//3P/WtB3frAc7uJ0hBJPaWDVFZLjuzc0Cr+a77G6eW/
 27/WNWwXMcm2/ZBx+3PuI4IYaHKs+ti7OBlecorjhKWluay3aU2W+jIWS
 hJ/jB1WUpRxJwipPLxsmM0TKAS8yjdgFOKBj3D+Xz6sY9M+mI+X0mC5yz
 8Eilf40dvvU1s4ereIiitCoFM8ocg9B+olGK7geZ+nsT8D0NJmypYU4X4 Q==;
X-CSE-ConnectionGUID: yMSg7ZuGQYmOWKuVKjQZVQ==
X-CSE-MsgGUID: 286FW8UjRDiY0+kXw0D9hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75640347"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="75640347"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:00:46 -0700
X-CSE-ConnectionGUID: D49/I3eoRgWkQAKQnExfiw==
X-CSE-MsgGUID: gA2o3QHhRAyJvozxCDBQfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="221408544"
Received: from dut4402arlh.fm.intel.com ([10.105.10.127])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:00:46 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: niranjana.vishwanathapura@intel.com, igt-dev@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: Remove CANCEL logic for CM
 variants
Date: Mon,  6 Apr 2026 22:00:42 +0000
Message-ID: <20260406220043.42823-1-stuart.summers@intel.com>
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

The compute mode tests are expected to be long running and will
not trigger the TDR logic in the KMD. This is illustrated in
the test in that the legacy cases implement the CANCEL case,
which is meant to trigger the TDR based resets vs the CM
cases which do not support this.

Remove the CANCEL logic from the CM tests since it isn't actually
used in any of the test cases here.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_reset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 7aaee31dd..4493a56fc 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -421,7 +421,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t exec_addr;
 		int e = i % n_exec_queues;
 
-		if (!i || flags & CANCEL) {
+		if (!i) {
 			spin_opts.addr = base_addr + spin_offset;
 			xe_spin_init(&data[i].spin, &spin_opts);
 			exec_addr = spin_opts.addr;
@@ -478,7 +478,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
 
-	if (!(flags & (GT_RESET | CANCEL))) {
+	if (!(flags & GT_RESET)) {
 		for (i = 1; i < n_execs; i++)
 			igt_assert_eq(data[i].data, 0xc0ffee);
 	}
-- 
2.43.0

