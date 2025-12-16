Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1FAD5CC8D
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 09:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E569510E6BE;
	Tue, 16 Dec 2025 09:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRhcwqSc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C4810E6BE
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765877867; x=1797413867;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e4NXgRgJzkgTVzEyxnheHAqLOMcLZPZOobIL0b/qoLg=;
 b=VRhcwqScOqGtasVp8oPFTW0E2bjLWwVqcgeWFa9rKEnCY0TNDog20fyf
 0P79yuV2s8195xf/YgvrQmEZUqjYM7h0Dis4a5pKR2QwYSP2V9aXPEDHl
 VDpaOEFIX0lAK2BTWw/M03fRNwvpxAHetAspd1YnrtGvqtwC7Z/3IHfTw
 PY/jCeCQUXvact1FkuLOl0vmL5spvn5/2fHcwRow2iJtRwr0ApJK6gdW7
 jc7mIswIB8JJAC5I2whrQihEqFbAqkdeCOMPap3vqJzT+HbVX/72bJ8EL
 Fdp9PlB3ovfDS9tTK6vMb5vwNUWgQ2s1TJioojmeXY7Qz3FU8wIQMaII0 g==;
X-CSE-ConnectionGUID: Lu38ToQ4Qh2XVoEjIc/Aqg==
X-CSE-MsgGUID: byFinmm7QiekMb0NQ8uZUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55361617"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="55361617"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:37:47 -0800
X-CSE-ConnectionGUID: OaU8AHoXS82u466xVjlDFA==
X-CSE-MsgGUID: g3rqAcUSSSqj/nwvznf1MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="203077035"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:37:46 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 01:37:45 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 01:37:45 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 01:37:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBkjqehsencnxBM+I/zP3O1EXu/97obUtD5UTLCyGhpv2wv9GiFq1E9/Yr4Ut58zr7POSx89jkr9Pm4Ng7mQDe9jEJb3yKb5foOjpd97vflGWSWVAw1Qwhj7SA7e1PMYzK5DiS6IaXzt00VIyjS/tGk7Xp96PsGrYdKIB9IejiBQkMg01+/juLLTRUc79NZ5asGl9Tn+aiNkEo2IsoBrEaOcf5agVf01sXQUMrOmoIKB6FG9gkn/nNacz7i37q+bEyR3g3x8mfkOKCkcaWNXgjdC73q7BhusYNb+riGu4cGJph4MLwWmNEOyC4l1Ek9awQk5/eAk5Puq4c/wqntjdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G24vMJvDqlwM2iwXC5kmIG1i0t2RCr+ldeFMRXJiADQ=;
 b=Uj4gNxYdURRUFkvug4niw8kQFORjb0f4pd7jedHH4Aff6JpmTlNCsmvmUWDq5uv4dEe0mjROWWJIuahkBCBMweNZtVMSFPxDj4K0N8mGYWXReckqXfkPXFESUWawkc5jmbw+/twUyCAk4aFbckX3ukA9VDwqDYJqyAndCIvbwbo3q/EgVmT2OQd1e8hANcSuk8/8UOvQKFcGVJHRZYXAktwsVXim4BOOKoE87waaaSc1RDej9hNJrlVoGaHOtQC1tGE1youjLuvAbY1UM6HAEdqMK4AWsonUoUixyenTiQwbZco/dfEZOkGmKiWyHWXJXosnhEVu/UUvniCpTXy8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CY8PR11MB7315.namprd11.prod.outlook.com (2603:10b6:930:9e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 09:37:44 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 09:37:44 +0000
Message-ID: <8b0d458d-87b0-4840-bf3b-81cf93aa9d1c@intel.com>
Date: Tue, 16 Dec 2025 15:07:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] tests/intel/kms_joiner: Add function for
 pretest checks
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
References: <20251215085500.2900416-1-karthik.b.s@intel.com>
 <20251215085500.2900416-3-karthik.b.s@intel.com>
 <DM4PR11MB6312548A99FFF21E8525234E90AAA@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <DM4PR11MB6312548A99FFF21E8525234E90AAA@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CY8PR11MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: beedd109-6944-4f93-f531-08de3c86c37a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dE1sdVRaSFoySFBTK09kSkVPSFdjaEt1WVdaY3BvKzJXSmRLc1hRY1ZINW5l?=
 =?utf-8?B?ZHdNK0RtWUxnSW1GaTNhaXE3OHRiTk5Lek80MVA4OXBUQXdmbEI2TnVDSVJq?=
 =?utf-8?B?U3pBU0U0aHhzV2ZEa0tkUGV0cDRNQ205S3N4TXJ6Z0diU3RRcjZKazlsc0FZ?=
 =?utf-8?B?R0I0N0k2dmptOHpmUWJnQzBUdXczYUp2alBoTG9JUEk4eDdrR0NMSTQvcVcx?=
 =?utf-8?B?SW85anBTTGYrNlc0OXpLZEJpN1FmL0haQ01hUHBRMDJidGw3RHh1TzFFSmlo?=
 =?utf-8?B?QWJOSnliTW42NFpWWTN3VlVsQ01YNzdKZnNpQStzQ0ZjRU4rRDlJbEtmcGVH?=
 =?utf-8?B?Mjhnc1p3U2g5c3VrOHp1Rlg2NFE5aW5qZlczRHFEdmEvZEJmd0UvbEZEMkZ1?=
 =?utf-8?B?QmVMTE9sTFc0cXJIK2hzNkZpUkpLaHVOeFlBdnByWG05WmtoN2tSVThjWGhG?=
 =?utf-8?B?bDlOaXZ4QzhWVFhGLzNXeWdEOWtRblNsc2ZpcnV2MFlYekQ5RlhrUXhRa0tL?=
 =?utf-8?B?SHU2UWovLzFzY2hMME94cEpqWWJ0YkRqSmpFMFB3RHdFMC9rRUFCWWtERlQw?=
 =?utf-8?B?SmJDcGl0YllZaExFOURhZk5lZ3dJMlkxVTJsUHNSc0MxRCtGQ05WS0hIZTR6?=
 =?utf-8?B?Ymc1bkp4MHNXQXlaNWxUbVJqTit2ZE9sRHVuSHFzSlBDaS93cXJZWkg2UGxV?=
 =?utf-8?B?WjI2ZkVWbk1qWVF5MktJK0M0czNIY2EzTW1BOEFhNS9tTUpJeFVvbDRLRVVO?=
 =?utf-8?B?N3M1LysrV0txMFlpYllrSTY2UWxZanlTVGRzL29UelorTVB2anV6SE1TS291?=
 =?utf-8?B?TGx4ZVF2R3pMWGRnbGRvMlUwT1BQQUlrVEEvT3BDUEcyejdlcFN6SSt5QkVB?=
 =?utf-8?B?Qnhoa0JTMkVncEdQdy9md2J6emZtREo4QkFIT1JVU0pqN3I3N3BuazlBczNH?=
 =?utf-8?B?RmU4TVhTdTl2WXBaNHZlVFNlOUhaNFJVWkRlYUNEZjJZOVZ3OE5ZZXc3eGZl?=
 =?utf-8?B?VlFKUmwvKzI5NStJTGtNSTI5ZHQ3ZzVta3pobC84Zk1FaExFMlZCbTR6ZnU4?=
 =?utf-8?B?eS9EcWJDMVhqakZoVEd0TTZZV1c3dzZQNVc4VjZvaDJqaGpBOEo5eXFSTC96?=
 =?utf-8?B?Q3dEYTJJeTlCdTJXVjJiSUdQUEdLY3hCcDhmMXhCeEdXWHYrVGtraWszaCsw?=
 =?utf-8?B?c3k5NFhJTDZsRWNZNmQ1Tll0aE1tamNmUHV4ZjRIMk1OZXhDMWNDTHVRUnVw?=
 =?utf-8?B?SVMxeDNjVXJpak05RjZjUDJmdVRJbkpETmNJS0JUV05IMVJjMkx1aVdSQjFm?=
 =?utf-8?B?QWZMZzNEMGNCeFZ2a3hrQVhkR3Z6eXVWUlJoOE11SU9uam0zTWM3MDNVampq?=
 =?utf-8?B?SjdEeTNoR0dTMENld1JRM1pCeE43c1RuV2ViZWF4bW5Bbm1rbG85clBpZCtO?=
 =?utf-8?B?MTc1OTFicHJZRW4zVmNHRTYrK0ZFSUFteldQNVdML3pSQ0xhV21YN0JCYlVG?=
 =?utf-8?B?V0Q0Y3FFSVRQdGN1MDVVNVcvTHpGeUJwSGtmTVQycUpuSHdWb0pSNU9aVEZN?=
 =?utf-8?B?bVk0Z2o2NllvYnBiZkVBTlU0ZHV5RzZIVHU0a1NlWk8xKzhJYVpiZGx2a2FI?=
 =?utf-8?B?dU9wZDB1dGxCRmZxa0ZxYmRhTWl2L1FvMFJ3THoyZ1VlaGNXLzBhd09JQmNX?=
 =?utf-8?B?Y1BLZUpqeUJEb1ZCaDFRWHpOc0YvQlJEcVcrQTM4enJwdGlMRDVNTXFlNFMv?=
 =?utf-8?B?ZXBIMVFjSkIvdjJwREU4MzBCS0hjTFFEVU5wS3RIRWpTNXBFaWR5bDRCakx5?=
 =?utf-8?B?VFlnOW45WGlQMTYvbjd5WXh3L1BRdC8rbC9lNXk1RE5oMlFxcHB5TmppUUFm?=
 =?utf-8?B?ODhvTWttZXhSWmw3ZTdxMkFXTVNnejdMWFFoVEtJRHlpelRHdUI4aGkzSHlS?=
 =?utf-8?Q?Jkb4Tl8Sy67GOwAkBSnLdROn4vJyGMWZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUhRNDE5SXhxK05nQUpacnlIcXZRaWZsdzlhYnJRZXRGQ3dyamJyRVdoQ1U2?=
 =?utf-8?B?ZGRKS1cvQldNZXp5VVZLKzk2L201a3NTK20wM0lSc3Avdzk4Skxia3BYT2Rv?=
 =?utf-8?B?dDgwQVRlMDB4eGtKRDRTZ2ovSTh0QTlvbXMwZk5na1d6UUUyN1pqbzk2T1Ir?=
 =?utf-8?B?Nm5jV0dRcXBjc2wyQW8wUnBCanVJM0J1UUpqWVY3aW5zK01KSzBnVlpmbHJO?=
 =?utf-8?B?Z3Q2Ym5OZFY1UlFLTTNxRTlyaENmcHhtdWJUZVB0T1lSSnR6WHl4cXdyT0tG?=
 =?utf-8?B?TlBGMWpiWTVLWVlyYWdybWVWOExBT2ZFNHJKLzlTK0VpMVRvRXFNNmhwdWkz?=
 =?utf-8?B?ZHhaZm4zalN3bnh6Sy9ZZWFTNytrSkhkd2Y1UVJkTHRqUHNPOHdieWtZOUxr?=
 =?utf-8?B?U0tyNWQ0cHpEd21ndC9XZGl0YmZNaEdoQXFRM2hVVkU3RXdqaStSY2xuU1NI?=
 =?utf-8?B?bHN3MW9RN01ZM29peUdCa0M0Tzl4UitaMldrYW1mTEo4SkZadXc4WHM5NWhj?=
 =?utf-8?B?UWViRW5SYVdoMFFpamlsRXd0TFViWk9qQ1QyNEZ2VFdaQzVlL3plRjF4SFJh?=
 =?utf-8?B?YUd2cGRlQU9za0xaVnVGOGhjbURseGF0ZDZXT0hMNXRGeVlsOVhxTndmcGNt?=
 =?utf-8?B?S3VqT3NzYzkyaFRrNXlJVVJrRVVrakdsNHl0MllKT2xCbUM3elM1ZGUwR3Jm?=
 =?utf-8?B?aW1kb0h2cjlSaEFxQUNHeUxJOS9mbjMyRWlYMGZQQjMwNkwzZjRJM3E4MHVw?=
 =?utf-8?B?Z0lDZlc2Mnp5SlBiajNiY0hXdHUxaGFRMnd1c0pWdTdaVVpRSEU0bWN6Zm1T?=
 =?utf-8?B?Vk5jVHQxQisxYnowZnVKcTdJWXVEbks5Sm1tRWxOQ3VwRGNLbmNYSkZpWXVJ?=
 =?utf-8?B?K3o5bzh4cVJvSmlhK1IyUXZ0SEJCZEMyQUp0UHJqZzJsR2lpTHJ6L3g1U2xS?=
 =?utf-8?B?eHVEWGoyVnRYbjAzUUJIa2RRVVZxUitvcU9tWk0wZGxhYWZmTWNFMC9Zalls?=
 =?utf-8?B?QXZWN0l2c2lMRG0wSGVRYlhScnVndTlQZGo0Z2NmU1Q3U0xtZHp1NENFd2RX?=
 =?utf-8?B?VVYvbzhjMVVUdHBQcUU2czRxci96YVFjQXZiYkI5aUVLaXZsbGt0UXVGV1NT?=
 =?utf-8?B?RXFaWFYxNG55d2JkMXR6QkQ1THA5YU83K0JHS0Z2RGxCWkc5ZlJtS01SVmZS?=
 =?utf-8?B?M2dqbnRKRGxTUGt6aFhYUFpKRU90ZU5wMllqeVg4UlNtcnhVS1dyNGkrM1pw?=
 =?utf-8?B?YTRXT1A0Nk5PaDl4Q1Boa3A3ZVY1aGU1U3BKYVRFY1pFbFN2NGdCZVhzclA3?=
 =?utf-8?B?SGZjY3BhdEVqUGpZMnQ3dFUrY3VxZE1LbjBKUUs4cmJRNEo3ak1IczdpVVFI?=
 =?utf-8?B?YUYrdmpMdlFPYmw3VHQ0SENGbW9zL2xyMHVZczlrTGZmSjI5OXlBckxZMkVM?=
 =?utf-8?B?dFk5ZnpMaXNIOUhzYWhIS05PZnpnMTV3SnMyYUk2a3FPcEtocjBRZ3dlVENG?=
 =?utf-8?B?ZjBHNWVUZ3RhZXQ5a29LZ0ZOakFZRy9Cek1YVGxNdTE2QzFyaldiTjFRdjFH?=
 =?utf-8?B?bWFtQ1M3SWRRT3YxTk9kd2tTb0J1OEVxbCtESVc5SHJXRWg2L3pUcDV3MGFQ?=
 =?utf-8?B?S2s2Z2wwMUJ5QW9iaEJiT0Vrd1hsWE1QUEtxYlpYT2lyaG4xMDhBdmNVeG56?=
 =?utf-8?B?bkJSb0JqR1Y2MnJYL0xFYkZsTDQ4QmNaSmdhazZ1UUdGdkZmUUxFOERlV0pQ?=
 =?utf-8?B?MUtaQkEwaGZzcTJqb2RtRXBQMjZLYnZpQjZxMm1vQ0NDWU0zMG5WOHNIMkFt?=
 =?utf-8?B?VThwZDNxN3Q4VDhsYjZxWEVxbFg2cng0d0hqOTVheGZBbTc3ZStGaHg5OHFv?=
 =?utf-8?B?RzFqb1pCRTV0R1pVMklTWjFaeXB6bmcvdzhDVXhLa2ZDSUpUdFJBRnovamJa?=
 =?utf-8?B?MFJXWWVyQlMydG1kakkzYmxnVEpBZ1d3a1ZObW9BQzN6YVh6OHBPcXkvZ3RQ?=
 =?utf-8?B?akpjTXJIYWk4OTN5NHlOMnVSMC9rcmw5WTdFaWYvc1NxTk42d20wTWhqQWMy?=
 =?utf-8?B?K2I4QjhsQU5vdUJ4aWFHR25JVStaNzJhdEhiTjN2WmE0RU1mNkJIb1luY2Rx?=
 =?utf-8?Q?Gcs9TUCoNCbp36vZx+BOz18nW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: beedd109-6944-4f93-f531-08de3c86c37a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:37:43.9590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9pnV28SReePs1ZQwRrt3r5qoWhHjgUvLV1AgX4tct5RqUzKsdCJV1bNMca7ES1xPQ3ZCsKZIdlnTE4VF7sJUpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7315
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


