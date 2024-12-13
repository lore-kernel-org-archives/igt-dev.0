Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D496DE7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 15:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F8710F048;
	Fri, 13 Dec 2024 15:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NtC5dELS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4900510F048
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 15:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734102151; x=1765638151;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hK/oFsYd39Gs1nqji+DdK1YWNmPLACq6TyKkqCgs5nY=;
 b=NtC5dELSN87QTnmj43txjcDh0v302Rr0Yt7l+GnAMC8Uifis4p0JKktn
 QcFPlFSH/y9PoT30dchTz1eK1eRbGpy5QQg6hDDbLT6aj4543QgE8+63c
 mRpzaKNO0VKggAqLNbOac9jORI39jmsoSiN3i7Nd5HRltVYw0EcDuHKBe
 muDIlL2BiO9f/UrwRBuL0u5T7xr2E7sV0UW+aDk5H+DhtmmcpkAdt1GAW
 leEim3Th5JFSnCzrauaFUt8vl7E7KRUXub+pBoknfuCZAZdqYcm5zDdt4
 e6WfahivFpE4pfoZmPvBpIQc/YfWOoA9L+NwkoqpmpPMr683cY9+/Myrk Q==;
X-CSE-ConnectionGUID: 96/LuMlWQb+8OCcsvq7wLg==
X-CSE-MsgGUID: 0Zp9lRzYTb6QdrknUTbTDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="57027541"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="57027541"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 07:02:14 -0800
X-CSE-ConnectionGUID: qF5LnR90TKavIVdClkaqyA==
X-CSE-MsgGUID: r9Lc2g1cQRqZ9o9zCLlioQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="101401037"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 07:02:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 07:02:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 07:02:13 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 07:02:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJRB3Dj5uLtZl8uO5YV5knDz7Fj06N6b8FubJhbhF0hvTMONKvcsuUBdDnRajp+wS02EBeWujGg4RjEl6W1fYIvNhI/yHx7W7Y1cCqn+yoLDhkF8as52e+B7npwrXklmaAJeWoa8hpUDU05j4jD7xRKaVcb04nl38ma46v4kPyOHQeRHqPxd1AGUM2wcOKBQI/KGelZ/v7TcVOhsqS88GzjX6GAHz/nquJac7miFeSEsv5afBq/SlTR8aMWWWjQz53dg6NTxL8rVhtXFpLB6QvUsJgaGwcXP+QIN6qWVyQXYyFzuSRa6xlDBkT7YlukS2sWRW1ZvzLfYDXpbkxNnTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hK/oFsYd39Gs1nqji+DdK1YWNmPLACq6TyKkqCgs5nY=;
 b=aow+FLn88J2e7bcqA8PIypTsOZesAfP6xpCItzcgX5nkM9A1g7pEuo7v6Bpy6QX8WDC8xAbE/FtpUzmLhvMe7NvJyHkwN9RLeEoU8ziLp9nXa5/Xp1rvbLs2vUDfQQC8WKt5TXbdAXoY0c1uWVIdLM88alNEyf8ew9TN+P+9WlHPdBLJJjIRrB+RVU+GL3oxfTdVFHjdalBQNM4zPPVTD7OlVb0+vAkz+O2hIM41/LNVKT8b532+6PBfcFTQs5LrR7Ct7bCLIy2U1qdE9bQj/0lCUK5H9LdFUASqCZes6QOSFDIgg9OLt0eJKfAjX1FPJUNymRfI2UKjgPNXBz9udw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 15:01:41 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 15:01:41 +0000
Date: Fri, 13 Dec 2024 16:01:31 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <krzysztof.karas@intel.com>,
 <eugene.kobyak@intel.com>
Subject: Re: [PATCH] tests/intel/gem_ctx_param: Add GTT size test
Message-ID: <hhhvimjswgwwu4ftancxntjd2nj45kxfg4554w6sm2jlofw62d@mlyyyekz5qt6>
References: <wwioetfbvnmnwoe2oqzy6dzl35vtll6agmn2vz746ibpprdl4o@mhw2tembwbp6>
 <Z1ds5586PmGEAd_K@ashyti-mobl2.lan>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1ds5586PmGEAd_K@ashyti-mobl2.lan>
