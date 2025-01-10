Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A079AE7719C
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 19:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587A910E523;
	Fri, 10 Jan 2025 19:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INmZcypp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E47F10E523
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 19:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736538356; x=1768074356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZV8MmKxyel1W1GJ54SbS27LiBmjHOV11Sb+WryW3bw0=;
 b=INmZcyppOHMg7IVymFSMBcaug5mUTI2gDWfFh9UCgw8p558aSsZLCJmY
 yV2gOu1g0UjJOwnnjloNEYfMjNMj/FtC2GFPd5BHrlwPO9QSSTtaTwC9c
 8/FqwryEY5dh8ldvDo/S1SmeBltkXtWRTAcWJ6AexUHd7vz0/seOkfNBL
 0Qjwd+etZLUjoD0Q1WG05fBL83zTs5GabRtLRdHlcVer4r7oYA1SWpgjq
 ToBQdAyUzXcG0VD6skQJ+QpetTwR5eAmmqdWgR7hDWHMvoVStOhlDS8vw
 2THUoKDDRQffy1NXH7YYmZTblCJN4vndlNR2OdI3moQpgH3158UiUQPyX g==;
X-CSE-ConnectionGUID: 9FiQo08KSNua91Fi1DfStw==
X-CSE-MsgGUID: TZ13f5zeS8+190KrBk9TTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47419799"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="47419799"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:45:55 -0800
X-CSE-ConnectionGUID: e4vX55M9QWKPyF2LxUozkw==
X-CSE-MsgGUID: 3X+oUd9TREin3Bw9IXQYFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="104334418"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:45:54 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 2/8] runner/settings: Constify absolute_path parameter
Date: Sat, 11 Jan 2025 01:20:54 +0530
Message-Id: <20250110195100.150301-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250110195100.150301-1-swati2.sharma@intel.com>
References: <20250110195100.150301-1-swati2.sharma@intel.com>
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

From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

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
2.25.1

