Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC37DCCD1A2
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 11:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4786710E57C;
	Wed, 18 Sep 2024 11:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXWxcgRF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C0610E260
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726659064; x=1758195064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RW11voooq235HIOjz83Gj/byPpAAAMBpPbxIrnoHmsI=;
 b=nXWxcgRF5iFrV02BpnLKVdfNyi3TRyUOgmn8cycR1GsxjgHeALvjLh0/
 IloD1HQt9EeQzWDycz8janeNIeU8bLgQtRWS3t4fiiqGcIjJUDqF3m50h
 9KLFIEAepJifsd1urtR5v1d44qEr+RlXh8TP6xcNEIMRY+b3WXUYYbbqp
 lAB44qHaiomqhhZnBHxu8mJ97gPe3gjnmWojHgziXphLpqrphQG8j537X
 1X/gJ3aj1+6PAj2rfv6l/aXV2PX8cGzWQXtqC4LXo1LTVtnfCxrRxQef0
 EwSJBb2wVWLpl7CVPdIskl7vA7j3QbJyoST+KkfjS5VEKCQXAxx9Vn3Qq w==;
X-CSE-ConnectionGUID: kIAzFxsYQU6Ur3a2sfU2UQ==
X-CSE-MsgGUID: W98zOuEcTyuZqOqPxBJRYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="28470077"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="28470077"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:30:55 -0700
X-CSE-ConnectionGUID: FLQceHT8R9u6yxDJDqvCNA==
X-CSE-MsgGUID: MmJwH5jRTvCXfXph00/qYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="106972553"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.218])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:30:50 -0700
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
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v7 05/16] lib/intel_batchbuffer: Add helper to get
 pointer at specified offset
Date: Wed, 18 Sep 2024 13:30:06 +0200
Message-Id: <20240918113017.144687-6-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918113017.144687-1-christoph.manszewski@intel.com>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
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

The helper will be used to access data placed in batchbuffer.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Acked-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_batchbuffer.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 64121011c..08345d34e 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -356,6 +356,13 @@ static inline uint32_t intel_bb_offset(struct intel_bb *ibb)
 	return (uint32_t) ((uint8_t *) ibb->ptr - (uint8_t *) ibb->batch);
 }
 
+static inline void *intel_bb_ptr_get(struct intel_bb *ibb, uint32_t offset)
+{
+	igt_assert(offset < ibb->size);
+
+	return ((uint8_t *) ibb->batch + offset);
+}
+
 static inline void intel_bb_ptr_set(struct intel_bb *ibb, uint32_t offset)
 {
 	ibb->ptr = (void *) ((uint8_t *) ibb->batch + offset);
-- 
2.34.1

