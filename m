Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7BBC3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 21:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833EC10E1A3;
	Wed, 31 Jul 2024 21:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABPUG/eh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C65010E1A3
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 21:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722460966; x=1753996966;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=Yeni5iDttf+tUxi1LFywv2mU2IHWsUnTAHUnfK+lT5o=;
 b=ABPUG/ehRa0SD0BH3St82UZcWBwQ3afeYRS3wKrXZk1dOuo9cX0b5wn/
 godulpBb38nyTfgvv8d/1G92iyUBrhYvSrZKau3U5+UoGYsoggX4s0bz+
 uD49LoXwLjhKmW55syxVqQpUv76MvBYaUlPYhfWJ1jmNqdaDRuj5UhL0+
 1+YkPs7/MuLIBmuAt7rjCZ9gwfICn3kbhTJUbsYUtPyz4TBGkw66dGzo7
 fz1kgAM6q7rGiOJf/QnW6Lxvc73NqxTiPZlTOuuxLMmZE6KAHHEK3OrtA
 LLcBtKPZhyeMG8WQNulydTK8jEU/czhEi3Cp/fdhsi7esNSPe05RmoK9O A==;
X-CSE-ConnectionGUID: 9GxNqTCITEeQiZxJb2Ym5w==
X-CSE-MsgGUID: zxUmfSiiQ7WFV24cpdQH3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31776399"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208,217";a="31776399"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 14:22:42 -0700
X-CSE-ConnectionGUID: kaiB8PHpSmGNcB3jiS6ItQ==
X-CSE-MsgGUID: 9m7172uBQfWWH4xGfzsegQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208,217";a="54470366"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 14:22:36 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 14:22:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 14:22:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 14:22:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpkTAc5Lge5SLchFM55SisRUwemQmBir5BuO+pMF0dp6RB3dRidYin+T+xFKkYtICXJgDUdeQXwohRllMDW2oaoMF0ffnaimvF5fVy7lrBJvVREmTnRa7GNSj+s7P6247mBYqdcf6zPRt5XL3KlStQcruqMdcWquxwzyDYdlTPFHm95S3WMYFDrLcqUCt2IbQCyPF3loxbVbcrAtnvOmlnoPM8MN6vJeZRNtqUcKmQ39weqFiY2h9mjj7aatvCwlc6SVjFOZ1+zFgi4CTKo8vphudPD7fS7KnSu+/CLUdU/35LsT8WyzrlXcb9o6i3At3aih74NNVM3kt9rO+aghyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0UV9WZHY+lUn3yf4JBgCeHmsjvBVcCEGUwgaNfXPnw=;
 b=IyPi/RCqs7nnuGRbYnnRsL7EUVDER9klDjicfHI6dmB5QDOMUJnDSD5NowsSlEq2uvlxE3TxbcFljNoLstrezDpSSaC9UyUbNi6v1FDl5UrXH9aFTjiJY+rpolMJuaFqX/hWfSNOe0eM3QSdlKoNGT9ssvwvLY/iINyETl52LmOoWL+5y2khQJD7YYYdYcIoHTVSUaeNKNokoJpt6ND5vPzEc8jsiBVZ1mxjzGASMvwfjK4DRaNmtP0RxA9UOiKMjpdF2K1Mo5gtrGssBtx719EUjVVwm+tBNhVf79i0oOONOYq7TYal92Ls8q+W0Sn9uhBzgA//Rwk6uLz8pTky4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH0PR11MB4789.namprd11.prod.outlook.com (2603:10b6:510:38::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 21:22:32 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 21:22:32 +0000
Content-Type: multipart/alternative;
 boundary="------------0us0BY0IBEvI0yi5LA2CN1cV"
Message-ID: <e14eb4de-6789-4e3d-9cb1-99c8de67608e@intel.com>
Date: Wed, 31 Jul 2024 14:22:29 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL3hlX2d0?=
 =?UTF-8?Q?=5Ffreq=3A_Avoid_RPe_usage_in_subtests_=28rev4=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20240730230123.2695162-1-vinay.belgaumkar@intel.com>
 <172238241863.466042.5783612084926495240@2413ebb6fbb6>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <172238241863.466042.5783612084926495240@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:a03:60::37) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH0PR11MB4789:EE_
