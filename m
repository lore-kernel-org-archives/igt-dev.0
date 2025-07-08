Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBE0C8303C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 09:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC69010E195;
	Tue,  8 Jul 2025 09:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LU84tuGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FB710E195
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751967743; x=1783503743;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fqn7ZIbJx1y1OO8j1iD8zRd3d43fi3JE5kWm1pSkDzk=;
 b=LU84tuGkntTuVdXJO6vroZ7596DSN5SH+DjgB+9d9Rx3oMOqIA8yCAce
 q/c2jHZihhup+8lsQwagXmdBoi+0lquB6dykBFb0yOmhqUT5pvwi9moEi
 yBvn1QIT9mnF2EasSqlNal4Zbiq/iH2/tg9MFlU1JKlRyQ3r4HaVOAUWE
 MYAyV/nzc0N67tYdn/JvWUn2AAaI0SfMzeNKlawdSSUDB3Gu1LaFTge8+
 x2nzseQ+OSWxG99xFqKOzemKWMiuGTv2uJM61odqRaPTR2VgeKLZFB4wB
 2DdSaesbClkbWNzw6AiDdpWEVZy3WW4lBCjBCjj1D5eitC5arIxSFffeg g==;
X-CSE-ConnectionGUID: 99YbdyyYR0uipCUJL3y7GQ==
X-CSE-MsgGUID: fJ+JpYUHRA+PUAwJY+HDPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="41822017"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="41822017"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 02:42:22 -0700
X-CSE-ConnectionGUID: RQm5DJ2LQ5qv90aMLJ2Tuw==
X-CSE-MsgGUID: MNemor2ER7WGCvHavZszmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="159716971"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 02:42:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 02:42:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 02:42:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.85)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 02:42:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eG5l3xGQgfngeWh7vUfcTzbjXCHJUrx+/4NhRWcRkSA/Iyfi8pMUOaNduduA9ekimo+yX2M3+g8WFGNOHbSHO8t3Xzlp+9ItKAF3hRRVCkkROJtykAjlAm8I+eQ3YK7lVW0BvC+ZjIqSPWrnjaW8L5k8YZI6MUkh25fs/ivkkjjv+E2jqQv8YiQJ1O4PgwTXV6IJFlLgTBLD+xooarrxdY+okeLXL6kyYPyxdtw6BTmYS1f82kDln7eyMVXiuM1Z6+Ua0UcmkWdQWjdKmqZ8jZf+EO9HqBvFIb1Zx+WPdK0UBvLvrNWclr2iX9LLT+YoVThK8zhUClqNSaKBnBcZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZFgxGrFxDPWGBiYux3BN2UcNONp1EmW2h64XfswRho=;
 b=yqeRSO8bKZ3C7LGRzN6X3Ro75/7rCMuJngUthW8Gd+ajAu/rHEuKOfaWejJoKh9uybWd5wIbFyck/eUHg79HtIcdvs6bcioP3b0hPD2T/J9aNqCdsmfVqI9t8x6b1fpT1zn397wuRMOcpysdy2dtuSut7kJ85pAcmn/UHDuUrbJUZqcu3ibD79ZVS2Ju6P+60uE7OdlZmNIcI1T90D/yvRyXreqreiWGcQ0Wu27S+nYV4npcdouVc+u/dhIk4hyw+c//3fE6idMLlIAJ9UJA5pWQ4CP16QR7eB4qsVpsQDkLXI6VE5bamywCuCBGHXJf2YQEEbbNONmY/SmsdM/o+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by DS7PR11MB6223.namprd11.prod.outlook.com (2603:10b6:8:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 09:42:12 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 09:42:12 +0000
Message-ID: <6a4fd544-e08c-46e6-8b7d-cd46026f64b3@intel.com>
Date: Tue, 8 Jul 2025 15:12:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_flip: Skip timestamp checks in Intel
 simulation environments
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Swati2" <swati2.sharma@intel.com>, "Golani, Mitulkumar Ajitkumar"
 <mitulkumar.ajitkumar.golani@intel.com>
