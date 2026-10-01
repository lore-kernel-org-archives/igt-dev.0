Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81DBCA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 08:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9544E10F5B3;
	Thu,  1 Oct 2026 08:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z3/CRLlG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F5310E219
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790842097; x=1822378097;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Lb2cSiVAT0NRja4X9t0W/LscwhRO844xYa5/EDP45cE=;
 b=Z3/CRLlGJ01mtHSPpPfboZwiYHcb7qGL+D9JHyzz1hodVjFwEB06EVPe
 O0w4BTU/S64X35HoUbnItCvd8r/6ev2a1AFIcTnICFMxM5p7Cqb2sFKMN
 Eq+wCoX02kZUdYcoFDwgx4zhO9gUkBOtNGOoZ0SwVqA1iJSqi6t1p1egv
 hgnR1imQIsGMZhi/6yeBAkNvrcc0qZMrea6YrCOT2WxeqdsyeoiqahHaZ
 D5QK5boGbwo6paw1Lg7j96r80CUE8daERuYzgYj8Jw9r2KjbYYuUQIHwS
 UlQ7GWryWUrmwgYh47Lm5WI1OjqjT9ahU/a+0PfI/Uy/TXrp0vXbVQ3W0 g==;
X-CSE-ConnectionGUID: KLj3IZ9RQ6i51GSEkBAxFg==
X-CSE-MsgGUID: wPFkXMieSLWFKND23UvZRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="100925708"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="100925708"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 01:08:17 -0700
X-CSE-ConnectionGUID: Jfs0JxuYRH69aglGCLajBQ==
X-CSE-MsgGUID: NZJ1yqLjR46p7geGs5M2zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="305437286"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 01:08:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 01:08:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 01:08:15 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 01:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWTud+9hroeuHXqv5OX01Vkl2CnaoJdni3ZWXwdgTZ7kxot56xK9z9TZ1oTxShDDVTm+nJG0u6h3s2IZPvp4nwKWgjqYFnwVW55hbDPhCG8SbMYq6L+AIDq/b6XhCYZM1LU1tPY6htyBU+VREIp64KVGL2DqydJdktwyhdbwLexOkdCltWj1k69E7kInoSiHXfuA1L9XLAb7yDR/b7vVAU3gUWPCSYJ4GvPnuN1sP+sqKMGagR230MaXRZxyt0nzI9EjuMPvNIEYdu+G/7zpAbVNGR42Txsduy7PLMGui4XmjWpRjrbta+mvOd1YrQp+c975cU0tZKZG2re9fwuAuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1ZFss65YIZix0Odtt//fHdVcrxEjquyk7TMhHxfua4=;
 b=YktgTtlwXGeFNUKJMolJxykVaTrYjs7njIvdA2hH162t0CN+wKRd3an2Q75PKRgMFAVRUCQMGlHFQ7XlOVHu2IBDmxExb3KcO894ywVOqYfcFHA1xF/7nUiGOBdsEqWtBT4O10fO1ksTAqkE1VEh1WzoV9fYjYl8YJcKjI2WhVDhmvf+GVDMinqWOOF6tF0BaQqTpsLSueR3/RSabS8w3mI+BPI7E6ESbh7WvTNshlrKB7g/YIfvlOBYTT8/jTbE5rFC3SwA2ar/thww/Dh4C8T2t4QEJsItb66guh2HuKruHOj6LLzdyQzrCFx6O6+F2twVhYDb41gcUDkmVqWVLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 08:07:59 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 08:07:59 +0000
