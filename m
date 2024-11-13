Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AAFD41C2A
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 09:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C4710E379;
	Wed, 13 Nov 2024 09:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EI0KfwuO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA06510E379
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 09:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731491484; x=1763027484;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=61YWhXu6kOFaEchtcZ1JiQwIVbij8yiBVFEql885XqY=;
 b=EI0KfwuOG+1wX5o9ZU2tCqwbVxDHc0EcnTjYf4oWgpNRFY8wI0YQem8N
 AjVDPKZfiEnNTckgIGn+W+xVWiarjDXBF6T9F/y/YJArZBsuc8yjWyXy3
 746aCXp62zxHFy772hj4yv7ZcHLRqHljuBckitabVwzKsJf7T7n0kTmYk
 NnfZ11LRMVov45cD1QScPDzWrJljBX2jXoO5HaOeeSXzdEot7P684sbk4
 ZssqOXIbsHqCfeRXrq7YVzhaPYPEH6Jx1yUR2wu3qhr+7b0XARgHzBEq3
 CmQxZxD0xNp5DjllS56Et4tbwp8IfKFKFpdjMUJ7Ok8oGniJLvKKYq1Lz w==;
X-CSE-ConnectionGUID: ZdZ1HO2zRgSGrGRU+DTG6g==
X-CSE-MsgGUID: fisC3A4hSDSTDsXuADdMsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35300965"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="35300965"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 01:51:23 -0800
X-CSE-ConnectionGUID: GOWqKJfWTrqt1DdV3Cn+9w==
X-CSE-MsgGUID: PZpxISCjSiauoDK+jTHmwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="111130093"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 01:51:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 01:51:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 01:51:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 01:51:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hX3vHPIwQsKMdbjmxg89gAPpOjSIFkmxi6AEc/dyDxfgiVtTOUU4XZJMoDaR6FLysV/FxSIAa6ap0uhawOH9yLxEsF4pbT4TMbbZCwYFU1xSVnPMU1AV8bbC5y+2QFegls2z1XHI7X88mfDumyKEnqf5ELwxc0mVQlGefeN6HwSnn8AeimrP+0BstqPQDyT3tw5n63H0wN8TEdFMFcL1bO6a/9sqaELHUpo26OJqrGkgrHlIkmLlMTQ5VNrRkYXH0453hdUork/o0Nsmk2+jA2cCuOFMOg+PNQzVv3bFpyaWil83ik0RfYtSjFuqBet41HtzNDTjktEnjQnWvJNQCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBxxgxyfrLnI8U15Xkg1MFI6BD1Yrkt3JnEAu34RKhQ=;
 b=GySHbk+GoWQWQ1ePIKjKF+peMrSlzluNYT+X7SoxjnCxTweThzeUSwIttipOQ9gDfUZpgZBw0CVm/zdzRHZ5BD8f9xZK5qsmyFTEBNzyk7ynTaA1F2cmwVSfDIr8OmBPFo3HB1HDk2Xvr06d5C9crfnj2OmylaaaS80fdlKdNDTJoQzy1IAoekpOSivVvqtt69WbnQOoFTSnmq/MNpJf9cZ+0qqyiicCVwqM/xhYCUuz2RzOagTj0Oi0/Y2f5iKjJSoyiDAMUUFTflPTph4yc2y/p/OZUIezXFSm4UngSJwqSLt/EsjsNdrjepHOSzz9F8cPiElcTSB6HABbdArX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by MW4PR11MB7163.namprd11.prod.outlook.com (2603:10b6:303:212::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 09:51:20 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 09:51:20 +0000
Date: Wed, 13 Nov 2024 10:51:12 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests=2Fintel?=
 =?utf-8?Q?=2Fgem=5Fctx=5Fpersistence?= =?utf-8?Q?=3A?= Wait for context
 termination (rev2)
Message-ID: <jzyisw3prbs5c76nygejzmai4k66777cthebear6u6wmcublmr@rrtghp7lksvo>
References: <20241028125640.22936-3-krzysztof.niemiec@intel.com>
 <173099134329.1422765.16648444720488046396@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173099134329.1422765.16648444720488046396@2413ebb6fbb6>
X-ClientProxiedBy: BE1P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::20) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|MW4PR11MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: a3553f0a-f58a-477b-a9b4-08dd03c8b9c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUJycmFPcUloVlRJRkJFaVFsMDI2RmFyQUxoYTRqNUprM3FyT0Rad2NGVEJG?=
 =?utf-8?B?cTI4MGdQazVjQ2dTSmFXRDJBZ1RQYXIyVG4yWjVscWI1OGJWVU5wb20xUmNt?=
 =?utf-8?B?VDVndW9FRDFtd20vVkk3VDBXNU5meHE2VkI2NWU5elMwRHNoZ0RpNE9DYUo2?=
 =?utf-8?B?b3psb2RHeVBZUFluSHpTVGxCdFpETlNyNTcxVzZsakJpZTBEVU5vQlJzekFX?=
 =?utf-8?B?NEdPVllUejFqWlNoL2pWTnAwSTRXZVhXWjBkT0tualRzQ0xRVjNicnQ2YWFo?=
 =?utf-8?B?UTRqQUFYc2JabW1SS0UxZmlqNWxMV1VRaWlmT1BWQ1g1bE84d0h5d1MxT0Qy?=
 =?utf-8?B?ajBqV3FwRTQyTDN0L3Z1ZzczVnJ6T0hieWV6KzMrRUNPM2N6ak90eGhRYTU1?=
 =?utf-8?B?K3JKdDR2Rm1JWDRzSGFHTlVTWkpDWElMNnNvaEZOZmczU2hrSzFzUlZod3h3?=
 =?utf-8?B?d09VUGhiZHgxdmhJcWRLdGxjOXJhbjI3TGpNNkFSUzFCZ0xlTWhVaUhwZGc3?=
 =?utf-8?B?UUxLZ3QwN2lxbFU2b3doZDJlM2gwdDNZcnIzTVBWbnRZbnk4aFVaSmJwbXdI?=
 =?utf-8?B?OThPdmdxWHlBaWtGSjdMN1FISVJ6ZjVQaUdmMEJFTXB1Y1h3VEZaQTBTTkNm?=
 =?utf-8?B?OFAwN1BGTVBxenZVQ21nMmVad3RhOFhBNzA1dXVFU0k2RENJNVhhNkV3NHNY?=
 =?utf-8?B?ZEFJUGNGSjh3bHhYLzhISnU4T3VxWHVBMTFxbTFqNDM3UUlzMG44VUpTUkpK?=
 =?utf-8?B?UmxicjJEYXUyRE9LTWFsNUoyMWpTL2RrSXNmd0VXcWp2NzgvRVNtOW9PR0dO?=
 =?utf-8?B?Kzh4UGxZRGJWMU51Y0RMdDlNbU42SWFYbnNNRzdtN0RNWW1LMEdiYmJEZml2?=
 =?utf-8?B?NDlScVFlcnBCOVcyZWJUQ293Q254UUpMS2tSOE5pMExDblI0VE5rNHRBWEt1?=
 =?utf-8?B?NnB3N2lBNkgwemIxQWUybTlFL2NORjRmRVQzMUpTRXJyejU1bXZZeWMwTTlL?=
 =?utf-8?B?bE1BTDVXS2Q5eFprSlNxaTgxVmE2UmJ6ZkE2YXhHdjd4YUZoRzBBc3lMeDcy?=
 =?utf-8?B?eDF5WjZDWldRNDRhbjFmc2ZHMVFhSkVQT3JpOHhaZGtsSTMrWDRnbHlDYW55?=
 =?utf-8?B?czNkMHgvdDcvUCtteEVJZWdrUVR2d0VHenJqcTVydU4rM1JwQWp5M2FwZ2pm?=
 =?utf-8?B?SXRiUUwwZmd5YnRLWGt4dHNQM3VUWTZmUDdxR01XbjdWaWVSL01hQlhKdFlm?=
 =?utf-8?B?YXc2NGNMUis5bGhISjhZZ3RnNjZnVkExclczMVhIR25raTQ5QThlL01udm9k?=
 =?utf-8?B?S3pmSXJ0cDY5UTFGMmlDZURnZzhhZDlrSXc2eE9hYjlvZ1hneDEwM0JVZFRp?=
 =?utf-8?B?SUQwZndWV09meFRvWHZhejkvbElLdERNTll6SGt6Vm1qRFM5NDBickdVa1Y3?=
 =?utf-8?B?bVl5VTRzZ0ovZUZXMkt4dE9JWUUvWHgzRU0rR2txUktFYXRHRjFjQTBhM2lv?=
 =?utf-8?B?ZlFDWXppSjZDblFNR2ZGRTg0bzBQbWYrM2VBejRQUDZ2bEViQXdQa1R4blN3?=
 =?utf-8?B?ckZnQ0YrdnczQTVZcDJtR1B3dWNMRURrMkNSd3pLUFVLK0dzTlBZSnJ5Y2Q1?=
 =?utf-8?B?dnZzK2ppcW8yUk9KcUg3QVpsY3YrR2hPMXp2U0Z2TC9KZGtuWFFFUS9ZRGU0?=
 =?utf-8?B?S245eDdiYi9Ob3BFTDRkNSs2TTk3bG1yVkJudFFHbjh4c0c3YS8ycStRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHYzblNBM0UzVDdnR0pxQmJPdG1nVlFiRFlaNXRBdm53RXV6b2Z3T1BvbDVC?=
 =?utf-8?B?ODVEMWVKbjhKYUZ0Um50UGpoRnpGYy9EZlRtcHJNd21RTzBhT3l0d2JUbTh4?=
 =?utf-8?B?RFhxV2M3akZuMXl1cFVYYWR0VWlGS1pCY054THdnVTJZd1JsYThZUkpzMWdB?=
 =?utf-8?B?b3pCZGRvTmV2UGpCNjFSSkV1bU9nSjhrMVZhMjgzanpZdjBLQ2c2Q2FVL20v?=
 =?utf-8?B?UHE0bGUxc0VYUU5Wc1B6Q2FQdFVvMGxoeThNWFg5L1A0MWFYeDVFd3BvRU1n?=
 =?utf-8?B?RlJObGd2MVlITklJZ3d6dG9xMHlRTG9xYWJLSmhneVAveXFZbTdCeXI2Qklo?=
 =?utf-8?B?dnowVG9BV0xGRmxEdnhEYVdRWklJMzhXY2t4WkhSNzJFVnVHOHFlWmdEZUZ2?=
 =?utf-8?B?ZWJ2YmMxd0tnVnhmbVBGUmQwUmt2bXpYNUtHNHBZbGRzV29Xd2FER053cVI5?=
 =?utf-8?B?RysvcDBpaVlMWlJSVVpNYmE5dXZ3blhKWnFDRU9oVTRQSXI1RUJGcDdjOVU1?=
 =?utf-8?B?TGtaamZQc1Q2c21XOUo4TTIrbSthZCtoVFpmdXl6OWpOZ1Jhdng4L0NjeEtw?=
 =?utf-8?B?MnRVRUVhM0JPS3lBT1Jqa0ZmTkRmb1BnZmx6WEZYR0J1SVkyeVpZNEJ5ZndQ?=
 =?utf-8?B?VDY2MnVxM2UzMzQ0NHhKS2ZxSG9mSjVXNVo4L012N05zcUFxQU1jR0hJaE5P?=
 =?utf-8?B?MDlaWHplVnBWdEMzejRvenl2cnI5REhSZ0JwOVVZOWVQNjNkN3NSQXVXTlhM?=
 =?utf-8?B?ekxmcmtOTzEySmNYelNKZXY3NllYOEFWUDlhMW8zRGM1dWV3UnMvTy9TdG0r?=
 =?utf-8?B?SVF5U3lMZGpiS3duRlZJMFQ2b3liOTl1ZEJmVWtwelIzZG5vbXhRb1lseGdX?=
 =?utf-8?B?STZGSGdoRjFmcjdiOE1taU4xQ1RpQXFhbW00dXR5KytvbTBJamNOTnpRMzJv?=
 =?utf-8?B?YUgxeHhVaHlscGtvQVljYVB1NWEzbU1mUlJSazBrMkhVSVJjSVhVSjNIUWI3?=
 =?utf-8?B?MVpwK0RVc09lcUQzS2NTTWtHYjNxUXFOcDdSZ1BzOVpjYjErUC95ckpSM3VD?=
 =?utf-8?B?ck5qR2JJQVJQYTM2YW5Ga3hWQlpCdWNIQ1o2bXlIWm5YbjQvZTlETHJYY3FF?=
 =?utf-8?B?ZUFwOHRRalR4Z0ZxLzZnUzNrYUdIc0NNSG9RNitKNUhxOEZoN053OUZWcktR?=
 =?utf-8?B?UEQ4anZLaEQwSG9CMjJEVnIyVkRXQWxGaklENUJwbjBqNzlBU3B1My9zSzhq?=
 =?utf-8?B?VHJickZWTHRJb25DSDZ1bmNtcnFDUmIxLzd4d0tPeDQ4S3J2S1dYQktlUE1i?=
 =?utf-8?B?NUprTnBvQUFPNi9xZUJqOGxLSzdiQ2FWaWZvSzBxRU4xV2hVOXJkSk9NQjdj?=
 =?utf-8?B?bVlPd0FmM21qQXU0MDVZdUhJcllHbnZtYTFGZUhJTDhxaG41eTgyVmxCTStQ?=
 =?utf-8?B?aDR4MjJzTWsxdmliSlY4RE1LWVdzUmp5RjJtejNDQkxuWS9EbFNuY09xc1NI?=
 =?utf-8?B?dUd1RFJTUGhJU05MVnh2OUc0cDZYaksrREU5ZlpCU2hFcllwY0ovSEFDZTV1?=
 =?utf-8?B?WkFiUWdDTlhZeDlhN2VQOUtyMTJLZkx2V2FyWndRdUF6RW5wMS9ucDJNTXdV?=
 =?utf-8?B?VmRWbEdnNE1pNEJseVpvRnlMUFBvaG1YMmlrMHNSOTl0OEZwQUxpZllsWW1o?=
 =?utf-8?B?VFZNMExtMVRlVnkrNVJCc3Y4aW01K2hkVktmWDI0ZHU0amp0a1VpVGZDeTc1?=
 =?utf-8?B?MDRCcVVOTXRmMG81QUMyOW5tSDVDZUxtWUZmSzVvZk0yeW1uYnlVZ3NpSzQ1?=
 =?utf-8?B?a3JBQ1oyamdTSzlEWlVxTXpldzFjNVA1NXlBbzNKNEN0aGpndHNTeXVwOC9R?=
 =?utf-8?B?SHZmYkQzeDRsV3Q2eGErRnFZL2VGMHM5cmwxODN2Rmh2QktNM2hFeks3M29O?=
 =?utf-8?B?cnIzS2NyRWdNT1RFbkl2UldRS2taazJSM0E4bmtrRzFIUmdIblptTlNTTzdp?=
 =?utf-8?B?WWJGZDFZODBmYzFzdk5RWEJza01vc3dxWVhWZ29GeGVvUG15cXpGdFNBd2w2?=
 =?utf-8?B?UlJzL2RIMHRkN0lVQnVZVzNyVitFa05McE5lYVhJMkxDWXRFQXdxdzJmQlV3?=
 =?utf-8?B?Wm4vUE8xRU10UnR3c1N6T05pZExzWTlET3BjK3VwY0dsOTdaTmhYbDhpT1ph?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3553f0a-f58a-477b-a9b4-08dd03c8b9c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 09:51:20.2971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/P4YHlL0bj8tiVniqbrUfK5udtHQXWZU7yLJivObiOvfPjzhMZtSq+KIPZfIzyG/Z+GO4TJIUpJvSkG4K9Yrgv2QTxQSgVIVnXVY/B3lh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7163
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

