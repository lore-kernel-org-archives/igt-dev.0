Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D997FF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 04:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FFA10E0C8;
	Mon,  4 May 2026 04:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvJCXziY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF2C10E0C8
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 04:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777869091; x=1809405091;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EUsCcZQbgVUddRI9F1ORpE3Igc+DoO39t/tFwq7yhq8=;
 b=QvJCXziYFgdG93byjYlFirC/ncA3ur6+Ffe4bheKnBQkQVvxKjt5frhL
 NwI9ynW+ugq+4h5KqniEWOOhT0Xini9qh0T80627vMjxWjTcXMKH93OdI
 /oaDUCsGknU8LsTtfSHFHbKix8fEtlNWwrlHGSFk5a/0k57b1oufHk+uv
 1PCqpU5IdLlQlBjJXc/enQ+dv64cLXm4UkEEmok0MGgPueG1Gpk1yBi7X
 yQw9Itj9dCvz7Q/QL1mG7+ZF64DzfelbEgOwB5NJG2fABrEAIARBF6A6M
 FyOX1BTQEkav1tOFwvXEK77WNx2TfLCuxD0Dn1P/JqgjSpXz03K8Axk5H A==;
X-CSE-ConnectionGUID: 85ZjsYNUTaOKSmoREf6p/w==
X-CSE-MsgGUID: R46i+lqjTYSlHiH5IpKlzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78716058"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="78716058"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:31:31 -0700
X-CSE-ConnectionGUID: ps8JIuDMSlqt7UPuvLGvrg==
X-CSE-MsgGUID: xtu1Rqr/TweVFv3ER+Vqpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="240393928"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:31:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 3 May 2026 21:31:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 3 May 2026 21:31:29 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 3 May 2026 21:31:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4E8zkS4qXFXk0nPtPSWlJ+4JVRixGnjkH4rboec7Jey2iSZyQpLFUe8ewhEYZJHjCOZAQUIcQbZSgs0fRIFcyfRY9jabCFenUruILrnj99RyQnXi4jsXbc/uug/H6F+b2nP+ubt0kVE3HpIqeHz7GeUqPcOWzpMLTNYH3VYFkYQfAMoFQzhSAVEclwSInuywe25ufyfUEgg/p73Dqy7jnscEHK2LgPT95DiOz4pvTQH0HAbv3+63H7vsBoWsgqnoRqVFdkNJj1VYiitABa6na+3rtuxlqtyfyTcUko8qNCmyHMu56RB2BCen9UbN2siEu8LHJoSOee28FGSaC/bOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxgIVAXAfmq6tOKdDcVXKkoozxxg4t4+a2QFhDUtr1k=;
 b=UeVI69nIkV8SFc1ry2PknvgSAJOaVLdCwXRc8Rl3+EXoM4lZMYhHLZuN5IzIAgoalWakWMowF+WvwwqmrRFeO+jjS+SHZaqWo1yAVl9lE913VFQidt8FPSp1fSI2dPG3bA4bxTicmf6zpRCt91UiS0jVN8z/r/yVW7Iys2PvG2gG0YBzufQT9WwayaN6PZwacjGlqd0DgcVEnMm/ahSysMfP7BscbMKDYrJOf3/vAzr1dq9SR1L8NgIK3tb8DyYjqKmS4ky1IRQjXDFJoGRCmCMyJNWhp4uQ7C+/gnLtUFGpzjyb5pXrABxWMF29Ei4kqw7j8uts3pM65YmnIcYAnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by DSVPR11MB9578.namprd11.prod.outlook.com (2603:10b6:8:38a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 04:31:27 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%7]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 04:31:27 +0000
