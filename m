Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7040C5DF89
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 11:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5527410E284;
	Fri, 21 Aug 2026 11:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KT8P0hEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055F310E284
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 11:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787313235; x=1818849235;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=dU34DbK6VyXShOKE7tYrpueHezY2pWZb1EBCtr4omZ8=;
 b=KT8P0hEF7URB+3Vm8OQxRM69X2TUgEUbT43+DsYwX75SphOsTt9Yj4Sh
 MFifN6nQuKxSrx4p603rPM2fWVI1xkkPSfagw8Drr1FZIXCpkTlvjLZet
 F50bNfymH4Vab8AXUdH8M7WafrNl5nlMC4+RUbJbZe2d1XVhcQfWz7xlV
 Rchw01xW/9TtgYARRqKyIhjwG0OZBD6nIh20bbw+Olvbqew2Phfv52g58
 SCEaXhrwmSJrCDERMtKrY80gEBukMk5iX+ZOpR5iw6rLWuu8x2q+bV3yh
 bRLupVryz3SkXl6RTMT9P1kWoICkdAubp2auR233FeYGqB/7JE6TM8g20 w==;
X-CSE-ConnectionGUID: y+Aejc+lRQGq3/yD303DxA==
X-CSE-MsgGUID: k57nK9X0RZKImnkOjphwag==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87921029"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208,217";a="87921029"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:53:54 -0700
X-CSE-ConnectionGUID: hqlO8u8zRsWqK4K0pF67YA==
X-CSE-MsgGUID: Hk6cPcQYRYS1LB1Xr6oI+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
 d="scan'208,217";a="289854589"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:53:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 04:53:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 04:53:53 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 04:53:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSQG1j4W2uoLqqAuy4vNPpZvlZsZZZfWWfiVlGgLa9EzyGi+E+pytyplgphVBUmOIuWNcVv+sjaiV5/PzuX2100Ih8pyfDyR+0ksbtOQUx5Fltm9I03BQxSBN8I6hIZBVBA/g3iC33ZlsT/5Yl7m7N3ryYGfPEKwT5AW8M+A2OHDcl5/033hLmuUvhCBaJO7WtJojZtDOS7xpqbiaqFa3YBe9V/ue9TINBRskxbOlsn5ndV9eQ8EuV46mDxrQ/jrXdlGgT2L3b/RdunF7umKEtAGAZo66tGCkbQm1vUC8lLi64dbNDyr5oFOQYcZiBCQMhTrE6aEqBdc6sgels6v2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7F5YpvMPOMssiOF0IGRir9bXETOu/JQl9FJTIJq8VHY=;
 b=xnvNLJdQD+GksWkQdRjUZnoiXDSfGuqc2raO6Oiez0MU4Mk3qksXiwi25rU40hQV00LLw0HsWsTpIfp+hjwUlj6mc4PTLLv904FMsECSPxBzYHxEb4MRMbpU8r2citMjMWJeTGT5v5w8or9LG1Qi0/Pp+8Hx0V1URpnx0VUuhAwj93Moy8p4QIS5ni0pR5GD9INhLJPlIuOysEWcIFFkjTckBCQeBCmLtdo3BdNAoBvzx7JTkjy2w1gfOxMeTQVU/YHnLXkPudvcYfhJ0uZi40JaQxoPr0rzKeNggOKy6PSiXczB/q8UsFDMAjB8SJ5BOFP5BPtlPARFrHw0LQ6IMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by BN9PR11MB5305.namprd11.prod.outlook.com (2603:10b6:408:136::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 11:53:49 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 11:53:49 +0000
Content-Type: multipart/alternative;
 boundary="------------Q4O50UuHorRnXRscQWE0tGdu"
Message-ID: <9153e5e3-b8c0-415c-82b5-835a99507829@intel.com>
Date: Fri, 21 Aug 2026 17:23:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 6/6] tests/kms_color_pipeline: skip if not an
 intel device
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, Melissa Wen
 <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>, Alex Hung
 <alex.hung@amd.com>, Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler
 <arek@hiler.eu>, Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kernel-dev@igalia.com>, John Harrison
 <John.Harrison@Igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser
 <contact@emersion.fr>, Xaver Hugl <xaver.hugl@kde.org>, Uma Shankar
 <uma.shankar@intel.com>
