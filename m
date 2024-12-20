Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770F8E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 19:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CCC10E3C1;
	Fri, 20 Dec 2024 19:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnLXBUQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE0910E3C1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 19:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734722032; x=1766258032;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xMJsmc1gxlRx+51y3ryUyr5x8I9q+9BEN7JqNg0WN4A=;
 b=hnLXBUQ+EFkdNdUZ2FoMMECOJIRVC3rC2k/9MNuxshSudwEhxWmaAXJt
 mwmnlQG6aU4Bdz/COZjtgKgJokyXnB0jbuiJryMfK8Rqrj9J4BYw5us1D
 quXLFu5IMGTDXOH4ympYkOJuVgzQVCSC6HdcpsaXEGKIafeoncRdABSuV
 UwAyOk+SXflMttyVsKsorGg1iF3iRES1xyFqg5IVBMqrtJ6vNeWwa6LYe
 5qqWjkwrs0xeE1o2RfR2hjedufh8JpAwczyFksroUzWrUWA1NCRfeTRqN
 cub4ZolIiR0WwSsbjyzFWZGFpFczjXHHqJHKRnVpelv1xW5jbyI3DjbhS A==;
X-CSE-ConnectionGUID: fql6o3vsRPiHriD2ugLSLw==
X-CSE-MsgGUID: IAVwiVGrTYq6ycPbwiFmpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="52804738"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="52804738"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:13:49 -0800
X-CSE-ConnectionGUID: nQGjgH+BQgeoMpV/0dbUxQ==
X-CSE-MsgGUID: k6mBk5fjRzWd87JaIwmNjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102706072"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 11:13:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 11:13:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 11:13:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 11:13:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDnGIWufEkMji3+/MjeS+/Wbu8mtOt5IMF7MGDTbyLf9cO1ebnCAu/Zt/uY87THIfCV/a/rdBwinN8ZcxCKHMsPd4sUcz5XCV5EfL2HV0tlF8FAp9ons8yrKyzIrD4pYNURyfOQqh11di11Gku/3wMS4Nzu62zLCHQWy0Q3lCZCUSfd8RNQzwvWd6MxC/A+a2udxmFNRkNtzTVbxZNvXTDtLPkRvNnCZ9KNCQu49irPOFx0fQcycoW3oAKdxssq4za5mSCKJcgSTBwm1ulVB7am7NTLx1vS5BP1srJ30kYzrcr0geWxa3JSOlqFhF1iurp8J0VS098+lesjlaUfzww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPJhdWLBAd+mdvcH3mOzMfoLNq7gmDrpd/5lG/V3nCU=;
 b=lSa4E69GedmBiotYz/6W3WjJ0fa2t8nU7/BIOSuryr01MVCwonAuowgZ6rWFctk+Bhy7xPaj+Kw5Qup5ELk8FsV8fRu9lNDIh5SaWHmuVEB49U1QFnIW5ZsSP4t9CkvjC4eq5MiHUkD43HykQ839+6enqWKdd7jhgM1x55QaVQ/Ug1xLg337q/3bosv2BJEmn5+FyMSAGc2GWubBdka2k9UzcxtxxeCDeiaCL6xkWyWd0709+OMPa83jdUBoSOJWzZmCE3mNnv7gCoWgvHGqlafnoSNAY5gcNKOw0UuozekdnGAAkRx1BPzcr1itFSGiqIT8BYW6EYbEXnBROPhBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB8273.namprd11.prod.outlook.com (2603:10b6:510:1ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 19:13:16 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 19:13:16 +0000
Message-ID: <7ea616b5-7850-4431-8de8-0083f58b902d@intel.com>
Date: Fri, 20 Dec 2024 11:13:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v2, 1/3] lib/igt_kmod: fix check to confirm correct driver
 unload
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
 <Z2WxOK7DtA4ALf9K@kamilkon-DESK1>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <Z2WxOK7DtA4ALf9K@kamilkon-DESK1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:a03:331::12) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: d5398c7b-adcf-42aa-4af5-08dd212a5bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWpRSDU1SjUyQ3JqRFNKSkE0WHpaMmpYZWh5QzFwV2llblNzV1V0V3MrWkdt?=
 =?utf-8?B?RGw1dVBlMEJTdG8wSnlFUnpRdTJkblhCMHJRdkRUL3hsK3ljK1g0a3VKRXlD?=
 =?utf-8?B?WHhCOEtCR3N2SlhoVkNkOXpLbGZHeVRhOEg1V1A5amFwK0t4NjNJd09sOGJJ?=
 =?utf-8?B?S24vbWM1c0dId0I3bUxRMkwwb3AvZUs2Y29mZXNOZ1IzeWxPMFhJL3c3RTJu?=
 =?utf-8?B?bEk4V005TTZPSzNXODJhb05pVzVtYU9JNS9CcjA4N2xtSld6UVNYWGxtOW5D?=
 =?utf-8?B?WVNwd2N4UVZRcU1PaGZrM25VR3lSNkJLQUo1UjlZdHF3VTFtajRsb2dIWWpk?=
 =?utf-8?B?N3NQWXdvN00wQzRFcEdyS3NLMW9JVnR4MHlwR0hLYk5BUE9yRzM0dHJsMVZp?=
 =?utf-8?B?a3A4eHNaVUFHT2E5bVpZUDhvSFNoZURlVE50Z1FwQ0JwdURHdjVhbU9LbXZB?=
 =?utf-8?B?ZEkyTWZEUCtUY01GdHpFLzAzK3JuaHU3TERiZVNxZXI1KzdBMVlmMXRDOXpk?=
 =?utf-8?B?OTZmekNZbGFtVG4yTnV2aDRMMmRueWtuVk90cUtxN2VicDB3ZFJrazJWQVN3?=
 =?utf-8?B?c21vRWV5UzkwcHMrcm8ycDBEbVVqUHR4MVpCdmpLcXlxQ1RGNEZZSTY5MUZS?=
 =?utf-8?B?dHJFSGg5NW9PTkV2bHJVV3ZIcjcvaTFOa0Y4Y3dtYmJtN1NPOC9DTVFGbk81?=
 =?utf-8?B?alZQR0pmb3JBbDZnZHRySGYvdUhtWFdiNFdxRmg3RWtzejlzdHM0THZ4TmxJ?=
 =?utf-8?B?WS9TSFpnTUUyVEZaQXJkREdSS0oxdUF2d0lkUndBMHFZaGwxWmc0d250bW5z?=
 =?utf-8?B?RThrQWtwUXh3eUduRmZGdU1HSlB5NjFEVFBZWHR4NGdnQVhBTWFVK0VSN1NZ?=
 =?utf-8?B?ZWYwK0VBUjZ6MnpwTENTVEZBQTFyaEpsM3VwUEp1YWVoZGRPTWFZYytZZS9F?=
 =?utf-8?B?SEF3UU4zeG9hU1NPaDdVbllsNW4vdzV3NUxqOVpwUUJMNlNJOERlYUZ4eEM0?=
 =?utf-8?B?UFk1MTQ5WW8vVjJpaG4rVDlkV0xkaVhYWVFjZVl0a3ZJK29ybGVMRStIaG1H?=
 =?utf-8?B?bldGOU1QRjJOeWhtWG9VWlQ5ZExnTHZ0TXRUek90a2xIemN0eXREYUZiTFRS?=
 =?utf-8?B?Mmdma2tGTnpBUnlrZkJyUVFLYXg3L0ZMWEF6TUsxNXV2QWRud0o1TEpWd2dM?=
 =?utf-8?B?d1daRmRSUkpMVUI1Qm1lbDdLK1JZWWxTdkVhQ3cxa3RVMGdHYUR6SEV2WnUx?=
 =?utf-8?B?VllkTTN6MkZlL3ZGZmxYVys1cGRTQ201TzVmZUQ1S3l2VEhMZXh3ZElYaURZ?=
 =?utf-8?B?TThxR3orQTZyaGE3WW5sSHBFT2ZBaHk5NlIrL0lUa3lPVVFvZWRsYXhLQzVK?=
 =?utf-8?B?U1pCWXMwYlZwMkJUWmRNV3FkWTZkdlplb2xtYnEvZTYxR2FGRUJDV1g1Qm9y?=
 =?utf-8?B?R2lmMXczSzFJNWtUMzhpWUZ4L1B6QWdRMWxmU3dUU20vYyt0dm9HdUR4TG1t?=
 =?utf-8?B?Q0R6VzI4U0FHQmZPQjYrdTVXYmRRNjRSL0U1SE9wd3JNQjVhU0VOQ1JsRVR0?=
 =?utf-8?B?R2ZsZnllL1hNVE42em85SlAxVUUraFphT1BDRkpRVkR3a25FTkNKUzdXQlBE?=
 =?utf-8?B?VlFkZVpjR2Q4TXNQVXcxQVpaRGNEbVhnRDY3OHk0VFhkQUQyRmQvaEZNT09Q?=
 =?utf-8?B?bE5mOE1kWWo2K0lJanhnVWVELy93SVV5cS9ZbDNUTDdBcElKK3ZLMjEwUnFM?=
 =?utf-8?B?KzZBVy9rek4yRlpWMUQzaFhzVDI3RkFyQ3RPbXZaZVFaWFQ2RXU1T2xiS2Uz?=
 =?utf-8?B?Q2MzV2JZQzF1WFRac3dmVHMrZnAwM1dBMk90R0FqeDRMZk5RcEJ1MEVQeHow?=
 =?utf-8?Q?OjXXtbcUmkxtx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjRnTkM4WWpQaGxJc29UbklPYTNKQUZtaVA2NE5LYlgySlI1R0pYYnJjR1Ev?=
 =?utf-8?B?cXN5TGlxakJsYmRuUnUxTDN0TEVFaTVuNmdXNDRUbExXeVNEN1ZwbHY5eW52?=
 =?utf-8?B?MERwaXlyL3hhblVyRExiS1F5aEpIUDZUcUxaUlJsaUZzWWgrc3JGMVZZRE5s?=
 =?utf-8?B?YUdnbDN0Sk03Rk1rT3FjUjNROU1vRkZxS2ZRVGY0bHRidXVCYjhtcFJTYmhU?=
 =?utf-8?B?UkozMFJONVI1dm1HVVhsNThkNGNJTnlJbEFxNzNqazFUMk1lRmlqQWFJZFI2?=
 =?utf-8?B?ZVNBeHlGVkJmdU5RbUx3L0NTSWsrNXcrOXk2enNzcm44QjBUdm9IWEhMN1NO?=
 =?utf-8?B?OHdyZDNma2NlRGczOVFzZHQzclhzYXdscDVXQThrbWhLSWNJTW02c0ZVNjZy?=
 =?utf-8?B?ajFLUFZpeVVtUmdVM1B3RVdHdUQvVUFzYStWYXZmeVY2bWp2N3ZWdTdvR0Jw?=
 =?utf-8?B?eFBqejRUbjM0MnRybmtJVnhHOWxPUVRTQ3J1cGQxTUc0ZzhVMS9IdW9tazBz?=
 =?utf-8?B?djh4eE9YVW8rWGZZaHcrVHZReTJCc2hOMWNWYlRLejBmSTFjeVByWkxYbHNh?=
 =?utf-8?B?dng1YlRqY3hSWm5KNUpSZXBsVFBkenhaL3F2ZGdBNWtSSlYyYjgzNkxGVktJ?=
 =?utf-8?B?ZHQ4eXZSRkd6ZUZzNnVURUpDMUxrdFNEeFBaU2trOTZ2WURjV1I3MUFhNXZF?=
 =?utf-8?B?VXpjN2ZNd1VSb2dWYmlMeVNKaytiMWlrcFkwVHQzNXVpbHlEMmpOWDhpR1I0?=
 =?utf-8?B?b2dKTFE0bmprVW9paU5TcmhXa29IZ2Jnc0Q3NEE1U0tNYnNzRCsrRXZMSWg5?=
 =?utf-8?B?b3NMYjlOTTA5a2l6clB1akFWeWdzM0JIZmgzaW9QZ0w2aDJkeFRkbHdneGtT?=
 =?utf-8?B?cjdlaDJtZmYrOVM0aDYyc29TbkhpeGtCekhzenJ4MkZYc2ptdklrbUw4Wmwr?=
 =?utf-8?B?OWF5WU9NR0N2bkdtRmRSbDUxeVMwMHJnSGhvQmFOeXpDSXN6N2lTdkJ0aFJs?=
 =?utf-8?B?U013WU9VYlRERHZyN3R6UEJTVzZQUzU0WlRSTlpBOWVBdHJMdWl5bmgyTlRm?=
 =?utf-8?B?YW80c01zREtZT3RsUGk4UGw4dVgrVDkwR3dGN0lWZ0hJa1o0Q0pYWW44dUxr?=
 =?utf-8?B?MWxyVUgraXR4cjRxaWowOWFUN2hLd1QrQzB2ZW0xdFZaZElwbWErVnVJeHgw?=
 =?utf-8?B?SnZLK3YzR2d6R0dMQTBHa2lpRmhJK056TWdkenhqNi90aC9EUUYyWjIyMFNT?=
 =?utf-8?B?VW4wYTg4a1o4MnA0U2pmRFlxSU1KVG9jWXhmSlBGeThONmc5dE1mYjY2VnQv?=
 =?utf-8?B?V3dUVTJ1WDJuR0RlRkpPN2Y3R1MwdThVMXRtVVUrUUcyUDhISEladTBHMG11?=
 =?utf-8?B?cGFxOU1ISUhBVEFiWVJORXdZWVRFbTdZQ2tVNVh6RUw1UVYxY2lUVW9GblZZ?=
 =?utf-8?B?Y1h0RDg3NTRVL2dOZFBsb0lTUzIrQTZMejVlaGs0SHFFc1dzZFluWFFESmYx?=
 =?utf-8?B?d0E2M1U5SGdzRlVXVVFsQTZja2FJTHN5bkhORU53STY5bWRLV05hOTNMV0FY?=
 =?utf-8?B?VjlzWFhYWTYwZ3BYb3NjVytkNENSZjA3REM0VXNiNWp1RVIzSUNBL3daRkNS?=
 =?utf-8?B?Um1vekw1Vm9KRUhzeFg0a3dmbUVNRVg1djZRQ1FMdWdYVXNsSTQxSEkwM3cz?=
 =?utf-8?B?U3JlWlhTZnR4aHZrYUFLcG54M0tsWFBXYVRjZWFpUjVydWo0L2pVVG9KYkQ2?=
 =?utf-8?B?UjM5RUtSK1ZFa1hzeXBmUUMzZkh6U2tPdGZwSEZwd1lzL1NEUmxUQVJMRjd3?=
 =?utf-8?B?RWR5VFpuK2xFL0tWd2hiWFB6WFlHdUFXbDhUZGhuTFQrUEtYVzZvcEN2eFVE?=
 =?utf-8?B?cDdHSDRIcHNBYXdIU3lscGprY05pb0pKUEN3RWdtVEZPV0pSRXhlUjFFZU9B?=
 =?utf-8?B?RGpTYTM3SE44T3F5VUlkL1QzMUFiZ25EUnp4ZXBhVUlYMHp1dEx4UjlqSTZC?=
 =?utf-8?B?MEVEbldXTXpVUHJMWjJjMmIvb2s4ejl4K1hMRFYyUHZuUVdPK09IYzBXelpp?=
 =?utf-8?B?S3B4OEVnQjYxL2RKR1ZreUd5MGpRVzRaRk5kY0F0dGlJS28wUTNkaDZUMnlw?=
 =?utf-8?B?NFFzTXgvYmdkY0dRbHh1SHU2OEtFd1VtS2Q0dWpKcEJPa1VNeUJiZlp2dnR5?=
 =?utf-8?Q?mDonQmkXgLxREQZLXz/lJQU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5398c7b-adcf-42aa-4af5-08dd212a5bac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 19:13:16.8068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzFIhNfkbjoMKlxTpN+Wera4JI+TgYk/OaVIVs+Q5tH77eUjyRi9f7Zi5oD1R+nZzacTWUCN7YHjJldN7AvXzcJtZSf225lPrQ1Hl+uo/ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8273
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




On 12/20/2024 10:02 AM, Kamil Konieczny wrote:
> On 2024-12-19 at 15:05:15 -0800, Daniele Ceraolo Spurio wrote:
>> The driver variable is a string, so we need to pass it in as a variable
>> for the driver name instead of stringifying it.
>>
>> Fixes: e5edf7ea7 ("lib/igt_kmod: add support for Xe driver")
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Could it be merged first as an abvious fix?

I don't have merge rights to IGT so I can't merge myself, but I don't 
have anything against this being merged ahead of the other patches.
Note however that I've just posted v3 of the series that should address 
the last remaining comments, so it might be worth waiting and merging it 
all in one go. Either way is fine for me.

Daniele

>
> Regards,
> Kamil
>
>> ---
>>   lib/igt_kmod.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index ed283c14b..d73cb4101 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -723,7 +723,7 @@ igt_intel_driver_unload(const char *driver)
>>   	igt_kmod_unload("drm_kms_helper");
>>   	igt_kmod_unload("drm");
>>   
>> -	if (igt_kmod_is_loaded("driver")) {
>> +	if (igt_kmod_is_loaded(driver)) {
>>   		igt_warn("%s.ko still loaded!\n", driver);
>>   		return -EBUSY;
>>   	}

