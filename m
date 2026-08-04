Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6B0C55822
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 04:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CD210E851;
	Tue,  4 Aug 2026 04:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MP/dO2yf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0893910E65D
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 04:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785817607; x=1817353607;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZekK2rjyhiQ/Ul5yjJZRhTbuu4GDT09wS+ZNn5J8vEI=;
 b=MP/dO2yfurWisWthSVAgbS+gk6JelC1GFeunZG4rqBfiQD4dyyZ6mtBG
 c+0mrcRagzGJma2gB00+mWofcohjgpvZLlR1hnu6DMyYOO9BigtwTsK35
 y5kgKyQR9ErNlM+p74sDMzM2w1hPHo+ORUdh3PV6uxsFL91kunyBFNguE
 eNq/QCx5pjGIk9nUXxNY9B+u1xCYoHAfwnhPPHQPsjz7nxD0o6Kz/rpG0
 wmpzIDyBmKnU6UVEkzidHO/KpeHnGP40dqylrKV1kS7Md46iZAuQvUjKH
 eI7jfbnj4FMYCPpXlG4uFrwTRgHkslju/nsPGC3n83RSvSCmxIsqZEhIh Q==;
X-CSE-ConnectionGUID: idu58VZFS2Cneq2myvIV5Q==
X-CSE-MsgGUID: 2I4Rkk04Qnaote3rPpqGEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97868755"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="97868755"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 21:26:47 -0700
X-CSE-ConnectionGUID: bgt6sFBBScmObdRtp6PL3A==
X-CSE-MsgGUID: yEQfb/ERSImGVgeYnk5rNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="261463385"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 21:26:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 21:26:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 21:26:45 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 21:26:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FK3k8vzoG7wsOKBPLKUEMhGrmR73GMLIqzL0wwN6VMD5JCiAAv4UbNPO9oH8yAwEyBHB5DR3rYQHRfADtIXpSo0sJ5GynfSP/rW5SiBhKSwNA1lT0l8w+gPfl0xdshW9fXz+Eu5jq8ovoI+4ImbiXdAvXLSsnH3sjZzRhBDOzmP4L2N0q4p3jslsFP4T/zOXUizjJF3FJ21bFAEiqvXnunkOhLfXdD8XtXgo4W5+1ZjNMSKbM2YGFENgBqzwoBvpd7agG0oRFzVcGwEwqoxzxHmEcGcE3b86YVo40q5ezpATGMNqnmEo5kYiXld0Ps1jKLJFUoagt5mYCGJc0fBlmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59VE2EIsA8Y0Tkrm91kmlh5MKT/kLDsTueI2Ee7hUdo=;
 b=ZLk9Xg762yFpAVWnDIujdHdbNn7GgJ9jdUtcXX9Dkz7VVheHpqcU4wmvhV+FBvPCFgXOfPknDumthUqmMAbUD6yArx2Ibtduv4CBMYSP5nwnfz2jLX+a3jKj2TBkHziFWTMdEu2Fwxw8dg9dNUOBcUDvX4Da+CeFDbftZk8jekybjXZkrNRj2SAcoeUIRAmFq342fji71jdS+XRgANkgc64h+qUjlfT6JSWRzepT8Xq4BpKfc0qngMXy/xUb9gX7XQIkWlGRgfki1e78KtWkBh0Jwair4i+OxSr2GUDfEnogWFm0O4U3JQOY/HiQ+Dd+K+eDJ5PCQzjdJzUi5/BhDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 04:26:42 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%6]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 04:26:42 +0000
Message-ID: <0d665a26-c87a-4458-8160-0aca77c47534@intel.com>
Date: Tue, 4 Aug 2026 09:56:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xe_exec_system_allocator: fix MADVISE_MULTI_VMA and
 PREFETCH_SAME_ATTR bo_size for PVC
