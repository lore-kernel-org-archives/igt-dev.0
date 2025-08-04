Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10E5C87FCB
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 10:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6B910E157;
	Mon,  4 Aug 2025 10:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTBb2png";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56E310E157
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Aug 2025 10:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754304069; x=1785840069;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uhFXBwl6WJaBIlH9G/Ns8vXFaiAgMzYFBLy9oVhE+3s=;
 b=eTBb2pngGP2+pHfEpfHtfWnr9Zhhnikb3oyTb/IlbwmHsnOCVbr3ZRQl
 plchZzsOtj4qt8TcDi4K11qW7wY4Htzf8oiATXLg4LxeHwjc+leZPlNRM
 TKcTaY+pymx/5SzBnlw8yJ6SJbbNl25ywyYrbNLmh09DAYxtT9YEpYQPg
 fTGV9TG+Fkmt5F2VthWthKyudKlTNBV14Ng7AFYfujgwdLNtXIIBDX7Qu
 kBXarhkmFFl56sYAK37aPlOnfiPWgjaFgDX0TFFljyvBv6TB6soGFTmgo
 kpuVxtmZxvvoLqet6u6Z492JYPJptNIlj7eVBPN4s/Yo3cSZ703d1Wbq4 w==;
X-CSE-ConnectionGUID: gMS2q2vlR0OiuqP7u83sRw==
X-CSE-MsgGUID: k6ePLo4HRkuZLYXYViIiVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="55611739"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="55611739"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 03:41:08 -0700
X-CSE-ConnectionGUID: MkQSUItvTgKGK5o4M3K2QQ==
X-CSE-MsgGUID: qYlL+ibHScOTAqvBTdNFFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="169510772"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 03:41:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 03:41:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 03:41:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 03:41:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BI7W+C1R5ny3qZg1fGlZBufEcFwPrTbWlOccWNpUtiggVAQAUlYY9+FGd7K7ixqHRSx/4uB0ZuiP13MkOaPsDEYf3zQld4H3Kal52Oq78wcGWo/97EBMUcy586QWYGHxyat9VfO6TjpZ35BXSJjBiYoCEaXa2w0Gc+Xeu70t0ipptdosqUrH9TnRVy5KQ40WmX0v39Dal9Zm0gZ0nj/e7FzamEKkOh6I22ncOUkTVgX/fNiZJtAgtsGtFQPmjMWiDr6WS0Mf23wdIDX4uWUngEyWIHV8S1a6fWySgBKn6fnP28PZ+1965wDj6PRLtaNZSBnS3k5ZmIsm99OhFb6f+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zOUmKQVFG/pCNfQe8ijENUd9D+Kxuck8kB49e7AJxI=;
 b=qdz8nPx69ffi46kCeH2Z8DrCEczzzCKDToN6d/S8pvOtXAieR4LJO4fFJRjMImW7+rOP8e6d7oUaJ3zpHearm55hev9Ot9E0/GYt7r1ZD7Qj3TIC0rUoaihizbK4ROdsiGEQPa5wU//nGNBrOUyzheCPHHByOledrg9qHxMCGx3CFNpAmbVhJ5/xIuMJTfOJ9KTRzUdNXFSVMxySEAnVRpzP8uLpsxI09U7Zxk8zrgTgdo1Adxxi43WDwqS656ILHuDpDYsjTJ83gG4RHvSLTTb1wreNR59h6Onn7/bYGu33rPOJJXJbes2BaAMZaA8kd8M2EHocLlEk9Bvk3dWS8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA4PR11MB9107.namprd11.prod.outlook.com (2603:10b6:208:562::22)
 by CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:40:24 +0000
Received: from IA4PR11MB9107.namprd11.prod.outlook.com
 ([fe80::6b7e:af5:887a:e384]) by IA4PR11MB9107.namprd11.prod.outlook.com
 ([fe80::6b7e:af5:887a:e384%4]) with mapi id 15.20.8989.017; Mon, 4 Aug 2025
 10:40:24 +0000
