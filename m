Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C82C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 09:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF45310E995;
	Thu,  3 Apr 2025 09:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVrwCESj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EDB10E994
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 09:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743674248; x=1775210248;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iz69fHVIYTvnpynVBvTxbxjT4gRDZrFgerWL/lNOeTQ=;
 b=FVrwCESj1/Nzu6lxRyAjaGooeyaanxrKNhJJjaziNu4qHiQMjAO0dIxQ
 ss+1jNb+2IjfVRW2xje4xIvSLIJ2tt0otT/DMDrfqh0vNtox9XbUl2qv/
 58A9Pti130t9rv81PPGcC1Smzu+V4NKXiJHDLu0/92QFVGV70qhfCzMdt
 frYpcq5WiygnMVxAm/AXBWUp7/RgM2dS2SgVm2zL5buqw2RuyTzVisNuf
 IIUrsgLbldZy6SBBCxHB8u9m8EmHlcs1Lkhv4qPeXJLdGNmXnT+OS909H
 CPsZByM952oyNhbwY9p5WJI4SwHd073RE+kQywBW1Q8UCjO60S3f5qmyh A==;
X-CSE-ConnectionGUID: wz1v6mywQhiDZt6PXnD2OA==
X-CSE-MsgGUID: w5ey1U5CSVarQNeHNztP5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45247032"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="45247032"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:57:27 -0700
X-CSE-ConnectionGUID: JsADKx2xSCWXn26wOlZALg==
X-CSE-MsgGUID: 1V2njKXGQ5ao/43vGjxDBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127481257"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:57:18 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 3 Apr 2025 02:57:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 02:57:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 02:57:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeluEZD1aOiYzSMY/NE6SVdFcv+6jPkcgO4oGJFC3k1ZrcaxDu2HasSDPPBlT7ZVRbPMCiPF2EhkAmZjIk/yQuFrPQiFJ6arCfP631mmNPHocCldHuNpzu6MszoNfaKuUgAHInMTvP9cXWUBBYG847vxmltQCZDb3nyGHZVcLfgInXfW0kNgU/HHnijgTYg2lbJ9ubL9G1SnCCvvRlqqQ85/MLwrVv8NvXpe1b6gh4E9NIKQre0buJOaXtvSrZyD3c1G8n5MSS5lFNdNmEPiWnx6PbEl88AQIYz4P80igkxfQIqQJTC6X+mKdlule7orzliy/h6IDeU+2VXWgnbJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVmvM/ho5YjyzdST6U+77IuojevUodIhArrsT+yLePo=;
 b=iH9ssHj/UQvzj/cwQ3Mlrpr6vjMux0aoOji6DGX7XBxv9MnvHEQeuhDwpvLWuMyqYwHuflcW1ep009vsqO4zJHK2BztEn9KPoEgsrJwGQLBfuS866qH4CKDuzm/YXN/0pFNiHvGTftCaiOgUAjKeF27Qoy+VruQCfGHsnecu7R0lnxFfoy4F+VYEd/hIQg091GeSXS16taRFyxjK1//LpOgYuXQB9n/maCQdM0ljZ5aolJVUMU+THmxVFcUSrNdIPixFoYSIX7xbhepEicbyedotd5rRpRJ0v6Of2XOvG2lXU+2ud5B6QixclFDZnuxV6/2jMyB3/MXXCGpY6pSBhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 09:57:14 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 09:57:14 +0000
