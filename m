Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5800C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 08:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E33210E154;
	Mon,  5 Aug 2024 08:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ymk5wNbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC1810E008
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 08:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722846775; x=1754382775;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=hKaTkmMrUddkirNmgkXy5M6IjQdmSCqMMWb2n7aQr9w=;
 b=Ymk5wNboEp8zDQLpI8Gw6IVIfWBTCvSmy5TKyXOGOGMZQJp5+gOwXW2o
 ob5NwOMrLcH8SmJgyeYmq3jl9EOu+mRoa/hMXE5ISVPOvyMYeozrHAwch
 5Xab8NksuwW+ZofE1fJbo8Ou5BxorMDF4Syt0YsKm7AgMdw6m9aD/qVWd
 t27SpTmbxMSX19iXZpa3/OGTrQxkLANYfEmPNsBhfF6OjpHIWcW7mbtFU
 jmutzEI41cxEfPrE00BfnsylmJpZcmP7r/rNA1G3rt1aGfyxOrSXtxUKe
 gdJqwsFKfO7sUwm4A0bs2OqM02CVM78IeiuR78TancQ4lS1ygY4SROvhJ Q==;
X-CSE-ConnectionGUID: 4K9hSUSDSE+WVmbrxPyZuQ==
X-CSE-MsgGUID: f2I7BgmQQGycW8RHebnZLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20969497"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="20969497"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 01:32:55 -0700
X-CSE-ConnectionGUID: 0wDUcCUyRfqRNkTNkJFtBg==
X-CSE-MsgGUID: 3neBHAkZSHuq3VFmFPk6JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56298431"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 01:32:55 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 01:32:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 01:32:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 01:32:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwUdzr79prpGUPbnvSB+SaqxWV+VkkyOyEpG7TpnDRHdOCbNmZTcQZe2QuDTrJtuFDcZ08Vs6pcoGO8J3Xvd7+yA39ZLYKdvpPuBUbaRoNSWoN03aKURc5i0zpHAj2ou59FtmWYyaT2e+FLCcxpEPIDZ68jGGIzsb0Td5F61DUNXaEGyho25b4MhIx3Q3vFIjtvzpZIIyzptX82TIfsz6xVjmhHWwjw42Uoho9kJCzLURul3Od8qeZo/meCERpdbqanWp1z+7125/sYhw0tybX99wtrPTBl6Flvo3uB92GFgNdAijnAdSy1/QojPfG8niXrPyKiMTOE3mcuhKEWP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ei8VPQ5rpxdshd+9DOfS3T6J55daPnyH9UXqImmMhc=;
 b=uAgK3+a97kZv/H+onmkpOUvRjgeNuUZWz5fmiiiL2Zn3I5m3+4oim7MdTN/3Jt6dNtDA8Ds/VQ4gos9o2CZA9q6fg1PreZQ/4k+YPdtBt15YbjrFbqMIUhE9I/IG/lJ5HHCn8B9yQ9u1drT7KPsKLMZgvRSVMLnx6BcVOSen7ghzSvVbIdjaCXYM/5pynJKK9x3E9m8iYS4OvyTUk32zu8CtNiSLa4Si8WMYiZ8iUriEEyHx+jnB7rjr626O/pn10GC8sGtMXw+rDyw4uI/X1a9S4CFG7f8iPQLm7CF8+ZTs4BWbQtI/GfMMk7LDYE+7wdxJGlsOPlMCc0SLcQMB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 08:32:28 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%4]) with mapi id 15.20.7828.024; Mon, 5 Aug 2024
 08:32:27 +0000
