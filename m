Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372CD606A31D
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 14:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=XxEV+BcO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27DF10E637;
	Fri, 23 Oct 2026 14:55:53 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B759112BC4
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 14:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=zar1PaWatmvnL9SK35LWzRwOHkPFzcCHWQQ9FIhs4tY=; b=
 XxEV+BcOv3QmwaIeeYnPPeNMzCWh8vGy1CfCGnwCJpsIjIyB8E4dRxEwTM9Kd24laxWxM5gFk8cB1
 2IwZDoIThSoeLHfewi7rwIKZocm5T5u9YhireZm9l++jDJPpPqdeG+EARL8OVQYt1LH7yhmkBXSEo
 WcUWuV9XYB7ljDv7wmxjO4VY+w9KP2PpniX2iES0l0nHCn357USkJ7IcgwRqitkPkj8dKrfntiD6Q
 pj0VyeHwOXw6M/V7qt2lbWNrjbubqNrcbB67FsYT3o1L4/vkWsDUUnZ1R3H/j8bw/NxCfxyeaF2LO
 JH1IgXa6hL1PKYPVOoUwCkphll4DKOeLlQ==;
Received: from [81.79.79.1] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xKGbR-007yoX-K0; Fri, 23 Oct 2026 16:50:41 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: David Francis <David.Francis@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 06/10] tests/amd/criu: Test with more than one buffer
Date: Fri, 23 Oct 2026 15:50:28 +0100
Message-ID: <20261023145032.22650-7-tvrtko.ursulin@igalia.com>
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

Add a subtest which creates and maps multiple buffer objects.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 tests/amdgpu/amd_criu.c | 62 ++++++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 20 deletions(-)

diff --git a/tests/amdgpu/amd_criu.c b/tests/amdgpu/amd_criu.c
index 453c53d9a7df..c37ab9c4758b 100644
--- a/tests/amdgpu/amd_criu.c
+++ b/tests/amdgpu/amd_criu.c
@@ -21,37 +21,48 @@ static void wait_checkpoint(void)
 #define MAP_BO		(1 << 1)
 #define MMAP_BO		(1 << 2)
 #define DO_FORK		(1 << 3)
+#define MULTI_BO	(1 << 4)
 
 static void basic(amdgpu_device_handle dev, unsigned int flags)
 {
-	amdgpu_bo_handle bo;
-	amdgpu_va_handle va;
-	uint64_t gva;
+	const int num_bos = (flags & MULTI_BO) ? 10 : 1;
+	amdgpu_bo_handle bo[10];
+	amdgpu_va_handle va[10];
+	uint64_t gva[10];
 	void *addr;
-	int ret;
+	int i, ret;
 
 	if (flags & CREATE_BO) {
 		struct amdgpu_bo_alloc_request alloc = {
 			.alloc_size = BUFFER_SIZE,
 			.preferred_heap = AMDGPU_GEM_DOMAIN_GTT,
 		};
-		ret = amdgpu_bo_alloc(dev, &alloc, &bo);
-		igt_assert_eq(ret, 0);
+
+		for (i = 0; i < num_bos; i++) {
+			ret = amdgpu_bo_alloc(dev, &alloc, &bo[i]);
+			igt_assert_eq(ret, 0);
+		}
 	}
 
 	if (flags & MAP_BO) {
-		ret = amdgpu_va_range_alloc(dev, amdgpu_gpu_va_range_general,
-					    BUFFER_SIZE, 0, 0, &gva, &va, 0);
-		igt_assert_eq(ret, 0);
+		for (i = 0; i < num_bos; i++) {
+			ret = amdgpu_va_range_alloc(dev,
+						    amdgpu_gpu_va_range_general,
+						    BUFFER_SIZE, 0, 0, &gva[i],
+						    &va[i], 0);
+			igt_assert_eq(ret, 0);
 
-		ret = amdgpu_bo_va_op(bo, 0, BUFFER_SIZE, gva, 0,
-				      AMDGPU_VA_OP_MAP);
-		igt_assert_eq(ret, 0);
+			ret = amdgpu_bo_va_op(bo[i], 0, BUFFER_SIZE, gva[i], 0,
+					      AMDGPU_VA_OP_MAP);
+			igt_assert_eq(ret, 0);
+		}
 	}
 
 	if (flags & MMAP_BO) {
-		ret = amdgpu_bo_cpu_map(bo, &addr);
-		igt_assert_eq(ret, 0);
+		for (i = 0; i < num_bos; i++) {
+			ret = amdgpu_bo_cpu_map(bo[i], &addr);
+			igt_assert_eq(ret, 0);
+		}
 	}
 
 	if (flags & DO_FORK) {
@@ -65,16 +76,23 @@ static void basic(amdgpu_device_handle dev, unsigned int flags)
 		wait_checkpoint();
 	}
 
-	if (flags & MMAP_BO)
-		amdgpu_bo_cpu_unmap(bo);
+	if (flags & MMAP_BO) {
+		for (i = 0; i < num_bos; i++)
+			amdgpu_bo_cpu_unmap(bo[i]);
+	}
 
 	if (flags & MAP_BO) {
-		amdgpu_bo_va_op(bo, 0, BUFFER_SIZE, gva, 0, AMDGPU_VA_OP_UNMAP);
-		amdgpu_va_range_free(va);
+		for (i = 0; i < num_bos; i++) {
+			amdgpu_bo_va_op(bo[i], 0, BUFFER_SIZE, gva[i], 0,
+					AMDGPU_VA_OP_UNMAP);
+			amdgpu_va_range_free(va[i]);
+		}
 	}
 
-	if (flags & CREATE_BO)
-		amdgpu_bo_free(bo);
+	if (flags & CREATE_BO) {
+		for (i = 0; i < num_bos; i++)
+			amdgpu_bo_free(bo[i]);
+	}
 }
 
 int igt_main()
@@ -112,6 +130,10 @@ int igt_main()
 	igt_subtest("map-and-mmap-one")
 		basic(dev, CREATE_BO | MAP_BO | MMAP_BO);
 
+	igt_describe("Map and mmap multiple buffer objects");
+	igt_subtest("map-and-mmap-multiple")
+		basic(dev, CREATE_BO | MAP_BO | MMAP_BO | MULTI_BO);
+
 	igt_describe("Map and mmap one buffer object, then fork");
 	igt_subtest("map-mmap-fork")
 		basic(dev, CREATE_BO | MAP_BO | MMAP_BO | DO_FORK);
-- 
2.56.0

