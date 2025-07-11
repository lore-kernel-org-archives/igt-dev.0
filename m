Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDAAC83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 13:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B984D10E03E;
	Fri, 11 Jul 2025 13:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q53tLMDX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E77A10E03E
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752241543; x=1783777543;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=evqPl6yCP6SH8BzwtSiHQ9AUKcOJVA/K2g3+qWEUkvI=;
 b=Q53tLMDX5nj0rYS0VljCZfR/UmVZ9d2nSqewCj4LMlg0DYs6I08tlLxA
 LscWrw9y/FO+mQCYIGA/DGlt7LoWD3RqAZr6ZBkbh55TG7pitJLoG1hAB
 +RcvzRV8D3hxPh21xWS/3P/G5Xn+HZHk+XxclqIy6kJ9n6RKvnNaa+QUy
 T4eb3zRuTGQU1yLjSHAwMaq1voUqoeTeTt41cRoWIVaBeS3rBSDFUB1UY
 itEjYvJxEz9aJKMiUflGPZzpHNZwccq/iXjlZsBWY6lqRd6KSY3r85sjG
 BdFAqvMwuJ0HC2oG8A3YGrMInaJf2eShp1YGZgAXv97yFhhar/8+DZ5hs w==;
X-CSE-ConnectionGUID: H++ERdBeQxKJnDuX9ZNHkw==
X-CSE-MsgGUID: RrUF1rdiSSK56jRYNpsojQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65240246"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="65240246"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 06:45:43 -0700
X-CSE-ConnectionGUID: LL2fwWxnRRiDX8147vCGYQ==
X-CSE-MsgGUID: ng+9ppvxR2unRgzNpM+gFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="156710488"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 06:45:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 06:45:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 06:45:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.80) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 06:45:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHIOoEtzKWsYZlTfc1VUl7pzemD2Y2QB1OtEiBjUlC/KR01JlKefcnh7VN3yPQuw3TOddJkIAyZ3V5CotohXPJ3F49iE+WFG3fVxZ86JBrtIvzP9ZWiCbGskY22yf+gGgAC7ZQdDYyG4ZieW8yf9ybZYSWyre6UGdnBKgMYKgiOAJkMMi4+HmFM+FxOehvrGFNxwbVtsflkG22gpZZS67B8/A8GleXDUwx1Vuxv0PGbdaXXdfvIU1MQZaItYiKNUq71JX9Kq8zXMkDcv0f3v92Cx+giroP+qIC6UYEzdwWOkZ3cCpuXLB0x/yX69NekMtBC6MPJN20jcHwNjUdn7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E71wIcX0JmI8OawiYxnQnQ6GfrFsIQVW4ASQeh5f8YU=;
 b=PSnBC3bOrrX3Stg7FQwub725n+Gbq4fBR+GCYq1PRaafx/6N/jrJgvGQ4+2k5v4e0NlN5pMIcM7IQRIVBsLOb/6xDKGUi8k0tK5cHOv1o/HDfGM9lDhvw+In1WZH0jtwcJt9mXdGF1qJUk6V1IPoszo9m/Xa29tDNLVPOiRt1QOANidn24xLVCOfTkG+FiIh6uGuNvkeG0YUKNrWOfFrTcH4AjgwlQFDFZnZzcWvQ9+jaEcznRM7djUi1btlerNzi6buNluQTKWuV3DjZoLluecEM2SXvceJvsHS/0zCCsjaBv9tkxU/TaKj7Rin16kk9qin+96bf71DU3t4n2Pm9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB7030.namprd11.prod.outlook.com (2603:10b6:303:22f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 13:45:39 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8835.026; Fri, 11 Jul 2025
 13:45:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250711132626.6vyotlipmwa5webn@kamilkon-DESK.igk.intel.com>
References: <20250710-fix-allocation-of-vram_size-and-visible_vram_size-v1-1-cee73305db60@intel.com>
 <20250711132626.6vyotlipmwa5webn@kamilkon-DESK.igk.intel.com>
Subject: Re: [PATCH i-g-t] lib/xe: Fix allocation for vram_size and
 visible_vram_size based on max_gt
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>,
 Zbigniew =?utf-8?q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Fri, 11 Jul 2025 10:45:35 -0300
Message-ID: <175224153560.2061.16853408718188849728@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW2PR2101CA0006.namprd21.prod.outlook.com
 (2603:10b6:302:1::19) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e90817-89ad-4309-0d3c-08ddc0813886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q25mc2hUMThkZUxSYzhxcnZTOUQwSnJGQWl1TS9UWGs0RUdZdUc2OXNiZ1lo?=
 =?utf-8?B?YVpnanhWYzk0Y1FJQmZCS2FFKy8zbHhENVd5RU03TVBNRmtROGVWR1hXdHgz?=
 =?utf-8?B?bmNWWHkxRXJ3M2hVb29YNGVlTWVFTnVSb3N3YjJOK2JoVlhNYzdVYjVIVWxh?=
 =?utf-8?B?S01kWW0zVGhPcnhCMWlQMzUwTkY5a25qdUcvbGVXT0p3a2pnTkpZaHhTdTBT?=
 =?utf-8?B?QUdEWkx6bjQrRlJxd09mVG0rT28rdUx1UGFJaHhvRTRwaFpRV1IrNjZ0QVlq?=
 =?utf-8?B?RG94QlJEbDlOVENObUJiUXMwcnlCVE4vdUNHMUpGTmdHVkVERTg1Tk5scjhT?=
 =?utf-8?B?Ui81aTNmTTM5T2pVc0hTamViYzlKVzlROVBlS1IvaWQ4WmJCd2d4NkpJaU53?=
 =?utf-8?B?blJ1akVxbm9SSUFtZHZrQWtEMUxTOUNxd1lMckx2WktvL1VCMTNGeC83bmpr?=
 =?utf-8?B?Z1pURE11L3p3c1QxQVFGdGJBVE5mbStTSVY3WlM0UnhENk5hOVdFeC8xM09y?=
 =?utf-8?B?djBEQlMzbExqZnhuMklyS2VHNnQrYldEU2JaZUJXZUNJRkJZNG1oVGdYbTN4?=
 =?utf-8?B?YjVVbE15QVN2elA5OEZQMVNCMWhJUUZzV2xublJSTHRleWFkQ01GM3V4K3Za?=
 =?utf-8?B?VHluaDVkWGV2QmJZVmhwS04rVFB0U1owVGdoY3dTdFJqbXYrc3huSFpsVDZV?=
 =?utf-8?B?aEE0Y2gvSUVKendnQjBQb2RyeWlBYnc2RjVXb2lFMlcrcCt5MTd3M25mMnM3?=
 =?utf-8?B?VjZBdHVsVE9VbVJaSlFNTThaazZtV1BwcDY3bnVWWERPM0FHS3Y4OEZsRnBl?=
 =?utf-8?B?OW8ra2s5NG84UjhxZ0t5Y1VCWkw0OFRFU1NjN204aFRyWkJlZmpxQmJadFFq?=
 =?utf-8?B?Y0hyam5TejYvZEtYUDdCaUlCdUdwV29OZ1gxQVVjc1V2RXZkZVpHN244a2Zt?=
 =?utf-8?B?a0RVK2ZHcGhMZWo5YmxNbjZCWTQyeWNwL0lOMHVHVWxSRVhjREc2OGpYcmxN?=
 =?utf-8?B?Q003UnZFaFZPdkM0LzhDZ2NBT3BFS2VOWk54WmltRC9IcTZqKy90OGdhMWxD?=
 =?utf-8?B?bGRvdDZraWZMTGpQZ09iNU9GUkh5M0lHaWFlWnFjdHVmd2V0eFlrOVZaaFZB?=
 =?utf-8?B?eFVrbkRKT3FGSHlJb1hGQW5iMVNmbERuUmFiOGdzOXpOdjhGRFlEWWIwa1pp?=
 =?utf-8?B?ZHpHbXlLZXVuQkVRWklQS3BIQnFMUTRwc3pHcjM2N1hjeFAvdGxhOUVZZmgz?=
 =?utf-8?B?L0c5bStZSFVhTk5zOXNMSG9KdTF6ZGFFemQrSXNWZ2xCc0E5SUxkS2tJeE1G?=
 =?utf-8?B?aFlUQi9IMjdRNUZZWURLK1Jxc09kRnlkUzBPeTlxK1BsRjVrUVUyNGFEbXRu?=
 =?utf-8?B?WHRFdldnR0JPVUl3cENQUzBjdi9UUmJYVXh0b0g4MkhPUGtFWFd5aWV2aGFs?=
 =?utf-8?B?ekZqcm9xWGZzQktsODZlZ0NIdERXMnQxdERra0paSnU3cW05MXNCUUZORjdM?=
 =?utf-8?B?azNNRkE1NTU3Y0NXUnFkaWJlV2tERnErWVQyUjRNR1pWRWlPT2FKcFBPY3FE?=
 =?utf-8?B?T01OSXlLdHFUZWlyS1JiTjJ6U21SY2pZR2UxeTk3L0lhUFlxVXpGaUF5WVVJ?=
 =?utf-8?B?YVd3MXUvaWZaTmNURUM4NzZzVjFvV00yZmxueHlUYWJKLzdPdEMyY2VjZjBY?=
 =?utf-8?B?Z0FDVHBSanBmQTRYb1JjMVVSNmxHaldUQlFUVU1mUHk4QnNuRlVjK3BqMmgr?=
 =?utf-8?B?UnZvMkJxUk8rSzVPNEsyNy9zOHZhN0trcENvTTZDOUl1bHlBVnVnbkFBeW5q?=
 =?utf-8?B?VTZmZmJhR1NTWjZnZDU1MnRaalpobnlXbDU1T2s0dU5OQktVYVpoNXNNeWx3?=
 =?utf-8?B?VitBU3BLSit6Qk9Zb0hlWHgweENLc2J6R1hNLzJ6SUZOZEtEZmRDNGI5RTFL?=
 =?utf-8?Q?tG459j6xUaw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2hOampHeGVWSVBUVDVKYTdnYUpLMnBjMGlaNWdxK0Vnb0t1UGRQMHg3UzZS?=
 =?utf-8?B?bFhJNk9PRjBGb3BQQmtzcTJFTHdoZFZOTlhkbXQ0YUZ0K0I0V01kU05GOHM2?=
 =?utf-8?B?RHh4TjFpc28zRFlWNGRFK3ZZUVZic3E5SkxpNHZ5cENheUlWWHZGMnc1S25I?=
 =?utf-8?B?MHhQcSt3SVdjbWpHRUpydGVIN0NucEp2ZUxuU29wOXA5T1dkMEsreDVUNUdH?=
 =?utf-8?B?cVBOUWJnd3RUZXc3RnEzNnNJS3luV0h5WG1TLzFab2J0N0lBTnAwSWpwcDRk?=
 =?utf-8?B?U1UyY1BzbnRIdUtqWkJINzAxczA4UTFEMncxcHJ5SStYWFV2blRlWVYySHlj?=
 =?utf-8?B?Q1pOcC9QSzk3OU1neG92TUhCSU00aENQbVorelBHdnhlbXhHdU1oY2JpVVZq?=
 =?utf-8?B?ejhqMWt0L2F5T0NRdTA3RTdLalM0VHZxVEUvdzF5SmMwUFV3TmNpK2c2SXdk?=
 =?utf-8?B?WEFYbkhuTWZWS2VRVVRHSVdWaHYvQWdDazJUZElqY3Q5VGZNd1dzWnh5Q1Yx?=
 =?utf-8?B?cEQ0ZHNzQjhhZlVpYzlJVHlUYVEyTVoyanJrTmFTR0JwMUpmcG0wMktqeHNx?=
 =?utf-8?B?Unk1TldOWVF0cXZ1ZGVNSE1VdTFvWWZXUldSY0NFbXNpK1M2bzl3Ri9UOUV0?=
 =?utf-8?B?OE5obWE4N24rSHloeGErNzA4TUlzWmNPUldIeE1rdEpxMDByWHRPUjZIWUlN?=
 =?utf-8?B?NkJDRWV0dXhVb3V5RDJTTk9SZ3RXYW9Pd1lBUEwyS0Z0NHhWem1JRXVpTmNv?=
 =?utf-8?B?L0pza0FOb2JTSnhrbWpBRndYUktpK0JyNytwdFZDS3BYVm8yNkdBMm84MytX?=
 =?utf-8?B?ZEVsSXRjZ1Rva3g0K0NHV3VBenpyMWN6RjFVQkRhcTNpM3VLV0pqYnJYSmkv?=
 =?utf-8?B?ZGhITHZEak55clN1TCt4bnZlOW9mMEE2MUhhTTZORHAzOGJ2NzFoMjVGZGFR?=
 =?utf-8?B?aEhKOE1DcmtwNWllN1J4aEZZZGZHYkpIeWF4N3RkVjdFU1ZlM2YwQkdYNUVj?=
 =?utf-8?B?V2luSURiTkhRK3E2ajB0blpuQ3NWSzJXQjdTaDJmZEsrNkZ5MmRSMEN0ZElI?=
 =?utf-8?B?NzVQcDZQRFp1Z3JTb3R6eDhoV1R4OEx4L20xbmtKM3g4WXpQRW1IK0ZiWGk2?=
 =?utf-8?B?V1dKSS9pU2I4NWtHV0k0V2Z2Y3FrNWZ4ZGxqOGx2SHRMekJicjVUWGp1NG95?=
 =?utf-8?B?VjdCZkVIdGlDVUsybkdkcE1kT0NGZG5YQUhkRXRWSGJPNmprTDlQMFhEMndq?=
 =?utf-8?B?KzI4Q2oyWVBZOGwxb0ZhSkozUmprN1A3TmxRYThVci91SzNBU3hHR3B2MWd2?=
 =?utf-8?B?d243VmxNYS84YXpwODNpR1Z6T29pTEpDcytZY1lXbXNGYjJJQm5hNWZDUEth?=
 =?utf-8?B?aDlaKzM3WGdsUk54ZDNkbnFCQ3Z2WVE2dWgxb1ZvNjhleU9yclZROS9ibEht?=
 =?utf-8?B?dndGTVFwSndsa1BNYTJLWkJrTTE5eW0xR1loK3AzWHptWDJRZUJReTlXMnJo?=
 =?utf-8?B?Mk1GL0RJUDdJc2pxaWh5R2ZOc2xXUldZSVZ0NWMxaU9JYSsxaGFjdVRBZ213?=
 =?utf-8?B?djlLdzlOUUJ0aFhpdHl4eHM4cUV0disxaDlPSlFmTjZ1OEV4cms4d09wSEwv?=
 =?utf-8?B?T21Gem9yejdwSEJNOFIyS2lGbzVaVTM4Q1QvdCtWMDlxSEJKNEQ1Nm5UVWpD?=
 =?utf-8?B?T0JNN0NIMUdqZDhSQ1RXYVhONzBlS2V1d0lhUk5qbHh2SS9ITTY2VWdlZzVw?=
 =?utf-8?B?WHMyM1VxS2xkTzh5UTZSNm1vMVpZL1BYblhLeEFUM2FRZ081Mjh6RCtnRmxU?=
 =?utf-8?B?Q09mc2pmTE83RkhGUEFHQWoyaVdDQmtES1E4QjN6eS9DTkdJNGR0WWg3Wjkz?=
 =?utf-8?B?MzdXVHk3cE05dXQzTUJXNldRc2xNSUROWkJITHRTN0hUcldHT3hWSG1ScEor?=
 =?utf-8?B?SDVDWCtSUHBGVVhHYWswSzhSMGoyVmovZ1p1YnVzbGdnRDNmMS9Sb0oyVHRV?=
 =?utf-8?B?SUdGbFNUZ2ZUTXlVZ0V4c2I1c1hZMTd5MzF5aTVCNzE3UE9URlk2L1pkbmFx?=
 =?utf-8?B?OEkyNXo5NXJjbk0yWWdyMmhjUGZNbGhSSjZSVnhkSm4xbHNrN3N1Tkg0clFS?=
 =?utf-8?B?OHVvaG1IbGl3c2hQWFBpd3NYSWhqeUZEb2RZZU5uUnVDRjdld3AvSmxJTE1w?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e90817-89ad-4309-0d3c-08ddc0813886
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 13:45:39.0405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7qTJPGzIm1wSsfUp0tvLSoqpzmRMsYZE+brPT+JupmIXQuXxSMJADkSXkIbfMXVWVSw5ZDyMUvPX8pdhykp7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7030
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

Quoting Kamil Konieczny (2025-07-11 10:26:26-03:00)
>Hi Gustavo,
>On 2025-07-10 at 19:12:27 -0300, Gustavo Sousa wrote:
>> The current allocation for vram_size and visible_vram_size has two
>> issues:
>>=20
>> * The expression (max_gt =3D ffsll(xe_dev->gt_mask) - 1) gives us the
>>   zero-based index of the first bit set in the mask, which does not give
>>   us the maximum GT ID, but the minimum.
>>=20
>> * Since max_gt is zero-based, even if its value was right, we would
>>   still be allocating not enough entries for the array.
>>=20
>> Fix that by calculating max_gt in the same way that xe_dev_max_gt() does
>> and using (max_gt + 1) as argument to calloc().
>>=20
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
>> Fixes: 3a39a6e51b18 ("lib/xe: Populate vram_size[] and visible_vram_size=
[] by GT ID")
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  lib/xe/xe_query.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>> index 3d628cb3fe59ddc390684941452ca04fd735b212..c0dba018244e8a47c8f1b305=
cf43ec3d4ffdc575 100644
>> --- a/lib/xe/xe_query.c
>> +++ b/lib/xe/xe_query.c
>> @@ -361,9 +361,9 @@ struct xe_device *xe_device_get(int fd)
>>           * vram_size[] and visible_vram_size[] are indexed by uapi ID; =
ensure
>>           * the allocation is large enough to hold the highest GT ID
>>           */
>> -        max_gt =3D ffsll(xe_dev->gt_mask) - 1;
>> -        xe_dev->vram_size =3D calloc(max_gt, sizeof(*xe_dev->vram_size)=
);
>> -        xe_dev->visible_vram_size =3D calloc(max_gt, sizeof(*xe_dev->vi=
sible_vram_size));
>> +        max_gt =3D igt_fls(xe_dev->gt_mask) - 1;
>> +        xe_dev->vram_size =3D calloc(max_gt + 1, sizeof(*xe_dev->vram_s=
ize));
>> +        xe_dev->visible_vram_size =3D calloc(max_gt + 1, sizeof(*xe_dev=
->visible_vram_size));
>
>It could also just use value from below for loop?
>For example:
>        max_gt =3D xe_dev->gt_list->num_gt - 1;

The value in xe_dev->gt_list->num_gt reflects the number of GTs that
returned from the query, so xe_dev->gt_list->num_gt - 1 will not
necessarily be the maximum GT ID, as now we do not assume that GT IDs
retuned from the query UAPI are consecutive anymore.

--
Gustavo Sousa

>
>If yes this could be someting for future change.
>
>Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>> =20
>>          for (int idx =3D 0; idx < xe_dev->gt_list->num_gt; idx++) {
>>                  struct drm_xe_gt *gt =3D &xe_dev->gt_list->gt_list[idx]=
;
>>=20
>> ---
>> base-commit: eacde5c2acc37c1570e27b68b8b6c39d8b61fb32
>> change-id: 20250710-fix-allocation-of-vram_size-and-visible_vram_size-f1=
94f0e55610
>>=20
>> Best regards,
>> --=20
>> Gustavo Sousa <gustavo.sousa@intel.com>
>>
