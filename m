Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509ABC3DA5D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 19:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57DB10E2A7;
	Mon, 22 Jul 2024 19:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bW4Os1BO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BF410E2A7
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 19:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721676116; x=1753212116;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=zcGnBKZ1gNTjXURBLWWNqlexLVT88zOd5SaV/LZ5cn4=;
 b=bW4Os1BOHY8PudFQoYFNASGCBv7nrskKfbyj18qoS5WlXeHXhlmPaxoe
 jvvBN07KjHqMVBRLaSpL9PqCj88cdHQE3he/sr8RFymxPM8B3vD5VTj+O
 rGRhGFvnQ4M3wWCm1VxIIJmXq7N6CwvoaUToJjnlXQ1MVcqkKgtOGOmCZ
 /0j9A3onh3qKNcwxBgqoUFceomIj7RWAiTUbluDO8hME+AM/PmJ/8Z4AU
 fyAoJ/t04ZdwButSZsFpZ0yCpWkljlJZdZQqFotEnSDLJwYqGWwtANNke
 qLV8RECU7S3nbhUw6fhebHF9mV6zynXYQau2YD6gXkWIXacQpHQ7P52uD Q==;
X-CSE-ConnectionGUID: tyF/AsXGSXiJ37UEqVTkQw==
X-CSE-MsgGUID: JjMqT7+CSZqNkLndHYMa3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19229837"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="19229837"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 12:21:55 -0700
X-CSE-ConnectionGUID: UY0TkgnCSWCqm/0biawDiw==
X-CSE-MsgGUID: 7xq3yoWYRCC47vu+lFQB2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="52037940"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 12:21:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 12:21:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 12:21:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 12:21:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 12:21:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/xBeYkJoXU6U5eI5g3/Ytx5MJRfpieV2Vbsc0SgoMSWUEsIsBI9Tg54kVVA/MP+YQ7E1LDj3Q/D+6q8wYyAehB/O0r3tNodcjxeO9TO4nBK2WgzJN3tjpdjtbzq0+/nz7FhJhg1c/V57EB0HlRdWoq4CbqSlVUeJbu6D4uFRtr/24jOM7T/uYNBQ5/ZbKDVJBY4M50PjfSKpWlRUlfBgOMo0cBQHAjxs9wf87RHFn+mhibfzaLr0NnX1sVRgb2ONQrJgJ37VvfxKkeLXIyxslwJLxlt4zlaZdkT+ES1LRat3yD/jwLA65Euq1X67mPjMuYe02NpQeZNWCaOH720ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnQKw6VJnHwNIC3s1PT87v8UcQQ7EFsEU7y9s7+c4QQ=;
 b=gS++MUrnwMeVhnKf9mXtCB8zSkNAW0ITzd+CUg7qMv4VvpA+Ugk2yTO5zjGmlkWhwiPH3tlugbOB96BHE3cZ8Nzu1Ng0etngMM64oOpBIVx7Ru4P9P5LYKqsJuO+qtmRvyoU/OL5c/UPnZ0LAuhquAB4oqvAmVAPuqZ4yfo122kjd2Aj6SGXxhvQEWqs0FmChbrFHSi4X53ConsRBvdubf2LycmcquxIH9aGrDUKg4yGoZTnxhDaOhiYx7sINtSpEghmQcJNriyA3jJK+dq7+SFNhacHeQG325dM7Cy7dP+gTQ17Ws6agUVqOiML85Hz7t8Cez1cvDV+IQlBo5Qo5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 22 Jul
 2024 19:21:51 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7762.027; Mon, 22 Jul 2024
 19:21:51 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240722183511.1934050-1-matthew.d.roper@intel.com>
