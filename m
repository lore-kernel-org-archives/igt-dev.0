Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F2CCDB481
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 14:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BDE89DFB;
	Wed, 24 Jun 2026 14:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OfxEDi0U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B9689DFB
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 14:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782310518; x=1813846518;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wa8KmhOaRHsw3t9W/q8wJxe+UzyrcdYk4YjB5RhrVok=;
 b=OfxEDi0UFCL1YJeXcreXAbAQf44NTrQe1qdW50u25IVLoo7ki82OqKnN
 9ofVKNfdf1nzstvJSDLM2USFOlp/JVlBcs7xU7WE3E/xN4Cp46jGoHUGg
 B9Sov3ooIWDf97aD1krwOlbn0D/LoXFXhRUb66IDM8TKvi6uWwXwunf4K
 g0TvJRTAnudmnn5J18Ld+wbSk7F0st4MB2JaYZ7FJV5LR1GxvquY209Mh
 zoKhvkA4VyZE4wJlJ8Ecls77UbMPfvUlybveXqmgtBdT5m+mNRmtEZZNC
 Hrry0CbBBznBq1ge7a7NzxgZS9pDTXmtag1sjouljLBylEuzyrFA9/Oad Q==;
X-CSE-ConnectionGUID: QnOTte13QmOWDI7f6t7ZiA==
X-CSE-MsgGUID: woAmNMQIT1qxB7n2hnsGkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86977619"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="86977619"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:15:18 -0700
X-CSE-ConnectionGUID: x300YEdDR96vJAVvmg8cVA==
X-CSE-MsgGUID: 5qoIQYoWS26UDes2lFJxYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="243506661"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:15:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 07:15:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 07:15:17 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 07:15:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u20R1DLcFniJ0VgjDGGfKbDT9JwsdyMxXJSmshfZXQt2j4jnkY8QoXX7Y3ZIdndEZLR2+r+IaWMpsOcJOGCQK3R1WacA5rWAa+/On389v8IoFI4py/ovaeWf7l56inJmr0vM5TOqQ6m+ysGn0rpBvE6Ts7mhWd8kSQIKZejD2hzTIA2DTUiaWp17fOV5+CHoqqk4EBulyvYY9HgAu2jsw93nPpHd3UrfYSOBnosGWsJBRufeftiv0saH/vtakV10b3KwHPecrNq5jfgrS3DYA9Ip0fIn/v8jsBUPlGLyj0+1HHiKlbpguHia6HOHE1d3UcTVXIioM2Ju07IuH20yAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we4SNu1VYeFEA9WU0BCzCd3abtgGWEKKKlpUyFZH8pI=;
 b=NWFEdcJcRyU4yTrPWDPPInkNYiTwOM7MtPNPBSZdt3t/HK8X7ePgw0og72ot/L282NvaXOEmGF3R2U4XLHM+QmUpA/8r+BwWrFU9e4YhxykehaLCL6lkYg7SPXZ8EnOHkV3dSdP8pxVNi5TPqD86qOCcNwFQSUHjArSi7TyLC/jgFLlQ5Ev74mzxQuLwzC66G9T2kmY+R22I+DKPm4kBB5fVgHzQihPwYh/+V/DYUA9njL0yhxUaA5NX6LfeB6mUTrt7Beg72BGuIKRQtyVGzMiiY4Xn/6Uhwbjo4ZKm1MY4eF0GeXvRtsCIUbg2WQDNm4wFj1uwx0anTLTrvMcfGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 14:15:12 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 14:15:12 +0000