Date: Mon, 5 Aug 2024 14:02:11 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_create: Remove the elapsed time validation
Message-ID: <ZrCOC9DFf__bU5By@bvivekan-mobl2>
References: <20240801123312.1539769-1-balasubramani.vivekanandan@intel.com>
 <172258513980.502567.14016714530954673318@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <172258513980.502567.14016714530954673318@2413ebb6fbb6>
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|IA1PR11MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 16164f5d-6679-44d4-f676-08dcb529235c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3BkWEcyOXNLd3dqM0x1V08xRTF5bDZOWjIxaDFLd1U0VVdhUVZIb1RpQWlE?=
 =?utf-8?B?TURqVEx4UTliWXNiUWpBMktZQ2V0bVBNTmh6RllEK2pBblhKeXNXdFZWZHdR?=
 =?utf-8?B?UksxdGgvL2kvMnlmSHoyN2VzdmF2Mjg1cDllWTVhazBQSklVcGpqN3crbG80?=
 =?utf-8?B?THBJenZJN29UVUt0UXVaL3FPV0VLM1ZIZmlldjRwbzZkWDlrcEdqWG8vM01L?=
 =?utf-8?B?c3UrUnpQWi9hVHl3Uyt5NXVEV0g5eWMrMnFTRGF6bmdYTlE1bWlscEJPaGdF?=
 =?utf-8?B?eFNTeE1mSWE5djNZTzRpMXdZUnh0ZVIzY01ibGJBQk40cDc4NWFYZ3BYVy8v?=
 =?utf-8?B?MERLNlZVQWZKenBpT3JpK28za3QvbStoVVY3RmphMG81REk3MnlVUVBpanBq?=
 =?utf-8?B?dkFJeXg5amc3SlNmUGFvOElzaUdlU1ZZNGpGVUdGdkY5dmJRVmJZT2Y2Ukwx?=
 =?utf-8?B?eFVjT1V6bnczVnQyMytlekx6d0xSNEdnOGxvRE04MUJIRVBmRndQUjBiTFlx?=
 =?utf-8?B?Z3pNcGM5WjhHMEx5MTRheDRJaGNVaGt4M1NvTVNPbW8rekcrQ2V0MVpqSmE4?=
 =?utf-8?B?bUlMR0FDdm1CVlNJNFZ0b0pOb25TclloTWVTVHRuZ0N6V0RiZEJ0elpndFA2?=
 =?utf-8?B?ZEREa1p4SHErdUwvYXNRYnB5YTR3YWZicnF2WHRadUhQWm1qWDgzOVpqeHFB?=
 =?utf-8?B?UzlPYUttOG42aWk1aVM4N2FBZXY0UmNwNklCUFd0RE5OVU1pdzlLSk5JNUlN?=
 =?utf-8?B?a2dhQkdKS2RXSVJvV2JuQWRVNGNCTzhEeDMxQyttT2lpZWhDNG9LTHZXN0Zw?=
 =?utf-8?B?WU43ekR0U29PaXo3QU1VbWVNMFhTWHVzMzhlY0JPY3pLcnFUL1NPZy92VmdL?=
 =?utf-8?B?MGE0MmZ6eGxIL2w1VHkrQ2FLaGhja2M3Z0NuSGd4djBtcVNsMW1tVXNteEpW?=
 =?utf-8?B?Z0dpWlowY1BIWk41c3ZuR0dWNldzMGpqZ01icVdpTE5OS1R3bzUxaURMYkQr?=
 =?utf-8?B?TTRXdWYyaVd1bnh2VllFTkNaOStWWEphdFRsN0JKMk9vbzlabytTQlN6RzB1?=
 =?utf-8?B?VC9hQWd1OWJtM3FKcFJkNVZURThBR2ZYRjM0RUl5ZmVVbVkzeVozdnVJY1Nr?=
 =?utf-8?B?ZGdJRTdwOGFORENaeTZtTnhDOGhCUm5MZ2FqRWIrUC9NWURZckViUUNqV09F?=
 =?utf-8?B?S0d2TjlwSnRyT3pUazhSSG5rZ21QOWhOcWlSTHIxL0VqZ2VIYnRmMUdxYjR6?=
 =?utf-8?B?QTkvN2loOWxhL3FzanNaS2FJQnNsOWZFeUx1YzJwQ1BvakZiVFZDRjd1Si9y?=
 =?utf-8?B?Q3NEdzY0RHdFMkx2TXZpbUptdkRJQkNJRDhMUTRLNEdtMkU0N3piZFNRK0s3?=
 =?utf-8?B?OHFUdS9jNXNXQ0RBVTJxN21MM1Z3RGxidENxTVY4Zi9zaXJPZEJMU3ppREVr?=
 =?utf-8?B?SUh4SUQ4Y2xWRERWd3pLQk5GMkN3ZHZqRlcxLzF4MkhSOVBmZG5sL1ZaV3cr?=
 =?utf-8?B?Ukx2R2V6RkRxQlZvUkRiSks5RG9Gb0txZDk2VHRnOTNhZTd3UEFPRXdCWGIx?=
 =?utf-8?B?K2RnQTJpWWM2RHUxNFUvT0FWblpXNkJWcUxyRDBiOG5OTXFZNW02ZmZ6YlB0?=
 =?utf-8?B?OTh5Z3ptUXQyM1dxRzN5a2ViWXIvSldNMlVKTzg5Rk5OTEp3UXc1SGpXRS9G?=
 =?utf-8?B?M2NYb0g4L3k2WE8waGpjZGJLMloxeC9INVRHbWhFQWJSVitRSmNmcTFtZXdB?=
 =?utf-8?Q?L61M4xK67oq4brdipA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkFaR1Z2QTF2QnNRQ2xEcEJHN1RsSEdIYUF5ZVcwRndLRTkzc3NacG9FaVNP?=
 =?utf-8?B?NTd0QXBpQWRXcCtQU3cwUmZXYXdSYU1abDljNUlKZ05yTTFsMkJFMk51N092?=
 =?utf-8?B?ODZUT0RweWh2OEtxTHRRZSt4dFV1eWV0UmQ4WXRMNkFqcm52T0IwSm5uVE1E?=
 =?utf-8?B?eDJYVXVGeTU0Q1YvMEpvWTNYMnh2QklER1VXemNTTlBwdCtjb2ttWkJabWFG?=
 =?utf-8?B?TFBQR1hXQi92T1U4Zlk1RklicnRxS2dWNDRPRE9ETElxMVZvTGh1Y2FwWVlU?=
 =?utf-8?B?bS9EYzdOa2tsL0txdG1QYnFqTTQ0RUx5UUhGZGc3NFc1cHJuVXNEaTAybHo3?=
 =?utf-8?B?c0hCeEw0TSt5aUdBUVFWaUliTXY0cmpYRWdVbEtVSnIwNFdlYjVHVzNkcmVC?=
 =?utf-8?B?L1RoOHhWZ2htSDd4bG9tRVBNN2EwWGszQldXSkVDYmdLZkdIK3pRN0xLOFJI?=
 =?utf-8?B?QUFaZUdGNnQvT2JNV3RQNXBSeCtMMnc2TEhUWWVqcjh3NWFFZm9UL3BjYjVK?=
 =?utf-8?B?TWtSVkVNQzQ1YkFCay9Sc3ZIc2xjaFl1TUxFSDQrZEJpRXlmRE9rajZ1L25C?=
 =?utf-8?B?RHhKWFcrZTFRU3lhc2VKdWphdWtvMDJWaWxNU1U2cC8xZmJFOW4yOW1xelZ3?=
 =?utf-8?B?ZmVUcGR6UTZER3liT2hWWk5YRU1scHJEcWJCUmtDT0M3TXdJTmhsQ3ZPQ0RJ?=
 =?utf-8?B?bmxicmVzcW40N2d0ZnBNVGJ6c1h5a1hwNXd2ejZmRy83ZHNqQVIrN29wdE9Z?=
 =?utf-8?B?dzNVeE1qbGRPaXpwR0pqU0FaTEl2NVlDbmJONFJQSllZNXduZm5ad2VJcTNh?=
 =?utf-8?B?aHBQYStkY1VCSWVBV2xKTVc1Y3RlK1pKRDVHd2pGRVMybC9QdC9hWUQ3OXA0?=
 =?utf-8?B?RExmWkhpYlByRDZBOU83d0g5SUFvbjdPYkhwdVQ1RlpRVzRuMGFDMzJlMy9t?=
 =?utf-8?B?MWFoa1Y3cUFXS2huYXUrYkExeTVzRU5leTRiblJaUTYvd3NsWnJTc2NDb1Zi?=
 =?utf-8?B?U3Q1Nzg1alpCbFZTRnc3bUd3R1JMTnRaYkpVTEZnKzd1VlVVVVJWaWhVbmEy?=
 =?utf-8?B?ZUUrYzJ3TzE5NzBBY0xPL0FscnRtUHkzK25VM24rNFdlZmpzcDhuQitBTm4v?=
 =?utf-8?B?bndBSG9wby9FVUVBSnhUZ1NtZG80UkdHTkFPRndET0JCb2JSbkxPbTNLWTZp?=
 =?utf-8?B?cGJ1L2VPWHNIYzVOQ1E0THZ5U3NDU3hFMm1ieU05emlnSlFsUmhPakNuaW4y?=
 =?utf-8?B?b2x1MkJSQTA3NCt2TU9LdDd2aE54SVMwK3paU3k4c0M0NE41Q2Fsck55WnF6?=
 =?utf-8?B?YzFqVERmODl5R05TTlBEMEpkNG5jc3NTa0FzSlVjc2I0Nzhtd1J0OWVYdnM2?=
 =?utf-8?B?MGpHQmVTZjZGdE5vU2NJSVErZmhOc0pJdzcvT3NSb1BLSTBKOGVPWWlPTS9Z?=
 =?utf-8?B?TG1QR3BiTmpIWU5GVU5TQmsySjVpdGtyS1FLYzd3ZTFwVDhJajY1RTRsQU0x?=
 =?utf-8?B?MEFGY1FHckRjS1BGODVzb1h5KzlhOFV3QWJ2bmppMGRHM1hselNCWjJIbUt6?=
 =?utf-8?B?RUp2VE5pYkxBTlh6NTM1OW54Qlhpek91T0lpTTZKMjVGRXptYXlVQlhCczBr?=
 =?utf-8?B?VzFOM3RkL0JCOElubnFkZXE5UU93RUtCYzF0V0xjTjN0TnlqeFdSMWRvNFgx?=
 =?utf-8?B?M2kwblhLWlRjVkdycHM0Y3l4N3QxLzNSNml4QVFmQS9WM3haOEZCVythQnM5?=
 =?utf-8?B?Z2Nic041aVdmd0hBbDhaTU42Tkozb2V1QlpGM1NpM0xqMFltMGdiZnpJWHZN?=
 =?utf-8?B?TXIzNW8xdzlzVTFWeWdhNGdCbXlVRmh5RnFOUVFwQmpQU2dWV0U5cTdsVWRq?=
 =?utf-8?B?QXQxVHUxZWFFVW5WdFJRcVFPdXhjREdjbGdaci9GYVhva1lSWGloKzN1Y0NM?=
 =?utf-8?B?MTAwL2RiZHFucEFiNVFsWld1OHRZbWtMWjM2THFTMEo3ZW94NDJBVUNRbDBx?=
 =?utf-8?B?QUVMUi9QKzBzclhsaUlNeWR2dzMyZWxGSmpnTVFHdTBYMUE5VTVCL3RCNGhz?=
 =?utf-8?B?cTU0Skl3dDZVeCtKWklmRHFBRW1wb2VjMk5TVWVoZUp0RkhHN0ZKV25qVUtY?=
 =?utf-8?B?aVk4aUlPejJRRjZkSkhnWXo3U2JsaEpZYmhrcjRLeXhMTm01R3QwZEw1Nmlj?=
 =?utf-8?Q?8v0dFmOGrXeZwNlasO07alA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16164f5d-6679-44d4-f676-08dcb529235c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 08:32:27.8573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxCtpL139wDiQ8rN2te0QOhcFI5trhMKyJ/kQxqvDmttcQx44qc837mGiuKsypWuIHGMP3CVJHzkThevnn6/Bkt7hOTGtqKpqFmAIqQ1ffOOcCTPkGWStQmutpgGLn0X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
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

