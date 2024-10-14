Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68D2CFC52F
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 09:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9921C10E404;
	Mon, 14 Oct 2024 09:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tb8G3aKT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0024010E40A;
 Mon, 14 Oct 2024 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728898933; x=1760434933;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jR1yCcfemRBZp6wf+0unMK0IesDyRzfyYVu8PLQLrzg=;
 b=Tb8G3aKTh8dQGoGi7Ub1d7InDRRVtmPbhLsy3wXdveXmEg9dbIyiqF7e
 ECVsqVfZAuNUKjtz1y432QrvU+yzq5UcXJC7ZSgALVn8dZXMM1wtlmkwt
 5EvkoEicobFybMct5oFk0VTuH/4tjPwtuYdiYTJbYfC8QbifVZzl5HhxF
 qY5jKvHOMeO41YTv7oKmtTYHS14V3eEywrqpXaEL4+GN292yGbf99gMLU
 RgbreskXO+027xN26HlRdVLFQyf4fJUl2i9lvYDCxUzfmJwhXMpBziXs6
 AieU7VZ9HC7/6q+yX7JyLqLn+j9sn7nnREDRm6puEIA8IZwtev6ZpmyI9 Q==;
X-CSE-ConnectionGUID: O+GQnGZDReSvBM6m34Vl7g==
X-CSE-MsgGUID: pm0d2ACNQeC6vcqlpQ6UdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="15870165"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="15870165"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 02:42:12 -0700
X-CSE-ConnectionGUID: BeSPCtFsQUi1r+rCNNE88g==
X-CSE-MsgGUID: eKrSoItDTrCMz7Vf6RRQjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="108318598"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 02:42:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 02:42:11 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 02:42:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 02:42:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 02:42:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhK818+fa3NTPZqd5cen3//ejWUtNCg3KZdB+LgyAU3nSbgu95FGqW5+nXFZ93CzFYYz2kOhXjJfBHthr3lwMx0H25Gqrdzo65qpHG9P0tOhD+V6cmDodaNjIjTj7udDBFFJCHWms7tCg6ENM2pj71f7EUsvG2dwwuKsgUZuqVlH1/8x5sSrag0Gjtco34dbq9WxUrLeLSDa1W6zTWO+5OGiCuXaon/QOTKrTpMkFDUUS++L1r48jOP2JfUVOEa5zlh7z3IzxPbgqZZ0qbS8tH70K7coXInFkAhSNSKsxAaPlhmvO4M8fG6gFBsxw7fSaYdvXq8f7hGhD2WRC6/PtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4VkxzmFbiFn/m57M/N67f0oOa4WcH3zkC7g0KuMRvE=;
 b=CIDaEHa3I6fTPqy5U+FCk2FjrV16IR9WqEaFiISRuGCFX9xWgOKU/jiFXLLooP2cevawTSXtVEhwB6bzFXnY26FRy2cXWpuwNzKWJFSyd9oT7p8paNc2+lQBUzJyNLDXYkxkyOoBxGJHmSS60jAx5iRH7zJ+57VoLehxs7umJG180sVaVuJAkb+zQnC769qHFiqvEN+OS+4QGErUJtdWJeAWgZJ02sFJi5gsKRo+H2lS2iX+Y8qtdGR3nL6axdzKdgxxn7+jkCFzBwg1PpSe94pixDxcweN3l1YbouHyAWtjKa75HuJqaOaDjx86vguWij9dEthOIBBdlqMFgup11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Mon, 14 Oct
 2024 09:42:06 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%2]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 09:42:06 +0000
Message-ID: <ae3170f0-c5de-4315-87e8-078de5f61e23@intel.com>
Date: Mon, 14 Oct 2024 11:42:03 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/xe=5Fexe?=
 =?UTF-8?Q?c=5Fsip=3A_skip_invalid_instruction_in_SIP_routine?=
