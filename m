Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1749CD5BB1
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 20:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B15D10E48D;
	Tue, 26 May 2026 20:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVVwn9uF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85ED210E1E4
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 20:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779827111; x=1811363111;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/7cv/Ktq9ZdSO+46h2Lja62XeJayjDBizdOkuj0TCoo=;
 b=AVVwn9uFC4D39DZQ2ufyCrx28uixJy8OiPMP36zX/wWPfOI+0YQHAX2c
 hepnprtfLMndK7ciHvyHaQASFquanZEe6TO0TBNZl9em0xVAfh/+C3mWH
 HQhGXc/xC6RWfBHEjstiHrwwfknm70z6WVK0szTThSymOQUzDirw0mrVF
 MxCFY+6k7V+hz0bxmQGlwu6U7kJOqtj1xTIEKsNn7qelyja9eVdIeonaB
 KYQ/HN7+lc0XSqVayUzXP0ij6vauAbzGsEPZgXaNYJbfuW7/a8BbLLDvf
 MtCoclddEYrnJxzFx3W3uE7tu8VyuKCVWmIb1UghgcI28WDcsSZ2pguX9 Q==;
X-CSE-ConnectionGUID: /TZiKZjpQ16n9oTMkWUNiw==
X-CSE-MsgGUID: MQ0gq6Z7RZmUH8zfm0txMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84277330"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="84277330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 13:25:11 -0700
X-CSE-ConnectionGUID: pVelniH8QLKLroUpZP9SYQ==
X-CSE-MsgGUID: oln+f7fVTaKmKha9eF4DaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="241187360"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 13:25:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 13:25:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 13:25:10 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 13:25:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDwqRjp5G3kNMGkwAuAMEXz+bphPxZ0MBdhcJG778KPXej707heXwnABOsVbUKgSPL0F1U/VaWkXHQ/1vzNLdXzpMiq01yypjSc1EqvJZ+4FfRLvlUvbkU/iu9EIOmEaCy0NYZlzF8heirbhjy+9HB6bmkIjJaWSqisgJXIoGDyZiLcG10jzEzkW6S3SN9TaCL4YAMuqQkUtD6Yb0QRoFgx4zcbBiq6QffrHkihgKZLssKsXESGhVgrGdyLcLHYVkieOZaGUAYCAxP9XOvng3WNfLpfyXvpfS98nG87UErFGW7W8lvcJvBGRxsODpQ6Syyp3b+ENpWQ6ZIY8yC+dQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNGPT1o+bbxO5TqoJh281o5P/n5MF9OD3YLFWqUMDLU=;
 b=XIoxKqFyZHZzAL2ilJreIjeQrxHasS0WJ3Pz2+UNk8b9mMVV8zTTzggUqN+3zx4b9obYET/7MGH/rXY2bwbML3rd/znJY/THQVcDcFy82Sh6uxRUH9PbGY3qyjxXMcKU3aU3/emuR6LW9hJV9YSAJ8KQQ2sFI8+YfVNzceLEKoGIwbgYn+/KFe2xP9J6iVTDC+TV/7UbqOv6g7c5A7l+c6uzJ7lSmnH6paj9W3fKg569wij9y7K8kaIfqHekoqxBBjG6xcH9XCC0elt6h5+Dk2ugz8kjzsp8e8m9Cm1F/O7Y+RmQsVXgagfNXHEEzLraMbXRZ7oDID9v+ovDUf4Gbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DS7PR11MB7806.namprd11.prod.outlook.com (2603:10b6:8:db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 20:25:08 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 20:25:08 +0000
Message-ID: <fcb679f9-db63-4e70-9e5b-54e1c478cac8@intel.com>
Date: Wed, 27 May 2026 01:55:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Remove verbose debug
 logging from rotation paths
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ramanaidu.naladala@intel.com>
References: <20260526082751.1852524-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260526082751.1852524-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DS7PR11MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ed5e1b-540e-4cb1-5cae-08debb64e128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799006|6133799003|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: Kw7/EMdtzopeTJlKxnDKAqAqWtJZsP3L650Ukj5pAhzitXDB2SCEwgLUTbP3fWY7qZ2B4ILaTX0mUEyDFlr0EFoaaqWH73mOGftwwuELQkccUEefQuJ9DOPAw0mLU1/Fz9J74eTtp3RiPyKEaGsOGnGvw21K2XFBTZbCrddoZ+GKpU7yUk6ArEkLGIzOSaYzaSpynu3pkvhWrQN4UMwW8hRAwVmzGdcyYEokU59e7c7/g+NokN7g0VIqdVnRjI/mnNb/XiSY4aPt6q3ow4BUFraApGb2xe7o2T+41KuDuFwlhS9sAdGmcj/nKoSi7V3L6CzsBH+47a17NKs8wgGFQFcLJM0I0bLQTzecPjGkJwbCvWECxjfOzvU3NUxGRztLomatQHbmpu32sVkntr8TNbpFNiE4uyHST3JAR9e7oDPnGN9RJn6jDGGiKHbc73tgV2Ss1krw6zlzXZMTOoetzntGxFTiLNPKCI9GV0CscyGpOaEOY1+E5wjCsO47BeGHs7a1MWmroDpPjNSpfvqBhlLy4Hu5fRcFX4QCvZqIVPyVbyGOlXSUttO/P7J9w6+BxceTnDcydfcDxjZmtBsInk2vEbMta/lJp3tJj+W6kkjuhkFrF+MOxDRgVLAl0kdIqvtx4GGjhP0pmr69ESBnRaTYKVABGSs/o8E7fe6iUq4tjai2hS+8JjAP/5DXbSkT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2hUaHBjS2dkSE9yVUJKaXlWRzhJR01KZFc1RHhxT3MzeE10RVhjWGJiWDgy?=
 =?utf-8?B?OGlQd3N6enEweXRTL3l1eFhoektJZ3VvWDdXa2dFSVV1eURONnZpMlZHL2xL?=
 =?utf-8?B?YmJ6bE5MYURGL292eldMKzBqZmxXZnp5ZkRpWXhLV2NoMS9pQmVRc3Joc0hn?=
 =?utf-8?B?UHBTZk5NZ0gvYmZpRGpXSnBIOTFoR3hiOFpPZXZTeSsxK28vQXpBc0UvT1Uz?=
 =?utf-8?B?cmhvVnhiNEJzNWswUlJuUDRuS1RsTUNJWld1ZHBoalRRcmZpYlRlNEphWjIw?=
 =?utf-8?B?RmJJbW1naVpHSWR0QTFzNWdOZ0lJNlA2Qk8rL0krZFFXcEx5Y1BJeDRYMWRB?=
 =?utf-8?B?MkhIUm12WU5lSEpSNW8reWpwT0NrQjZDYU5BMjhYNmJDbWFNNFp4aVVGUTgz?=
 =?utf-8?B?dDdXd1pkYVFLdTYyNG1YcEttbHh0eEVzdTc0UzB5NUpiRDNZQ21sdXpXa1JM?=
 =?utf-8?B?RTB3VkFOZlhuVXRVeGo0Z3EvdlBLbW1mb1pQSmxIeVhxN3RUdHNtaDhLMWVS?=
 =?utf-8?B?OUp6YlpKWjAyTkVzWkpOSXJPQVY5Ri9IUk50cTF0UWVFS3JVZUIrd3FuZTB4?=
 =?utf-8?B?NHhtaXlFaUJhQzBpMmFBVlgyZlFuNkl0a1IxQXZ4UWE0TnJwaTZib3BHb0pl?=
 =?utf-8?B?TlJKK1daNi94LzU5YW45d1E0MmJvVWwwaWpscnAyUVlzUlNpSmxMWnhwNjdG?=
 =?utf-8?B?bVdxREZKcFRMZDIxRnd3YmsxRmVaWGJrOXNkN3VaRCt4b0VucWxtYjNPa0ZX?=
 =?utf-8?B?Wk9YRGQycXVSSmRmTzVpTERaTlo3VTBWY1Z5c1A0NXRUTzZIMTRoeVFDa2hD?=
 =?utf-8?B?Ymkrc0s1R28zUTFyTW9RQUE3UGFUeklRdUdKVU14Um9pMnVIbGtyaUUwM09X?=
 =?utf-8?B?bmtpaDNabGt3aGFVZ01OdDNIbEtvWEF1TjJleklHRjhyRU91VGVhbEJpUlNo?=
 =?utf-8?B?MnpIdEFTNjQ3KzhqYnpGZFlmY2o1TUlrelhESi9Fdmo5enE2MkJISTY1cjBo?=
 =?utf-8?B?R0tBanJJU25KclhNY0NoM2prOXczNUtqekRaL2tIWUtMWjZoekpFZ1lYLzM0?=
 =?utf-8?B?RWgwNERVU1RLYmNFQW5OemlxV3RaMjd0UFRydHZVM2dFTzF5bVhIc1YyUHBy?=
 =?utf-8?B?WGRmTi92c0E0Smp2clRyRmIySFBseDdLVks0bDFmWHlXVEdoUStmT25QNzhV?=
 =?utf-8?B?T0R3Ni81YTB1aWFjTEhSNG1KTzJ3dnI4eXRrSmRNSTlIdDRaZ1h3RFZQY3lw?=
 =?utf-8?B?MGNCR0RWendTOXlFQkVXMWVKamZ3OWxpekpGRkgwUGk0c1pCVXk1clVQRVE2?=
 =?utf-8?B?TnZRMnJibllnWHowYXY5MTNvWlpmRHJWOWZKUmVDVTU5dlhYbXRQTDZ2T3pW?=
 =?utf-8?B?ckdtUzhQbmRjSWZrd1hKNmluZURabW5jRU1CUjNlYWFkWVdWWHg2bXJNajRq?=
 =?utf-8?B?MzBTV2JZQU9DYy9ORHJLYldvdWJwRUtzQVJ6TGtxYkZQeDRUSzBFNXh0WHpo?=
 =?utf-8?B?TTVXWXlXMHB4bXZpczBJaUtjbVBRNE9vWk9UczVpZUtrNHJIZ0pVNTRNU3FC?=
 =?utf-8?B?RzVTcXl1WXkvSENaaTA2SHdkTkhzMXBvOXFYWkJJSi8zd21BeGVmMjFpdEZy?=
 =?utf-8?B?NXlvcGlreTMrMTBwK1VpanZ0YllaTXlmWFdUdFk1RzdkNCtCaHFBb3h6RGJZ?=
 =?utf-8?B?OVR4SHF2enVkVFNGbVBsdEt4OGNnZThHcDVUZUJqdDh1eU53VEFNSmgyWTZv?=
 =?utf-8?B?ekVhaDJ2VGQxV3BVU3dSSmtGRWt3R2VENmVzYWFvTXBHeEc3OThWdmxHWFpi?=
 =?utf-8?B?S09JSnJ2bGNXOG1obXZJazlOcmdGVVMwUUJnZ0ZXZ2lEdENjdVp1aXpHMU00?=
 =?utf-8?B?clpwa1pLMHFEQ1dLU2JONFhCeUYvSHF3cXprS2w3bG1XVk5zQ2crNkhET3oy?=
 =?utf-8?B?UlRlOVBGTXNwbFJYM1RzUDVHd0l5VmNGQks2emRBSS9WSTNzZ0R5c0NxblNr?=
 =?utf-8?B?TU44WThrOXRmbkN0QjdqUFJOcnlWNVdLNlpGRlZIcGMrQmlsL014cjJFYjhP?=
 =?utf-8?B?aGcyTUNGbk5ia3hpYllySS9jMXhKUys2Mld1dVNTb0JXUFFiWmpmRzRLcnF1?=
 =?utf-8?B?Q2xiV1hYVERZOUFFdk1WS25hSFJwWThDV3RodFIwY0ZJdCtLQ2dRd3ArKytX?=
 =?utf-8?B?SU1XamQvUnkzM1l0WmJzNlRWd1NhYkNxeWlmVkhGL1FKTkRQS2JxOXo3UTB0?=
 =?utf-8?B?a3RETDlRVm5LOUdFWlVjNTdEY1NhcllTTCtoM056Y0VXcFFQS0J3TjgxNUNS?=
 =?utf-8?B?bkJaMzl1VFhTTnVPbkRabjZocFk3NEdvNlVBa3VRU0ZQbGtjaVpQM3ZGSmli?=
 =?utf-8?Q?IMz2zUYfS1K+86yc=3D?=
X-Exchange-RoutingPolicyChecked: Qg9s4n7LeS7U39pF1hkH0GumbSWC+wVgmNqjcYwkdCapyAgGYgJqzU1QoxjFzZanApS5zNJPVWqeNf+oh87tekHPBTsjxKJDGATngp01puPL3gYIObLIhW3I5l0DrXrBMNS4WsQ9FX6d74pCo3Y0zWSRmRX0WHAdPKUpdpuQJxEi5n9SgUytbkytC9LteIqPmgo1itLU5qmeGw+kG73D1w58IlIZ5lxh+XEI6uu4GlUUUSmLLibEfQRjmcRtFNGNp9mL0sFqJ0WWwvhSSozp6VVWWVqwS/f+ZQSJ0PPZh8tD/0s0DOLTT5Q5rVHB42pFXXQ03AR+gm+JdcHY/KqL0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ed5e1b-540e-4cb1-5cae-08debb64e128
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 20:25:08.3569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOIqGNkpqW9tGzsE4ub20cPTx6HoGihADO1qnl10iEZjjDr8AVWo5gRrub5iOxFOIHtgMIJFHUnKNNLaRDDwuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7806
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

Hi Jeevan

On 26-05-2026 01:57 pm, Jeevan B wrote:
> The multiplane rotation tests were emitting per-iteration debug
> output, which can grow logs quickly and hit runner limits.

igt_debug() is zero-cost in normal runs — it only prints when --debug is 
passed. There's no noise reduction benefit in removing it.

Am I missing something here?

>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_rotation_crc.c | 17 -----------------
>   1 file changed, 17 deletions(-)
>
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 4a249ed21..4a7bf3f4d 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -470,8 +470,6 @@ static void test_single_case(data_t *data, igt_crtc_t *crtc,
>   	igt_crc_t crc_output;
>   	int ret;
>   
> -	igt_debug("Testing case %i on pipe %s, format %s\n", rect,
> -		  igt_crtc_name(crtc), igt_format_str(format));
>   	prepare_fbs(data, output, plane, rect, format);
>   
>   	igt_plane_set_rotation(plane, data->rotation);
> @@ -918,7 +916,6 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
>   	drmModeModeInfo *mode;
>   	bool have_crc; // flag if can use previously logged crc for comparison
>   	igt_crc_t crclog[16] = {}; //4 * 4 rotation crc storage for packed formats
> -	char *str1, *str2; // for debug printouts
>   	int logindex;
>   
>   	static planeconfigs_t planeconfigs[] = {
> @@ -1053,20 +1050,6 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
>   						}
>   						igt_pipe_crc_get_for_frame(data->gfx_fd, data->pipe_crc, fliphw, &retcrc_hw);
>   
> -						str1 = igt_crc_to_string(&retcrc_sw);
> -						str2 = igt_crc_to_string(&retcrc_hw);
> -
> -						igt_debug("crc %.8s vs %.8s -- %.4s - %.4s crc buffered:%s rot1 %d rot2 %d\n",
> -							str1, str2,
> -							(char *) &multiplaneformatlist[p[0].formatindex],
> -							(char *) &multiplaneformatlist[p[1].formatindex],
> -							have_crc ? "yes" : " no",
> -							(int[]) {0, 90, 180, 270} [ctz(planeconfigs[i].rotation)],
> -							(int[]) {0, 90, 180, 270} [ctz(planeconfigs[j].rotation)]);
> -
> -						free(str1);
> -						free(str2);
> -
>   						igt_assert_crc_equal(&retcrc_sw, &retcrc_hw);
>   
>   						lastroundjformat = multiplaneformatlist[p[1].formatindex];
