Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2A7606A329
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HHnsw+iK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F059010FA21;
	Wed,  4 Nov 2026 07:52:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB3810FA18
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 07:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793778693; x=1825314693;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qtYalubiZM8gdBtvPXl/9CW0YWN3xEXIKutbrb3W1pY=;
 b=HHnsw+iK/Ob4pglLJIHS0+OIUYGJ3jc6fiGdeNKW1hHQcdmFQ/gtuKG+
 IRtVMtrrSn9bSO2bDE9pGc6W/5XEP1g2cl3Xewet0vOyfqC3IanOUSOTw
 bbjcq4UvIUpwHKNnza2MFV1/HfyfPpw880yQQDH4YYWrxASUgtISW1hwM
 trpBX0jk50UqzDp09GbAc1Egf8XVW4DfmWUSb3/9u9GLH9+llag91KzPM
 OhwjrXfrTS1QqDIrMYnrw2HDDIqCUbtlzhdQdMuHJngUEbiBa5Cbagw2E
 NJwhZlTERBzTXTa25xJGUVZnjcszJiiPIdTgW3tmQ9iqXx1ad1Tu2FUxd w==;
X-CSE-ConnectionGUID: rNAXy8ltSmaFyQy93Rreiw==
X-CSE-MsgGUID: I5pzdKEtR3S50ZAaZisLMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2399784"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2399784"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 23:51:32 -0800
X-CSE-ConnectionGUID: E7tAZnVVRWuzEE2PpNIB7w==
X-CSE-MsgGUID: yd/F8Kr7SRuGawDC9lYxgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6504332"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by orviesa005.jf.intel.com with ESMTP; 03 Nov 2026 23:51:30 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, gustavo.sousa@intel.com,
 arvind.yadav@intel.com
Cc: kamil.konieczny@linux.intel.com
Subject: [PATCH] tests/intel/xe_exec_system_allocator: Skip reserved PAT
 madvise indices
Date: Wed,  4 Nov 2026 07:51:29 +0000
Message-ID: <20261104075129.1615348-1-nishit.sharma@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nishit Sharma <nishit.sharma@intel.com>

KMD may mark some PAT entries as reserved in the debugfs pat_sw_config
dump (e.g. Wa_14026539277 reserves the 2-way-coherent entries), and
such entries must not be used. Skip the PAT-index madvise subtests when
the selected PAT index is reserved instead of decoding the coherency
bits of the PAT entry.

Always read the PAT software configuration rather than only when a
specific workaround is active, so that any future reservation is
honoured as well. Kernels that don't expose pat_sw_config have no
reserved entries to report, so every index is treated as usable there.

v2:
- Read pat_sw_config unconditionally (Gustavo)
- Don't mention Wa_14026539277 in the skip message (Gustavo)

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 45ec62813..c6a8872b4 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1216,6 +1216,16 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
 }
 
+static bool pat_idx_is_reserved(const struct intel_pat_cache *pat_sw_config,
+				int32_t num_pat_entries,
+				uint8_t pat_idx)
+{
+	if (pat_idx >= num_pat_entries)
+		return false;
+
+	return pat_sw_config->entries[pat_idx].rsvd;
+}
+
 static void
 xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 			  int mem_attr)
@@ -2647,6 +2657,8 @@ int igt_main()
 
 	int fd, svm_compute_loops = getenv_int("IGT_SVM_COMPUTE_LOOPS", 1);
 	uint16_t dev_id;
+	struct intel_pat_cache pat_sw_config = {};
+	int32_t num_pat_entries = 0;
 
 	igt_fixture() {
 		struct xe_device *xe;
@@ -2658,6 +2670,19 @@ int igt_main()
 		va_bits = xe->va_bits;
 		open_sync_file();
 		dev_id = intel_get_drm_devid(fd);
+
+		/*
+		 * KMD may mark PAT entries as reserved for various reasons
+		 * (e.g. workarounds). Older kernels without the debugfs
+		 * pat_sw_config entry don't expose that information, so
+		 * treat every index as usable in that case.
+		 */
+		num_pat_entries = xe_get_pat_sw_config(fd, &pat_sw_config, 0);
+		if (num_pat_entries <= 0) {
+			igt_debug("Couldn't get Xe PAT software configuration (%d)\n",
+				  num_pat_entries);
+			num_pat_entries = 0;
+		}
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
@@ -2879,6 +2904,8 @@ int igt_main()
 
 	for (const struct section *s = intel_get_pat_idx_functions; s->name; s++) {
 		igt_subtest_f("pat-index-%s", s->name) {
+			uint8_t pat_idx;
+
 			if ((strstr(s->name, "madvise-pat-idx-wt-") ||
 			     strstr(s->name, "madvise-pat-idx-uc-comp-")) &&
 			     !xe_has_vram(fd)) {
@@ -2887,6 +2914,11 @@ int igt_main()
 			if (IS_PONTEVECCHIO(dev_id) &&
 			    strstr(s->name, "madvise-pat-idx-uc-comp-"))
 				igt_skip("Skipping compression-related PAT index on PVC\n");
+
+			pat_idx = s->fn(fd);
+			igt_skip_on_f(pat_idx_is_reserved(&pat_sw_config, num_pat_entries,
+							  pat_idx),
+				      "PAT index %u is reserved\n", pat_idx);
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
 		}
-- 
2.43.0

