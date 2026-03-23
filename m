Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE78F532EC
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 08:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6338310E53A;
	Tue, 24 Mar 2026 08:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gv71d+Y6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF3910E029
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774274791; x=1805810791;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=/ygPh7AK6c4sGPSJk+rOxTeKs+CawDGg55LJ2aEKUy8=;
 b=Gv71d+Y6BTSm2N1YlHeawFErHesaORprQLWigJmVpH+lVq4a763K7yAv
 RPCDGFjPXNNXRHuUPK+fcRKVpjjp3GJbWsoiNnErUnNrNOkA64yNbaA0y
 P9yF/HOEWAgYXQlS3OaqkjYs4ZXhQ5M4p8OrtfpXcFcctld5qKsKgMtAq
 jgJZe7AVElMq2zmyXGd3WGUKoPFK7S+J89NF6NdemuDjNjWRDxFEQZ6gj
 cx6gsEh/GAhrcgXn4JkVlM8N6SWj0fjDreuXQWu/wcDku7Pilw3oRJGKX
 EDO8xks/QxOlOQDLKieMKBWY+8RawIP9SM6OMJSsBtKWhQIbOQyyI83VQ g==;
X-CSE-ConnectionGUID: ByIJxSDOT96vZzbvRviovQ==
X-CSE-MsgGUID: LTZScckKSBaug4v9uLyG7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="85967239"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="85967239"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:06:31 -0700
X-CSE-ConnectionGUID: vZKc2g03TaujwfefbKyr+Q==
X-CSE-MsgGUID: PaXxQOaSTF6SpU9OcMVaVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="228110435"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:06:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 07:06:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 07:06:30 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 07:06:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhUPppWS+QRr3osBtltTkcnrUqegvBTbQZ6peGbTqlDmrfniQue1bJihGFrNeQ1L3RnhKV73QnduaTmiFFOIX85JsuH+GVLyVFN8ZuL1of45XSIpi9JkLPAM+Nc7oT5SNG0xSEMIq4CqETrrAwkAE9l2FQ10Xkp0LseVrcJt+5g9jSAsoqIWWrI72gMPJ4ZuS+Hy4Ha++4N4uR6sZ1WFlHZ5uCG3TgGVIzQkqiZ3D26KNqpmpjshQ6BNmdvIni3FBQ+/B5EiV4k4K6Fe+LSwFyn6TMH/1qT3UqQZvspl9Hy/9XxqtyRCDRdsboWzQEp/ejTs89l+ZWX7o7gQ3iGg7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2On+Ax9vocrCjFifQiepoOJyVfFXQA2N5Rjg2xBlUQ0=;
 b=dVucRnFuoZgc4VhzYf0pqJsH5zN4dihBlcgsdKB/hK4YUCoE33OaQtKJ4w/JOjhBpGw7B1/IwZc0VD2mWY0LWzwgqYiVVHaspcaX9NU//+Z6afgiCVtcFIk6taFe+9LB/Dr3PtK6xA9MzzDkdW3zzuOZBD5e8OXtvOKRudeU+jwY8oiiyeHcCyjuWzA1o6tONLc73gau1JaRGuFMfcsgddt8iaCfT8S0E2982BehvvjvUGERMeZtQh091PtyWM1EllA4Gei4sM+RAknxdEiVtjczyM/CLZ9dkHcRfZTDOcfSvcOEVKw9miFS2Hk54h2j0B0R2qLXhb1DTKLtBi86yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF76AA2D882.namprd11.prod.outlook.com
 (2603:10b6:518:1::d30) by SJ0PR11MB6742.namprd11.prod.outlook.com
 (2603:10b6:a03:47b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 14:06:27 +0000
Received: from PH3PPF76AA2D882.namprd11.prod.outlook.com
 ([fe80::1e5b:6543:92a6:7856]) by PH3PPF76AA2D882.namprd11.prod.outlook.com
 ([fe80::1e5b:6543:92a6:7856%7]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 14:06:27 +0000
From: "Vehmanen, Kai" <kai.vehmanen@intel.com>
To: "Saarinen, Jani" <jani.saarinen@intel.com>, "Grzelak, Michal"
 <michal.grzelak@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/device_reset: unload audio on xe as well
Thread-Topic: [PATCH i-g-t 2/2] tests/device_reset: unload audio on xe as well
Thread-Index: AQHctBQp/PbgnN+Cskyyf4jLLC8K0LW8Mx1ggAAATpA=
Date: Mon, 23 Mar 2026 14:06:27 +0000
Message-ID: <PH3PPF76AA2D8824705069BA862097BB536904BA@PH3PPF76AA2D882.namprd11.prod.outlook.com>
References: <20260315003826.3785048-1-michal.grzelak@intel.com>
 <20260315003826.3785048-2-michal.grzelak@intel.com>
 <PH3PPFAB4263235A4D6B17EBEF53B3C9DC4E04BA@PH3PPFAB4263235.namprd11.prod.outlook.com>
In-Reply-To: <PH3PPFAB4263235A4D6B17EBEF53B3C9DC4E04BA@PH3PPFAB4263235.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF76AA2D882:EE_|SJ0PR11MB6742:EE_
x-ms-office365-filtering-correlation-id: d6462c0d-2170-42b5-2be4-08de88e56025
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info: BgvzRisI9VoegqZ9Onz8AX8QvZD69SO4U3dNa0beEj2506FokFd8sVaHBz6hPGiUHoHIsF1Q52qtXIexBLXf16zxtCypGh4NkaVuER1egiCNH+Cxl+Iz3FDbe5XDHu5xKQNzvvbQd8fJKsMe3Yie78yjTXP7UHEQp2P9PjA1SsYt2CoqA+nx3VIhNXp+FuTm9gQcZGP0duVr3cbLHCNxFfGrYfme9EzFPJLJ+iR7E2dHK7L6m2jgbDeg5PQ8QrLDlUy0dgS5KCM/ULPRQJsgf65h3Szo2YHXeF6iQhlb7oHKftwZfHcPgOD+Zd1O7yi3lh1HFSbD6s+uVKZOEMwA8WyLmDSpa6jhUPebsphKfPIXxuOKMKIFNet65ntPJ20M3wkVq54+sjl4sFizOkybLk59G/Re6/oX4GgYV2XVWK3D3KjQzusjofyDE7MBReT+3VhqhccA/tN95Kjqfa2ibwZ305renalTnxNp+WCpDsT9dt5HIJRhH2mm04Rak7uSW6KboXKy5hvEo3knrws2vwQhMtG7qWfdoDP+l7b/IGbhZ6gTlUbx/xU4PuUIiHAqwCqpaGU5A4wnJ3NHyVy7nevXLKMIdLvBCNar9WV1ksiCh0oxyqC0Ar9iEw5WT/NdfRmN0slF5gaSUU5J6wygSuWCc4h7RIwUu4iI5DcYvcSDNpjnTNBE0PwTJIAbfNcJxJvIX/pJ02LDNFnenQzQTdAx1QLR4vkDDSQWvHNf9A5rlP6qlgqSelApChynDw7ASkbJ15/nMEUaA8Ey8m69SJwpHu/ua89DTqmX7grS3gw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF76AA2D882.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ynh4YndKNUhWOTIxSzZsZWNoZC9mbHMwZll6b1U3bHcyOGNLYnFrZzU2RXc4?=
 =?utf-8?B?ZXJIbnFMSThpZGV4c2VoZHphYXYxNjBtbytEWUY2U2xMQlRhNllvc1FlKzBo?=
 =?utf-8?B?cjkrZ0ZBSGJ1MUd0RVpSWXhoUWRoTzE5Nk5zc2VlY1RhOTBSY1hJcjJnRE13?=
 =?utf-8?B?WlFaREE2amluWFZCaXBMWTVmRTZ6VVhJZGYvQjgwK2dxVXQwMG5GdjI5eS9l?=
 =?utf-8?B?dFVwSWNYdnVHVDR1Z29SMExHQ0dXOEgzRUxleXMvUkJjNTJNamlRZ3ZRZjNQ?=
 =?utf-8?B?ckZLVk5LVngybFJQd1cyR3gxSUgzeVpCcnU5Mmswa3ZoUkhKRjFCbmVvY3kr?=
 =?utf-8?B?TFZONDJsaGtMTW1US2lyOC9IOHRhUk5wcUIxTXJZOWNxL0kxcWtBTE1aMndU?=
 =?utf-8?B?WU5WR3lWTUEwU1I2WDdQRHp4dktXWEthb0JYWE5aVFp4REhReFhSa1p1OE9w?=
 =?utf-8?B?VXpTc0prWElzN29JbmE2TGV4OHlweE9aemNwWi84aVk5cHRUM3ZOaTVXcFQv?=
 =?utf-8?B?Y01YTnV5UFJRTUlmZkd6RG9EK2lwSDBqT0UxY2dMYXVRZFVuK0s2UkYxOWhS?=
 =?utf-8?B?dVVGZ3gwaTI5QnNiZjJkdTBiWEtncHZvRlhsTHVHU0xqV21aTjRnS0pVa3Jr?=
 =?utf-8?B?R0xhUnhZZlJPMmpUaEN6WnFKc05PWGl3cnA1L1VuamZEdDVGNTM0Qit5V2Rv?=
 =?utf-8?B?RUtHWDIrQkV1Wm5LVlp1YkVzVnVGaVJFemJtK04wRjQ3bXE1ZE8wdjAzSnZu?=
 =?utf-8?B?UlRsTU5mejZEQkRGelg1dWQyaWFWeE5EdnBWM2MycUM1R215YWpHUEZ6YkRk?=
 =?utf-8?B?aTNHNm80N3ovTjdZZ2NzOW9pMmZFdnM1N1hZRy9aNmpwdnVuYktCN0JmQXlp?=
 =?utf-8?B?UmIzUFlMMTRZckJEb2pqKzNrN29meXdzZmZ1dXFMelJ4VHZtNXlGZWgyUmVm?=
 =?utf-8?B?UUVrQWdYdmx0cXllb3pSQ091NS92UERiSHh1d283bGVjZGRTVm96RGRWUGpK?=
 =?utf-8?B?TklkK2JyVllwRS9EUkJLQXhyZFN3dGJXTXVyQnNHSU4zQkE2UXJ3Y0lHaHFM?=
 =?utf-8?B?Q3RobzFlOXR4dy9aQTdVR1luQ2ZFaWdPTlZaaS9xVHNtVkFPYnpIQ084VTVV?=
 =?utf-8?B?WmpOU0d5LzdETSt0UG05dHRldmdkbG5oYXJsNC80VXozYUNHYWwvcWRZYjhq?=
 =?utf-8?B?eWZybm9NYWI0RnBzaUoyaDBVcDhEdWxOc0NTNzBtUndiQ1VvZVptTWJ6dEhp?=
 =?utf-8?B?YWtWVEN5R0htUlhoamhaNHc0a3o0UE5xRVgyakd0Uk5wUlluelcyNGxCSkpl?=
 =?utf-8?B?VGhiczR5S1p3VlBoc0VKYWpLVWppZHU4LzJYNCtZSmRHdGtuK2k0NDM2YlB5?=
 =?utf-8?B?aWFJQWdCWlliVXRrRjJIbjJoclYwRXFlRHV0YUZJN083L2k4Z1p2a2JsU2dJ?=
 =?utf-8?B?SkdKVzZFOGhRaFRyMi9OSFBLTkY5cFFJRW1XOFprUDcwemwzZk5JOWlNTG5F?=
 =?utf-8?B?c2IxdysvcnZGRENCUzNuUEZwa2JLK1RDdkxTek9hWGtrNFU0eWpGdDJ6QVlI?=
 =?utf-8?B?TlJsM3gzK0lsdnBFd0ltSkxLeUlaU254dERXdUZkN3JEbExNTm91SGVJZGxH?=
 =?utf-8?B?dElqUnJFWEtiRlFqRjJRTjgrSTR0YnhUSTgrYXZFZlJpWlpNODBvbFVMS2tr?=
 =?utf-8?B?aEZLSjdwN2haSTRJN0F0VGlPU1MzcEtpTTUyWXM2ZTl3M0VNYVYxcnBjRENk?=
 =?utf-8?B?TjBJT1FzSEZzRjVOV1pxV3ZndGxHczJqeXNCY0xqZjgrN0tOMUFvWVVFazA1?=
 =?utf-8?B?OHNoa1RZNVRpVVFJSVFZQ252a2R0eXN6TCtrN0Mra0ZmVWx6SWxydGNTRjVK?=
 =?utf-8?B?NXNaUHdEVVpmYys5dXQ2eDZhUE1CRGI0QWc0Q1NpT1FGT2txbWFyNXVpcnFD?=
 =?utf-8?B?WXJVV0h5N05BaTR5M2xyM1JRT1Q3OWxuaWpYUnkwUDhnRW1MNFhBVmwvbDFZ?=
 =?utf-8?B?MzEySUQxU2tIcysxdmdFelFINW1tWTAyV09DL3JxcDh5R2JFSHcrMmVCcDU1?=
 =?utf-8?B?OWRSNDlHY25UUlVsN1NDQjNkeEZUbnBhVVlyUVZ0bjhTbFN2QmNLSlp5MFhE?=
 =?utf-8?B?TDhWazU3UlpZaGpSSmNOQURLL2o4c1ZkZE8vbEtkS0lPQ0taaUc4RDZ3NVF5?=
 =?utf-8?B?OEZ4QWxKaExBYnIvNTJoTlVZWS9xVHJQazVkOGVqS0pUdFJuTmFDWHp1eHkw?=
 =?utf-8?B?SWl4RjlpUVRmY1Zld1VTZkhqSXVCc25sdGpxc0dNV1RmVW9BdytObG1sNmJM?=
 =?utf-8?B?N0cySTVQSjFrckJISUowVEZpeC9xRGR2YnhwSjNQZThKc09PMDR4UT09?=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: plMRWhdbmG7TTlakPUyGjNx1XEBXD5jN4R8WXgj32br6FBbbrCJ7ywLXR9gwTFimXYZBp3sFBZPpXv3UKAzaJicJoOz7lVL81YyFeTPGfe85jR3qydHKWawdQr09mB1Id40lcWPU/8Hk6cWfbQPdlo1y4PMcZGf/wkkcxJ8oOmT9AH+myl/FC/ScylhtfdQEUrAkKHPK71jqY0HsIxh8iSNrGgc8UYlHRvGIm7ZcbVCObBPmMPG/hh/7f3WPXJmVwkYiNPz6OEbh4cWLuaGMhEwdgbet27iRe4xtRYUJvL1p7gpdnt0gnmls0cLzHnWAOoWnV9NXNgyQjA/5YDFrYQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF76AA2D882.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6462c0d-2170-42b5-2be4-08de88e56025
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 14:06:27.4646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v/WHa51QhwTwcxQw+sNvqmwSZsJTKI16nSlFRlHdu7UVVTh5FJGugNx8P/R+ptbmdO0LQ6ZrnycVcCb8L+KQmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6742
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Tue, 24 Mar 2026 08:12:19 +0000
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

SGV5LA0KDQpPbiAyMyBNYXJjaCAyMDI2LCBKYW5pIFNhYXJpbmVuIHdyb3RlOg0KPiBPbiAxNSBN
YXJjaCAyMDI2LCBNaWNoYcWCIEdyemVsYWsgIHdyb3RlOg0KPj4gU3ViamVjdDogW1BBVENIIGkt
Zy10IDIvMl0gdGVzdHMvZGV2aWNlX3Jlc2V0OiB1bmxvYWQgYXVkaW8gb24geGUgYXMgIHdlbGwN
Cg0KZm9yIHRoZSBzZXJpZXM6DQpSZXZpZXdlZC1ieTogS2FpIFZlaG1hbmVuIDxrYWkudmVobWFu
ZW5AbGludXguaW50ZWwuY29tPg0KDQpUaGUgc2FtZSByZXN0cmljdGlvbiBhcHBsaWVzIHRvIHhl
IGRyaXZlciBhcyB3ZWxsLCBzbyB0aGlzIGlzIG5lZWRlZC4NCg0KQnIsIEthaQ0KDQotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KSW50ZWwgRmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEg
SGVsc2lua2kgCkJ1c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQg
aW4gSGVsc2lua2kgCgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWlu
IGNvbmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCBy
ZWNpcGllbnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBw
bGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4K

