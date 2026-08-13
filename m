Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C45C5CFEB
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 14:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D4F10E4E0;
	Thu, 13 Aug 2026 14:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6q2Lo8z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C12810F366
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 14:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786629617; x=1818165617;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=POahkm5PhiEhoRCn10Mb1tB/+SB6d+yYOwLILutZk3g=;
 b=m6q2Lo8zch4EG7I8PmhMuUaeHrA8rt8AwcnlTrwVVIkvJFKBSj/LoEnO
 qIh5R1TrCRRqHNcg+HE8ejXY6hgDYcQ/5FzRO5hYuJ/Lzc/BHpyXT3rM7
 jbreBTx1t9RlEnivva3XPPWeKk+ljf7MZRFbIFheF6OGB441AtLyXA8Nl
 ePtLfXNLBuiUCn4wGQ2DHvdCfvBxvOPA6MEdZ8Inbt7YPEQcsPtvhmIer
 jpIh0CkyFJS7IESTrpL+hg7rGyDT2W33WllpI4sbLk1vdI/qkSkIIxuEF
 UnljKR7A6NKK9uCX6IG4vG4/quW0pxSG4Mk6d4nheDiaPm/6a5sOz8Dqd A==;
X-CSE-ConnectionGUID: Hdys5rKoSHSbdsOqY5/B+A==
X-CSE-MsgGUID: Hcg6d3O4RTmxD9ML6XUn7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="109988847"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="109988847"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 07:00:17 -0700
X-CSE-ConnectionGUID: EcLCaBS2SeGoGbGovcmgmQ==
X-CSE-MsgGUID: 6CW+1kgORvSTQcE6tgPZCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="263973894"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 07:00:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 07:00:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 07:00:16 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 07:00:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3OYwAOAj4fy9YrBRbgD+Jl1ZfUTFqZeian8m8nDK7MUKWIUKh8aKf3yWJp9vftBK01MhotHduigZzox72cKcfNcTxkYvKJbaVJMHI0E5Z3YYthhgpgIRaIBnuW3r01d56nFNKXelL2jxfXdpYuKB/jQKzGGr7FsVoQ9NdeNuSiIsrrcIjSKvFGKWrF/jx5RggghsUGUIuj18bJZnjMD9vaxCM1rnsegArdzSGdDZMCTdsPlohnmEr27XqspRHr3b9MFHe6RRkl0zsIjjTDE0BsYrxM7yohGrhjCQ+qMaOKbjMA/IX/Ls6FCZ+VTBJC0EDBFx+vZJl5AWBtvl+oiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/Q3720l04LLK4QrZ5YMwkxFcPiR5vxKqcz/T7aSqeM=;
 b=sCjgj293Ekuk6DX1Trc/GyNntZJ828TY6+KLbp/DootnkJRaYYk3xtf3orgL4l5CcWbE7ja9JvrffFgcSySnvycaDTd2uVt9MgCBol3JMQmhFgAeGhuePLvfI2qGsChP27KrvkZQzlaL3Fp8JzleuWZyIWWBbx/lHX2S8ujoWUWpSALAK14m2uwL4egnTeIXXXztDpznYwsfIwxDeqh5Sz5R0CKFUrBmoWDCjGh4kgVnfpXMnZKfdU3H+cRON6PZU/lmV3hME0CL0DCz6VPFOnbsdgNf5Nz0R+TgQujvbSv62rNna57/kbapvuCazK/AxtJmZBqdbKRLxgSp5kFuXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 14:00:12 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 14:00:12 +0000
