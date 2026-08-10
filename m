Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF47C5AD4E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 04:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F4E10E601;
	Mon, 10 Aug 2026 04:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TdDfZNFn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA1D10E601
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 04:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786337477; x=1817873477;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D/gn7zGYWprtSkpCMUUutQ09fyJP21A7krnx8W/Z09Y=;
 b=TdDfZNFnDh9e52LkBttBVolcvYWOuhi/q0/8/sonXGy4RniFkSTWGAdP
 V/pC0rULxFqYLRG6aDX1Xbhu9HQIRmOk8BWNg7ch+hor1gIG4Yjwc+c6+
 +a7ueMO2FtG8H8ZjZakntQMwZwU966l+OrOuzBLPgvOJBFNMWI+dMfYLc
 YzQKSbpreBUyNgeH5Dw7cxQqiRtfrdhDEAa8Wux1o0Zf9kUzoO/UE5rAV
 sooElJ/JhAnob2DYmV2+BIC43+5BfYQsHJp+vr2v1XBrpHTXNgOGskD4S
 UNzuPCM6Ofg8aJfq3QvxpmC8g6emf60QEaj6pvijCvqBqcVauR1HfPgOu Q==;
X-CSE-ConnectionGUID: ObwzCVZZTX+Q6MpIanbdBg==
X-CSE-MsgGUID: TQREuNCOTFewo0FI6mECsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86918577"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="86918577"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 21:51:16 -0700
X-CSE-ConnectionGUID: RDsxmNqPTTeaQZnPQJXbyw==
X-CSE-MsgGUID: 5vfxZL2ASWGt5xMx+AzyNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="286349306"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 21:51:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 9 Aug 2026 21:51:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 9 Aug 2026 21:51:06 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 9 Aug 2026 21:51:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvzDgjErKL4RRSB021pduRPmrQJO066Fc2pH+68uOR1o+A8by8zOd/qF7KtrgEhqMQGD33vSNUppvYV602xLHUPjPWeXeSxDXkEbL4mximuINuLA+Y/nDUz6s0oHbYBQYrJgIb1+DmyoWVQa+LKY4FkkpsW1SD422KI7REPEXyvhO28WjfMWjhAx0geyum+yLQH/QOCvTLtngI9HAh6prjxxZYDhNoXfbgR7KJyUMjLUbKVLhPIQcnza2bIgAjCa3Lr9TAQM3x/JvrGm2P9Q0NrUQ9wtLtSFiPc0n3LpQP+FuKOby0gMqTcCNJxNzhZu9eoZ65qZNKEvfTdttgyE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdoFnmyDIixKNcAPt/ZpFlzjoPFgPUo40bIYzLwI63I=;
 b=Hrm0RBikJ25NXzFxUl+mZhY3SevEa+DYkKpQ/sy8d+Jw74zWwGgT3vMt4XsD+xtWLt004h2zWAJMVjG5mYmO2JdLUKPBLAyILe7p0G2H5KnfDaVu8Ff9ZLR7azzkvSHMBw5urSVya0X6gSrdqve/OChVolmvuuSTnyHa6fpNXZ6PeHjsh9JD08ahX7yTiZ8WOVEmwUFMTffirSK9OM7abShf6E+KNHGCNWCNWm5QhR9j3HcHEmX9q81/2pVVIGtxfxoZC5HPLO84RsYtJcr4ytKr6b5tPHcoZidfV3sf5YptKpA1LR5efaMJOrs1HHkyXP+oM4KLiSQOXSzVgFX1fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB7682.namprd11.prod.outlook.com (2603:10b6:8:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:51:02 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 04:51:01 +0000
Message-ID: <ee03b60f-4f8a-46aa-a6ae-04cc72bcf2a0@intel.com>
Date: Mon, 10 Aug 2026 10:20:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane: Relax CRC frame sequence validation
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, <igt-dev@lists.freedesktop.org>, 
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>, Manasi Navare
 <navaremanasi@google.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20260608022810.48438-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260608022810.48438-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e975bdd-41cb-4132-30a0-08def69af9f9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|42112799006|7416014|376014|366016|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: /X0VoK2d7ayRn9AxWtVXRLtD246Yw1+qWVYgXVIy8lHduwvOC2JXEAym8anLpwbPmD2HDOvRojS3q3yDVzyBAqnGDsygObvCEb4Bi8shwJkagZ6p70qGsi5hZx0OUAejX72FvE8mabr/EOCgVoVnay3UI8JjhVyZqWK9e2ibxI5Dgsj7NdHQQ0kGxUxmVjTgq2YwnYL8731DhhT63AnbqgE/UiXJNQss1bN0oNBWSwKzROitFGgzPsUMElbZCP1WO0ZQkIMMLg53aK9E9tWjqWeV/fvBwdtU/h3pIu0VOpd210DLZwnwFoyex0w5ecY75EJARj2diKmuNGMx/ug+5aWFP+61+PAwBErvZKWHaQiGuYjj7IuLRGERkvlo6lnS8wUXkh8vZee8CWJG7wmeBkGU0Q8LEuTp6j7ozxWmpyrL2aV2+Vs1Y+RFpHzVYWN3RfYAt453YXGtnE4BONYoXkAWvdZ25h4fyXSsiuLpMAGuQ4WHlFA1ZLFeO8ZhOXxHJZOa+YydHdEBbKopij3501ZTR5pt8a9UXjHRa2cqTI9NdrIR2QevW5BzhSbQBjyiuPB5bGex9UjHkzjq5oXXD1mTNeGtBm3wt6Fqlmx7ZQCSdrj1KtA3yKWknIVAGA2qWtA15QHYHr1PiK7L7qyUMQnUmdGmKisIVU9/dMicQOM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(42112799006)(7416014)(376014)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1VpdisvaStzeDQwbElnQWprUHpLTEN1bkFzMC9VRlQvd1pvSFQrcDdWLzNN?=
 =?utf-8?B?SDdjSDB1b2JOTEt2bWFvSkQ3cExSTzRmQVNEMS9LZU5hSE96cUU0WUUrby9t?=
 =?utf-8?B?dERGUUFnVUw0Sm10c1RmQTh2eVlFdm9TTERwdGRRRHQvcklmdU9YT0draFNU?=
 =?utf-8?B?ajZUS1NRdTdnYVdUZlZGWVROQStGUXNiRGR4Um4vbENCNjVjQzVvaWdtTmdH?=
 =?utf-8?B?Qlo0Q2UxZ2tmTlhROWxjbDExR1ZlVFF6NzVvMFY5SjB2M2RDRSswZ0gvKzkz?=
 =?utf-8?B?Wjgza0o0aXA3c2tBU2xMNFRCVjZZMitab1NDelh2MjZjQVN2TERndll0VVZQ?=
 =?utf-8?B?NU5NUXlKaXBuN1lzUlhJcTc1MDdSTncrdzJJVnZZR2QxbWY1OXRvbGtFa2Ro?=
 =?utf-8?B?V3N6Zk9sNEhqWEpoL1FCMzFyNDVYMkpvNkFyZWlDMW9zWTlWd21xclJnTDZZ?=
 =?utf-8?B?eHM2SjJ3QnNMM3FVRHlGcEx4aEQ1N0tZLzZiRjlTc3NQaFA5MWw3UENzUTNL?=
 =?utf-8?B?Y1hyVGVLNld6N0FKenBMSUQzb1VsQ0kwMERVaTBDMEFELzlKQ2VrRjlXT1Qz?=
 =?utf-8?B?MFBqZUZ6b0pYUmV0N3FqOWtBeUVJRUdRVDZPYzdWdU1DUUxsUUd0WTIrLzUw?=
 =?utf-8?B?YVM4TUYrWHVEdk82OHN4T2lrMzRJaEp4MDVXQjFHSHVvdVlNTWh2V2oxMzFJ?=
 =?utf-8?B?L2FMRHMyOCt1NUViZzMrY25ZKzdYZlFselBRMmtUMi95cWkvemQvQU5vYnIr?=
 =?utf-8?B?SG5FeEYyMW0yNEFhWlZ3anR1TG9nMGFWTzY0RENGdWFOV1ZDUE54TnZSU0Vx?=
 =?utf-8?B?UFJ2U2pxc1o5cC9PNUpRTnc3T0l3bWF1MnJ2Mk1id0pqM21JYUpZazN4MmxF?=
 =?utf-8?B?SUNvbTUxaGZ0NVY1WURobFdVT0JWcVc1RytsemxqTlJad3dFR2hQT01zem94?=
 =?utf-8?B?aFRacW9aRnpYOUhvTGNUdStkTXJsRloxYTcrTW9JcmZUeDN1VUlVNmx6dSs1?=
 =?utf-8?B?RmQxYjNId09ZY0dzdFVsaE53RElmbStTTkJ2K3JaMFBBcVZNekVLZnhRbjNO?=
 =?utf-8?B?TjZjTTdZendvSTdQZWNRZ1BZWERDSFFZRS91b01jNCtPdzRMMG5YOEg4UFlN?=
 =?utf-8?B?VGIrWDlMWkVRRUc1TWJUNlR0NWhUb0M5dHcvYmtqU2Rpa1Mvd2ZFSGJvV09v?=
 =?utf-8?B?RkpaR1NuQWNhQnlrWThpSGllSnI3aklZKzdGWUJuenpYNG9yQmFsQkl3NFV1?=
 =?utf-8?B?cUlDT1EzbE9lNDJJSWRjanhkOHFXMkpJT3ZMc2x6MjZFMDRHckdyS3gxRHF6?=
 =?utf-8?B?V2x0dGVjV0hpc3ZUSU02ODhvMURuWlBweEhlOU9mK2tTMU1nZjh6bWc2Zmcv?=
 =?utf-8?B?eG1yNzY5eWZYaXNVTEdad1JyVG9xSlJaTDc4R0xUSUZvOGhDVUxra29rZ0M3?=
 =?utf-8?B?bUIwZWlaVmFHa0txcWk0Wk5vNEtLMmVZalpYcjY3R1R5RGg5VHpDSVNFN2pa?=
 =?utf-8?B?dGQvbkpPaldvRkxlbmU5V3B5TUJsVk9EQkY4clRyM1FUeDBwRVlSeU9ienhC?=
 =?utf-8?B?ME96L2I5MGhoYUdNc082WTdVOC9EQ2J6VWM1K21sUWEwYmx0bE5mWE9YYlVK?=
 =?utf-8?B?N0V6Z2htTXV1Z0JDQzFsaDU4R2U0OGZhSWVrUjJLcFhJRTZlb0J1M1Q5bTZO?=
 =?utf-8?B?MU1KR3kvc0UvNXozNmJCTWNHc21aZnQwbllZbE5hL3JKeTdZelBwYURwdkhG?=
 =?utf-8?B?M1J1SEpYc1hqQnpWSHJRVktTV1gxNDMycUxVdmpsUkJ4V3RIQlBTRTVNNlVo?=
 =?utf-8?B?K3Mwckc0VFZWeDJOZkh2empJWDluRUZjTWpNUFNleWJkaU5qNnJqSk40bTBV?=
 =?utf-8?B?YWEzVVlLbkhiUzFZTDNEZ0x6TjNydWxJVGJhQkFCRGEyeGp6RGk0dVVrdVRM?=
 =?utf-8?B?bWVsKzJyVm5iUHpuSjBNRXprZTZCZ0VCa0pSTnRTdzlHNmMzU045OWFOdWV6?=
 =?utf-8?B?cmpicWRmMGtkN1d3RmUzT01vNGpvL1FMd0thSElEWkpEVFFNNENRcHI0d211?=
 =?utf-8?B?cXJXM2JiR1FJek80d0IxN3FsOXQvT1NZd1ExRlZuZ1ZEd2VDYmh0UUFieHA5?=
 =?utf-8?B?ODZGNHJDNVlReUp1aWFZK3VCN0xoY2JyM0YvcWFmd0JFaSsrYVh6UkQvMFFQ?=
 =?utf-8?B?cUNRMkUrU2R0T1ZpbC9wTDJoaE1PZHovR21rWnlVZFA2Q0M5Sk5iMzFhbHJ5?=
 =?utf-8?B?aXAvSlB0R3NzWnQvTnRFTWpScEswUFRyUGk3N0ZsS1Z5elltbXFYSGF6RXZC?=
 =?utf-8?B?L1Bjc0VqQVBFQldHM2V1QzJ1T0ZhQWlidHd6TjlLUVhLdVN6anlZQT09?=
X-Exchange-RoutingPolicyChecked: XAE7okWNpdFgLQZOMR49DLfSQkJe09Lbwc/NIpxTn+Wh1xsfagTWHNBR2XAvLdLXTmPxgDs961GffFcZNh/wMzGRUErrMXqfYEOzPsejmzuCmD68zpqBLCni0i85Yd8bfflctUVTtTD5Aw2QolrPChUohFI/7TclwEc8HeU47JhkF+KoPHJCDr6bVJwARZO/oSWOHhTuv4fU/c1HPGn+FbssIIp4jyavYXQ72oMxYDYho/ti5+nUgm6UURRExRl5BpJn6GCmGWQHSfuvPZKxtZqGzsaJBePHrc8v4zECmnXt90YHvIvpO8Y2c0x7p6/GWo7EpC1nEln+2Co54MDu7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e975bdd-41cb-4132-30a0-08def69af9f9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 04:51:01.6323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P61IdBsqOVeZg9FnIibxn0yEHvxKdDwQ0zi6hn6uKSGM5/d16nXzPMlrAzREzt/J8/BsdjoJyQtTblJffVBn4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7682
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

Hi Jason-JH,

On 6/8/2026 7:57 AM, Jason-JH Lin wrote:
> The capture_crc() function validates that the CRC frame sequence
> returned by igt_pipe_crc_get_for_frame() matches the expected value.
> The current check uses exact equality (!=), however the library
> function igt_pipe_crc_get_for_frame() uses >= comparison internally:
>
>      do {
>          read_one_crc(pipe_crc, crc);
>          ...
>      } while (igt_vblank_before(crc->frame, vblank));
>
> The function loops while crc->frame < vblank, returning the first
> CRC where crc->frame >= expected, not necessarily an exact match.
>
> This strict validation can cause test failures on drivers that
> report CRC entries with frame sequences larger than expected. This
> happens when drivers use internal queuing mechanisms to ensure CRC
> values are correctly correlated with their corresponding frames.
>
> Example without internal queue (continuous CRC reporting):
>    - Driver generates CRC entries continuously every frame
>    - Frame sequence increments sequentially
>    - Test finds exact matches for all expected frames → PASS
>
> Example with internal queue (per-commit CRC reporting):
>    - Driver queues CRC and reports with current frame sequence
>    - Due to queue processing delay, reported sequence > expected
>    - For the last CRC, test adds +1 to expected (per IGT logic)
>    - Library's >= comparison returns valid CRC
>    - capture_crc's != check fails on last frame → FAIL
>
> Relax the validation to use < comparison instead of !=, which:
> 1. Aligns with igt_pipe_crc_get_for_frame() internal behavior
> 2. Accepts CRC entries with frame >= expected (valid cases)
> 3. Still catches real errors where frame < expected, indicating
>     CRC buffer overflow or stale data
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   tests/kms_plane.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index f21006784bfc..548506290c9b 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -766,9 +766,13 @@ static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *crc)
>   {
>   	igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc, vblank, crc);
>   
> +	/*
> +	 * igt_pipe_crc_get_for_frame uses >= comparison, so we check the same.
> +	 * Getting a frame < expected indicates CRC buffer overflow or timing issue.
> +	 */
>   	igt_fail_on_f(!igt_skip_crc_compare && !igt_run_in_simulation() &&
> -		      crc->has_valid_frame && crc->frame != vblank,
> -		      "Got CRC for the wrong frame (got %u, expected %u). CRC buffer overflow?\n",
> +		      crc->has_valid_frame && crc->frame < vblank,

Agree on the concept, but with that then isn't this check itself 
redundant as this has been taken care of already in the 
'igt_pipe_crc_get_for_frame'?

static inline bool igt_vblank_before(uint32_t a, uint32_t b)
{
         return igt_vblank_after(b, a);
}

Regards,
Karthik.B.S
> +		      "Got CRC for the wrong frame (got %u, expected >= %u). CRC buffer overflow?\n",
>   		      crc->frame, vblank);
>   }
>   
