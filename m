Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBDEC02182
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 12:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8654510E1E3;
	Wed, 22 Jan 2025 12:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdbHjof4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A59910E1E3
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 12:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737549666; x=1769085666;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=EFu78uDcND1CF/2RBI59WSnVXbLZNQZOLfk7jX8y8Uw=;
 b=DdbHjof4xs1bwi1cITI67HGiYu5LKyCtRPsV57E0Iwh/ljFsa6xqgQ/8
 Vj+8obQV4hfiWFUPVCtUbN06PSEK7QLH0GXIdtjaXfmc3WJSDA3xQrZOD
 eMq5BVABegf/Y5yUTL/i4rTTvAMHE6otLa4JZ/BvzksXOqRy5blo9tA3R
 Iot/I0rr4qzLbbsSoD4ro/egabwmexefdDYHPQMYPFg5iWEKIbalyRPsY
 FH1fhBRqieAoueZb1mk5tFpRdHBQx8EUFshRu8t/CQaSObQ8P9azT++Nt
 8GAwqVQjUe/xkKsoYrCyijqwimt5rPnE8x85iSq0aE9fikrtKlUQzsjpA A==;
X-CSE-ConnectionGUID: LJnAR9hnTwKx2uidfxXTmg==
X-CSE-MsgGUID: UQDq8D5KS26mgpSLwr5t2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38153390"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="38153390"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:41:05 -0800
X-CSE-ConnectionGUID: rUn1sPE3S4qh85m/RNC3lw==
X-CSE-MsgGUID: cp9XyTneSI2KEBnC6jQ18A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="107047810"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 04:41:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 04:41:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 04:41:04 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 04:41:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ik/1TdJzgEphrxteRLrXOl9Ird3Xk7aezJS0d53yiKtNz2UCaYOdK0nPkYyH/IJuX121S9K0fiole3n15pVp1iPQHTtgiO2omwa6XOBrXuUxNTmqd657OcX2iSqrqryi3ws9NjwVj+l9aoaI5GAc/nQTD3rbg3s3W5G5SNTSQ0biZ00COFl2hd8shqICieVEbLoiPqbfpg/ZB2+DICnWQ+pngnEjSUc9B3i+U9kNcNTcg01qcpaeqXaTMCuPnQCdNuNmujz9iB4L4aiQlGEcIkK3rcUqseHuKaQgkHMRL69k8ywrTMp7RQCYGLFibyYYmIyOj3RalJeoc7qWv8/S0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BTKDlzTtLkTm9MNkhzE1MrxboJefwtgt/Te9Swg1ew=;
 b=VigOmrHjn7HRE5Ud6fqhgS2xIphlFUiLrFvbHsmsbKRV9Opc48+eIkRSWz0R9EGGn4nR2wtyPoLQL1rdNalU3VYTMgZOoo6Xl/HZcK7dOTwYPVH2kp/eCxVXyyj09cS7m58xMgHfK0A4p53gF94rvYlUsrJxtDsAd457kn21gRRsuld8G+1g4k2W2GgF8FIOgmQYpUFfJW5UJjdiNHAlVBbY+CZ/8Rp3FLCcdmTigXraABzHwyqb4TYxbdxlRSLxkPbpWMU3uJPcdklnxJeXZiGnUyrmkTPwj+UahwtQ1traD5XwB85vMKz6uKK0ZgnOLYromvC9TCVX5oahJdJeGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 12:40:20 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 12:40:20 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250121225733.808978-7-lucas.demarchi@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-7-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 6/7] runner/settings: Serialize command line
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 22 Jan 2025 09:40:15 -0300
Message-ID: <173754961509.5500.8834900644999128777@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:303:16d::7) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bbf5082-b1df-4dc6-105a-08dd3ae1eea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHNaaWpQcTIrZ0xMclpkUTZKRnlvRTlXOENueFlkZVloZ2pBTlU1ZkQxZVQ2?=
 =?utf-8?B?U1ZTbFdSTGN2YTl2YktLZlhkNVRQMWdLRzBCdzlScmpuczUyUUV5U1VHcEky?=
 =?utf-8?B?NnlyNmUzM3VjbUpyVnBOazNiZW5RelVVekI2M0dwUUFiM0trUm1kK2hsRFdZ?=
 =?utf-8?B?Ukk1U0Z0Wm9uR2NyOHBTY0JMbHRka0xsOTdrdXkxaldxOURvNmFSclNOZm9L?=
 =?utf-8?B?SmVGM3BkWm9rQXVYeHVvV3ExNDM3ZnBFRFZxZlU0bDdyNXFKWndvbXd4S0xw?=
 =?utf-8?B?K2svd1IwTVFlV0Y5aVdCUjdDWEpzaVNWTVdEZHZDSHpwZ2pzVWpSS3NoYmhL?=
 =?utf-8?B?a0JnN1ZEazlyS21OOHUwTzNSMUhhSkFzWXZTcUJ2UW1mdEtaa1ViNjFEYWRF?=
 =?utf-8?B?RGNlS2J0M3E3ckF2T1pWTE42TFJVcTdFYXRiN2s0cytNK0pEWFprck5oQlM2?=
 =?utf-8?B?TzRoVmxjZk16SHcyMWZ6UWEwWkJhdGJLYVdWSnQ5YTd1NktSNGgwRlI3cjYv?=
 =?utf-8?B?SnhQSTg5L2hXNDJDVE9OdHRpS2h1SUU3Y1NjajBJY0FJMnlETGltSEFlR0E0?=
 =?utf-8?B?ck9rcnZxVDNSZjF6T0VJK1hrajl2TkIwTXFJN1dJZER1NVI3UXJHeTR5Wmli?=
 =?utf-8?B?VlhHRG9yU011Y21WRFhJemFLY2lZQWdkL1NpYkV1alFLbXZnL3VITzl4RHNZ?=
 =?utf-8?B?cXVoM2N0UDZDMmE4MmRxVmN1WTA1bmp5ZWF5TkExZ0VVcEpDRmtWb3I2M2NS?=
 =?utf-8?B?ay9EYUsyTVh0SFRkdnEwWFhLbE4zb0ZBejZVekYrdDNtd1FNd29wTVA2UWVM?=
 =?utf-8?B?Yk43bWlnMmc4bi9LSTJ6WHNXOGVRQTdvbkNTRUZWNk5YUFpwcGNHSWlaTjNa?=
 =?utf-8?B?QTlra1R2VE9tZkJEclVxQkVoUWpsMUI2aHlDM1hzamFrS2ZFbFlhakFXc3k1?=
 =?utf-8?B?VlVLWTR2cUFWYmtxOGFKbnhmbmkyUE80QnJoNGJCNDVPQ1NXa3Y2aWZ0Wk45?=
 =?utf-8?B?aFZsTklJeHNNRE4rbTN3UFE4Ti80SkozLy9SYUppWXIwd1FYc0JMMzRzL3Iz?=
 =?utf-8?B?a2d3aytBNXFUa3A4SDB2SlFyN0FPaTF1bkZ3Z04ySGxUbVBrWVhYcDUxQ00r?=
 =?utf-8?B?VGpzamw1TjFRcWR4dXF1a1YvU0ljL3JSWWZETkxHSElCaU1WSVBmQndtSFJG?=
 =?utf-8?B?S2MyYVFObzQ5MVd2eUdLM3pEOVh3dml3cWlGeDhlMDBxS2FGcW1lQXk4blAw?=
 =?utf-8?B?OC9LZ1JMUnJrQkk2N0ZJczdRd0ZVTU9vb1pzN3czU09DK0c2NStTNjNkcjRI?=
 =?utf-8?B?dTJPQTVCcHFMcHJ4ZUZKdGdQZnFGZVUvTUx2bFF0b1hFMFlzZ3R6RVkzaGxY?=
 =?utf-8?B?VEU1UEI3dktVUmxVejMzL1BvNHZrd0VrbTdZcE5uWU9kUXU0blpaeXo5SEpk?=
 =?utf-8?B?UFkxdjVSUWlzQ0c4STMxTUVadktmdUZjQlA3WFRheTYvcGNjRjhhVVB3WWgv?=
 =?utf-8?B?RmZXam56b29QS1MyNWRqWGJqV3dFeExvOFpqU3lzTk9TaHFjWWY5M3JqdDlh?=
 =?utf-8?B?YlNxZzR0N1FDUDNnaXFVNzEybVduTTdTZXRaMHZNK3VwUVVaNk8zM3pCR1p5?=
 =?utf-8?B?dXdQdWpGTkEvTFA5d2JyMVFBVUlLbms3NFl1TmlTM2IwUW9HTUFKTDRZcFFY?=
 =?utf-8?B?WDArRG1wWktneHF0eEdKbGpnOU9LN1p1bExkT3QzdzBwSmRYTXNjcGpyWVNN?=
 =?utf-8?B?MFoyZUVxdHJKWXZQa2VjV1BTaVppK3RKM2Q0b0RyQ1JObEdLWkhGWDgvMmpE?=
 =?utf-8?B?RWR3QzRmZVptRXdUY1hkYjhQOXU0ZGlnRHBqbjIzTnY4bC9MVGZHQ3VNQ1FX?=
 =?utf-8?Q?zTUr032t6Alwk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlM4NTFtOFpzTHpOdGlyZm0vRkw0R1duaWpoS0Z4UUpxSmRQczlDbWl1K3VP?=
 =?utf-8?B?cjByKzlocEdyOXlnMnhjSlY1NUkxUjk1cWo3S24rWlFnNVY0MWROKytRemtx?=
 =?utf-8?B?S05FZ3ZuK0R4d1Z4Z2dTL3VmL0M4MzJUN1p5L1FwRkdueTBpQlJ1T0F4dE5a?=
 =?utf-8?B?QnpSYjlVNVlXdVI2ZFpRRFdEQld6Tnd5Tml4dDVqcXl6SjNzdWl6eWFvQytF?=
 =?utf-8?B?YXZYT0d5dDZDVm5kcXJwRHNjV0Q2MWtNWE5FYWJEbXlHem9YbXVHejNiNUJk?=
 =?utf-8?B?SmpqT2cxRlRYMUJkaTlUZWRIN2hiK3E0d09aT0tTdisxQW1yNGdqd3B2S0JR?=
 =?utf-8?B?MTN1ZG4wWStlaG92NkhCM3pHVmpXNit6VHhrVDd4aGVaZVQ2L3IwNHMrU2Fu?=
 =?utf-8?B?T21KNHdBSW00Ri9BRlJaNk94M1BRK1VVNVhuUUIrOVN4WC9qM3FhUTNaVStN?=
 =?utf-8?B?STVQY3lpaW9HUEQ2OFQ1SkVuRjFuVFJZK3RHVlF6RmdBK2Q4Q2hKd0RiTDdI?=
 =?utf-8?B?NUdKRU8xS043SmNBYlM5eTNiRnVqek1ZQjZJTi9SbXNIZFlOYzFCdDBLTU9p?=
 =?utf-8?B?bFVHSTZKRlE2YjZyYkNhaVJEejZZNDNiUVNvVHFwVHBJbXA1d09sWFFJaWZr?=
 =?utf-8?B?eUdGZVh3OUpqL0hQQlFmQUNmUjZBZzlEUXBPaCs1TzA4TmtCdlRaamQ5STVr?=
 =?utf-8?B?ekViR2NySG1MOE5WMTB0dzJvWlJLaWtiOHNnZWUrL1cvQ2l5V21mNXNESmcy?=
 =?utf-8?B?NENxd2p6ekxoM2FpRmUwZnlsMXpSdmVGRU4vRG5YUThVMHdCMW1tVFNMOHpr?=
 =?utf-8?B?SmcxZ2xKN1V1UFpkUncvbTBLVnpvZ1YxcmlQRGdFUXlpZDBJdFhXYklFWkk1?=
 =?utf-8?B?WjRWTS9iV2kxNkRZemNSOXJSWlRaRWt4YVlMZUo5QjlBM2VnR0sxWDVsRVVD?=
 =?utf-8?B?ZlR4aURNL0VqOEYyalNlanF1Z0xrQ1AzMzJ4RHNPQzRLcFhiYmJpNFFSL3ph?=
 =?utf-8?B?dVR6dk1lOGoyS29hVituNk5wMFFmaGloVzExOS9LenJYZlRtdTFtY2ZRTEVW?=
 =?utf-8?B?eWt5WGFvNEdCeWdEMzZLV1ZCK1dSZEo2OUZHSTNnc0IybVRRbnRESGxDWVEx?=
 =?utf-8?B?cTFxS0FjUURacVFZZzh6b2N2ck52aXloVXl4dnFaSjdsSkVCTk5tUzJaczc4?=
 =?utf-8?B?Ny9VZG96aTAyeHlYdG1GN3J2Y2dCWGNocmlGc3k4UVgrcTFMQWhpbnYwM3lW?=
 =?utf-8?B?RTJNank2bTdOc2lubktRbjZkaUJvVmR1T2dMVUVtdEhCank3d1lxNStJR0dE?=
 =?utf-8?B?R0FoUjlnSENUdG02dklDWXdmdUJCSWNDYlBUd1RWRTBhUU1HQ0JVQytHV3Ey?=
 =?utf-8?B?NVhKcDhnaTJyNEIzQW95ZXl4ekJuaG42ZEZVanc4VmxDOE1mbW82dUExSW9H?=
 =?utf-8?B?NnN1cG1IcWVuV2k5OU04T00rcDhCb2lIMW0rR2NVeWhveWNOTGd5NlNzYjJX?=
 =?utf-8?B?YnBIa2pIclVLMlM3WmRwNnJWMEFTVERBMW01MHdIN0VtRUVEa0xJOFRUV085?=
 =?utf-8?B?czBmMWpWWDFjL0c5Mm02QkZtNWRESG5OVFpEYUxlMEdUWmtNdzZ0MFdjaHZQ?=
 =?utf-8?B?eFB2cm9iOWRtcmNQMlhSbHdHZmcweGdGZjNjVVA2TzVKNkYzU2hDVWhzeElM?=
 =?utf-8?B?R0JhVXR6TkVRNEE1c3BoRzlyK0w1a3NNbUJHeFMyd2hYSEVCVVV4aW41TVRU?=
 =?utf-8?B?c1VVRDZ3dFZ3K3JLQnNxY25pUDJXdTVUM0Vyc05ZQ3FXUWk0MjRIRW9mUkQx?=
 =?utf-8?B?OXBRODhzMDA5SGxaTTNGVTRhZm0xSC9BSFdaSGdrMFgxb2RnVkdKQkJWdk56?=
 =?utf-8?B?cmpUWStOb0xlN3BsaW1senA0blRzVlo1WFFlcmVNRUdCNXVEMjNrQnhpL2dT?=
 =?utf-8?B?NFlpSVNQR1dKZXhZQWVsMTlWbVIvWC84emk0R2g4cFVsalBQVmJLYXIvUzNP?=
 =?utf-8?B?REhtUkNOc1g2aXBDZ2UxamhadU9xOTYxQkRYOG5jQU1OczJnQlN0akFkdzFP?=
 =?utf-8?B?R2FPOXN3eWtrd1F3TGxINS9mamJuaUppdXpOei8xNjhGRW1MTXhpV0YvZFhr?=
 =?utf-8?B?NDc5T1FsdUVRNEJ2cTl2Q0MwVCt1cnkrRURHWndRU29lUTNuTSs3V2pIMFJN?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbf5082-b1df-4dc6-105a-08dd3ae1eea0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 12:40:20.5365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ngsev1IKKOLV5DlaRc/fVlLIDr8vwo3ATvcZ4JBWmk/54LNd5NPrsi8n/jOZ6RPg7lEKfAasmDsJO6KBiiZjgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
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