Message-ID: <1821e310-aa7c-40c5-a984-154e54563a7a@intel.com>
Date: Thu, 13 Aug 2026 19:30:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/6] tests/kms_color_pipeline: Remove unused
 color_depth and drm_format
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260806120345.19406-1-swati2.sharma@intel.com>
 <20260806120345.19406-6-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260806120345.19406-6-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|LV8PR11MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 25b1410c-61b5-49f0-097e-08def943319b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VHQ4JPPgwcWvnQ2KbeDWiBHO4/x72iCX+huhB6VudoH1VRRq9W2qULNuJelMVWiYJUi51kBHMQEjMRafX0P82iCAjysgBuAAU8+bAENc8G13yOpsxOMXlqVgfTzYUX5DNdUz6YmQYbHVrAjgoL+UF0TBRtpjKWdZ89MbfX1RsNjKtxewevG7PxlXQbX4pfU8dGWFcsOwui3Q6V5o1PIFvnEEwwUMgjDgtEz3FNhVbCCiqQbk/h9ggSW9SGPth7Sh4Lrz6QgUzlQnUIrYFMRecKgDMHMdO4i9rybxwKfi1EexfmlbPruDv72UaosGJ3g00FuBl4xhS3pzpCFdTCxdZXup+U96psPGUwLLXSluma07zzUW2dalQLi3N2zhaTEi/f0cRDcJuCO7lMYz/eHA1zSwmp3dQUiVVlrKRIP1+YYZ1gpUKqHzvasCta5Q2Ei0uCiy/EzfmkHDSxO3PiskJsQCnuZz7HFD5uPMEHejvRIlACoioEmTF9dqg4AfmjhJc/z3ShWgOZzMo5f1pB01wCxs7EUhHIumb8xeACygjv/Lw9J5KRoBpI9krOo4O/1CDMLQxC1KLmBns+jayeLauGtnRgfQTDX+4f9t3hog5ivkDxdtWWI00asMV9K7l6vmkZbVVkIAlaoWgUgH10NznyL6pvdMCAhmyLPpJndd7ls=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0VVUmNGdkIzeC9SM0o3QWRlaiszUjFHbXNsejlNYzFEU2E2NmVXN2dqZVUw?=
 =?utf-8?B?eXpTTVBlOVY5KzBMOUdJL2M2d3NsQkFKbzVHMjMvNmRyczRYNHFwV3JWQU45?=
 =?utf-8?B?aE0weEZrRjE5Tnc3eFY0V3g0bXBOTXZocjJlODJyQTVKU1FCa29lekN0UkVk?=
 =?utf-8?B?YlBkckRaUnUrS0wwcWVqS2ozK2pTN0E1eXd4Nmt4VXdHN3BpTFhGODNjZlpt?=
 =?utf-8?B?TzByOEJnM0dVd1dEL0R3ZVhxN2d0SFZqRlRHKzRUT01yRkgrckQxWDQyTGdT?=
 =?utf-8?B?MGg3cWhqUyt2ekoyVld4QmpSbk1mRjBBUS81MFZUWGVFa1hSQXh1amFLbUFF?=
 =?utf-8?B?cTlzUHZxeGRFRnF0YXZDZ2JpWWNhYU9WQTFkOXVNekZGUjR0VWF3b0pYUU1o?=
 =?utf-8?B?UnZEcTlrb2JFWHJYSVN3eDNBclRCZmxLOUsxOG1Nc2lSRGdnb2hBcEtWQ3p2?=
 =?utf-8?B?VHVVdEluV2hkcFhtcWNXZjBlNDFlbTJpaWgycnFFc1YwR2ExNWJoNUlTbkJM?=
 =?utf-8?B?ZmZxYVRNUUcyN1VkSWZZR0FoWXZ6TEdZa2dGaFlNTFJMOTBzTllxbVhpb3Ew?=
 =?utf-8?B?WXVlLy9SdTJPZnRHVlpnYUpNVkgrU0o4RUQ5aVZpRzNMSHhpOHBENWhyWFhI?=
 =?utf-8?B?RXlnNTl6OTZWUE9pNnlBU1ZDSXltdUtSNlB4cko4K09zRGRPMGhlOUsxQWV3?=
 =?utf-8?B?eHBCbS9IZUs2SXl5YW4ydWRPYjZQWHBhQXNnRDFrM3Rxb1FBNkcvRGswdlJz?=
 =?utf-8?B?bzhxSGc5ZFNDdDJlSzlJUVI5M3QzSmZvWTVDMGhQRXl6RndZV3krdmpNR1gx?=
 =?utf-8?B?QnhQbkJzalNRZk16b2F6Mml2TUJTWHNiNmVyZ1BDQ3g5WHNIaEtoUExuVVlG?=
 =?utf-8?B?YjdQSmh6M0M1LzRWOWMwV2tzelh2QmhTZDAzT1JDU2puQ1o1b08wN203dmxm?=
 =?utf-8?B?NjV4NXQ1dXBETmhpV1M3b21yTDNmdk1TeER6NDJJSCtpNzhvRFB5TXk4eERs?=
 =?utf-8?B?ZnhUNldVb1NhZ3V1U2FDRkllMGRTNE5DR0RVc2dxajNzVDFvaUpXNFFQZzNa?=
 =?utf-8?B?MUExUURrQWlmOTdhOHhpZ2dKTE9uN3VtRjlrYXd2ek55dE13NkdtZVBtT0hq?=
 =?utf-8?B?dG8yRmIwS0tvbllGZ1N2eWNUSXQyd0s3RFZRV01TaHdPdUJ3YzBiZjlNbTFL?=
 =?utf-8?B?RWloSTRQR1Q3T1VzWGsxRFc2aXhMUU95bkdkdVJUbk1Kd0ZrOGZXeVE0MWsw?=
 =?utf-8?B?RndUQTJydk1qMzQ4QWMyYXBzbWEyWk8ySFFBQzl5bmg1MmNNMU9WWTJFcG8y?=
 =?utf-8?B?OTEwamJsR291WkFjeFFPTnNjVnB1Q2JGL3I1Yit5NjRnSlNzaThYYS9pb2c2?=
 =?utf-8?B?SS9yMFhHdHNVQ1VWd05TWFBXQmhQMW9BU2RLdGdMZW5KM3BYRkpiODVRNDJ3?=
 =?utf-8?B?YXA3T09DS29NU2MvOTdpSStMN2M2QzFhUHhlY2xjbE4xMEtNUS9STVptM0kw?=
 =?utf-8?B?NDh6RGdCVmYybXVKQlpwL2liYU5ndDh0dmpud1BTazZZd3c1K3dhRXM0Wk91?=
 =?utf-8?B?UzVlV2lCS2liQTZXSnY1RVRqSmtReFhKa2h2MnJ2MkQreU8xVFVlUVhjOUFG?=
 =?utf-8?B?S2NNbTZuWE1FOXVoYVhScUIxWVpoY2dpakVMN1luOXlZRGJKSmc1bjJseGVo?=
 =?utf-8?B?bnlEUldYV0t3S1pjMnVpYUIvTHRHdXo4R2FROUcrZ1dWNTdOZ0NySjFmTkE3?=
 =?utf-8?B?bEpGbE9iUGVkN1BwR05RWk1IWU5iVzdyeHdxaVl5aTBjNUlRRlh0SEhxY1pE?=
 =?utf-8?B?cWpOU1F5dDhra2JVeUIwUEpWNFpsaHB6U3pEa0FxMERPVndGWlRDbVYrY01o?=
 =?utf-8?B?czNYY3d0WWYrSnJPOEdhbEpoaWh2YkJsK2JRU1lvM3JlcytEQ251cW82THJT?=
 =?utf-8?B?MWlubWVkMUlneUpGTm5vODRITkU3anU5OGw3UWJKb08wUVl2b0hNWmxGWmRI?=
 =?utf-8?B?YVZXSWZBenhqZ1Bxdm9Od2w3R2pqMXpXRWxNeU01ZzltVTZpc0UxTWRlYjk4?=
 =?utf-8?B?YWYzZjR3VFMyWklIZWtvMWl1dm1PUTlpR2lTZ2Yxcmdld05ZTUlsR2I1QTRl?=
 =?utf-8?B?K1BnNzR0TXlkQnpUOHRndStnSzJMSFlaSVlTWjF2eFZ0R1k4NnhYYTZHQTNV?=
 =?utf-8?B?NVFvWWZGSjk3QWlPUVZEYTlaYjIzV005OWdZU2NvRUZZWHRiNHhLQkJRN2Rm?=
 =?utf-8?B?Q3Axb1JRWG5NbW9VanA0KzNsaEt6bWRYS29tUXFmaXhnNi9NMFhpVGpYS2kx?=
 =?utf-8?B?NEEwdHNGeFM4YUtMRXd0N3ZxT2xqOGw2MUFVT0xPWkx4aXRCd29ZSGJVMEJp?=
 =?utf-8?Q?phWGQtH9Jlinb69c=3D?=
