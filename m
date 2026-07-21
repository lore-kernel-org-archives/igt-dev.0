Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DE1C4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 13:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E6210EA46;
	Tue, 21 Jul 2026 13:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="avFwDZoq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5A710EA1A
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784639884; x=1816175884;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=6rZHu4wp4/a27FuFzE/UEfUd4DdMGb49ldzMHvDWGoc=;
 b=avFwDZoqCQuqDw8DlzbFIZiLSg4hdPmfqBMqt44wJU+fpruwghu6RO/g
 nv6MJjIh3wEhAJp+2pxSkGDh4stFf6EYYVAPVGu42nI8YCRci70tcrEbW
 lAVLSSUFgo46iW94w5+ZNjLAskVcXiDibRbvVRkUTf9xSORgy2byesZX/
 FBEBXE1Rzz6Ni4VhM81yu+vYzhqoixv2vTpH6D8kAo1m5JWP6puODJBEM
 flsd1Fr7Dq/hoSdWj8yqMoNlTP9d+IxXxkqaCJgo7GCR46Gc2++NGSoeM
 ROvtzW26fUeOUJPQ4LefpTtjggfT1YVTFhRCE7kH1c5/WenC8r/1yJ3ZN g==;
X-CSE-ConnectionGUID: sUe4cdFfTsiwJ6y3d1VOow==
X-CSE-MsgGUID: +X7vC6PNQq2wNkdMfamuFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="72777291"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="72777291"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 06:18:04 -0700
X-CSE-ConnectionGUID: O8Mt8PHbTj66doyLm+MXyg==
X-CSE-MsgGUID: DtyM4HReTpWAIMU50fgGLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="257200596"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 06:18:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 06:18:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 06:18:03 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 06:18:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9/8TM5DAcm7J/UTHv/Yy7ignjyw1oxnv7n3Wr4I952ZfOavcDn7VdHgPCfbIfqpuxpycA9VQbi1FQHC8R7LZUaXHGaEtbk5HgfKjaXlg0+pW5reI2QFJxidBUs7fhZfa+FiecjKRIcKRzG0dIemqHtwsH4n4x6mHSNiIhdZztuVDMFGEqXx+fq2B0fqro6mkbtWlJAx6O/IA0g/D9kInzyh6CsytAj4KE3IXX8r0XgjSk6sStrBtcK8qyk7jtZuJvONUBXGLtTe9JgBvHpDX87KnlVeKsQ0J9ilLr73VET4vL7WExFpg0hUTr1rGqFitPK1FEl4nN4aEnlnBF5K0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rZHu4wp4/a27FuFzE/UEfUd4DdMGb49ldzMHvDWGoc=;
 b=cZWzsVaqfrJw5E8H99Zh5gY3/q9tZZARFQBv3p7cmdVxZz7QuIKKHKOkOnH22N+vJTUAZ8tJs7KH8ALhTXEppQ708kVuxgSIOgiEM19Dm9fSptCDnjTBBDNw/YKTsyLeWpZ5/pJaxuwzijIRGA6B3mCtm3+Mq4dzZ+Vg5ohBNgkzmdlq4E6oFGxq0VSwhPMge72xJm8aTPwKtn2ICehH71ZkxpmFU3QJn1EcZYOJRbqlgPwDdwQ7S/Im+5G0ao5j2wLeyjV6YMYKDSZa/bjmB7tqFy8IXX5rDE95C4RBq6vnTuHHS9+ognbadC3NrvVGk9/+lgGeNoXpk4FOHEkVhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by PH7PR11MB5767.namprd11.prod.outlook.com (2603:10b6:510:13a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 13:17:59 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%5]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 13:17:59 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [i-g-t,v1,1/2] runner: Create results after each tests end
