Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956D0C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 15:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED8A10E979;
	Fri, 14 Mar 2025 15:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4u8PcAQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CE210E979
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741965531; x=1773501531;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L3HNovQmwqoLrdLCksyiZSJwmH9e6H5NFPDPABOMT0k=;
 b=M4u8PcAQgl/Ev6vst6sUL+Yo1pY0dixOa0yJP5qld4+XBNm1mNlIqkTn
 B5yeIOODJ/sl7MGoMMuyH6PBiG/nC1FF+LzzEEoHb8PmtZCHa3zrJ8teq
 nv5KnqAHkdDY23O/LHTl9kxqtiCf5ezUl0xk67XfGWEn/xnE9N+JcQZg/
 ou56cUKO3PCmvF5t55BjqzDAce+ejInEMdC6Q3WkVXug7D7rlJIa/PHSM
 +8dlPDfwYZAWrp86bNOKqUY2ZhEFCBwOsvVMHk5al3QsWtnRWNLJkRW4T
 VwQzFmsKTzHtH1p+BwAlKseN4s2BmjnovAU7H8uRdQrljM2JASsqfg9e1 Q==;
X-CSE-ConnectionGUID: oXiBr3TPSdmudB8wMM3/TQ==
X-CSE-MsgGUID: m+eSPGVfQOmRrrq6+We1vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43326714"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43326714"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 08:18:51 -0700
X-CSE-ConnectionGUID: WttBWzMcRwW7dY8c+WhxjQ==
X-CSE-MsgGUID: Xu5lk+n3QniGGRkOL3SXMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121351932"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2025 08:18:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Mar 2025 08:18:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 08:18:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 08:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jE9x20qdOiHW2rVy2IOl2V8gMc/rmzB2osVejEQtXSELUaKaYZB134HDudXXJTLtflt+7K86beRN0o0l0SaaROrhPacV+MyMQwFrYHYgv6naUr/lqGJtMG8Jj0PZxh7RH/uQuOtj4bH3ByvQr3LBzWTtTPL+iHpqTxovxCoJfPrvzt+bDy9mRRL1CRPWMZbk3eDYyPba/mRaKeGYbpqTk42Y5QZ6qZcjxMcy+v3SDdgJHi3uCne9mJc7E/1Zd2h/Nqp1UCJSR6QoXYgT9FQnP0IU3HpCX4maMwApvrhQAlAv+5heFFj9UL4NEsPnz5IX6SCVbS2H61JIGyxUsoXsaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRMtkr1tK1J894xW4yH+Ss0CaTLMVswhdCxoAUZJIOM=;
 b=S9Rftys6ywqQ6Whkb70AUKhQBfLozmKeOoybWAixYJkGgpzsvn+y4qVa8ua4lZtu9BxYVrnEdn44YQA4QcwFRO3S2DL3fAd4/6DtZNGUYFCNv0rFaNhgzB6UiM22SRq+mUBUpxCOc8u/ioLixssVqVAtfkjpfKmccZx2n7Gb/rO3fYxXwpgdmXQh3OJVz+r4RkVnMLXG0alIgw9aeL9eIIJF/wobiwA0eR3oXC8P2gkSh4201oOULZJxaR3b6LFtM/OmrS+P7IzAqnA6Y14fyr+zrPSGbfaJPpWHueie5dni+bpQ6N5Nz2r2fZjTErC3GaoBopx1qzNexJ3LlhUf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 15:18:16 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 15:18:16 +0000
