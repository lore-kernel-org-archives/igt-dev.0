Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63754CAC58E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 16:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABFC10EB6E;
	Thu, 11 Sep 2025 16:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CwcaBRKx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43AD10E12D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757607422; x=1789143422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UqwEtiuxj9Vtsu30lAAyGOexxqlxG3a5J4ToqzdDdsE=;
 b=CwcaBRKxHU7pI5UG/TvcQeZJ3dZxdlJvRzKEzAklsQa7DSXgv6iKPVsA
 U77Slbt1ePzGZ/aJpW/u/cdULSRuhvb/1lT9jG5kdvNWaRiuFjCsgE/0t
 e9ZmMqFidmDIKeErySNBJVEOS/sw5L4WK2G5tZDaOUs3C4SGj4eo7ztXE
 Rhj/EI/0LIFQDNWzFtjKrfIFlI4Ekl59F6nPZL9oXrzCQtT5HwbICmavX
 qUGNoT54mdzy/oxKKhiMXrkppCrfQhGxdo3TPczRGMogCg/iogZp2hits
 2EgrFM+CwRFNfqHVlAPuUIJDMHjVTngrc5/S/RPsVfuqQ/DY6CcdBBh4+ Q==;
X-CSE-ConnectionGUID: tNe7bGWqQQylTIOXwwDsiQ==
X-CSE-MsgGUID: Wk76i7ecT++HyVLNbSSnmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="60055480"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="60055480"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 09:17:02 -0700
X-CSE-ConnectionGUID: RW+iyN8wR8G85MRBLqsMLw==
X-CSE-MsgGUID: iyKkeCYHRraPmyAIRJGNuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="174112589"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 09:17:02 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_evict_ccs: Adjust object size for
 non-resizable BAR
Date: Thu, 11 Sep 2025 16:16:53 +0000
Message-Id: <20250911161653.1870189-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911161653.1870189-1-sobin.thomas@intel.com>
References: <20250911161653.1870189-1-sobin.thomas@intel.com>
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

Some BIOS configurations do not support or enable resizable BAR,
resulting in a maximum BAR size of 256MB. This patch adjusts the
maximum object size used in test conditions based on the available
VRAM.

v2: Adjusted the subject name

v3: Inco-operated review comments [kamil]

v4: Fixed typo.

v5: Fixed review comment for igt warnings and commit subject. [kamil]
    Fixed the condition for user provided max size value. [kamil]

v6: Modified to adjust params only incase vram_mb <= 256MB. [kamil]

v7: Fixed print message after adjustment of object size. [kamil]

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_evict_ccs.c | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 281d27015..5a7f54abc 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -39,12 +39,14 @@ static struct param {
 	int vram_percent;
 	int min_size_kb;
 	int max_size_kb;
+	bool user_set_max_size;
 	bool verify;
 } params = {
 	.num_objs = 0,
 	.vram_percent = OVERCOMMIT_VRAM_PERCENT,
 	.min_size_kb = MIN_OBJ_KB,
 	.max_size_kb = MAX_OBJ_KB,
+	.user_set_max_size = false,
 };
 
 struct object {
@@ -343,6 +345,35 @@ static void set_config(int fd, uint32_t flags, const struct param *param,
 	igt_debug("nproc: %d, mem per proc: %dMB\n", nproc, config->mb_per_proc);
 }
 
+static void adjust_params_for_vram_size(uint64_t vram_sz)
+{
+	int recommended_max_size_kb;
+	int max_object_mb = vram_sz / MIN_OBJ_KB;
+
+	/* max_object_mb clamped between 2MB and 256MB */
+	max_object_mb = max_t(int, 2, min_t(int, max_object_mb, 256));
+	recommended_max_size_kb = max_object_mb * 1024;
+
+	igt_info("Detected VRAM (%"PRIu64"MB): Using %d%% for test, max object size: %dMB ",
+		 vram_sz, params.vram_percent, max_object_mb);
+
+	if (params.user_set_max_size) {
+		if (params.max_size_kb > recommended_max_size_kb) {
+			igt_warn("User specified size (%dMB) may not "
+				 "be optimal for %"PRIu64"MB VRAM "
+				 "(recommended size: %dMB)", params.max_size_kb / 1024, vram_sz,
+				 recommended_max_size_kb / 1024);
+		} else {
+			igt_info("Using user max object size: %dMB (recommended: %dMB)",
+				 params.max_size_kb / 1024, recommended_max_size_kb / 1024);
+		}
+	} else {
+		params.max_size_kb = recommended_max_size_kb;
+		igt_info("Adjusted settings: %d%% VRAM, %dMB max object\n",
+			 params.vram_percent, params.max_size_kb / 1024);
+	}
+}
+
 static void evict_ccs(int fd, uint32_t flags, const struct param *param)
 {
 	struct config config;
@@ -440,6 +471,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 		break;
 	case 'S':
 		params.max_size_kb = atoi(optarg);
+		params.user_set_max_size = true;
 		igt_debug("Max size kb: %d\n", params.max_size_kb);
 		break;
 	case 'V':
@@ -492,6 +524,7 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
 		{ },
 	};
 	uint64_t vram_size;
+	uint64_t vram_mb;
 	bool has_flatccs;
 	int fd;
 
@@ -500,6 +533,13 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
 		igt_require(xe_has_vram(fd));
 		vram_size = xe_visible_vram_size(fd, 0);
 		igt_assert(vram_size);
+		vram_mb = vram_size / (1024 * 1024);
+		/* Adjust the parameter to adjust the compression parameters
+		 * when resizable-BAR is turned off in BIOS
+		 */
+		if (vram_mb <= 256)
+			adjust_params_for_vram_size(vram_mb);
+
 		has_flatccs = HAS_FLATCCS(intel_get_drm_devid(fd));
 	}
 
-- 
2.34.1

