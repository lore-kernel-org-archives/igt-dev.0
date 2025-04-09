Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E1BC36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 13:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76D910E8CC;
	Wed,  9 Apr 2025 13:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2bQVFvm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F2C10E8CC
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744207041; x=1775743041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=V2//4rdbA1bSaTP2DizhX/toTv6jAJqDOybH4C5OZgI=;
 b=m2bQVFvmUVrNEki12IkQ3QRxVEwrKoCZhEojomBdgUEBGWOG0Peuz2nx
 yyIEXxpAVWeTzU0lkxWwX3/OX69pvc8FRS3n3JjkXPcdmH3YRjoo0zgck
 y97QzSK79Dd+mdKB9cvtCIBDzAtL0rjyGMPGplmYMESYXqCg3E0pxAzSH
 nKVNVcl+hQa+npWVWpajAU5hdcJT3NmSJ+BLGhyNKIekByuaFS5dDp1SS
 o6UfNimIZLzaJCDShOSjzelJ2KTdRijHUkc9p/gT9P75NEZQevYR/DNnq
 k5RszDLB2jRiUjCoPsAJBfdleeEFPdD8B+m/6t7h57ElRb4FAUg1KwuOn w==;
X-CSE-ConnectionGUID: qrEhcBu9Q7KKMd20sUJKAg==
X-CSE-MsgGUID: Vdb2WzoKSL2NbWHVdQ7dJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56666983"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="56666983"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 06:57:20 -0700
X-CSE-ConnectionGUID: ROTbg5WpQCqDfdYoO2+kZA==
X-CSE-MsgGUID: /RW60LSeT5uFQCyuLSiscQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="151768338"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 06:57:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 06:57:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 06:57:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 06:57:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiJTekj8bdVqe+JiWFp10n2TJpLN40zDr+4ILEf4T6qmF/NJD2/Fl4nQALy6FajJqL8RqAVsFsD1YE+RqfRLb9dQgT8vyAdMZ61ZdCyTDPN5an30+hK9rtSm4ldRQx59SrIHTqGGGQlDT5HALtwb8OcDqr7beei8GuR1NePuLolTpzjhzKvTgbAVKcna2bb0B7ey85iG4QDzxAdzZdLxHCTNthSV4ORg0KXiPM2Hj+50s0AUXNVgJc867qw/Ff5/i3NH6vmQuIFof5la5OgjYI0s4+5tAbJqfoydWNZFvcwc0lAvP+P/C1M85l6JgHNSHRaw+e/JoH7xl51y+JSpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2//4rdbA1bSaTP2DizhX/toTv6jAJqDOybH4C5OZgI=;
 b=B7nVyKrEAq7WHiysxsLILn4SM8klCwnq3Xl6S+o+PAGNHHv18CHTOlqn1a7hlJhPZyfgqhn0w1PmGHU07muhjU9g4vwq4MA+2dS0x3C4fxcnNSBakOKT4Iy4K7f7oVu51/sXBvuDyJoxN9DL1y5F8QgFRscDYUWJ/B/SKgsxiWyT9pKiE0e+ARhIZrtiQ70CpThq1bRjyYZoqy/ApmFemR6L2ETyP3ovBSXjDWuyYvwEWAgoc1WjzqrW8oOflrJTu8kSCmhfevB+cBoQaAnKewR76MVy72HbEjcVAGMsqdUKXycI1cuOoSO8dhEqZ5WSzRV1BPdGg6TaMDwg+lsK0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 13:57:11 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf%3]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 13:57:11 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "Karas, Krzysztof" <krzysztof.karas@intel.com>,
 "peter.senna@linux.intel.com" <peter.senna@linux.intel.com>
