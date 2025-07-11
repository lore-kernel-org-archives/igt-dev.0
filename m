Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44F7C8303C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 07:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAE210E9B7;
	Fri, 11 Jul 2025 07:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFrSVObO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4672F10E9B7
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 07:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752218555; x=1783754555;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SIHK8o6mZR1mOG2aR70G+xk52hWmT+zHFlDFMA/ikvg=;
 b=LFrSVObOYkoJ78yNKhGIYSI+etWILzmb4IHqJW5X7pocfzZH+Mc0kUHG
 KgHAxm9niwiueyKlwuSwc+nP0Sfxh30ggX7rg0+MZK1GES1qRwv6IQvGQ
 BH0NOV6aG6+710GOHPJMlWB4X7bbGtlU/3LWyWkHsAipZlZ6cRlGYyu6y
 0e5ADpMer9J+Z/Rish2ddte2pZnZHpUtPD9ogpDlaZe9CadgXOj5HM6js
 YvCzFdlfr3rmntgAX9cv9Wg5IgN6EShJsVvURGGkPorqOBdCN2Pf3aRI0
 Gj7rg/jaj275Z1c9NlEmIfAIAkH5jwdLqFjx1CnaYCFVe2/1xT3q+6Zol Q==;
X-CSE-ConnectionGUID: TzBV6NnuQ6eNN7Gp89XKBg==
X-CSE-MsgGUID: fgfH+UDpTfOr9j4+iw3WdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54484216"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="54484216"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 00:22:26 -0700
X-CSE-ConnectionGUID: WGkXmbsuR12O2UhRPeXZoQ==
X-CSE-MsgGUID: kbb5cVNSRYKYfj1J6i6bEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="187300414"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 00:22:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 00:22:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 00:22:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 00:22:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxKFUlEcEkH0mXCzFvfm4rCuNoaUC6prGcl2vWk8eQMeo8NFlu4Y8rtOlRE2pkSruwTAFQtrMTjAVMqXwzxMa0uck82wjlHplS2pY0fKyDHHgQFFLJXrxUJnrzrFzFK4BCDjGfeBaNeG2DP+pKEWtcEJUl8uBcUJNCFjkE3Tb/ce2g3RNCh/vXk7IzH0HPOvy65q5kBPYYrAAqp77p59OnXgULzUYCCzO0kVtKRnp71AjpjDW65MDd5AvNOToPtOpzQetxLaADLQlP++hiAKjRoXTrBJ/i18M60MwCrsaXyBo7S0MrSRpIARyaVgmFfc72XYhIBtN8MSE2oDbb/pCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFn2vPFw1UvfdLPKpEulZQzaB/49oGcu3AZ2vQFD7eQ=;
 b=wNClpBvvvjOIRzCiaHm2hVnqly3VDQ3BE1BWj4G+Pe6QGc/yAGYuhMNNvFzqnkZ40+NDFEeOnYhRrmSJsIDQD3kAy+Hh5EUBLuO+LI1hc6vQCEwvlewwgt13lfkhNNfIRNNgzGKXn12BwKOChWT/wrbVXHfOxBehgWLFlkTXWNGuaDyxaUkre+q4xAhE8I+9rS3hRqCrvMJT9rgppszezXM8Pxcjv+9wm3Oc6R/O3bLvGPe9nOeRRnbzRoVifYXO2cg8JpQIB9mzbooalEdIfFLAT27Q3DPIk7FA16aXdFQDWVcbT1BW+MvqpDEkrZW+8RmVKWs/1KqYHEQudREiVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by SA2PR11MB5097.namprd11.prod.outlook.com
 (2603:10b6:806:11a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 07:21:33 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%7]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 07:21:32 +0000
