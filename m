Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CFDCD98F8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 04:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A61510EBCF;
	Thu, 18 Jun 2026 04:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/qm7wuu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D54B10EBCF
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 04:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781756215; x=1813292215;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0NmMWgauXwAApNj3+1eRGPbBwFDoVcyh1DaSXObl8D4=;
 b=l/qm7wuup0+PXuxoiGI8ChupL+K9LWdQ8udFDkP2b5i/NPiUj14QJGvQ
 a5QxnWBdOvLhbKDKKT+XQ/jU4j6AuhcvLA8uwggj1uHAV2l/y9pLqrXgZ
 yU3ONuy5xx/yyxDXHtEQFajdr2583IRPxNDd76EAlK3yuY3GHWIkF5VSh
 w+34zef83GNXUq6ESPwgMPpwvCMYW9Y4uZr/+9U4fwX0RlBAnt6j15ZdF
 eCKg0y4pvw3kSGSf1n/stkMHOLMfuyKUyBeaSjfh2t9I62Jxl4rYGlBk8
 1dXwsSCHGvsW6LlgHUZSwgl/g+jN8MEM8/lJx6sDDuyiRanCYT2gMGLS4 A==;
X-CSE-ConnectionGUID: wZq5oIQsTHCXOpC2RXOeDg==
X-CSE-MsgGUID: oIv1Rdq/SVaLhvmdy9AdHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82583110"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="82583110"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 21:16:54 -0700
X-CSE-ConnectionGUID: EK8rt5OpQxS3L0MF27i69w==
X-CSE-MsgGUID: BaCGEwcaTRanrV7b5XmRew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="247108885"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 21:16:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 21:16:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 21:16:54 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 21:16:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWAQgOOdn/L7DAageP/FzHn/P3knvllFURbAcAOozF2W3FkRvMbZ63jYPWX0s63kHzJdbupMq6C4Y4p7lPcokbwDvgJT7QpmZ+ziH9UgyUPZE/2/2JfkV85KmufBeea6itpBQngdQBqkBMcD+IbPsJSrQwGzOMkX+a6Rb3BM+zyoSzH91wdYPgC7J9f41W31QLRFPoBQhnzQSPgPCOHiknJX8qY9Yd98vZ5U/V9ItCefuZMpEvUlkQ19euVOU9R8bE4BwXqBATiZBOQxpCEQFK/hKUfoIhqeKrg+/Uq5t+YJiHmXf6vM0I0VlCIWQ3YjxZI8EVGl/ByCGl5xuIqGxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnegIigB7boEq9naLHyIXSuiueDCHZ3Mk1kRt1IgwZU=;
 b=ottc99QbRtSaFvDBfiVamiEX6zin1qnCpsFgg5Ip80TDEhPs+9Ezq1FLTEUMiaAOLlPhflNfXVI4Lj3HUM8v+i35vl/poGMRhKlPlHnSUSqC8m53PcFStkPiLN+Yu1BA9NArpZriUyOXPPmFdVWrzX46d9bVrRtVcMDGEppFcLlnUuOxB8N/78XHyPvfxXR73kMDu0YypPnhcbnFvVbr4XiSN83k1w5NkQwPCcjFGpK6TDIAaSJYJEwzzJOMBnfJzbG2Bdy5bmhY6fbh62LGaW4q8084Fhe4UxE54+TrNErlb2Quz47tNzPLpY24yjqba0s2MI3rizzuqkVwYad9uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by DSVPR11MB9767.namprd11.prod.outlook.com (2603:10b6:8:34c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 04:16:51 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 04:16:51 +0000
Message-ID: <0060d62b-722e-4116-925d-44a5a3b3449b@intel.com>
Date: Thu, 18 Jun 2026 09:46:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 3/7] tests/intel/kms_pm_dc: Enable DC3CO test for
 PSR2/PR modes
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <mohammed.thasleem@intel.com>
References: <20260609034650.2281712-1-jeevan.b@intel.com>
 <20260609034650.2281712-4-jeevan.b@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260609034650.2281712-4-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0250.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::9) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|DSVPR11MB9767:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc49973-a8d4-442b-b5e8-08deccf06c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|18002099003|22082099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: p+3ZTT908DcPe1kx48lETCOmXWpsH7HTCu0T/kcB+7/F4UTzdq3/mbek0FsguPU75m6RpTqFEeHMLaC/ROIyNJV6M3Lm5wlCk84wxU2k90a2uF2kHmuRG6p1GJIWdGjT/Y6ZrpGfgtb95yN4lvYpwjZ5fa9YDzhlrdUxeuGnVp5dfY46CGF/z5opn4DXL4ax8lxFInBLqxQLT/Bndd+mA9+YQn58rFjtcTwgnyV6PVgn+4A3bJ/JVekosB4MTHKteUgTZHEznPaLMDRvOWZcLUufd08vRRGhpAen074Z4r3D/B4Nkpz5NLthLLsTabkoQ5nies1TsplgmYKjYCTO7UmNLtgymb/duBqE+XP5yk1x52Gb5VIs+GklvDZV3Or2alT0AqodDdLb67He1IWxZl5bzT3nltoZIOIkNkMasXYk2sB3MaHOoXNz9f/ts8arts7X2YNIXqT3y8JgnXmTzwkz5kqMePAIXC1UMt8cEOxl7lE7EnK4fC37vNsujcR2S06tcQiQAnRaLq4GVsUTzVTRXCVCeIIRT+KvHPY5joSiXMl4upXkyYXDZdMan427g/D7GbggchePSb/HXNzUOWca07S3ecdHes30c9FpBwmmnIeo02cUgr1HH3oh/cLtwNbMI3zT1F4qs2iYdaCuLOKVYrNiN7vHJesDWn0pFm4871bjY7appTBH8sfcqYlN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkU1Y2NCR2tjN0VJem9pems1SE9JbTF5MVE4MVYxL0N0TWZYZkZ3MzZ5WW1r?=
 =?utf-8?B?WXFQZHpUcHM0cXpLTlJ3WXA4UStYN3ZrMEtlRkRLSUUxVE9ETXlBa2xLZHpM?=
 =?utf-8?B?WWZCWVY0WVdnZHcvUXh3NUthK2hvSFVnS0N3OUNlZG1Ja3N5UGNUUjZPc2ph?=
 =?utf-8?B?bGFycTlNV3FkNkswMGgzV2hUUkNiRlM5SzhSSzFpVU1wMzMvSXR6QVIxY2tm?=
 =?utf-8?B?YUFFU1BrVnZpNm9UOVVMZmlvWlB0REpFaXNBNGtkWlVzcmd5NFFhVUF6Nml3?=
 =?utf-8?B?NFR1bjJuN2hrcDdwN0tHV2FIQmRrNFJJTGdnKzErQitBNTB1RHB1bTJoQVJi?=
 =?utf-8?B?c1hHVXVFOGZJRTBEa1dDMEd5WWhPUGZRbHUrcm1tMkJ2aU1Jd3JEVWY3b3hm?=
 =?utf-8?B?bG5vNE1XQVhaYVpWeFRwSEpCM2lSVCtKMjdZUFBDa1ZJdkREMUhST0tLbWds?=
 =?utf-8?B?UnE1K3VSVDNhTGlpaGtkTVFDSnFzamJmTU5qR01nNzZhamFLb1c1MVhHblRm?=
 =?utf-8?B?NUpRMStJRDdKcDRSdjY2YjFEWWNTbGU0UlVCT1c5aXpjMEF5VjlJVWUyRGxC?=
 =?utf-8?B?MjBjTzIrOGJRVE1sWUZMb0NTZWtWY0FTendVZDNnekNYQTB1UUtyUTNkakNx?=
 =?utf-8?B?d3FZdk9BNmJpMEljUVhwQU9xM0xxc2dEME5IR2VHN1QwNS9OYnZXRFNuZTls?=
 =?utf-8?B?UWYrYkVWTlFBSDgxbmd5cXREc0VKOC8yeFZYZ1RBZ1l5VXZRSmg1eU03dEln?=
 =?utf-8?B?U25EMzZqVEZzRnFZU3ppN3pMUm1YTitwbEtjQ0h3ZGk1S2NMbEg5NFBNQzA1?=
 =?utf-8?B?QWdZMGJLaUNVUXFqSnYzVldQamFaK00vY3dJNndYQlF5SVlZMzhpRVJGYjR4?=
 =?utf-8?B?SUhWZnRGSEQ0YjZzTzhKT1h6UFpnM3NFYWU5NysrVGtLVitCY3NmSk8vOFgv?=
 =?utf-8?B?dXZCc1pYMzNFb1N5TWEvVHE3VzUwaWk3Umc4SnR0V0FjZy8zbnZ6T0txRHFu?=
 =?utf-8?B?aEhuaHZLL1E5WmhMNlloTG8xcEVncXNTdmhkbVBOSHhnaUJBc3ZBNzEyUDlS?=
 =?utf-8?B?bllTcHl1K2RpcFZnNk85YWMxWUw2SGFxZ3VNZFNwSWNoQ3BnNUNLY2pqQXFW?=
 =?utf-8?B?M0FwS28xMWswTkcwN1V5VWtTMU1vWkxGeWQzZkVLK0lGUW5sSmlFanlWUTEy?=
 =?utf-8?B?Y1FPSFhyYUVycGxnU3V4d3c0VXFQUndrYTR5OWFqOHZlVFB2UE91U3djZmxE?=
 =?utf-8?B?MUcwMVVqb2VLbUFZVDJKdjQxTllHM2ZZNUd5OU1hajBSMS9NelhhRG1XWlBX?=
 =?utf-8?B?dG8zU05BZkZEY2ZrNHhPZmZXdGdYQ2RqdERLQnlzNTcvVithZXJ0dzhzNGpY?=
 =?utf-8?B?TXpOZFBSbnk1Vnp3ZkNhRkU0L29kZ0ExRXkrUmk4aEt6dUN4cFMwd1FTSmRX?=
 =?utf-8?B?WTFQaDVVamM0Nk5OUitvTVI5SDZRemVCL1ZUSUJNdWo5LzhmWXErdy9JTHlJ?=
 =?utf-8?B?V0dwQ2d6UUROZnB1Y3orNjRyeDdDMUN2S2ZYRVkwUFk3NVFkdU9JOHhaUE5k?=
 =?utf-8?B?cEZnbHlENCtBZkxQb3Z6a1lFVHNwZjhuUHp3WENTQVJ1ZGxvRllCWVBVQWtm?=
 =?utf-8?B?Y2k5T1pCVkkwTFJxbXNPSlI3VitLY0NEMjFOam5JTEpiWWxDTWFvOVNXMGFN?=
 =?utf-8?B?bWJHYWpiMm4vVFk4VGg4UVRRbG5mbGhKTEVscU5ja0tLL0lnbzZMRy9MZEVK?=
 =?utf-8?B?VlVZdU9JTFhnendlaVhtZzY3NWRaWGYvN2ExRXJFc3JhZG4vZXB0clNZR1d2?=
 =?utf-8?B?SXlteG1XMUlEaUlOUVEvU09aczVDWkw3TEJEK0NqSTNwdkxVcTZzV3QyZXRG?=
 =?utf-8?B?MHozS3FlUjRsYS94VUVTVWs5ODVLN3Z2eHQ5d2FTVXEvZC9NU2FhTVhBUk1u?=
 =?utf-8?B?QUZGa2Q5MzNGV1dqOGtxbFhVRHhndHd2S00ySktXRjVMRldMNXZMMmNvRUlP?=
 =?utf-8?B?ZTR2RTV0bnNLMVkvVWFFOTdHa1MzWVgwL0hBRm14N1pOUDYxNU9JM2owb00v?=
 =?utf-8?B?cm5tU0ljWjZyOW04UFZwbkt1aStPTEU1Ync0azFBU3hzRGdOTytNU2dDM093?=
 =?utf-8?B?L2M2emRGY292THlvL3ZDSTVwd1I0N0ptOS9kMzNhVFMvU0VOeFVVLy9mN1JW?=
 =?utf-8?B?ejQwMVJpWlZkOGZRYTNsUVN3ZUJZOW80UFM2ejR4TEtUNVpJM2x1VHN3bDhS?=
 =?utf-8?B?d2cwMXllWHNaYm9neXE1WkpJQTVpUE45QVJMTVBXVCtLUDlSeUZ1WTd2V1dw?=
 =?utf-8?B?UDRtMjRGNGhhWUtVOW5ZdmFUSnoycndnY3BJR3FMVzZYa0Mrb3hwQnpyZk9t?=
 =?utf-8?Q?fnLaCi2MqrekVxD1stTmbP9zCIOj1lEqMPLT6KsKIetLZ?=
