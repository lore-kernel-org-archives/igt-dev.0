Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216F5D59F52
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 17:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D215910E73E;
	Wed,  6 Nov 2024 17:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhaeG5YN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C241610E73E
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 17:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730912908; x=1762448908;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YywCxe/GnpPJdlpoWwSw754IkyroKehzOi72NpNgijE=;
 b=DhaeG5YNVsOxX1XGoMIyERs9boeAuf5DrGYhT4f5HfMwOfZgrXZCUNDM
 r2gDJwJn586qRMCrf22/PTbKn2/vXoKLPOrhBj/vmQVtrcEeKovMl1krQ
 eEfhvNmok7tnDPIFghBj2YNsWkHHZwEMcub9qI7HIKMpIOJj0RsAmqwp9
 yTDETsve1Ttxh3h7ZqufA7MNJHk8dNTgv2BIzPllawhTDqpTwlfhC8GQE
 PIm6wtbQUwcDwXoZENqNxW01F/drXdiFciS13NR25Y05c+GRcLAXw1Ock
 dBdJE+0Ty5IbZKbZ02eAu4Vi7LOAjIo462gUasl7yJrpmQ9xlBgdsnFvd w==;
X-CSE-ConnectionGUID: 2hF4tlx8TjWmwyQJS6LvIw==
X-CSE-MsgGUID: YyD4unPGSdOEEt/9RXIwpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48184520"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48184520"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 09:08:28 -0800
X-CSE-ConnectionGUID: MDyDB3QKSQe6n0QQKtVVpg==
X-CSE-MsgGUID: NXwkRhW2RFmdwNY6ZEuZ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84184965"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 09:08:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 09:08:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 09:08:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 09:08:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzWK2eXO8Jbwc+pqyDWMmjzFvoWXuB+Z/AKHfpmT0ICyIzgp9KGOHSjuathMKE4YSVRJFKm9aCjYWrYps3sdKgBS8GUs7F0gLJmN/4TN29CrVG5YUOeuBjAaj/eaVO4gRzYg2vWMdWPYrBqn21xLuAfxoxU9lNBMK3v3KNU7MRouloL6x8oA6dSMI5SRVpUK86w8OJM7aCkD7lFmoZbKOX+Q+P8E6bdZG9sxWwlucZhSXLNp03VO6ZOOf1Q3zik0f2kA5DY5YSHhlJ46bH6Yxx7N+7Ukav/hM4ICuicodJoXBJTtdFZCWqD5asheEGD2Dls1nO4yCkh7Ir4FV8cGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEdOwtiiKZhbieeGWDPfPqKw6DCV7qPrtapvp1xphVA=;
 b=f+sYIg1DzkW15LkrEFoAIIMHx7/M35kp1RVOwyJQKZPqEhJWM8w73aU5vdGY7JU5uAlSDE4gX3a7k5t8PiRPFFRXZrfjT5I/QyFNxAA2M7R/QnQr34Vzo2sTvGbZYmVm2Y9oWZp/mMZWKlxUAFDblbZZtD/94xjk28UImpEuIsw2y2WxAPJ/uvGsJW7ChWxB1+0b6iJ24XXCiontDW4YYAiNbJVs1c0jgU07JIU2U2zrMQgw6e3mTfmpGjaFbslfRrQ5SxSvQgqRGpS7u33KHYPdOCufP/FS30tTcifgC0igSKk070N95qh48USHjwCj7UWXwr1om0D6h3UspS/qXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 17:08:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 17:08:23 +0000
