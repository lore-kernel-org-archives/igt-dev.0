Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFD3CD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 05:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3F6112DC0;
	Mon,  1 Jun 2026 05:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C3MDC/dl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E457D112DBE
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 05:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780293083; x=1811829083;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oZG5WsAhZyQgHReXA9XpHGqpgS5e2215sPsHDCJkxlo=;
 b=C3MDC/dll2aXwjraWC3UpA/3efHSDtsP05la5vQQrHxu0rRi4YC4jmpN
 TkoFcWIdi6gaTqJDrKicnnszcEkRecgkLFotclx6jaNgkhAnkiE35Z9QN
 DTvwULZQiY7kL2z/Y1APB6WYT3SsInW8SZIAnE8icHTH8NoUbcCQ2281H
 VT+A8u69ad4RgmD5KbTSvb5IGeaIkq6kgAM2fmeqmf+51rEsrgvsPkORB
 exqQJbMSnS/HGsvy5SZIgcXvq1dLLPfzUefpt+5KG6kT4rfchTu4IKFHN
 ZP8dzAVHHCLP77tpJyz9VGwufO+tLdWx/ZZWDjYKtE5JWrO4c7f26DbPt w==;
X-CSE-ConnectionGUID: QrFO5shtRQOhWu3+1ebJIQ==
X-CSE-MsgGUID: ncpaRh/BS4uGOE6kccAynw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="83619818"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="83619818"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 22:51:23 -0700
X-CSE-ConnectionGUID: h+fI/sjZTE6qYNah9ZzR0A==
X-CSE-MsgGUID: Fa9vFYrTTGC8Q4j+wLaPNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="240959944"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.64])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 22:51:21 -0700
Date: Mon, 1 Jun 2026 07:51:19 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "Karas, Krzysztof" <krzysztof.karas@intel.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [i-g-t,v2,4/4] runner/resultgen: Insert attachments list into
 results.json
Message-ID: <j2pkuhvzgzajv34sytypuxcbio32r4mdvwz3mxz2mpm2unjzvk@a3oqt6v3gzer>
References: <20260423105514.175870-10-zbigniew.kempczynski@intel.com>
 <466a8316b0e866013d568bed90e7d46fa986b6fe.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <466a8316b0e866013d568bed90e7d46fa986b6fe.camel@intel.com>
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

On Tue, May 26, 2026 at 04:22:11PM +0200, Knop, Ryszard wrote:
> One minor request for comments, but LGTM otherwise:
> 
> Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
> 
> On Thu, 2026-04-23 at 12:55 +0200, Zbigniew Kempczyński wrote:
> > Add list of filenames which were created by hooks in attachments directory
> > (like GuC log copy) to results.json for allow presenting it in CI.
> > Absolute path to attachment directory was added to results.json
> > as this is necessary to build full path to attachment file related to
> > test/subtest name.
> > 
> > Due to lack of userdata pointer in nftw() implementation main json
> > object is passed via temporary static variable. It shouldn't be the
> > problem because results.json is created in single thread. This change
> > is not too elegant but allows to minimize the code change and is
> > much easier to read comparing to recursive readdir().
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> > ---
> > v2: verify getcwd() doesn't fail (Krzysztof)
> > ---
> >  runner/resultgen.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> > 
> > diff --git a/runner/resultgen.c b/runner/resultgen.c
> > index 29fc5cbb15..a78a6f3d05 100644
> > --- a/runner/resultgen.c
> > +++ b/runner/resultgen.c
> > @@ -1,11 +1,14 @@
> >  #include <assert.h>
> >  #include <ctype.h>
> > +#include <dirent.h>
> >  #include <fcntl.h>
> > +#include <ftw.h>
> >  #include <inttypes.h>
> >  #include <stdio.h>
> >  #include <string.h>
> >  #include <sys/mman.h>
> >  #include <sys/stat.h>
> > +#include <sys/types.h>
> >  #include <unistd.h>
> >  
> >  #include <jansson.h>
> > @@ -271,6 +274,19 @@ static struct json_t *get_or_create_json_object(struct json_t *base, const char
> >  	return ret;
> >  }
> >  
> > +static struct json_t *get_or_create_json_array(struct json_t *base, const char *key)
> > +{
> > +	struct json_t *ret = json_object_get(base, key);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = json_array();
> > +	json_object_set_new(base, key, ret);
> > +
> > +	return ret;
> > +}
> > +
> >  static void set_result(struct json_t *obj, const char *result)
> >  {
> >  	if (!result)
> > @@ -1142,6 +1158,71 @@ static bool fill_from_dmesg(int fd,
> >  	return true;
> >  }
> >  
> > +static struct json_t *tmp_tests;
> > +static int ftw_attachments_list(const char *fpath, const struct stat *sb,
> > +				int typeflag, struct FTW *ftwbuf)
> > +{
> > +	struct json_t *obj = NULL, *attobj = NULL;
> > +
> > +	(void)sb;
> > +	(void)ftwbuf;
> > +
> > +	switch (typeflag) {
> > +	case FTW_F:
> 
> It's slightly unclear how this is processing the paths, a comment with
> example arg values would be nice. Functionally IMO it's fine.

Sure, makes sense as I also had to understand what it does.

--
Zbigniew


> 
> > +		const char *attdirkey = "attachments-dir";
> > +		char *p, *currpath = (char *) fpath + 2;
> > +		char currdir[PATH_MAX];
> > +
> > +		p = strstr(currpath, "/");
> > +		if (!p)
> > +			return -1;
> > +		*p = '\0'; /* temporary for acquiring the piglit name */
> > +		obj = get_or_create_json_object(tmp_tests, currpath);
> > +		attobj = get_or_create_json_array(obj, "attachments");
> > +		*p = '/'; /* bring '/' back */
> > +		json_array_append_new(attobj, escaped_json_stringn(currpath, strlen(currpath)));
> > +		if (getcwd(currdir, PATH_MAX) && !json_object_get(obj, attdirkey))
> > +			json_object_set_new(obj, attdirkey,
> > +					    escaped_json_stringn(currdir, strlen(currdir)));
> > +		break;
> > +	case FTW_DP:
> > +		break;
> > +	default:
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
> > @@ -2230,6 +2311,9 @@ static bool parse_test_directory(int dirfd,
> >  		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
> >  	}
> >  
> > +	if (!fill_from_attachments(dirfd, results->tests))
> > +		fprintf(stderr, "Error parsing attachments directory\n");
> > +
> >  	override_results(entry->binary, &subtests, results->tests);
> >  	prune_subtests(settings, entry, &subtests, results->tests);
> >  
