Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC23BC5472D
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 06:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A2E10E4B2;
	Wed, 28 Aug 2024 06:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KquHqcAy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFE410E4B2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 06:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724827296; x=1756363296;
 h=message-id:date:mime-version:from:subject:to:cc:
 content-transfer-encoding;
 bh=5GBHz8zbKTKXoiRIGD3zHjogq3f7n26i0HmIQD4Rb6w=;
 b=KquHqcAyhuXTdKTkiv5B1btl7i8BnRWC24YaKAs7ff89MdpWTtDUZbn7
 uYQHjGGRlzVN0AVH0WCkD6ujxBAgzrFx/pM0AzzTXlX68+gr3EcST34vy
 uPQ5m3m7JVnQD4mlItoNmCjN1SjixOT7I3iHnmCxPnYKCWMN9m3KcAgGZ
 sENgDnTzW/ykL6eVnUOnJwLI/BkD6nH2Zdnt4oAaYRgNvXqTWQEG6voXA
 qqOCM1EGmwtRm/iTFgF06zRvu+LWzW47xkalogrF9pCs4cKiPuKF3aT3f
 UU1LRh+usUKRbSgxUgD9VVXDRJE1EPbOrXk8XxdlTeGEev1qCEMuljJFB A==;
X-CSE-ConnectionGUID: hpDuWWQOQvC/Z6IbRi+GcA==
X-CSE-MsgGUID: 9xuoBbfGTyycFoUoPFmXDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23205268"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="23205268"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 23:41:36 -0700
X-CSE-ConnectionGUID: L4zdHNEpRLqGClg6wRfXDA==
X-CSE-MsgGUID: QDrQ7DZNTc2H2NCXABKHjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="63635796"
Received: from dkrupnov-mobl3.ger.corp.intel.com (HELO [10.251.220.180])
 ([10.251.220.180])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 23:41:35 -0700
Message-ID: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
Date: Wed, 28 Aug 2024 08:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] runner/executor.c: Detect tests killed by a signal
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Petri Latvala <adrinael@adrinael.net>,
 kamil Konieczny <kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Make igt-runner aware about tests being killed by signals. Before this
patch, manually killing a test process would result in igt-runner silently
marking the test as incomplete.

Now igt-runner aborts the run verbosely. As an example the following is 
from results.json:
 This test caused an abort condition: Test terminated by a signal -9

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>
---
 runner/executor.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/runner/executor.c b/runner/executor.c
index ac73e1dde..208c2f7a6 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -960,6 +960,21 @@ static int monitor_output(pid_t child,
 
 		igt_gettime(&time_now);
 
+		if (waitpid(child, &status, WNOHANG) == child) {
+			if(WIFSIGNALED(status)) {
+				/* The test terminated by a signal */
+
+				aborting = true;
+				killed = -WTERMSIG(status);
+
+				sprintf(buf, "Test terminated by a signal %d\n", killed);
+				errf("%s", buf);
+				*abortreason = strdup(buf);
+
+				break;
+			}
+		}
+
 		/* TODO: Refactor these handlers to their own functions */
 		if (outfd >= 0 && FD_ISSET(outfd, &set)) {
 			char *newline;
-- 
2.34.1

