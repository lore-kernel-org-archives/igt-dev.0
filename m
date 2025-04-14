Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67961C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 22:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14F910E660;
	Mon, 14 Apr 2025 22:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8z3FxKx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A78510E00A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 22:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744669159; x=1776205159;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HmSX2JbKQjLVsN/HqTqfJZ1Hj57VqZBJ/JNJit9Az/Y=;
 b=W8z3FxKxMt225rq27Qlr+5d6uZKK/yB/oqsGNX6yj4Lwh76nMQStaDB5
 sM1/up1DGOT4vU2mg/1Bn7v105XWZsI9Xx3hBuEEWDo+7/7q6jGgG6BQ1
 OMOb6t9LIJ8IFsPFRbrXgXAw3rwxvpuvoVeM3jjOe/NUmI45vObsH66np
 yRIH/iBWmXbsZSkY5dFWwkIaHFaFOjyDGJJb73UqNlvEuGbwFhsPDNY4f
 B53H+r0m20LUVYnpJm02AMuwO6L5kN7fcPwsdHoUDvuRGZdLtct8Mojjt
 0RhYqsPLD1yg6Jw71xJ1NfjuANmuBdr4TnTNCZ72R8Xu4PJThMQ7sw/ii A==;
X-CSE-ConnectionGUID: aPiUEuiFRIexPMh8dT+1ZQ==
X-CSE-MsgGUID: xZThfjWqS5aWVWS+9Anfsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56336163"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="56336163"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:19:18 -0700
X-CSE-ConnectionGUID: CCv1ThkgSGGL5xnCz2d1TA==
X-CSE-MsgGUID: 32PBojOjRxGCREB1xMHx+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="160896136"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:19:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 15:19:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 15:19:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 15:19:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RX9KHGpoddUbvHXSpNK3by33gVqAEPc07X3CXq3b+DQYAKclU8lUgqx7E4yYMuJZ+yZ8qmrUa2930TxA9lv6/JpdO4f6A5rpzOeGfspoU1lo6asoSfHpi+gF0hy9tfzUmWkdfrg5FZTD3rRoA9MAjeAyRzpUUtXWUXb3ylAHKXYwsrUpSv8mmTpQlo9x3+D+OoVAs6aN6vA3R3if6RBdv7NjCA7jc6NaZNiGFqXOQOOkQUfL4PbGyL96BSRxK6avdh84Krb26s1cWIn8NL0AZz1qO9Ht+3ufepVMPIVDriZyu+GeVohGqFSX7rcXjYWEEz0QKevAHHfxkB7uX6s9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fq1x9fLPtysa/dyEr9JWnT2Jc5zfW1hrRyD4y7cF2CA=;
 b=PTS5VNhnPJEurPcwbS/V5UEu90YH/s5qM0G/P+c3gs0Sqb+D0NWDHJoAAnOaGHbSvyUxI8XXEqzrIas7G5XS8QCFGqi3KHIo4HJh9vKkctSvDMIVxPc2jYRANI80aVrwEnGgzLXIME9iU8Jpgkt8mJMBHUoqlXNDvWkfgm41xUoHCJSXbOuxQ0D3qgkasCbiRFgxx+LMA1rcabicXm793wp0keEHcWKiW2y1fl6Z1+CWme6dFRbqv5dy8kE4iyQ6X4GpHSPU93KehrmJpBnPKgCl5tqzogJae3fMYeOTLPuyDxBteSZwJiuXNz/EjYtu7LOQB4phxScnPeEDeJF08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 22:19:14 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 22:19:14 +0000
