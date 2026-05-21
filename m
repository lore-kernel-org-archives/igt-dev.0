Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C47CD4F5E
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 11:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4484A10E19D;
	Thu, 21 May 2026 11:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/j9eNWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C9F10E19D
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 11:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779363242; x=1810899242;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Cg49aLUB4pFwLmXMQAmaVnbmwYs4i2vv5PYw5Qk8Afo=;
 b=c/j9eNWngr+zNCSBBoqUy1Gn4/bXMb6fx7vl77vXe7rRxFMcpSqATJ40
 2H5yU9l57wlcFv2H/h6+/VyRc58FtWupld2FyUJswJacXUU4uvmUp3SFW
 GuGPYubE5yTp4q4NDl1egJT1W/u/SDBxURR0Z7DQnYDmFRkBvkBqFflLB
 xiHwNZo1mRmiyIgpJLeE0sanIjB9efUn5wZOiqCI3rho1wvD8HKGZkEpR
 RVSQZH8VUItVekP8P2QdvJwvLbddfoAuhGwUXwA/UftZN0IF4AiGqD3iJ
 8oPb1Mrm3DRIaykBIAMXoaknCtSsXho6YSfW1X4EpWJrcw5QGvQPstsvp A==;
X-CSE-ConnectionGUID: T2AhmcySQGG0Pw7LAVvwcg==
X-CSE-MsgGUID: aHrZcm3BTB6N0hlxsMD2hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80312796"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80312796"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:34:01 -0700
X-CSE-ConnectionGUID: 3a85EYDLRPKtPgMgw1tI2w==
X-CSE-MsgGUID: 5ML9blBBRVmDIlkl/1Odbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="240370786"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:34:00 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 21 May 2026 13:32:19 +0200
Subject: [PATCH 1/2] lib/intel_batchbuffer: assert on accessing prefetch area
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-ibb_fixes2-v1-1-7094a6ff3520@intel.com>
References: <20260521-ibb_fixes2-v1-0-7094a6ff3520@intel.com>
In-Reply-To: <20260521-ibb_fixes2-v1-0-7094a6ff3520@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2562;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=Cg49aLUB4pFwLmXMQAmaVnbmwYs4i2vv5PYw5Qk8Afo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqDu1dRnV2TF0SkD17rOvcXyUMJINdCwAKFkhgs
 eyYAFtrX8CJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCag7tXQAKCRAjYrKT3hD9
 1xjJC/938k56Nb0DVhYdqN5zTIodPbmnIQLrlKArzRxnOFonAJ3os1VI+OjCF52DNgvpbH1xfJs
 vNCvtG7lvZ8wyJ4/0D2btu6klLDiWaf0DQKWhBnMMQUg1XTTsfzscmIth9KUA6JWVJ6ZuJ8z64R
 lVofurvkWkrDZn9pkLzx+AuSbH+Tj27uZFLXHChxy5/plL2wydur+haICQC1rkByXqM3s8DgyJi
 reoLcYBSdNW8ILJqA/ap8JGJ6gWe1OtQX2Gvyxr28JnLq0ASGQOOC+J4OJzQEWCm75OFvvKqC10
 krZEinOUhpt68wxdpSWk4BBjGPzwXxUDj3fNvVuyOKCyOB3IGWdS+wArK6lC/QwEte/DgpJR+O/
 LNc75Ag3Ib6UMX6Gk+F88Zb1gvCT3XE8RUZrUwWm58QaZeT9LhI5/CR/Z92CdPha4oouGa3gKs9
 N2egk/wf5skUsnNA5Uud+X8mEpq7j6ero+8KjJJBfXkX6MpR5rX0uYO/y9xEuNddcJVxU=
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

On batchbuffer allocation library adds 4k padding to the buffer to avoid
prefetch errors. To avoid batchbuffer overflow existing asserts should
compare against requested buffer size (usable_size), instead of allocated
buffer size. Otherwise we risk prefetch errors.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/intel_batchbuffer.c | 3 ++-
 lib/intel_batchbuffer.h | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 17b2b8625d4e..ec0a7108b1f7 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -917,6 +917,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 	ibb->devid = intel_get_drm_devid(fd);
 	ibb->gen = intel_gen(ibb->devid);
 	ibb->ctx = ctx;
+	ibb->usable_size = size;
 
 	ibb->fd = fd;
 	ibb->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
@@ -2931,7 +2932,7 @@ uint32_t intel_bb_copy_data(struct intel_bb *ibb,
 
 	intel_bb_ptr_align(ibb, align);
 	offset = intel_bb_offset(ibb);
-	igt_assert_lt(offset + bytes, ibb->size);
+	igt_assert_lte(offset + bytes, ibb->usable_size);
 
 	subdata = intel_bb_ptr(ibb);
 	memcpy(subdata, data, bytes);
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index d0a7c8dc7250..06d0baf888f0 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -255,6 +255,7 @@ struct intel_bb {
 	bool enforce_relocs;
 	uint32_t devid;
 	uint32_t handle;
+	uint32_t usable_size;
 	uint32_t size;
 	uint32_t *batch;
 	uint32_t *ptr;
@@ -363,7 +364,7 @@ static inline uint32_t intel_bb_offset(struct intel_bb *ibb)
 
 static inline void *intel_bb_ptr_get(struct intel_bb *ibb, uint32_t offset)
 {
-	igt_assert(offset < ibb->size);
+	igt_assert(offset <= ibb->usable_size);
 
 	return ((uint8_t *) ibb->batch + offset);
 }
@@ -372,7 +373,7 @@ static inline void intel_bb_ptr_set(struct intel_bb *ibb, uint32_t offset)
 {
 	ibb->ptr = (void *) ((uint8_t *) ibb->batch + offset);
 
-	igt_assert(intel_bb_offset(ibb) <= ibb->size);
+	igt_assert(intel_bb_offset(ibb) <= ibb->usable_size);
 }
 
 static inline void intel_bb_ptr_add(struct intel_bb *ibb, uint32_t offset)
@@ -407,7 +408,7 @@ static inline void intel_bb_out(struct intel_bb *ibb, uint32_t dword)
 	*ibb->ptr = dword;
 	ibb->ptr++;
 
-	igt_assert(intel_bb_offset(ibb) <= ibb->size);
+	igt_assert(intel_bb_offset(ibb) <= ibb->usable_size);
 }
 
 void intel_bb_set_pxp(struct intel_bb *ibb, bool new_state,

-- 
2.54.0