Quoting Lucas De Marchi (2025-01-21 19:57:32-03:00)
>Serialize the command line to metadata.txt. The expected format in the
>metadata.txt is like below:
>
>        cmdline.argc : 6
>        cmdline.argv[0] : ./build/runner/igt_runner
>        cmdline.argv[1] : -o
>        cmdline.argv[2] : --test-list
>        cmdline.argv[3] : /tmp/testlist.txt
>        cmdline.argv[4] : build/tests/
>        cmdline.argv[5] : /tmp/results

One limitation here is that we would run into problems if one of the
arguments contains a newline character. We need to have a proper way of
handling that.

One option would be to have string serialization to escape newlines
characters, and string parsing to undo the escaping.

Another one would be to generalize read_hook_strs_from_file() (and with
a proper rename) to be reusable for both hook strings and argv.

>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> runner/settings.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> runner/settings.h |  5 +++++
> 2 files changed, 47 insertions(+)
>
>diff --git a/runner/settings.c b/runner/settings.c
>index 2787869ee..ed1afc205 100644
>--- a/runner/settings.c
>+++ b/runner/settings.c
>@@ -529,6 +529,18 @@ static void free_hook_strs(struct igt_vec *hook_strs)
>         igt_vec_fini(hook_strs);
> }
>=20
>+static void free_cmdline(struct settings *settings)
>+{
>+        if (!settings->cmdline.allocated)
>+                return;

I would just make life simpler and have cmdline being always allocated.
But I'm not blocking on this...

>+
>+        for (size_t i =3D 0; i < settings->cmdline.argc; i++)
>+                free(settings->cmdline.argv[i]);
>+
>+        free(settings->cmdline.argv);
>+}
>+
>+
> static bool file_exists_at(int dirfd, const char *filename)
> {
>         return faccessat(dirfd, filename, F_OK, 0) =3D=3D 0;
>@@ -646,6 +658,7 @@ void clear_settings(struct settings *settings)
>         free_regexes(&settings->exclude_regexes);
>         free_env_vars(&settings->env_vars);
>         free_hook_strs(&settings->hook_strs);
>+        free_cmdline(settings);
>=20
>         init_settings(settings);
> }
>@@ -875,6 +888,8 @@ bool parse_options(int argc, char **argv,
>                 goto error;
>         }
>=20
>+        settings->cmdline.argc =3D argc;
>+        settings->cmdline.argv =3D argv;
>=20
>         return true;
>=20
>@@ -1055,6 +1070,7 @@ static bool serialize_hook_strs(struct settings *set=
tings, int dirfd)
> bool serialize_settings(struct settings *settings)
> {
> #define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\n"=
, #name, s->name)
>+#define SERIALIZE_ARRAY_ITEM(f, s, name, _i, format) fprintf(f, "%s[%d] :=
 " format "\n", #name, _i, s->name[_i])
>=20
>         FILE *f;
>         int dirfd, covfd;
>@@ -1123,6 +1139,10 @@ bool serialize_settings(struct settings *settings)
>         SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
>         SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
>=20
>+        SERIALIZE_LINE(f, settings, cmdline.argc, "%d");
>+        for (int i =3D 0; i < settings->cmdline.argc; i++)
>+                SERIALIZE_ARRAY_ITEM(f, settings, cmdline.argv, i, "%s");
>+
>         if (settings->sync) {
>                 fflush(f);
>                 fsync(fileno(f));
>@@ -1177,9 +1197,21 @@ static char *parse_str(char **pval)
>                 s->field =3D _f(&val);                \
>                 goto cleanup;                        \
>         }
>+#define PARSE_LINE_ARRAY(s, name, val, field, _f, _max)                \
>+        do {                                                        \
>+                int idx;                                        \
>+                if (sscanf(name, #field "[%u]", &idx) =3D=3D 1 &&        =
\
>+                    idx < s->_max) {                                \
>+                        s->field[idx] =3D _f(&val);                \
>+                        goto cleanup;                                \
>+                }                                                \
>+        } while (0)
>+
> #define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, val, field, pa=
rse_int)
> #define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, val, field, pa=
rse_ul)
> #define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, val, field, pa=
rse_str)
>+#define PARSE_ARRAY_STR(s, name, val, field, _max) \
>+        PARSE_LINE_ARRAY(s, name, val, field, parse_str, _max)
>=20
> bool read_settings_from_file(struct settings *settings, FILE *f)
> {
>@@ -1211,6 +1243,15 @@ bool read_settings_from_file(struct settings *setti=
ngs, FILE *f)
>                 PARSE_INT(settings, name, val, enable_code_coverage);
>                 PARSE_INT(settings, name, val, cov_results_per_test);
>                 PARSE_STR(settings, name, val, code_coverage_script);
>+                PARSE_INT(settings, name, val, cmdline.argc);
>+
>+                if (settings->cmdline.argc && !settings->cmdline.argv) {
>+                        settings->cmdline.allocated =3D true;
>+                        settings->cmdline.argv =3D calloc(settings->cmdli=
ne.argc,
>+                                                        sizeof(*settings-=
>cmdline.argv));
>+                }

I think we could have a PARSE_ARRAY_LENGTH() that would encapsulate
reading the int and allocating the array. Of course, that would require
having a "known format" for an array structure in settings to be used by
others in the future.

The advantage of such a macro, is that we don't need to keep checking if
we already have the length and that we haven't done the allocation yet,
like done above.

--
Gustavo Sousa

>+
>+                PARSE_ARRAY_STR(settings, name, val, cmdline.argv, cmdlin=
e.argc);
>=20
>                 printf("Warning: Unknown field in settings file: %s =3D %=
s\n",
>                        name, val);
>@@ -1234,6 +1275,7 @@ cleanup:
>         return true;
> }
> #undef PARSE_LINE
>+#undef PARSE_LINE_ARRAY
>=20
> /**
>  * read_env_vars_from_file() - load env vars from a file
>diff --git a/runner/settings.h b/runner/settings.h
>index f69f09778..d563a0d16 100644
>--- a/runner/settings.h
>+++ b/runner/settings.h
>@@ -75,6 +75,11 @@ struct settings {
>         char *code_coverage_script;
>         bool enable_code_coverage;
>         bool cov_results_per_test;
>+        struct {
>+                bool allocated;
>+                int argc;
>+                char **argv;
>+        } cmdline;
> };
>=20
> /**
>--=20
>2.48.0
>
