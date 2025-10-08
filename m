Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934F4CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4F710E88D;
	Wed,  8 Oct 2025 21:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OmY0Nui+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0C610E88D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759960600; x=1791496600;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3MMAdQiCV3BvRY4fRwvVKr2jeOA/txKqCwi8dOm7ovs=;
 b=OmY0Nui+wvz0FpWVaswZIDZt8ZwH5xcMDEaVTIIl0jdlK9v+ZjgyXZAg
 K9T5nOjvzoSzLUFdwGgP7BpnTJf8ttLjghaPIDH1bsdUzo+jdOm2r79aW
 +qU7UdLUG0I8uVvMOAEpdHwUVSvKvw4J7aK10KmBNsxoxBZo1beUkcsyr
 0Cq3zSO7SIyJ7EpsSAjaHlOPPh+VgvxR/OvusvFxi8Zk13yOfekpzui3J
 njs5IE+YUKX3A4IuXFKW6PKK1l3pL7PB6asjZV64trVhRM1L+dSRocF0A
 BQPI98sAO+ZwvLdP562KkgkkaUbfAeV6RXPA2F0ME2TLfeTT+Y+/x2PZN A==;
X-CSE-ConnectionGUID: g+MHpTtBTDqNojokIsm2yg==
X-CSE-MsgGUID: c9jGTzMqRU2T09WynPbrZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="84785500"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="84785500"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:56:39 -0700
X-CSE-ConnectionGUID: IY1fHRTWQS2PkA4t0KpFvA==
X-CSE-MsgGUID: uUofeImHQMurKqxLWpJXUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="211197978"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:56:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 14:56:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 14:56:39 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 14:56:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIAD3bUt1DBbyZdEnnsJQaSlMYjmwa0zJ+NhhLlSfM/vhfb0pDAlp/16FBl6gNpRmURkNBWT+6dgtjkReGc54Jz78cM2ORZVW4vhni/42PHej5U6CZxrGnm6WTHM7ADtQU3NBBRuGFzvY5Bzr1+ldrDat9vCyv49FsQ+ELVRQwUqtnNJnqzV605dqZGv7hfgUEAl0gkANrSk+PQZPyW8qD8BCyPZKpin+7RHg5Xrr/R6lvR6cuV0D6aH7UHml88zU0KrQaotQB0Dc+5gXWZiZgLXYizspTWOhM2qufEONr2olIiuqYLpMJrEzdhE4k7KZkQBATd/ZTpy6NRUyoBMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MvRYOgIrrSDiHOqD+ynPHMrtA5hFN80AJ1Xmr/lLTc=;
 b=QY6vPqPzWprH4B04S50849lpSNzPo1JcDzB4+Id1PG7V1mY06vkw25MFIkhucF1D2bJySVD558Yljx0mgCXW2j4YPgjqgE/Mt7Yd6qrs4LBLbY14UIPltkYV0BgDzzeWKs32361yqRRYmfWCZOGUgYfyPo4fz/8TsTji0vvEDdBrEIfLqS43hb9vMMitq23rj39rPQScA6ijkqQNPfMfvC1Oz7SuhquN/K5jY5puq3f9YAORFrGezqRsxDAo/ls3wr2dFrhKg3Iq/3TNrY6iF5z3hbvTT9b/3o21zGWyJJ/u6jYTj4LYUr3z6hhNatUeubdQGIEG/Zrlu2HBz7P1VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8373.namprd11.prod.outlook.com (2603:10b6:806:38d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 21:56:37 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 21:56:37 +0000
Date: Wed, 8 Oct 2025 14:56:30 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 03/18] tests/intel/xe_oa: Rename nth_oa_unit to
 oa_unit_by_id
