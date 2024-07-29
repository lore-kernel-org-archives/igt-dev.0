Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B24EC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED0E10E425;
	Mon, 29 Jul 2024 16:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gb2z0eAk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C23910E425
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269097; x=1753805097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hjLMOHlNO8AleDNGrEzIJHH7o3VRK1t7It/GmekWzqE=;
 b=Gb2z0eAk5EV6jK4Wbi/JilJsDzs7RQ5EWVtmt3vX1/8OpF3PSaqznxzX
 3FF1sipuKWIFPVi6QV4qXgsmu27Kud4Mw2iP48HiVgcJV06oXsxeYx3sa
 hb5wiG6IQnjyLf1w4ayR9OJSW5nhdL1WvVd1w+2j2cgQNbJl9bNfSZHhW
 zraKh7EfLAZcECcXhBp1YkFetj7MRdpGKF0YEMaTkYJiI0D5EH8UsTczO
 JmSTzjVGbU9W7WxhfBDnXvChpkaCToa4yGyrONsXs/LG0+VTB0N1r+Ftj
 WIk9bI0KT2WkOdatL45rTxUoainBItzIYUCl7ISymEditCrMCPoAyrE7d g==;
X-CSE-ConnectionGUID: QmIyIGVKT8CwehNPKCBq2g==
X-CSE-MsgGUID: x3J0iOemQjWhqykzlUJAtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427474"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427474"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:53 -0700
X-CSE-ConnectionGUID: IgSBToOWS968TgI1QWmogA==
X-CSE-MsgGUID: Rlqv3vU3RlujaSrKzyCd4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53739317"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:50 -0700
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
Subject: [PATCH 48/66] lib/intel_batchbuffer: Add helper to get pointer at
 specified offset
Date: Mon, 29 Jul 2024 18:01:41 +0200
Message-Id: <20240729160159.37036-49-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

