Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486CEC52D71
	for <igt-dev@archiver.kernel.org>; Wed,  7 Aug 2024 14:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB77210E53C;
	Wed,  7 Aug 2024 14:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="di9rEMvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6CD10E53D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Aug 2024 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723040573; x=1754576573;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ErrCc8Jb8nO27umA5lwgWUq+zfY86g1w/IeAPw9H788=;
 b=di9rEMvk1D02xeyZDYWmrczkOIHD5dm+UZbd4P117zxSpIlZKHHBmaxl
 h1PKCnoJDEmJLNelpp+s8vJoXfi1+0+NKEkoXZubAa2VwVIP3BqeS1E4g
 ye1mqS0bkkdkdqM+cDTEJLdRElQ0zS8j4+vPTqQltPLPMPjGA/wUIcQAK
 AFFvHoenHaOKiU/oRZbrQ8KofSCO5sBn4rF/unsRI+5d8EYsIJJA0WWl8
 P/s4PP7JGxCukesrjuVxP5NrN0wM/Np39Z+DinJQBRTusnB3P6JQvY83w
 h7vOnBpSaBcNNOpsod5GOMONcuhDB+584/QZvg7lGqM+rkoBXsMs1c5to Q==;
X-CSE-ConnectionGUID: NhNMff1sQ2SH8XcA+SJwVg==
X-CSE-MsgGUID: 0b8YnRV7R5qUys2qEu8QAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20777323"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="20777323"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 07:22:53 -0700
X-CSE-ConnectionGUID: LagN71R3T5Oiu7Io7SwSlA==
X-CSE-MsgGUID: 2wPJ/qtFQ7KakxUU3CJdIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61268367"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.66])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 07:22:52 -0700
Date: Wed, 7 Aug 2024 16:22:49 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 2/4] lib/igt_core: Added message to runner about
 ignoring kernel warns
Message-ID: <20240807142249.ywyvh43gdzlyebil@zkempczy-mobl2>
References: <20240806144332.80609-1-kamil.konieczny@linux.intel.com>
 <20240806144332.80609-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806144332.80609-3-kamil.konieczny@linux.intel.com>
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

On Tue, Aug 06, 2024 at 04:43:30PM +0200, Kamil Konieczny wrote:
> Allow a test to emit regex into dmesg to be read by runner when
> it will be generating results based on kernel dmesg. When it
> will encounter such message, runner will save it and then
> temporarily ignore kernel warnings or errors which matches given
> regex.
> 
> v2: check creation of regex in subtest run and bail out quickly
> on error, fix description (Zbigniew)
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_core.c | 19 +++++++++++++++++++
>  lib/igt_core.h |  2 ++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 3ff3e0392..6523e33df 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3432,3 +3432,22 @@ int igt_pci_system_init(void)
>  
>  	return pthread_once(&once_control, __pci_system_init);
>  }
> +
> +/**
> + * igt_emit_ignore_dmesg_regex:
> + * @ignore_dmesg: string regex
> + *
> + * Emits a string for igt_runner to ignore next dmesg warns or errors which
> + * matches it.
> + */
> +void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex)
> +{
> +	static const char mark_ignore_dmesg[] = "add ignored dmesg regex: ";
> +	GRegex *re;
> +
> +	re = g_regex_new(ignore_dmesg_regex, G_REGEX_OPTIMIZE, 0, NULL);

May you catch an error and display what's wrong with this regex?

--
Zbigniew

> +	igt_assert_f(re, "Error in regexp '%s'\n", ignore_dmesg_regex);
> +
> +	g_regex_unref(re);
> +	igt_kmsg(KMSG_INFO "%s%s\n", mark_ignore_dmesg, ignore_dmesg_regex);
> +}
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 82f474c5f..c12488298 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1540,4 +1540,6 @@ static inline void igt_pci_system_cleanup(void)
>  {
>  }
>  
> +void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
> +
>  #endif /* IGT_CORE_H */
> -- 
> 2.43.0
> 
