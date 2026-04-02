Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4037CC6B33
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 08:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CE810F198;
	Thu,  2 Apr 2026 08:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpvD3xEZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EC810F12A
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 08:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775119832; x=1806655832;
 h=message-id:date:from:subject:to:references:in-reply-to:
 mime-version; bh=DjOljMP43RES1pMwpVVigKa82G5D6K8/gwxzerXW3Xs=;
 b=mpvD3xEZHezacU0fKA7JuKKu24P9sBv6WgOrkazubaZ4cG6PFlf98dA0
 35dziCyR3cy8T5NdoG4dlBNT9Gjeo4wvmbvxEahN0N1qUVfwTTjommE43
 U6wjCLpraYNN9y+jHTScJwSaNYMD4PgPzvjBQjPrBBwiSP9xCQXM83VkN
 kzdUxze8k2XnhIRTewQciwpLgCng7KA4g4rdHgBjRphCYSvpqxiqsGe2L
 na2ovCv7h3jULfnid33Lpl6gftYClw6m1gX0lUfzWitNKFitjTuyXqVBU
 7Cktv3Wfm5b6cSRON+wy6c09mJ9lQUOREuFQcErplwe9RjrFjxoNGtVNU w==;
X-CSE-ConnectionGUID: iRp28K7BQp26qyOmesFHmA==
X-CSE-MsgGUID: QsTTmrTTRzqV5RVsTHu4bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="80031775"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208,217";a="80031775"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:50:32 -0700
X-CSE-ConnectionGUID: cNof+80BTbSlj61ufOOZYw==
X-CSE-MsgGUID: W421NNhoSHmN21ths+BU7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
 d="scan'208,217";a="231335509"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:50:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 01:50:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 01:50:30 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 01:50:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUvwqggtf8fF+nB4jHXXGSUIY+DINa2UBLWjAxfj5gslVuO+eAPrq3TJhe4rivvTmgDVw2tT1kgfkGZT5ZrhLKFfSyl2N/q+AW5kElRTx4f6f7sHyDgkf1ZaMNeJRUnhR+Wevc3T3j4lWbiMWw8s8nW5x1UoTILXS9PXVbgwzYusnYQOPaC8G5YzxXDTnsbL1XSlMnBGiJEDbUp55F/Mx7sgjIF+flT1yyfaLgPRnNTAR9ajplYvDdz7X4GUcIQQ3lJTSserYU8AdFM6RNF+xUR5Y6ygcc15nut5dRsTpCkNubpxEwlQgUI2Pwgnp/iD7ZEJAQgfTAWSiMRNzgDfQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qf4rLHSVRz9OsddoOIQiWkAllM47by37Cm/N62uikE0=;
 b=cYoGq3kzZYtH4Lxa84IfisoaTTy/wUolfOjOgSEt2xLwKIw9HLHEkLYn1SQuBFCRSk3ChKQigAmWHfXIkB1H+QSTOk1+ivHYduo9HoVRlJs7gGarz23WQBJh8BTGEC5MxiW3QYkC2vSBJK4Fpx1eoeZEz6YVvgZSNuGVEp1sRnKt5pnprVIVlibOuxXNeVCuqZ713QTEayOMZRKhMDcs+8EqWiJ1mwlQctyT1Kr/PqjrSccLcf1FZ2Wa1M+Nw7Fu4qmnEXjwcpoPqpgb+QrQkFmRmTvWEu6uKkmR4Aennt/fQkdypcGpMrtQEcShPGqRjfGqDE0pvEcXqJBniT1DEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 2 Apr
 2026 08:50:23 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 08:50:22 +0000
Content-Type: multipart/alternative;
 boundary="------------ev0WUZYrxU4ylucN87R8E5cf"
Message-ID: <aca9dae7-0196-4039-b022-74260b19a056@intel.com>
Date: Thu, 2 Apr 2026 14:20:16 +0530
User-Agent: Mozilla Thunderbird
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: Re: [PATCH i-g-t v9 6/6] tests/kms_flip: test suspend at most twice
 on SNB && BMG
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260330075508.1003899-1-michal.grzelak@intel.com>
 <20260330075508.1003899-7-michal.grzelak@intel.com>