References: <20260811143558.141813-1-mwen@igalia.com>
 <20260811143558.141813-7-mwen@igalia.com>
 <62e1b4a3-ba46-4117-a3e3-05f9866aa614@amd.com>
 <83fb4a66-cf7a-4ebb-be39-d3f51da4baa6@igalia.com>
 <9e390216-298b-45c5-9ca7-f8b65ae957da@amd.com>
 <4a5e0dea-1a44-4e5a-97c5-530e61a92ee3@igalia.com>
 <2216cc39-92a4-4472-93c9-96ac89b8d6d7@amd.com>
 <84512c69-f783-4ce8-ad7a-ab9f1d75de72@igalia.com>
 <210afacb-8486-43a5-865c-f52befda3231@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <210afacb-8486-43a5-865c-f52befda3231@intel.com>
X-ClientProxiedBy: MA5P287CA0112.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::15) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|BN9PR11MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad85b3d-62af-452c-03a6-08deff7adccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|23010399003|366016|22082099003|921020|18002099003|3023799007|56012099006|10067099003|4143699003|11063799006|6133799003|8096899003;
X-Microsoft-Antispam-Message-Info: n4cdf6VIjvVWMFu4rJQaruAi93xuzWNBINIAxJ22TXxxIs6/X5F3Tk1yi+JgVGbnYsa8zsF4uZX7494J98I5V5y9eZzpgKS41mRC9K2pGuTKWShg8TjfNgB/tvyDwIj/9ERz6J04WsGED4OpkQ6R8/4Tl8SksB2cWCclXhSTwNFszAtSbnnodK5CfJo5Tb1LkJcN1+umPy+L7LnI+AqH7e7XEpl2gd6bFN1Q+qRJgmtqkxMk+WHOWudawJLojzUYHQ3Ij+XXpGTCI3Z2y+gfCBr0BXpBl17Coc9aVIuEUgSYVdzNy0nlWW+98FXBALf7IJo2bG0FBABpV7STA+mYBqx+J/c9jFVTNGAGBvz0jl6uDl8f8Sc/IcPhM/PvpQ4ZRRJFaBqiJWvKAhzrqjl6ZHC1YCke1e2mp/zI4sd3/MR3pP+2tgGVh9PQjbUe48wCgsK8VlGnxJatppTK7iT0L1B78JSh4MLZYgcQn/6EsvQ8RkEpSc7TUvc36LIZMeFOl3FPdQ0DHNIS7BIcnxG0A3UmoH5mIDaAtplaa/LB1YSjw0Pvvkj3O0RjEP8EEyAhjJQBJeRt33QazJBwz+SlT/JGX2fPh1A2e+6FVKpIZ1BFdYiFUwfdAQjzkkvKAzMyNbP2jy4FOui/vsaCggMenor7sM1QKk6zcvWtwtw2rNj77811KDApkJ7thByRFcNr/TJ6AAcaGDZaoGJ+1nrpTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(22082099003)(921020)(18002099003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(6133799003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlkzYSthT1YxZG1SelUvTG5PWXBKcjcvMWdmNzNWdW5tNGF4U0VkdDhUYzFL?=
 =?utf-8?B?cU1DQ0xWdWdZdnRBd1VWaE1tNUxZTkxmK0xKRm5hakFJRHV0elF5c0JHRkhO?=
 =?utf-8?B?QTdsT2RqcFRkSzJ6YUtzRlBSaHdISHVNcDd0YjNlMy8xZFVSZEliSi9XcjZi?=
 =?utf-8?B?ZWtLWjVoZEF2VUUzV29DeG5uYUZYTW5pVkVoT2JjWFdJeDI1LzRCeVljUFQz?=
 =?utf-8?B?a0hmNVhCSFBXRktaTDVzSTNFNzFQcVFrQWNZT01CeG1STmM3S2FPM2NoemVP?=
 =?utf-8?B?dDBnQ2N0RVllK2E5cVlDTlo4dTV3NEhGVEdPZ1lGb3RlbHdpdjFMY2o5RU9M?=
 =?utf-8?B?cXU0MjEvQUtwZjdMM29nZ0R1dU1haVVBaUdocThDMjFxUlN5NW1uSEVhSFpa?=
 =?utf-8?B?czN1bERwa2RqcXdiWisrc1hONFhoblZqSGtsSVRzQkpPV3JoY1pvUWI2eVVR?=
 =?utf-8?B?Z2VxNnhpM2dTMXpzbDJaVFl5YkNOcUxyNllQRm03Y0dGSHJEK2xpWkhoTkZR?=
 =?utf-8?B?QkZiWmQrUWJqZy9oZVVrMzg5d1BrcnpSTXhDSFN5eFpDT21OZ1RyTGZHM21j?=
 =?utf-8?B?YUkrdDBlS2pnR2dzMmRHWUcyRC9jWFlmY2JyQnljbGhrencxeTlENGJIamNk?=
 =?utf-8?B?VGswS2hHY1piWTU0QWpKMkE2VlpkbmN3OXF6dFlYTXRwaHc5Q0JGNjBDKzZk?=
 =?utf-8?B?cG1tOVpiR1BodXFScXdrUTJ6d080VXQzdStMOVFFLzNxTyswVGNLUDNQLzhn?=
 =?utf-8?B?a01NNDZMSmphSUdyQ3JrOWErQlBrc2d3UVJJWk82YmdQaGRmNWwwcXN6NGd2?=
 =?utf-8?B?aWM2OVY0VVdnMlRNY2Q0ZUhUdlpMZnhqRVJma213UFZaNEpZb09zaWtOMU5R?=
 =?utf-8?B?bDN6d2VJMlZXZFRKMWtmOWR6VTBEMjdNT0VZY2M4YVZmWWQ2aDhFaFljSnha?=
 =?utf-8?B?UTh0U3NsUG1vR3NzVytMSW81RE5rZUsrM3NQS3ZRTjgxbll0YWN4V3c4ZFBa?=
 =?utf-8?B?NS9GaERjeWZoRElTanB0VjNseXpvSGxObk01R1pjcTczY0xnaXdRcVZTWkYw?=
 =?utf-8?B?L0U0MUVKblY3akg3VTNaY0Fma2Z3azVSMTJDd2V1R2hiZ3hJL09JQjFIWDNv?=
 =?utf-8?B?U2xBUERVV3JTMmQzWE8vVEE4Rm40T3pMQ1A0Mmp0YmlFRW5RR0ZZd0lsRWZr?=
 =?utf-8?B?N1l5cm9uYmNua25NaXJoaDl4Znc3Y1NtTGQyRDlFM2wwVFNmL09xVDhOUVcv?=
 =?utf-8?B?TXJqaUZ6Q1U1NytuYXUvY0dmQ2RnZzhUaDg3WEhqazBRWEZyZldsU1NyVGw2?=
 =?utf-8?B?WFZLenphODh6YmdVclBPeTVZbE9uY0xpZWdYbS9qcUQ0Q1RIT0dkQ09nMy9l?=
 =?utf-8?B?R1BLNTl5Z3B4anJxSkZsb0dzcjhSa1lyQW1GVVlXUzRoNTAvMGxoZ0lyYzcw?=
 =?utf-8?B?Nit6K2tRRERhelQxSXJMQ1ZWMDRMTzVGczZCK1d3STcwMGg0QWRZWmtZSGhu?=
 =?utf-8?B?TUVyRG9aSlU2WWkwM1VIeWdET1IvUGM1N1pNR21ZYkNJanUvaVZoRlhlOEg1?=
 =?utf-8?B?eDZxUEdYQU5GM2hVOUdHcWJQV3dFL2wvYzlxVkNYNm1kVk9JeGQwZTdwTC9B?=
 =?utf-8?B?Q2JPbWlKejR4MGdUczkvZkx3dWRQTC90Wk80Q1MxWUhkWDhjbDNmU1c0Z3JM?=
 =?utf-8?B?TTB6NGFTc2d5c3lHMU9mbDkyZGpYSnFVeGNPcmRKc2RKSnB5cW00UEpWRVEr?=
 =?utf-8?B?bTRCTXNVV2pYOWhxYkc4K2wrdzlIWFR1bzZHMDl5Ni9ZYmxxN2VONXUzZGlk?=
 =?utf-8?B?b2cwa05ha1djNUxveWRKZEg4Rko4YXo3TE13Tlh5TTd0c3VyNG93T0VWdTRG?=
 =?utf-8?B?SmpubTNtTzRKUlNoSnlwZXErWi9BNmxqZ2EyQXBCM3ExRDhNQmlRZVFOdnB1?=
 =?utf-8?B?L1BSRVdwaFB2d2VLZk1IZEtoSTBOOE4xVmNxTS94aGxFRkdRYTdTTUJ2K01T?=
 =?utf-8?B?UDRUNjl1VmpoTG9zTE9ucXhjcGpSbFViSnlob3U5U2UxNjFvWHh0Zlk4NHhR?=
 =?utf-8?B?eldwUCtxcnRiME5yVGE5a1FhZGtpZkVsd1ZPR3dQTHpLNTFqMjVFRG1UQVdJ?=
 =?utf-8?B?WUdZT3NMS3BQZmhMbzV5YUNOMXB3b05tN3MxWjBpV0pQcUdYWnorTSt3aUdU?=
 =?utf-8?B?WE0vNjJWd09mZ0Y3SVo5WDlJa2JycUo3a0wzWjg1RzNITnp1enJLMHBFTlVi?=
 =?utf-8?B?azEvTHVyWENmdnAwT21MVjJQbCt0cmNPUU9WQlRFcXA5L28zYXVKRmxGK0VX?=
 =?utf-8?B?bEVvSmh4ckZPQ1NETmVXNFlXNmtqUDdiclpoZjZ4NTBEVEZNNVJ3QT09?=
X-Exchange-RoutingPolicyChecked: YmayhRhO27foaTH04LL3tpAZ+d7Gb82fHzvXnnbksylKtOJfv2fY33/G894APFgZhDduDVroBUMmjfe7gaLDUGUhLS+V/p/cY30y7tvGvvFJQb55/CdYDrSwVjNtgJSWuhipyFFWwzTIbsi0Z0zy9nyQFeunWjkQ+MxVi2uoLfRxcQOYU5W1dqvSqoFcOHcW6Ost5dQUDXZsl33y+xq+/BnJhxZnHOY1bP0q27cnOgni5PMrtQJ6IINGgrAe33OuAkIPDdsXxI9Ddv/dZIPoHqzVdI6QRo3n20M8n2y6GpzgJvav78DecWWDWlWRJDzarrR9JwVHTG6nW55RZ6SeSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad85b3d-62af-452c-03a6-08deff7adccb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 11:53:49.0208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWYFxQJolMGL79t5KlItqCwT7bDCXoF8+NNb2ajhA8Dk31pU5dJ1JTPI2wdVYv8ORKgtjqQxxzQBshGyeaatig==
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

--------------Q4O50UuHorRnXRscQWE0tGdu
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 19-08-2026 10:54 am, Borah, Chaitanya Kumar wrote:
>
>
> On 8/18/2026 8:20 PM, Melissa Wen wrote:
>>
>>
>> On 18/08/2026 16:30, Harry Wentland wrote:
>>>
>>> On 2026-08-18 09:54, Melissa Wen wrote:
>>>>
>>>> On 17/08/2026 17:39, Harry Wentland wrote:
>>>>> On 2026-08-17 11:19, Melissa Wen wrote:
>>>>>> On 14/08/2026 05:55, Alex Hung wrote:
>>>>>>> On 8/11/26 08:23, Melissa Wen wrote:
>>>>>>>>    From documentation, the test requires i915 or xe driver, so 
>>>>>>>> make sure it
>>>>>>>> only runs with intel devices. In addition, it's a CRC-based 
>>>>>>>> test, making
>>>>>>> Should this test be moved to tests/intel/?
>>>>>> I kept it as a KMS test because kms_colorop relies on writeback 
>>>>>> support, but writeback isn't present in many drivers AFAIK.
>>>>>> So these CRC tests can be used by other drivers if they don't 
>>>>>> support writeback but support colorop.
>>>>>>
>>>>> In that case the test shouldn't have an 
>>>>> igt_require(is_intel_device...). It should
>>>>> use a generic check to determine whether it runs or not.
>>>> What would be this generic check? Something like "CRC support && ! 
>>>> writeback"?
>>>>
>>> Something like that might make sense.
>>>
>>>> I took this `is_intel_device` path because on one hand I think the 
>>>> test could be an
>>>> alternative to other drivers that doesn't support writeback, on the 
>>>> other hand I see
>>>> that the current design is not generic enough and I can't ensure it 
>>>> runs well in
>>>> other drivers - for example, rn it doesn't meet AMD's requirements.
>>>>
>>>> My reasoning was: "the test with writeback support is preferable 
>>>> (kms_colorop); if your
>>>> driver doesn't support writeback, work on the kms_color_pipeline 
>>>> test to meet the
>>>> requirements of your driver".
>>>>
>>>> I can check how it goes with VKMS and what's needed to make it run 
>>>> on AMD (probably
>>>> the active primary plane is missing here too). I just don't think 
>>>> those drivers need
>>>> kms_color_pipeline since they support writeback and color tests 
>>>> work better by
>>>> checking writeback output instead of CRC.
>>>>
>>> I'm just tired of seeing is_intel_device in "generic" tests. I guess 
>>> that's
>>> why Alex suggested moving this to tests/intel. One could always move 
>>> it back
>>> to generic tests if another driver sees value in this test and 
>>> actually makes
>>> it generic.
>>>
>>> I don't think a CRC-based color test would work well on AMD, and 
>>> it'll likely
>>> have challenges with VKMS.
>>>
>>> Again, not a blocker, just a statement about "IGT hasn't been 'Intel
>>> GPU Tools' for years", which is sort of true and sort of isn't. It's 
>>> a bit
>>> painful for parties that decided to use it that are not Intel.
>>
>> Hi Harry,
>>
>> I see what you mean.
>>
>> I can add the generic check plus a debug message, but I agree with 
>> you that
>> migrating to intel and only making it generic if there is interest 
>> from other
>> vendors is also a good path. So far, my reasoning about the relevance 
>> for
>> drivers without writeback support is purely hypothetical.
>>
>> Chaitanya, what do you think?
>
> I think moving it to the intel folder makes the most sense.
>
> Swati, do you see any issues for our CI or otherwise?

No, moving |kms_color_pipeline| to the Intel directory should be safe.

>
> ==
> Chaitanya>
>> Melissa
>>
>>>
>>> Harry
>>>
>>>> Melissa
>>>>
>>>>> Harry
>>>>>
>>>>>> Melissa
>>>>>>
>>>>>>>> kms_colorop with writeback more aligned with color testing and
>>>>>>>> validation. Other drivers should work on adapting this test to 
>>>>>>>> their
>>>>>>>> needs if they are looking for CRC validation.
>>>>>>>>
>>>>>>>> Reviewed-by: Chaitanya Kumar Borah 
>>>>>>>> <chaitanya.kumar.borah@intel.com>
>>>>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>>>>> ---
>>>>>>>>     tests/kms_color_pipeline.c | 1 +
>>>>>>>>     1 file changed, 1 insertion(+)
>>>>>>>>
>>>>>>>> diff --git a/tests/kms_color_pipeline.c 
>>>>>>>> b/tests/kms_color_pipeline.c
>>>>>>>> index 78860a845..3978745a5 100644
>>>>>>>> --- a/tests/kms_color_pipeline.c
>>>>>>>> +++ b/tests/kms_color_pipeline.c
>>>>>>>> @@ -372,6 +372,7 @@ int igt_main()
>>>>>>>>             igt_display_require(&data.display, data.drm_fd);
>>>>>>>>             data.display.has_plane_color_pipeline = 
>>>>>>>> has_plane_color_pipeline;
>>>>>>>>             igt_require(data.display.is_atomic);
>>>>>>>> +        igt_require(is_intel_device(data.drm_fd));
>>>>>>>>         }
>>>>>>>>           igt_subtest_group()
>>
>
--------------Q4O50UuHorRnXRscQWE0tGdu
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 19-08-2026 10:54 am, Borah,
      Chaitanya Kumar wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:210afacb-8486-43a5-865c-f52befda3231@intel.com">
      <br>
      <br>
      On 8/18/2026 8:20 PM, Melissa Wen wrote:
      <br>
      <blockquote type="cite">
        <br>
        <br>
        On 18/08/2026 16:30, Harry Wentland wrote:
        <br>
        <blockquote type="cite">
          <br>
          On 2026-08-18 09:54, Melissa Wen wrote:
          <br>
          <blockquote type="cite">
            <br>
            On 17/08/2026 17:39, Harry Wentland wrote:
            <br>
            <blockquote type="cite">On 2026-08-17 11:19, Melissa Wen
              wrote:
              <br>
              <blockquote type="cite">On 14/08/2026 05:55, Alex Hung
                wrote:
                <br>
                <blockquote type="cite">On 8/11/26 08:23, Melissa Wen
                  wrote:
                  <br>
                  <blockquote type="cite">&nbsp;&nbsp;&nbsp;From documentation, the
                    test requires i915 or xe driver, so make sure it
                    <br>
                    only runs with intel devices. In addition, it's a
                    CRC-based test, making
                    <br>
                  </blockquote>
                  Should this test be moved to tests/intel/?
                  <br>
                </blockquote>
                I kept it as a KMS test because kms_colorop relies on
                writeback support, but writeback isn't present in many
                drivers AFAIK.
                <br>
                So these CRC tests can be used by other drivers if they
                don't support writeback but support colorop.
                <br>
                <br>
              </blockquote>
              In that case the test shouldn't have an
              igt_require(is_intel_device...). It should
              <br>
              use a generic check to determine whether it runs or not.
              <br>
            </blockquote>
            What would be this generic check? Something like &quot;CRC
            support &amp;&amp; ! writeback&quot;?
            <br>
            <br>
          </blockquote>
          Something like that might make sense.
          <br>
          <br>
          <blockquote type="cite">I took this `is_intel_device` path
            because on one hand I think the test could be an
            <br>
            alternative to other drivers that doesn't support writeback,
            on the other hand I see
            <br>
            that the current design is not generic enough and I can't
            ensure it runs well in
            <br>
            other drivers - for example, rn it doesn't meet AMD's
            requirements.
            <br>
            <br>
            My reasoning was: &quot;the test with writeback support is
            preferable (kms_colorop); if your
            <br>
            driver doesn't support writeback, work on the
            kms_color_pipeline test to meet the
            <br>
            requirements of your driver&quot;.
            <br>
            <br>
            I can check how it goes with VKMS and what's needed to make
            it run on AMD (probably
            <br>
            the active primary plane is missing here too). I just don't
            think those drivers need
            <br>
            kms_color_pipeline since they support writeback and color
            tests work better by
            <br>
            checking writeback output instead of CRC.
            <br>
            <br>
          </blockquote>
          I'm just tired of seeing is_intel_device in &quot;generic&quot; tests. I
          guess that's
          <br>
          why Alex suggested moving this to tests/intel. One could
          always move it back
          <br>
          to generic tests if another driver sees value in this test and
          actually makes
          <br>
          it generic.
          <br>
          <br>
          I don't think a CRC-based color test would work well on AMD,
          and it'll likely
          <br>
          have challenges with VKMS.
          <br>
          <br>
          Again, not a blocker, just a statement about &quot;IGT hasn't been
          'Intel
          <br>
          GPU Tools' for years&quot;, which is sort of true and sort of
          isn't. It's a bit
          <br>
          painful for parties that decided to use it that are not Intel.
          <br>
        </blockquote>
        <br>
        Hi Harry,
        <br>
        <br>
        I see what you mean.
        <br>
        <br>
        I can add the generic check plus a debug message, but I agree
        with you that
        <br>
        migrating to intel and only making it generic if there is
        interest from other
        <br>
        vendors is also a good path. So far, my reasoning about the
        relevance for
        <br>
        drivers without writeback support is purely hypothetical.
        <br>
        <br>
        Chaitanya, what do you think?
        <br>
      </blockquote>
      <br>
      I think moving it to the intel folder makes the most sense.
      <br>
      <br>
      Swati, do you see any issues for our CI or otherwise?
      <br>
    </blockquote>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">
        <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
        <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">No,
          moving <code>kms_color_pipeline</code> to the Intel directory
          should be safe.</div>
      </div>
    </p>
    <blockquote type="cite" cite="mid:210afacb-8486-43a5-865c-f52befda3231@intel.com"><br>
      ==
      <br>
      Chaitanya&gt;
      <br>
      <blockquote type="cite">Melissa
        <br>
        <br>
        <blockquote type="cite">
          <br>
          Harry
          <br>
          <br>
          <blockquote type="cite">Melissa
            <br>
            <br>
            <blockquote type="cite">Harry
              <br>
              <br>
              <blockquote type="cite">Melissa
                <br>
                <br>
                <blockquote type="cite">
                  <blockquote type="cite">kms_colorop with writeback
                    more aligned with color testing and
                    <br>
                    validation. Other drivers should work on adapting
                    this test to their
                    <br>
                    needs if they are looking for CRC validation.
                    <br>
                    <br>
                    Reviewed-by: Chaitanya Kumar Borah
                    <a class="moz-txt-link-rfc2396E" href="mailto:chaitanya.kumar.borah@intel.com">&lt;chaitanya.kumar.borah@intel.com&gt;</a>
                    <br>
                    Signed-off-by: Melissa Wen <a class="moz-txt-link-rfc2396E" href="mailto:mwen@igalia.com">&lt;mwen@igalia.com&gt;</a>
                    <br>
                    ---
                    <br>
                    &nbsp;&nbsp;&nbsp; tests/kms_color_pipeline.c | 1 +
                    <br>
                    &nbsp;&nbsp;&nbsp; 1 file changed, 1 insertion(+)
                    <br>
                    <br>
                    diff --git a/tests/kms_color_pipeline.c
                    b/tests/kms_color_pipeline.c
                    <br>
                    index 78860a845..3978745a5 100644
                    <br>
                    --- a/tests/kms_color_pipeline.c
                    <br>
                    +++ b/tests/kms_color_pipeline.c
                    <br>
                    @@ -372,6 +372,7 @@ int igt_main()
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_require(&amp;data.display,
                    data.drm_fd);
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.display.has_plane_color_pipeline =
                    has_plane_color_pipeline;
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(data.display.is_atomic);
                    <br>
                    +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(is_intel_device(data.drm_fd));
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
                    <br>
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_group()
                    <br>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------Q4O50UuHorRnXRscQWE0tGdu--
