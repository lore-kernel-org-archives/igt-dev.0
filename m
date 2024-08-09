Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF4FC52D7C
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 12:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142CA10E8F9;
	Fri,  9 Aug 2024 12:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKqwze11";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D7C10E8F9
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 12:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723207181; x=1754743181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nrwEfT1CgAwzwUqjE0zO02NAq61+WUeE5LNKAGSG2uY=;
 b=LKqwze11gLdeLGscCCdgkpchDTQGpU8I7o3vx4XMSRMYOZVtqgNMEiS3
 8ibEaIUka8cquVocGGddVz0pPn5KKNI7LTTo2Q5EuFocyPzXz067TRMQE
 6oUSHVW3aIE0H0aMmO9XIN8nsgrRBDc/wAeJ/2Y1m1XB+caBmyq/ESU+6
 V5y3rZD7XibzrvCyLtFer9jbsSMigYBu2SFXRHQ0eZXt5BBXwHgU9qtL/
 axQbtbT1mOZIzAHto+6KGt6/ucYWc4QUNIGwNXVtZES14C4vTBimBTK0k
 rAhOMzhIHBfyEEH/rGqfEoWksXnSGF8uVkVf/YkbHdf21JC8xYeBHvE9B Q==;
X-CSE-ConnectionGUID: LhdAnsCxQA6tEE4GPf3JnQ==
X-CSE-MsgGUID: Tyu+DdyyR5OU5+rznS9yZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32525469"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="32525469"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:39:41 -0700
X-CSE-ConnectionGUID: u8bXgmy5TVGjrhGH5hm3WQ==
X-CSE-MsgGUID: c+z0SfydQV2sXTFK+kLRCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57761528"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.4])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:39:37 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v3 10/14] lib/gpgpu_shader: Allow enabling illegal
 opcode exceptions in shader
Date: Fri,  9 Aug 2024 14:38:09 +0200
Message-Id: <20240809123813.109365-11-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809123813.109365-1-christoph.manszewski@intel.com>
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
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
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
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

