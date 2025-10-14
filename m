Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBABCCD184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 06:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D7410E1A4;
	Tue, 14 Oct 2025 06:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTS5CqbK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0582610E542
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 06:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760423252; x=1791959252;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=K10dDC/Vejvr0zZFHihQLwSvNGOXYcd0P5cKJHoVL5E=;
 b=LTS5CqbKoqQbXipSKpBIOLBKiGEJnq4eVE945oa6pnvIBOVWznijebJp
 oezExQ5lo2bDB4XnK2mR0EabADMfH1u7Ss9LCla59E27mvBhLqtyhIVZo
 o/Sp8hRbueGwBE+H4dg+Qtr4tSL1m1MHVba0Y7iPjB15cUzYaAlFQL2+q
 cqqK1yadLWZBvov0bzyM10KfbyRvT/lPgW2Pi9w7XwhnPwUyXC0ANA+Q2
 /Q5hbw/pQIJv2syAa1nfT8+YESUe5ROxwdFHyaUdN/5DE6Pn9A+HO0cA7
 0+SUX9XnYaYD2hZR+6R6ItIWVwSzivevclXENw3pMTpI7zhGyklIWb4lG A==;
X-CSE-ConnectionGUID: uynTDbKkTtWqXUua/coVAA==
X-CSE-MsgGUID: vWzBjeVPSqq/5WMNRU3SbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62506304"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208,217";a="62506304"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 23:27:31 -0700
X-CSE-ConnectionGUID: G1ndGZ/OTBChS4QrlCSgyQ==
X-CSE-MsgGUID: 6ogVSD6UQdGw3tSjp4UYUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
 d="scan'208,217";a="212419472"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 23:27:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 23:27:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 23:27:29 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 23:27:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6Iyl/pwZFLxOMfJq04PL7HHc4hGwLLHb2fvqe6ARoHnuuS5KibBRsydvC1jdJsycUWhcEhivNOo6GQGwS/SnLFLcNl5ADZT0icSnFj+mH0ksK0vsUcTEW05OvNy08iyvz2Vq2NV3Z/XegeNFFccR6Jb7kr0twGZ6eBn2jVinGXmH3CsNgydKyolEQo6Smu3NvnRds8PiAqmpaEgrl554o7DIrmrz0aq/d477C5IiAU9a2CMVOVzrK8twNbP/Omv5WPBQPxjQefoXyJCmqEfjWFVtSMaBni9aycDVhOUFM8rbF6vldA6cswYb8jdu92RHn8LSyeMYKy/Ev95ju6a8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmQiagJt37azH7yMuRv+e3Q0e+KhXJdZ5/bpEt0xo0s=;
 b=bmIjnGUUx/trhbwVPfBXX1VBA6DhJkkhF2qopQfOzvV1oZ30u/NiueDd+2jNEXa1dG7nAXhas/96LRDrJcSuoD5p/oSc9JjFmkK2Bw4liFiprw/cOKWIxS4uPUDNrFViLMlphx/CVdaS+O/IUphDxo5dzlngeG4NkoQ5OLGvm3YqfxXIvaQ71eLNLrhS77t2XBuFS2jFvziwy51Il2jdvqIQ/NmFIMYJA9XhIbYF0TpkG/XVbCERlp5g3nzOlz5w/t9Os6AWoM4611OA9X0IYmUvASuD96IZHsNJ29dcohEexEJ3Am2MKjwQ628GzRy/yLYljTMVKecG5vDTMi4xlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS4PPF2A0C3F85C.namprd11.prod.outlook.com (2603:10b6:f:fc02::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 06:27:22 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 06:27:22 +0000
Content-Type: multipart/alternative;
 boundary="------------s1BdrksrjCE6qS83fTSfLqEM"
Message-ID: <92a89022-3e38-4889-8c4d-83a3e450edea@intel.com>
Date: Tue, 14 Oct 2025 11:57:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib/igt_usb4_switch: add helper library for Microsoft
 USB4 switch 3141
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <imre.deak@intel.com>
References: <20250521055619.1961965-1-kunal1.joshi@intel.com>
 <20250521055619.1961965-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250521055619.1961965-2-kunal1.joshi@intel.com>
X-ClientProxiedBy: MA5PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS4PPF2A0C3F85C:EE_
X-MS-Office365-Filtering-Correlation-Id: b4042846-5c72-4a09-7e04-08de0aeabb96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|42112799006|1800799024|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2dRanFSZUprTkpOMVJvZHlOQ1U0ZTVhb0tUenNsOThNc3hkM2R3QmpaT1V1?=
 =?utf-8?B?d0FBRXNpR2dNcFNNeDF1UjZkWEtCSDI3RnRmMUhUNzJRZDJQR2xLQlBSa0lv?=
 =?utf-8?B?QlVRcHdVZDZwZzNRSEFxTDR5ek9QU1A1Sy9MSXNVME8yeHEzWGYwWmovK2NB?=
 =?utf-8?B?K0FKcGI4Q201NitYWGVOMmdmUjdFTFVRUzZyWUVlL2dYWnhNSGFkQ09sMW9Z?=
 =?utf-8?B?ZjFsbmNJZVJuSktyMm8yMURiWStPR2VlejFWRkl1TG5ndGsxaENSSkJ1Q1ZU?=
 =?utf-8?B?RC9PQWpVck5aandBOUxUY20vc0U4NXBHZmcwR2FwbzFVajlITWF1UkV3L0FV?=
 =?utf-8?B?WjV4V3dEQ05QcmZCSGd4b0NSMUZUeU1pSUxIdkNPZk5TalZIRXAxUTFqNTlU?=
 =?utf-8?B?Qis2MTBCODkzdm1UWGJwTDlFbGJudkhHaFZOOW1TODlPSktqMm5JZEpoc1p0?=
 =?utf-8?B?Z056RldRUDdMcDRMUFhZY1lQOVBjN1dwdmJoNStrQ1p5NXVDbVZaVGtHYWNY?=
 =?utf-8?B?bWc0eG1pVjhtYXpRdUJ0am9EYlpHUXB3OGVPWm9sQTkyTXNjYUVFSlBVdFdt?=
 =?utf-8?B?QjJjK0llN2Q0SXhHcUZFNXd3MVovNTlJeUs3YjJhM3RYQzBHeEw4bzljR0du?=
 =?utf-8?B?OE5UUmM5STkzYllvWFJEeXR0bEsxVUs5OFkzSUljZmlOc0xkdU9TM2JUUGVE?=
 =?utf-8?B?bDdhb3VFSGlYV1FZei91M3Z5VmxLUlBjK3U0R3ZaSVB0ZDVxOGVpREVhVi9q?=
 =?utf-8?B?TjBsbGJqbXl0WUMxYTdoSlVmbWpTWVlNNjAvMnZhYUJVWWhnUlA2NEhHUWtm?=
 =?utf-8?B?QStiY21OSkc0RUwybUpjMmdoUVk0WWpiMmhaWTdYMG1GaXBvWUJ0ZmVWQ1pp?=
 =?utf-8?B?RVpsODBPQnEzYUdJK01vUi9KVWtNWnZMZDh4V1FDZVNYSGQ1b2xWQWV6Smc2?=
 =?utf-8?B?MnVYVGZ4U1JiZUpxUno0NDlJNGhmZEplWklEYjBiaWhMaTd2NmFKa3BIclBE?=
 =?utf-8?B?VFdmd05DQStNRmlpUm1TNkdhZE1UZUFQNGlJOHdxeE9sL0xZa2ZqTkhaa0F1?=
 =?utf-8?B?Vll5L05TL0REd3A5czB6Mk5nTmtZNmovQ0wrSVU0YkIvZG9nRkg3N2pZc1hB?=
 =?utf-8?B?Tk1jd0s5K21TN3dNa1h0dmMxUVovbmZMRmVsSXlpeHVFM3BxaHE1QXhPWnAw?=
 =?utf-8?B?YlZpV0VFTlVIelpyMFNrV1A5QmZWbXk4dE5pQS9ESzdHR3lTYW12MzEzSHdu?=
 =?utf-8?B?Y3pJTHBadlgvUU9HN2RmOGd4ZXd5alQ5L2l3L3MvYjNzaXVhSnJZNkdMakFZ?=
 =?utf-8?B?Qk5TR0tiTis0ZFc2VUpPaG9XNVRtNEdKNGhlUnREb295cWdnMHdaTFoyZnJ4?=
 =?utf-8?B?TGdWbi95K1haL2FMZGFwTTZDZHFzM2FnT3pyM3Q4cjZvQ1lIaFR1bjdsdHVy?=
 =?utf-8?B?cHJqMisxNDVHaGFsZzRKWGlNck4zamViMXNtUlpmWHVva09vZFY5SlVtMnRz?=
 =?utf-8?B?dWczMmVKMVg2eDRtazk3VFVWMGFEbExsTk0xeWdMRFF1Uk8wNFFrK2pleXox?=
 =?utf-8?B?ZVI3a1QrRVo5U2dPYkNHUWtkdU5IZmhmWXdTS00zNnF5WG4xc0dtTlFZd1NX?=
 =?utf-8?B?WGUvblhKS1d5b29qRk5KbVZRejBVRXdjZzNJa0lqR1kyZmlxRkVWZ0FQeDAv?=
 =?utf-8?B?U1kybEpacExQcWxBNmNrSzNTN3N3cWh0T3VsMDQxemhXYi8yZlppTER3VWMx?=
 =?utf-8?B?WmpTUE1sRmlOcjVZRktGY2RKbC85aEZjUVdidzdzOHhoeCsxSXdvcE4rUnhh?=
 =?utf-8?B?NXZFWGVHT0hFbkxPcWUrWUZ1eTVUMmxmcGtNL3pVQ2xvUEplc1lWWW8rVmJF?=
 =?utf-8?B?cVQ2NTdYUVVMVUx0c0tEWDRINDVpQ21ZU2d0U1RQYk1iUjZYMHMxeFAxS3pZ?=
 =?utf-8?Q?hS27BRJn3K+3WcSBQUOq0JDydFgBcKUx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2wwS1hBSkdVZUlHSGxLMjA4b0x2VjljM3ZSSHRuRjY4RHJKaUJ3WFRHcldo?=
 =?utf-8?B?UEhGWHZLNjdrQ2ZTYnhSaGkvNjhMc0o1WmFIM3kzRkUyc1lNSDZwMmp2MkdI?=
 =?utf-8?B?d3RkUklNU2VTOThzQVZYVEdTajNsZU5PMjVwemc0U1hNR1oydFcvcTljWWpR?=
 =?utf-8?B?S3ZZaWcyNTVzQndWbXhaYjcwKzEyQUtFZnhIQ3lLK1FlVWwva3VTc1FqUkkr?=
 =?utf-8?B?cW9CTzRHR2h3Nks2cTZEZnp6ZzlZbzQ1YXRiT3hudjNhZm1XeEc3UThHTlNh?=
 =?utf-8?B?UVZrZis5R3Z0bTU0bzRsUHFUR1hPOEl5dWtMVGRPTFo2REN1aS9oZkttTEpO?=
 =?utf-8?B?UXdLKzNidXV6QW12M0JFcEI3Q3oweVhjb2drWG5xZkE0Y3RxSERBazdCM2V0?=
 =?utf-8?B?UnRLTHMvZjBiYTBQL1ovcFJ6NjNJa1pNUWJLQ1RCWmhZQkcwRjVsejR2RitI?=
 =?utf-8?B?aXNOL1dYMnZDR3VNYSt2aVlrcEJYTFhVSWxHUDg2M2lreXJ3OFNnSzZNV0gy?=
 =?utf-8?B?alNSZ0dFS3RmbCsvOVRnRitJajdqMXlHcks1S1l3TWs2WHdDUFo1dlpUMTVm?=
 =?utf-8?B?dWhCVlhVczdTN1N6Y0MrK2VTUUEwVFZ1dklTRVBRQklsc0htRUhnTURtMW10?=
 =?utf-8?B?S0FLNTJRU1psV1RZbU1kTGkvQUxjM0dZZEFicTZja1Z4Q2Y5OWg3U2w1NTRm?=
 =?utf-8?B?YTc4bmhDaGRucnF1eVJEVENyUTBFQ3VrQm9CMU51c0pmY21TZ3FXV3NodUxC?=
 =?utf-8?B?cCtOWU1uWXAvb0ltWW5XUHpDbWFGUHFHcEtxYS9nZjdhYWY4eXZJN2RtUXZE?=
 =?utf-8?B?NE9TUFF3MWhXYlZTTXRLbHpJOG1KYW5SQTA4TytCZzNVclpwVGRQMEdFbDVV?=
 =?utf-8?B?QitCU2ZraU81anJ4M01rajZpdWxDSVRETnBWaWI4WVZzZGJrRkFQVVlPVXhN?=
 =?utf-8?B?cUt3NHVrZEZkVE4wWTNVL2luU2N1Vm4zemlDbzZDTTZyelN6TG5Rd3lRQkQx?=
 =?utf-8?B?U0U2SXBGNWkydXZyaENiaEgxenJvZ2xNYS9hS3hXYTZGZzZjdlpKMXBwaHZT?=
 =?utf-8?B?T1NYdUdZZGpSNFpBMWp3SnNEVzdJeDI3UUlYR2g4ZFMxdUZPdEpkNkU0b2NP?=
 =?utf-8?B?cjVvR2JrbHRuZkQyMWczVThPY3JSUk53ZzFMaDlrclNDTEZkQ0s5ZHZXRmQz?=
 =?utf-8?B?a2xwMWtXWTBMWGh1T3FVdjdESTZyT1BORUVlMDk4ODFXZ09aRmU4THQxTStU?=
 =?utf-8?B?UUFIWDl3UjQ5eE91OGJxYjF3VnRubjhQWk13dDJBaXFvUVhteTZEWmJrQkZi?=
 =?utf-8?B?MytHYm9YRnBrODQvdFIreGhPdWxKdERTSEJibnpWZkNiMG5yQVIyVkppaFpZ?=
 =?utf-8?B?VGxsRTRiK1o3VFU0N2p5alNldlN1V0J4ak9HQ2VXZDdlR0dOeXprbjFFb1lm?=
 =?utf-8?B?aVQ3Nk1TRCtza3ZmZEdwckZvZG5UdVErNzhTR1JJVFQ4UTRjZWxrM1h1a3pB?=
 =?utf-8?B?TzFSN1dncmtNOHdNR2xiS2ViNDVaaGJIc2JUZXo0ZDdyZE9ySjNGZ2JqU05F?=
 =?utf-8?B?NWRXcm0yc0RlY3doNGx2c0NvUGo3TTdGenZmL3dJZkhyUkEzekI4R0JPN3Ra?=
 =?utf-8?B?UnZLTnZHdjQ0LzFUSGpVcHc4N2tYblhGbWNrTlhJbzREWEdPYno4YXdtT1kz?=
 =?utf-8?B?ZWxPcEJDRC9lRmo1R3lCYkhGTXpPeDBNMktnMVp4Tk1ZZmVRT2ZLb1NPSS9w?=
 =?utf-8?B?cUhGcTZCTVcyZkhHbzQ0RlFLWTR6azlkMG15ME9ubDhobFV4MEF5eTRPcy93?=
 =?utf-8?B?VFBmM0h0eFg3TE5YWDNzU0FadUxFYUxmVXc3ajNyYU0vSE9MTkxuNWRQMUF0?=
 =?utf-8?B?Q2VYZVBiNU5mbTFIOHBsdW5MVTJFS0ZLcEJpMGptT3pWSmx5SytoN0ZGdFd3?=
 =?utf-8?B?UEN1M09VMTZLM0t6MEp6aThTekU5SFEyM0ZtZkZRRTFhdmE0SCthZnRCQzc4?=
 =?utf-8?B?Mk01eVlCM1M5allyWU9DZGtXOU5MUitReExUdXdsYzR6aUNRQmEyZXZEYytF?=
 =?utf-8?B?RlhtWFRxSjArV2JiVmFtTmJYQnRKZzNFZTAxQWJqK0xaaHExUXIrSjJnN0sw?=
 =?utf-8?Q?jyFB6vgNvS/1NJpfYv0TK2txU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4042846-5c72-4a09-7e04-08de0aeabb96
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 06:27:22.2525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YesmA7tnsgofC956ynKNipo/5XbSm/zSewhN/EblP3FHCJ684UyYHMTze4/emVP85cAX2fPnhZ/L8u4mR27wnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2A0C3F85C
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

--------------s1BdrksrjCE6qS83fTSfLqEM
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Kunal,

On 5/21/2025 11:26 AM, Kunal Joshi wrote:
> The Microsoft USB4 Switch (model 3141) board
> has two downstream ports, but only one can be
> active at any moment. Each port may run in
> Thunderbolt (TBT) or DisplayPort-Alt mode,
> and the board is controlled over a
> CDC-ACM serial console (/dev/ttyACM0).
>
> The helper library exposes simple commands to:
> - activate a port (port <N>)
> - set the power-on default port
> - program switch delay / timeout values
> - enable or disable the SuperSpeed lanes
> - read or write arbitrary registers
> - query status or firmware version
>
> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
> ---
>   lib/igt_usb4_switch.c | 392 ++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_usb4_switch.h |  78 +++++++++
>   lib/meson.build       |   1 +
>   3 files changed, 471 insertions(+)
>   create mode 100644 lib/igt_usb4_switch.c
>   create mode 100644 lib/igt_usb4_switch.h
>
> diff --git a/lib/igt_usb4_switch.c b/lib/igt_usb4_switch.c
> new file mode 100644
> index 000000000..8db57089f
> --- /dev/null
> +++ b/lib/igt_usb4_switch.c
> @@ -0,0 +4,395 @@
> +/* SPDX-License-Identifier: MIT */

// SPDX-License-Identifier: MIT

Please use the same in all files. Checkpatch throws a warning with the 
existing style.
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/*
> + * Helper library for controlling a USB4 switch over a serial ACM port.
> + */
> +
> +#include "igt_usb4_switch.h"
> +
> +#include <termios.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <string.h>
> +#include <stdlib.h>
> +#include <stdint.h>
> +#include <errno.h>
> +
> +static GKeyFile * usb4_conf;
> +
> +/**
> + * configure_port:
> + * @fd: File descriptor for serial port
> + *
> + * Put @fd in raw 9600-8N1, no flow control, VMIN=0 / VTIME=5.
> + *
> + * Returns: 0 on success, -1 on error
> + */
> +static int configure_port(int fd)
> +{
> +	struct termios tty;
> +
> +	if (tcgetattr(fd, &tty) < 0)
> +		return -1;
> +
> +	cfmakeraw(&tty);
> +	cfsetispeed(&tty, B9600);
> +	cfsetospeed(&tty, B9600);
> +
> +	tty.c_cflag |=  CS8 | CLOCAL | CREAD;
> +	tty.c_cflag &= ~CRTSCTS;
> +
> +	tty.c_cc[VMIN]  = 0;
> +	tty.c_cc[VTIME] = 5;
> +
> +	if (tcsetattr(fd, TCSANOW, &tty) < 0)
> +		return -1;
> +
> +	tcflush(fd, TCIOFLUSH);
> +	return 0;
> +}
> +
> +/**
> + * send_cmd:
> + * @sw:       Switch object
> + * @cmd:      Command string (without CR)
> + * @resp:     Output buffer (may be %NULL)
> + * @resp_len: Size of @resp
> + *
> + * Sends “@cmd\r”; if @resp is provided and @resp_len > 1, reads up to
> + * @resp_len-1 bytes and NUL-terminates the buffer.
> + *
> + * Returns: 0 on success, -1 on error
> + */
> +static int send_cmd(usb4_switch_t *sw,
> +		    const char *cmd,
> +		    char *resp,
> +		    size_t resp_len)
> +{
> +	char buf[CMD_BUF_SIZE];
> +	int n = snprintf(buf, sizeof(buf), "%s\r", cmd);
> +
> +	if (n <= 0 || n >= (int)sizeof(buf))
> +		return -1;
> +
> +	if (write(sw->fd, buf, n) != n)
> +		return -1;
> +
> +	tcdrain(sw->fd);
> +
> +	if (resp && resp_len > 1) {
> +		ssize_t r = read(sw->fd, resp, resp_len - 1);
> +
> +		if (r <= 0)
> +			return -1;
> +		resp[r] = '\0';
> +	}
> +
> +	return 0;
> +}
> +
> +int usb4_switch_open(usb4_switch_t *sw)
> +{
> +	int fd = open("/dev/ttyACM0", O_RDWR | O_NOCTTY);
> +
> +	if (fd < 0)
> +		return -1;
> +
> +	if (configure_port(fd) < 0) {
> +		close(fd);
> +		return -1;
> +	}
> +
> +	sw->fd = fd;
> +	return 0;
> +}
> +
> +void usb4_switch_close(usb4_switch_t *sw)
> +{
> +	if (sw->fd >= 0) {
> +		close(sw->fd);
> +		sw->fd = -1;
> +	}
> +}
> +
> +int usb4_switch_version(usb4_switch_t *sw, char *out, size_t outlen)
> +{
> +	return send_cmd(sw, "version", out, outlen);
> +}
> +
> +int usb4_switch_get_port(usb4_switch_t *sw)
> +{
> +	char resp[RESP_BUF_SIZE];
> +
> +	if (send_cmd(sw, "port", resp, sizeof(resp)) < 0)
> +		return -1;
> +	return atoi(resp);
> +}
> +
> +int usb4_switch_set_port(usb4_switch_t *sw, int port)
> +{
> +	char cmd[CMD_BUF_SIZE];
> +
> +	snprintf(cmd, sizeof(cmd), "port %d", port);
> +	return send_cmd(sw, cmd, NULL, 0);
> +}
> +
> +int usb4_switch_get_default_port(usb4_switch_t *sw)
> +{
> +	char resp[RESP_BUF_SIZE];
> +
> +	if (send_cmd(sw, "defaultport", resp, sizeof(resp)) < 0)
> +		return -1;
> +	return atoi(resp);
> +}
> +
> +int usb4_switch_set_default_port(usb4_switch_t *sw, int port)
> +{
> +	char cmd[CMD_BUF_SIZE];
> +
> +	snprintf(cmd, sizeof(cmd), "defaultport %d", port);
> +	return send_cmd(sw, cmd, NULL, 0);
> +}
> +
> +int usb4_switch_set_delay(usb4_switch_t *sw, int seconds)
> +{
> +	char cmd[CMD_BUF_SIZE];
> +
> +	snprintf(cmd, sizeof(cmd), "delay %d", seconds);
> +	return send_cmd(sw, cmd, NULL, 0);
> +}
> +
> +int usb4_switch_set_timeout(usb4_switch_t *sw, int ms)
> +{
> +	char cmd[CMD_BUF_SIZE];
> +
> +	snprintf(cmd, sizeof(cmd), "timeout %d", ms);
> +	return send_cmd(sw, cmd, NULL, 0);
> +}
> +
> +int usb4_switch_set_superspeed(usb4_switch_t *sw, bool enable)
> +{
> +	return send_cmd(sw, enable ? "superspeed 1" : "superspeed 0", NULL, 0);
> +}
> +
> +int usb4_switch_put_data(usb4_switch_t *sw, int idx, int val)
> +{
> +	char cmd[CMD_BUF_SIZE];
> +
> +	snprintf(cmd, sizeof(cmd), "put %d %d", idx, val);
> +	return send_cmd(sw, cmd, NULL, 0);
> +}
> +
> +int usb4_switch_get_data(usb4_switch_t *sw, int idx)
> +{
> +	char resp[RESP_BUF_SIZE];
> +	char cmd[CMD_BUF_SIZE];
> +
> +	snprintf(cmd, sizeof(cmd), "get %d", idx);
> +	if (send_cmd(sw, cmd, resp, sizeof(resp)) < 0)
> +		return -1;
> +	return atoi(resp);
> +}
> +
> +int usb4_switch_status(usb4_switch_t *sw, char *out, size_t outlen)
> +{
> +	return send_cmd(sw, "status", out, outlen);
> +}
> +
> +int usb4_switch_reset(usb4_switch_t *sw)
> +{
> +	return send_cmd(sw, "reset", NULL, 0);
> +}
> +
> +int usb4_switch_set_port_with_delay(usb4_switch_t *sw,
> +				    int port, int delay_s)
> +{
> +	if (usb4_switch_set_delay(sw, delay_s) < 0)
> +		return -1;
> +	return usb4_switch_set_port(sw, port);
> +}
> +
> +int usb4_switch_set_port_with_timeout(usb4_switch_t *sw,
> +				      int port, int timeout_ms)
> +{
> +	if (usb4_switch_set_timeout(sw, timeout_ms) < 0)
> +		return -1;
> +	return usb4_switch_set_port(sw, port);
> +}
> +
> +bool usb4_switch_load_config(void)
> +{
> +	usb4_conf = igt_load_igtrc();
> +	return usb4_conf != NULL;
return usb4_conf;
> +}
> +
> +void usb4_switch_unload_config(void)
> +{
> +	if (usb4_conf) {
> +		g_key_file_free(usb4_conf);
> +		usb4_conf = NULL;
> +	}
> +}
> +
> +struct usb4_switch_port_info *
> +usb4_switch_list_ports(size_t *out_count)
> +{
> +	gsize n_groups;
> +
> +	gchar **groups = g_key_file_get_groups(usb4_conf, &n_groups);
> +	struct usb4_switch_port_info *ports = NULL;
> +	size_t count = 0;
> +
> +	for (gsize gi = 0; gi < n_groups; gi++) {
> +		const char *grp = groups[gi];
> +		struct usb4_switch_port_info *p;
> +		GError *err = NULL;
> +		gchar **tokens = NULL;
> +		char *raw = NULL;
> +		size_t n = 0;
> +
> +		/* skip irrelevant sections */
> +		if (g_strcmp0(grp, USB4_SWITCH_CFG_GROUP) == 0)
> +			continue;
> +		if (!g_str_has_prefix(grp, USB4_SWITCH_SECTION_PREF))
> +			continue;
> +
> +		/* ---- allocate & fill struct ---- */
> +		ports = realloc(ports, sizeof(*ports) * (count + 1));
> +		p     = &ports[count];
> +		memset(p, 0, sizeof(*p));
> +
> +		p->name = strdup(grp + strlen(USB4_SWITCH_SECTION_PREF));
> +
> +		p->port_id = g_key_file_get_integer(usb4_conf,
> +						    grp, "USB4SwitchPortID", NULL);
> +		p->type    = g_key_file_get_string(usb4_conf,
> +						    grp, "Type", NULL);

Please fix the alignment.

Regards,
Karthik.B.S
> +		p->displays = g_key_file_get_integer(usb4_conf,
> +						     grp, "Displays", NULL);
> +
> +		raw = g_key_file_get_string(usb4_conf, grp, "EDIDs", &err);
> +		igt_assert_f(raw && !err,
> +			     "Missing or invalid EDIDs in [%s]\n", grp);
> +
> +		tokens = g_strsplit(raw, ",", 0);
> +
> +		/* trim + count */
> +		for (char **t = tokens; *t; t++) {
> +			char *s = g_strstrip(*t);
> +
> +			if (s[0] != '\0')
> +				tokens[n++] = s;
> +		}
> +		tokens[n] = NULL;
> +
> +		p->edids = g_malloc0(sizeof(char *) * (n + 1));
> +		for (size_t i = 0; i < n; i++)
> +			p->edids[i] = strdup(tokens[i]);
> +		p->n_edids = n;
> +
> +		g_strfreev(tokens);
> +		g_free(raw);
> +
> +		igt_assert_f(p->n_edids == p->displays,
> +			     "Config error in [%s]: Displays=%d, EDIDs=%u\n",
> +			     grp, p->displays, p->n_edids);
> +
> +		count++;
> +	}
> +
> +	g_strfreev(groups);
> +	*out_count = count;
> +	return ports;
> +}
> +
> +void usb4_switch_free_port_info(struct usb4_switch_port_info *ports,
> +				size_t count)
> +{
> +	if (!ports)
> +		return;
> +
> +	for (size_t i = 0; i < count; i++) {
> +		free(ports[i].name);
> +		free(ports[i].type);
> +		g_strfreev(ports[i].edids);
> +	}
> +	free(ports);
> +}
> +
> +bool usb4_switch_port_has_edid(int drm_fd,
> +			       int port_id,
> +			       const char *expected)
> +{
> +	drmModeRes *res  = NULL;   /* declare at block top (C90) */
> +	bool found = false;
> +
> +	igt_info("Checking EDID serial on port %d: want %s\n",
> +		 port_id, expected);
> +
> +	res = drmModeGetResources(drm_fd);
> +	igt_assert(res);
> +	igt_info("  %d connectors to scan\n", res->count_connectors);
> +
> +	for (int ci = 0; ci < res->count_connectors; ci++) {
> +		uint32_t conn_id;
> +		drmModeConnector *conn;
> +		uint64_t blob64 = 0;
> +		uint32_t blob_id;
> +		drmModePropertyBlobRes *blob;
> +		struct edid *e;
> +		char serial_hex[9];
> +
> +		conn_id = res->connectors[ci];
> +		conn    = drmModeGetConnector(drm_fd, conn_id);
> +		if (!conn) {
> +			igt_warn("  connector %u: no connector data\n", conn_id);
> +			continue;
> +		}
> +
> +		if (conn->connection != DRM_MODE_CONNECTED) {
> +			drmModeFreeConnector(conn);
> +			continue;
> +		}
> +
> +		if (!kmstest_get_property(drm_fd,
> +					  conn->connector_id,
> +					  DRM_MODE_OBJECT_CONNECTOR,
> +					  "EDID", NULL,
> +					  &blob64, NULL) ||
> +		    blob64 == 0) {
> +			igt_warn("  connector %u: no EDID blob\n", conn_id);
> +			drmModeFreeConnector(conn);
> +			continue;
> +		}
> +
> +		blob_id = (uint32_t)blob64;
> +		blob = drmModeGetPropertyBlob(drm_fd, blob_id);
> +		igt_assert(blob && blob->length >= sizeof(struct edid));
> +
> +		e = (struct edid *)blob->data;
> +		snprintf(serial_hex, sizeof(serial_hex),
> +			 "%02X%02X%02X%02X",
> +			 e->serial[0], e->serial[1],
> +			 e->serial[2], e->serial[3]);
> +
> +		igt_info("  connector %u → serial=%s\n",
> +			 conn_id, serial_hex);
> +
> +		drmModeFreePropertyBlob(blob);
> +		drmModeFreeConnector(conn);
> +
> +		if (strcmp(serial_hex, expected) == 0) {
> +			igt_info("  → match on connector %u\n", conn_id);
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	drmModeFreeResources(res);
> +	if (!found)
> +		igt_info("No connector found with serial %s\n", expected);
> +	return found;
> +}
> diff --git a/lib/igt_usb4_switch.h b/lib/igt_usb4_switch.h
> new file mode 100644
> index 000000000..8d9d265cc
> --- /dev/null
> +++ b/lib/igt_usb4_switch.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef IGT_USB4_SWITCH_H
> +#define IGT_USB4_SWITCH_H
> +
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdlib.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <termios.h>
> +#include <sys/ioctl.h>
> +#include <errno.h>
> +#include <glib.h>
> +#include "igt_core.h"
> +#include <xf86drmMode.h>
> +#include "igt_kms.h"
> +#include "igt_edid.h"
> +
> +#define CMD_BUF_SIZE   64
> +#define RESP_BUF_SIZE 128
> +#define USB4_SWITCH_CFG_GROUP     "USB4Switch"
> +#define USB4_SWITCH_SECTION_PREF  "USB4Switch:"
> +
> +/**
> + * struct usb4_switch_port_info - describes one USB4-switch port from igtrc
> + * @name:       the logical name after the colon in the section header
> + * @port_id:    the numeric USB4SwitchPortID
> + * @type:       TBT or DP-ALT
> + * @displays:   how many displays to expect
> + * @edids:      array of EDID serial strings
> + * @n_edids:    number of entries in @edids (should == @displays)
> + */
> +struct usb4_switch_port_info {
> +	char *name;
> +	int port_id;
> +	char *type;
> +	int displays;
> +	char **edids;
> +	int n_edids;
> +};
> +
> +typedef struct {
> +	int fd;
> +	char devpath[64];
> +} usb4_switch_t;
> +
> +int usb4_switch_open(usb4_switch_t *sw);
> +void usb4_switch_close(usb4_switch_t *sw);
> +int usb4_switch_version(usb4_switch_t *sw, char *out, size_t outlen);
> +int usb4_switch_get_port(usb4_switch_t *sw);
> +int usb4_switch_set_port(usb4_switch_t *sw, int port);
> +int usb4_switch_get_default_port(usb4_switch_t *sw);
> +int usb4_switch_set_default_port(usb4_switch_t *sw, int port);
> +int usb4_switch_set_delay(usb4_switch_t *sw, int seconds);
> +int usb4_switch_set_timeout(usb4_switch_t *sw, int ms);
> +int usb4_switch_set_superspeed(usb4_switch_t *sw, bool enable);
> +int usb4_switch_put_data(usb4_switch_t *sw, int index, int value);
> +int usb4_switch_get_data(usb4_switch_t *sw, int index);
> +int usb4_switch_status(usb4_switch_t *sw, char *out, size_t outlen);
> +int usb4_switch_reset(usb4_switch_t *sw);
> +int usb4_switch_set_port_with_delay(usb4_switch_t *sw, int port, int delay_s);
> +int usb4_switch_set_port_with_timeout(usb4_switch_t *sw, int port, int timeout_ms);
> +bool usb4_switch_load_config(void);
> +void usb4_switch_unload_config(void);
> +bool usb4_switch_port_has_edid(int drm_fd,
> +			       int port_id,
> +			       const char *expected_edid);
> +struct usb4_switch_port_info *
> +usb4_switch_list_ports(size_t *out_count);
> +void usb4_switch_free_port_info(struct usb4_switch_port_info *ports,
> +				size_t count);
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index 6f3a1150c..c2892eaab 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -48,6 +48,7 @@ lib_sources = [
>   	'igt_taints.c',
>   	'igt_thread.c',
>   	'igt_types.c',
> +        'igt_usb4_switch.c',
>   	'igt_vec.c',
>   	'igt_vgem.c',
>   	'igt_x86.c',
--------------s1BdrksrjCE6qS83fTSfLqEM
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Kunal,</p>
    <div class="moz-cite-prefix">On 5/21/2025 11:26 AM, Kunal Joshi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250521055619.1961965-2-kunal1.joshi@intel.com">
      <pre wrap="" class="moz-quote-pre">The Microsoft USB4 Switch (model 3141) board
has two downstream ports, but only one can be
active at any moment. Each port may run in
Thunderbolt (TBT) or DisplayPort-Alt mode,
and the board is controlled over a
CDC-ACM serial console (/dev/ttyACM0).

The helper library exposes simple commands to:
- activate a port (port &lt;N&gt;)
- set the power-on default port
- program switch delay / timeout values
- enable or disable the SuperSpeed lanes
- read or write arbitrary registers
- query status or firmware version

Signed-off-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
---
 lib/igt_usb4_switch.c | 392 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_usb4_switch.h |  78 +++++++++
 lib/meson.build       |   1 +
 3 files changed, 471 insertions(+)
 create mode 100644 lib/igt_usb4_switch.c
 create mode 100644 lib/igt_usb4_switch.h

diff --git a/lib/igt_usb4_switch.c b/lib/igt_usb4_switch.c
new file mode 100644
index 000000000..8db57089f
--- /dev/null
+++ b/lib/igt_usb4_switch.c
@@ -0,0 +4,395 @@
+/* SPDX-License-Identifier: MIT */</pre>
    </blockquote>
    <p>//&nbsp;<span style="white-space: pre-wrap">SPDX-License-Identifier: MIT</span></p>
    Please use the same in all files. Checkpatch throws a warning with
    the existing style.
    <blockquote type="cite" cite="mid:20250521055619.1961965-2-kunal1.joshi@intel.com">
      <pre wrap="" class="moz-quote-pre">
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/*
+ * Helper library for controlling a USB4 switch over a serial ACM port.
+ */
+
+#include &quot;igt_usb4_switch.h&quot;
+
+#include &lt;termios.h&gt;
+#include &lt;fcntl.h&gt;
+#include &lt;unistd.h&gt;
+#include &lt;string.h&gt;
+#include &lt;stdlib.h&gt;
+#include &lt;stdint.h&gt;
+#include &lt;errno.h&gt;
+
+static GKeyFile * usb4_conf;
+
+/**
+ * configure_port:
+ * @fd: File descriptor for serial port
+ *
+ * Put @fd in raw 9600-8N1, no flow control, VMIN=0 / VTIME=5.
+ *
+ * Returns: 0 on success, -1 on error
+ */
+static int configure_port(int fd)
+{
+	struct termios tty;
+
+	if (tcgetattr(fd, &amp;tty) &lt; 0)
+		return -1;
+
+	cfmakeraw(&amp;tty);
+	cfsetispeed(&amp;tty, B9600);
+	cfsetospeed(&amp;tty, B9600);
+
+	tty.c_cflag |=  CS8 | CLOCAL | CREAD;
+	tty.c_cflag &amp;= ~CRTSCTS;
+
+	tty.c_cc[VMIN]  = 0;
+	tty.c_cc[VTIME] = 5;
+
+	if (tcsetattr(fd, TCSANOW, &amp;tty) &lt; 0)
+		return -1;
+
+	tcflush(fd, TCIOFLUSH);
+	return 0;
+}
+
+/**
+ * send_cmd:
+ * @sw:       Switch object
+ * @cmd:      Command string (without CR)
+ * @resp:     Output buffer (may be %NULL)
+ * @resp_len: Size of @resp
+ *
+ * Sends “@cmd\r”; if @resp is provided and @resp_len &gt; 1, reads up to
+ * @resp_len-1 bytes and NUL-terminates the buffer.
+ *
+ * Returns: 0 on success, -1 on error
+ */
+static int send_cmd(usb4_switch_t *sw,
+		    const char *cmd,
+		    char *resp,
+		    size_t resp_len)
+{
+	char buf[CMD_BUF_SIZE];
+	int n = snprintf(buf, sizeof(buf), &quot;%s\r&quot;, cmd);
+
+	if (n &lt;= 0 || n &gt;= (int)sizeof(buf))
+		return -1;
+
+	if (write(sw-&gt;fd, buf, n) != n)
+		return -1;
+
+	tcdrain(sw-&gt;fd);
+
+	if (resp &amp;&amp; resp_len &gt; 1) {
+		ssize_t r = read(sw-&gt;fd, resp, resp_len - 1);
+
+		if (r &lt;= 0)
+			return -1;
+		resp[r] = '\0';
+	}
+
+	return 0;
+}
+
+int usb4_switch_open(usb4_switch_t *sw)
+{
+	int fd = open(&quot;/dev/ttyACM0&quot;, O_RDWR | O_NOCTTY);
+
+	if (fd &lt; 0)
+		return -1;
+
+	if (configure_port(fd) &lt; 0) {
+		close(fd);
+		return -1;
+	}
+
+	sw-&gt;fd = fd;
+	return 0;
+}
+
+void usb4_switch_close(usb4_switch_t *sw)
+{
+	if (sw-&gt;fd &gt;= 0) {
+		close(sw-&gt;fd);
+		sw-&gt;fd = -1;
+	}
+}
+
+int usb4_switch_version(usb4_switch_t *sw, char *out, size_t outlen)
+{
+	return send_cmd(sw, &quot;version&quot;, out, outlen);
+}
+
+int usb4_switch_get_port(usb4_switch_t *sw)
+{
+	char resp[RESP_BUF_SIZE];
+
+	if (send_cmd(sw, &quot;port&quot;, resp, sizeof(resp)) &lt; 0)
+		return -1;
+	return atoi(resp);
+}
+
+int usb4_switch_set_port(usb4_switch_t *sw, int port)
+{
+	char cmd[CMD_BUF_SIZE];
+
+	snprintf(cmd, sizeof(cmd), &quot;port %d&quot;, port);
+	return send_cmd(sw, cmd, NULL, 0);
+}
+
+int usb4_switch_get_default_port(usb4_switch_t *sw)
+{
+	char resp[RESP_BUF_SIZE];
+
+	if (send_cmd(sw, &quot;defaultport&quot;, resp, sizeof(resp)) &lt; 0)
+		return -1;
+	return atoi(resp);
+}
+
+int usb4_switch_set_default_port(usb4_switch_t *sw, int port)
+{
+	char cmd[CMD_BUF_SIZE];
+
+	snprintf(cmd, sizeof(cmd), &quot;defaultport %d&quot;, port);
+	return send_cmd(sw, cmd, NULL, 0);
+}
+
+int usb4_switch_set_delay(usb4_switch_t *sw, int seconds)
+{
+	char cmd[CMD_BUF_SIZE];
+
+	snprintf(cmd, sizeof(cmd), &quot;delay %d&quot;, seconds);
+	return send_cmd(sw, cmd, NULL, 0);
+}
+
+int usb4_switch_set_timeout(usb4_switch_t *sw, int ms)
+{
+	char cmd[CMD_BUF_SIZE];
+
+	snprintf(cmd, sizeof(cmd), &quot;timeout %d&quot;, ms);
+	return send_cmd(sw, cmd, NULL, 0);
+}
+
+int usb4_switch_set_superspeed(usb4_switch_t *sw, bool enable)
+{
+	return send_cmd(sw, enable ? &quot;superspeed 1&quot; : &quot;superspeed 0&quot;, NULL, 0);
+}
+
+int usb4_switch_put_data(usb4_switch_t *sw, int idx, int val)
+{
+	char cmd[CMD_BUF_SIZE];
+
+	snprintf(cmd, sizeof(cmd), &quot;put %d %d&quot;, idx, val);
+	return send_cmd(sw, cmd, NULL, 0);
+}
+
+int usb4_switch_get_data(usb4_switch_t *sw, int idx)
+{
+	char resp[RESP_BUF_SIZE];
+	char cmd[CMD_BUF_SIZE];
+
+	snprintf(cmd, sizeof(cmd), &quot;get %d&quot;, idx);
+	if (send_cmd(sw, cmd, resp, sizeof(resp)) &lt; 0)
+		return -1;
+	return atoi(resp);
+}
+
+int usb4_switch_status(usb4_switch_t *sw, char *out, size_t outlen)
+{
+	return send_cmd(sw, &quot;status&quot;, out, outlen);
+}
+
+int usb4_switch_reset(usb4_switch_t *sw)
+{
+	return send_cmd(sw, &quot;reset&quot;, NULL, 0);
+}
+
+int usb4_switch_set_port_with_delay(usb4_switch_t *sw,
+				    int port, int delay_s)
+{
+	if (usb4_switch_set_delay(sw, delay_s) &lt; 0)
+		return -1;
+	return usb4_switch_set_port(sw, port);
+}
+
+int usb4_switch_set_port_with_timeout(usb4_switch_t *sw,
+				      int port, int timeout_ms)
+{
+	if (usb4_switch_set_timeout(sw, timeout_ms) &lt; 0)
+		return -1;
+	return usb4_switch_set_port(sw, port);
+}
+
+bool usb4_switch_load_config(void)
+{
+	usb4_conf = igt_load_igtrc();
+	return usb4_conf != NULL;</pre>
    </blockquote>
    return usb4_conf;
    <blockquote type="cite" cite="mid:20250521055619.1961965-2-kunal1.joshi@intel.com">
      <pre wrap="" class="moz-quote-pre">
+}
+
+void usb4_switch_unload_config(void)
+{
+	if (usb4_conf) {
+		g_key_file_free(usb4_conf);
+		usb4_conf = NULL;
+	}
+}
+
+struct usb4_switch_port_info *
+usb4_switch_list_ports(size_t *out_count)
+{
+	gsize n_groups;
+
+	gchar **groups = g_key_file_get_groups(usb4_conf, &amp;n_groups);
+	struct usb4_switch_port_info *ports = NULL;
+	size_t count = 0;
+
+	for (gsize gi = 0; gi &lt; n_groups; gi++) {
+		const char *grp = groups[gi];
+		struct usb4_switch_port_info *p;
+		GError *err = NULL;
+		gchar **tokens = NULL;
+		char *raw = NULL;
+		size_t n = 0;
+
+		/* skip irrelevant sections */
+		if (g_strcmp0(grp, USB4_SWITCH_CFG_GROUP) == 0)
+			continue;
+		if (!g_str_has_prefix(grp, USB4_SWITCH_SECTION_PREF))
+			continue;
+
+		/* ---- allocate &amp; fill struct ---- */
+		ports = realloc(ports, sizeof(*ports) * (count + 1));
+		p     = &amp;ports[count];
+		memset(p, 0, sizeof(*p));
+
+		p-&gt;name = strdup(grp + strlen(USB4_SWITCH_SECTION_PREF));
+
+		p-&gt;port_id = g_key_file_get_integer(usb4_conf,
+						    grp, &quot;USB4SwitchPortID&quot;, NULL);
+		p-&gt;type    = g_key_file_get_string(usb4_conf,
+						    grp, &quot;Type&quot;, NULL);</pre>
    </blockquote>
    <p>Please fix the alignment.</p>
    Regards,<br>
    Karthik.B.S
    <blockquote type="cite" cite="mid:20250521055619.1961965-2-kunal1.joshi@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		p-&gt;displays = g_key_file_get_integer(usb4_conf,
+						     grp, &quot;Displays&quot;, NULL);
+
+		raw = g_key_file_get_string(usb4_conf, grp, &quot;EDIDs&quot;, &amp;err);
+		igt_assert_f(raw &amp;&amp; !err,
+			     &quot;Missing or invalid EDIDs in [%s]\n&quot;, grp);
+
+		tokens = g_strsplit(raw, &quot;,&quot;, 0);
+
+		/* trim + count */
+		for (char **t = tokens; *t; t++) {
+			char *s = g_strstrip(*t);
+
+			if (s[0] != '\0')
+				tokens[n++] = s;
+		}
+		tokens[n] = NULL;
+
+		p-&gt;edids = g_malloc0(sizeof(char *) * (n + 1));
+		for (size_t i = 0; i &lt; n; i++)
+			p-&gt;edids[i] = strdup(tokens[i]);
+		p-&gt;n_edids = n;
+
+		g_strfreev(tokens);
+		g_free(raw);
+
+		igt_assert_f(p-&gt;n_edids == p-&gt;displays,
+			     &quot;Config error in [%s]: Displays=%d, EDIDs=%u\n&quot;,
+			     grp, p-&gt;displays, p-&gt;n_edids);
+
+		count++;
+	}
+
+	g_strfreev(groups);
+	*out_count = count;
+	return ports;
+}
+
+void usb4_switch_free_port_info(struct usb4_switch_port_info *ports,
+				size_t count)
+{
+	if (!ports)
+		return;
+
+	for (size_t i = 0; i &lt; count; i++) {
+		free(ports[i].name);
+		free(ports[i].type);
+		g_strfreev(ports[i].edids);
+	}
+	free(ports);
+}
+
+bool usb4_switch_port_has_edid(int drm_fd,
+			       int port_id,
+			       const char *expected)
+{
+	drmModeRes *res  = NULL;   /* declare at block top (C90) */
+	bool found = false;
+
+	igt_info(&quot;Checking EDID serial on port %d: want %s\n&quot;,
+		 port_id, expected);
+
+	res = drmModeGetResources(drm_fd);
+	igt_assert(res);
+	igt_info(&quot;  %d connectors to scan\n&quot;, res-&gt;count_connectors);
+
+	for (int ci = 0; ci &lt; res-&gt;count_connectors; ci++) {
+		uint32_t conn_id;
+		drmModeConnector *conn;
+		uint64_t blob64 = 0;
+		uint32_t blob_id;
+		drmModePropertyBlobRes *blob;
+		struct edid *e;
+		char serial_hex[9];
+
+		conn_id = res-&gt;connectors[ci];
+		conn    = drmModeGetConnector(drm_fd, conn_id);
+		if (!conn) {
+			igt_warn(&quot;  connector %u: no connector data\n&quot;, conn_id);
+			continue;
+		}
+
+		if (conn-&gt;connection != DRM_MODE_CONNECTED) {
+			drmModeFreeConnector(conn);
+			continue;
+		}
+
+		if (!kmstest_get_property(drm_fd,
+					  conn-&gt;connector_id,
+					  DRM_MODE_OBJECT_CONNECTOR,
+					  &quot;EDID&quot;, NULL,
+					  &amp;blob64, NULL) ||
+		    blob64 == 0) {
+			igt_warn(&quot;  connector %u: no EDID blob\n&quot;, conn_id);
+			drmModeFreeConnector(conn);
+			continue;
+		}
+
+		blob_id = (uint32_t)blob64;
+		blob = drmModeGetPropertyBlob(drm_fd, blob_id);
+		igt_assert(blob &amp;&amp; blob-&gt;length &gt;= sizeof(struct edid));
+
+		e = (struct edid *)blob-&gt;data;
+		snprintf(serial_hex, sizeof(serial_hex),
+			 &quot;%02X%02X%02X%02X&quot;,
+			 e-&gt;serial[0], e-&gt;serial[1],
+			 e-&gt;serial[2], e-&gt;serial[3]);
+
+		igt_info(&quot;  connector %u → serial=%s\n&quot;,
+			 conn_id, serial_hex);
+
+		drmModeFreePropertyBlob(blob);
+		drmModeFreeConnector(conn);
+
+		if (strcmp(serial_hex, expected) == 0) {
+			igt_info(&quot;  → match on connector %u\n&quot;, conn_id);
+			found = true;
+			break;
+		}
+	}
+
+	drmModeFreeResources(res);
+	if (!found)
+		igt_info(&quot;No connector found with serial %s\n&quot;, expected);
+	return found;
+}
diff --git a/lib/igt_usb4_switch.h b/lib/igt_usb4_switch.h
new file mode 100644
index 000000000..8d9d265cc
--- /dev/null
+++ b/lib/igt_usb4_switch.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef IGT_USB4_SWITCH_H
+#define IGT_USB4_SWITCH_H
+
+#include &lt;stdbool.h&gt;
+#include &lt;stddef.h&gt;
+#include &lt;stdio.h&gt;
+#include &lt;string.h&gt;
+#include &lt;stdlib.h&gt;
+#include &lt;fcntl.h&gt;
+#include &lt;unistd.h&gt;
+#include &lt;termios.h&gt;
+#include &lt;sys/ioctl.h&gt;
+#include &lt;errno.h&gt;
+#include &lt;glib.h&gt;
+#include &quot;igt_core.h&quot;
+#include &lt;xf86drmMode.h&gt;
+#include &quot;igt_kms.h&quot;
+#include &quot;igt_edid.h&quot;
+
+#define CMD_BUF_SIZE   64
+#define RESP_BUF_SIZE 128
+#define USB4_SWITCH_CFG_GROUP     &quot;USB4Switch&quot;
+#define USB4_SWITCH_SECTION_PREF  &quot;USB4Switch:&quot;
+
+/**
+ * struct usb4_switch_port_info - describes one USB4-switch port from igtrc
+ * @name:       the logical name after the colon in the section header
+ * @port_id:    the numeric USB4SwitchPortID
+ * @type:       TBT or DP-ALT
+ * @displays:   how many displays to expect
+ * @edids:      array of EDID serial strings
+ * @n_edids:    number of entries in @edids (should == @displays)
+ */
+struct usb4_switch_port_info {
+	char *name;
+	int port_id;
+	char *type;
+	int displays;
+	char **edids;
+	int n_edids;
+};
+
+typedef struct {
+	int fd;
+	char devpath[64];
+} usb4_switch_t;
+
+int usb4_switch_open(usb4_switch_t *sw);
+void usb4_switch_close(usb4_switch_t *sw);
+int usb4_switch_version(usb4_switch_t *sw, char *out, size_t outlen);
+int usb4_switch_get_port(usb4_switch_t *sw);
+int usb4_switch_set_port(usb4_switch_t *sw, int port);
+int usb4_switch_get_default_port(usb4_switch_t *sw);
+int usb4_switch_set_default_port(usb4_switch_t *sw, int port);
+int usb4_switch_set_delay(usb4_switch_t *sw, int seconds);
+int usb4_switch_set_timeout(usb4_switch_t *sw, int ms);
+int usb4_switch_set_superspeed(usb4_switch_t *sw, bool enable);
+int usb4_switch_put_data(usb4_switch_t *sw, int index, int value);
+int usb4_switch_get_data(usb4_switch_t *sw, int index);
+int usb4_switch_status(usb4_switch_t *sw, char *out, size_t outlen);
+int usb4_switch_reset(usb4_switch_t *sw);
+int usb4_switch_set_port_with_delay(usb4_switch_t *sw, int port, int delay_s);
+int usb4_switch_set_port_with_timeout(usb4_switch_t *sw, int port, int timeout_ms);
+bool usb4_switch_load_config(void);
+void usb4_switch_unload_config(void);
+bool usb4_switch_port_has_edid(int drm_fd,
+			       int port_id,
+			       const char *expected_edid);
+struct usb4_switch_port_info *
+usb4_switch_list_ports(size_t *out_count);
+void usb4_switch_free_port_info(struct usb4_switch_port_info *ports,
+				size_t count);
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 6f3a1150c..c2892eaab 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -48,6 +48,7 @@ lib_sources = [
 	'igt_taints.c',
 	'igt_thread.c',
 	'igt_types.c',
+        'igt_usb4_switch.c',
 	'igt_vec.c',
 	'igt_vgem.c',
 	'igt_x86.c',
</pre>
    </blockquote>
  </body>
</html>

--------------s1BdrksrjCE6qS83fTSfLqEM--
