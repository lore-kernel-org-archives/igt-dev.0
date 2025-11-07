Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EE3CCF9F8
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 12:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5516010E0AA;
	Fri,  7 Nov 2025 12:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlVAiMdK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBF010E1C5
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762518274; x=1794054274;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=+18mstpBpFDBBCZHmfkbm2G2zGKZ2R4bkXIiY28AGIg=;
 b=DlVAiMdK2/hX51qarLMaEsRbTQwnnL/tRuDcbAbfJvN51H8R6w3+3mYw
 ioa+WhsEwDIhsqn1saU9TLWwDkfciOOB3pUgXp+vnyyYo/etCzpLfMWtQ
 lkc5z0dN3DCFo/8EXzbhSGC8ERkMP5PfTjjLAiRWFQSLkp9f4OEHHKrB6
 MEyyR39+H4SwWrXxi5ETNHpAV+AcCxrfX5vCrzl8r/ztIgKjVPpYbRgO7
 yqujHfq61gv+LYOw/vmrbtwUcCfCW2K8yJNE86ML6WrzvFT/Zrv6UeX9K
 T2faHBe6YNezyZPUCzXwHbYFzH32KG8adyieKUNMX1yaSktqQanB1Z4tB Q==;
X-CSE-ConnectionGUID: sL/AbfMmS7eqf9b/pdvxCg==
X-CSE-MsgGUID: EIKTdDURTkW/FruHoO+R8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64365672"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="64365672"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:33 -0800
X-CSE-ConnectionGUID: lwPtUDNyRxOjbDDeTXUnnw==
X-CSE-MsgGUID: m7IBK5DhQr6XBqPAhaMCSg==
X-ExtLoop1: 1
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:33 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 07 Nov 2025 13:23:14 +0100
Subject: [PATCH v2 1/8] lib/xe_query: add helper to get first value of hwconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-xe_query_helpers-v2-1-ec66ba6af1c1@intel.com>
References: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
In-Reply-To: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=+18mstpBpFDBBCZHmfkbm2G2zGKZ2R4bkXIiY28AGIg=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDeS6s4hzchJagdixU9lzjjdn9qYkKDV/YkOEe
 L+3EIn0AmOJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQ3kugAKCRAjYrKT3hD9
 17UYDACYuOBT9WLE5s7QBRLLkVPhqrhSLLUW19oUWaDmkdSamfOw5/eUqzT9fCPGqZPD9KjDJkT
 23CNd0jd1Ze1RXbIIHJHqkpFcr9yI4x9wrEd5Beo75WHpvvHYWMLVnkVPxRznUN05abcdZO/DBd
 sNwqfONV5W4v/zZItAf6NSSLSo5lGqQEuhK4bHacV3Wdb5db+zTY8wOXWdRzg2uMLN3cBD8WyNj
 Ha6rXkwgOcPg6Qq2PFUHXfpF6Ia4cLdhaYUUKd7zHxZULzg3hFr+wet485DtQr+kSiS5YrQ8UJI
 g0cBIbOh9Ub1x8aW7vrKusLXyN2Y+jaUiPkxq5fTUQf4o1XI4Gy10pA9ttXKMt6pA3Blevucv2p
 MI2pCGqE0fx7Y6t/n7unk8I+PTO275vs0ai9M+4dI2T5ULXcZTQsNWvUeqvLIou3BPBtKrniRBD
 hDCyQUQyvW0h2HhsikLGMdi7OL6+/ikEEPxg2R60e0c1+ip7ppcGCMGZcf+5MZ9t0sNVM=
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

Most hwconfig attributes are single values. Let's simplify querying them.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/xe/xe_query.c | 17 +++++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a89e0b980643e9aa16b35d9a98c180ffd92a543c..d8ea79108d67dbbb8c859762b1f56d954ee749c3 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -1035,6 +1035,23 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32
 	return NULL;
 }
 
+/**
+ * xe_hwconfig_get_u32:
+ * @fd: xe device fd
+ * @attribute: hwconfig attribute id
+ * @default_value: value to be returned in case attribute is not present
+ *
+ * Returns attribute value, if present, @default_value otherwise.
+ */
+uint32_t xe_hwconfig_get_u32(int fd, enum intel_hwconfig attribute, uint32_t default_value)
+{
+	uint32_t *vals, len;
+
+	vals = xe_hwconfig_lookup_value(fd, attribute, &len);
+
+	return vals ? *vals : default_value;
+}
+
 /**
  * xe_query_pxp_status:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 715b64e2f62cfbbce8dcd987dffefef7b1af72c4..acf3291b07968e829e6e72ebcbf08f00e847e27a 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -136,6 +136,7 @@ bool xe_is_media_gt(int fd, int gt);
 bool xe_is_main_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
+uint32_t xe_hwconfig_get_u32(int fd, enum intel_hwconfig attribute, uint32_t default_value);
 int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
 

-- 
2.43.0

