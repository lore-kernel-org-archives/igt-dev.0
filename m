Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF86109B477
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 14:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A712D10E213;
	Tue, 31 Mar 2026 14:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPiEMrE7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A3610E213
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 14:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774968314; x=1806504314;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5PgwaTpDV6rxVY4C9zqsh6ggUcdC66mDJoA3wxoEBNg=;
 b=YPiEMrE7Cc9OF63YNvFLEfnOASqXc1FI1OtGALnBKzX9AYi1IQMKKFxz
 YolIrpyGhZ2cMz4FTHwHSIzVuLpnt7wLxKlgbbppJ6YQDZ5HNBpnBOAP4
 ytas4oi/Gj2rDekFtQcIeHfSzcqHJtvEEHKwJBmWOvc/T9NzrwnssR4PK
 OwVkK1jopBEu9QJerigR1Pci94o8LEcwvopkVVhbVdJJsXdo0ApllGnRa
 FPV6myNZIl0ZZI+O0MOl/IGb/ND3p58En0+orrZGS91kL3SRuUlMge/tH
 i0p2n7Q1VqAJ47IQ7KFqQQzRJmehrXYFkCzRd9O4MqoWoSetCi1Fm3KF1 w==;
X-CSE-ConnectionGUID: LXwGHeyHQly8uJ3hQLydGw==
X-CSE-MsgGUID: C7ba2N7FR/Kv5UcorwMkZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79843002"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="79843002"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:45:13 -0700
X-CSE-ConnectionGUID: v0oQny67S6+gIP2jkD5pFw==
X-CSE-MsgGUID: IQEdhQs4R+KOJACPeK0XTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="221981816"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:45:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 07:45:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 07:45:12 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 07:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEO9nUfmLm1BLjm/nlSkoGCnHOCuFQiYpAR/IRLEkP9NlHBOitsYZ7McBze8t5chAm6nPqZn8XmdO4lwzfHkbfsV3S3/MdJDnEgMfoPbjP+hq44l02t7FqE1zweKGmk78/Kw0UPDM6WyT//5wgp6ESt/SStpMRURjbECI6dMFhFZqnDLbL0MTRrvv4mnGJks+Acy5A3t0wfg5zzH9e2PH3JhsZ2MhrOrL5OhKopNnanANbiwAoqDlIM2fT4Su9/uMBcdETyhv7ILVN7K2LJhYIFjowB43kXYjDIJAg/64OGBoC9xq8d8EIDJQZbCpA7Wav4/a4Jf+djQJLQTr+sC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzXx3RxNdgjT96wgo6cvzBkdIoHMnu3GFSd8YQG4QZs=;
 b=AdewNABrWLLyCiY1PpLp4NDZv/3KnYHcAXW4UBAtO7hwrnOrskEdp2D5uICEk7PwaSYTGkQ1g6bJxFTgmN1wb9QijxZ11j2bfAy20vdVD2kfDb/RdVleCwcfp1obNBeeSxEIeZXvG9WsKkdh+FE74UkwutWTqQm0frrGI/SNMzZ0JKiOWPQ2h68h7ZMmzyE5ctfZcztr1RJRaBHSIz/5jVrlumhQbrl119B8WJSL4OKjsiDF5vD8d5AQZFDUP6li7OAJOqEiitJrOZkfKrzcxCW3ee64wQnn6FEDD2DTYcmsyKbQhihu48+HCqHDutqr0N9CsdfJM6grM0Lr63+y7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by PH3PPF5F1DBD8A7.namprd11.prod.outlook.com (2603:10b6:518:1::d26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Tue, 31 Mar
 2026 14:45:04 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 14:45:04 +0000
Message-ID: <57d63dd1-e16b-424b-8d97-7bd9311e3b36@intel.com>
Date: Tue, 31 Mar 2026 20:14:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] lib/xe/xe_ioctl: Add xe_vm_get_property helper
 function
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <jianxun.zhang@intel.com>, <stuart.summers@intel.com>,
 <shuicheng.lin@intel.com>