Message-ID: <d242e055-bd33-4fe0-a7d5-68d245bc4fca@intel.com>
Date: Fri, 14 Mar 2025 20:48:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/amdgpu/amd_hotplug: Fix compile on Ubuntu
 24
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250314002058.220854-1-ashutosh.dixit@intel.com>
 <20250314002058.220854-4-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250314002058.220854-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::14) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|DM4PR11MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: e6499028-2bde-46c5-f41e-08dd630b718a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVJLYmxoVzBOTXpGQjEvYXkzV2gyODBZdUtFbzBHanlzWlNQdTBRellxaXd4?=
 =?utf-8?B?QVM4ZTBJRi8xUFdvekpmRWxNeGVSeEp6bXdTQ3pmTFR6OENsd3VBUkhXdlBv?=
 =?utf-8?B?OEk0bkpQSWVaQlZwQWZyZGwzWVlqU05GR0xueHdvTGxMZGY1YU8yTUEyU1Fh?=
 =?utf-8?B?MXBnNEROeXRnM0FSVUFJVmtlU0dzYTEySndjQzAyZHE1K2RYRjIwRTV6OG9k?=
 =?utf-8?B?RmJZVk1ib2xpSHRpRHJpb3d5bDNkd3duWm9HYVh3M2c4SHZnQjYrNmlobzIy?=
 =?utf-8?B?OVRMRndlVGJDbEwydk45bTlMS2hoNjYrUXA3cXFUM3hMMENaT3ZPWVFIaWZE?=
 =?utf-8?B?U0lZcnhCdFFUQU1qMmpVOEhrVTE0QmE2aSs5dWd4bWVGTXFNWjVlOTNyOFgv?=
 =?utf-8?B?b3hUelJ4VlhnZWhEdTZoU3V0aGVUdnV0dFNtUVdkYkRoV2dZNXh0QVdwMXhB?=
 =?utf-8?B?UEw1SEM1N0pJSzFGcFZxRzd4eDlnemZiUFdaNkxXTmxkd3RzdUw1NFJ6dDBs?=
 =?utf-8?B?cWxxNng0bk0wQXJWdFhmWHZxekhPbTVocXZyQ2prTHNpdmRaWHVRQlVva1B2?=
 =?utf-8?B?UW96Tjk2bkp5WkFCV0E5RVl5aWp6S2QyZ0N2VnpXTHNQY3dPcWg1NDRBcTQw?=
 =?utf-8?B?aWd2aldid3kwQzMvcTlyci8rOVp0OXc2ZWJ4WWFXVHdEc0dHS0dFcWIyZU53?=
 =?utf-8?B?UGpkNEFJQXpDeG03eHRRMDlwWms3b01US0RJSkh5OE9EaFNDVXVLTnR1SSt2?=
 =?utf-8?B?VGhxREo2eVZYRml1ZGltcVQzOVJCT1FTNWl1VWNpYi9OZ0wxYStrZmg5SUg3?=
 =?utf-8?B?MWlCU2h3eW5GWm52ZDZXOUNiNFBGMkF2UWtHbFh1V3h2S3cyaGFXL2dPd21Q?=
 =?utf-8?B?RFJscFRJYjhKRlpLRjgzWVlFS1ZDZnpvQWxxTGw0eDBWbzhEYUVjRVZQN0lh?=
 =?utf-8?B?RElrczZ3RmZTZHhjRnJiYmZ2M0Z0anZmQ0ZEZ2lPeVBONS9RMDlZd25WSGxK?=
 =?utf-8?B?Z1FJZFljZWRvVjhYbTJXeWdWNzltSXZBNmY0TWJsREVabEJHZFUxaE5jNTV2?=
 =?utf-8?B?OE5vTG1GVkRYdE5VcTIwRjc1eHFqUGZxVm5JUzdsS3RmQ2pPc0puc09veDNK?=
 =?utf-8?B?a2pLOUcwWDJueHFzeHR5S1IwK1Nxak10OTJJZFYyU245YXJMWS9JZk5RUjhk?=
 =?utf-8?B?UndIUis0OHNZbktsdERmS01MdkFZd3MzdXFhbmV3U1FYcDY2QkRaSzhSd2xs?=
 =?utf-8?B?eHRrQ292WGdidzh6eVlhWjdGQzh3Uk5PZFhZd0Q3ellNcTRDaTBud1YyY05m?=
 =?utf-8?B?RU5vZC9GVlV5Z2trSWYwOFB1bjdkTG4veFBvZDkvY1pOT0Z3R1owTFRXNk5u?=
 =?utf-8?B?L2x3a3NrS09aNGNtaVB3OUxPT0xvemx4NG9NNjFQdFc5bjh2MXdHTHljZ245?=
 =?utf-8?B?Q2t6S1VEeXdrejAyL0paMm12dFlyWGpGR3pKVllGRC91YnlrY3pCaUVHR01z?=
 =?utf-8?B?L09vUS9RTFJrMkozbHB1b0FaWUZhYmZJZXhZL0xSZTZXL2hRTURLMFBYYm0x?=
 =?utf-8?B?Q0huTlZWUVl3SkR2cmJhV0ZMK1dUTENSbTJoZUF4eUQzcmVOM1dzZmluNER5?=
 =?utf-8?B?em1paHBWTEx3dEpQaVB5VU05Uldid2U5YUVIM2dBYlZIR1cwV3VNRml5Tlhu?=
 =?utf-8?B?MkxvdU1uaUVja29Tek1zbUJBNERjRStoSjA2emdGd2k0MjduZkZvRWRlT2Fs?=
 =?utf-8?B?Wm8wZS93cW11U2dhVzRUZkxYTDN0VmlFdHpoZ2NLazRLVnBrakM3UW9LMVYr?=
 =?utf-8?B?NGpDUU14QzBycVJBSFJwK29ObDdzZWRjREk5Tnc2UGJBazhDZDJhZmJ6QnAy?=
 =?utf-8?Q?d2z6nPvVEQdW3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3BmUFloVlF6cHRLdTV4ajNTcVVORC80d0NvOGNlZWlRWU00b1lBMDZ5dmJU?=
 =?utf-8?B?eE1oVVgyb0p6SVo0aHJyQVVFM0xmN25mRlJPRUNZbTF0eXJ3ZVd2NkRkQTRq?=
 =?utf-8?B?QnhrWUVRK2NQK0FvMUpYWlo2TXpQT1hyQ0cwVTdwNkVTNzVGNWxGQk1ZMzAr?=
 =?utf-8?B?RWJuZVc4bXM2Tmp0cEJZbUdhOEtadDJZQTJRSlpsaUpDTTZua2w2SzV6alI2?=
 =?utf-8?B?Rm5TdmNHTUpRRXlMRWt4Q3kwdEhQVEIyMHlaeldHQkRSK3NadTdGdlhpcDV6?=
 =?utf-8?B?YkJHbjVSTzJnaGNjSDFGRzZIcDQxRUF5SmlmcGpVUGF5bnlUUmJnbUFlYlRr?=
 =?utf-8?B?SVdOSExteFpiZ3E3bGhqUXZHejBRZDlLODREUDY0VXZrbDNLcjZjV2xZOVo2?=
 =?utf-8?B?NjFWNCtBUzFtR2ZNWGV6Y2xpdm9pbDFGbms4bVVlcEg4T29NYzVQL1kzOXdB?=
 =?utf-8?B?MzVuUE1PMGU5eURad2RhZUpvdVdsU0cwT0t1bGcrdmd3UGhLZmxkZEYzSHgv?=
 =?utf-8?B?NnNPcEtzSFpId3pRUGlsMmVDcExMUjYydlVkRFFvd3lOQm53czcyMjdOVkRo?=
 =?utf-8?B?NFFWZ0JGREdHeE8rMGF3VlBqQ0MvZSsrODF5MVZKTW40V1Rsb29URlViOTd3?=
 =?utf-8?B?cVN4ZGlmck5raVlDb3pOR21uNGs0U0VUODJMVWZUVHZRRVNYVlJUNXpteWhG?=
 =?utf-8?B?ZmNMMFZPc3NvNUovbmc2S1dYZlYxVXZ2RmVJNnpWNDVHaWVRRHp5VGdRMlpK?=
 =?utf-8?B?cUZVNTVpUmE1bUVmVVExbHQ1OHhjSjk4ZE5TbkozYVZwMkZQYXVYbHlTeVBl?=
 =?utf-8?B?cit4L2hHbEtwWG1McDhNM0RoSS9RbkEvUGhvWHNTMHBZWXYrY0ZNdHpYMnFY?=
 =?utf-8?B?YmdLYTI2Z29CakM5ZVpDeHFQZkFrUFdNcWJVQzJySzRxbG1DaVBPUjZyK3Fo?=
 =?utf-8?B?R2xMcmYrN3I1RFpyN0lDNkQ3Y2R2UXlvQlU0QTkrdlpJTkUxWVRvQ3ZSV3Yz?=
 =?utf-8?B?aUlEVmV1TkR5bHh2RENzUnc3dlpwbjY0K05DYmtPc2ZGUnZvLzNnS3Awa05P?=
 =?utf-8?B?c1crTVNyV2YyNURlZHpsQTBQOG1vN3RhK2JCZzVtTHY4K05GbFl4dE5jYi9Y?=
 =?utf-8?B?WXRpZWV4ZWdNNTNteHE2VmFxb2RQSndsaFFiU0tSQnRGQnpvQXRkN2J6ZGhX?=
 =?utf-8?B?Q3I4anpSRTRoMkh1dUJ4aFU5QkhqNUlSdng1amtqUDYzSkZ1SUV0czZFYVJN?=
 =?utf-8?B?M21WUkZLaTFjSzFFY3ZVbkFkRlc5ZVFQWWlRd2tMdWl2Qk9mV2dSWkhHVU11?=
 =?utf-8?B?aDBZWWNKVm5kZ2lRbzFCYTRqcCsyYTBzMnRlVDdHOWRUYVNXRWs1ZTFnRnln?=
 =?utf-8?B?SlM0bzBrK2toNitINHhxUGR6SGFXOFU4MUkyVHpBVjhlcGxnZUVMbnVzY1Jv?=
 =?utf-8?B?a0pvNWhRYUN2Y1hSNmJ1TmJQMTVOSUVlVk51Q01DRU9tMXNRYWMyRkl5dUVk?=
 =?utf-8?B?ekg3RmNaNThHQWRTWkh2MThVYkNKTENMaDgySURLUmNRRk5DNXpiSmoxVUh6?=
 =?utf-8?B?VEJhQmFrcFpwbjlnbjR0by9LK2pCY2R0ZW8xYWRVQTJBemwvb05kUVFGaGcw?=
 =?utf-8?B?TFJIRnZQVzRlNFJsOFJRQXdQMFNvNC96cEtucVlHMXF6SEkyeEFNaHIxN0VH?=
 =?utf-8?B?emwzS0VuWXA3d2Y5L2JyNWw2enRNdjhjUFlSa2wxeGUzWTB2TC8zNE9wMDRk?=
 =?utf-8?B?eGY2S2syYlE3VVZsZlpIcVpTRXNnWkpaT2Q4Vm5ydkRUWURJMlZyZksvVHVr?=
 =?utf-8?B?QVgvbXBYeUxkcDhtM2JmVnh4amlSUHhKVUNqMHNmWE5OR3JQWVFabUZ3T3pa?=
 =?utf-8?B?Y1NrVXhsOTRMRXRtQU8yR0pISFgzUll2MXRGU2R3T002R2VkUlE0ZEZHQmVz?=
 =?utf-8?B?cnUzZUlYNDBQUWNZS3hOSDJUWlpjYi9meU5OUnQvM2RpZkNjTUlwcU9Hay9P?=
 =?utf-8?B?TEk3WWI2a1M1eHN0RHU2MG5KbCtqWTN0ekQxTjg0WXRHV21wR0FyYUsrQW0r?=
 =?utf-8?B?bmhpZWpYRmxzRWdSVlhjVlB5MnZacUtKQlVIRDI5UXhZMGxKbmdXeFVEV1Iv?=
 =?utf-8?B?Q0ZCdGhUbm5xNjVkTC9xY3VMSGh0Si9WdHZTemMyMnk3V3d4bFR5eCsvUXQ4?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6499028-2bde-46c5-f41e-08dd630b718a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 15:18:16.0737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKuwEN7A1J0bsML63M3AeZX02Ytqsp3jb03qCfXTIuQ0ZNJkPU9F1FIi0/BmSmK+de8Hesb5V2prRHqqgCsEMSxsSW8Ee6Beef/7LKdYRnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5993
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

