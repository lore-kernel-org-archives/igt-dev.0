Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAFEC4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 07:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEDA10E718;
	Thu, 16 Jul 2026 07:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJYFBlqa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2BF10E2E1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 07:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784186278; x=1815722278;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jSQAaAuWu+qno+GeD1i8h7cAVlNlsWKNJ7f2JVPXuRo=;
 b=kJYFBlqaLZm9sPmTMn4ntJCcgt52fDbwxoyJnP8Oz4dKo9L9aqM89GIk
 EiqUNG3v3NmI1Hf5LHK9DuFejvkG+KnzTMoUXdWw9/s6hhA5x/6kJ/+Sa
 X3DXrKYseyMstIQzA9xFlWUbC/GW3+YEoacPHKhGDXD8CyM5bdbJt1p1P
 hKvl6vThTpy+NZIXTkO0WaMQ0aQUUfIicqqSUKUS+Hla+knyG2vqioB/B
 1tfX0kNFK95lkwBD7GDtAAWldBc7/3+TsfMXmWjf57ogY7KiyyvM4E0sm
 WFt7IKdZ0eDOmDLltAm0kHUrSUEQpX0EUu4RE1NB3xtbXeq4VmQPZx1JU w==;
X-CSE-ConnectionGUID: zjsGki5PTWSieLeza+yuXw==
X-CSE-MsgGUID: 80ss9NDVSLuNGi62S2Tehg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84719825"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84719825"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:17:57 -0700
X-CSE-ConnectionGUID: ht0Z6Y9eTzWCkf0NP1oXfA==
X-CSE-MsgGUID: QKYIKKYtQgmn808KcW7cIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="294648884"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:17:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:17:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 00:17:56 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:17:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TsJP/YuHQtyvTlN5BUkBtgOGuYfjGoSoIZ3/ny74K2K14ps8p0nUS8jebxFrh4gduLhqFVoo8vTFMhezG/cDp6fks1HmvDBxx8lBJNXGnr4gIr7v7qjNAsYRrHk1GhWhpfVbKcoNPMbyQQcrDHYYOgYBgNvAYG70Qexz2AMZ47jEmwA2WqJn+h5XD4/+0giqsE1IexFrpuUuBLJ93Pg1gnf3pA2KIeDqmkD0o7OXa9vmZ8YQjsA4+Kwl7ieguM1MZe61Ss9sl66yR0+7W+ELQ72K7fkwI11bQDAMyIOBnX5DRXFmAS0CI/vv38ESqEnEqKn2KTjQBDpZObZU4LkbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8eJIM05gUJKN5nXmbNB0dkIbP6RGvHMOq1tT6hW9Y8=;
 b=uWY1RX+au7lTMOaKs1Fi/NFvpZb+jBxb9ZaUg7bo8Mcw5DmK+FsXKF1JrnnlW2kl3c32dPmuNHXlI6EkgVNIgOvM28y2ZEmBW7SxasDNBoG01tApKm2FbdDeQMPcXUugvid8bZVz/tmJBPgnEqOAxT4mMo0QqhAiSJVxqg14rsaS9vtbwc4s3xH02DOoWXAgmFJ+GGQMktjQIpRKfdxPWearhTIwlV2OtCYjkC0NV8xPqqHlq0fjKp9vL/przy9tpFaZZaoNFVIaYJWYAlaHQryf78T6ssqevNSZXFFHnolSX4TvnHTl1GXFXU5K1aiFj9c/3oWVvztptR874HlHzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by IA4PR11MB9035.namprd11.prod.outlook.com (2603:10b6:208:55e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 07:17:45 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%5]) with mapi id 15.21.0202.014; Thu, 16 Jul 2026
 07:17:45 +0000
