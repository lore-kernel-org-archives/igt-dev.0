Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F224C5B572
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 13:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDDB10F358;
	Thu, 13 Aug 2026 13:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DkkmB37E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166AD10F358
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 13:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786629551; x=1818165551;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SpgCHfI/JRo/K9sR8bU7SPm0+keRh6+aupdgyXMBCdo=;
 b=DkkmB37Es50jhZRefhekDG7FQ8WrFAf9qFISQy9G9g0DA/fKotT4b0Ch
 ujXcMZwFTKgU5xrEHjGia0hSBsmTSoR2MeLBSAiCTG/HAaAH1v+QClaY2
 Zu0nVyDUVuzkQ9wXK1OECxpkpaU9CqrqHOB1KJ5Z8ExjOSvWVICLB+59T
 WBrfX26at3WDRs69QpZoLylLapDRVSH1dfZr6S7vaY7prdxtXYyPTVA7Y
 ZZz8g1RLeFJ2uPVCCedtPTgPah+wpbWrMVu6ZMieQizCMvy5Q/hK0tgS+
 AUW0POQIjEWLWBVhld8rNIUL4l42sPj/H7rVmYV8ewLJPC/dz67GiWwIr w==;
X-CSE-ConnectionGUID: 1rsmK3NUQKOBrMCYUYeT5g==
X-CSE-MsgGUID: ypvcAd6ISlyJSfvH2cUnWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="91014963"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="91014963"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:59:05 -0700
X-CSE-ConnectionGUID: g59XdHsmR3GN8B6nE8lTIg==
X-CSE-MsgGUID: Zm/6hXEJT9SCYp660Pi9Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="264529596"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:59:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:59:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 06:59:04 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:59:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWcVHspmb7anjqPr+P6WZ/kjwwWe8K0yqb96GhgqV0Dh23E5GH9FahgfhtcPY21O7vvbuCIdvhZg0Z/jjBu0Ki9WInyW8rgnzStbM7HOvqhRdZg9kTmwi6nN87fSF5COkhHN+GcHT3j8d1QrUYYnQFt1hebXb795fYekGeBfqRQtOcoDlqZAr3Fiephgg2udgE9IJkvSgLd3odyYsRWkwgLoiBK7ZOfSSOm5pqb9RLWDE+iwKs5tG3j3J+VeFrRLvEtFgP4SbUeOzgRSVtt96jWnl8DFw7WA1f9Jilw7/3NHu3JKk/W1Y/lK41U9Qi5aCAP7fMfkhMWIWqu4au2wXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMQYK4dL72ff10GdFNFDAIDUKleOleCYF3e6N0iSdno=;
 b=QrOWU7OWndso7Bc/D1FCS6oMqLyu3njPj0plenogz0Swa8pEp6TDyb19pWGmrEOvbYSgFf5PRVhwJfb42kjShaa9gzl5X8l3p/M2qCQNJkGo9kt4vWo+pC2ZBA6PwC0swsGhXvsgogjbAlzgv1OTTSEhU/8nmNem0hoW1JfnoLegx3t754OpJxDmh9AYSs4yB7o+ZkDGRNlnWkXxu8SRGA60PVc176+EWopPy9HgYRo93/vWOAHdigNG1pANRXZLZsG/xtdjoRuqEo7ARHbd7bHNzB70bXuemulf19bz5pWr99ifTVMzgM4nEl1WhgxTk/O99yh3hhbbtR5baIpWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 13:59:00 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 13:58:59 +0000
