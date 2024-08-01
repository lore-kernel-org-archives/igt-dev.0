Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589F4C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 08:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B4910E666;
	Thu,  1 Aug 2024 08:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nW4ZsGNz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4291A10E666
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 08:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722499833; x=1754035833;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=50pgbkz7PvNJZEdTWIHXCGHbfydTkfaY7CLEAPCvYzw=;
 b=nW4ZsGNzsRl0GhW1jZxFXrnVZ2iUOtw7zyDfxn7hvx33GKoEvNGXRJkJ
 TcRJC4gUWA4faV+VrBx62kJugwQ7PhJoKUQFWMRdbhDZi/SQMoNSvFUdz
 sAEqj0vjAitptuU3u0jda6lda+tZoPEZ1AlDTg2wpUQudQCFgr+43/57R
 /G4AEyPOXVL0cSXiU6skt8ilJdJ4/Ix8ZmJuhH4ULVFjK+Htn09aSkfu7
 u7wzqeCvvUc8PU7rrbGL+zCsQGdNwyhoQwCttsh9CwjHhmMByExYBMWNs
 QrcSPbWQgmevWN/VWBLD50k8cr1G+zTKHfnYXWL2T8DhILw/u92TJRVw9 A==;
X-CSE-ConnectionGUID: mm6WajGGRbeD9Yov8bt8cQ==
X-CSE-MsgGUID: beecsNl4S0K3uSmLml4yTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31066948"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208,217";a="31066948"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 01:10:30 -0700
X-CSE-ConnectionGUID: OLsZGeRTREuhiT1YW+Dfyg==
X-CSE-MsgGUID: 6p9Jt4zZQOeClaZoWwxpLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208,217";a="54607613"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 01:10:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 01:10:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 01:10:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 01:10:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMMlZreDukJAEocSyRc13YI9vNtp8MrEGReVaZIWJ4t66To89/mjHhwVILctJuMKedOE92OTbXqf1972Jz6eK9oPix+FWSidchxBQ4a38XxkkUr7w+YLPbHIl+MHbDcgpA8QJpd0ha0GuubUsCLBJRbVb+u7P+krYwHotYMiDzfxEBTk2nbVeff7JhPlE66r5SqdmWeDTjT/Hq7AHWFMBah/t9y93ORP/yn4wlB9YQIl3IpcIwj1oyIxH0A/hHOmdq/oycItXbpKb76/zWbA5EIa6KVPlc2oVigVPbZZe8z4kFhnDJcvW5LwuuOP+eMMe7jrcHfEYGCrGN4jPuqzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZK2ozFS9RmbChQAq34Lh+Isdp+w7ed74xg6W9aOmos=;
 b=NagcL/fnu3ENePisPh1NkrnIHACR4mO16otEo14LEmQNo56fMWhig0F570ZgzAyKnDlP9ml+Ir7B/1Rqimh8TMBxTzCqk9eRgR9rOqB5QwuGuPFrUvXw0ZtkS2YJehHrAXH2yah+CK8nWibLTVTBINXNRmFUylLijwqt7T2DmwdAhT1a/BTAjoykJY+3TBisZKbywa6qkyY9fdkoOkF2Nj0k06SjyA7CN1dwpZiU4CNGm5YX+GGPmeuzg/jvkHzuytM1KYs9Bq5FriTDlx7x/ZVz+q7mrSlfM9RBhtPxDqhcKDypdW4uHUCpgh/DU9auUWnRoAxDxZfl/jJwx6dBog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Thu, 1 Aug 2024 08:09:57 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%5]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 08:09:57 +0000
Content-Type: multipart/alternative;
 boundary="------------JZSdmFdMMgoFlIqVPcfkIBiC"
