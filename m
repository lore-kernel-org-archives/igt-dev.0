Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E7ACCD184
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 16:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232B210E22F;
	Thu,  9 Oct 2025 16:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G06L75Tl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD5110E22F
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760028051; x=1791564051;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mEns+MutCXhjoeZwNPkB0Cw0+BYPFsJ2R2fSheRjY6A=;
 b=G06L75TlgyMdU1V+Bzd587vQTGAufU+x/ZoX/5XDlodo3oD250FoR2eR
 vvczJaHlk+K4GDbLd7Zx27ezVbLVjQd5TER0AAjNRbwMcfkrcH+31pwjg
 PxfT7+NBfKy/uxr9OY2Myeur4MOFqSi06fUqzY4v5hQvYbDPwi/mZXLk1
 KDM4WYz7yEBb9zW7RKRLHBv6Zkyx4T4xk6iZzTTwlSfz0r85Gc5IqAaxH
 S9711wILcQLns/XoTyOeaqpbFWfjOep32FWYrC8vJg0ErF10sjuS59/fH
 hUhtaTNlxb02mPS6Bpb4j6uui/4hq7PWkuzuCiZmfbQcOwFG933WTjm2c Q==;
X-CSE-ConnectionGUID: l0eh5zNYRjawcfPl+3mqlQ==
X-CSE-MsgGUID: RrFt6QSkRqSiZh9ZlfGp1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62285880"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="62285880"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 09:40:51 -0700
X-CSE-ConnectionGUID: G6tEEHRyRxG1yROBZ3eRPQ==
X-CSE-MsgGUID: 5xDucAi2QEmncl302xhSUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="181526813"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 09:40:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 09:40:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 09:40:50 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 09:40:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCQxBL+JTACf1cwqBWwoTUTYcYn1Viu1EllZ/tkETAJ49Eo3IbbB+Ir8i5Jx2WrucXYVHdGKBIpJG5utsEPfzhbvOM3BQ/j8hByg7JbPhfrNvmRbHgs4nkHX1zu3cLr5VJWuDem7Zk2MCxWiVsl8WiMApyjMlQhIbsqhjq5VQ2xvT5esevOLzHYuenqOz4rPE86YfkDm79YX6GBCzBEVq8n4KfE5ASBw2oaz7Kc8UESYRQr0egoafjF2BJi0zPQi8Qct5MAM/g+W/CgBEyzhV9uj0Qcp8775HIGLlORTSj8ESUW+M0AwXoClrOLC0B7XDHJxGc5c32axqAZGTvOlgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PD9ZqhYjoZjwcN9rUptQN++54krYaAGBF0KtD/jLx4=;
 b=tZz9wAG5z38Rbbiw671PdQ43i9LBMV9VI7Fz8lAgpnv1OhUM8BZj1z+wyV2Avsm2Qtaowytbj7znqUkxvumbDVueMC1vatGVz1TMsWJlPN/IiYXHlQvzo1nSi+4yDdS1EGhytXLsZn1dfZL1NHXruA86+XyAtj52MgEhqyrktw4mYOvhoYyp8OwmY8SDp0ui8SXiCulTRZFKOBZpD2V/MsQe/OnltIGX/w6WDegv8x3+bGbdsO5PEB8QLkQNafHE/6JN18fPozzKZrKwwYcLtlADbVmK6rvXvnnEll/A4FKq8PtZjplPwc1EiTRV6C2vvX28kfUDBLr8n8vGJ+prTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA0PR11MB7694.namprd11.prod.outlook.com (2603:10b6:208:409::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 16:40:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 16:40:35 +0000
Date: Thu, 9 Oct 2025 09:40:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 06/18] tests/intel/xe_oa: Add for_each_oa_unit
Message-ID: <aOflfRPZBJLT2Eeh@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-7-ashutosh.dixit@intel.com>
 <aOb0S1irIDU44xj6@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <aOb0S1irIDU44xj6@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: VI1PR09CA0128.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA0PR11MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e279934-602d-416d-55fd-08de07529216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0ZkSWdvdFZNbUJaczQrWEF4Ukd1bDA0KzQ5NHJsdjVubHdJeC8wbkxDZWhL?=
 =?utf-8?B?Mld4VWNuSHJrNng2eUtmZk5pci9uZC81VGovUFU0RE1wWjQ0eTkwQ2liaEZR?=
 =?utf-8?B?Yy9RTUs5U3BkQTArY1pWNnkzS1hIYjNDUGppRHNLZVQzdzJHMDJUNkVXcTF1?=
 =?utf-8?B?QWNkQ21sK0trTDhFb0Zpc1lQQ2tsdDF6TWwxalJRVDJOaERDUTlEdDd0TXIz?=
 =?utf-8?B?RE1YQ3VuSDhiMmpKOEppQkxiMXBQMFJRdW1PTTl1cEJqV1BSaHdBdk42UDhS?=
 =?utf-8?B?bVBHdmRaMjNydnppbXE0UkUreVRlekh1ZTZRYXBJS0NzTWU3cW4vN0VwcGpm?=
 =?utf-8?B?KzY4bVNMVzJnYXhDbG5KK1k1YzJON3V6cWhRY3preUJCRCs5SmdQVWNVWE9E?=
 =?utf-8?B?cjFwaE1EVE1LQ3V1R3RmOUJUQU9tUlROY09LMUlKK1VIcGJzOWdERWN5YU9L?=
 =?utf-8?B?c0N0TXpHWHJHNnU1WGc2MmM1VUNTWExWWlZ0Uk1qVS9qbXBlQUtQRmdVZVln?=
 =?utf-8?B?OHh1Q3BhR2N1NFN2UnhteTFYM2hNN0NHWFhMditzQTUvdW1qaS9CWG1IYXZW?=
 =?utf-8?B?ZnJ4cjZ4aWszc01ka0lhRTdoVzdoZjlGUjAyL1dvZ0lwMG12eVI3UDNqRDNt?=
 =?utf-8?B?ZTdZR3RKME1aQjNnc1ZqSzRmVjZoZ0ZRME8vR2h2SHpsZDA2RVRPdTA2MCto?=
 =?utf-8?B?bGs2Sk1RNGZlTlhUTkZxbzc1YnJjVDNrODZ4Q21FcVEybkhzWERwWWpUWWsw?=
 =?utf-8?B?RmRJY3Y1SVRneGE2MnFyS3V0a3k3YkxmQ1VvdnplczB6RGJrQVFPWGc1Mmla?=
 =?utf-8?B?bk1HbWtLeUVmVkJQN00zdldsUlZxSURhRDF0enlzS2lubUFaa1FHMXM4ZW1j?=
 =?utf-8?B?YW9HSVJyRUtEN1hVOXpJRlNvelVCaE5wN28xQkxIcHEwdTFkUDBDL2tKOTVQ?=
 =?utf-8?B?V3pSMEVsM0lGbmIvVENLdFlnSG1CZ2VodFB5alMrdDMyTG4wRjRNS0IyUk0z?=
 =?utf-8?B?WUZmTFgwMGlSYmFKUlV2U0pqRHlFUjZudG14Y3hVZGJBT1oxTmRJNUt4Z0pw?=
 =?utf-8?B?ZURPdmV3T1pOUnA4OC83QVlhMXNYL2dFSDcyQ3gwNkRMeCt4U0w0R2RZNTBm?=
 =?utf-8?B?Q1RIazV2UzhlTzMyQjArem4zVml0Tll6SUlSZU0zMzErZUIwMGdOR1haNlY5?=
 =?utf-8?B?UDFkcWwxUVFxNlNvclBlWkVuMUkyMGlrMDFrSmp0NWpnTkpKaWZzZTFIamwx?=
 =?utf-8?B?OStySGFxTTVEN3ppdDVqMW4vM05aZkx5ZnJlcUJPcGYvcTB3Z2JHWkVxblVG?=
 =?utf-8?B?Zy95M0M2QkErYU81a2NZUnZKUjJFTG81aW5xRWhEZmduNjBOdjdKTzlNc0VC?=
 =?utf-8?B?d2VLeld3RDVNTDc0T0ZLZG1SOHNTaHVYSlQxOFFuREl1NU1hb0FrN0NuSUFV?=
 =?utf-8?B?cFdqOC9md3dycVlCalYzcHljVC9sR3QzWFNFNHZBNERlT3VUd0hNVGFtNllo?=
 =?utf-8?B?Q1E4cXNPd2I1aU1IbzVFSS9obWdXMUJBV0UwbjM1SkNtWlFjQVViVWE1UkRz?=
 =?utf-8?B?NmFwTEVXeHIybUVoV29CL2JHQkdkTnZPSTZwcGlsOXpaenVCMFYxRHlsTVBD?=
 =?utf-8?B?d2ZmUmoxYldWUzV5QU4rYlBiQzlrU2hScU1sMS9WKytNSWl4ODcra3Q4V3NT?=
 =?utf-8?B?ZVFoUFFhTWF3WDk2NEVMUUZGRmpGU3BlWERFR01xME80TVRCQm91Vk5FblJ4?=
 =?utf-8?B?RGVJK1o1N29Oa1Uyd2Uzem1uRVl5cFlvM1B1SU5RWWY4L1RFRXlmNGh4RlUv?=
 =?utf-8?B?Ky9iWmxqWnE5a3BqaXo2NlQzeXkrRUhTWHc2Nnp0aUowRzlWU3JjMUJXU1h3?=
 =?utf-8?B?M2x6Ukx0N3BhaFRjTnA5SExyREJPZWYzMHdjbTBCSTZlQWtiVTRnV2NYU2Rw?=
 =?utf-8?Q?e1QbMf/0/gfTzvORc/MJ9hasl+3qCzsJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dll1ZkM1QUpMV3hEQ2RaN3J3eDRMOFJGVmdaZ0t5WlE1ZllFR1BxdjkxNURS?=
 =?utf-8?B?YlIvNlRNUXR3WEFpSDBVTWplNXZNQ3JGek96bzF3NWVtd2J3aDhHQ3I2QVkx?=
 =?utf-8?B?UUNYeExIRVBqa3YzRTNnOHJNYk81Y1JCbG50QjJzTnpmZXhLSnQ4NkVOWmtN?=
 =?utf-8?B?Nmh0eU8xa0I5YU10c1E1SWx2b2NUQzgySVVocE5DN2laWVJEcXVsdTFtWmNw?=
 =?utf-8?B?eEl3ZkdwOHBtS0VqL3BldjNJbnFPUUEzdzlSd0NsMnlvbUJHWW5Ud3ZEMmM4?=
 =?utf-8?B?QmJuMVlsYzVGblR1citOdHh2K3VESmc3Tlo3MzliNzdJZlg5REdRYTZnTDlG?=
 =?utf-8?B?VzFpRmVwRHVSWnR3Y2tjTWR1U2dXRFJBNUZtWG5mV1NUalNoSTVudnlvZFFX?=
 =?utf-8?B?cWg5QmI3c0xFbXQrRWZuSElIQXlHMTdERldhelVVbmFseUxSRUxIeDFudVMr?=
 =?utf-8?B?czYrdmJrOExiVEJoTWh5aUtTUWZmZk5zVlRTMHhZM21zSHdUQVF6aDQxWFdZ?=
 =?utf-8?B?dXVmRWJMWEFaWDVhbnplc1VPYktKUHdtRk81VmxERlVqSUZzSitWYVJEazVR?=
 =?utf-8?B?Q2hzbnZSV0lheTkzWkhJWHRtQjRpaUpkWm5SbTFTK2E5SGY5V0hGVXQrNkls?=
 =?utf-8?B?aWdIL0taUWF1M1JEZHpIV3pJTDluY1BMR0ZkOTc5SUd3NlFWNHphdHZUOEJj?=
 =?utf-8?B?c2pYUnZRZEZXR3g5VTZ4VlE4M3RwSnBLZ3J0ckZuT05PVzZrMCtReW5ZMzd5?=
 =?utf-8?B?REN3YXNBcXU0UnV6MFdtN05qbUZDYjB6QTBIN3ByZnpxQ0RKVW9EQjBXVmFk?=
 =?utf-8?B?d2ZiSStxSDJ3Q2NvazAzMDFWajFPbzYzcFdoWVpocmdmOHRCckpGUlBwWjFT?=
 =?utf-8?B?OWlRTHBYMk84aFdxaitpeEIxOURjL3FIWkg4WUZ5VWZXMjdtSThnVGxXeXNV?=
 =?utf-8?B?cWhOWmJiRnNkc3JHR0xhM0doT0JESjRHdXFMV2pycmsyL3dQWUpnOFJ1RjR0?=
 =?utf-8?B?VGltbCtMZktWRUVUZndpb3hTZzdWbHJCQ29PLzFVK0VkdllIMlhTRFhkS1BL?=
 =?utf-8?B?MGNqNVlMbEI5SXpUcFRNTHR2Wk93ZE9mYjB5M2s4S3pFVnVmQ2o2dGVENWc4?=
 =?utf-8?B?YUt2NzVZRjVJMFllZUF6Qm45QzNGODFrTFhEelYwTHhseFVCOVI0aWkyYmRs?=
 =?utf-8?B?S28wdGhGNmNKUkJwcmxCRzdsem1ubXVkNit5dENFYmU1c1ZIQVpJL3pOUDRR?=
 =?utf-8?B?SmJBcGs1cDMyR3VTK1ZkSndKbWw5b3B3WTlocUlKK2o3RWdzL2tQOWU0SUN1?=
 =?utf-8?B?WmZUS0hGcCtwd0ZDbVJjUTZLbGQwa1BwQVJzR2xHMWo3WFVyUkZvQ291UzNz?=
 =?utf-8?B?eExnbjliV3ZObVVVTksxWGpPdktjUWJXcStzUWM3elRNVzZ3Q2thOFJMN09u?=
 =?utf-8?B?NVZsWENhcFVuOW53TnpwOWFlNUVlNXNkYlovWHhlZXJLTDZKZnBvRXJsT1ZV?=
 =?utf-8?B?dnUyRjA4bS9nQm1zNDdneVNXL0JneU5VWEdxbUpwUlVPempwNlpjUlJJamhS?=
 =?utf-8?B?YW1JdGxycFBhSkZyeWQyTHVrVjIycTFRR1VEZ2h4N0VsWTFxWWZNQ2svRVF6?=
 =?utf-8?B?VzFSNWFQdXN3dlE1SmJyVkxzRlNtTnkwU3ZBNVhPOXdUQlVFVFNzcUxHVFlF?=
 =?utf-8?B?NjV4U0pIMHdiMk50Z2p3UFZ1L3RXYXdjaFBEOWQvN1NxUGlDMUdNcDdydDd1?=
 =?utf-8?B?cEFwVENvNHdXWGNTS216UndzZ1o3eGQvSUNHZVkxem5XVkpoZSs1Y3RMblRY?=
 =?utf-8?B?WjgwYmt1REhlTlFnNi9rUXdsc0VJdlVhOG5JckxOcFVDa2NYdzBjbVhCNUc3?=
 =?utf-8?B?d3JxalIzT3J5UVZ3TnY3NDFUaW1ISFFjRE9hdzR6OXNYbEMwb3N4UjVzM1pO?=
 =?utf-8?B?VFpDZFhnbFJMb3JTY0JyaHVTSTdvMWh0OTBVWUsyeEFhNC9HV245MXg3Q1ZF?=
 =?utf-8?B?TFFRUDNyQmhGTXpNbGdqejYvN1NzUWtRbFVBTWNPcDV2c3dCcGlzM2ZFcVdJ?=
 =?utf-8?B?NWpJTGVyRTB2RDY5MkZzTEM4dFpNWlRuNkJiMHVqNjlPenhIZWtBbHdyd0tw?=
 =?utf-8?B?RG1ENFdoajIxUTRxbFZXN1ZqN1kwTFNwYTBCUkp0NUUxdE84NlE3OEpiMlRy?=
 =?utf-8?Q?b9ZXWRayrYs9JNvNSx6ltuk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e279934-602d-416d-55fd-08de07529216
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 16:40:35.8283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4FUknKj7xSBtIKDt90eP1CJh1we9AF4IKRrha0EzuFud+FxgWZm21gCuhLKm+pclUXUwqU9/RxqSfvoPuu7cRVO0MDiTqrgLvYPqWxM9qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7694
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

