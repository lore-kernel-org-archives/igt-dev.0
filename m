Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706EAD116EA
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 05:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7A410E0DD;
	Fri, 28 Nov 2025 05:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxolkfoW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A5C10E0DD
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 05:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764307050; x=1795843050;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xA4eWLQU9p5pkzwt/k5JrkAbnM7FWvb1HNc3CD06Pyw=;
 b=lxolkfoWYAvZfGARjEi+K28tmttYHdgtKi1MlnTOwrO5rheKEUhWO9Al
 RwJSui3L5xKTChSy/8zzb3Gs5PKLuFGB8QepSM2ljCKf6WTga6MepE72P
 4KydManrj8dG08O4YalLafz0MTloH5O9i/dHJfOboT8Qs3fw3wUlNc/4F
 C3rstD31Oe10FOH0Xf90Xr7ObDNrKKFE9BrIG/BaXkb0+VfOyeoNht9rl
 CBz4NXeKefNn3QwHMKvHa6XOyjO7jTCKzGK5kxFz+C7QzPLC0eLF8hdwl
 88I+iwz3YYsj6gqmcbusjE2j270fi8du5+K0JgZtJg/PPLDWNhUhBCZra g==;
X-CSE-ConnectionGUID: edG/jTMaQVi7dMO7Lq2zSQ==
X-CSE-MsgGUID: JrwBe7eaTg2w0WmFQXt+ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66506413"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="66506413"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 21:17:30 -0800
X-CSE-ConnectionGUID: i7d2EG9MSGSHjPLRhZZIhg==
X-CSE-MsgGUID: XKswsjxeQzydv1qcYvVMjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="192509322"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 21:17:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 21:17:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 21:17:28 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 21:17:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egg9cPtgsCvNX6DVoPRQ8iDnqlds1aqf47Vd7b/a0MyAz/Bb96w3usOf/nMthJ7gZ2DIkUAz6Ub3/F3WAZUyd1cBA/LNUrPKfSmlHPmEbXTTRgUcn4MD4khDZ80rjkTCO5PFegNbbzze8zxpUEO09q3J+fN/j+V+iOogZGqJa/96yDxxd+pAzMHwwBEsvYWsiDFBExXCPZmr6zELg6ylqWk6xe1y1qiXymumsOlLxQrC/OoDU9NnZW3y4I710QY7g5lj9t6Aml3/qySGH+zGj49NApDQ2/yJimZMzev9KbBTEumBwVvv2EhANgb5oejnjYSt8EEOrEbvlwmuchIMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sidttMzhXig2PDF2FlkjfonerZHIgeqXyLoSgZUhyTw=;
 b=kNbKu6EeDjQayFK/Bb09NZh9z1qC8BIE7dt849hVqvR/6s5bIqjg1FeXgrF+9HBg2tf6KC+IDp+jsNz0g0xiqjddHh927mbAc5JqXScO+2ruCWL3RbprDdnvGOv20mhsogmmEe46QxlxhOIJZi2Wz1W1Nv+UAdJ7L+NA9dNp5FJG55jJr9fSp3SK279ZtCNZ0JyWNk8x2KFEWJIG0Apwyg7lYcAmuOXG4hVi983HL9YohgqKM/z+4zMcUCBTbtjqoCaCbrPHTtx8che1FT2qFeo4CcFa8q1JAgu89duTakmwY0AQe3+4c4y+Zp8L6Hl/g3p+Fe8EzGGxkGuXTV7/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7140.namprd11.prod.outlook.com (2603:10b6:806:2a3::22)
 by MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 05:17:25 +0000
