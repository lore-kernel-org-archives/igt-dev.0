Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB81CD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61FE10E6A6;
	Tue, 26 May 2026 14:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGSU0elL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5837910E6A6
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779805342; x=1811341342;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BU5ZqiQLya+Nssy56DT/p2TYLbuFOIzrvrokOELLHFM=;
 b=HGSU0elLAxQVufp8hyR1IoHcvwIdjiOGSO36PDBBf8yT5FlQ98b29kJp
 bYBn0w8xrxjppdNUHlUZJ9Sf6QFlPwJXnqU+TNQrTVEMoRS76Jx5EjEe4
 JNafFoIPpgUjP5kozzUBDuwxyoJHBlfl2tQJR6tpCHlnzfDfJ1tqJ5MHt
 j1GJ8KGAyVpKIZEYqRaVEnqjXtL8zW881QA0y0kwvd+vjbakJS0rMDFwg
 /29ylcp5Fh+7XKSPyiplSpGcickD4pSzLCZ5A3mAZF/FxP9KUCw8INBCc
 swyQCDoKAAIdEgV+9GzEeJS/acmcj6A76Wvrc3JBZi5fKNGk4/0jINSDO w==;
X-CSE-ConnectionGUID: l5kEi8B8QyOpqF5ztza3gg==
X-CSE-MsgGUID: ZBm3NF+2TqarSCBwVUF2cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80676498"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80676498"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:22:17 -0700
X-CSE-ConnectionGUID: DnIT45+mS5aMRnYw8FI/HQ==
X-CSE-MsgGUID: z4eB1mqfTSa/o6TLqfiBNA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:22:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 07:22:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 07:22:16 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 07:22:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/le8MyIiiQZqZIwv42eq9lOiHwB7U9NHle43SxtIRatF9s3cdqZjeOTIejj4RyksLLQElkKtUY1Jh3f+1AWRWCPY7GzBp6ExeR7QRX+OiRes/LvGFc60NXkkJA2Fvz9/10jANkEKK+lkqz9f/t81dzUhY4As2z98uLoFGE7XKYkOfQIw74Rj3/WO1RHPKHU3lsTfpy1XRYrZem/YhlXVbD3EX9itEBrHIm53fyGLJTl87ttlZ2fgTBqB6THXFXDXMHESiLWlrMfWs6TGE60rlIh/v/CFbnBDFvTREchNjWqm0GDQZExGS/h5aRJnGYiTNcWuKiHMpqtgeEcXIt2Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BU5ZqiQLya+Nssy56DT/p2TYLbuFOIzrvrokOELLHFM=;
 b=I2TEz+IVd2ZUaDq8yHvvy8hlz6K6G1kTMHdmAPHc9z97ivZ+a05OBKcymJZsQv7T6DH8Q+piJKxxlwYWjc/3NyziIbtajb6+Em5TPTt3+keXXe5OKL9Kza+sIsx9+nK/++0zZO3JTJzcR24/5M4eMKuZjseiDN21Ikr9PCQWqJzDcTCk2+qgsCEWDLE6oZffYoUSQXUiPOxdJgSDFqQ/5aIiV00G8ZU5FUghS+Mj2h40XHc/cjpHcex3hD+IQxpGxxBd6mgxNafPmxmqInbqGp+AwqsTaH25ZzXvUdyIBlDLGVHSXZ4p/wJ0pyT+56TkPpSMhEWggjRRdLDo2dND9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 14:22:11 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%3]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 14:22:11 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Karas, Krzysztof" <krzysztof.karas@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [i-g-t,v2,4/4] runner/resultgen: Insert attachments list into
 results.json
Thread-Topic: [i-g-t,v2,4/4] runner/resultgen: Insert attachments list into
 results.json
