Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574ABCCFA13
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 13:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F373210E233;
	Wed, 29 Apr 2026 13:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDGwnlOx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9256510E3DB
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777468318; x=1809004318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rTb6p71rBgxDGdLJEY5vsDf0MYbCl/pxYSLMTacqZcg=;
 b=bDGwnlOxpNBqEu8YmuHgZh+Ly6g4McFugdXS31T1uPTrHI7LGplTcTuI
 0ItDV0ClOhXMBkAL+qslltKe5Ch1Jhx5vP6/Dexq/e1MoAXtikuTc+lZ7
 hu/yE/4stqbx7e6/b52XSGc9l883MWsZ5pMoZC1PNmuycDIXACvNdpyWV
 XUNYBi7S06sQZLsWZBRT3g7cI8Ij6+R1FkXnXHDhEMbtdC7Q6aSZT+eZv
 xuHjtj5XLChU3QVbl+v0oO6acvnfnbqQF2uxiN7DBNiKQ1gl9dO1jgD96
 ImqEGFVcHtH2GiqhnorSsNOWiqeNjGMteYJLheCpQwfihLSSHIIoE9Qm9 g==;
X-CSE-ConnectionGUID: FL1JqrCASHmAzmC155VCWg==
X-CSE-MsgGUID: 90H+Ybp5ThWNkvv8eropLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77424287"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="77424287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 06:11:57 -0700
X-CSE-ConnectionGUID: JM/vbABURqShSgrI4aJD/A==
X-CSE-MsgGUID: JoDq7GnES4aeEA2iTXdWdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="238587653"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 06:11:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 06:11:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 06:11:56 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 06:11:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/Q8QwrnAW2DFjmuKVnMm/9gBETpJ09M62DYxVpCMcwaiS8pTbuAoamhyG6rbrYxfSNBugJqZbXZhPVi711+SMoJrQ/TgEO3cgbBuiJT+I5Vbi+TW4SKPsn1kffLxuuq+hszbLJRABdQX9QUmLSAjcz00edH+7hx5elTD0kH9fyxVxo68RQR6qx48Dc/Z56fCBQFVa55E8pQHXHheEY9IPzVnucnyo+oyVlVsEK00/DLeJY+BM4JhKvABEkBeMwkXyfaIKwurj0TFFa3xqEwYN8H6oLkWKkzKo4yzmqB6O67D1JlG+NANZ79czSDW2MSQqh2i6PjghWVmTyd4Yzi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/O9qTWSK2n6s7NCFOcyiiGINR7X/1ddamqj0L5NT3hc=;
 b=UKYq0Qcpg8tt/Pe9+M0ORZjrfs26FPkt93Ey3hpO8Cfgjt6HC8jppjsMN6mov0vzPuVaw7ShtiezaoCqBHqInf1RsbAyz6KtVOEg8aR7HDT3cEV32nAEQdRp5JIjcV3eQG3O1Y31vtxDCUf0w7Yw6Z0EM5Mc9SASqJ1xgADETYlv2fUXPlxPD97TRWAw5zFs+DzdJPgwdHdo4D+uelmfYqKDBiyDQiKsm6CptlEWXoRVZaZnZ+44G1drM4gKVL5KpN4IJLOOUnwcank7XXqMA8TUoGSnvekIGxnE923ucx4diaBJQ4yUOxjvaArZ/YfEzlnZP/3lOEhP/KAcDXN2rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by SJ5PPF162366726.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::813) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 13:11:53 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%3]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 13:11:53 +0000
Message-ID: <f6b0de92-94b4-4ec2-ab79-30f77c91fb2e@intel.com>
Date: Wed, 29 Apr 2026 18:41:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/intel/xe_madvise: Add atomic-global
 subtest
