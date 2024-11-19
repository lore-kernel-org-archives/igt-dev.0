Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406B1D4920E
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40D110E5B3;
	Tue, 19 Nov 2024 05:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKR5Uelh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A10C10E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994824; x=1763530824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kPQq6st9qwqph0vVBxE3yJrFUdvlgxh2MOvB9ZjdqWo=;
 b=NKR5UelhXxLlfdbhpKlQYgV6O3GT5luc2euNJPIN1hAy1gyb3cE7d1j0
 9FdWrlwVhVDck4Hcy7QTpa1sPbRgWM1ycJh0RiBeaENCU3Wy/tlzlFmdp
 UJkeXusgq+YzsbnVYWjmFMC8MAAA9a3H0FgPJ+5HTFql2D0KuqUSqKUaE
 JNljho9nIMtiE0iv/DStblGX8oYQCgEGIcucgB/Xbg95DiJJMHUBJinDZ
 K3euH3rNb2kgyjoWGEw+AdJzKpBHYvK4sFeLrVp35a0mwir6g8XsC6MC7
 NmemfHnp88qkDaeQbolo7Oviq7ZlyO8cJf3mly7UPeNUxy4UyXzKYOrX4 g==;
X-CSE-ConnectionGUID: i7IZnknNTPe3Wgu9l7jsTQ==
X-CSE-MsgGUID: eqyfBzx3QI6XXN00yecvoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19588151"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="19588151"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
X-CSE-ConnectionGUID: P+IrTvUyRLm0/cgppwrgUg==
X-CSE-MsgGUID: WGdxDx2IRACjiob+vhx3CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89222405"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Clint Taylor <Clinton.A.Taylor@intel.com>
Subject: [CI 1/9] lib/igt_kmod: Remove unused module_ref
Date: Mon, 18 Nov 2024 21:40:00 -0800
Message-ID: <20241119054008.2001984-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

This is unused since commit 03706cd84099 ("lib/igt_kmod: remove the
conditional audio removal code"). Nuke it.

Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 87036d06c..dc6b11c87 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -593,14 +593,6 @@ static int igt_always_unload_audio_driver(char **who)
 	return 0;
 }
 
-struct module_ref {
-	char *name;
-	unsigned long mem;
-	unsigned int ref_count;
-	unsigned int num_required;
-	unsigned int *required_by;
-};
-
 int igt_audio_driver_unload(char **who)
 {
 	/*
-- 
2.47.0

