Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C92DC7EE30
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 07:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235D310E2F7;
	Wed,  2 Jul 2025 07:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9mV1JLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE7610E150
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 07:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751439731; x=1782975731;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Lqz483rL6YsBGBQD63Xf4tW2qzqNt7KQ7hdpd1QFgkM=;
 b=I9mV1JLkYfx8NNX/2GvEb5YsdmzMPWQq/3cvMAmKEGj36M57noZ1vxtK
 SsOhyUM5Iaqa9LJIuzBJgzey0fQRHODbfAI0iUwad8dmx11dMpUaXir89
 wiTnCEzO9QlYqNz+9+vB1rR8JdGSrX1S1jQ9mtdnk+flu3E9RvKVGscCA
 symVRgKL49M4g7liJTv3G5uwfZ33tDb3Ps+n1OBgYPBG57dIVWiXT3Trx
 KNZCEUujBt/L6MdsAq7bZRZvCPDqIu2M8aEK6A0Ocp8vuAIwTsssjtJ+1
 4TYUHBsEoqk20zDB2AmF3nl4cUVuPxSLnR8V2mZlcs1n8KikDkn+Zq/wn g==;
X-CSE-ConnectionGUID: vmrUa0/uRHGgfBPIEfcguA==
X-CSE-MsgGUID: Fc14eMJnTFWVETh91ADeCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53834238"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53834238"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 00:01:59 -0700
X-CSE-ConnectionGUID: vFjq9CldRdCx4uFjIGpXJA==
X-CSE-MsgGUID: WZ0zAMxeTJmFeudbJ4a0Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158549030"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 00:01:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 00:01:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 00:01:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.75) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 00:01:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEAQIOcaKWTWi57DEkutJYG8XHZ81FmTD7AyAng7Si4O25ocPup8B0746grpwv1vnOQX+ad3LbLZgXqU6e+nY+a2TO0B903PEmWS8EOFblq1Ma72T/fUAKQ4r+veSJYjMs46Hj40BEbpJKj3kohkSOoK0I3/5l/QTYWfxSPDZTLjMv/coyKo0ikq8OIhP0zf1Fp8Ygv9naXSjLUh1eN0OsguFC3hvPcDZ5a61OxJwEEGuh9bqynQJOVHOoKqbxzKDrhsiSnjjfSQZQQraKLvkaIXUOAgymb7WE7mG6FpPu5hsgQxbzl4cp0krVV1MYKrwaqVNQR+8IVV4E0clPlfGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBC7aVOX6jxjJNodFY7EjsPUWOQY9CvPnaDC92UpNU4=;
 b=f2Hlj0nkkMUERUkq5UtzaIbbwAss+C65vivzuqmsX10/32FcOFKXSMzywq4okN65QWRktDZn5nz7qpA+MF9/VP2JpXuXA4cE3h2ROyNDCEQpu9daAcs2eNvk7VzGHTKTQ+AoOib5tzlHq/jzmHsYJPZQqA5EZf4YPt+7HcMeX5PwBieGwWjRykROv5MfNxJb121Td3gF1B2EDrLr/wRRdM8W5yZ0aJevS15R5gdB8Z5478xcPcTvvD8FHkDOBo9vKD3FlTWaanQsyDWNHP3ZAhEje9gk/pda8fDpJEnQZ3ERwkoHz9bpFrXJoPEA3/p4qcqcTK+EpzdrUbPd6zNssg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS7PR11MB7737.namprd11.prod.outlook.com (2603:10b6:8:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 07:01:12 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 07:01:06 +0000
Message-ID: <320774a6-4975-4b9b-9765-8bd6e43d4f76@intel.com>
Date: Wed, 2 Jul 2025 12:31:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/kms_flip: Remove assertion dependency
 on link reset retry condition
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <mitulkumar.ajitkumar.golani@intel.com>
References: <20250702053415.434831-1-ramanaidu.naladala@intel.com>
 <20250702053415.434831-3-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250702053415.434831-3-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::19) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS7PR11MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 60fd810e-a493-4f7f-d8a0-08ddb936373d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXZ1QUF4WU5zSE02V0o5WTFTc21Ra0NSbnM4MHJXWE1Qbnozd2ptUnU4MmhB?=
 =?utf-8?B?bFQ4dCtLVDNNbjJBaFhKdncxM3BjTDlBTUh2Zm4yMjFWVkpmUlhsNDRVWFl0?=
 =?utf-8?B?Rm9KS2p4LzZiV0dEaHVRSE5UOUtCQ0ZyVm9keHk4UkYyTWFlYmxFb3VSWDRi?=
 =?utf-8?B?YU1iVlZqMEN5OE92eDNsMzhUZldzaW1aY2I0VHJBNUxOVmtGc0ZWUVVpcmsx?=
 =?utf-8?B?Ly9YLzdjSS9nMFFOS2todEZiQ0FHbXBEYTZjQis0L1RVVnlpdllRV3dNUC82?=
 =?utf-8?B?cENESENTMkNOcjYrMENyb3dpQmcwWUV6ZUJ3WndHZ3BuVXFpdjY0dm1GeUNC?=
 =?utf-8?B?d3NJV0tHTWY2ZjVuTkFJUVZCZVZJMFJ6Q2F5c2xGTVlJL3ZqOGJJZU9DSjlL?=
 =?utf-8?B?bXlSWFI2UnNINm42RzJWTUtBYXJXL3Q3d2VRVTl2RkxpazlmQi9TSjhPYkJj?=
 =?utf-8?B?dGhCMFNOMHBBNzlJTFE0Z25vZEk4YjRJY3I3cnRuTlBqMUVVTENxZWlVTTRv?=
 =?utf-8?B?OWNCMGRCUmFYbXFZVUozQmg2VWFpemFzMXVaR3QvNlZ0UWZnQS9CUTVIbXdR?=
 =?utf-8?B?Zm5ITnF0cFhVOGpBZkZzeG1SU0QvbHVsdUdDbGRXVldaUC9HeDg0Ui8rRWFT?=
 =?utf-8?B?eEc2YzN5cUxuRlVjWktUMEpydmZnMFg5RTcxUXBWWDFJeFlNUFAwUTlleWNE?=
 =?utf-8?B?eWduK3QzYjF0RHViZ2FsZWdmandaQi9BZFdxbjNyZ0RyUG14YUgrSEpKdFBs?=
 =?utf-8?B?TEtBTTY0anlSYXhJMjQ0c09HQ2tyZG5ucXg3NXF3ZG96ZjIvblFIOXluT2lK?=
 =?utf-8?B?VHNzNTVnRWZKUG96aDNtL2ludjlsbmFaamRlYllGNm1QdkFVNkwraS9zWTVk?=
 =?utf-8?B?WUdMWnFrSU5WNEtiRTFFOFoxcU9BMVh5ZVdnWW5ra1hzRGRzS0YwaTVqSW5C?=
 =?utf-8?B?bDZ6VUZEbkx0L3JwanAxOWUyVVY2c2QwU2tiODVrcDVvNUFPWlE3YVg5RWlI?=
 =?utf-8?B?bmVSWHJuUG81ZVByQ0FMdW56YzMrYW45Z3V0SnEva1dDSktPOUhFSmVGdFMv?=
 =?utf-8?B?YWtpaXF6bGZCWWtVbEF5bytZN2ladjBub0I4Zmt5RnhCbzBhemxLRldlMjRG?=
 =?utf-8?B?bjVleUZQZjh3TjA0WVRXbkZqL1FkYXRxVkYyN1ZZcmgzcEZBTm5QMUxtQ0Vv?=
 =?utf-8?B?VjVCRWdVYmtxWCtDVWFDZG1wOVVGdEFKNWplRjB2YWhOVTJUYnpaTmxyK3RT?=
 =?utf-8?B?MzdCbDU3dE8vVVBEcnI0MDE3L004WTI5WEc5UVc1eElnMTlqWkRNZG1saTRS?=
 =?utf-8?B?UTRua0poQjBwTVEyVHI5azZnclZhUTJ1UEoxSGxBYTgvNEc4K0VYaWxjWjU1?=
 =?utf-8?B?VE41VVE4aHp6aHVtN1BNcWRtYkN3UldyMmp1WFRnMW9wVzVYUEhFbDdpZmVR?=
 =?utf-8?B?cFMyYVBXUlVlSEZhak5XNHpVdU9Jd2JSM2F0Z01XUWsrUHBOMHc0dHZreGpB?=
 =?utf-8?B?MDBKRHV1T2pIdnJ2QklqVk1lcEJBUEFtYXl6a09YWTh0RVRpQjFjWklCNlJG?=
 =?utf-8?B?Q2FxQW5FNjNnajhQalFCbmsxK3J0WnJubjkycXpkc0hyWGQyQ3lmZ0tkSTBU?=
 =?utf-8?B?U09HaVRZbU1kam8vaUV1MjFuZkwwMzYxSGZLeUJYZStTMVQrekJWTFlUcEZC?=
 =?utf-8?B?dTk1UmZOeFdjWk9aKzFuL09xTWdoQW5jOUlpWEpKU0ExTzhpUjA0VnFuTlJI?=
 =?utf-8?B?L01lVUp3TnYyZllCQ3k2VFBsVlhJb2c5d3NTdk5wZW0vY051cGJzWHdjajJI?=
 =?utf-8?B?R05ER3Evbkx0N2c5c3RaNkx5LzFZVUJDeE84ZkVNNGFyWHB6U0JWRnVDUzhY?=
 =?utf-8?B?NUY4ek55NzErOFNkWnZnbnA1d3NNUEN6OC9mUkRDZlZEVDZvMHFiVFF2NE41?=
 =?utf-8?Q?tpEVG0r3p/w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmRHcmZMd2ZlaCtjQW9Yb1lvNktYLzFxYkd6Tm5EVWhyMVFMK2Q5eHp3eUx6?=
 =?utf-8?B?di9GRUFuZjEvU054RUpXWkJCY1JMVVJoQXRMajNXMm4rcThwb0JiYWMvRnpy?=
 =?utf-8?B?d0FxZnNnYUc4RjBGTmY0WFp0aGYzb05uRnlXeDFpbWtnR0dhZDFiYlFtcWxO?=
 =?utf-8?B?SDVMejRIRm96Qm1oWDlzU29ZOTRMS0JtajlNQWV0eTFlMXZBL3dnYkZlR293?=
 =?utf-8?B?MjZLdDRLY3YyZUFBSmhQaHNFNm1YRHFGaEJ5ejVzQmZ3M0lPRUFkeTl2eXZn?=
 =?utf-8?B?M0ttaU8yQk1Ta2tMaHpENWU2THkxWlpGSnB1U2hBcXNuK3Z4ZzZ2bnpLcHdz?=
 =?utf-8?B?Q3RmQ1grN1pCUzVsTVhrenhSS05VOUJCWmNaYmVhNUQxeTZPNWQxaHBNWGRp?=
 =?utf-8?B?SDRzOS9DeUhyOGMrcjc5c3ZNaXNEaS92clR3dm45bjVtZTN5aWo5b1BIT1Ax?=
 =?utf-8?B?MUVnYlVOYmJkU2VmcjM0K040Z2dIL2lPeWZNd241TjJiMUNBdWRZc2VObzZq?=
 =?utf-8?B?K1FKMWlncElLTGIxdVFkcHZJWHYvNXRDOU83ODVNcTBpeWxHTkEzT1BNUWdB?=
 =?utf-8?B?TExZTEdMR2pRMDRFdTREYnJ3Um9QNE9BVDBlOXBRakgvb2Y5UkxZNFdOR1FY?=
 =?utf-8?B?UnpOTWREcGFOb094TFlrcXVUbEpnRlpxelVINGVXb29xalpteHpCQmFUQ1RI?=
 =?utf-8?B?cXhMZVpVMEVxVFA4RHhvT0FVbUJ6RHFZOXpaUnhDVWs5Y3REN1l0UkRJT1Rm?=
 =?utf-8?B?UFpreDhDNFF5ZmNjQks1aE5jVmZTUlhaaitKVGR5eGtKRzNzLzQ3cFNGWVlH?=
 =?utf-8?B?YnBCbWpncHg3RGVDWlVLdFlyY3VXYkNkbUgxODVQMjBpL24reDVVYUpYb21t?=
 =?utf-8?B?UUVTb1U5aGg0Zm1qT1ZmQTM5aEgvbFBlZFdTQzV0SXZQbWVTYUZJMDdXblFV?=
 =?utf-8?B?cFBKdW16N3Y0VTlWT3dhbUJQUnZaeU5CVDhSbSsrS0RWVkU3Z2crLzVhVXBX?=
 =?utf-8?B?TE9vNHN2L1Nkb1RzeVVzZEN5Rk9Xem85RUROWTRVSjR6aGRQU1ovdUJSQTVL?=
 =?utf-8?B?ZVR0RGE4YldUcUJKUGxuZ1NZam83RDFDU2hSYXlzUzBkczFFdVF5aDhYRWpP?=
 =?utf-8?B?eVl0bE5PRG8rRlBCMTh3VUxEU001dUF2L0w5QTBJb1JLbDhNcWt3UlNuMVlo?=
 =?utf-8?B?aDNKbEFRcXkxQXFYdnpMUWFDQ2pBQ2NkTFVOVDU4T25ZYXZhTjQ4SUVTZFVp?=
 =?utf-8?B?WWlWbFYyZ0QxZWoyZVZQeTFYWXFUaWF2dGZqWVBEaEVmMlQ4bEpuVFVmcmx0?=
 =?utf-8?B?THFYK0V1Yk5mano5OFBKMGxSa0QrSHBIdzJFWitLK2JpeGVmbkIwWnZML09I?=
 =?utf-8?B?ejN1d3JkNmhXK3NHSUFaTkRqMkNKbmNwQ1RhRWhCV0pqeDhFZU5CUEV2YVNr?=
 =?utf-8?B?azhveEVVOUlkNS93Z1RIQi91RGpMcUNicERQNFNNa1YzMTVoekNybTc2bWlD?=
 =?utf-8?B?TWM2NHhucFg0cUVIRkxuNk1JdW5qS0dqcVBNTkJ2NGR0anowRElyMGRIRDF1?=
 =?utf-8?B?T1VYVFZSaStFWGZuMjlVSTJjN0VadzBteGpVbUw5R3hLMlpiTDhiSlp6bjhQ?=
 =?utf-8?B?emIzQ1pXVEFPbmZ4QWRWRXNyU2xmSWhvcWtaOVhjQUZRVFgwOEQ1NnJPSnZk?=
 =?utf-8?B?TzdPeVByRlg3NkFMMTN3RVV4aXRld09ETndST3I2VHRQZUw0eG5hUDJhSDNV?=
 =?utf-8?B?Z3pwRWU1dDRLNnA1cWx2ZTk4bkRNeHdraFRJSXlpbG42RndZNDllZzZrYjR6?=
 =?utf-8?B?SDkrOUFWbkNGWmVvNkdOYW9JOXNVRis4UEtOVmhsM1lmWWVvYnJtSWdpbktH?=
 =?utf-8?B?SEEvV0tvcFlJRFkvaWFub0FyYWRMUnhVR0p0Uzk0Z3lNOFlZQVRuNE5KdkVM?=
 =?utf-8?B?TWUzZFdnZmJyQm94YUEyMExxeU1iTENuT0VsdzB4bExzTXZVMkgvbnI2OWh4?=
 =?utf-8?B?SnpEMU9wUXhNYndrNWRCVk9pVXlSbTdZNjV1NkFlQXF3RndzVlVaQWh6dXdC?=
 =?utf-8?B?bHBoQ3h6QVR2Q3ZsdEd5K1dxRlhnZjF5K0lyTUdoTm1iVG0rMnRUc05vZkQ4?=
 =?utf-8?Q?2TQ4LT/Y8soiqCpTJLcedpFbO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fd810e-a493-4f7f-d8a0-08ddb936373d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:01:06.6353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4QDmD+15o8ae8imrSVRGQxsV9FME3xFZi0MPIKRRk9LCHDRbCM2/WddnoJddj84ZhDFzuvfKHggVdgHPOHMAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
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


