Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98E7CED263
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 04:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651F310E457;
	Tue,  8 Oct 2024 04:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jH4jIqCm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347DD10E222
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 04:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728360812; x=1759896812;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J6dZtepKI4pvBIwaR00erPGQCWIdIIOTAogVoqGCXWQ=;
 b=jH4jIqCmu1bSHUKzsZjvAtLFKBO2uWI42DNqWV9MT60m4gnhN1Hz2pkr
 KtBThvzNK7GcY9o/NgiKjnMf9rwXCbtqb0OIDaMF2IyASjJ/I7oCRxrFK
 M2K1YStF1ZRg13tLERaXrT4WRRIw8RpBqdrKxH+tcc0Q/+eLmIUHLkprA
 8/fLZIttXfUY9gS6diOXA/JlSc3j39zveHc86nJiDEvyGI0xtKVX6KLUd
 /mjhZp8WRiFbRmfND89OOFxNkM7ZfqjK1JRfkn7S9hwliXGkQtSYj5qfs
 Sx0xaDD/3yh4FdG8Oq9yVDGf5e2j8Ig/yRxR1oxJUqteUmyRSAM+Duagg g==;
X-CSE-ConnectionGUID: qEgrhuNpQkS6lk08nJNpjw==
X-CSE-MsgGUID: OXhP27TeRCOYynJoCUvMaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27619957"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="27619957"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 21:13:31 -0700
X-CSE-ConnectionGUID: RffIaYhgQYuKCogO4MnpEQ==
X-CSE-MsgGUID: o3e70Hz6TPuUwwv1DHVnKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="75666872"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 21:13:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 21:13:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 21:13:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 21:13:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 21:13:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnNWVa71OZTHfWebx++oKmy8Ull5RKq3KsQW+F3kJwYfWpxaJfmG77vildEE61YwQt+6i9OTRCRKYeI8ETx85Ry52y7fNdGCoJVuoOy82f50pE+CczOADME2bz74nbYu4ArMx7Es+30XWGFpz2d68IsO0f2UkoBiBBkgS2KbArKmQlIF9pySnJZT6AGUg68LUR01xGw2PXJjCkcHV05ANViIWomVgsjfeNJSqdd9mxEdst9jQ3zDX70ZeXLf8VDu8wi5d+iBczvBQ7DMNra8B+6qytVg2eDgzkXb9HA/59d2MMvOEbks133XW9dA1jhsLdoBo89dS+0KinaT52GYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4O0KyRaM7ir97DL8hIWYel2433+if+8CQp/2gEe+tE=;
 b=Rv0ocWOdk9Aa6vziDtyQfsoHYRqQHeBUCJfhRJfnnbMVyN1+HA8wTsucEiAPWHK5TDbuWNFbdknugtu7Py+zLVNLAHNzpPA4QdtheI52o6dTRzA3eJF/zlCOOPeJjVkTM5+RscuyJK5ZDsYvdFfY5z2caX7c7yjj5ABV/cfuwxpHeQ4N1/bFoOPskAabWqsFcszCeTPu6hWq22LJhYupc+Tlfa2Dxm/1rOC0QWOb1AcwH3w0DeRz4Cvfej1gBnTWLDiPYzhzQ4ac5HWgUa/o6GA3tMkHFwDEC7+P0Xal6VHpMxkoGymjZl0il3qN4feDpa/Zu/5sn8L1PRZ63yrP0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW4PR11MB6837.namprd11.prod.outlook.com (2603:10b6:303:221::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 04:13:28 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 04:13:28 +0000
Message-ID: <09afdbc1-10e7-45cf-a166-9335ca25ad30@intel.com>
Date: Tue, 8 Oct 2024 09:43:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_pm_residency: Limit max usleep
 time to 50sec.
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>
References: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
 <20241007172356.1747943-2-himal.prasad.ghimiray@intel.com>
 <BL1PR11MB5445B1317311741B69A8BAB8E57D2@BL1PR11MB5445.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <BL1PR11MB5445B1317311741B69A8BAB8E57D2@BL1PR11MB5445.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW4PR11MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a4a7d7-6ce4-483d-ea31-08dce74f900c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGdHRmlORHBsQzBCbHFiZDFReDNDN0RoRzJFeW1XWmozYzdDMk56QXdtaVk4?=
 =?utf-8?B?QWRhSEVvb0pyWnREbzh1RU9uRStxQ05QbW82bTZkWVhZT2MvckU0WjNZTmFn?=
 =?utf-8?B?ek9hU203d3d1QTFkcjk3bjZ5VFEyV3JhUmhHYWQ5d3NCZDhSZnRDVHlGc3lY?=
 =?utf-8?B?dFl2cnBUeG9wRVJXMVpxa0lXcWMzdHBHanJ2R1FHNjVrcnNKbnlaQ1crVzFy?=
 =?utf-8?B?Mzc0czhzVHNaMUNHU0QrQTdrRllWZEE3bkFPQUhGdXdpbld4NW9Qd0NUaWlW?=
 =?utf-8?B?amhqSVZQVHpwUjlDUXNiWUlrNk9UZFJmbG1SZm9TMWQ1K05ISXY2aTFqeEdX?=
 =?utf-8?B?SUVUOUFrdk9XZkxzQjZwWms0SmVxRzlRNXI0Y2dDb3Vva2xITkVWd2dVa05Q?=
 =?utf-8?B?ajRJY3hGa09XVy9MMEU2NEhyMlYvck1RSVFIR3VMK3NyQ3gzeEExYnpjTzFM?=
 =?utf-8?B?Y21yTTNSL0J0eGp3Uk5OOS9tLzlpWGtzdGhodFR5amUrenVYMFhQaFg2aXV6?=
 =?utf-8?B?QzQ5bUg4TlVmVHpyNmhGeGN1UElGTjZqcHUwd1BEK0VhUVVDN0lWZ3g4aUtn?=
 =?utf-8?B?cG1JL3Vab0VoMHN4Q1IzRXN4RkFuSzBIVDd0dE00bFU2UTVxSDdrTUdDK2g1?=
 =?utf-8?B?aTE3WERGN3dibjM1UGo1aHo5ZmVXL1dxRTVDSFY3RldwdTdMMUttZ2VidWRP?=
 =?utf-8?B?ZzAwM0kzbjVGTGk0ekV4NWVLN0I0dnpOV0JoQkc3aC9HVzNqWmQ0MkQ1SmtP?=
 =?utf-8?B?TXk0TlM5TURmR2pQdmFpekNzYzVWZEZUckNuUTJCNTdScXo5ZG9Xc2VpTlJR?=
 =?utf-8?B?OWZ1VVNDUnpMWDc5OXRZZ0JaclRxUXR1UzNBRkNuMUxOQUF5SkhWSU41czU1?=
 =?utf-8?B?MTJPZWNhS3BENmhpa1E4S3FwZ0t2MVdLZHpUTWQ1S0hxWEpoakk0Y2ZTZ3lS?=
 =?utf-8?B?L1l0UENwQU4zZ1FnS3BGNllyOUFvNUVISGhwZlh2U3M0dW1sUVNURFZRMDdU?=
 =?utf-8?B?bDIyZEdoNHpSRzNTaUVvcGFselRXajV6S1VlWHdmQmc3MmdYZWpXSEdOSjRN?=
 =?utf-8?B?UVdYUFlFTDZwbmdvRG1BVzgraVdkREpscFNrSE1HbUZ3bUErMllUWFN6SGRI?=
 =?utf-8?B?RVpUT1R4ZXpUWFJRTUhMdytEZitCa1UwQ2VvaDhhTmp3bCtoSDF2c3ByTTY2?=
 =?utf-8?B?WVdSd0JaZC9qazdwSUtkbDFBT2JyY29kSU9yUGVaYk9wRlVQcVVWQ0Z1cDZ6?=
 =?utf-8?B?aHBlZG84MXdaTktvcVh5T3lZS05mcnVHME5LMmdDUE1iQlMxWUtpajVDRkFK?=
 =?utf-8?B?Z0g0ZFJWWjlmZXE2UlFJRWtleTNSc04wRlhoT2ZmMWRkRFVqUnVsQmU3WmZx?=
 =?utf-8?B?Ukt4VTZ3MnZ5MVNxMVdDWk9Ja2s2ZURXRGxlbWVYVXJZcXZNU2FkYnFNQS9F?=
 =?utf-8?B?U2RGSGdwQ1d1SEwzRStHKzF5NlpRZlBKTDVoYW5OY0xDMnRGSC82eC90Ynk5?=
 =?utf-8?B?WGxiMFZMM09PSkhoVWlTcFB3SjlKMWtTWnZtQnBpTTFKZTJUZElGc21GRnJh?=
 =?utf-8?B?VWFXMFBUbEdvTjgyZFBYei9sZjJDcHdmWlFZYlNseXZGMk1aekZybzJxdGhX?=
 =?utf-8?B?eGk5UDZJbTFwR3l5R3ZVanBsSmtRV1Y2N1dmU0U2Zk92ZTRUb0VkUThxODRx?=
 =?utf-8?B?K25IMUpUd1l2VmxXSDZLeDlUMjlVbFdNWGtUcU9FaUJ6aXBIZDdnbmlRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3cyZzI1OE02dE9zM2t4dDROSzhJazExUTBDcHNkR1QwbkRma25EQkxjR1ZU?=
 =?utf-8?B?OXgrcER6ZFBEV2czbkZ6ZjVTaHJiVTlwM3FFaHlsUU9SRUM1dHQxLzU1a1pH?=
 =?utf-8?B?b1dFZUVGdGxjQUp2aTZDTThEMjQvVzNiaEQza21ZOU9qam5HbEkza00rRGww?=
 =?utf-8?B?bnhOR3pzQ1ExVUVTd1R5MTJFa2NzeHRSVFU0ZmNPWnNXUVRickpZajMxQXpR?=
 =?utf-8?B?Rzg3ZUZpc1ZvYnpzNUEvRXlqak8zWTB3eVZzMXdEbHpRdk9nQ3FvQk5SUW51?=
 =?utf-8?B?bzRTbFNiZHlmaDZhSWM3KzIxVkJJSzlWZkFySU85aDIyZ3JxOFg0MnpiWndQ?=
 =?utf-8?B?YVVVMmRvK01YYUZaN3RUbVVNVFFkUnNhS3NmM3hubFprRWZKWTVVcUNPWGJj?=
 =?utf-8?B?cXd4V001aTVtRTBra2lNWEUyLzAvTXZWelhIUWdqcy9EUDZhOS9UTXVqajlV?=
 =?utf-8?B?WHIzQlFjOTRDbUVsREh3NGIvV1FjSGpyT2JkU2hQeUhkMlpub2JjSENndXg4?=
 =?utf-8?B?aHU0YjNwU1VrRDJOL3FaZi9pWEtiSHRaenV5K0tkZ2NXRGJUc1pTWkoySWZT?=
 =?utf-8?B?c1NwU1NVOUo0K2lPT2hoTm9EM2pId3NUOGVVRkc1WjBabWFHVnZvTUpzbU5I?=
 =?utf-8?B?bmRJMEZrc1pvdkhVeUZZMVY1d01mVTB5ckVHL1Y5UG1lbDI3VzJkUEZ4M0RG?=
 =?utf-8?B?b3JmdUZRaTllNjBydjRKVmVQUjloeDZzWk9VL3FjeWlTUWgwa1FjbnhvMXNR?=
 =?utf-8?B?L0JqeWxOQ05rTjc5S3FCYXJZRzhXMDFuS3RrVmZGMjA3WVljVENxY0diNzJx?=
 =?utf-8?B?QVp5SEV4Q3VSTFFYY1hyQ3Rwa0ZlbFhoSTZYYjJENU5scFFtejZ3VmJnSUJJ?=
 =?utf-8?B?VlRUMzJUUU15RnFxcVpkQkZTSGZIRCtTTDBobG5UWS9jTTVCeUR1RE1kRFQw?=
 =?utf-8?B?aThaMEIzeEtvcDROMHpaNUJKWnpIRjRXcjQ2Vzd0TDNYUmptZVZRSndTM3BY?=
 =?utf-8?B?eFZZeno4eUlVU1hYbGN2Q1FjRklDRGhQeTd6cUJFVGdhMGJuSGxqblJjOGhx?=
 =?utf-8?B?enloUVlXUWg1UjdCNDlBK2IvMVBVLzVmZCtPUzR5bUxESHgzTkhCKzdHZVN5?=
 =?utf-8?B?T3NsTGpTUVJOMzZZamdWN0NvZWxxaExjQ0ljQTdqaTRDbDBnT0NyM05RcmVk?=
 =?utf-8?B?eldKcm1oZU5YSEhYYkFCeDZNSTVNdTNDWGNMa2JDZHJCOGN3R0dxSGJOMDdy?=
 =?utf-8?B?MSt6U2xPUUdYMFZ5OUx4L3habUMyVVdvZi9wVDhzWXdPQk1lS2pxODJmR0NI?=
 =?utf-8?B?UTJSbnlyTDZSRVZ3cXRKek45STBqTUpzRlV0ZWVka29lQkt3OTUrZE1Ydzkx?=
 =?utf-8?B?R21nSU9qS3lpQ1pvZEZNVWk2N0ozU1FPTWdBalVKeTQ2WWE0UnZTZVk4bzU0?=
 =?utf-8?B?aUFOVk1iMXdMeVlzUzhFdEhwY2w5L2VPTitmUzF1dGF4UUx5bzJPWFVxUnBt?=
 =?utf-8?B?a3NvTEw1d1ZKNkJiUitIRHk5UUZhS1ZGMkl5SGIxUGVQMWpGR01yQWVXMFpD?=
 =?utf-8?B?OFlMTms1WGoxSHp6dWU2cnI4aVA1NmllaTRCZFdEa1lHYk1iY1hDUWROb1o3?=
 =?utf-8?B?YWhUOWl3VnZNUHVPTWFRR1NWY0ZaSEhKOEg4UkpNbEtydFNXeDR4NUZKOUlk?=
 =?utf-8?B?eEZVMVdlZFYxQUZ1UEIzWlBpWHl0RWZlN21pUWR3Y045QUgwMnEzVFcxZk9B?=
 =?utf-8?B?cUNuM1pBWXJCa1F1MEhlOFJvZHBBc0hsUmNsTmkzMXdqaUt1NERDZGJRY3Ar?=
 =?utf-8?B?UFA4Z2NQSHNURzJsOFI5V3Btd2pTenMwNUowSXRBdUN4OXZ4K0E2b0ExL2pV?=
 =?utf-8?B?ZGRjSDFSUXkzcldTRmpteDBCS3lqOW9WbkMyM0xOM1ExM2RkTm1JaGswaFk0?=
 =?utf-8?B?ZDVjNDRCV1FhNXZTOElPejZIcTJBREdGOWticTN2U2lRNDN6a0kwcXNpaDJk?=
 =?utf-8?B?L21pK2xNUTltdUIzbFhkSnFMYmYxZUV6WnhWQSt4WnJ4aTFBSnc4L2Q4eXR5?=
 =?utf-8?B?RGl0aEVHR2JqcGRrTjBIc29pdUdDTHBQT0xiNjIxYkFsNHM0dG1DYWRBMmhj?=
 =?utf-8?B?Rk9CZE9TbzQyZnZ0SUJHbW5qekkzUlJtRXUvaXB6NlB4TjBTaGs3dFRQQVJT?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a4a7d7-6ce4-483d-ea31-08dce74f900c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 04:13:28.7696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1bbtnoYWzyQ9kzaFSToMyrOBvGtypICbO0qn4j/gBf5w5t4s0Zq+SugXGQmU5E8YruHv/l8mqSXkSQtpuTECUdUmzTU6Gslrqb5Jm8WTys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
X-OriginatorOrg: intel.com
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



On 07-10-2024 23:02, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Himal Prasad Ghimiray
> Sent: Monday, October 7, 2024 10:24 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/xe_pm_residency: Limit max usleep time to 50sec.

/s/sec/milisec.

>>
>> There may be an approximately 1-second delay between xe_exec and
>> xe_sched_job_run, which could result in the usleep duration exceeding IGT
>> timeouts. To address this, limit the maximum usleep time to 50 seconds

/s/seconds/miliseconds/

will fix.

>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> Seems good.
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt

Thanks.

> 
>> ---
>>   tests/intel/xe_pm_residency.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>> index f4d05889c..a86107eca 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -150,7 +150,7 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
>>   		 * Execute the above workload for ~1% of the elapsed time and sleep for
>>   		 * the rest of the time (~99%)
>>   		 */
>> -		usleep(elapsed / 10);
>> +		usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
>>   	} while (!READ_ONCE(*done));
>>   
>>   	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
>> -- 
>> 2.34.1
>>
>>

