Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798D4CCD184
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 14:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313D610E605;
	Tue, 21 Oct 2025 14:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCD48jny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6275710E605
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Oct 2025 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761057326; x=1792593326;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Mudof49b8WkAxxi1ERSdLBl1h7axWoxetR4odipwx9A=;
 b=aCD48jnyk/Q9JxKTNQ9LHCGNwaROxmGklW+zyEBnl+iczVMDWrVOJmkz
 +gv9Ot/poOeVsk1Y/CggCTeFI45XCClaKQrpvCGdDWcmsKTKHyYnEgWW9
 o7Hb+cEKTh8xQ3SppVqLGl5dmCJ5WnFzTsh4LvylocW82E042eof1cqBh
 tc0WeWBB3No4X1nP4L2g8S6Rv2Dknv5QZs+f+8Qgy2rXVh6F6hzgfRJ3R
 al9P/9Eo3JTrAfyaM+1MINMPFm0XwoD5iQt+GPAz+pO9T/AE/VJYU7W8J
 hRNWuO4FWga2Z4tYH+j3ie1nkT3YC7cRB8pYXlnNnQU0qSd5NuVCINaFZ A==;
X-CSE-ConnectionGUID: bS183VFrRYqqMruYnqk+xA==
X-CSE-MsgGUID: t6jauzdLTxm5m7gznNwoFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66825587"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="66825587"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:35:25 -0700
X-CSE-ConnectionGUID: BD+8HLNBTG+BYJggTUIu9w==
X-CSE-MsgGUID: S/9JTcqSR/ex/d4iO/NW4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="184382082"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:35:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 07:35:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 07:35:24 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 07:35:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5y79mZkPMU+m2thwM42Skhq5T0Luc2zL/qdr2Ku4xbMzSGZlk0z1uJE50UIgkoRIzXAoTwVxb39rv54IBX2s6/QurrWGbvNA88rkmxzZsk/I4VOJb57PgpdzaBYn+lmWpauHrF0PC5wnCfwE5KSig1ihUr7QicMp834IWgcneKbvBrFUFah+8I5PABhDEV2orbJiSMKSDIPJH5Hb4EY/eY1Ja6jxT1DBaljC9eF7Ha7k1oQMRkS4FJ9ejAudAtUJWL9CIhgfPkAtkO4Ou58g4K4KG9NLIAT0nc1eYiWSMzHLRvt7r1MHgVW9H6RRpDaktq5DPJwVK0CxNiFgigrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbsrdzM+Mz4ISi+TLQiFc7sKlUVPg3BvWy6RR22xQiY=;
 b=i6b4d+0WfplI4DFkqqyIg2R005FdHl9Xbyl0kohAU8c9rKMjEZQH2bOcBRJmTNIbRvWG1VbAwLc+p8ygQZZy8/zPDNnIu1GGahXJDa8XDdFy1Rrp4wfabqoFR1s8WNmcbLZoOZYHcpDmDNCErNajel3DSrOD2yHxGyn4N2KhRGESlK7K/7jL4qGAU1Hj98FTKPPTzJ2o3V+uZUfbDW6aABgxG9uGYgotUhsmnZWGy1KNAO7RdJaKEFZibr1N54SgCJpsTBb+wUcM6OjYRgHc/JuSNchMU64aosP6Nx2Odz7fwK6j6YwutDfSetyzcaL65M9F2o2w2HIercWWrZHglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 DS4PPFA2144AAC3.namprd11.prod.outlook.com (2603:10b6:f:fc02::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 14:35:23 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%3]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 14:35:23 +0000
