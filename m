Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283FACDD1CD
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 18:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8564610E0F6;
	Fri, 27 Sep 2024 18:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Luo3bjpl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C46510E0F6
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 18:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727460202; x=1758996202;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=B8NBjXYuTb4yWtzaaoRzhFbqsHcAQJDg9ZR2J9jONzA=;
 b=Luo3bjplF6of0ACWHpWTu9FFy6PmXaMA+ULRvg+fFq3a9xxhyUN4A5pN
 L7UNa/t1PckBPqmakYPmditlobmsC7B3SBeaIyZw1BxX9YztK7hHptys3
 j/nFjsOt9rkcikTCNv/+y56b83a3a9eJ1UzmABlbdd5JM1OYkzsgmsd1Y
 k9yZUeTvmOPwHztjwlGWDfQbzza6GXQTS8BJ737tkKdvNBLvUyELtvtBq
 FPVyn/P5xs8g3rf2MXkHVyXthPREJJ/fnoTiGnnrWZR4nW+eD3nCXYUIL
 oG4Aav0zL1zqXFyIAOWgy1p0kdlZHBjwSX7/raJ122zAzTPKRrH4lx/jr w==;
X-CSE-ConnectionGUID: Zzqjtx9XTY6E8LnvXtQUKg==
X-CSE-MsgGUID: b5sw2qOtRcOv0TelOcyV1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26125422"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208,217";a="26125422"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 11:03:21 -0700
X-CSE-ConnectionGUID: wuAOqmRySD6O2j7Ey3PEyg==
X-CSE-MsgGUID: 7Wzp3cJ0SfqTETt5NMneUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208,217";a="72491895"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 11:03:15 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 11:03:10 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 11:03:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 11:03:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 11:03:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAq5CTWrprBDGDvzbg/dxAWDS+DAZ7cbGogYvmi3gDexirHcItrPAnT3oljIsmWPJtd4U+uNkH4wB2tGK0n4epcuFfQU9XRBmOJnqKjeXeys2RUvbPmukMvNFna1VWeNqW4GbiwoojR9vkQ2+FWq2YPQq5DkPiso1nV2KCA1rGiJCgKb011crTS21wUDR9re7QA4QR67XXi1lkSoekzl6+o+KRDj+jQMXSd3SSsvqukSlJmjuoAlLTCjwt8OXif8WWnXbkH2++O4hAywJtuEbyOSyXYJuwMm6Mj+8/69i8ZeasBJPQSnsT6TGZChqD0FcO//dQQGpDpPsirAfaqYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTUzaUP4CUFu8j8Pzgyh6kzuDqjGAh5UULIicoAN9MY=;
 b=T009QF2lN3Ue4Fl3cOKmrfq4WvOrN1kNm7b1V69bwGKm1OZepoR2PHul38uB3Z9CeSlDxzsMTwmMCB7rKtdW+VLMo4tn0oFpHgP7ibTUDXD2FOl6+HvvrKQijG8FwvGxHnznSm/rMZSMW9VeXbhaMW7NeSTZ3PyMDOCBFDvuJ59pzLTc6EtWRh2UJrdOS5lcyXgbFczsJ08QQaEzwxa+TTh1v/oPQmhVymU/N/SV+LZS/h1ZnjDuDS3BwzDQGv63VKR1tgxEp1ytQ3V8HpIEpYy1vCozP/gHtnujpSI5tEMVDQAovCZUxJSuj9kwjEGiJStDL+20fdWE/M1HDr9pmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 27 Sep
 2024 18:03:00 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%7]) with mapi id 15.20.8005.021; Fri, 27 Sep 2024
 18:03:00 +0000
Content-Type: multipart/alternative;
 boundary="------------5SxWKw03ibhcE6QMsMNT5T0e"
Message-ID: <d39e6255-105b-4dbf-8163-c313dddacb8f@intel.com>
Date: Fri, 27 Sep 2024 11:02:58 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBDSS54ZUJBVDogZmFpbHVyZSBmb3IgdGVzdHMveGVfZ3Rf?=
 =?UTF-8?Q?freq=3A_Use_sync_reset?=
