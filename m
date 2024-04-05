Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F2FCD1296
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 06:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E884D113939;
	Fri,  5 Apr 2024 06:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Btzy1Oem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61305113938
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 06:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296871; x=1743832871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aEIGd3rm2qT6hsaKAM46w0uOIre3DA6qZul62hXlTuo=;
 b=Btzy1OemO5eBotHdUXAzNp/OCVLUDVDa2hP/VYrbDeDgL8ObDJULp9jC
 QcbaMRvSRHwhx23mU9MLJYB06tAH7Sh4UpKozAqHV19eI6pr5JbLPF0BI
 cHPb/4SFcjgNdrqy9MBNyN/a9Rh8u2zIYFrHjLSCt5TGrbPCq7k165WuR
 ZwetxZYL7WL9osCgVkHnfeQ+75Tsfm3FI217ru6infFRvxfWzXtr3uh6c
 rTWywSWbPQ8GOfDLvTqydTNyzyjy3jfJ+LL40oxDRbh1yxhF+wYqc83MH
 3YOUqkd3osiv9yuno1v6814hBVgF9gMHjBwKEfViqw77eIMPZn6Pky8oe Q==;
X-CSE-ConnectionGUID: 8SqTy1o2Tbqj4CmGOqvKZA==
X-CSE-MsgGUID: nA0NSdPlQniEZ8hnbC1QzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25121742"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25121742"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:11 -0700
X-CSE-ConnectionGUID: VcLtcD+0RqmMCcNcKmNZqw==
X-CSE-MsgGUID: DcRteGU6QZawraTKdVXidw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19615814"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.212.102.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 05/12] lib/igt_drm_fdinfo: Detect invalid drm-client-id
Date: Fri,  5 Apr 2024 01:00:49 -0500
Message-ID: <20240405060056.59379-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405060056.59379-1-lucas.demarchi@intel.com>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
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

Use strtol() for string to long conversion which allows us to detect if
there was an invalid number. It also has the advantage that it already
ignores leading spaces.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index de1962efa..8eb5e5eed 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -216,6 +216,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 		uint64_t val = 0;
 		size_t keylen;
 		const char *v;
+		char *end_ptr;
 		int idx;
 
 		_buf = NULL;
@@ -229,11 +230,9 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 			}
 		}  else if (strstartswith(l, "drm-client-id:", &keylen)) {
 			v = l + keylen;
-			v = ignore_space(v);
-			if (*v) {
-				info->id = atol(v);
+			info->id = strtol(v, &end_ptr, 10);
+			if (end_ptr != v)
 				good++;
-			}
 		} else if (strstartswith(l, "drm-pdev:", &keylen)) {
 			v = l + keylen;
 			v = ignore_space(v);
-- 
2.44.0

