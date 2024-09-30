Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C981CCE8343
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 13:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB6510E0CD;
	Mon, 30 Sep 2024 13:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQ8DM49K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E1810E0CD
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 13:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727703851; x=1759239851;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oSgSFPUI7THm4Kv5g6tuFnTFGCG1g5A3SasL1rywQfA=;
 b=aQ8DM49Kb7yWJi738n2FHdvSq41PFBu/kFLXRRZQzl/sGqaEIXIYpUD1
 R9ca2cgsZH/p/1BqpC+fi8WdbUGYh6SgSWal0AkWzuy+ZNSq+v0MqMQGm
 /fcaRnOcJ074qgX+JDU5eLfLbSefpJ2kBVkIyvobMz+kkli2ZtcrgBZ1F
 5lbgAZFlDI3y160EHdfTaGI4rYNm3DMKv18Q07vOmMhUOGTUvTK9cQKPR
 DQ/Ch+MkONTCLexnhnMmmKIjhD6t1LRkf+HyZOirLJNOXAuukmA7arMto
 /ROYZt1wAGhq5reSL2LsdHjXgc/64YiIQ3I/mGB296RUxMDWm0vzNDAsw A==;
X-CSE-ConnectionGUID: yyGII8R5RLizxRKhXtSMyg==
X-CSE-MsgGUID: GCvY8CdhTw6abiBj+sACzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30675434"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="30675434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:44:10 -0700
X-CSE-ConnectionGUID: cD9dVKNyTd+MJgNb7Zo4NQ==
X-CSE-MsgGUID: a3aeeNjrSlKnMFAoexx87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="77685735"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 06:44:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 06:44:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 06:44:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 06:44:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 06:44:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffc8f3CVf1wcy/cDJJF1kF4VMYbk1bo8UrNEjj/N0nrZ8BXwbTMIry0jBKmktmYtAFcPaxfovyh2XODbZtQ1wZGJAn9Cyemp/WkpDNTowGJT67DmCY0Z4XPyG8lHHRxyflS2+OfAh82Wk2Myl8WKtsLKVV4Axc3/2t0Vdx2pJXsxi2ZXJ4SH1GdQ7L6aPYH6OrGs4Z4HGF1HoLpxVeisHBzqccrDrvCbcpZhMd/S+OSwJL6wjYsC4t53sOeyq68rXP0xmbXPQXIF+/QE9xR+80DbZTG26OyCPzxxC/Uy3pBauObQYhE6kb5SbcCkjuIhDOyvvZJsODb6kgXq9TNNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSgSFPUI7THm4Kv5g6tuFnTFGCG1g5A3SasL1rywQfA=;
 b=W9v5ltr8Vj2jTz5x+quH47PDucVq/ryOQZ3ZYyPShP8AAuTRBcL7UG/718Rg23aVZcEDd5hVMVTZ3+1+6/ijNLr7v4xTCdCcbeo3LauEx71R0fC39PDZOMzFV8Ysuji1VCHuTUxq/Kg8/cW1iXEyeAqRKW17mPXxJjMaRYzfH99EOHpLFcp7toK+zD++83pQ0bY25TvXv3t/NmcwzoPuz3YdOZZK+bp/Q9olCbde/E9xG51oKPQfQK2bMii8qIEOqKwIr9VkXpCsoLApPXe3fVJE0dbUSi8Cdm89/zzcjP6Ko8tA2MCQipnjPr34X+Pl3hON5JIZ/2KbME5E1W7NzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by CY8PR11MB7845.namprd11.prod.outlook.com (2603:10b6:930:72::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 13:44:06 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38%4]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 13:44:06 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
Thread-Topic: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
Thread-Index: AQHbEy3Y6jn1XBm5M0mPnleX1xtkIbJwTG6AgAAJhMA=
Date: Mon, 30 Sep 2024 13:44:06 +0000
Message-ID: <BL3PR11MB5747133F3C2D177B44FEE5A1D0762@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20240930115038.2045395-1-sai.gowtham.ch@intel.com>
 <a161ca23-9aa8-417d-8d1d-cf8f22b67624@linux.intel.com>