Message-ID: <aObeDtTswxeVkEHK@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: CP6P284CA0002.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:1aa::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: 352906ec-6452-4206-e551-08de06b58dc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjVDMldianJuR2VDa3pmaDBVUWhENFFpaU1JK05YTFZDTU02ZVJDdElEQUZi?=
 =?utf-8?B?ZGZ0TjRuRmQra2U5T1pSZlR3TkRwcWVMSDNUbkwzaW14cWpBV24ycExDN1Rk?=
 =?utf-8?B?Y3ZoT2FWK1UwQllZc2x4K2h6V1lYZlhFTERnekJ5c21vRGxaWERSYlRlZnVh?=
 =?utf-8?B?cWczc045N1NPTlUvbUtiUTZqU01WakdTUExlTDNjelk4bTZaTEU0V0xXdkdy?=
 =?utf-8?B?OS84ejJjZTRUZUZTY3p3WVRLVEE0TGZ6V1k5VDRhMWRQNmUvaDRFbTJ0QVZR?=
 =?utf-8?B?REZ6cytXaWp0K1B1VExaUVY1SlNpR3o0TDdZaUlhVlRQUVJYUit2NDFTVE1H?=
 =?utf-8?B?b25tLzRaclM2Zlp4SnhnM3gyVVo3a0NuMEdNSm9JR2ZjL2kzOVpPS29MQXhP?=
 =?utf-8?B?aWNDcXl0RlFvNmFKRVlRVnRoREM0S3lNOGxKZklYT09QZFNidGI2OXdSbGM0?=
 =?utf-8?B?c3EwT0prQWZUYzZaZkJzNnY0dktLVkUrRmQ0M0xMR3l3SHgyODZOV2RlYXk2?=
 =?utf-8?B?Rnl3ZTMyd1Z4WStHZEN5UkFwVUF2R211Mzkvc1V6akZwWE1EdnFxVGhPYll2?=
 =?utf-8?B?aEpQN0RVdUZpck5uYjFRL0k0eEpSZ05TU3JSY0pDdmVyanMvS25aKys3QVRq?=
 =?utf-8?B?aE81YkZrZklhckJCVlpTZkhrYVBRRUJPUEIzTmV4d2VybDZwNjNEWXVNZXF3?=
 =?utf-8?B?NlNOK0ZNdnN1R0J2SmtMdzN2ajZWZWw3djVxVENiam1pSkJGVTBtOWdwRXd6?=
 =?utf-8?B?OEU0RjQ5a0NublNoRjNZY3dxdWtwTytYa3ZLUE9NNGUrcU01NjNiUFFIczYw?=
 =?utf-8?B?b2dyRWwrU0xNSGtDZWFadTRPaFMxYWFmUVpOZmt1aVhEdnZUNWtveHUrZ0lG?=
 =?utf-8?B?SFZXSEh3K3ZLNk1LMzA2REZDSXRuMFEvL0s1MlF1czNUTEpmQnVXczUvUWZB?=
 =?utf-8?B?UmthaUcrdjB6eCtwa280LzFvWjA0SjQ0ZVViSTA1MkdiTlhkZk9zVDhMNDJR?=
 =?utf-8?B?Y1BUd09qd2VPazRDbTZFVGxqZUNnK2VMaVBQSTlzcDN6RVJpWEk0SXpEdUhU?=
 =?utf-8?B?MkNSbzlGUkRjMmFBM0lITWdRc2VNSFJjbUdQdHd6ekFCYmVsR291VkFmWENa?=
 =?utf-8?B?b1Jlcnh3Z1VFMzZ2akd3MFVUQ1ErTThWOXpyc3hHZU0rdFFKU2o5b3JVemF1?=
 =?utf-8?B?TjBpckw2cUtORzZWaFVwMCtXYXZ0WUZ4UWFrKzNIaDRxTnRqY0pXeUdCV3o1?=
 =?utf-8?B?SDI4SUJxcjNsZXIxU2RsbnNmRjZPcU1YeXEzQTdQbGtDcjVJaHg1bC9jVHdG?=
 =?utf-8?B?VEZVd3dwczl5S3pCa2M0NFZSVldoMVIvTGdab2ZtUTN1T3pKZFJCWmhxWS9E?=
 =?utf-8?B?WThzV0VIS0lhbnRTQ1NQQmU1dmxpTk9SaVFKY2ZtR1p6U3E4TDJweG9CUVgw?=
 =?utf-8?B?N2tNVFNNdHB3bUNHaGR5bDh2ZzRKMnlvemJ2eXJHNGxRT2VhMm9DbzdQeFhM?=
 =?utf-8?B?a1V1MkhzQW9qWUdBZDRtTTBsRXdydHVGN1JPSUVpYVpCbUQyZnFtdFl2VG1U?=
 =?utf-8?B?Z1ZFSWNCekRBQ0FDWFpZUjJ4SmU1TWtQS1RqakhJQlkyd3Q2ODVPdWN6dmRs?=
 =?utf-8?B?dENsc3JGcXBkMkdCdVFDcVZsTEFmQnhGZitvMDRxbkRWdGs2aXpwZGlnRkdo?=
 =?utf-8?B?ckpHZnZhb0JzbXRkM0pSeWw2clFDQVM5ejNFWUxFZ0ozN1dVNTdUa3Y1T1hR?=
 =?utf-8?B?UEZPWWRMMnd1RTNURzJWZ1VZVUZObnRHcXZvbVhmNUo4UDlGVWZrcXFhVnpU?=
 =?utf-8?B?OTU4NUJjbXo1WXNOU3hJRThiMDF6TTdRSWhDYkJVMVR2K3E4SDFuZGM2Q1ZH?=
 =?utf-8?B?R0dSY3JvS1FDdEtJZWpkUDhRTEUvT2lNTUdjWHI4M0tkVldTOGJXS0dab1BU?=
 =?utf-8?Q?rh2dPTtsPM504BR/iZU1xJ1kTzrt97pI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVlGdzBlbmphV2xZbnFwSUN5S2h6ai9RQk9oZHgrbFA3MDh5WE1ubUxLRlpH?=
 =?utf-8?B?eFk4SmYzQkhmWWZzWjlneE9PQ0tRWHNZWURkYktSeEJYNW10SDM2STNuTEw4?=
 =?utf-8?B?NFhQMGdPNEYvQXE2ejB3aXhqNElGemptM1RndnRaOUpmMTd0Q2dhTk9UZ25x?=
 =?utf-8?B?WjJ5N2FDWXh2ekFPcHFFRXBZSFFJOFdJMU9sNkdmZWF5UjczVmFIOHVjWW1U?=
 =?utf-8?B?Wm1aQjIxMk0vSkFRT3k4WkY4TGZZVUNFMFEzTm5rZmJ0VWYvSTRRUWhHYk1l?=
 =?utf-8?B?L29uWWlTNmdCYktjRG9IcFg1UWdFbHF5YzhwMXpFcTQ3VmdacWpTUE1hN2o3?=
 =?utf-8?B?ZGVmT2NxZ3dFSUtYdVVRTFdaSExlVU4zZjQ1TlNWUi9kdEgyanFlRFpiZS90?=
 =?utf-8?B?M3RHTjZ1L1d3THlyY05XN3NkVFBJbTNGcWFMaElkTUpwaHVBSEY2MGhhaUJK?=
 =?utf-8?B?VmtINEVndkllWlg2aXVXd0FUTkJPYmhKdk9RcXllTU56MVQ5YWtURVJSL1dL?=
 =?utf-8?B?N0h4SGJLT3dvYnVkZnAzNCsyN0NtODM4dG9sQ2dEeFp4cGdnYXBybmVsdm1i?=
 =?utf-8?B?R0VPRHFVQWZXZnR3dFpSSUVyWFBJcFppRWlhLzErMDJpY29CLzY5Y2hCS0Vw?=
 =?utf-8?B?Y1J1eU1RWmQxdyt0cDdxaWFUQTVoYjJtTGtnMG1tUWtQY2gzRCt5UmN0cGhi?=
 =?utf-8?B?S2Flelk2YjcxTU9mT0pDbGFRRDVPM1IrZ1o5U0FzUGhHSFp4b3A2cVJxRVh1?=
 =?utf-8?B?cUFpZWxDb01uSU8vbmVYRVZOYXFodjFWU2Y4OElIcTNEMTU0VHl1d0hEOVlV?=
 =?utf-8?B?a0V3NUxBaTIvd2xHclRDR09vOFE3Tjl2d3hNUDlyMnIxY0xGUmxCYXdBWnA4?=
 =?utf-8?B?aUNkd0FUbTQ1aXhQL1hGa1d1bzVGdmRLZFBFUWhZaCt4V0FvRTNLWGdja3FC?=
 =?utf-8?B?bGFpQjJ3b0t2Rll1NDhBV2RhL081cnMwL0FJQ3pYZ2VNc0xFZU1ZblcyQzVH?=
 =?utf-8?B?RE1XenU4amxZTngzNjNWU1BkVWxzSk16R2VNMEJVMDB0Z2x2aVZ3U1F6QXJ0?=
 =?utf-8?B?dXQ0NXBQMFRLcGQ3QSt6SU1RWndnbGdlU3hRMlQxb09TcjQ1SHhBQmg4Z1pU?=
 =?utf-8?B?UHBiN1BDTHhQbm43bkZIRk1YamZoU3FiR3JWSkNGcm13VW9VUlB0RXA1cjYx?=
 =?utf-8?B?anluM05yeGdlNGZCcnMyTWMxdm9FQTNuN2pMVDdkREI0eEhxUEFpTkJ0Zno4?=
 =?utf-8?B?cjByWVVwM1U3WDNGZEU2b0VuaXVaZ0cxTnBUYlNRcmtJTUhaWmFuMGFRV0t5?=
 =?utf-8?B?NjNMeTFVZWV3aW9PVDVTMiswMWdZM0hNSjc2RjU3eklkcEYzVHhxdjc3Umh0?=
 =?utf-8?B?Q3pXdWVhWHlxUEdkUjFTQjJVM21LZVFhNy9OeGhQZ0xyMEZBUjJRZmNrVGxu?=
 =?utf-8?B?bURBNFp4VVI1cGxLSDJ6TXZnMk9qKytubC9zK2czMmFRSFlpSk1FbGhIaGxT?=
 =?utf-8?B?UkNrWS9UK3lFRWhwVVVNK1JEaGFydXJacW8wcm9YYm42d1IwYk1lcks2NzJK?=
 =?utf-8?B?NjBzemw2RXlkWlB2bllmVDNPY0RYcTlPeVZVeDAvWGVOc0pkTWF6ZmQvUlRI?=
 =?utf-8?B?YnFGclZpemsyNFgvays4bFF0Q2JaTURkVWFBNnFtbnZZR2E5Z2tIUmdHZ1da?=
 =?utf-8?B?aXFYODZ2bWdieHo3STdJTE1rL1NhTUxlcjVvSk01U3pOWDZLbEo0a3RVRHZR?=
 =?utf-8?B?SlpGVEs5UXNJYStXcXUxakJ0K1kzUlNhU1JIeGdHdGpGc1Vpa0FLSWdISHc5?=
 =?utf-8?B?K2hQRlYwV3RyU0ZYRW5TaHBWVVVlM3ZHU2FieXRJbFE4VHcvUmpXczN6YWY4?=
 =?utf-8?B?QXp6dGFVNWVPWkZPaHI4T1FtWFhMRHFFSTdkVjZJN2w1bjFpRU95Nnh0RTBB?=
 =?utf-8?B?Z0dLK0Qwb1U1TU9oSVo4Qzl0ZVVjcThGODVEUjk4eGVOOS94L3B6TitPTFd4?=
 =?utf-8?B?eWtkS2xJVVFKWkRGdHZyQmQxaTBWcmtEMUJDSVZWZ0VNbnE5UXh1NUFzRVp0?=
 =?utf-8?B?Sm82YWZrUTZKU3J3UUVqaDU0NnNLbEpYWHdVa2dOVUlUZElFVWRTV01xeEJG?=
 =?utf-8?B?K3FUeTUyVVAvTmNpb0hFYTQyZ3JjcDh0ay9BNDNKUy9YK0JpVXQzc2hLcGd3?=
 =?utf-8?Q?tMpRJHI2Aa9ZVxzZqLA2Il8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 352906ec-6452-4206-e551-08de06b58dc1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 21:56:37.3095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /g8zYs/WBI6RbktrrZRx7A/1XJXd9kxUNBTs87m7LdGOVHZT/PxJ0u7ECky9mMS88NfE+IUjwBTI9rQs+W8kUmwpAtor1RpL2Wh30CI1bB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8373
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

