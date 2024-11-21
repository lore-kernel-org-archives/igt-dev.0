Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62C0D6ED33
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 13:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB7810E95D;
	Thu, 21 Nov 2024 13:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMol4vYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3F210E959
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732196477; x=1763732477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b60B3gHxihVD8aX7g1eMpM8NaI7oZn4MFYO0zs6ja3w=;
 b=iMol4vYq8QG4k5NryFiWllGyfFpKYoU7MAVQOYZt8MgFQphQ4vVj439V
 aoYuUYuldDhxxWpRCZidjW7p3WK/2itggVh9SSbynyA5AqpYTaxr+XO2Y
 vkj+TZha7la1lyVzp5y6iTS4UbpipW+kjEAod6JCc3teKsdxIpxW+5hNt
 TWrOTMLvxhWcE2RqT0TCHC5z8UIdxGFH+XS5VXgGrN4CPxHJ42saSMFKI
 zYfoXgelIQJyDT25vMCiu9soD97FjWzhUgvBe0Xf5C/hrdi/qKmP9nTUC
 1pDX1IOJ5fUrglhvuWeQOCIsKKhFY4Mts/7Z1SKHAb/lmIn9vI9yrp2ib g==;
X-CSE-ConnectionGUID: 0E/KBBvYTUWdv7vAWOMR5Q==
X-CSE-MsgGUID: Pbtg4ePYSBCDmF4eXOqAPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54809151"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="54809151"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 05:41:17 -0800
X-CSE-ConnectionGUID: eIgaQHA+TcShHghCOUaWUg==
X-CSE-MsgGUID: 08XZdeKkQHy+CMx0SanDQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="90192543"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 05:41:16 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 2/5] runner/settings: Update absolute_path function
 to accept const char* parameter
Date: Thu, 21 Nov 2024 19:09:55 +0530
Message-ID: <20241121133958.3382633-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241121133958.3382633-1-ramanaidu.naladala@intel.com>
References: <20241121133958.3382633-1-ramanaidu.naladala@intel.com>
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

