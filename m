Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C4FC5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 19:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0B910E0D9;
	Tue,  3 Jun 2025 19:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpZl9Mhq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3363F10E0D9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 19:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748978671; x=1780514671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=95JcTtPUh1xofjO3SETGbMLE6BG8U53MztsiqyzaWgk=;
 b=EpZl9Mhq891R621T8vDrp1cHZjpC3wSVWbVelhfRKKOa/eQnEbSi6GLQ
 Hcr84rOZdyASj+Vs5mbgCftYLL621gE0YJfZ0UkI6OY7Iie2iv0fskIXq
 t0DG5z6qTmmdVeVcVJa2HJlOopSm/uiB5MkzEU2KbddSnWCLzABZ5STZp
 fh6b9IHtJjmvUxaBTaZX7nTQ8R9CoyFzgxuI+mjDyACSw7F5mNCrTQZdG
 KfYPGuESme3KOCtTkr8Fjf/uRKSfuS2eItmDvXqWIXD324ootfeRztnal
 aPquRmQT0uETg+jv8+WDuYe2102KjJrNi8VRELPLBqXGiDUUrmw3CJfmv w==;
X-CSE-ConnectionGUID: ehvjGjkORjOaJUI50cJRew==
X-CSE-MsgGUID: +zy07sDHTZeF6Rvd9nUERQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="76424297"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="76424297"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:24:31 -0700
X-CSE-ConnectionGUID: EtnH1/8GSdGW8uMAuDq8MA==
X-CSE-MsgGUID: Z4tlXOJkRwyGdZ4KAHAZnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="175821260"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 03 Jun 2025 12:24:29 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v14 02/11] tests/intel/*_intel_bb: handle base64 encode
 fail
Date: Tue,  3 Jun 2025 19:23:45 +0000
Message-ID: <20250603192355.77019-3-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
References: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
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

g_base64_encode function returns a newly allocated string containing
the Base64 encoded data. Failure case is not handled.

When g_base64_encode function fails, set the outsize to 0 to address
null pointer dereference crash.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/api_intel_bb.c | 3 ++-
 tests/intel/xe_intel_bb.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 4a1c9be91..1910690cd 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -944,7 +944,8 @@ static int dump_base64(const char *name, struct intel_buf *buf)
 
 		igt_info("--- %s ---\n", name);
 		pos = str = g_base64_encode(destbuf, outsize);
-		outsize = strlen(str);
+		outsize = str ? strlen(str) : 0;
+
 		while (pos) {
 			char line[LINELEN + 1];
 			int to_copy = min(LINELEN, outsize);
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index d8bd7b519..f0cc17b1a 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -595,7 +595,8 @@ static int dump_base64(const char *name, struct intel_buf *buf)
 
 		igt_info("--- %s ---\n", name);
 		pos = str = g_base64_encode(destbuf, outsize);
-		outsize = strlen(str);
+		outsize = str ? strlen(str) : 0;
+
 		while (pos) {
 			char line[LINELEN + 1];
 			int to_copy = min(LINELEN, outsize);
-- 
2.49.0

