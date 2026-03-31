Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85609109B492
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 16:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284D910E127;
	Tue, 31 Mar 2026 16:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2NJmjMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340B810E127
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 16:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774973136; x=1806509136;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OIcMvG2Ti/Q165A4zcx23EsUynAEodY3Ydu0tqFxLXQ=;
 b=K2NJmjMGLtNibCS01QOkhO+ai14LVmIWWojikkfKAfqLHN8+Yu9vbjob
 l87N+qoavWkmUtyhqibKP1G7uIlPzaV9PQt9FQLkvmInnXOnP6w22T4lA
 RL8LEsvivbhJJ1j8eI9ulU4M7eZf1rId1dQe5SGqJTt6WPpVIJFj9dfmL
 MbesKE33UpMZSv6fzN2XmujA9lpkkEg6Eo6GJh/SRJO+h1kSRREEoCNNQ
 Ih/Rxrok+lgMAvkqCQe8Auz2DjVNfxjW1AoaZixSYrXmci0LdHP6PbWx+
 TgTUcjsZX1Ai0v0tfA02Zbyqvm/+MEWN+GXHE7L7KjM5fw7/HHWwEQLIB Q==;
X-CSE-ConnectionGUID: a6vYS3ftQIWsVn/pEDYTAg==
X-CSE-MsgGUID: DzatPhG3RtmtCg8RXqYUCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75165080"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75165080"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:05:36 -0700
X-CSE-ConnectionGUID: JclBiD7sSBGQrddBVWV7AA==
X-CSE-MsgGUID: 2SDoxRuNQauUF43ZCqHayg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="230472162"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.212])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:05:34 -0700
Date: Tue, 31 Mar 2026 18:05:31 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v2 2/6] runner: Create attachments directory to use
 by hooks
Message-ID: <vol4afvr2gi2axnhfw5bducei2uqquz32gdmqzimnl2qhobtme@pvzjij6yz3ob>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <20260324131235.712916-10-zbigniew.kempczynski@intel.com>
 <87mrzpxutd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mrzpxutd.fsf@intel.com>
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

On Mon, Mar 30, 2026 at 11:20:46AM -0300, Gustavo Sousa wrote:
> Zbigniew Kempczyński <zbigniew.kempczynski@intel.com> writes:
> 
> > Results parsing is currently limited to few predefined files.
> >
> > Create "attachments" directory and export full path of created directory
> > to be used within hooks. From now on environment variable
> > IGT_RUNNER_ATTACHMENTS_DIR become visible when igt_runner is used
> > to execute tests. This env contains directory where subtests/dynsubtests
> > may write auxiliary files which finally be included in results.json.
> >
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > ---
> > v2: simplify attachment dirname concatenation (Kamil)
> >     remove files in attachments dir when overwrite is set (Kamil)
> > ---
> >  lib/igt_hook.c    |  4 ++++
> >  runner/executor.c | 44 +++++++++++++++++++++++++++++++++++++++++---
> >  runner/executor.h |  2 ++
> >  3 files changed, 47 insertions(+), 3 deletions(-)
> >
> > diff --git a/lib/igt_hook.c b/lib/igt_hook.c
> > index f86ed56f72..57817bdc12 100644
> > --- a/lib/igt_hook.c
> > +++ b/lib/igt_hook.c
> > @@ -518,5 +518,9 @@ available to the command:\n\
> >  \n\
> >  Note that %s can be passed multiple times. Each descriptor is evaluated in turn\n\
> >  when matching events and running hook commands.\n\
> > +\n\
> > +When executed by the igt_runner environment IGT_RUNNER_ATTACHMENTS_DIR\n\
> 
> Nitpick: s/igt_runner environment/igt_runner, environment/

Ack.

> 
> > +is passed additionally to the hook script. It contains directory where\n\
> > +script may write additional attachments like guc logs, etc.\n\
> 
> Looking at how this is implemented, the attachments directory is not a
> hook-specific thing, so I believe documentation for it would be better
> placed in igt_runner's help/docs.

That's true, I placed it here because --help-hook is first place where
I would look for environment vars I can use. What do you think to place
information about this variable in both places?