Message-ID: <18daac17-71f9-4bb3-b173-555e3d8fce81@intel.com>
Date: Thu, 13 Aug 2026 19:28:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/6] tests/kms_colorop_helper: Add FIXED_MATRIX
 colorop support
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260806120345.19406-1-swati2.sharma@intel.com>
 <20260806120345.19406-4-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260806120345.19406-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::17) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|LV8PR11MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ef119b-463e-4235-606a-08def9430623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: g2pJA3Qx+8oB3KDmDaaQlVLtJc7PQnW9+JGbqYj1XbK0wCT7MB3aZeoyPwszerU04OrqD2P2HGxr48+Hw8Pr5oslCoo9RMIpeKpUwtEUOeEhtGFn0T3E5t1M+jkMPNvcfmdcWk+vhFwDINzVVKg1sklxCpMpqGQq3zXjWDYwzmvHkuZjfvQFbEIOY43zi6ybf8eBI46PJroQbtexHVKZqyBwsgByt2HBm5qlYVVEUXYfBfevDImF0WY9/TuRRAvOp91x36PPaV3TXUI2b6GLDDr0RTe5TAhT8Q8uxGLJrzGHYpkdGIxCtUgQ3mFsu+SKaRoQsCwNxYUpzWBLv2UJSxeb2MhH620FlMte8KYaza0TbwdZtmLT/m7O3sOaukSXYTZUk1AG0YSIKZ0ieBUE29vtXiZ7kzMs5KBXDr+KHSWEykyW6RXI3i/x1rfsYlsmagIe+w/SvWIXa6dhmE1+yH3lrPUsQ/hOo51Bt6Qbwd3zjzfu4+W5CPU2F6BXZbZb2BzUt5ZeXZHrFlRHIx1juVGgZAm2EKL+OQyLaO/SY7CUEuX8gNueB8owUVKS15rT8awvhRH69rB9UevNm7XwZkYqBcTvf8fY6jrrTd2K+jI9K9ePmWu73BFBhkWWVF+DUtTeiiwXKPTMsoWUFf0xmDBzcf4GoVu56jX32efbGmw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTZXeXRWWDVSQ3FpanlrREJlbXlIbjFRc0dyclNXZTNaZVhwVDI0Wi9xcXI0?=
 =?utf-8?B?MVlEZzF5NkkvTWhmcWcyZUZlTlRPZUNSMTJ1NjBmY1hJamdaTVM2blFmTlVZ?=
 =?utf-8?B?c0dlVDhwZGRiRkEybHBNdjdhQTBzRzZUQmdWRis5WlRQN1ByNGh1anBZTmtQ?=
 =?utf-8?B?NFRJSFFPblFLK2hNeE81dVFxOHlUNENuMzlHVHNIZy9tMll2S0NLVWJPdWx0?=
 =?utf-8?B?UWhIWTMxNng2VEw1c2w1V2U4NWVzM0JDZlU3dWY3QnNwUzNnME1ndWUrTHVH?=
 =?utf-8?B?UmFLYkpZK0tUNEdyUVRvd3d4YlBIUlRna3c2QUI3ZnR5ZkxtT1FrcUVrdHVi?=
 =?utf-8?B?YVo1emN2aXovSGR5ZE9Idm5RL2YydlNXS0xERzBTeXRtbFNBb2VFUDNpR0pK?=
 =?utf-8?B?Ly8rd1ZvejZEaXJhaGZYVjR3RDk3dXMxd2RzSlpXQjRWMFFVeWxQVWJVNll1?=
 =?utf-8?B?TUdUd1hVanVEUHdjcnUzNDU2YlhlKzVWOW01ZUozY2VTV3hPM2dxN3ZGcXdy?=
 =?utf-8?B?U1VzM3gwaUlsQkZyTXJBcE9XSTlCYjZzZnhJeHpTNFVmNUpCMk9OenMvSkdy?=
 =?utf-8?B?ZitRNUhFeE1JVmpUcnIxZGdUNHdVZWV1V2RSRFduY3M4eWI5NGlxa3pJZGtV?=
 =?utf-8?B?ck5yN2RHYTluNldMQTI5U3B3b1FHN1BwQjRjUGd6WjJFTTl5YWFkSHMwREtL?=
 =?utf-8?B?OURvNGdkcFAxNjlXV1FWS2NoS04rYlpUV2t0SC8xUVA2WlBiSUI3QzRGS1Zj?=
 =?utf-8?B?V3k2SEFyS2FDQjRiTFZudVJDUjFIRE80a0xwQ3k3ZUhZcFpGWElaZkUyWGxH?=
 =?utf-8?B?WFlGUTNhK2RTditud0ptSHorUG1kak5yZGg2bHRrblY4aUhoeWlXZWhWRklT?=
 =?utf-8?B?K0lwZXkvZ242bmljVUE3c24yeXdTUTJFNlJXNWdPekhzZElIQkNiU0JUckwr?=
 =?utf-8?B?RXQvd1psQkRad2RySnI0WFZmREYzajhnbGlBRVhqR1ZJTDFqYVF3RVNHdmkr?=
 =?utf-8?B?cWdkOTJZaEhxdmVoU2lRVnBhTytCSVVoWE03Z0JhTFVzT2VTK0tKTjJZYXhF?=
 =?utf-8?B?amJ4UnYyc2JncUZ6djN0Z3VXYjJpR1pUcTBtNkp0UGhPRzM3RXVXZU42WWxY?=
 =?utf-8?B?QjZKRExDK0ZXRkFqaUZiamtOWm14RUhHSmZUZ2orM1RmZEJXeHZNL3E2cUJP?=
 =?utf-8?B?NVRUZk9iMmdtTlpMMmhGQnBldkJpcC9LRUg2aVJlUVdxZzRTWmFLbjJLbGZa?=
 =?utf-8?B?OFFNZlg4a1FjYTV4MXhEVkJ6NjlhTUJITDVTUnJEckt2a1FIc2FNTnh1enly?=
 =?utf-8?B?WDg5ZVp3dUNLVGhSakNEMFYwVHdMMFlEcnk1MWYzcy9zaUtyRzFvZGw0K0Va?=
 =?utf-8?B?K3VKaEJVM1liTFlXZjN5RUJlVGdhaGg2QkpRNllYdUNFc2F6MnlUdFdHZWkw?=
 =?utf-8?B?QjN5SHR0RUtoeGZ3d2Y4eE9VUFJpU25ZK3pTU1o1aGh0aDB3d0dhUDREUzVp?=
 =?utf-8?B?anVUVkJtaWdnaElVbXdGSnhtRmlYSDRlMjBwOTlaN2QyMGk1TjhUN1dtQXBq?=
 =?utf-8?B?a0xHS2Y1YXdRZC9LRVFWN0I5TjdCb29jd1Q1a0JFVkdkMEFnZGpQT3ROaUpt?=
 =?utf-8?B?d2xsY2JIMitJS0dJWFY1ak9jNCtHU1VtU0FSYVM5VjlRaitFTC9kOVg1TW1Y?=
 =?utf-8?B?ZUY1RDBiMk5GR2I1VW5Bak5QMXNFWEg0b2RITG1kMHFqNnF0M1k3RXRPU2h4?=
 =?utf-8?B?Wit1SHdnY1VpdGhySTN0ZGV3YURmYjZyOXRVUUdwWnhIeDlrVGZkQ3Bhbzg0?=
 =?utf-8?B?SCthSkNjRXdtenYwcDB0aDhkdE1DYWZuNnMwc2o2MDZ3Si95UU52cXlqSHVv?=
 =?utf-8?B?UEgxYkpXK3VXTG1DQkFvVkIzZGtXOEplVFlhYUJnZmFCRTFuT3ZnQ1hyenE0?=
 =?utf-8?B?YTdUN1pqaUxha1dpeVlUaCtKclQ0Z083WlppZlN4RWNsd3hVSUdEbGNRdlhi?=
 =?utf-8?B?bExWN3N6cUdvZFl0WlFuWC9IOHlXL0xyY3lieUwrWWJQV1NkMGxVcEpZeEJu?=
 =?utf-8?B?a0k0OFo1WlZic28rcXFuMlZybWRPSHZ5cVdQYlFRWFMwSktKNHl2bVpLa3Jw?=
 =?utf-8?B?K3NYQjNEMHprRXZvaWxhQ3BidDRoazI3bm5KT2JZWExMaVEyK2MrZDNqeEFW?=
 =?utf-8?B?ZVI3NHVUQ2IrNGFQSW5VMHVIdSs0RklBN1pYSUQ1YkV5QmJBRWRzQjRDSUhE?=
 =?utf-8?B?UUp0a0RLaWFJNTVoMFFScEtseTdjQnZDcTlESFZvcDVFRDk5Y1p4anJtcVBJ?=
 =?utf-8?B?dEpkQ011d09CaktXNjFmSE8zaUx1SDgxaDdjMmpuMUlVNE9RakhRd2F0VDR1?=
 =?utf-8?Q?i0RkLcbU7CZa68p0=3D?=
