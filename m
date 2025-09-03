Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB3FCA1007
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 03:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE10010E1EF;
	Wed,  3 Sep 2025 03:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPKaBi2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D35110E1EF
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 03:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756871309; x=1788407309;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EJLc39s63FkYp6xiU75huMPtPVKxBmJ5m0+6Nr2aNLE=;
 b=OPKaBi2kT/2s1QSYpb/LSil+eg9iRp842W4oxIoP2ulsE0MonYY8FdvS
 67GCp8HNNhT5DWUszfroe6fOs7hX3HcHYKBP8m9v230+aYuryOv02nanq
 HjDCWbOIX/Ly9o5lfYnsWeDYERpQruOeV5VHnrSPw2XEi0A7N3KeQsNnP
 PtRKnjOG5NxpP4qtDA8CUFQL/ZlfixMrvc5V6+dOgkobHSoSgNfsUAL1S
 1RNlJcBUz+rwnEuz9mPXeu+XfOdCwyKgmmES4jGz8fbGCsKa6kuREhq54
 JCcwfnnyQq5tV9E274r0/fbrd/qhyta/G/b65OgxVvf45+TK5bAPWfhpa Q==;
X-CSE-ConnectionGUID: ChjxgyM+QDCPia/TTmfxnA==
X-CSE-MsgGUID: BmlWeaabT5Sv/JR9fVgSSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70603408"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="70603408"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 20:48:29 -0700
X-CSE-ConnectionGUID: iaXNl9CrQP+DTrchufA8GA==
X-CSE-MsgGUID: LsX6rktzS2mnGq7+BmpESw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="175840847"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 20:48:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 20:48:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 20:48:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.82) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 20:48:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9a+d+nCHbi//2ekhU/vTT04alXZfI17/2sqVU6NzHhTrRdifNAdTmEhyOwF0paQTValwxs3kckUVhKPCEfo7eRp4zWD7YAOTsJSxFB0m09O5QGmDjGbqha0FhTcIOoOLGkj5C3PKz4zMWqtRXI3jhDrPhKc25s+7+SbYQsDaRkCARHglxf+BbzvjsEV0e/HFLD3JVWx7cYNzCM7eu32wW41bnrkHCdmcxcqGdwxSCpn2HFaph5CITmc4FV2F6AgQttwBjgs5TTK3TG8RmXrRaBU+wnD+SAK2goGgYdH67b+desvGEpJP2O53o2R6hW0hHasHXLnLA0DyCtW7bw0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEdgldU1Mup0riKXTa2VKaEZU5YhQl6jH/U4DYyK1JI=;
 b=thESNMmlgqVwgFJrJUFGu3XNO0HiGoMC+yZiKeaxHbGD0Jvyz9WSyY0kKoe3vCGYGJybbnLPYW6/JmpfSqoWidxGbriAFzj9UMtUQPYAFN5UZrmCME0p0HCoK7M7j5VmHeRoKVz1L63v7f2iX5Uyeoc40Z7YWuT1cVLlxXWUHO2IQbrmrfz57Un0P3CgLifBJtOkftHS5eojm/7I8oHoTkZqCh3x8Smdaj3R1C+iO4wOaLJtm5ROhoqpa/Isz+yQHyMlPRq9d9RL2tW1K+Og84iiXyuVDjKWZT4BBmM20yu1nkvQGQsxR+AxXz8sOsBM188HAZ8SgHkDdIRs/lunNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SN7PR11MB7466.namprd11.prod.outlook.com (2603:10b6:806:34c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 03:48:19 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 03:48:19 +0000
Message-ID: <6bac116a-664e-4e6a-af7b-f7a14c26cf97@intel.com>
Date: Wed, 3 Sep 2025 09:18:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] lib/drmtest: Refactor chipset to string
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250829153454.129913-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250829153454.129913-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::12) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SN7PR11MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e00036-5608-4847-4ec0-08ddea9cb883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWpEdm82WE8wc3FzYkJzWWNsWm5oK2Q0R3lFbUFKdTdMZEd5Wjk1WUxCTktp?=
 =?utf-8?B?WnhUOUNnZU9CanZFWnp2aW90R0Q3VGdSb2pqdWxTQkh1ZUlkM25hSGRIQi9X?=
 =?utf-8?B?VVJZbVp1Tk5ZRzNuSFpucnFHNXZmVW90TnpmelVaaEJQZlF4WWNIaTZNREt2?=
 =?utf-8?B?ckxBTkdoN1JBUGRmQWNjaXJsT0ZvOHpTd0p5Y25CSzkrTkxGSDhHYUMvVXVU?=
 =?utf-8?B?Z1BxaWEyQ2E4cFczQ2hVUzA4M3N4U1pzUEpGZkYwYmFTMlMwZDNDdWlMa2hR?=
 =?utf-8?B?cVlmbGlKRTFEaGVHNWRScE5OTGVsWlpVTllyMnlxKzNleHNESU9MRnJISGMy?=
 =?utf-8?B?VnpGa2g2dWV4eEdQckMvZHdCR2sxNWZUc3Z6VnpwcERURFhzSmJiY3YvQ1JJ?=
 =?utf-8?B?dUdkVmliNFVyOHNzNXIzWjMrbjMrVGdTZTlhVXJFemt5elR5OFlHNDdESzNQ?=
 =?utf-8?B?cFhnNG1pZ2lzcGFwUFR3YWRjNEx1alplcnY5NHphWFJad2RQSU95M2VvQ2sr?=
 =?utf-8?B?S253ZlI3NWdQMFhiZ1RFOE1jemlWSmt1aVJHRStXSjd3ak5aNWI4a1V0STBi?=
 =?utf-8?B?RGZkL2h1Qjd4NTROdEZ4eEVNUGZsQmg0TFVwbFJzaDRXWG5yQWFpU0huYlhC?=
 =?utf-8?B?QWdHdGt6ZS92U2Q0d3hIeVZabTdSMzlRT3BmdERCQWNyR1FGV2xQQ1FOemVs?=
 =?utf-8?B?ZXBCU0hZZHd0WTRMTVBGU2psVEVKL2Ria3dmclp1MEZUampGWC9EVjI2Rloz?=
 =?utf-8?B?K0NGYk02WUxkZmpqbDQ4SFlWWVVIbE5EbWN1VzZ2QmV4ZlUvS1dQNC9JVllF?=
 =?utf-8?B?cjljUTNBQ29mUC9jVHlJWkhzdlBQRUIxenZ4OXdXSmlYOWNZK0MyT2FaUXc5?=
 =?utf-8?B?MmJYeHB1VlpDRm5KZUJOMGlGWWpuKzZ0RnlyVzdoa2xSQXl1OTkvNzJkeUwr?=
 =?utf-8?B?U3g4STVVRTNsTUh0ZFVQU3NPSHgvVm1iUG05VVExUVJzcTZpL0w3ZFdOQWIv?=
 =?utf-8?B?ejdnckV6RlpkWHc0RGtUdGo5Zk13aWRpamVwTUhNcGNQdEh3cUZ6TlM1cThy?=
 =?utf-8?B?U1RoeGE2c3hvL0RZVlhDSEZJaDJPN0xYQkdoVlRhQy9xd2p2NXAzNTVMVFFO?=
 =?utf-8?B?cmkydjJyOWdUWkNZNkdDOElrS2hkS2lTMjBjUVVPdk9yWHJoUndhMDVKVUFE?=
 =?utf-8?B?ODZ1WW1IYWNmQklqOUFra2dmVEtONzAvVzhFMzBjZFNTeVY2SUpLK3BIaWNr?=
 =?utf-8?B?TW9oTkNURlAvdTY1UUJBMXJXbWFidzMySVhOUmQ0WEdISmg3YkFTVFplMVdR?=
 =?utf-8?B?U1RtZGNheTh0eXY4cVViL2hhbCtFdU4rMlNHc0RTWThkaFBtNjFEc0hPQmNo?=
 =?utf-8?B?MFNoUSs3c2duOTB5clo5UWFsYmlhWGFzVkd4UGQzTThYeEdjMll4NU5Gd3R6?=
 =?utf-8?B?dWRiK3B2andualdjcElFeUlXaWlZYU5MbmdOcGpySENSOGczMjhaYzgrTTBP?=
 =?utf-8?B?WGphSW82NFhqRmhaVE9GL2k2UW01aFZnQzlkUlJvc3Vmd0ZIWE01WWFsd1hk?=
 =?utf-8?B?a0kwTVZUV2JLMElTaEljZDQxc3R5Si94alM2aXpLeDExUWtJSURjV0RqbWd2?=
 =?utf-8?B?M29scG5lWjdiMHVHZVRSV2E4VmoyeUtlVXo0akJkZEp5S2pkUUlTdVlRVXVN?=
 =?utf-8?B?eXZTOHJDNGwvQVBPdTJRbmtROG51WUZabHl4VGxnTExtaGtibmVJV0hDSENn?=
 =?utf-8?B?V0VpR05xQTlxaDlTZlRvOFJzRzVyQ0dZakpSQVpUdFVrMlFiajY5T0ZSYTlG?=
 =?utf-8?B?eWZ2ZGIrbVlkb1JidExGNnpDcnZMS1Jrd0g1SUs1MlJhRVplTDZDQ0RaMEJM?=
 =?utf-8?B?RFRQY0FIL3ViUGJaNVNabVhud3l1YmpqaGlLR2hXMXdIRTNzZGZITHpxS0ZY?=
 =?utf-8?Q?7yYnf26IfSU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekpNenl1WUtLYU1yMW9jd0dtWTc0U2RaK3RnL1RPY2ZEcURlb0tTRlhVMFJN?=
 =?utf-8?B?SVQ5aFVJdThab3FXZ1FJSDhxSGREanc0NHhSTnJUMlJmYjdsbkpWWnVodlFy?=
 =?utf-8?B?RjFGVnorWitXL2h1Q1lCRGdrSUxMeE5wKzlRWG9Wd3VXcXVRTmxFVExRQ1ZH?=
 =?utf-8?B?Ynh6ZDFSWnRWdUJQLzlpVXlQZDJGQTBEWEw3RW5BT0xqWlIxQ29qSmN4V0VL?=
 =?utf-8?B?TGQwemZpRHNXVHZTR0RyNTBBZ09CSzZGUTdteVhhbFNNa3ZQL2x1NVdXYUdX?=
 =?utf-8?B?cDhWMFJXR1hja01vRU05MWNMaUd2UElRSE9Ndkg0elNVZktlL1lOWWtLME8z?=
 =?utf-8?B?UWMwUUtuZXJXR1ZVM3R4QU9vZEJKb0YvTlFPUjBpWEp0dUlLRmNJNjAxeUxh?=
 =?utf-8?B?Y3UxbCtqRjJaNmxwTWtlV3ZGNjg0K3ZjcFNKaDFmSTMybWtOZUx1ZXp0UGpH?=
 =?utf-8?B?SEdvN3djYlh2akNPL1lrQUhxSzd4b0k4bWd6NUdicGgxajNmbHZtWjVMRnBv?=
 =?utf-8?B?SE9JRXRDcG9aMExqZFc4dWo4VjhrRU5uWStpYUwvWEhpL0pQNEVJVzZ5VnpS?=
 =?utf-8?B?dnBaaVlHQTlHNmxXd3VkNVM3dkpKRFRzTjk1LzBubU12VmZvR0dhNHFzOUp0?=
 =?utf-8?B?bTBGbzM3ajlnektzNVJzcHNHYm1iY0grNDNFaE5odUZLd290OUJpcmFYRE9C?=
 =?utf-8?B?ekdpcFpERHVXV3pTQkkyRFc0RXpTN3V0WVprdDltbUx6NWpyMFdOc2F5dzll?=
 =?utf-8?B?ZFJTckxXaHRvUkZTK2xGSkxFTmFnTjlSc3JQYnd5MGZZWGloa0VKQTJic2sz?=
 =?utf-8?B?Nm9xNUlWY21FRkZZSDRhSGZZSlcrRHc4QkNVeURQTTBhSGdpa3Jvb0hkL2NV?=
 =?utf-8?B?RlRrZFVJTW15RXkxQXZCSkN0b2JJYU1tY1R4bnRzanhIbFNxcTJKaUo3Mk9i?=
 =?utf-8?B?K3laSlpoSG5iYVo4cGxVa1lPM3E5aGhOdnQvOEtxZDJDbFZyTk01UGJXWFht?=
 =?utf-8?B?cEEyRWZuUitsMEhFYlhCOXRaTnBRK3BCNHoyWUE2ckwwU3ZYRm9YWWdqbksx?=
 =?utf-8?B?Yld6bU5pMWJCQzZRNDZBOTdaVExVbWFqWDZXVGIxdjRjZXdHTnhwY0J2aUhG?=
 =?utf-8?B?UVRlbUdkTURtV3R6eTM2UnIvdnZqaDVkSmhSRHd3Qk0vMUxGdXlGRW5mNXpW?=
 =?utf-8?B?eGo5LytQQnppTmVLSUtqZnZCeWR1d2lWa2JWSUY1TVh2eXYxQjhkMTU1YmZv?=
 =?utf-8?B?YWQ0OXhhREM5anFmbkhGWkk3MTVYemhXZDVUa25JU0U0Y2xzcFB0d3FZcTlk?=
 =?utf-8?B?aElVMXRQb1FnMmpoOUpKNm56d2pVWlBaYUlHUTZNbjlXNDdBTkNpdjRINkZB?=
 =?utf-8?B?WGs2eno4dVppaklkbkFjK3FCdFZwZFFOMWZyWmJpenR5UlpyLys0NnBuckor?=
 =?utf-8?B?VCsyUVpVdTl2WWhzbWVrOG16ZzQ0ano0WkY5SGs2U2wwOUtaZStvRThHRVIz?=
 =?utf-8?B?cjk3VDQ2SWNiclloVjRlbkhQajIxaW5CTVp3N1JzRkNmQ3pZSHl0S2E5bVE2?=
 =?utf-8?B?M3RtY29YZE9KbHNBNlBuOE85cjZrdy9USThDS1JMR3ZqM29TeWdyOHVyQkRs?=
 =?utf-8?B?eUxSRlpyNHdQY00vd1BJZHdQdk45NGdQWi9YdHd0bitMQ1ZLMXFzYkt6QS95?=
 =?utf-8?B?RXlXeWZhM0FtazFWeTdGK0Q4YzlkdU1LcThSQ3ZlOWFEYVV0VXJJNEdqVjRl?=
 =?utf-8?B?NzFIS1o1cWxhNzZRN0NkVVdJeGpzMitXN3RzSjU4TmkzK2Y1Zy9pZVlKNEtD?=
 =?utf-8?B?blE2VC9IRm1nNU5sQWxCejlGaVNuOFAzcWxJL1FBREtZVnhxQ2xvdnpnakl2?=
 =?utf-8?B?OTRZZmVxcHR3bVNaOWxlZTRJZjJyRnQ5djZaMStUSThQRE5TMGZZcmtKOStI?=
 =?utf-8?B?ajhZK1hvS1Z2a2dJaDdoNDlaN3FWMG05VHhJVU92bHdwd09mZGJxdmcxZCt1?=
 =?utf-8?B?TC9OcXRTdTFzbHpRb2N5U2xmWjdLUFJIay9wZDFQRjBtK2dTay9PcVhvd1Br?=
 =?utf-8?B?Q1ZqditOWHVuVDVMU0NhbFJOSlNUQlk3YXJnUTZyUjZISUlPakZqQ01WcjhU?=
 =?utf-8?Q?IxcPjYNtKmAyxQH49xKPM2Cs6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e00036-5608-4847-4ec0-08ddea9cb883
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 03:48:19.1437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8tuWX+ZkqnuiaWEIRgOviMAD5Adtl5CbOzbX4UE47MX5Y+nOqAmxNyM8il4gmBqzxKEANvnbepWr4PQC4edwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7466
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


