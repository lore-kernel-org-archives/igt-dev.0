Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E323C3DA4B
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 19:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405D610E2BD;
	Thu, 11 Jul 2024 19:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CynR/pj1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B449110E2BD
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 19:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720725219; x=1752261219;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/T1CG+E+Cp1CVypm4eyOCunoyv9ms7Er7JalCvNSipg=;
 b=CynR/pj1bL96L56S3ddiARtRv4hHpSwzl/zDbh8v6Gf7Ld9Ajzm8F9n3
 ZatQjVuUPT+q2bbMB90ruldZpBw6ABg72KQI0tHl11Yxdq4b9Fiaf6Gnk
 4wx/6kmRhrdyS5T3tPxAg/Ki+usWcrELTd/FMX7LD0VTDbK3dbBBZgjbk
 dAt+QJIsnTPsp4BE9CJaZZASPdwnfw/uu49f64ESQcm2pssxUkqbzz/K3
 j9n/nOSgMvxGmiHqCPvveA3FPqfyTheGMRpFe5PSpi3rXwXJnmSjjfE4G
 IlZH1eOlr0SBz8XcIda/KedIsiasX06QiHhkIX++HrcMCcudDz9Re+Ti7 g==;
X-CSE-ConnectionGUID: 6j1j4yqTTyWmzJEzPZGk9g==
X-CSE-MsgGUID: eSlgslK1SciKbxVsc5hjyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28807003"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="28807003"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 12:13:30 -0700
X-CSE-ConnectionGUID: 5/tg0zyHRCqCuSn6KIv2MQ==
X-CSE-MsgGUID: X7jhhlRoQxGeOYsegQVYpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="49087919"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 12:13:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 12:13:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 12:13:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 12:13:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GL8+sss5WI9J6fjqFHUs/IM0sI7Rz6AIbil7INgzVX8ZLw+xYfbn8sXwUu7TkfW9ujmangZDshqW9uBQU+NzO89rpfkrxeZxafVh2+G7w3xiAqqa59rH2YQfbsW/Xs4lLZOeAirBs/xvKA8S7kdqnkgfAZDhiogqhkDcqmzcgFoJxdlISTCKPJ2PMA0tC+u20BQh2yWTiGYhqlH7L65Z/jDHUTeOlq4No3xlQONNwD020YyE+EPPbjH21YI1s34QU67IJp7R2s3vVYj2NpVSjDmIU+XeQ74Q/AD+gXvRAdLQki2xkZdGomwLnibSRbtpU5TIDCrml8qUWu8Itlqllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiCpO3lvt/s6s8bOmZd8HdTsWauwgjPGMXnD+skokkg=;
 b=qyqnq5xqYcZawyYrLH3YvzJY4T/c2Njs3nO8r9Sydqg9vgpAL1pLqyo30expWwzFWIKztgRmc8sVFtsC9aN2d1BIOjniXVWPDJS93/HFet7XRn5H8NFJ61agXTcm20Fmu7aU6h67x5SeN/4zjeiNQCePmE+OZwzlC0OwzBSReqM0klRS07pM3dwUM4QyUrBB4vwn5y4nFEF4rcsN0IQW1FEYmg62ZWUUYwOqVydkT/wDEcrIWbvuylEdDidfbpt/Qpr9xxMl+52FhAEikzXoamcTMjpY1fH41ekPOkKnXA9/HCjRMlaE0OgUz9NUDu+enLOVNY0NG64zM/BgjJ7eEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV3PR11MB8578.namprd11.prod.outlook.com (2603:10b6:408:1b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 19:13:25 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 19:13:25 +0000
Date: Thu, 11 Jul 2024 12:13:22 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 05/10] tests/intel/xe_drm_fdinfo: Add single
 engine tests
Message-ID: <ZpAu0p+1DX5Yn7wA@orsosgc001>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-6-umesh.nerlige.ramappa@intel.com>
 <fjpk7jck3tv5vz63n2n4c4jayo4gt5folbfrnncrpdrblb6kgf@hg3exp46jfx6>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <fjpk7jck3tv5vz63n2n4c4jayo4gt5folbfrnncrpdrblb6kgf@hg3exp46jfx6>
