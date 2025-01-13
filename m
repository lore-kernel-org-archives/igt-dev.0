Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7945C02180
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 14:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8548210E6A0;
	Mon, 13 Jan 2025 14:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQnWBvVS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA2610E6A4
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 14:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736779760; x=1768315760;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zq4tFs76ViQMFJXaVmKvAKi8p2W3vGSZ/qm8AbklxpM=;
 b=YQnWBvVSC9g3sTjZj92BQAQEZSvO96ByzmjRGl+Iq83JtRGC8lKpwETG
 yofVsTqH785F10fFNrOdLw0UZOzaykkGKsYGyJ0zNAIjQBRYeGozGRRQO
 qMTIh4xK1YaSv5tVKm6yAs/sfsMHogi+M1eqhtVfm5jm2R5rwgh4GUHoe
 e7dJ1iqJm0ew5joBhXT5NlT6ACwMPeayNvud2Tt4k7r+7NwhldlWA5rtQ
 DxGQGB4sohEjYmgd564WzC3n9GyJZx8wtlhrsBtK5ijYu/xvaUBjyHdaB
 /wHbBC/uxqc7mJVnGEUzQnsGhZgvC2hDLS9mcnEvXdJhfJmLk3RfK74GP Q==;
X-CSE-ConnectionGUID: lyDWkD/lSkOB15HbRcl2xQ==
X-CSE-MsgGUID: DyIjS2s0RQKe2C6YB1JgCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36952647"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="36952647"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 06:49:19 -0800
X-CSE-ConnectionGUID: YY4N2VRwTQKlAeaIorLR/A==
X-CSE-MsgGUID: W9TRCdoBRxaGIU79B3UL/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="104584531"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 06:49:19 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 06:49:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 06:49:18 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 06:49:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3v7DAnGzTfQeLzpZrTxjLNiWsVDolGyd+hza5aSQ8LqCU1rD9nbKWSr8+qyrjQEnuQrJfdgFSSh1dFD1IicUdKGieoo0Zta/VkmxabIqxNYtwKp3GNIFrY3/nPqkXT6+3Mo/rRf1zZtC4GSejJpR1hxhikx6tO+lbtBMIxIC5/0Jx213pn4rjTdpD0NVeRx8lyBYpeBh+ylBYQdqmdBv1P8hbeumeSydWzUykl/3k+efBLbGkh9sAqBLrhUiHwGMUkuMLr0lWksyUF8oXzdKsgR0LSI1E7TZxotAnb4cLivn99TCVxIip+YD0eeERHMDbeYzmNEp98ZxAdqTo0s2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okchtqs2VMyWS8B8xSSfUoqP/nUoJ8B8rpRSoL23soc=;
 b=IH4pqrP5wrJOXwpcoOibQ96oozU2Ho/MlvZ6jXSAsKqhh6DNNUuoX/a4lCwq40wzRFFmTZE6uNoomnaJg5qY/2gEC9rf7DU/k+QVdKnYgj7RFuPl8eux4KM+x4LL+FeP5zx8d+kHXl/BIxsJ5DbzQiux9uNIryRXt0uKtHKBAxWzC1h7crdgebd2Aubyysc99c0mef+hkWkmrN1ieY2/AKzPNxvOe6GB+WwnAGW3Bch0IyTQr5aPl9+lQDSisYH6D+3OE9J0RPUpBBC49iW3c4J7kH39d1SDJhc4421PU82NM3n3+mi3EhSt9rqIf3TabqRg4tIW/lb0pcIX5xv62w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB6332.namprd11.prod.outlook.com (2603:10b6:510:1fc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 14:49:13 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 14:49:13 +0000
Message-ID: <1a0fdf52-375e-4e3e-92d3-17766e71727b@intel.com>
Date: Mon, 13 Jan 2025 09:49:11 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Fexec=5Fcapture=3A_Add_xe=5Fexec=5Fcapture_test_=28rev10=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20250109004403.58162-1-zhanjun.dong@intel.com>
 <173657326155.2189926.14980677364995391392@b555e5b46a47>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <173657326155.2189926.14980677364995391392@b555e5b46a47>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::14) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB6332:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab24484-2682-4677-47b0-08dd33e1720b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M05MZVNLbkM3SzllZ1dEYTluRU1WWndpOEZGQ2hxOGFiSkRFVGN0L3dSL0Z5?=
 =?utf-8?B?dnJDV21IV2dnWVp4dkJVMndXT2UrNGs5OHZ5ODJwVjR3N2FKdHVEbGd2YW4y?=
 =?utf-8?B?QkJGRnNwaEVCM05ndlZTTmtnT2JEb21tRTQ5bmFlUmkzTWsxRytOOVppcTMz?=
 =?utf-8?B?c3FwcEVuV1Zhbmtqa1pwT1BKeXRpc25xa2JFRnJJRE1VWDB0d1d5MmMybEtF?=
 =?utf-8?B?U1J4WDdVSnRoaVhFN1dQTUhUNEVSbjhCZWU5RzR0ZzZPNzNxNDZGUFo3ZmhF?=
 =?utf-8?B?RElTUWZFRExVREtORHd2SWdQRVlETWg1NVRHekxISTlaSkVqU1ZacjhNVE1L?=
 =?utf-8?B?a2w5SVc2V2p5U21qaGlFd2tvK21US1czMHk3R1RXV0lhMWRtZFpFRkg4Wkty?=
 =?utf-8?B?Ym01eFpUaGpLVVNMQmRsRTE0VG1iMmU3K2J6UmVMRS9ZRTlVTkk2cnoyR0hv?=
 =?utf-8?B?QWFrRUQyRExBN1NCWVdKRG90QllJMjhWRmVBS1NJNXMzTXpxTnZWQ1FPYmZW?=
 =?utf-8?B?cysrazExT3FyS1Nud1M0bWUyNFExV3RsMk9ickZ1elNHbmJFemQrVkFUL0hE?=
 =?utf-8?B?anJsWUxwRmtxL0p0UjJ4SmRSY0NLVC9sOVVTVHJhbzNjRkNjNno4NUlLaHNn?=
 =?utf-8?B?dWJSZmNkVFZYcVVSVG9hYk1iL3kzMnl3eHRLVVpTMHJUSUpkS2pTZnoyYkZS?=
 =?utf-8?B?dVU2Z1JFaktMUmhtSUxFSE9nR2JhWkpUbDdPTGxQVktVZ0pSVUFBNGpRVngy?=
 =?utf-8?B?WXhmVndFdlBzN1orZEZ3QkJJb1Zqa1BrTUtINnEvdW9jOXFzQ2dQaGU4Umpr?=
 =?utf-8?B?OVo1aEYrUWE5WXF4REJqS3RjMitTaTk5b0s0eE1PblI2TFdiaDFvS3lvdzRz?=
 =?utf-8?B?NE9vcitYYXRTNnExY09ORVhRcFZTVG9hSVF2NUVtUW9HTE1CS1Z0N3kyR241?=
 =?utf-8?B?Ymg0KzhyWjNJdENnQ3NHOU92TFNLcXVlSCthY0M2ZEFGditRWGlzSmp0cVN4?=
 =?utf-8?B?M3UzZitlQzlPdUdYMkhzTk1zcC9sTjR0V2h5Uk1zeXBQZEJiSG9ObTY1bVNi?=
 =?utf-8?B?VkJ4NG9VRDFjMEtvaGZsVW5kWWJjc1Z1dkpYalFzWWtsR1FZdkFPOG1WUStt?=
 =?utf-8?B?alhrYUEwcWpOZmRNN2Exc2p1V3dSUVNjaEVoY01OdTBkbzVaYkpoa3JQTGY4?=
 =?utf-8?B?WFRiS2F3dm1VRm0yVHpCNGs5V2VBZkdwdUdWYmlGd0hMNzhibnBPbW83Mjlz?=
 =?utf-8?B?TTFEVG11NTBSQXNPMkhEWGtXai9tcXhvamtQSmp0YUZocm0wREhpQVMrTTYr?=
 =?utf-8?B?S1BkQ2NKQVRPMSthM1lpRHhIZFh5a1FVUitRWjhJTXJTNGZzam5ZUHUvNmJm?=
 =?utf-8?B?T1FWSG95aXJsa1ZUdzJaTERYZFpXdUhsdXpNcU5GVU0zaEJDZHNkQ3pjYkk3?=
 =?utf-8?B?eEZHUGRzNHQ1UDRmNTFobm9ETHFKblZjWWlvWUdNRDdTdVh6ZEdqVUl4UWRD?=
 =?utf-8?B?SlFuY2JuWDl0VXZlK3BUd2tyelFOa0VpMmpxQ1VhV2twdE9yUjJGZlR5NkI3?=
 =?utf-8?B?ZnpLUlFMM0xTY0ZPVXE5cSsyZzJBS29JNDVObnNKbDc2bVVmY1V4VFZFWFVZ?=
 =?utf-8?B?SmpweEI1K0pyMFQrVERXR1N4VVJ2YWc2aEs2TUQrRmdhaERCY25yTGFJMStT?=
 =?utf-8?B?Yk5tSkhLRDlKRldFL0dnd0pvUjdlNmZlaHRrN2c0NGR5N25WaXhLeXYvRm9s?=
 =?utf-8?Q?5PnVRZnsYW+dReSDUV3C+6TM7P+Kd2vdezeBU2M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFFIZW9IV3c2QzdvTGRpYkVDTXNYWXIwRHFCd3hmbDZubCs5cHVFenZicXM5?=
 =?utf-8?B?aUl4VUlsWEdNbmROU2dZYUJqMFJpV0ZqRCtIZWFFVWNoaFFucjQxaEZzWXc5?=
 =?utf-8?B?MGpldW84bmRtRlpwME0yczdZbC84ZElvQnFMTitVb3AvZTgrdWZ3aVpTOVpt?=
 =?utf-8?B?UjJxMDVSWWl0TmRYNndGMHBaVGRzN0VsdEdRbDNPanpHNTR5eEIzb0pycEVp?=
 =?utf-8?B?b2Q2bFN4MkJTL2xlYVJKdU1RLzZIaVcrQi9xckIzSExabkErbHZPZk8rcWtV?=
 =?utf-8?B?RkFYcHE5OVR5OXhONFhZQTZvUkwyME1Ha3IveWd4M3pVTzgvL290OGVTSnJZ?=
 =?utf-8?B?UjRCY25ZMmJ4SUVIY05LRytPb2xsRDk2WWlhMk95S3plUHpFd1lJZm8zN1hl?=
 =?utf-8?B?MXcyTDJDSkZ2dHdjUHFobEswVXViWlJKaHRpbnI2SUhTeDNRZ0YvWG5FM0t4?=
 =?utf-8?B?TXhDZlBrWlBqdk05SWRPNEpSak9IK3E5bElrZTJGMnQ1dzRWZTM4MFBDQnlk?=
 =?utf-8?B?VTNtdFA3SUJHTXc0d25CWFZuYTJFZWJTb2NXR1JWMzVoQ3h3aDI2aU96MFht?=
 =?utf-8?B?ZEpuSDNxb0hpMWRTckVoQkd5RUdpVkN6U2xDMVRKOGY4TmJPREF3WTEvM01D?=
 =?utf-8?B?QkJlclJScEVXQ1JET3ZFN3pWam9WcTBSd1ZmZCtzam5BYU5qRm1Hd2Rqa0o1?=
 =?utf-8?B?S2lqL1lIZ0hFNldvOVRtZjlRdkJYSXhBank4S2JOS1YrUmN0TnN4dXd0Z2hX?=
 =?utf-8?B?RDNCdWxVb1RTaEFkSlZzejJETmYvVXI0NWVIM0NCWVE1QmFhNU02M0Vrc01a?=
 =?utf-8?B?MFFyRVUydzhCWDNLNHRINlo0Mm5SZWs0VjFic3oxVWxlN0JrVm55N2VWSEU5?=
 =?utf-8?B?d1NSL3F2NE9BL1FMcm1XZVkrTmRGUWxKdDBHM1BIdzFBTEY2NVkwY1B1SkM3?=
 =?utf-8?B?WVVhZ05EZVdtVHVPK3JZNzVPa1hHMTJmNnUwOEQvelBDWk5tcE9MUGt0dTF5?=
 =?utf-8?B?WDNMZk5KRklaYTFIZWJJK1Ezd05iT2txRUZjTm9YbFJZUmd1OUFnR1NhNU1Y?=
 =?utf-8?B?OUlVbzM2bksvMGp6anc4VE51N2NtTDROcGZpWUtzSGxCMWcveWJsUmxGbHV2?=
 =?utf-8?B?Mlp2NE9pMDdKNGx3K01nUkI3cGl0ZWltM0twVWpJMWNpMGx2d0YzN1N4NDNx?=
 =?utf-8?B?SWlDWTJPQVo5RWRUZnJvd1BadllNak5TZzBPMVRBUFVZcTJDOE8xR1BDSUFy?=
 =?utf-8?B?UmF3bUpPUVNKMnZHelBEQ0NvZW80NE9mamtpQ3U2ZTRsaUJoTVZEUk1vNHkz?=
 =?utf-8?B?M1U3ZHNZQVNJWG40b0cvWmwzaDlvbEpSaUphaVRDbGFDRHhaM0JwMVdxUEtU?=
 =?utf-8?B?Wjc4YUQ1VHVMekwwb3pranJpaHZWOXEyZ2tkcEtVMDVOWVZTTm5QRWszYXNw?=
 =?utf-8?B?V1R0K20wZ09wdnEvMzM2Q0VEUzFXazlnM3VRa0pxS2x4aHdrZEpKNFFtYU5a?=
 =?utf-8?B?bzVxZ1h2Q0pwU2JyTWFDeXhBY2hUNGJIU29tWTJXZlRaTy84VW1NSis3ekdk?=
 =?utf-8?B?NE8zNDBDU25LeklMUHFRbExibkIyOTRpeTNIc2x5cThlemFZTi9wcHlKTjFF?=
 =?utf-8?B?KzQ1ckFjM3hQNUEySEtrUmdXL084YzR1ejhVWlJDMitxbHZNYW1BbnhkUEdu?=
 =?utf-8?B?VTJiYlJoZ2ZPWEgvK3hIT2lTSGFTSS9vWDJRaEQ5eXF4TnhJOVJBSGZIaG1p?=
 =?utf-8?B?Y2wwd2xRVXhnNDdtNU9UVUthbWI1aUphRVQvVnA2SkdFbDNvWmVMcVd6MFJL?=
 =?utf-8?B?Mnc3eHBzNFhQcTE3bWhBbDcxSngweHpHQmRtSHRDZlgwb0Y3aUNwTkVEbkdN?=
 =?utf-8?B?d3lVK05VaXdXdVQ4a2V4b3JUM2tHTGFLak8rNzdCWEZ2NHM1OGdvZXpnLzhZ?=
 =?utf-8?B?bjZON1NFejFPdUQwSjBKcWgvQ0loc0dQaGZYK09NUVNBL3paVEd0SGVFZWtt?=
 =?utf-8?B?S1dhWkdXRTFzbnNvOHRHYmszUlJWV2FPY2lVM0ltZjFLZmlRNlJUQTJhN1dl?=
 =?utf-8?B?Ti9RZFpodHI2TERpSjgzZVVVeXlwWkd6cVBWRjNlMXE2S3pCYUo1bHNYVTh4?=
 =?utf-8?B?L2VZQVNoVndWTVJQL0R1U3JpSVB5N0dBWFoxNGpSRjMxUXcyeHJaOSsxbGU2?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab24484-2682-4677-47b0-08dd33e1720b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 14:49:13.3709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJnJgYRewVEJaCnTm+ry/mMlE5aSKVzIeZVFbfNHgcF/yiZhQylqlYRBjPusTS0otdI7pzT+709VfWKpn5RADg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6332
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



