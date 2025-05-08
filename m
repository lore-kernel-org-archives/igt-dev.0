Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CA8C3ABBE
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 10:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77CA10E1F0;
	Thu,  8 May 2025 10:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8IPhpVp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AC610E2B2
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 03:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746676610; x=1778212610;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=KdN5YoYsuTeNgPE07LeJTn61ikoRcJ0jRMAvfO6IGr8=;
 b=P8IPhpVpRhCxDLg9Y7Q0I4/7oN4A/S/G7+vw1XQPdnXS/I49qKQ1STYC
 XfyzqLv6IcMmk/UPNPOGtKmh+Mu8BHJyUe7PnP9InkZN1BofqH7ffj3zU
 YV8Bjxa3VS9eGzwH/igDyDvIK13DTEk1VZNNb8n9EGP6FGIMlUWbEyPOv
 FsZzVmPeBRECJI8LXMlrKk1RR17uxH0XXlebqmbuN/Viwkl/fiwHgvAab
 kqGmp9eqTPq0pl7XzgkCP2DGyNhkUTkbSgNxCeNfIwph+ezrJsxXRikP/
 pVNY9jd1lX3YmquLBr26XSTTusW6FvOciFEkr09dcrzEFnw48oBcNV+VF Q==;
X-CSE-ConnectionGUID: O1Rdq02uQZ6njcWGcsLigQ==
X-CSE-MsgGUID: H9zWQiyVQo+ml4e5eJPCKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48520677"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208,217";a="48520677"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 20:56:48 -0700
X-CSE-ConnectionGUID: gk7pPvhmSde/oB3i3g7oLA==
X-CSE-MsgGUID: Fy7rjtkNRA22+/jfc5EfQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
 d="scan'208,217";a="136122169"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 20:56:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 20:56:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 20:56:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 20:56:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ww274A9CXdzxLomKJkQxTQT6KSxvDgDl/Y1c7cipFxwPqfTTYo1xfRnO62X2IZPLJgkkh10PkDwEx7XN+dKItYHaD1BOpa+9zlN06Nfc7upGH6oQOWynHPwbf8Qk5X4p7CW/Ot71AAvWpcOY4Dt+XCQ2Mo5MwFUznynxGlZANSAxBMtUyaUUpr0rlTN5fIKOBAWhKp5Zn6IixHz7jYbLAQL4vxoT+XZsUTR9GLmS30rMe25R4EH/hlOsD/BTPM+PeZY3EZQ+reeX8GdgJoGnqoQ0tsDX4MSMxGGMcJqhHWCskesw1sS9sVoQzQMWyiZbvbqukLdtD7/DmvsCVtamrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foWNSwnHukW3bOCOIXOdChWdWPJOm8zV8jCiKzHj81Y=;
 b=KooWYqSTK7viB+XDEmMWM8mJD6yscJta8wUQk5JWPHGNlL0NfjWtgwzpvFMBOsfxMGgEXmKiHa7BGlGz2QEPRQgrZzR5Ljv6e7VsUAIpU+LeP5yRkIguY4w+XLeWb59QBf1dSekzI3ITdt0nAILbUY2q0tKbb1ir/IvVvIPp0j9/CJVdOsHYx2oyKKZY4pnysAmZt/N4GTJnmnouXynP58QkOl/ehLJ1YFNgri0FyHwTA2H4hkSBEoAza0FGe7bNpBin3+rxqn9Wb0HWyjAFoI6Q0m9YfzScVdDaj/ft+eQHWWs8bdeklqe02It3pf/0PxwZbsF2URkHIVs8BODXEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Thu, 8 May
 2025 03:56:40 +0000
Received: from DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2]) by DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2%4]) with mapi id 15.20.8699.034; Thu, 8 May 2025
 03:56:40 +0000
Content-Type: multipart/alternative;
 boundary="------------g0aRdxnU4oVhwqxywmLlJLsC"
