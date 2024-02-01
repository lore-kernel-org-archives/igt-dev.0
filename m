Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF15C4828F
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 14:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB5410EE11;
	Thu,  1 Feb 2024 14:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCm1Q611";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB6410EE11
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 14:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706796659; x=1738332659;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rx++ShAcvFpPSvd/rSN2P9hjg8qtwmcTXQ92iRDK1nI=;
 b=TCm1Q611aVJPbY/1EjWlExO6h0LKfNdQONhGCowLTUtMCOs8XDfLjnOF
 erCAYEtBWvcO0y20+PrpevzqedHVALIkKSN+PpcRrv4XTjc6Dg/8T1Ndh
 elJnH0i2S3vMVEcx7tP4+amUiIsgu+QkCKrhZCya/vjUG4lPZJV+xbCDg
 gmS1/2FD9ANsQ3ddY8JZabtu21czcbeZP0GxbIOtALem1rdNLXOAh9zvH
 6q60um9MeI8NmIzjpb5B3z6XxJvL0y+gb7JfvtCNQ3f3n8G+WE4yveCEy
 MNqtK331lOFpTrQnjIaEimwPzd4kokkQQxE12vyZ6YM4/xgHE9x9E6MrU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="122526"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="122526"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:10:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822930976"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="822930976"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 06:10:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:10:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:10:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 06:10:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 06:10:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxkWgDAzU+4dxIbPS4g1ojg2w8REcKvMZH/CA1/Z1itsi9SGbuvE+MidSEJf0zpEfdH1ZnnHHErink0ys/UW0Qe4I+g63tIevgNA5sUNlQsk6vgFYV3a6U9m9VgSOJmwJGathZNYxXMBwpkAcVUzewLTMCO2mIp1Yl5liT4uzNM3nyA6K/M3mKcVqFAxzhgCy25bNkLaLMYSI4KPbzL5CckS8mp1Bi+f1XacG/nJjG+T8HD6EjRRdtrOgLxwKqdc1rn8xNMKRFWjOOY2ATdVHqbswONleLMoSAdun+BwsagbC54HrxjS3o7EZ7t5Vhv7EvTulK0qWTM8OlpDuhIGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKkf9hm3px2Pe5kS+tLue2KDtzCqz77n8vpuNp3DziY=;
 b=agDz/UpE90RsdvsjNfCHUQViaWxIhJhaxq8dm5cWEh6VhXdmVBpLNejkznpmjq0DLJGKhvpc/tyOsk3BvPK0D11BvZsOZoof7HfadbLxaxZ+BZWAmHSGw/Y8js3XStNFuIGHuJFEEs7dvqH5IlF8ynb9vcG/v2BwJsMlH4Qzhu7PEJvOLjMJnKaAnDkt5wePMSJtGZs1RWbQsrVqYnoC+HCqV7zWV7PruMU07Cy3bAdkh3TwB7108A/jI5ncVHfrgYrDGHvemW8YMEQKCGxlEjiGpN3BTKwRdMjbNzjUmbkcTknq+lKJoOvfULSX7I54pgizvho1mqsbHCggwRNS5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by CY5PR11MB6282.namprd11.prod.outlook.com (2603:10b6:930:22::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 14:10:53 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566%4]) with mapi id 15.20.7249.017; Thu, 1 Feb 2024
 14:10:52 +0000
