Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500EBFA0C2B
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 05:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73D110E05A;
	Wed, 15 Apr 2026 05:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONaeyED9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D02110E05A
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 05:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776231284; x=1807767284;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NGYOXIT9SL8SSQem5I7/GPaapCDLpDddtwjvf+jBbwc=;
 b=ONaeyED9qSU9v3bbTYMXOt8uW0GaknVKpz/nDw4u6Rb3JnHuGvFXcMvE
 IL44QDV8PYhPvBVa0UJcv5+00wcyyEKM9Ji5yw+meDabpb8TD5+f3nDsf
 8g9WLrO8boHVFmvxXOUZydzg231OgyeALGrwYQYs8npFBW2z49+DvlPEu
 Sgk2cNdtXbaDnliFRzyi0bpGA732XLmW4gzLhf/GOSeItClIp0UQ0R2EJ
 04Ki0SPGIvqWsfQkn++E0T7NP45YA002R+Xd1v/WWkGlhKLua102/NWYq
 8WDKjgdIL4d4/sTHeZPbyd58ufi+oxfomDfQuvJqPmW0rx2YdaBdOvqHZ A==;
X-CSE-ConnectionGUID: zckpbDiaTmu6wnUIiOTjMw==
X-CSE-MsgGUID: IJ5fS8SJQlWmVunN2CXoFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77076680"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77076680"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 22:34:44 -0700
X-CSE-ConnectionGUID: XVAXK3CCTpepYKuKQKPW4A==
X-CSE-MsgGUID: 3vuiyOErSq2yj7TB3NxFZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253516241"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.25])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 22:34:43 -0700
Date: Wed, 15 Apr 2026 07:34:40 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 2/5] runner: Create attachments directory to use
 by hooks
Message-ID: <k5tyhor5k6z4fr6z3l7kgruc4dwefgbuqu7vpisczqxgc7nhpy@5pvm2oxodcsy>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-9-zbigniew.kempczynski@intel.com>
 <87jyu9wde3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jyu9wde3.fsf@intel.com>
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

