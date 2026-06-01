Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92F0CD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 05:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B66B112D8D;
	Mon,  1 Jun 2026 05:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DkIXYkIK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E23112D8D
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 05:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780290654; x=1811826654;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LM/cqqUhdzLcMs2SdFlRKnVWh9Nf1oZ0HT9ny2alYz4=;
 b=DkIXYkIKhTQy5Z07gD4mnnI/z+fBDHIDbrLdyh5kG+yf/S1QInbk32kp
 pqn5Jzap+Nw8B2dwgzApyuPNfWw6fT/GYDBieMcJthYVlEK+d+eUI5avM
 czvO5PSg/JxIusImbHLjiBn0qIdlCsCUjcP+uyCB/UeWYEIwczmzVxLhd
 xBtyFsASiYtNkrnmdLXgXSuqAEI9G4XpNZRXWKy3IgcT8jq1BaKlDA86V
 sik+axxTGqcGVX5cC5AfZcaUpIt2wDTemynVHjW3KkRPasYhYmuXkod8K
 MDRWynCbEkWDAXAwlIJx9s4fU57p2KroMk92L4ShgRHVCJLSyj10sYUJV g==;
X-CSE-ConnectionGUID: LmREG3GaRSS+MtX1VfN8wg==
X-CSE-MsgGUID: iwwUdepMT7KR0QlwR8zKHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="81152332"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="81152332"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 22:10:53 -0700
X-CSE-ConnectionGUID: CB5TRx9gR3agUBYq7c54RA==
X-CSE-MsgGUID: Mpvf1Fl+TOGbUfJh4db5Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="243557124"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.64])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 22:10:52 -0700
Date: Mon, 1 Jun 2026 07:10:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "Karas, Krzysztof" <krzysztof.karas@intel.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [i-g-t,v2,2/4] runner: Create attachments directory to use by
 hooks
Message-ID: <45iqipqqozr3srmeo7pnx6y45stks5j6jmieirh6kekb36q5qy@e3nxs5ym7bkf>
References: <20260423105514.175870-8-zbigniew.kempczynski@intel.com>
 <5612e3f14e3a04d4da07716e5fda8bb757bc725d.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5612e3f14e3a04d4da07716e5fda8bb757bc725d.camel@intel.com>
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

On Tue, May 26, 2026 at 03:40:15PM +0200, Knop, Ryszard wrote:
> Two minor nitpicks, but other than that:
> 
> Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
> 
> On Thu, 2026-04-23 at 12:55 +0200, Zbigniew Kempczyński wrote:
> > Results parsing is currently limited to few predefined files.
> > 
> > Create "attachments" directory and export full path of created directory
> > to be used within hooks. From now on environment variable
> > IGT_RUNNER_ATTACHMENTS_DIR become visible when igt_runner is used
> > to execute tests. This env contains directory where subtests/dynsubtests
> > may write auxiliary files which filenames will be included in results.json.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> > ---
> >  lib/igt_hook.c    |  4 +++
> >  runner/executor.c | 76 +++++++++++++++++++++++++++++++++++++++--------
> >  runner/executor.h |  2 ++
> >  3 files changed, 70 insertions(+), 12 deletions(-)
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
> > index 1485b59d1f..a8907c575a 100644
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
> > @@ -1948,19 +1955,66 @@ static int remove_file(int dirfd, const char *name)
> >  	return unlinkat(dirfd, name, 0) && errno != ENOENT;
> >  }
> >  
> > -static bool clear_test_result_directory(int dirfd)
> > +static int ftw_attachment_removal(const char *fpath, const struct stat *sb,
> > +				  int typeflag, struct FTW *ftwbuf)
> >  {
> > -	int i;
> > +	(void)sb;
> > +	(void)ftwbuf;
> > +
> > +	switch (typeflag) {
> > +	case FTW_F:
> > +	case FTW_SL:
> 
> Since FTW_PHYS is set in nftw, FTW_SLN can happen and is missing here.
> IMO it's just the same unlink.

I think it's the opposite, man says:

"fpath is a symbolic link pointing to a nonexistent file.  (This occurs only if FTW_PHYS is not set.)

> 
> > +		if (unlink(fpath)) {
> > +			errf("Error removing file %s: %s\n",
> > +			     fpath, strerror(errno));
> > +			return -1;
> > +		}
> > +		break;
> > +	case FTW_DP:
> > +		if (rmdir(fpath)) {
> > +			errf("Error removing directory %s: %s\n",
> > +			     fpath, strerror(errno));
> > +			return -1;
> > +		}
> > +		break;
> > +	default:
> > +		errf("Cannot remove %s (unsupported file type)\n", fpath);
> > +		return -1;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static bool clear_test_result_directory(const char *name)
> > +{
> > +	char *attdirname;
> > +	int i, resdirfd;
> > +	int ret;
> > +
> > +	if ((resdirfd = open(name, O_DIRECTORY | O_RDONLY)) < 0)
> > +		return false;
> >  
> >  	for (i = 0; i < _F_LAST; i++) {
> > -		if (remove_file(dirfd, filenames[i])) {
> > +		if (remove_file(resdirfd, filenames[i])) {
> >  			errf("Error deleting %s from test result directory: %m\n",
> >  			     filenames[i]);
> > +			close(resdirfd);
> >  			return false;
> >  		}
> >  	}
> >  
> > -	return true;
> > +	close(resdirfd);
> > +
> > +	if (strlen(name) + strlen(DIR_ATTACHMENTS) + 1 >= PATH_MAX) {
> > +		errf("Attachments directory length exceeds PATH_MAX\n");
> > +		return false;
> > +	}
> > +
> > +	asprintf(&attdirname, "%s/%s", name, DIR_ATTACHMENTS);
> > +	ret = nftw(attdirname, ftw_attachment_removal, 4, FTW_PHYS | FTW_DEPTH);
> > +	free(attdirname);
> > +
> > +	return ret ? false : true;
> >  }
> >  
> >  static bool clear_old_results(char *path)
> > @@ -1991,19 +2045,17 @@ static bool clear_old_results(char *path)
> >  	}
> >  
> >  	for (i = 0; true; i++) {
> > -		int resdirfd;
> > +		struct stat st;
> >  
> > -		snprintf(name, sizeof(name), "%zd", i);
> > -		if ((resdirfd = openat(dirfd, name, O_DIRECTORY | O_RDONLY)) < 0)
> > +		snprintf(name, sizeof(name), "%s/%zd", path, i);
> > +		if (stat(name, &st))
> >  			break;
> >  
> > -		if (!clear_test_result_directory(resdirfd)) {
> > -			close(resdirfd);
> > +		if (!clear_test_result_directory(name)) {
> >  			close(dirfd);
> >  			return false;
> >  		}
> > -		close(resdirfd);
> > -		if (unlinkat(dirfd, name, AT_REMOVEDIR)) {
> > +		if (rmdir(name)) {
> >  			errf("Warning: Result directory %s contains extra files\n",
> >  			     name);
> >  		}
> 
> I'm not sure how much we care about extra files left in the dir, or if
> it'd be better to just nuke the whole resdir with a single tree walk.
> (The proposed code is fine, it's just a lot of code.)

I assumed we clear everything within attachments dir, but if sth is
wrong with privileges, etc and file removal is not possible then
clear_test_result_directory() fails. I think in normal circumstances
we have files which we can remove and opposite situation is not expected
and I think runner should just report an error in this case.

BTW thanks for the review.

--
Zbigniew

> 
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
