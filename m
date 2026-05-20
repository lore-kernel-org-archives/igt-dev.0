Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7E0CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 15:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4930E10E40B;
	Wed, 20 May 2026 15:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hzD8XuTV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EB110E40B
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 15:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779292200; x=1810828200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7ajbN7mhVe3kfPFETLojQMfhHatWjmgXUfWYKWjMCoM=;
 b=hzD8XuTVXMSWiSqgKxFcW+GcOhXkQD3HlewcwPHjpwo2SLHwn3dfj70L
 Ht27EEIBT/VV4JaQ4tiA+z3NcH0DOM0+OG7hPQE64Z9WNrJH7Ofeba1ID
 5zfyPO1bExXkx7PmV5mkHbIXgO/GKmKvK8bnowirPMH4EcPk8dkzJY6YM
 JmC6HNPFlqY1QtPL9jeqKW+HzNBYJtibzPgy2atVh65LW2uX+7XEFCJgi
 MRegj+0/MogCLkWqpK5rJZxBUTGXVZA0NtnjZodic/QL84XYtFDISEQYV
 JuL87bTXuIlk2RtqW+YMZ9iKoi0JxixWOSftu9gmY0mQ/NcjfXuRsO+SO Q==;
X-CSE-ConnectionGUID: 6Sil2TuwSsatwxdniUTG+A==
X-CSE-MsgGUID: uh1DzeUxRwS75e9Ch2SnzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="105657016"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="105657016"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 08:49:59 -0700
X-CSE-ConnectionGUID: koRUVVYjT3qhLVVY+779cg==
X-CSE-MsgGUID: 5ddJaiBETzGCrRg3t1KaSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="237219147"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.126])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 08:49:58 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/4] lib/igt_core: Create message for runner with
 unlimiting dmesg size
Date: Wed, 20 May 2026 17:49:44 +0200
Message-ID: <20260520154947.116726-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
References: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
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

Create a way to communicate to runner that test or subtest want
to lift disk limit size collected in a run and delays size limit
fitting to results processing.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c | 31 +++++++++++++++++++++++++++++++
 lib/igt_core.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 72b7d3449..e0f6eb969 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3606,6 +3606,37 @@ void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex)
 	igt_kmsg(KMSG_INFO "%s%s\n", mark_ignore_dmesg, ignore_dmesg_regex);
 }
 
+/**
+ * igt_emit_ulimit_dmesg:
+ * @begin_size: size of a beginning part
+ * @end_size: size of an ending part
+ * @ignore_dmesg_regex: string regex
+ *
+ * Emits a string '[IGT] ulimit' in demsg for igt_runner to ignore dmesg disk
+ * size limit for one test. Later on results will filter out matched regex to
+ * reduce its size in report.json. If that will not be enough, results will
+ * further reduce it under a desired disk limit. Regex parameter should be a
+ * last one emited. User could use begin and end sizes to reduce it more for
+ * this particular test (zero means no reduction).
+ */
+void igt_emit_ulimit_dmesg(const size_t begin_size, const size_t end_size, const char *ignore_dmesg_regex)
+{
+	static const char ulimit[] = "ulimit"; /* [IGT] ulimit ... params */
+	GError *err = NULL;
+	GRegex *re;
+
+	re = g_regex_new(ignore_dmesg_regex, G_REGEX_OPTIMIZE, 0, &err);
+	if (err) {
+		igt_debug("regexp: '%s'\n", err->message);
+		g_error_free(err);
+		igt_assert_f(re, "Error in regexp\n");
+	}
+
+	g_regex_unref(re);
+	igt_kmsg(KMSG_INFO "%s size_start=%ld size_end=%ld regex: %s\n", ulimit,
+		 begin_size, end_size, ignore_dmesg_regex);
+}
+
 /**
  * @igt_measured_usleep: Helper to model accurate sleep time for tests
  * @usec: usec to sleep
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 9fe3997e7..d8e0249ee 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1643,6 +1643,7 @@ int igt_pci_system_reinit(void);
 void igt_pci_system_cleanup(void);
 
 void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
+void igt_emit_ulimit_dmesg(const size_t begin_size, const size_t end_size, const char *ignore_dmesg_regex);
 
 unsigned int igt_measured_usleep(unsigned int usec);
 
-- 
2.54.0

