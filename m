Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67C3FEFB6D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 16:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7111210EBC9;
	Fri, 27 Feb 2026 16:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhzZSWDo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31E510EBC9
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772209057; x=1803745057;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0dltI5V0DnGMfpciEkugXGz1fgreauY54aSnHgiTZKM=;
 b=WhzZSWDo91HvXEN3MK4VAbSFY5MTavlRgWQwuGZ+qDp3ITb3IRM9BHTU
 i5IKAlOTvFO1Ra7LtJtEY2mKxB+BKFFMvJSRSvSUY9VuaKWFgyGyr5++j
 9HVPNupqLhvf6cu3WoqPP4f3WAZ2jeLH5uMHK1YmCZxsNFfLYe5e6uiPe
 fg35hUOBL7X+H5qhiRnCamICHQ44K1GxVfd7LvoC1SxGTB1L6J/TE4BPx
 E33+CXg1/ODB9QsKWOQhlHR1v5r8YxM+aDA5L3OYtgrTBWHgZV+mQK1wc
 OcbeuNhzVsklwpY5Bp6genMNX0E6bw/wF602C1NDc9ITV+DjSQgKwYCJj w==;
X-CSE-ConnectionGUID: sT9WCgKFRPmR0UBcJ7c09A==
X-CSE-MsgGUID: +5g3O/oPRCGV2alRCrIgxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="95913639"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="95913639"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:17:36 -0800
X-CSE-ConnectionGUID: /ruNaXySQ8OGpil4Jgds9w==
X-CSE-MsgGUID: ZshTw8ZoS+C5qiWQjBw1Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221562625"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:17:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 08:17:35 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 08:17:35 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 08:17:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K56kzN33M+/9/uf0hlD38Qldy0cJZdxEg1q2oPbIlEehXt1cWFm8i9FUwhOinZOCOzefA4xDBFlXSN7xQgvBkoV9E9k6sSW4YAIZTUAD5cKwAueufsrwIvCSpy8ljObZn4DZ1uJrQou1USmhAXw036XTk7KcCQKoj03ZtvJ7/CyTjmvNAXXeoNuw7Md2mnp2PJ6img1pyu6LCRJnIbl1t1auCfv5wIS5Kjh4RCU6A9J5+tPG/K5Zw792wNopMdFfoJFh22y259zYQBsucgLnFm39fbok1/b0AJ0EGKbwUf3nZqVFCh60C2R9IP5I278U2bsvFIv9wDsHojlsWzGjyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCfxI4JgISKcdCibYkpURte01SwDmU1fRtLNF5MFRI8=;
 b=jqwcjJqMbqiwPSsGnX5blQFWdYxD7uLjAL47uksMhd9IA8pua5ngBb85nYGgfeMGqNNaQEbDDs2OigwUCmyesL58YBcnJznLbmZAlG0e4nF12CpXO7bBgaqRZUjs2RAdMx0vRoaLeTe5YC29YOFyoS2GMst03SyvxOFf5DuDlRaNsAv6+95+8fSiQLTVCaWIX7ysRFytCAGzkHjfFNU3h+nUBRbhtNQNWJC8uoLUdRU8BdWn9M9IA080P3HAuOs9obea9/yNhYy77nPeI/OHkJDu6xTR1G8kl017mlu2SV3Nk+BpyuphSJ3PTj1VUwsekiMK298XQ7NceMaZ2vjTzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BL1PR11MB5953.namprd11.prod.outlook.com (2603:10b6:208:384::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 27 Feb
 2026 16:17:25 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%6]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 16:17:25 +0000
Date: Fri, 27 Feb 2026 17:17:22 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 i-g-t 1/2] tests/intel/xe_sriov_flr: Add basic FLR
 subtest
