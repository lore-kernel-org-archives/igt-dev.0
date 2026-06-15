Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D06CD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316A810E33C;
	Mon, 15 Jun 2026 10:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZ4IVQI1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4E710E34F
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781519537; x=1813055537;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=0fZBwnnPV07v/BEBtE6OquZbjpUT0ZgdMd6fH2cqW1s=;
 b=VZ4IVQI1X04vh06rwhhJCmNE6vPQyw4AETBPmPmDEWs+Qfg41iYdDV2f
 rBgHEKNsBr0EAs3eDa49Ix4LjZrf7HeyKCO58XCli0qwvXIorvFe27fyg
 AYElBAx3eO+2fh1R9zCUH/zO9RBmxpcfdJNhjIfatciR7O1Nh6LNOlt8V
 p6ntWF05NOmcmY5f6+nHZG9E995AIETktD4xO0WqS6UUSOcdFuEVW+cUf
 R/qAHbUFQaeCACb6nYyAKJd5e5NClXQuomEQRBeD1dlYjdwtQ2EYUkrnD
 NeTqtUwMo4y2hGw/ioXvxse1yguPy5mkX06bc5teGk0jJQqnVnJuoWtPo w==;
X-CSE-ConnectionGUID: iQkiAbB7QVa1N2dei6TLtQ==
X-CSE-MsgGUID: leIjajqkTpWjZzZ/qGz9uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="86155100"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="86155100"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:16 -0700
X-CSE-ConnectionGUID: hbPdw13LTPusjQhWxJDfbQ==
X-CSE-MsgGUID: zpOgikiTSnS3YEpI2A6Kgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247310018"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:15 -0700
Date: Mon, 15 Jun 2026 12:32:13 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>, 
 =?ISO-8859-15?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 04/10] lib/intel_device_info: add a helper to
 guess the PCI ID for a codename
In-Reply-To: <20260615093137.681050-5-michal.grzelak@intel.com>
Message-ID: <9bfadd46-8741-7fed-7445-46cef89de1cb@intel.com>
References: <20260615093137.681050-1-michal.grzelak@intel.com>
 <20260615093137.681050-5-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-577813610-1781519536=:605841"
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

--8323329-577813610-1781519536=:605841
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 15 Jun 2026, Michał Grzelak wrote:
> From: Jani Nikula <jani.nikula@intel.com>
>
> From: Jani Nikula <jani.nikula@intel.com>
>
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
> Cc: Michał Grzelak <michal.grzelak@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>

> ---
> lib/intel_chipset.h     |  1 +
> lib/intel_device_info.c | 75 +++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 76 insertions(+)
>
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 3fcc5b18d6..98a2a81fcf 100644
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
> index da0b9f3988..3b53732650 100644
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
> 2.45.2
>
>
--8323329-577813610-1781519536=:605841--
