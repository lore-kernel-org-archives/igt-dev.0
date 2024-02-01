Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AD0C4828F
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 14:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B77710EE11;
	Thu,  1 Feb 2024 14:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="coqxwlQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8A10EE11
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 14:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706796580; x=1738332580;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n1zC4kHGeg4kB3fzb79qFWI7LsOvFx63J9keAU5vDGc=;
 b=coqxwlQNd+jxX+po+U/o/BuyPZctWmxACUPJ2qX03di/HaNiW/x5MOOA
 /SJVzrneCyT0+UAOR2zpsVPIGMqc8wFwFtooi7771ZpLqeiNbC7u2D4vD
 wQ5bmI2rXFTIQDjModRHb1U994oSn8WyIu0DHBne4MYujCPv10At5flHi
 3oPRy6yvGKJOIhp8VdAIAg0jBrsJOgXIuOgqh4i30Ri6Oi/XjOKMe/hW+
 4u0xsVf56+TLzCXm2JVngiIGIPaFDVdQinTBgyPQPTSgiklfFIw5brrvx
 DmXNUS46XP5SZYPwqwfAXQ11raaOaSER7cAks7+r0Nlm5W/rdCNaVcoCe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="122155"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="122155"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:09:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="79946"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 06:09:39 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:09:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 06:09:38 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 06:09:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClKLmLK2lCtVJZXFfcnksv+rm7JWDSKYGs2rnAUhYrFln1JqNFB+ZvRjufrYqQdLG3ub50AwUAfMihDXy7I/pUF3aOufeaK18suZFEn9f3hVVApWqSzR6BLmUBz49PMMWPnOHeWMkKazKqsIA5Tg8KYIYkoSTTtOehxQn3i4WscDhszBdgW4lCTzJGgspaQMMqU43VrrKRdnrwpYOASXKTV4IlgGNcEY0sj30OAtpDcqD4xIrppNJZotbLJY+rFTs2xL//gkXnFq3m3Z4+/uU/stl300uEmvPeV7ZVy4gfmTGpszIHaE/62W07dDTVv7F/6bHR6KNZCAkbzek3Mthw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UY0mDdHWvX5cy57a7tpHA2cL+zPMYLzmFcSXDHtkM1A=;
 b=frx0/my8WH7WZc/ajNkftXUl35X4hYSB8Moie5Sh5W8AwDwxOfK8KpVKyGCM7o0Ki5nA3tYAbruRvoX4Q37oQBinZZocwtG+ojsTOP87HKiyAnSJfjUfYOa3mwSOXaRB3a/I7qXbGR4Lo2tvnjYQ6NuTwInTgT+uB01z1n1ZU0tGxrdM2k17iHbgOyYLSrwffz5VgwPmy5lYA5tiDdMhZPwiKIfDYd/dmDYJPs59DNPVT6pSIBw659PBKFMTA112Fi6TriVY+IPdzZnWmZch8ycHulBnlaJhapNZK+OhGFtWbx0QFYWuqSuTjD/U+T30YJGtISnFhiSUsYm8BsO6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by CY5PR11MB6282.namprd11.prod.outlook.com (2603:10b6:930:22::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 14:09:35 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566%4]) with mapi id 15.20.7249.017; Thu, 1 Feb 2024
 14:09:35 +0000
