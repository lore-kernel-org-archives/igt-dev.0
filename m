Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03E3CD5BA1
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 09:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454D310E7FD;
	Thu,  5 Sep 2024 09:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEK0Ycti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F60310E7FD
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 09:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725528530; x=1757064530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZawDGiNauJI6Kg145+lgyS0tzcCNzXIZeYHGQ/sfrXQ=;
 b=hEK0YctirfGPXZAkISZHVcn1ii7hX517CRjXT6pnsV+B9FEr83WJagzA
 5QWkKsB6wl3Y5WC/HJeV5IJl7z55KfibH4faP8WepDp7CD+gJ8+xXsfiE
 E2haGSCjKKpFPpd98gsAIIL+97Ezk/vhuCLLT3OzNPfjFIsP+L/5tI2RX
 MLAXBTGaGzZBlEVlq0N3AFTMzVdMGISPLYGUfzKyaB2x+S3c4zIrTov6R
 FQrzF1xVnuI+woKoEbCW1xHeXSPLNIUmtSjOMbYhzXroZ4nifZJPVU044
 TLv2FPwBPuozeViWKPvwh7x8GvvuCXOlsRAgdJ0Pdrp6mr19OHjItLmUU Q==;
X-CSE-ConnectionGUID: 0e6YqD4nTV2yhoWuOUXqJQ==
X-CSE-MsgGUID: u09aXtuiSbuq9mm9hRB7Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35590215"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="35590215"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:28:49 -0700
X-CSE-ConnectionGUID: tXZ5Pwu9SveY5ErySIZJRQ==
X-CSE-MsgGUID: F1DQQSJWSXKzYngpfxawOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65404781"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:28:45 -0700
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
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v6 06/17] lib/intel_batchbuffer: Add helper to get
 pointer at specified offset
Date: Thu,  5 Sep 2024 11:28:01 +0200
Message-Id: <20240905092812.94553-7-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905092812.94553-1-christoph.manszewski@intel.com>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
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
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Acked-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/intel_batchbuffer.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index cb32206e5..9e3430e2a 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -353,6 +353,13 @@ static inline uint32_t intel_bb_offset(struct intel_bb *ibb)
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

