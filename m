Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108EEF0182E
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 12:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A6710E1EC;
	Fri,  6 Mar 2026 12:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vrt1EOlm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFB510E1EC
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772801303; x=1804337303;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8tRtmPdAbWSZgWiiitlO7AmuWKzxnGiNjGMWHuon/ZY=;
 b=Vrt1EOlmfs8xvgusnvWpR5tLgb9lORm5OZVf2rNI2kNsOmudITEdHC2n
 9+BdB2/4CS8/XEt3hDN38Isx8KTdd5pSt6P31jZFuYVpbOVawb8YjLxjp
 TvdgPZknNnTvfjZyuSMER7/e9O4R6sOEngNOCTdmlLsoNgTE3TbXK9Oua
 npWUORQ4qvAYTwznFCpB74/gVdGhhinBLjVkl+bhCFq7WGRtY2RYFMlV+
 d8JXAN9IrYN5nHpL4bUqp65HBaq4UwbKM25y1g7Xlrtk+KquaYYzxGmMr
 BdzgR/Hg12TkXqoKmksYlJwiieXH5B/Tt49ved1cE4Ig03+Zh2fFaDSQw g==;
X-CSE-ConnectionGUID: BqQXnKmFSS2hqfHgbNPQPA==
X-CSE-MsgGUID: CPV32m96QTWgXCzjmMWxSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77777881"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="77777881"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 04:48:23 -0800
X-CSE-ConnectionGUID: tAzsfKsUTX6HzuIeMySatA==
X-CSE-MsgGUID: dnDd5CWgQF6sIdpAzHjJzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="223124410"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 04:48:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 04:48:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 04:48:22 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 04:48:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAPK4CP8zFIjoCMULIaNKpHzLDsGQTEl7OpFNooahH4NCNTXDoJFK80EdWgdtKQefuJ2DJT67Lv5jiXl1/pYMi29pwgDgL9hM2+JekJUKiLT1objVTMp7g3eUlG41LRLYZ+DXYJFhC4E+flk6Z2n8L+pU7LQObDm7xa6UTxQ8GZ65Hk+zi+V2UYJelcvADP6Kv+22NehGihy+5T6R+x+kdgidxy4yxFtD5TQjkNi8v6niwJQfYUe5hRoyDh3uhgYxJ/YGFPLFqD7Of8MeDeHzIU+ToFkgzf5os0U59jh8akE63DzGe7K4HpwegalISMJZqXL7ATUqASLiYSLk6objg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xx7g54P3klNHLgVz9TlV0/2BvBmBkF2KlRyBU68pMDw=;
 b=giPcCkZGWu/eGoYA9Cz+IZ2/3AxPVnan3kE9KysElC48loupAu9A7ZsZvJNvkOpGxuDezGMl4q+ylTVUu82U1oXC0bEzVD/2BGgkPakjPJ/b+CieJiRRf3I6apDbIAgSE3uUW3XIGgfstEqXTPqsyKSui4fht+g4E25B7cx9B3f0P0ovEZubaoEtyEwTgmGSM+S8yrrqMmge1tuGknT8p1wHkuZelQ/dX273QIVX+XoXeWCA5hSmSLkNzUXxYm7Eo1yLJGKE0GB3nSt2qqFSG9CyykMWaryHUQN35VzqWcJxaKC2lcOCYkN080GCa6ACQEpDeVkBCVroyl/QpzPYMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by SA1PR11MB8796.namprd11.prod.outlook.com (2603:10b6:806:467::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 12:48:19 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:48:19 +0000
Message-ID: <af60b487-1c7d-443e-8661-e47d7e188b32@intel.com>
Date: Fri, 6 Mar 2026 18:18:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 2/2] tests/intel/xe_vm: Add support for
 overcommit tests
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>,
 <thomas.hellstrom@intel.com>
