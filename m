Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8C2C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 19:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A2610E2B7;
	Wed,  8 May 2024 19:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6S1Ry98";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A6110E2B7
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 19:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715195281; x=1746731281;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WGwibuUzPCc8evGskg7X41SzmSzfePHKfXIO1OSr/ac=;
 b=b6S1Ry9806mrj3Q6lSxraVtFGrRmTHR4OZbyfvcIfO6eJYPKpTAimweM
 TmpKry9NsDFHpl7Q9E+QhW0d1l3dM+F7JKgHox2/CGRYEnvJ093pUD7wM
 AdyS1XrSvfYRZgJ3sR6eX+/Wh0Wlf9u30CT6cPDNlr7MWe5csSpz04JJT
 kXr7zqROwDm0ZdKg/JcOGx1lf22abKy0yrACw4/QWt/nGlozLkl7eTSYH
 Uyx5tdOm89LXQzht6CDNC4O7k8y7fvhY7LHvOp+rkm/HFO00ElOLKHgfx
 lyYYVBy6Rzq5dxhnf9pNb6sAtJp0w6lNLIkGcZ0VwsS90h7RAYpUdA66t w==;
X-CSE-ConnectionGUID: C24JPrW7SQ6THY1uM/cYfg==
X-CSE-MsgGUID: tOyW6w8gTaO+Xx1NnBwLjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11433161"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11433161"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:08:00 -0700
X-CSE-ConnectionGUID: 14o8pW7NQBqi8tjPJeJI8g==
X-CSE-MsgGUID: uQ/hT31JRKa7lzJpru8y4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33789356"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 12:07:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 12:07:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 12:07:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 12:07:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbl+sc/wVExf64n/jFP4dDkpuC9mYd7XQtMD0ZbLZ3r3L/V4u1WajtBc2Z+TQ5dwNvnVchi/zwvuPXbpX7rS+F5Dv+OWzVudGS93VG0FxsIY/Sn6ovyPdPL+Iectg9x1qsdaR98i38GX53r25Y3rRGDHz/kyjRRlbXPYkh08KH2fi8oIcRCKDlEqNbaO8iAPkOsl8agxmu8xD64f96MumhoVPh7Py5yuaZ4NGbmlrYF/r7Qr99rhnKJUA5X6JOSa2G0sY/yMsrNLX5S0QhWf1Yv7clbHaHDoWVLp9DZnLF5V0jzPttkQgL01JbQ7Q/KtxsdT9PmqP9X8Oh+V+3OQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gC1p3sVYmbsJY/y4/r665jiKDW8DlpR2KgGuPnBPo20=;
 b=fLOPoOHxfr7C3pGPdiF8S+XXp96l9OttS/Yn/BrckQBg2jOqFpfT/3pn6UqIbf+ku4R31x/wvxthvhhDXR0cpQSc3ae++EaU9/ZFBBb1mvial6xf0biufk/HBvl8VacJCdmAlZO1r4WqGL2Gwnxe+1rTs9LpRIBV9NOyXWhSMiKBqc4yHljb3h9am1zOdXustZRtKMg3MU0f2iZM9EAOyCcMVd/tVE6nLVCgWOKegjAHtr9MTtV3/b9+yPhBb6AREOq1xzp27yYjKkI7gZbhwhbEgoNICrl8NE2XX68iD+/jD2txdCF68j2syEsY/1N/b0B5jPsGG65OAMuJWVccCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Wed, 8 May
 2024 19:07:42 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 19:07:42 +0000
