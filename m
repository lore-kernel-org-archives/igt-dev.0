Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9652CD72A14
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 20:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2960D10E365;
	Fri, 29 Nov 2024 20:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HmWCGwFS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8224410E591
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 20:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732913166; x=1764449166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Iv1gYzcmOaPW1QSuGjR0H+Hj+6O3085j6dE7kWKVpOI=;
 b=HmWCGwFSQ+7XT4pXXpcYv+BvKfnmiKmOB9sSECM1/v0GEWnx6IOeYeDa
 yDCavnURbZnoIM3V/VpWt9dIPc1RlaiX3CXBRrUr9FVma3DubC7/G0vsJ
 t6JhME6AH+3/d5IFLYoukiSKSLWRL1UAz6GjmU/phUTiFv1ZwEfTPqz67
 MOrElf3A+ludfwBJM8xUiBSe2oFMO7eG2lJwJ0yi33jmrD/fi3zmf6dBf
 GIY7c4Azawl5vowm3XNFdeTjS0YsdRlLG7PDzF854F8xbzKQ7zaLYAxWu
 wy9nqeps325sJE00/AdveGRC/LNirXZPbTR+5jL9GpBAnI901Qv+gZI5j Q==;
X-CSE-ConnectionGUID: OLyczy4rR/mJkFB/v9rHgA==
X-CSE-MsgGUID: 3/XfDUiiSw61iQ3A0Z/+IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33284316"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="33284316"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 12:46:06 -0800
X-CSE-ConnectionGUID: 2j0cNIauQv+UB/HD9QxVWg==
X-CSE-MsgGUID: H9i1NEMCToeCl9SlAWE2YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="123519914"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.213])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 12:46:04 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>, Ryszard Knop <rk@dragonic.eu>
Subject: [PATCH i-g-t v3 2/3] runner/executor: Fix error handling at
 terminating test
Date: Fri, 29 Nov 2024 21:45:49 +0100
Message-ID: <20241129204550.116355-3-kamil.konieczny@linux.intel.com>
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

Instead of just returning and leaking memory and file descriptors
inform user about an error which occurred and terminate
gracefully.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Ryszard Knop <rk@dragonic.eu>
---
 runner/executor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 16b12ba16..82e5ca5eb 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1510,8 +1510,12 @@ static int monitor_output(pid_t child,
 			}
 
 			killed = next_kill_signal(killed);
-			if (!kill_child(killed, child))
-				return -1;
+			if (!kill_child(killed, child)) {
+				errf("Error at terminating test with %s, errno=%d\n",
+				     killed == SIGQUIT ? "SIGQUIT" : "SIGKILL", errno);
+				killed = -1;
+				break; /* while */
+			}
 			time_killed = time_now;
 		}
 	}
-- 
2.47.1

