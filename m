Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BFFD6ACC3
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 12:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFEF10EAAB;
	Wed, 27 Nov 2024 12:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iirjjaUF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E8710EAAB
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 12:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732708854; x=1764244854;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=Zrbe1oF2dUoHC2AVGVafrdJ/qcVXIVgQUDjE1tdzApM=;
 b=iirjjaUFeMt933nea8jwba2l6VDyoLte1Mq3nPINw5HS33hbU/qsFXUx
 ILiJiIBcnlr3mEax5PGku8FZzu36ovY862jjjUJsQl6Nie2FaI8+tlVTp
 STwbX8nYOo6wJEB3zX7nvsMLDUtadNSiWSvUJMcEYZWri/b1TM64ve7kf
 tbEGpAZSmorQqmUjUmHQBfAT72nDYq9Ub0BI5d9HDx/72QzPcMDjUfEOp
 HOuLw1qYkKOGRWAuqr5Tce103nBRurHwzkEqrxUWEJusB3XuoGduSPzaR
 KylE7c/AATRdSIMkkPSaB1iDuaSVXk3MKuaXwXvwPald4AZQqpFQkXidQ A==;
X-CSE-ConnectionGUID: ikCudr9RT9eZea6kh0YTYg==
X-CSE-MsgGUID: 1dbhQBGfS4OpizR9cSOdIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="50311751"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="50311751"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 04:00:53 -0800
X-CSE-ConnectionGUID: O/XToWYKTsuNhFO3YaMvFA==
X-CSE-MsgGUID: MHSYZrjBT2ejrVnkMnkHdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="122886567"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2024 04:00:52 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 27 Nov 2024 04:00:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 27 Nov 2024 04:00:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 27 Nov 2024 04:00:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQfxutSuMMsG/nhVERsHjh9rFS6S/TP6KcIO7l1QxiaSsMWPBNXmHZoQaiIO/cx5AwrJmniDJwM8j7MjzOvozOi+L3/ZBiCXvAu+KeiLJBZq3x3/oM/HTTus5T7/J136PTRYjJCcNJTgMco0sLXzZItf3RMDaQHRtP2bW+wSsY4fhKk/wup0Bg5joAOt5V7boIzJVZEVSN/HaJGgwgKIzzm2JUK1a+HD0VgOfG+d1YvR00VG9qYPNpjXtT+4vHWx3WPrDKIEqoGgAhXyTwI5esa5yakf8++0CTWDzqY3fELFYlbnUtXNj7j0PDGngBKtzp8t75NnaRd+Ir158w7t7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJXpbFgaj5xp4LkrTpFLJHJmwWbxKxPMybfDAE56biM=;
 b=rETCL7DSExa3oYM3c2dIoIFHIpvbRxHbAxTqowQilJJvle4qHj3tjFUAu4dYH65/bntNG7cCFK4603SS2aEPcp98rzSqfa8UK/xkSg6klgGZDHagSa3jMafc8DU+3jMCEy+JE7Al03U4REXFvmBVV5rCyS1Q0MM6c9owowCrKII2dnza1jtuT2ArCPGz1PtCLfQGk6SG9CjzSyM2IRCqY6s+n1PB54KW4qgQ4hHrhxqnsGiteTU8V7BxPKQXc7it/QCDgVbHrfOuBYXzf3znGhuggutWArBtYz8rDE5OdVh6ZduR3eoWkGOe3ofbBAyF7t+MR32o6Bq+lS9R9fAYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by SN7PR11MB7640.namprd11.prod.outlook.com (2603:10b6:806:341::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Wed, 27 Nov
 2024 12:00:48 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%5]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 12:00:48 +0000
Date: Wed, 27 Nov 2024 13:00:44 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests=2Finte?=
 =?utf-8?Q?l=2Fgem=5Fctx=5Fpersistence?= =?utf-8?Q?=3A?= Wait for context
 termination (rev4)
