Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3884CC44529
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 08:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD7E10E31C;
	Tue, 21 Jul 2026 08:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="REHtSPwd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D12A10E2F2
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 08:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784622366; x=1816158366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CMrSo8//7reL+YTexpHaVOVACmFkYuNCIvPkKgAi4ZM=;
 b=REHtSPwdVH34H0ggC9d/lH53i0t0aBzm8VZ1mWi1gsf9M7hjjuJp3atI
 wX1ImRE9YIiaXsX6oPwIMgkicNm0i2ekW0wurOHKXSYRYBexM8yZxAYcZ
 NWDz3t351WhPhJIfh+08mWOk+8PVlKGi6kwyHfoZIt1JWB3k1trZR/WiZ
 9BZmIN7Gq374Ju7D6jF4dPx+zNHWy9fAuTbAICrV+eTDHN1hYqJ+CUngm
 ZRMAfWYX4PXbEQMQIQsyhkeRpRh1Ph38p3YkqT22semXEbZHft0PsPrBm
 DDTOiarTap9fJva6yGcHjj275Swz0Z7jYadyTLoBBH50huhLoFzno/n9A w==;
X-CSE-ConnectionGUID: mde9gV6KRICeNMoMz84j2A==
X-CSE-MsgGUID: wXYBLfyrQRicY4eNCPBKEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89035918"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="89035918"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 01:26:06 -0700
X-CSE-ConnectionGUID: 3TAGq+v1SrO68BslQm/0eA==
X-CSE-MsgGUID: cH8i0fU5SC2SMrlDmTcBDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="253774541"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 01:26:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 01:26:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 01:26:05 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 01:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eAvC/Q7S90AEq7zbqGSNkSiz3fIoRDFcEJH4H9bm4CYtoDMedtmgFRCJ8QPIqIqNNDpPqclkOE6XVdmIxk9IjfETKMhKCVgAKdYH3SqLgm8nxf4ekdii5jVrXIp8/g7S0wQ3TS6NejccWf2+9cmh2i+v/nsk2QI2WywSOIwtoPEYLh2lqNf5uDMT/jm+UEHPTOzuba9ipLLorpSX8fRvYfy2S8xwkwojU7YVQGXfVga0JQZzE9t5WVVFO+bxUxcvIj6ekAkHhhaUdC83gQz9rQ8VHlgGW4QPv2/rKpCxaRUxInm4IEI82zx80o7RlLXrPbS5E5T92zEVxMk0PpThOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMrSo8//7reL+YTexpHaVOVACmFkYuNCIvPkKgAi4ZM=;
 b=h5FWZzcqLH1PKejbxLhSRW/UhqgMjAIP/ltHKoDHl+yWltP/NQm1Mp5L459bp+90DVoiAj6U1Mc6M6tW2/2SSg2zv92Cx3c6dVjyczvbvoBbYvFiyr4bBFuILhCVpRC3BT5udkCnUqGwA7axd42itrsCzRRz0tmQDkSmU3GlitNFtANxeeYt9LiXYaPMuIf5k6zQkLuxCdJXPmt8/iPzP8FNd2KKXLuBUCcLWHDlplQyZf1IPl34/nZXOV5y7pIbPzEUP02l0zXVJh3MZZ0PdrO2JkkbNP8qyJcRpL5GCXOCxt8/91T5V3Hw9OWdMwWYN8ZjaGAf57v79F2HAORZkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by DS4PR11MB9530.namprd11.prod.outlook.com (2603:10b6:8:34b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 08:26:04 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%3]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 08:26:03 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Grzelak, Michal"
 <michal.grzelak@intel.com>
Subject: RE: [PATCH i-g-t v1 13/16] tests/kms_sharpness_filter: limit #crtcs
 tested during suspend
Thread-Topic: [PATCH i-g-t v1 13/16] tests/kms_sharpness_filter: limit #crtcs
 tested during suspend
