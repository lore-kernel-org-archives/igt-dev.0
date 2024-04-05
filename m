Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBCECD11C2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 06:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8ED11393C;
	Fri,  5 Apr 2024 06:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgHzt751";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225C3113936
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 06:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296872; x=1743832872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UFfq/YBBgd0CG5/C5uGUor8YR/tPMrNeSr1G/PprlCQ=;
 b=JgHzt751R4Nusa2urZaPxA/kHmJlGrQ9wXhgBYZ83qzUYzCr4aOzB+B4
 dwLJPI3tXuv4Tb4We3P5QHqXTqQz7Zzj68aszzWiBNcxJOzphH9KzNGWS
 I9Z7m3/gV6Iu8MILMeEowUI1sUpB7zTaRdSzK8ePStYwfDahrrnRTGbwH
 uCgsKzvIab09hTC+cHIoU7RrWm0RKvPbngTljltL7r7IT/CdKKZDG1kZd
 H1wicx41yaN7BlrIVMQ4cgciv3bTYdGdU4HQcmoKLiSJr1yKarR86hmEP
 dQhF0FYJIM+AcXEsYi0vYD/7rMLU52fN4m3eQA47UCYdHxzuLyMtWCuvK g==;
X-CSE-ConnectionGUID: sTAIWA7gQBecy9n1ldddug==
X-CSE-MsgGUID: HWcI7YxaTRKj6mXWndKB8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25121744"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25121744"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:11 -0700
X-CSE-ConnectionGUID: 5dvVvkWyQOCqJK9w44Z/4Q==
X-CSE-MsgGUID: dHrfrKeQT1Kr8JozFCC5RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19615818"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.212.102.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:01:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 06/12] lib/igt_drm_fdinfo: Stop ignoring space where not
 needed
Date: Fri,  5 Apr 2024 01:00:50 -0500
Message-ID: <20240405060056.59379-7-lucas.demarchi@intel.com>
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

strto[ul]l() family of functions already ignore leading spaces. There's
no need to be explicit.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 8eb5e5eed..5f05f210e 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -103,10 +103,8 @@ static int parse_engine(const char *name, struct drm_client_fdinfo *info,
 		}
 	}
 
-	if (found >= 0) {
-		p = ignore_space(p);
+	if (found >= 0)
 		*val = strtoull(p, NULL, 10);
-	}
 
 	return found;
 }
@@ -159,7 +157,6 @@ static int parse_region(const char *name, struct drm_client_fdinfo *info,
 	if (found < 0)
 		goto out;
 
-	p = ignore_space(p);
 	*val = strtoull(p, NULL, 10);
 
 	p = strchr(p, ' ');
-- 
2.44.0

