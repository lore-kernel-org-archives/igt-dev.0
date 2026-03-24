Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED07F532FF
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FEC10E637;
	Tue, 24 Mar 2026 09:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtlrT8i5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53C410E637
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 09:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774343486; x=1805879486;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SWxlaoxSKg/1xPmObC+FlDXPZXTQvlfXAV1bG8rsVp0=;
 b=JtlrT8i5+WyxunJoOeuJ6YyRGHbJBjNhmtoZwWQOuB50LcI+fwGbH5nV
 Cn+dwQu22Rd8C5+LsVLhlo1MMowhLl5yh4UC3VcOtHMOtHiHAH+4IiEGl
 Se0JdiyTIR8OsWsl97n3Kyf8shGY/kVJcVLuuxYoKroiKQhqYJJof2bK5
 UVFSH6Z0zxOEiTXK6Zw7lwqmbcfWptW4Zz77bGG9X0S/6SW0IuX60TDUh
 0R3R/Gx/1bJzW7VhFEeukGQa9inSIDorxIyJWc7E3HJT50P8Q1vzCGwHu
 t58Ln7LlHuxSbNd46pgN18L3fRVoCAvSvbl2l5LHhTOn6D/TkFxaKPTXt Q==;
X-CSE-ConnectionGUID: Ig+H8xvAT5ucyikcCrS9vw==
X-CSE-MsgGUID: +CWdlYpuTZe1YCFS8r/5Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79210407"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="79210407"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:11:25 -0700
X-CSE-ConnectionGUID: jTo27MfFS9Skmw/WtK5rxg==
X-CSE-MsgGUID: X9tMa92QQQuJ7BkHjubpoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223371284"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:11:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 02:11:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 02:11:24 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 02:11:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxvSSn5bB+2qx7ZdLnMukY14NGDHGSGUs4JWZRltnAFmHlpxXdjkZ2Lq2cgSqBfIJhpc9xSIjwMWOE+eD7Q7hBe8ywz2yC3kYqkMg7gosNZ0RthohUBQs9CcdSCMEKHsvb7ON+t+JsIKfsWPgzvPNaabNvGA/owluPkF4njF4jXVoDa4vCItDKIbFIJnp7Mp4ceEWf8v9+V0PHnGFHjeWabSxMJ9PXT/OlNIuXB2nnSxOIYAKqtM+xjoZNsvw7DqIlfzZyEl7LwGb0Mf2v/Qgb195oyZhfy8RTcAhB42++cZEHxfm5YiTryMXBc7HFIKBuSueyCitR3u1P689hI7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuOut3N1dMHwSMIT19AXk7qNfKHYmdpi5QYz57EF8oA=;
 b=EsdII0m+/kM2Jc+RTeDF3rXDStG4fEnL7JfSlzavhIF9kJ4XSatM0bT8M6z65101RLN6fAK3fSIt9ISaNa3P0Tn9XQt2Y1AaQ8Skc4pzRF5h11mQzzGSHAPWSX9axAj2qYYEDFv1mGt9XWsePERFo13fK9xiGT4zcminUhugrES0oJjKJB3GvGGoRTlfurwoErpa5gGFzzJ/s7ZGjuWXiGdA0GSDCbfUBAjtt8s/xATKEFjDk3g1O8VDPz80j8bzInQseh54CcyRXSUl+bL3f9FsrflQUt2KBBZec49RwQ45DBwdxMHtbru7sG+znR6e0FN3F34tuhOsLRfU6CmogQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by IA1PR11MB7246.namprd11.prod.outlook.com (2603:10b6:208:42e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 09:11:22 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9745.012; Tue, 24 Mar 2026
 09:11:22 +0000
Message-ID: <dc2a60df-66b1-4b28-8af3-510862c00da6@intel.com>
Date: Tue, 24 Mar 2026 14:41:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Use lowest mode for
 crc subtest
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <arun.r.murthy@intel.com>
References: <20260317053038.51570-1-santhosh.reddy.guddati@intel.com>
 <20260317053038.51570-3-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260317053038.51570-3-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0111.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::6) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|IA1PR11MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 96601b1b-e919-4fc4-41eb-08de8985513f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: /apoj7/GuMXFe656tmj6u5LdyQbPfnlqpfiRQf9+dPOXeCi2A2afV1NFJWbl944MjxIWrNeLskgVswdFkMpSb3FkoZy9VVKPUutHHf636cP8E/WqYICKYg3Pbge+ODrpzpda4COSmrlJckmGsneblHoCIQSopuE+NckEzpNGLhQZyD1XX1RIvw7ak+0q6PbvFRGzjx06OTEDxmGG6DaKZINQZ5GpX7zCcP54HcP+X49T24GuSiCJW6NIygS0SGyxZV0kd0QbVOnGtImDoJ45nnJm2O9Vh7Zf1P6VbATtEUUJQU2Lpi4bSV9Vorud/7s55uaoYhk9Iho5uPdCV1msVeBZLuF8nrJ13dUrDxA1yNBaXYaitGrkateUqNrSqOR0ofVFDVJrL5imBIeQgWvmPfK0b3wfpm4GtVLTXrZGFfnhoLZzFg6tmkNbYFlVHTiaFMdo46CaeNs/99GMQulTLq2p7m+EA6SsBc5aEU8V5dDAK5iE2UEIBR5E031037aGzC5cy3ri5niK6DwQB6meExdrMkccIaxm7UUb8a6S+dnnLYzgPHiPC/TEPyTWZmpZPM9SPMNfBLr8cW2i179SyOM43FsYQuo0dw/AqIBB+4GHzzzpiP7juzhz53FdcbcyIFRqR0LMTB1by2D2da4JAAEc+SOCova/pFUD/mSAfTzTgG4MaidMnzSvR/4YJR70fbGBmeMrHXx3cDSYfx0lqPPVkG32f8nWeeWXM4x9ukg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFFWTTFaMnNBNXgyVitLTmUzNlV2cG0vVmY2YzhPakpiUG9TRktDN3FWTVVU?=
 =?utf-8?B?SDRENzNrU2hGUnE1UjdKRG42Um8zZzYyVmpkdWllMUhWek41VktaZU12REJp?=
 =?utf-8?B?VjgvN05TSlhRZ25UMzdNMnJnMndSd29yUDJ6cGpPTmlEZXVxblZrb3FmNU1M?=
 =?utf-8?B?dS83WWZTYTBYcXBLcXc3eVZFdFgxYjg5SzhGWXBET1YzRkRPeWNna2FxL3JB?=
 =?utf-8?B?dktHb2YybVZ6b0RFR05BN2VoY2kxR0crOXUwNEx3UXVIanFSa2xMMGFrSjB2?=
 =?utf-8?B?YWhwTTBrVDg1NDk0Y2pTbTZvTnlmRjVldGd3dTVSb21BN3dUNmhwYndZc21a?=
 =?utf-8?B?emt4eVVoazBNR0VaT1NRY2x1ZHU4Q0FTZHpmWk1Dc3VMRHJDOVFXbGVOTGpy?=
 =?utf-8?B?T25oU3lnNkUrN1ppTmtMVnZaSzFDWk52eXZLZDYrMTVHMERmeVd0cEVkczQ5?=
 =?utf-8?B?eU8wdWp0QVp2VVdHOW5IZnRyWEJ1RnhpUHd0eWVtK0VqQS9WRXJFTVBNRld6?=
 =?utf-8?B?c2Z5T09aZGdiaENjQ0hMMU5xM1M2bVRQUzdiNExNYlJDaHNIQVFYT21MSFdV?=
 =?utf-8?B?WkY2Y04zYW9iRktnNm10WTlNbEZtdWFOcEpVL0FqZHBOUHhmWnErUjd2YjlQ?=
 =?utf-8?B?aWZVb3g3djNnKzgxZnV1YTVSQ1ZITzRIT2Y3WFNaU25oZE10STZmUU0vWDQx?=
 =?utf-8?B?cWxxcnlnRS9CRHVVdlZkdzZiazJscWp0bENYUVhITExDQ29rbmxHTkx3VGlm?=
 =?utf-8?B?aThzaWt2YlBtWnZoczltMUd4RlhJOUhkMFU1L1htMjhjQjB2UWwzd0p3elUz?=
 =?utf-8?B?M2tqOEtSVDZNaUU2RVN6cHc3emhKWUhMR0s1ZWt2dWJxT1NDZk9ETnNTckJE?=
 =?utf-8?B?eGg0K2JMWC8zZFkrb09XdjlKOVQrMDc4a3I5WDVES1I0bjRlN1Z3MzFyMWRW?=
 =?utf-8?B?bnNNYysrRkl1eWIvN3dHN1FEOG5iNkhLZ05QM2JHcmVtL1B4UlFuOFZLVFRv?=
 =?utf-8?B?Z1RSZG1QVDJ0OTd5M1RTdDFsWlBXZGhhd1l6QjhBRzB3elZTS2ZaLzNCVVBP?=
 =?utf-8?B?RDYrbldDTElaMktXSE93bHNsTFZYWktSYUtKUlowYmFEbGdPU08wQlNZVmp4?=
 =?utf-8?B?NnRLWFJNSHdEMWR6TS9HVUhLOXAyK3NkUFdPbWQ0SlN2bnBBLzdtTzVVTWxY?=
 =?utf-8?B?U1JHT2hjQUkvT1lnaXp3cmlaT0F5ZktveXZuU2dkc1JQWmRVbjZFUTRuL2hZ?=
 =?utf-8?B?dU91RzdzNkNJbjVpekc5YW1MQ2pWNmJVMTJvN1RydGtSekZZUlZoUTBRVno1?=
 =?utf-8?B?a0J6VkVkV0NuOWYrN1U1TjdCN0p4MkZGYm5JTWlIbUhIMWptT0xDOEkzaUZu?=
 =?utf-8?B?UzM2S2haYVcwRktEWEI1NmtHMWFQL2hpZ1B5allGM0NmMk5rS2lGSFZvdWJB?=
 =?utf-8?B?TWRubEYvVVY5dHdxbmM3TnhqQkhVdVhUbVB5WXJ3Z05iQkNNZi90cVJoZDNi?=
 =?utf-8?B?dnhQWGs3M1R4MFA2N210YzA3NFUrTkR3TnFjS1dUNm5NTExsMkhpV1ZhVlVE?=
 =?utf-8?B?RDc3dzdKUkZHRE9QSnNiYlBwSmFsbUU5cGJleTlvUkV3Z0JGKzVUSEZUSVl2?=
 =?utf-8?B?aFR2NVVHdTZxV2l6OFVQSXI5dnJFL0U3OTVrK2FhS2hJZzkvcTR1TitoUUZQ?=
 =?utf-8?B?dVFWMm9yMS9CbHNlK0U3Z21xdkRnb0N4VGVrM0Npd3p4ZGVKejV3VXlsV3ZT?=
 =?utf-8?B?M1NBNklqaDN1UFRVRVdvR0FXZVVVSVpDS0pnRjhqajBzUWNrTGRUSkJnQTRJ?=
 =?utf-8?B?OFFHbXNlTnRZYTRIU2R6N1E3L2VLZkFIUXUyQ1ZaN3JHNFNObzFTNnRJVHFx?=
 =?utf-8?B?c2E3anJaeGIyWHJVVFc2YW1vVGNzRFZ3bjNlUi96cFlUZlB5YnNrR3JPQmdh?=
 =?utf-8?B?MmNhUUVLT2k4ZGJ3bHhsQU81Rnl1Q0ZicDN3MjRvdHJiQTRRWTRhclFBL1Vq?=
 =?utf-8?B?Zk5hYjM0aG12bkVkeUM5ZFNOZldnVkc0SEROMXhicmEwYndwWk80R2htUTQy?=
 =?utf-8?B?KzlyYlNsaDJOK1JOUm94VlpFV1JPckp4b3p5NW40SFpBbm5XRFFBUGlqeDJQ?=
 =?utf-8?B?dVRhNk1LT0lmeG12UFNTeW8vZnJoWmJXdTFhaVpWR1B1M3pNekFLeEk1ZVFQ?=
 =?utf-8?B?UnlEcHI1bk56VSszamF4T1lydjVmb2lKWk52dzJFWXd2SllCWDNZQVAvTTE0?=
 =?utf-8?B?V056L3RnS2hFWFZ5VzJiRUlhZjdDVzQrZ1ovdzQ3cmUyT3dtTkVHVERORkk1?=
 =?utf-8?B?ZFFkZWc2MGFXYkEvNGJVbkJ4VGxVYlIyeVlNL3Jua1JzOHRXYXNLRzdXNUI3?=
 =?utf-8?Q?+iTlZ7DwtcxVb4e0=3D?=