Message-ID: <f23fc1d6-1bf6-4059-8366-44ec238a78e6@intel.com>
Date: Thu, 1 Feb 2024 15:09:30 +0100
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
X-MS-Office365-Filtering-Correlation-Id: 55afbab2-3cc2-4255-d6c3-08dc232f6b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: klry/YXevXOrnYCa3SOcCGorMja53OBuKEdNSS37B+T6sWsFAWehyjdVvbrJQDZTaPF1arypHnHmLtTRLi4HlZQrMwFPFw4X0vUApmo/QZ/3//ViAbyh3eM5IGBM0BLgorsUCFhicpOfjLFOnaJ1FFOVJju4HeI68VhQVjwnqJyHGnJJgmvtJwQNNzueRNnmvDT+HbBZrntzswYHbcSkyXVzDYDVuzjEX9YsJBFoU8UP67eIKaAPC7s2/w8nT6NikHa9r84oNqZCkTg+wMxVPr00YSi9TM26h2NXgu7HE571lZwhr9JRBH6ith0xpe5U8aJkPLqnbpU4SGYaL1CVlwoE3YzUFN/y4+RQDRY30yrbRoew0bmiB4eP7v6Ws93JyrkEuHwcNfV6mShmq2mMPEhjC1RIyfhofOOweiF5jdMJMOleKcQTEVSCs/QcWX/jDDR8923yhQz/O3DrJOACsu1iLPZmOCmDkZ2QLnCSfy+XFknPG3LjJaKkKcnjTgh94Mpt+AQkzja55RRdVOkx9KP7lyb+bvb+RLx22nRqC3fj12c4tAJCqzlmumPyLInypaD/vhAJAjU26Gc+DNERWPX5z3dBFUm+5gSK/SBmQbyHVlSPUPUWJGiM13h7cP9bX0SlJY88Y5GElJ+gIH3RZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(36756003)(41300700001)(44832011)(4326008)(8676002)(8936002)(6512007)(107886003)(2906002)(478600001)(66946007)(316002)(86362001)(38100700002)(6486002)(5660300002)(31686004)(36916002)(2616005)(31696002)(53546011)(6506007)(66476007)(66556008)(6666004)(26005)(83380400001)(82960400001)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czVCalZxT2t1aUx4ZmI0azdaVHpKVlBYTlltUzNvK1oyNmh6a2tyaTBnWVJu?=
 =?utf-8?B?cHZFMUVnWjJ0UlJuWk83a2FxYVRWdU1aZDV5YlFqM0dmV2FSalk4QkZZSS9Y?=
 =?utf-8?B?SHNmN3lOM21yanhTYmdCc2I4NUJSKytEZVdxb2pBemZUN0p2M2twR0VqTUIr?=
 =?utf-8?B?ZWx4VnVFQkNuQld2Q3NxNFRYTWs1YXk1dnRGV0UxaDdwS21CeSswSVBsamFY?=
 =?utf-8?B?OUxiZmxkb0hpZFMyL3M4VGFLTlJDWmVRenc0UDFmZ0o1dGZtZHhGSk5YZ1hK?=
 =?utf-8?B?NmtuV0p2QTh4UjR4U2xhaXlralNVRmFlSjdtMUduQTliNHlOSWhqb054QmF0?=
 =?utf-8?B?MU5mTlQzbjFRWTJpNTkwTmx1YStjQWRRbkxUK29sVEJjdzRVTXpiM2JVd2ht?=
 =?utf-8?B?eWZEVHlSejhma1JaMmMvaXlIN2xzdkppOW1Qa2ZhQWlZdEJOZEU4WDVBc2ZJ?=
 =?utf-8?B?dlIzZ1huaWRCRlBJQzl4ODRNYVcxOThrYnlTNHhLSXZtWGlCL3A2clJOZ2hV?=
 =?utf-8?B?N3NCK0NoeTFjZk55TWhkcWxsMFplNVUzMWZQdVlFZFZiYVQya0VscEhNdXNK?=
 =?utf-8?B?TkdiZVZDY1pxeFFQRk5Xek94enkweUx5TTBGbnExa3VaaExzT2pmcERlQy9J?=
 =?utf-8?B?Ym1oN0txSGx3UHNjWmloTlBob1dUWldkREozaU9HUDJDNGx4Rk1uVHVvK2lY?=
 =?utf-8?B?ZGM3VGtia3lUNVovTUlWa2hNWjVycUFHVWFxWk55STVGOWhjUWp3QmZaWnVF?=
 =?utf-8?B?QXhBUTBhZE5YK3NyanpiSGRYUXFDMzVnS0xZSExtOUZCSTIyakx3UXhOam80?=
 =?utf-8?B?SFYwZ2QxdXNIdFUzdTBmTHBnZjh1eUVRN3J4VG01bjJsUnF4Qlc1MlJJRGdR?=
 =?utf-8?B?Q29IV2dycW5EekRQZjE5b2RBYmNobC9jZDVxTjFKUkx2ZXFORFZpUXFCdHBL?=
 =?utf-8?B?QnM5Q3F1cUlLL1Q2QVpUeUs0SlVseTdNTm9SUExtRitPL28za09SRWdaMlhr?=
 =?utf-8?B?cWhldGV3ano0MHNKcjNMVGEvUWthM1VsbmpzeTNtcVZmdmU0d1d5QkJsOURE?=
 =?utf-8?B?MGkrNDFsV2ZYaXJpN1ZPUHhHd3kzT1RoRFEyMGp4UVloUHUvbitTZUFQQlQ5?=
 =?utf-8?B?RlhpRS80RUpoZVpSV251RCtUdEhpc2ltV1ZBcmdXQUkrOE5zWmdJbW9aRUNa?=
 =?utf-8?B?aFh6ZEpGTGt3aEdYZDNINlVpcDlSekxqbjh5Tkl6dnRjeTlCMi9Oak1JSlVR?=
 =?utf-8?B?T1R4UENCRHA0S2tKeGoycGFhVE40aXQ5YUdMc1VyS1dVY2YzaHM0a3hSclpa?=
 =?utf-8?B?RmxkNWJiK09QTEV4SG05WWJHZzdQaEcxU0JyblRFQmZhT1MwZlFmUXNKVm9x?=
 =?utf-8?B?RWZoTFlzVkptcGZiSE9yRUNqSkNJUGl1YVU2cFBZRmtSa2FMVTFleWEreWh0?=
 =?utf-8?B?ZEljRW5MRTk3MVRCd0wrcGdpMUdNN3QrMnUrQnBleU5FVFgySDRlNTVLL0NL?=
 =?utf-8?B?VE1uMERmQ0FGdmhxMjlScWN3UEx0SWplRHE5WWhWa2JhcTBGVmwyT0VRSGFQ?=
 =?utf-8?B?VVBiNzFjZno1QWdNdHdMbHA3WTI1MkN5aFluQ1NrZlkrekJ0VXQ1WnNRbzJj?=
 =?utf-8?B?QWhLYXlwbmgzSlZ4WUtETng5WlJzOHVTYUtDWEFEb1VRSUU2VjUydHJHSjNG?=
 =?utf-8?B?VWpWbUZxN1lMYmZyRW8rZmtuTUpWT1IwQkFDNFNuNjRCNzlMYklwV2NLWHhX?=
 =?utf-8?B?dkU2LzNNSklSa3BQcXBzekpIYlVadlVUSGR1d0llekc5ZVpWSXVYNTF4Q0Z1?=
 =?utf-8?B?Y0U2UXV3eXdVNVF6Q2VvWVZPK0JqSFBmTGZUT3htNVhvUDUwOVZPY0hOSjB1?=
 =?utf-8?B?ZW9DMm5ENHBvRUVyT3IyWVdqSWRjcXN2K1o3Y0RHblB3QlpubEc3NDdmZE51?=
 =?utf-8?B?bkF6Wk5KSmFWKzlNVXpMM2U1SStpdDIwYkRlZ290ZU4zdXBPZjBpY08vVDFY?=
 =?utf-8?B?cjNJSVl2N3FmcENCcm5MamlGOTB1NVMvSlpUUEh0eE1oZURWOHNoVlU1YXdz?=
 =?utf-8?B?NnlVWTg0eW1Wa25tWmprRklSdmtVZDl0TEFMV1dDMmx6SyswSjloekxJc3Nz?=
 =?utf-8?B?eFZ4d0ZQbWxZcHQrNDhSSkNvUVhSaUNQY1laQjVrbGRuNzZCaFBva3IzZXdo?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55afbab2-3cc2-4255-d6c3-08dc232f6b1c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 14:09:34.9187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEOKXUUjwVaP2ExpZ5bMtq+gnbyh+Hnu0OXUmNVRoPqItSHR8KSbiDZTTMjZB1wVQtZpi+f67fE2QLYM0NDkoHpz9hFyQS26LjPXcHDtf/w=
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

Thanks for the comment on why the step is 15 px wide.

I wonder if we could just start testing the compressed case from bigger 
widths and heights, instead of adding that if on the mid surface. But 
probably we'd limit the coverage, so let's leave it as it is.

A small nit below.

>   tests/intel/xe_ccs.c | 144 +++++++++++++++++++++++++++++++++----------
>   1 file changed, 112 insertions(+), 32 deletions(-)
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

^-- there's an empty line (I almost missed that!)

But apart from that, the patch is looking good, I think. Just fix that 
line, and:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

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
