Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFC4606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 14:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=S5P+UWg2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24A910E0AA;
	Fri, 23 Oct 2026 14:54:09 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9933310E496
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=EnVQZ/9bB/o1NZ4vBGLIu410AM1mIhEkb/2lYo1jb88=; b=
 S5P+UWg2tc5GYBUU6eorhQP6VVsTmbVC0a2+ypbc/nH8SD95S7DOqIV2F7m0xTNFPZectrHbA2S1N
 uwtPuZzt/NNSNW/ViKJP4cT4KCMvSMBAxSYEwLyGnn/43451c0dUWnZ3HYwb8ym1pwT1JHFaoG/YB
 t2U200DXOVSSSeVozjzjjatG2lq9cbstCeM77/osi/xhvL1qW/t6KECJhfjO7JKYoLsy0+NOMge9V
 Cb/z3jAgf493hd1n359VUg3g7y246DXG/O5DxhiyQ0ZOR3NVFyeojmxQ17dkbus6dGCZpgZCuPrQ0
 PHrCPZTEVlCQ3sqQTvnujkBmhqK1A9pPgQ==;
Received: from [81.79.79.1] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xKGbT-007ypA-OK; Fri, 23 Oct 2026 16:50:43 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: David Francis <David.Francis@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 09/10] tests/amd/criu: Add a busy client test
Date: Fri, 23 Oct 2026 15:50:31 +0100
Message-ID: <20261023145032.22650-10-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023145032.22650-1-tvrtko.ursulin@igalia.com>
References: <20261023145032.22650-1-tvrtko.ursulin@igalia.com>
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
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a test which checks whether a client which is constantly submitting
no-op jobs can be checkpointed and restored undisturbed.

Contrary to previous tests it requires the checkpointing to be started
within a ten second window from executing the test.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 tests/amdgpu/amd_criu.c | 57 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/tests/amdgpu/amd_criu.c b/tests/amdgpu/amd_criu.c
index 5596b7dac4fa..490661dd4f22 100644
--- a/tests/amdgpu/amd_criu.c
+++ b/tests/amdgpu/amd_criu.c
@@ -220,6 +220,59 @@ static void context_rename(amdgpu_device_handle dev)
 	igt_assert_eq(ret, 0);
 }
 
+static void busy_client(amdgpu_device_handle dev)
+{
+	struct amdgpu_cs_fence fence_status = {
+		.ip_type = AMDGPU_HW_IP_DMA,
+	};
+	struct amdgpu_cs_ib_info ib = {};
+	struct amdgpu_cs_request cs = {};
+	const unsigned int timeout = 10;
+	amdgpu_context_handle context;
+	amdgpu_bo_handle ib_handle;
+	amdgpu_va_handle va_handle;
+	uint32_t *ib_cpu, expired;
+	uint64_t ib_mc;
+	int ret;
+
+	ret = amdgpu_cs_ctx_create(dev, &context);
+	igt_assert_eq(ret, 0);
+	fence_status.context = context;
+
+	ret = amdgpu_bo_alloc_and_map(dev, 4096, 4096,
+				      AMDGPU_GEM_DOMAIN_GTT,
+				      AMDGPU_GEM_CREATE_VM_ALWAYS_VALID,
+				      &ib_handle, (void **)&ib_cpu,
+				      &ib_mc, &va_handle);
+	igt_assert_eq(ret, 0);
+
+	*ib_cpu = SDMA_NOP;
+
+	ib.ib_mc_address = ib_mc;
+	ib.size = 1;
+
+	cs.ip_type = AMDGPU_HW_IP_DMA;
+	cs.number_of_ibs = 1;
+	cs.ibs = &ib;
+
+	igt_info("Start checkpointing within %u seconds...\n", timeout);
+	igt_until_timeout(timeout) {
+		ret = amdgpu_cs_submit(context, 0, &cs, 1);
+		igt_assert_eq(ret, 0);
+		fence_status.fence = cs.seq_no;
+	}
+
+	ret = amdgpu_cs_query_fence_status(&fence_status,
+					   AMDGPU_TIMEOUT_INFINITE, 0,
+					   &expired);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(expired, 1);
+
+	ret = amdgpu_cs_ctx_free(context);
+	igt_assert_eq(ret, 0);
+
+	amdgpu_bo_unmap_and_free(ib_handle, va_handle, ib_mc, 4096);
+}
 
 int igt_main()
 {
@@ -284,6 +337,10 @@ int igt_main()
 	igt_subtest("context-rename")
 		context_rename(dev);
 
+	igt_describe("Busy client test");
+	igt_subtest("busy-client")
+		busy_client(dev);
+
 	igt_fixture() {
 		amdgpu_device_deinitialize(dev);
 		drm_close_driver(fd);
-- 
2.56.0