Message-ID: <ede4e2f9-1ecb-4b5d-b302-9036ebfcd08d@intel.com>
Date: Thu, 3 Apr 2025 15:27:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 12/37] tests/kms_colorop: Add kms_colorop tests
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
 <20250326233609.2980110-13-alex.hung@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250326233609.2980110-13-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a14faa7-1460-4b5c-5726-08dd7295e8c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVlBSCtZaVdoVFdlekE5ODAxYzdhMVhER1ZUMGpuMVVWYTFkU2FRMDlzQWhy?=
 =?utf-8?B?MnJHc1ZDZlFsL2krZTJxRGxXR1Zmd2RNcXlHWGxqaTA1MnJWOUlkaEVpeU1F?=
 =?utf-8?B?dGk0QzJiQjFZbFVEWWY2R1ovYStxamZ6MjUwaFY2VzVnR3lLSTlnVUlkcXFp?=
 =?utf-8?B?T2FrRUxsT3Juem01a3Y4c3lKaitid1p2RC9aeUM1L2dwRUZlQUs3VjJFeEFi?=
 =?utf-8?B?L2JWaXJvbkNiYjMyN1JTalM2RmJGTmFPT3U2YW9DZjVKOFZjbmJReGYzcG11?=
 =?utf-8?B?NkVvalNKTHhiRDlVQmlSZ3BYMFA4aS8vODNOTGRZQnh2ZU5nY3VCYzBPNFJC?=
 =?utf-8?B?ZHc4cTNzdWlyUW9sblRqMjFvWmVQN2RYdnhUK2J2NEF3YVM4dUdidk5RenI3?=
 =?utf-8?B?OThQQ2cvSlFKVFVxRW0zN2E3RnVJNkcwWlBmcUR3S0IyM3hIODhDQmJZWVlL?=
 =?utf-8?B?b2paR0pJMVM0R1pwNzRHTFFub2FLZnVNaGxkSkhDZXcrUGxRN1Q4ODlsRzV3?=
 =?utf-8?B?cDFqWDJKMkdxN0JGNnBLTHFiYU9IN01BYUxwTHpyM1M0b0VscGpISXR5eHdE?=
 =?utf-8?B?aGVybUlrMFZMaTB4WncrUTN4aXRjNFhJSDNNUVdiRFg0MVQvR1dvTXBGVTRQ?=
 =?utf-8?B?cVdxRGErQUx1akhmUCtZL01SeW90ckhQck1iakx6WEcvZ1NhaWYxTkNrcHRO?=
 =?utf-8?B?UXRiODdnSzkzKzV6QU94aHN1QUlsTDVVc0pIQUM3dGx1eGs4UGRWSTNLMEor?=
 =?utf-8?B?Ni9XQ3dqYlNWUHllQkdPWWQ5WUJobkJiekFjTFNVa2oxUU03SG1kZFdMQytN?=
 =?utf-8?B?ZXVHRlYyaEFHZWUvY3UrdUx6QzgyODZPK2o5Z2c0Y2JSelFwVnZZd1BFVlZM?=
 =?utf-8?B?WWZGeVhOWXBEK0xqTHhBdHNieHo0TDhEMTY2bTVXUnNRQmowUjNucW4vYVpK?=
 =?utf-8?B?RVVXSW9OMWVrR0VpQ0FLcTArcExhS3pYLzJJSUhkUmtGblBRWUVGbHRTNkRw?=
 =?utf-8?B?RS9hdXVEbUVDMFA4YTVVSGxyS0hyaDRKYS9ObkNraHg5ZHBiS3FVUnhod3Zv?=
 =?utf-8?B?aE9rNVRINDI0Z0x2S2tpQ2liVitDVEpIdE1IWXV3SlFEaVlQeDJ4ZDA4ZWVs?=
 =?utf-8?B?WFZ6b2RKWW5na0wrc3I3V2YxQ25tTldKbHIrVXBIN3VhVGJsUkw2bUZXTlNq?=
 =?utf-8?B?eGtvS1RlTGtrVGlQeGRGVFZwWmNiT1E5RVYrNTc2VmMvTlEzVHF0T2lXYktS?=
 =?utf-8?B?RVgrNXBXSWd0S0ovQzhrd1VzdlVSeDRleWE0MWYwRE8wV2dIUUdUQjJwTk1q?=
 =?utf-8?B?NjBsWTVOeEJ3L291SGNxeXEzbDBHMEtXWUQyallXNUVkcng0Zm81UHh2T1RZ?=
 =?utf-8?B?TDZDU0I0a0ErTHVhMnBNSE5SOEszQjNTU2ZnS1ExWHRnMEJZc2c5amRWVWwy?=
 =?utf-8?B?dks5K1JQWmttR09WYStTKzJpUU5mSE90R0U4TTg1NUNaUVUvbnFUaHdTUUc1?=
 =?utf-8?B?cVBLSXRDQTBFLzIweU13VFluSjhLcy9rRUsvcjkzaEJEeU5OdXFQL3JZWVRC?=
 =?utf-8?B?MU9Oa3NXRE9MandPUjJ2dGRia1k3UkF6cjJqcFZFRmRQaC9jMXY4WEJnME4v?=
 =?utf-8?B?UkxmWGFESjczd04vWHkrbHd6TDhOMzZZTDFOaXJuV3JOa015VHNWMjZ4VGpr?=
 =?utf-8?B?YmFoUzNjckVDc3FaaWxjZnpHMXM1NmdNWE55cEQ5RThWMHdpbkQ2d2xqQ1ZT?=
 =?utf-8?B?Wi9uM1Y4ajhwQUhIQ1BPbkk4ZmdvenRMblE2Q3F2Vzk1MU4rZDJrTmkyYTUx?=
 =?utf-8?B?U1RvRFovQ29ycDhRa0s3TGN4NXFNWm9DVWFPOHYvdWd3T0t4VUdPckhQaGtt?=
 =?utf-8?Q?zqIFwJcIIUId2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UitjaDdsS2Z0cHdFLzJRNUZXYS9VOXJ6UE0wTEtuREdid0FHZWh2S2JhVXVT?=
 =?utf-8?B?MGRHRW5RVjNCSEZxUTQ1VHZ2Tzc0VUhldHdhQ1Jsby9pUE5jOUlKNXc3QkU0?=
 =?utf-8?B?aGZUSTQ1OWVwMjk4bzZIaWRlWlJFd0pqWTlPQTh0blRQTGZoYjEycExiazYr?=
 =?utf-8?B?dVJtM3hpdTZNTFdTMTlCMUp6YVRYRkV2bVZJemJJZnQ5RDd1czAxT2pCd0I2?=
 =?utf-8?B?ZzBTNXdlRTk0Y1doZXBjMWN3ZHFnTmJnT3FYSUdNSUdvRjVvV3c2MFFMUm0y?=
 =?utf-8?B?RUEyanJibVFwMGowbDVZeksrOUFiMThnVW9aLytCejNUS1hUZnZvZ2FDQ1J2?=
 =?utf-8?B?MVdYTDFicExyWHZjb09pa0NUelhXWVk4TVdpY2ptU3M3aTdWZVVrd1JEM1Fo?=
 =?utf-8?B?RHR5aEVKcFlmZm1DcjlmSjRyNm9kMlpPdUp1WWNZK2t2WktsU1VOZERraGV0?=
 =?utf-8?B?eUppK0dQTnhIWG1XNkhoMjFNdmhHMk45VWF2MlBJK0pjUFdFMThFczJqcEcr?=
 =?utf-8?B?MEVRYldNRE5zc1JSVlpGK1gwSnhZbW8wWkpzNlVmUnViYUlSNlJUL2trK3Fk?=
 =?utf-8?B?OTdsMTZPQm9McVZ1UzYxUkVsVVd6bTNsNGd6a1hZY1JlM2NLMGFlZTJsVCtq?=
 =?utf-8?B?bjFxOHUvNVdXWkVkMGpFS0tHb2gxV1JraTdWR2c3Ym9wSXBzZE1xa2dld2hP?=
 =?utf-8?B?b2dadkkyWkJWT0MvRDVzSzlybWFlbFhNR2ZwV3Q5MmR2WlJDU1YxMEhONlBX?=
 =?utf-8?B?YndhVUJ2b3FERlJkQWc2VkhRS0RpYStGSGNSd1BMTnBRMjViQzNlK2Q4Q2F3?=
 =?utf-8?B?MHp0Y2h4SFlZR0wyRlFMNmhsRG9EZHdKZnlNNGpwY0JXMG41YkNJbzhCYXNW?=
 =?utf-8?B?Y1JMSU5qNnd1VWdFclNwU251d2hXYzZLM1RQZmhnb1ArUlMrYnZHRHdYWGZq?=
 =?utf-8?B?UldQQTdMdjJCd3VsenVweTB2S0d5dnpscTQwL1VFbzRKZWdPVmIvRWxOM1Yy?=
 =?utf-8?B?VGJKK2NYVXpTaTZIZEtIUk1FWFk3N29WcTdsaEZOVVptd2dQN1VTYmZKaUQ0?=
 =?utf-8?B?ek91eDRkdmcvWHhJUGl0Ly9LY0JGWVlKQUl2Sm1oUnNCTHg2WThxZUZ2Z2xn?=
 =?utf-8?B?VjJtWFIrYzZ6RitVWDVjbWM4dno5ODZHbzIzbTVlVURuSGYwZEJuNFh3NUR6?=
 =?utf-8?B?WDZ5VXAzOVdNRk9VY3NiTm53aVRxMVU1UFRGcTNqcnFSTlowYTl5b0xSK0lR?=
 =?utf-8?B?SzBDMVlPcVhBWWRuWWF3Y0plcWZxMlJWZzJDL0kxNndDV2hsWTdVL3Nxb2JT?=
 =?utf-8?B?bE5UZEg2YnE0VUc4S1JTWjBSODBka3RvTW8zNTUrZkVCREpFcGI2RU1yR24v?=
 =?utf-8?B?Z04zanphU2phWGxSdytFaURsUm1qZFlsaXpBSk9vZFZaSHN1YTVtUXlWNHlu?=
 =?utf-8?B?RVpYNWdNOWRCdmJWUGM3T2pwd1NCbWtQbjN2dHlrTHA2Yk8vMlpXSmFmcms2?=
 =?utf-8?B?YVQ3SDFWYmQ0ODFpaFVMd1dHKzJ5MzFVb2xxbk12dTE5bkpnd0pnTEJCZG41?=
 =?utf-8?B?SEFSV2tBTTZ1bGVsU1J6NnVsLzM0VVBSdlBmOXdjY25iSm9pbVhIdkgwT1Ev?=
 =?utf-8?B?Vm5mSWVLOVBYeUppR2VVS0ZjVzMxZVZaSU5RdmdGNGpkNmUyZVdjTnRhOS9y?=
 =?utf-8?B?SXdRa2lhdmQvOXJPanlpWXdGTVAySmRRc1JRQkRJRWFEK1JNNTBVdTNWc2JZ?=
 =?utf-8?B?UkUyNGFDUTZBV05menVUY0RjdGJFZVZseEltMXV4MWpTWjlMWGxWa0NRc0dI?=
 =?utf-8?B?VEhGSFZoN0RBck1QOWNrUVJyRXdTTUFRU1R5elFaRGt1MlJacnBjRWtvZXQ0?=
 =?utf-8?B?eVVMV1VxdWJpb0YxQndNNk4xaTc1TnE1MEJLR05tMHFQRDJFQWxrT08xRmU4?=
 =?utf-8?B?YUhocXVsWGNIOGM2YzRZSGdhWkdSNDZMaWhEcU9tZW9nS0VMTitNYjZEZEVh?=
 =?utf-8?B?R2wrV21KV1N2ME1ielNXUDdESlhsYTRWZFpGR1RNb2tmL1hNUVpDNTUzOTdq?=
 =?utf-8?B?R1lJR2pmZkhyWmtGdXQ4L1BhOEIvTHBPMmIxdC8vcFp3dFJxMmRGbUQyUDhh?=
 =?utf-8?B?QnVoaEFTTnJYdndWdk1KLzcxODlxZlRPRW9YZEljQkQzODF5UFNHWHFCNyts?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a14faa7-1460-4b5c-5726-08dd7295e8c4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 09:57:14.0528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uokHJXjDyMHN8OsqY8b4BApmXj0K5E9uf06UEBJqJhjg4Xd7RwoG5VeYDmvjKq5wkjMtx/vJCbhIAwQqv6l4pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
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

