Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27869606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 01:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AGaQhIX2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC8A10F8EE;
	Wed,  4 Nov 2026 01:00:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E7510E66C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 00:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753725; x=1825289725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s6dUfDqOhEDZbjNX4v0HXa2M9fEnGAc7jKulAFjodU4=;
 b=AGaQhIX2RkgqlGlmRPUgLhKMcKvtHlBHV7a7jkOzyvlS+suXsCwz4zN1
 FXLbjRVwOS76ifMHu7NXq5QKsFbdulJeFKyzQD1mtVYukW41Va1ya0u17
 ZyDTGP6X1k1zLGxTKf0KzdBLJ3XC9pwEYqSXfop2f7YbuovkyIVmq8ceQ
 IHdAUJ3gP0qDqOm4u2n1rhrjpntQfaK4UOROCUjTvflkiZMfhf4pLaecY
 2WkVPo1DpQb9hLDiw0E4WrZAE6FxBgJfceatGHg45uPuI18wPvE/bBany
 seIIKp0ofBoe6HPS2kmuIndfOl2u5mutnMTJ9Hmhpy1SirfuDJtzva5GS A==;
X-CSE-ConnectionGUID: QOmSp2gpTsCZBGw0hKPReg==
X-CSE-MsgGUID: hWlvIIbARbSnLxvLoXqDxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2506021"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2506021"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:09 -0800
X-CSE-ConnectionGUID: U81WWyM2T9my5cmzSFM8lw==
X-CSE-MsgGUID: etAf0dSySOyozyqlK14ylg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6421555"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com
Subject: [PATCH v2 7/8] tests/intel/xe_oa: Add an exec queue variant to the
 unbind/rebind test
Date: Tue,  3 Nov 2026 16:55:13 -0800
Message-ID: <20261104005505.3232485-17-umesh.nerlige.ramappa@intel.com>
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

Open the stream on an exec queue with preemption disabled. Unbind then
also restores the OA context state with an LRI batch on the exec queue
and restores preemption and timeslicing.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index f1fe5f44c408..ffc1971cb361 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2866,6 +2866,7 @@ static bool mem_is_zero(const void *vaddr, size_t len)
 
 #define UNBIND_CLOSE_BEFORE_REBIND	(1 << 0)
 #define UNBIND_STREAM_DISABLED		(1 << 1)
+#define UNBIND_EXEC_QUEUE		(1 << 2)
 
 #define UNBIND_MAX_STREAMS	16
 
@@ -2898,7 +2899,8 @@ static bool unbind_waiters_started;
 static volatile bool unbind_waiters_stop;
 
 static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_unit *oau,
-			       unsigned int flags)
+			       unsigned int flags, uint32_t exec_q,
+			       const struct drm_xe_engine_class_instance *hwe)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
@@ -2923,6 +2925,14 @@ static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_u
 		s->properties[n++] = DRM_XE_OA_PROPERTY_OA_DISABLED;
 		s->properties[n++] = true;
 	}
+	if (exec_q) {
+		s->properties[n++] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
+		s->properties[n++] = exec_q;
+		s->properties[n++] = DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE;
+		s->properties[n++] = hwe->engine_instance;
+		s->properties[n++] = DRM_XE_OA_PROPERTY_NO_PREEMPT;
+		s->properties[n++] = true;
+	}
 	igt_assert_lte(n, ARRAY_SIZE(s->properties));
 
 	s->param.num_properties = n / 2;
@@ -3140,14 +3150,22 @@ static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int f
 {
 	struct unbind_stream *streams = unbind_streams;
 	struct unbind_stream *primary = &streams[0];
+	const struct drm_xe_engine_class_instance *hwe = NULL;
 	bool disabled = flags & UNBIND_STREAM_DISABLED;
+	uint32_t vm, exec_q = 0;
 	int ret, i;
 
 	igt_device_get_pci_slot_name(drm_fd, unbind_pci_slot);
 	igt_debug("Device %s\n", unbind_pci_slot);
 
+	if (flags & UNBIND_EXEC_QUEUE) {
+		hwe = oa_unit_engine(oau0);
+		vm = xe_vm_create(drm_fd, 0, 0);
+		exec_q = xe_exec_queue_create_deconst(drm_fd, vm, hwe, 0);
+	}
+
 	unbind_num_streams = 0;
-	unbind_stream_open(&streams[unbind_num_streams++], oau0, flags);
+	unbind_stream_open(&streams[unbind_num_streams++], oau0, flags, exec_q, hwe);
 	igt_debug("Opened %d OA stream(s)\n", unbind_num_streams);
 
 	/*
@@ -3185,7 +3203,10 @@ static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int f
 		igt_reset_timeout();
 	}
 
-	/* Drop all state of the removed device, the drm fd also refers to it */
+	/*
+	 * Drop all state of the removed device, the drm fd also refers to it. The exec
+	 * queue and vm can't be destroyed on a removed device, they go with the drm fd.
+	 */
 	oa_device_fini();
 
 	igt_set_timeout(60, "xe bind timed out (wedged?)");
@@ -5691,6 +5712,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 			{ "close", UNBIND_CLOSE_BEFORE_REBIND },
 			{ "open", 0 },
 			{ "disabled", UNBIND_STREAM_DISABLED },
+			{ "exec-queue", UNBIND_EXEC_QUEUE },
 		};
 
 		for (int i = 0; i < ARRAY_SIZE(unbind_variants); i++) {
-- 
2.55.0

