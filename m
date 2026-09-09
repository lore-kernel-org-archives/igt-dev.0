Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6919DC79F8C
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 10:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BB810F0A1;
	Wed,  9 Sep 2026 10:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUNLitpH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C1C10F09D
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 10:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788949717; x=1820485717;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=P2nKCk83kwNWvM+pFHaVc0zLyBdQuNFdiWZ1xrp1fcs=;
 b=mUNLitpHknO2RK32CEae0Wd03MabcHvy6IsYAgKpjzcRLVs4DXzQl5T0
 Ka2zcOZTLRVfgzgxC+/UjRBO0ODWws4/umAa1lRjSUkJjdqsuN2nRF44t
 qLkS5bewquQnJORkQzhVKsN/sbbFkvvfw/7B5ZaVl4ahGtgJzAz8A3esF
 0ez9Ne8v1GdG9IpJ/ClTBgdMlh4Itpul4Z/QP7wMDjTBNsuDr7fpJUs6p
 k+XsUNEGLCJ7Ew6X38PNBXUEp9u+lRjVRHRJJc3glJ27zLcuxgkQTFTUe
 4GGj5exISc2u4jbnKZo+CgyGijXpznuM0Wpj4+wbTWQLDZeIo8q/53zvT A==;
X-CSE-ConnectionGUID: igymJxVRTx2Iam3x1uHLHQ==
X-CSE-MsgGUID: N7odt+4jR8WnnJRyeF8Dtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89401507"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89401507"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 03:28:37 -0700
X-CSE-ConnectionGUID: zyIBoDDVS3+gjdKoR0tSrw==
X-CSE-MsgGUID: syeK3zVJSEqEWw3Vwmykxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="301161532"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 03:28:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:28:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 03:28:36 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:28:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+0uiNxBYv/F26Mo9i0QMFOPomW2JqOZV+hlmdA/nL2w3LbPCaQ4hkv/+Ur54AS22uMEnffXoriOLOFFORycYU7alC0KZVG+G1Bckk2A4EXgk6pRY3dr0HkxtUxo3H9O6l++Wz7N4tQ6LdIShBn8AFlK/V4L5KeTYUy8JwmEz7jfIid5ZvfgHEhiAal/YketBgCVMSzk4a8pqnu5ku7A2vXXtpXE4x2NfTdgHidJE/Bj+WW0hAv/55ZEILEDVajSozcU0v8+oqJ1BF7kVDtfAmrWqu1vZR3p0+5UacfYcfJ48REGmagY29E605E7L52v9/FShRxHZTK3GXhjbKj2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdrmZORCAOOi1AMxr+vmzELDKkdB++d2oMK9hkn+Iuw=;
 b=UvWZrFotn6yTbslIsF3Yl3fF1GgPgPUSz4CZpOBGRXwiUtURM8gIKCo2xtHf5pH7GjlMD59+OykFBPqF2vlscr2fN9ti/2zUswT8pvVHxiQ69AyNBBTNhSFRDQaVHOE8Einjug9aPDa/slz5J7yb3DZ++Oy5/THF1g5oSCTl/RACJIJp80SrorUHOnu8G5YDeWaa50KpSMvnLHZ1bkngil6Okat00WA7DqItQoG69cyaqzn4tKngQ10ZyZAfgJ/xmz9wfgx69Lj3VDojJJ8joJBCHILjGI+J57oNIHegG+dK5zzRnxNw0DdqxEUy2lQaS+aeC9oju21a6AOuXIM4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA1PR11MB9828.namprd11.prod.outlook.com (2603:10b6:806:4d9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:28:30 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 10:28:29 +0000
Message-ID: <4ab5d9c5-421c-4cc6-8fcb-15977c078922@intel.com>
Date: Wed, 9 Sep 2026 15:58:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v5 3/7] tests/kms_colorop_helper: Add Fixed Matrix
 enum names table
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260831192935.463134-1-swati2.sharma@intel.com>
 <20260831192935.463134-4-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260831192935.463134-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::11) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA1PR11MB9828:EE_
