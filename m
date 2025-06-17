Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C843C71157
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 10:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B1010E5BA;
	Tue, 17 Jun 2025 10:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dta6GiqS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C52F10E5C4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 10:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750154736; x=1781690736;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W0qILkWSdoRT9AviFJkXp8sZE0ffiyC+kQojzew4R+0=;
 b=dta6GiqSwCvTvtb+RYf18mhkGXe05qQMgxEIW/ZoKd3Yxa5PfjPnWrcn
 Xg9OoiEs+vFE083nUhxYH4wJbtoZ9SvPAKuIfPO8t3ut0rt9glXh6pUSB
 58Wz8i/kTbHaH5axs2HGDcyJzT9LZEkB2syR2RB3fH67GPLqUGCCqZnfV
 cRdQjijb2lvCrx7uzCndE6erwI5C/dniHSiMsd6YuRVNIZvB0slO0EUUl
 evraiQvwJG+VKNrP8EIk8fLD3RhIV+jy3S7NwGXhMsn4Eh2FwCW5/YAQT
 vxShJ8SZeKf9D2vRZPGKkKpv0fSIsusfyUJkH/i0kurOblODZOOziW9uu w==;
X-CSE-ConnectionGUID: W0vtLh0LRhW8FsNodt95bQ==
X-CSE-MsgGUID: fdoYGKBQSvydxfWgsLKi0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52304947"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="52304947"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 03:05:36 -0700
X-CSE-ConnectionGUID: g6QPepYZTzK07E69gsIRJw==
X-CSE-MsgGUID: enGgczViQr+MdLEL9ongvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="149099705"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 03:05:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 03:05:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 03:05:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.79)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 03:05:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wavXjgokSmx0lMFEnqLInc7oxZD/+wCAr/Zzzf/AzfIbT/deD7Qr/QdaIE3QkFREboK0FSTNLdoE3vxO53vGbkTBCPRN2Qbgd4WCRAo0CmF1l8BILQTxYXH8NQf00rQsuwe/+30N11m/JTxY+Pw5RiOshl++G+dSdgx3jMnDGLbtAa65yO7z39lGbidbScOWvHe7MuAKZyueBsKLWN92KFx4S6Gk/o+H7MH2+yFVK/TDde8ssPOmbeYXtNjUkUwW+HrE3LASXZzm87OYMAMjL3gvfYI7pz3uXP89ALQjpNaw41Gty0S3LUvB/DYrGhgv8ejX6EFbW49q3kRZD0kzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BCv9N3hQU0NPfm5SR2zQCJJ5HpYA0+WJgZE4SZoqHE=;
 b=vcK+3b5bGUEjf52OFJW26yuW7umtIYNUJSOCeU0MNApYzeviDwfikYP0I99DuKEULQIRCDJ6QJCRzQSmPFteLShnMLve0FVQGUHepzk52fU03yJx5vN6akUbvkbwbTPOSizexJWm204mPfnnjBnP/NfQ3D/l/6iLR83MfHoToL/MeqEdOABbGLTysRFTYtjp4BzKyO0E/a+Mk0d7AHg/Y/toCQjympU5rro0ApZfnFcZH7SppRZEfEj1AoLvTixUhArjNsw6u/kHoCVg9h/5gzTsxvbnC+xkh/8FSGJgwYvOHHENUeVHV51fFEecHYneTBbBywLzWzmYPDqHkzkRPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PPFEF920636F.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f5d) by CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 10:05:19 +0000
Received: from DM3PPFEF920636F.namprd11.prod.outlook.com
 ([fe80::84c:a02c:91a8:f5e]) by DM3PPFEF920636F.namprd11.prod.outlook.com
 ([fe80::84c:a02c:91a8:f5e%4]) with mapi id 15.20.8769.025; Tue, 17 Jun 2025
 10:05:19 +0000
