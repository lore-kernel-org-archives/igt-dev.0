Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2A1C5DF81
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 15:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C042310E57B;
	Wed, 19 Aug 2026 15:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cs8S9daN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D65610E160
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787152972; x=1818688972;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nqDK67G1Kv91PkbyeteUR3boT0KfifVV6hejaK1OXgk=;
 b=Cs8S9daNkXsBXAuiux1LajaHE4Bc6fwZ6DuEv+WNOu+hrV7t1D8gIiWg
 R5uoVKIygWyNtPA9j1mbX1jG40wYnGruCv1grzWFRfcAPNawfbG4tFS42
 t4sPVf3sabcObj8lcfLY267DJ3Bj5n6eWTUSqpBuc2+1BbKiY4vG9jP9X
 0gUNKY3ipWYd9mXd++r9y9hs6TQ4nrc2o4N71T0AtPw85Kgj9vJddKxYe
 hxgclf61si6e+cRur+r9C68Nk3cRCjVjYzmyj4yz8fLPTI99PMHl8uVOk
 UnEwwLOf/cwavsILoe3ZfZTntdkDjvKyW026v56RGt/CDqSDF+ncKrroz A==;
X-CSE-ConnectionGUID: c9/Jnhr/Qm+rUMgakd+mfg==
X-CSE-MsgGUID: oA9flcqIS8+L3CzK2RuWKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105055806"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="105055806"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 08:22:52 -0700
X-CSE-ConnectionGUID: q2hHNyyQQASQJS6ppQI5dQ==
X-CSE-MsgGUID: +RLdm2R0Q+6UQyN0gERxMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="265128317"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.217])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 08:22:50 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/gem_exec_params: add
 invalid-offset-multiple-buffers test
Date: Wed, 19 Aug 2026 17:21:09 +0200
Message-ID: <20260819152108.58688-2-krzysztof.niemiec@intel.com>
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

v2:
 - Reword comments to be more specific (Krzysztof K, Sebastian)
 - Get rid of the context id parameter (previously set in rsvd2, which
   should have been rsvd1) - which turns out isn't actually required to
   trigger the correct error path (Sebastian)
 - Capitalize sentences (Andi, off-list)

 tests/intel/gem_exec_params.c | 50 +++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
index 3ba4c530b..c405190a0 100644
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
@@ -404,6 +406,51 @@ static void test_invalid_batch_start(int fd)
 	gem_close(fd, exec.handle);
 }
 
+/*
+ * This test is checking for a NULL deref in eb_release_vmas()
+ * (see 4fe2bd195435 for kernel fix), which happens when multiple buffers
+ * are submitted to the execbuf ioctl and some of them are invalid.
+ *
+ * The __gem_execbuf() call is always expected to fail with an -EINVAL,
+ * because the bug mentioned above is in the error path, which is
+ * deliberately triggered. Affected systems, however, will not handle it
+ * cleanly and will crash with a NULL deref.
+ */
+
+static void test_invalid_offset_multiple_buffers(int fd)
+{
+	struct drm_i915_gem_exec_object2 exec[2];
+	struct drm_i915_gem_execbuffer2 execbuf;
+	uint32_t size = 0x1000;
+
+	memset(exec, 0, sizeof(exec));
+	memset(&execbuf, 0, sizeof(execbuf));
+
+	exec[0].handle = batch_create_size(fd, size);
+	exec[1].handle = batch_create_size(fd, size);
+
+	/*
+	 * To test 4fe2bd195435, we need multiple buffers submitted and
+	 * eb_add_vma() to fail. eb_add_vma() checks whether
+	 * batch_start_offset + batch_len is smaller than the vma size, and
+	 * fails with -EINVAL if it isn't. Submitting two buffers and setting
+	 * the offset to the size of the first batch will trigger this
+	 * error path.
+	 */
+
+	execbuf.buffers_ptr = to_user_pointer(exec);
+	execbuf.buffer_count = 2;
+	execbuf.batch_start_offset = size;
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
@@ -705,6 +752,9 @@ int igt_main()
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

