Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B347BF46124
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 14:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3363C10E029;
	Mon, 23 Mar 2026 14:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZUMVtiv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B865C10E029
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 14:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774274533; x=1805810533;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pt2eQAQgCImF146oOk2Zl4yZuYaK25NGPKS7gVnB8+Y=;
 b=iZUMVtivfzY8L3PVBLUSY9UeldpVsahH7fbUu2YrxwdfywIhEn3QWJuG
 6fpyRuv77M1YxpU4/9Kbu7RSlZJ9wlbYn5xyjB/swkYH350oY3zEVX8dA
 3U2IrHKgsxsONO/kZF813KyNZaUkClNC5xFXLVjQpXL7h5kYcYeHpAc6k
 TIQ6qMog+UO2VM2feLhecT9Y1slY6TsBEi08XaenVTsRKZKNcwAEEhPzi
 rBm/DOqEECadQEOlFGRww33FNXpN/M+p4I6x3unxVKbYiJBnFkMudTi2C
 T0VvDUpJE1yHxiS4mRQyBWPulGpHvmA0pwG/Qq7cOyiBxxMtLcVZP08CL Q==;
X-CSE-ConnectionGUID: eyxc58J8QHWFRNeHJz8CuA==
X-CSE-MsgGUID: TDIRSjvXTJ6i2414TPz1Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79177536"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="79177536"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:02:06 -0700
X-CSE-ConnectionGUID: ZePFqM5ZRvS5YYLkaOTnrA==
X-CSE-MsgGUID: P5XvUQpKTTKaCcUFa6bCoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="225740822"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:02:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 07:02:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 07:02:06 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 07:02:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIQU2sA+WiQEj2YdJ+qwYmJEx/CCZEFOEqDO+eXmzq7fIEK64U50UtfaaaQgIsOizqrcyGytC2qrZ2ofr/tjcnqDGtI+tgvXqvrzaMPNfJ7uz/t5qB58WdeG3BjP54s8/hqe4Sqmwl+NGC7gxIc1XsiBhtiZmiRO7qimNjRilmf1FUUqnh9fb2jddytQsrmF1CurTWqxyGHoy1leiF3tOqEZZPrTBc5s33OJOH5+R9nlUDoRUC5RqA+O1zvS5vN+rrirkh5yLQpfOGany7Lw5/XOhA4sE/LnSHC5FbabZluoSanCZ4u6Pl5xH+3aOna5kRiURNHZIWMmDAQHPdtV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pt2eQAQgCImF146oOk2Zl4yZuYaK25NGPKS7gVnB8+Y=;
 b=Cj5/RRvL4Q2tsgt9IhxF4wQkqoha1LG80nNoBUZ1mi6pW8LA/4ixoiJ//J4zD0Tg+J6wAErq/EKhZ1c9qk0/xoMBnlm+ORiReuwGlx4Njs2fcEFK5cMlOmChPh2R0TAFz11n53wS1lXc5BHMZ9Dwm1ugLUZI9HIn6xfLNH6slfe4NnVAUgkkSn2Z7hHYI+Sc3KAjzN/a6IApAJtAqnXmKHm2gFVQ0Aua1pKpw8R1OcIjnXLRVUUDn6yHWo9j89T1y8umHOUQwvdLgrpcaG8zMsg2UpWW6AfdL/PgIKGW4+rUmBffhl8TpE2WLcjyCWr4lwShCrCTbBf5tn5fmxMeGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFAB4263235.namprd11.prod.outlook.com
 (2603:10b6:518:1::d41) by DM3PPFAB6A6CF3C.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 14:02:02 +0000
