Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFB7C531DC
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 18:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB0F10E08B;
	Fri, 23 Aug 2024 18:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lh93k6vw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD25710E08B
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 18:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724437388; x=1755973388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cJ3gLH3l5HR7RfOq3jKouTq/DUyB5kgH6b1VUKi1K+g=;
 b=lh93k6vwYgB1xLVFpmD917hqjTveM3lt8ZZc4IxwCTbmiQnIOt4a8X2Q
 X+HWI5bctTTGWld3dKU11t24o3OZ8UOn43+l7pgI4LI8jnqdfDnoutLUS
 ejzh3Ee71c90yzxXVq9/6eoXAanFvrLYXN2lfsTROzKVl+YyzUc7O2uu9
 y6ciBKkQ0/3A5Ctk2RpCSalxKikkZcA8DJUlwuO9XoyJo4V93PI0JJkFU
 Do7nkrA5tdupxAJk6LQS9R12Si+yQ9OCivrZlvbqim/X2BihtdCdEIdYK
 fDF/qJ/MjtNUzpKLtMhOcj12sSaWMu2+Dc54M8R2Vv2UIQKHmP3okvJCu Q==;
X-CSE-ConnectionGUID: e3L/1Y9GSXuM1gCbRMzVyw==
X-CSE-MsgGUID: u6Uace6iSUysRmoTf1+3xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34079284"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="34079284"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 11:23:08 -0700
X-CSE-ConnectionGUID: SKJjUGeRRpSB8d/eZBxY9A==
X-CSE-MsgGUID: vGUBZoLYTQuSbrlmHIydTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="92606092"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.10])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 11:23:03 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v4 07/17] lib/intel_batchbuffer: Add helper to get
 pointer at specified offset
Date: Fri, 23 Aug 2024 20:22:12 +0200
Message-Id: <20240823182222.305965-8-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823182222.305965-1-christoph.manszewski@intel.com>
References: <20240823182222.305965-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
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
Cc: Mika Kuoppala <mika.kuoppala@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Acked-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/intel_batchbuffer.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index cb32206e5..7caf6c518 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -353,6 +353,11 @@ static inline uint32_t intel_bb_offset(struct intel_bb *ibb)
 	return (uint32_t) ((uint8_t *) ibb->ptr - (uint8_t *) ibb->batch);
 }
 
+static inline void *intel_bb_ptr_get(struct intel_bb *ibb, uint32_t offset)
+{
+	return ((uint8_t *) ibb->batch + offset);
+}
+
 static inline void intel_bb_ptr_set(struct intel_bb *ibb, uint32_t offset)
 {
 	ibb->ptr = (void *) ((uint8_t *) ibb->batch + offset);
-- 
2.34.1

