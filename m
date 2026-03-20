Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FA1109879A
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 15:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBE110E15F;
	Fri, 20 Mar 2026 15:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aX7QRYQT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D7A10E15F
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 15:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774019993; x=1805555993;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jGbNWB4jWNu3C5vxSeQ+Ai/15d8bCJs6aQ+k3/quVbQ=;
 b=aX7QRYQTNfD41OPV5p9Zht7RFWg0rMkbioUM8Je3kzxKAkNEQjXsB4LI
 2HyaknH37dKop3L4pL88TYTcRescYQALgotADol2jBNCcAt9MJq4GlnsF
 v4uigzC9nxom9zcaIrUACdXJ05CSGnnzHgWR/SmltjVl3PpFcTwCGHvii
 EdD6ploboSUObBnziaTOpir5P1bzkrAP+Vp7w5TwTpHnn0Tq8/NNYUm42
 Ek73Go1APTfwYeB1LpPUMDEUcdILRnhkr0Xo2tn2J2XPerL8bIJkqZDhG
 CwvE/U5139aEEy1p1su6y7RCdi3ptXTWPQ/D4g/J24aVrq6eatM1nVqrj Q==;
X-CSE-ConnectionGUID: 1V6nD49kSQ2hbWX+/+tJCg==
X-CSE-MsgGUID: nth+wBZST6yps/xPYxTmTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75017050"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75017050"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 08:19:53 -0700
X-CSE-ConnectionGUID: JxZ8ibgzSbCTaQ4Kjx4O2A==
X-CSE-MsgGUID: msDpOTdkSauORkxPBLdNTg==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 08:19:52 -0700
Date: Fri, 20 Mar 2026 16:19:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t 2/4] runner: Create attachments directory to use by
 hooks
Message-ID: <20260320151949.fsnygsxqwdbii4hp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20260319215124.2066611-6-zbigniew.kempczynski@intel.com>
 <20260319215124.2066611-8-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319215124.2066611-8-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2026-03-19 at 22:51:27 +0100, Zbigniew Kempczyński wrote:
> Results parsing is currently limited to few predefined files.
> 
> Create "attachments" directory and export full path of created directory
> to be used within hooks. From now on environment variable
> IGT_RUNNER_ATTACHMENTS_DIR become visible when igt_runner is used
> to execute tests. This env contains directory where subtests/dynsubtests
> may write auxiliary files which finally be included in results.json.
> 

Thank you for taking this, could you also add a link to GitLab issue?

> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  lib/igt_hook.c    |  4 ++++
>  runner/executor.c | 15 ++++++++++++++-
>  runner/executor.h |  2 ++
>  3 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_hook.c b/lib/igt_hook.c
> index f86ed56f72..57817bdc12 100644
> --- a/lib/igt_hook.c
> +++ b/lib/igt_hook.c
> @@ -518,5 +518,9 @@ available to the command:\n\
>  \n\
>  Note that %s can be passed multiple times. Each descriptor is evaluated in turn\n\
>  when matching events and running hook commands.\n\
> +\n\
> +When executed by the igt_runner environment IGT_RUNNER_ATTACHMENTS_DIR\n\
> +is passed additionally to the hook script. It contains directory where\n\
> +script may write additional attachments like guc logs, etc.\n\
>  ", option_name);
>  }
> diff --git a/runner/executor.c b/runner/executor.c
> index 885a38a99f..8954073c36 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1779,18 +1779,30 @@ static int execute_next_entry(struct execute_state *state,
>  	int errpipe[2] = { -1, -1 };
>  	int socket[2] = { -1, -1 };
>  	int outfd, errfd, socketfd;
> -	char name[32];
> +	char name[32], attname[32];
> +	char resdirname[PATH_MAX - 32];
> +	char attdirname[PATH_MAX];
>  	pid_t child;
>  	int result;
>  	size_t idx = state->next;
> +	DIR *currdir;
>  
>  	snprintf(name, sizeof(name), "%zd", idx);
> +	snprintf(attname, sizeof(attname), "%zd/%s", idx, DIR_ATTACHMENTS);
>  	mkdirat(resdirfd, name, 0777);
> +	mkdirat(resdirfd, attname, 0777);

This will also needs to be deleted when runner is called
with -o --overwrite option, currently this is done for
files dmesg.txt, err.txt, ... so the same deletion needs
to be done for 'attachents' folder and all files inside it.

>  	if ((ddirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
>  		errf("Error accessing individual test result directory\n");
>  		return -1;
>  	}
>  
> +	currdir = opendir(".");
> +	fchdir(ddirfd);
> +	getcwd(resdirname, sizeof(resdirname));
> +	fchdir(dirfd(currdir));
> +	closedir(currdir);

Can you avoid this chdir only for getting its path?

Regards,
Kamil

> +	snprintf(attdirname, sizeof(attdirname), "%s/%s", resdirname, DIR_ATTACHMENTS);
> +
>  	if (!open_output_files(ddirfd, outputs, true)) {
>  		errf("Error opening output files\n");
>  		result = -1;
> @@ -1870,6 +1882,7 @@ static int execute_next_entry(struct execute_state *state,
>  			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
>  		}
>  		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
> +		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
>  
>  		execute_test_process(outfd, errfd, socketfd, settings, entry);
>  		/* unreachable */
> diff --git a/runner/executor.h b/runner/executor.h
> index 3b1cabcf55..bc6ac80dc4 100644
> --- a/runner/executor.h
> +++ b/runner/executor.h
> @@ -25,6 +25,8 @@ enum {
>  	_F_LAST,
>  };
>  
> +#define DIR_ATTACHMENTS "attachments"
> +
>  bool open_output_files(int dirfd, int *fds, bool write);
>  bool open_output_files_rdonly(int dirfd, int *fds);
>  void close_outputs(int *fds);
> -- 
> 2.43.0
> 
