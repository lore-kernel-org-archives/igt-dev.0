Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FC0EE6441
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 21:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C2C10E9DA;
	Wed, 31 Dec 2025 21:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSgOJOtk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8DF10E9DC
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 21:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767216971; x=1798752971;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GW0Uc3fjpWYG/HFbntqR1FXRzWI6fxtdMYvkqRtcVlE=;
 b=JSgOJOtkVkxnz7bYkDvLGj6ZnCLY1L+pdqJfNrJleXG893tKam3HKc//
 rybcYjVJJHr1CBUj3rLFb1nOYK3Fpelyt8lx+gT0vcjSBvdWG9Gp7aIJY
 jmaCiMb94Me0wdAR8iJSrRbloaXbX7unhg35BuwWCk2+7hIb8VWNU0zFM
 8s+H458aIu5OUcxauL2R0PPp+1zyXfZU8d1aoP62RfggvIojG7lc7PfpK
 U2EwCL+bu+EjX1cVNTSxqoRqNGbrvla0kL0rIQ+DiteefNmlq4VJYuRzl
 rzRio4nXQiYgWkuewzDbt/YlWPCeO1eN4u9Q1StkuIrTiI0Tz9CWrTV2W g==;
X-CSE-ConnectionGUID: s2nkqSGkQgqlNv3Xqoml2Q==
X-CSE-MsgGUID: TbEORbsnScir3MdnVFO26Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68718569"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="68718569"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 13:36:07 -0800
X-CSE-ConnectionGUID: qL0OCXyLR4y8ksTK1yqCjQ==
X-CSE-MsgGUID: rmAL45R0QGayJsHgjM2jUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="225006908"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 13:36:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 13:36:05 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 13:36:05 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 13:36:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAejEkhXuDH2Evv/96HhYouR+FMx4vz5cDXuJ0ZW5Wzzf/9SUDebqEfPBJf4F7RUWfM6iKD88PJxn86WPO3Ep+X3pxcuWBteS++TA6vAIfYcr8tp26ut/ep/IQql2pLmFP6Eg1ZL8X6/t6QxPhyBXNlrPFprekVmJ4wsKW4XZEe97+BhcGtjY9HRxLHsag/URyOrXQSE5s8Ra9L8SU5AyOUIV4W5dv/Yl3iIhRlrC5Z1OeJDESlV9TsSa2i5QhIBlCyrE7VKGCbTSHGmqlELGBBH5t2SoqhlN59+LnEfsdH8ivSjEXQShNyEOF1Z+2XlEvkuOY7dBbU5ODTbUl6J6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeSHQo+3XWJdOeiH4whAMrGoaVkt19qbLH5AGr8ohW0=;
 b=VnkTKT07xCoOjYeURku/hG5JPT8RlVni770T1mBwLkJPHTzu5k989eB1JhsCrH7WDPKitiS8/+xR5Ws0NaVU10pIFH07YCktPRiDbDuFnqUhPVuNrmU70VmZZrKbdEOWdNtQ8w0b2tosLUFIWVEp59Ceq98scJaIeFcwPdvC+0DhLFHY4gB3BRgNFqJPJWO/sZsgN8iFdpmNg0WAQzM6aWIszc6voBg2l2i+JZIl9JDaNnsp0FK1Lu1oYkqrymKju1EreiaZy4NZnageo5fh7laCkFLrXopBTvnSUqmlqEUL9uMKZfCQV3zCo2nb2sCQpEpTOGdFQxMHdYi2rAEhxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB7967.namprd11.prod.outlook.com (2603:10b6:510:25e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 21:35:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9456.013; Wed, 31 Dec 2025
 21:35:58 +0000
Date: Wed, 31 Dec 2025 13:35:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v10 3/5] tests/xe_pat: add pat-sanity subtest for debugfs
 vs getters
Message-ID: <20251231213556.GK1180203@mdroper-desk1.amr.corp.intel.com>
References: <20251231202010.115619-1-x.wang@intel.com>
 <20251231202010.115619-4-x.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251231202010.115619-4-x.wang@intel.com>
