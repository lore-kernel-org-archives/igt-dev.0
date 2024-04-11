Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768C3CD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 08:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97E310EB67;
	Thu, 11 Apr 2024 08:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJWr95xT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EADE10F686
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 08:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712825589; x=1744361589;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=6qpKhjTA3s1ib/sJ5NPrjdr3xiq1MLVD9pacr+Rf9CA=;
 b=kJWr95xTUJ1DYCbKM070JeA0gwzNQmFFNl+MVrK5iYmCqbqSFaOgJxaw
 f1xQ6NE9YM+M7UpepZ30zbtSwfmF/3sywI1r0++CiqrXb4r3iEKAb27Uj
 2AC9trMz/hhB/rStsx8NIcQCwOnGnamC4hDGwzUEHqYHBGtMdOqq19pQQ
 iZ+ox2RU49TlfTYW1paJ65vZkbkZnRtkCb3e/7adt9fIyaN0XBiAUaN/+
 GPuJPxJYPDE0Kar28F7R5rrnhJYcxOy6WCCAtiU/72IrdHOiEvIoc+aeD
 DrqMIYTYwN1gSr9A7R6dtrpXeJ7kmsaHofv0knlvCVZKua/RH5fyKf7B5 g==;
X-CSE-ConnectionGUID: zZ5kFJv2TSaEG0jHkeirCw==
X-CSE-MsgGUID: h/GhNuYiTmqyZM02U2ifsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12014204"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="12014204"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 01:53:08 -0700
X-CSE-ConnectionGUID: RywAU9n6RjWft4Etzo3A8A==
X-CSE-MsgGUID: 3qcgrHWXSN2OXkgQRIrHPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25488298"
Received: from egrabovs-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.42.233])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 01:53:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t] intel_reg: Stop warning if register spec is not
 there
In-Reply-To: <20240410231710.3113867-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240410231710.3113867-1-lucas.demarchi@intel.com>
Date: Thu, 11 Apr 2024 11:53:03 +0300
Message-ID: <87le5k7028.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 10 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Stop suffering when using igt from the git checkout, which is the case
> for all/most developers.
>
> 	$ sudo ./build/tools/intel_reg write 0x2358 0xdeadbeef
> 	Warning: stat '/usr/local/share/igt-gpu-tools/registers' failed: No such file or directory. Using builtin register spec.
>
> Pretty annoying when you have a bunch of commands to run and don't want
> to simply ignore stderr.  Keep the other warnings as if the file is
> there and can't be read for some reason, it's good to give a warning.
> However if the file simply isn't there, let it pass.

The TL;DR is,

Acked-by: Jani Nikula <jani.nikula@intel.com>

---

We have the "register specs" in plain text files so that anyone could
update them at runtime without building the source. And conceivably they
could be generated from a more authoritative source. It would be nice if
we could incorporate the info to the binary at build time as the builtin
register specs (so no data dir lookups at all), but also be able to
override them e.g. using a command-line parameter if the user wishes.

I don't think that would even be so hard. But it would arguably be a bit
wasted effort as long as the register files under tools/registers/
aren't updated for newer platforms. (The current builtin register specs
are completely out of date.)

The tool could use some love again. It's been almost 10 years since
commit dfda0b6aecce ("intel_reg: introduce one intel_reg tool to rule
them all").

BR,
Jani.

>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tools/intel_reg.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> index 6c37e14d1..ec311a05a 100644
> --- a/tools/intel_reg.c
> +++ b/tools/intel_reg.c
> @@ -1114,12 +1114,8 @@ static int read_reg_spec(struct config *config)
>  		path = IGT_DATADIR"/registers";
>  
>  	r = stat(path, &st);
> -	if (r) {
> -		fprintf(stderr, "Warning: stat '%s' failed: %s. "
> -			"Using builtin register spec.\n",
> -			path, strerror(errno));
> +	if (r)
>  		goto builtin;
> -	}
>  
>  	if (S_ISDIR(st.st_mode)) {
>  		r = get_reg_spec_file(buf, sizeof(buf), path, config->devid);

-- 
Jani Nikula, Intel
