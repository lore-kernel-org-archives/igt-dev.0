Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CD060A2615
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JVFJwcWy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77E210E02F;
	Tue, 10 Nov 2026 08:27:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AB510E7CD
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 08:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794299188; x=1825835188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1mA0Ao7FeBw2zhv6uoSv3kIWDCS5GpLRGgTY70Dj+co=;
 b=JVFJwcWy9UMEB4uhFO+dHD2ddpFNqyS04rUz/SozQ2SRo3n/42V1lPat
 wt4idQlqba0O8fz5kwCNJH9MjM4ZllIJvRDFynBoFyzrCndSzo4P029O7
 m+O9QFtcBqW4+JRnWPbgwXm1XX34U9MGtRYt9/YRb1EIAx8aKVTBmeHj0
 VlxKFLKFdcbWRpDtx9h+cpb9L8K4fa777iXiK4GePMZNU2uPyhk1T+7PB
 uCQ1Kluf+1gae3IKV2iBAyznZhXoSuquhGCSB7KAVQt8jwVvlvud3Xow9
 HPhjJO/byd/MKq235k2Hf5dq+CDSw9sxm4KOQ8YY3loTKZ6YvvpdVimNa A==;
X-CSE-ConnectionGUID: vsE66A7zSsKiry3YUAncOQ==
X-CSE-MsgGUID: MHekgd4hTaekf6z6mCY+BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2955922"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2955922"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 00:26:26 -0800
X-CSE-ConnectionGUID: GLwphj38TsS/f01hwmCe9A==
X-CSE-MsgGUID: dKQc56DkTF+5c2d92IInKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8095589"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa002.jf.intel.com with ESMTP; 10 Nov 2026 00:26:25 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_psr2_sf: Skip PSR2 subtests when PSR2
 isn't enabled
Date: Tue, 10 Nov 2026 08:26:22 +0000
Message-ID: <20261110082622.3473582-1-mika.kahola@intel.com>
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

The driver can fall back to PSR1 even though the sink supports PSR2.
The psr2 subtests then never reach DEEP_SLEEP and fail with:

  CRITICAL: Test assertion failure function run, file ../tests/intel/kms_psr2_sf.c:964:
  CRITICAL: Failed assertion: psr_wait_entry(data->debugfs_fd, data->psr_mode, data->output)

Turn this failure into a skip when the driver didn't enable PSR2. Clean
up first, so that the Panel Replay subtests running next start from a
clean state.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/intel/kms_psr2_sf.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index fa7090ce8..2a5915c72 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -401,6 +401,8 @@ static void plane_move_setup_square(data_t *data, igt_fb_t *fb, uint32_t h,
 	set_clip(&data->plane_move_clip, x, y, SQUARE_SIZE, SQUARE_SIZE);
 }
 
+static void cleanup(data_t *data);
+
 static void prepare(data_t *data)
 {
 	igt_output_t *output = data->output;
@@ -562,6 +564,16 @@ static void prepare(data_t *data)
 	if (data->op_fbc_mode == FBC_ENABLED)
 		igt_require_f(data->fbc_flag,
 			      "Can't test FBC with PSR\n");
+
+	/* Sink support doesn't guarantee the driver enables PSR2. */
+	if (data->psr_mode == PSR_MODE_2) {
+		enum psr_mode mode = psr_get_mode(data->debugfs_fd, output);
+
+		if (mode != PSR_MODE_2 && mode != PSR_MODE_2_SEL_FETCH) {
+			cleanup(data);
+			igt_skip("PSR2 not enabled by the driver\n");
+		}
+	}
 }
 
 static inline void manual(const char *expected)
-- 
2.43.0

