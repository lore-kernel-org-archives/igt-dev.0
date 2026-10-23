Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26902606A31B
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=FShBKXtm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA9C10E0AA;
	Fri, 23 Oct 2026 14:52:30 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33361112BC5
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=+exnd+ajdt6fI89y9rIMbl0iKTwKNqmiFwLgzIM01g4=; b=
 FShBKXtmGhOivt7MnVbdL4oES6NCUxgdBFHcomj5/W1lmhLdIdFb8lZaWFwu8oKh+hng4tuBv4E1w
 0IVUmHyNbfZB+RzAgi0+T5fhg0gHshjiXBgONVuyEihpdauFkWMTgltFWO0do1yLWovX6anxwlhyW
 yLZx8oZA6i6Kk3xO185L5pyyNkmXLLaThe4yLucWkG0ERHMQwL3BaPAC8BzoDvKSTb56SsvhPmiOK
 Yhm7fnw1Lsr7i6fCVbO2fDV27latibKbbO0BC5Pb26JirVslafgvJnrE5HTJEYVUSK/pzZXwwAylz
 5z3NAl1tKOWfslSDygnTamd0feDaiHUT6A==;
Received: from [81.79.79.1] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xKGbS-007yoq-Ac; Fri, 23 Oct 2026 16:50:42 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: David Francis <David.Francis@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 07/10] tests/amd/criu: Add userptr tests
Date: Fri, 23 Oct 2026 15:50:29 +0100
Message-ID: <20261023145032.22650-8-tvrtko.ursulin@igalia.com>
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

Add a subtest which instantiates an userptr buffer object and the second
one which verifies the object is accessible post restore both from the CPU
and from the GPU.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 tests/amdgpu/amd_criu.c | 115 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 106 insertions(+), 9 deletions(-)