Thread-Topic: [i-g-t,v1,1/2] runner: Create results after each tests end
Thread-Index: AQHdGRL2TfATxY+ogEmg+KQompTI4rZ39IqA
Date: Tue, 21 Jul 2026 13:17:59 +0000
Message-ID: <346684ec5c04e8e04eaf059c13b375f30828e90c.camel@intel.com>
References: <20260720161526.64709-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260720161526.64709-2-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|PH7PR11MB5767:EE_
x-ms-office365-filtering-correlation-id: c794ce3f-7d79-4bd8-0394-08dee72a7c46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|18002099003|22082099003|3023799007|11063799006|56012099006|10067099003|6133799003;
x-microsoft-antispam-message-info: 7ciyxhcZWX8pA/Mkk9a10KZZtv/FG2+IKoQf6fMKvus/n3cJ6q3Q+lty70WG8KYC1+XMJQagKZ7UZLYZTsUA3MYHI5E3lRh5c/9ckttJCSfFfn0+eyNgpxYxV5U8zKVmcFTfY0oGTqIFI2N9iFiMbG3Rzl3J23auwb7Xr78iItMe9Al1MCYWj4HnbUv+dAWYFD8UGA7ohxFwraBRe84PYQpeX2s2VrUp0a9yU83f5nU4AKgZT2zpDyJz4agC5A9m4jtNcUnnsw54Tqf+UK+Y2ayYIV+0jBvFhMuydZaovfTavSvUgLjEjkrx44mRUEi61cK+k5DA49PTX6+FdCmWAhVhu89aF/Em6rMuUhR4vBG8izBR+1eIRW18WmeqW5RWtzjp949DeBB1n7TZb7dbFA9T+04JB4/h6PLHCzdmX9zgYOtUl01CNsyGrKOXrCJuetif/wdmP37Y8QXHyrwAI85hdxh/aIWX0MBL9oRhzkBLdrUAXztxALilH8v2LDWui89LyTZyjfhZjYBvmhqnU+gK1J1iqbuaZD35YpHqp9+tslMa011IylScbA5YPsu6yaDuhoT39d5FJvvUqggm+h82gmJ9BliXR0e83VkH52frGxaX6g8GNzEcnpS/EEpxePRYKfPGHLjqMnkP8Fvk42ZTYFBGV8OOeN1K6bi300AWzI5Xyxt74Nm8EAlw2biO1iZXP08sfL/IpIjtcj+4rdPcApRVo5zqdh/q3DtmvNE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjZpdHBYRzk5Z3AwR3AxOTJ5WXhKcUlaUGo1VlpQTDB5VFRBWWxmcTZ2UFFh?=
 =?utf-8?B?VU91MzYyZ1FSam90dXQyYnZGOENlUTRSZHkwQ3N0Mk1yd091UmNSUFNvVS9Q?=
 =?utf-8?B?Ymd1QzBWakc3VUJsYzNidnB0cmJtL3ArRVZxZ1UvbGNMMjhlWURFTSsrZEN1?=
 =?utf-8?B?QnpiWUdXYmZDZ0ROMG14NW45WklWdmU3dXZ3VGhSRGUrRE1rck1sNXNybE85?=
 =?utf-8?B?S0ViZVhqRC83a0hNMURaYXd6RU1rZW1LRUNaZUxmMXo0V0hTcGJhNEhyejE1?=
 =?utf-8?B?UWZiakdVVDk2aTNKWmhBdVhVVDFGUk93TzlUemdMNm9OaG1RTTQ1cmw2NzBw?=
 =?utf-8?B?Qnh5YUNFcXFwakhkby80T2Z3Vk0xQWtITlZhMmcwdmNCbWRRZEV1cHdHblRG?=
 =?utf-8?B?a1BQYWRRbGZZbURZdjNESDB5WnV5SnFQbzV6dWlXMk1RWHdaRkZoZGlIeEtU?=
 =?utf-8?B?Y0NQTk5tV2ljVWxJL0dMK1luaDY5dmFTalUrbTVKQUNPeGMrLzNjTWp5Mmlt?=
 =?utf-8?B?OEIzeW9DTTNablJiZEtxWUJyVzJJaHZ5aHBiTlAyNUFnKzIwSFZ0TDFhcHox?=
 =?utf-8?B?dXpxdlZoQ010TnUxUmI4ckdaWCtSWk02Yzhiam1iSStTSUlyS3hHL1FiUkk2?=
 =?utf-8?B?REJ1OGo0VjJ5eDIzVTAzOU85aW5iWUFqUHdLV1lQVG1ON3VnWEN3Q2hiUm1T?=
 =?utf-8?B?djB5RlNuZXM3ME9tNVpIdUxVd2VGOC8veUpiZWJ2emtYd2FEOEdsMEliTDhk?=
 =?utf-8?B?ZE05RlE0Qks1R3l1USsyUzNIaDRGeG8wUUhnZW4ySHlWQnI2aTU4Z0ZHNFdB?=
 =?utf-8?B?SzRxOEpFZHpJR29ZT2ZYOVBkaUFSeFZ6c2JFbU9pMnNTamN2dmZoZ3NKcXhZ?=
 =?utf-8?B?OVBadUo0d0E0bFBRd1ZEenF6S1V1RDBiSTJlcGVYdit1bW9GSS9Zbm9DMTNS?=
 =?utf-8?B?eWVwS25qbjIwV2pVSndNZkE5R1BZbjdTdlVEVjN1ajRLWFBDOGgrRk1acnVa?=
 =?utf-8?B?VE5kc1lGNi9ONnIzWVJSaU9RMUEvUVBXYjBUcDMzczMvNFdjRFVVY3VRcGpM?=
 =?utf-8?B?OHQ5cDRWclhBYmR1cVlZNVowVng1K2FQWk10OEh3UXJWcWQzQmxCUHlCQ1FZ?=
 =?utf-8?B?Yk1UUUtxdmZHY0Q4emNlQWFYK01tY3liT0lhWm4wYnNTUWowcEZIQVBUY1lQ?=
 =?utf-8?B?SGlBOGNvU2NFelM1Uk5LcnRzNmIrUVdYSEljUHcxaGcvYWgrTlZDSlJxSFpD?=
 =?utf-8?B?RUJJQWx2dXBaeTdZRTdJS3RUZ0R6empNMjB1Uk5jTWFaZ3I5VUtDSEI1MTdm?=
 =?utf-8?B?VVljYU5uMmJHUytXQmh2U0UyM0YyM01YWTk4RC9lMEJzUHNWc25sa1hESk11?=
 =?utf-8?B?Z0xLTmNzcU5vSzJYdU1oYkRId3VxdjlKNDFHSWJJN0t4a3JhRGluamVKc09K?=
 =?utf-8?B?ZFZFS3F5WXZsNEFhZlh2dHVSb1c3aDdIL0ppeDVTektPY3ZLM0hOa1BRWUJS?=
 =?utf-8?B?aFh2czRLODE0bmJVSExlUFlFSzJ6UmNaMHFwOGtXYllEcDdpVGZRMmNSWkRS?=
 =?utf-8?B?TVQ5L0wxVC9UMkM5d0lxM1pMYTZsWGo5RGw5a0J6cXJqSEFiSUozVXBnU0JT?=
 =?utf-8?B?cURrMXJTNmhnRG5NcVgyWVluRHZYK0QrRlZvcHpJaGdpYXgwc2s1d05VZmZ6?=
 =?utf-8?B?YkR1OFpMSllFUmJvWE1hU3FlVUJKOThyMkUySTVnMmpTNUdBeGtwRkF6MTg0?=
 =?utf-8?B?bEQxeWEwaTZtMWtnbGRvVk1oOERWOFl1WTFDNDBOamxXZXhzdmZKL0QzcGRX?=
 =?utf-8?B?VzAwT3NUVS9BeVVvQkpOREZYNXNidTJWYlhBNW96QXJKOHUrSWZsNU9EMm5J?=
 =?utf-8?B?OVFmRkhHYzl0ek1vdWp1SHBLdjRiVnV0SkFRcUJOTjNuRnlWaVhpaURKTnhM?=
 =?utf-8?B?aWg1aW1tTUxJZ2NJWGw2cW9SVmVtZ0tDWFFqbnAwVEdKTHg3YzRJQWIrVHUx?=
 =?utf-8?B?cllraXhpZmpMUzRuVXRYRGhZcS9WV3dGR3BzZHhGbDkxcytoa2E2SmdCdkFj?=
 =?utf-8?B?UzBKbEsydU8wcHdGUks3U052dmZ6a1lONi9RcWVBSU8vNHhMM2NHUDdZS2RX?=
 =?utf-8?B?SldhMHYzK3R6bnRwZUJrYi9rc2VzTEg3bFJQR3dOKzNTbjg4bk1NWHE5SjBM?=
 =?utf-8?B?ak05bStjb3djSFVhUUtYKzFyeHVOaGFOcG9nR0FnTHhjWjBtdTNyaWFscGJM?=
 =?utf-8?B?bFAxTXJSN3dmOStoTmFlRDluLy84K1RGSDI4Q2JnaUFCdCs5VEtIRDFVTEYv?=
 =?utf-8?B?ZjF5S3MxOHRoNE5FMHRQVWhOMThCNk5PNW11bzVpaXNEdzRlMGI0eVY4ZkZR?=
 =?utf-8?Q?E7X8BAI8l7p9CzrQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60A8CEF379F19B49A5F1D1368F1069DC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DYyW5tdVIBKCieBbxji9npEiCPo4Q7PEcxaEh5VxvGaCqOLif+sFcSutC+RcFlTIq4zzU/xoV5k6iQtR9Th01aUP6TbjqUZEAXDi7NClfZc1wr6ywgSfxBH9untO1yBNaEvcOfA2zHX6mcA1IdzfywPHKTPzkljlarIYA9wUjyPIasHHKXgzmublrPJgUdOP66Rj9mkwkOUL/nCdDCDky1M8/+acIKBLON/SBp8zcOko6W2thk3w7fl12CZWQRdR941o2yIWDbsWhytyFTZdQ960GCU0ZNb+pcjJ69qHKCj5YA6A9FEh4zaOVQXqLT95nJG5LynHMcDflZnTE1bIzA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c794ce3f-7d79-4bd8-0394-08dee72a7c46
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 13:17:59.2256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NtbIkZsEYhdpU/5ekpS9vA8yVf1t0WQVztu4VVPME+W7o1tpoZy7lJa7wXvhwMUwFC8kWAkrriyhr9yEg4UeGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5767
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