References: <20260304110501.1193980-1-sobin.thomas@intel.com>
 <20260304110501.1193980-3-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260304110501.1193980-3-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::25) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|SA1PR11MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: 678ba59d-5e06-4256-8e13-08de7b7ea46c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: cs5e+ybfzwda6f3xyz4u1PZHkR2P1t/oYckEV0YtbWGL5d2KENj5sOnlWvSpJ8VO1gbFMYaq7IVf11nIijAhhps5I9gzanYxxbNGqceGw5YkxnlmizYZgh74Lz8ahtLxoAUCS8fl5Du4tgdD6FJZbyWgaceaoy0AZ8svVenjGozBo8XWFwxTk8zd4j515I/LS6VE/U9iHChR3ZsHiAIrAOXS4jfAbNk92OsRgWyFFyl3zOP/bcUVPs8ecsb0qZaB9jxiqQTSBFtjPJQ+DgN6QaX5EKHaMBIFvJ0uT6Kk0gAf8vvWkVUVaxtVI5yuesU8o0+HMqBfQoD0YRC6Ih1PIdPqHp3HfcTQVmQ1B2RdF/9Ls9c4+sgtHwPArRUbt05qJRGGxkQqewTk6mGh6hNkoKn3SOxy4YhSyxE0+9RVThaxcZnxX4rDPBaoa6mP16ux21jtxld+DvuW592tG48INOyWIIpCyXld7Q3VuVi6Xc44deSxyOkfQNhpBF7IYCOtDEnblIr8qDOCRlOgVjMWKQY7EVVZRqAo8JTMa9D++YfvTKSZNN/Tz8zigL6StLTJtxIGM0dQiohCy2oUWFYYxZNJNXNHEeMg0bZ1kQrfjE2sskv+34g4saeKOAFYk9uLQhb/vNM6/yWjyTTb8aCEfHavKm9F8eEj1Bnzs6rrzytnOhTAUyyEk5XDD7SrAYFxu42blCdEsMjgRfHgS8M+Co61UVIEIxs8fnyLqBub4Mw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTFSLzRvNWhoVU9CTlNnQThYME5jQ2xoSEtKQ3B2N0FPbnBCSlRML2wwTDNI?=
 =?utf-8?B?Y0VhdjBYQkFveUNIcVhySUpjRG9QbUNmazEzM0FTWkQzZ0NkTHo4RFN4cGd3?=
 =?utf-8?B?dk5jSm93ckl0WEk3eXVhaFRRMXRNM3FBQkowTTBaNmNhOWt5eDh5UmlHQzRq?=
 =?utf-8?B?cjlBYTNEdm0yN2JUa0g2RDlPaEYxL0t0SThQNk4xdHdReEF1RE9vNjNHRm5V?=
 =?utf-8?B?a2FndUJjMWoyNFdxS3puUjdzTUUrNElwbGlvdnJjTkd2U1p6cG9tTnBzUHYv?=
 =?utf-8?B?ekQ1eUtxQWVseFh1bEE0YS94Mk1neXJpOTFWN3FHM0p2U1k2Z0RvWlNTbkR5?=
 =?utf-8?B?K1hMNWFHOEdlNFl2aTllNVAxWDc4bmZpUFlIWXhBZUZYTmY4SzJWeDhuMGxq?=
 =?utf-8?B?MktOL3d4YVJESkZvVXMyN1RyVmlCTVdUUnk5ZUhpVS9UUzh1WnkyRUlqU3Vy?=
 =?utf-8?B?ZVpOT1VLaVVQNk5ZbGJ2TUpVeWxnaU1mamM1MjJzQTNzVS8vZG1vemU0aGha?=
 =?utf-8?B?WmU0aXBsZW50L2NSUWFYd2FpN09DZUdIMklUeXZ3VW1Yanp2czFZVFRzemMy?=
 =?utf-8?B?QnNTNUZpRmlNdnNZajNXNmZFYm5zdk5WakpMcWNaQzdPL2VUdGVoemE2UmpQ?=
 =?utf-8?B?Z28vVjFJQVFoMSt2bXAvaDZhNjNBT283amF0UUxiM2xicFJUaC9LcUhHSlE3?=
 =?utf-8?B?L2M2aG8vUUNWNWt6dW1KY3BJRStQclNsYS9JUDNqM1ZYYlNmWEhObDcxZFp3?=
 =?utf-8?B?N3BlNmZGL0k2T2licW54b0hWR2E5eDR3NTBDNFI1SWZGdUl1ay8ybjJRMDE5?=
 =?utf-8?B?ZDVLckVPN2RNcjRKcWZPR0pQTjlNZEY4cVg2aW5aM2xDVXpSeDBoREtxZG9z?=
 =?utf-8?B?Z21UT1YyYmVKYWp1eVdPWmNOaGpZOFg3TVlUbTBrM1U5d1BtVlh4WlNlVG9j?=
 =?utf-8?B?Q0IxTE5NS1BYNXA3LzhPcmFlaS9zdGdTQ1l3TkRhMlJNWXRvc2YwMlIrbWJr?=
 =?utf-8?B?b1h2dzNqMi90NzNvOGw4RXAyU3N6ZFBzU2RxN2tXN2hoLzE3OG5lanJ6ekNV?=
 =?utf-8?B?L1RXUDUxc1lBSStpTlFmZjUxbjkvNXdUQ2VHR2owTlM4cUVKUnpWMndqdkdC?=
 =?utf-8?B?dStnMFB3MFFiWXRqSW4xaDNxQnZCekdxeTd5Z3N1N0lWaDRIV2NvL0U2ZFZ5?=
 =?utf-8?B?a2pFWnpLQnZpVU1KOHN5bSt5clFrRmREcUE4Q1FwV2VwY3BKSFRwVjVXZSt0?=
 =?utf-8?B?ejZUQ0tBd2tsbWxlcnlEY25DVE1ZK1NPditBV3BGK2NJYkVkUEY3Rk9iWlFQ?=
 =?utf-8?B?bzFscXBhM1p4Q3dqc2xCVUlNRndob1I5Zm9UY2VTcFpvTWJRQ0VRWWhzRUdq?=
 =?utf-8?B?M083VWh3bkkvOW5obmZUMFNIQXNmdEVOQ3NkM1llVk5ybHd6aHV4Zk5oMHF5?=
 =?utf-8?B?b1ZRbHdpNkxYSGxHbEVrUFBlQktqamFCaGw1YkFIVUpxMld3LytWY2NHQ01D?=
 =?utf-8?B?bndUYUdYdjVhYW05Mk9vYVRiVnEyMU9aWWNIdjFqY0lOZTlGZUdPYk5kRkll?=
 =?utf-8?B?REN2K2ozNmxqMjQxWlU1bUtqekRBSXVzVnorT3o2RFhBbitZTGNBUHN3ODdi?=
 =?utf-8?B?QVF1dlJ4K3I4akx4NUs5Y1pvWGR5MFdEY202NlpxeERpRmphbTk5RTJKcCtI?=
 =?utf-8?B?OTJYdG82cE13OVVRblNnSzZ3YUNaWDV5SVdXTitSaXQwOFF3SEhtWnArSzdT?=
 =?utf-8?B?dkdCVlczQzNIRmQ3d1JGR2NwME0zMjlZNE9pczU0N3FRN28xNHA3cWVXVjhy?=
 =?utf-8?B?TkNQVE9YZEdkSEhaSUU0UmVENld0STZvVWVyRnJJdkhzTTFrSGhoV3BqZGFz?=
 =?utf-8?B?U1RaNGQrSFJiZTIzaEFNZG01UXhrVVpJTE45MTdJQ0M2YlB4NXc4Z0VENjI4?=
 =?utf-8?B?bUhYNkhsUW9GVzRoYXlmZWhRSldjL091TThvODErcWhuanBNblBQMTVMd1hi?=
 =?utf-8?B?OGxtaytLN3VtTFAwc1NkbE5pbkNja0N6SDdDRm1SOVI2cENja2RQRUIzKzJ4?=
 =?utf-8?B?WGdVY3Bsa2c0SlRqb2svbk1nak0rSzlEK1lqM09nN2prNVZ4QlNVSDJROFQy?=
 =?utf-8?B?Z3V4QVkyTkE2RGllSEIwanRWUFpqNXJpN2hnaEN2SnU5MEtDSlhhaStTU0Vz?=
 =?utf-8?B?TlYrQ2tEWXBsVFlVbXo1R2NSUnpCVEhMNWV2TEkveDhBNHlHMHVGY1VqRTNM?=
 =?utf-8?B?MEh6dUZmYjZJWFltWUZldHpiUUpWTTZmRjhRN21RWVdHNTdma2NqdG1oYjEz?=
 =?utf-8?B?R2NwRUowZ205N1NZamZKNkJrWHBHSkVOdnY0STNPTHR1SC9FOTNMN3MyUDNZ?=
 =?utf-8?Q?jDGXdah8aJ5CG9Do=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 678ba59d-5e06-4256-8e13-08de7b7ea46c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:48:19.0103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qX9v0Sj9YAfnHLrvllk6Gi1kJjLx3PxUzbeYxWWAVLOnE1W0lY/UfthB5htM2zSBkhoAcnZSoWM3+2boEs7Jxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8796
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


