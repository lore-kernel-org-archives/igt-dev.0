Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE78C83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 15:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A9610E222;
	Tue, 15 Jul 2025 15:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8+3Vx4W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81A510E222
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 15:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752594214; x=1784130214;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=H4Rpz/jd8paiGWaqtb/+8wJBc8Pmnsvbwus/wtzlwac=;
 b=d8+3Vx4WulOEJ+shruUdS2DxLkAoO2zO0jdu5cAh1292f24x5WWDxbBN
 Wqr98DI+JplTrlRDj24YevGG3wERFTQPsSLcELwyiTVBjgZ8uYucvN5Dp
 fAKoHWICv1dIuFci63YaQEjlq0zXRPjPr77ux53aAY7ojwFHiACsmhSlU
 GhASWC0ivRffYXE2dsNPQhUGXjJ/yeIAGSbJKxsB6FO1KWag3G77uHnmG
 /GBiPoQD+1G1zKWksjirHVbDXvXPzsJyuh39D1U8b7WD7Vm83fdV+qeGM
 4u3/MHIlJFkVmY6L6xmkLg22qUS960KmX/IPaYk/dCfvw/LlZZk0FeaNY w==;
X-CSE-ConnectionGUID: +LBSdILMRrKK8wNX82hvKg==
X-CSE-MsgGUID: 7BeYsLsMS5y/t3kbWxMp5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54675361"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54675361"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:43:32 -0700
X-CSE-ConnectionGUID: SMLmElNeSj2V7kjkIg2tGA==
X-CSE-MsgGUID: 6B03ZupSRMG+Ql1d64txiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="188237983"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:43:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 08:43:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 08:43:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 08:43:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3mwjHxiGsjSWz2rvLen+zB2nqhY5pMS/5WAM4/B7jx7oQdJjOyn8YNO99j2W//XG5rzgio0KxDKkXGkg9hE8NXGlA+dtTOcMNd4YOKJBjeVG8aIlOode/vc3PsQ1gsZ1A1L5MAc986TD+lQlrVPceppWPMaGaMhN9Svs8I36kMP0eS1A7CRbPWNbATabe0eg6Io2gVsqoj26QaC5yJfVAzIrY5XxJXzDEO8sYtGjQLV2eVhqNr/6U0tbU+HLq1mPmHDrccn6+W7Dmv8/08zAjCTz6U4U7RaNWY5cLExE2cFdWMz7YgmoxijnOD+EJ92hOONbUoagg+zlg4XPKEUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aM1BBKLm5zGg5T9fVvGfFaEzdQ8KH/pBk9HLKhW6elc=;
 b=V4oiGFewDhlQ3BOhVupYRPj3p11u0p6SwxC2/2J5JPWAS78w6CJ5v4iswFSI7pmBdCCohllEiEclM/CGz4BtpWNk2ffmxNtitNqNVvnaSMuXBB5t53Ek4hwajFe+aY2X6SCSAU4IfOgBHXf7Ygc6i5nSVLLoabEaQHBUvEn4FivlCHqNs+BI3D6Ro8UaHrvTYYUUWpMHuT/w2eyRIyaAjUhvE6YNeqHgjAI/ElhZ08x9p7iIB+kr0kuFORiZPCgN89xJAV6jhQIj16qEmAPH9RCbYMCRokgehMHEmhVriiIDpQjupJ/FJWRPlFieQ6TgHbRLHQl4yZjINypZLVM58A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 15:43:19 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Tue, 15 Jul 2025
 15:43:19 +0000
Date: Tue, 15 Jul 2025 08:45:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] tests/intel/xe_exec_system_allocator: Add prefetch
 sections
Message-ID: <aHZ3gCJlz8judMG2@lstrano-desk.jf.intel.com>
References: <20250714170309.2949211-1-matthew.brost@intel.com>
 <20250714170309.2949211-3-matthew.brost@intel.com>
 <1a94f2f5-f993-487a-b7ca-e9354dfbe05f@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a94f2f5-f993-487a-b7ca-e9354dfbe05f@intel.com>
