Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB4FC369D5
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 19:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C1310E23F;
	Wed, 23 Apr 2025 19:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMUUJ/wM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C4F10E23F
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 19:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745436454; x=1776972454;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=hqPxDJVButQ2TYOcXYAFBDx5IHRwXl3DLYhNQ0KJ3oQ=;
 b=YMUUJ/wMiayuC5vnOxWzz9Z2Uj5vuqot4FA4b6cz0x9m9O/BEtyB56jR
 ZKtKDLD0/UTinKN96k/gt2ruIz0mcvvllCqaZxGTkIA5pnWQmpTpdgfgi
 7d6L8OQgSkl3Lx5+OYYSs238M++NT4fhC7EnRv/KMqo6HyafMYYmgVuF2
 AIE6b66D6s+5UUx0Ks7LRbI7X+4sfgjw5YwXmEJHNoZkqVv2Re/Lf0qQS
 23LLqM2gY0ScwA7O1mm93SHWGcGzM9Dfq5rVQzHwHHhhc1Ocp8ocJ5DQK
 xbxtuKZXduSisnXR//30cNgXQ2InQR0kE2ztlSG4uao53p5Yf/YM2hXXo g==;
X-CSE-ConnectionGUID: 2M4lVCpCQxWlSq79baUD0w==
X-CSE-MsgGUID: OzALOpHpTMmuTaQP7mYKaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="64572751"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208,217";a="64572751"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 12:27:33 -0700
X-CSE-ConnectionGUID: VXyETzXfRiiXnOxuW0/9Mw==
X-CSE-MsgGUID: F8Zh73/oQVGmN18uwpqE1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
 d="scan'208,217";a="137198501"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 12:27:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 12:27:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 12:27:32 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 12:27:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpl0EEcnNjuikIqw+ugha19CixSg8V3aGNZftXsGV+APGka4exUr2KLFbjvfjQbMaQZNZdr1lleyTetMy1LaoosWVfJ2boq9TYmVzR9ryaGv95gOFZ0YY70lqyAzwMhy61I0IFusOVTR99n259bSFWu62CmbsGShHXAs9IatyAHn4pcx3Ciw/yONIN3tcJWWzEOg07uC5nv7qqIeqkob7zGmbzWT2prJt4WzVvv0E3UMfxrVfjWSAzdTup9d3XB1dkgfO2g0iYNKg5a5ixbQlwBo9ERMH283uOQjRccH9pR4olgJ5ekY/CxviYCjfK8+CagmrqhH2UwUiFvbkz5WmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jo3GsZrNvhr3z0moTx783piafpvhtRvlKa/esZrA5H0=;
 b=kK/jn9/1ZrAsBKDHNOUjouHUvtpOiuq9EGk1pXHmR/0Ze9fe6XLgRjNtZiLsnOES7c6uLhuJKKxeZuBYA7ELXzybWGroivCxAxRm5SeSYMtapojqZolSFRB1lSUX5+bPdktD+3Fa9L4jY+6YRN8kFmjtfRqKZ+d26wrkzMso7/qArUJW1v8LjFsRKlxYC73UVqFJHCQuKH41Qna+so+2N1pxPzhb8R45ONl2NJkA5bgY7W8h4XWkwqtwow/7KjF4tpNxzNKJBM7jSE8+KVEFAweCNxOQWwMMQpicqxhjQ56qsGYFgHuQmkbzyD6QyUq9X7vdag2eV42QmERIHbeyQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by DM3PPF17031675B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f09) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 19:27:30 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%4]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 19:27:30 +0000
Content-Type: multipart/alternative;
 boundary="------------TzFYUFY9axkG69mB4oudaMID"
Message-ID: <f97bc994-d22d-4bba-9eb5-1b6ebf1f9ea2@intel.com>
Date: Thu, 24 Apr 2025 00:57:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_vrr: Reclassify DRRS subtest under
 general display features
