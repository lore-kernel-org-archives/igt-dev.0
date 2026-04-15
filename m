Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3714FF43854
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 16:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2D910E181;
	Wed, 15 Apr 2026 16:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CS+l66zF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0FC10E181
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 16:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776271052; x=1807807052;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TXoJ7QsrmkIel60F4iqMpJarEzhDdk4wSxxRrAfiRBw=;
 b=CS+l66zFdiwtCqhvMTSijSUqSfTgNfmVfLkNGYPB/FbK+qDp/hI0++DT
 lQO3nBoK56QRorIkZYGwYZ9zsyfeT6qTuVwxr3xigE5p33y1BQHLhyyek
 GRFIDcJyVdPtm9WiVwkERv51uWhR2QOWvqOTkZm03zHPSHWkFNwSGZD3v
 wYez7II4hmZDEhoq5S42epdPnbgJZD0mp4qUed9EMfTP8rklqcpB0om3h
 inz0pXSHsKNs79UQavhifw8GAtMGzjDMw5F1sTJhiYmcPyOkdrM7dCNc/
 zDHz5evj/KT5HYPTBsuSxTcAHIS9aMmYyusqKochsG7gV5XvFSc3D8KKN g==;
X-CSE-ConnectionGUID: quUv5jXFRLebhrV/Gs+v6g==
X-CSE-MsgGUID: fcHbulpUSeiws1y72BwXyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76291301"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76291301"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:37:32 -0700
X-CSE-ConnectionGUID: rLnIVvxcQN+0jLMktIvadA==
X-CSE-MsgGUID: qSZa6PZVQJSAqrZnZ4MAJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="227300441"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.25])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:37:31 -0700
Date: Wed, 15 Apr 2026 18:37:28 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 2/5] runner: Create attachments directory to use
 by hooks
Message-ID: <camhvxi7igps4qhkjts3ngqydq3es2ds4iuttka2nm3gqj35eh@ttehveoegmlu>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-9-zbigniew.kempczynski@intel.com>
 <87jyu9wde3.fsf@intel.com>
 <k5tyhor5k6z4fr6z3l7kgruc4dwefgbuqu7vpisczqxgc7nhpy@5pvm2oxodcsy>
 <87bjfkz64r.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjfkz64r.fsf@intel.com>
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

I hope you don't mind I truncated thread to interesting part of our discussion:

On Wed, Apr 15, 2026 at 10:48:36AM -0300, Gustavo Sousa wrote:

<cut>