Date: Mon, 14 Apr 2025 15:19:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Get stream status on read error
Message-ID: <Z_2J4Akq3ttJHKM2@unerlige-desk.amr.corp.intel.com>
References: <20250409233441.143402-1-umesh.nerlige.ramappa@intel.com>
 <877c3reoyf.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <877c3reoyf.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0366.namprd04.prod.outlook.com
 (2603:10b6:303:81::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c0dcc90-6a21-4020-e012-08dd7ba2636e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2c0N3JnNzFGTjBteGJjUEVwTDBxaGZGOTM0Z2htMEN0SkFraENPbU9PaHVZ?=
 =?utf-8?B?K2U3YmNjRExUR3BYY09xRWliYmdtQWlwbXlZU2k1NzYxQkJTN3ZFOXYxUjI1?=
 =?utf-8?B?ZWxyY3BKM0VuSlYrUWtWVnJhbmt2dmI2L1NwOGpkM3pmT1plZHRFVzRQZm1m?=
 =?utf-8?B?R2lKZ29mUjBsbWRxZzY0UWtoNTFsOXI5ZUluQU1vd2k2UWxuQVdxaHJXVHlP?=
 =?utf-8?B?N3pLNVBEeENrZmxnODBNbFdaTDBJM2ZmVmo2YW1ZRFdud1puOG1rMkJpVktU?=
 =?utf-8?B?UkhTL0dKUkV1K3BXOU1yai9HTzVuTWJUTUt5cFhCVktKMlJ4bEtnWUlZOTBj?=
 =?utf-8?B?akhVUlorTzh2Z1BGNGRnUlFuaCtMSE5walh5RWhxdVBqNVpTRWtJT1BJek11?=
 =?utf-8?B?RVYxdlNLcXdITHNnc25NRlRXY09VMU9JRjU0aGY5YXBMNVJCRmNlejgrckFT?=
 =?utf-8?B?bk44NE9xSXBWYVpOZjFKNkx6RU1ubWpzazRVQURpQ3FqNTdKTlphOGFUL1pm?=
 =?utf-8?B?emhVS2hBMGc4WDVldUlwZS9vTDZqQldXbE1Kd2ZxNFE2aWhQWllldk51YTVP?=
 =?utf-8?B?NnhpeUdrQnpONDJIQzBGYkdXMjIzUGZsZTBLN0djOEd5djhYQzdOdnVIQXdl?=
 =?utf-8?B?b2d4VGh3RCtwRkpDMmE4bmFkTXhDUWo3WlRidjZaZXcvRDFVdlNSdVNSUWoz?=
 =?utf-8?B?eERnM09hSTYxOGNhMWhLL0VmWWxibE50L1pxMGkzRFZHUDdIdGJzclBOL1Iz?=
 =?utf-8?B?QlZKODVmZlRnUUFxbURUakJ6OG1ndml6OHVmRTdXSFZzNmNvdUNTV0pGZEF4?=
 =?utf-8?B?c2dZd3RSOGsyVUdHcGlqNUlDTEtnVDFtYTd3aE9FbmJkV0hGNm5rd1cvZ20w?=
 =?utf-8?B?eGdHYno1SWZ5cy8vQWtsSkxoYmRaZklmWHhETUZiVTloMjdXVjMzQzNBSXBF?=
 =?utf-8?B?NENtaVFseGtNQmxoU2ZmSmhkMEx1Tnk4R1hpenh5RU13UFFVekh5NlBNYmph?=
 =?utf-8?B?Ti8yUHdCTjcxVDUwUEVrVmpZZVdrY041RXVKSVhVbmRxTTZVanhyOVIvMUJK?=
 =?utf-8?B?WmJmcjJ1V21CYmNVWmpOam8waUxDTDdzZEYwejhEVU9RbGRYdW9VRlF3RUlG?=
 =?utf-8?B?ZE14M2szVjBCdkNMaERQM1BodFJFZUhZb005MnNsNHFyN3ZUYlVWOVNOZUhE?=
 =?utf-8?B?M0hyL1BLMVNRRm04ekdRMmZIZXpRNHcwcFNFSm1zS1k4R3VrOFN4dTVOWmFk?=
 =?utf-8?B?a1RpcjRLM3Q1cDExbFZLUGRJUU5Jb1JGcHprVUtnc1daUy9abUdFSlR1Z2hy?=
 =?utf-8?B?QmE0SzM2a0ZJNXdORFRwZmZZVnlySHVNVWlSSkhiT3BWdm42Q0twSmIzcGMv?=
 =?utf-8?B?QW5wMDZXbDBaNGNEN1MrL0dqSjRRRHJDcXZGV094UzkybkhpempzVlozQXZH?=
 =?utf-8?B?aUxXeUlYSWgvM2lFdU5qR3lSdXhIM1ZjNnFlaWlPcWw3OUZiMTVuaEtEM3Ns?=
 =?utf-8?B?SlNadU9GSGdzSUxqWC9aL0ZlOXVhb2tvUDlENm94dWdNMHdTV1VlcEgyTTlt?=
 =?utf-8?B?SS9td2U2R2QybGFEVnQ1a0NmTnpTNC9tdEM4WnVNY2lGcjdMd2lrQWxhazVT?=
 =?utf-8?B?TmNuRUw2REI2M3pLb01OeGlmUFdTQklRb2dQNTNBekh1dVBiUVlScWVsZkxL?=
 =?utf-8?B?VUJkWW1UUlMyK24ydkZVY0FqcEltWGoxVFpLdGM5OTI1MzRDcTJTaFBSOTky?=
 =?utf-8?B?VzhSZVFSY0dZL3pOVVkzN01yS1paTkdnRDBQbHJEMEtpdFAyUzdLNkp0aktr?=
 =?utf-8?B?SDdsSERyNExmZzlCT1J6ZnZiVEtrQ2ZHYlpZaVJIa08vY29nV1BHSkRFdDUw?=
 =?utf-8?B?M2tmclNmSW9JYi9zSnFTSzBpTU1SZlhJOUV0MUg3SXNIWGtNZC9mNEk4b1Yx?=
 =?utf-8?Q?BOoOPRginFY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGJtcDNWVHE4Ym9oWUJ1cXA2Q1lKOFFtOE9OcmV0cDQ5VGJVTkl3Qk5xMzFk?=
 =?utf-8?B?UzhISWU3TUx4WE01TUNDUURLVXE0QzBSNHpqR0dFWmZ0Ym50MGNMODN4UmhJ?=
 =?utf-8?B?bUNDZVNwdmJHRE9uWGFSbllDbStQYkZGZGtpTDNxVFVaUFNOd3RiTlJVcHV1?=
 =?utf-8?B?dElUSjg0aE1NM3BtcjYzSFBGajFBN1ZOalk4UGZTelVpazZxdDhFQUpaeVdo?=
 =?utf-8?B?TUJrSUl5S3NwZDNhL0U2a0JZK1dvbkpMWURWeVI3cFdZanFXaGo4Q0JOSzhO?=
 =?utf-8?B?ejVHQTdyYld1M01YUVI5SE9Db25ZNUhZYjhFdW1lVzIvaTA4SVR2dzYvWStN?=
 =?utf-8?B?MnVudnYyYUhRNEh5UDJCUVUwNVd0UmFCOXJkTDlHODFiNFF6RzNpQjlwMVBL?=
 =?utf-8?B?KzRDMVVMbVE2d1FJbXdjYytFMXgwS2VwYU4yeUs4aTZWY0RWYmJqMGlFak1k?=
 =?utf-8?B?c2YxQ2hhRmNNak9nM0t4SFRsbHdSRWl6TXZ4OGpFcVUwVzNBWnE3eWE3bG0w?=
 =?utf-8?B?WDJSS2Q1bWJqYnQzM08zTFg5dWI5d3l5QlA0S1dnNFlnWWZXSlFyV0owZXpk?=
 =?utf-8?B?T21RYmI2UGZGRENZNDVPVkRGMmdGN1VFWWRxaExlQXJUSWg0ZlpibnZUOHJU?=
 =?utf-8?B?WGhpZTNmUXBJaDFDcE0rYTVkQnByN0lPbGpLQTVmZGk4cnpXY1orQUdIRGhY?=
 =?utf-8?B?NmtQUW00ektNa05CbXh4RkFGSTY4aWlTT01PYkZMd0hvbjIvU2ZMOGsvODZh?=
 =?utf-8?B?Wjl1UXdHNWtqRFRRUmEwWUp2MHBVcm5Kdld5S0U4UmZpZmdwcmp2aGJRaWpJ?=
 =?utf-8?B?QTdUd3JSdmlJbDBWaE9IN0QzTC9Yb012NmU5RzIzdVJheE5ISVowUmxXcVJC?=
 =?utf-8?B?QTVINGVUdHJsU1NiZ2hxOU1GNDhiU1MxUjdSSGtQOVljR0V0YWsvUzhhL1N0?=
 =?utf-8?B?Zll5SnlrRUpoVVBMSThqQ3d0UVVGK3doc0Y3WTBxLzlyeGMwSWpPdHo4YWhm?=
 =?utf-8?B?UGdicWJYa3MybjRRUFptdjNaeW9RMVI4UWFQV1JCVjVlUXo4TkY2WmFWTEFm?=
 =?utf-8?B?VzJ3MkN5aHptdHkzMkFPS1NjR2REc2t2RnZkWUZuc0crT0NJMVBCbkJ6SHFF?=
 =?utf-8?B?Y1ZheENscjJZWE9rRUVocWpIZHhWektWV3ZHR25IQ0l3cndubUhHT2Vxbmli?=
 =?utf-8?B?M2E5MHJjZDUrbWZ3b09FbDdPYVdYbnlPaFArUVNmQjVqT3J4cVdTSmcvS1p6?=
 =?utf-8?B?OEJ6bENxeHZORTZ2MFNrVlJaQm9hZzc2YlpRREYzQkhZRzNCWS82U0ZibUh5?=
 =?utf-8?B?MjFTc0NRMExOYjFOYXBDQkI4UTVhMjlqWkhDd1dlMVVwbXNSY0FhMVBNbHkv?=
 =?utf-8?B?SEZRc3ZUS1EvdnpiZXdWdytpTXAvT0pwMVVHM3N0MzJTeEgzZzJlVEphZlVX?=
 =?utf-8?B?Rm8rV1VjdFFzekErc094c1J3Zy9XZmtPSUJsamVwVmE2aXFVd1R6ejR1Uml6?=
 =?utf-8?B?YVFXejhBVDl2elFnVWk0OUlwV29wellLbjYxRVdZR05kdlNoZS9IVVZNdkg1?=
 =?utf-8?B?ZTQxNjZ5Z3FLdFF2S0w5anJGa0FVMGxyNjhjUWQyMkh6SDkvMzZoQ25pME42?=
 =?utf-8?B?YWpkL1hhKytLY0ZmMHNVcnFDdTRtaGtuaUorSDRvSHdUVTJvZWo5a0xZSXF4?=
 =?utf-8?B?MTZwbDF6VWtHY3R6UUxiQ3VycDhOVHpnbklQYlcyVXF5bnh3djJqdEhPSW11?=
 =?utf-8?B?SGxQeU44NkVUamo5ZUhyQ0hiakNQZHNkUzJpTFpIaHE0U1RLU29vMnVqRGF0?=
 =?utf-8?B?SGoxdlNOU2ZpazJnZzFlYlprRGRHNm1rWmZNM0ZJK1hLSStjR3Z5Skpxdytl?=
 =?utf-8?B?bWZ6MUtwS1ZINU5mMG1HNFoxMnlnd2xubW4xVEQxUnZFNzRLQ1NLZTZtZWJk?=
 =?utf-8?B?RWNkUUFLeWdUUDRrbGhzbzBaUEJhdVZRbEI5dExNS0daZjdURnBYK05LZzFh?=
 =?utf-8?B?ank4dHNYN3hRYy9wSkVDUVIwVnA1eFhrRjZkSmdQR1FQVkhnQVp5cVZqOUtY?=
 =?utf-8?B?L3N1RG5RaXozTXh4bFp3TEdGQ0IrTzdoMThXaDFjSnNyUFVWT0tTbGpHZXlp?=
 =?utf-8?B?ZWZISExGakFjT2dublhQaS91VlFNWVBWbER0dVhSR20rVzEwOFIvT1ZYNVZ2?=
 =?utf-8?Q?UrQQSrxy2XMvCQyo2IiJRjA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0dcc90-6a21-4020-e012-08dd7ba2636e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 22:19:14.1381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRHTEKn5dp4zev8qPXBkzzQ1C4bXJl8gWgQhRiH/3hzv/6N/zwq3sRR0cDxU/qNLnde7Jl/w+2a4hBc2Q7/9rZ6iAztM02Qv5QioUFAEfUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
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

On Thu, Apr 10, 2025 at 01:33:44PM -0700, Dixit, Ashutosh wrote:
>On Wed, 09 Apr 2025 16:34:41 -0700, Umesh Nerlige Ramappa wrote:
>>
>> Whenever read fails, get stream status so we know the state of OA status
>> bits.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 67acc74b3279..f3521c3d602e 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -2294,6 +2294,7 @@ static void test_polling_small_buf(void)
>>	errno = 0;
>>	ret = read(stream_fd, buf, sizeof(buf));
>>	igt_assert_eq(ret, -1);
>> +	get_stream_status(stream_fd);
>>	igt_assert_eq(errno, ENOSPC);
>>
>>	/* Poll with 0 timeout and expect POLLIN flag to be set */
>> @@ -2568,6 +2569,7 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
>>	errno = 0;
>>	ret = read(stream_fd, buf, sizeof(buf));
>>	igt_assert_eq(ret, -1);
>> +	get_stream_status(stream_fd);
>>	igt_assert_eq(errno, EINVAL);
>>
>>	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> @@ -2584,6 +2586,7 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
>>	/* Ensure num_reports can be read */
>>	while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 && errno == EINTR)
>>		;
>> +	get_stream_status(stream_fd);
>>	igt_assert_eq(ret, sizeof(buf));
>
>Here read() is not failing, so maybe we should drop this one? Otherwise:

