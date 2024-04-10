Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70E7CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 15:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAC210ECC2;
	Wed, 10 Apr 2024 15:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAHP3jjx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770B310ECC2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 15:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712762265; x=1744298265;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BE3kEcwb9OGCN5KgORwrdAvmWXoKMlq2esydMOoZyeQ=;
 b=eAHP3jjx0iU27DFEJVDQGIPZWD5Wg9QZHZjgfWHHhVJm0ELH6x6K4ucA
 zI8UqKkw6KJQ6mHOOKZso39PghPumeZw7zOrIWqqPZvq99VBg4fEkkfWh
 nZLKnp1GoTJMFZN1ZlZm5jnUBclYwBN8ZmBI4afNuguOg3Yl+5zi5wgT3
 0Cjey887d/nWMN9pUtC8s/VHJhEEhRssNzMlW4tx93+fBUGEMyxcwFvON
 Pebz3gn9FAaWATPYXQ6mHrg4y45L+QtdHOL+gB+sWxoYSYZuX3icZKZnB
 TAxgyJLVO+jxV5J9AJ/nqqRX+kh88KwNwZ+KIVGmzU4YuI3DaoH9XTdhz Q==;
X-CSE-ConnectionGUID: h0bMTekSRVaKnQ2/jKXBcQ==
X-CSE-MsgGUID: S5+0jGJKRUuhOAYCJ9Yt5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8257495"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8257495"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:17:45 -0700
X-CSE-ConnectionGUID: HHHbFkmoQ3aMOfOYxVSxJQ==
X-CSE-MsgGUID: ETZQTY1RT5mud5QsWTpC1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="58025037"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:17:44 -0700
Date: Wed, 10 Apr 2024 17:17:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v2 4/4] lib: fix calloc calls with inverted arguments
Message-ID: <20240410151741.xdttib4sd7eyvgrw@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240410144321.44766-1-mauro.chehab@linux.intel.com>
 <20240410144321.44766-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240410144321.44766-5-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-04-10 at 16:42:38 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The new gcc version 14 now complains when calloc is called
> with inverted arguments. use the script from:
> a0ee73a8f359 ("benchmarks: fix calloc calls with inverted arguments")
> 
> To fix it.

Same note goes here, with or without it:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  lib/igt_chamelium.c | 4 ++--
>  lib/igt_kms.c       | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 881e1892cf87..016d5356630c 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -153,7 +153,7 @@ struct chamelium_port **chamelium_get_ports(struct chamelium *chamelium,
>  {
>  	int i;
>  	struct chamelium_port **ret =
> -		calloc(sizeof(void*), chamelium->port_count);
> +		calloc(chamelium->port_count, sizeof(void*));
>  
>  	*count = chamelium->port_count;
>  	for (i = 0; i < chamelium->port_count; i++)
> @@ -1516,7 +1516,7 @@ igt_crc_t *chamelium_read_captured_crcs(struct chamelium *chamelium,
>  	res = chamelium_rpc(chamelium, NULL, "GetCapturedChecksums", "(in)", 0);
>  
>  	*frame_count = xmlrpc_array_size(&chamelium->env, res);
> -	ret = calloc(sizeof(igt_crc_t), *frame_count);
> +	ret = calloc(*frame_count, sizeof(igt_crc_t));
>  
>  	for (i = 0; i < *frame_count; i++) {
>  		xmlrpc_array_read_item(&chamelium->env, res, i, &elem);
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2a518eb8d936..60339565a192 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2778,7 +2778,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  		     resources->count_crtcs, IGT_MAX_PIPES);
>  
>  	display->n_pipes = IGT_MAX_PIPES;
> -	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
> +	display->pipes = calloc(display->n_pipes, sizeof(igt_pipe_t));
>  	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
>  
>  	for (i = 0; i < resources->count_crtcs; i++) {
> @@ -2806,7 +2806,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	igt_assert(plane_resources);
>  
>  	display->n_planes = plane_resources->count_planes;
> -	display->planes = calloc(sizeof(igt_plane_t), display->n_planes);
> +	display->planes = calloc(display->n_planes, sizeof(igt_plane_t));
>  	igt_assert_f(display->planes, "Failed to allocate memory for %d planes\n", display->n_planes);
>  
>  	for (i = 0; i < plane_resources->count_planes; ++i) {
> @@ -2855,7 +2855,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  		}
>  
>  		igt_assert_lt(0, n_planes);
> -		pipe->planes = calloc(sizeof(igt_plane_t), n_planes);
> +		pipe->planes = calloc(n_planes, sizeof(igt_plane_t));
>  		igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n", n_planes);
>  		last_plane = n_planes - 1;
>  
> -- 
> 2.44.0
> 
