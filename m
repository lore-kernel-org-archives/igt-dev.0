Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F1BC02192
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 08:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E34A10E318;
	Fri,  7 Feb 2025 08:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CG2n3aRN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94C210E318
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 08:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738916768; x=1770452768;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=w3kdLqqoKecDZf87MlZgNrHHjfqcfxJn8FtbYUtNHEc=;
 b=CG2n3aRNQfQ2ryxlL/aYNvWGAq/u6x1Wpnpe74P3JEVZ5HfsCaW9RkjN
 cCV+PYLikTqFTgzfB7SN3QUfms0QIc/cdxaB5aIN0w2d6XcePr2R5KbId
 hewqryF7WUz+JK1E8VTmuyMtSHMt0qHAle5zTGgbXgRyS46Fsyr1D1Qpd
 W3vDo5bwghcmPSrZ6WCHz/LJJyIhLLUtJyI9ana9rbfCkMJwZ8+jAK9Dc
 LkoPxmVliqjpGRXdYqx5vjzqo3PtLqs2/6fjG2PNQ//UTt02MB/rXD3bi
 G6vjDHN6THwRWXIY/rDvQ+WYCrR8n6FOJ+4ulL6qpb4q33TXT8imvcMz3 w==;
X-CSE-ConnectionGUID: ftU+RY/tQ3i75r5w6G03Ng==
X-CSE-MsgGUID: Tl9NvpT6RF67pYBHotGE4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50189761"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="50189761"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 00:26:08 -0800
X-CSE-ConnectionGUID: HqwikP0BTtm8jsu/1wnqCg==
X-CSE-MsgGUID: A8YhMMFoRxmnvK5WXSByOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="112084623"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 00:26:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 00:26:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 00:26:06 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 00:26:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9pbyW36RVG/1FGuicVN0MdylsltGqiran5HFJUUnNnIX8R95mhb0+2rozLHUDXfkPpwMbvcj7qZ21GUGf21IqNNZJ90VKVBk4s7eLfH0SvDxaW2wqoyRWk9EA1s1kQqv5wIt20RJaeyf8WAZ3DWG2jztZqinmeS5Il731OdcS56QqkY2xZ+PgbwgXpGzHwG0OM8e0D7C4zKSNDv+BSLogOVnRDIGdpX9a1AWGc2iAVGTTlR8fJeaNUiKzsE8ESHm5mhSTIU6jM9EdDhUIuQtg0/SkN/jaaV2gVJ59NEKsnXOAYtfv8BzglCfAaQeeVVUc5iEZkuUe73fUeswWD/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKZFEfb3aUkbd0Ni2NQjyIYXuYtRZ+DAVo8wKXngdRM=;
 b=JbHB3Xjzm0eYtZVqynoJg7jK+RuWI00RIwnGz9KArN2AoTlQ+bhyc38OhQq7a2bEUoIfCZSa6HO0FJGAn3fMOY+Juv7o4DYgD83srcRiPFbLZ/1ANemX6SxIPCyM+xDdadUu2haPEl1JxHRXY0epK5A4RRhArHJ07fLL5pSyT/40jWD+vwo8HcpE/bZPIFQgOxDetN6xdSiugQZO49x1RyGHKx+1sqVDjrVVk42oOPUyws07j5MTpLkC+drCsts3Oun6oU2EaSqXYwlNt6LiM11ZU4ANxBwI2CfyolVQDXwMzq4kZUA7dwIyAICkFSiPm6/oss8l0EHG5HXL42r/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SN7PR11MB7137.namprd11.prod.outlook.com (2603:10b6:806:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 08:26:03 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 08:26:03 +0000
Message-ID: <5cb34668-f411-47e9-8afe-213a64e20610@intel.com>
Date: Fri, 7 Feb 2025 13:55:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/kms_joiner: Add a new test to
 validate non-joiner mode
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250204182734.793645-1-jeevan.b@intel.com>
 <20250204182734.793645-4-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250204182734.793645-4-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::21) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SN7PR11MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: d2783495-c337-4ef5-782a-08dd47510f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUMyQ3BpbWM5cnJJTEZvTTRoMy8yTEZycms4YWNJK25wb1VMQTMrQTM3UTNk?=
 =?utf-8?B?SDBWdkRCN2pXYjR2d2Ntcml3WkNvT09mMk1qTHphUmpJVU1iZEl1M0ltVHEx?=
 =?utf-8?B?L1lUb2I1b2JoV0NsZTF4dS85b1I5d2gyd3RkY3JvSUJRRjEycTF0T2NXNTlx?=
 =?utf-8?B?eXNmSHNxWTFoQTg5WGQ0aFAvYWlCTnp0bjlTTm0wSTU4Y3BUMzg0VmY1YVVN?=
 =?utf-8?B?QmdWQlE5TzU2cTBFaHAxZEpBM3ZnUVZZN0ZoV0RmaDFvOXlQOHRTUk9qVTBi?=
 =?utf-8?B?VWg2Y0NjbkIvTXEvTXpFUzFIK3Ftc0tINmJoSGw0L0NqN0xpU0U4YUlRVDh5?=
 =?utf-8?B?SWZBbnd3WFhZeURUWGh0N3QyTUhHSjhHQVc3WGlxU1FjZ2JiVm1aY2NGZGE0?=
 =?utf-8?B?K3JGeWVha1NMRmFhRERVd2Fidk9oU3d1Rmd3MXoxMjFEdlN6eW5ITUltQVdi?=
 =?utf-8?B?SjRaQkdpRGErV3BoaGRNekl2bnA4YkZXQ3pvS2dXUUoyMnRzS0hCK1pjTnpn?=
 =?utf-8?B?bko1Q0Y0OTdNRFlCaWdOVW5ULzNwZ0xrUlNLbTVQMVdNMmFydlRtTXQ0dXFM?=
 =?utf-8?B?Tk0yTnMzVnF6OVR2L1dzRHdyQTVEb0czekx2RHVXMlQvL0w5Wk5GdUJFSDBB?=
 =?utf-8?B?aUYrSEpUSzdzKy9uL1piUHBOUVFTdVZQTDJoS2JGOG1YMDZRbWR1WUozTDVM?=
 =?utf-8?B?NzV3emxtTUxDc2F1NzFFUlpMQWd5aDV4dlM5SUtjczEwcTdXS2FNUktiRFNY?=
 =?utf-8?B?T1NRNFB3MkRTWFJMenduVDhTeGh2VjJMT2t2YUpZRDN5RGZ0a2hMa1c0SU9H?=
 =?utf-8?B?MFQ2TWRXMVMzTDZ2ZzgxMC8zRUh3U3N6eHBqdDE1THRTcjY2Tk9jTGxtaHZm?=
 =?utf-8?B?QnRiemM0MjJCQ285eGFVSFRIaU5FUTNRdmZsUTdaNFBCbzJ2T3VFdlNTZGU5?=
 =?utf-8?B?NEZOKy9qL1Fwb1pwRDYvTzRkdy94TGw3YU0wVFJxYXlXV2svR0RHK3J3Ujhs?=
 =?utf-8?B?NjVwZTJaNDZBSTJNMkJ4QXl4WnpiVVNXSStUcmVFNjR3VjVPQ3ZEVHA3Rk1n?=
 =?utf-8?B?VytTSGlNTFl3TFczQ3RzQVRkb3hGbHlHR0FyMENwVlhZU2pZeUJtSFpDSXlV?=
 =?utf-8?B?TlpxWEpDMko5TGoraTBxWEw3bG1iWnpzNk1vdjJ1K0JuYWlERGNkcU9BczRh?=
 =?utf-8?B?eUdOUUJxdUk1bFdQTk9zemdpZksxcFZabEU5UUdrZHdicndpck8wMm84V1VS?=
 =?utf-8?B?WExMTkkzdVN6UlB4QjFIc0ltbzUvWEdmT1ljUEtFcU5VYndERG4rdE4rZTE2?=
 =?utf-8?B?dHh3citySm0wNjljQkVqa2NON1M4Y3BabERzenZWSE1XWkpPaThrRFJ1UTJr?=
 =?utf-8?B?dnZKeWErV1BmTjFWQWdsU05FTlExUHBIdGxaK1ArQUJBVUpXV1VQOW0wTVZv?=
 =?utf-8?B?ZnJRZHZrWitidy9MeDhyMDF4Mno0Nlp6QjMvSkl6QnlQTGtyb0F6WTVDY1p5?=
 =?utf-8?B?bGV3MDd3SFBkaGJRS3N2OFFWZ1NqTUxpejJITXhERnZ1ejVqMWpZN1hGY3lO?=
 =?utf-8?B?b2tOMlhHTDJmdUZFdkdqSEZKd0E0ZzdHV0V2UTNMVEtrNXB2ODJvZVczRFhY?=
 =?utf-8?B?dHB1SWZZZWxub2NHQ2JoV1ZnMDRlV2JwMnRUSFl4c05EM1pRblFBN0RkN3FV?=
 =?utf-8?B?LzdZcmV1ZWNBVXRwRjZYNVYwSFAxcUR6NURWcVJMMitzNUg3Mk81NmNIUmor?=
 =?utf-8?B?enIxMEN3VTN5S0Z4WFNra3V0dmtlZHNpejlSUm1TdjV2ejhwSmMxWmpTTEF1?=
 =?utf-8?B?eGpOMHBsNmhSTjcwQ0ZNNEtJcFFNYzdETHV4MEtSUmppekVJSHhKWFpJb0hi?=
 =?utf-8?Q?aSXqd5erUguKn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U01pejlOT3M2YlBPUkdPdW9UZWxOZUQ1cEdXMVUvdHloVWpBcHV1U21NNHBl?=
 =?utf-8?B?cUZVeE5lb1JJQjV5cFZlT0ZOOWlYbmxrNERSR0NoOWdEMG5xNFowbDR0UE9W?=
 =?utf-8?B?K3prODZyckpEMG1EZXFRWFZOQUVGeXJWSnM4c3d0YW9PTGFXSklTelZkM2FY?=
 =?utf-8?B?VDdueGdKQkF2TEhTbmVPMHA0SUlqVXFRSmVNZkMrR0Z0cFpNRC82ejgzQW90?=
 =?utf-8?B?TTZNa2V1b0pGdXg0dE9yK0YxVFNSVVdHZTRNZmxLYjc2VzUxVDdub01KcHdX?=
 =?utf-8?B?aU5uakRacFFlR0NEQ1B1QWd2SkZlajJLditVTzE4ZzA5ZlA4eWNjTnBoZXND?=
 =?utf-8?B?dHg1RnFRdWFjMGVkalRLMExOS3A2YVNqRFFXTHhsSmc5K0VPbU5xc2dyWVNR?=
 =?utf-8?B?dHl2UHRKUzlMSlNpdU5hMWRnK3MrNTdDaVlpd3BlNlkvaGFTanVGMzFRSUIy?=
 =?utf-8?B?NGNWcWdkeHV2SVhNNU5HWjQveXlDOXcwV3YvbWNGODYzZnc2dW92d3RLZFJF?=
 =?utf-8?B?VnhxeUgyVkVoK0J1QVVTcDJxK2FsbWxPNmtFTk9JaFppd3JDeWErOWhjd2Ez?=
 =?utf-8?B?OU1SdVhRKzlrUDBKbGVVVlp4U0lpZ0hqcVc3SWRGQ09XVG1WaWtidlpIR3hM?=
 =?utf-8?B?Wm5aRWxNaVhJTUthaUVua0MvQ3VUaTFFcEd3RHlrVUYwb2ZBYVRnWXEya1dw?=
 =?utf-8?B?NkR0ZkszMTFkeTNob3RSenUvSVF5a0wvanpvL2lvcHdJL29VSmpFRThKQmdz?=
 =?utf-8?B?VG1lbUdZb2dsUjdpSDZSMW9lalJMdlFwbGtjT2s3WlRkMXgvVEtVcVVMa0tt?=
 =?utf-8?B?WWZLUlpMYmVYN3EwN2tYZFpYWnNJeS82L2dmNnNQcnl1bk9iWWJFZWRQcFhq?=
 =?utf-8?B?TGxqZUpPdzh0QjJRdVFNRlFaVWRXT0ZzQ2Rwd0lXTCtyUVJ2SDVtaVBVYWRC?=
 =?utf-8?B?TVk0amJHUmtPOG9hanVaSnV4YnIxOVVsUTllVnVIV1N4d0U5dHVNODJZQkd3?=
 =?utf-8?B?RTRJVnBkLzVlYWMyblZpYWlBZk9qaU5yWFJZcjFZK0hOWjZHNDJ2aXRZTFp4?=
 =?utf-8?B?RFNiWnlZNkovS0RGZUxuR2xveVZaL3N2RG4wdktrY25yNTlGRUZWSyt3UHNZ?=
 =?utf-8?B?M21pOE9YZnNXMTR5WEZ2Wk5pNGZLWnBuOGJlaC9Hc2hNRWtXSjFwSTlVNlFM?=
 =?utf-8?B?ZW9Jbk1kN2dyTnlpMEZ2SnY0NHhtWDNUaFNIUFc4alRYSXRVbGFlVElUMXdR?=
 =?utf-8?B?SmIvY2U3R2NUQkptdlkrNmZPNEV2dmtDZGUwN3RLNG1LVFd3MHpKdlRrUXFK?=
 =?utf-8?B?QlNuNVE4K0Z2S0pxY1VwZCtFb2E2V2kwSnIyK3MvRlRubjdEenV3NnExRkFY?=
 =?utf-8?B?YjM1MnRGSFBnOHpOTEJkOFJFcms3Y3RRL0dzdENURHV0dVVudkprRzBXNC9M?=
 =?utf-8?B?RHR6SUhoWmY4MVBuR2RoTGFKckJKeDB6YUtvQkJEWlBUTjhZdks4NncxM08r?=
 =?utf-8?B?bGRhWllJdS9TWER4Y2doU3c4dldmdnpNZU1qNUxZcnBPWDI1cytTbXNMMU1E?=
 =?utf-8?B?cXA5UG1HU21adHlaWWVKUG5VNEVjUmVtMWEvTXluNytBdHJLblFuYjZKWnA2?=
 =?utf-8?B?Yyt3SVBJYmtRenNqRUVBY3RseWJ4RmpKZGVnc2k1NzFJcXQxbzFBdmpPV1B6?=
 =?utf-8?B?cnhYNzc0ZXJVNDVZMlJlRFU1a3pCM2JwYUpTbS9CMm9pemM4cE5WbDNDb2Uz?=
 =?utf-8?B?VnA3R3YySVMwUmMwVWRuS1g2SEoyRDVVdmdEZFJWTDltdTdCY1lEdlZOY2Rl?=
 =?utf-8?B?WExSOEQrNGhtZkx6Zi85VjBuSmo3cVg0MGZmeXd1eVN6N0tqZ0FVUmt6elEw?=
 =?utf-8?B?WXE0aFRwQ05KWXgzTi8rVm8wdjE1RWVtZm04TTA4Q2JzaWM4SmhWeVo0N3B0?=
 =?utf-8?B?cjNaVWxMbmN1L29sNGU1UWprT1JPMitWWmNYZHhJTzA1eGlqVmpVb0ZsQmR6?=
 =?utf-8?B?N1EzbDJZMDMyQi9laUdOQVlJVHlUN1I4SnZmT2tSbEF3aXp4VGpPMk9hVEJy?=
 =?utf-8?B?cHBnRHo0MW5yYkoxTmxvWi9NdTNHaWx3UGdQRE43VVNPdHlHR1dPejhLQXhP?=
 =?utf-8?Q?1CwTaUGF3zbwvOEo90Ou81KBC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2783495-c337-4ef5-782a-08dd47510f86
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 08:26:03.8316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8u3ttPi2Vv7l3ILRFEr5ufuahAqsTbpxmjLmFrB/JkSRSvZJMjXrRvcrZh8Hj+Mo3exIGlurYe3FbfHKgFAKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7137
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

