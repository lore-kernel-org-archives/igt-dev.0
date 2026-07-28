Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB91EC54EFC
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 08:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5BA10E813;
	Tue, 28 Jul 2026 08:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mvHVCBFi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63F310E813
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 08:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785226599; x=1816762599;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6qmaRGXPUIfSZzrunew5qHSdv1LmFhji0EJoCwz0ahE=;
 b=mvHVCBFiheFKm1jrKcySZLOWaCTV4WW1b05+Tv1zexihcE5wSPMfiVWO
 XKDXeZRLn734ea/Z1IsDA7hxXEvk3JuUi8UDMSwtLUZ2FqUGKPZUlIZ+b
 wEl35pT3EPtLb4V+sYeX4a70e0Zi2hE9C3AEqCBGgrgvEiSR75G/nhh7L
 NQgzLscyRxLj85yAVTLB4NdedJmWmuNxHD2kiQHqGEg7kffaMZp60cdcx
 jHVD25/tHMRe6b+Xak5Jxpjwu6/T7yPY900pYyO+PyTxlkrJbme+O2Xvf
 mzN92nCq1hv3yzo8FQMEcm8TWveDgeBNlgZSrg30wM0JCURKhvxyaRzfc w==;
X-CSE-ConnectionGUID: 6MurKhmwTjuDnYTDbSEdEA==
X-CSE-MsgGUID: 1LZFRnXJRaiOCCZ37+D/Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85817760"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="85817760"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 01:16:38 -0700
X-CSE-ConnectionGUID: UtJ/eCE2TAm0cG4L2dLSzw==
X-CSE-MsgGUID: ggq+UoLGTH28MNfo/GfFnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="258368985"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 01:16:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 01:16:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 01:16:37 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 01:16:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6jK12xnO1w/1AmG4W9N+tX7amsImXq38Rl42wxyJPpt+ibakmmL8+8+lxkB9L0d1r/8ZnHR7ny/Kh6jiv3GISVswqueneVIrCnXs0e70o0zXW6E4Ci+BBiwWRYPLtvpj50YIcIUCr/Dm50j1Tl8NmqXb0QZDKs4IRZJqabmhs0GKwNm0tgV7Hm/VGfYugsc2qxs/SDjHChZNSKuxHbd4S7F89rSL3+pQtqRZJFjt70FV8YugnR2nXTByG3rWOUDat2gHKBkEhpCAv9XjPx+++2Wgy69YJOQ7OGTsuvdTEATaDpr1qqpMTGPJiu1zH+gWh69DtGrfjvWK9eUMya90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55pCNun9YrMVtMmHWEBYPK6xXiW3eDQ9XmB/HCYxsdg=;
 b=IGXs0CJFYml4Fl7r4DU4r7qrXqWA4p1R/F8Zrmjry/iLhjGneioFuCPUWp25dVbQOhNssSkTQgWKrUnVCZ41gkOMiLrDruXTnnuk+G4N8BI84Sbvdx1ooc4gchopguewzniS7yR/UXDSg1Sd+dIdI/GzQ3THjIv95SvsLKf/ybGbm/YgKXjDlVhtKoZINb5QM6PsD/kdYhk8R+ggKaxFvr2Q3kOAJV3cLI4iHZE9iMoZOduh+TTq3AhHmCj59YX1NWWfUClwQhJo/qEqkiJTeuwTDKGuafZ2QtOJ3EeVHzKXOszpxqJxJi6FGH2vCbKwqFLR8sKTFLZAF9+FhZjTug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by CYXPR11MB8755.namprd11.prod.outlook.com (2603:10b6:930:e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 08:16:34 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 08:16:34 +0000
Message-ID: <152d3016-dcba-4e6e-b3f6-d18dd5d3d27e@intel.com>
Date: Tue, 28 Jul 2026 13:46:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 06/16] tests/kms_frontbuffer_tracking: remove
 TEST_MODE_ITER_BEGIN() from `fliptrack`
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-7-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260713085515.463575-7-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0083.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::15) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|CYXPR11MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 0191ac6f-13a4-4828-02e9-08deec808981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|4143699003|10067099003|11063799006|56012099006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xB8jcfZEqpp5zM2erXdM5JN4Lo1QV5CpCLuRXtIoX/cEvuJZg2fev3P3BTth/RUp8vLcxAtX08an4+As/ifnAie2NO3mxO0jBzXq13ArpHdzWUEvG1zqjj8zGNtdxNjRED15cZsoETfpvyKV3Wia3GApQTcf2/N64/QUMTnLO1YG/3npmpRqDarfsAP6zW/fs71zR0MGw5+i/Rlmxd2XkhBT4zUg/aICFeQZ1fqctk33e/98U/u32iFgO5QxeFX0r2k5BE0vA9HlwFgLNaDDAJ9GvQqeFC44iV/diJedcxaFPoOEH0Am91UzgIQLHzSu4KyucaB53c2Ji7y++5LsrGBTEu6b2pbA4WrG+z6RzVtC2pykco7NRVr54zX5NJSf+tRHAtITReDRt0vLpdu7KxFFXZlvjodmMkt8PnYZi7hHBUosIvz3z5g6FFNhm9VcwdKnuWAjak4f75s+W6HtIphmw5V1/BGtDcIhx4/OOBwKl2OE4GS9Zn+o1A7Evdl2564cZdtiO+HiRxkdQ/4q5Xff2a5mcghV6OOQe9QD6Jb8yi9F1oaXBCoue3epCD1WCtjFjeKbU1ZO+MI5nkdufGz4C2gz4et+mt0gauICeLCxnutp1g90H8iq9SaauaHXL2Rj2Giqm50daPSZPE1pSnbAPX8xnfMyIf6dxfB54Dw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(10067099003)(11063799006)(56012099006)(5023799004)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVNZTTRCTEppMmRmMTJKZjJpWkRxcTRFNjJmbHZMTDc1TWg2YlBrWW4wVjFR?=
 =?utf-8?B?WThXSTdVbXVlU2ZySXFDb3ZTS3VyL2JsYm1YalhkVkJEZGp0aGJRWTErVHZn?=
 =?utf-8?B?S1dBNzZLRi9DSDJwOTFxOUJ3KzFKdTF1c1FHVGcxMk5hS1hlWFdqaFd1bTlt?=
 =?utf-8?B?WVlkZ3dpNXlScXU4blJ2d2haQTZVWm4zNnFDRWdrSEV0M1FGVmttaGpURVZC?=
 =?utf-8?B?NHljYlM1WkY1WEFvNTFVVXZEN1hrU3pKd1dERG81MHFWeXpMWnFPSDhnZmd3?=
 =?utf-8?B?YXcrM21BMHR0OWZiOG1zeTlHUkN3VThoUlc1SHVjWHBkQVRUbUo5My9kbUt0?=
 =?utf-8?B?LzFQMlY0aHozcDcwdkpIZ1Vwb3BSSGhBQjlZZ3RTNFppWVhoc0pIWFdMbVky?=
 =?utf-8?B?SVhpYWlCZ01hYVZwcGdMczh6RHE2bnlwamlZVVFYQXJDQjlVTXBucE94Wk9o?=
 =?utf-8?B?Zjc5S25OZGowT2VGb3hBMVlpeEkyQnU4Qnc4bzUrZzRZV0JpSFhhSVFyRUJp?=
 =?utf-8?B?Uzg5QWs4cHhvNDF2TnhxVHYxUk5UME5qZ2c1SVdUVjRZU2RiR1hLZTl5VndI?=
 =?utf-8?B?WXNvMjV4SGVRMEJ5ZUZkL0xBWWN1b2JSeUdmT2Y2b2Q3SW56Yjg3dDBRZFJ6?=
 =?utf-8?B?aXRlZHhJQW5CdVQ2VS9hL21MQWlXZ0cxVVdMTTJiSytRUHJoK05qVU5ndE9I?=
 =?utf-8?B?QTR0YTFNelpOU0Jkc3FyYVhmS2QzOUhaV1F3SkVaQ09tU0tBSDdGOEV5VER4?=
 =?utf-8?B?S1FpYzNYL1RBcnVEcUZVckFEMG5XUTBUcDQrOVp2YjVuRldrTGRqbE04WG1G?=
 =?utf-8?B?RlJBVGlFY1l4aXhqQ1lSZkVWV2pzRXc2b3l4aEVPWVg0ejhndVl6VXl4K1pj?=
 =?utf-8?B?REJVNnhET3lhTVdWdExjNmFEUkMvbWJWaWhQNENxUy8vcEhWRVI1VlRaa3Bj?=
 =?utf-8?B?aVhlS0Z1d242WkRYbzB3Z2NKQlU1MGhvQjc2RFBMdmFHRkpKL3lEaytlTDNV?=
 =?utf-8?B?NTFVMTUycEwxbWdmdmdxUzNXdjMwUkJWQXlibExVSVQ1NmYyNjlLWGxJZlQ2?=
 =?utf-8?B?eXNJRmxxSUpoakswY1FXWFNSSE92eWU4UHkwZzgvM2x6MXNVS2NveGFaMWpu?=
 =?utf-8?B?dWxuSmlXT09CVi9MdVdsM0RjcGpVZVZKQU91T3EyUjJvaGpFRVdEMjRSVExs?=
 =?utf-8?B?TEFqZGgxZ1BOdG5XL3orR1l0SDE0NlRqL2xXY212d1BXRWd3L2NzQUo5emVU?=
 =?utf-8?B?Q0dTNUQwL1VKVUVEOHdCdGY2Wnp0MVdPcjQ3dFRYbkVDMU5BeDFxcnZ0RmVK?=
 =?utf-8?B?b0xoak5tL0tFTHgraVpWUXp1RjFISFhMUTNBQXM1QlBFK2JWQ2tVS1N2TlNw?=
 =?utf-8?B?TUpkWVNQb3NOemNZbjlRMCt5U21sUDJYZTJtYzJnaGdsSTRVUkpSbkNMbXBL?=
 =?utf-8?B?bFM4akIzRUJuZ3kvZGlHSTdPdjQwN0t0VWl4dVpFOUNFOEZzbjU4RFQyZE1Y?=
 =?utf-8?B?UVdjbDBDUVdrbU1UVVc3Z3RFZXhpWnRac2t4MFVQWGlVMzBGTHJlUTMzZ016?=
 =?utf-8?B?NVppa1RHZ0t3ZXpvZzVUMVRNUUJCaHVSRE80NFlHTnJIVUVrU1VYZm4weU1W?=
 =?utf-8?B?VjZSNEtucWpMYXBWK1J5QXBiendDUnZBM3h2bjJOMHIrc2lZTzlzdjJ1WW85?=
 =?utf-8?B?clplZ0ZiaWxFaTNSMWlnaWNhNDVRWVBzT0UwYmNxUWlrbmRrU1VXQUlSRGY1?=
 =?utf-8?B?V2dmWllpcTJQYit2WG5pQ1N3bUE5WDg2dzIzYWdsS1RpdFJpZ0xEQ2NEbXVl?=
 =?utf-8?B?Zm9aMExaakFCZTM2dytvbzZnUUQ3aHg5aDFxVzBWM2RrTnNwWnlIWHdGK0Zn?=
 =?utf-8?B?Rm4yaVlSa0VOVlNOV0s0TFJLUURVd29PRGd2TlVuK1JOZndqZFZvMXFDQTVa?=
 =?utf-8?B?T3FoeTFIUm9xbm9oRnJiMXhIR2VwWmRlVkNkM05UVXNwYS90VXFHZzJMZnkw?=
 =?utf-8?B?RGt5cnJaUnFwVU9aTkhOSTFQU3ZRaGQwSTJHNkh6U080NVBDTXJSakd0MVcx?=
 =?utf-8?B?MUExUzZWU2pqOHoyQlYxS1FLWUtNbUN6NnpRNGdYUkU0TXNWVGp3OG5PNTVa?=
 =?utf-8?B?M1VLM3V0Q0Y0dzQzRFRrM3kwVXZaWHMyTFZhWEV1WFhxNzFDeFlyeWVRN1Fj?=
 =?utf-8?B?T2l5bDBNWEpNSzZmQVVMNTVpVW0xcEY2ZTFVQXpqdHRzcmpNdkpzajdQSCtq?=
 =?utf-8?B?cDFHV0h0NjJKWlFwT0FMbTR6ZkZJSTNJMUNMREk0U0lHelBGdFRtdzdjVVA4?=
 =?utf-8?B?TFdEL0JlUy9HcEpaOUhxUFFLTllzbElwTS9OK1FyMW5JVnZYZGQvTkJiZHZx?=
 =?utf-8?Q?K1FmcEIrQfj82/RQ=3D?=
