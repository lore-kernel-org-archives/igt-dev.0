Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C6FC36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 13:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B90810EBAD;
	Fri,  4 Apr 2025 13:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKQqvSoE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7A210EBBC
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 13:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743772715; x=1775308715;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V/MNkSoEoAy5G9zn5b5uQXMv4/1JbhbFc8fhHZKaSuU=;
 b=DKQqvSoE1MtJweyzR+TeCXprq8TQ0i37ZE9lsDlomb/5NKB9JMyLfeic
 k1ZVBgGbAwFU+yiE+1uy8M4Kd6arZVsuVyODxnSvziHqDF5ZSGQBPLPjR
 aLpmuxS9IosGMoV4xnuVCkDpZpjGFyt1dwPDHmhQ6GFHNwnYfz+cmyN/e
 3c5n5uI1VOVscEIBqkekBJ4fvpZM6Ycuf2JRTspewebXqZjsH14B8z7qA
 jePYKPJmwg9vOsgGCS7tI9DAnHmpRmxM+/hyd5ev7VlcSRWVsW9DSSYFS
 uuCIEPl9aqUQqoB0XReeaTUZ/Hm2nMXTajQYTn5t7i+IdFjbpQ3uh4dA9 g==;
X-CSE-ConnectionGUID: uAqHv8G1QUuDO9o/xPJnGw==
X-CSE-MsgGUID: m4n/9WRZSCW67kLFCfotxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="62609926"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="62609926"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 06:18:34 -0700
X-CSE-ConnectionGUID: mLlNO4xkSvKZjrrWZdHjAw==
X-CSE-MsgGUID: QdFJEZHrQ3aJTLXVBOqRIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="127122512"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2025 06:18:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Apr 2025 06:18:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 4 Apr 2025 06:18:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 06:18:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZZBcC2YKdalb8Emljigwo5g4ln/rgqsE9Ve9n5pSCW6Xhj5/DDQYuVFONkjfCApTnbksrf77DPQcOoOwZjfc972hMBGIDVfKZ+P8mrWRECAQqnPlu5gGsTa0pR1k+YXuuKynNqiJAvuqrWgn3D65z4lbCUpSvhjfRo8S+PJO+FKYENzwjMylT1JQaQQcYyoddtsItzFlkTqeDdF6fs3qFiAtk8lUe9Tbrx0Ad1raOBK+PJNheffQvKJ2Vkk/DYNj1s0IgM5LgkozMxzgvKomEf3iTCChweZQ26cBg3hbxMgi9+PPB2SDeY76GFInv9WSXvMqoOwSUJBTlEWpPNfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUf3HwulGJemb2QNaJuF9Vgn/qzz1T5iW9HlMe7Ux4s=;
 b=cCgDwKs3zREG141Ci6LINOQmZtRv9dACQ/tIyQMaMvGQZ0YStflxwtwyHLdNzCPOk7wjSzsmrwYmLuSxZm9l9v6bohYCNGYzzu4VCYbY+y8n9moACDaI5tt6Ld9wJzwUA4/zzdoSZtl768DST1/RrNzubd+MT2lwkWWymyJ70xi3+xWGjwNAoS/JJEe5EM/VTPt+mUVVQT8iMjCa/gSZdcxMm9p6yLKfJRRleilxJic0/BzgjIg/KxYxoUGEER/hCpINeYaVqz7zWwJmwDf++eXxjzEFW2RbdHtNMk/qps/2loxo3qQRp+kpLkzT0CW7wYgsI3ZniZ56JOYyH7o17g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Fri, 4 Apr
 2025 13:18:31 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8534.052; Fri, 4 Apr 2025
 13:18:31 +0000
Date: Fri, 4 Apr 2025 15:18:23 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH i-g-t v2 1/5] lib/intel_compute: add support for
 stoppable loop
