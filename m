Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E15C48292
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 10:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4795710E6ED;
	Fri,  2 Feb 2024 10:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6AI+tJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24EA10EBE4
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 06:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706856590; x=1738392590;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=LPk+cZcADhVQsIdgkyXdjJw6740IcArB+zcYMUXiLfo=;
 b=J6AI+tJ3dMAswoWTAmKrZzYa28p7+DfNB4OnVf2ah/MoUfAQYimp4kbS
 NIeO/VuRbBxUKPrmZJ2meN2/9L/1z+R4HV+wrOrGcmtboU/8t1IyV8omy
 gOtcHahilFvvuyy1nK67yshBN/yihLsRfr+1bccNhcA3B4oXXQruvcJLi
 bnsAYutpalSHJ3xiCInIXrpQ668KogYcLFKZfijN8tIncs+nnkt/e3b75
 Zadrr2Sc3F3kadqHEq07nKTshg08EMyL0m7MGLdHc5bIU+apjqDhBh8TR
 o76FvFYLlepE4zB2Bpuweo+2OGWYMXVq5+cpgh5TB9yA+lS3IVO50Q/7+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3021109"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208,217";a="3021109"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 22:49:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208,217";a="37418358"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 22:49:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 22:49:44 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 22:49:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 22:49:43 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 22:49:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sy7NlZgu0WC0i/aSlRiQ+t3XQUVCh/DY1K3EeUIxx7AZhjcMp5X1KIMaw2y7w1kqMHZVQQ0J7KcZS21u5i4mKGZuXRb8rnCpHwBir/jKha88jvryP09Uhp2NpqH7+qgcCXp7D2OK8XV5G1lFX0VDpFJ6QJkuvIiyojPn4oMV77+TK2Vf10N865ZIOrnmkDlgar3/j1GLCS6PIPvUqPrqRoLedhPHjlqyV/a/z5NXP5GOPCyWOIE3dDF8DDYeWlJE0gmnVPz1zvSnd465xEPOaSLlHJcHiFqrYFVPx5ChIwAJ3Vs6p6VRtnQH2lFrp2LJNFP82/cxvYwbBstcAh6/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGmsoyvgQN+TTyt3HzJD1ODCe8IKvCPBSTpXxWSC3cA=;
 b=EoZl7M7wcl5ecXok5WuLZ9dOBEGgyxg8Z52tDild9X3BNW4FnN8jWCJ2RR0mUoW6U5SBdU+Ao7wb/+lKC4EeHdfB8rG0Mg/d1AmdLNHgrQEGFUmX4UxyQmntf3F58HAySOwGU/wkw3biVztzqvxjkM9oNV3OKDWAjlhCzXrhssDtUnIr8ByTydMYzpJfQZUARwP/s5ptLn2+SFjGVr+sNVG5JlAXZXl9hOqjFOlJCUyCv2IzVoekVsxKi4RfU8wHZ2QZW8NhD5G50M0GZJPHI6tqkZ2KYv7DN0k7kgCNpzflWm3qBLiIxA/HG+QMPk02sdrhXun9Uv3z5JWX8RDikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by CH3PR11MB7724.namprd11.prod.outlook.com (2603:10b6:610:123::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Fri, 2 Feb
 2024 06:49:41 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::57c7:cb8d:3964:5f91]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::57c7:cb8d:3964:5f91%7]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 06:49:41 +0000
Content-Type: multipart/alternative;
 boundary="------------1W10NBhhJRtGGgoezRD0bat9"