Message-ID: <c6f04f85-fcc5-424a-89af-258d9b26ba3c@intel.com>
Date: Thu, 1 Oct 2026 13:37:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Purkait Soham <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-8-ravi.kishore.koppuravuri@intel.com>
 <20260911150349.d3bf36adl6ujstd6@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20260911150349.d3bf36adl6ujstd6@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0145.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::15) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|BL3PR11MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: c5471ac1-49ce-48fb-35d2-08df1f931b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: oND8F+47PP4GLukLpNvFAj7f1qSX39Fi9/+eDnGh71aumAUBDHohnOgCDaW8F0W2GwA5NN4Y5c1dZ/fYQV531o19tCUyugeyNkpnIBw5Z71amD5YoDSelaW5K+0HeSoJ8WmQ0QBO0rusiXsJcaXla/7kDTaXOuboLjjxXG/DM6vA7DjMkvtlMK/OTd6Br8pxX3VJgYTN5LqTbUJ6oKhMjoPGnktqii5wY8FovQSSGLi6XsfGI3aCYchbSx041pt5hc06msOUq42ifKg8Hzi9qD3I7rdZ5gCw2hUpsmadtX79cvm4vf369p2TWGfXmzl4Fq4EVBFk/+WATAdGwEA5R7SKN/IIo7b/1B0S3OWw96GahrzxiDlzv3v1lB9ZgOmiUAIBuax4se3Zm3/fqM3W49103YvLYtxTB9a9z07DnoOxqOAaQ9HiJQpLDPryzbpwYqL+u3d8JhFCX7tPVtcJQz7Fy0WXdFvg/Vsd73hksF7ESXrbzTD/CYXdll01sa2uvt/IaFaNCWrlHZ5xW7bhzFguK2MVWofOHQuAfLI+9erhaTMZSPTFLMmRBNxKchnfA1G3dcYQEM8/e4JFqqV6C0Q0qC54ZXLnlPPdW5Bq2MA80lKgzXWCiaQ/mTqDiUVbAl/FTQhYF6MAHfNANhkdcA+NQUBfRNGn2vBQEnni2bk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDVyS0RGbVBobWdsUEtJallmMWVFM1V1Nkp1cVRwSjJGcDlOb3c2VmFBdGhu?=
 =?utf-8?B?KzdGOUE4VTNORnZNd2xHUy9ETHdMbEpRWEg3ZTRxUU5ENG1DaCtIWC94YW4y?=
 =?utf-8?B?a0JPU21zZFNtNUtCbWNrWnNYeEZOWHFjK1Q0NS9yUG1QYktIdEp3N2NXTGFV?=
 =?utf-8?B?ZUZPblM3c1ZwUDZBenZiQ1Rvb1owZEdSYlk2c0lkT2c3NDZ5QVdrZENHOWts?=
 =?utf-8?B?U3prbVg2VmFLR202K3lVZ1U2R3Zsc3ZJRUFLem5VaFNDbGJFWmt0RlpQd2NG?=
 =?utf-8?B?ZGtMVjNJM3VnbER3RU1QeHRnK0lzcW1XSzJMazJBY3JGbGR6NTVINldBNVJH?=
 =?utf-8?B?cE81UmxVZWxsUnAvNUdJYzFkRjNaV0lWV2JpVHh4bll4Zk91M2lLTXZoSVJJ?=
 =?utf-8?B?VDlLWktjMGQySlh4Uk03VC9MQkMzaG55OENkSW9GVjV4MURoRUgzRUt1ajVr?=
 =?utf-8?B?eHdOVXNvVytZQUJldkJpYkdsQ015SHpFRWFYeDA1azErTSs0MkhiOVE3Tk9a?=
 =?utf-8?B?aU5TeW1LY2c1eDZtRnhOektNdFUwTEFwUGRyQ1lxNFArMHpidU1PbGRGYnE5?=
 =?utf-8?B?Nnd2bkk0cEdLQVFVVXBJMjlMNU5SVnRKTUJMM0lVSEtKaU5FTXVGVDlTRXFP?=
 =?utf-8?B?cm5Qa2VGV2pMb1hDWjU4dEtnS0lqZ0E4ZktqNFBJdVJFTjFuWlU3Um5yMGxq?=
 =?utf-8?B?UXAxQmhwdnpiK3ZDZkxsY1hockV5ODJPMlFidzRFNmpDOHB3VlpDK21wWm5J?=
 =?utf-8?B?Z3pZeWlWK2R5dzg0UktobTVKMWJSUit3aElOckxmZEhHKzJwRmdLb3c0MlBB?=
 =?utf-8?B?M0FWZWdiUm5FaU1rUHZSUTNocXhHNXFJN0JORGh1Mmh5YVVOaUtBOWxjdWh0?=
 =?utf-8?B?Vzc2L0UxL2hSTm9CWU8zR3p4dkdVSzhYbjhFdHpjYTFRd3V1bkVBY3BoREJX?=
 =?utf-8?B?eHRrL0xUVjJpUzBpRkxOZHVRdHo3SFRFZ2hxYUw1cVM2aFdCTHlNaDlCMDZG?=
 =?utf-8?B?UjgzdWtqckdrOCtzUlVBTFhMKzRrRXlLOHI5Z1E5ZTRXd2dqQWpIVERvUGl6?=
 =?utf-8?B?REU4Z2ZrSzF2QmJoV2tLcnFYeHg5TVlkdEZURHUvNmo5YUZnYzVuVmdXdHVt?=
 =?utf-8?B?WjVOM1hKOXk3bktkWFRwRE1oYXQvOGd2dHBCSUNMTmtQVTFVT0FOWmV4aDdz?=
 =?utf-8?B?eUlSVXVPUmtVNWl4aTk5Szlmcjh6dzVlQjl1c296WVMvRWRGT3BqVEErbXlS?=
 =?utf-8?B?UTUwWTV6cEF6bnNxejNmcFE0dlVQWnNqZDB6TEJNYWppVm81bEJYaVNEanhK?=
 =?utf-8?B?Z2N3cjFMcDR1VG1JTUpvRXo0TDZSOVFuQkpEL3Z2YTJaWk9ZT0VxMDZCMnA1?=
 =?utf-8?B?UkZWdnRzTDJ6SzBpSk81dmZsUHB2bWxIVGF0NDlXS25KMi92SzljT2VLNmhj?=
 =?utf-8?B?TVI5WXYxcnZzUVd5RTJaTHNKbnp5b29SWjNQbHdJUWVHRGUvUnd0RHhJR2xn?=
 =?utf-8?B?MEF3T3djRFlyQmtnVGNUZzNaaGRML0xmWGNCZFJuZTJJVEpKQmdXRUxXeXYz?=
 =?utf-8?B?Zys3R1p5OEhIVnlVZVo1RHBaU0s5N3hxUkNkUUN4bGhuV3QzK1NmZFlJemQv?=
 =?utf-8?B?ajZ0QktPaXdRMVkxTCs5b1Z4M2N4YlRxamVhTWl1YzF6UE54QmhYSndRY3R1?=
 =?utf-8?B?SGNGU3RhQmN6U0pOZmd4UnVrTFVMNUZ3SE4yU094WTRoM2E1NUROeVBDMHFP?=
 =?utf-8?B?dWNNRGs4WHRJOE1HQVAyT1lDaEd4U2pvUkkrOHBrbWRiaWVOeWhYdS91WmxP?=
 =?utf-8?B?eTRCQmlOS0wwVmd5VzcvNHczSWI2R0E0d1k5SkRsYWxBdWMyeFRGYnhOc05l?=
 =?utf-8?B?MDBEWWtiSEVCRGQrdE9vc3dtY0swSThuQkc5d3lSQzBkRmZoL3dPLzZQcHoy?=
 =?utf-8?B?N2h6WVZmT3lQSlRVQXRmb0p3S2hpbENaN0dnTVlUemlLYUUvMUV0M09MTURr?=
 =?utf-8?B?dGxrYTZsdDgxUngvbFArNmkxZHZCQk51R29CTzJzVlhIdzl5SGpYWDlOYThr?=
 =?utf-8?B?UWtUZ0xnOStqUWFpUEdMd1NwNWFJYThXcnIxTDZhT1N5OFIxeVo5VUh6Zjc5?=
 =?utf-8?B?QTZydmh5Sy9QbWNSZE9hdUQ4MkZtclpiYUhGNUFCV3haOFRnUDZscWxFdmJF?=
 =?utf-8?B?dUlWZTdBQjV6VHJ0OUZ3QS9xdWVCNjJrL3FvTWwzRXJvQWl6Qnd6QmlaS2xJ?=
 =?utf-8?B?c3c2Q2FzdW9vcHR0aDJSa3JBK1lYRUtTSWdTWlUxT1ZUK2RVNmcwem5rZUsy?=
 =?utf-8?B?QTVjNjhLazFVM3pMNzVFSUdRNW9wWVhMWDJZY2U4SmUySU5UL3czN3MwOVZB?=
 =?utf-8?Q?ZKIhW+qToAoDK2j75Dj/1a/hyMSav1LDKQu64?=