Message-ID: <1ec3e483-9cac-4825-bced-6ca33cd410af@intel.com>
Date: Mon, 4 Aug 2025 12:40:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/4] gitlab-ci: Rename blocklist verify script
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Ewelina Musial <ewelina.musial@intel.com>, Michal Czaplinski
 <michal.czaplinski@intel.com>, Petri Latvala <adrinael@adrinael.net>, "Rob
 Clark" <rob.clark@oss.qualcomm.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250728173152.220113-1-kamil.konieczny@linux.intel.com>
 <20250728173152.220113-3-kamil.konieczny@linux.intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250728173152.220113-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To IA4PR11MB9107.namprd11.prod.outlook.com
 (2603:10b6:208:562::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR11MB9107:EE_|CH0PR11MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a47863d-8a1e-4c5e-82c6-08ddd343514e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUVhL1lKbW85aEw3TWp2QnFIYklGbmRoMGZUVlRjcVVSV3YzVDNBZTF3MFA4?=
 =?utf-8?B?dlpHSUlTcmVuaVpoZlpmMGQ3SHorK0hxY1NlaEJDNXdWZXdqVEtXRHhYaSta?=
 =?utf-8?B?bFNVSnV3cHZ1WUpVSFJYTVFuNGV6bXR6UkR3SjZ3RkJlcGFFd3Y1YkNoZlRH?=
 =?utf-8?B?a3lwYzZlMnRtK0Z0VTdJck5OcURhL2I0elowdThNUkZVbGFhOHplZ2J0TXRi?=
 =?utf-8?B?RTJidEw3WG54ZWgxQmFXN0lUeUlRdkdZSTI0NysrVHBWNUhHZmIvVTJ1UDhJ?=
 =?utf-8?B?TEdwbjkyUDh5TFBTa0NXdGp0bWZqY0lqdVJhVDdFUmszNkI2dXhOUktWNXZ6?=
 =?utf-8?B?ZWpQTXRrVUtPYmxRZFFXNHpsNkhmUXM5MGlTUzNmWVFSQmVPeUh1aUEwQXBH?=
 =?utf-8?B?eEV3dEtsODRBTzhtSmtuTk5nekozNWQ5Q1FwSkhhbFVEUmtyQk1kalJsbmZT?=
 =?utf-8?B?dGdRMkdjaU5mSHpBZHJOV2g5UFpxQjhtc1o5MjlkMUY0NkVjSk95SWphQXRG?=
 =?utf-8?B?TzQ3eWZMMVNWWXJ2WnVYSnd5V0JSa1N1M1hsOThzMEU2YWUrdzlTZ3NKZHNX?=
 =?utf-8?B?a2ZhSDNvdDZPaTdqVW9iYzVOYnpFY1ZHMS80YkJLS0gweUV1T01MR0ZWSG1P?=
 =?utf-8?B?QnZ0ZEhXSFZLbjNUcS9OMFp4MnpXaXNMNGJYMWVud3ZZdzVqaVVQYzZZcjh0?=
 =?utf-8?B?cVVWU3Bxa1dHV09VOU5JN08rUHJiRFBJQ0dvaHdqejZpYWVPQ3lHSklIcXh0?=
 =?utf-8?B?SW9MQzU5OE1lUkNIZU9zdURVVjlJWjYxQmpWbi9ndlhsN1lzeE51R3E1a1gw?=
 =?utf-8?B?TjRhRWYyRjllV0FKb0phSnJWSE91bEEwVzhkc282cXlEblU5cnFwMUZURVBl?=
 =?utf-8?B?dW9ETmgwZ2JTQ0pDQmdYL1lkVTROWmFOZ2FZWVFUOGlDQW1MWkMreWh4ejda?=
 =?utf-8?B?c1hDRjU0QzAyMytGNjZCcWZVMGM0Uis4bnNQREMrbENtTDBTVjNPaGh3a01q?=
 =?utf-8?B?MUlEY2FHVmFVTFVSNW81cGVNa29OUExWRnZ5OTA0TDZ1NUVFTHV0MjVscEY1?=
 =?utf-8?B?NmtwZUYvZ3J3ajMzS0FTS3NVZHQ4S2FFbC9IbjNvUUJjVnlLT0Mva3c4aGU4?=
 =?utf-8?B?L0luNHNPUzEzNGY2UjVsMEVqRHV3WEdvd1RmN3hNb0RFd0oyb2QwMHBpR2x3?=
 =?utf-8?B?dGFqamZBbFd6bDJ5RzZ0TCtSc1FMaGtyNUUrU3Y0cWttbDRpK3h0YW1IUXdK?=
 =?utf-8?B?M0Y5LzllNFBWZHpCSjF0S2l0U0g1WFUySzM1S3RkbytybnVOL1B1dTU3RkdO?=
 =?utf-8?B?TG40RllkWklhdTJhWHUxV1IvNmhaMFFoekZlTXNSUnRuKyt1ZkV4bE44Rm1i?=
 =?utf-8?B?dDhseEswT2E3WGJkWjJKMXlJaCthUm1tUUFubnZ3SG9valhSQnFJNmdidDEy?=
 =?utf-8?B?eHo3Wll1UjZTa3hEWllTcFBwaXk1NTJQNXc3anV4WEl3UlcrRmtwa2l2dStL?=
 =?utf-8?B?a1c3UVJtdlExRjcyL08ybXJvbThWTDVjZ0pkR2RjVG9MSVRacUJLd2JGV3Z5?=
 =?utf-8?B?R0hnN0xnOUhhK2VDMUJ2YmZZVURUakZnWElwNUhHcVRqb2Z1L3JKZy9YT3pL?=
 =?utf-8?B?dHhoMFljeHIwZUhId0t0RkxvZ3l1SFFtbWdUZ1B1TlhTa0daMmRNVDNkQ1NM?=
 =?utf-8?B?WnhaVHFYZnI5c29IMUxNN3BXa1AzbVRzZ0RYRkNMcnBidzBqWkQxdmc4WGhY?=
 =?utf-8?B?clRTcll1eFo5SW9PWCt4MGxCYXV2UHJ4UnNIRkJreHhNNlg3UFJZaHVIdVVx?=
 =?utf-8?B?UlZRd2ZZT1owT1hQdzE0R1ZTVEJDZXZVM3N1R1dsdVBHaDI4V0ZFd3VBdnBy?=
 =?utf-8?B?MU8xcUJRMTE5NUlwbTgwQ3YxNXkxQWV5QzU0aTd4SEdiTm5mUUdxa1o1SlY0?=
 =?utf-8?Q?AT3YZ6SPHHw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFRuN1R2SkJKbDdHZHFhUmEyYzZhTGNSMmRDZXB4dGtUTFlLRTU3Tm16OWNY?=
 =?utf-8?B?T0lwdDdLbEIrRU1hTi92N2F4MTNLZ1Y5UmYrSzVBYlZjblk0K1MvZDFlWmVa?=
 =?utf-8?B?MmVMbWx2ZDkyaVJEajhyQXpBNTdsZTJZYWlxcXJ0OUZDMzVEMGE1UlZjbG5M?=
 =?utf-8?B?bkNLdUlrK2dnNUwreGZDT2I4dGtkVUVyVHEyT3ZZMkhIM3paUkc3ZERLT216?=
 =?utf-8?B?SjNXQ0RuaThHN2IzTnU4bldVeDBKOTVJQVNNRjV2eFNCajFLRUdLUHVHR1N0?=
 =?utf-8?B?ckk3Yml5NG42RXpXclYyTlBLRUtSVGpyNi82NFBMOUtDcjdEVXJxS1hHSTMr?=
 =?utf-8?B?WGZnbERoTjVJM20wVTVIa0RJR0hsMlJEb2kvWHM0MlJGcTBINUZGTEt6dkcz?=
 =?utf-8?B?TFR2RHRnYUZTMyt6M0hqaWFwT1JIRXpXTlJQbWdaanVXSDRjbS9LTzhCejJL?=
 =?utf-8?B?eUMrbklmT1pwQzN5YzRwa2dsTkxqMVFLalNiRU42Z1J6M1lSTFZCckNGVStu?=
 =?utf-8?B?QjNFK2ZQWSt6MUc2K0Q2eFdCc205THRncnRUU3BKcjY3RlFrV0hoVm1OZTdR?=
 =?utf-8?B?aURVeG4rcDZad3VaME8yWk1MWnJTOVlnOFNwakRibXRJSi9HZTNWc1BoSzZ2?=
 =?utf-8?B?QWJJb05xejN4aU16UFdIbktQZWZwNWpCYzZUZzRaVDBrUll4Q0RtTGwxbUxV?=
 =?utf-8?B?ZkI3NjNsRFhHSFdMZHlHSGhKcXlCOUs0MlZvLzVvSDE1UUU2a0M4cksxZHZ4?=
 =?utf-8?B?NjU2Q1lGaTBrLzVqTkFNR1g4dDJzdFRvMjhCblRrVzZNS2t1R094bFB6eFhN?=
 =?utf-8?B?U1l2bi94aFhmbGN1alZTNHdTNk1mVk5KbUJ0MTRDenI4cEpLakdqdjFwc0NI?=
 =?utf-8?B?UjBhRll6Y2VXQ1ZoOU5LaEVuZjRSL1V5alVydEVvZ3F1QVRlbUxHY21qODBa?=
 =?utf-8?B?RGNoQSs5alZwRlVWbC9EdXozNkYzRHc2cHI0VnQ0b3MwODJYMHhJUWdIVlVP?=
 =?utf-8?B?eFlDVXp4RysrNXZ2R3Y2L2J0bHlsd1ZSZVZSVzJhNHBCdzl5dGlWY2RqaExX?=
 =?utf-8?B?Sy82OTI5K2FUOUtLenNER3pDS3JYZVE5NzVCRlJNbFJWb1JwbGpNeGl1SW9t?=
 =?utf-8?B?Y0Q2a01LeHBhNGl5bG5vUzFtREdVWGZadnZKTU84eURrVVpiYmJNcXY5N3VS?=
 =?utf-8?B?YUNaWmlDbDl4UTF2WWVObmg0VWphMG95RXhEdW8vUGF6NVk5Z1ZqSEZhbW5Z?=
 =?utf-8?B?eTJaSWRLRGNCNWMzNTcrQlkvOE11Y0xBMjI4aUc5U2dXZkhhSEZWMmFzSlJZ?=
 =?utf-8?B?d25yZEZLWVMzRnI3RjJBanFtMGxIelpjSGExSTVjditaREpXKzZ5eVpvdWd2?=
 =?utf-8?B?U0xqRXlaVXZCYTdsRElZMVhFeS9CdXZDMnBQSmIydXpVbEZYVktRakgxN2R6?=
 =?utf-8?B?c2Y2a3ZEaStnRXQwYVNMTy9oMU1tZllNUXFWNHR5a0hnNmdqazRJUGRYcTd3?=
 =?utf-8?B?SFMzNkpmVm5RVFRPZUFpTi8wcGI0TDJuOVVXZkJ6Yng5cDdZUmZWVzNvTTVy?=
 =?utf-8?B?Z1ZwL3VTQVNWT0padHhHL3NDdEZLMHBmUHFpdExVK2IrWlhhUXZQWmlJcWUv?=
 =?utf-8?B?c1ljc0YxSExNNk9ua2R6V3ptL0UreUF5SXI3QlU5SG55d281YUhYREFHeXBk?=
 =?utf-8?B?ak9SZGRicitGdm56U2FBaXk2Yy93allQWnlqR2FzRUEvZzczeHFjelRkemxv?=
 =?utf-8?B?ZXVmOGhzYkt1b1EweEs2c0FvS1dtRE92eDM1Zm1YY3c4Zjk1MXFqcjR0Tncr?=
 =?utf-8?B?dFBTMHVQVlNGSzZaV0JVTFcrMUtmY1ZtamRRamR0L0QyMFY5QkgxYTlTMVUw?=
 =?utf-8?B?TGVla0JkMjd5cFN4cE5CR2g5SXVnVDduV0pLVmJTcnpDL0ZNMCtDVkw5eW9X?=
 =?utf-8?B?eEdGb1M1ZnJNdWJ1ZjN0bFllNDA2L25XTUY1Nkp1UkFrQ3hGdnJWbGpJVmZH?=
 =?utf-8?B?ejZwSDl6REtMeVQ0SSs4M1NYUUphNis4dGZjZzRvQVlvNUh0OC94eGx4d3Ay?=
 =?utf-8?B?cExsWXdoT1FTb2IxZDQ0b2xWbFpiaEZtdjZGRCtoeHVhWHpzYi9YSzAxLzAz?=
 =?utf-8?Q?qKqJD5ryB7gsM21caE2R4F6uG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a47863d-8a1e-4c5e-82c6-08ddd343514e
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:40:23.9135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSRYm+gFl19TkEy3IoqVOMGUmPAVXM59xka8Eo+ZDX1CttX9o+QG+lO9Q1ApsNLuM6pzLV1HmlH5aCGgNAylGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8189
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


W dniu 28.07.2025 o 19:31, Kamil Konieczny pisze:
> Rename verify script and also pipeline which uses it.
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Michal Czaplinski <michal.czaplinski@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Rob Clark <rob.clark@oss.qualcomm.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   .gitlab-ci.yml                                       | 4 ++--
>   scripts/{verify-blacklist.sh => verify-blocklist.sh} | 0
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename scripts/{verify-blacklist.sh => verify-blocklist.sh} (100%)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 8098f2b70..fb5713fba 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -227,11 +227,11 @@ test:list-undocumented-tests:
>       paths:
>         - undocumented_tests.txt
>   
> -test:verify-blacklists:
> +test:verify-blocklists:
>     dependencies:
>       - build:tests-fedora
>     stage: test
> -  script: for bl in tests/intel-ci/i915.blocklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
> +  script: for bl in tests/intel-ci/i915.blocklist{,-pre-merge}.txt; do scripts/verify-blocklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
>   
>   ################### DEPLOY #########################
>   
> diff --git a/scripts/verify-blacklist.sh b/scripts/verify-blocklist.sh
> similarity index 100%
> rename from scripts/verify-blacklist.sh
> rename to scripts/verify-blocklist.sh
