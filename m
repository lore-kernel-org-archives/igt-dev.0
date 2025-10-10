Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8DCCCD187
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 22:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB38710E28D;
	Fri, 10 Oct 2025 22:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNKNI9fR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A5110E28D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 22:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760134974; x=1791670974;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gmJWBZ9gQTcanOLtogjguncbbPsosP5Jsx9HhLKsnpg=;
 b=LNKNI9fReqAmr16BMe3N521BZRVS8qZkFQYO/Qa3enqaVw2PRagOI2kx
 WFwz5l9KvjoVCKzI//Xbxy7YPC/uT4NElih4dWmWTVjV2INKfLRcHJ25c
 M61SSQKmfJpwD2W+XNTJu5x7eBwp5xW3BekwmlctNOWGyJTTRKxTwsPPl
 CbXfOlYBpz85J2jJcw3LBaDcsSWcryLi8eA6gCQC7jWA9PZ3CypYi9Xf2
 Aqi2yfv2o29PzcCqT9KGY32uRahdW7ZimROoIuveYAnKjK9+tlzFPLAlh
 1qetXNnjYvn5ztXQHz07fyJQzu5bzOt1qmy07wtLLfv9KH8AYSEO1j0So g==;
X-CSE-ConnectionGUID: GgXFWE3PSHaFBOgFNDnTkQ==
X-CSE-MsgGUID: sP/HfyWyQCCdIL9jEAMhXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62399647"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="62399647"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:22:53 -0700
X-CSE-ConnectionGUID: ihe8zyx6RY2RmLhtyPmVNw==
X-CSE-MsgGUID: QMvbWWn5RdmUNYuwDRoTNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="218178308"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:22:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:22:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 15:22:52 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.61)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:22:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1GFy6piZS7mUmAfaQewgp1eWq83Fz1OolOpgWsjV7o7VEUuAkmIz1beBvQo1EifIBZgR81y5/BSzkBW0TDhiiJw/54TaoR25QyfvUO3U6YnEX4Ly6bMuW2HCMzovnsvAMX38UKf8ThwwYOyJVQ9VlsCryn+/ZMpVQSqJOvdgdDDWN48GWC9XsH8Th1ohpPsPAoplTT9kL8ep7H0eHJOZXS2uBVH+oRZyGwlZQ/nIN792YNfEjGsj2Ex1NM4gfdIRWT5TcSrwAvkuA1KwgoT4/EctWihTM2IwDpnK1VH10E8mxzGhiQyoFI5LI8GtfgUN+TVjT67AjYB6GbtB6xKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcGXdJLeY0x1lrTOeh/NzloflvniGVYE8jkTwJRJiqA=;
 b=Qah9QFLzuildGMrkLdnRtCO/fJKDEhGsoQxba1ZvWzFsmE1hORKS361wlJx+qOxhjb7vcheYNyfz+Fcr72Ul6KHBJbu3dpiWDOYLTnX3HhuZK/8sN3n3WeNLSdEIfViExTVjeEXbZWhIOrVvxu1KiF8HfEbJyN5FkNrxWXn3Bm/3fjl4zM19+cmqlrD430zwcU7yXlcvTN/aZAmWe05KGe8D3qyHCM8I6Pal1MvDpNum6I2P0tqgVATRFCb4EaN2OU9ladysmc2kZ5U8zyPPkTNfIGxIBSKJcmrxaGgbCqJJQLwUifcm30X78kiXnRALaJ1ZVrl8HA1cvNRDL8yJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BL1PR11MB6049.namprd11.prod.outlook.com (2603:10b6:208:391::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 22:22:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 22:22:50 +0000
Date: Fri, 10 Oct 2025 15:22:48 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 07/18] tests/intel/xe_oa: Convert test_oa_formats
 to take an OA unit argument