On 2024-11-07 at 14:55:43 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_ctx_persistence: Wait for context termination (rev2)
> URL   : https://patchwork.freedesktop.org/series/140582/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8099_full -> XEIGTPW_12048_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12048_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12048_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12048_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12048/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-dp-2:
>     - shard-bmg:          [PASS][2] -> [INCOMPLETE][3] +3 other tests incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8099/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-dp-2.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12048/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-dp-2.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-lnl:          [PASS][4] -> [FAIL][5] +1 other test fail
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8099/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12048/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8099_full and XEIGTPW_12048_full:
> 
> ### New IGT tests (3) ###
> 
>   * igt@kms_invalid_mode@int-max-clock@pipe-d-dp-5:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-6-pipe-b-dp-5:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.26] s
> 
>   * igt@kms_setmode@basic@pipe-b-hdmi-a-6-pipe-a-dp-5:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.26] s
> 
>   
> 

These failures are unrelated, as the patch doesn't touch the failing
tests.

Thanks
Krzysztof

> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12048_full that come from known issues:
> 

(snip)

> Build changes
> -------------
> 
>   * IGT: IGT_8099 -> IGTPW_12048
>   * Linux: xe-2170-2b31f47649daecf2da6611c70072dfbe4914c22a -> xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541
> 
>   IGTPW_12048: c3987915a48309f1a3d780c16d3c3bb0832234ae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8099: 27be46dee80b6b0de80f9fa3cd9bb5f55edccaf8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2170-2b31f47649daecf2da6611c70072dfbe4914c22a: 2b31f47649daecf2da6611c70072dfbe4914c22a
>   xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541: e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12048/index.html
