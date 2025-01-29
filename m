Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF780C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 09:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA9110E43A;
	Wed, 29 Jan 2025 09:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZtHrUxiV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFFF10E43A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 09:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738143210; x=1769679210;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=zd5l0LfOIQiRgHQV0xT7JdYso8IZereRJrXzuXhmwcU=;
 b=ZtHrUxiVX70VpFF0xUbr3IC/IDmED7APP3TeAozNLGY6C9hxqYgJajfr
 /SsITomaXeuO5Q+h7xP/1v0IR7fu1guzahL0tA0VyqKz2fy4NTNu0IwEW
 UTe8MWdw3TU0obAGhMVslWUk60O6k0deBKaIgaYrgp7oWapxNqSlLk/tg
 jLE6MKJb2BjTdIwtB0300uUjYG0byFh+O3EQUDPODDQyW7EaSHP7HQW4o
 daSbGU+qwB/1Mt6jkg9V5+kQX8lti5d7V60NIIMAJemPOsEfNt83Ovgjg
 oKNcBmGZeUt7HfT1xBVwcJzL/m3ppgKr5Xjy1U4V8UqrGdSK7oeGdBQDh Q==;
X-CSE-ConnectionGUID: jZPPSvRZQXquzypBYFZwzA==
X-CSE-MsgGUID: r4y74NVhSjOrd+zPLKG8SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38678154"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="38678154"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 01:33:30 -0800
X-CSE-ConnectionGUID: sIsSDsG5SG+wAdOrl1LWpQ==
X-CSE-MsgGUID: +4xq+QzkQ2eVEpyzaUsWJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="108793495"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.235])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 01:33:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>, Matt Atwood
 <matthew.s.atwood@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] lib: sync intel PCI ID macros with kernel
In-Reply-To: <d9470a0c-0011-4b25-b06f-1e7c96a7fc87@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250129003155.91475-1-matthew.s.atwood@intel.com>
 <d9470a0c-0011-4b25-b06f-1e7c96a7fc87@intel.com>