Date: Wed, 6 Nov 2024 11:08:20 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH] tests/xe_spin_batch: Add spin-timestamp-check
Message-ID: <mqo3bj2b6fw6eb26pj5ojighk4fp67nzqanzuics7hjknekqfx@7utg2ppxwhqb>
References: <20241105092805.317286-1-pravalika.gurram@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105092805.317286-1-pravalika.gurram@intel.com>
X-ClientProxiedBy: MW4PR04CA0169.namprd04.prod.outlook.com
 (2603:10b6:303:85::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 45592864-60ef-4ed4-7ae2-08dcfe859ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHRoRzNUZzMzSSt3aE8yQks1a1BaZWZQTWRtRDhPSGFuTksxMVMrS0lqcE5K?=
 =?utf-8?B?NUZNVGpxYUU2MWtFOC95Wm5VUzl5SFZuR2lSWGRZYzNuR044WGNSTFY0djQ5?=
 =?utf-8?B?WmQxNC95Q2ZOaTB0UEMwcFBBYkxlWUJ2VWdLb0Z1b0lnNjFRMG91alVRVUF1?=
 =?utf-8?B?SmpLYmgwcEcxS0xUdmJwRGgxN01tcXNBSHJXNmpRSXZJMzg0czBFOGtSc1Zv?=
 =?utf-8?B?S1BORUF1T1c3cGl5VjJqTmZjOWxSeFZJQTVOZUtocCtLUDdZMWF5bUc2NnBk?=
 =?utf-8?B?OW1sMzF0dG0yb21lN1dpdTJnMjBaS081UW14YTFieFAwVDQvWnNuVU9TVlQ0?=
 =?utf-8?B?eU1DOGFGelUxOWtSL3NDR20yWDBHUnpqMHRUbjdmdmJhV1dOSWpzT3Q3QXh5?=
 =?utf-8?B?MmtxOE1jYjQ5UzRqenJIWG52aDl6TTFoS055WFBtZGlGeXladURVbTJRRjgv?=
 =?utf-8?B?Q1kxNTRQNGNWTUZDdksvdTdja3RxNzNYL1YyQU5CQ2FodUJhTXB2WFlZakY2?=
 =?utf-8?B?RkIyTlhsMGxaNTRkWXZleFZKZDFTTnFsYUZUT1VVZldqZC9TQWdBcE0rcDR2?=
 =?utf-8?B?N1dKOFJ3THVoeUJ6NVh4VE0yaHV1SlhWOVorRmtGUFREUE5FZ2dROGdWMzBD?=
 =?utf-8?B?aDdUQUVOVGNvbllYMEI1c0FwVy9Scjk5dWczOWo3YzgzM3o3dWxJd1NUVFpG?=
 =?utf-8?B?SVcrTkk4RU9jV3gyS3piUHF5SzkvNVUxUWZUcm45N29vbTRlQVhlcVZyRU1m?=
 =?utf-8?B?QmMyMVB0QkEyVEpQRHlVVjdlUERwcUIraHBsbzdXdVUzZmdndVpLbENtelor?=
 =?utf-8?B?blJVSTdtUUMyUysyWlkvamxoQ2xyWjczeTVRZ0lRRFNLbThjRHk4ZWlORWc5?=
 =?utf-8?B?UVpWVDBNQTlMVFE3RFhrUXpKUTRHOUZ2Ukd2eE90d3ZNYy9rWlprSUpEcDJu?=
 =?utf-8?B?MVFONjRlcnI2ZTlzY2tiWmtRUzZrc0N2N2ltVEZGbWJ5N1VWanBtZzEvc3lE?=
 =?utf-8?B?bk8wYjV5NW85QVhQQXZYU1RubjIxRFFFSTh3YTIxejN1VkdtNDFiS2lCREY2?=
 =?utf-8?B?Y21ra01OenUwWkJRNk5PSld6OENjOVVHT1VkK09KQXZUYmNsVERFbllORlJo?=
 =?utf-8?B?cEhNTnVRdGN4ekJaaWp2RkpwQ29NcGVMUEZBUitZNGFQVHE1QldSNTEyQ2Iv?=
 =?utf-8?B?M0dnL2hpQVJ3YWdlSFlhR2xJM1JKZ3BtMlVyOUQvK0R4MnFSckNtckhxS1Zv?=
 =?utf-8?B?TE41UmZaSzFKbkFjUUNpQlhZVXl3KzViZkFYaW95U2xBMnFSVHhxNUVEc3R0?=
 =?utf-8?B?ODIxTTQrM3NqMTIzWHNSNWxVblJiQWRZdEZ1QWs2UFZuamRpRituazIzYlRa?=
 =?utf-8?B?R0pHbkFZWkFUZTdrbWl6NVF0c0FkaEdiWXRJb1k3dThDby9MYlgrcWhpaE52?=
 =?utf-8?B?czk2ZE02NnkzNVhoVzFwVFV0N3hkMy9EUkVxcXMvcy9rbENkNzNndXRMbzl6?=
 =?utf-8?B?S29wNW1CRnAwbDVLOWU1Qy9FUmZsMS9WdmFKT2JWWFpjUWR6OHpEYlRNMTdl?=
 =?utf-8?B?ZEQ0MmRZMXd5VXJhWDVrVEo4T0c4T2lNWk1pejIvSXZXcWxzU0YyU1kyQ3U3?=
 =?utf-8?B?R2NRaEY5UXBoc1MzeHk3SFk0bi9mU1VON1laSXM2OGN1NHZsWXJiOWZxMXY4?=
 =?utf-8?B?bDkxUTlvWEZ2c1kzQlFZR3diY0k1cVZNdHZhUkJjNkcxdThRZjZFWnBiVHlm?=
 =?utf-8?Q?eWRcv9wBtX665F48G0e4r8ycO2gPDHFzwDM2FKP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWFTY21iOTlZcE9OM2hlRnBMNlBRRUVMNU11VzVXS01Bb0RmVlIvU1Q5aktE?=
 =?utf-8?B?MkFlQXdwVEJ2RWExeVBXTUhwYVc2VGhkWTRHWkpDTG1nakpPUWRablZJa0gw?=
 =?utf-8?B?VnVZQTY4cS9XQmN4SmMxR005cmJPVnlxTHJ1anBUMjNPQ2N0VmtCbHJaVkdG?=
 =?utf-8?B?SjlRQlB6bjV1Q295UktwTXEwdWxObzlGQ3VINnQzQlBBMDEzbzdoMjk2dGgy?=
 =?utf-8?B?VlcxaGVzeE5Rb053VFF5WnU5Tzg2SG5WcWJ5eHhpeG9zenJiNDJUSitENHYv?=
 =?utf-8?B?QmUzbGVSZldubTFxKzY4NEJ6TUhraGQyWlBGckxtUHM0U0NQZkRMMFlCNWhU?=
 =?utf-8?B?VHcydHZ1UDBoRFJXZllNWnphc2IzMlllb2E1YU9DQVN5R0hKclA4SnJYNmlB?=
 =?utf-8?B?eUhZaE5LdktaWnQ5dk5Ybm8wUytSOHVXQlMxN0FFRC9NMm5BbDltb3hYd25i?=
 =?utf-8?B?MnJDRTVNRjJENEgzYU5oaENaVE5vWVVUbWgvQjV0ZXRIcW1BZVFjTmVZVFNL?=
 =?utf-8?B?d082Q2R1Zm5JQ1dUanJHMWRvZEN1a3oyQ1V6UU5aNVJ5WmZpditWVWJpeHlx?=
 =?utf-8?B?dmlyNEVyMDZITThCMHExNW1vbEJxNVpFamJBbFFkeHduZjJMbE1IdFNSRExy?=
 =?utf-8?B?dHdJaXc5SXIvVi9lVndkOUY4RE1jMHF1Y1NseE0wU1pJK1FyTllxbUVRbXdu?=
 =?utf-8?B?UVBFUUkySVZlS2lTUXplOU10QTA3WUJpUDYwd2sxVWtqN0V0MFhQdnJIVkR1?=
 =?utf-8?B?aEkzL003SG9YUUI1dElobmVuaSticlRlNEh3ejdxQXVZZTBseDdmd1RwT3Fa?=
 =?utf-8?B?UExJVWR3eE1JSUEzcjhPZnM0aDhSd05CRlFITmtDdEU3UTM1YXZZbWFGUzRT?=
 =?utf-8?B?bytwUmlrMno0Yjdmd3RucUxZdFhxMzMrdUFlc3ZjTzhTMTRtRkVNektYS0pG?=
 =?utf-8?B?UTR5WHNwZ0F4OTBXSEpBUTRBY0VNMnY2UGJNUm8wK011cUVSQVZ6YkhCMUVp?=
 =?utf-8?B?amJXZzhrbUh5cC95MTNndHJsT1VMdlhGM1VpRXVXeG1hVHh1YXhrd2IzRjdF?=
 =?utf-8?B?VmlTaUNjcXNLRzZRNEFENUU0MndPM1RLVHhJOS93eWFPR2V0QkFpQkRjRGR1?=
 =?utf-8?B?VlpkUlFnZlJLU2IzOHpyZWo0SUZTd245QmV5MlgzMGhOSjBmeVlCYzF2YU85?=
 =?utf-8?B?c2prYllTZSttc0pMb2c4VU82Tk1neXNLdFB0WGhBVUp3QWl0Yjg4MklrMWl3?=
 =?utf-8?B?QmM2eW81SWhlQ1pZY2lMNlBnMVdWU21Rd2xGSTlhbjBxb3ZrWFQyN1E1SUlD?=
 =?utf-8?B?WEhYWEZ5TnFOeG05VU5nU0s3VkdkOTFQVlk0dlVFTUtxcVJDNGhmcnNOeVUx?=
 =?utf-8?B?VTI4TGd2bmF3VlZyQnRuQ3V0bUJqVkRqWFNtSTE3UnJPZWlTT1RJa2FKQ01y?=
 =?utf-8?B?NmljUVZjaFhYK2JLb0NDekcvNis1UWZPekZnZS96OFNFMVRtdm1XT0hCYndT?=
 =?utf-8?B?TGlRWjQ5WCtnazZnUW91dEwyUkFkYW5DYnBpZWQydVR5V0RwTWs2M05PU09m?=
 =?utf-8?B?RXdzOUluemtNenhXd3pGMWU0YWxCdXJ5Q08rdlZ4WmlIZFJ4RCtwRkVrNVcr?=
 =?utf-8?B?WTdqL2hnQnRJNGpVdy9sTW1jWXVpODRWRFpBbWNOU1pxQks3L2lPeVFzc1k2?=
 =?utf-8?B?bG4xTmVHZXY3Vks3WmdDMGJjUlkzRCtDYVhxUEtXbUx3NFRVU0FVVHZCVENT?=
 =?utf-8?B?WS84QlZYVUV4czNqbkt1M2UwU1hPWUtnbW1JTjQwaDlYaUFtd0FmOVMwcld1?=
 =?utf-8?B?Tnd1dTNUdUZDVjZaTHFZSFhlU2ZXU09sTkMvR2tLV3FmcUxnR0VqNWozcUNO?=
 =?utf-8?B?NmszdjV5dm5qZHA0TUpSN0orZ0dSckNiS2JlMllCV09oZENRbzZ4ZkFYeU1t?=
 =?utf-8?B?eWkrQjRvVlF4VTNZdy9ES1V0dGZjMWFpYXpOUkliWkZxQ2dYLzZ6SE90enRl?=
 =?utf-8?B?R1hoVjZ1RFFhOWhFNFcxT1I0dkRBa0NkRDc4M29qZnFvOGZZZUdVWnJ2ZitN?=
 =?utf-8?B?NkkwZldrZXBvWWJ4NEtva0lvVkZwNFZtZEFPSHBRWCt1QW5NV2pEblFpM3Jp?=
 =?utf-8?B?UGloNnd3UFlKWndtd1FoeXdhb2prRjUzc0VJYjBMMDl5TG9VV1MyZ2ptbGVj?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45592864-60ef-4ed4-7ae2-08dcfe859ec0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 17:08:23.0369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8ZD9w5hNp5JUsGF6yNz3V1HN6pfhNnVInG/+1j4gvGO/H6MZ7rK3RKBZVfXuUeFOydbTX+nhybUXlSO82P4slpImmgLZz+RBkGD14k/75I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
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

On Tue, Nov 05, 2024 at 02:58:05PM +0530, Pravalika Gurram wrote:
>check the ctx_timestamp register post gt reset for each engine.
>
>Reference: VLK-64943

please drop this

>Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
>Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>---
> tests/intel/xe_spin_batch.c | 158 ++++++++++++++++++++++++++++++++++++
> 1 file changed, 158 insertions(+)
>
>diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
>index 9314e229e..547cb1c5b 100644
>--- a/tests/intel/xe_spin_batch.c
>+++ b/tests/intel/xe_spin_batch.c
>@@ -309,6 +309,158 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
> 	put_ahnd(ahnd);
> }
>
>+static void exec_store(int fd, struct drm_xe_engine_class_instance *eci,
>+		       bool hang)
>+{
>+	uint64_t ahnd, bb_size, bb_addr;
>+	uint32_t vm, exec_queue, bb;
>+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>+	struct drm_xe_sync syncobj = {
>+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>+		.timeline_value = USER_FENCE_VALUE,
>+	};
>+
>+	struct drm_xe_exec exec = {
>+		.num_batch_buffer = 1,
>+		.num_syncs = 1,
>+		.syncs = to_user_pointer(&syncobj),
>+	};
>+	struct {
>+		uint32_t batch[16];
>+		uint64_t pad;
>+		uint32_t data;
>+		uint64_t vm_sync;
>+		uint64_t exec_sync;
>+	} *data;
>+	uint64_t batch_offset, batch_addr, sdi_offset, sdi_addr;
>+	int64_t timeout = NSEC_PER_SEC;
>+	int i, ret;
>+
>+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>+
>+	vm = xe_vm_create(fd, 0, 0);
>+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>+	bb_size = xe_bb_size(fd, sizeof(*data));
>+	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id), 0);
>+	bb_addr = intel_allocator_alloc_with_strategy(ahnd, bb, bb_size, 0,
>+						      ALLOC_STRATEGY_LOW_TO_HIGH);
>+	data = xe_bo_map(fd, bb, bb_size);
>+	syncobj.addr = to_user_pointer(&data->vm_sync);
>+	xe_vm_bind_async(fd, vm, 0, bb, 0, bb_addr, bb_size, &syncobj, 1);
>+	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
>+
>+	batch_offset = (char *)&data->batch - (char *)data;
>+	batch_addr = bb_addr + batch_offset;
>+	sdi_offset = (char *)&data->data - (char *)data;
>+	sdi_addr = bb_addr + sdi_offset;
>+
>+	i = 0;
>+
>+	data->batch[i++] = MI_STORE_DWORD_IMM_GEN4;
>+	data->batch[i++] = sdi_addr;
>+	data->batch[i++] = sdi_addr >> 32;
>+	data->batch[i++] = 0;
>+	if (!hang)
>+		data->batch[i++] = MI_BATCH_BUFFER_END;
>+	igt_assert(i <= ARRAY_SIZE(data->batch));
>+
>+	syncobj.addr = bb_addr + (char *)&data->exec_sync - (char *)data;
>+	exec.exec_queue_id = exec_queue;
>+	exec.address = batch_addr;
>+	ret = __xe_exec(fd, &exec);
>+	ret = __xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE, 0, &timeout);
>+	igt_assert(hang ? ret < 0 : ret == 0);
>+
>+	munmap(data, bb_size);
>+	gem_close(fd, bb);
>+
>+	xe_exec_queue_destroy(fd, exec_queue);
>+	xe_vm_destroy(fd, vm);
>+
>+	put_ahnd(ahnd);
>+}
>+
>+static void run_spinner(int fd, struct drm_xe_engine_class_instance *eci)

