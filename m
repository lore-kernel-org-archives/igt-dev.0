Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F189CD58D69
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 17:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD7610E6CA;
	Mon, 25 Nov 2024 17:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeZDF6Mn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22ADD10E6CA
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 17:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732554806; x=1764090806;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P4wVH2kMPPHq5YS90JQteNcH3xbaW3V1dn1glFj/5Io=;
 b=jeZDF6MnUEQCm2LBEScBgcjHYe7pDf6bneTjYx2v8Zo8lo+yl24gvc26
 EefBhOvYa3xgpQG9VW9VFOgazB5KpdbuEnszJsLKkV+kuxzhqlhp3BAQI
 jo2/2z+h7HUzUDXqAAZqqFBl2Y2z+eGkt/FmmboqBCYnLuHWytFkJ3Irp
 LnVYLrygCeOJWWV4ukurzmo6DZsysqrZRI+g+kRsH8zu7fm2Ems+vVSjr
 mPmntXi4KcHEu95vcjNg08skb9cCaSrCocUxcOZ2YMdgSCYUVzUg3oUin
 aVlsFjm0yBdEIIeCTwARfRq9yEtrvs9bH98Ar71VHTfJ9wN5Uag/1RIfv A==;
X-CSE-ConnectionGUID: NQ0580TNRdWHBAZerj+PKQ==
X-CSE-MsgGUID: tpn2Vm2gQE+CjQnZP49HnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="55178610"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="55178610"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 09:13:25 -0800
X-CSE-ConnectionGUID: QzgdxR9URe+oJ7nOvwsGFQ==
X-CSE-MsgGUID: nYoZfjg9SfafXU7s0ZR4vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="92133747"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 09:13:25 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 09:13:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 09:13:24 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 09:13:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFdnKo3XdTKXd4aWQ2RZmcEwV9FImiLdcZVqPIPh71d+/nLmoH8WhyoSf1GOnqduN6bhPz0tblClR/a6+wELN6mhn3St3pU+GJiRZc0Vup9PRPivp334ftREJcXHaIGfYaRjKio1gMKw2OVIvcpeNZnMg+PTnpSov/65/UOivfbhLsnIW4fFkJbPMbvTqj3pqDDX+dk2evuipz+H1d8/0Fc0OpfexjCA841DpI1IvsF19sFXj29oiSAXT0fm3J+DBNW3nhx3otD/bytY8tw0WOzX4jOUdLiYK91q5BiYoDqjq5QpZDEmIenv4VsD5qU90GlnccvU8Mu/UcNUDovCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3m+Z7/Q98PuAscQMexJH31HGGtSxTXJAG48pQ/+wQE=;
 b=AiH8enRtIWo8LnAFWvayXalK0m9v/94Y+zr+I95W9ZAQDKhpzVOnLZrL4BtRjR5DLy8KZJkUeJFRPXwoE8HwzQothyva/yhmfeXAR1ZAKN5AaLY/uZYzwbe/dOba5+sU1+4pdDV0rmDLPiP/SrQb8+OEDGyylHNO6bLA1MQnOHywQsYWiYAy8c81N5heTzyLRUr3tRN9DbTiP30IZT2WtudF2mWgJx5V7q6ElAZQcbMwZ+LtyfcSPgLcSe1pC1TK7GstZD3eV/AsRLaQqvGr6ZUKBXVbwCG3j2GjCyXOLVDH1XUH3t7NT/2Tl/W4d8iHAMRQvKW6uWb2PftJ/xt6hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by SA1PR11MB6846.namprd11.prod.outlook.com (2603:10b6:806:2b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 17:13:17 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%5]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 17:13:17 +0000
Message-ID: <e2ac7519-ceba-4152-acb2-6863139abc10@intel.com>
Date: Mon, 25 Nov 2024 18:13:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] lib/gpgpu_shader: simplify load/store shaders and
 add Xe3 support
To: <igt-dev@lists.freedesktop.org>
CC: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Christoph Manszewski
 <christoph.manszewski@intel.com>
