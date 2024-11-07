Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156AAD5AE61
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 05:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E9D10E305;
	Thu,  7 Nov 2024 05:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWVN+Few";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6F410E231
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 05:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730957624; x=1762493624;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=v4zlS3Aviimz/SsT4DS8GTsuhGA8upcaLJ63GG6n+mc=;
 b=FWVN+FewrG53u7SoGIh5e6U/AJ3XRAFROb7c4kg2jqQm0LPY7ACh7T2v
 TQFVHfy2/1LV26nu1UE4gis4VXL5n40daKczilpfJnLW/2NDu0tF0q3LQ
 kV8LVa8ggt5yca9kcgakI1D5XFopvRKVo+z9HXL1jLklahSIBvkHPcRJ+
 d7vIm1fdPH1Bun7Xe+WoOlNQqXfv+pyDMAtsTgmRDP8vR2Jm7BtABlbEX
 Y31BFzFNfZTptJKhEdjAJgq3OPPd0WOpzcrR6Dl1xqJMMHDjtReNEvNKw
 MuWUj7Z2MQR1cBgK/hq5RX6yboShtkg6H55tAww3yEYb4eFNho8tvG+sw g==;
X-CSE-ConnectionGUID: CQNbOz/zQ7+h/St1HAmVaw==
X-CSE-MsgGUID: U58blkOqTE+sDuhAoR30mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30962678"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208,217";a="30962678"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 21:33:44 -0800
X-CSE-ConnectionGUID: hT7J5UBRTPCXyij+GOyGVw==
X-CSE-MsgGUID: nW1jTNQIRCSZYfq14dtDUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208,217";a="89721187"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 21:33:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 21:33:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 21:33:43 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 21:33:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZKrNOV86eWiIgLvtqFSmjzm0cGHHo7LWB0nklLa75rJJIjjK2q7icD72s5szwba672Ayst+rZTIDMdjETztfiaA11W5wh/HGUwAnXcQZKCD1UMRNqgJfJCayidIdyCh97Vmniwj7OJNkM+8rXot8aZqY2DRsd4siwDLJ/nduRdlzkjwAaOrv7nsyDwlXnSb6Jrwj9S697xTui3IUZB/fpVBFFC2Jfc9LhgB7MDz2aXt6V3oD7g+CHPabwiP68QmHJ57MpseFt8GKULk5MyrAxMl3+huJ3479gusK7qlLEVOhrVP0N/tzsBNM+DBQe0rrKrdCYvJmSIftPZDZ68d8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKtJGMUrfJFQeBSNJnh+ymnlADQJ0/mG/4Hp8p9CGFI=;
 b=NS2m3m57PBpdy2CMxjDs25q79s8UAYDmUj4FifiXK42gj95xZjTiEziuLr8LD/RvOGROlNbZoDw/H1JyNf4/Fgn8aef1ouSbyhaBmlxmRaBFMwRUGJ+0LkF5hDD+b7hiABercu07t+GItVoftIoGODt98f2gOFUYWTM9vIMigkNOKAZ8gPzEXAswTCiGhOLopTshDk44chyhX/bnPwC2QKoHjKhk5qT1eVoxinHG3ibziewUvSMF0dbqPSXSpbnB0jMgTQfB7fTS4sR4G2Fhnis3601Y245MgTu6ulKR0+az6Uz23N1vMF+DmVkfeqDpiB/1RTe6artDpVxkKCcPvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB8528.namprd11.prod.outlook.com (2603:10b6:510:2fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 05:33:35 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8114.031; Thu, 7 Nov 2024
 05:33:34 +0000
Content-Type: multipart/alternative;
 boundary="------------iTi4ZA6GB4xJCxBHHCsgW6BG"
Message-ID: <2f84c87b-7942-461d-bbe6-3cb1d23a3882@intel.com>
Date: Thu, 7 Nov 2024 11:03:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_async_flips: subtests to validate
 async flips on atomic path
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241015145240.141244-1-santhosh.reddy.guddati@intel.com>
 <20241015145240.141244-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20241015145240.141244-2-santhosh.reddy.guddati@intel.com>
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: 9170dc95-582b-404e-8cdd-08dcfeedb81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUljd0ZpMGNyNEZ1cm04S1ZXd3hZdUJEeklkd1ppT2FXejdxSEtvS2RKMmVk?=
 =?utf-8?B?MW9SVUgwSHc4VVkvQzJrN3lFdHpzbGcwNVA2VUR3bE9lREtsSlR0N3hyOS95?=
 =?utf-8?B?UE1pZ2lBbW82bUdUUFFibFFGM0R0ZFg1Mk5FbjdUeTMvR2VGbVNVSTdwZUhE?=
 =?utf-8?B?bkZVOE9PRkYyWFZXclFkbmZKaTVCWUFacFZRZGRPSXBJcjRwbjVnNWlud0NR?=
 =?utf-8?B?RGRJeVhkVk5pWS8wZkxPRmd4QWxGS3o5ZG02MXNmYVN2NkRlQUZxNzhkRXBB?=
 =?utf-8?B?UURzT2g0dnZNNElHWVVIb2RIUEJrM2FpWnRudjB5MGtzODlwTnFWblZyb3J2?=
 =?utf-8?B?UkdHT2loSkxpVW01NndaTGRBTjA2TWVZcjV6SkNod0pZNW1vaE9NRzMxdEk4?=
 =?utf-8?B?MHVjQ3l1TTFxTEYrR2llUEx3OC80ZW1YNjA5VkNNdUVpWmVlREY1R1RzakFw?=
 =?utf-8?B?UUZpak5GSnFrbTJIcjk4b1d2ellySHBvNGx6YUxCQWhMNk94SkJ2OEtRMTlJ?=
 =?utf-8?B?V0llakRsWlNQa1o5bzhGVE1FbVc3TDlWMDNUQTBlcHdUQU1SeDFGRXN2Smps?=
 =?utf-8?B?Q1NXZk9pS09tVUovaUFyZndMa1Y1bEZta205SGhHSFVuYmpzV0kzRmEvYVNR?=
 =?utf-8?B?N2p5aHlxaG9paTBQQ1lxVlVVK3FUeG1YRkdHZDBZR0xFVCtubjVYcWRINmFQ?=
 =?utf-8?B?ZWRxN2p5dlNpYURUTlBwcXhPbnhyVWZhYnJINzNtdE9MRStJTVZGMXdjRXJH?=
 =?utf-8?B?VWd6TDRJL2EycFRlcUFTTXlYUDVGWHVrMmNFeCtoY1NWOHB3NHQ2TXRvQU1M?=
 =?utf-8?B?Q0hCMitPR1lxRm9hZzFzSWZBT2RPQzMrUEVRRXRwdXF5bG4wcVNEdmh2cjJT?=
 =?utf-8?B?b1VGck9YVG04N0ZIY0x5UnlqOEZRTm8ySW14cDAvZktFTzRrVlRoWXd2S0tl?=
 =?utf-8?B?SFd3ellvd0Fsc1hQQmIwdERHRFlkN0daOFE0Ykh3NmYyV05EWEt1cWVGbXFN?=
 =?utf-8?B?TDlpckNGOW04U29wckMzN2UwNDNmSzljaW5LK09zL213MnR5amhmTXYvbEVw?=
 =?utf-8?B?SmZPYmtLa0IrSWpDTjEyakxDZjY1WHU0WUVHcFg3d2s4dmRyTmJ2RWd1aEtP?=
 =?utf-8?B?aS9NS0hFamNCaXFIKzhCakdPS3NPZ284d09ESCtVM3FlWEkxZkRqbWlaWkpD?=
 =?utf-8?B?dzBsSStYYmNVWjQrR2w2T3hCRHBYbzdmWDZ4STBKMm1uR1dnYkF6M2k3UGJU?=
 =?utf-8?B?WkVKaVUybUxLK3J4MzRQalMyVGdtcFZaVmx5YVMyUEt1c2ZQT3hGM2ZGK3cz?=
 =?utf-8?B?Rno4RXdlYmJiVWZyY3ljQWRrUGxyYUxleitOZTQwNnVsNE5mNTFHL2Y5STdR?=
 =?utf-8?B?eFJIYUxlaFFDOWtkdWlyOTBrdk85QTN2L09ZL2EwcEZKaDhFcDRlZGtaQmdz?=
 =?utf-8?B?b3BrUUpQd3dpMDMvaFM1dmhuUkYvOFJ6dng4d0YycTc5R0twSVY0QzZ5aExz?=
 =?utf-8?B?bjFhVjRNa3BkZVRNWjhzd1JGSG56aHZYdFpQSFVLaXAwcmVoYUxJeGlSTkF2?=
 =?utf-8?B?dWxrUzM5RitIL2JyVHVEOTNSblVlM3N5TVl5SW5vSmx1bUtaU0xhckpRbytB?=
 =?utf-8?B?TXFKMm56YXRSVWUwMzJSaTlOYkdHcUNkcDVWN0tCZTE4RXF4VkMveEc4VnVK?=
 =?utf-8?B?UlpoZEFtVE54dTNpanRPbmdNTTV4by9ydW50ZXhCc1U1MmdXTitNRE9YVy9n?=
 =?utf-8?Q?wv6S0Uc0tNppwhC5HHSArOgLKzZCD32HPUTYvWq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDhGNFNjem9SMDhRWmY2bVJTSVE1NmRPL3NGazNub0QzSXM5bk54bWpJa0Vq?=
 =?utf-8?B?cHBqNnZxVWZKazBwSjVza1lrSlFuZHZMRit6c1BrNnhlY2RBRzdhNDE2N2pS?=
 =?utf-8?B?MXlXYWliSlZTM3dGQ3VFelZ3K2hLUEh4aTJMM2FlS29tS1JjSFQxSnh6c0Zq?=
 =?utf-8?B?alFzakZDaHpKWEwyeVJYcmEyTFVoU2tIQU5kM1dta1U0NTJsWmF2T1NzTm1W?=
 =?utf-8?B?QS9mV3BxZlV0L2EwcllxWlNrakNHVXZHWmdoOTlxb0QwSGNDRmtsdWxTTVp4?=
 =?utf-8?B?QlpKSTJublVMQm9NejRxUzk5Z0JsRGlHMmQ0SFlnaU9tVVVaZE4rbVpXVDRv?=
 =?utf-8?B?Y3VzM3lTM252MlE0QUlQWFlDWnZ4L3EwdXNZWWp3U0ZIN1JFSk1obWY0aitD?=
 =?utf-8?B?clp2cU1pcE5UZkJoM0RRTmdmYWYvRWFhaGU3ZjBERm5xeW4zR3NxOVlwZnFB?=
 =?utf-8?B?MnhKeVpjMkhHcU1GMEZUWG14VUQ2Nit1dEw5V3BISy9mNERVUHVPYkdZdnNx?=
 =?utf-8?B?NktwTVRnL2FHTEFHazNNZUVZb1QzYjhzVTdFQk1NcUpVZ3FvbFV6SmJhb1gv?=
 =?utf-8?B?UERVY3FMVnpWdktYYjI2WXpJdWN2VDNxM3dMVTNaNHJLMzJkQVczMDNIUXFV?=
 =?utf-8?B?dlpLdnNUcHlYdi92WklObkxnajhDNFpJL0xqVDkxZE5YRUdHcGpiQmxLNFF2?=
 =?utf-8?B?YmhhUHRsZ2t1YTdPRTBBMmx2ZmtJbTZMb2Y1alZDUjhEZThqWnlXZjQ1UENT?=
 =?utf-8?B?QjNYMDdFR0JxaWJGOW03dGRKNjZ4WDg0Y0hhSmpEY0I0OVBJU0x3WVVrZFFl?=
 =?utf-8?B?Y0g1Zi9nYUxqZXRmTDA4MlM0RERTNktYOG5EQUVmTXE1UlBJQlVFL2wwSkJR?=
 =?utf-8?B?a3VuU0x6SWZINU00Sis2TW16T3IyejJjcU1zR3lwdTdKM2toLzE0OFE2anNU?=
 =?utf-8?B?OWtrRnBjOWgzaTB4Zk9zdmJZYzlnTmQzRC93d3MvMjJBa2g3eEpaNnBZRUcz?=
 =?utf-8?B?VkplM0doVFpJWmx0MzZEZEZNeWVkbTZzZVJMSWpDUXBmSjNMOUNyNUNKSTBW?=
 =?utf-8?B?R29NNzJNSkJxeU1iWXEvTnQxNGxEK3JsZ0N1U1BMb1pyTVVmYnBwL0ljaEk0?=
 =?utf-8?B?M3NQaTVMNHVOdzBOM3o4R3dNZkZ5Q1BNVlZhT0FwK3MramZRcW9ndVl6MUt3?=
 =?utf-8?B?ekxXb3YrQnpoRm5uZmhQSmRXVW1mSmxHOTZibENtbjhjS05pMmE3VVNMYUVo?=
 =?utf-8?B?MXZ5VGUzN3IvQVJ2eGRWK0xLR3Z1azNwbHFLT3E5YW1wMDJTL1BYd1NXWTFn?=
 =?utf-8?B?K3VPOHViSDRMbURTZHdjUFVJQmltaGtLZ3FTeS95Y29nSStXcGdJSG5EWlBH?=
 =?utf-8?B?blQ1ejUzMzlVMzU0VWhKenhjY2h6cTYxaUlKbE5RV0VqMVAyNEZQd3A1cVhB?=
 =?utf-8?B?b01vWlVtOXFHdUlsTUlIZmpxRGhiNnhGQm9WaUtNMEdVSFRVcXBTM1lTMmQ5?=
 =?utf-8?B?dWI3V0RzUHFvdU11ZGhDZE9XMTJrODQwVVpNWllsQzRHQmdNU2lUbU40Ny9C?=
 =?utf-8?B?aktscDNmdnZKTmU2V1NjQXdCZFdES2dvMWcvSFNSYXRRUnNSNjR5ck02WDNp?=
 =?utf-8?B?YWFTSHZEemh3YmJtOFZObWNNb3R5L1daQTlzY2JFNzc3cTlPYlpoTzN2OXBZ?=
 =?utf-8?B?K0lqK1Z3VjdKVy9tdXFVb0R0TGtPWVBJM3U3S2VpRnBIdXhmU3RvMFBNdFBo?=
 =?utf-8?B?SXMyM0VEL3MycTM1OFlFclhnYzJZWFdzY0lveE9JaTRwMXQ4YWY2QUpsMGta?=
 =?utf-8?B?clkwZS8xUnZ0aTJwVmY1dEUxQzZKeE5Zam5VQkQwOG9ra0c2cmpyRDN2N2xT?=
 =?utf-8?B?S21GVjVWR1h5OGs0cWJTRDdiY1RxeWV4d2pOaWNHN1ZTNC8vMEdHRjF4eXNJ?=
 =?utf-8?B?VUdqWDQzWWxxZE5pZlg5Sndnd25VWW5GUU4yNDc1Z3ZWNVVrbFhlVlJMaUg2?=
 =?utf-8?B?Y21VdGwvd1VLdGJ4Ykc4TVBUSk9YRGdMeElXWjZzM3NwZW01cWU1S3pwYmcx?=
 =?utf-8?B?T013NWVNSlZKdjVWSDhodTZ0QU9ZTTRPb0V5MWE2d0hjMGhiYjBvMUxneW81?=
 =?utf-8?B?amJVdVJKZ3JSb1MwYWxwMXJXT2dwU2ZmSTdYVGE4UXRCcWdReHUrbXN4VFdR?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9170dc95-582b-404e-8cdd-08dcfeedb81f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 05:33:34.5314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aqDVRQlAVIxvwxNTY/SHGf39BVj9viVjJhQjV+G31fTACdHPtIS3JzfpUJ6S4fCcf+CkIcGBB96hPpFiT0cPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8528
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

--------------iTi4ZA6GB4xJCxBHHCsgW6BG
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/15/2024 8:22 PM, Santhosh Reddy Guddati wrote:
> subtest to validate async flips with atomic commit
>
> v2: refactor repeated code to function (Karthik)
> explicitly set atomic_path to false in legacy tests (Karthik)
>
> v3: fix test_crc and test_invalid subtests
>
> Signed-off-by: Santhosh Reddy Guddati<santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 170 ++++++++++++++++++++++++++++++++++------
>   1 file changed, 144 insertions(+), 26 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 5dec71291..b5961028a 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -67,6 +67,26 @@
>    * SUBTEST: invalid-async-flip
>    * Description: Negative case to verify if changes in fb are rejected from kernel as expected
>    *
> + * SUBTEST: alternate-sync-async-flip-atomic
> + * Description: Verify the async flip functionality and the fps during async flips using atomic path
> + *
> + * SUBTEST: async-flip-with-page-flip-events-atomic
> + * Description: Wait for page flip events in between successive asynchronous flips using atomic path
> + *
> + * SUBTEST: test-time-stamp-atomic
> + * Description: Verify that the async flip timestamp does not coincide with either previous
> + *              or next vblank when async flip is done using atomic path
> + *
> + * SUBTEST: test-cursor-atomic
> + * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip with atomic commit
> + *
> + * SUBTEST: invalid-async-flip-atomic
> + * Description: Negative case to verify if changes in fb are rejected from kernel
> + *              as expected when async flip is done using atomic path
> + *
> + * SUBTEST: crc-atomic
> + * Description: Use CRC to verify async flip scans out the correct framebuffer with atomic commit
> + *
>    * SUBTEST: async-flip-suspend-resume
>    * Description: Verify the async flip functionality with suspend and resume cycle
>    */
> @@ -105,6 +125,7 @@ typedef struct {
>   	bool suspend_resume;
>   	bool allow_fail;
>   	struct buf_ops *bops;
> +	bool atomic_path;
>   } data_t;
>   
>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -259,6 +280,21 @@ static bool async_flip_needs_extra_frame(data_t *data)
>   	return intel_display_ver(devid) >= 9 || IS_BROADWELL(devid);
>   }
>   
> +static int perform_flip(data_t *data, int frame, int flags)
> +{
> +	int ret;
> +
> +	if (!data->atomic_path) {
> +		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> +				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
> +	} else {
> +		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
Hi Santhosh,
> +		ret = igt_display_try_commit_atomic(&data->display, flags, data);
Can we use commit here instead of try commit so that the assert check 
later can also be avoided?
> +	}
> +
> +	return ret;
> +}
> +
>   static void test_async_flip(data_t *data)
>   {
>   	int ret, frame;
> @@ -276,9 +312,7 @@ static void test_async_flip(data_t *data)
>   		if (data->alternate_sync_async) {
>   			flags &= ~DRM_MODE_PAGE_FLIP_ASYNC;
>   
> -			ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -					      data->bufs[frame % NUM_FBS].fb_id,
> -					      flags, data);
> +			ret = perform_flip(data, frame, flags);
>   
>   			igt_assert_eq(ret, 0);
>   
> @@ -287,19 +321,16 @@ static void test_async_flip(data_t *data)
>   			flags |= DRM_MODE_PAGE_FLIP_ASYNC;
>   
>   			if (async_flip_needs_extra_frame(data)) {
> -				ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -						      data->bufs[frame % NUM_FBS].fb_id,
> -						      flags, data);
>   
> +				ret = perform_flip(data, frame, flags);
>   				igt_assert_eq(ret, 0);
>   
>   				wait_flip_event(data);
>   			}
>   		}
>   
> -		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -				      data->bufs[frame % NUM_FBS].fb_id,
> -				      flags, data);
> +		ret = perform_flip(data, frame, flags);
> +
>   		if (frame == 1 && data->allow_fail)
>   			igt_skip_on(ret == -EINVAL);
>   		else
> @@ -428,9 +459,7 @@ static void test_cursor(data_t *data)
>   
>   	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_CURSOR, &cur);
>   
> -	ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -			      data->bufs[0].fb_id,
> -			      flags, data);
> +	ret = perform_flip(data, 0, flags);
>   
>   	igt_assert_eq(ret, 0);
>   
> @@ -450,6 +479,7 @@ static void test_invalid(data_t *data)
>   	int ret, width, height;
>   	struct igt_fb fb[2];
>   	drmModeModeInfo *mode;
> +	int flags;
>   
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> @@ -457,6 +487,8 @@ static void test_invalid(data_t *data)
>   	width = mode->hdisplay;
>   	height = mode->vdisplay;
>   
> +	flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
> +
>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>   		      I915_FORMAT_MOD_X_TILED, &fb[0]);
>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> @@ -465,16 +497,27 @@ static void test_invalid(data_t *data)
>   	igt_plane_set_fb(data->plane, &fb[0]);
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> -	/* first async flip is expected to allow modifier changes */
> -	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id,
> -			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> -	igt_assert_eq(ret, 0);
> -	wait_flip_event(data);
> +	if (!data->atomic_path) {
> +		/* first async flip is expected to allow modifier changes */
> +		ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id, flags, data);
> +		igt_assert_eq(ret, 0);
>   
> -	/* subsequent async flips should reject modifier changes */
> -	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id,
> -			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> -	igt_assert(ret == -EINVAL);
> +		wait_flip_event(data);
> +
> +		/* subsequent async flips should reject modifier changes */
> +		ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id, flags, data);
> +		igt_assert(ret == -EINVAL);
> +	} else {
> +		igt_plane_set_fb(data->plane, &fb[1]);
> +		ret = igt_display_try_commit_atomic(&data->display, flags, data);
> +		igt_assert_eq(ret, 0);
> +
> +		wait_flip_event(data);
> +
> +		igt_plane_set_fb(data->plane, &fb[0]);
> +		ret = igt_display_try_commit_atomic(&data->display, flags, data);
> +		igt_assert(ret == -EINVAL);
> +	}