Message-ID: <b831cb53-5793-4469-bcfc-5d984cc130db@intel.com>
Date: Mon, 4 May 2026 10:01:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/intel/xe_madvise: Add atomic-global
 subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260423063904.3944005-1-varun.gupta@intel.com>
 <20260423063904.3944005-4-varun.gupta@intel.com>
 <f6b0de92-94b4-4ec2-ab79-30f77c91fb2e@intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <f6b0de92-94b4-4ec2-ab79-30f77c91fb2e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::11) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|DSVPR11MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: d29a73ae-d920-4e1b-037e-08dea99601a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: karJZ/MUn4fCEC2Xgd4fX2/Z+t72i5S8tkV1Kpo9oD1HHPBlUU5KoqZu3W07j2K1dkeUAgiXrLYZuZlICwdiMOORsKd4/20ZioO21Om90SV+zgxEBwppVA08wXUQGwN26FJNAK2I/ztbAa7COVtheTzibt7Qg8R/Dg1ynTQLWcvTUx66tkAxOhCevSPu2Sc2x9NKu+9F8JvTfIeUEIPvNGFMAB8Ph/29AnLOnme1XC7bwbr2t8agRS7NAGzQqEGQFDpKSqKAdMc+BvyS9K5g+L78PhM1yDTwRjEjDkv8oyxdzlwFvaQbsTrh2AHAeOJr0sfvjz/GRBQOkGQU0aJBU+ypnYz4TObo15AVF/urXyp6GAf4nIPwNzpaEdSzYa64E2zXFDvQmjyMyzAM6eNFZ2CHlughgN8T1+0DBOwQMvvQ30fqqagNSqcHHDeUTgxTPdZUH75R0cAR8YKZHS0TwC4RdQOWzADH0/5dDa/3NprdbMfDI1DyMjRZy37MJPgj4hkFKcjukJKg3AyFrWlVLHpqX2aWRlZmAMXMDOT/KlMKc0SyigAOLfAj/AqMEl8eVU1CFnq9WkzYvTlY9govmqg+ohoVtAXACNP/xpB4zZZIMy+0XDIOfAmITRDy6QyAxptvtNn8iE7mAgsnrvRGuX43KMkRgYg/TIPLizv6R5NFZ4iq61DMo5HFuSiCPAaY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjZ1UEVFVFNKUFRRV2lPUzVhbjM1V0JEMnU2ckVtTU1pNkZFdnZMOXB2N0Nq?=
 =?utf-8?B?YVlRbEV0enBmNUQvVkVaZ2xtazV1dUcvdmFHRVlRVHVFWmUzb3VYK2cvSnJO?=
 =?utf-8?B?VFY5ODc0YWJ3UFFrbDgvN2FoSlJjeXdOSXZEZTZxcmtpMi82NnZhTjZoUE5Q?=
 =?utf-8?B?am9zcmxUbHVuMHV1dEtOa1J1cGt1NE85bUdyM0lKSmhGODBIU0ZpMTVUaysv?=
 =?utf-8?B?dlBRbmxHOUF2T3U5STdGTUpORlU2RmM5OHRvOHNGMXdUUnlZV2QvNWpzV0Jz?=
 =?utf-8?B?T0pSdHM4Vlp3YTE4ZWFhWlFCL2hVS3g0OXV5THZtV3pzYWx5cGRLUXNzQWtt?=
 =?utf-8?B?TjF1eEtFWTd4aHUvNEFHRWNDL1h2eGhXbENFSlQzZU9WN3RqUW1OV2UzWEhB?=
 =?utf-8?B?VzliRXlRMk42NHVsOU85QjFYbDF2NWlFMklwV2J5MVg5eG5ZZTZBWUNRU3BM?=
 =?utf-8?B?UEk5b3hIMFpTQWxTeDh6cDJrUHJKZVk2eXZzSzJBVDRZY3VxWXcrMlgzcWE5?=
 =?utf-8?B?dThBRHhuckRUWGpsRG9xZUhJYjZmbGZ1UlIxU2l4eERJZkVIUkJ3L2NpRFF2?=
 =?utf-8?B?RXlTRHEyTWU3TkZKTFFER3YrOWFDbUJGN1VySllLZVphMjJOaVNFVGcvRVFP?=
 =?utf-8?B?SEF1S1BMYUZqQ0FHU25Gd1AxQzl3U0hDdUpUVVFLemV4c2N3ZTJ5K1MyYXlx?=
 =?utf-8?B?VjZxQmc3OUpZMjd5NkVIdGQrbkVSeUZ5OWxXZ2Z3eksrUW1oUVNUV1cxK29l?=
 =?utf-8?B?RTYwcFNMTUE3MGF3YWVUdTJEYjM2a3krUys2Y0F1K0hwNUJ1VjUwWkFGZzZM?=
 =?utf-8?B?YTFTTHJPc0YwWnFOeS9IQ1pPdDRJMk1UV3g3R1FXYytraHhOUEpXVUFDeUx1?=
 =?utf-8?B?bHZBQWVqUXdDSWlTQk96dHJMNjR1OGpKb1ZkQURIT2NwYU9wNFpBYmN3U0dH?=
 =?utf-8?B?bkJpNDZNT3V3NVRiRXl5Y3NCK1Vjd3FXRG1Mc0hhb2dtNjZnMlhXRTFoRWhU?=
 =?utf-8?B?bXpFbS9RaWorYXJzOU1SVmFUQXpndXhnY085cFNxUGNYVmx2VTIwRUFHS29u?=
 =?utf-8?B?SCtIdjlzdExEb2VELzE0YldFekpxb2NyWDR2eFM4SUlUdHUwMzEySVNYaVI2?=
 =?utf-8?B?UG9hSkEzUXZZWFVtQmhTbDk4b1BjRVRTcWFlT1lLZEFPeUlDU2cyYmltMGVU?=
 =?utf-8?B?YllGSUlLSXd1YXBiY014SzU0dmx1UitjQnAwVW1YbjlrQ2x1RFBHQy9GSUNj?=
 =?utf-8?B?Szl4NTB0S2JYNDM5b3IrdUZtbnhLbnNhbXRTVEsvd3BZMUl6UHp6OVRhMllw?=
 =?utf-8?B?TTYwNnAyVjhIbW1nb25XeGE3UXNjRTdJOWZzODlCV2dDNCtLYk4rZ1pLRXJR?=
 =?utf-8?B?MDhIZVRtSWFrTnVkalNmSzRBVkRvTlNUTlBlcGNjWlQ1SGxsWE4zbWx0RkZs?=
 =?utf-8?B?MktONE1COVgxWGluYnZ4aHBsczFRU2pkblp5ZjVaaU5LSURLQUF3NWtwTjdM?=
 =?utf-8?B?aE1JZU9JQ2p5aFRDZW9tMzZJc0JMQnJtcnMvanRQQUMzZGhJZkFPM0s4THdq?=
 =?utf-8?B?ak96OVMrODd1U2VlNy9ZYzJmSFNLcjZoM1lHOFNwR0dpL0VUc0pNcmJERXp1?=
 =?utf-8?B?YWlDUDI5dU1Pd29reDVhNFhtTDh5czRPNUFQNzBXMTBvejhtS2orYWVTNXpM?=
 =?utf-8?B?TllYR1ZueDZKQ1prbjg4dHNiWlFwbWQ3ZWQyR0pCNWpkNjhPZGJIMFBXc21W?=
 =?utf-8?B?M09kb3pKbXUvbWJCVTFrQk5tNkpVOG9McHVXd2YrMjdUV1J0VHJjbk5NNjVO?=
 =?utf-8?B?aSsrVFgwcktOQ0ZHM3AwUU8xU3ZCQngzQXo4TTZJNERhQ3h2OXU5dkovSzQz?=
 =?utf-8?B?eW4xM0lzMkFkaWFMcnhwOWZXTmdaVk1najdNTlFqZGtFdHJOcDU2Y3FueDFt?=
 =?utf-8?B?eVFhRTgyN1VRc05sVXB5R3VBMjQ4QlY2RmR0cGg1R25wbmNxM0ExS0F2QWxZ?=
 =?utf-8?B?K3dYZUhjbmtuSkFxZXNkQ2VzK0t0N3lST0FSaTVpVVFWblhmL2cyK2tTVnpV?=
 =?utf-8?B?TVJxNFlvYjJWSmc1QmdQZzJITXdsWUxYSEN0THpoWlRaQlVWak1iYlZCbFFO?=
 =?utf-8?B?WGlJOVpZS1hwSG1rMnJ4OS9NdGRvRHRMV0F4NGRDZVh5NWtGdHJLd0l1TTlE?=
 =?utf-8?B?Ym5FSDNWbjh0UmJldkN6ekxWYUk4UG5zVERJY004dm90TDVCMVRTVzVEK29Y?=
 =?utf-8?B?ZlZPOUFPQjU4bC84Y3pEemQ4OUhSbElXL0o1cE9DRkdGN0hHT1B1Tnp1ZEpF?=
 =?utf-8?B?OXl5ZUFFUkFYSW5DbjgwZmJvc29CaUNObVU1VmM0N1NMVXJweExyQT09?=