X-ClientProxiedBy: SJ0PR13CA0128.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CO1PR11MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: 6674458b-b219-4c11-9def-08ddc3b6528e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHpYc2cvUisvdDc3UUo1bllXOTVzSnhiNHFDajBRYnk2MVlnTkxERXE2WWFm?=
 =?utf-8?B?VzFhZk1iUTF1RWkva2d5S2pQOXpabW5tQVRyTmdUc3FlU1RRWlFwV0grdmht?=
 =?utf-8?B?Sk1UZGlJWkV6d2lQNldNQUhWSVM3QWxUSDBqM3g5OEVEdlNtVThHVVQ0Q3lH?=
 =?utf-8?B?TWNoWlRBUFFLcndVRXEzTjV2WU04MWRvS01FTkM5LzJCZnJHR2Y3QmdLVHdM?=
 =?utf-8?B?K01YZ3dqZ1gvTkpoSTNJSlFPZVBFQk9jRUtSQ3VqQXFvY2tMelljcDRxRk4x?=
 =?utf-8?B?VlM1S0NycGdwbTRjVlJLa2VsRWNndnJMWnkxdU4rNCtEVnNtWU9rNk9qb20w?=
 =?utf-8?B?b2FpS3hrdnpQQ093M3dlRk5EWUtlTlhrTGZ5MG00ejBYZG1Oc0xjNS9MNFk5?=
 =?utf-8?B?Mys3bHJCZlR2ZXJpdzhXd3g4V3dZNHBPeGdNdmNONWtJbCtVWnpiWkZUV2Ja?=
 =?utf-8?B?ZDQ1THdZSGJiMlNKN1NqaGFDV1BEeElZcFlJcXdVTFhnd3lJaFoxcVh5Skgr?=
 =?utf-8?B?cHh0dnFiYVdCTU84Q2dyMUNTZjZaNDNZR0tvWmRzM1VYbjYxeS9FZnIzQkIz?=
 =?utf-8?B?MFpNQ1VNM3JPR21yQ3VBN3p0cFBZOEtodWhJcVZRaWpXVWJMSW9wcU84U3Y0?=
 =?utf-8?B?aHZYaHBCWkZvek5BckF0U2R3VVcrRXlFVkFMOFR6b3phV3pvRHNFanZHVVpQ?=
 =?utf-8?B?WlBOVDNIK0ZSS0UrTzk2aEU4Ry9yb3RpTS9DNGUzUWI2ZVRuejB2TU5SbHdQ?=
 =?utf-8?B?L0pXdDVPdlhPejJPRXhzNnZPK1VvTG9jbmZFM01GcEZETE5SeTB0cjhpR05s?=
 =?utf-8?B?N25xWDFMdFdORU5iWldUbkJZaVFvbG80ZGtDSzBaaFRGUkpsUlpqU0VVeUds?=
 =?utf-8?B?dm53WTk3MG4ybVo5Rm9pblFhVHVLcmcxaCtBWWZLb1E0dlkrc2ZPd3h6V3kz?=
 =?utf-8?B?TjJadnc4eUttL2N5Lytya1YvaUc4QlU0UXFnOUFWaDdIYjgwUzJYRWl5d2Yv?=
 =?utf-8?B?MFNjaWhtYjlDWTB2NmR2MURRNGdiMmdsTWUxMDV0ZUVzQWFNVHB4d29GYmt4?=
 =?utf-8?B?N2tSYnA2eUZweXlTVTdKQmdKQVBXTXAwWXRHTjRhZkkrZWRSajJ3NDhsSzVh?=
 =?utf-8?B?UzVGOGRsbFhIWVlXUTk5Nm8vdU5uOTF0M3FVMTlFSWJGNUJtVFU4WFMyOFN5?=
 =?utf-8?B?WmRaZXN5UFdObDhpUmNoSmIvMERSdkxVNzYyVG03TTFMd0lGQldyLzBMTmhl?=
 =?utf-8?B?YlhROHRHZ2JTQkhaQmxLZW40RjBySnFUaXd2SEw3UTlhV3k5MjFoQ1FjRWdl?=
 =?utf-8?B?L3hqMWRGdktHaTVkcnVpaWtVaWk3K0EzUll6TmhzS1k4MWVxWWFKZXNCTzkx?=
 =?utf-8?B?dmdhS2ZkbzV3Q3RabXpOeHVYbnBLYmxzNW14VER3R0o4cUprR2NqcytOZnR1?=
 =?utf-8?B?eEtMNzZsdTEvWjBoQ2NpeU4wYWtZSVFGeURIVjlwbU5IQUFCWVcrZnphblla?=
 =?utf-8?B?bkEzSnN1SVNhSjRIVGVrMHN6Mnh4RzFIVHViRjhmRE0yUHVlTjdhNE4xcm5s?=
 =?utf-8?B?ZHUzOXZwZDl3N3pMWVJJbXF4ODFMNUhESnRnUEdsbG9waFNULzFlem02dHVh?=
 =?utf-8?B?K1UvbUVpaGJEc253VTEwZUxYTkZQbXBkR3hqOHpPYzdNSCtja3ZvVTRYWFd2?=
 =?utf-8?B?dVBNMnhBancvTUFnQm1FUy9iTlRBVGdWQUJoRGRLTXBZUngyeVUzd0JjZ1Q4?=
 =?utf-8?B?TWhGNWk4Vi83SzR4em1HOU9rM0hYRGdPS1BMdjFwUTlnNHZnSkh4a0hEd0FS?=
 =?utf-8?B?WHlVNUxjTE1VR2xHMG05cmhzek0wNThLK3NTNEtKS0lBbXUzQWtjQVpxYUtt?=
 =?utf-8?B?eVVPY2pUdVJiaDJXL20yVWhNOFNTTWVXYnd5Y0Y3ZDBHTlFQdVFsOCtuT0tZ?=
 =?utf-8?Q?VtVCNoj5hro=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ni9BOGF0dDRnSFZJVjdmS2FsQ3piakExNnljQ1psKytRU3p6SW56QVRSN3cw?=
 =?utf-8?B?ZUNIc2dJZll6UWJIZU54SFVmOG9DMUFtR2JBaWpnTkdBZitiMnd5YUJWSWRw?=
 =?utf-8?B?WUs0NDF2a3JRVnQwTUtuY0huT3g1eXYyRzY2QmJzSHlFaG0xd0RIMkUvQm9N?=
 =?utf-8?B?bm5MdGlscjdWcVUwMFVCeEZUYjlpbjJ0cXp2VDd5YzgzVXFFcXlUOXFsa1Q4?=
 =?utf-8?B?WS9oQXN0dVc5cUY2Nlgya2sydjZITitxbXNwMTVCMWdyN2cxREV1OFdTcWxy?=
 =?utf-8?B?NDEwYTlFRUp5Qk5jMzlDRHZPUkR5cWIzamtray9iNXN5SVY5cnlEbm1ndzBr?=
 =?utf-8?B?Y1lvOHppTm5zRVhjVGlkYTNIb2JaeVI5cU1DUXhqS0lIK2wwM1dvSFZDRDho?=
 =?utf-8?B?cndYV3BCNHRXcjhyRGdDMUFBN2NiaTNhSjF4TUtobWVMT0hFTEovQmpDbEZi?=
 =?utf-8?B?YVRpUVo2MDluY1Y5c0ZJMnpOR2dBcjJ0aW5TRVVEVlFKYkZ3N0l6WU42ZFRF?=
 =?utf-8?B?Y3lkMTBhYTNxYWtQVTdQeDVGNkR6WHA0cFovU2RkdE9iQ0lZK2NDRzlLTFFV?=
 =?utf-8?B?UXJBMzAwdmFBZDVGNWJRNlJLY0dkeFJXRk83dFRsRkJ0OEl4UGJKWWR2YUov?=
 =?utf-8?B?Z3JWckxsemdIK3k0YjkrSG54M1ZNeStCV012N0pHQmRMY1lrVDdWN1ByVUFw?=
 =?utf-8?B?YmJsTVg3OUprelZxTDBZWnNqTVVVdy9abkg4NWx6Z05hM0NOMUpocFZscmFF?=
 =?utf-8?B?Y2p3NTQzSWZvd0YyRGxtS2xZaGo3V3FKVzlTcG04R2N4c1Z3eUo3cEQwdEVQ?=
 =?utf-8?B?Y1puV0x5QWlMOS91cFhpZEI1clIvVm8vQ0tkVU9xQmFNUi9UYUpZNXRuR1dh?=
 =?utf-8?B?dS9jN1ZVTnIydkYwd1hpbytYbDVTc09XRExGaWRvdXBhU0I4emgwZ200NFVq?=
 =?utf-8?B?SHVRT0tRMDBlOXAyS0N0SWIzWUpHU29HSkpXbTBva0xRR1NiODQxYkdCcVQv?=
 =?utf-8?B?VDVOb0h2eUVsS2ZwdEFQRUM4WEh1WnJndlpCNUlhSGxzbXplYjl0aWFubjFt?=
 =?utf-8?B?TCttOTMyZzJJSHByMnR1Zk1zY29EbWFNOHlJT3NzMmdzeHJUSzBtV2xNTlRj?=
 =?utf-8?B?d1JtalVNQlU3UmVDNDVYNm5BSTFrUnBGQ1F2MVhCTjFsV2ZXK29Lbnc2Smdo?=
 =?utf-8?B?eklMT1JRRTFUVWFOeGQxM3NSZ3E1OWVsLzM5a0E0TFFQdGRQWUFYZzdmN1hq?=
 =?utf-8?B?TDlhWDFNQ0I3MUNEems0QjkvYzRKek1Iem9YMEw5K013SW53UVNaU2U3RUl2?=
 =?utf-8?B?L2xYRkMzUEJIMmNweGx2a0F1Z1lrV0RaUmcvYTR4Y0RTNmFoVTRJRi9wNThz?=
 =?utf-8?B?ZWFmall2Vis0Y0VlcmhLK0puOEJ4R2NrRTBIYjFrZTBjWkdNeFdjRlBaazgv?=
 =?utf-8?B?dDdXSmxBcC90cWZPR3o1VkVqZ0pXSjlBaWI3ckc2Q1pIWEFXOHRsYStxcWZD?=
 =?utf-8?B?eFREVXdUc3dsQll0WDdUbmdESmdJWEFzZWQ4WmVhYUlJVFIyRTJIV2RBa3lV?=
 =?utf-8?B?OXd6UldDWjJnM3ZIZlNtKzNzZnJsNXc2NWdPakFvc0grYlJrdm1na0c3Rk1S?=
 =?utf-8?B?VGoyZ0tkamxSNEdiTGwrTWE2TGRrV3N2SHlTOUpVUktibDZsZWJlRDZyN0c3?=
 =?utf-8?B?WnVZMnRiSW9HZjRRR3U3VFZqemFVajNidVhqNHhuNGl2UTdHTkJ2SDB4QUZP?=
 =?utf-8?B?dy9xWC9Tc0VzTGhDODhkK3lHTGJadDVkMXJ1c2dGVGZRWXBGakRWeTBvWEtR?=
 =?utf-8?B?ZTd5T2NqSEhtd1p6RzdTakI4cXd5blZNSFZYbGdZYWZpZlZWNXZXRTgvZ2hX?=
 =?utf-8?B?Q3VHZjQyNy9SZ0ZGRUkwTFl4TXJ0WHZtRWs1eWtEMlNFTEVoMEdyU09pRmdl?=
 =?utf-8?B?UFptNGJLcXExRW1pLytaeVpVOUFxOG9wRTdxYzhmUGZQd05ITUwwS3pDeGx5?=
 =?utf-8?B?MkJwMnRFUHYrWFd2aDJYV251MHFVRCtRRTF2NVFhT2pEMlFwYkxzQ2l2cUwr?=
 =?utf-8?B?N2FxWnlrUmJrcklPWHNERmk0NE5VZEwvbndKdVAvWWFGa3kva0xteGJIbG9W?=
 =?utf-8?B?eGMzc1p6RndZWVF0TmtWclZFTHppeDQ0R2N4ZmNvUFEwazNQSkxGekZFdWtX?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6674458b-b219-4c11-9def-08ddc3b6528e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:43:19.6466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mw6qAhQ+AhymCcgbWAxd0DPeyzxeh0vJmjbeluhZdqTTotxOTGCYrkB5kOLGyL1jOkegx9nm1rYw7A7S0yZyLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
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

