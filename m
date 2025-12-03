Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1E3D1266D
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6E010E792;
	Wed,  3 Dec 2025 09:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+IDhfyK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E72010E792
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764752501; x=1796288501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NCRiEARWMl5JDgebzyvb3y8UX1vj6f6zW+g8GAocLao=;
 b=Y+IDhfyKSkGVxIc486PHg+A2V3GoVva8ks8KLcDjx9JyCfZ3kSJx3Z0f
 ea86AgqM7NVvBtXZoYgqMbbdB+6l7hlb3MlRI5yMwJiiQhEXqwdAZQBWp
 mDsXbj/9Mcp7Idwbke9CMOte7nWlZ7GQvKpKA5WU+wxixIgAzByPxkA7t
 nrsXelVmb4tSbjAA5Ij6u3jaYVF5dtahfAAAXcurEig4of1C8oAwhzrzd
 sdRjTBrFAd151RkL7cDSz7H+OejYmb6RILwlWUcOO1x0U1QL63iEp3YqX
 bbZzA5JTPafkXohsW229FdUjBjFwvICTcRPxjpdefYc2Ou+Xt2HTu8dLo Q==;
X-CSE-ConnectionGUID: OFjKndvhRJ2NA/V0efB9Rg==
X-CSE-MsgGUID: Ghe9ZcZZR0uIzo9sF2sWSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77848152"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="77848152"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:01:41 -0800
X-CSE-ConnectionGUID: 7h1gdxzgTk6WcC0tDFKuJg==
X-CSE-MsgGUID: numro9FxSWWBQiVBlEOOFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="195410001"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 01:01:38 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/kms_frontbuffer_tracking: Add HDR
 feature support
Date: Wed,  3 Dec 2025 14:38:35 +0530
Message-Id: <20251203090836.1164827-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251203090836.1164827-1-swati2.sharma@intel.com>
References: <20251203090836.1164827-1-swati2.sharma@intel.com>
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

Add FEATURE_HDR and extend feature_str() to cover all feature mask
combinations.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 35 ++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 0f162d9a5..eda97f7df 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -855,8 +855,9 @@ struct test_mode {
 		FEATURE_FBC   = 1,
 		FEATURE_PSR   = 2,
 		FEATURE_DRRS  = 4,
-		FEATURE_COUNT = 8,
-		FEATURE_DEFAULT = 8,
+		FEATURE_HDR   = 8,
+		FEATURE_COUNT = 16,
+		FEATURE_DEFAULT = 16,
 	} feature;
 
 	/* Possible pixel formats. We just use FORMAT_DEFAULT for most tests and
@@ -3987,12 +3988,36 @@ static const char *feature_str(int feature)
 		return "fbc";
 	case FEATURE_PSR:
 		return "psr";
-	case FEATURE_FBC | FEATURE_PSR:
-		return "fbcpsr";
 	case FEATURE_DRRS:
 		return "drrs";
+	case FEATURE_HDR:
+		return "hdr";
+	case FEATURE_FBC | FEATURE_PSR:
+		return "fbcpsr";
 	case FEATURE_FBC | FEATURE_DRRS:
-		return "fbcdrrs";
+	        return "fbcdrrs";
+	case FEATURE_FBC | FEATURE_HDR:
+	        return "fbchdr";
+
+	case FEATURE_PSR | FEATURE_DRRS:
+		return "psrdrrs";
+	case FEATURE_PSR | FEATURE_HDR:
+	        return "hdrpsr";
+	case FEATURE_DRRS | FEATURE_HDR:
+	        return "hdrdrrs";
+
+	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS:
+		return "fbcpsrdrrs";
+	case FEATURE_FBC | FEATURE_PSR | FEATURE_HDR:
+		return "hdrfbcpsr";
+	case FEATURE_FBC | FEATURE_DRRS | FEATURE_HDR:
+		return "hdrfbcdrrs";
+	case FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
+		return "hdrpsrdrrs";
+
+	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
+		return "hdrfbcpsrdrrs";
+
 	default:
 		igt_assert(false);
 	}
-- 
2.25.1