To: Varun Gupta <varun.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260423063904.3944005-1-varun.gupta@intel.com>
 <20260423063904.3944005-4-varun.gupta@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260423063904.3944005-4-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0097.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::12) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|SJ5PPF162366726:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1e9aa2-ac4c-47c6-8eca-08dea5f0e1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: nyQl8z05F5Xjs7owmbRTXH24PKffsVJvo113shELkTXgGquszs30uJ8Hbx/UcoC3k05sIhqx7lL6dWxP0umLMhiP+8ZkXXXqYG3/0pHOWViII1Ey5AcXVFCTCN/+iAkbMEJeoGOI6GejrWlpryUVvsrYxzQY6rbDuWSGMghTvMTXTvmAb6YnjdvqschUlRyIsGk9gW/AG3FfrsJ642JuXacAxMy2pizHMCx6UwjxffM8GM8MSTx+S9BUvDnjhwrY6VVTI0m42o0skWqRq76ZdtZJ3U6f3a7E4MJD4g5SO7aEe7KlAaMrfrRH3rkGxRnC1lq+ZzjdThYMBedXTZ9MvBoq4tZsSr3AbgDxvkRULfB/kFvPHuZvY4BkZM5rxn1jKe+gzpCctguFA5sZA13SdcCpevQwWOz/Nk8p4VO+tASlmr7wEZHsjZxQLVBZbRf5PJy2D/RbztexEEhoR7dPd9yEXrEEPJc/gFVZ2+grADeRg3d8k6pDIXuEsSisj3rUV4J5FdqOkX9Qk/WAWRcK6Uh9qyqhW78K08MVR9jehTjI6Byg85NOdZX4h7qBTRWNsU+TnwJHZW/Kd/5RRGL5b/MEz/Pw5sn3508/IdwNjph+VFbOtXRWjvYsinZpP8a+z2ud63aVI5Hyjy/JxHUmYULv2Szi3Iv7KD0E9RSlxxqMoRe7i0RASWSlTj+9nWrMX/4yOSvP2Vx/bpTbebHpthg0qm6DRcYbYqN2GDq12BA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0NZQ3kxSTF4V2wzMGxPVDlJeklGUEZqc1JVWmliOHRkcEFoWDYxdkppcU02?=
 =?utf-8?B?Q2pSVTFCZjM0Z0t5MFZJaXlUVHZsU2ZHWWdLYS8rNWh2c2l4eTRTWnk3cVNC?=
 =?utf-8?B?Qkw2MFY1ZEdoOFBTY3Z6Mlk4cHJHYWRrKzFZQ1AzWDY1UlRSZzRVL0xkeVo2?=
 =?utf-8?B?QlR5UDQ1NHpGTkhMMm95LzNscitmeEI4NDE1ZHFkVUNpUXhWc0RXV2hNcCtx?=
 =?utf-8?B?N203WUJiMFp2dUp6VXBPZ3BEU0pGQzI2L1dIUXJXVmU0QnZRWmtpNGZ3TVM3?=
 =?utf-8?B?dUhmaWVVL0JFKzVBenJGUzhGNkdDbGNXeTBkSnowQWF5WUs5UndlYU8ySFYx?=
 =?utf-8?B?TGE2UlNpV1hmaGR3cDA0Z0RhOXlkWEJmZUQzaHh5bFZJcmx0V3VkUExmVEZS?=
 =?utf-8?B?eDhMYjhObElGSjBDcXVlTHhvcjZQbGJCZWxvNStEd2NOTENaRlVxNnFibHpU?=
 =?utf-8?B?OStwWFJRWTBnRjdqMDZ4Z2hUL0o0TGg4UWV2Nk9WdnZKTWFmTzE4ZGtMTXZK?=
 =?utf-8?B?NGhUQXBjNm00TW5QTUVTSStuK1ZJUHZmSm8yQ0NKSjJhN0tGMUxiOVRtT0ZP?=
 =?utf-8?B?WHN4TWM5OVJmeXM1WEJTa1dhcUYvdXlBSlhtZlJRVWtMWGxmR1FsRzgyaDZU?=
 =?utf-8?B?V28rcWY2V1J1M3N2TEJOdjJDaGx5QTFZWE5TdUIvaHM0djRmaEkxYmY1ZHcz?=
 =?utf-8?B?VkVYbUx3bS9mOThxU09rSEFWaXB2SzErSlhSalZ6VHMvV1RXVEtZL1dmbHRs?=
 =?utf-8?B?WUh3Sm0zRzRyY3VZTnZWcVJXOVhuVGtMdm90bXo5ZWJXZ1c5WSt1dmUyVnlv?=
 =?utf-8?B?dkxWaUxoZTV5U0U4Y1FXbWFKbTZYcVVzL0p4dFk2alRzS0s3aCtHN1BQU0l2?=
 =?utf-8?B?dDhkd2M5Q3ZlMzI3aDVLVExjOUhqN1NDRDZpUHRiU1JVUFI4bG9nTFlDZmhj?=
 =?utf-8?B?aDZJb0VnUEZTZlRzN240WlU5THhEYnl2bTB4eFZ4LzJqdTRxM0M1MFJxTE5W?=
 =?utf-8?B?N0pDTmdHYnI2Q2RKOHJiM0JwVVEzYStqZlpRN0R6U2ZldnZJM1FlbUFabmZz?=
 =?utf-8?B?cXFZYmI4THFIRWtJRkJQWnFvS3ZrYzgyMERYd1krY2s2bE1PeFVwTDQ5SjhI?=
 =?utf-8?B?aWlzNjdJY3F4M1JZa3BpU1ZhSmk4L2EzQ0pUQmg2QUtvakI2eUNDSEVXdzFm?=
 =?utf-8?B?YlRZTDMraVpKT2xtWXVYeXVGWFNGakRwRUIyR3B2TEdDOWlLUmUzUlZHdXEw?=
 =?utf-8?B?UHFUVkdzdVdPeU9ZNjJvVjdhSGZnMGtVejduS0llWlVXWWNqZWN3U01CK2Zp?=
 =?utf-8?B?Um92eEM4OEdVUFUwMFpIbGhQa0pFemZtYktGMzR3RldHOVZqWE0yK2lMZk5S?=
 =?utf-8?B?cHd2d2hSY1BoZFZpSkZOVFRucTVncmFlVC9Qalc4Z1VDZUFTSjVFM3o4c2ox?=
 =?utf-8?B?MjIvNDZVSTFlaXZNNXVqcHJ6Qk5zdE9KWkh3d3QvYVVCTHpYR1d1Sm9VaDhv?=
 =?utf-8?B?dTNnUmNoN2l2ZERGM0YwM3RCZW5kOVMvd2hwZXdsa1pzcE1pN2pDQXlxUGF4?=
 =?utf-8?B?c00vUkozVGtLRGorVGZLT1ZHTjFwWUdDOEppamdSaWFTam1jcExzb01WSjlE?=
 =?utf-8?B?Y3p5ZzNtLzZRUTdTR285UXFlbU00Z1I3UzRQQ3AvQk42RHlQNm1kd1U5OWxH?=
 =?utf-8?B?aTh1UkJrRUdQLzNmVTVsWW1uVklVNnNSL3JhZzljTzR3OHhxc1B0ZmxpMEI5?=
 =?utf-8?B?a2lFSk5CSXJPMWxDSGx4SU53cDFnZWM3djI4T21uemN1OTFrSENkYXZRSkNy?=
 =?utf-8?B?bnlrQVJyVy92SDFrekVwVHFmdG40dXFMUWt4cFhnbWo3K3c2dE5aUGJYKzlZ?=
 =?utf-8?B?VXJicjJjTmg0QXhqZXYrVHg2c3ExdldkL1UrT1FRUUk3dk1LY01ILzMxNTZB?=
 =?utf-8?B?TDU1a0o2Rldsa29kRjJVYlIwdGhwbFNZWGtEUDZSdXp5aTcwNVlmajBkcU9r?=
 =?utf-8?B?Q3hSZVhacmFDWHNCOFRoUkFuYWYyM1dJZzBvRGtUdlNYM2NJNXpFc0V4SG8r?=
 =?utf-8?B?clVsNmRPb0pPR2dNYkdQOGpoMTVRR0VNMHhmSlRnVDlSdWJOT2hzVkpyakZG?=
 =?utf-8?B?WUozVGdEUXBQd3RwWlVOOG5KS2ZvbzFrUUpVdzQwV1l6WXVncDh3SG1uNU9L?=
 =?utf-8?B?bkhCRXc4Vk5tcHkxd0dOaHllSjRrakhDVlk1by9vY3d1NnhjemtqQ0Q2YSts?=
 =?utf-8?B?UjV6VWFLWHplSGtxUlVtRFFyTnY2d05EbmgxVkFvcWlVSnhrRFhOdXhDTUE3?=
 =?utf-8?B?ZmJSUW5TbzdtcjFCZTE3V2wvNmkvN1hIUGYwS3c4STJVcXRxUVh5T3kwc1pZ?=
 =?utf-8?Q?STmxyON6BbuW87C0=3D?=