Message-ID: <5d63641a-18a7-49d3-a2c2-c5cb00de711c@intel.com>
Date: Thu, 1 Aug 2024 13:39:47 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel=3A?=
 =?UTF-8?Q?_Add_tests_to_run_suspend_without_display_=28rev3=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
 <172235234801.429116.16595380527478547963@2413ebb6fbb6>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <172235234801.429116.16595380527478547963@2413ebb6fbb6>
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec26984-47ac-45f1-48c7-08dcb2015442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUxQU3F5ZWlOcU8xc1U5UHAySHFtM1BMSzZ2amtoOGZhdTA5WW9aVXI4VjNo?=
 =?utf-8?B?WWVQNXlTSTF1WHp2SUthNGJJb285L2I3Z3NGRk1VQWtYT2FlaVhZWk9xRThO?=
 =?utf-8?B?NmR0NkFxSlFldzZ0Tis4djl6a1VwWTNNV1NKdThFMFBUMk5mQ2FpZ1MrWGxS?=
 =?utf-8?B?bnViM04zRXlNcXcvVndNOG1MY1ByR3B5ajR5LzhOaDdXamxKSm9qUTFlQmxz?=
 =?utf-8?B?b05QMGk1ZDNCZkRuMnh4bGdsb3hsaGVhL1VYMkRhMHRtTjh1SUxKZmpRZjNq?=
 =?utf-8?B?MnR0UGNWMzI5YUtTU2JFZlVUR3M0K0dKQytTbFF6VEtFTkVFd2kzNXBsOW43?=
 =?utf-8?B?WldzbTdyQ2xlenBLRXM3b1ZkMG81UFVBWVpTTkFjalJoTVRXQkQ2T1d4ODFG?=
 =?utf-8?B?dE9qd1NmYU9QWjQ3STlzN2ZPRjNQUndWQ1FWMDk3UFN3S2lwczVUQWIwUEdl?=
 =?utf-8?B?eSthUzlSSzhtUzkrODIzeXYwcnNCd2R4QU1YWGJxMnZ2RGZwVXlMQ2lYNWYz?=
 =?utf-8?B?blN2MXRaWStBNnhITTJydkpVSmMxVkhqVlBPSmlvZnlBL1lFb1AvNVU1RVB5?=
 =?utf-8?B?ZlNOVlp4dUxvSEpLME5mQUtyRnR3Y3ZUdFMvUWNqaXpJVm5VWllRbCsvNGJF?=
 =?utf-8?B?M3RBczJqV1RCTGl3UHFvVEQrcU9pZTdiQkcwS21vRGVXMndaMEFiaGt5M0V5?=
 =?utf-8?B?MDZXelBWdnBqV1Z6T1IxMlVSVzQwVjhHRGVCdUtlREZ5V08rZXhDSmpDTkpN?=
 =?utf-8?B?WDJNc3ZRZ2hRRTFCY00vSEFyK0pabHhlOG5Bc1FFZzJ5MUo4d3RFeVVzZVJW?=
 =?utf-8?B?YmZDS3hPRHRPTnVHdDllUmdLbXhrRDU2aVVVK29hc2NvWnM4VzFBZUk1VzZ0?=
 =?utf-8?B?TDdQYlVqR2w0MlpyUUtrNkVNeFE2aUdESE1DeTEydFJuWFB6UFIrMmY3dXNI?=
 =?utf-8?B?SHV6TzF3TVlza3krZXJmY1lZbjQ2Z2pXZmZLS2xWZS8zYStEWXdOV21hanNY?=
 =?utf-8?B?SjVOTStONGdXWDViL3VrU2J1aWRNQk5jWGExZVpUY2ZpeExHb0lqVHR0OWZC?=
 =?utf-8?B?TjdrdFh3dnMwZ0dCem1NRmUxR1hWL1R6WWxleXo5TGRKTFAyZTFqcHArc3Zp?=
 =?utf-8?B?SXRyWk5QdVRjRWg1a3FTN3pRNlBnMk5GM1BJWG1IQjRlUWRRQ2NCQzQrWEwz?=
 =?utf-8?B?enFnOFdUT0ZlTE5vY1hNV2FOemZtbnA4d0N5R0dhN1hlNHV4YXE4N1BNOWgx?=
 =?utf-8?B?MjliNlFKaDRmMTRab2ZMdDdaOENnZHUvY3pxSVNrU3YzNTZwMWpRWE1lU0o2?=
 =?utf-8?B?cnU0YVVNNWIvSzZ6dHJubURjOFdFc211MHJ2L2R4bVlvcUhhbnZZYVNyRHdG?=
 =?utf-8?B?a3pZUXgwM0JCVHNXUlFjRGthWUE2ZG9OMStETVZ0dW9QZTFWZkUxVkFhNDNO?=
 =?utf-8?B?TVBxSGFuVlhaWEVUNEgzRjVFOFNjQVVtc1RncDJDUmRPS1JxZ1hvNUJZRFFt?=
 =?utf-8?B?Nm10K3htRVNjTzYybmlKbHhoREl1WjY0UEt3azQ4cE9IbHdwWlNiaVIxTVFn?=
 =?utf-8?B?OStWc25LYzZUYUxNaHFHVWdGS3d0THZFNG5mNVdmcVZwNHRmY2FGTGo1V0dp?=
 =?utf-8?B?TWs4VWMrT0E0Ly95QWdFY2dyWCtRMUZpQXFIWWhDREt3emhJTUtLNWc2RDRK?=
 =?utf-8?B?aUVxbzNPT2JwZG1HWTJBSnZrYTV6anNhcmVyMXFMazJqS1FSM2RnMHV6d3Fq?=
 =?utf-8?Q?JqpMKaFxNrtPPaS1tc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1FNMnAxaGhlaEliMlFrV2hxQ2xGNHRWQ284VmFyWC9acCtRQXI2UkFPMHda?=
 =?utf-8?B?bFAxM0pIODJDSDU0bTI3L2JSNnVYZ1FOUGdWQkxDNHFRQWJqcVd1ZDBsQWdi?=
 =?utf-8?B?N2FTeFBkeG5lZHlON29SVjhnVmcrWXIxNXdTaW1kQ2drMCtDZWxhSy9GVkR2?=
 =?utf-8?B?T2JhTmJaTFNmZXN6d2RtaUViV3UxZjlrRmdDY1FmSUVVa21WSWF4OENKZkhH?=
 =?utf-8?B?Z0tsdUt6c0xXTmplQlpvQWk3ZW1BMUg1dlIrSTFJTHlmbFhSVkNUb1JwM0NK?=
 =?utf-8?B?bStuUk83NzY3c2lVYnR6Smx1ODRINm0rdHVTbDFKQmp1VzZGWU9mS1pPc2hN?=
 =?utf-8?B?MHZzWkxDVmxSenB5dU5iWlpacVlBdUFZbkRFMEp5NFROSFJrN2hIdVFVY3U5?=
 =?utf-8?B?b2NZczQwc1dtUVRmQ3k0L2oxMUhIK0ZPVjVGT3BrZ2RMWmJPTk5uaVZQU2tO?=
 =?utf-8?B?V1plVk8zd1oweXJtRWNkOTQ0Sy85dm1FNDJpbWpOZGI2Vm8wS3drOXp2YW5L?=
 =?utf-8?B?TUI5dUhscnM1aGRJWjJ2V0pOMHBqTEFtTFR6UFBjWlRWdFFabzVyQSs0VXVQ?=
 =?utf-8?B?M01pKzVranZub1NWRWVxeW1zbWlmUWtpQWVkK0dhRWV1cG5hMTVvck9tVzJ2?=
 =?utf-8?B?YldjRkFVR29WV2gxam9lQjJvTUxRZHZkMit5UjFxanAwVFlvSEppS21qWmhW?=
 =?utf-8?B?OGNnaDlwSGhzeEVERWFLQlR5NTRTWDhIblZpdEhIZUxiQVFVbHh0T2FSbnoy?=
 =?utf-8?B?RWU0ci9aWEJCTE1EWTJ3cXBLVHRYQURyRjMweVNpTWFtT2VZWmdVNE5yUmZL?=
 =?utf-8?B?dkQzMjUwcjRySzlaTFJhdVUzNnVFTkdKVEZyYWdQb3hIMW53N3dsaklLb0pE?=
 =?utf-8?B?Zk9xMkQ4TEw1bWZEeVY4U3V1WmwyY3FZU1pEeDJXVGNjbkFtcDFHNEtsMy95?=
 =?utf-8?B?UFRNaitidUE3WUVnRWZpR1BvQWZkNUoxVUxPclcyaWtrcWR3bVdkdkpjNW5j?=
 =?utf-8?B?ck1Nb3ZlT0orc24zcnlGUGpSWVRpVlNJbHFTTUxTU1ZPR2dGSEhlRTU2YzI1?=
 =?utf-8?B?YXk2M01FcC9JekV4QTVSUWtNSklpanphNDVEcC9Sdm9PZjhwZktPc1dXdDBo?=
 =?utf-8?B?ZXZzd2cvWWhJVWhmdm9IN2pxK2lkaEN4ZmF5Sk9xdmVMeWozQWxObDlvODFS?=
 =?utf-8?B?cHMwRWVVeWpxOEt2YW9NRlh2UjE4RW5nTFNmRUF1Um9tNWtPUnVXd3BNSkV0?=
 =?utf-8?B?cWpiMWhqeVRIYnU4SDU4aTFHRWdUY1I4NE4vcElBaXZzZzdlem5oRUJZd2FS?=
 =?utf-8?B?d0FaUk1FZjg2dnozNzlUZlkvUlh2cCs5MjNZem1XZW5MWnpFTGQ4MFo1N2Nv?=
 =?utf-8?B?WGlzTVB4RDhhNlF3ODhKQUt2TkZYaDBjUm42RExMcGM0YTFxWGhSU3NVUFZ5?=
 =?utf-8?B?cUNBVTFpN05xRGRmN1Q2bUJoZG5mMWRnTTk3UDk3VEsyOHhKQ2VmamZEaHFD?=
 =?utf-8?B?eCswc2pYSThuSG4zM0NRVmh1YlA1VWFpWFQ1T1FzWjFjRmh5UXBVMDJscmdp?=
 =?utf-8?B?Ly92K1IwQnlPaVpmczFUWnBMQlRIZ2hJZHNxZytaTXFMdGZqaURsZXNpaHl3?=
 =?utf-8?B?QlpqblBjTDZFR0M2VkJjSHhSYXV1VkhJUVBkTENLNTVmeGw0R2luaHhqWC8v?=
 =?utf-8?B?Y2pGTjhhS1Y3QUZ0bDZzVnN6NmlTK0lYdExQTGNwdHU4L3NvRE40alBta2F0?=
 =?utf-8?B?ek8zR1pjYWhWVUI2cE5KUEwwaDJJaElOSVMwSE9wVFNSamhMclY0bFVMbW9l?=
 =?utf-8?B?ZGV4WDNpUllOdVJja0NDZkh1SllqbjZPbDVkSHh6WmVNaUx1SEU3eXMwaDFU?=
 =?utf-8?B?cGtKcVRJaUR6NVB4STlHMERhWTdhcUk5d05WTTFlUlRZQ0ZBLzNnQnAwMkRp?=
 =?utf-8?B?dlIxdHozVlJ6TDUzckt5NEZRMStPM25lbVZsSjBMUnl3SXBKbDB1TzRRV2Rx?=
 =?utf-8?B?NG5wNHJCKzJseko5eHRDcjMrT3kzaUlXUmNEZGZlYlN6SmQvNFl5bFdMczhO?=
 =?utf-8?B?MVd5TEMzMytveDRJQUlhaHgraElkWVkvSkZlY0FuT0lxVThsQ2tqYjYzZVlQ?=
 =?utf-8?B?UlJ6M29QUjdnd2M1TzNtY2xXS2FQNlAxRG9OWXJxdW1ycy8wNGdXWW5kZFZK?=
 =?utf-8?Q?7dPW3T4LM6hJ+DMGQWjGBKo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec26984-47ac-45f1-48c7-08dcb2015442
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 08:09:57.0963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxiG4eFX4A1shoUT9Ip7VDq3nTuflBeTpjtraS6bHYMhCfTlYynsc6nxt3oqp6djwO3BJdG9HyAVMci5NM2s58ZW1RhSUIdFKiNB9Hwe5lM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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

