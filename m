Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE8BC369C2
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 03:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BBB10E194;
	Wed, 23 Apr 2025 03:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vy40Qf9y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231E510E194
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 03:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745378968; x=1776914968;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=T6l82Yas16txxNoDKB3zsVcxiAB/Cel3vu6kVVCVjtg=;
 b=Vy40Qf9yVv/5pw0DNKk/NuLfFFEfHLPmtDRd6JnrJdMkmvW/KcJgaeAb
 GU1ddMOgM6sYy6noJ/BNMBRPyP2AEOeZnm5WjfAJZ7mvj7AtIjOUgS9b6
 nLe/5vZgvhwe3hGvYoh2X3tsOhGDWaP3QkM0Qn/5YBsmtVXkm2AskQJRV
 gEVxPeA5/ZMBAvmV1rfn/ti8ul8BJx/6ehy6U8dEehULNnMDfMfwcaX3C
 CGTObNYTnU2GVzaQIs3XoVxnCNkXRMKn9FcJ3qSeKf9GEc7iXkPRSeiUk
 Qa/SGDA1a0y/U1NjqfEwMc1uSIotN9v4+PMmDVGeOIOtSixtOFOWhKjA1 w==;
X-CSE-ConnectionGUID: lcNmEM9XSSOoRhUNguJHcQ==
X-CSE-MsgGUID: aswLcAsIRtaagow4SIirFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57939270"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="57939270"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 20:29:27 -0700
X-CSE-ConnectionGUID: m2rIE1w9SpStO10635B9rg==
X-CSE-MsgGUID: k0dwknkOQfu7XwMDy0CpkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="133069284"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 20:29:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 20:29:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 20:29:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 20:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFkznnptvS+Zs/gEF0EWKTH/JYkiWqamMT4Y97LVCUv+tsEJ9dO7ZQV5E+vRE8VFFSBrMOLGsdgIeCIhNRa1tjzHzbP2a5mZRCXU8kk0B/cDWvwn+seeMXccSQSWuHnhT6uXJLJyNLTkUWdIojzkCSGip93nhmlwqtqdHwZyLkjVxjlfqEz7de2fmQ3lM8wsGvX1r9oWR7PRJYs2mSloFRLIPLRyQWgtVKyn4OF9nbKx+ubDGnTNlWM50ezG6+jjHu7zJiw01fpNmt1HNV2OjUVaRd0BaEQvYtVkKCJcTzERzoW7DNIRWzvhqMZVw5JfRrj/C13BcGN6sCs5bNb5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KszpddsS3iTvFU7OoHWNeDhjqRAX6p981bFeUJHrObA=;
 b=ucD08joFrPmnic63V+8zH9GqjmPKOUfvbcZHcZhFgquatUnmtm/F76tlm4Hh2wu71GziDfEWHXBIHG7z5Nx//mzn0NGaeM0ysAwmZWZ9/UaVt8fejSqXrkeDXD2c2BiyY0KL+LigJmbpI7E4bAiVeIw5gDJHNnuC7NIshcMba7NUZCfYORhVJ8735igBB9kWUvKIid2Mzr0nnaXWAAe9jjuo+DwW8HGJyuck99vRpfq86J83086lhS7HICqZ16VbatnPOZM8xXcMS+KkLL1k9BR8K5zSIxLnhpB8hkd8W4dow6OdBG2cX9fAgBsKx/k49nZcp/2Rdxpll3S1g1v5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV8PR11MB8747.namprd11.prod.outlook.com (2603:10b6:408:206::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 03:28:42 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%5]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 03:28:42 +0000