References: <20240722183511.1934050-1-matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_query: Also allow IP version less than 20
 for BMG media
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Mon, 22 Jul 2024 16:21:45 -0300
Message-ID: <172167610552.66043.11002162041385018761@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::10) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY5PR11MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 34544772-1750-4a61-01f2-08dcaa838a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEcwMlZHbXhWa29lWHh2YjhUaFBVUjFiSHg3ckFIdnJSSXlFdWlDVkxaelZQ?=
 =?utf-8?B?bThPd2Zad3AvVFgzNEV2YlVYMWxEc3pWdFVFaDFWV0w2WG9ZbGlQN1dtTjJL?=
 =?utf-8?B?ZnNSSHJFTDlKS2FnbXU1TUM1MFh1K3hDcUhGZlA3NzlaQkhmZXhxT2dBeWNZ?=
 =?utf-8?B?Sk94RUxhekRSWGR1YjBYd01DRDRRQk9TMkZRV3BkemNFa1BTWFVWdTYxWXFm?=
 =?utf-8?B?aGlJa0FKcTAxd0JWVStYaDVLN2xjcGZXMlFLMVk4RXpQaU9DVDlyZERaUVZQ?=
 =?utf-8?B?aTNjVmNkU0MxNXlNL1hmN3EwK0srTW5DekpzUTFERlNhZU11bEdiUWw4Zy9V?=
 =?utf-8?B?S0RGb3BrcUt5RnlxL1BEdUpNTUJOdWpwdEpsLzZPTm1EbnliQk1Ga1lZRHRW?=
 =?utf-8?B?bTVxOFI1bnhwbGhHZ3lZTjhMUUxJUEl4Q1d3dUc2WXl2UFZOa0I2QkZKRGNQ?=
 =?utf-8?B?amtMRUlxYXFScnpWdmFKYkd0Y2xSVEhkMjVnQ1N0UnQ1bXlrRzdNOHpPMDBZ?=
 =?utf-8?B?aUl4cnZZZVR5bG9lczI4RXBITmpPTGNzbFJGdHErRHd3YVhTcEQ5ckNGbkxR?=
 =?utf-8?B?Y1dZcFJkWDQ0R1JHcHcveE93aDhjYjFxeS81dGxwbXViUFFJQ2EzekV0N0Zz?=
 =?utf-8?B?QnRhTU40d292MFpIK2x1MGFldG1VQkxxbUYwUVdJeUQyZkU2dlBQa1ZaMlpj?=
 =?utf-8?B?VWR3dlp4OFhFS3I4d251alllY1NqaVdEVmhYQUh5U0ZnVUM2SkthWmxNZVVv?=
 =?utf-8?B?akM1MDhhdkdUTVFtMnZHdE9DSzRoTTJ4RnpaUzBvRktHT3ZsV01BaDR3dkNP?=
 =?utf-8?B?eFExRFRNZEVlSjRsVVpHOGJNNG5UcnhVZzA2Y2syMG9pWnNsc2JlUkFmOUZO?=
 =?utf-8?B?TTlzeUZyQW1vNjZEeWdBRTNyU3cvSE1QajY1akRCUm5IUE9sbHBld1NsWDJJ?=
 =?utf-8?B?ejc2eUZqUWphYm9XT014d293UXR4V2ZUQ3pMTVVXVEJNc21HcmRuZGhtajRx?=
 =?utf-8?B?V3JPamFoQklvUUlSUDMwVjA1cXZZdWlGNlJSYnNib01WUjBmSGpGaGNlV2JL?=
 =?utf-8?B?WlgrZEZVbmlWa1BkL3VtajZVV25hVDNPVWQyckwxY0N3aFcvSTNiQWxuMXZm?=
 =?utf-8?B?SW1qejlCc0luK1JVaUx1SnlKM0RqT3BPTVhBdEVlY3RqdHZPRnh6TWpqcGh3?=
 =?utf-8?B?byt5QnFsejFTakhhbTJnMEhUZ1BBZVBhaU1UYlgxK2Z5dUdYQWNMRzA1U3B4?=
 =?utf-8?B?T1NDMEJ4Z2hlRHI3b1FlcW5CTXdwcU9tN2p5NUU1T21YZXc4OTRPTFN1dWow?=
 =?utf-8?B?cXJrQ2NHUU12V2h6em52K2ZXOU8zeEtJWDF2NTcyRnNKNktvalluakFiL0Rw?=
 =?utf-8?B?VmdyYzhIZ3E5TFh4Qmx4US9ORHUvVHlpQzdNdkpRS3pCakR1TG9XUWNINkJY?=
 =?utf-8?B?YTZPOGZOaXV4M3BlYnIrZ3FNN0dZTktIV3F1c0ZLaCtCd0xvdDlhd1BmQTUw?=
 =?utf-8?B?SWRRVkhXcVp1MWxiMCs3Rk1iTnhCTEhIMWlLM2QzVERidlNjY1VKUGtxa3Aw?=
 =?utf-8?B?ZHBZVE8wL0pVWHlQMHFNYzNhRUpkemtmNFlqUmMvZm5GczRWbXJ3S0VQZlQ3?=
 =?utf-8?B?SVltTGVDRWFMSHRQTG9mKzhCK3JNeW1ZbHY1eW5RT2NFSjBGSDNiaVZ1ZmdU?=
 =?utf-8?B?aDNnSmlwTjg3L3VXMUkzS2RZMnB5cnk5WVNSU3dPSi8yT09IVk5RZVp6aWl4?=
 =?utf-8?Q?7XvfoXFqBnQlLh+mrQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mkh2UG1xVW1lWFo4U21vUjRSQmkvTkxPanI5ZGYwNWNqakVvMFhYc0VwTjB5?=
 =?utf-8?B?RktHY0l1SkxpaStyaCtadU5lTytIQ2RDT3pqUzNMNzBvaXMrVWlRejFXT0ND?=
 =?utf-8?B?bi9PVUdqdnBkWEhHUGkwUWM0UkpYWjI0K3liR2ozd1YvcnVmMUdyeWxGMXpm?=
 =?utf-8?B?Vk5LWk01WVNkZGF1U014cHNzNGE5aDNHMktQdkI3NTdxSTlEK3VnOHdyR0R2?=
 =?utf-8?B?WVZIYllwUHROcjA2eU5mdTNnZ1VRbGFZOHdadWxXVDZEdGJTcTBNWmdBcUhB?=
 =?utf-8?B?aXJXY2IyK1pEMjlIcDVQY2c3b1A2YWI3NTk4SE1EUm0rbzl6K21pTFJEOXlk?=
 =?utf-8?B?am1MTG5RMTJrNVJpSlJwRjdaVllIb0dpbjl3dEVtZzJMcklLRWtjbFNVbzhZ?=
 =?utf-8?B?bVAxcGIyazJHbzF2aEZIcUQ2ck02NTBiR3c5TE5TTjRyRU1vV0dhMTNJT0hB?=
 =?utf-8?B?MitjcnZIN1hlZU1LaFhYTzkreStWNDZOQXpRWE0xNWpyU3Fja0FkRS9OVnZR?=
 =?utf-8?B?aStVS2F4K2NnMDcvOVJjRlFXWFI4WllKZVQzUHd0RDJwMkQrdVh3d2laTnRR?=
 =?utf-8?B?THloYml3RDFQMWJsTVF6TmQvbEtFZXpyNktYRDFnb0tib3o1c2U5c1ZNd0xJ?=
 =?utf-8?B?bGZEQ3hTVTF2WitxZGtEMStmZnpOTklvTjhZV1VhT0Y3eHVTNWtkRHpjQUV5?=
 =?utf-8?B?YXZRRVNmeEpkT09rUkRMR3JFZ0JtVVhVWXlhN29YK0lBdmpuMXdnYUpYVEI4?=
 =?utf-8?B?V1RCdVo4ZDhWUFpXUkQ5YjFJR2M4TlN6Z0J1SitocmR3eml3SUtBZWZ6ODBj?=
 =?utf-8?B?UjJjOFJoQjF6Z2dKd0dkQmZPOTZEcGJJajVnS2xnekN4Y2lFOVNva2Y0ejZM?=
 =?utf-8?B?RlFwUEdtbTBQK2NEeERYWkltMUsxTnhkcGx2Y3BpOEs5eE5HMjc2bnZHSW1O?=
 =?utf-8?B?WWpGZEpqMFpKQmlzUHFHdkV0MFFTRzBMdWR6RmJFR2JsU2ViL09xMDlFYS9i?=
 =?utf-8?B?ZURJaE9Dd0V2ZTRZcWpwbGhrRGdIdUNHYVErL2dpUXptYjQ5Vk9tM2I5UjJi?=
 =?utf-8?B?Nm5iYS8vYlB6ZldRWFcxZlM2djV2eUtReUVJV3FveWw1c29yOEduOVEyVzEr?=
 =?utf-8?B?cHNyOVpMOTdPSEI5c0VISXN1Z3ZPdGQxbTNzOSsvNXhPUm12TFkzSHJML280?=
 =?utf-8?B?RkkrMUljKzgxd1VMZ29zWDlHbnU2N3VKeXM0TUJUYkdVMTk4VjdFZVVOVk5I?=
 =?utf-8?B?QjFESitSVitHUEJ4d1RPaVVGVnhEeHA4LzNRU3dLNDZHdldNU1lNamVyc0xx?=
 =?utf-8?B?S2dGUXBLSVc3bVA4OWpyOGxPaEFkU3VJbEtOdWhwSEFzalF3RC9LeU5wRkFW?=
 =?utf-8?B?dWFSczMwZ3NCVHQvNXZna3FBaWJuS09wSU05SW5hZHNOdUh5Ulo0V2RnQyt1?=
 =?utf-8?B?NkZsKzgwenozcVg2RWZySHZqeUJ2ckxRbnBOdzVpKy9nWWpGMmdrUEpUOHNl?=
 =?utf-8?B?Y01nUnBNdWwxNnVQQmVOemhiK2JpdGJIdXpaYldWQ3N1bXJPb0p3b0ltbWRH?=
 =?utf-8?B?dFRqZGR1aFJhUXk1MDVKUkVvTHRVTDA3SktCTlZrV29rV1l1Y0NlK002WnVx?=
 =?utf-8?B?SDhSYmxlL0EwTXphMHZZaFk4UnhLeVdBblNUM3FDczB4MGxTcnhUTERVeTRu?=
 =?utf-8?B?T3k5YlBWK1RBVVBUYmlkWi8vcHlNTi9jMWhEWUJ5djh5WldMREVlSnVsME5B?=
 =?utf-8?B?VDU1YVVhZkdFR2ptYUNXcmJXM3Z3Q3FON2R5WDJ6b0g2YUt2RE8vc3FrWFpO?=
 =?utf-8?B?ZTZDQW1xSFhIN0FDa1RPN0VpK0JZQkt3eStlSGlRbEF3VXIyaUNXbmY4Ukpr?=
 =?utf-8?B?bE93NnQvajd6OFlMdWhsS1VhVTNUS2YwbVBwcEZidWZid2xqakdsdEUvOWhy?=
 =?utf-8?B?WHFuUjRaNUczOVFsTzRCUVdNWmZMbVJLbndLd2ZOUFNzVEJnMlhPTDNKNzRR?=
 =?utf-8?B?ek9KZFNDN1Vtb3JKZlBmOVpOTlRRaVRuWUpYdWJ0T1puVHNBdTZlaDhmOFVP?=
 =?utf-8?B?YVByWFhXU3lxeWJPaDdKR2FkVVY3V2pWSEJsdVlxdlA1S2xCUkErempSL1hs?=
 =?utf-8?B?OGpMT0lmT2sxS2pCUG54ZHpKTUxnOEYxcU9sZ1ZpNkkvQVc4WDRMOUtLV2Yw?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34544772-1750-4a61-01f2-08dcaa838a26
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 19:21:51.6049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdnLgv/pXotz4oBIt4rDFuGhNppxBCNE7CKmB9sqojuGE09Bv4QOXotpp4xdoe/J2foSdwDHm7i5RnPAEryLeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
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

