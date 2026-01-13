Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875E7D29DF7
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 09:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337D510E119;
	Tue, 13 Jan 2026 09:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RoKXTY1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C4210E119
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768297201; x=1799833201;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KIaCIVHqikqhTM6A6snbdLGnQt1cZkaPNDO3SNYqVv8=;
 b=RoKXTY1UDqhXY5FAgDi6sdmcYz8D4Lc6uWXfLlNQJ6gaztWoHGX3GKKq
 yIaQ6tpOfUsgwe9gKhb0UEKbzTFN7duwM9dIncybndPlYOyZfDeNi9Qzx
 VD5bCEq/c7QyjtDZFpGs80RZfKoD0BUUAJjd+VIc2mbe6cB0lqAffnJF2
 Mt/SE9+Et293TyPEb7yTW8O48lIaZ9bVkYuZ6bS9czfDyYmp9xZN1S3PA
 jTw1AMVa1ZsaH/sFLHPVJKV0JcQnCahmcDG8pfbNXZ8eLxo3doKioPwrM
 IO3I/zk+/g8pDbKDZeneBWm4GIrGeiDZnsdzTTDmcPCFNMd0TMINoMxZG w==;
X-CSE-ConnectionGUID: ubqkP6CVTByJt+ciQvQX9w==
X-CSE-MsgGUID: PVXoL1FKRvanbrzJ97HckA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68583390"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="68583390"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 01:39:55 -0800
X-CSE-ConnectionGUID: d8HB0E0FR5GRWnPbjgHutQ==
X-CSE-MsgGUID: j0xbkVKxSEKvxguqZuMKPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204951375"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 01:39:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 01:39:54 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 01:39:54 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 01:39:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyZDNPl04yyH2DUedOJGabfJn4MpDaCohv+OyLs9YRC428TdUry/v8AQCh68woM19YybNFLcmRPwuEbniJ6Kaw3HzF4ENyxM5cFnlclRqO1yRLpWsyuRycMu6aZbWtEHgoOAaWc6yvNQv0b0YEBO7DIlWnUmoMQagWPui/KwJ9Jg+whlx5vpPSwACMJtw4friuhSrAbN2NcsvSSojz5WT14wYKNMS4BYac01dJF+3L+vkfUBGQ4fioGMyJbsNlpRA+593CrT3xRix47pBFjniMG2qld7g2dltFn2gdvJsOhiG0+BgWI4b4m6mX/YiM0DlmUPZwTPgz+KDEQCfHDzWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCYJkt4ony6iR6KAdCgmXz6sbiXp9xR9Hg5EMb5sNE8=;
 b=QvKR1jjmK/y1SE2tRZGjFPwdNJ2nZO9hkiCK/NJ87bAuHgfvS2xvu5mUox/9JvhGC46Pk+QOPnSZXzu5raB/2Ixy04otoqrFjW8Gh5cajKtp39rq78DqHItOomLbiVU6Rs0fHa6lo411epc5B9UIKAOZOVbeiCw2Sb9rNsjQBVOc4EZDgo1yX7vQEnI14NvcJEOQW94ciQkRr2ttplYwNLfeMTq9T6TFVaAzSQvr0j/MH3q03Y7G1P7jqDKhmHCv9Z6Z5ymXE7cPv668w62MSteeqtR5zB0YXlcEMB2Sbs2r4f7O0R/XiNGUGSlkkagrjegy/SyUanW4k8RdQBVgSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 13 Jan
 2026 09:39:47 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 09:39:46 +0000
Date: Tue, 13 Jan 2026 09:39:37 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v1 1/2] runner/settings: Add new option
 --reduce-dmesg