Date: Wed, 24 Jun 2026 14:15:03 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Andi Shyti <andi.shyti@linux.intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t 2/3] tests/gpu_buddy: Update buddy allocator tests
Message-ID: <c7cn5tbq5oyzcu3adj7myc6yra7eesbqtpplsb3klrduwebrj4@p63friowbiy4>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
 <20260623200152.12996-3-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260623200152.12996-3-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: DB9PR06CA0008.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::13) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|CH3PR11MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbdd6ab-14c7-4d2c-79e8-08ded1fb0129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|6133799003|5023799004|4143699003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: YOu0iu0+itowR+Dl3GxtDnV9LHd8zo/bu2brwDK3l5k/VcsyJfaQJuDldw58sWwJf//0kIBObdOZT8yFdlmUFiEvmtRcOO7NccKlQOEpTMI9JWF5V1BQQwMFeKYPNZEI2Sz6CNJCB4hfY8FGa9u3gj1QOVchNjrUWb1aB58LMidQcXqexjm6YBA3rZw3ouoXiOgufc8z6eZVNH/tnyDGdvxr72/NMIYFfJIveGo/W04gxNnF/BYvmHxWIbHHBfT2ZBmZXNz2ziqP6gxSMIwM3L0jtGqxlZQxkCFkHczELseryZ+jhRqtIRuU/Mr02cNYs0BYsu9hc/9F5+vMa7l/07XOiJ3BkYvB+EaoLf9K/t1Wu/deFYNfpB8ElXYLxFNx5fZjfvTc0uzN4hDHGWVvKXO9yhgCjpuVLvVn8eIwVqzX8+0ahGgjOlhSqT07mc0xdc34vFN+we0LdQJ/xEOlUN4Y24gMz089EWHO5LOXuw0lEnbKHQLxWglr+HMGusSQ063Ur2Fc1KMw269YqlgJHIaSIjPZge39R6x5aXoaUsJdalfiM1ykzkIL1OiupX8OlwV538k2IBNoIkYQYhWvIKcaPNYxuJ+O8ZAmyLW7kepOuUXQ3N7VI8P9vX8pn58J34OWVozmdCKRceXFBYiY7sUui/z7t6gAj5FeXu01F9c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(6133799003)(5023799004)(4143699003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3JIU2t1dTVaK0dMR3I0d1dqOXh5QzZLN0YwWSs0VVpIcEV2TXlXVlBweVZL?=
 =?utf-8?B?NFpGWGdDN1JrSHdEd0dDRjN2V1Z2alJkRlNOdjU2U1JJLzBzZEhVTTJrTmFH?=
 =?utf-8?B?cjI4UkdFUGI5aWJEeGVXMEdxTWNzZ1RHcmVkampzZk9uMVNoWW5tWlBzWWl0?=
 =?utf-8?B?enZsNklDVkhyTmJFQ0JDQlZQVXl5Y2pydVpSeFg3M0oxNS84djVTLzVpZ2pt?=
 =?utf-8?B?RUEzS0VoY2t3d1VlRkE4Z1BXb08zTTljOGlmdVRsdytOMUZ4dHdwZTd5OWxC?=
 =?utf-8?B?M0dXNkJyalV2c09HcFF1NWg3S3c2alVOTCtYSVkzYU5nZ2JHa0RCcytuY21V?=
 =?utf-8?B?d25mdU9mNERkY3kwSkxDbVcwbFN6NWVkazYrcllDL3RYc0d3S0g2VGw1WXFt?=
 =?utf-8?B?UGNGZW9GQkQzME95emc0Um4vL2IzRjRrMURBKzJ3UmZyMkJjMGZKa2FNaDhw?=
 =?utf-8?B?eHZENTc0a29rREJtMTY0MTZ2eVh0bkhkK1RTNGQ2ZzhRNzhRTHk1Zno2YzBk?=
 =?utf-8?B?MW5LL0tSa010bGNpZkEzWEpsQnRLdTZZUkNtUFkvRXUwZHIyQ1dwRldYZ3pp?=
 =?utf-8?B?c3ZUZFIwdXVXUjNuNi85SzBtWFpnV2VVNTlYc1V2Tm4rNTBHVFhHSXFNWW1O?=
 =?utf-8?B?d0IxalBOVFd6QzNXa3oxZnlhbGFhYXJuVUhWU1Nza1Q1K3F4UWoxME9PZUFK?=
 =?utf-8?B?SmpjOTlJUTh3aFd6SElwVjBMb3cxVHBxTy9Pc2RIam83SHk3VThML3d4K1FP?=
 =?utf-8?B?WVZhSm9FOHZmYXBrWVA1Q1hDOVlMVlNyQWozN1V5RG5xdkZYdWtTWWkzb2VB?=
 =?utf-8?B?c2hUODh0LzlaR2tuRkd1enY4dzBKTm43WGU1bXY5Sm5ITVZBUU4ra1FZTWV2?=
 =?utf-8?B?UzJ6dFo3VDRNcDduMlVWWjNTaVhCd1RDdmp3NzU4Q1EwalhCUDcxNWdyYm1i?=
 =?utf-8?B?Z04xOUFkUitSVkxlbUhTSnVCc1dJUEx1Qy9KdlVIRndHR1k0WWdUMzRWOTlw?=
 =?utf-8?B?eU9DRllGaW5DVE9TbkttU3grSXNndGFwUnhBc2ZPbTMvVXFySUhsbUtnQ0JK?=
 =?utf-8?B?a0MzZDRmR29IVkVuODdVclZ2OGZuMTFFV0h5NGJZMU5zTUFxb2Izd0JiOE42?=
 =?utf-8?B?Vm53YWNxRjNaVjhFSzdnWXRnblYrQk1ZT3dQZmFPVW11d08wbFVjN0t0eGJF?=
 =?utf-8?B?ZzV1ODk4aEdnSGwzNGlYejFQUVJGSDlUYzl2MlZEbkhRMHh6QTh1WnRndFZz?=
 =?utf-8?B?ZVRpa1hzcjEvN2ZGVnNGNGw5NEdzeVVoNElrVUkxbWxVYkw0SmFveXB3QWRJ?=
 =?utf-8?B?emdoaTNtNkRjSUE2ejNGNXFkWjg0WlVCaE5qQWM2MkhRK2pZd3JMY291QXNn?=
 =?utf-8?B?YnhWSGQrZEdpRFArcnVDN3RUVTVJM0NHaTNJZ1ZBTU9Ca2ZtdzduYWRYZDBq?=
 =?utf-8?B?SmwzSUNyWm9ON0ltbTF3K243YXZhM1FxQmNBMnFzK1BZY0RramJCNmYwTlRB?=
 =?utf-8?B?RnloSzgzY0ltMEpHbVMyK20rNkwydnNXVWkrbTZpcHRwTHgvdkt4Z3crV1hm?=
 =?utf-8?B?aU10aitDcjQvT1hXa1hBcks3YUwrbDRJZmJ3TkFYZDhId1U1b3N0ZmhWTmVh?=
 =?utf-8?B?dWc1dEphU0ZOZjYxMjNxdFVDNng1MEhEd0hPa2ZrWCtTc0tpUHQyU09DeFJo?=
 =?utf-8?B?NUVMYTdLS1pXRHlrMEtJM09oUTdReVg2R3BxMThrVFFwWWdXUGJHZ3UxclVL?=
 =?utf-8?B?UXdMeitGZWdvdnVzM3VTWlgwVDhPV1g5d1N4aC93aWo5OHM3Tk0rdm5YNVpx?=
 =?utf-8?B?QWR2ZU5HRDAvOWp4YXlwaXRRMGJxQ0ZWREQvODl2U3RLRy8xOUZPU2sxYnpw?=
 =?utf-8?B?c1B6cWhaeXVvUlowemlJNG91RWF5b0cwN080eStvRkE0cWQwR21pUnRrMjY3?=
 =?utf-8?B?Z2JzUEdBUS92allqL053K2o3TTVoS3JScHB0aTFUTVppV2d5MisxbTRDNldp?=
 =?utf-8?B?Z2x0ZVFmZlFFK0xCcnR6Z0JFdGw1SFIzc09GYnhRbTZFRVBOMXBHSFhVNUsx?=
 =?utf-8?B?WlBDVmpERElUdEVNSWNlVmEwNVRiL3N6SFVjQlhOT2FMSnFSbXExNi9UNWd4?=
 =?utf-8?B?N0d1eGtMWmJHSjhZVXB4NTlmZ1JpSXN5N3ZDOXM0NzlYOHRjMVJyRDFDV2VR?=
 =?utf-8?B?REs2OWovQmJLUjhuN2g3Wm4rR3lUVGU0emJ1Z1RScWtnV3I5MjFPZHNjM2Vy?=
 =?utf-8?B?NW9OVno4ZkhocEdWY0dOOXQ0SW01bTRSc1Bmc21CNHczblZTdGNMQlNuelhB?=
 =?utf-8?B?R1BnTEsyZEVxTVFuTHQ4NTJ4L2Y5TCtuWXZseFVXbHlmSEJ6ZVkwUjdWNDBy?=
 =?utf-8?Q?DDkhjs8UDI0GPXnQ=3D?=