Message-ID: <980e0e61-1674-435b-bf1b-d81b6b7795f7@intel.com>
Date: Tue, 21 Oct 2025 17:35:02 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] lib/gpgpu_shader: Add num_threads_in_tg to shader
 struct
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <zbigniew.kempczynski@intel.com>
References: <20251014114336.1712360-1-jan.maslak@intel.com>
 <20251014114336.1712360-2-jan.maslak@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20251014114336.1712360-2-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::43) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|DS4PPFA2144AAC3:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3c159d-ff5e-4a9e-7f6e-08de10af1117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDhvWk1JQlRpMWpiVEtud0JaSm5ta05SUS92aXFaOUMvQnJPUE5hbmJpNUVI?=
 =?utf-8?B?QzJJUjBONFNsSHpDUk50QWQydi8xeThianRad1pGZVltMDhrZ1hZRW1EdDNQ?=
 =?utf-8?B?TjVZcGxZSnJHOUN4RHp3Y0M0STZ4dHpoc3I1WkpQc1dTZ0VSdHdUMWhIaDE5?=
 =?utf-8?B?Sm1lcHVhck02WWY4MzAwWFduQXBnQ1pLRkNaMHlnbDBValVEaHQwcXJGamhY?=
 =?utf-8?B?ZWgyajlFdVlpT2RrZjRJbUVqTXgwUzFTUzZyUFVCR3p5aDNjek4vcTUydUlB?=
 =?utf-8?B?TkkvRkIveTNGNDZQaWJ1Tms3anJBbjFqNWl3TE9DM0t0QkNFRWpZSVlQNHFx?=
 =?utf-8?B?U1ZhV0ZKVHhlUXptYSt5alFlaVFCVVptN0NRbEhMNk4wWFZ3SXJQM1B2MGJL?=
 =?utf-8?B?d3lRVVI3TTRIVHBNakpNOGE5akRBZVQ3cFhCdHVhTm5qbTB2b1R4N0JBektv?=
 =?utf-8?B?SHV2RXRGcW5rSVNIVGdDc2Q4MlNPaDVnY1dKcUhTU3RVYlNnUFEydGtsKzRj?=
 =?utf-8?B?Z1Y1b0NVeXJUTWlZL1c1QVNqc0VqVWFPT1dmdGYxbEtvY0ZNc2ROWmVUMWZm?=
 =?utf-8?B?cGRhRytYSFIwbWJ4K1dwWkRTSW8wSUI4VXJqNW1acE9FVzFHTmo0b2xyR1NK?=
 =?utf-8?B?ZUYzUDdDOWdkekNPc1VqWFpFR0pza3RMUHFjL24wNUJvNHZYVTVCUVp4V1JT?=
 =?utf-8?B?VVZYUTZXYUNjYUwrMkZ1cTJCQjZTT2QwTHdiVlFMRTdVaEFVV2UwOVk1aVM4?=
 =?utf-8?B?ZVk5MnFZd21NMlZtc29WQ3hLcnlxOW4wY0pwdUhzTGdBWmRONlRaOCtQeFc4?=
 =?utf-8?B?OTNTOVEwRExzaDhydHNIKzhMMmhoTjZyUHFsVytIcGttbEs1c01oQW55aFRX?=
 =?utf-8?B?bUlueUpOSWp6Sm1CenJDQ1haZFNwR0tXRDJUQW0wNjdWWWNRcm1RajI3V0pw?=
 =?utf-8?B?dDdOT05zMzIzS1NYMjZXUDYrTUZDbm0xNVJwcUZkRkN3dCswSFBTeXpPY1JI?=
 =?utf-8?B?RHQ2SllvcUh6RE43WExGSVZidWpObXd0T2V3QjFYSDZ4R0dnLzNqSVZIOE5W?=
 =?utf-8?B?N0kraXJ0U04xY2o1WVVHb1dhckxnQjhYU2xYcTh6ZkZ5ZWsxdVBHdlFYaDEw?=
 =?utf-8?B?aTFLZmxDMjlDVFpiOE0rYUdrQjVkNG5zMCt2ZS9qYTRWazRXNDdxVEQ4ZFJp?=
 =?utf-8?B?YktMQ2VJK1NmNGNxNHFzTWV3ZWRrcEFoaXJKbXhBdXZDYXQ3N1Y4WWhsbEJh?=
 =?utf-8?B?N3ZMK2FQVUsyOHdxNlBWYmsyTDh6cEFzcGJoNzlCdnVUcXFyR25FWFIvcHRy?=
 =?utf-8?B?ejVLZ2VXU3JhOW13TzhmeFBqTk1POWZjWXAyRG9kc0F5RnFBcjJwQ3B6MnNH?=
 =?utf-8?B?SjZyUEowUHJNQWtSckNWSTdQRW0rOWJHdWZXRStKZWdmZFJNYXZXQTF3L0M5?=
 =?utf-8?B?MTI4YTNPN01IYnJOYTRjM3ZLbWI4KzBZS3VrRzh6Z010c2lKd1FEejRuckpD?=
 =?utf-8?B?a1gwMlByY09aS2hrSW9LUGdtWlhSTnB0VlZxcHorYnQrSm1zbVZMTTllMmVX?=
 =?utf-8?B?d3g0eXA4a3NRMzVGaHFvMER3Q2w5SGR1NXdNTkZZbjBPeXg2elM1a0l5cmRo?=
 =?utf-8?B?NTBrN09mSVdBRkd0bXBHL2l4ZjB3cGtXMHZ0K3NMV0syKzBONUhSb0lxSFhZ?=
 =?utf-8?B?MDhTNHBnNTZ0RGhhSC9JOVBxQXJLcytyakJGUDlDY1FnQTZ6OE9zUmxlQmd2?=
 =?utf-8?B?T0VVTDU5dElLeUpqZzhiZnFHU0ExQVg4UU56Szd3ZDhtdjJDOXQvUnBHZFd3?=
 =?utf-8?B?VHFWZnRENHphMUZtOTR4TmZMVDB2VlhRUzQxRDFhUnVIajJ1MVNDaHRrcEVP?=
 =?utf-8?B?SnlLWWZqL3RJL2dVRUVaNS9vRXB0cEJocFdxODUzQ1Z3c0JpSmhHUU5qWVp5?=
 =?utf-8?Q?aq9KCkxOAJv/dDzgars4tqDX1SsZ5EWt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDRaSVQ1eitCUFA5b09oa3cvNDVDUFFZeWdBUVM1dUN0aWlhWENtd1liSlIz?=
 =?utf-8?B?aWNTUDhla1E4b21KUU9vUjBxNENCSzZmTzd5akQ4NkRtL1F4NkxuczRnUTF3?=
 =?utf-8?B?Um8rVVltdEd4Z1BZbUZGZTJjN1BMWUJpOFJBeXgyVks3djBxSVZCcWdlalpH?=
 =?utf-8?B?RXYxK0c3a0lGRzJ0WURDSXpSMHBSeDV3cWZPREszZzdBbDJudTNiUUJvQmps?=
 =?utf-8?B?Wnl0SHBLZmlDbU54VlNGd1dWR1NWTDZObDQyQ2I0Qnd6RzBPTFJveTl0b2ZC?=
 =?utf-8?B?Vng2UjhKQitBUHRmdGllU3dmaStsUkFJVEIyb0JSRlczUldDQ3g0b29GYlZ0?=
 =?utf-8?B?ckpEa0RTaWxtL0IrYUwxOWd2TDdoa1hSU2tydnJXb01maEFpS3E5YXdHaGhw?=
 =?utf-8?B?Y2hMQXRIeVlVRWNnN0I5a3VpWnJzdzVIcVNZK3k2WmY3eWhFbHhxeTd4SExZ?=
 =?utf-8?B?RHhwU2lvMzBpNmw4cTliSGJOSzRXZnZRdDEwSUx5Qkh5MmQxbUtyZFFUek5P?=
 =?utf-8?B?aTFqeDd6cm1rY0o4V3hLMUZkVFVRY1RYYzU2M1VGSUMxNS9YYkdSNVhlZDM1?=
 =?utf-8?B?V0x0dXJJcktzZ0tXeDc3bE5qeHBoRXFBSEtPVFlITmpZSGd1MmUzSzhlY3Ew?=
 =?utf-8?B?MnZlQkFUYjVLMDVvM0VPQzcwMERpOGViclJhUmttVnZJOVdzYlBoNy8vVUwx?=
 =?utf-8?B?S2NpeW1JeWY4U3VXVTR3SmQ5Y1JINDB0M0RsbS9TaURISDNpendyaTQ2d3My?=
 =?utf-8?B?UGxJR0w5NXFnZmIvTno3c3J4QVZMUlhDQjVBa0Y3OFBTdEU1bXNGYk5SNXM5?=
 =?utf-8?B?a0FldzBCOWRIeFF2RVpqMloxWjlUai9kV0p2Z3Z6NUt5SU1QRFRycHlPYlVE?=
 =?utf-8?B?RHpxYllVcXdCZnBlZDBSbkE5Rk5qUHBKcE9RN1FoVWtvRUllbmpmaTIzclFG?=
 =?utf-8?B?QmZaV1QwWXo3RVJ3Nkx1K1dTVmZXbDVWZHZ0aU8yeG5GOHpnbWNBTnVvMENQ?=
 =?utf-8?B?NFQ4bEtDd3BvbUJWREVUWTU4ZDgxclc0cDNGbHVtWnFXbDdIeWt3ZWErSURY?=
 =?utf-8?B?VnR3YXN3bU4yMEVITm02K2xid2h0QnVGby9kZ0lVLzFzLzNlbUJPeTJuSzcv?=
 =?utf-8?B?Mk5pRkxGS09BcSsvZXRDK0RWWkcrZmtuUWtxWVZObkNqOTc4cVdyekZTc0lO?=
 =?utf-8?B?QjV5MDM2UVNaanNXZGxJRXpnTndmNWQ4amRYK01RaE5DSjhxRGVOUG5oNmMy?=
 =?utf-8?B?ZFp1VjluMy9BVTc2emtjZTRNOGNGaURnSWlLWDV1ZjVuM0Z2Zk9leG5wcjdv?=
 =?utf-8?B?Z204VFBQT2VvRVFTSWxib1lEZkVoNWRuOUtOcnJjdE80VDVsOVZ0cld2dytN?=
 =?utf-8?B?dTJQc29lZUxTMUdUcmRwWlZ1dkFtQlg3QlNDTTZnbENmRXVxSUpLeFdnR2N2?=
 =?utf-8?B?LzRGTWc4cGlTVlZJV1RmNmY4RFE4RWh3Z0VjRUdrSHBKU0RQRUdsTlR4RDgv?=
 =?utf-8?B?NHc4WXNMNDhIT3lQSmlrTGI0K3pKeTY2L1luVHR6U1JHR1dLL3BYLzg2R0k1?=
 =?utf-8?B?M0FTMnpGMld4NmNoaXNBZ1ZtQ3hyWHNlUnc2NkZST1NKUE5WbjV4TTBLZU42?=
 =?utf-8?B?YjFYSEVibFk4TVk1Y2VoYXFuNk5QTU56Vy9VT3NRcmhnMjhoNlZwa1Myd1pH?=
 =?utf-8?B?ZWNaTFBrck5ZdjdLNk1mTVB3emJ5Uzl5TmdLUVVsMWZpRWYrQlVMSTBLQTRH?=
 =?utf-8?B?aFFJVzZoNjFrbjNoTEVCNXkrSmlCell0N2xFMFBHSDFpOWRSMnhYRVhYaEJL?=
 =?utf-8?B?S0xKYnlENk5MUFRBWWU3SER1RTFpSTYrL3AyUHFSWHVsWmZKd0lzU0EzaFJD?=
 =?utf-8?B?cEtxdC9razFLL1RkdGlQWWZYb0xiaTBOSnVQUTRNb2U1WUZDZVppb0g4cjZX?=
 =?utf-8?B?Sjk0d0MzVzFRUlBKZ042d3hObnE5MEIwQ3ROTWF3SkxYZFEyTldwMnlHV2xZ?=
 =?utf-8?B?NWVLaWNFMlhKa0FQTVJDYUM4aUFwRytaK2hvVWZxVkl5MlVINUVYQU5aMzEw?=
 =?utf-8?B?ckJxSnBSL2FDNzdZb3hWMi9leUdBektkWWkrTzU5dHMxRkhoU2UzWTZ4cFlC?=
 =?utf-8?B?bmY5S0VScjBjQzBZL0o4Ujh4YlR3NExuL1g3UG95d015ZzRXT29XemxLR3FF?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3c159d-ff5e-4a9e-7f6e-08de10af1117
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 14:35:22.9638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OK2LSw/qWYL9Q5jDqZzhu3XSNzF0byprYXddmxeyRF64UbrfsH9jxSSCo8KizCxqLmZSBOsEdA7S8mR9JgnGWyXW/a2kEqKA9B3IvP2UN9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA2144AAC3
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

