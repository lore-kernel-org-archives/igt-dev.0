Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B66E7719E
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 08:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AD010E5B3;
	Mon, 13 Jan 2025 08:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ogn4X7qI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBD710E4D6
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 08:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736756797; x=1768292797;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ihY+5Z9RBoJsoH3r/nrLX6VG0HIzVPtzP1bQhUBzY2E=;
 b=Ogn4X7qIawbRojVwZWMsG/HKo/A5ejVv38h1SLOMfnU4cObdVlqwAykf
 1VZPylfOud+pf4AiowzFSS77rRcBsvrsLxcogNrqDHzq6vEsOdSs5Q7vU
 3wtslq/91uBMx3EngTGzmkH8YONvsHl7/PPwwf1hcGxGdP/CRiRpXVu2s
 5AWUnVcEoYsINSCGC2rtagtpdQlN60Zka+ngOUYA/8kAHFuogL7v6RMdW
 08ynlCp3h+UXnZwzl3EuiLonQEBXYgUE+m4IheuXBo/oF3ot74uuOQB1F
 Cn4Ea0eHRCFDHLT+irdmarBL14ElzOXFMNq7hUDe4BQYG+7CnLK8YMlal A==;
X-CSE-ConnectionGUID: k0/YSSm4SJqAfVV36ai/yA==
X-CSE-MsgGUID: Z7EEp/a+RV2FeJqzgplmPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36908700"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="36908700"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 00:26:36 -0800
X-CSE-ConnectionGUID: uMczNenGSeCiP5Wti9H51w==
X-CSE-MsgGUID: adyHaW32SxWUHqeTTsvzyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="141689556"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 00:26:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 00:26:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 00:26:35 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 00:26:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TolHrNNtOIwO6D8skrZeFCO3wm8uEH2r1Jzq2KFU8JRGLBvKYJI1o64hlFroO3nQJhJQoBjFUnWSpa6KWMmnSnhhZl6F9LsYr8Izu9D0PvyYh55Xjx1zw8ijY2/bY9ffUIDsQNr0tTS+qxIERZj76fP2umRCy72fjn3lr0/FKTZk5otJO7mOJE5V3jCOBaUkn/Akk/MxpoRWRHcR8MHtxFFg8kbpDl8/3EFx6HwiTptp7RXpr/O6Rd8e8cQyAhteqyNu+MUlboVkVIov/N//SNE6g7C+ph1Bz+zIsqilztlQ6JqLRrRrycSx8WaqmBA3pU1Urj2k2c7H2vElpR/9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cW+TSwpgXF32Xy2V/rRUBq8EAXYo2ESdamaqIA3DeTQ=;
 b=wAaj4bLNKJ0KP3eR3YDuzvaZrSv06U5zk3ks7nrXXT6xAywCL1+yzsM5qsn0C6iDp6dyXXj1yjfzYbF1FcJJXldmCgd3xC6owea3KnMk0TU8pG77sTnk4Kf3PKO7dBYkBNVEzVkvbXQVl0hESfziWtFJuQFL2pEgWrNrjuBNSmX262901MC3Uveb6jnMr3tOZj1nyMz+29Jzaf8CQOUJhOcfad09sXjHE/3XcEe0chJycxtHNjMoukIOKQelvMRz0gdPCkkTqknFejQ67OiG5ABsCqew1lttR/LfMCJL0VC4XrzAeUysQBaU5Xx+PUAg13A9uoRDAmjZCI4Q+w0rNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by MW4PR11MB6861.namprd11.prod.outlook.com (2603:10b6:303:213::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 08:26:18 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%6]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 08:26:17 +0000
Message-ID: <318cf3d2-950b-4be4-b07b-cb5a2c5d6284@intel.com>
Date: Mon, 13 Jan 2025 09:26:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/xe_eudebug_online: correct calculate the time
 diff