Message-ID: <ig4bglqlw3lxggtg7lnmrfriaat7x4cvmmbruljc47cfslk7gp@tz4uc5l5yp4i>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260112165006.237964-1-kamil.konieczny@linux.intel.com>
 <20260112165006.237964-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260112165006.237964-2-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH0PR11MB4806:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9e2dc3-0f70-40f9-cebf-08de5287b053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDhTWDM5c1ZFcDMwblhjbTBRc1FkZWRIUEVZMTVCWTAyeWZsZmV2dUhwTEcx?=
 =?utf-8?B?b1M2a1BSWjVsN3Q5NklhNGdVSlJmdmNxcE5icGdUUXR1QllCZHUraTZqNVVD?=
 =?utf-8?B?MHdTRmlxUHM2UWU0OGhqWU82VmRwaHhCc3dITTlkVWpBWG40NlhEVEZjNHhw?=
 =?utf-8?B?c1pRT2Q0UWdjaXVDamdyQld4OGtIYTFLbTRsTkgwNnVJR1pQamVnbmVjeUp2?=
 =?utf-8?B?dXArNytsQWpQK0RkdytUc0U4YU1vUWRSU0VxS2oxOHJRRVBqSVdJKzkvTzFT?=
 =?utf-8?B?VHB0WHlrb1REblQ3cGdmWXNab0E4M2R0RVNJSWlHd2daQlVSaFc2RVRPUHFk?=
 =?utf-8?B?MEd2V3ZZMStETGNvU294M3QxQ1E5K3hLeklZOVVtRDNwOEVtcEloTmhUQlJH?=
 =?utf-8?B?ai9oaW1IVERna0J6QU1tWU9reW5YNkRXVXNYTml1N24vZld4VFJLc3JBVmE5?=
 =?utf-8?B?TUptNWlzWXRJNmdTb0NRSmtmc3lPSzhzdk1TOExRaCtYRldWbWhPRUNETDR5?=
 =?utf-8?B?Mzd2SWpiclVDclNMOG8wQlYxbDNTeStUSkJOdVZvQUhGYVE3UkJqZkpOd21z?=
 =?utf-8?B?dFJFZ3QzZG56a3Y1d0pFRHJ0UDlOQmt0dDJqenlqNnUrUHV4SkhVcCtxUU5R?=
 =?utf-8?B?L0VPb3BhNXNFcUZ0OHVyaTB2ZnJ3K0RMS3B3N2o2YmVsdzRRb3pZRlN0eDND?=
 =?utf-8?B?bmpISmJLd2IzaUFJV2k2TUF5QmMxSFppOXFlMGhvRkpvb0JUK1NndXh6L2hL?=
 =?utf-8?B?dmVseEJtbDQ4UHRDMEIrMm5raWdoTjR6RWRsbFJiK0NvSHQ2RHhTWE9ZRmZV?=
 =?utf-8?B?SXlSUlV0Uzkzd3A3VUhjcDFSUEtkNmFiaEdYMTR3bGF0SDgzVkZPT1Y3Z2xj?=
 =?utf-8?B?eTBpQVF4RlVxMURuZVlxNDIrQzJ5S25VaGZ6dFJxZEZ1dDA2a0Q3N1E5dW5X?=
 =?utf-8?B?cmZJcmNUbU1MS1h0VnVEY1dpbmh0Mm90c1pOWXBXSjJLTkUxOWlkTEpVVnNr?=
 =?utf-8?B?cWQ4SHd2ZjZnUE1xQU0yTlVUekczdUk5S0pWTitvbGxqZjNCYlZwZzliRnFM?=
 =?utf-8?B?T1dWVmlRRDM3aUVEb3NUVURQNDlCb2xKbmlkMjVJcHc3NUZOeEk0d1N1UXU2?=
 =?utf-8?B?Y0hucVZYYWdGWVZEU1F2SEY1eXB5SUJZZXZxRVlkZERvOGpsdmNpc2RaVFpY?=
 =?utf-8?B?eElzTms1ZDd4c3ZvZDB4UU5XSkx2ZElsVFVRMndRODVtRkVXRWl5S1NDTjNS?=
 =?utf-8?B?N3pwT3NTaUlJVng0N3VXU2FkOHpNUGNsaUNPZ2FBN3lGQVVTR21oclZ0NkZS?=
 =?utf-8?B?WGFNOUlUdkVUOVJjRmljVXdwZCtWbUpMbS9LSFdXWVk0aTNvNTJoTHZWdG5x?=
 =?utf-8?B?L1B5VTZrNjRvWVkvU2Zjb2cvUnBTUWtBeVEvOVhGVUZqVnhjcTEyT2dIMkhJ?=
 =?utf-8?B?UWF5THFoQnZuc3lXYkw0TkZtZ3lLZjZXdno3TFBWVjB5MjZLNDFEUXcwcEcx?=
 =?utf-8?B?UTF5TW95cjBobE9LMW5IQjNlTTFrWnpKMFBsNVdoSmE3M0lRUytWNThocHhN?=
 =?utf-8?B?N292cGIvMkZGeEUyeFFhU0Q4QXl4YmpOcm1jOWRnbldjMDkvWHRoR05UeFMx?=
 =?utf-8?B?aWxybFBNZkY2bmJITk5OaDdNM1dsOHA3MVF3V2w1bGpGVXA2bDdaRmY3UVJH?=
 =?utf-8?B?TWZ6VXE5QTdLVndhTWtOSEdjaEdyTEk1ZlFuV25LYkMrQ3RwVGtyZHJUbmp5?=
 =?utf-8?B?c3N3RCsxdzRpMG1rL1ZvbVdNM0JDMlA0NkluN1VCWS9qKzY3N3BoMmVpamlJ?=
 =?utf-8?B?aE5JWVpKN0dhVEQyR1FjRFBoeTFROEVvT0g1QUJ4R0dFR0o4Y2NHc1dvQUo2?=
 =?utf-8?B?N29RdVk0MHZtbVB2VUtFRFVLenJZV25sOVpOdGQ4WmsyakxDYjV1bCtBQkJO?=
 =?utf-8?Q?IrjBx/MUMwBej5oGlT33dwNJH38mDTSD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm56aklheTRSTVlNT0VZaXU4OUttellzaDhESWdQeVdWWmlQTHVDSkpjVXJj?=
 =?utf-8?B?UHlpTDQzNll1YUs0bTk5aTUwdG9JM29mVG1ybllISFk3bXNGTlVWYTA2RDA4?=
 =?utf-8?B?YkdTUmVNMWxJU2NjZ1B1UWhlN1AvRGRONVc4TU0xak93akZLcGlWeFMxYjBy?=
 =?utf-8?B?M2ttdXpTRlloZ1ZOWTdvSjUyZ1BpcTJBa1RhQitRWDJsd2RSOUI2UmI1YkFS?=
 =?utf-8?B?azF3MHhrT0RwU0daVDZZbkxIRXhhM29NWmtKek4zT21IQWdGRmFRWmEwdHlk?=
 =?utf-8?B?ZTBvRm1tTE9wWDRzcnBhUlBsUzgwZEdQWmZ3QUp3YThMcGxWT0NOeGhHUVBa?=
 =?utf-8?B?NklhcVlIMjVxWXlZZHN0enAxTFQvOGQ3dGlkbDVsWDVRZXVYeWRjcFA5M2tG?=
 =?utf-8?B?VmJuVFJrcGFHQmZGKzlsN3p1SkR4Ry9ucDVKbFdySVRYVmFHNDhxYk5oaEg0?=
 =?utf-8?B?Qk5yZVY3emYvMTkyMm1HN1NVM25tK24xZGR0TDA4NWFOcm5ES3dVV2FKWDlT?=
 =?utf-8?B?VU5HNFBySDJVbkRpZUFvTHdzSUhuK2M1NzJTYU9hUnhiRGpRMlVPT0ZNdEtx?=
 =?utf-8?B?dDFvck9FeVp6ZTArbU1yVFhZVlIrZVhkTEFBVnZUNGhqQUwwMUhWU1FzUDFz?=
 =?utf-8?B?Wm4yK2ZmYk1PK2lEeC8xYldiQS9sYW51QXU0Vk1xRnFrZlV6cGNqaVl0Tkhq?=
 =?utf-8?B?aEo1LzA0YXkrU2s5RzEzZ0QySkVyMVRFS09NYUdpakY0WUhJRDl6SExzcTls?=
 =?utf-8?B?ZHI3VGlWRDJhM3dDdjhGcU5Sb3owWDJ5Z201U1p2MHROVDIwU1hqT1UyQzRm?=
 =?utf-8?B?SUJUSGVFRkhGUDkrQkRkU2VHSWJ1RURQSW9RdDd0cndRUFh2Yi9iYmRuMnFx?=
 =?utf-8?B?OGMzdVpBbXdER3ZhVnpxT0ZDVUNMWlVVdmlPd0NXc1U3QzZwdDBacnJja1Yr?=
 =?utf-8?B?ZEQ0N1l4WTVBbXdQNDFjcVFtNmxqMkdwU1JkZWlXdGtmbHpBTGV5TloyTW9E?=
 =?utf-8?B?aVJZV1cyc3V4L0ZpNEd2c0tyMUd5aGxQNXJQY1A4QVJrWkM0cTZiS09lTzZT?=
 =?utf-8?B?emtCMkxBV0gzYU0wTENzcmhvQlUxUGhlQ0ZxbkQvUy9LMi9xRVRBcW1zbndB?=
 =?utf-8?B?UFQxMVFUTEFXUU5zSmlVUEZuSE1iNVovMTlKc1hKYm81NDFONlRzdVQyOU42?=
 =?utf-8?B?UURsTjQ1SzNkUUpMRDl1V2Q4d2RIYXRjanFDYTJQbVF2c1czN1FsbC9DMkV4?=
 =?utf-8?B?dkphOHQvd1hTRGE1WjkzVndPR2RLdTN5K3V1dmM3UlRJSXZFNnZhOGNPb3F3?=
 =?utf-8?B?NVJIN1JmNUlkQzdTUkhWUjdBV0tLSmk3L015L0puSENuT2MxK1NoYU9YSXB5?=
 =?utf-8?B?MTdyYUJjRDltNSt2Tk9jb1Z5K0ZOQnRtSXBzaGJrVWRTUkZwaStCTTdaSGlI?=
 =?utf-8?B?NE9lbzFpdjVHRmdMWHNTV0lBUDN4akxCVHZlcElUQ2NWNS8raXhMRzdtdW05?=
 =?utf-8?B?dHBHaThmWFF0b0tsRmJKbnE0N1VyemxJSldlVGRvYzBQL2hvYWRVVjJ2WTNM?=
 =?utf-8?B?dW0vSmVrcWp6VXJSNU0zdGRGSXJYU2hLeXNJaSs2VHphNDZpL0xoeDZJMzg1?=
 =?utf-8?B?cC9jeXliR2JyR0MyWGlrL1c3MjhiQko4RTUvU3RzeXQ2dytKNGcrVVEwVVYw?=
 =?utf-8?B?bkx3VXk4Vmkyc1pURTlZb0hIMzFwVXF6QmRBNzJjdzNtVDlkemZKVHNEaEs5?=
 =?utf-8?B?bEZ3VlRPZi9yWDk3bTM3Tndmb0dXRitOd240dG5TNDVZalgyZ1pwdjV4aDNO?=
 =?utf-8?B?ZXhCTFQxWU5qWVdWdFRUVnAxdkZva01CeFBDcGZaVVQrOS81NW92L3Z0QStD?=
 =?utf-8?B?a2h3YURabTN5RGE1REdtOENwMTJlRGtCWkhROTA2RzNOUFlxVkUwN2tKb1du?=
 =?utf-8?B?aEFlaUp1UFBsOUxLYTgrRWprQTVuS0gvTkd3dnE4dXFFQWs3dkNzczNpM1NH?=
 =?utf-8?B?QmtISm0yamtiVHNoSWprcjY3ejZWS0VDNXFuTko1d2E5YjdrRnZ6OXkvU0Zo?=
 =?utf-8?B?K0piYVlEZStrU3NON1JHcGdOMjI4RlV1UlFVTThGb1hZNEw0Mkd6ZjRicUNM?=
 =?utf-8?B?UnNhUGtaTE0rcHhDdndObWJWWll0NWRiRDZPdHpDWXZybnladnJ6T0NRMUNT?=
 =?utf-8?B?TlhyYVpHc0x5bXluemZoYmE2ZHg4YkdzTHFtQ0NsMk9LS252MHlQZlA3bEVu?=
 =?utf-8?B?UGpHUEZRSFRZTi85UkpkV1c0TFBKaUFNalc4YVVhanI1YWVldVpWdnBUV3Z5?=
 =?utf-8?B?OXFnQXZ2eGs0eW9lUUV4cXc1R3RKUTBYdkN0cmVEZ1pBWHFTU2xLcGFJZWo5?=
 =?utf-8?Q?LBifFadVbdESLZ1M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9e2dc3-0f70-40f9-cebf-08de5287b053
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:39:46.9346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9UvkGIW2PuVGtiLGYC5GqpPJgQD1HJe84lF5YJ/wTg0kHcImG16dIp0xe2qlzS7CDoUogTqjkLj0y8x+t/K0zeTRAmGhbFbN8GugxmmL1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4806
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

