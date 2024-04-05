Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD405CD1284
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 06:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942AD113936;
	Fri,  5 Apr 2024 06:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhNy4WV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D5C113936
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 06:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296871; x=1743832871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MmUDdt4JDNo/hkWeEe4/FOVxusrycnzJHad+afb3TVY=;
 b=QhNy4WV0e4fqK7YYMIgZbl8OOZ5YZGi7EqGEydGJ66sQlhm7zBWaJO11
 fXE936iS+sn4Ea4R7Pjo7OQJ67UJp0KaNiT2K2OHzlkj6ArLah4m839b5
 OvFy8oY2cGTL1Z6AGv6M6BOisKvgJbzFO5TDXMhpRYWrX22b/bsXGYZRl
 oNhcXHyPoMykB9GxUt/HMxPq8GYH2I8YsVjtiBsqTK9yq1VP+I67hy9Bq
 t2eVdpYrAt8XZJSFtWiEr2LBB61oW1nq4JDVARvmJQK3HzdTvISRvl5g0
 6+JREgieSqZQQnnhFwNWTBDqGg8ZIhSk9SfBuTfMu+oKi1WflgnFjixgW w==;
X-CSE-ConnectionGUID: 05CCRr8STvuYCidz3Y4EHQ==
X-CSE-MsgGUID: QKwGrfPOQGGMvjZM/IU7Zw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25121737"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25121737"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:10 -0700
X-CSE-ConnectionGUID: FWUZYNgSTWOdxzoUtSunpg==
X-CSE-MsgGUID: cIso2NdYRd+9qw15LtrsVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19615807"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.212.102.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 03/12] lib/igt_drm_fdinfo: Fix wrong name len assert
Date: Fri,  5 Apr 2024 01:00:47 -0500
Message-ID: <20240405060056.59379-4-lucas.demarchi@intel.com>
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

When parsing engine name, at this point we have something like:

	"drm-engine-render:	232409619162 ns"
	            ^      ^
	            |      |
	          name     p

We are copying the engine name to the final destination, but
strlen(name) will actually contain the entire string. Since we already
know the name length, calculated previously, just use it for copying the
string.

Since each name is 256-bytes long, the assert doesn't trigger easily,
but it's better to be correct. And more efficient.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 7a9ae94f0..9b1776775 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -96,8 +96,9 @@ static int parse_engine(const char *name, struct drm_client_fdinfo *info,
 
 		if (found < 0) {
 			assert((info->num_engines + 1) < ARRAY_SIZE(info->names));
-			assert((strlen(name) + 1) < sizeof(info->names[0]));
-			strncpy(info->names[info->num_engines], name, name_len);
+			assert(name_len  < sizeof(info->names[0]));
+			memcpy(info->names[info->num_engines], name, name_len);
+			info->names[info->num_engines][name_len] = '\0';
 			found = info->num_engines;
 		}
 	}
-- 
2.44.0

