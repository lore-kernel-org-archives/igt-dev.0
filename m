Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE94CD37AC
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 17:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B201710EFC0;
	Wed, 13 May 2026 17:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UeJDMLCE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F12510EFA5
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778694699; x=1810230699;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=30RPG0V1Yy40BI689TyNhjFekUAsudclTaxUJ7TDcNY=;
 b=UeJDMLCEYvfRYFkFECI2l/UArKeiIXpi1jj3B8ngMxKCkGvlZsf6wJ1q
 d84PwCSCVj8/wxTEsbQqrcVUYgWvNpmO42BxWyXhpCQ1sNUC0J5HWlvcF
 nHOO4Hxk2UP92KgylBGuZFSD3+0J0vAcOVijlNKSJC/B5+R7UQ1PvSgJg
 YnfsLtYTvCllAnzRFPSHrlrYqYY8D/oi46yNh6XIjS27wBJqn50y02i1o
 I4dI8jlvP1CCoQgar1QroXwDlRvKvadnYaeXHTJ1ENjNtI1/cPcJCQt4L
 ZfZH/tP8S+1xHXy2E9QJ59mJ8FCFj95/mA4jxHuopDlCuRdixqJ6oNKCg w==;
X-CSE-ConnectionGUID: OESGspK/RWi7ITLVCG1zaQ==
X-CSE-MsgGUID: 2vYxBbb5Qm6Ga2oblhnfug==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="90205593"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="90205593"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 10:51:38 -0700
X-CSE-ConnectionGUID: mubNoluJS7Oakdyk3UvBJQ==
X-CSE-MsgGUID: uYq7CHFSQOiZq2XTxLdstA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="276254338"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 10:51:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 10:51:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 10:51:37 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 10:51:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lg/esTgEADguWDhOekNAEIsUkwM/IwAi26tYIA+jo2oOm+JGYJTf09wH7NbIBPJWv12ONAHyo1mUv8F0V09mDSqn3tOaNIYKgdCDDbiVaEW3aUt94KFj6YzxBBM/kyWfADr9vUD2E1g07mITZpKX8tLKZna4f3FFOF0j8Ynbg7QIxH6HfISJxjLBanSRQnlP4uhJiCZ/ZsgK7T+frq05qJ1xWujlarL3qolKH47fVnsYtQFjiHdaVCSAfJMXdyiZ1s+Y4A5lNbJ/jPdAvj5GRcIvR3nzx44W12VozWP4x3O/WDWeEjn1yb17rXfOZ1JYLKhSLws3UuvAF75PDOHKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRdJF1M7XLrcuwtaIub0RUhI8K6w84k4e+LGmpHsGs0=;
 b=WlaTW2QDrpj8OqjBPdhMDev4KQ4yiceeQ0rggdKqI+irFsoi3B8nsoQl533rkRWz420SqItKiiesxH/SBVGsafc+Rs4IgavOo5WqQSQuoITODIaIAzrN0KHBAOeUBg2lCRzTj0iZ+o4bYzwCCGjlBpcscepkTJP1KucHgiLN2il6AIDx+ksrXMI4+C2qI7SxHV6OEU96iIN7O9AkY99wjbzE14R2gQVcejOUhNE1UEcExJq01NTEflZOG29Q/7ZRm24FJLNeAYOGfUYRkGcHVJEj3tXMMkUF9seCeYYrDQeWcAI/5/pHbaNA/x7WTs68EY854AisKnLGbtlRbeG2tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DM4PR11MB7325.namprd11.prod.outlook.com (2603:10b6:8:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 17:51:32 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9891.020; Wed, 13 May 2026
 17:51:31 +0000
Message-ID: <5da4c8d4-26c6-4a57-93f3-46860c88de18@intel.com>
Date: Wed, 13 May 2026 23:21:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][V4] tests/kms_hdr: Add interactive HDR verification to
 static-swap
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <Mark.Broadworth@amd.com>, <vitaly.prosyak@amd.com>,
 <kamil.konieczny@linux.intel.com>, <jani.nikula@intel.com>, Wayne Lin
 <wayne.lin@amd.com>
