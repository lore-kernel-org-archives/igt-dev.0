Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162C1C83F2E
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 14:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C265010E6CF;
	Thu, 29 Aug 2024 14:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTNHPK6h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA7D10E6CD
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724942789; x=1756478789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s0R+rEcVqleeupzuIAjndrxF5zeJXwKrOwtN44CwhE4=;
 b=mTNHPK6hEC0bhcQONMoNCZHMACerdX8kDhZMKiVQDMLcUJjyTYBmxylm
 sS9vDNNLXMqquGt2oONc+kGsl9zDmZUDaBXCqSidV5Ce6GvyUYMVYUqdD
 rwx2+OBbK5JnfY50f7V2E4SU0dQm9TZmr3tSXl0yW7cQLqRcjUz8e+xhA
 BbvoRYCDMsn9wRbYFLwHrPBPpHjhkvgegPbaQ5yZYoR/aRWmKpb8tIaud
 1tTh0U2+QE8UUe+VXr2vdK2SVoDBDvmPgxVsMGaScF6pqADgnDYajJFA7
 EFSmCxiANHgh4amfeHwcWExUfeube/Uf0UCR480UNWUBdEnBaxzAIeQPX w==;
X-CSE-ConnectionGUID: m4hFMii8RauWR2GMfOGzJQ==
X-CSE-MsgGUID: d4UM1eGmSxG3+oom234DsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34947543"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="34947543"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 07:46:29 -0700
X-CSE-ConnectionGUID: +AvDpB3xQBuIKdfpWO8tHg==
X-CSE-MsgGUID: 0Aay3UxmSb+mX1BN7Zz/Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="64304049"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.237])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 07:46:25 -0700
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
Subject: [PATCH i-g-t v5 06/17] lib/intel_batchbuffer: Add helper to get
 pointer at specified offset
Date: Thu, 29 Aug 2024 16:45:36 +0200
Message-Id: <20240829144547.105371-7-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144547.105371-1-christoph.manszewski@intel.com>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
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
 lib/intel_batchbuffer.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index cb32206e5..b1670d23e 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -353,6 +353,13 @@ static inline uint32_t intel_bb_offset(struct intel_bb *ibb)
 	return (uint32_t) ((uint8_t *) ibb->ptr - (uint8_t *) ibb->batch);
 }
 
+static inline void *intel_bb_ptr_get(struct intel_bb *ibb, uint32_t offset)
+{
+	igt_assert(offset <= ibb->size);
+
+	return ((uint8_t *) ibb->batch + offset);
+}
+
 static inline void intel_bb_ptr_set(struct intel_bb *ibb, uint32_t offset)
 {
 	ibb->ptr = (void *) ((uint8_t *) ibb->batch + offset);
-- 
2.34.1

