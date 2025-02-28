Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB89C282C1
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 17:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F30510ED0A;
	Fri, 28 Feb 2025 17:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UuFQBmvD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7985110ED0A
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740762506; x=1772298506;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GYyI3Nc+Iomod9vTuev6oNhTKBzQGaqr9hCBIgcUhR8=;
 b=UuFQBmvDDk/rnU+nnBkwcUUGFM4/Qb0wBX8gJazWVizXyRgiFkgeUh0Q
 Qq+EE5ssFfF/mGeMciOiW3/e6jInsWJmLxmzDfYXcbbtOkscj6+Z930Sh
 DHPVf+Zp0/wqhCxmX6mKQhdDMroQVzOPe4+VYLrluzF0zR583UsJ4r5fW
 6XiD5kGXcpJnH3rh0xQ7OZ2JE+2P0kRpIUiTMqSwCtXeD8KpI9F7mlJj1
 V1jIWSoKpP/p0regBZf7oyoHZlM1sDdzCsMIGXGUzVykLGrOBFC1ZYLe+
 7doRGzmMLuN2JkUBqrLPveIYyB0SfP7+CNzSxwBiLfwwCgSz2w8L0x7FV g==;
X-CSE-ConnectionGUID: Aysb5gQaQLyYz4Vo6YEIxw==
X-CSE-MsgGUID: N5DEAxCxR3Wm20udognrBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53107666"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="53107666"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 09:08:26 -0800
X-CSE-ConnectionGUID: nc7ssPxGSmO9N5KC1m7Uow==
X-CSE-MsgGUID: k7mEofJjQCeHL8trniogsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="148197508"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 09:08:25 -0800
Date: Fri, 28 Feb 2025 18:08:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "adrinael@adrinael.net" <adrinael@adrinael.net>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Musial, Ewelina" <ewelina.musial@intel.com>
Subject: Re: [PATCH i-g-t] runner: Parse results harder
Message-ID: <20250228170810.iej7vh5fjqsuwhsl@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "adrinael@adrinael.net" <adrinael@adrinael.net>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Musial, Ewelina" <ewelina.musial@intel.com>
References: <20250226193328.132817-1-kamil.konieczny@linux.intel.com>
 <b15104046ffbc5fb09d439aed03c0256a8027c03.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b15104046ffbc5fb09d439aed03c0256a8027c03.camel@intel.com>
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

