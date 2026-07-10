Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACB3C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 05:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6E910F75E;
	Fri, 10 Jul 2026 05:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMOpWaP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259A210F75E
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 05:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783660919; x=1815196919;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NbdfbFwrlw+CdpNK0C8Hg8WO0HBrTVGSMc5SdT5hwwg=;
 b=kMOpWaP1hdsdvj4eDK/G4O0S1wd9z0JK3S6ZI149PKZfJdtyIIm66XlX
 /AnKBb9mHI9XL4Byzjw0nJQr08q0UQIcLgdDVHqbNXTjEbVfJ797IsOHl
 MZz/1+q5P19+GDLDg5/3xAxeyUdoPn5HOvRSx2F72dZTCVXD3VzaquA/3
 wtpa7H8BLF5FvRftXrwR0lLPqqGZ+50UtdN2v5WrAcTtk827IA/BG83ow
 arowK8fF+ZKgvi6neLIkljYo7c4VKt9FUygPG3qhsK1ICXZ6atihcuZKS
 4IQsX19C0B1Qrn13Yaxh+NwGIlTiUAy89M062VDv8jb/AOG0w845XcAMb w==;
X-CSE-ConnectionGUID: sGyhv80fTm6SsVnqncprRA==
X-CSE-MsgGUID: +5FYhtCaQJqsUGcVaYmfCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71880967"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="71880967"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:21:58 -0700
X-CSE-ConnectionGUID: GIW74KjdRx666cnRbV8ezw==
X-CSE-MsgGUID: +ruSFH76TxG0N/kggDHrtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="278024638"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:21:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:21:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 22:21:58 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:21:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dc9xji/5Fm4Nn9jgkjYkeOexqYWEd25BICyEvUXFxDkKlDyQBc0NxsoSGGAGb9RqtRRcXB/paLVhSLfxDf3tAVA4l4wgOheuXkpR9OJxZOz9MRvTz+kCwyS3MUlQF9Q+snPl3VN+ivzbFrMbKFClwCGL2yBzYsLu+gq8tVKeM3QgxDrDjXq69OrikMqWcQW9Xfn+5hUuE9Gs+J1Nw9trSK+C3jdSw0kD+PRe7IuVLGOVZ2J/e0YckjQgIa5oAXrXCq9imIS4B7JBL4VYU1eEmgWj+eBeCE8VJtMqSyqeqhUtUIFessOPdREmd/nsyFqSdxWTaQSWs5462Vdp/OMBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=at4kI3lPjQT2ZTfeEWeMCXbC9vtjsyISYgLQo7aX0oI=;
 b=dkvTSQ3ZQa+oP4HwSo6V9dWfbtdHLpzCRA14hxuZAo3LN+i+YrRrKtqDN4Mwm4v0cV2wRdC2aK9KhRFtt5rqUZEmPwt/x/WCBnQMuSe6r5bctQOnEpkM8i18LidB8sXHFFQRWVXs+GVHu9fZhrPrWCsplP8qt4R//PGylq9PhncBoorDfFUt75HVWe8P4K6QE8GZRyM/h3RsYrdbOKyRUG31XWNtqJpBsPybZEpE6vX6P1mB4lJVJ/R2x13JEyxATKNjgNEX+yqmD7bLlzgcFTdv9meUIYaEUgSQzb5Z7o3Airm9jWWzSPINfIJJNVfb8mXH++xil27Q03tvJ3YXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 05:21:47 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 05:21:47 +0000
