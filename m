Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574A4CA0FF2
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 06:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E0810E18C;
	Thu, 28 Aug 2025 06:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgPO5q6W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6EA10E01F
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 06:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756360940; x=1787896940;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rPLCojgpOXYphXC8mcLRMb6He0WTvzd5JfaMmWrML1E=;
 b=YgPO5q6WMesXdNGiqlB5Nu6Zh4+bRROJrAwfI3xx7nHEcVeZlas/hAgi
 1jyFEi/3TK75w6izW7rzrrTIHvrzhdUxOpsxreSkFobL87yD01jww+Rgd
 b4Dfl1JMHwiTr3FxGSUWBTnz0johNoLl9B00Bsloqp0f+cC4czMyw3ILN
 TY2/1cb54YCmbAYSRZLCpY3gZ9dMFLFR82iybeCg++1nJ2QM98zevLgHi
 m3e7zOqY9+R9ICWTG1nl/yfeRn13KtSEcnJIt8EXia0pyUun9uvAfyPUx
 ZmPUPY1qOqrCgfMZ5SOfWazZfBKF2lWBS8zhxXI+OfB8QI4nqQf5ET/bi w==;
X-CSE-ConnectionGUID: ULejUR28SQqnErSJlGe8xA==
X-CSE-MsgGUID: mSaZnY+XQTC+6bOwAGiJIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="46195548"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="46195548"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 23:02:18 -0700
X-CSE-ConnectionGUID: Tf8c+2UgQxyPIvt6mEh3OQ==
X-CSE-MsgGUID: L/GUsiPPSvqbes0MYbmaIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170416409"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 23:02:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 23:02:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 23:02:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 23:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3PblBXMSllUH3RbQSmbOa7/DlzOubB7PxMjWWzYBHf9qXixmbnbuLmxQv4GoJtHfEnWk5ca1kLkK04i1MNIT0L31vkMvncBbEAQ+l0JuXG+AHef48jtizPV7UJOyMjDpuMGehfjigU6zBUQafK4rmJug5CtAtmXpGdJuN3VjSjrm7LmmH7ujZEq9Om4wZP7FomRYC7PFBjuiERqiHIDlRRsE0BpJkIKx3gtGbkfBYnRbVdeO5L6bEbVB96Tya+G+g/1TNW4/Odjri3s/ir5/U0UEzrM+MDN/tyjbGUG3OD8OMdjYRoJP3wJpSOO4sfBHcydpRtSFaG+mOam2EGIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exQieMu12Gy1PYhuGuiTX1/UWgeLDIOK+KZPjXLBhDE=;
 b=rbJysMl2rGaxa8ndmnoNEYbBskspvY/W34/ddOR0y1gGdiTpzaeRhAnqHA21UXwzAglftdgKdOanROzRxBYWi5rCWa/n9f13K1UIrfnIzKhMwJCuazgB1XWNriqbDF8jhILa9WBNJknKdH1LeMmu79pF6MNYl+bm7P8U6JDZZvxmn9enIWaDJXj/yKRTyOSwwiSdXfqFL4J+UIq5WH3464JA0kp1WddAP+V/S1/rDbHk4G/3vUFT+rq7UPkE5KBJ3qXkEIbe4W32Bi55HbkkPzo68WSd16IMqlqeYRoKiUwHTfpjezu4v0TuOQuGX028H4B1b977ObOob+BiDxK5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA4PR11MB8990.namprd11.prod.outlook.com (2603:10b6:208:56b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 06:02:15 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%7]) with mapi id 15.20.9052.024; Thu, 28 Aug 2025
 06:02:15 +0000
Message-ID: <d20ad7b9-92b0-4da5-9b90-524d1f81cdea@intel.com>
Date: Thu, 28 Aug 2025 11:32:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 2/3] tests/kms_hdr: Set HDR meta-data while
 testing for panel capability