Received: from SN7PR11MB7140.namprd11.prod.outlook.com
 ([fe80::4201:bc5d:e6ee:8aac]) by SN7PR11MB7140.namprd11.prod.outlook.com
 ([fe80::4201:bc5d:e6ee:8aac%7]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 05:17:25 +0000
Message-ID: <4bbc0fb1-16a2-41ff-b770-21c1e351dbd7@intel.com>
Date: Fri, 28 Nov 2025 10:47:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/1] tests/intel/xe_exec_system_allocator: Added
 64k alignment support
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>
References: <20251128043832.322810-1-sobin.thomas@intel.com>
 <20251128043832.322810-2-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20251128043832.322810-2-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0181.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::8) To SN7PR11MB7140.namprd11.prod.outlook.com
 (2603:10b6:806:2a3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7140:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 393e5cc8-6012-4e5f-5f04-08de2e3d6ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUFFRVdCS2xqWFh4TkQ3UWJvS2tkUUdaejFnR0pvbEpNWDFTRVYwNFlmaXlQ?=
 =?utf-8?B?ZHIzSmdTajZXTXNqV3Z3aDc1RkVrNkVBbmhxOVgxS3VzeHpPenpGblRneCs5?=
 =?utf-8?B?ZXhWNVp5ODJIb0pzNWV3WmU0ZWRZa2JTRkwzaUFRTzI1bkhHSmNjRlJ3OWEz?=
 =?utf-8?B?aGRFaEJ0RjFQdTNtSTk3TXVVbnR6c2NURXhHcXM3WnV4SEdPRUkxaENkQ0xl?=
 =?utf-8?B?WUNiYzVGZGlodWRkSW5JaTRKd09wT1VlMVJ4bWFFNC8wc3o5U3BaS0ZlZmtK?=
 =?utf-8?B?Y1JXQVdiaWhWd3FWdUptMW9ucW5xTnRQeWFvcDVhUEtESG5iN1haVWswWExw?=
 =?utf-8?B?Mjk1ZktnTmxHL1lKSVBwNnVxOVlmKzZIdyt6QXUwNGhPSVlObEcwQ01rYThR?=
 =?utf-8?B?cnViSkoveGJkcnIyTzNBd1NUUEdvOHRBZGRzcEZGT2RWYzBucTdGRnFqL2k1?=
 =?utf-8?B?d0xmdXBkdStnVURNSkZ3bExtdWcvb2VYTjA5UU5SckFCMW5NQkVjY056cy9V?=
 =?utf-8?B?Tk1xVUhjUWJoUnNSOXZtcUFXRTJNK0tXUEZNdGY2ZTVtdGxtQmVQbHRnTUV3?=
 =?utf-8?B?dXJURllVU3FwSjNEeGIvdXR1UFQxK3Y3RUpUaE92ZklrbUdOY1NQb0lybmpZ?=
 =?utf-8?B?N1ZLQlRKSU5iVE5WS3M1Qkc5dnFtNVBxTkFpQzMydiszY0NNQW5xa0Zqei9s?=
 =?utf-8?B?dTZOemNhZklEb0VYcG94SE16S3VFaWRzT2wybDVKOWEwdjl3WDYzTFk1Z3VR?=
 =?utf-8?B?S0RwS3Y5dGkrYTZDbWFMM29Cd05ua1NLTFJzZXBmODdVZ2lvRURZUzF0YzA1?=
 =?utf-8?B?cVQrbWdDT1hoU2lmRm1DdzgvOEtXclJNOUZ2WWc5QXhmRXBFZHRFL3E2bXY5?=
 =?utf-8?B?WVc5K2IzdlNOZmd6UUpTR3BjY2x3UE5DYkk5UHFkKzRmeXNBaFQva3c4ZUEx?=
 =?utf-8?B?UlNJRTRmcFp3QjhCNnF4OFdabFNKdVQ4eG9UNThPQ1dYdEFCcDVpOC9aVWVU?=
 =?utf-8?B?UmFiWlR0VFBySEY3OXE4S1IvTXpRNFZneitEZXIxbTFlU1hkdkkrTXd3VmtW?=
 =?utf-8?B?YUtJMks2UlhoT2Z3cFVDaTZSN0pjLzhvSkcyc0FDa2d2WHdJQVI2TTYzaGRr?=
 =?utf-8?B?Y3JvYktFZXpRNUJMakVlczQyWlNWWmxoZk03c0oxbk1mL2FUa1doajVwVi80?=
 =?utf-8?B?RmhJbmpzVE01VnlSU3lpZDJTcWNLV3gyWndoQlViLy9FalFRZGRrL1VKaEFG?=
 =?utf-8?B?eTFWeU1qSk9ESGtlOC9NTG1pcmN6NE9waTQ1cmVNRnF3MHlubUZSNi95ODRY?=
 =?utf-8?B?MjQ4dlpXWXFkY3Y3OGhWSzlHUzhZOWovQkE1SXIwNzhyV1U0ZXhkb3doUjZW?=
 =?utf-8?B?MW1tSkduVGpHYlo0V3RaWkNkZ1B3cjhMbmUzdXFoekp4SnlLVWhraVZ2eTBI?=
 =?utf-8?B?VWY1YW4zQm8zWlRZUU9Oc3FsK014amRaZFpFblRvbWFFNHVMcjRsNWt0NnFp?=
 =?utf-8?B?dmNjVERHZ1E3dzNna2dmbmdSY2MzdWw2SW0vNDJPb0NSa2pLWjhoL3cveEhG?=
 =?utf-8?B?WTdFVE9YTlJWNWs3bGpmeGhuMGVFa2ZpMjFOclQxSm5KbTRTQUN3MllmdmNl?=
 =?utf-8?B?VTBENldHc28wcTVhOS9aelB2eDdRS3FGR0tiTmZEVlZrVGdRNHAxdS9mNG83?=
 =?utf-8?B?RDVwL2Z5WG50MUg2RThZeXEvL1dTVXpSYU5xR1l4ZERQMUppbE92UUlFYzcr?=
 =?utf-8?B?R1BmaHRkcWF1NVkraGJOMjRLZTJReHoxdld3YmViOGZ5a1hxN1lnQjRuVjlv?=
 =?utf-8?B?ZlZWU01jNUovS2dwbWtBRHRaTS9kV29FVkoyb2JnNXVlOE9EUjZyZkRPRFZO?=
 =?utf-8?B?SnFUcU43N2FqcDVneG1TU3g2RlJCeU1NdExGMkxDRi9BcFRKWXJlcTk0NXNl?=
 =?utf-8?Q?Z4rnkr8i7XSOXDwX1qEI/itcC1vlNsc9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7140.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGhRU0FWRDIwaFZ6NXNDQjB1ZW9SWjE4Y2NKMGo3V2pGUCtkaWtsd01CNUlT?=
 =?utf-8?B?SUtYVUQ2QzhMQ201QUpNZlFwWGpzaUtSUHhqUGcxc3BtRDNkS2JhTjYwWUpa?=
 =?utf-8?B?Tk9tYmVxVVE1am1SVG03cUpNSVUyazh5S0dTd0dOZWQ3SEF5UnAxenNFUUhQ?=
 =?utf-8?B?bG9GQjBaSlpzSFpNa25TWU1IU3NmQTYvbER5WTJOMUpFUkZLZzM2RnNaWFBv?=
 =?utf-8?B?azQ0L0EycE9KVTJRN0YvV29NeUdqV1ZpT0xqU2Jsbm80ZWNHV0lBQVF3OSt1?=
 =?utf-8?B?dk9nbllnTllmcGpKY2xaUW00cUVDZUE2N0FHYi9UTzBMQnIrSzBoVXFCK2JW?=
 =?utf-8?B?eXdaTUZHOHBleVd1Wkp4OTBDdXZGcXRTOHhZWTFvZ21DOTYyMS9JRFY3clEz?=
 =?utf-8?B?QVVRVExYQTNtK1AwWWFkYmFHV3FXcVBhL01nd1V5YW1jcDNyTkY3cmt2OGpN?=
 =?utf-8?B?QVVFU2VBeVpCQUllbHNWYjJ4TUI3dkg2OGRUM05LMmJ2YzdTOTVQeHdxNko2?=
 =?utf-8?B?LytzOE9kdURCNGh5OEtoTnpITmZ0Q0JPUmVoYm9jZ0pyRHgraXdRTHZCbFhZ?=
 =?utf-8?B?aFA3ZjlRUWN0YmQwdnNuYmFvUVpSYVpya1lLSnhmTVVIVjE5eUE5aU1JMStz?=
 =?utf-8?B?UmlCdVZIcHA4TWx4NzdmelJ0N1ZDUUQrekVrYy9vZGwvK1hmMDNWc3ZCQUdF?=
 =?utf-8?B?NTRjUTM4U255QmpobXhKTEN6UmpadDVUcEFBQ0l1dkhYUk14NkJ4TW9wbkNo?=
 =?utf-8?B?MmlCVUNpNEtTWWhaUkhLdjN1N0RMenBxTzVkN0hhNy9zQW1ndXRsMkxFd1Q3?=
 =?utf-8?B?cnVZRWpZQVdYWnR0bmVMeDBRT2d5T1FKZzVka09DNUVSc3RDL1liRlJEeDB1?=
 =?utf-8?B?OEVUMU8weGRzMDV5emYzcDBTSENaS01kVGRXcmFhZ0pSTGVxamFQck84eHFk?=
 =?utf-8?B?MWNUREtkS3dPc0FXTi8vQmJNMmRtOWhZdmdndGtTVDlPY3J2WEU1UFRwZEtW?=
 =?utf-8?B?eHhBSTFtejlUQ3c0ai9NbXg2d1RXS3dMSlkxV3c3MXpqekx0M0RIWWxsZCtD?=
 =?utf-8?B?QVRLam9hUG5vdTZDVGVJKzN0YXZuWmRxNzJnVVJtK2hRaWxFMkVwMFM5ZDZR?=
 =?utf-8?B?VVZYcFc4MHRtbEhGNVZIQndVbDh2a004RUZlT0hUNnlaS3JtVEIzcXIwMDBx?=
 =?utf-8?B?TklKWE9zMEhYZnY3cDY5dExYTGxQWEc4Wnl4Nk1OeEI3R3Q0WGRkZHR1d3Fp?=
 =?utf-8?B?MVpyTHVlZGE5YWlrYTdSRTBReVZqTjhCOThNQ1ljd1JTZUc0WVh6aVdDd09V?=
 =?utf-8?B?aXhsSmZpZEVLRUowSVkwdDIzWGNPVWY4Y0FJYWJEb0lkSVRJeFcrRUhWcCs2?=
 =?utf-8?B?VlpVM3dYM2J1TmNKTEJxdG9BYnNkaUFocm8zR0xGSUhPVUVXNWNhZ1BlbThS?=
 =?utf-8?B?dUl4V1kwSEFMTW9WR0ZvVnZPT2tZTzEyL3JtSjFDcUZtY09sTkxBNmpTQ3I1?=
 =?utf-8?B?OFF1TXZQTGNXNllGSXBMZWE0VzhGYnhKc0IrZFlxT3FsN0tuRDRhRXJubnVl?=
 =?utf-8?B?VHBlQUdPOGpwSnE4ZDNpTjRxVmpaMVJnTGVlR3h3Ukd1Z2NYNFhPTE42dVdr?=
 =?utf-8?B?c1ErMXhBRTZtdk5wcXpSRENYanBERXF4VG56dEdVMERhOWJIWlJRNmIrZ1V6?=
 =?utf-8?B?OHk2dDI1RFVKWnp3U2pmbHJqQnpIK2VxcjZpaXdoTU15RnpRUGtaY0xWZ01l?=
 =?utf-8?B?RDIrQmZOQ21vTEl6YXg4SUxkM0o4aHp2S3lqekhKYzQ1ZkdyMWJjUFVwdzY0?=
 =?utf-8?B?emhSdjgxbDZlZGU2UmlVelVTSXNnUDhqYk9zQmxLMTIwdVRxM1BuckFOcDJq?=
 =?utf-8?B?OEpwb3NwVVdrdVh1SEdXdzVGUGxIM0F6b1RQdm1lSHZ6UTlzNUF2WHNsdjdP?=
 =?utf-8?B?QVBVOWJGb2dSU1gxck5WYUpFdEkveGRoMThUTjYzWXhISjZwZ3BwSEZpUE5Z?=
 =?utf-8?B?WENBL0dlbncySXhYcFlWYk1DN21jQTl2eVR0MmVHNWliTGtxTjN3SVNXMDZr?=
 =?utf-8?B?UnY1RzZJdWRWdlJNZjgzMnh4cmRoUVFQbU9oNjV1TGgwNGNabWphUmhoUVpr?=
 =?utf-8?B?NVFuZjRVN1N1SURYbnhlb0ZFcGFzRXZaTHBWSGFaMUdxRGJOZXdVYlI5VHFV?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 393e5cc8-6012-4e5f-5f04-08de2e3d6ac8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7140.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 05:17:25.6278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyXVAH/6vwYl8gmd9ejPa39daN8yaWa7Hwf0DlwM89Y3i1LTXMxXOmL4zBqZrGL9bqJgv/6T4it+Qa7t9wJqhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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


On 11/28/2025 10:08 AM, Sobin Thomas wrote:
> The original test for madvise split vm only supported 4 KB alignment,
> which failed certain hardware such as PVC that required 64 KB page
> alignment. The test has been updated to include support for 64 KB
> page alignment.

The original test for madvise split vm only supported 4KB alignment
which failed in hardware such as PVC which require 64KB page alignment.
Test has been updated with 64KB alignment in case of PVC and 4KB alignment as
default.

>
> ver2:
>   - Added check for PVC.
>
> ver3:
>   - Moved declarations in MADVISE_SPLIT_VMA scope. (Nishit)
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 25 +++++++++++++++++++------
>   1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index b88967e58..c54a52690 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1251,17 +1251,30 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   	}
>   
>   	if (flags & MADVISE_SPLIT_VMA) {
> +		uint16_t dev_id = intel_get_drm_devid(fd);
> +		uint64_t split_addr, split_size;
> +		uint64_t alignment = SZ_4K;
> +
> +		if (IS_PONTEVECCHIO(dev_id))
> +			alignment = SZ_64K;
> +
>   		if (bo_size)
> -			bo_size = ALIGN(bo_size, SZ_4K);
> +			bo_size = ALIGN(bo_size, alignment);
> +
> +		split_addr = to_user_pointer(data) + bo_size/2;
> +		split_addr = ALIGN(split_addr, alignment);
> +		split_size = bo_size / 2;
> +		split_size = ALIGN(split_size, alignment);
>   
>   		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>   		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id),
>   				  bo_flags);
> -		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) + bo_size / 2,
> -				 bo_size / 2, 0, 0);
>   
> -		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data) + bo_size / 2,
> -				    bo_size / 2, DRM_XE_VM_BIND_OP_MAP,
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, split_addr,
> +				 split_size, 0, 0);
> +
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, split_addr,
> +				    split_size, DRM_XE_VM_BIND_OP_MAP,
>   				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
>   				    1, 0, 0);
>   		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> @@ -1269,7 +1282,7 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   		gem_close(fd, bo);
>   		bo = 0;
>   
> -		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size / 2,
> +		xe_vm_madvise_atomic_attr(fd, vm, split_addr, split_size,
>   					  DRM_XE_ATOMIC_GLOBAL);
>   	}
>   

Modify description. Rest LGTM

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

