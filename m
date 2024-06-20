Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63F0C2BA1A
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 10:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E7A10E8A3;
	Thu, 20 Jun 2024 10:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0UwIorq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B5910E8A3
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 10:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718878888; x=1750414888;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=myP3LUItAvnt87lCMDoIejPk/YNneoM6A/EYtNUDHRo=;
 b=g0UwIorqA3NQ9n1cMGSNEpFZnuZLLgd0UzgQmnwc8dVl/1dZ/I9uwDRr
 i4etdRhX+efgcUGg20FOb2f+dmYJEmqePuMJIYWICFz8wZzbO2jDgcpzA
 mMHdizfgQcIUQJSLcC0/BT3As3dfjtAVNmA93m1ELUJeQzu54OBiG71F7
 EmAseTNC2ZKJDXXQNhtT+rO0cpL/sNewkWQwCPAUK6bsO44ZCmrbkSmse
 0C2uqNupdnKMja+OvYIjwmM+OORd4OcMV+7Xr85gRZIkTNye5Atcc/TAl
 D2OThk1L3VQb2EaEYt82PeY6ohw0zGnR7+JDuk+JOx3EHY1WsTa6de+ag A==;
X-CSE-ConnectionGUID: yczy/qV3TKytFCqXJvRy1Q==
X-CSE-MsgGUID: hULI4YtjThu5uf8QcKsrXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15984296"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15984296"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 03:21:27 -0700
X-CSE-ConnectionGUID: tEiD/EMoQZ6wIL/yP3gYLA==
X-CSE-MsgGUID: 8mu3jbBPSn2WT7NtjJCSbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42302518"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 03:21:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 03:21:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 03:21:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 03:21:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 03:21:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8AVFAup/hXqd3hO4qo2m2wEUJI+jav7MQ3zWJ3MivEUTQgBcdIVlV2dYD00y+WAgPHNZbioliDQPQ8fFC46fRSwC1xY2uKuoUDE3M8IdgPFFRsRNdBu/nyKdVLaJJSm67wT7nPExLJ912dfyEjmllrIS4sfo6hxKkXl1+KUuDpQFiPOh1NpFdebKd2MkfPDPlaJRvmyCfHXI34E059SN98NJT31YyAMWXSrZtVCtCeYxZieWDuRA8DmgNxO6WNkAmb6tNAyLU4TWscGdWB9XM+46Z8ZdU3pHDQgscUX/ggNxcJxJZxw0hwQ8STvVzRSSOwNb8u0p9R17pbtlWhA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyqDO+ex158RxtDzBDKGr5+Lu2HbBQqChfFaLE+iY4M=;
 b=UcajAnaxCxUvMZ2JEvsLpJoGUPwEsIo4TWDCn8te71F/S5jNS0IxBYyFacn7fq2EkiU9/55YA34vVw6rIt8c8qZAJ1Idb4pUsqr23E/+NoYbfppM/HNbSZv6gKC4L3kue2nOVdeB/L8Ep+PxiOzorUyM6WS0rkCGnNQpantX6nH+xHVIwNZSAiqkoK9rTxO4l+KHj9wQ/ovI5GPxej006cU5mnKh9TyKADRpJyyroyvzDl8v8rgnsulB4sRs5qi6F6ZA8feEYGNmbIWHKAAZYa5zxDXkQCe02/D88Upg4VuQvoSFppYrCl3Mo1Y1kh3q+WxfxpnFHRtva+y+ek1cfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DM4PR11MB6044.namprd11.prod.outlook.com (2603:10b6:8:63::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.19; Thu, 20 Jun 2024 10:21:21 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 10:21:21 +0000
Message-ID: <8709d93f-c079-41c0-bef1-789a4a8cdf88@intel.com>
Date: Thu, 20 Jun 2024 15:51:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] tests/kms_sharpness_filter: Add adaptive sharpness
 filter test
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, Swati Sharma <swati2.sharma@intel.com>
References: <20230328092838.147903-1-mohammed.thasleem@intel.com>
 <20230328092838.147903-3-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230328092838.147903-3-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25)
 To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|DM4PR11MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fec6718-bcf5-46ec-46b9-08dc9112bb02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTExRmxPcHg0YzFUSG1NUXpEUVlJT3FTd1c2Zk1mSUFxckNyQ0tTQ3d0YThl?=
 =?utf-8?B?NVlDZnpIMUMvV2ttTW5UajF0ODVEb0lRZ2VHUTBjYnpuQ0poeEpKWlc5TFhp?=
 =?utf-8?B?UWFneC9yK1dqWDdkQ2lkTEQ1UW1NSUhSVjd5UlBKWHNxUUlKVHFHd2l2UmFi?=
 =?utf-8?B?WkNRWmxmTHNBMFZNVHpiSHNXK04rSWhVTGc5VVQvMitQQm1ISFhsUWJtdEly?=
 =?utf-8?B?WkR5UW9QTTBMMEx4a2dUUGdCWVVCdENUNzZyS1kvRHBoOWhXZWpVaFYrTyts?=
 =?utf-8?B?M1c3VFdNQXoyNzA3eHhLZ3FBbDlmQWlxeVoyRCs3UHU4cEZ6ZW1WOWttbWNq?=
 =?utf-8?B?bXlqQkpDbWRvUzNqODhTSjR2Zmlhd3JQWUk0ajlWR1ErNi83WUNnbjRoc2ZG?=
 =?utf-8?B?UFZ0eUNBczdPV1ZVVDJraG5uZUJlSE83RFlqbm1zN0lMQ1dMbXBoeVF4WlVp?=
 =?utf-8?B?ekVWbWg5ZmR2VE9EaXkyQkptZGt6K21McmJOVDd0SExqUGdPcUpGOXFXd3lh?=
 =?utf-8?B?VHhtdUVDYUpndURuYUJtcUtHSnR2RkRmK3h4NjlCN29VSjNac1RMaTdhSDJE?=
 =?utf-8?B?Vm9UYXZMNDQrbUhFamFvWXBWZUFoRzg3anRySngvbzA2QksrNGxVZGFza01x?=
 =?utf-8?B?N2l1SjdqYitWN3hXVjBrQ250ei9YcmJBRnRiYjV2YUNhRDlTUnFvdVFueEh1?=
 =?utf-8?B?aU52c2RNRVJCNE0vWDJrMEpNV2RUdmZ5WDMzeW1sRGdBQ2FSU1lSTGVHelow?=
 =?utf-8?B?TTBRRXZkay9Sc0NPT2pWTXZabUlycERZMEFiWlBJbW5KLzV2RTlXQ3RIR1Nw?=
 =?utf-8?B?eWpmTkh2VHFsSkl1amk1ME5NNzY3WlFVcHo3dTBiTm9YNXZCU05JV1EzSS91?=
 =?utf-8?B?L0tnc3RzZU40bllnd05EL1dDMUdnbFF2SmN6WWFHQXJGNllCSFFLVkF5NDYv?=
 =?utf-8?B?eFI2d3JhK3Vxdjl3MmtjSURXLysyQzlGTHhSSTJWZkMzT3FpL2RTdFcrKzZS?=
 =?utf-8?B?Ykd6b2lZZXk5cWZKSWo1YUxJSTcyRlRZRCszamIzd2ZwMFZXa3VRYUMzcEVR?=
 =?utf-8?B?S1liME83YytiU3RjQnZId0hvNGorOENmcDkvQ2pmeUNGY3FIWXh5a2tnQUFQ?=
 =?utf-8?B?Uk4wN1BoMzFkTXRtRUhVenc0Ym8wVytaVFp1NmdnV0xQdFBGSGJ2QjlTUFBG?=
 =?utf-8?B?dnVCOUFDOWdJTWl1WHhnL1UzRlR2SE83M3Q5ZzJLM2xpOVhRZnFnbVJldTFv?=
 =?utf-8?B?SEpsVTd3Vk8xWjdwdlhhTGNrazBheEdVczNYWUtLZXBqekNJYTVCejB6dEtM?=
 =?utf-8?B?V0dvNGFxRE5OM01JN1pDZzdCRmk3Rm5ZZEduTUZVYWJtVXZnZk4xQ2ZOQkdl?=
 =?utf-8?B?aUhvWGFXUzl3SnlPOENyOVdVTlYzVFprT041L21UNCt6RDJwNS9lWHdOcFRH?=
 =?utf-8?B?OElxbGtvR0dTNDlBSzQzaGMzL29JdWwwZmplMDJYQnA2aDhDVnhwREY5UmZo?=
 =?utf-8?B?TndVYVVIMHAwcnQwS0pGdHlOZ3NNejdnM01RZ3czaWhvcWU4cndaL1k0VHdP?=
 =?utf-8?B?Nmx0dlBRcGw1cDZuZHdEUFZRWDB2emJnUDRzNEE5NHBhUEYyWTIzSG05MWZP?=
 =?utf-8?B?dEJtTk01SDBCY2RFbFhoUythaWxzTzJyektjT3lXb2Y0QlBvWVVjRlc2NFFv?=
 =?utf-8?B?RzN5Q0JSRFVLWnBxZGRsbW1GU1g4OWZyTnRYSS9xSGJNMnhnNmVKcGtGUDJw?=
 =?utf-8?Q?QqKFUb6CwZzRmaQ/KRAy2pgHVvx0NqttqogoMiC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW1uRCtPa1A0OWVaVjQ1dUJ4Tk9KbkFXemw4VklFNVhIdjFsMkpzL3VESlZt?=
 =?utf-8?B?MjZVRXZWbVZhTHFuS0Y3OSs0Z1JWSEFYay9XZmYxaGYrTFFhR00vY2M5clNB?=
 =?utf-8?B?RWVCN0h6eGRiVE9VZUlhRC83YmxhT3ZZVFhodXFML0EwN1l6REdVbU1wc0o1?=
 =?utf-8?B?ZUc5aDB5WHBQL0ZUdzJ0cUJUbllpYlJEcE9jd1doTUh6cktwQTV2WU90M2Ni?=
 =?utf-8?B?S1RJLzU2V0ZEL2E0bjhpS3crWldmUGNRd2F1TGIzRjRmRnUyNHQ4N3dNVjZl?=
 =?utf-8?B?QmxCMzRZV2pYbmVwME12eGZHbkpRRzN4TVBjWGt6bXBLK3RiUGhFUFBwcUEv?=
 =?utf-8?B?dWgrUkRubjBBbndCS0wyV2kvbWlkSU0yVDlZVjBHMEpFeU9kdXY1NnUvTi9a?=
 =?utf-8?B?aGE4SitJT25mNkdOL1JZOXlqRnVjMnZ2Y0NWRTNVL1dvQWJNYlRLYmJWMTNX?=
 =?utf-8?B?T1A3WHoxV0p1VVBQaUowd1J6dFVpcFJXVVRUUHZIYUkxRGdlUzJtSkRzQU1Q?=
 =?utf-8?B?RjdnTFFPbEhod0M5SkFmUE9LSXhPTFk1YUFqTnFBVmNCcFN0a1lId0R4RlQz?=
 =?utf-8?B?N0l2NUJURkhhRGhYaXBoeGtuQXFGbGNIb2hoK1hIZEd3dWthZTc4WWtKU3N0?=
 =?utf-8?B?ZnhISGxnRnJLbE1QVTV3NjNmUkppS3VWN2NpbUMrbWF6NjNUWHRVTDRNbGxD?=
 =?utf-8?B?Y1RrVGFZR0lBdzZqa0ZldExiWjl1a284aFhrbGUrR3lJWjJ1VVRxNDlKeWlL?=
 =?utf-8?B?azdZTWxGOTVHbXpTVGZCUVc3OWVmcG1wVEZ6Y3dRZHZhN2hZL3dQY080Zkpz?=
 =?utf-8?B?eVd0RklvM2pwTERPSnAyUjB2aS9iOWV1Q3BoZUNYNlV4RGRJSUs2TnU4Z0ha?=
 =?utf-8?B?NWh0YlFNWTI1RHhucGJaYTc3Um1NSFc5dnZjVGFsMy9hNzA4QUJibzFrNlFV?=
 =?utf-8?B?dWdZZkMrbFhWTXh4R01hSkVGeGx4djdIUzJaaGpDdVUzcXlFYjJPL1BHV1Rk?=
 =?utf-8?B?NWdkNzN1MnJ3OExidVJ6YzNXcExPdHlyWnZhWkNLMTh1dTdrSlJQTW5UNGRH?=
 =?utf-8?B?bSt5RElRV21zT1BCTWovTHFWUytiRG5jOXhjUkJmZkk0RXNReU5Vb0ZKYVRW?=
 =?utf-8?B?U3FnMzRyMHR1ZW5penlJREtUb21aZy9NWTc2RkZaQTZOOWtVLzhMdzJyR3Vy?=
 =?utf-8?B?dmtLc0d0TURQZkoxVGxtMnpXZ2trNUlwUXhUcGd3SCtpdmNleG4wUU5ENTVt?=
 =?utf-8?B?MGFDZ00xMkxVWW5KRElTWU5JRzJXbUpoNlMyTHVvNk9Qd1V4cW1pN2hpbG5k?=
 =?utf-8?B?QzgzVUREMVFReU9pN0hEOVRWQnNQL1BrVjhyTXhrRTMxVkJDb0hpUktXV0dx?=
 =?utf-8?B?cGNHb3E1QjE2SkoxTG8zSmRJNTA2UFlMYkc5a25ldVYxRXlJbVBJb3hkdzNN?=
 =?utf-8?B?amd4NzZSRVB5UllnUEo4N3AyTldnK29lVG9jWWNHN1JzcU9wZVZMaGFqbW1F?=
 =?utf-8?B?WTA3SWdLTUVLVTNaeFZxVnJoSmNLN3dhRDNSYXRPSi9oSVlFWnlYK08zZzMx?=
 =?utf-8?B?Y210RExNKytlaGVoUkxxUVBRcDRqZ2lVZERuWWM3TEZidGQ4dnZQRGJNMmo1?=
 =?utf-8?B?KzErWXd3c2x1bTk0VEplZkZ1VWVyNzlVMWorU21rQlh5TEtWY1ZZM2lvWXFm?=
 =?utf-8?B?VWVLRmRTNHBTQWNmZWJEVWhFZTJVTlA4azYydnVMMWxlcHZVNVJubjdhOWdi?=
 =?utf-8?B?TnQzL1pteVF1bVBlalFVOGNmSG1VeFVZT0M0cjBHT0N1Y01GRHN2V2pvU2Nv?=
 =?utf-8?B?QTkvODZJclBldi9yQXoyLzJhbUFZa1U3cjlhV0xnR3VyQys0RDA0RlFhZlZS?=
 =?utf-8?B?TjNwZzZBZzVGL1Z4MjJMdllsb2J5THdFOEkveWU3VHJhVFhCRUpOWFBQcVpO?=
 =?utf-8?B?S2hPYUtNV20zOEFncGgwVkhtRFpFdXpDWCtYUUNBU0VXMEtJTnRRUXpmazZD?=
 =?utf-8?B?OFpiN0hvVFcyeFRBbmp5a21CZlYxSVZBaVBGcXNwZElrVUVRSnVGTy9GRHd3?=
 =?utf-8?B?RFRXQ0owZFZsU0l1b0hPcW1NWVNUZkNkSTVKSmFsVjA4N2lkdExPMDlzbzJw?=
 =?utf-8?B?eTZqRjVxdklHc3BLY3BiRlNoNm5Ca2MxNEpiUVpSWUZnNTd0cUUyQkNFenVH?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fec6718-bcf5-46ec-46b9-08dc9112bb02
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 10:21:21.6424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnAveHRYLvnCaVGz6Qs4YZNJvKODnT3hghIFHKwzqwtwIrV/Ow+VFlq0RPs3Bp/uFol9RRBdmnwMTxq7wIhQfRDZX8rVuEmcFFOPN704WZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6044
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


