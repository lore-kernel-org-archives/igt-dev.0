Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0488ACD5BD5
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 12:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABEA10E1E6;
	Wed, 27 May 2026 12:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWC0j/hx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFAF10E1E6
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 12:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779884973; x=1811420973;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KvHCvUCasiqKC7VFzFYJ6qMezKY70pBW6vO4YRZ6caQ=;
 b=jWC0j/hxe2973pz+V6VWF8RoTyC24k+dNevXktOa0CM58svkQpXIvfwd
 6CDvEPIa+foYyTKyg6NrKAosIW0hEZK2Uy7pHJf4M9oEJGaqCZWtOzomD
 QxqZvsz2Iv1wCcX1m/k6CrqPocfCF2PafhG4PgVUVs2WykoApz60y7vto
 7uKeoiE3KkhfOgPjZjb710sDy33v7JjIEv8SUyoOeofcxtawBjwlsR1D6
 MLcF0/OGSLkY+hDKEXbtQnpelrLcniXxbB4OigJqTB5kYabn+CHVuETLK
 W4DJKa5DkQk3OM10eHzR/OP9J/+TF+tECBu4nXyv+4rUpmxzw0auSXPMv g==;
X-CSE-ConnectionGUID: 26IodX78Sq+Kv1x/1ogIwQ==
X-CSE-MsgGUID: NX7tiD4YSiiXuqPd0KQXow==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84572500"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="84572500"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 05:29:32 -0700
X-CSE-ConnectionGUID: d7+7RHoIQge+UcQKCapKTA==
X-CSE-MsgGUID: eC/b42hWRdarOdLCRhIRUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="247309791"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 05:29:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 05:29:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 05:29:32 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 05:29:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaQ0rqMXElqO7ouN2Isc9j+JfRKejYEFxxXZPBGMX4Secuw4DaaIAeJhZKmyiD8whTnRRGZEqimLoRhJ1q2ca6V/YhyqPkz4bumdm39tmQEgsCNk6MaLemW+BAKOojUkQNyRpCig7amAKHjBmC9uHnFiITmM8xQHIdrjnFzxuS3THDj439ZeMa8Q7HSxWIyY7OmllkpuPBWW+jY6VilwkOC3SJmW6WBpBLiGIjoBn/8pK6uKY5/ENhPc8L/IkuMG9IyUB+MJkmUoEMqKEXX8Z2SnFS8/76WN1EbMSgcktTuHbkTn7/ESjmS9/9bilLNQ0sLd2rtNCTSA4hK80GX8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvHCvUCasiqKC7VFzFYJ6qMezKY70pBW6vO4YRZ6caQ=;
 b=CDNLcO25BJJW7a/0jqfVbXMHgaTrstG47C+mPi5miySDOP/PwEUoKXmGnIry9hDsuDWhycnOgQlL+ZY4Or/IpX/4wRQcpTmsp2uwCaD2K1AWLPrFAi7arH0cp0WoTwJLqM3jYWtUXeWNqvZYHNO6bnHyG2a7X+CH22mJyQXhswshTBmnFxljLYhdgRZUSvn4hXELgJpqkdxemW1rM2jmdQ17o1ZU8KO8FcD3pmIOnEr9Z+/qD+mhugnCcVYjJ3crM/C38VVW00FvIuzJzJUILHq1q4k6TteZbntr9uQwtNRL3w9RRQAg6LTwACS2pX/VnYTm//e5PVpgNIYiV0jjmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SA0PR11MB4701.namprd11.prod.outlook.com (2603:10b6:806:9a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 12:29:26 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 12:29:26 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, John Harrison
 <John.Harrison@Igalia.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kandpal, 
 Suraj" <suraj.kandpal@intel.com>, "Heikkila, Juha-pekka"
 <juha-pekka.heikkila@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5CVUlMRDogZmFpbHVyZSBmb3IgdGVzdHMva21zX2Nv?=
 =?utf-8?Q?lorop:_Assorted_fixes_and_support_for_i915/Xe?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0cy9rbXNfY29sb3Jv?=
 =?utf-8?Q?p:_Assorted_fixes_and_support_for_i915/Xe?=
