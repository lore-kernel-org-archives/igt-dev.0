Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C46EF8FF1
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 14:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E0A10EA16;
	Wed,  4 Mar 2026 14:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7K8htGZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC5310EA16
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772634991; x=1804170991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fK6LWrY2DvSgTl042qQXibTj5sIw7sghYest5gqwD2I=;
 b=h7K8htGZiWSnuz+EsUkHygIEg8UczVCrxnbjHo5ULFqiePKbWrWDOoFq
 l//nTeQzjMhloV1dOIwa0pCMowXH4tPZ106WBp1j+lUoPQq9NAh3u1VmV
 G7lsZkK7jK2I6w6HBMaI7cteNTGiOPT6GXAR27K1yWFoWA81CtuuPcAcL
 fiNepr0aM4+TuwR/mh9l27YmTeTk8Gev2rP3uW2qETzZSO44gRQSLtS4X
 UnHWGKPLMmqe5zOmBeqenFaYh/ZS/gLR3s/yfWcfWaNJ9lURcYs0rbkNW
 01I+xclFGqQvGwvVb6uHk4T0Q6hdZ231c4bA7IBECnFqC+rmRxfU1W4vY g==;
X-CSE-ConnectionGUID: U6P7ShbhTTqA2nticYV9aw==
X-CSE-MsgGUID: CkVuma1WR5CYm5DK5O+tRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73743488"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73743488"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:36:31 -0800
X-CSE-ConnectionGUID: KpuqzUtmTk22EEQsZrF4sA==
X-CSE-MsgGUID: Zt8IK+2hSbi2SZ8vV9OJMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="217517501"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:36:30 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maciej.patelczyk@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 2/2] tests/intel/xe_eudebug_online: Assert fsync return on
 debugger VM fd
Date: Wed,  4 Mar 2026 15:36:19 +0100
Message-Id: <20260304143619.3854871-3-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304143619.3854871-1-jan.maslak@intel.com>
References: <20260304143619.3854871-1-jan.maslak@intel.com>
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
Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 tests/intel/xe_eudebug_online.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 1af887bba..8d3bc644f 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -621,7 +621,7 @@ static bool set_breakpoint_once(struct xe_eudebug_debugger *d,
 		instr_usdw |= breakpoint_bit;
 		igt_assert_eq(pwrite(data->vm_fd, &instr_usdw, sz,
 				     data->bb_offset + aip), sz);
-		fsync(data->vm_fd);
+		igt_assert_eq(fsync(data->vm_fd), 0);
 
 		breakpoint_set = true;
 	}
@@ -648,7 +648,7 @@ static void get_aips_offset_table(struct online_debug_data *data, int threads)
 	data->first_aip = first_aip;
 	data->aips_offset_table[table_index++] = 0;
 
-	fsync(data->vm_fd);
+	igt_assert_eq(fsync(data->vm_fd), 0);
 	for (int i = sz; i < data->target_size; i += sz) {
 		igt_assert_eq(pread(data->vm_fd, &aip, sz, data->target_offset + i), sz);
 		if (aip == first_aip)
@@ -668,7 +668,7 @@ static int get_stepped_threads_count(struct online_debug_data *data, int threads
 	size_t sz = sizeof(uint32_t);
 	uint32_t aip;
 
-	fsync(data->vm_fd);
+	igt_assert_eq(fsync(data->vm_fd), 0);
 	for (int i = 0; i < threads; i++) {
 		igt_assert_eq(pread(data->vm_fd, &aip, sz,
 				    data->target_offset + data->aips_offset_table[i]), sz);
@@ -762,7 +762,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
 				     data->target_offset + steering_offset(threads)),
 			      sizeof(uint32_t));
-		fsync(data->vm_fd);
+		igt_assert_eq(fsync(data->vm_fd), 0);
 	}
 	pthread_mutex_unlock(&data->mutex);
 
@@ -857,7 +857,7 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
 
 	igt_assert_eq(pwrite(data->vm_fd, &val, sz,
 			     data->target_offset + steering_offset(threads)), sz);
-	fsync(data->vm_fd);
+	igt_assert_eq(fsync(data->vm_fd), 0);
 
 	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
 						    att->exec_queue_handle, att->lrc_handle,
@@ -988,7 +988,7 @@ static void overwrite_immediate_value_in_common_target_write(int vm_fd, uint64_t
 			igt_assert_eq(pread(vm_fd, &val, sizeof(uint32_t), addr),
 				      sizeof(uint32_t));
 			igt_debug("val_before_fsync[%d]: %08x\n", vals_changed, val);
-			fsync(vm_fd);
+			igt_assert_eq(fsync(vm_fd), 0);
 			igt_assert_eq(pread(vm_fd, &val, sizeof(uint32_t), addr),
 				      sizeof(uint32_t));
 			igt_debug("val_after_fsync[%d]: %08x\n", vals_changed, val);
@@ -1043,7 +1043,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
 				     data->bb_offset + *kernel_offset + shader_preamble->size * 4 +
 				     shader_write_instr->size * 4 * *counter),
 				     sizeof(instr_usdw));
-		fsync(data->vm_fd);
+		igt_assert_eq(fsync(data->vm_fd), 0);
 	}
 
 	/* restore current instruction */
-- 
2.34.1

