Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ACFE674B2
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 14:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3261F10E6AB;
	Mon, 22 Dec 2025 14:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zi0N8Ij2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C49D10E6AB
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766412250; x=1797948250;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3CeD0HT/tXEK7PobwTRp/JeXh9VCMmH6h+xMGCzNKyM=;
 b=Zi0N8Ij24xFSBlQ+XIUAiCNstIei3ypiaT9hjRWmpMUF4JC0uQHxeI1s
 meoMXcK39p8xx0frJirhFPz/i3SmdrS7+4ob3eDl8An7h+DrhHrpLRle/
 FGPu2mi0pZzAzQQCLjmaHkcn95aTC+25AsCuw5DAkUtsY01e75qnliAkw
 rC0RIg1krG5lo2ZLIwj8tI/xAe4ntWh2v5roR0rDwfVo1jGih9/aovXPA
 vQn5mr5+FSW5E3r3FozebiSKX+tECqw5tahGQASUcfw9eJK6LC+JjX+Xa
 24tnQdjadsLQ0GJRrZUfRxQI2zWMD06jmyuTlJmpt8OBSFmX287K04mTw Q==;
X-CSE-ConnectionGUID: qR6+WBX7R/G02oY41e3Euw==
X-CSE-MsgGUID: 5lWu8fOiRTi1MpvUxBzuYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85848680"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="85848680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:04:10 -0800
X-CSE-ConnectionGUID: ZSMwMwl/R/aGPAzMunr/RA==
X-CSE-MsgGUID: o6PK/mq8TFqkeOUo33iBjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="204004377"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:04:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 06:04:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 06:04:09 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 06:04:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMdrgaDxBSlAvPRTZXcCWDoj22NVRmAQ3DWe99mxogbuiBGp6upZ43qucYiuimhdVY0Soy40sbAqY6FyAvt/yffRkIXcXEiwWvn4FFxchtRRpMSQoNT1nVE9e0+OLGnpkU8CH4oHPRF4drpvGzQVLbGWL7yTD0Kgqv8h3DikjlTDC1hJWKxFv174l92z3rO/tei55Edd8Wnkk5iidFVsD1mUtg+xxhcg2XEuoE6cPTrqjjn5qVjWkErepMS/Z3sAtTFRYwSNfcsfJTWWq8Iuji/rPBtLj2d3s3+78b2qZmeoAxDt8n2dQkIHN+SE1s10kai0VBAUG4wcJLpNUrgFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiN21d5N36BfBwxev155BbfDkFP3VSGfLISi3nC+50o=;
 b=rvKJqraZOD2CKlsnGm3oOeuwaUIMeT1RQ5yitnK1m9di2elQoe/APCt22dar8XbHJ4MAxZ4wUUwFlq+K66BeBeC35HrOjR+xm1kU07m0IYEObWWRmCB0OD5K6P24+wBcS/NG0T8jlB2esiF5cuuWtZSaqs8jWn5/7ZrV+zTx9ASoM+LwTwDZDYZ+T/x45Q0D4HG5AMSxJ6axqYTvoR7G9odIODDEDH5tCywlZkMEttCGuAmncUwS47CV7SbSlqVdkSSyjX5g/ZG/wUOWYXJ6Kpb+tVcEdpGVK33NPprGhfc40xml2dQXS1mAaiDksOp+aDG7jPFo5BJOSwB1gWUTsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 14:04:04 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 14:04:04 +0000
Message-ID: <e7443c32-93f2-4e5b-a79c-bd28ace656cc@intel.com>
Date: Mon, 22 Dec 2025 19:33:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v7 5/8] tests/kms_color: Add helper for plane color
 pipeline tests
