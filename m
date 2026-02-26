Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593B7FD460A
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 03:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD8610E85D;
	Thu, 26 Feb 2026 03:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLYk7jEH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C2510E85B
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 03:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772074918; x=1803610918;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CqR5jOHIHWGvrfta1SHsV/tpv66ddgx282/UpSXfkdo=;
 b=aLYk7jEHsUqPgndgA2PUC5EVWSfBSQ+xgOiJPlOMB6pz6IAStJGc3lqR
 xVK5C55bHzcI+bJlJVVBWwdRFBMLcGFXj/4cu7tLo/TuVC53ovfa4NOL+
 3fupxKlrMrcsOCRM/cV2IPsHVcfSopGWAPKvv5iUfSPtoHvd/BFPJdfas
 zfLn9c7EUWIdFYsDtgGpQtZNay3dYAL8zV2vlLDa3Tvfn1AK3kfsd5VEM
 AlQT5wOG9iC8g0eRNiLATpcAOkpgV/a2UUiI+e8F4gEJRY02G4xs1qZwu
 +qAZfiRW7IdWMGCiU/Z3CSEth/r9wBR57pSsvCpJDRe6DwDegjn6sAecg g==;
X-CSE-ConnectionGUID: HiYspCgBQ4aoD3QPGY8gng==
X-CSE-MsgGUID: TcJecq6aRUK6OAbWSLg8xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73103589"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73103589"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 19:01:58 -0800
X-CSE-ConnectionGUID: 6z+zj5cvQQmquU4p7vFHzw==
X-CSE-MsgGUID: NWe+sKyYRRGl0gzQ57Zn1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="221054314"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 19:01:57 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 19:01:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 19:01:57 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 19:01:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQD5x8k6ijAFTmCjtB+wKjSQSIoDWHStbdQ0hYMfJUP7U9QNlEipkFDHiFiC1FMV4apF3FMCJlDaRN0aVjhExhmRLZCbKFCAxdfVEm9Y+s41FMB9ReHj7eCCkQoSesg1q2A9CtHO7CtWQZ7vEVXBWAvSPoDAJtaEImuzWFb4K2xDpavlq6oavYc6J5qjmShqhd9M8TPHRfmFQVn/T8GcKhx4awPIOPEwpl3rnya2ggq2bxR8SPOOg3w7oRSTfYiExJRIsFxaqjFipPTsBpp8CLWMcswOlNd35ms3AryK1PbgsFcKP1ItTjj2CWR//epvgPXe35z6ljfnQKyqmkBVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1118+D+NpK36+GJDGZHrpqkhIXRrOi4AQrsau7UguQ=;
 b=XMhfiOPkpsplIYt+pf/IE5wz9DdXk2Gueo7cPn1tL7KKWDehcTOAEdstjrLtm4Yi72WrW0yMqSO46UeY1NL3N9HMJN5A/RupEicphH3whlxeFaKCOA2JXNqn43KVKkZlVYpww2/2v+FqBPXtf+WMUtuOGAUmXpFhJyY8SedFIUW6lOTb9D+pVbTxIcRCGtTnYMfPDGkOumeicvG5cTrfV1PbKGJGbGY0LYFKotHYeZCpBvL92YUuehFDAXp2+I0hx3kb1SkluRmOu7l80Sf3wV91kLb/3K3Vd87jZjo8Q9bEIlQcMDTLf11fY0dkvUU9i/bKTmQs/l6amhWTqM7OCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by IA4PR11MB8890.namprd11.prod.outlook.com (2603:10b6:208:55d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 26 Feb
 2026 03:01:49 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 03:01:49 +0000
Message-ID: <b404d769-698a-4aba-8e92-ddedfd602ff6@intel.com>
Date: Thu, 26 Feb 2026 08:31:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Restructure
 modifier validation into per-modifier subtests
To: <igt-dev@lists.freedesktop.org>
References: <20260217093048.1597495-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260217093048.1597495-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0187.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::9) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|IA4PR11MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: d17d704e-0f93-4a12-db98-08de74e362be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: cYyR1rSroUCsdN1BBvythKqNtsW4bs7+9oo1BvFSbTWv+j2RxC0P4ZP9VF7ROjDCn9KzhLsGRPOxcI/f/KUageHBDrd0ekFAypJnuwdZ72cUuznaRyEZYFbR0c6WkBEmH6eZYJEWDqByFkAbhl2/nc+nQWF8z4jBEXl6Lb2BB7bYRMAiCwB7LO2vCIMJiW9bD7oAnA+y29bkMTFSUjTYyySywqkHXatNj+2pJ47HyyJTkvT3IUh2b2tl8Z8qX1JWtRXo8oqNwStfnZ60oAHXx1FDdBSrQjBPLjijcV8mww+YO9vsx5dZQfLWijpuKUtqeU9lDt2BcO4avTr+PWvWjSRFQEb7n7x0IMDVC01IQ0kXojo54RiHR0PK8tW95sqdrQekoLChYhybyw0xHTR35y52PC1hrUZpG9omgyROP/QtnN9hv3VHlfnlMNVYJvhgN9FaEogp7nBMHgkz2ajQUYb/ejW4AJv985tfHY65uwb3fObycKjvQZhtsTyS7iNawbo/KlKPZ9J3uQTnVQ0omQpYS0wju9KUbpPpk01iO6wf9cmeWdnRMKYgCwcIvS7TpOy/+TqfqNA6C5SkP0EFICwO7Xq0qiNTkc9eLCqf5fdHMlz3PqFH0rNIoVMYdy2ju/KncizHapzExyXVFSNM0rV6OLTrqGuRw6Jb6zVtb6tbeMSeCtkkzXF1AcD7Y7mk6q1qXr7HI/cjmSB0JqUyrBbFS6xyDBTDmHWwbJ/kNTw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkRZOFM4NGdiVTZTSzk3d1FnVXk4L05mSzd2aEtNays1Mm5CM0trTFY0ZUVj?=
 =?utf-8?B?VVZ2QURlNk1nZmJRdHV1cVpRR081QXZOeUluWWNWSmpLYWJ2YUpTS1MycVNX?=
 =?utf-8?B?c0RINHBCVGNxQzNVZ0NXNkJBejlnQm1ReEowMUk1R2hUc3JkSTVCT2cxY1Mv?=
 =?utf-8?B?VEhiYko5dDNYbWg1dTJUTlpCSEFCaTI3bVp0Qmhoa3Z0bjk1L1pTbXlob2Z0?=
 =?utf-8?B?ZTB6Znd5czNaSWtyTHd0bkxvNTdsZCtZNUFxVjZZZ09EREVOc0g2ek9DOFdK?=
 =?utf-8?B?TWxGZjlPN3daUmFRV2RzTnR4VWNWdVg0Nk14TEhVcVorY3JIN21HMVNrWitj?=
 =?utf-8?B?V2pBWlpBcjlrV0ErdE00bm8vTFBGVWF6NXBLQ3BuMjRNamt1S0dCVkQ3S1lo?=
 =?utf-8?B?c1FYa1pSZ2t1Rmh3dzJ0TW90WW40eUZFNGx5ZmY4allORDY5RmNYRFU5U1Fs?=
 =?utf-8?B?TGdHbjRZbExTSWJXcEtNU0pIbXdxeDc4emhrdGdOT3Y2Z1NBUGxTSjNtaTJy?=
 =?utf-8?B?Y2xLeU5NSUxNYUYzUlc4NHBFMzBRQU9nZlJmb0FUZ3oyeEhqYjVVYi94UXBa?=
 =?utf-8?B?dWE0MDliaWU3SkNrWWVxaTJJbHEwOEpsTlovM29TWE5lUWUxMDE0dnBTemRV?=
 =?utf-8?B?SEdYYWJLTDUzOFJhYU1SbkgxMXRTVWdZWTNNQk1JVGNmOUUyQ1ZxT3RsQ3VN?=
 =?utf-8?B?bG9WbG5iU1hNTnVENTVJSjliekdKV1lHT3hRSjF0QS9kbmN6UkpSa1NEZGox?=
 =?utf-8?B?bzRRRGtKbDg0S2FNZ1lIK1pXZXhyQkYrdS9JclVGNEZvVmptMTN3V2cwbjVG?=
 =?utf-8?B?QnltZkpBMmpncCtPNDZaYnFxQk85aHBXRkdNVTBXUGxqT2htQXBjYWtZSkpL?=
 =?utf-8?B?ZS9YMjlmdXU1RDVSMWQ1a0FxVWxhZXQzdm5aMFJ1SmZwNE5sclM1MDE0dzN3?=
 =?utf-8?B?ZG1JLzlWcjA1czlObkZZdUN1WE1wY1RHTjFvMXkxT1ZvWjdjQVhtYlFrN2U3?=
 =?utf-8?B?TGFZc2tncHlHVmlUTFZNcXBIYU13OFZWd1UwQzFPeit3RFQ1ZGN4Mk04em12?=
 =?utf-8?B?SnlmcHFlZ1pMdU5SK0pGditZL2pYbjlZV1FXYlpUNVVURHU5eVRrNHV2dlYy?=
 =?utf-8?B?V0dSK1ZZK2g4OWYySDR5WnA3N05mQmxUSUFzL21IRFBTak5JRnE1MkFVcHVk?=
 =?utf-8?B?RXAvYnI2aTlwSnJYWHArUGxtK3EwVzdrQTFMZlo5MUJVSWFzdkpCUVBIcUt1?=
 =?utf-8?B?VEkrWkluK3FsOXhBYVQxQWdnSDdjSit2M0NIZ0l0ODlDMGo3QUVIVUZjTHZG?=
 =?utf-8?B?Sk5WODFGWlZIWGJ3NEpDd1djMHNwS1JJN1p0RElGbXZqTi90dE03blQ4Unpk?=
 =?utf-8?B?MEJxZmNPUmg0K2tJZDJkWWxKUmRCcFV5VFVCa256YVJVRXRuOHgwTEJYMy9U?=
 =?utf-8?B?SzhwNitHeG9PcFNtaU1HVk1QdWljNWd3V3NESmJSTUlDeW5KU2JycUZpd2Fo?=
 =?utf-8?B?TUUxc1BLTHZleksvUXdvSmpjbCtGb29mRHNESi9keG1OM3h0UTlFN2VGN3Rr?=
 =?utf-8?B?UitmSzZEMCs3aUMyR0Y4OWFrUlMwUVhaWWtUSlFtNlQ3eS8xVzJFVTM0QmFl?=
 =?utf-8?B?dlpob3czM3dOTGt2dG5HSG9TME9McFY3VkdMbk9qUi95em9BZWFnYzBNVUs5?=
 =?utf-8?B?UUVhRGl6RkZJNlpjbm1yQk0rZ0h0enA2d2hwMzlTdjh3akkxY0pRZFIzSFc4?=
 =?utf-8?B?WjVPMHVSK25nc1hYSGJqbGlJWlFyZUZXLzgvZjFta2FvdTAzbHVUSHJFeDRW?=
 =?utf-8?B?aDJORHF6K05xM3RzZnpiR2tFUVRWVEp5Ulg4MytwMk1SQ003T0lYRi9nWFBw?=
 =?utf-8?B?dk1BdHdRek5QZHUvQmx3Y3p6ZUEvR1FjU1FsZXdNUklYdkQzVVNQc2ZnYjMv?=
 =?utf-8?B?OTNPN1pOVzdMY0dLaDFzTzk1Mk53Wm9hbE9iZ0o1cmNvSWRsRjhLMmVPb04x?=
 =?utf-8?B?Qy9reFlhRmk4dXMvc2RVOGg3S3RVTDNXc01sZ0VwMFlvbmplQlQwbDBsUVFC?=
 =?utf-8?B?Z0g0SkNBSEZieDhMK0dWb2d2WjYxQ2hHb0hyNk9wejdXZmhRai9vRnFaOEVz?=
 =?utf-8?B?OW9zdE9xQ01rV1FxbHRvWi8wTmJDcGNWU0pQUTk4NWQ0RS9EVTZZSDdFdWpz?=
 =?utf-8?B?M3ZWcmVxR3E0cFRXSzRIV3pOUk9kNkk2S1JCNDlMdGw0YTVZV3REUFhuRTFS?=
 =?utf-8?B?Q3JnMnlXM3FKUEVvQ0FpVGdBMENic3NtUEU3UU8vWEtXejJpN2RvN0lQNGtJ?=
 =?utf-8?B?YlZteEJPU1ltOXJ1WFFLR1o0OXdXZ0w5WVJodUxMVUVmTFk3UU1ZdFhMbHJF?=
 =?utf-8?Q?Q1L9O0Wz2Vg06uwA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d17d704e-0f93-4a12-db98-08de74e362be
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 03:01:49.7425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfyRsEwCrbVN1I+kHuGnJDvqDl0LjmBmquPv4CXFYDZ0QiCG52nfNGnjtWruCBpVYYvdJdrGFzAql3BrcJpBkwEc9yX0Lrkohil8nd1gK5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8890
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

