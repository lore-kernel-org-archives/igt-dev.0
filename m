Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307DD109E55D
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 06:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C918010E9D6;
	Thu, 26 Mar 2026 06:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRt+eiw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74E710E9D6
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 06:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774508368; x=1806044368;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CI2SB/pbqritc9G8f53QAYK9cPhqxQLttVHjE3SCC6Y=;
 b=FRt+eiw1ONa31OjOTiNb95rwGRZsAA2mgIECTU/4pXQGew5ma0z+dbaf
 otua8yh3NaVMufBHy+E39c/e0i2qHmbGJsNO14bItjRK9wBViESb8ZBK1
 QuT3cQ09w/GPlbk8XVseN44eawdZA6iTAsWSnYUI0wvD0meu7kmTl8v4/
 0ZbgEJ1fTvQ4NLzVO3Oi6L+EcMtBAmTkp8mqMVXiJ/iGcTUQh4Buf2A/q
 AQN/bBcp0yosH72hguh7iKEoEiizmzz9k2MRc4IqlKYauUVO8cEWnW58x
 YEngM7tntfZq+tHs3SwJJKNU/RGZzOiLrk3tG/aZRcMwwn2K2cs5Gd+Ys Q==;
X-CSE-ConnectionGUID: +vyRraacTGOyNW8VJhS5iw==
X-CSE-MsgGUID: Dm17o6ntRUC3Ssic31HEQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75578610"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75578610"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:59:28 -0700
X-CSE-ConnectionGUID: dnmz93YRSxOb//mFU7BpHQ==
X-CSE-MsgGUID: DDLu3BJlR1C1uTM88VShiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="225169116"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:59:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 23:59:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 23:59:03 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 23:58:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+78kLQh3pdlgaKDfRjmSPQvCmScMwnwykqTDqIg18F75nQUFSo4pX6OAegwABI6jwME8YImPQPPjIcMNkWwLRbho1KrbbyYC6noxYM4ppFe/ftTJ1KNX4Kqfa5CBor3c8/WA8gquX8nTA1Webp3HRmCiwEp7KASsu9HVd3jkjCF2s/d5dVs3EC9nPYth+v+3Ts8PyZ+I+HDnEp2GL3sc8s2DD3dyI8EgiEA9kUn5Ju9puhc2zx4oeZLF8Ri0DXxyEhZSnfnYEyBbh8oN2b3f//cQVil7IWa3V6Vv6Y/y8vr7bRUpBf2PTah4wJ97znjwJyyv8wvgcgx7wvN0l6Yqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JX6xaeKQQIqn7WFzVg63YMoHMA+szbiUMKvpg7j2dHM=;
 b=YAsIX9jUDRfdLr1qD+VRKxFyHAR/OvpTS7mY7xw7k9ToxoJpp/BoJ4BnpB4SWOWd6vPOmQT0pOQ+nkY4+UbWrmqQvmrCeGmb9p3Cx8WFsHszWLDG8JPq4W9np0ctDmX9y0BsiplilkfDOpgjqen+febRB5oU7rzuADg0a/KGG8zTVscDYkuKkfiqZGkoilwWwSz+/ZeN3KLbYvrl6L5GmAUVfbBiP8/O6HN2Wl9ibq8vlfaJG7BCTImMA0hPCdmJw6Pj3sV6VLIhq+X41lIc+gfg9q0aDCVELSIMZMzPtPod1GcO7QxDNqrpBNMgNwlvq35fcuV+pcw79KrPwAodNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Thu, 26 Mar
 2026 06:58:13 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 06:58:13 +0000
Message-ID: <464f5120-7b47-46ff-bf85-aef2c66eabf1@intel.com>
Date: Thu, 26 Mar 2026 12:28:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 4/5] tools/gputop.src/gputop: Enable support for
 multiple GPUs and instances
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <ashutosh.dixit@intel.com>, <vinay.belgaumkar@intel.com>,
 <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>
