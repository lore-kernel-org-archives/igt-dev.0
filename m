Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF63A1093182
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 07:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D06010EA28;
	Fri, 20 Mar 2026 07:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jVDaS4Ck";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EBA10EA28
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773992510; x=1805528510;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vbzINBQfXfFcI7TMU5I1JvVUuMVb09kqq+d5ldTrPhA=;
 b=jVDaS4Ckv4xFlHw2RMPESLO+0sOcHyTiHbyonY6nCQjKBL6xNkH1rEv2
 7APsaaed9zyx94xfrj0EajjqphNrCRev6RhjEtqGUkJfc7fQhS7sjWU6a
 Zaq4Fa8/ksghAeuCLeaO79om3CpUN8dVZkdyaPFP0gsnnw/R81TKnS4vz
 K+eg9/u65FHu0OuBm3YWHDBsn5SUlbRUvm3DrMZIVMVGZWh6tPXStLv1y
 bTfCh9UfVPhaFP24UVYfCMDef7FjuxWsHF9UBRWh95J38fvSihviieOOS
 q9S/GYdiAhACK0Ii47ib0b6O3zd7KbT05nqSOhGNlUuUl5XHjbYDUmWqd w==;
X-CSE-ConnectionGUID: HOl05vAjRKKYcWxeUqkZsA==
X-CSE-MsgGUID: TbGS0IIvRf+W6n2BQfftHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="97690108"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="97690108"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:41:50 -0700
X-CSE-ConnectionGUID: mCGqqWYtRSuTtS8gOhIPTg==
X-CSE-MsgGUID: iXe7Jjc8Seqgjks5sIAbmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="247368063"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:41:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 00:41:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 00:41:48 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 00:41:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6Chn/93dIi9GjakLrq87egi7C+mgBCwQRdHtwIkm2EGkA6bIWX3ogNXKbs6ijN8PSuaGHvh4y1gFIAmxhlH0F1vKvxMxS4giXR4/p7PX7Qh+J+RCnRRpLNUoVfeGj4ABXiNxvFEHCW/MqVucEl3Sprk3+q44tYiHQIWIg4+X6oo4Pcrc1jPnZnI/TlP/Zgr6x407NTfW6GgRwdlCcaezz7ICtb3M3BkB7E6HeSSgIiEsAHeGQWQHy/s1qGX7QpQ0BEib4Bgn1i/oODvdM8AWutd/Mj8S3bvQKP9om0wW+dkWJz+1GVK6ewJYItft55t9A/Dc++JxpTrCDNMiTwM8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTVqLqniLxhbTzdSoQoPANNyJakcnKz6qmHsAM+OTyQ=;
 b=dUbd+UKaaq1yaEuD+0b2z242txi55q/Ok+AmdHZU9Sue07jlBTzmg0rm5EpByIG/2tnnb8FEDbgURj7LHBlq/x3NDRle8T3lssbIW5BIBYLVCcIqGibLyHe1kQNQ87oC9HO/n3jA8pOXrfW9jbmwVSauZKv4w3S8ZaNWTrR1NTjyIJBrvtPDjNc/cmHSFfyL0SfUYJDp4lVOAd3nMOws/H+J+rApTZCp8eMgMW14C4oSZr3dO/fDqISB34TjUKmTeew0+KkidY+kFJomM2JlEtXAQ5FUHcPj5CmSX2JN0/qecPAP3Byi/Fj/Sevod8N+hSZwBWxDa7WvKx8rGL+ieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 07:41:40 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 07:41:40 +0000