X-Exchange-RoutingPolicyChecked: dLsAfBjIckhBreH7g34U4nZmD0Oy38zpqMPxeCx045s6Yv88bnFBUmTjxBWprmbjVP6n4/l23+knxFoGZIR79QnopTRhxQDL5hRqLzCKLMabTbkJo1ludqGCjZY8SrPqF4L+foPGdvmDhOSN4dUf7gaBoVPXmorsXN0FZ6hXT26E6ZvODjMl1S5LSaraBqOZoh7qp4aC03BzhAUYJL1pI2from07R4DqJcgwreB8fvttYrKOF0KfpShv2qdJ1F6KQfeqPFUqUDPBvmLeR1pcAEmcXM1xxv1jJ8HyXggd/jNvvs0Tke42g5cN6opyEI586CQzUnz7U95iRkj/8rJQMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0191ac6f-13a4-4828-02e9-08deec808981
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 08:16:34.3453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlBvmxe7Us9gnlCcwIBJfUOuo53ReZ2Wv7rtAVQFYgzQ8IsWBsAC4r0c5mkYqb6zn12gpBn+fKNyny6TQGlYWLK4BYB1xv4pvlx54/CXR2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8755
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


On 13-07-2026 02:25 pm, Michał Grzelak wrote:
> igt@kms_frontbuffer_tracking uses TEST_MODE_ITER_BEGIN(t) which consists
> of nested for loops. However many loops can be omitted due to continue
> statements. This obfuscates following the execution of any given
> codepath. Replace TEST_MODE_ITER_BEGIN(t) for fliptrack tests with macro
> definition and remove loops that are skipped.
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 24 ++++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index f5c2a81434..c41f97bd34 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -4511,11 +4511,21 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			}
>   	TEST_MODE_ITER_END
>   
> -	TEST_MODE_ITER_BEGIN(t)
> -		if (t.plane != PLANE_PRI ||
> -		    t.screen != SCREEN_PRIM ||
> -		    t.method != IGT_DRAW_MMAP_GTT ||
> -		    (t.feature & FEATURE_FBC) == 0)
> +	t.format = FORMAT_DEFAULT;
> +	t.flip = FLIP_PAGEFLIP;
> +	t.tiling = opt.tiling;
> +	t.plane = PLANE_PRI;
> +	t.screen = SCREEN_PRIM;
> +	t.method = IGT_DRAW_MMAP_GTT;
> +
> +	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
> +	for (t.pipes = 0; t.pipes < PIPE_COUNT; t.pipes++) {
> +	for (t.fbs = 0; t.fbs < FBS_COUNT; t.fbs++) {
NIT:  Nested for-loop opening braces sit at the same indentation level, 
Please correct indentation
> +		if (!opt.show_hidden && t.feature == FEATURE_NONE)
> +			continue;
> +		if ((t.feature & FEATURE_PSR) && (t.feature & FEATURE_DRRS))
> +			continue;
> +		if ((t.feature & FEATURE_FBC) == 0)
>   			continue;
>   
>   		igt_subtest_f("%s-%s-%s-fliptrack-%s",
> @@ -4527,7 +4537,9 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			igt_require(igt_draw_supports_method(drm.fd, t.method));
>   			fliptrack_subtest(&t, FLIP_PAGEFLIP);
>   		}
> -	TEST_MODE_ITER_END
> +			}
> +		}
> +	}
>   
>   	TEST_MODE_ITER_BEGIN(t)
>   		if (t.screen == SCREEN_OFFSCREEN ||
