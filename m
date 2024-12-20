Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FD6E7718B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 19:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63C910E4DD;
	Fri, 20 Dec 2024 19:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhBNuYE+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB4510E4C0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 19:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734721497; x=1766257497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UsnAoFKQ6rN9eVvywUehhjNfG8GXmQAq699yNvOdTHw=;
 b=EhBNuYE+8R83FaXnakq6zcZ9xGSOc0Olxjza9nOTJDhLMf/aJQyyd8V6
 olA09HZZSziUSep2uhEVcfM1WvvOI5I8CwwCu7BztqLMQfWyf6IVm4CuT
 oJjmMB3byAEdwHzLLN6pV40YcFXonwgEkZhF7XP4lQo9QR6chMOGl+E6e
 UtpqUGSlvllxXfqk7mgS6LapWHZel3j/ToYOfhQdpclHEIn719hLdNRYe
 vGJFuhhlGh8JWjnf8TlCSIKcpyi8n6JtP1WPdqyl5WqhmxDyu84Qzufp3
 n9NW6NRqfZvvRufpvdZhSNkwuAkdHwd4LxmipPFR5oLWPTETg+My8LjwH A==;
X-CSE-ConnectionGUID: 62OJIKPdQ0OgY0PpPlJd6g==
X-CSE-MsgGUID: n5ZaGlNLRyyH4vAQbbU24A==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34993403"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="34993403"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:04:56 -0800
X-CSE-ConnectionGUID: WDFrUocHQBq+SFhqVuMFsg==
X-CSE-MsgGUID: 8t2TZjL7SEO/sLLReguO+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98360080"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:04:56 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 2/3] lib/igt_kmod: Drop errno checking from
 igt_kmod_unbind
Date: Fri, 20 Dec 2024 11:04:39 -0800
Message-ID: <20241220190440.2543689-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220190440.2543689-1-daniele.ceraolospurio@intel.com>
References: <20241220190440.2543689-1-daniele.ceraolospurio@intel.com>
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

Other checks already cover the special cases, so there is no need to
check errno directly. This fixes an issue where errno is already set
before entering the functions and triggers the assert.

Fixes: cb008246b0c7 ("lib/igt_kmod: Rewrite xe unload logic")
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d73cb4101..95c5b79cc 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -686,11 +686,8 @@ int igt_kmod_unbind(const char *mod_name)
 		igt_assert(ret);
 
 		close(devfd);
-		errno = 0;
 	}
 
-	igt_assert_eq(errno, 0);
-
 	return 0;
 }
 
-- 
2.43.0

