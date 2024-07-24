Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257CEC3DA61
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 19:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C642410E795;
	Wed, 24 Jul 2024 19:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2IiQkff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8137810E795
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jul 2024 19:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721849463; x=1753385463;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dGArbPgSFSF9M3B6nBirQ/l94o/XYzc2a/WpSqa0UZE=;
 b=N2IiQkffn5jm0sJG0jDKiY/HTvv8rVWmXhOYYiC17Ij/YDDUooweBm79
 J51t7rcpb/qeuM+ThASWdV/29pV/iuNYFPeNP533ymF4Jw6+HvXAvmUb3
 wqy67bNUvaD4TMHwqI9LfuV+M4Jg+3AKmSrim0H8q1VfwTSHCLdZLOEwD
 r5qbohYdeAQitBTpnJ+0b+crjdAHfQmLnMIgcjAz7XVaZJgIWFoedmv79
 G9PiVpw9XrELA+WpTeUmwsJvrXMPISuQusGSG4aEbxeMHiqy/zvo2oa4t
 iv1yjjYRlAvFwLDaqWoZw2xy0Q3xhhXmlaLlEB1NzxCrJA/RKtd0Prpwo g==;
X-CSE-ConnectionGUID: gcL91u9BQ7qD7qWedcqwvQ==
X-CSE-MsgGUID: 4B4pe93tTbiMVNvHfgJKxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19430811"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19430811"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:31:02 -0700
X-CSE-ConnectionGUID: OBtXVjHnRO6qBDZ7vJ0UNg==
X-CSE-MsgGUID: mY7cv05ER5mipk4bIzhf6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="90143858"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by orviesa001.jf.intel.com with ESMTP; 24 Jul 2024 12:31:01 -0700
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Subject: [PATCH] tests/intel/xe_exec_store: Modify test for Priority Mem Read
 feature
Date: Thu, 25 Jul 2024 01:10:06 +0530
Message-Id: <20240724194006.1201429-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
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

Now that KMD supports Priority Mem Read feature, care needs to
be taken to avoid RAW hazards which may get introduced due to
unordered read and writes. Inorder to prevent this insert
MI_MEM_FENCE which will ensure data coherency in such
scenarios.

KMD patch to enable Priority Mem Read:
https://patchwork.freedesktop.org/series/134038/

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 include/intel_gpu_commands.h | 2 ++
 tests/intel/xe_exec_store.c  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
index fe734c4bb..cd281ba89 100644
--- a/include/intel_gpu_commands.h
+++ b/include/intel_gpu_commands.h
@@ -89,6 +89,7 @@
 #define   MI_DISPLAY_FLIP_SKL_PLANE_3_A	(7 << 8)
 #define   MI_DISPLAY_FLIP_SKL_PLANE_3_B	(8 << 8)
 #define   MI_DISPLAY_FLIP_SKL_PLANE_3_C	(9 << 8)
+#define   MI_MEM_FENCE		MI_INSTR(0x09, 0)
 #define MI_SEMAPHORE_MBOX	MI_INSTR(0x16, 1) /* gen6, gen7 */
 #define   MI_SEMAPHORE_GLOBAL_GTT    (1<<22)
 #define   MI_SEMAPHORE_UPDATE	    (1<<21)
@@ -192,6 +193,7 @@
 #define MI_OPCODE(x)		(((x) >> 23) & 0x3f)
 #define IS_MI_LRI_CMD(x)	(MI_OPCODE(x) == MI_OPCODE(MI_INSTR(0x22, 0)))
 #define MI_LRI_LEN(x)		(((x) & 0xff) + 1)
+#define MI_WRITE_FENCE			(3 << 0)
 
 /*
  * 3D instructions used by the kernel
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index c872c22d5..fb99e53b7 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -63,6 +63,7 @@ static void cond_batch(struct data *data, uint64_t addr, int value)
 	data->batch[b++] = MI_ATOMIC | MI_ATOMIC_INC;
 	data->batch[b++] = sdi_addr;
 	data->batch[b++] = sdi_addr >> 32;
+	data->batch[b++] = MI_MEM_FENCE | MI_WRITE_FENCE;
 	data->batch[b++] = MI_CONDITIONAL_BATCH_BUFFER_END | MI_DO_COMPARE | 5 << 12 | 2;
 	data->batch[b++] = value;
 	data->batch[b++] = sdi_addr;
-- 
2.25.1