Subject: Re: [i-g-t,1/1] runner/executor: sync outputs after tests end
Thread-Topic: [i-g-t,1/1] runner/executor: sync outputs after tests end
Thread-Index: AQHbqVdKqU4B/toiG0C9YTL6dBFvlQ==
Date: Wed, 9 Apr 2025 13:57:11 +0000
Message-ID: <dfd5c54fe1839644d031f070386626867e79a2e0.camel@intel.com>
References: <20250409125543.49920-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250409125543.49920-2-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|CO1PR11MB5028:EE_
x-ms-office365-filtering-correlation-id: 3b7c8ee5-d6b1-4b9e-a887-08dd776e6ce5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SkpRNHhXWlRiOTMwZGFCR3lURG90dWg1V3MwMTFFaUVSV0Z1MUhMQmRLRkF5?=
 =?utf-8?B?L3o2eCtpS3JId1lDSlk1MmlDSnF5VG9tMEs5M3E5cnp3dUxGVFYrZVJ0TVZ4?=
 =?utf-8?B?UTZRL0F1YXhER2VKckExM0JkYnJFM3ZXRnBjMUQwTXF6bDBsVU9IZEVVZ2pY?=
 =?utf-8?B?aVBLcjVuZ0NKWVNSODdaS1BYS0lRRWkxWkJJZ2ZCaVNGTm9NWElSUkZUR1pz?=
 =?utf-8?B?bjZYamE2YTBITVZENUp2SThTQkoyL2tyTGIvd2hwSVZTWnRSdDEyWDYweDl6?=
 =?utf-8?B?ZGZpUUhxNHFEUGVmeEFYRUtHZVEycnZYUy9tQmg5ZjdRZHJaSWpTOWJ2VEh1?=
 =?utf-8?B?Q3NFbFh5d2daMk9WMFp0MEdvbU4zdGlCWmJjdEJzOUthNjdUcWNZejlWMVpW?=
 =?utf-8?B?V3MzL3BkUjhmbFBlTjMwTU03Rk82MkhhRzNQSDFnbHRqZEZBU3l4bFNXOWY0?=
 =?utf-8?B?SmFxdHZ6aHIxTDlqNTVHS0pXMjZLR1F5dE0zZ2kzb3lRN0JOUWIrRTRQUkRq?=
 =?utf-8?B?M1B6SGNHQmlvTkFtazRCWTVacGJUL3c5SXJHaGpQWlI3ZGIvVnNEYkVWOGYv?=
 =?utf-8?B?VHdsZmJYemZ0K1pnczgwTDdUaFhMRjdXSWdXOEtHS0lqbHU3OVlvd3l2VTdY?=
 =?utf-8?B?Vk91ZFZ3NFZwV000Tk5UdTJSWjdXeUZnS2NENFIwNzZrRUVKMkdJYUpIMTNS?=
 =?utf-8?B?TzVNdWo4ZkZhMXNjMjdWWVFUeWNKZTVSdXZYMytvWUttNlZLYlJBT1dmL3Y2?=
 =?utf-8?B?MW90TXhhUEdxY0E4ZXZreitBUHcwRnJOblRCK1ZqNU1NblR3SjEwMzJOY01l?=
 =?utf-8?B?T21NamsvTldEeUxybVpoM2w3OHptZWZIQ1FEVzJCNnM2SDZWOUdZK1hveEtz?=
 =?utf-8?B?SDF5Y0lIYWJjZnpEbGZmU0JmN1JIVVZYODZSMXUxR2cvQm1rTCtoTytWSkta?=
 =?utf-8?B?RWlySWJHZzg5eDJXUWJuRXk1OUdPVisrZU16b3lNLzZ5NEpOWnpwVUc4djI1?=
 =?utf-8?B?SEhwVUh6V1d1eDRrWnFRQXJROUlGYW1pNTNrZ2wxbUxSa1J1OVNJODNYcHVH?=
 =?utf-8?B?VFJCd3dlQ2FYSnFONGlwYjNESGpjdEMxQnpXb2FUNCtxMG9RazhocGM3UGIy?=
 =?utf-8?B?eDVJdFFJVk5oQWVJUFBNbmxqZGdKZWtMUUFqMGxRTXZsQlZidDlCUnZCUGV4?=
 =?utf-8?B?bUZxY1N5ZzVmbkJPS2VTNVBRSW5FRUF4SDc2RUk1cFBPN09odDA0eGJFOHBH?=
 =?utf-8?B?TkR6Kyt5MU05Um5LV1piclRwRVorVGhSdXNHMUs0bnZkZTV0dC9EYlBUcGhR?=
 =?utf-8?B?bnBFbEQ2MWJ5eVJMbWhhWnRsTHlFU3I3YnpydS9aeGdzc004MUhiaGtWaVE5?=
 =?utf-8?B?UmE0TVFoaFNBTlVCajJZSTZhaXBiOXcyeVIwR0tYeVd1ZmlXSjJzRW4yWTc5?=
 =?utf-8?B?WUI5ZXhicUVNbjlnZzNNZS84eC8zN2FMeThac2xFdkVXZExIVnllMkdwNEEy?=
 =?utf-8?B?Qi8vQkFmbXR0Rlgyenp5MlE0OVU1K2tqK2pnUnZVSmFwbGJ3RCtDMVM1eW1l?=
 =?utf-8?B?bk5STXM5OXVIZGVMNUtMSDVNcDJocE16cEwxQTNFNjJBa09ZQ0VtTDd6VEFt?=
 =?utf-8?B?TUgzNjBqZlBNdXErR0tYOHE2U0ZBanlRZ3ZMblJUaVh3UHdBYkllNXpSTko4?=
 =?utf-8?B?dDEreHV3ei9GNnNUM1Z5UGZ6bWIrZXpHeE9GQ2xlbjMrYXhzTTdwSmwxRVVU?=
 =?utf-8?B?bFdXazZHSHdmZFhLMTdzZGlTQXhjQkxtdEpjSkpsb05yOG1WM1VkaEsrcElw?=
 =?utf-8?B?NWhaU2NzeGEwOFVsWVRPTkFOekV3cHNvalBYWTJ0SkFmd1ZOWXNKcVdpQ3FM?=
 =?utf-8?B?dTg0azVMQmw1d3A4TmtadkE4eG9lRmxheDdJLzlNa2hPMGlIeHloZXF4dUw0?=
 =?utf-8?B?Nkp1Rlh4ODRRb0dzdDZmb0ptY3ZrNFc0QnFsV1gwTCtFYTBVbDdGZ3FqWWI4?=
 =?utf-8?Q?xazoGeytLZl5gr8wSqJAYY18FAQEXg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUxTaEVSNmx2V0ZZUER6YUtEWTVvRURwZUFCWnZEMTdNdkRYMHJ5ZUhKaUxm?=
 =?utf-8?B?K1ZvOHBiOGg2dUhrRCtmRklpR2c3T1BNdllZTFRrakZqYmxYN0FGTlNJMTRq?=
 =?utf-8?B?VnFYV3FvbnJrUkdmNWxqd1lUaVpUQm5Ndm9YdEsxdzE1a05rMWFKTXM1d3do?=
 =?utf-8?B?ZGd2d054UEo4bCs4eW82R213cE9ETm5ZVTNjMzEvZVlSbDhyc2pEd3NIeGN2?=
 =?utf-8?B?Y1l4VndzclJwVXdyemZqTEg5eEtIaXlhNVVKUXdVTzJHdFJMTTdhclY3aGRm?=
 =?utf-8?B?QVJLcXhsc1BVdTRDbTRxM2hCbWxvSjZYQlIzU01ISDIxcnRhaEd6eU9waGps?=
 =?utf-8?B?VWQ5Y1JiQ05VRzJrMVN1Y2YvSWdPbjNLQ3NCYnNrZzVNcWN3U0VvMDFWZnMv?=
 =?utf-8?B?NStJSHhldXcyU2F1YVozUDJHYktXbUJIVVlsYk9yMTZZSmN4WENxZ0NCaDRX?=
 =?utf-8?B?ZHpOd0hGdzFlK0xkUmpDUkhtTWFzdGprTFFDclVYdk1NWWU5ZTFGeUh5WXRX?=
 =?utf-8?B?NWdRV2xxbEs3OXYyT2h5T1AzTEt3dmlpK1hJN0F5cXZpSzVUbXI3UitBa0hp?=
 =?utf-8?B?L3R1WEFVZHRpbzQxRlg5YVRnd3pOcjluUE1vbkpLdTRuMkhDMXh0YVhHTzNr?=
 =?utf-8?B?VU9DS0JuczBkNVNrMlRRc1YweG8xWkFObkV4S2YxSlFObE1KN3BZSk1vUTE5?=
 =?utf-8?B?UEl3TnJOV2hNOFJXVFg1alExSWxaN1Z2bDhYZXl1dHJBcWlQYVFsMGk4RFlB?=
 =?utf-8?B?YVhIMHRWMlo0eno2QmdWV0lTSVE0MVlYVm9iNWNJbXRLWWhBL285OXhXWWZ0?=
 =?utf-8?B?K2JRRzdkTGpabDhiZ0FiY2F1WGkrckNYc2dJZjRHb3dValVsaytUVUh0V0tH?=
 =?utf-8?B?SzlSTk5RZ3hmMzRFVUJUTmVNeFFwbEliMXl2RXFpb0NBQ1N5akd5NnVoVEs5?=
 =?utf-8?B?ODZnV0hpNXZEVGw3aVRVL2ZTUHF5Y3pINGhVN09uQUZPdC9iNi9mS3dvVkRK?=
 =?utf-8?B?QTRIaEkxQytmdWpSYjZpcFRKMUdEZjcxWW9mYzc2V2IydXZlM1lQZUh0Rktk?=
 =?utf-8?B?ZjdzZ29BdFE1dUZZQldGc0ZibW54ZDE3SW5aMkdrL0pQQmVsd0cvR2JiRnpI?=
 =?utf-8?B?dEMxSEtDMEprQm9tSnB1Rm5ENTROdFRPd2RUTHZNUnlqNWpnMHl5M1JxaUxi?=
 =?utf-8?B?UnJLNG5uTU9sNEl6NldsU2FMRHp1TlpSdEdWeFZPM05lRjZ3bVc2RXd3RlU2?=
 =?utf-8?B?WkR1UmVmdk1IZVYyNFBnaFdCa2lab1ZIM1NGZzhvUTZaZ1UrNWUrQU9PTm5t?=
 =?utf-8?B?Y041WVdKN1phTEc1Y0txVjdHb1pCMDNILzZIWnZzZ2JwN2NaR0ViV09ZNm96?=
 =?utf-8?B?cFcvNXlmZEdYRjcxeGpRSjV4VjFNQXNSdUZaV2F3V1E5YUR4azJjMGN5TDV6?=
 =?utf-8?B?aDgrUFZ5OWRzZ25tRjhSSHNNZ256L0E5TjZuSklYWlZyVXlBVUtOdkduYUZP?=
 =?utf-8?B?TEs3STNnNVJJVjhtT2NXKzFmZEtITjZRT3gxa3F3N1dmWU4rZ1FJVWZ5VlZL?=
 =?utf-8?B?UmVkOGJVZm1ZbDBVU00xZlZVc09lOGRWTTVlOWZlMGx5bEJ4dGttSElTTG1W?=
 =?utf-8?B?ZzdSN1VwSHNHamxHaTdsZGwvbmRvL282UlI2ZERaNGU5TmplaU5PeWhqMHNL?=
 =?utf-8?B?THFJRUVQZEVEV3hCWHlYaTRSUUZGR2NQZ2tWZmdHRnFBY2FCd3FXakVCM3BE?=
 =?utf-8?B?Q0IvdEk2eEZ6aWwrTGdvZGJldjkyTk9abUc5NW11bGVEYVllWFgreVpTYWpo?=
 =?utf-8?B?WDRiYXhsbWtUUy93T3haZnJGOWtvT3VSZVIyVXM0ajBMcTc5MURzRCs5aDJm?=
 =?utf-8?B?QkVzajFQbm5ZeHYzekJhY24yb2kzS3JvSWRYbjNOUjRIVGEvbkkvSkFrbEgy?=
 =?utf-8?B?QVVCT1VESnV5bXoyeVJmU2lKZjdBRW9uZGNWNmlSQTZXdVZUdTdnWHlDZEs4?=
 =?utf-8?B?V2FENjh2cVZScXlCcEJSbmNGOWFkbmJoditTeVZ2OXpVWmtKTjJlWkxVYXNq?=
 =?utf-8?B?cG9NaG1jTWVJZWFQd1hadEc4emp4NGNveWZ2cXc0NzdaSTRqT29mUmkvYnkw?=
 =?utf-8?B?MDBWM2NGOGQrTFdibHdxVlpwKzBLb3lXRVhDYlhmS08vVS80dVdyR2c0TFJo?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F9313317E674B43A8D284A97EDF63E7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7c8ee5-d6b1-4b9e-a887-08dd776e6ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 13:57:11.3121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bMyCst0XMrkrFZ3Iwt4ouJJRvt8GpQJMJzrC6EkjzBVQ9xlKrnq7SAMaV/tH4OYZVdc5u7BvuB2KyMXkRJ4Sjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
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

