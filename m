Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A059C3ABBF
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F261010E865;
	Wed,  7 May 2025 16:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fyNP5dCU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E4E10E865
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633894; x=1778169894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hiIvm2ag6oJ1331AsLhwW8eS2dZDhMg4F5QxTYq0VoU=;
 b=fyNP5dCUbPDBOnMsdyNr6JUL+ngI4cua/6EpICa/VUP54s41AEtEKckU
 PIp3QUo/GNFYHIRthRO3EazAbGOGCOiLJ2BLdWlJH/BLEQPlj962FdiM5
 mGPbgwOlqB/yltHKnAiILeVTxDRJkMd8/JXHIPCM1+AKPLN9lVxKDjPwe
 7MZF0++ItSXod0AQphDTHS9MkdYAWPkZvllsusNVTtAgLqzI8sFP1d+q+
 usbtyFOx/Bvc1YN9hkBuue9M6zvs9KcOJqJV33F22C0pMT+bDMK0jLxx0
 kNVIVUO0RUScsxBJIjEl+OWcKx+6g3X5kU0MBBWH848SBsl48MHNzBInZ g==;
X-CSE-ConnectionGUID: mkdWeRoDQWOdZADDLajAAA==
X-CSE-MsgGUID: 2z6H8GokRkO0Yjs4vu8cHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48519455"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48519455"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:04:00 -0700
X-CSE-ConnectionGUID: 4VlNlGXqS22DJahzEic+7Q==
X-CSE-MsgGUID: TiK3mwlVSqukvYY9DN+VSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173201131"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:03:58 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v4 10/15] lib/igt_core: Conditionally define __noreturn for
 non-Android platforms
Date: Wed,  7 May 2025 16:01:43 +0000
Message-ID: <20250507160148.53857-11-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
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

Ensure __noreturn is defined only if it is not already defined,
addressing compatibility with Android where __noreturn is predefined.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_core.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 45170e215..2db579423 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -86,7 +86,9 @@
 #define igt_assume(e) BUILD_BUG_ON_INVALID(e)
 #endif
 
+#ifndef __noreturn
 #define __noreturn __attribute__((noreturn))
+#endif
 #define __maybe_unused __attribute__((unused))
 
 extern const char* __igt_test_description __attribute__((weak));
-- 
2.34.1

