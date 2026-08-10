Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0A0C5AD4E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 06:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8FE10E156;
	Mon, 10 Aug 2026 06:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DI3eVaFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CC710E156
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 06:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786342219; x=1817878219;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=flepscRRevpwQiYUJQLDUX9706LJXcq/8tMkVv04mxQ=;
 b=DI3eVaFYbvvdMsL05KVC8AQIASKuElcDr9O+4Lb/D+nfHnWT0JCpcOHV
 /54E7wIXiZWJPls9mrLT1GNpS/bDedBFSCqn0DeEmDQMQjVVufSGGJMaN
 R2kUHAyrNdn/cAaGfAvYdfKNCZVbwDKf1mPnTKVT8XN3R1sGVOQzQZsrY
 7eSUJTOmB2ssm1k5xWesegOomWsmsKucY6Ih9nkU50PdWsIjl5kGqer26
 fEPUeVE4CRdJseOHoxsRk24xkbhcC0xyTiXdEnwK027jwtG9YYwMZEHsZ
 0ZMlL4nwiA6h/eWQmJTZXAXA04e7vsitUvzE10/NLwyIyQDnenhzYzdo+ w==;
X-CSE-ConnectionGUID: C0kjFgJMTI2OYlmiQdvuag==
X-CSE-MsgGUID: bmbVafzYTX2W1Ff6Cy5jjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97502372"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="97502372"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 23:09:37 -0700
X-CSE-ConnectionGUID: XhAjJSdVRhKkRV8IE+N9QA==
X-CSE-MsgGUID: 3v0HB/RTQbO8eJmYYkFiHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="259625369"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 23:09:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 9 Aug 2026 23:09:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 9 Aug 2026 23:09:36 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 9 Aug 2026 23:09:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnKIasvncb3xgicj96YLj8wvVNveayhRMxK/DKkWm0/FQL0M46NGF2p+vWz2d+XewHSK7C/WV26/Pi+49QfiDkMJQkiyCz3GXXoy161MYK8a9Nz8tyiNvcZmcSWL3P0AexuG18C4zQXB+eIHOIqgkqFg874kE0fTA2wdWQqhLlkTdzccGs6g33kdhwDZIBuwHMgl0bC5r92GgrKu1F/V2njlICqWKKJXQb9AnobHadgDY120wUyVeudyhkHh2y0sPyNiT5tYaxshDDhWIhFfjUn616eACckenplc3Huy3tNWX3nTpYbBpsKS9yq+Tlk0JIlftHf71ILFALSpgGqCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flepscRRevpwQiYUJQLDUX9706LJXcq/8tMkVv04mxQ=;
 b=TMzUJWBbOWhRfJBu2hLSK9wQPA5Lzqy5VC9WJ+fu2yRNvkPcFPFiSRHCGnnJqY4Dcl5QEhcKcpb1cLWU55YBYc9qBsP6//37ERZ6JV4eASPsLjL+JL9qDoUkGSQbrqW3Z9hLx5WFMjdvMPP+RBhY1UINCDp44hyH2mr1FzEOzsECW5LRCrZKbahipQ1PFeH9fM5GHRKpBWrbJa2la67Ug3g1pN4oNdSqAJ8ZlqDRacJq7uR/ODtOGPvPoXwhDY8MMwLZI7lhIZyZPbREma7unKjAxZkzdMVsVt5f6Aw1RGmCO0cA3hOZUILN/bX3LSnkZdiJws0Bnsei6i6dqETAhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:09:29 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 06:09:28 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Reddy
 Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v1] lib/intel_fbc: Use display version for FBC max
 plane size
Thread-Topic: [PATCH i-g-t v1] lib/intel_fbc: Use display version for FBC max
 plane size