References: <20260325212208.85743-6-jonathan.cavitt@intel.com>
 <20260325212208.85743-8-jonathan.cavitt@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260325212208.85743-8-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0047.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::9) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|PH3PPF5F1DBD8A7:EE_
X-MS-Office365-Filtering-Correlation-Id: e1db7133-ab7f-4e57-3d1e-08de8f341809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: hWsHAvYS5WuvRU92+P0WCjW31RiLmvFUfwSrPEKXpU+0IOeI4BrJsUQpfyURb+ZoDBlxe3O4NY5IWY3/fTOe3Stia7euriwaz9XRI/hlu2YQKPRxiK5auGpB8GMfjiobNmEUbNePDaJQa9NpIcq8DRr1hBHwZkXOOzCJQcLXMSeCVhOfCUAF2XzX2XWKNgIcksCxBdhHgETQtaTLKD3TEGPcviT1qRRAo3xvIG06np3D8yW5D9PuS6pi1hd+RvDHEVD/fMT7Nsj9nY+lmH9FEajcQNnJMQoTB2okYGYqlil2zw2+soWYy/2S6bRVbi8I4AVR8x3lQstEKedmJ9bDJyfe6X7iMKhY60VrjNDY2aE1shgCmFNuVbZJ8l54Ii08rM0fcvHZr+8ky6MyzZPzekajAmUtyATA4G/eTE91aGXgh0vEfyj2ZXqSX/ioUI3o4LAe2YVgJ8ylnDM81pfznzJ1f1PnafwuMaoX2UI/4aeydpY4m3iaTOJBg8TbfKExcgSx2UPdblrhW1rHh+JfuLnva8goCQLemG3dmZDbQqbVQsQNGh39Td/w/TMx51hIkmyPFJh3yiprsk+vMooxQLQgLf0R+y93lQMiGExBP/m5xMu5L1yT3dAIJK8ftiMInBrbxTBb4qRyOKCxa91w4uk1qAqjHQb1sYCrwGuJnAPApe+0F+eXOD1FGiHH5tSuJpcpU0imvZShk19JHX1I0NdXst+W72JgPDSTlGGVA1Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk80TC9XaVdxeWJ2Q2R3bGx3SGVhbnZIbUUyTTNMTmVZRHhvcTgzR3dZMCtH?=
 =?utf-8?B?VjU5bjc0UDhqc09iL2dJd0xYWlVwNjQvbTdyTDVwRlpmS3dBYkswNElxMVFz?=
 =?utf-8?B?eGljQlU4eXdqVmVUVWZKWFY1eVBSWXRvNXFDQkFJTFFVbjFvR2VRZU5TZ3li?=
 =?utf-8?B?WlZqQ2NiS1NURnF1UnpYa0FSU1Q4SEIwaEUyN3JzdmxiVWVSYUI3ZkxlRXpZ?=
 =?utf-8?B?UUZkeVVqTFIyVVROMTVmUkJxMDJJSFFWbkVZbWhUdkpLNmxMVzB2eEo0Q1RR?=
 =?utf-8?B?cmZNT0QrZU1uelZtcWpzYll3Snk0bzFmYW1ZaDhEQXd6UWoxc3Q4QkMycVJK?=
 =?utf-8?B?eHJ5dWYrWDQ2OEFuT3VMYmY5ZHB5cTJIQkZCU3M2elJ3b3BBRW13NytvZ2Ez?=
 =?utf-8?B?S21sTGZPemRORzN1LzNVK0hNeVBydHhSczlram5vYWFrL1h3TmRuWXpuV1dX?=
 =?utf-8?B?aXJ3UTFNTGhuVUhYWDZHZTd1TlJ5cWZQUXFsVk10bXdsNXFSVXN4OWNPMEZr?=
 =?utf-8?B?M29lRGtibkJUM0szTUZtLyt0aW5lNTd1QXFBRjlHRW9kWmdhVXFBbVpERTdu?=
 =?utf-8?B?aThvbEdrOVdWMnRJcHVKbk9XMW9paFp0WTdGUlBHNlpMTTM4eXpvdDFsajJF?=
 =?utf-8?B?WlBGMlI4NVNDUU9mOUlFVk5ueTYxVzc5U0dmRUxOSEJ4cWdHZEREZ09FMVRh?=
 =?utf-8?B?NU5NY3RQQVVtVWdVYzR3WTA4S0JLVmFMcEoydDBmVUdBUU1ZTTFhMWltSGtJ?=
 =?utf-8?B?YzlNc3hDMGk5ZnJnSkJIUzc5WG54T1l5V1VCNmNpYmlEem8vWUZpcUJEdlZo?=
 =?utf-8?B?dUZSeVptbVh3elpqbmNLRlVxWDEvRHJoQ0pKenNHc3NFVGlTRy9ZK0grMUhD?=
 =?utf-8?B?NEczMGlET2FtV1NNU3RTMEtFenIrZ3FMZEZHY0xJbG5NdjFML1BCcUdleGUv?=
 =?utf-8?B?MnZSUGdMQ2tYZkZvVGdNT1FIcFVRZVhzV1RGVEpvOXZYK2F0UnhSRWp5cThP?=
 =?utf-8?B?UlBnUzZNL2xUUnJnc0lBOG1YMXNzYUFTV3Vock9LbkdVMmM1M2FOV1h3a2tW?=
 =?utf-8?B?aE9UQm0wRjhUQmdmSEhYWXhqOHRmRnlaUGgraHNVWmVJVFpMdi9HMGRSbVRH?=
 =?utf-8?B?dHJMRitMMzNURkp4bEJtZ0lDZFlaTHNlOHlFMmxYS2VKQUd6VlozTDB1WWw2?=
 =?utf-8?B?Ukh0K1loTnR3Ly83SllBM3lxbE9UaEFjR0h5dmorR09jdk1mM1JITlZyWE5G?=
 =?utf-8?B?UVdqbjZVeFRORFd1MkoyQjJiVnJCK3VZK3BCaEVkbTZvVlExWkN3RWNYTkI1?=
 =?utf-8?B?NllZTCsxVnJ2cm03SkJEVGJTRzlVSUtXVkdLL3ZEd1VId3BPNVRQZEFITkls?=
 =?utf-8?B?SGNQaS8vUG9BZ2hGODIvQUdnZEFQelFCN3RqVDFzTDh5OUVMMFhLc05sT05i?=
 =?utf-8?B?ZUlCb2NWbTBGOUFNY1JWNVp4WjZHTU9id1pNMFJDZ2JTQ0hCNnFkS2pwbCs3?=
 =?utf-8?B?eEV6bzgxQmtWUlFBQ1ltdVQ4SGp5M2FKRzA0TG5GQk5reWczNjZmTTNXRTZK?=
 =?utf-8?B?VWlHUzcvbzNoVXFjOFpJVnpEemZBTFpzMDVPbnlOK0czTFJCWW8yTlBoU0hW?=
 =?utf-8?B?YXlRSzRuT3pIeWdjSjlEZkhKSG0zcTg4T3FBb1gxK0ZsQzBIdktCN2g1U1VH?=
 =?utf-8?B?TCtYOEZkWE5xUXlKZXo1RUQ3N29CelV4M2JKMnpuZ1dFakJCdytnWDI2eTVM?=
 =?utf-8?B?K05nc0Nqb3krMGNLcWhtK2g4SG83YTFjeVFsYUE5QzVkWGlUaWhJOEpFVVdD?=
 =?utf-8?B?NzdrVU5wc0tlMmVEN04wOUNCUWp1M0g2dGhnOTVkNFhHRGdrZ0U1KzdDdkJN?=
 =?utf-8?B?dlZJdEZXcHZ5czViRXRjUFlMdE9qeC9MeHpGUmVUZC9sb2tEcnkwQTJNZFd3?=
 =?utf-8?B?eWJ0OVN2bWY3RlQzMGduV012VW5xTmlCVTRjeVdkUFpUWHVqd3lqZ0F0NERD?=
 =?utf-8?B?L3d0Y1RDS3pKVFRmdkN1UjZ4Sy91MnBjSXU5WWlxMnJ3QWtlQ1VPRlUvN1py?=
 =?utf-8?B?dEhGdlhkUHEwRzB1a1ZKNlc3N1ZrdGVYZndhWHFhY2RsMWhRQkR6UWFNRWNn?=
 =?utf-8?B?djFTSmJ0TTMwWHFNRXJFNkdBdXMxSE42ZHc2NWN1bmpxRWQ4K1pFMmZQb25V?=
 =?utf-8?B?dEZTajNsa3NwWDNEN0Fld0tlRFpZc1dkbnlBK3VTMFhuaUFhNVNmYmREV2tX?=
 =?utf-8?B?SWY2ZjhsRUV2ZC9BaG91dk1iNHlQMDFFNm84eFErTUQ0L1dPdzN6dmlHM2cw?=
 =?utf-8?B?QS9YaWNscDdKeDFNWXlncEp2aHVFSG1vdTAxb25nQ25FYmFmdkdVQT09?=