TEdUTToNCg0KUmV2aWV3ZWQtYnk6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNv
bT4NCg0KT24gV2VkLCAyMDI1LTA0LTA5IGF0IDE0OjU1ICswMjAwLCBLYW1pbCBLb25pZWN6bnkg
d3JvdGU6DQo+IFdlIG9ic2VydmUgdGhhdCBzb21ldGltZXMgdGVzdHMgYXJlIHJlcG9ydGVkIGFz
IGluY29tcGxldGUgYWZ0ZXINCj4gYSBjcmFzaCBhbmQgdGhlcmUgYXJlIG1vcmUgc3VjaCBpbmNv
bXBsZXRlcyBiZWZvcmUgYSBvbmUgdGhhdA0KPiBjYXVzZWQgYWN0dWFsIGNyYXNoLiBJdCB0dXJu
cyBvdXQgdGhhdCB0aGVyZSB3ZXJlIG1pc3NpbmcgZW5kcw0KPiBvZiB0ZXN0cyBkbWVzZyBsb2dz
IGdhdGhlcmVkIGluIGEgdGVzdCBzdWJkaXJlY3RvcnkuIEFmdGVyIGNyb3NzDQo+IGNoZWNrcyB3
aXRoIGEgZ2xvYmFsIGRtZXNnIGxvZyBzYXZlZCBvdXRzaWRlIG9mIGlndF9ydW5uZXIsIGl0DQo+
IHNlZW1zIHRoYXQgYWxsIHRlc3RzIGJlZm9yZSBjcnVzaGVkIG9uZSBwcm9wZXJseSByZXBvcnRl
ZCBpdHMgZW5kDQo+IHRvIGtlcm5lbCBrbXNnLg0KPiANCj4gICBUcnkgdG8gcmVtZWRpYXRlIHRo
aXMgYW5kIGNyZWF0ZSBhZGRpdGlvbmFsIHN5bmNzIGZvciBsb2dzIGp1c3QNCj4gYWZ0ZXIgZW5k
IG9mIGV4ZWN1dGlvbiwgd2l0aCBhZGRpdGlvbmFsIHN5bmNzIGZvciBkaXJlY3Rvcmllcy4NCj4g
DQo+IENjOiBLcnp5c3p0b2YgS2FyYXMgPGtyenlzenRvZi5rYXJhc0BpbnRlbC5jb20+DQo+IENj
OiBQZXRlciBTZW5uYSBUc2NodWRpbiA8cGV0ZXIuc2VubmFAbGludXguaW50ZWwuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRl
bC5jb20+DQo+IC0tLQ0KPiAgcnVubmVyL2V4ZWN1dG9yLmMgfCAxNyArKysrKysrKysrKysrKysr
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9ydW5uZXIvZXhlY3V0b3IuYyBiL3J1bm5lci9leGVjdXRvci5jDQo+
IGluZGV4IDMwZTI0MjBhZi4uNjkyMjdhNWYyIDEwMDY0NA0KPiAtLS0gYS9ydW5uZXIvZXhlY3V0
b3IuYw0KPiArKysgYi9ydW5uZXIvZXhlY3V0b3IuYw0KPiBAQCAtNjE1LDYgKzYxNSwxNiBAQCB2
b2lkIGNsb3NlX291dHB1dHMoaW50ICpmZHMpDQo+ICAJfQ0KPiAgfQ0KPiAgDQo+ICt2b2lkIGZz
eW5jX291dHB1dHMoaW50ICpmZHMpDQo+ICt7DQo+ICsJaW50IGk7DQo+ICsNCj4gKwlmb3IgKGkg
PSAwOyBpIDwgX0ZfTEFTVDsgaSsrKSB7DQo+ICsJCWlmIChmZHNbaV0gPj0gMCkNCj4gKwkJCWZz
eW5jKGZkc1tpXSk7DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICBjb25zdCBjaGFyICpnZXRfb3V0X2Zp
bGVuYW1lKGludCBmaWQpDQo+ICB7DQo+ICAJaWYgKGZpZCA+PSAwICYmIGZpZCA8IF9GX0xBU1Qp
DQo+IEBAIC0xODcxLDE0ICsxODgxLDE5IEBAIHN0YXRpYyBpbnQgZXhlY3V0ZV9uZXh0X2VudHJ5
KHN0cnVjdCBleGVjdXRlX3N0YXRlICpzdGF0ZSwNCj4gIG91dF9rbXNnZmQ6DQo+ICAJY2xvc2Uo
a21zZ2ZkKTsNCj4gIG91dF9waXBlOg0KPiAtCWNsb3NlX291dHB1dHMob3V0cHV0cyk7DQo+ICAJ
Y2xvc2Uob3V0cGlwZVswXSk7DQo+ICAJY2xvc2Uob3V0cGlwZVsxXSk7DQo+ICAJY2xvc2UoZXJy
cGlwZVswXSk7DQo+ICAJY2xvc2UoZXJycGlwZVsxXSk7DQo+ICsJaWYgKHNldHRpbmdzLT5zeW5j
KQ0KPiArCQlmc3luY19vdXRwdXRzKG91dHB1dHMpOw0KPiAgCWNsb3NlX291dHB1dHMob3V0cHV0
cyk7DQo+ICBvdXRfZGlyZmQ6DQo+ICsJaWYgKHNldHRpbmdzLT5zeW5jKQ0KPiArCQlmc3luYyhk
aXJmZCk7DQo+ICAJY2xvc2UoZGlyZmQpOw0KPiArCWlmIChzZXR0aW5ncy0+c3luYykNCj4gKwkJ
ZnN5bmMocmVzZGlyZmQpOw0KPiAgDQo+ICAJcmV0dXJuIHJlc3VsdDsNCj4gIH0NCg==
