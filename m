Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E76DC02183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 22:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA70E10EA15;
	Thu, 16 Jan 2025 22:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TiOUFCU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874A810E39C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 22:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737064985; x=1768600985;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=RlcE1tVIqHNkvYGRTfsHv8Hu8No6urzFcgaF3F+QNc0=;
 b=TiOUFCU4FKimNsT7fXY02ErE8RkG4+oMs6pIXGdQOSSxJ8P7HwqZVXft
 Dq66Rn9BJhSDjI4Egp7o91YltcQziEU3341r4qbFED02/no+JxdVuXAZ5
 LDYLfHdg+CXxwW+eHuGQ84qxJRTUFEKVWKF2tbd8omP5anbf6fy9rmZxo
 8GWrSc21BUadOfyBK/oOl7ykh0+KQTht0mNORtKvRfEnwjyzkKGvjF5HA
 EtNjuXvzB/0PBs43F33htG2T79M2sAt6ONiKtPjPUVquCBfpQLcbTz+1Q
 s/aPdID7sK+PBoEy7kB7h6Bs6Ioq21/n5gq+/B2Pci1xLnEpmDI/0iKXa Q==;
X-CSE-ConnectionGUID: Zxuzm5JEQQaENZb6o38Wig==
X-CSE-MsgGUID: K4xftB3SQuGbQhXhPea27Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="40288293"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="40288293"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 14:03:04 -0800
X-CSE-ConnectionGUID: pAsnauuSSUy0HKsYQWI4cQ==
X-CSE-MsgGUID: d4b5N6PkTx60Yah1zyhLBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="106204660"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 14:03:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 14:03:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 14:03:03 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 14:03:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjotPvXFe8KLyimYZq5eS/+TQZF3/FEq4x68HiSR9FdNo9DTJiZP7FfjLu0pDWWVojrns9SfqDcF8PTetq5Fg3utfXwJ9rOpRjl7x5ahDMGOlwjpQi1xK7m5BlPIVqzDCy1/Fd5kT7UHu4KnQxa6zQiAVL/hs7ACh/L7FCQTvHpza8lvl52g6hfcMUjuqXgmVD2XteYQoO0fRl/GtrAN4u7MGiPXqV7DPDXyyn0ddVFpWLglB2/HpRwco/fHbZrbxvbobFOtfrPy7o9LUsTNJzAS/8GD3P+2kyXmLpZTOcLgePxbDrbSPDL1RUvIIzqn/bi5Jc5axYV6fG34Aq6uuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlcE1tVIqHNkvYGRTfsHv8Hu8No6urzFcgaF3F+QNc0=;
 b=Mj6kVMZJ3abMDJ1ewBAU8orr9BnjTNB30+5OgUR8XHfFhvnJtz5gsPtyJg/UnmW7DNzYjOKpWxPy2iIM8Mcgt88UulEXOnYVTmJMI+6Xajg8CXZhHisysjbRfqYdEJN1I1XlCt99LdUTf99xDvCBkDlzU5CluPI5PQk7t5ZHeu9dAaXq036DzkqIWQDEsJq8WzEpiXKQ/wHEvfBf1vHWN5oWxsOuZSaIVhO2Z1WXpW1fUFY47YjgqIFdcLvRNv5ovQI8t3gUB3XW09OyTa5+EHCI9xI7fHCBxs66YSi1b7YACZ4mUGQ5Lyxf3zcjPBQGK3244CJwz8iWma2UiOYmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by DM3PR11MB8681.namprd11.prod.outlook.com (2603:10b6:0:49::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Thu, 16 Jan 2025 22:02:31 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%3]) with mapi id 15.20.8356.014; Thu, 16 Jan 2025
 22:02:31 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t v2 4/9] tests/intel/xe_create: Stop treating the
 extension field as MBZ
Thread-Topic: [PATCH i-g-t v2 4/9] tests/intel/xe_create: Stop treating the
 extension field as MBZ
