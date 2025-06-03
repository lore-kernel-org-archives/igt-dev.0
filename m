Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D131C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 16:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359CE10E60D;
	Tue,  3 Jun 2025 16:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nj7iLijr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB7910E5DB
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 16:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748968673; x=1780504673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7SQWbvYLLfxJW4FMj2Ako7GW07/tA6H4RH7zISeDfew=;
 b=nj7iLijr7YcT8BhlHIYduuy5FRASv+vpPOznjK53yxr5QQSeJ6RObl0t
 EQHuDDUgvzTrB3eEmZA9pMa7hagK/GEmUvUAaK42U4TdYHNvYDeW8meqj
 Fj3V5vm+Q8jokoLj4nTk7jdC0i5Jnd4cI8iIIvTWgoWT9doAUAsgmFE4b
 Pj/TNzHUvE4mqrz6f4o5G7EzRo8eYaA5xYpOistHBAcxpE7QVdTuf/FlE
 TF0bZJRwfMuRxCi8DHSjiZhzOKcdw+g/U93c9ZLWCSchQvcLiTD2zo6oL
 wJkvDDOqIkuP+Zv3SD4OIgcOl5Po2RMg5TR0SYLJwqqd1JCsZ6dDAro3I w==;
X-CSE-ConnectionGUID: td6bX7xHRZehsXpPbiP6vw==
X-CSE-MsgGUID: HWUlgrdgSRKvlkUGlWCqZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68573245"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="68573245"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:37:53 -0700
X-CSE-ConnectionGUID: GWXlyAOvQRWsCJSuEGR6GQ==
X-CSE-MsgGUID: hWt2yugaQza6z75yrOvXpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="182090286"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 03 Jun 2025 09:37:50 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v13 03/11] tests/intel/*_intel_bb: handle base64 encode
 fail
Date: Tue,  3 Jun 2025 16:37:06 +0000
Message-ID: <20250603163715.70774-4-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603163715.70774-1-jeevaka.badrappan@intel.com>
References: <20250603163715.70774-1-jeevaka.badrappan@intel.com>
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
the Base64 encoded data. Upon failure, null can be returned.

When g_base64_encode function fails, exit the calling function with
error.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/api_intel_bb.c | 3 +++
 tests/intel/xe_intel_bb.c  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 4a1c9be91..63e171e16 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -944,6 +944,9 @@ static int dump_base64(const char *name, struct intel_buf *buf)
 
 		igt_info("--- %s ---\n", name);
 		pos = str = g_base64_encode(destbuf, outsize);
+		if (!str)
+			return -1;
+
 		outsize = strlen(str);
 		while (pos) {
 			char line[LINELEN + 1];
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index d8bd7b519..c673eb11e 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -595,6 +595,9 @@ static int dump_base64(const char *name, struct intel_buf *buf)
 
 		igt_info("--- %s ---\n", name);
 		pos = str = g_base64_encode(destbuf, outsize);
+		if (!str)
+			return -1;
+
 		outsize = strlen(str);
 		while (pos) {
 			char line[LINELEN + 1];
-- 
2.49.0

