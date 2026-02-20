Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891ADC56205
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B58510E366;
	Fri, 20 Feb 2026 15:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQmV/O02";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEEB10E366
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771599714; x=1803135714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e4YIXrjHtYmh6vgZfZe0ZbPPn8bX1jhW38fzY4pST1w=;
 b=RQmV/O02l7TeZPiMNO2uBzKyF3i0EnchFe9tHiSIy9zk+6NiuntMfRhO
 /96i1LDS3qad8RVWD9YYIRDYwqRhT1B1EX8yZFOu/K6lnmXXy+7fgrW31
 NWrATHhWlV9rryQxQIKuBW9Ou1zzmPtSuexCPiXVyx0Dl02TYJ92mQViK
 ALJkiJ846Ocfs2MLjRPJS3ppVjyGyCPEMuFHtym376X/2NcOx3hZl76pw
 4tPffVoWQRMgIsSy8H14YMkyNSgqzmAuRlgl7zWPmr8Rc3WYjP4J9CVj0
 /SF7LjgM9gUvUpMkXIx4tiL+snk2IuHJkeRQ3i52GQVmYSTSTUex9cM3z A==;
X-CSE-ConnectionGUID: lgO6JbBDReOaxN5kXmGZXw==
X-CSE-MsgGUID: t+FrCDYNTgCTWUsIYD+/dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="60266688"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="60266688"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:54 -0800
X-CSE-ConnectionGUID: E1VLaMtPRLKRwzp9KnyzKg==
X-CSE-MsgGUID: 37LBSDB9QtqnIor2Kglrtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252558036"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.6])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:52 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1 4/6] docs/css/extra.css: make nav/toc initial max
 width
Date: Fri, 20 Feb 2026 16:01:58 +0100
Message-ID: <20260220150202.1013804-5-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220150202.1013804-1-pawel.sikora@intel.com>
References: <20260220150202.1013804-1-pawel.sikora@intel.com>
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

Due to the new API reference pages, some code examples
contained in function documentation comments are now
rendered side by side with the explanation. To improve
readability, the navigation needs to be moved to the left
side of the page, and the table of contents needs to be
moved from the center to the right side of the screen.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 docs/css/extra.css | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/css/extra.css b/docs/css/extra.css
index ff1b47cb8..094bdc443 100644
--- a/docs/css/extra.css
+++ b/docs/css/extra.css
@@ -321,3 +321,7 @@
     transition: none !important;
   }
 }
+
+.md-grid {
+  max-width: initial;
+}
-- 
2.51.0