Please document the reason as to why we are not using perform_flip 
function in the invalid subtest case.

Regards,
Karthik.B.S
>   
>   	/* TODO: Add verification for changes in stride, pixel format */
>   
> @@ -588,6 +631,8 @@ static void test_crc(data_t *data)
>   	int ret, width, height;
>   	drmModeModeInfoPtr mode;
>   
> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	/* make things faster by using a smallish mode */
>   	mode = &data->output->config.connector->modes[0];
>   	width = mode->hdisplay;
> @@ -620,8 +665,9 @@ static void test_crc(data_t *data)
>   		paint_fb(data, &data->bufs[frame], 1, height, 0xff0000ff);
>   
>   		data->flip_pending = true;
> -		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
> -				      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> +
> +		ret = perform_flip(data, frame, DRM_MODE_PAGE_FLIP_ASYNC |
> +				   DRM_MODE_PAGE_FLIP_EVENT);
>   		igt_assert_eq(ret, 0);
>   
>   		wait_events_crc(data);
> @@ -708,6 +754,18 @@ igt_main
>   		igt_describe("Wait for page flip events in between successive asynchronous flips");
>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>   			data.alternate_sync_async = false;
> +			data.atomic_path = false;
> +			if (is_intel_device(data.drm_fd))
> +				run_test_with_modifiers(&data, test_async_flip);
> +			else
> +				run_test(&data, test_async_flip);
> +		}
> +
> +		igt_describe("Wait for page flip events in between successive "
> +			     "asynchronous flips using atomic path");
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
> +			data.alternate_sync_async = false;
> +			data.atomic_path = true;
>   			if (is_intel_device(data.drm_fd))
>   				run_test_with_modifiers(&data, test_async_flip);
>   			else
> @@ -717,12 +775,30 @@ igt_main
>   		igt_describe("Alternate between sync and async flips");
>   		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>   			data.alternate_sync_async = true;
> +			data.atomic_path = false;
> +			run_test(&data, test_async_flip);
> +		}
> +
> +		igt_describe("Alternate between sync and async flips using atomic path");
> +		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
> +			data.alternate_sync_async = true;
> +			data.atomic_path = true;
>   			run_test(&data, test_async_flip);
>   		}
>   
> -		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
> -		igt_subtest_with_dynamic("test-time-stamp")
> +		igt_describe("Verify that the async flip timestamp does not "
> +			     "coincide with either previous or next vblank");
> +		igt_subtest_with_dynamic("test-time-stamp") {
> +			data.atomic_path = false;
>   			run_test(&data, test_timestamp);
> +		}
> +
> +		igt_describe("Verify that the async flip timestamp does not coincide "
> +			     "with either previous or next vblank with atomic path");
> +		igt_subtest_with_dynamic("test-time-stamp-atomic") {
> +			data.atomic_path = true;
> +			run_test(&data, test_timestamp);
> +		}
>   	}
>   
>   	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
> @@ -733,9 +809,25 @@ igt_main
>   		 * supported in cursor plane.
>   		 */
>   		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
> -			      "PSR2 sel fetch causes cursor to be added to primary plane " \
> +			      "PSR2 sel fetch causes cursor to be added to primary plane "
>   			      "pages flips and async flip is not supported in cursor\n");
>   
> +		data.atomic_path = false;
> +		run_test(&data, test_cursor);
> +	}
> +
> +	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after "
> +		     "async flip with atomic commit");
> +	igt_subtest_with_dynamic("test-cursor-atomic") {
> +		/*
> +		 * Intel's PSR2 selective fetch adds other planes to state when
> +		 * necessary, causing the async flip to fail because async flip is not
> +		 * supported in cursor plane.
> +		 */
> +		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
> +			      "PSR2 sel fetch causes cursor to be added to primary plane "
> +			      "pages flips and async flip is not supported in cursor\n");
> +		data.atomic_path = true;
>   		run_test(&data, test_cursor);
>   	}
>   
> @@ -748,6 +840,21 @@ igt_main
>   		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
>   						       I915_FORMAT_MOD_Y_TILED));
>   
> +		data.atomic_path = false;
> +		run_test(&data, test_invalid);
> +	}
> +
> +	igt_describe("Negative case to verify if changes in fb are rejected "
> +		     "from kernel as expected when async flip is done using atomic path");
> +	igt_subtest_with_dynamic("invalid-async-flip-atomic") {
> +		data.atomic_path = true;
> +		/* TODO: support more vendors */
> +		igt_require(is_intel_device(data.drm_fd));
> +		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
> +						       I915_FORMAT_MOD_X_TILED));
> +		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
> +						       I915_FORMAT_MOD_Y_TILED));
> +
>   		run_test(&data, test_invalid);
>   	}
>   
> @@ -756,6 +863,17 @@ igt_main
>   		/* Devices without CRC can't run this test */
>   		igt_require_pipe_crc(data.drm_fd);
>   
> +		data.atomic_path = false;
> +		run_test(&data, test_crc);
> +	}
> +
> +	igt_describe("Use CRC to verify async flip scans out the correct framebuffer "
> +		     "with atomic commit");
> +	igt_subtest_with_dynamic("crc-atomic") {
> +		/* Devices without CRC can't run this test */
> +		igt_require_pipe_crc(data.drm_fd);
> +
> +		data.atomic_path = true;
>   		run_test(&data, test_crc);
>   	}
>   
--------------iTi4ZA6GB4xJCxBHHCsgW6BG
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/15/2024 8:22 PM, Santhosh Reddy
      Guddati wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241015145240.141244-2-santhosh.reddy.guddati@intel.com">
      <pre wrap="" class="moz-quote-pre">subtest to validate async flips with atomic commit