X-MS-Office365-Filtering-Correlation-Id: fada76b6-cb9b-4f39-69ce-08df0e5d1746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|6133799003|11063799006|56012099006|3023799007|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: Pwei3ipKkj53Dv4ttXlO5ZkqpCq5TH3uFHvZT4jGTcUDIfJw1XbcJE3oEyYWA4I/nNgeBhYnovtZIEOD+o/SFijDjRp2Z5p97ODj6gCgHWbYg+4deJF8Stdwefv3NK687vZUYSyowMW0WpkzQ+O7iybqg2FBpCqD87AYaiyK+8hCgp0+TfAYy4As3AfxNqVyBJZKdWZ9IvR+f6CAhLmiJdpvKs5TLfvHsPvBeF0iT3A1y4qwahim/paUD3XT833R3YqI6K3gImW3MVzcqaeoeJG9HCBS5mOlwZCeCdQBGMSda7qIatMpYzWnk3frZuSGr7DSJL6VO8R0qYWGMlSndIpl/Y8lrJcMDgPy2XDk92R1/yXlXgUW/Wl2BpQmbaCTRD4CRARqKVgwdd6HZnMBcD/lDFGbGHMwe0NAlmqFO8IvWwkEHlIgEyyvWbsWqplaj/NZIce3i548Cx/TUrgu0fKTHHKRDiEOZDQBnfkKrOzBXrEIo4Ic19qJQQIrUbvkOLX1+mhq+Gh4LYnCJsC0ZHE1E1qGQhzQPmwAaW/R9yi7wHDCjfREdw4TOZry1bnUwoyg6UsTmr+eU1HCv5bKDS3gWgxe1FFE3FuGs21wRkiB/FEh7BmhMISLqANaaKOgWHRjT/MoRkJnbIhO89PC/8bDU2UFMsiPMvyd3EyICiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(3023799007)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkMxdlZ4K3VZOFl3elo0N2k2azg2WFRqNkNpcUY4cHpsai8wL2IyNjhZcDRz?=
 =?utf-8?B?L1Zhd3N2clMrUEYrSDgyMHdQQ1pvUnRDM2JWbVh4emRnK1QzWlJodjNGNTN1?=
 =?utf-8?B?K1I3K3BKZkxGeWF6YzVvTWhJNzR6Z0ZwZjhLMHpNWjBoOC9MRW5tWTd3a1o0?=
 =?utf-8?B?Q3FmdlFyNzNuaENIU2tRTktnNFVYQkxuQnQ1TVpWMG1EdGZpQnNTSkJzL2N0?=
 =?utf-8?B?SG1Pa0VKb2w2SXowUzg3WFB5d3dCcDB0N2hFSGdoYVEydUtxMW1mNGFxd1E4?=
 =?utf-8?B?S2ZFeVpLbDlDbUUxQUtqb0NkRUcwL2NGanZmQkJpWWVJK3NGOTFlNjFOVlk3?=
 =?utf-8?B?Tlh0Y3NMelV0Q0VXb1h3Qjg4M09JQmQ5cGs3bkFSbDRzRHdydHN1SXpUTnV4?=
 =?utf-8?B?ZE5TYTJSSG90NnNiS2RvVDFkcHpTMktCcVNOVWxQc3RpL2s0M2VQaWVOSHF1?=
 =?utf-8?B?VnBlY00vb09mVXZNQldTbS9zdW5lS1prMTBwMW1vSnhnQlpia2pad3d3VE5m?=
 =?utf-8?B?QXlHQjBzOENJRjY5N2JYcGcydk1yQWVrZGExMVNMd3pOZmF2SkVoMDFDc2RU?=
 =?utf-8?B?ZGcwSEdvbDhKM3c0WTB6TU42dm1yZmlwaEcxWU9FdDRKWkZ4K1ZXSXc5NmpR?=
 =?utf-8?B?UWl0L1ZCbXQ5RS9lTXR2cWJldTJjUGFqRXh5TWpCeDVTS2FKdkVVbG44c3B4?=
 =?utf-8?B?L1RnSGVXRW0wSFhJYko0cXBXQXJndU1ybHFFeE5kZjNsZGxXbHdWNVJyZUpK?=
 =?utf-8?B?V1ZtM1R5R08xWEJ1cFljZlM2Y1F5VFFCYWpESWJSK0Fremc0S1Q5aXBwTUkw?=
 =?utf-8?B?Wk5MRFV1UjhZdnZ0QWZ0eE1YOHBUY28yMnc0bHFzOGpneHMraFl6TUNIcTNj?=
 =?utf-8?B?dCtBUXY3WFdhM1JzUEQ4ZXg2TXMvN1hSc3p0aEFSMENBaXN1SmFYcVo3SGdG?=
 =?utf-8?B?RFhRaDdxbmNsMFVRSytaNTVnQTRKSkw0UWxvaGdLdndkNC9tKzEvUGt3VFh5?=
 =?utf-8?B?di9IUVBKTnFtWnNIaTRrcFE0dTM4QWp1VmczWFFWVk9FUW9YaytQZG9Hb2VI?=
 =?utf-8?B?UnVYZWl6S2t2cjdTWDV0VTRRS0c2aUtHVkwwTnc2UHowRkpRdWk5S011eHE5?=
 =?utf-8?B?WW9WbDgyWWFIMXB0THphOVBTejJkQzR2a0FDYWxSa1RFcVZWS2thc0hxNllu?=
 =?utf-8?B?SVErS0I5OGk5Mjl2N1l0d2pLT0t4ZE1JVGFBY251UGtuZTZJUWt0WEY2Rlh6?=
 =?utf-8?B?UjdCMzBLRTExMjkrVkFVVjNQclRYa25uZk43eEM5dStGejBOS3piekxvWDF1?=
 =?utf-8?B?cDRuMmVJSS9hcTlURExCTHJyRjU4Ni9SS3pNTXpha0g4VzVNaTJydnM3OGFp?=
 =?utf-8?B?K2k2M0s0YitabmZzZzdNUGlHaGNkUUJLR0gvbVRwSzR3MnB5QkFYQTZMeEZM?=
 =?utf-8?B?SW1DTm9YU0oxWnBHYWE3b0w4Qzl0QXZxYkxKbzBNWWpCeHVtbHZ3N29DL0Qx?=
 =?utf-8?B?cFVFZFZWejZYdXNTbGpsVEN5dTQ3dnhtQ0VncFJCbEZrajA1UDBXWWdyeE1l?=
 =?utf-8?B?cDJDWnF6UHpSSEZ6ckcwMzJ3U3AvWitBTCtyUG5OdDZqY3pJK2RKM3dxb29v?=
 =?utf-8?B?Vm9KZnRTWmdPL25iaUVaQ3R4aDJROTBFNmY1WDhOdVlZNEtLRTd4U1Q0ZGRJ?=
 =?utf-8?B?ZlhaN3BmV081dWFudmNEM1RVVys5akQ2Ti9KaURuWWVrODZEQXlNSFgxNG5J?=
 =?utf-8?B?V2NraEhHbFNkVHRWekNsa3QwQjg0U0p5RktqK3JMRVk1SU91YkFEUWNyNy91?=
 =?utf-8?B?eTcybU5aZjRIMUlUdUd5NFdONXJNMStGQndaOW9SY05ONlYvWTQ4TmV5UkFH?=
 =?utf-8?B?dEtjVEtENmVNUFpmbmU3SEhjQ0dsL2ppUUJKRGordWc4OWYyS3lyYkNYcnd2?=
 =?utf-8?B?U1I4R2dSZmthdy9rdkFHa2hHUW8wMVBsQ1FjaVhYV1F6Q1BiaGRneWxyODRv?=
 =?utf-8?B?V3J3VDF4aFhCanZ4d05Qc2oxNVRDb0EwZHM5T1N1NGFSZWFpbG1aeDBXeWp5?=
 =?utf-8?B?eEgxWmplNzMzQVUwaDJkS2hibmZEUWNJUHIwVUk0ckpUMmZGT24wcTMvcUNH?=
 =?utf-8?B?VkxiNkREbmF0WXhFTHZCRUxrTGNxZzdYdlNsOGJXdEtDNWVpL29PaFZ0YkhU?=
 =?utf-8?B?ckVCS2pDWUhhY2pTbkY2WEd4N2sxMjNWMlFTSW43U0ZNWW41TDd1bFpFdnh2?=
 =?utf-8?B?ekp5OGdoa3ZsUlBKRzdmQk5PS1p2eWpRWGh3L0VybHlnbkxnU2oxTFQ0NUhF?=
 =?utf-8?B?cjlhWkRMMVRsWE12V0E1YlZyTFc5bmZkRG02MUI2MHduelFrSSt4RjVpS2Va?=
 =?utf-8?Q?s7X2vDRmxE2dVu7U=3D?=
