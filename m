Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAB7C021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04FF10E392;
	Mon, 17 Feb 2025 08:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dk/0AGKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D4810E392
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739780322; x=1771316322;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TuiJZ/VrRNChfJCjb4j2ZZQ11kSemYXilVq31Z4xX4c=;
 b=dk/0AGKhY1c6mr8bylVxFBQzQXEGZECP/VRuqVZ2C5RBac+OjWSzpf2K
 1GkxDl1DtxlW6s7f6a55VnYAyS5ESIy7AD7u/2YMN9T0kP+0gjcIYvNAa
 nlc7M8yYkQfeJEG6t+37kipER+e0I6T5JbEKc6Tz2a/BqwnIK7YtojG7C
 iNjRjqMLL9FYE2j++ezIr4MQHEnqEZCscWZf4syblz4NwdXOmwbds/bh6
 PJFXJwsopIwotANlONJVEOxXgAV4ibMG1IY5gMVCHALD9cJB9HwG1BlaO
 mvIkEF2p+3NATQva01V45RIERxPC23FQzTq/4iT7NqjjMrX4yw50sp7td g==;
X-CSE-ConnectionGUID: /CMNikGSRSageCKb1KA1sg==
X-CSE-MsgGUID: ZZTA82crRTW7+F+ZxvGGiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="44213665"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="44213665"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:18:41 -0800
X-CSE-ConnectionGUID: TU4nnIw/SqmKxn7o5MA86Q==
X-CSE-MsgGUID: AArnREOUQH6Nnr3hJqwLQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="144901323"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:18:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 00:18:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 00:18:40 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 00:18:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndv7a5EZFQ3XvCHmHc5/mxtR6mH8UXeMZ0bWoUp2O3BDWwzgY8bqA2qbSgFTpJH7jlhPKCyAVWwx/JWZiNFAkfgMNVFLlKrsLE5Hza6Nzs+rgCM2aWZ+UZXkcUgmtSSR54PQP6kCfpHVUx0QZDibGRPxIkjdxUbK7lY9WijL1cnoNXpejuMq5Ota/3tY1ggawMcnPCQ1A7QXf1NkKzI/AFX801ele1ondX4OR7UVlG6HgyG0QkV8pm7tnM5N6b8zYmkjuzrpLHtoPTLxBzweNjSxbBGGF45HGwEwgM2zc7Jnh8Tlw8N41Pspd1z6FNrW3LI0fox36qjpwJtjCs/oIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KqvOe8xfosVTxXmqQf/trkuaBfzkbxdrx+7M9D8D98=;
 b=obQZNKw8jmx0+/0gNnbEOQndJdP/v5xlW2c8TUOw3puGbRqJuypTeAgVgZ7/FeF1lpjwjsx3btoJgE+mPlVi+OsrawTT2cg3OYqBSABXIR5eWQRxQAeqXd6Z2y1tLR9sM4oN6avV/Fw58rSdYjWHew15ywe8g2lrTBTRhT4r6DPHgdDMk4RyDjb03arJlL6I2I+LCablyH/sFmpDICSMLZJruxHPM5Np0OHZ0oIUNjJoxyQDak3Vn8luHh+ywnT0C8vPp7Ptwg1jc0Xmbz02ncLw6wMmXEuPY6HceCn3bUjhWT9wItRaw+RgkFrVqAXbkivo4tJ89JiiN4XBP+Amrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA1PR11MB8857.namprd11.prod.outlook.com (2603:10b6:806:46b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 08:18:05 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 08:18:05 +0000
Message-ID: <5b7f0493-7786-4a09-bafd-9778b3a27b76@intel.com>
Date: Mon, 17 Feb 2025 13:47:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] tests/intel/kms_cdclk: Add conditions to filter
 valid outputs
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250213110814.351186-1-swati2.sharma@intel.com>
 <20250213110814.351186-3-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250213110814.351186-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA1PR11MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: 92adcd00-0742-4d24-c8f3-08dd4f2b9a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTEwZW45VnhMTHVLMXE2WmdoVkdpZi9JR0hUbXB4bVFDVkRjS0ROQkZ4eTVN?=
 =?utf-8?B?MUkzTnVTSFNkSnpRdkRmbTJUdmQ2YlVzS1BEdVNuSHVjVGVMMFd0MDZZSWRk?=
 =?utf-8?B?cmU2YzFzTTVLWjRvRHU3d3RRTUozR1J4bTY4aTRQNVZFeTlDS0gxeW9yU0xm?=
 =?utf-8?B?eTRPMk9FRmdrV3NWaFcrZkZXZTBvVCtnUDVheXBpUk5PZ29OZVpxWk96SUJP?=
 =?utf-8?B?bXE1SGxReGdpRHBDYUprcW5oZ1hxQmIxZ09GZUFrUFJIdjI1a0pGY3R5YjdW?=
 =?utf-8?B?MzdsMHFMbWpHa3pEeDlITHV6N2FMUTBFc0JpK2ltNEU2Vm9pSm42UFdTYmg0?=
 =?utf-8?B?QktaWVNkNWpBc2hncEVIeEVOOGFGRzZYYVdEbHo4QjlHMlFNbG96SXV3UWtN?=
 =?utf-8?B?VEJQODJpbTJ2YzNVdlRsWnllVE4vV0NMQWpnVmFTbWQvQXplK0hpYys1UmpB?=
 =?utf-8?B?QW5KMVhUcHlrWURyTktJTlhDblQ1NVRRaWRJdHphakNqZ2U2c3NlSFZTTlpm?=
 =?utf-8?B?K0k2eXNxWU41MjNyYm1GQnRyaXdOSzgvcjcwQ3YxWWpUZXBEeUowK1Fiak9k?=
 =?utf-8?B?dDdMMmRpQUREMTAxSlplOFhXd3lQRUk0K09CWmt3YzlXUWRJWWtYZjVlVE5N?=
 =?utf-8?B?UFFSRHBJT3Y3bFhpbHNZOEtxeEp5KzRLa2tnRnBBeHAvWVJ0eS8rUGdValBz?=
 =?utf-8?B?YnU0cjdxVkxhQzFxSWhrS3pONWtma25DWUJ1NHJHbEh0ZHJUY1pyZmJPT0ZH?=
 =?utf-8?B?ZFZncFAwUUMrQytlS3ZJMFZxQlIyNis5RlYvREZBNEhVTUJjMnkzbkdGYWVT?=
 =?utf-8?B?aEVEOStla2xqYkpMU3YzVFhWQUlDdDlQT0w2UnAzcjFXcm9hMkM4K2pzK2hC?=
 =?utf-8?B?N0dGZDA5a3plQnBNbU13bW4vdUFUWVdMOVFTRC9zK2RRKzZ0amVnMEozL2tG?=
 =?utf-8?B?LzhtTmdWNHgrYlU5bStJeDZEcnRGSUlwT0RmdllzeW1VeVF0QWNJWkF0V2pt?=
 =?utf-8?B?Z1ZoaklrTlVoL09GZmQ0dWRVM3AxNi9GUmRKWkRyTVY2MEFqLzc4MXIwQVNH?=
 =?utf-8?B?amJWWEQ0bHpHdW9XQmExUW10SGpwZjhBZ01BVVZ0c3pvZnVpTnN3Q3NkRFZB?=
 =?utf-8?B?YkhKTUtiNEZKNG1qOHJoc1VyTk1pMHRLRVNrK2wrU3FDK255ZmpNd0svOS9Y?=
 =?utf-8?B?aFVLbXIzeFc3cVZjeVRSVlJ5Q3dqcTZmRXN0bU9pcFB0WHI0RTdwK3gzTFhQ?=
 =?utf-8?B?N2NXbkJyQ25UWUc5SFJ2V2pZc0IxZmxuMXJIOUVrZlFPTDVYcVZaa0hTQmtC?=
 =?utf-8?B?NlZpeWJyS2lwMVZVQU9zbFNUVFRGcGQvMXh6QnY1Y3YxVUUwVUFlUjU0K2FE?=
 =?utf-8?B?Y051Y1huQTY4cFR6LzdaZzZwdTlpdERGaVAxeG9BUWh0a0JtVVJPVkpDQTRQ?=
 =?utf-8?B?eUd1QkVYaDNPdGlXWGRvWU1ZUTVENjdkNE1hc1dJMU9kYmtqVW1LQUluUW1i?=
 =?utf-8?B?TW42NkdFN1F1ZmY3K25YZWF6VStOK3lVbGYzUmF3QVlIY2c5SEZrUmV4dE1a?=
 =?utf-8?B?cDNkdUdJMDQ5Wlo4WlBxSkxVL2ttWEd0MFQxdFpZM0FUeHAyTU1rVTV3RWtY?=
 =?utf-8?B?RkFONUpWaWxXekZzelZpT3E3QXNXaWhQQ1dXL2JTQWxWNzJBOGZKNWE0bVo5?=
 =?utf-8?B?NE5lY1ZnUnVsYVVnZkM0YVF6RmFITmxpWDFVS3M2RVdzOFk2eDM4ZDlDSGw4?=
 =?utf-8?B?czVBMldPeWJ1Y3lVa1JQWWloUmhpb09FMHFmaW9pZkZvUENmTDA4YVNPZDgv?=
 =?utf-8?B?aSt0cm9LQUJ6ZTFrVHpwYjRXa0N5UkczK3luKzh4SlVrMXRONVdZYjQ1M0lo?=
 =?utf-8?Q?/tRA9BQBGqC1i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW9GZGJWK1ZZc1VyMnJLZ2RvYjQ4WVBnbDdmYzJyU1JnN0dKMEc3YkM1dG1H?=
 =?utf-8?B?VHZyVGoxdU5sRTErbVVEMHRVUkpQdFFxSnJCbE5iRlpnQVgzeFQ1M0tZLytu?=
 =?utf-8?B?dTJicmk5WXQ0aFN1T3c3blFxVGZXUlNueE1HWUU1K3B5RU1GWGlUZktVL0hm?=
 =?utf-8?B?WTFWa1FCMG5ITTFwa0F6bTZwSkxEQjdoWlFCOEJRWkVqaFRMdXljb3FNbjhk?=
 =?utf-8?B?YU84SkdKV24vbXVvYWZvMndVM0hoZ2pqM1JaYUN2TE95dlVaNEd4QW95RDlR?=
 =?utf-8?B?RG1VUVhnS3RNb09Md05NQnlwWkJQYWY1QlNtN2IrVnhtSjZ6RVR4WldPSWY0?=
 =?utf-8?B?eHVsNDF1cVBBMlJucGxOL01FdUJFeS9KK1JPRDZwZExiUjRQMTY0UGRTTjEz?=
 =?utf-8?B?eXRsckJ3SmtTQ2J5RlF6b1dmUGpMb2U1WnlnZWJJUkZBQVRBeUF2Vkc3TGRZ?=
 =?utf-8?B?NzUxRjdiVStiTzk2cnpiQXNDMTArV1ZGdG1mQkg3eFhYWFFmMnhOTnJ0aWZO?=
 =?utf-8?B?MXpKQU1wN0FSSURIU0tFNlpyWUpGWjVPbmplZG1wOTdwMUVIUFhHa3hwWlRT?=
 =?utf-8?B?KzlXeGZITGpCV3o2dEFBbFpOblB5WjVvZmdLcEZkZVZzV3BiTGp0N1lMYU9F?=
 =?utf-8?B?eDN1SWs2YmZLS1JPMTJSS0pDOVhWcmMrTDZ6VXkyc2RvdHF4RmxLYzFUNm9U?=
 =?utf-8?B?YlBHQllEMnpVcTdxTXJic2RDMFpXVE0zQjdBS21EYWEzTUJsTldlalBlUDJx?=
 =?utf-8?B?RkxKd0JsL0pNb0tCc1FPWG1Td2tFbmtrVnpWN0RlRFdpMVhQTGs1VS9lZSty?=
 =?utf-8?B?OG96ZXh1UEhnU090cFVMS1p1Z3lmbUF3TzBwczdSV3VCdEpYanRSM1JsNXli?=
 =?utf-8?B?N0RaS1JWSVRtdStrQlZiS0FXQXVjdnRHNDdpOXdwd2VjUllOS2EwOGZNOUFw?=
 =?utf-8?B?MG52YmlxbnZWbHBJTzhkYUo2ZFUzU0sxZmttbnFRVXNEamk0N3VDMUFYYmc0?=
 =?utf-8?B?bkhKRVA5RGc0b29kVUY5NFdvTmZ0LzVtZnQ3T0haN1lKWjBLbGh1SVdoSGRo?=
 =?utf-8?B?RWZrRllvMUgvczBUYlpDTjBTNEx3REJ4ZXAxNCtHQXdQUS8venlqSTU3THk2?=
 =?utf-8?B?NjNpczVQSm5aUVdDTFoyekJEVGtsMTIwY2FLdnVIRUx3UnRsMzRUQ29QR0hm?=
 =?utf-8?B?YUpiSThXNXo2VmVINVZVeHBNU2FLblY2YUVFYmROLzd5clZJZDZOQkV2T3N4?=
 =?utf-8?B?MnZpYXkzdUpIY3lIZVNuL1hDcXRMN0tmNno4V2lqMlNlSGppaC8weUFLMGpw?=
 =?utf-8?B?amlZNVdXNkNabHRCZG1Gb0ZDRnNUYkZPTW9oRUNMK25CTXRQd3RzYjEyaGdB?=
 =?utf-8?B?NzgwakZ4YnpGYnl4Zml5N3pKd3Jua2paY2NadUE4Tyt3MHVwZ3gzczh4VUdL?=
 =?utf-8?B?c0FEY0RSWDhzTGdmNXQ4YXRjaHl5eFVwUkZMUUpRK05LejlHd3VhVzB4eVc0?=
 =?utf-8?B?U0NuMnd0VmMwVkVYOE16TUt5dyttTXR1LzEwNkVkQjhGdHZxdWpUWmtUZU9s?=
 =?utf-8?B?K05PYU1yWW90UGhKcnlzbGhHblVmNWFqNnpqOTR3YURmZnN0cENkSnpvRWIx?=
 =?utf-8?B?cDlxdWJyaG5HZGxEQm1rN2tDWUx6OG9qQWNBWXlkSE9CMG5nZ0RMRUFBQzRs?=
 =?utf-8?B?U1B6a2RxWU9NM2pnaGRGdGE1M0VuS0tDVmR2a3BVbVl0SnpIR1hjcWhLaThs?=
 =?utf-8?B?all1U0M3TlQxczNiZ0UrOWNpNHpQcStqWmhVNlNGa1dxTENPR0tkQU1ReEw4?=
 =?utf-8?B?RTR2Vk0wd2I4NHJGblEveVJVYk1yS0VvOGwyTkkwWExIU2J2ZDh4MmIreDMy?=
 =?utf-8?B?K2dpNU9UVGJqVGtNWDh2YVR6bmYySFZ5eWlOMFMrQ0ZaS3ErK2xSSW9vN0hu?=
 =?utf-8?B?NG40OUhZMHl5dVhubmRBS293WDFkbmdnSW0zOGEyclRrN1UrN0EzTitSeEZY?=
 =?utf-8?B?bWRFU1hZMENETlczc2lTMkt1UHpKUGN1TjlaUkVrUytmLytLT1dWQjI1aUgy?=
 =?utf-8?B?MUhMVjMwazI2THEwZVMzbmtScVBXVzlOdFA5Q05xUGVVd25YUlRCWXdNNkYy?=
 =?utf-8?B?My9tWUxuTmdFQjhRSUF3NXo2SEZaRG1EakpEeHNNK0ZRc3ordFVaYjJnNzJP?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92adcd00-0742-4d24-c8f3-08dd4f2b9a72
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 08:18:05.1466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkXWyChbi+TuiIynuPWkAZduLAmhIFQijdpuICjQ3+v+RL4CV04W1nIyB0IJUqmfLiKblYDyiDaug9uAxqB215NNvSPcpziTa1WUg7MQWtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8857
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


