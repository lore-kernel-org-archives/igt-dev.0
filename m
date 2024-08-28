Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F70C5B548
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7CE10E54F;
	Wed, 28 Aug 2024 14:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMBhFXXq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D494D10E54E
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724856126; x=1756392126;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=osoHlNHP2xWfxNbWHEQ/4Nlp3GCgyk29hixNRwABKSY=;
 b=VMBhFXXq4TLrDo5xajMyJBtl3ioPLP1hqsPQ6EV9Ts2dcRbrTuWvjRfb
 0ytvnmSQYk34gIHp3JD0af3M8+Ao14Sn3ve6iJKUhYTGDnvCUdqH9zJcn
 13TGUgvPoJVLf0gf28c3hbo5EiRNIl7fV9oJ5XFbCxP0o/D6DdEdmJU2b
 2ajUE4cedf4g8Ju6kEwS30MhvVNhjTMkhuPzkylHn75DQNu3Wy5xtkdcF
 V49BcTKpUaO3+AcTBRt6qogg5INMyvxy/Wf98uBjj4qQGNXSKG8oP6Qv/
 8N9lVfDKxdGak6UYj6AYLC2YVrUzQ3/K+PjCXMn8zd5xTYLakfEtpUQC0 Q==;
X-CSE-ConnectionGUID: RlFblOFnR429EHHf/4vYzA==
X-CSE-MsgGUID: cIMMdmRCQ9yiHTnarRHavw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="13261367"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="13261367"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:42:05 -0700
X-CSE-ConnectionGUID: KA3o/CLrTkKWa7SWdqiqQw==
X-CSE-MsgGUID: 4sSJBxgzT7ecwDuPZJgtFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="67914346"
Received: from iyeshuru-mobl.ger.corp.intel.com (HELO [10.251.220.228])
 ([10.251.220.228])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:42:03 -0700
Message-ID: <b61fdc02-9842-40c2-a53f-ee1243f55deb@linux.intel.com>
Date: Wed, 28 Aug 2024 16:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] runner/settings: set PRUNE_KEEP_ALL as default
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Ewelina Musial <ewelina.musial@intel.com>,
 Helen Koike <helen.koike@collabora.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Rob Clark <robdclark@gmail.com>
References: <20240823161409.79198-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20240823161409.79198-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Tested by compilation only.

On 23.08.2024 18:14, Kamil Konieczny wrote:
> In testing drm-tip it is helpful to have reported all tests
> results, especially when one have many dynamic ones we want
> to get a parent result.
> 
> v2: fix for runner_tests (Jari)
> 
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Helen Koike <helen.koike@collabora.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Rob Clark <robdclark@gmail.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/runner_tests.c | 2 +-
>  runner/settings.c     | 8 ++++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> index b806d45ad..a661722ac 100644
> --- a/runner/runner_tests.c
> +++ b/runner/runner_tests.c
> @@ -310,7 +310,7 @@ igt_main
>  		igt_assert_eq(settings->per_test_timeout, 0);
>  		igt_assert_eq(settings->overall_timeout, 0);
>  		igt_assert(!settings->use_watchdog);
> -		igt_assert_eq(settings->prune_mode, 0);
> +		igt_assert_eq(settings->prune_mode, PRUNE_KEEP_ALL);
>  		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
>  		igt_assert(strstr(settings->results_path, "path-to-results") != NULL);
>  
> diff --git a/runner/settings.c b/runner/settings.c
> index 94b3b9fe6..0d27e7af3 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -279,11 +279,11 @@ static const char *usage_str =
>  	"                        results that are removed from the final results set.\n"
>  	"                        Possible options:\n"
>  	"                         keep-dynamic-subtests  - Remove subtests that have dynamic\n"
> -	"                                                  subtests. (default)\n"
> +	"                                                  subtests.\n"
>  	"                         keep-dynamic           - Alias for the above\n"
>  	"                         keep-subtests          - Remove dynamic subtests,\n"
>  	"                                                  leaving just the parent subtest.\n"
> -	"                         keep-all               - Don't remove anything\n"
> +	"                         keep-all               - Don't remove anything (default)\n"
>  	"                         keep-requested         - Remove reported results that are\n"
>  	"                                                  not in the requested test set.\n"
>  	"                                                  Useful when you have a hand-written\n"
> @@ -693,6 +693,7 @@ bool parse_options(int argc, char **argv,
>  	optind = 1;
>  
>  	settings->dmesg_warn_level = -1;
> +	settings->prune_mode = -1;
>  
>  	while ((c = getopt_long(argc, argv, "hn:dt:x:e:sl:omb:L",
>  				long_options, NULL)) != -1) {
> @@ -818,6 +819,9 @@ bool parse_options(int argc, char **argv,
>  	if (settings->dmesg_warn_level < 0)
>  		settings->dmesg_warn_level = 4; /* KERN_WARN */
>  
> +	if (settings->prune_mode < 0)
> +		settings->prune_mode = PRUNE_KEEP_ALL;
> +
>  	if (settings->list_all) { /* --list-all doesn't require results path */
>  		switch (argc - optind) {
>  		case 1:
