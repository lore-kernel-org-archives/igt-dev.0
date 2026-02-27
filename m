Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6128FD7F97
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 11:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F0110EB11;
	Fri, 27 Feb 2026 11:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aa5u5fvf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FBE10EB11
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 11:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772192505; x=1803728505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I1siCat9A0KsDMpKRD1zZMCf4MdPyDMCmCZ5HNeIc4A=;
 b=aa5u5fvfBFT5OiS3mHOJtZY4xMOyvf8cLlTEcF1lOso/JEDf7NWCAXbF
 7h4WrSpNukv4ynl+VLASfjIUMeBOZ2pOhjD5DdNIu8up+TWs2fAAYFxVX
 tHq3Smeyo/biJS/bgiCE9ZRm9mzoggVYKuv/+vbc7mvDlKxlpsnTl8XMV
 fqTTVH8zxjPoAMRCyqhew3z/XPzHW17PkvFLkGt9F/f4g1t4lL25fCU/Q
 jX1Za2CVPW8ydeMDiP8P07DFd44td261u6p3HWLi07eTfalsqvHbP2k7E
 khFDwMsGUtUAlG4uRTz7VbXMIHVNadAc4krpkj4WfcjGMzzFkRQ0Pr4HQ g==;
X-CSE-ConnectionGUID: TuSyFAWPTkKs4AhPf4AYCw==
X-CSE-MsgGUID: 6iMeaH+MRjCZNt6Z0tmKdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73241321"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73241321"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 03:41:45 -0800
X-CSE-ConnectionGUID: 6vZNPcbETMeRbT/zavUhGQ==
X-CSE-MsgGUID: OSjWL7iqTSyxkeKhwliXBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="254655445"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 03:41:44 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 2/2] tests/intel/xe_eudebug_online: Assert fsync return on
 debugger VM fd
Date: Fri, 27 Feb 2026 12:41:33 +0100
Message-Id: <20260227114133.2850125-3-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227114133.2850125-1-jan.maslak@intel.com>
References: <20260227114133.2850125-1-jan.maslak@intel.com>
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

fsync() on a debugger VM fd triggers GPU cache invalidation, ensuring
that pwrite() and pread() operations observe a consistent memory state.
All call sites were silently ignoring the return value, allowing cache
flush failures to go undetected.

Wrap all fsync() calls with igt_assert_eq() so that a failure causes
an immediate abort.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 tests/intel/xe_eudebug_online.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 6009da4d6..538fefc13 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -620,7 +620,7 @@ static bool set_breakpoint_once(struct xe_eudebug_debugger *d,
 		instr_usdw |= breakpoint_bit;
 		igt_assert_eq(pwrite(data->vm_fd, &instr_usdw, sz,
 				     data->bb_offset + aip), sz);
-		fsync(data->vm_fd);
+		igt_assert_eq(fsync(data->vm_fd), 0);
 
 		breakpoint_set = true;
 	}
@@ -647,7 +647,7 @@ static void get_aips_offset_table(struct online_debug_data *data, int threads)
 	data->first_aip = first_aip;
 	data->aips_offset_table[table_index++] = 0;
 
-	fsync(data->vm_fd);
+	igt_assert_eq(fsync(data->vm_fd), 0);
 	for (int i = sz; i < data->target_size; i += sz) {
 		igt_assert_eq(pread(data->vm_fd, &aip, sz, data->target_offset + i), sz);
 		if (aip == first_aip)
@@ -667,7 +667,7 @@ static int get_stepped_threads_count(struct online_debug_data *data, int threads
 	size_t sz = sizeof(uint32_t);
 	uint32_t aip;
 
-	fsync(data->vm_fd);
+	igt_assert_eq(fsync(data->vm_fd), 0);
 	for (int i = 0; i < threads; i++) {
 		igt_assert_eq(pread(data->vm_fd, &aip, sz,
 				    data->target_offset + data->aips_offset_table[i]), sz);
@@ -761,7 +761,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
 				     data->target_offset + steering_offset(threads)),
 			      sizeof(uint32_t));
-		fsync(data->vm_fd);
+		igt_assert_eq(fsync(data->vm_fd), 0);
 	}
 	pthread_mutex_unlock(&data->mutex);
 
@@ -856,7 +856,7 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
 
 	igt_assert_eq(pwrite(data->vm_fd, &val, sz,
 			     data->target_offset + steering_offset(threads)), sz);
-	fsync(data->vm_fd);
+	igt_assert_eq(fsync(data->vm_fd), 0);
 
 	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
 						    att->exec_queue_handle, att->lrc_handle,
@@ -987,7 +987,7 @@ static void overwrite_immediate_value_in_common_target_write(int vm_fd, uint64_t
 			igt_assert_eq(pread(vm_fd, &val, sizeof(uint32_t), addr),
 				      sizeof(uint32_t));
 			igt_debug("val_before_fsync[%d]: %08x\n", vals_changed, val);
-			fsync(vm_fd);
+			igt_assert_eq(fsync(vm_fd), 0);
 			igt_assert_eq(pread(vm_fd, &val, sizeof(uint32_t), addr),
 				      sizeof(uint32_t));
 			igt_debug("val_after_fsync[%d]: %08x\n", vals_changed, val);
@@ -1042,7 +1042,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
 				     data->bb_offset + *kernel_offset + shader_preamble->size * 4 +
 				     shader_write_instr->size * 4 * *counter),
 				     sizeof(instr_usdw));
-		fsync(data->vm_fd);
+		igt_assert_eq(fsync(data->vm_fd), 0);
 	}
 
 	/* restore current instruction */
-- 
2.34.1

