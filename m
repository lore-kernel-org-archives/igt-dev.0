Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16429C369A2
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 16:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC30410E6F2;
	Tue,  8 Apr 2025 16:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hiAlBc/M";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A598810E6F2
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 16:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7NNqt1XF4puO4s6PKyE/gEqFeWKRUw+ZagV9gPIAWpY=; b=hiAlBc/Mqr2PllaNMt1m4H+8dy
 iFdwn58qLRLNeUeVffBxTV4LJ/7gV+4uQ6MvJhbAQ5NJNmm/6IH2eSArYfTfxUGedUXDtxpUQCwbt
 uMxPaS2ryE8BKwcfrZ87ebFc6qG/3W5DunIUzONmkb/7uRtRarBIpsn4V594RQrDWGkJZ2KjpugGP
 cRNWV5GCYanCooWErvM0q28qYJmDNqOJbGMYrOqR3ooGjPiYJ3QDHA22tohkRioDA6MZCxB/JUdRM
 eJjSVSVjThHzmHrQ/sLttpsQYIJ7c/fHsoKos+k5Ppusz9Fxoj7fHiCS0a6s+6sM1GMj76G2gjx8k
 8hg+VqXg==;
Received: from [189.6.35.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u2BOn-00DO0S-36; Tue, 08 Apr 2025 18:02:05 +0200
Date: Tue, 8 Apr 2025 13:01:57 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v6 2/4] tests/kms_async_flips: Check for atomic async
 flip cap
Message-ID: <j2kam7redmh5qqqbbunyuoyl235vg3bw32yoqq4azbb4mfrztw@aaepkfnv5u5f>
References: <20250408000221.140459-1-andrealmeid@igalia.com>
 <20250408000221.140459-3-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408000221.140459-3-andrealmeid@igalia.com>
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

On 04/07, André Almeida wrote:
> If a driver doesn't support doing an async flip through the atomic uAPI,
> the atomic tests fails. Instead of failing, create a function that
> checks for this capability and skip the test if is unsupported.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> ---
>  tests/kms_async_flips.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 126b96d6b..fc9cbd3f1 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -209,6 +209,14 @@ static void require_monotonic_timestamp(int fd)
>  	igt_require_f(ret, "Monotonic timestamps not supported\n");
>  }
>  
> +static void require_atomic_async_cap(data_t *data)
> +{
> +	int ret = igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP);
> +
> +	igt_assert(ret >= 0);
> +	igt_require_f(ret, "Atomic async flip not supported\n");

Hmmm.. I don't think we want an assert here. Otherwise, the test aborts
instead of skipping if the cap wasn't introduced yet in a target kernel
version.

drm_get_cap return -EINVAL if this capability doesn't exist in a kernel
version and zero if it exists but isn't supported by the specific
driver. Perhaps two igt_require_f makes sense, as below?

+	igt_require_f(ret > 0, "Atomic async flip cap doesn't exist in
this kernel\n");
+	igt_require_f(ret, "Atomic async flip not supported by this
driver\n");

WDYT?

Melissa

> +}
> +
>  static void test_init(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> @@ -689,6 +697,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
>  {
>  	igt_display_t *display = &data->display;
>  
> +	if (data->atomic_path)
> +		require_atomic_async_cap(data);
> +
>  	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
>  		igt_display_reset(display);
>  
> @@ -714,6 +725,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
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
