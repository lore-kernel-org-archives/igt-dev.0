Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DCAD3B7DD
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 08:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8FB10E0F2;
	Mon,  8 Dec 2025 08:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1IsmNQq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098D310E0F2
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765181346; x=1796717346;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GhZrkQmwd/A8LXnd6lFmPY4Tp92Rnw04E0K8aEydSNE=;
 b=M1IsmNQqrPPgUqM7TTxDda1/7lHtHstR4hsE2qebDu0ICxVsgJYrVmXj
 boAIKrYr03LSv71h693sc4WeSsL0w1tgjgku37eK5pfsY647PrKs/CcAE
 674MpiSsgHp35o7B8QZJHfAhU1iAgO01GnNOsTHsmRbkx3q2ybTxaIVaQ
 tOJo6p7gA9yzpWkJ4bR8Hbbud3GKrKECIl3Z+9k7/vWYSHtK53tSxQDxg
 49tqKQVeqSSP+tlMi+Q1/9tb5gwzmTaBCD4kqmsh1si4V3vr3F24Vtjv9
 Qm/krSGiL1BQNuHkhqUtRNpD7Jpwvp9GwNf/ikd7P3FZoJz0m3To/lG1L Q==;
X-CSE-ConnectionGUID: bcw5wkS5QUaz39RndnSm6g==
X-CSE-MsgGUID: 8Qy+U7ZlQeKpE2VqWHx21g==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66119626"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="66119626"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 00:09:05 -0800
X-CSE-ConnectionGUID: easTD3ldSrSZMYlxvEGcOA==
X-CSE-MsgGUID: GE17JeMuTouWpAmLAXDScQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="200054321"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 00:09:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 00:09:01 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 00:09:01 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 00:09:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4BQXBkrycu6BMTtdzIN+K/sEJLszh80b3pAcHJhnci7YMhYdsOqnL862A1n/y5vvf6oXl7jWy9UxYbTgdJBqTqO3xwRAnth6EHu3UdQsa2UXH8b1teD95EaM9fDdAOp0e8vrAZUYxFXb5ahi5IgbQIRwFszR8CVn2dzst0beC9ILIkmkT+6Z2NnYSDrPnflbPLnYfMqeaabVztTsmyIeABE00kX22p8BAnwfdnY5gFhTAXgwba4PyxcDFZY4EaBfz62q8+r2GDdO9t1mj5ZkOsAMyU0TFgkkIuehRPBUnRqc1LFHxAYaJvEoa2E1G64b8mW0tx9EN+dkGsbpZeSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikMGjEwpzjg2b5SXTUWB8yz15dI8S2o6f/GTV8Xb1BI=;
 b=NUFLwM2r3ZoDF3HO0WY9MyEuh3ZnnzkhTUZ843zFFy1VpXvYJbxiPKGBYTsEo2gH4Ht3RpNTHiB1a3Wtl674uElzVHN5FDpGeaCbtrACNIGWUhX4AbpE8jfwCuP9IebDSl64Q1uWElrrcXseQlI07sbNEoL6MbKeho4B4p5u3m6cr/E3kU++SySpjS/I1LO3Oncf5dSCOba0B2DfN0pCTcFLtjV5sh2rTKKeDeTR8xNlwzqrhOA34BeF9OZ2Al6i8eo/vmzRpaHRPOnt7qLIEStCGaLWgARsuVWlD+Heej9W0U6UBofNsf8z8o2+M3/Iy6l+7dADjeS2pNMMJhmpFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 08:08:59 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 08:08:59 +0000