Message-ID: <bc2afc19-5ae0-43f8-9129-4542a6203cda@intel.com>
Date: Thu, 16 Jul 2026 12:47:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/xe-perf-recorder: Add mmio-trigger support
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260702052315.3740840-1-shekhar.chauhan@intel.com>
 <87pl0uctb4.wl-ashutosh.dixit@intel.com>
 <87o6gect48.wl-ashutosh.dixit@intel.com>
 <20260714112304.rtb5vtsuamsz62sp@kamilkon-DESK.igk.intel.com>
 <87pl0ogfgp.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <87pl0ogfgp.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::9) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|IA4PR11MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: 134e321d-15aa-49fa-4cae-08dee30a5557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|4143699003|5023799004|56012099006|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 5LyS9TZQInMT9B6kLDezyqnsrPxgVNpDFp3fgESHh1uEczD1CPnI6ARszo5Bpwz6w4aStQI2tXByi/Y05njGMuFeoAI9CAK9MboBFkSvO+7omlt4h1NDHZoJe9D5kCRscUH45WKVINwhAVm3fp1YMuMO9Jt0tU6ewrDqbhZiRrvMy/aTWqNy30jnzLUfpA7hgEA9BqOgX+AipKFzo2WAfFp42IvDtDC4nIjmrHAslApmqHd+d3GKmT+Awxkwfp73L2HfvQCfzRHqkADHOjSliMDC4UAWG8CAfx2+JnP0eXLVrKGgAoC/V+dU1zemamF5lFaqop0iOnasDX2bECGNZFHaqaM2eanwgrj6fQcemoHfRtOsVVC8TUTs6duYqsdUIM2y8b5OGbcnkTpLiOEywON9DTRwKZRZ+GCrvFwhYDNAyDsN4bskx1BP1/fCuTGqRuV+8dp87LV/vzipFagO+sqj60kK64T94MdFkJjaB5yOOkSOsPK182d5OFYooV0JOs+GUIPVp/Jv40i/PBRJC0v/Ff9faKcAGpJ7/8fSzqwi0qWCm1xb1iqVCTZy9LRRSjufbq7C9oNQ66O2dM+A3MOeMGCQomfnltbzId90sSXUc7CtrowXLArG9qLpZWNqWU0JYEtNy+UAjVYyX3WPfdarnkCfiIo63aAcjPm+pEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(4143699003)(5023799004)(56012099006)(11063799006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlhYbHk1dkxnVS9LeWRCRlcxSGE4YVZaUmRxcWdmaEdQKy9qaEp5dEJzcXMy?=
 =?utf-8?B?Vk5COENJZzZUbjF5UGFBa2ZPcWs1ZFVuZ1NhcC9oUlBpdzFtbGN4TDBXZEVa?=
 =?utf-8?B?NzFHaUlVTlhtc2hCb3plQkpKSko4SlQ2ZGhZN25wZ2dmQTY4eFNqWnN3Ukxo?=
 =?utf-8?B?OWZXV1hkMXB5UndZUzVKaGhNQVF2a2Y1YlN0Um9OSmxTNGpVbjRoZWVMdVk5?=
 =?utf-8?B?OVNvSnZKSERUTlE2MDhHM3VWZEpaWE1tMUp5b2kzbVp3TXlPQW42ckRGWGg0?=
 =?utf-8?B?OXRKUkZqdnp3T2l5OUUreGlPQ1JqeHoxZ2Z3V2w5MHJqdExDOFp1Yk94aXcv?=
 =?utf-8?B?OW9WMDlONFpSbVQwWjF2NHN1dkpUdVpHQzNXMmQ4UElGUWdNQUJkZWFyRTlI?=
 =?utf-8?B?b2duN1NpQzZqc3VLUVVMeHp6b24rQVF1cEQ0aTYxTnZpWDJyVnhPcUJwalpi?=
 =?utf-8?B?NDU4Tk5DWFRrZnNkYmVEYTBJSVphTEJuck1VQnR1cmhqODRvRjVtcWh6K3JU?=
 =?utf-8?B?aVFFY3JqZWl2cmhZNTZMQ1Zid05kQmp3RlRXa0N4bjRzSzg1WFdLU1F1b3Y5?=
 =?utf-8?B?Zy81WlJtdGxLQm9UczVXZVFhMW15VmdpVHdwcWk1WWNxZ25zcWN2ZDRFQU93?=
 =?utf-8?B?aFlKdnZIZkZEQkpLV1FnYklHQzE4MVBsN2U0TW8xYXp2Slk5d0lFU1FmWEFM?=
 =?utf-8?B?MGNXemdISHJVVGZCUUUwYTRyT0VnOExRTE1aRmJuME1IYXc3N2psZVZvZGcw?=
 =?utf-8?B?ZmdXV3hFbmFIVk1WbEZobVBiSTZZUXhMVGRhaS95dUk1dlYyRXMwWEx5ekRF?=
 =?utf-8?B?Wmg5RjFrV3RUSjc5N3pIaFd0eHpJWmVSVXRxdDk0U3ZOcWt0YnZzTVpWR2lN?=
 =?utf-8?B?Z25pMzdTUE0vbExNSzFjS2RhWEpOcVdiZXlENnBtcFZJcGtMTFBLN2FZd0x4?=
 =?utf-8?B?YjVRUjk5UlNjVTVsUzVhUi9YQ0RienRmNWFOQWhXMWFwaGJ2WEtEdE50R093?=
 =?utf-8?B?V055dGU2cm1kU25Uc2JRSW13Sms5b1BLaXVQWDNYNWVpV0JYT0hqKzBudERx?=
 =?utf-8?B?UVdkUHl6OU95YmlQSWs2QS9NTml5SGY3Mm5aMHIzSngvK0FvUHRIbEI3KzJV?=
 =?utf-8?B?YVczdG9meVU1NDhTMlJJT3Jpa2VKWHpsWGNCVlU1UlZDWGhwZ0lGem0yS3ls?=
 =?utf-8?B?REpYOHlaM3lkZ2xsNEhrTHk5T3hlQkw3OXRLU3VnTExuOWVPU0FRRWtVekgw?=
 =?utf-8?B?UjNHODNad0lEYXV4bE93UkdDUTM1M1VpRHU4aHg0YnJpdkJqUHNQekhVL3Qw?=
 =?utf-8?B?WUFsTWdqN3BIMFZ6L0JYaVdMM3gvQzBaN0xsamRPSXlrQ0FDTzI1Zm9vWDNT?=
 =?utf-8?B?MDJTL2V6UFRRb2FhanhxeHB0aEtCa0h3SXN3Y3hNOHlXa1lTdUg3NC9GUnR6?=
 =?utf-8?B?ZUQ1bDRRRjJYS3QxWFhjd1VudklzTWI4MzhtQXdDN3lDRXIyZTdJR3gyYTNs?=
 =?utf-8?B?M1JpekhhNVU4ZHF6RUhXVjNJNE51M01yNTdJU2YwU0RFSFViVXBRbmRpbVlL?=
 =?utf-8?B?ek11VFM5T3NWRGJRaCtrcC92Q29rMThONzJWNHJBYXVPcWlUTHZFenV2THA3?=
 =?utf-8?B?T0xiRjBZUWpOT2xFQmxNNVV2V2xRUTRUanl4Y1FPckprQnBvcTd0MG1uSUV6?=
 =?utf-8?B?Z1M3dndJT1BpNG9NUEkyT2tTaWtjdjVteWgxK1JJMWRWZ2tLYWZrVVdrSjV4?=
 =?utf-8?B?QWpKVjBEam91WkM3c1F5M1VScXJuTnJ5MHkxZUpBcU1tODFGeVk5aHUxY3Bo?=
 =?utf-8?B?Sk04SDlZL2lkbjFGMDhEK1VWUkVhUkRna0lCaXk4b2lzZlpqajVQYmlsRVJv?=
 =?utf-8?B?NC81WFdCS0dyd3Q5Qk85RmQwOTEvejZjelRVQ3ozRVRnMWJSblpFeTR3S0s1?=
 =?utf-8?B?cGZPa3NtYVUxNGlJRGNrbS9ra2cvOXFiQjk3RFBSOVVBeWZIZFdCdEhTUWlN?=
 =?utf-8?B?WGk5cXZEWmU2OHVvcnh0SVNqSWNtbHpyZ25STEd0SElyWnNRN0gzY1lHeEZy?=
 =?utf-8?B?bXVUL2NmenVCaUpoM1ZJbC96SVQyejZDVTlGcTVaN0JRNFdlV3p6RkY0RVha?=
 =?utf-8?B?Um9wOGlkVzFOSzExNzBiSjU5QUpXR0g5TXFHT1Rra0RBR1kxVm4rT0JGM2FG?=
 =?utf-8?B?Q21qMlZVOGd4dG80b0gyWEVXZHRPQy9Ha2RzMUZaUG0wYi9LUFdaL2o2MWM5?=
 =?utf-8?B?MUtTTTZGYnhnVUg2ZGVnVFhNUlZ0amoyL0ZIM1lDblQwSm5VSFgxeEdKNmh4?=
 =?utf-8?B?M3Z1SDlDdzlHanNOS1FBMXVtVGtqc1BxUnFHcDc0UUhxTzMxaEpmSENuR0pT?=
 =?utf-8?Q?zoZ6XLKwyhVeh4P0=3D?=
X-Exchange-RoutingPolicyChecked: dEeRdh5cPJsuxqn3U0scGOUTg2LUjzP8CSMJoQBDX8Vkw2B3LVcsdXxs2UtAAzZwAIvydg0Dn5Ew6VbzJ/7rBdLEtvb7evEPeFOCUSMTlm7gFjpDK5PPjBJFb7KyGNeRFPOicPagESdBstSEUcQf6BInrHJXaCikD0ImAdNXdbw+lNFs09yhXZES39wuGsM3he2l6vDHremRkG7E1lIdYPJh+yZtGlQdPwznM3ExEwfs08+2x4ZMPnhBHFSzgci9UAr9KERNHGHdpyzRMzEkyCt1Vo7SaIp1T4+Nhdt0A7L5K4rfFadVMEvHGEkav07QlqW24P2yFUgoGVVSW7GIVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 134e321d-15aa-49fa-4cae-08dee30a5557
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:17:45.7248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYuIuPrWjqWMp23O3yaad8qZ2FGeTMmXPkRWWbG41cYjbNyouyzSJNNdfGoypRPYyCXXgGQRRCh9Z3aym+goxD9W2P3SIhBK/DKyFwKrliI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9035
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


On 7/16/2026 2:03, Dixit, Ashutosh wrote:
> On Tue, 14 Jul 2026 04:23:04 -0700, Kamil Konieczny wrote:
> Hi Kamil,
>
>>> On second thoughts, let us leave check_mmio_trigger_report() in (as is) for
>>> now, so we will at least have some indication and my guess is we will
>>> occasionally see the second mmio triggered report missing.
>>>
>>> So let us leave it in for now and later fix it by a future patch.
>>>
>> imho function should be renamed. As Jani wrote: "Please don't
>> add functions named "check something". It's one of the most
>> ambiguous verbs you could use in a function name."
> Would you have a reference to this, so we can see what Jani means? Or what
> would you think is a better name for the function?

I've sent the v3 without touching this subject and addressing other 
review comments; once we can finalize on this, I'll send a v4 (shouldn't 
be a big deal then)

-shekhar

>
> Thanks.
> --
> Ashutosh

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