X-Exchange-RoutingPolicyChecked: KE5zJhV32jG/LPB/0rHZTjCMRDFm639cYLhuDVzDt6NdaH3WM8XWOVWkbiGFTvbf88lgQ51beoJ9OuGp0ilfPX8385neK+2Vn7KXW70+WGL6LaB0LrIyxE6NM1AUXpGb2eG2nIRk2RWHIZvtP6LFGhgHHDHh9OwQTPjxB57fKJQHNlVBfu16d5q//out169yqq5KpiL2MYKr5x4ixebgY1ZaA/OrPLaaJ+RkFZFE98hPAWJ7QECicV4D6MeWloHBWSZTysWrfykz1qPHP1wANAhPaGnKjbIpYoQBE1pGdhY4xZU7KDDn6Cqq2zlItO/RLmgcqJDOnD3fA+0EUBU0ew==
X-MS-Exchange-CrossTenant-Network-Message-Id: c5471ac1-49ce-48fb-35d2-08df1f931b71
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:07:59.3488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4kkc3wIiEtOf+tvhYfztmP3eUNNdmuaMSvMhh7FMgYM8JSwXZstYRmJ6lW9s2PBdPTCx2mAQBX+JpmyOjua8d/Zxs0HfM1C40NLeGE39ft2b+w3nF5oeSzdOWlMkVQW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6409
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


