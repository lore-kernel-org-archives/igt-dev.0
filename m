Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7324DCD98C7
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 11:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C32010E38D;
	Mon, 15 Jun 2026 11:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yz+9+/TT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8585F10E38D
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 11:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781522295; x=1813058295;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=U15Ymsdtk4emiySldAVC19p+EA5fE3VqOdH2Ou7sdo0=;
 b=Yz+9+/TT/3PU1UsMwZaVZbGYsgN1hzxVLPTq1idHKRf3UbU2CIzGtCeY
 Mud1Dkp5scfl/eR8cQnYm1WDbsCKsDcEXPzyYpWhcqZ2VCmT6tSMi5U0L
 Fi65pz3VyZrjBt9JR0fmuNPzeoludgcFuXuc3PMXpKchmzEiSOuur7vPW
 JIkzeWYQmhcyFN/lqZEKKU6Y082MXQaFnMl4/UgpGTK9G6qczyXV85dG0
 FT8oBycVbtaIm3hUT2XNO6ak4wqUDRw4j2GGq6AhNPqn77+haQS6csv0u
 OTvOwhrM5ULat/z7vRA1Ba9zOKBFqEVIQY59Sbj3uDm//BCFV9VJtkkDo Q==;
X-CSE-ConnectionGUID: a4yIX3bbQd+cHsRxkPeqeQ==
X-CSE-MsgGUID: esh6IB6PRW6PFtaA2EUT5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82159019"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82159019"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:18:15 -0700
X-CSE-ConnectionGUID: yJmmBQKsQUKpQnApIHf8fg==
X-CSE-MsgGUID: OpgJIqpdRyeJrGLll+JY+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="251363988"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:18:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>, ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 2/4] lib/intel_device_info: add a helper to guess
 the PCI ID for a codename
In-Reply-To: <20260612141636.5zd4s75ietudsx6r@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1781261899.git.jani.nikula@intel.com>
 <b02ca4e981b402b630810c017ce144f14d7626a8.1781261899.git.jani.nikula@intel.com>
 <20260612141636.5zd4s75ietudsx6r@kamilkon-DESK.igk.intel.com>
Date: Mon, 15 Jun 2026 14:18:10 +0300
Message-ID: <715b6be34771368d8d97d6e6b21a24a3b4db5659@intel.com>
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

On Fri, 12 Jun 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrot=
e:
> Hi Jani,
> On 2026-06-12 at 14:00:42 +0300, Jani Nikula wrote:
>> The struct intel_device_info contains the codenames for the
>> corresponding PCI device IDs. Add a reverse lookup to get a PCI ID for a
>> codename.
>>=20
>> It's a bit fuzzy, though. The codenames aren't always spelled the same,
>> there are suffixes sometimes omitted, and you can only pick one of the
>> matching PCI IDs. Name the helper intel_guess_device_id() to emphasize
>> the point, and try increasing fuzziness in the matching to find an
>> appropriate struct intel_device_info.
>>=20
>> There's nothing exact about this, and it should not be considered as
>> such. But it will be useful in VBT parsing.
>>=20
>> Cc: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  lib/intel_chipset.h     |  1 +
>>  lib/intel_device_info.c | 75 +++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 76 insertions(+)
>>=20
>> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
>> index 3fcc5b18d648..98a2a81fcffd 100644
>> --- a/lib/intel_chipset.h
>> +++ b/lib/intel_chipset.h
>> @@ -103,6 +103,7 @@ struct intel_device_info {
>>  };
>>=20=20
>>  const struct intel_device_info *intel_get_device_info(uint16_t devid) _=
_attribute__((pure));
>> +uint16_t intel_guess_device_id(const char *codenameish) __attribute__((=
pure));
>>=20=20
>>  const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __att=
ribute__((pure));
>>  unsigned intel_gen(uint16_t devid) __attribute__((pure));
>> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
>> index da0b9f398885..3b5373265000 100644
>> --- a/lib/intel_device_info.c
>> +++ b/lib/intel_device_info.c
>> @@ -3,6 +3,7 @@
>>  #include "i915_pciids_local.h"
>>=20=20
>>  #include <strings.h> /* ffs() */
>> +#include <ctype.h>
>
> Move it before strings.h, keep alphabetical order.

Ack.

> Also, all system headers should be before igt ones.

Agreed, but not part of this patch.

>
> Regards,
> Kamil
>
> [cut]

--=20
Jani Nikula, Intel
