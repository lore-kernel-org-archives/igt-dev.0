Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EBECA5FEE
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 06:10:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935EA10E261;
	Mon, 19 Jan 2026 06:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRUm1wVZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E572810E261
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 06:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768802999; x=1800338999;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KVKB9wUIO4ef/JVLvah95LDuBSAr9NB49+JYMN6RGdI=;
 b=XRUm1wVZjJDkErBOoCfIg/fFvWpPN7dHEWlRobCQBloQAr2x4o/K+udi
 qtyGw+1Uz2avInRf9h8IWiBE3Hhyy1yxL1H/QyZWl5I1chMN9IhNwSN0n
 xNfxRu3SglHLsQajdaDnao53tqi/6sggKxOZVXgr52WfHW2/MQC4FYWun
 jWFWhlpG5u7SCPIdvEOncE8P1q5hmiYDenqJnLOEvMrX2xDa8HaaYp4Kf
 /0LEIzuPDyjHf4ZyP50K6Kl7A3VpmbeEHwhoGBqLPzF6KxAx4Kve4K7bF
 GQDKkAWHv90iavJaDNzYFfLLU2MvazoGK6DsYFELikwpNUqvdGeoZuPS5 Q==;
X-CSE-ConnectionGUID: iA17SmFRTemW2ZRySSACPA==
X-CSE-MsgGUID: zBN4coYpR22iPfOjMAbHkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69905280"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="69905280"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 22:09:59 -0800
X-CSE-ConnectionGUID: EevlGZB5S5SaC3UoncVc4g==
X-CSE-MsgGUID: je/3iZ9cT4SVMps661n1rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="228715384"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 22:09:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 22:09:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 22:09:57 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 22:09:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7ZyIC2eFFP496/BhFsmjpGE/9DmCOZytHPU2jESw5jIcMM5qM4LALwnp5CpFfVYIUuLnN317PnVlxvzPVu8A9XnCz29a/2RxYcXjfGNrmeXLis2N9hRGEr5aKdW99V59sb7kCaS3qZvVKGScCM3eKr8ClsnpIGDh4TGEXkyUbFanlaXlY3qrZEaDOGiK6BTCuwN9B9IwGNbWIna5T0Y+pVcKrt6iK8efJYvwrl62/1Jcr552723MyCUHcFxp/B3G2+CN/0tcPN2GoMWJclA56R/C8SWC06WCbT1VJujmygWAFLeWk45xILR7fh2jyZm0ILbBTDUBu7/GMGNupq7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2trDpYkMmUFnJj3BKrnGIoVhZlEBeGG6tB91GHspTkU=;
 b=UxaxUmM7K2kJc77xCB/EbmAYy8qHtpNnhpmnvGV5vxnCa5+IGnOf5f4o7GlDzgaG4MARW9ZSnlOjIL5QKF3iSeqRRplzwv4jUKafuZ2Evih5LEwl6pTPRYm3tCFc7gwsDt/Ej3UhLVoXH9xSn4CgYh22X7iPrbIpsH4VSHCxAivVYzFj0iECErqP+lwYZagJY9OQI+Ti1YIt3q2rt6FJtUfXaUU2yF8RIl1dB7SOlz/ArgzMVZWkNug+pBJ4feTLZegLRG6tQi+viT1/f9uYH14hM5FpyUcU6DdDQXwLeDae3V/LrQxi841JEvq6MJioUK3LSjs6g4kXSifzqJcBig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by CY5PR11MB6464.namprd11.prod.outlook.com (2603:10b6:930:30::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Mon, 19 Jan
 2026 06:09:50 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a%7]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 06:09:49 +0000