On 2/13/2025 4:38 PM, Swati Sharma wrote:
> Add vrefresh as an additional parameter to check if highest and
> lowest refresh rates are identical.
> Skip the test, if highres and lowres are the same, as no cdclk
> transition will occur.
> Store highres and lowres of valid outputs in an array for reuse later.
>
> v2:-fixed description (Ankit)
>     -highres lowres stored in previous loop (Ankit)
>     -removed comments (Ankit)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_cdclk.c | 50 ++++++++++++++++++++++++++++-------------
>   1 file changed, 34 insertions(+), 16 deletions(-)
>
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index e78d22e1d..75542e21b 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -223,7 +223,9 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
>   		      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
>   		      igt_output_name(output));
>   
> -	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay && mode_hi.vdisplay == mode_lo.vdisplay,
> +	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay &&
> +		      mode_hi.vdisplay == mode_lo.vdisplay &&
> +		      mode_hi.vrefresh == mode_lo.vrefresh,
>   		      "Highest and lowest mode resolutions are same; no transition\n");
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -261,8 +263,10 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   	igt_display_t *display = &data->display;
>   	int debugfs_fd = data->debugfs_fd;
>   	drmModeModeInfo *mode, mode_hi, mode_lo;
> +	drmModeModeInfo mode_highres[IGT_MAX_PIPES] = {0}, mode_lowres[IGT_MAX_PIPES] = {0};
> +	igt_output_t *valid_outputs[IGT_MAX_PIPES] = {NULL};
>   	igt_output_t *output;
> -	int valid_outputs = 0;
> +	int count = 0;
>   	int cdclk_ref, cdclk_new;
>   	uint16_t width = 0, height = 0;
>   	struct igt_fb fb;
> @@ -273,31 +277,45 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   	do_cleanup_display(display);
>   	igt_display_reset(display);
>   
> -	for_each_connected_output(&data->display, output)
> -		valid_outputs++;
> -
> -	i = 0;
>   	for_each_connected_output(display, output) {
> -		mode = igt_output_get_mode(output);
> +		mode_highres[count] = *igt_output_get_highres_mode(output);
> +		igt_require_f(mode_highres[count].hdisplay >= HDISPLAY_4K && mode_highres[count].vdisplay >= VDISPLAY_4K &&
> +			      mode_highres[count].vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
> +			      igt_output_name(output));
> +
> +		mode_lowres[count] = *get_lowres_mode(output);
> +
> +		if (mode_highres[count].hdisplay == mode_lowres[count].hdisplay &&
> +		    mode_highres[count].vdisplay == mode_lowres[count].vdisplay &&
> +		    mode_highres[count].vrefresh == mode_lowres[count].vrefresh) {
> +			igt_info("Highest and lowest mode resolutions are same on output %s; no transition will occur, skipping\n",
> +				  igt_output_name(output));
> +			continue;
> +		}
> +
> +		valid_outputs[count] = output;
> +		count++;
> +	}
> +
> +	igt_skip_on_f(count < 2,
> +		      "Number of valid outputs (%d) must be greater than or equal to 2\n", count);
> +
> +	for (int k = 0; k < count; k++) {

Just use i for iterator.


> +		mode = igt_output_get_mode(valid_outputs[k]);
>   		igt_assert(mode);
>   
>   		width = max(width, mode->hdisplay);
>   		height = max(height, mode->vdisplay);
>   
> -		mode_hi = *igt_output_get_highres_mode(output);
> -		igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
> -			      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
> -			      igt_output_name(output));
> -
> -		igt_output_set_pipe(output, i);
> -		igt_output_override_mode(output, &mode_hi);
> -		i++;
> +		igt_output_set_pipe(valid_outputs[k], k);
> +		igt_output_override_mode(valid_outputs[k], &mode_highres[k]);
>   	}
> +
>   	igt_require(intel_pipe_output_combo_valid(display));
> -	igt_display_reset(display);
>   
>   	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>   			      DRM_FORMAT_MOD_LINEAR, &fb);
> +

This line is extra, not part of this patch.

With above things fixed:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>   	i = 0;
>   	for_each_connected_output(display, output) {
>   		pipe = &display->pipes[i];
