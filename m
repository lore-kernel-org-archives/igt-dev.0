Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09867D65C46
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 06:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD8A10E13C;
	Thu, 14 Nov 2024 06:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7UeBnjG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DD310E13C
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 06:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731565992; x=1763101992;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pxjkz7MrKrswsteSwJa1cpuESPyDzXOTpFpP5VyHZEc=;
 b=b7UeBnjGnRnCFHglI9vMRKyFgGaIIzZnRcXeYhMkeNWx8Xf81dTg3vWH
 TzJUNxhQP1A0fXQcDZ210ucrj5Q44hXIAEZvuFE6QXUgGsLAWY0RR68mF
 z89rbyuS9PA6CeKvj+vXF9+o8heAk9aAshIB0q6qIN0DdYoecY3a4LinB
 v5rCXfpQoOQ1ir2dYNciK48B6NFsU0Qi1ftIihfVa9ERq9dReNGO3+iO7
 2rrC3Br77LtBCwyEu/18qwZTCDsr/CdMe1/9Y/kTgq1H+qqSn5TpP+ZOn
 YPgaLneEfnwRW+W3r3FzWygctfC9pCrnQFbg6cvtR5Q991Mqb/qw5Rpf4 w==;
X-CSE-ConnectionGUID: bIrKtyOORn6AmXpay+o4Eg==
X-CSE-MsgGUID: wJ0Bhy0vQY2WWDAWQuW6/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="31369559"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="31369559"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 22:33:12 -0800
X-CSE-ConnectionGUID: j2OAF381RnuHldUYLbOHAw==
X-CSE-MsgGUID: 7nirt7dzTCaio15M1ZL9Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="92154405"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 22:33:11 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 22:33:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 22:33:11 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 22:32:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHmVEXTXkyUrQF0rrrl5zijpDfjaR1Xuc/aPNZ+VWSfFoV5qbTmdJqTMywBWGzCaV6Yk2ztNrRnD6qMnu08mX6KjNzcup9htwCehEmP2FySchJBvgQIP6/Copd0O3BEoWMJmCkyTZGzL5o5nwh7kYuGSY3LtiZEBDys3TuSGxDspZkALpUMW67IQ3A9VMrXCqqzgPRphF2xBRGQsTcgq7UhtPouvjMuaCKcX3GDPb3swKAyNISULoMwhiAOtTAlUQsmI41+DC6aEUMajOKvuSKY8+YohF+6+Oem8grCkzjX9jiP+Nj6UVujEkKY946spSKelETnTTzjbTLhZyaeYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IWX94ZL1JdD057R7DSBd4Af0ODgxhHakGLEVpKieso=;
 b=FUo4hv0n6cVCPkOv1ORqjr5tA/XfvYnvwnNpGy1r2NWGvByycC393uLT12gsQIl/f/PhCP3r8/mVjTmY+1SkFuUEAd9nLcYFtsd/5MDyDv7Cy4ZSLvPnWGev25v5lpZ5gcuR1TUV7AcvhBTeGjN+B0paqIwCP70HJGK98HEQfg8Nf0hwRNEP2qGc2TNwie0U/P9q3N7hhSDVU/evDF026kJ8YZnL0ctrYgHazREeoDdmn44WdPKAikUecP+vHJxs98Gpxm+IUxsn+B6yC7x0mHR4PJd7Jc4m3B5uWkOfJqOwstqH+9knjR+1Z50gKbdronjJFDGi50x/SKV3ZcPNsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH7PR11MB8058.namprd11.prod.outlook.com (2603:10b6:510:24d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:32:51 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:32:51 +0000
Message-ID: <d06c2684-dbf9-426b-90a6-34667904578f@intel.com>
Date: Thu, 14 Nov 2024 12:02:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] tests/kms_flip: Update the skip message
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <ramanaidu.naladala@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20241114051835.1860727-1-pranay.samala@intel.com>
 <20241114051835.1860727-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241114051835.1860727-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0206.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::17) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH7PR11MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: 7afbad5f-ae03-48b3-b425-08dd04762a07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0xLUG9hbmtoWmNWNHhFM1l4WGZqbzhzSS9HQkFUWEFrbEZzOWYvYkRvSDNp?=
 =?utf-8?B?M0lSaExpcTFqZWpQbUFabDI4cGR1M3RVMUFSazd6MmJ4VHBHOEk3dUF1dUU3?=
 =?utf-8?B?aVd0MCtOZXNBRWFlNS8zSzhDUVhhQ1E1blZxRlZLcDNXM0dCYVk2RC9qTUZt?=
 =?utf-8?B?Q091djhLaHc1ajJmbW0wMEZHSmJvSU1EWDF4UVppbCttb2xxc2hPYkFUZkky?=
 =?utf-8?B?ajZuNDRaWnorVy9SZ2Ywb1JmaW9HN2Y2bk85WUI1VVhtbER2RVhkU2xYU0lp?=
 =?utf-8?B?WHEzckdOemgxS2srK3JCd0lWN0h2M1d5dVQvRUliUDdTNkZKTkNFYUxVdkg5?=
 =?utf-8?B?MFVUeFNxTCtpQXpnRUVseUpRMFZnSmlHeFA4RWZBRjJhenFOUW4vSkZCcGNn?=
 =?utf-8?B?eWh3UDlvTTE5akI0cHd5OU8rYkNCTnBVNFJTOGNQOUwwN041TWF4Y2JYYzVp?=
 =?utf-8?B?OUpFVUVmUklFMXdpRFM0V2xRaE9LNGlqRUgxZlZvQXk5dmpPM2NUWGUyZ1pk?=
 =?utf-8?B?eXp2NllRVkxkZjMyOEhodFNGYmVpMzhRSURtR0JOZFhvUFJCQTNNYTl4U2pG?=
 =?utf-8?B?cHozU1lCYnJWUnFxdnZGUEhRYVR5aVlFYjdwVmhZZmJsa255dk45K1R5Q0hG?=
 =?utf-8?B?OVZkb3BUc2x4VTRNVWl5VjZLMlNKRXYyMjRIWVhqTWxZOHNvODNMZTI4N0sr?=
 =?utf-8?B?S2Nodml2bXFNSlJEZGt1VzE2bnZCb0lqSE4xN2M4L1dsblpNeDNzbFNuZnJt?=
 =?utf-8?B?bC9paDlEdWs3QUhtKy9pNk9IaEUxWFEvNmowRlZCOXBlek1nSWlpZmNqSFRl?=
 =?utf-8?B?bDViMkxTYXgxWWRxMmhKcjVMQjlsL2htZjRjMDNCUlNVSW9QajU3OFhiYnFN?=
 =?utf-8?B?MjFOdFZEdkZXWE9DTWl0WTcxMTd1cnNHNyttRDlxRytxbWpJb0ZmWnRsZG9C?=
 =?utf-8?B?eU9rRWNLUkNFbE9oNXAxdmU5dG1MeVVjZTZhUjJ1MHdaV0dzeEYxWWlaQ1VE?=
 =?utf-8?B?NVVPbVNpOGFkdlNuOWhlbDFpN2oxWTJYdG9YNjNpNUU4MmwyT3gzdjZzRDNU?=
 =?utf-8?B?NDUvMzRPSkRGVkhtdDd6NmxuUVNqQlJRL3R2TDNLMEhFNmQyajhYZTdYdVBz?=
 =?utf-8?B?TUliYVRUN0ZMaTBwYnhnZHBXN0tpM1RtYktXR2RnOWJtUmpmWTNoZFNiUHBP?=
 =?utf-8?B?U21xNzRCVHY4b3RYUEdITVNWdDJMY0dsWlZjbncydkxNczgxNjY1enBvQyts?=
 =?utf-8?B?blRCa0xCWUgxa0ZWWWhvSVZPNzhUcDcwaXMxc1hCdUE0Y3V2WEJJa3Jtalcz?=
 =?utf-8?B?WFpveXIvb3lUSXkxVlZwQVBzZXQ0SUtEQ2tZUEIzdXNYejY4UVZUZUlwVVlh?=
 =?utf-8?B?RzlpVDhtVWNrUytORTYwS2VwZUJwcEZqM0dUek9xTjNySXZyakduV0llSmZZ?=
 =?utf-8?B?ZmtVaU03YXhqeXVUQW41eG9RRWQwZWNaVDFyZE01T0ZibUhDRGxGc0l2Rk0v?=
 =?utf-8?B?M0FHQVBQUW85ZVlYSTlTaVN0dUE5Z0RHdnhmajMxeFg0Rmo4QURHdEFHY3pB?=
 =?utf-8?B?Qk9USEkvbkRvREsvam9DMVcyNUhZRzJJTytmWDJSd0ZGYUhSVlFLK2lVWTR2?=
 =?utf-8?B?cEdxUkNDOUdpNFRFMXpkQzQydFU0UTU0WGVPMU9DMUNkb2d6cnp5RGtzVVBP?=
 =?utf-8?B?cHZ4K0tWQzlQNlozcVVZSWNRektqOFBWcGNSRDVVUzlQMjRMeFREMk1EQUVp?=
 =?utf-8?Q?HQKNt/Tv/NDnGlnyGyL0edf8EFdxHEDBhyaVwcZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0FKZlN6Q2Z0S2w4U0luOGt1ZE9KTmszUUtzUXVlLzd3bzhjdTVML2ZLcGJF?=
 =?utf-8?B?cWxiSzdNT2hDQnlJQzF3RUhySXE2TExBQU9RcURDWnh4WUdxd3dKdzNSbnRT?=
 =?utf-8?B?YmUrT3dkWlpKdERmUW5ndnJxcmJmZUJONHhnQ2Q2djlrNVoxVmt5T2kxRnlQ?=
 =?utf-8?B?REFLTXpRbjY0cVpBNjBLV0d2ODVTRXM1aE1MUEc3YmZib0VKYjBQeWxHdGFS?=
 =?utf-8?B?ODN6Q2l2NHVCYi9TS0Z5alYxUS9oL0x1d2lTRGZlNHpWQm8xM0psVW01OUhO?=
 =?utf-8?B?eVdBaGFvMFFkSllTWWo2dGFiK29kNmtRK2JHOUgzSlpLM1AzYkJ5KzNjUzRs?=
 =?utf-8?B?THpjeFhHQkFHaFhWTnZDSTRpSDVyNlByTkhRUFhkdUVqUDc4NEdiRkdDcGFL?=
 =?utf-8?B?OG1YcDdqODhlR0xDZ0Y0bjFVajMwY252VzBwUFVZalRpR1htSjh4cjJEWDV2?=
 =?utf-8?B?bnNjcElEQzZOSXNwT0htbzRKQWc0b2tSTlQ1RWxWbis4TXFoREZUeXpnNFZo?=
 =?utf-8?B?VXRWQzFjVDRXZ05KT29OL0RqS0hnT3hyb0xBVktDS3FWdGEvZkFlcVBKZlJU?=
 =?utf-8?B?N2paVnRHMTFWNmNXSHdjdmo0K0lhYm5uVXMwNXY0SVhjMWhWcElFOW9sWHA1?=
 =?utf-8?B?Qy8yeXRNSlRObDVVSmM0ejUreGFwNlNhbjRXSTFJNE9RZ0Y5VHhFS0tHelhQ?=
 =?utf-8?B?VnRvMkVSc042VW9BaWREWmdSTm5DNmRBRFQyeUpjRlB1VnhBRjNyaFQ1K2lp?=
 =?utf-8?B?QXhXK2dhM25FRHM4L2d5VHpPczZDZG9SSUdCME9Gb2hqa2UwNENYTnp4Ylhk?=
 =?utf-8?B?L2gxaGlNQTFUZVl5QXZzUjQxampISW1sa0owVVVBOVlieU8xalF6L0lyb3lU?=
 =?utf-8?B?MURiMkloQ1FGL2xOK29vMm1sbGo3RElYV3NSaHNnM0tHZ0tWSXBONzdscm1q?=
 =?utf-8?B?RENkMFJxbTdEalVJTXFMUWVGSDdKL0xJN0tJZkpPVWhmMnZ6UHBMM3ltZEhO?=
 =?utf-8?B?d1l5bjZBa2NwWEljdFVmS0pzUlB3cll3ck5WVFF2L2R0Q3dlSHlTV2NQeEVX?=
 =?utf-8?B?TktpZjVWVGdhZjg2Y2ZBeGlzMm5EelpkekE1TnA4VW94cmZrSzNXODFWVkR1?=
 =?utf-8?B?eGFSSlBXbFlJN1ROdktTcU9leXNidlNBeXNRbUY0WmZma29hZ0lRYkVQUUZu?=
 =?utf-8?B?RU5BcnNLbTliN3BDcG9tZWVwVWgzSk9lTi9IQ2o5Q2xubldJcENxTVo2QUlV?=
 =?utf-8?B?dUtaVHVLa3dLaUFKRlZVYy9sejlaWFBzODZIcWNneUN3QXZIQVFYdHhhck4v?=
 =?utf-8?B?di9uZmhiV0ZzbTBPNVBOU0pVZEFZMVIvWVdRbWNWZFIvaHNsaklPMWZGNmYx?=
 =?utf-8?B?OGMvSi9neEI4cjYwYkZSekpZSGdTVy9aU2tjeThQUzJ1YS9IYk5aUE0wdFVO?=
 =?utf-8?B?UkpWaktRbERCUEtYWmdoMXNWV0JBaXN6eVg0YnZNcUlabTJBOGltc2Z0TUM2?=
 =?utf-8?B?MERGSXp0cnNQdUUxVWpja0Fpc2x1T0c3d3VWU3ZXUDBJWEhscmR3T01rNDF1?=
 =?utf-8?B?K29QRzhmRGdVcHJSUkNPMzZGNkVVUWhpVm1CQmtsVDlvRWZHTzFvZWNJNE1Y?=
 =?utf-8?B?V1BWZHU0NmREUnNSVER1WkczZ3RYZ00yRWxUOVppdE5RMFVSU1hTK1FWaVlC?=
 =?utf-8?B?TFRXMG5CTUhPajFZTXVZd1NrUlVzSGVoZ0pabjVvUzhjN2J6NUpZaW5raUVx?=
 =?utf-8?B?bU45T3I2RCtNWHhWdmdEVUIvSkI4ODROSkk3MUR0Skh0Nzh1ams1U3RhdWxo?=
 =?utf-8?B?YkFpbXRSYmYwRGFhYnlFUHBPdmJpVmpuZk1tN2N5UE5lNzJxdFFxaHEwL2dQ?=
 =?utf-8?B?UTdpM2l0cTdqTWU3SUxlSVYzWVRMZEdKdzI1NWowcVZNLy9Bc01Tbk5XN1JU?=
 =?utf-8?B?T3N0RDVLNW5SZDNDOFJNeTZmL2laeXBtTDQ5cXhiWDY1UjBjVG9DK29qTGVw?=
 =?utf-8?B?VUNhRDNJa1YrOEV6U1VtejNPaDlnUmk4V091MVpsU09xOWxSWjNYcXhiU2Vs?=
 =?utf-8?B?ekRWdHhXTGZLRDh4TEN6QzYrRVVKOWprTTk0TTFYUHJZZ2YxaGhJYzliUkZX?=
 =?utf-8?B?RnhocG9KdU4xQVFNVElKdmoxaVgwdHQ2OXpSRDZRV3B2TFUxM0R0MzF5RWNV?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afbad5f-ae03-48b3-b425-08dd04762a07
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:32:51.7565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qjga9X1kJOaIR6gtxQuo2aNyAO9rHbdsfLisCTfxPy9EvdIrf+tju10h9XQtjpPyz3mPZdpiPHfo9woP/q6ntw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8058
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 14-11-2024 10:48 am, Pranay Samala wrote:
> Debugging would be easier if we had logs available for
> test failures and skips. This patch rephrases the skip
> message for better understanding.
>
> v2:
> - Remove .c extension in the filename (Swati)
>
> v3:
> - Add changes made in previous version in commit message (Swati)
> - Editing hax patch
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_flip.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index cbabbe74f..88cd41083 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1896,7 +1896,7 @@ static void run_pair(int duration, int flags)
>   
>   	/* If we have fewer than 2 connected outputs then we won't have any
>   	 * configuration at all. So skip in that case. */
> -	igt_require_f(modes, "At least two displays required\n");
> +	igt_require_f(modes, "At least two displays with same modes are required\n");
>   
>   	if (duration) {
>   		duration = duration * 1000 / modes;
