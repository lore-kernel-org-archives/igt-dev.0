Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA6C606A334
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PEPNOL/c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C1610FD73;
	Wed, 18 Nov 2026 14:52:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47BD10FD5E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795013378; x=1826549378;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=iCYjNwYuGzAeGL7smuoGiG7ZgTrzl8YN1gss2tjg6HA=;
 b=PEPNOL/cldiIh30qZuOTjd2WHD7yUn2RZE/zX2ReV1YUBsE8hmeqOeFl
 QWd/Tz/XYOFphXh1mgj7ewjNDDJWd8JlG6dOZ02lEMZA8KznxH+dDL7vC
 qDjv8yO+pHTnhkPl/r7r7rgI1WV6o0j9p6LVANpxNcrIckNTv6TEgTGyo
 NtRgphp29CAg3qdQiKUHO1W5iZO8lErWGbwJH2LqZ7tDkIQjl78FqZ1FN
 Bbl270BzNxIUadDpkCiyf5sd5MM9kki9PqCJt0ej4F9HOUtLlTsGYatjJ
 iYjhyRiMveCwn8jo2BpTxxEzDy72ECoFVkDoIpbxT9IlEMN7a9M59d4FM Q==;
X-CSE-ConnectionGUID: dXY9QqtFSzev5b8r1E4FTw==
X-CSE-MsgGUID: Wdbccno0QuSUWfMnXzHBVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3711327"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3711327"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 06:49:34 -0800
X-CSE-ConnectionGUID: swW0Q+gHSqaNfA4CYQEZTg==
X-CSE-MsgGUID: e2dDnuWhRoSUf61QbRr5kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10047160"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 06:49:32 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 18 Nov 2026 15:47:20 +0100
Subject: [PATCH 2/2] tests/intel/xe_prefetch_fault: re-generate shaders
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-rebuild_shaders-v1-2-92bf629f4f27@intel.com>
References: <20261118-rebuild_shaders-v1-0-92bf629f4f27@intel.com>
In-Reply-To: <20261118-rebuild_shaders-v1-0-92bf629f4f27@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.17-dev-6be7c
X-Developer-Signature: v=1; a=openpgp-sha256; l=839;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=iCYjNwYuGzAeGL7smuoGiG7ZgTrzl8YN1gss2tjg6HA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBq/bqBqemsnSMMVo2SF+5QN4J1TVeZwNi8hO9ie
 jV7a1MbnHGJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCav26gQAKCRAjYrKT3hD9
 1wRdC/9bJZxlkMg2yzeIEBJfkCb/SshjSKLHpFIP7BuLvo+wxWDSXwKMcHiX75+I3JBIh0eOTba
 MVFtLmwisDaBMu5LgJxuTd2VgxwgJmmnLJJAEOorRNwv6qc5GtyJ3INwXBIMwb3yGkuCQjOGI8T
 9k/sCRN+UPYJebzijGtn//kbEhmtbKV/LucNIB7bNRqm9f903X8LPpol/LGxfK3jqQcraBbp4nm
 /4Oq+u+CDFp2TGqqbAQsw6VBBddD0st1yn9sm33B7VewVnQ5sHcMtxyaxOWAIl1aLlqBENox/21
 rUerbHfpy3fbGgniSorILW5nhXaRfuqPJHi3ZghUuhpJjQr9U9CqdSuQYrbwIJSGnmeWtMxaekw
 YSCm9OoppypyeGyUXzIfbEt+uJL/FtLK5aP9Ofqhf4tshtMJxdB3sU+MeGFk4ur+2Y1xOIp1O23
 IjWfcHgVrSfJFwMAi7MxvawHZCcf1jA/RsB2r/CtrDqI1iaQucR8nk+6njbDfa2z3IVmw=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

After recent changes to shaders codes were not re-generated.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
index b5fdec567089..fe0edfe866b7 100644
--- a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
+++ b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 546bddbd13ed40a4cc520c886248c178
+#define MD5_SUM_IGA64_ASMS ba37a1e020e016887839753e42d4eb01
 
 struct iga64_template const iga64_code_xe_l2_prefetch_fault_prefetch[] = {
 	{ .gfx_ver = 3500, .size = 28, .code = (const uint32_t []) {

-- 
2.55.0

