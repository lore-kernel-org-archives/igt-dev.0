Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72D1C4828D
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 06:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2215E1123CE;
	Mon,  5 Feb 2024 06:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFnns9mt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756091123CE
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2024 06:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707115616; x=1738651616;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j/cVleKNHyI1iSPjG6ddfA1/LDteAZaP770KDbQEZ6I=;
 b=GFnns9mtV/NY9iTOpj/RgU/DGosYNJWewSf1iH6ovwyYA6iIfITn9VKC
 Aa9bExUyNNUCKEc6L8oLT/LGMdNshpBp3IHFDKFPgYN9RvMPFCGqyPrmX
 NtdA3HfWFRtb3spwyc3tejwxZ28dQW4sdWXVQjMQwi4QhYB376CMbxBBr
 WpkE59QAU4tsYjbgrQwBwI5qcFIA4M+XGkxQugs+MUmkgde4wReLMCh1R
 AZoD9dRrEXeMkwGYnmOEtmcvJclEF5BldZpbgCt5Xe9JFIpPYCeVhQTeI
 zQagYLqZXzXQprrZav9Q8abloZgsL2FbebfbTM2Y/xdY44d/nOCzWp2KB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="4347805"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="4347805"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2024 22:46:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="909213698"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208";a="909213698"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2024 22:46:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 22:46:50 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 22:46:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 4 Feb 2024 22:46:50 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 4 Feb 2024 22:46:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vdaxb7Ox6HQje9gNOZ76pGN/g0p38i7p1SmFgTxQtvh3AVyRUjAaFDgF/6qZPpD9+qvtUBB+44iK3bhdZ6u8IVbOc7yFWCMcy2fsbftdQJxVqHskErdTqud+pEjH5zKBpmUSZdXBt8dqhxxBZxTfycMEr0KxxfMtPnSIaOHkNP3pJXbXRcqhlgP0fRb7x3rwqsq2T0EVjKoxUj7HEAGqtTc02Lhziw/2qDw5S3ucv6r+tgtTBlDpf5fEYWbJBD1zpcBIE4I6cBaukFbzuPOqugloJ0REiP9mxphAAgDITeBwl8vaXCow7Fro/DEt5v0qddmGcbzoWchgQrs5aP1TmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7swBKnoPpeIvc9sAWj6sc0XnjXhp3LLUFSLEqCqGVK0=;
 b=kXYEd/HKT3RcK7RYy747cTuzek4kRvJRAESyXD2xMA+LaT54HL4kXqY7kBC7Z8OtaEiEErK6mrYmT/lUNiB3/4lrfcHYp2SMFQ1BTaxIo1GYlmNP0L3kOhxKXbUblgOaBxr2FRH/LensU6SdLWyaRNT8KF6CoLRV9rUbbVYZxVDk7NkN1+hOLbt0avM0ncRH2I2ZwC8fIdQa1yQpTUz7RIVItgMGPc5nzi7wFk6HOuobq5NO+ZcxnNneFVfzv7OLN8lYm/6v0VWC2B5t0V+XeEmfjEmZG65a62gcp+3OBnVfIk7dy/PfARK5sDaA9UEeGXcpGgE9Rek068QAAH+ghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ0PR11MB4797.namprd11.prod.outlook.com (2603:10b6:a03:2d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 5 Feb
 2024 06:46:48 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::d84d:4503:e381:80c7]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::d84d:4503:e381:80c7%3]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 06:46:48 +0000
Message-ID: <eb40b7aa-486e-4a71-b24c-82e6d5572187@intel.com>
Date: Mon, 5 Feb 2024 12:16:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Add a new test to validate the deep sleep state
 during extended vblank
