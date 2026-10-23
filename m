Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1DB606A321
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 21:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b6CMh7na
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627FA10E6E7;
	Fri, 23 Oct 2026 21:06:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB4010E6E7
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 21:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789401; x=1824325401;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=CA+B744zAsV2z7eTg2otDmG3zeqVtF+Tw2KfCpDzIHE=;
 b=b6CMh7naSNNx43FXCSlBF95urJpza+zbauILXVKrV4izJzJXVprocRbR
 gfjqAjZov99EcKt76d7yWCYTkadmm5wzbCd3hS3gPWPRetpWs7TL7IO3P
 ky5EujPYi1SqZ3kyNAdJt3Zgd8RxHqXWzgf16TBVQRCL3ZFQ+NEq2uhIA
 /8IvpaAIaYAX+TYq3OSvrRqZwuj4rpbxdTBh/Z0RpC3BdrWgHEhoecvTn
 omn3OHvF4paMB3CahXoxAW/IS/tpTufxSImL7M4JZG0GvdkvVABFkv6YN
 ndShNqhWzWfMva0yDFlRrLBC8fXELS+e0VHIYgwyDe/OSeYl7eclfagMn w==;
X-CSE-ConnectionGUID: 82q8i1JwQ2CMGJijOVo81g==
X-CSE-MsgGUID: lAnqq0A0RoibuXU8PlzXNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1457469"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1457469"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:16 -0700
X-CSE-ConnectionGUID: 3oF+0bjjTr2kGfvE2uWpcg==
X-CSE-MsgGUID: sO1RfXUzQHm6pyo3AojKKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5585813"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:15 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:02:42 -0300
Subject: [PATCH i-g-t v3 07/11] tests/intel/xe_pat: Adapt pat_entry_is_wb()
 to Xe3p
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_14026539277-v3-7-b8723ececb7f@intel.com>
References: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
In-Reply-To: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Xe3p introduces a new device-cache policy called XA, which has the
longer name "WB Transient App".

Even though commit 4e59b8e7779b ("lib/intel_pat: use kernel debugfs as
authoritative PAT source for Xe") already gives a clue that XA is a
"write-back" cache policy type, pat_entry_is_wb() doesn't really
incorporate that information.  Add the necessary logic to
pat_entry_is_wb() so that it also considers XA starting with Xe3p.

Bspec: 71582
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 tests/intel/xe_pat.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 9706b2dd5de0..17c3f2106f9f 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -143,6 +143,13 @@ static bool pat_entry_is_uc(unsigned int gfx_ver, uint32_t pat)
 
 static bool pat_entry_is_wb(unsigned int gfx_ver, uint32_t pat)
 {
+	if (gfx_ver >= IP_VER(35, 0)) {
+		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
+
+		return l3 == L3_CACHE_POLICY_WB || l3 == L3_CACHE_POLICY_XD ||
+		       l3 == L3_CACHE_POLICY_XA;
+	}
+
 	if (gfx_ver >= IP_VER(20, 0)) {
 		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
 

-- 
2.56.0