References: <20260512222245.1767752-1-alex.hung@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260512222245.1767752-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DM4PR11MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: 5522c967-73dc-4306-6aa4-08deb11843d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: 4Z8RQcSHZPt6p3v3Cdf3fVVre8gY9QbESBel7OUlHCJ0jdf5FbEpq7GImk8HvHBNi5PBUHfVP5RqnBShmDKogTYapvbsNWCImebe5PfMYrSj8wWuucF0b5W41Wq4y+U6A224VeeJ2/qHKOzI8H4b4NyQ6Fd85jqa5Si9xIYq5QgFgO4w/nBJFHphjYSxukPvzDqvM9uAcDblv5GiFnrjJcLycWe/PihLuuxlG1e447Bj2b25PEmDBijNxH4XwFQrpRQlDG2nDPTtHkDo5QJU7logpx1kEEZyTQzOdciuHKpgQhaiSRraqfx0MbNCOEhsPJko5/QhYkynOUK0SAv2+xoZaLsMhY7fFwHEhLU8HiK+HNOVNfM66pnQnh1STfb+0BKWvpKO08vav0jHmfzW3JEV50snLxfaxUsIZUFAgsV5zEoxSF21GwrK5powYDbgBG7MAuOCTUwhIDHSlaP3V/O+5WL8h4ppMWYbaTahZKDzte6KMCtCdS5WVaenH5JRW+w/A/QUpdMVbjeMB5FlVD/RfmjV1XIqSXzKL+1wYYh6cfl/yhjrsI9a7SC1S1W1BBPm3yx97rR4iBxV3UiogtFTggiIFhF8U4l6cgiGZtVMHbNmMTPW4swoiTf0X7F1glPps2S7FZV4QoE+lQKQsElBJoLuDsQktuJG3a+abYJANTT2D6v+xY/MZAXyIP1R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(3023799003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUh4RzBKNWVqUm1YUlU5ZEJjNXIvT2xpNFNHM3ZNczlOOVBLS0FJc1pRSVF1?=
 =?utf-8?B?MTlTWmFMWVEwV2ZiZS9IL0NIek1mNk9keFBCZVg0YzYyQ1RzaHBiSmJUemNm?=
 =?utf-8?B?N0JpVDYzT1hOQTVDQ2hJK1k4cUdabk9Yd1NtM2N1QjQzMEh5eXlzNExpcG9r?=
 =?utf-8?B?T2hKYjNsMkxQQ28xLzVkbUVaZWFrUFlOTVdDdlhKbzVyc3A3bFE1dTFHQTBX?=
 =?utf-8?B?bHFQeVVFYUhLVjBZdWxCZlorYTI2cWgrTnhuRXNPQ0NBR2QwNm5JM1M5WWZz?=
 =?utf-8?B?NUlBa2NMOEVsUDUwakpsdVloT2c3SlVQalFEYVBESGt0MXV2RkRwd1Zmc0hl?=
 =?utf-8?B?b0trREJXTmIxR055OWFnMVRDbVBHaTByZWFXQmFqUFllNm8wQWRGSDVqL3RR?=
 =?utf-8?B?ZEZTVFZSbFpPQnBKTW1wTjFSYURtam1pdFRlR3JvVlFkcGlDT1kyMGtIL2lR?=
 =?utf-8?B?Vkt3ajRweUdUTTMvQlVVcGd1bWtxeGhkZVZxcTU2RFZHSkFCK2ZaZGZmM0d3?=
 =?utf-8?B?dVo5K0s5ODQwREhIY1JmNGdYalczUEV0VGovRURoQmw2NXlYOVJzS3hRNmhC?=
 =?utf-8?B?MFlqNGR1aks2Q0pUM2I5SG81WkJaRzZuYzN4a0VLaHF6ZndFcldzZCsrQTEx?=
 =?utf-8?B?UHVnNWl0THNMSFRQNGVmYkxrNks3U3BVaG51ME5mejVLTzdsSnFiS2RnQzJE?=
 =?utf-8?B?R2ZKb1lJVWlQUnAvU1ZFUmNxUDc2SktJeTB2Y0Uxbmd6QXY4bk9Oc3lkdEdB?=
 =?utf-8?B?NERuRlFnS015dkdwYWptSzg3R1ZBdFptbTJIajhkaldhaEhuSG9oTUFoWE91?=
 =?utf-8?B?YjI0aGsvRmRiTHRoaHRyWTZ1OTV6OGtuK3h1RFNqMDYwVmNINUVqaGhiTjV4?=
 =?utf-8?B?L2pRdTBPTXFwQXdpNFJ5STVyVHhJd3ZOTVVQK09aeVBmSE5McmltZjh4cUdG?=
 =?utf-8?B?eE5jWDlNOEt2K283WWtJdTdpU2craHFZU0pWVHA1VmZ6VU1WZ0JZcHZRUHJR?=
 =?utf-8?B?S29XU0h6WXFBTnRVMEw4TzQwemNUay9keTNXOCtkYmcyNk1CZXlLaEM0Vi9x?=
 =?utf-8?B?NGdjNmtxYm43bStUM2NUeHI2SDZiRktVcWdvUjFEUCtVS1NWUjhua3FFUWEx?=
 =?utf-8?B?cm45S3dDVDRDb0JxaUN5YlF1VFZJeVZLazlQR3Rja2psMjlmU0dLbnF0SXha?=
 =?utf-8?B?MnRVVXBGUDhVTktVNnhpMStDeFd1VTF0bFl5Z0VKR2ZsdC9aZ2szTURHNXp4?=
 =?utf-8?B?ZlFMTUlZMjl0QTZLMnlFZ1I1aGVXYlkrb2czaGZHY3ZQa2JsZmRVVzFueEhx?=
 =?utf-8?B?czFnR1VWc1VpL2E0NTZzUThmWFFqT1pxVXh3ZDN0UFhKSFpLaHFWbWJvRlpu?=
 =?utf-8?B?ZmFpSmlUT1FyVTRpSEE0cDJtaE41K1J4eXBIZm44WHJXT2FydUd6NGdqakIr?=
 =?utf-8?B?VFJqOCtGU1Zyckpsb25DMC9SQWFhUzMzSkNhSmdGb0lNU01hNWtXK1VFQ016?=
 =?utf-8?B?ZzNFUkdxMk5zcVZRUk55ZFp0OVZaSGJpWkVjeml6ZmpSb2poa3U4TUU4L0ZD?=
 =?utf-8?B?Z3Q4M0lBMW04YW1IbE9mUTJ6cjFkYTBuRjhIMlFVT0NKa2hhUEpoUlcyMkcz?=
 =?utf-8?B?QnlyYnp5MUExdnpqQmxWWHpId29scE5qMmZZekhNZ0xtbXRHaithNXc4TWVp?=
 =?utf-8?B?YlgvOTdkT1JHM0JZclNPWWpZL05LLzRpNzZ1QXZxRVYwY2RvYU1LazNFaVI1?=
 =?utf-8?B?MEszeERJTzJtWnpRV2dhL2VRQWw2MEF5cHMwWGdRWmk3aiszUU1ROGlZbzlG?=
 =?utf-8?B?Y1lYN1oxanpQYXdabGljQlY2WFVUdXhNek9WbVNoUEtsY0NmT0hxbzRRNUcy?=
 =?utf-8?B?NWxBa3R0ekZhUkR3d01QVjdGMzhWdFh0Q1RoNHZjdnNoMzMreEFGWGJkV3pr?=
 =?utf-8?B?SzYwMmt3OFM3QWw5ZXBWdXZOV0YvaENmR3R3VDcxYTVQZWpYQzBsUWRsY2xO?=
 =?utf-8?B?TEVteDNsbXlhR1oxbTNLbXExNnkzaFdOcEhlcWVPM0hSeEZpWjRqeHc0N0U3?=
 =?utf-8?B?YmkwMlRod010dDdwWWhJaG5naVhLNWkzU05LMU9MUTlCWFZaTEJxVUxDdUZ6?=
 =?utf-8?B?Si9lRlZmdm84ZUlTYndxMTN1QWdXeGVTaFZla1NKcEhNTW5WREk1MWlvMGdJ?=
 =?utf-8?B?V2VNOTFDZVZ2V3dYOGFlSWovNlZwZ1ViZzlyTkpiVVhRZWF4WSs1NTRYeWtB?=
 =?utf-8?B?dGhyN3MwSXFOU3lpYWNMc2l1Si91UkVMb2dhUkpSekRpS2NJcEpEVzRMVHpE?=
 =?utf-8?B?M3NBY2UyNU04OWRxQ1dNNTMxSDhpYlhTWG8rTzQ1bk8xMStZVUJ6dz09?=
X-Exchange-RoutingPolicyChecked: kQyETGhWekicYtyukgiCKO52gwl4vzcpztkbAs1RMhO4/PHqlBx08ryeDAYlvwsL0xHIZAKlzLS1voqZCvHO2HDqEc8UI1mTZe8EqwzW3sOBC86eVQHd8BryawsiKJk46PtT/HgigpwLLAP/ylGBz9HqnaMKAh4uBEU0a6+p93ShDqDGEcyxRQ/LUMxXywy/OKui8G+qu1aXwWKznhfSUhRq3vnI3jnxR4ppYygcDI4i/ZKUfHOxdy5/sHssPY56NDSBVsR7WEf/jlehz8/NDUWeHdTMBhiEGRRKoy4LpgE0rTy9BylDL3Ws/4D/BQ+Ahk8BWD/EidNo9ziCLueC4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5522c967-73dc-4306-6aa4-08deb11843d7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 17:51:31.4175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIE1CAC55yRKoGGVwif9M7JA/sMf1TJ3Nb+7NPHnWvj8A/lKwLJkT2qe3wz6/T7NamWYO+qm6QIX03asqQLcBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7325
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

Hi Alex

On 13-05-2026 03:52 am, Alex Hung wrote:
> From: Wayne Lin <wayne.lin@amd.com>
>
> Add smpte2084 and traditional-sdr with igt_debug_interactive_mode_check()
> checks in test_static_swap(). These checks are CI-safe (no-op without
> --interactive-debug) and provide a Y/n prompt when run interactively:
>
>    kms_hdr --run-subtest static-swap --interactive-debug=smpte2084
>    kms_hdr --run-subtest static-swap --interactive-debug=traditional-sdr
>
> The HDR metadata probe in test_hdr() failed with EINVAL because it attempted
> to commit metadata without a scanout buffer present. Fix the probe to create
> a minimal framebuffer and use DRM_MODE_ATOMIC_TEST_ONLY to validate the
> commit without modifying hardware state. The framebuffer is freed immediately
> after and the display state is reset, so the actual subtest starts from the
> same clean slate as before.

Please split into 2 patches.

1. interactive debug

2. other change

>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
> Assisted-by: Copilot:Claude-Sonnet-4.6
> ---
>   tests/kms_hdr.c | 35 ++++++++++++++++++++++++++---------
>   1 file changed, 26 insertions(+), 9 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index d50f87787..affd38887 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -454,6 +454,8 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   	igt_assert_output_bpc_equal(crtc,
>   				    data->output, 10);
> +	igt_debug_interactive_mode_check("smpte2084",
> +					 "HDR pattern displayed with SMPTE ST 2084 metadata");
>
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
>
> @@ -483,6 +485,8 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>   		igt_display_commit_atomic(display, 0, NULL);
>   	else
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_debug_interactive_mode_check("traditional-sdr",
> +					 "SDR pattern displayed with traditional SDR metadata");
>
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
>
> @@ -571,16 +575,33 @@ static void test_hdr(data_t *data, uint32_t flags)
>   							      "non-internal panel.\n",
>   							      igt_output_name(output));
>
> -					/* Signal HDR requirement via metadata */
> +					/* Signal HDR requirement via metadata.
> +					 * A framebuffer must be present for the driver to accept
> +					 * a metadata commit. Use TEST_ONLY so hardware state is
> +					 * unchanged.
> +					 */
> +					igt_create_fb(data->fd,
> +						      data->w, data->h,
> +						      hdr_test_formats[i],
> +						      DRM_FORMAT_MOD_LINEAR,
> +						      &data->afb);
> +					igt_plane_set_fb(data->primary, &data->afb);
> +					igt_plane_set_size(data->primary, data->w, data->h);
> +					igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>   					igt_hdr_fill_st2084(&hdr);
>   					igt_hdr_set_metadata(data->output, &hdr);
> -					igt_require_f(!igt_display_try_commit2(display,
> -									       display->is_atomic ?
> -									       COMMIT_ATOMIC :
> -									       COMMIT_LEGACY),
> +					igt_require_f(!igt_display_try_commit_atomic(display,
> +										     DRM_MODE_ATOMIC_TEST_ONLY |
> +										     DRM_MODE_ATOMIC_ALLOW_MODESET,
> +										     NULL),
>   						      "%s: Couldn't set HDR metadata\n",
>   						      igt_output_name(output));
>
> +					/* Reset IGT display state; hardware was not changed. */
> +					igt_hdr_set_metadata(data->output, NULL);
> +					igt_plane_set_fb(data->primary, NULL);
> +					igt_remove_fb(data->fd, &data->afb);
> +
>   					igt_require_f(!is_intel_device(data->fd) ||
>   						      igt_max_bpc_constraint(display, crtc, output, 10),
>   						      "%s: No suitable mode found to use 10 bpc.\n",
> @@ -591,10 +612,6 @@ static void test_hdr(data_t *data, uint32_t flags)
>   					else
>   						flags &= ~TEST_NEEDS_DSC;
>
> -					igt_hdr_set_metadata(data->output, NULL);
> -					igt_display_commit2(display, display->is_atomic ?
> -							    COMMIT_ATOMIC : COMMIT_LEGACY);
> -
>   					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
>   						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>   						test_static_toggle(data,
> --
> 2.43.0
>