X-ClientProxiedBy: SJ2PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:a03:505::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV3PR11MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: 79023570-54ab-4e72-4b3b-08dca1dd8a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVpUd01kdFo0Y0ZzK2gvVy9sVnJFTWlsczhvWm9Yb3VOckxnQ2hkc0U1Ujk1?=
 =?utf-8?B?aVRJS2xaWVpHWXFDZ0tUNFViQVJtZ1lmTHJzTmtUdkRubk9VZk5BdUUwK3Bo?=
 =?utf-8?B?b1V0YmRqdmdaMjBGcWdMS0Rpa2FHaGZBTUV4S0M4aTJJVUNYMWNmNjhiZWZW?=
 =?utf-8?B?NXkvZjU5bVMyd296cU5wdWZIZUE4bEZmQ1Jmb1orYzdpVllGbDkxU3BUbWlX?=
 =?utf-8?B?dC84U3VDbkhSOTkrMXVRNWZoNEZPdVlvekp5NmY4QlJscGxPU0RVZVllSEwv?=
 =?utf-8?B?NHZ6anF2MGJ6UGNDcnRuU2hRdWJXOXc4cEZXMWlTU3V0K0xsU2dNMW1XbTc5?=
 =?utf-8?B?ZC9ITmI0WlN0ZlhaNGFaL05RbGgvK3I1alhJaUdrVXVnTjBrYnpyc0UxL0NM?=
 =?utf-8?B?NWpac0NsMXNXRWJ4RkhaeVlXdTRLYjIycGhkZHpnSGxTeG1vSnQ4YTZIeG9D?=
 =?utf-8?B?V2x5WEVrZlhtcVJFbmxHMnhwbGtLQVlQcVZ6VWR2aGJEWUVseGNhZW1TVWZD?=
 =?utf-8?B?bkcrcjdxaFMzQ1hXOEVla01hbkRmU2lWaWlrSHpSUFhoaURadzQ2L1hXNUlM?=
 =?utf-8?B?VHJxb2FsVmNlaHF4WHFhT2NIK0lhNkUya3p2LzNvRXNIaWhzRlVDQ2Z2Uzdt?=
 =?utf-8?B?UE55TkI5bkpWeHZBSjBrRlFIQ3U2emNjNzNBNlNESUcrTkNSa0NmUTJYanBs?=
 =?utf-8?B?aGN1eUs4S1c4UnIwamZqNjNDRENSNUw1TjJweW5Pc1VXaTNLR0wzeWwreDF3?=
 =?utf-8?B?ak9JL3NXLzM3MytRY1J4cTZWbFR3QmZ4dGxXRk4vSEZWTWQ1MzFNcGM1OUdm?=
 =?utf-8?B?Y1FYOFlFNzM5SmhYMEpKclV0S3ZidGE5UGRDL0xYVEZHYzdiRlZnRXdnSzBm?=
 =?utf-8?B?SElhdUFuYkhmRTAvbHhhUnlLL01NbUVPcEE0aDdUYmtyM3VpK21NZGRwU2ZB?=
 =?utf-8?B?UDdqaTdMVjlnMUVSMGJBTVcxSUZwcCtNazVrdjVZdDZOYWxPQmZ5TmpsVC9T?=
 =?utf-8?B?YXd2dDB6NDNuZ0pnaVhIcjlTQU4xWVIwR3ozUG1KRDJSSHFBOHhnaHFBR1RC?=
 =?utf-8?B?bkxWR0JoNFJ3UGhJYVJaRzc4RlFVQkZKT3FIY3ZkelNtMnpNOVptUXBWL1dI?=
 =?utf-8?B?U1pYOEdMMkpNbDI0aGxOK0pLOGpsWGlvYmlIOUhRSDAyTUxVeWR0NnBhVVdB?=
 =?utf-8?B?TnFOUnRkeHBVcUFGVlRsaGk0bXZmY0VJRGJjUzA2TlZUMHNSOFVvVlNGYk9k?=
 =?utf-8?B?azYybFlIWFNObldFbk5uRTcvallnTEp2WnFqL0s0SERDc3l6SlI1MXBvTlpW?=
 =?utf-8?B?ZzNZekdUOUFqN3VKSG9PRCtNUlBGT3E2QitPUnV2a292Rmh5dlNkM0prYVND?=
 =?utf-8?B?UFdKV0xuLzZjQmEyY2Y4SGJBY0tTMVNxUnV6b3l0WldQYmFWM2VudEJxd1Uw?=
 =?utf-8?B?SUFpMXBOK3NoZk5TU0V5WFc3UlhuaTYrODhLWFRZYjJnTFp5ZUFZQTBvN1B5?=
 =?utf-8?B?Mm1KZmt0bFJod0pEclgrVWJzU25aTjlldW1sSW42YkRFZi9EUER1cXNLZGdH?=
 =?utf-8?B?NUhGU0E0SmFXSjJ5Z2xlcFRtdUpFNDhSaENWSDV0ZE1EamtpZ0xaWFR6b2Vx?=
 =?utf-8?B?dHFtNTlJeEY5SGhKRFFEM0hOdW5vRHBBam9QeVB4dzRiVFFUaDArMHB4RG8z?=
 =?utf-8?B?WTdQZVcrRSsvUU1lNnY1QmVJdXNZd00xMHJuM3dqekZQajdaUHlIYkdNODBj?=
 =?utf-8?B?eklvMmMwSUtkQnQ1cmlXWlRIUlRWb2pmbm5DWnByMDZ5VjQ1eEx1aGUxSGU2?=
 =?utf-8?B?UUFVbkRHVHoxeHc4cndsQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHdHcTh2L3dybVJuaFk1UGZhVjgvcEdsaU5vcGxEZU9ZRWJFQ0lwcTZvcnIz?=
 =?utf-8?B?RmRWQ0czRDZnQnVOZGlpSzArbnJPOTQwYjVxb0xpUWNnQzNRc25oNGtTYzZa?=
 =?utf-8?B?b3hPdWk5Z0N4YWJKa2NhdXBqeTVXTThTZU5CNjFObFpPbktQaDFtWWFScGYw?=
 =?utf-8?B?ZW9KUU1IV2RXTjUyWjBjZUQyQ3BQWUkydG1oM0x1TTdMeVNDZCtuN2FIZWx6?=
 =?utf-8?B?bnU5K1N5MlRwM2lwVFd3aUJXOVlhdnJRTld2WEJJVk1kdnU1c1NrdWVsTGpp?=
 =?utf-8?B?ZVVua1JpaitzQVFpL3lsZk5KeGdmc2tiRW9wVnlaL3VDajAwWUIxR0ZwcThC?=
 =?utf-8?B?SCsxRnFydkFKcHU0N3kyYnBacklSQ1RMS2FDbGhYRk5NWjg5SW1adGhpSVdk?=
 =?utf-8?B?QVd5c1JJVDMzOHBDNDBHNDZWekZUVkxqSDFyd1NISlNLMDZoZDFLSHcxTUY5?=
 =?utf-8?B?ajJqVWQyWlNqNTcwMmorQzRhVmpxbEdUd0t6eFgwOHRZaVlCaGZLamxOS0hT?=
 =?utf-8?B?dkVPZkNmTEFvSDZWOEROcENRTWtjTUFKU1hjWWZ1aGZTUzdDdUwyc2tMQW44?=
 =?utf-8?B?bVNvbFlTVE9ZOGt1SWtsU3RvUW0rVFkxUy9ZY1FvZGl4WEZ2MDM2dlFkRVBS?=
 =?utf-8?B?MXNPOURlNHhCdW1EU0tIc1pNU1VHcXY5TWF3OFhISDdlYzJoQS9lNWordDlS?=
 =?utf-8?B?YzljL0lsL3JOZWdyaWxkY3hKSzFjYnJOd0RicDRlTHRsaDlqRmovY1hQb05T?=
 =?utf-8?B?anBhcVBNd0FjUTRVQUdzVVlESE5OaEx3VnI2ZGZCeTVhcm90dlRBd0VNQXdH?=
 =?utf-8?B?dHZFWERydHlyMGFOUGplYmJZZnBycS9wTzVHNU1wN2plNVlrMXZKRnduMVhO?=
 =?utf-8?B?QWxEYUlkd3BrdHJtdGNHQjdFejRBejduU2VodHZXT1Q2MTY0aVJVVEhhNjIr?=
 =?utf-8?B?KzFVblpucUhlaEpqSWdIbmdSSjVocGNPN2RaSVdoQzhsU3lIZ1liblFWTkp4?=
 =?utf-8?B?a3JqN2t3b0JpVDBHSzJoWi8yV0NFNVgrYzdqTG1hK0M3dlZuTVd0bUhoSmJz?=
 =?utf-8?B?SE96MDA1U1NVOHhOb0JRRUg4ZEdkMGllRDlpVkVKeGhRU255RkFuZ0RGV3hI?=
 =?utf-8?B?bW5VSy9ES1pWdCsreEIxYi9sWk9QaTAwRWdpTTBTUkdFbUFMaVYyZG8zdThr?=
 =?utf-8?B?WWNEUVkzOTE0NlRvQXRQTTBJZFFmNUFyb3l0bVlJbllOK1cyeGkyVjNPRys3?=
 =?utf-8?B?dXlQbDZaZEc5dUdxaWMzaVRtd2cxeU1iZnZ3UVBjZWVrbS9hZTJjNGJZblJk?=
 =?utf-8?B?QkszSkZiaHpLSXVZZnFtTHpJYytvRkRkWFpYL1N5WmNYRE5LMS9PV3d2TkF0?=
 =?utf-8?B?WW05WVZabHQrMHNVajdyRXU5clBCTk9pVGk5alhlOFBFYkZBQUE1aXF5eE5k?=
 =?utf-8?B?K3VzbDV5V2h5UmhOV3NZWEJpOEpWSksxWTd1L1FtREN5MGQ2UzUzcW8rbFZQ?=
 =?utf-8?B?TlBZenNiS1NwZUlzUGY4eitVbllMWVdsMis4WVlxajBtSUt6NGtPdEdmVy83?=
 =?utf-8?B?MG5oZFh4MkNpa09uaDZpNUVwMWtRTlhiMjlPMmljODlmNjV5YVU5TUcvdnBK?=
 =?utf-8?B?bDF1YlJ5eXVpYis4cHoyVVdVYmdQbFlOTHVFcFRNRDl3YnAwang4RG9kU1Ay?=
 =?utf-8?B?SDV6d1ZUeEQ5V0UyS3BpUVFETG5WQ1lUWXVRbVYrNXQ3alZyOXVLVkdwVGZO?=
 =?utf-8?B?VTJLaGJWd0VEamptdnpMeE1RenRwUlJQcm16RHU3TURKa2s5MWRzSUdiaDdz?=
 =?utf-8?B?RDdtK1YzYms2L0t3UUsxam9EYnA0UHVUVjhadkwyUkMrVkNkWHIraFIwRENC?=
 =?utf-8?B?UVNsTnhhMDZjclNsWURvTjZqNmwydk9QQS90ejhtVmpYNFp5cjdpNG9nUGQv?=
 =?utf-8?B?NW93cEFOSzVVdmczeTNjZGNRT1RhZWdtNTZzRHBxOVdITUpwVkRITWFJYjYy?=
 =?utf-8?B?Z2ppU1lmdkNJZWptQWNiM3hIY0dyTmVWemxjRlBNcXB4cmlobDRBZEpPOEdE?=
 =?utf-8?B?TkxsUkZNV1Z1Mk5aUHZiZlhhMzNSSStzMDEyVnhYQ0ZyMkN6dGFKemFNMFBJ?=
 =?utf-8?B?cXUzRmlQWE5LUE1HZzNqYzhiMmVKMURNM1NBNU1IUXJNdGpzcGdpSEVlWXcy?=
 =?utf-8?Q?8as+v8YL0+JAZMxH7JUcl2k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79023570-54ab-4e72-4b3b-08dca1dd8a0f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 19:13:25.7980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: at57Dtwc84kvF4jV8R3iFLWHMb7kFcZ0dqWy0GDd3LWWGJ/xr6EzDX3+L0dP03TSgVxhuHSt5kg7XvmiXRbUO7rXeFyzxCaMt495vi1oUVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8578
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

