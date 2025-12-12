Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F00D44149
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 09:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E6010E5B4;
	Fri, 12 Dec 2025 09:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcdIbuzL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D172010E313
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 09:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765530063; x=1797066063;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vZGh8XQR7sOGEIfCCrAt84micd5D6459RsQFzXBd7Jw=;
 b=kcdIbuzLZ4N2lf9bgzXztqWUY48wrpScIIh/RvnXTIUEnFnYTJMxpTRx
 ArWrgfWmOIyQ9B82LUJU9dMN3aYpuYfKuwkcRoLIqR6sAmvkogSVqLZE5
 0d5bvjGgkuM9m9OTYLzsITgb7CNltzglB6Sb8YXvLlzPjqZUd7Q6EWRfi
 cmXNbFa9YKpJd1pENnLyrGwG8jyCnKSywuxaz1UzxpsOZxxKqrUR5MDeM
 Lwzi7jZXKKwAZ9W8pHSNvfVD9fBHN/FA4IBMUplnJtVywk3dVZ6jGrw5P
 am6QqC4kmqBdYlTtjHuO80exrlXBNh/oOUQlBLWOlIwe83tAYngQ10ipv w==;
X-CSE-ConnectionGUID: HCN8QBdBTRCO9dZOejy5sw==
X-CSE-MsgGUID: c98hH5vPRmK47pt8/qtIXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67258260"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67258260"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:01:03 -0800
X-CSE-ConnectionGUID: YB4Mz3IBTtmOIcEu+y+0LA==
X-CSE-MsgGUID: mru8ZsGxQcOHDl87zTjtdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="234432471"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:01:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:01:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 01:01:02 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:01:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeZjJtqjBOWK2hSXHBFhz9/CvnQP7ndyd2y38RWDN8S1wzdiibUmKSw/ju3lW1Hd6DoJCOVC7b30hZG9Vc+p/insJUp+jatVPxiJsGrt0f0GUKOJATy9wg5DPJB/KWbgeM2Ts4qOC55IXcMjbTZmrrACDHHjPBLtHqJG5kZGwzJ0+/RMKE4bbMFZlvS2VnydJ354htDTsd06nDttI/5AkQPKRgCplDeIZev0ZUJpnPF7JV8fS+aLzWVDekcNiW7mVFzsoIPdFnI0Ey36pmJh4CCM1IPRVjmY6nKYQPue0UBvxV/0ENgDo4sB1obT2HdRJG9gHISAIh+zWGN4n04X3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUkdYoudHRFFhqCi35QRvTTIqKuZdcIZ0pHqrgT7PsU=;
 b=tAucEHrOpgGHD1A489jSnfJ8Mpipi8NMfwf7jePlUQ9qwtYFr2NGu/wa+wu/mWNbDxId12yE5pgNujSh7QzpQL4bNGjSm840UcXjbSJkeIUSAIf8sf0lOtKQgaZ0Stujot5HDiCGO19bofIJrm8lLrLK9U7IrgFSgBIk5T/sQiWxvdo388za4ATukpCnRmbou4VqE0x47hZJnCUp1NdwtlGMLEISsQjnEznFvntJTZP0FcaBlaDUw9aqMNgQZ8QW56EpekL7HNYRidranKuZCMlWKH7KkAYgjHsL5r+hXdPyeUbFyd2NxCYuFazlkxhd72f8ZNKjvBz258o9R7dAmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 09:00:59 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:00:59 +0000
Date: Fri, 12 Dec 2025 10:00:54 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_exec_system_allocator: Add new
 SVM compute tests
