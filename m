Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413AACD5BCF
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 05:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A9310E203;
	Tue, 26 May 2026 05:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCzyeCmA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E534F10E46C
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 05:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779773103; x=1811309103;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=XUraV9bBX8OnPfkb1CMVCM78/nyN5YgR4y8yL4YXu0w=;
 b=fCzyeCmA34e/5uS59QiBeCjx7r35GViwaY1YhPCk+ykXFvaZC7xrFltx
 ICjKlPyKZ6eA67Ean1oEKkl9yvma5ENtqnyLjvC3pEkgllR2W6T3l13wR
 06mLOmLiVzaF/SAMqXtEEfjVy/CtzDa++H2ei20uQ75CQxob2TNK5NinC
 0WQtQ56+9mth1bc8MXr+9DdvCz8RGddAuTHMEzUe4wVkqnLo4NiMKI0ms
 d6Y7U42qa5Xw3t6RTgOYlaujE0xaF/dDrnDXnTjIdGW7OQbj2vw+7Xtvp
 nygQW6vIEd7t/+uBaFckNnCbtyAG2GJaFK5k5OPoQOnF6ondFnCcnFTg4 A==;
X-CSE-ConnectionGUID: nXw1cMcXSfWzDk88r8tpjA==
X-CSE-MsgGUID: RKi/G4GET/i/llM0qTbTfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91686097"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208,217";a="91686097"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 22:25:02 -0700
X-CSE-ConnectionGUID: 1goLFNt1QqekpqMAb6Ughw==
X-CSE-MsgGUID: 1/p628vTRPi0LnRZeP+yBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
 d="scan'208,217";a="237387017"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 22:25:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 22:25:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 22:25:01 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 22:25:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=II1TxAvXfwdCOWblI0ZQVu75yahcGCAkVuNEVTTeTwc8f2OClSLDFIS0y5Dvv4hp4UThoo0cT0dOgyq2yI+UQvrBcUB3nkgnOI+0Jp0DGUEw84OKWKDE13w+nujYjJGxImJrc1PxknALVDvB6EiU4+3UXNR/ZxXwBUhuPbfuVgFjMF09iGuDTlYzSeOuVfagRdy2fiiNtBG9Z6+0wvd/KsZeFxmKRcanIqNV2rOivxZpufK/n9nUFPlNNznkbGVYBdV6JXd8R/b1+gppnxw7bL4WAgXICuzBJ+xJc724wgFYJzIIyMxdmAsAL2pFGm6gcfgnIB0+IPoXgOe96o5HVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d0w6/FLT9hgdfPtk+62JPN/cccJaIJ/GMgCaELn5ps=;
 b=kT6IGpALez1O5ws9qubo9A8mJAKsRud4qGVCK3AXCTvIsPFY16gCmcHAFQbQUlsw5KzlCVBJz2FlpLcYSgo22o07XhRkkiWPwAMbSmDmV6y1vtYGS4UKc8InSs1PvUzas3T7dOucBuJ76fIr8eZ0arG0YA5hFRQ0AwiVlyNujhWDIkBZnIIShEF8c3TZ7Lx7OCuW/irpIVsMkdz80U3c36h9Kh1k0laVxljWas+NBIDseAhYa+KdWZrH7bLDJk0VdIRHU2OIEjOSzxA1GVRm4QQ/iZE9Iy0nzXneYGXXKdbEI5TzvZ/Adg/hnpsKy6AcS/gFUm/rBufoAk8Xx9EvuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 05:24:54 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.21.0048.013; Tue, 26 May 2026
 05:24:54 +0000
Content-Type: multipart/alternative;
 boundary="------------hY07QW9A7D52FuulDOnvepE4"
Message-ID: <365c7be0-9a35-4567-9c75-10a5c151f2e2@intel.com>
Date: Tue, 26 May 2026 10:54:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/9] lib/intel_batchbuffer: make __intel_bb_create
 gt aware