X-ClientProxiedBy: BYAPR01CA0051.prod.exchangelabs.com (2603:10b6:a03:94::28)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: ba69fd78-e5d9-4540-66db-08de48b49610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3pRc1ovcENIUTh0NFFwTVNyaTNOeHluVzRYQnY3aUxaZnBRekx2NzRzTWYz?=
 =?utf-8?B?bWg0RjJTSnV5SWVTNDZ5NWRaWUE2OHZpZXNVZVV4VnRpR0RjYytIZzU1VHp5?=
 =?utf-8?B?WG8rOEhEOU5IQlh0cmYvSUk5LzcxQXFwVmkyenYzVUkrV25mMXJ3Qy9iTkhw?=
 =?utf-8?B?Z1J2d0pXVFlyclhSN2JsdStlTmhDYzlmTDJzSnFrbDEzWFhUU01ZVC9Pc01C?=
 =?utf-8?B?TnNKWWJlazY0YTlIUFBRN00xZHZra2FBRHRtaVYwckdUZTlBRlNpbDBRYXJh?=
 =?utf-8?B?ZVlSODJlYVJ6U1BMQ1BoWWJ4OEZWdFNmdjlzOGg0dHhkbDNITjRoUzBWbDZ6?=
 =?utf-8?B?d2VnTlExTkZsV2tVMTA5dTd0Vko3VlBqaStHRjQvd3ZEd05YZGpvdERkbHlP?=
 =?utf-8?B?NnZmbVpwRXkwcHJMWjliaGdrUDJudmdBOURBbmk2c0NaUUtqZEhueW45U2Uy?=
 =?utf-8?B?S0xMTHc3b1FlS01TWXZYM1FJM0h3eGxYMStZNkdQS3NpNmxhVy9aMjV6T2J3?=
 =?utf-8?B?VnBqcmR2aWtDeENENU9XWGZEWm45K2htZ213cE9DRHBySVJDbTdONzUwZXVS?=
 =?utf-8?B?dkI2UzlhU3psVWRFenhQMWtkaktVVXQ4QlF1WjNYejg4NW1Ra1M3L3FoV1Ft?=
 =?utf-8?B?emlaV2M3eExHd2dkblc1TVNLY3NZVmFIbCsrN2Z1RzBIbmhNaTFVdUVWek11?=
 =?utf-8?B?SStTbWl5dFRSU0tJOVo3ZStLdjdTbXVibmVQL1lOV0ZKWGt3RS9FSzlXYnV5?=
 =?utf-8?B?c0hIaXR6OUNTcnJ1am1LYTlxL3I2UHh3NjAzbHI2dWUrTU5UWlhkc3RWT1Nn?=
 =?utf-8?B?SzZQcERGQklPMjVpcGdQYVZlSHdCMUlWTHZqOUlDQ2RBZ1JuYzcvenhVWUt3?=
 =?utf-8?B?cS9HYW15cGdoaVhldTRqUkNMRHlscW5NSzBZTVFvbTBaZ0xXWktVMW5kYThy?=
 =?utf-8?B?SE1sRGZ2NUt6RysrckV3SzJXaythdTJ3Q242VEhnT2Fxa1FrdnJ4djNkM243?=
 =?utf-8?B?NGpDc3lYeTdXTWZtd2dwWlJMekVGVGx5S0w0YXE1WU1JK2grcG0zcTlkZkh3?=
 =?utf-8?B?WEVJSW1DN1B2UENqRi9SVWh3NjZHWnN1WWZHeXE1cWRlY3hYbWFmd0g5T1JD?=
 =?utf-8?B?WXl3MkNkRlV6VWZ2OEdSSkhmaTBwRHJwbFRGRU9ULzlka0x6V0FmVXRmWGt0?=
 =?utf-8?B?ZWpmRWUwc0tIM3ZqTy8wV1VhY05OYVVJZVlBRVBZa0lUTWxFS1ZrSjVaRjNY?=
 =?utf-8?B?STY4TXNRRmtVSXRHZWVCYVVkbEtkWVVVRkFMTGlrQ3kzTWdRU2QzaUtoOWs2?=
 =?utf-8?B?WVphWURsL0FaVnpuU0hnNExRTUhOS3hxM2dzK1FwczNzTmlPQ0tiMGdrVEVV?=
 =?utf-8?B?UkdiM1BmUVZxMXpld3dRUHZZTS9kRlJKd04xbGJ1WnA0RU9iNXd2U0JraE5I?=
 =?utf-8?B?WW9oVGcyV0U3NDI0dHE5R2xhS3Z1aEpDVTdNTTJkMWJrQkM0cnRldGxveGZ1?=
 =?utf-8?B?cWE0VVliYXdsT2dsQk9lQUczaGs5ZmsvWnVVREpyYXhvK0tRbUJGRzhmTkla?=
 =?utf-8?B?OGp6ZkgzSEZiU1p3VmdQQ0REeGcrTWNOc2ZoQ0pqMzR6U2dGd283M2NQdkdv?=
 =?utf-8?B?d2lFR1pRMkJyWjhCU2UvSkI5NHpybFE2aEZXOGtiNHd3cHZpUkdpM3IrTE5m?=
 =?utf-8?B?dU9QTzRWWmJUa256T1ZKa3FnSVlhK2JONmRkQS9jWmp4bXF0VExCWVFyb0xw?=
 =?utf-8?B?RDVnVUxZZ1VsUUJwQzRhNURJZ0FwRHNJZjYzS04zRUdWK2szL1IxUVVMZ25Z?=
 =?utf-8?B?bExQeU9qSTJyL0FlQ29KenNmSDhKWTBrZ0xPc0VlWTIxZUNGMmNkN05HeDE4?=
 =?utf-8?B?V3d6WWl4SEtIRnhTSElJVjBBMW11S25zR2tKMzhVWm1iOTIzSFlwVEpaQXd3?=
 =?utf-8?Q?tpNe0HGVw8YXlwUkXknCzU3y+5gAu86g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2x5aEg3U0ZUTkRCUmoxWUZaMmFJMWhYV1pPVUpMZWVFRW04Uzl3dUk5aVAz?=
 =?utf-8?B?b1hsMTVnTEYvcGxRa3RxVzAwN0wyREM0SmROV2dMejJwYXJaWW9aRzMzWE5O?=
 =?utf-8?B?Z0tRS2Z2ZENiTm4wT0V2eWdBNkZYS3puS2xPZ3huODZ5NUd0RXlHM3RqMG1L?=
 =?utf-8?B?djJRSXkycERBWmd2RGtuREl3ZUZtdXJGUFUwQ0tZSllsbkZmbWVwMkR6MXFL?=
 =?utf-8?B?VlJwekVTWDlhbUR5YUxyOGlLQUVEZDJhaVM0dG02V2N4MnhUTmVZczZFOW9B?=
 =?utf-8?B?dlVBYXVvSmFHMHBOajlFU2F0ZzR3WjNoTWZLb3VoQXhwOURidnl2NjVnNEI5?=
 =?utf-8?B?eWhGcFB1NEx3eFEvSnRmdEVVbVRWYkJuVnBORk1uY0V1M211MkEwNURPbXY4?=
 =?utf-8?B?dm1hNmY0NEhLdzRqMk5wNlVjWWVQOWRFZW1yMFJmb2VpbW5aajRXOGpQQlZV?=
 =?utf-8?B?UFVGM3Q1QmVHK1M5em44WWxKcDh2YlJuSVZQNGNTeGM3cExZTXZqSE1vOXNz?=
 =?utf-8?B?am8wcFoxSkFVcHErSmFjdlZvWUhsdUNHQkFldGIwUHQ1UEpvN29kcE1ISmN5?=
 =?utf-8?B?L2l3dnQvU05RaHQxT0R2dlVrVnZscW54VFRaOHBZZWNzTk5kOFAzL1l6SnZC?=
 =?utf-8?B?cEhuc0pzSmVwb0didVgyQmNYZHJIZVRpcTJxcmkwMTE3eTlYdDlmMFZqd1BD?=
 =?utf-8?B?cnh6QThCZWtDb0JDQXh4SWRCYjlKcWdwSVUzajRBNGRzSUErelAwN1Z3Qm03?=
 =?utf-8?B?NVhWcXBiYXIzSUpIYytwODJkejdOYUEwU1B0NFdTUXppNHROQjl3YktJa0FE?=
 =?utf-8?B?VXh5NkpmMDkvalJKZTYzaHlVaE04MGUyOVZEM2JNTlBRT1AwcG5nd3Vzb05U?=
 =?utf-8?B?R2lVU0RuZWNRa2k5Z3lRbkVKaDZUWEtUTzY0K2RrRWlHbzFVbFlqWU1jV0hB?=
 =?utf-8?B?OGlSb3h0c1lnSUVXVTQxblF1bmJzK0IvcS9MY0sxbWl1dXZmRWNTU3ljdElI?=
 =?utf-8?B?Y3RDVzE1cEVnMmVMR3R6cDhsejhPeFBCS3g2Z21kUnVobDBVZ0NqVWM5Vmtj?=
 =?utf-8?B?UGt3SWpLZENPZGQ2b0pkek5XNmhvc2RwYXBxbWJpUnZyRmFHM2xQb21NUi8v?=
 =?utf-8?B?V1FzU1FQRGUwWmV0WlkycmNGanM3YTVHcTBrM2d4ai9MamFpZjRlMlNyWUpo?=
 =?utf-8?B?L1N2UFd5KzZNSW96b1FuQWFidHYzcXhIWUdORzBjV0VudFBSNVc3cE1yTCtC?=
 =?utf-8?B?Snlrcy9pQmVpSWx1S3ArY3JuTmkwY0R2Z2JSMHltK2JNVGZNYUxVTUh3NkhU?=
 =?utf-8?B?U3VaVUZ0bFRGK2hvWit3RkZwQ0YrRXQwcmJWZmdjQWdsckM0ZGw1QWhRSzRx?=
 =?utf-8?B?WXZOYnhFQXRwR255RloybUppa1RoakFEN2xDeGFISU9mYUp0cy81b3l4Vzla?=
 =?utf-8?B?UXFiNU5wRmtRc3hiSzlnb0dtd0lEOGc5UFUveWtUUzBMT0RHZ0tnNm9RejRs?=
 =?utf-8?B?YWNobHlKMUN2ekUvblYwYWErVytMWjZMek9LTGZyaXhkRVIwVkhaTnJ2dVdn?=
 =?utf-8?B?Skw5WU9MY29Ma3IwU2dtZWUwYmNJRTk2Nk55YVY2cElDNVBLbUdnbXhCbC8x?=
 =?utf-8?B?SmdPdUhkck1zTzJCZkFGRjBJZ2dMc3YrUDJ5R1V5U05Td2phdDZVRW9qNFMv?=
 =?utf-8?B?cFd6TVM2bVBlZTQ2UFJKZXp5djhjWTNyRlNVTjFTcndCaVBKcWpUcGJzRTZs?=
 =?utf-8?B?MkhOMlQvYm5uNlNMSVpVUFNVcHB2eHU1aTUwUDY5UXJCdmZaMHBqK2EvUXkx?=
 =?utf-8?B?L0lRZkpiYmVscWd3cVhEU2hVRHBkZXlqWmhaaU9ZRitXN2tiWmhhSTJBYS9U?=
 =?utf-8?B?eHo3eFJGVHFoOG1reFk3dDl0OWMweW9jelNGMndxcWhwcVl6SHdZWml2WERF?=
 =?utf-8?B?QUZwWHRySWRkZUcyTm91dVdiQ2pLUVZKcWl1ZVhoaUFSK2djU3g4aC9tUXZq?=
 =?utf-8?B?THVaVC90dm1SUUdKUzZMSkxvZnJ3VlRtQmFuRDRsYzNmcmRrUGg4MFFZYUlX?=
 =?utf-8?B?R21Rd3FkSDhrck5jZmo0eXFGUUt4amRzMXRVMGZWR0FCMjZhL3hVV2YyOUlu?=
 =?utf-8?B?eU1OTkhZYStQelJOK3o1bThQYUpkUjByMzNHN0cwYVlBTXZFcTAxcHNtWkE1?=
 =?utf-8?B?c2xsT2hzNmNEWUNreTV4RGdSRFRZQTJtSXQyRG9OV1VYQXNkcUhCUFR6cUdw?=
 =?utf-8?B?QlhZbDdwU2dXc2M3K0dQcTdyb0NWc2pkV3V4U3l1blNLRFVuNzZvclNSeEps?=
 =?utf-8?B?Tml6R2pYTXpiL1JDaE1ISGZuZnZGZTNucWtSQ0xzdXViZ1Y4NDdNYnNaZ2Zy?=
 =?utf-8?Q?qjPiprkyp0602fgo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba69fd78-e5d9-4540-66db-08de48b49610
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 21:35:58.3878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2gckfpRaM8TrrcaPFUXTMt1bVtYDDZBt5KuQJOXeHXu6Qx8C//gOsREy/UnMsTNY0x8v1w7RL+60eB48Bg2eQuxm63Q/eoLl3N7iRkiER8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7967
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