On 2025-01-11 12:27 a.m., Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel/xe_exec_capture: Add xe_exec_capture test (rev10)
> *URL:*	https://patchwork.freedesktop.org/series/140007/ <https:// 
> patchwork.freedesktop.org/series/140007/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/ 
> index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_8182_full -> XEIGTPW_12407_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_12407_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12407_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_12407_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-
>     a-dp-4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-436/igt@kms_atomic_transition@plane-all-
>         modeset-transition-fencing@pipe-a-dp-4.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-
>         fencing@pipe-a-dp-4.html>
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-2:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-432/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-2.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a2-dp2:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-432/igt@kms_flip@2x-flip-vs-
>         expired-vblank@bc-hdmi-a2-dp2.html> +2 other tests fail
>   *
> 
>     igt@xe_fault_injection@vm-create-fail-xe_pt_create:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-
>         xe_pt_create.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-bmg-2/igt@xe_fault_injection@vm-
>         create-fail-xe_pt_create.html>
>   *
> 
>     igt@xe_pm_residency@cpg-basic:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-463/igt@xe_pm_residency@cpg-basic.html> ->
>         ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-dg2-432/igt@xe_pm_residency@cpg-basic.html> +1 other test
>         abort
> 
> 
>         Warnings
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-
>         dp-4.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1178>) -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-433/
>         igt@kms_content_protection@srm@pipe-a-dp-4.html>
> 
My change is to add xe_exec_capture test, all above failures on other 
tests are not related to my change.

