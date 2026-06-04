Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708D0CD6E4A
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 05:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC92112646;
	Thu,  4 Jun 2026 05:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WK+aIzpL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890CA112646
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 05:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780550751; x=1812086751;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6HQ01XvuU854h4oyTdVGkQIw257nlnXx3KsqcaKZvPE=;
 b=WK+aIzpL6z/4lku7OslO0SyEny33+K5XDKN1ltKWe4H20MIbjy3zvPLZ
 EU+1fpp04pqsx+xnkoFXDCaRVbKpkbk3sgt4cB/7mKqOXIx/iaLx79dRZ
 5BPkebMcUQGa0fiybSrd+gEOF8FMTor2YmLjp1gL5PnK/Xj9v1lmRaOZ8
 MAXNtbS0OobgA5W9ypj+uK+Q/CXj6n/UrDtNoTBRj4N9UnM8d7vlcoL7E
 alFldecDhJq1H4KqTLL0niyNt8hCi3Ur4+Sl12gNT62tJqfgdG6OgALWu
 TzKkxM3O3s+0M7nS6xRYfGo2JSDqtqSBJL0oEspRjyG1XOBYcpMsk6EHk A==;
X-CSE-ConnectionGUID: hlA8XalfQDGtvfFxVE5V4g==
X-CSE-MsgGUID: zVVXaxS3RfGFCz3Y5l+KAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92055395"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="92055395"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 22:25:50 -0700
X-CSE-ConnectionGUID: +1dinZFUSUqfPQl+bDVQkA==
X-CSE-MsgGUID: oZYEefh9TZOAgcuuqRNPTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="274681668"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 22:25:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 22:25:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 22:25:48 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 22:25:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIAshwXP3KlQIW6K3oqPNE07UPa4ioaPRxWMbfQ0a/BJv/MjcFxtxXH1k/3smgNGedyGNoGUHOpN4fBk94X51AUInxhwMELyo9+WHu+yZ8RUv+pUWxA+i6dncIbTSHPj0z+L5m8asN5rRhKke9L3M+hlCE5rjYerBA98zJ1WpjDKrDfAaQkgypdDUmy9DIhaTAB5G07xmh7grq8p2yCB8NL6ig5SSSHGP/HHzNiqIKjcBeaH/hMnkGrqYjbCEV2jHKJL1qTDcRVnwNPCO8qBcQThsUa6S9mZQic6H1LGVzcj0QdonFw8Ra1oIhgWV9M5Aaxgs2cEJnp5jWBvhZ1YOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HQ01XvuU854h4oyTdVGkQIw257nlnXx3KsqcaKZvPE=;
 b=daPFsdtzTGlmgv3BD7vcP41X/79P2NOk0eLxfEIHAVWBqdm6sywOq1t4jbgZxX7TwFGFnFLDuscEMpbW54gchab/i+N0ys2ihPgSxXbpEwdD4gACQ/P52KmdwfQQUi0PSWm64BV9elIl9+mprEge1/1Zvew947QjeFjI/LY26twn65rTsGIqhK+Qv0S/iRTU/s+vOOFFW+dy5y1cKoVhelX9mwuilf5EbGx3/yrw7ScGXhQMpinCteefrIEVvAXvPTH6bFkR3TCiRaj5889nAqI+/S4+3iedOhiW8xXrfNNckzU0ARA21gxmJZyvdn/eMUJ5NvDIxDuoQtaEuwI46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by DS7PR11MB7739.namprd11.prod.outlook.com (2603:10b6:8:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 05:25:45 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 05:25:44 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 3/3] tests/intel/kms_pipe_stress: use
 ARGB8888/LINEAR for cursor framebuffer
Thread-Topic: [PATCH i-g-t v1 3/3] tests/intel/kms_pipe_stress: use
 ARGB8888/LINEAR for cursor framebuffer
Thread-Index: AQHc7aYyfIUh5S+LRkCsediBseimlbYq6RoAgAAUnwCAAur8YA==
Date: Thu, 4 Jun 2026 05:25:44 +0000
Message-ID: <PH7PR11MB67962EAB8A9AF72FC7D4B568E5102@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260527071940.3285269-1-sowmiya.s@intel.com>
 <20260527071940.3285269-4-sowmiya.s@intel.com>
 <111a1f1e-7ccf-4ec3-8831-9cd860cd9b55@intel.com>
 <PH7PR11MB6796EFC6242DBB614136D304E5122@PH7PR11MB6796.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6796EFC6242DBB614136D304E5122@PH7PR11MB6796.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: chaitanya.kumar.borah@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|DS7PR11MB7739:EE_