Message-ID: <Z-_cH6ObGAcVdz4X@fdugast-desk>
References: <20250404123140.260143-1-zbigniew.kempczynski@intel.com>
 <20250404123140.260143-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250404123140.260143-2-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 679a2ad1-c15a-4c0b-fb61-08dd737b31be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3A0ZDY5M2ZPNklEbVhwZVFoQm1CM3NORmhhMzlNcFVGdExIa043aW5TK2VE?=
 =?utf-8?B?b0x1TU5QYXdkem9tMlVGMnVjK3lJaGI0TTAzbFNqUDNnYldSb3NzaEd3d2R1?=
 =?utf-8?B?MFhEZUdkbElPUzBIanV2ZEZhSVhjbjdaQ2xLZjRBUEVNZkYwMXZVUzlHQ2h0?=
 =?utf-8?B?R0IzYW43dVNESDhMaFFRK3Bsb3VSVmk5K2RzcHhCTjhxTUR6QXlqUk1ER1hG?=
 =?utf-8?B?U2pMamt3cmJBM2RrL0JLNXVlWnJIaWV1dWxnZ2hxaVVqMEFCSm4vUDEyUDY0?=
 =?utf-8?B?bTlTSnpkZE1RS0NyVlJhUkxEcDl6TVZJMHI3VWZEWldNM3djWEVLTWZSM2JJ?=
 =?utf-8?B?RXZPV2l6aGt0VmpjZ1pFdkt2d2xhcGlCa0htelNQYUJ3RXUyMHpNaVI4MjlU?=
 =?utf-8?B?VkFjRmp0bThXNHUvRkJmVHhYYTh4N1BzQ0ZISDZIQzV4MEZ4UnZ5UFpwL25X?=
 =?utf-8?B?a2dBbHlhemc3SUcxdDA1TzdDTzVPR0dSS2tYNEFYVDQrcnVNRTFtaDZGblNh?=
 =?utf-8?B?QktFYy9zTTEzVXM3Nmc0UG1YczRlMkJmRllPTXprQWNOZ3BKb1RFNXhDWVRk?=
 =?utf-8?B?aWlrQWNDMzNFREdWVGl2V2NUQVdIVjVhcURWSUU2dThlZ3NUb0hlaGdJZC8y?=
 =?utf-8?B?VXVKMFVXSVVFeStwWkdiZlFhUmhUODYrZFdMUy9XcHI4NUk1aHRxTFJXVmVH?=
 =?utf-8?B?djh5cTdUSmJXRDVYekNPd0F2TDZTS3dKQTlGb05mdjBicU9GL3k5aytjTnNF?=
 =?utf-8?B?cVpvVjBqS3FuVGVQS25mVk1hMjBPeUREK3dxbm1wSWlGaGsxbERCaVFWMDBu?=
 =?utf-8?B?cGNoYWtZYk5lM1lBU3A5ODU0cC8xallNR2NPNEJianZwK0h5VzdwQ0VKL3p0?=
 =?utf-8?B?RnhyeHBVNjduUWJaTzBVZjI4NHdDaXZ6cHIyZnR2bCtWSmVFV2E0M1E1RTUy?=
 =?utf-8?B?V0RvTUsyYzR4dXlrTmNPYWJUcktaWk1KYkx5Uy9admtvNTJMUTRHY2x4SU5o?=
 =?utf-8?B?cDZ2dXdxVFI1MzZvb2RwbGdLdEVMRzZYQ0hkWWdJWmgzTE9FVC9mbjdFa1gr?=
 =?utf-8?B?azAxTUo2U2s0a0FiZldSVUh3SWdTZmdDdVJ4ck1wZmd6b2J4MG9DOExBeVN2?=
 =?utf-8?B?c0RnelJjbGFaWEVJcmhOMnJLLzRYVE85YyswU0c1K3RTUk0yR2s4d2RMN294?=
 =?utf-8?B?MURUOUNmNTVEdzl3Yk9IbnluK3A5Tmx5WHc2SlptbGZMOWtzTnFqMWs3R3Q4?=
 =?utf-8?B?Nkg3cTBIWU80VzVlY3lGOGQzc1pCL1JmcnpWOHdCOTlRK2djclp3a3VPZW1q?=
 =?utf-8?B?VUJnRGVIUWdEbWh5MTRiL1RETFFGZHhRRkVoLzZUOElEMmRQcWNBN2d0VU5Z?=
 =?utf-8?B?ejg5NVlRQlFyQWJSa2ZGdjNSZ2dqNFlMRWVhZ3QvbDlyRndSMDI1UGtPaWlm?=
 =?utf-8?B?VmJqcS91dHVqb2dWcG9uT29kNkZpcGhGRzY4SFJQNk1nbUQ2Vy9od3ByTWs1?=
 =?utf-8?B?aFA3SlEwbmNQNDhlUjJSVG44cWNMbGlvUnJ4S0pUcUE0SlZmU1J4ajdMeEJv?=
 =?utf-8?B?VEJpbzBiNlFDY1ZMVW9PLzgwcUlpbmV3WXBoRW55TDI2MWpOYUpVQyswVC9R?=
 =?utf-8?B?dzFsYVh3QWxoS3hmYkZicks1cFJjOTBpZnRPU2k4dXVyNVFuT1lPWDJJTVdp?=
 =?utf-8?B?Q3QzMkRVQ2FwUWwxTUVNZ3R3SWp2ZzZmaDV5bzZHaVdKOGVJcERwaVVHTkgz?=
 =?utf-8?B?YzR3QUI2djhRajdqb0dVQWtnSmZuOWtHdW5VTGpSaDMwMEJlZzc5eGNGRzlX?=
 =?utf-8?B?U0xMblJyeDIwVEp0aFhjYk1zN0Erb3NLNVhkek5jOG53anZWNnk5dHdtcEJG?=
 =?utf-8?Q?xC08CimtiC1AE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEczbmFiMEpQN0MvN2VpYitFNjVKY0tETTNNQWtSVHE0NmxYNUlNSEhGWTQz?=
 =?utf-8?B?b3JzQjRkTXZoeE1EWnRBcWpJOXVpODZ2UWZpa2dKRkd5T3BIdTgrQU1iUFVW?=
 =?utf-8?B?TllCUE1YcGUrNDVIVi92OEowM0pMVVpTbkJzWlIzd1FzVFY4NHRVYzAwSHF2?=
 =?utf-8?B?a3dUdi95Z0tSblUybDFTRlp5UU5FQjV5N3pvcFh0T3M4VS8ySW9IU0tFQkND?=
 =?utf-8?B?b0JkbjdCdkdHbjNpNzBKMjQ0Q3dyc25WTTBFc3hLNzh2U0lSbVB6NjFjbFZB?=
 =?utf-8?B?YVBlQUwwNUFnNXErSkE2MmQ0T3NBaHlVWWlqaEprR2FxSmxqa0ZHaFFsTFVk?=
 =?utf-8?B?OHlvWmY4ZklobWxDZWJxNm9ZMlJPclprWHFnTWdZS0FwK1VUemdLU0hYbWlL?=
 =?utf-8?B?eGxUTEVSbHNTbFIxRXY1WUtFcGx3enhkTXpkekV0VE56OEMyc1BkYVFNaE9U?=
 =?utf-8?B?b1JiZExTWk9Hc3ZRRklYQnhmTW9XUU5QUTl5WUwzSXNHUG1GQUFxaWowdVhr?=
 =?utf-8?B?M3VabmxNQVBHZGlPMUlmUjZuZUE1OE5iWmx4bmxzQ0pYeUxMQUVUOWhyT3Bu?=
 =?utf-8?B?YVMxZ0FqZGZyeVZScXBlSG56RnNIRDRKeWJ3MS92WTZ1blAyQTZYMmtCUVRq?=
 =?utf-8?B?ZTdqb3F4VWVKSmdVTjN2RGZycmZJOHlWb1hBckFEaDlxM3NGbStSR2I4Rmtr?=
 =?utf-8?B?RWIzODdiWkd6WEFWSy9NUkdGcW1ibnlkbGN1L3lWNklrL09XdTJxUTRONEV5?=
 =?utf-8?B?aFhmRU1KSHdhRU9jSW9JMFVUdjdFMjdjQ2Z0NmZqV0RLMmlXVmNFM01oZVQz?=
 =?utf-8?B?bzlOSWlJVWhrWnhsMlZuOFlyNTFrZDAxak11K0ZmM2xWUXR2ZUpaUFBmV0Ft?=
 =?utf-8?B?anpuQ1NSbVNFOTJlWWdCNUlhTTg1QSs1VGU4VDBLVU56ZUpqRVdnZ0J6Z1Y0?=
 =?utf-8?B?a2lxUWl4eVZEeWNjdXFGSVd4RmJ4Z3JmQy9Zeis0OG5yUzU2K3U3a0VKM0ky?=
 =?utf-8?B?OGRkTUZqTmdwTWt6WDZwYTN5UThCZkdBT3NOSDhKa3lBZ0lTYWpHUEVBdXRu?=
 =?utf-8?B?RUErK2huUzFaQkljdEpyZ0FmbGsyOHdxa00xTzNCWWhmVU85TDEwcGRpZ3hy?=
 =?utf-8?B?VWZ6TExpdkxXU2Q2eThWdmRkT2FCVTllUHA1S1B2cHY4SFlLNWxPV3FjNzAz?=
 =?utf-8?B?YmRYbzZKelc1dnBsOXhKQWZUUzhoeTRNT25nT2huU2czNTNEWndPbWFQdWVU?=
 =?utf-8?B?SVVZMW10aFpuMEVJaVF4UGUvaVB3c3JnVmNzbTk5TSt5clBCMjRjOVpEanRs?=
 =?utf-8?B?aFZlM0dWZSt2OFB6ZHlsZzBWN1laZ3BKd2J1MnlhUzllYm92TGdNUG1sNUdY?=
 =?utf-8?B?eVBlcXVDUXpacEZ3eDEvUFFOQU1teG9zYWMvb1p5VnpydkxXUC8wQW84UDUx?=
 =?utf-8?B?cEloYlNRNkhvT2FIb2JtQk04WWxyRXdXQmFkalh3MWVpb0Vzam1rbTJ4dkVG?=
 =?utf-8?B?ZmRvOUNMTzZDV014S013eDRzR1RvYlBwK3hQSHJiTkVrU2ViQURqc0lKN3FC?=
 =?utf-8?B?aSs0ZDFXNDAwY1MxUXNjU3NoVjFRZHdQais0QVNEaWgwdUR3L3ZWYk5Sb3ZB?=
 =?utf-8?B?RkZ4MGk1VHV5QlFKcjdyOWdyN1JPWnVzejJCUm1VcXVuWG1ySDE5N0o0clV3?=
 =?utf-8?B?a1Q0OXA2US9xMlVmeURldTRyUDM4SWxjWE9GK0xONUlQcHZhMlMxVFRtRStY?=
 =?utf-8?B?bitCNEJpQk1TM29wemFGU2trdnFhY1d5YkdNeUVIQlUvOVZwQjVSWUoveUFG?=
 =?utf-8?B?M1l6aVJIYXdnUTQ5NktNWisxSHNIN09KZDRHSHdKQWxkWmNzZWdoZjFkcGZ1?=
 =?utf-8?B?U0x0TUdTSXV5cUYrMXd4WFkrQWpkcWJYNXBYejVJMThpckpMNGVQVW5MRUJ4?=
 =?utf-8?B?MWZoUUFRUGpULzNPbFYyYVlybHB2eGtsb1ltdDJJK0VWL0tPdkF2UEgwS1R1?=
 =?utf-8?B?YS9ka3h1Nk9zRzJ2eGdKMVZXQ1QwZTVXcHE4Ri9tdVhRSlJNY003bHhaMU5q?=
 =?utf-8?B?emZoRWFsMGVqUnRUT2ZoUmdUczYrcW4wZE1LOXNjOW5FSHhQM2U0RmlGUmhM?=
 =?utf-8?B?S3ZheGV6cCswSVUyOVJuMzJHQk45cDJ0REk4Q0wvVUQvQ2lNZVR4UGF6anhl?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 679a2ad1-c15a-4c0b-fb61-08dd737b31be
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 13:18:31.0707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AasITAOWrCQXJ3rSTS3kt9DSOstGjpfWzDv4ny0ZZe+csWYpGCT9Y1pGnSPGdAkLjVMtltNuo/mLWcKIQ+Jbj2X7BtemsL31iFIUJlv+k/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
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

