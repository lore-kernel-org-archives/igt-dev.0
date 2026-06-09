Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796CBCD8C85
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 08:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFB910E18C;
	Tue,  9 Jun 2026 08:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aR6lkfKB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D2D10E189
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 08:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780992684; x=1812528684;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Izcm+rc0vHZQpqHklnZm48855gInLprLxJk4asyE2Qg=;
 b=aR6lkfKBLPRBAFSp1y2t+46ZseCybTvFBp2iXr0R1lzsEEJQqSupASzD
 X3+wswLfR6A1jtdH3C/GZO4tCOXrGKhSJgBsgAJsSJAcX0dliTnpJCQ6U
 eUej07aRRgGeNSHs/AvDqnIM3vpe9Qh2c2pOEvWNxH3aYm2FRvrJTAkXa
 6HifHf4Q0ytKiL2zZcUxYVeFAjQTdAWLgcogF01BBgtzf0qMrA7WHSfYZ
 H521wBTzzEQxcCDt7c/waQY1T5mwiHAmjtkZlhnNId447O1JCI1nDlez4
 XVYmGHDuwBLckhKTi9Evoxl/O+gD8gc5qgvileh1R+NeKOo3qnnVGhhN4 g==;
X-CSE-ConnectionGUID: VcXFI8iMQ9S9L+yL0CmGIA==
X-CSE-MsgGUID: CESRjBY8SjKZjXYUE1SEsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92310460"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="92310460"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:11:24 -0700
X-CSE-ConnectionGUID: jAKcqMgLQoO0CjrIAxIYlg==
X-CSE-MsgGUID: 0GkUhTNHQUyVLngvliO/bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="241343364"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:11:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:11:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 01:11:23 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:11:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8XC+bzgPTKLZeWUE/jMpnD0ZS3+BCYU+j9aw6daF6Jbkre7wRq8oq5wyBk6F8lTHe30yLYH8MZhDzsbfEJEAzpXnHXhnc10a73sUhgiRsHzKF8GD75BwkOB5nkecBHUsDLKjuojWQPIO7BwPwkJ43oiNpWNb9h84eumW3w2yzFR80G9TazC7VX1ukT37NX64DdD4tyz+8HAQCzNrfD0958AmPiWZbkXTN0euRYs1MwRV0FJWggNKJIOhPhe3o15KF/WgJB1fhmTnynpVujCHfvtyQwp0vPnN5ZYh6m0gO9Rpv28Oroq//FmC8oAIqRKqPVsKdY01RhRvSTy2Tc+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gNbcQd+0dhmugfh9ZFsJ42GOP0M146vr7y79M0hokU=;
 b=zMOhlT03TOk0DyNDnXIb23KU6sq+JH8NLU1h1blTwdcXa+vGcsnRtJVTSdeBWyshvCpCZN5dDhOFQrfax6z6cmXo8EY1QmrcLvo3F9o8Al8fJi0bQ3PYR9DsRufvv2xHER0KM//SN7gdLADFBxrN5jPI0Dia083BHjqPf+A474/UXIwuZr8G9aG0sVOv+A2XP/aHlln67lzAG44OkD/2Ol3UuJlRG9Wrofva0PxBDO4WYkjN2zgRCv8wBdabmpTunxfK/jACMCecDyFtFArQZwng1P46gi8dqrbWnlHMA0UaNUqYuFbcKi2zHouKUCSmpogXoDaCQr9XlyCPvQWYSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH3PPF37A184CA6.namprd11.prod.outlook.com (2603:10b6:518:1::d15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 08:11:21 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 08:11:21 +0000
Message-ID: <0c91b9c1-1317-4e2c-83e4-d255f2ffeefa@intel.com>
Date: Tue, 9 Jun 2026 13:41:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v2] tests/kms_hdr: Use non-modeset commit for HDR
 metadata swaps