On 3/4/2026 4:35 PM, Sobin Thomas wrote:
> Current tests focus on VM creation with basic mode selection and do not
> support overcommit scenarios.
>
> This change adds tests to verify overcommit behavior across different VM
> modes.
>
> Non-fault mode tests:
>   - vram-lr-defer: DEFER_BACKING rejects overcommit at bind time
>   - vram-lr-external-nodefer: Long-running mode with defer backing
As per test name vram-lr-external-nodefer: Shouldn't it be Long running 
mode with no defer backing?
>   - vram-no-lr: Non-LR mode
>
> Fault mode tests:
>   - vram-lr-fault: Fault handling allows graceful overcommit via page
>     faults
>   - vram-lr-fault-no-overcommit: Verifies NO_VM_OVERCOMMIT blocks same-VM
>     BO eviction during VM_BIND while still allowing eviction during
>     pagefault OOM
>
> These tests validate that VMs handle memory pressure appropriately based
> on their configuration—rejecting at bind, failing at exec, or handling
> it gracefully via page faults.
>
> v2 - Added Additional test cases for LR mode and No Overcommit.
>   
> v3 - Refactored into single api call  based on the VM / BO Flags.
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_vm.c | 494 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 494 insertions(+)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index ccff8f804..61853a425 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -2376,6 +2376,488 @@ static void invalid_vm_id(int fd)
>   	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, ENOENT);
>   }
>   
> +static int wait_fault(int fd, uint32_t exec_queue, void *sync_data,
> +		      int64_t *timeout)
> +{
> +	uint64_t *user_fence = sync_data;

avoid using extra variable instead use sync_data directly in 
xe_wait_ufence wit typecast

__xe_wait_ufence(fd, (uint64_t *)sync_data, USER_FENCE_VALUE, 
exec_queue, &wait_ns);

> +	int64_t wait_ns = timeout ? *timeout : INT64_MAX;
> +	int res;
> +	#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
> +	(void)exec_queue;
> +
> +	res = __xe_wait_ufence(fd, user_fence, USER_FENCE_VALUE, exec_queue, &wait_ns);
> +
> +	return res;
> +}
> +
> +static int wait_nonfault(int fd, uint32_t exec_queue, void *sync_data,
> +			 int64_t *timeout)
> +{
> +	struct drm_xe_sync *exec_sync = sync_data;
Avoid extra pointers, directly use sync_data below in syncobj_wait
if (!syncobj_wait(fd, (uint32_t *)sync_data, 1, INT64_MAX, 0, NULL))
> +
> +	(void)exec_queue;
> +	(void)timeout;
> +
> +	if (!syncobj_wait(fd, &exec_sync[0].handle, 1, INT64_MAX, 0,
> +			  NULL))
> +		return -1;
> +
> +	return 0;
> +}
> +
> +static int
> +vm_overcommit_create_bo(int fd, uint32_t vm, size_t bo_size, uint32_t bo_flags,
> +			uint16_t gt_id, bool use_vram, bool external,
> +			uint32_t *bo)
> +{
> +	uint32_t placement;
> +
> +	if (use_vram) {
> +		placement = vram_memory(fd, gt_id) ?: system_memory(fd);
> +		igt_debug("Using VRAM placement: 0x%x\n", placement);
> +	} else {
> +		igt_debug("Placement is in system memory\n");
> +		placement = system_memory(fd);
> +		igt_debug("Using system memory placement: 0x%x\n", placement);
> +	}
> +	igt_assert_f(placement != 0, "Invalid placement: system_memory(fd) returned 0\n");
> +
> +	return __xe_bo_create(fd, external ? 0 : vm, bo_size, placement,
> +			      bo_flags, NULL, bo);
> +}