References: <20250624085217.139873-1-ramanaidu.naladala@intel.com>
 <20250702130617.hm7eep3vtxcotnue@kamilkon-DESK.igk.intel.com>
 <BL1PR11MB5445ACF0EFC5E1DB709100F3E540A@BL1PR11MB5445.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <BL1PR11MB5445ACF0EFC5E1DB709100F3E540A@BL1PR11MB5445.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::36) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|DS7PR11MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: e458f301-1364-4dc7-b05f-08ddbe03b68a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1FKaEIrQ3ZTSVNjcHBKY2JSSG9hcHhLakJtREN0Q3BFVTVTeEowbWkyU1dz?=
 =?utf-8?B?RURDZ3QxU2sxSWxSV3N6TmFGOWdHM1Vlc1B6cXUyVE9VMFhaZXhQSlNjVTA4?=
 =?utf-8?B?dDFSZWkrRnpoR2xnVlA3eExQV25XaDNtNzlJdVhpblRTT1dRMytRRHBiV1R6?=
 =?utf-8?B?eVFlRW1KaFNjZTNZRjRBaU55SHE3czZObTNaQmc1MHRJMDA2TDcvSDNNVGM1?=
 =?utf-8?B?alBpSnhWYjRJSnhwb1o1Y3hpVnF5aHNqdzUrbzdhS0JVeWpSTDIzdTBoclps?=
 =?utf-8?B?SHd6SGNhVlI4eWEvNTNHNG1XYU8xbGE1TUUyVmYwRTcweTNYWmhYK0FRUTRa?=
 =?utf-8?B?N0JSTlFhaU1pU0FMNVRQMkQwVFBIbndGUldkMU1zOVdJMFo2dDNrbWRGalVC?=
 =?utf-8?B?ZWtjMkxhZ2kwRUR4VjhicTFzUDVuSWNZQ0gzNERWQ1Y0UlB2RERJU011U3Ev?=
 =?utf-8?B?WXFBTDU4enN0QjltdHE1dEZRWVUxdnhsZWk0alJXVlRtZGxrMHA5M0UvQmZa?=
 =?utf-8?B?VWNYRTJxUUVrY1JMc2NTL1dpYUFMcWpyWW5odng1QW9DSXJIeHpTMGd1NGJ1?=
 =?utf-8?B?RzhJQVhNd3dnaFhPNVEzNWoyVXowNnNpRlN3bE9hT01aaU8ycnNHa0VGRzcy?=
 =?utf-8?B?UFp4U21CckMzaHVMMUxQbUpsTUNsOFQ2QlBLck5aaktxV2o2ZGtDdW5xd3d4?=
 =?utf-8?B?UGhPaUZ6RVVXMmNYM01qdkFWNTRoUHYxcHBSQ2lxQzF4eHJXSWVMU1hoT0k4?=
 =?utf-8?B?aW40THFLaW0ycDNrblJLc2I4V1B5YnFidU5qaW5ObVpvNm5WdzVUYm10d3V3?=
 =?utf-8?B?c1V0V0d2SmNnZk1GR0t6Vzh2MzVTVytiRmx3NW9kaXlsYVBPdDI5WE9FQnhp?=
 =?utf-8?B?Y2hpWDZSalN6WmFNclJQZlE3eXYwOHBDTjB1WHBoVGhma1dsQlFXWEVpdUR5?=
 =?utf-8?B?U25EZFZBdHF5VzZZOXl3S3kxa0lFcDlPWEZvTjhLUVl4b3BweWlUelZpdnBp?=
 =?utf-8?B?THFYRW9TV05DNktXZWtLWFBnSjUzeHRQc3BrRnhqd2Y0aDk2WXlYYytGd3hP?=
 =?utf-8?B?TGJ1dnc4TWRFaTRsZzlwd1BoQ0wyUXdRelBuakN2N0dRcnlmV3JJU3REUzQw?=
 =?utf-8?B?YWRGd3lZZ0NxYTF0T0p4QVJubUF0RnVQYUNkYlVCTGM1dDVsVEdEZjlFZzd4?=
 =?utf-8?B?d0VVOHE3OWVzbHI4bUY3elNPT3NyYmJvWnlQaVVsMHQwS0M0WWtLc1NpSUNv?=
 =?utf-8?B?eHcxbUIxSDFTWEErdUlIMVZHNjVWVEtEaEQrd0NMTXZOQWNJMW1XdW1TWGJR?=
 =?utf-8?B?MkpTMXNTTm4vWWY0YldObER4T1BGNVpkTVNZM3E5S1ptWExBV1VmcEx0SVBs?=
 =?utf-8?B?YWg4NUd5enBsenhremlKczE2S2l1MVNFTWNFejB5M0J2Q1A3OUIwNS9lSVhn?=
 =?utf-8?B?c0x3R1Y1UHM3cDB5TE9xUVdvbmJVcjE2UFFDT1hVQTAwR09DN0FNZTFIb3ZS?=
 =?utf-8?B?dXBnVWlaYjlsaXBvNUYvQlM5M25qRUNlZ2hRUnRHNEFkUFRjZlUxbHVZck9x?=
 =?utf-8?B?cFE5Zm1EK29rdlV5cmVlUTlPMzFzN2s0ZS94dVNaVFk4ZlFZWlJyUEpGM3hz?=
 =?utf-8?B?bDBQWnVvRGdFcDJYWHExMHMrTXpRWnBTeEIzTWU5R0VwdGcxTFB0U3h3R1or?=
 =?utf-8?B?ekZ3R3FSNmoyZlpPSksyakxoTWNJWDIvR2lWQnV3Ty96bVNiWWY0ZWZibUNJ?=
 =?utf-8?B?NTZPMXBKL2JST2ZSMTh0eE5FMEt6WUFXeitLNG9mZXZ1VWlUc0tHWG92Q1FO?=
 =?utf-8?B?ckF4WXVaR0lvVi9PWEpZSXFaNW9SR1VkbmNIRDBJazROSjBZeFp2YnJZY2la?=
 =?utf-8?B?dG1QWkpVdUEvMWJ5VnZ1WkRFUS9Jdkw2M2FuTFNGNW52eExBWVUxUWVpY0VC?=
 =?utf-8?Q?WBDG1U/vwJ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkkvUUdIQkcvc3dqRUNyaEhsNjdRZ2JGdjgxdklybHRYTUYwUG51VytuNlFD?=
 =?utf-8?B?MDRtaHpKdGJDM2dpKzZ2NGVTYVJLbTBSU1FiVXJTUDVkTnFuQWI3eFBFN1NH?=
 =?utf-8?B?V3ErVTZqc3BTUWpDRllkdHNtcC9zSnY1QzkxaFZpZldpVURyczBYT21rZmJD?=
 =?utf-8?B?bi9BeVlQWHpSOUdkb3ZaL3Vhai91RGU0SFBxNThDaStiWmw5VGRuZU1kby9i?=
 =?utf-8?B?NXV1elU3MGhIYnZMQUt2Yjc1YmZKWTJTNHgwa21TWTJ1K1RzNmExakw2Wjd1?=
 =?utf-8?B?ajFlVDBmVEs5ZDc1T3RaNDFJRmpYT0N4dGIwSTk4TEdWTDJyelNzbUt1bENI?=
 =?utf-8?B?RENlTGIvbHM2dHdCVEZKR3lpeWRzUUVVTFJacENRcm9XaDc5dnFJelVzcEF2?=
 =?utf-8?B?Qm9ZTC8xb3hGYkFRMVV6YjBvdWYxTXcyVzEzc2l2SFA5MDJLdUlpSE5QcWdZ?=
 =?utf-8?B?RUZ5SHAwM25pTTZHc2w2aDdIWjhCL0VQZ3d3S015QTM5NzN2M0c0R3ZXdE5Z?=
 =?utf-8?B?V3hManR5dUlSQmsxYldyM2RHV21ET3FadWtkTkZiRzdHSFl2QTZBMWk4d1hu?=
 =?utf-8?B?M2VsQTNvNUNUM01ZdStzRU10QzlDZ29EYmhrYWFrSDNtYTQ0dzZPNGpkUGVJ?=
 =?utf-8?B?NVdKOXhmZERmcUtzN1o2REU5ZFlCcWt6dk9jMS9BeExaeU14SFJoRWkwc0xI?=
 =?utf-8?B?UEtFWHBuSElVQkU0Z3U3L2NuUWliQWNFdkVyYlRlZlBJQ3VRcWJGaXpnb0lu?=
 =?utf-8?B?cURyUlV0M3NRQkxrYm1CZ21QVFFoTEVKbkU3ZnhpR1ZONTF3VGtBSDYrKzlT?=
 =?utf-8?B?UUd1TnZYd3FSRmEvYmxxOHU2b2NQOWUzYXVKbEJGTS9ReVdIQlo2RWQ0aCtH?=
 =?utf-8?B?STlNcUVHL0t1b1FoOHpKNFROaTBHRnBQSW03UlE5ODFiZzBLbFh6RXhLclo5?=
 =?utf-8?B?U2JJT1NZMWJQYjN1TFRESHgrUGVlaE16clA1MmlTUERwWk9LdTZWOUpiV09Q?=
 =?utf-8?B?YW50bW5kb0VqbEFyZ2ZGVCtueklKYXZmQUVobTkyWm5xc3N2R2wzbFdkTlNh?=
 =?utf-8?B?dkEvaG0xYjhlcng1L253SUNLaGdLTm1rY0R1N24vZFVDVmdqa1czODMzc09F?=
 =?utf-8?B?dmZqLzNkK0NFMkNPQ1ZKZk43M3BXczRBODhQdkl5TVg3WXNpZndmVEZqRE1y?=
 =?utf-8?B?NFFySzY1bmhxZkQyUllhazhwempQVnNlSVFDUGZOWWM2SzhwTmhobHZ3UGRh?=
 =?utf-8?B?a1ExUTZKRHhXUDlqSHZnQlp0VGdKSkVSdEIxN2tHdmZyY3g3dlljM0txY2x4?=
 =?utf-8?B?U2lpN3kwRTBDVyszMjRRcS9CNGRJcjExVnNGV1lNa0JyWGR2dnRxaHYrU1NM?=
 =?utf-8?B?K1ExMGJHemRiSHhzN251S3ZhL0VvMXJLdTRRc0U5TFBGTzJXamZ5cml2dTZj?=
 =?utf-8?B?MFBwcTJYT1I3SUFNYmJlRWVYd1BGN1kzM2VWOEZQL1hhb1pVZWNLYUNCUko3?=
 =?utf-8?B?TSt3ck5sNEh3TStiVUh6MnA0a3B2K0lyeWREQ0V4WTk3L0xtV2JLQ2tvMFM5?=
 =?utf-8?B?Vy9wRFRjYVBUYnJEbVpvS0c1SkczWEFFVTVVWWFURnQraWxTY3ZIaWpGQU14?=
 =?utf-8?B?RWRsaGsranRCUnhKSjVMVkZvdWNWd01hemNMa0k2WlZKUThuMVJxNnZhb2ZV?=
 =?utf-8?B?OXc4NXJ6NjRqVmdjSndzRGFjUUpEWlU1SEtGV29UNXVFeExjRHZyYzh2Rytr?=
 =?utf-8?B?QzU2UWNQQWxCQWRWVWNSc3VBbWVUcUVJTGFMeFVPOWRUT3BxUkpRaXVrd0tS?=
 =?utf-8?B?VmUrelBaSjFaZURsc3gyU1krNklzSEVlTXpPZ2t2UEpaZnBvcnVQV2k2Yk9k?=
 =?utf-8?B?ZllsZTRrTGZoTnROb3NHb3dVY2taekxGN3NkRENSK1dDRVBBU0VQYmxQYmJm?=
 =?utf-8?B?bUhmTFF1WVludG9iTVlPUkdXSE03ZlF1UmhlMWpwa2s2eFNCOFNpTWRYcG5O?=
 =?utf-8?B?VlBxazF1dnU4elJ5WGRLc2dWY0dWendwV2I4SU9oNXVzT29EQ3Nha1dWc3VC?=
 =?utf-8?B?UjF1ZHZjOHFVQVN2emNaRUNyc25FbGtIMXh3UWh2NU8vQ082SFZ2SDNkeDZW?=
 =?utf-8?B?dHMxcnN4VWV2MmVnd2ZDRHZrTFlzV0g3Mzh5dGFVQkpEZmZIVWdVS29VODVR?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e458f301-1364-4dc7-b05f-08ddbe03b68a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 09:42:12.5918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joj+xfVp4iUzNarrkqN/QYDIEwCk5Yb5SD+p98lRhHsudhKY7g7ptFb5KAqxAW/P6q+5sEbiGxCUaxPqbOi21Lc1ItS2eME4JBBx34zBc3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6223
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

