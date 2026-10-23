Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7577606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=qmhEsWbZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803AE10E0AA;
	Fri, 23 Oct 2026 14:58:19 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56ADD10E63C
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=EPzz+C9x0BAU5MI9q9NYlcSd6594yoxxI6wLPzADHX4=; b=
 qmhEsWbZOSCYVq42PV/550KDiODa4Ae1SosGibU9uf+LTh/I26fSh7UnXNTFILNqiCaQvG0ouSgB8
 zPRtJwEUuPvUgaR0EwIOUPixNQt+7LbGuJBQx3EnZ8g0xowX5XlIheaifcZTY/33MMSEuyEiXqj5l
 bENyOuumcnEMJ3SwFKTc2BflC1Wd0iewmflnYpUq8mGXuV6ykAtAPwW5+1RsU1iUy+O6Mfb5rG8YU
 ncz8qQ/hcgetU/89fz02oNU5zq4mWeDE8mTBlFJGPUVhIaqHgnmAxMmprrVr2mw3ocat/BsWwN3ke
 W2WuYgFImQVPyxDS1/AzUdQ99nK/6n4zMg==;
Received: from [81.79.79.1] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xKGbU-007ypL-GF; Fri, 23 Oct 2026 16:50:44 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: David Francis <David.Francis@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 10/10] tests/amd/criu: Add buffer object content
 verification tests
Date: Fri, 23 Oct 2026 15:50:32 +0100
Message-ID: <20261023145032.22650-11-tvrtko.ursulin@igalia.com>
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

So far the tests only looked at whether clients with different
combinations of amdgpu uapi usage can be checkpointed and restored,
with the exception of the busy client test which also required the
indirect buffer content to be somewhat preserved.

Lets add some more detailed content verification to some paths via a
couple of new subtests.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 tests/amdgpu/amd_criu.c | 45 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_criu.c b/tests/amdgpu/amd_criu.c
index 490661dd4f22..74f539f5e0c8 100644
--- a/tests/amdgpu/amd_criu.c
+++ b/tests/amdgpu/amd_criu.c
@@ -29,6 +29,7 @@ static void wait_checkpoint(void)
 #define POST_TOUCH	(1 << 6)
 #define POST_SUBMIT	(1 << 7)
 #define TEST_CONTEXT	(1 << 8)
+#define VERIFY_CONTENT	(1 << 9)
 
 static void basic(amdgpu_device_handle dev, unsigned int flags)
 {
@@ -88,6 +89,15 @@ static void basic(amdgpu_device_handle dev, unsigned int flags)
 		}
 	}
 
+	if (flags & VERIFY_CONTENT) {
+		for (i = 0; i < num_bos; i++) {
+			uint32_t *ptr = addr[i];
+
+			for (int j = 0; j < BUFFER_SIZE / sizeof(u32); j++, ptr++)
+				*ptr = 0xdeadc0de;
+		}
+	}
+
 	if (flags & TEST_CONTEXT) {
 		ret = amdgpu_cs_ctx_create(dev, &context);
 		igt_assert_eq(ret, 0);
@@ -166,6 +176,15 @@ static void basic(amdgpu_device_handle dev, unsigned int flags)
 		igt_assert_eq(ret, 0);
 	}
 
+	if (flags & VERIFY_CONTENT) {
+		for (i = 0; i < num_bos; i++) {
+			uint32_t *ptr = addr[i];
+
+			for (int j = 0; j < BUFFER_SIZE / sizeof(u32); j++, ptr++)
+				igt_assert_eq(*ptr, 0xdeadc0de);
+		}
+	}
+
 	if (flags & MMAP_BO) {
 		for (i = 0; i < num_bos; i++)
 			amdgpu_bo_cpu_unmap(bo[i]);
@@ -220,7 +239,7 @@ static void context_rename(amdgpu_device_handle dev)
 	igt_assert_eq(ret, 0);
 }
 
-static void busy_client(amdgpu_device_handle dev)
+static void busy_client(amdgpu_device_handle dev, unsigned int flags)
 {
 	struct amdgpu_cs_fence fence_status = {
 		.ip_type = AMDGPU_HW_IP_DMA,
@@ -246,6 +265,14 @@ static void busy_client(amdgpu_device_handle dev)
 				      &ib_mc, &va_handle);
 	igt_assert_eq(ret, 0);
 
+	if (flags & VERIFY_CONTENT) {
+		/*
+		 * IB buffer is just a buffer and it is alredy mapped so we can
+		 * use it to check if buffer object content has been correctly
+		 * preserved.
+		 */
+		memset(ib_cpu, 0xff, 4096);
+	}
 	*ib_cpu = SDMA_NOP;
 
 	ib.ib_mc_address = ib_mc;
@@ -271,6 +298,12 @@ static void busy_client(amdgpu_device_handle dev)
 	ret = amdgpu_cs_ctx_free(context);
 	igt_assert_eq(ret, 0);
 
+	if (flags & VERIFY_CONTENT) {
+		igt_assert_eq(ib_cpu[0], SDMA_NOP);
+		for (int i = 1; i < 4096 / sizeof(*ib_cpu); i++)
+			igt_assert_eq(ib_cpu[i], -1);
+	}
+
 	amdgpu_bo_unmap_and_free(ib_handle, va_handle, ib_mc, 4096);
 }
 
@@ -321,6 +354,10 @@ int igt_main()
 	igt_subtest("mmap-one")
 		basic(dev, CREATE_BO | MMAP_BO);
 
+	igt_describe("Mmap one buffer object and check content");
+	igt_subtest("mmap-one-check")
+		basic(dev, CREATE_BO | MMAP_BO | VERIFY_CONTENT);
+
 	igt_describe("Map and mmap one buffer object");
 	igt_subtest("map-and-mmap-one")
 		basic(dev, CREATE_BO | MAP_BO | MMAP_BO);
@@ -339,7 +376,11 @@ int igt_main()
 
 	igt_describe("Busy client test");
 	igt_subtest("busy-client")
-		busy_client(dev);
+		busy_client(dev, 0);
+
+	igt_describe("Busy client test with content check");
+	igt_subtest("busy-client-content")
+		busy_client(dev, VERIFY_CONTENT);
 
 	igt_fixture() {
 		amdgpu_device_deinitialize(dev);
-- 
2.56.0