References: <20260219094804.835429-1-soham.purkait@intel.com>
 <20260219094804.835429-5-soham.purkait@intel.com>
 <20260311172726.mgydvoq6s4fpcalc@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260311172726.mgydvoq6s4fpcalc@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0268.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::6) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 952922a8-a9c3-4bbf-d209-08de8b050c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: MmEJREI8djtP+dRiFoEASZIxRL6EXdXs5x4a1+ykkHjATQ5Z6+ngfwgjKZWl+fjMqcCOiCAklrw8q6vEX8UCHHAftOSThNweVhvz1b1gh2v+BIn/eNv6r2IrunLJy1jQcSpzTcer69JFJt6kDlyiAzP+1zH7ozD/uUPqc1SmT6uIWgMwqDwFDSTo13opshhvVbRjVDRutt6oX+xe8YdMZUL4u8GL31uxlZld1quWxuPl5w/VwdyyUrFghvQVBgPtDbIgSLxUW1pWvpUUypW2zkkW3ABp2PTCwLO5JuzB9+/NPfyju4PNVyQlJAmxC/7HS7nuXSiWYO5UE2+aFDuYpNFeCvEoajFp7Mf+MMXC0Q/6dthdbSBlNpVxDDWcFNZ/tU4iuXEAOmy2C1Af9gZ056Qx9zvu6yIBAGSr3nCS4ALhJ75AO4nlK6hG5AmwOtraN2rhIqp28KYbBFQCWntntLd+OPg7FVNVi5Bdb8dypWa7wjLFFKC1eCjqlB/id1fcx23Ha9xBDykqk0Fm8D54+H0Jv7TFvT7aEqBD+CU/xU28/QvDlDdwbOa5T8JhdBgrUDroEDCL6ZgiXYtc1DswS81swFe00wnzMjPXi/vS+Ggg0/Vkmch/ohFX2fpYn2SZTBkkjK+Lsk6i/Mdn4knnFzvK6GSfFimi2AstBlXKTWqCUkHHiXdNb2rLZ2XF48sgjSH2kqBzd8klopnWXJg89cw3eJjTjR63UbsZdblHMJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVJKNGtIVTRYT2FrRnJGeVk5NGNTMHZRa3RIVjBRRi92MlZWOHl4eXliTGg0?=
 =?utf-8?B?cTg1U1hZSVV0ejUzQnd4MEo4S3ByQ29NQnlxM0d3Z0ZPQzhWbjVkaUVqVzYz?=
 =?utf-8?B?L2Rqb3ptcFNsb1ZxMHJQWHlpTUJNZDhHUUFWS0psMTBWU2VjMlJ6bm5jQjRF?=
 =?utf-8?B?V2hMM1BkZ2QyRHFNR3RncW9kQjRZNjk1aHZreHJHSFNOV3Y3YUZRM252QnFZ?=
 =?utf-8?B?MWRLYXlHOXQ2Z28xUUpaYWM4NEZxWTFXaWhTM1ZQYWV2ZnJoQyt3dGx4ZFM4?=
 =?utf-8?B?b0RHQzBZLzdBQmNadjU0S0xOMTIwOGc1Yml4TWFGTTN3MU12MmJkbnpVY20x?=
 =?utf-8?B?U2RmQzBNOEZEQzQvN2Uza3B4cTFQaC84dnlmT2dUbVkxd2c2Zk13OEEyVEt5?=
 =?utf-8?B?OG9IMVRhcHhIbU12MjM4WjBlVTJveFdYY29YeFk3M200cWNMQU1yYTN0cm1E?=
 =?utf-8?B?V1Z2QUxUb0pOZUtMOERqTldua0dvSG4zc2hjSENjQVlwbUlQVkhYQ29EWGFQ?=
 =?utf-8?B?L3ZPVUN1ckZWeWNpdXViUDVDV05GUUlzdEdEYU9HWGtqU3BQdHJaQzA3VUVQ?=
 =?utf-8?B?L0dwRFloWkVWUXVibXVYajNCaDljTWhMbjVBQ1JnRnN5ckc5QksrOWxjRjdO?=
 =?utf-8?B?T1U5U1l1K0NyVitoMzBYYTdNcGFnbzVOQU55ZE5iUVpvSlBOTEZrdEZvazdM?=
 =?utf-8?B?cWM1eTVwTXdZaDVsQS9vMktZbjRGODRCV0V2b1hTVDRpZkQrMERBS2J6L0c1?=
 =?utf-8?B?UmhRalg2MnBSaVAvT0V2amF3UFpPbmJMbWM5YXpEaENKclRtN3FnMmlhR2ht?=
 =?utf-8?B?NWlGVW1PNTc2NDFuS09iOXcrc05hTjh1eFdQY2dMYXIvTFQvVkNtb3NMNGZm?=
 =?utf-8?B?Y1RWc1BOTmxZcWRlS1dmOWNZMUc1VCt0eEZDUW9haitrdnVtV29oekVWQkht?=
 =?utf-8?B?Ty8zcURPNFZIeDhyU29uQkxSTlppWStvaTd6MS8raUJsTFQyS2dDTFhRWVcv?=
 =?utf-8?B?Um9MLzhsQTBVemtvWFY3OExjM0dMeUNUUVRhZ0JHTHpiTVJkQ0R5RVBaNVAv?=
 =?utf-8?B?eDIwNE9sL0kvTE4xVFFFMFN3T2xNYjNDbkFMODJ3VmFYbGJPWUxNTG5sNGFV?=
 =?utf-8?B?Z2FRWHhaRkh1YWNNRmZKOE1wK0MwR2s3dHFZWGNCckM1ZXF3S0NteU1tUDZL?=
 =?utf-8?B?SmdNOGNpTFlKSjFveHJ1RXBDbnl2SzJVbmxzQ3huY25WKzlVLzc0R2pzaWFB?=
 =?utf-8?B?ZEVoQVUyOWY3b2NXMFluOTN5WXRTdzlXRVNubFNqOWNJeHFRdkxVcC92akVs?=
 =?utf-8?B?cUI2aWNWN2ZGdklYVXhOTlhYQzBsVTlVSDlocHdIMVB1dUVBMGFhcTcrd0t0?=
 =?utf-8?B?aFNQUlNEUFhBMDBIQ0M2eTRGOUFtQzZENk9RMVNrNkdCQ3A0czlyeUlaK2xp?=
 =?utf-8?B?MytqN1pSdWJJRTFyUUdyTG95UWY5S3lwQlozWHYxcWRRcXk0MWluQnB3R1Qy?=
 =?utf-8?B?K2dCUmFwWXRja0l5dVFtVHJreXBFUnR0RW5LbGRMdXlqdTYrNUtwbFpBK1Zw?=
 =?utf-8?B?cTB3cUdzakFJa256aWQvbThQYWMzbzFRam1yWENlWEp5NURvRXMzaGlqOEhr?=
 =?utf-8?B?emVFdW5HejVYbW43WVppSTdpQnk0SUZHQ1lRUGRUQ1R1M1dyNG1ienJ0bXBR?=
 =?utf-8?B?YnRmSXFNUjZjaWcyYnNKc2RGN0hxWTEvMTFqcXduTjliQzZBV3l2aHpQK3Bn?=
 =?utf-8?B?N3JscUtGVHVxT3FGME5lUEZESnpWSVBPVGJETE9nK2lkM0E0cnVOOE9ERmFU?=
 =?utf-8?B?UVpid3g1QklUN05sZUhuOWcwTFNNQ1lSNDRVUjJoQ1M2UTZyRHRWNlhwOHhh?=
 =?utf-8?B?WlVaMWZySVI1UWx0Z2VPK0duWlZDWWt3TDZLN3lRWXkxM2JZeGhyV28yK0wr?=
 =?utf-8?B?SUJidlhGMGpBQ0hkSDRSd3NKVkRoaHhZNUJvSnI1S1BRdk9qdEkzcWdsNFdY?=
 =?utf-8?B?WXVZSzlmZTRCelpBeTJVRk01RE5JY2V6bElBRi9hSHRYeVUxeGhyYTBDSEZB?=
 =?utf-8?B?cVZXbkF2SnVLdTZOYjlybjhLd2pFR1FZeGgvSlQxQnhYVFZ5dWRnakIyS3lu?=
 =?utf-8?B?U2RIY3dFMW1wTkZySm96RTYwbjlDelNIWXNEazBNbjZveVB5Y0dEUGt5UEZ0?=
 =?utf-8?B?SHE2SlM3ZkZWZmlNdnFiT2dsSldPNEJMVnRHNUZUeklpcndZejZla1ZHNE9j?=
 =?utf-8?B?Uks1OHRycXNBV25UUnlrSlgzMjN6MXNjM0pqTVhETjh3eW1RMXZBWTZxNDBw?=
 =?utf-8?B?Tjd6QTdyOUVGc3Z6YW1oTGFpd3dyZ1hlU1NCRjNuK1orUnd2cXhtdz09?=