Message-ID: <3bca96e1-994a-4984-9088-eaf3f7569638@intel.com>
Date: Fri, 20 Mar 2026 13:11:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 0/2] Skip intel unsupported downscale tests
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260311074036.219075-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260311074036.219075-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0192.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS0PR11MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9f2154-8812-4e62-bcc3-08de86541f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: z+mPXNG9g/NSaUT9nDX3LjzH38jhCp4gUgsgO8U/kRGZQHBQVMfvH4HEhmKmXm+0PJ+E0pLBcHA5Ew750S6cjRe1mbpCo81b2tGoag21sR2blADfpaJj1d1dmps/RvWI9x6fjhzLw1B/VPd5F/Es6UEZoAU+rYtbRyXxhIfi7R8L66k23uwSKWCyb8psKJfwhEmMcW0gd6ZqddoR1v/xNiglUGCgZPCY/Wvz3wjaeMwqaDlEFxmaDfZJTu8CHDxdVQ3svXbCY/Wt/I/8ENlYQO6APHhez0j72cRK2m6TZls2Rk0i8zW5IvfAsSJBfhU+IISYARsZ8Rsiau5TfkVon1bi68u0KjOjklpiCNV6XiE17umDaZA4wPJV6+R2VykJ8899YgZq8wv3A47FYk7rh5Mk75i+zz2F/azc8sb/yqDqiCWbEE32kDrV8vFXVgL8bnsoFHrFHf3Wi63qSLr0WRRjQ98Kd0HQhugRc6xt6/81esgGU82gGw0atyVVa8+NgbwIPdiH+pTLlvZYvMd8V7LU2OCcu2xv5imkyZqw3n6AJ7ez2YqWa4iN0F0LIPFD+YZXsjqoV+sIrK82BTC8jg5IY8lJPhz7rfYX1iLuG3kNdR8MRY95Bnh1HoCC0XibqOe/JgXNkKs59ywI8CQNW7uEajCkb6X/mffaWlzSpFlOZBIQCfyGR3T+KKAJelRe3eIjBBbSrfZu5pDGqD2KfeeTKkrVvjFPd6uzfnOr4Ss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rzc5U2FpbDVqd3BNUWtrZkx4dFdNOWd2cDlpWEZoVnVMVHlYekRqVnpQWXB4?=
 =?utf-8?B?WjhXRUczZFpoMjk2OGI3aUk4VFFaem9PY05uZGUxbGJ2blpDSXdHSWJESmZh?=
 =?utf-8?B?bzRzRTFqZk54cWFYb0xRM2ZzeWNtcDAzWHBnNVZacThHYkpGaWVtQ3pKUW1M?=
 =?utf-8?B?Y3B2Y2R1RnA1VjZ6UVBqUHF1OWRVeGpUdHh2OEdxLytyRUczcjR1WUxzRTVk?=
 =?utf-8?B?eGRHNUIxcEt4Z08vUlZyVnZsU2VIYkdDWm5mdmhNNzZuZWJ4WE1wR21aWUJt?=
 =?utf-8?B?VFNhazB6RTlBeTlNcXBzZDRJWFJwOXhqc0RmOGRmMFpjK252NFlYczI0NHlr?=
 =?utf-8?B?aXVNYXc4dG5xVUN6WVord3VtMFdoZEN6OGgrdERRYTFDUUg0b1FHdlExZHRa?=
 =?utf-8?B?MGx5TVJSQTJWendUNGZiK2xkcmcrM0lyc0oyd0o2UE9LSkRCd0RZUzBJUGVK?=
 =?utf-8?B?RmJvSjF1bDZOcmIwOWMrRXprV012RkFQUTRIeldORzlpZkxnT3dMWjNsYlM1?=
 =?utf-8?B?Z0xWeS9ORmZZbVkxKzg3NUtVUFhVQkpzMXl2WTIwbVlNZHlYZDVGYVBiNkRK?=
 =?utf-8?B?WkpNYmhVMWE4eExrZ3FHWUE4Y2doc1hmTDhnZmp6ZXgrd3BDVkU5VkpJaWZN?=
 =?utf-8?B?SEtyN1JWSHhDMS9mL0Y5NitKTjBOYnNjTTZjam4vNW1Dc0VnL0pDNVZnbzZM?=
 =?utf-8?B?Z1JPT201cjYwUXZ5RUhVSTM3U0RJTWM3MktNWHhJVHRmUUVwZGJiRkVmVzRP?=
 =?utf-8?B?cjBEVGI4VXV6R1EzcTVVcXY3K0EzNWtsMnVxZ1kvQjk5R09nQzEzcXZTRmg3?=
 =?utf-8?B?T001V1ZNOFBQNVBuU21GU1pUS0ttYW0vdGRHYmxUdjQyc29YTHlFblpZMUFO?=
 =?utf-8?B?dE5qVm5wNUVWbUlnVnd6NUhjc3VVMjVmWmJ0bE05dnlIOEx6Zkk5SWh1Uyt4?=
 =?utf-8?B?U1NIUTgwL2MxVTdldHhqd0d4VytvZHUrRFRVSDVUVkhXUEhFVSt5azhmRWtX?=
 =?utf-8?B?NWxuS3ozcmJJSnFUQTRTK3FEcVFjRVlLUlh6MlJGR1N4NWEzV2pzMVhTVWwv?=
 =?utf-8?B?U3dOYXNZUmtvMFhMenFvTDd1WndQVTl5bjlvcm5QWjdwMDZ2OGFMNnp3UDdy?=
 =?utf-8?B?ZjhqdUlEMHZ1U1NKSkJVMTRWZXI0QzJSMnoyeWdqRFZsTDNtR3lwd2toK1l4?=
 =?utf-8?B?ZkI0ZHJFYUgrVElvTkdIZzZtRmIyeTM2N1pLTUZZM3hOU3NDaE14Rm5zcHoy?=
 =?utf-8?B?ZzhFNHFTbXhwWTl2eG5mdWkyQWtXQTM2bkVHMUtxTUdIYXRxL2Zwa3pBdGhq?=
 =?utf-8?B?dERPc1l1Qit6cnJpYnU3ZTQwNDZUV2tOaWFrU0lDR25tVXhabitPSkJ2bjlN?=
 =?utf-8?B?M2lzU1JON3VsTlcyS2xCcmRKTWZXM0UrczQvejk3TjJsOFA5SDVjSHJMdERX?=
 =?utf-8?B?bVlLd1g5dmNaaC9QVjlpV2tzSmszV3NVZWMzS20vRnJQN2NWcmZjZEpTbGMx?=
 =?utf-8?B?a0ZwT1V5eXdYY3loZHVVT3ZPVXF6TzhVMlFEdDFSTlpGNzVBQlFiNkZEeVh4?=
 =?utf-8?B?dlFNOXBMbjNDTmN2dUtEUk8zZkxOY2srYnkvZy9UVUFaTWNzR0w0MUY5M3NB?=
 =?utf-8?B?RUxGTkJoZEVpZ2t6VTc1VEFJSGVPaWNvUUkxeDBwOHJjWEI2MmNnaU5uNWpr?=
 =?utf-8?B?WUxUZURoMmY3YTUxdnAxNkR2eENtVDdZM3Zkc1RYSVRlWnAxZVRLZEtkbTVH?=
 =?utf-8?B?RmNmdmEreXU5ZG1pR3E2VXJDVnowWnRZditIdlV2azFGNGpKcUhXT0JWaG5D?=
 =?utf-8?B?WE55alpPeFJQQ0NnTWpRUjdjNFVRNWxuY3JiUFIwTjZxOXdObnE4SjhraUM3?=
 =?utf-8?B?Q2YycjFRRllsdkc3cGJVSWliZlh4b2RkOCtSZXA3bEQycGM3TkNhdE5Uditu?=
 =?utf-8?B?VG4zZWlyRDdLMjJSME1ZU1lyaVd3SWRkdlhtMjh6T1V4MUNEWHNuNjkvTHoy?=
 =?utf-8?B?YTFDdWtaZC8veDE5UDA5Znk2WXM5OTRjNTBmU0tUZnNFM3AyVXI4T1BCVm9T?=
 =?utf-8?B?Y3hRMnNiZkorQXhFVGpwV1NERmxHbVBudjRkeERXVlRZbjlidUh3NWlmZWpD?=
 =?utf-8?B?M0ExYk5tV3VGMkkvZjQ3enlBYVFWQ25LWGVPZnVqQ3YzT2FhZHNEUm9ZR1Fn?=
 =?utf-8?B?YlF5Rkc5a3VFSk80VGhiUnpjYUJ5SWZ4TGRaWU9ZZ205R2JQMXVFYTVrcjk4?=
 =?utf-8?B?aW56bFdnU0tlbzU5UmEvRE0rZlVldlRZNUNvWW4ydkFucXFuampEL05QeWxi?=
 =?utf-8?B?VjB3QWJHTjdGVmNldnlzcmVmck9lbEpqbGFpNmRtT05XaHY4cTFZdz09?=