Thread-Index: AQHc7IrSvqdXin67GkG/UfNrQby7ErYfQQMAgADaJQCAAbAOUA==
Date: Wed, 27 May 2026 12:29:26 +0000
Message-ID: <PH7PR11MB6796BC76D7DBA6E93D638794E5082@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260525203827.3155622-1-John.Harrison@Igalia.com>
 <177974334638.7222.8314337428486114681@6beec6c84f66>
 <7016a9eb-48a0-412e-8b27-fd9f29ed9dea@Igalia.com>
 <20260526102632.anrkkpoamv24n5v2@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260526102632.anrkkpoamv24n5v2@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: John.Harrison@Igalia.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SA0PR11MB4701:EE_
x-ms-office365-filtering-correlation-id: 6f90fe33-797c-4da3-1fdf-08debbeb9743
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700021|56012099006|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: 9OP1vOYK1v7WVqT6kd9wUYLPyU8oCNWfPAjc6Al9vsbHdnl9EgUuSn5E693EsjxMjRuqoi1PktrjY3gFUmEq4e0zKxliCROxG9SIItICaCrq5LumZxo6o4XHkoGRNSr4uRCleBVfQ/QXNVxu8a8HnPwK1+ciWzh7g7v2v92QyXf0wV586ZP3M3EmaqRINFbs/vdKxP/gjq4xY25+HSn4WNO+QD8Eilv6HPeGD9DmjNlopmtYMq+MJDcG0ogBjqskwMv3dCFzqcNzpHoTwLUxz9OhIYwcyQkc051/Uv53616JjHxCBPs3XYelAV03aKy2dZjZcGE5Sg5INCvg2Tgqx4NmFjW5NgSZgDCBuEqeQzonop/oqQ6qfG3eDcyr81z8fUr1EAENuYGjrB5SKWfnJ72id7jKwT8UhoMf8NBBmQ9u+MAVQqNnEVQcqOPvQxVeXEqZ6pmy8fYflqbjNZ+B980DSUxYmo8eonULy0dVZr6INarQEmzGD0jH4ybgzwl5rDvKVav/dts4p0HdeC0D5POs6RX/g48LH2Hqi5Vbt9ds3fD7Zbc7mDbhmD4VnshdA959y+Z3+AbMKdNmOdd/ltdu47Ov+PBa5OYqU9cKsrBpOzfURQ8GeKwrutVUum+vaEFOdHEFbYKl8usg42jjsVI8f9+sD/ltBzizl7inTmd+oH4OEz5vz/6y35jXvJZR5G6tMKeaI9NuBH3NaGnMZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGZFWm42WkZDTGRVamg3TGQ5QWY1V3ZucG1WUG11am85RXJ1Wjl1WlF3Ykx2?=
 =?utf-8?B?R0RHdDgyQ3ZiZzNhQ2FJQ1JEZjhqbzNyclBuQStNQU10RVR1NjhVWmtQVFRZ?=
 =?utf-8?B?WjFkK25wcUVBbzE2NVdMRGM4WE44SFdGaGt1Y3IvamtldDRVb2dxbzVzR21t?=
 =?utf-8?B?NXNLS2QrNXpVSW9KWWtyK0Q1L1JqL0t2WEREZXIwVXJUeFNqaXNDMEs3SVZ1?=
 =?utf-8?B?NXJRWWY0VDNyOThpTU0wZ1F1VEVUbDNGYXRidE56NnVRZlRyL2x4VTJ6ZzJI?=
 =?utf-8?B?TTJHd1liU3ZvL3E4Zk02TGlRWjVwWmJSSnQ1c0QzWUpjYU5OanJxNkIveDA4?=
 =?utf-8?B?VUJHblNvRmhtUURjb0ZpQVJhcnpVcjAvcFQvTzIzdTN5QythODlrUVpRcGQz?=
 =?utf-8?B?MUZ6ZnRha05VYUJ6Y0lvTlAraWhwd2VqUXhYTVJhK0dLOEFYWTg3RkhRNnA2?=
 =?utf-8?B?K1oxdHFSVENObnpJQThmZkR1ODl0K1J1K0tXRjNZUlJhcTVIb3FyNFZiUDg2?=
 =?utf-8?B?SENRRkxKZWJySWFTVkZsaDUzdVUzSTZpaVZadmVWWjZ3aERVZVJWdDhScndO?=
 =?utf-8?B?VzdabEU0blUzT0JmQmhTMy8rL2Q2K3ZlMmRtcUpYbng0THVJTU12dDFYSlZ6?=
 =?utf-8?B?SVpRNnFhZ3MzQVZ0cFRrTGcyQlViZmkxc0VpRFY3MmhuM2NBYXZRNUFvczQx?=
 =?utf-8?B?TFExNUdYYjM3ak83aUVLYUVGRzZwSzFFNUt4aW5RYW9lTCtVSWd2RHFXSk5T?=
 =?utf-8?B?ZHBIbnVmWFBRZ3NnY2pjbXJsWkRvS0MzdmNNSXpNTlpmcGhCZys2ckhsZE80?=
 =?utf-8?B?UHd5ektKaERsbDFudHM3Q1BIU1R1RHRrYzd0Z0E5WTNYRXFBMnh6R3lMcnVl?=
 =?utf-8?B?TDB0T1NuK243TXVFenZBdDBaVXJsYmxVY3o4aEs2eTBEYkM2TXRBMUhISDhZ?=
 =?utf-8?B?VjJ0cS9lNEFaTXRHK3dtTFZCOE05ZTVQNTI1L21aM2taeTBFS3pFL1pYcmI1?=
 =?utf-8?B?VGV4S05ad3NDdEptY3lvY1lZbTdiVDJSL013bDNmNzMraWliUlU4czlDVGVW?=
 =?utf-8?B?WjFzWEhhL1M5ckdDUFNoT1BzYkdCc0FnMVpEWnRHcGJqRVVyYjVKaTR5ODNU?=
 =?utf-8?B?ZDBZTWpDb2k3bTg0aTJwNDBjdjhXSEVxUmp5SHU3UisyQUh6aUo3Q3VCcFVz?=
 =?utf-8?B?Q0dVc0ZlQ1JabHZMRzBkZnlCZ2JnS2RUQ2sxQWlNRkpWdWFNM0NtbmM3YitT?=
 =?utf-8?B?NUdZUTI1TWpYQ3ZVSlpySVpFN1JJNmFURm5zM3ZkWnBBd3BJc05DZEpsaWFz?=
 =?utf-8?B?N2t5alREVE9ZNUUwNEYybUp4enUzcGJQL0FOeU5YNnhCa3VOdXpmQUIxWDhw?=
 =?utf-8?B?MnBzNm81UWluVXNYUlVjb3NadkZTbFJpYTRmZjRnUGpZa1hDZU5mMkZrdjE3?=
 =?utf-8?B?cWRiU0ZlMWY0UVdLU25iM3NId254YkJrWHVseG5kMEVkTE9zempFYWpidjhB?=
 =?utf-8?B?YXAzVlpoVDBKL2dubUppZ0pYNWtwTXhlRThtdTY0RVpEQ3pCR2VvbWVYZkpH?=
 =?utf-8?B?M0dJa3ZFT1ZhemY4NDFBalVpakplRFdpbEN4Rmc4OStFbC9wSEE2SS8vaTBM?=
 =?utf-8?B?dWZJckxUa1hTUm1WVXRPL0hjUDlLb0Z6N2IzdExTRTBTVmxRV2tUYTBPc2xy?=
 =?utf-8?B?bnp1c0pSWUJzc3E0OUxsU1d0SDZ5Y1MzVlJvSTg5UFNrVWtCcjlJMzlCNzZm?=
 =?utf-8?B?b2hXaGxPSlRWbzRlSnQ1Mzc0eEZ6cUVJbUoxQWkxVTJWZ05LZDNhRDhGa0Fq?=
 =?utf-8?B?SDlvczR4Z3orSDUvNFRLVGlUTkNiM3VGZ3pSNU9xVG1lcDd6MkVNL0JGZk4v?=
 =?utf-8?B?cWwyNEtuRVE0N00raG9hV0JabmxoajBUY2NOcFdwQnRRdkRRQ1pwSjNIRWFL?=
 =?utf-8?B?UE82c3RURjFPTk1HVmFqS2h6Y213UHlGeUVuay9NMEd5Mm9BY2pkY3JCOElm?=
 =?utf-8?B?WG45bnBvejMweE9RY3ZiL2toK2dJVXBxakZidEFPTjZFMmtFZ1RDRlJsWURl?=
 =?utf-8?B?U1Q4WlRjd0tObFhHYTNiQll1aVM3dnQ3Y2pKRUF2dlQxTWRpdTRqK09kVEo4?=
 =?utf-8?B?cnRBV1B4empoQVFJOS9vVzFSTHdEdEpjMS82NTYyUnpBMHg1eTNFWVUvemFt?=
 =?utf-8?B?R0s3R2QwSU1FY3dmMDN2bmZnQzJ6TVRKbnJnWklBVitpOE04Vy9Ga0ZGVXdq?=
 =?utf-8?B?T3l1cmhhVm1YUmVvclpVRW85ckc1YjZObnhlTGxTbURNWXh4Uk5EbHpIc0hz?=
 =?utf-8?B?RFFqZXdCQnd3ZUNKK3FRQ2Znd2c5OE5HeU9HRENsOCtnK2hZY3kxeDhKTS9P?=
 =?utf-8?Q?0OgVRjfeekV2oh/ebVwR/7vwGPtko1ixYaJ+i?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: REm9wTW/x2Iyz75SORGm6egSrmmW+DTkfdjaXaPVFN61ePZ6dhH+BQRpCwRcH4THzK7XnoOYkqzDwk7+uPIoUI+v16bgUN79cX/XBLT7H9YfophUnoS3fojbSgT5fdjbM3YIXke6Mc1YSwh1fr6BCLxYihMPC9Wgy3MRWbXIleK4MF7O4L42eotPq7UzWLXrogVAmNhNAZSwgOGLLiISlfbfKkX2IIv0wDwdzyfGqtuG0FdOWhbAXzOIgF+jfIsbHRSQpRbm6kYnV5FJtxVhbw14A9MmmQASzllg/lj28KCWW/bRDKYRnPNOe9EDkqgj0dg3LsC5nR3XylLA7jXCWw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f90fe33-797c-4da3-1fdf-08debbeb9743
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 12:29:26.2233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W4PwHnNssx9md+0TxruRs6Jz/m9ZuKr1FxjDd50PqcLcNlivWupNoh07vMUClCCiKaixZIGC2xD9UGFqAudmUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4701
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

