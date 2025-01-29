Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F58C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 12:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332DB10E055;
	Wed, 29 Jan 2025 12:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbDsDsuJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA70C10E055
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 12:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738154631; x=1769690631;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Nlcm6cs8tw9fBVgIQ2m23Q9PVoCVONJBxP+wjYWdw6c=;
 b=JbDsDsuJ5TMJFgSXfyLJbrFDNkQuNnUqdBZ6SWD0Q+8FlJ8UrWJ5Qcp3
 XQnQwzgUWWObj0YEkebBgRCag7bf0zcJk7c3a8hg+hScVMDTejSm4ITT5
 OFBb/6lHFRydQmrMD9ffUKaiMWi25z6Mu3UG0I6pt977JTUd3VYm/5hCF
 bBUksXIrbtZSwzBOP6WN9ZaWIIOGjddHMZd3yRyoUBfCDCWOtM5OUMWSd
 DONMb4IPu+KbEGzhNjDLNeXbu8/2hlPS6GEsLCRxOfoWJm8lCw/GSWMT7
 bATvOU5ZmU6qQkykThhWZM0Gx66yPGuylaoseAs7HKP7/8ib2LfCbQXXf Q==;
X-CSE-ConnectionGUID: cox6YJkuS0SWi6NnafpSQQ==
X-CSE-MsgGUID: MZcTOeAmQDiGoA17v52jVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="50050798"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="50050798"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:43:51 -0800
X-CSE-ConnectionGUID: 58PCVxdnRIKtSXk/rlA09g==
X-CSE-MsgGUID: VCbTjyUVSPGy7g8XNjNOHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="139912248"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.235])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:43:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>, Matt Atwood
 <matthew.s.atwood@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] lib: sync intel PCI ID macros with kernel
In-Reply-To: <20250129112042.f3xztl4brinh34on@kamilkon-desk.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250129003155.91475-1-matthew.s.atwood@intel.com>
 <d9470a0c-0011-4b25-b06f-1e7c96a7fc87@intel.com>
 <875xly9d7e.fsf@intel.com>
 <20250129112042.f3xztl4brinh34on@kamilkon-desk.igk.intel.com>
Date: Wed, 29 Jan 2025 14:43:45 +0200
Message-ID: <87zfj994e6.fsf@intel.com>
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