Hi,

On Fri, Apr 04, 2025 at 02:31:36PM +0200, Zbigniew Kempczyński wrote:
> Current loop used for long running job in wmtp case has a drawback
> in which we tweak number of loops.
> 
> Lets add loop which allows to be stopped from cpu write to first
> input data dword. This requires to use volatile for input buffer
> and uc.uc send to avoid checking cache instead of direct memory
> read.

Ack on the approach, similar to xe_spin end.

> 
> Before submitting short (compute square) job I've added 1 second
> delay to allow other processes to just start many long running
> jobs (loops) to make gpu really busy. Previously submission
> long / short would complete before another process started same
> long / short pair so concurency was more random.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  lib/intel_compute.c | 39 ++++++++++++++++++++++++++++++++-------
>  lib/intel_compute.h |  2 ++
>  opencl/loop.cl      |  9 +++++++++
>  3 files changed, 43 insertions(+), 7 deletions(-)
>  create mode 100644 opencl/loop.cl
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 28149db53e..50e134c8a5 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -46,7 +46,7 @@
>  #define OFFSET_STATE_SIP			0xFFFF0000
>  
>  #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> -
> +#define MAGIC_LOOP_STOP			0x12341234
>  /*
>   * TGP  - ThreadGroup Preemption
>   * WMTP - Walker Mid Thread Preemption
> @@ -1874,6 +1874,8 @@ bool xe_run_intel_compute_kernel_on_engine(int fd,
>   * @short_kernel_size: size of @short_kernel
>   * @sip_kernel: WMTP sip kernel which does save restore during preemption
>   * @sip_kernel_size: size of @sip_kernel
> + * @loop_kernel: loop kernel binary stoppable by cpu write
> + * @loop_kernel_size: size of @loop_kernel
>   */
>  static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel,
>  					unsigned int long_kernel_size,
> @@ -1881,6 +1883,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  					unsigned int short_kernel_size,
>  					const unsigned char *sip_kernel,
>  					unsigned int sip_kernel_size,
> +					const unsigned char *loop_kernel,
> +					unsigned int loop_kernel_size,
>  					struct drm_xe_engine_class_instance *eci,
>  					bool threadgroup_preemption)
>  {
> @@ -1975,7 +1979,10 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	bo_sync_short->sync = 0;
>  	sync_short.addr = ADDR_SYNC2;
>  
> -	bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
> +	if (loop_kernel)
> +		bo_dict_long[0].size = ALIGN(loop_kernel_size, 0x1000);
> +	else
> +		bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
>  	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
>  
>  	bo_dict_long[10].size = ALIGN(sip_kernel_size, 0x1000);
> @@ -1984,7 +1991,10 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	bo_execenv_bind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
>  	bo_execenv_bind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
>  
> -	memcpy(bo_dict_long[0].data, long_kernel, long_kernel_size);
> +	if (loop_kernel)
> +		memcpy(bo_dict_long[0].data, loop_kernel, loop_kernel_size);
> +	else
> +		memcpy(bo_dict_long[0].data, long_kernel, long_kernel_size);
>  	memcpy(bo_dict_short[0].data, short_kernel, short_kernel_size);
>  
>  	memcpy(bo_dict_long[10].data, sip_kernel, sip_kernel_size);
> @@ -2024,13 +2034,22 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, false);
>  
>  	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &sync_long, 1);
> +
> +	/* Wait until multiple LR jobs will start to occupy gpu */
> +	if (loop_kernel)
> +		sleep(1);
> +
>  	xe_exec_sync(fd, execenv_short.exec_queue, ADDR_BATCH, &sync_short, 1);
>  
>  	xe_wait_ufence(fd, &bo_sync_short->sync, USER_FENCE_VALUE, execenv_short.exec_queue,
>  		       INT64_MAX);
> +
>  	/* Check that the long kernel has not completed yet */
>  	igt_assert_neq(0, __xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE,
>  					   execenv_long.exec_queue, &timeout_short));
> +	if (loop_kernel)
> +		((int *)bo_dict_long[4].data)[0] = MAGIC_LOOP_STOP;
> +
>  	xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE, execenv_long.exec_queue,
>  		       INT64_MAX);
>  
> @@ -2040,7 +2059,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	munmap(bo_sync_short, bo_size_short);
>  	gem_close(fd, bo_short);
>  
> -	for (int i = 0; i < SIZE_DATA; i++) {
> +	for (int i = loop_kernel ? 1 : 0; i < SIZE_DATA; i++) {
>  		float input = input_data[i];
>  		float output = output_data[i];
>  		float expected_output = input * input;
> @@ -2067,9 +2086,11 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  			 */
>  			igt_assert(f1 > long_kernel_loop_count);
>  		} else {
> -			if (f1 != long_kernel_loop_count)
> -				igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
> -			igt_assert(f1 == long_kernel_loop_count);
> +			if (!loop_kernel) {
> +				if (f1 != long_kernel_loop_count)
> +					igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
> +				igt_assert(f1 == long_kernel_loop_count);
> +			}
>  		}
>  	}
>  
> @@ -2088,6 +2109,8 @@ static const struct {
>  			     unsigned int short_kernel_size,
>  			     const unsigned char *sip_kernel,
>  			     unsigned int sip_kernel_size,
> +			     const unsigned char *loop_kernel,
> +			     unsigned int loop_kernel_size,
>  			     struct drm_xe_engine_class_instance *eci,
>  			     bool threadgroup_preemption);
>  	uint32_t compat;
> @@ -2149,6 +2172,8 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>  							  kernels->kernel, kernels->size,
>  							  kernels->sip_kernel,
>  							  kernels->sip_kernel_size,
> +							  kernels->loop_kernel,
> +							  kernels->loop_kernel_size,
>  							  eci,
>  							  threadgroup_preemption);
>  
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index dc0fe2ec20..8310536a96 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -31,6 +31,8 @@ struct intel_compute_kernels {
>  	const unsigned char *sip_kernel;
>  	unsigned int long_kernel_size;
>  	const unsigned char *long_kernel;
> +	unsigned int loop_kernel_size;
> +	const unsigned char *loop_kernel;
>  };
>  
>  /**
> diff --git a/opencl/loop.cl b/opencl/loop.cl
> new file mode 100644
> index 0000000000..7fd2c13368
> --- /dev/null
> +++ b/opencl/loop.cl
> @@ -0,0 +1,9 @@
> +__kernel void loop(volatile __global int *input,
> +		   __global int *output,
> +		   unsigned int count)
> +{
> +	while (1) {
> +		if (input[0] == 0x12341234)

Not sure if shared header makes sense but at least a comment with a
reference to MAGIC_LOOP_STOP would be helpful for understanding.

    /* See MAGIC_LOOP_STOP in lib/intel_compute.c */

Francois

> +			break;
> +	}
> +}
> -- 
> 2.34.1
> 
