Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DB41067042
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC8610EA35;
	Thu, 12 Mar 2026 15:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAwYefiA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B108E10EA35
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773328338; x=1804864338;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CKTYnU5+m7VkWRtxcTRzSWnqVhbwk+VY+vuJtbN12Ig=;
 b=dAwYefiANlg99Xx/StcgXVsf7RSnaXZxqkt3hZ3nJBSml4lrso9KPfDn
 qE3p9E8rKrM6VaEwfGkIWxbB///L+dEuGJmVpCD52jX8RPdCoHBePL4Zh
 pXsdiZBTaAGCoKiaUwd+Ko5vCtwwUIT0aPa8KKacOxg6oK8m4yrvU0aLC
 fGYyfiYIDPKfDCZyoSdo+ns+Ra4o/uZ/9p8846EvKQAY7oAmYvfBjKCxr
 84A4PMyrbvDEskoHvTWpgb3dk1XfvkfP3N5Vf75FEzOKaYR7L7wm0LjBX
 DsjjU8oblFRTeyDNhDHT24BnIgIU5gOQV76Pju1rBvlGMlxI2MBdIwMcW w==;
X-CSE-ConnectionGUID: hR5irkb1R5WIzoR3Nawnhg==
X-CSE-MsgGUID: T6hk2ILdQR6wJFu00vsOoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="77032065"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="77032065"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:12:18 -0700
X-CSE-ConnectionGUID: ZA4pDABQSFumH5gQ3M98dg==
X-CSE-MsgGUID: WBnpW4HnRP6bsVvl/oXycA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:12:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 08:12:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 08:12:17 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 08:12:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kp3UOk23gzfLmBHodCysCw8v31ojzSzFVQL+27LDInV+h4uhXrxQ/M2WeVmrVz7+TXavm/Jl7heBgJueBjlfLx6LolyshKRo4FYUTopbw02qk0FAWtgkdgzPSZdTAXNmZ6l1/u1YS97Q20+PdTcR87mLL59Ud1IY4cJnZMdj4JcvIBYKAO7kzFY8cRW/piqM2FFsdqMIojyOmseyiy+8WuriqS+PeMBtN7HcC2/9Z18efkQBQHhqCMqCaYMCFpdI8M+J1gPI3qc9/NEjMUA7YDrduwOHwvz0hgQyW/EBa/63fFm2DECUpxTkb38AtYRsDXJCf+j/jITwgxRk8Ygu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnlEtnW0G7xgdHg0sGl3H8OYgoQz+6gJnTLHHdYrHoY=;
 b=AYmtduZ+Q3NjXXDvLSdo0pldF1daOK17R7kNoIk+GPlbFV7A47LJFaI5Z+6yvcFnRdOpqeez7H8upUbn2cMs3i/EzriREOMXh24lbeqEI2Iymzwc8huUzNB1l+Y3RuTZsBOQi06Chnu0s75WkVODd+qq/FfJm4RlYM/K8qIj/wH+1c+ThaOiCOUnRdhOib8PATwpmvaKytUYTAbB2CcJrcEvfuhIIzIilFc0Bz9vdMRcCL435CJKmlMsqU3A9s3Qf5587CWya6pFun400tL0uQAX/IgnOx5FxiibtPuZmB0wr6M+IaH3/ub4959FC846BYATcMPySv2eekes9/OmJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by BN9PR11MB5257.namprd11.prod.outlook.com (2603:10b6:408:132::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Thu, 12 Mar
 2026 15:12:11 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 15:12:11 +0000
Message-ID: <dc8be78b-177c-43a3-967b-35154f94fed4@intel.com>
Date: Thu, 12 Mar 2026 20:42:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 i-g-t 2/2] tests/intel/xe_vm: Add support for
 overcommit tests
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>,
 <thomas.hellstrom@intel.com>
