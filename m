Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BFFC5DF87
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 10:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A928510EFC6;
	Thu, 20 Aug 2026 10:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlLEIuHb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0AC10E1E9
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787222140; x=1818758140;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xcMMB9VMpVNDSAsX2QYYSsn7K+YESncVXklSave1W+Q=;
 b=GlLEIuHb0/0qMiwkAleItDkwIvPh1yOlVR2C/o/9qSiV98S4lnpjo6lc
 8F1qceu5fSIzKzdzsVJ5QDUV2HgCqi/Z7wC84Lp2efgHWI45ezwo61NgZ
 QDb81BhFeg63c7Gwlz5fnWE3NSUkG1JVH+N2gzTzna4Zn3928MzuvZQM1
 5l6vs8U1H6E6CIWGKev2IbFkhy9ylRwIHmH/a0drjKfH77CEvCVSOfoSw
 qPaNt643rWBS7NjycORPmeZmsyv60RHsPy9oebH1WTFEtibvwfRbcn0gG
 nWy4+SCyfiv1BpHyPuESDPQBXhqtLCeQbtdMVnoMP4m5+PqH8DHS5x1/q A==;
X-CSE-ConnectionGUID: kbgDUzoxRPWn6MTf28Wryg==
X-CSE-MsgGUID: oixDltdrTnCvyTqwWBS3bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="91625908"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="91625908"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 03:35:39 -0700
X-CSE-ConnectionGUID: +tI9DVOkRJ6lrKZVeBYoZQ==
X-CSE-MsgGUID: SDhq7P2dS12czyz7HMrTRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="304153489"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 03:35:38 -0700
Date: Thu, 20 Aug 2026 12:35:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>, igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t 02/10] lib/xe: Use stricter line-equality check
 when checking for workarounds
Message-ID: <20260820103535.6o7wkg7pfm2bow3t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-2-0c147eeefefa@intel.com>
 <20260729212333.GB7790@mdroper-desk1.amr.corp.intel.com>
 <87ik57b7bn.fsf@intel.com> <87bjaxc3ez.fsf@intel.com>
 <20260819205513.GR8279@mdroper-desk1.amr.corp.intel.com>
 <875x15bxnb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875x15bxnb.fsf@intel.com>
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

Hi Gustavo,
On 2026-08-19 at 18:36:40 -0300, Gustavo Sousa wrote:
> Matt Roper <matthew.d.roper@intel.com> writes:
> 
> > On Wed, Aug 19, 2026 at 04:32:04PM -0300, Gustavo Sousa wrote:
> >> Gustavo Sousa <gustavo.sousa@intel.com> writes:
> >> 
> >> > Matt Roper <matthew.d.roper@intel.com> writes:
> >> >
> >> >> On Tue, Jul 21, 2026 at 03:59:55PM -0300, Gustavo Sousa wrote:
> >> >>> Currently debugfs_file_has_wa() uses strstr() to check if a workaround
> >> >>> name is present in the debugfs dump.  Using strstr() would match the
> >> >>> workaround name anywhere in the dump buffer and with that we risk
> >> >>> producing unexpected results if the checked workaround name happens to
> >> >>> be a substring of another workaround present in the dump.
> >> >>> 
> >> >>> Fix that by making sure we match the workaround name with the full
> >> >>> line from the dump.
> >> >>
> >> >> There are other parts of IGT that use regular expressions from either
> >> >> POSIX (regcomp / regexec) or Glib (g_regex_new / g_regex_match).  Would
> >> >> it be possible to use one of those here instead of opencoding a match
> >> >> function?
> >> >
> >> > Yeah.  That could make this function more readable and easier to extend.
> >> > I'll take a look at those options.
> >> 
> >> This new version of debugfs_file_has_wa() misses the fact that some
> >> lines will contain multiple workarounds separated by comma.  So I
> >> decided to implement a more robust version.  I have two versions, one
> >> that is still not using regular expressions and another that uses POSIX
> >> regcomp/regexec functions.  I have a slight preference for the former,
> >> but if you prefer, we can go with the latter.  IMO, both versions are
> >> more readable than the one currently proposed in this patch.
> >> 
> >> I would like your opinion before sending v2 of this series. :-)
> >
> > It might be best to ping the IGT maintainers and see what they think.
> > Today IGT has a mix of open-coded string matching and two different
> > styles of regular expressions.  It seems like the kind of thing they may
> > want to set a standard direction for with new code.  I don't have much
> > of a personal opinion.
> 
> Kamil, do you have a direction here? Feel free to add other maintainers
> as well.

