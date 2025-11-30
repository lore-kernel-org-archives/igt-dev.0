Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A863D111A8
	for <igt-dev@archiver.kernel.org>; Sun, 30 Nov 2025 11:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0A310E256;
	Sun, 30 Nov 2025 11:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrmxqdP6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D9E10E256
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Nov 2025 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764502135; x=1796038135;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jgTKOdwlo+GePUgm5b3kicBq7DRXesaeA45e9LbcBbI=;
 b=VrmxqdP6A43p712TVSU5u5Q6yJq2fXBwVyaBjYGP9wGXy20nvaLpBm4g
 AqBArtidqBs+uc2uY1/NKeVajQWOH8VDfRxMHZ64Bgjjtue5cI0zcEqfy
 8vuuKGHw13vWAaNSU+x7SmwWVyp7SD6PdleOKaSAdOcwiW+c2VGpAheuT
 KV0eDnRV/04pLJ7+/tb0oJrS/RxqdfIL3ca+KYpOb/5AXRq1WO67yX+Kv
 xxdlUPWVHr2Nxhvh7B1wfGw74HV5niqLqHS/jAYfa8sc/1oVhlSp/XRUq
 N4N9zTBHY+h1+PXWrhb6dfIk4MQTFKh/ZCUU6PuBwA42Pn4Fqk4Y0qhNz Q==;