Received: from PH3PPFAB4263235.namprd11.prod.outlook.com
 ([fe80::df01:30b2:d465:e136]) by PH3PPFAB4263235.namprd11.prod.outlook.com
 ([fe80::df01:30b2:d465:e136%6]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 14:02:01 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Vehmanen,
 Kai" <kai.vehmanen@intel.com>
CC: "Grzelak, Michal" <michal.grzelak@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/device_reset: unload audio before
 descriptor closure
Thread-Topic: [PATCH i-g-t 1/2] tests/device_reset: unload audio before
 descriptor closure
Thread-Index: AQHctBQpwGFuAY3PA0y3n/bSh0WeTbW8MugQ
Date: Mon, 23 Mar 2026 14:02:01 +0000
Message-ID: <PH3PPFAB4263235D708B964FBA057BD3B22E04BA@PH3PPFAB4263235.namprd11.prod.outlook.com>
References: <20260315003826.3785048-1-michal.grzelak@intel.com>
In-Reply-To: <20260315003826.3785048-1-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFAB4263235:EE_|DM3PPFAB6A6CF3C:EE_
x-ms-office365-filtering-correlation-id: f0cebc8b-17b6-4760-1cf3-08de88e4c192
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|7053199007|56012099003;
x-microsoft-antispam-message-info: 6NMSvMTeeLvkJIQvyrvtPgyZSb0x85bYLVSEMYcVfBIxVHE8URF8n6RJN2e2IMW3cchf0binRz3ESpnokxsM+D1hFTZ7atJMlIGmwi96Ifk33RPr3jSZ6bVVH5HR1i3KV5nC0HyiiWMC6lSZWwy2gGkDvaTdsNsDk43QhPa5+g0PUTn/mHID7aS6A7z0tI7WA7NyFl+h3Xr3/gwBuZLsjGYnwLZM7ngZnIsSxQorqdNI0IOJSMwLePxx8uinlbo1G+QZ/lm1v4u6t5bq4ikxIcaOIumB4FEnUM2zAlt8Bpsy8Ji47v5z6mAjYRrU5Bf9f+gnZuCsOIqhbkYIvTcousHFxbgsDR4dPm4uxi1SI3lzZvSTWcqP1TvdGaouRyZA2S2FNh3PSONqyVPnU2ueA7gHGGpNgoUYAxopZzx8lF1WdF3Hu/p7F1HZpQLSVwU/rsHvuVkM+fqxIA7DKXblprODpUJ4VlWrjP7hPARJCYlBGsamw2ZSwUv9yc8KdgKR0ssgTwDAQOtWQL3AppQwakiaAx1RKl02AWS8TU7IaKOnOt3FLSco4s6+eSWoi4YV8asZhTO+1mDsCCEDRhnlZHXYW9b66tylDLwu7TzuwsDRs7NNSwCyb1Nk/mi1dR+NDUkpnQ+WZ5zhd0UiRHZBbodjwLI/RwQrd86prWJ010tlwdxuCgZwrGD5GXq0QWYz+G2zEQyNj3b8ktkw4iYjzeVmQwrt4FUnHPd/Q5OZ6KuCAYCQhnVpHYbV98OM06LgcTVLoxTVeMvarq0N1Sfr3AKQPmyvOQ7JnkZLt8n0jT4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPFAB4263235.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(7053199007)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0t5cVYyS3NnK1dwU2Ywb25ZbEM3OHBPaFBzQlBoVnNhMWxJUXdxZ1kvQTQ1?=
 =?utf-8?B?SzRXM0ovTmgwaGozbHJ5Ti8wSlpHZTc0OUhScEMrM01SVEltajlDSjdXeWto?=
 =?utf-8?B?MUZ1Y2Zsc3NKa0ppTVJnalU3ZDhiTjYyN2ZVNVRLZ3NxUDljSXR4TGd3YTBN?=
 =?utf-8?B?by9zUjh0RU55cHpLQlV0OG5jYzNBZ0xOL3o3SjFYdE9kbDRkY0Qwc0gyRUJO?=
 =?utf-8?B?cWtOeUdqSmNheDVSdlpXWFl3SHNEUmRiWTlnKzFVSGFyNXZlUUtJbHRKNnNy?=
 =?utf-8?B?VlVIZVJlbEFiWFk0WXFscmlYREtsbC82VyszK05IcWRiTWMyRmpDaXNucS9C?=
 =?utf-8?B?VThmQ2xqSE4xbEJUemF5UFBGK1ZwOEYxTlJWemRLdllIZ0R0OWphM3lNUm5F?=
 =?utf-8?B?TzNBb3ZlL3F5NkVEcWZ5ZGFUL1QzQ0xWTThQdXZzbzdzZm5RWGZwQzc3SzEr?=
 =?utf-8?B?V3JoVmJUNUNxT2Zha095dVExMzlZT2VMRDhQeFdla0hEVS9wOGRPZHhlSmdO?=
 =?utf-8?B?bWZXZGNFalNjblJQMFVpSmdwSEZZNEoxYnJyV1pScVpkV3lzcS9oQWJKd2NL?=
 =?utf-8?B?ZWdJNnF1SmZOdDdiWjhrbWhTNWJxcERyamdpUzNNVnVOMWRIb1lEemlnd2FX?=
 =?utf-8?B?RFZkWUZFSG81WE4rcngwUkxVS3FtYXpvR0hsblI1bmMyWnUyWFA4Y3VHcDdG?=
 =?utf-8?B?UWU4YkxCaEp4OVNKSThnNWN6RVEwVmlPME54ejU5ZzdCVjVoeTl6UVR5VEVM?=
 =?utf-8?B?VE1jVXRTeW9uamh1b3UvSE5lNXpuRGZuaEd2bk9OVFNBQy9wTjlnb2ZXOVgx?=
 =?utf-8?B?NDh4VkloQS9HUFRQd1VHYWg0MzFXY1BHY21udE53dS91RUxSbWtVbUhGalA2?=
 =?utf-8?B?Q3poQ091eE1Zam5OSUhmYjZSbzlkT2J0aExtdVVrSnI3T0o1dkJueXQ5VzNM?=
 =?utf-8?B?Vm9odWc1Wkx4cUwxZDhNWFY1NmZiMVQ0N0lpTGEvVGhmbTRQa01RZ3dtc2xj?=
 =?utf-8?B?MmV6REZ1bHZMcEdEYlIyYlI4Z3FNWHA3eFk5SXRBRlk2alJIbmVpUG5xaFZi?=
 =?utf-8?B?ZW9vWTBWYjFjYTlJckdLTks0TnBiQ0pBeGNNa3BsZ3haZkNsUGdBOGh5LzYv?=
 =?utf-8?B?dEN0UlBtSnFnV294cFZaYUR2NHdqcHhUNzd0YjhLdkloaCswbS9PT1ZpVUsw?=
 =?utf-8?B?YWpza2ppZDlLbFZPdGEzS0ZsSFFESmt0RjYrOXpHVjk3S1QxWkdtMTFHOXFi?=
 =?utf-8?B?ZHdKQ0tDQm1MaEsrOWlYZ3Z0aGpLT3g2Sk9icFFYYzkwalduK0kwVXRGSHBk?=
 =?utf-8?B?MmdjWFlwemR5RTYxRDc5QTcxRkdhQzJwVXFVRmVDRTZJOGVEVzNhRWh6UXpl?=
 =?utf-8?B?SnlIMEdVYXJadUU2UnR1TGl2WFlQU21GblQ0Q1pwcjJYbXJXWlFOR0ZGN096?=
 =?utf-8?B?YmszVi9xaEg5WE03VlhrdkYyc081NTZDVkp4d1IzZ0YxcmhDT2QySHdHWkNw?=
 =?utf-8?B?Z1BSVlQ1enJFOVZvcklTYWorNEpBdW1iUzF5bXJiaEFFaEJRT3g4U1Exa1Ez?=
 =?utf-8?B?a09ibTMxMjlvRE5HSXJ0S3RCUUhDV1oxaFI5WVlQdExkWHorYWNHMHl2cDZh?=
 =?utf-8?B?THpnZTdCdlNKWWN4bDYvU2NYSlh2TTNCT21XSi9TTnk2N3ArbXVJVWhaeFVl?=
 =?utf-8?B?aFI2ckVNdTdLUlZLNmgwekladkQwalV4NTN6UGIvQzRHbHM0TGJSeXRReHhS?=
 =?utf-8?B?OWk1TFpqaVJ5Ykhxa2hNQ3pSQVA3WW9jajJzcStVVGFhekFBakVTZEhTMit1?=
 =?utf-8?B?eDNWZXhOSDg2MHZ5MnV4M0trYjJoSEptTExac2xjRTlHZk9JL1Q1T1hTYnVX?=
 =?utf-8?B?cVB0K3pHZzNQa0VvUncwWFVUZWZ3YmFJN0NMbVdGZDVMNzdvSTFuTnFVcnMw?=
 =?utf-8?B?aDdrdHdCYmFmT1c0NjlBVU82OFdaczRMWXZZMWVJbmlWQ0JVdEpEOUMvVmx4?=
 =?utf-8?B?QTVraFI0L0ZSWE1lSlRZU0JxakhJak0wMzQ0TjRZQTdHWmlWMStDbzFUbTMx?=
 =?utf-8?B?SDBPaUZEWk4xWFFhcFVMWmJRdXNjM1VDUXZFSGJGZnJDWVRoS2MwN2J1TEFO?=
 =?utf-8?B?UlNRYXhCRHBnamVMZ3hQY25Dc1gwSVBYMDN3Y21Ha2VMbllPcnk0V2ZObUlT?=
 =?utf-8?B?UG5jTis3MllibWkxOGg5aVA1YUdtczlVMldXQWU1Q2ltRUJPS3FVWjNxV3BQ?=
 =?utf-8?B?NTlsNzg3Y0Y3MXo0VTc1MytRUnhwUS9oRTBablNrRm4vSmpDVXVIU3Jpc2lr?=
 =?utf-8?B?d1c1QlJMTUc5MGUvMXpMdnh0VlZsM0syNXp3RHFYeDQ5N1dTdjlDQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sp9S9KRXQC7PdS4nF8WX/CZIX/PCbgU3tnRjWuDYSxWLq5dZOd8ALQAKKMjGwTHmAwVuOm5oAbyCn6goBRAvt4pHBqvgRqD1dAP93CSKka6Qb5NkhFzhd9uu+rYyuVxqATVdLbkSfeugXGibarjJX+6H3wkz3pIkoD4uSbU7VCbszgsbD3Y8RbvdZWTw4sGpCR1tqFf70WuazNzbLtJhA3BQC6zjWUJam/gpJfuem34iCcTPng2U4/enZpRpzHcyoWOr0m31OzuKalgBh+fA08ob7TRh7KXP/KoNTVbtGHRk8bK/s5dt4QdRDM8NPukJvClbAugKfMHd1cvHG+DLGA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFAB4263235.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cebc8b-17b6-4760-1cf3-08de88e4c192
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 14:02:01.4037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xq4l32dAFDJFc0BwTUSetZkSGS4VsinW4ySRnfxVHHJzla6p3jfevyNBF3qU/aSg+ayYYoQnN1dDm3KuteWsfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFAB6A6CF3C
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

SEksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3Qt
ZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTWljaGHFgg0K
PiBHcnplbGFrDQo+IFNlbnQ6IFN1bmRheSwgMTUgTWFyY2ggMjAyNiAyLjM4DQo+IFRvOiBpZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogR3J6ZWxhaywgTWljaGFsIDxtaWNoYWwu
Z3J6ZWxha0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCAxLzJdIHRlc3RzL2Rl
dmljZV9yZXNldDogdW5sb2FkIGF1ZGlvIGJlZm9yZSBkZXNjcmlwdG9yDQo+IGNsb3N1cmUNCj4g
DQo+IEN1cnJlbnRseSBjaGVjayBmb3IgYXVkaW8gdW5sb2FkaW5nIGlzIGRvbmUgYWZ0ZXIgZHJp
dmVyJ3MgZmlsZSBkZXNjcmlwdG9yIGhhcyBiZWVuDQo+IGNsb3NlZC4gVGhpcyByZW5kZXJzIGlz
X2k5MTVfZGV2aWNlKCkgdXNlbGVzcyBzaW5jZSBjaGVjayBiYXNlcyBvbiB0aGUgZGVzY3JpcHRv
cg0KPiBwYXNzZWQuIE1vdmUgdGhlIGNoZWNrIGJlZm9yZSBjbG9zaW5nIHRoZSBkZXNjcmlwdG9y
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBHcnplbGFrIDxtaWNoYWwuZ3J6ZWxha0Bp
bnRlbC5jb20+DQoNCitLYWkNCg0KPiAtLS0NCj4gIHRlc3RzL2RldmljZV9yZXNldC5jIHwgNyAr
KysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2RldmljZV9yZXNldC5jIGIvdGVzdHMvZGV2aWNl
X3Jlc2V0LmMgaW5kZXgNCj4gNjJiMjk1YTA2ZS4uYjkzMWRmZjdhMCAxMDA2NDQNCj4gLS0tIGEv
dGVzdHMvZGV2aWNlX3Jlc2V0LmMNCj4gKysrIGIvdGVzdHMvZGV2aWNlX3Jlc2V0LmMNCj4gQEAg
LTM0NSw5ICszNDUsNiBAQCBzdGF0aWMgYm9vbCBoYXNfY29sZF9yZXNldChpbnQgc2xvdF9kaXIs
IGNvbnN0IGNoYXINCj4gKipyZWFzb24pDQo+ICAvKiBVbmJpbmQgdGhlIGRyaXZlciBmcm9tIHRo
ZSBkZXZpY2UgKi8gIHN0YXRpYyB2b2lkIGRyaXZlcl91bmJpbmQoc3RydWN0DQo+IGRldmljZV9m
ZHMgKmRldikgIHsNCj4gLQlpZiAoaXNfaTkxNV9kZXZpY2UoZGV2LT5mZHMuZGV2KSkNCj4gLQkJ
aWd0X2F1ZGlvX2RyaXZlcl91bmxvYWQoJmRldi0+c25kX2RyaXZlcik7DQo+IC0NCj4gIAlpZ3Rf
ZGVidWcoInVuYmluZCB0aGUgZHJpdmVyIGZyb20gdGhlIGRldmljZVxuIik7DQo+ICAJaWd0X2Fz
c2VydChpZ3Rfc3lzZnNfc2V0KGRldi0+ZmRzLmRydl9kaXIsICJ1bmJpbmQiLA0KPiAgCQkgICBk
ZXYtPmRldl9idXNfYWRkcikpOw0KPiBAQCAtNDI5LDYgKzQyNiwxMCBAQCBzdGF0aWMgdm9pZCBz
ZXRfZGV2aWNlX2ZpbHRlcihjb25zdCBjaGFyKiBkZXZfcGF0aCkNCj4gDQo+ICBzdGF0aWMgdm9p
ZCB1bmJpbmRfcmVzZXRfcmViaW5kKHN0cnVjdCBkZXZpY2VfZmRzICpkZXYsIGVudW0gcmVzZXQg
dHlwZSkgIHsNCj4gKwlpZiAoaXNfaTkxNV9kZXZpY2UoZGV2LT5mZHMuZGV2KSkgew0KPiArCQlp
Z3RfYXVkaW9fZHJpdmVyX3VubG9hZCgmZGV2LT5zbmRfZHJpdmVyKTsNCj4gKwl9DQo+ICsNCj4g
IAlpZ3RfZGVidWcoImNsb3NlIHRoZSBkZXZpY2VcbiIpOw0KPiAgCWNsb3NlX2lmX29wZW5lZCgm
ZGV2LT5mZHMuZGV2KTsNCj4gDQo+IC0tDQo+IDIuNDUuMg0KDQo=
