Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D2BC83030
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 12:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A19A10E21C;
	Mon, 30 Jun 2025 12:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kz4Dm+Pl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0DB10E21C
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751286070; x=1782822070;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4Raljth0budfX+kqsbDSYUsteSpjuf2GjIIlesnqODs=;
 b=kz4Dm+PlV6DejdaHju4TQ+hnrfGJWcTm0fOD9HQSYo2wLSZudgp2qRUj
 vAac+K7ib6nmS7FAkxs4bLdXKCM2f/nglXB+hA5Vr9zzrkoKEVuRho0aj
 QCabh2hXy3dHOExjAxb03f/YWj+JveLldHcdBjz7M817Ol1fW8sk5e/iw
 erE0/hOk3szTzVSFHkz77XTHKfRCEo2gYjG0Fy3JTLNuijYPaF66PcBPE
 2fWenkXySUsEhXSlaNUK5BnBCug5xpn6ln0SPL7HpU4i3A2UazMTCu8Yr
 9zEZheU9qQnNE3zJbRm6kjq+e1+CY63RvA3KV2t+2g0SCzTLbEhqFkklp g==;
X-CSE-ConnectionGUID: c6ObiZwNQQmX9WcCiaulZQ==
X-CSE-MsgGUID: tkD6xVM7QZ29F+59dhxJtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52739979"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="52739979"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 05:21:10 -0700
X-CSE-ConnectionGUID: jlWsoj+ZSIODNpnX47aXtg==
X-CSE-MsgGUID: pRDXZszPTh2U51e7LC6rlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="157995568"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 05:21:08 -0700
Date: Mon, 30 Jun 2025 14:20:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 arun.r.murthy@intel.com, jeevan.b@intel.com,
 swati2.sharma@intel.com, pranay.samala@intel.com
Subject: Re: [PATCH i-g-t v2] tests/kms_cursor_crc: optimise cursor crc on
 simulation
Message-ID: <20250630122042.dtfmgwiqugcswdgu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 arun.r.murthy@intel.com, jeevan.b@intel.com,
 swati2.sharma@intel.com, pranay.samala@intel.com
References: <20250626080107.629395-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626080107.629395-1-santhosh.reddy.guddati@intel.com>
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

Hi Santhosh,
On 2025-06-26 at 13:31:07 +0530, Santhosh Reddy Guddati wrote:
> Reduce the number of test crc iterations on simulation to avoid timeouts
> on simulation.
> 
> V2: Avoid usage of extra variable to check run_in_simuation (Pranay)
> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_cursor_crc.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index cacd2402c..61dd4a205 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -490,9 +490,17 @@ static void test_crc_offscreen(data_t *data)
>  static void test_crc_sliding(data_t *data)
>  {
>  	int i;
> +	int max;

If you need it here it is better make it simple:

int max = igt_run_in_simulation() ? 4 : 16;

> +
> +	/* In simulation, we only run a few rounds to keep the test fast */
> +	if (igt_run_in_simulation())
> +		max = 4;
> +	else
> +		max = 16;
> +
>  	struct {
>  		igt_crc_t crc[3];
> -	} rounds[16] = {};
> +	} rounds[max];

These make a compiler warning:

[528/2012] Compiling C object tests/kms_cursor_crc.p/kms_cursor_crc.c.o
../tests/kms_cursor_crc.c: In function 'test_crc_sliding':
../tests/kms_cursor_crc.c:501:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
  501 |         struct {
	        |         ^~~~~~

>  
>  	/* Make sure cursor moves smoothly and pixel-by-pixel, and that there are
>  	 * no alignment issues. Horizontal, vertical and diagonal test.
> @@ -526,6 +534,9 @@ static void test_crc_random(data_t *data)
>  
>  	/* Random cursor placement */
>  
> +	if (igt_run_in_simulation())
> +		max = 10;
> +

Few lines above it is set to 2, now you bump it high...
imho:
	if (igt_run_in_simulation() && max > 10)

Regards,
Kamil

>  	/* HW test */
>  	cursor_enable(data);
>  	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
> -- 
> 2.34.1
> 