Looks good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 10/14/25 2:43 PM, Jan Maslak wrote:
> Add parameter num_threads_in_tg inside the gpgpu_shader struct, so that it
> can be accessed and set from within the tests.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/gpgpu_shader.c | 3 +++
>   lib/gpgpu_shader.h | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index a63af0d23..e8600de23 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -116,6 +116,7 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
>   							      4 * shdr->size);
>   	idd = intel_bb_ptr_get(ibb, interface_descriptor);
>   	idd->desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
> +	idd->desc6.num_threads_in_tg = shdr->num_threads_in_tg;
>   
>   	if (sip && sip->size)
>   		sip_offset = fill_sip(ibb, sip->instr, 4 * sip->size);
> @@ -178,6 +179,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
>   	xehp_fill_interface_descriptor(ibb, target, shdr->instr,
>   				       4 * shdr->size, &idd);
>   	idd.desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
> +	idd.desc5.num_threads_in_tg = shdr->num_threads_in_tg;
>   
>   	if (shdr->vrt != VRT_DISABLED)
>   		idd.desc2.registers_per_thread = shdr->vrt;
> @@ -279,6 +281,7 @@ struct gpgpu_shader *gpgpu_shader_create(int fd)
>   	shdr->max_size = 16 * 4;
>   	shdr->code = malloc(4 * shdr->max_size);
>   	shdr->labels = igt_map_create(igt_map_hash_32, igt_map_equal_32);
> +	shdr->num_threads_in_tg = 1;
>   	shdr->vrt = VRT_DISABLED;
>   	igt_assert(shdr->code);
>   
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index ca996d574..90ef3eec8 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -28,6 +28,7 @@ struct gpgpu_shader {
>   	};
>   	struct igt_map *labels;
>   	bool illegal_opcode_exception_enable;
> +	uint32_t num_threads_in_tg;
>   	enum gpgpu_shader_vrt_modes vrt;
>   };
>   