References: <20241125-gpgpu_send_rework-v5-0-4454df13e1e1@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241125-gpgpu_send_rework-v5-0-4454df13e1e1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::11) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|SA1PR11MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a035b7b-5cfc-4d28-80d7-08dd0d7473c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjlrRDhqekdCckpFV0VIU08xTW9yd2hpK1dlTy9TMEg1ZnZ2Qm1XMkdnLzJs?=
 =?utf-8?B?aW1FdkVSQjRNZS9jN0h0MjhGSmszSUVMVWlLT3piYUp5SjZsOFpQTmp4UTFO?=
 =?utf-8?B?dHJLRU9mT2ZHSWkwWmszUUJ3NzZyTk9LTGN3NVdBWHdiWU15TGs5aXhzUmNF?=
 =?utf-8?B?OHFWTEQ3YjBSa0tlRXQ2U2hKNGs2UThJUHpLUlVUVEV5eTdzNVJzYmk3anU1?=
 =?utf-8?B?MW5nWU9GVkovQnZycVJYeWUxTHZZNTh5TWwyaUJYR21TQ1VNUFlESlpDbmlX?=
 =?utf-8?B?aEhDZ0JqTVkwWHJqai9oZmxSMGppeVdDM0Q1WFpoSGpTc0F2Y1FzV1lIbUkr?=
 =?utf-8?B?bFAzQ0FRSXMzZDMzeGRUbWJUMUwvajNTRVdpYi9lVkQwYUlUa20vRE9rWGNW?=
 =?utf-8?B?VjJBMkFhTXl0cXF6QkJPUzNTbzVTVlc1dlJpQlU1cGFHbFMvRVZhYzhEUTAy?=
 =?utf-8?B?K2thaTB1VzVETU15MEFxNXpXYTQxbVk0dmlWdU8vNnVzTDB0YUtPWURhaGFG?=
 =?utf-8?B?NjFFV0tTOFNWd2I3QzM5ZGVMWFpzOTVtOVBLQUJPUDh4VjFBVnJsY1JHdndz?=
 =?utf-8?B?RTByNVhLT0RjYUM5QnJ5ekxxWDZrdFEvOWg1VEwrd2hkUy81Q3hPc3ExZ1Fo?=
 =?utf-8?B?bUNJR3R5V2ZINHB1SXRZVUpMRjQwSDc4TWFEdWVSZU9hbTd6U1ZwWVZhelg2?=
 =?utf-8?B?bmxtYUZ5d3lCVUdETGJ2NnUxaUVJRkJvWXYyekpLWlo0bE9reWxjYjVIVzlX?=
 =?utf-8?B?dU5YamljaFcvekFwdFNvajVrc0JNYi9xZDlNVW45OGdGb0dCK1F5YzV5TXkr?=
 =?utf-8?B?eVZRZTJvSXJpcjJZRkgvc0k5KzZkRy8rTVZxd01NY2FFWnlVMGRXM0g0cSt5?=
 =?utf-8?B?SmxvWXBZWVlvQ25oRDdhY3g5d1RjRDdiMElvVkNYNlBxYXJ0ZUZsd3N5OUR4?=
 =?utf-8?B?RDZ5QmhUNG43STVRYnZHam53OTV2WUoyNTcyMEdwak5SQmNiMjg4V1E4ZnVv?=
 =?utf-8?B?MC9xT0JwZTN1Ulp0SGx6Ry9UWW1mVm83cks2TThIYnE4LzhqNDNETXRtQ200?=
 =?utf-8?B?RWxKUi9DejNqVHJBa2l5L1JpaFdOelEvSExCWCtWblhYcks5YnBCNG9vRnEx?=
 =?utf-8?B?ZnExalpLREpPREtFQkRsZk5mQ3NNaHJoNks2bEYrRmhkVm9Id0tuNnkvNW5v?=
 =?utf-8?B?K3IySmdHWTlOd0FIU1pxMlN2ZXR6TFBsUDVRLzVrOHQ3cDVwZmoycklSVkZr?=
 =?utf-8?B?d0tpVmNYZXRKVVRmZEkxZkw0aVVtL3NteXFpZlFPZW9nQVRObzNpMmVmTndF?=
 =?utf-8?B?Q0REVDBoWkNSYmwvMDNtaEtDWkc2cXZUKzVlUTNDUnJxZU9zaEFsbWZRUzlp?=
 =?utf-8?B?cFVoKzFTdklLbTJoOWZ1S3ZHZ1Q2LzZJeThiYnFaVkVYWTFDejRGZ1JUVXVK?=
 =?utf-8?B?NUZMYnFFRzgyRmZZUk83RCtWTlhhK3M3RWFsY21WMGtWZHl2ZmduZUNCa01v?=
 =?utf-8?B?T0Q0ampySVkyYXBEUjd1eEE2QzVyZTVkMTFZVEFBOWI1cmg1c1g1Zzl2aTVi?=
 =?utf-8?B?cjNoQlBiOWpSOVdPQnFOSzlyQ09HMzQrQkl1ZUt5NTNxcVdLaE55Y3VlaEov?=
 =?utf-8?B?THFVSnRMUUMwUXZsdTMrUVczMlVIU1NSRUNPR2RyQklTdllicVl6MEMydE1H?=
 =?utf-8?B?SEV0b2lYK2JtSUpkQ1FTMGlvajIzM2QrcXU4RGRDY3dDbklDOWZnSmtTWXFM?=
 =?utf-8?Q?Vee9ObvIsmRlhBXX3ENP+oYQMXs8ISbFOO8eh5U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clBrcy9hUkQ3dHBmaVY4c05SS01oQWFiMHg4MEVKYSt6eTkzWGxwWkYxWlZS?=
 =?utf-8?B?YWdCS3I1L2V4QURYV2l1aFBhTzhkSlpzQ1JsUjI1ZUpiam03QzAwQ1ZYcU5z?=
 =?utf-8?B?SXBtME8vdzBRR0tVRnJvM3YvV1M0Mkkwbm4yNUVXcitmcG95dXdvQWRVNnFC?=
 =?utf-8?B?ZmVZdUdYUTUxZjNaVXl2Znd1R2xOeVgxS1EvUXRwTUxxVnQyWVdodmJJeTU5?=
 =?utf-8?B?SmNYY1ZCSTZzd3ZuS1NybWxMd1JtelBaZDRWMmJoQnJBMll5QmlKOFlhcDRE?=
 =?utf-8?B?d0VRQmdmTXBWS0ZaMTVZYkY0Qk5KaDFIOVppSG0vVnpMem5jTEpHTFl4VEhl?=
 =?utf-8?B?TUFoNXNwV2picVN5TGJ2cjlDeEp1Z3pGNTFPS2VtcTdXRGxLRlc2S0F1YURM?=
 =?utf-8?B?djQ3UnRZSm1hRzlKUE1HQ3gzY1ZTdlBiaHFlUjBoR2lNWWJCSnZ5cG1iMzdz?=
 =?utf-8?B?QWZQRGlsMzhnNW9BcEZ5d0F1ZDVDMDhjVSs5NkdBQzdrWHg0QjBxK1doQ3kr?=
 =?utf-8?B?REdJS1pvWG5iOFE2T0RVWnhDV2VWMU5NUUpPMkJyTHVnQU1OREhoSmhGQmZN?=
 =?utf-8?B?YjlMbVhxSDlhbis4dGZySkZNUFRLVjdLTFJwOURuVWNpT1haT3BDVGdmb1Fv?=
 =?utf-8?B?bFViMUpreXFxSlFoTkRTN3Y0WjVwQ0tOM2JZVkh2L3d2RnFLSVA3eVRvbmhr?=
 =?utf-8?B?ZUwvTlNuOWxXRDNYYkJVN28wakh4TnVVNXVPUEF5bGJqVkRnbWNGeG84TlIx?=
 =?utf-8?B?a1BSZ3E1UzQ3bFZ0bllFWFo0d0hBWW1qMzFDOVJDUjVGb1d4dHdaOUpHQW8w?=
 =?utf-8?B?YmwrYnRTNXRvN1RHTytYQVVVSEFnQkxlUG5mSGlvbnhXaWNHQ2I3VjZYOXdI?=
 =?utf-8?B?bEJybEFnUktFajlTTGM2ZlZQUXFjbzNDbjcyYUZmOUFBT2lTdUJlWTRGbEZv?=
 =?utf-8?B?WW5WV0I0TFlNYWU0QUdJQ2JqdkIzOTdNbkhOazIrUmw5TlVqSWlsbkd5RmJs?=
 =?utf-8?B?S1ZVcWgvNDQ3aklYTEJET0h1cTYyc00wbXN3S1RrRWZsLzBjVmdZbGN6UFZK?=
 =?utf-8?B?bU9QU0M4Qk40V0QwVDhKQ3VxZXpJWG5UbXRYbkgyMm9xY1lBU3o5cjZ4ckFN?=
 =?utf-8?B?d2Y2ZHVGYjE3aWRucVRWc1NELzlIV3lRTW1xTitNOSt2WHJHaWcrczhCdXhm?=
 =?utf-8?B?bVYwSXJLUWY3V3N1WVpCaVptT3pHbVF3YzF1WmM1Z2hYeC80VkJTWE55OUtp?=
 =?utf-8?B?Rmw1N2VnSFVCZlZoRitTeThEK1EycENuQ3N5SldMeFFCcjdoQjF5Zy8yRzNw?=
 =?utf-8?B?aFFCNTR2Q2FOR0lydGdpOTRUS2tKQ0x3K0ROVnRIUWZqQVFiUjFKTkw0eHR2?=
 =?utf-8?B?R2pYUmRzMGx2aWdJcjJ6Q2x5cEtpQW8xcUtnRzhvZytDTW9TNmRMUGgvb1hL?=
 =?utf-8?B?SW5vSUVXcURySWxMbXFIbHp5OTB5TEJlWTNNMmNDVG5WbURGdTRwcmxpeElh?=
 =?utf-8?B?aGNPTWExcDFXNk00VkxKVjlrb2hpYVNVbHpvbEJhKzZ5dUhHaWlSckFxOUFP?=
 =?utf-8?B?VHZJTDFzTDkzRjFwRnBiVENXVERaVFBDNHg3ZFkvaG9zUU15L1FJRWRwWVJn?=
 =?utf-8?B?WUZvRHQwZW5DOTRHYkFiQ2cwQ1Z0QTlsd2lvYjZXdFJQWG1oVlVnT1ZrS3hh?=
 =?utf-8?B?RkdncWFyUjRudldsMXJRYnhia0lNLzM2dlZVNzdadC9pRWZucUNDSTV2UVFa?=
 =?utf-8?B?V0J3WnJHNUVFSERSMFVKRUlPUE9OVjdVUm85Q0hkOFByeXlHWlZScjY4V2hR?=
 =?utf-8?B?VWsySW5TS2hheUZORVdsaE9PZEVWYldiVXhQbm9SOW52Mmxzb09jMTZCeFQv?=
 =?utf-8?B?UVZuK0xja0txRldhMXI5T3V3K3VoL2I0K1duSUt3cldLOTJRdHV4QWU5ZFpG?=
 =?utf-8?B?NkJpdmV1cnhRQUlGYTZLZXFoTnR4aUQrdGkwdFVPRWRDYk1JdHY4MWpYY05I?=
 =?utf-8?B?VFBGc0NkcCtPQ1lTMWRrVXV1OVg0WDUvMXROZHVQVlRpRkI2UmkvQTBnMS9S?=
 =?utf-8?B?VkgvNmlHc3VkYVd4KzhkYUZpcVJGenhIZTNLUXRjM3JPWFFySE1ydW12U3d5?=
 =?utf-8?B?bjFSazF5QWFFSXVFMFQvcW9OeTVlYnFUV2ZMMVp4VFZaK2hmMTFQdmpFOXhD?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a035b7b-5cfc-4d28-80d7-08dd0d7473c6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:13:16.8998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7ZrjU3duY4I++T799+8NOX0FkohXB/zx536dr80BeeGjmQlt4ff0mVLtBZu/w7gN/ClSitu/OSozSB2UOTtbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6846
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


