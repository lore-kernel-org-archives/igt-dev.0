Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4866EFCE21
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 17:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F6410EA7E;
	Wed,  4 Mar 2026 17:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPj6VD/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C316110EA7E
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 17:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772646555; x=1804182555;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HT99BVAWp8vxYQESEZlRkMbXhU9Ozr7eB6KTIr4SO/c=;
 b=iPj6VD/s2kMHvfFeFOdvM7NHntnkeRaq66p+2eAMgn4QhfxSnB2K0N8w
 TxP5HAtv89K8Upg9b74XvZkksgbVPlUQH0scrjtaqqnY+vWKzi7rVgGJ8
 2nJEEPN3aSdVPtFjg+YvzeVJd5Yw+lgwro9abXlLhgqqB76dyCLsWHtFA
 PlTdEHkpOTbISpNkokOYDM2n6BqFSO6d0zOTz09gqHRuqnHqWV8fGILHo
 7rMUNM+8We6F5Fs7BZyZEksEpn1ADtCmRINSRRgf91XLoagOYEBmQurKP
 N4LKr0l7eG8pst40bnEDgV7b50y7G6cVwZwR/JceKzmXO1U95/J38xa98 w==;
X-CSE-ConnectionGUID: bqyIWurHQ7OHYeuWEfFBtA==
X-CSE-MsgGUID: FUGB1xPCSxqJKKo5+KkK0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85186417"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="85186417"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:49:14 -0800
X-CSE-ConnectionGUID: Y919LmedS96FlOO9sxrh2w==
X-CSE-MsgGUID: KOrPnPF5Ssq5UQiGlDNS2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="218551657"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:49:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:49:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 09:49:13 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:49:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZ8i9KJARoTpATb7c4fflcGp2WlWfSzejyhrSoKrnsfIenJjQ3F6uU5isyC28/wSoT+rU8kEC441oUNkTbjCK+gh9tmrjHhm6vt77NVvDAddNXOcX5zsS3XY9sqSi2e/VCkbHryYqA9QvY8BP5Km9rI1svLGXTOJ4xQYWM52ZgnxD6zy++m/uNRRNsXvmUEJWR3Fvx/lq0soqbMM3Owrkx6JK/Gl/Hub3yK5DgD3alh1DRBvXmy4f7pXzlNCKoBj4pCYG3Adw0YIMtygHxyNYbP4qOGOZTTnAf060kOAaWUa6Uhm2orCIk3sfMHjSzwDvujFXhp9p/6WLJcFi65HRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UL2VcT8iFVfFj1v+UbR1Z1P4uHLvekCmbc/sRLEEuaI=;
 b=KjP7cbtJ7ZYq8Kbcwb1EQ+p+hfUQBO8E/5gh20cyv2XC/omemMTkKlzJdvfk05PRqdsaeyFHB0izSMo9rNRUCf0TzEuYf5xyQnpaq/0ZMrlf+B/ssrdIt51NJA+V3KWB0QXrshnmOlxdTYHdmTKpdbQJ24bQrQ+bEYf82X+vAF+pFBF4kxtwfNql1ApAwK0SclrBDySZXvApbaxeI1gxGNgePagOCX0d7IuJ3H2dV9RB2rIWUv9Z4bCbaFePLzKBoYZJCiYOx+NyPVCl643vlLDbrK66OPsHZ9hMwgbBfT1ta2IOPx0T5P9iQGH6EnipnP9ZPgcFldBpgi/92cT4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 17:49:05 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%3]) with mapi id 15.20.9632.015; Wed, 4 Mar 2026
 17:49:03 +0000
Message-ID: <81352de3-a08d-4813-9c2f-4f014e90efb8@intel.com>
Date: Wed, 4 Mar 2026 09:49:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/core_hotunplug: Open render capable DRM device
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <stuart.summers@intel.com>, =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
References: <9e4d3126426686f9fde73011753ca1e85a32dd0d.1772578021.git.jagmeet.randhawa@intel.com>
 <20260304135601.iwue6vspcb5oxbo5@kamilkon-DESK.igk.intel.com>
 <2263648.irdbgypaU6@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <2263648.irdbgypaU6@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::30) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DM6PR11MB4595:EE_
