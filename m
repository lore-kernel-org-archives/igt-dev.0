Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42C1C2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 15:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6909C10E333;
	Mon, 19 May 2025 15:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKPGmICF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF6710E333
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 15:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747667547; x=1779203547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vVzbZB5HRSgLSfNya0xJtsxDJgCGnyqgU8Tg6Tmrn8I=;
 b=DKPGmICFwdImW6P7hN6QKYnKnA3qGi5sG1RDQYafI7GCD+FrUtKf4Jmb
 zg+8jR9YZafJcxHs4pt9YwgFh/O3FHPCXCsxSOCF1qCWs4nMqA3p5L7A2
 9eyiD7kZtfQ8as+vodhaRWRY+P5EN3z0sNzqozTLxwq1PWDdczmoKVsgu
 Gz0mCuDKZYhhzFdCmdIVJ77s9ekxbrPBNZuojtDklLWklsu9YFvr2RWFv
 8ZTm0D8jA1ECAFQOa9LDl/AegCTzKnpJuezG0q4vR4S8cRbuoTZcJtnlm
 Glhb2XoErNPCxSuvoG8XUvr1GZv3QPiKZcO0wiaSTProkiDNmC5u60HA+ A==;
X-CSE-ConnectionGUID: 3eOMviszTWqXahq+RFgdAA==
X-CSE-MsgGUID: uKWksIbYScqhm09q2sn0fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49710578"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="49710578"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:12:27 -0700
X-CSE-ConnectionGUID: AqTp258ET2G15xCbprugzg==
X-CSE-MsgGUID: yrX++CjtQd+pZTC13ju4pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139288017"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 19 May 2025 08:12:24 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v9 11/14] tools/intel_gpu_top: Replace index with strchr
Date: Mon, 19 May 2025 15:11:32 +0000
Message-ID: <20250519151135.43874-12-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
References: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
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

As index is deprecated, replace index with strchr.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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
2.49.0