On 7/2/2025 11:04 AM, Naladala Ramanaidu wrote:
> This change avoids test failures in scenarios where hotplug detection
> is inconclusive or delayed. The call to link reset is retained for
> its potential side effects or logging purposes, but it is no longer
> part of the assertion condition.
>
> rev2: Fix review comments. (Karthik)
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_flip.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 4dfa1c483..382b92d9a 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1641,7 +1641,16 @@ retry:
>   
>   	/* quiescent the hw a bit so ensure we don't miss a single frame */
>   	if (o->flags & TEST_CHECK_TS && !calibrate_ts(o, crtc_idxs[0])) {
> -		igt_assert(!retried && needs_retry_after_link_reset(mon));
> +		igt_assert(!retried);
> +
> +		/*
> +		 * FIXME: Retried logic is currently breaking due to an HPD
> +		 * (Hot Plug Detect) issue. Temporarily removing this from
> +		 * the assertion. This needs to be debugged separately.
> +		 * Revert this patch once the HPD issue is resolved.
> +		 */
> +		if (!needs_retry_after_link_reset(mon))
> +			igt_debug("Retrying without a hotplug event\n");
>   
>   		retried = true;
>   
> @@ -1680,7 +1689,16 @@ retry:
>   		state_ok &= check_final_state(o, &o->vblank_state, elapsed);
>   
>   	if (!state_ok) {
> -		igt_assert(!retried && needs_retry_after_link_reset(mon));
> +		igt_assert(!retried);
> +
> +		/*
> +		 * FIXME: Retried logic is currently breaking due to an HPD
> +		 * (Hot Plug Detect) issue. Temporarily removing this from
> +		 * the assertion. This needs to be debugged separately.
> +		 * Revert this patch once the HPD issue is resolved.
> +		 */
> +		if (!needs_retry_after_link_reset(mon))
> +			igt_debug("Retrying without a hotplug event\n");
>   
>   		retried = true;
>   
