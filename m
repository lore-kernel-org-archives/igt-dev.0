Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E14D606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 05:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kcCMP1jR;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=nO5UpUQ/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0100B10E103;
	Wed, 18 Nov 2026 05:54:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B9410E103
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 05:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794981215; x=1826517215;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:mime-version;
 bh=vBdCCT7rnEczzqMKTQYfgPTZh7qFdtEhq5QH0ToFSdA=;
 b=kcCMP1jRUp+/Ef3e4awJ3m+fxn4CGJqmC0pEyT6BuM5hAsTouygPYAmu
 ZKUG5HH1iNntiCikIWywFDpTB3+W1HKoL8DBLwvEKMYWKhIiCVdwHSym+
 bwTaMZXItUMTwVTYuj1iTq2HAQ53eCbkaRP+db30FZNHXnFGWKhXpgHNR
 UMai0BOyAV18yUVt7liyKjO6WEgcyB1Pncn77sMgDpaPFNrvG8VHIHyw+
 EIaQMULMwRHQ/SPH3qKxUcevJ1/ZVTjMEK4+lFrj9Rv5gbN6fcUuC+phh
 t4rBK2WR3cb8g8PfOqLDcDVjLRIQs4t4gQaNo5mL4bHk4+l/ynxaAjhJB Q==;
X-CSE-ConnectionGUID: LgYI4/ASQ6qYS5kWEWSZLg==
X-CSE-MsgGUID: LR5ADGi/TqGL+XT/Sr4qjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3779551"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208,217";a="3779551"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 21:53:35 -0800
X-CSE-ConnectionGUID: twZZJzSyRymizOw0IWyYog==
X-CSE-MsgGUID: JLtjhpbYTE6AQlaIUiS5zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208,217";a="10286760"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 21:53:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 21:53:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 21:53:34 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.13)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 21:53:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7KuKB9JnnOBZ2hciDr4wqdbKeQ+g1y+uZ5USJNmZ1sJuPU0r3AMcYOlbMBa0wmzVwmD4GDqWmno2A0vkk8wIIQCdg+78DK2IzH6TFenIZDYZEWF1HoX6rlr4D9v4aKb4fuvyPCYXedKpW/BK0zz66v4sknWJ721x2kvurmjlzmspuFci36bXFG/ijJPTtbKSMYwur8V8lHYO9l7cA9cqu9QL/obo9zba+UqvHmfpSQP97WC4373Ui9qh/us2G7vykH2dDiHuyDaGppPPmUPjUL8hrizdekZ4zAmm/IKOIFEzSmzAGU7/EIqRbXPe90o7mgTZx+YtVuDY9F2jM7baw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egfudXXev+r3E9Jtk+WK1QdaTAMrr84Tlb44oSZjzlE=;
 b=xQRGwGOx2gtfEZlnPeBy7o1s7sl/rSJP8lZJWDZGzhK++LdYlO6RsqjCpSjHUTn+fxHDVTaDfJIl2xQC0iqfvQiIub0NUriJkRKOII/Pjf0ONN7jmrf4ftKQTYN8X0gntohOztm9MCjZumYik/Ljiq1eajA0ofyFtsPiBc3aj3UUm6yaTg5usBZPL2ftvJ+Nho1d+0ImTrG/XmPpVuWHBhdXWmquML7oyO/RByLGrGwqhI8b/BOr9VMZvRe/FLJbja9Rkb2m/Cw9li1pGTfgLow7inC+XT4gvDtkIRgNmTjLJ+47iBGdXj/zzU+5deTDLIuoZpqz+w3cc/1A8qsnxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egfudXXev+r3E9Jtk+WK1QdaTAMrr84Tlb44oSZjzlE=;
 b=nO5UpUQ/ys0UzdayEfHuEgsxuO19Vy1znjE/fHZjpyhMzCqAAYKslB/LgSAls6PbhCPBkqNDTbB2hGtSis6V8PADV5qSh9TGYBmBxMVBa47Y+zx7Jdl5Ba9vYj+7sSUmBz/eqyfIDhofWg9fkx1aMasB76TdENGpxXanvAFODqQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 05:53:31 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 05:53:31 +0000
Content-Type: multipart/alternative;
 boundary="------------rdZPCgqNPQSqqDnjlte0RGkc"
Message-ID: <65d8edc1-c825-4905-bcab-b5de69543065@intel.com>
Date: Wed, 18 Nov 2026 11:23:22 +0530
User-Agent: Mozilla Thunderbird
From: "Purkait, Soham" <soham.purkait@intel.com>
Subject: Re: [PATCH v3 1/4] tests/xe_err_injection: add CPER tracefs event
 format validation
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>, <sk.anirban@intel.com>
References: <20261116145410.1649875-1-ravi.kishore.koppuravuri@intel.com>
 <20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