To: <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20241010-skip_invalid_instruction-v2-1-5766d861e2c5@intel.com>
 <172866715254.1241456.3519201675708494444@2413ebb6fbb6>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172866715254.1241456.3519201675708494444@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0039.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::25) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|SA1PR11MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 86b2c08e-70af-457a-3e14-08dcec347756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cThSSGpkOHNXY09tS1BKMlBOQmczSFpuYXJrWVBYeGJCVE5hWTZ1blk2WXFj?=
 =?utf-8?B?U1BVamU2VGRnVCtUallBUGJCZE9neDR0RWlhT2kwdUxSakNQdXRkb0N0dnZX?=
 =?utf-8?B?S0YwOXNyQ0JUWDUzT0hvazFHRDd4Z2pBcWFFZmJXQkk4NlpXdVlLdUNPUnBj?=
 =?utf-8?B?bWh3d0o4Tk9LYVFHT281blNHLzRWS1Z5MjNoZmswVjJnS2xXMnB1dGkvMUNu?=
 =?utf-8?B?Y3FOK2R4a2kxQ0gzdVpBVG9ER00vUG5QZTRKTlF4VWYvS3dkenFNeUNZdnRS?=
 =?utf-8?B?TmhOOHRVc1hMWGg1cTdDdFB4M2lrVllOcGV3S3U4aHhvcE16V2E4SXA3b0NM?=
 =?utf-8?B?Z3hxZHhpVFYyckt2cFR1eHk5RkoxaGFEcG9yOFhJdUdlSENGeC9USFBkQjQr?=
 =?utf-8?B?aVczcVo0UmhCVTV3cGR6WHlPcXRJYkkrSllyY2xIMVM0QlhEUkx3c1ZhKzUr?=
 =?utf-8?B?YnFGTnUxcnhZaXc2aUdvZFJqbFExb3c2dEpqMWhBK1hudTQ2SVJrNFdqckNT?=
 =?utf-8?B?a0pIcEdDL3dVMFc3WFY0SnVod2x2a21yQkVNUVJ5Skw2VExaYTgyWk1EamZa?=
 =?utf-8?B?RHpuNDdhWW1yMzVtekxUaUFjaXZKTmxjMTNuaDVRVjIxLzVDc0RYZWFMUnhz?=
 =?utf-8?B?RE1aRVVsQ3VrTTdPWTlYc2c5UW9QdXl3MnhHU0hUSmhORXRaWGF4SDRuMjRw?=
 =?utf-8?B?OFN6YWVOcFVheUF3UzNsd3FyZFRUQmdwTERYckZsdHl5YndzTk1kcWdsRjlv?=
 =?utf-8?B?V1lCL284LzNTWlhmeitFY2sxVFRBVjNkQjRyWVQzK3VJeFlKWENZY1V5NGhj?=
 =?utf-8?B?dVcwNjhCa0U3Y0d6ME9TSVdtRWhwOGVuQXhuUDNMRGZTaWlNQlVxMTNGOE5u?=
 =?utf-8?B?OHlDMEdXODIvbVNsY1MrNlRlYUt6cXFtOHo0eVVhOUk5NUZYMm45Tzd6dzVG?=
 =?utf-8?B?NmFyTTJaUXdCYzUxWVQvZjljQi9OQUQ0eVM3RCtsNDNxM0JDQkN1QnUvTDdB?=
 =?utf-8?B?Y0tDL0VDTjcvZzg5Rlc3Mld1WjdKT2RCVEtEYUk1TGVUSUttQ1NFWXhCMVlH?=
 =?utf-8?B?QVJxdEtpb1RUTlBnT0RMbG8rK1hjdUYyUkFRVDBzVjNjcnpoelh1d2p4cnFt?=
 =?utf-8?B?RndNZDlIY05iWlpMaUVmM1M0eUJJZER0SElTTjE4cGthWTVPWTZuUnpvS3dB?=
 =?utf-8?B?NU00RGhGNUw2Rnh4MFlCY2VrN3FxK0VPM1o1bkp3WnNPejFUYTBnSmQ2NmN5?=
 =?utf-8?B?T1loZjVIRlVXbWM5bzhsbEp2TjYzcXFpT3IvWXRrTGpXaVBaU2JSdXVoNmxa?=
 =?utf-8?B?dDVuWkRuNUZLVVl2TWFaY0NRWXVscFpjQVdiblJzakhRSE9YV1ZNNU9MTFFI?=
 =?utf-8?B?NlhvWmhodUd3NVBJK0g2STlmSW5vRjd3U0YzU3lYY2NGNjE5TkZScXZxVDgz?=
 =?utf-8?B?Q1pFcVpZc2VDVGhyU01aU0pFZTh5eGxsWTZOdUlHdHFEeHY5cEJJVkFWQXE2?=
 =?utf-8?B?UUVEY0lrODBXSjRBT3dDTkxuZlluRjVWekVpVnZNWEJCSzV3QlY2SmxKSnRu?=
 =?utf-8?B?Rmh0Z25xNHdCQU5CdlV4bmhnOHc5V3JlMER6UVZ1VE8zbFVvYnBkdGIyTnRy?=
 =?utf-8?Q?LgYYE57y8t+oweFEhfdfI6PEAtQ/3zORxEs/Xkn2+m0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFFwMlF2dVpuTTI0UTVDZDlBdlZ4d3hGcE9ONkhnYzFDRk1zZm5GTzN2azBs?=
 =?utf-8?B?b2VNa3Y1NzU2aElaanZmUW5Uc0RNUDU1Q1ZHQ3haa2JJclNsaUJVSFVMOVhZ?=
 =?utf-8?B?WkVTVjdCdTdlcklCdnBQZnZvNmROZnU2MjQ3UXFGMlVxRERBVnFETU5WcDBz?=
 =?utf-8?B?ODdYZDhUUkpjTm1iUWRVY0QwblVsblliMXZoYStaaGtJSXVjWXg2Yy9pNlp0?=
 =?utf-8?B?NFRVWnRNQlJsRmVRTFpuRnA2anBoa2VlNHRqeUlFNVhuOUtTMjVNZmN4YmpS?=
 =?utf-8?B?bDhkNTVhSnZGSmNhOTZKS24vSVhHK2p3cng4L004dFFZRmoycVdXT3FGUG85?=
 =?utf-8?B?N2hCV20rMFk2YlhydjhCT2FqbGlObnFCd0g0c2wwL01HRldqU1dqSGxZUXBL?=
 =?utf-8?B?cHFkNE1uRVJ3MkJGbDMydDFTcTBvYytpQXpTaDBzVE1UTkk0Mk8vSG90ZHpp?=
 =?utf-8?B?UFlBdy8reWRRaEtMQ0NvLy9seHdQSWVPdHpySGVwZlJNbm9Mb2pvLytZa2NT?=
 =?utf-8?B?R0V1L1dHNWljcm0zZXlSTW8zdklzbWNRZUFhcGNURnBLcE1lbUVYQUIxY003?=
 =?utf-8?B?dEw4ZFZKTHZoV29pSVMzWmlFMFJUNTR1cVdYY2dSVWNtVEg4d1VxdFpXWVZq?=
 =?utf-8?B?L3RuQko2T2lqQy90ZDlpUXBTZlVjb0o3RlBKRVczNUlXOW9vZ0Rkd3JjUGRK?=
 =?utf-8?B?U1M4Rkx4MzZOc0xRWFJ3VFA3TnJBcUFwSHRkRkRYNVU3dUtvT0VCWXZ4d1FY?=
 =?utf-8?B?QWZWenM2WU5UNHhjLzYwbnJGTmlzWGVpenphY0FveVMvT2N5V0VWQnhoeXhl?=
 =?utf-8?B?Q3ZmMU1BaUpBaUpjamEvMDI4Q3c0dmxVcWlhUmxtRWt3YmgxUnh3VkgvU2lu?=
 =?utf-8?B?MlRuNGJSR1FJcElDYmJ4cXlENWZ5OWJELzhHVFRIRU96ejhZbVU3bHlJVXZF?=
 =?utf-8?B?Vy9iVTBJTHJnL1ZPaHhUYXFVQ2xnbUpMUzFnd0VkaTB2VDFsbnFVUWMreTlr?=
 =?utf-8?B?cTdTaEtuMjhzR2lxdHBLNHNzZWNranlMckdOZlZrelc1bHpVN214OXRZQXdG?=
 =?utf-8?B?cTc0bjFkeTAzZ3B5T0ZjWTYvVW1LM1pUM0EzVWI3WGF4ZzhzRnlNb3c2ZVpr?=
 =?utf-8?B?NGNPUW02eDlROEl3dGhPMW9WdURIRElteVVnQWFPVVVlYUFRN3NuemNQV29H?=
 =?utf-8?B?UXFXZDVhVlZTRWZKRHk2amlPbm14TVZ3WUVBU3Q3OVF5QmFjNW9QWnB6dFVK?=
 =?utf-8?B?MUdxQ0xFUi9sREdyYk5wTEo3eWRhWWRYYTZHcWMvaEJnSWVZeitIZy9qN0lt?=
 =?utf-8?B?dmxGeFdmYklxNTJZaGZmeU1iV0lMNDBPZnBoNE1qang4ZzkxS0VFcG9RcVl6?=
 =?utf-8?B?QTFiZFBYMnpOUjRxcHorR0Ntc1lua2dmL1UxVFBSL1lVWVAvSUhFeGFvTVRw?=
 =?utf-8?B?VmhuS3NGdVdDaGlwZ2I2Ukxwbld6L09hS253ZDRiRDFaenBqVFZSZjlxS3RN?=
 =?utf-8?B?WlBzbjRaM1YyZmN2amxTeUx4aTZvQlAvUEw3NVM1TTRZZm96V241RjMyUUZy?=
 =?utf-8?B?MTFYM0ZpRThTNmp5WlVWMzJlNVg0TnQrTlE2TzZVWml5THdkK3p1U1JTUEdu?=
 =?utf-8?B?L1QrejBpdFpQTTVFVDQ5em1tRXZISmJIZXBHS0ZwK2xHanZGYVU2c1lUNFl2?=
 =?utf-8?B?QkxpczFWSWtrMXhWSTZFSktGTjZqa3hkMFNMeTNCWUVmVlF2RjduU0ppRXVy?=
 =?utf-8?B?ZnZLQUNsN2FNalREN1pCSlpQaFBiQWhPejlsY2NKZFZNWW9udU5uSTRjTmdr?=
 =?utf-8?B?Z01NVGhsR0tCV1dzQUJlRExNZ3V1cTVERWp0cy9jUkJPbVJWRFRDVkJxMEJp?=
 =?utf-8?B?NEYwbmtGSjZqUE5CcnRkYTRYV0thU1RZRGw2MWNEaFc0ZU90Y2t5OFI2cCtR?=
 =?utf-8?B?NEhlR2gzaHZHVWRjMWliNFEzQm51dnRoZWdaaVlMQlZCYW5TYzVVQVJaZVA2?=
 =?utf-8?B?QTEzMloxSmcvVEhqU0dsb2RnUERxeHVYNStYS1hmQVRoUmxNekptT3RRdFdD?=
 =?utf-8?B?UnFwK2JNOUdOd2hPdmFzaG1zVEZLL2pKZlAxYldvbnVjd1FLNHoyT1E1aWxI?=
 =?utf-8?B?dzlJdEF5Q1REb1czc3M5ckRtN1AwYTNnZHg3WGlsWHpPWE9BUnN1TmI5QjRz?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b2c08e-70af-457a-3e14-08dcec347756
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 09:42:06.8111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIpiVM8HQiE+m2mc5DxDTGl40zXvnqCA3vHyffJj0+xco8LpOwS7CKtaXCJZos4b8EOg/oRqQcLAYZi8Ib6xpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
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


