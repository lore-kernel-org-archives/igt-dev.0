Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E14C44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 10:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205DF10F4E2;
	Fri, 17 Jul 2026 10:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEpQLuui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516A210F4E2
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784284077; x=1815820077;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AekQQSJU3dBcWYsy2MLqwWO9h5IdIHwLtvnnISSFkNQ=;
 b=FEpQLuuiXYKud3btWd00z0QQtcIniub0P62CstGGcegzMf6hhLjmGPjh
 i320hggOn5HNdZ/Z2YvzqFuELatuRCffRI6FnQB5eVXHG62toEUBSa+ou
 BHq1Zaato0Yq/OWlpNz5kuhF2kvxKL5dgZDjjREC1kwUqR8s/Ks1SrkMQ
 oB/5tUPDwSnr1fpzYMGi4SCLa71tPgJ8Car2q9VT3TjVSVgq1535XseIi
 Q0Av4PqNobg/b1nNz22lDQNpGkJFIppS4U7lq/mR/bByZFB6XjKogkEjR
 0ZsVMwzE2jK9GzN1tMrBMsByjlC43TAGh2l2aOsrzN+1dGP0pofNNxSSd g==;
X-CSE-ConnectionGUID: cOnRQtLbQPSh3EtE/DgxbQ==
X-CSE-MsgGUID: yIODUG//RZKY4+iWFHPXdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85045380"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="85045380"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 03:27:57 -0700
X-CSE-ConnectionGUID: Q513WXZeRcmk6nmmg7XRfA==
X-CSE-MsgGUID: d0rWLMf8TFyQzw9jXoFlUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="254118263"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:27:55 -0700
Date: Fri, 17 Jul 2026 12:27:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com
Subject: Re: [PATCH 1/3] android: Implement lightweight GKeyFile INI string
 parser in glib shim
Message-ID: <20260717102753.dzvxyhu47ahwlcg4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 louis.chauvet@bootlin.com
References: <20260715192949.1984280-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715192949.1984280-1-markyacoub@google.com>
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

Hi Mark,
On 2026-07-15 at 15:29:47 -0400, Mark Yacoub wrote:

I will comment on only a few small nits spotted.

> [Why]
> Android's Bionic C library lacks libglib2, requiring IGT to build against
> an Android-specific mock header (include/android/glib.h). The existing mock
> implementation of GKeyFile and g_key_file_load_from_file is a hardcoded
> no-op returning NULL, which prevents tests relying on configuration files
> (such as .igtrc) from dynamically retrieving values on Android.
> 
> [How]
> Expand the dummy GKeyFile structure to record the file path upon calling
> g_key_file_load_from_file. Implement a minimal internal INI parser function
> (__android_g_key_file_get) inside g_key_file_get_string to traverse the file
> line-by-line, matching requested [group] and key strings, stripping trailing
> newlines, and returning a heap-allocated duplicate string (strdup).
> 
> Signed-off-by: Mark Yacoub <markyacoub@google.com>
> ---
>  include/android/glib.h | 120 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 111 insertions(+), 9 deletions(-)
> 
> diff --git a/include/android/glib.h b/include/android/glib.h
> index 0b6658287..5b8ba86c7 100644
> --- a/include/android/glib.h
> +++ b/include/android/glib.h
> @@ -16,8 +16,7 @@ typedef struct _GError {
>  } GError;
>  
>  typedef struct _GKeyFile {
> -	char *key;
> -	char *value;
> +	char path[512];

Why it was dropped? Why is there a path name, it suggest one
purpose use only now.

>  } GKeyFile;
>  
[cut]

> +
> +			/* Strip any trailing whitespace, carriage returns, or newlines by inserting null terminators */
> +			while (end > val && (end[-1] == '\r' || end[-1] == '\n' || end[-1] == ' ' || end[-1] == '\t'))
> +				end[-1] = '\0';

Where is a decrement for end? Now it looks like an endless loop.
imho simple should be better:

	while (--end >= val)
		if (*end == '\r' || *end == '\n' || *end == ' ' || *end == '\t')
			*end = '\0';
		else
			break;

Or place this function in igt_strings.c?

Regards,
Kamil

[cut]

