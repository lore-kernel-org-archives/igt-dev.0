Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C70CD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 18:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389B110EE37;
	Thu, 18 Jun 2026 18:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVJqDiIX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A7710EE37
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 18:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781805757; x=1813341757;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=60P+8wPUCtuDziKLwtCM2evIyaVCYaGPEmSEnmKdFec=;
 b=MVJqDiIXUOysMNSh4lux4Y4A5rDeKPzFBpUsvwExqnjNNwEy/7BzuFX9
 j1E3n3kdEzwmWl+Ym/1iLMQzQuEj8jnmxQuIaWWuGv12Vs3efTygxudFz
 cqg7ZkeFyxaUvarwscP5y/9WYPeVEAuoFx2/nBfiZ0x2R7taCwDwJcz+C
 wiiO0V+yqxYJRZu7t1YF8YCtkf5uL0qIoQcbuf/28AoLWUzj0SGg9R24Z
 FZIZVGKy7rQ5KJVkiS7CXV9jCuOml5uJMm0tzOTp/5CLvQfnQNOBJzd/n
 ihiHXoMfTvyVVUpsPpxklVvRgNQbeWuXsE+8el2dnySy6WPADZrBayW7X g==;
X-CSE-ConnectionGUID: VtFbTBgdQIq4If9e1KsqrA==
X-CSE-MsgGUID: 8ahVzUrlTLKbyWpM14BM1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="85209083"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="85209083"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:02:36 -0700
X-CSE-ConnectionGUID: OCNZxe57QTafDlEGpnkYeA==
X-CSE-MsgGUID: 80X+yKqSThGK5K8thXUGZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="247552804"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:02:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 11:02:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 11:02:35 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 11:02:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzIlDqycJ6VSgAvpktS++ZP30Qqkw9ijNrM1uBPdf4VVWKuYQSgK9xglVv4v41CuL083jfLzCtvcomVhTSDBi3DQrQACiq7I+uylW3nGkWuG+1Qnirthejihp/p09M77j/sVjFEGg03bLsZL86ZH+rIQhS3wCNGOiSgYOB8hBa7J0Qeq21MfHEkJ+xWvILdDVYKcdi9FAuExxKkzHgkVQ1Nmh7vDWuocb/87mx/9NR1XTnB59w8mZAa8jJeAXS7JN4iQvon3MJHv6e0W/QnGMF9YD06LRLdvrbbZtdLRX6cqP9lHYnjPlt8eUeyDnfUV8VVyB/2XzL84PgHC31/iTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLan8unJgQjZegurMWCeWsLe7IlHDfGVlm4XQzGlkWs=;
 b=FxYYZrsGS7tx8fbwxrWNplkjMUAyC0X3qrxFbdv5jd2qG6qC8N19B2hiEZsjf+F1tem62pWe9OMeaNoWVIUHoPK/LzPTKMNCpCJwmLZ7j7G3CNJUBgZSErnapw8Co3jE2MtTsyrZh+DjNKW4ZQwqDj0/+yVFUkPMsGmXtp28sOaetv/Lz5jCPe1U64bnbIKxSfkP6jPk9uEQylVmpiaTyp3sOg8kT4OC21krMlqB+ACEVByXCz2NISt9kLDL5nzZ66vxB5lOfz4SDeK8hAIrWV9FQjTRRfdLHjvTUuZO8+0fK4dvLz4skugogcnn1jz6Wx+MEKtWJQVC1IaCq+P+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MW4PR11MB6572.namprd11.prod.outlook.com (2603:10b6:303:1ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 18:02:31 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 18:02:30 +0000
Message-ID: <b16bd582-c1bd-47a1-a23e-5ca06d29be2e@intel.com>
Date: Thu, 18 Jun 2026 23:32:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_dsc: Ensure non-joiner modes on
 non-joiner subtests
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260618043055.2998900-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260618043055.2998900-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0220.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::16) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MW4PR11MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: bd9665c6-6a49-42be-8361-08decd63c39c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|3023799007|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: J2tix0bdi+5RzvK6c8Zfd1XD0lJYAKCmawyOlCpaCzIbLbrh0DqoYUfl+bffmjpjI8bL5AhkjZ4ir4HbvnuoEaPcCDjMiUYqyI7Wc+OUmzYxlH4+y24DN5AjYzj5EhDVowF8ikWt7WpWri+qMGUGA0QTVfoebYnAdM6CflR+9sDm26pPVpK5//AOip99cMjZPVEqFbMXqQHQfBVJQhHVWiVXeIxolFwK8USS41vSpWLTRJjk0NQR0IZrMO2EfZXxHOqAx27leSfZx5O69cNGF0sM0gUy9mv5Sj5YXznBRsZ/vS6QTrA3M0qq5/IeCUQmUE2qMZonwlrn1HD8c1ZG1UvrCdBncmby07h0zwKQ9V/If3Te12tl6dL2kxMMoIg64jSvZNJ1Ps+80HV1R1VVARBrsnuRRc0r3ysLgA34kFqKMCxlfWFJli10c3uzLr07DEUAWoZPVpZ7qgUMw5/y3kz4Q/H74Cd+uAyMOxLsaiuxmsczsdw8B/UJIyNjSBR1VIOEfPx8bvfnWp07kGRLAQKsgDDQjj4DfYTOeHlZW7Hv0XVLGpCc5XoMEZN8r8zD1t3zpu7I6YizIpGt8TYoA/io9DlQ3ezB8BjHERxvwaAXu4t1gtPHgOsGcn+GMNGpVQpwVZJWigJD1hLZP13xGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(3023799007)(5023799004)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1Z6di9QZDJ1SFV5VndJZnlKNHY5MjNtMHR1VTlWRDk4VnZ4dnlMdGJQTUIz?=
 =?utf-8?B?MlcrN3NkZTROd01DMkRiQUtDcnBkOVB6NVdLZFNtL3BwT2M4RUdGQVJIU2Vi?=
 =?utf-8?B?TS8wRWdvckcwdFQvaThXUlV4WEk0TVMyZmQ1Y0NjbmtlQkNaSEd3RW15bjJB?=
 =?utf-8?B?cTdQM1BUbmNlQ1lsbWZrdTBvcU9Ga2FHV2V4NFcwSXZDckVwSStHU2pleXFD?=
 =?utf-8?B?c3hFWTBCdHo0T0xxbmJuT0VYYVdVeTBMRFBCQmRPMTJTUWh4dDRlUldMUU9k?=
 =?utf-8?B?MDN4T0djd3c1YlpKeWdrUVJxaHVmbkpLYUc3YUNmK3V1N29ONmtCSmtveFpz?=
 =?utf-8?B?RTFvQTFabGVmUmZoQk9jSE5sYzZrRDNCWlp3S2N1aDhERGtLbXpSZUZLWW53?=
 =?utf-8?B?UlZGM1FTWDJwS2w4Rk5ZUlFhQXhSM0FqS1ZDVHhGRHlLYmErUTRGSGdVMXBy?=
 =?utf-8?B?Z01hT0tUa2t1Z3FHY2ZFcVN4Nmcya2hMMWdZdmZUV3RtaE5NekhxUkVJYVFu?=
 =?utf-8?B?RnRGbXBySW9HRkR2WjZRS3lmK2ExcXBRYVJuczZKSlc2UHVUZHZKbmRtMFl2?=
 =?utf-8?B?YjV1bks0TFZTVURhRytuU01Gb3FhUlp6MFJMZHc5UDZMQS9tUmkyWHlRbWVm?=
 =?utf-8?B?OU9UdFV2ZURmcitnQ1M3UU9pM3Bmell4MzNub1FJRTBFVU45ME5xalpRYU0x?=
 =?utf-8?B?SERZWmtTNDNnaW9OWlRmbTl5dU1GTGsrQ0FHWGxZdERWYzVhRS9YazAwd0l3?=
 =?utf-8?B?c29QZlpGWWxhYkNuSEUzOUlsL3VEb2Y2WjVOV1pUYlkrODdHWjFIYzlSUUhr?=
 =?utf-8?B?YTZkTEkrTWVEV3h0Rm5vV3hVNlhHQTlvek5ZSzJuaXh1ZzBmUGdGZk1kcThw?=
 =?utf-8?B?WUFMNkNaZW8rMVpWL3VMeXl2c2tXMUJ2Yzg4dHlhTHhsWWlBb0d6WDcwYVhS?=
 =?utf-8?B?QjMxb1NmdWtHOVNiN1F3NHFYUTN4TXlvSWV1cWZFSXJ4S0RwMFc0OGQ2Y1VB?=
 =?utf-8?B?dFlpbHZ5YnRTNDJ3cnpXckhoT0NwQjIyNzBHWU5Kek5TSnpsU1JNd2d0dDNP?=
 =?utf-8?B?Tm1Wc2diTFhOcEVsY0VmaHpJR3FUU3ZEN3pCMVFUVzRXbVZFM2puNWJLMkxS?=
 =?utf-8?B?b0oxczFtU2g3NWl3cXk4ZURGN2gzL05xZkZBUE15cldROVJwS2FHbUJRMk1r?=
 =?utf-8?B?VHBRdThCUFFPajlVOTdkNTY4QXl5VnF3ZTE1TXZXVUo2UlFZSndlYytSZTU2?=
 =?utf-8?B?bE9jc1BmYWV0VlBhWkljK0M1dzB3ejdPV3I2d0tteEE2OEFyTkdKcW1HRUxR?=
 =?utf-8?B?VHArWTRzS2JDcEkvSzJwMURNeGhyWWZtSzZZaHM3cWFPMThKZk1wSkR5b1hJ?=
 =?utf-8?B?NEhJL09ma2JlcWFqOHRzWm44L1VzWFZtUjUrY3lJWTZMS0JBc0hLVTlsTENK?=
 =?utf-8?B?VVFseUVhR0NIeGNTbXBtSlZ3UDl2U3hST1hVRDRjcklxMjc3ZjRNeGd5Vldr?=
 =?utf-8?B?d25DQkduZEtobmRTSTlGdjQ4SFRMREJObkxmWHlnc1lPc3hOWTNDLzhNSFNJ?=
 =?utf-8?B?b3BWOXBMTVJnMFBmN3R0NkYxYzNOUmRxZW96a3c4S0ZNSlpkRWlEc1p6WTdR?=
 =?utf-8?B?bXIzMWRyUmt2Q3dWdUNLQ0M3WEdIdnVkMDdQa25ybFdKZ2Z3YlRCVWtSSjla?=
 =?utf-8?B?K3FGR1c1dk9mNElTOUlTV2d3Q2FsZjJ1MXFnUVkvOWZLM2ViZTBLWDhmekxK?=
 =?utf-8?B?NFNJUHNFQy9uVlVhYW4yVUJCaU1ZSFJJblZ4dGRPZ21RZEdYWFlTMSs0ckgz?=
 =?utf-8?B?L1ZmWFVNQzJEUHVKT0xOa2xsaGNHazZ1VDJKQ2lvaFJnbERMNExkVG1ORzcx?=
 =?utf-8?B?amtjSW9teWR5d0ZVajB0d1lCdG1nZWphY0xzZUdIRytPakY5R09TK2ZOb1Qx?=
 =?utf-8?B?dFZ2NDBEQk1ZZy9NSlN5b093Wlo4NC9VQ1pBRTFkbmZDZ1RLRnRiaEVxOEFw?=
 =?utf-8?B?SUtOTnBGUGRkTmR1dHM4Z3lCR3EvUUpydVhxM0VrSUdGK0xLS1ZocmxWWTRz?=
 =?utf-8?B?Q0h2YTFFYTE2bzBuOXRLRFFVTVBrMnF4WXdPQWlIRzE1djcwU3BheWowUG1s?=
 =?utf-8?B?VVhtYTVmbEF1V1ZxdlpyM2JPWjdLQXNzYng5M3ljRjZsVk5vakh4bUdsV2dV?=
 =?utf-8?B?ZmZmU04xZENPNlo1WGJiL3lwakFKS0xYZ00xV0JXRjlrOGNPUjBCd1AveDJR?=
 =?utf-8?B?V3pFTG5rZ21LZDFSMmNDTXo2cGYwbTJkQVp1SWdJcXI5cVd2Vi9BZW5QODIv?=
 =?utf-8?B?aGlNTVdWQjdyYlNkU0xXZ3hodytraE9qN0ZISC9pbXdjOFh0UnVkdz09?=
