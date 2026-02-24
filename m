Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3B4EFB7F3
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 04:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E3210E4AC;
	Tue, 24 Feb 2026 04:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhhsURP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399EC10E4A7
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 04:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771906140; x=1803442140;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=77OyOx64m7zsGS2wW4bS/7NdFQlBKzpNBoGDoOJAVC0=;
 b=DhhsURP5Q7l1C1zbtrqNQfuSodkWKiX+dM5qp3S+dt7R0EgR0S5kkSGZ
 O7MKL2tnztapUkWTaBuiQV4CabK4gZHDj4Fa/2NMf/XUVe3p7JwLBcqFi
 n+ePzMJ62abF/2/9X00IcUahuf1qEajQwlIvyqbcNdw368C63/Ggjej+j
 AIVk+raCknn24igFDCG2z2OxVHfK5ybUUaaQkqZlnmvUekkVY66jxUefp
 SAgMzfpuaW+XkFOPXdkmbnGigskxb9yXx6mCjGFaZQx0+a7V9+di6BUEE
 j5oWaDObcgEFmHfB3jtw8M5pXoISFP6u+W/mCTTxvgh8vLhMFJKNBP2yr Q==;
X-CSE-ConnectionGUID: vbO/DjqZSGqQ0p2vapWMtA==
X-CSE-MsgGUID: V20I6tdiRb2UakcQn1xwfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72980604"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72980604"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 20:08:59 -0800
X-CSE-ConnectionGUID: 5ZfrJb4uTeOTePK2OxZBcw==
X-CSE-MsgGUID: rTaDZhQLTCCv3YSY9taqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214147329"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 20:09:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 20:08:59 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 20:08:59 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.27)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 20:08:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVGCAELrIL2AR6PJ440LS1U3R3V6FoGDSA3qJlHY8e922TX70JZbklFdfWPRT+i8idYjWl8Ly+8XR8DXiewh1qf8MEPJcTClJdyuUhHOAXQ1Hs7cD8gkZUFDGu8+NbQJ0DDaNMEMzCXix4tMLDH8fnomRvEpMEhSNlqWteDxiqpYyec2E78XrCfOoOo/oS5806wgHZKYmFHQp8dNsyiLd18JzUMJ2NTthVt9NqbTz+yEJSJU4iF/LJon6bApietZ6XSwhPR3muc27rryPNoUqA7L1D6bLEM1s/WlxISC27tGc9ZW9k7n9BRdOsLKDnz4pVS8JrA5/AnIx25WOkkELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pkXZC4wnia5rRp7MgxB6wvHikg/6Di9eIwSpqyY7/c=;
 b=DQOLNY3AZVk5Mc839bTCh/ecndFU9KWplC6V7iUVjpPeKH3MTkFahqf1drrYwgFf7pV7BT3g3mCvw1zadi13RntQXHdIUGYYOrNoeqqb82oK7FUPSxspxYKIOO4LqIq0mZ/1EQYDSr3/ZCgpDAI2/IkNVk0ouwn7P6dLlbHmGqZRnZ5gzgmcxZsB+rsB/S5Y2T+Fti4hlpiJTxuSoADzEqkAk4rpQF47tBDfwfS0yXoGLqAFSygUTUyiwXV+n9+CIxsq2IvlyrPMAQwvBeYkhYi5RmwmoDWSDuq6kpqiKnasnbiKt0Kik4K4D2zk6DHUmYh6Q9hi4JACDabt5s7JUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6)
 by PH7PR11MB8059.namprd11.prod.outlook.com (2603:10b6:510:24e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 04:08:51 +0000
Received: from CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f]) by CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 04:08:51 +0000
Message-ID: <699ea535-c200-494a-a824-389b511b1d03@intel.com>
Date: Tue, 24 Feb 2026 09:38:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 7/8] tests/intel/xe_madvise: Add per-vma-tracking
 subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-8-arvind.yadav@intel.com>
 <BL1PR11MB55254273B6A331543901C8328477A@BL1PR11MB5525.namprd11.prod.outlook.com>
 <e9e69621-1ea5-4b9f-b908-425f565035c1@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <e9e69621-1ea5-4b9f-b908-425f565035c1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::11) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5706:EE_|PH7PR11MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b9f05a3-a964-430d-2a7a-08de735a6a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0drY2l0LzRWWTJuTUd2UW1FUzlhNFBtRSs0ZlU1bkZHQ1FneVBsaERJejln?=
 =?utf-8?B?QktvSjRIYTZwVytWZDRVamw2ejJabGg5Q29HMkxUWVBLNVhhLzFMc0lkK0NE?=
 =?utf-8?B?Nlk1QjZpNVJtR2RuMVcxNm1RNEp0Uk9STjY1Q2RGUlRRallMR3JhYmxYNERa?=
 =?utf-8?B?Y1R3OG45RlNFbTd2aVdGVjBlNUtiVUVLRWpVOXlCUkplb1hINTMrUXkzcmti?=
 =?utf-8?B?UmhCQkNnUG5NaDFHb2FvWlJERXdkZFBTZDVMbWozbnE1S25zdDNVSm5la1M3?=
 =?utf-8?B?c2d1V3RkZHcwc1gzY2lHdTNZR295WDBHVEd3S29Ia1hPR0tQRzA3UWUwSzZN?=
 =?utf-8?B?V29jUi9XZi9KNGl0aHpOQkJwZXlEQ0tFTmRhbWx2OGV5dFNOenFxUGJLNWp4?=
 =?utf-8?B?aUluNUhnSnlCeThRZHdJajRZdXB1TG1pY3BZcjltVWdHdWlZc3RzT2JpbWkv?=
 =?utf-8?B?RUVKdTZwWXBzOFZJZ2FwaUF3U2xKdXhtVWlsNjNWMm8xdjhQYm1OcURrbGhU?=
 =?utf-8?B?VlFkdUlnNE5HQzRhNGM2N2VQdW9RdHQ2TmFGRjFZUjFTUWxwZ3FERGxLR084?=
 =?utf-8?B?TWRiQnR3VlpHbmZnR256VzBRWUR0dGVSSVlKMEhBalRSTytkaFJTK3MrcHJH?=
 =?utf-8?B?VXRHQmxnYU4rakpFSHJVRDBWdlg2a2NBaU8yeXgzd05zOEx3VU1TVDUxY3BL?=
 =?utf-8?B?ZWJCeE5zY29Oc3RlaEVWUDFzTEl2RHpzNDRlSjJXcG1kcHlDODhOU1lxcm1k?=
 =?utf-8?B?clo4ckZYSmtoR2pKL0RkdkgzM3pTZG5NcXQ5VjlaRWl6TjNzc0U4dE0rdlVx?=
 =?utf-8?B?S2prT21BQlFveDRrcFFqb241bGlIM0NVL3pRczY1UnNFMWhMemtJMG83ajhL?=
 =?utf-8?B?VjlCSEJ4NklXUU9LdG1JZjY2N3puWjZQOEhZalNJajBCWWpxK0t4OThZNWdu?=
 =?utf-8?B?K3J1NHVrdUx3Zmd6V21UMnJHQjRIYmdVTW91M0hCNldQSExpUUVZelBhK2Ex?=
 =?utf-8?B?ZFlMTVFaRUdtaCszZlQ2dlpYRXhOT0laRkQySG51Vm9IQnh5UFl3amFVd0tT?=
 =?utf-8?B?aHBhNVpIM1dYemhVbWQ1bkprcExOOFVFUkd3Yk5UdExhdE0rb0xaMkxvcUVt?=
 =?utf-8?B?eGFCWHJ5Y09FT3Q4KzZjWWtuWkdOazl1cTZEcW1BSlFnQk5rYTBTN3MzbUh0?=
 =?utf-8?B?TWlUSEl0eUE0WjFqUFp3YzhNWkU2NUZBOWxFS0lWOHJZZ3pTUGxnZSs4Wi9W?=
 =?utf-8?B?Rm5kNSsvVGRoOWZVZVVhZ3ZBUnZFWHlmeEpleTJjNkJQSHc0ckhSY2dlMVdl?=
 =?utf-8?B?YmYveGg1SGloZVA1Y0xENzJLNlJBZ3Y2OFIvb2xYaHJ1MlZMY0dxdWg2WmdE?=
 =?utf-8?B?MlN6ejBGUG5aa2xuVUxmK2Q0WGNrTUNqUlF3VS81R3MzajlFODFBdHlFOVhn?=
 =?utf-8?B?STRmVURkUnljZ3NaZmRHVVNOSFZ0aXVzUnBUSDN3bnhXODRIOS9uRUd3cDl0?=
 =?utf-8?B?S0kxcURpMUtLQUhiN2tVa3JCN05iU2hxNWtSK2pZdzBEQjZxYVdBVXNidFhN?=
 =?utf-8?B?cEo4U2wxRTF1aG9tVCthWHlVby80RXEwZWgxR3RnRVNLcGZqN1ZjU2hWck1y?=
 =?utf-8?B?SWorbGxpNFhPWVA0TXFITlRCWHI3V3AwbWllTGdFaG5zTytuYXozR0dPQUZ2?=
 =?utf-8?B?aFFDTUorajZPOFEyMjZDd2JGaGxhTDZIY0Z1UG1FK3RxdzhOOUJEM29wd3lP?=
 =?utf-8?B?RFhpYW9kNmtXUjJiREZQbjIvQ2VLZTBvQW5xOW9pdkZzNlk0eFluZG5lSzdM?=
 =?utf-8?B?Y0hlY1RMbHgySzd5UVovcE1NYThMa3BJelRDS3lEdXZWV2dmR0EyRWFxdnps?=
 =?utf-8?B?SGFtM0RWY215R0grMDlYUEtwUk5hV3BJZnRsdzhGcEsxWUwydXVGYklpM1dQ?=
 =?utf-8?B?U1VHSW9EekM4MU1qQ2ZkTVpiSmxMMTg0ZVlya3NWYkxmVzFRSFIxR0t2aWd5?=
 =?utf-8?B?cHdIUjBZcDNVbUxnekdhNTdGQ21iQmRJcVRuRGRtWnJiYXl6b04wSkNzVFd1?=
 =?utf-8?B?YVV3OXhqWGJJYkpWWVRlTCtxUzllNE1td24xVlVpaWl1bzJNelIzbzJFNno2?=
 =?utf-8?Q?Ucs0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW4yYjJ4b0VRcTlTMW1ESEpNak1qZ0plenRQYnZoRC9vaTNwNy9TOU12cm1p?=
 =?utf-8?B?Vk5jSXQ5d3ZjdzF2L0xNa21rMHhBeXJMZ21LR1VBTGZjU0d2UVhLNlVoTXph?=
 =?utf-8?B?VTFWUXd5VlpIR1hJUjVYWlUyaHVicjk2TzkvYnFvbG9WWWRPVVFuTXJkdnVY?=
 =?utf-8?B?ZGl1cTljWGorK1k2bnNOOXZJRHB4U1hmSm1hYjVWd3MwdHVlb256WnhOczcz?=
 =?utf-8?B?bXkwSW9DdDVISWxscnBjZXZGWFpFUElFK1c1MmlIWERiT0x0T0NQOFp0TW94?=
 =?utf-8?B?cXRoRldDVzg4YTdjWWJoNmV6REV1dHUrSnlieUYrTkdwOG1OM2tjV3pNY3JF?=
 =?utf-8?B?S0gvY1NkVk5NRUV4Rk9zRHBYdExjUXZzbHJsbHc2cHNjWHFodS9kNmkvd1NF?=
 =?utf-8?B?d1ppbFBKUnk1T1UxL29lUmkvZWwyUm1wempENlpYYTNBWDV5TDF3cVVEbU5Z?=
 =?utf-8?B?eThGa29zSnFPR2k3RmQzV2F0N01weVhpdzVTZ2NBSGVuZHBLb1hsYU9rZ3dl?=
 =?utf-8?B?c2tpbWJHYUtWMWYybFZHUHZpSldiT0w1d1pLQzE5NGM2cnNPSURSMFVsZXVu?=
 =?utf-8?B?VWlxQjRQNlpXbDNDVnNOWjU3TFZwdFFPWW4rNkV0a3FxYlJtTi82SGtwTTIw?=
 =?utf-8?B?Njl1SlZoeGJ3VWZtOTRzY1ZKbHBYdy96MVRPNFRUcElOMmlzTHBONm9hVXFj?=
 =?utf-8?B?WXZsY0ZrTUJpcVMybG9nZXBXQUJpajRzMEk0V0FxZW5wUElwSXF3M0o2R3ZS?=
 =?utf-8?B?bDNjZVBYTCtiMW1lWkNGZ3FwVVo0enZhOVBFVFVuUXp6ZHF4QklhWXFQSXcr?=
 =?utf-8?B?dUN4UkZLNFRGZGFDb3dTNjJrdEg4WVRjZXNWdTNUaW5HYmZaNHpHcjU0UE9D?=
 =?utf-8?B?czJhSzU3VWNmSVd1aVhoYmFtT1BDU2o2Z25pZkhXRGlTZ21VT1RHeVd6Wm9U?=
 =?utf-8?B?b2Iyb3ZrRWRCcHU2dWpVUzcyYXVxWlp4a0FYei9nYytoK3IwRzdwNVhwR0Fa?=
 =?utf-8?B?SFlHem04UklsTklqZHZDZm9KUkVkQ1BmQ3MvK0UzU3l4cEYyVHJLWDhkcWdJ?=
 =?utf-8?B?ZkFCOERmR3MxZTFZWjJtQW43cVIxNG9QRk5CVFpsVzd5dzcwQ2xncEFXZCtR?=
 =?utf-8?B?UlRCUVdsM20zczdDYUtnZElTcmxXREpTUVFZVVFQWGF2NVdQNnNDRFVtbDRq?=
 =?utf-8?B?Z29nSUltaXdMbTBKcGlyUkhMaWlYYjBmMVNSRUtJaWdZK2NIOHZiVlJnaitG?=
 =?utf-8?B?Q1o5c3Z3ZTR0UHNQSVQ1Q1dJbDR6dWlrckkxT1ZCZnFLMTdUNWNxNVUrUzc2?=
 =?utf-8?B?bTFpNjBONWVpbDg0a0hNVUZZQTREZnI5YlpObSs3R3ZKUjl4L1lzcWYzSzBr?=
 =?utf-8?B?bjlGdGRISGhYcjNVWFdOcUZKZStlWFgxMldySUFpU2V2djh3dkxaVmRiS2ky?=
 =?utf-8?B?UTlaeEFzajVWc1JpS1djc01mdjZETlBQZWZIbitzenNkOHp4cGZXWkF5K3hi?=
 =?utf-8?B?WE1tNzRIWkRHVjVDR1ptYytCOVdkcmpQRWxsUkI1ekNXQm5Pc0dpM2lJQnNi?=
 =?utf-8?B?YnNYSEhxRkM3L2ZBQmMvV2lHV0VqdjdPVWNHam56NDdNYk5rS3c0NkVRMk9o?=
 =?utf-8?B?bGc4b1RsOGpFVlFMWkc3dFl2M2lzRXloL3N0Uk9xZXlRSHdzeXluNWRRR3g5?=
 =?utf-8?B?a21QNi9tN0UyaFpIQzNDUmh1ZVk4NWRaUUhBM1Uza1BVNFFlNld3V3BrV0ZS?=
 =?utf-8?B?Vyt0NFRTZGNsQ3Ywd2piRXJHWHZIWmxCZGlqMkNreC9pS1UyVWx4cXV5bkly?=
 =?utf-8?B?azVyb0lFY3VrNUxhYmtFV3hVVnBRRTgrVGVPSVh1ZTh1ay9BTVVCTVdlc2w0?=
 =?utf-8?B?WFhwMXF2YXZoVDdBR2F4eU12a1pDaVk0eHIwMUcxU3VTZzI3YnVibmd3MjUv?=
 =?utf-8?B?S3ljOTdGK3Z4eFo0dnczdlpYMVJuSGg4RmpUODZJVTNNQjNXdW9SWFJvNmFS?=
 =?utf-8?B?K1dxL2d2MXFIRHR6OXl2cDdVSlovTitoUDN5b2NvVGpaTTdQaGRLTC9GTmJs?=
 =?utf-8?B?bzQ3RkZNUTVNM2dKcHV5czZTR0xSb2w2MDJVTEtwWFM4bFlCaTZOaXg3NHNM?=
 =?utf-8?B?N3RycW9ITlAxVldMUFFGN3E3OHNJVUM1RHIxc1c0dTdwMnNuWlJzWDJmK2ZM?=
 =?utf-8?B?MzZXbHlleVhvelFmL01LbmsxOXc1NkFyeGtMaUNORkNWalJnRko5Y0xRZjJl?=
 =?utf-8?B?RkhBRlpGRHNMT29FVkxNYm1IalQrSitjZGpyZ0pFTTgxbEVQeWZYaDFiL204?=
 =?utf-8?B?THRNZVAxVTNuRjV0YmlmN2hDOWF4bnJpMVA3UkpBUnNlNjZXRFRNZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9f05a3-a964-430d-2a7a-08de735a6a26
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 04:08:50.9891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHqLJn/jnyzSfz+w4n1Q71EY68aAgzlZujmLOZck5XSE1pvX0dBPnaafwhLrMTNThVuAUOL75sNJWVGB+j2cTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8059
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


