Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEEBFED3DF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 15:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E8410F5EE;
	Fri, 24 Apr 2026 15:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFcQL2NJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335A710F5EE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 15:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777043648; x=1808579648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w+cLmYaOXe/4GetWL4Om3jt53SUQFy6i1csKyMOVMz8=;
 b=lFcQL2NJEJrSXhh4BI9IlpLi/fiN1QNtXUNGax7ZRyJlNuJ1NVz8o3eS
 oVazuZICYqyzS54KJRn9rMnMIVRvTJqwmXFG3pZCpW5ygJduZNTp75Da3
 YbckGDUzaNKeNpU2+rbQ73qjxWPSje+1w6oLgEl495DEAtqVibdK9Uh3U
 NDB5SX831YBAfiBinwfPgqvhiWZmuN0SfRsPlOVTlD4tB7Lye6fUbjlWg
 w8V+6Nqq5M+AeS6rXIkt7vDUWkm/7F6LSSGGydJiI3oHfkRFaxwgBUPXH
 9KWhP0We6woJE1+ZOGOm6MtLPD3IlCl1USLoMm8ticnmoQ+dv7zkJFrXr g==;
X-CSE-ConnectionGUID: WusgxEr2RPGWzwcHqBbmdQ==
X-CSE-MsgGUID: VFyn/dNaTNGQmi1dvCZTZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="77728782"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="77728782"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 08:14:08 -0700
X-CSE-ConnectionGUID: 9XfAqhL+T5enybZEd72gHA==
X-CSE-MsgGUID: Dxh8dDbpRe+iWIr+X0FduQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="233271558"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.100])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 08:14:06 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jing-Ping Jan <jingpingjan@google.com>
Subject: [PATCH i-g-t 1/3] Revert "tests/kms: correct index validation logic"
Date: Fri, 24 Apr 2026 17:13:53 +0200
Message-ID: <20260424151355.129423-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260424151355.129423-1-kamil.konieczny@linux.intel.com>
References: <20260424151355.129423-1-kamil.konieczny@linux.intel.com>
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

This reverts commit 4963e78e038806cc75f885d7d5713bb0d12c01d1.

It turns out asserts were correct, there was missing swap
which will be corrected in following commit.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jing-Ping Jan <jingpingjan@google.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 38c28f45f..2d758b63c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2981,8 +2981,8 @@ void igt_display_reset_outputs(igt_display_t *display)
 				igt_swap(*old_primary, *new_primary);
 				igt_swap(old_primary->index, new_primary->index);
 
-				igt_assert_eq(old_primary->index, 0);
-				igt_assert_neq(new_primary->index, 0);
+				igt_assert_neq(old_primary->index, 0);
+				igt_assert_eq(new_primary->index, 0);
 			} else {
 				igt_assert(old_primary == new_primary);
 
-- 
2.54.0