To: <igt-dev@lists.freedesktop.org>
References: <20240925220923.2030384-1-vinay.belgaumkar@intel.com>
 <172734610085.1106295.17953114100289877483@2413ebb6fbb6>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <172734610085.1106295.17953114100289877483@2413ebb6fbb6>
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CH3PR11MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f9ae115-6c1d-4e0c-b655-08dcdf1e9fff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0hFajViMlk1YlVsYzZ2OUV3RFdOczEzQjlLOFRibDJBUnlwdTcwR0ZVWUFJ?=
 =?utf-8?B?QVRJNjd5QmpvTGFMejVEWGNtdlFzZGNMcnFyM09pbGJ2dWZPOTRrcVlrWHQ0?=
 =?utf-8?B?MG51NEhZWDJBUjFqc0pxZmd6RnZBK0FpODd2YmFLS3BzTFE4cEdFc1FKRTdw?=
 =?utf-8?B?SlhhcytqQ3h6KzByT2J0MmxGeSthMVl6NUgycEVCQS9KZUFEVFRMNjYxektR?=
 =?utf-8?B?d1RnMWFUU0JTMXg1S3ZFYnE3aEhyWjdJSHZrQ1c2bDR3ZGZyU1lGcW1pYlo5?=
 =?utf-8?B?cnJQSEUxeCtRcmwzaDR5V3RIMTZFblFEbGZBejVGYXNXdWlQU3JtSkVCSng0?=
 =?utf-8?B?OXlTOUFyMG1ON2tHMG5QbldvUVBhSExQRUxmTzZ3TGE3Y1VwV0ZWN3NnQ0F2?=
 =?utf-8?B?QmZzTDdBWm0xZSsxa2t5QVVuMWppZ3EvdEVGaHkyQi96NWJpaVduYVYzMFdY?=
 =?utf-8?B?MFZWOHpPSTd4ZVM2aE5vVDVYMHg0TXdWQm1iMVYvdmR5Njg0M2pyOU5rY3pE?=
 =?utf-8?B?N3pMYUdiOTB4THpXSFk3MHBHd05UcEJGSm9YNCtqajl6YzAvYTRQdldOK21q?=
 =?utf-8?B?S2pPV0NnL0VacU9wUXJ2dGpNb1YzNjVUem5IaUptbmFhWHJPeEFsK0NRQk03?=
 =?utf-8?B?VDlCcVZCc01yNWpLS1BweDNkNy9IZXFvNGdxQ3Jjd3RDYU9FOUpBTkhqTy83?=
 =?utf-8?B?SXBhd3QycVc5Q1E0dWhGbGxWNUo5cVFEUUVYWVJ0dkZoaDRqZ2NSdkNod3R4?=
 =?utf-8?B?Y1RaVkhEOVQreEtleVQvYy93MTl3WGoyR25ORTlzOGRJS1dGYTJRWDFZNXRZ?=
 =?utf-8?B?NEY1UTdQNVE3djVuUVlVQS91NjNvSVBLQXpSdXBwUVhMSTh6UUJjb1N1Q0lD?=
 =?utf-8?B?UVV5eWE2aHZTVTMvUUUzQzJtejJyZWJaa2tSY3RFMndTcThuWi8rcWViTW9q?=
 =?utf-8?B?RE1WcGpYWU8wUEFHbHdsYzBXdEFDWDVIQVFYRDY0R3M0L2xvYS9DZDBMN1FD?=
 =?utf-8?B?NSszMlNidjVtZWhSQjNuOWwzUkdRbCtMQ3lhSGpCdU96eWxoNUh3TktKdnh5?=
 =?utf-8?B?OXVrNU45Z2ovVTRUMzUraWJIVVQvRVlQd0tTcC9lMW1CdUJ1c3lXcFFWQnFv?=
 =?utf-8?B?a0w2Z1IzYUUyRm5yd0laQWg5aER3cnJWMU1xa1M5Qlg0NmFoUGpLZlh5bUxS?=
 =?utf-8?B?SmxqalFSbGV3elJLViszWndYWE5rUmNkeUw4U1RoeXZ6RVQ0RVo4N0FiREZv?=
 =?utf-8?B?c2IzSy9pMEtKYUpsRWhwcVVsTFRTeUZyNHVPVjZzODNuKy9TOEZMdmFIQ01V?=
 =?utf-8?B?eGdaZFRTMDROa2xhR000VFh0M2NqTTFBNjNIR1k5d0IxSkhFWlJtdHA4Zmxv?=
 =?utf-8?B?eDhQckxWQ2ZpMGtvNTdObWdEWFF6R082S3IyaENBSnREbHljOU84aUJTNkt2?=
 =?utf-8?B?U2d1RjV4Y1dPeXE3c1VCRngvTVNUbXlXcnJaZm9kRTFkN1FJN3p5QTZRUjJR?=
 =?utf-8?B?d3lPWWFMWUtNeVEwVW53bEZTa29jVXllakV4TGZXUnUyaGV5MjM5a0dyd1FM?=
 =?utf-8?B?RlFvWjZ0RUlTeC9STXJLdlhnZXJDZ3hvUW5BNjdoUVBXRHJTeW5UbTd2aG1G?=
 =?utf-8?Q?dfMOk4C7okTH0m8Lzx3AfsJ+K2jUikc5HB7IEXrUiFGg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVc5bUxnLzVKcjZMdnZrY0traTk4OFozUU5ZU1FMYkdpdEhxbVhPN0xHNG1s?=
 =?utf-8?B?SWpyNkFlU2ZESWIyOGV5ekc2bVVUUVA5Q3hUUCtvVXBLenBHY2QzWlZ0bmlZ?=
 =?utf-8?B?K1p1K21MTW5oS1FFTjZZMG9oL2hEUHkwVnNKdlZWZUI5eXlGY2ZKSytFTGZz?=
 =?utf-8?B?dVhzYXpRUmI3MDF5Rnl2S3l2YmgvdWNHbTRNYXJRVDFBdkZtVlQvQmsvNFRa?=
 =?utf-8?B?SU84Nyt0TTNyUVZsODVxaXVwdWVWOWR6SmlRZlplV2RnRlpoNXJtbzBZWkxL?=
 =?utf-8?B?WDF2U2FKaUoydUZLZ0R3MDJXd0p0WTV2Qmg4azk5RThPWW8wbzVZb0ZNZVQ4?=
 =?utf-8?B?Y3pUZHN5V0p3VTJhc2ltWXNoMzNEanZkWkx4bEh1Q004VnRyMW9pWnR6cHRu?=
 =?utf-8?B?QjhCSWRpQXFXV0dHcThRNUZJbGxKV2E4VTVNd1pTZk51N2NqTEZYMkJ4elFv?=
 =?utf-8?B?N2xOMVo3aWREYk11dDJQNDQ0TXRxSHNYY3VYL3lVelBHZ0hxSzNaMUNPTXZ2?=
 =?utf-8?B?dFlEZTdTTTRLL1FKZnlrK1ZVNC9NdFVZTUxUeVB3N01DRG5TUVpkWXdRb0Jr?=
 =?utf-8?B?bDVpRk1CV3gxbWlFK1RDL1RRSHlRRDIwdjhtdjErSFl2ZDlsWHU2ajJUY2g2?=
 =?utf-8?B?SEJIcmNtK080SG5SOThybnA5ZXZIKytoSGdrdDhNVVVkSmQ5OEZwc1hEYnBG?=
 =?utf-8?B?amVidW5ESGUxR05pcTNrcmxCNEQ2bVJlN2l6OVdZWVBmNk1DNUtZUVgxZ1Ay?=
 =?utf-8?B?WnFIUTNHd015TS9kdDdGKzNJMFVjVTE3dGFBNTQyaWJPWU9TblNxK3h2WGhO?=
 =?utf-8?B?Zm85UW1zVzdJZVArSnJDS201WGJaSHJVaFJJYXpmbnltRDZra2N2V3pwTW41?=
 =?utf-8?B?bU5MSGlKVUhCQ1NEOVk2cUZDd1hUWXltYi95Z3RaZHlGeWtBWXM4UW43T3U2?=
 =?utf-8?B?ZHBYVFJPNEViZWFGR2JUb0pxVXUwR0NaRlFxMHkzQjNmR2J6U1M3bFNSaXE1?=
 =?utf-8?B?TFJZV3ZGMko2S2RnTHJGeDgxcjQydC9Vd2o1QzBKZzFXM2dVYkZ4SytrdERi?=
 =?utf-8?B?cjZyKzRQajd6S2hMRjJPOG9aMWIwdXZ4ZHV6N3p6SmsxTFRiVnp6U2ZFOUxY?=
 =?utf-8?B?Y3d4Vk5rSFNYVUZpTTJYMlh0TjhKcU90Yk1tbC9mUDFqMWpjbitJM0Q0UFpi?=
 =?utf-8?B?dVJkMW9EOHFxbW41dnJBd1VHcGkvUXBwWTN1MGNvbW1PVUk1UEE1YzRjdlBt?=
 =?utf-8?B?OG0zeG1jUk5qc2JNSVc4U1dPVVRvNHRlN0JLS3lyajIvKzl6ODFsc0p3ZXh6?=
 =?utf-8?B?cjAzNlp6endIcTNWZG9YUjU3bk8vUVNjS0ozQzNIeHZrL3Jac29RZDRpT3lR?=
 =?utf-8?B?eUltZVZKbjhTVE9Dc3hjall5ZWk4RmhzR1JvdW9KYU84SHZBamFMMW9TZ2Rx?=
 =?utf-8?B?LzlBN1E5WnN5amtNMDdZeDFZVWRDMmpHN2c5OWYvODMzT1c4VkEveWVsUHNv?=
 =?utf-8?B?bmduaFQ2SHljQXVtMXA4K0tmbnAxc2hFVWI1c1VZTTRCQm8rd0trM09sMWpE?=
 =?utf-8?B?bGt0NXdyNkN6UisrRWkwYS9LWGpXVXFZSVlpQjdaZ3JMbUt6MlVvZHkzMjk0?=
 =?utf-8?B?UXhKaStRdUxpRzJPd0VWVVFZc2Y4MS9uYUNYcTRlcG1XUVVsSmU5WENFUWF5?=
 =?utf-8?B?OGNYOUdXcnpoYVdqOXc1cUJJc1BvTUJqVkxrMXE1c3ViT09XYTlYRDQ5WndB?=
 =?utf-8?B?dnprZzR1dWZqQ2UxTUh6UnNYaUxBUHA3eEtUUHQ2aTB6QWt0d0pPaExHbnRE?=
 =?utf-8?B?cmlPdVJ2Y0RGOXZXZmRBbDQ4YXdMNU1kK2QzMXM5TmJsMjRwQysxM0Uxc1l2?=
 =?utf-8?B?Mkh1YUtGMHhRV2pTOTBoZC8zSDZZaldkN2NUNXBSR3ltdHlPS3VYREp5NlJM?=
 =?utf-8?B?M01HQ1hsSXFkSVI5M3hYNXJRdkJDYWwrb1RKeGRTUTFOSUdnWEtMK01BZjdG?=
 =?utf-8?B?bnllUHIydHNyeHN1a1haazZQQ2RzYVJPL0VzanNyQVFBNmVYSjBRMS82aTU3?=
 =?utf-8?B?bUcrSklodEhPemNuOUcvcGhqRXlmUG1VOVNybUQ2cmtSTTFyRUJvcytBckxY?=
 =?utf-8?B?Y3cvbmtUdjh0N3RQWmE0N1BsTWJ5dWxYMlc5SExScG92eVViWk9PajUveHVX?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9ae115-6c1d-4e0c-b655-08dcdf1e9fff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 18:03:00.7378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8E6lgr0NonrAiMH2jFQXeDoxX6GDyK3MMoF7j/ut0yUHZbWv5tuGceILt4ExUwUlJ8UjXFfr3dBFM15BQ8nR8b/DPKgPVYqflaac1WiLns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
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