imho it is better to use regex lib, even if numer of lines are
the same or little bigger.

+cc Ashutosh and Karthik



Regards,
Kamil

> 
> --
> Gustavo Sousa
> 
> >
> >
> > Matt
> >
> >> 
> >> Note: I also created a separate commit adding a simple test for this
> >> function in lib/tests.
> >> 
> >> Version without regular expressions:
> >> 
> >>     | static bool is_eol(char c)
> >>     | {
> >>     |         return !c || c == '\n';
> >>     | }
> >>     | 
> >>     | static bool is_wa_sep(char c)
> >>     | {
> >>     |         return isspace(c) || c == ',';
> >>     | }
> >>     | 
> >>     | static bool debugfs_dump_has_wa(char *dump, const char *wa)
> >>     | {
> >>     |         size_t wa_len = strlen(wa);
> >>     | 
> >>     |         while (*dump) {
> >>     |                 /*
> >>     |                  * Each workaround name is indented by one tab
> >>     |                  * character; unindented lines are used as "section
> >>     |                  * names" identifying the type of workarounds that
> >>     |                  * follow (e.g. "GT Workarounds", "Engine Workarounds"
> >>     |                  * etc).
> >>     |                  */
> >>     |                 if (*dump != '\t')
> >>     |                         goto next_line;
> >>     | 
> >>     |                 while (!is_eol(*dump)) {
> >>     |                         char *other_wa;
> >>     | 
> >>     |                         while (!is_eol(*dump) && is_wa_sep(*dump))
> >>     |                                 dump++;
> >>     | 
> >>     |                         other_wa = dump;
> >>     | 
> >>     |                         while (!is_eol(*dump) && !is_wa_sep(*dump))
> >>     |                                 dump++;
> >>     | 
> >>     |                         if (wa_len == dump - other_wa &&
> >>     |                             !strncmp(wa, other_wa, wa_len))
> >>     |                                 return true;
> >>     |                 }
> >>     | 
> >>     |         next_line:
> >>     |                 while (!is_eol(*dump))
> >>     |                         dump++;
> >>     | 
> >>     |                 if (*dump)
> >>     |                         dump++;
> >>     |         }
> >>     | 
> >>     |         return false;
> >>     | }
> >> 
> >> Version with POSIX regcomp/regexec:
> >> 
> >>     | static int debugfs_dump_has_wa(char *dump, const char *wa)
> >>     | {
> >>     |         size_t wa_len;
> >>     |         regex_t regex;
> >>     |         regmatch_t match[2];
> >>     |         int ret;
> >>     | 
> >>     |         if (regcomp(&regex, "[ \t,]*([^ \t,]+)", REG_EXTENDED | REG_NEWLINE)) {
> >>     |                 igt_critical("Failed to compile regex, workaround %s will not be checked.\n",
> >>     |                              wa);
> >>     | 
> >>     |                 return -1;
> >>     |         }
> >>     | 
> >>     |         wa_len = strlen(wa);
> >>     |         ret = 0;
> >>     | 
> >>     |         while (*dump) {
> >>     |                 /*
> >>     |                  * Each workaround name is indented by one tab
> >>     |                  * character; unindented lines are used as "section
> >>     |                  * names" identifying the type of workarounds that
> >>     |                  * follow (e.g. "GT Workarounds", "Engine Workarounds"
> >>     |                  * etc).
> >>     |                  */
> >>     |                 if (*dump != '\t')
> >>     |                         goto next_line;
> >>     | 
> >>     |                 while (*dump && regexec(&regex, dump, 2, match, 0) == 0) {
> >>     |                         char *other_wa = dump + match[1].rm_so;
> >>     |                         size_t other_wa_len = match[1].rm_eo - match[1].rm_so;
> >>     | 
> >>     |                         dump += match[0].rm_eo;
> >>     | 
> >>     |                         if (wa_len == other_wa_len && !strncmp(wa, other_wa, wa_len)) {
> >>     |                                 ret = 1;
> >>     | 
> >>     |                                 goto done;
> >>     |                         }
> >>     |                 }
> >>     | 
> >>     |         next_line:
> >>     |                 while (*dump && *dump != '\n')
> >>     |                         dump++;
> >>     | 
> >>     |                 if (*dump)
> >>     |                         dump++;
> >>     |         }
> >>     | 
> >>     | done:
> >>     |         regfree(&regex);
> >>     | 
> >>     |         return ret;
> >>     | }
> >> 
> >> --
> >> Gustavo Sousa
> >> 
> >> >
> >> > --
> >> > Gustavo Sousa
> >> >
> >> >>
> >> >>
> >> >> Matt
> >> >>
> >> >>> 
> >> >>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >> >>> ---
> >> >>>  lib/xe/xe_wa.c | 39 ++++++++++++++++++++++++++++++++++++++-
> >> >>>  1 file changed, 38 insertions(+), 1 deletion(-)
> >> >>> 
> >> >>> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> >> >>> index ff5daf529831..d44431e7e61f 100644
> >> >>> --- a/lib/xe/xe_wa.c
> >> >>> +++ b/lib/xe/xe_wa.c
> >> >>> @@ -13,6 +13,43 @@
> >> >>>  #include "xe/xe_wa.h"
> >> >>>  #include "xe/xe_query.h"
> >> >>>  
> >> >>> +static bool debugfs_dump_has_wa(char *dump, const char *wa)
> >> >>> +{
> >> >>> +	char *a = dump;
> >> >>> +
> >> >>> +	while (*a) {
> >> >>> +		const char *b = wa;
> >> >>> +
> >> >>> +		/*
> >> >>> +		 * Each workaround name is indented by one tab
> >> >>> +		 * character; unindented lines are used as "section
> >> >>> +		 * names" identifying the type of workarounds that
> >> >>> +		 * follow (e.g. "GT Workarounds", "Engine Workarounds"
> >> >>> +		 * etc).
> >> >>> +		 */
> >> >>> +		if (*a++ != '\t')
> >> >>> +			goto next_line;
> >> >>> +
> >> >>> +		while (*a == *b && !(*a == '\0' || *a == '\n' || *b == '\0')) {
> >> >>> +			a++;
> >> >>> +			b++;
> >> >>> +		}
> >> >>> +
> >> >>> +		if ((*a == '\0' || *a == '\n') && *b == '\0')
> >> >>> +			return true;
> >> >>> +
> >> >>> +	next_line:
> >> >>> +		/* No match for this line, advance to the next one. */
> >> >>> +		while (*a != '\n' && *a != '\0')
> >> >>> +			a++;
> >> >>> +
> >> >>> +		if (*a == '\n')
> >> >>> +			a++;
> >> >>> +	}
> >> >>> +
> >> >>> +	return false;
> >> >>> +}
> >> >>> +
> >> >>>  static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> >> >>>  			       const char *debugfs_name, const char *wa)
> >> >>>  {
> >> >>> @@ -23,7 +60,7 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> >> >>>  
> >> >>>  	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
> >> >>>  	if (debugfs_dump) {
> >> >>> -		char *has_wa = strstr(debugfs_dump, wa);
> >> >>> +		bool has_wa = debugfs_dump_has_wa(debugfs_dump, wa);
> >> >>>  
> >> >>>  		free(debugfs_dump);
> >> >>>  
> >> >>> 
> >> >>> -- 
> >> >>> 2.55.0
> >> >>> 
> >> >>
> >> >> -- 
> >> >> Matt Roper
> >> >> Graphics Software Engineer
> >> >> Linux GPU Platform Enablement
> >> >> Intel Corporation
> >
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
