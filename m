Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65E4C5DF9D
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 06:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5804110E3A9;
	Thu, 27 Aug 2026 06:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yarjsw2M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC2110E3A9
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 06:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787813679; x=1819349679;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JXNIbUE6Dj4lYIofeo9rVNsTcMdxNa6Rd04h5aqbKp8=;
 b=Yarjsw2MJYcx+KpguY0Ppeg/L0X+2A4ZAJ67gghVSBv8yU9Q6JrFlSpI
 HaS43aCm0ej2qVSVFK7GDByz0mYLliaKL36P9v7YwFns2PvGTTSC51ioB
 xg3dOPSFq2STQEo+GWo25wpCWXvHo5sWFQUlE2vNY/NwQWyTmajnkY7Mo
 mFI3TI6qcY4zASPFi8FhbfrAaWIbZuhmDR5urjaTTNQic4ZM2Keyp1MeI
 8tRrJG3Er71W9use82JN6RrYjEnKKICWzOOO1kepBD9ipbogurBtye23Y
 DZsgRXwqXEnBbCUTRLc5xBGxIivaqiniXUJTE/1jsnfIToEzh2dN3t6mU A==;
X-CSE-ConnectionGUID: ItosP+ipTlackmU4PN0sRQ==
X-CSE-MsgGUID: 4D+dD6n3RtCppPLb758H1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88362027"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88362027"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:54:39 -0700
X-CSE-ConnectionGUID: pqqNENHxQrWRxOplLiQxxA==
X-CSE-MsgGUID: oin0iRxgTRiTSbbECgpjWQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:54:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:54:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 23:54:38 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:54:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sam8nucFi4J1AtXnjRsYpZI8CCMuCFbevZ7JX4GqgoUSuQNoDybE6yrWA1GGT6pRmbZg2kDFO3dNb1A6jB1nNmPyCkm9xScu64Jl605znhpFheDpHWtbo7PGBLIIKkdzilvV+OUGkTsD0ZOYseyZGdUXJtrWUYrsVkvJB6hZtkgnVM5jekXTGVpyVGPrHN1Tg6bykDpKTwB9hHDJTrk+ngkaHMC8TT8hI7Yocr6PMc42aT5bEmRjvTrUg+E3cROvwpM0vSAo5boxZ1m5jnzk+mCpcPSZvDbeWVdbL7ma+/tk9FXckuY+Sc3/KqnssKFYx6wATAWPkA6/phab0kRyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtCcG3YOLe1Q4F8DPP+emDXvlO9Xp1nFOdpc7VJRs5o=;
 b=qCJx5GaLmE+c7LB87wyRdGijRjEBkJI5jBFD4uzSWN1S105ROQUfC30r18Muk07kJdAQcSY9PCG7GHArxnRiv/4bE/NVAx0wt8Eed2/R2kZDrzTRu4L6MYX/0PZbC2D7MGMZm1YUDSuz3xU/u4H1jz06GOXJY31Pdt4V0AT7f/R8BREId7fE3wAyc53TYBPqIELqnyGxu1YvbxKQeyIBElGTJi2F0uWHfO0UD7Ew2g5mqacXpSdWiYZ5NyiKD+8nVKalHettuPIR4vd1QunKJqR+1YUOMLKTsnq+UT+jnoDtQl7LnKRczaaTEKJ2qq7xMysFgMJp/ROIk4JyxTOQUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH7PR11MB6697.namprd11.prod.outlook.com (2603:10b6:510:1ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 27 Aug
 2026 06:54:36 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.005; Thu, 27 Aug 2026
 06:54:36 +0000
Message-ID: <04237f18-ca3f-4f8c-9a78-52b494530827@intel.com>
Date: Thu, 27 Aug 2026 12:24:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 3/3] tests/kms_vrr: add CMRR fixed and video mode
 subtests
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <mitulkumar.ajitkumar.golani@intel.com>
References: <20260825183359.2791891-1-ramanaidu.naladala@intel.com>
 <20260825183359.2791891-4-ramanaidu.naladala@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260825183359.2791891-4-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0207.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::15) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH7PR11MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d40289a-ae7e-4d71-903a-08df04080933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|3023799007|56012099006|4143699003|11063799006|18002099003|18092099006|22082099003;