Message-ID: <40aadfb7-2cca-49a1-b75d-0b6c00beea94@intel.com>
Date: Mon, 19 Jan 2026 11:39:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_universal_plane: Add vblank wait for
 cursor fb leak
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260116060932.523060-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260116060932.523060-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::12) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|CY5PR11MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3eb5f4-a20d-44f8-c170-08de57215a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qmh6cnhQWlUyK2hXRWJHb1IrR1pTYUlYSG5EUyt6dHFYTHJuVjlFeW1JQkYr?=
 =?utf-8?B?TFR5OW5reGlmMWVqUlJXbENtZ2NXbVZmK01ZUG01SE0raGZpa0E1Y3M1V3ZD?=
 =?utf-8?B?TTl1ODV6MlhMWmtGdlUzMVVZZUNtV2wvZzNQSXZVcmJJZjBYUitDM0lxZXZQ?=
 =?utf-8?B?a1FzbFNheDd4VEc3YUNPM1JmWStyYzNnNlVJVkJrN09xdnQvZzRXcHRHcURm?=
 =?utf-8?B?enNxWmhLamFJOVBhbS8xVkVnV2hBOVRiNmlWRkl3NjBSdDdzcGs4OFdMcVRt?=
 =?utf-8?B?RUJnUlYzaW9oT3JCOGNLMG1pWXJQWk4vSDhUc3o3S2d5VXNmWmVjT1oxVXNO?=
 =?utf-8?B?aTlvRHdyTlFjaWRtQ0JSTWNnN0pORUp2NnZIdkdTWmk5cnVteHNnR3VHRHQx?=
 =?utf-8?B?QVFEd2FzNUROMmNCdlUyaHZrVEhCV0hPT0pwNWxxNmg3VFplTENoUEUvUjBw?=
 =?utf-8?B?dG5jT3Y3UkhaVkdzTVkxYUl6NkU5R3pBOEZudUx5NVlSRy9UR1c1M3hVWGpw?=
 =?utf-8?B?dDRQcjVTWThGUnhxOTF6RlkrcEpkVExabXBUVGI1WGZzWFBFaUxhRHh0UDM5?=
 =?utf-8?B?N2RUUDFlSFBKZTk4L280OHM4V0tta2IySUs5UWg3S3dHV0l1ci90TVhFdEVw?=
 =?utf-8?B?bXNmVHJXWmRyY3h2ZXlxcEVRSHo2Q0NCOGxQbTYyV1hPN2pYeThLUXBEMm1P?=
 =?utf-8?B?emFQaXFJcHF3M1NpYU9iRFVJRVM0MFBFUFRJaGRtdnpPcFJjb09Fc3dxdk5r?=
 =?utf-8?B?N2tSMjRwU0FiTXNidDhXMENINURVVXJaa3AzWThldjRHZTFpR0VzZmZEWWxk?=
 =?utf-8?B?MmNpb202S2JjWHkvZU00dFc1ZjFGanBMK2dSTTRqNnVVV1V3ckd2QktzUlFT?=
 =?utf-8?B?djZ2dCtMOWVLOHN6bjhCMUpFYkdnblBWaGVhbjBaaEp0bTdReURKZy9EWFRU?=
 =?utf-8?B?YkJiZ3RhUWR1UEdSZFZUaGFXV0JSaGdMbThoQVZnbUpIRGk4ZnlQSU9xUncy?=
 =?utf-8?B?VlZYcEFtTGJzSFFBNFVGSGRHRTYvLzJLb2hCdVNDK1crNjhBOVdWZStKOTdi?=
 =?utf-8?B?SUUyVG1peHRSQlZkY3hBZWV1aXplWk5tVmVEaTVhcmVxdjBMek5yMVdQZUtH?=
 =?utf-8?B?Y25DRngxQUVzc2llcGR3UDU0R3A4N0VKQjN1aEJKdkpxcVVMQkRxOGtyOTB4?=
 =?utf-8?B?MEJMV2U3OUZWTkpLWk56clhWSG9mSGhUbHNsOGUySlZJZnRDZkRDdXM4c3M0?=
 =?utf-8?B?a1MrUXRoWkNBU3psOW4vNGhlM2pmVzNtbEJJeVcvdEw4RWxqOFlzN0VnRzFD?=
 =?utf-8?B?Z01kU0c5cC9jVXBic1ovVmVyaVROVlZDdnpDY1JhYWVWV2I4WlBVdmNMdkZ0?=
 =?utf-8?B?NWFkcS9xMGhpR0tXd2dKTnNSeWhvTXlvQWliUFR3cmdEMkdaTklSYVZXLzds?=
 =?utf-8?B?MFlIVlVlK1FkZUszMWJISGljUDhEU21RR3NsbmVLN0NVUEowVVh2ZDE3a25j?=
 =?utf-8?B?NmVnOG9mNE1Zd0pwUnUvNmhWRlgyelptTVByd2ZGZ00zam04a0owNlM5NFNH?=
 =?utf-8?B?NEQvbWc1MEV2RG5kc0VtVEZGeWdKcnF1ZHYwWEdPUHBwTEdXTmRrZk5wY0dz?=
 =?utf-8?B?NGQvdWRhWVp5bm9KY2YyMmNUdStyQ0J4NzFVRyt2NmpGUElvOVlxSGhyYU5n?=
 =?utf-8?B?QS9HZkFJU2Uxd2ZoYmFpZ2I2SG5VZk5jSDZENUt1anlRMTIrWVVCZ2JiRmVF?=
 =?utf-8?B?SHJqV1p4dGQxc1FzYk54SFhycEQrWWNYMEcrUVUxZkdZMXoyN291Y0tJNGtx?=
 =?utf-8?B?eEhXUHo2bTR2SE9SeDJWSXordDM3QWdJL282K1AvQ2pwNmcxMmRPcm5TYzRu?=
 =?utf-8?B?ZTR0Vm1WU2pWcmZmampRaVlNeXFwb2pRenNpNk0vTG1iZ3dRa0E0K3hqcHRN?=
 =?utf-8?B?OCs5dER6VnFtak05MmM1Rzh3RTVuYWVmU1B3WStQYjgzeUVqSWlOUENJU3Zk?=
 =?utf-8?B?REwzdGVvN2xwVE00TWFCZTBXWjVtbWRWMjEyWDMwSDNTVHYwc2tlREN2RWVt?=
 =?utf-8?B?QTI4cnF3VXRFMnFUOG5pc3Z0UW90dnpVYXRKdGdPQmVUYkRUMDFNNmh6L2t3?=
 =?utf-8?Q?q6ZY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzlnMlhaLzhWL3FvNWxnSE93VzBOcUxtcmRnWTc4clozcjZQVUtPb1RhcVNF?=
 =?utf-8?B?anhtUHNEZ0lBNkNraERyK3RGZGtRdHAxZllrQnhMU3NCaVNwWks2MlJKMVY3?=
 =?utf-8?B?V3pzMHdsaTNsWlA0Q1ZlU3lzNUFwRVJzRjduQkljYkNwK1VTYytRZW9zckNW?=
 =?utf-8?B?NEJWWlJGYkdUK3h4N2JydGtNa2g4ZGpTT1MwZ1p4cUZ0by90L2UxSVV5dTNT?=
 =?utf-8?B?WVVLQUJ2SU9hOUtvQkxFYXo5VXpwd2xUUkpma0JwOVpwcWM4MkM3TEdLakJK?=
 =?utf-8?B?OUJrU0x4UnBScnVwZVp3OGRIOXFBWDRUWlY5eG9vdXgzZ3AzRWVqYkQzYXlU?=
 =?utf-8?B?ZWtadGtlZ0huWjB2V1lhREhRajhnYkZHckRULzF1VnB0RC85N2gyU0d1OHp4?=
 =?utf-8?B?bXBUeWpPckc5bmZYclk4QndhMW82dTVPbzhDVGNKZkU1S0tKc0R5T08ydWIx?=
 =?utf-8?B?cVlwWDNuWlkyejZnWG1xL1AzcFJFZ2Q5RVZaZEhxMWU3SXV0dTJDN05mSkRC?=
 =?utf-8?B?N3FaaDBJU2NkeDVDQkJiRm9Wanp3YWJvZ21lcjRtaGFKaUp3b3NXcmFxYzMv?=
 =?utf-8?B?QzF4d1lRZ0FxSTNjRE85dXFlY3pzZEdEbC9LSTc2akhIcEs3SDVOU3Nhai9B?=
 =?utf-8?B?dkNBTHRrUytiMjFlejgxcXhXSmdtakZ5TklhMmRCaHRRMm4xUGtNZFFlWDM0?=
 =?utf-8?B?bU81WVBBMENSMzhiRkVCRHhFNklvZTdvdXpDRDN1cDFQejhwd1B4dVozV2Ny?=
 =?utf-8?B?SmtUbTNhVUZuMjhCRi9tRDNtSFExWGk2S1haQkFYNVp5b253WjdWVjd6MlZ6?=
 =?utf-8?B?Mk9ZNDhFSlFTRDIrUklUczE1NnJSQ21CdDdYSFhqVGVLRTVDYlRneVRzYWpB?=
 =?utf-8?B?NEJlR3BJSFdDbmxpVERxOWJtSU0rbTN1QVd3WEptaC90bDIrby9oSTd4SkY3?=
 =?utf-8?B?VzI4aWFrRnNmOFJJTnkreDRqYm9wY3Z6N1BLOXZCZHdTbTUyaUxSMDBacHhY?=
 =?utf-8?B?K29hYzB1WGdIc2FHRlhRaWI4ek9BbjJQZ3dKWXZURU5XeE1wQU82ZVB3U1gz?=
 =?utf-8?B?Y1hQWnRhTUZKQ0t4L1NrTkQyQjhEamJyeElvTWEvSEFpMTVmdUFOeXcrbGJl?=
 =?utf-8?B?MzB6bHpoZGtpWjlzRGxWdlBRSVp0T2pVSkZzcFNsTmRsQ3QzOTFXNWYvTytC?=
 =?utf-8?B?Uk5YMzZRc21MazR4aEQwMWVkM2RVMlVVRDFTb2VuMHBIT0JkVmt2RURDMWlh?=
 =?utf-8?B?U1ZnTEo2bWFFYUJzNTBTZkZCd0xzUm9sci9hRUhMampPODAyZ1hzUEVxMXlO?=
 =?utf-8?B?SDhNUzIvSzI5eHk2ZStjK0p1ci9jNXlwL2h2TC9IdzRraWlZODRJZTdxTWJl?=
 =?utf-8?B?T3gvbjUvRUExb3M2MStuV3dzWnA3Zno5TElOM1QwVXYxVzE1K3VUb0EyWFls?=
 =?utf-8?B?bWVVL1NBdFNPenQ0VWFsNTFyQSs2eEM0T244Z01YTU5kS0NTZWFhQnVtbmRW?=
 =?utf-8?B?eHlWS25NQmdHWWlkMmhidGgwekRvekRnN3liWUZCWFN0S3NYQ1VaZVNHYlpZ?=
 =?utf-8?B?NmVZQXBRaHkrSjBXZEpNdjEvMWw5RWFwbFdHdzBmaEgyaWdTNG9FRGl5eGsz?=
 =?utf-8?B?azZROFFlZEhtaEFqOExSS3dIOVVoaWhZemFKOGVHV0ZMMDl4bUc2MG45MEZW?=
 =?utf-8?B?K0RVdTd3TW1oS1BlQlNYUmNxM2xjUzgrU1V5WkM5NVVMekFzWWVFWWlybmdM?=
 =?utf-8?B?ZGNkSFRKRUR0amYzWkNnT2hjY2J2MTBxU1Z1c0pkYnorY3BzRW5pTFNXNjl6?=
 =?utf-8?B?WXRvQUJWSXZMWlBOWjJBbWR3aElXMU4xeG1xbzZNeVN1QVJBZUhBbTNialFv?=
 =?utf-8?B?b1VkNENtV05aNEVKTWM5QUwxd1RFZE03UlduR1NHQnE4TW00a0FOTEFSSjNQ?=
 =?utf-8?B?SUoyYTdvZ2I4QXpjc1o5THR5YThFK0lFRWhEdVlpR2JEaHAxY0Z2bExQNWFC?=
 =?utf-8?B?VWcvZ0RKUG1zSWk2RmRxaEt5cUhzSVFqOUxTb0hBQmkycUk2dkM1NXJHYURw?=
 =?utf-8?B?UVh2SkVVaitjZTFFTHRpR2JMdTE1bi9YK2NHRkFDTUpYOW5PMUdldTR5UmJz?=
 =?utf-8?B?bHZQNjRMUWo3RXBwTTRDMWlOSFU1QmVNMldpcVNRZG5CcTh0dm8zbmR6V1NF?=
 =?utf-8?B?TnBCNzJMOUhmTU9kQVhSOW9EdnJPMjlkQjl4UE5iWElUVzE4eU83RmNXT0pI?=
 =?utf-8?B?L0J1NXhDZjZvL3pySUI4Z01zbm9UYTdLVEY5TER1TWRKZisreGh1VmdlcGNm?=
 =?utf-8?B?d1ZzVWVtV0hMTGhBL0k4Q3U3OXJ2N2FWbUY2TTNOeVh3eVp0MkJQdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3eb5f4-a20d-44f8-c170-08de57215a5f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 06:09:49.9251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASY7k/1Z747XtFcogtCWnHcfl0ZYqkhFneCL5fcJiFT68cvSUERwRumbY3knhwVL58JM49wyBqZpNaTXJ+LDVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6464
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

Hi Suraj,

On 1/16/2026 11:39 AM, Suraj Kandpal wrote:
> Add the vblank wait even for i915 as the legacy path uses the
> vblank worker to unpin cursor fbs.
Please add,
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   tests/kms_universal_plane.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index aa5927cdf..9ac6d01b7 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -703,16 +703,17 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   			    COMMIT_ATOMIC : COMMIT_LEGACY);
>   	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
>   
> -	/* Since unpinning of cursor fb occurs during vblank in xe, we need
> +	/*
> +	 * Since unpinning of cursor fb occurs during vblank in xe, i915
> +	 * specially in case of legacy commit we need
>   	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
>   	 * 1 additional vblank because vblank event is scheduled before
>   	 * unpinning. Therefore add 2 vblank wait to ensure that all
>   	 * cursor-related framebuffers can be removed before counting the
>   	 * framebuffer.
>   	 */
> -	if (is_xe_device(data->drm_fd))

I assume this is intel specific restriction, so should it be 
is_intel_device() instead of removing the check fully?

Thanks and Regards,
Karthik.B.S
> -		igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe),
> -					  2);
> +	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe),
> +				  2);
>   
>   	/* We should be back to the same framebuffer count as when we started */
>   	count2 = intel_gem_fb_count(data);
