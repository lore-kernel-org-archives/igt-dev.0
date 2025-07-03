Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F06FC77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 07:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E821710E7DB;
	Thu,  3 Jul 2025 07:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zoe2WaWA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8467710E7DB
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 07:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751529223; x=1783065223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xw5ClqIm1QYP0byYTYPbqPrAMi5g3e4mi80Jdhfu/2I=;
 b=Zoe2WaWAAUSw+2xjqTjRW/mwyHBPaC91qW5Zg6N6v0eAzhBVqoYv/ROT
 DEDsNRL/vVO9MVyU2xdfELBPNhakiPNL5FXVxzDTl5GzEaCJw7GrYGse+
 IEeHhs5SsO2bxeCpV9VMp8PE5HviiUs6F+d9oKmE05TMCUrvV5R5J4HEi
 I63CrRpvUbasZaOmInsgtJTuYhYmGXKX1k6NS/Uy2X6ulXSiRVWo1YB+i
 Wl1UiBL6GLhLGsrhev9TdpDaPqhyCTLGhCAgDxXq2axuiMZ3DG0erF7Al
 0Ilxjf0ysFqxLtonIS2sd79LBQkcjavognN79yxj/Y0dBUGQEq44+OE3U w==;
X-CSE-ConnectionGUID: 1tnR2eNfTqCXe1cCJ2202g==
X-CSE-MsgGUID: LcyT9yY2TDOBNpTW84RRmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71279213"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="71279213"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:53:43 -0700
X-CSE-ConnectionGUID: s/pM/s2YQqWQQ6LCWbxh5w==
X-CSE-MsgGUID: z+5dz4lzSDGgSQ9lJjOmZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="153732174"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:53:42 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v7 2/4] runner/settings: Constify absolute_path parameter
Date: Thu,  3 Jul 2025 13:23:42 +0530
Message-ID: <20250703075344.95774-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703075344.95774-1-ramanaidu.naladala@intel.com>
References: <20250703075344.95774-1-ramanaidu.naladala@intel.com>
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

Make absolute_path a const char*, this ensures the input path
remains unmodified, enhancing code safety and clarity.

v2: Update commit subject.  (kamil)
v3: Update commit message.  (Kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/settings.c | 2 +-
 runner/settings.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index 4bd925934..3ccf71870 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -590,7 +590,7 @@ static char *_basename(const char *path)
 	return tmpname;
 }
 
-char *absolute_path(char *path)
+char *absolute_path(const char *path)
 {
 	char *result = NULL;
 	char *base, *dir;
diff --git a/runner/settings.h b/runner/settings.h
index ccdc7281b..6c58c3282 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -146,7 +146,7 @@ bool parse_options(int argc, char **argv,
 bool validate_settings(struct settings *settings);
 
 /* TODO: Better place for this */
-char *absolute_path(char *path);
+char *absolute_path(const char *path);
 
 /**
  * serialize_settings:
-- 
2.43.0

