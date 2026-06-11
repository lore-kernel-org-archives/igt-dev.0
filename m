Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2D0CD98CC
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 09:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1781710E58F;
	Thu, 11 Jun 2026 09:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1Dxh1jC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16C310E58F
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781171522; x=1812707522;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=I+PFEkHJendTeDilzkM0sBtIOtG9vRRiC5UzIGuuBEU=;
 b=C1Dxh1jClovtkQC8WMbFKgm8DUWU7m/XQGmor28Qc870l3xXJuH5VhAk
 V1UrRqqPyqrYrpO67oLKYrUpcCoA0Vz7gsY33QL1VUctG/pebnc6f/aG4
 cDW4BPggF0tPY+t07kLlMAfBiCwFql3K+PcZkL+bgL+NqvIt8VxuGIa2C
 m1wB2zht/TeMqWIvRY4m403Tpt5KlzP5H4eaFiRoG64f3TMgftolddrZW
 A1Bh6a76pDM4mZKukOaEBmOLySOuNtrCXSO/CUgjlW+yhudP/dRm3HHE/
 2m7WmvN6U9TobS7cYAHQYIJEebwRPO/btgQ0xn/4vWGBouv2/1DYtxQ55 A==;
X-CSE-ConnectionGUID: GK0cuVEGQZuy5H6VMTM6Cg==
X-CSE-MsgGUID: GPU5VGh5TzCeNTiI1OzHBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81827774"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="81827774"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 02:52:01 -0700
X-CSE-ConnectionGUID: p6VVuaBdQ56cgHYEUNspgw==
X-CSE-MsgGUID: X8wGYdzKRUuVO5oCJfTCgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="270105018"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 02:52:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t v2 4/8] tools/vbt_decode: validate DEVICE env var
In-Reply-To: <20260608124121.3131410-5-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260608124121.3131410-1-michal.grzelak@intel.com>
 <20260608124121.3131410-5-michal.grzelak@intel.com>
Date: Thu, 11 Jun 2026 12:51:57 +0300
Message-ID: <2605c2880e1e97d558e9e3cb941bc0fb185cb8ce@intel.com>
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

On Mon, 08 Jun 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> On error, strotoul() returns converted value of longest substring
> spanning from beginning. Check if device ID input via DEVICE env var is
> valid. Log to the user if it is not and reset the devid.

The idea is good, nitpicks on the implementation.

>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  tools/intel_vbt_decode.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 6a9c1de7b3..5681643f4b 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -4315,8 +4315,13 @@ int main(int argc, char **argv)
>=20=20
>  	if (!context.devid) {
>  		const char *devid_string =3D getenv("DEVICE");
> -		if (devid_string)
> -			context.devid =3D strtoul(devid_string, NULL, 16);
> +		if (devid_string) {
> +			context.devid =3D strtoul(devid_string, &endp, 16);
> +			if (*endp) {

	if (!context.devid || *endp)

> +				fprintf(stderr, "invalid devid: %s\n", endp);

This should print the whole devid_string, not endp. Most places also
have single quotes around %s for this kind of stuff.

Maybe this should also say where the invalid devid originates from?
invalid devid in DEVICE environment variable?

> +				context.devid =3D 0;

I think just return EXIT_FAILURE; here. No need to proceed.

> +			}
> +		}
>  	}
>  	if (!context.devid)
>  		context.devid =3D get_device_id(VBIOS, size);

--=20
Jani Nikula, Intel
