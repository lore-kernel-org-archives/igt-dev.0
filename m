Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69695C2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 19:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F35C10E958;
	Thu, 15 May 2025 19:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmP1JWlz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5965210E958
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 19:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747338776; x=1778874776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hiIvm2ag6oJ1331AsLhwW8eS2dZDhMg4F5QxTYq0VoU=;
 b=NmP1JWlzk6oPXICQ1t6wF/64RM7E9cmdjuDItSLYGf0dvgwyE+UIzSyj
 v4MdOdOkgcZc9acQ8PjFut+EFgxZJgXIJ9eoYVq4rTWL0JThMVRkrkU3F
 l5t+YVLbUVlH995VDU2dimH4XOMiPBySGkRFiwH/mQzJmsYPWawXRj8Zr
 Eg5ORx/+IwS/eiHFYlqFzKFpSdM+U6igbjHuA36LfK2NuapRco9Xeypgn
 4HWapuGmZbu8oWCPFsIl/6OVXo9fm72vRjmGieIF7JL/FZ+ilXhGzqprD
 9Q7f7VtfuneXR3k08Sbj9sPC/0sYmNZXcJuNN0BT+oClxmyQ2ZKzbdHNi Q==;
X-CSE-ConnectionGUID: U3P7xKiGTtuV8cRhB3hjiA==
X-CSE-MsgGUID: l2j0jYMuSIeTW8QqQwQAiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49454482"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49454482"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 12:52:56 -0700
X-CSE-ConnectionGUID: 5uPihYv0TG+cdUGy2sndDw==
X-CSE-MsgGUID: wICVxH9oQlij9IHPJr/98Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138347387"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 15 May 2025 12:52:53 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH 10/14] lib/igt_core: Conditionally define __noreturn for
 non-Android platforms
Date: Thu, 15 May 2025 19:52:03 +0000
Message-ID: <20250515195207.106414-11-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
References: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
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

