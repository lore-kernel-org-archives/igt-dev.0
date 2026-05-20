Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B74ECD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 09:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4E210EFD3;
	Wed, 20 May 2026 09:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ShP/fAuU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A3010EFAF
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779271082; x=1810807082;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=1Cxo1q3qMIOglrlFJAgZS37tRIqoJME0S4TDKt2C7JA=;
 b=ShP/fAuU6pWYOjStjbOWSzzv/NQ37P0V5/7I6EjSfXxlD4bj9HlP1AB6
 W5kKQk/zOeWfQkOxbG42u6tfxFlGwNRuJo4S9BNokBXXSbU/crWfaN5Xk
 3WRDh6+RAxvPWet/LqxV1Ku8x6DfeMk2MZQX2GjgL5sLASk6iufZZEhf9
 v5vxNHNATR/2tQ1M4mtGsU+FygIwhtIeH/2MOvXcTuj/V4/Ov1lBVvySw
 gFoXGdsyY1gzY4k/cMEz5n5GTgL4CBO55ys+1I8WNoH5f2FEOPXPNW8+y
 VhOzxPtzlLs4NNKK/j3fPzv5t3EHipHQedg+Bd/elvviIe1hXlp7WHF6+ Q==;
X-CSE-ConnectionGUID: zeG1Sg3LRIu1U4Gkz6TR1w==
X-CSE-MsgGUID: xTyjQth8QR2Cni4WB9jPuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79188876"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="79188876"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:58:02 -0700
X-CSE-ConnectionGUID: 8tNKtQtOTPS9rhNAzKSupw==
X-CSE-MsgGUID: B8pfTfA6TlmPQZVx7G8dNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="239971517"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:58:01 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 20 May 2026 11:56:21 +0200
Subject: [PATCH 1/3] lib/gpu_cmds: replace open coded ibb data copy with helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ibb_fixes-v1-1-d0c8ab2d07d3@intel.com>
References: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
In-Reply-To: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=1Cxo1q3qMIOglrlFJAgZS37tRIqoJME0S4TDKt2C7JA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqDYVdHIG6uE0HT1+BM1J9t0zLi58Y9F++BKHJ1
 RNCILA3uVuJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCag2FXQAKCRAjYrKT3hD9
 1yXOC/kB59N54EUuCJ+n0CYnRDsGSwujSiO2KoMJOSw+L6tIc7QZzvuGd9Ay8gpyA3ME9h9bFRb
 Y/ag9Nm3JNRvEywkat3v3VatsMT9GL+wSC3iqc2h3DlvR4LCzO0XAX6ZYUUDTmE8TpUF+241dYG
 HeTjXqjJwhs4VCOErgTvLwJABk2z5XJayqo5cHEN6ExVvxKHW19dE4L/mFFWpb3pU8Rev/03o4B
 tQHdIXiD/aImPb7b3sOmiQBkTn9o9x//p6LNUW43aYytwMqTgEITv1qaqX2c8As3AYxkEYtXYml
 Sy3enIIVts37g5foT0492yGfDya/nh/EoJEP8TpTBzklr01bKZRzOlkjynA4lXYQvM8nn+v+ukT
 qQBmz5i5HLasvFYMWIF7HJk1EJcDClamM4MCu9e++uuSR6BY38qC4LRbWhA0RRKcopvTNcw6Ux6
 M9h+eambT8fujqMP44Y2632MZRhT2IpIQW4UfdzW8wpyL8g5nLrsjVNJWJqBbwN6dZRqg=
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

Helper, beside code compaction and increased readability, adds buffer
overflow checks, which are missing here.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpu_cmds.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index f7b6c8703f7c..9dad73b6df4d 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -70,18 +70,7 @@ gen7_fill_kernel(struct intel_bb *ibb,
 		const uint32_t kernel[][4],
 		size_t size)
 {
-	uint32_t *kernel_dst;
-	uint32_t offset;
-
-	intel_bb_ptr_align(ibb, 64);
-	kernel_dst = intel_bb_ptr(ibb);
-	offset = intel_bb_offset(ibb);
-
-	memcpy(kernel_dst, kernel, size);
-
-	intel_bb_ptr_add(ibb, size);
-
-	return offset;
+	return intel_bb_copy_data(ibb, kernel, size, 64);
 }
 
 static uint32_t

-- 
2.54.0

