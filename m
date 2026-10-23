Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB788606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 15:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=pqCd68ym
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6501110E0AA;
	Fri, 23 Oct 2026 15:01:07 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAB010E663
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 14:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=f7cjTCNbIUIDR2rE99G/eJgrFtwkaUeq0bbuz171Vag=; b=
 pqCd68ymGOChYWmV0r3yYoGhhjvstCSGgGq73tXyEv31JNSXAkBnywVo9TI0IxZ8rTMoBp8mm5BVW
 lvZQ3Rl0zQg4y0aGk1H8pcIUw4CJbfLiYXuU4/JuAkKYBd6yyDIKjgxACi+DyH7iBvmpjMR6LePD9
 3XpD4aQ9zIdK/mAPfqCO5z7b4zR65Um+m391gkzLS7qYVL+PCG9uJtz+8cxlBMgYjI4buTbvnr/sL
 lkGltsYunBvMdkF0gAusCrWyN6xpr8/lAYObQ/fe80KR63p/xt9wdxkBB+GoeE/yvqlbGeGqXlJRK
 RgFVskDEWNVOgPuOTdz+NfJ3q/XbM5h1IQ==;
Received: from [81.79.79.1] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xKGbP-007yoF-Fz; Fri, 23 Oct 2026 16:50:39 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: David Francis <David.Francis@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 03/10] tests/amd/gem_list_handles: Test the userptr flag
Date: Fri, 23 Oct 2026 15:50:25 +0100
Message-ID: <20261023145032.22650-4-tvrtko.ursulin@igalia.com>
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

Add a test case which creates a mix of normal and userptr buffer objects
so we can exercise the new AMDGPU_GEM_LIST_HANDLES_FLAG_IS_USERPTR flag.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: David Francis <David.Francis@amd.com>
---
 tests/amdgpu/amd_list_handles.c | 59 ++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/tests/amdgpu/amd_list_handles.c b/tests/amdgpu/amd_list_handles.c
index 2c05e8fcdfed..b594ce4e984e 100644
--- a/tests/amdgpu/amd_list_handles.c
+++ b/tests/amdgpu/amd_list_handles.c
@@ -16,9 +16,12 @@
 #define TEST_FAULT   (1 << 1)
 #define TEST_TWOPASS (1 << 2)
 #define TEST_PROBE   (1 << 3)
+#define TEST_USERPTR (1 << 4)
 
 #define BUFFER_SIZE	4096
 
+#define __AMDGPU_GEM_LIST_HANDLES_FLAG_IS_USERPTR	(1 << 1)
+
 static void
 basic(amdgpu_device_handle dev, unsigned int num_bos, unsigned int flags)
 {
@@ -29,17 +32,32 @@ basic(amdgpu_device_handle dev, unsigned int num_bos, unsigned int flags)
 	};
 	int fd = amdgpu_device_get_fd(dev);
 	amdgpu_bo_handle bo[num_bos];
+	void *userptr[num_bos];
+	long page_size;
 	int i, ret;
 
 	igt_assert_fd(fd);
 
+	page_size = sysconf(_SC_PAGESIZE);
+	igt_assert(page_size > 0);
+
 	for (i = 0; i < num_bos; i++) {
-		struct amdgpu_bo_alloc_request alloc = {
-			.alloc_size = BUFFER_SIZE,
-			.preferred_heap = AMDGPU_GEM_DOMAIN_GTT,
-		};
+		if ((flags & TEST_USERPTR) && (i & 1)) {
+			ret = posix_memalign(&userptr[i], page_size,
+					     BUFFER_SIZE);
+			igt_assert_eq(ret, 0);
+			ret = amdgpu_create_bo_from_user_mem(dev,
+							     userptr[i],
+							     BUFFER_SIZE,
+							     &bo[i]);
+		} else {
+			struct amdgpu_bo_alloc_request alloc = {
+				.alloc_size = BUFFER_SIZE,
+				.preferred_heap = AMDGPU_GEM_DOMAIN_GTT,
+			};
 
-		ret = amdgpu_bo_alloc(dev, &alloc, &bo[i]);
+			ret = amdgpu_bo_alloc(dev, &alloc, &bo[i]);
+		}
 		igt_assert_eq(ret, 0);
 	}
 
@@ -77,6 +95,7 @@ basic(amdgpu_device_handle dev, unsigned int num_bos, unsigned int flags)
 
 	for (i = 0; i < num_bos; i++) {
 		struct drm_amdgpu_gem_list_handles_entry *e = &entry[i];
+		bool is_userptr = (flags & TEST_USERPTR) && (i & 1);
 		uint32_t handle;
 
 		ret = amdgpu_bo_export(bo[i],
@@ -85,18 +104,30 @@ basic(amdgpu_device_handle dev, unsigned int num_bos, unsigned int flags)
 		igt_assert_eq(ret, 0);
 		igt_assert_eq(e->gem_handle, handle);
 
-		igt_assert_eq(e->flags, 0);
+		if (is_userptr) {
+			igt_assert_eq(e->flags, __AMDGPU_GEM_LIST_HANDLES_FLAG_IS_USERPTR);
+			igt_assert_eq(e->alloc_flags,
+				      AMDGPU_GEM_USERPTR_ANONONLY |
+				      AMDGPU_GEM_USERPTR_VALIDATE |
+				      AMDGPU_GEM_USERPTR_REGISTER);
+			igt_assert_eq(e->alignment, (uint64_t)userptr[i]);
+		} else {
+			igt_assert_eq(e->flags, 0);
+			igt_assert_eq(e->preferred_domains, AMDGPU_GEM_DOMAIN_GTT);
+			igt_assert_eq(e->alloc_flags,
+				      AMDGPU_GEM_CREATE_VRAM_CLEARED |
+				      AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);
+			igt_assert_eq(e->alignment, 0);
+		}
 		igt_assert_eq(e->size, BUFFER_SIZE);
-		igt_assert_eq(e->preferred_domains, AMDGPU_GEM_DOMAIN_GTT);
-		igt_assert_eq(e->alloc_flags,
-			      AMDGPU_GEM_CREATE_VRAM_CLEARED |
-			      AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);
-		igt_assert_eq(e->alignment, 0);
 	}
 
 out:
-	for (i = 0; i < num_bos; i++)
+	for (i = 0; i < num_bos; i++) {
 		amdgpu_bo_free(bo[i]);
+		if ((flags & TEST_USERPTR) && (i & 1))
+			free(userptr[i]);
+	}
 }
 
 int igt_main()
@@ -134,6 +165,10 @@ int igt_main()
 	igt_subtest("many-bo")
 		basic(dev, 1024, 0);
 
+	igt_describe("Create and list many buffer and userptr objects");
+	igt_subtest("many-mixed-bo")
+		basic(dev, 1024, TEST_USERPTR);
+
 	igt_describe("Create and list many buffer objects in two-pass mode");
 	igt_subtest("many-bo-two-pass")
 		basic(dev, 16, TEST_TWOPASS);
-- 
2.56.0