On 12/16/2025 11:55 AM, B, Jeevan wrote:
>> -----Original Message-----
>> From: B S, Karthik <karthik.b.s@intel.com>
>> Sent: Monday, December 15, 2025 2:25 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: kamil.konieczny@linux.intel.com; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>; B, Jeevan <jeevan.b@intel.com>; B S,
>> Karthik <karthik.b.s@intel.com>
>> Subject: [PATCH i-g-t v4 2/2] tests/intel/kms_joiner: Add function for pretest
>> checks
>>
>> Move igt_require checks in individual subtests to a function which is called from
>> all subtests to avoid code duplication.
>>
>> v2: Use enum for various joiner modes (Santhosh)
>>
>> v3: Split the function for big and ultra joiner (Kamil)
>>      Use igt_require_f (Kamil)
>>      Minor Styling cleanups
>>
>> v4: Move force joiner helper to lib (Jeevan)
>>
>> cc: Jeevan B <jeevan.b@intel.com>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel/kms_joiner.c        | 93 +++++++++++++++++----------------
>>   tests/intel/kms_joiner_helper.h |  5 ++
>>   2 files changed, 52 insertions(+), 46 deletions(-)
>>
>> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c index
>> f8e684b47..9af94bc62 100644
>> --- a/tests/intel/kms_joiner.c
>> +++ b/tests/intel/kms_joiner.c
>> @@ -101,6 +101,7 @@ typedef struct {
>>   	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
>>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>>   	igt_display_t display;
>> +	bool ultra_joiner_supported;
>>   } data_t;
>>
>>   static int max_dotclock;
>> @@ -179,6 +180,32 @@ static void set_joiner_mode(data_t *data, igt_output_t
>> *output, drmModeModeInfo
>>   	igt_remove_fb(data->drm_fd, &fb);
>>   }
>>
>> +static void require_ultra_joiner(data_t *data, enum force_joiner_mode
>> +mode) {
>> +	igt_require_f(data->ultra_joiner_supported,
>> +		      "Ultra joiner not supported on this platform\n");
>> +	igt_require_f(data->n_pipes >= 4, "Minimum 4 pipes required\n");
>> +
>> +	if (mode == FORCE_JOINER_ENABLE)
>> +		igt_require_f(data->non_ultra_joiner_output_count > 0,
>> +			      "No non ultra joiner output found\n");
>> +	else
>> +		igt_require_f(data->ultra_joiner_output_count > 0,
>> +			      "No ultra joiner output found\n"); }
>> +
>> +static void require_big_joiner(data_t *data, enum force_joiner_mode
>> +mode) {
>> +	igt_require_f(data->n_pipes >= 2, "Minimum 2 pipes required\n");
>> +
>> +	if (mode == FORCE_JOINER_ENABLE)
>> +		igt_require_f(data->non_big_joiner_output_count > 0,
>> +			      "No non big joiner output found\n");
>> +	else
>> +		igt_require_f(data->big_joiner_output_count > 0,
>> +			      "No big joiner output found\n"); }
>> +
>>   static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t
>> *output)  {
>>   	drmModeModeInfo bj_mode;
>> @@ -554,7 +581,7 @@ int igt_main()
>>   	data_t data;
>>
>>   	igt_fixture() {
>> -		ultra_joiner_supported = false;
>> +		data.ultra_joiner_supported = false;
>>   		data.big_joiner_output_count = 0;
>>   		data.ultra_joiner_output_count = 0;
>>   		data.non_big_joiner_output_count = 0; @@ -574,7 +601,7 @@
>> int igt_main()
>>   		is_dgfx = is_xe_device(data.drm_fd) ?
>> xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>>   		display_ver =
>> intel_display_ver(intel_get_drm_devid(data.drm_fd));
>>   		if (is_dgfx && display_ver == 14)
>> -			ultra_joiner_supported = true;
>> +			data.ultra_joiner_supported = true;
>>
>>   		for_each_connected_output(&data.display, output) {
>>   			bool ultrajoiner_found = false, bigjoiner_found = false,
>> force_joiner_supported = false; @@ -630,32 +657,25 @@ int igt_main()
>>
>>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>>   	igt_subtest_with_dynamic("basic-big-joiner") {
>> -			igt_require_f(data.big_joiner_output_count > 0,
>> -				      "No bigjoiner output found\n");
>> -			igt_require_f(data.n_pipes > 1,
>> -				      "Minimum 2 pipes required\n");
>> -			igt_dynamic_f("single-joiner")
>> -				test_single_joiner(&data,
>> data.big_joiner_output_count, false);
>> -			if (data.big_joiner_output_count > 1)
>> -				igt_dynamic_f("multi-joiner")
>> -					test_multi_joiner(&data,
>> data.big_joiner_output_count, false);
>> +		require_big_joiner(&data, FORCE_JOINER_DISABLE);
>> +		igt_dynamic_f("single-joiner")
>> +			test_single_joiner(&data, data.big_joiner_output_count,
>> false);
>> +		if (data.big_joiner_output_count > 1)
>> +			igt_dynamic_f("multi-joiner")
>> +				test_multi_joiner(&data,
>> data.big_joiner_output_count, false);
>>   	}
>>
>>   	igt_describe("Verify the basic modeset on ultra joiner mode on all
>> pipes");
>>   	igt_subtest_with_dynamic("basic-ultra-joiner") {
>> -			igt_require_f(data.ultra_joiner_output_count > 0,
>> -				      "No ultrajoiner output found\n");
>> -			igt_require_f(data.n_pipes > 3,
>> -				      "Minimum 4 pipes required\n");
>> -			igt_dynamic_f("single-joiner")
>> -				test_ultra_joiner(&data, false, false, false);
>> +		require_big_joiner(&data, FORCE_JOINER_DISABLE);
> This should be to check ultra joiner right not big joiner
> With this change code looks good to me.
>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>

Thanks for the catch, will fix this during merge.

Thanks and Regards,
Karthik.B.S
>
>> +		igt_dynamic_f("single-joiner")
>> +			test_ultra_joiner(&data, false, false, false);
>>   	}
>>
>>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>>   		     "when the pipe is active with a big joiner modeset");
>>   	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
>> -		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner
>> output not found\n");
>> -		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are
>> required\n");
>> +		require_big_joiner(&data, FORCE_JOINER_DISABLE);
>>   		if (data.big_joiner_output_count >= 1)
>>   			igt_dynamic_f("big_joiner_on_last_pipe")
>>   				test_joiner_on_last_pipe(&data, false); @@ -
>> 670,9 +690,7 @@ int igt_main()
>>   	igt_describe("Verify if the modeset on the other pipes are rejected "
>>   		     "when the pipe A is active with a ultra joiner modeset");
>>   	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
>> -		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner
>> output not found\n");
>> -		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are
>> required\n");
>> -
>> +		require_ultra_joiner(&data, FORCE_JOINER_DISABLE);
>>   		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>>   			test_ultra_joiner(&data, true, false, false);
>>   		if (data.non_ultra_joiner_output_count > 0) { @@ -681,12
>> +699,9 @@ int igt_main()
>>   		}
>>   	}
>>
>> -	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>> +	igt_describe("Verify the basic modeset on force big joiner mode on all
>> +pipes");
>>   	igt_subtest_with_dynamic("basic-force-big-joiner") {
>> -		igt_require_f(data.non_big_joiner_output_count > 0,
>> -			      "No non big joiner output found\n");
>> -		igt_require_f(data.n_pipes > 1,
>> -			      "Minimum 2 pipes required\n");
>> +		require_big_joiner(&data, FORCE_JOINER_ENABLE);
>>   		igt_dynamic_f("single") {
>>
>> 	enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>>   			test_single_joiner(&data,
>> data.non_big_joiner_output_count, true); @@ -703,10 +718,7 @@ int igt_main()
>>   	}
>>
>>   	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
>> -		igt_require_f(data.non_big_joiner_output_count > 0,
>> -			      "Non big joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 1,
>> -			      "Minimum of 2 pipes are required\n");
>> +		require_big_joiner(&data, FORCE_JOINER_ENABLE);
>>   		if (data.non_big_joiner_output_count >= 1) {
>>   			igt_dynamic_f("big_joiner_on_last_pipe") {
>>
>> 	enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> @@ -724,14 +736,9 @@ int igt_main()
>>   		}
>>   	}
>>
>> -	igt_describe("Verify the basic modeset on ultra joiner mode on all
>> pipes");
>> +	igt_describe("Verify the basic modeset on force ultra joiner mode on
>> +all pipes");
>>   	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
>> -		igt_require_f(ultra_joiner_supported,
>> -			      "Ultra joiner not supported on this platform\n");
>> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
>> -			      "No non ultra joiner output found\n");
>> -		igt_require_f(data.n_pipes > 3,
>> -			      "Minimum 4 pipes required\n");
>> +		require_ultra_joiner(&data, FORCE_JOINER_ENABLE);
>>   		igt_dynamic_f("single") {
>>
>> 	enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>>   			test_ultra_joiner(&data, false, false, true); @@ -745,7
>> +752,7 @@ int igt_main()
>>   			      "Ultra joiner not supported on this platform\n");
>>   		igt_require_f(data.ultra_joiner_output_count > 0 ||
>>   			      data.non_ultra_joiner_output_count > 0,
>> -				  "No ultra joiner or force ultra joiner output
>> found\n");
>> +			      "No ultra joiner or force ultra joiner output found\n");
>>   		igt_require_f(data.n_pipes > 3,
>>   			      "Minimum 4 pipes required\n");
>>
>> @@ -754,13 +761,7 @@ int igt_main()
>>   	}
>>
>>   	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
>> -		igt_require_f(ultra_joiner_supported,
>> -			      "Ultra joiner not supported on this platform\n");
>> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
>> -			      "Non ultra joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 3,
>> -			      "Minimum of 3 pipes are required\n");
>> -
>> +		require_ultra_joiner(&data, FORCE_JOINER_ENABLE);
>>   		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
>>
>> 	enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>>   			test_ultra_joiner(&data, true, false, true); diff --git
>> a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h index
>> 8a6f8e5ad..6d21e7eb0 100644
>> --- a/tests/intel/kms_joiner_helper.h
>> +++ b/tests/intel/kms_joiner_helper.h
>> @@ -17,4 +17,9 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>>   				  uint32_t *used_pipes_mask,
>>   				  uint32_t master_pipes_mask,
>>   				  uint32_t valid_pipes_mask);
>> +
>> +enum force_joiner_mode {
>> +	FORCE_JOINER_ENABLE = 0,
>> +	FORCE_JOINER_DISABLE
>> +};
>>   #endif
>> --
>> 2.43.0