X-CSE-ConnectionGUID: J/iYwbo0Q2Kz1QT8y5rfZw==
X-CSE-MsgGUID: ilWntsVnQRaSsnZ9fNnE/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66171420"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; d="scan'208";a="66171420"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 03:28:55 -0800
X-CSE-ConnectionGUID: keH9Lx3OSTOlIkHUAT77YA==
X-CSE-MsgGUID: STsEoBJeTruu8lsdX/y2NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; d="scan'208";a="193935120"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 03:28:55 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 03:28:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 30 Nov 2025 03:28:53 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 03:28:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8mjQFgJ0p7UT71pymT5lcdNaagjuiIw/iMh7yTv69iPMquKcxxg//wXZ9kZc/ZB7qpGA17tIrUhyBDjodRD8kJBl5MmiKUKkwF+r7GLf7ihfHvJyEmOx7+49O3L+ROzMUP2uWphEP0oOyDWZOXM8Mk5Oe7vy36Ya2uvh6JOj+zVLLwVT/lSSbJEQ1AlJGcVkwTIavcxsIIqLidvUcrsfXMJ0VOZc4Lbj00nQHv3Ia4pYZy40Hx4qM4v6UCU2E2k80FiCXDZl5W8Issc6CztSbY76zrKyDFT/CKn4yLI4jlAh5h270RABVwjioKe7UGu7ZNONzvQaY9A6CFu+mDe3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23sRFzigO5GJZyQmlv3VSwvOEnmrDdvqHYhcsSPAJqc=;
 b=rlJfWwgGsbwtZbdZH8CGcljXIIIebX09kAEYliUS3VOIEilQFX2mhhvbhNG/J4iLtMcrOk3qw2Jg3oUOMY/AbUk7m8dAWlSkPx6OKymEfdYmIx4pvjC6mFcGn5HWHawFWj3rxx2Ywv53jMqCEyklzWUIzQGL4xylgdD12br+nOQH8dexVP4DF8u4r5aCbFKGGoeu8mzDk9pIxK2zLp0zKZ2dfboxUZYkTnAwknbq2edcT8As0WaZgMqwAMrx8T09znvCn3k1FChWyjZVzR92jeordPBgSEOzCsD9/TwnlZH88QI7JHrPwKvA1ANff/JZf99K+JOZgPiSZHQFI38f4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SA3PR11MB7584.namprd11.prod.outlook.com (2603:10b6:806:305::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sun, 30 Nov
 2025 11:28:51 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9366.012; Sun, 30 Nov 2025
 11:28:51 +0000
Message-ID: <ab3b8dca-ee4d-43fc-ae8c-4489c61d1d1b@intel.com>
Date: Sun, 30 Nov 2025 16:58:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_hdr: add FP16 format coverage
Content-Language: en-GB
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>
References: <20250911190030.356543-1-swati2.sharma@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20250911190030.356543-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0263.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::11) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SA3PR11MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 128fc39c-f6ad-4f05-4ac0-08de3003a2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVNkamp2bUxSZ0IvQzNnNlhwVTh5YUxSVExxQlJ2d2ZBd1FWSHpIdU1QZ0Jh?=
 =?utf-8?B?cTdFMnBMZXdnam1pWlFkcFkvUE45SDVmZ1cvQWliT3FXSTJFekpjSHpvblpN?=
 =?utf-8?B?UGRQZ1ZHM2M4MTJwazYvT0w5VHpSR05XQlZlS1BrZlczOUdkc3ZmaFZhTzJj?=
 =?utf-8?B?Zk1CS0dJVkowRkx2cEhPaUQ2TmNJNDhxWUtFeTJjSHFWL2RMTFFDdzJ6WXpi?=
 =?utf-8?B?aFdPOUpRdi9tSG42SlBLZkJod2xJM1FRWks4RERvV3VibWlIM0RSMnFlRDcx?=
 =?utf-8?B?Yk5qWnRFSk5LdmFKTTl3TGJPM2I0NW1VdW9pamh2cEVaWnJmclZMeXRpR0ln?=
 =?utf-8?B?M3dDOW5qYUluL09GVEMxODBlQXFMSEQ4Q3o2MkQrblN0bGMyYWF1cW5QWWNw?=
 =?utf-8?B?NkI2RnhqTlFKZ1JyQUVSY1V6UGxBWmtOUWk1aFN5K0tnRFIvTXFYWnZaWWNo?=
 =?utf-8?B?WFpUQ1Mxb001MkFpaW1VRzAzYTFYQ0taaWVZYmxvalhkaXp2UkpQZFdnaUti?=
 =?utf-8?B?SW1pbm9QYm1JUG04WFRUUlFydlJPWFJBV3ZGUjgyY3pCOXdHYnRTU3ZxMDQ2?=
 =?utf-8?B?VWIwR20zd0RMdDA2ZVR4UFc3eUxUQkFXOUxFR1VjdG9JZUtFaG00UnJsTkh4?=
 =?utf-8?B?VkZkRHVCZ21FM296QXh0c2R1SytiZGxpRUxETXBtNnd1cFpuajl1Rjd6ZVdV?=
 =?utf-8?B?akY3ajFONS9qUWVRT3RBWWhxQ0k0bVNhRDRXN0Vqdjg0RUlsa1k1YUNYTEl1?=
 =?utf-8?B?b2tRZ2xqS1RINUsrbzlpeERSRlNTUjUyOFNtRms3VnFNWlJFYXppdnVNYzRy?=
 =?utf-8?B?UnFhV1lmMDVyMENwVnhXeUJpNmY0L3Z4SGlPRjR1a1I3TW81QkJnaE1leTQ3?=
 =?utf-8?B?SlIyaGMxdS9vVFArTHl3UDhiRWhBMlAvL253Q3I0NWQwem5ITHo3d0RwVSti?=
 =?utf-8?B?TElYRW50YnoydVNoR2d3c0ZNMGNxL0JYaTM4Um1qdGNadUJqaWRVaE5hVjhF?=
 =?utf-8?B?aXBCSzkwKzRLRUhFVVVSRkR4SllZV1h4WDhLTXJoR1F0dnByUEplOTI4cjEv?=
 =?utf-8?B?WVpUbDUrYzFITzZPeWIzSjh1WWxMMXdyR3lCejF6SmY1eFpubTlmSk9kTy9B?=
 =?utf-8?B?bjlYd3VYS3Q3elJlYXVqb1pONGxtK04rWFB3bHBqakFLVDF3VnJwWWdkbmF4?=
 =?utf-8?B?ZDhLLzhWdDc2cEcwS3hPOEY0T0hyRnRoclBqWkZ4bkNYSElnQ2ZBbzFhY0Zt?=
 =?utf-8?B?ZXF5NEJ3V2wrMlBFVmhSMkwxdmVtWm5DdTRadU5SYWFmODVuZEVXeksyZ2Fq?=
 =?utf-8?B?a1ZYNXVmanpzaXNWbWNvbkw1ZDNMZlVpMTh3S093eHFqRFRNRlhyU2RjS3Yw?=
 =?utf-8?B?eUNmRHBPbzYyVGFIeTRzQmZlaXhGNzdacVFKWVFGMHBLN3RLcUE1V1Z3TEFD?=
 =?utf-8?B?MXpJL0Y0OENlZWdHS3psVkhLSEMxWnBlbFp6OXVrSm1paDJ4enVMS1lIdWRN?=
 =?utf-8?B?cGpPQTR5aUo2elN4ZVgreGNxakpKOXpYRWRieUlVc1MwQU1Kamt4U3JIaktP?=
 =?utf-8?B?UVloWUFwNng1d3dZUFZpVVArUUl0VHNrRUNhUG9Db2ZCLzVoZ3VtTnd4QnJW?=
 =?utf-8?B?YWQ3WXdvcG9KcUZ5Szltc3hhcGRHa01RMVRvQjY3UmVwd1JlMG12akJNU2F1?=
 =?utf-8?B?azJwRlU5VmlBOUVHeVhsSnhqNC9LRTg4eUJKWGw3aXJ5TEp6SmpYV2R4d280?=
 =?utf-8?B?Uk56T3A3T1FMNkk3dTlycmdQaW9JVTZwck5IRFkxZEhDbFpqVzgyakpvVm4x?=
 =?utf-8?B?djl5cnFpZndTL0pLakpJVUZXcDVIZ1RZRFNQTmdUWkpENVgzVUFzbzAvQU9o?=
 =?utf-8?B?MzhPT2pJUkJwa0JUNnVKOUNXMXJld1JtQ1pGckR0TmJ5R240elROWnZmZ3NS?=
 =?utf-8?Q?0fxEmwkOS4n5P/FILEfSEjSOcZYqK/zo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVFWZXdCYzQ3SlNjSnc5WjNGWHZ4dHFFN01TSDRHaURFNXRvYjBBMGwrQmRW?=
 =?utf-8?B?b05RSkl1eXBYM1ZjdWIrR2grNUlFNExsQ1ByMENIajhMckNCekhnRU5FRGN0?=
 =?utf-8?B?TWdmMjlKNG4wcHhjb0JlVmJLcUlaTnpySzJNSklsWDlSQ0YyYTVWdVcvalVl?=
 =?utf-8?B?clcvL0Q5cnhmeVBlS2o5NXVNNVVpc1JBQndFb3A4bVFDTTJtc1BOWGZGQjEx?=
 =?utf-8?B?cEl1UmRNSzAra3NCQ2lZNWo4clg2OHpVWEkvRzNTcjlWekZiU2NBVmhTS2Js?=
 =?utf-8?B?S1dVeGYrTy9MdlVBQklJRkxySmFtSUE0Z1Qxb2ZxNExjaVZLd1h4M21nR0g1?=
 =?utf-8?B?WWQ1c2FWNmNwbjRTcGxLT2hyT3kvbysyM2kwS0JvK3U2d1AzSFpBMWlML3F3?=
 =?utf-8?B?aXJmNE9TZDRmTTV0S2U3VDJYdVhBd1RPK0V1aEtrSFBSNGF5d3JUeDVvazJ5?=
 =?utf-8?B?MUhTVzRSUldlVS9KQmJCNDFzVjNQZ2l3b2I2NU5iVnNhOTlmbjFKNjdEc1N5?=
 =?utf-8?B?UEU3WUZkZE9RWGVVOUZTdGRFcGhnOGhkaFZRNmc5Y0VrUklCR0FyUVlZMEIr?=
 =?utf-8?B?THRIRUVGTHFsSitQQ0tyeHNLN1puSThha0MvZGRhS0o3c1pYU2tOTUxRZHVm?=
 =?utf-8?B?ZEVkUDAxN2cwdndVcUVXYlc3clp4VXIrMFNmQ1l5cUpXQlZUWUU5WVRVQVBK?=
 =?utf-8?B?TzdWZitmUkd2NTBWcXllb3ZzS0pwV3p1T0VqVUUzdi9kanhwYjdQaE9zbEUv?=
 =?utf-8?B?MHM3Z2RuMWNYdDlPSWlhUWlXVGppcERIM05FZXB6elZ3RE5oMHA3aWlKSVRa?=
 =?utf-8?B?Y1Q0WmZrYmx2NjhZTU5GUHl6VmlFc0pGR1R3Qy9YSWVNY2ZsdzRreVV3U2pS?=
 =?utf-8?B?UXhZVjA4eE1yWHhKT1NINXdzOU1qaE1nVzBQQUk5ZlVTQ1g5NWVxMStobDBB?=
 =?utf-8?B?TmcyK2Y3elN6Z3JCSzVPZUdLNHZ0TDNEelBneERxb24wbStBbmxHN0tTeWFi?=
 =?utf-8?B?QWpMUVUzcm1UbGJXb3FXMXZ3WlVMZHdFbDl4N01IL3dla2wvalFPT3NpcUhB?=
 =?utf-8?B?YllZQ2FDZEp4V0FUelUxdENBUmNjbVBFL3dWbkc1UXpESGFGOC9WT0xLclZP?=
 =?utf-8?B?ZDN5TTc2NVZWUFk5clY4RjlaRVVOSWdXWVVSbHFlei9VYThDcVdmSUUrS2d3?=
 =?utf-8?B?ODdzdzE0dXoyNWFsVWNaNTJnSXVhcXZuMGZEbkxHVCs2Y2UrVGVpcGs2SVgv?=
 =?utf-8?B?blF2R3U2VldtQi9LQk1YK2RLaHdHVDVlMEdKck94S1N5UkYzdG1JL0N4SjFE?=
 =?utf-8?B?bHBxYVNUdGhMTCtCZlRObkRYVUV4K1pzYmgxaytsUyt0ZWVMbWJiVzgzdzc2?=
 =?utf-8?B?ekpMcDJoakY2RVpsZmQwdHdHUS9GeWZ3TkxKUHZlMEFwc0hUNGNlOHdjek00?=
 =?utf-8?B?MWlmQ2hWOTkrOUIwUG56Z1FhRHc3Y3lDK2ZiQWFzSldla0pnV2VUZGhnNXdz?=
 =?utf-8?B?b1R0ZEY4ZS9xL0NxV09KT1FodnM4dW5lS00zVzI4Vnl5dlBIQW0rdE5Yalo0?=
 =?utf-8?B?V3NCV0E1V0MvZm1CTmtpc3d6TmlvNEFidTB1elBocitIZ3R4MURWMENWNWNT?=
 =?utf-8?B?Y0xTZ1A4M2w3K2hEbXJvV09rZjVIV24rcFUxOFBiRkNRYlBxWEJIK3pkRGQ0?=
 =?utf-8?B?cXlsYlpkQ3B5Sm92Njl0dmJLcWVBbUMra3QvdnJRbVUrQXRGSVBKaUxUOGY3?=
 =?utf-8?B?L3Z1Q3Ezelk2UzdKUE12cmtlU1NXMDBlek9DOFBiaVRzTXN3Nmczald0V05h?=
 =?utf-8?B?cFpjNmVlWitDVURoVDlHNU5vc0tObE9lTUQ4WEpqQ2JXVjNvWXU4M3d2M2cy?=
 =?utf-8?B?QXFkaDlmUjRhRHJnMW96b0N2ZUExcUkzdXlRRzd5V0ptcjhWYjRuYlVuWjVW?=
 =?utf-8?B?R0pWekV4TFhNOGtrOTRLYjdOVWhrU0hzSHZvSEFwVEltN1hOY08rOE5rV21U?=
 =?utf-8?B?bWRnVFExM1QzUTFtaXNOcGR2SnhaRGIyeXpNS0JNOHJURDJDQTg4REhlNUV3?=
 =?utf-8?B?c0xoQlZmRUptWWJaVzM1WHJpRk00QjJyOVhNVFVCWHZ3QmEzdTltUzZLMmw1?=
 =?utf-8?B?ZExDQmxDc0NtQm5xRjNSQVNRZU5WaDZVSWxaQzZRSGh1K0ZGODlVWVVHcTNF?=
 =?utf-8?Q?3qoReY2GarokTkSUf6MTpJY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 128fc39c-f6ad-4f05-4ac0-08de3003a2ed
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2025 11:28:51.3196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEQ1LJvFhhi46bDP94sSv43QJDw7P7BwTZ7VvOqZitV267nIFf6wMq73LueliagZDiIz/3Pz8UhCZeWf4/ddJU7a3zxOEmqkvu7ZtGSbsv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7584
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



