Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA3FEE49BC
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 15:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933EF10E00D;
	Wed, 11 Sep 2024 15:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLZVxYIS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A001C10E00D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 15:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726067408; x=1757603408;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=NZ7kkiXXdDgPf6GNpzF254KzoULypxCl4ogek1BaPig=;
 b=HLZVxYISeu85KE/itkNpOg6z6u5M/HppscMDyhdkNmUBR5f24WWwkEvC
 LeHfh0+oiZVibAQuGN85cfUJNUsmywEhPF7W6et+IQtCa52WlpYt+TX4p
 hZU836UJwbVgIcYbXxp5tg8T8h4HNIcp1eBdCtJT+U+jOBz8rFA3F0Gdz
 FJ1SUPrbxVM4jXLpDHunuaufeanv4H0pGjC6iPDmBc5q2mRViLzXEeJR4
 IFbmss2g6GWXXLgzdid0SpNedD8RTDkfLi5gsqblcwfd8O5UCQ3vca11b
 9EisD2NIuwWUHAcfUMwIYriCwoYlr1dUx3QAaCYn/dRM3Nz6s658c8Kmm g==;
X-CSE-ConnectionGUID: J4trQkXqS2GW5UY9lzYZqw==
X-CSE-MsgGUID: 3vHpeGDMTxGBL1bos8XYWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42349102"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="42349102"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:10:07 -0700
X-CSE-ConnectionGUID: 176Wxb2DTnCVteMh9Jla4Q==
X-CSE-MsgGUID: 8ceH8U3+QCixrILnTdftWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67337015"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.188])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:10:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Piecielska,
 Katarzyna" <katarzyna.piecielska@intel.com>,
 igt-dev@lists.freedesktop.org, imre.deak@linux.intel.com
Subject: Re: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for suspend
 without display
In-Reply-To: <0368307c-3c7c-4167-a122-8f27a7bc36e3@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
 <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
 <172434871596.2055.1015145340873010177@gjsousa-mobl2>
 <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
 <172468301865.6014.9946879676247551400@gjsousa-mobl2>
 <82a8af36-642a-4747-b085-924c02e6308e@intel.com>
 <CY5PR11MB62119DD080EF001546D7D41C95942@CY5PR11MB6211.namprd11.prod.outlook.com>
 <172476290898.3066.9682588878616653824@gjsousa-mobl2>
 <CY5PR11MB6211B873C18594896BD21FA295942@CY5PR11MB6211.namprd11.prod.outlook.com>
 <44e18951-3b9d-4aff-a590-efd39e0a7a70@intel.com>
 <0368307c-3c7c-4167-a122-8f27a7bc36e3@intel.com>
Date: Wed, 11 Sep 2024 18:10:00 +0300
Message-ID: <87y13yi5vb.fsf@intel.com>
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

On Wed, 11 Sep 2024, "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.co=
m> wrote:
> On 8/28/2024 2:16 PM, Sundaresan, Sujaritha wrote:
>>
>> On 8/27/2024 6:24 PM, Gupta, Anshuman wrote:
>>>
>>>> -----Original Message-----
>>>> From: Sousa, Gustavo <gustavo.sousa@intel.com>
>>>> Sent: Tuesday, August 27, 2024 6:18 PM
>>>> To: De Marchi, Lucas <lucas.demarchi@intel.com>; Gupta, Anshuman
>>>> <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>>>> <sujaritha.sundaresan@intel.com>
>>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; igt-dev@
>>>> <lists.freedesktop.org igt-dev@lists.freedesktop.org>; Piecielska,=20
>>>> Katarzyna
>>>> <katarzyna.piecielska@intel.com>
>>>> Subject: RE: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for=20
>>>> suspend without
>>>> display
>>>>
>>>> Quoting Gupta, Anshuman (2024-08-27 06:29:06-03:00)
>>>>
>>>>> For s0ix DC9 is the pre-requisite rather then DC6, DC9 does not have
>>>>> any depende ncy on DMC.
>>>> Maybe DC6 and DC9 are pre-requisites for different S0ix sub-states?
>>>>
>>>> - BSpec 68851 says that DC6 is requirement for S0ix.
>>>> - BSpec 68857 says that DC9 supports S0ix with more power savings than
>>>> =C2=A0=C2=A0 DC6.
>>> DC6 is pre-requisite for runtime s0ix with PSR Display On use cases.=20
>>> Which is irrelevant for system wide suspend.
>>> Thanks,
>>> Anshuman.
>>>> --=20
>>>> Gustavo Sousa
>>
>> Hi all,
>>
>> Thanks for the comments. So if I have it right the only final change=20
>> here is to switch the param to disable_display right ?
>>
>> Thanks,
>>
>> Suja
>>
> Hi all,
>
> Gentle ping on the above question.

disable_display=3D1 will still keep running display suspend/resume
paths. You just have all connectors disconnected.

I'm not sure if you can really fully achieve the goal of testing
suspend/resume without display.


BR,
Jani.



--=20
Jani Nikula, Intel
