Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF58ED75E57
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 14:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB4B10EB53;
	Fri, 22 Nov 2024 14:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Evn6F+iX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D9E10EB53
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732285469; x=1763821469;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2gtwKrsaArqs8QIZT1UCS1y7dYTHHogwzLcLkMaiJd8=;
 b=Evn6F+iXW+vQEXZMPwQuYqn2uZ5TtW8vT2hARK2BoKQSYLcCS8YBJnPe
 lzH1XycttEpYrlbK1fyzfIsgbs6tYLSECUzfHu4GmWuBmvr9l9G4PY+tm
 aKddP8DVE9imxv+aKeGF7/RK3VyEnmQa5lb2bcNx7+8Vyj6XpifpNmIuE
 /AVxcTiST7sW04jJvpw8MUuoyIQrOFW0uw5aufHBZEvVgrvIGK/vtFq4n
 CXj6/lM5DDYuBv+z4am4whlDgLK2A+BzzoylThzL6zzdva9YnKCvhrdG8
 pJH0OKgjgIKJjPdx8h5LbdMToAMVF+MfxgkU/xKBd+ZZ6h+y/Eokz+Aj7 w==;
X-CSE-ConnectionGUID: +yS8bUIwSv2LUO8q8gck8w==
X-CSE-MsgGUID: 1FdouP+dSWeiREaD3szapA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32365949"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="32365949"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:24:28 -0800
X-CSE-ConnectionGUID: R/0mrhFSQL6bnbrRMB4NEg==
X-CSE-MsgGUID: AuKBOXVHScah5EMHvjcTZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="95022444"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 06:24:28 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 06:24:27 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 06:24:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 06:24:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZVoeCvvlVoJxmdDwRJGIGtrdE+H5G8zcZOZDmuUIR5QuUMFKL5Qkvl6DQJZafD5ZKiMYEBYBorNDXktFToxBiV6nSR9JxnP3CvbiE81vpSGDjLDS6JNCuTNIPbbGfUj9Y8b1CmblrOb0rgiVGGn611XhVcaaz5lnUExy2lyvlGo5Uxt8tiQHjH4FGTe78aK1Nu889W0GGrhyHOmlP6ruF3hn1DsodYcPrsAhwi9qS9Jcs05TKzG6BNh2JRuANLz/rTBj1sLHdTJdursGK5YDE/FQPC9WVl3ozHBHS+CtjpMHzNjcvRrbMBDMwo+aQXG8z8FJq/2SxxP2+NgzeIanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa099/UdwV+etHYxQDoen8PpjGck6sdM0PKRmVlm1XQ=;
 b=UeTkmWDsTkHLnDCkNxQV9zbYl7+WJ0/IBYwfvD+c9ZGnOvt82zb3BNUGVP4+sq7EkiFLoE9SJgZ9wum4Pw0CuWPdnFjtKYs8vdI9bapV219C4phfaSjqv61peU5c26Wh5vQHfi52SSCn7EVjrK8eEL68rb0rKLJpO1dctaMDL8MMcprguM2Qr926eAi9pE/oTxPbqL2Nj+7IDcf2sy2AVcqwJTrR5GVWX1mPtgJD+WeRa94JeVkOA0AYB/dISFI+oJ1VcyWttfvlmjbsCM7xnTmb1UNusPl8WzwCMNfvqCj7cckeGsBTG1pyHZp6HaEgvyR8UkmQI5NAKaYU3lD0+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6619.namprd11.prod.outlook.com (2603:10b6:303:1eb::13)
 by CH2PR11MB8834.namprd11.prod.outlook.com (2603:10b6:610:284::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 14:24:24 +0000
Received: from MW4PR11MB6619.namprd11.prod.outlook.com
 ([fe80::55f0:ee1a:cbd4:a704]) by MW4PR11MB6619.namprd11.prod.outlook.com
 ([fe80::55f0:ee1a:cbd4:a704%5]) with mapi id 15.20.8182.014; Fri, 22 Nov 2024
 14:24:24 +0000
Message-ID: <85949d12-d5bc-431e-a972-9fa9977444e9@intel.com>
Date: Fri, 22 Nov 2024 15:24:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] lib/gpgpu_shader: add support for Xe3 platforms
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
References: <20241121-gpgpu_send_rework-v3-0-0b6aa48ab006@intel.com>
 <20241121-gpgpu_send_rework-v3-4-0b6aa48ab006@intel.com>
 <f52bb270341789ee54eee040c7783719d7990ed8.camel@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <f52bb270341789ee54eee040c7783719d7990ed8.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0118.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::15) To MW4PR11MB6619.namprd11.prod.outlook.com
 (2603:10b6:303:1eb::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6619:EE_|CH2PR11MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: e7782def-e35d-4913-5547-08dd0b015d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlNJZkUrTExPNkRkQ3hhb1ZmenFyRVg4R2h6R3JlTVhWMmRCVFdNOFNITkpY?=
 =?utf-8?B?TnY2d0xzU1hSbWxjeXo5L3M0Wm1EVUQwWEU2cXhueS9senFDZzlOUStoT1Vn?=
 =?utf-8?B?TTVFbzFDeXY0NlFET3B4QkZGaHovSy9BNUQ2Nzk1OTdRbHRkRG5KOHVHVGly?=
 =?utf-8?B?dTlKRXZ0ZUtyY1VOakIwa2NxMWVFMWhrNU1WdmdLMzZBMURWWlVvb1NtK1ha?=
 =?utf-8?B?UVgrWEdpeXRIQ3duVlpxNFJ0YzZLN1hkRDFCNTk3ZFQrRGh4S0Z6NUswZ1Zh?=
 =?utf-8?B?elBhWDA4MGJPNEs3OHIwbHJaMEFGNlorV05sKy9mTlNUY01DYmhqMlpCdjdV?=
 =?utf-8?B?b3VGYmlsNmtZSDRtSzFrM1BjNFJTeVRhKzNEWGdPQ2xYY3kwd2FTNmMrNEtn?=
 =?utf-8?B?T0k4dDIrMkFtalEyM1R6djRRTCtPWitmcXRtc0oxL2VZcmF4UDc5OWNjRmtk?=
 =?utf-8?B?MEpYRDJUbzlTSnZkNEExRDZhRlBQcFlJRDVHb1RzdWp3eHU3OVltczNPejFm?=
 =?utf-8?B?Sy9BaFc3YUtMWFhOUnozMnFKWEhUWEhJbmhkL1VKQVZ1MnJoVVhrdEt2VmRH?=
 =?utf-8?B?UmkzYmVVMWsxcjloRTVmcHQ1bGRacnZIOUVTdHZ0SUtoZzlaQStBaDFWd0lW?=
 =?utf-8?B?aitvUURRVWRPTzV3UWtocGJDTFlNUFo5WHJNSjJFbjBqTFZXQk04UmoramEy?=
 =?utf-8?B?OVlKL1JuM1lhRi83a3dLdGlEeXV4a0RnR21mKzJJMk1BZjMrZjgyY2hpWkUx?=
 =?utf-8?B?OFEvZTh5QXBmbXhWV0NQMFpzbGswSjJsdWpsb2hmZ0xzaDZKZm11am02WTZC?=
 =?utf-8?B?YWY1Y0RORlU0TEVPcUEzSHdQdHdNYUpmQ1duL0w1YmQ5M01HOVhSSmVCR2Zx?=
 =?utf-8?B?OGlRRzNVdzlVUG8xZEFHRnJHN2JvakNWL2FHT1BjTFpaQWVmRjFzRmRyaGRr?=
 =?utf-8?B?ak5aczFFcnR5bXZyNkN4YytoZ01ucWg4QmlNWm16NFRjUHFtY3JZY0F1cWFB?=
 =?utf-8?B?dVdsTU5KSmN0VzY2UTR0NDg0emxMeDVVVTczZ1lmcE16V3AyZFBlWjBWY2kw?=
 =?utf-8?B?SlJ2cXdhS21VSU9yeGZ6TlRaQ2EvR2dGZmNhaUFzNDNNUjVXMUgwQ2thUVd4?=
 =?utf-8?B?cTlYMEIwektDUlc4ZlRVbUVYOXJ0dGpsREh4MU5NSG1pSG9JTzNKT29iaWpz?=
 =?utf-8?B?WVY5dXNmQ3p6a3BtQlY2WDB4S3FMdzkzLzhZSEVGZHhyQ0dIT1NxRXl6NWIw?=
 =?utf-8?B?NU1RRzA5NFlWT1FwUjZkUUFHK2ZZK3lTMlJSK2JYWkVyZ1pGWmIrY3pXVkVZ?=
 =?utf-8?B?R3Rjc1l2SjRkYkVnOUNyNHpGNXJPT0J2Z01CTXhqQ2c3TEo2eVZzN3ZOeXBp?=
 =?utf-8?B?SFhnSzlWdnJRd2tRTXNlN0kraExiOVRCVmUvRk1VQjh6V01vdFlXQmRTQXJx?=
 =?utf-8?B?b2x1OUhpVnA1QUI2K3JsV2xYTUhQYzNwbGtLUGIwZVppUmpsVWxrQjhMOVJF?=
 =?utf-8?B?WjVPWjM0NVRkOEwwejBvZUtweDdWL1k1c2ZrczA0REN0N2tjQ3JXTlZrTnRm?=
 =?utf-8?B?NHdJUDArdUdJay85YTRGK09rWDVaYm5Jdi83SHpMUzhjZCszUjlNUTEzTk1n?=
 =?utf-8?B?aHovUDUzWFBXY05aTEx1Y2tZRmN3MzkrWVBHTHdwSUlSM3U2SDdpbGlBa2xM?=
 =?utf-8?B?akxOckY5dzZYWlAwaUNsZkRrVzBEc0l5RlZXakhBcTZUcHlQTFRkME1YaW9p?=
 =?utf-8?Q?ZziQhRkWrKDybPLwoMgB8D2zQ7CneI9RmhmDm5e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6619.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlhZdzZkZ25NcW5LSHhQYVJ1S1dxMisrTkZMaitndUFkYVFJNU03N2RUeTBk?=
 =?utf-8?B?K2FCcndNWk9WT2VScWs4UTlTUGxLZ1JPak5NMldVVHlKL3NYMDd2YWxvODhh?=
 =?utf-8?B?bHA0cjJvVUxsSkJtNXcvR2dmKzZyUVBxSHVDVXducWdJYkd3ekJFK09tdVcr?=
 =?utf-8?B?b2VvTDNYMjI4Y255K05DeXdPejhQN0I2bXBYVkNQL1pBb2FPWUVWcWxFOTJL?=
 =?utf-8?B?QW9iWkc1Nk1Vc2JTQ013dTNoQXUvZDJtcmxpdkpTYUw3aXdoZUdxc1RIcG43?=
 =?utf-8?B?UzZnbEhUQ1ZCbHI1OEtjd3pDYUluOFBsd3BPVllyN1lqU2QzRWg4djFSYzVo?=
 =?utf-8?B?VUk2Ylo5N3FuazZvWTVjVGMxOGIxRzZrKzdKZlMxK2ErNTBGZWJsZElSM3FL?=
 =?utf-8?B?Z3REVFNXTXdrT3FrUWNQSE9jK3hRMTNCdkRSVDJVRzdaVnlSUTA0cWtaVWUv?=
 =?utf-8?B?S3lWUkREcGZpbGVkRVF3TFpFTWlvZUp3U1BiVHdNbXlKaTNhL3lzeXQ2Vzk3?=
 =?utf-8?B?UWRXRmZZMWlKQkU4aXhXREh5ancyN3VZY0NLaURtQ25YaW4wNUtjZjNvTDJj?=
 =?utf-8?B?WDV5QnJ0dDNjVmZiSkYyMDZ6a3J2YVpkcGREblFKQUNiY3lCVDJNakRnVmRJ?=
 =?utf-8?B?N3FvM3pOVngzRXlYVUlwVTB4V2x2R0Z4VERlYnRmZy9mSUxZMW5kck9hK3VH?=
 =?utf-8?B?WU1pbHhzQWdUd3dSYzVPTVh2ZGNYRHg5RDZsWEpyNnNOT1hkaWs0bnlhRUxE?=
 =?utf-8?B?NU41c2l6eUY1bWRhRUpCVkx3TjZ1REUrbFI5dDhmMjJMKzdLRnFVUW9LSW80?=
 =?utf-8?B?elQwb0kreUtHT2dIbklFd05OOERXQi9odjFndHliT1NoYkFZalc2aTVjYWNv?=
 =?utf-8?B?QWdTZWQ4MEw0YWN3ZGFPWkV4VGlKRGlGZktkc3lmRHVxdHd0dnRaRytyK0o0?=
 =?utf-8?B?WGxpUHhOMm1nb3hPVk5TV0MzdmpaL1c3emFpdlBKNjYyUFJzNVQ2UzNBK056?=
 =?utf-8?B?eGo0UVAvWlI5aGgwa2FHcUg4OHR0emhHdTk1YW5IbUVhSHBDbE5qNVFLanFa?=
 =?utf-8?B?U1NOb3ZyYVZKSTJRWUpPak1sQ29kenZPcVBRdmF3NldnMjRwSVRQdWFGTHNi?=
 =?utf-8?B?VmFEVmIrenZtQk9tSVJVMVU5MWozemlyVnVDUlE3Z2NBU2tRckRrNWFsaXkz?=
 =?utf-8?B?LzZpUnlrVWtTd0RadC85SzkwTGE4RXkrOUpRWmFVRjA4WkZReUdPOXZ5WWJz?=
 =?utf-8?B?U0V3NmNpRDVpOHhiZi9YWFNaVUVwa3JSWW1JNDdKMWorV1I5SGh5dFFTUzIw?=
 =?utf-8?B?bCttOHZOQXpteWZkOGp2ZGRiSUJ2U1ZYaUljR0hPUVhhd1gvN2V6VlhMdFZl?=
 =?utf-8?B?cFNLN3o2VmNYaGNpekF4SE5WZW4rRm54TnVBa3lEcUpycENNTTFvL09JVURX?=
 =?utf-8?B?VytJQ3NJQVd1cUxDQW1NYVEwSGlpYlBmRms2MTVjZElQV3JuMGtNK0NNaXR1?=
 =?utf-8?B?bGc2MTN1L3JxZG1LZTRHd0FwZjMzRExHcno1OXR6TEhTRVFubUNya0w1NlpP?=
 =?utf-8?B?UFJRQUFJMnZ6SmROT3NsSEp4VStXenRpWnJjS0d0d041VDZWS2lkOW9wcnNY?=
 =?utf-8?B?ZEE0MzlyUUZySGRFK2lzWE5jRThGNlhITnpOQ2JLVjQ3ZDFPWVlYSG4wWU9D?=
 =?utf-8?B?TEhXRFI5dW9RZlh4SGpYTUtLd0I0aWUxR1VTcUR6eWd4cDR5VDFseDJpbXhV?=
 =?utf-8?B?RXM3U1l6VmhzOWdsWlgrQU1GL3ZQc3gzR0ZFNHkvVHF3azFDYUxld04rTG0z?=
 =?utf-8?B?ODlhaFlOMXJwa3FRWXNqcGVaWXM2dDN2SkxHczhOaGoxV0N2a0MzTkFtNWxi?=
 =?utf-8?B?eVRwVkViODlQc1MzcFNOMXRjVGYyU0N1a0xpcWxSZC9EUEJnZWcxYVpTekN1?=
 =?utf-8?B?NXRpT1V1OVFnNWxKUkt6dkVESE1zY2YwMGNGV0VVZ2k1UFVqYmhhS3hZY0s2?=
 =?utf-8?B?aFpIR0JwU2d3Z2c5ZUdkNjF3NktHWGZsaU5kMWpNQzFRb2FYSWpXeml5allN?=
 =?utf-8?B?U01TaTJZdXBHVHRjTk01aFVxNkIzOWNNVEF0UjZLLzFjMzBaczZTYWhlRGpV?=
 =?utf-8?B?d0hqdTNIYlgyRThJSFcreE15QVFWMW4rcFFVZEFENjdVVHI4bzl0dDM2dzhF?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7782def-e35d-4913-5547-08dd0b015d16
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6619.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 14:24:24.3901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oD7SP3CfpIO6YtZX+uHXY1qiGiDZchJYzFQzhCD4oErdxjTf+0IY/TYlwLdF0R6k04OkoQIdLpEwLxJ8Q+xROQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8834
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


W dniu 22.11.2024 o 15:11, Grzegorzek, Dominik pisze:
> On Thu, 2024-11-21 at 18:12 +0100, Andrzej Hajda wrote:
>> Xe3 platforms disallow indirect load/store addressing. Surface descriptor
>> must be passed in 2DBlock payload. Use for it inline data passed from
>> thread dispatcher.
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>>   lib/gpgpu_shader.c          | 20 +++++++++++++-------
>>   lib/iga64_generated_codes.c | 13 ++++++++-----
>>   lib/iga64_macros.h          | 37 +++++++++++++++++++++++++++++++++----
>>   3 files changed, 54 insertions(+), 16 deletions(-)
>>
>> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
>> index 518423158880..27e8be6b37e2 100644
>> --- a/lib/gpgpu_shader.c
>> +++ b/lib/gpgpu_shader.c
>> @@ -210,6 +210,17 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
>>   		      engine | I915_EXEC_NO_RELOC, false);
>>   }
>>   
>> +static void gpgpu_alloc_gpu_addr(int fd, struct intel_buf *target)
>> +{
>> +	uint64_t ahnd;
>> +
>> +	ahnd = intel_allocator_open_full(fd, 0, 0, 0, INTEL_ALLOCATOR_SIMPLE,
>> +					 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
>> +	target->addr.offset = intel_allocator_alloc(ahnd, target->handle,
>> +						    target->surface[0].size, 0);
>> +	intel_allocator_close(ahnd);
>> +}
>> +
>>   /**
>>    * gpgpu_shader_exec:
>>    * @ibb: pointer to initialized intel_bb
>> @@ -231,17 +242,12 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
>>   		       struct gpgpu_shader *sip,
>>   		       uint64_t ring, bool explicit_engine)
>>   {
>> -	uint64_t ahnd;
>> -
>>   	igt_require(shdr->gen_ver >= SUPPORTED_GEN_VER);
>>   	igt_assert(ibb->size >= PAGE_SIZE);
>>   	igt_assert(ibb->ptr == ibb->batch);
>>   
>> -	ahnd = intel_allocator_open_full(ibb->fd, 0, 0, 0, INTEL_ALLOCATOR_SIMPLE,
>> -					 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
>> -	target->addr.offset = intel_allocator_alloc(ahnd, target->handle,
>> -						    target->surface[0].size, 0);
>> -	intel_allocator_close(ahnd);
>> +	if (target->addr.offset == INTEL_BUF_INVALID_ADDRESS)
>> +		gpgpu_alloc_gpu_addr(ibb->fd, target);
> You could define gpgpu_alloc_gpu_addr in a previous patch.


Ups, I apparently messed it up when I was merging the late fixup, will 
move it to prev patch.


Regards

Andrzej


>>   
>>   	if (shdr->gen_ver >= 1250)
>>   		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
>> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
>> index 04015b0b6d29..a12135e7dbfd 100644
>> --- a/lib/iga64_generated_codes.c
>> +++ b/lib/iga64_generated_codes.c
>> @@ -3,7 +3,7 @@
>>   
>>   #include "gpgpu_shader.h"
>>   
>> -#define MD5_SUM_IGA64_ASMS da66be3cf9bec819a61429de75943011
>> +#define MD5_SUM_IGA64_ASMS 7b1db60d1de46cf35666f2a7f51e8fc2
>>   
>>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> @@ -80,10 +80,11 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>> -	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> +	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
>>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>>   		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
>>   		0x80032031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>> @@ -484,13 +485,14 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_common_target_write[] = {
>> -	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
>> +	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
>>   		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
>>   		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
>>   		0x80032031, 0x00000000, 0xd00e1e94, 0x04000000,
>> @@ -612,14 +614,15 @@ struct iga64_template const iga64_code_clear_r40[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_jump_dw_neq[] = {
>> -	{ .gen_ver = 2000, .size = 32, .code = (const uint32_t []) {
>> +	{ .gen_ver = 2000, .size = 36, .code = (const uint32_t []) {
>>   		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
>>   		0x80032031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
>> -		0x84000020, 0x00004000, 0x00000000, 0xffffffa0,
>> +		0x84000020, 0x00004000, 0x00000000, 0xffffff90,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1270, .size = 40, .code = (const uint32_t []) {
>> diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
>> index 40b6338928e1..f82785610207 100644
>> --- a/lib/iga64_macros.h
>> +++ b/lib/iga64_macros.h
>> @@ -21,6 +21,13 @@
>>   #define R0_TGIDY r0.6<0;1,0>:ud
>>   #define R0_FFTID r0.5<0;1,0>:ud
>>   
>> +/* Inline data from COMPUTE_WALKER*, Bspec: 47203, 73584
>> + * Filled by __xe*_gpgpu_execfunc.
>> + */
>> +#define R1_TGT_ADDRESS r1.0<0;1,0>:uq
>> +#define R1_TGT_WIDTH r1.2<0;1,0>:ud
>> +#define R1_TGT_HEIGHT r1.3<0;1,0>:ud
>> +
>>   #define SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)	\
>>   (W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
>>   (W)	mov (1)		dst.1<1>:ud	y		;\
>> @@ -35,28 +42,50 @@
>>   (W)	mov (1)		dst.2<1>:ud	(width - 1):ud		;\
>>   (W)	mov (1)		dst.4<1>:ud	R0_FFTID
>>   
>> +#if GEN_VER < 3000
>> +#define SET_SURFACE_DESC(dst)			\
>> +(W)	mov (8)		dst.0<1>:ud	0x0:ud
>> +#else
>> +#define SET_SURFACE_DESC(dst)					\
>> +(W)	mov (1)		dst.0<1>:uq	R1_TGT_ADDRESS		;\
>> +(W)	add (1)		dst.2<1>:ud	R1_TGT_WIDTH	-1:d	;\
>> +(W)	add (1)		dst.3<1>:ud	R1_TGT_HEIGHT	-1:d	;\
>> +(W)	add (1)		dst.4<1>:ud	R1_TGT_WIDTH	-1:d
>> +#endif
>> +
>>   #define SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)	\
>> -(W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
>> -(W)	mov (1)		dst.6<1>:ud	y		;\
>> +	SET_SURFACE_DESC(dst)					;\
>> +(W)	mov (1)		dst.5<1>:ud	0x0:ud			;\
>> +(W)	mov (1)		dst.6<1>:ud	y			;\
>>   (W)	mov (1)		dst.7<1>:ud	(width - 1):ud
>>   
>> -#define SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)		\
>> -(W)	mov (8)		dst.0<1>:ud	0x0:ud			;\
>> +#define SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)	\
>> +	SET_SURFACE_DESC(dst)					;\
>>   (W)	shl (1)		dst.5<1>:ud	R0_TGIDX	0x2:ud	;\
>>   (W)	add (1)		dst.5<1>:ud	dst.5<0;1,0>:ud	x:ud	;\
>>   (W)	add (1)		dst.6<1>:ud	R0_TGIDY	y	;\
>>   (W)	mov (1)		dst.7<1>:ud	(width - 1):ud		;\
>>   
>>   #if GEN_VER < 2000
>> +
>>   #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)
>>   #define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_BLOCK_MSG_HDR(dst, x, y, width)
>>   #define LOAD_SPACE_DW(dst, src) send.dc1 (1)	dst	src	src1_null 0x0	0x2190000
>>   #define STORE_SPACE_DW(dst, src) send.dc1 (1)	null	dst	null	0x0	0x40A8000
>> +
>>   #else
>> +
>>   #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)
>>   #define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)
>> +
>> +#if GEN_VER < 3000
>>   #define LOAD_SPACE_DW(dst, src) send.tgm (1)	dst	src	null:0	0x0	0x62100003
>>   #define STORE_SPACE_DW(dst, src) send.tgm (1)	null	dst	null:0	0x0	0x64000007
>> +#else
>> +#define LOAD_SPACE_DW(dst, src) send.ugm (1)	dst	src	null:0	0x0	0x2120003
>> +#define STORE_SPACE_DW(dst, src) send.ugm (1)	null	dst	src:1	0x0	0x2020007
>> +#endif
>> +
>>   #endif
>>   
>>   #endif
>>