To: Jia Yao <jia.yao@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260803212549.108737-1-jia.yao@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260803212549.108737-1-jia.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::7) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|SJ0PR11MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: a0552fa6-2236-4098-ed55-08def1e095ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ilwfow3fANimc1+3pWckkz42UBqueb9zjCUNF4QIimC/GPWgdbsL7lGD4QiUb8MtdADe20vRcWidMbS6h1r2jn/fR8LomWK/W1BCZH6rYGQjhEkl9HkOt3492QgKjAr8vtoWr83vNN+IHGfU7lyhAYpEX2TYeZ3oRWqWBLWM8gSt/FlCYgkYbfCqOBsC1j8r6av6mEVuAua+rP02dCR5uX6HUThCCHGyv7mkNADpzRON1yCwjtPu3quJNTCYGUDcakVFGanQD2dqs3YeJdCcZxWnv/KcbV7uEDpSj6Kw9zBm2wIPZWrnv2PaZIYotKbzNioRfs5BccTh+HY2fRdfJkBJx8W1aac6XfM+nieE5VLwTg7mYe5tl6pYYsMsdtqjHKdKWe1zwxgo0VRwAFqKETEmJZ0/wDOJx6knxQEToFvGN1Zi4Pa+6iW2lUFSqKyx+0E3RVVIZcAxsqwgdhodSEcaTuCl1CNVE2/XRJLmg0bjFueTNJDHpvUj1EFvyIzAxb0RtSZ75CY9pWGRz7ouYWclHbOoxWVA3vx6NyEFdsgpH7yTEOn6hTRNo9ItNn2NAc6IvQTwRt2WWCkPgYJmW7G9dZJkzWHakBm1G4SxmtlxUijX9ccOKAliP5Rb2MkG5sdppvJnecO00ESqMmfhRyipsLokG75tFWLI2hASZHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXdXMGZ2TWlxaVh0Wjk4WWhkcUxZY1hvaGxFN29GbUgrbEE3MHVObzhPWEpO?=
 =?utf-8?B?QTk0a3c2d3FXam8zQmVKM0FCc3FadmZvR0YrMEVCcVEvSHViMDZGNzhVNnRJ?=
 =?utf-8?B?OTRmY3pZWm1WaEZoYnVQSFROWTA5cWpaem4rUHFFY2ZDdTlGd2h2NnZYa3RL?=
 =?utf-8?B?RE5meER5VkcrUHdQc09taHgrbkdXS0lZdm1LL3piV2dRbCtOMnNYcWI3YWJq?=
 =?utf-8?B?QStxOFlLTk0rZzFiTC8xbmFlS1JtU0hpNjdVZlZKb01rVWZCTFdyeFV0c0VY?=
 =?utf-8?B?L0pCY0VkL0NVNEF3WExxb3h2bm1oWmFUU1UxdkxKUHlBUGU0RTZFWlRMMUd1?=
 =?utf-8?B?TjB2NWduUnluN0cxMTh0Zm9FSTFRU2tlU0o2NUUzbi92OUR4OGhHeGFwYXJJ?=
 =?utf-8?B?RVVvbTJMa1IrVXVBL2ZiMmJJWnJjRWk5cTRBeGpvL0dSV29mZTZ2MU1oZklL?=
 =?utf-8?B?YjFtMXVWZFN1SVJzUnJZam1WSG9KSURxTjd3cHB3RUtkUGMzTFBqcE9NNUY0?=
 =?utf-8?B?blZEa1JSR1hVdzNFSnJxaEVSRkFrcmZMR2tWZGpxVE9OZ3VkczJtVkFFRGtM?=
 =?utf-8?B?eGwvaVcrRFg4NFZ4bGs5RFQ4djNJT0dWVEFJLzV0NXNJYXAweHJkUWwyYjRu?=
 =?utf-8?B?UnZMeUtPWjBOL1R1QWxvSm9kRDA0VXRCVjNzYXRTcklWaHRmeUJBb1dqV29S?=
 =?utf-8?B?VnR2cUVMeE56YTZ1Rmd2enpRd2VlaHcwTTNnVlBJclpNZHl3UFRFWUNpRFRK?=
 =?utf-8?B?bVQ2NTVxYzNkZjQyaEgwYmhzL25FbjZnZzVNZERMc1RaMTMrU0doSjNGazEw?=
 =?utf-8?B?eG9tVXpleGVPc1QvRWIrYU40LzVhcklNNmJVS2hodkk4bU94N3BLOWtueXFp?=
 =?utf-8?B?SGxobUtKNSs1SFkxNU5JZ09paUZqekNlVTB0L1UyakpuKzEwUzludmhCaDdj?=
 =?utf-8?B?SGFTQTcrMUJuZ04xb2c0YzNVR0JzUDlNeTljdVpFY3FLNUV5VDNDdFN0SURL?=
 =?utf-8?B?bzJCSmM4S2I3a3FSTmZ5RndKdzVYVE1hQ2hZY2QwbVJ6dmFCaUg3TjRQNy81?=
 =?utf-8?B?VEJzWlNmTmNRTzNtQ1NWek9MUnJZWlNId1IzNDN5eFpObkprSHFGQllrZ1NF?=
 =?utf-8?B?MTh0R2I1bVk5eXJUcVQxN1JpaVNaUW9kSi9TTVV6emNwV0QySzR6NEtFSXhO?=
 =?utf-8?B?RjhyTTZrWERJOEcvVHZ4RDJabnk0RVU4Z0ZkaVAwQWN1YS9reHRoNmhjUkVn?=
 =?utf-8?B?SktyOGkyYUw0eVZqeEp4cWlTRU5nVlZQd0dnaFgyc3U1UlFVN05jZ2JOaXJo?=
 =?utf-8?B?ZUhDUmh5eGJua3hZMjFBVWM5YkQ1dWcrZnFhb25hQ2I3UkxMS084dkJJS0dh?=
 =?utf-8?B?a1BqemlyUUFDUzhnTG5jNUg4WWNrWFMvUDRkbE45NjJFNnhuOXRNRHJMbEV3?=
 =?utf-8?B?NnhOSkZNdHJJV3M1VkdQeHovMVFxOXArd1I5V2hsdXRiZGRNTTdjd1NkbTI3?=
 =?utf-8?B?WHY3bHN3M3ZHaHpJY0lFa3N2WHUxQlBOM0pYbUNiV2lXbStPT0RLaUpKZitM?=
 =?utf-8?B?RWozNnVDb0dhaHVwc2oyWGtIOENSVENhS3UwUUlrcnZMZm5LNWxpWGRrL2xl?=
 =?utf-8?B?UWN6OWUxRFdxYkc5aTZpUTVvdWV2NndZdXdpdVdhMHNFVGZkMlNwNHhyQllV?=
 =?utf-8?B?b0NUY0c5RWdPL2lmc0FsNXNTNWIrV25Qc0dkSlJ6eUl0dzhzMnVkNVZBbWs0?=
 =?utf-8?B?OFB6UTBlZDB2NTJoYnVmZmxaMi9UdGs0a0d3VU5zekxvR082YnQ1a2k4aE94?=
 =?utf-8?B?dVAvUVZ6YlMvTFQxSTdiTUU0WDJxbk04dGFCVWtQaml3UE1WVG9ac0ZuaEhH?=
 =?utf-8?B?VldHM1k1eldNSFBIdnFLVTJOcDVzR2lIdVZPU2MvcE5sU0pXcUxPUUoxZkJJ?=
 =?utf-8?B?YlhnbngzRkwxWjhXK2RneTVuZC9nWWNXRW9ocFhpUStPMElFMG1mM0ZZYnV6?=
 =?utf-8?B?Q0lxb2RIUStLUWpLUFpiZnV1WVNhVEEyeEFwejBveXQxa1RaNVVyYnlMQWJP?=
 =?utf-8?B?NEErKzkrV2ZVU25GaHM3LzBINUJQb0Nna2kvMXE0ajZ2OWJrQXlDNUg5SlFz?=
 =?utf-8?B?RmZjMnBWSGNYMHVHTElXRC9MLzFHNjdYSmtYZ1BNY3UvVUZtV2ZkWGpuSm52?=
 =?utf-8?B?azRCL2xaL3pzKzBpcVQ0cnJLaUt5QkFRT29GTW4wOGduSUNjTEgyZUloeTA2?=
 =?utf-8?B?TGNWdjFPc2Mzc0Yvc3FKN21LcDMwc3ZvQUxiNUhpcEJkUG95VUJCQnF3eTV1?=
 =?utf-8?B?bGw3M2NDQjV0OWUwcjRmS09WUXJhR3VubXZHL1ZRU0xnYUVGY0FGUT09?=
