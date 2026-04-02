Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364FED39410
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 10:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE7D10E370;
	Thu,  2 Apr 2026 10:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ga90EEgD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FDA10E370
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775127014; x=1806663014;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=77JTcQTuHa1LLIWP14UtDyPGEvJ6dxyTKZsmmxzaZyk=;
 b=Ga90EEgDnZLdIjazlWgg99vah3oW1FpKTgdC+Z1FY34zza7Xf0AFc11H
 cp2lJYaY7SOQgv8NgreA1HgAraPbdGfnSo4JJ0j2M4x2yv1PiWNEoUxtP
 HXkPlZJgQ3p8eudqkfspkH9WZMIxqCVlm+V6TgRv0UqsOqk4mhGKlTjH1
 Q6TIqzMDnanhDUjwY6/tsZ5y0t1CUP5qBvhEgG7rBlo8vnLmkQzlA6Tj2
 L3Go46z64nQAu0AaU7iyV5ZGWrxuPJjpBTfV406j/kROgUNFmA6waRu4X
 giaYa9JgZ0OepV+qjrM9IOb1DWee5fKXHqbkz746b43rbqE7dL1AFxcYs A==;
X-CSE-ConnectionGUID: xoD+nFxHTxWVAd2i6Jy6Nw==
X-CSE-MsgGUID: R2G6uUMGSSi/kfWteSItWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="86883748"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208,217";a="86883748"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 03:50:13 -0700
X-CSE-ConnectionGUID: Raj4/meYSbqC7AJNVfH1XA==
X-CSE-MsgGUID: LEWFoEHaQSGhBqqs/xZZVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
 d="scan'208,217";a="264883108"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 03:50:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 03:50:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 03:50:12 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 03:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIwCrBo9opL3fem82MH5j1Nae6cUQOGunEAGIv2sZdk/bzUPouZPPkjXPzIfiQAZ2tboz+4B8IRFT7f2+nXv+i8lJEb+aDTLfSDhT4MfilIz1P+ix4N+lI5wDNCMglDpDwQ0QR3cz+kGAO8rkZrDkBjEwJ/gNRts/Wh0IsvRWFKVrM3DAqY8B81HItVnv1cKV420wQtFY3P/uA9zH75n1OKCRlqA10LtWbCGUNV8H0WQ8k7IhmVdmJCOm6sgIAyC5zMc28DfhF1DwbECCdbvBhqIaG0e3ychWh5jvDWvpHyiy8MEDGkXDSG/0Ui3XS4Wy7QRP8ND7Kr/PvOBVoYcvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3aOJAYaN8G7l8rpEAA0zf/JKbzB/dS1+ORf18nrwcc=;
 b=HXtMBi1HqXA2my7oymD+35B5tOsM3mmXdKLloKQn0TX/GthBKrlvExm821WPJyY4K3Mz/gS++ttUXWr2CK4W6U1LDcImttMde0UfhrnvCmUx8IylNaZrkL9RUbClTQ3hgPn3lDyHVXAtQuckzV9zNHMQFs2DcVZDcBGDALsgbi6oXXfE0X3NFuc3DqSQnny0aiqvCOFMLvtez2eCqgQpMOwOxRrl/RFhtC49JHXTgqVoubtvRFvD8Yj7KjnBn26mH0DI6WITmF+LbVV6kBUBSimfdmty4cjGjZ66Rbxyl42GZBa9Ztth9BG0orb3wCs7mkjrTI6+j5oxoHf48+sa2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SA3PR11MB9488.namprd11.prod.outlook.com (2603:10b6:806:465::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 10:50:09 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 10:50:09 +0000
Content-Type: multipart/alternative;
 boundary="------------Lu0IsyfG3WLlrHFgv2wnWcO0"
Message-ID: <ab0c7232-1b0e-4cb6-9905-d4a7042463e8@intel.com>
Date: Thu, 2 Apr 2026 16:20:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_pm_residency: ensure C6 GT before
 cpg-gt-toggle
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260309105756.110294-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260309105756.110294-2-sk.anirban@intel.com>
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SA3PR11MB9488:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a8ce8a-0411-4be2-94b1-08de90a59bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: l8iXbd4KuWBs5pkpcK0DPbuNqK0eQxjAGHBzGb7T2gPMPvrnw4h8lZWvwnV8KfqRpbSk16FfkMki2EF/hzXuNIUZiVgkSmEDeURuv6Bys2N+zU7R+iCB8O7Ek5k5mfck7fj3qFnraNZ6/faWgOYoQaLbA9sfSTFLEJdGc7CE2WkL/g9vojFPSptN+3o/gaEmimFRLohNnJsxuzPvuXHqKFjlqiogkhA39A8SmnoTE4N+bvynsWiLnLi1dBMFIMbUPIKwl8ofK1piXLW6Y+XIVDc/XXBeNtzJlcAVFbVXzR9JZOT95FuxHGrufarWUlhYS4ztkiyXcNd2bqoUwrUXW9fSsdVp/6uzGaiBBYV/d2S7atsmsz0WCh185EouiUD8qArueHSW4PBCxW2jyQ7vV1MXgb5RPtqGQ0APxiKFIeucscQn4dl8HfSbGzTq+F7vvW56N/mjkC7NBLkCqhD1JZoThowsJDlc6F1FoJDajcyE8zLlZKhlM1rwb7Ml1O47aroalugcXLY5H8t0d22Avr1g2fphZAd/mY+qIbteoRWQTptm+mZsJKYV6n/GMVFl6XiSm5h4prXy7VsuDRuETtNve+wbfNVEYAw7StQH2Ojgp36sRDv7Fr8eDPKWfgX9EOu07/y77CdZ4Y4JrJRX/2VYmnhtnNrgpm3CqhXxxP9JAIVx0hLUCOC5wLdwl1hnfOakFXnbwgpLvFT7y7L+99ecxUizKaIGofxJnA13M7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGUyMmNGcm9pQkVKRkp2cStLV2dMeTViVTBrU3Z0UDBxWXZ2bGlrMldLRmRJ?=
 =?utf-8?B?Qk9KSThKYng3RXZEWWlTQVNIYURoN0FsZCtNWFFFZExwZnZidk4zNTV1ZGwv?=
 =?utf-8?B?c0xMMkRSMzNEcjZpaEtNTGEyVTVESWFJR1Zzdnl5ZHh2K2hQU2pOeEtaVThJ?=
 =?utf-8?B?MFlpSktRYTZEdEhkTXlmVk5Wb1lPbVI5TWZvTmNMZTZhVUVseEY4RXpMQzlI?=
 =?utf-8?B?NkFsNjVHbWpRZXZJdnVQMG9CMEh1TFk3VWlSbTdLWmZpc0prVytlUVA4cTVU?=
 =?utf-8?B?TnpKazdXdGdWM05QRDRNS25BNlVIazJDNG5zTzU5bnpDajZtUVJ6OTJIeUlT?=
 =?utf-8?B?U012N1U3WE9yN24rRUl3c3hKbTlGTUh5UllQdlM5Y2tpbjVqZkxkVXo2UktC?=
 =?utf-8?B?YTkwSWlTZkhlQ3FOZ1p5MXJ0VmJXc0VuYk9VWkEySFBsb085clhGdWFjc2Y1?=
 =?utf-8?B?eHlIN0dBR2x0ckp2QzVnc2dxWlVDNzVlZi9LY3lYdUcyL1pKek13Q05ncXdm?=
 =?utf-8?B?WmdHUkNNSWFrVEZmUzkrQ2t6RFJ4OHFPUFhqazVVVm82bWx3dGlIMStJdm4w?=
 =?utf-8?B?L3RMa0hXSWJDY0JKc1BrZjM0UjRSSEoxMWdKQkhaSkFRSmc4N0hwdkpwWnVT?=
 =?utf-8?B?YjNTVnhlSm05a25JMmxmaFd6eE9FZ3o1ZDY2YTI4TEZRa1U1TTlvQkhBNTZo?=
 =?utf-8?B?eElXV0xNaENrT3NDTWRDbzh0V05PS3Q5SVFLb0xDeUJnTi85M0lXSHFzMVZQ?=
 =?utf-8?B?dmw5S0FjUTd5MGFNdXgxQXk2TGV4UW04cG50V0RPalRTMkxOakRHN1VoT2g4?=
 =?utf-8?B?aUEwNGZPRGFaaWFGcjZmczliOEYxWW1iNElWS3hmcmFKYVBXTnpMaXoxMmNp?=
 =?utf-8?B?RjIwMi9HWllnSUhRd0N1SmNRSnpMVzRMNzBUQTg4MEdLSUFLNWxWT3NUYzcv?=
 =?utf-8?B?RkNieGVTbXNsN1JTQVVkYjUvVXJ1aTRuK1VzMWVxWnZwL3RyMjJYeHlWb3Fo?=
 =?utf-8?B?eWJ4OXhwaXZqaG53Z0lFVkdXV3EzRUxBQXVRN0ZVQ0R0ZW8rMVVxTmZHV0pR?=
 =?utf-8?B?Z2pKZ3lSMG1NOHVNRFc3QnhQS0dhbCsvaEI1S2RITUtGZHk2Qjg1TWViK2I3?=
 =?utf-8?B?eDJLMmlMWWdhRmlVRDc5NEZHZFpkY0I1Y3QwR3gwUEZtOC94VERObTUvZmUr?=
 =?utf-8?B?bWlka2RiYzlaRmpDeHdBRlZPWlo3Mld1eEZIS3loMEN3NldsdlVPYW1mVGU2?=
 =?utf-8?B?RHAweFc2STA5bGR5aUV2cTdQcXZJUDFCTTU5ak1iM3dNUTYzNXFKaitRY21x?=
 =?utf-8?B?cHAzTTBJazF6TmlsYVkwZ2JvL3ZLTjhWSDhucFYxWXF2dmw2ZE9xaXVwR1BC?=
 =?utf-8?B?MjlBMmk1SkJQWWlnNGVXUlFwR3FwMm1DYkRiNVdxeHN4aHRaNkhzMTdIa0lH?=
 =?utf-8?B?a3dNOXp4QmhBWDYxYTlsMEk2OHN2aWFuOHQxeUg3azVaejdzUERWejAzYzIr?=
 =?utf-8?B?ZnRBc3lTdlZiQmRvOTUrSmQvMDJDaVRaZVd3bGdSUFVocTNLY1V4RHpHaFUr?=
 =?utf-8?B?RU80eDU0VEMycGV4UlZPbnNqTi82dTkwZE5vMWVxNldISURtektIQjRteHhy?=
 =?utf-8?B?SXpiR1FOS0JMZzJ4c2NYcDQ5YzliYi9kRitlcEt3bXVHQVJ3YytLNEVjRUh4?=
 =?utf-8?B?Z3g5Y2lRbmdZcGkzWXJYd2FQbVoyVnhuclFLTE5sNWVaR2twbEZMRVJ6VEJh?=
 =?utf-8?B?ZS9oUE0wcWNWQmxxTjc2amxxdisvczhtV1ZxbGovZ1hNdDVIb0t1VFZOWmpl?=
 =?utf-8?B?eGVDcGRWZ1MwbmpjRitRUm4xdjQrRXY2Y1E3MlExN3M3b0pabVpHczJhdllF?=
 =?utf-8?B?NzF0K1JNdGlOdklhSkFxNG9YR1BXOUxYOUtRUWNqaEJGcEM3dEFZcElVclRR?=
 =?utf-8?B?NlJvc243QnQ3cTFJcTYyY1I3dlY1djY1ZnpLR0MzMEw2L1BNMm9yQnJ1aWUv?=
 =?utf-8?B?S3A2MXIrQVdOdVlzMWNvdGFwbjE3Mi96NE9qY2JnWVIvWmxIbHhxZ0R5OUlr?=
 =?utf-8?B?ZU1NdVFKTnVWVXdremt1T1FILzVYVnhKUzFzT2FwQ1FlQzNLUUY2VDFrR29L?=
 =?utf-8?B?L0xRUEhtWFh1a3BYVmMxTFpyeGRQd3RGRWJscWh4dXJPNnFxTEp3VXdYQkt4?=
 =?utf-8?B?d2pyRUhxd3hZemJPNmRvQWtGanNraVhxWno4SGZJZ3JiakhMMTZhVVNzbU9u?=
 =?utf-8?B?Q3hpVTcxRUlOd2tJdExOWFBKOExiemRjL29XNlhqTW1LeG51a2VUdWVGRGVD?=
 =?utf-8?B?N2VpT3RqY09oWkw1bHNMSG9vRzQrV1pIU0pwL2hxemVsZjAwcTczQT09?=
X-Exchange-RoutingPolicyChecked: aS9bU4ZlYD/z0BDx7vhxk8pFTKvEzHkYRGOFUdZ2aq1gCMOtAyGAhl3ENCXdZdLCvOqeNCtN1nkqVilNDqcut1CndeLaOhaQWSVFqS52wz7XmA7FxBh9DPU0TzX6E83pKtKUdXLaPuIi66/5fqEScE8KIqZpJpkGdjwAYuWMOqkWrnVFnmREWh3XZ0PpAtz+SxhvNMOSfhFgL/QOID2g6A8CZl4bgbDHOAw+ZP3O0648cbdSDclhL2F7LIme2RgKgQZtkkoCtA0nStChFy05OOVXsALzjMpZTZfDrww+wE3YLn1A5+XG9cRpxX/16Ih3hgSqH0IfgBjyTspUWBM/DQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a8ce8a-0411-4be2-94b1-08de90a59bc1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 10:50:09.5416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYZujSOQsRe/eZIjUATD/K4l+JdDZslHJwazp5/39BDIlxtRbYyy3rQ7sAFMEJGoKY0abwd3Exr8bq+WSbCyAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9488
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

--------------Lu0IsyfG3WLlrHFgv2wnWcO0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 09-03-2026 16:27, Sk Anirban wrote:
> The test assumes GTs are idle before forcewake is acquired and power-gate
> status is validated. If a prior subtest leaves a GT in C0 (GT stays active
> for any reason), the final power-gate checks can fail for the wrong reason.
> Add an explicit assert for each GT to reach C6 at the start of the test.
>
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 61b63ed4f..d21878682 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -399,6 +399,10 @@ static void cpg_gt_toggle(int fd)
>   {
>   	int gt;
>   
> +	xe_for_each_gt(fd, gt)
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> +			     "GT %d should be in C6\n", gt);
> +
>   	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>   	igt_assert_lte(0, fw_handle);
>   

LGTM.

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>

--------------Lu0IsyfG3WLlrHFgv2wnWcO0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-03-2026 16:27, Sk Anirban wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260309105756.110294-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">The test assumes GTs are idle before forcewake is acquired and power-gate
status is validated. If a prior subtest leaves a GT in C0 (GT stays active
for any reason), the final power-gate checks can fail for the wrong reason.
Add an explicit assert for each GT to reach C6 at the start of the test.

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 tests/intel/xe_pm_residency.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 61b63ed4f..d21878682 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -399,6 +399,10 @@ static void cpg_gt_toggle(int fd)
 {
 	int gt;
 
+	xe_for_each_gt(fd, gt)
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
+			     &quot;GT %d should be in C6\n&quot;, gt);
+
 	fw_handle = igt_debugfs_open(fd, &quot;forcewake_all&quot;, O_RDONLY);
 	igt_assert_lte(0, fw_handle);
 </pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span class="reviewed-by" style="box-sizing: border-box;">Reviewed-by:
        Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20260309105756.110294-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------Lu0IsyfG3WLlrHFgv2wnWcO0--