Quoting Matt Roper (2024-07-22 15:35:10-03:00)
>Since BMG has a media version of 13.01, MTL/ARL are no longer the only
>cases where we'll see IP versions lower than 20.  Add one more exception
>to the final GT IP version sanity check.
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2238
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> tests/intel/xe_query.c | 13 +++++++++----
> 1 file changed, 9 insertions(+), 4 deletions(-)
>
>diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
>index 84df24f49..c13613e0a 100644
>--- a/tests/intel/xe_query.c
>+++ b/tests/intel/xe_query.c
>@@ -331,11 +331,16 @@ test_query_gt_list(int fd)
>                                 igt_assert_lte(1270, verx100);
>=20
>                         /*
>-                         * Aside from MTL/ARL, all version numbers should=
 be
>-                         * 20.00 or higher.
>+                         * Aside from MTL/ARL and media on BMG, all versi=
on
>+                         * numbers should be 20.00 or higher.
>                          */
>-                        if (!IS_METEORLAKE(dev_id))
>-                                igt_assert_lte(20, gt_list->gt_list[i].ip=
_ver_major);
>+                        if (IS_METEORLAKE(dev_id))
>+                                continue;
>+                        if (gt_list->gt_list[i].type =3D=3D DRM_XE_QUERY_=
GT_TYPE_MEDIA &&
>+                            IS_BATTLEMAGE(dev_id))
>+                                continue;
>+
>+                        igt_assert_lte(20, gt_list->gt_list[i].ip_ver_maj=
or);

I get the impression that this section could be refactored so that we
define the minimum expected verx100 and have a single igt_assert_lte().
Up to you though.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>                 }
>         }
> }
>--=20
>2.45.2
>