Thread-Index: AQHdJIYnigPvZNe1S0impvCROoMc+raW1IyA
Date: Mon, 10 Aug 2026 06:09:28 +0000
Message-ID: <d6415f245313ab1e62d38c75a2d34402fc13e146.camel@intel.com>
References: <20260805025453.212016-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260805025453.212016-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|PH7PR11MB6748:EE_
x-ms-office365-filtering-correlation-id: d83ce1c7-ba18-4e9f-9f0e-08def6a5efe8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|10070799003|366016|18002099003|22082099003|11063799006|56012099006|3023799007|10067099003|38070700021;
x-microsoft-antispam-message-info: WESdLpuRdl/6w4MhWQ7nn7B+xtRTtKQQ4anJwpkY4ReDV8N+QhSVe/AAANJI/CtvpfJFBpA2rJwhD+xr3LCtTCU9/iunSDIqoZK6gciLUbR7NS4wsWFBXeR/uoHNc4aKTkmSqJk9YtMe1UAd7flJhsP/w0CLvTHr3eXRSYkciEh63LzaJP1U0L6pgHWEKoYnETWgqwl1TVL+vqMnb84IEi+3/XGzAH+XR7xDOU2nEPTaFEIq7Uii20iW/B0EcPHcNjO6yW45t36Uk/+FOM60TKzM53NlWdWm8nvD2ubqsPs+fK5BQCoKCp8i7CUi0mdnZeuWVhlqLvqq/N2pwr90uij0lFOmCac/0LafZNnIoN6CdD6WpTPnwW1NNt+eVadDwCvGm/PQWEn8oN4b6bixczsyLirrtJfnUxr37pu+EjsbtkT71fxB/6q7MFjb1E9URuHuGG3rKV6crDVpofcNsA2qZKpCGXfEaB/oqT576SRsEHasGvdPSDpUuI+Mo8EH4sUQBkZ5dyiaWbqrGVmf9o1ycI9OvME+5k/bT3njEfwiLBQtrcBFqnEVHGq7mvnY02+3fU/pLLsZnRIcIYkcugKyRay/yjYBAi1mWTA59aplD+V6v/JNEZuy94Of+H3tHD2ayILB40wZutTs5NocREys2kR9Z2Vq2biA/PDBx2/VqIO/1W/0Q6HPyvRqddpnKQS1ixs1apByva6Q1J/Hgll3ZUkdHUu0y3qD01jd0CI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(10070799003)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007)(10067099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWcvb3d0MHBpUTJEUkEvZmJtcXVaOWNpa3ZNcE1vZENheXFJM2dsSjZxdkZP?=
 =?utf-8?B?OXZFOEM0TTEyeFVnZ0ZOeTBSUlBIYnMrZC9UeEE2elJ3TXdELzRqSmlvWWJ4?=
 =?utf-8?B?U0Y5YmZIWHVwZWxtYUE4d2YzcFVzaVc2YVZBYmdjT1pnVTlCb28yQmo4TkVR?=
 =?utf-8?B?VlN4ZFRrb3JKU2krY250OS9DMkZsaG5WcTI0ZGUzWWR1c1RrZGhKNzdod0hL?=
 =?utf-8?B?aVBWc1lJNFNBNDJ5RzdlN3JyRUdFbVRLSkxOT2hwWEo3L2w5eU9aUkxZUk03?=
 =?utf-8?B?N3BpRGFRL29nc3JJemNGK0h4aWVnaEVuNEs1VGFCMWlkelorSUJvS0NZWFZC?=
 =?utf-8?B?WXZmYk1DTlluemNNdlQ5SkVuaU5Mb3RGV3hzVDViMmhMbjdWcDMxYjZiMEtB?=
 =?utf-8?B?ZUpTTjMxMWNqVE9TQk1wdFpEMlF3UFUxeStzL0tlbXZzZ2tvQnl5T3pZTVFR?=
 =?utf-8?B?QWY2ME1naGRkTFo4aDNXRDBwNHVVQ0xUNy9SV2tMME0rTEU3WHg3ZGphS0NU?=
 =?utf-8?B?dTBiRys4R0FCclQxMTQzckdreEZoeFVhSFZ1eFByeE9KQkluZjBnWFNNQytJ?=
 =?utf-8?B?WVJjRzN2TDFxNEhTTUNPMDJwN0VrODlEeGgvSk5UQjNPMko4Z25SRlp4cVNP?=
 =?utf-8?B?SzhUa1RveUxuVmtCMXp0d29nYTJNU1BDc3M0Rm1STzFQYTBHNU56bndNRzV2?=
 =?utf-8?B?VktXY1VSRGc2STNpV3UvT1BVekZtcUhua21yeDY4QjRKZGRRaVAvbmVhMVQv?=
 =?utf-8?B?TUYwY1BUdy9pTUhPaktWMlVvVlhKZUpaWlo3RU1BRmt6ejdvc0lUK3NKQ3Rz?=
 =?utf-8?B?eWxoNEdYMnczakJ0dHp1bVdBMjIvdWVsei9XV1BzS3J3REE0Mi8ybFhUMk9Z?=
 =?utf-8?B?OWJPS0hyblIzc1I5SVNrSFZ2VkFMWlJBaWdmNVVMK2hYS01NSEp0SlVMcUdO?=
 =?utf-8?B?VkwzQTIyZERBN3prRXBRZnA2VEdtZ0dkOStqKzRkOFUzM1ErR1JkS0NJdHFY?=
 =?utf-8?B?UlFmenZzSmRDSElCbUtkMVFzQW9VTklFNVdXSTNFZEEwbjdWVU5nQm9XYXdF?=
 =?utf-8?B?MEd3aWExZXRSS0g4QnJIdXFISyt2UTR2SVVlT01Nc3E1VVN1VXRoU0lwOGZw?=
 =?utf-8?B?SThsdHlqSUN2M0h1aUtXTFpaZkg4UmpYWDB6TlplUWxvcFNoV1pBR2dYdWRM?=
 =?utf-8?B?OE5jVWxYc3diZjU5d0VhSDF3V0xnTGdUa1JIT1FFZkRDT3ROWmpXUzQ2SC9P?=
 =?utf-8?B?NU9xNnRkNm1kWEVxTXY3cjRSU3hBejZwcWl6OEJaeWdPZUZCSWUzdm5NWm5K?=
 =?utf-8?B?bXhCUTNSemlyc0tlTGZTKytodldybVJueUtPMm5GblpuSXU5VnBwelRCSDZl?=
 =?utf-8?B?aDUwUHBFd1l6Y0EwOWIzeUw3MisvbS82OWxDK0JyNmpqV2orOGFxaHRhN3No?=
 =?utf-8?B?QWNqYmpIVXhiV0J1Mk12ZHcrWE1rZzFBdko5TnhEYWt4anhaMDF0SjQwTm1Y?=
 =?utf-8?B?dFp4MGZqbWFnbVBSMWJBZkZjSUJtYTdreG5FZlhtMkpqZklrWWQ5R2xiUFUz?=
 =?utf-8?B?OE1JL09sUkxxZ2lxaXdzQUlxOWNZYndOLzdzYU5FL3ptUXB5WDFMblN3aXRj?=
 =?utf-8?B?Mng5MWYwc2M4aktlVXFFVGtCQlhBcjNsdEhvbG5yazU3dFRFajNZUjZ3YzlG?=
 =?utf-8?B?YXZpYm92enFEd0graTJtVGRndkMzTzlvZS9jeHRWcGVKV2VjZzkybytKYUc5?=
 =?utf-8?B?dmlyWG1nL3NqdElQb0UzR2VpMkZiMlMyL05Kd3N4WTJpR0VRbElEV0FmUERy?=
 =?utf-8?B?WTg2REpMSExUVE43aWJ5V1VPYXowWWlpUlRLOGtySTg1ZHpVTGV3MlRIU25U?=
 =?utf-8?B?TzNXMTJOcHgvbEJUeDVIY1ZGWGdKdFhNbEh0YkVkK3J0M2M4N1dTaWtjQjYv?=
 =?utf-8?B?cHI3MzVZTHpacXEzVjYycExJYmF4TGpmVTIvMG1sRzM4K1Y4M1M0VGw0ZVJJ?=
 =?utf-8?B?c2Y2QVZORVZNMUFyZFVxclBqOGF1VTdnQ1d2N2lHdGxWRW52cEdialM0Z0tu?=
 =?utf-8?B?UTJCbTRQUldHRFU5dllmemI5bDZ3eGxySG0xTS9KZHhUMnlURitqQk5QcU1Y?=
 =?utf-8?B?cmloK3BJOU9wWnc1RjJaemJUc1A1VEtPd3djY0pXRVRWQ3JpSkMvcDR1OVZK?=
 =?utf-8?B?aVRVeUF5eU8zNnU2eXJydXlHY2NOcm1aT0pQckQ3MFBlNHhkU2grdGN0aUpo?=
 =?utf-8?B?Q3dEbjkwUGdaVzR3MzA0cmxWTEV5KzJmRDN1aUMyL3loWHBwYlVoNEwxdHMx?=
 =?utf-8?B?V29LNytZV1g5N2dNM1hYYVBxaXNBT0RHeWpmeWg2TkdSK0NGSVB1K05vTmVq?=
 =?utf-8?Q?51ShmJKrgu/1rrJCw6V9R4WGasX+x2DxfjInwtbES/0wv?=
x-ms-exchange-antispam-messagedata-1: iiDb952eyi/OF/YssNcPYGoGWM16G/WJoZc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <52BCEAEFAE00474391B71DCF2A2FB8E8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nbtLOhfSJwhwflQ26u+LV0oXCSB0OSfjC8wjQz2yXWxSD8CjVeRMabvnBH5KgRf2JYDQO0sV/2fGAutisYJq8NAm1eTLXFUvAMNQ8vCTyBHM85/30N2/7YsOJHEJsBncUnOj8JURfSTG2rffZik4AeOvSe1DfWcQD0GxP13RIA7jTaUHbc3MjyjXxaPu7QW5lHLyZOu6FNq0w30zC6oPcz0ShRllLtI2Z4qdfMUb+mTKC8dU3F6XmXWvqxn7EHF7ZgJM9fKA6v92UL35t7FHm3wNaudMD+uUojVaulVt6bj8VUoxqQXMfretFU11jJdYdTotgEWnftWQtCuYOlNGSg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83ce1c7-ba18-4e9f-9f0e-08def6a5efe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 06:09:28.7939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m0zEqDt54qm/F366lw+afhXZwAOgY7jTWisqwBBEfso7Pfrr4xqa8LeZ0orJqio5PGghnNeX0SEl9ImkXZQ/QkuG0DxvBfjRvpGTCIvxZ3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
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

T24gV2VkLCAyMDI2LTA4LTA1IGF0IDA4OjI0ICswNTMwLCBTYW50aG9zaCBSZWRkeSBHdWRkYXRp
IHdyb3RlOg0KPiBGQkMgcGxhbmUgc2l6ZSByZXN0cmljdGlvbnMgYXJlIGEgZGlzcGxheSBmZWF0
dXJlLCBzbyB1c2UNCj4gaW50ZWxfZGlzcGxheV92ZXIoKSBpbnN0ZWFkIG9mIGdyYXBoaWNzX3Zl
ci4gVGhpcyBmaXhlcyBpbmNvcnJlY3QNCj4gc2l6ZSBsaW1pdHMgb24gcGxhdGZvcm1zIHdoZXJl
IGRpc3BsYXkgYW5kIGdyYXBoaWNzIHZlcnNpb25zIGRpZmZlci4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFNhbnRob3NoIFJlZGR5IEd1ZGRhdGkNCj4gPHNhbnRob3NoLnJlZGR5Lmd1ZGRhdGlAaW50
ZWwuY29tPg0KPiAtLS0NCj4gwqBsaWIvaTkxNS9pbnRlbF9mYmMuYyB8IDMgKy0tDQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCg0KUmV2aWV3
ZWQtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29t
Pg0KDQo+IGRpZmYgLS1naXQgYS9saWIvaTkxNS9pbnRlbF9mYmMuYyBiL2xpYi9pOTE1L2ludGVs
X2ZiYy5jDQo+IGluZGV4IGFkNzhlZTJhMzEuLjEwNTJkZmNhZTUgMTAwNjQ0DQo+IC0tLSBhL2xp
Yi9pOTE1L2ludGVsX2ZiYy5jDQo+ICsrKyBiL2xpYi9pOTE1L2ludGVsX2ZiYy5jDQo+IEBAIC0y
MDEsOCArMjAxLDcgQEAgc3RhdGljIHZvaWQNCj4gaW50ZWxfZmJjX21heF9wbGFuZV9zaXplKGln
dF9kaXNwbGF5X3QgKmRpc3BsYXksIHVpbnQzMl90ICp3aWR0aCwgdWkNCj4gwqB7DQo+IMKgCWlu
dCBmZCA9IGRpc3BsYXktPmRybV9mZDsNCj4gwqAJY29uc3QgdWludDMyX3QgZGV2X2lkID0gaW50
ZWxfZ2V0X2RybV9kZXZpZChmZCk7DQo+IC0JY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZv
ICppbmZvID0NCj4gaW50ZWxfZ2V0X2RldmljZV9pbmZvKGRldl9pZCk7DQo+IC0JaW50IHZlciA9
IGluZm8tPmdyYXBoaWNzX3ZlcjsNCj4gKwlpbnQgdmVyID0gaW50ZWxfZGlzcGxheV92ZXIoZGV2
X2lkKTsNCj4gwqANCj4gwqAJaWYgKHZlciA+PSAzMCkgew0KPiDCoAkJKndpZHRoID0gNjE0NDsN
Cg0K