X-MS-Office365-Filtering-Correlation-Id: bc778468-1fa4-4c4c-80d0-08dcb1a6e38d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bitKYm82OTJGeW9WclJ5T0NRZHdrNDQyeTFEeUZyaSswSG0vUlgwWmFyQmF6?=
 =?utf-8?B?R092TTZkMFQ5bW1ZMWloSlJzNmxHUDFFZ3VhWVNhMkpQKzJhTnFKUEdkMlFv?=
 =?utf-8?B?dEZERmZQTlBxTGRIMlJEeE56NGVpaVp5TUphMVAvSFYxQjRrU0lERGg1U0xU?=
 =?utf-8?B?dHBpUlFBajhjS3hTVkNjTUQzdk9tOUVYcEtualA1UTZLY0ZodVFvaWpudzJ4?=
 =?utf-8?B?ZTNCUFFHTjFKc1QwZUozdVFPSzNWOW9WeU1YN1dYbjF0Y0NFOG90WmZ6cmNT?=
 =?utf-8?B?MXZtcHBESURDL2hEbHZ0ZSswcVJ6eFVqT3VuRjhhdU9oSHEydTEwT2tCbW9Z?=
 =?utf-8?B?TGREWlRPRWxSbThmV2xkYk5OZU5mUm5yS29ZbVZtS1RSemZ1OVF4UjFQWHJs?=
 =?utf-8?B?dXhpU1FaQ3VVYmEzWENQcWlDQ1dvcHVJNnBqOThETWI2SXlucGVLRFJsa3g4?=
 =?utf-8?B?SWtDbmJSVkNOUEh2R2JBN25HSTdYVmFhZDN0TWlQUFJXU2s3RWNUVi9maTBa?=
 =?utf-8?B?YWh0dERIYUZIbWZDYkt2dHFXbnh6QTBmYW5tbWhDQWkrSE9wSDVvRjNIZmR6?=
 =?utf-8?B?OXpxQ09xOVo5T2xYc3FhRmtuaFNNZDVYNjNCejZUYlFVRFJnQmFMbmFyUGRw?=
 =?utf-8?B?U1RVd3VPNnhaT0FDaFc5VEZueGt2VExHZ1pxcWlQODlGM1lTdHFTejlBbnl0?=
 =?utf-8?B?Y2Rhd2ljQ25HTUNDMDNlUVJ1emYwZ2lhUEdKcjlDTWhpSVdSeG1RRHpxZlIy?=
 =?utf-8?B?cXFiMjJjUEtoY0NYVDBIMEVwcU56dElxaGZKQ2hOQkdzUncxdkNOSkRoVVNn?=
 =?utf-8?B?cTBsay9mVEY4QnQ4cmlLUTIwNkZCVTFBQTlRR1ZtNzlOQy9CQW03R25GVTJ3?=
 =?utf-8?B?Y1FLZDU2S1plMXl5UTM4dVdmZXAwZ3BHcUJJWHNQS2lSSzZZTmtObmZWZUda?=
 =?utf-8?B?T0M4V2NwMmNYNjdmMDFCYWF0SnVSRStXandqbXlOc1RpZDA3VzZlQzJwbk9Z?=
 =?utf-8?B?b3dUa1ZlL0F6NzBBODNyRUdFS082aFVnUnBOb2VrTC94SWVJOUhrYXZYTjJN?=
 =?utf-8?B?WWp0SVJIRGRGcEsvdzdvbU1QV2YyWGVrS0NlS2NkZm9UU2VtQWJOK2w2OTdp?=
 =?utf-8?B?bE5LMjRudUl6RHRQQU8vdU1XN0hWYWVteS9ERFp1ejc2Nm54U1lqSWpHUVJM?=
 =?utf-8?B?WlZ5UGFQVUVvb2NpbVFYTHNIaE9GRFpYdEtuZmJpbWFWVHZOeUtOZU9kYXl5?=
 =?utf-8?B?Qm85YmEyODFkcHhyTkRWVlE5U1dqQ2xlcHB4RzVwdElsVzAzL2lkbmJ3eGE3?=
 =?utf-8?B?M2VFOVg1bi8yNlVKaU1nU05iSmFRcVd6a1UyQlArQ2lRWTFkdlFPTkVaUjAv?=
 =?utf-8?B?UCtEcVl2dm9uUTNpQTVYMHkrUEJQMWJmNGU4RTZUTnB5aFo1ZVNBZGlXOXZF?=
 =?utf-8?B?NkFVd2p2OEsxN0RkUDloWFA4ZHRTMkdSV1RwelhmdysxS01ZZlJJbEZhSzc2?=
 =?utf-8?B?ZGdwclJCQ0lsMHlhUjlRNUM0OXRCenk2UWQ4Q29NaXh3ZTc5TmdvUVJuSFN2?=
 =?utf-8?B?NTh6SEFFWCsxeGFRSmhVRUgyS1hnTHNiVjhaSDM2VHVUNytFYU9WS1dJb1pZ?=
 =?utf-8?B?S3JXZzg2dGhrcjVVbEdsWnMrc3BOMThUOHRsbFNRUEdVYlo3NDI2MVFydUUx?=
 =?utf-8?B?RVd3YlcxYnEvN1JxN3Z2emhQZ0M2NFFsOUhuQno1ZWdJS1hqTWxlMGJBaE0z?=
 =?utf-8?Q?rR1tdAABjXl4XOH1SE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVBTc3JGblMzZ0pnVWlvbEZwcWJudTd1L3Znakc4VG0yYXVrNlEyVDdwVWFL?=
 =?utf-8?B?bThCZkhkRFRhNDVVa3d1cjkyRnpxb3d1bksreWVvRHhWRWd2UjBnMVk2QW1M?=
 =?utf-8?B?akttd05qVElrbisvS1pvbmtBSnh6OG9CcGRVMlB0OGpDdUtnemtqN0k4bldy?=
 =?utf-8?B?eEhaeWxJL29JUEZVMWN2UVJpUHR2WlVuRmpKWldPbUxXRnhsNm5LWlVReUZ0?=
 =?utf-8?B?ZGlwWVFoMmhoenNHb3pjR282dEpTY3pJalJKVUxzYjl4N2NOZmxON2tJRDRK?=
 =?utf-8?B?eFgwVjlCZW4zaHVuQnZKRTl4c1RKVi9xVTlhT3Rad3JLY2ltUm5jYnZSM3Vo?=
 =?utf-8?B?YS9IcGkreTlmalJSOS9wSkNVYjdoMUxHRUJzMVpPRTZ4emo4MnhPUDM3Mmo3?=
 =?utf-8?B?N2plV2ljcVhzSWdJKzJHbWVmTU1mWFpIa21ob2k3dTNhS3FWTTc4d0pnNHpT?=
 =?utf-8?B?bkYzbVRVWVl3RlhneDdKaGRXd0JDbFFwVDZ0c0RrZWJkK20zNEdzbW5pc1c4?=
 =?utf-8?B?ZURvVnpuMXBhNzQxTjhBMDI1eU9idUlld0sxa2VCSEZVVFY5M1dKZk5sVzY4?=
 =?utf-8?B?aGU3VHROYi9UUE03akpZdlpRSERrRjJ5Y2s2SjBBaFBVTk1rNllZTWtFYUpj?=
 =?utf-8?B?dHdLeUNMdWNrczRPZ0puc3RLUWM2TlAzVVN4UjhxS2tDYlJkNnBRV0wzdC9T?=
 =?utf-8?B?L2twUEp3V1RMQWFKWkI5OFdDa3VzRVNTZjNuZ3pRWWN1T3dUenNDWGJWY2lW?=
 =?utf-8?B?TVZlOHFBbEtxZ3dFRWhKaEdpNy9sRldXUDY4YTIvemNFUktyVVArbVVSeS9F?=
 =?utf-8?B?R2tPRFlmVytLTzhrdzByc01Oc2xQUEhCOFVTMVNsT09qNXF6Y2tISFc4WGxk?=
 =?utf-8?B?ejVZZUY5bzRaRlZuS2h2bWFQSkxaUVZnNm5zNksxT3hoUHVKSDJTRXdQQkRo?=
 =?utf-8?B?Q3V1WmpEUXg2TUJCT1BtTEVHK1BxWmNiOTg0ckxUODF5NEtOTkRITVFPNzEr?=
 =?utf-8?B?WldnMmYxK0NwNFpKMXF3d1VFcDVZaldKMTRJWHRrVDBaRzBwblRTbmhjY2Ro?=
 =?utf-8?B?a2ErclRKNlFUY1l5M0F5bUl3T0RUcEZHdEdqYlhMeDFXMkkwUk5MWWVyZmJy?=
 =?utf-8?B?UTZQcFVTOGZqZG03aExQb2p1SG94cWNkYzN3dE1OTmRhWCtJSDA4VTh3N2t0?=
 =?utf-8?B?Q0orN2tEcUZOZlhuTTFONVgzVnBOSlo0QzcwZHI5ODZzOVltME5WUUUxZ2RC?=
 =?utf-8?B?M0hmV3YyNDQzY0hYUXR2VU9YTGwrcDkwUXdIZDhyQ2FkcUhHdmdnbmlSU1N1?=
 =?utf-8?B?UnBIYlV3U0ZldVRQano2SXFscHkyTElLNlhPL3pFZXpCVnhwdVFFT1RyRlps?=
 =?utf-8?B?N0xvQ2szbUk3L1Z1Wm5uQ2Fkbk4zZWhyLzlxaHd1MGtnQm1VZmF4NVFLRVNu?=
 =?utf-8?B?TzZsMXNWeE1CemdrWk5weS9iOURQWkprYVlXRG1RR3ZJUzFtNFBFeWxPYzVi?=
 =?utf-8?B?bktiWmdtR1pjV0VERnFYbjVqdGJpaU84T2EzaXpENlZlaHVsNkZXSFRjWE5j?=
 =?utf-8?B?SjNYbGhJOTBDTGtWenBKUVNkNXpzRTVvQ2FVQTA3STY5VEpmajRQKzRNOS94?=
 =?utf-8?B?ZEhrUkNRQmZSK2trRVFuRXpYazdtWnlNQ3RPOUZJZ2RXV0hRZWRYWVJGTDBu?=
 =?utf-8?B?WUJEYjdjYWJxSndkRDFhMW1LNDhMYUhvMXNkQjczUUR2dXcyR05hUEdUOWRm?=
 =?utf-8?B?UHV5UW1lelQzNUFZNGJTOWxtYURMMUFxalVXZUsyeUxYVGZ5L0Z0ckNUVXQ0?=
 =?utf-8?B?UmlFTFdFWEdOZUpZaE5xaWJNR0o1ZjEvMitWUzdjMkNJMWFyeWxrR0Nqa01j?=
 =?utf-8?B?QzVJZkd4OVNaMWE0dUtvVStmT284Tmd2b2ZkS3lVWUFTaDhBYjRFa2lDYlpv?=
 =?utf-8?B?ajlBZTFTZTdTZ0x4K1R4VndWS2NSK2ZYTVBDV1V6MlFXamlnRXdxTWo4WDJ0?=
 =?utf-8?B?REpVWEo5NS9mQ0ljQ2lGRnRxMzR6N3VoYVI1bnVxVjBmY2h3RUZESmtuMldk?=
 =?utf-8?B?OU9pSHdlUExvOWhIWnJPVS9HWmE1bkhqVnhPVFk1MjZnYklaMUJ3Zk5VejdB?=
 =?utf-8?B?YmF3emhSQ0wyRkh4ZDNreWJ3cVAweUppbTFJQ29hZXFNVXFadmRhV3VYNmZt?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc778468-1fa4-4c4c-80d0-08dcb1a6e38d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 21:22:32.1428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vb7NeiA3UWww33QzzLWNqLs45LdEcH2j1dVEni8p/PTfPnJwfeiSMEF9/MBCqK0rh0ctn0YkQYQnzhnujprqZwL5uFdLdwEiF6TJ73/d0XQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4789
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

