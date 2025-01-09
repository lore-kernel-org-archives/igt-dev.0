Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ADDE77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 15:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7035610EE97;
	Thu,  9 Jan 2025 15:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3tQVA7A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D67710EEAE
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736437212; x=1767973212;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=a2BDazaAKbuHe40kj0kuPJsd9G7KDXrG08dkYwRRI3M=;
 b=A3tQVA7AdC3qUGPkggZLllDcyAmc1S230Gat1KJbaQaRWzBpwpsZKFkh
 CzXLKWW9tNVO5Dy+6Qdt2CDJlxwQl2LeBpQ7opobfAnxqD+4cywNRuOCr
 9JS/sCVXjtuiwlSWTl2f8o5nsJswb2519TOTIi2ili+pWF6iXO06UBKsh
 MjHhqRcQGpE+vnraMuvB74HlGgxjKu6rCd8D87JbPlUj8Z1T0At1zE6bW
 HQ84sYFsyjtw0j1HbhhO32QAsmDqtpZaz4xQb7co40zd4dHlKur9HlaVF
 AEFnB1zmVlZFKFlHdLo3l89hiCmlClwYhAM4uRYmacYUqNhB3wgd8msDT Q==;
X-CSE-ConnectionGUID: nrRLfz03S/60Azeh3Gbwtg==
X-CSE-MsgGUID: nh8kyhXWRO+mYTw8HsZKIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="59176172"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="59176172"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 07:39:51 -0800
X-CSE-ConnectionGUID: yA1uDSU3TU6ME15VeDS5og==
X-CSE-MsgGUID: kLPUWDS8S9STtsTyAd6+OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103966921"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 07:39:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 07:39:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 07:39:50 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 07:39:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaUKTARmEojNyH9D8mNu5eXr5TqW6o3tYcs1/ioosRYw4LKGFs28FTiQa/RMBaqpziHVEwRZlkDERsWlASKwYUlfAe3ilVwUtI9jJ07rW7D9DsF0UtTbyrMtnZulfx4D1l7ZE/P91qhWV7s67deQfOyLLad3rl9V0DD6Q3CRE2vTilzn+hkERu1Z8ZzzevnxAlMSvI24IFqaHxBpRFzCA6+OjjFgz6/un7u3Uq9thCRT/cmC5aFDvfPqZVOrIlGeecOkawYm/NMEhz+lgJw7j8QpONFd7uatq+P0ugt5rsYjTM/tvrfJuRf6aGgEnCTixJz/G5+Ekd66bv05m2HDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2BDazaAKbuHe40kj0kuPJsd9G7KDXrG08dkYwRRI3M=;
 b=NBkjx7EXBdbb6XtOWsg51xWFd6LDqsU73KFz1M4YFwe94FIpiUY43IEI7dafRkvophVrFv9mWx083lHMOW3wsN4xglvyCKa4T8DGW3WLUi652AcdGlVmTDuictGaSJ+s/kHWd2F9UjqM8y4f7/xiXL+DJYkqbjgGykPr3/M33YPxPyp8uXCORpncJ6WBwe7h94rqGYaDUIkCkvGe97n08zgwKtmOiJzGj+aunHp17Mpo6oPIf0MGL+rNykiUanaTQpyCUo9qUb36sIec0PbbdYSgeD4Py5VR/fmB8YqUJfQKHGkvSHvrx0hdHvSowP8IAgDzPgtd4bRUBHNxqUoNEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 by DS0PR11MB7629.namprd11.prod.outlook.com (2603:10b6:8:146::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 15:39:47 +0000
Received: from PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::b6c3:37a3:83ff:3b75]) by PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::b6c3:37a3:83ff:3b75%7]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 15:39:47 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_reset: Add a vm_unbind after
 the stress test completes
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_reset: Add a vm_unbind after
 the stress test completes