Message-ID: <a7b953b8-f0c7-4a6a-86e9-1dff85860876@intel.com>
Date: Tue, 17 Jun 2025 15:35:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/5] tests/kms_flip: Modify check_state to return
 true on unexpected sequence
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>
References: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
 <20250616063831.3332042-3-ramanaidu.naladala@intel.com>
 <017c1445-b316-4aaa-a869-62c8be7299d5@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <017c1445-b316-4aaa-a869-62c8be7299d5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P282CA0154.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:24a::24) To DM3PPFEF920636F.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f5d)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPFEF920636F:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: ea61e90a-59c4-4a6d-0aab-08ddad86771e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDBWYzVMc0NMMkRBaU05bWZlTVBMbWU0cWU2TVB4ZXBYYU5ITUttem5seFNC?=
 =?utf-8?B?UEtmQzNkTWVEazBJUnlxcFpaTHJEN0VUVWxxNmdzMkRJbjNiSmxnRkltdXNr?=
 =?utf-8?B?ZTRZNkFYa0dSdmZBU0xVaW9mOVMyV096VDJRT2dDNzFER3h6cXRSaWhURVE4?=
 =?utf-8?B?ZFFJcC92aXFLbytnT1FIWUM4ZHdFS2tHVmdyeVArMWNKSTdpdHRVSjd6Vm9i?=
 =?utf-8?B?K1ptejlQSE9odVY1NXVpdUpVK2swcC84Q2pJTTFKMGExd2I3aHBFaDMzQ2Zu?=
 =?utf-8?B?RllOTmladzQzUGxDZWNIRnEraDJkQ1oxWjYvc2E4MGpvZk9acXhEdTJiOXFx?=
 =?utf-8?B?MEwwTUZ4Mlk1Tm1aWUE0WHdOTlJOeWh5c1VNV2lyTFB6TUdWWGpJd1J6aDNJ?=
 =?utf-8?B?V3JWL3BqYmhBTExPbE1TZVVWL1RKNDRzdmJxMWxhQ0tpVzJaUGt1RzA3YWZD?=
 =?utf-8?B?Q09sM3c2WnJwMVRmQm5vVFlQaGVza1ZiTGRwZUlXL3hXcUJ2emZHODBSak16?=
 =?utf-8?B?clRDK3dlOGFZamIralNKUFl5eGNRMVVIK3RhRjQvS1IzdkJ2a2ZtQnJDcFV3?=
 =?utf-8?B?OXZ3RXdQVDhDSzZsUFQzcW04bVQrM1QwVytnNzBUdG11c2diLzJHaFRqdnVr?=
 =?utf-8?B?cllMQ0pOYmcxQUFpMU5tQjFOZHJjN1ZTd2hmM3Rtb1I1ODNYcmNsa1N4aE9G?=
 =?utf-8?B?K2NiY2xVUTJHYmJ5UStCWlFDV0dHZ3JadGNkK05IRHIvZjF1cmNKKzQ2ZnFE?=
 =?utf-8?B?OEsyb0Z0NWRPR1lETlIySmNDcmdwS2drNDA0MGw3ZkFsZExqREdEOXV4M3lx?=
 =?utf-8?B?MzNUL3kxakRWWXlzN2pMdEYwT1crYUxpV1I1ZVJJNVhVcnVDR0FQMVJoc3JX?=
 =?utf-8?B?bUVjZ0hORElTa0pQS0JKTmpKSlhqbVhZMEQ3cWczY0RLQzMrRW9FSS9TdVoz?=
 =?utf-8?B?cGdkSUJWZzUwV0Fjc0lLRHBCRFMrd0doTXZGcUMyd0JGZ2JmODE5aDhmd1RZ?=
 =?utf-8?B?bkk2U1FtYVpnSVYrSE1HYkZsdDhxOXY2MFdXS2ZuZXN0cGZCenYremxFQUZF?=
 =?utf-8?B?ZnlmZzF0VzBRR1Z2a1lBOHRrL1JaY1FwSlRnVldqQ05VcWdlSGMxSWM0bWJM?=
 =?utf-8?B?RTAyeGNJeUVoQ0tXWWlxN1I0OEh6K3g4OHRFbHdkSUc1YjJNRVVDWDJlZDBo?=
 =?utf-8?B?TzZJMkxHdnRqRC8rVXZsM2NtcUhOQUUwandvYkNtOWxHTVQvbEZZT2ljWko1?=
 =?utf-8?B?LzNsY2NJTE5mZHBHZENpcWZsUDQ0Kys3QkRkS3I4VURNZGFFUzJLTnNFNEg1?=
 =?utf-8?B?dWhCU0pyamdDZnNVcGkvU1p3c3JtWXFZWTNMb2RBMHF5cGNLVWw0UE9XWFV1?=
 =?utf-8?B?c2NMd3ZaWjlzVmdkeUh4YkJ3bTQvUC93Y3IvTmRxcU9kNHp6SnNwV3FMU2Fp?=
 =?utf-8?B?ZUlpQVByZjU5dWhHamNpTml5aithU013SjNtcUluWmRGM2NvcmxPejNYL2Z1?=
 =?utf-8?B?VlhGSzVlaVJiMlY0NFhuRkRGQktSVkd3cG1ha2dPa1ZzMmovbTdKNGpUTEZE?=
 =?utf-8?B?emphUHB0S3ljNExJWkFCM0V0WjRDSzlUbkFFL0RpNVpDSStRcGY5N2lCdHZs?=
 =?utf-8?B?d2lLZSsyU0dmUXdVTktnLzU0YUdCeDJLakJSU3hWdlBQWWJyVVVueFBNeEVZ?=
 =?utf-8?B?MXRicnZEQzlNRm1XTGsvREF1YTJ4YkJVdUx3MGZoQVBUQTFiNkc2RGQrTjFn?=
 =?utf-8?B?SU1lQlk3SStMaUl2bGRsRVJGMDZWRzFsajY3ZlRLMGVvaThnQlB5M05GY0Nl?=
 =?utf-8?B?NE1CME43dm5JZ2VUQzFYV2hUbXVVMTVtMXYxTzNTWlFiOFArelF1bG5YYXJN?=
 =?utf-8?B?K21NK05VNTh3U0ZpV1hTdGVuUzNwaElIZlI3K1paZUdpWnJRcUhIeTRqM2xw?=
 =?utf-8?Q?bs4EcWanWjc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPFEF920636F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OSs5cjlXRFBFTzEzM1ZtMkZCMnVTVUI4Q0N1ZHRFTWRQZHRLUVhDMUNjSTNt?=
 =?utf-8?B?Tk1pZjRlbytYNXRyWkkrVUh6akUwUWZ2cHJndmJsdHBVVTkvMlBjazVUdnFE?=
 =?utf-8?B?NFZoSnB6YU5lcnViUXV4ODBpcVJLQU5HUDVWNzhrU2NZV1NpYnMybnpoc1lZ?=
 =?utf-8?B?Nm00dUNOcTlqTGRHZWVwMW9EQ0pXck55NDhGUFMxMlpYSWp4UElHV0w0RjZN?=
 =?utf-8?B?WmNKQVhzdWsvdmx6RHQ3aFl1WGYvWXZ6aENXR2ZRZi9PMGdzdHUxb0pLcVdn?=
 =?utf-8?B?T3piUDNIYUswSGFldDhnQU1paENBUnZ0RHpndGhucTR4MnkrWmxzUXlOWHRO?=
 =?utf-8?B?Q0U1Sis5WGd2QWFvbnh5OTBUYzNIVnJZdTJsOTJYYWNKcklJV2NwYU5VRS9n?=
 =?utf-8?B?dExWSU8rTzkwNnozaUFtY2tmQmswMVdxeUtDcWJya0JlSVNtTzdDaFJpZHpz?=
 =?utf-8?B?ZkltM1FHU2xtRGs4YVZxaW5MM1ErVDdLVmMyWVQ0QzZWRzZROExnMGtHQTNx?=
 =?utf-8?B?alJGNThiSGlZVzhncURGK1htcXk1aWYyUU10c3FqNWdsRE1pQmgrdG9GZ2hl?=
 =?utf-8?B?Z2plZVMvOC8xaFdTVUlidjBYY0ZxaWdqaWdURTA4T2lWWUJnd0xuMXd1Z1Ur?=
 =?utf-8?B?UzdRclNLL2FZTWE4YVBQbVBhMHk4ZkpWc29oMU9KMFhKdDlZQm8wUWU2R0pH?=
 =?utf-8?B?STh2aHc1bThWVHVJRlBwV0tBaEpZMFZhTXUwKytUQkRlOWJiTGYrZHVLRDhO?=
 =?utf-8?B?REtBT2ZycVNLcVlLVHRFRGpiYUdSRk5NMXJjTmQzdVdKeEl6cm5mbEJhNUxN?=
 =?utf-8?B?ZkVzZVZxYm0yVVl1TlZLL2RsK3FONlZLaVIxeTBzU1NrM0pSSk5RV2pLWHl2?=
 =?utf-8?B?c0haM1NkaUh3TUo4SzRacTRPSUhFZXJzTVAvVmtXZktmd0prcEhiZGJtd2Zw?=
 =?utf-8?B?TWhQWkZHVk0rZms5UEx3SnRxb2tYb1B4QXhqcjAzZlR0a2FLK205Wjh2UXlt?=
 =?utf-8?B?YWR3cG00S3BTK3FybEJ6Y2RBNElzN1FTQUdVZWl2OUhLdmlJcmhqL2x3YW84?=
 =?utf-8?B?TUROeFRBcTgvZUZmK1ZyZys4ckRWMFdYcVZvNSsyT1hsbVdwVWhwNm9hQzRK?=
 =?utf-8?B?MU9qalhoNG1vcFpJOTkwMFkxRUZnUUZhSUkrN2gwYjVtcjh0SkJoZTh1ekFN?=
 =?utf-8?B?dk96Y3NlMW96VEw5ZUR6VXVFSWdlbTFvbHNrellaTG9Cd1kvZDVjM2hLNXVF?=
 =?utf-8?B?OTFNZTNabmplOHN5c0tZMnIrbndWaHV6bXNKMEI1S0xySWZOVTQ1cFdUdU5u?=
 =?utf-8?B?bWh1WWV3SFJXUWRVNDVuY28vcWVLVGR0UkVxWmRlZU9FTGsxK3YwKzZTREJS?=
 =?utf-8?B?WUV2N0xZNnBybXlKUTdyWVdZdGkwSlFJS1VRV0RqMXdzbmk3L1hOcHNVVlY3?=
 =?utf-8?B?T2RxUDVuNFVJUkE0RXpMaTV3K3QzQVh0b3g0bFhiYnBTbjRMaDhJVWVvUjB6?=
 =?utf-8?B?dE1rRUFBUFhhZHg0YmFGNnY2OURlSzlmV1VGZTFjamRvYUtlT1l4TFY3M29m?=
 =?utf-8?B?end0NUlPeHhWR0ZwenhKYTdPM1VDMnBQaEJjRXFPY2x2MW9RaFMrVE5GemlR?=
 =?utf-8?B?VXZuUXZWdVhtVlBpVnFDWW5CalkxNzBaRC95c2JnWm5nQjlYNHJkWHIreEhB?=
 =?utf-8?B?eG5nMW1GT2pJSWkyQXNYd3N6bWRYdHF5TnUvM243U2JzL0JIWW5NUEU4TjNx?=
 =?utf-8?B?QkxkQ2dFbVI3bWdJbXd3RHpjc3lpTHNwQkxxT3lGQmdWWVF2aVNoQXlHMnZ4?=
 =?utf-8?B?dy9jQUQzM0I0VGd5YUhnbkI5UHBMVSsrbTArbHp4M1pOaExiN3BFaDNPbW5j?=
 =?utf-8?B?Z2RQNmYxYThITjlqWXh0MTlMRXJNTkRsWUg4TCtCL3dtYm55bzJJR2wrQ2Rn?=
 =?utf-8?B?SjZGMkwzZnVxRUNxRDhCWlQveGJkSXVxTGtSMmFPcHFwQjFMUGpYZDJxQTZm?=
 =?utf-8?B?bHRxRmpKYXJQMERFMTlIamZOR2tBb1lSbmFSRTdEc3ZuQWoyTWg4N1ZIeFRy?=
 =?utf-8?B?aFd0NnhnelhycjF4aHphbEV2L21WN1ZpcGx1eW9iYzQ0eXh1d3hyUXhialdx?=
 =?utf-8?B?b3RjMmlEOGp4dnJ0c1QzK09KUWNyVDI4QytmMlZ5cmdyeGprL01RVmNySkp4?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea61e90a-59c4-4a6d-0aab-08ddad86771e