diff --git a/tests/amdgpu/amd_criu.c b/tests/amdgpu/amd_criu.c
index c37ab9c4758b..c9e3f2592c92 100644
--- a/tests/amdgpu/amd_criu.c
+++ b/tests/amdgpu/amd_criu.c
@@ -9,6 +9,9 @@
 #include <amdgpu.h>
 #include <amdgpu_drm.h>
 
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_sdma.h"
+
 static void wait_checkpoint(void)
 {
 	igt_info("Waiting for checkpoint or key...\n");
@@ -22,24 +25,42 @@ static void wait_checkpoint(void)
 #define MMAP_BO		(1 << 2)
 #define DO_FORK		(1 << 3)
 #define MULTI_BO	(1 << 4)
+#define TEST_USERPTR	(1 << 5)
+#define POST_TOUCH	(1 << 6)
+#define POST_SUBMIT	(1 << 7)
 
 static void basic(amdgpu_device_handle dev, unsigned int flags)
 {
 	const int num_bos = (flags & MULTI_BO) ? 10 : 1;
 	amdgpu_bo_handle bo[10];
 	amdgpu_va_handle va[10];
+	void *userptr[10];
 	uint64_t gva[10];
-	void *addr;
+	long page_size;
+	void *addr[10];
 	int i, ret;
 
+	page_size = sysconf(_SC_PAGESIZE);
+	igt_assert(page_size > 0);
+
 	if (flags & CREATE_BO) {
-		struct amdgpu_bo_alloc_request alloc = {
-			.alloc_size = BUFFER_SIZE,
-			.preferred_heap = AMDGPU_GEM_DOMAIN_GTT,
-		};
-
 		for (i = 0; i < num_bos; i++) {
-			ret = amdgpu_bo_alloc(dev, &alloc, &bo[i]);
+			if (flags & TEST_USERPTR) {
+				ret = posix_memalign(&userptr[i], page_size,
+						     BUFFER_SIZE);
+				igt_assert_eq(ret, 0);
+				ret = amdgpu_create_bo_from_user_mem(dev,
+								     userptr[i],
+								     BUFFER_SIZE,
+								     &bo[i]);
+			} else {
+				struct amdgpu_bo_alloc_request alloc = {
+					.alloc_size = BUFFER_SIZE,
+					.preferred_heap = AMDGPU_GEM_DOMAIN_GTT,
+				};
+
+				ret = amdgpu_bo_alloc(dev, &alloc, &bo[i]);
+			}
 			igt_assert_eq(ret, 0);
 		}
 	}
@@ -60,7 +81,7 @@ static void basic(amdgpu_device_handle dev, unsigned int flags)
 
 	if (flags & MMAP_BO) {
 		for (i = 0; i < num_bos; i++) {
-			ret = amdgpu_bo_cpu_map(bo[i], &addr);
+			ret = amdgpu_bo_cpu_map(bo[i], &addr[i]);
 			igt_assert_eq(ret, 0);
 		}
 	}
@@ -76,6 +97,70 @@ static void basic(amdgpu_device_handle dev, unsigned int flags)
 		wait_checkpoint();
 	}
 
+	if (flags & POST_TOUCH) {
+		igt_require(flags & (TEST_USERPTR | MMAP_BO));
+
+		if (flags & TEST_USERPTR) {
+			for (i = 0; i < num_bos; i++)
+				memset(userptr[i], 0, BUFFER_SIZE);
+		}
+
+		if (flags & MMAP_BO) {
+			for (i = 0; i < num_bos; i++)
+				memset(addr[i], 0, BUFFER_SIZE);
+		}
+	}
+
+	if (flags & POST_SUBMIT) {
+		struct amdgpu_cs_ib_info ib = {};
+		struct amdgpu_cs_request cs = {};
+		amdgpu_context_handle context;
+		amdgpu_bo_list_handle bo_list;
+		amdgpu_bo_handle handles[num_bos + 1];
+		amdgpu_bo_handle ib_handle;
+		amdgpu_va_handle va_handle;
+		uint32_t *ib_cpu;
+		uint64_t ib_mc;
+
+		ret = amdgpu_cs_ctx_create(dev, &context);
+		igt_assert_eq(ret, 0);
+
+		ret = amdgpu_bo_alloc_and_map(dev, 4096, 4096,
+					      AMDGPU_GEM_DOMAIN_GTT, 0,
+					      &ib_handle, (void **)&ib_cpu,
+					      &ib_mc, &va_handle);
+		igt_assert_eq(ret, 0);
+
+		for (i = 0; i < num_bos; i++)
+			handles[i] = bo[i];
+		handles[i] = ib_handle;
+
+		ret = amdgpu_bo_list_create(dev, num_bos + 1, handles, NULL,
+					    &bo_list);
+		igt_assert_eq(ret, 0);
+
+		*ib_cpu = SDMA_NOP;
+
+		ib.ib_mc_address = ib_mc;
+		ib.size = 1;
+
+		cs.ip_type = AMDGPU_HW_IP_DMA;
+		cs.number_of_ibs = 1;
+		cs.ibs = &ib;
+		cs.resources = bo_list;
+
+		ret = amdgpu_cs_submit(context, 0, &cs, 1);
+		igt_assert_eq(ret, 0);
+
+		amdgpu_bo_unmap_and_free(ib_handle, va_handle, ib_mc, 4096);
+
+		ret = amdgpu_bo_list_destroy(bo_list);
+		igt_assert_eq(ret, 0);
+
+		ret = amdgpu_cs_ctx_free(context);
+		igt_assert_eq(ret, 0);
+	}
+
 	if (flags & MMAP_BO) {
 		for (i = 0; i < num_bos; i++)
 			amdgpu_bo_cpu_unmap(bo[i]);
@@ -90,8 +175,12 @@ static void basic(amdgpu_device_handle dev, unsigned int flags)
 	}
 
 	if (flags & CREATE_BO) {
-		for (i = 0; i < num_bos; i++)
+		for (i = 0; i < num_bos; i++) {
 			amdgpu_bo_free(bo[i]);
+
+			if (flags & TEST_USERPTR)
+				free(userptr[i]);
+		}
 	}
 }
 
@@ -118,6 +207,14 @@ int igt_main()
 	igt_subtest("one-bo")
 		basic(dev, CREATE_BO);
 
+	igt_describe("Create one userptr object");
+	igt_subtest("one-userptr")
+		basic(dev, CREATE_BO | TEST_USERPTR);
+
+	igt_describe("Submit with one userptr object");
+	igt_subtest("submit-one-userptr")
+		basic(dev, CREATE_BO | TEST_USERPTR | POST_TOUCH | POST_SUBMIT);
+
 	igt_describe("Map one buffer object");
 	igt_subtest("map-one")
 		basic(dev, CREATE_BO | MAP_BO);
-- 
2.56.0

