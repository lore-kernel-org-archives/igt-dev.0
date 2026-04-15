Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B9BF43848
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 16:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD2210E04F;
	Wed, 15 Apr 2026 16:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fobMegnk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D1B10E04F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 16:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776269384; x=1807805384;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VOAEEw3G2GDGF+bB9YL6605O0BAM660zk/ffpmYpU7g=;
 b=fobMegnkks4Uxi6+dQdnrWw9Hw4BDkXdkmfpQK2oOqq+cB/Rju9npzFg
 8v+tlWnPPM98anNS2TFTYyieIIBE99TZy/SdaV8/Op4t8Qpd8nwK5svAE
 CTVZuhvzZHTZUdKUgcHWMVZGGCfE1owYlDPmnfhowOpNYn7DZfzKH3/Vc
 0my2EMyyBrp9Ahe0vD+QDonqFA7l6bbQF1BciHtqntigv51f7H2dDZNit
 TC7DBzYa3vGuUHekB+w9yzvwv2pEKSSpYkfH2s7EgvlfJ6Vs+f/qEnkb5
 JKpVHiy7FnY58jzDYx2fN5I45L8KAuxtFRPlJCmf37VT2Fy/ZGEZa9X01 g==;
X-CSE-ConnectionGUID: zU6tjJsNTHih4FaGLSAAJA==
X-CSE-MsgGUID: gRNWervZTc+sL+Ve1d+Qrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87954482"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87954482"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:09:44 -0700
X-CSE-ConnectionGUID: p0mr5v5xSXSwLFzngvEx8Q==
X-CSE-MsgGUID: +Iuv6SHzQIqYPUaB/nW2ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="235408847"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.25])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:09:42 -0700
Date: Wed, 15 Apr 2026 18:09:40 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 5/5] runner/resultgen: Insert attachments list
 into results.json
Message-ID: <eq74fj354iicdqvutrsjcf52h2s7lbkfiyn3zunqx7ys6oxblt@3d7wrtjwfted>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-12-zbigniew.kempczynski@intel.com>
 <87eckhw7an.fsf@intel.com>
 <h75a4hpy25g4u6tge5kigkm4x33df47z4oj2yoruf3pem4lpe6@nwlnm4fhzofg>
 <87h5pczae6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h5pczae6.fsf@intel.com>
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

