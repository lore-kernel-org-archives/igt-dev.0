Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD462D1BDE5
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 19:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B53810E4B9;
	Mon,  4 Nov 2024 19:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pdlg1ksq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B0310E4B7
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 19:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730748148; x=1762284148;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CBbr+jTeJiWqjSvT+gylC1TMBKmr1p+JAF9VqUrpu40=;
 b=Pdlg1ksqdyTVgLexfAvplmOUma9svSPORxODc5ULUXIKQvEtkJO84WU8
 c7hYsc2VB5AJP907aN+JEuwwqJc9SfI28sxOoz/xEf1q5UyLwEABFPV2F
 b+o90SldC/mVTRiOZL/mAqDly3RheJOihQTYaGcSF2F3hO8Q+q37wxjw/
 dSqimnQkNA2veXn11xx4KEW4FB0GmpekmzPLoUkoB/LsIBQIgM+r/6lGx
 eBaWXv2XubOxT5fzDrPrzC8j4OObHckEhVq4tRF/8OLzenAf3rjUo0sv5
 F+zY3IP9AT1+5hHzzddCywAda/u97YVnB1WTKrk/dsE1RXJQhfQmeCJqo Q==;
X-CSE-ConnectionGUID: 2iIpoHZBSs2khFaD2tEGSw==
X-CSE-MsgGUID: 8xwwRBXFQlGUqa5BlnH5Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41051231"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="41051231"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 11:22:23 -0800
X-CSE-ConnectionGUID: 5oM4WkmMTxiiMkE/2V+yJw==
X-CSE-MsgGUID: V0fYBbfYTvGnkV0kFux2QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="114551847"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 11:22:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 11:22:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 11:22:22 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 11:22:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRAOsyEFWEPaMHrp6rg1dN7JilAfaWz9cIvdEOqXbc2EG5Ujtclua0JIUBRdiN6PhwF9DPPZph/JR5zpQ6korzM/Juaxdd38Nd1eT34GntbKsjW+ntt5nDteBtWPdO0GCB7nVib7u6sczPt0OOmp++LI9tU1dcJ74Ge9m+hAN/2IWXxYDYQ6T2oR9CkB2Z31zpoIG7Ieh4Ksc+1fu0atBCfYpqLzV2zFbg6pnggFiiuvSg5AgMoqOft7j5bMotL3B15QUtvMVn5BjVi20Az5/duPO9ZK1SGc0VR3WfOol3X5dvhOUyj3ZgpL4NxkRCMaeONga/NIPZXrZ/UyHhl3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRl+BdZMHrQgpPE1vFklF98VNNyZuAvXYyT1ZZ/AFH8=;
 b=LrAroLoXU26+i6iqUMOJNGtq3ITM1cQRW8fcy1tXDpAvi1FGBEZ8DPFcIOwnXgAr1Z28ysOHZD7DhvQla7XpYTjFpRqXaunMDnjOh2VOnhJygGa6sg01wmz1Vfguubc6B6JlGZndf5P0RTKwufdhPr9vgK2MU4lsiSNh7J8esMGz7naXWTS3ArW/5QNCqxsSdHFRHJ9MvOWegEJ29LKZoUkZJtt5l5hwI5HlTTTL7zJVLOj39liapRVXJa6TzF4CtQS72u76WhFcO8uvfutjGQgcqyLsd3kSwhqvl16DALT8ckkr3b64jiZCrUEOV9QXZp+jI1PLaM/T7yiAtszmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN2PR11MB4631.namprd11.prod.outlook.com (2603:10b6:208:262::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 19:22:19 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 19:22:19 +0000
Date: Mon, 4 Nov 2024 11:22:17 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Drop PM interaction on unbind
Message-ID: <Zyke6aBQfB+lh0a2@orsosgc001>
References: <20241030234838.857880-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241030234838.857880-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0070.namprd04.prod.outlook.com
 (2603:10b6:303:6b::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN2PR11MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a553608-2110-4301-b8ee-08dcfd05ffd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFpFM2E5WUd0KzJabnVVMVZBZjZMR3JUOTNVSFUzaDJEL3NLcUZyM2NnNC83?=
 =?utf-8?B?Ty9jQ1p2UDJibFpMeHR2Y05yN2x0REwzS1FSRlRtNkJ3SVNMaHNxZENNNEFr?=
 =?utf-8?B?WTlZZnVKVnZPZll0SmhQTUNFeTkxQWp3THBtd3ZPZGQzQUkza2k0OS9EQ3Np?=
 =?utf-8?B?K0taOWVJOTc5RFJ1Mmw5UG5aVVY0aTQ3TDhrbXRYQ1dIQjZPSkZQbHg5N3pv?=
 =?utf-8?B?SSt2KzExVUFXOG1wcVM5bGlUUXNOTmIyelk4VzdEOGF4Rm5VdE9kVjY2OGdi?=
 =?utf-8?B?L05YTEprdEEzZ1cxZGJXQ3pqQ3dieEZVa29PVFdqNUV1VjBTMWRJT2RlUnR6?=
 =?utf-8?B?Q29ZeGljc1JaVHY2RFdLajB2aWtCTkgrNVQ5K2xucmlzS1lqUXptYzdEZzZT?=
 =?utf-8?B?REdQdWNoOHhMKzhaN1JMbHdKdkZBT0lGbVc3TWU1NktRNzFJMkRDOXg5NnNW?=
 =?utf-8?B?QXNsVERYUDhxUUlVRW9nR3p1ZTM2bXFhODY4TkJ1dVc4YlA1RTNReWN1cU5H?=
 =?utf-8?B?Q2lrU1F2ZitRUmNRaFp3dFR1Z1NZTGJiZE9vdG5JeVdXeVd5TENaRlJlNCt4?=
 =?utf-8?B?S2pCcFhhL2J1RUNwUmJVYWFUNDNDcDJZc1RKVHBObGVhYkpYNHdobmx4MmRN?=
 =?utf-8?B?TFcxdUk5cTEzSlArTUppRlhIOERobm5uVHMydmNld0hxN1ZneEZLODk5VzAy?=
 =?utf-8?B?ZzVQUnVNRXdkNEJTQnI5Y3d3ak80aFJkaGl3eGc0VGtlMzZzVElLdDlSZllq?=
 =?utf-8?B?UHp3aFZ5U0wrdnJOamt2UjM4THBlM2ZaZ2xFSnR3RWs1N2tLaEszVEgxSVVG?=
 =?utf-8?B?T3ltbXpzR2Jha0o1elgwWk1HMUV4QnlHUTFvUk9JZmxCRm1LT3ZFS2tVSkho?=
 =?utf-8?B?UW0xa0FhbEcxOXVQNGE2TEVnMkVCWUJsOTlXQ3ByWFFVdE1POFJvbEpRSS84?=
 =?utf-8?B?U0s2djV1MWRkNnZQWWZ3U2ZhSUc0Qnp6MHlpK1pIWDZhU2VZeE5VNXM5YTBr?=
 =?utf-8?B?T21SNHJ3a1dRcE9IMU5wQUt6aWVGcEc4M2FSbHNQSFU0Y2Z2WTRBaXhudGdP?=
 =?utf-8?B?NDd5amdSOThmbVJqRUkzejl4Z25uZmRJaWswSlhPOGloNlRpTUprMXEwOHVC?=
 =?utf-8?B?M0d6ZUNMU1R5TDhLNEVTanhoMlU2blZtQ3R3Ky9SWkhIeGEwb25GN3BjN01X?=
 =?utf-8?B?K2lvUTlqZmNoWlpPTHd2TEk0L1NIR0lrQjkzOEk1N0ZFYVZLQWNOMkkxdElH?=
 =?utf-8?B?ZStSSEpqOTBXSU83TWlGZktKSTYycUhFLzRsUHE2Zk5VZjZXU2Z3ZWp2WURC?=
 =?utf-8?B?YTVPRWFpcVB1NnhndzdLblBVWWhpRG9FS3ZOSVB6RkFuTUY4WVNMUmNpQ2dQ?=
 =?utf-8?B?YlhHSFVJQUdQazhDeFhUV2xuSzVWU3FjZEFZNzZMV2hwN2U5M1NJQzZqbC94?=
 =?utf-8?B?ZEEya0JqeHQ1QVRnV0xUbGJRaFZSK3pMVDhmeHpJWWR5SXpibm9mZ1haQU1P?=
 =?utf-8?B?aGdPY0V0Vnh1OXB0S3dZS3IyQVhIcHhSZUpSVjY5RCt6cWJMNkYvb281SkZj?=
 =?utf-8?B?Zk1KMklRcXVXemwyTFYrQ043MGZYUC8yS0VsMFZ5UkNrdmdISXAvblMwQTJs?=
 =?utf-8?B?WDVYRjFwWEx3cHVJa2VDc0hrWC9Qa2R6eDhKRzh6SEN3b0VtR21heFVFbGxy?=
 =?utf-8?B?ZHlmRGJFYlFGM3R0NE11cHJmaWN0TEE4WThsd1d0NkhCUVA2RHp5YmxyNjdK?=
 =?utf-8?Q?4eyMINReMidsnY+w+ILVCAi/WKbYfhGlx7ypG6M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1p4TkxieXZiMGlONloxMFNudDZtcUp3OU54cE5MaUIvUCt2Nk1ORlorOWwv?=
 =?utf-8?B?VStlbWJJUmYvUnRud20xMDREeENoMGlPQUJTL2s2azNmanBBb1pkdXhZdVJR?=
 =?utf-8?B?VzdwbUlBVmFKNDFxOWlSVGs0QlBtVzZ2KzZJWWw4dEpRUmMxVkZlaVJxeWdt?=
 =?utf-8?B?VXQwc1YwdWplOVlWMlpsVTI0WFR4OEllODBUZmZBMGloYUxZRExjVGxDYmp2?=
 =?utf-8?B?YXFIN3N3ay9LQ3dlVGc1N3c0Y0k5ZE1JZnhCQWsyTFZLa2FTc2poT09BUFdE?=
 =?utf-8?B?ai9iUHlFaDNLUEgwb2hEeE1wSllmdEtoTGFZSHpBZWYyVkNWMmZVT1ZoOFNO?=
 =?utf-8?B?Y2Y5M0RxdGI2dDhzbnNQRUo3Q2UvUVpWYUg2ZU5qaDliRlVwRUQ4aHZFSE1Y?=
 =?utf-8?B?VGtvN1RnV0o3QlVNcFdaN1d3VjE5d2dBditNbENuSFZZeTZSRTZrQkVTWjdt?=
 =?utf-8?B?dVJYcm00V25lMlpzOTRpYVRvNWljc2JiSkppWjUrOWc0Qk5JeHVMT2JpN2t1?=
 =?utf-8?B?ZXBDa2RQMHdKVTEzbzhOeDNEcXdDWGRnTUh1YytMSVdwaTZKbXgrS2k5ZDh6?=
 =?utf-8?B?RmdybGo1TGQ1eVVoaWgzZ3M4MEQxdk1rNCt5eWN3ajNvZXg3NXhWaHU5eVBh?=
 =?utf-8?B?amZ5QVdVWUc1MWIxSkVxU0svR015VTNpbVllbHZSNFVoODFGbitoeC9mZXpC?=
 =?utf-8?B?TEIzMmJGWWgwbFI0WVcrRUNQN2VRQld0R3d4TEVWT1E2SmhyZVJ4ckdDOEFL?=
 =?utf-8?B?OEswYy83Qk1ON1RsVWpTR0JFMFZoK3QyY3dEY1BTYUdzMFZxYXdXaEgrc0t1?=
 =?utf-8?B?M0RXV0F2ZU45NHhLaEpqclU5VTV3UnVvaThocGlveVBNZjRlMFdNakZGNTNa?=
 =?utf-8?B?bjNYcXgzQ1Q1M2F4cDN2V2ZwREFzVjV1YmdNNFdoUFJwV2xYQWlEZ1V4K2xB?=
 =?utf-8?B?cmJKaE0xcmRJK3Z2dFhIUVVxcjFpMmlGNkI3aVcvVHl2aUZZdG40Z2w2OEk2?=
 =?utf-8?B?VjBUdGxhbnl4SnJWV0lyUDlHWk5CT0FtRERnNXIzNTM0RGFGcWltTEhlVk5E?=
 =?utf-8?B?bU9XL2RKdEF0eFo3MU15bERwK3JWNEdaRit0WE1FYThLK25nSEZsemhUUHhH?=
 =?utf-8?B?U3k0T2pTR2Npb09WRDB4TWgwcEFqNGJkbmgwWHlEZkZQM0hrUTd2Uk83V3Q1?=
 =?utf-8?B?Nk93QlVhYVRsRHpDMmdEN0crbFFuUjBWRjgwNjZzUmxtVWNiUG85cXV1RkhQ?=
 =?utf-8?B?VU8wWEd0bm01bEFiWUphOFAwVENTaFdyWVorTjBsQ1RsaDloNEFKZUE2T2t3?=
 =?utf-8?B?VXo5UmNSK2duSDRSZ3RsTUwxMWdhQ2J2UlpUcXE1Szd6UjBIR0s2Q0JCWmZ0?=
 =?utf-8?B?ekVYVlIveDlUa0hGYjlJbENpUkVka1RSdVJmR3kzK093cjgxYThrb2t6dFZp?=
 =?utf-8?B?VE80MmZYbDhEY1JZM3VxTkxld2w3Sk5IN25iTVJkMWhVUzhUcFJLVVE1OEMz?=
 =?utf-8?B?RDU4N1AzT1B6b3lmM2h6VnZyYm1zamNQN1Q1NEh1Zzl5dGtZTUFDZlNjMEQr?=
 =?utf-8?B?R3FMeTdmb20zRHNYOGROcEpYcU4ydnplSEdwMnpzZFIyS0xCcmNtcFF0ZWxv?=
 =?utf-8?B?YnRobjdsdFJzdHlheWV5dFdMZ0k3ZGcra1MxcDlreTZoZUZ1NVF1L1Q2V0k2?=
 =?utf-8?B?THhhdzhJMFRyKzUzc0NxODdJby96U1JQUldqTmRJYURSdEl5NDAyUGpPMnZR?=
 =?utf-8?B?SXRIUlBMWVRHUTFtVERVRk1OT1EwTHZoaW1ZdE4yOU9CYnNuUGJpeUMyeDYv?=
 =?utf-8?B?dzJrbHgzb21xUC9rdHFIbXA4OEtCWnF4b3dCcWxyMk1nam5vTGpVcmttcTB5?=
 =?utf-8?B?M1I1MFVHSjFPUUUxc25qQ0NDSGczS0pNNy9nWUZWRStDL3hQcytRU3ZtT2Ev?=
 =?utf-8?B?dVR3YnFJSEpaWFZuQS9wZ3YvbjhkRTB4TTRSaEVMMWxGb1NtQXVCN1FMOFNr?=
 =?utf-8?B?M0dFWldUQXNDQlVsdmtZYzAvL1czWk5yRTcyUzJUOWNuNXNiMzVKb0JRSDNo?=
 =?utf-8?B?V052b1pvVFJnSFg3ODAxZllib2xvSlVwMlJZSFAyTng2V2l6ampjT3JVK3Ew?=
 =?utf-8?B?dlpTUHUyblNhVkNpK2JWNFdFemxoTEE2b0JGWlBmd0kzbVJWNERqSC9mV2w5?=
 =?utf-8?Q?Nf4uamOOTMbAt5sk+LdZzu8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a553608-2110-4301-b8ee-08dcfd05ffd3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 19:22:19.0278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tl0lmNmlOjDb2Y93letDEh4tjF7hSPL2d7aeXkLbnswPk1TagfcKBTZlBtGu1Uv4565iOrs/+viT8wJmSi41uGySOQdi7lhgavKpC8sAkXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4631
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

On Wed, Oct 30, 2024 at 04:48:38PM -0700, Lucas De Marchi wrote:
>Setting the power/control to "auto" is not needed and will fail if
>kernel is configured without CONFIG_PM. Just stop setting it and it
>should still work as before.
>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> lib/igt_kmod.c | 3 ---
> 1 file changed, 3 deletions(-)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index 6f73f9220..bcbb8dc22 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -690,9 +690,6 @@ static int unbind(const char *driver)
> 		devfd = openat(dirfd(dir), de->d_name, O_RDONLY | O_CLOEXEC);
> 		igt_assert(devfd >= 0);
>
>-		ret = igt_sysfs_set(devfd, "power/control", "auto");
>-		igt_assert(ret);
>-
> 		ret = igt_sysfs_set(devfd, "driver/unbind", de->d_name);
> 		igt_assert(ret);
>
>-- 
>2.47.0
>
