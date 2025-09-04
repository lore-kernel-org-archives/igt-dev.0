Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A13CA1012
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 21:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A968C10EAE6;
	Thu,  4 Sep 2025 21:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMAG7Qwu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EBA10EAE5
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 21:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757019789; x=1788555789;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=55WH171tzX4KI1Irl65YR8pGplfOAjP/4kvvLt/rTX8=;
 b=aMAG7QwuunCZmgzBbIxwZGxj9M28zgtW/+OZ/4hZN0Lz0c/tuq+kgQAa
 B15eSmeBoT/WWoTNedDMtAduO/eef530REbOG8Zu4i+HPqtp58/bUkRae
 9lNWRUIakIIbnLJOm020K68MLkcIGyKLZs/zRRggPcLehPvECMn9d1iIz
 8HANip3n4jzp0VD15QFriFtZpRaQrCsG3YHRz9NG+0t13BR2iHsS5dWaS
 gbojPVEcyR3e6DRu/dkKani31nrzYSNCT7tvX+S0zbTn4z9HToMFBExsY
 1vjzz5jPJLy2MWEu+85M8K/Foy7+xVbIavh+JTwsfRkKLrcAjxfnxyQOx A==;
X-CSE-ConnectionGUID: C/gcFYb0RwyKaxQPlS61kQ==
X-CSE-MsgGUID: hPz9xaAhT5GD5zMbzXol5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="46945241"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="46945241"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 14:03:00 -0700
X-CSE-ConnectionGUID: U8JPGQcpTUa9d9ssiuHx+w==
X-CSE-MsgGUID: FLiBWwErTyigRc0WKesiaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="171885407"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 14:02:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 14:02:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 14:02:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 14:02:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBWn43Rbqg2rdwZYib1+C5f990n1DSvgPXnDrhASb2k2OSnIKoPbko/g/2R2y0iHmIFlazMt1hBT+FyE3qDSZUpPgQrbpihFD1w78k/c41OwIl2lkHnoQ17ZmGzcwzs4fZLnvwjyNRVPtEzNHjqRa+WHS8i8frN++zCNgD9wYotiTpV+Jx0u0JG5j4fuVJnNCt3jKGDJYmflFWxKnirE41HQ+W2BXGcqHOdigHpMGvBVAoZ6UZxqwvL9SQ2VoweKislNG8VVAh72c7++t9UxT2UPMtSvq7TjHps5tJkfoiHgmA8kr0Wg4TyVzadjMg2IwBcNpQwTX4PXxkLA3EgEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80bS0A9JC7qYJPSThaqUN6QNQltedOmuijJxUyr+py0=;
 b=I3zfPoGhS4URBp5LOTkvbBsbH2TTLWPhao1B/XdAaRyQxCusivF6rjtzyC/stQLS1/u4dQF4FbpTdZ/9jmdp0zC451qEIC1KiO0V5/GPXmCknFS15q0yo7Lx/jTsw04ESfKE8oSXCzW58ORa+a7tZ2QJTw61sGkEbGaetgaxOUXJoqEeaT/2G5uWFkSZwm/qwiXGooGWtlueBksXPPubZw1Y19UW1UfCw0sHMEDOjhZ3Lb3HssA73xmsofKF6wfLO7qSGzK8jBsMU1TL6XioHJrL1ipWZTpBMtUc9HK3569yqGJ5itGhakNcWLWKFstIv+6/rioE6GWmvoZpqLZOuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by CO1PR11MB5140.namprd11.prod.outlook.com (2603:10b6:303:9e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Thu, 4 Sep
 2025 21:02:51 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 21:02:51 +0000
Message-ID: <a75e8d62-9c18-4a13-ac6a-fa976fcc282f@intel.com>
Date: Thu, 4 Sep 2025 14:02:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_query: move PXP query functions to
 common file
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250819005622.2970399-3-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250819005622.2970399-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0001.namprd21.prod.outlook.com
 (2603:10b6:302:1::14) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|CO1PR11MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9f302d-fc90-49e4-baf7-08ddebf668bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WE11ZGlFU2FaRkVIaHgwZHVWYVdac0EyWGU0dVBKVDdwR0o2REdjZHNJV0Jh?=
 =?utf-8?B?WUZaMDZkU2VOZXF4SktvVDZmUmszcjk3b3lGanhuN2taeHdSR21mSllKek1o?=
 =?utf-8?B?VVkyRXdpT2xxei9SRHgrQXp5aEgzMHJZb25YdE1pVHZmVk9lR3BxWG5Hck5S?=
 =?utf-8?B?aGhYejh2U0hPQ3h2dW5rT2xUNlJVTDRoRUdraXZzYU1aQTNRYXlFRG8wYWNp?=
 =?utf-8?B?VXlVdEVRdk1kWU9SRXBmN0ZIb1Z5OGxmNkxHMjNTV3gzZ1hCOVJXZHRVei9v?=
 =?utf-8?B?STNMTGdRdjEzNjMyMFNZdUNlOWdqWnFNVHhlNU5zMjRUQ0h0ZFlPS0lvZ1RF?=
 =?utf-8?B?c3I2REJnVWdJUi9CTjJuUHBGKzlXRURSYWxjbHpqWGVKMC92Sk02NTZnR21p?=
 =?utf-8?B?eGdBUDhlR2RmcnVwS2tTWEM3L1NUOFhlQ3Jkd0Ivc3ZEWnhrZy9VVTAwODEv?=
 =?utf-8?B?dlNvQ0JLRmJvaGtDTUF0REhFb1loL1FkQ0w1Y09ja3duWUUvZTRmVHAwWEF2?=
 =?utf-8?B?S05NSVRZSVNucjFZNmY2cmNKc0huVFJOVmlHQVBwNCtuY2c1Znk3SkNrZUZN?=
 =?utf-8?B?dmpiT3B3YWd0UU1SZ3lNb2VWSkNZTm5CWkpnNzI3bXhySm1jcFdqbXQ5SWZx?=
 =?utf-8?B?Z2Qxb1MycE5PODJuSnZONFRrMmttODZWUmhBNkxDajVWUGlUVnA5dUxRM0cx?=
 =?utf-8?B?Y29vOHNjOHhPYUZiNEMzMDRxM0xBMytJem1FekdwT2hRT0NmZ05WeGF5bEVH?=
 =?utf-8?B?UFdzSzc1aGVSb01jMFNxb041SXM1M1ZaZk1BSm1zL1dSajRpNWJiOG9rRWd3?=
 =?utf-8?B?OW5zejJsYlFKNVZDZXE0WnRUczRaWFZDSi9JUDZqaWQ4T1YwaXYxeDVOanlH?=
 =?utf-8?B?TlRhcUI1czFiZVh0amFjTzJ5aDd6VW1mR3VpaFJsSjN0RUNMeGFPQWtvWDRM?=
 =?utf-8?B?eGZVWW04MCsxZ1dCd1ZsZGswckgzb3ZMUCs5R2lwMVZOcldDOXZyRHBwM0xs?=
 =?utf-8?B?TzJ5WjVlbkpOS25GQkNsYUV6eVh1d1BrS01QdG5zWkhVY2FqUCtyNWRacWhm?=
 =?utf-8?B?ZmVhaWZGQVg2SEZsZWt5OW8vZzdETlRmMlBIcGhCemVRa2trYThPM2x4RG56?=
 =?utf-8?B?ZXdGR1ErbW9jY0NNakFhOEh5VE5GdFFFelgzMGdJT0g1eWJwOUpoWUtEUGRC?=
 =?utf-8?B?UWs1RlhOOTM2aVVDcEIzNTlVdXdwQU1ZU2s3ZE5EbXh2K2ZTbC81U2lub0Vz?=
 =?utf-8?B?elpKNlByLy9scStjOVIzVGx0KzVYbU0rR0ZvVXF2blo3OHR3OXNBSnVkelhQ?=
 =?utf-8?B?TFZzbDUycDVhLzkrcGdEOEtBL2l5djd4ZVAxZXFtVVA5K3NlaGRtazJ1REJx?=
 =?utf-8?B?bkszMXdyMVlWQXp5SGF5ektMOXA5V0tRRVJZS05jekpnaWVBRGNKRlJ1ZFNP?=
 =?utf-8?B?ZFEwdCtVc0ZvRTNoays0WW1kYWs1V1VmRDhvMnNUU25ha3hVM2s5bkVqdzU4?=
 =?utf-8?B?N04wUi9FZURHZFRabmtCT2k3bDRDVnREZEtjdithRlF5SmFoWnRCVzd2ZlJr?=
 =?utf-8?B?L0VZd0VyRlhjYVY5dnc2dmw1d1ZjdUJWSjcvWnhRRkRjeWplekFuWmR3RUpy?=
 =?utf-8?B?ZXUrWWJJMVBydkZMODVPZUdibU42bmtqVGVHeUVTeC9RN3llbTRVbU5XUlpM?=
 =?utf-8?B?SUxTcXMrRWl4YVFxdldpeHI1NFQ3bHhudnEyYnVoQ1RjMnBBNEp0L3BvcHJT?=
 =?utf-8?B?ZjR3S3NDMTVHKzhDRndKdjg2Ui9GOWNSUllzUSt6ZDNlYTN5QXdMd29RVmpZ?=
 =?utf-8?B?WFVPblN5YW9EY0p2U25nMHRwQzZLaUExWlVKQWM0YU5rZ1gvcEcrR1Q3MkNT?=
 =?utf-8?B?eDY4amxGTmJXQUFraTltYXdTdGh3dGZISXBUNkhsQkZKVnRKUGVzSXRGdEln?=
 =?utf-8?Q?x5oEZ62r0Vk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlJFWG50OUZERytXK1dvOGVmMlh1a1VpZFo0a29PcE15MlFHcDh4WVc0dnhr?=
 =?utf-8?B?NXNqY0JVOEhOdWJkQWFjQzlYNS8renlrcWczdzc2SEMxQW5scS84aTNRWnJY?=
 =?utf-8?B?blhaUTBaUXFVcFc1MjBWMER4ZERodEJ6YjU3eGpyMDV5bEJLcTFIUS9saUc4?=
 =?utf-8?B?N29FYkVYR1VNL2Q1TmtJMXJ3Q2FaK1BmNTBTdkNpaVJueGo1V1J4TnVYQmlQ?=
 =?utf-8?B?dFI0L2tBQWxBSXZwdkQ3TEQ2UElMV1hPVDZtbDZNSDhDRWYyb0lEMXg0ZEwx?=
 =?utf-8?B?UjJsQ1hEZnE3MGxWNGN6Vkw1QkpLK3BtQnRubmRGZGNNRXMzQnAyRHlicEpO?=
 =?utf-8?B?K3V2TDExeEE0d1d5WHVqN3BhY1dHcW9PbmNLTHlibVFxTk5hSmJWU0wxSmdF?=
 =?utf-8?B?cUpFbXcxYVZlRGEyNkxXaWNNQXBpdHl5VDZlTXVVN01neU85M0IrN3Yyck80?=
 =?utf-8?B?SHBNa0VaMC9jYjR1aU11RU9oTlFnQmVZUXRqTUdtRUZ1Z041ZzNycW5nRnRI?=
 =?utf-8?B?MjVlM0tudTRianVuTXpobk9EakhreDdvUUgwSGlQVnQvQkJUaTdSbExsbUhX?=
 =?utf-8?B?bGZmSFhLVGV2c25uMDhTVlk1dWNEUldrMmlYN3owTm5VRmNwZHdzR2N6WERH?=
 =?utf-8?B?M1hBVThJVDg4VndVY2dTeGhBdG1ndnhYcWlmSk9hZkJVaW1aN1hOVCtoNG52?=
 =?utf-8?B?YlpTWjRFenRsa1hsYmc2bkt2ZFJENjhKdzFtUjVnb2J4Rk94QitRbXY2bjVh?=
 =?utf-8?B?RHhYZSs1cGUzRDE0VEJIM05KRjdxZURsbXVXWmdodWJuWFAwY3kvNXU0V3hK?=
 =?utf-8?B?NlBRNjQ2ZHd2VjJhQ3FHYmVLY2NGZDExNmhXNE11KzdLTEt6VHpkMFZkL0Ir?=
 =?utf-8?B?R2JQb1JDZXlUMGFvemVUNkhuSkowRjByOGxKMENiWWRYNjlDeHYvaUZNMld2?=
 =?utf-8?B?QXNwSWZPU1F4cStjREZYdExzSCtNK3hyVisya2piUGs2bWtFQ29TQllIdEp5?=
 =?utf-8?B?M05rQ0t1cTBJYnp3YVYzMkNIeTV6Y1BSRU1qWE1sQXo4ek1GZ1JjRlpsWjFi?=
 =?utf-8?B?Tk50cUdtSW1lSWVqaEtEajNYUXpxZkZiNnpoRXY4UnhpWnpGWDFHeUk5QStp?=
 =?utf-8?B?blFIWHNGUGFxVjNwUXlTVm8vQjhEUlRUem9PQUZ2c3ppOEJzS2NGbnRCS1JN?=
 =?utf-8?B?SmVnTk1pTEpnM255ZmxKYmRVUUFpdVg0Q1dBekZkOE44N01uU1R6QXR1bFZp?=
 =?utf-8?B?SzhvUU5VZG8xVXFEVUkvRDV4amdSaFVhclVuRVJZTzJCdHVOVkdKN0hRSXlM?=
 =?utf-8?B?UURrNjdyUUh1dUdNcmJUUHpQRWdJT1ZkbWFnMkt0SWtPOGRKazY1Q3pnSlBi?=
 =?utf-8?B?dk0xaXNjRHhSSms5aWloaThWVngvbGN0YTFSNzRKNVVsMlBybHNWell1OGl3?=
 =?utf-8?B?STdIcEh4MmttRGt0NlNRYWcxWkd1Y1ZvdjBPZG9Tai9ORmFFbmtGQVRjbm0x?=
 =?utf-8?B?eVl1RzN6SlNkeGQyMmtNWnlrRUtGTGZxazBNY2hmNW1maFJOSWhsS3NwSG9K?=
 =?utf-8?B?K1czUTRqa0UxN1lZSEExUVlzeEFvU0h2cHdXSXVYdDRzMk5zVW1qc2NOaGpC?=
 =?utf-8?B?OXhFSkRKby9XdzZLR2c5bW9HRVYvT2FaT25vYURSNk9TcUxZNUlPRis2d3Fl?=
 =?utf-8?B?cGdEcU8ydmxETGpCR1l4NXpGdnZXTmhGbVg1eXdLNkpPd1FkQzBWMFVEVnd0?=
 =?utf-8?B?Y1dUcFpGaUhKdjhjYkRManhKSXkxQUVMenlhVzNmSHVvQjFSOGlKQm5iT3FZ?=
 =?utf-8?B?THFyUEk0bHFqN3VETEFodU1ENHdVK3c2SjlsTDBjSHppT1FuenZ6U2gyNk9k?=
 =?utf-8?B?a25IQWtDclNIaUMxMXZHRi9GT01GR2djY1QrSit3bzJrVGpwcjVPVFVFKzJo?=
 =?utf-8?B?c24raFN3S1NRT2txM0hmVFlyUU5JeVBFRHVOQ0FWaWU1Y1BnalZxeGxDSCsw?=
 =?utf-8?B?VDlwL3F0dVZlampoUFRhM3AzTHR4alBSazRrOUV3Z0xZQ0hZN0plT21qanhj?=
 =?utf-8?B?MVdhcXJXODNyQVdxTXFRRE9OaTJuTllnUTJwVllmbjFQa0lqMHFSbVJYSTBU?=
 =?utf-8?B?SEhrUWFJNFErc2o4NTJnZ2YyQm1GQkV4cURhdis4NlZTcEt0YUE1b0tEWmo3?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9f302d-fc90-49e4-baf7-08ddebf668bc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 21:02:50.9721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CA4qmQwb7yFbt17XN+ArURF/H8LjBc5PoD8N69/fYGf7G3B4oj9DAeQ8ICkWXzfzHE/+kFXtB4D77oJ6fRyX/jYuod5e5FsMdYgkceXO7Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5140
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

On 8/18/2025 5:56 PM, Daniele Ceraolo Spurio wrote:
> We already have a few tests using the PXP query functions and a new one
> will be added in the next patch, so move the code to the common query
> file to reduce duplication.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   lib/xe/xe_query.c    | 81 ++++++++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_query.h    |  2 ++
>   tests/intel/xe_pxp.c | 61 +++------------------------------
>   tests/intel/xe_vm.c  | 13 +------
>   4 files changed, 88 insertions(+), 69 deletions(-)
>
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 3b8a682f8..920c20b06 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -996,6 +996,87 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32
>   	return NULL;
>   }
>   
> +/**
> + * xe_query_pxp_status:
> + * @fd: xe device fd
> + *
> + * Returns the PXP status value if PXP is supported, a negative errno otherwise.
> + * See DRM_XE_DEVICE_QUERY_PXP_STATUS documentation for the possible errno
> + * values and their meaning.
> + */
> +int xe_query_pxp_status(int fd)
> +{
> +	struct drm_xe_query_pxp_status *pxp_query;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_PXP_STATUS,
> +		.size = 0,
> +		.data = 0,
> +	};
> +	int ret;
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
> +		return -errno;
> +
> +	pxp_query = malloc(query.size);
> +	igt_assert(pxp_query);
> +	memset(pxp_query, 0, query.size);
> +
> +	query.data = to_user_pointer(pxp_query);
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
> +		ret = -errno;
> +	else
> +		ret = pxp_query->status;
> +
> +	free(pxp_query);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_wait_for_pxp_init:
> + * @fd: xe device fd
> + *
> + * Returns 0 once PXP is initialized and ready, -EINVAL if PXP is not supported
> + * in the kernel, -ENODEV if PXP is not supported in HW. This function asserts
> + * if something went wrong during PXP initialization.
> + */
> +int xe_wait_for_pxp_init(int fd)
> +{
> +	int pxp_status;
> +	int i = 0;
> +
> +	/* PXP init completes after driver init, so we might have to wait for it */
> +	while (i++ < 50) {
> +		pxp_status = xe_query_pxp_status(fd);
> +
> +		/*
> +		 * -EINVAL and -ENODEV are both valid return values and they
> +		 * respectively indicate that the the PXP interface is not
> +		 * available (i.e., kernel too old) and that PXP is not
> +		 * supported or disabled in HW.
> +		 */
> +		if (pxp_status == -EINVAL || pxp_status == -ENODEV)
> +			return pxp_status;
> +
> +		/* status 1 means pxp is ready */
> +		if (pxp_status == 1)
> +			return 0;
> +
> +		/*
> +		 * 0 means init still in progress, any other remaining state
> +		 * is an unexpected error
> +		 */
> +		igt_assert_eq(pxp_status, 0);
> +
> +		usleep(50*1000);
> +	}
> +
> +	igt_assert_f(0, "PXP failed to initialize within the timeout\n");
> +	return -ETIMEDOUT;
> +}
> +
>   igt_constructor
>   {
>   	xe_device_cache_init();
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index cc54ec956..32917991d 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -130,6 +130,8 @@ bool xe_has_media_gt(int fd);
>   bool xe_is_media_gt(int fd, int gt);
>   uint16_t xe_gt_get_tile_id(int fd, int gt);
>   uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
> +int xe_query_pxp_status(int fd);
> +int xe_wait_for_pxp_init(int fd);
>   
>   struct xe_device *xe_device_get(int fd);
>   void xe_device_put(int fd);
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index 9eddc03fc..98f06ae13 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -105,67 +105,14 @@ static uint32_t create_regular_rcs_queue(int fd, uint32_t vm)
>   	return xe_exec_queue_create(fd, vm, &inst, 0);
>   }
>   
> -static int query_pxp_status(int fd)
> -{
> -	struct drm_xe_query_pxp_status *pxp_query;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_PXP_STATUS,
> -		.size = 0,
> -		.data = 0,
> -	};
> -	int ret;
> -
> -	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
> -		return -errno;
> -
> -	pxp_query = malloc(query.size);
> -	igt_assert(pxp_query);
> -	memset(pxp_query, 0, query.size);
> -
> -	query.data = to_user_pointer(pxp_query);
> -
> -	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
> -		ret = -errno;
> -	else
> -		ret = pxp_query->status;
> -
> -	free(pxp_query);
> -
> -	return ret;
> -}
> -
>   static bool is_pxp_hw_supported(int fd)
>   {
> -	int pxp_status;
> -	int i = 0;
> -
> -	/* PXP init completes after driver init, so we might have to wait for it */
> -	while (i++ < 50) {
> -		pxp_status = query_pxp_status(fd);
> -
> -		/* -EINVAL means the PXP interface is not available */
> -		igt_require(pxp_status != -EINVAL);
> -
> -		/* -ENODEV means PXP not supported or disabled */
> -		if (pxp_status == -ENODEV)
> -			return false;
> +	int ret = xe_wait_for_pxp_init(fd);
>   
> -		/* status 1 means pxp is ready */
> -		if (pxp_status == 1)
> -			return true;
> -
> -		/*
> -		 * 0 means init still in progress, any other remaining state
> -		 * is an error
> -		 */
> -		igt_assert_eq(pxp_status, 0);
> -
> -		usleep(50*1000);
> -	}
> +	/* -EINVAL means the PXP interface is not available */
> +	igt_require(ret != -EINVAL);
>   
> -	igt_assert_f(0, "PXP failed to initialize within the timeout\n");
> -	return false;
> +	return ret == 0;
>   }
>   
>   /**
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 3ce54053c..90bd2722b 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -2177,18 +2177,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
>   
>   static bool pxp_interface_supported(int fd)
>   {
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_PXP_STATUS,
> -		.size = 0,
> -		.data = 0,
> -	};
> -	int ret = 0;
> -
> -	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
> -		ret = -errno;
> -
> -	return ret != -EINVAL;
> +	return xe_query_pxp_status(fd) != -EINVAL;
>   }
>   
>   /**

