Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC532C71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 21:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F9110E453;
	Mon, 16 Jun 2025 21:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkyfFnMs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC0A10E453
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750108157; x=1781644157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eX/mSy/JBwb3Nk95MKDwu00B5Ppv0Sa+PRkRWOsDs8k=;
 b=PkyfFnMsV6+p/SQ3d4OHkGj+e/F7/95ZpVFnu0n8KRHnFufob/2nsmrb
 nzS7gUGu3tftVBzoTTrkoUakii4Pb+AKAi/XSI49LBIZ3LmtcmSpDDomW
 1rdFkxcVIcedtWlhaPGRrYGr3ijvAMVfXHv7B9ndik+0wBJxru9rZ33HV
 dVpOBOFPC8htR3kG2/BpFp/rKAxflJCADPIa4mUzT/QXCJADVXQsC695o
 4+fMpT2TNWhZ6K6E4BN/Lz/Dz3h+NYkrsnOam/bkV64Sb4DT622ko6GwR
 A6505bhyhxC3lRQkFHqgl1B4pJkv5Sfa7mPtmH57jYNz1LzhYTJoSTuMW w==;
X-CSE-ConnectionGUID: yxa3deOkRAqJJkVP5UwoGg==
X-CSE-MsgGUID: Nm2YsOEkR4qHC0pX5weSFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52351459"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="52351459"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 14:09:17 -0700
X-CSE-ConnectionGUID: COhMfp3pRx+kju4AxOmxEw==
X-CSE-MsgGUID: kiFbiCBeQWSuyX3uFj3Qew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="153344548"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 14:09:15 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v6 2/5] runner/settings: Constify absolute_path parameter
Date: Tue, 17 Jun 2025 02:38:37 +0530
Message-ID: <20250616210840.3335978-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616210840.3335978-1-ramanaidu.naladala@intel.com>
References: <20250616210840.3335978-1-ramanaidu.naladala@intel.com>
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
index a7d5dbc97..b151218cc 100644
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

