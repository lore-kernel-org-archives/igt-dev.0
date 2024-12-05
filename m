Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EB4E77170
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 10:26:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C0910E5CB;
	Thu,  5 Dec 2024 10:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i82OpfW3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FC410E5C3
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 10:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733394385; x=1764930385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AzV+5bq9JdFWsnmoL3V+dv02hSUT7R4/qRYiZWdNg2Q=;
 b=i82OpfW3tzLEDL2BXNl8NY+5vetYIzKdaLQXaX2VauBXvgZux+q5rnTj
 mxy1r2tqNnUkfgKgNS6waRYZwKiddM7nAxB4kJ6sStYqDhAXGcoo0TC6z
 fqUdeXcijZLgkqljR3DgVVWv6Izu7M8MJiOPiQA3UzbtRkRkCldR9TXCO
 MSBYoa4w3ISCgrn8OByZ9hLkF0DrYVhPmDTehAKPLggoo/w9b5vmG3B2N
 AzZGEzdaIAaqJRPm1V/mTwu9wUfYbSOEg17PzAQ6QqFamcpEuwXWDD72j
 z2HFKVUSn1TwnabhMuKYct2NBy1qvwNKiipkfIfcJJueQkpZEOtOnThrs w==;
X-CSE-ConnectionGUID: Fjf1fBzjTFilEUj0ei2bOQ==
X-CSE-MsgGUID: 3hDKTt4bS5aMR/KOj0AVoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56178716"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="56178716"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 02:26:24 -0800
X-CSE-ConnectionGUID: /QZR14TXRcKpdKvSV0H5oA==
X-CSE-MsgGUID: j/nvPKOEQQGGahcLCSbmaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94889652"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.20])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 02:26:24 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 1/1] tests/intel/xe_eudebug_online: Fix
 run_online_client memory leak
Date: Thu,  5 Dec 2024 11:26:13 +0100
Message-Id: <20241205102613.13524-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205102613.13524-1-dominik.karol.piatkowski@intel.com>
References: <20241205102613.13524-1-dominik.karol.piatkowski@intel.com>
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
never freed. Fix it by adding missing intel_buf_destroy.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 750350556..bf53b44ce 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1132,6 +1132,8 @@ static void run_online_client(struct xe_eudebug_client *c)
 					   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
 					   2 * sizeof(*metadata));
 
+	intel_buf_destroy(buf);
+
 	xe_eudebug_client_close_driver(c, fd);
 }
 
-- 
2.34.1