> +
> +/**
> + * SUBTEST: overcommit-fault-%s
> + * Description: Test VM overcommit behavior in fault mode with %arg[1] configuration
> + * Functionality: overcommit
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @vram-lr-fault:VRAM with LR and fault mode, expects exec to pass
> + * @vram-lr-fault-no-overcommit:VRAM with LR, fault and NO_VM_OVERCOMMIT, expects bind rejection
> + */
> +
> +/**
> + * SUBTEST: overcommit-nonfault-%s
> + * Description: Test VM overcommit behavior in nonfault mode with %arg[1] configuration
> + * Functionality: overcommit
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @vram-lr-defer:VRAM with LR and defer backing, expects bind rejection
> + * @vram-lr-external-nodefer:VRAM with LR and external BO without defer, expects exec fail
> + * @vram-no-lr:VRAM without LR mode, expects exec to fail
> + */
> +struct vm_overcommit_case {
> +	const char *name;
> +	uint32_t vm_flags;
> +	uint32_t bo_flags;
> +	bool use_vram;
> +	bool external;
> +	uint64_t data_addr;
> +	uint32_t pat_index;
> +	double overcommit_mult;

why double data type? We deal with memory in Bytes/KB/MB/GB which is 
either int or bigger data type depending upon size. we can make it 
simple int as this is only multiplier.

Also this multiplier is used to get overcommit_size below which is 
uint64_t type

> +};
> +
> +static const struct vm_overcommit_case overcommit_cases[] = {
> +	/* Case 1: DEFER_BACKING */
> +	{
> +		.name = "vram-lr-defer",
> +		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
> +		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
> +			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +		.external = false,
> +		.use_vram = true,
> +		.data_addr = 0x1a0000,
> +		.pat_index = DEFAULT_PAT_INDEX,
> +		.overcommit_mult = 2.0,
> +	},
> +	/* Case 1b: External BO without defer backing */
> +	{
> +		.name = "vram-lr-external-nodefer",
> +		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
> +		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +		.external = true,
> +		.use_vram = true,
> +		.data_addr = 0x1a0000,
> +		.pat_index = DEFAULT_PAT_INDEX,
> +		.overcommit_mult = 2.0,
> +	},
> +	/* Case 2: LR + FAULT - should not fail on exec */
> +	{
> +		.name = "vram-lr-fault",
> +		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> +		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +		.external = false,
> +		.use_vram = true,
> +		.data_addr = 0x300000000,
> +		.pat_index = 0,
> +		.overcommit_mult = 2.0,
> +	},
> +	/* Case 3: !LR - overcommit should fail on exec */
> +	{
> +		.name = "vram-no-lr",
> +		.vm_flags = 0,
> +		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +		.external = false,
> +		.use_vram = true,
> +		.data_addr = 0x300000000,
> +		.pat_index = 0,
> +		.overcommit_mult = 2.0,
> +	},
> +	/* Case 4: LR + FAULT + NO_VM_OVERCOMMIT */
> +	{
> +		.name = "vram-lr-fault-no-overcommit",
> +		.vm_flags = DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT | DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> +		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
> +			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +		.external = false,
> +		.use_vram = true,
> +		.data_addr = 0x300000000,
> +		.pat_index = 0,
> +		.overcommit_mult = 2.0,
> +	},
> +	{ }
> +};
> +
> +static void
> +test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
> +		   const struct vm_overcommit_case *c,
> +		   uint64_t system_size, uint64_t vram_size)
> +{
> +	uint64_t overcommit_size;
> +	uint32_t vm;
> +	uint32_t *bos;
> +	int num_bos;
> +	uint64_t off;
> +	size_t nf_bo_size = 64 * 1024 * 1024;  // 64MB per BO
> +	uint32_t batch_bo;
> +	size_t sync_size;
> +	uint32_t bind_exec_queue;
> +	uint64_t sync_addr = 0x101a0000;
> +	uint64_t batch_addr = 0x200000000;
> +	uint64_t data_addr;
> +	uint32_t exec_queue;
> +	uint64_t stride = 1024 * 1024;
> +	int64_t timeout = 20 * NSEC_PER_SEC;
> +	int i, b;
> +	int create_ret;
> +	int64_t ret;
> +	int bind_err;
> +	int res;
> +	uint64_t base_size;
> +	bool overcommit_detected = false;
> +	bool is_fault_mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) != 0;
> +	bool is_lr_mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) != 0;
> +	uint64_t lr_vm_sync = 0;
Small nitpicks: Same data type variables can be put in single line, Also 
line length limit of 100 shouldn't be crossed
> +	struct drm_xe_sync bind_sync[1] = {
> +		{
> +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value = USER_FENCE_VALUE
> +		},
> +	};
> +	struct drm_xe_sync lr_sync[1] = {
> +		{
> +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value = USER_FENCE_VALUE,
> +			.addr = to_user_pointer(&lr_vm_sync),
> +		},
> +	};
> +
> +	#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
use macro outside of the function for better readability
> +
> +	/* For fault mode: user fence, for non-fault mode: syncobj */
> +	struct drm_xe_sync exec_sync[1] = {
> +		{
> +			.type = (is_fault_mode || is_lr_mode) ?
> +				DRM_XE_SYNC_TYPE_USER_FENCE : DRM_XE_SYNC_TYPE_SYNCOBJ,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value = (is_fault_mode || is_lr_mode) ? USER_FENCE_VALUE : 0,
> +		},
> +	};
if structure size is > 1 then array of structure solves purpose, looks 
for addressing purpose it's done
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(exec_sync),
> +	};
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +		uint64_t vm_sync;
> +	} *batch_data;
> +	uint64_t *user_fence_sync = NULL;
> +
> +	data_addr = c->data_addr;
> +
> +	base_size = c->use_vram ? vram_size : system_size;
> +	overcommit_size = (uint64_t)(base_size * c->overcommit_mult);
See comment above for overcommit_mult data type.
> +	overcommit_size = ALIGN(overcommit_size, 4096);
> +	if (overcommit_size > system_size) {
> +		igt_debug("Limiting overcommit size from %llu MB to %llu MB\n",
> +			  (unsigned long long)(overcommit_size >> 20),
> +			  (unsigned long long)(system_size >> 20));
> +		overcommit_size = ALIGN(system_size, 4096);
> +	}
> +
> +	num_bos = (overcommit_size / nf_bo_size) + 1;
> +	bos = calloc(num_bos, sizeof(*bos));
> +	igt_assert(bos);
> +
> +	igt_debug("Overcommit test: allocating %d BOs of %llu MB each",
> +		 num_bos, (unsigned long long)(nf_bo_size >> 20));
> +	igt_debug(" total=%llu MB, vram=%llu MB\n",
> +		 (unsigned long long)(num_bos * nf_bo_size >> 20),
> +		 (unsigned long long)(vram_size >> 20));
> +	/* Create VM with appropriate flags */
> +	vm = xe_vm_create(fd, c->vm_flags, 0);
> +	igt_assert(vm);
> +	bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0);
> +	/* For fault mode: create user fence sync area */
> +	if (is_fault_mode) {
> +		sync_size = sizeof(uint64_t) * num_bos;
> +		sync_size = xe_bb_size(fd, sync_size);
> +		user_fence_sync = mmap(NULL, sync_size, PROT_READ | PROT_WRITE,
> +				       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +		igt_assert(user_fence_sync != MAP_FAILED);
> +		memset(user_fence_sync, 0, sync_size);
> +	}
> +	/* Create and bind BOs */
> +	for (i = 0; i < num_bos; i++) {
> +		struct {
> +			uint64_t vm_sync;
> +		} *data;
> +
> +	/* Create BO using the case's create function */
> +		create_ret = vm_overcommit_create_bo(fd, vm, nf_bo_size, c->bo_flags,
> +						     eci->gt_id, c->use_vram, c->external, &bos[i]);
> +
> +		if (create_ret) {
> +			igt_debug("BO create failed at %d/%d with error %d (%s)\n",
> +				  i, num_bos, -create_ret, strerror(-create_ret));
> +			igt_assert_f(create_ret == -ENOMEM || create_ret == -ENOSPC ||
> +				     create_ret == -E2BIG || create_ret == -EPERM,
> +				     "Unexpected error %d (%s)\n",
> +				     -create_ret, strerror(-create_ret));
> +			overcommit_detected = true;
> +			num_bos = i;
> +			break;
> +		}
Do you want to continue execution after create_ret != 0? If yes then 
igt_assert will halt execution if above condition not met and other 
variables will not be set as mentioned
> +
> +		/* Map and bind BO */
> +		data = xe_bo_map(fd, bos[i], 4096);
> +		memset(data, 0, 4096);
> +		bind_sync[0].addr = to_user_pointer(&data->vm_sync);
> +
> +		bind_err = __xe_vm_bind(fd, vm, bind_exec_queue, bos[i], 0,
> +					data_addr + (i * nf_bo_size), nf_bo_size,
> +					DRM_XE_VM_BIND_OP_MAP, 0, bind_sync, 1, 0,
> +					c->pat_index, 0);
> +
> +		if (bind_err) {
> +			igt_debug("Bind failed at %d/%d with error %d (%s)\n",
> +				 i, num_bos, -bind_err, strerror(-bind_err));
> +			igt_assert_f(bind_err == -ENOMEM || bind_err == -ENOSPC ||
> +				     bind_err == -EPERM,
> +				     "Unexpected bind error %d (%s)\n",
> +				     -bind_err, strerror(-bind_err));
> +			munmap(data, 4096);
> +			gem_close(fd, bos[i]);
> +			bos[i] = 0;
> +			overcommit_detected = true;
> +			num_bos = i;
> +			break;
> +		}
See comment above, if assertion happens execution will be halted. 
freeing memory, setting variables should be done before assertion
> +
> +		xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE,
> +			       bind_exec_queue, 20 * NSEC_PER_SEC);

Before xe_wait_ufence() you should check if data->vm_sync already 
matching USER_FENCE_VALUE

if (*data->vm_sync != USER_FENCE_VALUE)

     xe_wait_ufence()

data->vm_sync = 0;

> +		munmap(data, 4096);
> +
> +		igt_debug("Created and bound BO %d/%d at 0x%llx\n",
> +			  i + 1, num_bos,
> +			  (unsigned long long)(data_addr + (i * nf_bo_size)));
> +	}
> +	if (overcommit_detected) {
> +		igt_debug("\nOvercommit correctly rejected at BO creation/bind (created %d BOs)\n",
> +			 num_bos);
> +		goto cleanup;
> +	}
if assertion happens above then overcommit_detected will never be 
executed as assertion will halt further execution
> +
> +	 /* Create batch buffer */
> +	batch_bo = xe_bo_create(fd, vm, 0x1000, vram_memory(fd, eci->gt_id),
> +				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	igt_debug("\n Mapping the created BO");
> +	batch_data = xe_bo_map(fd, batch_bo, 0x1000);
> +	memset(batch_data, 0, 0x1000);
> +
> +	/* Bind batch buffer and sync areas */
> +	if (is_fault_mode) {
> +		batch_data[0].vm_sync = 0;
> +		bind_sync[0].addr = to_user_pointer(&batch_data[0].vm_sync);
> +
> +		xe_vm_bind_userptr_async(fd, vm, bind_exec_queue, to_user_pointer(user_fence_sync),
> +					 sync_addr, sync_size, bind_sync, 1);

if (batch_data[0].vm_sync != USER_FENCE_VALUE)

     xe_wait_fence();

batch_data[0].vm_sync = 0

> +		xe_wait_ufence(fd, &batch_data[0].vm_sync, USER_FENCE_VALUE, bind_exec_queue,
> +			       NSEC_PER_SEC);
> +
> +		xe_vm_bind_async(fd, vm, bind_exec_queue, batch_bo, 0, batch_addr, 0x1000,
> +				 bind_sync, 1);
> +		xe_wait_ufence(fd, &batch_data[0].vm_sync, USER_FENCE_VALUE,
> +			       bind_exec_queue, NSEC_PER_SEC);
see above
> +	} else if (is_lr_mode) {
> +		/* LR mode without fault - bind batch using user fence */
> +		lr_vm_sync = 0;  /* Reset before use */
> +		lr_sync[0].addr = to_user_pointer(&lr_vm_sync);
> +		bind_err = __xe_vm_bind(fd, vm, 0, batch_bo, 0, batch_addr, 0x1000,
> +					DRM_XE_VM_BIND_OP_MAP, 0, lr_sync, 1, 0, c->pat_index, 0);
> +		if (bind_err) {
> +			igt_debug("Batch buffer bind failed with error %d (%s) - skipping GPU test\n",
> +				 -bind_err, strerror(-bind_err));
> +			goto cleanup;
> +		}
> +		xe_wait_ufence(fd, &lr_vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
Although lr_vm_sync is not reused but better after xe_wait_ufence 
operation set lr_vm_sync = 0, applicable to all
> +	} else {
> +		igt_debug("\n Going for vm bind sync");
> +		xe_vm_bind_sync(fd, vm, batch_bo, 0, batch_addr, 0x1000);
> +	}
> +
> +	igt_debug("VM binds done - batch_bo at 0x%llx\n", (unsigned long long)batch_addr);
> +	/* Create exec queue */
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +
> +	/* Setup sync for exec */
> +	if (is_fault_mode) {
> +		exec_sync[0].addr = sync_addr;
> +	} else if (is_lr_mode) {
> +		/* LR mode - use batch_data->vm_sync (GPU accessible memory) */
> +		batch_data->vm_sync = 0;
> +		exec_sync[0].addr = to_user_pointer(&batch_data->vm_sync);
> +	} else {
> +		exec_sync[0].handle = syncobj_create(fd, 0);
> +	}
> +
> +	/* Use GPU to write to each BO */
> +	for (i = 0; i < num_bos; i++) {
> +		igt_debug("Writing to BO %d/%d via GPU\n", i + 1, num_bos);
> +
> +		for (off = 0; off < nf_bo_size; off += stride) {
> +			uint64_t target_addr = data_addr + (i * nf_bo_size) + off;
> +
> +			b = 0;
> +			batch_data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +			batch_data->batch[b++] = target_addr & 0xFFFFFFFF;
> +			batch_data->batch[b++] = (target_addr >> 32) & 0xFFFFFFFF;
> +			batch_data->batch[b++] = 0xBB;
> +			batch_data->batch[b++] = MI_BATCH_BUFFER_END;
> +
> +			/* Reset sync for next exec */
> +			if (is_fault_mode) {
> +				user_fence_sync[0] = 0;
> +			} else if (is_lr_mode) {
> +				batch_data->vm_sync = 0;
> +			} else {
> +				if (off != 0 || i != 0) {
> +					igt_assert(syncobj_wait(fd, &exec_sync[0].handle,
> +								1, INT64_MAX, 0, NULL));
> +				}
> +				syncobj_reset(fd, &exec_sync[0].handle, 1);
> +			}
> +
> +			/* Submit batch */
> +			exec.exec_queue_id = exec_queue;
> +			exec.address = batch_addr;
> +
> +			res = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
> +			if (res != 0) {
> +				if (errno == ENOMEM || errno == ENOSPC) {
> +					igt_debug("Expected fault/error: %d (%s)\n",
> +						 errno, strerror(errno));
> +					goto gpu_done;
> +				}
> +				igt_assert_f(0, "Unexpected exec error: %d\n", errno);
> +			}
> +
> +			/* Wait for completion using appropriate method */
> +			if (is_fault_mode) {
> +				ret =  wait_fault(fd, exec_queue, &user_fence_sync[0], &timeout);
> +			} else if (is_lr_mode) {
> +				timeout = 5 * NSEC_PER_SEC;
> +				ret = __xe_wait_ufence(fd, &batch_data->vm_sync, USER_FENCE_VALUE,
> +						       exec_queue, &timeout);
batch_data->vm_sync = 0;
> +			} else {
> +				ret = wait_nonfault(fd, exec_queue, &exec_sync[0].handle, &timeout);
> +			}
> +
> +			if (ret != 0) {
> +				igt_debug("Batch wait failed at BO %d offset 0x%lx\n",
> +					  i, off);
> +				goto gpu_done;
> +			}
> +		}
> +
> +		igt_debug("Accessed BO %d/%d via GPU\n", i + 1, num_bos);
> +	}
> +
> +	igt_debug("All batches completed successfully\n");
> +	/* Verify GPU writes */
> +	igt_debug("Verifying GPU writes to BOs...\n");
> +	for (i = 0; i < num_bos; i++) {
> +		uint32_t *verify_data;
> +		int errors = 0;
> +
> +		verify_data = xe_bo_map(fd, bos[i], nf_bo_size);
> +
> +		for (off = 0; off < nf_bo_size; off += stride) {
> +			uint32_t expected = 0xBB;
> +			uint32_t actual = verify_data[off / 4];
> +
> +			if (actual != expected) {
> +				if (errors < 5)
> +					igt_debug("Mismatch at BO %d offset 0x%llx\n",
> +						 i, (unsigned long long)off);
> +				errors++;
> +			}
> +		}
> +
> +		munmap(verify_data, nf_bo_size);
> +
> +		if (errors == 0)
> +			igt_debug("BO %d/%d verified successfully\n", i + 1, num_bos);
> +		else
> +			igt_debug("BO %d/%d had %d errors\n", i + 1, num_bos, errors);
> +	}
> +
> +gpu_done:
> +	igt_debug("Overcommit test completed\n");
> +
> +	/* Cleanup */
> +	if (!is_fault_mode && !is_lr_mode)
> +		syncobj_destroy(fd, exec_sync[0].handle);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_exec_queue_destroy(fd, bind_exec_queue);
> +	munmap(batch_data, 0x1000);
> +	gem_close(fd, batch_bo);
> +
> +cleanup:
> +	if (is_fault_mode && user_fence_sync)
> +		munmap(user_fence_sync, sync_size);
> +
> +	for (i = 0; i < num_bos; i++) {
> +		if (bos[i])
> +			gem_close(fd, bos[i]);
> +	}
> +
> +	free(bos);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   /**
>    * SUBTEST: out-of-memory
>    * Description: Test if vm_bind ioctl results in oom
> @@ -2850,6 +3332,18 @@ int igt_main()
>   		test_oom(fd);
>   	}
>   
> +	for (int i = 0; overcommit_cases[i].name; i++) {
> +		const struct vm_overcommit_case *c = &overcommit_cases[i];
> +		const char *mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) ?
> +					"fault" : "nonfault";
> +		igt_subtest_f("overcommit-%s-%s", mode, c->name) {
> +			igt_require(xe_has_vram(fd));
> +			igt_assert(xe_visible_vram_size(fd, 0));
> +			test_vm_overcommit(fd, hwe, c, (igt_get_avail_ram_mb() << 20),
> +					   xe_visible_vram_size(fd, 0));
> +		}
> +	}
> +
>   	igt_fixture()
>   		drm_close_driver(fd);
>   }
