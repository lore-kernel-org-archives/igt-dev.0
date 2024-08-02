Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEEDC3DA49
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 09:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE91A10E9C4;
	Fri,  2 Aug 2024 09:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChY3R+W/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB0B10E9C4
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Aug 2024 09:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722590006; x=1754126006;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lg6jITzdF5eFgvh4n7Cafcb8vucU+ot+N/FxvonyKgM=;
 b=ChY3R+W/R43kReDuc3VYQ38lhKf1Q9WmxHXg5L6iyWGGmbuBhMK5i1vC
 mQq4s0x0157zwEAU6v+Ah0ilURk+HJYEo6qmrr9J3ro1gNG35aYFX+3dc
 rAL0pxFIyFnq8inV1c3Km+2SlPYE6MvU4ZxFlk4knqjUiP56NKbbZH1To
 I9FwQDn1H3BGVlG/wQxR8DJvPfj1cbFcRAiQP9sb4Dkpq1dxYqOMX1N3O
 z846ee3dgC8OK0qzAuGKI8Hpj4h9SfnTvpMiR5nLCqBGYSVo3BzQkOT69
 ZYz946NzB3XN8M/Ucm3cmIC99l0Tm5/4/g8ng2L490JvpFR5U2cnp8fCs Q==;
X-CSE-ConnectionGUID: MHmODP/6QpG4QetD8hP6lg==
X-CSE-MsgGUID: +dIe/7LfSC2oBO1iFMhjvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31225305"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="31225305"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 02:13:25 -0700
X-CSE-ConnectionGUID: qQV+1kFcRMabRCiSU5KYhQ==
X-CSE-MsgGUID: UxmoqG6/RWebHvirICpang==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="55940206"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 02:13:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 02:13:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 02:13:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 02:13:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBO57nM3P61ei2W94Q91onvj+MFSBdVIusZMO3m5YNuybrtddqjshFE+ExiWNsAgC22dVtkIKuBeUZGYrrvMVh5Y04EgZIRfk82KMSuDwgA+1OXqOlDI7jpH77mJ9I+Xi45iZZswYNq4CFjgBrJ4e13IAOXcTdohBjfpKwTokj0d/LYlwjxY6N0hbo4dRffjnQLCLqqcH/nam0iSQo3/Zukf5uxsa2QVIem8wDrczQ8r2LFsIGUwl3LELyTMrvt/nBNRJdZPxaXh/MUAEUDveawZEEJPBgq91tuMjzEyW5B8EcR6taIbx/KcM8qX1iVW4XbnySkRgxnmsHnetbdbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2fBhxOncrbpAXWlzQLQX+KPN6OEXUTBLwQIdME+3p8=;
 b=zTcGxj81oSq6KaRPpXUPSWgLv4pYnQ0Itub+wt4wSQaWS6AUtQDrXs0iIBPBW2A2zPBAV4W3+swlj9/7COBVz8PGNf9XCdAXlc6qrYrq59KOoIyPvnNP4Z6T48RPeCE3u7FeYaDZZYdX33kMEfpYLeH3tJjMaN8qJUn1dWkzsY7puOFAPqLXb9S1Vs/Yuq7MD/XzSOfukjFNTQWfCMpM5rn3rkmDr+vnzxMpw0B7FZJJbTKzcj+HHdK8TTszr/Chf3Dt4jz9BzjIlwGuE9tCw7q1AZH6PnfRosI5FP664I2BpO43w7t1fUisc0tl53hR9BTN2zum4XhXcHMNR5llZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by LV2PR11MB6000.namprd11.prod.outlook.com (2603:10b6:408:17c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 09:13:22 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%4]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 09:13:21 +0000