X-Exchange-RoutingPolicyChecked: aauNJU2kR9ctFMgIwbI30Rbk9oNSNJG9HfV+meXyhorj7HTMktTzUPF1Orq9mHMU8JIXEbvjrZKaQWhHzeT8rdwFmQtEAwRwv70fhoTEsdOmlX+1rq87+D47csf+41IUpFkWR3i2OxAwTyrdhr1nxfa5cDARWJ/U3OuBKtusTzc1VLL4ndR8FGpPUPCTEnvbqU/I3/cTjsF69q+DuCXQfWyj9au5gzjY4k7kYQAyumrUc5MQRTlrgfM1jaFw7BqXE+aXkkWecnCqlz4KyrJmmXI0Iwg2ZK76tVIPVKgAN7TMNyDlEIU8ZgJ3hn4kdXxTnnsUM5ddF/cyAqSNTNmKMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ef119b-463e-4235-606a-08def9430623
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 13:58:59.7159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2Hj054JjQfnJwzflZJWiwpmWdvi/Q0l1Dr0Co4S7EvA3VzSK4v6qeboDgjxanrY4cLWsGlrsAxTSkLnkYjH07YBQ7918SypJUnb7ZMhqJ0=
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
> Add KMS_COLOROP_FIXED_MATRIX type and helpers for configuring
> fixed-matrix colorops. The FIXED_MATRIX block selects from predefined
> hardware modes via the FIXED_MATRIX_TYPE enum property rather than
> programmable coefficients.
> 
> Supported FIXED_MATRIX modes:
>    - YCbCr 601 Full to RGB
>    - YCbCr 601 Limited to RGB
>    - YCbCr 709 Full to RGB
>    - YCbCr 709 Limited to RGB
>    - YCbCr 2020 NC Full to RGB
>    - YCbCr 2020 NC Limited to RGB
> 
> Extends can_use_colorop(), set_colorop(), and reset_colorop() to
> handle the new FIXED_MATRIX type, and adds the FIXED_MATRIX enum
> name table.
> 