Message-ID: <20260227161722.vi3tlkeyk5k6eyll@intel.com>
References: <20260227152734.256604-1-marcin.bernatowicz@linux.intel.com>
 <20260227152734.256604-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227152734.256604-2-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BL1PR11MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: ee38b34c-1f5e-4ead-501e-08de761bb1db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: OCwtE1DdsO1qc1G5H9r5DeUsleh2kB/phml38KxbTCpRtWniJGL8CXf9d7rGLGCvE28IrxN1Hn8y04M/NTNRrvDQW0dxIWUT3HBdz6Cax5799+GDE13o+v79cLCl4gnVaCAcQ951qLihTFJGJ8jDm3l9uJR9OlxiOUDPobT4LTct7CKQhrd1Gj9w6piANMWJ2Q7BLBunqTX8ymRh+HXKigOXqfp7Gi18zOJhfb23JZ/z0VOjPAqDdC7Kp3m4ZeFEAqpdYeBqUlEl8udXg96bH7Ni515LbYsb/D1VL3LXmphM4adynMkH6XMiDGRtNBgF7dwu7AFKa1IyLWy85QuazTUN+ZdBPX31c9A0sIZsBh3t5FPy0PiDLQ3DtTmnRbixvQ6YMpY2d45wQefnAEx7l1lTELq0zGAyXXY3kTDxveOI6TWO1PmHjxFpAI2ub4F/LwrHpM8EKsSv8soYAI7q1+RlnrXl6Jgc3KgEeObIHLiiV2A/U7MkOJ6vl4eQQmiAjY5Ku+fTvthikAwAHMQZiYMwmQmcyVJDO8rZRiW5sSFyQJ0/V23rQIRUNeQIGm4SrquWGvvhRoNpI9h9f99Mbt6VOEvSO0VpkZqt2DaJhfyo/6PPZO2bd+AivhzrCp85uvSrvzbS5rkZ3kNnt7ckVWeTPVD3p17Tq40E4Eg8iMoAm15SGZHakvPQN4fksVsdWJR4R0vc2l8mG615rwlHWbyteoI6rU5PKO/th//5NQ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDFKNTZWV0tPbW56azJWMk0wR3lBc2M0UTRPelpVQ0ZkYzhGM3BMeFhiRm80?=
 =?utf-8?B?SjFFbFNBWWxQOHFhQVpHejFIVndZckM2NStFR3JXdUFlUFd4aWkzZnllSzJw?=
 =?utf-8?B?Nmt3TXVpTEVSM3EwalVkaU44WHRoTC9TRmlSdjZPcEQwWElaRjZvTUplb2U5?=
 =?utf-8?B?QUZpK2lWZ1NacklxLzZsREVVU0lMcEM3SFhySTFrd0lTVFg3OTRKVTA2T3hn?=
 =?utf-8?B?eTVtaDFobnY4MEhxeWFYWVFTdDRZZmhrQ1FJOVM0Z0ZTMzRVTjBvUmxYUlZw?=
 =?utf-8?B?ZFZaTldFVlhOZ0FvZVhBdXhRM1JZUlM3WTdRaGt6dDVMdFZOZzNiK3cxOUYz?=
 =?utf-8?B?R1J0Sm1FdHRBcnhOdE5vQWttVzZGcjhwZ0tpbnYyVlhUTW1GUHE1NGFZZ1cz?=
 =?utf-8?B?TDNVcTVHdUxBVjZtM1llUjBiek90SCtSeDZ3TVJhWWlLc0dsWVpTSTlRckRj?=
 =?utf-8?B?cTQzOXdJNUlIM0hEV3lsSU5ERi9rZm85QmR1clNrdTlzWWZoTjBoMkFJZktB?=
 =?utf-8?B?b2MrYlU2c2FCUmZIT1JSZlRtb29yT0JiRDV6a1M2dllTZVB1N20vcERmRyto?=
 =?utf-8?B?cmhiUEQvdzBnb05tdzl2Qi8zRWlPd2hGMmg3cjhuREVQZmErUGkwcHQ1eU53?=
 =?utf-8?B?WWgzaFBIV2FDcTJEQkVQVnlWdVBZdFVySFFTSlNodHZ3OVNNVU5TcisxMkVh?=
 =?utf-8?B?T3diU2lHUThyQ2tzU3ZkYUVsWEh5elRBZ3d1ZnhteXR3bG84Y3hqb25FN01P?=
 =?utf-8?B?aVcvanlmaFdqOFFQdHJpSHFwd1RrRlZna2lQMk82Z01paXM3ZmV4MXRDL3R2?=
 =?utf-8?B?SGNHRE5IZjhMZUQ5VlRkR0U1Kyt1RnhTV0ttaGNRQ3hUSEt4M3pVVVZDdXo2?=
 =?utf-8?B?amxqdXZYZktEeXZzUXlKZ1lFUlBEY1paSEsxSjEvUlgrZWhJaWJyZHIxSEpy?=
 =?utf-8?B?SmtjdzdtMWpWZW1nR1ZuL2JJYVQrS1B2QzNmWmc1cVpXd1BsVzlYTWI0T1JV?=
 =?utf-8?B?V0VUcC9rNFZsQVhwcUpacWpmMlh0ZGs5czVMdWthS2M2V3RkM0djcWpnKzkw?=
 =?utf-8?B?dkpQK2R2RWdJQTluYVB4c1UvTjBLNXNGSGFoNVNLb0JLY1NOcnN6MDlkTitO?=
 =?utf-8?B?UjVCV1pXUUtXajl4dExLMm1KNGxpaUorY2l1SXdwWnJVeDhCc0pjelJndGtS?=
 =?utf-8?B?bWt2ZTQvUkp6aW5qaWhZRmY1a2swWXh6NW5XU1JyN2N4WW1qOWVtVWFKS1pB?=
 =?utf-8?B?dHJLZ2JzNnY1QSt5bFFaLzZxTmRFZy9tZGx1MHVJZWpleEtMZVhhMXQrWURu?=
 =?utf-8?B?N2lGVGJDTDl1QzY2S0RTRkZsS252Szk3YlJwVVhzUUY0K08wS1Y4VlF2SnhI?=
 =?utf-8?B?anczTjNsNDB6TkhjUVRGVUg3WWxPelNSV2NwZzNZRE5xejl0cUV4YWl4RytK?=
 =?utf-8?B?dkE0bGZXYm9iZ3JDeHBKWmk5UXpnT08vbXpKMGlWUUhCU0tyR3E4RDVTWVR5?=
 =?utf-8?B?OGt2QmF4ay94Vk1Caml3cEUvcERtTVRmcU1WOVFqa2NNa2FycFNwY0RJeVha?=
 =?utf-8?B?MDd2SXF6U1llTEZjbGZGZDRGbUFNTE9NQnlmandPWFNJbnB2bU56K3FXUGsv?=
 =?utf-8?B?bVRoNTRnemJrMFQyaFdOMW9lNVBqYnJ5RGh4anJlZ0dCWGlLUkNXSit2WDBY?=
 =?utf-8?B?bHlmR0UvMExUdkxpdG1lNTRDamtZLytldms2LzdTeEZiRXgwNFlxbVBGM3FF?=
 =?utf-8?B?Rk03STQ1R2c2SkY1UkRLaVREa0hkMUhHOVhyUHB5cEpDeHYvdUpFYVBFeklo?=
 =?utf-8?B?K1NKZEpCdXpCOVg2RUM4U21Jb0p2YVJNcFkxNkRZTWFMQWtzcTNNTGNyZmYw?=
 =?utf-8?B?OHQ1SC9ac254VWNzV1pBUkx1L2pHSnZYQk1ETGNXbndUUUIwNjlVLzJHREo1?=
 =?utf-8?B?bk5VMkt6VjBlYzhvK0lORTAwamZyOTVWNXJzczRIL0NHVlZzaFV2bFdDM05s?=
 =?utf-8?B?cTkwRnJGWmphRkRFUjFDR0ZXMFIrRjZaa2kySFdOSHFkaXlkN0YwK3lRbmZq?=
 =?utf-8?B?NFk4VnFyd01jS2s5c3l5Vnp0N3VsbGV0WlVoZVg2VWFCaVpQbkV0ek54ZURJ?=
 =?utf-8?B?bXk2SzgxaG1IYWY4bkxOZ0Z0U0RRVVRoSGRYZ1luWWJZQnVCZXFOSXFURUsx?=
 =?utf-8?B?YjRYMHJ4cnhhbE9QQlFvcjRaSEhwa1RDZ2g0cVU5MncxYkJWSWJXZnpXVWVu?=
 =?utf-8?B?aXI3UHFSeUhJY1Mrd0ZML2dHN1kyUG9QVjhWNDdPZ3ZsZWQrcUxGclpMNmI0?=
 =?utf-8?B?M2QzcnRmNDNVZEMvVTRnTjNpU2tKekhCSGNyV0xETzZGaG8xMXhIbklNMERR?=
 =?utf-8?Q?1xOo/wyZnGBEMk9k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee38b34c-1f5e-4ead-501e-08de761bb1db
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:17:25.5128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHKxe8ZkAZrOvwUGHctI8S77/FoHMCltjb5buVt1Y/samYsyoRBU4oD3sF6hh07ypB3UpTkvctd5TpatohsQVqav/jBzHk6EvGRDoSLcvPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5953
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

Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com> wrote on pią [2026-lut-27 16:27:33 +0100]:
> Add flr-basic subtest intended as a minimal smoke test for the VF reset
> sysfs write path while still using the xe-vfio-pci based synchronization:
> the test skips if xe-vfio-pci binding is disabled, if the xe_vfio_pci
> module is not loaded, or if any VF under test is not bound to
> xe-vfio-pci.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
> v2: Rename flr-reset-only to flr-basic, and adjust commit message. (Piotr)
> ---
>  tests/intel/xe_sriov_flr.c | 65 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index b73727787..2080f4e85 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -29,6 +29,12 @@
>   * Functionality: FLR
>   * Description: Examine behavior of SR-IOV VF FLR
>   *
> + * SUBTEST: flr-basic
> + * Run type: BAT
> + * Description:
> + *   Initiates FLR without any additional state checks.
> + *   Useful as a basic smoke test of the reset sysfs write path.
> + *
>   * SUBTEST: flr-vf1-clear
>   * Run type: BAT
>   * Description:
> @@ -1016,6 +1022,60 @@ static void regs_subcheck_cleanup(struct subcheck_data *data)
>  {
>  }
>  
> +static void reset_only_subcheck_init(struct subcheck_data *data)
> +{
> +	if (!g_use_xe_vfio_pci) {
> +		set_skip_reason(data, "xe-vfio-pci binding is disabled\n");
> +		return;
> +	}
> +
> +	if (!igt_kmod_is_loaded("xe_vfio_pci"))
> +		set_skip_reason(data, "xe_vfio_pci is not loaded\n");
> +}
> +
> +static void reset_only_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
> +{
> +	char *slot = igt_sriov_get_vf_pci_slot_alloc(data->pf_fd, vf_id);
> +	char bound[64];
> +	int bound_ret;
> +
> +	igt_assert(slot);
> +
> +	bound_ret = igt_pci_get_bound_driver_name(slot, bound, sizeof(bound));
> +	if (bound_ret <= 0 || strcmp(bound, "xe-vfio-pci") != 0)
> +		set_skip_reason(data, "VF%u not bound to xe-vfio-pci\n", vf_id);
> +
> +	free(slot);
> +}
> +
> +static void noop_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
> +{
> +}
> +
> +static void noop_subcheck_cleanup(struct subcheck_data *data)
> +{
> +}
> +
> +static void reset_only_test(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
> +{
> +	struct subcheck_data base = {
> +		.pf_fd = pf_fd,
> +		.num_vfs = num_vfs,
> +		.tile = 0,
> +		.stop_reason = NULL,
> +	};
> +	struct subcheck check = {
> +		.data = &base,
> +		.name = "reset-only",
> +		.init = reset_only_subcheck_init,
> +		.prepare_vf = reset_only_subcheck_prepare_vf,
> +		.verify_vf = noop_subcheck_verify_vf,
> +		.cleanup = noop_subcheck_cleanup,
> +	};
> +
> +	verify_flr(pf_fd, num_vfs, &check, 1, exec_strategy);
> +}
> +
>  static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>  {
>  	const uint8_t num_tiles = xe_tiles_count(pf_fd);
> @@ -1141,6 +1201,11 @@ int igt_main_args("vw:", long_options, help_str, opt_handler, NULL)
>  		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>  	}
>  
> +	igt_describe("Initiate FLR without any additional state checks.");
> +	igt_subtest("flr-basic") {
> +		reset_only_test(pf_fd, 1, execute_sequential_flr);
> +	}
> +
>  	igt_describe("Verify LMEM, GGTT, and SCRATCH_REGS are properly cleared after VF1 FLR");
>  	igt_subtest("flr-vf1-clear") {
>  		clear_tests(pf_fd, 1, execute_sequential_flr);

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