Date: Fri, 2 Aug 2024 14:43:09 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/xe_create: Remove the elapsed time validation
Message-ID: <ZqyjJUUV_dI-n2jm@bvivekan-mobl2>
References: <20240801123312.1539769-1-balasubramani.vivekanandan@intel.com>
 <20240802051206.7qkzsh7pdfbc56zl@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240802051206.7qkzsh7pdfbc56zl@zkempczy-mobl2>
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|LV2PR11MB6000:EE_
X-MS-Office365-Filtering-Correlation-Id: 600c9823-3f2c-4b35-e6e4-08dcb2d35ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnVXZzZzTjRjL09hR3pBSnBlV0JyaFFiRG9VRG0wUVZJTm5KZHVVQlhnSzFN?=
 =?utf-8?B?cmlOUVZaWWVQRHJIaTBlV29sVGFNbkdXQVdRUkloQnd6cUNpWEZIVmRoRkVD?=
 =?utf-8?B?aXRYTUhZaDF1N1lWMTl1Rjl5VStsdSsySEhwazEwQUowTCtybkVNK3lJQ1c0?=
 =?utf-8?B?Y2diNEFCc0dJNkJQQXRZSGdPQTBzUEdtdVlLZWNFWWdSeThyYlkwUkFUWXEz?=
 =?utf-8?B?Yk9FTEJIdVE4YUVlMmsxNkdFR3BNWk5mQ05TMVA5L3lJbmN3R2M5QmQyalE5?=
 =?utf-8?B?SWJKdnUvVnJwWFBoWG1USGJuRklielZHWDF4alVMNElLS1ZKRk43dFVFcVlZ?=
 =?utf-8?B?MWN1MndGTFdsOUdOMTFaMGpzTnlWVG5JT25vWFEzb01wYjIwMSs2VkExK2JT?=
 =?utf-8?B?OEdoRjRhc3ZVdHBTaWh2S2FuU2VuY1JwS1hqbXQranhlTTM1MVFwZk1ieHlZ?=
 =?utf-8?B?bDk2KzRncFJ0Q29rUlNQQm5OUHIwZ1ZEbW9EbVFsL1ZLNW5hMzlPSUx4RVRz?=
 =?utf-8?B?RE9INVgyZ2pCWDN4aHNDVTBSd2lFYkpSUSszZ0Y0WnhjTzdNM0tyUDJhUWNN?=
 =?utf-8?B?am4ySlEvT1VVUlVoVFEwaU9UbzN5Q1NKYi9lekdnTWswWkJZZ25iMFZQVVk3?=
 =?utf-8?B?a1VnR01sOThXVm9XMGFubUc3bUg0R3hpZmp2WjJwUmN4b3N2ZEN4cDB5RWdh?=
 =?utf-8?B?QzJCU2JnZUllcEZGekkxdmlhTEI4MkVkZGRMZWoyV0J1Q3VxcDY1WHJvUVRk?=
 =?utf-8?B?SFJkS3E3U1ltc3MrZTZSdDU5Q1FRQnFxbFl1WFNYcEtXS2cxUHR1UUFORUYv?=
 =?utf-8?B?YlUzSVV1M1BmR1hWUHJaeERMb20yZEdNWWE0VnBFaUUxOFphQU5iZVRDYjlr?=
 =?utf-8?B?WG9YQUdDQW5UdHlpN0d6NTJQbDlOb1NVZkltMEFoSCs2SDAxdnZTWmpYL3FI?=
 =?utf-8?B?NHJKZTJXTDJKTm4vOFVkd3BMNW9QWU1RNCtYTVhubGgzdWp0a3NaZTJzY0cr?=
 =?utf-8?B?OW5lb2lBdDJUYkZSUFNtWURYcXZSeXE4VDE2bjh6eEIvd2IzMkRrSWFRN3R3?=
 =?utf-8?B?N2Zvcm11d2R3c24wMXNuWEpTK3hzb3h3K1RLVkprelBaUmhac2lmaE13bWJl?=
 =?utf-8?B?TDh3NzNmMGsyQU5CQkRvVndhRVlKajJEdmF1R0dwYU1jMmxoeTlhdXl0eHhy?=
 =?utf-8?B?VDF1cGs2SkFuajU1cjllbnlaekNIMkZVeEpaV0dVQmVoaE1RaUpJUHV2MlpS?=
 =?utf-8?B?UksyMHZjai85S21zR09meDh1NXlXRVhiTXFhU01Za3dEMTUrYlFHYkJvRzVl?=
 =?utf-8?B?dlp5RDc2ckRrNWQ2dHFPZnZlR0QxZmtJQzlVVEUzSVQ0ZEswK1hjRk00emhl?=
 =?utf-8?B?Y2ZXbVpsMmIvMUplZHMzaTN6K1NYRnBwYWNpeVVHMitWcEdRY0E2UlRCRkFD?=
 =?utf-8?B?ckFBQzBKZldZNTI1Y1lpQ2dvd2E4SmZxTTk1SHpCeURDajFKK0xuaVgrSzls?=
 =?utf-8?B?YXQ5ak03elVzelZHVG5qM01qejNGS3hYMlFleG1FelM0S0wyNnJQRE1jWTBB?=
 =?utf-8?B?enFkWUVxOUZsNGNmZ2cvY1d3alVVK1dVa2NuMWR0cmxoUklHSVlyOThUNWky?=
 =?utf-8?B?RFhoeHNEMUhLTW5jNjBZdUs5TGM2TUNBRWpIT0wyRmZ1alVhQzhLTGFkQkEw?=
 =?utf-8?B?T3ZRV1c3TUptWlQvVHBqNHRCaTRmSzdvaGV0RTBJZWlFRnFvemJiNFl2b2xE?=
 =?utf-8?B?U2w4M1piSHYwbUd5NitkQmZkWWlzam5vTXNLOUg5SVFlT09hZldJTldLUXNY?=
 =?utf-8?B?TU1nR0Y1MHdIR0duTjhVdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEhWZ1libWtjK3RtemVUK1lGcTdQQzJpeDBZTTlTSHY3TlRxOWd4MDlnMlU4?=
 =?utf-8?B?WXN0MzkraW1hNlZuUGlDMDFKZG5EMW5LOFYyZzlxMEQ2amRvWlduSkJUQnZ3?=
 =?utf-8?B?clY0TngyVFF2dmc0b3lzTVZJSG1LQUNvTjRrUGNLTzJDSEloa05pSUtaOG9M?=
 =?utf-8?B?d2g3Q2dNbTdpWGhoRVF5cVVFN3hoSWM5NFBNcnMvV0g4dnVBMTlzbDRrbWdx?=
 =?utf-8?B?azYrTnAyd0hzQkZCTHFObk9oZjFaaUNnYXIxQUE4VTZXR1RmYU1TNWtWeHY3?=
 =?utf-8?B?bXFuT0FPRVR2bzluK0w3UTh0R0dENjlESTMrUFRVVUZBYTRScmJQVXphMVlU?=
 =?utf-8?B?RUhXdndhTks3NXoxa0FVSnlnbDBUK3FDSU5rdjlWZ3pnNStjZWZ6WUNERURF?=
 =?utf-8?B?K1lsWEx6MTh1NG81bnVZdjVGamI3NXN2TThKWWp3WEdtZG5YbWI5M095MjVl?=
 =?utf-8?B?Y0lIeGRkVlFad1VZWjlRalR5VlNEWEhId05HWDdpMWMvbEFTRUNmMHl3Vm5Q?=
 =?utf-8?B?ejZFbldwRktEekRGdjBxZ096VDM3dUlvR3hibUNZeU44a0Myc1VSdld6YlBk?=
 =?utf-8?B?WDBDVGF4WWIwTGxBR2d3bEhUK0FzYUNWTmRBSytxQ01IUU1XeEllNkxFMjc2?=
 =?utf-8?B?ck11bC85SFhvNVE3eDh5T0dLSnNub3hibm1zVkE2c2xCUDJ4SE1PdThLYXhi?=
 =?utf-8?B?dHA1NElWSFh5NUxBOUgrMjdwWTlhbDJqSmptampWeEx5clpWUGlBc2FqNkFQ?=
 =?utf-8?B?dlczRXlmTy9Hdm05VURmWkVzaFlrZktWR2NGL2ltaVQrazI5cy9TeXZiOFRD?=
 =?utf-8?B?bDQxUFhjRUpNZ1AzQnpWTEpxdnIrTGFDeU9rZE1hRUM3UzFaU3BBcVhJdzF4?=
 =?utf-8?B?U3NQa2ErRHRON0I0ZGhKVTdmZnFyMUhha2srZ3U2ZG45OXVNc2s2c1R1akdY?=
 =?utf-8?B?ZHVEUS96WTMrOUgxT1JUUCtWYnhBYmFVQUJ0WkhpVGRQT1plMnV2U0RwaHRJ?=
 =?utf-8?B?TXEzb21yaXdmRWd6MkFVMmEvUTEySjhHZmtseDdaNkc3ZUE1RnlNcEFWa1gx?=
 =?utf-8?B?d0c2SDRtS3VBUkRseDRrQVptTkhIRzJtTmEvUUNQUGJ2RVk2azJWWlZpcC9H?=
 =?utf-8?B?QkY0d1FoNWFvanF4V0lNZnhUL1d3YW5FcWRZT3BLZCtLTWVuYzZPS2YzTngv?=
 =?utf-8?B?U1pOa0dMR3pqMjB5Y3BIZXpHeDZ3VHpqTUF1NThEZklvbkVrKzh0TDhHdTRm?=
 =?utf-8?B?NjFUdlJPUzJwQ0o4ampOQW9uVEFPSjlITExvRUEwYS85TDVkZDloanl3NVpI?=
 =?utf-8?B?d2ltM2dBZng5bkRlRDJBZDQvV1Z1VlVObmJOd3ovS1lycUpDTkpsVEJLUWFE?=
 =?utf-8?B?eGlkcUFZb0JlMDQ0bWdqN3hDb0ZLSCtSSS9hMUU4YTU1d3ZSb01zMXhvc2sr?=
 =?utf-8?B?M0dlU2l0blZRWTRvWFVqOUsyS3BUd01mTjIvRUVNcEV3SkFTckJ2eTdmeEhD?=
 =?utf-8?B?TGVzVFlBTXpQaDBocXFvYnFrUDFCTEZxY3BRYml0UXUyTm1LdDdGQ21YMEtN?=
 =?utf-8?B?bGplV3Z2T3c1bTZzTUlET0tNMTI2VERjbmRQbzhxZHNRMSsycEdtdHBjTktM?=
 =?utf-8?B?V08ydTZyd1F5bDhtSnJaM3RFcmJ0MitVMHVJU3VQb0Q2L0ZHMW9zcVFHaTlP?=
 =?utf-8?B?Z0V6cnFtYm9aemI1STRBb3hDWUxiUU53OUJRbXhTTFRGSVJ4bXlqN09NUTlL?=
 =?utf-8?B?ZjJKSnpaY09waTYrY1ZHOTE0dENvUDVZRWdiYjVhR3pKdVdQOHlVOTgrbXJr?=
 =?utf-8?B?d3NJbjc5Wkh5T3BmS08yQkJWVDR4UmNLRi9QWHVjU1NWVlRzQWkyVjI3ZUtP?=
 =?utf-8?B?NGNacjNHWnhVYjRhTFFRalJ0a0VRd2NyVUNVcy9lcjhIbU5uR1BwbDNZUmVV?=
 =?utf-8?B?ODlIY1J1Zks5UWdESU45VWF1eWM1S1JCMEZ5WWZmV3ZITU1LWGpYS1U1YU9G?=
 =?utf-8?B?VENTcDF5NnlhbjB3TjBValB5YjZZWGxaYVdTSWlZZlZkNHBuYld2RGlQMzhZ?=
 =?utf-8?B?MzMzSENnRFJIbmx2M1paRXBmWDQxNE1Rc1NCOStkVEgxbllPcUhXRzlCY004?=
 =?utf-8?B?UGFpRE1ZVnZHZ2ZySlpSbFp2RGU2N29lYXVvaGFlc2NEZDJRN3NpZUM2Mlhy?=
 =?utf-8?Q?5Oqw+5uaPU8q8I4MJh8EBAA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 600c9823-3f2c-4b35-e6e4-08dcb2d35ae8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 09:13:21.4227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzDg9jONLPG/MpRv0xUNzF3GVLf1xOFywOSPHQEEFr4LGkdrqY0moEVF3DxQadO50G37yN4HhRfV453ZzqTsxl/r1QYyNIgjyMuWjbeHwHjV90+Z+k63vBcU2H0DvBiL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6000
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

