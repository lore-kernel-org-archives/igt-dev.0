Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C055DC19776
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 10:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F36310EC54;
	Fri, 28 Feb 2025 10:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NL46lV9E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8B310EC54
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 10:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740738863; x=1772274863;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p8HHYcgN4niWOmTartw8T7fi/xlMBVDYvxwWXKn/nkw=;
 b=NL46lV9EQMqnvd9QRqGybhLNk47RhxW5ZoG3kHq//UHhVftgP5x2cR2L
 Ru7k2+UuJ5aiUnmNrWAyjlB2pxjiFEKusrWNvcG26i2Ic+3NFsbGVBazd
 /zcnKJ9Pv6UoYL/kElf2MegpHrPmUyOvGKX5JVD4zpbuIRBJt/FypvE7k
 hgdq2yZVhJJRATKn4Gm9mW52fja0uYAUcjSJ/v7Q75456FqjZV6ETTULZ
 nOGch7URChNSfgY8a5nxhpAAl96hvCy3d2kE70J/5bzvjnLJIpVhmopGp
 EKCuAnqdIs6dRYNPj80pRYa7OQ/pc8LSl1Kjf+HaO02FiXvlHyuIL1Fvt A==;
X-CSE-ConnectionGUID: GncCqbYRSoG4Rd2RhXlZbQ==
X-CSE-MsgGUID: 0HtG0L/9TOqYLPYhhBVigQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45443491"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="45443491"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 02:34:22 -0800
X-CSE-ConnectionGUID: N7wqEF7pQ/KEXdJqyFLf0w==
X-CSE-MsgGUID: ywfos9mkT5eFCwRZCzG0/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117066230"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 02:34:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 02:34:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 02:34:21 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 02:34:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtARgGa38DDzOYXDc5WX5Eaev04pXFUycRh4EZnZdHK1BEZa1QBeUTfZ3yV5Sy0Plox8rKZX0cn4n+9ynYWH9B0rvzi4Qej4Ema5mCS1rqDcAezODRLg1X5G4zbj4Q7/Yi3xXFTcZRrzpsP+nMjGM8dXFbN4ADb4JdCtiUQArmOa9E19N2+OckEhlEeMqBMeKUPrY8ThqFl1v4lqx1yrgwyx+000QzfYdh+b71VIwnPYYlZLllOiSVisXiNF5Ep5GKOZ3j8m26Hb0jJ2Wd/4KYt6dGGMyz4IBhk+UNCcSf+xysNPkZueg991rSnfdH7qrRz0FHeUg1yILFLhC2GUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5+6Sy9lj1kShw+qIfTF4czCpBwzRLEIuAeRXI2FtvU=;
 b=g0gOuDa2kzwKOP3ofrtda1idHElJkp3JvLK8/1kfb66HuZQJCO4Nsi3AguDgSwu8o8HPISHwHlMHOO7i3wxRZ+elTmUPYVLNqBJtG4+r2dwmDb6pgNqUF70AZcFjGmD+udFqHmuW/khKkh/syJZ+51Z/CTskxec44fNyupItcQ1ar/qGoiNIbD+JzWapylFxBOMBoJx7ThYBHYhLgzxXqi4gI9PJmaHuPUtoU3LDEn1hsFx0piBsN0U95JLh+vSW3RAqft606ivugibJp5Cd7ba5fKYpL7PiSIz54bDs+opE9Qf+tGIyUQg+IgHTLu6px0z5P5/AwHs9ObLTq0Hnrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SN7PR11MB6852.namprd11.prod.outlook.com (2603:10b6:806:2a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 10:34:05 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 10:34:05 +0000
Date: Fri, 28 Feb 2025 11:33:57 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t v2 2/5] tests/intel/xe_fault_injection: Make
 setup_injection_fault() programmable.
