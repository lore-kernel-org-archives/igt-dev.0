Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79733CD1299
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 14:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B1D1133CF;
	Wed, 10 Apr 2024 14:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bC+k2LTC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59171112456
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712760210; x=1744296210;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=HhzRXklQq5EEfzpfz1d8x4qteiBh+AxnnQGvcMmXzDQ=;
 b=bC+k2LTCRPueV3HtUXyd3SZt9IUQnLgr1+58YpUIRmZpf2gELrc2JQqZ
 rcA1WSPImmvckRifUAUbT6+vbU4bM8wdkNnsSd+80GwUHz+YHyRc2eCBK
 f6hS9Q6QSR9HwUH8BatdGltUz9pb1VVIEG2mFE8cRyYoH+wxTCSdOpUnc
 2gLuaAV4Vw4bob41ISlwY4dIpCiLTvtjCgWY7m/yHMd0cHPzyoyi5YlgT
 FwPNs2Mf27wS+Ku44ZNARRtLg36dKCWbCIwWXt108gLJBCi7+NftmDKiL
 bv81ZhTklRPnumkcPD2XaswLvqVF7njf5RTPai8n/Lmgzqtm64dnv8cuE A==;
X-CSE-ConnectionGUID: YxBl6IhoRbq+f3SCNcxM1g==
X-CSE-MsgGUID: 1mbZDC0ARNeflBRD7Il+KQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18732385"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18732385"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:43:27 -0700
X-CSE-ConnectionGUID: tsTN1mCOTJCk4TqNAlRn5w==
X-CSE-MsgGUID: d8Liil6dQjuxy3XiCJW1IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="43828876"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:43:27 -0700
Received: from linux.intel.com (unknown [10.245.244.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D0D0120B949F
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 07:43:26 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1ruZAa-00000000BfB-3dgI for igt-dev@lists.freedesktop.org;
 Wed, 10 Apr 2024 16:43:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 2/4] assembler: fix calloc calls with inverted
 arguments
Date: Wed, 10 Apr 2024 16:42:36 +0200
Message-ID: <20240410144321.44766-3-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410144321.44766-1-mauro.chehab@linux.intel.com>
References: <20240410144321.44766-1-mauro.chehab@linux.intel.com>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The new gcc version 14 now complains when calloc is called
with inverted arguments. use the script from:
a0ee73a8f359 ("benchmarks: fix calloc calls with inverted arguments")

To fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 assembler/gram.y | 6 +++---
 assembler/main.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/assembler/gram.y b/assembler/gram.y
index 77975e072896..79873b222253 100644
--- a/assembler/gram.y
+++ b/assembler/gram.y
@@ -216,7 +216,7 @@ brw_program_add_instruction(struct brw_program *p,
 {
     struct brw_program_instruction *list_entry;
 
-    list_entry = calloc(sizeof(struct brw_program_instruction), 1);
+    list_entry = calloc(1, sizeof(struct brw_program_instruction));
     list_entry->type = GEN4ASM_INSTRUCTION_GEN;
     list_entry->insn.gen = instruction->insn.gen;
     brw_program_append_entry(p, list_entry);
@@ -228,7 +228,7 @@ brw_program_add_relocatable(struct brw_program *p,
 {
     struct brw_program_instruction *list_entry;
 
-    list_entry = calloc(sizeof(struct brw_program_instruction), 1);
+    list_entry = calloc(1, sizeof(struct brw_program_instruction));
     list_entry->type = GEN4ASM_INSTRUCTION_GEN_RELOCATABLE;
     list_entry->insn.gen = instruction->insn.gen;
     list_entry->reloc = instruction->reloc;
@@ -239,7 +239,7 @@ static void brw_program_add_label(struct brw_program *p, const char *label)
 {
     struct brw_program_instruction *list_entry;
 
-    list_entry = calloc(sizeof(struct brw_program_instruction), 1);
+    list_entry = calloc(1, sizeof(struct brw_program_instruction));
     list_entry->type = GEN4ASM_INSTRUCTION_LABEL;
     list_entry->insn.label.name = strdup(label);
     brw_program_append_entry(p, list_entry);
diff --git a/assembler/main.c b/assembler/main.c
index 2d39d4536a7f..77cc98b80d21 100644
--- a/assembler/main.c
+++ b/assembler/main.c
@@ -397,7 +397,7 @@ int main(int argc, char **argv)
 	    if (entry1 && is_label(entry1) && is_entry_point(entry1)) {
 		// insert NOP instructions until (inst_offset+1) % 4 == 0
 		while (((inst_offset+1) % 4) != 0) {
-		    tmp_entry = calloc(sizeof(*tmp_entry), 1);
+		    tmp_entry = calloc(1, sizeof(*tmp_entry));
 		    tmp_entry->insn.gen.header.opcode = BRW_OPCODE_NOP;
 		    entry->next = tmp_entry;
 		    tmp_entry->next = entry1;
-- 
2.44.0