Thread-Index: AQHc7Q0WAP/ewZQoAECFPSTOulctjLYgW/kA
Date: Tue, 26 May 2026 14:22:11 +0000
Message-ID: <466a8316b0e866013d568bed90e7d46fa986b6fe.camel@intel.com>
References: <20260423105514.175870-10-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260423105514.175870-10-zbigniew.kempczynski@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|SJ2PR11MB7598:EE_
x-ms-office365-filtering-correlation-id: ed8c0a4a-b80d-4660-1973-08debb322d4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003|11063799006|3023799007;
x-microsoft-antispam-message-info: RKnEuYZ9NCFom6ICXIITD5sxO3wrYTkMHeaPJwYt9EuK9Q0Pul3IxnjpA4Gap+UB3F30dhKHJho1GhV3G4GgULGLFJF37SHWj1NN7KkUv/R2+5yPIAAtDQhFrbaNx1pNeEAKX1DMALJMppw/R/Z9X49n+9Sdqqa3Ki/mtW+tdlbzFuSjBjoInERqfPHUYgSyqV1SVqREQKYJyA3/ydmn3G4IfY72DKOtM19POXo5sF/6DkQCFfjc3mABrMJB00WYqqV0n1kFK690aYjw+4Ue5TWyaAh7OJ9RnepTpCYd7pxIo1COGjgOO0l2c+iXoQk+MIrKsADCHl1FTINCSoM4Njb3zAzHdde+8WNxbc0GDiZNeDAkp7ma1PEp14doFx7rAWTvQaH/JTwiVy2iF9S2CrAo0ggISlLFJZEwpYyEz9JNSkmYxgzoniMToNbTZMhLjrCUWZvx3pWBFzkDTnwihfVAyoZh3L/B2eAqXuA4rMf4X8+haZOzwVe4QodBSSv+88Hq8bSKJgPQ5nKJ+Omo2XTMVoUhSPyW4Q4tlzESExDmBz2gSMEDb6NZ/DdEAn20pv9W+ZADefyNARwAT9Q+BlkQOD32yVaci/JzGXHckBz7DVH8+1G/iGnvqfx3UDFfz02x4JvRtjkWdiCcw4HtWZX4p7cri5uUOQzVC0xKvKvJ55QeTKZsTvZKfDswhdmW1oYRwxbgbo/lyDGZoGyDiUOiWOKQvEX32s6i0mMygGHFP980Uv3A/7I78cdmpr6U
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003)(11063799006)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHZRZ0V3UWowcmdjR0I2Nm5EK2Jtb1g2Vy92ZkFMNldIRHoraSt5WnR2ajI2?=
 =?utf-8?B?YmFCZnJrVFFCMzZNZTZWOGd6eUJVMEE1Y0lxZFd4SC92L2FvcGNOK2xadjVL?=
 =?utf-8?B?dVc1ZEREVEVUYlBpaWNuWXA3eUc3eU9uQ0l0ZWNNNk1QbU5kK05PVXZXam9O?=
 =?utf-8?B?RlFRZXUvRmJDeTBjb3R4azhFVm9ORXBWWi9FMDNlNHRMUjNuVnRTRnRwWmpZ?=
 =?utf-8?B?L1JZRksxaUMwZE8wS3haVjhFMkVDV09RUmhhdmQ2YUFyMm95Sk41NlJEaERM?=
 =?utf-8?B?Zk0xb1EvUmx6eXpXUnlTK2VNQ1UrL1dXaW9Yd2RMcDdxTEJ1dDBrU1NaT1BP?=
 =?utf-8?B?Q24rKzRWWTJqQlY5aG5jZWY4OUUrTytkMGtwRDF3R245WStiOUFaTWUwUW1E?=
 =?utf-8?B?M3RhdlplYUdOTWZkemYzTll3MmMzUjN1dnkybVY0UzZuMEJ0SGhobHNuWGp0?=
 =?utf-8?B?S3VObUF5RE1WUUlXK2c2YzZSTzFjMmRuYjEwNllzSlFSTklSNk1WMWQyS3Bk?=
 =?utf-8?B?aVkrWWNhUFlVMGxvUDhTNnNOWFFSbHJnajJwYWJJWjNrenRsZVU0QVF4NGRJ?=
 =?utf-8?B?UzdLa0FoeldoTkROSldMNHc1L0JMUnl2TXJET3NXRTM1TTUwL0UydDhEMkdT?=
 =?utf-8?B?QU9yT1pVUUs2Rm9zUlA1bmY5R2JyZGs0eFZoQXl1RmNDMkl5MC9LZHIyaVd2?=
 =?utf-8?B?Z2pBYmd5cDM0dXNiVUUxVko3a3pvWEdIRVo1V1ZkdmVVNE5mdEFIeWZxc2hE?=
 =?utf-8?B?VDhzSE8vK2RqRU5xRlM0WFVzVi9tNVVXdSszbGE5d0pwMzFlS0pWZWVpS0VN?=
 =?utf-8?B?ejJlSVB3VFgwV1NhN0FEbXhGQVZiYi9jbzJMZXd6L09EOTJGT0kvelNlSWhk?=
 =?utf-8?B?YXRUc3FBTjluWGZOVTk1M1M5MzBsTUhNZW5LaVRXV00zZ1hNeEpWUkZmdTJM?=
 =?utf-8?B?WUtWdkZDcndEdFV6MlF4S0FJOVBDQU1mR25nYjJVV3VnbjhJcG1vZWRVMTdB?=
 =?utf-8?B?SEVtbjlpc3BVT1gySnhtd0ZWd2tpc0M4em92eDBCanBKeFQyZC90ZEQ1cGlD?=
 =?utf-8?B?SlVZWkx0eUFBNDYzTEVvQWZHVlliSDE1a3lGRnBmdGd1Rk9xdjJWbk44bHBC?=
 =?utf-8?B?a0VTK1kyTTJjOGVDTWNmTnllMHhiK0tsUGJoUUgzeFNxcGl2c2hqM25YU3RS?=
 =?utf-8?B?RTA0aFp4aFArVHkzTFFvRWFwT3ZnMzZDcTVYbTVaL0JSaGx6S3NwTjE3bUdz?=
 =?utf-8?B?MGkzWEpleEdCNGRjQ1lUOFVTaERQWWlsU3NSRnh2d3JQSzVPQkdPM2xaYnBE?=
 =?utf-8?B?bWJSTXEvcjhDTzYrYjZZd2ZCbHZIV1YxYTZtMFQvSlcyZWdGcGthWktrWGRS?=
 =?utf-8?B?SEJZQ2orL3JYcHpNUTBNejJ1eEQ0VkVzK1ZHUVJNYWNTM21sSFd5OVprRk1m?=
 =?utf-8?B?TW00Vm1GeVU3cGF5aStsVXlOQkdVZVFxaHZBZ2hSNU01aDVvcm45M00rOEUy?=
 =?utf-8?B?MktvdHBYTFFZdktZcHVjaUJMbVZqS05kVmtTUlI1R0pYWmdZQk1xZG5BODVG?=
 =?utf-8?B?S1FSbGgwa0tVN05LajRCb1N2d3ZCUkpubHNNdWcxSnRLaUtNaElMcTYvbGdX?=
 =?utf-8?B?dTFlNXo2dkExTW9vb216b2NJMThrYnlDSzRGMFc3SHU5QUlYVlVNN3FyWjVn?=
 =?utf-8?B?cmRmN2pwblUvZ3ZYSW9lQUZ6ZVpFalNpRTY0WldkSXA2elp3ZWVJMS9TSG1a?=
 =?utf-8?B?ZC9tUVpPOGpIWHJ0R2JPcUFYTmNFYWIzc3A3RG0xT1pSWTRSaWhQdFhiUnVH?=
 =?utf-8?B?U2cwOFY4NTJEUHF6TjdEUko3bFhQRUd5ZkxYNkxGaE85Y3dUS0d2ckpNV2ZC?=
 =?utf-8?B?LzA3aHk3dERUR3B3dk94ZzBsYXllWnVJdWUxa21Iek9DOTk3eVdocjNHVEl4?=
 =?utf-8?B?N2VIdVFySHVhRHJabjRqb1hmclB2QlFaVDAySGp1SWtUQjYwVkVKS3FUamxM?=
 =?utf-8?B?V2tXYllaV0ttU1hyNHZsZFIwc3NtMzk5WnpOYmwyWWVlMjR6SXR3Yjg2TVB3?=
 =?utf-8?B?Lzg2ZHhqOGxLUlpkTjAxUEJwU3BHL1dpbnRIdEdUYXJ6eFV1RTU4QjVrRGZn?=
 =?utf-8?B?Qms5dDNaY010UTFjZURPQ0hkN3pQMCtRaExKWm5PazUwWlpHSlNFcFpEOGVX?=
 =?utf-8?B?cHl0dFBHUjNNTEV6aHZZb2plUWdvRWZqdi9PQTgwR0t4dVU2NVhYL2xuQ0ZL?=
 =?utf-8?B?YVBsRHNLQU5IYkNweHh3Mk5jRHZ2WEs2NHB6MFJ0ZitxWHdDOUVtSEFKQ0Fy?=
 =?utf-8?B?VjA0Z0dCY1pobVh1c3cvb3dzZkhRQk9xNjk3TkJ1NDluSlh1OHlQNnFoajgx?=
 =?utf-8?Q?TximOVRp2RfFc2nI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <103DC1F7192CF347A7D18CEBBF820E80@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qykpcIpZ+wUn3IDDJj3cnSMFQeIMkPJLVYTuSsVc17Q3j1aoAA7RO8OWNzMmbH4621I0CL0PGf4YBxIH85+aDnxncNmPQfiiiO9IPsyC/3dCP+7PEDJyh3TSvQQg6jSoCvAEiRZtHwXCVgOPTe8WMar/rGaFc7Xv8i0XWIWSWsJmDIdYldromQrnFKNOelRYlhstS7YSPhI7osupjwRerMd3xAXt8FxIMjscYdFCWKBGB6e04cJohUB4MtvPGanqmpIQPwHHIRF5RVNLHN+4rdtdN7/V3clmrevXgI3ay9nzcDBjXBvouc1XLdb8oIqP7D5gyLgUGjCmcMLM5ty0mg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8c0a4a-b80d-4660-1973-08debb322d4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 14:22:11.5264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rmqL53mCAvwNBc1NtXSkBT2tdEGQ4ADX9GldIEvxW/1yyELCLhHvagIrt4+DEwitnp0Ma3dpKnpa0OTGhZuXLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
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