Message-ID: <419ae9d3-d032-4a23-a756-40c408e43ab5@intel.com>
Date: Wed, 23 Apr 2025 08:58:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 09/10] lib/igt_chamelium: Add
 chamelium_frame_eq_or_dump_frame_pair()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250414111657.794484-1-swati2.sharma@intel.com>
 <20250414111657.794484-10-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250414111657.794484-10-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV8PR11MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: 281e413c-590c-424f-5571-08dd8216f1fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V09VYXlOU2F2SUExZTZYVWFTeUhqcll2V2graXowQjZIVWxaMTIrZ3c1VW1o?=
 =?utf-8?B?ZFRIcy9NS3A4Q0RZOTZZcXV2NzdXUEpJc1RIT28rc3lyM1FtK0hNUTlQeHhv?=
 =?utf-8?B?VUtvbm1XNjBPQmtLWXV3NnhJbEJqaC9mc3FZODI4WCt4eU1qQUROYkxQak5V?=
 =?utf-8?B?LzQweUxEbGpsT3paS0pZeW9nNjNHUlZsRkVJVlVRQkN0RzdLNHRzZFY0czNj?=
 =?utf-8?B?d0FkU0xkcXBOZmtxR2ZNSld1V2FGN1ltMllEbloyUzdIQXFZKzBSLzJjVmJp?=
 =?utf-8?B?SitsdFpKZEVIeit1TGt6QXRhZGxqUFp3NUdPckpXTDVLcGljZzY5U0ZSSEt6?=
 =?utf-8?B?Nm5LeDVOOFlQWEZBbmdSbDZvdVExbnR2U0NLQ3lvR1pTWEVnMC9rdU50VnZq?=
 =?utf-8?B?TGlSNFBxY2NvSjdPUitQQnhIakFVM1pUUzZLNDRURlgyTk52N1VQR2daMGJ0?=
 =?utf-8?B?Y1hadUtic2FXb09KQWJ4L2JLYmRJTktHR2paQ1hvK0drcHBvYXVRb1RObitL?=
 =?utf-8?B?R0d0UWQrNGhQbDc3YjhVRmg3a3J0WGlacXdLaUd1WTJUYkdzUjVKT3d1M29M?=
 =?utf-8?B?eFJWeUNNMm9EZXhnZURIV1Z4Sk95c1ZsWFNEekVGeld3Z3dRdFVjSzJqdTRL?=
 =?utf-8?B?by9jTEJKUTFWM29HdHlMSDdPZkpvQUwyWERCVG1nVHFSd3VWb3RveUtScFpO?=
 =?utf-8?B?RWQxSERZVkZyZkN1YUphZUNaTFFycUhkMmxGeWlyZ21sQ2FkZkF5YXcrdXdr?=
 =?utf-8?B?Q2JxZjZjZndPZkM1M2VReGY2YUpST0FvYWtCTzZMeU1td3RmaXl2c04yQ1hH?=
 =?utf-8?B?MFZIMXRkUllaM05XZythbEhSRitBdDBmK0hyN29ad1p0T2xaUlVmbjRjT2E0?=
 =?utf-8?B?SEdRUU1hSVMydjhPeEtYWmgveExyckdSTWtpVmdocUhleFV0VkxMV1pvZnFS?=
 =?utf-8?B?OEFERjVLclJCaEJadTZRNFNvbm1wTWVIVUVSeWNHOElES1VQVmpzd1RYVTFY?=
 =?utf-8?B?WG1aV1dpWHZWVGZiZFRMVGphc0FSUjJ6TkNYLzBoMzc3Y1YrUEFtRjNJR0xz?=
 =?utf-8?B?Vkc4Z3FZb0k5cUw3SkVLczdwMmdGVkJkTnN5L21vTkoyc0VyYjhaaGdWVzJ2?=
 =?utf-8?B?SGNlaHJVei96a29NN0JDMmljLzcrdndXU0pQSWpoUUJzeTgzLy81b09WVXVu?=
 =?utf-8?B?STcvOTNDY2xLTWpJZUcwak9za1lhTnc2bGRGYi81UGlEY2xnR1RXcnI3dHJD?=
 =?utf-8?B?SWZYVHdzTkxsN1B0WmFpS0pGaHcrK204QWxRZ3Nwalp1S2tXNWVYRUlJd2RJ?=
 =?utf-8?B?a245QUo2TlFSczBLcXdOQy81NHhnM09FbnNjUVBuU3oxSys5bWE2L2c1Y0dE?=
 =?utf-8?B?b2g0RFpHNDF2Rjd3OFVxRjdqRFZLNjRJVU5LajhuOXJ3SXpHRGNPa05wOGpQ?=
 =?utf-8?B?ZGdUOFVzeVdNc3RwaGdtbWVRT0Rwc29tTlNHa3k5YlhjdytHaWgwR09zbWtW?=
 =?utf-8?B?Vk10ZmdnZVU5bG10dDVoSVJLdmM2eFpWLytNSUdGdjJPdVdUR3Z6bVBNZnlI?=
 =?utf-8?B?bU1pRm5SblZXUmlZOUdadWNLR2RiZkt4RXRRZG5OWERyOU1vaGlMSzRJZU02?=
 =?utf-8?B?ZzBZMUcvOVBac2JZODRRM1FINnE3TkI5Z2FKRm40MGhDUmF0VGhXR3pwbmF0?=
 =?utf-8?B?OTF0UVZkQnZXUWJUT21jSy9SNzlHS1QrME9hZnkwU1I4KzAwWEtEOTNIcyth?=
 =?utf-8?B?Z2x5dnNvTUVWWjg1ZWY5Z1JjRHI3Q1doNnhFdm4raXErVFF6eFd5YXZwVmxC?=
 =?utf-8?B?Y2I5L3BLRktFMC9SZ0JTcFphNEpKYlRXZTEyTU9VRDVEeDZJL1g5cHNZYzhR?=
 =?utf-8?B?NzFTTnBkSENkQ0RDeVFSTTFUY0lMMVFTQUIxQWdQM2kvTkVab3dYWEdkYjEx?=
 =?utf-8?Q?gj0x+aSjxDo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFZBa1BocFBBendIMzhLYThUdkgrejF3M3pGbXdNdGJFY1FscUxXbW85RTNt?=
 =?utf-8?B?ZGhaZWNoSU5CRHUwMERhNGNQSXFQN0NBeDBUNUhlTTFDTTZYWVlsYWw2Tjhr?=
 =?utf-8?B?bzR2aENWcWdLa1hoZEN1YUZYR3BiNnNsWkN0cnZhOWdYMHR6WkppSHNFRmxW?=
 =?utf-8?B?UnROUDhRcktVZG9VaHB5UTBXZEVNdDVuQzN4UHF2aDNlUldpRDJ3TDVTWUpu?=
 =?utf-8?B?ZmRoenlodXkwRFpUOUFpejRvSGh0elRUZFNMd1ZuYnh2VzdldGQvMVlWdmg2?=
 =?utf-8?B?VTBtWHE0OEFDd2h2UWlSRmJ5RE5MYThob2ROK1kvUDhRQ0hoUExPUys0S1hl?=
 =?utf-8?B?MzEwdUtaN2diS0tHcjBxVjhyR210SGRta2hjbjVmWlZ6UGdISk55VlRoRTJn?=
 =?utf-8?B?aDJXMXRzZStDSjVuRnQwY1daN1NKM2hxYTl5Kzd4WnM5NUp1TURGTTVseVB6?=
 =?utf-8?B?SUhGbDRzNEtoTWF1eFF2NHpZTXFGeWxnV3Zjalo2VHRSc04vbFJCbVNPSHJu?=
 =?utf-8?B?SFovcGt3akJQUHVtZ2I1b2ZpM2pyYWN6amhkS3FmQVZXZE1MR0lCa3BnbVRJ?=
 =?utf-8?B?eTkyMmVSaTVxbmRPMG12MzdmQkdWcjRXOXhMVndNMS9mcXI5NHBSTVVlb2Ir?=
 =?utf-8?B?ZWE2bGNxcWJTb3VTTXRqeDY2dm00bmZ0WEpEWHM3RUQvTDl5azVCS1c4ZkRG?=
 =?utf-8?B?alUvQ1VLYUlaek42M0V1U29NQTVWYUV5RHZuSkp1K0pVTm5ncTV5a0JrdndI?=
 =?utf-8?B?cTNaZTEyVlZ0WERvc1pvVnplMHY3cVdmbHZoRjlvaGtSRUN0WTJGTWd2RTdD?=
 =?utf-8?B?UGJpVjVxclhkMDBCb1dacVRQdXlQU0dHTHJhdzJ3VXFZYVo1NWdPRC8yN2VZ?=
 =?utf-8?B?Z25mbG5yYlRrTWNzenBNcGY5OU9FSnZaSnBHYWMyV2MvTU53Mmp1dTNkT0x3?=
 =?utf-8?B?ZGlpVS90TVB3QnBzTmlXQlYvTkRHNlJMWW9EZjBBaGlLbkE1OTJNazNtbVkz?=
 =?utf-8?B?ZjJlYUJtSkg5YTkwVG93UVlNeWRxeUo1cGhwVUxER0gwVDQreTZUOS9uQkE1?=
 =?utf-8?B?OUp0NGdWYUFjK2t0WTNZS3pYdnNkL0k3OTNQVUFnekp1VUlCZGNpR1ZVaGtn?=
 =?utf-8?B?R01vMzFqQU1qdFVFTE1GK3J6Q0d4cmo5WWNhTmxoQkRvOWl1WDZnUys2RVRn?=
 =?utf-8?B?VTMrVy9vZEk1M2NYT3VIWjdNVlBkZDBDTVF3QlFkeERtWXkxUFhrWURCVUxh?=
 =?utf-8?B?RUNVczVMSnU5WitVNUEvRjcyWW0yUHZEY1NKblZobzYvd1ovS2V2aDVxd25H?=
 =?utf-8?B?VmlKbXd3ZGw4M3JlYnRISU9odzdzNVd6eU1LRTExUUkrcytoNnRDaVdxaWkx?=
 =?utf-8?B?SzMzTVpxb1YrUDdQMW1wQVVWMDJrY2hyZ2lMUWtnOTNmYk1BWU1pQ0RBcW9M?=
 =?utf-8?B?eWpyQUM2RlZwRllnUlc3bVdNcDByRVlxK2lrWEo2azlhNWJtTDRUN3BhaXBq?=
 =?utf-8?B?TGlPalEybWdDc1Q3ekhxaW5CYmh2MGZ0S1lyK09YUXVFOHV3WWpGLzUzRitN?=
 =?utf-8?B?TFh2OEZnaFNna1JEZ21nNG5CbERIam5ZQWdETUtJcHNzdDBOUFRETHZHREJH?=
 =?utf-8?B?UWIwQU1HUHNTSURpWGJNNUNwQmt3NWxmTmRvbG4wQ2tKVDdkcHMvMHNzYk5Z?=
 =?utf-8?B?TDJjUHh2SHBuejh1NGpqUi9uYmNGOWhnalVtcWtQMDhtaWZwK2t6ZTNOR1Zt?=
 =?utf-8?B?TGFHaTVCTmY0U2xtbEV2blEzdTZpQmlHcWYwT1BmRng1OXFSc1ZhNjVSNWxF?=
 =?utf-8?B?YUVvWjd5dDkxQmo3c1hqelRyK1BmUWc5U0xXNXdVRk14Vmh4NWxKR1h1UlNa?=
 =?utf-8?B?M0JreVZqUWVoMGRHNEIzc1RBb1FSZmJKSkRYZng4UGdtbUQ2U3YzbU9GS0VY?=
 =?utf-8?B?bVRYRWRnM2FtVHd1bWsvU1hjZ2dmZjk1M1U3T3N0Zk16QkMwTWNHcVJvVjlL?=
 =?utf-8?B?VVZiYmsxTHZDcERGdVp3ZUpTbFBsNVI5VnRVUlN4TXJoUWxQOW1TNGFQTTFj?=
 =?utf-8?B?RTVhZzA4WlV6Zy9vaXhTb3l3YWlnSm4wT3gyenMwTVRzbXhwU2ZzeEtQMjlS?=
 =?utf-8?B?Y1FBaUlzVGhoem1WR2IwaDdCOW9zTkltWlF4N1BNVnJFeS9QS1BpZkxERjg2?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 281e413c-590c-424f-5571-08dd8216f1fa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 03:28:42.2285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9+uYHWI5hqmsQ+AwsUU2S2ruwagy8LsvNDUMe8KGxX0Fz4thzgTufB7LR4xCq4EdYnJr5xpvrOndIFQx782G9Y/xrSM1bhuJGFYCuMm5NI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8747
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


