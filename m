Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26141C44501
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 06:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9D510F399;
	Thu,  9 Jul 2026 06:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLdbOczQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E449710F399
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 06:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783578666; x=1815114666;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=0nLpNTVku88s8fcEYE2wQ3bQUtebK5jmmY+MsHM1Adw=;
 b=XLdbOczQYtIDihhF7WmxZi4fwZyAtTdFaON9dLmaldEv5Lo4Bzmgn7od
 N042EcLyGiJF2URW1JV2OWDPqUM3CWulU+i3fNTiL/5xR8igQ0I5uAO3Z
 IMa1TqyewSw17N758rjFgekv02JE/5hBcdmEkaCI9NP56hHiDMVfpqsrQ
 e8B1INjYIz18T1oHgbrXo/sarehe3AdHqBF1at0L1Cy0VOtCjSkUij5o4
 9tKNjFkIQl06u/BVTL2IevOr+9MPVwnO4dWMp0+cmmBsr2ZPeJ7LarjLq
 CNjFslD8RqOJgeWmT/1KzMtqTeGJCkjYWF3+qBD0sNbauPceY8hmzx9Rf w==;
X-CSE-ConnectionGUID: V8AEKanfSYCBNd11Rq4lBg==
X-CSE-MsgGUID: pLDmDzjmRVaXgqIpIsRuOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101797530"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
 d="scan'208,217";a="101797530"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 23:31:05 -0700
