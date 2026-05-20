Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F99CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 09:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D405E10EFD3;
	Wed, 20 May 2026 09:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mO6UAFTq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5231B10EFAF
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779271085; x=1810807085;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=j97ntLHtRWVewT/a5lo4nZnNGpMO+DCHE9o+kCf9qLc=;
 b=mO6UAFTqRPMBFaej2C/8SLXOcK5qFMd/EWeM7+zQZieO7+a4U1thRx1/
 SYdyJ+uN5JqLjbVTCNAgpUTYj4btanLGUMne589t7D7tvT9zj2rq9S3RS
 vO/VdyNLqDnyQIrrj9Y+BPUDRaUUGutGc4vhKukLirG0ybOpZhFsPZ+3A
 N/Zwj46BQMHpLl722P/mBCtMdGPEeIC47arMVIoUW9HZL/8PaqJkE8PDS
 hS4tjudBFnByAVSPxUQHfmTli+9E02LqwTh6EBrXFZpzenmlHp3R9Dg5C
 KrYZtbQQgq/THGhmYEPQa8t8E1jgzA2l3fV2iCHDAL6f0EZ/b5kKhZYn7 w==;
X-CSE-ConnectionGUID: ePgdH/skS8qPihNhF+HahA==
X-CSE-MsgGUID: KdcfHZn4Rma+useefOk/Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79188880"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="79188880"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:58:05 -0700
X-CSE-ConnectionGUID: v8t3oltVQwSiyItCDgOSyA==
X-CSE-MsgGUID: nw+c3/gpSy2cN6UZRpWrcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="239971534"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:58:04 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 20 May 2026 11:56:23 +0200
Subject: [PATCH 3/3] lib/intel_batchbuffer: log overflow size in case there
 is no place in ibb
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ibb_fixes-v1-3-d0c8ab2d07d3@intel.com>
References: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
In-Reply-To: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=655;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=j97ntLHtRWVewT/a5lo4nZnNGpMO+DCHE9o+kCf9qLc=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqDYVejspwmcn/adnc+smuuiIcq2OKEHsCYSAIZ
 5h1aEBwwSGJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCag2FXgAKCRAjYrKT3hD9
 1ygXC/9iMR+vfOKN5Cp+3m0J7D9xdoxgw55+FI1dTOa4wXPtQIFXxk/bW9bbr57pit+uhAx9VEJ
 +H3b3uFFvwspmOEjkpm0oG3VukwzJcXtYCi1AJw4MMkQIAtWScJyUzyGPM1Kou+p6TScGIbxlD6
 yAm7YnEusD4GbAFwXE+jr2nMbmWXHhuBGooQ+4X2ptye+nP6U84BpYNOfqFlOeggrkd/V1RLhi8
 yQhOzoZCIGjIRl7Jz8k+hgIgIPI3wgudSQCfBCBCnh6vuTMGe+Qpd6gE9+JZ91RmttL4SB0Uy1N
 XROkJ+OneLCPAuO+TA4SfZQg0P2Kx2G1E+wrIdXm63sapLqY6bawTWLElfGn07ghTMJGgWOkJ57
 NJ8eySMmO56RyDKYDeh6TX5Pupk7X/MxUkVmmf7HtALg7osC4/7KVnzu/FigvuMqQIcjb8anR8h
 KOcnL8021JRx2yoqrjKOT7LmTg4NK4Nh6EYVNGD8wL2gubBddU/PhT4GDox7D1BLUFuCU=
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

It simplifies debugging.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/intel_batchbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 189a41196859..17b2b8625d4e 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2931,7 +2931,7 @@ uint32_t intel_bb_copy_data(struct intel_bb *ibb,
 
 	intel_bb_ptr_align(ibb, align);
 	offset = intel_bb_offset(ibb);
-	igt_assert(offset + bytes < ibb->size);
+	igt_assert_lt(offset + bytes, ibb->size);
 
 	subdata = intel_bb_ptr(ibb);
 	memcpy(subdata, data, bytes);

-- 
2.54.0