Message-ID: <aTvZxo0yydQpB_BF@fdugast-desk>
References: <20251204113726.567142-1-francois.dugast@intel.com>
 <20251204113726.567142-3-francois.dugast@intel.com>
 <mey3oehlsrzsteourc4m2uk7g7rynk64glwngl623xgd33v6ga@gdhmyrplssu4>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mey3oehlsrzsteourc4m2uk7g7rynk64glwngl623xgd33v6ga@gdhmyrplssu4>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::6) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: 163e7dcb-db15-47fa-6012-08de395cf7e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlFodSs0YzBDNVY5VXpSZ3RtU3BNazBITGtMTVJiMGpzeWEwekFFeUt4anV1?=
 =?utf-8?B?Z1h4WnBPdzQ5WWVRU0VVSVBxMGhsS05Zbm1mejFjVTkzakttK2pRYjFMT2Fl?=
 =?utf-8?B?bTZVZGtlb05KbXNlVjhrSGlVTDI0WnlqUGlRQlJwVFFJeE5KSWlsbWdRNWo3?=
 =?utf-8?B?UDRBNzU3YUFzQVIwZjh4ejg4dGRyczZhV2hnR3ZVdHV6RFRaTkV1c2JiUkcz?=
 =?utf-8?B?RkJGNTJkT255RkxqdkY1L1owTmdkUmZ4QVVTNDlZNmhiTE9XRjNqZXUxNDU0?=
 =?utf-8?B?RTJnVmJXRktCT05TcEFURG91N0RrOGV5NmVDbkR2MEJzdVJ3Wk45SHlpakQr?=
 =?utf-8?B?NjR0N2FueDFlZlczd3BuVjFGMG9yWjAwdmJjeUUzbk5rOWtJY2Q0V0NYT3N5?=
 =?utf-8?B?MG5XVkVZVEc0czk1MDJtTnRSbGZ1YXVsYXUrZFczcHJjUTU2STB0ZmlrSkR4?=
 =?utf-8?B?YkdPajVGU0xzR3hDemZFa0VoWnl0NWJpNFZwQ1NuWFI5VkFpWkZoa1RUcEcz?=
 =?utf-8?B?ODJGOWwrcy9pbk83UGFNS3UyUU5mOGc2ZUhiaTZwd2hXT0dTTWl5T0N1ZGJz?=
 =?utf-8?B?OHpPUUY2NTdEVTk3d2pnMmdvaW9MOXNSWi8vanVGMENjR0ZkYUNseWVuVHJs?=
 =?utf-8?B?clNjT0pYWHhtbHozd3FoZUJScFlCbmJ5TGtYaG5qMFh3TkR5ZG4welZwcyt0?=
 =?utf-8?B?SjhNTStqano3UjJhWXhYZ28xaEM2RzdDMnlFT2w0bzhUZnN1cC9YLzNOb2FT?=
 =?utf-8?B?Q0ROdDgyTEQ5NGYxekZhVGhqc1l5UmY4eGRxOUdFS3pUSHJSS0xQclFjS2RN?=
 =?utf-8?B?Zkp5OGIwNXhOaG9oSUJwb0xNSlBOZHBXcWVTSGw5ckNnQi9lV0R5UXg4ZjVM?=
 =?utf-8?B?NTUvYlptTjg0N2ZkSmR6TmtvWG9IL1hHL1lUR0tLS0FsYkVYQlQ0RkVGT2dv?=
 =?utf-8?B?VDRlalpWWVJEQmkzdFZoUWVaTlBoTFlKSzhzcUNTcXBVYytqdGE5WGpQSmRC?=
 =?utf-8?B?bFZqQXVyNjc2akFFb01MekNaRHlhaC9MV0pNdnlJMEtxN1V2ak5vWUpONE9z?=
 =?utf-8?B?Z1puSldybVFLRFhUY2dGK21MVXJGWExEb1BFRG9kSXIxcHNzVGNJSlE5Q1BH?=
 =?utf-8?B?bVRBZTdLUjd0aGlPNnBMekFuUWx4anlIdWh6RFhwZjhSREorRm14SnZTM2FY?=
 =?utf-8?B?cjBYQ2N5ZG9ESm5yRG5mbk9PUHhSQzFycGNjZ2toQ2lCRW45YTBackpCYTZp?=
 =?utf-8?B?YkIzUjNITVVkbFRYNDMrTVVWQnUwbnhtVnUvQzJiZlJubE4xRm5WQnZXZmRo?=
 =?utf-8?B?cTg4bEtLcDdoYUFycUNLcnJpUXpoL3VvakpmSzFqbk83czhXdGxYQmxRdzV6?=
 =?utf-8?B?WkhOTFVNTzNCN2dvNVRLeFRaVzh0S2tsMDdVamJMdUFUd21LYjVqYkh4NGJI?=
 =?utf-8?B?dCtnMGcrR1d4UDZ6ZGs1WldaRzFHNjFYMVExMmIrN1VNdWwyVlluWnFGMGVs?=
 =?utf-8?B?dTVPV0tUbFIxTVVOT2JhUkdUUm9maEwxLzNuQ3I1d0U0ekNFMjNHU0hsWWNk?=
 =?utf-8?B?RmZ6ZWRIYm03UmFtc2c1c0hhanNSb3hOQ1QxZHVncXZwVG5KaTVYNnRDakZj?=
 =?utf-8?B?ZU9DcENVNytjSzl0QUg3bW1UZEovZmJuMVVzWStYRmNGa29LbkZhZTFMNklC?=
 =?utf-8?B?SWprOWw1NHJTQnVhM1pIL2hFNHVodUUxR2ZvTEVqQWV4cEdaTU84WjFycUFR?=
 =?utf-8?B?ZHBBeURGWHZpd3hPQjdhYnRLNERpY0hLMWRwVjJaMVhCMkZWa1JrdW5UMFB2?=
 =?utf-8?B?MUNQMENicklsbEFXMStGVW9qVFFwUlNiT2hqTnpnQmtWUVdsQ0hVa2ZhLzVz?=
 =?utf-8?B?eWYvSzBZMVVZbnZqMmVFM1FuWXV4WThZSTZoMmpsaGp3ZW5zQ3MyMllseDc0?=
 =?utf-8?Q?tEHG0T+78jwoins5Fb3f5qWcivrD+lzq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGJ2QVZjT0VzdWJNVlY4Snd5TE1hT29ITlhJRVpsbm9NVFhrVi84WGRqVXBU?=
 =?utf-8?B?S3NlZURmQ0tZZUEwQnh0OFpOWmZCci9TOXNzeUQ3cXgzY21ZSUVyV0hpWkNF?=
 =?utf-8?B?WVRDRGxTNnNtcnk0RGpxN2hBaEtjZmUzTys3bzVOZC9mb3NSQmEyekZxbGlD?=
 =?utf-8?B?Vy9wcWNCKzlkUmlDWFY0dTc1UTdoR3ZOZUxjWUV1RFY3RXhJY0s0cHFGU3dV?=
 =?utf-8?B?RFQ1MkRtUWUxU3pqcFNUT1RMQ0tIdGdiWldnRHZoWk5PalFkSXhJYUwxa2hV?=
 =?utf-8?B?Vk1hMTRQNnd1dldBa0EwUjZNSGwzYjdmalhWR01JR1h0SlUwU3doNm52a3hY?=
 =?utf-8?B?VjNqaWJGYzR1eG1tcnlPUDBEbmhTemwzd0p1ZlpBWWxEeEc5L0xneG1PUlBY?=
 =?utf-8?B?czkzT0tpbEtscFptRjdMRjZlSkVFSlVOZU55Q1Nidk9BK2g2VVBCazZUaUZ0?=
 =?utf-8?B?aHVJWmFZS3NreVZvbGhNSXVpUmt3MDVnaDB3SWtDL3hzcjY1UVpUdUdnWGtl?=
 =?utf-8?B?NXVRSWpEV3h3WG1iUlFXcGpzUVEzYTh5OEpkZkpxTzVOZlQwYjNvWGRzUG9E?=
 =?utf-8?B?N2creElWY1dIVUpyZXBWaTRjMGhrZ3Vpdzl6QThGWVFTeDhqcWxSWDZqT3lM?=
 =?utf-8?B?SndWUExpQkhWUmthRWlJVXpzaksxYko2SW83QytLSTZNVTBMM0NuNXVzU3Vj?=
 =?utf-8?B?K2lWOSs3RG5iS0t5VnRRVWtrNG1ybXV0VXM5LzVLeXhtZHlWYWpnVGVScWp6?=
 =?utf-8?B?RzFFOVMwOFVKYmVUcWs2YWdGRHZJOXZXcVhWc1ZPbGxOL2V2SURjSStndWlH?=
 =?utf-8?B?bEVtUWtiRGVmOGJKaklQaVRQTmlra01Gb1pQdDliWW5Pa3JSTTdTdHpsZ1pD?=
 =?utf-8?B?VEJ2Njl0ZDFxQ2g4VDFwZmFRWFAxK3lJK3FyYnlKUFpITnZhdXpJR3pJVnI3?=
 =?utf-8?B?blRkRU1PeVRaNTYrVjBBWUF2cUFXS0ZDZElwQ0x1U2JCTURZWXZHakZxc2o3?=
 =?utf-8?B?SnpRK1grWUFzdzRsOXVFM3J4Z2xMMzlIcUJDYzdXY3NFaU9sYjFPck1saGFY?=
 =?utf-8?B?Y2VuN2xtWEtXb0pyTVkxVHl0aWl0VmFTd0NYcXBrVUJlcVBLNmVoRXZidUt6?=
 =?utf-8?B?Um05WUlmbGNqanlGU00wR1NOenFSRmVkZkVVeEpLUFhkMGlrc0JVVHQvOUxz?=
 =?utf-8?B?R0FzQWRabURqNW5GQTNCVHI5aTJMbE95RUZZQXJtMHY5RUN3REJkcnNPdGJl?=
 =?utf-8?B?dUxidUV6MUtMQkc1b01sTDJqSXNBcE1yTE9SbDhGWTZKdjFqSy9zWDhKdTBD?=
 =?utf-8?B?TitsL3dBTDVkbjByd3o4MzVKVXZZNm9mZ3dBVEduN25Ka09NNzlaYy9yUEpH?=
 =?utf-8?B?Tm10VGhmL3Rud2VGaE5ick9sbE1JUWEzVjB1TjRlM0x6cG5RZ1BnclZaRmZT?=
 =?utf-8?B?M043bGtLZjZIcW1Tdzh1dklOZjJYc3hBQm1DbzI4MEd5MTdPbjlaVktnMDRQ?=
 =?utf-8?B?VXV2d012NnkyaG1PZnkwLzQ1c29iWEZNa0huNlpJelZBYkkrdzI1ZUs0L1Vq?=
 =?utf-8?B?cDF6ZTk5NjZERFB3ODBUMHJUemNaWmdVYXdGK2FMeStzdFNhVThBYmJtL251?=
 =?utf-8?B?NnJYYng2SGNuZFNiSkdjYkIrWWtPS0RLRGlQeCsvS0R6NEZ0TDgyOFFHdkJ6?=
 =?utf-8?B?VGszNVY1RkUzM0hnVlBVU1FRMmVPSXVBcldXSzNxRWpHSG44YVI0bFV2dnEw?=
 =?utf-8?B?WWdmWWhjbHhqQXAxRVJJMmtiV1N4UDlORkZPMFZjdzYyb3RWUlRIL3NUMXli?=
 =?utf-8?B?bVJVWFA0ZlE2Vmw4elU3bThZTCt0V0J3RGdYUUZLZEk4RnRLRGtmWHF5L1FS?=
 =?utf-8?B?VDZ0Y2JyaTd2dGtkTk1hYUc0YzhheFpmME5UYWFobnNTZU4wdUIrNUZ2cmQ4?=
 =?utf-8?B?TE1SalpzeFV6akNuVm9la2R1YU5pZ2RqaVFybTZCN2ZCY0VROUE2eEFXWUhP?=
 =?utf-8?B?OC9hK2hNYzVFalBXN1VZTVN6UFNzSTU3M2c2RE1ENzNDcHdJYWtML0F0ajNs?=
 =?utf-8?B?TkhsVmtkUWNYQVBxNUFncFkxa1lObldIUTF5RUNRS0F3S2w4MVA3WmhwaW9U?=
 =?utf-8?B?MVh4RUhrVFhYbUU0V3NpQk8wWDlyUlNENXlzNXRoTXphaVlWWGRub1k1OVk1?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 163e7dcb-db15-47fa-6012-08de395cf7e2
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:00:59.3294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHVVUbuLt8rLnuq2IUSLQ1utHnSgIpHbkTTnNsylXm2IMf48OZodKmMxEE+gBPgK6pF2yY1aX4hGzxNd42yNx+U01BK+SlQFOBZ/TRAogKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4878
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

