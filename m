Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E921C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 16:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F86F10E1F8;
	Tue,  3 Jun 2025 16:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFz/W3nS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FA210E090
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 16:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748968670; x=1780504670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rat37l2K6foyOpE3CJn8DjDnOFVWkE+d5Tta+KtkH18=;
 b=AFz/W3nSylaMtTsXFB4cdzCIXyFjc52j5WAGD/XetYJpztvnIW7GLqSi
 BcGVd1rQQ7ZRo41AconyfNQvI+9MkhiyTGxcMQxoQNj4oWTarEm7sB+jx
 YzO9c29AeyMgvaZoxjvjZZe7d6fEuz25lSnJT7gczrZkT/lzSl2LnSRkt
 rWHvkaLywCLOcvOrUcrsEJsrBCnoJQNOrsUqdw0cNx6BzCLHTGNFIlJL6
 cdJ1BXf0PnmphSOGZS5lER8FQ5cot54hQobgEEujTIfDLtLKH8pxDj5am
 MrQ3df2RFBpLXPo0b3PRprxm61XQy8Umc7YCehDRVG0ZPYb1xidXrwYnd A==;
X-CSE-ConnectionGUID: mnnu+7JIQ0mJnzM5SvP6Yg==
X-CSE-MsgGUID: o5YsMIcDTj+qi6nr5+ahSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68573242"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="68573242"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:37:50 -0700
X-CSE-ConnectionGUID: DQQEm01ET6aW1SZsef9AqQ==
X-CSE-MsgGUID: J2BvZlSeRC+vrzi9wn1g/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="182090249"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 03 Jun 2025 09:37:47 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v13 02/11] lib/intel_batchbuffer: handle base64 encode
 fail
Date: Tue,  3 Jun 2025 16:37:05 +0000
Message-ID: <20250603163715.70774-3-jeevaka.badrappan@intel.com>
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

When g_base64_encode function fails, exit the calling function.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_batchbuffer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index f7569e768..a0c3fe340 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2348,6 +2348,9 @@ static void intel_bb_dump_base64(struct intel_bb *ibb, int linelen)
 
 	igt_info("--- bb ---\n");
 	pos = str = g_base64_encode((const guchar *) ibb->batch, ibb->size);
+	if (!str)
+		return;
+
 	outsize = strlen(str);
 
 	while (outsize > 0) {
-- 
2.49.0

