Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1D7C98304
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 03:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CC010E02D;
	Thu, 24 Sep 2026 03:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wk1vfBmI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D165910E02D
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 03:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790222147; x=1821758147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=paDTfzx3oev9ygvJ5qsRqEdJ4/SJrTyiXJLYbRCZSMA=;
 b=Wk1vfBmIj6q0kqn/PR14PC9DBzHatFTYF2AwpueHvc6UgMNjmh7tSSLJ
 9DISUq3BXnOd1m/lpxVqkNhnM5hXdBzP4VvBr/aN/IdUIj++4bkOg4brm
 F8sj4VZXcGubaR46mM8g/Dm7ZTUDZb4ZIjqYsO+5Rkw9vzNf+HgYqvMRJ
 S9xXoBk2sjN3OGcq5na6iozP7WxeKhqvuY4wVo/H5NmJ7peQiinHzxwrG
 bAkPatbp/k5ERbe7C37xSYEVAkOTsMdrlcW2SeCrxj/d7oSjE52A1awtP
 mhhy7hJNX1EwXY+xao1OpVIUQr9QHOpyJJZCwsWQDZiEFkFClFBefEilS A==;
X-CSE-ConnectionGUID: ihVtG3FJSweTlLteI+ZT7Q==
X-CSE-MsgGUID: Qf8KoG25R4SAgHAzoQ+iLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101639487"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="101639487"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 20:55:47 -0700
X-CSE-ConnectionGUID: KwWmMjvLRZm+35w85onvvw==
X-CSE-MsgGUID: qQK/4ervT82FrssGpM10gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="270399269"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 20:55:47 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, matthew.d.roper@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 ravi.kumar.vodapalli@intel.com, stuart.summers@intel.com
Subject: [PATCH i-g-t v13 1/4] lib/igt_core: add igt_destructor helper macro
Date: Wed, 23 Sep 2026 20:55:37 -0700
Message-ID: <20260924035545.710985-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924035545.710985-1-x.wang@intel.com>
References: <20260924035545.710985-1-x.wang@intel.com>
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

Add igt_destructor alongside igt_constructor to make it easy to run
library teardown code when the binary unloads/exits.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/igt_core.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index c0908a8edb..c2565729b9 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -524,6 +524,18 @@ void igt_simple_init_parse_opts(int *argc, char **argv,
 	__attribute__((constructor)) \
 	static void igt_unique(__igt_constructor_l)(void)
 
+/**
+ * igt_destructor:
+ *
+ * Convenience macro to run the provided code block when igt is exiting,
+ * after all tests have been run. This should be used for parts of the igt
+ * library that require de-initialization of objects with global context.
+ * This code block will be executed exactly once.
+ */
+#define igt_destructor \
+	__attribute__((destructor)) \
+	static void igt_unique(__igt_destructor_l)(void)
+
 __noreturn __attribute__((format(printf, 1, 2)))
 void igt_skip(const char *f, ...);
 __noreturn __attribute__((format(printf, 5, 6)))
-- 
2.43.0