To: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
References: <20250110153455.2791158-1-maciej.patelczyk@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250110153455.2791158-1-maciej.patelczyk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::17) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|MW4PR11MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a9d169d-344c-4900-5983-08dd33abf39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVhJNWFCWmh3Skl2Wis1eE5TbUpxYnhIRnE5YlJ0WlhQSnBjNDlDZC85ZTB2?=
 =?utf-8?B?ODBUdzE3UVpOTzhMcVRLRjBTL1JhaUFoSDFiQmFJV3JobzNsb1RSRVRPNHRK?=
 =?utf-8?B?UEkrWkdIY0xRU1k5MzJRdkpmOGcxMkIxUmE4UFdiZGxtRmpjNzRPM2FYaHc1?=
 =?utf-8?B?dWtoM1lmOGcwRkhqVTY2d3BJdmljRFBJYVZlbnNZdlVoSEwyZXBuRE5PVE9i?=
 =?utf-8?B?YlFxMjlVdVFCR3hNMHkvaEpUdEU5TVh2N0NPbjc4OFRNN3JyRnRMREo3MVoy?=
 =?utf-8?B?NE9IK09wdE9YOWMxZ1RmYW9zSmE5SkRXSVUxcStMYWx6QzB3UExPc0Z5c3dt?=
 =?utf-8?B?WUdqUEFLNmVVaW1icndReXpUNkZMdkFmR2d1VTMvLzk4RzI2WFFEb2xsMjR2?=
 =?utf-8?B?ajdkaU1yRTAzQXAwbDlFb1pDc3kxSjl1NDhKbk9sczlhVVNlOUlhOTFYVlJB?=
 =?utf-8?B?Ynlzbk96QUd2UWc5b0ZyaWxxV1ZnbzUrdk1aa3VOUlYrWU43WjNBMWVmSzZS?=
 =?utf-8?B?cHdVQlJobEF2RU9KeVhhRHhTT2ZRdjZqSmU0MkxUWlN2SGV3Z2w1SktkWXU1?=
 =?utf-8?B?QXZaZ0grUGFOSFRZRmxENE1OUm9ZTS9iWmJER1BvYkwweDJXUkRzWkY1N3Zs?=
 =?utf-8?B?TjJ0SHo0ZUVWbzA3dHdYbHU2Z3k0K3gzNGZBcTFmU3NrQ3BHNWk1VXNYcFpr?=
 =?utf-8?B?cE1XZEoybThHbHdXb3d2Wis4cXdPbWFBVmxiRmpxTHEvd2c4TjZmdTF1SzdT?=
 =?utf-8?B?OTNETVFzcWlMSC9BYlNZcjNxb2Zrbjc5WUJad3Q5a1ZhTmhZaEE1L01yNmt3?=
 =?utf-8?B?dGRSZ05ibEo3SEd3QllsNGhqVHJFU2FET0thNTYveXAxUEF6a2JVOWdVSkVi?=
 =?utf-8?B?K2MrNE55amtZUnV2L1RUUDVKbWRGdlJjQk42aWZ3QVM4ajVwdUllR1QxR0pX?=
 =?utf-8?B?UEZlOEpxS0VyUGV6dUNTMHJMZ2R0ditXSlM3b1NBK2JENzVzenFGNVRnS3hT?=
 =?utf-8?B?SE9tdDhTbndQVmExb2NqT2JUeW5CTXpKbXZqd01hR0NETkNMTjlKMm9ReXpt?=
 =?utf-8?B?QW5yTWZyemRxNWtMaEhManJDMlJ0TFd0WG5RNDRaVjNSZkhROWZuN2d5Y01Y?=
 =?utf-8?B?T081NitEZ0MzT0psQ2RwWVc4dVl6V015M25QVm5NZE9hbndwNkE1ZGovdnBi?=
 =?utf-8?B?dkNzZVpsUGpQeVhaQXVhUU1LWFJrczYxcFdLKzlpcVFjTWVoRGxtV3BadVlV?=
 =?utf-8?B?RUZaS0F1enJLYURpNHQrVWQ2MHVLdjJYb3NBa2o3Ui9JUysvTHBWT1hMVGYz?=
 =?utf-8?B?UkJRZy8vcHdKT0dTMVhFKzZUWVVSSEduaHJpSFh5blVtVVZqcW95QkFmVzVI?=
 =?utf-8?B?UHZycHlaVG9ZaFdXdjZHaWhxUUVFL1pvU0hnZnNvM2tkMk9iUW9SSmVDendN?=
 =?utf-8?B?YTJKZHhsL3ZkS0hoQktwd3JPNEVYUmFlaFM4cCswelBieTduKzcxcit6eEZu?=
 =?utf-8?B?dVp5N3c0bkJQY21EaVcybytybVFHZ1NWWVE0M0RTSnB3RktqcGRnNVpCdDNw?=
 =?utf-8?B?SlZsWkZ6MzJTZzlHai9WRTZBWjYzQmxIdmNra2x2RFFwNGRlY3dsUWJYYURT?=
 =?utf-8?B?STRoc1plVDhHMzhXbTFZRXZ0NGY1ajFoaCtQSFU5MGZSbytNeWZmd09CM2ZF?=
 =?utf-8?B?S0drVFlhbkpQMFNBdWZtOExLdHBWTEFWSGRBV1EyZHhPamwxc2NHRmtubmpG?=
 =?utf-8?B?dW1pUXVmdlo2em1ONzZ5RWRzL1N0cE1aRTZIVEFya2dBc2YzNE9nMGVta2I1?=
 =?utf-8?B?V3k1UENFbmhaQjl3ZlZZSlZTNGdrNUw0VVk5R1FjZFkzRTJvS3pDY0V6RjZM?=
 =?utf-8?Q?UtsQUoXPBh1wP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dktDWTNLNVhUTW1sNGhjYU9RbjdoOWFPa0xnbU9Xa3UzRmRMWk8wOGZwV2Nz?=
 =?utf-8?B?MXdHaVhSQkh5aTc5YWdaRExWR002bEcrYkxLd1BVYVdEc0dYbENaSHVvZG0v?=
 =?utf-8?B?VWEydFJXdVduVmd3QmxqeVZ5dmFxZ2JtanVvWkQycVNjeVlSYjUyeEl1UTll?=
 =?utf-8?B?dVhiZDNaN0lxODcyOHpVa1g3UUNCS05RdUhzd0YweDV2elNyNGswOFlFdVdQ?=
 =?utf-8?B?ZFIyZnhBMVYyMExWNG5jMnBkQ25hd2xXaEtSTmpyQ1g3Tzh5NmdPTms1dWdP?=
 =?utf-8?B?L3NrWU5vaVlGNVRDV3ozbzgyT29GcUUzUER0SXVzS1I0Q3NZRXlNaFVmcDZG?=
 =?utf-8?B?UEtCRytFK0hjakl2T0NzV2hhVlZ6TnVhYUlrVWllTlBKL2VZeG5sczJ4ak5S?=
 =?utf-8?B?SzM5SWhoaDJrbEhiZ2ljelJLTm05VmVldUFxSVB6dkRuekl4Ny9VbVA1L3Fs?=
 =?utf-8?B?dU95bUU3RG5YVmxlN3VZMnV2M3BTcVBXTU5kRWRHbmRVb0FBeVNPSDcrdkdT?=
 =?utf-8?B?OGh4NXRWdzNRMi9mV25VTjQ4OEI1OGZZL1dpQktrNW9ITlp6Q2sweHFmV2hN?=
 =?utf-8?B?VWUvOE5qdGV5MUhaVTZGdnlvYVpWWGQyL3RpQjJBQjBiR0pnZXlIVktmT1R0?=
 =?utf-8?B?aDlUQTdySEFqWnhua3hzZHFhd28rQ21nWnpYM2FSUGRBVUZVYmpsK3hjVy81?=
 =?utf-8?B?bzFHUmcxYVF3VmN6MnRaT05JeHJ5NkJoRzRPR0w1M1JOb3E4SVk0RlJsajNC?=
 =?utf-8?B?VE44bjlEV2NOWW82SnZSN0lvRkNHZVl0NzJUU29hbk9HYUhXdm9GUjdOV2tk?=
 =?utf-8?B?eW15MTljQW1UOUFFNmk1NkxyRUpZbmdyMzdSdStUSjJHM3VMczBBRFE4NElY?=
 =?utf-8?B?UFBUa0w2R1hKS214K1NsZnZiVlZwZWxobHpjdTZkaGxqcU9QRCtRL2IycW5E?=
 =?utf-8?B?dERjWUFuUlROZkpYditjK2lUd1ljUVp1VFJaTnhrNTh0VG9vTjVnQkJ3NUJK?=
 =?utf-8?B?NEVoZWFoSGJlMG9aRWhZbHNqTFZUcU95NHJQSDNhejRUWHhtTm81Sy9rR0sw?=
 =?utf-8?B?dElZbnFjNDZiNlVYaXpFUWhvRWFTZWVaakhMQktvQUtkSkI0K3lYQlN3NTg3?=
 =?utf-8?B?MDJWV0xENENSV0xPQlB6UElxd1JOZDllVm1pMUR6emdWckY0cmFoREFjdVYx?=
 =?utf-8?B?RVdJNTE4TkpYeGlkT1ZuZ0RwZmV1S2RlelM5UGxpdjN1YWRORW1tVVdETElH?=
 =?utf-8?B?dW9GOWVEMkdITGk4US9wVEVIa0d4ZG5QWjJiWTlHLzBteXlSZlJyZExVellm?=
 =?utf-8?B?blhmQXlSbjJwR21vd1F4bHpCMVBRcWFaRnFvUXVaWUhTbW5KcDFkZHVSa0pZ?=
 =?utf-8?B?Q1owQXpqNEh1dzR1ODJMd0M2SWVaZjNDb0w4ejRyTGJNR2JUTmJVVXB5bmkx?=
 =?utf-8?B?c3QvNVgweGdQS2Z4Wi9ML1ArUjZ2d0RXcnZmR1VNTTkrcTVTdUQ1dDdlRGdG?=
 =?utf-8?B?VUk3NEs1VWhLbXBmOXBtdm8zWFl0bUM0YWxDOEU2dTh0ZGQyMW81WU1HRnRu?=
 =?utf-8?B?UUZ1RXRlODBPRXF5aklwK0FFUkFPelQxZm54eHFnQ1FOUGw5N1ArTjcrRWpI?=
 =?utf-8?B?cUdJdGFBN0o0dHdrdmVDeXhhVGxKdmtoNFNaemMxWVpTT0trMlZCWDJxQmtx?=
 =?utf-8?B?ZHlLZEJPRE01K3pycUVTTHYrRzBjelZMMDJtY2FSTFYwR3h4Wit0ZFlFdVVX?=
 =?utf-8?B?dWZzUGtaTTRRZTRGdXBsTGI3aXlSMHNJSUpySWI2WDUxSXVLSGRPQlY3M2d3?=
 =?utf-8?B?c2Z6TFRoc2JiS2hyeUlsVkRxWU9YUldWd043VjNncHJqN0xtRDMxOVdyN2dT?=
 =?utf-8?B?d3A5dytIZ0VPbVpaWXRBS3hqelU1NjZvRTZwTG0rZkY1VWd6bk4rNy84aWxE?=
 =?utf-8?B?eFpSZWZlUEo1K3kzRVNHdy9vc0tGUmp5bFZrcWV6b285bGhtVDBnQi9RTDF5?=
 =?utf-8?B?Snl4d0Zad1Z1YldwZnNqU2NWL3dNVnhXM3oxQk9LRE9BR2hIK1R3V0J4Yko2?=
 =?utf-8?B?eGJxZVZvbnM0cjBtNzZUNitMclpnNTBSd3pDVk9ac2lzSFY2ZlFWUGVyWlBp?=
 =?utf-8?B?UkNteDBGRjR1VDNzT245R2xnRzQvUythUm4vNitHYW5rMDYyVGk0U3dUd05I?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9d169d-344c-4900-5983-08dd33abf39b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:26:17.8336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/M6BHLm1C5s9HLDi9rQeYK1z1Wx3uhu6osB3G8BedIP0/tKOwI7mGMU7JIN1c8dakVVSmuHP1bDiCB+HlUAhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6861
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