X-Exchange-RoutingPolicyChecked: J0/KutLqjADosSZBhV6Kn4U/vuYBNWGaF70VbeMtq3Yti0qdxBmQerR7Y3AP7JOoKylgUABXovc0E9yQPd5hfbJm6rkXGpRFi4f24WWHINyvS8GSt4mlRWVW3NS8mls/TENRip1CDEr7vyXsGE7iCT/CF6GEiUG93UwTXlFxXpdC9WYFDytyQqv1+vNMSGWh/qGKCXCyK1ykVgzRVikvGXOZ+8NFbqCXtp05SoOc46LR4tnJoMkieOyhtJlWKTv3/HeLbZGlHgUMG7hryhdYZB8nnE/u3zJ9JQdcMI2BFZdPrCT+TfygDif+jnLWUG22epWuyOVYPfOsXs6MI6TXIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9665c6-6a49-42be-8361-08decd63c39c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 18:02:30.4672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CLE3wp9ysiMpnlsQPLxbfFepf5z5gfB4c+QJFqqfq1DNO1AGKR8owEKe4IsahxbGBCvMdLDOTFbvoux5ODwpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6572
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

Hi Karthik,

Please fix the subject.

It should be tests/intel/kms_dsc

Apart from this patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 18-06-2026 10:00 am, Karthik B S wrote:

> Ensure non-joiner subtests always pick non-joiner modes while iterating
> output-format modes. This prevents accidental natural joiner selection
> and avoids failures on the last pipe.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16368
> Fixes: 86679142531b ("tests/intel/kms_dsc: Add force dsc and joiner variants")
>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_dsc.c           | 4 ++++
>   tests/intel/kms_joiner_helper.c | 8 ++++++++
>   tests/intel/kms_joiner_helper.h | 1 +
>   3 files changed, 13 insertions(+)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 3687e795d..8161bf7da 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -251,6 +251,10 @@ static void update_display(data_t *data, uint32_t test_type)
>   		if (data->output_format != DSC_FORMAT_RGB)
>   			mode = get_next_mode(output, index++);
>   
> +		if (mode && data->force_joined_pipes == JOINED_PIPES_DEFAULT &&
> +		    intel_mode_needs_joiner(data->drm_fd, mode))
> +			continue;
> +
>   		if (mode == NULL)
>   			goto reset;
>   
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
> index cd7fe86bf..da0ac7f62 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -225,6 +225,14 @@ bool intel_max_hdisplay_non_joiner_mode_found(int drm_fd, drmModeConnector *conn
>   	return found;
>   }
>   
> +bool intel_mode_needs_joiner(int drm_fd, drmModeModeInfo *mode)
> +{
> +	int max_dotclock = igt_get_max_dotclock(drm_fd);
> +
> +	return igt_bigjoiner_possible(drm_fd, mode, max_dotclock) ||
> +	       igt_ultrajoiner_possible(drm_fd, mode, max_dotclock);
> +}
> +
>   /**
>    * igt_is_joiner_supported_by_source:
>    * @drm_fd: drm file descriptor
> diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
> index 692dab022..a0ab75b2c 100644
> --- a/tests/intel/kms_joiner_helper.h
> +++ b/tests/intel/kms_joiner_helper.h
> @@ -20,6 +20,7 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>   				  uint32_t valid_pipes_mask);
>   bool intel_max_hdisplay_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
>   					      int max_dotclock, drmModeModeInfo *mode);
> +bool intel_mode_needs_joiner(int drm_fd, drmModeModeInfo *mode);
>   bool igt_is_joiner_supported_by_source(int drm_fd, enum joined_pipes joiner_type);
>   const char *igt_get_joined_pipes_name(enum joined_pipes val);
>   
