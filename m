Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DCFD64098
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 22:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD4F10E299;
	Fri,  8 Nov 2024 22:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWhixlq6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E42610E29E
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 22:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731104723; x=1762640723;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cVm39vVnQIXWJVwiut+iLDxscfbXNR173VUAO5qkEsA=;
 b=hWhixlq6vHScwqdw43RKQ0NaUlg0oii6fvSRwigNlhBWLQL2gjVRnLs/
 Le02PYlgtKNGWeZXQkBbhl8B6WMAAEh7C8pu48iCvsepmsk2a9AB0cpcJ
 lSpDYUrJ0Ie62BNex22qIuovyoJQJfIQC/H7vZLRxl5M3rhsyAX7yV1rQ
 uOVudMoSuJrDV1MwEe8osXNw6XUWuwAalaFZRE1CGjqEiQcb4o8bwA05R
 EaHsMjn/fH2vdxK39SeycR1z1WcyStKl9+5vTTa27fH4X4rgqeJ1j4bVF
 ghHyK/Nfgzg9VZ81mU40sjCNAF4zOQdw9kRJm16CVzAmhtx6RdyypdiCN Q==;
X-CSE-ConnectionGUID: 1aGrzM4cTg6DJS66J4nkAA==
X-CSE-MsgGUID: uXRS6Qn6TXKtlKhY6bhryg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="42387219"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="42387219"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:25:22 -0800
X-CSE-ConnectionGUID: u/ALqbxmTxSkzJlxI3W1Kw==
X-CSE-MsgGUID: eGbEU4x3QGO4vC/dIyr7gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85833272"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:25:22 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:25:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:25:20 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:25:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHbCQskd9eGKGnA5Y3DMaasbgPn+H2SdNOcpRwtOfkWr+XsgRnhvLpX7W2nCCYzGKraUJ1s/fovJCyf7j3hT/rasKpVTYrPvmPuFT83F+qJPyy6sT1di8GzSjJAQ+2PhxD+fFyrs2QGGrKv+ropCoLtPu/uKg0q2TshQj5+iR+A7OvmL5rLZj6z8+cXX5zku540Ld/Y09GdQvUs7Dc05W+zFH+3Guy7MJ5qTRaH+2zuiry+acTdwq6Ub5kGeIb31SQq+CeBmHVUlikSQkr0pjbyHM2OZQGcR1ckYfkVPrA4aFN43IJlFbRX5DQlwIbOPDmXHA3OI/lIhhwJnzjGtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brwp6oWzikovOJ+0RJYXax9GCoIRVBsW7p7emnXBmE8=;
 b=t2OvS8eB0ddbG9iHqmS3vPwn+ALgqqKVGPZ+ZTdrJe1diiL3G+J/0gOkca93rYYBWkDJutZubbbpesh8BBJRLlcKTSfZEKKsUimPCf9Jzt0p++t9dTzBcwxMhh1nNX8flQvlrThUzilh35VnPcug+BSvcFpFagevvKdJN+EzibYeXKwy4TniMTAw+Aa56RgiBWZi5CgCkZpv6x53xC2M9EZsYdWggfekBugfRsDxqz9KJ6stG92LFeUPJvzflEwWo4k7UM9nRIpJRxc3AJp0rVT88C6+ZDf9qhr3z1HG0Okf6oxnsMZk2L+/JTc6FUcUVNbn6LEgbPSUyaWiY58G6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW6PR11MB8309.namprd11.prod.outlook.com (2603:10b6:303:24c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 22:25:17 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 8 Nov 2024
 22:25:16 +0000
Date: Fri, 8 Nov 2024 17:25:12 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v3 1/4] tests/intel/xe_wedged: Ignore more dmesg
 warnings