X-ClientProxiedBy: DU6P191CA0059.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::16) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ab3bd5-6a23-4179-80ba-08dd1b870ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yno5dzV3S0FMVEw5ampNVUcxeXBlNDZINmFTWGtjdE5vNlhPWjRXYyt4MEhi?=
 =?utf-8?B?dHUyamp0ZFdDL1NNUVUwN0RIV0VRcFZpcUlEY2RidXk2NGovTUFoSW55SVph?=
 =?utf-8?B?NnVzREdJcVB5Q0ZGdjBEYjFTeTZNQ21SQ2J1YThCR0d2OFFET284bUVWZGJX?=
 =?utf-8?B?TnROWDAyMzVkbXRneXI5VENvUnVCZTF2OW9BeDRhVEZYdWFibVRRQW8ybVFw?=
 =?utf-8?B?NnRObmJVek1NMWNpMzhwTE5ROHA2ZkJBTThaUUtBeEN2TGEybmtnV014R2JE?=
 =?utf-8?B?eURpM3FUR3BZdWg3djBFUHdmai9SME4vYUZaR3hTdVpabWdCd2lWWnFlMjZG?=
 =?utf-8?B?UFNGenJzZmcwSHJ6V2VtcXBKNTJEMXlRZVM3VFUyeWMwS2hRYUtWWWtqSFVB?=
 =?utf-8?B?MUZ1aEFBdm5ucHdRUERMNzI4ekpuZWpxTlpnbnBYZHJmUCt2UUpoc1J4Zi9T?=
 =?utf-8?B?QUo1UndObSthRWdnek9jcmkreEJZaWk4T1hEQlZZNUpUKzU1QmQzWTRxazN6?=
 =?utf-8?B?Z1hsNlVKdDFRMDBmOHZhSk9GcHBIY3pISTI2Y3g0QlVrVFIxNit5Q0dTMCtu?=
 =?utf-8?B?eU5mck40SzlLdzVBdGdYcTI2MU1uLzdWd3FZMzA3Tktjd0Z1SHArVW9UMm42?=
 =?utf-8?B?VWdMYUlXeTJkaEJ4MjcyT1libnFjMnRGR1hDbXp2NlJSUjlPeHZvOGhQVmVI?=
 =?utf-8?B?R2xyZzF1V3ZQT0dpYThoTlZBSWJseUdYNk1VODUxSkEwelpHR1VXQzlLRm9k?=
 =?utf-8?B?T2xNdWVXTW1tb1djaEc5blRvbnV6QldkNVFHaVFtRGVoV1ZmUE9tYkpxdkIv?=
 =?utf-8?B?cy9kR3BIQWIvWkdwQWNuTHR4N1ZaMjBRMjRadWhLZ0x6SVdQcG0vVy9xbWtm?=
 =?utf-8?B?L3dZYUQwN3hjWkoxeDhQMUxCNE90NWtEZEh3ZUhpSzNnL3RpaktlMTZoTlds?=
 =?utf-8?B?d1VvMVIyU0lBTVUycjJEY2NXdk9kSjE1SDJZY3dmcTQ2YWIrU0dTTmhxMWdT?=
 =?utf-8?B?RzRSWDc2ZmpiVnFOcVZramVYOEZHTFNkSy9WWmNEdGRsM1V4QmlvYkk0YTE5?=
 =?utf-8?B?dHkwaUNLakJtbmNmTlFvNzI2ZGE0VEVSVHIwaUs3eEJYV25PSllmSVM5WVlI?=
 =?utf-8?B?akdBMFAvS1pJdFVhdzlsUWtwa25lODlqMWxzNWpPd3NoT1IxelNvbzdQM050?=
 =?utf-8?B?TkhuM0lsU2YzSVYwVnhvTFlLMnZNNVRLOHZFd2RWbE56aERYNGxmTTlaVWJB?=
 =?utf-8?B?dzRiUG1xZU1YL3VRMWgway9aQkdtYmpUVmNaOHJtQk5ZaXRJcmZGaUpYRjcx?=
 =?utf-8?B?S1JoNFE5aGdiL0kyOW5YdkhJSzdzUitzV1cvSDVmLzZzOHZGeFdlS0wwQVNq?=
 =?utf-8?B?dzNPVEZBQU5wN043M29uY0FxQ21iVmluVGd2bGhOb0JxUk0xM0QwZGNYMkg4?=
 =?utf-8?B?VVhabmZhMnlwVnBNNVhnTlUvQSs1Y25wa3FENllPdFE2Vis3TDU5QXo1ZUl0?=
 =?utf-8?B?M1c3YTArdE9ldmhpd3EvaFA4SjVhcVJ2VlpMcks4c3huajhQaEtyWjh4SThU?=
 =?utf-8?B?anQ1Q1VEVE9UVlloRWU1Rm50d1dCK2pXdHlqUjJEMWF5cDlwNnJBM1lFL002?=
 =?utf-8?B?WStic0VOWVpsOE5pOHFkN1NjWGR3a0VBZ0dnTlM2bzl4UFRiekpON3B6d2FU?=
 =?utf-8?B?RGxWeEFKMHNMZmtsT0FTZlR5WWNYME5KNkgyS2VYVVBoTlB6dFpxSU1wK01Q?=
 =?utf-8?B?UklybGgzWWZ6dEVlbncyUVJrZU1iNmpvakdsQ3dYV1lnZUFYeTlQbzJuZkxq?=
 =?utf-8?B?bkV2aTVjR0l0K0pyMTZQZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blprQVF5dU1xdjFLUTBpaFZudlY5YmdQbWpkeDhjODNvWGMvcHJST241aDc2?=
 =?utf-8?B?ekozU3BaMG91em85UkxncldHZ2VVUXlFV0VnbjJWV1hJcVZIMHBKdXVwMXlv?=
 =?utf-8?B?T2JzczdHRHl2bnNIWlRTcEwwUlo0aW1iM2haTitPbVUrN0ZZTnVXbzFKUVpi?=
 =?utf-8?B?S25zMHRSNGJwYkEyZGRtaDg0dmEzS3J0Z1lSYmNwT0M0Q0Rrem9la1NQT0th?=
 =?utf-8?B?aDkwTlNXWDI3T2JrUnFEOFJIaFlielQ1NUV4TVhBdnIxNzcwajJyVGpRZy9Y?=
 =?utf-8?B?MmZQYkJXVjAyclhXWDdxTHUxV0FZb0JxZ0Vpb3IzdkJyZEpyTEg2NG9HMjV2?=
 =?utf-8?B?a2VmSDByajhzdk01a2JhYUtGUjBxL1Erelc3anE4aE8rMWRzRVlWWVkvZ0ky?=
 =?utf-8?B?OGE0UTVoaVk2dWpXbFZVMkwrdnprMTd0WmxhdldENWcyanZSNUQ3UThXWm9i?=
 =?utf-8?B?NzN6NUV3TUZ3VjNGRlA3ekVCYUh5QjMzOTZDeDAxNThic0RIQUV3SkVhZXZp?=
 =?utf-8?B?dkZJVVNqTFpHU2VpamppSTM2aXkwRzRjSWtKRmVUK2dmNGkrUzZteUxXWlVz?=
 =?utf-8?B?cW94OEloQ3FYNWlaejJQb05rU0ErK2RRQ3ZjeU1SdWZaSjM3RnUxSDVIV0x6?=
 =?utf-8?B?TFNhbHFZOG9PUFBRcEMwTXdhK3BOeEtmNnYxVnB4bHBEK1VPQXNSNTZiT1Jz?=
 =?utf-8?B?SEZrQkhJaFVPNTRTYXZkcXRPR2FWcytzYlQxNmFoL1lZcFFrUFQwYlNFY05a?=
 =?utf-8?B?L2w5Tk4waGRMbkd0d1dKek5lUE9HcFVndXlVSExSWUQwQThWM1ZUMlFwbjRx?=
 =?utf-8?B?cXcrK005QkJIN1hzTkFWbUlJd0RFMjFxQnE1T2VkZHdaTUhNTXU5cXZjQW5E?=
 =?utf-8?B?YzJobkV6aCs2Zk5lNmlqQkZKUndnQ2tmdS9VTHBaSmxEUnJFcUNsOVpPOVM1?=
 =?utf-8?B?VUFIYmt1cEhJZEc4eGlmRFI3Skx4TDE5aXV2RWsyQUY2YzdaaWo0azRlME1R?=
 =?utf-8?B?VVRwODYvU0MzWHV1VXVBR2xDdmtPcXc0Njk1aXc0a0t5TEhLS1AzV3RTVS9D?=
 =?utf-8?B?a09JV3Vodk5hSDBOcGt0QWJQRXN5NGc2S253YTl6KzhCejcrYWMzcWIxbXdH?=
 =?utf-8?B?T2tSUTBWd3VkMFRjN09QMzcyc1VaZ0ZCYW5JTmFzN2MzdnNiNFpPeTBXOTZS?=
 =?utf-8?B?YXMwRklPSlVSL1BZM1dJa0FaWFNodEJYckc0TSs1T2c2ZWZFVXpqc3NZS0wr?=
 =?utf-8?B?ZldkdHFrRmdPdGZ0LzlnQnZzMjVFMFhxeklBejNDQ28vRC9jRjlaQWRBRENW?=
 =?utf-8?B?UXBqYWNVVTNqVUx0RXVIODZSb3c0YlBWZzFpWHNUYkFML2IwSUhUZzJnTENr?=
 =?utf-8?B?MUhwNXVwWURscjl1N0hxQnNBQmxqWGRkTStZYnV2VkgvdVc4M0Z2b0pOM1RI?=
 =?utf-8?B?KzEyZlBpbU43N05PUGxaLzR1S0w5UzhEaXIxQnpwY0k2d1J2alBSWExJd1FT?=
 =?utf-8?B?YjQvS2UxV3NrcWphNVgwZG56dnBsMzZDTFlsOExuS2M3VTI3VC9OV3hUUXhF?=
 =?utf-8?B?RjEzamtGbFdQSHhJNjg2RUZWU2FvVmFOeCtyRjl1cU9yNHdSUm5ERk9rOTlZ?=
 =?utf-8?B?QmRqVW90amlya01Bdk1Ncm0wTnk2aXd0M2xLcGpYbTlHa05PeGp1bmRNL1dX?=
 =?utf-8?B?MDRrZzdiWFNTQUNqd3AwSXcrZkhreGgrSkNrSVJYOTRQUHkwMVd1ZEpWZFVU?=
 =?utf-8?B?MkdDME81SktPOVY2MnVWa2JJcjNpcW5nbS83eDNVdEJIb1VyTUk2TzJCUGhk?=
 =?utf-8?B?b21UdmJTbUtQY0YzdFo4NUt1N0ZCaFR1RzRTcUNnMS9kVzBERnBRa1pLb0NM?=
 =?utf-8?B?UDIrOGMxSlM4clBxTnlqbGFlUWtsTEtRbWs3N3E2d1RYODA4WFc3VHZaVVIw?=
 =?utf-8?B?eEpjVHM2aXlSNk4zS2hjWVVMVlN1K24vS3pHQ0RkaGVsR25obU92OVZYQk14?=
 =?utf-8?B?M3dvbEl2S2pvK2FBKzdaZ2VBTnBHVExkNkVFSlRqUDE0MldhUlMvdkxuTGFF?=
 =?utf-8?B?QVN4dWhNWkdxamFXemtzd1J4Vjg0UW5SS0M0ZVpVd2tRNVZuajNIY2NvR0x4?=
 =?utf-8?B?Z0dZVjZRcUJRcjJpbmJqUjYrdktZNmRNQ1o1OWJRL0xidDBYRzhNYXNmQllS?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ab3bd5-6a23-4179-80ba-08dd1b870ce1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 15:01:40.9764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6vyxtAoAi14Tbv+qEH4ucEduCs6PlSwUcRIQFDPF1RXfogVbukiyH5X/8+XMj9GPBQOOkbwWJNnrsFcqUKivpvkhGQRuLJHCLHcMAYLHXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
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

On 2024-12-09 at 23:19:19 +0100, Andi Shyti wrote:

Hi Andi,

I think this patch needs changes, but I wanted to clarify some things
regarding this test.

> is the power of two really needed?

The NEO UMD expects us to provide always full ppgtt range, which is
set in `ppgtt_init` to value that is a power of two. I see that ggtt total
size can have other values, but for ppgtt the total value doesn't change
outside of `ppgtt_init` and the reduction introduced in Commit 9bb66c179f50
("drm/i915: Reserve some kernel space per vm") that caused UMD problems.
I've also checked how the UMD handles the total size of ppgtt and before
introduction of aforementioned Commit they also expected the ppgtt size
to be a power of two.

Do you think that the test should check the GTT_SIZE in other way? I
just couldn't come up with different test.

Mikołaj