Message-ID: <8efd56a2-6a59-4743-89f3-6db615071c1c@intel.com>
Date: Thu, 1 Feb 2024 15:10:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 4/5] tests/xe-ccs: Add tests which exercise small
 to large blit sizes
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Karolina Drobnik <karolina.drobnik@intel.com>
References: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
 <20240201100724.257845-5-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240201100724.257845-5-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0149.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::42) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|CY5PR11MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: c711205f-aff0-4e08-db7d-08dc232f998c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UjRwR5ZaCdJZj9SXP9z8EtP5an7bvvo5UKrkSQyffHmoSrMFXARNK2yLxcegZAZH64rfd9BKOstq7r1rOqUZEVjs+VON/ZKfsCr+vX5c4ZYKXaueeLRfgJj1hk0w3z6zc3H5xKu71E+RWzXvNFR11JL4JcTePwxmbTUoy7F9ilSYA8XaFN+rW4RRIyq8PkBwtzuN01pqb5tTJCE4MA4mEe1bVBSICrSDaTfa7RK2jM4iHNFp6hjMIc1E1t/Nmb+PiKwJKU2LoMcw4w7ZjHnv1wQHhbVpD4bgT0EdPjz87KTS1/QL/xflHdD6WE4fJk83F/KXKtSdQxT/HKYPb26mBfIdmI/A4yU/OvEbZ811oK+cQ9DpoSWIf8CqTNlAl4PdFbeoSf1Kq5nzk4klPGVoHxVm9IZUm7NoL/aJmdBh6XLrAfX8FsF39T+HHQ6j7lGiACbCDgJSVXWB60IdP18l0Q1DrSCqjxap6gWSbcs0K97QbStKJLkke+rV6eQRje3KLP1Z/PfrOhEqkUdzxwTQmQQbST5UdXIUSN4EnzIkuewNhUayT7mJXp1d1OF2NC8ay3BAnznKFAGo4HlteMVQw6aYiu8XuklVLz/EAv3heXumAagE6+lxRVzQ4lnhF2QmZhcb8Pzx13/9LIrXp7YJqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(36756003)(41300700001)(44832011)(4326008)(8676002)(8936002)(6512007)(107886003)(2906002)(478600001)(66946007)(316002)(86362001)(38100700002)(6486002)(5660300002)(31686004)(36916002)(2616005)(31696002)(53546011)(6506007)(66476007)(66556008)(26005)(83380400001)(82960400001)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OS9EK1pJbVNCd2tjL241NXgvUzZlT1J6RjM3Rm9KUFljcmlYUHhnUDFIektk?=
 =?utf-8?B?all1UStNakdxNVJoR0hWdS9paUdueG51V2I3bFRWQmNIU1NDN1ZZSnhFTDY5?=
 =?utf-8?B?TjhWazZaZ00rb0J4MlBZbzl0Sm0xbHhrOW5uNTV5VHUvRThlMFNGNDA1UTli?=
 =?utf-8?B?VmY1TnR6VGlIczNJdmgvRzdRZUtlWjh4amRENWNtZE9EYVU4dDhnM1BPaHhV?=
 =?utf-8?B?bUVsa0pvblZDSUdBQkRrQ3lieElsaXRJNnlwYVRTeFVPdW5aeE9jUzRhbjZa?=
 =?utf-8?B?NHNVRlpFTkQ5QXZhSFhTNkxWZXdGSCtYdHg1WEdTOXRRa25HVm9TVEI3aGhI?=
 =?utf-8?B?bEdsa05ueC9lVGZyQkwxT0NvOGNCV2RkZGo1OVZYZGd5UzhFQjdzSlpERE5k?=
 =?utf-8?B?N1FhRXFtV3RuTjBaaXhBOXZTa0E3RVhaVzk3N0NOeENLU1h5cUNHd1drSlRz?=
 =?utf-8?B?T2w0ZlhaTzRHZk5RVzdFaVlNeUFmdlFBNnhWUUdvOXVQdmdKZHp4L2NOdW43?=
 =?utf-8?B?aGt2ejVyZHlUMXRzU0dKTHZrTEJNci9XK05uNE5FV0xzaVdYUTA2cnRiZVU2?=
 =?utf-8?B?ZXRqUk15d0t1QlNYT0VvVDNwYmF1MHNvMVVrZU5nWUFOVlBraTdNUUwxNkNk?=
 =?utf-8?B?Tm5sSWd3bTdReEMvemladlIya0N0OXREZnJOTEVWL016OWNiQjB2NFdjbkY4?=
 =?utf-8?B?cThuK1NqeWJYMW94aWk1bUErVjlxOFI3cmliNzJycDA2S0JsM0ZDWER2cXFs?=
 =?utf-8?B?RGhMZEtFVVBMMFpmRWhsUVZoczZDU2xoZlUyeXlXYWpjamNtbkRRTDdZdWUr?=
 =?utf-8?B?SFNvUTVaZnZsekZ5YUYxTXAveUlVdEQyTnNYYW54ZnBVQTBERDhLa3JndUo0?=
 =?utf-8?B?bUhad0R0WERBSm16bmNYWEJSRFI2Q2F3V0pVeEo3UmRpVXJpaElnajVxeEQr?=
 =?utf-8?B?d1MzbjNWZGFpNXRTeVR5Z3hlSEQ1cHg4SVVIZkdkSXM3M01jcThVNkQ0UUp3?=
 =?utf-8?B?NDVUYitqaDBudU9SaXduM3BDTFhYVFZkNFpSVlliMkt3QTNyRmtSc0l2ZHds?=
 =?utf-8?B?Qk5xOUFyMWFlbU9kak5xNUNqWnNMbmkyOEtIaVIvVHpaUE05M2FwSVJWNGxi?=
 =?utf-8?B?SjIwNm8rQ2ZPTWsvZ01KYnhnRW1NQ0pyN1Z4RjFmMnBycDd3RzRlajFjWjY2?=
 =?utf-8?B?TEFXazZ6SFBhT1RrZHB4aGU1RmFNRUphbFQwWXl3RTNkU3F0YXBxVzgxcnpD?=
 =?utf-8?B?T0hhNjd4K0FiTDVGR2V0RkdRazBUQzJpdFREVFVVSnFGSklmVGlrd21VS3hP?=
 =?utf-8?B?TnRVTVYzWTlPLzNveDkvUjd6dEMwWDk3Q2dHL0pTRmZubm1pZitIZDl5S3pT?=
 =?utf-8?B?dGJOUVRjQTNZRWRmT1VjOXNnWnJreGpaK09tRXBUbWtJdnlKWTY0ZTQzREpT?=
 =?utf-8?B?ZVhJQ0ZmTDBmclRvT1BTR05JdEYyOGd4ZHM0MHpkWUdhQ0RYcFRreTNTclNu?=
 =?utf-8?B?VEFjTFo4ZTJPdVlCeHFYWHRMelJiMUxPN1ZiZmJCNms5RWl5RTAxNm5ZSlVv?=
 =?utf-8?B?bDdSRll6VWRzQ3kyVGVEVCtqeW5mb3lURGNzUitNU1JZMEtvUEtJeFhiN3lo?=
 =?utf-8?B?aU9XWUUvQVhjNTBTbDl4RXVtTCs3ZUFiSTZ6TlpyaTlpK0xIUForWmdxaUdM?=
 =?utf-8?B?eExHZ3djQlVSbkVCc3ZKQktGRFZnVENMb2h0ekxSUitjWmp4MS9HQUxGQ1px?=
 =?utf-8?B?U2pKV3NJN0dLM3RZN1ZpdkcwbStFdk5WSTFBbXVZTi8vZzVOWkJCL0c2Wk1J?=
 =?utf-8?B?RDdsZTNwRGdxdGdaWnJjRktscXIrM1JXaWtITi9YYjZ3K0FkZVRlSzZVUzdD?=
 =?utf-8?B?NjU0SnMvY3NiSitqREtyanc1YlljM2l4VFd2ZTZoT3ZNSUhGK3dUL2hEOS9I?=
 =?utf-8?B?TExsSU02U256R2xacFJDVlQ1QUlTSU55eVBJc3RpVWdtVjQ2SVpSZEVKV1Bk?=
 =?utf-8?B?QW80elg5VC9NQmJyTVErblEyeXVVdDJFWVErbHRqT1d4VTVtd2RJakNuM1Rn?=
 =?utf-8?B?YW1jdURtMU1JTFQrR0grWXhYMFhhZk1DUmJDTVlRZ092aFY1UXIvRms5dHBz?=
 =?utf-8?B?d014UFpxcXlHcytoNjBsK3o5R2VGTFovVFh2aDM1dmg0N3haL2x0SGpJaHNW?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c711205f-aff0-4e08-db7d-08dc232f998c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 14:10:52.8754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W2kBDtPnFO53/8TIM8u5zXLaQunoMu3qDjOOXrvwSSKQtUKY+/oLXvZNJErQEc7oSY/P6//uAzlzp7wKoUObFhjkdeG8LjRp+T7TQRovWAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6282
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

