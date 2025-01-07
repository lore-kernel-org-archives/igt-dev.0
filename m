Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF926E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662C110E78C;
	Tue,  7 Jan 2025 20:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JN5IIA5f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEE310E78C
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736280492; x=1767816492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mbR0RXEKxvcIpuKeDzRZ3gzsBxUBu8dz2yr0s7NVQ28=;
 b=JN5IIA5fqwdxYpVMPZcEd+6wKI4+gvBjcvF4OpurllKemg5lnqoou8cO
 +oRdFGH51gmXbbZE8nRYwRqMZKQmrdm1fHXBVNem+LMwml63Mnu6FrCf6
 gDGC9t6E+5DJOpC8WgphiNcYlKPcJ+0hfv9VF2clubmGFCfq1Z707lZCr
 IHSQII7bk4aNX+cNW/AIqbL7HrAOCBAuw/EREjf0ILvMRuaaKBAWdn2J5
 vOd5WRD2vuWP/HETHXQI+UkICG1y0/4NC7rwDF8ycy2Gg3q8183KQe37X
 xpu2+SJquHiiCtP/hJHL07o1CWDBe0Fw45hn79mqKjPyAqcULgVoKhgHs g==;
X-CSE-ConnectionGUID: ls3x75tcQky6/bQBFJ8XBQ==
X-CSE-MsgGUID: oxZSYxhoT4eRanNwCMlS+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36367060"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36367060"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:08:10 -0800
X-CSE-ConnectionGUID: uwVAkCaDRtadb52Pu0mGGA==
X-CSE-MsgGUID: WyWHF3cRSLyDaQKlD4WKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="102688355"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 12:08:08 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 3/5] runner/settings: Add function to set
 IGT_RUNNER_DATA environment variable
Date: Wed,  8 Jan 2025 01:36:12 +0530
Message-ID: <20250107200614.963199-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
References: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
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

Introduced set_runner_datadir() to set the IGT_RUNNER_DATA environment
variable. This function uses absolute_path() to convert the relative
path "../share/igt-gpu-tools" to an absolute path. Update the
runner/runner code to call set_runner_datadir() and handle errors
appropriately.

v2: Fix review comments. (Kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 runner/runner.c   | 8 ++++++++
 runner/settings.c | 9 +++++++++
 runner/settings.h | 1 +
 3 files changed, 18 insertions(+)

diff --git a/runner/runner.c b/runner/runner.c
index 4855ad641..950eb5662 100644
--- a/runner/runner.c
+++ b/runner/runner.c
@@ -12,8 +12,13 @@ int main(int argc, char **argv)
 	struct job_list job_list;
 	struct execute_state state;
 	int exitcode = 0;
+	int data_flag = 0;
 
 	init_settings(&settings);
+	data_flag = set_runner_datadir();
+	if (data_flag)
+		fprintf(stderr, "Data dir path not set\n");
+
 	init_job_list(&job_list);
 
 	if (!parse_options(argc, argv, &settings)) {
@@ -49,6 +54,9 @@ int main(int argc, char **argv)
 		exitcode = 1;
 	}
 
+	if (!data_flag)
+		unsetenv("IGT_RUNNER_DATA");
+
 	printf("Done.\n");
 	return exitcode;
 }
diff --git a/runner/settings.c b/runner/settings.c
index bea0c3059..c8220be32 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -589,6 +589,15 @@ char *absolute_path(const char *path)
 	return result;
 }
 
+int set_runner_datadir(void)
+{
+	const char *datapath = "../share/igt-gpu-tools";
+	char *abpath;
+
+	abpath = absolute_path(datapath);
+	return setenv("IGT_RUNNER_DATA", abpath, 1);
+}
+
 static char *bin_path(char *fname)
 {
 	char *path, *p;
diff --git a/runner/settings.h b/runner/settings.h
index 7e6cd11e2..5926817b6 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -150,5 +150,6 @@ bool serialize_settings(struct settings *settings);
 
 bool read_settings_from_file(struct settings *settings, FILE* f);
 bool read_settings_from_dir(struct settings *settings, int dirfd);
+int set_runner_datadir(void);
 
 #endif
-- 
2.43.0

