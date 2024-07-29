Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55AEC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A930E10E42A;
	Mon, 29 Jul 2024 16:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ojw0A38d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF8810E42A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269103; x=1753805103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dUs1NcPQgncEf5pv60YkKgJwxs5fUYjghFhD0Lt3Dfc=;
 b=Ojw0A38d28wcMimgbnCWZ3aYPz54YnxeQSlRGVfbUB4wr2wWFxqsvK1J
 imqJ8Euw4JyXSTjzEjCeKk6wBSFbM0HGFBDb/YdSyXzyWfYC6v8xpXaDf
 F4M24L33BwfFisVp0GwnpupxocnXZNiUOUCnyAA42Exx5RReveCQdRG+9
 q0zFiN/IYG1/unMyv0+PNy+JHy4+mf/DfzTXjSf8aah3c5bKobZYSFBjL
 PDc+vhAJSTdZvAQpDx8fjX5ZzGSjQmaNxvQXWzPhJfH4Z+TQI7QVJE1pJ
 U6IP3opypVuUCKnlEZHtauF1BD7W/arMKs3tyBsJ78Dmj83q5XcDppnUm Q==;
X-CSE-ConnectionGUID: s1YK3L6VRBm1lpkUi1R14g==
X-CSE-MsgGUID: qOBHaM2MRTWZ6D0KtlB8lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427511"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427511"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:56 -0700
X-CSE-ConnectionGUID: Fj2YolyhRZqW+MtMe2VJfw==
X-CSE-MsgGUID: Jed4ZVmuQv6azsgz2Wzujg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53739408"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:53 -0700
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
Subject: [PATCH 49/66] lib/gpgpu_shader: Allow enabling illegal opcode
 exceptions in shader
Date: Mon, 29 Jul 2024 18:01:42 +0200
Message-Id: <20240729160159.37036-50-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

From: Andrzej Hajda <andrzej.hajda@intel.com>

Illegal opcode exceptions can be enabled in interface descriptor data
passed to COMPUTE_WALKER instruction.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/gpgpu_shader.c | 4 ++++
 lib/gpgpu_shader.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 40161c52b..e53c61553 100644
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