Message-ID: <e326c74a-a228-42fb-b748-94dc51e94fee@intel.com>
Date: Mon, 8 Dec 2025 13:38:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <kamil.konieczny@intel.com>
References: <20251127094043.3916839-1-soham.purkait@intel.com>
 <20251127094043.3916839-3-soham.purkait@intel.com>
 <20251205170257.ziuhcoetjvxnr5xa@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20251205170257.ziuhcoetjvxnr5xa@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::13) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SN7PR11MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 28033ed2-cd82-474f-7fb9-08de36310a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2xKaFRrRUd0RGNvdkRhODg4Um5EZGxNL3c0TFFjTktCLzJLQ2ZxMVlhdkx3?=
 =?utf-8?B?YUVvbmxBbUgxOU5GWGowcmh3elRGbmJPRkNZc2M5dmNGVjJlMjBsUEorR21H?=
 =?utf-8?B?L2UvdEFkNWkwYU1RZnhnS2FKWWlCRExLaHZZdlF5bDFoWEhBNkNLYjRlVmpY?=
 =?utf-8?B?QzZlajNZVEZMM20rc2NlWTUxdWRBbHk0akhLL0pNUmJpeGxGWWdCQVhzNGlx?=
 =?utf-8?B?M2YzVHdtQU4wTm5CbHBWVU5qUU5DRjJaRy9DTkMzcEVIVS9IN2wwd3JKZnUz?=
 =?utf-8?B?M0JFUGxWd1RtVzJ2bHhwclVNcXlUY2ZQUDQ5TmR1YTc3UVBFUmYzcjNzc2l5?=
 =?utf-8?B?RzE4OHhzQVp1TmV1ZUw5MEtnRjVheUp5ZytPUXJWQ3N3Vm55eDR5YjRMRlhu?=
 =?utf-8?B?L0J6WUhqYlpPZG1yMldaUlJlMzg2cllRcmpMRVV3djMweXlleXI4ZW4yNERF?=
 =?utf-8?B?ZXFNMTVRdllvSVFvcmx3djJPNTBHdE9QdjdlN3VmMEJxWlducnZ1Rnh2RTRF?=
 =?utf-8?B?Sm4vYTVBTnEreGJ5eGVhY0piWlVVVFAzNnphTnFBZks2cjZKR0hreExBekJR?=
 =?utf-8?B?UC9naldhaldZUDhyUnhFNlBPcEI5TnhzVTZBSUFFd3pNa0doaXRlWEduTXVR?=
 =?utf-8?B?a1lhVlFZaGwvQ0NMWEloTEpTRjEwQmJ3TFdZOEtLcG5LYlZhb0twYmJ2UWFF?=
 =?utf-8?B?ZGdqZ2w4ZjBOZ3N4KzYxaWE4ODJXSVcybVpKN0lENFE1K3pEUkZMMHBpa1BY?=
 =?utf-8?B?UXczSjVpd2Z5cHY4UDZ1Z01sdVI1NDNyUzZKTFBQMXlDMDBSUVJVWk45UVpI?=
 =?utf-8?B?aEhJKytQaTFlNUJmcFFNWTFobGo5a1F4eUprNng4dzZqbGZaMGdCdkw3VXNh?=
 =?utf-8?B?aTh2L2U0V0VxNFhtM0xHRWg5N2hSVWZUTi9ITHBoTGFNNTFvM3RDdDRwU21a?=
 =?utf-8?B?TlF6WUVQZml6NXRRYUVqOHkrakFPWTM5T3lDL0MvUk1WRmhBUFdKSHYxc1JX?=
 =?utf-8?B?M1FYQnZMWXNmSUw0WlBtZ01wMUJDVUFNbVlDU2Q1Z01RdEJlVHE2SWIzSXRx?=
 =?utf-8?B?bjIxbnEyNjQ2SzlqWkpRWDRWUDRwTmlBZG0wRXROSDhXUjhlSFA1bnJhYzNY?=
 =?utf-8?B?SWQrZDVINnU5RkZ6MFBzY2s4ZjdEWG5SSXlKU1VORTJnWW9HWnZROTZjOTNk?=
 =?utf-8?B?YWg5U0NyWC82Nnozd3NBcldndFRHUHppNjBPZ2k1TGFIK1RUSnVucVZuaGZ6?=
 =?utf-8?B?SW1va2Q0c3AwRitsTFk5S0xDRzZ6akx2Q0JGbkVQWVE1UjZYTkZjQTNSTFJp?=
 =?utf-8?B?aVhzeC9BRytZRUVDeWRGOVNwKy9IWk45TGhvS3RkaXFVeWovNWU3Y1BTTWRF?=
 =?utf-8?B?OFgzUGxWRkJid01MdGVSWiszZmE5QTR6M1BSRmhvT3dUb2l5cEdqdDdVejUx?=
 =?utf-8?B?WFFqNTEycGNPcUovK2NXMXhxTzlHR29FeGwyM3doSTE0ejVwaWxHQXFGek1N?=
 =?utf-8?B?VHZidFR3TG9JbFQyK2ZZY292aG9PaVJDenRkZXFnR0RjMGZiVjFUREFQZDB1?=
 =?utf-8?B?KzRnQnlTdG9zSmVtWHFSN0Fxc2JLdWw1WXJDenNNbGozOFJ0K3dEdERWREtD?=
 =?utf-8?B?YWk2K1N0N2UvNFh2MmNHQlNrZGVYaVJzRGROeHVUYXV0SXNpMTV0RFFOYlpo?=
 =?utf-8?B?dFA4b1V2eWREYm9SWEs4eDA5YkxtbWtnVy8vcGVKRDJWT21wZWVlbEhhL2VF?=
 =?utf-8?B?dDZZYzhOTGFRVkFKMjVNWnB2MzlJWkd4dFkyOEdPTnhTREg4Ti9lZ0I0Y25p?=
 =?utf-8?B?bVZMTUFPRkg3N044Z2VPRW0wVmkwNTB1dmxlQTMzUldoek00SnRBQm1RbEJQ?=
 =?utf-8?B?bkJwcGVVblpodzlWSXJJTVBNaGpxMSthYzJRM2dKbUcwcnlGZG5YQnRQa1J3?=
 =?utf-8?Q?tEe/XYspzIQCMX96dsdp+mY/QuhHReXg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y25IeVM4YU9Hb2dnV3RBcjNPTEU5UGhUTVg2d29jdGpheXZqdS9QV0pEL0h5?=
 =?utf-8?B?MGNneDJ2UGZ5dnNpM1Z4cVNMZk5mM1F0TlZYQWptR285ZDl0R2QvQTNZWWp0?=
 =?utf-8?B?d1owcEJkU2o3ZEkrZnBMNG14ZU5kRytPK0xwTmxPYjNpVDlDK3FubzRDbXF3?=
 =?utf-8?B?elg3enlZcC9TVGRkS0RHTW1yenh6cnEwNWsrNEtaWkk0Um1RL25mazRjS1Jy?=
 =?utf-8?B?Q2ZnOWRPQ2w0aDhKU1kzUUJvYXhRQVAzRnh3VHJHL1pQWkhnekVyNVIvVGx4?=
 =?utf-8?B?cXB6TGhKaTljbk5iL1M0bnM4OThIVTI2Z2pxUG1UaUJyWnZoMHhvVlBVTVlS?=
 =?utf-8?B?WHNCWUFNRFQyTjhiTkhQZ0pqczBhZU8wT0VsbUNWdnphaTlvanh1UGdGTyt6?=
 =?utf-8?B?dUtBbkh4VkNjUm44ZFpRYWc3TCthYitoSEFhUlpEa0h6OVNJMU1qbVhLMjhT?=
 =?utf-8?B?OHQ3Rk14aXlUUFdVQUlLUUhjZ2krQnUvVERIaTJyMzV6YStIT3Y4WHo5azBP?=
 =?utf-8?B?OEVuOGpBNlJneWw1U1pJOHk3RmdENDBzb2dUeGVXYWs1cm1zSVNNZlNtcWdV?=
 =?utf-8?B?ajluUTNzUzVXYk9GemROWW5ta1ZFYjB6UWFqdmhQYlM1Z2ZNbjYybFZMdWpN?=
 =?utf-8?B?TXZWcmxjbHB5WTkzaEJraFBXWFBrbEN2akovUWIrUmZJN3p5bkFMV25Cdy9E?=
 =?utf-8?B?eHQrSWRTMnJTZkdMVmFjSDJnblNsVW9JQ1BYTytDUzloN3BadFRaYnlZQ29N?=
 =?utf-8?B?OUVVTm5hOEdPZ0JnbFIvOURGbmF3Q2MrSjUzaEpZVnF4dXl6cUJ0c0E0SW5D?=
 =?utf-8?B?YlgvRk9zSThJOW5OQk52dnlzVjRWdHU4SzFaaDRkZmxDM3FoM04reUQyd1pI?=
 =?utf-8?B?dGk2ZnhrQXdBNGpjUEpLNXBGUXhxb0lNZ0lkdXFKaEZ3Vk9mMTIxKzNYclJN?=
 =?utf-8?B?VnN2MzdpM01OVjFWYmhKSmczYzVSUjZuNkFRdWcxY1NjTG5QeXI4eTZpY1VQ?=
 =?utf-8?B?QkFlM2FXSG5RQjRLbENhQWNvYVhSdGJMTis1VXczVjloZlhYYm83aUJSQ0ZZ?=
 =?utf-8?B?eEdVOXpJUWZuakc2anRPMGZTR1FIamR6Y2ZGUXFPdXZ1UW1HeEwzT3BDajZ6?=
 =?utf-8?B?SEdNT1dxTkcycU80YzFlL0lhWDlja1EyN3VYeFVKYW5UcEJSRk1UY1NBU0Vk?=
 =?utf-8?B?K0FHVTdRd0VOcEdLQ2IzclN5NTRubllkRzlUSFQvMDBPOHYyY1dhR3dmYWF0?=
 =?utf-8?B?bkR0WUt0aWM2eXNxd3JjR0NYUDVaK0o0ZW9MUW9sRThDbmxQU0VteTIxekd3?=
 =?utf-8?B?NXVGczJhV1h0cTJlUmdkL01lNmRoOC8xQlpaOVBaOERoZmI0ZWxZb3FLdlBW?=
 =?utf-8?B?OFZHamJBWHl1enBMNnBjd2pXMlBiQXRGNHIzQ2dxK1Q5dlhDMTMxV0J2WFcr?=
 =?utf-8?B?Y3luckdHUDRLVHdhZ1VrZEtYaXl6Zkd6c28vRW1rS3VQbVFESEE3ck5lTEtv?=
 =?utf-8?B?cU5vOGNVWW9ZTFh2SDBiQWZ0akd6TGgrbWI2Rm5LUGY3aTg4RmpzQ1luWnBB?=
 =?utf-8?B?MmNxcUljNjN0MVY4S0pwNHgydUV2YVhrdDVxYjJGRWNwNGVrZ0Z2emJvb2Ex?=
 =?utf-8?B?K0tIdVh1N3VNdUlBMzU5a05QSlJNcEJSZnhWUjN6MDlteE9WMGQ5d090d2Jl?=
 =?utf-8?B?dld3WWFGcGhyb0NJWUN1VGRuZTBaeGtvRHBNRFQwZUZzdFZxRi8vbzdPQStL?=
 =?utf-8?B?Q0NTMmxZWFdUVnBna1RVQ0hiN2RQZnZQSUxyMExoeFpxMEVLMm81RGJSa09m?=
 =?utf-8?B?aktzeE1HOHpjakttWm9kM21rb09DMi9TM04zSFdFR3J6eSt4bEZUVHlLR0Fr?=
 =?utf-8?B?YnZmNVh3eVN0cVFRRWtLM3RmNFcxalFFQ3ptQTF3OEo0MlNkTU8vSzdVSi9R?=
 =?utf-8?B?SkVFNk9UVHE0N3l6Qnd2Myt0SkVqNXpRNUd3VEt2Q1VISFdzVnNYaXBrMXZB?=
 =?utf-8?B?SlZvWWI1aFMyQW94U3hvckRIaDBIL1RseDBQOUJhUE1jbXVVcTJ0UmtDKzB1?=
 =?utf-8?B?THFDdnhENlhCbG9KNmZ3amcxcHdSN2dzbDZYRmhBbGdpUVlxQzJOLzdaYWJj?=
 =?utf-8?B?K1pZVHFCbGVCUlVwNGFDTjA1cDc2YkRxNURFay9hUC9ML3hER0NyaTh2Vk5r?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28033ed2-cd82-474f-7fb9-08de36310a71
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 08:08:59.3398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fog5PRYMyr4efPdUu/QY2+Wt4C3SLJ1vHQI+oF8VTEdRkrLx3gAceustB0EXQxUMrbN1VIa7o8VavZszpoPxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7468
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