On Thu, Jul 11, 2024 at 08:20:17AM -0500, Lucas De Marchi wrote:
>On Tue, Jul 02, 2024 at 05:25:27PM GMT, Umesh Nerlige Ramappa wrote:
>>Add simple tests that submit work to one engine and measure utilization
>>per class.
>>
>>v2:
>>- Drop measured_usleep since return value is not used
>>- s/parallel engines/parallel submission/ in comment
>>- Use NSEC_PER_SEC for batch_duration_ns
>>- Percent should not be > 100
>
>but as we chatted later in the review, it's actually possible to have it
>greater than 100, so I think we need to leave some room
>
>>- Check utilization for both clients for isolation case
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>tests/intel/xe_drm_fdinfo.c | 97 +++++++++++++++++++++++++++++++++++++
>>1 file changed, 97 insertions(+)
>>
>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>index 037f25e53..410c885e7 100644
>>--- a/tests/intel/xe_drm_fdinfo.c
>>+++ b/tests/intel/xe_drm_fdinfo.c
>>@@ -28,6 +28,15 @@
>> * SUBTEST: basic-engine-utilization
>> * Description: Check if basic fdinfo content is present for engine utilization
>> *
>>+ * SUBTEST: drm-idle
>>+ * Description: Check that engines show no load when idle
>>+ *
>>+ * SUBTEST: drm-busy-idle
>>+ * Description: Check that engines show load when idle after busy
>>+ *
>>+ * SUBTEST: drm-busy-idle-isolation
>>+ * Description: Check that engine load does not spill over to other drm clients
>>+ *
>> * SUBTEST: drm-total-resident
>> * Description: Create and compare total and resident memory consumption by client
>> *
>>@@ -42,11 +51,18 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>>
>>#define BO_SIZE (65536)
>>
>>+/* flag masks */
>>+#define TEST_BUSY		(1 << 0)
>>+#define TEST_TRAILING_IDLE	(1 << 1)
>>+#define TEST_ISOLATION		(1 << 2)
>>+
>>struct pceu_cycles {
>>	uint64_t cycles;
>>	uint64_t total_cycles;
>>};
>>
>>+const unsigned long batch_duration_ns = (1 * NSEC_PER_SEC) / 2;
>>+
>>static const char *engine_map[] = {
>>	"rcs",
>>	"bcs",
>>@@ -464,8 +480,77 @@ spin_ctx_destroy(int fd, struct spin_ctx *ctx)
>>	free(ctx);
>>}
>>
>>+static void
>>+check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>>+	      int class, int width, unsigned int flags)
>>+{
>>+	double percent;
>>+
>>+	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
>>+		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
>>+	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
>>+		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
>>+
>>+	percent = ((s2[class].cycles - s1[class].cycles) * 100) /
>>+		  ((s2[class].total_cycles + 1) - s1[class].total_cycles);
>>+
>>+	/* for parallel submission scale the busyness with width */
>>+	percent = percent / width;
>>+
>>+	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>>+
>>+	if (flags & TEST_BUSY)
>>+		igt_assert(percent >= 95 && percent <= 100);
>
><= 105 like you had before seems good, otherwise we may have too much
>noise in CI.  What are the typical numbers you're seeing?

I see 101 whenever it fails. Also I see it only when I run batches on 
all classes (all_busy_all/most_busy_all etc.). The difference in 
numerator and denominator deltas is close to 5ms though. Not convinced 
that we should see 100 still because we are ending the spinners (and 
waiting for fences and all) before taking sample 2. Still debugging a 
little more on this one.

>
>>+	else
>>+		igt_assert(!percent);
>>+}
>>+
>>+static void
>>+single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
>>+       unsigned int flags)
>>+{
>>+	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>+	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>
>nit: either name it pceu_start/pceu_end:
>
>pceu_start[0] is the pceu for client0 on start
>pceu_start[1] is the pceu for client1 on start
>pceu_end[0] is the pceu for client0 on end
>pceu_end[1] is the pceu for client1 on end
>
>or pceu_client0/pceu_client1 if grouping by client
>
>pceu_client0[0] is the pceu for client0 on start
>pceu_client0[1] is the pceu for client0 on end
>pceu_client1[1] is the pceu for client1 on start
>pceu_client1[2] is the pceu for client1 on end
>
>... this makes it less prone to typos.
>
>But see below as I think 2 samples are not sufficient.
>
>>+	struct spin_ctx *ctx = NULL;
>>+	uint32_t vm;
>>+	int new_fd;
>>+
>>+	if (flags & TEST_ISOLATION)
>>+		new_fd = drm_reopen_driver(fd);
>>+
>>+	vm = xe_vm_create(fd, 0, 0);
>>+	if (flags & TEST_BUSY) {
>>+		ctx = spin_ctx_init(fd, hwe, vm, width, count);
>>+		spin_sync_start(fd, ctx);
>>+	}
>>+
>>+	read_engine_cycles(fd, pceu1[0]);
>>+	if (flags & TEST_ISOLATION)
>>+		read_engine_cycles(new_fd, pceu1[1]);
>>+
>>+	usleep(batch_duration_ns / 1000);
>
>NSEC_PER_USEC
>
>>+	if (flags & TEST_TRAILING_IDLE)
>>+		spin_sync_end(fd, ctx);
>>+
>>+	read_engine_cycles(fd, pceu2[0]);
>
>... and here we have another source of noise.... when doing
>TEST_TRAILING_IDLE, should we read the first sample after the spin
>ended, sleep, and read the second sample?

That would always make utilization = 0% (numerator delta is 0). We 
should take sample 1 when the spinner has started and sample 2 when it 
has ended (for PCEU).

TEST_TRAILING_IDLE is only valid when TEST_BUSY is also specified.  
Maybe I should enforce that in the test. This is the flow for common 
flag configs:

1) flag = TEST_BUSY | TEST_TRAILING_IDLE
- wait till spinner starts
- take sample 1
- usleep
- end the batch
- take sample 2.
- check_results (expected 100% util)