On Wed, Oct 08, 2025 at 02:17:50PM -0700, Ashutosh Dixit wrote:
>Rename nth_oa_unit to oa_unit_by_id. We will introduce oa_unit_by_type soon
>and oa_unit_by_id fits that naming scheme.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

nit: s/n/id/ in function params

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index a028823e51..65e03b1010 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -493,7 +493,7 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
> 	return hwe;
> }
>
>-static struct drm_xe_oa_unit *nth_oa_unit(int fd, int n)
>+static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
> {
> 	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
> 	struct drm_xe_oa_unit *oau;
>@@ -502,7 +502,7 @@ static struct drm_xe_oa_unit *nth_oa_unit(int fd, int n)
> 	poau = (u8 *)&qoa->oa_units[0];
> 	for (int i = 0; i < qoa->num_oa_units; i++) {
> 		oau = (struct drm_xe_oa_unit *)poau;
>-		if (i == n)
>+		if (oau->oa_unit_id == n)
> 			return oau;
> 		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
> 	}
>@@ -4348,7 +4348,7 @@ test_oa_unit_concurrent_oa_buffer_read(void)
> 		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, child);
>
> 		/* No OAM support yet */
>-		if (nth_oa_unit(drm_fd, child)->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
>+		if (oa_unit_by_id(drm_fd, child)->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
> 			exit(0);
>
> 		test_blocking(40 * 1000 * 1000, false, 5 * 1000 * 1000, hwe);
>@@ -5027,7 +5027,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 		/* See xe_query_oa_units_new() */
> 		igt_require(xe_dev->oa_units);
> 		igt_require(xe_dev->oa_units->num_oa_units);
>-		oau = nth_oa_unit(drm_fd, 0);
>+		oau = oa_unit_by_id(drm_fd, 0);
>
> 		devid = intel_get_drm_devid(drm_fd);
> 		sysfs = igt_sysfs_open(drm_fd);
>-- 
>2.48.1
>