Hi Kamil,

On 05-12-2025 22:32, Kamil Konieczny wrote:
> Hi Soham,
> On 2025-11-27 at 15:10:43 +0530, Soham Purkait wrote:
>> Introduce vendor-agnostic support for handling multiple GPUs and instances
>> in gputop. Improve the tool's adaptability to various GPU configurations.
>>
>> v1:
>>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
>> v2:
>>   - Add device filter to populate the array of cards for
>>     all supported drivers. (Zbigniew)
>> v3:
>>   - Cosmetic changes. (Riana)
>>   - Avoid three level indentation. (Riana)
>> v4:
>>   - Add user message for running without root privileges. (Kamil)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   tools/{ => gputop}/gputop.c | 253 ++++++++++++++++++++++++++++++------
>>   tools/gputop/meson.build    |   6 +
>>   tools/meson.build           |   6 +-
>>   3 files changed, 220 insertions(+), 45 deletions(-)
>>   rename tools/{ => gputop}/gputop.c (63%)
>>   create mode 100644 tools/gputop/meson.build
>>
>> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
>> similarity index 63%
>> rename from tools/gputop.c
>> rename to tools/gputop/gputop.c
>> index f577a1750..4d6c684b2 100644
>> --- a/tools/gputop.c
>> +++ b/tools/gputop/gputop.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: MIT
>>   /*
>> - * Copyright © 2023 Intel Corporation
>> + * Copyright © 2023-2025 Intel Corporation
>>    */
>>   
>>   #include <assert.h>
>> @@ -14,66 +14,149 @@
>>   #include <math.h>
>>   #include <poll.h>
>>   #include <signal.h>
>> +#include <stdbool.h>
>>   #include <stdint.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>>   #include <sys/ioctl.h>
>>   #include <sys/stat.h>
>> +#include <sys/sysmacros.h>
>>   #include <sys/types.h>
>> -#include <unistd.h>
>>   #include <termios.h>
>> -#include <sys/sysmacros.h>
>> -#include <stdbool.h>
>> +#include <unistd.h>
>>   
>> +#include "drmtest.h"
> This tool should not use drmtest if possible. The main reason it
> is a tool not a test, and drmtest is mainly for testing.
This header is actually not being used. Let me remove it in the next rev.
>
> Let me explain how it should work in pseudocode:
>
> for each g in gpu_set
> 	p = get_plugin(g)
> 	if p and plugin_supports_gpu(p, g) and could_display(p, g)
> 		display_workload_by_plugin(p, g)
> 	else
> 		display_using_old_gputop_method(g)
If you mean to call intel_gpu_top in case of i915 driver, yes it could 
be implemented as a workaround but in that case it world not work if 
capabilities are set to  gputop using setcap as execv() or similar call 
does not preserve capabilities even if the pid remains same. In my view, 
it would be best to incorporate i915 support for gputop.

