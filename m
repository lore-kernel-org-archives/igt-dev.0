Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4DCC3ABB2
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 09:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457F810E57B;
	Wed, 28 May 2025 09:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjr48a16";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6851410E1EA
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 09:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748423548; x=1779959548;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q2lLFokP4kXacPDeSubUOP2kQZULBJs+jZhmKCkyR0s=;
 b=gjr48a169iaSXAS4TM2ficTdAq3EfxIpyhyVZidJzXfgPc7aaBQ9aHsR
 8UMVSVp0DOjE+cK24jkVEx0PoZkC3Efv/qwHLYoPje7N01atXOq0LpxEP
 7QXMsIiRNaucf924rPvDzhGD0QgOhpX+Cyb2cx5u351rmdQWWN7YWTb46
 OW3H077OlF/3FnuXJxhPdHoJGIRydlrppASwjCKPCizBRGPA7YfUI5oL/
 Uzn3TCleP2b0K7raG7gF+K40yTdfXrt4tgP9iBVP8qNaPToFD76gpbzQi
 VD1FvKYEkdsScpbWdtG8Tah+pVUmZxE04xMNe4DsJQR5jqe+6eQiosZDd g==;
X-CSE-ConnectionGUID: utV+3FjkS5KLcapaMXi+mw==
X-CSE-MsgGUID: JVaY1v7sQX+iy4gPsMx2gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50140134"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50140134"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:12:28 -0700
X-CSE-ConnectionGUID: M7weVuv6SbCPFo0MWC+JTg==
X-CSE-MsgGUID: PN4mpWb7R0CRPQZPxGjeTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143099315"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:12:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 02:12:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 02:12:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.43)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 02:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhFBPtt/alta+UMJNhhm0cS3hVPc7KXagXr2O4IOJdYCgax4+U1w/D/IDMqMgJT+mgXsKQGMyxMt72IBFv7FeRRvtTq0sFbcZ6uVf5ugMR9eyDmIIQksK6YmWGX94UIJFnFq72yLZj9z+NjY4GOAefdo8YwaaFWXfnJPjDpB33oUZFikHSSodTHQyMl+bZ0QOSRMsjVaGtiSsvXdGKhqIU+T2cVBP4+qKxwRsaDZDi840EphCvzC3VbmdFuZcT738BRDr0TvPj8ituvgW/fqKk0tiimPglnwc9vgGlKL/dfwtxCfskjUbPdl32jTXpDsWVDWQfe4asewchlb14MVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9E9h9xPn25z2pNirBTtBDEvlYRMlckfyDGQvXu1VzxM=;
 b=T6y5L5WzSdYPZNs2/q51ZHPX7JZ/Yl47WUPjO6GUF5/2jrc267eeqdVZmsK4j6xZTNJ5QiJddfz1mzVtuS7Fr1AuRSrUSjPWxeSG0dxTgA407dSXCDgH9RBG79tGheSNO42CdMH3EvKKW+VvDBKIV3tt/XoMi/peSWxA8oG+dTFU9Q65wo7QlDf5rdQIQcyUTvs/fR3SghMxSOP5kanFlxsYeTWswp3FckayLsM2JtaGzw4XdJxz06twl9BZ9M34KNhsQ3eWnXhE0ICGEnIko/Bwg3kNp8AFZzBDyOVcsgZCxhmwgCVY7fG2gWKKvc3hspGQ+K5bQqwAJYicTH0qAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8277.namprd11.prod.outlook.com (2603:10b6:806:25a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 28 May
 2025 09:12:06 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 09:12:06 +0000
Date: Wed, 28 May 2025 11:11:59 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 1/4] lib/intel_compute: move user-fence to allow
 async exec call