Content-Language: en-GB
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251219112606.1330425-1-swati2.sharma@intel.com>
 <20251219112606.1330425-6-swati2.sharma@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219112606.1330425-6-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0114.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::11) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CO1PR11MB4770:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a2164d-f3a7-457d-7894-08de4162f726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2s1SHlJVkJRRXMyZkVQNlpyUnVocER2bmd4Tk8yZHdkdWR0Y05YVS93V0oz?=
 =?utf-8?B?RFBFT1FOOGZVaXhQQWhrcFI5R2pNSVNRRU5rTzE0SjloS1JiVFJYUDBpbGJQ?=
 =?utf-8?B?amF2RjNZUTk3TzBHckd4Q2d0L01neko2VDkwWVJTaVFtRUZlOGN0OW91K0ds?=
 =?utf-8?B?bGhETkNoaEExYVI4WlZnQjZ2QmdrNmIvYlUvbDAzdlEvcHlkUzVCbTRQV1Bx?=
 =?utf-8?B?a2gzZ1RDYlFhZzZWNmxxSzlxSGJjbzJIYzVNTHBmeXdkSmZFcmZwTEpoQk4x?=
 =?utf-8?B?VGprSUJsT1V5RUFNZklJbDd5WmlHUEZHQ1NYYTlsdlEreTZEd2pZb1lzVE1k?=
 =?utf-8?B?c3ZXQWJtVkRHZ0FTR0lGeTYreWJwcm4vc0IyWEVaaHd1QVREaHBVczRMSm9s?=
 =?utf-8?B?UlFVRGMyK1dxbUpUelBWWUZ5dE02SG12UWZCQU9kVnFFamJIdHJZaUN4b2NL?=
 =?utf-8?B?clZQWGhDZTBYSWZodU9lSTRQUExSQWk4MCtrRDJzRDFzejIrZ0F3VzFuclQ5?=
 =?utf-8?B?SlNzZmtDb3NTbGdxMFhQVmpTTzNFRWJUY2J6czUrVzVFTHV4UUFZZytKQWdk?=
 =?utf-8?B?S3RtaE5ieGZmdzVldEZxdEcyRWNZQjBkQ0F5VGpJMEZiT08zN1orcXAvc2JY?=
 =?utf-8?B?RUl6bnBVcEd5NlNMY0RNZ2VtR0VMcklYcjEwV0QzV3AxYy9GUFBCNkJRNUFi?=
 =?utf-8?B?U2EybEc4ckwxZHdKZkpoZFlhVkhYZTB0WGJJdW5Zcm9MRERaeHBmTkF0a0pv?=
 =?utf-8?B?MnRLOC9vaHVKK3lwWnVaNE5PSUZWVlRneGlTeGxGNjgzT1RUdi9qRm4rNGE3?=
 =?utf-8?B?ZXlGcmRkcjE2VGNvVHQ4RDNiSVJBUFVZNFlnbStBOUtBWkJNUGFXaDF4N1BH?=
 =?utf-8?B?Z04rV2lnbnpDSndTL0tYREZQS2xGTUZ4NVc5Y1p4VUE4YmZOTUFCS3VMVjVH?=
 =?utf-8?B?WFB3VkZBUy9ZYytOU1JwcUZVUHhLWXF5STAwcW02eVFPSHBOL2lrVlVzRU93?=
 =?utf-8?B?WFpaMW95bndZZVIxY21QZ1RIYUdkWTZYZGFIS21GUHQ5Nnp6VndyR0pMRnVs?=
 =?utf-8?B?YXRxeDgvRTRFeDNFNDZZQk01aUtVQXhlT0ZWMko0eVpIYURNWC9jUHQxYzVW?=
 =?utf-8?B?S2Fncmttd1NRR0ViYklGNzd4a2svMWlzOWxaS1dTWmxNYU1CSVlGLzhnWXhV?=
 =?utf-8?B?SDFpOXlmR2hFZGFXWWcvN2dVd29aM3lSekRQOXNRNTUwU3FYTjdJUDFjLzFF?=
 =?utf-8?B?eGk4YjNIaFFJSnZtR3ZPNFlvRm90TmZZdThLcVcvN0h6QzNJbjlheFVZeXRB?=
 =?utf-8?B?eTF4SjJINFB2OHIzYzJGaG4rTGw5Wjl1ZGpMNExWcElzYi90MllReWtLYnRE?=
 =?utf-8?B?Yi9YUFhnWmRLT2VVYWZaOGZYQWtEQ09pZkMxbDF6NWJLNDRuenRPcVFMWjNq?=
 =?utf-8?B?T0svbTIrdUZuRmVoREJuRWE0ZFIxWXBkNnhuM053ektKdC9GMFpSZDh6b01p?=
 =?utf-8?B?Ly8vdlI0eXpXZTZxd1RWY2plb002a3g1dzZqYU10dGpCeWtEM2srUVNVRGs2?=
 =?utf-8?B?dUZXaFF3Z0xzUWl4OUZDeWdmZkJPZDNpL00zUUIydGd6UTlpVDFFZTJldjBt?=
 =?utf-8?B?VzhmaTVTdnpJSGMxWnF2ZzVVMCtEZENrRC9EM2dQT3huVjdFbm9leEw3RVFC?=
 =?utf-8?B?NzRCMWpPOXFvZWZ3alR1aFZMUG52RnpCRkhzUGg4QmQvaTFld1BnaURTYWZR?=
 =?utf-8?B?SzZjUElRbDdoVEtmMG4vSzhuVG9KenkvM0hodHpwMGVyQXlPRU9iQkJDQzN2?=
 =?utf-8?B?ZE85QUFiYzhJalJqOVhkaWZvSWhBdFBRbzQ5MENQR2x5MnZISVd0VUt6SUtN?=
 =?utf-8?B?eEJOdDhhajlucUlzbGtMMHphWUJvcGZnNkU1NE16YTl0Tm5PSUhzZGZzU2NQ?=
 =?utf-8?Q?u74Mes0LZ7tHbHblSSp/IdCMfhINYr5f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkVpSTJKNVdTa1FBby9rR1I2TE9yQkVSNG1IQzRoNW52V1ZIR2R3eU10NSs1?=
 =?utf-8?B?dDVnaGhZK3g1Qy9QUXk0bzk5aWlWUEZncHZqT0JXb2IzVm5JbTFzR1N3MVFQ?=
 =?utf-8?B?TnlmN3F3YzJpMXdqcUtzdzg2djVQTElPZ2RWRUNmVHArbVFSMjl5QWttOHZX?=
 =?utf-8?B?bGRsQ0l5ZU9uSXF2Rk9jamxKL25lWGlCNFJUdjEzWkozbTJmQzI4a21kMzRm?=
 =?utf-8?B?MW9oRURhUFpGbzNON3NrWUNrR3BLc29hb2lCQklqODFZVy9BQ2dtZ2pFRXRz?=
 =?utf-8?B?QnN3dkhjeDBVU3pjNEJWYW5sQkNIQmRlZVB2MUJGNUdpZnR2OG1KT3BjY1ky?=
 =?utf-8?B?aVpJVWczTkIvR0Z5YkhTQm9SNzI1VFBpRkRETmpHTFZ3SkQrK0pqcWpQRTdm?=
 =?utf-8?B?bytkQXBvOGw1WHl6L2dHWnBGWmxlNVhEQ3o0QlpUQmN0ZHpmbTdqdzVHUTg1?=
 =?utf-8?B?UnUxNnJYYUcrS1lVcFlvczcrUmNjaXdLbXY5Tm9PZStqNlBOTWFmMnNtSHVG?=
 =?utf-8?B?V0wzaHZob1VlK3dTSmVEUGtZd3ZEOXhxbHBpcy9aOG5yaU8rRDJsZm1odnV4?=
 =?utf-8?B?c3o4b1B5VElkSEpNQ1FIbUNwaWRiUE9DYWVwRTZxT1duNkp0clk3TjY2dzBu?=
 =?utf-8?B?Wkw5Rm5YY2VlbFlUTEFPRFc1eXN0b2pHNkY5TUNMTW9uY1NmcW9UMFlEblVq?=
 =?utf-8?B?RmhYTEg4UWZZSVpiUWtJeXhWM0FXaHl0Q083bTJ1ajVmOG4wWmZPdnVqR3dP?=
 =?utf-8?B?aG11TDJXeWozVGxMdzVCeklPeTJjYkg0d2Era3RTVWRaLzQxMlhjemlMK3dI?=
 =?utf-8?B?d1hxYWVnZ3Z6akdCQlM4dG9xYTBEbEF3VVM1UWlYKzl4K2VncHY1K1BLYm5u?=
 =?utf-8?B?SHEwYXJBbklnZ0tsZXFpS2xtL0liUE1oN2VRWEdtc2xwNGpnZXdWM0Q1Tnpm?=
 =?utf-8?B?Vyt2RkYvaERud2E1b3NROFZ4ZnM1VGtuMlBGdC94K09ScHROenlvUFNmM2Y1?=
 =?utf-8?B?YUFFcTJHK09Ub1RSVEh1cUgyV0xGVHg4WFlNU2V2ZkRySzM0eUdISU1LMDZI?=
 =?utf-8?B?UVduV3JSb3RQcjJhbHIrRmdVQWdRRUU0bDU5WGl3MXBmU2craFFDVkFSYU9y?=
 =?utf-8?B?TDljSlVXOUFhcG8zaUJhbjdtaE1DT3BEZXoxUWZmN0cvMkJld2pxbnJOcUtX?=
 =?utf-8?B?ZVRSSXdUclk3dDA5ZDJRb0NzeWJTV096UUhDb2RvYkF0TzEzeFRRVi9rblNN?=
 =?utf-8?B?TTFxNzBGeW04UXpCb1NSYjR4OTl6cDh4OFp1OTd0SGZCRWZSeGMwc3VLN284?=
 =?utf-8?B?bGxKSVF4dXhyT1g5TGd1V0owU1RzMXpRY3lGSXFhbFZqNlcwMkdiRDl5RE5G?=
 =?utf-8?B?L1N1YUx0VkFaUmMzY29NOS9QcWFKSkpFTDljRHNyVkpERjc3NnNCaVNmdm1s?=
 =?utf-8?B?N0JiZGhHREFKTis2aEVza29ZamJ0Y0txNkJDQlNpUlpydkJzbW4veUpPdWxG?=
 =?utf-8?B?dytJNkpXLzZERFhmUEtGNTRaYzVCaE15cnRuMkZqVWRseVpHU2p4WTY4cTgw?=
 =?utf-8?B?SGRUMkRMSENCUVFZWEVTd0p1dFdDWlNuNVBMaGRzUDAvS0tEM0pZYUl2NzNo?=
 =?utf-8?B?cHlaL0oxNWZFazZsNXdBUTdoTnF0SnJGWXFxUjdjaFpIT1BtcnhXUG1uYXBu?=
 =?utf-8?B?RkZ6MG42UkxVS0hvb2ZOcEkyZUdDOGM5ZUQwQkZ3MXRiaDZsTGJEQktwQUdv?=
 =?utf-8?B?akNXTVN6NU9jS3krcVhBRVBCazRKdjBpZmFEVkJhYk1KeHZpUFNra01XYkpx?=
 =?utf-8?B?U2lUQllsNzdKc2J6aTVwNWk1KzlyVFo4bkZkYUhWVTVEaDBrQW5WbDlrUWln?=
 =?utf-8?B?NUI1ai9Jek9MRlhoYkl1Q05sODl4SWZSWmFDY2JLNFRMbWNJZFByVUNnZkV3?=
 =?utf-8?B?emJTNjFiWlNsNVk1Ylo4ZEN0RkNoZktSblJERlZnRmRGcjZjT3pMREc1dmVE?=
 =?utf-8?B?MXc5N3FxNFJuZktSSFF5cG14M29DNmZXNlFJUXBaNnBCcWEyemM1cVE2Z29F?=
 =?utf-8?B?U1lMYmNURzc0QW45bnFKMHlIQ3lnZmQyOW15R3QxdkRzaVFYUVljV04yOGl5?=
 =?utf-8?B?WEM4OVMveGxkLyt4blZNS2JmUDJvY08xNlVIdXdkL3dZakY3aXBEVHFuRXQz?=
 =?utf-8?B?TjdyeStDWHJsMG44ODlKNnVhRFFvaXR4TGg4SndzTFFMb0hqMUd4dGFiZ0tW?=
 =?utf-8?B?UnlOKzVLYkVpSW05ZW1qUlFvU3hjS296WDlhTHBzM3Y4cS9yWEJYQzFOVXp6?=
 =?utf-8?B?aHlsdG02R2haK1Jtc1hTUlJRWkFySit6VWZ3SDVlL2dHcTEvL1RpWGF3c2pi?=
 =?utf-8?Q?zlOwGLoy9mGmvv5E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a2164d-f3a7-457d-7894-08de4162f726
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 14:04:04.5240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIzBmUSW959HHaevGSPko6slxwWVHQFfJPZ0vO0h/qqYLFKH/uJk6am9FBaR91EMJKAGoKCvv2+HMUmBWUs9DFTbR2SsmYlsJ/pfQoe/C2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
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