W dniu 10.01.2025 o 16:34, Maciej Patelczyk pisze:
> When calculating time difference between two timespec values use
> library function which does it right.
>
> Previous way wasn't working well on slower machines. It was only
> taking the tv_nsec field from struct timespec.
>
> Fixes: bbf1730baf ("tests/xe_eudebug_online: Debug client which
>                      runs workloads on EU")
> CC: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 052774a3b..f532387af 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -2235,6 +2235,11 @@ static int find_suitable_engines(struct drm_xe_engine_class_instance **hwes,
>   	return engine_count;
>   }
>   
> +static uint64_t timespecs_diff_us(struct timespec *ts1, struct timespec *ts2)
> +{
> +	return (uint64_t)(fabs(igt_time_elapsed(ts1, ts2)) * USEC_PER_SEC);


It seems igt_time_elapsed handles correctly case ts1 > ts2, so the 
conversion looks correct.

Something to bikeshed is the conversion from int type to double, then 
int again, up to you.

I think there is no need to explicit conversion to uint64_t, no big deal.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


> +}
> +
>   /**
>    * SUBTEST: breakpoint-many-sessions-single-tile
>    * Description:
> @@ -2255,7 +2260,7 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
>   	struct online_debug_data **data;
>   	struct drm_xe_engine_class_instance **hwe;
>   	struct drm_xe_eudebug_event_eu_attention *eus;
> -	uint64_t current_t, next_t, diff;
> +	uint64_t diff;
>   	int attempt_mask = 0, final_mask, should_break;
>   	int i;
>   
> @@ -2318,10 +2323,8 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
>   	igt_assert_eq(attempt_mask, final_mask);
>   
>   	for (i = 0; i < n - 1; i++) {
> -		/* Convert timestamps to microseconds */
> -		current_t = data[i]->exception_arrived.tv_nsec * 1000;
> -		next_t = data[i + 1]->exception_arrived.tv_nsec * 1000;
> -		diff = current_t < next_t ? next_t - current_t : current_t - next_t;
> +		diff = timespecs_diff_us(&data[i]->exception_arrived,
> +					 &data[i + 1]->exception_arrived);
>   
>   		if (multi_tile)
>   			igt_assert_f(diff < WORKLOAD_DELAY_US,