X-Exchange-RoutingPolicyChecked: BpiDuox/xA51v/FgZOui4wOwhj4ab96YQ8HxwJjJUVN5BfgyPnzhcp52hkZr8VEvAo0VIkjMvEqM04ZZVCTAGdMcMY0mdSt/BU5qPI2IqiBLl3KUcs5iR1/m+q+05gPRxCureFUXAEJni/0CZZRfLeaI2zpIba+qCBX6Cp+gZid/BjxfLBoqlD6TSosiO0J/3UAyBdSOVkDGfLl2C6vbKNk5/BN9sJJ6LerxjLvUSiCjOhUlJHwEqKnjqqNFoW66ICTgYM+v8OgpKbkbwCaxCp/CMTPLnAB3wZXmUPbILWZ6NOgngIS0P5qTPxTgjYg2huwB7tv9G+Ml4q/iRn7vNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 96601b1b-e919-4fc4-41eb-08de8985513f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 09:11:22.3554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ChWkZucywl8z9U5VD+YuWIrFOnuy27ovqJOxEnBz6u7nGC29x6McLdeG+R1QGMfs4kMf66rVblXFRduGqKMG1yA6wj5UBKhPLq711bnevo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7246
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

Hi Santhosh,

On 3/17/2026 11:00 AM, Santhosh Reddy Guddati wrote:
> Currently The CRC subtest uses mode[0] which maps to preffered high
> refresh mode. On panels with multiple modes, pick the lower mode to
> speed up crc test.
Here your using a mode where pixel clock is low. Update in git subject 
and commit message.
>
> V2: Rename and move the function to lib to re-use. (Ramanaidu)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 4a2930968..e8a3da07c 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -819,8 +819,9 @@ static void test_crc(data_t *data)
>   
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> -	/* make things faster by using a smallish mode */
> -	mode = &data->output->config.connector->modes[0];
> +	/* make things faster by using a lower bandwidth mode */
> +	mode = igt_output_get_lowclk_mode(data->output);
> +	igt_output_override_mode(data->output, mode);
>   	width = mode->hdisplay;
>   	height = mode->vdisplay;
>   
Observed regression with your changes. Check once.
