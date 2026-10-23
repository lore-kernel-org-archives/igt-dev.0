Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD80606A31B
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 14:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=KGA+0LIF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B31310E0AA;
	Fri, 23 Oct 2026 14:57:31 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D9F10E0AA
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=3KRQVInEKap8lDUPqlRyE/+S1JzkLH0zo/Gq5xi81ws=; b=
 KGA+0LIFu5WD5qpvjIW6smPnpXAiyl9Fx8EJvdEA4aOXPLdS17fdZKDaMsAa1Igan9DaiV805JDC7
 QeOFTUC+H51zNP2cGBbbkZ+esn7bsTNiixcs2rHqjCj0cN+3UB+Fddrhv7BshCggDG0p8PYyPVZ+R
 VkF4itt9qEkvQQspNOMF7i4dwOQ5LfOYoXNIgTASNNRDZ480sjGALlmhdeWuz9kwSpnJZpFMzLbyN
 t5h3zsdVtLlfFTYfCQ6s6uxv02BaMHyFjY2/s5pdOpaWJTAPEvvQaVT95DPelH5+IxZ3hfsOQhVFV
 v04HmdkAl6cMV+mywJVUoEP3gDoSgvldSw==;
Received: from [81.79.79.1] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xKGbT-007yp6-1S; Fri, 23 Oct 2026 16:50:43 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: David Francis <David.Francis@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 08/10] tests/amd/criu: Add context handling tests
Date: Fri, 23 Oct 2026 15:50:30 +0100
Message-ID: <20261023145032.22650-9-tvrtko.ursulin@igalia.com>
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

Add subtests which verify non-default contexts can be created and
restored.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 tests/amdgpu/amd_criu.c | 61 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 6 deletions(-)

diff --git a/tests/amdgpu/amd_criu.c b/tests/amdgpu/amd_criu.c
index c9e3f2592c92..5596b7dac4fa 100644
--- a/tests/amdgpu/amd_criu.c
+++ b/tests/amdgpu/amd_criu.c
@@ -28,10 +28,12 @@ static void wait_checkpoint(void)
 #define TEST_USERPTR	(1 << 5)
 #define POST_TOUCH	(1 << 6)
 #define POST_SUBMIT	(1 << 7)
+#define TEST_CONTEXT	(1 << 8)
 
 static void basic(amdgpu_device_handle dev, unsigned int flags)
 {
 	const int num_bos = (flags & MULTI_BO) ? 10 : 1;
+	amdgpu_context_handle context;
 	amdgpu_bo_handle bo[10];
 	amdgpu_va_handle va[10];
 	void *userptr[10];
@@ -86,6 +88,11 @@ static void basic(amdgpu_device_handle dev, unsigned int flags)
 		}
 	}
 
+	if (flags & TEST_CONTEXT) {
+		ret = amdgpu_cs_ctx_create(dev, &context);
+		igt_assert_eq(ret, 0);
+	}
+
 	if (flags & DO_FORK) {
 		struct igt_helper_process child = {};
 
@@ -114,7 +121,6 @@ static void basic(amdgpu_device_handle dev, unsigned int flags)
 	if (flags & POST_SUBMIT) {
 		struct amdgpu_cs_ib_info ib = {};
 		struct amdgpu_cs_request cs = {};
-		amdgpu_context_handle context;
 		amdgpu_bo_list_handle bo_list;
 		amdgpu_bo_handle handles[num_bos + 1];
 		amdgpu_bo_handle ib_handle;
@@ -122,8 +128,10 @@ static void basic(amdgpu_device_handle dev, unsigned int flags)
 		uint32_t *ib_cpu;
 		uint64_t ib_mc;
 
-		ret = amdgpu_cs_ctx_create(dev, &context);
-		igt_assert_eq(ret, 0);
+		if (!(flags & TEST_CONTEXT)) {
+			ret = amdgpu_cs_ctx_create(dev, &context);
+			igt_assert_eq(ret, 0);
+		}
 
 		ret = amdgpu_bo_alloc_and_map(dev, 4096, 4096,
 					      AMDGPU_GEM_DOMAIN_GTT, 0,
@@ -156,9 +164,6 @@ static void basic(amdgpu_device_handle dev, unsigned int flags)
 
 		ret = amdgpu_bo_list_destroy(bo_list);
 		igt_assert_eq(ret, 0);
-
-		ret = amdgpu_cs_ctx_free(context);
-		igt_assert_eq(ret, 0);
 	}
 
 	if (flags & MMAP_BO) {
@@ -182,8 +187,40 @@ static void basic(amdgpu_device_handle dev, unsigned int flags)
 				free(userptr[i]);
 		}
 	}
+
+	if (flags & (TEST_CONTEXT | POST_SUBMIT)) {
+		ret = amdgpu_cs_ctx_free(context);
+		igt_assert_eq(ret, 0);
+	}
 }
 
+static void context_rename(amdgpu_device_handle dev)
+{
+	amdgpu_context_handle context[3];
+	int ret;
+
+	ret = amdgpu_cs_ctx_create(dev, &context[0]);
+	igt_assert_eq(ret, 0);
+
+	ret = amdgpu_cs_ctx_create(dev, &context[1]);
+	igt_assert_eq(ret, 0);
+
+	ret = amdgpu_cs_ctx_create(dev, &context[2]);
+	igt_assert_eq(ret, 0);
+
+	ret = amdgpu_cs_ctx_free(context[1]);
+	igt_assert_eq(ret, 0);
+
+	wait_checkpoint();
+
+	ret = amdgpu_cs_ctx_free(context[0]);
+	igt_assert_eq(ret, 0);
+
+	ret = amdgpu_cs_ctx_free(context[2]);
+	igt_assert_eq(ret, 0);
+}
+
+
 int igt_main()
 {
 	amdgpu_device_handle dev;
@@ -207,6 +244,14 @@ int igt_main()
 	igt_subtest("one-bo")
 		basic(dev, CREATE_BO);
 
+	igt_describe("Create one buffer object and one context");
+	igt_subtest("one-bo-one-context")
+		basic(dev, CREATE_BO | TEST_CONTEXT);
+
+	igt_describe("Create one buffer object, one context, and submit");
+	igt_subtest("one-bo-one-context-submit")
+		basic(dev, CREATE_BO | TEST_CONTEXT | POST_SUBMIT);
+
 	igt_describe("Create one userptr object");
 	igt_subtest("one-userptr")
 		basic(dev, CREATE_BO | TEST_USERPTR);
@@ -235,6 +280,10 @@ int igt_main()
 	igt_subtest("map-mmap-fork")
 		basic(dev, CREATE_BO | MAP_BO | MMAP_BO | DO_FORK);
 
+	igt_describe("Check context rename works");
+	igt_subtest("context-rename")
+		context_rename(dev);
+
 	igt_fixture() {
 		amdgpu_device_deinitialize(dev);
 		drm_close_driver(fd);
-- 
2.56.0