x-ms-office365-filtering-correlation-id: 1a3680b6-1686-473e-f484-08dec1f9ba43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|3023799007|22082099003|18002099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: gLeb/RAC6MNR6Q82P7MOBJMHbviUZoIvglowcy2OdfsmkvY9EhZ1bcAzsndM2bXyf1yoNri/9xiCAQxbhll4MY1GfWYXyGIDQXdZx9gB2bj92Y2BlBcdHHaNJ0iF8+EEf5Jw0QOg3LPAVuD8/9T76qoXx70Fss2feYYVIyzZDc5gjAQt4VZMyETimW+XZqx15v58Epw8//km/PTBxbHMoDIlB+L7nHQQuIw/25uJTpV3pOUWOKBfJclHYhcfWV+H5ssc4hVS2vI67yJzqxOyQ8/MWrdk6A8urGH4pzfuxFhE+eAVLHfOuZznS258JTLEB+DbGCZ77URjZxd0L4HunVQ3XQRnPGqxK+lWtBuxwIz/imcqPYv/36ea2AONXEPqhaMrjpmQpTSKq/KFnSgnfX9JKg37Ug4mydICyUbx8kgbiVMXtTT5QdChXHjnTF3kbVKJGIbrcOY6UOEUd7BFQ1V1DEbTGkt5fmNnBXuTKXsqaQnUvIuZuEj4GIP/GGFe95AIT5L6HxzRaWPAIZI720OZBrY3RSQnntaTJaZ9MPi03hEo7sjlETiycKUBu242ubhqs30Ck9PL1G52zCaIQxvvrJG1WREgyGrY+GWKgrwmEqo9U97TdMaeixhF8F+oeeDQE5LL5NDUx/Dk6edSN1ngIj8b95pQHzbtaiFHupyfGh/jCYoexTBNiIRyvo6Q9PvG6H397P/BADIywuiLWJUalq/8HfF3kKfWtg6ucChrnzR+4+VowewHOwXvHyIf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(3023799007)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3ZGemdzKzZvb3JZZnBaR0hlSmR2Mjl5RU04MkhtdVJ0NzFOL0FPZzRyS1kw?=
 =?utf-8?B?UXJ5Mk96eGxub3hBQ05iMjhMRXdpTUxyTk9IZzFhbmsxZWRBMGlVT2hadkgw?=
 =?utf-8?B?aVNwQXZxYittWEtva2hWR0VSakR0azVYaHNrdXBKZUFub2VPMXRJZ0g5MHBU?=
 =?utf-8?B?S1JZYVd3VHZKbzQ1V2JLRmVnZlNpRTB2V3Vnb1NpVWZPdzNSazd0MXhGS25S?=
 =?utf-8?B?UzZ3ZTdBRlhoUzBEMG5NTjNyd3VQdDFvV3NlK2xIZVk0dEd6Zm4ydXRhbnpx?=
 =?utf-8?B?anpjWUoxd0dWNUhnUEJNOGpiTnlYVDJKRjRudjRReHV4ZWs2cVZLdDQ0T04v?=
 =?utf-8?B?MnVPVGR2eHRLZmovRlpQN1Y0WDJhMW5PSTFDaGE5VkhPdEJMQ0lHcGV6V1oy?=
 =?utf-8?B?cmlxY0VTMWJaV2RqamJmU3lVcGZrckR5ay9BenJhaDEzOElONUVjV3NrUk0r?=
 =?utf-8?B?bFdvWlVTTDZ1eTB6S1A0Nlh4a3FGdDJPNEJFMHNuWDFkZDEwQThBeEJobzNr?=
 =?utf-8?B?akpvMnVlVTFzSzlHYkxpY00rWGpXTldoeXdGRU1GQ1pkd1RNdzArNXhBM3dz?=
 =?utf-8?B?dXg1Rjc3bUJzblJnelVEOWI2RTB3SElZR2l5cUZJNjY3K1FXNjhyVFdaR2tN?=
 =?utf-8?B?Ly9jU3Y3NHJ1S2Rtb2w0VUV6RkdLdUw1dnVyTndnUGVJOUtZNXVOTUViVlZR?=
 =?utf-8?B?QjJtZlVsN2kyM2xRajA0L25pUlJaZml3aUZINnhacFZIdk5Cc0cwblhyVk5u?=
 =?utf-8?B?M29XTHBuVWttOWdJdGt3V2xLNVQrSFFGTDRUVEk1RmwzTzVLdGdKbi9xcVlv?=
 =?utf-8?B?UzVwM0Q2dGxRWG5FdUFFc2dldzl6eTg3RVorYStQTW5jb0tvM3d6WDNuUVN3?=
 =?utf-8?B?Y0JmdVVZWEZtblB6dFAvTXZtNmQwajdvQXBRamh5aHNwUUZYcTZKZ3JFVW9T?=
 =?utf-8?B?TmZFUmFOYXJobjY2aHRQNmVhcHRkdWJNK3hoNUl2NEFFTVB6NWNpMzJHZ2hO?=
 =?utf-8?B?RlpXdk1iOVJiOW5ib0FPNXg5SlFqNEdiaCt2eXdkWXRhMTRyWWNjY2VtMXl4?=
 =?utf-8?B?T0F3QXBhd2tBM1FqdlpOUUVOYkJhZENiTGJQRnRuY29mTkpRTTl5b1pnczZY?=
 =?utf-8?B?Ny9HdlVYdUJFWkgzdFVGNmFNU2NJbzlvSzFuUW5jT296MGxHRldJNE1Ubnc3?=
 =?utf-8?B?WWRGSjdlclVrS0pOZU96eFdSR24wRVNEaFJZZnQ5VUoxWmNNbXVEUENZTEJD?=
 =?utf-8?B?dzhlWHlaQ29SSFVHSUdrbHdFRTY2WkhxdGJ1d1ZqRHBLTHUzbXBGajFkLzdO?=
 =?utf-8?B?VmNNdFMwYS9oRk9qYklNQ2JoZFZOc0VGWHhwUnFsRXpCMG9qM0QySUM1MHpl?=
 =?utf-8?B?QXMyNU5MQWhkVXlzNCs2dFVzUkttbGZkeTB1WTV6ZzJtZ1BGYWFwNzFWTFdQ?=
 =?utf-8?B?S3F3cW8wVkx5Vi93eWx5alp3Nm92Tk9hUVJ3SDFDRGhDcXdUbXFqSFlvSE0v?=
 =?utf-8?B?M2dMbzVLVmg5Z0RZUy9aYlVTamNQTzBiem8yMjlZaGUzV2NZOTNkajRwVjdQ?=
 =?utf-8?B?NkJLRmkzc011SXlHRjk5ZUp6VDJsc2lKQytRZitrT0ZQUmwrMUJYU3pSUW9X?=
 =?utf-8?B?MG9tU1E2bzZ6WjVtSUpvTjh3VWJpQk5lTjU4RVpST0t2SlF1WkZ0c1AvS2Jq?=
 =?utf-8?B?ZFBUUzBIaHNueDFsWUllazVieWdGbFFrK3VVWlN5VXgvWEptRnl0ZnhnSWpH?=
 =?utf-8?B?RFdiSDRNQUdoZHlGbmZwK2RJd3ovSjljOWM2OUpzejFhRjN4SUlEYk9DUUpZ?=
 =?utf-8?B?M2FkVktQcXNYN2dHTlloeGV2MGxtazYrNEJDOXZLaW9BejRqME5US3VCV2Rm?=
 =?utf-8?B?Q0dpaHBZbGhaYytYa0R1UHVueDh3SyszNEhTVU02TDVPYkJMcnRXZGQwSldz?=
 =?utf-8?B?eTdUeHNaTzNKWi9TTmcvS3VJWENNK1NIVnYzYkRlMkdMV1Q3REU3enZPemxw?=
 =?utf-8?B?bVJhK1c2dmdOQy9JSjJmZWE4MzM5Q2ZsTkN3Szl2U1NzMXVubjdZcG5LVDFW?=
 =?utf-8?B?QitlZklsa2QyMTZYNTB6Y1BBOERZMFIyS2Z6MEUxeFZ1SVRXYmZrZEo5MnhG?=
 =?utf-8?B?Qzc5RXZWZTY5Nm5MVHVDSFVzT0xuRkVZTTV2V1R6ZXhrM3ZPbXVHL2hwTk9w?=
 =?utf-8?B?enFFT0RpT1NwUko5K0o3bEFYbnhYMHhqK3A3bWdRdDVwWU9uVkpRS2czdmNM?=
 =?utf-8?B?aUVjbHlvMi96RGcrMTc4ek1GSzhDMDZQOFp5YWNlenY2aE93eTRSUmdyR1BQ?=
 =?utf-8?Q?lOjcv72HHVWIExYIvK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Lk3+i8k8o3qn58hUBVPYBzBmbyLwJfC3t0Ahk4SUHjawGq8mOw4XC+l53zVMXc2scqcxrQyPC6C9sWBJ3Ly3I+nX9yETFjOdXcqsHjNIXmR9z2gHrCTrR0El1u+QgW2yNrHTXPlnxvCBEX0+2ioSRDJjN0LwiKuCCqKOgNYKHi5g5JvaweZhhvHQGpZlJYITok1aAI6/QV/zxDEtiwVv5F6lr2nT+By7HyOQpdQ0r0gghldSAJ/oNNW7bUubaABz1q+zBmQLDFhf73iCZShboUxF5Ba9X4TzLYnXl+94BKRV3gFx1teyDxck6f4KD25G1dIE/nYgFCie45AxjNbpCw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3680b6-1686-473e-f484-08dec1f9ba43
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 05:25:44.8870 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D1vkqXoyZjBXaYsiSFuigBdAybzvB4T9hWzjchMTJ2khHImCD3gvXmYPCXwAIJxuaKxnCIYk7wzxfkpW8RCEKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7739
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