Message-ID: <e217a733-12d2-4a15-b6ce-02a97106df6c@intel.com>
Date: Fri, 11 Jul 2025 09:21:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] tests/intel/xe_eudebug_online: Introduce pagefault
 stress tests
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <gwan-gyeong.mun@intel.com>
References: <20250701135307.68147-1-jan.maslak@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250701135307.68147-1-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0041.eurprd03.prod.outlook.com
 (2603:10a6:803:118::30) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: af11437d-b838-427a-f09b-08ddc04b8fde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUJ0bVpRZUlQOEszYTBPVnF5ci91OVpnS0lYNFphNnRZMk9FREJlZi9paXdW?=
 =?utf-8?B?TEIyUW95Qy8zdEVMbGQxeVdWV3RxV2FWcnVZeHRsVkpCbXZTNmYybktQa050?=
 =?utf-8?B?OHNlSXNxMVd5SU1yalR3WEM2T1Yrd1FXOWkvY0FVdlVEODc3bEM2YVAxaEdu?=
 =?utf-8?B?eGdqY2dFdFRESzFQL2lEYldQWFdmS0lZd1lqWis1ZllLbFhBTHhDTzVMSzB4?=
 =?utf-8?B?eFhvWEJuOVJralRrZDVoWmVDVG1PZWdUaXd1SzBhYXBVcXUzWVdGckx6bjBx?=
 =?utf-8?B?c0NSL1BCbWxiL215S0JLcm9qL0l4dzlDUGR2L2U2MitsWTdKN2JXSGhzZk8y?=
 =?utf-8?B?S3U2Y3IwMTBiaU5oT1dGNHloQjdFWnZ2L3hCb2paaUlzcHA5Z1pSV2VtYTE1?=
 =?utf-8?B?clRXTUMzT3QxRHljc24yd0xsNHNiMmRvNEFHNDh1UnYzcERhZDBvY1BUMUF5?=
 =?utf-8?B?VE5Uc2MwcDEzaVZZTk14TUhXbG91UDJvaEV5YTNnN1N4Q0NSRDA3S1NKcERH?=
 =?utf-8?B?M2kzOEZtM2NVaWRDaFJ5OThvbFVMV080czZGUkpZKzRucHB3NlNSTGlrQnBn?=
 =?utf-8?B?QzUva2J2SEl5bzh3S2g1WGpLeVY2bUU0WWhUalE0WmlsSVFBMVpUbEVpdTF6?=
 =?utf-8?B?YllNaW5iZHl6clYyT0RiNGlURnZ1K3M0WkVQMzZhcUQ0SXZFRjBkdElBRm90?=
 =?utf-8?B?ZHFQcGJHZWFiaTRSUjdnN1VZU2JYMVRSMzBFYzBJc21jVEsyQks3WlNCWDFL?=
 =?utf-8?B?RU5yMjFHWk40a0Q0RzdBWkFDMEN5aHJNajg3dzI5RUNjajNIb3VCY0lZdU0r?=
 =?utf-8?B?cHljYnByV3Zvd0V3U3hOWENVbHQwTjVxT1Q3MzhpZW1IOEdoQ1FUM1E5RlNz?=
 =?utf-8?B?bVJDMzg4OWZtV092U0RvVVF0M2VEb0JadXhhNDZ6VUxZWnNPRkYwN0ZTN0x2?=
 =?utf-8?B?dG5OellqQzF1dkhoYnV5b0lERXBkcTEycUM3aVZsbHVBSkVvZmdiL1VCZWh5?=
 =?utf-8?B?RGVDalRuaFRoM1NYZzRJakZFTENUQysveXhrUmFtZXVyM2RxNXdSZzlHWEFF?=
 =?utf-8?B?a21MZ0tieFhnVXpUekFUcVArMGNwL1oyeTZiZGxmUEJSNENMc29DR3FEbzVL?=
 =?utf-8?B?cDFWQS9wQm03NkRoTE1Gazc4Qy92U0lOejlJcFVaajdxMnpmMUx6RDQ3aEVW?=
 =?utf-8?B?WEdpcjZ5VUI1VGYreXBmWjZJb2dLKzJkVnNHTGFib2U5WUJRZERFclBlbEZQ?=
 =?utf-8?B?WnM1dWIrRS9qWFBkTFl5bFFIYnBmSHI0RFpPL1MvKzNxTWRrb1RKem9IVUpE?=
 =?utf-8?B?U0NXa2tSZ09oRjB3VEZRMXlJNVNXUGRHWTZhOVlmQ3ROY3FpWWUxRWpKcXRs?=
 =?utf-8?B?S2krWm1DYmIzQUhMNXBhK0MvQ0dTNGFmLytGWmcySUVQRTdXOVFuRU1US2Jk?=
 =?utf-8?B?SThOSS9Kc1g3alBPWGI3SGxpM1VZQ3kyWDU2UTBzSG1HV1VWMDVKeEtpOEZ5?=
 =?utf-8?B?V1hzYzVLdE44VE1wdVZoNEIrUVV4Z3FJVGZIaDd0M3pueG9COEQ4YjB0QmdI?=
 =?utf-8?B?SUtienJoOXh4RVErUzA1R3Ntc01OaXJPQTI4dXFwa2JBZVVha21zT3k5YUdV?=
 =?utf-8?B?M2lFdk5kakYxdkYxQ09xMS9DVm5VVUVTMUJORXNlbkE2M3hRWHhYQlNaN1o5?=
 =?utf-8?B?S3MxYmhCQ0VQUHJEMTJKblhjMFcza1RTL0lsOGZDNm9DSnE2NWgxSlE4SzZ5?=
 =?utf-8?B?ME9oN1Y4TThWSzdrSjlndk1oRTlSUHpNYVRpQ2FVM3BVOFlqZWZuWG44ZmJr?=
 =?utf-8?B?ZkxiSTVpaEx0ZjY2ckdTRW81MllSdC91Q3JHK3NXSEVkTjNHcUp2aHlOMFBv?=
 =?utf-8?B?WW1SOEE3MnNuL2dJU05xOHBnSUpyNHNhQ3NpMTJFenRWZXdsUXZGU3ZsNHR6?=
 =?utf-8?Q?Ig0hu62sXS4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGsvTXg1QnJZTy9kU1dmempoK3pPL1FkZm1oMjZvZHpwS3JiTE1leG15RThE?=
 =?utf-8?B?T0pNYjUrdmFBWW5tZlBjdGFxT2E3Y0dPTEVKQVBoUmZXMS9wazJsWFZVVFRQ?=
 =?utf-8?B?Ynp0UVZiYmNzUUthVHppeWtpcTdOK0RTdkZmNjR6bnM3M0JJdlJmM3JwS0hM?=
 =?utf-8?B?QUFERG1kNmVzdUV4KzNaTkJBdm9SZE1HcjJZWTBSbnFZVFZGMlMrazI4elNY?=
 =?utf-8?B?Sk00eitGanN6d2I1VGJBTzlJaG1sU0pWUmNadFpjZ2EzSGR2dTRDODBtczhj?=
 =?utf-8?B?bVdXeFJQdHVqSkYwZmM5MUNubFp1aktaQXpxYnV6K1VFbmFpR3p4RzJZN0dG?=
 =?utf-8?B?LzZWL29UYng4MExSdlc0NlFld0EzM3NtRkN6em14bEdGdnIyTGxBR3czSm9o?=
 =?utf-8?B?OFlSRlFNUlU2SWxSalV3aFBuaCtET1ZDd1hoSXhJNnRHTTZVVGIrWVFmUlRT?=
 =?utf-8?B?NTVJazhyTE4xYWpodG1NY0VDU2dJZzhGdWNuQzhtQmlwRC8wa1JIZUc0bXlw?=
 =?utf-8?B?SHFtcmllK0cwUEtJUk5nNVhhdHZkZE9PYi9ieWl6d0xHelJSV0lENW9jQ21D?=
 =?utf-8?B?RDNjaFpjREkxK291enBYWURlUU90VFBuaWtKWXgrbnRzRWcvSTgxV0N1WWVI?=
 =?utf-8?B?SnAxZzJBbG9ielFwcFk4YVZzVW1GckhtdTkwWDhKd1BOeXZQREI1bCtQbFlo?=
 =?utf-8?B?YVVsR1ZLb2tTZUFpdzBJeW5CYmIvdHJJdXlPN2FzeWpTRmxVa3BjeTBLZnV1?=
 =?utf-8?B?UG5id2ZnLzU5a1RvUktBVFRYMTZLSHVHaXZoNEV5ZWU5MkZoaWpUMmVpWCtn?=
 =?utf-8?B?eDZyR2N6ZC83VENidHdpVWJmNVVGMHRHWmhMZ3NabExzVEMwVmFHb3plZU1o?=
 =?utf-8?B?aEU4QXpRUk5iUVhWQ1dVSEI2MndFNSsxLzlsU2V3OFpEc0hXbFhoTjdNTGx6?=
 =?utf-8?B?QkRTMWt1enNjSUNSRW9LaUJFSVNlbjAycG1FMFhyZmtoZEZFS3lwcnFidm9p?=
 =?utf-8?B?VnoxbUI2d0N2U1ZuNWFkKzMySnBwWXZPVXBpSE9uOWdnZDZINWxYWUsraUtK?=
 =?utf-8?B?ZzJ4V2dXdUZwNnp5WlVnczE4bEw3ZWFKQ3AvSzlWRFB0YzkwakRmU2R3WjNZ?=
 =?utf-8?B?SE1TNStQUzZsK2dkNmN5b21NWW4rZ3VVRURqNWtmQi9nbHNqSGZPeTU0aG9m?=
 =?utf-8?B?Uk8ycTczVWRMVGk5QSt1ci9pSm5KUTVLRnBmZmg0UldMS0tIbmNZYTh2OGpN?=
 =?utf-8?B?a1M5ZXRnMnkrQmRvdnM4Vm9tWm9DUERqKzdyV2tRZER4ZDFLeUdQSWk5ZWlQ?=
 =?utf-8?B?TUdEckt2QVdBbDFtNkd2MUFldVpSMWNaR0llMFFuNWs2RkNvenFqQmYrYWh3?=
 =?utf-8?B?NmQ4V0VOZlo3QlNHbWxkM1ZCNXhnTDZEbWRTMmFVUWIvNzA3TWFCYXJ0RVdv?=
 =?utf-8?B?c1Y3dDdnbG1xYVJuUnJ0dVpudkNPWU5aazNPM2ZhNnZRUHdQNm5SbFVud2pJ?=
 =?utf-8?B?SnIxdjNHMmlMOENCWTAyMWRNVVRnemw2ZjkzMVBmS1htdHNCRFV6dDdVUGk4?=
 =?utf-8?B?Tk51dkRSTFhha1hwQ2dJdlEzNUtvcFUxQTdHcmpRU2ZhOHV2Q3MyTG5aMGRq?=
 =?utf-8?B?d1hqN3M1T0ZzSHpIbkZ5RnpucmU3U0ZOYjQ1OVdPVWszT1B1NjgwZFd5NEhu?=
 =?utf-8?B?TjJRa21Ca1NzVGx6L2l1a0NrU0lSODZGMWRUOSt2YmNMU29PSmNtRVpxakJC?=
 =?utf-8?B?NTBLRkZBYkl4SFZzU0NGV3RtMWZBVkQ5eHpzcCtaRXFid1UvMVpCZ1dQM0VS?=
 =?utf-8?B?SG5IbU5kS0dWajZpaUhqUnFERC92TlFpd1dhcTZuTVp6UDJLMnNoWTRxbk5p?=
 =?utf-8?B?TGJrcEUrbktJeEJsNnBVTnBqNlh4R3VMd3Z6RnpJSVphMUwrUDFmc09rU0Ro?=
 =?utf-8?B?NTJCdm4vbElhV0FRQTZCMWY1Z3FQL01DMTBiOWpEWEIzZitUamNnK1VGSTls?=
 =?utf-8?B?RFgzY0NycDI3cnlLREFhZUJrRW5nWEcweFdVak0yYk1idnRNbGRyNS8vZzJV?=
 =?utf-8?B?SnZiMmpNR2JZTXA2QWZvb2EzOFR6RkVCOTM0dTFKQk10d0FQM3hVSFVPbzll?=
 =?utf-8?Q?fFR5Zo/K7+fyb1ee+ngJ7DAu2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af11437d-b838-427a-f09b-08ddc04b8fde
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 07:21:32.8870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBEOJP7bd1Gq1Y6Y5p/1YLicz3z3COGCYjd4Gx5xHpnr642L5370DlJIdZH7qlZKmtwas2D86tJNNUodidKmcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
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