On 11-09-2026 20:33, Kamil Konieczny wrote:
> Hi Ravi,
> On 2026-09-03 at 13:03:32 +0530, Ravi Kishore Koppuravuri wrote:
>> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
>> injection to verify the Xe driver error handling and recovery flows with
>> the help of DRM Netlink API suite
>>
>> Cc: Purkait Soham <soham.purkait@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>> Cc: Jadav Raag <raag.jadav@intel.com>
>> Cc: Nilawar Badal <badal.nilawar@intel.com>
>> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v4:
>>    - Added Steer Semaphore for disabling and enabling multicast
>>      operation(soham)
>>    - Increased device recovery check timeout from 5secs to 10secs
>>    - Used updated library names with igt_drm_netlink_* prefix (Nikula
>>      Jani & Kamil)
>> ---
>>   tests/intel/xe_err_injection.c | 342 +++++++++++++++++++++++++++++++++
>>   tests/intel/xe_err_injection.h |  31 +++
>>   tests/meson.build              |   1 +
>>   3 files changed, 374 insertions(+)
>>   create mode 100644 tests/intel/xe_err_injection.c
>>   create mode 100644 tests/intel/xe_err_injection.h
>>
>> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
>> new file mode 100644
>> index 000000000..683994d1c
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.c
>> @@ -0,0 +1,342 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: MMIO based Error Injection
>> + * Category: RAS
>> + * Mega feature: Telemetry
>> + * Sub-category: Driver
>> + * Test category: Error Injection
>> + */
>> +
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <time.h>
>> +#include <fcntl.h>
> Keep it sorted, so fcntl.h should be first.
>
>
>
> Regards,
> Kamil
I will update Kamil. Thanks
>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "lib/igt_drm_netlink.h"
>> +#include "lib/intel_reg.h"
>> +#include "lib/intel_compute.h"
>> +
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_mmio.h"
>> +#include "xe/xe_query.h"
>> +#include "xe_err_injection.h"
>> +
> [cut]