X-Exchange-RoutingPolicyChecked: nVz8Wi1GGe0OQ25453A3Ef/LlfX6yESuXGVVa474A2pNuMR3I0qEYMhhqLWxrOMrHTjYQ3Y9G9DMl1JWzzLeRfFISLl9Q16qrYCmSAQ6cBRYNt0MY2wRKrfik9riyCDZO2Bq99KoBvznYY2nXFzDTB83An+xkXD8IfOZ+xxBDY/yR5N01J9kPiAar4gX49uzmq7gQkI7qDWndJcCizBXSTb10s/ZjZJ/L4TgZjPLMnEYO/IXUCCph1ZDyfrre9wNdvznoXWOy9KBoDPT6lBiTmWrX3SWyXnXg7+0mlxKV6GjfyIK6WKb4g/YebE2qAogZYCVhd7Dr9s1qk01vw27Wg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9f2154-8812-4e62-bcc3-08de86541f98
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 07:41:40.2545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtMxriSXBMJ7irJB8umU/ejcBQkW2KH2sZEFYDvF14Edp/sSrs5YTVSjqAwzNh5d/ZS7KUcaGx5mtvap3JSWSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
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

Hi Ramanaidu,

On 11-03-2026 01:10 pm, Naladala Ramanaidu wrote:
> Some scaling tests are expected to be skipped, but they still iterate over
> all display modes, which generates excessive logging and eventually hits
> CI disk‑usage limits. To address this, early skip logic is added before the
> dynamic tests begin, preventing unnecessary mode iterations and reducing CI
> load.
Why can't we handle this in blocklists?
>
> Naladala Ramanaidu (2):
>    tests/kms_plane_scaling: Skip unsupported scaling scenarios
>    HAX patch do not merge
>
>   tests/intel-ci/i915.fast-feedback.testlist | 216 +++-----------
>   tests/intel-ci/xe.fast-feedback.testlist   | 323 +++------------------
>   tests/kms_plane_scaling.c                  |  38 +++
>   3 files changed, 128 insertions(+), 449 deletions(-)
>
