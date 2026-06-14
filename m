Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC66CD98D2
	for <igt-dev@archiver.kernel.org>; Sun, 14 Jun 2026 16:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA7410E0DE;
	Sun, 14 Jun 2026 16:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5mJZOL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CF410E0DE
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Jun 2026 16:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781456365; x=1812992365;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=m1zjb+bkNStyKJPcyzNhuQH4oPMItfUPC/Y/LNwctro=;
 b=n5mJZOL/ESvPO3qkc9bzZj5+tF7uADfyrui9LTZDMH6/a82iv+OwWS2j
 tKOkiFvnPQ5Q3gulMJf0B9h+NgImE9LcCu5InidkQlGLYtRkK9fa3/OAs
 37TBQEe2/++sqjBL/b1WoUJLF5jPFvfxgMNa1I27vQw3V8Q1+75TpEDrl
 vX5z2NGyDR69QuovMQ6inkfYCG1qOofKlJtkRVqM+anE7eVxxfg8lKe2p
 qBSdGdVTVFxBanrfC8Squcs3iDxsRkKOED6CCiBIdAM9KkgFekpg0dNSk
 eH//ShalQsdU93yhixbbpvsmaOwf8CO5hLsDkff2V7j9VToZr/Rnbczo8 w==;
X-CSE-ConnectionGUID: 0VdVe664QoejDhSYJ0GvrQ==
X-CSE-MsgGUID: A3gpVEBuRHmVc9MwJ0xEJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82114300"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="82114300"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 09:59:25 -0700
X-CSE-ConnectionGUID: ceuIuh6CSuaJKSEX/KNh6w==
X-CSE-MsgGUID: 31lYmedqSLKMYyJ90zzelw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="240920341"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 09:59:23 -0700
Date: Sun, 14 Jun 2026 18:59:21 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: igt-dev@lists.freedesktop.org, 
 =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 2/4] lib/intel_device_info: add a helper to guess
 the PCI ID for a codename
In-Reply-To: <b02ca4e981b402b630810c017ce144f14d7626a8.1781261899.git.jani.nikula@intel.com>
Message-ID: <0db1a2c0-0ab2-10b7-b2fa-3e685e86cef9@intel.com>
References: <cover.1781261899.git.jani.nikula@intel.com>
 <b02ca4e981b402b630810c017ce144f14d7626a8.1781261899.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-401861515-1781455839=:2091376"
Content-ID: <8605772d-de50-31f9-7142-7bb614473452@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-401861515-1781455839=:2091376
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <f18859fc-3141-2640-ab10-1498c3727a49@intel.com>

On Fri, 12 Jun 2026, Jani Nikula wrote:
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
> Cc: Micha³ Grzelak <michal.grzelak@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
> lib/intel_chipset.h     |  1 +
> lib/intel_device_info.c | 75 +++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 76 insertions(+)
>
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 3fcc5b18d648..98a2a81fcffd 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -103,6 +103,7 @@ struct intel_device_info {
> };
>
> const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
> +uint16_t intel_guess_device_id(const char *codenameish) __attribute__((pure));
>
> const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__((pure));
> unsigned intel_gen(uint16_t devid) __attribute__((pure));
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index da0b9f398885..3b5373265000 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -3,6 +3,7 @@
> #include "i915_pciids_local.h"
>
> #include <strings.h> /* ffs() */
> +#include <ctype.h>
>
> static const struct intel_device_info intel_generic_info = {
> 	.graphics_ver = 0,
> @@ -746,6 +747,80 @@ out:
> 	return cache;
> }
>
> +static bool char_eq(char c1, char c2)
> +{
> +	c1 = isalnum(c1) ? tolower(c1) : '-';
> +	c2 = isalnum(c2) ? tolower(c2) : '-';
> +
> +	return c1 == c2;
> +}
> +
> +/*
> + * Return true if the codenames s1 and s2 match, with fuzziness.
> + *
> + * Case insensitive matching, ignoring differences in non-alnum characters. With
> + * non-zero fuzziness, accept matches up to the first non-alnum character.
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
> +	if (fuzziness >=1) {

I'm genuinely wondering about fuzziness being declared as int while
used as boolean. I like the idea though and what do you think about
treating fuzziness as number of allowed errors, so something like this:

static bool codename_match(const char *ref, const char *sgn, int fuzziness)
{
 	if (fuzziness < 0)
 		return false;

 	while (*ref && *sgn && char_eq(*ref, *sgn)) {
 		ref++;
 		sgn++;
 	}

 	/* full match */
 	if (!*ref && !*sgn)
 		return true;

 	if (!*ref && !isalnum(*sgn))
 		return true;

 	if (!*sgn && !isalnum(*ref))
 		return true;

 	/* signature lacks letter? */
 	return codename_match(ref+1, sgn+1, fuzziness-1);
}

BR,
Micha³

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
> +	for (i = 0; intel_device_match[i].device_id != PCI_MATCH_ANY; i++) {
> +		const struct intel_device_info *info = (void *)intel_device_match[i].match_data;
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
> + * Based on something resembling a codename, try to fuzzy find the first PCI
> + * device ID matching the codename.
> + *
> + * Returns:
> + * PCI device ID fuzzy matching the @codenameish, or 0 if no match was found.
> + */
> +uint16_t intel_guess_device_id(const char *codenameish)
> +{
> +	uint16_t devid;
> +	int fuzziness;
> +
> +	for (fuzziness = 0; fuzziness < 2; fuzziness++) {
> +		devid = lookup_device_id(codenameish, fuzziness);
> +		if (devid)
> +			return devid;
> +	}
> +
> +	return 0;
> +}
> +
> /**
>  * intel_get_cmds_info:
>  * @devid: pci device id
> -- 
> 2.47.3
>
>
--8323329-401861515-1781455839=:2091376--