In-Reply-To: <20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: MA5P287CA0249.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::15) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|MW4PR11MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: 003c7060-8b5d-448b-4888-08df45384630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|6133799003|8096899003|4143699003|11063799006|56012099006|261022113327099003|261026121527099003|261028144727099003|261026140227099003|10067099003|261021121427099003|261022105027099003|261009223027099003|261022075727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: cW0cOmdbBIS3vrR3XDx9dkowq3dR9Dd9RL1gMswKzfLxPM4pz3FLVpXe4v4b2qnVBqzvMYKn88rm7nkXb9Hc058H8s2OthovSmp3gEvPe/w9iys98ENArkharMmmxtCU4VJfksRHsj85Ud1k+zJ/7bjwtqLef+h6YugwYLzc1i68PXU0yYpDZCo1OtS7NHkzIqBv1JEPhKV9IhUHVwc9Bf/miICBktrUVvExwFpqUJaO6yimRHoHo6bgA2HNogqSn9f+s0LifUBZT84Xeyb3SfLZdDZzGTkhY5kC2aNSZlrbWZOx8dyaJwukyk0+CXcNBIdXKBmR6keH1bpD6lzZkuwfhNz0dOqRM3LCd73zo2SHTUtynbhHiIWleXAxLT96jzzm1JJ5zk8+7fKnFOtkhuiHnFIrXbkXQsrRsiN/JiK+twmMN/C52zDJZuRFTkPijxhRavmzFW5kalUXCz+FwKE+545aQz/sryEjl7sxFFDJ9iNbxyOd/00h5G93wvdfrsGl1dRrA1dwuYz5yhXBU5VU9EqLugep8uUQSRPgTeNxN2o3P0IsGvTaSEoYaTj/kOgiQqXTFhJcQMfsjn41DISAg2BIoonbCc3RLLe8NJMxZiQXtFXQaygvK5AiuRw5taEB7QVxgLI4R4dRtt7dS+jgVBniAdO2W8IB86Gkywo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(8096899003)(4143699003)(11063799006)(56012099006)(261022113327099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(261021121427099003)(261022105027099003)(261009223027099003)(261022075727099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHBEK1cvZUppelNqd2RZSUZ5MFM0NWRMVkpJMXpNRzg3eUlPUjBiU0tBQlJ6?=
 =?utf-8?B?Um16V1plOXZqVThMV0RRMElqMHMxKzRWOG1ONzBNdzY3OFlQUXp3RFRBZ2pQ?=
 =?utf-8?B?SW9xNjA1T2ZBK0FqbVZtaWdFS1VvQ05iQkdqV0RmR00ybkhXRWcvNlVTZ3N3?=
 =?utf-8?B?aVlCbDdqeStJUW5iU0kyc3R3dmdETko5U1B0bDVFQmYycTVvbUI3TGFiWVpr?=
 =?utf-8?B?Z0ZFNGdNUlZaaUdPb1drcGZJVnB3UzQvSEtnRi9SM1hzUWZiRjlaREpJb2dk?=
 =?utf-8?B?emVCN0h4cktxbEJLVXU5NlhheE5wcG9pcWF4WTcrWVlpamtxZ0JGbWhxQ2Z1?=
 =?utf-8?B?TnJDRzhQeFYxRzQrR0hKYVBqYVVGenBaSUpYTGpTTmdyRHVmVSt5Ry93UlN1?=
 =?utf-8?B?N0lmZDZhQmJEcXVwTkpjMVpRT2FJQnBWamY2MUFyaERBd3lMa3pSK3lDcllV?=
 =?utf-8?B?K0RtOTcyUENRNHZzU0pBcG0yVGRaUDRxdS83QVNIZ011cG4yWUpzd1gyMjNk?=
 =?utf-8?B?YmxaSTUyTmh0ejIySTh1NkhaZEY0MngwV25QMFoyb1k1SE1OdllxWjNrQjdn?=
 =?utf-8?B?RytSa3BMUnZnZENMWWQrbUNlNWlOQjFkbmpFUjRFZTJrM0dRTWZ0bGNqUzBk?=
 =?utf-8?B?SVVBUmQ5MlNtUG0yRlJvdDJnOGR0UUc0L0Exdm5TWVJ2SU9WNENwaUVic1V2?=
 =?utf-8?B?bHFYaHBaeXo0dkdpNFgyYXJFbHRURFFLa1pxbDBvbFpWS1RQU2FBWVdYTjZB?=
 =?utf-8?B?eEljU2NuemNDeHFFUlBnQlJhQVBWU01VM0xRRDdES3VxdERnOWs1RGxpdWdj?=
 =?utf-8?B?d2tDbENFODEyeUxZYTFnWU1pU0RUaHZEZ2VwREVWcjFiVFhzT3lqZnZFdkNQ?=
 =?utf-8?B?c0ZEYmJuTDhJMTJLNUE0eVRjendmdy84NldlVjBKeXhadmJ5OVBFVjhyZ1lu?=
 =?utf-8?B?TzlKMWVvUld5ZXpPMzJMK0JBUUoyTjZKUS92QzJvelQ5b1ZSUzJaekFJV1Vj?=
 =?utf-8?B?WDlkaG02NDY0YjdzS1dHenE0YkVjY1lQcFN5Wnl2b1VMTTZuK2EvNmMxV000?=
 =?utf-8?B?SVlMT0VHK01xd09ENWxLc1RoQnRvd0hIdVpaeGY0TTE3VE8xaGI4aVlLRjUx?=
 =?utf-8?B?WjlrTWJTMS9RYk5UZnpyTGkzZEgxeWE3R014VE1UdHhiYXlZaDFRQ2YxRnFh?=
 =?utf-8?B?YUhPMWFYaTdNaEYzdlpMaVV4M3NMVUZHWmJpMnp2OHhhVUt4MU15NjRWWDRZ?=
 =?utf-8?B?VFRmUjJ3TTZEelRNUXhyVmV3U05KRG52Y3hOUmk4TzRqMjZnVDV6eEV0VXNz?=
 =?utf-8?B?MlhZc2JqUXQyUkhTcE5pSHBpVlhlREdHeklUMEIvWFplSUFOSkZGbmZNbGcr?=
 =?utf-8?B?YmJGUU02ZjF4dlZJNTNhcXdEL2drTWkvK1pnZHdLeE04ZHRZT3FYYk1JamNE?=
 =?utf-8?B?aXhTcFl2bHhOT2JWdzMvZG5EVGxub2Jiak0xQ1hGNlZKSWdzdXdqUWFLYnhF?=
 =?utf-8?B?LzdhdS9sT3dFQUcvMHZWaEw4YTdNb0I4V0luZjg4U1crUXpqRVdHVGx0b1Zo?=
 =?utf-8?B?NTNnNXRFRUROQXpvdE41bVBMb2ZlRHFZZnBscERVSE9MdWFGQUgxS2lTMlFO?=
 =?utf-8?B?TXZEemJRdDBucGlPWGtmK2xrL0gvNm0vNG16eGZ3UnZDK3RBc1p5QTdETGFB?=
 =?utf-8?B?MU8xU1N1V3NacmF1M3krWXZGbklrb2VmMjBuSC96QlcrUkU3Lzd4RFlVOVd3?=
 =?utf-8?B?ZjI0cThqZlU1RTF3SFZpaHI5RktHdDB2akhmZGpUSlZ2R245VWhOV0JsWVhZ?=
 =?utf-8?B?ODZKay8yb0lVWTRId01XVWx5SmFrMnRTVU8vamZsL1hZZ2QwaTBKUHFDWHp5?=
 =?utf-8?B?UEhjbkc2N0ZvQkRLS0E4QjBxaTBNUGRYcjJPbGFWaWcyZzkxN0Z3b0xiNDhW?=
 =?utf-8?B?WElBV0NjdDRvYmZFK0ZTempUbU1YdGdzZ0I1SFZRVFlCUG1RcDZLN3RRc2da?=
 =?utf-8?B?Wmp2RTgxNXNpb3FLb1VlZStqTDMxVTkxaTNvMUFldDVmTXpUMnlwa0FVZGI3?=
 =?utf-8?B?SHl3OEg3YkhtRDBFSUpZMFp3bHRIaVpyTUR3bXYvZElCZmtIdFU3ZFlKUkph?=
 =?utf-8?B?TGZ0VHkrZEZsOW1GYVptcURGN3pmS2RRSUVIOHpFTS8yRUhRek10RjJlVDd2?=
 =?utf-8?B?bjNFMGViT3I4MklUYlFqZjhUOFdBaXEvc0RuQXErNEhCMWJUVWplSHRUeEc1?=
 =?utf-8?B?elBqMjBLK3hGUExjWnZwZ1JuZmhiNlk0bXNjYS9YNW9TakwwRUtXZ0hmTDJ6?=
 =?utf-8?B?NUtST0ZQS1o0dTVHSVB3TzFONFIvUWhyNWpwdGNXdG5BbHhFUkR3aFVldlJ2?=
 =?utf-8?Q?XwC5Uzl7F8PmXZnY=3D?=
X-Exchange-RoutingPolicyChecked: 2/z6jTZKpscJO6bhBkiXPsUaClNHgRXYhctD83fMCgCLZh9OqK5T1bS5yOQaQz/IpkGH/QSmIF0gBaqmfeEJu4oEDlGJWM9OuR+zDOB5n41/piUUW99nPwe9eSh/ynKt3lyRgEZTpz4k7PTzBlbmVw/7OuNCTSsY5GzvdYYnH4x7PpeDcZwXZARClIO6yI5PpFAbjvLQcxH48NuVwHWxffs97jkHJyBsTkKrJfEeaplM+LK+IBnFLdzSn463wzXf5MydggqlMTxb54x0LLlfEb0tkbWSYrUKt422QEkQK0h3CZ1CuCBY7HtTFPDYpuWV2iIiAmSRmPOdReBpCKLLzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 003c7060-8b5d-448b-4888-08df45384630
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 05:53:31.1240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGHHvfpLJWjQLQN5w6xD1lH3WqQjBVZ3A7acZdYezvQfKJoP0F713BiAG+Y1GmlIIe4XfO39/ttk2OUhuMJ+gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------rdZPCgqNPQSqqDnjlte0RGkc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ravi,

On 16-11-2026 20:24, Ravi Kishore Koppuravuri wrote:
> Add CPER tracefs paths and verify that the existence of xe_error_cper
> event and cper_on_query sysfs entry, exposes the expected format fields,
> and supports enable/disable through tracefs and sysfs.
>
> Signed-off-by: Ravi Kishore Koppuravuri<ravi.kishore.koppuravuri@intel.com>
> ---
> v3:
>    - Introduced validation of configuring cper_on_query sysfs entry for CPER records
> ---
>   tests/intel/xe_cper.h          |  21 ++++
>   tests/intel/xe_err_injection.c | 180 +++++++++++++++++++++++++++++++++
>   2 files changed, 201 insertions(+)
>   create mode 100644 tests/intel/xe_cper.h
>
> diff --git a/tests/intel/xe_cper.h b/tests/intel/xe_cper.h
> new file mode 100644
> index 000000000..706c63715
> --- /dev/null
> +++ b/tests/intel/xe_cper.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef XE_CPER_H
> +#define XE_CPER_H
> +
> +/* tracefs paths */
> +#define TRACEFS_ROOT		"/sys/kernel/tracing"
> +#define XE_CPER_EVENT_DIR	TRACEFS_ROOT "/events/xe/xe_error_cper"
> +#define XE_CPER_ENABLE		XE_CPER_EVENT_DIR "/enable"
> +#define XE_CPER_FORMAT		XE_CPER_EVENT_DIR "/format"
> +#define TRACEFS_TRACE_PIPE	TRACEFS_ROOT "/trace_pipe"
> +#define TRACEFS_TRACE		TRACEFS_ROOT "/trace"
> +#define TRACEFS_TRACE_CLEAR	TRACEFS_ROOT "/trace"
TRACEFS_TRACE_CLEAR is identical to TRACEFS_TRACE. Could one macro be 
dropped.
> +
> +/* Timeout waiting for a trace event to appear (seconds) */
> +#define CPER_EVENT_TIMEOUT_SEC		10
The timeout is not used in this patch. Is it needed here, or could it be 
added together with its first user?
> +
> +#endif /* XE_CPER_H */
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index 74ae9b243..6efe092c7 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -18,13 +18,17 @@
>   #include <string.h>
>   #include <time.h>
>   #include <unistd.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
>   
>   #include "igt.h"
> +#include "lib/igt_device.h"
>   #include "lib/igt_drm_ras_nl.h"
>   #include "lib/intel_chipset.h"
>   #include "lib/intel_reg.h"
>   #include "lib/intel_compute.h"
>   
> +#include "xe_cper.h"
>   #include "xe_drm.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_mmio.h"
> @@ -531,6 +535,163 @@ static void require_cri_gpu(int fd)
>   		      "This test requires CRI GPU, but found device ID 0x%04x\n", dev_id);
>   }
>   
> +/* ====================== CPER helper functions ====================== */
> +/**
> + * is_dir_exist - check whether the given directory path exists
> + */
> +static bool is_dir_exist(const char *path)
Could this function be replaced with access(). e.g. 
access(XE_CPER_EVENT_DIR, F_OK)?
> +{
> +	struct stat st;
> +
> +	return stat(path, &st) == 0 && S_ISDIR(st.st_mode);
> +}
> +
> +/**
> + * configure_xe_cper_tracefs - enable / disable the xe_error_cper trace event
> + */
> +static void configure_xe_cper_tracefs(bool state)
> +{
> +	int fd;
> +	const char val = state ? '1' : '0';
Inverted xmas tree.
> +
> +	fd = open(XE_CPER_ENABLE, O_WRONLY);
> +	igt_assert_f(fd >= 0, "Cannot open %s: %s\n", XE_CPER_ENABLE,
> +		     strerror(errno));
> +	igt_assert_eq(write(fd, &val, 1), 1);
This gives a generic failure message. Also, fd leaks when the assert fails.
> +	igt_info("Trace event %sabled: %s\n", state ? "en" : "dis", XE_CPER_ENABLE);
> +	close(fd);
> +}
> +
> +/**
> + * tracefs_clear_trace - wipe the trace ring buffer
> + */
> +static void tracefs_clear_trace(void)
> +{
> +	int fd = open(TRACEFS_TRACE_CLEAR, O_WRONLY | O_TRUNC);
> +
> +	if (fd >= 0)
> +		close(fd);
> +
> +	igt_info("Cleared trace buffer: %s\n", TRACEFS_TRACE_CLEAR);
"Cleared" is printed even when open() fails. Could an error message be 
added for the failure case?
> +}
> +
> +/**
> + * configure_cper_on_query_entry - enable or disable the device's cper_on_query sysfs attribute
> + */
> +static void configure_cper_on_query_entry(int drm_fd, bool state)
Could the name be made consistent with configure_xe_cper_tracefs() ?
> +{
> +	char pci_slot_name[NAME_MAX];
> +	char path[PATH_MAX];
> +	const char config_val = state ? '1' : '0';
config_val and val in configure_xe_cper_tracefs() refer to the same 
concept. Could one term be used in both places?
> +	int fd;
Inverted xmas tree.
> +
> +	igt_device_get_pci_slot_name(drm_fd, pci_slot_name);
> +	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/cper_on_query", pci_slot_name);
> +
> +	fd = open(path, O_WRONLY);
Does the fd leaks when the assert fails ?
> +	igt_assert_f(fd >= 0, "Cannot open %s: %s\n", path, strerror(errno));
> +	igt_assert_f(write(fd, &config_val, 1) == 1,
> +		     "Failed to %s cper_on_query at %s: %s\n",
> +		     state ? "enable" : "disable", path, strerror(errno));
> +	close(fd);
> +
> +	igt_info("%sabled: %s\n", state ? "en" : "dis", path);
> +}
> +
> +/**
> + * SUBTEST: cper-validate-tracefs-event
> + * Description: Verify that the xe_error_cper tracefs event exists under
> + * /sys/kernel/debug/tracing/events/xe/xe_error_cper/, that its 'format'
The path does not match with the TRACEFS_ROOT.
> + * file contains the expected fields (dev, severity, platform_id, fru_id,
> + * intel_err_hdr_raw, cper_len, cper_raw), and that 'enable' can be toggled.
> + */
Could it be shortened? Also, the listed fields (severity, 
intel_err_hdr_raw, cper_raw) differ from the ones checked in code (sev, 
ihdr_raw, cper). Could the terminology be aligned?
> +
> +/**
> + * test_cper_validate_tracefs_event - verify the tracefs event directory and format
> + * file contain the expected field names emitted by the xe_error_cper
> + * TRACE_EVENT definition (TP_STRUCT__entry fields).
> + */
> +static void test_cper_validate_tracefs_event(int drm_fd)
> +{
> +	int fd;
> +	char buf[4096] = { 0 };
> +	char pci_slot_name[NAME_MAX];
> +	char cper_on_query_path[PATH_MAX];
> +	ssize_t n;
Inverted xmas tree. Also, fd, buf and n are too generic names.
> +
> +	igt_require_f(is_dir_exist(XE_CPER_EVENT_DIR),
Use access(XE_CPER_EVENT_DIR, F_OK).
> +		      "xe_error_cper trace event not present at %s\n"
> +		      "(kernel xe driver may not have CONFIG_TRACING enabled)\n",
> +		      XE_CPER_EVENT_DIR);
> +
> +	fd = open(XE_CPER_FORMAT, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Cannot open %s: %s\n", XE_CPER_FORMAT,
> +		     strerror(errno));
> +	n = read(fd, buf, sizeof(buf) - 1);
> +	close(fd);
> +	igt_assert_f(n > 0, "Empty format file at %s\n", XE_CPER_FORMAT);
> +	buf[n] = '\0';
> +
> +	/* Verify that all TP_STRUCT__entry fields are present in the format */
> +	igt_assert_f(strstr(buf, "dev"),
> +		     "Missing 'dev' field in xe_error_cper format\n");
> +	igt_assert_f(strstr(buf, "platform_id"),
> +		     "Missing 'platform_id' field in xe_error_cper format\n");
> +	igt_assert_f(strstr(buf, "fru_id"),
> +		     "Missing 'fru_id' field in xe_error_cper format\n");
> +	igt_assert_f(strstr(buf, "sev"),
> +		     "Missing 'sev' field in xe_error_cper format\n");
> +	igt_assert_f(strstr(buf, "ihdr_raw"),
> +		     "Missing 'ihdr_raw' field in xe_error_cper format\n");
> +	igt_assert_f(strstr(buf, "cper_len"),
> +		     "Missing 'cper_len' field in xe_error_cper format\n");
> +	igt_assert_f(strstr(buf, "cper"),
> +		     "Missing 'cper' dynamic array field in xe_error_cper format\n");
The repeated assert pattern could be a loop over a small field list or a 
helper. Also, strstr(buf, "dev") and "cper" are substrings of other 
fields (cper_len, device), so the check can pass without the field being 
present.
> +
> +	igt_info("xe_error_cper tracefs format verified:\n"
> +		     "Below is the content of %s:\n"
> +		     "=========================================\n"
> +		     "%s"
> +		     "=========================================\n"
> +		     "\n", XE_CPER_FORMAT, buf);
> +
> +	/* Verify enable/disable toggle */
> +	configure_xe_cper_tracefs(true);
> +	fd = open(XE_CPER_ENABLE, O_RDONLY);
> +	igt_assert(fd >= 0);
> +	n = read(fd, buf, 2);
This read/check sequence is repeated four times, and n is never checked. 
Could a helper be added? A failed read() would otherwise leave stale 
buf[0] from the previous step.
> +	close(fd);
> +	igt_assert_eq(buf[0], '1');
> +
> +	configure_xe_cper_tracefs(false);
If an assert fails between enable and disable, the trace event and 
cper_on_query remain enabled. Is exit handler required ?
> +	fd = open(XE_CPER_ENABLE, O_RDONLY);
> +	igt_assert(fd >= 0);
> +	n = read(fd, buf, 2);
> +	close(fd);
> +	igt_assert_eq(buf[0], '0');
> +
> +	/* Verify cper_on_query sysfs attribute can be toggled */
> +	igt_device_get_pci_slot_name(drm_fd, pci_slot_name);
> +	snprintf(cper_on_query_path, sizeof(cper_on_query_path),
> +		 "/sys/bus/pci/devices/%s/cper_on_query", pci_slot_name);
The same path is already built again in configure_cper_on_query_entry(). 
A shared helper could be used to avoid the repeated logic.
> +	igt_require_f(access(cper_on_query_path, F_OK) == 0,
> +		      "cper_on_query sysfs attribute not present at %s\n", cper_on_query_path);
The skip check comes after the tracefs toggling has already been done. 
Could all igt_require checks be placed at the start of the test?
> +
> +	configure_cper_on_query_entry(drm_fd, true);
> +	fd = open(cper_on_query_path, O_RDONLY);
> +	igt_assert(fd >= 0);
The generic assert gives no hint of which file failed to open. Could 
igt_assert_f() with the path and strerror(errno) be used?
> +	n = read(fd, buf, 2);
> +	close(fd);
> +	igt_assert_eq(buf[0], '1');
> +
> +	configure_cper_on_query_entry(drm_fd, false);
> +	fd = open(cper_on_query_path, O_RDONLY);
> +	igt_assert(fd >= 0);
> +	n = read(fd, buf, 2);
> +	close(fd);
> +	igt_assert_eq(buf[0], '0');
> +}
> +
>   enum xe_err_injection_type {
>   	XE_CORE_COMPUTE_UNCORR_ERR_INJ,
>   	XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
> @@ -562,6 +723,21 @@ static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *m
>   	}
>   }
>   
> +enum xe_cper_test {
> +	XE_CPER_VALIDATE_TRACEFS_EVENT,
> +};
> +
> +static void run_cper_test(enum xe_cper_test test, int fd)
> +{
> +	switch (test) {
> +	case XE_CPER_VALIDATE_TRACEFS_EVENT:
> +		test_cper_validate_tracefs_event(fd);
> +		break;
> +	default:
> +		igt_info("Invalid CPER test specified\n");
> +	}
> +}
> +
>   int igt_main()
>   {
>   	int fd;
> @@ -608,6 +784,10 @@ int igt_main()
>   	igt_subtest("inject_core_compute_corr_error_once")
>   		inject_error(XE_CORE_COMPUTE_CORR_ERR_INJ_ONCE, &mmio, fd);
>   
> +	igt_describe("Verify the xe_error_cper tracefs event exists and has the expected format.");
The describe text is not the same as the SUBTEST Description: block, and 
neither is the shortest form.
> +	igt_subtest("cper-validate-tracefs-event")

Either use underscores or hyphen not both for all the tests.

Regards,
Soham
> +		run_cper_test(XE_CPER_VALIDATE_TRACEFS_EVENT, fd);
> +
>   	igt_fixture() {
>   		xe_mmio_access_fini(&mmio);
>   		drm_close_driver(fd);
--------------rdZPCgqNPQSqqDnjlte0RGkc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Ravi,</p>
    <div class="moz-cite-prefix">On 16-11-2026 20:24, Ravi Kishore
      Koppuravuri wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">Add CPER tracefs paths and verify that the existence of xe_error_cper
event and cper_on_query sysfs entry, exposes the expected format fields,
and supports enable/disable through tracefs and sysfs.

Signed-off-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a>
---
v3:
  - Introduced validation of configuring cper_on_query sysfs entry for CPER records
---
 tests/intel/xe_cper.h          |  21 ++++
 tests/intel/xe_err_injection.c | 180 +++++++++++++++++++++++++++++++++
 2 files changed, 201 insertions(+)
 create mode 100644 tests/intel/xe_cper.h

diff --git a/tests/intel/xe_cper.h b/tests/intel/xe_cper.h
new file mode 100644
index 000000000..706c63715
--- /dev/null
+++ b/tests/intel/xe_cper.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef XE_CPER_H
+#define XE_CPER_H
+
+/* tracefs paths */
+#define TRACEFS_ROOT		&quot;/sys/kernel/tracing&quot;
+#define XE_CPER_EVENT_DIR	TRACEFS_ROOT &quot;/events/xe/xe_error_cper&quot;
+#define XE_CPER_ENABLE		XE_CPER_EVENT_DIR &quot;/enable&quot;
+#define XE_CPER_FORMAT		XE_CPER_EVENT_DIR &quot;/format&quot;
+#define TRACEFS_TRACE_PIPE	TRACEFS_ROOT &quot;/trace_pipe&quot;
+#define TRACEFS_TRACE		TRACEFS_ROOT &quot;/trace&quot;
+#define TRACEFS_TRACE_CLEAR	TRACEFS_ROOT &quot;/trace&quot;</pre>
    </blockquote>
    TRACEFS_TRACE_CLEAR is identical to TRACEFS_TRACE. Could one macro
    be dropped.
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">+
+/* Timeout waiting for a trace event to appear (seconds) */
+#define CPER_EVENT_TIMEOUT_SEC		10</pre>
    </blockquote>
    The timeout is not used in this patch. Is it needed here, or could
    it be added together with its first user?
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">+
+#endif /* XE_CPER_H */
diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 74ae9b243..6efe092c7 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -18,13 +18,17 @@
 #include &lt;string.h&gt;
 #include &lt;time.h&gt;
 #include &lt;unistd.h&gt;
+#include &lt;sys/types.h&gt;
+#include &lt;sys/stat.h&gt;
 
 #include &quot;igt.h&quot;
+#include &quot;lib/igt_device.h&quot;
 #include &quot;lib/igt_drm_ras_nl.h&quot;
 #include &quot;lib/intel_chipset.h&quot;
 #include &quot;lib/intel_reg.h&quot;
 #include &quot;lib/intel_compute.h&quot;
 
+#include &quot;xe_cper.h&quot;
 #include &quot;xe_drm.h&quot;
 #include &quot;xe/xe_ioctl.h&quot;
 #include &quot;xe/xe_mmio.h&quot;
@@ -531,6 +535,163 @@ static void require_cri_gpu(int fd)
 		      &quot;This test requires CRI GPU, but found device ID 0x%04x\n&quot;, dev_id);
 }
 
