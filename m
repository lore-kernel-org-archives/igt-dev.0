Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B115CD149E7
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 19:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675F010E0D9;
	Fri, 25 Oct 2024 19:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGuahVlL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43ACD10EB7E
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 19:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729885184; x=1761421184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=abV78GcjYxrk69HSOpC0PYa3NSr+6o03NxZ/syejtLU=;
 b=KGuahVlLmYvUt/CumO+MMvQXPtB4ikr808NLhDRISCtbwAF9uh2obf6s
 o4kpN/T9RmkYKJ/wyUZtAwYEqn2GwgeQUJz2HvM75LeSq8aaM7mZCPUwj
 YlpI71CidRIRC1lSvENspmFwqPBXTq7qfRakthrNVXnvfa0F2NRm3dtvE
 9DTfOWxtWIzPe1c4caHbPAnkgqTdBZLyWpuD3uNAuiWapFxBxM3j6G8/U
 w61gS4jhuM4sQ4QJVLXSOjiOW0Qj/A4H+evSNMnCCrB85QRpw7ZvMExoZ
 0YbAv+nhqm1yVV5ZPBIJAMcvG/O5P5dkA2RA+1RA8OPUdt0gxft9aQNtg w==;
X-CSE-ConnectionGUID: mgLMVHR7Tp6NNbxdLo2LaA==
X-CSE-MsgGUID: RNlYNJA8TtK+4mNd3xOp7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33479551"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="33479551"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:39:44 -0700
X-CSE-ConnectionGUID: 7HTCPn8FRJKiBCog9TyX3A==
X-CSE-MsgGUID: SXoN4YEXS5K5wvcTPnprKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="81310805"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 12:39:44 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 12:39:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 12:39:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 12:39:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gittNz+M6MJs1YvzvCpKDD7m7Ar1aw646E1LxlbbJxdHlQuoMkTvMuXdAEJGBBH2NFMCka6nV1VvCD9r8VudyG4SHqdApBjVvTufFlPQLTWV86c57t4sOiAgz5j8qqo830GlNeHpUbl6u+FagHDBAfJwFeWB7caNOkgu3QVJe7/F7D1FbvK0XuB2Kp+YZUuLjhwXJssS+K1yd9/g01VlNzyyg04/T4qSBuR9vV73w8m9sqBpWqSHs0dkEW43eS9fUJsdUKU5QyAmSFXuNiOOvMrGJTvQ4nXupVZwRhyo1zDec8/woBhfh3guDFsThlkdYf2tQOru6wqLYNHOoEJ5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Q8Qu3i9Fj9qrfkMz8FivSN+WDRkja6fHXY1r4yK9cs=;
 b=gMJXHuKF8yhM2CaqNpSl2DJGSc0XzCSsPVs2QqowYjqnO18gwO+jn+XWDmmY5MaZl7QqSXBypNrfWKuv4opy3vWYbN2mCpKlZZGvwdh/LXTlRLmLe03qFU2/c9I4RlG1jntCHjkHwOTu3199GdLAk++LuQvgI/wSxun7FhPK8Mv+WWxRE3RzvTTM7FZwkVVARFH4BXyU40MVPS1KMRI71X1mNcaS/OZRTDAp3zTJPSBiq+KQKXEJkp5Z4wmGiDayAqebKyICk/4AZNbGcamTmhfBQAFrboXOgWkSalaXGU1hNJJLW8Mzk/fI+F/24VLp/SSLa7zVuLYvVomzxsx4vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB6972.namprd11.prod.outlook.com (2603:10b6:806:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 19:39:39 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 19:39:39 +0000
Date: Fri, 25 Oct 2024 12:39:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel: rename drm_fdinfo into
 i915_fdinfo
Message-ID: <Zxvz+a/5Ko76v3wg@orsosgc001>
References: <20241023164537.83876-1-kamil.konieczny@linux.intel.com>
 <20241023164537.83876-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241023164537.83876-2-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::21) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e4cd09-c6db-4b62-746e-08dcf52cc40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STNQUHJkMnB3bEZKOUxDZEZqOWpmUHpMVVJZQ0ZESXFINjFSdFlHVmovdy9j?=
 =?utf-8?B?eXIxYUw4bitPR1FrdGEvTFpJWHRVYzROcjZ6Y0ZLQ21NRDVCaFE5eEl4MG10?=
 =?utf-8?B?NFFnVnhBZWtMNk5LZi9nN25TUWFGc1ZDd3pmTmFOMnpNdm5DY3NWTk5jREFk?=
 =?utf-8?B?dnRMYWk0MUR6M1ljQjNtNWljVHJOWlhCaEVxSkRubFFFblBtWkdsSE9sSWxC?=
 =?utf-8?B?cFJVc0xoM3YzR0lwOXo5SHhoS3ZpakF4ZWhHMkMvSHc5RUhCMzU5dE4yemk5?=
 =?utf-8?B?dW1hd1d4aEUzaDBncWZXNFo5WERpS0hoWlI0dkFXdGR6TThuRFpvaFM2Z1hY?=
 =?utf-8?B?cVpjelIvbkgvakJFaCsybURIZHFJaUFWaExHR0pPQ1B3TW5rUDNXeU4zT29K?=
 =?utf-8?B?RHI1SXNyL0dNbDVIajA0YngxQm9SWERKM2lwd1NiTUR0OGt0VDF6NzcwMjJJ?=
 =?utf-8?B?eDY5MFhxWjdmTmc0SUgyY2NWOVhJcW52d1VwbVNTVUh6cUZSYndMckd2aHlo?=
 =?utf-8?B?YTRBYkhXNmVXMnN2Ry9DcEZrMnJFdU1jUzBVNDdHMFA2SXRRcnBQamJ5aC92?=
 =?utf-8?B?V2RFU3ArTk9MOUFBTFBJdGJJTWc2Y0phYTJwRW9XS0tXMTRTR1NVb3pNbWtx?=
 =?utf-8?B?Qnc3Q24yT3pWRzlaVUFyQ1I0MWdJSk9Kc1NoWEhrVDQ2L0VyRGFXRys5Zm5N?=
 =?utf-8?B?TmpWVXhhQnFCMkV4WXFQRVRSTjN3RVpqaVpnMzdtRjY3QzhJRFpPS2EyYjZt?=
 =?utf-8?B?cWdNb2FFQVZ3T3JHSjY0NlhVd2pqVXFOSG13d2JBV2hhckY4YkExYWMweXZ6?=
 =?utf-8?B?WHkxQWl6WFpZYlNJaFlaeXlWaHVLWUp5L01LVzE2RVB6bTRSYjFMdjhzdmxM?=
 =?utf-8?B?UHRuNVJnSzdReHVYd3IvT0EwaXU3NVdBSi9leFh3WFlWdEFjaTJHNkVoZDN2?=
 =?utf-8?B?Qk9YUDZqU2Q3Umt1N2N1TDdwcjFMVVpjbk1LN21zYmV4ZUZBOVRLRUdPUnRN?=
 =?utf-8?B?ZEhBRUp4ZUEyUE1yclM1dllQTkp0YURPeFl6d2RLN1l5NGk2WjNXWmZOVFhl?=
 =?utf-8?B?K2dEM01xUWxyOVRrNTBDNC9lQnRTUDBsNnk1UFlZYldCeFpiWWI0VkxPUDMw?=
 =?utf-8?B?Q1lWWGtDZUcvVzJWbFFldjJGUHVYRmswNjZsZUIrZEdVVkFqQk9yTTdKM2FN?=
 =?utf-8?B?MGNpWDNZdk9PU1dzUWpHd1hMVDY1b2R2V2ZlYXJnWTJpbzRJR1VlT2hNQWE1?=
 =?utf-8?B?WlBmSHdQSG5GTnduQkxHazV4UmsrZVRRNTl4VDdVZ002OEdBWUsra0RFaWtB?=
 =?utf-8?B?RjVVMnE3OERnOURQWUd2cGtEWExFQ1FZSHVlTWIxRXNSa0x0dmlYS3V5R1lP?=
 =?utf-8?B?bnpKYWhDdlBPcTR4T3pvRVFNcUh0dHVVVDdkOVVJRExPSGhYcXdaNWpZdHd4?=
 =?utf-8?B?VXN4RUZlMzhWRXoyb21iOXJTVEozUGJhZVRjK09XS0xCLzQvd3FLQTJVVThD?=
 =?utf-8?B?WTU1eG1PUy9MY1ZwQm04aEFJSlFxbEwvdkpydE1WYTdiR3NjZ1RURWdsTUd2?=
 =?utf-8?B?Q2FQRFJzbmFjLzh1MXk4VFRaNW5BMDg5K09Hb3BYWWxsMHZNcEl2b1N0R2Zp?=
 =?utf-8?B?a2NWcG9CQmlUMjJOWU41QVZ5czErUmlVNm04bGtOSFBESExGWksyT3BRVlRq?=
 =?utf-8?B?VzB0M1NFQU0vRytOUHpHeXFRYUlJNVAxcHBwdDZrRDc0R01qT1h0Um9RMVNv?=
 =?utf-8?Q?V+3jWlGdcBDTjyq7qbpQEwEhCNo0ooLiv4TC19L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjBkVVpVeTF1SS9FbXQ1UGVLbS9XKzIzeVd5MGNSdHJBWHdpV1U2Y1JOVGFI?=
 =?utf-8?B?N3QvTi9sODhmcFZydWhJMnYrdWlIL1BiREQzejYwdlI1NDM4YnpRVEwxMUFU?=
 =?utf-8?B?b2pZNzJUR1FRU3Faelpya29aZ01jZVJrK1JXY1VPNmlpdlpwOVJ4VDhmbWdu?=
 =?utf-8?B?enRsTFZVcUNDNWdwdHpHSHBRdDA3dFFUU0ZqNTFXMlY1Q0Y2aTVxUERJU1Z5?=
 =?utf-8?B?djVQeC8yb09US0kybjVLYVhwdWZXV3N0aUlxL1U0QW0xL1V6K3E4M0VvcXJD?=
 =?utf-8?B?VGIwY0hsN1E0cUFpU3oreFovMU9TbmRwdGh2eDRPcTV2enc3SjNkUUE1SVlO?=
 =?utf-8?B?U2NBRXlEQzhjTDNudysxQTU0SVhUeGl2aWE3QTZNbUloa1RpV1A1VE9CVXZa?=
 =?utf-8?B?MEdDVFFDUDA4UGFzK09nZ251Um56MzlGZVpmeGdzMVZzLzg2SFFXNGtjdWRL?=
 =?utf-8?B?TUd2QVlZWlA4QlN1SkVxVllsNFpLbk84VW5QVlZaUUluUGVIYTlZT1JLbXAv?=
 =?utf-8?B?emJKWnV1Y0tzUi9DZUlvVmRwc0dxNmtXZTU0ZjFrK3NDWmtialAvMTFFdGF5?=
 =?utf-8?B?M3RBanhsYjVMdHNRVC9WOHE3ZXcyaURJNzQyZVl5ZHpPQThqRkZZclFKZ0F2?=
 =?utf-8?B?bVkyN2JjYTdZNUp3eHZ6NzgxT2hsV2QyL050bXJIWWNvdUlDZzIwRnBuanps?=
 =?utf-8?B?M1FQSjdPY2o3MG1odk00SHlGa1gyYWF2OE95WEwyTU53VUsrNWF6RzhoaHor?=
 =?utf-8?B?amxvUHAxWHY5WGhUTUVCMVpreFBpRTkwdmJ2U2hacXY4WHljMXlhU2E2Vklq?=
 =?utf-8?B?MmJCeDMzTVFGQ2s4MVRQNkZ1QnAxQVp0czdNSXJ3bVpKdFl0OHpDemJubmFR?=
 =?utf-8?B?d2syOEFjK2R6c0Q3MEJoS2VsSTZmb3BEdWkxQzFTTGh5V2NMSFAra1cwYkRy?=
 =?utf-8?B?NnUyUWxCZ1RnNG9xd2U2RmFTbHlxUjJKZDE5a0FTOEZ6dC85eGRWdUU1SEZE?=
 =?utf-8?B?ZyszRHUydndnR0ptNXZJOWZrR0dKTkcxL2FCOGlkWVVTQ000eXBGcFcwQVZu?=
 =?utf-8?B?YjRtT3hwWnVsYVJ4Z2ZuTVpmc0Jad3FXR0xIK1ZpaVhwSzZVemh5Q2srRlgr?=
 =?utf-8?B?OEx4Zkt5VVdmNnU0ZEZBanh3c2tqWmtETy94Q0hvZkJmcjlZNmZuYlRiVk1i?=
 =?utf-8?B?dEtzcDF0a0xrMlYrRlJVNEV3enV2WDhac2krWlFwcmIzU0NTU3FTbDl5QW44?=
 =?utf-8?B?RFB0SWJPeUFlQ1ZRMWx4Q3dEdENMeVlBaUp4K2hBeTRrNGJYS25xbjc1OG95?=
 =?utf-8?B?RWNpaVd4Tkl1TnA3V3dUQjhBQTg0S1dYazRYdU1CcDJwVTBYeGFNaDFCMkth?=
 =?utf-8?B?UEJrMC8zMDBUY1k5MldWUExhWlpoaU9YL2VYYkVSalAxRkxuUFBsTndOMGZq?=
 =?utf-8?B?TWo0NS9TcjJ5WWdCRC9JRnFaaTBqWVZMZVJyaEJRZVJKcUZtUGlQcVF1cDdu?=
 =?utf-8?B?dU5kMVRGZElYd2IzZDgwWjJVTk45eGs3UndCYUhoempoWUM2L2hOQlNMMEc3?=
 =?utf-8?B?eFUwV0NuRHNXK1lOV2hTY0VORDFvMmhEbjY0bHVBc3N5bWtSZW1ENzM4N3Vy?=
 =?utf-8?B?YmVia0dsb093akU3alFyUHhzWUpTb01QekIrMExidjNpcXZKTFo5L3BVSUVZ?=
 =?utf-8?B?N0V5L2ZKUXdwbGdIK29zbUduSTBpcWo0elozNjFXWHpYSmlJVTA2SjlPMjhw?=
 =?utf-8?B?L0FRK1JzWWY0MHlsajJJaE9UdDBnVHQ2aVpraEpEQkU0d2phM3oxaUFxc1BZ?=
 =?utf-8?B?UlR4cFhkMG1JdHkvcDNaUWFrM3A1eVp1cUI4M0svbFVnRWFrQ0tOMHhaR3Bs?=
 =?utf-8?B?TzhHdnZBemJuTlBJRkdQcEphRndOdW5pM2sxYU12d1FDODcwTkNGTjlSNS9m?=
 =?utf-8?B?M2tmTXB2SjBIYk5yWHdtY0hqT2JUVUxHV2tTZUVacWVZR1liVytYZnJiZG5Z?=
 =?utf-8?B?bVdORXdqcmVZbWQyRUdabWpULy9COVVSWHJMUndaOWpqNnB6SkhNSXFxQkZO?=
 =?utf-8?B?QW0wc1V6ZndjT0pMTGVNbmpYcDVQWUwySHJ6UFYxK2dlelh3bHNUM2s0bWl3?=
 =?utf-8?B?NlI4NHBSVm5aUnVXcDYrSmpMaGZreE5kSnRNRSt2a0tYaXNiaE94bGVlTUdv?=
 =?utf-8?Q?SYcxWnpwD8kd/tVP9t2OXV0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e4cd09-c6db-4b62-746e-08dcf52cc40f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 19:39:39.7905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XqQmA4nonvfBsmQhR5QKkS1px/ehG5qMwK8C0HFfLEKWlBGl/7PAOUxR+Gh/blyRU7tL2x8031i5HJHypDDSW2MDrStiS1RR+A6Pdp6yNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6972
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