On 8/29/2025 9:04 PM, Kamil Konieczny wrote:
> Currently chipset names are in modules array and almost all of
> them are duplicated in function chipset_to_str(). Refactor this
> function and remove duplication.
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   lib/drmtest.c | 30 +++++++-----------------------
>   1 file changed, 7 insertions(+), 23 deletions(-)
>
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 436b6de78..1b871fd1b 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -276,30 +276,14 @@ unsigned int drm_get_chipset(int fd)
>   
>   static const char *chipset_to_str(int chipset)
>   {
> -	switch (chipset) {
> -	case DRIVER_INTEL:
> +	if (chipset == DRIVER_INTEL)
>   		return "intel";
> -	case DRIVER_V3D:
> -		return "v3d";
> -	case DRIVER_VC4:
> -		return "vc4";
> -	case DRIVER_VGEM:
> -		return "vgem";
> -	case DRIVER_AMDGPU:
> -		return "amdgpu";
> -	case DRIVER_PANFROST:
> -		return "panfrost";
> -	case DRIVER_MSM:
> -		return "msm";
> -	case DRIVER_XE:
> -		return "xe";
> -	case DRIVER_VMWGFX:
> -		return "vmwgfx";
> -	case DRIVER_ANY:
> -		return "any";
> -	default:
> -		return "other";
> -	}
> +
> +	for (int i = 0, end = ARRAY_SIZE(modules); i < end; i++)
> +		if (modules[i].bit == chipset)
> +			return modules[i].module;
> +
> +	return chipset == DRIVER_ANY ? "any" : "other";
>   }
>   
>   
