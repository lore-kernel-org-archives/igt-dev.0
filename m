Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81ECC83F2D
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 14:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9B810E6CE;
	Thu, 29 Aug 2024 14:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlnqoGHj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF5C10E6CE
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724942792; x=1756478792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y3Uvyktr2nVcykjKcXl7yoBFUZtrSsiywFxM765+rFM=;
 b=NlnqoGHjcGqlzNVqR6HBgDAiL2mXDygsUs7piaWsP6ED+IoWehI6ohcg
 LU2zVlkWdYQsQQnRa/dUPrCcSQvTdL31coZDPcObYfo0rorr0dbYO/YvB
 tSWDNyKou/dozqhpbIwt212vug1Fg1+/a6BQqZpCKvKSPqf071FF7r0Dz
 eqv0lVI2SKJ7E0TVWAhzH6MNIHjdQzxOBII9uGyPoWcQLiClRQK9pC340
 +P2nhRWLOhBWm7RxE2yLbwbSvCePJroxo2csNimXrPAw914rD/0lw1qmj
 DhGT1kjFAZapVIbZZ0OOEICsoxBn/AAUnd4SKGpZYUbE/vIjC+ri34+b/ w==;
X-CSE-ConnectionGUID: Ik115w+bSOGarMcnTLLwmA==
X-CSE-MsgGUID: 6CZUTxTwTtWsR9BXYced0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34947558"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="34947558"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 07:46:32 -0700
X-CSE-ConnectionGUID: 9d4+xWP/TbuCddIE3FyPPQ==
X-CSE-MsgGUID: KxzeXDOfTdyYvyfJlYfI+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="64304068"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.237])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 07:46:29 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v5 07/17] lib/gpgpu_shader: Allow enabling illegal
 opcode exceptions in shader
Date: Thu, 29 Aug 2024 16:45:37 +0200
Message-Id: <20240829144547.105371-8-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144547.105371-1-christoph.manszewski@intel.com>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
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

From: Andrzej Hajda <andrzej.hajda@intel.com>

Illegal opcode exceptions can be enabled in interface descriptor data
passed to COMPUTE_WALKER instruction.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/gpgpu_shader.c | 4 ++++
 lib/gpgpu_shader.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index c1bb70507..fb0bd6e4c 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -103,6 +103,7 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
 		      struct gpgpu_shader *sip,
 		      uint64_t ring, bool explicit_engine)
 {
+	struct gen8_interface_descriptor_data *idd;
 	uint32_t interface_descriptor, sip_offset;
 	uint64_t engine;
 
@@ -113,6 +114,8 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
 	interface_descriptor = gen8_fill_interface_descriptor(ibb, target,
 							      shdr->instr,
 							      4 * shdr->size);
+	idd = intel_bb_ptr_get(ibb, interface_descriptor);
+	idd->desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
 
 	if (sip && sip->size)
 		sip_offset = fill_sip(ibb, sip->instr, 4 * sip->size);
@@ -163,6 +166,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
 
 	xehp_fill_interface_descriptor(ibb, target, shdr->instr,
 				       4 * shdr->size, &idd);
+	idd.desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
 
 	if (sip && sip->size)
 		sip_offset = fill_sip(ibb, sip->instr, 4 * sip->size);
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index 0bbeae66f..26a117a0b 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -22,6 +22,7 @@ struct gpgpu_shader {
 		uint32_t (*instr)[4];
 	};
 	struct igt_map *labels;
+	bool illegal_opcode_exception_enable;
 };
 
 struct iga64_template {
-- 
2.34.1

