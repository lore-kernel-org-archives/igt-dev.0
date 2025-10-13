Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47B6CCA476
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 08:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBAB10E3F2;
	Mon, 13 Oct 2025 08:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFzK8wc3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E2E10E3F2
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760343665; x=1791879665;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S36sk7ZnPfCLOPlSD9O9uytw7cAxkwQ8T8zYagr5BRA=;
 b=EFzK8wc3AGZBwR32mQrUP9B73vSnAn4FeVIeLogPpglrp47y6B6pwBBu
 dTHrDbgp0qgbwSialqqwduPKjuqy1j1jLlMOWF2UQOREHCQBE9Wz4F6YK
 OyQru2+9HDD+N34bItoZ96UVQ7lvILy+zc8tyqqmLJPeXgKl9ge9ZwsKH
 cntE+gbhuRNmc2tFA5OYXVhkFWL0INyViSFLwTAh8MVfyPg5zpHsKLc0A
 5d8+16hqlU7wkEv/wJ6MxyJWNXIyS0oynAEvAwmChGnWHg1w2+itzsfLs
 oNugIqze+EZOasW3JkX0EZrPN69Vnl9ASUU6MDXn+ijmSCltkMRqoekAy w==;
X-CSE-ConnectionGUID: ra4vcd/FRN24KmnplOxmtA==
X-CSE-MsgGUID: 1ZfX/zZbSymFL41dd+lWBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62392273"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62392273"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 01:20:09 -0700
X-CSE-ConnectionGUID: jVvv5zgBTQi5M1yb9+SJVQ==
X-CSE-MsgGUID: AQq0XI5cSpesu9aLMW3JWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="185556146"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 01:18:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 01:18:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 01:18:38 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 01:18:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2EBcKGt+R9amQyiOAPztR9ADgMRe5P2isejuSxNYiyK3+lrA7/7xIrfEwGbY/yUw5VFGS37mlAkOkYBjAvi8o1Mu8TjTfhk+z0qDBKkZy8AKinSgEnbzgSX8bG4FLLZSEIjxeUpiJe8xEHjXqwTPyGKmDb2ye3VHcq2UhmAWaPFP3g6DLjatYfE8L5noBCP7B9XgnfaCdG9vTgTlc6+liwAEr2Lg7qv7dFAxXCCj1oIGxriGV37CsJbrDE2Mvzv+zX0G9cHaixpEyDadQ4PLJFwtARq4LfmOgbTiBVOSLJPRxxqIER1bIX04YnBkVidc4xf0zl3qaztfkSQU6nMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jk3gzPAlT+SZaMxXJkaeVGyBAWwVM7WVuKKLW71B4b0=;
 b=XiM0tqyTWBDArj9sX2EqJtnet+jIVCqkR0i4/cygheSqa7Q6QsUcN6CSd63TxQLffsmrkDwuB1t1VjksYvpTixPZiz56+8uHI5P1OiTfFyZ72B+Aq8e/cCOOSkz3oAmvEb+FX853rQXW186h1yMHLY9/kjkUhaLQxGLF7HASCrg9jPUfkUvNdHBLLzV5HsSMSqXocX0b3ZU+6atx9AkvOx+pyFCrKQQSM7TmXbUDHWGtElFVcy/Lx/YV4Nzz6tDUQz4ieVMi6pP5ztJM1EMNr6QfOW1nsJHda3A4mu/ty9if5HgqXC0Bc4DNjpCt4Tf0AjWtpfVfYg81c/2OPi0bVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 08:18:37 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 08:18:36 +0000
