Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1555CA5FA6
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 16:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837C010E628;
	Tue, 20 Jan 2026 16:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/y97ZaQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B219510E628
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 16:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768926015; x=1800462015;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dPDTI0LKnQKz3+ySc0m8XPGXeylaV95ylBC/qFMvHAo=;
 b=i/y97ZaQeQHPoLI3XuFcIEzZ/SYe+vw6CV+4SceDwz0UKT8/6P3OK11I
 UftHBkGudkBX/z/bpXhFlT6VKc33kJncTkVn1TKPit64nVYBCa/ijBsj9
 fD/zLoJsdNPVBbgjjP42Jm5NwPkqoJl5rJNMeYP8IYbchVPn0aRh+0Q5Y
 4ONgmVp2BDmjbb9SAwc+Rhm+ka1g6HKcS/LSDNW3Gx8bqFuMMczYQtXjh
 5GmIzGDuhw6b3gb8JMZIqR/ArQt9zYwTPO1KYbSfk14CBwpP6CE2Bxlxw
 VTrs5TO6dHvlS/+D6M36CNaQmpzekZSALYTTpTJvB62vOv1MNCsB8/xRi w==;
X-CSE-ConnectionGUID: bhLQgkUtRIiHAlu6lJIMWA==
X-CSE-MsgGUID: TgUjma/HTlilzbrZonOSYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="73994249"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="73994249"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:20:15 -0800
X-CSE-ConnectionGUID: iGCDhUNHR0S9eVsWP6EwYA==
X-CSE-MsgGUID: tmvK33b5SqiXHjv/KQrZ5Q==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:20:15 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 08:20:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 08:20:14 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 08:20:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKR+ps+9GDGZFjNGOoo4mhxmOlfUEl8OTt7rCeCVlLGsQdn8sVWEGYnyjZBmVyvQHHjbVE/z+76lnLygBpcY+0OWiBsNYOVJFBzD7PYIJEXqVSKLj1VrqLOlsR5tcF/4kB/JLV+0/l6Wje5qnfamCnXOwCnCZlYj7nk2KQhrCPrjASeTHjID3ZCHa7I1lRW3A7OynSnOak024lUpbbs6GqBxnIRCTFe1pxlKL8KAmtWjthTcDkstHlmjxfP/H4VOh48VkchdN3AbvZJSkEdQzzE4jixpv7vGP3dgrqk5p3yz1/Gw7a3YoLhzpEoV37XZOqJuJtXGbdGV8rPyT2eHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H09AXkmgq/yYWG76FvPZ3HYLDPdQQM+4wgU2im5J280=;
 b=SiI4pmyM21FS8wF1gV16OGKq1+AOCqvfqBQi+zWvNq4S+GB4SqholiaQX7ieamissv9NHdgFGzvz0hGknk4j3PaJqjtUZdKuq2zLEfb5TZGRIyuTphQEYICO9HaxKUtLon6cciYpGOHiPYVEKniq2q3llrX0NwAhifnauUoCxDlmVhI8O87R8BtvVT2MtLXLUa0BZbDstFhRVpGIWk5bVQRRxUieaDRD+RW3jjWSfqP5ldx+goy3g6GxwDWM2YO6SR9EnviNOnXN4Te4KW9p37+NaF2cOemEJwBt0KzTcHHWXX67msFcQyBSB3Ng5Gk7nOxp92edI6vuKucwrVufWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB8825.namprd11.prod.outlook.com (2603:10b6:8:255::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:20:10 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:20:10 +0000
Date: Tue, 20 Jan 2026 08:20:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?=
 =?utf-8?Q?re_for_tests=2Fintel=2Fxe=5Fexec=5Fmulti=5Fqueue?= =?utf-8?Q?=3A?=
 No engines in virtual test expected (rev2)
Message-ID: <20260120162007.GK458797@mdroper-desk1.amr.corp.intel.com>
References: <20260115201831.6718-2-jonathan.cavitt@intel.com>
 <176852918660.160181.16666554247114220605@a3b018990fe9>
 <CH0PR11MB5444EBFC08E04AE723CE2C3EE589A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CH0PR11MB5444EBFC08E04AE723CE2C3EE589A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:a03:255::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7347b1-97f5-4175-f4ae-08de583fc848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUxmOWFWYlhtb2ovMTVzdkZvaWNFbk1hYXRaSHpZQjNtcUE2OVB5cXFPMzdC?=
 =?utf-8?B?NEp1ZzhFOW9SZmVXbHpVNys5N2k1b0plRlAyQ0ZvQWczYjZZQ2puZFZzZ1dF?=
 =?utf-8?B?QmpsaVBLcVFMaTZCdXAwMFJod3lkRExOWTlpcVBpUW5McXJpS2RKbXY5Wm92?=
 =?utf-8?B?b3RWVmgrNkhucld1SGc2VklWSlYyd1ZienZSdFhhZGQyakU3ZXNPNjF2RytH?=
 =?utf-8?B?SzB6ZlJLbll3Mm5IMk1vY2pycTltZlJ4bnRZQTdjUW1neXdxeEhlK2NzbHJr?=
 =?utf-8?B?RjIxOHlGSWtnbEJSc3BoM3dOTTdRV2w2cWMzWGV2bVlmTzFoRndMdEFkWGRx?=
 =?utf-8?B?SGllY09rWmFNbU9lSG5PYWtMOTFhSlVhMVBDQ1RnNWNjbksweS9JQUc3K0lR?=
 =?utf-8?B?TVg2dVNwMXVpZ3pzMy9ycFMzT0k3OC9WdmxjMWh4MG11Zml3S0Q4MDZ6RHZj?=
 =?utf-8?B?RWFMVUVtZFpDb0VyWWJwekxsN0lHbWpRMDFCdUtITHJHLzg4bEVXVVovdi9x?=
 =?utf-8?B?dkt0N2FOaVlUNGd2eGJYRnBlQmxlRU02ZHZaWnpoM2ZrVmFWRzRqQ1g4RXdB?=
 =?utf-8?B?WmdZbWxydWJVS3dKSXVYdUF0Y0d1S2duMnNiSit4ZzhKVUdOWVJCN0RQcXU4?=
 =?utf-8?B?bXBiZ0tlejhCeFF5SmduQjJxQkR4OVJXL0ZoZFcvZklWNUg3TURKR3FzNWd0?=
 =?utf-8?B?cVc2Ym4xMm1INFpuekxkNjhDUi9kRitsbTJxMzhsYzNTSjBVOXp6SmtaUGIx?=
 =?utf-8?B?cEZIYS9uU3pEbHFZVC9YRTFrcXJBYkw4VnhMQVF2d3g3OXZqRUZhL2oxRndG?=
 =?utf-8?B?N2FYTU13UDA2cEFkaG1YVWxlZlJEZzRZZ0IxamRNa000TkRFcm96UzdOalZE?=
 =?utf-8?B?d2hzTE9tUkxDUTc3S2dnWm9mVFBWK1gvditNcmJBdlBnc3VQLzNsQjQ3U1FY?=
 =?utf-8?B?QnlGajAvdWlkV0M5c3E4ckh3UXdDZzJjRGdvcFRVVGlQWmdEUmNyQVhsc09Z?=
 =?utf-8?B?cGVWZ0NNL1I2RTZCRXFZVVpyM3hUQmZKYk02c1IxbGljRE5NVElNSFB0cW9B?=
 =?utf-8?B?YTVlUmF2L21QdVpiS0lJZHRUN2hqcEhmcjBnaWk4TDVTbGMrZGJpN1k4NVJJ?=
 =?utf-8?B?RWNVU3BVRGNuakNsUmw0azlzYSt6Qmp6OVY5THR0ODdrZnV2TmpYYzlwVVln?=
 =?utf-8?B?U2N5ejNDdDFhNjhyV1FwR2E1REhvUjd3eElKM3dFTW4za1pySG9xRmdiRnVu?=
 =?utf-8?B?eGFCWVd6VHdOYXl5cVpXSTNPQ3p3bXBMdDVoZmR6RTVaTTE3S0FuL1I5WG8x?=
 =?utf-8?B?WjVxbDdpZHZFSjQyV2Zwc2kyajhmR2s3UFlvbm1sa3ZPbk8wblZPWnY1Ry9u?=
 =?utf-8?B?V1UvRU1jK3NGWUtXQTRNeEVYWEdJalVtOHNTOUNPSU9xa2JidnRsZ3FvQW1D?=
 =?utf-8?B?N1ZUbVlBU21ZYmV6OFd5WGt5TXBqbVYrcDNTYVNESWg2Q01hdjRuanh0emsx?=
 =?utf-8?B?Wk85RW8vNmt0dHUybkx3OHlobHhWdWsxWWJUNnFXTGtPOUNyd3lLYTNNQVFr?=
 =?utf-8?B?Wm42Zm5kc1V3cUN4S3cvY0V1amFqSG9oT2VjV3dwb2s0WUdPUWpGM2tiU1Jh?=
 =?utf-8?B?ZTV2L1c1R0ZxQk1rRmwwaVQ2YjF6TytCRzVrR1JmVmU2eWRRNzh6Tm1zMjBE?=
 =?utf-8?B?ZEdHSDVtb1BmNEo1V0RRZUZyd1djTzdhOHc4UEtZcWJvUkF2NDV3U2NibXNO?=
 =?utf-8?B?QWJqcFBiaWdVaStSNkpHV2ZjNGRLZWVtMDNNL1BlS2ZJK1JlbGQwTFhVMHNH?=
 =?utf-8?B?QlNaK29ERUxNcEhseWNrTzlNY3NjZmFpcEc2aFhuV1VYZkx3ejVVZzZFSy93?=
 =?utf-8?B?dHBqWFVqalc3S1YwVitrTzVtbk1yQS8zNWlwR25EVUNHM2k3RnYzZS9wakVS?=
 =?utf-8?B?d3NmelptblJpdWVpRlBzRStqMHRxUVFHdTBuTVVKMWhBLzVSaDVFNUcwNnUw?=
 =?utf-8?B?SmErMGZBTi9ySVFheC84SU9Ea0kxRklrOEo2VXA2QVdQYkxCZGY5dU54MWxv?=
 =?utf-8?Q?bHMkdh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WCtEL241WEthRUtpZC9lcjNvNXFGTjBlRDVLZzFjN0VDNW1WZDl1aHNrbVN3?=
 =?utf-8?B?OEY5OFRwc0w5ZVpUVXJjaVV0eGliU1pOMlBwWThxRGpmejFleVc5S3h3ZzRq?=
 =?utf-8?B?RllDZkdZUkFEUy8yeWswZFY5TWdiSGN6NXNNWEIyT1pWNzY5cTNTRG1hc1lp?=
 =?utf-8?B?UGpxMWJKVThwamFzVEZLQ1pKd29XcDc4NTlWdVlHVnEvRm5QZTBTSlN3QUhv?=
 =?utf-8?B?aWI2U0lmYThtZi9ZT0RDQ2lxdnlEV1N6ZlBjT3FDTHorZTNyY29nN0lGNVdx?=
 =?utf-8?B?OC9RcmhVU3kxS0htYlZoSzYwbjFyKzc2YmpYL3pvMlk5d0RoUzJWdmU1U0k3?=
 =?utf-8?B?REo3OTBhdTZQdW9jdytzazFaM2tWWk1SMjJSMklabFRHem9HSlhxY1FEeFZ4?=
 =?utf-8?B?eW9DaUU3THdkL1o5NWh3UzlhU1JnaW5YaS91TkxIQ1BaVmRnRjY1bzJmTTg1?=
 =?utf-8?B?L0Y0YUhxamNpSWxaUGgySXlXdmhLOWl6Ym55MytCcHliMWY0bzBzNmtUS0NJ?=
 =?utf-8?B?Ni9RR1JpNi9DaTVNdVd3Q2JCcy82UURJV09pM1ZHS2NoQXltcWNXTG96dXZJ?=
 =?utf-8?B?bVNPUXBnOEZheEk4V3U2S1VacFI4TVpIWTBaM1RTRFdVb3YwMEExNWE2bHB3?=
 =?utf-8?B?REg0aGRsdnhwTTAzU1J2UE5saGtNMkFmbE90NW1qMEFrMXd5S0djdmlYcCtO?=
 =?utf-8?B?TFRNa0JoWjBqaUtSMmUrenZ4YTZPRWExY1NSUldnNEVYUUIyZU1TcmRKa2pz?=
 =?utf-8?B?OGppdFhLRmlQeG4rWTU0SUptb0ExREZhSFJTV1VkaGI0RGQ5UjNrZDFRYW9Z?=
 =?utf-8?B?Rnh5aWNkS1lRY21FbXMwYnV6dDBvcWNNY2N2aHZ2V1E1MHc2aFlnRXc1SGQy?=
 =?utf-8?B?UW9QREUyVmdQUUlodDJBMm5rLzNRUnloWFoxbmFFYVdVRGplRk1VV20zVUM1?=
 =?utf-8?B?Qks2TWxjRkZQekJwUzJVUE1MZDg2bTY3UDRUTnJuUTBvNVhxV2JwQmRkb0pU?=
 =?utf-8?B?Zi9JT0s1MDVjMzVhRUNWODJIcnMxSE4xTG1pUXlHMGE0OXRzUzhRazJ4dG9R?=
 =?utf-8?B?UXAweUkvMllueXkreXVTZmxvb3VQamFRcTJYTFU3dklhdG5nWDV4OUJQNHhq?=
 =?utf-8?B?TjgyeEU4N1pXRXBVd3pOaDBVUTlneEhhekZudWc3ZHgvRkZxVzc0S0ZKNGxU?=
 =?utf-8?B?elJ4NHdkWC9US2lQb3pyV2x0RUZSZFZYeUhWdWU3OEROc3RZTFVobkJNbGll?=
 =?utf-8?B?RCtoUm5iRTFkUXczQjBRRXFxN0xNMWY1N2xJaUxqZHZxenBoQ1UwSStVdFBk?=
 =?utf-8?B?Q0lDRnZ0dVpiNjRhRWVQa21yS2YzbERzak5Xd1hCNUtBczJhK1BkdlFtTkp5?=
 =?utf-8?B?OHEyaTJFOTg2TUlsN0NPUzBCdWUxWE9VankrbE9zNjJYQjVhWGJucVUwcjBp?=
 =?utf-8?B?MTIxVWliQnh4SE0xekFpRlJwK1cxN3YrODNBWi9ERldBNjcyZUhhVHF0Nldl?=
 =?utf-8?B?enltaWp4Zzl3YjV3R3VJNWNMMEsvaFZhdWRBNmJ6dTVOY1htZEw3Yi9QeUt2?=
 =?utf-8?B?ckpVQ21DTnIydEZ1Z0g5cnhCd3JoYWo0Sm9xRzlBcmFTRnpCMzV1T0VYejYv?=
 =?utf-8?B?WnB4MmYvdzZuS1FkMVJFWkh0SGJBZ2Jka1pOZlBCbEtHeDZ2VzBUeVBOY2Z5?=
 =?utf-8?B?bGNRVUVsYmI4WHFsTi80SUNaZkJrbjVPc0M0UFZrc2Z3VzRDL3p1RjBzckIv?=
 =?utf-8?B?Q3pFK0hPMDN0RkFvaHgweEhlY2g5NDJqTUlBK2ZuUzc5NERqM0JpamJJbyt0?=
 =?utf-8?B?VUYyWnNaMytjaHl0M0RLOVgwblVDd0pCcW12QVJjbzByQjZqV1BYcnNYanlr?=
 =?utf-8?B?OUhROEhSWHU2N3Rsc3B4QUlnNDFJU3NVaWluU0NpQXFGYis4em5aM1ZQNDVm?=
 =?utf-8?B?K1ZaNngyZEdsY2pDSDNSSTEzWkxuVW5Nd25xNXIrVXBPWTUzR0RWaFFkOVlx?=
 =?utf-8?B?UFVCUDRMd3B5ZSs1RS9MdG12OVlSaEducVJiVXVlbytTb1dBdDgyeW9MSWkr?=
 =?utf-8?B?M2lXZG5GU3lzeSswUUdxTDVEeEtMdjdUa0xxTDN3ZzR4cjE3UWF6Vng3QXBG?=
 =?utf-8?B?SjdoUGVXWWdTK2NrZFhBZ0UzSUg0TWFqOURLdmZISU1iZHB0UzFWZU5JVEFD?=
 =?utf-8?B?YURFbkthTnpUaGZTTlRDVWpOUzFaRkx6c0I0WnFCeFV6WTRGUHlqT1ZQOFlN?=
 =?utf-8?B?WnRvb3ZLbVdZaVdtZDRDL0ZFaEdONW9nQUw4M1NZSUJkdDR1OUc0Y1ZtaUV4?=
 =?utf-8?B?N1NrK2IxTkxiNHYyaFduanorZ0o3Z1I1QXVvVmExb2ZyNmZZOHZMb0ZCc2Yx?=
 =?utf-8?Q?s1VF2EXGhFILaRVQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7347b1-97f5-4175-f4ae-08de583fc848
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:20:10.2297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiyEcuI2UT0ibgdfApfZ4ejHuEoYxFRj0JU3EJHFEXFZp6ysgFgFAhegYCmCF140cnBeLcpV6h9vrp94qmU5QR+8VAVoHdbKzGJyxYXMmFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8825
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

On Tue, Jan 20, 2026 at 04:06:44PM +0000, Cavitt, Jonathan wrote:
> This failure is unrelated: it=E2=80=99s not even for a test that was modi=
fied.
> -Jonathan Cavitt

Applied to master.  Thanks for the patch and review.


Matt

>=20
> From: Patchwork <patchwork@emeril.freedesktop.org>
> Sent: Thursday, January 15, 2026 6:06 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: =E2=9C=97 Xe.CI.Full: failure for tests/intel/xe_exec_multi_queu=
e: No engines in virtual test expected (rev2)
>=20
> Patch Details
> Series:
> tests/intel/xe_exec_multi_queue: No engines in virtual test expected (rev=
2)
> URL:
> https://patchwork.freedesktop.org/series/160047/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/index.html
> CI Bug Log - changes from XEIGT_8704_FULL -> XEIGTPW_14353_FULL
> Summary
>=20
> FAILURE
>=20
> Serious unknown changes coming with XEIGTPW_14353_FULL absolutely need to=
 be
> verified manually.
>=20
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14353_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org<mailto:I915-ci-infra@lists.freedesktop.org>) to a=
llow them
> to document this new failure mode, which will reduce false positives in C=
I.
>=20
> Participating hosts (2 -> 2)
>=20
> No changes in participating hosts
>=20
> Possible new issues
>=20
> Here are the unknown changes that may have been introduced in XEIGTPW_143=
53_FULL:
>=20
> IGT changes
> Possible regressions
>=20
>   *   igt@kms_psr@psr2-suspend:
>      *   shard-lnl: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-lnl-7/igt@kms_psr@psr2-suspend.html> -> DMESG-WARN<https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-lnl-7/igt@kms_psr@psr2-suspend=
.html>
>=20
> New tests
>=20
> New tests have been introduced between XEIGT_8704_FULL and XEIGTPW_14353_=
FULL:
>=20
> New IGT tests (2)
>=20
>   *   igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@vcs1:
>      *   Statuses : 1 pass(s)
>      *   Exec time: [0.00] s
>   *   igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race@vecs1:
>      *   Statuses : 1 pass(s)
>      *   Exec time: [0.00] s
>=20
> Known issues
>=20
> Here are the changes found in XEIGTPW_14353_FULL that come from known iss=
ues:
>=20
> IGT changes
> Issues hit
>=20
>   *   igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-fli=
p:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rota=
te-0-hflip-async-flip.html> (Intel XE#3658<https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3658>)
>   *   igt@kms_big_fb@linear-8bpp-rotate-90:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-9/igt@kms_big_fb@linear-8bpp-rotate-90.html> (Int=
el XE#2327<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +3 ot=
her tests skip
>   *   igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html> (=
Intel XE#1407<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>   *   igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-10/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html> (I=
ntel XE#1124<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +7 =
other tests skip
>   *   igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rota=
te-0-hflip.html> (Intel XE#1124<https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124>) +6 other tests skip
>   *   igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-=
3840x2160p.html> (Intel XE#2314<https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314> / Intel XE#2894<https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2894>)
>   *   igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.=
html> (Intel XE#367<https://gitlab.freedesktop.org/drm/xe/kernel/issues/367=
>)
>   *   igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.=
html> (Intel XE#367<https://gitlab.freedesktop.org/drm/xe/kernel/issues/367=
>) +3 other tests skip
>   *   igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-=
ccs.html> (Intel XE#2887<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2887>) +5 other tests skip
>   *   igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bm=
g-ccs@pipe-b-edp-1.html> (Intel XE#2669<https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2669>) +3 other tests skip
>   *   igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-=
ccs-cc.html> (Intel XE#3432<https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3432>) +1 other test skip
>   *   igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs=
@pipe-d-hdmi-a-3.html> (Intel XE#2652<https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2652> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/787>) +8 other tests skip
>   *   igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-=
ccs-cc.html> (Intel XE#3432<https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3432>)
>   *   igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg=
2-rc-ccs-cc.html> (Intel XE#2887<https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887>) +14 other tests skip
>   *   igt@kms_cdclk@mode-transition-all-outputs:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-10/igt@kms_cdclk@mode-transition-all-outputs.html=
> (Intel XE#2724<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>   *   igt@kms_chamelium_color@ctm-blue-to-red:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-9/igt@kms_chamelium_color@ctm-blue-to-red.html> (=
Intel XE#2325<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) +1=
 other test skip
>   *   igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html=
> (Intel XE#2252<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)=
 +6 other tests skip
>   *   igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mod=
e.html> (Intel XE#373<https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
73>) +5 other tests skip
>   *   igt@kms_content_protection@content-type-change:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-1/igt@kms_content_protection@content-type-change.=
html> (Intel XE#3278<https://gitlab.freedesktop.org/drm/xe/kernel/issues/32=
78>)
>   *   igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@kms_content_protection@dp-mst-type-0-suspen=
d-resume.html> (Intel XE#6974<https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6974>)
>   *   igt@kms_content_protection@dp-mst-type-1:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html> =
(Intel XE#2390<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390> / =
Intel XE#6974<https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>   *   igt@kms_content_protection@lic-type-1:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-9/igt@kms_content_protection@lic-type-1.html> (In=
tel XE#2341<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *   igt@kms_cursor_crc@cursor-offscreen-128x128:
>      *   shard-lnl: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-128x128.html> -> DMESG-W=
ARN<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-lnl-7/igt@k=
ms_cursor_crc@cursor-offscreen-128x128.html> (Intel XE#4537<https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4537>) +2 other tests dmesg-warn
>   *   igt@kms_cursor_crc@cursor-offscreen-32x10:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html>=
 (Intel XE#1424<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>   *   igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-512x1=
70.html> (Intel XE#2321<https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2321>)
>   *   igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-max-s=
ize.html> (Intel XE#2320<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2320>) +1 other test skip
>   *   igt@kms_cursor_crc@cursor-sliding-512x512:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html>=
 (Intel XE#2321<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) =
+1 other test skip
>   *   igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html> -> D=
MESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-8=
/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html> (Intel XE#5354<htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5354>)
>   *   igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-=
size.html> (Intel XE#309<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/309>) +1 other test skip
>   *   igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html> (Intel =
XE#1508<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>   *   igt@kms_dp_link_training@non-uhbr-mst:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@kms_dp_link_training@non-uhbr-mst.html> (In=
tel XE#4354<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>   *   igt@kms_dp_linktrain_fallback@dp-fallback:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html>=
 (Intel XE#4294<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294>)
>   *   igt@kms_dsc@dsc-fractional-bpp:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html> (Intel XE#=
2244<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>   *   igt@kms_fbcon_fbt@psr-suspend:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html> (Intel XE#7=
76<https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) +1 other test =
skip
>   *   igt@kms_feature_discovery@chamelium:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-10/igt@kms_feature_discovery@chamelium.html> (Int=
el XE#2372<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372>)
>   *   igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html=
> (Intel XE#1421<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)=
 +4 other tests skip
>   *   igt@kms_flip@flip-vs-expired-vblank-interruptible:
>      *   shard-lnl: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html> -> F=
AIL<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-lnl-2/igt@k=
ms_flip@flip-vs-expired-vblank-interruptible.html> (Intel XE#301<https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301> / Intel XE#3149<https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3149>) +1 other test fail
>   *   igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>      *   shard-lnl: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.htm=
l> -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-lnl-=
2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html> (Intel XE#=
301<https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>   *   igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-bmg-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html> -> INCOMPLETE<h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-1/igt@kms_fl=
ip@flip-vs-suspend@b-hdmi-a3.html> (Intel XE#2049<https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049> / Intel XE#2597<https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2597>) +1 other test incomplete
>   *   igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x=
:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32=
bpp-linear-reflect-x.html> (Intel XE#1397<https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1397>) +1 other test skip
>   *   igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscalin=
g:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32b=
pp-ytileccs-upscaling.html> (Intel XE#2293<https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2293> / Intel XE#2380<https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2380>) +3 other tests skip
>   *   igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscalin=
g@pipe-a-default-mode:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32b=
pp-ytileccs-upscaling@pipe-a-default-mode.html> (Intel XE#1401<https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1401>) +1 other test skip
>   *   igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-r=
eflect-x@pipe-a-valid-mode:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-t=
o-32bpp-yuv-linear-reflect-x@pipe-a-valid-mode.html> (Intel XE#7064<https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7064>) +1 other test skip
>   *   igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32b=
pp-ytile-upscaling.html> (Intel XE#1401<https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1401> / Intel XE#1745<https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1745>) +1 other test skip
>   *   igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-u=
pscaling@pipe-a-valid-mode:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32b=
pp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> (Intel XE#2293<https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +3 other tests skip
>   *   igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-d=
raw-blt.html> (Intel XE#7061<https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7061>) +1 other test skip
>   *   igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cu=
r-indfb-move.html> (Intel XE#4141<https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4141>) +11 other tests skip
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscr=
n-indfb-msflip-blt.html> (Intel XE#651<https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651>) +5 other tests skip
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscr=
n-shrfb-plflip-blt.html> (Intel XE#2311<https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2311>) +25 other tests skip
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.htm=
l> (Intel XE#656<https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) =
+19 other tests skip
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616=
f-draw-render.html> (Intel XE#7061<https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7061>) +4 other tests skip
>   *   igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc=
:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-s=
pr-indfb-draw-mmap-wc.html> (Intel XE#2313<https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313>) +28 other tests skip
>   *   igt@kms_hdr@bpc-switch-suspend:
>      *   shard-bmg: NOTRUN -> ABORT<https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14353/shard-bmg-1/igt@kms_hdr@bpc-switch-suspend.html> (Intel XE=
#6740<https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>) +1 other t=
est abort
>   *   igt@kms_hdr@invalid-metadata-sizes:
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-bmg-10/igt@kms_hdr@invalid-metadata-sizes.html> -> ABORT<https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-9/igt@kms_hdr@invali=
d-metadata-sizes.html> (Intel XE#6740<https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6740>) +1 other test abort
>   *   igt@kms_panel_fitting@legacy:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-9/igt@kms_panel_fitting@legacy.html> (Intel XE#24=
86<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
>   *   igt@kms_pm_dc@dc5-psr:
>      *   shard-lnl: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html> -> FAIL<https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14353/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html> (Inte=
l XE#718<https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-9/igt@kms_pm_dc@dc5-psr.html> (Intel XE#2392<http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2392>)
>   *   igt@kms_pm_dc@dc5-retention-flops:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops.html> (Intel =
XE#3309<https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309>)
>   *   igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html> (=
Intel XE#1439<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> / I=
ntel XE#836<https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>   *   igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf=
:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-contin=
uous-exceed-fully-sf.html> (Intel XE#1406<https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1406> / Intel XE#1489<https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1489>) +6 other tests skip
>   *   igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area=
.html> (Intel XE#1406<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406> / Intel XE#2893<https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
93> / Intel XE#4608<https://gitlab.freedesktop.org/drm/xe/kernel/issues/460=
8>)
>   *   igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area=
@pipe-b-edp-1.html> (Intel XE#1406<https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406> / Intel XE#4608<https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4608>) +1 other test skip
>   *   igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-=
area.html> (Intel XE#1406<https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406> / Intel XE#2893<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2893>) +1 other test skip
>   *   igt@kms_psr2_su@page_flip-xrgb8888:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-5/igt@kms_psr2_su@page_flip-xrgb8888.html> (Intel=
 XE#1128<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128> / Intel =
XE#1406<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>   *   igt@kms_psr@fbc-psr2-primary-render:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-render.html> (Inte=
l XE#1406<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +1 oth=
er test skip
>   *   igt@kms_psr@fbc-psr2-primary-render@edp-1:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-render@edp-1.html>=
 (Intel XE#1406<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /=
 Intel XE#4609<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609>)
>   *   igt@kms_psr@psr-basic:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-7/igt@kms_psr@psr-basic.html> (Intel XE#1406<http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel XE#2234<https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel XE#2850<https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +11 other tests skip
>   *   igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip=
-overlay.html> (Intel XE#1406<https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406> / Intel XE#2414<https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2414>)
>   *   igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100=
-0.html> (Intel XE#3414<https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3414> / Intel XE#3904<https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3904>)
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100=
-0.html> (Intel XE#3414<https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3414> / Intel XE#3904<https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3904>) +1 other test skip
>   *   igt@kms_setmode@basic-clone-single-crtc:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html> (=
Intel XE#1435<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *   igt@kms_sharpness_filter@filter-basic:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-1/igt@kms_sharpness_filter@filter-basic.html> (In=
tel XE#6503<https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) +2 o=
ther tests skip
>   *   igt@kms_tiled_display@basic-test-pattern:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html> =
(Intel XE#2426<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>   *   igt@kms_tv_load_detect@load-detect:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@kms_tv_load_detect@load-detect.html> (Intel=
 XE#330<https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html> (Intel=
 XE#2450<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450>)
>   *   igt@kms_vrr@cmrr@pipe-a-edp-1:
>      *   shard-lnl: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html> -> FAIL<https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14353/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-e=
dp-1.html> (Intel XE#4459<https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459>) +1 other test fail
>   *   igt@testdisplay:
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-bmg-2/igt@testdisplay.html> -> ABORT<https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14353/shard-bmg-3/igt@testdisplay.html> (Intel XE#6740<h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6740> / Intel XE#6976<ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6976>)
>   *   igt@xe_compute@ccs-mode-basic:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-10/igt@xe_compute@ccs-mode-basic.html> (Intel XE#=
6599<https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599>) +1 other te=
st skip
>   *   igt@xe_eudebug@basic-vm-bind-metadata-discovery:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-metadata-discovery=
.html> (Intel XE#4837<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
837>) +4 other tests skip
>   *   igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@xe_eudebug_online@interrupt-all-set-breakpo=
int.html> (Intel XE#4837<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837> / Intel XE#6665<https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6665>)
>   *   igt@xe_eudebug_online@pagefault-write-stress:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-7/igt@xe_eudebug_online@pagefault-write-stress.ht=
ml> (Intel XE#6665<https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665=
>)
>   *   igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-9/igt@xe_eudebug_online@writes-caching-vram-bb-vr=
am-target-vram.html> (Intel XE#4837<https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4837> / Intel XE#6665<https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6665>) +1 other test skip
>   *   igt@xe_eudebug_sriov@deny-eudebug:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-5/igt@xe_eudebug_sriov@deny-eudebug.html> (Intel =
XE#4518<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518>)
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-9/igt@xe_eudebug_sriov@deny-eudebug.html> (Intel =
XE#5793<https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793>)
>   *   igt@xe_evict@evict-beng-large-cm:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-5/igt@xe_evict@evict-beng-large-cm.html> (Intel X=
E#688<https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +5 other te=
sts skip
>   *   igt@xe_evict@evict-beng-mixed-many-threads-small:
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html> -> IN=
COMPLETE<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-9/=
igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel XE#6321<https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>)
>   *   igt@xe_evict@evict-mixed-many-threads-small:
>      *   shard-bmg: NOTRUN -> INCOMPLETE<https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14353/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-sma=
ll.html> (Intel XE#6321<https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6321>)
>   *   igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueu=
e.html> (Intel XE#2322<https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2322>) +8 other tests skip
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueu=
e.html> (Intel XE#1392<https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1392>) +2 other tests skip
>   *   igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@xe_exec_multi_queue@many-execs-preempt-mode=
-userptr.html> (Intel XE#6874<https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6874>) +13 other tests skip
>   *   igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate=
:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-7/igt@xe_exec_multi_queue@many-queues-preempt-mod=
e-userptr-invalidate.html> (Intel XE#6874<https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6874>) +21 other tests skip
>   *   igt@xe_exec_sip_eudebug@breakpoint-waitsip:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-5/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html=
> (Intel XE#4837<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)=
 +1 other test skip
>   *   igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vm=
a:
>      *   shard-lnl: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-si=
ngle-vma.html> -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1435=
3/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-sin=
gle-vma.html> (Intel XE#5625<https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5625>)
>   *   igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vm=
a:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-=
pat-idx-wt-single-vma.html> (Intel XE#6196<https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6196>)
>   *   igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nome=
mset:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-execq=
ueues-mmap-huge-nomemset.html> (Intel XE#4943<https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4943>) +16 other tests skip
>   *   igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-large=
-mmap-huge-nomemset.html> (Intel XE#4943<https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4943>) +19 other tests skip
>   *   igt@xe_module_load@load:
>      *   shard-bmg: (PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
704/shard-bmg-7/igt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@xe_module_load@load.html>, PASS=
<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-2/igt@xe_modu=
le_load@load.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704=
/shard-bmg-8/igt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8704/shard-bmg-7/igt@xe_module_load@load.html>, PASS<ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-7/igt@xe_module_=
load@load.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/sh=
ard-bmg-9/igt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8704/shard-bmg-1/igt@xe_module_load@load.html>, PASS<https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-10/igt@xe_module_lo=
ad@load.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shar=
d-bmg-1/igt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGT_8704/shard-bmg-10/igt@xe_module_load@load.html>, PASS<https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@xe_module_load=
@load.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-=
bmg-3/igt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01.org/tree/=
intel-xe/IGT_8704/shard-bmg-10/igt@xe_module_load@load.html>, PASS<https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-10/igt@xe_module_load@=
load.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-b=
mg-2/igt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGT_8704/shard-bmg-3/igt@xe_module_load@load.html>, PASS<https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-2/igt@xe_module_load@loa=
d.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-=
8/igt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8704/shard-bmg-8/igt@xe_module_load@load.html>, PASS<https://intel=
-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-8/igt@xe_module_load@load.h=
tml>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-3/i=
gt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-9/igt@xe_module_load@load.html>, PASS<https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@xe_module_load@load.html=
>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-9/igt@=
xe_module_load@load.html>) -> (PASS<https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14353/shard-bmg-2/igt@xe_module_load@load.html>, PASS<https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-1/igt@xe_module_load@lo=
ad.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-=
bmg-1/igt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14353/shard-bmg-9/igt@xe_module_load@load.html>, PASS<https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-9/igt@xe_module_l=
oad@load.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/=
shard-bmg-8/igt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14353/shard-bmg-8/igt@xe_module_load@load.html>, PASS<=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-7/igt@xe_mo=
dule_load@load.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14353/shard-bmg-3/igt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14353/shard-bmg-3/igt@xe_module_load@load.html>,=
 PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-2/igt=
@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14353/shard-bmg-10/igt@xe_module_load@load.html>, PASS<https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-7/igt@xe_module_load@load=
.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bm=
g-7/igt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14353/shard-bmg-1/igt@xe_module_load@load.html>, PASS<https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-10/igt@xe_module_lo=
ad@load.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/s=
hard-bmg-9/igt@xe_module_load@load.html>, SKIP<https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14353/shard-bmg-8/igt@xe_module_load@load.html>, PASS<h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-1/igt@xe_mod=
ule_load@load.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4353/shard-bmg-10/igt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14353/shard-bmg-9/igt@xe_module_load@load.html>,=
 PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-2/igt=
@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14353/shard-bmg-2/igt@xe_module_load@load.html>, PASS<https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-3/igt@xe_module_load@load.=
html>, PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg=
-8/igt@xe_module_load@load.html>, PASS<https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14353/shard-bmg-8/igt@xe_module_load@load.html>) (Intel XE#2457=
<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457>)
>   *   igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-5/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.htm=
l> (Intel XE#6964<https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>=
) +3 other tests skip
>   *   igt@xe_multigpu_svm@mgpu-pagefault-basic:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-10/igt@xe_multigpu_svm@mgpu-pagefault-basic.html>=
 (Intel XE#6964<https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) =
+3 other tests skip
>   *   igt@xe_pm@d3cold-i2c:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-4/igt@xe_pm@d3cold-i2c.html> (Intel XE#5694<https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5694>)
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-3/igt@xe_pm@d3cold-i2c.html> (Intel XE#5694<https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5694>)
>   *   igt@xe_pm@d3cold-mocs:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-8/igt@xe_pm@d3cold-mocs.html> (Intel XE#2284<http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>   *   igt@xe_pm@d3hot-i2c:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-3/igt@xe_pm@d3hot-i2c.html> (Intel XE#5742<https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5742>)
>   *   igt@xe_pm@s3-exec-after:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-3/igt@xe_pm@s3-exec-after.html> (Intel XE#584<htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
>   *   igt@xe_pm@vram-d3cold-threshold:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.html> (Intel XE=
#579<https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>   *   igt@xe_pxp@pxp-stale-queue-post-suspend:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-suspend.html> (=
Intel XE#4733<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>   *   igt@xe_query@multigpu-query-invalid-query:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-7/igt@xe_query@multigpu-query-invalid-query.html>=
 (Intel XE#944<https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *   igt@xe_query@multigpu-query-invalid-size:
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html> =
(Intel XE#944<https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *   igt@xe_sriov_flr@flr-each-isolation:
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-bmg-8/igt@xe_sriov_flr@flr-each-isolation.html> -> FAIL<https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-7/igt@xe_sriov_flr@fl=
r-each-isolation.html> (Intel XE#6569<https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6569>)
>   *   igt@xe_sriov_vram@vf-access-after-resize-down:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-8/igt@xe_sriov_vram@vf-access-after-resize-down.h=
tml> (Intel XE#6376<https://gitlab.freedesktop.org/drm/xe/kernel/issues/637=
6>)
>   *   igt@xe_vm@out-of-memory:
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14353/shard-lnl-7/igt@xe_vm@out-of-memory.html> (Intel XE#5745<ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5745>)
>=20
> Possible fixes
>=20
>   *   igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@=
pipe-c-edp-1:
>      *   shard-lnl: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-=
atomic@pipe-c-edp-1.html> (Intel XE#6054<https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6054>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14353/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-event=
s-linear-atomic@pipe-c-edp-1.html> +3 other tests pass
>   *   igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      *   shard-bmg: INCOMPLETE<https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8704/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html> =
-> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-9/i=
gt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html> +1 other test pass
>   *   igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>      *   shard-lnl: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html> (Intel XE#3=
01<https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS<https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-lnl-1/igt@kms_flip@fl=
ip-vs-expired-vblank@a-edp1.html> +1 other test pass
>   *   igt@kms_hdr@bpc-switch@pipe-a-dp-2:
>      *   shard-bmg: ABORT<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
704/shard-bmg-1/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html> (Intel XE#6740<htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>) -> PASS<https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-2/igt@kms_hdr@bpc-swit=
ch@pipe-a-dp-2.html> +1 other test pass
>   *   igt@kms_pm_dc@dc6-psr:
>      *   shard-lnl: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html> (Intel XE#718<https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/718>) -> PASS<https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14353/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html> +1 other=
 test pass
>   *   igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
>      *   shard-lnl: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8704/shard-lnl-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.h=
tml> (Intel XE#4537<https://gitlab.freedesktop.org/drm/xe/kernel/issues/453=
7>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-lnl=
-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html> +1 other test=
 pass
>   *   igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>      *   shard-lnl: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8704/shard-lnl-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.ht=
ml> -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-lnl=
-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html> +9 other tests=
 pass
>=20
> Warnings
>=20
>   *   igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
04/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html=
> (Intel XE#2426<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)=
 -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14353/shard-bmg-2/=
igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#250=
9<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509>)
>=20
> {name}: This element is suppressed. This means it is ignored when computi=
ng
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>=20
> Build changes
>=20
>   *   IGT: IGT_8704 -> IGTPW_14353
>   *   Linux: xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d -> xe-4388-=
7488f4d19288e0919c24ffc8b2c375e8b7c8a823
>=20
> IGTPW_14353: 14353
> IGT_8704: 8704
> xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d: 733664f1edf3c01cc68e6dd=
0bbdb135158a98a1d
> xe-4388-7488f4d19288e0919c24ffc8b2c375e8b7c8a823: 7488f4d19288e0919c24ffc=
8b2c375e8b7c8a823

--=20
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