Regards,
Zhanjun Dong
> 
>     New tests
> 
> New tests have been introduced between XEIGT_8182_full and 
> XEIGTPW_12407_full:
> 
> 
>       New IGT tests (1)
> 
>   * igt@xe_exec_capture@reset:
>       o Statuses : 2 pass(s)
>       o Exec time: [23.42, 33.12] s
> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_12407_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@core_setmaster_vs_auth:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/
>         igt@core_setmaster_vs_auth.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-
>     linear:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-
>         flip-events@pipe-a-edp-1-linear.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-lnl-7/
>         igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-
>         edp-1-linear.html> (Intel XE#911 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/911>) +3 other tests
>         fail
>   *
> 
>     igt@kms_async_flips@invalid-async-flip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-5/igt@kms_async_flips@invalid-
>         async-flip.html> (Intel XE#873 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/873>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-436/igt@kms_atomic_transition@plane-all-
>         modeset-transition-fencing.html> -> INCOMPLETE <https://intel-
>         gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-433/
>         igt@kms_atomic_transition@plane-all-modeset-transition-
>         fencing.html> (Intel XE#2613 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2613>)
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-
>         rotate-270.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2327>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-464/igt@kms_big_fb@4-
>         tiled-8bpp-rotate-270.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-4/igt@kms_big_fb@linear-64bpp-
>         rotate-270.html> (Intel XE#1407 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1407>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-
>         rotate-180-hflip-async-flip.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-8/
>         igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-
>         async-flip.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136> / Intel XE#2231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2231>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-4/igt@kms_big_fb@y-tiled-
>         addfb.html> (Intel XE#1467 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1467>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-433/igt@kms_big_fb@y-tiled-
>         max-hw-stride-32bpp-rotate-180-hflip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4
>         other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-
>         stride-64bpp-rotate-180.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test
>         skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-
>         stride-64bpp-rotate-0-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +7 other
>         tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-2/igt@kms_bw@connected-linear-
>         tiling-3-displays-1920x1080p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-433/igt@kms_bw@connected-
>         linear-tiling-3-displays-2160x1440p.html> (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-434/igt@kms_bw@linear-
>         tiling-2-displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-4/igt@kms_bw@linear-tiling-2-
>         displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-
>         rc-ccs.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12407/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-
>         dg2-rc-ccs.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136> / Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-
>         tiled-mtl-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +6 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-
>         tiled-dg2-rc-ccs-cc.html> -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +3
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +29 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-5/igt@kms_ccs@crc-primary-
>         suspend-y-tiled-ccs.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-
>     hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-433/igt@kms_ccs@crc-sprite-
>         planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +167 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +4 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-434/igt@kms_ccs@random-ccs-
>         data-4-tiled-lnl-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/igt@kms_cdclk@plane-
>         scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-green-to-red:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-4/igt@kms_chamelium_color@ctm-
>         green-to-red.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-
>         change-during-hibernate.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +6 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-4/igt@kms_chamelium_frames@hdmi-
>         crc-nonplanar-formats.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-storm-disable:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-463/
>         igt@kms_chamelium_hpd@dp-hpd-storm-disable.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-6/
>         igt@kms_content_protection@atomic.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-464/
>         igt@kms_content_protection@atomic.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1 other test
>         fail
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-8/
>         igt@kms_content_protection@uevent.html> (Intel XE#3278 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3278>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-4/igt@kms_cursor_crc@cursor-
>         offscreen-512x170.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-max-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-3/igt@kms_cursor_crc@cursor-
>         random-max-size.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-2/igt@kms_cursor_legacy@basic-
>         busy-flip-before-cursor-atomic.html> (Intel XE#2286 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2286>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-4/igt@kms_cursor_legacy@cursora-
>         vs-flipb-atomic.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-
>         varying-size.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-6/igt@kms_cursor_legacy@cursora-
>         vs-flipb-varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +3 other
>         tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-
>         atomic-transitions.html> -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-5/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html>
>         (Intel XE#3226 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3226>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-
>         toggle.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12407/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-
>         toggle.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1475>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-433/
>         igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>         transitions.html> (Intel XE#323 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-464/igt@kms_dither@fb-8bpc-
>         vs-panel-6bpc@pipe-a-hdmi-a-6.html> (i915#3804 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-3/igt@kms_dsc@dsc-with-bpc.html>
>         (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2244>)
>   *
> 
>     igt@kms_feature_discovery@display-2x:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-8/igt@kms_feature_discovery@display-2x.html>
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-bmg-6/igt@kms_feature_discovery@display-2x.html> (Intel
>         XE#2373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-2/
>         igt@kms_feature_discovery@psr2.html> (Intel XE#2374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2374>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-436/
>         igt@kms_feature_discovery@psr2.html> (Intel XE#1135 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>   *
> 
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-8/igt@kms_flip@2x-blocking-
>         absolute-wf_vblank.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-432/igt@kms_flip@2x-flip-vs-
>         expired-vblank.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-
>         interruptible@ad-dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-4/igt@kms_flip@2x-
>         flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html> (Intel
>         XE#3288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3288> / Intel XE#3321 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3321>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-modeset-vs-hang:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-
>         hang.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12407/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-
>         hang.html> (Intel XE#2316 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2316>) +4 other tests skip
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html> (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) +8
>         other tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-
>         recreate.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-
>         recreate.html> (Intel XE#2882 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2882>) +1 other test fail
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@b-dp4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-
>         dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12407/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-
>         dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/301> / Intel XE#3321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3321>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-
>         hdmi-a6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-dg2-434/igt@kms_flip@flip-vs-expired-
>         vblank@c-hdmi-a6.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-lnl-5/igt@kms_flip@flip-vs-suspend.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12407/shard-lnl-7/igt@kms_flip@flip-vs-suspend.html>
>         (Intel XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2049>) +1 other test incomplete
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-8/igt@kms_flip@flip-vs-suspend-
>         interruptible@c-hdmi-a3.html> -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-8/
>         igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html>
>         (Intel XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2597>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-436/
>         igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html> (Intel
>         XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-5/
>         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-434/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-
>         upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) +6 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-3/
>         igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-
>         downscaling.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1745>) +2 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-5/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>         downscaling@pipe-a-valid-mode.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-8/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html>
>         (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2311>) +18 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-
>         render.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2333>) +5 other tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-
>         move.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136> / Intel XE#2231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2231>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html> (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html>
>         (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2313>) +17 other tests skip
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +8 other tests skip
>   *
> 
>     igt@kms_histogram@algo-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-4/igt@kms_histogram@algo-
>         basic.html> (Intel XE#3897 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3897>)
>   *
> 
>     igt@kms_histogram@algo-color:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-8/igt@kms_histogram@algo-
>         color.html> (Intel XE#3897 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3897>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-big-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-1/igt@kms_joiner@invalid-modeset-
>         big-joiner.html> (Intel XE#346 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/346>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/igt@kms_joiner@invalid-
>         modeset-big-joiner.html> (Intel XE#346 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-5/igt@kms_joiner@invalid-modeset-
>         force-ultra-joiner.html> (Intel XE#2934 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-463/igt@kms_joiner@invalid-
>         modeset-force-ultra-joiner.html> (Intel XE#2925 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>   *
> 
>     igt@kms_panel_fitting@legacy:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-4/
>         igt@kms_panel_fitting@legacy.html> (Intel XE#2486 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
>   *
> 
>     igt@kms_plane@planar-pixel-format-settings:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-8/igt@kms_plane@planar-pixel-
>         format-settings.html> (Intel XE#3007 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) +1 other test
>         skip
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/igt@kms_plane@planar-
>         pixel-format-settings.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>   *
> 
>     igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/
>         igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html>
>         (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/616>) +2 other tests fail
>   *
> 
>     igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-5/igt@kms_plane_lowres@tiling-
>         x@pipe-b-edp-1.html> (Intel XE#599 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +3 other tests
>         skip
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-8/igt@kms_plane_scaling@intel-
>         max-src-size.html> (Intel XE#3307 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3307>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-434/
>         igt@kms_plane_scaling@plane-downscale-factor-0-25-with-
>         modifiers@pipe-a.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-434/
>         igt@kms_plane_scaling@plane-downscale-factor-0-25-with-
>         modifiers@pipe-d.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-
>     format@pipe-c:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-3/igt@kms_plane_scaling@plane-
>         downscale-factor-0-5-with-pixel-format@pipe-c.html> (Intel
>         XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2763>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-
>     factor-0-25@pipe-c:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-4/igt@kms_plane_scaling@planes-
>         downscale-factor-0-25-upscale-factor-0-25@pipe-c.html> (Intel
>         XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2763>) +9 other tests skip
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#2392 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2392>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1430>)
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-
>         lpsp.html> (Intel XE#1439 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1439> / Intel XE#836 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-
>         plane-move-continuous-exceed-fully-sf.html> (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-
>         plane-update-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +5 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-463/igt@kms_psr2_sf@psr2-
>         cursor-plane-move-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3 other
>         tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-7/igt@kms_psr2_su@page_flip-
>         nv12.html> (Intel XE#1128 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1128>)
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/igt@kms_psr@fbc-psr2-
>         primary-render.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +8
>         other tests skip
>   *
> 
>     igt@kms_psr@pr-sprite-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-8/igt@kms_psr@pr-sprite-blt.html>
>         (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406>) +1 other test skip
>   *
> 
>     igt@kms_psr@pr-sprite-plane-onoff:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-1/igt@kms_psr@pr-sprite-plane-
>         onoff.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +8 other
>         tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-4/igt@kms_rotation_crc@primary-
>         yf-tiled-reflect-x-0.html> (Intel XE#2330 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2330>)
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-6/igt@kms_setmode@basic-clone-
>         single-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-436/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1500>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-lnl-7/igt@kms_universal_plane@cursor-fb-
>         leak@pipe-b-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-lnl-8/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html> (Intel
>         XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>   *
> 
>     igt@kms_vrr@flip-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-5/igt@kms_vrr@flip-suspend.html>
>         (Intel XE#1499 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1499>)
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-vrr:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-
>         vrr.html> (Intel XE#1499 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1499>)
>   *
> 
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-432/igt@sriov_basic@enable-
>         vfs-bind-unbind-each-numvfs-all.html> (Intel XE#1091 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel
>         XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>   *
> 
>     igt@xe_compute_preempt@compute-threadgroup-preempt@engine-
>     drm_xe_engine_class_compute:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-464/
>         igt@xe_compute_preempt@compute-threadgroup-preempt@engine-
>         drm_xe_engine_class_compute.html> (Intel XE#1280 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-metadata-discovery:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/igt@xe_eudebug@basic-vm-
>         bind-metadata-discovery.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2 other
>         tests skip
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-
>         ufence-reconnect.html> (Intel XE#3889 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3889>)
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-
>         ufence-sigint-client.html> (Intel XE#3889 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3889>)
>   *
> 
>     igt@xe_eudebug_online@interrupt-all-set-breakpoint:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-5/
>         igt@xe_eudebug_online@interrupt-all-set-breakpoint.html> (Intel
>         XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2905>) +2 other tests skip
>   *
> 
>     igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-5/igt@xe_eudebug_online@writes-
>         caching-sram-bb-vram-target-vram.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +4 other
>         tests skip
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-bmg: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-8/igt@xe_evict@evict-beng-mixed-
>         many-threads-small.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-6/igt@xe_evict@evict-beng-mixed-
>         threads-large-multi-vm.html> (Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +3 other tests
>         skip
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-
>         small.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-dg2-432/igt@xe_evict@evict-mixed-many-
>         threads-small.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-
>     userptr-invalidate:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-436/igt@xe_exec_basic@multigpu-many-
>         execqueues-many-vm-bindexecqueue-userptr-invalidate.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-
>         vm-bindexecqueue-userptr-invalidate.html> (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +3
>         other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-2/igt@xe_exec_basic@multigpu-
>         once-bindexecqueue-rebind.html> (Intel XE#2322 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +4 other
>         tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-userptr:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-3/igt@xe_exec_basic@multigpu-
>         once-userptr.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_fault_mode@many-basic-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/
>         igt@xe_exec_fault_mode@many-basic-prefetch.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1
>         other test skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-464/
>         igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-
>         imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/288>) +7 other tests skip
>   *
> 
>     igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-464/igt@xe_fault_injection@vm-create-fail-
>         xe_exec_queue_create_bind.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-435/
>         igt@xe_fault_injection@vm-create-fail-
>         xe_exec_queue_create_bind.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +12 other
>         tests skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-8/igt@xe_fault_injection@vm-
>         create-fail-xe_exec_queue_create_bind.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-2/igt@xe_live_ktest@xe_bo.html>
>         (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1192>)
>   *
> 
>     igt@xe_live_ktest@xe_mocs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-5/igt@xe_live_ktest@xe_mocs.html>
>         (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1192>)
>   *
> 
>     igt@xe_mmap@small-bar:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-436/igt@xe_mmap@small-
>         bar.html> (Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/512>)
>   *
> 
>     igt@xe_module_load@force-load:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-6/igt@xe_module_load@force-
>         load.html> (Intel XE#2457 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2457>)
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-bmg: (PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-1/igt@xe_module_load@load.html>, PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8182/shard-bmg-4/
>         igt@xe_module_load@load.html>) -> (PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-2/
>         igt@xe_module_load@load.html>, SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-1/
>         igt@xe_module_load@load.html>) (Intel XE#2457 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2457>)
>   *
> 
>     igt@xe_oa@disabled-read-error:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/igt@xe_oa@disabled-read-
>         error.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2541> / Intel XE#3573 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +1 other test
>         skip
>   *
> 
>     igt@xe_oa@unprivileged-single-ctx-counters:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-6/igt@xe_oa@unprivileged-single-
>         ctx-counters.html> (Intel XE#2248 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2248>)
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-8/igt@xe_pat@pat-index-
>         xehpc.html> (Intel XE#1420 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1420>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-436/igt@xe_pat@pat-index-
>         xehpc.html> (Intel XE#2838 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2838> / Intel XE#979 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>   *
> 
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-464/
>         igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1173>)
>   *
> 
>     igt@xe_pm@d3cold-mocs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-4/igt@xe_pm@d3cold-mocs.html>
>         (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284>)
>   *
> 
>     igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-464/igt@xe_pm@s2idle-d3cold-
>         basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@s3-basic-exec:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-464/igt@xe_pm@s3-basic-exec.html> -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-432/igt@xe_pm@s3-basic-exec.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_pm_residency@gt-c6-freeze:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-464/igt@xe_pm_residency@gt-c6-freeze.html> ->
>         ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html> (Intel
>         XE#2625 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2625>) +1 other test abort
>   *
> 
>     igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/igt@xe_query@multigpu-
>         query-invalid-uc-fw-version-mbz.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-topology-l3-bank-mask:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-lnl-6/igt@xe_query@multigpu-query-
>         topology-l3-bank-mask.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>   *
> 
>     igt@xe_vm@large-split-misaligned-binds-67108864:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-2/igt@xe_vm@large-split-misaligned-
>         binds-67108864.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-8/igt@xe_vm@large-split-
>         misaligned-binds-67108864.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +15 other
>         tests skip
>   *
> 
>     igt@xe_wedged@wedged-mode-toggle:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html> ->
>         ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html> (Intel
>         XE#3084 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084>)
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html> ->
>         ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html> (Intel
>         XE#3084 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-
>         flip.html> (Intel XE#827 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/827>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-1/igt@kms_async_flips@alternate-
>         sync-async-flip.html> +1 other test pass
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-
>         displays-3840x2160p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2894>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-
>         displays-3840x2160p.html>
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-
>         atomic.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2291>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-bmg-4/igt@kms_cursor_legacy@2x-
>         flip-vs-cursor-atomic.html> +2 other tests pass
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8182/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipa-
>         legacy.html> (Intel XE#3226 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3226>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-bmg-2/
>         igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8182/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-
>         atomic-transitions-varying-size.html> (Intel XE#877 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html>
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race.html>
>         (Intel XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2316>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-
>         race.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-
>         dp2-hdmi-a3.html> (Intel XE#2882 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-
>         a3.html> +2 other tests pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-
>         dp2-hdmi-a3.html> (Intel XE#3321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-
>         a3.html> +1 other test pass
>   *
> 
>     igt@kms_flip@absolute-wf_vblank:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8182/shard-lnl-5/igt@kms_flip@absolute-wf_vblank.html>
>         (Intel XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2049>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-lnl-8/igt@kms_flip@absolute-wf_vblank.html>
>   *
> 
>     igt@kms_flip@absolute-wf_vblank@b-edp1:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8182/shard-lnl-5/igt@kms_flip@absolute-wf_vblank@b-
>         edp1.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12407/shard-lnl-8/igt@kms_flip@absolute-wf_vblank@b-edp1.html>
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8182/shard-dg2-464/igt@kms_flip@flip-vs-blocking-
>         wf-vblank.html> (Intel XE#3937 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3937>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-435/
>         igt@kms_flip@flip-vs-blocking-wf-vblank.html>
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8182/shard-dg2-464/igt@kms_flip@flip-vs-blocking-
>         wf-vblank@a-dp4.html> -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-dg2-435/igt@kms_flip@flip-vs-
>         blocking-wf-vblank@a-dp4.html>
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible.html> (Intel XE#2882 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2882> / Intel
>         XE#3288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3288>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible.html> +1 other test pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@a-dp4.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-
>         dp4.html> +3 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@d-dp2.html> (Intel XE#3288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3288>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html>
>   *
> 
>     igt@kms_flip@flip-vs-rmfb@d-hdmi-a3:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8182/shard-bmg-2/igt@kms_flip@flip-vs-rmfb@d-hdmi-
>         a3.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12407/shard-bmg-5/igt@kms_flip@flip-vs-rmfb@d-hdmi-
>         a3.html> +1 other test pass
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8182/shard-dg2-463/igt@kms_flip@flip-vs-
>         suspend.html> (Intel XE#2049 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2049> / Intel XE#2597 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-433/igt@kms_flip@flip-vs-suspend.html>
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-dp4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8182/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-
>         dp4.html> (Intel XE#2049 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2049>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-dg2-433/igt@kms_flip@flip-vs-
>         suspend@c-dp4.html>
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-
>         to-64bpp-linear-downscaling.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-
>         linear-to-64bpp-linear-downscaling.html> +2 other tests pass
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-pri-shrfb-draw-render.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-
>         draw-render.html> +4 other tests pass
>   *
> 
>     igt@kms_invalid_mode@bad-htotal:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_invalid_mode@bad-htotal.html>
>         (Intel XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3007>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-1/igt@kms_invalid_mode@bad-htotal.html>
>         +8 other tests pass
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-with-
>         clipping-clamping-pixel-formats.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-dg2-433/igt@kms_plane_scaling@plane-scaler-with-clipping-
>         clamping-pixel-formats.html> +7 other tests pass
>   *
> 
>     igt@kms_pm_dc@dc5-dpms:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html> (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html>
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html> (Intel XE#1430
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-lnl-3/igt@kms_pm_dc@dc6-psr.html>
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-non-
>         lpsp.html> (Intel XE#2446 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2446>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-
>         unset-non-lpsp.html>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-
>         lpsp.html> (Intel XE#2446 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2446>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-433/igt@kms_pm_rpm@dpms-
>         mode-unset-non-lpsp.html>
>   *
> 
>     igt@kms_pm_rpm@system-suspend-modeset:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8182/shard-dg2-432/igt@kms_pm_rpm@system-suspend-
>         modeset.html> (Intel XE#2625 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2625>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-433/
>         igt@kms_pm_rpm@system-suspend-modeset.html>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8182/shard-bmg-6/igt@kms_pm_rpm@system-suspend-
>         modeset.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-6/igt@kms_pm_rpm@system-suspend-
>         modeset.html>
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-
>         stealing.html> (Intel XE#1435 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1435>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-4/
>         igt@kms_setmode@invalid-clone-single-crtc-stealing.html>
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-lnl-7/igt@kms_universal_plane@cursor-fb-
>         leak@pipe-a-edp-1.html> (Intel XE#899 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html>
>         +1 other test pass
>   *
> 
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel
>         XE#2159 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2159>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         +1 other test pass
>   *
> 
>     igt@xe_exec_basic@many-execqueues-userptr-invalidate-race:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@xe_exec_basic@many-execqueues-userptr-
>         invalidate-race.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-6/igt@xe_exec_basic@many-execqueues-userptr-invalidate-
>         race.html> +17 other tests pass
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-
>         defer-mmap.html> (Intel XE#1392 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1392>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-433/
>         igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html> +3
>         other tests pass
>   *
> 
>     igt@xe_exec_basic@once-rebind:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@xe_exec_basic@once-rebind.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-dg2-464/igt@xe_exec_basic@once-rebind.html>
>         +12 other tests pass
>   *
> 
>     igt@xe_live_ktest@xe_dma_buf:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html> (Intel
>         XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1192>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-8/igt@xe_live_ktest@xe_dma_buf.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@invalid-async-flip-atomic:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_async_flips@invalid-async-flip-
>         atomic.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html>
>         (Intel XE#3768 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3768>)
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_async_flips@invalid-async-flip-
>         atomic.html> (Intel XE#3007 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3007>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-bmg-1/
>         igt@kms_async_flips@invalid-async-flip-atomic.html> (Intel
>         XE#3768 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768>)
>   *
> 
>     igt@kms_big_fb@y-tiled-32bpp-rotate-180:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-
>         rotate-180.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136> / Intel XE#2231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html> (Intel
>         XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-
>         rotate-180.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-463/
>         igt@kms_big_fb@y-tiled-32bpp-rotate-180.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_big_fb@y-tiled-32bpp-rotate-90:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-8/igt@kms_big_fb@y-tiled-32bpp-
>         rotate-90.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-8/
>         igt@kms_big_fb@y-tiled-32bpp-rotate-90.html> (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-
>         rotate-90.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-435/
>         igt@kms_big_fb@y-tiled-32bpp-rotate-90.html> (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-
>         overflow.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136> / Intel XE#2231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/607>)
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-
>         tiled-mtl-rc-ccs-cc.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-dg2-435/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-
>         lnl-ccs.html> (Intel XE#2652 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2652> / Intel XE#787 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136> / Intel XE#2231 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2231>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-
>         lnl-ccs.html> (Intel XE#3442 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3442>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-435/
>         igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html> (Intel
>         XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-
>         tiled-mtl-rc-ccs-cc.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2 other
>         tests skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-
>         tiled-mtl-rc-ccs-cc.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-
>         cc.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/455> / Intel XE#787 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1 other test skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-
>         gen12-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-
>         cc.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2136> / Intel XE#2231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) +2 other
>         tests skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-
>         gen12-rc-ccs-cc.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-
>         ccs-cc.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2136>)
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-after-
>         hibernate.html> (Intel XE#3007 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3007>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-6/
>         igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html> (Intel
>         XE#2252 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2252>) +1 other test skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-after-
>         hibernate.html> (Intel XE#2423 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html>
>         (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) +1 other test skip
>   *
> 
>     igt@kms_color@ctm-0-50:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8182/shard-bmg-8/igt@kms_color@ctm-0-50.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-8/igt@kms_color@ctm-0-50.html> (Intel XE#3007 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-5/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1178>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-6/igt@kms_content_protection@lic-
>         type-0.html> (Intel XE#2341 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_content_protection@mei-interface:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_content_protection@mei-
>         interface.html> (Intel XE#3007 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3007>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-6/
>         igt@kms_content_protection@mei-interface.html> (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-463/igt@kms_content_protection@srm.html>
>         (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1178>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-dg2-433/
>         igt@kms_content_protection@srm.html> (Intel XE#2715 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2715>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-
>         max-size.html> (Intel XE#3007 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3007>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-1/
>         igt@kms_cursor_crc@cursor-rapid-movement-max-size.html> (Intel
>         XE#2320 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2320>) +1 other test skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-
>         max-size.html> (Intel XE#2423 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) +2 other tests skip
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html> (Intel
>         XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136> / Intel XE#2231 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2231>) -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-5/
>         igt@kms_fbcon_fbt@fbc-suspend.html> (Intel XE#1695 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1695>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3007>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-2/
>         igt@kms_feature_discovery@chamelium.html> (Intel XE#2372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-464/
>         igt@kms_feature_discovery@chamelium.html> (Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-
>         to-32bpp-ytilegen12rcccs-upscaling.html> (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2380>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-
>         ytile-to-32bpp-ytilegen12rcccs-upscaling.html> (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> /
>         Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-
>         to-32bpp-ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-
>         to-32bpp-yftile-downscaling.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-
>         yftile-to-32bpp-yftile-downscaling.html> (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2380>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-
>         yftile-to-32bpp-yftile-downscaling.html> (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-
>         to-32bpp-yftile-downscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-
>         primscrn-shrfb-pgflip-blt.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-
>         primscrn-shrfb-pgflip-blt.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +1 other test
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-
>         scndscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#2311 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-
>         draw-mmap-wc.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +7 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-
>         draw-render.html> (Intel XE#2311 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html>
>         (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136> / Intel XE#2231 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2231>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-shrfb-
>         scaledprimary.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-
>         shrfb-scaledprimary.html> (Intel XE#2311 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +2 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-spr-indfb-draw-blt.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-spr-indfb-draw-blt.html> (Intel XE#2333 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2333>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-
>         rte.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbc-2p-rte.html> (Intel XE#2333
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) +2
>         other tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8182/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-cur-indfb-move.html> (Intel XE#2050 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2050>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-
>         move.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2333>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-shrfb-msflip-blt.html> (Intel XE#2333 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-spr-indfb-onoff.html> (Intel XE#2333 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2136> / Intel XE#2231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) +1 other test
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-shrfb-
>         scaledprimary.html> (Intel XE#2333 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html>
>         (Intel XE#2050 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2050>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-
>         primscrn-pri-shrfb-draw-blt.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-
>         primscrn-shrfb-pgflip-blt.html> (Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-
>         pgflip-blt.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-
>         scndscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-
>         indfb-draw-mmap-wc.html> (Intel XE#2311 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +5 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-
>         primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-
>         shrfb-draw-mmap-wc.html> (Intel XE#653 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-
>         indfb-multidraw.html> (Intel XE#2313 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-
>         multidraw.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-
>         primscrn-indfb-plflip-blt.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-
>         plflip-blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2313>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-
>         primscrn-spr-indfb-move.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-
>         move.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2136> / Intel XE#2231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2231>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-
>         scaledprimary.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-
>         indfb-scaledprimary.html> (Intel XE#2313 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +4 other
>         tests skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-
>         indfb-scaledprimary.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html>
>         (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/653>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-
>         modesetfrombusy.html> (Intel XE#2313 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-8/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html>
>         (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136> / Intel XE#2231 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2231>) +2 other tests skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-
>         modesetfrombusy.html> (Intel XE#653 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-435/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html>
>         (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136>) +3 other tests skip
>   *
> 
>     igt@kms_histogram@global-basic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-8/igt@kms_histogram@global-basic.html> (Intel
>         XE#3898 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3898>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-8/igt@kms_histogram@global-basic.html>
>         (Intel XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3007>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-432/igt@kms_histogram@global-basic.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12407/shard-dg2-435/igt@kms_histogram@global-basic.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-
>         continuous-exceed-fully-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-
>         fully-sf.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136> / Intel XE#2231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) +1 other test
>         skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-plane-move-
>         continuous-exceed-fully-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-435/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-
>         exceed-fully-sf.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +1 other test
>         skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136> / Intel XE#2231 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2231>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-6/
>         igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_psr2_su@frontbuffer-
>         xrgb8888.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-464/
>         igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_psr@fbc-pr-sprite-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_psr@fbc-pr-sprite-blt.html> (Intel
>         XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136> / Intel XE#2231 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2231>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-1/igt@kms_psr@fbc-
>         pr-sprite-blt.html> (Intel XE#2234 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>   *
> 
>     igt@kms_psr@psr-basic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-3/igt@kms_psr@psr-basic.html> (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-bmg-8/igt@kms_psr@psr-basic.html> (Intel
>         XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136> / Intel XE#2231 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2231>) +1 other test skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-434/igt@kms_psr@psr-basic.html> (Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/igt@kms_psr@psr-
>         basic.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2136>)
>   *
> 
>     igt@kms_psr@psr-sprite-plane-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html>
>         (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-dg2-435/igt@kms_psr@psr-sprite-
>         plane-onoff.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-
>         reflect-x-270.html> (Intel XE#3007 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (Intel XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3414> / Intel XE#3904 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3904>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-
>         reflect-x-270.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-
>         x-270.html> (Intel XE#3414 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3414>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-432/igt@kms_tiled_display@basic-test-
>         pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1729>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-463/
>         igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>   *
> 
>     igt@xe_compute_preempt@compute-threadgroup-preempt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@xe_compute_preempt@compute-
>         threadgroup-preempt.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt.html>
>         (Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455>)
>   *
> 
>     igt@xe_eudebug@basic-vm-access-parameters-userptr:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-8/igt@xe_eudebug@basic-vm-access-parameters-
>         userptr.html> (Intel XE#3889 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3889>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-8/
>         igt@xe_eudebug@basic-vm-access-parameters-userptr.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-464/igt@xe_eudebug@basic-vm-access-
>         parameters-userptr.html> (Intel XE#3889 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3889>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-435/igt@xe_eudebug@basic-vm-access-parameters-userptr.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>)
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-extended-discovery:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-extended-
>         discovery.html> (Intel XE#1130 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-464/
>         igt@xe_eudebug@basic-vm-bind-extended-discovery.html> (Intel
>         XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-extended-
>         discovery.html> (Intel XE#1130 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-2/
>         igt@xe_eudebug@basic-vm-bind-extended-discovery.html> (Intel
>         XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2905>) +1 other test skip
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-large:
> 
>       o shard-bmg: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-
>         large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1473>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-bmg-8/igt@xe_evict@evict-beng-
>         mixed-threads-large.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-
>         small.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1000>) -> TIMEOUT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-bmg-1/igt@xe_evict@evict-mixed-
>         many-threads-small.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel
>         XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472>)
>   *
> 
>     igt@xe_evict@evict-mixed-threads-large:
> 
>       o shard-bmg: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-3/igt@xe_evict@evict-mixed-threads-
>         large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1473> / Intel XE#2472 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2472>) -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         bmg-6/igt@xe_evict@evict-mixed-threads-large.html> (Intel
>         XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-basic-
>         defer-mmap.html> (Intel XE#2322 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2322>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-8/
>         igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_exec_basic@multigpu-once-null-rebind:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-
>         rebind.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12407/shard-bmg-2/
>         igt@xe_exec_basic@multigpu-once-null-rebind.html> (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>)
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr-invalidate-imm:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr-
>         invalidate-imm.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-435/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) +2 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@xe_exec_fault_mode@twice-
>         bindexecqueue-userptr-invalidate-race.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-
>         userptr-invalidate-race.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +1 other test skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-
>         interrupted-dma-fence.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-
>         fence.html> (Intel XE#2360 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_media_fill@media-fill:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-2/igt@xe_media_fill@media-fill.html> (Intel
>         XE#2459 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2459> / Intel XE#2596 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2596>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-bmg-8/
>         igt@xe_media_fill@media-fill.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-434/igt@xe_media_fill@media-fill.html> (Intel
>         XE#560 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/560>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12407/shard-dg2-435/igt@xe_media_fill@media-fill.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>)
>   *
> 
>     igt@xe_oa@stress-open-close:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-464/igt@xe_oa@stress-open-close.html> (Intel
>         XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2541> / Intel XE#3573 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3573>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12407/shard-dg2-435/
>         igt@xe_oa@stress-open-close.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_peer2peer@read:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@xe_peer2peer@read.html> (Intel XE#2557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2557>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-bmg-6/igt@xe_peer2peer@read.html> (Intel XE#2427 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2427>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@xe_peer2peer@read.html> (Intel
>         XE#1061 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1061>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-dg2-464/igt@xe_peer2peer@read.html> (Intel
>         XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>)
>   *
> 
>     igt@xe_peer2peer@write:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-2/igt@xe_peer2peer@write.html> (Intel XE#2427
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/
>         shard-bmg-8/igt@xe_peer2peer@write.html> (Intel XE#2557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2557>)
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-434/igt@xe_peer2peer@write.html> (Intel
>         XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1173>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12407/shard-dg2-435/igt@xe_peer2peer@write.html> (Intel
>         XE#1061 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061>)
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-bmg-6/igt@xe_query@multigpu-query-uc-fw-version-
>         huc.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12407/shard-bmg-6/igt@xe_query@multigpu-query-uc-
>         fw-version-huc.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8182/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-
>         version-huc.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12407/shard-
>         dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html>
>         (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/944>)
> 
> 
>     Build changes
> 
>   * IGT: IGT_8182 -> IGTPW_12407
>   * Linux: xe-2456-9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48 ->
>     xe-2459-9e5828f71dbb3bf6dff6a2bcfaa761d048344b2a
> 
> IGTPW_12407: 0afa7b205dd6a755ad29c432e9bcca2d0d552917 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8182: 8911eff2c6c06d2929c6072f3ba72d2d991985ea @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2456-9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48: 
> 9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48
> xe-2459-9e5828f71dbb3bf6dff6a2bcfaa761d048344b2a: 
> 9e5828f71dbb3bf6dff6a2bcfaa761d048344b2a
> 