On 1.02.2024 11:07, Zbigniew Kempczyński wrote:
> Testing block-copy for 512 x 512 x 32bpp is not enough to verify
> blit is working for different (small) and not always aligned
> resolutions. Add 'increment' subtests which checks blits from
> small (1x1) to large (512x512) resolutions.
> 
> To avoid too long execution resolution increment equals 15x15 pixels.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Drobnik <karolina.drobnik@intel.com>
> ---
>   tests/intel/xe_ccs.c | 144 +++++++++++++++++++++++++++++++++----------
>   1 file changed, 112 insertions(+), 32 deletions(-)

Ah, one question actually. We use width == height, and I wonder if we 
want to test rectangular surfaces. I think that caused problems in the 
past, but maybe I'm misremembering something.

All the best,
Karolina

> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index a7785edcb1..627976049c 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -28,9 +28,15 @@
>    * SUBTEST: block-copy-compressed
>    * Description: Check block-copy flatccs compressed blit
>    *
> + * SUBTEST: block-copy-compressed-inc-dimension
> + * Description: Check block-copy compressed blit for different sizes
> + *
>    * SUBTEST: block-copy-uncompressed
>    * Description: Check block-copy uncompressed blit
>    *
> + * SUBTEST: block-copy-uncompressed-inc-dimension
> + * Description: Check block-copy uncompressed blit for different sizes
> + *
>    * SUBTEST: block-multicopy-compressed
>    * Description: Check block-multicopy flatccs compressed blit
>    *
> @@ -73,6 +79,8 @@ struct test_config {
>   	bool surfcopy;
>   	bool new_ctx;
>   	bool suspend_resume;
> +	int width_increment;
> +	int width_steps;
>   };
>   
>   #define PRINT_SURFACE_INFO(name, obj) do { \
> @@ -286,9 +294,17 @@ static int blt_block_copy3(int xe,
>   	return ret;
>   }
>   
> +#define CHECK_MIN_WIDTH 2
> +#define CHECK_MIN_HEIGHT 2
> +#define MIN_EXP_WH(w, h) ((w) >= CHECK_MIN_WIDTH && (h) >= CHECK_MIN_HEIGHT)
> +#define CHECK_FROM_WIDTH 256
> +#define CHECK_FROM_HEIGHT 256
> +#define FROM_EXP_WH(w, h) ((w) >= CHECK_FROM_WIDTH && (h) >= CHECK_FROM_HEIGHT)
> +
>   static void block_copy(int xe,
>   		       intel_ctx_t *ctx,
>   		       uint32_t region1, uint32_t region2,
> +		       uint32_t width, uint32_t height,
>   		       enum blt_tiling_type mid_tiling,
>   		       const struct test_config *config)
>   {
> @@ -301,7 +317,7 @@ static void block_copy(int xe,
>   	uint32_t run_id = mid_tiling;
>   	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
>   							!xe_has_vram(xe)) ? region1 : region2;
> -	uint32_t width = param.width, height = param.height, bb;
> +	uint32_t bb;
>   	enum blt_compression mid_compression = config->compression;
>   	int mid_compression_format = param.compression_format;
>   	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> @@ -339,9 +355,16 @@ static void block_copy(int xe,
>   	blt_block_copy(xe, ctx, NULL, ahnd, &blt, pext);
>   	intel_ctx_xe_sync(ctx, true);
>   
> -	/* We expect mid != src if there's compression */
> -	if (mid->compression)
> -		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
> +	/*
> +	 * We expect mid != src if there's compression. Ignore this for small
> +	 * width x height for linear as compression for gradient occurs in the
> +	 * middle for bigger sizes. We also ignore 1x1 as this looks same for
> +	 * xmajor.
> +	 */
> +	if (mid->compression && MIN_EXP_WH(width, height)) {
> +		if (mid_tiling != T_LINEAR || FROM_EXP_WH(width, height))
> +			igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
> +	}
>   
>   	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
>   
> @@ -416,6 +439,7 @@ static void block_copy(int xe,
>   static void block_multicopy(int xe,
>   			    intel_ctx_t *ctx,
>   			    uint32_t region1, uint32_t region2,
> +			    uint32_t width, uint32_t height,
>   			    enum blt_tiling_type mid_tiling,
>   			    const struct test_config *config)
>   {
> @@ -429,7 +453,7 @@ static void block_multicopy(int xe,
>   	uint32_t run_id = mid_tiling;
>   	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
>   							!xe_has_vram(xe)) ? region1 : region2;
> -	uint32_t width = param.width, height = param.height, bb;
> +	uint32_t bb;
>   	enum blt_compression mid_compression = config->compression;
>   	int mid_compression_format = param.compression_format;
>   	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> @@ -521,6 +545,7 @@ static const struct {
>   	void (*copyfn)(int fd,
>   		       intel_ctx_t *ctx,
>   		       uint32_t region1, uint32_t region2,
> +		       uint32_t width, uint32_t height,
>   		       enum blt_tiling_type btype,
>   		       const struct test_config *config);
>   } copyfns[] = {
> @@ -528,17 +553,44 @@ static const struct {
>   	[BLOCK_MULTICOPY] = { "-multicopy", block_multicopy },
>   };
>   
> -static void block_copy_test(int xe,
> -			    const struct test_config *config,
> -			    struct igt_collection *set,
> -			    enum copy_func copy_function)
> +static void single_copy(int xe, const struct test_config *config,
> +			int32_t region1, uint32_t region2,
> +			uint32_t width, uint32_t height,
> +			int tiling, enum copy_func copy_function)
>   {
>   	struct drm_xe_engine_class_instance inst = {
>   		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
>   	};
> +	uint32_t vm, exec_queue;
> +	uint32_t sync_bind, sync_out;
>   	intel_ctx_t *ctx;
> +
> +	vm = xe_vm_create(xe, 0, 0);
> +	exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
> +	sync_bind = syncobj_create(xe, 0);
> +	sync_out = syncobj_create(xe, 0);
> +	ctx = intel_ctx_xe(xe, vm, exec_queue,
> +			   0, sync_bind, sync_out);
> +
> +	copyfns[copy_function].copyfn(xe, ctx,
> +				      region1, region2,
> +				      width, height,
> +				      tiling, config);
> +
> +	xe_exec_queue_destroy(xe, exec_queue);
> +	xe_vm_destroy(xe, vm);
> +	syncobj_destroy(xe, sync_bind);
> +	syncobj_destroy(xe, sync_out);
> +	free(ctx);
> +}
> +
> +static void block_copy_test(int xe,
> +			    const struct test_config *config,
> +			    struct igt_collection *set,
> +			    enum copy_func copy_function)
> +{
> +
>   	struct igt_collection *regions;
> -	uint32_t vm, exec_queue;
>   	int tiling;
>   
>   	if (config->compression && !blt_block_copy_supports_compression(xe))
> @@ -555,6 +607,7 @@ static void block_copy_test(int xe,
>   		for_each_variation_r(regions, 2, set) {
>   			uint32_t region1, region2;
>   			char *regtxt;
> +			char testname[256];
>   
>   			region1 = igt_collection_get_value(regions, 0);
>   			region2 = igt_collection_get_value(regions, 1);
> @@ -566,30 +619,36 @@ static void block_copy_test(int xe,
>   
>   			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
>   
> -			igt_dynamic_f("%s-%s-compfmt%d-%s%s",
> -				      blt_tiling_name(tiling),
> -				      config->compression ?
> -					      "compressed" : "uncompressed",
> -				      param.compression_format, regtxt,
> -				      copyfns[copy_function].suffix) {
> -				uint32_t sync_bind, sync_out;
> +			snprintf(testname, sizeof(testname),
> +				 "%s-%s-compfmt%d-%s%s",
> +				 blt_tiling_name(tiling),
> +				 config->compression ?
> +					 "compressed" : "uncompressed",
> +				 param.compression_format, regtxt,
> +				 copyfns[copy_function].suffix);
>   
> -				vm = xe_vm_create(xe, 0, 0);
> -				exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
> -				sync_bind = syncobj_create(xe, 0);
> -				sync_out = syncobj_create(xe, 0);
> -				ctx = intel_ctx_xe(xe, vm, exec_queue,
> -						   0, sync_bind, sync_out);
> +			if (!config->width_increment) {
> +				igt_dynamic(testname)
> +					single_copy(xe, config, region1, region2,
> +						    param.width, param.height,
> +						    tiling, copy_function);
> +			} else {
> +				for (int w = param.width;
> +				     w < param.width + config->width_steps;
> +				     w += config->width_increment) {
> +					snprintf(testname, sizeof(testname),
> +						 "%s-%s-compfmt%d-%s%s-%dx%d",
> +						 blt_tiling_name(tiling),
> +						 config->compression ?
> +							 "compressed" : "uncompressed",
> +						 param.compression_format, regtxt,
> +						 copyfns[copy_function].suffix,
> +						 w, w);
> +					igt_dynamic(testname)
> +						single_copy(xe, config, region1, region2,
> +							    w, w, tiling, copy_function);
> +				}
>   
> -				copyfns[copy_function].copyfn(xe, ctx,
> -							      region1, region2,
> -							      tiling, config);
> -
> -				xe_exec_queue_destroy(xe, exec_queue);
> -				xe_vm_destroy(xe, vm);
> -				syncobj_destroy(xe, sync_bind);
> -				syncobj_destroy(xe, sync_out);
> -				free(ctx);
>   			}
>   
>   			free(regtxt);
> @@ -669,6 +728,16 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>   		block_copy_test(xe, &config, set, BLOCK_COPY);
>   	}
>   
> +	igt_describe("Check block-copy uncompressed blit with increment width/height");
> +	igt_subtest_with_dynamic("block-copy-uncompressed-inc-dimension") {
> +		struct test_config config = { .width_increment = 15,
> +					      .width_steps = 512 };
> +		param.width = 1;
> +		param.height = 1;
> +
> +		block_copy_test(xe, &config, set, BLOCK_COPY);
> +	}
> +
>   	igt_describe("Check block-copy flatccs compressed blit");
>   	igt_subtest_with_dynamic("block-copy-compressed") {
>   		struct test_config config = { .compression = true };
> @@ -676,6 +745,17 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>   		block_copy_test(xe, &config, set, BLOCK_COPY);
>   	}
>   
> +	igt_describe("Check block-copy compressed blit with increment width/height");
> +	igt_subtest_with_dynamic("block-copy-compressed-inc-dimension") {
> +		struct test_config config = { .compression = true,
> +					      .width_increment = 15,
> +					      .width_steps = 512 };
> +		param.width = 1;
> +		param.height = 1;
> +
> +		block_copy_test(xe, &config, set, BLOCK_COPY);
> +	}
> +
>   	igt_describe("Check block-multicopy flatccs compressed blit");
>   	igt_subtest_with_dynamic("block-multicopy-compressed") {
>   		struct test_config config = { .compression = true };
