Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416E5C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 19:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56E110E0CB;
	Tue,  3 Jun 2025 19:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1HcijNp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9630210E0CB
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 19:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748978669; x=1780514669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rat37l2K6foyOpE3CJn8DjDnOFVWkE+d5Tta+KtkH18=;
 b=Q1HcijNpH2EbeZi02Ydf/8Qj5EOSawjENNxiayv7nD9h1nf9/+QQMOyr
 l++gi/7TdHAPDwxNEzP8HJtACVeh57K4fZ1JIQAYnVzrFGqDHoPq9LU/P
 g320K6djfrKiUw6iKH+QF7HEJfenLiialKgiQuxpJ8ynotbCT9pVxZoq0
 /bN2pQ1keyUPV2+7Prw+m4bJJTTTj7fF889nBjtMlAU/+D4SfM1YhM/Nk
 siL4yu82wZ/0NT90qohxFV7HhUA3OUOE7N6uMuKjUDAffxeTZZhjTkZyg
 +lbaz5REBOIzRRNchh0ZiFR1ALew+3Ch0BSKNSpX9qR6NbEIWnNos5+e7 Q==;
X-CSE-ConnectionGUID: JqDRDaX+Smunb1XhT/l1jA==
X-CSE-MsgGUID: tyKO3sqfRoaIghLsTuEYNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="76424292"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="76424292"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:24:29 -0700
X-CSE-ConnectionGUID: yvKqIZfPS5yv5Ebk445mNA==
X-CSE-MsgGUID: 38tKAGpuSKmNtyGMtiFOMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="175821257"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 03 Jun 2025 12:24:26 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v14 01/11] lib/intel_batchbuffer: handle base64 encode
 fail
Date: Tue,  3 Jun 2025 19:23:44 +0000
Message-ID: <20250603192355.77019-2-jeevaka.badrappan@intel.com>
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

