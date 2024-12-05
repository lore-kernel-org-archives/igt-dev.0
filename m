Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D303E7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 14:04:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563BB10EE84;
	Thu,  5 Dec 2024 14:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5DJV0uZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC9510EE84
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 14:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733407464; x=1764943464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WeeiVPorBEuthROO5VwWuJg36WiLeh67xNQEh3uSAcY=;
 b=a5DJV0uZdEJdcdPwQYPFIQneoLqJ5Algmqq4/oEYG5eGvcaxyc6hl/4D
 W0D/NErwASmJ1OXUFeaAeKLUfAwhnwripmxO+/mQWl8nCT/6dbQqDLybk
 5icw63jMlhsmlnvJtdxOQSz+aW2JrXzPSb7zKaItyMrMdMzLunLgoSi5S
 orWy0BTecjyWo2Aak/pYgVeUH4k/EAY6wU/Yteu/LzmabSVPr8hriZZ/Y
 KeI7W5K+BLnp0rchVy18aUEFvq36X0YqelcBfYym0tPanV3tyGl0sSuOc
 wbapNZ6mDE3ZfgbaqGu0jTrWJ+Ke/IUDpuqHLgoKWRHLhsU4EAsMmHW/F Q==;
X-CSE-ConnectionGUID: Hk8xJTCJRpqLHiCga9DTqw==
X-CSE-MsgGUID: CzinH44WRcO3UYjrszfc2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="36559553"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="36559553"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 06:04:20 -0800
X-CSE-ConnectionGUID: sBEH/tisReSdD3p3cmMk+w==
X-CSE-MsgGUID: TRr2JwkiQVmJyz5rxh+0DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94179457"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.20])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 06:04:19 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mika.kuoppala@linux.intel.com,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_eudebug_online: Improve
 writes-caching-* tests
Date: Thu,  5 Dec 2024 15:03:52 +0100
Message-Id: <20241205140352.16822-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205140352.16822-1-dominik.karol.piatkowski@intel.com>
References: <20241205140352.16822-1-dominik.karol.piatkowski@intel.com>
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

- Remove repeated calls to caching_get_instruction_count
- Limit surface checking to each breakpoint that is after write
  instruction
- Fix the issue with sync between workload lifetime vs resume

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 39 +++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 750350556..c02e2b1f4 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -919,6 +919,10 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
 	const uint32_t breakpoint_bit = 1 << 30;
 	struct gpgpu_shader *shader_preamble;
 	struct gpgpu_shader *shader_write_instr;
+	const unsigned int instruction_count =
+			caching_get_instruction_count(d->master_fd, s_dim.x, d->flags);
+	uint64_t seqno = 0;
+	int ret;
 
 	shader_preamble = gpgpu_shader_create(d->master_fd);
 	gpgpu_shader__write_dword(shader_preamble, SHADER_CANARY, 0);
@@ -935,7 +939,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
 	}
 
 	/* set breakpoint on next write instruction */
-	if (*counter < caching_get_instruction_count(d->master_fd, s_dim.x, d->flags)) {
+	if (*counter < instruction_count) {
 		igt_assert_eq(pread(data->vm_fd, &instr_usdw, sizeof(instr_usdw),
 				    data->bb_offset + *kernel_offset + shader_preamble->size * 4 +
 				    shader_write_instr->size * 4 * *counter),
@@ -949,7 +953,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
 	}
 
 	/* restore current instruction */
-	if (*counter && *counter <= caching_get_instruction_count(d->master_fd, s_dim.x, d->flags))
+	if (*counter && *counter <= instruction_count)
 		overwrite_immediate_value_in_common_target_write(data->vm_fd,
 								 data->bb_offset + *kernel_offset +
 								 shader_preamble->size * 4 +
@@ -958,7 +962,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
 								 CACHING_VALUE(*counter - 1));
 
 	/* poison next instruction */
-	if (*counter < caching_get_instruction_count(d->master_fd, s_dim.x, d->flags))
+	if (*counter < instruction_count)
 		overwrite_immediate_value_in_common_target_write(data->vm_fd,
 								 data->bb_offset + *kernel_offset +
 								 shader_preamble->size * 4 +
@@ -969,15 +973,28 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
 	gpgpu_shader_destroy(shader_write_instr);
 	gpgpu_shader_destroy(shader_preamble);
 
-	for (int i = 0; i < data->target_size; i += sizeof(uint32_t)) {
-		igt_assert_eq(pread(data->vm_fd, &val, sizeof(val), data->target_offset + i),
-			      sizeof(val));
-		igt_assert_f(val != CACHING_POISON_VALUE, "Poison value found at %04d!\n", i);
-	}
+	/* check surface at each breakpoint that is after write instruction */
+	if (*counter > 1 && *counter <= instruction_count + 1)
+		for (int i = 0; i < data->target_size; i += sizeof(uint32_t)) {
+			igt_assert_eq(pread(data->vm_fd, &val, sizeof(val),
+					    data->target_offset + i), sizeof(val));
+			igt_assert_f(val != CACHING_POISON_VALUE,
+				     "Poison value found at %04d!\n", i);
+		}
 
-	eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
-		      att->exec_queue_handle, att->lrc_handle,
-		      att->bitmask, att->bitmask_size);
+	ret = __eu_ctl(d->fd, att->client_handle, att->exec_queue_handle, att->lrc_handle,
+		       att->bitmask, &att->bitmask_size, DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME,
+		       &seqno);
+
+	/*
+	 * XXX: build a better sync between workload lifetime vs resume.
+	 *
+	 * Right now, it is possible to get attention after the workload has vanished - in result,
+	 * eu_ctl above fails. Band-aid it by checking the eu_ctl return value only n times it is
+	 * actually expected - that is, instruction_count of writes + 2 nops.
+	 */
+	if (*counter < instruction_count + 2)
+		igt_assert_eq(ret, 0);
 
 	(*counter)++;
 }
-- 
2.34.1

