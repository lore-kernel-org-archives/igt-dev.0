Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182DAE674B1
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 14:04:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48BD10E6AE;
	Mon, 22 Dec 2025 14:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJUy0oy4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD4C10E6AE
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 14:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766412261; x=1797948261;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NRikoxKHbqRvKARcvGH7lA9Y3EW5Vre9v6BF8wHnqRI=;
 b=NJUy0oy4nzmSOvR9u5Z77ay14x5QZpO62KXJDq7G5nhorm4QNXiHDBQT
 Lts1WYQ6qa72XHsKp5KHZphbJdApdDC2diwEn/NTvpxTU2KwSLYE6IKum
 GNeR/IYZWA3emM6v4yLX4eTWvCc2K5aRkp6LEE1BsD1ekcAZ5ClMxizrr
 Uh4dwy4dp+RDvxy6lQ2FelDU1frP4E/ZU3xtBLRvKAkJxllTPn3TduKDf
 XSgXZ60rCYG4OY9tDG/SfsrtWp7XAkzx8Wx1oHga4iD6dJi7ktJhNWVGt
 Hypuvqe8R+rMQKaY6GrBq2uLsVGgpLNce4UHhV610JAytQbn+te2MPdJo g==;
X-CSE-ConnectionGUID: uJ/3/GNiTtGdcbN57eH4IQ==
X-CSE-MsgGUID: vDoDMTJkQXKrr8PzEV8gmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72126616"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="72126616"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:04:21 -0800
X-CSE-ConnectionGUID: 7gWI2LKnTa2e6aVOoTYkRw==
X-CSE-MsgGUID: hjyUNgIWTWmfVmRmPA9JGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="230543442"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:04:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 06:04:20 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 06:04:20 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 06:03:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xgj3QCQ0gLMXo+h1dD0SKPUZW/INEoNpIuBSY035ix4/CHJ/cnx8vTSbKdBHxVoVnzxEezhIX1lCBKLeieiOcdL0z76iczJIAF+WeX7dtz78vNnfGlQgsUiMp2cuYe+RLMAjVNZuvYCizlBhPtwRV123IkUsxtXfxxOyAlJqcZxFcK5LAbnPV+o5wk0SWAUKLSo9w6Q8nWTyxP3bao3YZxqDF9t8Nj23cFvx7GJp2TO+c3udsrCDFfv+gpgsdXZ83dSCpWBZJMbd9mBzYf31gZnIqczvX22RKVrxWBdEma//n8DRJfMEx9o6h4wslxZqO4EQYFNLeLbn7m8KaVFxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKtdi08idiRgeWhBPQHmm9zvUeQloFleCginqAGblQI=;
 b=XoZwLbRSCH5nk1FIum9jPurckHcO2uE31eL+2fXMO4YjP6v6Qqe3vq4mdUGT0qUTmgc4+O6rc9znCwkhPvGUgXRakJGaEpqMBA1HpIvjUYVVQcP1pb/SfryseShY6621AhCGhUtIK68+C/pxrJQF+rj2D8Yf/RN1J0vY8CfZ7LAjJqaZExtIY7qhmreIfWaSrGXnipnSyGSs5Ao14li/6F1uxGuT30t+nFhtZ7MdmSFKVhGtRlRZihTAGdBop/ZceSWRT6vRpLxzbP0ZdWdHuD+X+QSP3Ws3r770/fLLNXh4fU2VJmsgwvJf4tV6nipQqF2vD5tDHAIrFOFMlg7ZqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB9520.namprd11.prod.outlook.com (2603:10b6:208:59e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 14:03:20 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 14:03:20 +0000
Message-ID: <23effb7e-7bf6-4da3-9d55-0132780278af@intel.com>
Date: Mon, 22 Dec 2025 19:33:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v7 2/8] tests/kms_colorop_helper: Add helpers to
 clear colorops data