X-MS-Office365-Filtering-Correlation-Id: 724e1ced-dbc9-4197-e7ba-08de7a1652f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: IPLxYelpnRYPn1PCecGHAZO9VX/OoWtkyIlf2puFuSDy1z6aO0K2b1aDF0vEDUQ5/JRStbbJVUDuQwJRJyAmbfCTMD3hjs7m3ghHS0jp/fcVovXHiEzGnE8kJraUBhklHEwA4t3OLlstbux6oCu8xOndtav8Pi2+rA3Jl6oUh2MdHfZi2TPwv5vQDDyapMUzasozlYxPpPpU4lhksbRCiaNmBncYqJXXoHhhZlmCd5xkhORRUsrjQ7Nbqn43+/qHi+Nu6tlkXTVCpjMcBWyKHDn5prRKIRh1j1P3hO/T6+J9zLxdPPDT1XiMKelpXGWmvjMXlKMKPmvRBy5GSoGCli32dFHQM5Wic10msNP1SU7ZY+6N6CoW7pDYAK7fhAlkRLZuxO7NrzEZ/LNT7/GvgPOAaMV6cagQPtsXr9Sx7MyJ9jWJBNphI/PpdKkQ/j6x6H9a04cw7MYtGT6dDJCWxBYKWM4psJbU1vleJrWJ7IbHGuv0y1D5CAO4gtp+Db5Vdm6HeloqX+T8lasoRCRtWZghVdFB+02SVNg4bAC6OXm7jZ2i2vn1VPVBBQ+Tw4m8O6oin7XhaAgIaNb2ulHrdCU4GEyh61Sde5MiRx+z66M2/DryXSZ7vNjjAg1cIBQ29dME5WRGfhRdat3/c6nfAgmDyXy7KJHu15NAw6Rt5xT1+PzjkZpwfvFTxT8lP6sOfgSD1XH7nWTBW00EHzeHbYsCe3LzRG4j3lMB8iz4ti0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDB1U1ljaGpoaVp2NlpSVHBDTmJ2VFNCbTNrek5hT1J2S3ZVejBPSXJISmxo?=
 =?utf-8?B?N25GNmgxRDFSZTlhaFdhQk9FMllCSTJ3N0ltbkN6WUZOWTJJUEhNK0FOVW40?=
 =?utf-8?B?VVZ3em5sYzd2Qk04enFYaDVRdmtOTjUyU2VRTkFnMXErQ2ZsNzRhbGxtcEsw?=
 =?utf-8?B?Qm5qV1BiVVhNKzJCVllLR1VMVVBCMlFYclBPOG1YVGkrTVNWbDZnVFVnRkpa?=
 =?utf-8?B?VlE3WmYvOFdlbThTZ01DTGtacndhTDBCU0ppVnBwS3g3eG55dkxMdlFnaTJy?=
 =?utf-8?B?bkJ5bUhxU2FjMkRmWlhBSndVbUJPM0lpR1NZeHd3bjRRbkk3ODRQYnA2emJU?=
 =?utf-8?B?MHJ3OXNKTFZicXBrdkl5TkltalV0K2gzSEJoZkt3NmIzZnUxb3FlaXM5d1ox?=
 =?utf-8?B?amFMdHJrWFQ0QkxMN2JvVTRHQXF5UTN2RmNBd0YxU1U2dVhMM3RJN3RtaHA1?=
 =?utf-8?B?K0RWNVZCNE1SZ0lHNFl3NUlyRjg5eGVOU0gvam1JQlZ5WDZUajZzSlhYWlVU?=
 =?utf-8?B?Zk96QS9rMHVINHpYK3B4ZFlTS2JlK2lQNWEwU1RSTyt6QktXTThySXZZSktq?=
 =?utf-8?B?SUxqK2dXM21TelA1VmFzaGJEaFFnTUhaL09mQytqaVJLdWpscm1JUWhJQmJ5?=
 =?utf-8?B?R3Y3b3hUUlNCU29Mb3lpK2FUaDVaVDN1NGZpVTdBU1pUZXZQcCtJa0QyeEVG?=
 =?utf-8?B?UXY4REJOdlpjbFVkS1BYRk5zeDFTYmNYaDRqd1RFenN2bUR4RUVia2dmSWF1?=
 =?utf-8?B?KzlMZW5ucGxVa3JiOWRpRTBidDEyZ1Q0cStNVEQxL1M2QktGUnIyb0toSEJs?=
 =?utf-8?B?TkFrcURIS2lFTGM4ZHUxRjFrRFdUT2hDdjFXdUF6NW9tZkN1SnJIWUJpRlll?=
 =?utf-8?B?NVIyWEFjbUROc1B4TGFNTUt6ZFBBVG0yM2NqR3hUTkN5dmxrYkpkbVRVNHFj?=
 =?utf-8?B?ZmFkOFgrdGUyNC94b0JLUERZNm9TZ1pRU2s1SVpyaUtBK3JJZkF4OTV1Zjhl?=
 =?utf-8?B?YjZmLzN1RDJSV2h4OFI2S0RyTk1nOE5kNitlSmJic3UrdlFVWHBYall1ZFJD?=
 =?utf-8?B?dzNYVFRmUkNqRjBUTUNMTUczUk1OVDJNSGV2aUFiTmo5THlDbnRzS1hVVE5B?=
 =?utf-8?B?TUNOTGZ4SU5vdFVnQlpRRE1pRVN0clgzdHJmaG83YWNIcGtIRjhTUHdHSjR3?=
 =?utf-8?B?UldxZVRQa2V4UGtKc1hyT1RZRStkanU5ZSs4YkRMZnpYaEhTWHI5SmVUM01s?=
 =?utf-8?B?V3Q2bG55NzQzbHNTNFc3Q2pVOVlyRHFBYXp0U0NEZGxaOVhFVkEzQlVSMU81?=
 =?utf-8?B?TEtxNWVWa2JrZGQwZEZCMkRtc2crOStpb1Brcm8zU0NhVGxXYzF1endpR0ZQ?=
 =?utf-8?B?UnNMRWd0YVdiNnY3SE9YSVVTVjYxTkxGaFJVU2V0cmY1cXFGaFpTSmFrYXV6?=
 =?utf-8?B?OCtzQU1QYzlUSEhnK1FjQXpZNmc1Tkg5clVtT0ErQW96clpTTm94OG1HTWp3?=
 =?utf-8?B?SlNzMCt4Mm41RUJzR2svenBMcTNYU0U4NHlJUnZweFplYTVPd251N2hpeXNy?=
 =?utf-8?B?WEhoVjZCaFo5cUFUMEFucHRDOTExQllpOXFyY3gwQUNhSDhBU1pFOHNsc0VN?=
 =?utf-8?B?Y2ZocFZXRk9NVGdQOGx0dnZvSGI1RU1HUVRCRTVwRjZQaXV0WE16clI1anVo?=
 =?utf-8?B?Mlp1SE9vbVBhUm9jWjJaczRjNC9JM0tJZ3VwWDVibFBBNVBQeFFrYzhnSlZD?=
 =?utf-8?B?UGRMczIyRjdtWEk4UkhESk5WK1kyeCtrTGFYOUxKVWhEV0czZ1F6MGkzck82?=
 =?utf-8?B?a3NlN09uRHdFc1hPdUZxSmFVV1FTK1JOazY1WVhlVVBNdFpFNmJGTm9INUJC?=
 =?utf-8?B?cWVHeWVMTy9qRHF6bHU3cFoxaXNUSEtCT1c4RUVSUE5NeHl2dWwvUVhydVZx?=
 =?utf-8?B?bUFKUTNmRTEzZ1l0SWxOZEx5NURJelpVYmZ1RkdOZi9XL3NJSmFCL0poYkxj?=
 =?utf-8?B?WDJkSDIrM1RZTWR0bURUUWV1YlVUSkZrRnpBVlZkUHdncXlZVzJlanp5aGtX?=
 =?utf-8?B?Vi9ncUxPMEVQUVJwTitKMGl5TG5yOTJTdThzWTRzaU0yMm1VMEtWYWRyTER6?=
 =?utf-8?B?S0hpcXZnRWlSSzdqVHIrRkhROXlTNnlYV1dTVlNCUGVhQ2I1L2pQUjhVSXY5?=
 =?utf-8?B?MVFzYnJJKzBJTWIxYnI2anR3R0lSU1R0RHZGZVdjNFdmTW5vT3R3TlBLZWZI?=
 =?utf-8?B?dEIyRThENXVuWDVpOEpVcEd6OHFmZlh6UlowMlYwakpxejc0WlVBVXBkS2RS?=
 =?utf-8?B?cTJrVjBxaWdGejByUk8wczd1SzM4SlpoL01ySkI5OW9wQUtzTzNDcnRtbU5U?=
 =?utf-8?Q?zraRGnpBqnvrjzEA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 724e1ced-dbc9-4197-e7ba-08de7a1652f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:49:03.5097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzlrBnSKgEHLBfkq0+4yI4PBw2H0zuWEAsH4mGHw/lG4oCg2/ik67L5VKD6CLJsejOn1sE5Y5rrR+s9QD13ewtc7oG0ELwkzb9iNGHFp6aI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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