On 4/14/2025 4:46 PM, Swati Sharma wrote:
> Add chamelium_frame_eq_or_dump_frame_pair() to compare frame
> dumps captured from chamelium. If they do not, this saves the
> reference and captured frames to a png file. This function does
> exact comparison.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_chamelium.c | 38 ++++++++++++++++++++++++++++++++++++++
>   lib/igt_chamelium.h |  3 +++
>   2 files changed, 41 insertions(+)
>
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index a96e36b5b..463ba31ed 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -1893,6 +1893,44 @@ static void compared_frames_dump(cairo_surface_t *reference,
>   	free(capture_suffix);
>   }
>   
> +/**
> + * chamelium_frame_eq_or_dump_frame_pair:
> + * @chamelium: The chamelium instance the frame dump belongs to
> + * @frame0: The chamelium frame dump to check
> + * @frame1: The chamelium frame dump to check
> + *
> + * Returns bool that the provided captured frame dumps are identical.
> + * If they do not, this saves the frames to a png file.

Perhaps we can rephrase this as:

Returns true if frames are identical. If they are not, saves the frames 
to a png file and returns false.


Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> + */
> +bool chamelium_frame_eq_or_dump_frame_pair(const struct chamelium *chamelium,
> +			                   const struct chamelium_frame_dump *frame0,
> +			                   const struct chamelium_frame_dump *frame1)
> +{
> +	cairo_surface_t *reference;
> +	cairo_surface_t *capture;
> +	bool eq;
> +
> +	/* Grab the captured reference frame from chamelium */
> +	reference = convert_frame_dump_argb32(frame0);
> +
> +	/* Grab the captured frame from chamelium */
> +	capture = convert_frame_dump_argb32(frame1);
> +
> +	if (frame0->size != frame1->size)
> +		return false;
> +
> +	/* Now do the actual comparison */
> +	eq = memcmp(frame0->bgr, frame1->bgr, frame0->size) == 0;
> +
> +	if (!eq && igt_frame_dump_is_enabled())
> +		compared_frames_dump(reference, capture, 0, 0);
> +
> +	cairo_surface_destroy(reference);
> +	cairo_surface_destroy(capture);
> +
> +	return eq;
> +}
> +
>   /**
>    * chamelium_assert_frame_eq:
>    * @chamelium: The chamelium instance the frame dump belongs to
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index 8882e13fb..b5d13ddc8 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -262,6 +262,9 @@ bool chamelium_frame_match_or_dump_frame_pair(struct chamelium *chamelium,
>   					      const struct chamelium_frame_dump *frame0,
>   					      const struct chamelium_frame_dump *frame1,
>   					      enum chamelium_check check);
> +bool chamelium_frame_eq_or_dump_frame_pair(const struct chamelium *chamelium,
> +			                   const struct chamelium_frame_dump *frame0,
> +			                   const struct chamelium_frame_dump *frame1);
>   void chamelium_crop_analog_frame(struct chamelium_frame_dump *dump, int width,
>   				 int height);
>   void chamelium_destroy_frame_dump(struct chamelium_frame_dump *dump);