On 28-03-2023 02:58 pm, Mohammed Thasleem wrote:
> From: Swati Sharma <swati2.sharma@intel.com>
> 
> New test is added to validate adaptive sharpness filter on
> LNL platform. Various testcases are added to validate this
> feature. These are non CRC based tests and manual verification
> is required.
> 
> Pipe scaler is repurposed to perform a portion of this work.
> This means pipe scaling will be unavailable while the sharpening
> function is being used. The other scaler can be used for plane
> scaler.
> 
> 14 subtests are added:
> 	-basic: verify basic functionality
> 	-toggle: switch between enable and disable
> 	-tap: verify different taps selected based on resolution
> 	-modifiers: verify casf with different modifiers
> 	-rotation: verify casf with different rotation
> 	-formats: verify casf with different formats
> 	-dpms: verify casf with dpms
> 	-suspend: verify casf with suspend
> 	-upscale: apply plane scaler and casf together
> 	-downscale: apply plane scaler and casf together
> 	-strength: vary strength and check difference in sharpness
> 	-invalid filter with scaler: enable scaler on 2 planes and attempt
> 				     is made to enable casf
> 	-invalid filter with plane: enable 2 NV12 planes and attempt
> 				    is made to enable casf
> 	-invalid plane with filter: enable 1 NV12 plane and casf and attempt
> 				    is made to enable 2nd NV12 plane
> 
> TODO: -Enable casf with pipe scaler enabled
>        -Enable casf with varying output formats (YCBCR/RGB)
> 
> v2: Update modifier type to uint64_t.
>      Replace IGT_CRTC_SHARPENESS_STRENGTH with IGT_CRTC_SHARPNESS_STRENGTH.
> v3: Update setup_fb with height and width.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 668 +++++++++++++++++++++++++++++
>   tests/meson.build                  |   1 +
>   2 files changed, 669 insertions(+)
>   create mode 100644 tests/intel/kms_sharpness_filter.c
> 
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> new file mode 100644
> index 000000000..d592e9a2d
> --- /dev/null
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -0,0 +1,668 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +#define TAP_3				3
> +#define TAP_5				5
> +#define TAP_7				7
> +#define DISABLE_FILTER			0
> +#define MIN_FILTER_STRENGTH		1
> +#define MID_FILTER_STRENGTH		128
> +#define MAX_FILTER_STRENGTH		255
> +#define HDISPLAY_4K			3840
> +#define VDISPLAY_4K			2160
> +#define HDISPLAY_FHD			1920
> +#define VDISPLAY_FHD			1080
> +#define NROUNDS				10
> +
> +/**
> + * TEST: kms sharpness filter
> + * Category: Display
> + * Description: Test to validate content adaptive sharpness filter
> + * Driver requirement: xe
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + * Functionality: casf

Please sort these fields.

Move "TEST" block to just before #includes and move "SUBTEST" block to 
just after the #includes.

(Please check other KMS tests for reference).

> + *
> + * SUBTEST: filter-basic
> + * Description: Verify basic content adaptive sharpness filter.
> + *
> + * SUBTEST: filter-tap
> + * Description: Verify that following a resolution change, distict taps are selected.
> + *
> + * SUBTEST: filter-strength
> + * Description: Verify that varying strength (0-255), affects the degree of sharpeness applied.
> + *
> + * SUBTEST: filter-toggle
> + * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
> + *
> + * SUBTEST: filter-modifiers
> + * Description: Verify content adaptive sharpness filter with varying modifiers.
> + * Functionality: casf, tiling
> + *
> + * SUBTEST: filter-rotations
> + * Description: Verify content adaptive sharpness filter with varying rotations.
> + * Functionality: casf, rotation
> + *
> + * SUBTEST: filter-formats
> + * Description: Verify content adaptive sharpness filter with varying formats.
> + * Functionality: casf, pixel-format
> + *
> + * SUBTEST: filter-dpms
> + * Description: Verify content adaptive sharpness filter with DPMS.
> + * Functionality: casf, dpms
> + *
> + * SUBTEST: filter-suspend
> + * Description: Verify content adaptive sharpness filter with suspend.
> + * Functionality: casf, suspend
> + *
> + * SUBTEST: filter-scaler-upscale
> + * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: filter-scaler-downscale
> + * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: invalid-filter-with-scaler
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 2 plane scalers have already been enabled and
> + * 		attempt is made to enable sharpness filter.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: invalid-filter-with-plane
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 2 NV12 planes have already been enabled and attempt is
> + * 		made to enable the sharpness filter.
> + * Functionality: casf, plane
> + *
> + * SUBTEST: invalid-plane-with-filter
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 1 NV12 plane and sharpness filter have already been enabled
> + * 		and attempt is made to enable the second NV12 plane.
> + * Functionality: casf, plane
> + */
> +
> +IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
> +
> +/*
> + * Until the CRC support is added test needs to be invoked with
> + * --interactive|--i to manually verify if "sharpened" image
> + * is seen without corruption for each subtest.
> + */
> +
> +enum test_type {
> +	TEST_FILTER_TAP,
> +	TEST_FILTER_BASIC,
> +	TEST_FILTER_TOGGLE,
> +	TEST_FILTER_MODIFIERS,
> +	TEST_FILTER_ROTATION,
> +	TEST_FILTER_FORMATS,
> +	TEST_FILTER_DPMS,
> +	TEST_FILTER_SUSPEND,
> +	TEST_FILTER_UPSCALE,
> +	TEST_FILTER_DOWNSCALE,
> +	TEST_FILTER_STRENGTH,
> +	TEST_INVALID_FILTER_WITH_SCALER,
> +	TEST_INVALID_FILTER_WITH_PLANE,
> +	TEST_INVALID_PLANE_WITH_FILTER,
> +};
> +
> +const int filter_strength_list[] = {
> +	MIN_FILTER_STRENGTH,
> +	(MIN_FILTER_STRENGTH + MID_FILTER_STRENGTH) / 2,
> +	MID_FILTER_STRENGTH,
> +	(MID_FILTER_STRENGTH + MAX_FILTER_STRENGTH) / 2,
> +	MAX_FILTER_STRENGTH,
> +};
> +const int filter_tap_list[] = {
> +	TAP_3,
> +	TAP_5,
> +	TAP_7,
> +};
> +static const struct {
> +	uint64_t modifier;
> +	const char *name;
> +} modifiers[] = {
> +	{ DRM_FORMAT_MOD_LINEAR, "linear", },
> +	{ I915_FORMAT_MOD_X_TILED, "x-tiled", },
> +	{ I915_FORMAT_MOD_4_TILED, "4-tiled", },
> +};
> +static const int formats[] = {
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XBGR16161616F,
> +};
> +static const igt_rotation_t rotations[] = {
> +	IGT_ROTATION_0,
> +	IGT_ROTATION_90,
> +	IGT_ROTATION_180,
> +	IGT_ROTATION_270,
> +};
> +
> +typedef struct {
> +	int drm_fd;
> +	bool limited;
> +	enum pipe pipe_id;
> +	struct igt_fb fb[4];
> +	igt_pipe_t *pipe;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_plane_t *plane[4];
> +	drmModeModeInfo *mode;
> +	int filter_strength;
> +	int filter_tap;
> +	uint64_t modifier;
> +	const char *modifier_name;
> +	uint32_t format;
> +	igt_rotation_t rotation;
> +} data_t;
> +
> +static void set_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH,
> +				data->filter_strength);
> +}
> +
> +static drmModeModeInfo *get_mode(igt_output_t *output, int tap)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *mode = NULL;
> +
> +	/*
> +	 * TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
> +	 * TAP 5: mode->hdisplay > 1920 && mode->vdisplay > 1080
> +	 * TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
> +	 */
> +	switch (tap) {
> +	case TAP_3:
> +		for (int i = 0; i < connector->count_modes; i++) {
> +			if (connector->modes[i].hdisplay <= HDISPLAY_FHD &&
> +			    connector->modes[i].vdisplay <= VDISPLAY_FHD) {
> +				mode = &connector->modes[i];
> +				break;
> +			}
> +		}
> +		break;
> +	case TAP_5:
> +		for (int i = 0; i < connector->count_modes; i++) {
> +			if (connector->modes[i].hdisplay > HDISPLAY_FHD &&
> +			    connector->modes[i].hdisplay < HDISPLAY_4K &&
> +			    connector->modes[i].vdisplay > VDISPLAY_FHD &&
> +			    connector->modes[i].vdisplay < VDISPLAY_4K) {
> +				mode = &connector->modes[i];
> +				break;
> +			}
> +		}
> +		break;
> +	case TAP_7:
> +		for (int i = 0; i < connector->count_modes; i++) {
> +			if (connector->modes[i].hdisplay >= HDISPLAY_4K &&
> +			    connector->modes[i].vdisplay >= VDISPLAY_4K) {
> +				mode = &connector->modes[i];
> +				break;
> +			}
> +		}
> +		break;
> +	default:
> +		igt_assert(0);
> +	}
> +
> +	return mode;
> +}
> +
> +static void paint_image(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +	int img_x, img_y, img_w, img_h;
> +	const char *file = "1080p-left.png";
> +
> +	img_x = img_y = 0;
> +	img_w = fb->width;
> +	img_h = fb->height;
> +
> +	igt_paint_image(cr, file, img_x, img_y, img_w, img_h);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void setup_fb(int fd, int width, int height, uint32_t format,
> +		     uint64_t modifier, struct igt_fb *fb)
> +{
> +	int fb_id;
> +
> +	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
> +	igt_assert(fb_id);
> +
> +	paint_image(fb);
> +}
> +
> +static void cleanup(data_t *data)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(data->fb); i++)
> +		igt_remove_fb(data->drm_fd, &data->fb[i]);
> +
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +static void set_planes(data_t *data, enum test_type type)
> +{
> +	drmModeModeInfo *mode = data->mode;
> +
> +	data->plane[1] = igt_output_get_plane(data->output, 1);
> +	data->plane[2] = igt_output_get_plane(data->output, 2);
> +
> +	if (type == TEST_FILTER_UPSCALE) {
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
> +	}
> +
> +	if (type == TEST_FILTER_DOWNSCALE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay * 0.75, mode->vdisplay * 0.75);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALER) {
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[2]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_fb(data->plane[2], &data->fb[2]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
> +		igt_plane_set_size(data->plane[2], mode->hdisplay, mode->vdisplay);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_PLANE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[2]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_fb(data->plane[2], &data->fb[2]);
> +	}
> +
> +	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +	}
> +}
> +
> +static void test_sharpness_filter(data_t *data,  enum test_type type)
> +{
> +	igt_output_t *output = data->output;
> +	drmModeModeInfo *mode = data->mode;
> +	int ret;
> +	int height = mode->hdisplay;
> +	int width =  mode->vdisplay;
> +
> +	igt_display_reset(&data->display);
> +	igt_output_set_pipe(output, data->pipe_id);
> +
> +	if (type == TEST_FILTER_TAP) {
> +		mode = get_mode(output, data->filter_tap);
> +		igt_require(mode != NULL);
> +		igt_output_override_mode(output, mode);
> +	}
> +
> +	data->plane[0] = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +	igt_skip_on_f(!igt_plane_has_format_mod(data->plane[0], data->format, data->modifier),
> +		      "No requested format/modifier on pipe %s\n", kmstest_pipe_name(data->pipe_id));
> +
> +	setup_fb(data->drm_fd, height, width, data->format, data->modifier, &data->fb[0]);
> +	igt_plane_set_fb(data->plane[0], &data->fb[0]);
> +
> +	if (igt_plane_has_rotation(data->plane[0], data->rotation))
> +		igt_plane_set_rotation(data->plane[0], data->rotation);
> +	else
> +		igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
> +
> +	if (type == TEST_FILTER_UPSCALE  ||
> +	    type == TEST_FILTER_DOWNSCALE ||
> +            type == TEST_INVALID_FILTER_WITH_SCALER ||
> +            type == TEST_INVALID_FILTER_WITH_PLANE) {
> +		set_planes(data, type);
> +	}
> +
> +	/* Set filter strength property */
> +	set_filter_strength_on_pipe(data);
> +	igt_debug("Sharpened image should be observed for filter strength > 0\n");
> +	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	if (type == TEST_FILTER_DPMS) {
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   output->config.connector,
> +					   DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   output->config.connector,
> +					   DRM_MODE_DPMS_ON);
> +	}
> +
> +	if (type == TEST_FILTER_SUSPEND)
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);
> +
> +	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
> +		data->plane[3] = igt_output_get_plane(data->output, 3);
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[3]);
> +		igt_plane_set_fb(data->plane[3], &data->fb[3]);
> +
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALER ||
> +	    type == TEST_INVALID_FILTER_WITH_PLANE ||
> +	    type == TEST_INVALID_PLANE_WITH_FILTER) {
> +		igt_assert_eq(ret, -EINVAL);
> +		return;
> +	} else {
> +		igt_assert_eq(ret, 0);
> +	}
> +
> +	cleanup(data);
> +}
> +
> +static bool has_sharpness_filter(igt_pipe_t *pipe)
> +{
> +	return igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH);
> +}
> +
> +static void
> +run_sharpness_filter_test(data_t *data, enum test_type type)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	char name[40];
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		data->output = output;
> +		data->pipe_id = pipe;
> +		data->pipe = &display->pipes[data->pipe_id];
> +		data->mode = igt_output_get_mode(data->output);
> +
> +		if (!has_sharpness_filter(data->pipe))
> +			continue;
> +
> +		igt_output_set_pipe(output, pipe);
> +
> +		if (!intel_pipe_output_combo_valid(display)) {
> +			igt_output_set_pipe(output, PIPE_NONE);
> +			continue;
> +		}
> +
> +		switch (type) {
> +		case TEST_FILTER_BASIC:
> +			snprintf(name, sizeof(name), "-basic");
> +			break;
> +		case TEST_FILTER_TAP:
> +			snprintf(name, sizeof(name), "-tap-%d", data->filter_tap);
> +			break;
> +		case TEST_FILTER_TOGGLE:
> +			snprintf(name, sizeof(name), "-toggle");
> +			break;
> +		case TEST_FILTER_MODIFIERS:
> +			snprintf(name, sizeof(name), "-%s", data->modifier_name);
> +			break;
> +		case TEST_FILTER_ROTATION:
> +			snprintf(name, sizeof(name), "-%srot", igt_plane_rotation_name(data->rotation));
> +			break;
> +		case TEST_FILTER_FORMATS:
> +			snprintf(name, sizeof(name), "-%s", igt_format_str(data->format));
> +			break;
> +		case TEST_FILTER_DPMS:
> +			snprintf(name, sizeof(name), "-dpms");
> +			break;
> +		case TEST_FILTER_SUSPEND:
> +			snprintf(name, sizeof(name), "-suspend");
> +			break;
> +		case TEST_FILTER_UPSCALE:
> +			snprintf(name, sizeof(name), "-upscale");
> +			break;
> +		case TEST_FILTER_DOWNSCALE:
> +			snprintf(name, sizeof(name), "-downscale");
> +			break;
> +		case TEST_INVALID_FILTER_WITH_SCALER:
> +			snprintf(name, sizeof(name), "-invalid-filter-with-scaler");
> +			break;
> +		case TEST_INVALID_FILTER_WITH_PLANE:
> +			snprintf(name, sizeof(name), "-invalid-filter-with-plane");
> +			break;
> +		case TEST_INVALID_PLANE_WITH_FILTER:
> +			snprintf(name, sizeof(name), "-invalid-plane-with-filter");
> +			break;
> +		case TEST_FILTER_STRENGTH:
> +			snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
> +			break;
> +		default:
> +			igt_assert(0);
> +		}
> +
> +		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe_id), data->output->name, name)
> +			test_sharpness_filter(data, type);
> +
> +		if (data->limited)
> +			break;
> +	}
> +}
> +
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	data_t *data = _data;
> +
> +	switch (opt) {
> +	case 'l':
> +		data->limited = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const char help_str[] =
> +	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n";
> +
> +data_t data = {};
> +
> +igt_main_args("l", NULL, help_str, opt_handler, &data)
> +{
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);

Is this test specific to Intel hardware, since this test is added to 
tests/intel/. If so, you should open the driver with DRIVER_INTEL or 
DRIVER_XE.

> +		igt_require(data.drm_fd >= 0);

This is redundent check, please drop it.

> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Verify basic content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-basic") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_BASIC);
> +		}
> +
> +	igt_describe("Verify that following a resolution change, "
> +		     "distict taps are selected.");
> +	igt_subtest_with_dynamic("filter-tap") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(filter_tap_list); k++) {
> +			data.filter_tap = filter_tap_list[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_TAP);
> +		}
> +	}
> +
> +	igt_describe("Verify that varying strength(0-255), affects "
> +		     "the degree of sharpeness applied.");
> +	igt_subtest_with_dynamic("filter-strength") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +
> +		for (int k = 0; k < ARRAY_SIZE(filter_strength_list); k++) {
> +			data.filter_strength = filter_strength_list[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_STRENGTH);
> +		}
> +	}
> +
> +	igt_describe("Verify toggling between enabling and disabling "
> +		     "content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-toggle") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +
> +		for (int k = 0; k < NROUNDS; k++) {
> +			data.filter_strength = DISABLE_FILTER;
> +			run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +			run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying modifiers.");
> +	igt_subtest_with_dynamic("filter-modifiers") {
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(modifiers); k++) {
> +			data.modifier = modifiers[k].modifier;
> +			data.modifier_name = modifiers[k].name;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying rotations.");
> +	igt_subtest_with_dynamic("filter-rotations") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
> +			data.rotation = rotations[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_ROTATION);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying formats.");
> +	igt_subtest_with_dynamic("filter-formats") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(formats); k++) {
> +			data.format = formats[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_FORMATS);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with DPMS.");
> +	igt_subtest_with_dynamic("filter-dpms") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
> +		}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with suspend.");
> +	igt_subtest_with_dynamic("filter-suspend") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
> +		}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with 1 plane scaler enabled.");
> +	igt_subtest_with_dynamic("filter-scaler-upscale") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
> +		}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with 1 plane scaler enabled.");
> +	igt_subtest_with_dynamic("filter-scaler-downscale") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 2 plane scalers have already been enabled and "
> +		     "attempt is made to enable sharpness filter.");
> +	igt_subtest_with_dynamic("invalid-filter-with-scaler") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALER);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 2 NV12 planes have already been enabled and attempt is "
> +		     "made to enable the sharpness filter.");
> +	igt_subtest_with_dynamic("invalid-filter-with-plane") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_NV12;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_PLANE);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 1 NV12 plane and sharpness filter have already been enabled "
> +		     "and attempt is made to enable the second NV12 plane.");
> +	igt_subtest_with_dynamic("invalid-plane-with-filter") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_NV12;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
> +		}
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		close(data.drm_fd);

Please use driver_close_driver().

- Bhanu

> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 758ae090c..744551bcb 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -271,6 +271,7 @@ intel_kms_progs = [
>   	'kms_psr2_su',
>   	'kms_psr_stress_test',
>   	'kms_pwrite_crc',
> +	'kms_sharpness_filter',
>   ]
>   
>   intel_xe_progs = [