On Wed, Dec 10, 2025 at 05:41:07PM +0100, Zbigniew Kempczyński wrote:
> On Thu, Dec 04, 2025 at 12:35:59PM +0100, Francois Dugast wrote:
> > These new tests allow triggering GPU page faults from the context of
> > execution units. They can be used to create single page faults or page
> > fault floods, of various sizes. This is helpful for debugging and for
> > performance profiling.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  tests/intel/xe_exec_system_allocator.c | 60 ++++++++++++++++++++++++--
> >  1 file changed, 56 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index 43be307fb..95146a5f3 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -2172,13 +2172,37 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
> >  	munmap(pdata, sizeof(*pdata));
> >  }
> >  
> > +/* compute flags */
> > +#define TOUCH_ONCE		(0x1 << 0)
> > +#define ACCESS_DEVICE_HOST	(0x1 << 1)
> > +
> >  /**
> >   * SUBTEST: compute
> >   * Description: Run a simple compute kernel with the system allocator
> >   * Test category: functionality test
> > + *
> > + * SUBTEST: eu-fault-4k-%s
> > + * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer
> > + * Test category: performance test
> > + *
> > + * SUBTEST: eu-fault-64k-%s
> > + * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer
> > + * Test category: performance test
> > + *
> > + * SUBTEST: eu-fault-2m-%s
> > + * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer
> > + * Test category: performance test
> > + *
> > + * arg[1]:
> > + *
> > + * @once-device:				touch the buffer only once, from the device
> > + * @once-device-host:				touch the buffer only once, from the device then from the host
> > + * @range-device:				touch the whole buffer, from the device
> > + * @range-device-host:				touch the whole buffer, from the device then from the host
> >   */
> >  static void
> > -test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
> > +test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
> > +	     unsigned int flags)
> >  {
> >  	struct drm_xe_sync sync = {
> >  		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > @@ -2205,11 +2229,14 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
> >  	compute_input = aligned_alloc(aligned_size, size);
> >  	igt_assert(compute_input);
> >  
> > +	env.array_size = (flags & TOUCH_ONCE) ? 1 : aligned_size / sizeof(float);
> 
> How this corresponds to establishing input/output size in the pipeline
> creation? I see there's:
> 
> 	bo_dict[4].size = size_input(execenv.array_size);
> 
> where execenv.array_size even if assigned and is equal to 1:
> 
> 	if (user && user->array_size)
> 		execenv->array_size = user->array_size;
> 
> is altered by size_input() -> return MAX(sizeof(float) * work_size, 0x10000);

The test was using execenv.array_size both for actual array size and for
loop count, as third argument passed to the compute kernel, which is
ambiguous especially if we want to control both values independantly as
in this patch (it worked anyway because work size was reduced).

Let me add a prep patch that clearly splits between into array size and
loop count.

Francois

> 
> --
> Zbigniew
> 
> > +	env.skip_results_check = (flags & ACCESS_DEVICE_HOST) ? false : true;
> > +	env.input_addr = to_user_pointer(compute_input);
> > +	env.vm = vm;
> > +
> >  	for (i = 0; i < env.array_size; i++)
> >  		compute_input[i] = rand() / (float)RAND_MAX;
> >  
> > -	env.input_addr = to_user_pointer(compute_input);
> > -	env.vm = vm;
> >  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> >  
> >  	free(compute_input);
> > @@ -2361,6 +2388,13 @@ igt_main
> >  		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
> >  		{ NULL },
> >  	};
> > +	const struct section csections[] = {
> > +		{ "once-device", TOUCH_ONCE },
> > +		{ "once-device-host", TOUCH_ONCE | ACCESS_DEVICE_HOST },
> > +		{ "range-device", 0 },
> > +		{ "range-device-host", ACCESS_DEVICE_HOST },
> > +		{ NULL },
> > +	};
> >  
> >  	const struct section intel_get_pat_idx_functions[] = {
> >  		{ "madvise-pat-idx-wb-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> > @@ -2604,7 +2638,25 @@ igt_main
> >  
> >  	igt_subtest("compute")
> >  		xe_for_each_engine(fd, hwe)
> > -			test_compute(fd, hwe, SZ_2M);
> > +			test_compute(fd, hwe, SZ_2M, 0);
> > +
> > +	for (const struct section *s = csections; s->name; s++) {
> > +		igt_subtest_f("eu-fault-4k-%s", s->name)
> > +			xe_for_each_engine(fd, hwe) {
> > +				test_compute(fd, hwe, SZ_4K, s->flags);
> > +				break;
> > +			}
> > +		igt_subtest_f("eu-fault-64k-%s", s->name)
> > +			xe_for_each_engine(fd, hwe) {
> > +				test_compute(fd, hwe, SZ_64K, s->flags);
> > +				break;
> > +			}
> > +		igt_subtest_f("eu-fault-2m-%s", s->name)
> > +			xe_for_each_engine(fd, hwe) {
> > +				test_compute(fd, hwe, SZ_2M, s->flags);
> > +				break;
> > +			}
> > +	}
> >  
> >  	igt_fixture {
> >  		xe_device_put(fd);
> > -- 
> > 2.43.0
> > 
