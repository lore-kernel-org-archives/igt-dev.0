Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4C8E7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 09:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CE710E391;
	Thu,  5 Dec 2024 09:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kydhh+OM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED1310E390
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 09:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733392615; x=1764928615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/fxOYTMwc9Rwdbk2UgRN2mLtwRcjvLQ5vuPAoorfNgY=;
 b=kydhh+OMhBEDWxLGMfr+9S0qiothJ8eZ+fA3RmRzumdLbMAmbyqwO9nV
 yoj114f+IzEbPjdYwLaKNf2ikInA5EXc/uf1+1fesauCC8RsUuQ5UHOSr
 PdsqDiD3yUfTEkOsiVofVj3oI7lxmgvaGERaAK9KPE+QaKupY9YxHkIjt
 Gzjwfl5JdEBx4JL9RI88mEYZD7naE812uAaA1nYp5c41TL3pNWmahMBWy
 IYQIjCxWMJtXE7cLPiZUVrNYYqANbKTH3zu+aGk4vifpQizz3jzA2RG+/
 LJx5O23SGUqrWqvU4ICwL7Hxb4tz+9sJpWWTDPh0+KLJYFKsai9061Iwx Q==;
X-CSE-ConnectionGUID: xEhtgviKR0KnBKesMj3CUw==
X-CSE-MsgGUID: X+44RenAS7mw+kc/HqhqCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33047169"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33047169"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:56:55 -0800
X-CSE-ConnectionGUID: rkEBXqQvQCiz6pGiG/vg3Q==
X-CSE-MsgGUID: 3TPXO7WESxyV1YVchtZpqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99088486"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.20])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:56:54 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_eudebug_online: Fix
 run_online_client memory leak
Date: Thu,  5 Dec 2024 10:56:39 +0100
Message-Id: <20241205095639.12418-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205095639.12418-1-dominik.karol.piatkowski@intel.com>
References: <20241205095639.12418-1-dominik.karol.piatkowski@intel.com>
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

In run_online_client, buf is created by create_uc_buf, that calls
intel_buf_create_full, that callocs and initializes it. This memory is
never freed. Fix it by adding missing free().

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 750350556..1c0f094aa 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1132,6 +1132,8 @@ static void run_online_client(struct xe_eudebug_client *c)
 					   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
 					   2 * sizeof(*metadata));
 
+	free(buf);
+
 	xe_eudebug_client_close_driver(c, fd);
 }
 
-- 
2.34.1