> >> 
> >> > +			return -1;
> >> > +		}
> >> > +	} else if (typeflag == FTW_DP) {
> >> > +		if (rmdir(fpath)) {
> >> > +			errf("Cannot remove directory %s\n", fpath);
> >> 
> >> Ditto.
> >> 
> >> > +			return -1;
> >> > +		}
> >> > +	} else {
> >> > +		errf("Cannot remove %s (unsupported file type)\n", fpath);
> >> > +		return -1;
> >> 
> >> I think it would be sensible to drop symbolic links as well (I think it
> >> could be handled in the same brace for FTW_F.
> >
> > I wondered about this, but I would be strict - only files and dirs
> > are allowed in the attachments directory. What for user/script would do
> > symbolic links there?
> 
> Not sure, but I don't see a reason to disallow them.  We can't predict
> what a user hook will do, so I would be in favor of being more flexible
> when we can.

Ok, unlinking symlink is safe so you've conviced me. Especially
it can be simply handled within same switch/case section.

<cut>

> >> > +static bool clear_attachments_dir_recursively(int attdirfd)
> >> > +{
> >> > +	char attdirname[PATH_MAX];
> >> > +	DIR *currdir;
> >> > +	int ret;
> >> > +
> >> > +	currdir = opendir(".");
> >> 
> >> Why do we need this call?
> >
> > nftw() requires path, not fd so I have to ensure I leave working
> > directory intact when I quit the function. I don't know any method
> > apart of fchdir/getcwd() to get dirname I would like to pass to
> > nftw(). And I won't assume I know where's current working dir.
> 
> Ah, I overlooked the fact that currdir is used to get back to the
> directory at the end of the function. My bad.
> 
> That said, I do feel like we are doing a bit too much here and passing
> the path directly would make it simpler (that is, if we were to continue
> to use a separate clear_attachments_dir_recursively() function, as
> opposed to my suggestion below).
> 
> >
> >> 
> >> > +	fchdir(attdirfd);
> >> > +	getcwd(attdirname, sizeof(attdirname));
> >> > +
> >> > +	/* Sanity check we're in attachments directory structure */
> >> > +	if (!strstr(attdirname, DIR_ATTACHMENTS)) {
> >> > +		errf("Cowardly refusing removing in directory which is not "
> >> > +		     "attachments directory [currdir: %s]!\n", attdirname);
> >> > +		ret = -1;
> >> > +		goto out;
> >> > +	}
> >> 
> >> This function is static and only called for DIR_ATTACHMENTS.  I believe
> >> this check is unnecessary.
> >
> > Assuming no bug is here you're right, but I would like to do double check
> > directory content I want to remove is really I expect to.
> 
> I think this check would make sense if things were more complex and
> would make it hard to predict how this function would be called.  I
> don't think that's the case here, though: this is a simple case where
> there is only one call site for this function and it is for the
> DIR_ATTACHMENTS.
> 
> I even think, as mentioned in an earlier reply, that this function could
> be avoided completely, but I won't block on that.

Ok, I'm going to eliminate it. Lets see how it will look like after this
change.

> 
> >
> >> 
> >> > +
> >> > +	ret = nftw(attdirname, ftw_attachment_removal, 4, FTW_PHYS | FTW_DEPTH);
> >> > +
> >> > +out:
> >> > +	fchdir(dirfd(currdir));
> >> > +	closedir(currdir);
> >> > +
> >> > +	return ret ? false : true;
> >> > +}
> >> > +
> >> >  static bool clear_test_result_directory(int dirfd)
> >> 
> >> I think we need to have the path to the test result dir passed as
> >> argument here so that we can build attdirname without having the change
> >> dir + get cwd dance.
> >
> > I didn't want to rewrite clear_old_results() function. Current code
> > uses mostly fd's and only place where I really need path is nftw().
> > I will rewrite to passing paths if you insist but personally I wouldn't
> > do this.
> 
> I think this scenario justifies rewriting clear_old_results() to pass
> the path as well.  We are doing extra steps -- creating attdirfd and
> then, inside clear_attachments_dir_recursively(), all that handling of
> fds -- for no real benefit besides conforming to a "fd as argument"
> standard IMO.

Ok, I walked over the code and probably you're right - providing
path will be simpler then workarounding with fchdir/getcwd.

> 
> >
> >> 
> >> >  {
> >> > -	int i;
> >> > +	int i, attdirfd;
> >> > +	int ret = true;
> >> 
> >> I guess we don't need this ret variable. If the removal of the
> >> attachments directory fails, we can just print an error message and
> >> return false.
> >
> > Ok.
> >
> >> 
> >> >  
> >> >  	for (i = 0; i < _F_LAST; i++) {
> >> >  		if (remove_file(dirfd, filenames[i])) {
> >> > @@ -1960,7 +2019,16 @@ static bool clear_test_result_directory(int dirfd)
> >> >  		}
> >> >  	}
> >> >  
> >> > -	return true;
> >> > +	if ((attdirfd = openat(dirfd, DIR_ATTACHMENTS, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
> >> > +		errf("Cannot open attachments directory\n");
> >> > +		return false;
> >> > +	}
> >> > +
> >> > +	ret = clear_attachments_dir_recursively(attdirfd);
> >> > +	if (!ret)
> >> > +		errf("Cannot clear attachments dir recursively\n");
> >> 
> >> Why not simply call nftw() directly from here? I don't see much value in
> >> having the function clear_attachments_dir_recursively().
> >
> > I created a separate function because I like dividing logical tasks
> > to separate functions. I can unfold this function here if you think
> > this will be better.
> 
> I can live with the separate function.  I just think dropping it greatly
> simplifies the current code.  Your call.

Ok, we'll see how it goes in v4.

--
Zbigniew

> 
> --
> Gustavo Sousa
> 
> >
> > --
> > Zbigniew
> >
> >> 
> >> --
> >> Gustavo Sousa
> >> 
> >> > +
> >> > +	return ret;
> >> >  }
> >> >  
> >> >  static bool clear_old_results(char *path)
> >> > @@ -2002,6 +2070,7 @@ static bool clear_old_results(char *path)
> >> >  			close(dirfd);
> >> >  			return false;
> >> >  		}
> >> > +
> >> >  		close(resdirfd);
> >> >  		if (unlinkat(dirfd, name, AT_REMOVEDIR)) {
> >> >  			errf("Warning: Result directory %s contains extra files\n",
> >> > diff --git a/runner/executor.h b/runner/executor.h
> >> > index 3b1cabcf55..bc6ac80dc4 100644
> >> > --- a/runner/executor.h
> >> > +++ b/runner/executor.h
> >> > @@ -25,6 +25,8 @@ enum {
> >> >  	_F_LAST,
> >> >  };
> >> >  
> >> > +#define DIR_ATTACHMENTS "attachments"
> >> > +
> >> >  bool open_output_files(int dirfd, int *fds, bool write);
> >> >  bool open_output_files_rdonly(int dirfd, int *fds);
> >> >  void close_outputs(int *fds);
> >> > -- 
> >> > 2.43.0
