Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DC5C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 10:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DDF10E8FF;
	Thu, 10 Apr 2025 10:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjBPKxWa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8142010E8FF
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 10:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744279549; x=1775815549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C27hF9oaFk5Qf5ZQVSNxYj0QX337sU9Bfk5vT9mppTY=;
 b=kjBPKxWajyl3835fRTAWzdi9cpmYz69FT53fjUpgFH5DfYUsHHMeiCEU
 iXpR1sSQQ1C2hL5FeErHIsW4+/ISAp8J3d/d/1DiOnS0ZDBHqX6U8CTMe
 PE6CMktSKuOLK/oc6BTyQJYbV8iCqnFXCfN6l9ma2JFgOvUB7hZHi3+Z+
 XaJwC4Nh50bh91jb9xLNJzljGWqZFtE3iDHxUpWIorOAeqW8R3ktMcJAa
 rN7OPlGug1phgYCMEaw18gjxYvd0Vgvq6Kml//00woTOmy3cIT81+21WC
 xnCfm0PXyjrsX9JSj+4A8gHS7GLRmntXEXVwKrMp095jMnuYAkhDMU2NI Q==;
X-CSE-ConnectionGUID: OGeuW1MBT6uAQ4RwJmN24w==
X-CSE-MsgGUID: HUGHKk10R/C3lavitOfXtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44929864"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="44929864"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 03:05:48 -0700
X-CSE-ConnectionGUID: 6dV7B9XbQTSVMYG8iFtuEQ==
X-CSE-MsgGUID: MqEV0anuQH6d4G4A3APsFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="128780926"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 03:05:47 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v2 1/1] runner/executor: sync outputs after tests end
Date: Thu, 10 Apr 2025 12:05:37 +0200
Message-ID: <20250410100537.61489-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410100537.61489-1-kamil.konieczny@linux.intel.com>
References: <20250410100537.61489-1-kamil.konieczny@linux.intel.com>
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

In CI runs there are sometimes tests reported as incomplete
after a crash and there are more such incompletes before a one
that caused actual crash. It turns out that there were missing
ends of tests dmesg logs gathered in a test subdirectory. After
cross checks with a global dmesg log saved outside of igt_runner,
it seems that all tests before crushed one properly reported its
end to kernel kmsg.

  Try to remediate this and create additional syncs for logs just
after end of execution, with additional syncs for directories.

v2: applied r-b, added missing static keyword, re-worded
  desciption (Kamil)

Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
---
 runner/executor.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index 30e2420af..41f521e56 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -615,6 +615,16 @@ void close_outputs(int *fds)
 	}
 }
 
+static void fsync_outputs(int *fds)
+{
+	int i;
+
+	for (i = 0; i < _F_LAST; i++) {
+		if (fds[i] >= 0)
+			fsync(fds[i]);
+	}
+}
+
 const char *get_out_filename(int fid)
 {
 	if (fid >= 0 && fid < _F_LAST)
@@ -1871,14 +1881,19 @@ static int execute_next_entry(struct execute_state *state,
 out_kmsgfd:
 	close(kmsgfd);
 out_pipe:
-	close_outputs(outputs);
 	close(outpipe[0]);
 	close(outpipe[1]);
 	close(errpipe[0]);
 	close(errpipe[1]);
+	if (settings->sync)
+		fsync_outputs(outputs);
 	close_outputs(outputs);
 out_dirfd:
+	if (settings->sync)
+		fsync(dirfd);
 	close(dirfd);
+	if (settings->sync)
+		fsync(resdirfd);
 
 	return result;
 }
-- 
2.49.0

