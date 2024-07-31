Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF06C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 03:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A8010E28B;
	Wed, 31 Jul 2024 03:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pxg5G59S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5C610E28B
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 03:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722396928; x=1753932928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vG0PnvlNjCdGipMmZFFqfZCQgIeMmBkpk0Y9YmxBsmk=;
 b=Pxg5G59SsFmKOpL6vZ+/PGjdIAEL1Byl8qju99dxlT5A7oACXMjKTb6e
 SCJIAjPfY6fMr5KhCk46U0V2opvOh0b56is6R3kZRQlgZFIxnSeNXobLo
 uzuolXhWAKlCHX+FJDJKLH/q65uqRCjvftVyyRUEr7vAuOpN6+he6t93P
 azzaVb+arEs0YvI8fpYIF9DGjokNsOrMrpnmkSJmqDCroxvOU8RAh7mee
 DoOEsY1ji6moJOpbM+MfXOl9JtInk6zsc5JGsNcvGcJ8i5kGK45AEto2r
 gaEUSkqcFlYWVgjgbL9pQt2CHj606na11Ru5JovdRhmnsWiVIeK5HJriL Q==;
X-CSE-ConnectionGUID: Z5RC6TOnQ+WqriazHKXCBQ==
X-CSE-MsgGUID: iQLDZPrBQWiO26Bl0yCueA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30917873"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="30917873"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 20:35:27 -0700
X-CSE-ConnectionGUID: M5XvoNsUTmGlA5197Ii0DA==
X-CSE-MsgGUID: dRegCVcbSrqfg1539pZw5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="54538335"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 20:35:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_drm_fdinfo: Improve fdinfo parse
 documentation
Date: Tue, 30 Jul 2024 20:35:02 -0700
Message-ID: <20240731033504.1426640-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731033504.1426640-1-lucas.demarchi@intel.com>
References: <20240731033504.1426640-1-lucas.demarchi@intel.com>
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

Be explicit on what we are parsing: key-values for the current process,
likely to be used by the same process causing workloads, or by
key-values for a random process, likely to be used when analyzing all
the clients.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
index 35f43305b..168b3c44c 100644
--- a/lib/igt_drm_fdinfo.h
+++ b/lib/igt_drm_fdinfo.h
@@ -74,7 +74,9 @@ struct drm_client_fdinfo {
 };
 
 /**
- * igt_parse_drm_fdinfo: Parses the drm fdinfo file
+ * igt_parse_drm_fdinfo: Parse the drm fdinfo file for this process
+ *
+ * Parse /proc/self/fdinfo/<drm_fd> collecting all key-values
  *
  * @drm_fd: DRM file descriptor
  * @info: Structure to populate with read data. Must be zeroed.
@@ -92,10 +94,12 @@ igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info,
 		     const char **region_map, unsigned int region_entries);
 
 /**
- * __igt_parse_drm_fdinfo: Parses the drm fdinfo file
+ * __igt_parse_drm_fdinfo: Parse the drm fdinfo file for a process
+ *
+ * Parse /proc/<pid>/fdinfo/<fd> collecting all key-values.
  *
- * @dir: File descriptor pointing to /proc/pid/fdinfo directory
- * @fd: String representation of the file descriptor number to parse.
+ * @dir: File descriptor pointing to /proc/<pid>/fdinfo directory
+ * @fd: String representation of the file descriptor number (<fd>) to parse.
  * @info: Structure to populate with read data. Must be zeroed.
  * @name_map: Optional array of strings representing engine names
  * @map_entries: Number of strings in the names array
-- 
2.43.0