Thread-Index: AQHbYiBMQobRewuMFk+nDFtQgMFF37MNiJAAgAEMhIA=
Date: Thu, 9 Jan 2025 15:39:47 +0000
Message-ID: <63cc246d2c4e3929dedce3058cd93d9e17ba1a83.camel@intel.com>
References: <20250108225424.95051-1-stuart.summers@intel.com>
 <CH0PR11MB54443F5CD1871591FB85DC4EE5122@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB54443F5CD1871591FB85DC4EE5122@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5577:EE_|DS0PR11MB7629:EE_
x-ms-office365-filtering-correlation-id: 05662d12-a83c-4831-282c-08dd30c3d8f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?REN5MEJscVhTZW9PR3hjSEFmTC9qQ0Vpc3gwZytEdWxxTmt1NDMyQTJEK1pl?=
 =?utf-8?B?MEl1dU1WNjdxUHpHR2psTG1CUkhHL2VyQWZMcm5nZFhPMyt0UklqYTlPSkpy?=
 =?utf-8?B?TzlkMllzRGNQUy9ycy9XSzYrSlROR3ZCR3FnSEF0SVd3Nm1pMW5zK1lwaUVX?=
 =?utf-8?B?YlpqeERDMVEyVHJRSzJZaU5BUlJydjVuSldJRlo1d0pwOUVKWnJuNndEcjJW?=
 =?utf-8?B?d3FIS3lyUlZpc2h2QjJJM2QyZ1QyNkRpeWV0WEJBQThOQTBtV2cvRUlMaWxa?=
 =?utf-8?B?ZURjY3grTFpHbHd1Z25nbkNoWllPTGh2QnhWT1hEMG50bkFMN253ejlac3F3?=
 =?utf-8?B?Q2huRTU3Q2w2OHdsWDZVdVVqNld2ZnhJWXYwa25yV2p2WkpHUytWNWtZVXd3?=
 =?utf-8?B?ZUpQQ05JSDZ2WnRHK0gyck96cTdrUTBkRkt4QnNKTVZUOVFreGJUVmRFR1U1?=
 =?utf-8?B?OCtuMnczZ21xa0s0S1QvejI2c0gxMUFORmRnZ09mbWw1QmR3QmtyanB2N0xC?=
 =?utf-8?B?OHMvdVBLWDQxTk1zVGtWMUg3U01BK1pXRWRjcEREUGo5V09UcGgzdTEyd3lK?=
 =?utf-8?B?RTRpdEV5d25PRUZXdXV5aUpTL3g0UWlNL09reEgrY1BsWjRKdmhQWW5ZRVNG?=
 =?utf-8?B?ak1FVkJROXhHaFpDVXRHSENiVFFjOFpYdjdMSi9GUkdqQjFuTGNqMnp0T3NU?=
 =?utf-8?B?dUcxU2lHaU1oWFdGK3lTc3EreWRVaDI4ZlRtMkRLbUdCcVN4Y1kyR0syYnh2?=
 =?utf-8?B?QlYxak9GZWpnMEJQblRkNkl4UElzdGcxSTlUanpmZ3dpcTBXUXVHZlZEZ2xr?=
 =?utf-8?B?VlJsaThYM1JhSitYdTIyV3k2Y2M5amZhY3dDQkFtTmNvZGgzSkFBbm5JWlFD?=
 =?utf-8?B?SFhsWVdydHluejQxZi9hOUlrTTdLNEZ2VzNENHY0VW1qM0tjOGRNS2hhVGhv?=
 =?utf-8?B?WFhBeXNtdFozNlRDUE03bmFEVUE2VVExK0dyaDlCS0wxOGpNODNxb200eDIz?=
 =?utf-8?B?UDZWMVp6MUYxdkxLVWJFeXNWb0V2MDE3YWtaeUthMUxxb1QrSEp6eE9VdTJI?=
 =?utf-8?B?RmtFWDhIK0xTV1ZMVy80R2Vya0Vac2ZGMlFSTW1UeElnNUpYdWd1L0dxNmNV?=
 =?utf-8?B?WVYxZ2YxeUowR1FpREdTaDRRUVF5Mm05ZDVlalY0VHozUzJrOUptRUdnYm1s?=
 =?utf-8?B?dlM2a2treENtbzN6U1Z0K2k3SkF3bUhWS1lGTDJrbjZGTVpvK2NxZjgzSy9u?=
 =?utf-8?B?M1FaZnh2MnBNak1adjJKK1NhQ3AzbWNzNXVINHY3V0ZWRFFWd0YzakM2NERj?=
 =?utf-8?B?ZUhCNEhLSEJYL2NJNE9USGNocnpGdmJXMk04RTB2TUhlemlCVmV0bGtYem9X?=
 =?utf-8?B?ZGN2eUVhN1F4cnlGemNRaEZqbXpFYlNmVUMweXNpNjh6V2tGd0JuMGhCTDBq?=
 =?utf-8?B?eS8rZUNFaFYwTSs1TzgzNElvQitoQ2VhR0lmeDFGam9XcVhqdGVPTmZPVldY?=
 =?utf-8?B?a0VOVWduZDhuZXR5dFd1K3oxeFhjS0pOQlZDQlE0SWd4blNjNVFET1lVamVN?=
 =?utf-8?B?RUQ1amx5WVdVdzBFTDFjTis4dlNsRzg4Mjg5VHBuWnlLZ3JkN0FQc1ZrRDMw?=
 =?utf-8?B?aHd5MnF0eWhxcDB0eHg2bUNVWXNBemRHVXIwL3lCMzBPWjJBak1ZVzNFMDNq?=
 =?utf-8?B?UEJTTXZjWUFqeGZkVStDejMrcDYxNE4rZFVRLy9hdUlLb0tQeVdDaVZzQ3Q4?=
 =?utf-8?B?T3creDcvaXphY21vOG9ITXpLU0NBbjlHZVoxMUFlTytxaFJKdXMva3RxNkE1?=
 =?utf-8?B?RGMwVUw1dDhWcGl0b28ySmU3ZlVtUi8xYWhDQlo5UXh6ODUwYVZCVHZoY0cz?=
 =?utf-8?Q?Y6oFTmEVxtPGR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5577.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WitYZ2N0czh4UW1GV3NEbHZOMjNrY1hyZE9jT2w2ODE1Wk5nQU9GUUFTOUNP?=
 =?utf-8?B?UmlKUi80eW9Tc0pwUzFGR2hPUlZHOTRBOVFOa0JxVFY2RTIzSjl0RTlObGxz?=
 =?utf-8?B?Mmp1bDR5ZVJ1citldUQzdGYxczFLZHlwTSt4NWhmcVVrMmNmNklscXk4V3Zr?=
 =?utf-8?B?VDNkWGRrTTYzd25ROXZCN3IzeVRDV1JUNXVJL0YzMC80ME14RmtrL2hDT2Qr?=
 =?utf-8?B?bGxubWdSc1g1ZmNsR3VQdm5EZDNaUHpwQjlXWjk1QWhzMVduRjlJQjdCdENa?=
 =?utf-8?B?amEyc0Y4VVhHUkNkemx3TUk0d20wTlE0TUkxU3J0RGNtSWV2TXl0VWViNnZa?=
 =?utf-8?B?dDk1OWpPQ2VTWVpudG9WOUlqbFkrQzJGWVlLRnVTNzdlK1dNTm9OKzZVZTRq?=
 =?utf-8?B?dEhQUHhCcHh3dXNGZEduQitwMXlRRi9GdTMyWEZNdFlBYlF1ZllZNWN1dW8r?=
 =?utf-8?B?Y25sR0hxRDhEdlhHWC9sWkFaQmo2czVDV1EzSG5iemRJVm5NNWpxTzdFeW5v?=
 =?utf-8?B?SGZuam0yK1pqSnk1Q010Uk5CQ1loc29rY3RmTmdqZ0VMd0ZnTGlvRm5vTFdj?=
 =?utf-8?B?RlNCZytGUWRheXRKZU1jK0t0VitPTWNDNU5aSzB4ZFVXVEFPUXE4em9BdXdV?=
 =?utf-8?B?N0lWYk5QbVJDcGQzK0hXckRmRURrS3VhMEgzbU52bENnMmFJSzIxQWxBNnJJ?=
 =?utf-8?B?TGNINlVYU0M4KzRiV1N1aEdpSFNmRk9ZbzZqek8zTzJTSS9QdFpHN1p1QVph?=
 =?utf-8?B?TXo2N2g5MjNIdDltdE1jMFgxaDBTaEM0dkpYMlM5U2dYeFdzRUpERlBZUDNv?=
 =?utf-8?B?RnhXQUFZeFQzRDBicjhXZXdmMm9FRDBvaWtab3kvMXYvaEVNZjhDL25NeE1z?=
 =?utf-8?B?bWxndjFNQ0JrQ2hkMEU2dEl3YWJKdXVZVUgxNlZPeS8vbURmODVQRCt3Vzlx?=
 =?utf-8?B?cUNHTGg2Y0ppb2lMODNWa1lBS09NWlFha2FQOW5LNFN1L2JQWEdXSVVPQ2dO?=
 =?utf-8?B?RlVYblYwdkU2MTR1WGlqZU9NVnlNYVJucEgyK1VhL3pKMTNQSUx6VVd1MDNS?=
 =?utf-8?B?VVZCVzNuUlRyMzBndXMxZy9wN2gxanY2ZnM3STdUaXd4WFMrUzZkL0h5NGpq?=
 =?utf-8?B?VGk1SE9rMHNQakdqSE41NmYvVVFzYUVHMUxZSEVpMjB3WmxUMG15YS93MFpt?=
 =?utf-8?B?RTNzUWxPMmVJNVV5MG1hbi9mNGFnancrY3NmTmJibFh4WEpYSXNyNmF2ZUxi?=
 =?utf-8?B?d1g0QlVqMmExYUY3SlBaN3Q0NVNYdXM0WTdhUDM5NktWcjZ2TVFrcDN0a2lr?=
 =?utf-8?B?RWZlRlNqNDFHZXhPaFl3M3d1djA0TXFyRVFabStoZTFzenErNFpjeHNXS0RT?=
 =?utf-8?B?S1RTeXZhbis4Nmo5eHN4eFRLQmIxK0NicjF0aituYnl6dFRodWpXdElTRHFk?=
 =?utf-8?B?dm1ERDB6d0ZPNCtIaUkyNkZBdzZyUVRwMnZ6ZFhnaWxmakVpOVZta3pBV1VU?=
 =?utf-8?B?SmRicHY0Ylc4RWdvR0Q3VnRBQW0rY0tUSHVocjQ4R0hya09OV1pPMmxaTFNm?=
 =?utf-8?B?NThRdFRGaVh1VDl6aSt3b045RVorSDJWRHFiNXo5K21KeENvbHIrTkZzZEdr?=
 =?utf-8?B?SnRpT0Q5RU1JNnFxaXpKc2dhaVR1OVBwTDFXMzJCL2pCYmlwOHVoaER5TTk2?=
 =?utf-8?B?elRadDNHbkxZY1Bkd2FPZmo1Sll4dnhrRmZkMXRjUVFXeDdRWld1QTZaVGFM?=
 =?utf-8?B?UWhyelpEY3hQd3BvSTY0Q1FBaHdYZGRLL3NrWFFNSHMvMCtRS0dkSGdQdkVk?=
 =?utf-8?B?M1kwcG9zSllJSlRwb0Y1eGpMU1pkMUJaQ0xWNk0vNGpMOWdvaEpwOHFEQUcz?=
 =?utf-8?B?c0VjRFdUNGhoaXdoaUFSdmM3M0R4WE5HT3FRZzdJOU02aVVnejlMNWdQazhV?=
 =?utf-8?B?SkVsa2ZnZGwvQXdVekhnTDVPbjgxNDRsRVJTdVFkWW1Qa1RsRzhrRHZQZ3c3?=
 =?utf-8?B?WFpmNE0vOVRuNCtJV2h4VHRoY1IwTGhDUGppZTE4NFVHa3NBUnZIQ1hUcFBa?=
 =?utf-8?B?eUE2MHpURW5kaE1tNjBieTN3UDdWR25DZDZWUStrbWRpUEJhN01aVlEycE5V?=
 =?utf-8?B?bVVWajF5Y1Z1ZExrcmFEM2ZOZ0t4TFBqSHR6bTA2cDhXMlZONUNXRVlmQytH?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92F3B8A7E0BFC141B10F95397D05C2D0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5577.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05662d12-a83c-4831-282c-08dd30c3d8f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 15:39:47.2929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 34pBxEp1JYuHjdoVkMezxLMyV7VsL847UuRs6oxozJLObmTRbtyoyb0fZJTEOTmPRKrugiB1jIN8iPZAbquJSZJpfK2miZeAMhsgrjUqLw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7629
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