X-MS-Exchange-CrossTenant-AuthSource: DM3PPFEF920636F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:05:19.5047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3T48KgQGEjTlSLLmJwXLuSb76S09pbNeR/0OgIkHt7EDP0jz4PMt48yhFLefCIQw1ow1DIGlQoLk7CedDeXgQrnNsi15U1Tz/GL0VCOilC0=
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

Hi Karthik,

Thanks for reviewing my patch.

On 6/17/2025 9:13 AM, Karthik B S wrote:
> Hi,
>
> I feel it would be better to combine this with patch 4 of the series 
> as that justifies changing the return from 'false' to 'true'
>
> Thanks,
> Karthik.B.S
Sure i will merge both patches in next rev.
>
>
> On 6/16/2025 12:08 PM, Naladala Ramanaidu wrote:
>> Ensure function execution continues despite unexpected sequences
>> or timestamps due to shorter frame times in higher refresh rate
>> panels.
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_flip.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
>> index ca31ef7dd..2328259ba 100755
>> --- a/tests/kms_flip.c
>> +++ b/tests/kms_flip.c
>> @@ -706,7 +706,7 @@ static bool check_state(const struct test_output 
>> *o, const struct event_state *e
>>           es->current_seq - (es->last_seq + o->seq_step) > 1UL << 23) {
>>           igt_debug("unexpected %s seq %u, should be >= %u\n",
>>                 es->name, es->current_seq, es->last_seq + o->seq_step);
>> -        return false;
>> +        return true;
>>       }
>>         if (o->flags & TEST_CHECK_TS) {
>> @@ -736,7 +736,7 @@ static bool check_state(const struct test_output 
>> *o, const struct event_state *e
>>                     es->name, es->current_seq,
>>                     es->last_seq + o->seq_step);
>>   -            return false;
>> +            return true;
>>           }
>>       }