Content-Language: en-GB
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20250821093511.937552-1-chaitanya.kumar.borah@intel.com>
 <20250821093511.937552-2-chaitanya.kumar.borah@intel.com>
 <16f6dde6-cde1-466a-964f-5d1afdd7d3d5@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <16f6dde6-cde1-466a-964f-5d1afdd7d3d5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|IA4PR11MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e956026-ee31-4bac-a96b-08dde5f87001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU9WUmpLcmtkSnZFZGZ1NHZOWllrNU9uZ0F1d2pIbjhJOFFxQnRkRFMvNTJh?=
 =?utf-8?B?ZkdpQkR2TjMwOElWdUhtdHg4Lzl4eTk4QU1PcEY3SnlIUHFZbE5QOHFpZnJ5?=
 =?utf-8?B?dUl5alVYakVQZUxTTHVJbzMzZ1VkTlB5a3RDNVB1RW4yNjNualdHTkhlNXFW?=
 =?utf-8?B?aXBOVVl1aDVaVnJoNzAwcEg3NnBsTi9ZbGZGZjNja3lITHJiVU1HLzNTbXVB?=
 =?utf-8?B?b0hnbGljSGUxS1R0Y2FoNEoyOUhHeVpQOXNrSS9FanZVTnVOTlA0ZzRlSDda?=
 =?utf-8?B?VnRhRlJDUG9seFRBWFhJcHN4RzJZQ25XS3RQeWlqZEFaSWxhRmU1MkxYajVy?=
 =?utf-8?B?OXRzbVQvL0l0akpKYjFCcnZDa1lBODVWNEJUR2g3a0J1bHgyNkM1RndqWEVZ?=
 =?utf-8?B?eVd0ai8wM1JtdHhENStDd3ZtVVJLeU96c3czRHhodFFhdEhEMzYweEQxMkhM?=
 =?utf-8?B?ZElvNHE4Ky9ranJaNVBnSnRyb0g0R1BpWkQ1eFUwSGlFUTRXbEZuWkpaWmZK?=
 =?utf-8?B?RTBaQXAvNFJRaTJmQmhjS2hCMHFZd3BuR0VCQytsSDlWaWxXMXNmamNXMEFj?=
 =?utf-8?B?N043NDhyTGRxVGRmUFJ1YkJZWlVDdzkyMnluMXpHcHU3aC9tVDFnR2c0R3Iw?=
 =?utf-8?B?R0Q2WlI3SWh6NENCNzNzRFZaRDhvRUhpNEdtai9RR1JKWGxOemVJVDV4cTBW?=
 =?utf-8?B?dHlES0JBdUg4R1N3RDhtM3NQZUgwVDFqdnRsd2JMVmJhV0MrRDQrQXlGOTVT?=
 =?utf-8?B?QmRCTWNLQmhuV2h4RU1OWitLb0JMUmdVRGxiNVpSZVZCUGVBN1pHMzBySnBr?=
 =?utf-8?B?Z1h5VnVOano2MFFXY1hZWTR1RndlV3JDQ1NSUzhCcUczVVRCcjREeDgyK0Zu?=
 =?utf-8?B?UkZBSzZMR255bzFNSzVoSjhvU3hDd3pTY2RiWWd3R3k2Sitic3Y2VVhCaEJD?=
 =?utf-8?B?OStLQ2ZiaFI2aTNWTkhYcTN6ek15TlRna2g2N0t6L1loMUtQYTJBZEJ3dVdT?=
 =?utf-8?B?M3FiTEtaSDByeU1tVnhETDZLeHY0RElVdTJEYWRxRE1zeWFzT2hUL3FGMWlB?=
 =?utf-8?B?SGNrL0ZncjdOZW5wNE5na3dmVGVMMjZDTEZ2WUlSUlNCNU1YVU8vanBKZGZ6?=
 =?utf-8?B?YTFveVk4THJnUjgwNHg3WFJrQVFTU3FBUWRxaHpSb053VnJGaHNjTElDUVdv?=
 =?utf-8?B?N1hIdWhzVmlpMGxsWnJUdFN1Uml3WjF3azVDSGEzaVo5L0VSTmVKeTdRZFFV?=
 =?utf-8?B?bG5QUXNjTGNFcG00WDV3b3UwL20rOFluV2NtQWQ3QldUQzI5UzVybjRxSlVF?=
 =?utf-8?B?Z2hPRTM4WFp4bmRWYjNTWVo3Z2cvSmMwZnR2NVF4SjYrTW5oaTZWOUd5MHhw?=
 =?utf-8?B?VWRBeXpaa0R0SDQrK0JZQjg4aWt4dUx0WXNKa0I3YXlDMXd6b2gvekZ5U1c3?=
 =?utf-8?B?Z3dpZzFqNTNjK3hWWUFpNzhpWi9FZXhZY3ZibzloMkgvWS83UitjZDZjelUr?=
 =?utf-8?B?ajBRSEJPL2JUZjVtOHRPZXVWcnAzWTVGNTRMU2ZWUDJzOVNSdzI0RlcwWXNT?=
 =?utf-8?B?eGplNmFRRkNXSEkxR3MzV0V2d2hSTDU1NkliR2lTU2tTWDVYaG1MUzdTSkRD?=
 =?utf-8?B?Q1M4eUVHSVhWZ1E2d3Q3QW9QNTNSaDM4dmFsM3dZTEI2R2RRL2tFOW9jNGFG?=
 =?utf-8?B?ZDQrSWpFekZXa2UwVUVYUTBQOFZmT0Vlc1I5Ty95OEZ0RXdHZVpCUW9oSWow?=
 =?utf-8?B?aURlck9lZHVZMFRkUXFFbzZkNzFjMXhVaHdXd2ZSZTk4Vm04MTZPcTdPTURG?=
 =?utf-8?B?MWlEbUhpSlVZa2dGYzBaa1grUUpTSzVBa0ZlbVFYNGovWHZvSnZGTzFZUS9t?=
 =?utf-8?B?RDFpdnZxOTF6bkxrZVV0d0NaemJCc1dnSUs4QnI3RXFyS2NiWkp0bXJEd1BN?=
 =?utf-8?Q?VvG4jXyQHW4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE5ZOXBKQ0RWREF2M2FqeXRRYjREZUxLZHhETVVpWmE1TmhGOEtpQmNhMndn?=
 =?utf-8?B?Rm8rbHlMOUl6RExMa1YvSDV0N09CUWhuSlMwVzVldHZFNEp5N3hrT2FoM1FD?=
 =?utf-8?B?dGllT2szWWJ2czF6VkxSbEN1MHlZb3ZObmlhRjNkR1FTK3VtSStkUmRVeExp?=
 =?utf-8?B?V0xOWHB3SmRjbkR4UHZrY2gydkFWWXFmam5yWEpzeDBaQlFXODdDRm1WNUVI?=
 =?utf-8?B?ekZLZ1BKSGIydWpCRlc5K3RhTjJMZkR1ODVtcWZnbTRUY2tqTmloNGE1USta?=
 =?utf-8?B?WlNXUXUrRjMrQ2hEbWpPRXB4bWliNkxkYm9PdVh5VEdBVWEwclJaMGI1RDBL?=
 =?utf-8?B?dUZFak10cWtsb2Iveng3WXlqL0NPQ3BSbElHK1pNVHZmODZHdnJtcEMrMkZU?=
 =?utf-8?B?TERpeEc3TTRMMERGemFxbTAzeE1HL1M3ZDk5REN2WHVOM3JNTENwUm5TMWJ5?=
 =?utf-8?B?OU5IUmFhVXN3cFNHMlduQk91KzBlejYwbHQ3SHl3U05HR3AyMDBzS1VuRlVJ?=
 =?utf-8?B?M1AwWWpQWEswQ0MwSzBpcTR6YWcrRzdBcmdBOHhFYjJ6WlQ0NHZtaytMbXdZ?=
 =?utf-8?B?TjR5d3JDc3pFaGZtRHQ2T3Erc09yWEJaWXd4Wk9Gd1ZPVDlpSEU0UXlydC9s?=
 =?utf-8?B?SHl2RDNFTEd3dUdaVEtvN1dTdnpKRHU5dFY3c0t1UFdaYnhQV3A2b1E3VUZt?=
 =?utf-8?B?RGNFTWR6bTBvdDNTQzYrRlVZd3lEY2lYSmtvZUJsSUJvMFgrdkxoMU55b0JR?=
 =?utf-8?B?Q201azlNN2dDczlaZ3lwNnlMYmJJZ3VKMTNjQStjQmhObXlIdlp6V0FPeFJJ?=
 =?utf-8?B?RXNQQVFnK0p5MzBHdGFEYS9XSzczUnN1bndMWUhDS0Z5ajcveks0VEVsSlFW?=
 =?utf-8?B?cXBZY1FZNndROGlZV1h5MTVlZlRJd3YzZS9kQ3JScno0Yk1oMjdTa1pickky?=
 =?utf-8?B?bG9kejhUN1dKL0hjdUNLdHVaaW9Wam9FLzBKWS9wbFRiczhRUXFTbWh2VHQx?=
 =?utf-8?B?cC9jV2ZtNUIzMDkvRTZoV3pDOFB0bGN1bEZ6dVpISUNSc2VKOWtFQUxyNWNZ?=
 =?utf-8?B?NVUveURyUlFVMzFXQ0RkQm8wVXQ0TzVHVXY3UDRmd1pXYmVSRTkyNThBL0VD?=
 =?utf-8?B?TXJQOEh3T09rWFRUbjF5Vk9PSDJDcWoxbUNBVi9hWkhXWWNvMlMxbGUreWxs?=
 =?utf-8?B?T2lXMkRoSVBBQk9RSWVwL29KenlERmVNZUNML2hTUUJMMkxpeGRNTGtzdjMz?=
 =?utf-8?B?NjBiU1FPcmJ4STBqbzVwc3RGNDV5SjFIdEJuZFRXMFJEZUdkOUV6YnQ4bkV4?=
 =?utf-8?B?UHpzUDBIcHFRSitFelRra2Vzdno4N05VZUo0ejJybzV5VmRJSE1qZVJKZlFM?=
 =?utf-8?B?dFVRNmlBQVpWcXpYemx1dnNvdUlmeDNqZDBTWlF0dkFCRnZWOGYvTUJUN3Rj?=
 =?utf-8?B?ZHErOEUzTm9TbWFPbENYME9QdDNaODdzOFBHS2Zhc3NYUC9KTFlvZzVUaGZN?=
 =?utf-8?B?c25WVnpIRkRoRTFCL2lvd0wrK0h1NTEvM3kzYjdHc1NHMzl2TTFXcU9Xek0v?=
 =?utf-8?B?TFN6aERMU0tSKzEvRFZ4d3Q5N1gvbk9NaHFHbkh3NEJoZXdCUmJxSzZ2MmRy?=
 =?utf-8?B?NkNPemhFUGFyMjh2Y1BaK2FoUFJjUUtRMjZ6ZFFnN0ZNWkpISHBOZXowaVRL?=
 =?utf-8?B?Wkw4dHQ0TjBXSjgzL01manRCNGNFQTlIMTdlb0lGalY4RU9DQ1EybEJTWHZD?=
 =?utf-8?B?RGFRd0d4dHdwZ3lST1BMMTZackRIcllaSGRCWjAzS25KU2FyYzdkU1BFR1Bt?=
 =?utf-8?B?WVMvUTdXTmthNWhUbEFCTFFPZlcxNXI4djFuOU9mWjFiSVYyaHR1M2xYOWZo?=
 =?utf-8?B?Q2MxelY0bXRqZ1FRMHJzb0VRKy9hdlZqWVR2b21PNnRna1djREFOb2dEd3FI?=
 =?utf-8?B?OFRVWk15Sy94S0xhYXpBUzR5RjhEbG5NTkJsbGwxeS8xS0hnRm02M3ZleFZ4?=
 =?utf-8?B?eVQxbE9xeXJCVkhWZDBJR3Jtb1JZOE56d1J2amVvYWRmVkY2YWEzRjRUMnNC?=
 =?utf-8?B?bVFLWC8vd1JBanZNbWtPZTlKWUFUY1k1SWVBNWlQa3RyRXA4NDJlajkvRHRi?=
 =?utf-8?B?YmhFQm56TnVtdENTUUN5SEpydVdCcHE1Q3FGWWFEOElkQmhYU3lua3pueW5o?=
 =?utf-8?Q?xfyW69FJFQuSdo2uREytAFo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e956026-ee31-4bac-a96b-08dde5f87001
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 06:02:15.4015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvN5Vbf4IVChMOd9puvYxKIr3Q2cQ7d4LzLVM6j4C3Q6D2sZaD91anYqaROxglCGi8nmKp+XQ0WAHcx2wa14qyC3CpqubhVCDRvKVnyV718=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8990
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



