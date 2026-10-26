Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01697606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 05:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ft6MQ8E2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63A710E06F;
	Mon, 26 Oct 2026 05:21:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F6810E26B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 05:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792992054; x=1824528054;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lh53ILyOwV+8Qpd4eB/O37mJ6Dr8RCBUJ47t/kShn24=;
 b=ft6MQ8E26ZZmW8JsRLwbmuOEQlN6McGQX9EhvW8AYKh+NkxJ6U+0y4CY
 kDVxfwYDFPVKiwYRwimOt3emFCZwpEX02uweFGKKB5YPRuT4c9ybfdHUA
 FQYUNCut0bZt+PqeosFLGSufulxQ3E7Sjc1op7jAyI+baksO5nNXipCFI
 xr3dVsixpx9e2NOY+sY2jJSNyjDp0tBDTO9VD/brOzmnRJWwEhZpL68nX
 5XHqb+BavgTvmPowPunx7hYufvbt1aqe1aY6QY5KjvblGhZc4INtQTwGe
 OG6af3p2LH4CdbZUDnLlh8plGEhJaCFFv4aTjgg2QrIp7nJW3HsfxWWTG w==;
X-CSE-ConnectionGUID: enIaAquhT1uQsxUooZ5f5Q==
X-CSE-MsgGUID: LNBtNnF7QgqS3gqvGBeSHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1543931"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1543931"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 22:20:54 -0700
X-CSE-ConnectionGUID: RQgURpIhQZ+FItW08R2A2A==
X-CSE-MsgGUID: JTB1MaQQQKGoTERzUc27/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4201174"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa004.fm.intel.com with ESMTP; 25 Oct 2026 22:20:52 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	arvind.yadav@intel.com
Cc: kamil.konieczny@intel.com
Subject: [PATCH] tests/intel/xe_exec_system_allocator: Skip unsupported PAT
 madvise indices
Date: Mon, 26 Oct 2026 05:20:51 +0000
Message-ID: <20261026052051.1472943-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nishit Sharma <nishit.sharma@intel.com>

Skip PAT-index madvise subtests when the selected 2-way coherent index is
rejected by the workaround, avoiding an assertion failure on
affected platforms.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 45ec62813..2519b9e62 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1216,6 +1216,22 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
 }
 
+static bool pat_idx_unsupported_by_wa(int fd, uint8_t pat_idx)
+{
+	struct intel_pat_cache pat = {};
+	int32_t n;
+
+	if (intel_graphics_ver(intel_get_drm_devid(fd)) < IP_VER(35, 0) ||
+	    xe_has_vram(fd))
+		return false;
+
+	n = xe_get_pat_sw_config(fd, &pat, 0);
+	if (n <= pat_idx)
+		return false;
+
+	return (pat.entries[pat_idx].pat & 0x3) == 3;
+}
+
 static void
 xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 			  int mem_attr)
@@ -2887,6 +2903,9 @@ int igt_main()
 			if (IS_PONTEVECCHIO(dev_id) &&
 			    strstr(s->name, "madvise-pat-idx-uc-comp-"))
 				igt_skip("Skipping compression-related PAT index on PVC\n");
+
+			igt_skip_on_f(pat_idx_unsupported_by_wa(fd, s->fn(fd)),
+				      "2-way coherent PAT index not allowed\n");
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
 		}
-- 
2.43.0

