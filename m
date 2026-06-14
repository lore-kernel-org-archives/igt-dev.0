Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DB5CD98C5
	for <igt-dev@archiver.kernel.org>; Sun, 14 Jun 2026 17:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4454010E0E1;
	Sun, 14 Jun 2026 17:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzrwX/UM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8137910E0DE
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Jun 2026 17:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781457406; x=1812993406;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=DkWgiDpDKE7o5sN0lQBYersFu4c6yRP5t3Azj+Ak/jw=;
 b=SzrwX/UMjDKx3wd89KfrcJFVlx1S/Bq/Fbu1+4em0X2mVIko4TRcIhm0
 UvXfNc9Cj+Td2R1AgEdVJy+sYpUYgWBwpyoIHeR3/gtpZEMZcKR3fyCvB
 25zDqx0FXP/72yE/Mbw+eOs946yvtS53MSzjP0WkJ1x7OXhdZdcrYCOxT
 4PnJvWJN8OV5s9H1o74iASed/sOMAXXfPKOWqaQhyHZaxcB+6UcTs6Vch
 D8pziBxA4XLEKRRngXYH+9Fm3GdL2jh5qAYbF1h18afNOiV1bfO+yBaKJ
 YZ1qNihfbFlPZyQyfd3uuwGRrBVuSxVw1VpSFnGxXjYWrYtXPfdFnYLlF g==;
X-CSE-ConnectionGUID: xttll22nQQyCd+Aq1dj0LA==
X-CSE-MsgGUID: 1DO/e2U+Q4yqoxQFFP0rMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82058509"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="82058509"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 10:16:45 -0700
X-CSE-ConnectionGUID: +QWW98LDT8SlnVPcsTHeqA==
X-CSE-MsgGUID: 4CRYYlMZTgetCaTp/itVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="271346725"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 10:16:44 -0700
Date: Sun, 14 Jun 2026 19:16:42 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: igt-dev@lists.freedesktop.org, 
 =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 0/4] intel_vbt_decode: fall back to guessing PCI
 ID from VBT signature
In-Reply-To: <cover.1781261899.git.jani.nikula@intel.com>
Message-ID: <35ab2ef8-1da9-4295-9ab9-ebdc613a904c@intel.com>
References: <cover.1781261899.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1553971019-1781457404=:605841"
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

--8323329-1553971019-1781457404=:605841
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 12 Jun 2026, Jani Nikula wrote:
> This is inspired by Michał's patch [1], and I got kind of carried away
> trying to figure out how to infer the stuff from the existing codenames
> in intel_device_info.c. I didn't mean to do it, but here it is. :)

Glad to hear and thanks for carrying it :) Wondering if we could measure
dissimilarity between extracted codenameish and each codename using eg.
Levenshtein distance and then pick the codename with minimal one. Or
tweaking codename_match() to return fuzziness between two strings and do
same. I guess that way even if we had eg. P%fjlAwNTH][ljphEf;R the
closest would be PANTHERLAKE (I suppose at least).

Not entirely sure how such code should look like though, hence for the
series:

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>

BR,
Michał

>
> BR,
> Jani.
>
>
> [1] https://lore.kernel.org/r/20260608124121.3131410-6-michal.grzelak@intel.com
>
>
> Jani Nikula (3):
>  tools/intel_vbt_decode: store codename from VBT signature to context
>  lib/intel_device_info: add a helper to guess the PCI ID for a codename
>  tools/intel_vbt_decode: fall back to guessing PCI ID from VBT
>    signature
>
> Michał Grzelak (1):
>  tools/vbt_decode: return 0 from get_device_id()
>
> lib/intel_chipset.h      |  1 +
> lib/intel_device_info.c  | 75 ++++++++++++++++++++++++++++++++++++++++
> tools/intel_vbt_decode.c | 35 +++++++++++++------
> 3 files changed, 100 insertions(+), 11 deletions(-)
>
> -- 
> 2.47.3
>
>
--8323329-1553971019-1781457404=:605841--