--------------5SxWKw03ibhcE6QMsMNT5T0e
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/26/2024 3:21 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe_gt_freq: Use sync reset
> *URL:* 	https://patchwork.freedesktop.org/series/139120/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/index.html
>
>
>   CI Bug Log - changes from XEIGT_8032_BAT -> XEIGTPW_11806_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_11806_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11806_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (9 -> 9)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_11806_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>       o bat-dg2-oem2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html>
>         +1 other test incomplete
>
Failure is not related to this change. This patch only affects a 
specific xe_gt_freq subtest.

Thanks,

Vinay.

>  *
>
>
>         Warnings
>
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o bat-bmg-1: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#2236
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html>
>  *
>
>     igt@xe_pm_residency@gt-c6-on-idle:
>
>       o bat-adlp-vf: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html>
>         (Intel XE#2468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html>
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>   * igt@xe_pat@pat-index-xelpg:
>       o {bat-bmg-2}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#2236
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html>
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_11806_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>   * igt@kms_psr@psr-primary-page-flip@edp-1:
>       o bat-lnl-1: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html>
>         (Intel XE#1649
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649>) +5
>         other tests fail
>
>
>         Warnings
>
>   * igt@kms_frontbuffer_tracking@basic:
>       o bat-lnl-2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html>
>         (Intel XE#2235
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html>
>         (Intel XE#2235
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235> /
>         Intel XE#2548
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8032 -> IGTPW_11806
>   * Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 ->
>     xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da
>
> IGTPW_11806: 38b2e82bf1fc1b891e22947ab39bb1a8407db805 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8032: 8032
> xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: 
> abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47
> xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da: 
> 6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da
>
--------------5SxWKw03ibhcE6QMsMNT5T0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/26/2024 3:21 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172734610085.1106295.17953114100289877483@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/xe_gt_freq: Use sync reset</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/139120/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/139120/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8032_BAT -&gt;
        XEIGTPW_11806_BAT</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_11806_BAT
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_11806_BAT, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (9 -&gt; 9)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_11806_BAT:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
          <ul>
            <li>bat-dg2-oem2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html" moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Failure is not related to this change. This patch only affects a
      specific xe_gt_freq subtest.</p>
    <p>Thanks,</p>
    <p>Vinay.<br>
    </p>
    <blockquote type="cite" cite="mid:172734610085.1106295.17953114100289877483@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@xe_pat@pat-index-xelpg:</p>
          <ul>
            <li>bat-bmg-1: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236" moz-do-not-send="true">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@gt-c6-on-idle:</p>
          <ul>
            <li>bat-adlp-vf: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468" moz-do-not-send="true">Intel XE#2468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>igt@xe_pat@pat-index-xelpg:
          <ul>
            <li>{bat-bmg-2}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236" moz-do-not-send="true">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_11806_BAT that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>igt@kms_psr@psr-primary-page-flip@edp-1:
          <ul>
            <li>bat-lnl-1: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649" moz-do-not-send="true">Intel XE#1649</a>) +5 other tests
              fail</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@kms_frontbuffer_tracking@basic:
          <ul>
            <li>bat-lnl-2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235" moz-do-not-send="true">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11806/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235" moz-do-not-send="true">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548" moz-do-not-send="true">Intel XE#2548</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8032 -&gt; IGTPW_11806</li>
        <li>Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47
          -&gt; xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da</li>
      </ul>
      <p>IGTPW_11806: 38b2e82bf1fc1b891e22947ab39bb1a8407db805 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8032: 8032<br>
        xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47:
        abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47<br>
        xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da:
        6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da</p>
    </blockquote>
  </body>
</html>

--------------5SxWKw03ibhcE6QMsMNT5T0e--