X-Exchange-RoutingPolicyChecked: znfdEnbWwpBu/ZuREH6jZtnAnKkiqFinnvioH7lvSX8uHeZ31ZuI8rifuZ525rgB9Qx4DRqVBglFNwuEh68KaTF8j/QhztF5K1nLJ1DsMXusUL5pXK0nPiQGgUk15sl7y/3Uv9Phb7HCO632a6OUOu495/neCjG+h0vDwjTw9CWZ4c7C+vZ2nPyAnWAlstFkjwb+Qotci58wyZwdoZMxuVc8uCxQhXMWsxvynd/uEe0GaFywysYFjEkIAn0KKUI2VfCge2gY9S9yum3yrwKWPE91XwIiq3sP4ecGXjpTPH0gNCjYy48jKo8bOGjawXPJYEjVKkQ2yDdVO9S1Z7Mm1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: fada76b6-cb9b-4f39-69ce-08df0e5d1746
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:28:29.8045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rr5cJGhwGeH4VBJlVwF0dkWlOYreFPOMJ6RAKQ80gloJwGvz7eVZdIDHd+YgS0yBxu/ThaCyicSFF2Tt5UarRvhhLDzzciYgCyoR4FN8nKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9828
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



On 9/1/2026 12:59 AM, Swati Sharma wrote:
> Add kms_colorop_fixed_matrix_t enum and kms_colorop_fixed_matrix_names[]
> lookup table for FIXED_MATRIX type strings, replacing raw string
> literals in colorop instances.
> 
> This follows the same pattern used by kms_colorop_lut1d_tf_names[] for
> 1D LUT transfer functions.
> 
> Also, adds missing encoding/range to bt2020_limited instance.

