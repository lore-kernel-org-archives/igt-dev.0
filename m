Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F6ACCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 05:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C65C10E049;
	Wed,  5 Nov 2025 05:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeibZ2yF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221B610E049
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 05:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762320522; x=1793856522;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KR4rr+oNUaQymSHuStJbDaYtx3LgG3Hfy7tK/TJgCF4=;
 b=MeibZ2yFR5Eoa1R0LY+qltFKEb/iAAZoiuyzKWX1ZUZYQ3m5V96WE65B
 rr9oxRMs2WAZJtz3vlJV/rUaQNxjXyoiHEz9npdGh6jzXzvtYcfqsM3Yv
 uR+PQcM4NS+AK6xZ3kZnsWtCdWTvVvckx19utHdJOGJ9sboSxMFxPDFXU
 kceoiKJFL6QiK2y+ImWSZZpHR35Q0Ed8Z6/90BuV9cPUudIUpVQEEOHWS
 AEStrpGh4IZa589QBs5iuk5Uh5+P3NAEf/c7+cAc3mfbkh9sh0mMqorMG
 tqi3a0SyNAMARbNG0nikovZLtnQtbp9dNR82o8kWJmq/MXMmpkCxx/h3r w==;
X-CSE-ConnectionGUID: JRAHGip8R8qm4mxNHdH4kw==
X-CSE-MsgGUID: brTf52i0QlSsUzhYbadCBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75535800"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="75535800"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 21:28:42 -0800
X-CSE-ConnectionGUID: k5OkJhxHRimdyBVzsRJ0lA==
X-CSE-MsgGUID: iQVtXRxzTTen28O7Mr5srQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187045012"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 21:28:41 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 21:28:41 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 21:28:41 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 21:28:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aam444IZGCKS2YxSs1a4bZNzOubLWRysZ1i7WONFHSm8dn1Vl7maO5/luWAYYNi4Qmhw9f0RKby0nbYddLT4TI36P7p2SVLE7yQ58Egv23geqsT13M2kt2MeqPc7Qtoq2iSD90UAEutk4n9KUWdM7mWikJKKCGL8AEzv2ehEKxkE4BJY9Tg+0jc5qKm4MOEzue5Z0Jry06RA3EMvBP1jNy4an08qcdmM8SJWts5+LWywm1/ydZmR1gdlWGPZC7+xXxAv11hpoIq30xbiE0LXlR+O+0vh3PwaLzhqUmUZiId7R/BIdYO1dcZIj02JCfnwdpN4pXxLs0xoQpObSSd17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8s9bZ8WuGSrplgmCbTxUarCAXtsPaKSE1Au1KGrPVk=;
 b=RLRpgGYuj1dOD1M5t+sf7HkARtmw/+LXOsNAY7isMcTrhAP1KdDqeCkEB71iI6OVQKfea441IekNpK6qK5jAPT2w3jvCSS3kwx5zGcOeXZdW3nGUg4pAuIUtMHfUShKGEm4g+ww+cJlhkyx/XeVr3N1BJat69AyRdKlsaD2RJoh+2MzoNfInm2Lb1hD0b1GJpd13OJa7KZm559rVGO5G0kF0LKNKuF/nHSBIXLjSIVxrbLVxWx0FP9/bgF/LLtuTCvz1zZFN6srbGNZi9bHYDngj4MGtWEUolHGjORSWIMeV/zed1Mrttt5fQ4ABiwNBYa5Tb3W6MN/Py6IlAvILpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB5010.namprd11.prod.outlook.com (2603:10b6:303:93::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.7; Wed, 5 Nov 2025 05:28:34 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 05:28:33 +0000
Message-ID: <dfa66aa0-70e0-45fa-adec-3b39577548a3@intel.com>
Date: Wed, 5 Nov 2025 10:58:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v3,1/2] tests/intel/gem_ctx_freq: Fix frequency
 restoration in exit handler
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20251028193519.3273563-4-sk.anirban@intel.com>
 <20251028193519.3273563-5-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251028193519.3273563-5-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0204.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB5010:EE_