Hi Jonathan,

Thanks for reviewing the patch.

On 7/2/2025 10:13 PM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil Konieczny
> Sent: Wednesday, July 2, 2025 6:06 AM
> To: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Sharma, Swati2 <swati2.sharma@intel.com>; Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>
> Subject: Re: [PATCH i-g-t v1] tests/kms_flip: Skip timestamp checks in Intel simulation environments
>> Hi Naladala,
>> On 2025-06-24 at 14:22:17 +0530, Naladala Ramanaidu wrote:
>>> Bypass timestamp and sequence validations when INTEL_SIMULATION is
>>> active to accommodate non-deterministic timing in simulated test
>>> environments.
>>>
>>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>>> ---
>>>   tests/kms_flip.c | 14 +++++++++++++-
>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
>>> index 65016c66d..db7ced8aa 100755
>>> --- a/tests/kms_flip.c
>>> +++ b/tests/kms_flip.c
>>> @@ -318,7 +318,19 @@ static bool should_skip_ts_checks(void) {
>>>   	 * timestamp to drift with a relatively larger standard deviation over a large sample.
>>>   	 * As it's a known issue, skip any Timestamp or Sequence checks for MTK drivers.
>>>   	 */
>>> -	return is_mtk_device(drm_fd);
>>> +	if (is_mtk_device(drm_fd))
>>> +		return true;
>>> +
>>> +	/*
>>> +	 * In simulation environments, hardware behavior may not accurately reflect real-world
>>> +	 * timing characteristics. To avoid false negatives in tests due to simulated timing
>>> +	 * artifacts, skip timestamp and sequence checks when the INTEL_SIMULATION environment
>>> +	 * variable is set to a truthy value.
>>> +	 */
>>> +	if (igt_check_boolean_env_var("INTEL_SIMULATION", false))
>> Please use function: igt_run_in_simulation() so it will be:
>>
>> 	if (igt_run_in_simulation())
> I think we're looking for the opposite, actually:
The current condition is correct. As Kamil mentioned, this direction 
aligns better with the intended logic.
>
> """
> 	if (!igt_run_in_simulation())
> 		return true;
>
> 	return false;
> """
>
> Or, alternatively:
>
> """
> 	if (igt_run_in_simulation())
> 		return false;
>
> 	return true;
> """
>
> Though, at that point, I think we'd may as well just return the value directly:
>
> """
> 	return !igt_run_in_simulation();
> """
>
> -Jonathan Cavitt
>
>> Regards,
>> Kamil
>>
>>> +		return true;
>>> +
>>> +	return false;
>>>   }
>>>   
>>>   static bool vblank_dependence(int flags)
>>> -- 
>>> 2.43.0
>>>