To: <igt-dev@lists.freedesktop.org>
References: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
 <20260525163850.3493602-3-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260525163850.3493602-3-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MA5P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::14) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|SJ2PR11MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 3964028e-796c-4a40-1a21-08debae71e11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|22082099003|56012099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: xO4Vek1RTjjH9X9nqx2anyOB1XL2L3nOUTiQj3ytr3K6nghJQebkZiby5X8M7wvBUI7EA60zLJyIuqAivy41GRq8pPpOhFARg+nHxZ0AzOlNvKWjp5ugb+A4f3KopKHYIdaairM6z3XhkGsDT0Xl8TVNJUoKHPiS9mwZ/tD5JWH29bSEgrv6/PmZxc+fdlq/XsQjhPav+Ss9ptwGh/kF2hCumVaClmFcfN06N1WFmqK9LU5tChP5bOgx1GAkbVh8R6ZHgYesY+eb74G79NZzHMNzljPj5+6MZJvmNRHuiv+maMhRYb7G6pLhiqE13d0WrCFdSvFk9UjN2wOWlVLScLq19Udc7jCa6sgk/LtNCL8qam8UKTkfPpY44SHVYcFKt5JURPb9//Q0feHq7WAMZbK1gqM6PX3T6XaplMXZj8tE4L41kZJVHMBixAvbZKgqQ60w+Fbt7LW3TIWxC+/Rx9mqQHWBUdsZNtHMglb1gDvN5ihbGqhx7Jz1AeUivB4KkYq36kiteJ5r46Mnza9CskDr/HoCk2hqzc6YuejrsLxpStGRi5+fd9kY4O+171MQmopCCevhq6H5vuXSM/S19Z/7eiRxEHvCN2hhJ2gOYu7lmHNHispdRJYSvHeTQPQcOzG5jgplRsbmA130StlCVMVGi3ytcTJzNjw9RTvUKBgN41tV0hyXBBb+coKI9RMB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(22082099003)(56012099003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmh6R0FwTlFPdllwWWVTV0pYdDgzaTh2RlNBMUpCR1pUMTRGNXN0aWdHcStV?=
 =?utf-8?B?cTJNQzNHWUdUTnUxbzBTN3FtajdVYkNBQ1NUK3Y2YTV4MWlmUGRBNGZtdUtG?=
 =?utf-8?B?eDJvMFRSTXdHKzZLOUd0bHByWmhUTHFSQ2RTTjY5ODl6dE1ZWHJnVkRiNllG?=
 =?utf-8?B?UlJ0S3BJcjJORlBDNjR6RzIxdkpQSE9QSXlxdDM3VzVTeGo5dUNjZVZKZVJr?=
 =?utf-8?B?b2FLZzVVb0Q5NEhZZHpTNDA2a2E1QkszRmxkTTduVzAxQzVvaW9MS012eWc2?=
 =?utf-8?B?VjkvY2swVW1ZeXYyZXNVZE15dEZzWStkZjlqaFk4Wk9SVEh5WnFyQ1Nvckh3?=
 =?utf-8?B?elNaVnZEWU1jRm9FQ25RWG1vQzlIRWZLWitZUVp0YzlaUlEzb1NrSFJ1bHR4?=
 =?utf-8?B?NkdRWWVPeGlFd2FnR1ZGRzA5eC9FZTdkWkNiUS9EYnNTc3VRY281NHphcjBY?=
 =?utf-8?B?Q0RxcjRNaHROaFg4b3hGRCtrWDBsRnNzbGRNbStwNVZrNDg0MExvQ1R2RFBF?=
 =?utf-8?B?WkE1bzRyMmRpS2FSOUZ4QTY1cmxYR2xYbXNhZTkvUU1FZzBZMW41WWVpY3F0?=
 =?utf-8?B?aGJwRXZ1UnYzSnV6bVlmU0IvaU9Ca1dBSWlqU2EraWJGY25QMlZaZmNNOFJN?=
 =?utf-8?B?MURTaW9jb0ZJZmpmQkd2YlJGWjM5MWJ5VlJNcWhRLyt6WXVkS2ZCM2pMVDVw?=
 =?utf-8?B?SFR5REozNUZieVJqa0s0bmJsbHIwM0ZlbDBmcDRTYTZ3ajZxWEZqb3hjNktw?=
 =?utf-8?B?czY0UEhTYkNGYnVrSGVOSUNBem1sV1hOa3BqL01keHAwbEl3bTU1MEoyNEph?=
 =?utf-8?B?VHQyS2VuYUFBRXhKdzR4MUczQk1ob0ZGM1VqNjhVT0hsTGgwNVpzdWdjamtF?=
 =?utf-8?B?UXRsWlBCZFRwemdGbW1PRDU4VkpzVHFZdnBKaXVaejJ1Y1kvY3Q1bWtzT3p1?=
 =?utf-8?B?Z1lDU2ptaVI4VmMxVVdSblB0LzQwYjBUVTJlSGNpdlcxM0EwNHNzWE8zQWFO?=
 =?utf-8?B?aWxNWG4zcEhPdU9Pa3FIeFlMejVzbmxzeXkzN1NpOHoyR056VDZJaW9EOW1H?=
 =?utf-8?B?eVlLcnRNdHFoSnptbTM5MHdiWHBxSmlCeHRhL2g0OWwrTXNoV1dueGZCM3BN?=
 =?utf-8?B?cStCRHkxUW5VVGpCdE1MMXFpU01ZUnN5bm5LT1M3OTg2ZXdnbmRaTSszMWtw?=
 =?utf-8?B?byt5UTdpTzBXaVF5OFNBeGwvOGxQOHdwdk9aVXZsVngwek56TXV4cXM5NHBZ?=
 =?utf-8?B?WmRmbUhaRjdTa2tXNVR2Y0lVMnVLRGY2UFJ2UWVvYTJWaFVuU0ZORG9NaW91?=
 =?utf-8?B?cm9rTURxdlVJSmllQjJNTDFOS2dibGUvOTlSck1GVGtMSGd6VTcvVU9TSDV3?=
 =?utf-8?B?U2pwR0Urc3BkSTduS0d0VUdHMTFsRElwbmF3dnN3MW5yYnVmVmw3QjFNTkk0?=
 =?utf-8?B?MVlTb1VJSnljZ3ljL2xmSmxGdlA5TXY5S2FWSWw5ZnI1N2lHaGdrQUh5cGlq?=
 =?utf-8?B?eDBVWHg5UjNzaCtaMm0yd2dWbzJGa1NlL05DWlpzSFZiS2Q2bFBvbjM2dmsy?=
 =?utf-8?B?Y0ErSjFUKzcrSG9ST0QyUy83Tkh1bnpWTHllblpWSTVXR1A0MjRVZGJqQUxv?=
 =?utf-8?B?eW5kRWdlL3ZJRFI2L0lLcDN5Z3YrSm0zazZSVy9pNUlyV292Q2hhMEdhQlR4?=
 =?utf-8?B?M1ZTSnZtNU16YkJ5bzZZVWNBVTdmV1dZUE9MTk1lcmNNNXBQd0hzSjRiZ2Rx?=
 =?utf-8?B?cVpUcUZvckNNMzVRNDREc2YzU3I1OWsxRmtMcXhoZGxPNld5TVJGMWhiT0pG?=
 =?utf-8?B?ME04bFhHekpFTjcrS29FRG4wNmFKQUw4My81YmdzcThqOFhheE5qWHA1bjd6?=
 =?utf-8?B?R1NwMzBUZjRoSVZVZTBhWUNvNG5mZ0pmNTNSK3k4ZVZZcUduY2tqemRNQXp6?=
 =?utf-8?B?cFIwYm5OdlFmV0E5c1dET3RmWU1pNkpvcWRQUGlhTCtHMWduL3VIZURmeHJG?=
 =?utf-8?B?WUVJL01KcVA0eUNiL011cVVUbld2b0FXM1VCb3dZcWFCSHlkcmV5bmt2bDZX?=
 =?utf-8?B?TEFwZVRJNFpTV2Q1MWJkMy94S2FjTWlVNDAxMFBsSnZSSG9TQ2NjR0NOL3JJ?=
 =?utf-8?B?YnlScVJmN21TU1l5elJaMkM4UXNlb09GS3VnZjR2UzAyYjhjdkdSRjhESklO?=
 =?utf-8?B?S2RGMG9raHB4cjQrM0JoTENTNnY5aUlNalhlNlM2U2pHZStIdXZOb2MxcHVP?=
 =?utf-8?B?bnBxNkxKd0g3VldIekVBeU8yVXdYRWxEV2hxeXZvSWs2azRnQk9BcDhXeUZa?=
 =?utf-8?B?RzUzalg4MEl2Zy93ZWIvVlFDUEVqVzlxM3l2VFJONnRxaFFvTGVoOUovMnNj?=
 =?utf-8?Q?JuTyZWCBw3KHFAz4=3D?=