On Wed, Dec 31, 2025 at 08:20:08PM +0000, Xin Wang wrote:
> Add a new pat-sanity subtest that reads the Xe PAT software
> configuration from debugfs and validates it against the
> existing PAT index helper getters.
> 
> V2: (Matt Roper)
>  - Use igt_assert_f() instead of igt_require_f() for PAT debugfs
> parsing failures (treat as test failure, not skip).
>  - Drop PAT entry dumping to reduce test noise.
>  - Use igt_assert_eq() to improve failure diagnostics.
> 
> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> CC: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  tests/intel/xe_pat.c | 80 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 2fd3635fd..cb2159aca 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -18,6 +18,7 @@
>  #include "intel_blt.h"
>  #include "intel_mocs.h"
>  #include "intel_pat.h"
> +#include "linux_scaffold.h"
>  
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -76,6 +77,82 @@ static void userptr_coh_none(int fd)
>  	munmap(data, size);
>  	xe_vm_destroy(fd, vm);
>  }
> +#define REG_FIELD_GET(__mask, __val) \
> +	((uint32_t)FIELD_GET(__mask, __val))
> +
> +#define XE2_NO_PROMOTE	REG_BIT(10)
> +#define XE2_COMP_EN	REG_BIT(9)
> +#define XE2_L3_CLOS	GENMASK(7, 6)
> +#define XE2_L3_POLICY	GENMASK(5, 4)
> +#define XE2_L4_POLICY	GENMASK(3, 2)
> +#define XE2_COH_MODE	GENMASK(1, 0)
> +
> +#define L3_CLOS1		1
> +#define L3_CLOS2		2
> +#define L3_CLOS3		3
> +
> +#define L3_CACHE_POLICY_WB	0
> +#define L3_CACHE_POLICY_XD	1
> +#define L3_CACHE_POLICY_UC	3
> +
> +#define L4_CACHE_POLICY_WB	0
> +#define L4_CACHE_POLICY_WT	1
> +#define L4_CACHE_POLICY_UC	3
> +
> +#define COH_MODE_NONE	  	0
> +#define COH_MODE_1WAY		2
> +#define COH_MODE_2WAY		3
> +
> +static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
> +{
> +	int32_t parsed = xe_get_pat_sw_config(fd, pat_sw_config);
> +
> +	igt_assert_f(parsed > 0, "Couldn't get Xe PAT software configuration\n");
> +
> +	return parsed;
> +}
> +
> +/**
> + * SUBTEST: pat-sanity
> + * Test category: functionality test
> + * Description: Test debugfs PAT config vs getters
> + */
> +static void pat_sanity(int fd)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(fd);
> +	struct intel_pat_cache pat_sw_config = {};
> +	int32_t parsed;
> +	bool has_uc_comp = false, has_wt = false;
> +
> +	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
> +
> +	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
> +		for (int i = 0; i < parsed; i++) {
> +			uint32_t pat = pat_sw_config.entries[i].pat;
> +			if (pat_sw_config.entries[i].rsvd)
> +				continue;
> +			if (!!(pat & XE2_COMP_EN) &&
> +			    REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
> +			    REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC) {
> +				has_uc_comp = true;
> +			}
> +			if (REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_XD &&
> +			    REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT) {
> +				has_wt = true;
> +			}
> +		}
> +		if (has_uc_comp)
> +			igt_assert_eq(pat_sw_config.uc_comp, intel_get_pat_idx_uc_comp(fd));

Just for consistency, it might look cleaner to move this check out of
the Xe2 'if' loop and down with the other ones below.  If we're running
on a pre-Xe2 platform that skips this block, has_uc_comp will still be
false and we'll still skip the check properly.

> +	}
> +	else {

The two lines should be combined.

Aside from those minor tweaks,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +		has_wt = true;
> +	}
> +	igt_assert_eq(pat_sw_config.max_index, intel_get_max_pat_index(fd));
> +	igt_assert_eq(pat_sw_config.uc, intel_get_pat_idx_uc(fd));
> +	igt_assert_eq(pat_sw_config.wb, intel_get_pat_idx_wb(fd));
> +	if (has_wt)
> +		igt_assert_eq(pat_sw_config.wt, intel_get_pat_idx_wt(fd));
> +}
>  
>  /**
>   * SUBTEST: pat-index-all
> @@ -1230,6 +1307,9 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>  		xe_device_get(fd);
>  	}
>  
> +	igt_subtest("pat-sanity")
> +		pat_sanity(fd);
> +
>  	igt_subtest("pat-index-all")
>  		pat_index_all(fd);
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
