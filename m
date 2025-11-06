Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CD6CCFA1B
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 10:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E37310E889;
	Thu,  6 Nov 2025 10:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ohs1HU7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5973310E888
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 10:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762424945; x=1793960945;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=u5z+We9brIwbiXXuy3zwnWVUXhmdl7cofZDu2Kuum+U=;
 b=Ohs1HU7PBgGhqLfRYtYxIFvopuf48RaA13Dir9yvjtUYYLY/gjYua8TR
 5c5cZeNZ0h+CMBOgBM4ywQ9H2Hb5f5RElm7K+fvxi3itHIOZ70gQ822+f
 FJnKlrhdape1yR3xYZesEeFx9CtVZsMSYa0ScMNuw8bvVmtJ7kP0fMQdY
 jjB+XGN51BHnXzK+TGK554y3zgbRKRqu1veNg/fAGtHKdWofm2elR9nnr
 qQ2dmOyQ0muu2gEsyToCylzQnxKUKZA/Zh4s72UCTA8HXSkvFf5kYfKqI
 r+7qAL6qM7kU31IYsh1VSHd871Vg8Q8UWhbifyTiON7eMr0d7f+Z6z/DE Q==;
X-CSE-ConnectionGUID: /AY9Ne1cQEOK8ALouEEP+A==
X-CSE-MsgGUID: ZZSdPlB/SSm7ne78mfv9bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="81960957"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="81960957"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:05 -0800
X-CSE-ConnectionGUID: Ae9GVP+SQDChVOjfU86S8Q==
X-CSE-MsgGUID: kuZUmRQxT16QnfBY0nb+Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187667935"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:04 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 06 Nov 2025 11:27:29 +0100
Subject: [PATCH 4/7] lib/xe/xe_query: introduce iterator for GT topology masks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-xe_query_helpers-v1-4-d761a944c237@intel.com>
References: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
In-Reply-To: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=u5z+We9brIwbiXXuy3zwnWVUXhmdl7cofZDu2Kuum+U=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDHgnaVB/eq8XS+hEroclUcyRakkoblVbWGFBH
 UyrUpXWaDqJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQx4JwAKCRAjYrKT3hD9
 12t5C/0clJDBRgOTpJ5rx40KIjwUQPH3oBrM6PrK2zIbtn4t+VixjUVqsNbngya6qfqYmJeEqG1
 YFxyNTbmO5qKZoOR6aoKIMw/OJfRBnDZ7jdnd2oCrunQ6WRy/Ws6SsGRE+MqQbAyfa5G0rx/BYG
 LSfThGmolyyBjZzTm8JIJNaTctYLslCvv5rIOcT0wCuhjvNlPAbnfVt8iTwdGKccUuYokl9KQTR
 6MujWzoCoiN7CGwCEncaQYewa1u7TQDUrJxCAGuD54jlMQ+rFtO2WhNJtSdrDe+jtC3jPneiYe9
 VaL9GK3Wnf2KHHYCGiuThkGq0HkmzsxnrVL24ZIE1kYQCsnDgPr/DKlevsOZk3VQqLtikBjVYIK
 WJc5UDEEyM9FrfTQZOh3lWPzaGYIKKv/zxgGZGjhX1UD+nuVS1vlxNf50nQERMMN8kfHuSreRl/
 pmGWeCvGwr4gFK8c5DSWMfsHVYPoRCd6Ma+ajUNuNKSgTRlkhnnBfJH5QTYJu8Jg61BYg=
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

Topology masks returned by device query DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
are placed sequentially in one blob of memory, moreover every mask can
have different size as they contains flexible arrays.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/xe/xe_query.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 9e4512fa03ac619e3d59b017eed4a58b294f716c..9bc57cf7e3ba1af90bc6fd9ef68df2ad960137d4 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -93,6 +93,12 @@ struct xe_device {
 #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
 
+#define xe_for_each_topology_mask(__masks, __size, __mask) \
+	for (__mask = (__masks); \
+	     (void *)__mask->mask - (void *)(__masks) < (__size) && \
+	     (void *)&__mask->mask[__mask->num_bytes] - (void *)(__masks) <= (__size); \
+	     __mask = (void *)&__mask->mask[__mask->num_bytes])
+
 /*
  * Max possible engine instance in drm_xe_engine_class_instance::engine_instance. Only
  * used to declare arrays of drm_xe_engine_class_instance

-- 
2.43.0