Message-ID: <ddceb65d-153a-4b35-b138-140e10c22af5@intel.com>
Date: Thu, 8 May 2025 09:26:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/xe_pmu: Adjust assertion to account for potential
 RPe adjustments by GuC
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20250506150617.1961348-1-sk.anirban@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20250506150617.1961348-1-sk.anirban@intel.com>
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To DS0PR11MB7766.namprd11.prod.outlook.com
 (2603:10b6:8:138::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7766:EE_|SN7PR11MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: b79c642b-b373-4055-da1c-08dd8de45688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjJvQlA2MVVYL3AvZnJVM3NFOWE1T29Wd3U2TkR1YVBMTVF2K2U3U3NYRDVR?=
 =?utf-8?B?aEJKcWYwTFVoUUdYdFhuZEY3OXhiT1hKWjgycThXalFZVUI1Vlc2SXoyR3JS?=
 =?utf-8?B?MElmTi90dFNmcUxxeEEvWnkvQWJDMkp6UGE0ckVmZ1RYemtjUjI5TVoyc3pR?=
 =?utf-8?B?dVVnNmJZRWpReWhiVjhZeTVuSlZvRFdBMWxWZWROTHM3Tmo3MWJQWHZYNldk?=
 =?utf-8?B?QnI3Mk1uUTh6QXVGazFXMnZJbG00SkhNV0FETWhxMVNWbEM1bzRjSFd6NlQx?=
 =?utf-8?B?M3UzODdlejBPdENWUlEzVFBicnpsV0VyUkpaRDJiWjBGMVhLQ0pvakNtZTRC?=
 =?utf-8?B?YnFnZml5TzBOTGswYWdhbmp5cWFaTGYzRC91NTJOWSt3eE1iVzdid1pXMmEw?=
 =?utf-8?B?MHNjL1crb0xOWjNxZitKTGp0cUZDZzkrWFBMSDFqNUF6eklvODJDcGlZb2NL?=
 =?utf-8?B?NGRWWXp2Rnp5ajBJS2F2cy9wdng2RTJtc2dyRXdDRUFkeVdDQ2dYSVFtRk5p?=
 =?utf-8?B?aHdsa2JSZnBlS1o1TVFqVzdjazkyMnhqWWtPSDVIRjQxSlh0ckJRTVQ4dm9E?=
 =?utf-8?B?cmU5c3B1WG1GZlhiWkFoQ1Vzc3I3a1hLc0V0WEZZYUluU1dYUHZWOEVhejZ6?=
 =?utf-8?B?L1ZMQXFkWUlDcXFuN3dRdEIvbURQbFZFVTd1U05jc3hEQzYzR2szRFNFUUdH?=
 =?utf-8?B?MmExZDBhK2lybHhQN0J0TFQ5ZVZqSmgrVU1VSzl5SlIyQ1E3bW5hODcxeWNH?=
 =?utf-8?B?UlpVdGpEUUM5ZXVRVWUzUERxV1h0Y3diSkdzTE1GRVVLNXY5MHgvRlp6WURH?=
 =?utf-8?B?YTgrTHVIQVlaeStxeDRoRmVKMnF2RmVwa3VxcXQ4OGJrT2EzajhQaUxXV3lB?=
 =?utf-8?B?UFAxT1EzSmptb0k2UVM1K3I3VmVKdnZKZ3puUTBkSk9JMEpQamVFR1ZBSnJE?=
 =?utf-8?B?YzhWV0ROM0tKbU5DRm9jNlZLMDRYeklPTGV6OWVNQVN4ZXdQR0ZuMnZxbGg0?=
 =?utf-8?B?QVhYSS9IbnlYRjJJdVMzVWpSVitCSnhDNU5EWnBSL29EU2NRWE5qK2JMZDV3?=
 =?utf-8?B?Rlk4eXV3MHVJd0JrZy9qa0d6QkZlT0NmRWlwNytQTytPaHZVMk15Z3BjRU90?=
 =?utf-8?B?R3pVQWxwTUo5NlY0S2ExM3Z1SExsWDkzVXEyQzltUS9JZGY4TThhYUFRQjly?=
 =?utf-8?B?WlZ5emxJVzJqVlQ2VCtMOHE4WHpjemozaW1IbVl5OHRwL3ZYcDdoMHdONGN3?=
 =?utf-8?B?VEdDUzA0aC9FOGh3YVpYcUFrWk9MWHdBUEhaMTYzbm80MCtpc2Eremw2ZUs1?=
 =?utf-8?B?MVRWVDduK2NYb2xWUFZUYlo4U29ZVHRVN2RsRFJPSmJLZ05vV3ZUR0FYQ2M5?=
 =?utf-8?B?LzU3N0V1VmFBWWtMWFpKOHMrR2NBem5EZ0Vacy9aUTUwRndOMHVpSVg1UW0v?=
 =?utf-8?B?NVdyNzIwYnUwd0dvQlV2ZnN1WHFueGRabGRsZE8rMVNhVjlnTDNGOTdabFV0?=
 =?utf-8?B?bXp4bkVLR25mWlBpZE8xWHQxVDNQb2RLNVNWQkJOVDlyRmJQY1V5Tm1PempI?=
 =?utf-8?B?MDNLT1NQQTUwQUlmdmhZMHE5N3JhM2ZrTWVmRnVRb0hvaGJZRkxPOElGNVN3?=
 =?utf-8?B?Tk0raTA1L2VXUG1vR2JPbEJwQ2hNUzRyMS9CbTFYZzZZRGMrd0pvVWpnMStF?=
 =?utf-8?B?VmpZaDZ1YVltamYrRklHQmwzYjFZQ1VOeWRTakRPSFBrYVNUVFB3SERPUmNV?=
 =?utf-8?B?TXRET0l2dUdqS2NtTmt2QXhmREZWNWF0RldIRm9SeCtnNjZ4UUVVbXZ1WHUy?=
 =?utf-8?B?Z3htQnY1Qk1ZeHdabkFWcENFVTZsMHNzanhqVFpCaytoc0hrOWFGeld1Q1RQ?=
 =?utf-8?B?cnhrZjdoMGlnNmF4L0NRYVk1VWY1cGNuYTlHSmVQTkg1VjJVclBHWXdnTlhE?=
 =?utf-8?Q?+m5wFOSGvbA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHBQN2FmNjNkbHJOV3k4MmdjbXRubXdzWGtnaUkxWjlOajNZRisvYkFGQS9j?=
 =?utf-8?B?aEFHVzA0cnNjVVBicjgyZzgyL3grMHV0VDU3NW1oZjR5Unk5MTRoWVJuOTBj?=
 =?utf-8?B?bDF3L21ZMXBRUGpPcG0wV1pzSjR6OVZpRXc0VmMvR0hicGJvSnJQVDM4N0lI?=
 =?utf-8?B?QzdtdnFYekpjNmtocEdTd0w2aFpGYUNqT1VyNVFrYnFLMGxlRjRmcnBhNDRN?=
 =?utf-8?B?U1pFcW9WZGx0UnZRM01ZNlI1blpadkl5Q250NTFRUHhkS2hzeFVWVnU0Qk51?=
 =?utf-8?B?bHBMazNUQzJxMitvZHBKRFFBWFpYOXV5aDlTSmlOWmwwS0tQR0ViMFVpbDgz?=
 =?utf-8?B?ZDBUMEVncG9IVHdaaU5mM1NWZTFuSGdIdjlBdU52bEdUZUgwSktyUlNTNDZu?=
 =?utf-8?B?Ui9KOWNBU3FnL0gwUXFydFB3eHo2d2hyTEtocXJiTGJWNWw4YzRlN1NJZnZZ?=
 =?utf-8?B?OGgra0hBSy9aQTRKbjJvczNqTXNXQUxaR3h4NzBKSzZQb3FHeVVXQzA0RmRI?=
 =?utf-8?B?NFp2Slo5S3h1WWFpd2NUNzhKOWdGMGJ0LzBLU0ZZbENiWTFxdm9BS08vaUNy?=
 =?utf-8?B?SHppQUIybW14anVNSWpydUdQNjBBNlJhYWhtVDUyc3hsd2pvUkpyNmNONWF2?=
 =?utf-8?B?bWt2SzJ3NVFFaUh6RlduM0NFY2pxUDZCNzhjLzNadVBLeWpINkhuU21wMHJ2?=
 =?utf-8?B?ZU5QUE9ZbWZ5RUpIM1c2QWI2enE3MFQ4MHVXSG5mOS90TEhTZVV3Q1Juc0xG?=
 =?utf-8?B?SXFBaUVSaklrZzFlTk1YMUNPa2tMZlpTeFc2b0c2SHZrMEVrdjVFS28zbklz?=
 =?utf-8?B?RGdpV1lMZjlRYmdNMjQzbWNxekF6S0VHc3NlbjA1dlgwdW42aG5tZzBNbjBm?=
 =?utf-8?B?UEVrT1Y5WVdRYkFuOHhibXgzN2FZOXBndU1wNVhuSjRiK3Fid2RjVThRQjk1?=
 =?utf-8?B?R3N1NnAzbG80Y0swT0w1a1o4aEFOYnVPa0RuZEphTTd5NFlrTXE4a00wSk1n?=
 =?utf-8?B?ZHEzeFNvVWtxSjQ1Tk9DaUdkWjY4NUhkZDF2RFYrdVVaZlk3U3NIVFZTTHRz?=
 =?utf-8?B?TTVrb2lLZW1BN1RFVlNaT3htbFIwVlUrYzRMd1RBM1BBbnc1eEdmcFRCWmJ1?=
 =?utf-8?B?WVlPUm5vQlZTMTdSQk1kZ1NqekdVVCs2eHQ4OG1XV3NoRStDQW9MdTFRNnZ0?=
 =?utf-8?B?YmU4L0wxb3ZSSU02OGR3MCtNK3MyS1BCaWFucEoyakZPVzJHWHcwcHBEbDNZ?=
 =?utf-8?B?RTl1eEFTNkx3cTg2NzFEWDRZYXBkcll1Z3hjcmZ1aTVURVVQbHZFL2hqbTlZ?=
 =?utf-8?B?VUNBcXJxenFhYS8yN3FjY1VuaGM2eG96dTVRd1gzRnRSendtTlpiOTZlcGR2?=
 =?utf-8?B?SHZkMktZdVltWkZvR3phbGdZcktGekVYczVkMmRzYkVwTkFYRXQ4NWU4Ympl?=
 =?utf-8?B?eHFyUmRSdVZSWXRDM3RmZ0U3WERPRWJGSDlsSkVjTlBlSTBTTXUyZ05nTVZ6?=
 =?utf-8?B?ZHFTTjFZVVRGQkQrbFFNMVk0VVlLU3N0eDI3Wm9oWFRlUzN6U3kxV2c3c1kv?=
 =?utf-8?B?ZEZXWm9KQjdzU0FvSUZnUjFrUWdPM2VrSUhSTEZUdE5EKzF6RE44czNLTU55?=
 =?utf-8?B?UHNjWlU5SERoSVF4WGVoWWF0SmhYQlU2RXlHbjIrdmNDSEFWK2NTakZybEJL?=
 =?utf-8?B?NG5DejNjaU42SlRUZGdXVkhtUXcvdE5xWjJYNnhuMjJPK2xSaG41c282bmJz?=
 =?utf-8?B?clIyM2RtMldxSWVDQ3crTFFtM21pWS9CWTYyMXBjTVhnZE9ITCtnazNwajlE?=
 =?utf-8?B?SFVpbjIwN2ZNc3czSGM4b1JFZTFhUC9KUmUra1lyWGtDS3Y4bDB1b2kvazV1?=
 =?utf-8?B?WmhNMUphU2wxNmxUZzFLSEFZUmY3ejlrcjJYd0hhRnpsRlJ0ZzJaYjlQZzVw?=
 =?utf-8?B?ZVovNUdIYnFzSHNUb3BxckJpbWVsaU0rN1AvTFhtdGdYNktMamlhbWoycXc4?=
 =?utf-8?B?eGxlU3hqWEl4b1FHQlZ2eFZaWDAxbmkrOURBMTFCQ3VTcnRRUTg3eFdnVVVZ?=
 =?utf-8?B?OWcreU5aMk9PUWpIT0JyNFpjRldkWVBXZVVvTnZzdExnbEhOMjZncTNLWlhi?=
 =?utf-8?B?Sm9VZFB1aFpwcWJkSmxnZ2RlUUVwZVUyc2hWMUE1Qm1SUXRsbE9idE01V3A0?=
 =?utf-8?Q?3mfQOrMTztrX73y3C13GNck=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b79c642b-b373-4055-da1c-08dd8de45688
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 03:56:40.4703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9g+Lmkwv/rWTpnk12BVHllk8bi0NRHPrVwlBlWbVCgyWV/8ctY3GSinTL60PmJLKi5g+hP8TUQhBzVVcbKwWltQfC0EPxK7poRuu/LYP3qsLPRO5sjquW4OCX1tmR+a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 08 May 2025 10:26:12 +0000
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

--------------g0aRdxnU4oVhwqxywmLlJLsC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06-05-2025 20:36, sk.anirban@intel.com wrote:
> From: Sk Anirban<sk.anirban@intel.com>
>
> In scenarios where the GuC adjusts the RPe, the minimum frequency may align
> with the adjusted RPe frequency. The assertion has been updated to account
> for this scenario.
>
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   tests/intel/xe_pmu.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 094dc0c6c..2e29a4056 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -390,6 +390,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	uint32_t gt = eci->gt_id;
>   	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
>   	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
> +	uint32_t orig_rpe;
>   	uint32_t vm;
>   	int pmu_fd[2];
>   
> @@ -438,7 +439,9 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	 * Restore min/max.
>   	 */
>   	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
> -	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min);
> +	orig_rpe = xe_gt_get_freq(fd, gt, "rpe");
> +	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min ||
> +		   xe_gt_get_freq(fd, gt, "min") == orig_rpe);
>   
>   	igt_info("Minimum frequency: requested %.1f, actual %.1f\n",
>   		 min[0], min[1]);