References: <20260311060843.2133964-1-sobin.thomas@intel.com>
 <20260311060843.2133964-3-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260311060843.2133964-3-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::9) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|BN9PR11MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe24175-9520-4c37-1a8c-08de8049bc16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: siCx52lvt1wE5yrFEeczzDgPu7FAsOGZ3wNmuwgw5rKOfchzdEjfBJIxQqC1nQon9cY4xX8pfjNVrZawRO/C88qNIQ0iPRsKOl7zNwNKJGe5DomORG4wZzfXud5xlbmmQOnF65+UhBVXIvuRHzJSyzBzb6nhzoOInq9guQjFgKQfR6II9gnxueiQFq9DKrIKpcOrch1XjKi19sub6g4vVefIdzvRZOvzXXeusO6Lchsw02WEBiELF7QYIWm0PVYJutqTbZRldoHFl9VrZXAWl1L3tzElo0Ryq+tHW88/AqQg/4sx0UFI2/AfZV4S105hZTx75mA/5l3+0Dj8H0i3R3eDirdz18l74+8uWR2XO99tfVaoVaLe01XiPjIia6Ae0gVLpKEY46ZI9/CK3weypXdpA0ZdTJw4/ksTVHBpAjUowz1bkt7c/opIq42Mt5Db2BU38+AdoOaeXhrI5UC6+eG8osnhVEs/A2gevu+uY0nwyapbGOzQS0AfzR+jmJSaHWKgQWXGDdgutFI5oEYO3FGNjv6bDGwXPRGrR1CoArtCIGhmM/dte1lkbqlfYE4mmW/+PdJJ5SZ5a91UFNRRut7phOxt/iVQpvhgqh7l4AF3hJpURhgW+0ImHR/IlSpviPkdIvlX7Mx4namdYz2dkLeWsXOT1/+aC68PBmcaHLzPTRPla/RIFL7t0WyjaArjzL9fi9ZVSvqdL4pr/wGekup+bPUzCSGV0GHbAN15sRk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm1pYmo1U0tsek9LazJTRCtXcnlsdkwzVHZ4dVk0Qzg0alo0YldNZHdzNk44?=
 =?utf-8?B?bWlvQy9ZY3RrbkhQdFdGeXhzdzFVRWNRbEtoblAvWlVWTmhid1RoYnhja08w?=
 =?utf-8?B?dzBpQXNqR2RRVW9EeGRGa2JQa2dIUVJBT2s5Vllsa240NVFWOEVGRkQ2akFn?=
 =?utf-8?B?Y0xEaElaSVFSTXYxcHQrOUY3c1BUa2xVbi9iUWZRK3lZTUdnMnZVLzZYNVRq?=
 =?utf-8?B?Sy8vR0hZRW1udTFBT2pNM0MwazVMcU5nQWV4b1ZxOHhiMVJMN1ZxQUoyZ0Rx?=
 =?utf-8?B?RzJteHU5NjlaV2YxZGY0bStxSDhmS1JJWUdJSm04NUF0T1JUd2xOUHNwT2tG?=
 =?utf-8?B?bWtaTzE2dkdMQmZMUmRybnRRZ1o0dlN2M284N0pkUzBFaTh1eHY5eEVGdTR0?=
 =?utf-8?B?RGZSajY0ZUtjWlV4MUpVQU13N0wvV2RwNG5QQjZoS3MxbVZXRUMwb29HODFP?=
 =?utf-8?B?OVptN0ZtbXRrK0FlcFFlSHovUUlEN2dDUkI2cDlSY2wvaHNOMFBIN1pZT29s?=
 =?utf-8?B?NmJNLzNZQTNteld5TEpXUVZsWU5uR2pNbVJXYTlycmhIeU5VRzV1cnc2Q2dG?=
 =?utf-8?B?YkEydlFKLzhNOGJyeTlQMGdvL2U3Y2dEcTVRYkUrR1FlSEpZNzN3TUFWY2M2?=
 =?utf-8?B?QjV5aWJmZjY3TEhJS1JsYUs0d3ZwbTNYUWNRTER3dXdTemM4SkNvQ05FU1Ir?=
 =?utf-8?B?dmV5SnI2d0tJMEFlei9vcDk5bFYwYmtHVUc2ZklMOUJacU83ZzdTMndFY3Y2?=
 =?utf-8?B?L25MR0hPRGhIS3VmNk4xendtMGpYbkFsVTlNQXJjVVlMRWNtcnZ4L2pEOEtV?=
 =?utf-8?B?SUVFeXV0TkdzR21uNkxjeENvam8raklYNGpFUU1LRXdsNWxOU28vWG9uMGFq?=
 =?utf-8?B?bWIvTkVTY2Z3YnA3ZGM1d2RCZHlMQW5Cck8yUTVIYmpZbjJoSS9BQ1Bva212?=
 =?utf-8?B?QjZlekpmN0ZYN2VWVkFJc2t1UXROVlI1N3BicHNDSlpqRlNCQVh4cXoyckE4?=
 =?utf-8?B?WUN2TSs2OUFKdmp4M2F2Z2pDSDJxazdhTm9NQkNoZDVNUldMZW9xdUlPaU04?=
 =?utf-8?B?NDFwTUMyU2l5YzRpVmNxUkRwS1E0V0UrTWxoVytKZjZzOCs3b1FKV1VEczN3?=
 =?utf-8?B?RjcyOWx1S21zS3JCTTFkRTNFRkVFUXMvbVVxRzFHUWY5dTNmU2w5ZWRCU3BR?=
 =?utf-8?B?UGZjeGp4ZFd0eWNRSlEyaDUydEtWalpyaERpeGYxbm1Qd2FORW9nNUhVL25M?=
 =?utf-8?B?Zm9Ec0c4NCtKbkI5TmZKZk93OUxYWG5uNWtUQnI5LzRmWnlMY25Yc20ycG5F?=
 =?utf-8?B?NVBnNXVQWnIwNFBYQWl3ZkhTbzhnM2NqUHI4NW1LRTF2V1FnYy9CV3F2ZFBT?=
 =?utf-8?B?UXVrLzcyNDdBUUxFeElnaWw5REVYdlpRRGE4dEhrMW5HZzZkdlk4L24rMEcw?=
 =?utf-8?B?YU5JSHNWb2QwWjR1WTZpMjkxT0xLYnFWeWQwRUIzQnlzemVZNXRsRzV6ZVBn?=
 =?utf-8?B?SkxDc25EYUU4KzVoWjB5Q0o2a3Z1emdtNk1BRUJKaGRaNFdXbTgzejdmY0RV?=
 =?utf-8?B?TmNML0NsZWlQQVFzRmF2Y3FXVk83ZE1TUkNMeVVOS25FWEloVUFpcDQxeVJR?=
 =?utf-8?B?VXZaVXFzQTdZZGdEUTZPbEhXNVVSR0tuY0ZDVlBOdERDS21tbnhTeEszSjN4?=
 =?utf-8?B?alpRajdpM3J5b0VNamw0SjUyclFKVmtmZ25TU2p0clovTGFjdHN6NnFHOURr?=
 =?utf-8?B?dG9iVGFzVFFFRmxvdHNTTmJyL2xQRmRuM2NpVzcxQUdXaDM3ek1jb0VqTEh5?=
 =?utf-8?B?UmNCWDlZTk82L21iczZsTDIwV1FlS3dHVVVBYWtmUE8rM0FtaWEzcU1aeC9Z?=
 =?utf-8?B?Y3Brbi83OW1qazFEL3NPTUNacHA5UTgrRzYrcDM1elFoaWM1bzRhR093S0pi?=
 =?utf-8?B?c05wNnNzK0tObzlDUkgyRzFTVW55cGVhUkxsY2pwQ2FlcFdxclhrSXFwNThx?=
 =?utf-8?B?NkM3OW5KOVYyaWtRVndRTEg4WVpLcWlhdTZMaHpYNVJiaDFMQVhZd0dpaEh2?=
 =?utf-8?B?dEFPVlNHMU8xQWVWM1Y2eDV3UWlBMjZGczRTcDFxdlVwQUt5eWJJRXRVS2Jh?=
 =?utf-8?B?UzBCb1dZNlpYcm80ZENleTd2amxQOVl5UGdWV3VRQVZCSW9FOTgxNncyWVYy?=
 =?utf-8?B?K01EeGcxYUdvVXpaYVVSanhSZEdmdURkOFVBclNvVlN1OHhuaHYvZzBJTVlC?=
 =?utf-8?B?ZnpsSHE2djFhQ0lldzJpMFM2aGpNMCtkYVNFTFVFczlmU2h1VDJvckJCSEh4?=
 =?utf-8?B?R2Vxc3hWTnNIQWQ2Zlo1Tldmbmp4NTdaRmw2ci9KS1RkVXlpUGlXZXpIaG9x?=
 =?utf-8?Q?TrRgYU88kyW+STHc=3D?=