X-Exchange-RoutingPolicyChecked: qx78bb9PI7QPqNh2lNfbQnHIRh6s+n9LOAhZNyWCMB1JN8qp3otxCsM8HWh+OtryhSWR/FKI+0bdldqRc61zr0//p5N/Rst/l4saGeG1FCwhzyT8KkIlf+75ul+by/4K/BGb5YRFmOhv15QhctpLyd/mZ3XvIKpzx7mW1mukuZH4J6Z72+CNqYNxD8LkNx+lTU5Rkhc1LyQR7d3WiqvhSwlzjLYcHuLHTZ+tJz5f7f/B0yqCuTzErPPlLZ9ZEQzvmwIWLGcx2HXO6jpxlyGch/a16rgn0OehqBNwU46d1m4gT+rfGehHOso+ySelNMiZ1XvnjPA2VQOEEeeAyoPJkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3964028e-796c-4a40-1a21-08debae71e11
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 05:24:54.0766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENwgkOJmFrdHLFDnboJFTcp5ssyNX1EWzynmDkShigNNM8Cv7R87IcW4m7Ior19a2rkNTCgClcATniuxDdKhYryvO6dwtDqLboArd4BNhf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7715
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

--------------hY07QW9A7D52FuulDOnvepE4
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi JP,

