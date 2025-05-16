Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EFFC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 18:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196A310EB6C;
	Fri, 16 May 2025 18:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NikUQHsg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A016F10EB6C
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 18:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747420077; x=1778956077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vVzbZB5HRSgLSfNya0xJtsxDJgCGnyqgU8Tg6Tmrn8I=;
 b=NikUQHsgcPyu1JaztdpL9zz3c7jb6L0yDYrv297smax/jArRWOOpRjnf
 rQUxw/LhM8vrFd5NLR6AxBQDlMPGdhTsiI4H05pipMAZd1SXFiP3paO+4
 J5d55QLgU1oRVoxsrVyNQ2OJVV8SGe29JVv6lljCE2KvN4uC5WUtB0ZCD
 CdyAgMkS2rd2VNP5Mv1I792ZWjRohkT2TJcCK3lILHyH1EvGCqSAn8vHH
 BHM+suYAQg6ECo4hFKdR8q0ESpqDArnxX9AP89Z/C3Y5jYbR1TtHvfZoG
 UQBAjKXoBHmCEmXFw8ZSfm7wW2wiGSlq7EYb5Jfdy5TEZnmo9DfAh/QC6 A==;
X-CSE-ConnectionGUID: ucvJ/mKKSLqKZVXSb1efgw==
X-CSE-MsgGUID: MRjB3Hd0TLyjkA9zDxQ20Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60059916"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="60059916"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 11:27:57 -0700
X-CSE-ConnectionGUID: XxDzagfZQNOEiIU2gk31nQ==
X-CSE-MsgGUID: c/ibfSidTOufckDgQgC6hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="143736983"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa004.jf.intel.com with ESMTP; 16 May 2025 11:27:55 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com, adrinael@adrinael.net,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v8 11/14] tools/intel_gpu_top: Replace index with strchr
Date: Fri, 16 May 2025 18:27:01 +0000
Message-ID: <20250516182704.97912-12-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516182704.97912-1-jeevaka.badrappan@intel.com>
References: <20250516182704.97912-1-jeevaka.badrappan@intel.com>
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