--------------JZSdmFdMMgoFlIqVPcfkIBiC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Looks like the xe unload is being help up some open jobs. Will do a 
retest on this.

Thanks,

Suja

On 7/30/2024 8:42 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel: Add tests to run suspend without display (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/130239/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/index.html
>
>
>   CI Bug Log - changes from XEIGT_7942_full -> XEIGTPW_11493_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_11493_full absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11493_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (3 -> 3)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_11493_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_atomic@crtc-invalid-params:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_atomic@crtc-invalid-params.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_atomic@crtc-invalid-params.html>
>         +46 other tests skip
>  *
>
>     igt@kms_atomic_interruptible@legacy-dpms:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_atomic_interruptible@legacy-dpms.html>
>         +12 other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html>
>         +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>         +11 other tests skip
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_vrr@flipline.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_vrr@flipline.html>
>         +3 other tests fail
>  *
>
>     {igt@xe_pm@s2idle-without-display} (NEW):
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@xe_pm@s2idle-without-display.html>
>         +1 other test fail
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_pm@s2idle-without-display.html>
>         +1 other test fail
>
>
>         Warnings
>
>  *
>
>     igt@core_hotunplug@hotunbind-rebind:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@core_hotunplug@hotunbind-rebind.html>
>         (Intel XE#2421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@core_hotunplug@hotunbind-rebind.html>
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#1512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html>
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html>
>         +2 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html>
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html>
>         +7 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-32x32:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html>
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x170:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>         (Intel XE#1413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>  *
>
>     igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         +3 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms.html>
>         +1 other test skip
>  *
>
>     igt@kms_force_connector_basic@force-connector-state:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_force_connector_basic@force-connector-state.html>
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html>
>         +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html>
>         +5 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html>
>         +9 other tests skip
>  *
>
>     igt@kms_plane_multiple@tiling-y:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_plane_multiple@tiling-y.html>
>         +4 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html>
>         (Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html>
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html>
>         +1 other test skip
>  *
>
>     igt@kms_psr@pr-cursor-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr@pr-cursor-render.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_psr@pr-cursor-render.html>
>         +1 other test skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (Intel XE#1437
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         +1 other test skip
>  *
>
>     igt@kms_scaling_modes@scaling-mode-none:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_scaling_modes@scaling-mode-none.html>
>         (Intel XE#374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/374> /
>         Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-none.html>
>  *
>
>     igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html>
>         (Intel XE#2180
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2180>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html>
>         +1 other test fail
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html>
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     {igt@core_getversion@all-cards}:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@core_getversion@all-cards.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@core_getversion@all-cards.html>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@core_getversion@all-cards.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@core_getversion@all-cards.html>
>  *
>
>     {igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p}:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html>
>  *
>
>     {igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p}:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#1512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html>
>  *
>
>     {igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p}:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html>
>
>
>     New tests
>
> New tests have been introduced between XEIGT_7942_full and 
> XEIGTPW_11493_full:
>
>
>       New IGT tests (3)
>
>  *
>
>     igt@xe_pm@s2idle-without-display:
>
>       o Statuses : 2 fail(s)
>       o Exec time: [9.91, 11.26] s
>  *
>
>     igt@xe_pm@s3-without-display:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@xe_pm@s4-without-display:
>
>       o Statuses : 2 fail(s)
>       o Exec time: [9.95, 11.25] s
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_11493_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@fbdev@write:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@fbdev@write.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) +1
>         other test skip
>  *
>
>     igt@kms_atomic@plane-invalid-params-fence:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +37 other tests skip
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +6
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-dp-4.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +6
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#1399
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +76
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +17
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-blue-to-red:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_chamelium_color@ctm-blue-to-red.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-cmp-planes-random:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@vga-frame-dump:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +8
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (Intel XE#1413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x21:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>  *
>
>     igt@kms_cursor_edge_walk@256x256-top-edge:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_edge_walk@256x256-top-edge.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-edge.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@torture-move@pipe-a:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-a.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_fbcon_fbt@psr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html>
>         (Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_flip@busy-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_flip@busy-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>) +1
>         other test incomplete
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +20
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +16 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +17
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +16 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +19
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>         +44 other tests skip
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +4 other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_hdr@bpc-switch.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_hdr@bpc-switch.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>         +17 other tests skip
>  *
>
>     igt@kms_invalid_mode@bad-htotal:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_invalid_mode@bad-htotal.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +8 other tests skip
>  *
>
>     igt@kms_lease@multimaster-lease:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_lease@multimaster-lease.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_lease@multimaster-lease.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +7 other tests skip
>  *
>
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>)
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html>
>         (Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>)
>  *
>
>     igt@kms_plane@plane-position-covered:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_plane@plane-position-covered.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-5/igt@kms_plane@plane-position-covered.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +4
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +14 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>)
>         +11 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) +5
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +7
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-5/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#1128
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128>)
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-suspend:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_psr@fbc-psr2-suspend.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html>
>         (Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>) +1
>         other test fail
>  *
>
>     igt@kms_psr@pr-cursor-plane-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_psr@pr-cursor-plane-onoff.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +13
>         other tests skip
>  *
>
>     igt@kms_psr@pr-primary-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-5/igt@kms_psr@pr-primary-blt.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +1
>         other test skip
>  *
>
>     igt@kms_rmfb@close-fd@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_rmfb@close-fd@pipe-a-edp-1.html>
>         (Intel XE#294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/294>)
>  *
>
>     igt@kms_rmfb@close-fd@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_rmfb@close-fd@pipe-b-dp-4.html>
>         (Intel XE#294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/294>) +1
>         other test fail
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) +1
>         other test fail
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html>
>         (Intel XE#1551
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html>
>         (Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019> /
>         Intel XE#2226
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_evict@evict-beng-cm-threads-large:
>
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>  *
>
>     igt@xe_evict@evict-beng-large-external-cm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-5/igt@xe_evict@evict-beng-large-external-cm.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +6
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-large-multi-vm-cm:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html>
>         (Intel XE#1600
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-threads-large:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_evict@evict-threads-large.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@xe_evict@evict-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>  *
>
>     igt@xe_exec_balancer@many-execqueues-virtual-rebind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +35 other tests skip
>  *
>
>     igt@xe_exec_balancer@once-parallel-rebind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_balancer@once-parallel-rebind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +67 other tests skip
>  *
>
>     igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +125 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +5
>         other tests skip
>  *
>
>     igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind.html>
>         (Intel XE#1069
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069>)
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>  *
>
>     igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +18
>         other tests skip
>  *
>
>     igt@xe_gt_freq@throttle_basic_api:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_gt_freq@throttle_basic_api.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +10 other tests skip
>  *
>
>     igt@xe_huc_copy@huc_copy:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>  *
>
>     igt@xe_intel_bb@simple-bb:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_intel_bb@simple-bb.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +20 other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@xe_intel_bb@simple-bb.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +18 other tests skip
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>  *
>
>     igt@xe_live_ktest@xe_dma_buf:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_live_ktest@xe_dma_buf.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_live_ktest@xe_dma_buf.html>
>         (Intel XE#2420
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2420>) +1
>         other test fail
>  *
>
>     igt@xe_live_ktest@xe_migrate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_live_ktest@xe_migrate.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>  *
>
>     igt@xe_module_load@force-load:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_module_load@force-load.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>  *
>
>     igt@xe_module_load@unload:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_module_load@unload.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@xe_module_load@unload.html>
>         (Intel XE#1551
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551> /
>         Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>)
>  *
>
>     igt@xe_pat@display-vs-wb-transient:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1337
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>)
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>  *
>
>     igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>)
>  *
>
>     igt@xe_pm@s2idle-exec-after:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html>
>         (Intel XE#1924
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924> /
>         Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>)
>  *
>
>     igt@xe_pm@s3-vm-bind-userptr:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html>
>         (Intel XE#1551
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551> /
>         Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>) +1
>         other test dmesg-warn
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@xe_pm@s3-vm-bind-userptr.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
>  *
>
>     igt@xe_pm@s4-basic-exec:
>
>       o shard-lnl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@xe_pm@s4-basic-exec.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_pm@s4-mocs.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_pm@s4-mocs.html>
>         (Intel XE#2280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280>)
>  *
>
>     igt@xe_query@multigpu-query-engines:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2
>         other tests skip
>
>
>         Possible fixes
>
>  *
>
>     igt@fbdev@pan:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@fbdev@pan.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-1/igt@fbdev@pan.html>
>         +2 other tests pass
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1659
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html>
>         +24 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-rmfb:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_flip@flip-vs-rmfb.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_flip@flip-vs-rmfb.html>
>         +31 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-wf_vblank-interruptible:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html>
>         (Intel XE#2366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2366>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html>
>         +2 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html>
>         +21 other tests pass
>  *
>
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html>
>         (Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane@plane-position-hole:
>
>       o shard-lnl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane@plane-position-hole.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_plane@plane-position-hole.html>
>         +1 other test pass
>  *
>
>     {igt@kms_plane@plane-position-hole@pipe-b-plane-4}:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html>
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html>
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-180:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-180.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-180.html>
>         +43 other tests pass
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-basic:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-basic.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic.html>
>         +63 other tests pass
>  *
>
>     igt@xe_exec_threads@threads-userptr-rebind-err:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_exec_threads@threads-userptr-rebind-err.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@xe_exec_threads@threads-userptr-rebind-err.html>
>         +71 other tests pass
>  *
>
>     igt@xe_gt_freq@freq_reset_multiple:
>
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620> /
>         Intel XE#1760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html>
>  *
>
>     igt@xe_pm@s2idle-basic:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_pm@s2idle-basic.html>
>         (Intel XE#1924
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924> /
>         Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@xe_pm@s2idle-basic.html>
>  *
>
>     igt@xe_pm@s3-vm-bind-unbind-all:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1941
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html>
>  *
>
>     igt@xe_pm@s4-multiple-execs:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html>
>  *
>
>     igt@xe_pm@s4-vm-bind-prefetch:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_pm@s4-vm-bind-prefetch.html>
>         (Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_pm@s4-vm-bind-prefetch.html>
>
>
>         Warnings
>
>  *
>
>     igt@core_hotunplug@hotunbind-rebind:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html>
>         (Intel XE#2421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@core_hotunplug@unbind-rebind:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@core_hotunplug@unbind-rebind.html>
>         (Intel XE#2421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@core_hotunplug@unbind-rebind.html>
>         (Intel XE#1885
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885>)
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@core_hotunplug@unbind-rebind.html>
>         (Intel XE#2421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@core_hotunplug@unbind-rebind.html>
>         (Intel XE#1885
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885>)
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#623
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#623
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-0:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>         (Intel XE#1725
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2
>         other tests skip
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#1467
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#1428
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +6
>         other tests skip
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#1467
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_big_joiner@invalid-modeset:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_big_joiner@invalid-modeset.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_big_joiner@invalid-modeset.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_big_joiner@invalid-modeset.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +2 other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +62
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1399
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399>) +9
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#1399
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>         +13 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9
>         other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +17
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +34
>         other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html>
>         (Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>)
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html>
>         (Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_color@ctm-limited-range:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_chamelium_color@ctm-limited-range.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_chamelium_color@ctm-limited-range.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_chamelium_color@ctm-max:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_edid@dp-edid-resolution-list:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-resolution-list.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-resolution-list.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +2 other tests skip
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@dp-crc-fast:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_chamelium_frames@dp-crc-fast.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-fast.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_chamelium_frames@dp-crc-fast.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_chamelium_frames@dp-crc-fast.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-fast:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-fast.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-fast.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-single:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc-single.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc-single.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_content_protection@srm.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_content_protection@srm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_content_protection@type1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_content_protection@type1.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3
>         other tests skip
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_content_protection@uevent.html>
>         (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_content_protection@uevent.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-32x32:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-32x32.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-32x32.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1
>         other test skip
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (Intel XE#1413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x170:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x64:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>  *
>
>     igt@kms_feature_discovery@psr1:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#1135
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +1
>         other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +3
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +15
>         other tests skip
>  *
>
>     igt@kms_force_connector_basic@force-edid:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_force_connector_basic@force-edid.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_force_connector_basic@force-edid.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-rte:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-rte.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-rte.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +10
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>         +35 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +20
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-slowdraw:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-slowdraw.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +9
>         other tests skip
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +13
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +13
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#1158
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +15
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_getfb@getfb-reject-ccs:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_getfb@getfb-reject-ccs.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_getfb@getfb-reject-ccs.html>
>         (Intel XE#605
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/605>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#605
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/605>)
>  *
>
>     igt@kms_hdmi_inject@inject-4k:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_hdmi_inject@inject-4k.html>
>         (Intel XE#1470
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_hdmi_inject@inject-4k.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_hdr@static-toggle.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_hdr@static-toggle.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_plane_cursor@primary:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_plane_cursor@primary.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_plane_cursor@primary.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_plane_multiple@tiling-y:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +3 other tests skip
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_pm_backlight@fade.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#736
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/736>)
>  *
>
>     igt@kms_pm_dc@dc5-dpms-negative:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-negative.html>
>         (Intel XE#1131
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>  *
>
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1128
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_psr@fbc-pr-cursor-plane-move:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-plane-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3
>         other tests skip
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-primary-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +6
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-blt.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1
>         other test skip
>  *
>
>     igt@kms_psr@pr-cursor-render:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_psr@pr-cursor-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_psr@pr-cursor-render.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_psr@psr2-sprite-plane-move:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr@psr2-sprite-plane-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_psr@psr2-sprite-plane-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +4
>         other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_rmfb@close-fd:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rmfb@close-fd.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_rmfb@close-fd.html>
>         (Intel XE#294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/294>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_rmfb@close-fd.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_rmfb@close-fd.html>
>         (Intel XE#294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/294>)
>  *
>
>     igt@kms_rotation_crc@bad-tiling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#1437
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html>
>         (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>  *
>
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>  *
>
>     igt@kms_writeback@writeback-check-output:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_writeback@writeback-check-output.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_writeback@writeback-check-output.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_writeback@writeback-invalid-parameters:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_writeback@writeback-invalid-parameters.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_writeback@writeback-invalid-parameters.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@xe_compute@ccs-mode-compute-kernel:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html>
>         (Intel XE#1050
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_compute@ccs-mode-compute-kernel.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_compute@ccs-mode-compute-kernel.html>
>         (Intel XE#1447
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0x3fff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0x3fff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfd:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +8
>         other tests skip
>  *
>
>     igt@xe_evict@evict-cm-threads-large:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-large:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html>
>         (Intel XE#1041
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_evict@evict-mixed-threads-large:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>  *
>
>     igt@xe_evict@evict-small-external-cm:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_evict@evict-small-external-cm.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_evict@evict-small-external-cm.html>
>         (Intel XE#1069
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069>)
>  *
>
>     igt@xe_evict@evict-threads-small-multi-vm:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_evict@evict-threads-small-multi-vm.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@xe_evict@evict-threads-small-multi-vm.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-basic:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-basic.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +5
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-basic:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_exec_fault_mode@once-basic.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_exec_fault_mode@once-basic.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +10 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +10
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +9
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +5
>         other tests skip
>  *
>
>     igt@xe_live_ktest@xe_bo:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_live_ktest@xe_bo.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_live_ktest@xe_bo.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@xe_module_load@many-reload:
>
>       o shard-dg2-set2: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_module_load@many-reload.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_module_load@many-reload.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@xe_module_load@reload:
>
>       o shard-dg2-set2: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_module_load@reload.html>
>         (Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_module_load@reload.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@xe_module_load@reload-no-display:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_module_load@reload-no-display.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_module_load@reload-no-display.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204> /
>         Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>  *
>
>     igt@xe_peer2peer@write:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_peer2peer@write.html>
>         (Intel XE#1061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_peer2peer@write.html>
>         (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>)
>  *
>
>     igt@xe_pm@d3cold-basic-exec:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@s3-basic:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_pm@s3-basic.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-5/igt@xe_pm@s3-basic.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
>  *
>
>     igt@xe_pm@s3-exec-after:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_pm@s3-exec-after.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_pm@s3-exec-after.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_query@multigpu-query-config:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_query@multigpu-query-config.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_query@multigpu-query-config.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-hwconfig:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +2
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-invalid-size:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@xe_query@multigpu-query-invalid-size.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-mem-usage:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_vm@large-split-binds-268435456:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_vm@large-split-binds-268435456.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_vm@large-split-binds-268435456.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +6
>         other tests skip
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_7942 -> IGTPW_11493
>   * Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d ->
>     xe-1690-277a79bf0ef669d9b96f6787906f4e5edb827a33
>
> IGTPW_11493: 11493
> IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 
> 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d
> xe-1690-277a79bf0ef669d9b96f6787906f4e5edb827a33: 
> 277a79bf0ef669d9b96f6787906f4e5edb827a33
>
--------------JZSdmFdMMgoFlIqVPcfkIBiC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Looks like the xe unload is being help up some open jobs. Will do
      a retest on this.</p>
    <p>Thanks,</p>
    <p>Suja<br>
    </p>
    <div class="moz-cite-prefix">On 7/30/2024 8:42 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172235234801.429116.16595380527478547963@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel: Add tests to run suspend without display
              (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/130239/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/130239/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_7942_full -&gt;
        XEIGTPW_11493_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_11493_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_11493_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (3 -&gt; 3)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_11493_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_atomic@crtc-invalid-params:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_atomic@crtc-invalid-params.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_atomic@crtc-invalid-params.html" moz-do-not-send="true">SKIP</a> +46 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_interruptible@legacy-dpms:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_atomic_interruptible@legacy-dpms.html" moz-do-not-send="true">SKIP</a> +12 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> +6 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> +11 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_vrr@flipline.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_vrr@flipline.html" moz-do-not-send="true">FAIL</a> +3 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>{igt@xe_pm@s2idle-without-display} (NEW):</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@xe_pm@s2idle-without-display.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_pm@s2idle-without-display.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotunbind-rebind:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@core_hotunplug@hotunbind-rebind.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421" moz-do-not-send="true">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@core_hotunplug@hotunbind-rebind.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512" moz-do-not-send="true">Intel XE#1512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-send="true">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html" moz-do-not-send="true">SKIP</a> +7 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send="true">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413" moz-do-not-send="true">Intel XE#1413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-512x170.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-connector-state:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352" moz-do-not-send="true">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_force_connector_basic@force-connector-state.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> +8 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> +5 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> +9 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-y:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_plane_multiple@tiling-y.html" moz-do-not-send="true">SKIP</a> +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498" moz-do-not-send="true">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318" moz-do-not-send="true">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-cursor-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr@pr-cursor-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_psr@pr-cursor-render.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437" moz-do-not-send="true">Intel XE#1437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-none:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_scaling_modes@scaling-mode-none.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374" moz-do-not-send="true">Intel XE#374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-none.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2180" moz-do-not-send="true">Intel XE#2180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send="true">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>{igt@core_getversion@all-cards}:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@core_getversion@all-cards.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@core_getversion@all-cards.html" moz-do-not-send="true">FAIL</a></li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@core_getversion@all-cards.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@core_getversion@all-cards.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p}:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send="true">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p}:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512" moz-do-not-send="true">Intel XE#1512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p}:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_7942_full and
        XEIGTPW_11493_full:</p>
      <h3>New IGT tests (3)</h3>
      <ul>
        <li>
          <p>igt@xe_pm@s2idle-without-display:</p>
          <ul>
            <li>Statuses : 2 fail(s)</li>
            <li>Exec time: [9.91, 11.26] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-without-display:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-without-display:</p>
          <ul>
            <li>Statuses : 2 fail(s)</li>
            <li>Exec time: [9.95, 11.25] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_11493_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@fbdev@write:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@fbdev@write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134" moz-do-not-send="true">Intel XE#2134</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-invalid-params-fence:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +37 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426" moz-do-not-send="true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send="true">Intel XE#1407</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-dp-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-dp-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399" moz-do-not-send="true">Intel XE#1399</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +76 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_chamelium_color@ctm-blue-to-red.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@vga-frame-dump:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send="true">Intel XE#308</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413" moz-do-not-send="true">Intel XE#1413</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-64x21.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send="true">Intel XE#1424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_edge_walk@256x256-top-edge.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-edge.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-a.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send="true">Intel XE#877</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804" moz-do-not-send="true">i915#3804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_fbcon_fbt@psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776" moz-do-not-send="true">Intel XE#776</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019" moz-do-not-send="true">Intel XE#2019</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@busy-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_flip@busy-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send="true">Intel XE#2049</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +44 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_hdr@bpc-switch.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_hdr@bpc-switch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-htotal:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_invalid_mode@bad-htotal.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_lease@multimaster-lease:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_lease@multimaster-lease.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_lease@multimaster-lease.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162" moz-do-not-send="true">Intel XE#1162</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019" moz-do-not-send="true">Intel XE#2019</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_plane@plane-position-covered.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-5/igt@kms_plane@plane-position-covered.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318" moz-do-not-send="true">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318" moz-do-not-send="true">Intel XE#2318</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318" moz-do-not-send="true">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318" moz-do-not-send="true">Intel XE#2318</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318" moz-do-not-send="true">Intel XE#2318</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122" moz-do-not-send="true">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-5/igt@kms_psr2_su@page_flip-p010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128" moz-do-not-send="true">Intel XE#1128</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-suspend:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_psr@fbc-psr2-suspend.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028" moz-do-not-send="true">Intel XE#2028</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-cursor-plane-onoff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_psr@pr-cursor-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-primary-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-5/igt@kms_psr@pr-primary-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rmfb@close-fd@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_rmfb@close-fd@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294" moz-do-not-send="true">Intel XE#294</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rmfb@close-fd@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_rmfb@close-fd@pipe-b-dp-4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294" moz-do-not-send="true">Intel XE#294</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899" moz-do-not-send="true">Intel XE#899</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551" moz-do-not-send="true">Intel XE#1551</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019" moz-do-not-send="true">Intel XE#2019</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226" moz-do-not-send="true">Intel XE#2226</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send="true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123" moz-do-not-send="true">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send="true">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-cm-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392" moz-do-not-send="true">Intel XE#392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-large-external-cm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-5/igt@xe_evict@evict-beng-large-external-cm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600" moz-do-not-send="true">Intel XE#1600</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_evict@evict-threads-large.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@xe_evict@evict-threads-large.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392" moz-do-not-send="true">Intel XE#392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-execqueues-virtual-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +35 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@once-parallel-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_balancer@once-parallel-rebind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +67 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +125 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069" moz-do-not-send="true">Intel XE#1069</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@throttle_basic_api:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_gt_freq@throttle_basic_api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_huc_copy@huc_copy:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@xe_huc_copy@huc_copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255" moz-do-not-send="true">Intel XE#255</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_intel_bb@simple-bb:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_intel_bb@simple-bb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +20 other
              tests skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@xe_intel_bb@simple-bb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send="true">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send="true">Intel XE#2229</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_dma_buf:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_live_ktest@xe_dma_buf.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_live_ktest@xe_dma_buf.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2420" moz-do-not-send="true">Intel XE#2420</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_live_ktest@xe_migrate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192" moz-do-not-send="true">Intel XE#1192</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@force-load:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_module_load@force-load.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378" moz-do-not-send="true">Intel XE#378</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@unload:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_module_load@unload.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@xe_module_load@unload.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551" moz-do-not-send="true">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019" moz-do-not-send="true">Intel XE#2019</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@display-vs-wb-transient:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337" moz-do-not-send="true">Intel XE#1337</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelpg:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173" moz-do-not-send="true">Intel XE#1173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-exec-after:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924" moz-do-not-send="true">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028" moz-do-not-send="true">Intel XE#2028</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-userptr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551" moz-do-not-send="true">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569" moz-do-not-send="true">Intel XE#569</a>) +1 other test
              dmesg-warn</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@xe_pm@s3-vm-bind-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584" moz-do-not-send="true">Intel XE#584</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic-exec:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@xe_pm@s4-basic-exec.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-mocs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_pm@s4-mocs.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_pm@s4-mocs.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280" moz-do-not-send="true">Intel XE#2280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-engines:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_query@multigpu-query-engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +2 other tests
              skip</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@fbdev@pan:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@fbdev@pan.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-1/igt@fbdev@pan.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659" moz-do-not-send="true">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">PASS</a> +24 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_flip@flip-vs-rmfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_flip@flip-vs-rmfb.html" moz-do-not-send="true">PASS</a> +31 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2366" moz-do-not-send="true">Intel XE#2366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html" moz-do-not-send="true">PASS</a> +21 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028" moz-do-not-send="true">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane@plane-position-hole.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_plane@plane-position-hole.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_plane@plane-position-hole@pipe-b-plane-4}:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-suspend:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html" moz-do-not-send="true">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-180:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-180.html" moz-do-not-send="true">PASS</a> +43 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic.html" moz-do-not-send="true">PASS</a> +63 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-userptr-rebind-err:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_exec_threads@threads-userptr-rebind-err.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@xe_exec_threads@threads-userptr-rebind-err.html" moz-do-not-send="true">PASS</a> +71 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_reset_multiple:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620" moz-do-not-send="true">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760" moz-do-not-send="true">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-basic:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_pm@s2idle-basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924" moz-do-not-send="true">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028" moz-do-not-send="true">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@xe_pm@s2idle-basic.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162" moz-do-not-send="true">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941" moz-do-not-send="true">Intel XE#1941</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-multiple-execs:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_pm@s4-vm-bind-prefetch.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019" moz-do-not-send="true">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_pm@s4-vm-bind-prefetch.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotunbind-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421" moz-do-not-send="true">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@core_hotunplug@unbind-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@core_hotunplug@unbind-rebind.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421" moz-do-not-send="true">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@core_hotunplug@unbind-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885" moz-do-not-send="true">Intel XE#1885</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@core_hotunplug@unbind-rebind.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421" moz-do-not-send="true">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@core_hotunplug@unbind-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885" moz-do-not-send="true">Intel XE#1885</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623" moz-do-not-send="true">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623" moz-do-not-send="true">Intel XE#623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send="true">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-0.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725" moz-do-not-send="true">Intel XE#1725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>) +2 other tests
              skip</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send="true">Intel XE#1407</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619" moz-do-not-send="true">Intel XE#619</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467" moz-do-not-send="true">Intel XE#1467</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610" moz-do-not-send="true">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428" moz-do-not-send="true">Intel XE#1428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +6 other tests
              skip</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619" moz-do-not-send="true">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467" moz-do-not-send="true">Intel XE#1467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_joiner@invalid-modeset:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_big_joiner@invalid-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346" moz-do-not-send="true">Intel XE#346</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_big_joiner@invalid-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_big_joiner@invalid-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346" moz-do-not-send="true">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +62 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399" moz-do-not-send="true">Intel XE#1399</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399" moz-do-not-send="true">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +34 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252" moz-do-not-send="true">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252" moz-do-not-send="true">Intel XE#1252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314" moz-do-not-send="true">Intel XE#314</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314" moz-do-not-send="true">Intel XE#314</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314" moz-do-not-send="true">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314" moz-do-not-send="true">Intel XE#314</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-limited-range:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_chamelium_color@ctm-limited-range.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_chamelium_color@ctm-limited-range.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-max:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-resolution-list.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-resolution-list.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-fast:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_chamelium_frames@dp-crc-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_chamelium_frames@dp-crc-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_chamelium_frames@dp-crc-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc-single.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc-single.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307" moz-do-not-send="true">Intel XE#307</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307" moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-send="true">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_content_protection@srm.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_content_protection@srm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_content_protection@type1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_content_protection@type1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_content_protection@uevent.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188" moz-do-not-send="true">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send="true">Intel XE#308</a>) +1 other test
              skip</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413" moz-do-not-send="true">Intel XE#1413</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send="true">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send="true">Intel XE#1424</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send="true">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send="true">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138" moz-do-not-send="true">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138" moz-do-not-send="true">Intel XE#1138</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr1:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135" moz-do-not-send="true">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-edid:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_force_connector_basic@force-edid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_force_connector_basic@force-edid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352" moz-do-not-send="true">Intel XE#352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-rte:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +35 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-slowdraw.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658" moz-do-not-send="true">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658" moz-do-not-send="true">Intel XE#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +9 other tests
              skip</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658" moz-do-not-send="true">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658" moz-do-not-send="true">Intel XE#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158" moz-do-not-send="true">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_getfb@getfb-reject-ccs:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_getfb@getfb-reject-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_getfb@getfb-reject-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605" moz-do-not-send="true">Intel XE#605</a>)</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605" moz-do-not-send="true">Intel XE#605</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-4k:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_hdmi_inject@inject-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470" moz-do-not-send="true">Intel XE#1470</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_hdmi_inject@inject-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_hdr@static-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_hdr@static-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_plane_cursor@primary.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-send="true">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_plane_cursor@primary.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498" moz-do-not-send="true">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318" moz-do-not-send="true">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318" moz-do-not-send="true">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318" moz-do-not-send="true">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318" moz-do-not-send="true">Intel XE#2318</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318" moz-do-not-send="true">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_pm_backlight@fade.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_pm_backlight@fade.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122" moz-do-not-send="true">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736" moz-do-not-send="true">Intel XE#736</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms-negative:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-negative.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131" moz-do-not-send="true">Intel XE#1131</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129" moz-do-not-send="true">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129" moz-do-not-send="true">Intel XE#1129</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122" moz-do-not-send="true">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128" moz-do-not-send="true">Intel XE#1128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +3 other tests
              skip</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-cursor-render:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_psr@pr-cursor-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_psr@pr-cursor-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr@psr2-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_psr@psr2-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149" moz-do-not-send="true">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rmfb@close-fd:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rmfb@close-fd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_rmfb@close-fd.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294" moz-do-not-send="true">Intel XE#294</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_rmfb@close-fd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@kms_rmfb@close-fd.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294" moz-do-not-send="true">Intel XE#294</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-tiling:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327" moz-do-not-send="true">Intel XE#327</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_rotation_crc@bad-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437" moz-do-not-send="true">Intel XE#1437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327" moz-do-not-send="true">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327" moz-do-not-send="true">Intel XE#327</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send="true">Intel XE#1127</a>)</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send="true">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327" moz-do-not-send="true">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-270:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327" moz-do-not-send="true">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327" moz-do-not-send="true">Intel XE#327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435" moz-do-not-send="true">Intel XE#1435</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729" moz-do-not-send="true">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362" moz-do-not-send="true">Intel XE#362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_writeback@writeback-check-output.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send="true">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_writeback@writeback-check-output.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send="true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send="true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send="true">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-invalid-parameters:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send="true">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send="true">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-compute-kernel:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050" moz-do-not-send="true">Intel XE#1050</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_compute@ccs-mode-compute-kernel.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_compute@ccs-mode-compute-kernel.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447" moz-do-not-send="true">Intel XE#1447</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280" moz-do-not-send="true">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123" moz-do-not-send="true">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123" moz-do-not-send="true">Intel XE#1123</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send="true">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send="true">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send="true">Intel XE#1126</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-cm-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392" moz-do-not-send="true">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041" moz-do-not-send="true">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392" moz-do-not-send="true">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392" moz-do-not-send="true">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392" moz-do-not-send="true">Intel XE#392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-external-cm:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_evict@evict-small-external-cm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_evict@evict-small-external-cm.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069" moz-do-not-send="true">Intel XE#1069</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-threads-small-multi-vm:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_evict@evict-threads-small-multi-vm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@xe_evict@evict-threads-small-multi-vm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_exec_fault_mode@once-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_exec_fault_mode@once-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_live_ktest@xe_bo.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192" moz-do-not-send="true">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-466/igt@xe_live_ktest@xe_bo.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@many-reload:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_module_load@many-reload.html" moz-do-not-send="true">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_module_load@many-reload.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_module_load@reload.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019" moz-do-not-send="true">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_module_load@reload.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload-no-display:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_module_load@reload-no-display.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-send="true">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_module_load@reload-no-display.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-send="true">Intel XE#1204</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@write:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_peer2peer@write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061" moz-do-not-send="true">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_peer2peer@write.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173" moz-do-not-send="true">Intel XE#1173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic-exec:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_pm@d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@xe_pm@d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-basic:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_pm@s3-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-5/igt@xe_pm@s3-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584" moz-do-not-send="true">Intel XE#584</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-exec-after:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_pm@s3-exec-after.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584" moz-do-not-send="true">Intel XE#584</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-6/igt@xe_pm@s3-exec-after.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579" moz-do-not-send="true">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@xe_pm@vram-d3cold-threshold.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579" moz-do-not-send="true">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-config:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_query@multigpu-query-config.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-435/igt@xe_query@multigpu-query-config.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-hwconfig:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-434/igt@xe_query@multigpu-query-hwconfig.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-436/igt@xe_query@multigpu-query-invalid-cs-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>)</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-size:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-lnl-4/igt@xe_query@multigpu-query-invalid-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-mem-usage:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@large-split-binds-268435456:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_vm@large-split-binds-268435456.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11493/shard-dg2-432/igt@xe_vm@large-split-binds-268435456.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +6 other tests
              skip</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_7942 -&gt; IGTPW_11493</li>
        <li>Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d
          -&gt; xe-1690-277a79bf0ef669d9b96f6787906f4e5edb827a33</li>
      </ul>
      <p>IGTPW_11493: 11493<br>
        IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d:
        3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d<br>
        xe-1690-277a79bf0ef669d9b96f6787906f4e5edb827a33:
        277a79bf0ef669d9b96f6787906f4e5edb827a33</p>
    </blockquote>
  </body>
</html>

--------------JZSdmFdMMgoFlIqVPcfkIBiC--
