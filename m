Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CBCCD4F5F
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 09:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744E610E805;
	Thu,  5 Sep 2024 09:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJKbqk6c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B8310E806
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 09:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725528533; x=1757064533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lkHEBvFwed7GOvSqafaBUS9bJJD6wmi2xvjgmLFY9p4=;
 b=EJKbqk6ciBxE5APhAPN715nM0c437TXgHJ34qKhA/SO9iJLASxYQRBmP
 E1m/RuPxy2aegmnHFtCYEI/cEsGsU3mPwgzKF1kLcHAZVoUSy25FwspRQ
 8g71pF1OqNDQXcZ0DxsYCFrDZnst3yv0ypKsPV/wCASY/I5AuTS7wjSR5
 4K4LuH+6mJ48RO7BtY7aHT7ap1aRIdtuA1aJJnKXx5RsqyJlLBPBkow5P
 HIqedc3sdjL6MKQpL5g9Es35fK/lS7yPTDOu6vKzUe2KABZej5j95eyO1
 /vfYbJ8MHr/48qccQ1P0UNMd/b2balSVw/L0pfJmUdgAFZHzqzjnzzh99 Q==;
X-CSE-ConnectionGUID: u23I8Ib6Tn+ZkQCqHAmKaQ==
X-CSE-MsgGUID: 8DdHIlbVSkCK/6H/6A3wQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35590249"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="35590249"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:28:53 -0700
X-CSE-ConnectionGUID: vKhhhkf+RLGuG3KvC0dAtw==
X-CSE-MsgGUID: iCjBy/sXSLGbZeV8CcJRug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65404812"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:28:49 -0700
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
Subject: [PATCH i-g-t v6 07/17] lib/gpgpu_shader: Allow enabling illegal
 opcode exceptions in shader
Date: Thu,  5 Sep 2024 11:28:02 +0200
Message-Id: <20240905092812.94553-8-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905092812.94553-1-christoph.manszewski@intel.com>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
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
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/gpgpu_shader.c | 4 ++++
 lib/gpgpu_shader.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 9284ad5ea..d4dd118d6 100644
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
index b722b9e50..53fe2869e 100644
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