SGkgQEpvaG4gSGFycmlzb24sDQoNClRoZSBzZXJpZXMgcmV2aXNpb24gbG9va3MgYSBiaXQgb2Zm
LiBDb3VsZCB5b3UgcGxlYXNlIHJlY2hlY2sgdGhlIHBhdGNoIGxpc3QgYW5kIG9yZGVyaW5nIGJl
Zm9yZSBwcm9jZWVkaW5nPyBJdCBzZWVtcyB0aGUgdXBkYXRlcyB3ZXJlIG5vdCBhcHBsaWVkIGNv
cnJlY3RseSwgd2hpY2ggbWF5IGhhdmUgaW1wYWN0ZWQgbXkgcGF0Y2guDQoNClJlZ2FyZHMsDQpT
b3dtaXlhIFMuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwg
S29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAyNiBN
YXkgMjAyNiAxNTo1Nw0KPiBUbzogSm9obiBIYXJyaXNvbiA8Sm9obi5IYXJyaXNvbkBJZ2FsaWEu
Y29tPg0KPiBDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFMsIFNvd21peWEgPHNv
d21peWEuc0BpbnRlbC5jb20+Ow0KPiBLYW5kcGFsLCBTdXJhaiA8c3VyYWoua2FuZHBhbEBpbnRl
bC5jb20+OyBIZWlra2lsYSwgSnVoYS1wZWtrYSA8anVoYS0NCj4gcGVra2EuaGVpa2tpbGFAaW50
ZWwuY29tPjsgQiBTLCBLYXJ0aGlrIDxrYXJ0aGlrLmIuc0BpbnRlbC5jb20+OyBTaGFybWEsDQo+
IFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiDinJcgRmku
Q0kuQlVJTEQ6IGZhaWx1cmUgZm9yIHRlc3RzL2ttc19jb2xvcm9wOiBBc3NvcnRlZCBmaXhlcyBh
bmQNCj4gc3VwcG9ydCBmb3IgaTkxNS9YZQ0KPiANCj4gSGkgSm9obiwNCj4gT24gMjAyNi0wNS0y
NSBhdCAxNDoyNTo0NiAtMDcwMCwgSm9obiBIYXJyaXNvbiB3cm90ZToNCj4gPiBGb3Jnb3QgdG8g
bWVudGlvbiBpbiB0aGUgY292ZXIgbm90ZSBidXQgdGhpcyBwYXRjaCBzZXQgaXMgYmFzZWQgdXBv
bjoNCj4gPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1NjkxMy8N
Cj4gPg0KPiA+IEpvaG4uDQo+ID4NCj4gDQo+ICtjYyBmZXcgbW9yZSBkZXZlbG9wZXJzDQo+IENj
OiBTb3dtaXlhIFMgPHNvd21peWEuc0BpbnRlbC5jb20+DQo+IENjOiBTdXJhaiBLYW5kcGFsIDxz
dXJhai5rYW5kcGFsQGludGVsLmNvbT4NCj4gQ2M6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGEt
cGVra2EuaGVpa2tpbGFAaW50ZWwuY29tPg0KPiBDYzogS2FydGhpayBCIFMgPGthcnRoaWsuYi5z
QGludGVsLmNvbT4NCj4gQ2M6IFN3YXRpIFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBSZWdhcmRzLA0KPiBLYW1pbA0KPiANCj4gPg0KPiA+IE9uIDUvMjUvMjYgMTQ6MDks
IFBhdGNod29yayB3cm90ZToNCj4gPiA+ID09IFNlcmllcyBEZXRhaWxzID09DQo+ID4gPg0KPiA+
ID4gU2VyaWVzOiB0ZXN0cy9rbXNfY29sb3JvcDogQXNzb3J0ZWQgZml4ZXMgYW5kIHN1cHBvcnQg
Zm9yIGk5MTUvWGUNCj4gPiA+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3Nlcmllcy8xNjcyMzQvDQo+ID4gPiBTdGF0ZSA6IGZhaWx1cmUNCj4gPiA+DQo+ID4gPiA9
PSBTdW1tYXJ5ID09DQo+ID4gPg0KPiA+ID4gQXBwbHlpbmc6IHRlc3RzL2ttc19jb2xvcm9wOiBB
ZGQgZWFybHkgc2tpcCBpZiBwaXBlbGluZSBpcyBub3QNCj4gPiA+IHN1cHBvcnRlZA0KPiA+ID4g
QXBwbHlpbmc6IHRlc3RzL2ttc19jb2xvcm9wOiBBc3NlcnQgdGhhdCB0aGUgQ1JDIHF1ZXJ5IHN1
Y2NlZWRlZA0KPiA+ID4gQXBwbHlpbmc6IHRlc3RzL2ttc19jb2xvcm9wOiBBZGQgY2xlYW51cCBv
ZiB3cml0ZWJhY2sgY29ubmVjdG9yDQo+ID4gPiBBcHBseWluZzogbGliL2lndF9jb2xvciwgaWd0
X2ZiOiBBZGQgbW9yZSBCR1Igc3VwcG9ydCB0byB2YXJpb3VzDQo+ID4gPiBoZWxwZXJzIFBhdGNo
IGZhaWxlZCBhdCAwMDA0IGxpYi9pZ3RfY29sb3IsIGlndF9mYjogQWRkIG1vcmUgQkdSDQo+ID4g
PiBzdXBwb3J0IHRvIHZhcmlvdXMgaGVscGVycyBXaGVuIHlvdSBoYXZlIHJlc29sdmVkIHRoaXMg
cHJvYmxlbSwgcnVuICJnaXQNCj4gYW0gLS1jb250aW51ZSIuDQo+ID4gPiBJZiB5b3UgcHJlZmVy
IHRvIHNraXAgdGhpcyBwYXRjaCwgcnVuICJnaXQgYW0gLS1za2lwIiBpbnN0ZWFkLg0KPiA+ID4g
VG8gcmVzdG9yZSB0aGUgb3JpZ2luYWwgYnJhbmNoIGFuZCBzdG9wIHBhdGNoaW5nLCBydW4gImdp
dCBhbSAtLWFib3J0Ii4NCj4gPiA+DQo+ID4gPg0KPiA+DQo=
