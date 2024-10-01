Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF8CCE7CE6
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 08:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB8F10E578;
	Tue,  1 Oct 2024 08:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+3JBQ5Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B4D10E578;
 Tue,  1 Oct 2024 08:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727769615; x=1759305615;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=EtEADQXzdxwbhTrxaoJiPHWHhU0CnNy76BALgkmY0Co=;
 b=Z+3JBQ5ZQCcL9Em2V3ajuqC+5iWQS21GePL1v206rlWkBHv+l8q/9LHz
 7SfFV5p44pqtsSl/nCtoO3AFWJbhUoPJ+pc/CkvNlO19zMHSD0Xv824c5
 FZYfyLlHmPqvlfe9F/mRu1BBCPrG5J5CzHfZXZvjrBxodnUYxc8WaTMv3
 HMvNgyHPCEjQsbBVEpc41QsHUnkeTGD261smztCXTtW5DwHcrhEZG/QrI
 4wMejIahtpzubCw5TqBq9EdUfFM3Lz2VAhSvpxerw8r7HfkNiRG3OBXYw
 LUVFgHaJze/h9FD9d79b/toJySB8DhgOypP+96j844hYlA3IMy8VpDRnH A==;
X-CSE-ConnectionGUID: TAFIQtLoTWGBjIl7x/vG9A==
X-CSE-MsgGUID: H6dIrM5HQ4KsA1qK7L1SOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38248224"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208,217";a="38248224"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 01:00:15 -0700
X-CSE-ConnectionGUID: GVF8Vj3EQzS8Dnwj28stkA==
X-CSE-MsgGUID: zLq1nx6MR+m2UZbM3nMhXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
 d="scan'208,217";a="111054531"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 01:00:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 01:00:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 01:00:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 01:00:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQVjSll8UDj9yzgpSqe2nsEZmYSz+pKyrzyaVXuWnpyoo5OCaAfRtPQYUEsBCwgzhMQODuPXvTGBO/fQ+NsQL1GdXzSRBnA0TiSsOcEqOrKvFdbZJ987TqO8StNPlhH+XEHepWvt6OmHGYQ9PWKGm8n5CPIUcoTQh1og2+ao/pE4lP68FVnMhXYyJ35qqKQ30cAz8/hYyCtrFqT62DmzEoy6LSj1EAgAzIC97kqTbnNAcHI14OEqPSWL8++bkITu5Np9SdihzZaKhqVY8GqJ5ggbcCEPxDNWAjYCHs7Yx0ITCMkfsgA6RMNeBMlo5NzZXi0tq5pzRAcIPGSQrALEmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBITcQZszX7woqmK+XGLnRxCLhsE7x7CGMdDkOapgQk=;
 b=e8C2LjHce0TP6CNh+qABBFEwuIrH8SAimdneTCiCxUvU0iytMsm3tJM+WmtLK2wJ2jo7+vHJA+fGnZx0WCk1G3/riflQeKu8oXmO9UdjbnENAS1n/Yl51aAt1fKfhGwsw1pwhsn895XYJr5d1XAkzl2INBholSRoUiYrFMGTonFWuxtmyDgq5saC6dbl6ntfXB4c9mn/oxTVJYPeq5SDwaFNNW4ieKAEsclVfqZ/jbDCxqqeWN7wsz/omNMnBUHeAvCVfQ8uSwV5BBwnRYm1DAhW5NvZdnjYKJgY+LJvuo1bSTt9tDRQ5KWuZAvo38dagw1a4uMt0CYbpxzVpNv3/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SA2PR11MB4780.namprd11.prod.outlook.com (2603:10b6:806:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 08:00:10 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 08:00:10 +0000
Content-Type: multipart/alternative;
 boundary="------------yAnG2EWPrhlgUbWt5kKyeoR0"
Message-ID: <4f469a05-4240-4b05-b718-6031fadf6415@intel.com>
Date: Tue, 1 Oct 2024 13:30:03 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fpm=5Fresidency=3A_Add_an_assertion_on_MI=5FSTORE_execution_t?=
 =?UTF-8?Q?ime_=28rev3=29?=
To: <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20240924080357.1961472-1-karthik.poosa@intel.com>
 <172773063857.1139082.17328576828014201303@2413ebb6fbb6>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <172773063857.1139082.17328576828014201303@2413ebb6fbb6>
X-ClientProxiedBy: MA0PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::8) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|SA2PR11MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: 152456a5-11cc-4db6-5e47-08dce1ef124f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFBqcTFOZGg0QzBSaHRzeWVhdWwrTkR2d2NWeEowRVVsbGYxMlA4SERhbFJo?=
 =?utf-8?B?RnlVSnhMN01pYVJQQTZXOTk5N2RGbldGQ1o3anByTHpMZ3N5UmlGWmIzWEJL?=
 =?utf-8?B?Rk1hcmRIdG91ay9vVElyQTdhOWpnT1NFR3pENXZIbEFqQmxGN0xrMGkxeUFJ?=
 =?utf-8?B?QmNHVGs4YmZ5bVNTdmp1N3BXV0RWUWErT1c2dkVNZjZ2eEdpQ2ZWbWFDNHZn?=
 =?utf-8?B?QkJLQldtdmREeExDNVlmNGw3aldoa0M0eGM4TlA3MHcxdE1aanFjWU1rcjJL?=
 =?utf-8?B?cWNKR1drMVlSeDBNS1ZVSDBtMjB5cnY2dnduQ2NOSzFJRWE5QldjMGlUQi9a?=
 =?utf-8?B?ckVUWmhtU2JDNE1TWXJNMTFMS3BkMkR5S3Z4amRWdUdYa2RtaUcwU0xENk5J?=
 =?utf-8?B?ejIzVG9SOXhyeVQvc1dadVVxbHV2TWVRVVdJeU1YV3dFbVNFdC8zQ2VjNkFJ?=
 =?utf-8?B?YmRQb1hwVjgzdVQ2VGNLUmVUSWpjMTltd0grb1dqVEsxRytQZHZPYU5KV0Ey?=
 =?utf-8?B?b3VJc0laOVJxVUhOL1UvcEV4alhlMkFGN1RIRjV0bWZsZmcycmowd01WdkhT?=
 =?utf-8?B?ZktuSEFJR1pzSVJwKzIwVEpxYWp4R0dDVENzems3eVdKN2YzVW5CeWFrNlNM?=
 =?utf-8?B?dldtK2pLYW81eTZFdHNRYllCbXcyajRvZFNIUFNqNUlrQTZDVy9kb0ZocDNW?=
 =?utf-8?B?RGE5MjlTcm8vakd6S1hOalRWTHdpTUQ0Z0pIcEFxdUpST09UTm9oMHhBSGhx?=
 =?utf-8?B?UndKNXBRenlFZ3RSQzJ3bnZIWWZ5QkNQSkVoS3NXYnZISUFjNmtKbFd2dXIw?=
 =?utf-8?B?a3o2UzlyNWl0TDBqZU04clpPQmphbkZRVVNJSzVOdUE5ZXZVa00wclJVVEhm?=
 =?utf-8?B?cnlyblVtOEJEWm52aXBKWTJ6cGVNUXQ0Vy80S3RIVDcrOXlhUlBUZk54c2NE?=
 =?utf-8?B?L0hwY3ZLNy9aWkdHTzZPR1pmUzRSTXA4WTBLRTV2bEtucjJuQWk0dEZ4Mys5?=
 =?utf-8?B?NXltRTdKMGtzN0NQOTlsNEJUVjR1QldaMHY5aWZpZ2IxWHZwSUMwTHk4QU0w?=
 =?utf-8?B?N3M1bjhTa3M3S1lQWmN4TUNPeTlPRXFzSkRMbGxtWDc2UUdadTdkYk4yanZK?=
 =?utf-8?B?RmFNay8rQzVKK3hNWHFzRnh3bktlSE5McWpFU0ZWNjRzNzljRTNORWJmSmNC?=
 =?utf-8?B?Zy9GbGNlcm1ORjkzQ0EyS3NCUWZTRmw3dm1GRGUyK1l2VU5lVjk2L3lkanB2?=
 =?utf-8?B?QTFKeGxodG9tUGUzWWtzL3RLRlprS2RKM01jVjdWbjk5dmNwTE5YTzBGaTVW?=
 =?utf-8?B?SG56QjgvWlYvYWlTanNIYUxxWklVQWxOT3o2UmFNK1V6OVM1UmFoWmFxaytr?=
 =?utf-8?B?dnMwQzdSYnNCWlkvL2xRRXdvM0lQYWhxbXV6b3ZHeVR6TVB2WG0rVExFelJS?=
 =?utf-8?B?RUJrZlVRa24rbXQwcEh1czZVWG1kY1JENDZOTW5BRzV3ekxOYm5mM1lvRDM2?=
 =?utf-8?B?R0F1ck9rZ2VQWmNMckJJL1M0bEVEQm92UkhxQURHWE5ZWnhodG96UXZ5Ti9w?=
 =?utf-8?B?dFg2TWxFemtBVGdOcU1DQlVsUHBSZHl6SmZyelVCOHZRb1B2WW1BSTFzOFR4?=
 =?utf-8?B?REx6Y3J3L2xCZDdPNTNJYzF4ODVxQ2d6bXFYbXhKdFdic1VuUGRva1BNcUVI?=
 =?utf-8?B?MHVmdE5mblhQRGxIM1BHU3lJRi9GWmFRc0lPczBndU9NNXg4NVJpdjdyZzhi?=
 =?utf-8?Q?6sw9+GvwHBKypDbaCE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHB5cUk5YlUvdkF6RkVtVSt6YWV6VitHMW40eXZHNU5XY01vaUhWOXFMTU5N?=
 =?utf-8?B?S3ZzdDM3Q1FiZWxrbVdReHNKbGRZWElHSTRFdUloT2lmZVdWU3cvK3RVRkxs?=
 =?utf-8?B?RG5vNnU1MG4wM0llMCtyeEFQZmt6Und4THp0ckllSndoK2REWG9obzlsT2ZS?=
 =?utf-8?B?aTlVT1QwRlppelV1ZHFEVDBEMFE3N0tqTmxuSmIyMUxZTWpVK2I4U1draEtO?=
 =?utf-8?B?b1lVWmRDN1k3MnJLblZUNDY1a3VTa3pXMVhxVnBwYyt1KzJ2UHZRQU44UTZT?=
 =?utf-8?B?UlpxejhhRWFqMjdZWWdqdXZ2QjdXVnQxOStrVFQrVFZVQkZCZG9OMTJ2V0xh?=
 =?utf-8?B?aldIL1hoM2FvSHdlZmlzY1ZFem1JZ0t0OEpCTE9aK1NtVU51QXh1VGlQTXNi?=
 =?utf-8?B?aWZweUtaVEZLY2ZRYzVGN2RFTDhJbC9ucFhLVC9peXhMcE00bWhZOWVyRXJV?=
 =?utf-8?B?UUV1WDZEWVRCdDZJS2pNMFlZamVDSUVLekN4UGtCeFBUclJySlg0a2t3cmpW?=
 =?utf-8?B?aGVMQ3hvQ0JZb29abDBzOXBWb25MdzFaNGhMekY3VW9hQitWbTJQMG5YSndG?=
 =?utf-8?B?aDVFRGN6SnhyWVVnRWlxT1JOY0Y4bUs1VHArWDl5TlM5N1d0MXF1N1Y5eUR3?=
 =?utf-8?B?L1p2OUFLVEpiYUJkU0dpVndrdEVhSTBONjQrRFpIQWFrK0QwWHdJM0lvMm9h?=
 =?utf-8?B?M2ZiVnI0clkyODBBbVlpM2hRTGw0aWEzSzMzS1luS2xzWm1YcUFYNUFIZTNH?=
 =?utf-8?B?R2V1ZFlxeUtuK1BwckRZN1MwWU94VUZBdzNzcWVYL0xGVEdZSHE1MjlFUzFF?=
 =?utf-8?B?eUgvaWtVSEZZbmU3SnhtNHZONU5WUUV0UnlETzFEaldlTm5ZZ1JCQjNzWUdj?=
 =?utf-8?B?Z3pKcjFKb3djUlNYWjV6YWIwN0NKRWdIUkJYQVhXeDRmTXNVQTg1WVluUXJm?=
 =?utf-8?B?MGVkdnl6RHBnOXpxWUNtVkx5Z2ZSeitWcHFEZWRJanVsbW82OE8vc0Ira0Zl?=
 =?utf-8?B?eG9XcnUvTU1TWW9GYlB0Y3JneXhmNVZ0ekQ1UjFlSWl0b3hGaEh2U3ZBRWM0?=
 =?utf-8?B?SFdIRktoMTJqd3N2UUZzSzlYaFphZDZQYVZkZWhTaWR4SDJiZWg4ZVdHTzlt?=
 =?utf-8?B?RlllNUwwRitwSy9GNWZmTnB5N2pDZDhSSWx4azBvSmtESTJCSE9sNElta2pn?=
 =?utf-8?B?aisrRXZMcTN6THRFbWRKczB1UXpVQzBUL1VqTGx0Q0FXZTNxV3Z0VHZVZnRI?=
 =?utf-8?B?QUdEUkI2NElVYVhpY3o5aldrdnFBMUYyTkh3WE1IYTlPUUt6ZlFZUFhPbTIx?=
 =?utf-8?B?OWZyU083Z05Ha0h3Q0c1R1orZmJ2bEZhVExuK2F5WUNjbHBQV2Zsa2ltVnBN?=
 =?utf-8?B?NzRQUFgzbWNXQzFEakp6a1ZZMGJHRXdUdTM5eXBRRzdzOE1aVi9TZ1B4WTJQ?=
 =?utf-8?B?OCtFeFl1OEtIUXVTQ3FWSjNVczBvZTBQK2UrNzF5TmMvUkg0Z3JHRlU0eWh5?=
 =?utf-8?B?NlArQmgyV3hkblFmbjhrMTVTOXBVb2JCQmEwcEFCSmNCMWM0SE1kcFFhaTlJ?=
 =?utf-8?B?Y3VFSDl0eEI1RUpMNzgvakdTWmpZR2VXbGdaZFJiRTJNWnJqWjlZR2NlYmY3?=
 =?utf-8?B?NFY1dy9UM2M4Und5QkpCdTg5UG1NSzlxUVVSODArNmlvSkJpZ2xRSjJqUXds?=
 =?utf-8?B?dkc3TXIza2lhdmxYOTlYVlZRTGJsNmZrVDZUc3htVS9FdW84dHVucVVFL3Bu?=
 =?utf-8?B?UEllU2xmb2w3dVppUCt2aGRVT1dQM1d0dDQvK3drcWFPQm1SMVExZEp0TmlL?=
 =?utf-8?B?S21OVzBxR0I3MVRyZTZRVUw1Y1pDU1hJWTdTZlNkMTY4UklhSStHRXpUbVhu?=
 =?utf-8?B?ZHNJYWIvZ0hvZ1dmRW1EZkRvc0lwQ0Nqd2xnckphVHhRMGpDcFdLclhxRlJF?=
 =?utf-8?B?MnpMV3FRV2JmYzBEdUlrdUpPQUlwYXIralJYMkpxWHBXc0xCNEp4TVhEUTdK?=
 =?utf-8?B?TzhNVHEwcjlTNzROemtnR3hHT3p4cXJ0eVFpVDVZa3lueWJ4K05yUmxxK0JH?=
 =?utf-8?B?MXY4eEJxNXhrZzZtVUFGQmlxdUI0ZGpoME1TOWYrUWkyMEh0aTAyZHRDS3h1?=
 =?utf-8?B?LzhyTFFoQjRqVGtoeXJjbjhXSXMwcy9KcG96cmFkbjN6Y1JRKzBJTjZabmFm?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 152456a5-11cc-4db6-5e47-08dce1ef124f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 08:00:10.3916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oTCrwZfXzFh6X/gdth+ypu3eefTaLIDbuOPPEezWIk9ItE5pmgn6hTwvnbXxxW1wUu16SJvUx9/2G0zeUnTMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
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