X-MS-Office365-Filtering-Correlation-Id: 220f93e9-f77b-4e6c-d809-08de1c2c29a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDQzSDNYeUo5aFRwY0FkZnRUb1ozYzZqT0ppOXcwZC9xWjdSRDZtNFVvOGFt?=
 =?utf-8?B?emlRLzhrclVNcStmc1lXd3A4TDVCM1M0ak5tY0dSL2xRajRnejNTdHlXSGZw?=
 =?utf-8?B?T0VlczEwbTJpTStlMFBSczJaVlgzblFvVDY3bW1NbFNPTWxLZ09aL24zTnRU?=
 =?utf-8?B?YUF3YWp6Z3Uvd2NFcEVtQ1NpNlk5SmpsS3duRUZkdkpCS3hRaS9FKzlVT2c3?=
 =?utf-8?B?TFRMaEo2R2lVQnJMWHY3QVJzcmxLSnltVGJWSWdibkpPSFRqbThHbTBKQUIx?=
 =?utf-8?B?czFKV0FBZldqQVpWSDlIenlORk5LeGd3ck9oajQra3hxdkxXTWdqdmU2clVp?=
 =?utf-8?B?VUNtNWVlMWdjZmNaZ1FIMlpJaDh1d2MrMTJVRHc3TjY4U1pQeWxGOVRUQ1d4?=
 =?utf-8?B?N1VPd3dEZEZ2endEYmlVN05JQ3JrK0lQZnVRQWI1RjdJNGd3K0dhaFJPLzZ5?=
 =?utf-8?B?OHFXcFhtMXV5SlJSQlBMcDF4Y25tdVJIajRpNTluNVNGWmdhS0w2VnJLT284?=
 =?utf-8?B?M3QybjYyKzAvN2o2QmVIWmk5a1cxdXQzb005UEJ6K1lZcWt4d2lObHIwMWo3?=
 =?utf-8?B?OHkzWkh4aHlGZHFZZHBZTkpKL3BkZnBJUWQ3MVAwRWdtQlNwOHorZDBBZ1Nn?=
 =?utf-8?B?Z2VBdi8yWmxhcmt2N0tDRXZUZ21vcGNybm1TODN5ZGZMR0xJd210YmN4dVdv?=
 =?utf-8?B?anMwV0xHbjRadHNRZGVQOERvcGdvR2dGMzhQem9KaVdvVGlIRitaMUN5RHdW?=
 =?utf-8?B?cU83MitBS2FqY2VtdVRxMGFHajY5TmdvRjRnWXNSSk9ZZERvdW8yN29KcVhy?=
 =?utf-8?B?NDVqQjVFWHRodnBLdGpMU0szeWg5L2dNZWJQU3RVWkkzNVV1aG5kb3FIemtV?=
 =?utf-8?B?R3BqNVY3RnJHelhLQVVxNTlrZURGbU9jMFQzN295aGlld0tDcTJ0TDdBL3Rr?=
 =?utf-8?B?WUw3cExMM2h5bGllbTdpT2tDRmhJK0hFVlNHY0d5cEZ2UG5ITG91V1FmSXlU?=
 =?utf-8?B?ZWtXaW83TUVnM3dicU1aYTJGS3pudXdEMDJJMTJrc1NhZElBc1VmOHdOS1FC?=
 =?utf-8?B?ZkJSd0U4cWpKTUxrRWZEL3hFZmV1RGlDU1JhMG5DTU8wWmQ5S01PbFhlajFs?=
 =?utf-8?B?SklFalNSTEVIbkVVYVRBeSt4dEZkc1Zwb2s2MXluM2JPOTRFUVlKMUFqdVMv?=
 =?utf-8?B?WmNtY3JZS1dzRzdyeGdDandXRXJsaEtHNGtmOTVxbEM3RzIycU5zMkptdjZu?=
 =?utf-8?B?bWJ0VGhkcXcwUUpRSFU3emh5azZnWlE1TW1ZL3hVS2krbG9uTHZiTGtBVEJO?=
 =?utf-8?B?Slo2dGorVXRNUmQ2SWVUbXF0eTEzTGNORmIyMzgvc2htbEhkaS9XMEVWY01t?=
 =?utf-8?B?WlVMT2dyOW5wNGgvM3ExbEQzZjB6YmROYTFDNnhuaXNxZ3U2TTJSV1dzLzB3?=
 =?utf-8?B?Y0YxcmZIREwrWGduK2piVk5hVDdRK3FHODRTZ2tEZmJCQ0VPVithWnRIOFp1?=
 =?utf-8?B?d3R0R0FaVlRucW5NeThrVks1aDZqTUJOZnFJQ0R3a3dDWmJCQk5xcVBLalAr?=
 =?utf-8?B?cTMrTFAxQlFtSTlMOGZtbFRZNWJobzNSUzYwcFdlT3ZaanB5d0FuK051RWha?=
 =?utf-8?B?c05QKzFYZDV5U0ltc2R0WlVqNUdQdnZGN1BxNmExTngzdkZ2TFRWM1dsK0x0?=
 =?utf-8?B?VTc1YTF2VkRQQWt6Q0Q2RFpCYW4zTnhFcUpKcHdBZGtTQ290ZHBaT0FjbHY1?=
 =?utf-8?B?N21GQkNNS1R4NXJMVUZHNXAvaE55V0k3eWlpMzc3L0VzbmJKYmpxUnk3TXEv?=
 =?utf-8?B?M0wzTHlwTzAwVlF2a2xnUHZHOWlmUGhnWnNYZFJ6YU1ObVlhVDJQMkI4NFdN?=
 =?utf-8?B?emV0eG5WMDBBeVRuaW9xMWpSSVBTaEgvVWxHckVUaW5DZ2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmhGMFRmVk44UzRQcmd0dkR1N0w4WGtnQU9sY1pUNkYwZExURFJpYUFFS3Bx?=
 =?utf-8?B?YnRpSlhWMzlNdWZtNG9rQ1Q4djV3Z1duaEZmaExpWkZNQXJtWDI1UDhZSVFz?=
 =?utf-8?B?RkMxMmZMYUs1NkpBRVJQRlQ4SUE3aE9wbXdIZnMvUHFKeVU5T1U5MDlMd3Bo?=
 =?utf-8?B?dzQ3NXphdFprUE5lOGVyTDBQc3FLOVpPalh3dGcrQ3loUCtFQ1ZUcE5JUTFz?=
 =?utf-8?B?OXF0Z0xUSHd4VGNYUk5NZWUzbU9oaFE5Z29xRTdVM1QxZTE5TGt4bWpjc0Fj?=
 =?utf-8?B?all4dWFTRm13WXZkNXVDZzJnS0pNT2FvOFFYWkdWTm5WWjRUSGc4YUJyRUpJ?=
 =?utf-8?B?ZVRzdDJSbUZuYlloUVlzdC9qY1R5ZUNyRHlRNGlLSHFMMXFyZ3YxT0l6NWlT?=
 =?utf-8?B?KzhHbmRRVzF6QkNnOFJDbCtXMmM1MnVaV1QxaWprM21oSms0T1h4QXd2OXFM?=
 =?utf-8?B?Rms0eHZPZ25WVXpTUlZGY1JmQUttdWZFcFhYczNsQWtzaFA0UnhQQVl3Q2E4?=
 =?utf-8?B?SHgrT29uR25tc0xRVUZtY01FeFoxMnJpaU9ybHF6ZEZ6aGlnVk5CTElLOGVh?=
 =?utf-8?B?YU1qYmxYK2JMOFZRZEhrRTNEU0JpUENMeXhkOURnaWV4QkJ0d3lPbDV4cm1G?=
 =?utf-8?B?SHNoeHF2ODR1Nmo4Q2RoSXo3OEdQemduREREa2VLaGJoQW1kR1BuWlA5VDQ2?=
 =?utf-8?B?b1NGVFpBajBoeEtDUzFCYXlGMTVaY3k0R2xoQkdRZmg0T1RIbmR0VUlpQXkx?=
 =?utf-8?B?TjlsZm0vYTgzYThvaU1hOW4zOTNSSkY2dUhqUUVpbCtLMURiWEY0MDBreC9N?=
 =?utf-8?B?YW50TGRGQ0ZFRzhtVVgxMUVPWHQ5WlBITng2R2ZKUnJiVzhWTWk2ZFgvMkVH?=
 =?utf-8?B?eENuYVMrbURZWXA5UVpRUmFKaU5RY2hQZlRqbzZHeWtubVk0YldZbnFUaEJM?=
 =?utf-8?B?eFFPVy9td21zTG9SbllpdUZpQWs1YTNmdXhIQkhxUzhkNlowQ2ZXUU5DbnRy?=
 =?utf-8?B?ck5nRmlmbDBoaXc4YXJjVm5kc1EzeHdEUUxsZ0tTVDFFQWtld1ZtZkRsblhG?=
 =?utf-8?B?cCtXb3Z4cXFTU3RlVXBHUVc0S2RwTkJ3aGpKMTFyK2NSWkQ3dUw1MlZubjU5?=
 =?utf-8?B?cS9lU2lLdHJwSlhkdzNhRmdNNkhJV3lMU2VRZ0w3VHpaL1ppUTN1NWtxTkVa?=
 =?utf-8?B?Qm5jUi9EVkNFTFZaMW9teERCcHpBeVV5cFBua2FiMFF2TFdpUzZRcm9iMW5z?=
 =?utf-8?B?QlBaOHEzbk5tOFBNZ0NLcmpPOThNZlBkQnRaV0NJTVlYTFNCZlVsRHZNcWg0?=
 =?utf-8?B?N1Z5TUlhTlRDcFd5V05Da0xIMkpSRkdLQU91V1JqVjlmOU8wMXFtZVhONk9h?=
 =?utf-8?B?cjZWM21maUZNMStPOTlhZkw0ZHpMdDRpMTB2SWE2S3NlK1V1Y2RueUplY2tM?=
 =?utf-8?B?KzlMTHFYL1JSUHRZUTlHcHkxZWFGSjR0cHRpV3hxWkpMcXlVRGE0V29RaDhm?=
 =?utf-8?B?Vk4xQXNRNkdGVDQ3ck56ZkJ6UnNSeUU4bWV4OFR0aUdsYVMrTkFZZ1NCLzlY?=
 =?utf-8?B?a3orMFVicVJZanpMbHBlYVBOYUc1WTBrcEVZeThLK2ZwMTJ3dStxOTArbk9J?=
 =?utf-8?B?QmdQV0RSZHpmbHZMOUV6SzJaMnBCaUpPclNMMTljNnhiREwyWjhtWERQMDVh?=
 =?utf-8?B?NmM0WmFzS3U4YXNmWGxJa24zei9tdjQ4enN0K3hrYS9ZR0I5MHhGaDJsZU9K?=
 =?utf-8?B?QkFwOG9kQmRsT0toREVkNkdJS3RFUUdEUzhWZzRFaG95ME9UeTZuV2xpbFoz?=
 =?utf-8?B?UE1PUTdlTkR3eU9YMFRtWHIyTjZ0dUNTM3VCNEIwQmhUUCtpSVFnWVo5bElG?=
 =?utf-8?B?d2NUS1B6cnlhVCtXYTFKaXRtZnFWKzgvNDU3Q09Zbm9mTEhmaVl2MWlkTW1w?=
 =?utf-8?B?WitzRVRiVkNSenhSbFJNdERXUTcySzI4ZkxQam8rbVFaYStHNGpxc1JkWEg2?=
 =?utf-8?B?MzI5SmlDM0FtM1premVjU1l0V0pMZE1LbEprcHdxV05BeTkrU01kOWk2KzNm?=
 =?utf-8?B?UCtXZDQxQjU1N2ZjSVZNa3RZV3FwYzBsaWY0WDB5V1FEOGRoa05hNTgvTDV1?=
 =?utf-8?Q?/Fwj0vniggEdNK+NA1xQUK6hL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 220f93e9-f77b-4e6c-d809-08de1c2c29a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 05:28:33.8894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYl6tUi+wujWQnqcsdj+snNJOxWNHD5fB+OLKFm9TQHWJ8A/V3FP2zPuUYZaBKFXAXXX1B9Zfuwj5WWD7+r0BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5010
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