Message-ID: <a8469a45-072e-40a3-94e2-45a8525a7826@intel.com>
Date: Mon, 13 Oct 2025 13:48:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v5,
 2/3] tests/intel/xe_survivability: Add new test runtime survivability
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20250929175230.753899-5-sk.anirban@intel.com>
 <20250929175230.753899-7-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250929175230.753899-7-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB4841:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a5bccf2-2042-4f5e-cc2c-08de0a311b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDQ3M0Q1NnBCWUlFakxETzVIV25NK29ETnlZOGNDemp1dmRPdEltYVVGS3NT?=
 =?utf-8?B?RG8rLzYxWUhKeU11clRYOTZSMmRuR1FLZHhkQmZTWjJjSlRZNHBjVkFPc2R0?=
 =?utf-8?B?MFcyM1V1aEgrNkhoWS9RYUdSNVJSYkpTZEtGU05QWjBySHNKM0NaTm9uelVE?=
 =?utf-8?B?SmFZUElIUFB0Um9yR0k3eFlrajJCWExmVHhrU1IzRUFWQTlXWnFlT3ZlYVcx?=
 =?utf-8?B?bHcwdGNpbElPblh0TkdzdFo0TmlqSGNPVExEd0FoUE8rcDdVSDFrdUpkNDNj?=
 =?utf-8?B?SkJtRlBBcERYeFhCWHJ4MWZGakVIRmNqUDNob21KQkhwQkMrYUUzMXpYbENE?=
 =?utf-8?B?aTNPeUtPd29nQTBtM3ZiVFRZTUZGUyszbDFQNDdpOFlEZmdSWi9qMU1nbzlE?=
 =?utf-8?B?eUNjMHc0V1QrK3BIY1NvdC9wMW5sT1dSNUp4UFRRRXVnbnBBYWN2OEVtQ2sr?=
 =?utf-8?B?cDY2M1FEbkdBbER3WjRBakszQTRzSmoyUDNjaVRXQlFhVkFuNklBN25CSG03?=
 =?utf-8?B?WmVxN3dybDBSVkZkcnBuRFg4NFVob0sxVHNKaEwweFVHeEZWbFVUQW5Vd2pu?=
 =?utf-8?B?ZTZhV3BkaXNhaVBmMnJJV0dxMEdiSDBnZy91UVVxMlpXYkNIKzJkakRURHI2?=
 =?utf-8?B?UStRc0ZmTDIzMmk4T0R1R2l5MnpnZlpSMmUzUmpMRTg0VjJNdXNCQUE4NFpE?=
 =?utf-8?B?Z3FGbTY1YUFvK0hXV1YvWEp1R0QzZXk2d2IweDg5eTFicENuNEV4K01tMU9F?=
 =?utf-8?B?dDBFR2VCZXBkZzZpeS9ETytvWW5ISjJwWnBhalRUSVRkbWNsRlZtMGljaXlM?=
 =?utf-8?B?SmdaUmNNRS9YMWhVR2hTZDFKYXIwNWo3RytZWGYrZW1jcTM4TmZlUVpGbTZ0?=
 =?utf-8?B?WmpRNnExQUpzQTVTRVBld0ZvOVBPSENoZWl4ZUhNSTVzc01DYWhzNk8yWWtD?=
 =?utf-8?B?Ujdsc3NxWFEvTlY2Q3ppVnhLMUR4ZXVmY1JIYzIxT3Z4UlQ2Tkp4Vk80LzZo?=
 =?utf-8?B?cEZCbkkvRU5Bc1pEdkNXVzBGU3ZxRnBlaE9PbUdxck5UR1lLbDdMTHd2L3dH?=
 =?utf-8?B?NSt6YWVxNHZMUDN1NWxkVWlBMTdVR0hxREFJUDUyRnVCSTk4RHpjeFQyZDRv?=
 =?utf-8?B?Yk84ek5kejhHYks5bUxxQWFpckN6SXovRUgrYld6aGo1OEJQNFUzMndEVlM5?=
 =?utf-8?B?REkrSnRMZ0ROb1JaWWZJV0RzRTBSaFo4cDNTK1RXUDFCZWRodGs1bHBlRFds?=
 =?utf-8?B?dXBrM0dCUlkyd2JuNnNLbWhudUtXUTNVVlRWVzkzYlIrd1pFM2xCOVlzcGpl?=
 =?utf-8?B?aEMvWHNsVXRkTnQrUnhqK1E3dzJSNFp3T2FLeW1HbG55ci9zcGxuQjkwejc5?=
 =?utf-8?B?dWtIV2liSW9mNUF6cXRGNUlYSklDbE52TXlrOHM5dFlmUFc4SHNPbVFCYU11?=
 =?utf-8?B?eldod1d5cjcyTldma0p2eVZiN3JkblQ2UkJGVjZYN0NabWpuclo0bjJkb0Yy?=
 =?utf-8?B?dUFNR2cxbEFVMUtqb0ttU1FRQjNEeURzYkxzdkUvT1Q0SEZtajlXc09iemNa?=
 =?utf-8?B?NmJERC9PY1NRb2dwQUNkcHNXVzQ0RldMYTZGYjdqSHFuZ1l6a0FpNk5taFBp?=
 =?utf-8?B?UWFncGVWSkxaaG5zYTB5TlNuSlAxbjZ4M0VmTHFuQllrVDlWWTM1SE1BK3F4?=
 =?utf-8?B?aExLMkpFcS8rWTBsUmp0WDArYjduRXhWdERZSzZUdkJlUUZWUVFDTitsM3Bj?=
 =?utf-8?B?Q2tiV2h2WHZLRDlBTmtTOXdvdXljU1FVYlh3TDdCWU9YdWRZR0pJbjZlU1h4?=
 =?utf-8?B?eEZ3UUlPaHJHb2dWSVBMWXArMW1mcGw5eFV0dmhENWsrSVh2VTZlRTdsWFZM?=
 =?utf-8?B?YXNSNEpoaVpWVC9ydnBJZms1Y0xVTDc5NVliNzFKeW52MzRFbTlMWDdmdStl?=
 =?utf-8?Q?30t9/xkh7W7+iRUuAC29odulq3/+tC52?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YllObWEwUTU0clNRNzV1djJ1TGZTNENCMUdPMmUreHpCSm1qWTJvR1BrUWg2?=
 =?utf-8?B?b2dKdlA0K2dPNkhITHYyYkJLdnp1aFdlNytjUEtZQUtpeDNSVHEvYVVTM3pO?=
 =?utf-8?B?SlgweUtIT0dJQUZEek1tV0xaenRrajJBaFlBamZXK3hxZjZ5K2UwNDREUnhn?=
 =?utf-8?B?eWM0dHRKRTlQVmlZR3JMRm1vQmVtaEZEejRlYmdEcm9jQUFOMDRYUjFCei9q?=
 =?utf-8?B?eWROWEZKTlU3cnl6MUJIYTI3VDRtaUhnaCtQejNzZ1RNUUdvaFNpUmtRYUd0?=
 =?utf-8?B?VzZIZ0FKRXB0a3o3Z0duZ2FlR24rZTNncnphY1JtM01NYTN0L2d1U0dkYW5h?=
 =?utf-8?B?R3h5ODd5OE5GdEJ1aklXSmRIeC9DQTI3Qk1XRWY0ODhRaGcxZ2hucWJvNXMx?=
 =?utf-8?B?RU5laGJsYzF3dDkrRDFnMXQzVHFvNXhoVmUyYkE3WlZuVG4zRXA3Wi9MTmdv?=
 =?utf-8?B?am03Yi9JUDFrUC85cjdtTTNKVklzYnpIaExZN2YrZm1Nd0JYdllFeE5sR3Bw?=
 =?utf-8?B?RXRYcjJzWTRLSXRLTnF5UTRiZjZ5OHlHblExY3JUeTZxQVM4dWUrK1VSTmZo?=
 =?utf-8?B?eG9CK0xJaE1WbHNZSFovd1RFd01NdXRZSUFnclVTSjNmUkNVaXcvYXR0Z0hZ?=
 =?utf-8?B?eVBrQmhCTDVTa3FHaUhndXJYckZSNGVlUWhJT0NNYlZNUzJhd1BUVXVieW5t?=
 =?utf-8?B?ck85Mkx5STl1S1FidCtUbHpZVFdPeHlXaDNnSXhpbkhNVTJDZ2ppYWNsWjVW?=
 =?utf-8?B?cmtGMFVjeEY5OU5NYklvZlVSb1BhY1ZsdTBMNEtURFBIOWFkSHdnUk5iQTFq?=
 =?utf-8?B?a2JoaEVkdUNWOXFnU0RMKzdRTjZMM25paUhWcUQ5emUwcUhBNlI3N1UrYTUx?=
 =?utf-8?B?M1FhVTIxRld5RFl0eGxOdkM2ZXlTZUJUUkduYkFiSGo3NWtYdk9OZG1tNGtY?=
 =?utf-8?B?eUJ3eWl4ZjV6MzNHbUFRalpVMStWc2Z2ZnNLTnJOM3U2SzZjOGJsNXNqU09K?=
 =?utf-8?B?QmVqSmJ6SzRIMzZvN3lYa2UrUnZHcGZvQ1owQVhnRkNnZnJRN3FVa1JVaEUz?=
 =?utf-8?B?a3JycmRGeDdZTFhmd1N5MFl0Vy9QZ2QzMUlWVHpTeW9Jci8vS0dUZEhzYWhI?=
 =?utf-8?B?b0srSWVmNWgvMlVRSDUzeXFaNFFMdGVZbG45ZjlHaEI4ZDE0bjI4eFFsenJ1?=
 =?utf-8?B?eWoxRUhmbWZtdGhwQ1o4amxWdDhUbWtFb2hFRWRNTS9NYWtpL2dMVjJGTUJ6?=
 =?utf-8?B?eFhGTVJiREZXTUNTQ3JZblZKR3R0cnVrRVI4NVdrY0htTEl0Vkl2V3liWFRQ?=
 =?utf-8?B?OTczNG5aR2dMb1FpZDdxdVNlazV3eEUrZHoranBmR1hRUmd2WWZuSlVkMEhR?=
 =?utf-8?B?WDlpNHFSMmRuYVJFU1QzNGo3MWtFa3dwQ2srbW0rcTd6M2tJZWExQnpsQjFO?=
 =?utf-8?B?RFFmT2Z5RXREdmpPR3hIbWU5M0dCWnE3MXFhTjlXVFRmQnFCNWkzZjR1Q0xi?=
 =?utf-8?B?SThnMithU0ZCWW4zci9ocEU2YllIRGppYytTN2lDeHI4MFM2YWNSK08zeWVK?=
 =?utf-8?B?aEFHNTRHNThORWdyeWNCdm12azdwaUhBcmhxdFp6RExBbkN1M3pQdWpjWHhW?=
 =?utf-8?B?cTZvZWFmdjU2Vml4OEhIVVNyU0l5UGNJdEphL1ZSUkRKNzdCT0J3UFY1YTVM?=
 =?utf-8?B?dTEzU1p6bmd5TGZxbGJXT0ZxQy9FOXQ5UkFJdHJheWNRODErMXZjbDZzWVJU?=
 =?utf-8?B?R2h4N0loY01leGxpcmEzc1pLV3JGOWxuOERRbFp2amJHRnJhZlpySXUwVWRS?=
 =?utf-8?B?VzBYWEo0clpEU2lnTjVZTlByY0RlWnl6RC85VU1OekxDSzl0VEM5d1ZOaGJw?=
 =?utf-8?B?bEpIRUE4R3RTRm94bkk0ZVloWGVOSjJWOEFKMWVsRHFscUdJQnp4TkJQUXp3?=
 =?utf-8?B?WUxhbTZaRTBUQ2RhSGNVcXRkZkJObnc4MkRjMzZDZWo4b2NBZllqTHRGUHFn?=
 =?utf-8?B?bFFFaVBLM0RwVkJOa3dYQURwanloanUzVmtiNmUxOVRMQ2w2akF2RjRjb3d1?=
 =?utf-8?B?S0p1QUtDOEMva1h1V2FkTFE0bENLV244bjRVbW5GaXdlM3c0RzRNb2hlQ01S?=
 =?utf-8?Q?VcMUEuUKHBG1LJaLhT0jNq9wl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5bccf2-2042-4f5e-cc2c-08de0a311b87
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 08:18:36.8498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oR//FrD2vZrrWI/sHsOA8nMMtKSKcIxj76hKRjxwlGE5VQ/GX++/UHfO3p+zP7HvLxd2ykLHNwmMLUNSz4N8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
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