Date: Wed, 8 May 2024 12:07:40 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 12/13] lib/igt_drm_clients: Record total cycles
Message-ID: <ZjvNfMUqWvTaRWAG@orsosgc001>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-13-lucas.demarchi@intel.com>
 <ZjvL9YI1889za0qT@orsosgc001>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZjvL9YI1889za0qT@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:303:8c::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: e4218239-5549-4af8-27f6-08dc6f922324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGh0ZStDSlk1UVo0RXJpYmVKbURVSkxNU1BNSFdVTWVJNDB2ZDJNeWJ0TUcx?=
 =?utf-8?B?dW8vcElHelFrdFpXWDNZNTNmNWVMN0hqSmVQb1IxSEkvcmRBV3p0NWp1K1l1?=
 =?utf-8?B?WGhNODI2WVhGSzZvVUM3TkRBZFUwdDE5VnRTM0dORmdLOXQ1NmhWdFFISjYy?=
 =?utf-8?B?SThFMjlPVkQ1T3ZwRW1oN3QvdmVtU1JFN1Q0c2tQN2svMkt5SjJ0b2hRSUdZ?=
 =?utf-8?B?UG5wdU5UTEt6cFVRTXhWWlZ6UTRSd1JNQ1NVanFqdS9FYlZ5YllNVnZ6SjBx?=
 =?utf-8?B?ZkFsY1dxVXg0UGc0V2FoQ252eUU3d292ZEQyY0VINVlIVEdyV1REdHZ1emFp?=
 =?utf-8?B?ais2OVVFVjV1aXRXQUtlbEJEY3pIQjhLNE8rdWY1bDZKWkt3TDcwdHZBRFZl?=
 =?utf-8?B?YjNoUGU3eTE2TWNpcjNSNDI2YW9ya1B3bG1vZFJDYnl4aXowTUZXYnBiaWhs?=
 =?utf-8?B?RkVUR2ZScHA1WXBhZXlLNkY4UTVvbkJBQlJmSnI1cC9IYVhCb3MvVHBzTUxn?=
 =?utf-8?B?K3VxZFhWTTBQWUxSNU91enZOUlkxY1I3S1RBZHJNbVMxd1VvZE1tN0N2YTdm?=
 =?utf-8?B?UW1nNW5BcS8xb2lGVW0xZ1FRMjhRbUhkV2NQUVBaa0pTRkErdGNMYktmdll5?=
 =?utf-8?B?NDBLQmZ3N0U4WHBlbFZhRVFRMWo5R25uUHIxSW1IQ1dxNEVNbXhtaEJPOVda?=
 =?utf-8?B?eWYxZHpHbXphaVFRMlNWYUZXeWpzcm05OXpTbDFxYmxrSTRoUzE1eTJVVWta?=
 =?utf-8?B?STVaTjBrbWUzSStQcTdQRzNBd1NxTHRxV2ZIbDh2NmpSMytXeTRYR3lNUG1T?=
 =?utf-8?B?RDliZTRBZzVJQnd2UDlMNSswcGhQdkluaGxlOUdhZEErdWs1OG1VaVBLcUlo?=
 =?utf-8?B?MGQvUjlwRUk4UFVqWUJxQTZBWWJWOURsalpKTUhacWJQeFM0TVFlRXlYTnlS?=
 =?utf-8?B?OTNSZDYzQnU3NXFtcnBmZVdQcXdsM3ZaZE1RckdnVmhTeHEzRW1hdExxekw1?=
 =?utf-8?B?MXhmc2Yva3hEa3NVVThSZnc4dWk5dzZ0a1U2b3JyZ1RMZVNTUERrYkxzT0tl?=
 =?utf-8?B?K3ZySWxwZFJKSlBsWVJ0RHU2d3NuQ2FhT3gxRVVZN0JmWVE0d1oyRklVRkFD?=
 =?utf-8?B?RlY2RG9RYjlFK2htQXNyS3g5Q3NNR3VFMzFjYURGWk13YWJ4M0t1alhPd2Mv?=
 =?utf-8?B?UjQ5RXFQd0toNGh6VVdBV3J2eTZEVUZiN0lvMGVhMEI3K0VKaW1tUmhGSjhI?=
 =?utf-8?B?ZG5hdk40d2F3NnZpaThUcUFPMzNGY1V4QlA2VWhWSHgvdm52aDF4NnIwS2JG?=
 =?utf-8?B?ZlpOS0JFSHEwR1M3M0ZOUHJvSmJRSU5yOTU1RE0zQWhOaE1GN3lSUktvTWs4?=
 =?utf-8?B?ZmNqT3grcDhKdWw3d2gzcUJiM2Z2dUdPOVcvVmJNV1VNWmtxOEJra1AwNzRU?=
 =?utf-8?B?eHd6UmZ5UTZSOVVSSlB1VEN1cWxMVHVoajZPWUhwM1lMSkJkNy8yUlFaNFFD?=
 =?utf-8?B?bkJpN2FxcDZIZUFIN1BVRXRyREhuSVMveVNlcWR2blY3N3F2d2RKMnRBU3lP?=
 =?utf-8?B?WlZucjhkamJZQ2dhTUhDMGZOU04rdXIvdC9CRVVVekxpMTlIWEw5NFc1SHdr?=
 =?utf-8?B?Vnp6MU55QmNZaU1paE1UenIwTmJWVFM4U25PWnQvZlBqaUZLVDNMWnNMVUY2?=
 =?utf-8?B?L2s4L3NQaHRXR3JNMi9FbHMyeWQzMjR4MTRvRVRxS2NHa2dleGhPNFZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWZSR2Znd1Nib0VoN0JzRXFJcGVNcWRwKzR5YXBYSm9RREhqaS8yWDRhbm82?=
 =?utf-8?B?MHloUXVUZmFtNmFkNjluM1QrbUJVS1kwOTNUcW0wL3JwNzhXY3RRcUhjdVJZ?=
 =?utf-8?B?bmZiTUJqbHZWZHhuVUZsTUpJYkc3MXRGbTNGQUNDWTNqK1VMcE8vRC84N0JX?=
 =?utf-8?B?WHptRjdSbzhsbTlldXBxV2p1REl0TXBBRncyZm5lN01KTjB1TVhGT1Fubktz?=
 =?utf-8?B?MzlYVWpSYjNGL0tYME5LUittRHREdlJuZUJrcFBDck8xRGJkNmNjMDVIM3py?=
 =?utf-8?B?ZWtkL0dPdVNvMEhuZ21yTjNzL3VSWDJPUHBVcHhEZkIwWnVFSk1ka0djY2d2?=
 =?utf-8?B?bVBHZU1FYjEyWnlNNURRUkpocVIzaHk1NHNsekQxdW1kQTdZSlJqcFFEd3BC?=
 =?utf-8?B?ZU82T0lrc3htczFycjVRWksrTWwwbFJod1dqekgrdExQTWlZb245TE9KTmR2?=
 =?utf-8?B?R0RTdWRNMnVhODE4Zk1nUHUrekgrZTJnWmdJeVo0cmNaZEtmTzVONjh5UzhR?=
 =?utf-8?B?ZUwyU0FVVG9NKzBoSThyK1dIVFpkTDZtT2VLb3ROdi9SdVV0NW14amVDZHh6?=
 =?utf-8?B?SW0rcGQrZklFL2V5R0RwRVB4dmZIQ2xaODBNRmhESk55R0VRaFd0L2FQem9Z?=
 =?utf-8?B?YjlXaXRhVldYRXliSzVrQjU1cDA4Q29OMVJ2dmNsbWFYYWZXeUx6TWtQWFh6?=
 =?utf-8?B?Q2V4aWFkV2pQSEhMUVFzMk5nQjhseTVicEZMOGFaM0dreHJNZ3g2TW03dGwy?=
 =?utf-8?B?Qys2RUd4YWIrZitUSGtKd2hrMk9xNEZLTGtpVll3bVRuT1lEY2I0TUxOTEln?=
 =?utf-8?B?VnJnTS9QZGszbEVHQXYwNVgwOFI2Y1ZRdmJ0bDlkOHMyYnE2ZGxYM2ozcWN0?=
 =?utf-8?B?UVB4UWRNSjBqb2NnN3R4bjk2NCtmQU9ZUnMweHArWlM5cEFyUmd1QjFEeVA2?=
 =?utf-8?B?WlFNYTFDUFpIZk5teC9RUkRzck9aTWU5aHRPM2pkUStXMFc2TXhMMXJHcFBs?=
 =?utf-8?B?ajRYR1FHa0llWDZ6RXM2VjhLN0ZmKytCVTAwZlNIV0krcE1wNHlla3poNEd2?=
 =?utf-8?B?WXdDSEcvR3hDMW9IdVdtOXI3dktKaTcrMVlzRUptYWpUT2hyaDN0R2ZRUEtE?=
 =?utf-8?B?QUJmTEVUOTFwK2xrb0NIVW9yMXZ2aTlQOElyd2FiVUxsSWJrUktYZXlHRnJF?=
 =?utf-8?B?UmRnSXJFWXlydGZLN0tjL3dDeDU1emsvdFpUWlhyNmFMOUVoK1NYMCs1K1My?=
 =?utf-8?B?d0R1dGZtWklJR3F5ZmZuUkhaMDFubkRxM2tUa0FGUllyK05YQlEvZ095c0tk?=
 =?utf-8?B?cHd4WnFqcEE2NzdKZWFKWXdOS0JZTGM0dm5PQjg3K1Voajg5TElYRFhuM2ZT?=
 =?utf-8?B?WUp4V3FZS0NRMUV1TGJUZ29aVS9wMThrS3dCdm9LRjFEN0hGN0xyUldNN1B0?=
 =?utf-8?B?TTlJTmR5MGR5cjB5NWNwRU4zUXNoOXc1UmRuZElEd2c5N2xsVTd1RUhNcHRa?=
 =?utf-8?B?Q1gzREVoYXJBOGlCTUU0VzErVmxybXNPVjJaNW5seTlkaXlpYXdkVklDMXlV?=
 =?utf-8?B?ZUN1aTc4RWcwaVVnMFpmM0IzYXhlUFFXa283QXFtbnJBQ09hbzBURzVPcFk4?=
 =?utf-8?B?dGtrN3JMRVo0UGwycEk2SlF4b2p0YzgvY3ViMXRrM25pbjBMY2tiNUZxRk1O?=
 =?utf-8?B?RU5ZcmpXZldBU1dRUEJhTytmaEtYeUJYU3NueEFObjBSa3grbHhuY3BJaVlh?=
 =?utf-8?B?cDdjV3BVUlhiZFJvcyt1VllLTXhubXpocDVYWXRMU2pQYnZrRnhDck4vM2E0?=
 =?utf-8?B?akk4WldKZ3VDOUp4SUNEQVFwUEFlYlFaUGwxY09DN09lNHhTd2VVTkRnTU5G?=
 =?utf-8?B?R1NpcUZYSlo5UzAyYTFwWVIwZjVJUGpISHk1SjFvaUFudGMvU2R5MFBUZVQ1?=
 =?utf-8?B?eEw5TEowdHZRRkJTTEJxcWZyWmVrQmg0ZmJBaENCM2JubUdsWlB5UGt6U2pG?=
 =?utf-8?B?NWt0SGhwaktvMkNia1B5Z2FNQ2FCZFRaU1grT0E5VXhFdUhXVE5CNUU2VjA1?=
 =?utf-8?B?OGxqYTVhb3ZXWXVGMW9ZZzg1QjNqdzBEOCtjSjVNY1VZTUFpYklGelF5VWdT?=
 =?utf-8?B?Uldza0RTNDBhbU4zTEVUbXNlZjFrbGNya3hTaEV6U1JWaWszdVRQbmNzcXlV?=
 =?utf-8?Q?kEpfy4k/ZA7UL59OjukbJsQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4218239-5549-4af8-27f6-08dc6f922324
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 19:07:42.6306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5l/kwM932ymRhFW/ewi8ZyNPOe2OAPxrBXYIN8lwE3Z4fP6S6uAAhv9lgT66LlERzF3IuViK1Gn/6Yy2a4qHQesrhKe3naUJzNietC6BDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
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