Content-Language: en-GB
In-Reply-To: <20260330075508.1003899-7-michal.grzelak@intel.com>
X-ClientProxiedBy: MA1P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::32) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|PH7PR11MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: af09cb17-e90d-40bb-8779-08de9094e043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: p3PRygMgH6lb9ssl4l4N7uyyXhWFadUFLrcSoJdM1SW3Qmhjg2waKIMqykM7mZxqfxumXaa1o6nc+xLrY8xSki2hjXlHuPggnJpcniNwHrZxf/EXg1C7uaKFzV3yfzwrSH9inYzE1AKm2TRmvdrp10kWiLaJwwEtIIiC/hHrNz1XdXJXS3pqkpkdIIKs9vLpejgTnrYowF8iGhzuMti1oKrn7FPdhMPF66Wq57mjWIV/Kq3K0ZKZOsckxKlB8j+sx3CGAvdLz0DAVGzhdLCds+ufAlj6xd9Yn+A1WfKdnc6WIx7H6HRx9ndoxKv/Ei+Pt/qGL6dvIIvtn1797lLv7zJ0D6KUq2fNe8pIu1sk5XXhhx0fGy9NQjeW+4CQ3nku/wPhYqcH8Vr/bECSZahyGbsMev3MwOmN1lrDSngEGbWEobWEUjkIe1oNqoObhVcFqfpKa87JpIID3Y0UV/Z8oSgrmYTr9+7ThY8qYSjQCNyt5NkGpmdLx5jkB9OlE/+VN//gIVMYE2y9kqxZTYFtxO+fnbNYxeCfgSyeI5bXKGAaaNG0EpEfiJb+j8zzUD4e/Q3t2o7vk3JDYC3PfGzrUld/vXFJ1Cnh9uzs3KuRkdu7XtPmU4faKAsoWaOs3nseLHRVGWlwcfNFQ1kwshXnNxSiPUjhwSikSULUaVTckox8GYIc6BG9tFkYZcuYhRSq9uAPvedi5Ht6fnVI+INPrjpuWtoMc6SNJuN4fcyfMrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2xwTGpYbmVoMWVsc1orTjJWeGFMbnkxQTFNY2preWdwN3lrNHBSc0gvRnYr?=
 =?utf-8?B?YmIzRUhuamp5cDNJYWQ5MVp4dTdqeFdhLzJrWFQ0RGt5RWo1VzZCZXBReHdM?=
 =?utf-8?B?cEt0M040dHBkTlNRWnZndmtIdEdKVjlPaS9TZEhFOXgrb1lKS1VqdnBoUUtp?=
 =?utf-8?B?SVptaEtIVVdRWmI4WDRlWmEyMmV2dmZiZFpkRUx1OUFMZkt2eUVNWmcvMFVr?=
 =?utf-8?B?aG5PQ3FhT1dtN1RZZ2twd0h1YWE3S3FSUUpmQUh0a2hnZWRodjhBb1AwWHJM?=
 =?utf-8?B?TmltSE5DYnVTWGgvcTVrOW55cXViZ2NmbmttM1pxKzc0b0phK2xna2RsdWlY?=
 =?utf-8?B?c2tsckxmYzVrcjVpYVRCV2pMR010eVJJL0lYN1BQcWpBYlNlN0dRc29GQ2Rw?=
 =?utf-8?B?RDlFc2o1bDgvMjVLMm8yelBveitDRDNDaXlaRVQ3MHJWN3VLWi82NHBNandi?=
 =?utf-8?B?T04yK0hlaHJBUW9ObFdHSm9pUEs4L3l3T0taYUlkNEUvU2VCWVc5U1pNVWhL?=
 =?utf-8?B?MGQyWGRTcWhTRlZhRURiNFZQVHRyRUx1d0cxdnJ0MjczTWx5ZzROVDI0endR?=
 =?utf-8?B?MW1UQ1lEcnE4QWtXT2hQM2IwSU9GdVJ4Q0FQU3BTWm82VDVRVFZaSEY0Wk5S?=
 =?utf-8?B?SytONzcxWDIybEpPWWxYZnV4S0wyeXJmNFI1SGxEWEFkSFhtZ0lQZXl0QXNB?=
 =?utf-8?B?NWYza3lBeDFtSXN4RlVDY3JzUmRoN3lPOXNHbmQzTzlDZ3R3cjVYK1UzMG9l?=
 =?utf-8?B?T3NkdzBsaU1yejFtRjZJRVZRcHBhQzkvK1BLbXpvWTFNMjV2VzZDYVFTb3Nu?=
 =?utf-8?B?ZEttZDlsdlBOZm1OVjdGNHhGUkIrdnZSdEFxR1RJcXVuWkRFZTR5bGZ6SDAz?=
 =?utf-8?B?UDEzNE55c0tCRVNZenBKazc3R3JnQjd2SUtCMTdZVUZYb2s0bmg4bS9qUHBU?=
 =?utf-8?B?K0ZmYjFSVlUyZEVWZlF2MWxPejhEazFDb0FmVXBsYUZZcFJud3Mvb3QzUFlH?=
 =?utf-8?B?MUpHTzBxa1hvTk8zZFNjVWhGTmtyUzJlandlaDIrMFBYbHJ1L0FUSVlxbXRk?=
 =?utf-8?B?QWFEL3h3ck4wZkVzOXcvc3BBcHJHQzJnV3ZsOU1RemFsK0xWKzVyWFNsdnJy?=
 =?utf-8?B?RWRkU2ZQaC9QM2FnWXloeFRQelJHZjlLeW02SDdrcUdDTDI3V054bWlZYkVB?=
 =?utf-8?B?MU1BZ2VadWIrZW96anhlYVh2Z2d1MjkzQkFzMmt1SGU4Z04yVkFRUDZWeTlo?=
 =?utf-8?B?RmxCeGFOVWFYS2JKNURzQkR5azArcjdmOHRVaFRudmRWRVd0NGIxNDBuREdh?=
 =?utf-8?B?NnV2NkpvZWhnYTBvZGZpMjU5cEtJbHNhOGVkc1p2THRia2tOKzJ1WUdhWWhk?=
 =?utf-8?B?SlM3SGhCWEozd3BNQkR6clloVnJwK2hTdUpTWVhEenp2a01KcWtMclZ1cm9t?=
 =?utf-8?B?R2NabWU2TUxKbktINytkK1VvQW9uYVlXU2c2cS9qdGNQWjk3UUpvcXRoeHNC?=
 =?utf-8?B?U0FtYkZ3ZHN3WGkxWlBobFhuOGxGazBITkoyVzJlaTRxUEhUUW5HZGErSXRl?=
 =?utf-8?B?SmZlZ2NleUNpL0lFOXc1Y1FhNTUwdXl2c0tFWVlXY0t4WEVhRTZwZ3BGNysv?=
 =?utf-8?B?dGFhbVcvdDhsQndoV3ZFcUI1aklOV3FwS2NWbk5uTWp2K1dhKzgzWkpKNlRX?=
 =?utf-8?B?ekpJcTRSNUxBc0ZuTHVHYUREb2JiayszV1JRTDVrOC84aG4zYUJSQm5iOHhz?=
 =?utf-8?B?akZLUjF2U2NtY3dleDhBejNYTGZDTXI3aE1JSlFGeTQzZmVGd1o5YnhXandy?=
 =?utf-8?B?eHJCN2xDdTJqSWFvVWZBd2RDWVZEMUwxUThZSVVhUXg2RVV5Uis0VDhoSEZu?=
 =?utf-8?B?UzRRUVpzSXJTN2xic042TUVERnppRW1IeXlaRk1NTmdwR3p6TEFtMXNEclZH?=
 =?utf-8?B?Yk1mM0dmc3N3YVQ2Y0ZPMzB5RGFpZVRxMEQ4ay8rWEFzZXlkaVl5M1BJUHJB?=
 =?utf-8?B?bUlwbWN5dGlkdFRMemFWVTlRVWxtZW8rRy92eXc2OUdQcm9YOFJUWjMwWExz?=
 =?utf-8?B?YzF0cTkyOTI2a29GWmhxczNYZzNCbDROL2RRaFVsMVUrRWZ6UHIvL0M5YTdH?=
 =?utf-8?B?UW9hNnNIUU9LMDBKeWdLWk8zVUlOMzMrRnpOMGNHaVFPYUVWdTNWV2lEQ0c3?=
 =?utf-8?B?Z2RqKzhHSXlvT2Z2OW56bXRmQTB3VWNNUk5uY1VLdm12R2c3ZWZZeUI2QTJE?=
 =?utf-8?B?MldPRk1XNFFBV1J4cnIzOXpuRFFaZUFKbXlCb0x5ZkF5Zk05R2FFTThPUDBJ?=
 =?utf-8?B?MkdkY0lpeE1mTS9QcGFWcXRRS05LYmxLR3ZHSXhPTHZPbnB5L05jUmFQU1p0?=
 =?utf-8?Q?Hg7oOe2EHDdn7Sog=3D?=