Date: Wed, 29 Jan 2025 11:33:25 +0200
Message-ID: <875xly9d7e.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 29 Jan 2025, "Chauhan, Shekhar" <shekhar.chauhan@intel.com> wrote:
> On 1/29/2025 6:01, Matt Atwood wrote:
>> lib: sync PCI ID macros with kernel
>>
>> Sync with kernel commit:
>> 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")
>
> Can we have a simpler commit description, something like: "Sync PCI IDs 
> of various platforms with the Xe-KMD."
>
> Reason being: The structural modifications below aren't really a part of 
> the kernel commit mentioned.
>
>>
>> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>> ---
>>   lib/pciids.h | 73 ++++++++++++++++++++++++++++++++++++++--------------
>>   1 file changed, 53 insertions(+), 20 deletions(-)
>>
>> diff --git a/lib/pciids.h b/lib/pciids.h
>> index 7883384ac..4736ea525 100644
>> --- a/lib/pciids.h
>> +++ b/lib/pciids.h
>> @@ -717,37 +717,66 @@
>>   	MACRO__(0xA7AB, ## __VA_ARGS__)
>>   
>>   /* DG2 */
>> -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
>> -	MACRO__(0x5690, ## __VA_ARGS__), \
>> -	MACRO__(0x5691, ## __VA_ARGS__), \
>> -	MACRO__(0x5692, ## __VA_ARGS__), \
>> +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
>>   	MACRO__(0x56A0, ## __VA_ARGS__), \
>>   	MACRO__(0x56A1, ## __VA_ARGS__), \
>> -	MACRO__(0x56A2, ## __VA_ARGS__), \
>> +	MACRO__(0x56A2, ## __VA_ARGS__)
>> +
>> +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
>>   	MACRO__(0x56BE, ## __VA_ARGS__), \
>>   	MACRO__(0x56BF, ## __VA_ARGS__)
>>   
>> -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
>> -	MACRO__(0x5693, ## __VA_ARGS__), \
>> -	MACRO__(0x5694, ## __VA_ARGS__), \
>> -	MACRO__(0x5695, ## __VA_ARGS__), \
>> +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
>> +	MACRO__(0x5690, ## __VA_ARGS__), \
>> +	MACRO__(0x5691, ## __VA_ARGS__), \
>> +	MACRO__(0x5692, ## __VA_ARGS__)
>> +
>> +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
>> +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
>> +	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
>> +	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
>> +
>> +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
>>   	MACRO__(0x56A5, ## __VA_ARGS__), \
>>   	MACRO__(0x56A6, ## __VA_ARGS__), \
>>   	MACRO__(0x56B0, ## __VA_ARGS__), \
>> -	MACRO__(0x56B1, ## __VA_ARGS__), \
>> +	MACRO__(0x56B1, ## __VA_ARGS__)
>> +
>> +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
>>   	MACRO__(0x56BA, ## __VA_ARGS__), \
>>   	MACRO__(0x56BB, ## __VA_ARGS__), \
>>   	MACRO__(0x56BC, ## __VA_ARGS__), \
>>   	MACRO__(0x56BD, ## __VA_ARGS__)
>>   
>> -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
>> -	MACRO__(0x5696, ## __VA_ARGS__), \
>> -	MACRO__(0x5697, ## __VA_ARGS__), \
>> +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
>> +	MACRO__(0x5693, ## __VA_ARGS__), \
>> +	MACRO__(0x5694, ## __VA_ARGS__), \
>> +	MACRO__(0x5695, ## __VA_ARGS__)
>> +
>> +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
>> +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
>> +	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
>> +	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
>> +
>> +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
>>   	MACRO__(0x56A3, ## __VA_ARGS__), \
>>   	MACRO__(0x56A4, ## __VA_ARGS__), \
>>   	MACRO__(0x56B2, ## __VA_ARGS__), \
>>   	MACRO__(0x56B3, ## __VA_ARGS__)
>>   
>> +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
>> +	MACRO__(0x5696, ## __VA_ARGS__), \
>> +	MACRO__(0x5697, ## __VA_ARGS__)
>> +
>> +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
>> +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
>> +	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
>> +
>> +#define INTEL_DG2_D_IDS(MACRO__, ...) \
>> +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
>> +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
>> +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
>> +
>>   #define INTEL_DG2_IDS(MACRO__, ...) \
>>   	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
>>   	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
> Although the DG2 IDs look clean to me, but mind explaining me why are we 
> creating these sub-defines for DG2_D / DG2_E / DG2_M
>> @@ -782,9 +811,12 @@
>>   	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
>>   
>>   /* MTL */
>> -#define INTEL_MTL_IDS(MACRO__, ...) \
>> +#define INTEL_MTL_U_IDS(MACRO__, ...) \
>>   	MACRO__(0x7D40, ## __VA_ARGS__), \
>> -	MACRO__(0x7D45, ## __VA_ARGS__), \
>> +	MACRO__(0x7D45, ## __VA_ARGS__)
>> +
>> +#define INTEL_MTL_IDS(MACRO__, ...) \
>> +	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
>>   	MACRO__(0x7D55, ## __VA_ARGS__), \
>>   	MACRO__(0x7D60, ## __VA_ARGS__), \
>>   	MACRO__(0x7DD5, ## __VA_ARGS__)
>
> Following up on my last comment, if we are creating sub-defines, the 
> design isn't followed here in MTL. MTL_IDS extends to MTL_U_IDS and a 
> bunch of singletons. Or, if there's a reason behind doing so, please 
> help me understand.

This is verbatim copy of the PCI ID file from kernel to IGT. There isn't
all that much point in debating the changes here. It's all been done
when the changes were made in kernel.

BR,
Jani.


>
>> @@ -817,19 +849,20 @@
>>   	MACRO__(0xE20B, ## __VA_ARGS__), \
>>   	MACRO__(0xE20C, ## __VA_ARGS__), \
>>   	MACRO__(0xE20D, ## __VA_ARGS__), \
>> -	MACRO__(0xE212, ## __VA_ARGS__)
>> +	MACRO__(0xE210, ## __VA_ARGS__), \
>> +	MACRO__(0xE212, ## __VA_ARGS__), \
>> +	MACRO__(0xE215, ## __VA_ARGS__), \
>> +	MACRO__(0xE216, ## __VA_ARGS__)
>>   
>>   /* PTL */
>>   #define INTEL_PTL_IDS(MACRO__, ...) \
>>   	MACRO__(0xB080, ## __VA_ARGS__), \
>>   	MACRO__(0xB081, ## __VA_ARGS__), \
>>   	MACRO__(0xB082, ## __VA_ARGS__), \
>> +	MACRO__(0xB083, ## __VA_ARGS__), \
>> +	MACRO__(0xB08F, ## __VA_ARGS__), \
>>   	MACRO__(0xB090, ## __VA_ARGS__), \
>> -	MACRO__(0xB091, ## __VA_ARGS__), \
>> -	MACRO__(0xB092, ## __VA_ARGS__), \
>>   	MACRO__(0xB0A0, ## __VA_ARGS__), \
>> -	MACRO__(0xB0A1, ## __VA_ARGS__), \
>> -	MACRO__(0xB0A2, ## __VA_ARGS__), \
>>   	MACRO__(0xB0B0, ## __VA_ARGS__)
>>   
>>   #endif /* __PCIIDS_H__ */

-- 
Jani Nikula, Intel