X-Exchange-RoutingPolicyChecked: XR/aSaEoY65sTNIY6e6sVJ//D4t0rEt2dPXsTsXos+/xb1aRKPLeIe+WzoprmJnP4/hoQBzO/Dwaw+NSIFvGHP6R/5/MKfhzS0EM7n7e/AWOIQ7/uAbVfuFgxH3DxrjqenNR1efEFBOmg/0UQUjLi+vLZh//2QnwUl9HLvz43rI+0ToAjP+bp0Cxb78xAvjmGQsdmnAPY+oWiIbhaPioNfN7vd/6+PliXhbze6QemkhJu0lV1sy05b3+pCvurp0mxEXSIqN2wpEbSjvqz7hk1NUUXDnzWhoAJURqS15bGFSZEySO79E63xxYlZw4zby0gtwDecO+xTb3l05CnUvICw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1e9aa2-ac4c-47c6-8eca-08dea5f0e1cb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 13:11:53.4166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1KYbhRINPbcRhOaGOUBcvdAvc/SJOob+9aCmDPnhbatp2EnjkG0tGQDWB0N/MxHaBmcZs+9dPctqN+7cPG+Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF162366726
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


On 4/23/2026 12:08 PM, Varun Gupta wrote:
> Validate that madvise ATOMIC_GLOBAL permits both CPU and GPU atomic
> access on SVM memory.  The test sets ATOMIC_GLOBAL on heap-allocated
> memory, performs 100 CPU atomic increments while data resides in SMEM,
> then executes GPU MI_ATOMIC_INC which triggers the page-fault handler
> to migrate data to VRAM.  The final counter value must equal 101
> (CPU + GPU increments).
>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>   tests/intel/xe_madvise.c | 75 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 1f4fb16b9..c251186d3 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -865,6 +865,77 @@ static void test_atomic_device(int fd, struct drm_xe_engine_class_instance *eci)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: atomic-global
> + * Description: madvise atomic global supports both CPU and GPU atomic operations,
> + *		test does CPU atomic increments on SMEM then GPU MI_ATOMIC_INC
> + *		which triggers fault-driven migration to VRAM
> + * Test category: functionality test
> + */
> +static void test_atomic_global(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	struct atomic_data *data;
> +	uint32_t vm, exec_queue;
> +	uint64_t addr;
> +	size_t bo_size;
> +	int va_bits, i;
> +	int n_cpu_ops = 100;
> +
> +	va_bits = xe_va_bits(fd);
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +
> +	bo_size = xe_bb_size(fd, sizeof(*data));
> +	data = aligned_alloc(bo_size, bo_size);
> +	igt_assert(data);
> +	memset(data, 0, bo_size);
> +
> +	addr = to_user_pointer(data);
> +
> +	sync[0].addr = to_user_pointer(&data->vm_sync);
> +	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
> +			    DRM_XE_VM_BIND_OP_MAP,
> +			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +			    sync, 1, 0, 0);
Same comment as in [PATCH i-g-t 2/4]
> +	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +	data->vm_sync = 0;
> +
> +	xe_vm_madvise(fd, vm, addr, bo_size, 0,
> +		      DRM_XE_MEM_RANGE_ATTR_ATOMIC, DRM_XE_ATOMIC_GLOBAL, 0, 0);
> +
> +	for (i = 0; i < n_cpu_ops; i++)
> +		__atomic_fetch_add(&data->data, 1, __ATOMIC_SEQ_CST);

This is built-in GCC atomic operation. Same will work in ARM compiler? 
Earlier we have experienced IGT pipeline failure in upstream because of

typecasting not supported in ARM compiler.

> +
> +	igt_assert_eq(data->data, n_cpu_ops);
> +
> +	atomic_build_batch(data, addr);
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = addr + ((char *)&data->batch - (char *)data);
> +
> +	sync[0].addr = to_user_pointer(&data->exec_sync);
> +	xe_exec(fd, &exec);
> +	xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
> +		       exec_queue, FIVE_SEC);
> +
> +	igt_assert_eq(data->data, n_cpu_ops + 1);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	free(data);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -932,6 +1003,10 @@ int igt_main()
>   		igt_subtest("atomic-device")
>   			xe_for_each_engine(fd, hwe)
>   				test_atomic_device(fd, hwe);
> +
> +		igt_subtest("atomic-global")
> +			xe_for_each_engine(fd, hwe)
> +				test_atomic_global(fd, hwe);
>   	}
>   
>   	igt_fixture() {
Already SVM tests available for atomic-device operations. What's the 
value add in these added tests? Or can't we modify existing IGTs?