SGksIEBCb3JhaCwgQ2hhaXRhbnlhIEt1bWFyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IFMsIFNvd21peWENCj4gU2VudDogMDIgSnVuZSAyMDI2IDE0OjIxDQo+IFRv
OiBCb3JhaCwgQ2hhaXRhbnlhIEt1bWFyIDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29t
PjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCIFMsIEthcnRoaWsg
PEthcnRoaWsuQi5TQGludGVsLmNvbT47IFNoYXJtYSwgU3dhdGkyDQo+IDxzd2F0aTIuc2hhcm1h
QGludGVsLmNvbT47IE5hbGFkYWxhLCBSYW1hbmFpZHUNCj4gPHJhbWFuYWlkdS5uYWxhZGFsYUBp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggaS1nLXQgdjEgMy8zXSB0ZXN0cy9pbnRl
bC9rbXNfcGlwZV9zdHJlc3M6IHVzZQ0KPiBBUkdCODg4OC9MSU5FQVIgZm9yIGN1cnNvciBmcmFt
ZWJ1ZmZlcg0KPiANCj4gSGkgQEJvcmFoLCBDaGFpdGFueWEgS3VtYXIsDQo+IA0KPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8
Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gPiBTZW50OiAwMiBKdW5lIDIwMjYg
MTM6MDQNCj4gPiBUbzogUywgU293bWl5YSA8c293bWl5YS5zQGludGVsLmNvbT47IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IEIgUywgS2FydGhpayA8a2FydGhpay5iLnNA
aW50ZWwuY29tPjsgU2hhcm1hLCBTd2F0aTINCj4gPiA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+
OyBOYWxhZGFsYSwgUmFtYW5haWR1DQo+ID4gPHJhbWFuYWlkdS5uYWxhZGFsYUBpbnRlbC5jb20+
DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2MSAzLzNdIHRlc3RzL2ludGVsL2ttc19w
aXBlX3N0cmVzczogdXNlDQo+ID4gQVJHQjg4ODgvTElORUFSIGZvciBjdXJzb3IgZnJhbWVidWZm
ZXINCj4gPg0KPiA+DQo+ID4NCj4gPiBPbiA1LzI3LzIwMjYgMTI6NDkgUE0sIFNvd21peWEgUyB3
cm90ZToNCj4gPiA+IEN1cnNvciBwbGFuZXMgb24gSW50ZWwgaGFyZHdhcmUgYWNjZXB0IG1vc3Rs
eQ0KPiBEUk1fRk9STUFUX01PRF9MSU5FQVIsDQo+ID4gPiByZWdhcmRsZXNzIG9mIHRoZSBvdmVy
bGF5DQo+ID4NCj4gPiB3aGF0IGRvZXMgbW9zdGx5IG1lYW4gaGVyZT8gRG9lcyBpdCBzb21ldGlt
ZSBzdXBwb3J0IG90aGVyIG1vZGlmaWVycz8NCj4gPg0KPiBTb3JyeSBmb3IgY29uZnVzaW9uLCBj
dXJzb3Igd2lsbCBzdXBwb3J0IG9ubHkgbGluZWFyIGFzIHBlciBic3BlYw0KPiBodHRwczovL2dm
eHNwZWNzLmludGVsLmNvbS9QcmVkYXRvci9Ib21lL0luZGV4LzUwMzY4P2N1c3RGaWx0ZXI9SW50
ZXJuYWwmbQ0KPiBvZGU9RmlsdGVyDQo+IFJlZ2FyZHMsDQo+IFNvd21peWEgUy4NCj4gDQo+ID4g
PiBmb3JtYXQgYW5kIG1vZGlmaWVyIHVzZWQgYnkgdGhlIHRlc3QgdmFyaWFudC4gVXNpbmcNCj4g
PiA+IGRhdGEtPm1vZGlmaWVyIChlLmcuIDQtdGlsZWQpIGNhdXNlZCAtRUlOVkFMIG9uIHRoZQ0K
PiA+ID4gY3Vyc29yIGNvbW1pdC4NCj4gPiA+DQo+ID4NCj4gPiBDdXJzb3IgYWxzbyBoYXMgSU5f
Rk9STUFUUyBwcm9wZXJ0eSBzbyBiZXR0ZXIgdG8gYmFzZSBpdCBvbiB0aGF0Lg0KPiA+DQo+IFRo
aXMgc2VlbXMgdG8gYmUgYSBnb29kIHdheSB0byBpbXBsZW1lbnQuIEkgd2lsbCB3b3JrIG9uIHRo
YXQuDQo+IFJlZ2FyZHMsDQo+IFNvd21peWEgUy4NCkFzIHRoZSBzY29wZSBvZiB0aGlzIHRlc3Qg
ZG9lcyBub3QgaW52b2x2ZSBjdXJzb3Itc3BlY2lmaWMgdmFsaWRhdGlvbiwgaXTigJlzIHByZWZl
cmFibGUgdG8gdXNlIGhhcmRjb2RlZCBwYXJhbWV0ZXJzIHJhdGhlciB0aGFuIGJhc2luZyBpdCBv
biB0aGUgY3Vyc29y4oCZcyBJTl9GT1JNQVRTIHByb3BlcnR5Lg0KUmVnYXJkcywgDQpTb3dtaXlh
IFMuDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTb3dtaXlhIFMgPHNvd21peWEuc0BpbnRlbC5jb20+
DQo+ID4gPiAtLS0NCj4gPiA+ICAgdGVzdHMvaW50ZWwva21zX3BpcGVfc3RyZXNzLmMgfCA0ICsr
LS0NCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX3BpcGVfc3RyZXNz
LmMNCj4gPiA+IGIvdGVzdHMvaW50ZWwva21zX3BpcGVfc3RyZXNzLmMgaW5kZXggYTg0NDMzYjlk
Li41MzYyZmU5ZjMgMTAwNjQ0DQo+ID4gPiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNfcGlwZV9zdHJl
c3MuYw0KPiA+ID4gKysrIGIvdGVzdHMvaW50ZWwva21zX3BpcGVfc3RyZXNzLmMNCj4gPiA+IEBA
IC03MzYsOCArNzM2LDggQEAgc3RhdGljIHZvaWQgY3JlYXRlX2ZyYW1lYnVmZmVycyhzdHJ1Y3Qg
ZGF0YSAqZGF0YSkNCj4gPiA+ICAgCQlpZiAoIWRhdGEtPmN1cnNvcl9mYltpXS5mYl9pZCkgew0K
PiA+ID4gICAJCQlpZ3RfY3JlYXRlX2NvbG9yX2ZiKGRhdGEtPmRybV9mZCwNCj4gPiA+ICAgCQkJ
CQkgICAgY3Vyc29yX3dpZHRoLCBjdXJzb3JfaGVpZ2h0LA0KPiA+ID4gLQkJCQkJICAgIGRhdGEt
PmZvcm1hdCwNCj4gPiA+IC0JCQkJCSAgICBkYXRhLT5tb2RpZmllciwNCj4gPiA+ICsJCQkJCSAg
ICBEUk1fRk9STUFUX0FSR0I4ODg4LA0KPiA+ID4gKwkJCQkJICAgIERSTV9GT1JNQVRfTU9EX0xJ
TkVBUiwNCj4gPiA+ICAgCQkJCQkgICAgMS4wLCAwLjAsIDAuMCwNCj4gPiA+ICAgCQkJCQkgICAg
JmRhdGEtPmN1cnNvcl9mYltpXSk7DQo+ID4gPiAgIAkJfQ0KDQo=