Hi Jan,

W dniu 01.07.2025 o 15:53, Jan Maslak pisze:
> v2: Compute `maximum number of threads in shader` and
> `maximum number of threads per thread group` values based on
> hardware capabilities instead of using hardcoded values.


I have noticed this is v2, but there is no v2 prefix in the subject.

On next iteration please add it (v3 I mean).

If you do not like remember about such details you can look at b4 tool 
[1], it will take care of such things.


[1]: https://b4.docs.kernel.org/en/latest/index.html


Regards

Andrzej


>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
>
> Jan Maslak (3):
>    lib/gpu_cmds: expose num_threads_in_tg parameter for tests
>    lib/gpgpu_shader: add function for computing max number of threads per
>      tg
>    tests/intel/xe_eudebug_online: add pagefault stress tests
>
>   lib/gpgpu_fill.c                  |  6 +--
>   lib/gpgpu_shader.c                | 80 ++++++++++++++++++++++++++++---
>   lib/gpgpu_shader.h                | 10 ++++
>   lib/gpu_cmds.c                    |  8 ++--
>   lib/gpu_cmds.h                    |  4 +-
>   lib/media_fill.c                  |  4 +-
>   lib/media_spin.c                  |  4 +-
>   tests/intel/xe_eudebug_online.c   | 75 ++++++++++++++++++++++++-----
>   tests/intel/xe_exec_sip.c         |  2 +-
>   tests/intel/xe_exec_sip_eudebug.c |  2 +-
>   tests/intel/xe_exec_store.c       |  2 +-
>   11 files changed, 166 insertions(+), 31 deletions(-)
>