Content-Language: en-GB
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251219112606.1330425-1-swati2.sharma@intel.com>
 <20251219112606.1330425-3-swati2.sharma@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219112606.1330425-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::9) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|IA1PR11MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: e4881dd1-0fbc-4dd2-8547-08de4162dcac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejJ6RitVQ2k3NVVSMHVQN0kxTVZRenN0WW9XSi9iZExqT1BPQk1XTlF0bElJ?=
 =?utf-8?B?NCthdmV3RnF0WnovRFdWc1M1QlhZM1h0dy9rMDRPdmticDZZaEpVdkdYWmd0?=
 =?utf-8?B?ejNRUDBWSHVaNkhPSHdhb3ZWOHVRSkV0Q085QWltRjk3TXR1M3ZkM0RRZFdX?=
 =?utf-8?B?MTZUbiswSktTT2dTcEhoZkY3NXAwK0s5QWYyVG82dG1TRGJYb3krcndyeXpW?=
 =?utf-8?B?ZVY4Z04yVFBhbDg5aEZlWkpHOU1DemlDQTY1RFQ4SWtRVFFxdG41NFJsU3U1?=
 =?utf-8?B?ZjFlWmJwZ2JLZXozQ1FFQ1RZY3ExcWM1RTBTd091UWVjSHJUcml0ZkVaM0VX?=
 =?utf-8?B?REZ5cWRIN3Q1YXBlVEo5K0FmdUREV0MxVUR4YnVhUENDWEhYU0paOEY1Z09C?=
 =?utf-8?B?QmtLZGhHdHQ2SERHcWJIY0F6MnJ3N2tLdmxKaXczWFVmV1h0dlh1OGJ6OHRr?=
 =?utf-8?B?UmF4NkoyalhIVkFwZDlkeDhiNm9HY1E0UDg2bDR1R3BnMmhqbjRjUG1zU1d5?=
 =?utf-8?B?QnRoODhrUTJaQkdTZ01Fc3k1SmlXdkc2cEtUa2NETXVwSkhQYjVWUkkyK3gz?=
 =?utf-8?B?T1RVcmxwaWdSLzMzZDRPRVY4bEx0UXorelhJcnY0OTZ0U21mbkpGZGtDRXBy?=
 =?utf-8?B?Yng3dXh3Z3pOOFpid09TNTlydnEvWmxQZHdJd0l0a1ZWQ3NHbkxoWUVHYURh?=
 =?utf-8?B?andyWCsxMGhEQU5nRU1qUXlJM0kyWHNIUUFscEtFd1lKMUQ5T3lqS3NiaCtF?=
 =?utf-8?B?MzdvVTFoUlI0dkJqQUJZUGh1cFFBQ1pMYjQ3Z3ArRnJTcy8zZ29VV3RQSTJx?=
 =?utf-8?B?SHVjQUJPNDZ4bnR4VDRqeE9lQ0p6V0cyZXdjdHYzVllMczgxT0grdnM0SERT?=
 =?utf-8?B?ZElmcnk3Rlg2aDg4eTY3N2FxTk9rSFE5dGI5MVJBYXpIQ3M4SDdvUDdxVVI5?=
 =?utf-8?B?eTdXUFg0SG1BZStJeEtVQ1I4bHk2UVp3bXpPTysvbzZZc2ZaTlplWGRPSFZx?=
 =?utf-8?B?REw2NG1kQzBzcUFUb0NEZ2pMcVhQQ3U4TnQrd3I4L3p1OUY1UEdrSG52UWE4?=
 =?utf-8?B?amlFZGd3b3F5b3J1ZlJkRUlKSUU1djM3Kzg1UzE1R3hLbi9tQVlpQkVkaWxC?=
 =?utf-8?B?QmxmZG9YTU9qeWU2MkE0OG4rV2dmcU5HYVpSb2dwcnFsdGRjU1FqL3RTcjVa?=
 =?utf-8?B?RVRKZWJPcWQxak05T2J4UXo2cDZDNG1EQlRKM3Zra3pPZ3VLbnE2dG9oZzRa?=
 =?utf-8?B?QXl5ZXkxLy9lWlNvU0YvdS9tS1h4RlRtRFBhL3JVT2pKMzdXc0U4eDdSaWhv?=
 =?utf-8?B?U0JmTEQxRTVCTnhSS2RGeHAwa3dubnkra0JMcS9jMTRnRmIvNEhiNGttWWZL?=
 =?utf-8?B?U2U0UnFoVUdpOUt3VE93U1VsaVFxR2xkdGVsdWlQTi9UMFVZSmVMaHU0cDA5?=
 =?utf-8?B?T1JjM0Z5L1JLSkNQbHp4Y0wzaDhKcUZiYVhYazdiNXdDU3Z0ZUJNSVpjV1lE?=
 =?utf-8?B?NFFZWkZ3bmVweTFIbURCcGduVTNEcEZvNHZIMnM3K0xqOVpUTjBqZ2NaTW5D?=
 =?utf-8?B?aUpFUFFyNUhHSHBoc1hqMjZETXd1WGFveW1sSDdSRUJ4amFGbG9CQjVwWVRP?=
 =?utf-8?B?QW92bXpLcFdhNmtRK0RZTStkZjgySzJManAwWktlNy9GazlnZkI3OUQyalEx?=
 =?utf-8?B?bTZoVE5OWXR4R2dUQlE5Y0lDcHllS2h6Wmk1K0pDQUJkUEpudE1mVGRPL0Rh?=
 =?utf-8?B?YU1ubUlUTHRhMGtLT0VEbVlXYWdpM1MzZFNKM2QwczZORm5Mdm5MaWQyMnV4?=
 =?utf-8?B?dnJMak5qNitmQjdrM3ExM0JzNjhTZHNZMldHclBHdFR3dGhlczgxY05lMExr?=
 =?utf-8?B?cUFMRDZER2tCYXhBT2hUaDdCeG5ybXpvVmlkUHF5WjhhSGZBVCt4S2VydEUx?=
 =?utf-8?Q?Y4cD/Sn90+Eq5Lxa1dDROK7wFJEN/Iwt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2lVV0Y0WHVHVlVwd1FzczBqbTZQNlZiWkhvNm1PbExIZ256Q3h4V1hzOU5o?=
 =?utf-8?B?d0RsTlI3ZWhMNDYvc3ZaMVJoQXNFNEJtTmVyblhqV1NQM0pzTGduNXA4SzI2?=
 =?utf-8?B?Mi90ajB1RWh4Y3ZLY2NWbHBWd0RJTXcvbTI3UE1LaldLdEpTd0FlcDkyTGFt?=
 =?utf-8?B?SU5WckhpWkY2TWRqN0hMdnRXTmFwUGE5TFV0aFlpUS9TdE5NRVRINzl4MW9X?=
 =?utf-8?B?cm4wSG1MbWJOTTF2Y3hzK1BhYXpMNngxaytuVEExTzd4MFJESDNHWlRuTWR0?=
 =?utf-8?B?N2hidWo5V2dLc1kxRUhTakNQbmVSWDNWMUdzQ2lwNHVtTmpBQ21xODFGaExm?=
 =?utf-8?B?U1E2V2VjaGpLbzRrZWxhaTZLYkFHVytIbGo0UVp5b085ZzRQSnE2VGlJMHg1?=
 =?utf-8?B?RXJxQmd3REFyakErYTVSL3FXUG5GSGRNZmd5SlptR0h0UWhlZ0JjSFdpMWZM?=
 =?utf-8?B?dnlCUUZmNm9aNkVHeng3MFVsalJOVGwyZzhmaG5nYVRTZDNrOVR3d1NMNVpQ?=
 =?utf-8?B?dnMrMDFIejF2TkhnUEZnNzlNOFV0c09RNzJNMkV6Z0FTOW12SFlCdERqTWRy?=
 =?utf-8?B?cjIrRTEvVnhVODVNeGJXSEdVczg4OWt0bzNNaFp4clJwRWRZQXFrS2NCUUhZ?=
 =?utf-8?B?dlpiWVZ3THpheTJ6djZjOWlRdmczZHNXRDl2MnNZTDB0NHA5d25vQmNqTFZv?=
 =?utf-8?B?NUFqcWlMWEZ5WFpvWE15Q2VoUUUvNWdDdXFGYWFXVDFEMWtPZisxNk55eDlr?=
 =?utf-8?B?bVg2T1JUTDc5OFd2SUpsUEsyN0dLQjNwMEdqVXRzbk9nTWk0NXVXUkdJRGsw?=
 =?utf-8?B?VDZoMmoreThjK0V0bEFZZDdZTVgyZUhIRzBFbkdwbEIzditDM2kxanVIZHE4?=
 =?utf-8?B?a1VZajErQWUyS3lIcTRXYStSVnd2ZFhzSk4zR0NFZHZSVHluZ3hDaEo0akw1?=
 =?utf-8?B?T3NvQVVaWDF2SzRYNGY2eHlicW9pY0tUQzlHcjIwWnZ0WllkSnpXNUFtcjBx?=
 =?utf-8?B?MEJWdGE0RGQzbHA3eDdQVjQ2VEJDOTJFaW56bHZTZ2E2YXJXNkJYWWxkTkFQ?=
 =?utf-8?B?UFM1WVROdFp1NWJOU0k5MTl3SlViSkFJbEhBN08vT0RaQVUvQVlPSjk1bC9n?=
 =?utf-8?B?aFNSOXVMbXAwdXdNb2ZJSWh2YU1LTmdwdVpBcHpSQmZaQ2dLY0tmK1pTaGE3?=
 =?utf-8?B?QTEvaFMyZHd3WFhZNGFZOWxyazY0TzFML2x5YmlqQWNHdWFBZWdSZTYxVWk5?=
 =?utf-8?B?U2hNd3AzaytuRllDWUVBdUtOcGxDYXFaVmNOV1hjcnVFalRKVEhGb1JwVDBI?=
 =?utf-8?B?Uk5xVitxOVdBVkV3TVliYkQwWFExYXB2elM4Yi9sWU9TNkdINnZBclc2ZUFi?=
 =?utf-8?B?d2FDNDZnRjVQS0RuekRoTm5SV0lSWS9LMzNTN2MzMnZ0Q0JDWkk4akQvMm5G?=
 =?utf-8?B?NVFmRzFrZzFIaElIZG9tMW9hTjRqU0p3RUhnMU9QdGh1U3NqYy9aT3VvS1pX?=
 =?utf-8?B?azlIMmZOTjFySmRrNzFKRWVXY005T2c0cFl1T1V6Wmwyc3RQcjRVZWtHUHBN?=
 =?utf-8?B?OFV0RGtPYTZwS292RFRmNGdmL0tVWWVBY3VnRHhtZ0cvdTU3ampaRTZjcDYw?=
 =?utf-8?B?c0x0eDRoaUtISTNwd21MaW53M0JLSEQ2dldYWnF2TXFNeXppR05MWWlPZllX?=
 =?utf-8?B?TjN3QzdHOG1xRy9wQWtWVTFhMGZvbEdPSlNadzQwckozZDJaVW81Rmo2TVZY?=
 =?utf-8?B?VWl5ZFI4bEZBK3RkbzNySzZRRTcyb0o4TlA2UmM4TVJ4RWRlWVgraUVsamRF?=
 =?utf-8?B?SnZ3clJ1d2pIV1ZURzFPR3A2RGk4Q2F6dHJiRnRoMVRzZnRWOUtjL2s4THd3?=
 =?utf-8?B?R2ZPVU9EaWhvQUZjNDFhT25tSDJDN3NmZVF0YXErcGZhNVFFNGZ5bUpRNHFH?=
 =?utf-8?B?UjlnTVluWEFyYUlHODdNU1lYVGJnZXg1UWNSK2Y5SEwzdGtyMURrT0MyNjZ0?=
 =?utf-8?B?NkFUQ3VjbWJWWDdySU9QRjNhTHduTFAzbmQrZGNraUplNy8zYkRVUmtUempv?=
 =?utf-8?B?ZHkzQWlzWnV0em10WUdTd1ppNmQvVjduajFyeGdjQUFQUVVCU2tFUVhuZ0tS?=
 =?utf-8?B?aUkxR0lLcXZyUDlNK3N0VXduV0FxTjE2dENHUHVTL3BZRHZVbFRDbkh5Skdz?=
 =?utf-8?B?c1BUUHdiOWM1Q1RGTzltdklrUkM1ekZ4NlNUZDJTWWFjNkJ3TTBScU9ZUnR5?=
 =?utf-8?B?VUVOUGM0cDM5UHpmSlFtQkJqUTZoYS9lazhOM1d3dHlmc3NxNUU3bnBxakZy?=
 =?utf-8?B?WHVHamp4TGZNTnk4bTdHRG84Z0dUNHRoQ3BWRkdrR2prQktidkl2U3lTMEJa?=
 =?utf-8?Q?kCUWshh4SOm23zkM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4881dd1-0fbc-4dd2-8547-08de4162dcac
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 14:03:20.1252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoldEmX3AwnVdd1llzjUEMgnPPxCQ5JQQ2C1TYsJBYjYp6E4mnVOOsTKwGwtrC1xzQIGLENknOrKAxwtVJIjd80fvj2fj3/8j+WdBhnXFqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9520
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