Message-ID: <4fe44fce-3445-4e4d-936d-7a2c0f6b860f@intel.com>
Date: Fri, 10 Jul 2026 10:51:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 07/12] tests/intel/kms_fbcon_fbt: update the
 outdated fbc skip reasons
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
 <20260601204407.39934-8-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260601204407.39934-8-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0246.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::13) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|MW4PR11MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6b0585-b4ad-49ad-d33c-08dede4323ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8YWAiGGpThBzXZX3jXrVmLO44qG3G78UHEKhbrG1zzyXI7QJBvEHlz3rmC/Y9ZPf/jZ4eV+nje02v1jMdUArdaxfN5jgHwMcd+gWWyKsjx2P23LRl8xmmvppQJVZagGP3RP7If+Wz5nazrBBRPDaUpw9Yw0LPYkuPw4YyKzJz+voNHTTjm6Ndn3fyiMM4/+XbCRtQvQS/gvCEwz+GWG5YrT58pbpPTAcMdS7AeqUr4+qbA6TNtIV1rQ8onxS8oXvcwLOkj6iAbfXoo1qrjpMiee5gs6VzEoCGmxOXm+MdmEROxMtYrMQPeGkzAU81RUzwAayUY8tQxCKAOpOINUver/gZ5sHzd8iK6BgdaTWpdLQ61YReUdH8TJU7Nyur6ghr3Qqv1//xNavh++z2a8UZpgH2GCsuDnlbL7gn7K60L5qsd/Ie0/E0XoUAN8ahO4NoY4P5PUnaWG8wpD1EB7iiuhaQ8DPAjdjRkZndLxL5N3QuSZ0ZcGXoa0r9nEshHSbCFnUh5y0TALSabKWU8B+1k7MPNe5WNalcH5eUDb0NXYKOVkyI5Q6Be+SQ69FQJLRtCoCHxJh3hTBM/uRZCjOIXZx1XETqUIfwyDqL1qum2zr+H9jyTZPAcNLDqSDkFC2VXxiiC5n9jEN53DnsldVqQFTmKOH9wiXSS6CkZNalNs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHRTRTArWFcyTVlBdENvMjhhWFhnR1NIM1RIMElZOTBFNXRlczdVTzR3azJU?=
 =?utf-8?B?UzlqbnFrcmx0bkZhSTc4QzBsQllvalBzTGdxcGRDaFlQYmxhd3NyQ3BEbTNa?=
 =?utf-8?B?Q1VDSDhCRXJreUxnQjhNLzRuUmkwY0lSbWlOM1ZJdXVZWnNaZnFkampjdkVJ?=
 =?utf-8?B?NzlaMmVhNzZsWWlLcWhvNmJra0FNZ3ZGZkRSSmlzdDFoRGVBTVN5aEFNN0NR?=
 =?utf-8?B?Y2U5S3FseGRzZ0VWekMrbFJGL1RESHFNWUM0RDFFM0FvdTlSd2N6OVZ4Y3VN?=
 =?utf-8?B?dXV0Z2RPcmlVbHo1TmlTMktyc042TW5jVUdwMzRRODB3UTF3SzV6VDBzZ3Jw?=
 =?utf-8?B?NmUrODFDLzdWT0RIYU5kSlBNMkxpN2ZOQm5OOWM0WHJRTTlkN002TnNIc1ZD?=
 =?utf-8?B?aktKUDVuOHMxOGFWOTUwWGF3ZEVZRDU2QXFWNVVrODhCRytlSDNFMk1FRFVp?=
 =?utf-8?B?a3BEWUZQRFNkRWpqd1Y3T05RMUJnOW91QjNHS3RhSlo1bGNwRlk4SDh6bUNU?=
 =?utf-8?B?eS9UeG5qbnNsd0RZZzI2bEJRUGQzOUJyNGVpaER1OCtrUERHS3dETVpRUUpX?=
 =?utf-8?B?SU5QdG54UHhXdjVOaWVwQTJjMnczMmZST2VaUm1GYVRGN21tRGlUaER1MDFp?=
 =?utf-8?B?Q1hIZXI2d3ZNQ2N6ZzZma2xDa0U1Z0hoR1hqcno0bEl1MDBtdmpMZ2swdzh6?=
 =?utf-8?B?UmxXQVpxamlxNFpka0w4VHZaK1VQNjJtcHR6dVkwbWZ1N1h4VDZMZWE1a2FK?=
 =?utf-8?B?dUhTRXhVcm1hd0JESG45UnhEVnY5MTdTeXM2NUVwNWNZQXFjWjJrcFgyQkU4?=
 =?utf-8?B?K2tCQmU5RmxRRDE0UGFJcU5sclI2K2x4Ym1CaFFDWGtxODdwQXhOa0Q0WmxT?=
 =?utf-8?B?VEd5dTVvZlV0ZkVScjRLaWtlcnorcWFHYkt6dGtFNXFXYU9Td1JJOUdXdjhX?=
 =?utf-8?B?NXFOWUF2cWhxdkxZUXJ0T1VkcGtCVlB4MWgrVDJVSVdtTnpUNWZCOHNQdzNL?=
 =?utf-8?B?WlMwa1JERlRHRnhiQUFNZVpTM0tqRXh0aEpFalJaRExnVnpnZ0RyZHdwYVBu?=
 =?utf-8?B?ME5FTGtWTmhhQXZ5RzNPWDcxRC9YMUF1b3lTaXQ2NEk2NklTQ21OYnhrWFQv?=
 =?utf-8?B?alM1L1Z5L3lWVzJEbTVJMVlNWCtuUUVZdXJpUENXcVViR3RreHE2NTQ1cEd6?=
 =?utf-8?B?elB6bnVpRkEwSVk4MWpVbkZBNHhFWmtiZzhoUEEzRTFNVUZVdzM3QU0rRnlD?=
 =?utf-8?B?dUNxVGtsK2FhM0IvKzNSOEFhRlllMHR6aksvTG0yQ1ZlZGxtc09ENHZUY0pu?=
 =?utf-8?B?Um8wV1ljYTRqY0JuRWZaWFZVTjlRNHdMRjZibElrSElYSWJHbDhHbFBXN0JJ?=
 =?utf-8?B?eE1RS3NkenJKWEtaQ1plOWRpaEdsR2ZnbkpROC9sR0l2aFVJcFBwQm51cWli?=
 =?utf-8?B?ZWtDQ211ajEyMmQwUnBLbEZ0ejNLSy9WYmlzU21qaERXL2Q2Y25zSFlpMzJp?=
 =?utf-8?B?eXpxMmNXVHhPR1FlMkFsaFF0Nm9SRlpCMHhJQVFyakhxQzdQbkRqaFRzZVJm?=
 =?utf-8?B?ODFUNkFNK2FZVldjaHVrUldwWjNCRFFBMjZScEtLMzA3STUxa1VGVitxRFpC?=
 =?utf-8?B?NEt5aCtUNHU1WmEzbDVvbm5KV3VqS0sybFF4UWowelpyMDBXU3l3cHBGZEg3?=
 =?utf-8?B?UEQrZGVKVTVjUXlsYkx1V21sN3B0WDRDWk9QWEtUT1k1ZlRUOW5UNE1aV1NT?=
 =?utf-8?B?a25tQ1FPK0xZalFHSVpnbTJKSzA1RkpEMExCbXlqYlhtQjRCcDBGdXlPREZ2?=
 =?utf-8?B?TnBhbFdnVkxFMlZ1RXBHUXB5MnY4N2pqU3QxdnFYWmpsNTJkTXpZeUNjWUVq?=
 =?utf-8?B?V1l1V0MrYnhwMFVkTCt6eWswSm81QllUWjRSL1dLaW1OZjZyU0FuZVBLbmp2?=
 =?utf-8?B?RHdoRDgzMXd5N2pqRzQ5U3NtVDMvSjlYaTBENjZZbEc5N1R0RUpuaThvQzM0?=
 =?utf-8?B?NHpvYmh4MWtvUU9XZSs0c0JzU1F1dnZLRGVtZGFjbU5LdjlBREhtUEFFdHRH?=
 =?utf-8?B?aFd3NlZjdFA5a1J4L3VuVTFJa1NjZlVtRnpRMWZCd2FBOFcwc2tsN1RmcVYv?=
 =?utf-8?B?cTMvMnRtVmZYd2M4Q0tuMXlUMkxySytWU0lXeEU3TytqeTUwb1RDc1pUMEo4?=
 =?utf-8?B?M0JPRWJ5bUk5Y1J6UU9ZTlVueHU2d0JpckNKQlBqVGdGYzhBTWZTR09xUEkz?=
 =?utf-8?B?UEthUENza293dTNOTTlzbmtrY0RsaGJFREJkYjNuQnBaUlBzdEwxc2NJOHVE?=
 =?utf-8?B?YXpYaXh6cENOZFgzcUZXRytwTVIzaGs1Q050b0VVSHBBdVdqd0ZjMnJ6RHA4?=
 =?utf-8?Q?hX2hF0cdr6uog5u8=3D?=
