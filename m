Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5422E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C8C10E77F;
	Tue,  7 Jan 2025 20:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEdPrQLh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA2710E77F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736280489; x=1767816489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iXIuZ9Ay8cXWGniJanYg55vh5z/aoooWmLhKwVOoj6o=;
 b=bEdPrQLhn3FPdNBufCj09UXOhAvZK82MVCSXXO0iKI2xLWu9iXIf4cgM
 xuKdBaviVhCbzW047tLYn5By2NZdaWE7O9YcYJj6EodQVhHA9X+O1gDah
 k5eglOqKFtoFQzKE2aK17w4T4jUZUHfRUJ0wUnxVhQiNvt8I3GxHKgXos
 gHcjrJoUw4WGX7ak2F0LYsVpbZ5vU3bVNqyy32Ho7lNJYeuP2sQPnWAWZ
 QBfsSMftEFWqNMbRJWjwA53wuunPY3dZkMOWq7OMDxMRmdtTMr9s7swLM
 ne998RO4KgpAF5eaMm/XoSffFy7dWykIjeRGGwdB5PkcbtiFYD3/LOkCp A==;
X-CSE-ConnectionGUID: oVoH+5LcREujCKJ+wHbzZw==
X-CSE-MsgGUID: XuW4eFQgTJWxMDXhLfsSHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36367058"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36367058"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:08:09 -0800
X-CSE-ConnectionGUID: B4fTvcZWTaOtWXpa9VcXNQ==
X-CSE-MsgGUID: bzqK6JbeRuW7jdBUP2vJQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="102688346"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 12:08:06 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 2/5] runner/settings: Constify absolute_path parameter
Date: Wed,  8 Jan 2025 01:36:11 +0530
Message-ID: <20250107200614.963199-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
References: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
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

Modified absolute_path to use const char* for input, updating the
corresponding declaration. This ensures the input path remains
unmodified, enhancing code safety and clarity.

v2: Update commit subject.  (kmail)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 runner/settings.c | 2 +-
 runner/settings.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index 92fd42ea6..bea0c3059 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -567,7 +567,7 @@ static char *_basename(const char *path)
 	return tmpname;
 }
 
-char *absolute_path(char *path)
+char *absolute_path(const char *path)
 {
 	char *result = NULL;
 	char *base, *dir;
diff --git a/runner/settings.h b/runner/settings.h
index f69f09778..7e6cd11e2 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -136,7 +136,7 @@ bool parse_options(int argc, char **argv,
 bool validate_settings(struct settings *settings);
 
 /* TODO: Better place for this */
-char *absolute_path(char *path);
+char *absolute_path(const char *path);
 
 /**
  * serialize_settings:
-- 
2.43.0