+/* ====================== CPER helper functions ====================== */
+/**
+ * is_dir_exist - check whether the given directory path exists
+ */
+static bool is_dir_exist(const char *path)</pre>
    </blockquote>
    Could this function be replaced with access(). e.g.
    access(XE_CPER_EVENT_DIR, F_OK)?
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">+{
+	struct stat st;
+
+	return stat(path, &amp;st) == 0 &amp;&amp; S_ISDIR(st.st_mode);
+}
+
+/**
+ * configure_xe_cper_tracefs - enable / disable the xe_error_cper trace event
+ */
+static void configure_xe_cper_tracefs(bool state)
+{
+	int fd;
+	const char val = state ? '1' : '0';</pre>
    </blockquote>
    Inverted xmas tree.
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">+
+	fd = open(XE_CPER_ENABLE, O_WRONLY);
+	igt_assert_f(fd &gt;= 0, &quot;Cannot open %s: %s\n&quot;, XE_CPER_ENABLE,
+		     strerror(errno));
+	igt_assert_eq(write(fd, &amp;val, 1), 1);</pre>
    </blockquote>
    This gives a generic failure message. Also, fd leaks when the assert
    fails.
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">+	igt_info(&quot;Trace event %sabled: %s\n&quot;, state ? &quot;en&quot; : &quot;dis&quot;, XE_CPER_ENABLE);
+	close(fd);
+}
+
+/**
+ * tracefs_clear_trace - wipe the trace ring buffer
+ */
+static void tracefs_clear_trace(void)
+{
+	int fd = open(TRACEFS_TRACE_CLEAR, O_WRONLY | O_TRUNC);
+
+	if (fd &gt;= 0)
+		close(fd);
+
+	igt_info(&quot;Cleared trace buffer: %s\n&quot;, TRACEFS_TRACE_CLEAR);</pre>
    </blockquote>
    &quot;Cleared&quot; is printed even when open() fails. Could an error message
    be added for the failure case?
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">+}
+
+/**
+ * configure_cper_on_query_entry - enable or disable the device's cper_on_query sysfs attribute
+ */
+static void configure_cper_on_query_entry(int drm_fd, bool state)</pre>
    </blockquote>
    Could the name be made consistent with configure_xe_cper_tracefs() ?
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+{
+	char pci_slot_name[NAME_MAX];
+	char path[PATH_MAX];
+	const char config_val = state ? '1' : '0';</pre>
    </blockquote>
    config_val and val in configure_xe_cper_tracefs() refer to the same
    concept. Could one term be used in both places?
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">+	int fd;</pre>
    </blockquote>
    Inverted xmas tree.
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">+
+	igt_device_get_pci_slot_name(drm_fd, pci_slot_name);
+	snprintf(path, sizeof(path), &quot;/sys/bus/pci/devices/%s/cper_on_query&quot;, pci_slot_name);
+
+	fd = open(path, O_WRONLY);</pre>
    </blockquote>
    Does the fd leaks when the assert fails ?
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">+	igt_assert_f(fd &gt;= 0, &quot;Cannot open %s: %s\n&quot;, path, strerror(errno));
+	igt_assert_f(write(fd, &amp;config_val, 1) == 1,
+		     &quot;Failed to %s cper_on_query at %s: %s\n&quot;,
+		     state ? &quot;enable&quot; : &quot;disable&quot;, path, strerror(errno));
+	close(fd);
+
+	igt_info(&quot;%sabled: %s\n&quot;, state ? &quot;en&quot; : &quot;dis&quot;, path);
+}
+
+/**
+ * SUBTEST: cper-validate-tracefs-event
+ * Description: Verify that the xe_error_cper tracefs event exists under
+ * /sys/kernel/debug/tracing/events/xe/xe_error_cper/, that its 'format'</pre>
    </blockquote>
    The path does not match with the&nbsp;<span style="white-space: pre-wrap">TRACEFS_ROOT.</span>
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">+ * file contains the expected fields (dev, severity, platform_id, fru_id,
+ * intel_err_hdr_raw, cper_len, cper_raw), and that 'enable' can be toggled.
+ */</pre>
    </blockquote>
    Could it be shortened? Also, the listed fields (severity,
    intel_err_hdr_raw, cper_raw) differ from the ones checked in code
    (sev, ihdr_raw, cper). Could the terminology be aligned?
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+/**
+ * test_cper_validate_tracefs_event - verify the tracefs event directory and format
+ * file contain the expected field names emitted by the xe_error_cper
+ * TRACE_EVENT definition (TP_STRUCT__entry fields).
+ */
+static void test_cper_validate_tracefs_event(int drm_fd)
+{
+	int fd;
+	char buf[4096] = { 0 };
+	char pci_slot_name[NAME_MAX];
+	char cper_on_query_path[PATH_MAX];
+	ssize_t n;</pre>
    </blockquote>
    Inverted xmas tree. Also, fd, buf and n are too generic names.&nbsp;
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">+
+	igt_require_f(is_dir_exist(XE_CPER_EVENT_DIR),</pre>
    </blockquote>
    Use access(XE_CPER_EVENT_DIR, F_OK).
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">+		      &quot;xe_error_cper trace event not present at %s\n&quot;
+		      &quot;(kernel xe driver may not have CONFIG_TRACING enabled)\n&quot;,
+		      XE_CPER_EVENT_DIR);
+
+	fd = open(XE_CPER_FORMAT, O_RDONLY);
+	igt_assert_f(fd &gt;= 0, &quot;Cannot open %s: %s\n&quot;, XE_CPER_FORMAT,
+		     strerror(errno));
+	n = read(fd, buf, sizeof(buf) - 1);
+	close(fd);
+	igt_assert_f(n &gt; 0, &quot;Empty format file at %s\n&quot;, XE_CPER_FORMAT);
+	buf[n] = '\0';
+
+	/* Verify that all TP_STRUCT__entry fields are present in the format */
+	igt_assert_f(strstr(buf, &quot;dev&quot;),
+		     &quot;Missing 'dev' field in xe_error_cper format\n&quot;);
+	igt_assert_f(strstr(buf, &quot;platform_id&quot;),
+		     &quot;Missing 'platform_id' field in xe_error_cper format\n&quot;);
+	igt_assert_f(strstr(buf, &quot;fru_id&quot;),
+		     &quot;Missing 'fru_id' field in xe_error_cper format\n&quot;);
+	igt_assert_f(strstr(buf, &quot;sev&quot;),
+		     &quot;Missing 'sev' field in xe_error_cper format\n&quot;);
+	igt_assert_f(strstr(buf, &quot;ihdr_raw&quot;),
+		     &quot;Missing 'ihdr_raw' field in xe_error_cper format\n&quot;);
+	igt_assert_f(strstr(buf, &quot;cper_len&quot;),
+		     &quot;Missing 'cper_len' field in xe_error_cper format\n&quot;);
+	igt_assert_f(strstr(buf, &quot;cper&quot;),
+		     &quot;Missing 'cper' dynamic array field in xe_error_cper format\n&quot;);</pre>
    </blockquote>
    The repeated assert pattern could be a loop over a small field list
    or a helper. Also, strstr(buf, &quot;dev&quot;) and &quot;cper&quot; are substrings of
    other fields (cper_len, device), so the check can pass without the
    field being present.
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	igt_info(&quot;xe_error_cper tracefs format verified:\n&quot;
+		     &quot;Below is the content of %s:\n&quot;
+		     &quot;=========================================\n&quot;
+		     &quot;%s&quot;
+		     &quot;=========================================\n&quot;
+		     &quot;\n&quot;, XE_CPER_FORMAT, buf);
+
+	/* Verify enable/disable toggle */
+	configure_xe_cper_tracefs(true);
+	fd = open(XE_CPER_ENABLE, O_RDONLY);
+	igt_assert(fd &gt;= 0);
+	n = read(fd, buf, 2);</pre>
    </blockquote>
    This read/check sequence is repeated four times, and n is never
    checked. Could a helper be added? A failed read() would otherwise
    leave stale buf[0] from the previous step.
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	close(fd);
+	igt_assert_eq(buf[0], '1');
+
+	configure_xe_cper_tracefs(false);</pre>
    </blockquote>
    If an assert fails between enable and disable, the trace event and
    cper_on_query remain enabled. Is exit handler required ?
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	fd = open(XE_CPER_ENABLE, O_RDONLY);
+	igt_assert(fd &gt;= 0);
+	n = read(fd, buf, 2);
+	close(fd);
+	igt_assert_eq(buf[0], '0');
+
+	/* Verify cper_on_query sysfs attribute can be toggled */
+	igt_device_get_pci_slot_name(drm_fd, pci_slot_name);
+	snprintf(cper_on_query_path, sizeof(cper_on_query_path),
+		 &quot;/sys/bus/pci/devices/%s/cper_on_query&quot;, pci_slot_name);</pre>
    </blockquote>
    <span style="white-space: pre-wrap">The same path is already  built again in configure_cper_on_query_entry(). A shared helper could be used to avoid the repeated logic.</span>
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	igt_require_f(access(cper_on_query_path, F_OK) == 0,
+		      &quot;cper_on_query sysfs attribute not present at %s\n&quot;, cper_on_query_path);</pre>
    </blockquote>
    The skip check comes after the tracefs toggling has already been
    done. Could all igt_require checks be placed at the start of the
    test?
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	configure_cper_on_query_entry(drm_fd, true);
+	fd = open(cper_on_query_path, O_RDONLY);
+	igt_assert(fd &gt;= 0);</pre>
    </blockquote>
    The generic assert gives no hint of which file failed to open. Could
    igt_assert_f() with the path and strerror(errno) be used?
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	n = read(fd, buf, 2);
+	close(fd);
+	igt_assert_eq(buf[0], '1');
+
+	configure_cper_on_query_entry(drm_fd, false);
+	fd = open(cper_on_query_path, O_RDONLY);
+	igt_assert(fd &gt;= 0);
+	n = read(fd, buf, 2);
+	close(fd);
+	igt_assert_eq(buf[0], '0');
+}
+
 enum xe_err_injection_type {
 	XE_CORE_COMPUTE_UNCORR_ERR_INJ,
 	XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
@@ -562,6 +723,21 @@ static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *m
 	}
 }
 