X-Exchange-RoutingPolicyChecked: laz5hpkeC++807xaB6AjC96/nHPFKoOXANqfKDq74Csw11P/nt6UCPG9pNpfaO0yshWQMQn+UV/M4nCBY8yJScqpMnXMXnTTdoB91EOs0n5YH2B+fa92DleR0RuPcLvE8g76AaRrhIWvpKv3igmhE0JsTUPTKXI903f6FnRum9uH3DORwW6m7/tjPshS/d/OT7RKBXRzTAW0DAFc6mn8fb+yOT6N9M1a1f4FGVa+SHERw9W0n/4Qx29lBfJUyfzEZeaeAmp66HDRRPRGwefH78p0SkQsudFiC/yfcxazOoE11WmdPa4jdE2tPGfXtHYLs49dHYG9wUS+Pe25ZbnXEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e1db7133-ab7f-4e57-3d1e-08de8f341809
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 14:45:04.2279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzYbO2obq08l/CLXFsgCJiNVhaqrfih7NzkkfR5OTcPdik1MKYrZI0NxKEdJkY9kfXLHgOsh3i4qheCPcCqJHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5F1DBD8A7
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


On 3/26/2026 2:52 AM, Jonathan Cavitt wrote:
> Add a helper function, xe_vm_get_property, that calls the
> drm_xe_vm_get_property ioctl.  Since the ioctl behaves similarly to an
> xe_query in that it needs to be called once to get the size of the
> return data and again to save the data, the helper function takes the
> ioctl structure as a parameter.
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   lib/xe/xe_ioctl.c | 5 +++++
>   lib/xe/xe_ioctl.h | 1 +
>   2 files changed, 6 insertions(+)
>
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index ea3f2fcaab..7a8444095f 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -332,6 +332,11 @@ void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t offset,
>   	__xe_vm_bind_sync(fd, vm, 0, offset, addr, size, DRM_XE_VM_BIND_OP_UNMAP);
>   }
>   
> +void xe_vm_get_property(int fd, uint32_t vm, struct drm_xe_vm_get_property *query)
> +{
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, query), 0);
> +}
> +
>   void xe_vm_destroy(int fd, uint32_t vm)
>   {
>   	struct drm_xe_vm_destroy destroy = {
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index b62d259fda..4ac526a8ec 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -65,6 +65,7 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
>   void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
>   			    uint32_t bo, struct drm_xe_sync *sync,
>   			    uint32_t num_syncs);
> +void xe_vm_get_property(int fd, uint32_t vm, struct drm_xe_vm_get_property *query);
>   void xe_vm_destroy(int fd, uint32_t vm);
>   uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
>   			uint32_t flags, void *ext, uint32_t *handle);

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

