Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439CFCD98D6
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 07:57:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EFE10E21B;
	Mon, 15 Jun 2026 07:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVuz1iK/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E8F10E21B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 07:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781510205; x=1813046205;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=B6k67XuRkI5M9WTsQUrFj8aOWXWxWVNLHEdry+CFpn0=;
 b=ZVuz1iK/gzwPXR/xBVEbqXKSqgMI3oQrNxhWvH7xjIGQEqs/zbJ43Y7g
 dxYWmUSQfnQ0zHPd1Yyko1UdCoGX2Xz6+HA4sDE2bBoPY70g8PUucdiIe
 4lF80Jl1NmXy03VamvCUr/sQv7g+ufLZ3/Wm2mgqzVsZzRSOpifUrJh5Q
 /IZM8zjqZSDtnEW0osXu7tZXLSkHt/elD3+9r9iIphxdcznOx+4fsbuwZ
 jyi2cZJWTUcXZ9NgkouVX+VhqUnNP+VfgiVBC9cAjRtBgKilNT2Tu33mu
 FwT3PKSa96QnNF/jtQNJUs7IfxuHbPBgelXO+U0f0ktqX8xYgv/7/E+fW Q==;
X-CSE-ConnectionGUID: kIA7+P/DRcqKRJ9CCtOhYg==
X-CSE-MsgGUID: Re+06qmqREiidUKBcWCIyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="99663770"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="99663770"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 00:56:45 -0700
X-CSE-ConnectionGUID: tiw7mUXaROqi1K9StlBd/A==
X-CSE-MsgGUID: OYQfMa4PS7O6vBB05OEFBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="243042079"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 00:56:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>, ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 2/4] lib/intel_device_info: add a helper to guess
 the PCI ID for a codename
In-Reply-To: <0db1a2c0-0ab2-10b7-b2fa-3e685e86cef9@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1781261899.git.jani.nikula@intel.com>
 <b02ca4e981b402b630810c017ce144f14d7626a8.1781261899.git.jani.nikula@intel.com>
 <0db1a2c0-0ab2-10b7-b2fa-3e685e86cef9@intel.com>
Date: Mon, 15 Jun 2026 10:56:39 +0300
Message-ID: <ce7e6d3be1a43dd4d3956dacb12a6e76c4bab98b@intel.com>
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