On Tue, Apr 14, 2026 at 04:27:48PM -0300, Gustavo Sousa wrote:
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
> > v3: unify 'attdir*' variables (Krzysztof)
> >     do recursive removal in attachments directories (Gustavo)
> > ---
> >  lib/igt_hook.c    |  4 +++
> >  runner/executor.c | 75 +++++++++++++++++++++++++++++++++++++++++++++--
> >  runner/executor.h |  2 ++
> >  3 files changed, 78 insertions(+), 3 deletions(-)
> >
> > diff --git a/lib/igt_hook.c b/lib/igt_hook.c
> > index f86ed56f72..b8f25b6c7a 100644
> > --- a/lib/igt_hook.c
> > +++ b/lib/igt_hook.c
> > @@ -518,5 +518,9 @@ available to the command:\n\
> >  \n\
> >  Note that %s can be passed multiple times. Each descriptor is evaluated in turn\n\
> >  when matching events and running hook commands.\n\
> > +\n\
> > +When executed by the igt_runner, environment IGT_RUNNER_ATTACHMENTS_DIR\n\
> > +is passed additionally to the hook script. It contains directory where\n\
> > +script may write additional attachments like guc logs, etc.\n\
> >  ", option_name);
> >  }
> > diff --git a/runner/executor.c b/runner/executor.c
> > index 1485b59d1f..af39b12aea 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -1,6 +1,7 @@
> >  #include <ctype.h>
> >  #include <errno.h>
> >  #include <fcntl.h>
> > +#include <ftw.h>
> >  #ifdef ANDROID
> >  #include "android/glib.h"
> >  #else
> > @@ -1779,17 +1780,22 @@ static int execute_next_entry(struct execute_state *state,
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
> > @@ -1870,6 +1876,7 @@ static int execute_next_entry(struct execute_state *state,
> >  			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
> >  		}
> >  		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
> > +		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
> >  
> >  		execute_test_process(outfd, errfd, socketfd, settings, entry);
> >  		/* unreachable */
> > @@ -1948,9 +1955,61 @@ static int remove_file(int dirfd, const char *name)
> >  	return unlinkat(dirfd, name, 0) && errno != ENOENT;
> >  }
> >  
> > +static int ftw_attachment_removal(const char *fpath, const struct stat *sb,
> > +				  int typeflag, struct FTW *ftwbuf)
> > +{
> > +	(void)sb;
> > +	(void)ftwbuf;
> 
> I was able to compile without warnings after dropping this.  Is there a
> reason to keep them here?

I'm trying to keep code I write clean according to warnings. We have
'-Wno-unused-parameter' in meson.build so above lines could be dropped.
But if someone will decide to clean the code I won't give him/her more
work. And imo this is in good taste to annotate unused arguments.

> 
> > +
> > +	if (typeflag == FTW_F) {
> > +		if (unlink(fpath)) {
> > +			errf("Cannot remove file %s\n", fpath);
> 
> Maybe append strerror(errno) to the message here?

Yes, why not.

> 
> > +			return -1;
> > +		}
> > +	} else if (typeflag == FTW_DP) {
> > +		if (rmdir(fpath)) {
> > +			errf("Cannot remove directory %s\n", fpath);
> 
> Ditto.
> 
> > +			return -1;
> > +		}
> > +	} else {
> > +		errf("Cannot remove %s (unsupported file type)\n", fpath);
> > +		return -1;
> 
> I think it would be sensible to drop symbolic links as well (I think it
> could be handled in the same brace for FTW_F.

I wondered about this, but I would be strict - only files and dirs
are allowed in the attachments directory. What for user/script would do
symbolic links there?

> 
> > +	}
> 
> I think this would look nicer if it was handled with a "switch"
> statement.

Agree, switch with default will look better in this case. I'll
replace if's to switch in v4.

> 
> > +
> > +	return 0;
> > +}
> > +
> > +static bool clear_attachments_dir_recursively(int attdirfd)
> > +{
> > +	char attdirname[PATH_MAX];
> > +	DIR *currdir;
> > +	int ret;
> > +
> > +	currdir = opendir(".");
> 
> Why do we need this call?

nftw() requires path, not fd so I have to ensure I leave working
directory intact when I quit the function. I don't know any method
apart of fchdir/getcwd() to get dirname I would like to pass to
nftw(). And I won't assume I know where's current working dir.

> 
> > +	fchdir(attdirfd);
> > +	getcwd(attdirname, sizeof(attdirname));
> > +
> > +	/* Sanity check we're in attachments directory structure */
> > +	if (!strstr(attdirname, DIR_ATTACHMENTS)) {
> > +		errf("Cowardly refusing removing in directory which is not "
> > +		     "attachments directory [currdir: %s]!\n", attdirname);
> > +		ret = -1;
> > +		goto out;
> > +	}
> 
> This function is static and only called for DIR_ATTACHMENTS.  I believe
> this check is unnecessary.

Assuming no bug is here you're right, but I would like to do double check
directory content I want to remove is really I expect to.

> 
> > +
> > +	ret = nftw(attdirname, ftw_attachment_removal, 4, FTW_PHYS | FTW_DEPTH);
> > +
> > +out:
> > +	fchdir(dirfd(currdir));
> > +	closedir(currdir);
> > +
> > +	return ret ? false : true;
> > +}
> > +
> >  static bool clear_test_result_directory(int dirfd)
> 
> I think we need to have the path to the test result dir passed as
> argument here so that we can build attdirname without having the change
> dir + get cwd dance.

I didn't want to rewrite clear_old_results() function. Current code
uses mostly fd's and only place where I really need path is nftw().
I will rewrite to passing paths if you insist but personally I wouldn't
do this.

> 
> >  {
> > -	int i;
> > +	int i, attdirfd;
> > +	int ret = true;
> 
> I guess we don't need this ret variable. If the removal of the
> attachments directory fails, we can just print an error message and
> return false.

Ok.

> 
> >  
> >  	for (i = 0; i < _F_LAST; i++) {
> >  		if (remove_file(dirfd, filenames[i])) {
> > @@ -1960,7 +2019,16 @@ static bool clear_test_result_directory(int dirfd)
> >  		}
> >  	}
> >  
> > -	return true;
> > +	if ((attdirfd = openat(dirfd, DIR_ATTACHMENTS, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
> > +		errf("Cannot open attachments directory\n");
> > +		return false;
> > +	}
> > +
> > +	ret = clear_attachments_dir_recursively(attdirfd);
> > +	if (!ret)
> > +		errf("Cannot clear attachments dir recursively\n");
> 
> Why not simply call nftw() directly from here? I don't see much value in
> having the function clear_attachments_dir_recursively().

I created a separate function because I like dividing logical tasks
to separate functions. I can unfold this function here if you think
this will be better.

--
Zbigniew

> 
> --
> Gustavo Sousa
> 
> > +
> > +	return ret;
> >  }
> >  
> >  static bool clear_old_results(char *path)
> > @@ -2002,6 +2070,7 @@ static bool clear_old_results(char *path)
> >  			close(dirfd);
> >  			return false;
> >  		}
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
