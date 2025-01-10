Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5655BE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 19:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CC110E524;
	Fri, 10 Jan 2025 19:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2pvLEeS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0710310E524
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 19:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736538357; x=1768074357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=291czU+7Yrx6HUkZ7yIQ2QJd9BM4mnFfNueZOtyyxig=;
 b=d2pvLEeSQ4tm6IBTkhjNcVmO9biPU51xKZdhRgAH97A416EbzGyOoOpy
 bLp5e3rYxX+EHlpcoLcONisvDgoTb+6mmdsF0Qc4ecTMwKeT7E38QkBYI
 f1NiwUqyOIITizQwZ702BUxOk0PCialD9pZyPjB5HLnLz4r9/Bvns7FR2
 k6fZTGS2H+CflzTyEsoGoHLVrQ6Yg7x6Vcx6jnWjL2mB6Z4/79orZUa1C
 YHWHrCpjGXnqEQESZf3j6FhFRK2GPjQuWPx9gYOkWTaCn70BmFZjb/hwq
 6dJGIcDZWunrankbgDLEm1hc/N3VV1o5OInfEG7WWbKZuWbgGftDUCNjf w==;
X-CSE-ConnectionGUID: Pt8Nup5PQciwD2IuGJdf4g==
X-CSE-MsgGUID: gRwl82mhQrujhF31IUABrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47419802"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="47419802"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:45:57 -0800
X-CSE-ConnectionGUID: 49pQ6BJKSbeyOJ6OZUKOLw==
X-CSE-MsgGUID: HWuCxr2hSFqQzL+F3QDLHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="104334426"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:45:55 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 3/8] runner/settings: Add function to set
 IGT_RUNNER_DATA environment variable
Date: Sat, 11 Jan 2025 01:20:55 +0530
Message-Id: <20250110195100.150301-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250110195100.150301-1-swati2.sharma@intel.com>
References: <20250110195100.150301-1-swati2.sharma@intel.com>
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

From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

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
2.25.1

