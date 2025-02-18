Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F781C021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 09:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E065010E63C;
	Tue, 18 Feb 2025 09:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VauA7y/Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF7C10E63C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 09:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739870897; x=1771406897;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6luYlx8dUGui5qQlzdohwfkNKWFg7mpwBcPRFVBD9Kg=;
 b=VauA7y/QsadPVHjaVLgypl5QQSp2fiMmKibzORmy7cE+oYbPcuDZ7GOj
 Ev2WGY/nrHs+gRJzxs5W8L46WM/aELNBR7DEaoMLnXHEqGR9vlFZ6QD69
 ijtcebP9uiKu4WSj4/x/5EgEFzMBlhhjs9QyAAxLVKsNC4gZ04K7U08m4
 IRYZ+lao35+GZAekeI/qHP3UHbyyRXOUUU2ReCb4KNFQxQn46mBgrc1VY
 h+N8K2EIwYqvXFL7XOMIhLd1ODIU+QYMNwksvvTIKRqO+elxtukaL1FU6
 Ot8Q0tUwVYCpeJQ8N2CuGtK7FWMWSFUw9zS/Pe9ZZqzFvbHdxu0f4pySY w==;
X-CSE-ConnectionGUID: rEZ6IcusRAKyBgaC54+cLw==
X-CSE-MsgGUID: cL+LyW27SSWftNJ8hd7JOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51963759"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="51963759"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 01:28:16 -0800
X-CSE-ConnectionGUID: cdU27Z8pThieq6wdBpYyuw==
X-CSE-MsgGUID: gl6fy7gRQ7iddV6s6T6h0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="114536039"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 01:28:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 01:28:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 01:28:15 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 01:28:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIntt9rtF3strQq2cVQ00JrEz8t7tbcXSXS+X1KzC/ULODGtJITbILR5XXiggiV7b8hNVbUIkFGodBiEZFeVNVYc1F/+WBiEmVM2jchj9cwr/O/1pbw49evMThGqBReM831BOhB1IF7OBqWIAyAGBvuOJV71bLydxWRb0ykFcNxc4EX2VQ4LnFay6NCli4epxyJ/L0cRa10uXQJd5t5N+OGk0arek6PgJ66UAV+8wXK5L9weT/cXd2jIi0Lzj0/s/8YTYbkrXQiZAt+5C/nM4ukvObiQzhCcGXblajxGm9cEG6JG0ssOmC6iUPmsywisbglwYj0Seg9YpaiwREnrwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L51syxXf9XcO3+0PBKTL3hVpjjmxYIWcgHP1NzcskaI=;
 b=SCr4astoBsaQIncS5BOqkAuElTq6YsXnurWC7kjF8sScWqJ/+4pxZMro4z1RTW9HK0oh2EeIdAHAwT6IHAJawTckjL3H7bggLNtPgmB23fdmBl1oFHDMRLhhxJnL8ida2F+fl/bxssHEVzOussM41+r/XjS2o6Pbect/bs69knAoMou+cPr75OUDK3k/4jve6kdtsXUPfSJwz8FamIWtQIkW8f10Hlyi+ieuohC+4TKd/BTkggIHThb8pgn344Izd39i5SEFQT3s3+winXbH3mxazoqXNct113AEuDlYzqfuS51iekoOEHIyy2lLyeSXup1d732tM2nPs+o5M/EKxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by LV3PR11MB8743.namprd11.prod.outlook.com (2603:10b6:408:20e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Tue, 18 Feb
 2025 09:28:11 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 09:28:11 +0000
Message-ID: <d91a9407-1994-434e-bd7e-0abbfc61b9e1@intel.com>
Date: Tue, 18 Feb 2025 14:58:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] tests/intel/kms_frontbuffer_tracking: Skip fbc-*
 tests on BMG
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250109055652.405793-1-mohammed.thasleem@intel.com>
 <20250120061017.34236-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250120061017.34236-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|LV3PR11MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: f39bea87-f5e7-45ef-d731-08dd4ffe900c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2JLalltR1VEUTJtM3puaVpqVEhlOWdkQTQzM3BvREF4QjJCaTIzb21Rdmpj?=
 =?utf-8?B?Ri9IUW1wa0t3bDNXTk92UjZJSzgza0JYRzlvTlV1QTlxUFhHWG1pMTFzSnJs?=
 =?utf-8?B?cDFaMGdvT1R0SGRxK3hjdy9LZG9VTHJMaTVaWndQWHZ4VjRPT3FKQmE3SVE0?=
 =?utf-8?B?NGlsbGNoNTY2RUx1YTRKY25VN1JNVjFLcnN0VXkzaldHRnNOaFQ4aHhGMDNY?=
 =?utf-8?B?YTA3aFZEYVQrZDF2cFFyaHBJeEJtNG9lM3FUYlhCWGF2OVFqOWtvaFE4OGR6?=
 =?utf-8?B?c1VyYlo4TTVjaklMendTNFNFNVBqc1VZcU5mcFdJc3EwdVNWTS9iM1dhVTM5?=
 =?utf-8?B?Q25tUDB6ck1NKzVzcXh0NWxCdHVVbjkvU0pnUGZZR3lCYzMwRWlPWUxlK09Z?=
 =?utf-8?B?MmUxU2tSc1dOQnlXNEFrZHdPWEVoODRDdmxJcmFObWNZdUcvY3ZVejluVW5o?=
 =?utf-8?B?NUpndUhTODNPNFl5cFVPSHVNMDBKcURHM1FrdDZ1cjYveWZFUzhMQnZHNWpX?=
 =?utf-8?B?TXhvQ2c5dUo5MWIwcUtmS3V0TUtGNjNaWm1MNExxUytLMVhWKzAwSmt4bWl0?=
 =?utf-8?B?dzdhYkE0ZGduVGxWWjFDODM3Y1FWSnI4Y0F0OGNJQkFWeUlsVUt6VlZsbDRO?=
 =?utf-8?B?cnd0dlViZmZSMzNUNkZvN2Qyb0FlRjFkV3FEaTZOWGxwbDZmN0YrWXlCRlRa?=
 =?utf-8?B?Ykw3THRSeUo0Vi8wOTUrQ2xjWUNvMmVUcnZFQlZpWnlnczhIWWN4dVZDZDlT?=
 =?utf-8?B?VVcrdkdWVlZLbWRJVjZPb1ZRWUFLMXM2VzVMTFErN294UkRWTWhVTW9lUnlB?=
 =?utf-8?B?TVFQUXlmem80MGx4S2tFV3VkZURrWlc4K0Y5dTl2L0RhSWJrcDVmZTF1Nysz?=
 =?utf-8?B?Ykt1czdkSUZqZTQ5SjkycVJyUTdFemd0Y29FNVdkUUEzR2wzZjZyT01YZjZL?=
 =?utf-8?B?ZWl2OThKUkJnSzFVaWovRUR3aHF6RjBtVlR3UDN0REFOQUllYUovNXhqbDc3?=
 =?utf-8?B?djZVbTd6dHdaYVJLalpWOHBxS1F1Wkprdmd2YVJxVlJOUFpTM1BSeHE3Qm5E?=
 =?utf-8?B?YUFnRG9iYmU4N3hYRUZDK2RENzArV3BmRFNielNsSUs5eGkwRXhQbHlZSU5m?=
 =?utf-8?B?S1dDa0FNbTd6ZzJwL0FFOVNDTVBoUS9wUFQwanZjSmxYejJJWHlzTUFZWGFy?=
 =?utf-8?B?WXdCd1ZPaXYvTEx4dmdpSEFqSjRpS2VkakUrN0JvTVEzaDRUTW1UTmttQTJ5?=
 =?utf-8?B?R2ovZWVDeDdUZ0Q4WGVTZE9PWTJpYloyN2VybG4xYmVJdUkycUlwOStqOTg0?=
 =?utf-8?B?eUUwRkljSFk1TUErZXZEVStGbklqNkFTY3oxZWlsbHAyb1Y3SmVQZ0tYb3JL?=
 =?utf-8?B?L0VXU05IazhWdTNRN29EZXV4ZnBDUGFnVklQZTRGYXVCMWZ2RkdFWmpkT21I?=
 =?utf-8?B?c28zK05peG1xOU1WUnhjNE9wWVZYOThuV0MvcnVGRzFLTjNBbXpHVmowTnV4?=
 =?utf-8?B?aDBSYkpqZHYvSTR6TUF1NHR6eXlNTm42YWNDVHU0MFVUM2VlQW5TV0hJaVRT?=
 =?utf-8?B?MnBaNEtzai9rQjZkaDN1emRzUnl2VHUwZDM0WTJ5K3ZObndWY1l1bXIwNHQ1?=
 =?utf-8?B?Y0dnT2RVa1JtV0JtZTRGeW5Lc01odGFqNnJlUVZYbkh0ZTVzSVByYmZEcjRC?=
 =?utf-8?B?RWZpbTBVWStwWWhrVG91dDBqdVFjZmFwTlE3NFdXTVVLcWdyU1pTdk52M3BY?=
 =?utf-8?B?d3BGLzhqWFZjenJpQXdFT2pXbDZxWEVIWlgreE95OFdvSm1mbnFyQ1RkT205?=
 =?utf-8?B?d1lmdWtUeTRUcEprNXcrUXQ2cENidmxNbG1rUnhvSnZTRzNBVTkrMGRQR0Z3?=
 =?utf-8?Q?RG7DLse/FthFD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zytzc1d0cWttRkNTWjhMaUlkTnQ1Z2lwdmFrZDJGUDVxRUYwL0htT0ZrM0s2?=
 =?utf-8?B?dXYxaXJ2WWVTZGJvSjN3MmhPZVJjc0NhMVdEOG9MN1g5L2paaDNkNUdlS1ZM?=
 =?utf-8?B?bDYyVUZoRHdSRHByQ25Hb1haZndsckNmVWFFTVFpcEpacXcyVitZdXpqTTIr?=
 =?utf-8?B?am5CMGUwTkJRWkNhQVgzeW1KYnQzZGJCbXhLaUNnQ21KcmVQRlN1cmI0VEsw?=
 =?utf-8?B?aFRXZzk4c1FMVHArOUhNcHJQdW9vV04zcDR2WmZTNHJWRXZmN0Y2eFB1TTV2?=
 =?utf-8?B?RWptOTVWcFI2L1gvMGR2UHRHNjU0ZjQrNkZVcXF3Y1NjRk5teWxJbXplSWRl?=
 =?utf-8?B?RzFlbDdkcEJoSHVVRisrb0FnTjVDdlEvSHJtQXBJWXRtKzI4MHdYNHNDejlq?=
 =?utf-8?B?SmZLMW00cmMrdk4wa2FQRHRKWnMybkdQdGYxTXUwVzdKM3QvVEcyOGFDZm04?=
 =?utf-8?B?bURsdm9LeUNPYUZUMkRkQjdETkwyMWZZekYxdWg4TTRhekdMd3E2VHpzbS9N?=
 =?utf-8?B?NkpqRlBxMVR2SW9wMVhYVXp4Q2FsN25UZ0NSRWttUU5sNEdSdGZiODU4bkU2?=
 =?utf-8?B?VTZ6NFNQRlFZcDk5WXNoVExaMmFQeFB1UGtkQWZwWGcxRFJjUk1BRFNRZGNB?=
 =?utf-8?B?ckVWalJWQ2NQZUZ4MHZBOFZ3YXpmNG1oS0VrWjNtMVVJY3pHdUNXdm1FMzdm?=
 =?utf-8?B?VzNJOVhZYW1Fc1AwNGxuNjZOYVlJWEtjdEhnUmpwN1BNeU9meDlQM3cwaUVQ?=
 =?utf-8?B?S2ZONytrb3JUcWpCN0ZIM3VJbU5FMDFoSkVNdjhWRWYyaDl6bFdWN0QxRXJB?=
 =?utf-8?B?eUV4MU5BenR2U05ZdHpYSlRNbzFmelBuOGZnSkRPWEg5R0U4NGNXaE5oS3g2?=
 =?utf-8?B?emdZT0FPeWJPQ3pBT1poRENMc2FKcDNUUUZRa3FjekhIbjVSMFV3eCs5OHdB?=
 =?utf-8?B?cWFXZWFaalRwOStPZi8rZTRpdUd2a21tWnZBamtkM2UwVGlNOWd0cFd0YXBG?=
 =?utf-8?B?RDdDNGExQitwcWQxdGNhNC82OWw1bGxURDNpd2M1bUVYRW1xcUNaRGwwMWt4?=
 =?utf-8?B?MVk2TXFTTXJtTi9qWFI2UTZaU01jdFpNcjJkeGNOREFMOFhmWFJ1Szh0R1ly?=
 =?utf-8?B?NzdOREJLOU1zWjJaT08vSlhISUtEOWErRFNzYktyVVJJbHFObm4yWDFjbXNT?=
 =?utf-8?B?V3FRS0hmUjl6bjYyYzZmaC9JQ3R2Q0xCTDA3T1VqU3pNWEZRanlJRk9EVzRO?=
 =?utf-8?B?ZzBYUlNiTmgyWUJLZjNQMXc1RDRNbEtScE5yMDFWd0huTmhYcVBBT09CUnUz?=
 =?utf-8?B?OCtBVnh6WDhWclFzVjZLK1VqdnlSNVEyZ3FMMkx5R2FRQlBHSEpLNFdYcVRi?=
 =?utf-8?B?K0ZFUGNobnlrbVUwUlQ2UFA2TlFuTG0xWnVvQTV5cllnbG1TQ3VLYkIzSTNy?=
 =?utf-8?B?a2RONXZLUTdPdTRsaUduckg1RXA0OU0xOGdnYTM0QVV2ZUl3eXd3U3FSaVd2?=
 =?utf-8?B?cHBFeUVsU09Qb0Z4RG4rbVZVWmxzK2lrY2wycnUwMWpqZWY5TEJ1S2xQV2g0?=
 =?utf-8?B?RTNlbTFlWnRpRmhNYnBiTm9QY1FrUExFcVhmQ3k3WkpSSDNJYlhhSHV4cVhQ?=
 =?utf-8?B?WGxMZVk2OWRGY21iaUxLMHBlYVJxR2xjSVJDYWNxQi9Cam84Mk5oWFBBSlZm?=
 =?utf-8?B?c3F2bWEyUXR6Vk1nNVdDMytwNVBNZURrNWJmdXJTaUdjcU1QN0syUCtzWTI3?=
 =?utf-8?B?eHZxZXpUaTdCdm1WUXQzS3BWMkRFL0xUVUFUdEF5R2NRUzBZZCt0bWNnZWFI?=
 =?utf-8?B?NzdCLysvMnNJR0t2RUF5NC8xekhpcHdQSU9pMzlseDZZenNVaitzZmE2S2xY?=
 =?utf-8?B?eEpQVnIzOTJUT3ErZ3o1dnJ6L2FsNGlxbWJsTjQyTlpNSlhPWWI5L2cwc1cx?=
 =?utf-8?B?R2wzWVpvRlM0RmVwQ05RMFdHYzhiemtUdjI4SHpoSElEYTlwRm5GWkVGc0JZ?=
 =?utf-8?B?c2tiU0QxeWlZZ3dsVWlWWksxcnlidDl1RThQMzJsTVJrdS9Hb2lOVHRTWlBD?=
 =?utf-8?B?NVZ1aGtwQWZrYUUwdFVaUngzdU8zT2V5a3VrckhQWjVqcnhOQVpET20wTDlu?=
 =?utf-8?B?RTBhYzNNU2x1MkpabTdEVU5rbURFcG5leG9mYlVGL3pHS01Ha0tLcS9FTVUx?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f39bea87-f5e7-45ef-d731-08dd4ffe900c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 09:28:11.6644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6toeLJ4+SEUTWeFYGfxMfEAbolquCY/m4eCUheJW4qmk4tOMV0ModPSIhVZ/kms8Tgm91rEh8xZWO0lt8NzIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8743
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

