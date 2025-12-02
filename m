Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C20CFD376
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 07:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA8F10E04D;
	Tue,  2 Dec 2025 07:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqOHMOzB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E41D10E04D
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 07:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764660574; x=1796196574;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YgDUQrL5WRYxO2xFZ0258snEp39MShAgVr87Spz4wtc=;
 b=AqOHMOzBzYe2S3OMaeytqEQ0+P+p0vltWblS5C8GcSMXNgOLVQnGmpaA
 6KMiBjJXdtpXgswbRURTbwANKsRrCk/v9gzpg+Ix1TUadQBIoogGmOluo
 KuZsE8lIsaYWWBWEWPPNh+wBQTVDBIA8kg8ODy3sg4NyUdWTTx8CG2isI
 xLYnD7fR4aqDDG5WMqHR44UPvjT7+kD0AFMKXrJ1/x/13PLvB6t50pzWE
 J4NduJ6jWah9em6dpri4dVorhMPqJnVMVcNgp55CACKoYSZaxv6G3OC8D
 xBdIqSrOnk18L5UcVTkIxM+UfshIhIEHYY6WgHZufk1+uWzrK/jNgTtFk Q==;
X-CSE-ConnectionGUID: RejDcvapTOqYKA8W8HugAg==
X-CSE-MsgGUID: y4/eqdbGQs2vL/rTgexL9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66653898"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66653898"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:29:34 -0800
X-CSE-ConnectionGUID: IMF3thdRTCKqULI4eyIn4A==
X-CSE-MsgGUID: WLNW3NEWRS2a9KL5Trt/Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="225265412"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:29:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:29:33 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 23:29:33 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:29:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGrIcEWzvrhfRRAHIQyNIVh07W2AeS4XQu7BtrlFdRrg4nacOJNAbCG6LQd3lVxUtRDFjs9KuJDLdv0Qhf1RG70+JRyTVZjL91ewBKaGb9aNs4ONGNJKnYEwrCNCUouMxVlMW53IOq7RzMwrLUF9MFrxudDWaBAzq3alL+P5AyqlusIcgDBhmZHrpDHmpX67E9FMyYfJukguPmok7A9U9Vyh2Sb1p3CAOMGj0OT8lZjsAdizoWDEep/QtC8u1gd5Xoo93VGToyn5t+9r5DvwVgeZY0GGX5K4O5sg0OL94AT/g98F1inh2rNr60rhIaLK/ImXUaj3d/GCRBOc6Ed+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUA4nfpdscgNZsVmEzbD9DElIgM4BCNTANzGp7F6zG8=;
 b=ElIB3evqGOCVoEFAXb/OkEKJDbQ6vfwhW+q4k9t01TXpMIHNtJ+A6+jFNnac28rN+93VfqBHXu9hTKeOi4ZJp7Jvo6uF+UN2yIst7t4Yn1qqZj+rr/cHHxvp2KOaBpjA9LrSUw+Qc6iGQoY6xdI/tMrLiw5neYd74WyxKjPs3My1jvx7IJPEAD6FFIGKzOtMQS8CFTUElqPxymul6L6uG3v5ktcxbyH4pK/1dDyCApcraU35jbr4H8j9nk3tux3J1nRyXxl8uDv60lqxZfuNkNmbIW+gc+eCJtkjOcMFu8yKDcmS1WWf7keMSee8YT9mQDJVeCqps2t0AmTLq03vlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA3PR11MB8988.namprd11.prod.outlook.com (2603:10b6:208:57d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 07:29:31 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 07:29:30 +0000
Date: Tue, 2 Dec 2025 07:29:21 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, S Sebinraj <s.sebinraj@intel.com>, "Xin
 Wang" <x.wang@intel.com>
Subject: Re: [PATCH i-g-t v4 2/3] tools/intel_gpu_frequency: Change Intel
 card detection
Message-ID: <rq3aadxbg6szdu4czdsxfzb6d5rlxvajz2owuz56ihgg72mdcx@gec7nnqfbppq>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251201173305.111564-1-kamil.konieczny@linux.intel.com>
 <20251201173305.111564-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251201173305.111564-3-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: LO2P265CA0454.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::34) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA3PR11MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e992c87-88b0-402e-3261-08de31748859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NW1tNTBiYW9FMTBLZ1BEV3RSSjh1UE5hVzlCSlBBYjlBcElrbFhrRVRQNWxx?=
 =?utf-8?B?QXRpalJjSitiUzA2ZEtVVVlmQ25UVFBNcXBvY3ZjbWFkNUg1VWlhMU5PN2po?=
 =?utf-8?B?a3BJVGV0V1NvTFQvdWpPWkJzdHhhRVRJLzFwbXJuR2ZKY2RlS1F2S01TQllS?=
 =?utf-8?B?ZjBNVU1FZkdvZHhUTjMzVk5TNGZmNDlhTElDMWFRNDI0Z0J3VVlLT2NCODEw?=
 =?utf-8?B?WVhqUld2TXdLZmNMeG9LSDhsdXNJQ3RNMUpYL2QxdmFTL0tzOFVJTWVZa2NU?=
 =?utf-8?B?a2xFMXNyaHRvbU83R2RlWkpNNnl1Unl3ZUpSRDE2NWZ2N2x4U3ZoRmRhVDNN?=
 =?utf-8?B?UGxHTkZNV2d6VnRuUzRXWEFVajAxOGRTR0ZWYUJOZ3hZTzNTM2UzTGIwNENq?=
 =?utf-8?B?Kzd1Mit1eklHUnlPRDR6b0hjL050ZTdPZ0c2cHlxSXVLNEtueHlQQXh2NzdK?=
 =?utf-8?B?bXZvRnk2eW1TWHRBMjdmQ2p2aHc2VFpETk9EZ1lIT2N2czcyNUNYTS9SVmZO?=
 =?utf-8?B?SlNManpDQmJaMU5EZklvNTU5N0g2WHUreExnTS9UNVVkMEo0ZGErMnBFVldw?=
 =?utf-8?B?bk9ZOTZ0L0x2a3V2Vms3N0Y4V0pyMnNQc0IzNFFZQnhKRUpGVmdtdlJxcU95?=
 =?utf-8?B?ekM2YmNCektQeTJBdEJqNDRENEVUWTBiUWJSUjBnbFFyUEtVUGJtNXNINHQ5?=
 =?utf-8?B?cjNnTG80ZkFMRWtLSXpLejI2Ymd6L1dzUWV1amRRbWxjMTBjSmRlWllHOUdm?=
 =?utf-8?B?Y1dPeitIV2lBdElSVEsyRnRQb21BN1pXMlRhQ3JpeUhMZWp5amJsTHlDVi84?=
 =?utf-8?B?TUlUN2huV1pJajM2NWg1cU1icFRtanR4WkZSbmJCZzFPdDh2UGd6VElBM0pu?=
 =?utf-8?B?NTBpSXVHc3RadHlmWGJZT0FEc2NNZ0lWM1pBa3ZRSHh0SDBFSnZrbXEzOC8z?=
 =?utf-8?B?bmYyaUZvRlpLQWUvcW05SnI1VlRRbUFpdlpoVnNwbFZSVHZDdk85YzErd2Jp?=
 =?utf-8?B?d0UyNHYyVExDdG9IRitBazcvK0xVdEl3c1ExTWdJcDM0R1RLL1B5SHluRXlK?=
 =?utf-8?B?eENBTnBOMkZqcU1paFdQRE9WNUFubmdiZnhSd1RJT2FZUDk0ZTdOYU1RYXBE?=
 =?utf-8?B?bEVrWmtZWXgzRDVyMmhGa1hTWTdobzkyTDEvcUpMSlJVTGZGNURoTDQ4T1Nu?=
 =?utf-8?B?RC9VbmlZUTkvTy8zMTF6dlpNMk9xbCtzU3hBS2ZxdEh6Z2UwaEFXb1NEQ0hQ?=
 =?utf-8?B?eHlvN21WNktiN3JjUGs5WnM1RFQ1bVgzY3I0TFVSdUNoeDN0SktHS1FNb2pC?=
 =?utf-8?B?YjhtTnQ4UXA0Qnk2NzN5UXg1UDZod0ZaR3d6dDMzZTd5N0xOVlEyajhiVC8x?=
 =?utf-8?B?Nm1BOEFYSldqb0lmenlSNzI3VzhBQmU4YmpOUThocDlMekdxMWsyOUxLUlht?=
 =?utf-8?B?SjBqMTRLL0dsQk43MzFpbHg1dGdPQkhXVi9OdU5yQ2ZjK2MzR3Z1THdIQnBa?=
 =?utf-8?B?UjF6S3B1YUlMTTNXdW4va0FJTk9WTW8wajlDTmErUnRtMlNNeDFMMHdyV2M1?=
 =?utf-8?B?L3p1Q0d5Tksvdk1aYTZUcm1IZ1RNUmlpM2dCOGVQdjhRNWxVbTRTcDRieDdK?=
 =?utf-8?B?VDM0MVFQMmI0eTZ6WnVWMTJ6NGE5REMzVitkRkMyczBFYXk0UFIzYk56Njha?=
 =?utf-8?B?UmdjSVNtZmR2VGlYL0JPY3JaZnRCYStRcENlTTM3MnRZTm1NV3plb0RIMSs3?=
 =?utf-8?B?SWMxWWlQN0VKN2hXMDRWVk1RVm9RcjE2NXlmNGpNT04ybWc3K0Y0QWozSnl1?=
 =?utf-8?B?bXJQa3JLemd0MzVUc1grbGpvYVlLNjFCWEYzZTlVR1BOWnVURjJIZDVHUVl1?=
 =?utf-8?B?RHZqRS9mbHYrUXNHTVN6dENVdTJIYUZKNEs4aysyTzZxV0U1Y3J4eTNRc29n?=
 =?utf-8?Q?8a60NRAGPQ+9NrbYC2HX8AzEIlzeYa8F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ti82eHAwU0VWZi9TR0I4UGhEcWxPOWNudkxLUVJ1MDVpUzRHTm1Tcmx4a3h0?=
 =?utf-8?B?dVNTUHk4KzU1NW95T09HUU1yakIzNlhDbnh2QjhYVTcxYm9HYzNjd2NOL0c1?=
 =?utf-8?B?d3FkWUtpMThsVGdycXRyR1Q5QkRTVlVHRnZTckZTSmZmYmM4WC9saFNGY3p6?=
 =?utf-8?B?aGx2b0s2TEdyKzRLZUJwYkllcHVDNjQ3U2hmblg5K3djM0hmS1JhMmFjS1VI?=
 =?utf-8?B?Q1UyMHRDV3l3OURYQlhCa1AzZTBxMytyYjZvcUFGdm05TnFJNDlWaTFCTWxr?=
 =?utf-8?B?ZEZzaGJTT1dTcmFsWXEwQUNVUTc3MjNXTnM2M0FwNmNOQ1EvaDA4Q1AxbDBC?=
 =?utf-8?B?K3NtYklRU3hlOVM2RGQ0ZTFFL0tsT3hnRWFUcUovSzlCMGxXZkZTM1JYV3hJ?=
 =?utf-8?B?TjViYXhQTWRQZ2NlUWQyZUloanVpT3R6MXljRFBUbTByd2xCRGxQbXpEbkZP?=
 =?utf-8?B?czdaTW5CZEVBb3pmZ1ptMkRjUE9HZzhCdVppMmtCd25oMjJyb0YzbDAyb1pV?=
 =?utf-8?B?bkU4U0pkMjRLWTEvcDUzWkJGUXplbHl0TUNGdFR4TnV1UTkvS3BkbVEzSndm?=
 =?utf-8?B?SGRZSm5VMWtEL2VhZGlLb2I0ZnFYcTZnTU40Uk1JWWhLb2xVTXBIZGpYVU5C?=
 =?utf-8?B?L2VoS3NOQ2hRT0xKbXlaakwwT0JpSzJCRmNOVzZiaDdKN01rMUFIeUY2Wmpa?=
 =?utf-8?B?ZHFrM0VJT3JEZ2tqTFhIMVRhQ0o1VE9WZHEzSEpYOStoL1NmNVJMVDdDNHJq?=
 =?utf-8?B?c3R2OUdvQy9reTJianVxTXRnTGdWMVFHejFaQngwT1JtV2h1ZjRHV0tVWkEw?=
 =?utf-8?B?YmduZ0ZtMmV5M0ZZR0UxTlREQ2pLYU1hTWZFSU8yWGIxTVdvWUt5UzZZREF2?=
 =?utf-8?B?WkZ0ZGtKcVFVYjNJb1BkaHl0T0ZtdkwwN3hDbXQvTEMzY2NDZFhBWUEyUEVi?=
 =?utf-8?B?a0J0Q2hVVUU5TTQyK20wamxxWE94VGhyQ0xDOXErK2JyR2U2QS83YWJMUnNp?=
 =?utf-8?B?MjZYcFhwZjYrcmpPQUNjQWpEUUFLc0pteVJkTmxISEd6OWtzWEpnMXNnV2ZF?=
 =?utf-8?B?TUduZmFucnNGWGtydUxMMHhGbWUyZlZhWC9RK1pPckQxTFE5eTloZldkbmY1?=
 =?utf-8?B?Q1F6blM5Sit5dUh1UlZhNHpSeFdIZlRjLzhTQW9rQ2NOL0MxQndYcDM3S1pm?=
 =?utf-8?B?Q0hLTUo4VytGc095MWllc2Z5Syt2S0NvcDVRbHFEd0JBVlF6R01BY25YUFMw?=
 =?utf-8?B?Mlp6OHhJQnowV0hHK0VMZHlCOEhobDhNaHc5V1Z1RW8wZkJLRkFsRXdNc015?=
 =?utf-8?B?Z1N0Wmdxek9zODNGK3VnL293ZzhZQkV3cTNDblR4V2lCY0NjWHdqcWtBMVQ2?=
 =?utf-8?B?eVBlZVhmUmxYYUJlT0NIdE1TWDZMcVUwQkdsSWlRaDZ6bUppeW56R0xjWlZU?=
 =?utf-8?B?b241YVYwKzBxeGIzUFYrMFY5dytWSjRTNXJianlmRnJTd3BGcVk4OG9lL2I1?=
 =?utf-8?B?MmZlVTBOUGZsMk5KT0hPaFBBanFYdi96d0c1VldDelF2ZTBkZG53WjhUVERI?=
 =?utf-8?B?bHpvR3lQRlBXTjBtcElxbW9VRzJtUm93OGszMVNhMndRWkRzemlFU3NjQzR5?=
 =?utf-8?B?cytjSEdpQTFsK0tPcFZvcEY4cmlJc1RRaXMyS0hMTU1DSVROYjc0bHVncDIx?=
 =?utf-8?B?MURzK25VVHdzdFNKQ1dTMlNIdytoSllDOGZTbnIwVXFsVnRtTHkwREhTdnEz?=
 =?utf-8?B?bExUZldpeStQMGoxak45RGVCQWkxV0ZEekpKSXh2Yy9LcjdyMkJ0b09nKzJU?=
 =?utf-8?B?VS93Y3ZCTDVNNmMyaStIU3ZlTGdOS0hQZHhLYVdPWlFVVHVtR2c2czMwbEpt?=
 =?utf-8?B?RmpFSW0xZElqRUZSWm9ZWUtnTVNXdTNOeXJXRFoxOExwMEZqVld0cGtOMVp3?=
 =?utf-8?B?UHNheFZjTms4RHREMWdFVHd0NGJCVms0dWtlZ2NzVjc0Z3U4M2xxeGRXTGNs?=
 =?utf-8?B?cXE5YUgwVTB6YjZhdHpSNWVNb2xHT3VQblc4YVFZaDY4eEtrREdxUlAwRnUr?=
 =?utf-8?B?UlZaQ0huckRRdnNNYkhMQi91a1lFOGdWMnRJdXVaN3BuYjdPbDl4Sks2eEIy?=
 =?utf-8?B?MWZHajBhbnp5U2Fad0FRb0N1NVp5bDJHOFM4d3JHeWdhNnRMeXk5czRPZ25Y?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e992c87-88b0-402e-3261-08de31748859
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 07:29:30.8097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbfstrT4Z3T4BRB6MB1tihaLr/6/fn0ah3pQuj92lrrCT8MmeaKaHxNEp2aGWlvQIxbLGKf7eoRexe9DhGesLRrCguxMqxyAdn+jPmtpbns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8988
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

Hi Kamil,

On 2025-12-01 at 18:33:02 +0100, Kamil Konieczny wrote:
> Change card detection by using directly sysfs. With this on
> systems without Intel card or without any drm driver loaded,
> instead of failing on assert it will print one of messages:
> 
> No Intel card found in /dev/dri
> 
> or
> 
> Cannot open /dev/dri/
> Error: <errno>
> 
> when /dev/dri folder is not present.
> 
> v2: split out card detection to separate patch (Kamil)
> v3: clarify description and error prints (Krzysztof)
> v4: fix error reporting after fdopendir (Kamil)
> 
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Cc: S Sebinraj <s.sebinraj@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---

Thanks for applying my suggestions!
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