X-Exchange-RoutingPolicyChecked: txZYX6GaGoJQfHUlEDqOrToXbPRzbmjFto/9nyKAfYheI9UPQgblj+a1j66JrvECvQxqu/4BFpJ8IDQUh3wSThD2+jTJMcy8pWO2qpQj9J0raIU78etbSSi77wjKllObQ8PS9/gvlqRdtvljsJcG+IdTYEUR6545VGJJLSYfxxOTUurHN4kULwySwCHWNi5v7u7xRc2Vsb9a4b+sFh6QzcOQPcFZ6jFuqKSZ2ZXDJjSCc84OhzH+GJEZ3CmAApNhUtVZzs9FR1EbKyUn9EZLvArTAa/NAeAsC0bDfXdacVbN/CRQiZxhliBtyHUChNlSn6cIa31NAj0KMc+TBMY9KA==
X-MS-Exchange-CrossTenant-Network-Message-Id: af09cb17-e90d-40bb-8779-08de9094e043
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:50:22.9228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOCH8kkCelqzq+weKE3Xdcg3M3Cy1j+TS2pnY6WrZDD39fx1qkdBI5xC0uLgmcpbex/wUPyILzq99PUm6hnVY7Yh+oUmvHMHUTdCsDgTE5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7551
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

--------------ev0WUZYrxU4ylucN87R8E5cf
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 30-03-2026 01:25 pm, Michał Grzelak wrote:
> gettime_us() on SNB and BMG from CI does not return proper time after
> starting suspend tests. This results in too many suspends issued before
> we hit the duration_ms. Break the loop on second execution.
>
> This WA explicitly conflicts with commit c75dcbdac51d ("tests/kms_flip:
> various improvements"). This WA is therefore only used by SNB and BMG.
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>
LGTM:

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> ---
>   tests/kms_flip.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 1a0517bcef..81fa8dd5c0 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1325,7 +1325,13 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
>   		       unsigned *elapsed)
>   {
>   	unsigned long start, end;
> +	uint32_t devid;
>   	int count = 0;
> +	bool wa;
> +
> +	devid = intel_get_drm_devid(drm_fd);
> +
> +	wa = IS_SANDYBRIDGE(devid) || IS_BATTLEMAGE(devid);
>   
>   	start = gettime_us();
>   
> @@ -1346,6 +1352,9 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
>   		if (count && (gettime_us() - start) / 1000 >= duration_ms)
>   			break;
>   
> +		if (count && wa && o->flags & TEST_SUSPEND)
> +			break;
> +
>   		count++;
>   	}
>   
--------------ev0WUZYrxU4ylucN87R8E5cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-03-2026 01:25 pm, Michał Grzelak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260330075508.1003899-7-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">gettime_us() on SNB and BMG from CI does not return proper time after
starting suspend tests. This results in too many suspends issued before
we hit the duration_ms. Break the loop on second execution.