To: <igt-dev@lists.freedesktop.org>
References: <20250423051118.1622586-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250423051118.1622586-1-pranay.samala@intel.com>
X-ClientProxiedBy: MA0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::19) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|DM3PPF17031675B:EE_
X-MS-Office365-Filtering-Correlation-Id: 085c23d2-5576-4056-169c-08dd829ce34b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlF3ZUczYk5lVlJwelhkN3BpQTUzQ3FScXhuYXBMcXlhVlJDSnVtTzVQcWQv?=
 =?utf-8?B?NVY0M2luMjlQdFRYZzZqQ2NFYU9NUVA2aE1HSHp6ei9IdGJCM3VJbk1SN3Fs?=
 =?utf-8?B?NUMrbVNFbHBjalFxZzZ6V1I3c2dzeEdYVHBiUlpCcnI4K2l3em1STW12RERT?=
 =?utf-8?B?WXY0WjZZaXlHNGtGZWlzRzg3Z29icjY1aFlLb1NpVkowbHFYN1hSem9wdmFl?=
 =?utf-8?B?b2lIckYrUFpWVm1HRHJzQlhYVlhDMjh3Zm9PTVo2K0tpd1dDL0pyL3FuODdF?=
 =?utf-8?B?OERUSTM3dzhKK25wVFBIOExnS2oweG9rN3lWWG0zV2NiZTlxTm5veVZtYlow?=
 =?utf-8?B?MDBkRXd6TjJiVTFvSHlTbHZVVXV1WmM1TlFVQVY1Z1I5d3BRVGhKakg4Zzcr?=
 =?utf-8?B?ckNTRVhhRVBOZUhaNG1ITCtiKzBheExVaGRnbnlrTmlQMVdDb0wySXgybkZW?=
 =?utf-8?B?VjVvQlpKVFBzQy9SUWJtclVEaEVFNmxIZVdTdGhhajNyT2tIVkNNUXZMVENH?=
 =?utf-8?B?cGhSbFcrS3FBK0creFFERmFiMjBYckE4a1c1bHdjTGJhNERydUtkTkgxcE10?=
 =?utf-8?B?aFZIbnV2SlNneDYrTk1sZkhObzYxN2ZVS0dFeS9MOWlUYWg1VDVuTkVpRmIr?=
 =?utf-8?B?b1lDQmZjWWcydjIzbWRHU2dRLzVpOHlZVWtXR1NPQUNqbkxiOVgrTG9VSkRK?=
 =?utf-8?B?S0ZMM0FhUTJKRVlwczZuMHR2N3VqcW84eWswZEE3QXpZU0FMd0h2dWNGYVk3?=
 =?utf-8?B?dUhvMzQrbXhzNmhDUHZBY1c5dnJwc3duWnZGRVY1MnY2MGllR2dJdjQycHRL?=
 =?utf-8?B?Q2o0c0l6YkJTamNWWU5NQkF5YVZ6QmRNcTg5SFNOaThtVmk2MlNPYStWMnV1?=
 =?utf-8?B?QWdHM2dCN2FZT1hNaWpYZW5sZkhDSzlvQXEwRXFHYXArRk1xYnJzenArWmFo?=
 =?utf-8?B?K1U1NjNUUHovUUxya2FXQUZucmEyZWU4aE5VL3hRMVNrRGM1TjRneklTY0Q5?=
 =?utf-8?B?djFFdDM5Nlg5aTNSeUdYMlFiUCtzZUlzWldqWk1WUXpNcDBxcjlKZHBhOTNl?=
 =?utf-8?B?LzBPdU9Oc253WWtFQ0FhazQ5alhYNjB2VkZIb3FNWU1SSlYrZFRiUXdxR3k0?=
 =?utf-8?B?TTVaZTNXREdnQUYxRFhLSUpuTTlhaUlLRU9EUHVOWWh5ZW9mQk1DeEFJbUhu?=
 =?utf-8?B?N0lJM0dkRjdjVTJleVpBc21pZldLOE9qcUlVMXJDMDY0NnVZUm5NdENHeUtE?=
 =?utf-8?B?eU5SNDNwclRwRnpDYjNaSzZTTkVlVnZqS21lRjZBYjI1Z1FxTVdTdTNCWjIz?=
 =?utf-8?B?b25zelhGQk1qSjRuZ3NGZitUYTN6VXNwR1pMRmJhbWY3SEdWcEk4bTQ4Tzhh?=
 =?utf-8?B?SjhBWjlQdExOQ1Z6TkdpRWNaTmFxWDZmcXVTbG4yK3orclZRNlJGUlU1MFFX?=
 =?utf-8?B?VGNzZGIxdVZORkFPSzMvYU13N1dXcHNXaVVCcDJ6NnBSeldGNUpKY2RJT2Fi?=
 =?utf-8?B?dldWMkYzNzdHQ1JDcG03eEtlallzTjdUSW1Tb0szczg4RkZIcngxY21IQm5t?=
 =?utf-8?B?RjBRRW9YYi9UaFAycDJSakpaOW03ZHBTdnVqMnFCOVdoc1VIU29hcStiOHQx?=
 =?utf-8?B?OVcybmkxRnFOYlhiUFVtdVIyMDByUWRQMXk3dUtzSjFqWkJpN1FrQ1ZZekM2?=
 =?utf-8?B?TzFlWERDSjlSSzNpUmdxSEtBRWRCSTh2Y0plb1cvOXR5NUQ3MXhMbVJpSm5v?=
 =?utf-8?B?Z29BdG1tYjhXV3I3Q2RRcGZzQU0yekRIMWltQnUxN2NvY1BFWXRPc3ArWm5a?=
 =?utf-8?B?bXJUZDRTK1hXeXlGTlltb2JXWWhMaWlxZ0c1V1dNMVd1cHZhMWFvNUNOYXUv?=
 =?utf-8?B?V05qamg3N2RyRW9aNkhvQ1RDakE3ajVKcUY2TGRnR3JYOWxUaTJHT3lqeG5F?=
 =?utf-8?Q?GLR849whihE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGtUS3V6UjVzdnZZR3VHMWJ4bjhReThibTV6eGVvS2dnUXBiRDlTbSsxZUlM?=
 =?utf-8?B?aXJHY3BpbTZkRS9zbk9ZMUdZRHhXdEJRalk1bS9XV2ZlTE45YWcxNXRxdXNQ?=
 =?utf-8?B?M1ExcWYyNFh3M3pxMEpxeTJaQW9wTEdHZnJCMksyVGpUa29mandLc2VOVzN3?=
 =?utf-8?B?eWs5UGo2Rlo2MENjOGdOZGtUU2VkQXp4d1pWQWdXbnlJTC8wZ2c4Z204TW1z?=
 =?utf-8?B?MHFQVCtIZFRFTC8wc3RERWlabUxFNC9ZNkRhMmRob2FIbTNnQm5aOW5jdEFB?=
 =?utf-8?B?bmNpVlRVMjdTbDhwb2l6NzNPc3ArWXV6OS9BOG9BTDBQSHBjaE43NzJFL0x2?=
 =?utf-8?B?ZDdBRVFVd0ZZUU9TdWp4RVNRNVk3R1RDdE5QNFpEK1hQQm5HWFluYVI4Kzly?=
 =?utf-8?B?bHI2WVg0ZDNmOTYwL2hlckl3V3JERzNUcUZnRjZ6VXlnbWJWWUo0RGZMSlpM?=
 =?utf-8?B?K1lsWlBEaG9pV2xEZnNYZWlCelYxV0EvUzdwSGtYVjVuODVoVnFLeVJtUHpt?=
 =?utf-8?B?dzVpQUwwWXRNVFJpOWdqeDloaUNoZkVXdjdEQTMxaE1tVHF2ZTdLQ043ZlNS?=
 =?utf-8?B?WFV2MnRodm1mZ1hZRndCaUNaUTBkVlRGdVdRaGxUZ095RUlvZUJCTmJPN05z?=
 =?utf-8?B?WG40NXl6aUlVajIvUSs5eWhvNXUrSUZSM09MSkdlK3lkck0yV0pnVU9ZNWZY?=
 =?utf-8?B?MXhJTThFd0hvdGlkSDFqZnBLWXVKL0QrcWZPQlFNK1p6b3h2dGg1MDNpd0RK?=
 =?utf-8?B?TXBVRm5GbWtuTUNLNmNWcER5MnVPN0JRbWQ3eEdTQ1FZc2IydjVTT1pMQTNF?=
 =?utf-8?B?RUZoU1pGd2dwemowMThRNjNhQ2w3eGg5NzhtczNnNzVoSWEzSkxYOUpaQWps?=
 =?utf-8?B?bUlpNlhLdkUxYUN3eGFZanI2VUEvVlRlY2x4alpubXExSnNoelZqWnAydkg4?=
 =?utf-8?B?TVlnSEJKUUI4aXhtdWNaY2hrZk1Pb0NFRGVJZmJZRnFNTmQvbnNzWitjTHJP?=
 =?utf-8?B?MU0yQmtsRUVXNG9pVUkxVmQwZXltdmovS0pwK1pMdk5DNHBZTkZnRE5reEpY?=
 =?utf-8?B?RklyRmlOYkJkMHBVaUV0OEl5SkVtSTFnVU1sNlBHNHJjZXp4dDFTdHo0TDRy?=
 =?utf-8?B?RHc0cWduRGVhV3piRzJPd2xFSjBJWWI5ZEJiTWZxTC9DL2lFQjFmQnVVSEJx?=
 =?utf-8?B?RmxIbGhGVG96aXRuRUsvRUQ4VVJFeGhSTFdPSCtmS2trQTdvWEYrZUlkM2Vi?=
 =?utf-8?B?TWw3SlhFQ3R6Wk8zWUVjL2FwN1ZaQ0lYcDhjYTdLSGE3MWxnQk5hZk1oUlZz?=
 =?utf-8?B?a1duUFN1Y25CeTc0d1FLemdaWXhObjBsdGFENUdIMVdZSEpNZ1hhZ3lBdnAw?=
 =?utf-8?B?ZE1EbEhsVlJMTGNXN1ptODBqeVNvVXV1WERsUWhyZ2Z2M3k0ZWxSdmowVkF0?=
 =?utf-8?B?NzBZOU9LSE4xcHhYSjdlOTNTZ3hJTVdTSHJUNFI5ejBOTHY3eXVtOGhRcm9H?=
 =?utf-8?B?d1htWllvM0p0VGY2MlNvYlNBOWJvRVR2cDBRbnVFVjNxUkdKemZueFZOamk0?=
 =?utf-8?B?V2dnc3psM0tpUzY3czlXR1ptZ1Z2Q0xtRkhlY29BdzFxaTBob0paeXI5dUhY?=
 =?utf-8?B?Slk0Zk9WRjF4eG1mRE54Z1ZoYWdrRzFXNW5ycDRsbmZ2QStDV3NXN1hoMi83?=
 =?utf-8?B?RUFnTHpRcks0SE95RGROdmhTN002cXdvbDhUMnBMeWRZVU5ZZnJRMGhVVkR3?=
 =?utf-8?B?ckk4MEFxK3dmWnZKcWs5MzNXY0lrUHQwSkpTNG1neTh0TmxWNmNESUlhY1NT?=
 =?utf-8?B?QmwxTjV5Tm1xVWpEWnM1cnB5RVAwc1lEL1M1MXBWWDRnUG5NcVJzSTVxQVB0?=
 =?utf-8?B?NWhRV3lsRWxINnp2QWVOZHN4WGRnTmJhclJJd0xUMGFIS080ejV4L3MwUldi?=
 =?utf-8?B?SmJUL0pjMHUwN2VuVmVZRlRaWEFuSEJDdGM3Wi9yRVJ5OU9EV292aG0yTUFa?=
 =?utf-8?B?d25wemp2MDhIV21qaVFpdTM0aDZpbFFJVHlIaHJ3SHBnb2NFckM2bjRkNHkv?=
 =?utf-8?B?VTgrRldySFFGazhqWVE5blpHZ0RBYkM2M3N2WXRqci9TeHdDZEtYbmdQdldr?=
 =?utf-8?B?T1JPRDJCQ2dUWlVQRXVjdWRGZE9xTDZDQ1NQRkxUTXhQZ29ZWFJYVzZNS3BP?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 085c23d2-5576-4056-169c-08dd829ce34b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 19:27:30.0353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfcWWcsoM/CXNcVkYjTfM4QfXp2toue4DmHqMjuvBE5+X28YKpN2TC8Bl6zXAOtIQyQN0wPfWFYbXdjBMpXMycQmyRnpZZq0L7Eoa/l++lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF17031675B
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

