Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD3DCD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 09:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF1110E31C;
	Mon, 15 Jun 2026 09:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfDHdnjQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B565810E31C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 09:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781517449; x=1813053449;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=lVPYsxOrbPYOddEbv2Ymm9JIikm4tfMmFYEOOvcGERg=;
 b=hfDHdnjQq8YgfcaQZCFy3qQZoD5dj+zwZpl+ra/xQp0UCB3gAeKhKck3
 3VUSOnGlrbMNDAm447VppnDlSjTbIqHTyo2aFhCtuopdtU/IBPuUL7Ou6
 rB1SvyJ+Tg3ny9FvxLJy4B8KF9AbvB/1RSYKXLAVPx40bUW48lSx/fHmX
 3GOeVZ/J3Y+zJs3rLmeDeeHYeQ5aD1AEOWgvPpgPz1SrHvoqJ40ZR6hVN
 TRhOeF9TegWVq2C32t3AvxK0sL/tFATEIRDZ6v52dKlB3hSTn3zjtNCHz
 lQvH6lmcw/jHodZht1m7793hW8L93G/PZdyGXZz4rKvwUJgwpBvgfjQos A==;
X-CSE-ConnectionGUID: rKyHxWCMRpKwhd9n7wdz6A==
X-CSE-MsgGUID: suBz/LaITP2sy3GV1dKxzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="81391432"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="81391432"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:57:28 -0700
X-CSE-ConnectionGUID: nUxQFBC1SIes9FMdmtj2tw==
X-CSE-MsgGUID: MlVf8jKNTyG98Q/hgaOxPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="243269772"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:57:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 04/10] lib/intel_device_info: add a helper to
 guess the PCI ID for a codename
In-Reply-To: <20260615093137.681050-5-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260615093137.681050-1-michal.grzelak@intel.com>
 <20260615093137.681050-5-michal.grzelak@intel.com>
Date: Mon, 15 Jun 2026 12:57:23 +0300
Message-ID: <79496f3655e5309fc4f22b940a4115a06c0f8dc7@intel.com>
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
> From: Jani Nikula <jani.nikula@intel.com>
>
> From: Jani Nikula <jani.nikula@intel.com>
>

Where did the dupe From: come from?

Anyway, would be more helpful to get the original patches merged than
include them here, especially since there were review comments on them.

> The struct intel_device_info contains the codenames for the
> corresponding PCI device IDs. Add a reverse lookup to get a PCI ID for a
> codename.
>
> It's a bit fuzzy, though. The codenames aren't always spelled the same,
> there are suffixes sometimes omitted, and you can only pick one of the
> matching PCI IDs. Name the helper intel_guess_device_id() to emphasize
> the point, and try increasing fuzziness in the matching to find an
> appropriate struct intel_device_info.
>
> There's nothing exact about this, and it should not be considered as
> such. But it will be useful in VBT parsing.
>
> Cc: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

You *must* add your own Signed-off-by when sending someone else's
patches. See [1] for what Signed-off-by means.

BR,
Jani.


[1] https://developercertificate.org/


> ---
>  lib/intel_chipset.h     |  1 +
>  lib/intel_device_info.c | 75 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
>
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 3fcc5b18d6..98a2a81fcf 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -103,6 +103,7 @@ struct intel_device_info {
>  };
>=20=20
>  const struct intel_device_info *intel_get_device_info(uint16_t devid) __=
attribute__((pure));
> +uint16_t intel_guess_device_id(const char *codenameish) __attribute__((p=
ure));
>=20=20
>  const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attr=
ibute__((pure));
>  unsigned intel_gen(uint16_t devid) __attribute__((pure));
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index da0b9f3988..3b53732650 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -3,6 +3,7 @@
>  #include "i915_pciids_local.h"
>=20=20
>  #include <strings.h> /* ffs() */
> +#include <ctype.h>
>=20=20
>  static const struct intel_device_info intel_generic_info =3D {
>  	.graphics_ver =3D 0,
> @@ -746,6 +747,80 @@ out:
>  	return cache;
>  }
>=20=20
> +static bool char_eq(char c1, char c2)
> +{
> +	c1 =3D isalnum(c1) ? tolower(c1) : '-';
> +	c2 =3D isalnum(c2) ? tolower(c2) : '-';
> +
> +	return c1 =3D=3D c2;
> +}
> +
> +/*
> + * Return true if the codenames s1 and s2 match, with fuzziness.
> + *
> + * Case insensitive matching, ignoring differences in non-alnum characte=
rs. With
> + * non-zero fuzziness, accept matches up to the first non-alnum characte=
r.
> + */
> +static bool codename_match(const char *s1, const char *s2, int fuzziness)
> +{
> +	while (*s1 && *s2 && char_eq(*s1, *s2)) {
> +		s1++;
> +		s2++;
> +	}
> +
> +	/* full match */
> +	if (!*s1 && !*s2)
> +		return true;
> +
> +	/* sub-string match up to a non-alnum char */
> +	if (fuzziness >=3D1) {
> +		if (!*s1 && !isalnum(*s2))
> +			return true;
> +		if (!*s2 && !isalnum(*s1))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static uint16_t lookup_device_id(const char *codename, int fuzziness)
> +{
> +	int i;
> +
> +	for (i =3D 0; intel_device_match[i].device_id !=3D PCI_MATCH_ANY; i++) {
> +		const struct intel_device_info *info =3D (void *)intel_device_match[i]=
.match_data;
> +
> +		if (codename_match(info->codename, codename, fuzziness))
> +			return intel_device_match[i].device_id;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * intel_guess_device_id:
> + * @codenameish: something resembling a codename
> + *
> + * Based on something resembling a codename, try to fuzzy find the first=
 PCI
> + * device ID matching the codename.
> + *
> + * Returns:
> + * PCI device ID fuzzy matching the @codenameish, or 0 if no match was f=
ound.
> + */
> +uint16_t intel_guess_device_id(const char *codenameish)
> +{
> +	uint16_t devid;
> +	int fuzziness;
> +
> +	for (fuzziness =3D 0; fuzziness < 2; fuzziness++) {
> +		devid =3D lookup_device_id(codenameish, fuzziness);
> +		if (devid)
> +			return devid;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * intel_get_cmds_info:
>   * @devid: pci device id

--=20
Jani Nikula, Intel