X-MS-Exchange-AntiSpam-MessageData-1: HEbV55CQEz78rw==
X-Exchange-RoutingPolicyChecked: XaIQfQmG7/tsetoW+JazLO1ttfKBIymd/P3BZNR/F89akKH5PdqkaO63ASC0BYfPaa/QWlsApraczqZuQDxsTn43+LYs5IAt1fykIOsh5PN4xuH9pkMFhyDmVE5eRQeTXbIZJ0NWAxPVReiVaONHZkRbxGcqBoOq39Ijzo3X2GJ2rVY/gQipiU+jW8MQqcbawxZFchIaJEnDGw2FXqbIHqPRHTi0TpKOkOHOeffe51qvGCfD5HMQGATN80XqPHg6n7mVJiKXkuc8zZB8VCozscguy/Gnv/41BzQ+CsLauKlxs5GKPeLn/vxqziEEnqesV+LQt70ZC/0R9PJkBd41bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc49973-a8d4-442b-b5e8-08deccf06c4b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 04:16:51.6137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qozkE0pSmgibe5Q+EAwhGxJIlfDMVuJjbF1MRf9VZKHevkB4HRX0phc1foLtEnjlX2gWVKgYXgm8VynQraqFOIFmJzxvn4G6umnFxG7HgfYBPENFC7SH68HaHtI8P+BE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9767
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

