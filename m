Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C87FD6004C
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 07:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F4D10E5DC;
	Tue, 19 Nov 2024 07:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFt62uCM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476A910E5DC
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 07:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732002858; x=1763538858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b60B3gHxihVD8aX7g1eMpM8NaI7oZn4MFYO0zs6ja3w=;
 b=eFt62uCMnIBIrWhP1Xlm5sp6TvCKBn9gnX6YaylNIcReWr40PcoXDGNW
 fIotJ+S4CzS45N6gfc1gejNon/0+7u96kMr8extKoPZpHkZy8TDEBxBZt
 nfkBih17iwagVJ8FnnZ3kjdU2CEfOLo8rC0jimozKUQx4mJ6aWHwsDZFs
 4QFQltnwE9kGnDBWrdRmMo8ku1EOZZzoNeSlFEY4RAiwA1lh8Jwi1fYYd
 H1YIvdqXNzhNJ2OeQ16STYr5gIvMjStLKT8oEkcpZT2xVd4OaqWxHcBm1
 0Y1AK1SpHDeirUH473ANYv36uhr9J08H0rNkr65nBa7+CERM3Nn3D6Jkg w==;
X-CSE-ConnectionGUID: cAQ0Gb/QRDSTpkRbhA0Klg==
X-CSE-MsgGUID: r5G74UKbTnqZWMsU0poOxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32136136"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32136136"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 23:54:17 -0800
X-CSE-ConnectionGUID: RXgDcr9BRVKjDfE6XF4yvA==
X-CSE-MsgGUID: Hdof4wxCQ5G9ZIWeqUzjvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="90278710"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 23:54:15 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH 2/5] runner/settings: Update absolute_path function to accept
 const char* parameter
Date: Tue, 19 Nov 2024 13:22:56 +0530
Message-ID: <20241119075259.3048734-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119075259.3048734-1-ramanaidu.naladala@intel.com>
References: <20241119075259.3048734-1-ramanaidu.naladala@intel.com>
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

Modified the absolute_path function in settings.c to take a
const char* parameter instead of char*. Updated the corresponding
declaration in settings.h.This change ensures that the input path
is not modified within the function, improving code safety and clarity.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 runner/settings.c | 2 +-
 runner/settings.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index 0d27e7af3..dd4b08dd7 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -565,7 +565,7 @@ static char *_basename(const char *path)
 	return tmpname;
 }
 
-char *absolute_path(char *path)
+char *absolute_path(const char *path)
 {
 	char *result = NULL;
 	char *base, *dir;
diff --git a/runner/settings.h b/runner/settings.h
index 8335f0b8c..6246d0c3d 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -135,7 +135,7 @@ bool parse_options(int argc, char **argv,
 bool validate_settings(struct settings *settings);
 
 /* TODO: Better place for this */
-char *absolute_path(char *path);
+char *absolute_path(const char *path);
 
 /**
  * serialize_settings:
-- 
2.43.0

