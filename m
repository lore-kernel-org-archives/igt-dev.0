Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D02FF8875
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 10:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD5E10E0F5;
	Thu, 30 Apr 2026 10:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XG8nWHbg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDB510E0F5
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 10:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777543267; x=1809079267;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sXCIcfYhEDDYkBYuBE5IZx5EH1JZ34uf6cnvzzmxSBs=;
 b=XG8nWHbgF4OtWW1pm/33QKeVdPgWaxcqe2PxgfWZlS0VgZcMbHXo3i08
 mHLemHMbFk4nJ/f7Zp6sY4BUqcGzjIHMcKUH8XS5R6KfsAuSKX4puYfe4
 yKt/g0q1PHj9vZpgdG0UBDc9l80ULntzBgw9tPQAqZJ340/nKOHGWm73d
 74IaydJrGa0smtZYdoHUSnchaaFJ5iqzGNVd1SKOkdw1nK7oBswi3myrQ
 oKN/3C4+V11BkTAvEkBVSKuU0/IFaDiioJ8wqmT8AXssn0uAvnJx1Ief9
 C2OkCozvD7QB7hJi5o57rNShXrMTqoemWe3HkzZhTWK0RP0O1w8cJ2REA A==;
X-CSE-ConnectionGUID: phc1Ga7HQMiKKOLzJa/FKA==
X-CSE-MsgGUID: KjW5ulNaQ9ydeG94Yo7Vvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77516190"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="77516190"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:01:06 -0700
X-CSE-ConnectionGUID: L9CgeuzMQkuqR9Zgbwr2sQ==
X-CSE-MsgGUID: fUJlWxF7TBeOj5ioioagUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="239547208"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:01:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 03:01:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 03:01:06 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 03:01:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPwRrQaUfNdN/qyzKfaBYX0PvtdmOyG0rSEy2K/WDpyCtqNkXkNjlAVmrA+2xyyOQHbF2hZzpkDfm5eCpwfZlxyJtrt8kFvytgLYWIG4HcZfS9vJBjjzG1XEj1D8LX2s7SW9bfAwCE/KfqG9BJ/nO3U5xxOapf67VmSicvT/mbxChfizvd/rVytAf/48iB0js949Pt/92GRDQL75GTMV3uGwz0lzgKz2Q4c+0wKu0KWSETDAMKu+uYo3fGUOHySpWVY9tHUYg6lxdsOMySBuDHXNLzGoKHkg2C769drV+ZkWyDFIwz2koKGlUlzt+u8R1zsCihdsMwhOitaO52cEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtZzr4rlre5vzLoDAvDysM5T/LmkmnSeW6hTNr3HXQQ=;
 b=ZXVJTH1Aib04Yf9wG063+sRPOPk4hcJQZAgcWkoJDUj2xpNWQIxrDgu4Eaw6wO8KT+Z+97QoWncFhmEFJQHNujy8mPpwU0UmFD/SpPV7K+G+czTmUQUp5Q1z93jvexhNcUNLtaTNBOpDMX03nzXFExS3/z9qCukE4KNpTSagCTLQ6Z8LqHzy9DFSsXATnFEqcs9q6Xmns1DUlitpczn5De+2m+7kLL2wkqo5Ghaq3nfugT9xZWlN5BkjwOVZXSV2nep6FeSTQCdrJ37bkMATn7AFzL3doKxuDjj5/wzcaVIGCY5IoChiBfDHTuegYYarD4zmEb7sd2pAr15nfC7BrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SA1PR11MB6872.namprd11.prod.outlook.com (2603:10b6:806:2b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Thu, 30 Apr
 2026 10:00:56 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 10:00:56 +0000
Message-ID: <12e13a5b-ecf4-4e73-a232-00aaf58aac96@intel.com>
Date: Thu, 30 Apr 2026 15:30:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v5 1/4] lib/igt_kms: Add igt_get_joined_pipes_name()
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
References: <20260429195115.2332923-1-swati2.sharma@intel.com>
 <20260429195115.2332923-2-swati2.sharma@intel.com>
 <91a55230d8c6314a0a2b853434f2814a887f9676@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <91a55230d8c6314a0a2b853434f2814a887f9676@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::13) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SA1PR11MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: f39b8b8f-0319-4c7f-e179-08dea69f5f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: l7sQN/uPQBaplG9wp99fFKD6FSdnZTUIG4LjB1Ux79rZoGGMWNNzsdDUlCzrxRSDUCkWRA4u9nmnTw+ytkGfgwk6/4ejVvSL5IC+cZ35a1tEN1CwX0q3TBZelqCiU9TsWqyF92oQ9MWPCVfIMC5kp+YKrqfAvWpHubE9GaKXqazAxJVkmCjIDs4vMPLb1vh0t9pMpDYsBcF30QP2AzbrmpqT+TPjR42iiEwOcDPMy2mffKxH5EOR1nQjEU+mETJCsubj3nCBl/s5E9FYlqWbYHWEiWLrnOWOl0ZKJfl3UYpQeeSxqGb0tyAKhx27kF2PWRH/pfBhOrs1whHggvDwEdHj5ZWiFjWc8NGVlkTfyxx9UMqcWhmUuWu18pPcOBlMXhqEKRDObLifY4NENRKplyEQvdjYSBgiu/szML++EyUDfZpcg0Ux6CxaXcrOFt1fnrs+YSiXshccUKkHRpDy5YnsirNN0aNepGCwJit4gEKapYa2Y5wQi0+IR0sMiuPUkkpkUpV8UsYLV89lRyaQjDDchLtpeQO6O7UeM8+82b/w3kShN94TXsl9sI+xCTzNyV9bHNeON4tcxnnuqn2Feyt+83P9LEv3q6XDlZSfvHufZoE5j6nh00Vs8RYA1GPV9/s9a3c7+AJ86WBR85V4Xtx2OdOqrKBP3/4uwSUjMQOV8p/23sP4gXK1dpZbQl/rpdO5J3n6e4J0fRGBM0mBL8BpHDO6zhQOcoq/UFRgHU4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEhhSUFIYUxpTjg5ZFB3c2NSekdpYXltU2N2ZnR6b0IyY2loQmdhZlpPMzEz?=
 =?utf-8?B?MTVEeVd3bnVpbXJ0TGVLczhPZVhBRHlPUXhFdUNWZ3NTYVR2b2NtRFpya1ZI?=
 =?utf-8?B?c1lXbDBDRTFWdGg4dEN4SFVoYWtaL1JjVm5OLzg4L3EwVTl3N2F2aHFBNkFO?=
 =?utf-8?B?R2hjWDR4VzVrbGlQaUdPUXFBTXpPUGFRelRaTUd3RWI2ODZYRmJCUlV3ZVBH?=
 =?utf-8?B?NlRaR1hsLy9VakVpWFJSTXh5dUk1YlNhTmZhTXVkNjIvM0dLOUdxa3VwdmVz?=
 =?utf-8?B?cmVwNFFUYTNFc2dnLytQMERrcUVqSk5xSFIrSjZxSVlQekdUVTN4RjdpMDhw?=
 =?utf-8?B?eDZPWXk0NGwrR2FBcmUzK1FBelB1Q3hzVjV1Um9SNmNKZFFtMlRlZEs2Ny9p?=
 =?utf-8?B?S0NzUWZQcy9xalk2S1IxbUlTcGpMeVh3MDJLTW5HV1ZJa2YrazduRmdxTWty?=
 =?utf-8?B?SHlMZFc0WVZsTWM1bkwvYUtNNWM1a00xWEZ1QmpXeFpjQ1MwbnZEU0pWLzZ3?=
 =?utf-8?B?dXBpZDR5V0hZcXg4Vm5LSEJrWTZtd1kvOWlUTUwxeW4rb3B1YWdnRzdtOGdS?=
 =?utf-8?B?eTRvOEljdTh3bUlzU2hESjNEaHFubUpld083MmRmWlVnNzY0bkhVVlJmd1R0?=
 =?utf-8?B?ZVB5eEZXbXhQUDcrVkFwbHdjU1JrOG1FMXE0ZkF5djh3eDhwOE1helNiK2FM?=
 =?utf-8?B?enhSekpGS01sdmJhNG5heSt4NmVPMEd3MUh5Q2N6VjRSOGwzcFJQMXlyb1FP?=
 =?utf-8?B?Zmp4QmJxOGsxZERVQ0JGWjI2cnEyR1BqcHVZc0hqWmhFV095US9OdDlaSTZK?=
 =?utf-8?B?YVlLZTgvNmhydE4xK1g2MUo5aHE3ZnZkdnM2UlBDMmwwVjlsczdqRnR6d3lq?=
 =?utf-8?B?QmdHb0tFSFNBbWdxWlloU3NXajNGTHR4dkpJWnVWV000SG5ZSFlSSzNKVWhk?=
 =?utf-8?B?aS9EcFdlUnVTMVhWZmI5VjZNNWwrNXdnc2VvNGhFT25nekNRYm9QMW03SHZH?=
 =?utf-8?B?NSt2ZUlQSTNMbmpSTmZvckdEcXdQa0Z6elpSckRLbUxuUDJQWTZ4amVDVGxi?=
 =?utf-8?B?Zmh4S3FwaHdzZ1R5aytkOE9hdUlRRFJRb09pQ0Vxa1A2WjBROTFNV1JqdWEx?=
 =?utf-8?B?WTAxcXF5bEN1eGxaUCtoekNiV1d2N0xCNlFwU2tYLzlSUDZkT1hNZytRUlgw?=
 =?utf-8?B?ZlB2Mmw4M3ZnM1JxeTVtSi9WTUZacG1zMk1icTBwd2VHTDVUT0htdXZKM0c2?=
 =?utf-8?B?d1dqdVpqbzBUeGhxYVZUWjJOMnhnV0ZXWlkxanFCU1JVMGNiUjM2QWxXK0pR?=
 =?utf-8?B?NnJoUWZJLzA0bXczMU1PamVkL0VWcDBpRDE3Q0ROeHFOYk1FaDk4dGpVeUY2?=
 =?utf-8?B?VGtXYzdVd2RyTnpXa2U4dWVhc3Y2Sm1EemFWS3FodzZJSXdmNll1LzAzZmNW?=
 =?utf-8?B?Qzl5QUh1WDU2N2xvck5uNU0vK2dQRFJXcEdHUDZBM2lMbnJXd0pQN2VmNnUv?=
 =?utf-8?B?WloyMTA1QTE0bUV0UVUzck5vNC9wOTRPaWlITWNQMGxwKzAxakNvNmVhRUpS?=
 =?utf-8?B?WWR5QjZRY0h6R3FZRi9aTEdtc3dEcmczQUIyT3o1Sy9UQ2NUTXBxcUU3RXFy?=
 =?utf-8?B?dU9LSTBwMlNEa1RyLzNuZ3JuME1ETDNEZTJIWWJxSTVUNHVXbTVJWngzakJq?=
 =?utf-8?B?MDcyNVlwazdUWjNZUG84MTVwYzdhNkhuRDJ1Mkd3bHRxdE95ajc4REhDeTlY?=
 =?utf-8?B?ZkNMNDIzR1ZFNDZkMjZseDFkbnNVd3hVU2NtVUo5MldwbHVRUENxbmxNRFM3?=
 =?utf-8?B?UkhXQSs1UEpRUUdST3YvRnRreE1qYzlONkhZOTkzdStrdlJmNjRYcWxuTDBL?=
 =?utf-8?B?djJnVlVmRk52MHFuNnJ2NHI5cG0zM2svQTYybGdiQW5tcDR4bXhGL1pWZ3JI?=
 =?utf-8?B?SGtHNzg3TjNxb2FsRkFoRVZGUjdWRkRzcHIzYUNWZW56VzM4QlZpeEVYU2Jp?=
 =?utf-8?B?VnhhVTc3SVRaR2hhN3hnek5EeklLaXh4RDdKY0lwNTE0V0RoMHQxOURiSVZ0?=
 =?utf-8?B?VTJxbjRjQ0JtYXdrTDF2Mmh0NCsxVGVQRlRkdG8ydXlKL3FubmRIcmo3eEpV?=
 =?utf-8?B?YkozZG9NeG5jUEU1MnBmTVJMc0trd2JOMnJDRS9JaU1YWXlZTjBxVVcreHZL?=
 =?utf-8?B?NFRMaVZFTCtmNCtaRzAzSG4xbjNFdDZaNlBhcVpndk9iSDN2MGRtSENqckIw?=
 =?utf-8?B?QzN6bERhdjA2eVdDYmhVb2IrWDJlemdVNXVDTnBhY2NwbnNuc0tVM2ptWWFW?=
 =?utf-8?B?SDFjMEVBeHpiRjc2dzRNTHVZU0ppWTBUL1ZjK0xKang5Vi8zd0RMUT09?=