T24gTW9uLCAyMDI2LTA3LTIwIGF0IDE4OjE1ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IFNvbWV0aW1lcyBpdCBpcyBkZXNpcmVhYmxlIHRvIGhhdmUgcmVzdWx0cyBwcmVzZW50IGFm
dGVyIGFuDQo+IGV4ZWN1dGlvbiBvZiBlYWNoIHRlc3QsIHNvIGlmIGFueSB1bmV4cGVjdGVkIHJl
Ym9vdCBoYXBwZW4sIHRoZXJlDQo+IGlzIGF0IGxlYXN0IHJlc3VsdCB3aXRoIGFscmVhZHkgZXhl
Y3V0ZWQgb25lcy4gQmVmb3JlIGNyZWF0aW5nDQo+IG5ldyByZXN1bHRzLmpzb24sIHByZXZpb3Vz
IG9uZSBmcm9tIHRlc3QgYmVmb3JlIGlzIHNhdmVkIGludG8NCj4gcmVzdWx0cy5vbGQgZmlsZS4N
Cj4gDQo+IFRoaXMgd2lsbCBoYXZlIG9uZSBkcmF3YmFjayBvZiBub3QgY29udGFpbmluZyBhbnkg
aW5mbyBhYm91dCBsYXN0DQo+IHRlc3Qgd2hpY2ggY2F1c2VzIHN1ZGRlbiBtYWNoaW5lIHJlYm9v
dC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55
QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBydW5uZXIvZXhlY3V0b3IuYyAgfCA1MCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tDQo+ICBydW5uZXIvcmVz
dWx0Z2VuLmMgfCAgNiArKysrKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9ydW5uZXIvZXhlY3V0b3IuYyBi
L3J1bm5lci9leGVjdXRvci5jDQo+IGluZGV4IGE4OTA3YzU3NS4uYjIwNGZkZmZjIDEwMDY0NA0K
PiAtLS0gYS9ydW5uZXIvZXhlY3V0b3IuYw0KPiArKysgYi9ydW5uZXIvZXhlY3V0b3IuYw0KPiBA
QCAtNDEsNiArNDEsNyBAQA0KPiAgI2luY2x1ZGUgImV4ZWN1dG9yLmgiDQo+ICAjaW5jbHVkZSAi
a21lbWxlYWsuaCINCj4gICNpbmNsdWRlICJvdXRwdXRfc3RyaW5ncy5oIg0KPiArI2luY2x1ZGUg
InJlc3VsdGdlbi5oIg0KPiAgI2luY2x1ZGUgInJ1bm5lcmNvbW1zLmgiDQo+ICANCj4gICNkZWZp
bmUgS01TR19IRUFERVIgIltJR1RdICINCj4gQEAgLTI0NjYsNiArMjQ2Nyw0MCBAQCBzdGF0aWMg
aW50IG9wZW5fY29tbXNfaWZfdmFsaWQoaW50IHJlc2RpcmZkLCBzaXplX3QgdGVzdGlkeCkNCj4g
IAlyZXR1cm4gLTE7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyB2b2lkIHdyaXRlX2VuZHRpbWUoaW50
IHJlc2RpcmZkLCBkb3VibGUgYV90aW1lKQ0KPiArew0KPiArCWludCB0aW1lZmQgPSBvcGVuYXQo
cmVzZGlyZmQsICJlbmR0aW1lLnR4dCIsIE9fQ1JFQVQgfCBPX1dST05MWSB8IE9fRVhDTCwgMDY2
Nik7DQo+ICsNCj4gKwlpZiAodGltZWZkID49IDApIHsNCj4gKwkJZHByaW50Zih0aW1lZmQsICIl
ZlxuIiwgYV90aW1lKTsNCj4gKwkJY2xvc2UodGltZWZkKTsNCj4gKwl9DQo+ICt9DQo+ICsNCj4g
K3N0YXRpYyBib29sIGdlbmVyYXRlX3Jlc3VsdHNfd2l0aF9lbmR0aW1lKGludCByZXNkaXJmZCwg
c3RydWN0IHNldHRpbmdzICpzZXR0aW5ncykNCg0KVGhlIHJlYWwgcHVycG9zZSBvZiB0aGlzIGZ1
bmN0aW9uIGlzIHRvIHJlZ2VuZXJhdGUgcmVzdWx0cyBhZnRlciBlYWNoDQppbmRpdmlkdWFsIHRl
c3RzIG9uIHRoZSBuZXh0IHBhdGNoIC0gaG93IGFib3V0IHJlbmFtaW5nIHRoaXMgdG8NCmdlbmVy
YXRlX3Jlc3VsdHNfcG9zdF90ZXN0IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQ/IChFbmQgdGltZXMg
Y291bGQgYmUNCndyaXR0ZW4gaW4gYWxsIHJlc3VsdCBnZW5lcmF0aW9uIHBhdGhzIGV4Y2VwdCBk
cnkgcnVucy4pDQoNCj4gK3sNCj4gKwljaGFyICpyZXN1bHRzX3BhdGggPSBzZXR0aW5ncy0+cmVz
dWx0c19wYXRoOw0KPiArCWRvdWJsZSBiZWdfdGltZSA9IHRpbWVvZmRheV9kb3VibGUoKTsNCj4g
Kwlkb3VibGUgZW5kX3RpbWU7DQo+ICsJYm9vbCByZXQ7DQo+ICsNCj4gKwlyZW1vdmVfZmlsZShy
ZXNkaXJmZCwgInJlc3VsdHMuYmFrIik7DQo+ICsJcmVuYW1lYXQocmVzZGlyZmQsICJyZXN1bHRz
Lmpzb24iLCByZXNkaXJmZCwgInJlc3VsdHMuYmFrIik7DQo+ICsNCj4gKwl3cml0ZV9lbmR0aW1l
KHJlc2RpcmZkLCBiZWdfdGltZSk7DQo+ICsJcmV0ID0gZ2VuZXJhdGVfcmVzdWx0c19wYXRoKHJl
c3VsdHNfcGF0aCk7DQo+ICsJaWYgKHNldHRpbmdzLT5zeW5jKQ0KPiArCQlmc3luYyhyZXNkaXJm
ZCk7DQo+ICsNCj4gKwllbmRfdGltZSA9IHRpbWVvZmRheV9kb3VibGUoKTsNCj4gKwlpZiAoc2V0
dGluZ3MtPmxvZ19sZXZlbCA+PSBMT0dfTEVWRUxfTk9STUFMKSB7DQo+ICsJCW91dGYoImdlbmVy
YXRpbmcgcmVzdWx0cyB0b29rOiAlLjZmZnNcbiIsIGVuZF90aW1lIC0gYmVnX3RpbWUpOw0KPiAr
CQlmZmx1c2goc3Rkb3V0KTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiAr
DQo+ICBib29sIGV4ZWN1dGUoc3RydWN0IGV4ZWN1dGVfc3RhdGUgKnN0YXRlLA0KPiAgCSAgICAg
c3RydWN0IHNldHRpbmdzICpzZXR0aW5ncywNCj4gIAkgICAgIHN0cnVjdCBqb2JfbGlzdCAqam9i
X2xpc3QpDQo+IEBAIC0yNzE4LDggKzI3NTMsMTggQEAgYm9vbCBleGVjdXRlKHN0cnVjdCBleGVj
dXRlX3N0YXRlICpzdGF0ZSwNCj4gIAkJCWlmICghaW5pdGlhbGl6ZV9leGVjdXRlX3N0YXRlX2Zy
b21fcmVzdW1lKHJlc2RpcmZkLCBzdGF0ZSwgc2V0dGluZ3MsIGpvYl9saXN0KSkNCj4gIAkJCQly
ZXR1cm4gZmFsc2U7DQo+ICAJCQlzdGF0ZS0+dGltZV9sZWZ0ID0gdGltZV9sZWZ0Ow0KPiArCQkJ
LyogaXQgc2hvdWxkIGNoZWNrIG9wdGlvbiwgYWxzbyBtZWFzdXJlIHRpbWUgdGFrZW4gKi8NCj4g
KwkJCWlmICghZ2VuZXJhdGVfcmVzdWx0c193aXRoX2VuZHRpbWUocmVzZGlyZmQsIHNldHRpbmdz
KSkNCj4gKwkJCQlyZXR1cm4gZmFsc2U7DQo+ICsNCj4gIAkJCXJldHVybiBleGVjdXRlKHN0YXRl
LCBzZXR0aW5ncywgam9iX2xpc3QpOw0KPiAgCQl9DQo+ICsNCj4gKwkJLyogaXQgc2hvdWxkIGNo
ZWNrIG9wdGlvbiwgYWxzbyBtZWFzdXJlIHRpbWUgdGFrZW4gKi8NCj4gKwkJaWYgKCFnZW5lcmF0
ZV9yZXN1bHRzX3dpdGhfZW5kdGltZShyZXNkaXJmZCwgc2V0dGluZ3MpKSB7DQo+ICsJCQlzdGF0
dXMgPSBmYWxzZTsNCj4gKwkJCWJyZWFrOw0KPiArCQl9DQo+ICAJfQ0KPiAgDQo+ICAJLyogQ29s
bGVjdCBmYWN0cyBhZnRlciB0aGUgbGFzdCB0ZXN0IHJ1bnMgKi8NCj4gQEAgLTI3MzEsMTAgKzI3
NzYsNyBAQCBib29sIGV4ZWN1dGUoc3RydWN0IGV4ZWN1dGVfc3RhdGUgKnN0YXRlLA0KPiAgCQkJ
CSAgICAgc2V0dGluZ3MtPmttZW1sZWFrX2VhY2gsIHNldHRpbmdzLT5zeW5jKSkNCj4gIAkJCWVy
cmYoIkZhaWxlZCB0byBjb2xsZWN0IGttZW1sZWFrIGxvZ3MgYWZ0ZXIgdGhlIGxhc3QgdGVzdFxu
Iik7DQo+ICANCj4gLQlpZiAoKHRpbWVmZCA9IG9wZW5hdChyZXNkaXJmZCwgImVuZHRpbWUudHh0
IiwgT19DUkVBVCB8IE9fV1JPTkxZIHwgT19FWENMLCAwNjY2KSkgPj0gMCkgew0KPiAtCQlkcHJp
bnRmKHRpbWVmZCwgIiVmXG4iLCB0aW1lb2ZkYXlfZG91YmxlKCkpOw0KPiAtCQljbG9zZSh0aW1l
ZmQpOw0KPiAtCX0NCj4gKwl3cml0ZV9lbmR0aW1lKHJlc2RpcmZkLCB0aW1lb2ZkYXlfZG91Ymxl
KCkpOw0KPiAgDQo+ICAgZW5kOg0KPiAgCWlmIChzZXR0aW5ncy0+ZW5hYmxlX2NvZGVfY292ZXJh
Z2UgJiYgIXNldHRpbmdzLT5jb3ZfcmVzdWx0c19wZXJfdGVzdCkgew0KPiBkaWZmIC0tZ2l0IGEv
cnVubmVyL3Jlc3VsdGdlbi5jIGIvcnVubmVyL3Jlc3VsdGdlbi5jDQo+IGluZGV4IDFlZTE2N2Zi
MC4uZjVhOTFmNTQyIDEwMDY0NA0KPiAtLS0gYS9ydW5uZXIvcmVzdWx0Z2VuLmMNCj4gKysrIGIv
cnVubmVyL3Jlc3VsdGdlbi5jDQo+IEBAIC0yNTU1LDkgKzI1NTUsMTMgQEAgYm9vbCBnZW5lcmF0
ZV9yZXN1bHRzKGludCBkaXJmZCkNCj4gIGJvb2wgZ2VuZXJhdGVfcmVzdWx0c19wYXRoKGNoYXIg
KnJlc3VsdHNwYXRoKQ0KPiAgew0KPiAgCWludCBkaXJmZCA9IG9wZW4ocmVzdWx0c3BhdGgsIE9f
RElSRUNUT1JZIHwgT19SRE9OTFkpOw0KPiArCWJvb2wgcmV0Ow0KPiAgDQo+ICAJaWYgKGRpcmZk
IDwgMCkNCj4gIAkJcmV0dXJuIGZhbHNlOw0KPiAgDQo+IC0JcmV0dXJuIGdlbmVyYXRlX3Jlc3Vs
dHMoZGlyZmQpOw0KPiArCXJldCA9IGdlbmVyYXRlX3Jlc3VsdHMoZGlyZmQpOw0KPiArCWNsb3Nl
KGRpcmZkKTsNCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICB9DQoNClRoYW5rcywgUnlzemFyZA0K