On 14-03-2025 05:50, Ashutosh Dixit wrote:
> Fix following compile errors on Ubuntu 24:
> 
> ../tests/amdgpu/amd_hotplug.c: In function ‘is_system_s2idle’:
> ../tests/amdgpu/amd_hotplug.c:110:14: error: implicit declaration of function ‘open’; did you mean ‘popen’? [-Werror=implicit-function-declaration]
>    110 |         fd = open(MEM_SLEEP_PATH, O_RDONLY);
>        |              ^~~~
>        |              popen
> ../tests/amdgpu/amd_hotplug.c:110:14: warning: nested extern declaration of ‘open’ [-Wnested-externs]
> ../tests/amdgpu/amd_hotplug.c:110:35: error: ‘O_RDONLY’ undeclared (first use in this function)
>    110 |         fd = open(MEM_SLEEP_PATH, O_RDONLY);
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> ---
>   tests/amdgpu/amd_hotplug.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> index ee3256c0b7..93765afb6a 100644
> --- a/tests/amdgpu/amd_hotplug.c
> +++ b/tests/amdgpu/amd_hotplug.c
> @@ -20,6 +20,7 @@
>    * OTHER DEALINGS IN THE SOFTWARE.
>    */
>   
> +#include <fcntl.h>
>   #include "igt.h"
>   #include "igt_amd.h"
>   