On Sun, 14 Jun 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> On Fri, 12 Jun 2026, Jani Nikula wrote:
>> The struct intel_device_info contains the codenames for the
>> corresponding PCI device IDs. Add a reverse lookup to get a PCI ID for a
>> codename.
>>
>> It's a bit fuzzy, though. The codenames aren't always spelled the same,
>> there are suffixes sometimes omitted, and you can only pick one of the
>> matching PCI IDs. Name the helper intel_guess_device_id() to emphasize
>> the point, and try increasing fuzziness in the matching to find an
>> appropriate struct intel_device_info.
>>
>> There's nothing exact about this, and it should not be considered as
>> such. But it will be useful in VBT parsing.
>>
>> Cc: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>> lib/intel_chipset.h     |  1 +
>> lib/intel_device_info.c | 75 +++++++++++++++++++++++++++++++++++++++++
>> 2 files changed, 76 insertions(+)
>>
>> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
>> index 3fcc5b18d648..98a2a81fcffd 100644
>> --- a/lib/intel_chipset.h
>> +++ b/lib/intel_chipset.h
>> @@ -103,6 +103,7 @@ struct intel_device_info {
>> };
>>
>> const struct intel_device_info *intel_get_device_info(uint16_t devid) __=
attribute__((pure));
>> +uint16_t intel_guess_device_id(const char *codenameish) __attribute__((=
pure));
>>
>> const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attr=
ibute__((pure));
>> unsigned intel_gen(uint16_t devid) __attribute__((pure));
>> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
>> index da0b9f398885..3b5373265000 100644
>> --- a/lib/intel_device_info.c
>> +++ b/lib/intel_device_info.c
>> @@ -3,6 +3,7 @@
>> #include "i915_pciids_local.h"
>>
>> #include <strings.h> /* ffs() */
>> +#include <ctype.h>
>>
>> static const struct intel_device_info intel_generic_info =3D {
>> 	.graphics_ver =3D 0,
>> @@ -746,6 +747,80 @@ out:
>> 	return cache;
>> }
>>
>> +static bool char_eq(char c1, char c2)
>> +{
>> +	c1 =3D isalnum(c1) ? tolower(c1) : '-';
>> +	c2 =3D isalnum(c2) ? tolower(c2) : '-';
>> +
>> +	return c1 =3D=3D c2;
>> +}
>> +
>> +/*
>> + * Return true if the codenames s1 and s2 match, with fuzziness.
>> + *
>> + * Case insensitive matching, ignoring differences in non-alnum charact=
ers. With
>> + * non-zero fuzziness, accept matches up to the first non-alnum charact=
er.
>> + */
>> +static bool codename_match(const char *s1, const char *s2, int fuzzines=
s)
>> +{
>> +	while (*s1 && *s2 && char_eq(*s1, *s2)) {
>> +		s1++;
>> +		s2++;
>> +	}
>> +
>> +	/* full match */
>> +	if (!*s1 && !*s2)
>> +		return true;
>> +
>> +	/* sub-string match up to a non-alnum char */
>> +	if (fuzziness >=3D1) {
>
> I'm genuinely wondering about fuzziness being declared as int while
> used as boolean. I like the idea though and what do you think about
> treating fuzziness as number of allowed errors, so something like this:

The point is to allow extending it if needed.

Also, I just wanted to put something together as a starting
point. String manipulation in C is not exactly fun.

BR,
Jani.

>
> static bool codename_match(const char *ref, const char *sgn, int fuzzines=
s)
> {
>  	if (fuzziness < 0)
>  		return false;
>
>  	while (*ref && *sgn && char_eq(*ref, *sgn)) {
>  		ref++;
>  		sgn++;
>  	}
>
>  	/* full match */
>  	if (!*ref && !*sgn)
>  		return true;
>
>  	if (!*ref && !isalnum(*sgn))
>  		return true;
>
>  	if (!*sgn && !isalnum(*ref))
>  		return true;
>
>  	/* signature lacks letter? */
>  	return codename_match(ref+1, sgn+1, fuzziness-1);
> }
>
> BR,
> Micha=C5=82
>
>> +		if (!*s1 && !isalnum(*s2))
>> +			return true;
>> +		if (!*s2 && !isalnum(*s1))
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static uint16_t lookup_device_id(const char *codename, int fuzziness)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; intel_device_match[i].device_id !=3D PCI_MATCH_ANY; i++)=
 {
>> +		const struct intel_device_info *info =3D (void *)intel_device_match[i=
].match_data;
>> +
>> +		if (codename_match(info->codename, codename, fuzziness))
>> +			return intel_device_match[i].device_id;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * intel_guess_device_id:
>> + * @codenameish: something resembling a codename
>> + *
>> + * Based on something resembling a codename, try to fuzzy find the firs=
t PCI
>> + * device ID matching the codename.
>> + *
>> + * Returns:
>> + * PCI device ID fuzzy matching the @codenameish, or 0 if no match was =
found.
>> + */
>> +uint16_t intel_guess_device_id(const char *codenameish)
>> +{
>> +	uint16_t devid;
>> +	int fuzziness;
>> +
>> +	for (fuzziness =3D 0; fuzziness < 2; fuzziness++) {
>> +		devid =3D lookup_device_id(codenameish, fuzziness);
>> +		if (devid)
>> +			return devid;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> /**
>>  * intel_get_cmds_info:
>>  * @devid: pci device id
>> --=20
>> 2.47.3
>>
>>

--=20
Jani Nikula, Intel
