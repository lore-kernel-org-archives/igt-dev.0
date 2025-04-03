Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90263C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 15:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C27610E281;
	Thu,  3 Apr 2025 15:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gPJtEMyZ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5A110E281
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 15:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cdH40drPXPeA3mdaCYeiR7hNzD07og+/Al58PFxlli4=; b=gPJtEMyZfrggVnL+rTJ3JgetmV
 bw50cmdbUh63tKaHYE628eAAd7sItaJnNNVz3G6M4/rkS+ARx+N9lLn1eMC9YyPn5pP8wTQQ8TjAW
 sAG5DERcHcaNkytB9sRpMH/s+K0vEwsvN9hY/9Ysdus/818Co4BDjkrg8Jb0ubJ5MHB/2HkVaR7pQ
 omZCdvkfC2082IcwSkMAugmbmIQUH2HSgD5Ob3pGmPv+iBQuQsdvxYBN5JCXqxysaH/v1k2Q0qRML
 qB8tkS5mgsvdk/7ZZ4zEvy1QcYQpvCE5FUaY0QmGS0S0fFy2B/TW7TRopxcpIH+Ee8LB/Caa4Nhf7
 cJxl+Btw==;
Received: from [189.6.35.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u0MTg-00At5w-4z; Thu, 03 Apr 2025 17:27:36 +0200
Date: Thu, 3 Apr 2025 12:27:02 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v5 2/4] tests/kms_async_flips: Check for atomic async
 flip cap
Message-ID: <mx5mpjs55fpqbqoqaaktdb3atzeytye3cisuvcfikszzpi6dyn@b3spe5nfueg7>
References: <20250402022922.210495-1-andrealmeid@igalia.com>
 <20250402022922.210495-3-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402022922.210495-3-andrealmeid@igalia.com>
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

On 04/01, André Almeida wrote:
> If a driver doesn't support doing an async flip through the atomic uAPI,
> the atomic tests fails. Instead of failing, create a function that
> checks for this capability and skip the test if is unsupported.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

With the previous patch accepted, this one is:

Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks

> ---
>  tests/kms_async_flips.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index da426f753..d2a1f60f9 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -207,6 +207,12 @@ static void require_monotonic_timestamp(int fd)
>  		      "Monotonic timestamps not supported\n");
>  }
>  
> +static void require_atomic_async_cap(data_t *data)
> +{
> +	igt_require_f(igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP),
> +		      "Atomic flip async flip not supported\n");
> +}
> +
>  static void test_init(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> @@ -687,6 +693,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
>  {
>  	igt_display_t *display = &data->display;
>  
> +	if (data->atomic_path)
> +		require_atomic_async_cap(data);
> +
>  	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
>  		igt_display_reset(display);
>  
> @@ -712,6 +721,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
>  
>  static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>  {
> +	if (data->atomic_path)
> +		require_atomic_async_cap(data);
> +
>  	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
>  		test_init(data);
>  
> -- 
> 2.49.0
> 
