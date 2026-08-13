Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658A7C5CFCF
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 18:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D4D10F4D9;
	Thu, 13 Aug 2026 18:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXGtbPUo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5512F10F4D9
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 18:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786644783; x=1818180783;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TjWmgvWSgfhGId3Q+x7pHdg0McAiMuNCC8gZOF3NBfQ=;
 b=FXGtbPUor84l2YtWyR4bCRDDpwwnQ2F0heLXeE0enufJ26S15C1yoeI2
 7dq04eRi/X5oVhcrOi+CgbP4XYPERjKU4msn+1F/2GlPGIagGPUqelPbr
 PEojl6EP/oGx2fWlFEK4NSe8/HTQNCA7oVg0sNk9oLkDV6tHWL97opw0H
 iI0j0pzJjsPfk0a8DJJlD+LlYVSVswWi33qsV/iMBZVTp1oFqAyS3WZ05
 NEOG9GPpyMAW1v0YJrhgiM5VLAg+gnogstHAnMCJa6SBwm4dZHjhDmAmg
 ALNjZpJq3j/UBecED5NN19FR95TbgOBhMC3OAee+2rQfZK1VkN+BRqUSG g==;
X-CSE-ConnectionGUID: Yz6hXm9+RGSHIxCRCto+/g==
X-CSE-MsgGUID: +MDNJzVJRcizSmJIyIB5rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="89748189"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="89748189"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 11:13:03 -0700
X-CSE-ConnectionGUID: /qAi7KRSSr2IYos7GxY84Q==
X-CSE-MsgGUID: R32dCTW7Qjm6DHpVDsG5UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="261375348"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.68])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 11:13:02 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] checkpatch: Ignore camelcase and igt_main()
Date: Thu, 13 Aug 2026 20:12:55 +0200
Message-ID: <20260813181255.162149-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

Camelcase is used by both drm and glib and igt_main() is a macro
without parameters. Both are valid usecases in igt so instruct
checkpatch to ignore them in patches.

Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 .checkpatch.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.checkpatch.conf b/.checkpatch.conf
index dba22494b..30935c50c 100644
--- a/.checkpatch.conf
+++ b/.checkpatch.conf
@@ -2,4 +2,4 @@
 --strict
 --show-types
 --max-line-length=100
---ignore=BIT_MACRO,SPLIT_STRING,LONG_LINE_STRING,BOOL_MEMBER,PREFER_KERNEL_TYPES
+--ignore=BIT_MACRO,BOOL_MEMBER,CAMELCASE,FUNCTION_WITHOUT_ARGS,LONG_LINE_STRING,PREFER_KERNEL_TYPES,SPLIT_STRING
-- 
2.55.0