X-Exchange-RoutingPolicyChecked: Klhedq498BkG3HVTHZpLg6Lnq130AcNEa7tbGe1N1joyODjPS+oXKrV3eum6+odIt5kecAYR/7uBNnJbwFaVVX/6rJ9KIOUm10nexDxp6ok25j/XTpLdgFLzuaXw8LUd808ytcRuADA1jNaP14GdvJnXD3GUs/FcP5cTBUcTWTuD6rzreYVJ8/yzf6CvmN9FdhszLSP89gRmUMdm/gYSqJ3Bn6ps5C5kvfEf4YJpnl06HuakflLhfNlWI9OqIAP9BAaQhFmKfOxDwql0w9R33OLEyby081Mf/PnnPZv2luZkdC8hS8k8+8OTjgDFmvuOZdiQfrp0zouFwZQW7jCH1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b1410c-61b5-49f0-097e-08def943319b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 14:00:12.6364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E31veKOJdwOp7oq0Owz+GH77c5P/rd0oBN+a7fQIpvVsClVsldOZDzlyWWdnrVB4TLw65CHk7igSvZN4/G+WizkQRC1Z5ZcpPX8D7CisA78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8608
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



On 8/6/2026 5:33 PM, Swati Sharma wrote:
> Remove the data->color_depth and data->drm_format assignments from
> run_tests_for_plane() as they are not used anywhere in the color
> pipeline test path.
> 

LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Assisted-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_color_pipeline.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index 3e821f8de..071b9ebfa 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -336,9 +336,6 @@ run_tests_for_plane(data_t *data)
>   				test_setup(data,
>   					   crtc);
>   
> -				data->color_depth = 8;
> -				data->drm_format = DRM_FORMAT_XRGB8888;
> -
>   				test_plane_colorops(data, crtc,
>   						    plane_colorops_tests[i].fb_colors,
>   						    plane_colorops_tests[i].exp_colors,