On 9/12/2025 12:30 AM, Swati Sharma wrote:
> Extend kms_hdr to exercise FP16 framebuffers in addition to
> 10bpc formats. All HDR metadata, toggle, swap and bpc-switch tests
> now run with both XRGB2101010 and XRGB16161616F. This ensures
> HDR handling paths are validated with half-float surfaces as
> well as packed 10bpc.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_hdr.c | 143 ++++++++++++++++++++++++++----------------------
>   1 file changed, 79 insertions(+), 64 deletions(-)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index efa5964cf..37da709c1 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -88,6 +88,12 @@ enum hdmi_eotf {
>   	HDMI_EOTF_SMPTE_ST2084,
>   };
>   
> +/* HDR test formats: 10bpc + FP16 */
> +static const uint32_t hdr_test_formats[] = {
> +	DRM_FORMAT_XRGB2101010,
> +	DRM_FORMAT_XRGB16161616F,
> +};
> +
>   /* Test flags. */
>   enum {
>   	TEST_NONE = 1 << 0,
> @@ -239,6 +245,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
>   
>   static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
>   				      igt_output_t *output,
> +				      uint32_t format,
>   				      uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
> @@ -248,7 +255,7 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
>   
>   	/* 10-bit formats are slow, so limit the size. */
>   	afb_id = igt_create_fb(data->fd, 512, 512,
> -			       DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR, &afb);
> +			       format, DRM_FORMAT_MOD_LINEAR, &afb);
>   	igt_assert(afb_id);
>   
>   	draw_hdr_pattern(&afb);
> @@ -335,24 +342,28 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   				continue;
>   			}
>   
> -			prepare_test(data, output, pipe);
> +			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
> +				prepare_test(data, output, pipe);
>   
> -			if (is_intel_device(data->fd) &&
> -			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
> -				igt_info("%s: No suitable mode found to use 10 bpc.\n",
> -					 igt_output_name(output));
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						  igt_output_name(output));
>   
> -				test_fini(data);
> -				break;
> -			}
> +					test_fini(data);
> +					break;
> +				}
>   
> -			data->mode = igt_output_get_mode(output);
> -			data->w = data->mode->hdisplay;
> -			data->h = data->mode->vdisplay;
> +				data->mode = igt_output_get_mode(output);
> +				data->w = data->mode->hdisplay;
> +				data->h = data->mode->vdisplay;
>   
> -			igt_dynamic_f("pipe-%s-%s",
> -				      kmstest_pipe_name(pipe), output->name)
> -				test_bpc_switch_on_output(data, pipe, output, flags);
> +				igt_dynamic_f("pipe-%s-%s-%s",
> +					      kmstest_pipe_name(pipe), output->name,
> +					      igt_format_str(hdr_test_formats[i]))
> +					      test_bpc_switch_on_output(data, pipe, output,
> +					      hdr_test_formats[i], flags);
> +			}
>   
>   			/* One pipe is enough */
>   			break;
> @@ -470,7 +481,7 @@ static void adjust_brightness(data_t *data, uint32_t flags)
>   
>   static void test_static_toggle(data_t *data, enum pipe pipe,
>   			       igt_output_t *output,
> -			       uint32_t flags)
> +			       uint32_t format, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
>   	struct hdr_output_metadata hdr;
> @@ -480,7 +491,7 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
>   
>   	/* 10-bit formats are slow, so limit the size. */
>   	afb_id = igt_create_fb(data->fd, 512, 512,
> -			       DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR, &afb);
> +			       format, DRM_FORMAT_MOD_LINEAR, &afb);
>   	igt_assert(afb_id);
>   
>   	draw_hdr_pattern(&afb);
> @@ -581,7 +592,8 @@ static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
>   	meta->hdmi_metadata_type1.max_cll = 0;
>   }
>   
> -static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> +static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output,
> +			     uint32_t format, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_crc_t ref_crc, new_crc;
> @@ -591,7 +603,7 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output,
>   
>   	/* 10-bit formats are slow, so limit the size. */
>   	afb_id = igt_create_fb(data->fd, 512, 512,
> -			       DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR, &afb);
> +			       format, DRM_FORMAT_MOD_LINEAR, &afb);
>   	igt_assert(afb_id);
>   
>   	draw_hdr_pattern(&afb);
> @@ -743,54 +755,57 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				continue;
>   			}
>   
> -			prepare_test(data, output, pipe);
> -
> -			/* Signal HDR requirement via metadata */
> -			fill_hdr_output_metadata_st2048(&hdr);
> -			set_hdr_output_metadata(data, &hdr);
> -			if (igt_display_try_commit2(display, display->is_atomic ?
> -						    COMMIT_ATOMIC : COMMIT_LEGACY)) {
> -				igt_info("%s: Couldn't set HDR metadata\n",
> -					 igt_output_name(output));
> -				test_fini(data);
> -				break;
> -			}
> -
> -			if (is_intel_device(data->fd) &&
> -			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
> -				igt_info("%s: No suitable mode found to use 10 bpc.\n",
> -					 igt_output_name(output));
> +			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
> +				prepare_test(data, output, pipe);
> +
> +				/* Signal HDR requirement via metadata */
> +				fill_hdr_output_metadata_st2048(&hdr);
> +				set_hdr_output_metadata(data, &hdr);
> +				if (igt_display_try_commit2(display, display->is_atomic ?
> +							    COMMIT_ATOMIC : COMMIT_LEGACY)) {
> +					igt_info("%s: Couldn't set HDR metadata\n",
> +						  igt_output_name(output));
> +					test_fini(data);
> +					break;
> +				}
>   
> -				test_fini(data);
> -				break;
> -			}
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						  igt_output_name(output));
>   
> -			if (igt_is_dsc_enabled(data->fd, output->name))
> -				flags |= TEST_NEEDS_DSC;
> -			else
> -				flags &= ~TEST_NEEDS_DSC;
> -
> -			set_hdr_output_metadata(data, NULL);
> -			igt_display_commit2(display, display->is_atomic ?
> -					    COMMIT_ATOMIC : COMMIT_LEGACY);
> -
> -			data->mode = igt_output_get_mode(output);
> -			data->w = data->mode->hdisplay;
> -			data->h = data->mode->vdisplay;
> -
> -			igt_dynamic_f("pipe-%s-%s",
> -				      kmstest_pipe_name(pipe), output->name) {
> -				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
> -					     TEST_INVALID_HDR | TEST_BRIGHTNESS))
> -					test_static_toggle(data, pipe, output, flags);
> -				if (flags & TEST_SWAP)
> -					test_static_swap(data, pipe, output, flags);
> -				if (flags & TEST_INVALID_METADATA_SIZES)
> -					test_invalid_metadata_sizes(data, output);
> +					test_fini(data);
> +					break;
> +				}
> +
> +				if (igt_is_dsc_enabled(data->fd, output->name))
> +					flags |= TEST_NEEDS_DSC;
> +				else
> +					flags &= ~TEST_NEEDS_DSC;
> +
> +				set_hdr_output_metadata(data, NULL);
> +				igt_display_commit2(display, display->is_atomic ?
> +						    COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +				data->mode = igt_output_get_mode(output);
> +				data->w = data->mode->hdisplay;
> +				data->h = data->mode->vdisplay;
> +
> +				igt_dynamic_f("pipe-%s-%s-%s",
> +					       kmstest_pipe_name(pipe), output->name,
> +					       igt_format_str(hdr_test_formats[i])) {
> +					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
> +						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
> +						test_static_toggle(data, pipe, output, hdr_test_formats[i], flags);
> +					if (flags & TEST_SWAP)
> +						test_static_swap(data, pipe, output, hdr_test_formats[i], flags);
> +					if (flags & TEST_INVALID_METADATA_SIZES)
> +						test_invalid_metadata_sizes(data, output);
> +				}
> +
> +				/* One pipe is enough */
> +					break;

This needs to move out from this code block otherwise we are effectively 
only running for i = 0.

With that fixed.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

>   			}
> -
> -			/* One pipe is enough */
> -			break;
>   		}
>   	}
>   }