Hi Pranay,

On 2/17/2026 3:00 PM, Pranay Samala wrote:
> Previously, all modifiers were exercised within a single
> subtest, making failures/skips hard to isolate and debug.
> This new flow generates explicit subtest names (filter-modifier-%s)
> for each modifier, improving clarity and CI reporting.
>
> Each subtest now validates only the selected modifier, and
> unsupported format/modifier combinations are cleanly skipped.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 34 +++++++++++++++++++++---------
>   1 file changed, 24 insertions(+), 10 deletions(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index eddfad6b9..0140363bc 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -21,9 +21,6 @@
>    * SUBTEST: filter-strength
>    * Description: Verify that varying strength (0-255), affects the degree of sharpeness applied.
>    *
> - * SUBTEST: filter-modifiers
> - * Description: Verify content adaptive sharpness filter with varying modifiers.
> - *
>    * SUBTEST: filter-rotations
>    * Description: Verify content adaptive sharpness filter with varying rotations.
>    *
> @@ -70,6 +67,17 @@
>    *              sharpness filter.
>   */
>   
> +/**
> + * SUBTEST: filter-modifier-%s
> + * Description: Verify content adaptive sharpness filter with varying modifiers.
> + *
> + * arg[1]:
> + *
> + * @linear:	linear
> + * @x-tiled:	x-tiled
> + * @4-tiled:	4-tiled
> + */
> +
>   IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
>   
>   /*
> @@ -596,16 +604,22 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		}
>   	}
>   
> -	igt_describe("Verify content adaptive sharpness filter with "
> -		     "varying modifiers.");
> -	igt_subtest_with_dynamic("filter-modifiers") {
> +	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
>   		data.rotation = IGT_ROTATION_0;
>   		data.format = DRM_FORMAT_XRGB8888;
>   		data.filter_strength = MID_FILTER_STRENGTH;
> -
> -		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
> -			data.modifier = modifiers[i].modifier;
> -			data.modifier_name = modifiers[i].name;
> +		data.modifier = modifiers[i].modifier;
> +		data.modifier_name = modifiers[i].name;
> +
> +		igt_describe("Verify content adaptive sharpness filter with "
> +			     "varying modifiers.");
> +		igt_subtest_with_dynamic_f("filter-modifier-%s", data.modifier_name) {
> +			igt_skip_on_f((!igt_display_has_format_mod(&data.display,
> +								   DRM_FORMAT_XBGR8888,
> +								   data.modifier)),
> +				       "Skipping: Modifier " IGT_MODIFIER_FMT
> +				       " is not supported on this platform\n",
> +				       IGT_MODIFIER_ARGS(data.modifier));
>   
>   			run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
IMHO, I observed that kms_sharpness_filter.c contains two separate sets 
of subtests for pixel formats and modifiers. Due to this separation, 
coverage is missing for other pixel formats when combined with 
modifiers. Currently, the test checks modifiers only with 
DRM_FORMAT_XRGB8888.

Instead, we can create a combined subtest using 
igt_subtest_with_dynamic_f("filter-pixel-format-%s-modifier-%s").

This would allow the sharpness filter to be tested across all pixel 
formats with all modifiers.


>   		}