Thread-Index: AQHbZ6x3Ltx1leUZb0iNl7O/i2kPhbMZ9VKA
Date: Thu, 16 Jan 2025 22:02:31 +0000
Message-ID: <7626a11d90ed144fce3125421632746059eceb68.camel@intel.com>
References: <20250116001951.4159243-1-daniele.ceraolospurio@intel.com>
 <20250116001951.4159243-5-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250116001951.4159243-5-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|DM3PR11MB8681:EE_
x-ms-office365-filtering-correlation-id: 3f59a28c-f674-43a2-8bca-08dd36797983
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N2JnTDc5VjljcEMyWU5yRndlRzc1NTJkT0xmWjllSldXMWQwVjU2ekpNTXp6?=
 =?utf-8?B?RlMxemN2UTVxM1I1WlNRS01lTDBjaGdWdGE3eGc1QTFPN0J5SGtJK2VnZkYr?=
 =?utf-8?B?cW13c1ZmMVpENVFMQWxKL200YTNkcUhRR3I2TmlaNFptUVNEeTVwbmFXdmsx?=
 =?utf-8?B?TkNuYTczVVFXUmRQMytnZTA4ZHdTK0d4ODZkZFlLU3NnT240czRsV3BsYVlm?=
 =?utf-8?B?Z3VpclVuNjNyQVdlQTdlaUVpK1NxTGl1bllZeVBteTRIWXhjYWJUM3BxZ0lX?=
 =?utf-8?B?MUJKdVNSSmt4d3ZKb2RDRVQ4MHc2SkxaQ0hwT0swRTJBODUvUjlOL3ladzN2?=
 =?utf-8?B?S1RHN1NLdU5PdENsKzNvdlNLRFhoSXUvWWFrU0hqNjdiSytwb29saVN0cm1F?=
 =?utf-8?B?N0tRdDUvMFBmdXVjc2k3SE1GZzdJc2JmTWk0M3ZnNTA3ZU0ySXZYUVltY2Ev?=
 =?utf-8?B?WE84TXg1QXlHbnVOamt3VmdxaUR2eG1qaU9ZOHZ3OFoxNUxKWUlRWWNaWXh2?=
 =?utf-8?B?ZXV5eUY5MzA1eVFaWVMzREJOT3p5YkkzVFQrRndTQzMxQTdKKzZLMStxZHRW?=
 =?utf-8?B?MFUxck5yNHB4MTd0YURITExuc2JwZGZ1bVdPQjNEWmMvTlZiZklLVXpvSlh6?=
 =?utf-8?B?L2dQUG9ZTC9VRDNTSkJnZEVTRDdjZGptTG43ajdYMjVZL0xlUjRFOC9NbEE0?=
 =?utf-8?B?TytFUnNCbVh5dnRKZnpBVmZZbUpGR0t3amkzbXIzazJOTWFRcmx1eFRibjNE?=
 =?utf-8?B?OTZnUnpXbnE5azlFYjVSVkVtczcwYWNRQ3dzb3g1RVcvZXAvT0t5VWRoV0VS?=
 =?utf-8?B?OGxuQXZ4b2lCRkNnbmUvdHc4czY1SnpNeGpSS2dxbWFFNUkyQUIwQzg0akpB?=
 =?utf-8?B?MzRNUXVtMU9zUHZ0NjRpb3dEblBTcGpoamhTQ05ZVFZITUZQbDlEOXFuSndm?=
 =?utf-8?B?TnNpS0xHV1MrUk5tZDY5RUEwTmdkNmthRS9QK0ZDL0svMnYvQ0x4NWY0aThm?=
 =?utf-8?B?TzZVazc1anlOQXpjWER6K3BPRVJCcWxqSHNxR1VacVY1aWU4aG8rUlgxcFpU?=
 =?utf-8?B?aE96QzdmWUg0Q2pUNlNvcTZYSloyK0RMdGhTR0xYSlRDVnJCK0tDN3B4UGNB?=
 =?utf-8?B?OFpNaDI0eG51SU8xWG1WZGtFUXk4cFNCcElZdW03U0lpaGV2TGo0NmFjb3Y1?=
 =?utf-8?B?bDFiUlVZc1hSVk9OZ2ZQNHIrTnZlNWNncC9qemNXSnc5RDVjNUZGTVRHQTBM?=
 =?utf-8?B?b3JyVFRrb01Wb0R5YUIyUHY4YkJncEYzU3U2aHFFVWI5RE9MK2RPUmY5STEr?=
 =?utf-8?B?aDkwUWlSUHZWZENucHJicHBLRCtZQUpUWEsrT1g0MzdFWjROVERCYmhsZ3NZ?=
 =?utf-8?B?UW90YWwzWVBSYWNMcXJLdHlkMFZvUnNNMk1makIyOTZ4U3JRdlI2UVY4M2JS?=
 =?utf-8?B?cXVZMnFQSVk3Z1p5YmszTjhuMUZiVkZCcmFuWGgrRWtYSjRYS3pkM3VGS09p?=
 =?utf-8?B?OVlxMmVHRkpXbzFzdTJEVHM2OCt2MmV5RDFIMHdhbWg2SjkyNUdndmtIS0Jh?=
 =?utf-8?B?VjdacHpGb1VxYXY1eUlvWGdjTmJLYW4yK1FrdU5hdmF5K2xKdzNYLzNTeW1l?=
 =?utf-8?B?QlhRQzRPVGxsVXZXOWlsMU5xTUxhWkVSMEVLcGM1eERoMTg5WDQ4QUZWSm81?=
 =?utf-8?B?Ynp6S1RLeXFuTW85cVhxVERkZGlrMlg5Ukt1TUJVSHBiaGh5bnpXWUpBbEt3?=
 =?utf-8?B?c2x6djA0bWtoQml5ek5zM0dPbGNmTzgxN2pjc2F3U3pyZ21ydlFMTENjOHcr?=
 =?utf-8?B?K21Wa2xMUjFvWWZodjZZNUVTd2FacG1NOWFoSTd5OGM0eEg0anovRzBUeFdJ?=
 =?utf-8?B?aURBS1M1YzB2b1RyQmNGdWR4U3dpZ21pOGszU2JRcEhWWFp1NGZWRnhZekpW?=
 =?utf-8?Q?76i5E65fvgk6pflq+KgREpDYfKJx0/1b?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MW5LYytrTkRnbVAvR2dxcUZteTlpcWl1NWsvLzUwNXhsUE40RlJJeC85L0lN?=
 =?utf-8?B?QTJyU2JtK0x0cUl5and0NUkxeTl0MmNzOVRRT3d5Ump6QmxTdE9jc0E3ZTNJ?=
 =?utf-8?B?T1Q4RWFZMEhZOFFSck1ZZ1gvUkdobXU1d2YzcXcyM3VsSDRRS2ROTDB1VjdW?=
 =?utf-8?B?VlBRSnBzZjFraEF2TTFlQkZKVlAxTVhYdzh0elk3K0labTRrMzY3QWlpYzJG?=
 =?utf-8?B?emZhVUlTL1RGRzlmZTh4WUJLYmROQlI5RkVWdGhDYXBYKzlROThIcDFNVjZO?=
 =?utf-8?B?anI1QXNyeklHSy9FVTFFWmp1TTVDL256ekFPSlNiaWhoSkJzalZTcWhCM1RW?=
 =?utf-8?B?K2pocm8zdGFPYTVKc0RKbWZJYlpiY08xUEdHdDBTRmsycStFbGt0a3JoQjR2?=
 =?utf-8?B?THNOazZiZjRSTUZmYjRZVksyWVU4YmtNbStKa1A4ZG1mUG5UTWV4TGNhZlU3?=
 =?utf-8?B?bHI1RzF3UVpTNldpYUNOdEVwYk9SMXJYQW13ektLZnMzN3RtYmhleFNHL25N?=
 =?utf-8?B?YjIzTUhEZW9OZk8yREhsZ0RvVkdNY1greUJnT0h2aVVvaFpmbG1lWHFoRGg2?=
 =?utf-8?B?V21kaEhiZ2FlV1FOR1JEbE54ZENYZ0ZXL0dVakdPZ00veEI2STZ5U3RqQ0xx?=
 =?utf-8?B?bmNKK3A4VHZIS3JSU2tEdFBnTmJsYTZLS3ZVZlVqOVRqTWdLVGRBQkFuYXhh?=
 =?utf-8?B?cGtUSnZ1a3Q0Si8vc1puNDNFbEU4VjlORmhRM05WSElEQ3FBOUFpSFc0Q3hQ?=
 =?utf-8?B?aW5sdWgzbW5hQ0FaaHIydFg1Z2Z5NVI1c1JnQ29OeE0xQ2xHQy8vejY2bTZx?=
 =?utf-8?B?YWhUMVZKWWF2M2VVNHhIUlJKZUhRd0Q1cXQ4Y1YvUVpjWEhGd1hiYlpPYmdo?=
 =?utf-8?B?WWpzRExMbGYwY1VpQmtMREpSbGRESHFJVi80VnJtSFN4bDR2SUtEMjlHZ2hz?=
 =?utf-8?B?L2JGZ3pqMjZVZTFjdHA4aWxKS1FBOHB6Y0NmWTJ4a1lHVG00U3AyV0tJVlJK?=
 =?utf-8?B?dnBzUnBzWG5wK3VHL29CcmRwK21WR2h1dDBDbmRnQjBicEFVY2k1RDE4cUtt?=
 =?utf-8?B?aUdzOU9mZmZCaEdFSC9Oa1k1ZFBuNnVGUExFMS9QS3RiaXZmZ3dWTTFUcUE1?=
 =?utf-8?B?VHVXMFhWdXovcnFXeXZWb3RHMUlWdGlNZXNlUllsQTZMMmVDeEJIS0V3bERC?=
 =?utf-8?B?eXlCTk9JYzlqNWgvbWhwbTZjRlJjOUFSRGpLNGdwTUo3ZnQvR1I2dXRMK3Bm?=
 =?utf-8?B?bkVFNENJeGhqTjRZQWJCck05empnRGs1cFZSdTBDNFRnQTZoOWZEVEhOL0dX?=
 =?utf-8?B?bnhqMzJPZjhEdG9vZWNQMUoyWTUyMEJiWXZuN3ZyNWcwTzg1bENkc1ZTMW5r?=
 =?utf-8?B?dUkwb3JLVDhlWHRReG1sWkY5azdWZUVnN0d2VGh2SjFhQUFYeEVYejNKNHNs?=
 =?utf-8?B?NVl2dlFxS0VRQkwrRFE4c2J0WnpWcTN5ZUczS21hY2dPTVZvVlhzU29JSm0v?=
 =?utf-8?B?Q21NdEdlVXlKSFNkZ0kvK2hTNjgzbWs1ZDUzMW9WSkFWREVKWW5kOVIzdmMx?=
 =?utf-8?B?S3dCZzNqWEhPcHVsMWJOYitKUHZhMUdsMytQZlkyTUtOT1hEZWFWSDFJRDMy?=
 =?utf-8?B?dTRmeWdyc3dTcFM1RlRRZm9kRWJON0I5U1FFckNEVjhJRGRzaFBpOURwd1RZ?=
 =?utf-8?B?ZUpKQmZSM1AzTmdHb3pLUXlTakhqSEpVSjBlY3VIbitDZEZ3bFMydHltY25s?=
 =?utf-8?B?dCtvVWp6aC81LzBlTjdrVkVTcTVqaFNHRlRBSSsyRlVPWm44MEhJRVk3K0l0?=
 =?utf-8?B?RGgrZ2pjby9XVERRa2xJamk0UGRNem80VWtHQmhsOXBLRC8vNUtCMGc5a29I?=
 =?utf-8?B?NlpaSUpDWGdlL2RSRlJuemdERnRvQTVmRkhxWVRSZ2w2bHFjWHBpR1EvenJn?=
 =?utf-8?B?bU43ZEJIWHNNV0pWd0Z5TUFpeGdRUmhpTnh0LzRJaHRaQ2JjVzgrejViTDNI?=
 =?utf-8?B?bEU1anpHdTJmTktrRkR4TmJheFJVZ3lJbFYvTW5wczM0TDFrdXdCOEJtVTF3?=
 =?utf-8?B?MFlGRTByZXFZbXJkTzMzUGZxOWI2NWwwY3RvcWtSb0prMWg3V25GbERxK21I?=
 =?utf-8?B?ajk0Ym5KTG1sd2JZK0Z4Nm9qTkZ5aVE5SmNHa2RnNkp6OWJFSWpvQnJjMHNn?=
 =?utf-8?Q?JrKYcwOpuvF7qDbBa7jEzvg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B1D4A668DEA1344905A651D55C6C6AC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f59a28c-f674-43a2-8bca-08dd36797983
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 22:02:31.3774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXzgXwHKzwUKhME1Ej80TRHk1lQRDYWSBcBiRsd7D8Gu1nKPxkRafc31NO8XswRyAJA8PTMlZ+gDOCJ4DoFJQe8DrXzKSkdelJOTT16L62smLM2haHibsIwBvHdoJOlC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8681
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

UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPg0KDQpPbiBXZWQsIDIwMjUtMDEtMTUgYXQgMTY6MTkgLTA4MDAsIERhbmllbGUgQ2VyYW9s
byBTcHVyaW8gd3JvdGU6DQo+IEEgbmV3IGV4dGVuc2lvbiBmb3IgdGhlIHhlX2NyZWF0ZSBpb2N0
bCB3YXMgYWRkZWQgdG8gc3VwcG9ydCBQWFAsIHNvIHRoZQ0KPiBmaWVsZCBpcyBubyBsb25nZXIg
ZXhwZWN0ZWQgdG8gYWx3YXlzIGJlIHplcm8uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWxl
IENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiAtLS0N
Cj4gwqB0ZXN0cy9pbnRlbC94ZV9jcmVhdGUuYyB8IDUgLS0tLS0NCj4gwqAxIGZpbGUgY2hhbmdl
ZCwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9jcmVh
dGUuYyBiL3Rlc3RzL2ludGVsL3hlX2NyZWF0ZS5jDQo+IGluZGV4IDA3ZTExMDM2ZC4uMDkwN2E4
YThhIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9jcmVhdGUuYw0KPiArKysgYi90ZXN0
cy9pbnRlbC94ZV9jcmVhdGUuYw0KPiBAQCAtMTI3LDExICsxMjcsNiBAQCBzdGF0aWMgdm9pZCBj
cmVhdGVfaW52YWxpZF9tYnooaW50IGZkKQ0KPiDCoMKgwqDCoMKgwqDCoMKgZ2VtX2Nsb3NlKGZk
LCBjcmVhdGUuaGFuZGxlKTsNCj4gwqDCoMKgwqDCoMKgwqDCoGNyZWF0ZS5oYW5kbGUgPSAwOw0K
PiDCoA0KPiAtwqDCoMKgwqDCoMKgwqAvKiBObyBzdXBwb3J0ZWQgZXh0ZW5zaW9ucyB5ZXQgKi8N
Cj4gLcKgwqDCoMKgwqDCoMKgY3JlYXRlLmV4dGVuc2lvbnMgPSAtMTsNCj4gLcKgwqDCoMKgwqDC
oMKgaWd0X2Fzc2VydF9lcShfX2lvY3RsX2NyZWF0ZShmZCwgJmNyZWF0ZSksIC1FSU5WQUwpOw0K
PiAtwqDCoMKgwqDCoMKgwqBjcmVhdGUuZXh0ZW5zaW9ucyA9IDA7DQo+IC0NCj4gwqDCoMKgwqDC
oMKgwqDCoC8qIE1ha2Ugc3VyZSBLTUQgcmVqZWN0cyBub24temVybyBwYWRkaW5nL3Jlc2VydmVk
IGZpZWxkcyAqLw0KPiDCoMKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUo
Y3JlYXRlLnBhZCk7IGkrKykgew0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNy
ZWF0ZS5wYWRbaV0gPSAtMTsNCg0K