On Tue, Jul 15, 2025 at 01:35:58PM +0530, Sharma, Nishit wrote:
> 
> On 7/14/2025 10:33 PM, Matthew Brost wrote:
> > Update the test_exec() function with flags to initiate and understand
> > prefetches. Prefetching is tested by verifying that the fault count in
> > the GT stats has not  increased. However, a mismatch does not cause the
> > test to fail—instead, a warning  is printed. This is due to the
> > unreliability of system allocator behavior; the  added sections
> > primarily serve to ensure that the driver remains stable.
> > 
> > That said, if the page fault counts are consistently incorrect, it may
> > indicate a  problem in the KMD.
> > 
> > A prefetch benchmark section has also been added to help profile
> > prefetch behavior  in the KMD.
> > 
> > v2:
> >   - Prefetch initial buffer on SRAM devices (CI)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   tests/intel/xe_exec_system_allocator.c | 121 ++++++++++++++++++++++++-
> >   1 file changed, 116 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index 65d281c784..f8d144328e 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -21,6 +21,7 @@
> >   #include "lib/intel_reg.h"
> >   #include "xe_drm.h"
> > +#include "xe/xe_gt.h"
> >   #include "xe/xe_ioctl.h"
> >   #include "xe/xe_query.h"
> >   #include <string.h>
> > @@ -770,6 +771,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> >   #define SYNC_EXEC		(0x1 << 19)
> >   #define EVERY_OTHER_CHECK	(0x1 << 20)
> >   #define MULTI_FAULT		(0x1 << 21)
> > +#define PREFETCH		(0x1 << 22)
> > +#define THREADS			(0x1 << 23)
> > +#define PROCESSES		(0x1 << 24)
> > +#define PREFETCH_BENCHMARK	(0x1 << 25)
> >   #define N_MULTI_FAULT		4
> > @@ -878,14 +883,17 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> >    * arg[1]:
> >    *
> >    * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
> > + * @malloc-prefetch:			malloc single buffer for all execs, prefetch buffer before each exec
> Length crossing limit of 100 columns
> >    * @malloc-multi-fault:			malloc single buffer for all execs
> >    * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
> >    * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
> >    * @malloc-mlock:			malloc and mlock single buffer for all execs
> >    * @malloc-race:			malloc single buffer for all execs with race between cpu and gpu access
> > + * @malloc-prefetch-race:		malloc single buffer for all execs, prefetch buffer before each exec, with race between cpu and gpu access
> Length crossing limit of 100 columns
> >    * @malloc-bo-unmap:			malloc single buffer for all execs, bind and unbind a BO to same address before execs
> >    * @malloc-busy:			malloc single buffer for all execs, try to unbind while buffer valid
> >    * @mmap:				mmap single buffer for all execs
> > + * @mmap-prefetch:			mmap single buffer for all execs, prefetch buffer before each exec
> Length crossing limit of 100 columns
> >    * @mmap-remap:				mmap and mremap a buffer for all execs
> >    * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
> >    * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
> > @@ -896,6 +904,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> >    * @mmap-remap-ro-dontunmap-eocheck:	mmap and mremap a read-only buffer with dontunmap flag for all execs, check data every other loop iteration
> >    * @mmap-huge:				mmap huge page single buffer for all execs
> >    * @mmap-shared:			mmap shared single buffer for all execs
> > + * @mmap-prefetch-shared:		mmap shared single buffer for all execs, prefetch buffer before each exec
> Length crossing limit of 100 columns
> >    * @mmap-shared-remap:			mmap shared and mremap a buffer for all execs
> >    * @mmap-shared-remap-dontunmap:	mmap shared and mremap a buffer with dontunmap flag for all execs
> >    * @mmap-shared-remap-eocheck:		mmap shared and mremap a buffer for all execs, check data every other loop iteration
> > @@ -907,6 +916,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> >    * @free:				malloc and free buffer for each exec
> >    * @free-race:				malloc and free buffer for each exec with race between cpu and gpu access
> >    * @new:				malloc a new buffer for each exec
> > + * @new-prefetch:			malloc a new buffer and prefetch for each exec
> >    * @new-race:				malloc a new buffer for each exec with race between cpu and gpu access
> >    * @new-bo-map:				malloc a new buffer or map BO for each exec
> >    * @new-busy:				malloc a new buffer for each exec, try to unbind while buffers valid
> > @@ -941,6 +951,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> >    * @mmap-new-huge-nomemset:		mmap huge page new buffer for each exec, skip memset of buffers
> >    * @mmap-new-race-nomemset:		mmap a new buffer for each exec with race between cpu and gpu access, skip memset of buffers
> >    *
> > + * SUBTEST: prefetch-benchmark
> > + * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch
> > + * Test category: performance test
> > + *
> >    * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc
> >    * Description: Create multiple threads with a shared VM triggering faults on different hardware engines to same addresses
> >    * Test category: stress test
> > @@ -998,14 +1012,18 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >   	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> >   	struct test_exec_data *data, *next_data = NULL;
> >   	uint32_t bo_flags;
> > -	uint32_t bo = 0;
> > +	uint32_t bo = 0, prefetch_sync = 0;
> >   	void **pending_free;
> > -	u64 *exec_ufence = NULL;
> > -	int i, j, b, file_fd = -1, prev_idx;
> > +	u64 *exec_ufence = NULL, *prefetch_ufence = NULL;
> > +	int i, j, b, file_fd = -1, prev_idx, pf_count;
> >   	bool free_vm = false;
> >   	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
> >   	size_t orig_size = bo_size;
> >   	struct aligned_alloc_type aligned_alloc_type;
> > +	uint32_t mem_region = vram_if_possible(fd, eci->gt_id);
> > +	uint32_t region = mem_region & 4 ? 2 : mem_region & 2 ? 1 : 0;
> > +	uint64_t prefetch_ns = 0;
> > +	const char *pf_count_stat = "svm_pagefault_count";
> >   	if (flags & MULTI_FAULT) {
> >   		if (!bo_size)
> > @@ -1136,6 +1154,43 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >   		memset(exec_ufence, 0, SZ_4K);
> >   	}
> > +	if (!(flags & FAULT) && flags & PREFETCH) {
> > +		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> > +
> > +		aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
> > +		prefetch_ufence = aligned_alloc_type.ptr;
> prefetch_ufence is u64 * and aligned_alloc_type.ptr is void * and should be
> typecasted. aligned_alloc_type = (u64 *)aligned_alloc_type.ptr
> > +		igt_assert(prefetch_ufence);
> > +		__aligned_partial_free(&aligned_alloc_type);
> > +
> > +		prefetch_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
> > +					     bo_flags);
> > +		prefetch_ufence = xe_bo_map_fixed(fd, prefetch_sync, SZ_4K,
> > +						  to_user_pointer(prefetch_ufence));
> prefetch_ufence  is u64 * type and xe_bo_map_fixed() returns void *. Should
> be typecasted (u64 *)xe_bo_map_fixed();