Message-ID: <aDbTXw9cR-R_RZsy@fdugast-desk>
References: <20250522075515.168920-1-zbigniew.kempczynski@intel.com>
 <20250522075515.168920-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250522075515.168920-2-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU6P191CA0071.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::28) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ab1fb7-f9dd-4735-824f-08dd9dc7b77e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U01RNmdETmVaei9WbVVGVjd4Zm9xdll4VDJOeWhFWGhzdXFnTWxoR2xDcEh4?=
 =?utf-8?B?em5tUFJuM2ttTlFjMi9lRlNVMWg3RE42RFpyZ2RCL2tFRDBqNnQwTmxic3F0?=
 =?utf-8?B?WUMrb0NlYXVYV0o2OGZiV0R2RjdxcU5lcWg1aUxIaThCK3FDWEdzcGRjTm5v?=
 =?utf-8?B?SjJ6R0ZlR1hTNzB2N0JwWjg5aEZlVWsyREtITXUrZ3NhbFZXQk5adjRobDJp?=
 =?utf-8?B?NmQ5aTdoRDBhMWthdjBKNCtOODQyMlJpcnk4bVJ2OE9iUzFiMDFnRUhBQUxR?=
 =?utf-8?B?dXlxckhLd1JjeWh5YkM5cHpxMHFDMnJCVlJVWEJqL292dytqNURFTVJWeEZl?=
 =?utf-8?B?STY1bUFaaUIzRnFWWFhRdVdXZEhEeVZNcmhwMUk3MmNibEU0L0xZYlM2M3lZ?=
 =?utf-8?B?YndneGcvU3VsUzJvbDRWWFcrL0hrMnJFTjMreDBVQjJTcG9HVGlUdVo5VXRP?=
 =?utf-8?B?M2dWU2FlQkdMUnpoOHprMTRkbEtQNkhmYWhWNDZVODIzNXRiT1NWUUpaNkw2?=
 =?utf-8?B?VW5WTnBHNGR1WkMwM3pZNUJuNFV6VlVLZVdyN1g3eFBJd0NWMnpZK0dmSDhN?=
 =?utf-8?B?WU9sOUpUWDVoc2JkUUNwVzNIbURRMlhPaU9CTnB6K0pWdGlSVmpsblY4T3l3?=
 =?utf-8?B?aUQ2MU02T3BQd2hDOU9YOE1VTEtXL01pem8xNHlpK2hVdjBJekFWSmVtN0hh?=
 =?utf-8?B?cEsvVHQ2emtqMTJYb0VtSlBjZTg1UTNOSWNTK3hyaENtWnc4QjNDL3hxRXM4?=
 =?utf-8?B?U0JXSnk3MlZnN1MzVE5Md09ydFpYbEc2NWlwbnRtcmU4NXloT2ZkL2QyOWtP?=
 =?utf-8?B?WlhIeEZxaWlUaFFTT25Bc2tiUDVSYml4czZVdXlzSld4SnkrM0hVWHd4T3NM?=
 =?utf-8?B?QU1sNDJhWlZidWlWQkFYSkVxZFpOS2pXZjBZVnhDbytxMlpkek5aRTB2M2JN?=
 =?utf-8?B?eGxwMzh6YS9tek1qdUs2VFhmNTdmdFowQ3RIZjBkT1IyaFZMQ01CK0tPelRq?=
 =?utf-8?B?QmRzUTdVNnV1WFJ1V0VXQUN2V3lLVFFFV3pJMnY0MGVkVk5hMWF4MjBrME41?=
 =?utf-8?B?QXhKcUNsNmMxWUwwUmZlVWNTZmdWRlE0cExuODhhTHJWeUNHR25STE5iTGlY?=
 =?utf-8?B?VzNxWXhVR05iaWdHRnh4aVBhdFBqOEFkOVFjdGxYdjcySkUvOUhjaEV6ZEIx?=
 =?utf-8?B?ZU82UGZNZ3cxN3ZaY0RzV2RkdFF3OFRrNXQzUnYwUlJTQ3BiaXNuNm4zWXFh?=
 =?utf-8?B?N21YZVF3dXlIWGxjZFdoY0pZcS8rYWpBcXVZeFhkT0sxNXY1YjVnMER1SXBF?=
 =?utf-8?B?dG9GQ3QxMG1rcWdSVU5WbXRCVDNwTnhFS2JRTDI5c2w2cDMyZnhic3Q5dlc3?=
 =?utf-8?B?RmVuZ2toNlNsb0FHMkhYUTBmdXc5SVdHUzBxSUpOcXQ4aU5UREVpRGVxWTFv?=
 =?utf-8?B?cjdkT1dhaWgrOTVtL05nV0tPVW5xbE9MY0lENGlNNGVtcHA0V2VSY1pSTkU0?=
 =?utf-8?B?cVV2eW9STkhad01CMkJpUzRjL2NyU0kxcXRvaW9NbnRWeDgwdHg4a2NjZFlY?=
 =?utf-8?B?bzBqQmxHZWwwRUl0SUw0WnhRaS9TaTRKRUEwcndVblNTdk01NzcxVi9UZFcy?=
 =?utf-8?B?REs0aGVrZlpYTHZHRWZscWJ6NFNnaUlBMlhZZjhVVXkxZkFYREF0VEZnMWdI?=
 =?utf-8?B?cGd4WU4xalNnNzY1dTd6TWVqKzhRRGJmdmxoZ3ZlSHBJcUlGTStTRVBHQmJB?=
 =?utf-8?B?YnhiV2tPbmYva29NU2g2R0xBeTU5eEx1V2F2Q296bXNINlFIZ01QZGl3OEwr?=
 =?utf-8?B?MnhVMXBsN1M1Y3JnamM5Ny9lK2lLTXlxRHM0VU5nZXVOcnJNUlRZaHZpRWVM?=
 =?utf-8?B?Q1NXS1greTA0KzFQaDhKOVpGeWkyYmlaQjgyNjEyVjZSVGJKRHg5ekl0c3Ez?=
 =?utf-8?Q?M+c2Gm5ted4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RyswZ2pyVy9ZY0RXd2JxVGY1UWRSU1o3QWJSUVlwb0N0MFp2MW1xZmdETTNP?=
 =?utf-8?B?azJiaDBPMXYzdzdtSUhxd2hLRkxINWxvWHkyYjVON2tySG5kVTV3R1Q2cmVE?=
 =?utf-8?B?YjJpWC9TdkVmSU8xWGtYYmJ3ZTI5MU1UbEV6Uk5qdm5pZ0hkTnRCYTFaSzF0?=
 =?utf-8?B?UzNhQmVTTnFVSnExTjRuVmxFWkJJOW9MWHh0b2h5b2ViRzN2eVJJN3lHcjcy?=
 =?utf-8?B?b2IyM01vWWZZS1h0ckhNVGV6aEN4WUVDSkFlM1loY2FyRXRxcXBpM01LOTBh?=
 =?utf-8?B?UjNKcE5TdFp3aEp4b0RtRVJaNm1GaS9Gbi9wRlhEY0MydmViK210b0F4Z1BK?=
 =?utf-8?B?UVlNMzJWbkI0Q1lpYWVjZXcrSjMraFhmQXh0VmNCUm9pRitxZzJhaXNlZWxR?=
 =?utf-8?B?NGlHYzVlY3NzekMvT1FLUmxQNjhYTjVXc1Y3SE0yZlJHRmNrVzhuS3BBaVJC?=
 =?utf-8?B?NjYwUjhqY3ZyWFRidUlUc09CZUZZeWR4Y0oyaDhNU3hIOG8zU3p5cVBpU2kw?=
 =?utf-8?B?aEloNWJtWTNMY01LTHgrUER6YkZ6RW11WmlGRmdkYmtveEUzN1ZQSFNvSmt6?=
 =?utf-8?B?eGlKYUhuZk1DclZuQjB4dFNFSFA2NWtzY3lrTXFtWkV4SjBNcENyOGs2T25W?=
 =?utf-8?B?bG5MelhhQWQvLzJFVVdsTmZMaHovc1FtbS9sOEs5MkxoNjd4S2FOa1l6WHdJ?=
 =?utf-8?B?Q1RKZmErVjgzNHlTUWNROHlySUZZWVo0eTFGRVpXSU5odlRpc3V5Y3U4YW9C?=
 =?utf-8?B?eUN1TDY5SlB6MlZ4RWJuQkRMdm5ibHdjTjF6ZTdQU1pWbmlLSWZmYmp3K29h?=
 =?utf-8?B?SVIvS2xqV2h2SzNlSE00bFoydlkzUXlwSGhGVzRyWVBua0d5UWhDUWZRRWk0?=
 =?utf-8?B?cC9jTVh1RjRFVmZUWjF4VktFb1FER3REQzFrTHF6eERRdWQwRlYwRlB2MXA5?=
 =?utf-8?B?allhTzRYV1hTcGNJSVVrOEgrZHNuYXQ1S1lvQ0Q0Z2ttQUwybUhwV0xucmt6?=
 =?utf-8?B?bWN5VjdrNlk3NTV6WlVSU2ZRbTR3TVIvQ0ZJa0lpV3ZTdDNqOTJkYXZZWlBv?=
 =?utf-8?B?QWUvUHU5SmYrOHZaUTRrbDE5YVhWK25ybzBqczVPd3F3QWkxSEpUVFQvNDRv?=
 =?utf-8?B?NkN4aWJHNXlnMHpHN1ZrZ0ViT2pDYStmanZYaGd1aUZ5eTJCRDI5V050S2lV?=
 =?utf-8?B?bEp4M1R4N3VOZTQ3T2RwQ3U5OUlHTm9mS0NZQkw5T01zQmpoOVVYUGttaFJ1?=
 =?utf-8?B?WWJuWlFpQ0U2UjdEamd3UDdZdXRDWjZWMWhOWWRTdzNsNW1CMkVzZWpadTZr?=
 =?utf-8?B?UE82S1pEaXMzMzZLTVowUFBYN1ZPOUxLRFh0elJ0TjZtVkprUEJZZ2pJelFt?=
 =?utf-8?B?WUVxYTBRRkZlUjREZi95dkVDb0hhNWlnMlhFWUFsUFBBNUxtS1AwU3Q0SmNk?=
 =?utf-8?B?M2RGaXlmZGFHYU9VbElSVVB1ZzMyRUk4N2wwTG1XZVZTUXhvUURpem1CU3RW?=
 =?utf-8?B?cXJjd2twR3JUSVcrRnZCbmtTUTQ0WUtQOHJNTVo0TG9udnhDRWlicFpHQkxG?=
 =?utf-8?B?OGhYbStNN3I3ajFvMzVKcTg2amZOWHVsMGViWnNGTkZmL25aUk0vNjNPZTV5?=
 =?utf-8?B?bWRSRDA0NThuc25QS2NuV1VpZ2g5UG92akNSV1YwakJYZng5L1NFbVUrYW5p?=
 =?utf-8?B?UkwzOXNQbi9UUlJnZHAwTEdSV0tWN2dGRURzajBTZ3A2a2JYeFkzWEVEUzZW?=
 =?utf-8?B?em1iaXZjeHR4ZUt4UWRUWXRPbHdKSEgzT3F5UDNMWUgwaXFYRDdkclNlVVJn?=
 =?utf-8?B?WTl4bXkxckZmOHJHV0djd2RJeVptZDN2MzVDYjFvWjhxMGxOTkE2cGl6Wmti?=
 =?utf-8?B?czh3TGxCeUFRSzJ1SStWZ1BRYmJ1b3dPYy80djRhemsrd2tuTUdXQzliUkpa?=
 =?utf-8?B?TTJDOE1wNnRKbGxNUnROV1k4Q2d6K01hd3BRNThSemVpSlQ3V0M4TjY2MmFE?=
 =?utf-8?B?dlUwa1FXWTB0S0hlV0ZzNXhScnpiWWY4MjZHOUZhL0JHVVY0bmMvNTQ5Mnhr?=
 =?utf-8?B?cVpnN1VvTDlUV3VFNlUvTkxFUTBXWHVGdm9Ea1FVLy9kbjRKWFk3SkhNNWpG?=
 =?utf-8?B?WkUwUjk0TGNpbDZ5MDNBMUFhbWlHMVBMSnJTdXlaeDdLcXM3c1lzZEoreHpY?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ab1fb7-f9dd-4735-824f-08dd9dc7b77e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:12:06.1333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFwZK7q6Ickyu0TClI9naIfZU+A4/sfn6RT6FurLgV2Nc7OFf1+lTHVVOrbjmHcQMuYo+WqCRmX4O8r6Y6SsQ8T78c4QvJUn2HcLwC7HYjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8277
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