Message-ID: <aOmHOBl9M9Lfj/6P@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-8-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-8-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:303:8f::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BL1PR11MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abbf616-4a16-48f9-a12d-08de084b8c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnBVdUJKUnVQYStTTm4xeSsvbG1qN3o4bnhBNnN5dURST01rT2hIang4RDVP?=
 =?utf-8?B?Q3hsYlVZdlpTUEt4c2QyVHpWQ3J0S2k3Z2doMktxUS9tRC9PTEYwd08yc1dX?=
 =?utf-8?B?RmtWaTFhYzExZnNkOTZGN1NGekZvWDBNeEhGY2pOSER4MG9vbE0vUi9vMHU4?=
 =?utf-8?B?eVNiak5EZFRzeXlZUGl0QXZYM0JUdU5SN3pwWEo5QVQ5STdFMFdWUVY5b1Vu?=
 =?utf-8?B?WTBxdytqd21jR1VnVENGM1FrWk9LK09LSmtOVTUzQTRTcElyZ0R0VndEeTNh?=
 =?utf-8?B?L2htOWJOWUJtVkcrL1R4MTN3VXRaVDVWVEIxUW5FUVRXUU5BSFduRWxsaXV1?=
 =?utf-8?B?OHIzM0RwQ0ozU0QzbFRWQ2s0R1FBRUREakpOOFNJSUpieFVjZXk0NVBQdUl2?=
 =?utf-8?B?NUVPaHdzVG1lQ2lIUGU2Z3BXcm5QUVBzMG9YQXdjQk5pZjBwWmhDWlBmYWJ6?=
 =?utf-8?B?Uk9ESVF6bTZZb0dsQUdZOVBjeGhUdkUwYjJSaWJXNWtQN2ZNOGlTOGIvTm5p?=
 =?utf-8?B?ZFUySkFJdmRQM2xzVGlXdlVqVW1OaEgvMGxncWpqQks0YTcvRkhyMVFsOUFa?=
 =?utf-8?B?Wmo1KzA0MXpFcUdqWDBlR1hucUo2VWk3aU9yZ2d3RlZPbEV5VlhUUE9jY0lx?=
 =?utf-8?B?bWVjY0YvUjlJaXJlNFB2ampzUkVnajU2b0xUeDI2ckNYdTZXL3RsQW5SdmxJ?=
 =?utf-8?B?QU5xVjMrVVJzSUZSc2lUZlpHN0h6QVpwS3NveUw0K3loV3YvS25KRzNlNzZV?=
 =?utf-8?B?dzRrMjFyN1ByaTQxbDR0aG1IWGE0RHF3RXBiRWM4Q2hvWFlKNDArUFljYnFB?=
 =?utf-8?B?N0FjUGYyenpJM3k2SEFtVnAzUldrN25ad0gxVTU4MTZHOGVvd0dOeTg3UjNI?=
 =?utf-8?B?UGtlU0F6czBEd1dDMTRiN3VwMlZIcWpsQVoyZWZqV2VKamUvNStWSm9BbVdj?=
 =?utf-8?B?TlZiQ1dYQ1RPQTg2VExxaWwvMkJZTUdDV05mVElRNTNIUjdHbGhyVGNpR2wz?=
 =?utf-8?B?S0ZXazV5Y24zVUJTUEtEeFVIUGFxQ24vUGFNT3NlQXBVUmVxRnlJeURmRDYw?=
 =?utf-8?B?Nm9nMGFMTEYwYWVzZ1JTWi9IS243Y1BmQjRTRjJKQ0NZY2doZFVxcjdiTTVH?=
 =?utf-8?B?c2wwMGRVdEdmZ3NvckJ2K2wxNmgwYkhCc0V5UUVlYjNWNnBJaEUxODZvWkxV?=
 =?utf-8?B?dVh5L0RHSFYwa1hVRFExb2VzbmFEWkRseWdWd3F4UkRORG0waHJjdEtMV1c4?=
 =?utf-8?B?Y0RTZ3BZYnpuNlRXYS82Vjk3SSs3TFBNY2QxeDh1WGRZSnk0QXVnNlBhYnpW?=
 =?utf-8?B?SjZDaVhPb1NncUVYMDJ1bWxqMzdtbzhUWVBoQ1Y0dWtzc25iUDhiUXZCSXUx?=
 =?utf-8?B?enZqeUFSYXlHSW5OTWl1UGI0YnBXcXdtelpXaWYveDNDOW8rZlZ1L3Jpa0sr?=
 =?utf-8?B?SUkxMWtPYmwxTHJLSUNnYkdVa0lLcFNvVndHQnV0NXl5OVowYkJ3aXJ4d08v?=
 =?utf-8?B?SG9INXJSejhMeUpGaVZRSjlmdjh3LzlhSW9CWXBLYkF3ckVtck5DSy9vdWFr?=
 =?utf-8?B?MHRxckF0djRxVldyWnRycUMwQUtnRWpHYk1yYzNwN21hak8rUGZTKzl5WUZn?=
 =?utf-8?B?QXlwT1p3MFBNUTY3SUlrM3VuMnlWaVVUTTdyTTB5Y2lDWDNlekRsbGZvZk5o?=
 =?utf-8?B?TWlZWTgyUk01c0JmL2tNajVjUFVvTVZiV2dRWHFxWHlhMEtHOVgxdkNGNWVF?=
 =?utf-8?B?QUwrN3ExcmJkY0RNNjdYTEp5cGV0OU43U2lUSXorMitEME1kdmg3THFQUUh2?=
 =?utf-8?B?OHk3djUxYWFjTEZ6Rk00bnJueVBKdFhtTmFiMDdBSk5oV1NwRVNNcmhlQ1FK?=
 =?utf-8?B?RlhaaEREWnJwaVVKYmd4VDRJQVNDL1dQV3JjTHFVRlAzM1hIYXJ1ZUhBcDRj?=
 =?utf-8?Q?7+OG+WapVArultYjr4a486WrdBrfN6rf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3d3dTN5MllpNjgvZWJiS1I0b0E4YnI1YjNMNWlSd041enQxcUZnTmRtTUxu?=
 =?utf-8?B?NjRyYlVMZlEvME5JV0FNS1dxZFRsa2tmUXB1dEZyQkFUMUIzWDV2MERSSjhx?=
 =?utf-8?B?TSt5dDM5V2p4UEcvRzVvNitwdENpR1o4bHorSldOY2RmSFRYY2ZmWUwvMTdx?=
 =?utf-8?B?SytESlZidG9IbXBNN0I1Z0k1cUlUWDNaMEltRS9lNTVEbHA0RC9NUGlydDVX?=
 =?utf-8?B?NjdCWVpLVXlzUmRLQUJsY3pjeWpCd3UwVXM3TjNuT3ltYmJUMW0xVnJUVExW?=
 =?utf-8?B?bWhJRWFDazY1TkJSSU9aOEJzZlBma3laYjgwSlNpSDNwSUVWKzFxanRHMzR5?=
 =?utf-8?B?TU9ENjVFUk5UUmJpRGNwbW4yeDJTY08xa20yVk9NVm84MkhlS0EzMHhMVk5I?=
 =?utf-8?B?bFRlTWtRQVNOb0Z4MUxIM3Q1aEdkRFBUODRvWVpwSjhkQUVlMnJIK1QvaGU4?=
 =?utf-8?B?Yy8xcjBHV1JoWjV1QTdEdnpCQlR1cFd5ajdQODdZb0FkWm4rellzRGdxdmhz?=
 =?utf-8?B?YlhyQi9mRlFIZTV1TU5BNlBJTFN2NXB4WTVyWk9xb2I2N1NsME9YN1pPMjdY?=
 =?utf-8?B?TjF2VlZCV0RHTHNqVUZoOUtqTzRmd2huTUlReFR0eGZIam0wckZQb0FPUmpu?=
 =?utf-8?B?YUlqVDVPcU1rcEJPdS91ejZYaDNVR3VUZ1JvN2xwL1dQNzJJaExxVGZ2TytL?=
 =?utf-8?B?ZWh0VEsrNHpNYk8vbjh5LzhSeDZENlMzN0JMbVV5UDlTU1lSV1BzZ2hpeVV3?=
 =?utf-8?B?NFV6Q0lqbzh1U3hOSFlIK0ErT2J1SFhNNE8yS2tVR2xOWm9JTDBpQnQ3UlJz?=
 =?utf-8?B?amV3RFRQWGMxS2xwOGZ2MW4xWXpWT0IwVVd3QTdSaEFicy94dW56a3dPVEtt?=
 =?utf-8?B?S3dEeHJMTlp4Y2dyT2F5R01KVG9nb0E4TVh2RVNHR3RpSVl3NEtLZVdrRG4r?=
 =?utf-8?B?RCt4NXNQcTZ2VzQ3R21DNm14U0JwVlhxZmhhOHlaL1dHV09YUDZJbnppaERD?=
 =?utf-8?B?WXVnaU0vWHNCcVpTYm1WRk9JRHJSS3AyYW8vODlUa3dRNkFVVDV1N2RJNWFI?=
 =?utf-8?B?S1JCWHJtTGdaekNBWEJnTjNTcTZaRXViQ0RWd1VYenFXeHg2OFkySDg2YzFo?=
 =?utf-8?B?eW4rVkdhZnBsVnRmMHNkU3VlWFBvR3hxUTRmNDE3dzc1M1czdnk5R0JMVlJU?=
 =?utf-8?B?bi9FVTgzMEtsQUh5QjB2MXN1LzdDNFBxN05iUW9nVjc1T2tRajBOK2NxdDdY?=
 =?utf-8?B?MGlBYTJaQzRqam0vRzlaSmt5ZXdTZGFHUGRsbkdUb01zUXlIbWprcGhGK2J6?=
 =?utf-8?B?VTB5SThMOXdPWlJyQ0oxQ3laMjFvRVU0STBReEd0NGkrUFAxOXE4TlpXRHBF?=
 =?utf-8?B?VzRuaFpnOWpIdDloWkt3QU5wWjdET2paQlltV0FmOVdFbXg2V3hqYmV4TzNC?=
 =?utf-8?B?MVpmTHRmZXdxRUV4TFpVQTdsOXY2NU1IREZONVBsQlIwUCsybCtscnNXbjJW?=
 =?utf-8?B?NVRYUys4aFVnTFlSakF6dUNlY1RZL2FhUXpOOEg0WUtFT1NneHJVblNzbzJ2?=
 =?utf-8?B?bTdUbWFZSTVQSjdZUGhKcEh1ZXR2a0wzbHhKMFBOZ0N4ODlYc1FiN1RZWFFL?=
 =?utf-8?B?YlczS0NBR0MrT1F4L0FINDVZOEExZ2pRczhqTHc5aG1DSmV3dHVoWXE3ZW0w?=
 =?utf-8?B?UXZrSHQrTkEvNUxsOVgwcE1nOXFuMU9YR09DdWo3Y081dDZKYVBpcHJDcWRK?=
 =?utf-8?B?L2duNDNiZm1JZlV1UnN3MnRSUGJ2R2NkbzBXV0hvNC83V3RNSnlKVXpsc3ZO?=
 =?utf-8?B?V05kN0x6SmJleTBBV2xRNlpvS1I2alFJNHQ0TUZZY3htYzVsbC82bmpDOHNr?=
 =?utf-8?B?c0ZTSVo3YThvY2Y4dG5iMTJTZGRUelpmUnByd281MTlUc3FPL2pFQ1VmclU5?=
 =?utf-8?B?cmZHTUZsMmI1eXNXTUJlOW4vVzZyMG45aVVJRnA3RytwTFdGb1R2RGFnVXh3?=
 =?utf-8?B?UzNDc3pyZTFXUWYrNlFOdzYyaWJ1WkNTOVN3MkdhVU80UUdOT1NGd2hiMGNy?=
 =?utf-8?B?RTVUWTlhenNnWWNveGl6cTNWL0FHbTB2d1JPMXNQdzdjNkkyUVUzSU1MSGcz?=
 =?utf-8?B?Y1Q4RE5qOTlHb3BjV01nYzVTTGo4Q21SMGRob1RmdnJ0ZnpsV25GRUZMYWNG?=
 =?utf-8?Q?YUdPmZxwwAKahYc48reH18o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abbf616-4a16-48f9-a12d-08de084b8c4c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 22:22:50.4317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxL0/+NpXYE1KC16D02cSCYWmkdWUFe5vHmflTWVgPBR92Nt29SgQmpiNnIKTuJxQrgek502Mj12YVgjJ9qxuqQZ4+TPHltC95pKO/wk08c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6049
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

