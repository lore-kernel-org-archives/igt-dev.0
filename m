Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A68C3ABBF
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECD110E84F;
	Wed,  7 May 2025 16:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTzS5vWJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A1610E84F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633897; x=1778169897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vQ1qYyT8la5L8/imrHMjxwQIUzrpxrpye0aT71KYBrc=;
 b=MTzS5vWJFoV58CzC245DS0mhMH/xyGwFz1MQ2SGKPKERclUvslRaRc6M
 4jh1fqtD55njBt2SL22Wenc/7VXiM43M2Im4Tm1ARxvcKQUvgb42u17Zf
 A8iurpyWAVkmNvtuNA4T2D+h8xsO+vV3AUen2H6X0lWQrykWtl6BNgZyV
 prrT1uoUBPvcweOlY266dO00v5tt+OrVpp3lKpx6MkeUZmXM82ffCHU57
 feSElZ/BXab/08ttzk4DYCRYiVNuDG83aHhR04wB6p2h3lLCt0nT9Q3m4
 /B8vSQG2EI1vqAxAdb3/iiSDkhNHqkST/AZv12okHgJpKnK/gXqngbqag Q==;
X-CSE-ConnectionGUID: danLDNQAQU6TXOsWKp7t1g==
X-CSE-MsgGUID: RKkVKYLBTx+qsMdgSbiGYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48519508"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48519508"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:04:07 -0700
X-CSE-ConnectionGUID: I2OJtzruRJOAq0jf5qkZYw==
X-CSE-MsgGUID: ZY1trGL4QnmM/t/KvdWsHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173201211"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:04:04 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v4 11/15] tools/intel_gpu_top: Replace index with strchr
Date: Wed,  7 May 2025 16:01:44 +0000
Message-ID: <20250507160148.53857-12-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
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

As index is deprecated, replace index with strchr.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 tools/intel_gpu_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 68d27089b..54e71e559 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -290,7 +290,7 @@ get_pmu_config(int dirfd, const char *name, const char *counter)
 	if (ret <= 0)
 		return -1;
 
-	p = index(buf, '0');
+	p = strchr(buf, '0');
 	if (!p)
 		return -1;
 
-- 
2.34.1