In-Reply-To: <a161ca23-9aa8-417d-8d1d-cf8f22b67624@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|CY8PR11MB7845:EE_
x-ms-office365-filtering-correlation-id: ff8312fc-d11c-49b1-799b-08dce155f429
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V2FGaGQ3U0l4Z0QzRTFPbnBIaWZlRW16WHNwZlljSDVIWlYzNW41VXE4V1l6?=
 =?utf-8?B?NGZiY1V2YmdmWi9KdlhlbDRvT25QU1lvZHVjdEZBSlRBTFJnb1M3WEhZeHRS?=
 =?utf-8?B?ZyswK3VQRE5kbitLWjRVSHZIeXNvRFlQVjZnVDUrcWxod1BnYjZsNDliaWdN?=
 =?utf-8?B?YW5wcHlDZzcyL3VTbzE1ZmVyY010c3ZIeXZncmt6UUR4ZjZ6RzB4TVFuQjdr?=
 =?utf-8?B?N2pkNHdzSmo3VlRpZ1JKbzlmeTR6RU14K0Y3Q0RmQWJNUEw5cnZRbmcyUHJJ?=
 =?utf-8?B?QkRZclcrYjRDK0pJQ1JDMlZyWW1MUE9tMjRTQk1Mc3NJTmVFLytkd0ZRUGxY?=
 =?utf-8?B?OEhrUFpxd2xsOGtoY1pYcGFlUVhSeXdmTDNXSU1ZVllLZXI0Q00rWSsyamN3?=
 =?utf-8?B?RUREUFBiVXRvaWJpYUlqeVFkdm5GZmgrTnlvTXR4SWJQd1N6d28ydWNDZFZr?=
 =?utf-8?B?VVV6anRQV3BRN0pYNUR3MkFjNm1tcDlJSGN4Q3h3endoRitud1U3OUlBSXo1?=
 =?utf-8?B?LzI5bVVsUlN5K2k0V3htd2tqU2ZPcHNSelpreWdhOTZIcjEwTzVUM2NhbFRt?=
 =?utf-8?B?NHBvR2JWQkN3TVY3L2t1L2tYdHVtakk4Y2c3bWkxT0MxUEMrRGQxNnc2MHYv?=
 =?utf-8?B?MXJ6L3pkNHlxeDYvbHF2c1VEMHF3QldmQk1hc3F6M1Z0djZQcUEvUGFXQmov?=
 =?utf-8?B?RW45WWdONnBwT0xhNXBBZVdKN0sxOW55b2x2R2lZYkNsODhCT2xMMUREbU84?=
 =?utf-8?B?TWxaSW1hakpkNEhsT1Z3MU4rYXNTSHdBYS92akt4SnJySWJQS09uT0FkWUw2?=
 =?utf-8?B?T2pIZ2hXY3BzajROdHNIVGFudW1WamwvWjBlcy9TbEhyWjB5VFFqMnlJNXVm?=
 =?utf-8?B?aDdHVE5oNUVrbDZoaEhCd1pCK1pERHB6SklBb09xeDVWUUhyMXhGTEtnUXR3?=
 =?utf-8?B?ejRmdGYyeHpVNGdTU1MrRmY1QlRKbjJGZlhaejJkUEF2MlFieDRtNHVkTFRU?=
 =?utf-8?B?c2NSMGpveFZZTkFpOW5HdnFXam9xTmxpeHJYdnlJMlJsd0pFcmcyMUJqZ0Q4?=
 =?utf-8?B?QmR6WnVHWUtpcVFtcVV1Z3BaWUZ2cGI1SmU2TXNNTytWYjNGNVJWMzF2dlJs?=
 =?utf-8?B?R3h1YlVFSHFhRkFGM0JwSUp6Ri93Z0ZHZDNrZ3lGdkcwSEhzNzlHMWVDRHdk?=
 =?utf-8?B?MDAwR25YeEIyMkMyVTRDVjNCUHBRd3lvbGEzV2RzcGRzRzhaM3VldWcxSmc0?=
 =?utf-8?B?VGZSaXNYZ0Mzdk1CYkR5T3ZWQlUxVDY1UVFFaHFicFdEMmVRdG5TWDk3Wk9S?=
 =?utf-8?B?S1BtcVFOZnhLeGFFVnI0WUtPRFVCM0VPcjNIS0VNSTg3ZmpRS25wa1hZWnB3?=
 =?utf-8?B?R3U1emtwcDVKSUo0R1NNSWFUb3RST04yTWlwY1pkbU5yMnRxWlhXZ1JFRURt?=
 =?utf-8?B?aHNyY1d0RTJIY3FRcFlNWEN1Y2VaR0NFQjZkRFUzUDhMNEhEWDRjbXM1cld2?=
 =?utf-8?B?bjNIRkFmMEZzMnVBTXJ1RmlmRTZwRlNxdkFoY1VIYWprVmdtNWNNSTkyNUZv?=
 =?utf-8?B?cUpnaDhaWkpjRXE5aEJIRGUwNFJkKy8xV2V2Yy9sbHpxOUkxRFdnUXhEMWRp?=
 =?utf-8?B?SEpXdVFrOW43cU1GejNxRUNYVklSQm9XNFdsVGdOdERpd1Y2ME8vdDVscElZ?=
 =?utf-8?B?eGFxUm1DM050YytibnRLbktXeDBwREZvRXA4UkgvRXE0Y2Y5SVg0aVlpNGk4?=
 =?utf-8?B?Y3JtTDYvUGVZYjR3WnVIU3U0QzRudlF3TVpjQThhem9IMWZEb3VIZG5aVUNC?=
 =?utf-8?B?OTE4MXIxejR6c2JMRlEzdEozQTBDQUNIL3MzaWlqSTU1Nkx3Q2Z4TFpNZHd1?=
 =?utf-8?B?TDhJRkFyMHVjNzZmRE9lOGt1KytRNVhTUW5XbHRJM1NkMUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1pzU1Y5WVFCdmNobkpTK2x5eUNodkN4Nk55OUdQbGdIWjkrMSs0bGVPNFVC?=
 =?utf-8?B?TGhFUExTMEM3bkxXSzZ4Ylk5MVBNUnA5eWFqazJPY0NQQ1JxU1haUERCNnRx?=
 =?utf-8?B?M3pFMkRuVHZncXExUjFrZHgxRzZmV0wwenk4c3ZVZWlabjh3YzJPNHFIdHoz?=
 =?utf-8?B?Y3AvNk5nNnd1c0pVQkszckdxc3MrTFZVbldRb1lWQjlVZ3diRnVUajEzL2tF?=
 =?utf-8?B?ZSsxQk15aEdjbVlQbzhJTjI1MTZCb3h2aThaOWU2UW5xRFVlSUNwR2tjaWp5?=
 =?utf-8?B?SVVxU1oxQURoeDg0cXpvcmo4Rk0yOWorbldTMlFkMXFiTVBsNncyb1Vjc2ps?=
 =?utf-8?B?aWdhb1NsM28zWmVSNjE4b3NyOHppWUxBekhyNjdUWllGUHI5NlEvdUZ2S2lT?=
 =?utf-8?B?dmVCbXpZdzl4WDMwVCtmTkRUM0F6eFl2cW1Ock9pYVdodktPQnB0UTZ2V2pn?=
 =?utf-8?B?RFNkWEg5cmVyNElJeFhJVnFJOXRJY0o2NkZEUXl3ZTEvS1EvWmZCeHB1UEQ0?=
 =?utf-8?B?VWhRN0hsNDJuN3hzVm1EakV2M2psN0VZM0hhZXU3K21wd1QyZ3UxalRxM0Zk?=
 =?utf-8?B?N1hzTXRENkNaOTdEWndiVG5ZVWQzZlFBZ2xOclppdTBTY0drRUZGLy9KWVFD?=
 =?utf-8?B?UFpxM0d5RmNUZFZUaFd6VVZWajVCb2psSXNiRVBWMW5MYmFyMDVWV0o3U3Vs?=
 =?utf-8?B?akZHWWxXTzgza0YyU2QvSUZmWVJxL1l5V2pMYWVhYURQUDJZTlpyMGRpMnd6?=
 =?utf-8?B?QUdHaDc0RHVEZFRhaHlHcC9MMXVLajhDQ1Ayclk4YVFKVkpHd2tOSDZWcyt3?=
 =?utf-8?B?NVRPUnBVbW81RlM0dk1Fem1MRjlIMWUwOGFRc2dBTVV1bU1pdm5KczdsUGp0?=
 =?utf-8?B?UXkzTlV0WkwvSlJIMjhnc3BUQ2RXYU44dlVZdXJyL0JJb0lhNnlMNkVGWE1T?=
 =?utf-8?B?b3F1bkdVcE16bHJsWGNWYjdXdG5zdmZwaEJTdGx2REswNFpjNm9OZ2M3OUpY?=
 =?utf-8?B?NW0xbmdMcDJlZFQ1MWc0VnMxWnhEQjUreGVpMFlOdmllcnVYS1NDZ0xvYzNi?=
 =?utf-8?B?dnh2d1NidFZLdFBnSFVVODNJRm5OZUp4WkpTWW9Mb3BVNS90NUxNbmRaZm1J?=
 =?utf-8?B?bE12SitoZFNLRG9NR2V3WU1zTDFycmw0OTk2ZUNrV2ZXYjNUK0ltbmcxem9N?=
 =?utf-8?B?cmZmd3gwN3BHOHl1TjlNTys5MEs3YWZJamFpekpZV0RKMnZTY1NjeHd0bG9E?=
 =?utf-8?B?N2RpU1Zia05qNjFkWmhLVUFtTXBkeTJ2SmpGOTFubGRnU1BranJ1Ry9pTnBW?=
 =?utf-8?B?ZmpGVjl0OENNakx0SStVV21kK1J0YjZ0cFd6WGxKWkFURXR2WG9VVzJleita?=
 =?utf-8?B?M3I4bWJBcm96U2Z4NzAwQ3VjWUhLSUs1b1QxNjM3UlhKVmRobkF5UkNjYkZZ?=
 =?utf-8?B?R1Y2V2FvV1hQUFVWZDhxeURFOGlWdVk2VmhueEVYbnY1bWZmNDJuMXNPZE5M?=
 =?utf-8?B?bUZvL3RaT0ZrdHhIWHJCQWRZNEMzVjZUbFBUcUlxNTdnNUdMREgxaFNBSktM?=
 =?utf-8?B?dUdXdDJXTlFMUHo1UVU1VFlWVHJ1azBkSklVdkZYMndqKzdBbzdBT09xRlZO?=
 =?utf-8?B?c3VsSEJiSW1aZ3FnTGRUM3FQR3Yrck44RVUwelRMZHlaeUFUVGJmZ1ZpZjNO?=
 =?utf-8?B?Vm8xOHQxWlBXQk00SGNtMkFYdXYrQlZuTTFsMHFzR3NLOVlrQWdGNXN0Qkt0?=
 =?utf-8?B?VGdqMk5wY2hIRlEzRVNaZld4RWdVQ1NpUndtMWx1Z2tiMDYxTTcvL2tSUG1p?=
 =?utf-8?B?WGd4K0lnV2lpVjEwVS8yOW1RZHBBZkxmdzlHWTBPYTNDZmg2RGV4eEtyVng0?=
 =?utf-8?B?Q2JoUitnNjZGTFBucEp2SWdjZmpLa3pMV3ZPSDQ3bExKcWhaOGJQcEFBRWIr?=
 =?utf-8?B?L3Q5cHNFNi9YZjNWZkNoakYybGIzTjhMZWRJNUI2RHZlWGdvNDlkUnFrMElt?=
 =?utf-8?B?UEs2Ty9NU0Q3MlEybmttYVM5MHJMNmlSdERGd0xkcWRZVmwyMkxkNEY5eUVt?=
 =?utf-8?B?eVMzWDFWanY3TFhNMkZuQTI5Rlg2OGt3MHd6S25Xa0NxdmcrcklVU1k5VTFJ?=
 =?utf-8?Q?ipwMvdw7X/bi6yg5X1Cof9XJz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8312fc-d11c-49b1-799b-08dce155f429
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 13:44:06.4470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vUo7vpS+Gh0Na/Ki6W2TH+HXjCY178gwksX6YiAui5hbRxEkOHxNvQI3/nWRI3/wIGVug4ShGvonhRa12SrT/3S9PkeOEctBFna4CGBMrAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7845
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE5pcm1veSBEYXMgPG5pcm1v
eS5kYXNAbGludXguaW50ZWwuY29tPg0KPlNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDMwLCAyMDI0
IDY6MzUgUE0NCj5UbzogQ2gsIFNhaSBHb3d0aGFtIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+
OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj5EYW5kYW11ZGksIFByaXlhbmthIDxw
cml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPkNjOiBLYW1pbCBLb25pZWN6bnkgPGthbWls
LmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+U3ViamVjdDogUmU6IFtQQVRDSF0gdGVzdHMv
aW50ZWwveGVfdGxiOiBBZGQgdGVzdCB0byBjaGVjayBUTEIgaW52YWxpZGF0aW9uDQo+DQo+DQo+
T24gOS8zMC8yMDI0IDE6NTAgUE0sIHNhaS5nb3d0aGFtLmNoQGludGVsLmNvbSB3cm90ZToNCj4+
IEZyb206IFNhaSBHb3d0aGFtIENoIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+DQo+Pg0KPj4g
VGVzdCB2YWxpZGF0ZXMgVExCIGludmFsaWRhdGlvbiBieSBiaW5kaW5nIGRpZmZlcmVudCBidWZm
ZXIgb2JqZWN0cw0KPj4gd2l0aCB0aGUgc2FtZSB2bWEgYW5kIHN1Ym1pdHRpbmcgd29ya2xvYWQg
c2ltdWx0YW5lb3VzbHksIElkZWFsbHkNCj4+IGV4cGVjdGluZyBncHUgdG8gaGFuZGxlIHBhZ2Vz
IGJ5IGludmFsaWRhdGluZyBhbmQgYXZvZGluZyBwYWdlIGZhdWx0cy4NCj4+DQo+PiBDYzogTmly
bW95IERhcyA8bmlybW95LmRhc0BpbnRlbC5jb20+DQo+DQo+UmV2aWV3cyBmcm9tIHYxIGlzIHN0
aWxsIHN0YXlzL3BlbmRpbmcuDQo+DQpBcyBwZXIgeW91ciBwcmV2aW91cyBjb21tZW50IC0tPkkg
ZmVlbCBjaGVja2luZyB0bGIgaW52YWxpZGF0aW9uIGNvdW50cyBtb3JlIGdlbmVyaWMgdG8gdGhp
cyB0ZXN0LCBhbmQgd2UgY2FuIG1vdmUgdGhpcyANCnRvIGxpYiBhcyBhbiBlbmhhbmNlbWVudCBp
biB0aGUgZnV0dXJlIGlmIG5lZWRlZC4NCg0KTGV0IG1lIGtub3cgeW91ciBjb21tZW50cyBvbiBp
dCwgIGlmIHlvdSB0aGluayBvdGhlciB3aXNlLg0KDQo+TWFrZSBzdXJlIHRvIHVzZSB2ZXJzaW9u
aW5nKGdpdCBmb3JtYXQtcGF0Y2ggLXYgPHZlcnNpb25fbnVtPikgd2hpY2ggbWlzc2luZw0KPmhl
cmUuDQpTdXJlIHdpbGwgYmUgYWRkaW5nIGl0Lg0KDQpUaGFua3MsDQpHb3d0aGFtDQo+DQo+DQo+
PiBDYzogUHJpeWFua2EgRGFuZGFtdWRpIDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0K
Pj4gU2lnbmVkLW9mZi1ieTogU2FpIEdvd3RoYW0gQ2ggPHNhaS5nb3d0aGFtLmNoQGludGVsLmNv
bT4NCj4+IC0tLQ0KPj4gIHRlc3RzL2ludGVsL3hlX3RsYi5jIHwgMTYyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICB0ZXN0cy9tZXNvbi5idWlsZCAgICB8
ICAgMSArDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxNjMgaW5zZXJ0aW9ucygrKQ0KPj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCB0ZXN0cy9pbnRlbC94ZV90bGIuYw0KPj4NCj4+IGRpZmYgLS1naXQgYS90
ZXN0cy9pbnRlbC94ZV90bGIuYyBiL3Rlc3RzL2ludGVsL3hlX3RsYi5jIG5ldyBmaWxlIG1vZGUN
Cj4+IDEwMDY0NCBpbmRleCAwMDAwMDAwMDAuLjg4MDlkMDllYw0KPj4gLS0tIC9kZXYvbnVsbA0K
Pj4gKysrIGIvdGVzdHMvaW50ZWwveGVfdGxiLmMNCj4+IEBAIC0wLDAgKzEsMTYyIEBADQo+PiAr
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLw0KPj4gKy8qDQo+PiArKiBDb3B5cmln
aHQgwqkgMjAyNCBJbnRlbCBDb3Jwb3JhdGlvbg0KPj4gKyoNCj4+ICsqIEF1dGhvcnM6DQo+PiAr
KiAgICBTYWkgR293dGhhbSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPj4gKyovDQo+
PiArI2luY2x1ZGUgImlndC5oIg0KPj4gKyNpbmNsdWRlICJsaWIvaWd0X3N5bmNvYmouaCINCj4+
ICsjaW5jbHVkZSAieGUveGVfaW9jdGwuaCINCj4+ICsjaW5jbHVkZSAieGUveGVfcXVlcnkuaCIN
Cj4+ICsjaW5jbHVkZSAieGVfZHJtLmgiDQo+PiArI2luY2x1ZGUgImlndF9kZWJ1Z2ZzLmgiDQo+
PiArDQo+PiArLyoqDQo+PiArICogVEVTVDogQ2hlY2sgVHJhbnNsYXRpb24gTG9va2FzaWRlIEJ1
ZmZlciBJbnZhbGlkYXRpb24uDQo+PiArICogQ2F0ZWdvcnk6IFNvZnR3YXJlIGJ1aWxkaW5nIGJs
b2NrDQo+PiArICogTWVnYSBmZWF0dXJlOiBHZW5lcmFsIENvcmUgZmVhdHVyZXMNCj4+ICsgKiBT
dWItY2F0ZWdvcnk6IENNRCBzdWJtaXNzaW9uDQo+PiArICogRnVuY3Rpb25hbGl0eTogVExCIGlu
dmFsaWRhdGUNCj4+ICsgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4+ICsg
Ki8NCj4+ICtzdHJ1Y3QgZGF0YSB7DQo+PiArCXVpbnQzMl90IGJhdGNoWzE2XTsNCj4+ICsJdWlu
dDMyX3QgZGF0YTsNCj4+ICsJdWludDY0X3QgYWRkcjsNCj4+ICt9Ow0KPj4gKw0KPj4gK3N0YXRp
YyB2b2lkIHN0b3JlX2R3b3JkX2JhdGNoKHN0cnVjdCBkYXRhICpkYXRhLCB1aW50NjRfdCBhZGRy
LCBpbnQNCj4+ICt2YWx1ZSkgew0KPj4gKwlpbnQgYjsNCj4+ICsJdWludDY0X3QgYmF0Y2hfb2Zm
c2V0ID0gKGNoYXIgKikmKGRhdGEtPmJhdGNoKSAtIChjaGFyICopZGF0YTsNCj4+ICsJdWludDY0
X3QgYmF0Y2hfYWRkciA9IGFkZHIgKyBiYXRjaF9vZmZzZXQ7DQo+PiArCXVpbnQ2NF90IHNkaV9v
ZmZzZXQgPSAoY2hhciAqKSYoZGF0YS0+ZGF0YSkgLSAoY2hhciAqKWRhdGE7DQo+PiArCXVpbnQ2
NF90IHNkaV9hZGRyID0gYWRkciArIHNkaV9vZmZzZXQ7DQo+PiArDQo+PiArCWIgPSAwOw0KPj4g
KwlkYXRhLT5iYXRjaFtiKytdID0gTUlfU1RPUkVfRFdPUkRfSU1NX0dFTjQ7DQo+PiArCWRhdGEt
PmJhdGNoW2IrK10gPSBzZGlfYWRkcjsNCj4+ICsJZGF0YS0+YmF0Y2hbYisrXSA9IHNkaV9hZGRy
ID4+IDMyOw0KPj4gKwlkYXRhLT5iYXRjaFtiKytdID0gdmFsdWU7DQo+PiArCWRhdGEtPmJhdGNo
W2IrK10gPSBNSV9CQVRDSF9CVUZGRVJfRU5EOw0KPj4gKwlpZ3RfYXNzZXJ0KGIgPD0gQVJSQVlf
U0laRShkYXRhLT5iYXRjaCkpOw0KPj4gKw0KPj4gKwlkYXRhLT5hZGRyID0gYmF0Y2hfYWRkcjsN
Cj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGludCB0bGJfY291bnQoaW50IGZkLCBpbnQgZ3QpDQo+
PiArew0KPj4gKwljaGFyIHRsYl9wYXRoWzQwOTZdOw0KPj4gKwljaGFyIHBhdGhbMjU2XTsNCj4+
ICsJaW50IGNvdW50Ow0KPj4gKw0KPj4gKwlzcHJpbnRmKHBhdGgsICIvc3lzL2tlcm5lbC9kZWJ1
Zy9kcmkvMC9ndCVkL3N0YXRzIiwgZ3QpOw0KPj4gKwlpZ3RfZGVidWdmc19kdW1wKGZkLCBwYXRo
KTsNCj4+ICsJaWd0X2RlYnVnZnNfcmVhZChmZCwgcGF0aCwgdGxiX3BhdGgpOw0KPj4gKw0KPj4g
Kwlzc2NhbmYodGxiX3BhdGgsICIlKlteOl06ICVkIiwgJmNvdW50KTsNCj4+ICsJaWd0X2luZm8o
IiVzXG4iLCB0bGJfcGF0aCk7DQo+PiArDQo+PiArCXJldHVybiBjb3VudDsNCj4+ICt9DQo+PiAr
DQo+PiArLyoqDQo+PiArICogU1VCVEVTVDogYmFzaWMtdGxiDQo+PiArICogRGVzY3JpcHRpb246
IENoZWNrIFRyYW5zbGF0aW9uIExvb2thc2lkZSBCdWZmZXIgSW52YWxpZGF0aW9uLg0KPj4gKyAq
Lw0KPj4gK3N0YXRpYyB2b2lkIHRsYl9pbnZhbGlkYXRpb24oaW50IGZkLCBzdHJ1Y3QNCj4+ICtk
cm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2kpIHsNCj4+ICsJc3RydWN0IGRybV94ZV9z
eW5jIHN5bmNbMl0gPSB7DQo+PiArCQl7IC50eXBlID0gRFJNX1hFX1NZTkNfVFlQRV9TWU5DT0JK
LCAuZmxhZ3MgPQ0KPkRSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMLCB9LA0KPj4gKwkJeyAudHlwZSA9
IERSTV9YRV9TWU5DX1RZUEVfU1lOQ09CSiwgLmZsYWdzID0NCj5EUk1fWEVfU1lOQ19GTEFHX1NJ
R05BTCwgfQ0KPj4gKwl9Ow0KPj4gKwlzdHJ1Y3QgZHJtX3hlX2V4ZWMgZXhlYyA9IHsNCj4+ICsJ
CS5udW1fYmF0Y2hfYnVmZmVyID0gMSwNCj4+ICsJCS5udW1fc3luY3MgPSAyLA0KPj4gKwkJLnN5
bmNzID0gdG9fdXNlcl9wb2ludGVyKCZzeW5jKSwNCj4+ICsJfTsNCj4+ICsJc3RydWN0IGRhdGEg
KmRhdGExOw0KPj4gKwlzdHJ1Y3QgZGF0YSAqZGF0YTI7DQo+PiArCXVpbnQzMl90IHZtOw0KPj4g
Kwl1aW50MzJfdCBleGVjX3F1ZXVlOw0KPj4gKwl1aW50MzJfdCBiaW5kX2VuZ2luZTsNCj4+ICsJ
dWludDMyX3Qgc3luY29iajsNCj4+ICsJc2l6ZV90IGJvX3NpemU7DQo+PiArCWludCB2YWx1ZTEg
PSAweDEyMzQ1NjsNCj4+ICsJaW50IHZhbHVlMiA9IDB4MTIzNDY1Ow0KPj4gKwl1aW50NjRfdCBh
ZGRyID0gMHgxMDAwMDA7DQo+PiArCXVpbnQzMl90IGJvMSwgYm8yOw0KPj4gKwlpbnQgdGxiX3By
ZSwgdGxiX3BvczsNCj4+ICsNCj4+ICsJc3luY29iaiA9IHN5bmNvYmpfY3JlYXRlKGZkLCAwKTsN
Cj4+ICsJc3luY1swXS5oYW5kbGUgPSBzeW5jb2JqX2NyZWF0ZShmZCwgMCk7DQo+PiArCXN5bmNb
MV0uaGFuZGxlID0gc3luY29iajsNCj4+ICsNCj4+ICsJdm0gPSB4ZV92bV9jcmVhdGUoZmQsIDAs
IDApOw0KPj4gKwlib19zaXplID0gc2l6ZW9mKCpkYXRhMSk7DQo+PiArCWJvX3NpemUgPSB4ZV9i
Yl9zaXplKGZkLCBib19zaXplKTsNCj4+ICsJYm8xID0geGVfYm9fY3JlYXRlKGZkLCB2bSwgYm9f
c2l6ZSwNCj4+ICsJCQkJICAgdnJhbV9pZl9wb3NzaWJsZShmZCwgZWNpLT5ndF9pZCksDQo+PiAr
DQo+RFJNX1hFX0dFTV9DUkVBVEVfRkxBR19ORUVEU19WSVNJQkxFX1ZSQU0pOw0KPj4gKwlibzIg
PSB4ZV9ib19jcmVhdGUoZmQsIHZtLCBib19zaXplLA0KPj4gKwkJCQkgICB2cmFtX2lmX3Bvc3Np
YmxlKGZkLCBlY2ktPmd0X2lkKSwNCj4+ICsNCj5EUk1fWEVfR0VNX0NSRUFURV9GTEFHX05FRURT
X1ZJU0lCTEVfVlJBTSk7DQo+PiArDQo+PiArCXRsYl9wcmUgPSB0bGJfY291bnQoZmQsIGVjaS0+
Z3RfaWQpOw0KPj4gKwlleGVjX3F1ZXVlID0geGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCBl
Y2ksIDApOw0KPj4gKwliaW5kX2VuZ2luZSA9IHhlX2JpbmRfZXhlY19xdWV1ZV9jcmVhdGUoZmQs
IHZtLCAwKTsNCj4+ICsJeGVfdm1fYmluZF9hc3luYyhmZCwgdm0sIGJpbmRfZW5naW5lLCBibzEs
IDAsIGFkZHIsIGJvX3NpemUsIHN5bmMsIDEpOw0KPj4gKwlkYXRhMSA9IHhlX2JvX21hcChmZCwg
Ym8xLCBib19zaXplKTsNCj4+ICsNCj4+ICsJc3RvcmVfZHdvcmRfYmF0Y2goZGF0YTEsIGFkZHIs
IHZhbHVlMSk7DQo+PiArCWV4ZWMuZXhlY19xdWV1ZV9pZCA9IGV4ZWNfcXVldWU7DQo+PiArCWV4
ZWMuYWRkcmVzcyA9IGRhdGExLT5hZGRyOw0KPj4gKwlzeW5jWzBdLmZsYWdzICY9IH5EUk1fWEVf
U1lOQ19GTEFHX1NJR05BTDsNCj4+ICsJc3luY1sxXS5mbGFncyB8PSBEUk1fWEVfU1lOQ19GTEFH
X1NJR05BTDsNCj4+ICsJeGVfZXhlYyhmZCwgJmV4ZWMpOw0KPj4gKwlpZ3RfYXNzZXJ0KHN5bmNv
Ympfd2FpdChmZCwgJnN5bmNvYmosIDEsIElOVDY0X01BWCwgMCwgTlVMTCkpOw0KPj4gKwl4ZV92
bV9iaW5kX2FzeW5jKGZkLCB2bSwgYmluZF9lbmdpbmUsIGJvMiwgMCwgYWRkciwgYm9fc2l6ZSwg
c3luYywgMSk7DQo+PiArCWRhdGEyID0geGVfYm9fbWFwKGZkLCBibzIsIGJvX3NpemUpOw0KPj4g
Kw0KPj4gKwlzdG9yZV9kd29yZF9iYXRjaChkYXRhMiwgYWRkciwgdmFsdWUyKTsNCj4+ICsJZXhl
Yy5leGVjX3F1ZXVlX2lkID0gZXhlY19xdWV1ZTsNCj4+ICsJZXhlYy5hZGRyZXNzID0gZGF0YTIt
PmFkZHI7DQo+PiArCXN5bmNbMF0uZmxhZ3MgJj0gfkRSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMOw0K
Pj4gKwlzeW5jWzFdLmZsYWdzIHw9IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMOw0KPj4gKwl4ZV9l
eGVjKGZkLCAmZXhlYyk7DQo+PiArCWlndF9hc3NlcnQoc3luY29ial93YWl0KGZkLCAmc3luY29i
aiwgMSwgSU5UNjRfTUFYLCAwLCBOVUxMKSk7DQo+PiArDQo+PiArCXRsYl9wb3MgPSB0bGJfY291
bnQoZmQsIGVjaS0+Z3RfaWQpOw0KPj4gKwlpZ3RfYXNzZXJ0X2VxKGRhdGExLT5kYXRhLCB2YWx1
ZTEpOw0KPj4gKwlpZ3RfYXNzZXJ0X2VxKGRhdGEyLT5kYXRhLCB2YWx1ZTIpOw0KPj4gKwlpZ3Rf
YXNzZXJ0KHRsYl9wb3MgPiB0bGJfcHJlKTsNCj4+ICsNCj4+ICsJc3luY29ial9kZXN0cm95KGZk
LCBzeW5jWzBdLmhhbmRsZSk7DQo+PiArCXN5bmNvYmpfZGVzdHJveShmZCwgc3luY29iaik7DQo+
PiArCW11bm1hcChkYXRhMSwgYm9fc2l6ZSk7DQo+PiArCW11bm1hcChkYXRhMiwgYm9fc2l6ZSk7
DQo+PiArCWdlbV9jbG9zZShmZCwgYm8xKTsNCj4+ICsJZ2VtX2Nsb3NlKGZkLCBibzIpOw0KPj4g
Kwl4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWUpOw0KPj4gKwl4ZV92bV9kZXN0
cm95KGZkLCB2bSk7DQo+PiArfQ0KPj4gKw0KPj4gK2lndF9tYWluDQo+PiArew0KPj4gKwlpbnQg
ZmQ7DQo+PiArCXN0cnVjdCBkcm1feGVfZW5naW5lICplbmdpbmU7DQo+PiArDQo+PiArCWlndF9m
aXh0dXJlIHsNCj4+ICsJCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+PiArCX0N
Cj4+ICsNCj4+ICsJaWd0X3N1YnRlc3QoImJhc2ljLXRsYiIpIHsNCj4+ICsJCWVuZ2luZSA9IHhl
X2VuZ2luZShmZCwgMCk7DQo+PiArCQl0bGJfaW52YWxpZGF0aW9uKGZkLCAmZW5naW5lLT5pbnN0
YW5jZSk7DQo+PiArCX0NCj4+ICsNCj4+ICsJaWd0X2ZpeHR1cmUgew0KPj4gKwkJZHJtX2Nsb3Nl
X2RyaXZlcihmZCk7DQo+PiArCX0NCj4+ICt9DQo+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvbWVzb24u
YnVpbGQgYi90ZXN0cy9tZXNvbi5idWlsZCBpbmRleA0KPj4gNjJiZGUzNTNiLi44NDRkZTQ5ZDEg
MTAwNjQ0DQo+PiAtLS0gYS90ZXN0cy9tZXNvbi5idWlsZA0KPj4gKysrIGIvdGVzdHMvbWVzb24u
YnVpbGQNCj4+IEBAIC0zMTcsNiArMzE3LDcgQEAgaW50ZWxfeGVfcHJvZ3MgPSBbDQo+PiAgCSd4
ZV9zeXNmc19wcmVlbXB0X3RpbWVvdXQnLA0KPj4gIAkneGVfc3lzZnNfc2NoZWR1bGVyJywNCj4+
ICAgICAgICAgICd4ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRpb24nLA0KPj4gKyAgICAgICAgJ3hl
X3RsYicsDQo+PiAgXQ0KPj4NCj4+ICBpbnRlbF94ZV9ldWRlYnVnX3Byb2dzID0gWw0K
