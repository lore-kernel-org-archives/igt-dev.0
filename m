Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62087D3B7E2
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 13:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E2589FA7;
	Mon,  8 Dec 2025 13:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjCGR6SW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9094610E09A
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 13:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765199714; x=1796735714;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=obvadsIMgGECKUqWJ8DwTbX9iXQ/rqInwmzg3dSF0XM=;
 b=kjCGR6SWiqpCaxm0ydFMr3N9eW8NL6XNtFiJJbNC3sG1XRjdQdkeZ5oY
 Su9qQIhyDjv0iiLMo+6ZcgdxH9yWwXL/AE7YLE+BLiXnV5JTUUoPApgdd
 ewbPGLWr0cq8wcdqdrvFRTR64ByOIvrE2ccVDGVoI4MqswKCfucG8hWxa
 SQTzx71zEjT6kqx+PhZ+AGYbYLosXxuniZ2o67Yv4RY/KQoYMtPp7xlGa
 P9wPUw7ARNimTyNUMvxk6LHBDSKZmgjXdtKXJYVAhKfoZxRRDCZwhLswf
 22OARPXt/+hGLq4leWom+5sdgIfrm9SzIexD0UXNkE7Gm1x4jZoSS4M1b A==;
X-CSE-ConnectionGUID: 3ay1wnR0Srm3QWn1YwLmPg==
X-CSE-MsgGUID: KCNn6oJBRJigeh1qhqhVSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="92615854"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="92615854"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:15:14 -0800
X-CSE-ConnectionGUID: v/6u0V/vRvW9PqRCqZ+ukg==
X-CSE-MsgGUID: Unfj5umUSfWFRsyAwsf2KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="233305166"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:15:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 05:15:13 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 05:15:13 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 05:15:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tparaAlIkfcwrE2x18dHE8gI2UcvO28HC5i4SjvZoStTkywaz1pEA9oyEg0JMoBTN3d08Ohugg6BFl6IaoSHsVCgi+8t3vJ5mXaog68WMa9aAIVL9mfnK3lOjmDWvJZl1Q1CFqmJwt1yZD4M3z2ZtWny47uDwZDUvLsEYLjUuvUPsHE308G1GEjkEycAueCV+bzf53MxDvywKNNDfygzurUG5VsfgddGsToktiI6eg41FyQXorIyRcGo/pq52/pzGYYqeRKCZjchbtZbjDfC8PzIXaXtISFgkgFF00phgNGcvtQjLXK9D785Bk4fF6AGYHyisaklYra3qF6mi3hcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpuVnSOSv5K8+rrrAYt7qiI/LTTMdFBuEYsfwHvlFss=;
 b=DcihYfOlfRicWtvFGyetuizupDDneZCGcIlFbh2bmZYNuJlB9YT0zoBMk9I3IFsaQAFh1jjBZiEjORrfTRS/oC92guNWg24IjrbJEv0owsO8tFO+/W8xPJKgYH/3Ap9rLPxLlBGKTqsHi0YAxg5TUsXZGoCvClkgmywpLaoa6+u+Oo/G4N9Ur5ZFjsQ5mYJgA9wBcMTIBbWrdkQIH+hER7VmGcs68P4CafjlguSd+Wgc1OkeBKB4rWEIKWcJTm8Y5mPMSyxBDK72lq6LB+QdavSaw7yqDf0epC7k3TKbPDsxs9yDFJaPqAUWRHXPA2sRtWG14dFQVigwkPT3PHZWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SA2PR11MB5003.namprd11.prod.outlook.com (2603:10b6:806:11e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 13:15:11 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 13:15:11 +0000
Message-ID: <ffa35f06-20f4-483d-9221-1d60c127678a@intel.com>
Date: Mon, 8 Dec 2025 18:45:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <kamil.konieczny@intel.com>
References: <20251127094043.3916839-1-soham.purkait@intel.com>
 <20251127094043.3916839-3-soham.purkait@intel.com>
 <20251205170257.ziuhcoetjvxnr5xa@kamilkon-DESK.igk.intel.com>
 <e326c74a-a228-42fb-b748-94dc51e94fee@intel.com>
 <20251208100444.smz5sxa5k5tq4t5z@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20251208100444.smz5sxa5k5tq4t5z@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0204.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::16) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SA2PR11MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: b60700ef-0bf9-43c2-4cf9-08de365bd0c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0tpd054NjJ1NStLMlVmZ3RWZ2dkRnpHNUhXWHFSUEJtMm01QU1VY0FkdkpZ?=
 =?utf-8?B?d1l2cEhUMGlVZkNMZmlBQ0YwaFQ2dnptUDFHYXRQS1hzeFVMeVZvcERsYXFz?=
 =?utf-8?B?VVB0bHpvc1VEQUxuSG9CdnV0OGoxNjhIR3NDWlNidXBGdGt4MzhyYzcvOWd3?=
 =?utf-8?B?WktSdndtTjNYUGlHbDlYcWt4MThzOGh6MzJBdzJSRWJ5TXVxdXcvQ1N3RDNH?=
 =?utf-8?B?a0VNOWRYQzV3ZlRlUUg5NzZPS1N6OGJJV2drN0tXc3U4SHJFcE9lRFJIeHNh?=
 =?utf-8?B?QTNLTnlCM1R5SXAyZktRYms3em00aUZOMjJWT1ZybWg0cFprV1RMN01uMlhE?=
 =?utf-8?B?RTNjZmxxNEdsTFZNa2JYNFV4V1hrK1p1dFcweGV5YmY0eXhsU3JUUS9iRXAv?=
 =?utf-8?B?dWs2YUVDVmUzSmRMSUxHVnZva0szcVNMbnEwYWlkSHhGZHNFeVdDUThDaS9J?=
 =?utf-8?B?cmRyVzBNRlhJbk9IMkRyaHBoUTQvTEFrNWxPbnBzc29yZnNxalFlbGhiL1dl?=
 =?utf-8?B?UEJOYmh5RC9ScVkyRmNYNkRmMFRJbjRDbm1DaWYvRC9sbTJMWFZXaGZrTGEw?=
 =?utf-8?B?QytqbnJFWmFrZ0hKcitCODdtYVcvNHhnNmtXRDdhRCtUeVhXYXBDUTFHVVA1?=
 =?utf-8?B?QzFsZUFPRjJYQlhsaWxrZ2huOU03OEdzdUUyZ1JmbkhxMi9MaHRmbmQxOU5r?=
 =?utf-8?B?c1ZKR3k4cmVmNFY2NHdPQkVBTVJkK1Y0c0dyM1VXdjUyRUdxQnZMWllnL2Ft?=
 =?utf-8?B?QlZ2VDJXb0NFeGFuM1FSVlVpYThwYjdCeEZ5NG84empXNldWWHBNR0U1MGE4?=
 =?utf-8?B?akwzcUVjZVRvYWsyMWl5YWFjMjQrVWt4UVRjYXVSRUlhcm5XMUIzOUxQcTBj?=
 =?utf-8?B?K2xnZVNSakJycVcrVUtYTHRqem45ZGZ0OVBXSWxjNlBsaUR0ZXg4Q3hxRG02?=
 =?utf-8?B?MXBoMkJ6UXdnOFM2NXVRaEZDdEY2cWxIem5uNSttcUIyeVVPdlBYQ1hmTjBC?=
 =?utf-8?B?Q21KYmJHZDdNeEhwaTAyNnlEUTE2dEZjUlVmYVFOclBSTU5haE5UODVvbjR0?=
 =?utf-8?B?V0dzdTdyNEY3UlA5Ym9jeSs1Nkl0MFhaaXFXL2h1KzF6RzBnc3NRNFFaTzZP?=
 =?utf-8?B?dTZXTWZRQ3djYnJqSWNtSTZpaWYxUnBOQmlKUW5ncFpRWmcyNlNyNE9xdENX?=
 =?utf-8?B?Q0FNTHYzSkFKMCtZSkxqdnJEelRnaHQ4SUlycTBPY3d3UmV4OGc5bThzV0Jy?=
 =?utf-8?B?eDVnYy8vNE1lb2dWNnRIaU1PYUVIYTBmYXVEMitacStLejV0TDg2MXNoTGRC?=
 =?utf-8?B?aHI2alk1aFFnNmlmZVh5Y25ZWWhFSEd1NjhmU3Z4R1JDelFPR2wwVk1oNkxL?=
 =?utf-8?B?NzIvTmhNZVdWUSszYVcrc2VBN000cW5NeDhLeU5qYWlvc1RrdlVtKzFLMnVE?=
 =?utf-8?B?Y1BWWjQ2c0FPOXdBVVZ5emxjN2d3YnpvaTltbk1Xdk9wNFlmbEl3OG5oUm1X?=
 =?utf-8?B?SzVkR3EyNFUyckZBeFhLYW9LUWxXdEI1c0ZvZDdzaE4xMmp6UW5PUER1NUh4?=
 =?utf-8?B?emxFM3NadEVSdEU4TEN6WkNrMG5BemdDVnE2ai9QM2wwRWZOSTdYbHVBUTdQ?=
 =?utf-8?B?aFl3cHZhWitCTkZFSm91bEJhbnZIVkZLMUZyUUhlWWc0M0laVHprWURwKzJW?=
 =?utf-8?B?ZmZCaEY3Y0s0cEd2cHdRTERHS25SazVWdUhmcWRGeHhZSVZvelEwT1E5b1JW?=
 =?utf-8?B?MEJ1Zy8xYkdiYTNUcU5FQkxXN0hUeHl4d1hvRUxacVprRURvcHlxWG5uS1Vs?=
 =?utf-8?B?ZHBYajAvUDNLM2lZNTVsL0JnTXJuamFTaFhjRVRkQkNPK2p0ZWJVS1Qvd0Vz?=
 =?utf-8?B?OXh6bGJvTnRNY2FpQTY2YW5mRDQyVjRmZFE4RUo3Zi9QMlpsWFVvQ0tzbHQ0?=
 =?utf-8?Q?nA6O/9XHzv7aVoRfDThwWf/0hshn9ag9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkEyUWtFa1h5OGx4Qkk5RGVjdk0wR1pqT3VPc1VrcXBsR09PbFJsSDZmRTQ4?=
 =?utf-8?B?SEt6QkY5NUUwOEtzSmxLMENnZEFHVmdJczZRWTYvVUQxWnRNNU9EVEFDQldl?=
 =?utf-8?B?TmNpbldOKzR4K0M3Mnk0bDQ4bHV6SCt2SGx0U0ltSjJOcUEwSFJncEVlekFG?=
 =?utf-8?B?emRpLzV1WFhTZFpvekNGMXg2T2VtNkNXeVc1U1F5Q21OVTFVUFY3SWdGU3VT?=
 =?utf-8?B?RTdRVVFsY2N1YTVqZTYvcjVoQm9WekQ5NzlTSERidkRxbi9UbUZSd2tObitw?=
 =?utf-8?B?Q0xDSGM4Ny8wWURLeHF0b21XMWp6eEpoSk5INTlReDFMWVNvQTJjR0RsM1c3?=
 =?utf-8?B?Z3kvQkpieEpxNzMzSkNBcy8zeWlIOUI4L04reVJmUVZ5N2JqZDFSTm5SWHFa?=
 =?utf-8?B?ajduT3BOTmJZN1YyWDZKempWVFl1T3FGMTUxTFUrUi8xcHh4bjlSMFJUbFJZ?=
 =?utf-8?B?NG1SRnYrWWxPS0d2ckowMFFmajF6RW9HYVlNcFM5UjRRczZ3a3pGRDZ2S09a?=
 =?utf-8?B?Y0xxbzAySkdMdloxOFJKaE5qWEhKZHlFb3E5bXVoOFhFb3p2aDRNVzh0aGZM?=
 =?utf-8?B?ZmtVaTB2YmdkTWd2U2gwQkdJTlFGeVN3Njg0c1hDdS9NTVdpVmZvazBmYUlK?=
 =?utf-8?B?di9vK0laTXRWRFFCYUZqdytlVmUvRkNPNmpOYWcvbkRnTWxoOHNNNlA0S0lF?=
 =?utf-8?B?bXh3YnE4c0RHM2RHdzdSdzEvcG5Ed3N6aEh5SFBpaUlqenJVRlhVM25SdDlh?=
 =?utf-8?B?aEp4WmphTTdxVi9pcm9xUUJlcEhJbXBMaGRlUk9Ib2NpcjB1VEZtaEZ2Vml6?=
 =?utf-8?B?bGRWNW9BbVdOL2NOdGc4eS9PaytHd2FGUGpJUHhLUll0eWFiQ3g2UEUyMTR2?=
 =?utf-8?B?NkNxMUEwQVNYNXNmdEY2Y1JvRWx3WEhDTi9uMVArckdaYWlMdU5DWWlDWDhE?=
 =?utf-8?B?aW5qdWMyaWdCbTZ0SHJHOUs3OHF0RnFILzd0cE55UFZCSWJnUWFpK2ZGZmRM?=
 =?utf-8?B?VXdTc2VXamJsamU2OElqd0EzSzRycHhOZjRiTHpuZWh5WEp0UzYrSndXcndN?=
 =?utf-8?B?b3VtemZsR3FQcjlubG15aUQvUFdWa0JDQzV1clFYUUpPUGxIOW5wZXMycmlN?=
 =?utf-8?B?eXhoNjVuRmtKbkNvU3JWcmZjQ2ZnYWRiRzJIZkxZZzZldFRPQkhCTkJkOTF2?=
 =?utf-8?B?ZmpVRW05T2xkbWllUnJCVWFJSjY4NUFiL2J0WjhiRzRkaFQrNmd1bVBtME90?=
 =?utf-8?B?YUdPZ2pNbjQvZktVZVdVKy9obXFtVDFXZllhZ1ZQQjVWejgvOEZTa3JoRUtY?=
 =?utf-8?B?Z29mMHR6RmZkVnBFUjYzcXBnUlBmVmYxNmIvRXN2dm55VExnUXp3N3ZiU0ZK?=
 =?utf-8?B?Q0xXRmJXSFRXVTR5WGhLMlhHUnBiZm9PTnl6MHZVNFFPelY4ZjhRZ3dzV283?=
 =?utf-8?B?R0VJUFVjLzl6REtMTHBIQ1J1NXBtR3IxSGZPdWRxQmRmRk9HQ3JqWngzRERm?=
 =?utf-8?B?bDJBNUxkSFBkeDZHTnBVM2JSa29neFR3bU1BWUZUQ2w1TVpwbGoweGRFSFJJ?=
 =?utf-8?B?YU01SWxJV1I0WjlrVnNZdVZHUjZTT1p4U3F3NjNGRHlXTnYzM0tZZ1I4ZDAv?=
 =?utf-8?B?bE1aVUxzbktVbmhiK2UzMEpnTFpBNjhGWk43VFVoM1R3RUd5OXB0UTVMYkhQ?=
 =?utf-8?B?Z0pEUlNBYmxWcnZPSExVMlk4akJMZnhsOUJLdk02Q3lSTEZWV2JWQVlLQVlS?=
 =?utf-8?B?YzNKTFNGZTZ2bjBpT3MveTkrT2JGekE4T3R1cVlGa1YrM1k2M1cxUVpwd2N2?=
 =?utf-8?B?ZUY5VzJvUjlxRkdSeUhiNDQ1ZzBDdTB3TktyTTczUmVjUldmeWR4WHJPTVBm?=
 =?utf-8?B?ZXhMRlpWZUt5cVl1YXF6U0ZzTXFlRzJDSGNVNFBSMzdnQnhWM3lTQkF4RmtF?=
 =?utf-8?B?eC9aNFZZNzlMcTNZM3R5UUFGZElIUWE4endOSDRaZU9lblcyWktOQ3ltNVdC?=
 =?utf-8?B?VlhySlVxMFFxSnl5SG5TQkVqMUM5YXZtUDhlUFVRRUcyM1UwcHFaU2hVdTRO?=
 =?utf-8?B?Vk96RzdISWpDaHoydWxJQjI0L2ZsYkpLdGJTZnBUSmZTUmdyMFFocVFHTUk3?=
 =?utf-8?B?cDNOejNialB6Z1dZM3Q3UHJKeHhMc21VNm1SUFRlamx4bDREZTlRdEVLOS9Y?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b60700ef-0bf9-43c2-4cf9-08de365bd0c9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 13:15:10.9611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzpk9641XLA0glWwZ6/QsQHTZzTsr/oiuZOwCKWtnjMby6RysiRlQxG9NgM3hxUjAG/EpvrDdCy4P9BlorayGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5003
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