X-Exchange-RoutingPolicyChecked: LcOtVmQ1Z4m5IJf/divP74xoExVNsiMXgjSURoCKlGEdz4DVShZ1oMcQj1YRDOvUmHK/KluhKbyPmNPIVi4gSYkGg2JpnbeY+Wh61HeKzdMRXo8Va0fi5UM1xVl96N3Rg6sxNpNMDEC5cCCHpIFe7ykwsZ4iPYIDF7R9UXvnIs9bldjdZ8WSr7VQHbPoK76o86OIums/8XUnmgbOIOfvp249xtCyRWZaC50mjEIaJ5mwJZNE9uL9DUhMfpfJXTOJQHH/RRi5PQiv9lmgrsMtbQf4pYxUAgaNgR69eEyLCfUL1Fb09V4A2gGr0dQ29lHX1JgImp36/7TavjI7mcapBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f39b8b8f-0319-4c7f-e179-08dea69f5f0a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 10:00:56.0078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cw45RgfenqgdDSKkU6F2aoce94B3rKvzVBHNKjQYkMiVxqDgCltKZqvfezRmfQTgJqFraAiDQAoHgqt8n9LaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6872
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

Hi Jani

On 30-04-2026 12:52 pm, Jani Nikula wrote:
> On Thu, 30 Apr 2026, Swati Sharma <swati2.sharma@intel.com> wrote:
>> Add function to transform the enum into a string.
>>
>> v2: -Improved func() doc (Jeevan)
>> v3: -Return names without '-' dash prefix (Santhosh)
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   lib/igt_kms.c | 22 ++++++++++++++++++++++
>>   lib/igt_kms.h |  1 +
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 2efdfb85f..bece27ff6 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -1906,6 +1906,28 @@ bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int
>>   	return true;
>>   }
>>   
>> +/**
>> + * igt_get_joined_pipes_name:
>> + * @val: forced value
>> + *
>> + * Returns: A joined_pipes enum value into a readable string.
>> + */
>> +const char *igt_get_joined_pipes_name(enum joined_pipes val)
>> +{
>> +	switch (val) {
>> +	case JOINED_PIPES_DEFAULT:
>> +		return "";
>> +	case JOINED_PIPES_NONE:
>> +		return "none";
>> +	case JOINED_PIPES_BIG_JOINER:
>> +		return "bigjoiner";
>> +	case JOINED_PIPES_ULTRA_JOINER:
>> +		return "ultrajoiner";
>> +	default:
>> +		igt_assert(false);
>> +	}
>> +}
> I don't really think this belongs in lib/igt_kms.[ch]. And to be fair,
> IMO none of the joiner code belongs here, because it's Intel specific,
> and this is supposed to be generic code.
>
> BR,
> Jani.
Right, will move this to tests/intel/kms_joiner_helper.c/h
>> +
>>   /**
>>    * kmstest_force_edid:
>>    * @drm_fd: drm file descriptor
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index fcbb6a5ad..6898cd981 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1280,6 +1280,7 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
>>   int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
>>   int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
>>   uint32_t igt_get_connected_output_count(igt_display_t *display);
>> +const char *igt_get_joined_pipes_name(enum joined_pipes val);
>>   
>>   drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