X-Exchange-RoutingPolicyChecked: FZUU5Q6WQOSWUQ6hQ1RxAcXQ2VhoyU8X0WkJXNxWXT4GgJR3fYAORQbUtSeEVtM7/ZHuMRJeXjXbSLCthSZzB5OqufnJFbSGoHj/CAkHxKcfCkwjUn7At0rM2vJGMKfB81EmIvTnCZsoo5+Pn2GDmfRyPuMWs1axaFocCt0LlqDpflKfg0tGUHgH6gXZqqSAgvQ0qrv7vZUMyfzzIk7YeaZhrg1kVghNxB08LYkHGN2GcWLme+ZsFxP+vGuuXECN0tKlgUGh+jeXx/TWQQ8bc2BUfXZXvZUYLGLZ1urGDR0MK3opEFNRV3zdd8ca4g77f8edB7TYnvsf65MzggdMkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6b0585-b4ad-49ad-d33c-08dede4323ae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 05:21:47.6880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02A1RStpNJShTU9Ul170VXi0V59mR2xKdH89RChu5FemkFDwm9phCLCBkeJJcF7RlD5Bn/Q6FwMFV3Fx77NO64EXcoftCXq4UDGObtvOC3mH3uDKqQFVrwOpfnw+0YOU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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



On 02-06-2026 02:14, Vinod Govindapillai wrote:
> No fbc reasons have been updated in the driver. Use the same
> "no fbc reason" being set in the debugfs by the driver.
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   tests/intel/kms_fbcon_fbt.c | 22 ++++++++++------------
>   1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index b36582011..78c6cc4b2 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -297,18 +297,16 @@ static inline void psr_debugfs_enable(int device, int debugfs_fd)
>   static void fbc_skips_on_fbcon(int debugfs_fd)
>   {
>   	const char *reasons[] = {
> -		"incompatible mode",
> -		"mode too large for compression",
> -		"framebuffer not tiled or fenced",
> -		"pixel format is invalid",
> -		"rotation unsupported",
> -		"tiling unsupported",
> -		"framebuffer stride not supported",
> -		"per-pixel alpha blending is incompatible with FBC",
> -		"pixel rate is too big",
> -		"CFB requirements changed",
> -		"plane Y offset is misaligned",
> -		"plane height + offset is non-modulo of 4"
> +		"pixel format not supported",
> +		"tiling not supported",
> +		"rotation not supported",
> +		"stride not supported",
> +		"per-pixel alpha not supported",
> +		"plane size too big",
> +		"surface size too big",
> +		"plane start Y offset misaligned",
> +		"plane end Y offset misaligned",
> +		"pixel rate too high"
>   	};
>   	bool skip = false;
>   	char buf[FBC_STATUS_BUF_LEN];

