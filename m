Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0D1CFB43F
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 13:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4986310E390;
	Mon,  7 Oct 2024 13:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfr/XSYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851F510E390
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 13:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728307316; x=1759843316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=85PNIurHc2HJ/cv+Hi8P8ewq/mn2JsFytS7MeQImthc=;
 b=lfr/XSYS6hjknGwtTOSHPXyJkQftUDlzNSdBt5+oUeUjYQODT8wS/Kl5
 dxLd2y2P138DCimhtagIDF3ETkoHztqf40SVK18QYinmLNV6LGLahGGrt
 Giic4OGkTg2LVqX3dKUEBIw8R3g4356DpKJSg8lpCvbXDzsv96YAeau9B
 qQ13dx2Wjx8XXtZVHpp9fCovBsKOsJTmlsRjtNFwAReNjCZfTQTgB30Fl
 Nn7nNtH9UMDsgdbUE6krF6D5EVG+gGiQTmTZH8Z3byiefB0UJhWlUBsBp
 pg480RWjVC0i3olUXMzPVVZhyagIGBX+qvR22hklB9V46eDG/px2/78yY w==;
X-CSE-ConnectionGUID: EY44XeQiTMiag/uzB1SM2g==
X-CSE-MsgGUID: dfVED501TM2CFb9HN9vsjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="44924789"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="44924789"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 06:14:50 -0700
X-CSE-ConnectionGUID: xJKjy7omRUmnVRvT1UwIOA==
X-CSE-MsgGUID: aKhyipFLS2ycHUkq1+loBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="98785584"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 06:14:48 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Print engine name on
 error
Date: Mon,  7 Oct 2024 14:32:08 +0200
Message-ID: <20241007123208.3441829-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Print engine name on error for debugging.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 7d434f798..82e607848 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -122,6 +122,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	int64_t fence_timeout;
 	void *dummy;
 
+	igt_debug("%s running on: %s\n", __func__, xe_engine_class_string(eci->engine_class));
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-- 
2.46.0