Hi Kamil,

> This option will affect processing of successful dmesg logs,
> reducing its size to only beginning up to given size and few last
> lines. That should be enough to locate full dmesg in a separately
> saved dmesg from whole run. It should help reducing size of
> results.json and also should make it faster to process.
What about dropping results.json completely for successful runs?
That would reduce the overall output result's size even further.
We still have dmesg.txt files containing all messages, so in
case of false positives we can always look there for errors.

Or we could have two reduction thresholds:
 1.for explicit size, where you do not care about the result,
 and reduce the results.json to the provided limit, keeping
 warnings/errors intact.
 2. outright ignoring everything that is not a warning/error, so
 for successful runs results.json would be empty.

I could prepare a separate set of changes after your series gets
merged.
What do you think?

> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/settings.c | 36 ++++++++++++++++++++++++++++++++++++
>  runner/settings.h |  1 +
>  2 files changed, 37 insertions(+)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index 3ccf71870..f3ca60d2a 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -31,6 +31,7 @@ enum {
>  	OPT_CODE_COV_SCRIPT,
>  	OPT_ENABLE_CODE_COVERAGE,
>  	OPT_COV_RESULTS_PER_TEST,
> +	OPT_RESULTS_REDUCE_DMESG,
>  	OPT_HOOK,
>  	OPT_HELP_HOOK,
>  	OPT_VERSION,
> @@ -208,6 +209,29 @@ static bool parse_usage_limit(struct settings *settings, const char *optarg)
>  	return true;
>  }
>  
> +static bool parse_size_t(size_t *out, const char *optarg)
I noticed that there are two types of parse_* functions in this
file: some are used to parse program OPTs, some for simple types
(parse_int, parse_str, parse_ul). If you aimed for this to be
generic, like parse_int, then only do parsing to size_t type
there, otherwise please remove rename this function to
"parse_dmesg_size" or something similar.

[...]

-- 
Best Regards,
Krzysztof