On 02.08.2024 07:12, Zbigniew Kempczyński wrote:
> On Thu, Aug 01, 2024 at 06:03:12PM +0530, Balasubramani Vivekanandan wrote:
> > Time check used is incorrect. Time limit used for validation is
> > arbitrarily chosen as 5 seconds with no real resoning behind it.
> > With different execution environments taking different execution times,
> > limit can't be fixed and leads to unnecessary hacks.
> > So remove this time check completely.
> 
> MAXTIME picked in the past was chosen as a fraction of created/destroyed
> exec queues in some (safe) time period. Up to relatively small number
> of exec queues (up to 512) there was no issue observed. But with larger
> number of exec queues we noticed kernel lockup (iirc guc related).

Time limit of 5 seconds is not fitting all platforms and execution
environments. I would like to avoid hacks to workaround those.
We can validate the test case by ensuring there were no GPU hangs or wait
timeouts instead of checking the time taken.
Measuring the time is more a performance validation rather than
functionality validation. Better to isolate performance tests from
functionality tests.

> 
> I think keeping some time regime for those operations is good idea, we
> may notice performance / stability drop if something unexpected will
> happen in kmd/guc. MAXTIME/MAXEXECQUEUES were chosen as safe values
> which should be easily handled. If you're removing this check you may
> delete subtest as well.

