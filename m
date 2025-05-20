Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4A4C54E92
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 19:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DC310E5C7;
	Tue, 20 May 2025 19:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HN95Pa8M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973F210E5AF
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 19:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747768187; x=1779304187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wi+WGHEsDQ0FP6mzMxwRth9jQXk/bs5idLbs8dXNHfk=;
 b=HN95Pa8MVjOTgFqRllOkHdKZzU6VTY3mVOTgrez9U0mWNQY8VIKGAuGo
 ErLDAZSUcYQGDt3b8R0jj1RtcFv4DDMvzAvTOjJWYvPS+zaEMSsjbmm72
 pYmBYrSRMnTKF0hi0ARmZWXXTFqq+cVZfBK4RcQEVSiRmN/zjnqDMP3Zr
 PGErYYe/EDd7uIWL5vWyfSMNtDFu432ePMM/Duro6s3Tvj3wmg0XSYAYv
 WetWtRmTDFgYKhNrneaOvKMaDguYSOexIVWWYcMu2069vjwnJr9/wvquC
 L7TjbPtRxRFAYJDTMvrzlXXqvAr78O+uhhI396vBp0XbUuZOuSw7dd7VX g==;
X-CSE-ConnectionGUID: 61ycCMjqSOquoIbvLssabA==
X-CSE-MsgGUID: MUJCakdlRYCPk01hBBl47Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49420893"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49420893"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:09:46 -0700
X-CSE-ConnectionGUID: w46RwTayT8eGHQZLIRI19A==
X-CSE-MsgGUID: erPtOHGpS0aqXF9oi7fPng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144524884"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:09:43 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 2/5] runner/settings: Constify absolute_path parameter
Date: Wed, 21 May 2025 00:39:08 +0530
Message-ID: <20250520190911.1727232-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520190911.1727232-1-ramanaidu.naladala@intel.com>
References: <20250520190911.1727232-1-ramanaidu.naladala@intel.com>
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
index 1d34c5bfe..1ccf345d9 100644
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
index 1f0b85318..30743fc40 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -142,7 +142,7 @@ bool parse_options(int argc, char **argv,
 bool validate_settings(struct settings *settings);
 
 /* TODO: Better place for this */
-char *absolute_path(char *path);
+char *absolute_path(const char *path);
 
 /**
  * serialize_settings:
-- 
2.43.0