On 5/25/2026 10:08 PM, Juha-Pekka Heikkila wrote:
> add possibility to use gt id in __intel_bb_create
>
> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_batchbuffer.c | 21 ++++++++++++---------
>   lib/intel_batchbuffer.h |  1 +
>   2 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 17b2b8625..536e8e402 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -864,6 +864,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
>    * @do_relocs: use relocations or allocator
>    * @allocator_type: allocator type, must be INTEL_ALLOCATOR_NONE for relocations
>    * @region: memory region
> + * @gt_id: gt slice id for xe, unused for i915
>    *
>    * intel-bb assumes it will work in one of two modes - with relocations or
>    * with using allocator (currently RELOC and SIMPLE are implemented).
> @@ -907,7 +908,8 @@ static struct intel_bb *
>   __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>   		  uint32_t size, bool do_relocs,
>   		  uint64_t start, uint64_t end, uint64_t alignment,
> -		  uint8_t allocator_type, enum allocator_strategy strategy, uint64_t region)
> +		  uint8_t allocator_type, enum allocator_strategy strategy,
> +		  uint64_t region, uint16_t gt_id)
>   {
>   	struct drm_i915_gem_exec_object2 *object;
>   	struct intel_bb *ibb = calloc(1, sizeof(*ibb));
> @@ -917,6 +919,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>   	ibb->devid = intel_get_drm_devid(fd);
>   	ibb->gen = intel_gen(ibb->devid);
>   	ibb->ctx = ctx;
> +	ibb->gt_id = gt_id;
>   
>   	ibb->fd = fd;
>   	ibb->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
> @@ -1061,7 +1064,7 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
>   				      enum allocator_strategy strategy, uint64_t region)
>   {
>   	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
> -				 alignment, allocator_type, strategy, region);
> +				 alignment, allocator_type, strategy, region, 0);
>   }
>   
>   /**
> @@ -1088,7 +1091,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
>   {
>   	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
>   				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
> -				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
> +				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>   }
>   
>   static bool aux_needs_softpin(int fd)
> @@ -1130,7 +1133,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
>   				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>   				 INTEL_ALLOCATOR_SIMPLE,
>   				 ALLOC_STRATEGY_HIGH_TO_LOW,
> -				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>   }
>   
>   /**
> @@ -1159,7 +1162,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
>   				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>   				 INTEL_ALLOCATOR_SIMPLE,
>   				 ALLOC_STRATEGY_HIGH_TO_LOW,
> -				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>   }
>   
>   /**
> @@ -1186,7 +1189,7 @@ intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
>   	return __intel_bb_create(fd, ctx, vm, cfg, size,
>   				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>   				 INTEL_ALLOCATOR_SIMPLE,
> -				 ALLOC_STRATEGY_HIGH_TO_LOW, region);
> +				 ALLOC_STRATEGY_HIGH_TO_LOW, region, 0);
>   }
>   
>   /**
> @@ -1207,7 +1210,7 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
>   
>   	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
>   				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
> -				 REGION_SMEM);
> +				 REGION_SMEM, 0);
>   }
>   
>   /**
> @@ -1233,7 +1236,7 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
>   
>   	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
>   				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
> -				 REGION_SMEM);
> +				 REGION_SMEM, 0);
>   }
>   
>   /**
> @@ -1258,7 +1261,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
>   	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
>   				 INTEL_ALLOCATOR_SIMPLE,
>   				 ALLOC_STRATEGY_HIGH_TO_LOW,
> -				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>   }
>   
>   static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index d0a7c8dc7..7049dd2d0 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -269,6 +269,7 @@ struct intel_bb {
>   	struct igt_pxp pxp;
>   	uint32_t ctx;
>   	uint32_t vm_id;
> +	uint16_t gt_id;
>   
>   	bool xe_bound;
>   	uint32_t engine_syncobj;

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

--------------hY07QW9A7D52FuulDOnvepE4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi JP,</p>
    <div class="moz-cite-prefix">On 5/25/2026 10:08 PM, Juha-Pekka
      Heikkila wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260525163850.3493602-3-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">add possibility to use gt id in __intel_bb_create

Signed-off-by: Juha-Pekka Heikkila <a class="moz-txt-link-rfc2396E" href="mailto:juhapekka.heikkila@gmail.com">&lt;juhapekka.heikkila@gmail.com&gt;</a>
---
 lib/intel_batchbuffer.c | 21 ++++++++++++---------
 lib/intel_batchbuffer.h |  1 +
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 17b2b8625..536e8e402 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -864,6 +864,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
  * @do_relocs: use relocations or allocator
  * @allocator_type: allocator type, must be INTEL_ALLOCATOR_NONE for relocations
  * @region: memory region
+ * @gt_id: gt slice id for xe, unused for i915
  *
  * intel-bb assumes it will work in one of two modes - with relocations or
  * with using allocator (currently RELOC and SIMPLE are implemented).
@@ -907,7 +908,8 @@ static struct intel_bb *
 __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 		  uint32_t size, bool do_relocs,
 		  uint64_t start, uint64_t end, uint64_t alignment,
-		  uint8_t allocator_type, enum allocator_strategy strategy, uint64_t region)
+		  uint8_t allocator_type, enum allocator_strategy strategy,
+		  uint64_t region, uint16_t gt_id)
 {
 	struct drm_i915_gem_exec_object2 *object;
 	struct intel_bb *ibb = calloc(1, sizeof(*ibb));
@@ -917,6 +919,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 	ibb-&gt;devid = intel_get_drm_devid(fd);
 	ibb-&gt;gen = intel_gen(ibb-&gt;devid);
 	ibb-&gt;ctx = ctx;
+	ibb-&gt;gt_id = gt_id;
 
 	ibb-&gt;fd = fd;
 	ibb-&gt;driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
@@ -1061,7 +1064,7 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
 				      enum allocator_strategy strategy, uint64_t region)
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
-				 alignment, allocator_type, strategy, region);
+				 alignment, allocator_type, strategy, region, 0);
 }
 
 /**
@@ -1088,7 +1091,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
 				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 static bool aux_needs_softpin(int fd)
@@ -1130,7 +1133,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
 				 relocs &amp;&amp; !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 /**
@@ -1159,7 +1162,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 relocs &amp;&amp; !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 /**
@@ -1186,7 +1189,7 @@ intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
 	return __intel_bb_create(fd, ctx, vm, cfg, size,
 				 relocs &amp;&amp; !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-				 ALLOC_STRATEGY_HIGH_TO_LOW, region);
+				 ALLOC_STRATEGY_HIGH_TO_LOW, region, 0);
 }
 
 /**
@@ -1207,7 +1210,7 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
 
 	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
-				 REGION_SMEM);
+				 REGION_SMEM, 0);
 }
 
 /**
@@ -1233,7 +1236,7 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
 
 	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
-				 REGION_SMEM);
+				 REGION_SMEM, 0);
 }
 
 /**
@@ -1258,7 +1261,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
 	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index d0a7c8dc7..7049dd2d0 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -269,6 +269,7 @@ struct intel_bb {
 	struct igt_pxp pxp;
 	uint32_t ctx;
 	uint32_t vm_id;
+	uint16_t gt_id;
 
 	bool xe_bound;
 	uint32_t engine_syncobj;</pre>
    </blockquote>
    <p>LGTM,</p>
    <p><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span>
    </p>
    <blockquote type="cite" cite="mid:20260525163850.3493602-3-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------hY07QW9A7D52FuulDOnvepE4--
