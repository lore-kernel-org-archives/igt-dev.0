Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0A8C5B56A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 14:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA8C10F040;
	Wed, 12 Aug 2026 14:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhabdrZ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BB410F040
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786545954; x=1818081954;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XHgQZwo8jId9RES+a3oRgKrks5tiDwjByNH0XZWFw2k=;
 b=RhabdrZ4ajpqq32gguDGlxRsQuKtBhay3fAZaMOTlDK/jnYPYMiqh39P
 g1tnOpMGkTlXJO3lje8kenLMv8+LiwShghsEUYHyJgqx3bJMvGl4neNQS
 PGqrdH0ZXOopTXpc/0VFyu80bwmqzViUI/OthabuC95FdMAP9SlMwqw3W
 rwul3hnKZ4GVBy50h7t2lTIzDKlxl2muu0SecOT2o+JVcN04FsPgyh4pq
 Ceqf+c75YHjjY+RINWgzLc/aQmUseI9ueMRvgOYuyfPhM0oZmwQmDVxCd
 oBKHJI4x59wb4dMBReQJO0u8Rz3bGUZIPW/Y4xXKIWGNPE0Bo+RR9jNwQ g==;
X-CSE-ConnectionGUID: U6KT7nRSQgaIbkV1bMXa7g==
X-CSE-MsgGUID: iYQSI8GgTiGyx7bybU1xpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104636425"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="104636425"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 07:45:53 -0700
X-CSE-ConnectionGUID: e0XNincbQYqzUJL7FsyiFQ==
X-CSE-MsgGUID: 846td2HOTOOtOb3hayB+Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="288436221"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.183])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 07:45:50 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t] tests/intel/gem_exec_params: add
 invalid-offset-multiple-buffers test
Date: Wed, 12 Aug 2026 16:43:32 +0200
Message-ID: <20260812144331.41158-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add coverage for the case where the batch start offset is invalid with
multiple BOs submitted, which was buggy in the kernel until 4fe2bd195435
("drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffer")

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel/gem_exec_params.c | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
index 3ba4c530b..757115a21 100644
--- a/tests/intel/gem_exec_params.c
+++ b/tests/intel/gem_exec_params.c
@@ -85,6 +85,8 @@
  *
  * SUBTEST: invalid-flag
  *
+ * SUBTEST: invalid-offset-multiple-buffers
+ *
  * SUBTEST: invalid-ring
  *
  * SUBTEST: invalid-ring2
@@ -404,6 +406,49 @@ static void test_invalid_batch_start(int fd)
 	gem_close(fd, exec.handle);
 }
 
+/*
+ * this test is checking for a NULL deref in eb_release_vmas()
+ * (see 4fe2bd195435 for kernel fix).
+ *
+ * this is always going to fail with an EINVAL but will trigger a crash
+ * in the kernel on affected systems.
+ */
+
+static void test_invalid_offset_multiple_buffers(int fd)
+{
+	struct drm_i915_gem_exec_object2 exec[2];
+	struct drm_i915_gem_execbuffer2 execbuf;
+	const intel_ctx_t *ctx;
+	uint32_t size = 0x1000;
+
+	/*
+	 * clear out junk from the argument structs, since it makes the ioctl
+	 * fail due to invalid flags, which is not the failure we want to
+	 * invoke here.
+	 */
+
+	memset(exec, 0, sizeof(exec));
+	memset(&execbuf, 0, sizeof(execbuf));
+
+	ctx = intel_ctx_create_all_physical(fd);
+	exec[0].handle = batch_create_size(fd, size);
+	exec[1].handle = batch_create_size(fd, size);
+
+	/* this triggers a fail precisely in eb_add_vma() */
+	execbuf.buffers_ptr = to_user_pointer(exec);
+	execbuf.buffer_count = 2;
+	execbuf.batch_start_offset = size;
+	execbuf.rsvd2 = ctx->id;
+
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
+
+	gem_sync(fd, exec[0].handle);
+	gem_sync(fd, exec[1].handle);
+
+	gem_close(fd, exec[0].handle);
+	gem_close(fd, exec[1].handle);
+}
+
 static void test_larger_than_life_batch(int fd)
 {
 	const struct intel_execution_engine2 *e;
@@ -705,6 +750,9 @@ int igt_main()
 	igt_subtest("larger-than-life-batch")
 		test_larger_than_life_batch(fd);
 
+	igt_subtest("invalid-offset-multiple-buffers")
+		test_invalid_offset_multiple_buffers(fd);
+
 #define DIRT(name) \
 	igt_subtest(#name "-dirt") { \
 		execbuf.flags = 0; \
-- 
2.55.0