On Wed, May 08, 2024 at 12:01:09PM -0700, Umesh Nerlige Ramappa wrote:
>On Fri, May 03, 2024 at 11:46:42PM -0700, Lucas De Marchi wrote:
>>If the fdinfo data indicates there's drm-total-cycles, use it to
>>propagate the engine utilization. Also add an assert in intel_gpu_top
>>since it only knows how to deal with with engine time busyness.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>lib/igt_drm_clients.c | 13 +++++++++++++
>>lib/igt_drm_clients.h |  5 +++++
>>2 files changed, 18 insertions(+)
>>
>>diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
>>index fbbb763f7..105c7d298 100644
>>--- a/lib/igt_drm_clients.c
>>+++ b/lib/igt_drm_clients.c
>>@@ -107,10 +107,13 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
>>	c->total_engine_time = 0;
>>	c->agg_delta_cycles = 0;
>>	c->total_cycles = 0;
>>+	c->agg_delta_total_cycles = 0;
>>+	c->total_total_cycles = 0;
>>
>>	for (i = 0; i <= c->engines->max_engine_id; i++) {
>>		assert(i < ARRAY_SIZE(info->engine_time));
>>		assert(i < ARRAY_SIZE(info->cycles));
>>+		assert(i < ARRAY_SIZE(info->total_cycles));
>
>same comment as before - maybe just ensure array sizes are the same.
>
>>
>>		if (info->utilization_mask & DRM_FDINFO_UTILIZATION_ENGINE_TIME &&
>>		    info->engine_time[i] >= c->utilization[i].last_engine_time) {
>>@@ -131,6 +134,16 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
>>			c->agg_delta_cycles += c->utilization[i].delta_cycles;
>>			c->utilization[i].last_cycles = info->cycles[i];
>>		}
>>+
>>+		if (info->utilization_mask & DRM_FDINFO_UTILIZATION_CYCLES &&
>
>This should be
>
>s/DRM_FDINFO_UTILIZATION_CYCLES/DRM_FDINFO_UTILIZATION_TOTAL_CYCLES/
>
>or a new name if you decide to change things based on below comment.
>
>>+		    info->total_cycles[i] >= c->utilization[i].last_total_cycles) {
>>+			c->utilization_mask |= IGT_DRM_CLIENT_UTILIZATION_TOTAL_CYCLES;
>>+			c->total_total_cycles += info->total_cycles[i];
>>+			c->utilization[i].delta_total_cycles =
>>+				info->total_cycles[i] - c->utilization[i].last_total_cycles;
>>+			c->agg_delta_total_cycles += c->utilization[i].delta_total_cycles;
>>+			c->utilization[i].last_total_cycles = info->total_cycles[i];
>>+		}
>>	}
>>
>>	/* Memory regions */
>>diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
>>index 514c09e71..946d709de 100644
>>--- a/lib/igt_drm_clients.h
>>+++ b/lib/igt_drm_clients.h
>>@@ -36,6 +36,7 @@ enum igt_drm_client_status {
>>enum igt_drm_client_utilization_type {
>>	IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME	= 1U << 0,
>>	IGT_DRM_CLIENT_UTILIZATION_CYCLES	= 1U << 1,
>>+	IGT_DRM_CLIENT_UTILIZATION_TOTAL_CYCLES	= 1U << 2,
>>};
>>
>>struct igt_drm_client_engines {
>>@@ -74,11 +75,15 @@ struct igt_drm_client {
>>	unsigned long agg_delta_engine_time; /* Aggregate of @utilization.delta_engine_time, i.e. engine time on all engines since previous scan. */
>>	unsigned long total_cycles; /* Aggregate of @utilization.agg_delta_cycles, i.e. engine time on all engines since client start. */
>>	unsigned long agg_delta_cycles; /* Aggregate of @utilization.delta_cycles, i.e. engine time on all engines since previous scan. */
>>+	unsigned long total_total_cycles; /* Aggregate of @utilization.agg_delta_total_cycles, i.e. engine time on all engines since client start. */
>
>total_total_cycles :). I can understand that since I am looking at the 
>patches in order, but there might be room for another rename, maybe:
>
>s/c->total_cycles/c->total_engine_cycles/ (since this is how may 
>cycles the client ran on the engine)
>
>s/c->total_total_cycles/c->total_<something>_cycles/ (where 
><something> could be - "available" or "gpu".

On second thoughts, I believe <something>_cycles is likely derived from 
drm-total-cycles, so you have named it accordingly. I am okay with this 
as is.

With just the if condition fixed above, this should be

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>
>Regards,
>Umesh
>
>>+	unsigned long agg_delta_total_cycles; /* Aggregate of @utilization.delta_total_cycles, i.e. engine time on all engines since previous scan. */
>>	struct igt_drm_client_utilization {
>>		unsigned long delta_engine_time; /* Engine time data, relative to previous scan. */
>>		unsigned long delta_cycles; /* Engine cycles data, relative to previous scan. */
>>+		unsigned long delta_total_cycles; /* Engine total cycles data, relative to previous scan. */
>>		uint64_t last_engine_time; /* Engine time data as parsed from fdinfo. */
>>		uint64_t last_cycles; /* Engine cycles data as parsed from fdinfo. */
>>+		uint64_t last_total_cycles; /* Engine total cycles data as parsed from fdinfo. */
>>	} *utilization; /* Array of engine utilization */
>>
>>	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
>>-- 
>>2.43.0
>>