Hi Knop,,
On 2025-02-27 at 16:37:18 +0000, Knop, Ryszard wrote:
> On Wed, 2025-02-26 at 20:33 +0100, Kamil Konieczny wrote:
> >   Sometimes an error happens in kernel or in test that leaves
> > output files in corrupted or incorrect state. While runner or
> > resume will just move on to executing next test, when generating
> > results it could end up with no results.json
> > 
> >   Try processing outputs a little more persistently and use any
> > output file left there, even if only dmesg.txt. Also, when no
> > useful output files were present, instead of breaking out add
> > notrun.
> > 
> >   Inform about processing results for each test so a problem
> > could be spotted more easily.
> > 
> > Cc: Ewelina Musial <ewelina.musial@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > Cc: Petri Latvala <adrinael@adrinael.net>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  runner/executor.c  | 21 +++++++++++++++++++++
> >  runner/executor.h  |  1 +
> >  runner/resultgen.c | 45 ++++++++++++++++++++++++++++++---------------
> >  3 files changed, 52 insertions(+), 15 deletions(-)
> > 
> > diff --git a/runner/executor.c b/runner/executor.c
> > index 2abb18732..96b8b5057 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -576,6 +576,27 @@ bool open_output_files(int dirfd, int *fds, bool write)
> >  	return true;
> >  }
> >  
> > +/**
> > + * open_output_files_rdonly:
> > + * @dirfd: fd of output directory with err.txt, dmesg.txt and other files
> > + * @fds: array for fd's of opened output files
> > + *
> > + * Tries to open output files in read-only mode and saves file descriptors
> > + * in fds arrray.
> > + *
> > + * Returns: true if all files opened, false otherwise
> > + */
> > +bool open_output_files_rdonly(int dirfd, int *fds)
> > +{
> > +	bool ret = true;
> > +
> > +	for (int i = 0; i < _F_LAST; i++)
> > +		if ((fds[i] = openat(dirfd, filenames[i], O_RDONLY)) < 0)
> > +			ret = false; /* Remember failure */
> 
> If succesful, open/openat will return -1 and set errno to the real
> error. You can set `fds[i] = -errno` to let the function users know
> what happened with a given descriptor.
> 

Good point, I will do this.

> > +
> > +	return ret;
> > +}
> > +
> >  void close_outputs(int *fds)
> >  {
> >  	int i;
> > diff --git a/runner/executor.h b/runner/executor.h
> > index ab6a0c176..56c7323a8 100644
> > --- a/runner/executor.h
> > +++ b/runner/executor.h
> > @@ -26,6 +26,7 @@ enum {
> >  };
> >  
> >  bool open_output_files(int dirfd, int *fds, bool write);
> > +bool open_output_files_rdonly(int dirfd, int *fds);
> >  void close_outputs(int *fds);
> >  
> >  /*
> > diff --git a/runner/resultgen.c b/runner/resultgen.c
> > index 0d3a569cf..b50c417e3 100644
> > --- a/runner/resultgen.c
> > +++ b/runner/resultgen.c
> > @@ -2176,12 +2176,26 @@ static bool parse_test_directory(int dirfd,
> >  {
> >  	int fds[_F_LAST];
> >  	struct subtest_list subtests = {};
> > -	bool status = true;
> >  	int commsparsed;
> >  
> > -	if (!open_output_files(dirfd, fds, false)) {
> > -		fprintf(stderr, "Error opening output files\n");
> > -		return false;
> > +	if (!open_output_files_rdonly(dirfd, fds)) {
> > +		struct stat statbuf;
> > +		size_t sz = 0;
> 
> This function does not care about the size, just if any non-empty file
> was found. Use a bool like in open_output_files_rdonly.
> 

You are right, I will change it to bool.

> > +
> > +		for (int i = 0; i < _F_LAST; ++i) {
> > +			if (fds[i] > 0 && !fstat(fds[i], &statbuf) && statbuf.st_size != 0)
> > +				sz = statbuf.st_size;
> 
> To make debugging easier, if there's a problem with a given file, print
> its name and the discovered issue in this loop, something like:
> 
> ```c
> if (fds[i] < 0) {
>   fprintf(stderr, "Err: %s: open failed: %s\n",
>           filenames[i], strerror(-fds[i]));

I will add this.

>   continue;
> }
> 
> if (!fstat(fds[i], &statbuf)) {

imho this is redundand and should not happen when a file was
opened but as I already check it let it be, I will add this.

>   fprintf(stderr, "Err: %s: stat failed: %s\n",
>           filenames[i], strerror(errno));
>   continue;
> }
> 
> if (statbuf.st_size == 0) {
>   fprintf(stderr, "Err: %s: file empty\n", filenames[i]);
>   continue;
> }

But this one is not a bug, igt_runner have two modes now,
comms and no-comms and then one of these two groups of files
comms or err/out will be empty, so no point to clobber output
with it. The only abnormality is when no files comms/err/out
are there then yes I could notify about it.

> 
> valid_file_found = true;
> ```
> 
> This way whoever debugs result generation issues can easily figure out
> if they have a broken results tree, wrong permissions or whatever else.
> 

I agree, it is better to notify about what errors were spotted,
I will add this.

Regards,
Kamil

> > +		}
> > +
> > +		if (sz == 0) {
> > +			/* no output saved in any file */
> > +			fprintf(stderr, "results: Error opening output files\n");
> > +			close_outputs(fds);
> > +
> > +			return false;
> > +		}
> > +
> > +		fprintf(stderr, "results: Missing few output file(s)\n");
> >  	}
> >  
> >  	/*
> > @@ -2191,8 +2205,6 @@ static bool parse_test_directory(int dirfd,
> >  	commsparsed = fill_from_comms(fds[_F_SOCKET], entry, &subtests, results);
> >  	if (commsparsed == COMMSPARSE_ERROR) {
> >  		fprintf(stderr, "Error parsing output files (comms)\n");
> > -		status = false;
> > -		goto parse_output_end;
> >  	}
> >  
> >  	if (commsparsed == COMMSPARSE_EMPTY) {
> > @@ -2200,20 +2212,17 @@ static bool parse_test_directory(int dirfd,
> >  		 * fill_from_journal fills the subtests struct and
> >  		 * adds timeout results where applicable.
> >  		 */
> > -		fill_from_journal(fds[_F_JOURNAL], entry, &subtests, results);
> > +		if (fds[_F_JOURNAL] > 0)
> > +			fill_from_journal(fds[_F_JOURNAL], entry, &subtests, results);
> >  
> >  		if (!fill_from_output(fds[_F_OUT], entry->binary, "out", &subtests, results->tests) ||
> >  		    !fill_from_output(fds[_F_ERR], entry->binary, "err", &subtests, results->tests)) {
> >  			fprintf(stderr, "Error parsing output files (out.txt, err.txt)\n");
> > -			status = false;
> > -			goto parse_output_end;
> >  		}
> >  	}
> >  
> >  	if (!fill_from_dmesg(fds[_F_DMESG], settings, entry->binary, &subtests, results->tests)) {
> >  		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
> > -		status = false;
> > -		goto parse_output_end;
> >  	}
> >  
> >  	override_results(entry->binary, &subtests, results->tests);
> > @@ -2221,11 +2230,10 @@ static bool parse_test_directory(int dirfd,
> >  
> >  	add_to_totals(entry->binary, &subtests, results);
> >  
> > - parse_output_end:
> >  	close_outputs(fds);
> >  	free_subtests(&subtests);
> >  
> > -	return status;
> > +	return true;
> >  }
> >  
> >  static void try_add_notrun_results(const struct job_list_entry *entry,
> > @@ -2359,14 +2367,21 @@ struct json_object *generate_results_json(int dirfd)
> >  		char name[16];
> >  
> >  		snprintf(name, 16, "%zd", i);
> > +		fprintf(stderr, "results: parsing output: %s/ for test: %s\n",
> > +			name, job_list.entries[i].binary);
> >  		if ((testdirfd = openat(dirfd, name, O_DIRECTORY | O_RDONLY)) < 0) {
> > +			if (settings.log_level >= LOG_LEVEL_NORMAL)
> > +				fprintf(stderr, "results: no output, setting notrun\n)");
> > +
> >  			try_add_notrun_results(&job_list.entries[i], &settings, &results);
> >  			continue;
> >  		}
> >  
> >  		if (!parse_test_directory(testdirfd, &job_list.entries[i], &settings, &results)) {
> > -			close(testdirfd);
> > -			return NULL;
> > +			if (settings.log_level >= LOG_LEVEL_NORMAL)
> > +				fprintf(stderr, "results: no useful output, setting notrun\n");
> > +
> > +			try_add_notrun_results(&job_list.entries[i], &settings, &results);
> >  		}
> >  		close(testdirfd);
> >  	}
> 
> LGTM for the rest.
> 
> Thanks, Ryszard