X-Exchange-RoutingPolicyChecked: ZkWl3petrW5QTnIbidKpZn895Ldjbi+Js7n8RR0yraI09k34Xm352M3c8U05w6EFrOugAD+42cbVYSA2UhTSKuCInMZpA3u5A8IhOQDuw+QQW2QgrGcgqP+BmD4dZMCdxAC22fQjkr8KODl9UCPXXIJe8PeAxKXn7W9pV9TYlKQzD5w/06RtpBVGXiIsXyILePQcqT6i9AG4JcfUGqUqCXbwRhLjEf+GB4P4/XEGFYXs4P7/rNRcsdRTEnA+dph1x7aeZHsN1Pgp0riBRGKTxVpKe0EiG2fQpg3YIAz+AOwF+9gSPjmfm68VxGzYFWU81JjPyUqJ4qY38nJ1U1+/JA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 952922a8-a9c3-4bbf-d209-08de8b050c26
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 06:58:13.1842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFqQWBFH/NDccFhy32Di1oWKpkEGi0yCJepj5IVwd5Exr9GMLgz9I1SPWfQXb2dY0aHvZZX1/eyxv+t/a1j1Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
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

On 11-03-2026 22:57, Kamil Konieczny wrote:
> Hi Soham,
> On 2026-02-19 at 15:18:03 +0530, Soham Purkait wrote:
>> Introduce vendor-agnostic support for handling multiple GPUs and
>> instances in gputop. Improve the tool's adaptability to various GPU
>> configurations.
> You wrote that you enable it for multiply GPUs but there is a root
> mode with PMU for Intel. Could you split this into separate patch?