Message-ID: <Zy6PyBUHhNIVvHLu@intel.com>
References: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
 <20241108201839.119079-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241108201839.119079-2-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:303:87::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW6PR11MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a70d4b-8108-4478-a41b-08dd00443872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3B0YmFTMmt6Mm94a0pWZGoxZjdWRGtTbk0xYi9sbGZnZjloNDhlbWFwRVBC?=
 =?utf-8?B?ZXNCanNHWTUwSS95ajVqdE5EZG1jbWhITjlhRVFiRWsxc3RIRWJmUCt3S201?=
 =?utf-8?B?OC93cUVQNyswSEdjdUY1SGpPN3g5ZzZpckwyRng0OHFacFVCcmtKTmh2bGxE?=
 =?utf-8?B?MysvNmZuNjhEUVFoZENKd1N6YXkvTnRNRWNWZFp4TlV4RlhvUkttajZPdnBH?=
 =?utf-8?B?OVJ6b2Zab3JWRU9BQjdYYmZnN0ZMdTlrSzdhcFkrQXdOekUvODlNdVJWN0JJ?=
 =?utf-8?B?eW42cEdPdG5EdFk5SC8vNzNQY0RPQ01telZuNFhBSjNiL2ZMY3RwNEZqOEFG?=
 =?utf-8?B?SldZTXJaUlN3dGJKOFo4R1I3cHZiTFFXZlNRYzhqV2Z0dkw0Skc1NW8yZlVa?=
 =?utf-8?B?RkljZmMzby9JNnZweXRreW10SzhIOTh6UjZZLzRpdEdOWGpXNVlUWXNmYkhZ?=
 =?utf-8?B?c0Z2U3Z5TGpCQkRoWkIzeGd2MGo0RSt2eW43bVhHUlFmR1k2RDJweGU4SU1p?=
 =?utf-8?B?L2xKWU1hWkNySG05MUIwSm9BUEpXZzlhSW4xYk1uMENuakV2Nmp4UHZJdjIx?=
 =?utf-8?B?TXo1NUllbkNMVlcrWXNvQ2Y1Yjl1RmdoN2M1UG9TYUZRc1U1MXFza3pZbTR5?=
 =?utf-8?B?NkdsU0hGWDNPYnlCSVpZSUI1b1duNHhHd3psb2VuWjM1NnYzSVI3OUdvUWda?=
 =?utf-8?B?K1grRHBTRFlTSDVReFU1NVZsTG9OSFNoV25qMzBNQXVZa2VXWlErRlpGcGZZ?=
 =?utf-8?B?NlIxN3ZDallvV3cvUlpJWmVqbXRIdjQxSmNwL3czYU5TSjBqUlRiNWxHd2Ji?=
 =?utf-8?B?dm1laVhxSFdmMjJVa0lzVjRmbWR6RjB5VTNQVXRDUWpndEJ1M3pUWDBpYmZj?=
 =?utf-8?B?V1lQcVlWMVZZQjMwY2JTTGF0TndJNDNDYytIS3A3amt6L2xOU0xhTFV0cDBz?=
 =?utf-8?B?V2NmUWJjNG9IQkRGaVJReURaTUJHNXJGblcxYlMvZ0dSVXBKbWpKc0EzQzhZ?=
 =?utf-8?B?b1JmYnJ6MkV4a29iM3JqVE4zK0ZmR2MxUUxwMldwbUx0Vk9kMWpiUEthK1c3?=
 =?utf-8?B?MElGN2puLzlDdVNXVnBuVHZhTzhjK3BPZGVLREVmbGFJMUptRmc4b1BUak1J?=
 =?utf-8?B?K3I5enBxZkV4K0RUQnpCNUdYNXdPb1NnOWZVMkVNUVJvU1pzQmlIKyt4SFZ6?=
 =?utf-8?B?QmpsQmY2aEpTTXhISFhQallqNVNiK0p0VVBaYWh4aUFZYVI5V2lCaXBsRUJQ?=
 =?utf-8?B?V3RpaXR0TUVpb3BWeWtkQzZtcS9sd3BYOFZzU0pYcjhMUW9qY3d1L3U4VElu?=
 =?utf-8?B?WkdIN2d5eW1FSFpHWm1wUzlXM0VqUlZkRkx6T0xjKzdFRTFpRkFNaXNZblJl?=
 =?utf-8?B?dXU2eGFuNk9SNVhxaEdFVzNqM1l1aHdDT2kySVg3L1Q3T0dnSiszSFpwMUtz?=
 =?utf-8?B?NFV4MWhkdTY5MHdRdTlSNGZqS0NGd3ErKzhidEttazI2SVRzcWE0Q2NmbjJB?=
 =?utf-8?B?OXl4ZGJrZkE5RGJDWjAxU0dUeWQ2TzkrcjZDajVEN3JxdUFFU2dvenhjaXd4?=
 =?utf-8?B?OUJSeDgxbC9KRXkrczIxSUJ3MnliWWJIdUFTbmRYYVBMZjlqbzJMRTkzN1Jy?=
 =?utf-8?B?QWMwWEhSczI0S3NuVWQ4dWthdzN5OHBDQm90OHdKM0dibEFXY01KY0cyUmxl?=
 =?utf-8?Q?lkfa2h8kG/inhqlw9GQ5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDRITlRON05wV1NWbFJQV2FGZTZPL0Zoa2lyY2tBMzFzZnZnZ0V3MEVoZTha?=
 =?utf-8?B?VkhSRk95ZS9oZzUvL1VieUVBL09Wb2RNalY4WUN5cGpXZ1ByU0hkcEtaK2sz?=
 =?utf-8?B?Vm9US3BuZG51Sm9MeFovekVjZnB3R1V1ZFBxZHZnYjBHYWx0OTA2Ulp0OGVI?=
 =?utf-8?B?dWhEQ2JkcTBrYm8zL1J5QW9NeUVqY0QxYzZVdm9sdUhoelFtUjdtNE9ZU2c2?=
 =?utf-8?B?SUJKczhEMmRjZGhDU2hEMVk2bHRyNG9iYjJnUU5EMVBIN3FZdjl0UTVQSWZZ?=
 =?utf-8?B?OHRuNGJ5cDkzNTd0eUNNd3c0dHc2SnVLM3BIU2dXSWQ2TjA1aytpTWErYy9B?=
 =?utf-8?B?VEtZRWo0SDExcWNIdXJpZ2lBbTBHNk9sbXhwQk1Xa0E4NmR1c1Y3bFNkRU42?=
 =?utf-8?B?ZGE5blRnRkdJdG9tdm9QNDN6RTFkWC9zRWZmMFdxQ0Y5SDF6dTRoVmZZME5W?=
 =?utf-8?B?aWYvZmovSGdSVm1iSGhFb3k2Y0hCS29VTG9qNyswVEFlaWt0czVSS09HV1Rz?=
 =?utf-8?B?UzQzSVB1dkFvY3N3UE9CclI1Y3E0bXhjV1lRR3M0REx2SWpGZzRDSkY4d0ND?=
 =?utf-8?B?djgxK3M4WXVVTUFRSTZoNG9FOEVXUDRRSFZpV3B2dUpOREU5anR5M1U4NkZq?=
 =?utf-8?B?cWF0WWRxSFhMbWF2U2lEcFM4TTBCZGQ3ckpreU5UWnJybTN2NVFXM1lEdVNY?=
 =?utf-8?B?NGtESEZ1Smc0eUx4YzVnNnVZYUFDdTRGaHhPSWo3ZEVEbXNNdm0wQmY3cmI5?=
 =?utf-8?B?ZHNpcTN5c3J6ZFBaRG9BN0JEQWx6TEdsUXZ3eVIvc0NCZDhVcDRpZDZ0UUh0?=
 =?utf-8?B?b1FONGJoZUUwWVU2WlduM3Y4enBRR09qbHBIK2o1VnB3RW1VSmZJWlZYMXJm?=
 =?utf-8?B?OUhPOU1ERWNmdGM3andkZ3BMbHJnRmpuV1hHcEJ1elg3eEowRDJwY3NtNDBO?=
 =?utf-8?B?MkdUSzBtWE5jcU95UTZxaGcwVGVqZVd4aGpkczhwZGJqVkU2UkpRVEIvYnFJ?=
 =?utf-8?B?dk9uaXRNNjg5WGFWSVZaWTdXbEFld1R2MTZOZWtrcWpYNHdmYzFKTHJXUGtq?=
 =?utf-8?B?OHlkVGtpMWJlNEpNVDhYajZ5YWNhcm5SRldpZzNwb25OdmxXSkFkQjVWdmd0?=
 =?utf-8?B?OWlaTURnMTVuaUxRdFlHeHFCdS9oNjRiTEZrVlBuOHZ6ZnN6R2IrM0FhcGZZ?=
 =?utf-8?B?aDZ0TWcvTmw5dzRyNGJCSFBOSzg4YWlXSFk3S2dldFJPcTBzMW9QMFRZVU5R?=
 =?utf-8?B?bFFYcjdtTmRZLzUvaElreEh3ZE4zSExuZ0FKL0t3ZjloRTd4Q1o1cHNVaWp1?=
 =?utf-8?B?NUFEV1lTeVZ3UGpkYy9YdkdFcmNSNlRYTzdrY01GdUtyMXJLYVdNZXZMQ3FZ?=
 =?utf-8?B?Q05aL1ZWSlhHcFQwRWh0aUxVVDZTcVMxaTl5dWNqTWQvNG16VWF0U3BsU3pv?=
 =?utf-8?B?UGw1dzdUMUZoMlJCMHZkeUZNanBEMWFVTUh5NGpZVWVmbG5UVkFsYVlqNHl5?=
 =?utf-8?B?YnJTZ2FqTzBGQ0Zocmt1YnhnK24yVGw5K29pNHVsKzlFSEZEN1dIVDZaODhi?=
 =?utf-8?B?R2l3ZnhMcm9Xb1BYTERBZkxOSXFvT2JiYm9uTmpVVy9aTXJGRHB1SXNGS2dG?=
 =?utf-8?B?UFZVK3VPU25tWkxheG9LcDFxcVhxeGhXb1ZycndzR1g5aTB6SFpsZFZDM3dZ?=
 =?utf-8?B?amtpbXJaUmdqTFUydXZzOXhBUkFnbVU2RjZISDl6SGV6ZVJNU0Y5T2Q4alph?=
 =?utf-8?B?R01jZ2hiNU45ZE1LbkM1ZUFTRHZkU281SmtMMUdkcTVweE9HREpzZFpNL0VX?=
 =?utf-8?B?emFRQ3V3dThyUDVISll4NXJ4UnQwU1VhOE11N2pVZFV2WEF4cVY1TUgzMFoz?=
 =?utf-8?B?d1NQc29FTk1GVG5GR3JXZmRNWE4wYytHa2xPU3pBOGRmRStvT0VlNUpFOHcy?=
 =?utf-8?B?dzVacE5nd214eTJhMDNBbU1MNnNKNDFMYTBZNjlJelZabU80dWc0d1QzN2dx?=
 =?utf-8?B?TkZZVVNWNlZ2YjlkNSsxV3dhL2tpV3o5S1JJZG1sMXI5ZFpDWXNlc0FHenpS?=
 =?utf-8?B?ZnorT0lnTFp2cU5pQmw2OWUrSTNYRGtuOTNoQm9Pbi9DTW1aaWZTU2FBRGlo?=
 =?utf-8?B?RFZaTnIzMWR1L09vYzlWbUlJblRvWkthc1pDUWQ1YjJwRjdkQ3RDdjNPOGNL?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a70d4b-8108-4478-a41b-08dd00443872
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 22:25:16.3639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieXdwzpUP+MoA5/1j3dz6Uj6kJ6Cl9QuBbD3ma/AMnNCTYYJhBM42MKHTH+xuENWwSSXXW5MIMtqeSGifXLMRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8309
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