Message-ID: <6t7kmcsn2vf52kvdsf5z43n7qrl6h6onxjggmku3zz3p6eue7p@s3iqmrho5bt6>
References: <20241127094528.7041-1-krzysztof.niemiec@intel.com>
 <173270400433.3666921.944906009940259492@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173270400433.3666921.944906009940259492@b555e5b46a47>
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|SN7PR11MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ceada2-47c6-4560-55a8-08dd0edb21d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rnh4YXZOY0V3WFJPSG8yYWl3VVNCY1RsbTkxRTkvbHA5TkQyWVZic3VoTGQx?=
 =?utf-8?B?QklMTHpLV1JLUUpvdWkrVXN5RTRFa1liNnVETXdsSDMrTW5PcHNuVkk1K2JH?=
 =?utf-8?B?ZHVaWUJFTVQ5K0ZockE2NjdyMEZqeUEyQ3hBNmdFSkJuWWdSa3F5THZZUzBx?=
 =?utf-8?B?WmNZUVlLRVFZeEttRW1Felh1L0J2VXpQbmp2Z1lsZjhHRmgzckFvYmJjSVNC?=
 =?utf-8?B?N0FocXNPMjczQlZEVzhGaTVhc0VDMkppdFB1TmJpSTNjYmQrTjVGUC95OEhC?=
 =?utf-8?B?eis4STF3VEt2NHBrNTBaUzc3Y0MzeXNvNlc5V1hDYXRxYkJwN1U0K3FpLzlj?=
 =?utf-8?B?clNBRXUwekNoNVVKNVZqVlVGTlVkN0FLWTVmV24vMWZndzNEUm9tL2FvL1p4?=
 =?utf-8?B?bVNjLytSRG94anNHWEhHNEpuTU9Uc2JEQ3BTR2ZubFhTK0EwVEIrMWhReEIz?=
 =?utf-8?B?eXhhcjVzNk5MbDFScnFZdXlZWEdYZUlXU1FBbTRhQzJ4dzNFL1V2NFJ4cEtW?=
 =?utf-8?B?MlAvSkxqL3B0SFo1TTNLcExJbmVTRnlHUGQrdDhmSlR4c210ejdwcitKcC81?=
 =?utf-8?B?bjNMMlFpWkhGWTNrdFMzVTB6Z3BSdWk2bkhYMnVXdkhNenlwRnVSZmpqa010?=
 =?utf-8?B?NFBOc1k5L3hNVWlsbndrUGo2MGlLSWhWK0FENnRjVis0dHovU21ydUhtbC9N?=
 =?utf-8?B?ZXNEZ1REVXRtWitzS0VBckZMUm1lNWxldGFHRXRicDQ4bEhYNGxDSUkrZGl2?=
 =?utf-8?B?aTRSWVkxZ1JCVkJUT0NYS05pOEtQc1E0SFVMQUd4dzRGZjhORUVSVGpxN1py?=
 =?utf-8?B?K1hHcksvcTZJSDJWaFJlVnpIVGhuZlNQb0g4dzhIcmZyUkc2dnU0dzVuaFZL?=
 =?utf-8?B?WlJxYVIwZzNsOGpmbEZzU2FpclhtNGlzMExRSkdJemNQaDNxWE5KRC93dXhZ?=
 =?utf-8?B?NUsxWVhkbFZsTVhBaDdUVks4dzFiRlVPMmFGbDRDdU9uVGpHSTJiZ201L3Ft?=
 =?utf-8?B?cyttc1lLK05QZzdwQVF4SDRXUjRrY0RhYnJ4ZjBXM2Y2TEM1ckRxc21mSjZr?=
 =?utf-8?B?Wm4vSlVvY0tueUppRVlZQWRBalczN1FhMHdLakZHSTY2U0t6ZldqL2dOaVlv?=
 =?utf-8?B?Q1piSTF6RlNZZE1iTkNJakpOdHUxbGZhYldreDErWW1oeGY2bUVuZnZGOThv?=
 =?utf-8?B?MVF4T2lkTDI4MnczVi9Ec2xyRmYrbE80ME10U3pXRGxINEhiWTV6a1VjRFFt?=
 =?utf-8?B?OEhKVUV6MmJyb28wK0JOdVMxQ213azg3ZklJS0NDNVlaeHNtWlEyZkdvT2cx?=
 =?utf-8?B?VXNhWVNSSWh4Wkp5dC9IVEphZjlIZGhUNm45TG5rRmVBZG80a0pEY25xTm1G?=
 =?utf-8?B?QnZxdE5kZjJwVTFoQzNCNzc5bWN2NXBoYUxCSTdiRW85K3hlU0JIVGNWb2Ji?=
 =?utf-8?B?QkZvOVlydk10Y3ZEZ1lsUFc4cXh4QUtubVBuL2I1L2h4RmU3NVNxV0FqeXpE?=
 =?utf-8?B?ZWM3cHVLZllkeTR0RHRtNHRpbERNcFVPMGhBYWpyTWVidExzaVllSGVMVm50?=
 =?utf-8?B?SWFPc1hPcTJwYnoyTXBOZlBmZ3BJWjVZTTlORjBYZzNwSEhycXV0R3NPOGRz?=
 =?utf-8?B?aTk2dUh4WEpoQ0E0UlpXQkRWN3dHaDV2OGh6VkRwR0RTUWpGNFN5YU8reCs2?=
 =?utf-8?B?bkQyRGYxYTNnWFVMSWhTNWpGWUZlY2ZSSHdaOS9iL1I0SUtsd215UGkvenZ3?=
 =?utf-8?Q?Zx5AegxsoiSpJI+iOA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHZWdlRDeFIrTjRZQk41TGNEY3pUUVkwcWQwdzVqM2JWTTRqVkJ6RDg1NnYw?=
 =?utf-8?B?VW9aQ1NLcVRSUkp1UXpJdUR6NGcwTWhSWjBzNU5ncnAyNStHWVVFb1FZdWNT?=
 =?utf-8?B?WUtQeVVzbjdTVTdzRVZLMmtqaWFpYWlrUnRxV3YranFpeTU2ZnpWOGVqbUNR?=
 =?utf-8?B?RHo1T0I5RWwreS9McVhCck5CRllyM3AwVHlnZ2hvMEJmYW4rVzhid2VYWmtN?=
 =?utf-8?B?aEpaU3NLcVZzWmdFc25mbmdmdWFWcTdIM0lQdnVtb0Q3U3lLTVo4R0dDMGx0?=
 =?utf-8?B?akdPaExyYXM1UDJVK1dWQUVnOHBDZTlqNCtTY0xxVkVQZ2s3TDE0dVhSdDM0?=
 =?utf-8?B?Y2Z2TmVWYitBdTEyY1MreThLZnh0b2JQWlYwZkozNkZNYVczbFNhZ0dGS0tI?=
 =?utf-8?B?cjlPZjU1dFE0NUxMdHgyMmJqWkRiVEhNaldFU0ViS2xrcXlOeUNMSXNzL0ZX?=
 =?utf-8?B?OEJTZGVUMU93UDBoa1Z1UHhqSm5Va3dTK1ZITWE1YkhrTFdmSkhXS2oyUDdq?=
 =?utf-8?B?QXBaOU1iMThKYkI3MFF2M3ZmWUtvcW5MWnRNb1dFV0VOcVZxTmc0WGpFelFv?=
 =?utf-8?B?RURjeHZ6SGRoTVp3bEYrWmNXVzFzNmUvQVZFWWdkWk5GbWdmdkFDY3kzUmxo?=
 =?utf-8?B?dEVDSG51TkdOYm85cUx1WGZtM0U3bjk2Y1hvRGthazhzWTA5TWUwTWhuSG8w?=
 =?utf-8?B?T3Q5ekgycm9JNWYwUGpVWGdVNFJKcFhTbzZ5bXRyQ1FYbG13UlliVTI0V3JZ?=
 =?utf-8?B?QW96US9xNnBETFRNa0lGV0hwRFBpdFhlL0xISkdBUEFwUTd0RWJBeU5zdDh1?=
 =?utf-8?B?aGhseE1ab1U2dnNwMVUxc3ZaMVJ6SldYUUQrc0I4ZnFOY25Na3F0MGxyMjRL?=
 =?utf-8?B?WjUzZXRtTXpHTlZsY05MQlJoaGJhNGR5d2l5bXJxY0djVkpaL25vdXBGc1NE?=
 =?utf-8?B?Tjk1UjBvZE5FbENTK3ZOby9VeEpoTldtd2pzVllTYzhiRU5YSG9TVFVJWXRU?=
 =?utf-8?B?YURjMDQvRW0zcHM4cC9rZVZFczZ0NFlITU5Xa3JyUkhRQWRCaVpzWDVOOEJI?=
 =?utf-8?B?TFVXNG5VdDQwQXRHdlVLVzcxbHJmc2lTeFpETjhPZGVIL3R5TW9xNGxtOVVF?=
 =?utf-8?B?VGkrbUM5djY1Q0VRdVNxWkFIMWJTWkV0RVUrUU1hZFN6UjNCTE1COWQweHNV?=
 =?utf-8?B?YmZaUTFSbkJVWkxNV3g1M3UxbUtzOEROVnUrMVUzNzlGYmRJN1pmZlZYNk8y?=
 =?utf-8?B?ZXFRR0U1eEIrT0YwaE1FcDUvbFRzVHQxcXF5T2hCRURiTnJLOTdUMHA1Z3Vs?=
 =?utf-8?B?VzRhemhQbVRnaGl1RHRKOHpvR1N4V2oyLzRHWW5ONHNWWk1wb2RvZHpWWlhl?=
 =?utf-8?B?VnhWdWczdlhWMk1yTUFGYVozdm1oU1lSc3prRDJiWVFpWEkxKzkxR21BOEVm?=
 =?utf-8?B?WHBEV3JKU0xmWmovVXNpZnlNRDJ3M292cnl1dFhLSWk4aVZiYUx4YzdFS29z?=
 =?utf-8?B?WTFyT2hvaU1GeDBhQVd0S1FNamNoVy9ocUdIL3ZHNnJjcWowZ2lxNVljdXp4?=
 =?utf-8?B?VENSTXZHblc4KzdBMDZqYVU4b1g5bFE4ckhHU2w2dzVsWmQzOVRJSFNOR0VP?=
 =?utf-8?B?clpGYjh2S2VZNlllLzVYWmNWQThiWEdnMjlkcTE1dk1FM0p2cW1oRU1hREV1?=
 =?utf-8?B?VkhNVU54M211aGFBTVN4SnBsOENONDdPUlRoa2ZEODYzNXFVbVljdFBlUkVj?=
 =?utf-8?B?aWxPSklHenJPcEtPU2hLWnZzYm84dkw2L2k4TG1mY3Q2SzIyYy9xT2RZVmJi?=
 =?utf-8?B?aWR6b0JGRUwzVXoxaS9nRkpyVS9YSTE3UHIvbFJ5eE5nQjdPUTBsVlMzZlc2?=
 =?utf-8?B?TWxXT21YN1RUVDZlcG80TlNUOXVsa1M4T21rWjlPTzBsN1JQRUNndTNPYzdl?=
 =?utf-8?B?L0F5MFdYVWJYQmRDOUwyblF0cU10c09sM3pXTlFlSFdZQXVRWGxJMEEySG1R?=
 =?utf-8?B?YzkvMllreEFCNEY2K0hYZVE5M1NqOWdPcXBxaW81emNyRHFGcWZSTGdwaEJM?=
 =?utf-8?B?OG14NFdKelAyT1IwVC9nZU96WlVjck5aSWxmOUd3V01YOVB5dG5IR2dSM2lq?=
 =?utf-8?B?Yk95bjJPUm53dG1ORkFnREN6OWZCbWNmZ014RTJVbjBWcy9oTytnWm95REpF?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ceada2-47c6-4560-55a8-08dd0edb21d8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 12:00:48.6218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRpUHA7NJgaf+kIeKgo3ajf9wHIJcD20UHjEL9iymD0LVqHqWkamQ9AyenbT5qQKPabXN4LTuS4inPhWFr4Ab/w4W75lNnMLPkBsI0ctdt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7640
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

