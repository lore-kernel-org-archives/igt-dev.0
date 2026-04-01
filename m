Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F3110FCAD0
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 20:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47B610ED7F;
	Wed,  1 Apr 2026 20:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLSSngWx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AD510ED7F
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 20:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775077151; x=1806613151;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CA11Cfo3JgNXNr4FP0yxsvU72HuxiHOGlQSLUmaB7kM=;
 b=VLSSngWxkMhcz0aK8s3Gg/MAOgfDVp6ZOhAR8CTUkNBa7O/HErZT9jM+
 xrjyMDU0I8hCOTB1Jvd85wN3U75+Km8T9y77/90o3zBG0lTirchO6Nhvs
 XpndWjqNTPX/plZ6Scodpzz0seFR4EuNxIXolIvZMcfODISD7GYCpVZp2
 C5lqjpMsOzm712AZEmdvVujmmvOxDs1qyXdJMvvKPqE/B+Wt66bioIrlw
 xjXEwuIcnPlKMG+jZYOb8xyDmJVKjWw8RcVf2l7iffvILGTqFA2G3Lrxv
 rMm5D8aXvRawwNYzHVYQPJ3+z3lY5gZegTH7OKThGJ47OlRJsUQxoC2+l g==;
X-CSE-ConnectionGUID: VobhX3a9ShWb86r5DPHJnA==
X-CSE-MsgGUID: AmLa2kzJQAmFvj8c8Up30A==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="101578277"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="101578277"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 13:59:11 -0700
X-CSE-ConnectionGUID: 64KlMC5wSxSqgDCTUMUUBw==
X-CSE-MsgGUID: ZOWUa8ArRtuB5Lgwq+tQJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="220129572"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 13:59:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 13:59:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 13:59:10 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 13:59:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCuaTlKE254CNFsTot0IF+fZeKwhVPwNoQgagQzrcGuvHvt1l59o01ncmPBGhlTrbE1RNcPP3RzeHhKrfd2JJ3iZ7vWXleXBlxEoHiZRZ5jaAQgjGLJYmsFlgcoFgiLSYidsEeU1WmG+aUJTqPQ8Ql4qxdAD/Re66DDN6FxJdqxvR6Url+PXdVX1r8T01E/ka1QzfoLJa3c0Pdimt8NYQGSpbb6UhqbFD8BeXe3HkPg/hMI17AG6lsHLYf6UCQm1KRtDFHSrkY1YDknSRq4MxY9jacTT1sMd8HXErJ0iRxRMXaQ2nYY1ClUjl8V7v6so/Y18OqoxbUBMAgpS3I1/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1pmZrJc8lR6UC7nqmaEJo/iUhkGP8vn0/jpll37J8Y=;
 b=iUlEKduZ/TvP+1wS1l5Hzx/FRPjs52zPesqP7Zj+eG8a+Ad8fhKfMkSEz52ZwWCT0gTn/tXWNPcx8B4kh32K9E0YVlGv+Le5FQMPSI2rvrQAOA4Y7d+JoOV3uRjtK/am8WPuo6YojEtbKh/zKdiLopl0tIdtSC8NMP+cC7RgkBB0FBp4iOM3dyMLlJpjD7N/iMCQtUF0+PiSc4038YED3pEX/lD/lV8QKkLAOGKNCmFCG7g3YFOTwbMiQ2OBKJ/YYFt8k13wi+UFcJdiN0remR1Zgj2+1STD3pBUkDVGDgYa66AmznpBKoQwihQNPc6an1H/ZZMNOrCs93SDU51s9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW6PR11MB8411.namprd11.prod.outlook.com (2603:10b6:303:23c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 20:59:08 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 20:59:07 +0000
Date: Wed, 1 Apr 2026 13:59:05 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <jose.souza@intel.com>,
 <sushma.venkatesh.reddy@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/xe/oa: Add CRI metrics XML
Message-ID: <ac2HGSY6943nj7UQ@soc-5CG1426VCC.clients.intel.com>
References: <20260224004151.1836090-1-ashutosh.dixit@intel.com>
 <20260224004151.1836090-2-ashutosh.dixit@intel.com>
 <acrU97JYHHwRvOXh@soc-5CG1426VCC.clients.intel.com>
 <87y0j9x9q5.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87y0j9x9q5.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0316.namprd04.prod.outlook.com
 (2603:10b6:303:82::21) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW6PR11MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: eb6b4d45-565a-4846-edc4-08de90318400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: sVFpORct7YtD5bexy4BUCam1WKWrHmYH7HU7g9fxymAfhz5hmc6ZstiuN41DTO+0fufBV4u0GBSc1TLCxMq11iLA5WByGo2pZiqeMJIUtXzUQwVGw6Thqy+FW4SojwW7PZ0OsquwrMRwBhpcVvyxbIy6QxPphaeUPdW2Ibn/OugXP3441oPEwSuy1pJBJDI7K+xOVeNbJBlnVTRw69oYAtXgXmy3eb2tkB0K6AGSxO0H5mUcwh4cqbHsFb1a/FpRhBrs7jL+fIQedaISyLG3+LR4FgdBZrLzVsjUZPOoMkQmWAexc5gW3PhZHrzX2grhNDQX3Z5JHbCcIGo3VJoEOEzD5c1g9wheGVzJHxU2a4Bv5m3jCjHh8Ur9O6F0ezFPRvG9YWo0RyMqmKzufw+vXIIXSVIPL9W1n/sgwlChZOWFxaNsxq9DcEGZaec2MntwHOMUZ6zCalE71mthlUfIfmxfPPxrP3VtxREicdnDIxikqhhP9gtyCgEEmSKg2Y9FmwzJwUiWtMmEpcVtUnV8zigcV5P6/fwWNG7A2+HXaoTc5TNo90H5dlo9zdJ8yTloOCsyfodBKNiakQce7pIEnWBCZWbUaQ4vVXkZ7tiwRLevzvP8RhS+uJqPlu4r5DkYH7zEa+Sl0wirOcxIS6h+G6f+B4rlTsFamtpZYcCn/xCafuE6P9h+04N/EhSLGvJeO20TlCP0LbyXwXgxIJ96fT4LW6oEkOr4UZq3DEWEbU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlcyM1l2OXRrTkNTa1JsSUhyVHZMUVZDOG4rL1JqK2F0NDVEcTEvMUUwWmhs?=
 =?utf-8?B?TWRDQiswRkFOMUliTXJhWXR2Y1A4dzdPemlRUU5NejU0blI0M3dEZ1Q2cmow?=
 =?utf-8?B?dFJXTzhMbzY2MVFBS1ZMeC9hSG1GZ0huYk5mY0FIU1kxUUVTQ05sZGlTK3cz?=
 =?utf-8?B?SWFRQW90b0RzVlpBcVg4d1l1VTA3d05CWDR2WElGOXZ2Y0RMSXdGNHpHeERS?=
 =?utf-8?B?bEJOaHIzbWlPQ3JrdjJCTG1GM0dHQU9oNXJEQVNtNUhIajlLZUNxNk45VlIv?=
 =?utf-8?B?WHV0VkkrMFRaV21sdENUd1M2QjdvT2pWd0VmUUtMalpSU1VLSWtOWWhsU1hN?=
 =?utf-8?B?VzRodDc0bmRzaTZvUW5iNmhhNm12ck5oTStjb3Z4Z2hFZDI0RlkvRldGZHJp?=
 =?utf-8?B?WWxKRlcxOWlNektJcmxFamhQWW5ONXNmdVd6elVqSm1BNlpPTUtiZUdXaWlK?=
 =?utf-8?B?dFhkWlprcjVqRm81c0U2WjBHNXdRTGZBWVZtbjFDMGF1dENtZnAxK3Zwc3Jo?=
 =?utf-8?B?K1pya3lLRWZUMS9LQnpydFFHWklyMWFsTzVubVJXU0d4UkJ0N0hoU0hyQmF6?=
 =?utf-8?B?SWREdy9iWERpWDFaOTlLVExFTkZqSGEreWNNbEhSd2FpMVRlZXhMK3MzMHFn?=
 =?utf-8?B?SklXQTViV3NHc040ajFvUWh2QkFIWG41cEo4RE5GWnpIaDhpQTJkSmNINU5s?=
 =?utf-8?B?NlkvOUN1Zi8wZTgxMEdrTHNlZC84bm1RbWhXQUhzQVJIblc4QXVTNkVEeWZL?=
 =?utf-8?B?OVUvdlJsT29XRDZuNDhQRjhsLzV3MWtheXlvYURsbFdJUkx6NUR5UkZYY04y?=
 =?utf-8?B?MmRMMEh5VExtc1V6WTJDdzJtQVhZRG9UaGRqemNhYW1VQXFWVmY4cWE1dDVx?=
 =?utf-8?B?Q2RhWGlWbnJsY1BVZ3c2cXBMa3RnK2cxYXM4SmFLY0I0OElrZWVRcDdpbThC?=
 =?utf-8?B?dnVycWc5MUhKTFBQbjZQRnZQbTNFQUp0TXRXRHd0RTJwNnhyL3ZlRWxBTXFu?=
 =?utf-8?B?WXp6bk1OdFF3VElUK3FmNUYyR29sRUQyM3Ixcng2NExaWXE4dzFtM1dQTHMx?=
 =?utf-8?B?aWVBdGJSRk5oVzZMQXBjc3gvOWFtdHV6ZS81OWJVNktydHJRMURyb0Mrb0li?=
 =?utf-8?B?c1cydXRjeWNRbVpxUHhuUWpVdVN0OTlzZ0xqalVhbnlzSVRKV0k1NXp5MHZq?=
 =?utf-8?B?V1NHemJoYmllUmdpQndvSlNSc0Y2ajZ4RDhuTk8zczFkd3FRbS9WcjhuR29Z?=
 =?utf-8?B?VHlsdGc4YlZvMEx4eFFVY0kzWG4wd243M3IwMnRJNElseUsrOXptdTJpSTNp?=
 =?utf-8?B?TWhZVXBzOHM1aXlKdHZodFdPdEVieEtPVGlSdFpOTDBhbm8vemV4SzR1Q3Fq?=
 =?utf-8?B?bmduOXlYUDZiQXhUQXVTYkJ2dTYrQ2VoT1JaV053K3BNTVhTbFlyd2pEdCth?=
 =?utf-8?B?Y21YZS83MUhUbXZqQW5RTEhmdG50SStzMkpVcjd0eDNmVjlTRzdIbUFiaWNI?=
 =?utf-8?B?VGF3ZE51TzlYbUxLQzNLendEc1ZrK1p5R2N2a2pVZFYvdWUvd1lSRlNwMW1N?=
 =?utf-8?B?UXVJT29QK01Eb0ZncnIwd3J6QUJjOWRFNUdER2kxOS9sQnNZNU5uT1RjZnZM?=
 =?utf-8?B?RC9iU1hHWFpSMGw5dmFnV3JYbDlxaWVOQkRBczl1UXZOZkg5SXdYa2JPU3JM?=
 =?utf-8?B?L3BWTHhISVl6Wm1tTTFpbSs0N0xwY1VCN2FRR1pvZWVCZmEzOVhpRjFlUSti?=
 =?utf-8?B?QXBqaXVQYVdnbUxBMDYrNnlmc2Y3MUVqWlF1dnRkalMwdHY0MGhhczVqbExu?=
 =?utf-8?B?bEF4K3dWeUZhaHZrcWFZT2lqN0hodVU3RmlPSFhqdFZHL3I4M040cjJDRllG?=
 =?utf-8?B?VGVrNllkQkpiOEl0bnFudngvVzY2OWNuK0VQcFZsT09May9la2UrRkQzRU5r?=
 =?utf-8?B?SS9YZEhNZVhYUEZGY1ptYjhJUzZzZWZOMVQyMWdodFRvT0M5RE9PaFFtM216?=
 =?utf-8?B?V1NSUUFOVk1VS05ML3FDTHBFZXowU2Z1NWVRZnFWTHB4YTBkTmNmYUZkdXM4?=
 =?utf-8?B?OGUwVWpianpvOFBiVk12SEhQSDdZcXZyMFdkNHB0U01ZaUJJL1grMTV4VzQy?=
 =?utf-8?B?YTJRMzA0bWlFd2Y1MjhNZkR2OWNYc3dwSUdUQ0pERDlRVmtoamVBQUhMSHAr?=
 =?utf-8?B?TTZQT0d1dXQ2Y25hM1FoUlRoOUxITnZycFF3b3BSeW5LMlUvN1JTMUNvbHc4?=
 =?utf-8?B?Z3VJdm1kSUJZdUlJd0dFZFhCd2xYelNmTkdZSEU5SE1YMFZwZEh4SXB2WjRN?=
 =?utf-8?B?c2pDUFV5Y2l6RGtZSmtVWXpJcUdjT1Znekd2NmpWeHhrNitDTWJTbTRrUWlu?=
 =?utf-8?Q?NOflMPN1O9AUiyxNjilRRrVG2Mc6EYMv9bIfL?=
X-Exchange-RoutingPolicyChecked: NA8Hxe7xjtDX09PTw8M+i8bV7Q0/6DP9hWkGCf3xFzpBQXYpFZlThMSrIIulV/RmEv2exSUE9y/J9xLMEe5CbUpztDVhao61p8PVug1uXYeqks9F2En034kExEY/poDv4MS8Cx/A2X30+mo7t6QHQ0ZXkwpPsf8V3qzxv3SSk4HCTmWetD4GGfX57IR0KssxbSAeXjkaOkCl1J/cBbIaAlPISMVCe/1mM0sIiySzqqi3jWDLVqANvgiZue92TKMoouvvB7ppk91o3gzyBvhv8JNV38/bjUU+QItvT338nP6C4eEf+6jCRhX2izo65H7hAmqoauDr1+7XYbUPUOzARA==
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6b4d45-565a-4846-edc4-08de90318400
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 20:59:07.7776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R++3rBLiw6lDfpEocRrttMXUjBOoDjekoTYeCndobyYgKb3aQZFJvHsPApaULi+IEPghxjPLNLlhjtUqTpQqQBL28MayXELh5WgYO8T6LCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8411
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

On Mon, Mar 30, 2026 at 02:56:18PM -0700, Dixit, Ashutosh wrote:
>On Mon, 30 Mar 2026 12:54:31 -0700, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> > diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
>> > index 922fae58cb..c5c7a2c8d4 100644
>> > --- a/lib/xe/oa-configs/oa-metricset-codegen.py
>> > +++ b/lib/xe/oa-configs/oa-metricset-codegen.py
>> > @@ -138,9 +138,9 @@ def generate_metric_sets(args, gen):
>> >                     metric_set->c_offset = metric_set->b_offset + 8;
>> >                     metric_set->perfcnt_offset = metric_set->c_offset + 8;
>> >                 """))
>> > -        elif gen.chipset == "lnl" or gen.chipset == "bmg" or gen.chipset == "ptl":
>> > +        elif gen.chipset == "lnl" or gen.chipset == "bmg" or gen.chipset == "ptl" or gen.chipset == "cri":
>> >             # See intel_xe_perf_accumulate_reports for the offsets
>> > -            if set.oa_format == "128B_MPEC8_NOA16":
>> > +            if set.oa_format == "128B_MPEC8_NOA16" or set.oa_format == "128B_MERT_PEC8":
>>
>> Since you are handling multiple platforms with this if block, I would
>> change it to:
>>
>> if set.oa_format == "128B_MPEC8_NOA16" or
>>   (set.oa_format == "128B_MERT_PEC8" and gen.chipset == "cri"):
>>
>> Rest looks good.
>>
>> >                 c(textwrap.dedent("""\
>> >                     metric_set->perf_oa_format = XE_OAM_FORMAT_MPEC8u32_B8_C8;
>
>
>I think this is fine as is. First, MERT may be present on other platforms
>too (other than cri). So I am thinking the format is specific to MERT,
>rather than to any particular platform. So we just say here that both
>"128B_MERT_PEC8" and "128B_MPEC8_NOA16" formats in the XML's get mapped
>into XE_OAM_FORMAT_MPEC8u32_B8_C8 in the code. So the formats themselves
>are not platform specific. So I would like this to be format related,
>rather than platform related.
>
>So I think it is ok as is. Let me know what you think.

okay, I don't see the other cases running, so this is fine:

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>
>Thanks.
>--
>Ashutosh
>
>
>
>
>> >
>> > diff --git a/lib/xe/oa-configs/oa_guid_registry.py b/lib/xe/oa-configs/oa_guid_registry.py
>> > index 55c4968161..75939cfa2b 100644
>> > --- a/lib/xe/oa-configs/oa_guid_registry.py
>> > +++ b/lib/xe/oa-configs/oa_guid_registry.py
>> > @@ -104,6 +104,7 @@ class Registry:
>> >                            'LNL',
>> >                            'BMG',
>> >                            'PTL',
>> > +                           'CRI',
>> >                           )
>> >         if name in known_chipsets:
>> >             return name
>> > diff --git a/lib/xe/oa-configs/update-guids.py b/lib/xe/oa-configs/update-guids.py
>> > index c3f5a37c6e..d55958a0c0 100755
>> > --- a/lib/xe/oa-configs/update-guids.py
>> > +++ b/lib/xe/oa-configs/update-guids.py
>> > @@ -168,6 +168,7 @@ chipsets = [ 'hsw',
>> >              'lnl',
>> >              'bmg',
>> >              'ptl',
>> > +             'cri',
>> > ]
>> >
>> > for chipset in chipsets:
>> > --
>> > 2.48.1
>> >
