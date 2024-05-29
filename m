Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F5EC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 19:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16C910E151;
	Wed, 29 May 2024 19:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vsz4KOhh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767EA10EB53
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 19:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717010962; x=1748546962;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BqYTMJqWCsniOVqv2LcCed/SXIOVTzK896HfMLodfm4=;
 b=Vsz4KOhhN77iFrcBA9WX0jrV+ufXPJfZ33xYU0fvzv7zrbW8xxAQV54J
 ljn0W8dCGGiRBf9H93mdUVsqv97VPPyabLbgY1m4dAjac7Se0KA+nX6ao
 JQhRh8+5RSv2rBNLSgHLyi8vZS5DgtANJTts/7ypobYPa5ExIx8K7xhSX
 w9yKp1/Mc31tNDngZAXEWwzRAACdnGL5/vyWgBBiBmt9EZXJOovLi81NF
 ah/qwBWjiXdxL/AxmYpUdWdWGa5jQicY9Gn37xyQ09GwxcZ+Q0Z+7R7lY
 LIvQIflZCuCdY09J7KKSgjBuC8tHPRpNolpjeYTg7UyONiN+KbmxBIKwo w==;
X-CSE-ConnectionGUID: aRfMSLqaSsOsSoKDaHzh7A==
X-CSE-MsgGUID: c0PK75EPSd21PxaoSHNrew==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17275922"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="17275922"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 12:29:22 -0700
X-CSE-ConnectionGUID: oq9ZJu9FSjizlqJbFQJuLg==
X-CSE-MsgGUID: SkTozR06RJqHn/Y9CG/jaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="36093349"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.116])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 12:29:18 -0700
Date: Wed, 29 May 2024 21:29:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t] CONTRIBUTING: Add more guidelines
Message-ID: <20240529192914.2dd34is3v4x6e6w4@zkempczy-mobl2>
References: <20240529124849.10728-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240529124849.10728-1-kamil.konieczny@linux.intel.com>
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

On Wed, May 29, 2024 at 02:48:49PM +0200, Kamil Konieczny wrote:
> Add few more guidelines for submitting patches:
> - encourage use of checkpatch.pl script from Linux kernel
> - add guide for good subject for a patch
> - add links to guides about how to create a good patch
> - add guide for responding to CI failure letters
> 
> v1: expand patch from Louis on checkpatch,
>   also take a hint from Jani about checkpatch options
>   add a guide for checking test results from CI
> 
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  CONTRIBUTING.md | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index 2ab8a48f6..23cf0df11 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -63,6 +63,17 @@ Sending Patches
>  
>    on its first invocation.
>  
> +- Place relevant prefix in subject, for example when your change is in one
> +  testfile, use its name without '.c' nor '.h' suffix, like:
> +  tests/simple_test: short description
> +  Consider sending cover letter with your patch, so if you decide to change
> +  subject it can still be linked into same patchseries on patchwork.
> +
> +- Look into some guides from Linux and Open Source community:
> +  https://kernelnewbies.org/PatchPhilosophy
> +  https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> +  https://www.kernel.org/doc/html/latest/process/submit-checklist.html
> +
>  - Patches need to be reviewed on the mailing list. Exceptions only apply for
>    testcases and tooling for drivers with just a single contributor (e.g. vc4).
>    In this case patches must still be submitted to the mailing list first.
> @@ -75,8 +86,17 @@ Sending Patches
>    contact one of the maintainers (listed in the MAINTAINERS file) and cc the
>    igt-dev mailing list.
>  
> +- Before sending use Linux kernel script 'checkpatch.pl' for checking your
> +  patchset. You could ignore some of them like 'line too long' or 'typdef'
> +  but most of the time its log is accurate. Useful options you could use:
> +  --emacs --strict --show-types --max-line-length=100 \
> +  --ignore=BIT_MACRO,SPLIT_STRING,LONG_LINE_STRING,BOOL_MEMBER

My last series exercised by checkpatch.pl noticed one warning which I ignored,
but with the above there's another one I definitely should address.

> +
>  - Changes to the testcases are automatically tested. Take the results into
> -  account before merging.
> +  account before merging.  Please also reply to CI failures if you think they
> +  are unrelated, add also to Cc CI e-mail which is present in message.  This
> +  can help our bug-filing team. When replying, you can cut a message after
> +  'Known bugs' to keep it in reasonable size.
>  
>  
>  Commit Rights
> -- 
> 2.43.0
> 

Maybe we should either consider using checkpatch.pl in CI as additional
step. It would be useful to see this on patchwork as well.

Regardless comment above, this patch is:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
