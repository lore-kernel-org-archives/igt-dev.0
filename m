Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE558C0218A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 10:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF3910E62A;
	Tue, 28 Jan 2025 10:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYKs3ha3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C021E10E62A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 10:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738059313; x=1769595313;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=0FZnhYQq+GN+p8bFmWh1U4uPas/ArPTl4VTIFubyqZ0=;
 b=UYKs3ha3oYozqcGziEKHlnpk4tsfBl44Cbblu16yYOIGQXHMP2HGlqlj
 qN46n1wVzJzFmGXUL/AQjt60LgkzYwo7Pf5Mik4bYuzlv2/Xa+LHms+Fj
 qYbq4PV4fVLWUSrL6BIGOohdcuUsjwHKgkG3qR3GzFXfCDBoqaOpqiGam
 F+nQBBOCSEbrPIL5kbE69aWDGRYq0TIuDPyMlS8oDjP6Z4h9xTBqvIKbM
 KgRYtm6QBCoHQ6QokC4kAaeBlyAqRvSVLsFf6YkVUh4A4p10zv77lYXbr
 xFjBKR6f103nG5ayWduVPU6r4BKDjyMahuTzi+zL6luy0+D9gblSppXMV Q==;
X-CSE-ConnectionGUID: Fe8c1FOXSta4m9CHnJ15YA==
X-CSE-MsgGUID: rxT/PsENTxaRNxx/arjrlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="56079929"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="56079929"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 02:15:12 -0800
X-CSE-ConnectionGUID: 6aLiWZFCSamWkTvs55yv3Q==
X-CSE-MsgGUID: ojpyR/+EQTa20ZMk29Oe+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112697427"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 02:15:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 02:15:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 02:15:11 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 02:15:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiSBhlxoFUeKngo/LrrwfTgc2VYFcMwn7JVUD75zMIc1uHf3ghedDI8W0MB34jQ84NzU+BAMgsq9P3vgQJy1lcU7j1BW6fnRw3cXDyYIY5SpPE5WrsAI35U8JxeiAAKEgV11gNxPWCaqGevzPBfVwWMQcNED8qKGTXNLW+fqngXZaQusYZiFNAAiZpg5LX7T4vXA0zQ6WroWA3fVw5RpblqJrY3aKA7fiSjXGp168JkLq7ppxOGR7yYJ8DS8++0EIwaOuCOmWfWF5jK9awzN35DpCF2PwuHoz1M3n/9li/nqL7s/tJiBHln4O3gCOQXdeDQISZV+7G1SHPTKtt3gpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FZnhYQq+GN+p8bFmWh1U4uPas/ArPTl4VTIFubyqZ0=;
 b=DbGVLXz5aIc2egjEmJvtnuvZeCUmqff/P2A6bJPxMBGxeaPGAM5HkSJbXYaI+zraPouF9fUzGjDXKa/jCRdqVk7l7PXyDe93Dy1x0JF9kRIlZtKsvrIHH+3eQ14yxzLqaYKzww3x5IMZ1xljWYGLm/4y6TL/eOpg0IsJFg68ugPhf4hII8VkuvzwzAT2xisZsBuHjgcuNFzekjmXWREFnQDVjCRXVM8mfdED1e742TABcaWykjlE6usR3pHcf/0ix82wNxEICSbB4gk69ovZoJ97iMMOGFklhVJQhkPj2hRIlAb/ltRKRGzd8jjE2he/xwRCl1kQ9FzzgBhKswOl8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) by
 DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.23; Tue, 28 Jan 2025 10:14:29 +0000