On 12/19/2025 4:56 PM, Swati Sharma wrote:
> Add a helper to run plane color pipeline tests across
> all pipes and outputs on primary plane.
> 
> TODO: Extend the test to multiple planes (HDR & SDR)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_color.c | 38 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index c3c064d53..85c7d89d6 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -816,6 +816,10 @@ static void test_setup(data_t *data, enum pipe p)
>   					  data->primary->pipe->pipe,
>   					  IGT_PIPE_CRC_SOURCE_AUTO);
>   
> +	igt_display_require_output_on_pipe(&data->display, p);
> +	data->output = igt_get_single_output_for_pipe(&data->display, p);
> +	igt_require(data->output);
> +


As I understand this was done to avoid going through all pipe and output 
combinations for the plane subtests. It should then be within the helper 
below (within for_each_pipe) instead of adding it to the test_setup 
shared by all subtests.

With that,
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

>   	igt_display_reset(&data->display);
>   }
>   
> @@ -909,6 +913,40 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
>   	test_cleanup(data);
>   }
>   
> +__maybe_unused
> +static void run_plane_color_tests(data_t *data,
> +				  const color_t *fb_colors,
> +				  const color_t *exp_colors,
> +				  kms_colorop_t *colorops[])
> +{
> +	enum pipe pipe;
> +
> +	data->color_depth = 8;
> +	data->drm_format = DRM_FORMAT_XRGB8888;
> +
> +	for_each_pipe(&data->display, pipe) {
> +		test_setup(data, pipe);
> +
> +		data->mode = igt_output_get_mode(data->output);
> +
> +		if (!pipe_output_combo_valid(data, pipe)){
> +			test_cleanup(data);
> +			continue;
> +		}
> +
> +		 /* TODO: extend the test to multiple planes (HDR & SDR) */
> +		if (!igt_plane_has_prop(data->primary, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-%s",
> +			      kmstest_pipe_name(pipe),
> +			      igt_output_name(data->output))
> +			igt_assert(test_plane_colorops(data, fb_colors, exp_colors, colorops));
> +	}
> +
> +	test_cleanup(data);
> +}
> +
>   static void
>   run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
>   {