On Wed, Apr 15, 2026 at 09:16:33AM -0300, Gustavo Sousa wrote:
> Zbigniew Kempczyński <zbigniew.kempczynski@intel.com> writes:
> 
> > On Tue, Apr 14, 2026 at 06:39:28PM -0300, Gustavo Sousa wrote:
> >> Zbigniew Kempczyński <zbigniew.kempczynski@intel.com> writes:
> >> 
> >> > Add list of filenames which were created by hooks in attachments directory
> >> > (like GuC log copy) to results.json for allow presenting it in CI.
> >> >
> >> > Due to lack of userdata pointer in nftw() implementation main json
> >> > object is passed via temporary static variable. It shouldn't be the
> >> > problem because results.json is created in single thread. This change
> >> > is not too elegant but allows to minimize the code change and is
> >> > much easier to read comparing to recursive readdir().
> >> >
> >> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> >> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> >> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> >> > ---
> >> >  runner/resultgen.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++
> >> >  1 file changed, 63 insertions(+)
> >> >
> >> > diff --git a/runner/resultgen.c b/runner/resultgen.c
> >> > index f8459385c3..d37f01a433 100644
> >> > --- a/runner/resultgen.c
> >> > +++ b/runner/resultgen.c
> >> > @@ -1,11 +1,14 @@
> >> >  #include <assert.h>
> >> >  #include <ctype.h>
> >> > +#include <dirent.h>
> >> >  #include <fcntl.h>
> >> > +#include <ftw.h>
> >> >  #include <inttypes.h>
> >> >  #include <stdio.h>
> >> >  #include <string.h>
> >> >  #include <sys/mman.h>
> >> >  #include <sys/stat.h>
> >> > +#include <sys/types.h>
> >> >  #include <unistd.h>
> >> >  
> >> >  #include <jansson.h>
> >> > @@ -1156,6 +1159,63 @@ static bool fill_from_dmesg(int fd,
> >> >  	return true;
> >> >  }
> >> >  
> >> > +struct json_t *tmp_tests;
> >> > +static int ftw_attachments_list(const char *fpath, const struct stat *sb,
> >> > +				int typeflag, struct FTW *ftwbuf)
> >> > +{
> >> > +	struct json_t *obj = NULL, *attobj = NULL;
> >> > +	(void)sb;
> >> > +	(void)ftwbuf;
> >> > +
> >> > +	if (typeflag == FTW_F) {
> >> > +		char *p;
> >> > +
> >> > +		p = strstr(fpath + 2, "/");
> >> > +		if (!p)
> >> > +			return -1;
> >> > +		*p = '\0'; /* temporary for acquiring the piglit name */
> >> > +		obj = get_or_create_json_object(tmp_tests, fpath + 2);
> >> 
> >> For this to be trully recursive, I think we should create the JSON
> >> object in the FTW_DP case.
> >
> > What for? Imo attachments array for test/subtest which contains
> > relative paths from test/subtest is enough. I see no value by adding
> > recursive arrays apart of increasing complexity to the code. Be aware CI has
> > to present these attachments as well, so more we complicate results.json
> > more work will be on CI side to alter javascript.
> >
> >> 
> >> > +		attobj = get_or_create_json_array(obj, "attachments");
> >> > +		*p = '/'; /* bring '/' back */
> >> > +		json_array_append_new(attobj, escaped_json_stringn(fpath + 2, strlen(fpath + 2)));
> >> > +	} else if (typeflag == FTW_DP) {
> >> > +		;
> >> > +	} else {
> >> > +		return -1;
> >> > +	}
> >> > +
> >> > +	return 0;
> >> > +}
> >> > +
> >> > +static bool fill_from_attachments(int idirfd, struct json_t *tests)
> >> > +{
> >> > +	char attname[32];
> >> > +	int attdirfd;
> >> > +	DIR *currdir;
> >> > +	int ret;
> >> > +
> >> > +	snprintf(attname, sizeof(attname), "%s", DIR_ATTACHMENTS);
> >> > +	if ((attdirfd = openat(idirfd, attname, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
> >> > +		fprintf(stderr, "Error opening '%s' dir\n", DIR_ATTACHMENTS);
> >> > +		return false;
> >> > +	}
> >> > +
> >> > +	currdir = opendir(".");
> >> > +	fchdir(attdirfd);
> >> > +
> >> > +	/*
> >> > +	 * ftw doesn't support passing user data so *tests has to be
> >> > +	 * set to some global for being visible in callback function.
> >> > +	 * As results.json is not processed in multiple threads it is
> >> > +	 * not a big problem.
> >> > +	 */
> >> > +	tmp_tests = tests;
> >> > +	ret = nftw(".", ftw_attachments_list, 4, FTW_PHYS | FTW_DEPTH);
> >> 
> >> I think another option is to use fts(3)? Since it is a streaming API,
> >> you can keep the state (i.e. the current json object) as a local
> >> variable and update as you walk the tree.
> >
> > CI folks want minimize changes in results.json, so according to above
> > I would keep everything in flat attachments array.
> >
> >> 
> >> It seems it is not POSIX though.  Not sure if that's a real issue for
> >> IGT, since stuff in IGT are supposed to run on Linux, right?
> >
> > And Android if I'm not wrong.
> 
> That's Linux as well, no?  Perhaps just need to have a sanity check to
> see if those functions are also available there.
> 
> >
> >> 
> >> Thinking back, I guess it could fts(3) could even be used for the
> >> recursive removal.
> >
> > Question - do we really need this? I can live with ugly static
> > json at cost of simplicity especially this is only result generator
> > which likely won't be touched by next months/years...
> 
> I would say: if the right tool is available for the job, why not using
> it?
> 
> Not going to block on this though...
> 
> >
> > For attachments case imo allowing recursive creation from hooks scripts
> > is an overkill.
> 
> The hook mechanism is not something created for exclusive use by CI. It
> is a tool for developers to use are they see fit.  That was my original
> intention when I first developed the hooks infrastructure.
> 
> I don't like the fact that we are making assumptions of how the hooks
> will behave here.
> 
> If CI wants a flat structure, that's fine: let CI provide hooks that
> generate files in a flat hierarchy.  I just think that it is not right
> to assume that all hooks will behave like that.

Executing hooks out of igt_runner won't provide results.json, right?
So all that recursive removal / etc doesn't makes sense when you execute
tests standalone.

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
> >> > +	fchdir(dirfd(currdir));
> >> > +
> >> > +	return ret ? false : true;
> >> > +}
> >> > +
> >> >  static const char *result_from_exitcode(int exitcode)
> >> >  {
> >> >  	switch (exitcode) {
> >> > @@ -2244,6 +2304,9 @@ static bool parse_test_directory(int dirfd,
> >> >  		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
> >> >  	}
> >> >  
> >> > +	if (!fill_from_attachments(dirfd, results->tests))
> >> > +		fprintf(stderr, "Error parsing attachments directory\n");
> >> > +
> >> >  	override_results(entry->binary, &subtests, results->tests);
> >> >  	prune_subtests(settings, entry, &subtests, results->tests);
> >> >  
> >> > -- 
> >> > 2.43.0