X-Exchange-RoutingPolicyChecked: h3ToLo5vDGaBpVsv/KPsKXssL0Eie3KC6hO3Y4FDrH9zp6i3Y3cb/1k9p+0Y4H8qDcfo9sIRJ1Evku6dzBr8PAG028/Xl6Mi7jsTpHrXQMbvMH76L3PWAlXH33IYjBLQwpGrKbc8qsHho6sGjrevS1wJCOXm+j3db1bKP9rhP2uv4Ow853RytsXIL9E8OC3LtpVi+kI7AZXr265CZwE+2EW7pj9hjf4RZzUFZec3yyNFP+AFKjEZq8q4PrlAixFRt/yVRDuM+1C5N+KuZQX1WHrXohgmSYyDRUuSZs9ovAp1FfEz3UnzbG7JidDOi/ylXXKEcn4drOm3KK7IsB3dEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0552fa6-2236-4098-ed55-08def1e095ad
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 04:26:42.3302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7Phdz0UBofKS8wDklLBs+LYjka0oxuh0StZdYThMLI3jFuEkeHDFRR3mJrGuUNcq1mpIFqyWgENE4YzExZ8AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
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


On 8/4/2026 2:55 AM, Jia Yao wrote:
> Both flags split the buffer in half with madvise, creating a bo_size/2
> VMA fragment.  On PVC (NEED64K) drm_gpusvm requires chunks >= 64K, so
> with bo_size=SZ_64K the 32K fragment causes -EINVAL, a GPU CAT error
> and EIO from xe_wait_ufence.
>
> Add both flags to the existing SZ_128K condition so each half is exactly
> 64K on NEED64K platforms.
>
> Fixes: 022265cb9ebcb199 ("xe_exec_system_allocator: fix PREFETCH_SPLIT_VMA bo_size for PVC")
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 50cd6ead7..6ca53aa5f 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2814,8 +2814,18 @@ int igt_main()
>   				 * and migrates the first half. On platforms with
>   				 * 64K VRAM granularity (e.g. PVC), each half
>   				 * must be >= 64K, so use SZ_128K as bo_size.
> +				 *
> +				 * MADVISE_MULTI_VMA applies madvise on
> +				 * data+bo_size/2 for bo_size/2 bytes, and
> +				 * PREFETCH_SAME_ATTR applies madvise on data
> +				 * for bo_size/2 bytes after a full-buffer
> +				 * prefetch.  Both create a bo_size/2 VMA
> +				 * fragment; on NEED64K platforms that fragment
> +				 * must be >= 64K, so use SZ_128K for them too.
>   				 */
> -				size_t bo_size = (s->flags & PREFETCH_SPLIT_VMA) ?
> +				size_t bo_size = (s->flags & (PREFETCH_SPLIT_VMA |
> +							      MADVISE_MULTI_VMA |
> +							      PREFETCH_SAME_ATTR)) ?
>   						 SZ_128K : SZ_64K;
>   
>   				test_exec(fd, hwe, 1, 1, bo_size, 0, 0, NULL,

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