On 9/29/2025 11:22 PM, Sk Anirban wrote:
> Inject a CSC error through uevent to cause the Xe device to enter a wedged

Inject CSC error using debugfs to test vendor-specific device wedged 
state and runtime survivability mode.

> state. To return the device to a normal state, reload the driver, as
> the wedged state can only be resolved by rebinding/reprobing the driver.
> 
> Check survivability mode to validate that CSC error injection correctly
> triggers the survivability state transition.
> 
> v3: Update commit message (Riana)
>      Modify the uevents interrupt handling (Riana)
> v4: Move test to xe_survivability (Riana)
> v5: Use separate function for sysfs (Riana)
>      Cosmetic changes (Riana)
>      Use basic spinner (Riana)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_survivability.c | 93 ++++++++++++++++++++++++++++++++++
>   1 file changed, 93 insertions(+)
> 
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index 3ce62657e..dab70e3d8 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -4,6 +4,7 @@
>    */
>   #include <dirent.h>
>   #include <fcntl.h>
> +#include <libudev.h>
>   #include <limits.h>
>   
>   #include "igt.h"
> @@ -11,8 +12,13 @@
>   #include "igt_device.h"
>   #include "igt_fs.h"
>   #include "igt_kmod.h"
> +#include "igt_sriov_device.h"
>   #include "igt_sysfs.h"
> +#include "intel_allocator.h"
> +#include "xe/xe_gt.h"
> +#include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
> +#include "xe/xe_spin.h"
>   
>   /**
>    * TEST: Comprehensive survivability mode testing
> @@ -25,10 +31,24 @@
>    *
>    * SUBTEST: i2c-functionality
>    * Description: Validate i2c adapter functionality in survivability mode
> + *
> + * SUBTEST: runtime-survivability
> + * Description: Force Xe device wedged after injecting a failure in CSC
> + * to test runtime survivability mode
>    */
>   
>   static char bus_addr[NAME_MAX];
>   
> +static void ignore_wedged_in_dmesg(void)
> +{
> +	/* this is needed for igt_runner so it will ignore it */
> +	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
> +				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> +				    "|GT[0-9A-Fa-f]*: Failed to submit"
> +				    "|Modules linked in:"
> +				    "|__pfx___drm_");
> +}
> +
>   static bool check_survivability_mode_sysfs(void)
>   {
>   	char path[PATH_MAX];
> @@ -41,6 +61,36 @@ static bool check_survivability_mode_sysfs(void)
>   	return true;
>   }
>   
> +static void check_survivability_and_uevents(int fd, struct udev_monitor *mon)
> +{
> +	struct udev_device *device;
> +	const char *dev_path;
> +	const char *wedged;
> +
> +	check_survivability_mode_sysfs();
> +	device = udev_monitor_receive_device(mon);
> +	dev_path = udev_device_get_property_value(device, "DEVPATH");
> +	wedged = udev_device_get_property_value(device, "WEDGED");
> +	igt_cleanup_uevents(mon);
> +
> +	igt_assert_f(wedged && !strcmp(wedged, "vendor-specific"),
> +		     "Expected WEDGED property to be 'vendor-specific', got '%s'",
> +		     wedged);
> +
> +	igt_assert_f(dev_path && strstr(dev_path, bus_addr),
> +		     "Expected bus address '%s' to be part of DEVPATH '%s'",
> +		     bus_addr, dev_path);
> +}
> +
> +static void force_wedged_csc_error(int fd)
> +{
> +	igt_debugfs_write(fd, "inject_csc_hw_error/probability", "100");
> +	igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
> +
> +	xe_force_gt_reset_sync(fd, 0);
> +	sleep(1);
> +}
> +
>   static int find_i2c_adapter(struct pci_device *pci_xe)
>   {
>   	char device_path[PATH_MAX];
> @@ -125,18 +175,35 @@ static void set_bus_addr(int fd)
>   		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>   }
>   
> +static void test_spinner_after_recovery(int fd)
> +{
> +	uint64_t ahnd;
> +	igt_spin_t *spin;
> +
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	spin = igt_spin_new(fd, .ahnd = ahnd);
> +
> +	igt_spin_free(fd, spin);
> +	put_ahnd(ahnd);
> +}
> +
>   igt_main
>   {
>   	int fd, configfs_fd, configfs_device_fd;
>   	struct pci_device *pci_xe;
> +	char pci_slot[NAME_MAX];
> +	bool vf_device;
>   
>   	igt_fixture {
>   		fd = drm_open_driver(DRIVER_XE);
>   		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +		vf_device = intel_is_vf_device(fd);
> +		igt_require_f(!vf_device, "survivability mode not supported in VF\n");

Move this to first test
>   		pci_xe = igt_device_get_pci_device(fd);
>   		set_bus_addr(fd);

you can use igt_device_get_pci_slot_name itself here
Thanks for finding that call

>   		configfs_fd = igt_configfs_open("xe");
>   		igt_require(configfs_fd != -1);
> +		igt_device_get_pci_slot_name(fd, pci_slot);
>   		configfs_device_fd = create_device_configfs_group(configfs_fd);
>   		igt_install_exit_handler(restore);
>   	}
> @@ -146,7 +213,33 @@ igt_main
>   		test_i2c_functionality(configfs_device_fd, pci_xe);
>   	}
>  

Add igt_describe for tests

> +	igt_subtest("runtime-survivability") {
> +		struct udev_monitor *mon;
> +
> +		igt_require(igt_debugfs_exists(fd, "inject_csc_hw_error/probability",
> +					       O_RDWR));
> +
> +		igt_debugfs_write(fd, "inject_csc_hw_error/verbose", "1");
> +
> +		ignore_wedged_in_dmesg();
> +		mon = igt_watch_uevents();
> +		force_wedged_csc_error(fd);
> +
> +		check_survivability_and_uevents(fd, mon);
> +
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", pci_slot);
> +		fd = drm_open_driver(DRIVER_XE);
> +
> +		test_spinner_after_recovery(fd);
> +	}
> +
>   	igt_fixture {
> +		if (igt_debugfs_exists(fd, "inject_csc_hw_error/probability", O_RDWR)) {
> +			igt_debugfs_write(fd, "inject_csc_hw_error/probability", "0");
> +			igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");

Why 1? Can you check the default value and set it to that.

Thanks
Riana

> +		}
> +
>   		igt_fs_remove_dir(configfs_fd, bus_addr);
>   		close(configfs_device_fd);
>   		close(configfs_fd);

