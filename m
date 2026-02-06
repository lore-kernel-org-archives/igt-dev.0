Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4095AECD9BF
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 04:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0FE10E044;
	Fri,  6 Feb 2026 04:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c3CoEWWY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB87E10E044
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 04:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770353252; x=1801889252;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UH4gXmjsBn/oR2OOvh2SfqqGCGaivTN8FNGw3O5s5fA=;
 b=c3CoEWWYmXX42UFr3NmIGzRFyuLOIcJpy+dvF5lkvOtROSph5d+TIf67
 ZDN7GBkHPQJPdImdVqf2z3fFILsrevJzaXy9ekHixzq3UZGc3TRlQvvmG
 H0EPoZwdSkFI+vYWa991qgT+r+UwxNiBMW9SWu6IyjD9ah6IfWEPkx+WM
 Uuxhx0Jjfvk9a3dNIdI6G/crjjC2DPZfH6vqn0VI1kQ1yFnITYECeNULD
 bzXaOQOdGudA77dDUz9fvHAmzCXuAVze7sG49KRQ6gAuI1JmaoKUixOlr
 U7rXLo2GUvlnreVpeS9WidyVDrNEKJPI11FYyuA69zxwp8zJOXXvNk63N w==;
X-CSE-ConnectionGUID: L2zzI7kXSMafuZd4Ba9iiA==
X-CSE-MsgGUID: EbPjc9rQSXmdpyAQw51Xbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71453002"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="71453002"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 20:47:31 -0800
X-CSE-ConnectionGUID: KQOf7+DJQK+cUCKEl0C56Q==
X-CSE-MsgGUID: Q16BahsLRva93PNFAG36IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210045895"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 20:47:30 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 20:47:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 20:47:30 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 20:47:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMjuBvPwtV4E+1fICjgN8x+EdAkjUXJNQvDUVXa9gynmQBKBxRsEgneXJ23AvqqJQbQDxu5iFesxkmHi31emFlSoWTQLIKskG5ZnpSVnXhrel8VQa3E1iKuWkDnJ9+daXqPewnLgIY9+6+MrkE+DMTSrQSewSrZYtpF5zfOe4zi0rhZc9UtJRVatFf/LTQLkFuKXgkodF8PXQtP6auy5N/2+USJRb1R+leQGda4UduS8UfkuH1ALL4Zw5Ad5/oYGBFajb8d7k9A2hZwcsk+eYAYGYtJfMK3zdu24tXbgNuZwjozdr0QehLxmSzrO3G/rWMouERcPHNp9k6y+TKcFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwQMyAPtVTIh5SoCAH0LYpyS1TeUPjiz/48w/ovlymk=;
 b=OOOufxMwlkSO4e+EaD0c3AKHQmXbzdzEeHi+efyrwhSAhjAoPYuEV1/QXjraZQc085iGY/Q61gZZpjPa8WUwUEd8FSztcOrmEHTBJE9W6DuY3f6zepyxIN/Wo9UmaVJkutrUlXO98buw5zCIOdV4NKaAkRwvvJZGJ8RgK0rE1LTQ8p3biZiollWhfskoNAouI1Brn+tklxhRIGZI5WmTxxZGGKXjB9ZB4uyflLjT4knwr0+YCAqXrXHmrzFJGQVQQ8yAeSua7lgshvJsTAUSGaUytsUUOLMMFkXVQljI1DBO2oXzoZaMBUD/iscGuYmI/8CRawZpiBy96F2Af8ssrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:47:27 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85%6]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 04:47:26 +0000
Message-ID: <a3f52916-c20d-41ab-8455-3a26ee40ed52@intel.com>
Date: Fri, 6 Feb 2026 10:17:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_explict_fence: Add Test for Explicit
 Fencing
To: S Sebinraj <s.sebinraj@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <carlos.santa@intel.com>, <jeevaka.badrappan@intel.com>,
 <krzysztof.karas@intel.com>, <kamil.konieczny@intel.com>,
 <zbigniew.kempczynski@intel.com>