W dniu 25.11.2024 o 15:32, Andrzej Hajda pisze:
> The patchset tries to simplify and unify iga64 load/store assemblies.
> Moreover it adds support for Xe3 platforms (PTL).
>
> v2:
>    - addressed comments to v1, details in patches
> v3:
>    - added passing surface descriptor via COMPUTE_WALKER/inline_data,
>      required for stateless load/stores in Xe3.
>    - added support for Xe3 platforms.
> v4:
>    - fixed placement of gpgpu_alloc_gpu_addr changes(Dominik),
>    - pass vm_id in gpgpu_alloc_gpu_addr (Dominik),
>    - added R-B
> v5:
>    - updated comment in the last patch (Dominik),
>    - removed extra lines (Dominik)
>    - added R-B,
>    - rebased
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
> - Link to v1: https://lore.kernel.org/r/20241114-gpgpu_send_rework-v1-0-e0914e09e7b2@intel.com
> - Link to v2: https://lore.kernel.org/r/20241115-gpgpu_send_rework-v2-0-d1c84135aaaf@intel.com
> - Link to v3: https://lore.kernel.org/r/20241121-gpgpu_send_rework-v3-0-0b6aa48ab006@intel.com
> - Link to v4: https://lore.kernel.org/r/20241125-gpgpu_send_rework-v4-0-c16b568a1f3d@intel.com


Merged.

Thx for reviews.

Andrzej


>
> ---
> Andrzej Hajda (4):
>        scripts/generate_iga64_codes: add iga64_macros.h to checksum calculation
>        lib/gpgpu_shader: simplify load/store shaders
>        lib/gpgpu_shader: pass surface desription to shaders via inline data
>        lib/gpgpu_shader: add support for Xe3 platforms
>
>   lib/gpgpu_shader.c           | 188 +++++++------------------
>   lib/iga64_generated_codes.c  | 329 +++++++++++++++++++++----------------------
>   lib/iga64_macros.h           |  72 +++++++++-
>   lib/meson.build              |   1 +
>   scripts/generate_iga64_codes |   2 +-
>   5 files changed, 280 insertions(+), 312 deletions(-)
> ---
> base-commit: 027caf37991f4d39cb41beaf82dc7c920d976db6
> change-id: 20241106-gpgpu_send_rework-817a3e4f464e
>
> Best regards,