Thanks,
Soham
> 	fi
>
> This way you do not need to implement plugin for i915 as it will
> just work by fall through. Plugin could just extend printed info
> when someone calls it with root/sudo or group or with added
> capabilities.
>
> If this is hard, you could also consider creating new tool, for
> example ngputop (n = new). In new tool you could make new
> assumptions and ignore GPUs for which there is no plugin, also
> demand having root or capabilities.
>
> Regards,
> Kamil
>
>>   #include "igt_core.h"
>>   #include "igt_drm_clients.h"
>>   #include "igt_drm_fdinfo.h"
>> +#include "igt_perf.h"
>>   #include "igt_profiling.h"
>> -#include "drmtest.h"
>> +#include "xe_gputop.h"
>> +#include "xe/xe_query.h"
>> +
>> +/**
>> + * Supported Drivers
>> + *
>> + * Adhere to the following requirements when implementing support for the
>> + * new driver:
>> + * @drivers: Update drivers[] with driver string.
>> + * @sizeof_gputop_obj: Update this function as per new driver support included.
>> + * @operations: Update the respective operations of the new driver:
>> + * gputop_init,
>> + * discover_engines,
>> + * pmu_init,
>> + * pmu_sample,
>> + * print_engines,
>> + * clean_up
>> + * @per_driver_contexts: Update per_driver_contexts[] array of type "struct gputop_driver" with the
>> + * initial values.
>> + */
> [cut]