X-Exchange-RoutingPolicyChecked: tFByPR2Ayjh4oahGomkLRpfS8fB+k6nTAP1QxK88PkG8ED4APkxP+vsOiGjvS33SQZLcNko6ZsF4jiUwSK88GkEUtLfggxz0Q7gPknjKtxEmwMzKf1NJ4l+LEE/mjVzh+XLz03090R6UF1yg+PlkP9F8aEgECsS5oOkRFRvrrry2twOTRHpkaQ8d4m5Rdt/HWye/eQsFuc3ThPP4sdKkHSWjUNs5CBfg+/Rr3q5Ky16/jJgJHDcpx7rTkx59sn5sMARYb1X+K9wYYMv75GfBCZIzveHGR1VEvOTXTQ6gH/O5ZdTfUgiWNxs4AEwseJ541PHO0QDx5xTqWitNE6utcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d29a73ae-d920-4e1b-037e-08dea99601a6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 04:31:27.5450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDw4tyL7a+0lMc28ZERdpPXUzzZLepfKkhQ8M1jMPwCYo+uXjcCRHZevRpeTGzLLNGZThCHA7A/kk2p41CeFpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9578
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


On 29-Apr-26 6:41 PM, Sharma, Nishit wrote:
>
> On 4/23/2026 12:08 PM, Varun Gupta wrote:
>> Validate that madvise ATOMIC_GLOBAL permits both CPU and GPU atomic
>> access on SVM memory.  The test sets ATOMIC_GLOBAL on heap-allocated
>> memory, performs 100 CPU atomic increments while data resides in SMEM,
>> then executes GPU MI_ATOMIC_INC which triggers the page-fault handler
>> to migrate data to VRAM.  The final counter value must equal 101
>> (CPU + GPU increments).
>>
>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 75 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
>> index 1f4fb16b9..c251186d3 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -865,6 +865,77 @@ static void test_atomic_device(int fd, struct 
>> drm_xe_engine_class_instance *eci)
>>       xe_vm_destroy(fd, vm);
>>   }
>>   +/**
>> + * SUBTEST: atomic-global
>> + * Description: madvise atomic global supports both CPU and GPU 
>> atomic operations,
>> + *        test does CPU atomic increments on SMEM then GPU 
>> MI_ATOMIC_INC
>> + *        which triggers fault-driven migration to VRAM
>> + * Test category: functionality test
>> + */
>> +static void test_atomic_global(int fd, struct 
>> drm_xe_engine_class_instance *eci)
>> +{
>> +    struct drm_xe_sync sync[1] = {
>> +        { .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +          .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +          .timeline_value = USER_FENCE_VALUE },
>> +    };
>> +    struct drm_xe_exec exec = {
>> +        .num_batch_buffer = 1,
>> +        .num_syncs = 1,
>> +        .syncs = to_user_pointer(sync),
>> +    };
>> +    struct atomic_data *data;
>> +    uint32_t vm, exec_queue;
>> +    uint64_t addr;
>> +    size_t bo_size;
>> +    int va_bits, i;
>> +    int n_cpu_ops = 100;
>> +
>> +    va_bits = xe_va_bits(fd);
>> +    vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>> +              DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>> +
>> +    bo_size = xe_bb_size(fd, sizeof(*data));
>> +    data = aligned_alloc(bo_size, bo_size);
>> +    igt_assert(data);
>> +    memset(data, 0, bo_size);
>> +
>> +    addr = to_user_pointer(data);
>> +
>> +    sync[0].addr = to_user_pointer(&data->vm_sync);
>> +    __xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
>> +                DRM_XE_VM_BIND_OP_MAP,
>> +                DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
>> +                sync, 1, 0, 0);
> Same comment as in [PATCH i-g-t 2/4]
>> +    xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>> +    data->vm_sync = 0;
>> +
>> +    xe_vm_madvise(fd, vm, addr, bo_size, 0,
>> +              DRM_XE_MEM_RANGE_ATTR_ATOMIC, DRM_XE_ATOMIC_GLOBAL, 0, 
>> 0);
>> +
>> +    for (i = 0; i < n_cpu_ops; i++)
>> +        __atomic_fetch_add(&data->data, 1, __ATOMIC_SEQ_CST);
>
> This is built-in GCC atomic operation. Same will work in ARM compiler? 
> Earlier we have experienced IGT pipeline failure in upstream because of
>
> typecasting not supported in ARM compiler.