Message-ID: <39217901-3df5-4a4b-812d-c3e34221ffc2@intel.com>
Date: Thu, 1 Feb 2024 22:49:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: FW: [PATCH i-g-t v5 4/5] tests/xe-ccs: Add tests which exercise
 small to large blit sizes
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
References: <20240201200312.428474-1-zbigniew.kempczynski@intel.com>
 <20240201200312.428474-5-zbigniew.kempczynski@intel.com>
 <PH0PR11MB5782325F4FBA9144C4BA08A482432@PH0PR11MB5782.namprd11.prod.outlook.com>
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <PH0PR11MB5782325F4FBA9144C4BA08A482432@PH0PR11MB5782.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0246.namprd04.prod.outlook.com
 (2603:10b6:303:88::11) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|CH3PR11MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5b8d9e-765c-4748-4777-08dc23bb2192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B3gaLU/BhwJJK1oDcceGoJX4gv7iivyULbiVdSeKTTlMt7HEz8pFGDU5nLak+AiwL22XXwhKB9jjSIguVZqJbVFSbMlUyReAMlUQAZTlw8HhXeYn8sG2SekN8qjHE/29ymzhL8G5lVXMKp2xESWb4Lis42bNYCRFmYX2XslD/3rBCRLLX2fhDelBSURj9y4+ErWH3hDzQxIVWJdEQrabDC+8aVCbXoiCvTUGtRs91nxyaIuIAT3bkSAPPaHEnbk8sQoyOESwaxacz6x3iZblZ9vpko9Wa/6N0Tvhhv9h5AXW0Sz2RHn6ljm9gIu3Sr/FzJymmsd+jJs3LCSLO354en8hHLrpM0SXUuSvkb4KY3+WNTSGKuoenNPl+KmpYq6BTwo0d/KVAgQf61cd1iov+tRj4+H+1WK02YeJrC87habJs/PrKrZS6f+99eVUC++e8Xgm+OW6H0vSIpkHyhsvwOuFeX+sicdatfdXVzu3uIZnuyCjXBOtGpwbAYedKpDfvK2aXbRU4s+AGjQVySqECwg8vPhnvdJhzEJ6ydhr2x56CwHgxOHeRG4h6a8XFcdkSTkZS3MhXa1NjbIRsnyPjulKAQn8MurUQ06xct19x+b9TA1YaHnMDJkGO57HlUeZaTh7ZQSzc3vjlExLhRqaYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(396003)(346002)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6636002)(66946007)(66476007)(66556008)(82960400001)(2906002)(37006003)(8676002)(6486002)(41300700001)(33964004)(6506007)(36756003)(8936002)(316002)(6862004)(31696002)(86362001)(38100700002)(31686004)(5660300002)(30864003)(83380400001)(66574015)(26005)(2616005)(6512007)(6666004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXVTYlV5eTM2MkEwZU9mSVJGVkpQQ25BM1M1TzVkS3hOc1pjYXFYTTlnamNM?=
 =?utf-8?B?ZU16bW9UTS9GWC81QlBtV3NKTjUwNk83ZWtVWFFzcnFCMzdPckVuUk1jazNL?=
 =?utf-8?B?Uk5zNmtZVHl3ajZWZm4yM3docTB2clBYK1EyeHdCWlRqT1dIU1FpaW5keEN2?=
 =?utf-8?B?ZjJtVHZERGtyZ3JuYUltQ0lqekdLZTlaQ2ZwK3l4OWhyUzZ6OXZ4bnhHWW5B?=
 =?utf-8?B?WmJENjRrQXlKVXpkakpWUW1QTVlDNEJKL0tkbm9HSGhnTjdZbmllT2NNQXd3?=
 =?utf-8?B?RU9MQ1FBRDY2L05kQ0krMmpMOHBDMlBDakhxT1VZb3FxbnhuT01nVFVaNFhh?=
 =?utf-8?B?a2svRDdiaGkwSmtKcFcvQ3o5UnYzSzhEVEJ1RlducDNLbmp6cDIrQ09PQXYr?=
 =?utf-8?B?RXhjZjFtWE94M1NENXlDZ2pRVXFoeGZmMytFbk81OSt0ZzQ3WStTWG9ZckZF?=
 =?utf-8?B?ZDZTdHY0V3lpWHRqS1B4K1hlYmFvSU9EUEhhY1FrYU1SZ2p1S2ZWSUlQYTBN?=
 =?utf-8?B?TG0rcWVWVWRKbUdJcmxPL042YS8rL0FsNlo3WFQvUGJhdlV4alZ4UGxna2lO?=
 =?utf-8?B?QWMxY24wSUtSd0JJR2VQellDdzVDcXcrNzlaTW1tdlEwUUtSZENtc2xhd3FN?=
 =?utf-8?B?RWFZZFB3UWRMUWQvUWFPbEU3ZUpDblRQU3lFcU91aUNPTUF1cmZ0ZWFGMytm?=
 =?utf-8?B?QWcra1BySExWenJMUFVwRENpQUZYWno1OFN2eENDQVE5WU9sVUtXdkNnai8w?=
 =?utf-8?B?Ym5RMjlCUHZJZXRScWIyaFBpSWd3OGxOTmIvM0xjZVRJNXFjNjJQREVyZENH?=
 =?utf-8?B?Q1RrSkllTFBJcFcvUXpBVFI3YkJ6STdQZlFnYmdjNk1aTmlGYm53YURHVFZh?=
 =?utf-8?B?Njd0aHZoNmVaSVZyMWZRUG4xOExMdlpVNU9xVGdnVHZKVHpWTUxqUjNZVTd4?=
 =?utf-8?B?dWcxNzdjWG13blFyUmdJODBPTGpMcnFCODBOdm1ieXRVYWQ5OU0rZkNQQVpn?=
 =?utf-8?B?ZEk2cU1BZWNvN3dOL1ZZUHJTdGo2b1FTbktUbFdNQk5MelViZTNySVNzNUtw?=
 =?utf-8?B?RjYvNFRBenJpTG9LcjBoT2RzUnBBYmNDY1orM3FsZ3A0Q1ZLNWdXZkRqRkc4?=
 =?utf-8?B?cEY2V1FjdjZaL3pseklibHNMbElVam5jREttSldvUnZhUmd1U0U1YWhxTktJ?=
 =?utf-8?B?N1VEVzJKRXZRTEdiQjdYR0FZZ0MxeE41WlBHYXBVczRZSGlFUU95WGxXWFpN?=
 =?utf-8?B?K0pwYnE2NHdONVFNSU9DSFJGbjN2andTVVJ4cUszd0todnU4eUx4a3hxby90?=
 =?utf-8?B?Zi9BWVZxTXBiV2trTmhWeGpBWHpKdkcyNm5Va1RvNWtvY0VTaGFWeTljRGpU?=
 =?utf-8?B?UFFQaVFxdVBGZ3BQazVvaW1vNXUwR3hlSzhRSWl1S1FaQURZR0t6YTIxY1o2?=
 =?utf-8?B?aU40RE5NZ3RGejZwejJtMTBCcThJZUVSTytBaWhWaDRUR1hmRks0UTlVdDJU?=
 =?utf-8?B?d3pYME55ZEd6bFV6YmQ2OTQ4UW5MUFhDYlRqRFdQUEdNTm1PWWgvTUtwdEFw?=
 =?utf-8?B?K2NLWWZITXVTTDM1ZkEzb2xNOG5acUVCTlo4eXU0Mm1obUF3d0tHQTF6WTdn?=
 =?utf-8?B?SHZKa3ZyM0JjdGtBR3lXTWpXL2VUR0R4SCs5RW9XUkMwOWZsUUU0T3FTWUhI?=
 =?utf-8?B?YzZTeGhsemF3ekwxUUhwVExuSmhraTU5L2NzQTZDYjQxVFBCd2ZoeDFTZTBD?=
 =?utf-8?B?N2V1MGtERkhmWU9iR054UElodmFtZktKMzhvSmlocDJFRzFiSkh1ekJSaFFS?=
 =?utf-8?B?aURtNFBOYWgvUDZwNm5QcFp3RCtOME12TEtncHFydnQrZTNYUVlUUXE3Yjc2?=
 =?utf-8?B?UkVLSW9KRkJPTTFNTTlEb3FFSXkzRmdjcVg0NWsyMTF1T0FHdGJuNXZublFt?=
 =?utf-8?B?NE9DdFhWSGM2clQ3NjZKcTV6OW8zamw0TmFOeGFUYkhmekxQSk5qdUUrbVlw?=
 =?utf-8?B?V0Q5SHJNUWk3Z2x0S0ZuNEZIY1ZvbHpJdHl0bENoV3Y0VXZ4R1hnSlM1anpi?=
 =?utf-8?B?MjdYa0c4dTNiZnVIVFJJSjRZYVoyNENhRDRMR29xRENhdVQ5dmxTY2p2cUhn?=
 =?utf-8?B?VkRCanZmZllMSGhmR2p3anpIc24rZFRwWG5ScGl6VjRvaXhNZ2UybldPMzdS?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5b8d9e-765c-4748-4777-08dc23bb2192
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 06:49:40.9930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6hGtv0uaaFDiMBPNpoYLsHovFD35mGir+PDnnc0o+S8/NHSq/mFNFDs9Mh9R7k+LszxqORundcJf3nP8wYGlWe+MA+/4IqVIfbQyXrg42s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7724
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Fri, 02 Feb 2024 10:27:22 +0000
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

--------------1W10NBhhJRtGGgoezRD0bat9
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


> Testing block-copy for 512 x 512 x 32bpp is not enough to verify blit is working for different (small) and not always aligned resolutions. Add 'increment' subtests which checks blits from small (1x1) to large (512x512) resolutions.
>
> To avoid too long execution resolution increment equals 15x15 pixels.
>
> Signed-off-by: Zbigniew Kempczyński<zbigniew.kempczynski@intel.com>
> Cc: Karolina Drobnik<karolina.drobnik@intel.com>
> Reviewed-by: Karolina Stolarek<karolina.stolarek@intel.com>
> ---
>   tests/intel/xe_ccs.c | 143 +++++++++++++++++++++++++++++++++----------
>   1 file changed, 111 insertions(+), 32 deletions(-)
>
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c index a7785edcb1..06c7a38343 100644
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
>   #define PRINT_SURFACE_INFO(name, obj) do { \ @@ -286,9 +294,17 @@ static int blt_block_copy3(int xe,
>   	return ret;
>   }
>   
> +#define CHECK_MIN_WIDTH 2
> +#define CHECK_MIN_HEIGHT 2
> +#define MIN_EXP_WH(w, h) ((w) >= CHECK_MIN_WIDTH && (h) >=
> +CHECK_MIN_HEIGHT) #define CHECK_FROM_WIDTH 256 #define
> +CHECK_FROM_HEIGHT 256 #define FROM_EXP_WH(w, h) ((w) >=
> +CHECK_FROM_WIDTH && (h) >= CHECK_FROM_HEIGHT)
> +
>   static void block_copy(int xe,
>   		       intel_ctx_t *ctx,
>   		       uint32_t region1, uint32_t region2,
> +		       uint32_t width, uint32_t height,
>   		       enum blt_tiling_type mid_tiling,
>   		       const struct test_config *config)  { @@ -301,7 +317,7 @@ static void block_copy(int xe,
>   	uint32_t run_id = mid_tiling;
>   	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
>   							!xe_has_vram(xe)) ? region1 : region2;
> -	uint32_t width = param.width, height = param.height, bb;
> +	uint32_t bb;
>   	enum blt_compression mid_compression = config->compression;
>   	int mid_compression_format = param.compression_format;
>   	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D; @@ -339,9 +355,16 @@ static void block_copy(int xe,
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
> @@ -416,6 +439,7 @@ static void block_copy(int xe,  static void block_multicopy(int xe,
>   			    intel_ctx_t *ctx,
>   			    uint32_t region1, uint32_t region2,
> +			    uint32_t width, uint32_t height,
>   			    enum blt_tiling_type mid_tiling,
>   			    const struct test_config *config)  { @@ -429,7 +453,7 @@ static void block_multicopy(int xe,
>   	uint32_t run_id = mid_tiling;
>   	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
>   							!xe_has_vram(xe)) ? region1 : region2;
> -	uint32_t width = param.width, height = param.height, bb;
> +	uint32_t bb;
>   	enum blt_compression mid_compression = config->compression;
>   	int mid_compression_format = param.compression_format;
>   	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D; @@ -521,6 +545,7 @@ static const struct {
>   	void (*copyfn)(int fd,
>   		       intel_ctx_t *ctx,
>   		       uint32_t region1, uint32_t region2,
> +		       uint32_t width, uint32_t height,
>   		       enum blt_tiling_type btype,
>   		       const struct test_config *config);  } copyfns[] = { @@ -528,17 +553,43 @@ static const struct {
>   	[BLOCK_MULTICOPY] = { "-multicopy", block_multicopy },  };
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
>   	struct igt_collection *regions;
> -	uint32_t vm, exec_queue;
>   	int tiling;
>   
>   	if (config->compression && !blt_block_copy_supports_compression(xe))
> @@ -555,6 +606,7 @@ static void block_copy_test(int xe,
>   		for_each_variation_r(regions, 2, set) {
>   			uint32_t region1, region2;
>   			char *regtxt;
> +			char testname[256];
>   
>   			region1 = igt_collection_get_value(regions, 0);
>   			region2 = igt_collection_get_value(regions, 1); @@ -566,30 +618,36 @@ static void block_copy_test(int xe,
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
> @@ -669,6 +727,16 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
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
>   		struct test_config config = { .compression = true }; @@ -676,6 +744,17 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
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
Acked-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>   	igt_describe("Check block-multicopy flatccs compressed blit");
>   	igt_subtest_with_dynamic("block-multicopy-compressed") {
>   		struct test_config config = { .compression = true };
> --
> 2.34.1
>
--------------1W10NBhhJRtGGgoezRD0bat9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <p><span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:PH0PR11MB5782325F4FBA9144C4BA08A482432@PH0PR11MB5782.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">Testing block-copy for 512 x 512 x 32bpp is not enough to verify blit is working for different (small) and not always aligned resolutions. Add 'increment' subtests which checks blits from small (1x1) to large (512x512) resolutions.

To avoid too long execution resolution increment equals 15x15 pixels.

Signed-off-by: Zbigniew Kempczyński <a class="moz-txt-link-rfc2396E" href="mailto:zbigniew.kempczynski@intel.com">&lt;zbigniew.kempczynski@intel.com&gt;</a>
Cc: Karolina Drobnik <a class="moz-txt-link-rfc2396E" href="mailto:karolina.drobnik@intel.com">&lt;karolina.drobnik@intel.com&gt;</a>
Reviewed-by: Karolina Stolarek <a class="moz-txt-link-rfc2396E" href="mailto:karolina.stolarek@intel.com">&lt;karolina.stolarek@intel.com&gt;</a>
---
 tests/intel/xe_ccs.c | 143 +++++++++++++++++++++++++++++++++----------
 1 file changed, 111 insertions(+), 32 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c index a7785edcb1..06c7a38343 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -28,9 +28,15 @@
  * SUBTEST: block-copy-compressed
  * Description: Check block-copy flatccs compressed blit
  *
+ * SUBTEST: block-copy-compressed-inc-dimension
+ * Description: Check block-copy compressed blit for different sizes
+ *
  * SUBTEST: block-copy-uncompressed
  * Description: Check block-copy uncompressed blit
  *
+ * SUBTEST: block-copy-uncompressed-inc-dimension
+ * Description: Check block-copy uncompressed blit for different sizes
+ *
  * SUBTEST: block-multicopy-compressed
  * Description: Check block-multicopy flatccs compressed blit
  *
@@ -73,6 +79,8 @@ struct test_config {
 	bool surfcopy;
 	bool new_ctx;
 	bool suspend_resume;
+	int width_increment;
+	int width_steps;
 };
 
 #define PRINT_SURFACE_INFO(name, obj) do { \ @@ -286,9 +294,17 @@ static int blt_block_copy3(int xe,
 	return ret;
 }
 
+#define CHECK_MIN_WIDTH 2
+#define CHECK_MIN_HEIGHT 2
+#define MIN_EXP_WH(w, h) ((w) &gt;= CHECK_MIN_WIDTH &amp;&amp; (h) &gt;= 
+CHECK_MIN_HEIGHT) #define CHECK_FROM_WIDTH 256 #define 
+CHECK_FROM_HEIGHT 256 #define FROM_EXP_WH(w, h) ((w) &gt;= 
+CHECK_FROM_WIDTH &amp;&amp; (h) &gt;= CHECK_FROM_HEIGHT)
+
 static void block_copy(int xe,
 		       intel_ctx_t *ctx,
 		       uint32_t region1, uint32_t region2,
+		       uint32_t width, uint32_t height,
 		       enum blt_tiling_type mid_tiling,
 		       const struct test_config *config)  { @@ -301,7 +317,7 @@ static void block_copy(int xe,
 	uint32_t run_id = mid_tiling;
 	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &amp;
 							!xe_has_vram(xe)) ? region1 : region2;
-	uint32_t width = param.width, height = param.height, bb;
+	uint32_t bb;
 	enum blt_compression mid_compression = config-&gt;compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D; @@ -339,9 +355,16 @@ static void block_copy(int xe,
 	blt_block_copy(xe, ctx, NULL, ahnd, &amp;blt, pext);
 	intel_ctx_xe_sync(ctx, true);
 
-	/* We expect mid != src if there's compression */
-	if (mid-&gt;compression)
-		igt_assert(memcmp(src-&gt;ptr, mid-&gt;ptr, src-&gt;size) != 0);
+	/*
+	 * We expect mid != src if there's compression. Ignore this for small
+	 * width x height for linear as compression for gradient occurs in the
+	 * middle for bigger sizes. We also ignore 1x1 as this looks same for
+	 * xmajor.
+	 */
+	if (mid-&gt;compression &amp;&amp; MIN_EXP_WH(width, height)) {
+		if (mid_tiling != T_LINEAR || FROM_EXP_WH(width, height))
+			igt_assert(memcmp(src-&gt;ptr, mid-&gt;ptr, src-&gt;size) != 0);
+	}
 
 	WRITE_PNG(xe, run_id, &quot;mid&quot;, &amp;blt.dst, width, height, bpp);
 
@@ -416,6 +439,7 @@ static void block_copy(int xe,  static void block_multicopy(int xe,
 			    intel_ctx_t *ctx,
 			    uint32_t region1, uint32_t region2,
+			    uint32_t width, uint32_t height,
 			    enum blt_tiling_type mid_tiling,
 			    const struct test_config *config)  { @@ -429,7 +453,7 @@ static void block_multicopy(int xe,
 	uint32_t run_id = mid_tiling;
 	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &amp;
 							!xe_has_vram(xe)) ? region1 : region2;
-	uint32_t width = param.width, height = param.height, bb;
+	uint32_t bb;
 	enum blt_compression mid_compression = config-&gt;compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D; @@ -521,6 +545,7 @@ static const struct {
 	void (*copyfn)(int fd,
 		       intel_ctx_t *ctx,
 		       uint32_t region1, uint32_t region2,
+		       uint32_t width, uint32_t height,
 		       enum blt_tiling_type btype,
 		       const struct test_config *config);  } copyfns[] = { @@ -528,17 +553,43 @@ static const struct {
 	[BLOCK_MULTICOPY] = { &quot;-multicopy&quot;, block_multicopy },  };
 
-static void block_copy_test(int xe,
-			    const struct test_config *config,
-			    struct igt_collection *set,
-			    enum copy_func copy_function)
+static void single_copy(int xe, const struct test_config *config,
+			int32_t region1, uint32_t region2,
+			uint32_t width, uint32_t height,
+			int tiling, enum copy_func copy_function)
 {
 	struct drm_xe_engine_class_instance inst = {
 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
 	};
+	uint32_t vm, exec_queue;
+	uint32_t sync_bind, sync_out;
 	intel_ctx_t *ctx;
+
+	vm = xe_vm_create(xe, 0, 0);
+	exec_queue = xe_exec_queue_create(xe, vm, &amp;inst, 0);
+	sync_bind = syncobj_create(xe, 0);
+	sync_out = syncobj_create(xe, 0);
+	ctx = intel_ctx_xe(xe, vm, exec_queue,
+			   0, sync_bind, sync_out);
+
+	copyfns[copy_function].copyfn(xe, ctx,
+				      region1, region2,
+				      width, height,
+				      tiling, config);
+
+	xe_exec_queue_destroy(xe, exec_queue);
+	xe_vm_destroy(xe, vm);
+	syncobj_destroy(xe, sync_bind);
+	syncobj_destroy(xe, sync_out);
+	free(ctx);
+}
+
+static void block_copy_test(int xe,
+			    const struct test_config *config,
+			    struct igt_collection *set,
+			    enum copy_func copy_function)
+{
 	struct igt_collection *regions;
-	uint32_t vm, exec_queue;
 	int tiling;
 
 	if (config-&gt;compression &amp;&amp; !blt_block_copy_supports_compression(xe))
@@ -555,6 +606,7 @@ static void block_copy_test(int xe,
 		for_each_variation_r(regions, 2, set) {
 			uint32_t region1, region2;
 			char *regtxt;
+			char testname[256];
 
 			region1 = igt_collection_get_value(regions, 0);
 			region2 = igt_collection_get_value(regions, 1); @@ -566,30 +618,36 @@ static void block_copy_test(int xe,
 
 			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
 
-			igt_dynamic_f(&quot;%s-%s-compfmt%d-%s%s&quot;,
-				      blt_tiling_name(tiling),
-				      config-&gt;compression ?
-					      &quot;compressed&quot; : &quot;uncompressed&quot;,
-				      param.compression_format, regtxt,
-				      copyfns[copy_function].suffix) {
-				uint32_t sync_bind, sync_out;
+			snprintf(testname, sizeof(testname),
+				 &quot;%s-%s-compfmt%d-%s%s&quot;,
+				 blt_tiling_name(tiling),
+				 config-&gt;compression ?
+					 &quot;compressed&quot; : &quot;uncompressed&quot;,
+				 param.compression_format, regtxt,
+				 copyfns[copy_function].suffix);
 
-				vm = xe_vm_create(xe, 0, 0);
-				exec_queue = xe_exec_queue_create(xe, vm, &amp;inst, 0);
-				sync_bind = syncobj_create(xe, 0);
-				sync_out = syncobj_create(xe, 0);
-				ctx = intel_ctx_xe(xe, vm, exec_queue,
-						   0, sync_bind, sync_out);
+			if (!config-&gt;width_increment) {
+				igt_dynamic(testname)
+					single_copy(xe, config, region1, region2,
+						    param.width, param.height,
+						    tiling, copy_function);
+			} else {
+				for (int w = param.width;
+				     w &lt; param.width + config-&gt;width_steps;
+				     w += config-&gt;width_increment) {
+					snprintf(testname, sizeof(testname),
+						 &quot;%s-%s-compfmt%d-%s%s-%dx%d&quot;,
+						 blt_tiling_name(tiling),
+						 config-&gt;compression ?
+							 &quot;compressed&quot; : &quot;uncompressed&quot;,
+						 param.compression_format, regtxt,
+						 copyfns[copy_function].suffix,
+						 w, w);
+					igt_dynamic(testname)
+						single_copy(xe, config, region1, region2,
+							    w, w, tiling, copy_function);
+				}
 
-				copyfns[copy_function].copyfn(xe, ctx,
-							      region1, region2,
-							      tiling, config);
-
-				xe_exec_queue_destroy(xe, exec_queue);
-				xe_vm_destroy(xe, vm);
-				syncobj_destroy(xe, sync_bind);
-				syncobj_destroy(xe, sync_out);
-				free(ctx);
 			}
 
 			free(regtxt);
@@ -669,6 +727,16 @@ igt_main_args(&quot;bf:pst:W:H:&quot;, NULL, help_str, opt_handler, NULL)
 		block_copy_test(xe, &amp;config, set, BLOCK_COPY);
 	}
 
+	igt_describe(&quot;Check block-copy uncompressed blit with increment width/height&quot;);
+	igt_subtest_with_dynamic(&quot;block-copy-uncompressed-inc-dimension&quot;) {
+		struct test_config config = { .width_increment = 15,
+					      .width_steps = 512 };
+		param.width = 1;
+		param.height = 1;
+
+		block_copy_test(xe, &amp;config, set, BLOCK_COPY);
+	}
+
 	igt_describe(&quot;Check block-copy flatccs compressed blit&quot;);
 	igt_subtest_with_dynamic(&quot;block-copy-compressed&quot;) {
 		struct test_config config = { .compression = true }; @@ -676,6 +744,17 @@ igt_main_args(&quot;bf:pst:W:H:&quot;, NULL, help_str, opt_handler, NULL)
 		block_copy_test(xe, &amp;config, set, BLOCK_COPY);
 	}
 
+	igt_describe(&quot;Check block-copy compressed blit with increment width/height&quot;);
+	igt_subtest_with_dynamic(&quot;block-copy-compressed-inc-dimension&quot;) {
+		struct test_config config = { .compression = true,
+					      .width_increment = 15,
+					      .width_steps = 512 };
+		param.width = 1;
+		param.height = 1;
+
+		block_copy_test(xe, &amp;config, set, BLOCK_COPY);
+	}
+</pre>
    </blockquote>
    Acked-by: Akshata Jahagirdar <a class="moz-txt-link-rfc2396E" href="mailto:akshata.jahagirdar@intel.com">&lt;akshata.jahagirdar@intel.com&gt;</a><br>
    <blockquote type="cite" cite="mid:PH0PR11MB5782325F4FBA9144C4BA08A482432@PH0PR11MB5782.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
 	igt_describe(&quot;Check block-multicopy flatccs compressed blit&quot;);
 	igt_subtest_with_dynamic(&quot;block-multicopy-compressed&quot;) {
 		struct test_config config = { .compression = true };
--
2.34.1

</pre>
    </blockquote>
  </body>
</html>

--------------1W10NBhhJRtGGgoezRD0bat9--