But here we could get an EIO for some strange reason and would be good 
to know if a specific status bit was set. The idea was to call 
get_stream_status in all places where read was called.

Thanks,
Umesh

>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
>>
>>	__perf_close(stream_fd);
>> @@ -2727,6 +2730,7 @@ test_non_sampling_read_error(void)
>>
>>	ret = read(stream_fd, buf, sizeof(buf));
>>	igt_assert_eq(ret, -1);
>> +	get_stream_status(stream_fd);
>>	igt_assert_eq(errno, EINVAL);
>>
>>	__perf_close(stream_fd);
>> @@ -2768,6 +2772,7 @@ test_disabled_read_error(void)
>>
>>	ret = read(stream_fd, buf, sizeof(buf));
>>	igt_assert_eq(ret, -1);
>> +	get_stream_status(stream_fd);
>>	igt_assert_eq(errno, EINVAL);
>>
>>	__perf_close(stream_fd);
>> @@ -2786,6 +2791,7 @@ test_disabled_read_error(void)
>>
>>	ret = read(stream_fd, buf, sizeof(buf));
>>	igt_assert_eq(ret, -1);
>> +	get_stream_status(stream_fd);
>>	igt_assert_eq(errno, EINVAL);
>>
>>	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> --
>> 2.43.0
>>