Content-Language: en-GB
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
References: <20260605192149.2601366-1-swati2.sharma@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260605192149.2601366-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0086.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::18) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH3PPF37A184CA6:EE_
X-MS-Office365-Filtering-Correlation-Id: 183dc678-22d9-4915-90b1-08dec5feb0dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: fD3mTdKnyiChBgtc1p3lKcQJ9YVPvx7ABuB3vsARGFn9LpNHtyEepwbxZh/lINE9rKUW+bLNBRfWV0g8bDowyI6iBcx1ebYfODKfW2AyX6blDh5HC+YKeSSc2NJ7dw8BZD45KLc6r9NWoxu1vARHEvVFM12lpxOd2aA0xbRAJ48BNTM4SBqvgBeDFSL9yhcBr0iI/eltF12lEjkQAKK90Ix9qEJbaTjh5AFNkPoCPQlXG2eeswgCzyrdwP/JBygvOzWAola1I/VaXa+3zj3gsyzwywpSnAUxykiafw/E0Z6NKzK3Q/p7GL7E8u3C+rOPAQiauJmnxy749bzeJMo+3d12TTWHOqushe6q75tzE6saKoK3suGsGuqXCOI8N3NfJpVg+OrkHhO8Hzw7V5mzVtKSUbqY3YAxFDMOF/VpILPTo7LQsENzgI3Pz08ohmo2cD5Us95abiwMbZTvHToiGLIw95ycm3qZpZfoHol1i515aaqxayfOQ6PFXmpTYYIvhT+oQUu+4a22ZOd6P5sYvrJmWr/0ocKgZ/LJsTJt+UnWd5W+9lV1v6jhn9SDMPhgyJIkboYpBfPI1BqyO75hS8J7UlmBNib36pXCG3rhtRkdJ4hK3jUWj9hQHA4HexEsdt30s2oNS0DCO9uvzMKUycJRgh9xVUO9GcRddw9OmE+yIXCN/hflWtRaBF4fIIZ0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWxLUXdXQ3plRTMyZ3NqOEZpT1JSUklld3k3RW5hVWVwdndjVVZjRWM5N3pi?=
 =?utf-8?B?cUh4NHhCMXYzZzlwRUxJdzRydHZzK090ejNhb3JGYTBCdzgvVEh0VWw0c1ZD?=
 =?utf-8?B?ZHprSGVvaUkvbkIvcnpmcTk3bEtDbFE0RDI2U2JISjRONkRzTlArdHROUldW?=
 =?utf-8?B?YmYvdmJFcXBqRCtiaWlCb3E2bTZEUk13UjBBZGExdUhLV0tSNXM3eG1TZEtu?=
 =?utf-8?B?ZWtzTGNnNmdCV1lGZXF1S3RqWFJXVm1pYWcvYkV2YUlsMkdJV0FsKzI0dUs0?=
 =?utf-8?B?MjlaRklTbmphSU03UTFhT2RBbjZrejdEcVdpb2xQRlc1akc0bW55Vkh4MGtp?=
 =?utf-8?B?VzcreVczbHc4QVZOVWltTXNvRlRodVM1KzhRNHdDelo3U21zaWdUaWoycUJr?=
 =?utf-8?B?aDN2aUU1enZCWm1EOG1Nc2YvQmlhK1ZyQ3dRTEZWZmJBelpLalpyOUtCOElP?=
 =?utf-8?B?QTJ3dytOY25BanA5bzQ5SjB4NGtYdGpYR3d6RnJ4amFBUUxpVnI3RDY4U0NE?=
 =?utf-8?B?VUZWb3BpNXB2WVpHaTBUVitUbzZyQUZxV2g0RzJkUTZYazRTVEhBUllmV2Nn?=
 =?utf-8?B?Y0hlQ2FYVGpkbjJOdk8yYm95NGtGaVk5ODBUWXU5RUdBRmluYkFlWlZ4aDFM?=
 =?utf-8?B?S2d5VE9VeUZhNzVWTVFvTFRlaGUwWkRMRzBhbFhXV2tuQzFOKytmVU9zTmhn?=
 =?utf-8?B?R2R4NXhCRVg4Uk1EYy9BazRZYkFkSnhIeTR4aitmM2lYaUplaktOLzFOS2l3?=
 =?utf-8?B?S0l4c2RPOXRuSnhtdjZXRWVkVnl3cWtFdHVoUWk1YXBOMGYxd2FaNzlURGt3?=
 =?utf-8?B?WWtOTWxkMFdISC9kSlBIN1gxa2ljWEZMQzJSMFl4WFowR2hiUmdTRC9GaU5K?=
 =?utf-8?B?c3F4OXFKUWZwWHBTRFErcEptUGlpUGJnT0ZtMlFCZGdrcWZ6T1NKenIxTkhU?=
 =?utf-8?B?TWs1b3Ayc0VxRktqMHgwNW41WFhJdmsrRkM2cVNueG1oZ0ZidFdOL2dJWENN?=
 =?utf-8?B?bmhkT1h1NGtSenNUejNPODNIY0grcUFyWXJvVEdhd0tlYml6VHB5YTM5Y29x?=
 =?utf-8?B?bityV09FVTc4WXJXNkgvQ3pyVlVGVEI4aTR3bmN0bTR3ME9nOTV5SmljS015?=
 =?utf-8?B?NjRXVDV1K3NRMFVXR1ZrRTBqcG9ReEhCeFVtS1VaWFI0VGxZT05GTEprRnlu?=
 =?utf-8?B?UU5aNXpuOStYNkpGV3dJZEtjVGhKTU51WTNyQUJIY3g5RnVzRVY4ejdJYjl5?=
 =?utf-8?B?M0syaWpCYUNDTmlSQkdUbmhBSjMvYkVITUR6OU9oT2htUFJGL0FpZTVHQ3A4?=
 =?utf-8?B?eXZsTUlTekFTeTZ4STZOU21xNzdaMTdzK2xlUVBkMGN2anBOZ2pLTTQwVGQw?=
 =?utf-8?B?Nk9YUzJQTERLK3dhdTZOZzFoc1AweUI1MXlLNW1idFFXRFFaN0hYV3g0NmdF?=
 =?utf-8?B?bkJxdURMeCtqMk1kVWppbmJaR3dVc05ONXZKazFsUU1qUmNuTnZtenZLdjFt?=
 =?utf-8?B?TmdWZXNVSW5rZHJRS2lnQzRuN2NEQmVQRnRxbTlDY1lYTXQwMnRyQ1lIYnh1?=
 =?utf-8?B?d1EvMzlkdTQvajJZMDlhRjNQMDI3NjBsR21GeGx4NjFPVTBjNmVWdmhKZkhL?=
 =?utf-8?B?YWtLQzhpcDBvd3kvak5YOUZXK3R1QzVzYmRRQW01bXVtNlNaVFpGZVIyQ3Ja?=
 =?utf-8?B?VEtMempJUmE5bllIdG0xc1RBTTAwd0s3dE5SYTY3clh5UkszT0oxaldxZDU2?=
 =?utf-8?B?KzJKT1ZwR2djQkUvcnMyWktOK3JkL2g2MkJRcy9SUlg0WTRHR1dvZEFQcUZ2?=
 =?utf-8?B?L3lSQW5LV2NCRVZHRzZWeGhVUmxETWtJUUhIRVZyQXdSUWc2MmNqb1ZUaFYz?=
 =?utf-8?B?NXBGSmg2STIzTnlhQVgwZjZqTXk4ZWlVSS9VazVUMVRmUjE3cGo2TU9zcjdp?=
 =?utf-8?B?dXhTNk9EYWl2N2wyY0VGUEFIa1BwYndQT2UyZmpaUFJOVGRqSUUvVjRlOWVD?=
 =?utf-8?B?bEoxU2hLdExsNk4xTHdveXdFYW1SbjBsOXVzcFN1ZnUrTWQxKzdoOFQ5Y20y?=
 =?utf-8?B?SXdHZlJpVzVOeEQreEZhSG03Q1VDS21xejJTdmllNGVzQ1FrbGV5K3doaTFt?=
 =?utf-8?B?bW5ZRU5PcHZvQjFEcHJRL3Y1WDRQL1RUM1M1N3hMUUppVU8ydGZmQXk3Uk0v?=
 =?utf-8?B?R0tIRStxTDBROXRreFpQYng2OWlpYjN3cUhoVFVkUkl2RTN0NWRjaFoxaUx3?=
 =?utf-8?B?SWw1MTFNUHlYeUNkeFc5THg1ZndlUHUwR214MTAyNkFIZnMvYTRPWWNvT2kx?=
 =?utf-8?B?WEEwTklWYTZCVyswck1ncXppMzlaMzN5bHpKcDQvbVJYZTM0S3pXZFQyMWZ6?=
 =?utf-8?Q?4AoMugFHHLMb2Zdo=3D?=