On 02.08.2024 07:52, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_create: Remove the elapsed time validation
> URL   : https://patchwork.freedesktop.org/series/136799/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15168_full -> IGTPW_11515_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11515_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11515_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/index.html
> 
> Participating hosts (9 -> 8)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11515_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-ccs0:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg2-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-ccs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-10/igt@i915_pm_rc6_residency@rc6-idle@gt0-ccs0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt1-vcs0:
>     - shard-mtlp:         [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-idle@gt1-vcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-8/igt@i915_pm_rc6_residency@rc6-idle@gt1-vcs0.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][5] +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>     - shard-rkl:          [PASS][6] -> [SKIP][7] +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-rkl-4/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [ABORT][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-rkl:          [SKIP][9] ([i915#5286]) -> [SKIP][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-rkl:          [SKIP][11] ([i915#3555]) -> [SKIP][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-rkl-4/igt@kms_vrr@flipline.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_vrr@flipline.html

Failures can be ignored as this patch doesn't impact any test outside
the xe_create.

Regards,
Bala

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11515_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#6230])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@api_intel_bb@crc32.html
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-dg1:          NOTRUN -> [ABORT][14] ([i915#11814] / [i915#11815])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@drm_fdinfo@busy-hang@bcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#8414]) +22 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-8/igt@drm_fdinfo@busy-hang@bcs0.html
>     - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#8414]) +6 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@drm_fdinfo@busy-hang@bcs0.html
> 
>   * igt@drm_fdinfo@busy-hang@rcs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#8414]) +5 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-5/igt@drm_fdinfo@busy-hang@rcs0.html
> 
>   * igt@drm_fdinfo@idle@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][18] ([i915#7742])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@drm_fdinfo@idle@rcs0.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#9323])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#7697]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-11/igt@gem_close_race@multigpu-basic-threads.html
>     - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#7697])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html
>     - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#7697])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8562])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-4/igt@gem_create@create-ext-set-pat.html
>     - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#8562])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#8555])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-4/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#8555])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-hang.html
>     - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#8555])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-hang.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
>     - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#5882]) +6 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#280])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-7/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#280]) +3 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-10/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#280])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg2:          [PASS][32] -> [FAIL][33] ([i915#5784])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg2-4/igt@gem_eio@reset-stress.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-10/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          NOTRUN -> [FAIL][34] ([i915#5784])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-17/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@bonded-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#4771])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-6/igt@gem_exec_balancer@bonded-sync.html
>     - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#4771])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@gem_exec_balancer@bonded-sync.html
>     - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#4771])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-1/igt@gem_exec_balancer@bonded-sync.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4036])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-7/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#4525])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_big@single:
>     - shard-tglu:         [PASS][40] -> [ABORT][41] ([i915#11713])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-tglu-6/igt@gem_exec_big@single.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-7/igt@gem_exec_big@single.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#6334])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_fair@basic-none:
>     - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-14/igt@gem_exec_fair@basic-none.html
> 
>   * igt@gem_exec_fair@basic-none-rrul:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852]) +6 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-7/igt@gem_exec_fair@basic-none-rrul.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][45] ([i915#2842])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-7/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-vip:
>     - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4473] / [i915#4771]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-8/igt@gem_exec_fair@basic-none-vip.html
> 
>   * igt@gem_exec_fair@basic-none-vip@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][47] ([i915#2842]) +4 other tests fail
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@gem_exec_fair@basic-none-vip@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-rkl:          [PASS][48] -> [FAIL][49] ([i915#2842])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-rkl-4/igt@gem_exec_fair@basic-none@vcs0.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle:
>     - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3539]) +2 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@gem_exec_fair@basic-throttle.html
> 
>   * igt@gem_exec_fence@submit3:
>     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4812]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-6/igt@gem_exec_fence@submit3.html
>     - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4812])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@gem_exec_fence@submit3.html
> 
>   * igt@gem_exec_reloc@basic-concurrent0:
>     - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3281]) +7 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-17/igt@gem_exec_reloc@basic-concurrent0.html
> 
>   * igt@gem_exec_reloc@basic-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3281]) +11 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-7/igt@gem_exec_reloc@basic-cpu.html
> 
>   * igt@gem_exec_reloc@basic-cpu-noreloc:
>     - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#3281]) +10 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-5/igt@gem_exec_reloc@basic-cpu-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-wc-read-noreloc:
>     - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3281]) +9 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@gem_exec_reloc@basic-wc-read-noreloc.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts:
>     - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4537] / [i915#4812]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-3/igt@gem_exec_schedule@preempt-queue-contexts.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-chain:
>     - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4537] / [i915#4812]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
> 
>   * igt@gem_exec_schedule@semaphore-power:
>     - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#7276])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4860]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4860]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-5/igt@gem_fence_thrash@bo-write-verify-y.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4860])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@gem_fenced_exec_thrash@no-spare-fences.html
> 
>   * igt@gem_lmem_swapping@heavy-multi@lmem0:
>     - shard-dg1:          NOTRUN -> [FAIL][63] ([i915#10378])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@gem_lmem_swapping@heavy-multi@lmem0.html
>     - shard-dg2:          [PASS][64] -> [FAIL][65] ([i915#10378])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg2-8/igt@gem_lmem_swapping@heavy-multi@lmem0.html
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-10/igt@gem_lmem_swapping@heavy-multi@lmem0.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4565])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#4613])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-10/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4613]) +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-1/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_lmem_swapping@verify:
>     - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#4613])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@gem_lmem_swapping@verify.html
> 
>   * igt@gem_media_fill@media-fill:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#8289])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@gem_media_fill@media-fill.html
> 
>   * igt@gem_media_vme:
>     - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#284])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-6/igt@gem_media_vme.html
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#284])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@gem_media_vme.html
> 
>   * igt@gem_mmap@basic:
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4083]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-14/igt@gem_mmap@basic.html
> 
>   * igt@gem_mmap_gtt@basic-short:
>     - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4077]) +6 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-6/igt@gem_mmap_gtt@basic-short.html
> 
>   * igt@gem_mmap_wc@write:
>     - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4083]) +3 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-3/igt@gem_mmap_wc@write.html
> 
>   * igt@gem_mmap_wc@write-cpu-read-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4083]) +3 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-3/igt@gem_mmap_wc@write-cpu-read-wc.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#3282]) +6 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@create-protected-buffer:
>     - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#4270]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@gem_pxp@create-protected-buffer.html
> 
>   * igt@gem_pxp@create-regular-buffer:
>     - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4270])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-6/igt@gem_pxp@create-regular-buffer.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4270]) +5 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-2/igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4270]) +3 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_readwrite@beyond-eob:
>     - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#3282]) +9 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-10/igt@gem_readwrite@beyond-eob.html
>     - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#3282]) +2 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@gem_readwrite@beyond-eob.html
> 
>   * igt@gem_readwrite@new-obj:
>     - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#3282]) +3 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-3/igt@gem_readwrite@new-obj.html
> 
>   * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#8428]) +2 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-1/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#5190] / [i915#8428]) +6 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-6/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4079])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>     - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4079]) +1 other test skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#4079]) +1 other test skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-2/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_tiled_partial_pwrite_pread@writes:
>     - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4077]) +18 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-1/igt@gem_tiled_partial_pwrite_pread@writes.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3297]) +1 other test skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@gem_userptr_blits@create-destroy-unsync.html
>     - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#3297]) +2 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate:
>     - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3297] / [i915#4880])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-busy:
>     - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3297] / [i915#4880])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-10/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
> 
>   * igt@gem_userptr_blits@unsync-unmap:
>     - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#3297])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#3297]) +3 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-6/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen9_exec_parse@basic-rejected:
>     - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#2856]) +2 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-6/igt@gen9_exec_parse@basic-rejected.html
> 
>   * igt@gen9_exec_parse@bb-chained:
>     - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#2527]) +6 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-3/igt@gen9_exec_parse@bb-chained.html
> 
>   * igt@gen9_exec_parse@bb-start-cmd:
>     - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#2527]) +2 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-13/igt@gen9_exec_parse@bb-start-cmd.html
> 
>   * igt@gen9_exec_parse@bb-start-far:
>     - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-7/igt@gen9_exec_parse@bb-start-far.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#2856]) +5 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-4/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-rkl:          NOTRUN -> [ABORT][102] ([i915#9820])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-tglu:         [PASS][103] -> [ABORT][104] ([i915#10887] / [i915#9697])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-dg2:          NOTRUN -> [ABORT][105] ([i915#9820])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#6621])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-3/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_pm_rps@min-max-config-loaded:
>     - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#6621])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-6/igt@i915_pm_rps@min-max-config-loaded.html
> 
>   * igt@i915_pm_rps@waitboost:
>     - shard-mtlp:         NOTRUN -> [FAIL][108] ([i915#8346])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-8/igt@i915_pm_rps@waitboost.html
> 
>   * igt@i915_power@sanity:
>     - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#7984])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-1/igt@i915_power@sanity.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#6245])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-17/igt@i915_query@hwconfig_table.html
>     - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#6245])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-1/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#5723])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][113] ([i915#9311])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@i915_selftest@mock@memory_region.html
>     - shard-mtlp:         NOTRUN -> [DMESG-WARN][114] ([i915#9311])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-5/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#7707])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@intel_hwmon@hwmon-write.html
>     - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#7707])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-3/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@basic-x-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4212])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#8709]) +3 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#8709]) +7 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#8709]) +11 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#6228])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#1769] / [i915#3555])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#1769] / [i915#3555])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#5286]) +1 other test skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-5/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#5286]) +6 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html
>     - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#5286])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#4538] / [i915#5286]) +2 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][128] +13 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#3638]) +2 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
>     - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#3638]) +5 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4538] / [i915#5190]) +16 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#6187])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4538]) +5 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_joiner@invalid-modeset-force-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#10656]) +2 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@kms_big_joiner@invalid-modeset-force-joiner.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#6095]) +91 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#6095]) +15 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#10307] / [i915#6095]) +172 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#6095]) +23 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#6095]) +53 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_chamelium_audio@dp-audio-edid:
>     - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#7828]) +10 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-1/igt@kms_chamelium_audio@dp-audio-edid.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2:          NOTRUN -> [SKIP][142] +24 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#7828]) +2 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#7828]) +10 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd:
>     - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#7828]) +7 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#7828]) +4 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#7116] / [i915#9424])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#9424])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#3299])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#9424]) +1 other test skip
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-1/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#9424]) +1 other test skip
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#6944] / [i915#9424])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-7/igt@kms_content_protection@uevent.html
>     - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#7118] / [i915#9424]) +1 other test skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-1/igt@kms_content_protection@uevent.html
>     - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#7118] / [i915#9424]) +1 other test skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#3555] / [i915#8814]) +3 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#3359])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#11453]) +2 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-128x42:
>     - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#8814]) +1 other test skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#11453] / [i915#3359])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html
>     - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#11453]) +3 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#3555]) +5 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#11453]) +3 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#4103] / [i915#4213]) +1 other test skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#9809]) +2 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#4103] / [i915#4213])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#3555] / [i915#8827])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-4/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#1257])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#3840])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-10/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#3555] / [i915#3840])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-3/igt@kms_dsc@dsc-with-formats.html
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#3555] / [i915#3840])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-6/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3555] / [i915#3840])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#1839])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-2/igt@kms_feature_discovery@display-3x.html
>     - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#1839])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@kms_feature_discovery@display-3x.html
>     - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#1839])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-17/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#658])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#9934]) +6 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-rkl:          NOTRUN -> [SKIP][177] +31 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#3637]) +5 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@flip-vs-fences-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#8381])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-4/igt@kms_flip@flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3637])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#2672]) +4 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#3555] / [i915#8810])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#2587] / [i915#2672])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#2672]) +2 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#3555]) +6 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#2587] / [i915#2672]) +5 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#2672] / [i915#3555])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#2672] / [i915#3555]) +1 other test skip
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
>     - shard-dg2:          [PASS][189] -> [FAIL][190] ([i915#6880])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][191] +37 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:
>     - shard-rkl:          [PASS][192] -> [SKIP][193] ([i915#1849] / [i915#5354]) +1 other test skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#5354]) +43 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#1849] / [i915#5354]) +2 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#3458]) +19 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#3023]) +24 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#5439])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#9766])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#8708]) +14 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#3458]) +22 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#8708]) +9 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
>     - shard-tglu:         NOTRUN -> [SKIP][203] +19 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#8708]) +21 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#1825]) +17 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#1825]) +35 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#3555] / [i915#8228]) +1 other test skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html
>     - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#3555] / [i915#8228]) +1 other test skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3555] / [i915#8228]) +1 other test skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-8/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#4816])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#6301])
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html
>     - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#6301])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-14/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#8821])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-2/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#3555] / [i915#8821])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#3555])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-10/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#5354] / [i915#9423])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-10/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#9423]) +7 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#9423]) +24 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#9423]) +9 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#5176]) +1 other test skip
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#5235] / [i915#9423]) +2 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#5235]) +2 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#3555] / [i915#5235])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#9728]) +3 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#5354])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#5354])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-14/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-tglu:         [PASS][227] -> [FAIL][228] ([i915#9295])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#9340])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_lpsp@screens-disabled:
>     - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#8430])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-1/igt@kms_pm_lpsp@screens-disabled.html
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-rkl:          [PASS][231] -> [SKIP][232]
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-rkl-5/igt@kms_pm_rpm@i2c.html
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_pm_rpm@i2c.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#9519])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp.html
>     - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#9519])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#9519]) +1 other test skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@pm-caching:
>     - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#4077]) +6 other tests skip
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@kms_pm_rpm@pm-caching.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#6524] / [i915#6805]) +1 other test skip
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-10/igt@kms_prime@basic-crc-vgem.html
>     - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#6524])
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#11520]) +4 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#11520]) +6 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-10/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>     - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#11520]) +3 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>     - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#11520]) +1 other test skip
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#9683])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-move:
>     - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#1072] / [i915#9732]) +24 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@kms_psr@fbc-psr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr-primary-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#1072] / [i915#9673] / [i915#9732]) +2 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-11/igt@kms_psr@fbc-psr-primary-mmap-cpu.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#1072] / [i915#9732]) +24 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_psr@pr-primary-render:
>     - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#9688]) +10 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-5/igt@kms_psr@pr-primary-render.html
> 
>   * igt@kms_psr@psr-sprite-mmap-cpu:
>     - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#9732]) +3 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-5/igt@kms_psr@psr-sprite-mmap-cpu.html
> 
>   * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#4077] / [i915#9688])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-5/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#1072] / [i915#9732]) +18 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-17/igt@kms_psr@psr2-suspend.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#9685])
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>     - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#9685])
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#11131])
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-2/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#4235]) +1 other test skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-7/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#5289]) +1 other test skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>     - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#5289]) +1 other test skip
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>     - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#5190])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#11131] / [i915#5190])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#3555]) +2 other tests skip
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#3555] / [i915#8809])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-2/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#8623])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-15/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-tglu:         [PASS][262] -> [FAIL][263] ([i915#9196])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#9906])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@kms_vrr@max-min.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#8808] / [i915#9906])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-7/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#9906]) +2 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-5/igt@kms_vrr@seamless-rr-switch-virtual.html
>     - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#9906])
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#2437])
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#2437] / [i915#9412])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#2437])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#2437] / [i915#9412]) +1 other test skip
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@perf@global-sseu-config:
>     - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#7387])
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-7/igt@perf@global-sseu-config.html
> 
>   * igt@perf@unprivileged-single-ctx-counters:
>     - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#2433])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-17/igt@perf@unprivileged-single-ctx-counters.html
> 
>   * igt@perf_pmu@cpu-hotplug:
>     - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#8850])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-8/igt@perf_pmu@cpu-hotplug.html
>     - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#8850])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@perf_pmu@cpu-hotplug.html
> 
>   * igt@perf_pmu@event-wait@rcs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#3555] / [i915#8807])
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-3/igt@perf_pmu@event-wait@rcs0.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#3708] / [i915#4077]) +1 other test skip
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-7/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#3291] / [i915#3708])
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#3708]) +1 other test skip
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-13/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#3708]) +1 other test skip
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-4/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@prime_vgem@fence-write-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#3708])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-2/igt@prime_vgem@fence-write-hang.html
>     - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#3708])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@prime_vgem@fence-write-hang.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#9917])
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@sriov_basic@bind-unbind-vf.html
>     - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#9917])
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-8/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@syncobj_timeline@invalid-wait-zero-handles:
>     - shard-rkl:          NOTRUN -> [FAIL][285] ([i915#9781])
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-6/igt@syncobj_timeline@invalid-wait-zero-handles.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#4818])
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-8/igt@tools_test@sysfs_l3_parity.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_eio@kms:
>     - shard-dg2:          [FAIL][287] ([i915#5784]) -> [PASS][288]
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg2-4/igt@gem_eio@kms.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-2/igt@gem_eio@kms.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-rkl:          [FAIL][289] ([i915#2842]) -> [PASS][290]
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_lmem_swapping@heavy-random@lmem0:
>     - shard-dg1:          [FAIL][291] ([i915#10378]) -> [PASS][292]
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg1-18/igt@gem_lmem_swapping@heavy-random@lmem0.html
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@gem_lmem_swapping@heavy-random@lmem0.html
> 
>   * igt@gem_lmem_swapping@parallel-multi@lmem0:
>     - shard-dg1:          [DMESG-WARN][293] ([i915#1982] / [i915#4391] / [i915#4423]) -> [PASS][294]
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg1-15/igt@gem_lmem_swapping@parallel-multi@lmem0.html
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@gem_lmem_swapping@parallel-multi@lmem0.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
>     - shard-mtlp:         [FAIL][295] ([i915#11808] / [i915#5956]) -> [PASS][296]
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a4:
>     - shard-dg1:          [FAIL][297] ([i915#2122]) -> [PASS][298] +2 other tests pass
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg1-18/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a4.html
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-16/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a4.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
>     - shard-dg2:          [FAIL][299] ([i915#6880]) -> [PASS][300]
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-mtlp:         [SKIP][301] ([i915#433]) -> [PASS][302]
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-mtlp-2/igt@kms_hdmi_inject@inject-audio.html
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-6/igt@kms_hdmi_inject@inject-audio.html
>     - shard-rkl:          [SKIP][303] ([i915#433]) -> [PASS][304]
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-rkl-4/igt@kms_hdmi_inject@inject-audio.html
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-4/igt@kms_hdmi_inject@inject-audio.html
>     - shard-tglu:         [SKIP][305] ([i915#433]) -> [PASS][306]
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-tglu-9/igt@kms_hdmi_inject@inject-audio.html
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-rkl:          [SKIP][307] ([i915#9519]) -> [PASS][308] +1 other test pass
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-tglu:         [FAIL][309] ([i915#9196]) -> [PASS][310]
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@perf_pmu@enable-race@bcs0:
>     - shard-dg1:          [INCOMPLETE][311] ([i915#9853]) -> [PASS][312]
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg1-17/igt@perf_pmu@enable-race@bcs0.html
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-18/igt@perf_pmu@enable-race@bcs0.html
> 
>   * igt@perf_pmu@enable-race@vecs0:
>     - shard-dg2:          [INCOMPLETE][313] ([i915#9853]) -> [PASS][314]
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg2-11/igt@perf_pmu@enable-race@vecs0.html
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-8/igt@perf_pmu@enable-race@vecs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-tglu:         [FAIL][315] ([i915#2876]) -> [FAIL][316] ([i915#2842])
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-tglu-8/igt@gem_exec_fair@basic-pace@rcs0.html
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-tglu-3/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2:          [SKIP][317] ([i915#11453] / [i915#3359]) -> [SKIP][318] ([i915#11453])
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         [ABORT][319] -> [SKIP][320] ([i915#8810])
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:
>     - shard-dg1:          [SKIP][321] -> [SKIP][322] ([i915#4423])
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>     - shard-dg2:          [SKIP][323] ([i915#3458]) -> [SKIP][324] ([i915#10433] / [i915#3458])
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
>     - shard-dg2:          [SKIP][325] ([i915#10433] / [i915#3458]) -> [SKIP][326] ([i915#3458]) +2 other tests skip
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
>     - shard-rkl:          [SKIP][327] ([i915#3023]) -> [SKIP][328] ([i915#1849] / [i915#5354]) +4 other tests skip
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-dg2:          [SKIP][329] ([i915#1072] / [i915#9732]) -> [SKIP][330] ([i915#1072] / [i915#9673] / [i915#9732]) +2 other tests skip
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg2-8/igt@kms_psr@fbc-pr-cursor-plane-move.html
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-11/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr-suspend:
>     - shard-dg2:          [SKIP][331] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][332] ([i915#1072] / [i915#9732]) +10 other tests skip
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg2-11/igt@kms_psr@fbc-psr-suspend.html
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-10/igt@kms_psr@fbc-psr-suspend.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2:          [SKIP][333] ([i915#11131] / [i915#5190]) -> [SKIP][334] ([i915#11131] / [i915#4235] / [i915#5190])
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15168/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
>   [i915#11131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131
>   [i915#11453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
>   [i915#11808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808
>   [i915#11814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814
>   [i915#11815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11815
>   [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>   [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
>   [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
>   [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
>   [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
>   [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#2876]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2876
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/433
>   [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
>   [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
>   [i915#5176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
>   [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
>   [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
>   [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
>   [i915#6228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228
>   [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
>   [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>   [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
>   [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>   [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
>   [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#7742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
>   [i915#8346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8346
>   [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>   [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
>   [i915#8807]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807
>   [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
>   [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
>   [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
>   [i915#8827]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8827
>   [i915#8850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850
>   [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
>   [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
>   [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
>   [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>   [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>   [i915#9697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9697
>   [i915#9728]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781
>   [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
>   [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
>   [i915#9853]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9853
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7950 -> IGTPW_11515
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_15168: e6b1e3660d0168d9860e7cef487aba2bc21611bd @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11515: 11515
>   IGT_7950: 7950
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11515/index.html