--------------0us0BY0IBEvI0yi5LA2CN1cV
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 7/30/2024 4:33 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe_gt_freq: Avoid RPe usage in subtests (rev4)
> *URL:* 	https://patchwork.freedesktop.org/series/136445/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11501/index.html
>
>
>   CI Bug Log - changes from CI_DRM_15157 -> IGTPW_11501
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_11501 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11501, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11501/index.html
>
>
>     Participating hosts (41 -> 41)
>
> Additional (1): fi-bsw-n3050
> Missing (1): fi-snb-2520m
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_11501:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@runner@aborted:
>       o fi-bsw-n3050: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11501/fi-bsw-n3050/igt@runner@aborted.html>
>
Failure is not related to the changes.

Thanks,

Vinay.

>  *
>
>
>     Known issues
>
> Here are the changes found in IGTPW_11501 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>   * igt@i915_selftest@live@gt_lrc:
>       o bat-twl-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15157/bat-twl-1/igt@i915_selftest@live@gt_lrc.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11501/bat-twl-1/igt@i915_selftest@live@gt_lrc.html>
>         (i915#10886
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10886>
>         / i915#9413
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413>)
>
>
>         Possible fixes
>
>   * igt@i915_selftest@live@hangcheck:
>       o bat-arls-1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15157/bat-arls-1/igt@i915_selftest@live@hangcheck.html>
>         (i915#11349
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349>
>         / i915#11378
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11501/bat-arls-1/igt@i915_selftest@live@hangcheck.html>
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7942 -> IGTPW_11501
>
> CI-20190529: 20190529
> CI_DRM_15157: 4b1ff33f467ab28809de294cdda1ee9f6e16298d @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11501: 11501
> IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
--------------0us0BY0IBEvI0yi5LA2CN1cV
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/30/2024 4:33 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172238241863.466042.5783612084926495240@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/xe_gt_freq: Avoid RPe usage in subtests (rev4)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/136445/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/136445/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11501/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11501/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_15157 -&gt; IGTPW_11501</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_11501 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_11501, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11501/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11501/index.html</a></p>
      <h2>Participating hosts (41 -&gt; 41)</h2>
      <p>Additional (1): fi-bsw-n3050 <br>
        Missing (1): fi-snb-2520m </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_11501:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@runner@aborted:
          <ul>
            <li>fi-bsw-n3050: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11501/fi-bsw-n3050/igt@runner@aborted.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Failure is not related to the changes.</p>
    <p>Thanks,</p>
    <p>Vinay.<br>
    </p>
    <blockquote type="cite" cite="mid:172238241863.466042.5783612084926495240@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_11501 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>igt@i915_selftest@live@gt_lrc:
          <ul>
            <li>bat-twl-1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15157/bat-twl-1/igt@i915_selftest@live@gt_lrc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11501/bat-twl-1/igt@i915_selftest@live@gt_lrc.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10886" moz-do-not-send="true">i915#10886</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413" moz-do-not-send="true">i915#9413</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>igt@i915_selftest@live@hangcheck:
          <ul>
            <li>bat-arls-1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15157/bat-arls-1/igt@i915_selftest@live@hangcheck.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349" moz-do-not-send="true">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378" moz-do-not-send="true">i915#11378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11501/bat-arls-1/igt@i915_selftest@live@hangcheck.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_7942 -&gt; IGTPW_11501</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_15157: 4b1ff33f467ab28809de294cdda1ee9f6e16298d @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_11501: 11501<br>
        IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
    </blockquote>
  </body>
</html>

--------------0us0BY0IBEvI0yi5LA2CN1cV--
