Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D899CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 13:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE1010E778;
	Mon, 11 May 2026 13:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuJKKH5d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58ED10E786
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778507900; x=1810043900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EMBxmxL6iSJa9g/JcfjQHvJaRgPLZuoSd8ShzMnNUB0=;
 b=DuJKKH5duVPze9n1hPr/sPFj/gYNXHpT8ajvLhnHHjR+E68C1LRWmdCJ
 0QIi+aVwMxcBkDBDsm7CGe6+SJ7821VLoTkOnFtyxUcz7sXyH15TCyhsD
 q7ViICurgDS/YMVoGUQotozAwGi9LdHv6hqhOSWugPAWQDHt50EdUnTqJ
 XG8vgotEryLmo+mwEkMKemhjgaMkW451dysGx6sc0rBgyGENtXchXuJiR
 kh6CMEset3qsvAXJz2ylqQK3JZIiV7IXDlBeYmD7hJDTUttJSxtpjoNsT
 qjOaxTW9YKg0dvg83V+YPuWrpOW7duTQV/YKR/HhXNKlfO2nXfLq8xpfL g==;
X-CSE-ConnectionGUID: njURgjX6Qm29DA+GSaOajg==
X-CSE-MsgGUID: coUYqXOqSWWwvItpHDFF2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="81957745"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="81957745"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:58:20 -0700
X-CSE-ConnectionGUID: EC8fkhOWThSKIFkrxTIb+Q==
X-CSE-MsgGUID: LDxcO8NtTnmjt4o2p/qMoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="241817631"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:58:19 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arvind.yadav@intel.com, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v3 4/4] tests/intel/xe_madvise: Add atomic-cpu subtest
Date: Mon, 11 May 2026 19:27:37 +0530
Message-ID: <20260511135752.119868-5-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511135752.119868-1-varun.gupta@intel.com>
References: <20260511135752.119868-1-varun.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Validate that madvise ATOMIC_CPU blocks GPU atomic operations on SVM
memory.  The test sets ATOMIC_CPU on heap-allocated memory, then
submits GPU MI_ATOMIC_INC which must fail because the page-fault
handler returns -EACCES for CPU-only atomic mode, causing an engine
reset.  The fence wait times out (QUARTER_SEC) and the counter must
remain 0.  Only the first engine is tested to limit CAT errors from
repeated resets.

v2: Add UNMAP of CPU_ADDR_MIRROR binding before xe_vm_destroy.
    Add comment explaining break after single-engine run (Nishit).

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 tests/intel/xe_madvise.c | 83 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index c3b6935bb..cdb115d7e 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -961,6 +961,79 @@ static void test_atomic_global(int fd, struct drm_xe_engine_class_instance *eci)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: atomic-cpu
+ * Description: madvise atomic cpu supports only CPU atomic operations,
+ *		test verifies GPU MI_ATOMIC_INC is rejected by fault handler
+ * Test category: functionality test
+ */
+static void test_atomic_cpu(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	struct atomic_data *data;
+	uint32_t vm, exec_queue;
+	uint64_t addr;
+	size_t bo_size;
+	int va_bits, err;
+	int64_t timeout = QUARTER_SEC;
+
+	va_bits = xe_va_bits(fd);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+
+	bo_size = xe_bb_size(fd, sizeof(*data));
+	data = aligned_alloc(bo_size, bo_size);
+	igt_assert(data);
+	memset(data, 0, bo_size);
+
+	addr = to_user_pointer(data);
+
+	sync[0].addr = to_user_pointer(&data->vm_sync);
+	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
+			    DRM_XE_VM_BIND_OP_MAP,
+			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
+			    sync, 1, 0, 0);
+	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
+	data->vm_sync = 0;
+
+	xe_vm_madvise(fd, vm, addr, bo_size, 0,
+		      DRM_XE_MEM_RANGE_ATTR_ATOMIC, DRM_XE_ATOMIC_CPU, 0, 0);
+
+	atomic_build_batch(data, addr);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec.exec_queue_id = exec_queue;
+	exec.address = addr + ((char *)&data->batch - (char *)data);
+
+	/*
+	 * GPU MI_ATOMIC_INC must fail: page-fault handler returns -EACCES
+	 * for ATOMIC_CPU mode, causing engine reset.  Wait with a short
+	 * timeout — the fence should not signal.
+	 */
+	sync[0].addr = to_user_pointer(&data->exec_sync);
+	xe_exec(fd, &exec);
+	err = __xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
+			       exec_queue, &timeout);
+
+	igt_assert_neq(err, 0);
+	igt_assert_eq(data->data, 0);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
+			    DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0);
+	free(data);
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -1032,6 +1105,16 @@ int igt_main()
 		igt_subtest("atomic-global")
 			xe_for_each_engine(fd, hwe)
 				test_atomic_global(fd, hwe);
+
+		/* Run on a single engine — each rejection triggers an engine
+		 * reset and CAT error, running on all engines would generate
+		 * redundant resets without adding coverage.
+		 */
+		igt_subtest("atomic-cpu")
+			xe_for_each_engine(fd, hwe) {
+				test_atomic_cpu(fd, hwe);
+				break;
+			}
 	}
 
 	igt_fixture() {
-- 
2.43.0

