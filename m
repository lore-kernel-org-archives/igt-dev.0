Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3681C02190
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 07:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759F710E296;
	Thu, 30 Jan 2025 07:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQkCRceA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0515C10E296
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 07:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738220785; x=1769756785;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5nMOLsNM8zA9FVIy/Un0zZkCgfCLPooBBc3UbiXIMSE=;
 b=AQkCRceA70RMAdvxvcDZ9IJ2L/irNlfuU7IWGCiQB6WO963PxgRle9uF
 W+BtbbZ1PamOwk/M8GtMRnRHhhQuUunVPAkACsTjhZuTBxDLHBwy5iVti
 ssS/wPkPHWHfI7AWh98n0iN4gUrM7dBBHpESfFVf0yx/6vr2gS5OvVVKZ
 hlKhgF23h3L8mO8NL44wT8Jk5s6jfN1C4tF9+enkb1/y0s8dOcmoyg/il
 RIMYxgha5GUkHAKOMrLwuYLz/MrzkuUyDG2xkg8MZXCGwOacA2GjpF1IK
 wEcktShuGEs82dsZY46Q5Ovsqul2lAePd7FGds286N03QIIHyYH0MSDdU w==;
X-CSE-ConnectionGUID: PsguhadoTBe+w3ewhfnCZg==
X-CSE-MsgGUID: yy+S4y2GSRmLY6CXoPqxOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="42508453"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="42508453"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 23:06:25 -0800
X-CSE-ConnectionGUID: NvmoQ4k0Ray3SeWiSgrJhQ==
X-CSE-MsgGUID: kbcZj4QFSPCYG542VUd/kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132518311"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 23:06:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 23:06:22 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 23:06:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 23:06:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZlP9z1NKXqyPXioJVHqcmxcUjsv0n8reGenH/J+XhNX+SU56qpCk9WozZwbtvJeVjrr2AhcLfygAMOX7eFSX7JpQt2Gvuml3TE5ZhXaNVWJGjfq2TfeF8SZ1rCCLnmBjNZUZMScUgfArxu3VzMN1sQrCp8rIL6s0MzPxKxcoNFqQkF4sMQgOJcvSDEzlZuJWo/Jkdi1sHELmJoqIWmCujHRBmTJysCNBuiIC/I/Dof5uveubwZZ869lsNCbl8fuRgo7FaooHhVU4U7Sy+pfgaG2Ix53DDfBsVQd2jiLDdP5U8vmJqh0ID+hB5JPUxjGui/jkZdlaRaAx9VqEQ7YCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsC/AmT1IPUDWkNJ291Ry/yCJKDGYA/sYvb+c+Azp0M=;
 b=qKeSxgUEoUMNYmFHIz4wCCTp10sfpSygxUQP34gcWdIkJXL0mDhOeM85cPOSuqvEGP8thyuXToJUTPUiDte4H34dmDxgkHhY+OF7PhxVanyEF9pp/NmWXEOBbSgvuKTCFeryqzRJUSuB9bBXkxfOv/rB/uhpgbl/92QlPzXAzc0RBf/ONSSNZOruiMZH0FEZEJdmHhppk46PURJ3o/f4eBxPv2z4Vh8xjlGwAcap3DXa5oXAMy0R07pE/wpZwsz1NJWTXl4NxALlnlRof/j4pQSpZIhaoMhM17KBsNJmBYuX+zduPtAJFYdhmp+fCm3PWkrbfzGNUp99drtibdK9AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by BN9PR11MB5305.namprd11.prod.outlook.com (2603:10b6:408:136::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Thu, 30 Jan
 2025 07:06:21 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 07:06:21 +0000
Message-ID: <c796a151-e747-42e6-ac6c-42d92ecf8342@intel.com>
Date: Thu, 30 Jan 2025 12:36:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/intel/kms_dirtyfb: Skip FBC testing on BMG
 platform
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250103104335.61694-1-mohammed.thasleem@intel.com>
 <20250120071938.5358-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250120071938.5358-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::20) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|BN9PR11MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f39a758-6edc-4790-f937-08dd40fc9968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3NSejF1MTZWNCt6UXBjRTBkRUxQdEdqR1RWenVRM3BlaG5lWDliYVRsellM?=
 =?utf-8?B?cHNHU2I5ak9nd0I3WFdvQU1XcGJWa0xwZWlSaTdrYzdZSlRlRnBoZWdzSXpj?=
 =?utf-8?B?RkZFbXRuNUY0RFFONFJwcmlMdk4rem50MlN1VmE5RmJ5dDlScis1VUErTVBu?=
 =?utf-8?B?ZjRIcjlIV0VpSndCWjR0UnlaVUdycHVPUmthMnVDMHFVRlhTZHBFdWRFTVQ2?=
 =?utf-8?B?YWdWQ3pIdS85UWF3Z3BvVm9XOWR0cHdVc2NXNVkxeVBjaTI4d2wwUUdPczgx?=
 =?utf-8?B?L21XN21yV1N5K01OMEZsZ2NPRkw3STNvRXkxaXllckpoeUtUTndtb1NsWVI1?=
 =?utf-8?B?RldzYXlQQWlZWVpHTWJtOTNxRk44UHRacVdCZTFNb2FUV3lpZzIvUGFlNkli?=
 =?utf-8?B?blRTZXpsOXVCU0t0Y3lDNWRjYU1DeWtGTE1oN2ZwdHNkd0tibDVpK3ZZRDUr?=
 =?utf-8?B?UlNRVFRFL1U3SFQ2cXdzZUpvYnFybGE3S2l3d1NVbmZpbHVWTml5amovMGoy?=
 =?utf-8?B?RTRhSUtBcU15VW0vMUxLdi9jd1ZtczVwTzAzOTFmdjJobS9lWXJnV21iWWtW?=
 =?utf-8?B?ODB2M0dhbGlUWURzUys4VXBkZDI1cURYdzM5VTU1cFZHZ2U4OWRmVE5hR29Z?=
 =?utf-8?B?Z2dBWmxhL0FNaWdQT0U2Y2VrMEdPR0N0aDkrRFErTzRQMVBDQjdwTFgveDI1?=
 =?utf-8?B?MDBEY2QxSVF4U3k4QWE3UURaWjhFUVV1WnNPUEdCY2RwT1pIU0VnemZMQyt1?=
 =?utf-8?B?RXN5eUNOMHVnbFVLUG1icE56OExlUC84YlV1eDFOa2k2MnhmOXlvSHRWM1l3?=
 =?utf-8?B?OXJOSHhWc3hOaWd4NzV0NEJsNzV6NGpMcStlRVV4RzFlaDc3MVprK1VrMWhP?=
 =?utf-8?B?YzB6SmJjenQvTnQ2d282cUJ1eVJkNjNlVzZPU3Y1WGJHUkQxZVRrQ2NrOFJx?=
 =?utf-8?B?YlJUN2JwemcyQTF4NHovS0swNFFRZ2pYS3RsTk92anRGcnFybUZNaHFZMVU3?=
 =?utf-8?B?cVdXM0tSZitrL2RmK2t3Qmc5cEtBemEwQ3V0WGVpUkdLN3o5aVpVaW92TUFT?=
 =?utf-8?B?K3dyaVYvalpoOVNBa1VKSWRJL3FRTXk3MUlIcEVIOTUvbWppUUxFUy9EaUNl?=
 =?utf-8?B?WFdlMWdoNStYQ2R3aXphUjE1R3JEUjJpSWFBblYxZmovcEFwRTRpRkVGV3VS?=
 =?utf-8?B?VHN2VE5FdHF3dUFFampQSjQxcCsrcVhMY0JBdS8xWS8vZTE3MXlSQzhSV2xW?=
 =?utf-8?B?NVRBWjg0VFlUL3ovK2pyWWpFY082RkdvY2cyZFpyem1vREtYSVFTMjdNY0Vt?=
 =?utf-8?B?NjkzaE5oUWw3NmxIMFdkMWpOZHZ3USszWDBOU0Q3V3pnZEo2OXpqSjlReEZj?=
 =?utf-8?B?M2xEcHZtakhpUkNBSXF5OU5DTHVsYXcvejBzTGlsWVNkU0JVdlE5ZVlTbDJk?=
 =?utf-8?B?bTNvdmxOQWxvbk5rb05WajJXNW9ZdzBwQlpJVjdIZmFhL0kvVlorWVNrcGl4?=
 =?utf-8?B?Z3daejZhcnlWVzRjRXl0QkdNZ215ZWw4V2FCRHVYVWlTcTFNbU5MVkQyRnRR?=
 =?utf-8?B?cytMUFRZajdLb2JGeU41aG5Fdnh2NlVJT2tVOWF2elRra1hnNTEyZDYwSlFm?=
 =?utf-8?B?b3hjcWUzeHYyN1M2aDNtVGZFSG5xU255ZUJ4c20yRzR0WS83Wmc2dGtwYWFE?=
 =?utf-8?B?WnZEYVQ2aE1xaVRKZlpCU1liTTR4MWI5YjMyTDl0alRDUWdqTlBwME1NU1Fz?=
 =?utf-8?B?dGNxOW5DK3QyWVkwTW1aeVpjWDRIVUpWdVVDa3VKUnZoU2JuS0FCNWNUeUxF?=
 =?utf-8?B?VXBMb0RkZytMSXc0YitLa2EyMXFEQVZ3MEF2Y25MeWRieFNza0gxQUdrb0V0?=
 =?utf-8?Q?GnmQOmDg9XI6/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmdJNDE5M3VLYkd3Z2gyVlhQVjdtanRnTHlxcXNxcGwxenJjV2QzRkh4OHNV?=
 =?utf-8?B?VE1GYk4rWDcrUWNMM2FFN1FkN2pLYmFnTFRpdjJGRi8yTzF5NE1naTY3amJy?=
 =?utf-8?B?YTNZRzJKUjFrSklRYVJHc0YyZzJ4KzYreVhGN2ZsRkpDUjZhbFFKZy9RV3hC?=
 =?utf-8?B?VE9tS2ZacUdzemx6ekZaM3h0ckRFejFKQ05sV3FHaGN4bGMyZEQwMFRZMDVN?=
 =?utf-8?B?dG1EZUNtQWJZZUx0SzJHTVJpeXlpdzhFTk9jSVQ1SUZlQ0loaHNua21wN0FD?=
 =?utf-8?B?QTUxL0EyaElSY2NWZm0rLzhRc1JISkZJZi9Qa3FqZ1J2d0w3ZGtCdEtvTTZS?=
 =?utf-8?B?OXRielJNY1UwYnhEdnlQMS8rL0VaczFqcE1WK2toOUhkbEpiU3Vla3VJajQw?=
 =?utf-8?B?VTR1aG1kbWxMNW1IaktHNkxWaDFxVUtrTmI5eXRBWlNPVmNIM1JTci9EOGFI?=
 =?utf-8?B?V1FYT3Z6K2x5clp0YnJ4Tm1WU0FHSGpsV3ZueVFtcE9TMEs1QTZKOVBGcWpq?=
 =?utf-8?B?ZExIcTJpODdCYm5ObkV0bjdlSmVEaGUrVjNVREx0MlZBcjhoU2hma2RvWG5l?=
 =?utf-8?B?RTYxOXBkNm1ZRHQyRlFqR2UxcGZ2YlVJSkQ0Z1IvMzNLdDhuWFlQNER5akMw?=
 =?utf-8?B?ZHJ4bitzUWt2NlFoL1hhTytoV0hJWjVLbXgwZ2NkWENocERMaG1MNXVFS1N5?=
 =?utf-8?B?cXo2YlZnTEU1UlhjdVNIWnA1em9hZUc3NVIrdXdFdEtzZzZNVHR2OFhodWdh?=
 =?utf-8?B?eWZOWDBvcGZpc3NsVXBXeEh2bEp1aTBuNmtwWVJqc3dKdkVHaGFzL2swSTh4?=
 =?utf-8?B?UFVpbVFZMDNMOTNXMnJHcWFMdXIwaFQxOGVBVzVkcko1ZWpUUzBCK0VQcWJz?=
 =?utf-8?B?SEp1VHlHLzBKUE5CS2tYQ3FmeDdPS2tpUjZjL2dkZHhpK3VxY0NrNkFHRDRE?=
 =?utf-8?B?bWxaUWxldFQ3VEZZOHVVK3RJZ2V2N1JHR0pBZm14eUJUS3dIbERtMCtLVlpX?=
 =?utf-8?B?TzloeENzWlVpSjBMTHg2dkFZcWppMDh5UjRBRUdPOXVwK2swUHdyRlRHNkwy?=
 =?utf-8?B?QWp2L0t3bkkrbnVkVWhuV3NUY21DYkM0Ky9lVm5Ma2x5ei9ndjE4VEp3QUtS?=
 =?utf-8?B?b0FHM0d5S3RuUXk3bmtyZHE1cjRzVzV1djVKQTc1MHlnOU9HblhGYVVTdEFT?=
 =?utf-8?B?RW1pQ2gvbm93WnowQkQrYzdac3MvTHRjV2V6eitVTVdKNERRUmpzTldHZ3BN?=
 =?utf-8?B?d2tVaTV2a3l2bXZyM09QS09ZcEE0cUdWRkE2YXc5bmpTRm0rbTVHZUtVQ3JI?=
 =?utf-8?B?T0JXSEdzWnZOV0l0MlZTQmNHdW9qVWorellGVnYzME92VWdldDF5UG1qbEVG?=
 =?utf-8?B?L2NzSExIdEdNdmZFNSt4M0dPVEIyaW5sTjF3cHVHSkp3K2w2OGhINjRmMzZD?=
 =?utf-8?B?c0loYW96WFNqSW0vWmlWN1dFQ2VlK2FZZUtUMVVQMFdQSmtZcnl0a1J1T3Bi?=
 =?utf-8?B?a3h0Y2VJM3VrZDJKOFF4SlZMSGFsbFJEKzhNSDZpbzlWOXFNdlgwMDRwNXdL?=
 =?utf-8?B?R04zSVEzTUFMcEtkNFJsUnZ4YlBNZEdaL0Rla0RONDhyZ2NhREFqVldXMjdM?=
 =?utf-8?B?TVJhZnQ5cjNZU2grL3RaOHIvMGdsYjB1OWxrUjY1Tnk4d2tUWXNac0t4RjB1?=
 =?utf-8?B?VXRneWszTGk5T3BqcXUwM1F1WXdCbVZGbUNVTElDeTlkeHBOd29Ma1g2RW5Z?=
 =?utf-8?B?WEg0UlpBbHRaUzAyOE1lOC9UaGZuYW1yRXREM2hXNkZyK1JTY2ltdHU2eGZY?=
 =?utf-8?B?ajljbGk3YkYvTWFiN0dOK2hqelV6MjNaZ3pSYlVvL0ZWRVF3ZmRNazgremNJ?=
 =?utf-8?B?amo1dHUwTmU1dlppRkJMbE5xVzVWL251S2M1R1R0cm1SUjJZSGN5WEMwSTFq?=
 =?utf-8?B?cVBMQy8wOUlacVhtZUg5S3NJT2RFQ3MveVUzZko5NGEzK29lV2RuT1FNdFJj?=
 =?utf-8?B?aXIrR1plT3J6Y2JkaGMyblNDNDNJUHYrWXNJalI2QWVzQTMrNWMwVU5KUUpo?=
 =?utf-8?B?Rzh5UmN0VWZ5T1NBQkRGb0h0emFoSURiTmp0SFR2cjhXM2J2WFZDa05ma3VT?=
 =?utf-8?B?VlNyd0JXVFFRNHo5YlN2c0hqKzZib1g1Q09hVmRBSjFMbklHaWpIL3N0UDZE?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f39a758-6edc-4790-f937-08dd40fc9968
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 07:06:20.9449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAo7WL99Eu6OwyJfsRkQrIyFIo0u9uajSFmu7xVqL5FVlHReNMUC89EL8ifOEmQCpySIpafWsGFtjeUDN1fOHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5305
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 20-01-2025 12:49 pm, Mohammed Thasleem wrote:
> FBC test isn't supported on bmg, skip the test on this platform.
>
> v2: Add workaround id: Wa_16023588340. (Swati)
> v3: Add workaround id in code.
> v4: Update subject. (Kamil)
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_dirtyfb.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 4cbd1a2f9..f2bdd4546 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -54,7 +54,7 @@ IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
>   #endif
>   
>   typedef struct {
> -	int drm_fd;
> +	int drm_fd, devid;
>   	int debugfs_fd;
>   	igt_display_t display;
>   	drmModeModeInfo *mode;
> @@ -364,6 +364,7 @@ igt_main
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
>   		igt_require(data.display.is_atomic);
> +		data.devid = intel_get_drm_devid(data.drm_fd);
>   
>   		data.bops = buf_ops_create(data.drm_fd);
>   		data.rendercopy = igt_get_render_copyfunc(intel_get_drm_devid(data.drm_fd));
> @@ -381,6 +382,10 @@ igt_main
>   							      data.output) {
>   					data.mode = igt_output_get_mode(data.output);
>   
> +					/* FBC disabled: Wa_16023588340 */
> +					igt_skip_on_f((IS_BATTLEMAGE(data.devid) && data.feature == FEATURE_FBC),
> +						       "FBC isn't supported on BMG\n");
> +
>   					if (!check_support(&data))
>   						continue;
>   
