Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47C3C36005
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 21:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB9C10E5FE;
	Tue, 25 Mar 2025 21:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBV0WvxH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CD510E5FE
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 21:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742936531; x=1774472531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wi+WGHEsDQ0FP6mzMxwRth9jQXk/bs5idLbs8dXNHfk=;
 b=PBV0WvxH/DIDcizzLYJUSKfqtMkPqFcd/gXNZf7MfJDK44f438cKeQbu
 g4ovIUjgZPc5sCMFE7AWWkG5I9ah9aVvmFWjnld8YtXDqueCfwXXr7HhG
 yy9eYnkXafcXlTFppjG54h5f+EW/fwbdPzybGz7ERh79Nlvo8o+RFVxQe
 47PmaRHcf+l+9zgy4h8x9yOLCbzyESK7P5hc2Z0hO8MQ8Qq9H44R6lioh
 Mg+78meP2b1dOzYDU4RBrYuPBfpjoZIW++M3ROFfDVD9R8gfK4aSFvpiC
 l/4vLnx24lpaik84m4/OCxk7GXcq3ovf7oNaCwuRwJGPuLAbxXgSRNkAX Q==;
X-CSE-ConnectionGUID: 0uKsjH6qSRykWFIm2i6t6A==
X-CSE-MsgGUID: ljUy3mscTVqa96nMUdlndA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55584500"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="55584500"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 14:02:11 -0700
X-CSE-ConnectionGUID: 8lrsZ1nkRlCaxmut23Ubeg==
X-CSE-MsgGUID: 9Ybe9rlCROm82DTUKJ6i6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129164684"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 14:02:09 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 2/5] runner/settings: Constify absolute_path parameter
Date: Wed, 26 Mar 2025 02:31:43 +0530
Message-ID: <20250325210146.3338454-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325210146.3338454-1-ramanaidu.naladala@intel.com>
References: <20250325210146.3338454-1-ramanaidu.naladala@intel.com>
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