Hi Kamil,

On 08-12-2025 15:34, Kamil Konieczny wrote:
> Hi Purkait,,
> On 2025-12-08 at 13:38:50 +0530, Purkait, Soham wrote:
>> Hi Kamil,
>>
>> On 05-12-2025 22:32, Kamil Konieczny wrote:
>>> Hi Soham,
>>> On 2025-11-27 at 15:10:43 +0530, Soham Purkait wrote:
>>>> Introduce vendor-agnostic support for handling multiple GPUs and instances
>>>> in gputop. Improve the tool's adaptability to various GPU configurations.
>>>>
>>>> v1:
>>>>    - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
>>>> v2:
>>>>    - Add device filter to populate the array of cards for
>>>>      all supported drivers. (Zbigniew)
>>>> v3:
>>>>    - Cosmetic changes. (Riana)
>>>>    - Avoid three level indentation. (Riana)
>>>> v4:
>>>>    - Add user message for running without root privileges. (Kamil)
>>>>
>>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>>> ---
>>>>    tools/{ => gputop}/gputop.c | 253 ++++++++++++++++++++++++++++++------
>>>>    tools/gputop/meson.build    |   6 +
>>>>    tools/meson.build           |   6 +-
>>>>    3 files changed, 220 insertions(+), 45 deletions(-)
>>>>    rename tools/{ => gputop}/gputop.c (63%)
>>>>    create mode 100644 tools/gputop/meson.build
>>>>
>>>> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
>>>> similarity index 63%
>>>> rename from tools/gputop.c
>>>> rename to tools/gputop/gputop.c
>>>> index f577a1750..4d6c684b2 100644
>>>> --- a/tools/gputop.c
>>>> +++ b/tools/gputop/gputop.c
>>>> @@ -1,6 +1,6 @@
>>>>    // SPDX-License-Identifier: MIT
>>>>    /*
>>>> - * Copyright © 2023 Intel Corporation
>>>> + * Copyright © 2023-2025 Intel Corporation
>>>>     */
>>>>    #include <assert.h>
>>>> @@ -14,66 +14,149 @@
>>>>    #include <math.h>
>>>>    #include <poll.h>
>>>>    #include <signal.h>
>>>> +#include <stdbool.h>
>>>>    #include <stdint.h>
>>>>    #include <stdio.h>
>>>>    #include <stdlib.h>
>>>>    #include <string.h>
>>>>    #include <sys/ioctl.h>
>>>>    #include <sys/stat.h>
>>>> +#include <sys/sysmacros.h>
>>>>    #include <sys/types.h>
>>>> -#include <unistd.h>
>>>>    #include <termios.h>
>>>> -#include <sys/sysmacros.h>
>>>> -#include <stdbool.h>
>>>> +#include <unistd.h>
>>>> +#include "drmtest.h"
>>> This tool should not use drmtest if possible. The main reason it
>>> is a tool not a test, and drmtest is mainly for testing.
>> This header is actually not being used. Let me remove it in the next rev.
>>> Let me explain how it should work in pseudocode:
>>>
>>> for each g in gpu_set
>>> 	p = get_plugin(g)
>>> 	if p and plugin_supports_gpu(p, g) and could_display(p, g)
>>> 		display_workload_by_plugin(p, g)
>>> 	else
>>> 		display_using_old_gputop_method(g)
>>> 	fi
>> If you mean to call intel_gpu_top in case of i915 driver, yes it could be
>> implemented as a workaround but in that case it world not work if
>> capabilities are set to  gputop using setcap as execv() or similar call does
>> not preserve capabilities even if the pid remains same. In my view, it would
>> be best to incorporate i915 support for gputop.
>>
>> Thanks,
>> Soham
> No, I mean gputop before your modifications, not intel_gpu_top.
But in that case it would only show the per client busyness and it is 
not possible to run without root using added capabilities for per client 
busyness.

Thanks,
Soham
>
> Regards,
> Kamil
>
>>> This way you do not need to implement plugin for i915 as it will
>>> just work by fall through. Plugin could just extend printed info
>>> when someone calls it with root/sudo or group or with added
>>> capabilities.
>>>
>>> If this is hard, you could also consider creating new tool, for
>>> example ngputop (n = new). In new tool you could make new
>>> assumptions and ignore GPUs for which there is no plugin, also
>>> demand having root or capabilities.
>>>
>>> Regards,
>>> Kamil
>>>
> [cut]
>