On Thu, May 22, 2025 at 09:55:12AM +0200, Zbigniew Kempczyński wrote:
> User-fence in bo_execenv_exec() limits its usage to synchronous call.
> Remove this limitation by migration of user-fence from function level
> to execenv structure. This allows to synchronize later what is useful
> for parallel submission scenarios.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_compute.c | 77 ++++++++++++++++++++++++++++++---------------
>  1 file changed, 52 insertions(+), 25 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 070bc0d2d8..5579bec85b 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -89,6 +89,12 @@ struct bo_execenv {
>  	uint32_t exec_queue;
>  	uint32_t array_size;
>  
> +	/* Xe user-fence */
> +	uint32_t bo;
> +	size_t bo_size;
> +	struct bo_sync *bo_sync;
> +	struct drm_xe_sync sync;
> +
>  	/* i915 part */
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	struct drm_i915_gem_exec_object2 *obj;
> @@ -266,48 +272,69 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
>  	}
>  }
>  
> -static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
> +static void __bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
>  {
>  	int fd = execenv->fd;
>  
>  	if (execenv->driver == INTEL_DRIVER_XE) {
>  		uint32_t exec_queue = execenv->exec_queue;
> -		struct bo_sync *bo_sync;
> -		size_t bo_size = sizeof(*bo_sync);
> -		uint32_t bo = 0;
> -		struct drm_xe_sync sync = {
> -			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> -			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> -			.timeline_value = USER_FENCE_VALUE,
> -		};
> +		size_t bo_size = ALIGN(sizeof(struct bo_sync),
> +				       xe_get_default_alignment(fd));
>  
> -		bo_size = xe_bb_size(fd, bo_size);
> -		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
> -				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -		bo_sync = xe_bo_map(fd, bo, bo_size);
> -		sync.addr = to_user_pointer(&bo_sync->sync);
> -		xe_vm_bind_async(fd, execenv->vm, 0, bo, 0, ADDR_SYNC, bo_size, &sync, 1);
> -		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, INT64_MAX);
> +		execenv->bo_size = bo_size;
> +		execenv->bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
> +					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		execenv->bo_sync = xe_bo_map(fd, execenv->bo, bo_size);
> +		execenv->sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
> +		execenv->sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +		execenv->sync.timeline_value = USER_FENCE_VALUE;
> +		execenv->sync.addr = to_user_pointer(&execenv->bo_sync->sync);
> +		xe_vm_bind_async(fd, execenv->vm, 0, execenv->bo, 0, ADDR_SYNC,
> +				 bo_size, &execenv->sync, 1);
> +		xe_wait_ufence(fd, &execenv->bo_sync->sync, USER_FENCE_VALUE,
> +			       exec_queue, INT64_MAX);
>  
> -		sync.addr = ADDR_SYNC;
> -		bo_sync->sync = 0;
> +		execenv->sync.addr = ADDR_SYNC;
> +		execenv->bo_sync->sync = 0;
>  
> -		xe_exec_sync(fd, exec_queue, start_addr, &sync, 1);
> -		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, INT64_MAX);
> -
> -		munmap(bo_sync, bo_size);
> -		gem_close(fd, bo);
> +		xe_exec_sync(fd, exec_queue, start_addr, &execenv->sync, 1);
>  	} else {
>  		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
> -		struct drm_i915_gem_exec_object2 *obj = execenv->obj;
> -		int num_objects = execbuf->buffer_count;
>  
>  		execbuf->flags = I915_EXEC_RENDER;
>  		gem_execbuf(fd, execbuf);
> +	}
> +}
> +
> +static void bo_execenv_sync(struct bo_execenv *execenv)
> +{
> +	int fd = execenv->fd;
> +
> +	if (execenv->driver == INTEL_DRIVER_XE) {
> +		xe_wait_ufence(fd, &execenv->bo_sync->sync,
> +			       USER_FENCE_VALUE, execenv->exec_queue, INT64_MAX);
> +		munmap(execenv->bo_sync, execenv->bo_size);
> +		gem_close(fd, execenv->bo);
> +	} else {
> +		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
> +		struct drm_i915_gem_exec_object2 *obj = execenv->obj;
> +		int num_objects = execbuf->buffer_count;
> +
>  		gem_sync(fd, obj[num_objects - 1].handle); /* batch handle */
>  	}
>  }
>  
> +static void bo_execenv_exec_async(struct bo_execenv *execenv, uint64_t start_addr)
> +{
> +	__bo_execenv_exec(execenv, start_addr);
> +}
> +
> +static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
> +{
> +	bo_execenv_exec_async(execenv, start_addr);
> +	bo_execenv_sync(execenv);
> +}
> +
>  static uint32_t size_thread_group_x(uint32_t work_size)
>  {
>  	return MAX(1, work_size / (ENQUEUED_LOCAL_SIZE_X *
> -- 
> 2.43.0
> 