Also fixes the enum string.

> 
> Suggested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Assisted-by: GitHub Copilot
> ---
>   tests/kms_colorop_helper.c | 24 ++++++++++++++++++------
>   tests/kms_colorop_helper.h | 14 +++++++++++++-
>   2 files changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index f58f629f5..2e97d6abf 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -19,6 +19,15 @@ const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
>   	[KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF] = "Gamma 2.2 Inverse",
>   };
>   
> +const char * const kms_colorop_fixed_matrix_names[KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS] = {
> +	[KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB] = "YCbCr 601 Full to RGB",
> +	[KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB] = "YCbCr 601 Limited to RGB",
> +	[KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB] = "YCbCr 709 Full to RGB",
> +	[KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB] = "YCbCr 709 Limited to RGB",
> +	[KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_FULL_RGB] = "YCbCr 2020 NC Full to RGB",
> +	[KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB] = "YCbCr 2020 NC Limited to RGB",
> +};
> +
>   kms_colorop_t kms_colorop_srgb_eotf = {
>   	.type = KMS_COLOROP_ENUMERATED_LUT1D,
>   	.enumerated_lut1d_info = {
> @@ -204,7 +213,7 @@ kms_colorop_t kms_colorop_3dlut_17_12_rgb = {
>   kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb = {
>   	.type = KMS_COLOROP_FIXED_MATRIX,
>   	.fixed_matrix_info = {
> -		.fixed_matrix_type_name = "YCbCr 709 Limited to RGB",
> +		.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB,
>   		.encoding = IGT_COLOR_YCBCR_BT709,
>   		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
>   	},
> @@ -215,7 +224,7 @@ kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb = {
>   kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb = {
>   	.type = KMS_COLOROP_FIXED_MATRIX,
>   	.fixed_matrix_info = {
> -		.fixed_matrix_type_name = "YCbCr 709 Full to RGB",
> +		.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB,
>   		.encoding = IGT_COLOR_YCBCR_BT709,
>   		.range = IGT_COLOR_YCBCR_FULL_RANGE,
>   	},
> @@ -226,7 +235,7 @@ kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb = {
>   kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb = {
>   	.type = KMS_COLOROP_FIXED_MATRIX,
>   	.fixed_matrix_info = {
> -		.fixed_matrix_type_name = "YCbCr 601 Limited to RGB",
> +		.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB,
>   		.encoding = IGT_COLOR_YCBCR_BT601,
>   		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
>   	},
> @@ -237,7 +246,9 @@ kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb = {
>   kms_colorop_t kms_colorop_bt2020_limited_ycbcr_to_rgb = {
>   	.type = KMS_COLOROP_FIXED_MATRIX,
>   	.fixed_matrix_info = {
> -		.fixed_matrix_type_name = "YCbCr 2020 Limited to RGB NC",
> +		.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB,
> +		.encoding = IGT_COLOR_YCBCR_BT2020,
> +		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
>   	},
>   	.name = "YCbCr BT.2020 Limited Range to RGB",
>   	.transform = NULL,
> @@ -263,7 +274,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
>   		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
>   	case KMS_COLOROP_FIXED_MATRIX:
>   		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_FIXED_MATRIX &&
> -		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX_TYPE, desired->fixed_matrix_info.fixed_matrix_type_name))
> +		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
> +					      kms_colorop_fixed_matrix_names[desired->fixed_matrix_info.fixed_matrix]))
>   			return true;
>   		return false;
>   	default:
> @@ -412,7 +424,7 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
>   		break;
>   	case KMS_COLOROP_FIXED_MATRIX:
>   		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
> -					  colorop->fixed_matrix_info.fixed_matrix_type_name);
> +					  kms_colorop_fixed_matrix_names[colorop->fixed_matrix_info.fixed_matrix]);
>   		break;
>   	default:
>   		igt_fail(IGT_EXIT_FAILURE);
> diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
> index 9a1477666..dd76e1991 100644
> --- a/tests/kms_colorop_helper.h
> +++ b/tests/kms_colorop_helper.h
> @@ -51,8 +51,20 @@ typedef struct kms_colorop_lut3d_info {
>   	enum drm_colorop_lut3d_interpolation_type interpolation;
>   } kms_colorop_lut3d_info_t;
>   
> +typedef enum kms_colorop_fixed_matrix {
> +	KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB,
> +	KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB,
> +	KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB,
> +	KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB,
> +	KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_FULL_RGB,
> +	KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB,
> +	KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS
> +} kms_colorop_fixed_matrix_t;
> +
> +extern const char * const kms_colorop_fixed_matrix_names[KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS];
> +
>   typedef struct kms_colorop_fixed_matrix_info {
> -	const char *fixed_matrix_type_name;
> +	kms_colorop_fixed_matrix_t fixed_matrix;

nit: s/fixed_matrix/fixed_matrix_type/

LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

>   	enum igt_color_encoding encoding;
>   	enum igt_color_range range;
>   } kms_colorop_fixed_matrix_info_t;

