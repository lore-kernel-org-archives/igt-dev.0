Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DC1CD4F5E
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 11:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1190E10E19D;
	Thu, 21 May 2026 11:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fj/OhCKG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A875910E19D
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779363244; x=1810899244;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ThjpF99lBn3/zcPTBqwC7yPEz1IwSVJKltepKoqoBWw=;
 b=fj/OhCKGqLRBnKUdl6hkjZ6y1panm3vVwuUU15+zrA/9z5BVPYFadttI
 k+X2EV5g0xc/Om3/ygvfL1CYuzW5/nvTZWeoExwzg62ZtRZ6/NhxCDDJY
 wXx3BFnWmXJWTUNPbHD2GAfaCCOh9zmj5BoKigeI7wGto9ES30GIOI536
 COU56api3bhjaHBwkBQbqR863Mj35xr1v6/bz9HoA6YeqDTz80R9NJf79
 4YJS1TwOjQHPmiE7RzBkGHsHJ0GlBk42EBxkLgOfqo7Zi1T0LC4nylMh1
 7owd5Lyy4i/OYcuoKQ/dFu0E8sVTjEHP7aF39NxHNstAq+O6XgpRJZaJE A==;
X-CSE-ConnectionGUID: fnSvb5lvQX2Y0ihGhxRFGw==
X-CSE-MsgGUID: RB1ek6e6RkGbBfieCnauLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80312826"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80312826"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:34:03 -0700
X-CSE-ConnectionGUID: XcyzLmyaTsi/vhJ10GVeyg==
X-CSE-MsgGUID: 3hctFOreQcen3eEBSG5HeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="240370798"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:34:01 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 21 May 2026 13:32:20 +0200
Subject: [PATCH 2/2] tests/intel/xe_exec_store: increase batchbuffer size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-ibb_fixes2-v1-2-7094a6ff3520@intel.com>
References: <20260521-ibb_fixes2-v1-0-7094a6ff3520@intel.com>
In-Reply-To: <20260521-ibb_fixes2-v1-0-7094a6ff3520@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=751;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=ThjpF99lBn3/zcPTBqwC7yPEz1IwSVJKltepKoqoBWw=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqDu1dRZlg07JB58lqE+mRKOt7k1Whf9BQQje8M
 xcjZmxJ5JmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCag7tXQAKCRAjYrKT3hD9
 13nCDACUnRsaf+IZ48KBN8TRqaupV7HeJPegVykn+4eTmDkR5JbFTjLguwyR0Gaz7zzGiVv/s1k
 Y0AqdQnLnIPp+2VjPPyg7WjfiysIQeyB5gcRMFDBxQ6vqrQsd9/7JNhzf0QBY6EC1JBmL33iGkS
 mp5IXEG9V/wCanq6CqfL4kGa1gAokSRajGylCSGSlkQDNPOr7KSqAXgOy5k1fkl3rbcGWekL3Rc
 HtlTnhx19sFL9ifO36iCjS6cq3xn02Xs3Ih3ks8boQrWxueeEfKJ3o397947zy9Otv5c+cuqjsD
 2stEMIGSPsb/8gORdwj7yF/dZgs9Pl/wzQGq9GHNAZPYD4tc3xcGKCsQKqF56fL6kp3+hWqnWuh
 XhiCYM4Kw3JDqZBgMRkAEg9Yg7BmpB84Iz5SWj0+cY+6C/fKUPmYnxd22FIT2R6oPVfF2HP8Vtr
 3RWjypxU4OJDx2ajldOOiSr6CJgoEjKTVnYF6lZgc9PBBepJPyddn3Vq5S0wZ31nRVT+8=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

In case of some platforms 32K is too small for the shader.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_exec_store.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index faf2c7fa86ce..b9753dc22f9a 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -352,7 +352,7 @@ static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
 {
 	const uint64_t target_offset = 0x1a000000;
 	const uint64_t bb_offset = 0x1b000000;
-	const size_t bb_size = 32768;
+	const size_t bb_size = 65536;
 	uint32_t vm_id;
 	uint32_t exec_queue;
 	const unsigned int instruction_count = 128;

-- 
2.54.0