+enum xe_cper_test {
+	XE_CPER_VALIDATE_TRACEFS_EVENT,
+};
+
+static void run_cper_test(enum xe_cper_test test, int fd)
+{
+	switch (test) {
+	case XE_CPER_VALIDATE_TRACEFS_EVENT:
+		test_cper_validate_tracefs_event(fd);
+		break;
+	default:
+		igt_info(&quot;Invalid CPER test specified\n&quot;);
+	}
+}
+
 int igt_main()
 {
 	int fd;
@@ -608,6 +784,10 @@ int igt_main()
 	igt_subtest(&quot;inject_core_compute_corr_error_once&quot;)
 		inject_error(XE_CORE_COMPUTE_CORR_ERR_INJ_ONCE, &amp;mmio, fd);
 
+	igt_describe(&quot;Verify the xe_error_cper tracefs event exists and has the expected format.&quot;);</pre>
    </blockquote>
    The describe text is not the same as the SUBTEST Description: block,
    and neither is the shortest form.
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	igt_subtest(&quot;cper-validate-tracefs-event&quot;)</pre>
    </blockquote>
    <p>Either use underscores or hyphen not both for all the tests.</p>
    Regards,<br>
    Soham
    <blockquote type="cite" cite="mid:20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		run_cper_test(XE_CPER_VALIDATE_TRACEFS_EVENT, fd);
+
 	igt_fixture() {
 		xe_mmio_access_fini(&amp;mmio);
 		drm_close_driver(fd);
</pre>
    </blockquote>
  </body>
</html>

--------------rdZPCgqNPQSqqDnjlte0RGkc--