--------------TzFYUFY9axkG69mB4oudaMID
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pranay,

On 4/23/2025 10:41 AM, Pranay Samala wrote:
> As DRRS isn't a standalone feature, add a mega feature label to the
> seamless-rr-switch-drrs subtest as General Display Features to
> highlight its relevance to general display functionality.
>
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/kms_vrr.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 1e174262c..d371d9d7f 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -64,6 +64,7 @@
>    *
>    * SUBTEST: seamless-rr-switch-drrs
>    * Description: Test to switch RR seamlessly without modeset.
> + * Mega feature: General Display Features
As concluded in meeting sync, DRRS is not a part of adaptive sync. To 
work DRRS seamless required VRR support on display.
Moving to general display functionality looks good to me.

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com> 
<mailto:ramanaidu.naladala@intel.com>

>    *
>    * SUBTEST: seamless-rr-switch-virtual
>    * Description: Test to create a Virtual Mode in VRR range and switch to it

--------------TzFYUFY9axkG69mB4oudaMID
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Pranay,</p>
    <div class="moz-cite-prefix">On 4/23/2025 10:41 AM, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250423051118.1622586-1-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">As DRRS isn't a standalone feature, add a mega feature label to the
seamless-rr-switch-drrs subtest as General Display Features to
highlight its relevance to general display functionality.

Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/kms_vrr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 1e174262c..d371d9d7f 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -64,6 +64,7 @@
  *
  * SUBTEST: seamless-rr-switch-drrs
  * Description: Test to switch RR seamlessly without modeset.
+ * Mega feature: General Display Features</pre>
    </blockquote>
    As concluded in meeting sync, DRRS is not a part of adaptive sync.
    To work DRRS seamless required VRR support on display.<br>
    Moving to <span style="white-space: pre-wrap">general display functionality</span>
    looks good to me.<br>
    <pre style="margin-bottom:7.5pt;
line-height:10.75pt;background:white;word-break:break-all"><span class="reviewed-by"><span style="font-family:Consolas;color:#333333"><span style="box-sizing: border-box">Reviewed-by: Naladala Ramanaidu <a href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></span></span></pre>
    <blockquote type="cite" cite="mid:20250423051118.1622586-1-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
  *
  * SUBTEST: seamless-rr-switch-virtual
  * Description: Test to create a Virtual Mode in VRR range and switch to it</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------TzFYUFY9axkG69mB4oudaMID--
