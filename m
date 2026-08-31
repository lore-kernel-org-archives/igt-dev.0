Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585EFC61DE2
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 09:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E758A10E7A9;
	Mon, 31 Aug 2026 09:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NeU+jcqH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D1E10E7A9
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 09:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788168764; x=1819704764;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bkXB0x6iM1LZPhL6qOc+aJzip+B5Jkgc7tKzjtKxCD4=;
 b=NeU+jcqH0ydD1ZfmAiQdUZtBfjYWjACMytlDF5Z+Ns2eNScbxbpjz/PQ
 DOkt+jGZfetwtmfALImFlsctZDZfkopw32cwAyD6WiqNjdkwgl9a4FKsq
 PjGBmlF6S6LrKSY9f/+IHFSjZqsXy3ZPBtE/eV0VW38a5SCWBogGgLewL
 rflz1o6ExZleP1xMQXrELqjI4PR+slGk04S5WOXUK3n+zuTM4xSOGiJg3
 qX0GNvn03GCmYMBWwc1ZV+yw2LfTxN+lV7qwPtJUv75jMs+7BN5WLCM/m
 6nvZ+nGfbQObOgHubCyBNx49rhVdxE7HODfpUjif+pE6+GsTPP9b+FF10 g==;
X-CSE-ConnectionGUID: 2cfa762zS4CQx6oO4hmAuA==
X-CSE-MsgGUID: zvVodg5IRemEPm+tqKypbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92258105"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92258105"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:32:44 -0700
X-CSE-ConnectionGUID: Ss5IqKTiSq2bcjDPrvhSuQ==
X-CSE-MsgGUID: Q9zBeuAuQ/yam30e4UTjKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="262621376"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:32:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:32:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 02:32:43 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:32:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S385yIjtjQUqq/YzDiTMC91mBMQ3vVENEm4wLW6X0kCHPkohjR6E6LKE6OyMzCyfGMphpRdt1dyVcjHf/6NvzjkxRRlqsYPGXUaKA6I+RwtA4AVokwvV0a3J20v8tGWbSCn42bVS3wRbFNeJyD1q3LjDvf9/1yCz/jFi4wezfNybvAFVlv+WdZ7OLJMESMSV+LsnSBL9xRMqDRw08hM4EqZCh11SrZ87vL/ycoOsQ7inywAR/jrcxfG1sc951B9y3bia0P0vqXrQnrTsPH7F1ZL330Ek1auHnOJw3z9aO2DDDH/QWP4kR802LqSQch/PeDMNHP7sMqpjtwvvQ+6vzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7crHVlXb07BwpMK6BzrgXqLJBMrK65X3mJPAVu7atK0=;
 b=mH2SiVf9N8HbJCr8HTLDc4ureip+HKU86XMCzI9XT+QHvTlH7/+SVqGKOJxQBYqb0CZeuJ+kij6C4BpoS36HsS50GlAQVqcDtRE/UXu+cbRkB51cGyIEQjX/sJd+yxc6nnsajebYbBvJqnQBzfLI9zfU+h76QPQXdZh3t68lNDvxt33z5ORVBLDMPQFG4pj92qnMq2PYdHNf5eUmQKDpRCnF6mhCXJTGXJPQ7wwFeHRFfm76G8pan912nQb+64gAosmzYMNeFnmt/viYshghPi4AB/nnt0Wc7ivf0wCHibm3H1kKtTyNZdgBtzh7p1urZykhIX2B0tR1Vj0JIu003g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH7PR11MB7450.namprd11.prod.outlook.com (2603:10b6:510:27e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 09:32:36 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 09:32:29 +0000
Message-ID: <cb93ef82-ae63-4795-8d29-8ac279cb681e@intel.com>
Date: Mon, 31 Aug 2026 15:02:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel: Add mode-rejected-max-dotclock
 subtest to kms_cdclk
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260819073858.185542-1-swati2.sharma@intel.com>
 <20260819073858.185542-2-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260819073858.185542-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0219.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::6) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH7PR11MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f5406b8-ecac-4618-7eb7-08df0742c6c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|3023799007|10067099003|5023799004|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: avQ4I00RbdCkfLX00Zeb0GTAWzIUX1/Lj/re/1PMXMrODEfqAM8GM5plFGCxIaV9Ha2+evDZ7r5gv2o7Jf8imJZ8SB7vJ7u5lnZ9gccQHCl6R1CDOjUXgXNfUDeZ4YoybnaSfzIktxrEXzSvSsgoW4Ot8O1sG+7WcHOnJfLiMTJIJ00zS8U2HqYx99AfhaJPfVAWLFbabMMuPOpv0fw02/5YL1YAZ6kLWAZ3UXJgT1wk5QPyECb3IH0mRoWiwJH4pq/aV9vYYwdFx2Qm36cu3Ug3RshUAmo98FfpCFAaSEuGeZxsM9s/whHuoNVfRB9yoIMQ55s0XjdvOfyuCDKOtdNTKKfLOdEn+ZN6xVFF9dmQcHber4qbVW37OxiqQiKugrEOuBxpFaKt/iVs3DmZ1/IK29CVlIkllRBQbd8oMuNBa02zhR5FqP8UIqdLem3gq4CnXyvOrNdif8BLdgyrBZVoFBwTl9fqoUqUyBvVQP6/PYzWPKseMEcPKWN7SjhkFxbZ0UgPfUjloYiRzDAXdbt2/Qvu3DhTXB8lHFmBvjGEq0GmdTv+D2JMkRctqdLqw3Gb20E22bzbJ3IWR5TZCN/D8Q0/q6mUvAbooc+Id54bs4dkTo9oQ51VgTfaS1IqgXBxDp0ESEOjcwUjOdvBzpm5EXBzIGXQw8v0IPuQNb0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(5023799004)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHpzQVE5OTJxdEhnakhDcDM5L216UVFjVHcvSEFtVnJ1aGc5aXkzczNSeDk4?=
 =?utf-8?B?aW1VZXZndmVLcFl6M2VoUGZBazJhK2lieDhXV3paM1JoR1BBMWhYa1RSVEgy?=
 =?utf-8?B?UGNlUHJDbjh6aXhISEFtdnI2cnRFdVkzNWY4bVZJYlorZnZ1Q2pSSWlKdmlq?=
 =?utf-8?B?WkdKcXdqTTZQVFBxS3NqdnVud21IWml3K3RyNHlNMVYvQTNQUDF0dFdNVnFy?=
 =?utf-8?B?aXg1dlI5ZnRicFlxM1Y0RytDR2tMaHJZOVJSL1V2c3MzcisreFM2aVZOQ0tV?=
 =?utf-8?B?anhUcUp5T2gyVjZlbzdJQjdBemNPZStSTFRVb2JaakczY1RUV2pYbkFWQVJ4?=
 =?utf-8?B?N2llbTNMMEdHUVBvbVVKdHVEWFJ3SUoxY1hPbWVPcThuaWQ4bWdSL1hJTzdT?=
 =?utf-8?B?ZGM1R25Dc3J3VkVNbnNTTm9Jc3dQV1NnV25BR0xsQXVMS2tnQ3NBN1VyaUli?=
 =?utf-8?B?MklXRUdFWTVmVUliMW1HRWlSM0huQkxOVlR4TFMrSnVuZGVxd3VFN3RYZzZz?=
 =?utf-8?B?dXFRZU1GQ0VWSWpQd3ovN3Qxb1F0Qk9CbGtvN095b2VEdFN4RC90L0FTVkQy?=
 =?utf-8?B?ZUhxNUkwbzRyN29wZEVnZ2VrT09yWTFUazdmSklWRXlkSnJIVUptVlVEM1Nm?=
 =?utf-8?B?Z2h6cEhDL0hBWmpwajkreTJxVmYvdDl5bysyUmZtTmtqcnh6SzJ1NXZSV0dk?=
 =?utf-8?B?WWN0b2xZVEQ0TVRoWGlYaG5JYVFqV2RiVzViM1ZaM1QzRkZZV3BlcnR0VXV5?=
 =?utf-8?B?NzhrTE5FV0huOERxazhXNXFlVE56QTR6Wi9jUW53UEdFYmNyUm83R0RHY2dS?=
 =?utf-8?B?c3ZiUlh2bDdUV2oyWUxoeUsxVWdzS3FTNEVtdHZJUmQ4cjRiNTEyODhYWlZZ?=
 =?utf-8?B?cUlwWlREdVBMOHRGZU02Z2hIU085S1hHeFZPZTlSMU9IWWhiUy9EdmVtYmYz?=
 =?utf-8?B?R1dBOEszbUdCa1NLejBBYUozWHJ4bm9oQTNiRUwxUG5qTlF3K2V5NTlYOWVE?=
 =?utf-8?B?SkZYNjZTQXJ5emcxd1BScjJhYXJJdVlKeExoaWo4S09ZS2tLaWhsLzN6RUtD?=
 =?utf-8?B?eXR4UDY2R1BtUmMwNzVOdTY3UFpoSHp1bnExUnRlVVJ0Njlrb3RPZkZlc2I2?=
 =?utf-8?B?SkZlbDcraEt4bTBsVEZHeDNjNXFTVFF5OWhuSXEreEVmUzA0aHJQQlJycHVa?=
 =?utf-8?B?QlErMXJ1SjJobXVsanBZT2ZKVXN4OTRLOFc0NGFKQy8vT3drcjJ2ZUZRMmky?=
 =?utf-8?B?MStEdnJFSlJyazI3LzZtYWdqTmhycjAvek96Z0NGZ1hlUTRIYnYzYXVpUjg3?=
 =?utf-8?B?bHpyTWkzMWRydFlrREh5b0g4UTdvMnIrUTBLSlBUWXZKZ0kzbldhYzdQUHE4?=
 =?utf-8?B?bi9pbjgvRnY4UitPV1dEdUcwNjBNMDRwRTZxc1RIYVRVOWJOTXQzSkk4K0hR?=
 =?utf-8?B?NXk4U1BNRDdYL0ZzUGRId3BpUjkvMGZYMVNNWWhpdm5BOWdpMU90cUtBL2p4?=
 =?utf-8?B?OG5VWUJWSXF4dXJYZ3lQcDJkQTZBZ0syM0FtYXBQOGNJUktYUUlIUzdxd1Yv?=
 =?utf-8?B?czFyNE9ML29jeHlDcFNFNlJvOWJGdWt0OFo4alFWbXdwYnZycnVhaWRuUkhE?=
 =?utf-8?B?cDVDZWsrRHlrMVJhaWRSdCtsSUtyeE04SVRKV0tvaE1yckpkTFQxSUFRcWVH?=
 =?utf-8?B?QXBDOTdScmlFTzdvVkJlQ3dGNnI4M1BiVUxsM2xyL1hRUC9jdVBKUXVMcElN?=
 =?utf-8?B?SCtjQTVTU1pDYmYzUkRvQmZhZGEwVFZMZHYxTFJXemZ3T1BVN0tRWmRpQkNi?=
 =?utf-8?B?REtVUEZyUjYyUFRMcFZnS20yWFNKeXhWaWFjVHJ6MUtnT3BPSXBKOUIvUC9P?=
 =?utf-8?B?NUY3Q3hxR3NzMkRILy9nQlkwTHQ4TCtNUnZSV1EwYW1OSWVuSUN2RUtSZXJE?=
 =?utf-8?B?SHR2OGwwYUFyOFdGWGJpUUNWemtOTmNCanFFUzF6biszbW1kS0VWM29ENjBO?=
 =?utf-8?B?TmxUUmJ2TXcwN213YVRRd1BTTXA1WWpUVnk1V1o4T1JpckhzVHF5bzhZRUUw?=
 =?utf-8?B?RTEzMGpTTmtTRjVoNTF6WFdpZnZEQU85K0x4QzZxaFovSE96dTU4Y3NOWk9n?=
 =?utf-8?B?K1Y3RVZJcllRd2ZsdXdBWDFMYmMyQkFxclg5WHRjanlqajI1VjhOSUh4SHpJ?=
 =?utf-8?B?RjBoQXVJWGlkdm5naVhYUU5CTUx5eTJKK21mbzlEVUNQeFdrdDVTZm1KSjNM?=
 =?utf-8?B?MnU2aVorUC8wK3NEdElxZUpMZENCY05qYWZhZVo1TlVMQ1g2N1BTeTE0M01P?=
 =?utf-8?B?cXROZE9PRGFVejJ6cWNMRnphMjBMcWxxSHhNcTh4YkVmWmF6b0hmcEgrNnZS?=
 =?utf-8?Q?vXdKcf0S1lMFMDt4=3D?=
