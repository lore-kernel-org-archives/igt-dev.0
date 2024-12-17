Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61614E77188
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 13:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05B310E16E;
	Tue, 17 Dec 2024 13:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWXnF7MV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F7810E16E
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 13:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734441521; x=1765977521;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9MaD+KNyGGLbjRqrT4UdeKC0T4xx3XR4lvHmafziCT4=;
 b=VWXnF7MVeTgbf8/10hFQensKuakGUu7EIbKccj/LZs/JEFugPIj2UJTy
 aWD4G7i6lc+Blr0mJMNSt6k+8zedrqWtpfGK033VqeqkkfPJnCwAENufn
 aKvBAeXWQabTXTNKBYSiNVMMwFqJyw/GMjYbu8RZHwHdYAf7ItIUBNpUH
 R93S8oxOIS5yiOm8YrVZYFwHgkjcElSFlyU9smjnUozs/Ko+d4BDT4h9B
 SDqXNbJUpK8T0ptgFav6QPeq5pYXlwCHs+3Uv/48UlAjvVa2NUT8a2NpC
 5YoOjE3WI2bj92Q7cd8nJ73UzqAF5AMVNNYKI/9AXrP23DB6MSviE0mcy w==;
X-CSE-ConnectionGUID: YB3ZiXmkSs2bUkRc8n9oEA==
X-CSE-MsgGUID: grKJ2AhxQga6NcgOjfJHnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="57347903"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="57347903"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 05:18:40 -0800
X-CSE-ConnectionGUID: vFdcsmjJRwaY4SbWGgSpPw==
X-CSE-MsgGUID: qDbEk8CuSzSEc0KTdPcleA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="128344660"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 05:18:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 05:18:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 05:18:39 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 05:18:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjSAXeAH/kxTGCSCS8hgFhVr0hUemvsjGr6Q8tzclaWnIZvVzqQvl8Z990ZIEkSFtWa2LMYpX9iX/8j5YyFokRJNZAbKHuR24ulUhZLIM7jnm+WDhfnnEMsVVN5mqhlo2APq0A5qsCSRjX4Tn8k8jTWDuZZ4SMj91ASLrjJh3DBnVhgDqo+wjh1qPMeY7m7UHdkmU7lgFJHufmQ8seRD9E6BiG/WWmr/yKvw4FKLoALHyi4TrssTE8GidpBGC9PYoSY6r2gmwG/IMYwfA5jXQ+RYNYnAzlfrF//Ig5BGbtTPYo0qLZRmi553n3MNErJAW0/veeAifObLQHdV6XwmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYsG4RFqeY4GiBQWh/Zu90n5XKCrUX3o3X5gZssVM30=;
 b=MB0NyM36h8CcQvkSfAg6/kYfh1+i/GgX7j5YjbqGVy5Z96nRrnmfIddx6LcJF/HppCw/gLCtf/YghF7opCqGw5mNLENY1XUyn6ThbRdOn0Yco2Rz7dUbg201UE6kYw+20OYsUccyo2qRkFpqhMdho8GiOvQKhLE7Z6Q12NHszztNRKVJO9MnCFIb2+SOX9wE3C9bpFP48o1a+E++Fr3V5N4IzAgN93+IQF9BBy7oGyEpdGapTZ9bZmg+zuC5eYdcvK9+PzcVbYJ/OlE/Hm27PTLbVkBoM+0zZqynV1yTX9cJqD0sRJpvsLz6EZMGAjCEw34pg/Q+9iVGnb9AylQFiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CY5PR11MB6511.namprd11.prod.outlook.com (2603:10b6:930:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 13:18:37 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 13:18:36 +0000
Date: Tue, 17 Dec 2024 13:18:20 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_balancer: Decrease expected
 load value
Message-ID: <364n7mzk6i3dbyb3kp5uauchy4bu2q33zhzcnef6aoo3se4e5b@mon32nx2wbqy>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <3w2z25pzkowhe7phqdyjdmtjxvl6osxrwal7klnsqk2b2fvhlm@ouaenirljtfi>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3w2z25pzkowhe7phqdyjdmtjxvl6osxrwal7klnsqk2b2fvhlm@ouaenirljtfi>
X-ClientProxiedBy: DU2P251CA0008.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::10) To PH0PR11MB5064.namprd11.prod.outlook.com
 (2603:10b6:510:3b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CY5PR11MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2ced25-4a76-468b-3e63-08dd1e9d4b70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ri85VVoxZjdsRTBkTjc0MWNHc1RvcFpuT0wyUkFGS3QzbDc5R3k2NFBMSklH?=
 =?utf-8?B?QlZFZFhEZE5jQXMvY0dVV21Nc3lFTUxpVUNodlZyMjRPOG1pQnRvV0lZeUNV?=
 =?utf-8?B?RWZWb2k4RlJYd0JxSVRGVVA4a1A4RTFxL1AwR2RqbXFNdDVIbE1LWWFReUpC?=
 =?utf-8?B?TW1QQzlqcGx5aGdsL3lWd05KeW9ub1BIZkF2Y2pKRjdSRHhnUlJ4cmMzWUh0?=
 =?utf-8?B?czEwRktVRGltYlBaemU5T2czWlhkbDcvU1Rtc2N6SmV3QWF4UGo3U1Z1Vll1?=
 =?utf-8?B?d1AzN0FWajZkU25BY3NPT0NSUld4c2U3ZWo3ZUNGQktzMllscEZ4WXF6SDZ3?=
 =?utf-8?B?NjM0NEJoSGNPNGVEZ0JqNG8zZXhMZEFQcHhvMlRuOTJpWEdITUtsRU1yQXZv?=
 =?utf-8?B?MW9JUU9EWXhrTnJoRTIxUDd5T05yLy9lYjFaQlM1a2NCV3dLRmtJNU93TTVB?=
 =?utf-8?B?MzVKS09xWHNaMFlpaXFubkliV2FlemZXR3FTWFVBOWRXZXRLS0ZneWxoTFdz?=
 =?utf-8?B?anZ3ajY0bjZFVXBXbFY5bU5yMVhlNGFuMENJTWQ0a09HUEYwN0s5VzFCYkJk?=
 =?utf-8?B?aEJGV2FWOFFsYTh1V1VRUEVsNG15ZWpNcys4am1SNFM1ZmlkMnlRNDVxY3Rz?=
 =?utf-8?B?T2ZKL2Z6blI1Zmxtc3JGMERMM1o5dmFMWG83Rlc0Y1dSYzExU1FIZDk5VWRF?=
 =?utf-8?B?SEh6WVFBaEFSYXlVNjM4bWJ3VHFMODVPL3VLbldWL3Q3aUJjazZmUis4UzhD?=
 =?utf-8?B?elJEZ2d6cDByam9HVFFoN2cvK1FONi94MHFOdm9iaWFJN3RSRndiSGtzWjY3?=
 =?utf-8?B?WjZFU0Zwa1A1TDVZRlZUWlhnL3Y5QlBVV1V1SUtxeksyRDlSTWNwYXMrVDF1?=
 =?utf-8?B?bTBqT0QySDRwVlpENzRzMTFxMGFHVnFjSkFMY201ZXBpdmZaUFFSMWdBenh6?=
 =?utf-8?B?anV3cWJkMzZTM2pSSjJXWE1rOURIN3VwR05MQ2FZSHNJQkZWMzFEY2lUbkhZ?=
 =?utf-8?B?Y2ZkSG1kNFFuUzhnMEkvbVhOajdlYmpjejdGTS94Y0NZMnRtS0RFRi82TFZU?=
 =?utf-8?B?Y3NFRXBHOW8zWVQ5YW9NNmtlRG5iOE5ScEl2c2dSQjYrWjBUQjlOeEFlaFR6?=
 =?utf-8?B?b1dHZy9hdUc1cTFXcGZWZEdSQ3VXNk5qdTBTQXdtdjBHRWRlaHBDRnJSWjB3?=
 =?utf-8?B?cnV3bURrSnVHVW5STHlFelBVd1pDeDl6OXphQUF5SzRSTjI0am13VDFmYlVY?=
 =?utf-8?B?SkVQcnJZQXZsUElPM3ByTTJwREwrcXhlL0gza0hpY0tzZzVRS0I2Zy9DNFlN?=
 =?utf-8?B?Z0ZvY2I2UGk1Z040MXJUYjBvT2s5d0pGMGNFSEJJWEF6OEZCa1RYZUdjeFYz?=
 =?utf-8?B?bWQvMGJSWThtRENkbXpsbmd1OGpEeGprVUxWekhWZkxOT1JvNU1pUk9yaDAy?=
 =?utf-8?B?bTZydGdrQjh2N01odEREL0tydFdzakdPVm9rTlZ5QXNERlRDTTBvSHE4OHF3?=
 =?utf-8?B?dnMzV3EvQWxhdmUwSkpGRjBydVJLbm5IRUQzU0Q0MDZMVXpxQk9KelRJU0lV?=
 =?utf-8?B?WmNXTENtRzRieCsxSXVZc0c4WW5YVUxLcy9XRGZMZ2U0czN2Vi9sYi9CVU5O?=
 =?utf-8?B?ZTJualV1S0VCTGhRa0hyL1lVMlRQNjlhQ21kYVRDVjZpa1IvWlZYVllQNTFI?=
 =?utf-8?B?azhBdFJVdjV4MXAwVFg0aUxEK3RTSGJJQmVVcTNNdy9Lb1NyK3Y0YTFWTzMv?=
 =?utf-8?B?NDd5Um1ZSFJidjZSU2xwZzA3RzNGOVlaWm9PQk9SaEpNWnZ5QVpMaFNOYkFG?=
 =?utf-8?B?SXM3S2pGMHZCeGVGRzEvZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUZGYllXWk9ObWZVWGVXRllSczZLZHZ3dDZTTkVYRzdHVndnTWRqZjV3elov?=
 =?utf-8?B?blZuZjd4OXdxdS9nS3VpSGc4WVg5NmlQWSt4R0x0c3B6Znh3RnlDd1FJSVMv?=
 =?utf-8?B?c1RWRXF1VG9uU2F6S1pOcVBYNFpBdnNWZ2FLdXZEVktHMWNmSVNobXA0ZTFx?=
 =?utf-8?B?MmdtMUhidUw5VkFKRUJadVVTM0FzTExaUG1oTmp0b2JWS2RITGVCODF6TWY1?=
 =?utf-8?B?blNhYkpqREpLQS9tMTZmVzB1dTN6dWZjK1RRUVhVN295RndSR1Q5dUc1QVN2?=
 =?utf-8?B?NzNhR3VIb05ZTlh2YnY1eDNrQkZzOWd1Yk1hR1FNSUwxQUhKMHdWV3JkNjNk?=
 =?utf-8?B?RVN6TkE5S1NoYWpveGkyTit6MGE2dkswL3FuZVVzTkg0V3JXdW5zZGRwVXNj?=
 =?utf-8?B?QTZ4MVZDTXlwa0tKYU9XR1RZdnNLdEwxOGRVT0NvL0I5YnM0czVjR0pTM3lU?=
 =?utf-8?B?Q2dOTzNBcnNyNHBhVVhYTDVvN2xMK25IS1FQUjJpUTBuRFdVTnRQbnVoN1dw?=
 =?utf-8?B?TXhnTnBZOFljZjBPdjJFVmRJcG4ra2lTQTZUaks4cTcxRlNnQ2JQWDluZGJX?=
 =?utf-8?B?WDFLRzRpOVZlUnovQnpIV05QM3UzVEpoUnZ0czAzNFFHVlhjQ0ZSd3AwQmg5?=
 =?utf-8?B?Q24vSFgwY0hwMysrWUs3QUdQbTJjZ3FCOUJFMW5iTldhZS9peFJTZ1VVTVUz?=
 =?utf-8?B?RFN4MGEzbUdraEJQTE1scnRzTlkrZlpDQ0FoWFdvSnkybktmZkJHV1RQRGpx?=
 =?utf-8?B?dzdIVDVtRmZEdElRY3pRV1NWaWRHaUZ6dkI4MkVLU1FCMkowQkJ1NStXbDcz?=
 =?utf-8?B?cmJtVm53ZTFseDRRWnhRdkJIaXM4NUUvVVdDVUwya2lZTytSMjlGOHc0bzZk?=
 =?utf-8?B?cGROVmhnbzJTbmZwRzU5TVpuTG1JNUpNU2xPOVEzMzBSQVBIeUZUd1U1S0Jq?=
 =?utf-8?B?L25ET0pHclpiMXlKV0sxZllQSHliemllZjhUb01LTXpZRHU3cWJwbmNuZENn?=
 =?utf-8?B?NkNUa2JIODcyWWhMRlREak9Lditkd2VYS0RIeTFnQ091MG5VamwxR2FHb1Z4?=
 =?utf-8?B?ZkpTcnJVNjFveG9oR0lWQUFYRWUwQnpaVFJDdVZLbmZVelh2S1JLUWU3eGhW?=
 =?utf-8?B?c29CalNYWmFNcjRKdnk2SmErblp4WUQva1RzQjljYWdJNjQ2YnZjQ2Fjd0NX?=
 =?utf-8?B?bWE0TzNHOWJKZE40OUJQamQ1YVhOaHN5RjgrMklJbzRVSlYrVW5rdUtWblkx?=
 =?utf-8?B?c2tHeS9KYzFZNElrSjliVWpSbEFVNW40dkVwMXdZVWdYQzdtd3ZBVVU5NlN1?=
 =?utf-8?B?NWJISFdvOTlra2UzY3lmRFlWdnRheDVVWUEvOTloVkdGei9CUlBWSmFLUUVj?=
 =?utf-8?B?WDY3bjRQVHZjSTYwSVkvTEpTbU5NOEZCRjlJODFBNk9iQ0JBWFhkcnVZYkJy?=
 =?utf-8?B?Q1V5V1R4YlV3dzFkMHB5SHg0bGlCSzd6SXdqWFR2NlZXbjlOKzdoQ2Vmc21O?=
 =?utf-8?B?a1VKLy9nU05jVExkR1lXQ2ozRkhjODArMHkxS0dHMHlrc2xLVmZTS01mclc2?=
 =?utf-8?B?bktGNWdzd255U2x0dGxWR1loMnc5UjBrZFArYityQkE1cDdjZ2J2TGF3N2o2?=
 =?utf-8?B?ZGN1bml3QTJ6TDQzNDRtWFlLc2xsV1Nxb2FxYTlIUTVsSDJyeDBwMk9kcWJ5?=
 =?utf-8?B?b29RMmt4cWV6TFZKa3Ftc3FJQkljVFJETUwva29WVmNicEg4U0N0aGVuRUJx?=
 =?utf-8?B?OW1OOHVJOHRSaloxYVRWWGloMXA5c1JnK0lQVjFhZ1RoUW1JK21vbmVDWUVp?=
 =?utf-8?B?NVRLVjZEUzhGWlFTZG02a1F2MC9iNHY1Ti9jWHZ2R2J5Mk1BZVdBREFwV05o?=
 =?utf-8?B?UndOWUU3NDhvSEVtdm5UeGpTYnJhMlRlWDloNVRZRUJqMVJnTi9hTGhwMWFJ?=
 =?utf-8?B?OUZ2SjNsZlpnZ3dyRnJSU3ZUR2t6ak5pVjBGTmw3R1VpRVdHTzg2d1EwaVpJ?=
 =?utf-8?B?a2g0VG50VVJiRGV1dzlNSDZKRHFQbFVsR0xpZXVzRUxjSzIyRmtaWFZFM1FI?=
 =?utf-8?B?V0dQNXJ2TURUU2VnbXhkYzZPV3J1MU1ENG5tZEJXRTArNlZ6Nkl2SW5JZ0dq?=
 =?utf-8?B?QklBMnF2Ykxhek02WlhpTW5BMUhyYloxd3BVT3VXeFdxd01ld2xZMjBnZ3BY?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2ced25-4a76-468b-3e63-08dd1e9d4b70
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 13:18:36.8633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNyzRuZVYy15tzgNT/owohOTI1lgtifp/xJjIrUj0gKR83noaBSHu0rXuDxcWuZoi6Sl/eJl9QffluTuVAIvhiE7XGxvotYlZtJUWT/ba5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6511
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

Hi Sebastian,

> Expected value of 0.90 may occasionally not be achieved, either be
> latency in the scheduler, or perf reporting. I'm lowering it to 0.85
> to match actual values ​​(87.5% in last fail).
> 
> Resolves: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12943

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Krzysztof
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tests/intel/gem_exec_balancer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
> index e7c43f1b4..c3f0c938b 100644
> --- a/tests/intel/gem_exec_balancer.c
> +++ b/tests/intel/gem_exec_balancer.c
> @@ -614,7 +614,7 @@ static void check_individual_engine(int i915,
>  
>  	close(pmu);
>  
> -	igt_assert_f(load > 0.90,
> +	igt_assert_f(load > 0.85,
>  		     "engine %d (class:instance %d:%d) was found to be only %.1f%% busy\n",
>  		     idx, ci[idx].engine_class, ci[idx].engine_instance, load*100);
>  }
> -- 
> 2.34.1
> 
