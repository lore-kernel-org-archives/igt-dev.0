Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB4FD41178
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 11:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EDF10E148;
	Thu, 15 Jan 2026 11:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDVglhgz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6D110E148
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 11:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768478274; x=1800014274;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JfxszJlzeKNhdisqOOqP5Rh0IBu6+0p+uwJ6v9H2DTM=;
 b=hDVglhgzUwxOErAidelfQbJTQxIynJ7Gh1Rg5ryoA3lr95q0MQCBMEgt
 tmh/8GcPm6Rr2H3WXCn4Crk8U9ZHqsqupIfN5FOEs6GwVyXVKle5XIB4t
 pHknd5WLmzgqk62yv924BbQtcJZ4cl9v9y553dRG8NcAqPrmf8XEn7Q7f
 drY3ygpl8NJnOrm0BgGeBNvl0a9U+hg13Ui72sy382fUo6PqIr6oRzRer
 kvrnfYIWPRvhp8R14B1ers0h3by0xdxVIqQh0me8JftTvo5e5Ah6V/Bng
 PcWlH4t5VpQnkzGOZPwCiF51ZkQaNFlQ0xUMY3WHoaAed8mGCQRO2RJHw A==;
X-CSE-ConnectionGUID: oTXD7aJqQBSludo07hhpDw==
X-CSE-MsgGUID: QE+3gz4DRQ2iI2UFvklu8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="68989099"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="68989099"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 03:57:53 -0800
X-CSE-ConnectionGUID: KT0h+rXgSjyahCBaM/sjYA==
X-CSE-MsgGUID: KOqjbo7vTu+/9bcSkH9M7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204725703"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 03:57:52 -0800
Date: Thu, 15 Jan 2026 12:57:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 1/2] runner/settings: Add new option
 --reduce-dmesg
Message-ID: <20260115115749.oy2s3fhnhhwwkzfw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260112165006.237964-1-kamil.konieczny@linux.intel.com>
 <20260112165006.237964-2-kamil.konieczny@linux.intel.com>
 <ig4bglqlw3lxggtg7lnmrfriaat7x4cvmmbruljc47cfslk7gp@tz4uc5l5yp4i>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ig4bglqlw3lxggtg7lnmrfriaat7x4cvmmbruljc47cfslk7gp@tz4uc5l5yp4i>
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

Hi Krzysztof,
On 2026-01-13 at 09:39:37 +0000, Krzysztof Karas wrote:
> Hi Kamil,
> 
> > This option will affect processing of successful dmesg logs,
> > reducing its size to only beginning up to given size and few last
> > lines. That should be enough to locate full dmesg in a separately
> > saved dmesg from whole run. It should help reducing size of
> > results.json and also should make it faster to process.
> What about dropping results.json completely for successful runs?
> That would reduce the overall output result's size even further.
> We still have dmesg.txt files containing all messages, so in
> case of false positives we can always look there for errors.

I did not seen any results.json without errors, there are always
at least few. When you see green label in most cases it means
the errors are already known and they were supressed.

> 
> Or we could have two reduction thresholds:
>  1.for explicit size, where you do not care about the result,
>  and reduce the results.json to the provided limit, keeping
>  warnings/errors intact.
>  2. outright ignoring everything that is not a warning/error, so
>  for successful runs results.json would be empty.

Maybe I didn't describe it properly. This RFC tries to reduce
dmesg inserted in a (sub)test reported inside results.json.
This json has not only dmesg but also logs from stdout/err
and there could be errors reported by tests itself, so dmesg
would be clean but test failed.

> 
> I could prepare a separate set of changes after your series gets
> merged.
> What do you think?
> 

We could think about improvements in reporting, but totally
clean run imho would never happen, so when it will be useful?
Also developers sometimes want to look into successful reports
to verify that all was ok.

+cc J-P
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>

Regards,
Kamil

> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  runner/settings.c | 36 ++++++++++++++++++++++++++++++++++++
> >  runner/settings.h |  1 +
> >  2 files changed, 37 insertions(+)
> > 
> > diff --git a/runner/settings.c b/runner/settings.c
> > index 3ccf71870..f3ca60d2a 100644
> > --- a/runner/settings.c
> > +++ b/runner/settings.c
> > @@ -31,6 +31,7 @@ enum {
> >  	OPT_CODE_COV_SCRIPT,
> >  	OPT_ENABLE_CODE_COVERAGE,
> >  	OPT_COV_RESULTS_PER_TEST,
> > +	OPT_RESULTS_REDUCE_DMESG,
> >  	OPT_HOOK,
> >  	OPT_HELP_HOOK,
> >  	OPT_VERSION,
> > @@ -208,6 +209,29 @@ static bool parse_usage_limit(struct settings *settings, const char *optarg)
> >  	return true;
> >  }
> >  
> > +static bool parse_size_t(size_t *out, const char *optarg)
> I noticed that there are two types of parse_* functions in this
> file: some are used to parse program OPTs, some for simple types
> (parse_int, parse_str, parse_ul). If you aimed for this to be
> generic, like parse_int, then only do parsing to size_t type
> there, otherwise please remove rename this function to
> "parse_dmesg_size" or something similar.
> 
> [...]
> 
> -- 
> Best Regards,
> Krzysztof