On 2024-11-27 at 10:40:04 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_ctx_persistence: Wait for context termination (rev4)
> URL   : https://patchwork.freedesktop.org/series/140582/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8127_BAT -> XEIGTPW_12205_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12205_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12205_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12205_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ctx_persistence@saturated-hostile:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][1] +2 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-vf/igt@gem_ctx_persistence@saturated-hostile.html
>     - bat-lnl-1:          NOTRUN -> [SKIP][2] +2 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-lnl-1/igt@gem_ctx_persistence@saturated-hostile.html
>     - bat-pvc-2:          NOTRUN -> [SKIP][3] +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-pvc-2/igt@gem_ctx_persistence@saturated-hostile.html
>     - bat-bmg-2:          NOTRUN -> [SKIP][4] +2 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-bmg-2/igt@gem_ctx_persistence@saturated-hostile.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
>     - bat-bmg-1:          NOTRUN -> [SKIP][5] +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-bmg-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
>     - bat-adlp-7:         NOTRUN -> [SKIP][6] +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-7/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
>     - bat-lnl-2:          NOTRUN -> [SKIP][7] +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-lnl-2/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
> 
>   * igt@gem_ctx_persistence@smoketest:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][8] +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-dg2-oem2/igt@gem_ctx_persistence@smoketest.html
>     - bat-atsm-2:         NOTRUN -> [SKIP][9] +2 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-atsm-2/igt@gem_ctx_persistence@smoketest.html
> 
>   

These are expected to skip since the tests open i915 instead of XE
(drm_open_driver(DRIVER_INTEL) as opposed to drm_open_driver(DRIVER_XE)).
Note that these tests are artificially added in the HAX patch for
fast-feedback coverage, so this skip won't make its way into upstream.

Thanks
Krzysztof

> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12205_BAT that come from known issues:
> 

(snip)

> Build changes
> -------------
> 
>   * IGT: IGT_8127 -> IGTPW_12205
>   * Linux: xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198 -> xe-2283-441e225c838a29660f3f1c29cc2a617572e63099
> 
>   IGTPW_12205: c5546c541da260ba6ee3559ef1731707d5d5ed84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198
>   xe-2283-441e225c838a29660f3f1c29cc2a617572e63099: 441e225c838a29660f3f1c29cc2a617572e63099
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/index.html
