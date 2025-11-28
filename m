Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82914D116E2
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 14:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3358510E818;
	Fri, 28 Nov 2025 14:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SddIWMDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8DC10E905
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764339266; x=1795875266;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=sftAt8KQzD/wem582JoQ3DB3MoAKndcv0GWKv0g9xfE=;
 b=SddIWMDs48YTllv+crj5F7fJrxJewpT18qBUmnPsjOb2J4ILnPIlEV6e
 xc+1D5TSr8a5CWX1RzMO9szvKveU9kGUzYJvGv85xMQy5GEqaMfS1g1z1
 Lo+ipooUpNdY7i6LdP7XufjvI9J2QHTQ4w2YG/McEVhDCGZi6U3xiM8cr
 jujjqi8pdC7Jdg4he0pxDjao9jefIh5jimB6/inS4+LD3a2Amwj/gX81N
 DU9hrqgugokIDOPWGd9Ti5vPykenXZCCDwWHf0EBR9vynzuVh2A9LCt+V
 wOklaRNfb0t3Pk9mRB8cAtGpE/t2lqTokXoABeD8+kugqQmMx6/yULOQC g==;
X-CSE-ConnectionGUID: 8qHdb3l5RS2GHFdbuOOZgA==
X-CSE-MsgGUID: JvOLwLGHRVCPeCuUcIJkjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66261602"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="66261602"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:26 -0800
X-CSE-ConnectionGUID: PnmC9C8iRyCsIi6Wnijl1Q==
X-CSE-MsgGUID: hSR/EOQ9RkWg+njymuGntQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224173648"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:25 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 28 Nov 2025 15:12:08 +0100
Subject: [PATCH 04/11] tests/intel/xe_eudebug_online: use
 igt_bitmap_hweight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-pagefault-one-of-many-v1-4-a8377a93da8f@intel.com>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
In-Reply-To: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Jan Maslak <jan.maslak@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=3107;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=sftAt8KQzD/wem582JoQ3DB3MoAKndcv0GWKv0g9xfE=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpKa3075+oifOc0hl8ppNwaocjYz4nFT03U+axf
 bJ4vXnglq6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSmt9AAKCRAjYrKT3hD9
 18HdC/9DNW2uAcuGx5+QiM+AUB4+ObsBuvKmZYfG+dtwwaBFi+HqHX3s2e3euJ1J7huZ0NqCENn
 u/J3s0XxOX1/QCUq2Z7Xb/48jLDtZvMjimvhxVQ+3tNq5rQEpmsW1TSOp+GvSy8QFC6ixuekY1O
 1qfFL+qXgQuPICR5gHiRSiO3XF5QhserLjyDcQrXHM/QM7e3iULNozaggzMwIIf7C/g6YQKuSjM
 d/HZDVgXfKERBy+gM4FKN9x1GxgEAS4RmbWk0WFY//LcKHZmZiHxUKu7cgA94ZefoGRN9uGi05c
 1S4ggsu/YiL9Y0o+K1FGGuN+vqGT18Xu6xZOyaG+ef1neYoDcCrPbsxO2+VYO5mcoj4byzix/ND
 3vNoFP1kPMXVeLIJTEvEtnJPja7pbJVEPIwbYV11FAy8mfm4CzYd9RT4tQ7pz/YSDNoZUxMEHZK
 EP2rtN37xCAbttKvt6GBgZwgxxbNlFoNXT6gE6Lot6TYK+kK6iLJXpFoJLE0zfm96+qb8=
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

Drop custom implementation in favor for common helper.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_eudebug_online.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 1e160b0c3d8a..3e446fff5604 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -245,20 +245,6 @@ static struct gpgpu_shader *get_sip(int fd, const unsigned int flags)
 	return sip;
 }
 
-static int count_set_bits(void *ptr, size_t size)
-{
-	uint32_t *p = ptr;
-	int count = 0;
-	int i;
-
-	igt_assert(size % 4 == 0);
-
-	for (i = 0; i < size/4; i++)
-		count += igt_hweight(p[i]);
-
-	return count;
-}
-
 static int eu_attentions_xor_count(const uint32_t *a, const uint32_t *b, uint32_t size)
 {
 	int count = 0;
@@ -449,7 +435,7 @@ static void eu_attention_debug_trigger(struct xe_eudebug_debugger *d,
 
 	igt_debug("EVENT[%llu] eu-attenttion; threads=%d "
 		 "client[%llu], exec_queue[%llu], lrc[%llu], bitmask_size[%d]\n",
-		 att->base.seqno, count_set_bits(att->bitmask, att->bitmask_size),
+		 att->base.seqno, igt_bitmap_hweight(att->bitmask, att->bitmask_size * 8),
 				att->client_handle, att->exec_queue_handle,
 				att->lrc_handle, att->bitmask_size);
 
@@ -466,7 +452,7 @@ static void eu_attention_reset_trigger(struct xe_eudebug_debugger *d,
 
 	igt_debug("EVENT[%llu] eu-attention with reset; threads=%d "
 		 "client[%llu], exec_queue[%llu], lrc[%llu], bitmask_size[%d]\n",
-		 att->base.seqno, count_set_bits(att->bitmask, att->bitmask_size),
+		 att->base.seqno, igt_bitmap_hweight(att->bitmask, att->bitmask_size * 8),
 				att->client_handle, att->exec_queue_handle,
 				att->lrc_handle, att->bitmask_size);
 
@@ -1244,7 +1230,7 @@ static int query_attention_bitmask_size(int fd, int gt)
 		last_dss_idx++;
 	} while (last_dss >>= 1);
 
-	last_dss_idx *= count_set_bits(eu_per_dss->mask, eu_per_dss->num_bytes);
+	last_dss_idx *= igt_bitmap_hweight(eu_per_dss->mask, eu_per_dss->num_bytes * 8);
 
 	if (intel_gen_has_lockstep_eus(fd))
 		last_dss_idx /= 2;
@@ -1337,7 +1323,7 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
 
 			igt_assert(event->flags == DRM_XE_EUDEBUG_EVENT_STATE_CHANGE);
 			igt_assert_eq(ea->bitmask_size, bitmask_size);
-			sum += count_set_bits(ea->bitmask, bitmask_size);
+			sum += igt_bitmap_hweight(ea->bitmask, bitmask_size * 8);
 			igt_assert(match_attention_with_exec_queue(s->debugger->log, ea));
 		} else if (event->type == DRM_XE_EUDEBUG_EVENT_PAGEFAULT) {
 			uint32_t after_offset = bitmask_size / sizeof(uint32_t);
@@ -1402,7 +1388,7 @@ static void pagefault_trigger(struct xe_eudebug_debugger *d,
 	int threads[3], pagefault_threads, idx;
 
 	for (idx = 0; idx < 3; idx++)
-		threads[idx] = count_set_bits(ptrs[idx], attn_size);
+		threads[idx] = igt_bitmap_hweight(ptrs[idx], attn_size * 8);
 
 	pagefault_threads = eu_attentions_xor_count(ptrs[1], ptrs[2], attn_size);
 

-- 
2.43.0

