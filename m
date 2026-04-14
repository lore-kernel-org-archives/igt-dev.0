Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B1EF9D0EF
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 19:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2FF10E057;
	Tue, 14 Apr 2026 19:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZMV+kSQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0825F10E057
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 19:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776195550; x=1807731550;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F2nlH5MOAeQdcENfwv1R+n94HffjEZkMSqGHklxi0ks=;
 b=fZMV+kSQeA2BLVR/Zv0D7ap0LDmn2TPg62DukqszYymW+u1Wal39tyDx
 EEN3HNxhnZnuzXK/4I0mQrqJ2WWmTwFptbvz0D9rift/RjjqYRKj0EGQI
 bHHMEokATR/A3ZvCKrHKLlX85CNXJ79fgp2gg+rJecrox8+tk/Zf6JHmh
 ijQHK7ITRZaEQO218mcb0rSycW1LRS90+/Gp+7/Q8UVvRucDHaaodnr3Y
 iv2BWuXhUv1PRPKvV4IHh+oOKy4FnlCXHQ46WYXBW1sXY56maZDKa7ze4
 Ce248XgDHVxwFHvx2GyCgWIw17ZNL6Ow4kx2OnhLzeVB/1DQ4ZOs+/sJ1 w==;
X-CSE-ConnectionGUID: 9WK+d2UPT8yUXSb1MMylkQ==
X-CSE-MsgGUID: 2jjckPyxSoaY5AYYf6x56w==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77040650"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77040650"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 12:39:09 -0700
X-CSE-ConnectionGUID: UWsqQK27Q+OtoO697OsyMQ==
X-CSE-MsgGUID: +BGneiKkSkm8y17f4cD/0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225893034"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.163])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 12:39:07 -0700
Date: Tue, 14 Apr 2026 21:39:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v3 5/5] runner/resultgen: Insert attachments list
 into results.json
Message-ID: <sasrzl6xxdxav46j2unv6pb6lgxjzey6ye4isnjps5kuh6yofn@lvx6bti2iko5>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-12-zbigniew.kempczynski@intel.com>
 <yhjkjwbyv244n7w6hcaplvvb4hhj7ofnbjua3krba4jcsz6lij@5nfw7wjy2l64>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yhjkjwbyv244n7w6hcaplvvb4hhj7ofnbjua3krba4jcsz6lij@5nfw7wjy2l64>
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

On Tue, Apr 14, 2026 at 09:35:37AM +0000, Krzysztof Karas wrote:
> Hi Zbigniew,
> 
> [...]
> 
> >  
> >  #include <jansson.h>
> > @@ -1156,6 +1159,63 @@ static bool fill_from_dmesg(int fd,
> >  	return true;
> >  }
> >  
> > +struct json_t *tmp_tests;
> > +static int ftw_attachments_list(const char *fpath, const struct stat *sb,
> > +				int typeflag, struct FTW *ftwbuf)
> > +{
> > +	struct json_t *obj = NULL, *attobj = NULL;
> > +	(void)sb;
> > +	(void)ftwbuf;
> Is this so there are no unused parameter warnings?

Yes, that's my habit to mark unused arguments as void to silence
the compiler warnings.

> 
> > +
> > +	if (typeflag == FTW_F) {
> > +		char *p;
> > +
> > +		p = strstr(fpath + 2, "/");
> > +		if (!p)
> > +			return -1;
> > +		*p = '\0'; /* temporary for acquiring the piglit name */
> > +		obj = get_or_create_json_object(tmp_tests, fpath + 2);
> > +		attobj = get_or_create_json_array(obj, "attachments");
> > +		*p = '/'; /* bring '/' back */
> > +		json_array_append_new(attobj, escaped_json_stringn(fpath + 2, strlen(fpath + 2)));
> > +	} else if (typeflag == FTW_DP) {
> > +		;
> I think returning 0 here is not much of a code duplication and
> would look better.

Ok, v4 will contain the change.

> 
> > +	} else {
> > +		return -1;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static bool fill_from_attachments(int idirfd, struct json_t *tests)
> > +{
> > +	char attname[32];
> > +	int attdirfd;
> > +	DIR *currdir;
> > +	int ret;
> > +
> > +	snprintf(attname, sizeof(attname), "%s", DIR_ATTACHMENTS);
> > +	if ((attdirfd = openat(idirfd, attname, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
> > +		fprintf(stderr, "Error opening '%s' dir\n", DIR_ATTACHMENTS);
> > +		return false;
> > +	}
> > +
> > +	currdir = opendir(".");
> Should attdirfd and currdir be closed at the end of this
> function? Or somewhere?

Yes, I missed the cleanup. Will be fixed in v4, thanks!

--
Zbigniew

> 
> > +	fchdir(attdirfd);
> > +
> > +	/*
> > +	 * ftw doesn't support passing user data so *tests has to be
> > +	 * set to some global for being visible in callback function.
> > +	 * As results.json is not processed in multiple threads it is
> > +	 * not a big problem.
> > +	 */
> > +	tmp_tests = tests;
> > +	ret = nftw(".", ftw_attachments_list, 4, FTW_PHYS | FTW_DEPTH);
> > +	fchdir(dirfd(currdir));
> > +
> > +	return ret ? false : true;
> > +}
> > +
> >  static const char *result_from_exitcode(int exitcode)
> >  {
> >  	switch (exitcode) {
> > @@ -2244,6 +2304,9 @@ static bool parse_test_directory(int dirfd,
> >  		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
> >  	}
> >  
> > +	if (!fill_from_attachments(dirfd, results->tests))
> > +		fprintf(stderr, "Error parsing attachments directory\n");
> > +
> >  	override_results(entry->binary, &subtests, results->tests);
> >  	prune_subtests(settings, entry, &subtests, results->tests);
> >  
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Best Regards,
> Krzysztof