W dniu 11.10.2024 o 19:19, Patchwork pisze:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe_exec_sip: skip invalid instruction in SIP routine
> *URL:* 	https://patchwork.freedesktop.org/series/139851/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/index.html
>
>
>   CI Bug Log - changes from XEIGT_8065_full -> XEIGTPW_11899_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_11899_full absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11899_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_11899_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html>
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-linear:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-linear.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-linear.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-rte:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-rte.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-rte.html>
>         +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html>
>  *
>
>     igt@kms_psr@fbc-psr-cursor-blt@edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-2/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-4/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html>
>         +1 other test fail
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html>
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html>
>         +2 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>  *
>
>     igt@kms_psr@fbc-psr2-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html>
>  *
>
>     igt@kms_vrr@lobf@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-4/igt@kms_vrr@lobf@pipe-a-edp-1.html>
>         (Intel XE#2443
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-7/igt@kms_vrr@lobf@pipe-a-edp-1.html>
>         +1 other test incomplete
>

Again all failures are not related to the patch.


Regards

Andrzej


>  *
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html>
>  *
>
>     igt@kms_chamelium_hpd@common-hpd-after-hibernate:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html>
>         +1 other test skip
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-5/igt@kms_content_protection@atomic.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-2/igt@kms_content_protection@atomic.html>
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-max-size:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html>
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-dp2:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html>
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#2501
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-8/igt@kms_plane_scaling@intel-max-src-size.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html>
>         +16 other tests skip
>  *
>
>     igt@kms_vrr@lobf:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-5/igt@kms_vrr@lobf.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-2/igt@kms_vrr@lobf.html>
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_11899_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_getclient:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@core_getclient.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@core_getclient.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html>
>         (Intel XE#1701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) +1
>         other test fail
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>         (Intel XE#1659
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>)
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-463/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +34
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_chamelium_audio@dp-audio-edid:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-5/igt@kms_chamelium_audio@dp-audio-edid.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-25:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-433/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-aspect-ratio:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_chamelium_frames@hdmi-aspect-ratio.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +6
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_content_protection@legacy.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-5/igt@kms_content_protection@uevent.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x21:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +8
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +3
>         other tests skip
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#1137
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +6
>         other tests fail
>  *
>
>     igt@kms_flip@flip-vs-modeset-vs-hang:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-435/igt@kms_flip@flip-vs-modeset-vs-hang.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_flip@flip-vs-modeset-vs-hang.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +13 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) +1
>         other test incomplete
>  *
>
>     igt@kms_flip@flip-vs-suspend@c-dp4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-dp4.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-dp4.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>) +1
>         other test incomplete
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +8
>         other tests fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +1
>         other test skip
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-4/igt@kms_flip_tiling@flip-change-tiling.html>
>         (Intel XE#2055
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +17
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#1469
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
>  *
>
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#1158
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +14
>         other tests skip
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-a-plane-4:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1
>         other test dmesg-fail
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-b-plane-4:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +3
>         other tests dmesg-warn
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +5
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#2566
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20@pipe-c:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20@pipe-c.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20@pipe-c.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +3
>         other tests incomplete
>  *
>
>     igt@kms_pm_backlight@bad-brightness:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_dc@dc5-dpms-negative:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.html>
>         (Intel XE#1131
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131>)
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>  *
>
>     igt@kms_pm_rpm@legacy-planes-dpms:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-433/igt@kms_pm_rpm@legacy-planes-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_pm_rpm@legacy-planes-dpms.html>
>         (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>)
>  *
>
>     igt@kms_pm_rpm@legacy-planes-dpms@plane-59:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-7/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) +1
>         other test timeout
>  *
>
>     igt@kms_pm_rpm@legacy-planes@plane-68:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-2/igt@kms_pm_rpm@legacy-planes@plane-68.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-8/igt@kms_pm_rpm@legacy-planes@plane-68.html>
>         (Intel XE#2932
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_pm_rpm@system-suspend-modeset:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html>
>         (Intel XE#2625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>)
>  *
>
>     igt@kms_pm_rpm@universal-planes:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-2/igt@kms_pm_rpm@universal-planes.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620> /
>         Intel XE#2864
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864>)
>  *
>
>     igt@kms_pm_rpm@universal-planes@plane-32:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-3/igt@kms_pm_rpm@universal-planes@plane-32.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-2/igt@kms_pm_rpm@universal-planes@plane-32.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +5
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +12
>         other tests skip
>  *
>
>     igt@kms_psr@pr-suspend:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-8/igt@kms_psr@pr-suspend.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>  *
>
>     igt@kms_psr@psr2-sprite-plane-onoff:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-4/igt@kms_psr@psr2-sprite-plane-onoff.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html>
>         (Intel XE#1649
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649>) +3
>         other tests fail
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#2939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-270:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-270.html>
>         (Intel XE#1437
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437>)
>  *
>
>     igt@kms_vrr@max-min:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-7/igt@kms_vrr@max-min.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-3/igt@kms_vrr@max-min.html>
>         (Intel XE#2443
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) +1
>         other test fail
>  *
>
>     igt@kms_writeback@writeback-check-output:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-7/igt@kms_writeback@writeback-check-output.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_eudebug_online@interrupt-all:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-2/igt@xe_eudebug_online@interrupt-all.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>  *
>
>     igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +7
>         other tests skip
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-433/igt@xe_exec_balancer@many-virtual-userptr-invalidate-race.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@xe_exec_balancer@many-virtual-userptr-invalidate-race.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +25 other tests skip
>  *
>
>     igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-7/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html>
>         (Intel XE#2687
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687>)
>  *
>
>     igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +16
>         other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html>
>         (Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_exec_reset@parallel-gt-reset:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html>
>         (Intel XE#2105
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>)
>  *
>
>     igt@xe_huc_copy@huc_copy:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>  *
>
>     igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html>
>         (Intel XE#1999
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999>) +2
>         other tests fail
>  *
>
>     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +4
>         other tests skip
>  *
>
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +1
>         other test fail
>  *
>
>     igt@xe_pm@d3cold-mmap-system:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-2/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@d3cold-multiple-execs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-435/igt@xe_pm@d3cold-multiple-execs.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@s2idle-vm-bind-unbind-all:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-unbind-all.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html>
>         (Intel XE#1694
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694> /
>         Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s3-basic-exec:
>
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@xe_pm@s3-basic-exec.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@crc:
>
>       o {shard-bmg}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-5/igt@kms_async_flips@crc.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-7/igt@kms_async_flips@crc.html>
>         +1 other test pass
>  *
>
>     igt@kms_async_flips@crc@pipe-c-dp-2:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-5/igt@kms_async_flips@crc@pipe-c-dp-2.html>
>         (Intel XE#1656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-7/igt@kms_async_flips@crc@pipe-c-dp-2.html>
>         +2 other tests pass
>  *
>
>     igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-5/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html>
>         (Intel XE#1288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-7/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html>
>         +3 other tests pass
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         +1 other test pass
>  *
>
>     igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-464/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html>
>         +2 other tests pass
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html>
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-180:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html>
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-256x256:
>
>       o {shard-bmg}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x256.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x256.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         (Intel XE#1475
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>  *
>
>     igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html>
>         +9 other tests pass
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>         (Intel XE#2625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html>
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         +7 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@a-dp2:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-dp4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html>
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html>
>  *
>
>     igt@kms_plane@plane-position-hole@pipe-b-plane-1:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html>
>         +5 other tests pass
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html>
>         +9 other tests pass
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-464/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>  *
>
>     igt@kms_pm_rpm@universal-planes-dpms:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms.html>
>         (Intel XE#2042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html>
>  *
>
>     igt@kms_pm_rpm@universal-planes-dpms@plane-41:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html>
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         (Intel XE#2159
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-2/igt@kms_vrr@flipline.html>
>         (Intel XE#2443
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-6/igt@kms_vrr@flipline.html>
>         +1 other test pass
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#402
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>       o {shard-bmg}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>  *
>
>     igt@xe_evict@evict-large-external:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@xe_evict@evict-large-external.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-433/igt@xe_evict@evict-large-external.html>
>         +17 other tests pass
>  *
>
>     igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html>
>         (Intel XE#2754
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-6/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html>
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>
>       o {shard-bmg}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html>
>         (Intel XE#2998
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html>
>         +1 other test pass
>  *
>
>     igt@xe_pm@s2idle-vm-bind-prefetch:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html>
>         (Intel XE#1694
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-prefetch.html>
>  *
>
>     igt@xe_pm@s4-vm-bind-userptr:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html>
>  *
>
>     igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-bmg-8/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-bmg-8/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html>
>         +21 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_chamelium_color@degamma:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-463/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_chamelium_hpd@common-hpd-after-hibernate:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-434/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_content_protection@atomic.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_content_protection@atomic.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-max-size:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-max-size.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-max-size.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-32x32:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_cursor_crc@cursor-random-32x32.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_cursor_crc@cursor-random-32x32.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_plane@plane-position-hole:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-lnl-3/igt@kms_plane@plane-position-hole.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-lnl-1/igt@kms_plane@plane-position-hole.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html>
>         (Intel XE#361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-psr-sprite-plane-move:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-move.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +1
>         other test skip
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-434/igt@kms_vrr@lobf.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@kms_vrr@lobf.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>  *
>
>     igt@xe_eudebug@basic-vm-access-parameters:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug@basic-vm-bind-discovery:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-discovery.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-discovery.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html>
>         (Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_oa@non-privileged-access-vaddr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_oa@non-privileged-map-oa-buffer:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@xe_oa@non-privileged-map-oa-buffer.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-436/igt@xe_oa@non-privileged-map-oa-buffer.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
>  *
>
>     igt@xe_query@multigpu-query-hwconfig:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8065/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11899/shard-dg2-433/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8065 -> IGTPW_11899
>   * Linux: xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16 ->
>     xe-2049-20c57deec46e59d392ec6d4a23257f4bb5673982
>
> IGTPW_11899: 40a954b482b65bf640304a16f734c3e703acbb1c @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8065: c727cc3fad56f16f1a9f35023ae5dd7111976fa3 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16: 
> 09a8c322287e106dca33e28fa7f1475255a9ef16
> xe-2049-20c57deec46e59d392ec6d4a23257f4bb5673982: 
> 20c57deec46e59d392ec6d4a23257f4bb5673982
>