References: <20260121060909.2467562-1-s.sebinraj@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260121060909.2467562-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::16) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 53182f13-0cf3-4d37-6aba-08de653ad348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|42112799006|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czdQTUVoNzVVUU1TZ3kzSjZrM0FrczVnR0UyWHBUNzhwaDY2SWJlelE1dWR3?=
 =?utf-8?B?ZGlPZGFEWVRwVWtoelBrczNZSEVpa3JkM0VpZE1udWdFdTZOZmN2dkZIZ0la?=
 =?utf-8?B?YkVhZjlDVUtoUlh5RWIyczRIbyt6ZitTeFdNYWMxV1pjaGpPVjlxaERPSzgx?=
 =?utf-8?B?YnYrODE0aFk4SEpDSG50SWhoU1lyMjhRWE11Sy9adlczaEovMFBqQlkyczI1?=
 =?utf-8?B?eUJMK05XaFc5NjI5YjFTM0tkVEdxMHlXTWorRzFMNHc1RGYwTWlYd1B1Ynpl?=
 =?utf-8?B?NU4zTmVUZk5hSkMvU3RuNVNicDlUNmVkVTB1VHlFcUtraFd4WmowQmJUVkRI?=
 =?utf-8?B?Z1ZSVDZnKzFkNG1qalNYcUVKR29lTWpJSnhEUVQ3V2FEQS9MZXBqOFdSUDVE?=
 =?utf-8?B?NGJSRWJWS0VHUWltTVpFa3V0YzBoZTdBZ1c0RGM2aW9hV1oxcGhzVGR1Tnhu?=
 =?utf-8?B?aVZnSmp3UWNJclhRLzNzaG5tR2dtS0N1S3h4V1hCREJzUkdHZktyY200Y2FU?=
 =?utf-8?B?dWNCZHlLOUwwaFNFcFVUeUdRME1VSTFvNEF2S3MzdjY5a3F1UWYydTZPdDB4?=
 =?utf-8?B?RktPaGZKUE9IdUlDMTV3UWRPYkplSS8yVWVXcWRReXl2ZmVZRTVRVUdRN1pR?=
 =?utf-8?B?MW1XMzlvcDhwRkIxdEFiOGdzRy9KenVadW8xVk9wakZYTEFlZ2JOQ01oazZm?=
 =?utf-8?B?MVozdEFKd1RoUVk2cG94Ym01SkU2WDBsNkY3ZHNvdVBBR3VZc05MaTJtR0k5?=
 =?utf-8?B?R3FTd1QyU25IbW52UWYwTkNTVm40aEpiUFFYS1huMUt3WU4zemxHdlFiS0ww?=
 =?utf-8?B?VzhhcHpVay9GQ1MrczVQTkMyd1JlSWNCUnVPc2poQ2NhV1pQNzV2Sm5PckhU?=
 =?utf-8?B?cGNDZWxPQVhBSkdrQTlDcytnYWpyeUFib0tIdDRYanduL2dKOGw1RkMvc3Rj?=
 =?utf-8?B?eW14UjA4NTZXWlhxNk1zOEl4NEVYSnlVS1BjWjNFQWVqNkt5REVUclZTUHJ5?=
 =?utf-8?B?czBKZFZLMjdNeDBwMmtvQ3pKa05TQ3hqcEdaR01GOEhlUGF6RHBsZGdTdVJj?=
 =?utf-8?B?YkNDS2NDZUVPMEozNXdVNVF0UWw1VVhYV3RoVjhYc01EVHBtNjlRN1drU1Js?=
 =?utf-8?B?OFRDSE45K3JtS3BiVDBiVVErU2lCK2ZuVzJMaDZtV2FlRjE2eGZYSTYxUHNx?=
 =?utf-8?B?WjNST1orZDhMUGtvbEhScW5MODBDV3Y2M044endNTzlmdmRNdXB0Q3ZqUlEz?=
 =?utf-8?B?T0JvYXlJcTVlSm44Yi9ocHlmQmI3MUsvb3RnYWFRcjB3Z3lNMXNxYU5KMk9F?=
 =?utf-8?B?RWhadEZiN1F3YXhlb21kYWY4N3RKU04wcXB6RXl1RWc2UHZBQWtOWDA1Y2tr?=
 =?utf-8?B?MTd4YnBieENsMjc0UGVUdjU1RDNBRjg2bVU1TVVwQW9jdkEzdXhZNXJjdlhs?=
 =?utf-8?B?SGVsdGl1ditwVUZkK3Nkb2srVVhLOWxlRlllak9GRFFhK0lvNzNSaVZpRTJ2?=
 =?utf-8?B?aEVaVGYrQ29QNXRqT3Z3VWJBa2hIMnhTODA0cDN3UEVVMHhaQVRacVlyRDRZ?=
 =?utf-8?B?d2s5bUxSNE9Id3Z2K3AybjZlYmc3cUdLenJmSnZoblo4OHpvZ1JBdCtUcWxG?=
 =?utf-8?B?SG80bkI5NjBDZkJ1OG1yZTBaUEIwcVg0SmE0R0tKTkhXODlHR0JzTGkvbElv?=
 =?utf-8?B?MDJJRnB5THNsS0YwSmFHWTMzSDhXZHRGdWE1UWxraEFGaGZuMSs4cS8rb256?=
 =?utf-8?B?R0hNWUtmV2NPQ0tRLysvZGNaREoxT2lheWlZS1Z1YkF5TmszVm85U2Y4Nmk0?=
 =?utf-8?B?cmM4eTRIc01RSnJtY2VKRHVackdmSUNXMUZUZUU5NnFzcW9tS2xDT0Z0TVVI?=
 =?utf-8?B?TG00YWJmZE5JdmFIWlpBUm4yV3dwKzdjanNVQy8rb2JaSjhxV2VUb3VtYUNR?=
 =?utf-8?B?Y2JCK1NvUUNKcUo5K2xRV0VkY2ExUE9taDY5dllJeXdBQTVXdi9MaFRnb0Zo?=
 =?utf-8?B?eFJFcFhPSklFejEvaGhwZGpnSEkxZDNxQWRHMkZ3am5zNWhSaDU5S0Q3eURS?=
 =?utf-8?Q?dscMdv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWEzQzR5Y1RhVmxqWlltSkp1UVBXamxlVXB1WnB3Q0I1UG9kdWxlWlpkdDhF?=
 =?utf-8?B?NktKaWlab2hYZXZFanlMZ1NId2kvSElRZk9xVFlSZkxKRTdVamVMSm9KZjND?=
 =?utf-8?B?elllWFVsTWJXbHNOaFZBZmNUckFnVWY0TEljSG91aENLOTFTQlpiVjJUbGFu?=
 =?utf-8?B?KzMzKzlyWVB2WGtIMzRPQi83SnltbVloNXdnSmU5R3VDb3dZVzZidjRiOEpT?=
 =?utf-8?B?TWh0LytSYU9qQ2hEVlZJL0tNN0xSR0o4YUdyRU9va09MQTBySzQ0UFBBZG9x?=
 =?utf-8?B?bUVKa0VFL1BWTHFzMWZMeWIrRDQ0OWRDWXNEOGtMRFh2c3Frd3BNb3dqbE5O?=
 =?utf-8?B?eWQ0bEJ5dVdmaVlYaE9jZFJhT3QwOUZrdEhyMDdLOG8yRHowTFBtaWluRkhu?=
 =?utf-8?B?eUttUmhnUU1oNjlkdGhoTU8zZ1FPMHdObGVmYkFac0J0WEhxSDFERXhyeG1h?=
 =?utf-8?B?WFZkVVZQdVlVSHdZT3BaZ2hhTk9vVGtLVmxVT3E3ZTF5M1RDb1Z6V3g5Z0Uw?=
 =?utf-8?B?Y0tYQlJNMWJaYkRWTEN4VlpLOWc5SHJXR3ZNcXU5bWZUZVd5NCtNaTMvdmVu?=
 =?utf-8?B?RC9KM0UvK0RFNGVqcjRnUnNVU2g4THd1aDFaOGRZTTVBY0IyTWQ2NVFJYXZi?=
 =?utf-8?B?ZGFxdVFzVDVNN2lPK0pMNFRkSUh3UHBpeml0K24vS0VGdEhMS2pqNjByOGZS?=
 =?utf-8?B?L3B0bG5YRkR1aHJrNHFabW1sbXZ0TTFLbDFackFhWis3a0dZTGJENVhPTkpE?=
 =?utf-8?B?T0FOaEFLRmRPcTd4ZWVUYTlTWGJodDFJZHo3RjJqTUo5L2F5b1djZWdJUjQy?=
 =?utf-8?B?cXlRVXBTUDlPR3VySStjbjNVMFNPWTIwS2VBVWdvdHA4Zjd6dXBLZEMrYzd1?=
 =?utf-8?B?NEQ3Z3pWKy9GU3BxTktFWllxV2gvNlVPYXd2T0F5TS8xQTR3dVRVc2FMNk5W?=
 =?utf-8?B?NitlajI0aEdvUlU4UUdlYStIT2V3dDBxWUt2Snd2OGMrUnJhT1V0VnNxTjhO?=
 =?utf-8?B?NzNHQ3BRRUxOTG4xZUlvU3NjMk9UNWFZUDlNMXZNODBNUXNaems5ZXZDR3l1?=
 =?utf-8?B?T210d1czVmJJaW43ZmRBRGJId0xjdG83cXUvK1MyTWJHdFZ6TXNLY1ZEQVc4?=
 =?utf-8?B?MnZ1ampzRlNpc3pLNzRNQ2ZwMUxqeWtnTjBlb2JtU3dZdXZzZ0Mzb3VjZitE?=
 =?utf-8?B?SzBZenFoZU9iVnZPcXJyMVZyVHFTMGZFbktZakVnR0YzUVBiRC9jTWpUMm5o?=
 =?utf-8?B?elhvRkFPbVZkWmxXdnE4TkRmTjBJYmxDRlZ1QkJpU3FraktBZS9JVVFqMHo1?=
 =?utf-8?B?d1hqc2oyR0ZmN2dyL0Z1aElPY1lQc0Y3eWxlVFIyUy9kZ01LeUhpVnNPZ1dU?=
 =?utf-8?B?MmI2cWUwa3BKQkg0aUNBdWdiZ2pSWE5sckU2aVRmZlhIN2Y2UDErOE5pYmFN?=
 =?utf-8?B?MGJSQWx2S1ozZHBKRHk5ZmI1SWdxVDlETnFmTGNSYlovdkszVVJhTDMzMWhw?=
 =?utf-8?B?RGtEa3RObWNCWVpDYys3dUcxV0ptWElPemRMdjV5Y0l6Q2pYWnhuN0xhVlkx?=
 =?utf-8?B?ckFCamlQbFF6aHJMRjhHcmF0L0dwMG91c2QvcjhlT2d5WnU3eU1ZWVJ3Sm9O?=
 =?utf-8?B?aThsczBVdWkxTVBjMlhjSmJhMzBXSlU3bXc5SGphbTZnc2hIMWZ0ZUU2b3Zk?=
 =?utf-8?B?eTdHVWQvNE1tL1hDNVMxM3R3ZzNHS1dXRHhVbGs5ZzFvU2lmcDNCTDE5WHM3?=
 =?utf-8?B?UkkzRW9yR1NiQXl3RHBtTHMzMGRib0xBWTRzSDZrR1R3cG44ZEVDNmJTMVBS?=
 =?utf-8?B?M3JTQ1B2RFhjV3U0TGlkTXZrWGRuLzMzSHQvQTBHSVdWb3crS1lCZlRkUE5F?=
 =?utf-8?B?ZW9JVGNrMFk3MWgzdHFVNkduWks4SUNVYzByeVQyUjFKMnZUQjcyWE9FSFB2?=
 =?utf-8?B?dDE0WHlWblVvZlpaWjRGaitwS2Y4VWJ0djhtN2poUGRMRWdIeDh0b1RSdHNQ?=
 =?utf-8?B?QVR6aC9JdVBVenZwOW5VdVIwZldBNWZJM0xWTENEN2VVOVhFUVRQdkRGa09m?=
 =?utf-8?B?eGUvb2YyOFA4WkZES3RzdDV6Vk9XVkJWZkpKNmJZT3VWVGJBSUVSd1hLQUJL?=
 =?utf-8?B?anFFM3pSSFJCa0wxYytuVmpRQzJHMmhVK29GeGhCOXBlUVJObUJlQnBvcjVt?=
 =?utf-8?B?OXRCZ3V5UVRJVkhmU3l2VlcwQkkrdFBnMkRYRmlSZzMvZDZxUnNYV0RaejZk?=
 =?utf-8?B?Zmp2ekRza1dIN0dpVFRFK2l4c1ZvbXN0aVhaZi9LZ0NybGpkMDlmWFBIdXlJ?=
 =?utf-8?B?cDBoTEZ3WlZ0KzA0KytySkRmODNRNW1tQWpkV1poekRnK3NzSHlJdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53182f13-0cf3-4d37-6aba-08de653ad348
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:47:26.5817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UwH15Uw4gKLcHHpkhyy8ib1QbjRk567defvI0x0tE20QFsINDTngxhWbHTfu9QQzk/aljCod8uy2/xbUfK1EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
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