On Wed, Oct 08, 2025 at 02:17:54PM -0700, Ashutosh Dixit wrote:
>To enable OA IGT's to run on all OA units, OA unit tests are converted to
>take a 'struct drm_xe_oa_unit *' argument (instead of hwe). This patch
>converts the first unit test (test_oa_formats), so it introduces this new
>infrastructure.
>
>OA units are now identified via a name (corresponding to OA unit type) and
>id. OA units are longer identified by hwe, because some OA units have no
>associated hwe's.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>---
> tests/intel/xe_oa.c | 92 ++++++++++++++++++++++++++++++++++-----------
> 1 file changed, 71 insertions(+), 21 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index bc71bfcd30..af01a79d38 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -327,8 +327,6 @@ static int pm_fd = -1;
> static int stream_fd = -1;
> static uint32_t devid;
>
>-static struct drm_xe_engine_class_instance default_hwe;
>-
> static struct intel_xe_perf *intel_xe_perf;
> static uint64_t oa_exponent_default;
> static size_t default_oa_buffer_size;
>@@ -340,6 +338,54 @@ static uint32_t min_oa_exponent;
> static uint32_t buffer_fill_size;
> static uint32_t num_buf_sizes;
>
>+/* OA unit names */
>+static const char *oa_unit_name[] = {
>+	[DRM_XE_OA_UNIT_TYPE_OAG] = "oag",
>+	[DRM_XE_OA_UNIT_TYPE_OAM] = "oam",
>+	[DRM_XE_OA_UNIT_TYPE_OAM_SAG] = "sag",
>+};
>+
>+static struct intel_xe_perf_metric_set *oa_unit_metric_set(struct drm_xe_oa_unit *oau)
>+{
>+	const char *test_set_name = NULL;
>+	struct intel_xe_perf_metric_set *metric_set_iter;
>+	struct intel_xe_perf_metric_set *test_set = NULL;
>+
>+	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAG)
>+		test_set_name = "TestOa";
>+	else if (HAS_OAM(devid) &&
>+		 (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM ||
>+		  oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM_SAG))
>+		test_set_name = "MediaSet1";
>+	else
>+		igt_assert(!"reached");
>+
>+	igt_list_for_each_entry(metric_set_iter, &intel_xe_perf->metric_sets, link) {
>+		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
>+			test_set = metric_set_iter;
>+			break;
>+		}
>+	}
>+
>+	igt_assert(test_set);
>+
>+	/*
>+	 * configuration was loaded in init_sys_info() ->
>+	 * intel_xe_perf_load_perf_configs(), and test_set->perf_oa_metrics_set
>+	 * should point to metric id returned by the config add ioctl. 0 is
>+	 * invalid.
>+	 */
>+	igt_assert_neq_u64(test_set->perf_oa_metrics_set, 0);
>+
>+	igt_debug("oa_unit %d:%d - %s metric set UUID = %s\n",
>+		  oau->oa_unit_id,
>+		  oau->oa_unit_type,
>+		  test_set->symbol_name,
>+		  test_set->hw_config_guid);
>+
>+	return test_set;
>+}
>+
> static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
> {
> 	const char *test_set_name = NULL;
>@@ -381,7 +427,7 @@ static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_cl
>
> 	return test_set;
> }
>-#define default_test_set metric_set(&default_hwe)
>+#define default_test_set oa_unit_metric_set(oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAG))
>
> static void set_fd_flags(int fd, int flags)
> {
>@@ -1548,11 +1594,11 @@ open_and_read_2_oa_reports(int format_id,
> 			   uint32_t *oa_report0,
> 			   uint32_t *oa_report1,
> 			   bool timer_only,
>-			   const struct drm_xe_engine_class_instance *hwe)
>+			   struct drm_xe_oa_unit *oau)
> {
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	uint64_t properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>
> 		/* Include OA reports in samples */
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>@@ -1672,32 +1718,28 @@ print_reports(uint32_t *oa_report0, uint32_t *oa_report1, int fmt)
> }
>
> static bool
>-hwe_supports_oa_type(int oa_type, const struct drm_xe_engine_class_instance *hwe)
>+oau_supports_oa_type(int oa_type, struct drm_xe_oa_unit *oau)
> {
> 	switch (oa_type) {
> 	case DRM_XE_OA_FMT_TYPE_OAM:
> 	case DRM_XE_OA_FMT_TYPE_OAM_MPEC:
>-		return hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
>-		       hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
>+		return oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM ||
>+		       oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM_SAG;
> 	case DRM_XE_OA_FMT_TYPE_OAG:
> 	case DRM_XE_OA_FMT_TYPE_OAR:
>-		return hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER;
> 	case DRM_XE_OA_FMT_TYPE_OAC:
>-		return hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE;
> 	case DRM_XE_OA_FMT_TYPE_PEC:
>-		return hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
>-		       hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE;
>+		return oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAG;
> 	default:
> 		return false;
> 	}
>-
> }
>
> /**
>  * SUBTEST: oa-formats
>  * Description: Test that supported OA formats work as expected
>  */
>-static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
>+static void test_oa_formats(struct drm_xe_oa_unit *oau)
> {
> 	for (int i = 0; i < XE_OA_FORMAT_MAX; i++) {
> 		struct oa_format format = get_oa_format(i);
>@@ -1707,7 +1749,7 @@ static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
> 		if (!format.name) /* sparse, indexed by ID */
> 			continue;
>
>-		if (!hwe_supports_oa_type(format.oa_type, hwe))
>+		if (!oau_supports_oa_type(format.oa_type, oau))
> 			continue;
>
> 		igt_debug("Checking OA format %s\n", format.name);
>@@ -1717,13 +1759,13 @@ static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
> 					   oa_report0,
> 					   oa_report1,
> 					   false, /* timer reports only */
>-					   hwe);
>+					   oau);
>
> 		print_reports(oa_report0, oa_report1, i);
> 		sanity_check_reports(oa_report0, oa_report1, i);
>
>-		if (i == metric_set(hwe)->perf_oa_format)
>-			pec_sanity_check_reports(oa_report0, oa_report1, metric_set(hwe));
>+		if (i == oa_unit_metric_set(oau)->perf_oa_format)
>+			pec_sanity_check_reports(oa_report0, oa_report1, oa_unit_metric_set(oau));
> 	}
> }
>
>@@ -4946,6 +4988,14 @@ static const char *xe_engine_class_name(uint32_t engine_class)
> 	igt_require_f(hwe, "no render engine\n"); \
> 	igt_dynamic_f("rcs-%d", hwe->engine_instance)
>
>+#define __for_oa_unit_by_type(k) \
>+	if ((oau = oa_unit_by_type(drm_fd, k))) \
>+		igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id)
>+
>+#define __for_oa_unit_by_type_w_arg(k, str) \
>+	if ((oau = oa_unit_by_type(drm_fd, k))) \
>+		igt_dynamic_f("%s-%d-%s", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id, str)
>+
> static int opt_handler(int opt, int opt_index, void *data)
> {
> 	uint32_t tmp;
>@@ -5057,8 +5107,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 		test_missing_sample_flags();
>
> 	igt_subtest_with_dynamic("oa-formats")
>-		__for_one_hwe_in_oag(hwe)
>-			test_oa_formats(hwe);
>+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+			test_oa_formats(oau);
>
> 	igt_subtest("invalid-oa-exponent")
> 		test_invalid_oa_exponent();
>-- 
>2.48.1
>