On 23-02-2026 12:47, Sharma, Nishit wrote:
>
> On 2/23/2026 10:41 AM, Gurram, Pravalika wrote:
>>
>>> -----Original Message-----
>>> From: Yadav, Arvind <arvind.yadav@intel.com>
>>> Sent: Tuesday, 17 February, 2026 08:04 AM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>>> <pravalika.gurram@intel.com>
>>> Subject: [PATCH i-g-t v3 7/8] tests/intel/xe_madvise: Add 
>>> per-vma-tracking
>>> subtest
>>>
>>> This test validates that purgeable state is tracked per-VMA when a 
>>> single BO is
>>> bound in multiple VMs. The test creates one BO shared across two VMs at
>>> different virtual addresses. It verifies that marking only one VMA as
>>> DONTNEED does not make the BO purgeable, but marking both VMAs as
>>> DONTNEED allows the kernel to purge the shared BO. This ensures 
>>> proper per-
>>> VMA tracking for shared memory.
>>>
>>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   tests/intel/xe_madvise.c | 109
>>> +++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 109 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c index
>>> 51ef4fad3..4e7df54a7 100644
>>> --- a/tests/intel/xe_madvise.c
>>> +++ b/tests/intel/xe_madvise.c
>>> @@ -20,6 +20,7 @@
>>>
>>>   /* Purgeable test constants */
>>>   #define PURGEABLE_ADDR        0x1a0000
>>> +#define PURGEABLE_ADDR2        0x2b0000
>>>   #define PURGEABLE_BATCH_ADDR    0x3c0000
>>>   #define PURGEABLE_BO_SIZE    4096
>>>   #define PURGEABLE_FENCE_VAL    0xbeef
>>> @@ -205,6 +206,58 @@ static void purgeable_setup_batch_and_data(int fd,
>>> uint32_t *vm,
>>>       xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>>> NSEC_PER_SEC);  }
>>>
>>> +/**
>>> + * purgeable_setup_two_vms_shared_bo - Setup two VMs with one shared
>>> BO
>>> + * @fd: DRM file descriptor
>>> + * @vm1: Output first VM handle
>>> + * @vm2: Output second VM handle
>>> + * @bo: Output shared BO handle
>>> + * @addr1: Virtual address in VM1
>>> + * @addr2: Virtual address in VM2
>>> + * @size: Size of the BO
>>> + * @use_scratch: Whether to use scratch page flag for VMs
>>> + *
>>> + * Helper to create two VMs and bind one shared BO in both VMs.
>>> + * Returns mapped pointer to the BO.
>>> + */
>>> +static void *purgeable_setup_two_vms_shared_bo(int fd, uint32_t *vm1,
>>> uint32_t *vm2,
>>> +                           uint32_t *bo, uint64_t addr1,
>>> +                           uint64_t addr2, size_t size,
>>> +                           bool use_scratch)
>>> +{
>>> +    struct drm_xe_sync sync = {
>>> +        .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>>> +        .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>>> +        .timeline_value = 1,
>>> +    };
>>> +    uint64_t sync_val = 0;
>>> +    void *map;
>>> +
>>> +    /* Create two VMs */
>>> +    *vm1 = xe_vm_create(fd, use_scratch ?
>>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>>> +    *vm2 = xe_vm_create(fd, use_scratch ?
>>> +DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>>> +
>>> +    /* Create shared BO */
>>> +    *bo = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
>>> +
>>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>> +
>>> +    map = xe_bo_map(fd, *bo, size);
>>> +    memset(map, 0xAB, size);
>>> +
>>> +    /* Bind BO in VM1 */
>>> +    sync.addr = to_user_pointer(&sync_val);
>>> +    sync_val = 0;
>>> +    xe_vm_bind_async(fd, *vm1, 0, *bo, 0, addr1, size, &sync, 1);
>>> +    xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>>> +
>>> +    /* Bind BO in VM2 */
>>> +    sync_val = 0;
>>> +    xe_vm_bind_async(fd, *vm2, 0, *bo, 0, addr2, size, &sync, 1);
>>> +    xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>>> +
>>> +    return map;
>>> +}
>>> +
>>>   /**
>>>    * SUBTEST: dontneed-before-mmap
>>>    * Description: Mark BO as DONTNEED before mmap, verify mmap fails or
>>> SIGBUS on access @@ -465,6 +518,56 @@ static void
>>> test_dontneed_after_exec(int fd, struct drm_xe_engine_class_instance
>>>       xe_vm_destroy(fd, vm);
>>>   }
>>>
>>> +/**
>>> + * SUBTEST: per-vma-tracking
>>> + * Description: One BO in two VMs becomes purgeable only when both
>>> VMAs
>>> +are DONTNEED
>>> + * Test category: functionality test
>>> + */
>>> +static void test_per_vma_tracking(int fd, struct
>>> +drm_xe_engine_class_instance *hwe) {
>>> +    uint32_t bo, vm1, vm2;
>>> +    uint64_t addr1 = PURGEABLE_ADDR;
>>> +    uint64_t addr2 = PURGEABLE_ADDR2;
>>> +    size_t bo_size = PURGEABLE_BO_SIZE;
>>> +    uint32_t retained;
>>> +    void *map;
>>> +
>>> +    map = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
>>> +                        addr1, addr2,
>>> +                        bo_size, false);
>>> +
>>> +    /* Mark VMA1 as DONTNEED */
>>> +    retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>>> +
>>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>>> +    igt_assert_eq(retained, 1);
>>> +
>>> +    /* Verify BO NOT purgeable (VMA2 still WILLNEED) */
>>> +    retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>>> +
>>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>>> +    igt_assert_eq(retained, 1);
>>> +
>>> +    /* Mark both VMAs as DONTNEED */
>>> +    retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>>> +
>>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>>> +    igt_assert_eq(retained, 1);
>>> +
>>> +    retained = xe_vm_madvise_purgeable(fd, vm2, addr2, bo_size,
>>> +
>>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>>> +    igt_assert_eq(retained, 1);
>>> +
>>> +    /* Trigger pressure and verify BO was purged */
>>> +    trigger_memory_pressure(fd, vm1);
> Triggering pressure on single VM is fine as both VMAs are DONTNEED. 
> You can mention in comment otherwise fine.


Noted,

Thanks
Arvind

>>> +
>>> +    retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>>> +
>>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>>> +    igt_assert_eq(retained, 0);
>>> +
>>> +    munmap(map, bo_size);
>>> +    gem_close(fd, bo);
>>> +    xe_vm_destroy(fd, vm1);
>>> +    xe_vm_destroy(fd, vm2);
>>> +}
>>> +
>>>   int igt_main()
>>>   {
>>>       struct drm_xe_engine_class_instance *hwe; @@ -499,6 +602,12 @@
>>> int igt_main()
>>>               break;
>>>           }
>>>
>>> +    igt_subtest("per-vma-tracking")
>>> +        xe_for_each_engine(fd, hwe) {
>>> +            test_per_vma_tracking(fd, hwe);
>>> +            break;
>>> +        }
>>> +
>> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
> Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
>>>       igt_fixture() {
>>>           xe_device_put(fd);
>>>           drm_close_driver(fd);
>>> -- 
>>> 2.43.0