--------------yAnG2EWPrhlgUbWt5kKyeoR0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi CI Team,

Failures reported by Fi.CI.BAT with IGTPW_11841 are unrelated to changes 
in the patch.

Please re-report them.

Thanks,
Karthik.

On 01-10-2024 02:40, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_pm_residency: Add an assertion on MI_STORE 
> execution time (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/139006/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/index.html
>
>
>   CI Bug Log - changes from CI_DRM_15461 -> IGTPW_11841
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_11841 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11841, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/index.html
>
>
>     Participating hosts (42 -> 42)
>
> Additional (1): bat-dg2-13
> Missing (1): fi-snb-2520m
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_11841:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@i915_selftest@live@active:
>       o fi-bsw-nick: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/fi-bsw-nick/igt@i915_selftest@live@active.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/fi-bsw-nick/igt@i915_selftest@live@active.html>
>
>
>     Known issues
>
> Here are the changes found in IGTPW_11841 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@i915_selftest@live:
>
>       o bat-mtlp-8: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/bat-mtlp-8/igt@i915_selftest@live.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-mtlp-8/igt@i915_selftest@live.html>
>         (i915#12216
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216>)
>         +1 other test abort
>       o fi-bsw-nick: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/fi-bsw-nick/igt@i915_selftest@live.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/fi-bsw-nick/igt@i915_selftest@live.html>
>         (i915#12172
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12172>)
>  *
>
>     igt@i915_selftest@live@gt_heartbeat:
>
>       o bat-arls-5: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-arls-5/igt@i915_selftest@live@gt_heartbeat.html>
>         (i915#11637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637>
>         / i915#12133
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133>)
>         +8 other tests dmesg-warn
>  *
>
>     igt@i915_selftest@live@gt_tlb:
>
>       o bat-arls-5: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-arls-5/igt@i915_selftest@live@gt_tlb.html>
>         (i915#11637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637>)
>         +21 other tests dmesg-warn
>  *
>
>     igt@i915_selftest@live@objects:
>
>       o bat-arls-5: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-arls-5/igt@i915_selftest@live@objects.html>
>         (i915#10341
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341>
>         / i915#11637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637>)
>         +2 other tests dmesg-warn
>  *
>
>     igt@runner@aborted:
>
>       o bat-dg2-13: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-dg2-13/igt@runner@aborted.html>
>         (i915#12292
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12292>)
>
>
>         Warnings
>
>  *
>
>     igt@i915_module_load@reload:
>
>       o bat-arls-5: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/bat-arls-5/igt@i915_module_load@reload.html>
>         (i915#11637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637>
>         / i915#1982
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-arls-5/igt@i915_module_load@reload.html>
>         (i915#11637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637>)
>  *
>
>     igt@i915_selftest@live:
>
>       o bat-arls-5: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/bat-arls-5/igt@i915_selftest@live.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>
>         / i915#12133
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-arls-5/igt@i915_selftest@live.html>
>         (i915#10341
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341>
>         / i915#12133
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133>)
>  *
>
>     igt@i915_selftest@live@workarounds:
>
>       o bat-arls-5: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/bat-arls-5/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-arls-5/igt@i915_selftest@live@workarounds.html>
>         (i915#10341
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341>
>         / i915#11637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637>)
>  *
>
>     igt@kms_pm_rpm@basic-pci-d3-state:
>
>       o fi-kbl-7567u: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html>
>         (i915#11621
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621>
>         / i915#180
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html>
>         (i915#11621
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621>
>         / i915#180
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180>
>         / i915#1982
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8043 -> IGTPW_11841
>
> CI-20190529: 20190529
> CI_DRM_15461: 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11841: 11841
> IGT_8043: 8043
>
--------------yAnG2EWPrhlgUbWt5kKyeoR0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi CI Team,<br>
      <br>
      Failures reported by Fi.CI.BAT with IGTPW_11841 are unrelated to
      changes in the patch.</p>
    <p>Please re-report them.</p>
    <p>Thanks,<br>
      Karthik.<br>
    </p>
    <div class="moz-cite-prefix">On 01-10-2024 02:40, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172773063857.1139082.17328576828014201303@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_pm_residency: Add an assertion on
              MI_STORE execution time (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/139006/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/139006/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_15461 -&gt; IGTPW_11841</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_11841 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_11841, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/index.html</a></p>
      <h2>Participating hosts (42 -&gt; 42)</h2>
      <p>Additional (1): bat-dg2-13 <br>
        Missing (1): fi-snb-2520m </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_11841:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@i915_selftest@live@active:
          <ul>
            <li>fi-bsw-nick: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/fi-bsw-nick/igt@i915_selftest@live@active.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/fi-bsw-nick/igt@i915_selftest@live@active.html" moz-do-not-send="true">DMESG-FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_11841 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@i915_selftest@live:</p>
          <ul>
            <li>bat-mtlp-8: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/bat-mtlp-8/igt@i915_selftest@live.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-mtlp-8/igt@i915_selftest@live.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216" moz-do-not-send="true">i915#12216</a>) +1 other test
              abort</li>
            <li>fi-bsw-nick: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/fi-bsw-nick/igt@i915_selftest@live.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/fi-bsw-nick/igt@i915_selftest@live.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12172" moz-do-not-send="true">i915#12172</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gt_heartbeat:</p>
          <ul>
            <li>bat-arls-5: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-arls-5/igt@i915_selftest@live@gt_heartbeat.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637" moz-do-not-send="true">i915#11637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133" moz-do-not-send="true">i915#12133</a>) +8 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gt_tlb:</p>
          <ul>
            <li>bat-arls-5: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-arls-5/igt@i915_selftest@live@gt_tlb.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637" moz-do-not-send="true">i915#11637</a>) +21 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@objects:</p>
          <ul>
            <li>bat-arls-5: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-arls-5/igt@i915_selftest@live@objects.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341" moz-do-not-send="true">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637" moz-do-not-send="true">i915#11637</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@runner@aborted:</p>
          <ul>
            <li>bat-dg2-13: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-dg2-13/igt@runner@aborted.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12292" moz-do-not-send="true">i915#12292</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@i915_module_load@reload:</p>
          <ul>
            <li>bat-arls-5: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/bat-arls-5/igt@i915_module_load@reload.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637" moz-do-not-send="true">i915#11637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982" moz-do-not-send="true">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-arls-5/igt@i915_module_load@reload.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637" moz-do-not-send="true">i915#11637</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live:</p>
          <ul>
            <li>bat-arls-5: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/bat-arls-5/igt@i915_selftest@live.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133" moz-do-not-send="true">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-arls-5/igt@i915_selftest@live.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341" moz-do-not-send="true">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133" moz-do-not-send="true">i915#12133</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@workarounds:</p>
          <ul>
            <li>bat-arls-5: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/bat-arls-5/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/bat-arls-5/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341" moz-do-not-send="true">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637" moz-do-not-send="true">i915#11637</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
          <ul>
            <li>fi-kbl-7567u: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621" moz-do-not-send="true">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180" moz-do-not-send="true">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11841/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621" moz-do-not-send="true">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180" moz-do-not-send="true">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982" moz-do-not-send="true">i915#1982</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_8043 -&gt; IGTPW_11841</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_15461: 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1 @
        <a class="moz-txt-link-freetext" href="git://anongit.freedesktop.org/gfx-ci/linux">git://anongit.freedesktop.org/gfx-ci/linux</a><br>
        IGTPW_11841: 11841<br>
        IGT_8043: 8043</p>
    </blockquote>
  </body>
</html>

--------------yAnG2EWPrhlgUbWt5kKyeoR0--