X-Exchange-RoutingPolicyChecked: oU6D29y6N87zugZi9JPfvpkxYmUbXPDzkGaZX8z40tWqD4qfvuTFOlhfXcaWR0EWQxdAcPHiHRFkReSAcydQ+fGozYvp8KMAJn4TPXOr47pUi78y2xllBL0jkIX7xFmhsa0L+wsVFx5rggm3SnxfIZZopXPci8lkG8TpWw4wdH6uexl2itlj3GMV1aHfe9rUFH7A9z1Tb7luU3z94JhCp16su2Mc8NDVOKS3y4/BRb4kB9/ltr4bVSAf4kZ3pjWQBj8OJLZRMLuUKA6RHOJ8vslJTA9DiafBRVhJVlr2iHdVAZdFzPC0R0wpvV18g+5eZju1XoOUxnlfcANH799pUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5406b8-ecac-4618-7eb7-08df0742c6c1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 09:32:29.7549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMxwoiSchZmkndAQ4N5M9v5jszOAIDUGNtKayEntB+C0jKtD9L4J6id+fuSSxGXOvDmoi/BTITUaUg9AYD2FMdKf0wummskBY4Lqccd3xVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7450
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



On 8/19/2026 1:08 PM, Swati Sharma wrote:
> Add a subtest that verifies the driver rejects a modeset when the
> requested pixel clock exceeds the platform's maximum dotclock
> capability. The test reads the max dotclock from debugfs via
> igt_get_max_dotclock(), sets the mode clock 50 MHz above, and
> asserts the atomic commit fails.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> ---
>   tests/intel/kms_cdclk.c | 64 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 64 insertions(+)
> 
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 070fba400..33007f6b3 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -44,6 +44,10 @@
>    *
>    * SUBTEST: plane-scaling
>    * Description: Plane scaling test to validate cdclk frequency change.
> + *
> + * SUBTEST: mode-rejected-max-dotclock
> + * Description: Verify that a mode exceeding the maximum pixel clock
> + *              frequency is rejected by the driver.
>    */
>   
>   IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
> @@ -354,6 +358,62 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
>   	}
>   }
>   
> +static void test_mode_rejected_max_dotclock(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	igt_crtc_t *crtc;
> +	int max_dotclock, ret;
> +	struct igt_fb fb;
> +
> +	max_dotclock = igt_get_max_dotclock(data->drm_fd);
> +	igt_require_f(max_dotclock > 0,
> +		      "Could not read max pixel clock\n");
> +
> +	for_each_crtc_with_valid_output(display, crtc, output) {
> +		drmModeModeInfo mode = *igt_output_get_mode(output);
> +
> +		igt_output_set_crtc(output, crtc);
> +		if (!intel_pipe_output_combo_valid(display)) {
> +			igt_output_set_crtc(output, NULL);
> +			continue;
> +		}
> +
> +		/* Set clock above PHY max */
> +		mode.clock = max_dotclock + 50000;
> +
> +		igt_display_reset(display);

We need a do_cleanup_display() like all other tests in this file. Given 
that every test in this file (including the new one) skips its own 
end-of-test cleanup when its assertion fails, a prior failing subtest 
can leave hardware in a unwanted committed state.

> +		igt_output_set_crtc(output, crtc);
> +		igt_output_override_mode(output, &mode);
> +
> +		igt_create_pattern_fb(data->drm_fd,
> +				      mode.hdisplay, mode.vdisplay,
> +				      DRM_FORMAT_XRGB8888,
> +				      DRM_FORMAT_MOD_LINEAR, &fb);
> +		igt_plane_set_fb(igt_output_get_plane_type(output,
> +				 DRM_PLANE_TYPE_PRIMARY), &fb);

Let's cache the primary plane instead of calling 
igt_output_get_plane_type() multiple times.

With these, LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> +
> +		ret = igt_display_try_commit_atomic(display,
> +						    DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						    NULL);
> +
> +		igt_info("Output %s: clock=%dkHz (max=%dkHz) -> %s\n",
> +			 output->name, mode.clock, max_dotclock,
> +			 ret ? "rejected" : "accepted");
> +
> +		igt_assert_f(ret != 0,
> +			     "Mode with clock=%dkHz exceeding max=%dkHz "
> +			     "should be rejected on %s\n",
> +			     mode.clock, max_dotclock, output->name);
> +
> +		igt_plane_set_fb(igt_output_get_plane_type(output,
> +				 DRM_PLANE_TYPE_PRIMARY), NULL);
> +		igt_output_set_crtc(output, NULL);
> +		igt_remove_fb(data->drm_fd, &fb);
> +		break;
> +	}
> +}
> +
>   int igt_main()
>   {
>   	data_t data = {};
> @@ -384,6 +444,10 @@ int igt_main()
>   	igt_subtest("mode-transition-all-outputs")
>   		test_mode_transition_on_all_outputs(&data);
>   
> +	igt_describe("Verify that a mode exceeding max pixel clock is rejected.");
> +	igt_subtest("mode-rejected-max-dotclock")
> +		test_mode_rejected_max_dotclock(&data);
> +
>   	igt_fixture() {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);