On 3/4/2026 8:31 AM, Janusz Krzysztofik wrote:
> Hi,
>
> On Wednesday, 4 March 2026 14:56:01 CET Kamil Konieczny wrote:
>> Hi Jagmeet,
>> On 2026-03-04 at 06:53:32 +0800, Jagmeet Randhawa wrote:
>>> The test may select simpledrm when opening DRIVER_ANY,
>>> which does not expose a render node. This causes the
>>> later render open to fail.
>>>
>>> Open a render capable device initially using
>>> __drm_open_driver_render(DRIVER_ANY) to avoid
>>> selecting simpledrm.
>> This is strange, as this test assumes card open and then tries
>> uses render for verification so I am not sure if you could
>> start with render. Adding Janusz to Cc.
> My design didn't expect a missing render node, and that was a mistake.
> In real world, devices with only master or only render node can exist.
> If we want to keep the test hardware agnostic, as it was designed, then
> it should probe both node types for their existence on start, store that
> information, and then use it while running to skip those processing paths
> that are not applicable.
>
> Thanks,
> Janusz


Hello Janusz,

Thank you for the clarification, I understand your point that in general 
a device

may expose only a card or only a render node. In this particular test 
file however

all subtests require a render node for their checks, so a render-capable 
device is effectively

a prerequisite for the test to run. Selecting a render-capable device 
upfront guarantees the render

node required by test while still providing corresponding card node used 
by test logic, and

also avoids selecting card-only drivers such as simpledrm.

>
>> Could you also add links to issues on GitLab, if there are any?
>>
>> Other idea to solve this would be to add simpledrm to known
>> drivers and a blocked ones, like VGEM.
>>
>> Regards,
>> Kamil
>>
>> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
>>
>>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>>> ---
>>>   tests/core_hotunplug.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
>>> index 7c9dae1bf..3a612fce2 100644
>>> --- a/tests/core_hotunplug.c
>>> +++ b/tests/core_hotunplug.c
>>> @@ -696,8 +696,8 @@ int igt_main()
>>>   		int fd_drm;
>>>   		char driver[32] = {};
>>>   
>>> -		fd_drm = __drm_open_driver(DRIVER_ANY);
>>> -		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
>>> +		fd_drm = __drm_open_driver_render(DRIVER_ANY);
>>> +		igt_skip_on_f(fd_drm < 0, "No known DRM render device found\n");
>>>   
>>>   		priv.chipset = drm_get_chipset(fd_drm);
>>>   		/* Make sure it opens the same driver */
>
>
>