This patch will need some reconciliation with [1]. Let's take the good 
parts of both. I like the idea of having kms_colorop_fixed_matrix_names 
instead of raw strings.

[1] 
https://lore.kernel.org/igt-dev/20260731180200.668795-4-harry.wentland@amd.com/

> v2: -Naming changes (CSC_FF -> FIXED_MATRIX)
> v3: -Drop YCbCr limited to full and RGB709 to RGB2020 matrices
>       until we have non-IGT userspace that shows their use
>      -Add Limited to RGB variants matching KMD enums
> 
> Assisted-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_colorop_helper.c | 21 +++++++++++++++++++++
>   tests/kms_colorop_helper.h | 21 ++++++++++++++++++++-
>   2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index aaee4e567..f00f6240c 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -200,6 +200,15 @@ kms_colorop_t kms_colorop_3dlut_17_12_rgb = {
>   	.transform = &igt_color_3dlut_17_12_rgb,
>   };
>   
> +const char * const kms_colorop_fixed_matrix_names[KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS] = {
> +	[KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB] = "YCbCr 601 Full to RGB",
> +	[KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB] = "YCbCr 601 Limited to RGB",
> +	[KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB] = "YCbCr 709 Full to RGB",
> +	[KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB] = "YCbCr 709 Limited to RGB",
> +	[KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_FULL_RGB] = "YCbCr 2020 NC Full to RGB",
> +	[KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB] = "YCbCr 2020 NC Limited to RGB",
> +};
> +
>   static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
>   {
>   	switch (desired->type) {
> @@ -218,6 +227,13 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
>   		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
>   	case KMS_COLOROP_LUT3D:
>   		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
> +	case KMS_COLOROP_FIXED_MATRIX:
> +		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_FIXED_MATRIX &&
> +		    igt_colorop_has_prop(colorop, IGT_COLOROP_FIXED_MATRIX_TYPE) &&
> +		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
> +					    kms_colorop_fixed_matrix_names[desired->fixed_matrix_info.fixed_matrix]))
> +			return true;
> +		return false;
>   	default:
>   		return false;
>   	}
> @@ -362,6 +378,10 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
>   
>   		configure_3dlut(display, colorop, lut_size);
>   		break;
> +	case KMS_COLOROP_FIXED_MATRIX:
> +		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
> +					  kms_colorop_fixed_matrix_names[colorop->fixed_matrix_info.fixed_matrix]);
> +		break;
>   	default:
>   		igt_fail(IGT_EXIT_FAILURE);
>   	}
> @@ -416,6 +436,7 @@ static void reset_colorop(kms_colorop_t *colorop)
>   		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, 1);
>   		break;
>   	case KMS_COLOROP_ENUMERATED_LUT1D:
> +	case KMS_COLOROP_FIXED_MATRIX:
>   	default:
>   		return;
>   	}
> diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
> index a081fa02d..08470f6b0 100644
> --- a/tests/kms_colorop_helper.h
> +++ b/tests/kms_colorop_helper.h
> @@ -22,7 +22,8 @@ typedef enum kms_colorop_type {
>   	KMS_COLOROP_CUSTOM_LUT1D,
>   	KMS_COLOROP_CTM_3X4,
>   	KMS_COLOROP_MULTIPLIER,
> -	KMS_COLOROP_LUT3D
> +	KMS_COLOROP_LUT3D,
> +	KMS_COLOROP_FIXED_MATRIX,
>   } kms_colorop_type_t;
>   
>   typedef enum kms_colorop_lut1d_tf {
> @@ -50,6 +51,20 @@ typedef struct kms_colorop_lut3d_info {
>   	enum drm_colorop_lut3d_interpolation_type interpolation;
>   } kms_colorop_lut3d_info_t;
>   
> +typedef enum kms_colorop_fixed_matrix {
> +	KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB,
> +	KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB,
> +	KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB,
> +	KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB,
> +	KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_FULL_RGB,
> +	KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB,
> +	KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS
> +} kms_colorop_fixed_matrix_t;
> +
> +typedef struct kms_colorop_fixed_matrix_info {
> +	kms_colorop_fixed_matrix_t fixed_matrix;
> +} kms_colorop_fixed_matrix_info_t;
> +
>   typedef struct kms_colorop {
>   	kms_colorop_type_t type;
>   
> @@ -61,6 +76,8 @@ typedef struct kms_colorop {
>   		double multiplier;
>   	};
>   
> +	kms_colorop_fixed_matrix_info_t fixed_matrix_info;
> +
>   	kms_colorop_lut3d_info_t lut3d_info;
>   
>   	const char *name;
> @@ -95,6 +112,8 @@ extern kms_colorop_t kms_colorop_multiply_125;
>   extern kms_colorop_t kms_colorop_multiply_inv_125;
>   extern kms_colorop_t kms_colorop_3dlut_17_12_rgb;
>   
> +extern const char * const kms_colorop_fixed_matrix_names[KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS];
> +
>   igt_colorop_t *get_color_pipeline(igt_display_t *display,
>   			          igt_plane_t *plane,
>   				  kms_colorop_t *colorops[]);