X-Exchange-RoutingPolicyChecked: cQluM0dab0G80BAUgOo7qA2MR/m/Ax7CmrgeMCvIaCJ09b1hIXi8yFELn7SSriE9u9L5lsCZa2jk3b76AzXVBiwdJKI14GZ2JZQ0o6e5apG9O+vW99+veRQl1fRDRyzmCJRsfv/T5B6Wvk5UzEpnVXw3e+kom5Kxz4JiuiW79Oz1/B2yNWGkkN1sSzoqMlfUgeriJgZ9G/10L1yXdoVanhCEO7683PYGMtRBxviMVdZGJa/LdqyX4m67EA2+1mOhTDkevrSTZxFCGhIvb1zLlUgPAnn1FXlIgfctkKJLn9hZT9HX0wMEvm5n8IqfMblSxzyd9i/yrJlRMUb33htPNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe24175-9520-4c37-1a8c-08de8049bc16
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 15:12:11.3685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WS1waGOhiQ7wzYw2Wx1cgrIB6r92DBizKMlwyedwRprRPTlyeVCbHj4eEuI6vtT4OvNShwTrWQgoqvFkHL3L7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5257
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


On 3/11/2026 11:38 AM, Sobin Thomas wrote:
> Current tests focus on VM creation with basic mode selection and do not
> support overcommit scenarios.
>
> This change adds tests to verify overcommit behavior across different VM
> modes.
>
> Non-fault mode tests:
>   - vram-lr-defer: DEFER_BACKING rejects overcommit at bind time
>   - vram-lr-external-nodefer: Long-running mode with external BO and
>                               no defer backing
>   - vram-no-lr: Non-LR mode
>
> Fault mode tests:
>   - vram-lr-fault: Fault handling allows graceful overcommit via page
>     faults
>   - vram-lr-fault-no-overcommit: Verifies NO_VM_OVERCOMMIT blocks same-VM
>     BO eviction during VM_BIND while still allowing eviction during
>     pagefault OOM
>
> These tests validate that VMs handle memory pressure appropriately based
> on their configuration—rejecting at bind, failing at exec, or handling
> it gracefully via page faults.
>
> v2 - Added Additional test cases for LR mode and No Overcommit.
>
> v3 - Refactored into single api call  based on the VM / BO Flags.
>
> v4 - Addressed review comments (reset sync objects and nits).
>       Added check in cleanup
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_vm.c | 483 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 482 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index ccff8f804..c02bb6945 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -20,6 +20,7 @@
>   #include "xe/xe_query.h"
>   #include "xe/xe_spin.h"
>   #include <string.h>
> +#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
>   
>   static uint32_t
>   addr_low(uint64_t addr)
> @@ -2376,6 +2377,475 @@ static void invalid_vm_id(int fd)
>   	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, ENOENT);
>   }
>   
> +static int wait_fault(int fd, uint32_t exec_queue, void *sync_data,
> +		      int64_t *timeout)
> +{
> +	int64_t wait_ns = timeout ? *timeout : INT64_MAX;
> +
> +	return __xe_wait_ufence(fd, (uint64_t *)sync_data, USER_FENCE_VALUE, exec_queue, &wait_ns);
> +}
> +
> +static int wait_nonfault(int fd, uint32_t exec_queue, void *sync_data,
> +			 int64_t *timeout)
> +{
> +	int64_t wait_ns = timeout ? *timeout : INT64_MAX;
> +
> +	if (!syncobj_wait(fd, (uint32_t *)sync_data, 1, wait_ns, 0,
> +			  NULL))
> +		return -1;
> +
> +	return 0;
> +}
> +
> +static int vm_overcommit_create_bo(int fd, uint32_t vm, size_t bo_size,
> +				   uint32_t bo_flags, uint16_t gt_id,
> +				   bool external, uint32_t *bo)
> +{
> +	uint32_t placement;
> +	int ret;
> +
> +	/* Try VRAM first */
> +	placement = vram_memory(fd, gt_id) ?: system_memory(fd);
> +	igt_debug("Using VRAM placement: 0x%x\n", placement);
if VRAM not available still this igt_debug shows VRAM
> +
> +	ret = __xe_bo_create(fd, external ? 0 : vm, bo_size, placement,
> +			     bo_flags, NULL, bo);
> +	if (ret) {
> +		igt_info("VRAM allocation failed, falling back to system memory\n");
> +		placement = system_memory(fd);
> +		igt_assert_f(placement != 0, "Invalid placement: system_memory(fd) returned 0\n");
> +		ret = __xe_bo_create(fd, external ? 0 : vm, bo_size, placement,
> +				     bo_flags, NULL, bo);
Why in failure case __xe_bo_create() is called again? This is called 
after igt_assert() which will dead code as control will not reach after 
test is asserted.
> On what condition or error placement = system_memory() chosen? ret should be checked for error number __xo_bo_create() can fail with number of reasons but if decision has to be made

like placement should be system_memory() then explicitly call out. 
Placement was defined before vm_overcommit_create_bo() call, that can be 
directly passed as one of the arguments. For debug/info purpose

you can print placement location (VRAM/SRAM)

You can change the name of this function as nothing related to 
overcommit being done in this. It's simple bo creation


> +	}
> +	return ret;
> +}
> +
> +/**
> + * SUBTEST: overcommit-fault-%s
> + * Description: Test VM overcommit behavior in fault mode with %arg[1] configuration
> + * Functionality: overcommit
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @vram-lr-fault:VRAM with LR and fault mode, expects exec to pass
> + * @vram-lr-fault-no-overcommit:VRAM with LR, fault and NO_VM_OVERCOMMIT, expects bind rejection
> + */
> +
> +/**
> + * SUBTEST: overcommit-nonfault-%s
> + * Description: Test VM overcommit behavior in nonfault mode with %arg[1] configuration
> + * Functionality: overcommit
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @vram-lr-defer:VRAM with LR and defer backing, expects bind rejection
> + * @vram-lr-external-nodefer:VRAM with LR and external BO without defer, expects exec fail
> + * @vram-no-lr:VRAM without LR mode, expects exec to fail
> + */
> +struct vm_overcommit_case {
> +	const char *name;
> +	uint32_t vm_flags;
> +	uint32_t bo_flags;
> +	bool use_vram;
> +	bool external;
> +	uint64_t data_addr;
> +	uint32_t pat_index;
> +	int overcommit_mult;
> +};
> +
> +static const struct vm_overcommit_case overcommit_cases[] = {
> +	/* Case 1: DEFER_BACKING */
> +	{
> +		.name = "vram-lr-defer",
> +		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
> +		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
> +			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +		.external = false,
> +		.use_vram = true,
> +		.data_addr = 0x1a0000,
> +		.pat_index = DEFAULT_PAT_INDEX,
> +		.overcommit_mult = 2,
> +	},
> +	/* Case 1b: External BO without defer backing */
> +	{
> +		.name = "vram-lr-external-nodefer",
> +		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
> +		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +		.external = true,
> +		.use_vram = true,
> +		.data_addr = 0x1a0000,
> +		.pat_index = DEFAULT_PAT_INDEX,
> +		.overcommit_mult = 2,
> +	},
> +	/* Case 2: LR + FAULT - should not fail on exec */
> +	{
> +		.name = "vram-lr-fault",
> +		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> +		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +		.external = false,
> +		.use_vram = true,
> +		.data_addr = 0x300000000,
> +		.pat_index = 0,
> +		.overcommit_mult = 2,
> +	},
> +	/* Case 3: !LR - overcommit should fail on exec */
> +	{
> +		.name = "vram-no-lr",
> +		.vm_flags = 0,
> +		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +		.external = false,
> +		.use_vram = true,
> +		.data_addr = 0x300000000,
> +		.pat_index = 0,
> +		.overcommit_mult = 2,
> +	},
> +	/* Case 4: LR + FAULT + NO_VM_OVERCOMMIT */
> +	{
> +		.name = "vram-lr-fault-no-overcommit",
> +		.vm_flags = DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT | DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> +		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
> +			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +		.external = false,
> +		.use_vram = true,
> +		.data_addr = 0x300000000,
> +		.pat_index = 0,
> +		.overcommit_mult = 2,
> +	},
> +	{ }
> +};
> +
> +static void
> +test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
> +		   const struct vm_overcommit_case *c,
> +		   uint64_t system_size, uint64_t vram_size)
> +{
> +	size_t sync_size;
> +	size_t nf_bo_size = 64 * 1024 * 1024;  // 64MB per BO
> +	uint64_t overcommit_size, off, bind_exec_queue, data_addr;
> +	uint32_t vm = 0, *bos, batch_bo = 0, exec_queue = 0, placement = 0;
> +	uint64_t sync_addr = 0x101a0000, batch_addr = 0x200000000;
> +	uint64_t stride = 1024 * 1024, lr_vm_sync = 0, base_size;
> +	int64_t timeout = 20 * NSEC_PER_SEC, ret;
> +	int i, b, create_ret, bind_err, res, num_bos;
> +	bool overcommit_detected = false;
> +	bool is_fault_mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) != 0;
> +	bool is_lr_mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) != 0;
> +	struct drm_xe_sync bind_sync[1] = {
> +		{
> +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value = USER_FENCE_VALUE
> +		},
> +	};
> +	struct drm_xe_sync lr_sync[1] = {
> +		{
> +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value = USER_FENCE_VALUE,
> +			.addr = to_user_pointer(&lr_vm_sync),
> +		},
> +	};
> +
> +	/* For fault mode: user fence, for non-fault mode: syncobj */
> +	struct drm_xe_sync exec_sync[1] = {
> +		{
> +			.type = (is_fault_mode || is_lr_mode) ?
> +				DRM_XE_SYNC_TYPE_USER_FENCE : DRM_XE_SYNC_TYPE_SYNCOBJ,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value = (is_fault_mode || is_lr_mode) ? USER_FENCE_VALUE : 0,
> +			.handle = 0,
> +		},
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(exec_sync),
> +	};
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +		uint64_t vm_sync;
> +	} *batch_data;
> +	uint64_t *user_fence_sync = NULL;
> +
> +	data_addr = c->data_addr;
> +
> +	base_size = c->use_vram ? vram_size : system_size;
> +	overcommit_size = (uint64_t)(base_size * c->overcommit_mult);
> +	overcommit_size = ALIGN(overcommit_size, 4096);
> +	if (overcommit_size > base_size) {
> +		igt_debug("Limiting overcommit size from %llu MB to %llu MB\n",
> +			  (unsigned long long)(overcommit_size >> 20),
> +			  (unsigned long long)(system_size >> 20));
> +		overcommit_size = ALIGN(system_size, 4096);
> +	}
As per this logic only SRAM is considered and SRAM will be used throughout
> +
> +	num_bos = (overcommit_size / nf_bo_size) + 1;
> +	bos = calloc(num_bos, sizeof(*bos));
> +	igt_assert(bos);
> +
> +	igt_debug("Overcommit test: allocating %d BOs of %llu MB each",
> +		  num_bos, (unsigned long long)(nf_bo_size >> 20));
> +	igt_debug(" total=%llu MB, vram=%llu MB\n",
> +		  (unsigned long long)(num_bos * nf_bo_size >> 20),
> +		  (unsigned long long)(vram_size >> 20));
> +	/* Create VM with appropriate flags */
> +	vm = xe_vm_create(fd, c->vm_flags, 0);
> +	igt_assert(vm);
> +	bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0);
> +	placement = c->use_vram ? vram_memory(fd, eci->gt_id) : system_memory(fd);
> +	/* For fault mode: create user fence sync area */
> +	if (is_fault_mode) {
> +		sync_size = sizeof(uint64_t) * num_bos;
> +		sync_size = xe_bb_size(fd, sync_size);
> +		user_fence_sync = mmap(NULL, sync_size, PROT_READ | PROT_WRITE,
> +				       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +		igt_assert(user_fence_sync != MAP_FAILED);
> +		memset(user_fence_sync, 0, sync_size);
> +	}
> +	/* Create and bind BOs */
> +	for (i = 0; i < num_bos; i++) {
> +		struct {
> +			uint64_t vm_sync;
> +		} *data;
> +
> +	/* Create BO using the case's create function */
> +		create_ret = __xe_bo_create(fd, vm, nf_bo_size, placement,
> +					    c->bo_flags, NULL, &bos[i]);
> +
> +		if (create_ret) {
> +			overcommit_detected = true;
> +			num_bos = i;
> +			igt_debug("BO create failed at %d/%d with error %d (%s)\n",
> +				  i, num_bos, -create_ret, strerror(-create_ret));
> +			igt_assert_f(create_ret == -ENOMEM || create_ret == -ENOSPC ||
> +				     create_ret == -E2BIG || create_ret == -EPERM,
> +				     "Unexpected error %d (%s)\n",
> +				     -create_ret, strerror(-create_ret));
> +			break;

This break is dead code here, once assert happens test execution will be 
halted and control doesn't come at break.

Shouldn't free resources before igt_assert_f()?  you are setting 
overcommit_detected flag as true if some error happens in 
__xo_bo_create() irrespective error should be

ENOMEM,/EPERM/ENOSPC/E2BIG. overcommit_detected should be true if driver 
returns error related to overcommit and then continue

Overcommit error return should be handled in case of non-fault mode but 
above implementation will be called for DRM_XE_VM_CREATE_FLAG_FAULT_MODE

> +		}
> +
> +		/* Map and bind BO */
> +		data = xe_bo_map(fd, bos[i], nf_bo_size);
> +		igt_assert(data);
> +		memset(data, 0, nf_bo_size);
> +		bind_sync[0].addr = to_user_pointer(&data->vm_sync);
> +
> +		bind_err = __xe_vm_bind(fd, vm, bind_exec_queue, bos[i], 0,
> +					data_addr + (i * nf_bo_size), nf_bo_size,
> +					DRM_XE_VM_BIND_OP_MAP, 0, bind_sync, 1, 0,
> +					c->pat_index, 0);
> +
> +		if (bind_err) {
> +			munmap(data, nf_bo_size);
> +			gem_close(fd, bos[i]);
> +			bos[i] = 0;
> +			overcommit_detected = true;
> +			num_bos = i;
> +			igt_debug("Bind failed at %d/%d with error %d (%s)\n",
> +				  i, num_bos, -bind_err, strerror(-bind_err));
> +			igt_assert_f(bind_err == -ENOMEM || bind_err == -ENOSPC ||
> +				     bind_err == -EPERM,
> +				     "Unexpected bind error %d (%s)\n",
> +				     -bind_err, strerror(-bind_err));

same as above. set overcommit_detected = true if overcommit related 
error/s returned from driver.

error handling should be done for non-fault mode

> +			break;
> +		}
> +		if (data->vm_sync != USER_FENCE_VALUE)
> +			xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE,
> +				       bind_exec_queue, 20 * NSEC_PER_SEC);
> +		data->vm_sync = 0;
> +		munmap(data, nf_bo_size);
> +
> +		igt_debug("Created and bound BO %d/%d at 0x%llx\n",
> +			  i + 1, num_bos,
> +			  (unsigned long long)(data_addr + (i * nf_bo_size)));
> +	}
> +	if (overcommit_detected) {
> +		igt_debug("Overcommit correctly rejected at BO creation/bind (created %d BOs)\n",
> +			  num_bos);
> +		goto cleanup;
> +	}
> +
> +	 /* Create batch buffer */
> +	ret = vm_overcommit_create_bo(fd, vm, 0x1000, 0, eci->gt_id, c->external, &batch_bo);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_debug("Mapping the created BO");
> +	batch_data = xe_bo_map(fd, batch_bo, 0x1000);
> +	igt_assert(batch_data);
> +	memset(batch_data, 0, 0x1000);
> +
> +	/* Bind batch buffer and sync areas */
> +	if (is_fault_mode) {
> +		batch_data[0].vm_sync = 0;
> +		bind_sync[0].addr = to_user_pointer(&batch_data[0].vm_sync);
> +
> +		xe_vm_bind_userptr_async(fd, vm, bind_exec_queue, to_user_pointer(user_fence_sync),
> +					 sync_addr, sync_size, bind_sync, 1);
> +		if (batch_data[0].vm_sync != USER_FENCE_VALUE)
> +			xe_wait_ufence(fd, &batch_data[0].vm_sync, USER_FENCE_VALUE,
> +				       bind_exec_queue, NSEC_PER_SEC);
> +
> +		batch_data[0].vm_sync = 0;
> +
> +		xe_vm_bind_async(fd, vm, bind_exec_queue, batch_bo, 0, batch_addr, 0x1000,
> +				 bind_sync, 1);
> +		if (batch_data[0].vm_sync != USER_FENCE_VALUE)
> +			xe_wait_ufence(fd, &batch_data[0].vm_sync, USER_FENCE_VALUE,
> +				       bind_exec_queue, NSEC_PER_SEC);
> +	} else if (is_lr_mode) {
> +		/* LR mode without fault - bind batch using user fence */
> +		lr_vm_sync = 0;  /* Reset before use */
> +		lr_sync[0].addr = to_user_pointer(&lr_vm_sync);
> +		bind_err = __xe_vm_bind(fd, vm, 0, batch_bo, 0, batch_addr, 0x1000,
> +					DRM_XE_VM_BIND_OP_MAP, 0, lr_sync, 1, 0, c->pat_index, 0);
> +		if (bind_err) {
> +			igt_debug("Batch buffer bind failed with error %d (%s) - skipping GPU test\n",
> +				  -bind_err, strerror(-bind_err));
> +			goto cleanup;
> +		}
> +		xe_wait_ufence(fd, &lr_vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +		lr_vm_sync = 0;
> +	} else {
> +		igt_debug("Going for vm bind sync");
> +		xe_vm_bind_sync(fd, vm, batch_bo, 0, batch_addr, 0x1000);
> +	}
All vm_bind() calls used calls __xe_vm_bind. Instead calling directly 
__xe_vm_bind, wrappers are provided. Use that Wrapper depending upon the 
condition is_fault_mode/is_lr_mode
> +
> +	igt_debug("VM binds done - batch_bo at 0x%llx\n", (unsigned long long)batch_addr);
> +	/* Create exec queue */
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +
> +	/* Setup sync for exec */
> +	if (is_fault_mode) {
> +		exec_sync[0].addr = sync_addr;
> +	} else if (is_lr_mode) {
> +		/* LR mode - use batch_data->vm_sync (GPU accessible memory) */
> +		batch_data->vm_sync = 0;
> +		exec_sync[0].addr = to_user_pointer(&batch_data->vm_sync);
> +	} else {
> +		exec_sync[0].handle = syncobj_create(fd, 0);
> +	}
> +
> +	/* Use GPU to write to each BO */
> +	for (i = 0; i < num_bos; i++) {
> +		igt_debug("Writing to BO %d/%d via GPU\n", i + 1, num_bos);
> +
> +		for (off = 0; off < nf_bo_size; off += stride) {
> +			uint64_t target_addr = data_addr + (i * nf_bo_size) + off;
> +
> +			b = 0;
> +			batch_data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +			batch_data->batch[b++] = target_addr & 0xFFFFFFFF;
> +			batch_data->batch[b++] = (target_addr >> 32) & 0xFFFFFFFF;
> +			batch_data->batch[b++] = 0xBB;
> +			batch_data->batch[b++] = MI_BATCH_BUFFER_END;
> +
> +			/* Reset sync for next exec */
> +			if (!is_fault_mode && !is_lr_mode) {
> +				if (off != 0 || i != 0) {
> +					igt_assert(syncobj_wait(fd, &exec_sync[0].handle,
> +								1, INT64_MAX, 0, NULL));
> +				}
> +				syncobj_reset(fd, &exec_sync[0].handle, 1);
> +			}
> +
> +			/* Submit batch */
> +			exec.exec_queue_id = exec_queue;
> +			exec.address = batch_addr;
> +
> +			res = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
> +			if (res != 0) {
> +				if (errno == ENOMEM || errno == ENOSPC) {
> +					igt_debug("Expected fault/error: %d (%s)\n",
> +						  errno, strerror(errno));
> +					goto cleanup;
> +				}
> +				igt_assert_f(0, "Unexpected exec error: %d\n", errno);
> +			}
> +
> +			/* Wait for completion using appropriate method */
> +			if (is_fault_mode) {
> +				ret =  wait_fault(fd, exec_queue, &user_fence_sync[0], &timeout);
> +				user_fence_sync[0] = 0;
> +			} else if (is_lr_mode) {
> +				timeout = 5 * NSEC_PER_SEC;
> +				ret = __xe_wait_ufence(fd, &batch_data->vm_sync, USER_FENCE_VALUE,
> +						       exec_queue, &timeout);
> +				batch_data->vm_sync = 0;
> +
> +			} else {
> +				ret = wait_nonfault(fd, exec_queue, &exec_sync[0].handle, &timeout);
> +			}

For above wait_fault(), __xe_wait_fence(), wait_nonfault() you can make 
more readable code calling single function for all 3 case as

enum wait_mode { --> Define globally
     WAIT_FAULT,
     WAIT_LR,
     WAIT_NONFAULT
};

if (is_fault_mode) {
     ret = wait_sync(WAIT_FAULT, fd, exec_queue, &user_fence_sync[0], 
&timeout);
     user_fence_sync[0] = 0;
} else if (is_lr_mode) {
     timeout = 5 * NSEC_PER_SEC;
     ret = wait_sync(WAIT_LR, fd, exec_queue, &batch_data->vm_sync, 
&timeout);
     batch_data->vm_sync = 0;
} else {
     ret = wait_sync(WAIT_NONFAULT, fd, exec_queue, 
&exec_sync[0].handle, &timeout);
}

static int wait_sync(enum wait_mode mode, int fd, uint32_t exec_queue, 
void *sync_data, int64_t *timeout)
{
     int64_t wait_ns = timeout ? *timeout : INT64_MAX;

     if (mode == WAIT_FAULT || mode == WAIT_LR) {
         // For both fault and LR mode, use user fence wait
         return __xe_wait_ufence(fd, (uint64_t *)sync_data, 
USER_FENCE_VALUE, exec_queue, &wait_ns);
     } else if (mode == WAIT_NONFAULT) {
         // For non-fault mode, use syncobj wait
         if (!syncobj_wait(fd, (uint32_t *)sync_data, 1, wait_ns, 0, NULL))
             return -1;
         return 0;
     }
     return -1; // Invalid mode
}

Try

> +
> +			if (ret != 0) {
> +				igt_debug("Batch wait failed at BO %d offset 0x%lx\n",
> +					  i, off);
> +				goto cleanup;
> +			}
> +		}
> +
> +		igt_debug("Accessed BO %d/%d via GPU\n", i + 1, num_bos);
> +	}
> +
> +	igt_debug("All batches completed successfully\n");
> +	/* Verify GPU writes */
> +	igt_debug("Verifying GPU writes to BOs...\n");
> +	for (i = 0; i < num_bos; i++) {
> +		uint32_t *verify_data;
> +		int errors = 0;
> +
> +		verify_data = xe_bo_map(fd, bos[i], nf_bo_size);
> +		igt_assert(verify_data);
> +
> +		for (off = 0; off < nf_bo_size; off += stride) {
> +			uint32_t expected = 0xBB;
> +			uint32_t actual = *(uint32_t *)((char *)verify_data + off);
> +
> +			if (actual != expected) {
> +				if (errors < 5)
> +					igt_debug("Mismatch at BO %d offset 0x%llx",
> +						  i, (unsigned long long)off);
> +				errors++;
> +			}
> +		}
> +
> +		munmap(verify_data, nf_bo_size);
> +		igt_assert_f(errors == 0, "Data verification failed for BO %d with %d errors\n",
> +			     i, errors);
> +	}
> +
> +cleanup:
> +	/* Cleanup */
> +	if (!is_fault_mode && !is_lr_mode && exec_sync[0].handle)
> +		syncobj_destroy(fd, exec_sync[0].handle);
> +	if (exec_queue)
> +		xe_exec_queue_destroy(fd, exec_queue);
> +	if (bind_exec_queue)
> +		xe_exec_queue_destroy(fd, bind_exec_queue);
> +	if (batch_data)
> +		munmap(batch_data, 0x1000);
> +	if (batch_bo)
> +		gem_close(fd, batch_bo);
> +
> +	if (is_fault_mode && user_fence_sync)
user_fence_sync handled above during mmap when is_fault_mode = 1, so you 
can avoid using it here in &&
> +		munmap(user_fence_sync, sync_size);
> +
> +	if (bos) {
> +		for (i = 0; i < num_bos; i++) {
> +			if (bos[i])
> +				gem_close(fd, bos[i]);
> +		}
> +		free(bos);
> +	}
> +	if (vm > 0)
> +		xe_vm_destroy(fd, vm);
> +}
> +
>   /**
>    * SUBTEST: out-of-memory
>    * Description: Test if vm_bind ioctl results in oom
> @@ -2385,7 +2855,6 @@ static void invalid_vm_id(int fd)
>    */
>   static void test_oom(int fd)
>   {
> -#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
>   #define BO_SIZE xe_bb_size(fd, SZ_512M)
>   #define MAX_BUFS ((int)(xe_visible_vram_size(fd, 0) / BO_SIZE))
>   	uint64_t addr = 0x1a0000;
> @@ -2850,6 +3319,18 @@ int igt_main()
>   		test_oom(fd);
>   	}
>   
> +	for (int i = 0; overcommit_cases[i].name; i++) {
> +		const struct vm_overcommit_case *c = &overcommit_cases[i];
> +		const char *mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) ?
> +					"fault" : "nonfault";
> +		igt_subtest_f("overcommit-%s-%s", mode, c->name) {
> +			igt_require(xe_has_vram(fd));
> +			igt_assert(xe_visible_vram_size(fd, 0));
what's the point of using assert on xe_visible_vram_size()? This API 
gives CPU visible VRAM size on GPU.
> +			test_vm_overcommit(fd, hwe, c, (igt_get_avail_ram_mb() << 20),
> +					   xe_visible_vram_size(fd, 0));
> +		}
> +	}
> +
>   	igt_fixture()
>   		drm_close_driver(fd);
>   }