T24gV2VkLCAyMDI1LTAxLTA4IGF0IDIzOjM4ICswMDAwLCBDYXZpdHQsIEpvbmF0aGFuIHdyb3Rl
Og0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gU3R1YXJ0IFN1
bW1lcnMNCj4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDgsIDIwMjUgMjo1NCBQTQ0KPiBDYzog
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFN1bW1lcnMsIFN0dWFydA0KPiA8c3R1YXJ0
LnN1bW1lcnNAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2ludGVs
L3hlX2V4ZWNfcmVzZXQ6IEFkZCBhIHZtX3VuYmluZA0KPiBhZnRlciB0aGUgc3RyZXNzIHRlc3Qg
Y29tcGxldGVzDQo+ID4gDQo+ID4gVGhlIHRlc3QgaXMgc3VibWl0dGluZyB3b3JrbG9hZHMgaW4g
YSB0aWdodCBsb29wIGFuZCB0aGVuDQo+ID4gZGVzdHJveWluZyB0aGUgZXhlYyBxdWV1ZSBmb3Ig
ZWFjaCBvZiB0aGVzZS4gVGhlcmUgaXMgYQ0KPiA+IHBvdGVudGlhbCB0aGF0IHRoZSBHdUMgSURz
IGNvdWxkIGdldCB1c2VkIHVwIGR1cmluZyB0aGVzZQ0KPiA+IHN1Ym1pc3Npb25zIGFuZCBiZWZv
cmUgYSBHVCByZXNldCBnb2VzIHRocm91Z2guIElmIHRoYXQNCj4gPiBoYXBwZW5zLCB0aGUgc3Vi
c2VxdWVudCBzdWJtaXNzaW9ucyB3aWxsIGVzc2VudGlhbGx5IGJlDQo+ID4gImxvc3QiIGluIHRo
YXQgdGhleSBhcmVuJ3Qgc3VibWl0dGVkIHRvIEd1QyBhbmQganVzdCB3YWl0DQo+ID4gZm9yIGEg
c3VibWlzc2lvbiB0aW1lb3V0IHRvIGhhcHBlbiwgYXQgd2hpY2ggcG9pbnQgd2UgZG8NCj4gPiBh
IHJlc2V0X2FzeW5jIGluIHRoZSBkcml2ZXIuIFdoYXQgc2VlbXMgdG8gYmUgaGFwcGVuaW5nDQo+
ID4gaG93ZXZlciBpcyB0aGVzZSB3b3JrbG9hZHMgYXJlIGxpbmdlcmluZyBiZXlvbmQgdGhlDQo+
ID4gY29tcGxldGlvbiBvZiB0aGUgeGVfZXhlY19yZXNldCB0ZXN0LiBUaGVuIHdoZW4gdGhlDQo+
ID4gcmVzZXRfYXN5bmMgZXZlbnR1YWxseSBnb2VzIHRocm91Z2gsIHRoZSBzdWJtaXNzaW9ucw0K
PiA+IGZyb20gYSBuZXh0IHRlc3QgY2FuIGFsc28gaGFuZyAob3IgcG9zc2libHkgYmVjYXVzZQ0K
PiA+IHRoZXkgdG9vIHJhbiBpbnRvIHRoZSBndWNfaWQgZXhoYXVzdGlvbiBjYXNlKS4NCj4gPiAN
Cj4gPiBBZGQgYW4gZXhwbGljaXQgdm1fdW5iaW5kIGJlZm9yZSBkZXN0cm95aW5nIHRoZSBWTQ0K
PiA+IHRvIGdpdmUgdGltZSBmb3IgdGhvc2Ugc3VibWlzc2lvbnMgdG8gY29tcGxldGUNCj4gPiBi
ZWZvcmUgdGhlIHRlc3QgZW5kcy4NCj4gPiANCj4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvZHJtL3hlL2tlcm5lbC9pc3N1ZXMvNDAxNQ0KPiANCj4gSSB0aGluayB0aGlzIG5lZWRz
IHRvIGJlOg0KPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUv
a2VybmVsL2lzc3Vlcy80MDE1DQoNCk9rIEknbGwgdXBkYXRlLiANCg0KPiBCdXQgb3RoZXJ3aXNl
Og0KPiBSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwu
Y29tPg0KDQpUaGFua3MhDQoNCj4gV2VsbCwgYXNzdW1pbmcgdGhpcyB3b3JrcywgYXQgbGVhc3Qu
wqAgSSBtaWdodCBiZSByZWFkaW5nIGEgYml0IHRvbw0KPiBmYXIgaW50byB0aGUNCj4gY29tbWl0
IG1lc3NhZ2UgYW5kIGtlcm5lbCBpc3N1ZSBjb21tZW50LCBidXQgaXQgc2VlbXMgeW91IGFyZW4n
dCB0b28NCj4gY2VydGFpbiB0aGlzIHdpbGwgd29yaz8NCg0KWWVhaCBiZWZvcmUgbWVyZ2luZyBJ
IG5lZWQgdG8gbWFrZSBzdXJlIHRoaXMgZnVsbHkgZml4ZXMgdGhlIGlzc3VlIDopDQpUaGlzIHBh
cnRpY3VsYXIgdGVzdCB3YXMgYWxyZWFkeSBwYXNzaW5nIHNvIGp1c3QgbmVlZCB0byByZXZpZXcg
dGhlDQpsb2dzIGFuZCBtYWtlIHN1cmUgdGhlIGNsZWFudXAgaXMgY29uc2lzdGVudGx5IGhhcHBl
bmluZy4gSSdsbCByZXBvcnQNCmJhY2sgaGVyZSB3aXRoIHRoZSBkZXRhaWxzLi4uDQoNClRoYW5r
cywNClN0dWFydA0KDQo+IC1Kb25hdGhhbiBDYXZpdHQNCj4gDQo+ID4gDQo+ID4gU2lnbmVkLW9m
Zi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiAtLS0N
Cj4gPiDCoHRlc3RzL2ludGVsL3hlX2V4ZWNfcmVzZXQuYyB8IDIgKysNCj4gPiDCoDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50
ZWwveGVfZXhlY19yZXNldC5jDQo+ID4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX3Jlc2V0LmMNCj4g
PiBpbmRleCBhM2VhZjhiYmYuLmNhNTU2NmQxMSAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRl
bC94ZV9leGVjX3Jlc2V0LmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX3Jlc2V0LmMN
Cj4gPiBAQCAtNjQ1LDYgKzY0NSw4IEBAIHN0YXRpYyB2b2lkIHN1Ym1pdF9qb2JzKHN0cnVjdCBn
dF90aHJlYWRfZGF0YQ0KPiA+ICp0KQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgeGVfZXhlY19xdWV1ZV9kZXN0cm95KGZkLCBleGVjLmV4ZWNfcXVldWVfaWQpOw0KPiA+IMKg
wqDCoMKgwqDCoMKgwqB9DQo+ID4gwqANCj4gPiArwqDCoMKgwqDCoMKgwqB4ZV92bV91bmJpbmRf
c3luYyhmZCwgdm0sIDAsIGFkZHIsIGJvX3NpemUpOw0KPiA+ICsNCj4gPiDCoMKgwqDCoMKgwqDC
oMKgbXVubWFwKGRhdGEsIGJvX3NpemUpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBnZW1fY2xvc2Uo
ZmQsIGJvKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgeGVfdm1fZGVzdHJveShmZCwgdm0pOw0KPiA+
IC0tIA0KPiA+IDIuMzQuMQ0KPiA+IA0KPiA+IA0KDQo=