On Wed, 29 Jan 2025, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> Hi Jani,
> On 2025-01-29 at 11:33:25 +0200, Jani Nikula wrote:
>> On Wed, 29 Jan 2025, "Chauhan, Shekhar" <shekhar.chauhan@intel.com> wrote:
>> > On 1/29/2025 6:01, Matt Atwood wrote:
>> >> lib: sync PCI ID macros with kernel
>> >>
>> >> Sync with kernel commit:
>> >> 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")
>> >
>> > Can we have a simpler commit description, something like: "Sync PCI IDs 
>> > of various platforms with the Xe-KMD."
>> >
>> > Reason being: The structural modifications below aren't really a part of 
>> > the kernel commit mentioned.
>> >
>> >>
>> >> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>> >> ---
>> >>   lib/pciids.h | 73 ++++++++++++++++++++++++++++++++++++++--------------
>> >>   1 file changed, 53 insertions(+), 20 deletions(-)
>> >>
>> >> diff --git a/lib/pciids.h b/lib/pciids.h
>> >> index 7883384ac..4736ea525 100644
>> >> --- a/lib/pciids.h
>> >> +++ b/lib/pciids.h
>> >> @@ -717,37 +717,66 @@
>> >>   	MACRO__(0xA7AB, ## __VA_ARGS__)
>> >>   
>> >>   /* DG2 */
>> >> -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
>> >> -	MACRO__(0x5690, ## __VA_ARGS__), \
>> >> -	MACRO__(0x5691, ## __VA_ARGS__), \
>> >> -	MACRO__(0x5692, ## __VA_ARGS__), \
>> >> +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
>> >>   	MACRO__(0x56A0, ## __VA_ARGS__), \
>> >>   	MACRO__(0x56A1, ## __VA_ARGS__), \
>> >> -	MACRO__(0x56A2, ## __VA_ARGS__), \
>> >> +	MACRO__(0x56A2, ## __VA_ARGS__)
>> >> +
>> >> +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
>> >>   	MACRO__(0x56BE, ## __VA_ARGS__), \
>> >>   	MACRO__(0x56BF, ## __VA_ARGS__)
>> >>   
>> >> -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
>> >> -	MACRO__(0x5693, ## __VA_ARGS__), \
>> >> -	MACRO__(0x5694, ## __VA_ARGS__), \
>> >> -	MACRO__(0x5695, ## __VA_ARGS__), \
>> >> +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
>> >> +	MACRO__(0x5690, ## __VA_ARGS__), \
>> >> +	MACRO__(0x5691, ## __VA_ARGS__), \
>> >> +	MACRO__(0x5692, ## __VA_ARGS__)
>> >> +
>> >> +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
>> >> +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
>> >> +	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
>> >> +	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
>> >> +
>> >> +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
>> >>   	MACRO__(0x56A5, ## __VA_ARGS__), \
>> >>   	MACRO__(0x56A6, ## __VA_ARGS__), \
>> >>   	MACRO__(0x56B0, ## __VA_ARGS__), \
>> >> -	MACRO__(0x56B1, ## __VA_ARGS__), \
>> >> +	MACRO__(0x56B1, ## __VA_ARGS__)
>> >> +
>> >> +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
>> >>   	MACRO__(0x56BA, ## __VA_ARGS__), \
>> >>   	MACRO__(0x56BB, ## __VA_ARGS__), \
>> >>   	MACRO__(0x56BC, ## __VA_ARGS__), \
>> >>   	MACRO__(0x56BD, ## __VA_ARGS__)
>> >>   
>> >> -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
>> >> -	MACRO__(0x5696, ## __VA_ARGS__), \
>> >> -	MACRO__(0x5697, ## __VA_ARGS__), \
>> >> +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
>> >> +	MACRO__(0x5693, ## __VA_ARGS__), \
>> >> +	MACRO__(0x5694, ## __VA_ARGS__), \
>> >> +	MACRO__(0x5695, ## __VA_ARGS__)
>> >> +
>> >> +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
>> >> +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
>> >> +	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
>> >> +	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
>> >> +
>> >> +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
>> >>   	MACRO__(0x56A3, ## __VA_ARGS__), \
>> >>   	MACRO__(0x56A4, ## __VA_ARGS__), \
>> >>   	MACRO__(0x56B2, ## __VA_ARGS__), \
>> >>   	MACRO__(0x56B3, ## __VA_ARGS__)
>> >>   
>> >> +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
>> >> +	MACRO__(0x5696, ## __VA_ARGS__), \
>> >> +	MACRO__(0x5697, ## __VA_ARGS__)
>> >> +
>> >> +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
>> >> +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
>> >> +	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
>> >> +
>> >> +#define INTEL_DG2_D_IDS(MACRO__, ...) \
>> >> +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
>> >> +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
>> >> +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
>> >> +
>> >>   #define INTEL_DG2_IDS(MACRO__, ...) \
>> >>   	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
>> >>   	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
>> > Although the DG2 IDs look clean to me, but mind explaining me why are we 
>> > creating these sub-defines for DG2_D / DG2_E / DG2_M
>> >> @@ -782,9 +811,12 @@
>> >>   	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
>> >>   
>> >>   /* MTL */
>> >> -#define INTEL_MTL_IDS(MACRO__, ...) \
>> >> +#define INTEL_MTL_U_IDS(MACRO__, ...) \
>> >>   	MACRO__(0x7D40, ## __VA_ARGS__), \
>> >> -	MACRO__(0x7D45, ## __VA_ARGS__), \
>> >> +	MACRO__(0x7D45, ## __VA_ARGS__)
>> >> +
>> >> +#define INTEL_MTL_IDS(MACRO__, ...) \
>> >> +	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
>> >>   	MACRO__(0x7D55, ## __VA_ARGS__), \
>> >>   	MACRO__(0x7D60, ## __VA_ARGS__), \
>> >>   	MACRO__(0x7DD5, ## __VA_ARGS__)
>> >
>> > Following up on my last comment, if we are creating sub-defines, the 
>> > design isn't followed here in MTL. MTL_IDS extends to MTL_U_IDS and a 
>> > bunch of singletons. Or, if there's a reason behind doing so, please 
>> > help me understand.
>> 
>> This is verbatim copy of the PCI ID file from kernel to IGT. There isn't
>> all that much point in debating the changes here. It's all been done
>> when the changes were made in kernel.
>> 
>> BR,
>> Jani.
>> 
>
> Changes should match given commit SHA1, in this patch they don't
> or am I missing something?

There have been kernel changes to that file in two different upstream
branches. The branches will have different content until they get merged
together in the future. I presume the file was picked up from drm-tip,
in which case there will be no permanent commit id that will match the
contents of the file.

But that's really not what I was commenting on previously.

BR,
Jani.





>
> Regards,
> Kamil
>
>> 
>> >
>> >> @@ -817,19 +849,20 @@
>> >>   	MACRO__(0xE20B, ## __VA_ARGS__), \
>> >>   	MACRO__(0xE20C, ## __VA_ARGS__), \
>> >>   	MACRO__(0xE20D, ## __VA_ARGS__), \
>> >> -	MACRO__(0xE212, ## __VA_ARGS__)
>> >> +	MACRO__(0xE210, ## __VA_ARGS__), \
>> >> +	MACRO__(0xE212, ## __VA_ARGS__), \
>> >> +	MACRO__(0xE215, ## __VA_ARGS__), \
>> >> +	MACRO__(0xE216, ## __VA_ARGS__)
>> >>   
>> >>   /* PTL */
>> >>   #define INTEL_PTL_IDS(MACRO__, ...) \
>> >>   	MACRO__(0xB080, ## __VA_ARGS__), \
>> >>   	MACRO__(0xB081, ## __VA_ARGS__), \
>> >>   	MACRO__(0xB082, ## __VA_ARGS__), \
>> >> +	MACRO__(0xB083, ## __VA_ARGS__), \
>> >> +	MACRO__(0xB08F, ## __VA_ARGS__), \
>> >>   	MACRO__(0xB090, ## __VA_ARGS__), \
>> >> -	MACRO__(0xB091, ## __VA_ARGS__), \
>> >> -	MACRO__(0xB092, ## __VA_ARGS__), \
>> >>   	MACRO__(0xB0A0, ## __VA_ARGS__), \
>> >> -	MACRO__(0xB0A1, ## __VA_ARGS__), \
>> >> -	MACRO__(0xB0A2, ## __VA_ARGS__), \
>> >>   	MACRO__(0xB0B0, ## __VA_ARGS__)
>> >>   
>> >>   #endif /* __PCIIDS_H__ */
>> 
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