X-CSE-ConnectionGUID: mER7N+O5R86ygoxTVLmbRA==
X-CSE-MsgGUID: BnFMykVJRmqTS856YqTEOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
 d="scan'208,217";a="252746695"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 23:31:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 23:31:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 23:31:04 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.57)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 23:31:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vH4dIbudjD1tv3G9xEMV8s+pfsLn2y1bWujFc6VfCkYbnciaEssbhH/uKIqgpzYS2RKqXR0gx7ILYy7c2hLiB0w6r4jl9u1cUUKGlGWpkZnQjjpdIpConP4fEuURCZIqbIJLy+JdUeMNrP2yr1D0uPcpt61hZWRjWNEV5i96CF3IeBFmxRSpgYwTjOn5HWl4Yf5OEhIWe+uQhOYkIck9nmtFmnXW/86rGufN20fP61XTo+myP27A7ohYuu3/ncZMoFZqSOBcz3MfZOztL8Zcad4fFUEVsphykuP9Nj9P9D4wcLMN/0I3prF3AFyNxg9fM8za3UlHBMnP5cGDW3iQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+eYhFGBSljet42MHn+LK//csVzaw3gB/DZ+CeSrcjk=;
 b=Ehwwt/lcqAg8cPkuwIVw8BJra75xEhs62FryKEInsiDn2ROFhr6Ye2TamaL8Xl0cPwiEnanyrGaeWfILT4DnSmShDDr62fJg7yhX3FXKqglorAcM5I/juZ2IdAILbDAwMiShbTUmMU7D/nMYHfdyp98zPT5EnTTj5SLvlWAHck7jKdvfHX1Z1hFGJzy+EUBGpXgrEX4iw2v142ttIEPqZQ3vvjifUrf6LLY6a0WWANHRNsxQByzm2SAjS57KUsUv2XNXl4acCr98EciAJ5C3yXesOhFHvyM2mpdIpyCbNPd41BmZC2z/pQOeyBuDZ2sReMgtoj+VWB7Htw7rgc94CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by IA1PR11MB7248.namprd11.prod.outlook.com (2603:10b6:208:42c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 06:30:59 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 06:30:59 +0000
Content-Type: multipart/alternative;
 boundary="------------52fb08gZOtZgwNfgJIF2B9ec"
Message-ID: <bd0165e7-d245-4780-ae78-691589bc808a@intel.com>
Date: Thu, 9 Jul 2026 12:00:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
To: Manasi Navare <navaremanasi@google.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "karthik.b.s@intel.com"
 <karthik.b.s@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, =?UTF-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?=
 <Lancelot.Wu@mediatek.com>, "gildekel@google.com" <gildekel@google.com>
References: <20260621081043.598388-1-jason-jh.lin@mediatek.com>
 <520d7fe2b1ef01d81cbb9cba7ca79e5cbd15922c.camel@mediatek.com>
 <CAMNLLoTHYoE3AiFeTaCj14ktcvuMjR0LoewUnmR+AXpoEoxpZw@mail.gmail.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <CAMNLLoTHYoE3AiFeTaCj14ktcvuMjR0LoewUnmR+AXpoEoxpZw@mail.gmail.com>
X-ClientProxiedBy: MA5P287CA0260.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::13) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|IA1PR11MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf1bdbb-0f68-4dd8-026a-08dedd83a382
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|7416014|376014|1800799024|13003099007|18002099003|22082099003|3023799007|8096899003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: O0PATdFzZngXD1huHbzysm3IJOsCgYdHDIRHs7TCoZzwtgptYQbPXBzjgDCtwLs1SIOPPW3sHRAcC8VBRgcVd6K2vu2HNhSSh8ngXMKBHhAz3XYbntiBpmLeOHsnYnszQDaop97p3vowVu2pGNBmYLbm/DK+YqrDEsk50L0bnNvVujhQWbU5OX89IKN4UqTsvbrekgqGqVCsuKeUqOmKKxjik1Jj75OkmE/d5D1yOJE3g1osV1YAgn5T/WUB2KXGmTdt9G9enh1oCZGuj0qmX7XWYgA/UPnTCHHkGrUWpnjSJPyFj5JuYORXjs8yNS41YJ+PqkeNElK20dCbSpvfugi6tMYSpwcDnWRHouHsu9Cc9feQ/BGdPF28acKpWF2qui63VNG9Rk+7TMW239FdZ2McL3hHj+Qf5Y9M08U9WkmxhSBU+wt97JjJ1q9PdGBllw6LwTgC3xCJImaVu7P2/h6e/qGKH7vfK6dZUhwAXWHA1bmAkAG8g5bh7QZMHutg49L7+w1BmIJM9MJvXJ5BCyfmm0/EnuyCnFsIOKEbAZCXa6zqwWVd6JynofvlFMSoNsGTHDSL/dSuO7UeQ+YZ2OYKt7p7aiNks41/2kUC9ees83mBf0LXtwnD/pLs7HSK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(13003099007)(18002099003)(22082099003)(3023799007)(8096899003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEh0R2ZpTm40VGtUOTU5emQvMFduTGwyaTdlTHdKb3NBTFJIaHRoUVZwRExi?=
 =?utf-8?B?K0I1TmV1OXZUMExZOVZZd3lNN2dEUzFMSHZwd2lMOEVncTRNN0JvK29RZ0VK?=
 =?utf-8?B?Qld4dWtDbXh5ekJjdGpFWGRGNmJLNVJ2TUpPOE0vYjFSWFJsaC9sanNEK3Qy?=
 =?utf-8?B?c0FIKzV0dVBEa2oyRUlEMDJBUTZubFVyZzZXVEZ5c0pTUVFXczJoR0lXNmRt?=
 =?utf-8?B?cG1sbW1BYWE3QXl5OTFGK3M3SGtZL1pJdTgrT3JRUmoyQ250R1pHSHF5dUVL?=
 =?utf-8?B?cWUvaHkzR1FIUnN2RXlDWXRsM3YzNC9UVW52U1dJa3pMa3JNc2tzb2tKMW02?=
 =?utf-8?B?TVdNbmQ3MHhlSHpNa2xRNWdPNkFQa3ByMjExcndoWC9OdTRCUlBMTXFTWjFs?=
 =?utf-8?B?NTlXcGZEbUx0UGNXUS9rZjdMRm5QcFlSQ3E0UEQrYjljdmlLQVkrSE5UWTlq?=
 =?utf-8?B?NXJLSVF6UVN3WmlGNEMzT3dtNnRvUmJZT08wQXJ0engzTVFOTGMyN1ppUXQw?=
 =?utf-8?B?bmpqZTZGYjNqdjJoV2VWME5TaktrMklqUlVmQUJ4Z2VQd09JRkp5b2Z6M3I1?=
 =?utf-8?B?WUI2NU1KK2xNYk9yQ1R4KzlwaDNyNnVCWGQ5aGdLNFB4NHR4U1hEZXhLNTdQ?=
 =?utf-8?B?dmlaeCtVVi92WXFaeVlZQnBxaElJWWZxMktnYzJyOTRNSitZREV2ZzVYV0JU?=
 =?utf-8?B?Q0lMVlhjZEFEQUVJNk9MRTBnc2NYSHFCeHZxWENOdTNCMWU3bGh5bXBJbHpj?=
 =?utf-8?B?dm5rK1cvS29ENUEyeFdVZ01Fb3NDU2lQek9hbmVTRVJMc1ZIcEpvZlRwdkZX?=
 =?utf-8?B?YkJUNXBYQnZjM3ZGdllXdjhuVStDajJtcUNFM3dUNmx3RHlwWDRXQkFqMHoy?=
 =?utf-8?B?MWhOWm9IeWxYaDJTM0E0ZWtqUzF6cUNBV3dENjVqMUJPRUpySDhrUW5JRU5J?=
 =?utf-8?B?WUg1akJFcFNvVGJKSDVlQVVzRGg5MVU0N2xUaFpaTGV5ZmYyeGlhdlZCYU1O?=
 =?utf-8?B?T2UrZ3RRT2VBVUVtbkRpeDhvSDZWOGdyQW1GUzNrN25RN29wQzVsM1VUWTFj?=
 =?utf-8?B?Y3F3TVBmQ1dCTFBtQldnNkpYSWRKRlFMT1hRNXBSWldGL1kxQzJlTFBpNDBZ?=
 =?utf-8?B?dUV2Y1dEM3B3dDRndG92akFBcUVDYllJcGpqb0Q4SXNCakFTQTdrV3ZIUjF5?=
 =?utf-8?B?VTI4dVBYdm5jMnd2Sm42TjZxS29wS21DWDBmejFLVzZYWUd6U0hLcWNyS0hN?=
 =?utf-8?B?NUVXdGRwSkZiL3RtMVMxMU5UOU5tbS9VQ3hEK1lwbjdDODJGN01LWVVWRnNh?=
 =?utf-8?B?QUF6U3gvQ1gxdE1hYVpEcmh2VWpNMmp4cUZsczkrcUR6ODJRVFlVaitxbTJT?=
 =?utf-8?B?RDIxTFNxY3RlS3hadDZ0NEdzdHRXdUI0MUM0QkpFUDJydTlaSTEyMHJnelAy?=
 =?utf-8?B?cDdtZThHU0ZPY0JIZFlLL090NG1JREdCZjhaRHZNQVo0NUxVbE00dGNKaFpo?=
 =?utf-8?B?QU1UeExQL3pyUWp2eU8rVVFNRDN3empRQWZXVE9qSUtncTlWQ2JNTW5uS1pO?=
 =?utf-8?B?eTNNSWx6cGpwOHZNOHE1YXgvTEVWQXVBTXdmL09yTTE0U2xtZkVmYnRMdkd1?=
 =?utf-8?B?dm9IVUhXZ0xHZDBUcGVyNEYxL3dJQ2hXVGhId0dGOFlzMHRmbE1LY0tOWmw4?=
 =?utf-8?B?dDc2MzJQV3Y0TW1GZ0hvZ0thUjAyY3RoclA5bE5TRkZnMU9NZFgweEI5Y1E5?=
 =?utf-8?B?bk1Tdm9NN1ZXeklabEZZcUJLS2VmNFVHemc2U0lQNjJWQnNNdTUvOTdzZ3N1?=
 =?utf-8?B?bEpSUnU0Qk9BbVkvR0pINHlSU1hjdEhYZFVpK0Y3d1p0c1dQWVg2aXFKMi9Z?=
 =?utf-8?B?OU0zeGk4Uks2RnB2aE1SZDZHUzVGZmlYcGh0ZHhjSFpPV2RvR0FwdkJ2dnZX?=
 =?utf-8?B?eUVKZ2FLTFJtKy9odkhTVlptYTNrT3FvVnRLcEJ3d3dPV0pMekpHOUdhcUwz?=
 =?utf-8?B?bUhIa0xMYWdRM1V1dThjSTUzcVI2MWZPc0FrYmFlYlFCdEV4MThnU2hYR3NN?=
 =?utf-8?B?enI5WlIzd3RweWdPZk1SQkh0cDB4RUIxNVpEYTVaM2NjTzhCWkpBT2pZNHh4?=
 =?utf-8?B?NFQ0UGdhQkFkTjdIOWZjaFY5T0FDUXBRSE1xaGp6L2h1Y0JqNFlIRHNNZ1hM?=
 =?utf-8?B?TWNaTTI4Ujhya2xHRGJTaG9oUVRnMmQ5bjVld04xT3JZVlBiQnFZMkFMd0Fv?=
 =?utf-8?B?cjBDSTdjMDMyUHdhOTRuOENYSXlnUjdvYituR3FmMFpRLzlyckpFSnZiSWxM?=
 =?utf-8?B?K0ZTTndvckRnYzluYWdtc0hhMFdZWlZocTlMSTVkTVBIYi90VlJrQT09?=
X-Exchange-RoutingPolicyChecked: CTYwRQ/8ZiYG3vPIFQfjyROOHFJpsOEws4tF1JVgdj3Sxm3vSItwXgbb+WthceaDx5pFU8iPU5YUWcCAvSspd8lKkxBzRoNb9j2IvDE7UMxavlIcY6EDCJc29MzdJmx/2tf+NhrOUkG4Tf4TTS50bYAbPJJxegK7iFTBzgQs2Drd4+glYLxTGEA07oRH2+5WD08Xpzk067JRS1lp8YCnulsrd7y9CdKMsQ6GyZOF4cyOV7x0jd+11qH8IXK4r8aveopTW7ST2xYjGYFv3pvOrs/6m9AdIMwQmUfoO+0pfVw0KiDAbCdU09VoIyFXCVU94DsK8ro4O9T+Y+2Dzrr1BQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf1bdbb-0f68-4dd8-026a-08dedd83a382
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 06:30:59.0567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxEnRAr2GSJpPTzM7ZcprT57kokW4bn+82KIFSRUkoCzerTEdligIHcLtjfyFTXHUccavS7WlOr1UfMA7Y/Q/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7248
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

--------------52fb08gZOtZgwNfgJIF2B9ec
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason,

Rev2 https://patchwork.freedesktop.org/series/166923/#rev2 i see IGT 
build failure,

can you please check?

On 09-07-2026 03:58 am, Manasi Navare wrote:
> Hi @Swati Sharma <mailto:swati2.sharma@intel.com> @Karthik B S 
> <mailto:karthik.b.s@intel.com> , @Kurmi, Suresh Kumar 
> <mailto:suresh.kumar.kurmi@intel.com> :
>
> Could we please get Intel's help here to get this landed, Jason has 
> already addressed the review comments from Swati.
> This is blocking the tests from Google side.
>
> Regards
> Manasi
>
> On Sat, Jun 27, 2026 at 10:16 AM Jason-JH Lin (林睿祥) 
> <Jason-JH.Lin@mediatek.com> wrote:
>
>     On Sun, 2026-06-21 at 16:07 +0800, Jason-JH Lin wrote:
>     > Check if the primary plane supports the test format before
>     attempting
>     > to create framebuffer. This allows the test to gracefully skip
>     > formats
>     > not supported by the hardware (e.g., FP16 formats on MediaTek)
>     > instead
>     > of failing with assertion errors.
>     >
>     > Fixes: 5d46625cfb21 ("tests/kms_hdr: add FP16 format coverage")
>     > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>     >
>     > ---
>     >
>     > Change in v2:
>     > 1. Fix grammatical error "not" -> "dosen't"
>     > 2. Rebased on: https://patchwork.freedesktop.org/series/168759
>     >
>
>     Hi Swati,
>
>     I've modified your comments in the previous version:
>     https://patchwork.freedesktop.org/patch/726414/
>
>     Could you please help review and add a Reviewed-by tag?
>     Thank you very much.
>
>     Regards
>     Jason-JH Lin
>
>     > ---
>     >  tests/kms_hdr.c | 10 +++++++++-
>     >  1 file changed, 9 insertions(+), 1 deletion(-)
>     >
>     > diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>     > index 2079bc154412..ac75f66f34a0 100644
>     > --- a/tests/kms_hdr.c
>     > +++ b/tests/kms_hdr.c
>     > @@ -298,9 +298,17 @@ static void test_bpc_switch(data_t *data,
>     > uint32_t flags)
>     >
>     >  igt_dynamic_f("pipe-%s-%s-%s",
>     > igt_crtc_name(crtc),
>     > output->name,
>     > -
>     > igt_format_str(hdr_test_formats[i]))
>     > +
>     > igt_format_str(hdr_test_formats[i])) {
>     > +  igt_require_f(igt_plane_has_
>     > format_mod(data->primary,
>     > +
>     >              hdr_test_formats[i],
>     > +
>     >              DRM_FORMAT_MOD_LINEAR),
>     > +                                                   "%s: Primary
>     > plane doesn't support format %s.\n",
>     > +
>     > igt_output_name(output),
>     > +
>     > igt_format_str(hdr_test_formats[i]));
>     > +
>     >  test_bpc_switch_on_output(da
>     > ta, crtc, output,
>     >
>     > hdr_test_formats[i], flags);
>     > +                             }
>     >
>     >                               test_fini(data);
>     >                       }
>
--------------52fb08gZOtZgwNfgJIF2B9ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jason,</p>
    <p>Rev2 <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/166923/#rev2">https://patchwork.freedesktop.org/series/166923/#rev2</a> i see
      IGT build failure,&nbsp;</p>
    <p>can you please check?</p>
    <div class="moz-cite-prefix">On 09-07-2026 03:58 am, Manasi Navare
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAMNLLoTHYoE3AiFeTaCj14ktcvuMjR0LoewUnmR+AXpoEoxpZw@mail.gmail.com">
      
      <div dir="ltr">Hi&nbsp;<a class="gmail_plusreply" id="plusReplyChip-2" href="mailto:swati2.sharma@intel.com" tabindex="-1" moz-do-not-send="true">@Swati Sharma</a>&nbsp;&nbsp;<a class="gmail_plusreply" id="plusReplyChip-3" href="mailto:karthik.b.s@intel.com" tabindex="-1" moz-do-not-send="true">@Karthik B S</a>&nbsp;,&nbsp;<a class="gmail_plusreply" id="plusReplyChip-4" href="mailto:suresh.kumar.kurmi@intel.com" tabindex="-1" moz-do-not-send="true">@Kurmi, Suresh Kumar</a>&nbsp;:
        <div><br>
        </div>
        <div>Could we please get Intel's help here to get this landed,
          Jason has already addressed the review comments from Swati.</div>
        <div>This is blocking the tests from Google side.</div>
        <div><br>
        </div>
        <div>Regards</div>
        <div>Manasi</div>
      </div>
      <br>
      <div class="gmail_quote gmail_quote_container">
        <div dir="ltr" class="gmail_attr">On Sat, Jun 27, 2026 at
          10:16 AM Jason-JH Lin (林睿祥) &lt;<a href="mailto:Jason-JH.Lin@mediatek.com" moz-do-not-send="true" class="moz-txt-link-freetext">Jason-JH.Lin@mediatek.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
          Sun, 2026-06-21 at 16:07 +0800, Jason-JH Lin wrote:<br>
          &gt; Check if the primary plane supports the test format
          before attempting<br>
          &gt; to create framebuffer. This allows the test to gracefully
          skip<br>
          &gt; formats<br>
          &gt; not supported by the hardware (e.g., FP16 formats on
          MediaTek)<br>
          &gt; instead<br>
          &gt; of failing with assertion errors.<br>
          &gt; <br>
          &gt; Fixes: 5d46625cfb21 (&quot;tests/kms_hdr: add FP16 format
          coverage&quot;)<br>
          &gt; Signed-off-by: Jason-JH Lin &lt;<a href="mailto:jason-jh.lin@mediatek.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">jason-jh.lin@mediatek.com</a>&gt;<br>
          &gt; <br>
          &gt; ---<br>
          &gt; <br>
          &gt; Change in v2:<br>
          &gt; 1. Fix grammatical error &quot;not&quot; -&gt; &quot;dosen't&quot;<br>
          &gt; 2. Rebased on: <a href="https://patchwork.freedesktop.org/series/168759" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/168759</a><br>
          &gt; <br>
          <br>
          Hi Swati,<br>
          <br>
          I've modified your comments in the previous version:<br>
          <a href="https://patchwork.freedesktop.org/patch/726414/" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/patch/726414/</a><br>
          <br>
          Could you please help review and add a Reviewed-by tag?<br>
          Thank you very much.<br>
          <br>
          Regards<br>
          Jason-JH Lin<br>
          <br>
          &gt; ---<br>
          &gt; &nbsp;tests/kms_hdr.c | 10 +++++++++-<br>
          &gt; &nbsp;1 file changed, 9 insertions(+), 1 deletion(-)<br>
          &gt; <br>
          &gt; diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c<br>
          &gt; index 2079bc154412..ac75f66f34a0 100644<br>
          &gt; --- a/tests/kms_hdr.c<br>
          &gt; +++ b/tests/kms_hdr.c<br>
          &gt; @@ -298,9 +298,17 @@ static void test_bpc_switch(data_t
          *data,<br>
          &gt; uint32_t flags)<br>
          &gt; &nbsp;<br>
          &gt; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;igt_dynamic_f(&quot;pipe-%s-%s-%s&quot;,<br>
          &gt; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          igt_crtc_name(crtc),<br>
          &gt; output-&gt;name,<br>
          &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
          &gt; igt_format_str(hdr_test_formats[i]))<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
          &gt; igt_format_str(hdr_test_formats[i])) {<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;igt_require_f(igt_plane_has_<br>
          &gt; format_mod(data-&gt;primary,<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp;<br>
          &gt;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hdr_test_formats[i],<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp;<br>
          &gt;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_MOD_LINEAR),<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s:
          Primary<br>
          &gt; plane doesn't support format %s.\n&quot;,<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
          &gt; igt_output_name(output),<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
          &gt; igt_format_str(hdr_test_formats[i]));<br>
          &gt; +<br>
          &gt; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;test_bpc_switch_on_output(da<br>
          &gt; ta, crtc, output,<br>
          &gt; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp;&nbsp;<br>
          &gt; hdr_test_formats[i], flags);<br>
          &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
          &gt; &nbsp;<br>
          &gt; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;test_fini(data);<br>
          &gt; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------52fb08gZOtZgwNfgJIF2B9ec--