Keeping subtest without time check will ensure the use case works fine
without causing GPU hangs, kernel lockups or even dmesg warnings.

Regards,
Bala

> 
> --
> Zbigniew
> 
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >  tests/intel/xe_create.c | 17 +----------------
> >  1 file changed, 1 insertion(+), 16 deletions(-)
> > 
> > diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> > index 76ffdcef2..80de07789 100644
> > --- a/tests/intel/xe_create.c
> > +++ b/tests/intel/xe_create.c
> > @@ -157,7 +157,6 @@ enum vm_count {
> >  };
> >  
> >  #define MAXEXECQUEUES 2048
> > -#define MAXTIME 5
> >  
> >  /**
> >   * SUBTEST: create-execqueues-%s
> > @@ -175,10 +174,8 @@ enum vm_count {
> >  static void create_execqueues(int fd, enum exec_queue_destroy ed,
> >  			      enum vm_count vc)
> >  {
> > -	struct timespec tv = { };
> >  	uint32_t num_engines, exec_queues_per_process, vm;
> > -	int nproc = sysconf(_SC_NPROCESSORS_ONLN), seconds;
> > -	int real_timeout = MAXTIME * (vc == SHARED ? 4 : 1);
> > +	int nproc = sysconf(_SC_NPROCESSORS_ONLN);
> >  
> >  	if (vc == SHARED) {
> >  		fd = drm_reopen_driver(fd);
> > @@ -189,8 +186,6 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
> >  	exec_queues_per_process = max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
> >  	igt_debug("nproc: %u, exec_queues per process: %u\n", nproc, exec_queues_per_process);
> >  
> > -	igt_nsec_elapsed(&tv);
> > -
> >  	igt_fork(n, nproc) {
> >  		struct drm_xe_engine *engine;
> >  		uint32_t exec_queue, exec_queues[exec_queues_per_process];
> > @@ -236,16 +231,6 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
> >  		xe_vm_destroy(fd, vm);
> >  		drm_close_driver(fd);
> >  	}
> > -
> > -	seconds = igt_seconds_elapsed(&tv);
> > -	if (seconds > real_timeout) {
> > -		if (igt_run_in_simulation())
> > -			igt_info("Creating %d exec_queues took too long: %d [limit: %d] seconds\n",
> > -				 MAXEXECQUEUES, seconds, real_timeout);
> > -		else
> > -			igt_assert_f(false, "Creating %d exec_queues took too long: %d [limit: %d] seconds\n",
> > -				     MAXEXECQUEUES, seconds, real_timeout);
> > -	}
> >  }
> >  
> >  /**
> > -- 
> > 2.34.1
> > 