This is a lot of code for running a spinner.

Let's move spin_sync_end() and spin_sync_start() from
tests/intel/xe_drm_fdinfo.c to the lib so we don't need to copy and
paste it everywhere in slightly different ways.


>+{
>+	struct drm_xe_sync sync = {
>+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>+		.timeline_value = USER_FENCE_VALUE,
>+	};
>+	struct drm_xe_exec exec = {
>+		.num_batch_buffer = 1,
>+		.num_syncs = 1,
>+		.syncs = to_user_pointer(&sync),
>+	};
>+	struct xe_spin *spin;
>+	uint64_t vm_sync;
>+	size_t bo_size;
>+	uint32_t vm;
>+	uint32_t exec_queue;
>+	uint64_t spin_addr;
>+	uint64_t ahnd;
>+	uint32_t bo;
>+	uint32_t ts_1, ts_2;
>+
>+	vm = xe_vm_create(fd, 0, 0);
>+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>+	bo_size = xe_bb_size(fd, sizeof(*spin));
>+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), 0);
>+	spin = xe_bo_map(fd, bo, bo_size);
>+
>+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>+	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
>+						ALLOC_STRATEGY_LOW_TO_HIGH);
>+
>+	sync.addr = to_user_pointer(&vm_sync);
>+	xe_vm_bind_async(fd, vm, 0, bo, 0, spin_addr, bo_size, &sync, 1);
>+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
>+
>+
>+	xe_spin_init_opts(spin, .addr = spin_addr, .write_timestamp = true);
>+	sync.addr = spin_addr + (char *)&spin->exec_sync - (char *)spin;
>+	exec.exec_queue_id = exec_queue;
>+	exec.address = spin_addr;
>+	xe_exec(fd, &exec);
>+	xe_spin_wait_started(spin);
>+
>+	/* Collect and check timestamps before stopping the spinner */
>+	usleep(50000);
>+	ts_1 = spin->timestamp;
>+	usleep(50000);
>+	ts_2 = spin->timestamp;