On Wed, Oct 08, 2025 at 04:31:23PM -0700, Umesh Nerlige Ramappa wrote:
>On Wed, Oct 08, 2025 at 02:17:53PM -0700, Ashutosh Dixit wrote:
>>Add a for_each_oa_unit iterator, which eliminates code duplication when
>>iterating over OA units obtained from OA unit query.
>>
>>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>---
>>tests/intel/xe_oa.c | 21 +++++++++++----------
>>1 file changed, 11 insertions(+), 10 deletions(-)
>>
>>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>>index 012f5929ce..bc71bfcd30 100644
>>--- a/tests/intel/xe_oa.c
>>+++ b/tests/intel/xe_oa.c
>>@@ -477,18 +477,21 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(struct drm_xe_oa_unit
>>	return !oau ? NULL : oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
>>}
>>
>>+#define for_each_oa_unit(qoa, oau, poau, i) \
>>+	for (i = 0, qoa = xe_oa_units(drm_fd), poau = (u8 *)&qoa->oa_units[0]; \
>>+	     oau = (struct drm_xe_oa_unit *)poau, i < qoa->num_oa_units; \
>>+	     poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]), i++)
>>+
>>static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
>>{
>>-	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
>>+	struct drm_xe_query_oa_units *qoa;
>>	struct drm_xe_oa_unit *oau;
>>	u8 *poau;
>>+	int i;
>>
>>-	poau = (u8 *)&qoa->oa_units[0];
>>-	for (int i = 0; i < qoa->num_oa_units; i++) {
>>-		oau = (struct drm_xe_oa_unit *)poau;
>>+	for_each_oa_unit(qoa, oau, poau, i) {
>>		if (oau->oa_unit_id == n)
>>			return oau;
>>-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>>	}
>>
>>	return NULL;
>>@@ -496,16 +499,14 @@ static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
>>
>>static struct drm_xe_oa_unit *oa_unit_by_type(int fd, int t)
>>{
>>-	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
>>+	struct drm_xe_query_oa_units *qoa;
>>	struct drm_xe_oa_unit *oau;
>>	u8 *poau;
>>+	int i;
>>
>>-	poau = (u8 *)&qoa->oa_units[0];
>>-	for (int i = 0; i < qoa->num_oa_units; i++) {
>>-		oau = (struct drm_xe_oa_unit *)poau;
>>+	for_each_oa_unit(qoa, oau, poau, i) {
>>		if (oau->oa_unit_type == t)
>>			return oau;
>>-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>>	}
>>
>>	return NULL;
>
>If it's possible to keep the interface for iterators simple, I would 
>go for that. i, poau can be hidden from the caller. Something like 
>this:
>
>// NOTE: not compiled/tested
>
>static u32 xe_oa_first_unit(int fd, struct drm_xe_oa_unit **oau)
>{
>        struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
>        *oau = &qoa->oa_units[0];
>
>        return qoa->num_oa_units;
>}
>
>static void xe_oa_next_unit(struct drm_xe_oa_unit **oau)
>{
>	struct drm_xe_oa_unit *poau = *oau;
>
>        return (u8 *)poau + sizeof(*poau) + poau->num_engines * sizeof(poau->eci[0]);

Not return, but update *oau.

*oau = (u8 *)poau + sizeof(*poau) + poau->num_engines * sizeof(poau->eci[0]);

>}
>
>#define for_each_oa_unit(fd, oau) \
>        for (u32 i = 0, num = xe_oa_first_unit(fd, &oau); \
>             oau && i < num; \
>             i++, xe_oa_next_unit(&oau))
>
>static const struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
>{
>        struct drm_xe_oa_unit *oau;
>
>        for_each_oa_unit(fd, oau) {
>                if (oau->oa_unit_id == n)
>                        return oau;
>        }
>
>        return NULL;
>}
>
>static const struct drm_xe_oa_unit *oa_unit_by_type(int fd, int t)
>{
>        struct drm_xe_oa_unit *oau;
>
>        for_each_oa_unit(fd, oau) {
>                if (oau->oa_unit_type == t)
>                        return oau;
>        }
>
>        return NULL;
>}
>
>Thanks,
>Umesh
>
>
>
>>-- 
>>2.48.1
>>