Message-ID: <Z8GRBWXGkqZIL5_u@fdugast-desk>
References: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
 <20250219073445.31423-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219073445.31423-3-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: ZR0P278CA0161.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SN7PR11MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f400f16-374a-4727-b265-08dd57e36cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVNsZjM5R3BNVVVYb0VPQWZVWHRjV0hHcUJ5S25USktxVmg4SlQzWFkybm1N?=
 =?utf-8?B?OTFRcXBnVHlrSWI4VDBlUWc3ZlVqSlJZTnlmVWZNQ2d1cjZuSDBtWGlmK1Z5?=
 =?utf-8?B?R0pKM3QxOE5lWm1uTHBrdjhxZjQzTGJRNWozYVBrZTFYZm5oQ2pBYXFlZlc3?=
 =?utf-8?B?Q1VKWTRaaDNWNkw2dDZvNkpsMlcyblI1SlZBc3VPbG16d2pjOWpuMVV0cDdx?=
 =?utf-8?B?MzJSVmF1bysrTCtYbWNaNXNLWVl5Qys3NFFpTDdvN0ZrMVp5bll3SklOYWtJ?=
 =?utf-8?B?VFBEUjhpVHhyL05zajBvMlUrQ1J1c2dlY1dqejNMOW53QVoxbkR3clhEa1FE?=
 =?utf-8?B?Ym9kRHkzOFBwc2JCRTlhdGtnRHRWVTUvYm1MQkdBM2gyODd2WlB2QXhFWjhy?=
 =?utf-8?B?ODlURVVqVlZyenduOHlsc3ExMUR0RXltMFUvdHN0aEVmUDlEeWJjMjhIZmFu?=
 =?utf-8?B?VE5mNDVmY3JGWTJtaUR3S28xZExMWDhhTXJrcFpZV1B0aU0xaU1ZY05naDZB?=
 =?utf-8?B?ZXlhYzYyK25RY2VOckJFQjNHSk1ZNHJHeGNSYjE1eXZ0bm5OdTg5blMyOUtP?=
 =?utf-8?B?SS9mUkVBUk00NmdsTmFNNmVEQktjcjBGUGpveXAwK1Ivb0tONUg5MU43YmhR?=
 =?utf-8?B?MmNselZqS1g4MmlNWGZ5N2ZEK25pMFNiYUI1RDBBdnZCdTdVb3YwNVUzVExq?=
 =?utf-8?B?d1ZlZlFJbEwxSUhPaFNtTkMzcy9UNVVMdENmbzBFUVphMzRkVExQWkwvZk5z?=
 =?utf-8?B?RmYvbWZVYmhvamZxUlQ5bHJhTWM4T2pHMFFVb0xjZGdzaDc0UjhxTjFLa0cr?=
 =?utf-8?B?Zmhhak1qcmh0ZUIxZHJqQll5T3d1ZGZOWEdLUXFKZVNlMUFTaE9FeVl2RkE5?=
 =?utf-8?B?Tk9kSmhnaHlqNFBPZkRqZXZjQmhrR1lXcDVxWDY2cE9sOFc0RUYxVmNkd1R2?=
 =?utf-8?B?clVsR0tMd0s1ZlpRdk1hV3d1NkVIOFNMcG9CdXB0MkR3d3ArTHE5QjVpeTgx?=
 =?utf-8?B?UGFVdkh4TkJEdzE0R3dWN0Q3cVdhV1VWbFcyeUhmbDVSc2tBWTRYNTNRZjFR?=
 =?utf-8?B?U21nMi96MnM0d2FuNHAxT29UdTZrNmdaQkNxS1JQdWlBbEg3WlZyaVFRNU9l?=
 =?utf-8?B?SFZuOUE2TWpxb1o0eVhTZit4RkNQZ3lHdENCMGluaGpkaWhHbFpWcEZxYjNo?=
 =?utf-8?B?THVHSUszcm56QnNYOTloT2JoQVVRM1lHTFREdWZhc3hhQ3BSL3hqNkcxWlZn?=
 =?utf-8?B?alhaVkYrWldoWmdOTHdPcnFZZFpSeHdZU2U3OHJhVW5WaTFoZGVBOGZFV0tk?=
 =?utf-8?B?NjBidmZCaG1PVURMeW5pQllEL3pZQTFRNG9RVWx0aE1NS0ZRWHVyTmZKRWhm?=
 =?utf-8?B?Y1d6RlVDR2lnczBKYU1LU01tTWZBakpNL0FkdFZhR2V6Q2JBOVNBYSt0UGV5?=
 =?utf-8?B?VEhxMzA0ekd0TW4vTGlqUFN3WlIzTGIxZStzUTdRMmdxR2tBRFNaS0owank4?=
 =?utf-8?B?OWJiNHkyZmRSbkdOdGU4WnVrcmNpQ1RTZDdPTUVPWE9qekZiNUJuL09qcVRh?=
 =?utf-8?B?Z01LMHdYeGlIQUpJZ2Y3NEswNVhRbnNQZjZWdWVjcVA2Q1NseWo1RkZCTE5H?=
 =?utf-8?B?RXlBODBKa1NaT2ZMcEJEcXAzQXZWeHlLWlFVNWNJYVJZazdQTUdpZU5yUHo4?=
 =?utf-8?B?d2FzTGJWZFl2TVdNYXVSTndjVTVkTVhWMzVja2NHRlh2bTMrdEZJZ2RKdFR1?=
 =?utf-8?B?ZzNOcFVCVkZsQ1lzZC9Gd28vYytXSUZnb2U5Z2k2dUxFTXNaRWsrMlJrRkxj?=
 =?utf-8?B?dkQ1SlRSTXZoUUV0Tm01UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWYyaUFzRGxhc0k3L2FwaDlYVHRRL0hpZW5YNHFsRlVLcnY2NlBtdGtNVUN4?=
 =?utf-8?B?SG5RKzZRSWc4L2MwdFkwaTBsbnR4bmVaaHMyV0FpYWJ6RnFEWVdFVytvRVo3?=
 =?utf-8?B?cVAvdTF4dkNXUnhQTnh0SVJJdlhxTnA1bFFBd2g5Q1FJZ21ELzJnd0FVNzl4?=
 =?utf-8?B?OU9vdWFtTVlWVk5NMmxVWFJlVW1sSlJXRDJicXFTNldpRUhEM3laSzhYTXJv?=
 =?utf-8?B?aGNwc1VZQjBSMTdOTXJVNmN6OFhoeTZONW5rUG5UaGM5Y2I1NmJka1dUOENs?=
 =?utf-8?B?djl0c0ZjdFoyejZpamo2T2tHOG96OFp4blB5QkdGNk9lNnVKdFB1RXM3UkJM?=
 =?utf-8?B?b3FhOTJRSW9LU0ErVVh5aWFUUTR2SnBDNlhtRWs5aUs3a2dZWFlCVEcyMTRs?=
 =?utf-8?B?NXRKOFhmRTFIVWQxZ0p6SEFDZExSbmJxeUN0WFFTME1QeU5lckYrSFZPTWtG?=
 =?utf-8?B?dGFHSnIzT3NkZzR5eHU3djViQy9ENVZaYUVNNHJZQlYwd1ZLU09DVHFWQ3dj?=
 =?utf-8?B?andEYzAxMDZkZ2J6WWVuSFpMdWFWM0FiZkpOTzZ6V1dud3Y5T1hnL2RrcVlZ?=
 =?utf-8?B?SkJ4Z2J0TC9WQ0VpbE5WU3VKeGwxZjlxeGZFN3B3Q3hhcSttdXovWW50di9P?=
 =?utf-8?B?VEpSYUc2dm5jb1ZPSUw5YzdyT2lOdnBMUEh2SDNDcysvdmdkRlBrZEloRkN5?=
 =?utf-8?B?S0NKVG5UenNnRGdYRnBTelJvMktZMGVkVUVYR0dHTWhROU1FYy9YWmpudlZQ?=
 =?utf-8?B?dUVPVDhObTZmSS9yRnV5R3dNak5UdFZReFlkNHRLQUNkRUt0amVIRkhzS2dn?=
 =?utf-8?B?cW05USsyR0VJNWhLTHpEWU4vUk5YbW1tb3A4alFwUzl5Mi9yR2xHWC9UcVRQ?=
 =?utf-8?B?WGY1TDQ4UkRHZTNTMVZFQ29ZakNjYUhUR21USllHTVg3T250K2lhUjlnalU1?=
 =?utf-8?B?Z2Vpb3hCV0cxVi96TG1OWmZPWE9MMS90OEsrVG8rd2I2NXJLUkFKbjF3dW1N?=
 =?utf-8?B?VDcxVi9QK00xWkd1L0hhQ1YxUFlGL0dNaXdndDVuSjlmanNYSHBvV25xRmpW?=
 =?utf-8?B?azJ3U00xQmdqeldzNU03SmhEejBtaVVVa0plOHVZbDJBczdpbzVMcURtY0Ns?=
 =?utf-8?B?L0xqMGhYVUlsWnZsMFdMMGxzZ2l0SENNL1hkaWt2YVJtbWRST3VDNno4d3Vn?=
 =?utf-8?B?cWxPRm9zd1hyaEkwOExaVm1reDNzYUw2TXQ2TUNyVlpWNVdLMDdCM2NnRzhB?=
 =?utf-8?B?THVlLzl6N1dnR2o3VDF4TTdreVpZRE9Lamh6L0hNVE1IT29SaE5kSVV2dzI5?=
 =?utf-8?B?aFpFNWpGc01hd1N0SUt2dVVjcytDSHJZMk9YZDdtZDBrdktLVmpZakplbmJD?=
 =?utf-8?B?VjNITXVVYXJ1RnRJRlJaVFduOUlNSkk4Ry8yRkludi9uOVY5bUVoazlvc1RW?=
 =?utf-8?B?bGx4b2F0SHQ2eXdXZXhjUVhEVENyOUgrbVRKZGpWb2pNYS9ZR0lmaEU4cW1o?=
 =?utf-8?B?c01VR29oOTFmOUFsV29McEV4Z085R01COGZhbCs1R1RUdTFGUjl6UlAycDRJ?=
 =?utf-8?B?YjY0b3cxblJaZnlOQk1IK1RZVmdzMWhHYnhsK1ZHZGZ0MmhGdVc3UUFESGNH?=
 =?utf-8?B?bmRpV2MraUtDWUZmRGRUVU9EUXdWeHN1T1JMRE1KaFNXaXJzbWFGd2NLYTBE?=
 =?utf-8?B?eVpxeXJFYlN4TlQyYmRNWlYwS3ZVN0NCSWFiQU1qQzVoVHFUTlYwZmpjU0ND?=
 =?utf-8?B?SU5mR3E4ZkI2b0Znck1TTWNWSmFacEdxSFU5K2l5QUFNM2JiVm1TRkxaOEVX?=
 =?utf-8?B?ZWVJKzZqdzVTd2ZJV2xVcUxWVkFxbW1sbytQbk5JUUVnWmFFZ2tWZFBZK3lQ?=
 =?utf-8?B?blI1bmx0V1dyUDFZdjZDcDNQSG52Q21kYjRwQi8xczh3MlJGTmQ2alRadk5R?=
 =?utf-8?B?NzlzSXV1d2U3UjNVUS9CQVpaQnIyRkFrVXNhTDNXR0I0YWx0ZGdvZHBaVjhC?=
 =?utf-8?B?YUJKL2JYOWxCeFluVUo3d1VWVU9HeDhmMElCY3N3Z2ZEU0JwUTdqWk5tWjh4?=
 =?utf-8?B?S0U3VDRsa296djNLM2hPN2pCZFhPb0JKanJGTTRXOTdKN20vM3lCamNuamx0?=
 =?utf-8?B?NjhlaWdmc2tTTmNNdXN4RUxxc2RhNkdIaFM2YU5xU2RzcmlNTVY1ZDhMUDE5?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f400f16-374a-4727-b265-08dd57e36cde
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 10:34:05.3268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TY0ZPU31uIWYWj5iGFe+gQ8qeKuyn+GuNIAKgHaIIYQwaGfGFpgs57a5WY9YeC/6KQ9BhKVdVVHRADotbgD1AWyfbyzlCPKr8tAVEIaMZzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6852
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