This patch introduces the per-engine busyness monitoring in the gputop 
and by nature it supports multi GPU monitoring,  if the system has. It 
is the same functionality. No need for separate patch. For better 
readability I have modified the commit message and the description.

Thanks,
Soham

>
>> v1:
>>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
>> v2:
>>   - Cosmetic changes. (Riana)
>>   - Avoid three level indentation. (Riana)
>> v3:
>>   - Add device filter to populate the array of cards for
>>     all supported drivers. (Zbigniew)
>> v4:
>>   - Add user message for running without root privileges. (Kamil)
>>   - Add support for GPU client-only busyness on unsupported
>>     drivers as a fallback mechanism. (Kamil)
>>   - Remove unused dependencies and headers. (Kamil)
>> v5:
>>   - Replace hardcoded values with Enum for driver number. (Vinay)
>>   - Rename driver_no to driver_num for better readability. (Vinay)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   tools/gputop.src/gputop.c    | 284 ++++++++++++++++++++++++++++++-----
>>   tools/gputop.src/meson.build |   2 +-
>>   tools/meson.build            |   3 +-
>>   3 files changed, 246 insertions(+), 43 deletions(-)
>>
>> diff --git a/tools/gputop.src/gputop.c b/tools/gputop.src/gputop.c
>> index f577a1750..d04c408f9 100644
>> --- a/tools/gputop.src/gputop.c
>> +++ b/tools/gputop.src/gputop.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: MIT
>>   /*
>> - * Copyright © 2023 Intel Corporation
>> + * Copyright © 2023-2025 Intel Corporation
>>    */
>>   
>>   #include <assert.h>
>> @@ -14,66 +14,151 @@
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
>> -#include "igt_core.h"
>>   #include "igt_drm_clients.h"
>>   #include "igt_drm_fdinfo.h"
>>   #include "igt_profiling.h"
>> -#include "drmtest.h"
>> +#include "xe_gputop.h"
>> +
>> +/**
>> + * Supported Drivers
>> + *
>> + * Adhere to the following requirements when implementing support for the
>> + * new driver:
>> + * @drivers: Update drivers[] with new driver string and so the enum drivers
>> + * with the new driver entry.
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
>> +static const char * const drivers[] = {
>> +	"xe",
>> +    /* Keep the last one as NULL */
>> +	NULL
>> +};
>> +
>> +enum drivers {
>> +	INTEL_XE_DRIVER = 0,
>> +};
>> +
>> +static size_t sizeof_gputop_obj(int driver_num)
>> +{
>> +	switch (driver_num) {
>> +	case INTEL_XE_DRIVER:
>> +		return sizeof(struct xe_gputop);
>> +	default:
>> +		fprintf(stderr,
>> +			"Driver object size does not exist.\n");
>> +		exit(EXIT_FAILURE);
>> +	}
>> +}
>> +
>> +/**
>> + * Supported operations on driver instances. Update the ops[] array for
>> + * each individual driver specific function. Maintain the sequence as per
>> + * drivers[] array.
>> + */
>> +struct device_operations ops[] = {
>> +	{
>> +		xe_gputop_init,
>> +		xe_populate_engines,
>> +		xe_pmu_init,
>> +		xe_pmu_sample,
>> +		xe_print_engines,
>> +		xe_clean_up
>> +	}
>> +};
>> +
>> +/*
>> + * per_driver_contexts[] array of type struct gputop_driver which keeps track of the devices
>> + * and related info discovered per driver.
>> + */
>> +struct gputop_driver per_driver_contexts[] = {
>> +	{false, 0, NULL}
>> +};
>>   
>>   enum utilization_type {
>>   	UTILIZATION_TYPE_ENGINE_TIME,
>>   	UTILIZATION_TYPE_TOTAL_CYCLES,
>>   };
>>   
>> -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>> -
>> -#define ANSI_HEADER "\033[7m"
>> -#define ANSI_RESET "\033[0m"
>> -
>> -static void n_spaces(const unsigned int n)
>> +static void gputop_clean_up(void)
>>   {
>> -	unsigned int i;
>> -
>> -	for (i = 0; i < n; i++)
>> -		putchar(' ');
>> +	for (int i = 0; drivers[i]; i++) {
>> +		ops[i].clean_up(per_driver_contexts[i].instances, per_driver_contexts[i].len);
>> +		free(per_driver_contexts[i].instances);
>> +		per_driver_contexts[i].device_present = false;
>> +		per_driver_contexts[i].len = 0;
>> +	}
>>   }
>>   
>> -static void print_percentage_bar(double percent, int max_len)
>> +static int find_driver(struct igt_device_card *card)
>>   {
>> -	int bar_len, i, len = max_len - 1;
>> -	const int w = 8;
>> -
>> -	len -= printf("|%5.1f%% ", percent);
>> -
>> -	/* no space left for bars, do what we can */
>> -	if (len < 0)
>> -		len = 0;
>> -
>> -	bar_len = ceil(w * percent * len / 100.0);
>> -	if (bar_len > w * len)
>> -		bar_len = w * len;
>> +	for (int i = 0; drivers[i]; i++) {
>> +		if (strcmp(drivers[i], card->driver) == 0)
>> +			return i;
>> +	}
>> +	return -1;
>> +}
>>   
>> -	for (i = bar_len; i >= w; i -= w)
>> -		printf("%s", bars[w]);
>> -	if (i)
>> -		printf("%s", bars[i]);
>> +static int populate_device_instances(const char *filter)
>> +{
>> +	struct igt_device_card *cards = NULL;
>> +	struct igt_device_card *card_inplace = NULL;
>> +	struct gputop_driver *driver_entry =  NULL;
>> +	int driver_num;
>> +	int count, final_count = 0;
>> +
>> +	count = igt_device_card_match_all(filter, &cards);
>> +	for (int j = 0; j < count; j++) {
>> +		if (strcmp(cards[j].subsystem, "pci") != 0)
>> +			continue;
>>   
>> -	len -= (bar_len + (w - 1)) / w;
>> -	n_spaces(len);
>> +		driver_num = find_driver(&cards[j]);
>> +		if (driver_num < 0)
>> +			continue;
>>   
>> -	putchar('|');
>> +		driver_entry = &per_driver_contexts[driver_num];
>> +		if (!driver_entry->device_present)
>> +			driver_entry->device_present = true;
>> +		driver_entry->len++;
>> +		driver_entry->instances = realloc(driver_entry->instances,
>> +						  driver_entry->len
>> +						  * sizeof_gputop_obj(driver_num));
>> +		if (!driver_entry->instances) {
>> +			fprintf(stderr,
>> +				"Device instance realloc failed (%s)\n",
>> +				strerror(errno));
>> +			exit(EXIT_FAILURE);
>> +		}
>> +		card_inplace = (struct igt_device_card *)
>> +				calloc(1, sizeof(struct igt_device_card));
>> +		memcpy(card_inplace, &cards[j], sizeof(struct igt_device_card));
>> +		ops[driver_num].gputop_init(driver_entry->instances, (driver_entry->len - 1),
>> +			card_inplace);
>> +		final_count++;
>> +	}
>> +	if (count)
>> +		free(cards);
>> +	return final_count;
>>   }
>>   
>>   static int
>> @@ -335,6 +420,28 @@ struct gputop_args {
>>   	unsigned long delay_usec;
>>   };
>>   
>> +static void countdown(const char *msg, const int start_sec)
>> +{
>> +	struct pollfd pfd;
>> +	int i, ret;
>> +	char ch;
>> +
>> +	for (i = start_sec; i > 0; i--) {
>> +		printf("\r%s%d... second(s)", msg, i);
>> +		fflush(stdout);
>> +
>> +		pfd.fd = STDIN_FILENO;
>> +		pfd.events = POLLIN;
>> +
>> +		ret = poll(&pfd, 1, 1000);
>> +		if (ret > 0 && (pfd.revents & POLLIN)) {
>> +			while ((ch = getchar()) != '\n' && ch != EOF)
>> +				continue;
>> +			return;
>> +		}
>> +	}
>> +}
>> +
>>   static void help(char *full_path)
>>   {
>>   	const char *short_program_name = strrchr(full_path, '/');
>> @@ -349,7 +456,32 @@ static void help(char *full_path)
>>   	       "Options:\n"
>>   	       "\t-h, --help                show this help\n"
>>   	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
>> -	       "\t-n, --iterations =NUMBER  number of executions\n"
>> +	       "\t-n, --iterations =NUMBER  number of executions\n\n"
>> +	       "Running without root:\n"
>> +	       "\tAs a non-root user, CAP_PERFMON or perf_event_paranoid is required to\n"
>> +	       "\taccess engine busyness\n"
>> +	       "\t" ANSI_HEADER "Steps to run without root (using CAP_PERFMON):"
>> +		ANSI_RESET "\n"
>> +	       "\tcd /path/to/igt-gpu-tools/\n"
>> +	       "\tsudo setcap cap_perfmon=+ep $(pwd)/build/tools/gputop\n"
>> +	       "\tsudo sh -c \"echo $(pwd)/build/lib > /etc/ld.so.conf.d/lib-igt.conf\"\n"
>> +	       "\tsudo ldconfig\n"
>> +	       "\t" ANSI_HEADER "Steps to revert once done:" ANSI_RESET "\n"
>> +	       "\tsudo setcap cap_perfmon=-ep $(pwd)/build/tools/gputop\n"
>> +	       "\tsudo rm /etc/ld.so.conf.d/lib-igt.conf\n"
>> +	       "\tsudo ldconfig\n"
>> +	       "\n"
>> +	       "\t" ANSI_HEADER "Steps to run without root (using perf_event_paranoid):"
>> +	       ANSI_RESET "\n"
>> +	       "\t\033[32m# Save current perf_event_paranoid value\033[0m\n"
>> +	       "\torig_val=$(sysctl -n kernel.perf_event_paranoid)\n"
>> +	       "\tsudo sysctl -w kernel.perf_event_paranoid=-1\n"
>> +	       "\t" ANSI_HEADER "Steps to revert once done:" ANSI_RESET "\n"
>> +	       "\t\033[32m# Restore original value\033[0m\n"
>> +	       "\tsudo sysctl -w kernel.perf_event_paranoid=$orig_val\n\n"
>> +	       "\tFor details, see 'Perf events and tool security':\n"
>> +	       "\thttps://www.kernel.org/doc/html/"
>> +	       "latest/admin-guide/perf-security.html\n\n"
>>   	       , short_program_name);
>>   }
>>   
>> @@ -417,9 +549,12 @@ int main(int argc, char **argv)
>>   	struct igt_profiled_device *profiled_devices = NULL;
>>   	struct igt_drm_clients *clients = NULL;
>>   	int con_w = -1, con_h = -1;
>> +	bool is_root;
>>   	int ret;
>>   	long n;
>>   
>> +	is_root = (geteuid() == 0);
>> +
>>   	ret = parse_args(argc, argv, &args);
>>   	if (ret < 0)
>>   		return EXIT_FAILURE;
>> @@ -428,6 +563,53 @@ int main(int argc, char **argv)
>>   
>>   	n = args.n_iter;
>>   	period_us = args.delay_usec;
>> +	populate_device_instances("device:subsystem=pci,card=all");
>> +
>> +	for (int i = 0; drivers[i]; i++) {
>> +		if (!per_driver_contexts[i].device_present)
>> +			continue;
>> +
>> +		for (int j = 0; j < per_driver_contexts[i].len; j++) {
>> +			if (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
>> +				fprintf(stderr,
>> +					"Failed to initialize engines! (%s)\n",
>> +					strerror(errno));
>> +					gputop_clean_up();
>> +				return EXIT_FAILURE;
>> +			}
>> +			ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
>> +
>> +			if (ret) {
>> +				if (errno == EACCES && !is_root) {
>> +					fprintf(stderr,
>> +						"\n"
>> +						"Running without root privileges.\n"
>> +						"Engine busyness may not be available "
>> +						"without root privileges.\n"
>> +						"See \"--help\" to enable engine "
>> +						"busyness without root.\n\n");
>> +					igt_devices_free();
>> +					gputop_clean_up();
>> +					countdown("Resuming with only gpu client "
>> +						  "busyness in ", 5);
> Please do this countdown only when user gives an option,
> gputop should start working already when run. Imho
> something like --dry-run or --verbose? One of those two.
> Other option would be to display non-root mode?
>
> Regards,
> Kamil
>
>> +				} else {
>> +					fprintf(stderr,
>> +						"Failed to initialize PMU! (%s)\n",
>> +						strerror(errno));
>> +					igt_devices_free();
>> +					gputop_clean_up();
>> +					return EXIT_FAILURE;
>> +				}
>> +			}
>> +		}
>> +	}
>> +
>> +	for (int i = 0; drivers[i]; i++) {
>> +		for (int j = 0;
>> +		     per_driver_contexts[i].device_present && j < per_driver_contexts[i].len;
>> +		     j++)
>> +			ops[i].pmu_sample(per_driver_contexts[i].instances, j);
>> +	}
>>   
>>   	clients = igt_drm_clients_init(NULL);
>>   	if (!clients)
>> @@ -449,22 +631,42 @@ int main(int argc, char **argv)
>>   
>>   	while ((n != 0) && !stop_top) {
>>   		struct igt_drm_client *c, *prevc = NULL;
>> -		int i, engine_w = 0, lines = 0;
>> +		int k, engine_w = 0, lines = 0;
>>   
>>   		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>> +
>> +		for (int i = 0; drivers[i]; i++) {
>> +			for (int j = 0;
>> +			     per_driver_contexts[i].device_present &&
>> +			     j < per_driver_contexts[i].len;
>> +			     j++)
>> +				ops[i].pmu_sample(per_driver_contexts[i].instances, j);
>> +		}
>> +
>>   		igt_drm_clients_sort(clients, client_cmp);
>>   
>>   		update_console_size(&con_w, &con_h);
>>   		clrscr();
>>   
>> +		for (int i = 0; drivers[i]; i++) {
>> +			for (int j = 0;
>> +			     per_driver_contexts[i].device_present &&
>> +			     j < per_driver_contexts[i].len;
>> +			     j++) {
>> +				lines = ops[i].print_engines(per_driver_contexts[i].instances, j,
>> +							 lines, con_w, con_h);
>> +			}
>> +		}
>> +
>>   		if (!clients->num_clients) {
>> -			const char *msg = " (No GPU clients yet. Start workload to see stats)";
>> +			const char *msg;
>>   
>> +			msg = " (No GPU clients yet. Start workload to see stats)";
>>   			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
>>   			       (int)(con_w - strlen(msg) - 1), msg);
>>   		}
>>   
>> -		igt_for_each_drm_client(clients, c, i) {
>> +		igt_for_each_drm_client(clients, c, k) {
>>   			assert(c->status != IGT_DRM_CLIENT_PROBE);
>>   			if (c->status != IGT_DRM_CLIENT_ALIVE)
>>   				break; /* Active clients are first in the array. */
>> @@ -488,11 +690,11 @@ int main(int argc, char **argv)
>>   	}
>>   
>>   	igt_drm_clients_free(clients);
>> +	gputop_clean_up();
>>   
>>   	if (profiled_devices != NULL) {
>>   		igt_devices_configure_profiling(profiled_devices, false);
>>   		igt_devices_free_profiling(profiled_devices);
>>   	}
>> -
>>   	return 0;
>>   }
>> diff --git a/tools/gputop.src/meson.build b/tools/gputop.src/meson.build
>> index ec39f4c7a..e95657fca 100644
>> --- a/tools/gputop.src/meson.build
>> +++ b/tools/gputop.src/meson.build
>> @@ -1 +1 @@
>> -gputop_src = files('gputop.c')
>> +gputop_src = files('gputop.c', 'utils.c', 'xe_gputop.c')
>> diff --git a/tools/meson.build b/tools/meson.build
>> index 521607a4c..caca57d0e 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -123,4 +123,5 @@ subdir('gputop.src')
>>   executable('gputop', sources : gputop_src,
>>   	   install : true,
>>   	   install_rpath : bindir_rpathdir,
>> -	   dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],)
>> +	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,
>> +	   		   lib_igt_drm_fdinfo,lib_igt_profiling,math],)
>> -- 
>> 2.34.1
>>
