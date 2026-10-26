Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1305606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 14:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q3zSBPJQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE6B10E03B;
	Mon, 26 Oct 2026 14:19:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B115F10E03B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 14:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793024275; x=1824560275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DsfyoV9D285kZU+6iMFTSmCWjW8ny5ljcw/wm6pohiE=;
 b=Q3zSBPJQttBX25JHxot/Vtd/sJ+goaEPDSol6MHrdxZyUCmjfuMleCZs
 7c8M7giWP/92yQwkOj6prDPQeJ16XZ94wWEM2tnAUHnUyvMdaOeuGcd73
 /FwZ7i5kiuX4S0bOYmer9m/te3IfMWJmy+msY0Qe06PBqIVCmwkmkx3p4
 z8YX+k64Ll/8oqxTStb0sboiRcAFQo/73OwIQkHH82Yt91kjdHBF0RkCv
 b3yvw8W5mH5T1yV5cpPHUmqCXoug0+WdvqIh1KzP62zLyc5Ii4MDbBJdJ
 7WHWBiJD5Z/ou+toiEA5J2gFoxk7DPagesej9ZiHOI0PDzEEBTR5XQ0NO Q==;
X-CSE-ConnectionGUID: Uw6oCY4lQ0KCbMaPhQ8wjg==
X-CSE-MsgGUID: bfuf/LXyS7CmtWDH+3T+eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1697976"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1697976"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:17:55 -0700
X-CSE-ConnectionGUID: 4A1JoJhZSQ+B3ZmOPQ2qAA==
X-CSE-MsgGUID: tM5zRTT/Qbi8WgRkfw2kaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4285925"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.96])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:17:54 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/2] runner/executor: Report command used for test
 exec
Date: Mon, 26 Oct 2026 15:17:02 +0100
Message-ID: <20261026141702.44811-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026141702.44811-1-kamil.konieczny@linux.intel.com>
References: <20261026141702.44811-1-kamil.konieczny@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add printing of command line used for executing a test, when
the log level is normal or above.

v2: move constructing exec command string to separate function
    (Gustavo)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index 5bd95b929..91ad05d58 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1626,6 +1626,49 @@ static void free_test_command(struct igt_vec *arg_vec)
 	igt_vec_fini(arg_vec);
 }
 
+static char *entry_exec_cmd(struct igt_vec *arg_vec)
+{
+	char *m, *n;
+	int mlen, s_len, vec_len;
+
+	mlen = 4096;
+	m = malloc(mlen);
+	if (!m)
+		return NULL;
+
+	vec_len = igt_vec_length(arg_vec);
+	s_len = 0;
+	for (size_t i = 0; i < vec_len; i++) {
+		int nlen;
+
+		n = *((char **)igt_vec_elem(arg_vec, i));
+		if (!n)
+			break;
+
+		nlen = strlen(n);
+		if (s_len + nlen + 2 > mlen) {
+			char *p;
+
+			mlen *= 2;
+			p = realloc(m, mlen);
+			if (!p)
+				break;
+
+			m = p;
+		}
+
+		if (i)
+			m[s_len++] = ' ';
+
+		memcpy(m + s_len, n, nlen);
+		s_len += nlen;
+	}
+
+	m[s_len++] = 0;
+
+	return m;
+}
+
 static void build_test_command(struct settings *settings,
 			       struct job_list_entry *entry,
 			       struct igt_vec *arg_vec)
@@ -1849,7 +1892,7 @@ static int execute_next_entry(struct execute_state *state,
 
 	if (settings->log_level >= LOG_LEVEL_NORMAL) {
 		char buf[100];
-		char *displayname;
+		char *displayname, *cmd;
 		int width = digits(total);
 		int len;
 
@@ -1864,6 +1907,11 @@ static int execute_next_entry(struct execute_state *state,
 		free(displayname);
 
 		outf("%s\n", buf);
+		cmd = entry_exec_cmd(&arg_vec);
+		if (cmd) {
+			outf("cmd: %s\n", cmd);
+			free(cmd);
+		}
 	}
 
 	/*
-- 
2.55.0