2) flag = TEST_BUSY
- wait till spinner starts
- take sample 1
- usleep
- take sample 2.
- end the batch
- check_results (expected 100% util)

3) flag = 0 means truly IDLE since there is no spinner.

>
>but then how are we testing all at the same time here? I can't see any
>igt_assert() for the trailing idle test and it will actually impact the
>busy test since it will wait the spin to end.... Am I missing anything
>here?

Case (2) above does not exist for PCEU tests because CTX_TIMESTAMP is 
only updates when the context switches out, which means we must end the 
spinner before taking the second sample (or preempt it, but ending is 
simpler). This series only has tests for case (1) and (3) implemented.

Case (2) is applicable for a completely different feature which is still 
wip - per engine utilization via kernel perf framework.

>I think we need to add a third sample when testing trailing idle
>and ensure:
>
>considering the indexing as sample[client][idx]
>
>	sample[0][1] - sample[0][0] == 100% if BUSY else 0%
>	sample[0][2] - sample[0][1] == 0%  -> idle on trailing test
>
>and for isolation:
>
>	sample[1][1] - sample[0][0] == 0%
>	sample[1][2] - sample[1][1] == 0%
>
>>+	if (flags & TEST_ISOLATION)
>>+		read_engine_cycles(new_fd, pceu2[1]);
>>+
>>+	check_results(pceu1[0], pceu2[0], hwe->engine_class, width, flags);