+ Lucas

On Wed, Oct 23, 2024 at 06:45:36PM +0200, Kamil Konieczny wrote:
>This test works only for i915 driver and also uses i915 specific
>workload to validate fdinfo so rename it to avoid confusion.
>
>Also while at this, sort out few i915 build names in meson.
>
>v2: correct Tvrto address (Kamil)
>
>Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>---
> tests/intel/{drm_fdinfo.c => i915_fdinfo.c} | 2 +-
> tests/meson.build                           | 8 ++++----
> 2 files changed, 5 insertions(+), 5 deletions(-)
> rename tests/intel/{drm_fdinfo.c => i915_fdinfo.c} (99%)
>
>diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/i915_fdinfo.c
>similarity index 99%
>rename from tests/intel/drm_fdinfo.c
>rename to tests/intel/i915_fdinfo.c
>index b66ac9e1b..c26ae9737 100644
>--- a/tests/intel/drm_fdinfo.c
>+++ b/tests/intel/i915_fdinfo.c
>@@ -34,7 +34,7 @@
> #include "i915/gem_vm.h"
> #include "intel_ctx.h"
> /**
>- * TEST: drm fdinfo
>+ * TEST: i915 fdinfo
>  * Description: Test the i915 drm fdinfo data
>  * Category: Core
>  * Mega feature: General Core features
>diff --git a/tests/meson.build b/tests/meson.build
>index 34b87b125..d2b81b38d 100644
>--- a/tests/meson.build
>+++ b/tests/meson.build
>@@ -88,7 +88,6 @@ intel_i915_xe_progs = [
> intel_i915_progs = [
> 	'api_intel_bb',
> 	'debugfs_test',
>-	'drm_fdinfo',
> 	'gen3_mixed_blits',
> 	'gen3_render_linear_blits',
> 	'gen3_render_mixed_blits',
>@@ -211,15 +210,14 @@ intel_i915_progs = [
> 	'gem_wait',
> 	'gem_watchdog',
> 	'gem_workarounds',
>-	'perf',
>-	'perf_pmu',
> 	'i915_fb_tiling',
>+	'i915_fdinfo',
> 	'i915_getparams_basic',
>-	'i915_pm_freq_api',
> 	'i915_hangman',
> 	'i915_module_load',
> 	'i915_pciid',
> 	'i915_pipe_stress',
>+	'i915_pm_freq_api',
> 	'i915_pm_freq_mult',
> 	'i915_pm_rpm',
> 	'i915_pm_rc6_residency',
>@@ -229,6 +227,8 @@ intel_i915_progs = [
> 	'i915_query',
> 	'i915_selftest',
> 	'i915_suspend',
>+	'perf',
>+	'perf_pmu',
> 	'prime_busy',
> 	'prime_mmap',
> 	'prime_mmap_coherency',
>-- 
>2.47.0
>