Hi Sebinraj,

On 1/21/2026 11:39 AM, S Sebinraj wrote:
> Add a new test to validate explicit fencing.
> This test handles multiple planes in a single atomic commit.
> This test addresses a critical scenario where drivers must correctly
> synchronize planes with mixed fence states.
>
> Test Scenario:
> - Creates three planes: one primary, two overlay
> - Attaches fences with different states:
>     - Primary plane:   signaled fence (simulating completed GPU work)
>     - Overlay-1 plane: signaled fence (simulating completed GPU work)
>     - Overlay-2 plane: unsignaled fence (simulating long-running GPU job)
> - Submits all planes in a single atomic commit with IN_FENCE_FD set
> - Validates that display waits for ALL fences before updating ANY plane
>
> Bug Detection:
> This test catches driver bugs where:
>   - Planes with signaled fences update prematurely before unsignaled
>     fences complete, breaking atomic commit semantics
>   - Fence states are mismanaged across multiple planes causing visual
>     glitches or corruption
>   - The driver fails to wait on all IN_FENCE_FDs atomically
>
> The test uses sw_sync timelines to create controllable fence states,
> allowing precise validation of fence synchronization behavior. An
> OUT_FENCE_PTR is requested to monitor when the display update actually
> completes, enabling detection of premature updates.
>
> Implementation Details:
> - Uses sw_sync for creating fences with controlled signaling
> - Monitors OUT_FENCE to detect premature display updates
> - Validates atomic commit integrity across multiple planes
>
> Background:
> - A bug regressed for Xe driver on PTL (Android) i915/display handling
>    of explicit fences when provided two or more buffers at once,
>    with 1+ already-signaled fences and 1+ not-yet-signaled fences.
>    https://patchwork.freedesktop.org/patch/662982/
> - Adding this test so that IGT contains sufficient testing for the
>    use of explicit fencing in the KMS Atomic Modesetting APIs.
>
> Changes:
> -v2
>    - Add crc check instead of visual inspection
>    - Reduce debug logging which are not needed
>    - Add a function for initial modset
>    - Make test not specific to Intel drivers alone
>    - Sort the included libs in alphabetical order
>    - Modify set_output func as we want only one
>      output per pipe
>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>   tests/kms_explicit_fence.c | 356 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   1 +
>   2 files changed, 357 insertions(+)
>   create mode 100644 tests/kms_explicit_fence.c
>
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
> new file mode 100644
> index 000000000..774f49c4a
> --- /dev/null
> +++ b/tests/kms_explicit_fence.c
> @@ -0,0 +1,356 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
License format is still not right, Please check.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +/**
> + * TEST: kms explicit fence multiplane
> + * Category: Display
> + * Description: Test explicit fencing with multiple planes and mixed fence states
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + *
> + * This test validates correct handling of explicit fences when multiple planes
> + * are updated in a single atomic commit with different fence states. This is
> + * critical for catching fence synchronization bugs where the driver might:
> + * 1. Prematurely display buffers with signaled fences before unsignaled fences complete
> + * 2. Mismanage fence states across multiple planes causing visual glitches
> + * 3. Fail to wait on all fences atomically before updating the display
> + */
> +
> +#include <errno.h>
> +#include <poll.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/eventfd.h>
> +
> +#include "igt.h"
> +#include "igt_aux.h"
> +#include "sw_sync.h"
> +
> +/**
> + * SUBTEST: multiplane-atomic-fence-wait
> + * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence states:
> + *              2 planes with signaled fences and 1 plane with unsignaled fence.
> + *              Validates that display waits for all fences before updating any plane.
> + */
> +
> +/* Test configuration macros */
> +#define NUM_PLANES 3
> +#define PLANE_PRIMARY_IDX 0
> +#define PLANE_OVERLAY1_IDX 1
> +#define PLANE_OVERLAY2_IDX 2
> +#define OVERLAY_COUNT (NUM_PLANES - 1)
> +
> +#define FENCE_TIMEOUT_MS 2000
> +
> +#define OVERLAY_SIZE_DIVISOR 3
> +#define OVERLAY1_POS_X 100
> +#define OVERLAY1_POS_Y 100
> +#define OVERLAY2_OFFSET 100
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	igt_plane_t *primary;
> +	igt_plane_t *overlay1;
> +	igt_plane_t *overlay2;
> +	struct igt_fb primary_fb;
> +	struct igt_fb overlay1_fb;
> +	struct igt_fb overlay2_fb;
> +	drmModeModeInfo *mode;
> +	int width, height;
> +	igt_pipe_crc_t *pipe_crc;
> +} data_t;
> +
> +static void setup_output(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +
> +	for_each_pipe_with_single_output(display, pipe, output) {
> +		data->primary = igt_pipe_get_plane_type(
> +			igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY);
> +		data->overlay1 = igt_pipe_get_plane_type_index(
> +			igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_OVERLAY, 0);
> +		data->overlay2 = igt_pipe_get_plane_type_index(
> +			igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_OVERLAY, 1);

Please fix the styling here. "OPEN_ENDED_LINE: Lines should not end with 
a '(' "

> +
> +		/* We need at least OVERLAY_COUNT overlay planes for this test */
> +		if (data->overlay1 && data->overlay2) {
> +			data->output = output;
> +			data->pipe = pipe;
> +			data->mode = igt_output_get_mode(output);
> +			data->width = data->mode->hdisplay;
> +			data->height = data->mode->vdisplay;
> +			return;
> +		}
> +	}
> +
> +	igt_skip("Need at least %d overlay planes for this test\n", OVERLAY_COUNT);
> +}
> +
> +static void cleanup_crtc(data_t *data)
> +{
> +	igt_display_reset(&data->display);
> +
> +	igt_remove_fb(data->drm_fd, &data->primary_fb);
> +	igt_remove_fb(data->drm_fd, &data->overlay1_fb);
> +	igt_remove_fb(data->drm_fd, &data->overlay2_fb);
> +}
> +
> +static void create_fbs(data_t *data)
> +{
> +	int overlay_width = data->width / OVERLAY_SIZE_DIVISOR;
> +	int overlay_height = data->height / OVERLAY_SIZE_DIVISOR;
> +
> +	/* Primary plane - Blue background */
> +	igt_create_color_fb(data->drm_fd, data->width, data->height,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 0.0, 1.0, /* Blue */
> +			    &data->primary_fb);
> +
> +	/* Overlay 1 - Red square */
> +	igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    1.0, 0.0, 0.0, /* Red */
> +			    &data->overlay1_fb);
> +
> +	/* Overlay 2 - Green square */
> +	igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 1.0, 0.0, /* Green */
> +			    &data->overlay2_fb);
> +}
> +
> +static void setup_initial_modeset(data_t *data)
> +{
> +	/* Initial modeset to establish baseline (no fences) */
> +	igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display, data->pipe));
> +	igt_plane_set_fb(data->primary, &data->primary_fb);
> +	igt_plane_set_fb(data->overlay1, &data->overlay1_fb);
> +	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
> +	igt_plane_set_fb(data->overlay2, &data->overlay2_fb);
> +	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
> +				data->overlay2_fb.width, OVERLAY1_POS_Y);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +/**
> + * multiplane_atomic_fence_wait - Test atomic commit with mixed fence states
> + *
> + * This test reproduces the critical scenario where multiple planes are updated
> + * in a single atomic commit with different fence states. The key validation is
> + * that the display does NOT update any plane until ALL fences are signaled.
> + *
> + * Test setup:
> + * - Primary plane: buffer with a signaled fence (already retired)
> + * - Overlay 1 plane: buffer with a signaled fence (already retired)
> + * - Overlay 2 plane: buffer with an UNSIGNALED fence (long-running operation)
> + *
> + * Expected behavior:
> + * - Atomic commit succeeds immediately (non-blocking)
> + * - Display waits internally for ALL fences before updating
> + * - No plane shows its new buffer until the unsignaled fence completes
> + * - After signaling the last fence, all planes update atomically
> + *
> + * Bug detection:
> + * If the driver has a bug, it will either:
> + * 1. Show the primary and overlay1 buffers prematurely (before overlay2's fence signals)
> + * 2. Cause visual glitches from fence mismanagement
> + * 3. Fail the atomic commit
> + */
> +static void multiplane_atomic_fence_wait(data_t *data)
> +{
> +	int timelines[NUM_PLANES];
> +	int fences[NUM_PLANES];
> +	int ret;
> +	int out_fence;
> +	igt_plane_t *planes[NUM_PLANES];
> +	bool should_signal[NUM_PLANES] = { true, true, false };
> +	igt_crc_t crc_before, crc_after;
> +
> +	igt_require_sw_sync();
> +
> +	setup_initial_modeset(data);
> +
> +	/* Setup arrays for loop-based processing */
> +	planes[PLANE_PRIMARY_IDX] = data->primary;
> +	planes[PLANE_OVERLAY1_IDX] = data->overlay1;
> +	planes[PLANE_OVERLAY2_IDX] = data->overlay2;
> +
> +	/* Start CRC capture to verify no premature display updates */
> +	igt_pipe_crc_start(data->pipe_crc);
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_before);
> +
> +	/* Create timelines and fences for all planes */
> +	for (int i = 0; i < NUM_PLANES; i++) {
> +		/* Create timeline */
> +		timelines[i] = sw_sync_timeline_create();
> +		igt_assert(timelines[i] >= 0);
> +
> +		/* Create fence at sequence 1 */
> +		fences[i] = sw_sync_timeline_create_fence(timelines[i], 1);
> +		igt_assert(fences[i] >= 0);
> +
> +		/* Signal fence (first 2 planes) */
> +		if (should_signal[i]) {
> +			sw_sync_timeline_inc(timelines[i], 1);
> +			igt_assert_eq(sync_fence_status(fences[i]), 1);
> +		} else {
> +			/* Do not signal this fence yet, 3rd plane */
> +			igt_assert_eq(sync_fence_status(fences[i]), 0);
> +		}
> +
> +		/* Attach IN_FENCE_FD to plane */
> +		igt_plane_set_fence_fd(planes[i], fences[i]);
> +	}
> +
> +	/* Swap overlay colors to detect scanout changes via CRC */
> +	igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
> +	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
> +	igt_plane_set_fb(data->overlay2, &data->overlay1_fb);
> +	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
> +				data->overlay1_fb.width, OVERLAY1_POS_Y);
> +
> +	/* Request OUT_FENCE to track when display update completes */
> +	igt_pipe_request_out_fence(igt_crtc_for_pipe(&data->display, data->pipe));
> +
> +	/*
> +	 * The atomic commit should succeed immediately (NONBLOCK mode),
> +	 * but the display should NOT update any plane until ALL fences
> +	 * (including the unsignaled overlay2 fence) are signaled.
> +	 *
> +	 * A buggy driver might:
> +	 * - Show primary and overlay1 immediately
> +	 * - Cause visual corruption
> +	 * - Fail the commit
> +	 */
> +	ret = igt_display_try_commit_atomic(&data->display,
> +					    DRM_MODE_ATOMIC_NONBLOCK,
> +					    NULL);
> +	igt_assert_eq(ret, 0);
> +
> +	/* Get the out fence to monitor completion */
> +	out_fence = igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd;
> +	igt_assert(out_fence >= 0);
> +
> +	/* Verify overlay2 fence (last one) is still unsignaled */
> +	igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 0);
> +
> +	/* Verify out fence is also unsignaled (display hasn't updated yet) */
> +	ret = sync_fence_status(out_fence);
> +	igt_assert_f(ret != 1,
> +		     "OUT_FENCE already signaled while overlay2 fence is unsignaled - "
> +		     "driver did not wait for all IN_FENCEs!");
> +
> +	/*
> +	 * Wait briefly and verify display hasn't updated via CRC check.
> +	 * In a buggy implementation, the display might update prematurely.
> +	 */
> +	usleep(100000); /* 100ms */
> +
> +	/* Check if out fence signaled prematurely */
> +	ret = sync_fence_status(out_fence);
> +	igt_assert_f(ret != 1,
> +		     "OUT_FENCE signaled before overlay2 fence - "
> +		     "driver updated display without waiting for all fences");
> +
> +	/* CRC verify - check if display has not updated prematurely */
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_after);
> +	igt_assert_crc_equal(&crc_before, &crc_after);
> +
> +	/* Now signal the blocking fence (overlay2) */
> +	sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
> +
> +	/* Wait for overlay2 fence to be signaled */
> +	ret = sync_fence_wait(fences[PLANE_OVERLAY2_IDX], FENCE_TIMEOUT_MS);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 1);
> +
> +	/* Now wait for the display update to complete (out fence signals) */
> +	ret = sync_fence_wait(out_fence, FENCE_TIMEOUT_MS);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_eq(sync_fence_status(out_fence), 1);
One more CRC check required here?
> +
> +	igt_pipe_crc_stop(data->pipe_crc);
> +
> +	/* Cleanup */
> +	for (int i = 0; i < NUM_PLANES; i++) {
> +		close(fences[i]);
> +		close(timelines[i]);
> +		igt_plane_set_fence_fd(planes[i], -1);
> +	}
> +	close(out_fence);
> +	igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd = -1;
> +}
> +
> +static void reset_display_state(data_t *data)
> +{
> +	igt_plane_set_fb(data->primary, NULL);
> +	igt_plane_set_fb(data->overlay1, NULL);
> +	igt_plane_set_fb(data->overlay2, NULL);
> +	igt_output_set_crtc(data->output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +int igt_main()
> +{
> +	data_t data = {};
> +
> +	igt_fixture() {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +
> +		setup_output(&data);
> +		create_fbs(&data);
> +
> +		data.pipe_crc = igt_pipe_crc_new(data.drm_fd, data.pipe,
> +						 IGT_PIPE_CRC_SOURCE_AUTO);
> +	}
> +
> +	igt_describe("Test atomic commit with 3 planes (1 primary, 2 overlay) "
> +		     "where 2 planes have signaled fences and 1 plane has an "
> +		     "unsignaled fence. Validates that display does not update "
> +		     "any plane until all fences are signaled, catching bugs "

IMHO, the part of describe after this redundant. May be we can stop it 
at 'signaled'?

Thanks and Regards,
Karthik.B.S
> +		     "where drivers might prematurely display buffers or "
> +		     "mismanage fence synchronization across multiple planes.");
> +	igt_subtest("multiplane-atomic-fence-wait")
> +		multiplane_atomic_fence_wait(&data);
> +
> +	igt_fixture() {
> +		reset_display_state(&data);
> +		igt_pipe_crc_free(data.pipe_crc);
> +		cleanup_crtc(&data);
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 0ad728b87..cc356610d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -36,6 +36,7 @@ test_progs = [
>   	'kms_dither',
>   	'kms_display_modes',
>   	'kms_dp_aux_dev',
> +	'kms_explicit_fence',
>   	'kms_feature_discovery',
>   	'kms_flip',
>   	'kms_flip_event_leak',