This check_results will check for TEST_BUSY case.

>>+
>>+	if (flags & TEST_ISOLATION) {
>>+		check_results(pceu1[1], pceu2[1], hwe->engine_class, width, 0);

This check_results will check for idle case (flags = 0).

>>+		close(new_fd);
>>+	}
>>+
>>+	spin_sync_end(fd, ctx);
>>+	spin_ctx_destroy(fd, ctx);
>
>if !BUSY you are not even calling spin_ctx_init()

:) yeah, sorry about the readability here. The spin_sync_end and 
spin_ctx_destroy bail out if the ctx is NULL which is the case for 
!BUSY. I can add and explicit check to not call these instead.

Thanks,
Umesh
>
>Lucas De Marchi
>
>>+	xe_vm_destroy(fd, vm);
>>+}
>>+
>>igt_main
>>{
>>+	struct drm_xe_engine_class_instance *hwe;
>>	int xe;
>>
>>	igt_fixture {
>>@@ -484,6 +569,18 @@ igt_main
>>	igt_subtest("basic-engine-utilization")
>>		basic_engine_utilization(xe);
>>
>>+	igt_subtest("drm-idle")
>>+		xe_for_each_engine(xe, hwe)
>>+			single(xe, hwe, 1, 1, 0);
>>+
>>+	igt_subtest("drm-busy-idle")
>>+		xe_for_each_engine(xe, hwe)
>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
>>+
>>+	igt_subtest("drm-busy-idle-isolation")
>>+		xe_for_each_engine(xe, hwe)
>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
>>+
>>	igt_describe("Create and compare total and resident memory consumption by client");
>>	igt_subtest("drm-total-resident")
>>		test_total_resident(xe);
>>-- 
>>2.38.1
>>