This WA explicitly conflicts with commit c75dcbdac51d (&quot;tests/kms_flip:
various improvements&quot;). This WA is therefore only used by SNB and BMG.

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a>
</pre>
    </blockquote>
    LGTM:<br>
    <pre class="content" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 9.5px; margin: 0px 0px 10px; line-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: white; border: 0px; border-radius: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span class="reviewed-by" style="box-sizing: border-box;">Reviewed-by: Mohammed Thasleem <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.thasleem@intel.com">&lt;mohammed.thasleem@intel.com&gt;</a></span></pre>
    <blockquote type="cite" cite="mid:20260330075508.1003899-7-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">---
 tests/kms_flip.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 1a0517bcef..81fa8dd5c0 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1325,7 +1325,13 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
 		       unsigned *elapsed)
 {
 	unsigned long start, end;
+	uint32_t devid;
 	int count = 0;
+	bool wa;
+
+	devid = intel_get_drm_devid(drm_fd);
+
+	wa = IS_SANDYBRIDGE(devid) || IS_BATTLEMAGE(devid);
 
 	start = gettime_us();
 
@@ -1346,6 +1352,9 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
 		if (count &amp;&amp; (gettime_us() - start) / 1000 &gt;= duration_ms)
 			break;
 
+		if (count &amp;&amp; wa &amp;&amp; o-&gt;flags &amp; TEST_SUSPEND)
+			break;
+
 		count++;
 	}
 
</pre>
    </blockquote>
  </body>
</html>

--------------ev0WUZYrxU4ylucN87R8E5cf--
