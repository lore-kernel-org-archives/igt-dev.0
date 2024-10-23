Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08BFCDDE6F
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 11:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE60310E13D;
	Wed, 23 Oct 2024 11:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMo/cgCH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D18610E13D
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 11:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729683094; x=1761219094;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hgSMukoYwShKx5/lV3YScyRGUoTFMjQ5xi9ngxvlnZ0=;
 b=cMo/cgCH3btcQ2Uh7W90yBoSjQbfTNzQquTjCUEIRJG4/qjxcF+xGCH9
 d9dnSsaTscIAAiZ2D8U6G2qQbwBB/9dHjLPJhcRlsHUmcZXMXciCVVZ5q
 VaMMAoVaHC0ymkIue+7J9KZGCNkqS5hrveaneL6DIf8/iia/lVnnZujv6
 rdDKcqy2HsP6R5wsZFRKfRnZZInHdd8a4KF69XLsK77JZaJkJ4ydU/4ur
 rlY227LBa+I9MAmY0FCIy+b8LjvAp7Kh1DK02EXQSNHk5mVJcfst8q0Pu
 mHO16Y68rsNd2GQE5UWg2Ye7fwI4K4Uo6bf2vLoMWkLqrQB7eRYzjGWvq w==;
X-CSE-ConnectionGUID: SBxolEkSTnqEM4WKxljq4g==
X-CSE-MsgGUID: p2sEvJ57Rjqipb4PZjWNtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28723255"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="28723255"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 04:31:33 -0700
X-CSE-ConnectionGUID: DHDYNTD5Qt+lUQoK8isZEQ==
X-CSE-MsgGUID: lHHyH6LpQf2G16w2SHo5gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="80505109"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 04:31:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 04:31:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 04:31:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 04:31:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIsDqpNL9ZAP1OfDJTviI1l1sCFNBfhF1RtfEpvsm9Pa+WAXp7vSXHxuzynNUgF04WXMCzJ7TVDLUJetD6yrZfJHJ73Nu9d6RrM/b+KiPAOPkS/DPxzJ6QDiGMWi4A19rrFNbLDJk+8fU/5yP/j6P1UTn+JPG8BGB+MHqzrjz3dbqewQXzhqeWdY+Vqob8EsBiEqzWnUSKWIEPxH3BSPNPpjMcrR+EHYJMuAL+wjnrEPNIENI5NaX5pXE4DCmy60hAdXTxfrSL5+DeWHm81HpNssydzKouMJfP7mJ/7LgkmLWGmuQymLH74VAVNH82eWHw7lhTyKdneuWkhOtA1maA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azCvmBvHQrWFibuKPw4mvAzV+qP1QQ/4P3pPMIYLCAo=;
 b=BOzGi4hFxDTkJcwSTWQLxvL3aZP2WLL/gdFXaW99AAg541rTsfei6Bm1T9pP/LgPROEjnVvm6WHsSAXjLsyrb5/su+LRXMaap0tAcmtfUPkfdfTpRO43kqIr68iAKZr+/ii4SskjyvOlA2u6v+HXME7S2on24IHDBSUbWdsDuhDrBtErSGs9EHPShLOyq4aGsepq/gTFUY0evHhjv6k1I522tweXI275fScWIkHChBms0CCOauSjZdBE7TO+hBNf6XovHFYWEh0ei9rMtaNHcvX7yUCk7BLldfXJlBHSXzYBtjYFcvuMFaqFo3EF+uH0sdYOUJ2+fsmcLvlTQLdcdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB7358.namprd11.prod.outlook.com (2603:10b6:8:135::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.16; Wed, 23 Oct 2024 11:31:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 11:31:30 +0000
Message-ID: <136ef543-e82f-45be-8df1-cf47bc543ec4@intel.com>
Date: Wed, 23 Oct 2024 17:01:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v5,1/2] tests/intel/xe_pm_residency: Add GT coarse power
 gating validation
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Anirban, Sk"
 <sk.anirban@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20241023104604.2145733-1-sk.anirban@intel.com>
 <20241023104604.2145733-2-sk.anirban@intel.com>
 <CY5PR11MB621197BB000EA31E1ECEA8D4954D2@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB621197BB000EA31E1ECEA8D4954D2@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::21) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f6fdbeb-22b1-4eb1-7179-08dcf3563d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVdBbHRFYzZuMExPbHZzYUl4a3hzejkxemMzOUxiMUUzNUtwRmY1NG01SGFG?=
 =?utf-8?B?YlNhSWxadm0rbEYydndBWHptVjAyQWNsZmRlY1FTMk1MQ3pJVE81aThxekJK?=
 =?utf-8?B?YmMyS0VhRnFiOXpTOVQvVVRVMWdlaWJBeC8yWkJsdk9uMnJrNTNmWGpkVElB?=
 =?utf-8?B?ZXdrNzFMSFhFKzNiMGN5Y2NlWEJqMVFOTG9RRG1XRkpIT2tsMTB4QVVBN3pT?=
 =?utf-8?B?ZituTXRQS0JlRmdCT3NSemdJVjB3eE05L0hSaFhtd3BXRHZ2RksrSDVpNVNN?=
 =?utf-8?B?aklrZ0FQNnIrUFFwdHJDK3dNYUhNODRnL0pQVXNNd3BsNkt3TDZuWm9sMy9T?=
 =?utf-8?B?U0tTSi9WbGJqQkFiSlZNeDc3VlhhYkxHZGR5b1RUTXhDaEVEcC8ydHVFQzB6?=
 =?utf-8?B?TUtmd1lmcU03dm5qdVJsNUcxOGpNYnkvMEFPWmptMGZHTXBmSWJPL1psMFB5?=
 =?utf-8?B?SHlpdkFPNEsvT3NIenlFMUh6cnd0b09lbkdpb0dwSE0wUVk0cjZDWFlPY1VO?=
 =?utf-8?B?OXd0OTlPOGNJV2lpeDA1UThwWjBPbS9ubms4aEZQeU1qUys4WERKbmMzRHdl?=
 =?utf-8?B?eU1ua3VNcXhOWlJZTHJoQTJjaUNSZFYvYmZzclhubnVjSEVDZ0VQbEhHRzRs?=
 =?utf-8?B?UWFBVGoweDQxRmxkcXVubUl3aGdaVm9vajZEVk9ETTZabzNwdWkybFkrK3Y2?=
 =?utf-8?B?bHBqdmZMTlMrbEVGeEVaQzFNbkF2ck8rM2hqZ01SWkE3OXZiUjFUSkJtTGxS?=
 =?utf-8?B?R1ZYYzRtYmg5T3FHSC8rREdWc29TR2ZYVnFjVWw5K0tjNlVYSE1FTnRNNWtV?=
 =?utf-8?B?ZHIyb3U0bkJVVUFSVDhoc3hodzR0aG14aGl0b1hKN0w2RnhYQkZpSHBISGVn?=
 =?utf-8?B?V2lUVm9Qd2RuVkttcTZjdVdESnpNUFlZS0o4eEtMakxkUVF6R09Kd2llTXA0?=
 =?utf-8?B?U2c3SGwrMVNENUpLR3NSTzVHenpMdS96QlB6WDIyOW5YYVgzV2hmN3BPWHN5?=
 =?utf-8?B?OStzekZXT2FtZ0lSdmFvRkljQW91SytnanNBWWJ5eHRSdjJXUkdaSWdMWE5y?=
 =?utf-8?B?NXB0czVZZ3dkQVpwNEJYSVUyMzU1cVh4VGw5MFp6aVZUby81ZjdRb2ZMSkpL?=
 =?utf-8?B?Y00xcnh4YlhaN0N1NkNHcjlJZ3piVFJXL1hEZlZIaEFldkFYLzhwdUFXN08r?=
 =?utf-8?B?R3h1cGp6Sk1Zb3E2WkhCNHc5bGZhTUxxLy9MWm4xdEJLaEZYK0FhUkVEb3pv?=
 =?utf-8?B?TExzcXJpSGs5cVdlM3BqOWQ3Y1V6WmYwRENVbjR3U3Y3Mlg5V1hobnBXTVJj?=
 =?utf-8?B?eU1HajJGWVNVVXZoNVhGeTlvZTMzUHluQUdJdk85QzlCdCtNWWlNU3hOTmNI?=
 =?utf-8?B?WHN3UWl3dnpkVStUZEtwdjMrdUcvT3VROHE0MldtcGV0SmVIRmExOVkrMlhM?=
 =?utf-8?B?clBiSEd2RjRDdmZqTjd3eWV2TFBIWFBxd3NEZ09ySEZNT3ZRMExyNWxCdmVY?=
 =?utf-8?B?dStjUVdEekx1M3VqZm1ZSEtTYjhtdXpaK283QlpJTVBlUlZiV1VaZHNVQjJa?=
 =?utf-8?B?dTFxZGFuUXB6RDU0K1o5clJRQkJHRGJHaHp1Zk1oZmF5NEhVNUdYQStyenF3?=
 =?utf-8?B?QTVkQTUyZFFXSzk1amk5V3YyYUcyMGdPRWVORHFLV0ZWYUNlMnVUZkxBcGt2?=
 =?utf-8?B?Y1hwbU85RFdnd1JPbzBTMHVoci8zd1NlRFkxZWs0MWNKZ01qYUlYZXczTjRT?=
 =?utf-8?Q?4YN7WSi8Z8v+SuII4hF0jaP+QNcjtDUWCY1E/Af?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3d3RS8rRmUyK1J1dVVUWUtFWjA5NFRIamp6em1lYkFBVHVFT091WTNIZDJN?=
 =?utf-8?B?ajhoR2tjaU0zYjhOV0w2bDd0Nk9leC9jbnRQK0pUcVk0cXd0SVc3RHVKN3VD?=
 =?utf-8?B?RkFMQVI3eE1RUERLZFJHOVZmU2NCS05UbGoxNVZTVkkyV0lKRVFLS0pwN0sr?=
 =?utf-8?B?bitjQ3EwNGZnZ01tZnAzVnU1LzlFTGRCK3dXaHN4WG1MSnNPVUh2VUp0R2VB?=
 =?utf-8?B?blR4TGlUcVcrcHVWYzdXa1pkNHVreUptUVdUR1ExWGxEQVZ1S3UxN3F0Q3lE?=
 =?utf-8?B?Mkt4Z3BHUGpYU2c3WnJKcWFNUDBVTGtHOHZwbUFBVHNXV2FuM3doQWVzOHlw?=
 =?utf-8?B?NXhyOHFKMFRVUVZSc3JKeFRrcFhBciszQ2RudlY3Njk5aDVYY1BSR1g1Y1Fv?=
 =?utf-8?B?YVhrSEw2RTVjTmVsNWtmbCtvdVlaOFBvWXphMFQwc0FXNWNQQ2dRSHp0eENU?=
 =?utf-8?B?MDJIOXBXOVoxZVh5R2tlZmJtMEpybGdRS1RRWEdTVEN3bCtOTnFqeDFvbUFp?=
 =?utf-8?B?dzhOeUdabWhaSDF6WUFCbkZLUVRHVk9xalY0SUVuZ2hva2RoYXZ4aExIdVBv?=
 =?utf-8?B?NVk0M3pKVEc5Uk5WRXdLUnBZQTB4TFBUL044SjFybCs0b0NucWdGZmFoWXF1?=
 =?utf-8?B?Nmd4eVpKd21iVlBLell0U0oxQjZ0S25UODcwMzB4MTRnVzYvQ0pSRVZCakZ2?=
 =?utf-8?B?NFlOZHNxVUZIQUcxc0lYZVJUcE9NTFpFOFRqVHEzMGJ6dFY5QXNzeWg3SFlN?=
 =?utf-8?B?K0trb0RyamFhUHRDQnFuSTdJQmQ3SWVielJhZXFZL09NK04yWFp5NldUaFhJ?=
 =?utf-8?B?cnVzbGlGbjg2RENIT2hjWHVyMzJtSGwxV1RScnpZVzBYL2ZRVk5UZjRyblcr?=
 =?utf-8?B?N2EvbUVjOFhKejNOdjNyQUUyQi8yMlQ3OTg3RlRhSVRDZDRWVzJzMlpML2Zr?=
 =?utf-8?B?KytZNVhtbWtQSTlxMjBoOEVidXprb0ZOQzhMb1B5L09UdlczenJvc2cwb1VK?=
 =?utf-8?B?cWlFQmxFY2pacTA4MVJEU1pTYlhDTStKb2F5d20xVlRPUW4yemwxV0JQZThN?=
 =?utf-8?B?Y2g5d3BFd3B2YjkrSSt5TzExd0VELzdGM05UWUxzb3FUWHk3eXlmcWM0M0g2?=
 =?utf-8?B?L1IxTlJ0OWhsWGJ4RDJhMXc4NGMvOFk4MHcxVWlzRFBVeklKNmVPNlIwZGFN?=
 =?utf-8?B?M1Zpc3MwQ3JDek9pbjlyYi9HRzRsOHhRZkR0eVVNOVFrMkprdXZKMCtlOWtR?=
 =?utf-8?B?bS8wYTQzRUo4UUJqa2pIRC9rRzQ2RVBrTGtJM0M2VnpWVHl2QS9wNnhoRVRq?=
 =?utf-8?B?L2NFd0JwUTkrNjFGUWthdEJyam9JL3FtbUxOVXNvN2d5SmkxK3JjVStQOVVW?=
 =?utf-8?B?MytoVENOcVNtQnFUcUh6ZzZSNWhLelI2b3pqdnI0ZTBPWFhWVzBmVVhTRDBu?=
 =?utf-8?B?eFVoQkEwUmFpMUpiMm9UYWsyYkdoVzZ3cE5taGtZaVNrcHA1VkNXSjl4Tjls?=
 =?utf-8?B?YlNMRld5Q1QyOGYzTUd1SExZUzBjU2ErSU9TRCtsNHY5Y2piQVl2UGNpQ1dk?=
 =?utf-8?B?SGNUM2RKYXJpdWwxVWsxMkVxeEx2V2tLVy9wYmZtdDQ4VFJQNEFFL3VBZTA5?=
 =?utf-8?B?VG1DRlNWbGJYc00zQ2lkQi9JOTdiSlpKUlZKZ21udlJ6NlV1a3J5NWh4bGJa?=
 =?utf-8?B?S0VTWjROZmNwVkk1WElWb055eFRQTXlUbUcrbmtDekdWR2pXclROcU5ST29i?=
 =?utf-8?B?c05TRjRkUHFwSENwQnhZN3k0UVJvWkRrdTVtWnNWQVorUWF5ditlTHVXTUc3?=
 =?utf-8?B?bnVsUFQzS05PK1ljakdaRFdBWjUyRnZMTVBOSHNnVzRFalByTlp6WjlYakp1?=
 =?utf-8?B?cGpUTzY0dEo4T0hXTThZREJ2cXhSR2pwT3o2M2U3R0JXYzViaWp2K1dkdVBl?=
 =?utf-8?B?aENLMmlOMHRNUGt5M1lXZVN1WlRXRnpPMHBxVmpsaUM2QmxENzBaNFM5OUJt?=
 =?utf-8?B?clZDUVhoSU83ZzE1OWJSbTJEUEVROXBOWUh0NkFOVGFCWDBpM3FTQ2VGbnlz?=
 =?utf-8?B?QXByRnVNQitMUUdaMUg5MXc0OVVXajdyRkpwL2dNVi9CTEdZOFdhWHBkQVBM?=
 =?utf-8?Q?LjDs7xx+9IhOLJLS2vwJJau9h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6fdbeb-22b1-4eb1-7179-08dcf3563d62
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 11:31:30.3678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nePWOVaxa/tzNNzLuldwnfJ4kWq324rzw2vgwkTI8pwM3y3ZluOTqmPqErD97kUNZ4XZoulKQzVN1bSXZe59EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7358
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