On 12/19/2025 4:56 PM, Swati Sharma wrote:
> Add new helper function `clear_colorops()` to reset color operations
> to their default/bypass state. These functions:
>   - Set the colorop to bypass mode.
>   - Clear associated data blobs for CTM, LUT1D, LUT3D.
>   - Reset multiplier values where applicable.
> 
> v2: -make internal helper static (Chaitanya)
>      -rename func() to clear_colorops() (Chaitanya)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_colorop_helper.c | 30 ++++++++++++++++++++++++++++++
>   tests/kms_colorop_helper.h |  1 +
>   2 files changed, 31 insertions(+)
> 
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index 6869590f3..da95ec72d 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -400,3 +400,33 @@ void set_color_pipeline_bypass(igt_plane_t *plane)
>   {
>   	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
>   }
> +
> +static void clear_colorop(igt_display_t *display, kms_colorop_t *colorop)
> +{
> +	igt_assert(colorop->colorop);
> +	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 1);
> +
> +	switch (colorop->type) {
> +	case KMS_COLOROP_CTM_3X4:
> +	case KMS_COLOROP_CUSTOM_LUT1D:
> +	case KMS_COLOROP_LUT3D:
> +		igt_colorop_replace_prop_blob(colorop->colorop, IGT_COLOROP_DATA, NULL, 0);
> +		break;
> +	case KMS_COLOROP_MULTIPLIER:
> +		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, 1);
> +		break;
> +	case KMS_COLOROP_ENUMERATED_LUT1D:
> +	default:
> +		return;
> +	}
> +}
> +
> +void clear_colorops(igt_display_t *display,
> +		    igt_plane_t *plane,
> +		    kms_colorop_t *colorops[])
> +{
> +	int i;
> +
> +	for(i = 0; colorops[i]; i++)
> +		clear_colorop(display, colorops[i]);
> +}

We don't even need display as a parameter here and probably we should 
call the functions reset_colorop*().

With above changes made.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
> index b807f122d..bdc812baa 100644
> --- a/tests/kms_colorop_helper.h
> +++ b/tests/kms_colorop_helper.h
> @@ -102,5 +102,6 @@ void set_color_pipeline(igt_display_t *display,
>   			kms_colorop_t *colorops[],
>   			igt_colorop_t *color_pipeline);
>   void set_color_pipeline_bypass(igt_plane_t *plane);
> +void clear_colorops(igt_display_t *display, igt_plane_t *plane, kms_colorop_t *colorops[]);
>   
>   #endif /* __KMS_COLOROP_HELPER_H__ */