X-Exchange-RoutingPolicyChecked: Kmz6NkEhicmv9RQhQa17lguvmmLZx0QMBIeeh8P/RSsgKAM7i9lQVmJc1CalF4MDDHLLFNIShFzUf/g3TfPQN3gG7flhibcTQHcBrncpdL4WDeVDSIN2DQ0UNG1XNbYTcLM39YjVtQUBHwnZjLYBN98BURfaXprAhwvVO9LBWUpLrKuKTGGecH+pCyi1ku0CqgsyntBscNGG3O5A7syxmXeJ7qAnoUAjGT5Gg2dgnw9h0VBJSG9nXvv7AYviaOGSpyn7p5mYCfdqG6GIOdg5LxmPnbyDPFc1TVjgamz2a35o9HXojk7D9trA4R95n2qGb4UYUjc41+13Dx7CziJxhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbdd6ab-14c7-4d2c-79e8-08ded1fb0129
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 14:15:12.1524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxQD3GBJ6rhoFBBSXLGcyQMgKFW0L1LNMpRUpis7NAiu1pqqAZjEMbQBwj9m3UV18ZNR5ps6ZLF60mfw0Ra48VSv23raf2C/QYeeSZ2TmzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413
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

Hi Krzysztof,

On 2026-06-23 at 22:01:51 +0200, Krzysztof Niemiec wrote:
> The DRM buddy allocator has been moved one level up, and is now renamed
> to just the GPU buddy allocator. This means that the .ko object used to
> run the KUnit test has been renamed, so IGT tries to run a test that
> doesn't exist anymore.
> 
> Rename the drm_buddy.c file to gpu_buddy.c to reflect the kernel change,
> and update the igt_kunit() call to invoke the proper tests. Also update
> tests/meson.build to prevent the build system from trying to build
> drm_buddy, and make it build gpu_buddy in its stead.
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
