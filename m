Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE1BCD98DE
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 11:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160CE10E39B;
	Mon, 15 Jun 2026 11:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ad6GPBYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0380910E388
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781522482; x=1813058482;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=hfYJCzUuZ3qiRyfR42fjeBk4Lm65wDmQjWZiBrRHp8U=;
 b=Ad6GPBYSCuk63N7BprADrQh/wLrepMbXra46eJZOpHES39+DhKCDc1gb
 odJjme9VzB2ZxVJFhbgmrVIX04pkg6opNU7N7DDRiOh0fJXGE8rc+Sdqh
 bXiy2JO1MqmAoRHzDMDjXbGIStWugiJNmvMKTn67OfUiz76LI+F60YhJ7
 jUE7W9ddjzzZNjnzOx2guuzC8NTWcU7dRS4aaW1otc1WPIizfyVUQeDq0
 J9U73EkGkHS8K+zybMpDbxgt6M2ddEqfriJEHb9yE1yMznftVfa+9SUUH
 v2p24C+uoHW9LS8byAOyId/EEy9yBeHooGybqBbqW/B21savzhkGlh8Ay g==;
X-CSE-ConnectionGUID: ClEkq6y8T/yScHtGROu2hA==
X-CSE-MsgGUID: SBWJ6/gJTUCO7lt9j+rwpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93750810"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="93750810"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:21:21 -0700
X-CSE-ConnectionGUID: 4vXbyH81Q52MTn+XL2luFA==
X-CSE-MsgGUID: HLOXxnRORXKha/brcSiCvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="241090497"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:21:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t v3 07/10] tools/vbt_decode: validate DEVICE env var
In-Reply-To: <20260615093137.681050-8-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260615093137.681050-1-michal.grzelak@intel.com>
 <20260615093137.681050-8-michal.grzelak@intel.com>
Date: Mon, 15 Jun 2026 14:21:17 +0300
Message-ID: <d7d8ef2b1a9a6d9fe7c74843bf615c41534922bb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 15 Jun 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> On error, strotoul() returns converted value of longest substring
> spanning from beginning. Check if device ID input via DEVICE env var is
> valid. Show it and return if it is not.
>
> v2->v3
> - show whole invalid DEVICE env var (Jani)
>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tools/intel_vbt_decode.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index a2e57206d6..33f8598e5f 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -4326,8 +4326,14 @@ int main(int argc, char **argv)
>=20=20
>  	if (!context.devid) {
>  		const char *devid_string =3D getenv("DEVICE");
> -		if (devid_string)
> -			context.devid =3D strtoul(devid_string, NULL, 16);
> +		if (devid_string) {
> +			context.devid =3D strtoul(devid_string, &endp, 16);
> +			if (!context.devid || *endp) {
> +				fprintf(stderr, "invalid devid '%s' in DEVICE environment variable\n=
",
> +					devid_string);
> +				return EXIT_FAILURE;
> +			}
> +		}
>  	}
>  	if (!context.devid)
>  		context.devid =3D get_device_id(VBIOS, size);

--=20
Jani Nikula, Intel