Hi Thasleem,

Patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 20-01-2025 11:40 am, Mohammed Thasleem wrote:
> FBC test isn't supported on bmg, skip the test on this platform.
>
> v2: Add workaround id: Wa_16023588340. (Swati)
> v3: Add workaround id in code.
> v4: Updated subject. (Kamil).
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 3d833864a..21bbaf61e 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2755,6 +2755,10 @@ static void prepare_subtest_data(const struct test_mode *t,
>   
>   static void prepare_subtest_screens(const struct test_mode *t)
>   {
> +	/* FBC disabled: Wa_16023588340 */
> +	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
> +		      "FBC isn't supported on BMG\n");
> +
>   	if (t->pipes == PIPE_DUAL)
>   		enable_both_screens_and_wait(t);
>   	else
> @@ -2799,6 +2803,10 @@ static void prepare_subtest(const struct test_mode *t,
>    */
>   static void rte_subtest(const struct test_mode *t)
>   {
> +	/* FBC disabled: Wa_16023588340 */
> +	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
> +		      "FBC isn't supported on BMG\n");
> +
>   	prepare_subtest_data(t, NULL);
>   
>   	unset_all_crtcs();
> @@ -4294,6 +4302,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			t.flip = -1;
>   			t.tiling = opt.tiling;
>   
> +			/* FBC disabled: Wa_16023588340 */
> +			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
> +				      "FBC isn't supported on BMG\n");
> +
>   			for_each_pipe(&drm.display, pipe) {
>   				if (pipe == default_pipe) {
>   					igt_info("pipe-%s: FBC validated in other subtest\n", kmstest_pipe_name(pipe));