T25lIG1pbm9yIHJlcXVlc3QgZm9yIGNvbW1lbnRzLCBidXQgTEdUTSBvdGhlcndpc2U6DQoNClJl
dmlld2VkLWJ5OiBSeXN6YXJkIEtub3AgPHJ5c3phcmQua25vcEBpbnRlbC5jb20+DQoNCk9uIFRo
dSwgMjAyNi0wNC0yMyBhdCAxMjo1NSArMDIwMCwgWmJpZ25pZXcgS2VtcGN6ecWEc2tpIHdyb3Rl
Og0KPiBBZGQgbGlzdCBvZiBmaWxlbmFtZXMgd2hpY2ggd2VyZSBjcmVhdGVkIGJ5IGhvb2tzIGlu
IGF0dGFjaG1lbnRzIGRpcmVjdG9yeQ0KPiAobGlrZSBHdUMgbG9nIGNvcHkpIHRvIHJlc3VsdHMu
anNvbiBmb3IgYWxsb3cgcHJlc2VudGluZyBpdCBpbiBDSS4NCj4gQWJzb2x1dGUgcGF0aCB0byBh
dHRhY2htZW50IGRpcmVjdG9yeSB3YXMgYWRkZWQgdG8gcmVzdWx0cy5qc29uDQo+IGFzIHRoaXMg
aXMgbmVjZXNzYXJ5IHRvIGJ1aWxkIGZ1bGwgcGF0aCB0byBhdHRhY2htZW50IGZpbGUgcmVsYXRl
ZCB0bw0KPiB0ZXN0L3N1YnRlc3QgbmFtZS4NCj4gDQo+IER1ZSB0byBsYWNrIG9mIHVzZXJkYXRh
IHBvaW50ZXIgaW4gbmZ0dygpIGltcGxlbWVudGF0aW9uIG1haW4ganNvbg0KPiBvYmplY3QgaXMg
cGFzc2VkIHZpYSB0ZW1wb3Jhcnkgc3RhdGljIHZhcmlhYmxlLiBJdCBzaG91bGRuJ3QgYmUgdGhl
DQo+IHByb2JsZW0gYmVjYXVzZSByZXN1bHRzLmpzb24gaXMgY3JlYXRlZCBpbiBzaW5nbGUgdGhy
ZWFkLiBUaGlzIGNoYW5nZQ0KPiBpcyBub3QgdG9vIGVsZWdhbnQgYnV0IGFsbG93cyB0byBtaW5p
bWl6ZSB0aGUgY29kZSBjaGFuZ2UgYW5kIGlzDQo+IG11Y2ggZWFzaWVyIHRvIHJlYWQgY29tcGFy
aW5nIHRvIHJlY3Vyc2l2ZSByZWFkZGlyKCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmll
dyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gQ2M6IEth
bWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFJ5
c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4NCj4gQ2M6IEtyenlzenRvZiBLYXJh
cyA8a3J6eXN6dG9mLmthcmFzQGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBL
YXJhcyA8a3J6eXN6dG9mLmthcmFzQGludGVsLmNvbT4NCj4gLS0tDQo+IHYyOiB2ZXJpZnkgZ2V0
Y3dkKCkgZG9lc24ndCBmYWlsIChLcnp5c3p0b2YpDQo+IC0tLQ0KPiAgcnVubmVyL3Jlc3VsdGdl
bi5jIHwgODQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgMSBmaWxlIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9y
dW5uZXIvcmVzdWx0Z2VuLmMgYi9ydW5uZXIvcmVzdWx0Z2VuLmMNCj4gaW5kZXggMjlmYzVjYmIx
NS4uYTc4YTZmM2QwNSAxMDA2NDQNCj4gLS0tIGEvcnVubmVyL3Jlc3VsdGdlbi5jDQo+ICsrKyBi
L3J1bm5lci9yZXN1bHRnZW4uYw0KPiBAQCAtMSwxMSArMSwxNCBAQA0KPiAgI2luY2x1ZGUgPGFz
c2VydC5oPg0KPiAgI2luY2x1ZGUgPGN0eXBlLmg+DQo+ICsjaW5jbHVkZSA8ZGlyZW50Lmg+DQo+
ICAjaW5jbHVkZSA8ZmNudGwuaD4NCj4gKyNpbmNsdWRlIDxmdHcuaD4NCj4gICNpbmNsdWRlIDxp
bnR0eXBlcy5oPg0KPiAgI2luY2x1ZGUgPHN0ZGlvLmg+DQo+ICAjaW5jbHVkZSA8c3RyaW5nLmg+
DQo+ICAjaW5jbHVkZSA8c3lzL21tYW4uaD4NCj4gICNpbmNsdWRlIDxzeXMvc3RhdC5oPg0KPiAr
I2luY2x1ZGUgPHN5cy90eXBlcy5oPg0KPiAgI2luY2x1ZGUgPHVuaXN0ZC5oPg0KPiAgDQo+ICAj
aW5jbHVkZSA8amFuc3Nvbi5oPg0KPiBAQCAtMjcxLDYgKzI3NCwxOSBAQCBzdGF0aWMgc3RydWN0
IGpzb25fdCAqZ2V0X29yX2NyZWF0ZV9qc29uX29iamVjdChzdHJ1Y3QganNvbl90ICpiYXNlLCBj
b25zdCBjaGFyDQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gIA0KPiArc3RhdGljIHN0cnVjdCBq
c29uX3QgKmdldF9vcl9jcmVhdGVfanNvbl9hcnJheShzdHJ1Y3QganNvbl90ICpiYXNlLCBjb25z
dCBjaGFyICprZXkpDQo+ICt7DQo+ICsJc3RydWN0IGpzb25fdCAqcmV0ID0ganNvbl9vYmplY3Rf
Z2V0KGJhc2UsIGtleSk7DQo+ICsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiAr
DQo+ICsJcmV0ID0ganNvbl9hcnJheSgpOw0KPiArCWpzb25fb2JqZWN0X3NldF9uZXcoYmFzZSwg
a2V5LCByZXQpOw0KPiArDQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiAgc3RhdGljIHZv
aWQgc2V0X3Jlc3VsdChzdHJ1Y3QganNvbl90ICpvYmosIGNvbnN0IGNoYXIgKnJlc3VsdCkNCj4g
IHsNCj4gIAlpZiAoIXJlc3VsdCkNCj4gQEAgLTExNDIsNiArMTE1OCw3MSBAQCBzdGF0aWMgYm9v
bCBmaWxsX2Zyb21fZG1lc2coaW50IGZkLA0KPiAgCXJldHVybiB0cnVlOw0KPiAgfQ0KPiAgDQo+
ICtzdGF0aWMgc3RydWN0IGpzb25fdCAqdG1wX3Rlc3RzOw0KPiArc3RhdGljIGludCBmdHdfYXR0
YWNobWVudHNfbGlzdChjb25zdCBjaGFyICpmcGF0aCwgY29uc3Qgc3RydWN0IHN0YXQgKnNiLA0K
PiArCQkJCWludCB0eXBlZmxhZywgc3RydWN0IEZUVyAqZnR3YnVmKQ0KPiArew0KPiArCXN0cnVj
dCBqc29uX3QgKm9iaiA9IE5VTEwsICphdHRvYmogPSBOVUxMOw0KPiArDQo+ICsJKHZvaWQpc2I7
DQo+ICsJKHZvaWQpZnR3YnVmOw0KPiArDQo+ICsJc3dpdGNoICh0eXBlZmxhZykgew0KPiArCWNh
c2UgRlRXX0Y6DQoNCkl0J3Mgc2xpZ2h0bHkgdW5jbGVhciBob3cgdGhpcyBpcyBwcm9jZXNzaW5n
IHRoZSBwYXRocywgYSBjb21tZW50IHdpdGgNCmV4YW1wbGUgYXJnIHZhbHVlcyB3b3VsZCBiZSBu
aWNlLiBGdW5jdGlvbmFsbHkgSU1PIGl0J3MgZmluZS4NCg0KPiArCQljb25zdCBjaGFyICphdHRk
aXJrZXkgPSAiYXR0YWNobWVudHMtZGlyIjsNCj4gKwkJY2hhciAqcCwgKmN1cnJwYXRoID0gKGNo
YXIgKikgZnBhdGggKyAyOw0KPiArCQljaGFyIGN1cnJkaXJbUEFUSF9NQVhdOw0KPiArDQo+ICsJ
CXAgPSBzdHJzdHIoY3VycnBhdGgsICIvIik7DQo+ICsJCWlmICghcCkNCj4gKwkJCXJldHVybiAt
MTsNCj4gKwkJKnAgPSAnXDAnOyAvKiB0ZW1wb3JhcnkgZm9yIGFjcXVpcmluZyB0aGUgcGlnbGl0
IG5hbWUgKi8NCj4gKwkJb2JqID0gZ2V0X29yX2NyZWF0ZV9qc29uX29iamVjdCh0bXBfdGVzdHMs
IGN1cnJwYXRoKTsNCj4gKwkJYXR0b2JqID0gZ2V0X29yX2NyZWF0ZV9qc29uX2FycmF5KG9iaiwg
ImF0dGFjaG1lbnRzIik7DQo+ICsJCSpwID0gJy8nOyAvKiBicmluZyAnLycgYmFjayAqLw0KPiAr
CQlqc29uX2FycmF5X2FwcGVuZF9uZXcoYXR0b2JqLCBlc2NhcGVkX2pzb25fc3RyaW5nbihjdXJy
cGF0aCwgc3RybGVuKGN1cnJwYXRoKSkpOw0KPiArCQlpZiAoZ2V0Y3dkKGN1cnJkaXIsIFBBVEhf
TUFYKSAmJiAhanNvbl9vYmplY3RfZ2V0KG9iaiwgYXR0ZGlya2V5KSkNCj4gKwkJCWpzb25fb2Jq
ZWN0X3NldF9uZXcob2JqLCBhdHRkaXJrZXksDQo+ICsJCQkJCSAgICBlc2NhcGVkX2pzb25fc3Ry
aW5nbihjdXJyZGlyLCBzdHJsZW4oY3VycmRpcikpKTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBG
VFdfRFA6DQo+ICsJCWJyZWFrOw0KPiArCWRlZmF1bHQ6DQo+ICsJCXJldHVybiAtMTsNCj4gKwl9
DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGJvb2wgZmlsbF9mcm9t
X2F0dGFjaG1lbnRzKGludCBpZGlyZmQsIHN0cnVjdCBqc29uX3QgKnRlc3RzKQ0KPiArew0KPiAr
CWNoYXIgYXR0bmFtZVszMl07DQo+ICsJaW50IGF0dGRpcmZkOw0KPiArCURJUiAqY3VycmRpcjsN
Cj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJc25wcmludGYoYXR0bmFtZSwgc2l6ZW9mKGF0dG5hbWUp
LCAiJXMiLCBESVJfQVRUQUNITUVOVFMpOw0KPiArCWlmICgoYXR0ZGlyZmQgPSBvcGVuYXQoaWRp
cmZkLCBhdHRuYW1lLCBPX0RJUkVDVE9SWSB8IE9fUkRPTkxZIHwgT19DTE9FWEVDKSkgPCAwKSB7
DQo+ICsJCWZwcmludGYoc3RkZXJyLCAiRXJyb3Igb3BlbmluZyAnJXMnIGRpclxuIiwgRElSX0FU
VEFDSE1FTlRTKTsNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArCX0NCj4gKw0KPiArCWN1cnJkaXIg
PSBvcGVuZGlyKCIuIik7DQo+ICsJZmNoZGlyKGF0dGRpcmZkKTsNCj4gKw0KPiArCS8qDQo+ICsJ
ICogZnR3IGRvZXNuJ3Qgc3VwcG9ydCBwYXNzaW5nIHVzZXIgZGF0YSBzbyAqdGVzdHMgaGFzIHRv
IGJlDQo+ICsJICogc2V0IHRvIHNvbWUgZ2xvYmFsIGZvciBiZWluZyB2aXNpYmxlIGluIGNhbGxi
YWNrIGZ1bmN0aW9uLg0KPiArCSAqIEFzIHJlc3VsdHMuanNvbiBpcyBub3QgcHJvY2Vzc2VkIGlu
IG11bHRpcGxlIHRocmVhZHMgaXQgaXMNCj4gKwkgKiBub3QgYSBiaWcgcHJvYmxlbS4NCj4gKwkg
Ki8NCj4gKwl0bXBfdGVzdHMgPSB0ZXN0czsNCj4gKwlyZXQgPSBuZnR3KCIuIiwgZnR3X2F0dGFj
aG1lbnRzX2xpc3QsIDQsIEZUV19QSFlTIHwgRlRXX0RFUFRIKTsNCj4gKwlmY2hkaXIoZGlyZmQo
Y3VycmRpcikpOw0KPiArDQo+ICsJcmV0dXJuIHJldCA/IGZhbHNlIDogdHJ1ZTsNCj4gK30NCj4g
Kw0KPiAgc3RhdGljIGNvbnN0IGNoYXIgKnJlc3VsdF9mcm9tX2V4aXRjb2RlKGludCBleGl0Y29k
ZSkNCj4gIHsNCj4gIAlzd2l0Y2ggKGV4aXRjb2RlKSB7DQo+IEBAIC0yMjMwLDYgKzIzMTEsOSBA
QCBzdGF0aWMgYm9vbCBwYXJzZV90ZXN0X2RpcmVjdG9yeShpbnQgZGlyZmQsDQo+ICAJCWZwcmlu
dGYoc3RkZXJyLCAiRXJyb3IgcGFyc2luZyBvdXRwdXQgZmlsZXMgKGRtZXNnLnR4dClcbiIpOw0K
PiAgCX0NCj4gIA0KPiArCWlmICghZmlsbF9mcm9tX2F0dGFjaG1lbnRzKGRpcmZkLCByZXN1bHRz
LT50ZXN0cykpDQo+ICsJCWZwcmludGYoc3RkZXJyLCAiRXJyb3IgcGFyc2luZyBhdHRhY2htZW50
cyBkaXJlY3RvcnlcbiIpOw0KPiArDQo+ICAJb3ZlcnJpZGVfcmVzdWx0cyhlbnRyeS0+YmluYXJ5
LCAmc3VidGVzdHMsIHJlc3VsdHMtPnRlc3RzKTsNCj4gIAlwcnVuZV9zdWJ0ZXN0cyhzZXR0aW5n
cywgZW50cnksICZzdWJ0ZXN0cywgcmVzdWx0cy0+dGVzdHMpOw0KPiAgDQo=