Hi Anirban

On 10/29/2025 1:05 AM, Sk Anirban wrote:
> The exit handler was failing to restore frequencies as it was being called
> after the driver was closed. Reopen the driver in the exit handler to
> ensure proper frequency restoration.
> 
> v2: Use global sysfs variable (Riana)
> v3: Remove igt_require_gem (Kamil)
>      Use local sysfs variable (Kamil)
>      Fix subject line (Kamil)
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15103
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/gem_ctx_freq.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
> index 29fdf89cb..ea6ba9ad9 100644
> --- a/tests/intel/gem_ctx_freq.c
> +++ b/tests/intel/gem_ctx_freq.c
> @@ -197,11 +197,11 @@ static void sysfs_range(int dirfd, int gt)
>   #undef N_STEPS
>   }
>   
> -static void __restore_sysfs_freq(int dirfd)
> +static void __restore_sysfs_freq(int dirfd, int fd)
>   {
>   	char buf[256];
>   
> -	igt_pm_ignore_slpc_efficient_freq(i915, dirfd, false);
> +	igt_pm_ignore_slpc_efficient_freq(fd, dirfd, false);
>   
>   	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
>   		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
> @@ -214,10 +214,17 @@ static void __restore_sysfs_freq(int dirfd)
>   
>   static void restore_sysfs_freq(int sig)
>   {
> -	int dirfd, gt;
> +	int sysfs_fd, dirfd, gt, fd;
>   
> -	for_each_sysfs_gt_dirfd(i915, dirfd, gt)
> -		__restore_sysfs_freq(dirfd);
> +	fd = drm_open_driver(DRIVER_INTEL);
> +	sysfs_fd = igt_sysfs_open(fd);

you are not using this anywhere.

In __restore_sysfs_freq, we are using the global variable sysfs.

if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)

assign igt_sysfs_open to existing global variable else old fd will be
used.

Also re-order the patches

Thanks
Riana

> +	igt_assert(sysfs_fd != -1);
> +
> +	for_each_sysfs_gt_dirfd(fd, dirfd, gt)
> +		__restore_sysfs_freq(dirfd, fd);
> +
> +	close(sysfs_fd);
> +	drm_close_driver(fd);
>   }
>   
>   static void __disable_boost(int dirfd)
> @@ -262,6 +269,8 @@ igt_main
>   				sysfs_range(dirfd, gt);
>   	}
>   
> -	igt_fixture
> +	igt_fixture {
> +		close(sysfs);
>   		drm_close_driver(i915);
> +	}
>   }

