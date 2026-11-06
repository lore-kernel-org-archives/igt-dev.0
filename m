Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED900606A901
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZPOGJ6WY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909C610F11D;
	Fri,  6 Nov 2026 09:39:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B1610E9AB
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793957904; x=1825493904;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mUuEjzIkAj4N/z75/yqddlTYvtP3zeTv0yD5YNebSic=;
 b=ZPOGJ6WY29XvCYz2Vnemamhkps8vTY5FxTrVQecPQVWnIY8oN4wmKeWe
 CQP6lMgnEVtcnJCXmU1WSzcK6sKulDlXcKBKeQqosu6qIKZZFIIsDmIgT
 hAlmXGIRfctZ65B/mn97ddGwAtA0LMT7GgM5rtNQhxsAhzmlbSlKh/xvj
 zrupNDINyPKMzzWdAsBR45x4bgbwa4g1HuD8p/vg6pfFZVWAo/vG2cFpC
 qybmDTAVR5FKVWPtk91WhOHnP0TBoW2cOjLP7CoXyE3MMFT9HJ8j+pgvc
 oEON3j4Nr62F4pFrf65Cy3YcpQrAq+1r5DB/e7x1Lx1rKBCqFmFGL+xQT Q==;
X-CSE-ConnectionGUID: ZZaSip6LQhe+PskAZzI3Zw==
X-CSE-MsgGUID: bYd6SHkfT8S580G6teYwqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2761697"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2761697"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 01:38:23 -0800
X-CSE-ConnectionGUID: n/V3dO3nTr+kbHcrvGILxg==
X-CSE-MsgGUID: ZP1pfe4XQCSGhoOYrxLXIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7358137"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa009.jf.intel.com with ESMTP; 06 Nov 2026 01:38:22 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_joiner: Continue after unsupported eDP
 pair
Date: Fri,  6 Nov 2026 09:38:19 +0000
Message-ID: <20261106093819.2897358-1-mika.kahola@intel.com>
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

Continue testing after the kernel rejects an eDP joiner pipe pair.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/intel/kms_joiner.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index fce24f2bd..924fd0f1d 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -277,7 +277,7 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
 
 static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
 {
-	int i;
+	int i, ret;
 	enum hardware_pipe pipe, master_pipe;
 	uint32_t available_pipe_mask = BIT(data->n_pipes) - 1;
 	igt_output_t *output;
@@ -301,7 +301,25 @@ static void test_single_joiner(data_t *data, int output_count, bool force_joiner
 			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
 					      DRM_FORMAT_MOD_LINEAR, &fb);
 			igt_plane_set_fb(primary, &fb);
-			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+			if (force_joiner &&
+			    output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+				ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+				if (ret == -EINVAL) {
+					igt_info("Kernel rejected eDP force joiner on pipe pair %s/%s; continuing\n",
+						 kmstest_pipe_name(pipe),
+						 kmstest_pipe_name(pipe + 1));
+					igt_display_reset(&data->display);
+					igt_plane_set_fb(primary, NULL);
+					igt_remove_fb(data->drm_fd, &fb);
+					continue;
+				}
+				igt_assert_f(ret == 0,
+					     "eDP force joiner modeset failed on pipe pair %s/%s: %d\n",
+					     kmstest_pipe_name(pipe),
+					     kmstest_pipe_name(pipe + 1), ret);
+			} else {
+				igt_display_commit2(&data->display, COMMIT_ATOMIC);
+			}
 			igt_display_reset(&data->display);
 			igt_plane_set_fb(primary, NULL);
 			igt_remove_fb(data->drm_fd, &fb);
-- 
2.43.0