Thread-Index: AQHdEqad6RQsahGzQ0+2DknIfxOTE7Z3r7hA
Date: Tue, 21 Jul 2026 08:26:03 +0000
Message-ID: <IA1PR11MB64674825EBB72B6393075300E3C22@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-14-michal.grzelak@intel.com>
In-Reply-To: <20260713085515.463575-14-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|DS4PR11MB9530:EE_
x-ms-office365-filtering-correlation-id: 69663ac8-46af-4dcb-0eac-08dee701b42a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|4143699003|3023799007|56012099006|18002099003|22082099003|11063799006|5023799004|10067099003|38070700021;
x-microsoft-antispam-message-info: GKxZhzuaEWPgww5zd5gbRVR5REi1yqCyfS/apLWf7QyU+RX4XO/HctelbptYZky2fGvV0fZ/PrZd0SqfsEwrP58jE7S8yZueOX6WHOkeESxO7krGpZuVKD6aPCULMU28pQno3yURCNR+l9NERMDHPPgrVANDi80BwJi8fiVz+6Ac8QrtDS6Snfpiw3iv7aHi7SFicbVfILAFUMwe5k41SmpjAB0XwYlyhF0F2pzvhVh+8FpE+V9k1owJOF4qzr4fdij7QWL235I2Of8sSNKsS8k1vXKHGIhZWUuXb4eQMoOQtIpdhr3EBO9zhVaF4HuieNQ08SClfi4lFztsDsvlhXQeE7fsslAaxHw3RP5kOis0eMSGuLlx/8XZgCpqUUsR9tGX6umazTTWtr6JnzcysQzQFPTfPeO+MYKYaHOEa3vVEz30ZBcw2Q0hGAWLo8bk+SKeuL7isE0pEDirJyssLWIYDJn8t4tGoAOz4Whx29TaZK+LbK6tYJ37zOjoSkWiQxROs5Y98vwA95hOU6yquX6Dqfuwwz3+mtSu27rh1WFdMdilaLrsOjaZYJeT4tNnmPP/H0sR70YmfDcGdW1TMd3ChwwKKK7RlMkBh16T23AGoaycxGmyX6QZ+80vZa0wO2W2SejEfQZgWuwcs8aZyOKQovx0zPOOQIWXsxYEADMF+T1BNZFlsNWhARHLYyTXT1Osg8yGLvBjE3SnFGxG2fZzDcoIJ6S8HFotS19FDZ4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(3023799007)(56012099006)(18002099003)(22082099003)(11063799006)(5023799004)(10067099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnhpU2U2NFRFaWxzVFg0Qnp3cVAyOVg4aW9DbFc2Ylc4WE53RVBLdUtXZkVh?=
 =?utf-8?B?MFErdkthWGtsNEh4b3ByTmtrMFFTY0ZLSjFYbHlubjkvSER4ZFV6RjlpcmZw?=
 =?utf-8?B?VW9tYlZPZy9UWW5CVUU4aUhVNVBCTnpWR2k4TVRCZVRja3NtSHFENm02c25t?=
 =?utf-8?B?dnBuU2p0QjFYY2w1MzJMZENsekgrREMzTUVjZDBNTDY4ZTRMQ0NiTGpzYlRj?=
 =?utf-8?B?R0hocXBBcTdjRWR4cGhtdFZaaVVXem1yVHZ0L21yNlA3aVErYzlhdEVuWHN5?=
 =?utf-8?B?V2RsZjBWVUkwZXVlY2txRTFIVVNoSTRyUHJ4aEs5TEk0b3BkcnRxaW9lRkxJ?=
 =?utf-8?B?ZjRFMnRQd3FJMjB4YkN6ak5yVEticGM5eERuZ1Q5b04xekxScmM4MTlpQjNj?=
 =?utf-8?B?c3RhN3RRM2JwbTdDek9kZ2tyazA4cGFKTmRTdThSUWtxTzlKYTV0VkJXcThO?=
 =?utf-8?B?QkNCUHFNS3d5SU44bUdnRHI1OEhIamxwUE5BQTNkTFBRc2h4L056eGtXTVdL?=
 =?utf-8?B?bzlxVlFReVRYeWh6ZTc2SzFIMndlaDNhVlNKWVhONllJZU1idkRWUWZPcVhk?=
 =?utf-8?B?YytVTHVMSlNpNHVib0htR1lrNWw2L1VlaHVWVUtUZ0VrM1I2UzcyenF5VXo0?=
 =?utf-8?B?UFpPbGtBcDVoRnpJbjlTSVNsWjdmQWdHVWVYUzZDakdqSUdZRTJ0Wk8wOU1S?=
 =?utf-8?B?cUtNdGxyQ1dLRjlzQkJGRlQ1RUdWbWlRb1UwWGw3MFZRZkUza3pHSWFzaWhw?=
 =?utf-8?B?VFJHQ01mTFB4azJiSUZnKzN4ZjJQYXBndWdiS3FEWFNhOEJiU2JxYXVVaW9I?=
 =?utf-8?B?QWV2eFJvZ2FxS0o1eXhnQjRKdW9COUlid2tNR1lQSTFoc0o4elFvaW4zU2V2?=
 =?utf-8?B?TllMUlNJc1UzQnU3bnB1Tkozdk0zdjdtT1VGUVc3VVN2VnMxZTBFMlpyVXJu?=
 =?utf-8?B?LzVFZVlCRC9qbkRZTmp5eDI5T2pGWVpIemVlTkhvd294eWk4SnBlWVQ4aXBE?=
 =?utf-8?B?YjRqWEx2V1hwYS9LZUFWOGJlNEhDK2Z1TXBlUmNPeTJERXQzN1RGc01Ed0dC?=
 =?utf-8?B?M3ZQTnllSVE5UUplR1FEdUlWVisramh4azVyekpYQ29xeFZCZ2dhbG9NM3Zo?=
 =?utf-8?B?TVpnWFJCaVZ0UWtPeEwzZ2tKcysxWmVlbGt2M3djVXFXRWhSNFBCSjhjdncw?=
 =?utf-8?B?bDh3MHo1RWRORXc5bndTQnh1a000Z01WSGVNdUtIWTJJQ1pkdmhQRkZVY1cz?=
 =?utf-8?B?bEhzUGV1bUpOUUNlR3ExYUFPWXY5ZGNsQm1RMjYwc3VsdU56cGpnNEk0b0xR?=
 =?utf-8?B?bkJkT1A5YVR5dkNoWVE2Y3pDVTdxOFMxa3p1WjNlRE5kQlBPOTNTeGMzVllx?=
 =?utf-8?B?R20rMkpqYWkwYnlGYkE5aEE3bXVELzJiTHhnVlFkTUdpbFJOcmR6cFJFWWxu?=
 =?utf-8?B?aFRuQUQ5VU5Ud1FmN3NYL1lWY3lzRjBOZnRhR2l3eW00MTBZODFPZVpJRk5s?=
 =?utf-8?B?R0JvT3JmdmFlNm1jVSt3SkFtWXdtajA3TXZndEpFV2pEVE90NkIwbjZxNEg3?=
 =?utf-8?B?dHFTSUxIMExMemh6R0pqVVR5NzN1UjlYRmhsdTV3VjB6eEx3QzdxY1lBbVpQ?=
 =?utf-8?B?RlhXeG1EV0xzK2FPdUdGVHRTQ1orWWNvMzBtNGE0YTY4M1Zlbjdkdyt1a2pm?=
 =?utf-8?B?dEZlbUlpekx2RllRSEgvamVNRGd0cTFwQnNxZmV1OEZTWjFKS2FDdmFHUHh5?=
 =?utf-8?B?aWhzV25kaTMyQjVuRWVFem8vNVA2WDg5TnBJK1ZDUk5STWpYU2VJRTJ1Yy81?=
 =?utf-8?B?dXFmN2FoL3lYUFZFNFFGQ2h6UllOejduYWFSN2xrbDFxZVF3ZXZxbGtWcjUx?=
 =?utf-8?B?RXY5bmo1QnR5RHVLZkZxd3JjQlh0bUc5NHNlWE5rNEZWYjlKQTlWd0ZCU2hD?=
 =?utf-8?B?eHlzZUROdVJ0VlNzWGtoL1daeG0rZEU3SzlWZzl4dVRPWUpzNzMySzNDZFp2?=
 =?utf-8?B?MU55WklIaFZGRjVOeUdKR3hKdWtFaUdxbUgraUwyZ2pBbUsrVkhRblh2UXkr?=
 =?utf-8?B?cEdLL0w2ZWxXN1lITXQwTit6Ti9VelYwd1dNa2NqZlp3a0NQK2lhMzhCVDBD?=
 =?utf-8?B?N1dSaEpKOG1ZejhXcE10KzJiSDBQWEt3dlV6Umg0K1JiaXg1dkNxdkZOWmpG?=
 =?utf-8?B?cDAzMTNhc1AzUnJCcFhXQ2ZNRDExSEJjdVJxUURhbXRFaHZKMFp5QWJDbENN?=
 =?utf-8?B?RXRwdFl1QmtCb0tKK01FZ3ByUGpZMjZHbjhLSGs3enlYWWRpMUdQaE94ZjFO?=
 =?utf-8?Q?5CwqKbXuTu3bvDADCS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NQI5KmSOaRd3kkJ5SgfOhE4fUxpbLcRgPzyUtidVVGUjjUA8uQioiS2xWDyotqG2BbPbreVRZNN5FAmtRjmm9VmLoGvFeQNOiOrHX/3Swvk/0APO15jdByAmzCHYcRfz90wrPPaejHUIQnq43ShLm3g4WG6MirWmavo1DiWFFIZJYaZbcCqYFz3YM1Q466etYzaoCDxcD8uI4LaZHtA8oFdvO2z7aTWK9dQ9ulhNSolO2eWOW2B9s2MBDcN0XlNgTPZ7jJiWt9HWc4wcO2/W3/zs0ZxsoTZpou1w3xNHMw/BPZFiS0LCJr7Fpw6wqPCVBznigFB474WX4Tczj6iyOQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69663ac8-46af-4dcb-0eac-08dee701b42a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 08:26:03.6472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gbz8wZl/AHaES5cmKjn96JAlSDocFELwJ33UsZh7SylOopupOwUjBNiZkZu8v7HhWduNrRGrqsvZkaz9PEM5Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9530
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1pY2hhxYINCj4g
R3J6ZWxhaw0KPiBTZW50OiBNb25kYXksIEp1bHkgMTMsIDIwMjYgMjoyNSBQTQ0KPiBUbzogaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFRoYXNsZWVtLCBNb2hhbW1lZCA8bW9o
YW1tZWQudGhhc2xlZW1AaW50ZWwuY29tPjsgR3J6ZWxhaywNCj4gTWljaGFsIDxtaWNoYWwuZ3J6
ZWxha0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2MSAxMy8xNl0gdGVzdHMv
a21zX3NoYXJwbmVzc19maWx0ZXI6IGxpbWl0ICNjcnRjcyB0ZXN0ZWQNCj4gZHVyaW5nIHN1c3Bl
bmQNCj4gDQo+IFdlIGFyZSBpdGVyYXRpbmcgdGhyb3VnaCBlYWNoIGNydGMgd2hpbGUgdGVzdGlu
ZyBzdXNwZW5kLiBUaGlzIHJlc3VsdHMgaW4NCj4gZXh0ZW5kZWQgZXhlY3V0aW9uIHRpbWUuIElu
IHR1cm4gdGhpcyBsZWFkcyB0byBoaXR0aW5nIENJIGVuZm9yY2VkIHRpbWVvdXQuDQo+IA0KPiBM
aW1pdCBudW1iZXIgb2YgdGVzdGVkIGNydGNzIHRvIGZpcnN0IGFuZCBsYXN0LiBUZXN0IGVhY2gg
Y3J0YyB3aGVuIHBhc3NpbmcNCj4gY29tbWFuZGxpbmUgcGFyYW1ldGVyLg0KPiANCj4gdjEtPnYy
DQo+IC0gcmVtb3ZlIHVudXNlZCB2YXJzIChKYW5pKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWlj
aGHFgiBHcnplbGFrIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMv
aW50ZWwva21zX3NoYXJwbmVzc19maWx0ZXIuYyB8IDEzICsrKysrKysrKysrLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL3Rlc3RzL2ludGVsL2ttc19zaGFycG5lc3NfZmlsdGVyLmMNCj4gYi90ZXN0cy9pbnRl
bC9rbXNfc2hhcnBuZXNzX2ZpbHRlci5jDQo+IGluZGV4IGFkZWM0YTYwYzUuLmE4NTc4Y2Y0ZmMg
MTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19zaGFycG5lc3NfZmlsdGVyLmMNCj4gKysr
IGIvdGVzdHMvaW50ZWwva21zX3NoYXJwbmVzc19maWx0ZXIuYw0KPiBAQCAtMjMzLDYgKzIzMyw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VidGVzdF9lbnRyeSB7ICB0eXBlZGVmIHN0cnVjdCB7
DQo+ICAJaW50IGRybV9mZDsNCj4gIAlib29sIGxpbWl0ZWQ7DQo+ICsJYm9vbCBhbGxfY3J0Y3M7
DQo+ICAJYm9vbCBhbGxfb3V0cHV0czsNCj4gIAlzdHJ1Y3QgaWd0X2ZiIGZiWzRdOw0KPiAgCWln
dF9jcnRjX3QgKmNydGM7DQo+IEBAIC02MzUsNiArNjM2LDEwIEBAIHJ1bl9zaGFycG5lc3NfZmls
dGVyX3Rlc3QoZGF0YV90ICpkYXRhLCBlbnVtDQo+IHRlc3RfdHlwZSB0eXBlKQ0KPiANCj4gIAkJ
CWlndF9vdXRwdXRfc2V0X2NydGMoZGF0YS0+b3V0cHV0LCBkYXRhLT5jcnRjKTsNCj4gDQo+ICsJ
CQlpZiAodHlwZSA9PSBURVNUX0ZJTFRFUl9TVVNQRU5EICYmICFkYXRhLT5hbGxfY3J0Y3MNCj4g
JiYgY3J0Yy0+Y3J0Y19pbmRleCAhPSAwICYmDQo+ICsJCQkJCQljcnRjLT5jcnRjX2luZGV4ICE9
IGRpc3BsYXktDQo+ID5uX2NydGNzLTEpDQo+ICsJCQkJCWNvbnRpbnVlOw0KPiArDQo+ICAJCQkv
Kg0KPiAgCQkJICogRklYTUU6IEpvaW5lciArIENBU0YgY3VycmVudGx5IHVuc3VwcG9ydGVkLg0K
PiAgCQkJICogUmVtb3ZlIHRoaXMgY2hlY2sgb25jZSBzdXBwb3J0IGlzIGltcGxlbWVudGVkLg0K
PiBAQCAtNzc2LDYgKzc4MSw5IEBAIHN0YXRpYyBpbnQgb3B0X2hhbmRsZXIoaW50IG9wdCwgaW50
IG9wdF9pbmRleCwgdm9pZA0KPiAqX2RhdGEpDQo+ICAJY2FzZSAnbCc6DQo+ICAJCWRhdGEtPmxp
bWl0ZWQgPSB0cnVlOw0KPiAgCQlicmVhazsNCj4gKwljYXNlICdjJzoNCj4gKwkJZGF0YS0+YWxs
X2NydGNzID0gdHJ1ZTsNCj4gKwkJYnJlYWs7DQo+ICAJY2FzZSAnbyc6DQo+ICAJCWRhdGEtPmFs
bF9vdXRwdXRzID0gdHJ1ZTsNCj4gIAkJYnJlYWs7DQo+IEBAIC03ODgsMTEgKzc5NiwxMiBAQCBz
dGF0aWMgaW50IG9wdF9oYW5kbGVyKGludCBvcHQsIGludCBvcHRfaW5kZXgsIHZvaWQNCj4gKl9k
YXRhKQ0KPiANCj4gIHN0YXRpYyBjb25zdCBjaGFyIGhlbHBfc3RyW10gPQ0KPiAgCSIgIC0tbGlt
aXRlZHwtbFx0XHRMaW1pdCBleGVjdXRpb24gdG8gMSB2YWxpZCBwaXBlLW91dHB1dCBjb21ib1xu
Ig0KPiAtCSIgIC0tYWxsLW91dHB1dHN8LW9cdFx0RXh0ZW5kIHN1c3BlbmQgdGVzdHMgZm9yIGFs
bCBvdXRwdXRzXG4iOw0KPiArCSIgIC0tYWxsLW91dHB1dHN8LW9cdFx0RXh0ZW5kIHN1c3BlbmQg
dGVzdHMgZm9yIGFsbCBvdXRwdXRzXG4iDQo+ICsJIiAgLS1hbGwtY3J0Y3N8LWNcdFx0RXh0ZW5k
IHN1c3BlbmQgdGVzdHMgZm9yIGFsbCBjcnRjc1xuIjsNCj4gDQo+ICBkYXRhX3QgZGF0YSA9IHt9
Ow0KPiANCj4gLWludCBpZ3RfbWFpbl9hcmdzKCJsbyIsIE5VTEwsIGhlbHBfc3RyLCBvcHRfaGFu
ZGxlciwgJmRhdGEpDQo+ICtpbnQgaWd0X21haW5fYXJncygibG9jIiwgTlVMTCwgaGVscF9zdHIs
IG9wdF9oYW5kbGVyLCAmZGF0YSkNCj4gIHsNCj4gIAlpZ3RfZml4dHVyZSgpIHsNCj4gIAkJZGF0
YS5kcm1fZmQgPSBkcm1fb3Blbl9kcml2ZXJfbWFzdGVyKERSSVZFUl9BTlkpOw0KPiAtLQ0KTEdU
TSwNClJldmlld2VkLWJ5OiBOZW1lc2EgR2FyZyA8bmVtZXNhLmdhcmdAaW50ZWwuY29tPg0KDQo+
IDIuNDUuMg0KDQo=