reading the timestamp like this could not work depending on the
compiler options. I believe you will need to READ_ONCE(spin->timestamp)
in both cases to prevent compiler from optimizing it out.


>+	igt_assert_neq_u32(ts_1, ts_2);
>+
>+	xe_spin_end(spin);
>+	xe_wait_ufence(fd, &spin->exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
>+
>+	sync.addr = to_user_pointer(&vm_sync);
>+	xe_vm_unbind_async(fd, vm, 0, 0, spin_addr, bo_size, &sync, 1);
>+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
>+	munmap(spin, bo_size);
>+	gem_close(fd, bo);
>+
>+	xe_exec_queue_destroy(fd, exec_queue);
>+	xe_vm_destroy(fd, vm);
>+	put_ahnd(ahnd);
>+}
>+
>+/**
>+ * SUBTEST: spin-timestamp-check
>+ * Description: Intiate gt reset then check the timestamp register for each engine.
>+ * Test category: functionality test
>+ */
>+static void xe_spin_timestamp_check(int fd, struct drm_xe_engine_class_instance *eci)
>+{
>+
>+	exec_store(fd, eci, false);

what is the first exec for?

>+
>+	exec_store(fd, eci, true);

please use flags instead of bool to improve readability.

Lucas De Marchi

>+
>+	run_spinner(fd, eci);
>+}
>+
> igt_main
> {
> 	struct drm_xe_engine_class_instance *hwe;
>@@ -343,6 +495,12 @@ igt_main
> 			xe_for_each_engine_class(class)
> 				xe_spin_fixed_duration(fd, gt, class, SPIN_FIX_DURATION_PREEMPT);
>
>+	igt_subtest_with_dynamic("spin-timestamp-check")
>+		xe_for_each_engine(fd, hwe) {
>+			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
>+				xe_spin_timestamp_check(fd, hwe);
>+		}
>+
> 	igt_fixture
> 		drm_close_driver(fd);
> }
>-- 
>2.34.1
>