On 8/26/2025 5:23 PM, Sharma, Swati2 wrote:
>> @@ -652,6 +652,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>>   {
>>       igt_display_t *display = &data->display;
>>       igt_output_t *output;
>> +    struct hdr_output_metadata hdr;
>>       igt_display_reset(display);
>> @@ -701,6 +702,12 @@ static void test_hdr(data_t *data, uint32_t flags)
>>               prepare_test(data, output, pipe);
>> +            /* Signal HDR requirement via metadata */
>> +            fill_hdr_output_metadata_st2048(&hdr);
>> +            set_hdr_output_metadata(data, &hdr);
>> +            igt_display_commit2(display, display->is_atomic ?
>> +                        COMMIT_ATOMIC : COMMIT_LEGACY);
> If this commit fails, test will fail. Ideally, we should skip.
> Can we add try_commit() instead?
> if (igt_display_try_commit_atomic(&data->display,
>  >------->------->------->------- DRM_MODE_ATOMIC_ALLOW_MODESET,
>  >------->------->------->-------  NULL) != 0) {
>  >-------igt_info("Commit failed, couldn't set HDR metadata in 
> infoframe\n");
>  >-------break;
> }


Thank you Swati for the review.

I am planning to use

igt_display_try_commit2(&data->display, COMMIT_ATOMIC);

as we don't want to allow modeset while setting HDR metadata.
Nor do I have any other flags to set. Let me know if you have any 
objections.

==
Chaitanya