> 
> >  ", option_name);
> >  }
> > diff --git a/runner/executor.c b/runner/executor.c
> > index 1485b59d1f..bc421f7dbb 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -1779,17 +1779,22 @@ static int execute_next_entry(struct execute_state *state,
> >  	int errpipe[2] = { -1, -1 };
> >  	int socket[2] = { -1, -1 };
> >  	int outfd, errfd, socketfd;
> > -	char name[32];
> > +	char name[32], attname[32];
> > +	char attdirname[PATH_MAX];
> >  	pid_t child;
> >  	int result;
> >  	size_t idx = state->next;
> >  
> >  	snprintf(name, sizeof(name), "%zd", idx);
> > +	snprintf(attname, sizeof(attname), "%zd/%s", idx, DIR_ATTACHMENTS);
> >  	mkdirat(resdirfd, name, 0777);
> > +	mkdirat(resdirfd, attname, 0777);
> >  	if ((idirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
> >  		errf("Error accessing individual test result directory\n");
> >  		return -1;
> >  	}
> > +	snprintf(attdirname, sizeof(attdirname), "%s/%s",
> > +		 settings->results_path, attname);
> >  
> >  	if (!open_output_files(idirfd, outputs, true)) {
> >  		errf("Error opening output files\n");
> > @@ -1870,6 +1875,7 @@ static int execute_next_entry(struct execute_state *state,
> >  			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
> >  		}
> >  		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
> > +		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
> >  
> >  		execute_test_process(outfd, errfd, socketfd, settings, entry);
> >  		/* unreachable */
> > @@ -1950,7 +1956,10 @@ static int remove_file(int dirfd, const char *name)
> >  
> >  static bool clear_test_result_directory(int dirfd)
> >  {
> > -	int i;
> > +	DIR *dir;
> > +	struct dirent *entry;
> > +	int i, adirfd;
> > +	int ret = false;
> >  
> >  	for (i = 0; i < _F_LAST; i++) {
> >  		if (remove_file(dirfd, filenames[i])) {
> > @@ -1960,7 +1969,33 @@ static bool clear_test_result_directory(int dirfd)
> >  		}
> >  	}
> >  
> > -	return true;
> > +	if ((adirfd = openat(dirfd, DIR_ATTACHMENTS, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
> > +		errf("Cannot open attachments directory\n");
> > +		return false;
> > +	}
> > +
> > +	if ((dir = fdopendir(adirfd)) == NULL) {
> > +		errf("Cannot fdopen attachments directory\n");
> > +		goto out1;
> > +	}
> > +
> > +	while ((entry = readdir(dir)) != NULL) {
> > +		if (!strcmp(entry->d_name, ".") || !strcmp(entry->d_name, ".."))
> > +			continue;
> > +
> > +		if (unlinkat(adirfd, entry->d_name, 0))  {
> > +			errf("Error removing %s\n", entry->d_name);
> > +			goto out2;
> > +		}
> > +	}
> 
> Since we can't predict that the attachments directory will remain flat,
> I think it would be safer to do a recursive cleanup here.  I guess we
> could use nftw() in a post-order fashion here?

I wondered about recursive removal, what prevented me from doing this
was if there'll bug here I can remove too much. At the moment I guess
guc logs will be only user so I would try to stay in flatten structure.

--
Zbigniew

> 
> --
> Gustavo Sousa
> 
> > +
> > +	ret = true;
> > +out2:
> > +	closedir(dir);
> > +out1:
> > +	close(adirfd);
> > +
> > +	return ret;
> >  }
> >  
> >  static bool clear_old_results(char *path)
> > @@ -2002,6 +2037,9 @@ static bool clear_old_results(char *path)
> >  			close(dirfd);
> >  			return false;
> >  		}
> > +		if (unlinkat(resdirfd, DIR_ATTACHMENTS, AT_REMOVEDIR))
> > +			errf("Warning: Cannot remove attachments directory\n");
> > +
> >  		close(resdirfd);
> >  		if (unlinkat(dirfd, name, AT_REMOVEDIR)) {
> >  			errf("Warning: Result directory %s contains extra files\n",
> > diff --git a/runner/executor.h b/runner/executor.h
> > index 3b1cabcf55..bc6ac80dc4 100644
> > --- a/runner/executor.h
> > +++ b/runner/executor.h
> > @@ -25,6 +25,8 @@ enum {
> >  	_F_LAST,
> >  };
> >  
> > +#define DIR_ATTACHMENTS "attachments"
> > +
> >  bool open_output_files(int dirfd, int *fds, bool write);
> >  bool open_output_files_rdonly(int dirfd, int *fds);
> >  void close_outputs(int *fds);
> > -- 
> > 2.43.0