Hi,

On 2/4/2025 11:57 PM, Jeevan B wrote:
> We need to ensure that the system does not use a joiner for modes that do
> not require it. This test will validate that the correct non-joiner mode
Please mention what is the correct non-joiner mode.
> is selected, and then forcing a modeset and flip on the last pipe. If the
> joiner is mistakenly enabled for a non-joiner mode, the test should fail.
> otherwise, the commit should proceed as expected.
>
> v2: Fix nonjoiner_mode_found to find the required case(6K@30).
>      Remove clk sort and minor fixes. (Karthik)
> v3: Rename nonjoiner to non_joiner and minor modifications. (Swati)
> v4: Add joiner check. (Karthik)
> v5: Rename test name and function name, Update test description,
>      update non_joiner_mode_found logic. (Karthik)
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_joiner.c | 54 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 086cfeb71..4227aa8b0 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -74,6 +74,10 @@
>    *
>    * SUBTEST: switch-modeset-ultra-joiner-big-joiner
>    * Description: Verify switching between ultra joiner and big joiner modeset.
> + *
> + * SUBTEST: non-joiner-corner-cases
> + * Description: Validate non-joiner mode functionality by enabling corner-case display modes
> + *		that vary across different platforms.
>    */
>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
> @@ -85,6 +89,7 @@ typedef struct {
>   	int ultra_joiner_output_count;
>   	int non_big_joiner_output_count;
>   	int non_ultra_joiner_output_count;
> +	int non_joiner_output_count;
>   	int mixed_output_count;
>   	int output_count;
>   	int n_pipes;
> @@ -94,6 +99,7 @@ typedef struct {
>   	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *mixed_output[IGT_MAX_PIPES];
> +	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>   	igt_display_t display;
>   } data_t;
> @@ -491,6 +497,41 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
>   	}
>   }
>   
> +static void test_non_joiner_corner_cases(data_t *data)
> +{
> +	int count;
> +	enum pipe pipe;
> +	igt_output_t **outputs, *output;
> +	igt_fb_t fb;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +
> +	count = data->non_joiner_output_count;
> +	outputs = data->non_joiner_output;
> +	igt_display_reset(&data->display);
> +
> +	for (int i = 0; i < count; i++) {
> +		output = outputs[i];
> +		mode = igt_output_get_mode(output);
> +		for (pipe = 0; pipe < data->n_pipes - 1; pipe++) {
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> +				igt_output_set_pipe(output, pipe);
> +				primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +				igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +						      DRM_FORMAT_MOD_LINEAR, &fb);
> +				igt_plane_set_fb(primary, &fb);
> +				igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +				igt_assert_f(!igt_is_joiner_enabled(data->drm_fd, pipe),
> +					     "Joiner enabled on pipe %c", 'A' + pipe);
> +
> +				igt_display_reset(&data->display);
> +				igt_plane_set_fb(primary, NULL);
> +				igt_remove_fb(data->drm_fd, &fb);
> +			}
> +		}
> +	}
> +}
> +
>   igt_main
>   {
>   	bool ultra_joiner_supported, is_dgfx;
> @@ -505,6 +546,7 @@ igt_main
>   		data.ultra_joiner_output_count = 0;
>   		data.non_big_joiner_output_count = 0;
>   		data.non_ultra_joiner_output_count = 0;
> +		data.non_joiner_output_count = 0;
>   		data.mixed_output_count = 0;
>   		data.output_count = 0;
>   		j = 0;
> @@ -523,6 +565,7 @@ igt_main
>   
>   		for_each_connected_output(&data.display, output) {
>   			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
> +			bool non_joiner_found = false;
>   			drmModeConnector *connector = output->config.connector;
>   
>   			/*
> @@ -533,6 +576,7 @@ igt_main
>   			 */
>   			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
>   			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
> +			non_joiner_found = non_joiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
>   
>   			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
>   				force_joiner_supported = true;
> @@ -548,6 +592,9 @@ igt_main
>   			else if (force_joiner_supported)
>   				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
>   
> +			if (non_joiner_found)
> +				data.non_joiner_output[data.non_joiner_output_count++] = output;
> +
>   			data.output_count++;
>   		}
>   		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
> @@ -713,6 +760,13 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
Please fix/update this.
> +	igt_subtest_with_dynamic("non-joiner-corner-cases") {

'basic-max-non-joiner' maybe? Please update other function names also 
accordingly.

Thanks,
Karthik.B.S
> +		igt_require_f(data.n_pipes >= 1,
> +			      "Minimum of 1 pipe is required.\n");
> +			test_non_joiner_corner_cases(&data);
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