Content-Language: en-US
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <suraj.kandpal@intel.com>
References: <20240118162100.797712-1-jeevan.b@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240118162100.797712-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::21) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ0PR11MB4797:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e835d10-e1b0-4816-1706-08dc261639c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q+cSoxw7ikMddgcdcK3e4X3pFK4OV3KhFlJpRnK04t4iZ1JXlINXs+Dg9Gyf7ME1J9ZkGglsXJExedH1mNqyjGNhQpx121COdkYTPCKir7zjMA+QcoOu/9ND7UEjxfORapnzWIUoQxBxIk7Rmf2Pso1HHDJukRdfKNOm5Yep9ngQrr3Yyzn1psqNFJcSXOrt0d+IAk9feQVqBavJ5Spk8DAMeBUdka69gJdRjNSmVgGkUljL9cxsy8134xt7kFArIqXjzD64VrXacTYvcs0HNzqMVjtkrULxxDRqHa7ouyQVfRNyyzvnxxGSTHElYaR4rKnz8OGB7pSlXcgDKC0rvuo+LUw9F212IDPTYEHazYYpZRg8TvgBRPl9rxE8lJpzXLFufUlX1mITQUM4PjyvKWhtNM65tBonf9Gn4rPc0o+mGHKuX7pULCT4k5DO0q/m3LYE8MhvNGy53JxxN7+n7dD/f4hFp34wZHfsiZMyjLTOkKkBet/atqCJyH4/gKZ0RDABnIUkAjNW3YD5ni2GqblJQG1tM00GQasrC0IJeXAd2IBCjzrWmCRQ2GKC3Y+jiI94YXtnedBPryucNpjFl09rhY1NTStnJhZAPZMWHkw6tlZjE31NMebHpA7uFDwIrWtJRj+a8aU6ystLbOm+rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(346002)(39860400002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(41300700001)(36756003)(66946007)(66556008)(66476007)(53546011)(6512007)(6506007)(478600001)(6666004)(6486002)(316002)(8936002)(8676002)(4326008)(38100700002)(82960400001)(26005)(83380400001)(86362001)(2616005)(107886003)(31696002)(2906002)(5660300002)(30864003)(15650500001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE45cGc3Y3p2ajZ0Qi9ESi9HQ1BiSGNzNFc1VDZWS2p1emp1YXdONXJYdXpQ?=
 =?utf-8?B?ZVAvai9yYkVrVXI3UnY1THQvcEU5TGVNMk9ta1U0eWhxeTVOSDVEWnlwZUFh?=
 =?utf-8?B?dzlMdVdsLy9wak5sdmsrait5RUNNdnMxdHY2NHZmZHVER3NKZU5MNm15OEUz?=
 =?utf-8?B?K1dzbWZ2aERFMisrQmxHTTJKdURuaWdaYWVVb0VyTGdDUFoxVEhxY1JueEdJ?=
 =?utf-8?B?NkxBVjNYUFhWN2RIWjFEN0xWcUliVVlET2t0bFdmdE1tWTdaV2laanlRZzlO?=
 =?utf-8?B?UUNGQ01qSU1UcTlvbTNVMWlnZys5ZzhPQmRKZEllYW9CTlNVUlVOenR5dTZU?=
 =?utf-8?B?RS91a1l6VVYyYlRwd3paOHNSUXgyZHlWY1NheHgyVDN6cE1iVFZ0d0dBdUpK?=
 =?utf-8?B?N2x2RVpIRWJmRThuYldVZHBpbnJWZjhmQXoycnhyL2Ntcm10dXpiVDMzVDAy?=
 =?utf-8?B?QSsxdkxpNkxyQnZqNjVtUXkxbzdxU1JIQ2lWVHlCYkNCdVUzakh1OWFoRW9t?=
 =?utf-8?B?MXZ2TDlDNWFienBwRzBHMkNHZnVJN3hIb1l0MHJod3NBL0ZvUTVaazl3a2Nr?=
 =?utf-8?B?Q3ZkTUhFTURyWTN1T2liSDI2TFdaTGZjSWE0N0VTQzNuRkQzWitLVUsvczNr?=
 =?utf-8?B?T2gzN0NoQVF2amFHY2ZCb0NBRld1WkpDNm1rWkFVeWkyMDhBVmxkeHJ3RnQ4?=
 =?utf-8?B?YUplMmZZUHpZUGh1dW5NRGtHMk5CT2h2RGMvTFZXTTN2R0ZVUzdSUzY3QzFI?=
 =?utf-8?B?OWtXMlQ5MGp6dzlibWh4TXBxMUVWTUQ0TkM5K3BsdVJpK1ZLWG1CdFVzLzQ0?=
 =?utf-8?B?SGxkVTFLQ1R0OWNzVFptNExpelBqTkVMRHhUekVrdlFTazhjcVcyTGpBdnVT?=
 =?utf-8?B?Rk51K1pBWjNMNHZtY0hsMFlwd3U1YktTL3l2V3hwNEZtZFNWUTVxQ1ZzQlJh?=
 =?utf-8?B?SFpRTy9KZElFaVNSTHExZ2lPZ0tncFVtWkFkQzN0QW8yeWxlMlhQbFR3MmZs?=
 =?utf-8?B?ZjBUYUc3MU5mL25SNzlNK1dpeVlhVkM2RENyM3N6aDVjVGRjMlZIUWt6STM5?=
 =?utf-8?B?YXNZcjBhR3Vyc2Y3dEg5SzFLT3VwQTdmZE1KeVl1SEp4bE5BNng2QjhNZWpw?=
 =?utf-8?B?aTZRK3poUVl2REpJNXl4SWcya2F2UXltWnFLUnRTRXpkY0Y2bFBxbEh3UDdV?=
 =?utf-8?B?VitiM2xrNHVwWHBmNjBvYWJnMXJRMjQ1cUZCeTRZWkhiL2Z0WEVwOGhkQnJH?=
 =?utf-8?B?bHdvWURNNjRZSlpOeWxaN21QQWlTbHNzVk14UUw1WWF1cnU5Z0p2OTFNTm93?=
 =?utf-8?B?eXN2U0ZYTmVQRHl1aS9JQ2pOdDBVRDgzUEtwNzltL000MXp6a2tkNVB6WjR5?=
 =?utf-8?B?TFllZDFxOURUS3VlcHN6bWRrdDR3eVBYRU01M2oyaG56TGNXa1N1VnBaOTY0?=
 =?utf-8?B?ZXcvbmt0eERvd1lQQitkbnlRSTlhZDY1R0RiNGM0aWd3MTlXVVducnoxRnUw?=
 =?utf-8?B?QTkrSVZ6L0pHc29qcE8ySEVjT0NTc3BPSmFIWkxEdTUrT3Y3b29sOUFVSEJl?=
 =?utf-8?B?dTcrTGRUdGY3NlZkbWdBWCtCcmpSZE1SM0tTQU5xTHJzME1DRnV4dUN3U1Jq?=
 =?utf-8?B?bHhQYjN4R0pkY24zYlhucWtrbHkwYm44djc3S3ZIU0pRcFI3MXJXcW9IV1ZP?=
 =?utf-8?B?cEJCbGVLZVZHRG50RXFFL0pvb3Zrd2xySjZEZkhKUzZLZmNqdkQzNTlTMHE5?=
 =?utf-8?B?SVYvUTBnK2xDOHUzWlJRMlRxQ3g1MG1HcEdZTDNRU0JLS0Z4T1ZHdUlQU2N1?=
 =?utf-8?B?anZEUXFCa2lQU01VYmtJZFE2Vno2M3gwOU05R0dkSmkrVGxrSjBGNlJGM3dT?=
 =?utf-8?B?NnF5TGMyVGxTbU12MzVDWjg2bGxjMUJtWGcrazR3c2thMTNzNTRhNG5JYjhM?=
 =?utf-8?B?ZU4rYnJxTjlCMVpoSnhHc1VRTU05TG9yQkl2YkdCR2RaZUUvR0ZzdG50a1Zm?=
 =?utf-8?B?dVh1YTkvVmVvWWpPL1hmRU1BZS9NSW03NCtjVUV0VC9IWWkrTnlNU0hKakdI?=
 =?utf-8?B?Z1ozQU45UWhiZ3MvRkFSTytCd3R5blkwejF1LzhRK1BxdXkxdmo3ZUQ5UFZt?=
 =?utf-8?B?SXlCcURkclRqdkJ3d3ZPcjl4bEVxYUFCalhVSzFKbjU1ZGtvSzlKRVBqeEx2?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e835d10-e1b0-4816-1706-08dc261639c2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 06:46:48.0887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ph72r39qtDax03NKZaTuFhKYs1M5YB3c0KR/cXE01mngGpMUq735/cws0i0Zxy8DV12FlGjCAyJc+KjgXJ7ZlgJTDZ3kGE7p5to5C5o5pI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4797
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

Hi Jeevan,

On 18-01-2024 09:51 pm, Jeevan B wrote:
> Add a new test to validate deep sleep states during extended vblank
> scenarios, where two frames are committed simultaneously for a give
> time with reduced refresh rate.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 262 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 262 insertions(+)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 0d5824e67..da5d0e819 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -74,6 +74,10 @@
>    * Description: This test validates display engine entry to DC6 state while PSR is active
>    * Functionality: pm_dc, psr1
>    *
> + * SUBTEST: deep-pkgc
> + * Description: This test validates display engine entry to Deep PKGC state for extended vblank
> + * Functionality: pm_dc
> + *
>    * SUBTEST: dc9-dpms
>    * Description: This test validates display engine entry to DC9 state
>    */
> @@ -89,6 +93,14 @@
>   #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
>   #define KMS_POLL_DISABLE 0
>   #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
> +#define DRM_MODE_FMT    "\"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x"
> +#define NSECS_PER_SEC (1000000000ull)
> +#define TEST_DURATION_NS (5000000000ull)
> +#define DRM_MODE_ARG(m) \
> +                (m)->name, (m)->vrefresh, (m)->clock, \
> +                (m)->hdisplay, (m)->hsync_start, (m)->hsync_end, (m)->htotal, \
> +                (m)->vdisplay, (m)->vsync_start, (m)->vsync_end, (m)->vtotal, \
> +                (m)->type, (m)->flags
>   
>   IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
>   
> @@ -98,6 +110,11 @@ typedef struct {
>   	double r, g, b;
>   } color_t;
>   
> +typedef struct range {
> +        unsigned int min;
> +        unsigned int max;
> +} range_t;
> +
>   typedef struct {
>   	int drm_fd;
>   	int msr_fd;
> @@ -110,12 +127,32 @@ typedef struct {
>   	enum psr_mode op_psr_mode;
>   	drmModeModeInfo *mode;
>   	igt_output_t *output;
> +	range_t range;
>   	bool runtime_suspend_disabled;
> +	igt_plane_t *primary;
>   } data_t;
>   
> +typedef struct vtest_ns {
> +        uint64_t min;
> +        uint64_t mid;
> +        uint64_t max;
> +} vtest_ns_t;
> +
>   static bool dc_state_wait_entry(int drm_fd, int dc_flag, int prev_dc_count);
>   static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
>   
> +/* Returns true if driver supports VRR. */
> +static bool has_vrr(igt_output_t *output)
> +{
> +        return igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
> +}
> +
> +/* Returns true if an output supports VRR. */
> +static bool vrr_capable(igt_output_t *output)
> +{
> +        return igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
> +}
> +
>   static void setup_output(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
> @@ -136,6 +173,53 @@ static void setup_output(data_t *data)
>   	}
>   }
>   
> +/* Read min and max vrr range from the connector debugfs. */
> +static range_t
> +get_vrr_range(data_t *data, igt_output_t *output)
> +{
> +        char buf[256];
> +        char *start_loc;
> +        int fd, res;
> +        range_t range;
> +
> +        fd = igt_debugfs_connector_dir(data->drm_fd, output->name, O_RDONLY);
> +        igt_assert(fd >= 0);
> +
> +        res = igt_debugfs_simple_read(fd, "vrr_range", buf, sizeof(buf));
> +        igt_require(res > 0);
> +
> +        close(fd);
> +
> +        igt_assert(start_loc = strstr(buf, "Min: "));
> +        igt_assert_eq(sscanf(start_loc, "Min: %u", &range.min), 1);
> +
> +        igt_assert(start_loc = strstr(buf, "Max: "));
> +        igt_assert_eq(sscanf(start_loc, "Max: %u", &range.max), 1);
> +
> +        return range;
> +}
> +
> +/* Instead of running on default mode, loop through the connector modes
> + * and find the mode with max refresh rate to exercise full vrr range.
> + */
> +static drmModeModeInfo
> +output_mode_with_maxrate(igt_output_t *output, unsigned int vrr_max)
> +{
> +        int i;
> +        drmModeConnectorPtr connector = output->config.connector;
> +        drmModeModeInfo mode = *igt_output_get_mode(output);
> +
> +        igt_debug("Default Mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(&mode));
> +
> +        for (i = 0; i < connector->count_modes; i++)
> +                if (connector->modes[i].vrefresh > mode.vrefresh &&
> +                    connector->modes[i].vrefresh <= vrr_max)
> +                        mode = connector->modes[i];
> +        igt_debug("Override Mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(&mode));
> +
> +        return mode;
> +}
> +
>   static void display_fini(data_t *data)
>   {
>   	igt_display_fini(&data->display);
> @@ -582,6 +666,173 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
>   	return get_dc_counter(str);
>   }
>   
> +/* Converts a timespec structure to nanoseconds. */
> +static uint64_t timespec_to_ns(struct timespec *ts)
> +{
> +        return ts->tv_sec * NSECS_PER_SEC + ts->tv_nsec;
> +}
> +
> +/*
> + * Returns the current CLOCK_MONOTONIC time in nanoseconds.
> + * The regular IGT helpers can't be used since they default to
> + * CLOCK_MONOTONIC_RAW - which isn't what the kernel uses for its timestamps.
> + */
> +static uint64_t get_time_ns(void)
> +{
> +        struct timespec ts;
> +        memset(&ts, 0, sizeof(ts));
> +        errno = 0;
> +
> +        if (!clock_gettime(CLOCK_MONOTONIC, &ts))
> +                return timespec_to_ns(&ts);
> +
> +        igt_warn("Could not read monotonic time: %s\n", strerror(errno));
> +        igt_fail(-errno);
> +
> +        return 0;
> +}
> +
> +/*
> + * Gets an event from DRM and returns its timestamp in nanoseconds.
> + * Asserts if the event from DRM is not matched with requested one.
> + *
> + * This blocks until the event is received.
> + */
> +static uint64_t get_kernel_event_ns(data_t *data, uint32_t event)
> +{
> +        struct drm_event_vblank ev;
> +
> +        igt_set_timeout(1, "Waiting for an event\n");
> +        igt_assert_eq(read(data->drm_fd, &ev, sizeof(ev)), sizeof(ev));
> +        igt_assert_eq(ev.base.type, event);
> +        igt_reset_timeout();
> +
> +        return ev.tv_sec * NSECS_PER_SEC + ev.tv_usec * 1000ull;
> +}
> +
> +/* Performs an atomic non-blocking page-flip on a pipe. */
> +static void
> +do_flip(data_t *data, igt_fb_t *fb)
> +{
> +        int ret;
> +
> +        igt_set_timeout(1, "Scheduling page flip\n");
> +
> +        igt_plane_set_fb(data->primary, fb);
> +
> +        do {
> +                ret = igt_display_try_commit_atomic(&data->display,
> +                                  DRM_MODE_ATOMIC_NONBLOCK |
> +                                  DRM_MODE_PAGE_FLIP_EVENT,
> +                                  data);
> +        } while (ret == -EBUSY);
> +
> +        igt_assert_eq(ret, 0);
> +        igt_reset_timeout();
> +}

IMHO, we need to re-use these VRR specific helpers. Probably, move these 
helpers from kms_vrr.c to kms_vrr_helper.c?

> +
> +/* Prepare the display for testing on the given pipe. */
> +static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
> +{
> +        drmModeModeInfo mode;
> +        cairo_t *cr;
> +
> +        mode = *igt_output_get_mode(output);
> +
> +        /* Prepare resources */
> +        igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
> +                            DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +                            0.50, 0.50, 0.50, &data->fb_rgb);
> +
> +        igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
> +                            DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +                            0.50, 0.50, 0.50, &data->fb_rgr);
> +
> +        cr = igt_get_cairo_ctx(data->drm_fd, &data->fb_rgb);
> +
> +        igt_paint_color(cr, 0, 0, mode.hdisplay / 10, mode.vdisplay / 10,
> +                        1.00, 0.00, 0.00);
> +
> +        igt_put_cairo_ctx(cr);
> +
> +        /* Take care of any required modesetting before the test begins. */
> +        data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +        igt_plane_set_fb(data->primary, &data->fb_rgb);
> +
> +        /* Clear vrr_enabled state before enabling it, because
> +         * it might be left enabled if the previous test fails.
> +         */
> +        igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, 0);
> +
> +        igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +static void test_deep_pkgc_state(data_t *data)
> +{
> +        unsigned int pre_val = 0, cur_val = 0;
> +        bool flag, front = false, pkgc_flag = false;
> +        uint64_t start_ns, target_ns, event_ns;
> +        drmModeModeInfo mode;
> +        enum pipe pipe;
> +        igt_display_t *display = &data->display;
> +        igt_output_t *output;
> +
> +	pre_val = read_pkgc_counter(data->debugfs_root_fd);
> +        psr_dpms(data, DRM_MODE_DPMS_OFF);

Please fix the style: don't mix tabs & spaces.

> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +                igt_display_reset(display);
> +                igt_output_set_pipe(output, pipe);
> +                data->output = output;
> +                data->mode = igt_output_get_mode(output);
> +                igt_require(has_vrr(data->output));
> +                if (!vrr_capable(data->output)) {
> +                        flag = false;

Shall we use dynamic subtests instead of this flag?

> +			continue;
> +                }
> +
> +                /* Capture VRR range */
> +                data->range = get_vrr_range(data, data->output);
> +                /* Override mode with max vrefresh.
> +                 *   - vrr_min range should be less than the override mode vrefresh.
> +                 *   - Limit the vrr_max range with the override mode vrefresh.
> +                 */
> +                mode = output_mode_with_maxrate(data->output, data->range.max);
> +                igt_require(mode.vrefresh > data->range.min);
> +                data->range.max = mode.vrefresh;
> +                igt_output_override_mode(data->output, &mode);
> +                prepare_test(data, output, pipe);
> +                data->primary = igt_output_get_plane_type(data->output,
> +                                            DRM_PLANE_TYPE_PRIMARY);
> +		target_ns = NSECS_PER_SEC / (data->range.max - 10);
> +		do_flip(data, &data->fb_rgb);
> +		start_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> +
> +		while(event_ns - start_ns > TEST_DURATION_NS) {
> +			front = !front;
> +			do_flip(data, front ? &data->fb_rgb : &data->fb_rgr);
> +			event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> +
> +			cur_val = read_pkgc_counter(data->debugfs_root_fd);
> +			if (cur_val > pre_val) {
> +				pkgc_flag = true;
> +			}
> +
> +			if ( pkgc_flag == true)
> +				break;
> +			while (get_time_ns() < target_ns);

Looks, this is wrong. You're comparing the timestamp with the amount of 
time.

Also, do we really need to filp everytime? Flip once & listen the vblank 
events isn't enough to achieve extended vblank?

> +		}
> +
> +                psr_dpms(data, DRM_MODE_DPMS_ON);
> +                cleanup_dc3co_fbs(data);
> +        }
> +
> +        if (flag)
> +                igt_skip("No connector with VRR found\n");
> +	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
> +
> +}
> +
>   static void test_pkgc_state_dpms(data_t *data)
>   {
>   	unsigned int timeout_sec = 6;
> @@ -669,6 +920,17 @@ igt_main
>   		test_dc_state_psr(&data, CHECK_DC5);
>   	}
>   
> +	igt_describe("This test validates display engine entry to DC8 state "
> +		     "while extended vblank");
> +	igt_subtest("deep-pkgc") {
> +		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> +			      "PC8+ residencies not supported\n");
> +		if (intel_display_ver(data.devid) >= 20)

Please use igt_require() instead of if-else.

- Bhanu

> +			test_deep_pkgc_state(&data);
> +		else
> +			igt_skip("Deep PKGC not supported on this platform");
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC6 state "
>   		     "while PSR is active");
>   	igt_subtest("dc6-psr") {
