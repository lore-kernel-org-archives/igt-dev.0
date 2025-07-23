Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FF2C83F34
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 09:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3BC10E149;
	Wed, 23 Jul 2025 09:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5t1Eh40";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C3110E149
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 09:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753263707; x=1784799707;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=udJY7CZY9Ic9wcMB1IH9m+8YlPtK0wSK1W9eAxT4ah0=;
 b=k5t1Eh40V3VeVP1wpNJ0hw1h1HP3/wi95bRjRuRfscBkpZtac6Iy2azJ
 Aqwe5A3EprnYOMDem8jvuVoe5J5Qt1TXcsg75xvPbxCT6LDkV+xhmYLGG
 Bq5bPkRO2tGDozt9obqMWggwj90tlrfRSpLdXD4fokzipiMk55zStX6Me
 oVIy5znXlWf8SB7y5zVqyP8/cbHhTn3wPZY9KuC/zphiT8kNkXxb1ZhK6
 EYJTjRyL8Zv+iwjILOWN8aErYtPek/VGctsNAIJJ+0Rx2dcEDc5AKvRWW
 /BWSr0Sck6KmYZ3pVEKVkMcEPv70fsDTIE52vbIb2dn+FOkTq4ZtKat41 g==;
X-CSE-ConnectionGUID: JfcMqHbyRWe7OICSH3qO/Q==
X-CSE-MsgGUID: W6Lw+D87T9ehJ5ZRDsb++w==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55639765"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55639765"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 02:41:43 -0700
X-CSE-ConnectionGUID: hbN0qz6ZRhu/GEppZ5zL3Q==
X-CSE-MsgGUID: vnxpJyPtR4Ovn7a3Hiz03Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="163635665"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 02:41:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 02:41:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 02:41:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 02:41:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxGgvuQ1nFiYec0RnlSUOCdYy9wWUGXYf9pJfqR+dLfqjKfg4Pfet4UYG2wfLtphQ03vrm/9NsDdamHsdqU25UOUZhgPWvepWu11OH87fqHv5tk2V0KAFdaQeELeyedVB73fd4/G5yLUPKo20JC6l4w0tY0LHbMwM/gcfMnoKtNHlYZKXPBRK6Evny9uEPaS6UPaO7iAFfvhVVTqrrB9DyNlpgsjy05H2DD05x/n6OXkfImMbtmtg5PNlZhlLpwcNVaDP/39Jw0nkU3kQL3zLpjegV3J4bXFjZ7G3ZPB1dLwNNb3jyZXqyDOsAZigWHbuKqx67BvfqNbS7NAp1aBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5P8JAruKTPMWbZvpuruK6nxPUIkRBpFUrmmU+e3y4gs=;
 b=DT5zFTaugJIf8JhoyS8MjRDFTC9Umi0N6iHOcw2uK+AVn3aWT6A4Gsm7JqaGUXzSxC/ABZKxB3RovSCnqGwVCH/uxB/lqb4FRo/HAjAzllMj60beZyFHsjGSALK0670bsdlZRkBRu7sejhrQk0HGpOKEy7ZEAzj3wddHiXc3/eUSqK9VQk1k0gaSFWMC6F985Jlxb4AUSDkSBxE6ibmGOo05KsgceVHgtk2aHNMu27cKvwMcKcIQEzzE9yJdJ12fi/hK1s0u40/T0/UZdVd+1kN07S0htlJ12u/hjmd9YktE475vEjCaicJUczoc7o06/wT9sDTZVFLUj2od5FEKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB7119.namprd11.prod.outlook.com (2603:10b6:510:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Wed, 23 Jul
 2025 09:41:21 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 09:41:21 +0000
Message-ID: <96d4de82-0410-464e-812d-407473d9fc87@intel.com>
Date: Wed, 23 Jul 2025 15:11:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pm: Introduce i2c subtests
To: Raag Jadav <raag.jadav@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>
References: <20250719163101.3459754-1-raag.jadav@intel.com>
 <aH4YMMLcvuiRS2l9@kuha.fi.intel.com> <aH8OHZquwBBvODfQ@black.fi.intel.com>
 <MN0PR11MB62070599B42A46DCAE1CC69B955CA@MN0PR11MB6207.namprd11.prod.outlook.com>
 <aH-AIouJAiWTVxV0@black.fi.intel.com>
 <CY5PR11MB6211F4211D129944C29DEF39955CA@CY5PR11MB6211.namprd11.prod.outlook.com>
 <aH-0_lSffRlCzvX5@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aH-0_lSffRlCzvX5@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 56930706-22e4-4dae-3395-08ddc9cd148c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnlPa09sbk9WdjRBOTMycXZSMkw4QzA4b1dGdC9sMlpRWEV5dHlUZzR2OElp?=
 =?utf-8?B?MVh0SXp0RlRGSDlrMnlRQWtNVDdWZU1LNzB6VGM4TTB2bVNRcmpQOW1BYlJK?=
 =?utf-8?B?WFI4dVlsNjVOZXhyQ3NjVzFVaE5MNFpEdW1SRU41Z2pkQ05jU1NKLyt4N1ZU?=
 =?utf-8?B?SUNRVlVOandjcFJvYjlYN2tRbkc5dFpGQVFXa1pua3d5eHVYZldKYzhhclJq?=
 =?utf-8?B?YTc4ODdoVDBZamRnMWQ1NEt5K0ZZOVpNTkkxKzNtcFlDV1VVTGNCR3Z3VFIw?=
 =?utf-8?B?SDNhWFdjYVB5K0pETnlkaFgzVTJwYUtMd1Z2VVhuZHhBcGdLUzlWZ3RHeEJN?=
 =?utf-8?B?TFlOeGV6RnhSQnlQZ2puS1JZVGxocVgxbm96VUtLQjVZa3dHWFJvOXV2RkpQ?=
 =?utf-8?B?UXpxcTdnSWlUOW5yQXEvOTZ3Qk5aNzYrNlJPMlQ5ZE54amJ2UDVlS1NManpK?=
 =?utf-8?B?RURPZm5JYzhUY3JnTnVZekFSaTlGNGtWcGI2aC9sSTVGQzNBTzRqcU9nTGQ5?=
 =?utf-8?B?Wms5eGVxUUF6QkplZ1F3R3FJdnVCeHJTeE5HOU5tRmRZK2x2V1Z1b2JWOWx2?=
 =?utf-8?B?U3Faa3hldkVKN2FkK1MvdkdYbnNDR3RBdS9xMnI0ajEydlZmVXlKSVBRRXJu?=
 =?utf-8?B?aEpaRndwNE5PdjRVODJJWU1HUmZHS0NvRzlXaGc3aDJpMnZZVC8vaURqdlJE?=
 =?utf-8?B?cHpMNEx2Y255UXU4SVdRenlZWWVlL3R4K0JoeCt2eFFuL1l5cTIvQnVXNzVI?=
 =?utf-8?B?dVZmbVBaTTR5NHlkbGhJcWY1TURJWVk4Y1hUY3ZZNGNYbjBZSE5JZlZlY1Ez?=
 =?utf-8?B?eEl4ZHNBb3kxOHdOc1FxL3drMmhod2RwVFlnZGkxcVRRalZNcnVtY0p1RjEx?=
 =?utf-8?B?VjREZzc1eFd3eDc3Nlk1V2RhQ1VuSTlhRWZwb3hUcE1kK0VZWTVuVWVWQ2c1?=
 =?utf-8?B?anRXMzFPWGd4bEg2cVBVZ2dZUnZCaHFhUjRoTGg2aFFWZm91aEdwTWsxZS9O?=
 =?utf-8?B?ZGo5bDRPYlBZdG5XM3lPUFplL1JkOXYvbG1LYXZub1RTY28wOTZWRTlqWE5D?=
 =?utf-8?B?RVZLaVRCQkVVZmM0VkxHa0Q0YUdiUnU4UW9lWGxZMHhvZ284MFpOb2hkbmFn?=
 =?utf-8?B?NGhLQy84Z3BoRnRuNlBkblZLSXVZcmlTVStlWTQwdTZPdnBSOXc0aVF1VVlM?=
 =?utf-8?B?M3JJeTBNU3AycEgwbHE3YXpCbFoxellyV2U4bEZZTFBvZ3dINmpHMEpnU1Ax?=
 =?utf-8?B?ODNCUXBRWjR1dG5UblhGcXk4ZHc4SWxaK3Nxb3VKS25EcnB2WXhRQmFOQjR4?=
 =?utf-8?B?L0RYdWZlaVR2MkJvanl5M1RId2RHMktBR2MwVGVMOHUvUE14S3ZEZkc4ejR6?=
 =?utf-8?B?V1R1cFJRR3FVUTl3NldNdUdEKzNML2g1QWtheForV0VnTjdtYnpSOFB1bzV5?=
 =?utf-8?B?S2pkdWszU0tORm4xSnNEWm5DS2NxRHJoN0JpTGlWQlA1L2hMaVNHa1ZWSVZR?=
 =?utf-8?B?NXQ2aTV6S1cvZVdQVktkODRDL1lhVFEvVC94SGc0MDV3VjF5OTJiS2wyYy93?=
 =?utf-8?B?WHVUTzBxTTZpbGoveXd0RmFUUVpnbU9XUXBmMlVNcXIyWGp6T3kyTHRRVVJO?=
 =?utf-8?B?Y0JVemtWeUNmY0sxbXo4MGtIUW1kMHhlOGk4S3lzallrWm1Zc1Iyd1hsYjRZ?=
 =?utf-8?B?dkNaOEM2cHVEcjFHZysyQStnNFBGOTN6ZXhGTG1DZlczU2I2SzBHNEpKNkhi?=
 =?utf-8?B?WWVDRDViKy9mVWh2Szd1OEJZbjBDdHA1MGNSNFQ5UFI5N2tibTdLNzdPVFVT?=
 =?utf-8?B?VHB4TnpYbmxVVWJwc3JBYUVJeXM1YjJhemwyMndEVkRKNGhISk83TjFCUTRF?=
 =?utf-8?B?TVVCdnhlYWg4U0k3bmM2RnZES3ZLTitzaHRRNUpxNHVDQ3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW03aDYrbWpRUS9qR1BucFBPQjRWT3JGWC9xdE5NTEVOQ0xOT2l6bVQrTUdO?=
 =?utf-8?B?bzdBQjMxWnd6ZzEreEVqU1UySEMrY1BXbi9YbnJlQVF1YWxTQk9sNmZDUk5W?=
 =?utf-8?B?UmJOdE4zenVqS0JLS1lVNnhTd0VEODgzZ2x3dXlESkhtZnZnbnc3N2JOOXFE?=
 =?utf-8?B?djZxZFVSbXJneGg1NCs0OGIzMFVTcVEwUlZvYUdseUppcDlscDNta3ZQR1M3?=
 =?utf-8?B?eG9BUENzMm5sV1RtcnhuVWcvMHNYSGp4eDFIaCtXWFlUa29wRURLY3NJcmhF?=
 =?utf-8?B?WTVTNFBSMHpGVFNCRHV4eGRIWEZXY2ZuMmpOYlEweVpvdTQzVGN0emdKUTVQ?=
 =?utf-8?B?VVBBbUQwbzBQKzdrN3RlVFJza2JiYzBodmZBQThWYW5nWHBVdU1sckpHc2xS?=
 =?utf-8?B?a1BRUGVsWTRVdU1oSnBvTXZaRjdjMC9QdHk4cGg3ZHBDWjFraHIzcm9JUHdj?=
 =?utf-8?B?T3J5RTZhaDVMS21JWVIvUlFSZThSZjNiSnFBS2pWYWFWK3hUTVRDaXhCelFz?=
 =?utf-8?B?MHJZVXdoTi8rSjV0LysvaUZQZkxEL0k0OGVUSFhrUUpHdHFrMzlPT1EvUy9C?=
 =?utf-8?B?UVZNeERWK1VYS2o1NXhuUy9UQlFhT3FVOGRNQnBua0JQMU92elcyYVZRZ1ZR?=
 =?utf-8?B?ZHBDRm1JT0VvV0pLUlBIdEFIMDhMQTRMWFhzQm05YysvVENaUGFEUWxJYnJq?=
 =?utf-8?B?MWI5cXNnU0w4bmJXMG5DZnZLaFNWcm5ZRXpHWUJ3SUtoWWVqeEF2STRxS2F3?=
 =?utf-8?B?aHRJVS9MQnlybWp4aU1Bb0lVbWdPcTVHaFdkbEJiMzVha3hSR0g0S0Z1N1ND?=
 =?utf-8?B?TFV3SzM5bDIrN2JLUGR4dlFqZVY4Z3lLT3Y5YWxOS2tkNllEbXd2Q05iMldM?=
 =?utf-8?B?cmVPdUpZTHV6M1lnampwZUlwMDA2UkRLV2k1ekJNR0JQV2RyWGRqOTZMaE1Z?=
 =?utf-8?B?aWhxb3VkMFU1TkxJQXRCdTJLM2laTDlCVldQTjBjaUpQd2NGLzFPVXhON1NF?=
 =?utf-8?B?VVlOWk5xWG1jaWNGTVFZMjNoT2JTdlJ0RDMwNFU5VEJXcytITm5zSzQrenkw?=
 =?utf-8?B?TVN1TFo2VjFZbkhIR1VGOHRhOWYzYndFUzg5YmlvN2xuRElidEZRNXNCcStR?=
 =?utf-8?B?bEN3d3FEclhWTVZPeEJhTXhQTDhxSlFKZzFkRGhMNW9ucFpIYWdsYjBXbkRP?=
 =?utf-8?B?dmk4b3ROZlovbUF5WHpDNUZsckVFUnRjVDBXWVdSSWVWemxWbGtzMXZtU21u?=
 =?utf-8?B?VjF2OUpWWUtmdEwvU1pFMzVGZmZBbkJVZG5WSm1kaTNuajgvSEJ4cFFSc2tD?=
 =?utf-8?B?bjBhZmtMa1hVbGppTzVjbXVWLzFOM2huQklITmFCby9mcXV1MlZJM2txVFNr?=
 =?utf-8?B?bWxnRFlvd0VNM1NOQTlzYUFGNFE5ZTJ0d2I0elVOZnY0elBGUTV6MHdCTk5m?=
 =?utf-8?B?OGVidXV5NHhQL3Y1ekFuVW95Vno2THpmMXBZcTg5ZzcxcTJCcHRYTHA0MDJG?=
 =?utf-8?B?Q09qMGdDdW9WUDIway80WlNVWVBZblFCV2dMbFh5Vzc2SndEUE11NHpIM2c2?=
 =?utf-8?B?Zlh6N1NzRmFPOTdNMko2c2xPSzJGTVY1MU5jWUFNelRiLzdaWnc2QkVVZmQ0?=
 =?utf-8?B?K3ByTU1paUcxWWR1RjlQTmNnbytOTDhTVHdQZUdnVEhJVVB4RHkrUFcrZ1lL?=
 =?utf-8?B?QzYvUyszZFdaYnMzZk1EendNTmJoT1o1UlVLdTRlY2EwMURBYjBxaHdwVXIw?=
 =?utf-8?B?dFJnNWF1bWV4YmRkc1IvYnFnMXM1UUxVUm1LbVpoSFBBVWpndHArRlJJT2Fh?=
 =?utf-8?B?d2FPU1ZzUjJBRnlxTlNIeGszcnZZYVJUd3RjSENrYThkRUJKK25Lajk1a3lJ?=
 =?utf-8?B?MjA0aVlZT1BNbDBTbURxdUJNSzNTeWdzKzVhVjNJdkl0b3BlNWNaQllNOUFm?=
 =?utf-8?B?RysxQ3FyZ3ZmVWdpcnFUMkluYUptbFNlVVlxMFVaOUVkUDNSajFrdWZZSjFw?=
 =?utf-8?B?eHdSeEhPMkxlL3B3a0k2UjV5RmMxazEvRkpha1YzWGtSSy9GWGwycEVYMGpl?=
 =?utf-8?B?ejR1bFNPNjIyVWIycFJDWVlnb1RaUTFLWERLenMwZUxkWkZtLzFVWk9lL28w?=
 =?utf-8?Q?atQkGCulXq6L7GQJHW7KUdKs9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56930706-22e4-4dae-3395-08ddc9cd148c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 09:41:21.0467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFdfDUKueOFkttygCzOzbmH2M58pE9uW+jsD8NQFmsQruoVX17rKS3I1JOGid4HaL5jsIWlcjbzjug7BnHPZVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7119
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

Hi Raag

On 7/22/2025 9:27 PM, Raag Jadav wrote:
> On Tue, Jul 22, 2025 at 06:33:43PM +0530, Gupta, Anshuman wrote:
>>> From: Jadav, Raag <raag.jadav@intel.com>
>>> On Tue, Jul 22, 2025 at 05:27:35PM +0530, Gupta, Anshuman wrote:
>>>>> From: Jadav, Raag <raag.jadav@intel.com> On Mon, Jul 21, 2025 at
>>>>> 01:36:32PM +0300, Heikki Krogerus wrote:
>>>>>> On Sat, Jul 19, 2025 at 10:01:01PM +0530, Raag Jadav wrote:
>>>>>>> Introduce subtests for i2c adapter which is used to control
>>>>>>> on-board OEM sensors on selected devices. This will test
>>>>>>> D3hot/D3cold transition after i2c adapter access for the devices that
>>> support it.
>>>>>>>
>>>>>>> v2: Define macros for AMC constants (Lucas)
>>>>>>>      s/index/adapter (Lucas)
>>>>>>>
>>>>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>>>>
>>>>>> Looks good to me. FWIW:
>>>>>>
>>>>>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>>>
>>>>> Thanks Heikki.
>>>>>
>>>>> The BAT failures seems unrelated to the patch. So anything I can do
>>>>> to move this forward?
>>>>>
>>>>> Raag
>>>>>
>>>>>>> ---
>>>>>>>   tests/intel/xe_pm.c | 98
>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>   1 file changed, 98 insertions(+)
>>>>>>>
>>>>>>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
>>>>>>> 16b5fc686..ca935d518 100644
>>>>>>> --- a/tests/intel/xe_pm.c
>>>>>>> +++ b/tests/intel/xe_pm.c
>>>>>>> @@ -11,12 +11,18 @@
>>>>>>>    * Test category: functionality test
>>>>>>>    */
>>>>>>>
>>>>>>> +#include <dirent.h>
>>>>>>>   #include <limits.h>
>>>>>>>   #include <fcntl.h>
>>>>>>>   #include <string.h>
>>>>>>> +#include <sys/ioctl.h>
>>>>>>> +
>>>>>>> +#include <linux/i2c-dev.h>
>>>>>>> +#include <linux/i2c.h>
>>>>>>>
>>>>>>>   #include "igt.h"
>>>>>>>   #include "lib/igt_device.h"
>>>>>>> +#include "lib/igt_kmod.h"
>>>>>>>   #include "lib/igt_pm.h"
>>>>>>>   #include "lib/igt_sysfs.h"
>>>>>>>   #include "lib/igt_syncobj.h"
>>>>>>> @@ -38,6 +44,10 @@
>>>>>>>   #define PREFETCH (0x1 << 1)
>>>>>>>   #define UNBIND_ALL (0x1 << 2)
>>>>>>>
>>>>>>> +/* AMC slave details */
>>>>>>> +#define I2C_AMC_ADDR	0x40
>>>>>>> +#define I2C_AMC_REG	0x00
>>>>>>> +
>>>>>>>   enum mem_op {
>>>>>>>   	READ,
>>>>>>>   	WRITE,
>>>>>>> @@ -779,6 +789,87 @@ static void
>>>>>>> test_mocs_suspend_resume(device_t
>>>>> device, enum igt_suspend_state s_s
>>>>>>>   	}
>>>>>>>   }
>>>>>>>
>>>>>>> +static int find_i2c_adapter(device_t device, int sysfs_fd) {
>>>>>>> +	int adapter_fd, i2c_adapter = -1;
>>>>>>> +	struct dirent *dirent;
>>>>>>> +	char adapter[32];
>>>>>>> +	DIR *dir;
>>>>>>> +
>>>>>>> +	/* Make sure the /dev/i2c-* files exist */
>>>>>>> +	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
>>>>>>> +
>>>>>>> +	snprintf(adapter, sizeof(adapter), "%s.%hu",
>>> "device/i2c_designware",
>>>>>>> +		 (device.pci_xe->bus << 8) | (device.pci_xe->dev));
>>>>>>> +	adapter_fd = openat(sysfs_fd, adapter, O_RDONLY);
>>>>>>> +	igt_require_fd(adapter_fd);
>>>>>>> +
>>>>>>> +	dir = fdopendir(adapter_fd);
>>>>>>> +	igt_assert(dir);
>>>>>>> +
>>>>>>> +	/* Find the i2c adapter */
>>>>>>> +	while ((dirent = readdir(dir))) {
>>>>>>> +		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
>>>>>>> +			sscanf(dirent->d_name, "i2c-%d",
>>> &i2c_adapter);
>>>>>>> +			break;
>>>>>>> +		}
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	closedir(dir);
>>>>>>> +	close(adapter_fd);
>>>>>>> +	return i2c_adapter;
>>>>>>> +}
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * SUBTEST: %s-i2c
>>>>>>> + * Description:
>>>>>>> + * 	Validate whether the device is able to suspend after i2c
>>> adapter

runtime suspend

>>>>> access.
>>>>>>> + * Functionality: pm-d3
>>>>>>> + * GPU requirements: D3 feature should be supported
>>>>>>> + *
>>>>>>> + * arg[1]:
>>>>>>> + *
>>>>>>> + * @d3hot:	d3hot
>>>>>>> + * @d3cold:	d3cold
>>>>>>> + */
>>>>>>> +static bool i2c_test(device_t device, int sysfs_fd) {

bool return type is unnecessary. Not returning false anywhere

Thanks
Riana

>>>>>>> +	uint8_t addr = I2C_AMC_ADDR, reg = I2C_AMC_REG, buf;
>>>>>>> +	int i2c_adapter, i2c_fd;
>>>>>>> +	char i2c_dev[16];
>>>>>>> +	struct i2c_msg msgs[] = {
>>>>>>> +		{
>>>>>>> +			.addr = addr,
>>>>>>> +			.flags = 0,
>>>>>>> +			.len = sizeof(reg),
>>>>>>> +			.buf = &reg,
>>>>>>> +		}, {
>>>>>>> +			.addr = addr,
>>>>>>> +			.flags = I2C_M_RD,
>>>>>>> +			.len = sizeof(buf),
>>>>>>> +			.buf = &buf,
>>>>>>> +		}
>>>>>>> +	};
>>>>>>> +	struct i2c_rdwr_ioctl_data msgset = {
>>>>>>> +		.msgs = msgs,
>>>>>>> +		.nmsgs = ARRAY_SIZE(msgs),
>>>>>>> +	};
>>>>>>> +
>>>>>>> +	i2c_adapter = find_i2c_adapter(device, sysfs_fd);
>>>>>>> +	igt_assert_lte(0, i2c_adapter);
>>>>>>> +
>>>>>>> +	snprintf(i2c_dev, sizeof(i2c_dev), "/dev/i2c-%hd", i2c_adapter);
>>>>>>> +	i2c_fd = open(i2c_dev, O_RDWR);>>>>>>> +	igt_assert_fd(i2c_fd);
>>>> Can you wait for runtime suspend before triggering the transaction to test
>>> gfx transition from d3 to d0?
>>>
>>> Isn't that something setup_d3() already does?
>> What if i2c_open cause a device ref count in driver?
> 
> If so, how does it decrement before ioctl call to allow suspend?
> 
> Raag
> 
>>>>>>> +
>>>>>>> +	/* Perform an i2c transaction to trigger adapter wake */
>>>>>>> +	igt_info("Accessing slave 0x%hhx on %s\n", addr, i2c_dev);
>>>>>>> +	igt_assert_lte(0, igt_ioctl(i2c_fd, I2C_RDWR, &msgset));
>>>>>>> +
>>>>>>> +	close(i2c_fd);
>>>>>>> +	return true;
>>>>>>> +}
>>>>>>> +
>>>>>>>   igt_main
>>>>>>>   {
>>>>>>>   	device_t device;
>>>>>>> @@ -889,6 +980,13 @@ igt_main
>>>>>>>   			cleanup_d3(device);
>>>>>>>   		}
>>>>>>>
>>>>>>> +		igt_subtest_f("%s-i2c", d->name) {
>>>>>>> +			igt_assert(setup_d3(device, d->state));
>>>>>>> +			igt_assert(i2c_test(device, sysfs_fd));
>>>>>>> +			igt_assert(in_d3(device, d->state));
>>>>>>> +			cleanup_d3(device);
>>>>>>> +		}
>>>>>>> +
>>>>>>>   		igt_subtest_f("%s-multiple-execs", d->name) {
>>>>>>>   			igt_assert(setup_d3(device, d->state));
>>>>>>>   			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
>>>>>>> --
>>>>>>> 2.34.1
>>>>>>
>>>>>> --
>>>>>> heikki