Hi Anshuman

On 10/23/2024 4:32 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Anirban, Sk <sk.anirban@intel.com>
>> Sent: Wednesday, October 23, 2024 4:16 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: GSSE Core KMD Power Telemetry India
>> <gsse.core.kmd.power.telemetry.india@intel.com>; Anirban, Sk
>> <sk.anirban@intel.com>
>> Subject: [i-g-t,v5,1/2] tests/intel/xe_pm_residency: Add GT coarse power gating
>> validation
>>
>> From: Sk Anirban <sk.anirban@intel.com>
>>
>> Implement test cpg-basic to validate coarse power gating status after S3 cycle.
>   why only S3 cycle , why don't we have s2idle cycle test ?
> Thanks,
> Anshuman

S3 and D3cold caused the registers to be reset when suspended. 
Restoration was added on resume.

That is the reason S3 was preferred over s2idle.

Thanks
Riana Tauro
>> Add test cpg-gt-toggle to check if GT coarse power gating is up when forcewake is
>> acquired and down when released.
>>
>> v2: Address cosmetic review comments (Riana)
>>      Fix suspend state (Riana)
>>      Add exit handler for test cpg-gt-toggle (Riana)
>>
>> v3: Address cosmetic review comments (Riana)
>>      Fix commit message & test name (Konieczny)
>>
>> v4: Address cosmetic review comments (Riana)
>>
>> v5: Remove unnecessary openings and assertions of gt directories (Riana)
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_pm_residency.c | 80 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 80 insertions(+)
>>
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c index
>> 772fe9b57..d4b26b231 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -63,6 +63,12 @@ enum test_type {
>>    * SUBTEST: toggle-gt-c6
>>    * Description: toggles GT C states by acquiring/releasing forcewake,
>>    *		also validates power consumed by GPU in GT C6 is lesser than
>> that of GT C0.
>> + *
>> + * SUBTEST: cpg-basic
>> + * Description: Validate GT coarse power gating status with S3 cycle.
>> + *
>> + * SUBTEST: cpg-gt-toggle
>> + * Description: Toggle GT coarse power gating states by acquiring/releasing
>> forcewake.
>>    */
>>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>>
>> @@ -317,6 +323,69 @@ static void toggle_gt_c6(int fd, int n)
>>   			     "Power consumed in GT C6 should be lower than GT
>> C0\n");  }
>>
>> +static void cpg_enabled(int fd, int gt) {
>> +	const char *render_power_gating = "Render Power Gating Enabled: ";
>> +	const char *media_power_gating = "Media Power Gating Enabled: ";
>> +	char str[512], path[PATH_MAX], *render_substr, *media_substr;
>> +
>> +	snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
>> +	igt_debugfs_read(fd, path, str);
>> +
>> +	render_substr = strstr(str, render_power_gating);
>> +	if (render_substr)
>> +		igt_assert_f(strncmp(render_substr +
>> strlen(render_power_gating), "yes", 3) == 0,
>> +			     "Render Power Gating should be enabled");
>> +
>> +	media_substr = strstr(str, media_power_gating);
>> +	if (media_substr)
>> +		igt_assert_f(strncmp(media_substr +
>> strlen(media_power_gating), "yes", 3) == 0,
>> +			     "Media Power Gating should be enabled"); }
>> +
>> +static void powergate_status(int fd, int gt, const char
>> +*expected_status) {
>> +	const char *power_gate_status = "Power Gate Status: ";
>> +	char str[512], path[PATH_MAX], *status_substr;
>> +
>> +	snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
>> +	igt_debugfs_read(fd, path, str);
>> +
>> +	status_substr = strstr(str, power_gate_status);
>> +	while (status_substr) {
>> +		igt_assert_f((strncmp(status_substr + strlen(power_gate_status),
>> expected_status,
>> +				      strlen(expected_status)) == 0),
>> +			      "Power Gate Status Should be %s\n %s\n",
>> expected_status, str);
>> +		status_substr = strstr(status_substr + strlen(power_gate_status),
>> +				       power_gate_status);
>> +	}
>> +}
>> +
>> +static void cpg_basic(int fd, int gt)
>> +{
>> +	cpg_enabled(fd, gt);
>> +	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
>> SUSPEND_TEST_NONE);
>> +	cpg_enabled(fd, gt);
>> +}
>> +
>> +static void cpg_gt_toggle(int fd)
>> +{
>> +	int gt;
>> +
>> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>> +	igt_assert_lte(0, fw_handle);
>> +
>> +	xe_for_each_gt(fd, gt) {
>> +		cpg_enabled(fd, gt);
>> +		powergate_status(fd, gt, "up");
>> +	}
>> +
>> +	close(fw_handle);
>> +	sleep(1);
>> +	xe_for_each_gt(fd, gt)
>> +		powergate_status(fd, gt, "down");
>> +}
>> +
>>   igt_main
>>   {
>>   	uint32_t d3cold_allowed;
>> @@ -380,6 +449,17 @@ igt_main
>>   		toggle_gt_c6(fd, NUM_REPS);
>>   	}
>>
>> +	igt_describe("Validate Coarse power gating status with S3 cycle");
>> +	igt_subtest("cpg-basic")
>> +		xe_for_each_gt(fd, gt)
>> +			cpg_basic(fd, gt);
>> +
>> +	igt_describe("Toggle GT coarse power gating states by managing
>> forcewake");
>> +	igt_subtest("cpg-gt-toggle") {
>> +		igt_install_exit_handler(close_fw_handle);
>> +		cpg_gt_toggle(fd);
>> +	}
>> +
>>   	igt_fixture {
>>   		close(fd);
>>   	}
>> --
>> 2.34.1
> 

