Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850F8D72A14
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 20:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4DA10E591;
	Fri, 29 Nov 2024 20:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTq4OBq1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F46810E591
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 20:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732913170; x=1764449170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kj7RTyU1aAd5B/eM8KfASCt0eM2lgMJQDuDSFqt2TFU=;
 b=FTq4OBq1XIrIka0mjPYdCyiBb1f3BzhAQssSOlaYCxnKB/lKQi3aA6op
 Ja/cegbGoTVSi74I8nbUn4sKHlGH0i6EXu7EgKnz/qTqfJQMKVt6zBvJ9
 Yp4dE/ef0oTeoUsd4amDw+7WH5ybY46NetXadJDBqoLLZokzyLHTRa87c
 yWmuRWRCsZrt7e0Vkl2dX+Vudr7FkM7+v8ubODttd68iM6fUt1f0AWLW1
 Wk97FJGZjUKqW3J+v8ERB5t6WEqkZA0WbCqEj7SqU0sFXxyw+cxJGfG0t
 4fNwSrgCUHl+NhQWmcIYCJzmV8Ia16NEz6LKoVd9PNKqIKB5XsCXYStxo w==;
X-CSE-ConnectionGUID: YOOluDwIRQa8JdmNOWU2+Q==
X-CSE-MsgGUID: oqvAnvhMQtGh+tzOEcH9oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33284319"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="33284319"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 12:46:09 -0800
X-CSE-ConnectionGUID: L3CPkdQFRYycEi+ydGQyTA==
X-CSE-MsgGUID: 8d3NUua+Q26GsxGo0/d9HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="123519939"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.213])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 12:46:08 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>, Ryszard Knop <rk@dragonic.eu>
Subject: [PATCH i-g-t v3 3/3] runner/executor: Inform about terminating
Date: Fri, 29 Nov 2024 21:45:50 +0100
Message-ID: <20241129204550.116355-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241129204550.116355-1-kamil.konieczny@linux.intel.com>
References: <20241129204550.116355-1-kamil.konieczny@linux.intel.com>
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

Create a message before terminating a running test and
inform user what is a cause.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Ryszard Knop <rk@dragonic.eu>
---
 runner/executor.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index 82e5ca5eb..49ae8c90d 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1336,8 +1336,12 @@ static int monitor_output(pid_t child,
 
 				aborting = true;
 				killed = SIGQUIT;
-				if (!kill_child(killed, child))
+				if (!kill_child(killed, child)) {
+					errf("Error terminating child with %s, errno=%d\n",
+					     killed == SIGQUIT ? "SIGQUIT" : "SIGKILL", errno);
+
 					return -1;
+				}
 				time_killed = time_now;
 
 				continue;
-- 
2.47.1

