Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BA4D1D86B
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 14:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF3E10E599;
	Tue, 15 Oct 2024 14:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcEArn9u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E731610E06C
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729001983; x=1760537983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n4WkXCiIzqDbvgtyAFKii8lheI+bg517gGlVjfesLUA=;
 b=kcEArn9uMwD4S4AeQ3NB9XzdGH+VTTTBhMpCz93vYaaCRftKLFYbLBLK
 AKYlUtYJKchwIgHaGBjsk0YsP8bj7vEGSZQ79FOF9w7NdukrLbdRySvsl
 d7E5jnFnCDFIKbAeRqNZAAX/RBPOfrt0WMpKZhok7ArKTvcyHncSAFvmH
 7G64ZLPFYUNurVi98db9FLkK6U4mZ+9DnGNln25+46A98FtBSTZFMgKU2
 qWHsdZtd/GkDfVokDWq+3YqZ8fHJkaCAzMp2jfKeYNjGNhHhF44ptT9Hg
 +NYCMvOTObHDQOXSqC+Zvjo8J8SVBq29idT9UyqCAyqPj/7zQMUOYyxE7 A==;
X-CSE-ConnectionGUID: ab6OHnCJSpaEulHco3SS1A==
X-CSE-MsgGUID: W8O6sRAuRFCu4BiWFFAc+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45872749"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="45872749"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 07:19:42 -0700
X-CSE-ConnectionGUID: 1fUf3GpPRayzfiNizmSFsw==
X-CSE-MsgGUID: ghbtOHEOTjyuWgxKwMfwTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="108642538"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa001.fm.intel.com with ESMTP; 15 Oct 2024 07:19:39 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com, katarzyna.piecielska@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_compute_mode: LR mode should
 use command or render
Date: Tue, 15 Oct 2024 19:48:26 +0530
Message-Id: <20241015141826.4186247-3-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015141826.4186247-1-pravalika.gurram@intel.com>
References: <20241015141826.4186247-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Oct 2024 14:49:27 +0000
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

Spinner which has to run in LR mode should be
executed on compute or render command streamer.
Stop assuming engine id is equal to 1
and use 'xe_find_engine_by_class'
helper to find engine by its class.
use 'xe_find_engine_by_class' with required engine class
to get the engine info.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 82e607848..f62859689 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -457,11 +457,18 @@ static void lr_mode_workload(int fd)
 	uint64_t ahnd;
 	uint32_t bo;
 	uint32_t ts_1, ts_2;
+	uint32_t num_engines;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 	bo_size = xe_bb_size(fd, sizeof(*spin));
-	engine = xe_engine(fd, 1);
+
+	num_engines = xe_number_engines(fd);
+	engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_COMPUTE);
+	if (engine == NULL)
+		engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_RENDER);
+	igt_skip_on_f((engine == NULL), "num_engines %d\n", num_engines);
+
 	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
 	spin = xe_bo_map(fd, bo, bo_size);
 
-- 
2.34.1