Looks good to me.

Reviewed-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

--------------g0aRdxnU4oVhwqxywmLlJLsC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <div class="moz-cite-prefix">On 06-05-2025 20:36,
      <a class="moz-txt-link-abbreviated" href="mailto:sk.anirban@intel.com">sk.anirban@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250506150617.1961348-1-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>

In scenarios where the GuC adjusts the RPe, the minimum frequency may align
with the adjusted RPe frequency. The assertion has been updated to account
for this scenario.

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 tests/intel/xe_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 094dc0c6c..2e29a4056 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -390,6 +390,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t gt = eci-&gt;gt_id;
 	uint32_t orig_min = xe_gt_get_freq(fd, eci-&gt;gt_id, &quot;min&quot;);
 	uint32_t orig_max = xe_gt_get_freq(fd, eci-&gt;gt_id, &quot;max&quot;);
+	uint32_t orig_rpe;
 	uint32_t vm;
 	int pmu_fd[2];
 
@@ -438,7 +439,9 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	 * Restore min/max.
 	 */
 	igt_assert(xe_gt_set_freq(fd, gt, &quot;min&quot;, orig_min) &gt; 0);
-	igt_assert(xe_gt_get_freq(fd, gt, &quot;min&quot;) == orig_min);
+	orig_rpe = xe_gt_get_freq(fd, gt, &quot;rpe&quot;);
+	igt_assert(xe_gt_get_freq(fd, gt, &quot;min&quot;) == orig_min ||
+		   xe_gt_get_freq(fd, gt, &quot;min&quot;) == orig_rpe);
 
 	igt_info(&quot;Minimum frequency: requested %.1f, actual %.1f\n&quot;,
 		 min[0], min[1]);</pre>
    </blockquote>
    <p>Looks good to me.</p>
    <p><span style="color: rgb(36, 36, 36); font-family: &quot;Cascadia Mono&quot;, Consolas, ui-monospace, Menlo, Monaco, monospace; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Reviewed-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a></span></p>
  </body>
</html>

--------------g0aRdxnU4oVhwqxywmLlJLsC--