You don't have to typecast assignments to / from void * in C.

This is commonly done throughout the IGTs / Linux.

> > +
> > +		sync[0].addr = to_user_pointer(prefetch_ufence);
> > +
> > +		pf_count = xe_gt_stats_get_count(fd, eci->gt_id, pf_count_stat);
> Shouldn't test continue executing if pf_count_stat = svm_pagefault_count
> "stats" file is not available in "/sys/kernel/debug/dri/%d/gt%d/? In current
> scenario if stats file not available it'll assert but that shouldn't impact
> further IGT subtest execution.

The library code would need to be updated then, which is IMO out of scope.

Matt

> > +
> > +		if (flags & (RACE | FILE_BACKED |
> > +			     LOCK | MMAP_SHARED | HUGE_PAGE) || !region) {
> > +			region = 0;
> > +			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
> > +					     1, region);
> > +			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> > +				       FIVE_SEC);
> > +			prefetch_ufence[0] = 0;
> > +		}
> > +
> > +		if (exec_ufence) {
> > +			xe_vm_prefetch_async(fd, vm, 0, 0,
> > +					     to_user_pointer(exec_ufence),
> > +					     SZ_4K, sync, 1, 0);
> > +			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> > +				       FIVE_SEC);
> > +			prefetch_ufence[0] = 0;
> > +		}
> > +	}
> > +
> >   	for (i = 0; i < n_execs; i++) {
> >   		int idx = !stride ? i : i * stride, next_idx = !stride
> >   			? (i + 1) : (i + 1) * stride;
> > @@ -1186,6 +1241,25 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >   		if (!exec_ufence)
> >   			data[idx].exec_sync = 0;
> > +		if (!(flags & FAULT) && flags & PREFETCH &&
> > +		    (region || flags & (NEW | MREMAP))) {
> > +			struct timespec tv = {};
> > +			u64 start, end;
> > +
> > +			sync[0].addr = to_user_pointer(prefetch_ufence);
> > +
> > +			start = igt_nsec_elapsed(&tv);
> > +			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
> > +					     1, region);
> > +			end = igt_nsec_elapsed(&tv);
> > +
> > +			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> > +				       FIVE_SEC);
> > +			prefetch_ufence[0] = 0;
> > +
> > +			prefetch_ns += (end - start);
> > +		}
> > +
> >   		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
> >   			addr + (char *)&data[idx].exec_sync - (char *)data;
> > @@ -1277,6 +1351,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >   				} else {
> >   					igt_assert_eq(data[idx].data,
> >   						      READ_VALUE(&data[idx]));
> > +					if (flags & PREFETCH_BENCHMARK)
> > +						memset(data, 0, bo_size);
> >   					if (flags & MULTI_FAULT) {
> >   						for (j = 1; j < N_MULTI_FAULT; ++j) {
> > @@ -1359,6 +1435,26 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >   		prev_idx = idx;
> >   	}
> > +	if (flags & PREFETCH_BENCHMARK)
> > +		igt_info("Prefetch execution took %.3fms, %.1f5 GB/s\n",
> > +			 1e-6 * prefetch_ns,
> > +			 bo_size * n_execs  / (float)prefetch_ns);
> > +
> > +	if (!(flags & FAULT) && flags & PREFETCH &&
> > +	    (flags & MMAP || !(flags & (NEW | THREADS | PROCESSES)))) {
> > +		int pf_count_after = xe_gt_stats_get_count(fd, eci->gt_id,
> > +							   pf_count_stat);
> Same comment as in case of pf_count above.
> > +
> > +		/*
> > +		 * Due how system allocations work, we can't make this check
> > +		 * 100% reliable, rather than fail the test, just print a
> > +		 * warning message.
> > +		 */
> > +		if (pf_count != pf_count_after)
> > +			igt_warn("pf_count(%d) != pf_count_after(%d)\n",
> > +				 pf_count, pf_count_after);
> > +	}
> > +
> >   	if (bo) {
> >   		__xe_vm_bind_assert(fd, vm, 0,
> >   				    0, 0, addr, bo_size,
> > @@ -1370,6 +1466,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >   		gem_close(fd, bo);
> >   	}
> > +	if (prefetch_sync) {
> > +		munmap(prefetch_ufence, SZ_4K);
> > +		gem_close(fd, prefetch_sync);
> > +	}
> > +
> >   	if (flags & BUSY)
> >   		igt_assert_eq(unbind_system_allocator(), -EBUSY);
> > @@ -1435,7 +1536,7 @@ static void *thread(void *data)
> >   	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
> >   		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
> > -		  t->flags);
> > +		  t->flags | THREADS);
> >   	return NULL;
> >   }
> > @@ -1553,7 +1654,7 @@ static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
> >   	fd = drm_open_driver(DRIVER_XE);
> >   	test_exec(fd, hwe, n_exec_queues, n_execs,
> > -		  bo_size, stride, 0, NULL, NULL, flags);
> > +		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES);
> >   	drm_close_driver(fd);
> >   	close(map_fd);
> > @@ -1604,14 +1705,17 @@ igt_main
> >   	struct drm_xe_engine_class_instance *hwe;
> >   	const struct section sections[] = {
> >   		{ "malloc", 0 },
> > +		{ "malloc-prefetch", PREFETCH },
> >   		{ "malloc-multi-fault", MULTI_FAULT },
> >   		{ "malloc-fork-read", FORK_READ },
> >   		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
> >   		{ "malloc-mlock", LOCK },
> >   		{ "malloc-race", RACE },
> > +		{ "malloc-prefetch-race", RACE | PREFETCH },
> >   		{ "malloc-busy", BUSY },
> >   		{ "malloc-bo-unmap", BO_UNMAP },
> >   		{ "mmap", MMAP },
> > +		{ "mmap-prefetch", MMAP | PREFETCH },
> >   		{ "mmap-remap", MMAP | MREMAP },
> >   		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
> >   		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
> > @@ -1626,6 +1730,7 @@ igt_main
> >   			READ_ONLY_REMAP | EVERY_OTHER_CHECK },
> >   		{ "mmap-huge", MMAP | HUGE_PAGE },
> >   		{ "mmap-shared", MMAP | LOCK | MMAP_SHARED },
> > +		{ "mmap-prefetch-shared", MMAP | LOCK | MMAP_SHARED | PREFETCH },
> >   		{ "mmap-shared-remap", MMAP | LOCK | MMAP_SHARED | MREMAP },
> >   		{ "mmap-shared-remap-dontunmap", MMAP | LOCK | MMAP_SHARED |
> >   			MREMAP | DONTUNMAP },
> > @@ -1640,6 +1745,7 @@ igt_main
> >   		{ "free", NEW | FREE },
> >   		{ "free-race", NEW | FREE | RACE },
> >   		{ "new", NEW },
> > +		{ "new-prefetch", NEW | PREFETCH },
> >   		{ "new-race", NEW | RACE },
> >   		{ "new-bo-map", NEW | BO_MAP },
> >   		{ "new-busy", NEW | BUSY },
> > @@ -1801,6 +1907,11 @@ igt_main
> >   			processes(fd, 16, 128, SZ_2M, 0, s->flags);
> >   	}
> > +	igt_subtest_f("prefetch-benchmark")
> > +		xe_for_each_engine(fd, hwe)
> > +			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
> > +				  NULL, PREFETCH | PREFETCH_BENCHMARK);
> > +
> >   	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
> >   		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