Hi Alex,

While applying this patch

Applying: tests/kms_colorop: Add kms_colorop tests
.git/rebase-apply/patch:544: new blank line at EOF.
+
warning: 1 line adds whitespace errors.

Please fix

On 27-03-2025 05:05 am, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
>
> This tests the color pipeline API, exposed via the
> COLOR PIPELINE plane property and drm_colorop objects.
>
> We introduce tests for:
>   - sRGB EOTF
>   - sRGB Inverse EOTF
>   - sRGB EOTF + sRGB Inverse EOTF
>
> The last one is the holy grail of LUT testing. It tests that
> after applying an EOTF, followed by its inverse EOTF we arrive
> back at the original value. We can use this to test for
> precision loss in the pipeline.
>
> All tests are tested via writeback. All transforms are done in
> SW (in floating point) and at the end the SW transformed buffer
> is compared with the KMS writeback output buffer. The two should
> match within a bracket of acceptable deviations. Since these
> deviations might look different for different KMS drivers we'll
> do this check on a driver-specific basis.
>
> v3:
>   - skip tests if color pipeline not found
>   - Rename colorop to color_pipeline in places where it refers
>     to the entire pipeline (Sebastian)
>
> v2:
>   - Make tests dynamic, allowing definition of tests with an
>     arbitrary number of transforms
>   - Add test for sRGB Inverse EOTF
>   - Add test for sRGB EOTF, followed by sRGB Inverse EOTF
>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   tests/kms_colorop.c | 530 ++++++++++++++++++++++++++++++++++++++++++++
>   tests/kms_colorop.h |  87 ++++++++
>   tests/meson.build   |   1 +
>   3 files changed, 618 insertions(+)
>   create mode 100644 tests/kms_colorop.c
>   create mode 100644 tests/kms_colorop.h
>
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> new file mode 100644
> index 000000000..b9009a498
> --- /dev/null
> +++ b/tests/kms_colorop.c
> @@ -0,0 +1,530 @@
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "igt.h"
> +#include "igt_color.h"
> +#include "sw_sync.h"
> +
> +#include "kms_colorop.h"
> +
> +/**
> + * TEST: kms colorop
> + * Category: Display
> + * Description: Test to validate the retrieving and setting of DRM colorops
> + *
> + * SUBTEST: plane-%s
> + * Description: Tests DRM colorop properties on a plane
> + * Driver requirement: amdgpu
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @srgb_eotf:                   sRGB EOTF
> + * @srgb_inv_eotf:               sRGB Inverse EOTF
> + * @srgb_eotf-srgb_inv_eotf:     sRGB EOTF -> sRGB Inverse EOTF
> + *
> + */
> +
> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
> +static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
> +				    drmModeModeInfo override_mode)
> +{
> +	igt_fb_t input_fb, output_fb;
> +	igt_plane_t *plane;
> +	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
> +	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
> +	int width, height, ret;
> +
> +	igt_output_override_mode(output, &override_mode);
> +
> +	width = override_mode.hdisplay;
> +	height = override_mode.vdisplay;
> +
> +	ret = igt_create_fb(display->drm_fd, width, height,
> +			    DRM_FORMAT_XRGB8888, modifier, &input_fb);
> +	igt_assert(ret >= 0);
> +
> +	ret = igt_create_fb(display->drm_fd, width, height,
> +			    writeback_format, modifier, &output_fb);
> +	igt_assert(ret >= 0);
> +
> +	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(plane, &input_fb);
> +	igt_output_set_writeback_fb(output, &output_fb);
> +
> +	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_plane_set_fb(plane, NULL);
> +	igt_remove_fb(display->drm_fd, &input_fb);
> +	igt_remove_fb(display->drm_fd, &output_fb);
> +
> +	return !ret;
> +}
> +
> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
> +typedef struct {
> +	bool builtin_mode;
> +	bool custom_mode;
> +	bool list_modes;
> +	bool dump_check;
> +	int mode_index;
> +	drmModeModeInfo user_mode;
> +} data_t;
> +
> +static data_t data;
> +
> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
> +static igt_output_t *kms_writeback_get_output(igt_display_t *display)
> +{
> +	int i;
> +	enum pipe pipe;
> +
> +	drmModeModeInfo override_mode = {
> +		.clock = 25175,
> +		.hdisplay = 640,
> +		.hsync_start = 656,
> +		.hsync_end = 752,
> +		.htotal = 800,
> +		.hskew = 0,
> +		.vdisplay = 480,
> +		.vsync_start = 490,
> +		.vsync_end = 492,
> +		.vtotal = 525,
> +		.vscan = 0,
> +		.vrefresh = 60,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +		.name = {"640x480-60"},
> +	};
> +
> +	for (i = 0; i < display->n_outputs; i++) {
> +		igt_output_t *output = &display->outputs[i];
> +
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
> +			continue;
> +
> +		for_each_pipe(display, pipe) {
> +			igt_output_set_pipe(output, pipe);
> +
> +			if (data.custom_mode)
> +				override_mode = data.user_mode;
> +			if (data.builtin_mode)
> +				override_mode = output->config.connector->modes[data.mode_index];
> +
> +			if (check_writeback_config(display, output, override_mode)) {
> +				igt_debug("Using connector %u:%s on pipe %d\n",
> +					  output->config.connector->connector_id,
> +					  output->name, pipe);
> +				return output;
> +			}
> +		}
> +
> +		igt_debug("We found %u:%s, but this test will not be able to use it.\n",
> +			  output->config.connector->connector_id, output->name);
> +
> +		/* Restore any connectors we don't use, so we don't trip on them later */
> +		kmstest_force_connector(display->drm_fd, output->config.connector, FORCE_CONNECTOR_UNSPECIFIED);
> +	}
> +
> +	return NULL;
> +}
> +
> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
> +static uint64_t get_writeback_fb_id(igt_output_t *output)
> +{
> +	return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
> +}
> +
> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
> +static void detach_crtc(igt_display_t *display, igt_output_t *output)
> +{
> +	if (get_writeback_fb_id(output) == 0)
> +		return;
> +
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +}
> +
> +static void get_and_wait_out_fence(igt_output_t *output)
> +{
> +	int ret;
> +
> +	igt_assert(output->writeback_out_fence_fd >= 0);
> +
> +	ret = sync_fence_wait(output->writeback_out_fence_fd, 1000);
> +	igt_assert_f(ret == 0, "sync_fence_wait failed: %s\n", strerror(-ret));
> +	close(output->writeback_out_fence_fd);
> +	output->writeback_out_fence_fd = -1;
> +}
> +
> +static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
> +{
> +	switch (desired->type) {
> +	case KMS_COLOROP_ENUMERATED_LUT1D:
> +		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE) {
> +			return true;
> +		}
> +	case KMS_COLOROP_CUSTOM_LUT1D:
> +	case KMS_COLOROP_CTM:
> +	case KMS_COLOROP_LUT3D:
> +	default:
> +		return false;
> +	}
> +}
> +
> +/**
> + * Iterate color pipeline that begins with colorop and try to map
> + * colorops[] to it.
> + */
> +static bool map_to_pipeline(igt_display_t *display,
> +			    igt_colorop_t *colorop,
> +			    kms_colorop_t *colorops[])
> +{
> +	igt_colorop_t *next = colorop;
> +	kms_colorop_t *current_op;
> +	int i = 0;
> +	int prop_val = 0;
> +
> +	current_op = colorops[i++];
> +	igt_require(current_op);
> +
> +	while (next) {
> +		if (can_use_colorop(display, next, current_op)) {
> +			current_op->colorop = next;
> +			current_op = colorops[i++];
> +			if (!current_op)
> +				break;
> +		}
> +		prop_val = igt_colorop_get_prop(display, next,
> +						IGT_COLOROP_NEXT);
> +		next = igt_find_colorop(display, prop_val);
> +	}
> +
> +	if (current_op) {
> +		/* we failed to map the pipeline */
> +
> +		/* clean up colorops[i].colorop mappings */
> +		for(i = 0, current_op = colorops[0]; current_op; current_op = colorops[i++])
> +			current_op->colorop = NULL;
> +
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static igt_colorop_t *get_color_pipeline(igt_display_t *display,
> +					 igt_plane_t *plane,
> +					 kms_colorop_t *colorops[])
> +{
> +	igt_colorop_t *colorop = NULL;
> +	int i;
> +
> +	/* go through all color pipelines */
> +	for (i = 0; i < plane->num_color_pipelines; ++i) {
> +		if (map_to_pipeline(display, plane->color_pipelines[i], colorops)) {
> +			colorop = plane->color_pipelines[i];
> +			break;
> +		}
> +	}
> +
> +	return colorop;
> +}
> +
> +static void set_colorop(igt_display_t *display,
> +			kms_colorop_t *colorop)
> +{
> +	igt_assert(colorop->colorop);
> +	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
> +
> +	/* TODO set to desired value from kms_colorop_t */
> +	switch (colorop->type) {
> +	case KMS_COLOROP_ENUMERATED_LUT1D:
> +		switch (colorop->enumerated_lut1d_info.tf) {
> +		case KMS_COLOROP_LUT1D_SRGB_EOTF:
> +			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB EOTF");
> +			break;
> +		case KMS_COLOROP_LUT1D_SRGB_INV_EOTF:
> +			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB Inverse EOTF");
> +			break;
> +		case KMS_COLOROP_LUT1D_PQ_EOTF:
> +		case KMS_COLOROP_LUT1D_PQ_INV_EOTF:
> +		default:
> +			igt_fail(IGT_EXIT_FAILURE);
> +		}
> +		break;
> +	case KMS_COLOROP_CUSTOM_LUT1D:
> +	case KMS_COLOROP_CTM:
> +	case KMS_COLOROP_LUT3D:
> +	default:
> +		igt_fail(IGT_EXIT_FAILURE);
> +	}
> +}
> +
> +static void set_color_pipeline(igt_display_t *display,
> +			       igt_plane_t *plane,
> +			       kms_colorop_t *colorops[],
> +			       igt_colorop_t *color_pipeline)
> +{
> +	igt_colorop_t *next;
> +	int prop_val = 0;
> +	int i;
> +
> +	igt_plane_set_color_pipeline(plane, color_pipeline);
> +
> +	for(i = 0; colorops[i]; i++)
> +		set_colorop(display, colorops[i]);
> +
> +	/* set unused ops in pipeline to bypass */
> +	next = color_pipeline;
> +	i = 0;
> +	while (next) {
> +		if (!colorops[i] || colorops[i]->colorop != next)
> +			igt_colorop_set_prop_value(next, IGT_COLOROP_BYPASS, 1);
> +		else
> +			i++;
> +
> +		prop_val = igt_colorop_get_prop(display, next,
> +						IGT_COLOROP_NEXT);
> +		next = igt_find_colorop(display, prop_val);
> +	}
> +}
> +
> +static void set_color_pipeline_bypass(igt_plane_t *plane)
> +{
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
> +}
> +
> +static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
> +{
> +	if (is_vkms_device(in->fd))
> +		return igt_cmp_fb_pixels(in, out, 1, 1);
> +	else
> +		/*
> +		 * By default we'll look for a [0, 0] bracket. We can then
> +		 * define it for each driver that implements support for this
> +		 * test. That way we can understand the precision of each
> +		 * driver better.
> +		 */
> +		return igt_cmp_fb_pixels(in, out, 0, 0);
> +}
> +
> +#define DUMP_FBS 1
> +
> +#define MAX_COLOROPS 3
> +#define NUM_COLOROP_TESTS 3
> +#define MAX_NAME_SIZE 256
> +
> +static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
> +{
> +	int i;
> +	igt_pixel_transform transforms[MAX_COLOROPS];
> +
> +	/*
> +	 * TODO
> +	 *
> +	 * This is wrong and loses precision since it always goes back
> +	 * to an 8-bpc framebuffer.
> +	 *
> +	 * Instead we need to stay as UNORM or float 16-bpc value throughout
> +	 * all transforms.
> +	 */
> +
> +	for (i = 0; colorops[i]; i++)
> +		transforms[i] = colorops[i]->transform;
> +
> +	igt_color_transform_pixels(sw_transform_fb, transforms, i);
> +}
> +
> +static void colorop_plane_test(igt_display_t *display,
> +			       kms_colorop_t *colorops[])
> +{
> +	igt_colorop_t *color_pipeline = NULL;
> +	igt_output_t *output;
> +	igt_plane_t *plane;
> +	igt_fb_t input_fb;
> +	igt_fb_t sw_transform_fb;
> +	igt_fb_t output_fb;
> +	drmModeModeInfo mode;
> +	unsigned int fb_id;
> +	igt_crc_t input_crc, output_crc;
> +
> +	output = kms_writeback_get_output(display);
> +	igt_require(output);
> +
> +	if (output->use_override_mode)
> +		memcpy(&mode, &output->override_mode, sizeof(mode));
> +	else
> +		memcpy(&mode, &output->config.default_mode, sizeof(mode));
> +
> +	/* create input fb */
> +	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(plane);
> +
> +	fb_id = igt_create_color_pattern_fb(display->drm_fd,
> +					mode.hdisplay, mode.vdisplay,
> +					DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					0.2, 0.2, 0.2, &input_fb);
> +	igt_assert(fb_id >= 0);
> +	igt_plane_set_fb(plane, &input_fb);
> +#if DUMP_FBS
> +	igt_dump_fb(display, &input_fb, ".", "input");
> +#endif
> +
> +	/* create output fb */
> +	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
> +				DRM_FORMAT_XRGB8888,
> +				igt_fb_mod_to_tiling(0),
> +				&output_fb);
> +	igt_require(fb_id > 0);
> +
> +	igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
> +
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
> +
> +	/* reset color pipeline*/
> +
> +	/* TODO do we need this? might be good sanity anyways */
> +	set_color_pipeline_bypass(plane);
> +
> +	/* Commit */
> +	igt_plane_set_fb(plane, &input_fb);
> +	igt_output_set_writeback_fb(output, &output_fb);
> +
> +	igt_display_commit_atomic(output->display,
> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL);
> +	get_and_wait_out_fence(output);
> +
> +	/* Compare input and output buffers. They should be equal here. */
> +	igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
> +
> +	igt_assert_crc_equal(&input_crc, &output_crc);
> +
> +	/* create sw transformed buffer */
> +
> +	igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
> +	igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
> +
> +	apply_transforms(colorops, &sw_transform_fb);
> +#if DUMP_FBS
> +	igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
> +#endif
> +	/* discover and set COLOR PIPELINE */
> +
> +	/* get COLOR_PIPELINE enum */
> +	color_pipeline = get_color_pipeline(display, plane, colorops);
> +
> +	/* skip test if we can't find applicable pipeline */
> +	igt_skip_on(!color_pipeline);
> +
> +	set_color_pipeline(display, plane, colorops, color_pipeline);
> +
> +	igt_output_set_writeback_fb(output, &output_fb);
> +
> +	/* commit COLOR_PIPELINE */
> +	igt_display_commit_atomic(display,
> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL);
> +	get_and_wait_out_fence(output);
> +#if DUMP_FBS
> +	igt_dump_fb(display, &output_fb, ".", "output");
> +#endif
> +
> +	/* compare sw transformed and KMS transformed FBs */
> +	igt_assert(compare_with_bracket(&sw_transform_fb, &output_fb));
> +
> +	/* reset color pipeline*/
> +	set_color_pipeline_bypass(plane);
> +
> +	/* Commit */
> +	igt_plane_set_fb(plane, &input_fb);
> +	igt_output_set_writeback_fb(output, &output_fb);
> +
> +	igt_display_commit_atomic(output->display,
> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL);
> +	get_and_wait_out_fence(output);
> +
> +	/* cleanup */
> +	detach_crtc(display, output);
> +	igt_remove_fb(display->drm_fd, &input_fb);
> +	igt_remove_fb(display->drm_fd, &output_fb);
> +}
> +
> +igt_main
> +{
> +
> +	struct {
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +		const char *name;
> +	} tests[] = {
> +		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
> +		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
> +		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" }
> +	};
> +
> +	igt_display_t display;
> +	int i, ret;
> +
> +	igt_fixture {
> +		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
> +			display.is_atomic = 1;
> +
> +		ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> +
> +		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
> +
> +		igt_display_require(&display, display.drm_fd);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&display, display.drm_fd);
> +
> +		igt_require(display.is_atomic);
> +
> +	}
> +
> +	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
> +		igt_describe("Bla bla bla");
> +		igt_subtest_f("plane-%s", tests[i].name)
> +			colorop_plane_test(&display, tests[i].colorops);
> +	}
> +
> +	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
> +#if 0
> +	igt_subtest("plane-srgb") {
> +		colorop_plane_test(&display, colorops_srgb);
> +	}
> +	igt_subtest("plane-inv_srgb") {
> +		colorop_plane_test(&display, colorops_srgb_inv);
> +	}
> +#endif
> +	igt_fixture {
> +
> +		igt_display_fini(&display);
> +	}
> +}
> +
> diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
> new file mode 100644
> index 000000000..8102d25b1
> --- /dev/null
> +++ b/tests/kms_colorop.h
> @@ -0,0 +1,87 @@
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#ifndef __KMS_COLOROP_H__
> +#define __KMS_COLOROP_H__
> +
> +#include "igt_color.h"
> +
> +typedef bool (*compare_fb_t)(igt_fb_t *in, igt_fb_t *out);
> +
> +typedef int (*transform_fb)(igt_fb_t *in);
> +
> +typedef int (*transform_pixel)(igt_pixel_t *pixel);
> +
> +/* Test version definitions */
> +typedef enum kms_colorop_type {
> +	KMS_COLOROP_ENUMERATED_LUT1D,
> +	KMS_COLOROP_CUSTOM_LUT1D,
> +	KMS_COLOROP_CTM,
> +	KMS_COLOROP_LUT3D
> +} kms_colorop_type_t;
> +
> +typedef enum kms_colorop_lut1d_tf {
> +	KMS_COLOROP_LUT1D_SRGB_EOTF,
> +	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
> +	KMS_COLOROP_LUT1D_PQ_EOTF,
> +	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
> +} kms_colorop_lut1d_tf_t;
> +
> +typedef struct kms_colorop_enumerated_lut1d_info {
> +	kms_colorop_lut1d_tf_t tf;
> +} kms_colorop_enumerated_lut1d_info_t;
> +
> +typedef struct kms_colorop {
> +	kms_colorop_type_t type;
> +
> +	union {
> +		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
> +	};
> +
> +	const char *name;
> +
> +	igt_pixel_transform transform;
> +
> +	/* Mapped colorop */
> +	igt_colorop_t *colorop;
> +
> +} kms_colorop_t;
> +
> +kms_colorop_t kms_colorop_srgb_eotf = {
> +	.type = KMS_COLOROP_ENUMERATED_LUT1D,
> +	.enumerated_lut1d_info = {
> +		.tf = KMS_COLOROP_LUT1D_SRGB_EOTF
> +	},
> +	.name = "srgb_eotf",
> +	.transform = &igt_color_srgb_eotf
> +};
> +
> +kms_colorop_t kms_colorop_srgb_inv_eotf = {
> +	.type = KMS_COLOROP_ENUMERATED_LUT1D,
> +	.enumerated_lut1d_info = {
> +		.tf = KMS_COLOROP_LUT1D_SRGB_INV_EOTF
> +	},
> +	.name = "srgb_inv_eotf",
> +	.transform = &igt_color_srgb_inv_eotf
> +};
> +
> +#endif /* __KMS_COLOROP_H__ */
> diff --git a/tests/meson.build b/tests/meson.build
> index fda8584e9..dcdccef18 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -23,6 +23,7 @@ test_progs = [
>   	'kms_bw',
>   	'kms_color',
>   	'kms_concurrent',
> +	'kms_colorop',
>   	'kms_content_protection',
>   	'kms_cursor_crc',
>   	'kms_cursor_edge_walk',