X-Exchange-RoutingPolicyChecked: rmXZCdmyeRhoyO+PDmUX9TrutGJEG4fEmykhNpY3hMdiBCfr/bq/ZQYo7JtVvb9+0+hFvgVUVb1K5EzzdAbPtgZjefbu05dD4jrBRWByLE2sY94F5Y9JOVgRsVVq2cDe/ukJ6qqEQyTRGgnVGNPHcO6WmdxLja/yzpuF2LOQ88crGmw1L8q2dj4cLhsFobsNASTHosl7LLGoImnY8l9ShxMc/Fo02+b5rkWYEeaSRYobxV8ipbOA0cXb3ehV+SoKp6NHhFOJznGuoEu69kwm8wASNvX93Lrskz/brhkiORRMz3q+BOKMyPQIcxI9YozSqtjmhNFfZl7h3Q5Y4IRmZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 183dc678-22d9-4915-90b1-08dec5feb0dc
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:11:21.5916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5mmlffjA+97ntkFKxNzF18IYm2mIBHQyR1sMdc2Uvr/M8r9UnrRtgDt3XDMY3NYKD0pr6X2HlcDfjyZp4jRpIwKrYWamx+Z1GQv1Pf8rTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF37A184CA6
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



On 6/6/2026 12:51 AM, Swati Sharma wrote:
> HDR metadata transitions (mastering info change within HDR, and
> HDR-to-SDR via metadata) should only update infoframe content and
> not require a full modeset. Remove the is_amdgpu_device() conditional
> and use flags=0 (no DRM_MODE_ATOMIC_ALLOW_MODESET) for both drivers.