v2: refactor repeated code to function (Karthik)
explicitly set atomic_path to false in legacy tests (Karthik)

v3: fix test_crc and test_invalid subtests

Signed-off-by: Santhosh Reddy Guddati <a class="moz-txt-link-rfc2396E" href="mailto:santhosh.reddy.guddati@intel.com">&lt;santhosh.reddy.guddati@intel.com&gt;</a>
---
 tests/kms_async_flips.c | 170 ++++++++++++++++++++++++++++++++++------
 1 file changed, 144 insertions(+), 26 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5dec71291..b5961028a 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -67,6 +67,26 @@
  * SUBTEST: invalid-async-flip
  * Description: Negative case to verify if changes in fb are rejected from kernel as expected
  *
+ * SUBTEST: alternate-sync-async-flip-atomic
+ * Description: Verify the async flip functionality and the fps during async flips using atomic path
+ *
+ * SUBTEST: async-flip-with-page-flip-events-atomic
+ * Description: Wait for page flip events in between successive asynchronous flips using atomic path
+ *
+ * SUBTEST: test-time-stamp-atomic
+ * Description: Verify that the async flip timestamp does not coincide with either previous
+ *              or next vblank when async flip is done using atomic path
+ *
+ * SUBTEST: test-cursor-atomic
+ * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip with atomic commit
+ *
+ * SUBTEST: invalid-async-flip-atomic
+ * Description: Negative case to verify if changes in fb are rejected from kernel
+ *              as expected when async flip is done using atomic path
+ *
+ * SUBTEST: crc-atomic
+ * Description: Use CRC to verify async flip scans out the correct framebuffer with atomic commit
+ *
  * SUBTEST: async-flip-suspend-resume
  * Description: Verify the async flip functionality with suspend and resume cycle
  */
