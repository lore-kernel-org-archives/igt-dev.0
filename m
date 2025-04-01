Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1416C36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 15:30:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6955F10E5EA;
	Tue,  1 Apr 2025 15:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dn4gVKjI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FF110E5EA
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743521441; x=1775057441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qdRKEsbJnJD8MhvhSjYpnUM+RviK4EJgQV6K6/h0VhI=;
 b=Dn4gVKjI85nzdvN3Ex+4kMftm2E78HDveINHCvxW7G1yUac89fxSIYSi
 umiKQHw7aD7576SwUn0bw+7Fh1l/f8DXqCxe+rJsfP+O2qO9WAGVW+Jis
 ognsdywEqJXfFIkihvAvlsUCj/RH0W4P6EOhqJN6gDJ6DCpeAMGo+7vbk
 OrcxCqTN6MDy8YBCiy3xXaQOwsPmwOMCU6sPxQWoGsZb9xyIAT6SayGf/
 IqXRx3qXrXz7+gz64v2imiwn/s0r3jcDbGLpB+rwQ0MUTih29f4/gI/NK
 EOqX6bO4Q2KgoeTDdlZtVhEbNU//OppYHMihWz6bevHwrDoU3j9zQAE95 w==;
X-CSE-ConnectionGUID: Tsv5swXHRP+kDBJ0d3w8bw==
X-CSE-MsgGUID: cN6RmDPkQeac+keU9W5hmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44735482"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44735482"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:30:41 -0700
X-CSE-ConnectionGUID: 5ji6GZmwTSC1p2xPuiYHzg==
X-CSE-MsgGUID: Mm6QmZ00S9GhS50SiU2Njg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126941859"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.116])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:30:39 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t v3 2/2] CONTRIBUTING: Add guide about igt libraries
Date: Tue,  1 Apr 2025 17:30:25 +0200
Message-ID: <20250401153025.48366-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401153025.48366-1-kamil.konieczny@linux.intel.com>
References: <20250401153025.48366-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add some general guide about adding new library function and
a few guides for their usage outside of tests.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
---
 CONTRIBUTING.md | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 2927e0ca1..4ffd9a0a4 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -38,6 +38,34 @@ The Code
 
 [igt-describe]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
 
+IGT libraries
+-------------
+- Tests and benchmarks are the main usage of IGT libraries, so they
+  could use test specific macros/functions, for example igt_assert,
+  igt_require, igt_skip, igt_info or igt_debug.
+
+- New library function could be written when it will have at least two
+  different users, for example if it could be used by two or more tests.
+  In some cases single user can be accepted, when it is very likely it
+  will be used in future.
+
+- In a new library function():
+  if it uses some of the macros igt_assert/igt_require/igt_skip then
+  consider to write also __function() with the same functionality but
+  without them.
+
+- Libraries and igt_runner
+  Runner should not use lib functions. It is crucial for CI runs so using
+  libraries puts a risk of bringing changes meant for tests which in turn
+  could break runner.
+  Note: You will find places where igt_runner uses lib functions - this will
+  be on ToDo list to be fixed.
+
+- Libraries and tools/
+  Give some thought if you are planning to use IGT lib code in tools, some
+  IGT lib functions might not be appropriate in tools. For example, any
+  abnormal condition should be simply reported by printf or fprintf to
+  stdout/stderr and then tool should exit gracefully.
 
 Sending Patches
 ---------------
-- 
2.49.0