all drivers.

> 
> When DSC is forced for the SDR transition, use a full modeset since
> forcing DSC changes compression parameters that require a modeset.
> 

that might require

> v2:
>   - Use full modeset when TEST_NEEDS_DSC is set for the SDR transition
>     instead of documenting it as a known issue
> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_hdr.c | 22 +++++++++-------------
>   1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index affd38887..d786f7f9c 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -459,32 +459,28 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>   
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
>   
> -	/* Change the mastering information, no modeset allowed
> -	 * for amd driver, whereas a modeset is required for intel
> -	 * driver. */
> +	/* Change the mastering information, no modeset required
> +	 * as only infoframe content changes. */
>   	hdr.hdmi_metadata_type1.max_display_mastering_luminance = 200;
>   	hdr.hdmi_metadata_type1.max_fall = 200;
>   	hdr.hdmi_metadata_type1.max_cll = 100;
>   
>   	igt_hdr_set_metadata(data->output, &hdr);
> -	if (is_amdgpu_device(data->fd))
> -		igt_display_commit_atomic(display, 0, NULL);
> -	else
> -		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_display_commit_atomic(display, 0, NULL);
>   
>   	if (flags & TEST_NEEDS_DSC) {
>   		igt_force_dsc_enable(data->fd, data->output->name);
>   		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>   	}
> -	/* Enter SDR via metadata, no modeset allowed for
> -	 * amd driver, whereas a modeset is required for
> -	 * intel driver. */
> +	/* Enter SDR via metadata. When DSC is forced, a full modeset
> +	 * is needed due to DSC parameter changes; otherwise only

might be needed

Otherwise, LGTM.
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> +	 * infoframe content changes. */
>   	igt_hdr_fill_sdr(&hdr);
>   	igt_hdr_set_metadata(data->output, &hdr);
> -	if (is_amdgpu_device(data->fd))
> -		igt_display_commit_atomic(display, 0, NULL);
> -	else
> +	if (flags & TEST_NEEDS_DSC)
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	else
> +		igt_display_commit_atomic(display, 0, NULL);
>   	igt_debug_interactive_mode_check("traditional-sdr",
>   					 "SDR pattern displayed with traditional SDR metadata");
>   

