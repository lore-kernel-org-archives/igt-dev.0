Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6278606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 01:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hRj/WBgw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9146A10F8E6;
	Wed,  4 Nov 2026 01:01:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763B010F8E5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 00:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753725; x=1825289725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MNN5T83zpT5xUAA3G8a7tZckI9TIICczr0uvoeJ1InE=;
 b=hRj/WBgwYr02Xv7TTXLyMDF1e7Q15uoJLeDdTrV0htq5TDEhgPdIv3Ar
 /RNWJZLvB5ihqIvjvCr9pN3FxSixjBYHZBKRzCtff1BSQZwOdFul48PuG
 PAckqfsA34bIuqok4L4YPjreBICfeSmo8DRepe8umn6mIeX2VKMeY1uc+
 lh1KmtFQfB/EYskxN4+7nK2yHsceAmWoHaOIlO4xxwFYkPZ4vPnC/gX/W
 Sia/PXF+oVdEAY9HxUJbl+F8ivLEneqpB4nnFQkOBisFBw1zz15UNdbPd
 B486sfCpPAodrzzM61GwApvxJJtktxSmyPyeaOA3m51NJXzfRZbCfvQ+5 Q==;
X-CSE-ConnectionGUID: S0rrZMu8TA27W6iwgbJCyw==
X-CSE-MsgGUID: 3NrhQ5V7Tu2j6+i/f9kq5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2506022"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2506022"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:09 -0800
X-CSE-ConnectionGUID: zzuclxMbT9WL5OAjQ/vjWg==
X-CSE-MsgGUID: 3tx4Tq+2QAOTg5h4uq7MVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6421558"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com
Subject: [PATCH v2 8/8] tests/intel/xe_oa: Add an all OA units variant to the
 unbind/rebind test
Date: Tue,  3 Nov 2026 16:55:14 -0800
Message-ID: <20261104005505.3232485-18-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
References: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
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

Open a stream with a mmapped OA buffer on every OA unit, so that unbind
quiesces streams on all GTs and OA units at once, and run all checks on
each of them.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index ffc1971cb361..4eb0b13f00b1 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2867,6 +2867,7 @@ static bool mem_is_zero(const void *vaddr, size_t len)
 #define UNBIND_CLOSE_BEFORE_REBIND	(1 << 0)
 #define UNBIND_STREAM_DISABLED		(1 << 1)
 #define UNBIND_EXEC_QUEUE		(1 << 2)
+#define UNBIND_ALL_UNITS		(1 << 3)
 
 #define UNBIND_MAX_STREAMS	16
 
@@ -3152,6 +3153,7 @@ static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int f
 	struct unbind_stream *primary = &streams[0];
 	const struct drm_xe_engine_class_instance *hwe = NULL;
 	bool disabled = flags & UNBIND_STREAM_DISABLED;
+	const struct drm_xe_oa_unit *oau;
 	uint32_t vm, exec_q = 0;
 	int ret, i;
 
@@ -3166,6 +3168,14 @@ static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int f
 
 	unbind_num_streams = 0;
 	unbind_stream_open(&streams[unbind_num_streams++], oau0, flags, exec_q, hwe);
+	if (flags & UNBIND_ALL_UNITS) {
+		for_each_oa_unit(oau) {
+			if (oau->oa_unit_id == oau0->oa_unit_id)
+				continue;
+			igt_assert_lt(unbind_num_streams, UNBIND_MAX_STREAMS);
+			unbind_stream_open(&streams[unbind_num_streams++], oau, flags, 0, NULL);
+		}
+	}
 	igt_debug("Opened %d OA stream(s)\n", unbind_num_streams);
 
 	/*
@@ -5713,6 +5723,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 			{ "open", 0 },
 			{ "disabled", UNBIND_STREAM_DISABLED },
 			{ "exec-queue", UNBIND_EXEC_QUEUE },
+			{ "all-units", UNBIND_ALL_UNITS },
 		};
 
 		for (int i = 0; i < ARRAY_SIZE(unbind_variants); i++) {
-- 
2.55.0

