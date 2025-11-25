Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF093CFD379
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 09:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12B910E39D;
	Tue, 25 Nov 2025 09:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hM3F+EyU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1732310E3A2
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 09:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764063536; x=1795599536;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=MxemYzqftO1mnV484PapWj/xoSQFjt0Swgc+kMaQ2Bc=;
 b=hM3F+EyU1vuMnrG2JvF2/rQTjf3zR6d/+TlFD/uyxCK1q8R10DeZ/Za2
 ULxmrwwRPEEqbIJ5VXF6r27cZ3jeNAodZ2GBFxWdjJBdvE3XwXUV2+guW
 2r/gpENMsP1h6W8gCeCmNaBCjfrs2RQZlqOFlAzsSqY+0vynM74amIyjC
 LQ2LUTbLgINkOpgzbBlqU26EL/8To2aY21VAcxE7AyzDTlPgw3iFhMUIK
 /UMGFWw0keZSqfV9VYibAFNx9vGr+4zylL6kFsaCANHser3qk2dZLqCsl
 ME/sJ+I9FRCpB/G/yOMgPdSfC47PypxDDz0KjfNrJy3IGaXZN8uh4V8eh A==;
X-CSE-ConnectionGUID: +vQ5jWvDTeuUcHBKoIEPrQ==
X-CSE-MsgGUID: fXuOWbKaS9aME5nIMppFyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66022173"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66022173"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:38:55 -0800
X-CSE-ConnectionGUID: icL35/7AT26XeESi784VFQ==
X-CSE-MsgGUID: GKBXbLP9SLmBq3NMN1JVkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="215943971"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:38:53 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 25 Nov 2025 10:37:21 +0100
Subject: [PATCH v6 1/7] tests/intel/xe_eudebug_online: use helper to get
 hwconfig value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-xe_query_helpers-v6-1-97686fac1b77@intel.com>
References: <20251125-xe_query_helpers-v6-0-97686fac1b77@intel.com>
In-Reply-To: <20251125-xe_query_helpers-v6-0-97686fac1b77@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=MxemYzqftO1mnV484PapWj/xoSQFjt0Swgc+kMaQ2Bc=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpJXjlnluS5EV9hCBakyiUS8fNOvlNZiBsttWNJ
 KwA2mcPfZmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSV45QAKCRAjYrKT3hD9
 19N5C/9NsHCVTSybi+w1lpYsgxO0ZpG0gD4L1P/6zrOJNbfZKP4S3e8gXe0BdtdVzUqOIiTZLMS
 gammcKwt0Wd9cwDE2X83+Qi4HRUfS0zVKlSb0X+AH3gDg1L9STD0IbbWzQsO7XMGNXHIeS18fIX
 WZNB7Y4Q8rSIi/2xhYSgC3ivw8s9pco7osrseyTnXg1T8ozlU5W5lAfSGWV9aygNnmR32QVnr4D
 NO8MrAUrSD3stTftNBOONwMicguxf4mW3jfyjxUhabXojL62SLnESdEhKqwxyORpwghTDixtnGS
 PNSdCxnQzjV5o4eHIrLpq5JsGpTLtLsqMYcY9XgLqlTkIUmlcobtro8SYZ5s4QwekXNkJlNF1fW
 BMzu0GD03g/LPNHskFyXiqDMNwxkxj6i+bAOoihZWZa6fMdyyJbFzy5PlSFWigWCJ8Ye/dHc0fk
 eDMxuMcj+tmYI1vg2IaMuioHV006DbS6qfi4hwailYbn+KRcPVrOhtmL59slEOw8mAB6w=
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

Recently introduced helper makes the code cleaner.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_eudebug_online.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 50d95988e6b3aa727f12e5d1c8ca52692de4d302..a5b2864a47a34b9051756174f73667bbc602e00b 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1206,9 +1206,7 @@ static bool intel_gen_has_lockstep_eus(int fd)
 
 static int query_attention_bitmask_size(int fd, int gt)
 {
-	uint32_t thread_count_len;
-	uint32_t *thread_count_ptr;
-	uint32_t threads_per_eu = 8;
+	uint32_t threads_per_eu = xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU);
 	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
 	struct drm_xe_query_topology_mask *topology;
 	struct drm_xe_device_query query = {
@@ -1221,13 +1219,6 @@ static int query_attention_bitmask_size(int fd, int gt)
 	int pos = 0;
 	int i, last_dss_idx;
 
-	thread_count_ptr = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU,
-						    &thread_count_len);
-	if (thread_count_ptr) {
-		igt_assert(thread_count_len == 1);
-		threads_per_eu = *thread_count_ptr;
-	}
-
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
 

-- 
2.43.0