X-Microsoft-Antispam-Message-Info: OJV2sf7YtdIB467UkuQLBCBqMPJhIB43ZRhBBkDu10GKuoffscDzNrZA4fPpMWS9SufDjmdgJAxRRw1FWTow3RalYfsotLENrcnjG1ZaE4agr4U5BmSBbztAohSVd3BCx4XeAwIzKzlzksxpDFMbDUoGHUcZxSemrovy/CARrjQs9zx6CB5420qFzTgkgeve8jbeuNymTcE6w0rFAWjmNBpbaLu7wfFf+Lf+7XukJE+qzqel1pXR3lJERAt0ExMaEAiEJssty/CESAb3xPSZrXmUB/Ywtb17R36qDNauV6XI3Mnan6PZqSGYQt6x5hw1alydfe1p978Ix0g/S8rbbnuff6WNrDAT2bnBkE5wyXVcWroPGVVU5GZ+oSfATzQvRCUjhSobMXHK7lonFqNn07JlSBqShclwbYpgpvjBOGWbnUEt9WHQ4GaTvTaA+Dlb0JuZAZcxlES9F3pJVLigNFjEYscgO6AEXv1FkIW1OW03CdKm4Hb5IjyLOafAYPH6L06dvBrx9RIfcts5m8R2rmPkrYd31dPanNKJk3vIg0+MGMA+X0DLqDynGVPFmuj/A81274CLU599DgVF0TytBjwjxRJUgdueVC1Nnqbsx2rYTJvJ793yc/uzhikyIAp9EzsUlrMAMChvJNiVlH1D9wZQ6ZRXI+Rg/+HpU/DULnI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(3023799007)(56012099006)(4143699003)(11063799006)(18002099003)(18092099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWJ0eS9IWTUyL05YU29IZ0NDc1JvR0xZYWRWMkhQLzM2N2JEU0JOZkh0MWtL?=
 =?utf-8?B?ZjJNVzZBTWd3YlN1R09tTXBKaElsbTZjdGZMK2VVVTZsN3B2U0lmcG5CWDVj?=
 =?utf-8?B?dkxlbzBhNWd3ZU9LRzBiWnVPRFU1VlB0U1JoTDRwcE9aMFN3RjFXOG5hTGFa?=
 =?utf-8?B?cHVqVHFCbjZ3R2VYajNuWlQ0R2xrVGRKbGV3SW4vVUU5S1FoOWdSaDFEYlhQ?=
 =?utf-8?B?Y3ErWmt4RlRndC9TdlBuOC9HNm5GYkVkMm0raTlUaDNNSy9qcUVnVWpVMzFh?=
 =?utf-8?B?UWw1OXg0VldvKzRsMDlpRTFvTm5uZng3R0xhc081UU1vOVJjNyt6czhvYkF0?=
 =?utf-8?B?RUkyWXdVRzl1SEhDU0JKc2NtaDlxZGFISHlINFY3and2Z2gwdjlZR0xDZlZ5?=
 =?utf-8?B?cTdrVEV0ekJHcUhwbWtLelJZUjkrUjgxR24vVjJuTEF0U21wSHZ1enB5clRz?=
 =?utf-8?B?V2hWeFpnaEE3by84UG1pcEVhazJUNERwTnNRZXN0bmg1aXpMckNjaFMyaURa?=
 =?utf-8?B?R0hKcjRUcy8vbzVqOC9qdjMrV3JOMTc4dDNPN1VLZTk3Y1pzRzZkazVyblVy?=
 =?utf-8?B?S3BhQlVxdFVaUnJwa2pzQWxYMVBETmJUN0pVR3JNcEw3Rm9ETkhML3ZiVWpM?=
 =?utf-8?B?OEttckZhengwOGVEVkdodHpNMFhJck56UGo2WktPMnVlK0VkdGxrSHpRMGdT?=
 =?utf-8?B?c2hSZ0RtTllkekpzWUE5aEJtZy95c0VTYWFiSlpOZGdDNnVVSldKeTArUzV3?=
 =?utf-8?B?UkwrTVJDRW9WZlo3dGdGSTd4NFNkSnRsclpPcEVyVzlUT0JmM3IvRTBtU280?=
 =?utf-8?B?aE9yT0t6RmJ1Z1lnVFg2VGZkNXZsQit6V0RPaFp3K0VSaU9qclVUVjFWcC9B?=
 =?utf-8?B?QVhmNVRCRXNqNEFkZFNicnZaSUl5SXJENllkcFJNVmltb050Nmo4TlFEdlM2?=
 =?utf-8?B?Zm5JTVN1VE5yTjJSZ1QyczU5ZVhwMm14dU1pTU9rcWpHVEh1NHBjbFVKWEtL?=
 =?utf-8?B?Qm5BNEorYWZsUXJLZERMNUxtTVphbk5zT2FxOEZIUnZDY2NRNmRhOUVZUUpB?=
 =?utf-8?B?K0ZCRDkxRk9Ba1JVQ2VaV0FtaDdscDdveEhIRUxFa0NUeDlVMFNmTDJGdjRy?=
 =?utf-8?B?U3l4Q2ZnbXFZM1BVNDFDeE5KRnBGSVoyTk9pNy96aTc3c3ZNbnhIVDZGL0Jm?=
 =?utf-8?B?Vit3VkU4TjdYQkp3QkF4TkFzSnZEY3ZuQ0xuekVib1F4KzB4S1J4c2xRU3FW?=
 =?utf-8?B?U1J3NEZVYTRueTlnOC8wMnl6YmRlZkpLY1pOdmNlTVNxVkhFUjN0cWNuaWNM?=
 =?utf-8?B?cGJ3UjNUZDFzQmlTZzl4MFhFM2hGcmlOSXpTeGJKeEc1clVnalViSVN3aUto?=
 =?utf-8?B?M2lubkFuQnZKQ0pteU5FVTZOb1ZudWdlOE5pZkh2eUVnSGg5aUZjdTBOVzZa?=
 =?utf-8?B?bkIyVHBZMUNxY3EzZ2I5SnF2SmduTWdsak1TQXdQekxaQThodnRNUnZ5djFC?=
 =?utf-8?B?T2swWmg4enlXdmhVVFJkb0dTdmFzMzJYVlVDSWJCMFN5Q3c3eFozMVFQVFFw?=
 =?utf-8?B?WFpLSi80K053QjFiUlhCdE9nMlBYWDQ1YzRwM0Y5ZEc0NWlISzZiVWh6L1dK?=
 =?utf-8?B?N1g1ZzdOanB3NFN5MUFoRFVSbHF5SWcyNXFQWXlWRGgxMDhCbmJqNXA1ZFl3?=
 =?utf-8?B?L1BHbDRjdTFzQW9YQVQxOC8yVGcwVWtOcjN0dWU2NktBbi9xZWtOQnZuUjVP?=
 =?utf-8?B?UUF0MmFTVk9TdEM4Z2lqVXlubXVpTEhZMjBiQ0dHdjluWm1vYzJQRmxvb2du?=
 =?utf-8?B?aXAvTVZveVdiOHZ1U1N4ODlnajNyMm1KV2FFdnp2dnFlc2FYcVdSN2U3dFdr?=
 =?utf-8?B?eUVWaTVYcWN0dStCR0k2Q1ZteVl4RnR3d2R3KzR0ZklUL21kdXMwQVNRYW9M?=
 =?utf-8?B?d3lyMkVQSXdaaWR1QmNsUHRaRWtVOHNpWXZNVEJBd3Jaa3ZZN0pTQ05HUHBG?=
 =?utf-8?B?RFl3Tlc5MjZvZTROTlp4dzdJKzNWNnEyaENvQ0t4WWhZZERkRFFRSzhOdFNQ?=
 =?utf-8?B?TTA3eUExbDB6c25uckUrSWZIT0dpdDdYQzEwWmFIOXQ1WDQ5VmdEUmtDOHFU?=
 =?utf-8?B?UVJhYTFjRWJIaUlVbEN5QnJXMDh2QXhTRU91Z0h4ZjRSajRPVTdrMmR5NFQ3?=
 =?utf-8?B?d1N5NHhxRzNId05yZkE5U1pxOFhnemhZVEdtQkNTUVdiSjM0emEzQlRJY0pB?=
 =?utf-8?B?akpqTkhhbTZyaXVKN0RSOGl0UWVmeFd1MXhGc0luQk1ZaDFWdkp2ZUlJL3ZE?=
 =?utf-8?B?czNhT1EwN2NCOEo1Um1PNmlEbE5URzNRTmpIdFZRb2NXR3o4LzRhOERYUUNL?=
 =?utf-8?Q?VBrwjn1lJ+WLbKoFjEh+14KxztD4PYIHea2cq?=
X-Exchange-RoutingPolicyChecked: 1JSCzLAR5fcgK5kq1k9W7TlJxLcnd4l0dXEbd0JduO/mhpPDU1gnxVEozTgqbaT2USliPavREMaoZ/STz7ahMd3eSWXvAIvV4wabcSYne+rV5ee6tojLKELfk1tKBIaDcFG3qdbEWt0AxAzkpZhTKLcWuVjMwfhIYhoPkho8TGr1Wl/RVJxc74oD0acjjX5bkCfY3kg0MBR0McIo/l+IpuqsonXwwCDDMLxdeARyh5CQsSdUSc5sQsBkdFcBtN3FANsK8FftuLnI7CDxvyK1LubCIeApe1a3a9BqtztsvmjW4diO3Udkj+0W83mO3OCT2xnBTs6ozsIUWxRP0HUQIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d40289a-ae7e-4d71-903a-08df04080933
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 06:54:27.3263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UYPtjqZFn3p2coZngDFd+NydVuvpHo2Xu2PhDPuNcxc/FJTRfjnIxuoqCT1siRkzz75D8s0XRgReDoNOkQJ/HofqzPp5CKKp1O36xQiMCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6697
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



On 8/26/2026 12:03 AM, Naladala Ramanaidu wrote:
> Add test coverage to validate Content Match Refresh Rate (CMRR)
> behavior across both fixed and video timing display modes.
> 
> This introduces a shared helper library to support refresh-rate
> mode selection and parsing, along with two new test cases covering
> fixed-mode and video-mode scenarios.
> 
> The new tests measure actual display refresh timing during CMRR
> operation and compare it against the expected target rate to
> verify correctness. Video mode coverage validates behavior across
> standard video timing rates, while fixed mode coverage targets
> display modes that fall outside the standard video timing set.
> 
> Each test cycles through the relevant refresh configurations,
> applying and resetting the appropriate settings between
> measurement passes to ensure consistent and isolated test results.
> 
> v2: Fix test issue.
> v3: Address review comments. (Mitul)
> v4: Fix test issue.
> v5: Address below review comments:
>      - Rename CMRR fixed/non-video mode references to desktop mode. (Chaitanya)
>      - Factor out vblank timestamp/sequence retrieval into helper. (Chaitanya)
>      - Simplify CMRR tests by extracting common mode logic. (Chaitanya,
>        Mitul)
>      - Refactor CMRR refresh-rate verification and frame filtering.
> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_vrr.c | 231 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 231 insertions(+)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 27f18e8d0..1afc1e2bb 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -32,6 +32,7 @@
>   #include "igt_pm.h"
>   #include "igt_psr.h"
>   #include "i915/intel_drrs.h"
> +#include "igt_vrr.h"
>   #include "sw_sync.h"
>   #include <fcntl.h>
>   #include <signal.h>
> @@ -80,9 +81,22 @@
>    *
>    * SUBTEST: lobf-dc3co
>    * Description: Test DC3CO entry during LOBF.
> + *
> + * SUBTEST: cmrr-desktop-mode
> + * Description: Test to set a desktop mode CMRR target refresh rate and verify
> + *              it is correctly applied.
> + *
> + * SUBTEST: cmrr-video-mode
> + * Description: Test to set standard video timing refresh rates via CMRR
> + *              and verify each target rate is correctly applied.
>    */
>   
>   #define NSECS_PER_SEC (1000000000ull)
> +#define CMRR_NUMERATOR 1000ULL
> +#define CMRR_DENOMINATOR 1000ULL
> +#define CMRR_VIDEO_MODE_DENOMINATOR 1001ULL
> +#define TARGET_RR_SAMP_COUNT 100
> +#define CMRR_RR_TOLERANCE_HZ 0.02
>   
>   /*
>    * Each test measurement step runs for ~5 seconds.
> @@ -103,6 +117,14 @@ enum {
>   	TEST_LINK_OFF = 1 << 10,
>   	TEST_NEGATIVE = 1 << 11,
>   	TEST_FORCE_RR = 1 << 12,
> +	TEST_CMRR_DESKTOP_MODE = 1 << 13,
> +	TEST_CMRR_VIDEO_MODE = 1 << 14,
> +};
> +
> +enum {
> +	CMRR_VIDEO_MODE,
> +	CMRR_DESKTOP_MODE,
> +	CMRR_DISABLE,
>   };
>   
>   enum {
> @@ -221,6 +243,38 @@ output_mode_with_maxrate(igt_output_t *output, unsigned int vrr_max)
>   	return mode;
>   }
>   
> +/**
> + * get_mode_with_video_timing:
> + * @output: Display output containing connector mode list
> + * @fps: Requested integer refresh rate in Hz
> + * @matched_mode: Returned mode that matches @fps
> + *
> + * Find and return a connector mode that matches the requested
> + * video timing refresh rate in Hz.
> + *
> + * Returns: true when a mode is found, false otherwise
> + */
> +
> +static bool
> +get_mode_with_video_timing(igt_output_t *output, uint32_t fps,
> +			   drmModeModeInfo *matched_mode)
> +{
> +	drmModeConnectorPtr connector;
> +
> +	connector = output->config.connector;
> +	if (!connector)
> +		return false;
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		if (connector->modes[i].vrefresh == fps) {
> +			*matched_mode = connector->modes[i];
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>   static drmModeModeInfo
>   low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>   {
> @@ -580,6 +634,168 @@ flip_and_measure(data_t *data, igt_output_t *output,
>   	return 0;
>   }
>   
> +/* Measure and verify the effective refresh rate against the expected CMRR target rate. */
> +static void
> +flip_and_measure_target_rr(data_t *data, igt_crtc_t *crtc,
> +			   double vrefresh, uint32_t cmrr_mode)
> +{
> +	uint64_t last_vblank_ns, vblank_ns, frame_time_ns;
> +	uint64_t total_frame_time_ns = 0;
> +	uint32_t last_seq, seq, seq_delta;
> +	uint32_t err_frames = 0, valid_frames;
> +	double avg_frame_time_ns, avg_refresh_rate;
> +	double  expected_rr = 0;
> +	bool front = false;
> +	uint32_t i;
> +
> +	switch (cmrr_mode) {
> +	case CMRR_VIDEO_MODE:
> +		expected_rr = (vrefresh * CMRR_NUMERATOR) /
> +			      (double)CMRR_VIDEO_MODE_DENOMINATOR;
> +		break;
> +	case CMRR_DESKTOP_MODE:
> +		expected_rr = (vrefresh * CMRR_NUMERATOR) /
> +			      (double)CMRR_DENOMINATOR;
> +		break;
> +	case CMRR_DISABLE:
> +		expected_rr = vrefresh;
> +		break;
> +	default:
> +		igt_assert_f(0, "Invalid CMRR mode %u\n", cmrr_mode);
> +	}
> +
> +	do_flip(data, &data->fb[0]);
> +	(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> +	igt_wait_for_vblank_ts_seq(crtc, &last_vblank_ns, &last_seq);
> +
> +	for (i = 0; i < TARGET_RR_SAMP_COUNT; i++) {
> +		front = !front;
> +
> +		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
> +		igt_wait_for_vblank_ts_seq(crtc, &vblank_ns, &seq);
> +		(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> +
> +		frame_time_ns = vblank_ns - last_vblank_ns;
> +		seq_delta = seq - last_seq;
> +
> +		last_vblank_ns = vblank_ns;
> +		last_seq = seq;
> +
> +		if (seq_delta != 1) {
> +			igt_debug("vblank seq delta = %d\n", seq_delta);

%u

> +			err_frames++;
> +			continue;
> +		}

why the change in how you decide if the frame is valid?
If it is a better approach document in the change log why so.

> +
> +		total_frame_time_ns += frame_time_ns;
> +	}
> +
> +	valid_frames = TARGET_RR_SAMP_COUNT - err_frames;
> +
> +	igt_assert_f(valid_frames >= 90,
> +		     "Valid frames below threshold (90): valid_frames=%u, err_frames=%u\n",
> +		     valid_frames, err_frames);
> +
> +	avg_frame_time_ns = (double)total_frame_time_ns / valid_frames;
> +	avg_refresh_rate = (double)NSECS_PER_SEC / avg_frame_time_ns;
> +
> +	igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= CMRR_RR_TOLERANCE_HZ,
> +		     "CMRR refresh rate mismatch: measured avg_rr = %.3f Hz, "
> +		     "expected_rr = %.3f Hz\n",
> +		      avg_refresh_rate, expected_rr);
> +
> +	igt_info("Average RR (Hz): %.2f , Expected RR (Hz): %.2f, error frames = %d\n",

%u

> +		 avg_refresh_rate, expected_rr, err_frames);
> +}
> +
> +/**
> + * Programs the requested CMRR target refresh rate for @mode, verifies that the measured
> + * refresh rate matches the expected CMRR behavior,then disables CMRR and verifies that
> + * the refresh rate returns to the mode's nominal refresh rate. The function asserts that
> + * all target refresh rate programming operations succeed.
> + */
> +static void
> +run_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> +	 const drmModeModeInfo *mode, uint32_t cmrr_mode)
> +{
> +	uint32_t numerator, denominator;
> +	bool ret;
> +	double rr_from_mode = igt_vrr_mode_line_refresh_hz(mode);
> +
> +	switch (cmrr_mode) {
> +	case CMRR_VIDEO_MODE:
> +		numerator = mode->vrefresh * CMRR_NUMERATOR;
> +		denominator = CMRR_VIDEO_MODE_DENOMINATOR;
> +		break;
> +	case CMRR_DESKTOP_MODE:
> +		numerator =  mode->vrefresh * CMRR_NUMERATOR;

double space

> +		denominator = CMRR_DENOMINATOR;
> +		break;
> +	default:
> +		igt_assert_f(0, "Unsupported CMRR mode %u\n",
> +			     cmrr_mode);
> +	}
> +
> +	igt_output_override_mode(output, mode);
> +	igt_info("Override mode:");
> +	kmstest_dump_mode((drmModeModeInfo *)mode);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	ret = igt_intel_target_rr_debugfs_write(data->drm_fd,
> +						crtc->crtc_index,
> +						numerator,
> +						denominator);
> +	igt_assert_f(ret, "Failed to program CMRR target RR (%u/%u)\n",
> +		     numerator, denominator);
> +
> +	flip_and_measure_target_rr(data, crtc, mode->vrefresh, cmrr_mode);
> +
> +	ret = igt_intel_target_rr_debugfs_write(data->drm_fd, crtc->crtc_index, 0, 0);
> +
> +	igt_assert_f(ret, "Failed to disable CMRR target RR\n");
> +
> +	flip_and_measure_target_rr(data, crtc, rr_from_mode, CMRR_DISABLE);
> +}
> +
> +/* Validate CMRR behavior for supported video and desktop display modes. */
> +static
> +void test_cmrr(data_t *data, igt_crtc_t *crtc,
> +	       igt_output_t *output, uint32_t flags)
> +{
> +	drmModeModeInfo mode;
> +	bool found = false;
> +	drmModeConnectorPtr connector = output->config.connector;
> +	int j;
> +
> +	igt_require_f(igt_vrr_intel_target_refresh_rate_supported(data->drm_fd, crtc->crtc_index),
> +		      "CMRR not supported\n");
> +	prepare_test(data, output, crtc);
> +	set_vrr_on_crtc(data, crtc, true, false);
> +
> +	if (flags & TEST_CMRR_VIDEO_MODE) {
> +		for (j = 0; j < igt_vrr_standard_video_timing_fps_count; j++) {
> +			if (!get_mode_with_video_timing(output,
> +							igt_vrr_standard_video_timing_fps[j],
> +							&mode))
> +				continue;
> +
> +			run_cmrr(data, crtc, output, &mode, CMRR_VIDEO_MODE);


No found = true logic here?

> +		}
> +	}
> +
> +	if (flags & TEST_CMRR_DESKTOP_MODE) {
> +		for (j = 0; j < connector->count_modes; j++) {
> +			mode = connector->modes[j];
> +			if (igt_vrr_mode_line_refresh_hz(&mode) - mode.vrefresh <= 0.04)
> +				continue;
> +
> +			found = true;
> +			run_cmrr(data, crtc, output, &mode, CMRR_DESKTOP_MODE);
> +		}
> +		igt_require_f(found, "No desktop mode found.\n");
> +	}
> +}
> +
>   /* Basic VRR flip functionality test - enable, measure, disable, measure */
>   static void
>   test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> @@ -591,6 +807,7 @@ test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   	uint64_t rate[] = {0};
>   
>   	prepare_test(data, output, crtc);
> +
>   	range = data->range;
>   	vtest_ns = data->vtest_ns;
>   	rate[0] = vtest_ns.rate_ns;
> @@ -1147,6 +1364,20 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   		}
>   	}
>   
> +	igt_subtest_group() {
> +		igt_fixture()
> +			igt_require_intel(data.drm_fd);
> +
> +		igt_describe("Test to validate CMRR in fixed mode.");

desktop mode.

> +		igt_subtest_with_dynamic("cmrr-desktop-mode") {
> +			run_vrr_test(&data, test_cmrr, TEST_CMRR_DESKTOP_MODE);
> +		}
> +
> +		igt_describe("Test to validate CMRR in video mode.");
> +		igt_subtest_with_dynamic("cmrr-video-mode") {
> +			run_vrr_test(&data, test_cmrr, TEST_CMRR_VIDEO_MODE);
> +		}
> +	}
>   	igt_fixture() {
>   		close(data.debugfs_fd);
>   		igt_display_fini(&data.display);