Received: from DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::b81:6df0:d8b2:e596]) by DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::b81:6df0:d8b2:e596%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 10:14:29 +0000
Date: Tue, 28 Jan 2025 11:14:19 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH I-G-T v4] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <5ysplkgebqeqhurtqnhpkwd3cesuprm3fu2egl2anito5qva45@pw54c4tp6kfh>
References: <wk2ejntldlc7ayamr7iiblcmh6jumx5a563jpfllco56d4z53p@2ib6m5s55dfx>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <wk2ejntldlc7ayamr7iiblcmh6jumx5a563jpfllco56d4z53p@2ib6m5s55dfx>
X-ClientProxiedBy: VI1P191CA0003.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::7) To DM4PR11MB6430.namprd11.prod.outlook.com
 (2603:10b6:8:b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6430:EE_|DM3PR11MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1961eb-e9a0-495d-0685-08dd3f848cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVVXYmN1eVRQMzNkQ2M1T2xjSXRnaTMyR2o1T1VhVVV4aTlwUDU3Q2loUmU2?=
 =?utf-8?B?ZEpoNVFFRm96S216TmZWVUFicXl6RGZHSUdTSlg0d3pRNVZuTGQ2L0xKRE9m?=
 =?utf-8?B?ZE9wVHhJRjNXeE9hOUdPcTU2dnBUc3Brc2RPekh6YXBRVzVOS0lQQ2IvbXhS?=
 =?utf-8?B?ZHpqOXhsK0xVaWF2TnNCZndkQy9mck13T2NVb1ZwUGlmSGFiRnl5YmFvN0dZ?=
 =?utf-8?B?dDdydUt1NEUyVkJkOXBwMTE5VjJwUVVTVnA3NU1hTWRGQkFMcCtpeHZuV25H?=
 =?utf-8?B?UUxCVW82M29Ec09pYjBUOWEzNXJ1VmNQcXc2cS9YVjNGeXRHRWRFTHhCRDV0?=
 =?utf-8?B?N2VERVlWT0xOYXRBSGVKczBESHozVkc0amlJc3BJckl6TElSazFSVk9xd0Ns?=
 =?utf-8?B?UURpMmhGdlhEVDNmT24wQnpmWjZIZVp5aUpnMlZIQVJJSXVKWXBya29jaHFz?=
 =?utf-8?B?K3R1cHIyUVhEYjVQTERrWnZvZDZGMWR0Y3MwRHoxbzdNYXYxRDdsMWZNUUJm?=
 =?utf-8?B?bXdQdjIvZ3pwdTNjK0UxZytURXdPSUNNT0NnT1lSOGJ1emhtbjJaSTVsOEw0?=
 =?utf-8?B?WGFYeVRoc2szMWtPWG0yWUxWODlRZ2hsc3VGQXRaOW9ZMHFWUGQ1K2dMR2JY?=
 =?utf-8?B?WkE4OWw3clNHV25YWkNNeElSSzdoRUY5VmVpdERzQUhFd25EemJpUUNNeFYy?=
 =?utf-8?B?QmpiZ2UvcHJqNjZ5SVJJOGlPSXVaSkR1aWxjV3Y0V1hWQmRIeVBHMmZmNEVE?=
 =?utf-8?B?RFR5azA3MWdzdVJldHZNdGthNFBXYmlOTjlDWjErbWJSY3lEUy9iU3AvTzJF?=
 =?utf-8?B?SkFvaFRGU3oyUldsSE93bFFTeDB4cUlYL2xBSXl3aGtaZDRxaUVUeWc2VUZx?=
 =?utf-8?B?UzJDb3pSZ0U2akQyUEROeExhckRCdWlWcjJva3g0UTh1cE9IWEdzajhNK08w?=
 =?utf-8?B?d2llNGVmcEdHbHhoMFVHQlpqeE9DbVhSek5sYUdIUUtyQXZwMnJpeFpUL2RL?=
 =?utf-8?B?eFlCbmtiSFJHNk0rNE9sNHNqanpYd3NtRlpDWkE1QWlrcDhNY2dFRHpDNmxw?=
 =?utf-8?B?TE9DSzg4RlVuSkRlTmR6VDYzL1ZHZ0E1OG9oME1GcUViVGNjYVNua0dCaklu?=
 =?utf-8?B?V3c3djlXRnRmYWdyLzRpNlV3SUdqSUZONU5Fc1c4R05LNDAwSHpMYkhScjQ1?=
 =?utf-8?B?VGNqLzJ3b1ViRUlRQWdLSDBhUk0vNEZabmF6NjYwVE5QMXBkbVExQTBacHFT?=
 =?utf-8?B?Mno0bVBKeVYyVGRwb2orSDYrZEg3VnVzaVlqYi8rZVduNm1WMktlNTI0aGR6?=
 =?utf-8?B?cnVrSlFaeFpEN1dGVTYwTXlKOTZkVDV2OXNFUFo3aGozblh0aU05WkVGUjIv?=
 =?utf-8?B?aGt4VUZEK2hydWt0YVJqdWRRSnBwZVJDTlFKVXVhdlh2OWpLOEUxbkpXUE4y?=
 =?utf-8?B?Umxwb2JrL2loZjJqenVZMWFjQ3BwZzI2QkdYSVV3N24xOEE1NUtRZm0rZFBN?=
 =?utf-8?B?Yi8zZVdSd2FEVndYQ0hoU0VDUE1INCtLem1BRlRkejhEcm9YRkEvWm0zR3Rj?=
 =?utf-8?B?cXNOZ1hXaWorTG93ODJ0bVBrTGpJc3QwZXpjNVRMNnVRWWRqMFdHcW9lbGhX?=
 =?utf-8?B?aWRJT2w2UVBTVS9yNUFndSsyRTZzOERLQk1TSWhGZmJTanNWaVl2dllHaWxO?=
 =?utf-8?B?MmdtVE95dmJ3cm9udDZMMzIvZ1l6YVU1WE96bmZUTXEzN2pBRVlYd25BbHM0?=
 =?utf-8?B?aFE3cDlHTWdOZFZLWWR4K200K2pnbWszT1FRdENtNTR4U01uRFZaZUhLNzh3?=
 =?utf-8?B?bDdaRWttZ2hvVmZEMnlDMEJaZ3pWMnpmd2JFNjRyUkxiYkxnNk9hOWtYWEZS?=
 =?utf-8?Q?M5Cv4H2GHWnOt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1hCb2NXYUVIRERod0tGTVFQaU5UWUFmaFZEV0xpeTNmUkVCQWtmWm5pOVFa?=
 =?utf-8?B?eEltcUEwM0RCdXorb3N4YXR1Ym11UlkzL3VTSlFxQ1N0bUdsZUIzcTBPSVdV?=
 =?utf-8?B?c3gvY3RINWdXYlRiWGlieS9jV1ZNOHdKN2swOXJnaWdXSktNMWsrdFJ2V2lS?=
 =?utf-8?B?M2Z4KzZSYjhZY2toUHFaOWFDKzFZZC91TkNoMkx5VDFkdEZHbUlzSlp3OUEz?=
 =?utf-8?B?eW94OEhRZzZ6M1ZrYU1MdkwrRC80bUFjdnJmMnBXRVpBb3NNaGV3MVpzMHJQ?=
 =?utf-8?B?S29NeGhzRWZjU3g0d3dPSC9PbERmc291R1FDTGdHVmh6c1N2V2ZHVHVLZnFR?=
 =?utf-8?B?NGdKQ1VadGdXSmhxZWY1bUsxWXVYRGovaml5ZEQ5bndlT0E0NGZSUExYVS9l?=
 =?utf-8?B?bmpZdEMyRzh3Qksram45Q1RwcTRmRlUvaUdhMlVBWk1qMjE2MTBKVngwZXdX?=
 =?utf-8?B?ellGRUd4WlFJS2QzY1N4SEU1VGlYcGlrTFJiVnVad3VCWFd1KzJlZVRiLzF4?=
 =?utf-8?B?ZE5VdlY4NGIrSGptblZNK0h0Q1JNelFNVHliTVFCWlVSdVczM1dxdE1PMjNl?=
 =?utf-8?B?RkpVcCtqc2VZeTQvcUtLWlNsQzg0ZFZVNzhScHFyTituWE15RlFkcmZTNzEz?=
 =?utf-8?B?Q3BiYjFBRTY5dldQSWsvYWhqYVBMVjlOQ3VOeWdkM0ZpWVhyRk5GNDNSYXJV?=
 =?utf-8?B?WG1yS1ZrK1k1a09mdnZJK1pBakJpREwybXNWTVNUZmVxWTdoZjJQb0puMTlo?=
 =?utf-8?B?UDRzWnRiT2FOMzZ1T2VNL3FYSVhQbXlzcjdXODQzbHdwZ0FWY1o1TjdXUjc2?=
 =?utf-8?B?Zk1Oa0Q0N0Y2WXB5enJaeURwSnpaVk1vVG1xUWpzS2FZWldKN1lTRkEwNHI0?=
 =?utf-8?B?TXJRaDJ3WnMySnRIUGVpRUJqMWk1RGYvTU9qR2U5SHByQW5UWjRacFNlS2Fs?=
 =?utf-8?B?R05zOUg4cWRpMTFSdDdwV3kyZ1V4ZHh1czJNNWdKQkZCZ1B6SmdONTArRUd5?=
 =?utf-8?B?U1AxejhzTXBFbDNxN2VFZU5jSUZJRVlDNjJYdlFTRTV2MlJtVUVtaCt3SVVZ?=
 =?utf-8?B?KzJhUFcrMVVVQ3VVK1JQU2xtT05ZVk1sVHFKc25IczRzVlZxRzRJYzZyYWw4?=
 =?utf-8?B?Q2IvRS9IRW1LdXNEU1hFdVVrVXZoUEQyc0owNW8zQjFWMDlhSWI1TTY1elV6?=
 =?utf-8?B?ZVkwL1hOR0hydWs1QUpGa2EzWGNUVEl3Q3RuYXBsT3dnZGMzMTZwVTNVdnBD?=
 =?utf-8?B?d2l5eDA5eFpKU2Y3UlY0eFk2MW05MjIwRkZFSEdTcmRGMlZvV2Q5VGZiTEhx?=
 =?utf-8?B?V093dDFERlRTMWgweUJpa1ppYXNzekdDK2VtaXBMd3FhWWZSeUhzTERaLzVj?=
 =?utf-8?B?bTRVUXEzbTlibHZ5Z00zcTJmT0tjdjJENC9wK29oOTk4OE15NHdIbUpYRi92?=
 =?utf-8?B?ajM5bnhtUXNyclhNK3p6cmh2Z1lBcVBaSFlKUFFoWC9vaHVHelB1bmxBSGsz?=
 =?utf-8?B?Z1dSRENvYnNMRTJHREp0bWJod0F2aWl2QTNTbjcreW1BaEZ5c0FLVFhLQ3Y1?=
 =?utf-8?B?ZmV3a1NPaHlqLzVsdmpVZ09EaGk3RFBUbkllQStabHhlenoyMlRsOFJmUkZB?=
 =?utf-8?B?bVRzamsyUXYrUG5iRVhJWDJ6Vm0vR2xMdUZFN2ZmOGxzKzZlVmhmRUJmN2U3?=
 =?utf-8?B?dy9pTThIdHNNYXNyMmJWZE95a1ExVnJzTUYrTHVEcytpa1BnTWVTV3BYNnBn?=
 =?utf-8?B?M3JKdkNKMzdLbE9sRUhueFJJUHl5dTNZdGZ5NWo1N0VSd2RmbEdaeDJlNzdE?=
 =?utf-8?B?bEZHM296eTZGcWdLY28yczhId1p4SG8yS0V4NXFvK1hUbkhsUXByNHBhKzlW?=
 =?utf-8?B?S3RPbjUwbnJLTFRqNWVabGlTdUN1anNuOFJiRTJiZDJDYnJZTEowOGQ2Q1pE?=
 =?utf-8?B?cjI4Y3FRRVh6NWEycVplVzFreGFUOHc3eE1uR0RPcy9iejg1dGdFYkMzOHJW?=
 =?utf-8?B?aU10RGtNcTE0YWlkNk1BaitBK1JSN1ArN2dTdlNwaXRSL2ZGR0ZiVmRxa3Vu?=
 =?utf-8?B?KzYvay9UdE10dlpDMnlLanFhR2ZKRHN6ZzVyVXpKcUw0SksvMDdKcEM4aGpL?=
 =?utf-8?B?VUZEMURmdHpFRVlxNkdLOHlLUnFPdU1CbXBLVk8ybGs3L3ozNUs3eXVlZTNk?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1961eb-e9a0-495d-0685-08dd3f848cda
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 10:14:28.9404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aekatsrwM1Pq8v5USWSI+xnaZsPyULG5bmtkv3ebv16bVrBClbgwmE9X4v/fFpuKNyRxq9decHLEkwtwZDyYNhBKrGIncO3mUP3BWJPssfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8683
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

This patch can be dropped as the fail stopped appearing in CI
Mikolaj