On Fri, Nov 08, 2024 at 09:18:36PM +0100, Kamil Konieczny wrote:
> There are more warnings in dmesg which should be ignored,
> one comes from driver, for example:
> 
> xe 0000:00:02.0: [drm] *ERROR* GT0: reset failed (-ECANCELED)
> xe 0000:00:02.0: [drm] *ERROR* GT1: Failed to submit gsc proxy rq (-ETIME)
> 
> or from drm:
> 
> <4> [438.651441]  ? __pfx___drm_printfn_seq_file+0x10/0x10 [drm]
> <4> [438.651476]  ? __pfx___drm_puts_seq_file+0x10/0x10 [drm]
> 
> or from kernel itself:
> 
> <4> [226.597358] Modules linked in:
> 
> so extend regex with them.
> 
> v2: move '|' to begin of strings for better reading (Jonathan)
>   extend regex with two more, correct __pfx___ regex (Kamil)
>   added r-b and correcting name in Cc
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2919
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_wedged.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 88e5d47f2..123ce6396 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -29,7 +29,11 @@
>  static void ignore_wedged_in_dmesg(void)
>  {
>  	/* this is needed for igt_runner so it will ignore it */
> -	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged");
> +	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
> +				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> +				    "|GT[0-9A-Fa-f]*: Failed to submit"
> +				    "|Modules linked in:"
> +				    "|__pfx___drm_.*drm");
>  }
>  
>  static void force_wedged(int fd)
> -- 
> 2.47.0
> 