Yes, this should work on arm as well. The operand is plain uint32_t with 
literal 1, no casts or type mismatches.
Tested compilation locally.

>
>> +
>> +    igt_assert_eq(data->data, n_cpu_ops);
>> +
>> +    atomic_build_batch(data, addr);
>> +
>> +    exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>> +    exec.exec_queue_id = exec_queue;
>> +    exec.address = addr + ((char *)&data->batch - (char *)data);
>> +
>> +    sync[0].addr = to_user_pointer(&data->exec_sync);
>> +    xe_exec(fd, &exec);
>> +    xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
>> +               exec_queue, FIVE_SEC);
>> +
>> +    igt_assert_eq(data->data, n_cpu_ops + 1);
>> +
>> +    xe_exec_queue_destroy(fd, exec_queue);
>> +    free(data);
>> +    xe_vm_destroy(fd, vm);
>> +}
>> +
>>   int igt_main()
>>   {
>>       struct drm_xe_engine_class_instance *hwe;
>> @@ -932,6 +1003,10 @@ int igt_main()
>>           igt_subtest("atomic-device")
>>               xe_for_each_engine(fd, hwe)
>>                   test_atomic_device(fd, hwe);
>> +
>> +        igt_subtest("atomic-global")
>> +            xe_for_each_engine(fd, hwe)
>> +                test_atomic_global(fd, hwe);
>>       }
>>         igt_fixture() {
> Already SVM tests available for atomic-device operations. What's the 
> value add in these added tests? Or can't we modify existing IGTs? 


The existing atomic tests in system_allocator validate madvise 
atomic+preffered_loc together. This one tests atomic mode in isolation.
Modifying existing ones would be a big overhead and would change the purpose

THanks

