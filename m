Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F93ACFD316
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 09:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75BC10EA85;
	Fri, 11 Oct 2024 09:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQRQ7Q4Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FEB10EA85
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 09:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728640571; x=1760176571;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gPMPGDSVvLvGfxl7pTMBik36dxEloczJgExw9whwJSo=;
 b=YQRQ7Q4Yp4NgYqGLFb6dc716TY+ebQP+awMLXD5dsj//Ihq0Sp1yAUKp
 d9ZKCyR85vKVPzKMIKtiJYVWtoikeIoSK1yjsahIEUlgWnkWTz1MXgUJM
 nU2yDjSgnOTuxjHkpxwYO2UefHXpnsMiKd+TE7mW++zbUQ/og3dDBgDTF
 s/F7XJrCuSoL2PUtc51/QjdvP7mtnpNeTcHHyjfCb9RsZQpZqSQvkCrxM
 kzVJo1hk7k4oxSP8FWTzjcDkhYewTawamgCWpuP3PLso3K2AfgajZq1FX
 dnmUg/0YxeLJoYlDmIgXslyE6qsVwKEulvpU2S2vI5stWPYoexOlTNwq8 Q==;
X-CSE-ConnectionGUID: MMd+YRymQBKuZ6w8w7wKFg==
X-CSE-MsgGUID: 1NYBXLH1RRm3mHSxg8rCRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27927106"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="27927106"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 02:56:11 -0700
X-CSE-ConnectionGUID: IL/jpROJRm+3UgsB5CLkAw==
X-CSE-MsgGUID: 8YUyz+naQXmt04zw0p7wQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76972278"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 11 Oct 2024 02:56:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Oct 2024 12:56:06 +0300
Date: Fri, 11 Oct 2024 12:56:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: igt-dev@lists.freedesktop.org, bhanuprakash.modem@intel.com,
 ankit.k.nautiyal@intel.com
Subject: Re: [PATCH v1] tests/kms_flip: Assert with twice of frame time while
 waiting fro vblank
Message-ID: <Zwj2NjaQ4N5zH-HU@intel.com>
References: <20241011062147.1956995-1-mitulkumar.ajitkumar.golani@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241011062147.1956995-1-mitulkumar.ajitkumar.golani@intel.com>
X-Patchwork-Hint: comment
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

On Fri, Oct 11, 2024 at 11:51:46AM +0530, Mitul Golani wrote:
> Instead of hardcoding to 500us, wait for twice of mode frame time while
> waiting for vblank. Motivation of this change is to remove hard coding
> of 500us, which comes out to be more stringent and ambiguous vs changing
> modeline.
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>  tests/kms_flip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index cbabbe74f..decffa961 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -921,7 +921,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
>  					    0, &reply));
>  		end = gettime_us();
>  		igt_debug("Vblank took %luus\n", end - start);
> -		igt_assert(end - start < 500);
> +		igt_assert(end - start < 2 * mode_frame_time(o));

The test is literally called TEST_VBLANK_EXPIRED_SEQ, which tells us
that it's expecting the target vblank seq to have expired already,
and thus the response should be "immediate". It doesn't matter at all
what kind of mode is in use.

>  		if (reply.sequence != exp_seq) {
>  			igt_debug("unexpected vblank seq %u, should be %u\n",
>  				  reply.sequence, exp_seq);
> -- 
> 2.46.0

-- 
Ville Syrjälä
Intel