@@ -105,6 +125,7 @@ typedef struct {
 	bool suspend_resume;
 	bool allow_fail;
 	struct buf_ops *bops;
+	bool atomic_path;
 } data_t;
 
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
@@ -259,6 +280,21 @@ static bool async_flip_needs_extra_frame(data_t *data)
 	return intel_display_ver(devid) &gt;= 9 || IS_BROADWELL(devid);
 }
 
+static int perform_flip(data_t *data, int frame, int flags)
+{
+	int ret;
+
+	if (!data-&gt;atomic_path) {
+		ret = drmModePageFlip(data-&gt;drm_fd, data-&gt;crtc_id,
+				      data-&gt;bufs[frame % NUM_FBS].fb_id, flags, data);
+	} else {
+		igt_plane_set_fb(data-&gt;plane, &amp;data-&gt;bufs[frame % NUM_FBS]);</pre>
    </blockquote>
    Hi Santhosh,<span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20241015145240.141244-2-santhosh.reddy.guddati@intel.com">
      <pre wrap="" class="moz-quote-pre">+		ret = igt_display_try_commit_atomic(&amp;data-&gt;display, flags, data);</pre>
    </blockquote>
    Can we use commit here instead of try commit so that the assert
    check later can also be avoided?<br>
    <blockquote type="cite" cite="mid:20241015145240.141244-2-santhosh.reddy.guddati@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	}
+
+	return ret;
+}
+
 static void test_async_flip(data_t *data)
 {
 	int ret, frame;
@@ -276,9 +312,7 @@ static void test_async_flip(data_t *data)
 		if (data-&gt;alternate_sync_async) {
 			flags &amp;= ~DRM_MODE_PAGE_FLIP_ASYNC;
 
-			ret = drmModePageFlip(data-&gt;drm_fd, data-&gt;crtc_id,
-					      data-&gt;bufs[frame % NUM_FBS].fb_id,
-					      flags, data);
+			ret = perform_flip(data, frame, flags);
 
 			igt_assert_eq(ret, 0);
 
@@ -287,19 +321,16 @@ static void test_async_flip(data_t *data)
 			flags |= DRM_MODE_PAGE_FLIP_ASYNC;
 
 			if (async_flip_needs_extra_frame(data)) {
-				ret = drmModePageFlip(data-&gt;drm_fd, data-&gt;crtc_id,
-						      data-&gt;bufs[frame % NUM_FBS].fb_id,
-						      flags, data);
 
+				ret = perform_flip(data, frame, flags);
 				igt_assert_eq(ret, 0);
 
 				wait_flip_event(data);
 			}
 		}
 
-		ret = drmModePageFlip(data-&gt;drm_fd, data-&gt;crtc_id,
-				      data-&gt;bufs[frame % NUM_FBS].fb_id,
-				      flags, data);
+		ret = perform_flip(data, frame, flags);
+
 		if (frame == 1 &amp;&amp; data-&gt;allow_fail)
 			igt_skip_on(ret == -EINVAL);
 		else
@@ -428,9 +459,7 @@ static void test_cursor(data_t *data)
 
 	do_ioctl(data-&gt;drm_fd, DRM_IOCTL_MODE_CURSOR, &amp;cur);
 
-	ret = drmModePageFlip(data-&gt;drm_fd, data-&gt;crtc_id,
-			      data-&gt;bufs[0].fb_id,
-			      flags, data);
+	ret = perform_flip(data, 0, flags);
 
 	igt_assert_eq(ret, 0);
 
@@ -450,6 +479,7 @@ static void test_invalid(data_t *data)
 	int ret, width, height;
 	struct igt_fb fb[2];
 	drmModeModeInfo *mode;
+	int flags;
 
 	igt_display_commit2(&amp;data-&gt;display, data-&gt;display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -457,6 +487,8 @@ static void test_invalid(data_t *data)
 	width = mode-&gt;hdisplay;
 	height = mode-&gt;vdisplay;
 
+	flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
+
 	igt_create_fb(data-&gt;drm_fd, width, height, DRM_FORMAT_XRGB8888,
 		      I915_FORMAT_MOD_X_TILED, &amp;fb[0]);
 	igt_create_fb(data-&gt;drm_fd, width, height, DRM_FORMAT_XRGB8888,
@@ -465,16 +497,27 @@ static void test_invalid(data_t *data)
 	igt_plane_set_fb(data-&gt;plane, &amp;fb[0]);
 	igt_display_commit2(&amp;data-&gt;display, data-&gt;display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	/* first async flip is expected to allow modifier changes */
-	ret = drmModePageFlip(data-&gt;drm_fd, data-&gt;crtc_id, fb[1].fb_id,
-			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
-	igt_assert_eq(ret, 0);
-	wait_flip_event(data);
+	if (!data-&gt;atomic_path) {
+		/* first async flip is expected to allow modifier changes */
+		ret = drmModePageFlip(data-&gt;drm_fd, data-&gt;crtc_id, fb[1].fb_id, flags, data);
+		igt_assert_eq(ret, 0);
 
-	/* subsequent async flips should reject modifier changes */
-	ret = drmModePageFlip(data-&gt;drm_fd, data-&gt;crtc_id, fb[0].fb_id,
-			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
-	igt_assert(ret == -EINVAL);
+		wait_flip_event(data);
+
+		/* subsequent async flips should reject modifier changes */
+		ret = drmModePageFlip(data-&gt;drm_fd, data-&gt;crtc_id, fb[0].fb_id, flags, data);
+		igt_assert(ret == -EINVAL);
+	} else {
+		igt_plane_set_fb(data-&gt;plane, &amp;fb[1]);
+		ret = igt_display_try_commit_atomic(&amp;data-&gt;display, flags, data);
+		igt_assert_eq(ret, 0);
+
+		wait_flip_event(data);
+
+		igt_plane_set_fb(data-&gt;plane, &amp;fb[0]);
+		ret = igt_display_try_commit_atomic(&amp;data-&gt;display, flags, data);
+		igt_assert(ret == -EINVAL);
+	}</pre>
    </blockquote>
    <p>Please document the reason as to why we are not using
      perform_flip function in the invalid subtest case.</p>
    Regards,<br>
    Karthik.B.S<br>
    <blockquote type="cite" cite="mid:20241015145240.141244-2-santhosh.reddy.guddati@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 	/* TODO: Add verification for changes in stride, pixel format */
 
@@ -588,6 +631,8 @@ static void test_crc(data_t *data)
 	int ret, width, height;
 	drmModeModeInfoPtr mode;
 
+	igt_display_commit2(&amp;data-&gt;display, data-&gt;display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	/* make things faster by using a smallish mode */
 	mode = &amp;data-&gt;output-&gt;config.connector-&gt;modes[0];
 	width = mode-&gt;hdisplay;
@@ -620,8 +665,9 @@ static void test_crc(data_t *data)
 		paint_fb(data, &amp;data-&gt;bufs[frame], 1, height, 0xff0000ff);
 
 		data-&gt;flip_pending = true;
-		ret = drmModePageFlip(data-&gt;drm_fd, data-&gt;crtc_id, data-&gt;bufs[frame].fb_id,
-				      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
+
+		ret = perform_flip(data, frame, DRM_MODE_PAGE_FLIP_ASYNC |
+				   DRM_MODE_PAGE_FLIP_EVENT);
 		igt_assert_eq(ret, 0);
 
 		wait_events_crc(data);
@@ -708,6 +754,18 @@ igt_main
 		igt_describe(&quot;Wait for page flip events in between successive asynchronous flips&quot;);
 		igt_subtest_with_dynamic(&quot;async-flip-with-page-flip-events&quot;) {
 			data.alternate_sync_async = false;
+			data.atomic_path = false;
+			if (is_intel_device(data.drm_fd))
+				run_test_with_modifiers(&amp;data, test_async_flip);
+			else
+				run_test(&amp;data, test_async_flip);
+		}
+
+		igt_describe(&quot;Wait for page flip events in between successive &quot;
+			     &quot;asynchronous flips using atomic path&quot;);
+		igt_subtest_with_dynamic(&quot;async-flip-with-page-flip-events-atomic&quot;) {
+			data.alternate_sync_async = false;
+			data.atomic_path = true;
 			if (is_intel_device(data.drm_fd))
 				run_test_with_modifiers(&amp;data, test_async_flip);
 			else
@@ -717,12 +775,30 @@ igt_main
 		igt_describe(&quot;Alternate between sync and async flips&quot;);
 		igt_subtest_with_dynamic(&quot;alternate-sync-async-flip&quot;) {
 			data.alternate_sync_async = true;
+			data.atomic_path = false;
+			run_test(&amp;data, test_async_flip);
+		}
+
+		igt_describe(&quot;Alternate between sync and async flips using atomic path&quot;);
+		igt_subtest_with_dynamic(&quot;alternate-sync-async-flip-atomic&quot;) {
+			data.alternate_sync_async = true;
+			data.atomic_path = true;
 			run_test(&amp;data, test_async_flip);
 		}
 
-		igt_describe(&quot;Verify that the async flip timestamp does not coincide with either previous or next vblank&quot;);
-		igt_subtest_with_dynamic(&quot;test-time-stamp&quot;)
+		igt_describe(&quot;Verify that the async flip timestamp does not &quot;
+			     &quot;coincide with either previous or next vblank&quot;);
+		igt_subtest_with_dynamic(&quot;test-time-stamp&quot;) {
+			data.atomic_path = false;
 			run_test(&amp;data, test_timestamp);
+		}
+
+		igt_describe(&quot;Verify that the async flip timestamp does not coincide &quot;
+			     &quot;with either previous or next vblank with atomic path&quot;);
+		igt_subtest_with_dynamic(&quot;test-time-stamp-atomic&quot;) {
+			data.atomic_path = true;
+			run_test(&amp;data, test_timestamp);
+		}
 	}
 
 	igt_describe(&quot;Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip&quot;);
@@ -733,9 +809,25 @@ igt_main
 		 * supported in cursor plane.
 		 */
 		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
-			      &quot;PSR2 sel fetch causes cursor to be added to primary plane &quot; \
+			      &quot;PSR2 sel fetch causes cursor to be added to primary plane &quot;
 			      &quot;pages flips and async flip is not supported in cursor\n&quot;);
 
+		data.atomic_path = false;
+		run_test(&amp;data, test_cursor);
+	}
+
+	igt_describe(&quot;Verify that the DRM_IOCTL_MODE_CURSOR passes after &quot;
+		     &quot;async flip with atomic commit&quot;);
+	igt_subtest_with_dynamic(&quot;test-cursor-atomic&quot;) {
+		/*
+		 * Intel's PSR2 selective fetch adds other planes to state when
+		 * necessary, causing the async flip to fail because async flip is not
+		 * supported in cursor plane.
+		 */
+		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
+			      &quot;PSR2 sel fetch causes cursor to be added to primary plane &quot;
+			      &quot;pages flips and async flip is not supported in cursor\n&quot;);
+		data.atomic_path = true;
 		run_test(&amp;data, test_cursor);
 	}
 
@@ -748,6 +840,21 @@ igt_main
 		igt_require(igt_display_has_format_mod(&amp;data.display, DRM_FORMAT_XRGB8888,
 						       I915_FORMAT_MOD_Y_TILED));
 
+		data.atomic_path = false;
+		run_test(&amp;data, test_invalid);
+	}
+
+	igt_describe(&quot;Negative case to verify if changes in fb are rejected &quot;
+		     &quot;from kernel as expected when async flip is done using atomic path&quot;);
+	igt_subtest_with_dynamic(&quot;invalid-async-flip-atomic&quot;) {
+		data.atomic_path = true;
+		/* TODO: support more vendors */
+		igt_require(is_intel_device(data.drm_fd));
+		igt_require(igt_display_has_format_mod(&amp;data.display, DRM_FORMAT_XRGB8888,
+						       I915_FORMAT_MOD_X_TILED));
+		igt_require(igt_display_has_format_mod(&amp;data.display, DRM_FORMAT_XRGB8888,
+						       I915_FORMAT_MOD_Y_TILED));
+
 		run_test(&amp;data, test_invalid);
 	}
 
@@ -756,6 +863,17 @@ igt_main
 		/* Devices without CRC can't run this test */
 		igt_require_pipe_crc(data.drm_fd);
 
+		data.atomic_path = false;
+		run_test(&amp;data, test_crc);
+	}
+
+	igt_describe(&quot;Use CRC to verify async flip scans out the correct framebuffer &quot;
+		     &quot;with atomic commit&quot;);
+	igt_subtest_with_dynamic(&quot;crc-atomic&quot;) {
+		/* Devices without CRC can't run this test */
+		igt_require_pipe_crc(data.drm_fd);
+
+		data.atomic_path = true;
 		run_test(&amp;data, test_crc);
 	}
 
</pre>
    </blockquote>
  </body>
</html>

--------------iTi4ZA6GB4xJCxBHHCsgW6BG--