On 6/9/2026 9:16 AM, Jeevan B wrote:
> Enable DC3CO with PSR2/PR mode on TGL and for platforms with
> display version greater than 35.

DC3CO is enabled for display version 35+, so TGL can be removed.
With that fixed, LGTM.
Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>

>
> v2: Fix debug, remove trailing dash and merge mode and char to
>      single strcut array.
> v3: Minor cosmetic changes.
> v4: Update commit message, use data->op_psr_mode directly, keep
>      psr_wait_entry, and refresh dc3co description to cover PSR2/PR.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 45 ++++++++++++++++++++++++++++++++---------
>   1 file changed, 36 insertions(+), 9 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 27fa5dc39..57dade47d 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -48,8 +48,8 @@
>   
>   /**
>    * SUBTEST: dc3co-vpb-simulation
> - * Description: Make sure that system enters DC3CO when PSR2 is active and system
> - *              is in SLEEP state
> + * Description: Make sure that system enters DC3CO when PSR2 or PR is active and
> + *              system is in SLEEP state
>    *
>    * SUBTEST: dc5-dpms
>    * Description: Validate display engine entry to DC5 state while all connectors's
> @@ -110,6 +110,11 @@ typedef struct {
>   	bool runtime_suspend_disabled;
>   } data_t;
>   
> +struct dc3co_test_mode {
> +	enum psr_mode mode;
> +	const char *name;
> +};
> +
>   static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
>   
>   static void set_output_on_pipe_b(data_t *data)
> @@ -323,7 +328,8 @@ static void setup_dc3co(data_t *data)
>   {
>   	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, data->output);
>   	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output),
> -		      "PSR2 is not enabled\n");
> +		      "%s is not enabled\n",
> +		      data->op_psr_mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
>   }
>   
>   static void test_dc3co_vpb_simulation(data_t *data)
> @@ -658,12 +664,33 @@ int igt_main()
>   	}
>   
>   	igt_describe("In this test we make sure that system enters DC3CO "
> -		     "when PSR2 is active and system is in SLEEP state");
> -	igt_subtest("dc3co-vpb-simulation") {
> -		data.op_psr_mode = PSR_MODE_2;
> -		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     data.op_psr_mode, NULL));
> -		test_dc3co_vpb_simulation(&data);
> +		     "when PSR2 or PR is active and system is in SLEEP state");
> +	igt_subtest_with_dynamic("dc3co-vpb-simulation") {
> +		static const struct dc3co_test_mode dc3co_modes[] = {
> +			{ PSR_MODE_2, "psr2" },
> +			{ PR_MODE,    "pr"   },
> +		};
> +
> +		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
> +			const char *name = dc3co_modes[i].name;
> +			data.op_psr_mode = dc3co_modes[i].mode;
> +
> +			igt_dynamic_f("%s", name) {
> +				igt_require(psr_sink_support(data.drm_fd,
> +							     data.debugfs_fd,
> +							     data.op_psr_mode, NULL));
> +
> +				if (data.op_psr_mode == PSR_MODE_2)
> +					igt_require_f(IS_TIGERLAKE(data.devid) ||
> +						      intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with PSR2\n");
> +				else
> +					igt_require_f(intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with Panel Replay\n");
> +
> +				test_dc3co_vpb_simulation(&data);
> +			}
> +		}
>   	}
>   
>   	igt_describe("This test validates display engine entry to DC5 state "