On Wed, Feb 19, 2025 at 01:04:42PM +0530, Satyanarayana K V P wrote:
> The current setup_injection_fault() is always programming fixed fault
> injection parameters. Update this function to accept fault injection
> parameters for better injection capabilities.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 42 +++++++++++++++++++++++++++-----
>  1 file changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 7ae941367..bc05515a8 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -31,6 +31,17 @@ enum injection_list_action {
>  	INJECTION_LIST_REMOVE,
>  };
>  
> +struct fault_injection_params {
> +	/* @probability: Likelihood of failure injection, in percent. */
> +	uint32_t probability;
> +	/* @interval: Specifies the interval between failures */
> +	uint32_t interval;
> +	/* @times: Specifies how many times failures may happen at most */
> +	int32_t times;
> +	/* @space: Specifies an initial resource "budget", decremented by "size" */
> +	uint32_t space;
> +};
> +
>  static int fail_function_open(void)
>  {
>  	int debugfs_fail_function_dir_fd;
> @@ -117,21 +128,40 @@ static void injection_list_do(enum injection_list_action action, const char func
>  	close(dir);
>  }
>  
> +/**
> + * Default fault injection parameters which injects fault on first call to the
> + * configured fail_function.
> + */
> +static const struct fault_injection_params default_fault_params = {
> +	.probability = 100,
> +	.interval = 0,
> +	.times = -1,
> +	.space = 0
> +};
> +
>  /*
>   * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
>   */
> -static void setup_injection_fault(void)
> +static void setup_injection_fault(const struct fault_injection_params *fault_params)
>  {
>  	int dir;
>  
> +	igt_assert(fault_params);
> +	igt_assert(fault_params->probability >= 0);
> +	igt_assert(fault_params->probability <= 100);
> +
>  	dir = fail_function_open();
>  	igt_assert_lte(0, dir);
>  
> +	igt_debug("probability = %d, interval = %d, times = %d, space = %u\n",
> +			fault_params->probability, fault_params->interval,
> +			fault_params->times, fault_params->space);
> +
>  	igt_assert_lte(0, igt_sysfs_printf(dir, "task-filter", "N"));
> -	igt_sysfs_set_u32(dir, "probability", 100);
> -	igt_sysfs_set_u32(dir, "interval", 0);
> -	igt_sysfs_set_s32(dir, "times", -1);
> -	igt_sysfs_set_u32(dir, "space", 0);
> +	igt_sysfs_set_u32(dir, "probability", fault_params->probability);
> +	igt_sysfs_set_u32(dir, "interval", fault_params->interval);
> +	igt_sysfs_set_s32(dir, "times", fault_params->times);
> +	igt_sysfs_set_u32(dir, "space", fault_params->space);
>  	igt_sysfs_set_u32(dir, "verbose", 1);
>  
>  	close(dir);
> @@ -322,7 +352,7 @@ igt_main
>  		igt_require(fail_function_injection_enabled());
>  		fd = drm_open_driver(DRIVER_XE);
>  		igt_device_get_pci_slot_name(fd, pci_slot);
> -		setup_injection_fault();
> +		setup_injection_fault(&default_fault_params);
>  	}
>  
>  	for (const struct section *s = vm_create_fail_functions; s->name; s++)
> -- 
> 2.35.3
> 
