Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D14BC48BC1
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 14:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA5F10E28F;
	Wed, 14 Feb 2024 14:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgpNXvHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B6F10E28F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707920255; x=1739456255;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nDY0Ov64Mv7c3ZQfFhHEh5vbK34kZ/LqPFl2nc80Dog=;
 b=MgpNXvHFh2rW0KrlphX9IH6Xm5MlKqzX3RjF7YLMm+rISWCNfxPPyNk2
 HTVorbveF7ZIhxCCJgiojYqyHpScFaUwwzG2d0yJCUIsRK41repc01jWa
 SAC5o6WPtUq8V0TYPBF2Ony/4KusTXWNPTaQ5IhjBZ0Ff9YqZrk6v7kPO
 HyK5n/9tq4hfjslHrKh0lj8rzkJ5D0LwflSZVC+kiI4B8zySS1dZxvzBk
 p2KFFZ5nviTkj/6FJahSWaGyiPUj37qMbs0qLaKcm+4LpD716rsvLLYQC
 oFiXgJEqXAfo4Tsss+0qsoFVkHPKIVzj2YF8hu1Cs5Hkiq+OosintRmlp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2089367"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2089367"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 06:17:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="34008481"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 06:17:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 06:17:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 06:17:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 06:17:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 06:17:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cy1Og+iQvNme9g23gp1zMGmrHGGY8a1HVJq4d9xe32byiB5sGxjwf2MtqE4OpZi/wLEHEdqc/ub3TjXCRTyGrU9FVuR2FMH9rZN740yPeW5xGQchVLsGViuu6Ixovd9VmRwt9g5vfDGnPquH+1dJ0rIgqkBC/YIKTQTbXy7Tn1D05LeiakBRxXICN+nmhZHsBrIarjvr1rOsm+rxIs8M9a1K9JY5wlCiTr3pVR/kjN4t12rCfdAxYheAlg1i88IXLdhXngtvfXiA5++SxN8nE+ZxA9hL0dqS7iUk6rr7A/Z/97fR6kVzQMoMEZGS6N8o1PXjWbzP5JSEVUxHAXBgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDY0Ov64Mv7c3ZQfFhHEh5vbK34kZ/LqPFl2nc80Dog=;
 b=NUEkZOSo2HDbl1YGyjojWuBytluwhpPL6GHV/X6iExbxpqMhJLE1RzhJ8v7u7XCVWdJOoL/uTvUDvbd+XwH2tIkPS/AfZDXlp0Ha5ivo6Ip4vEujv3Rsa+LUnceoZB9qVdmXU+ve0Go0lZ8iUle7wxuPDQ92YSVIrzwBkNcbxrN8be4aUZz6FRjBF5ps/CTbx/URdNu8W5fqWR3HPjq7tQXxvJMndjOfA6MZfaTPBL6nj1UYDwmCPYFQCv3IZ1EeNQdTmTMrYvy60pLDP7eKr+veuLKH0GlPQQ80qX3SNUNe0bhmRk1Y41RQekFOCsDy+lTG1PrHG7cCWQLI6wHQaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5814.namprd11.prod.outlook.com (2603:10b6:a03:423::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 14:17:26 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630%7]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 14:17:25 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dugast, 
 Francois" <francois.dugast@intel.com>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t, v2 1/2] drm-uapi/xe: Add test to query GuC firmware
 submission version
Thread-Topic: [PATCH i-g-t, v2 1/2] drm-uapi/xe: Add test to query GuC firmware
 submission version
Thread-Index: AQHaXzAO8QF6ANllmEapQ7dbJaKtqrEJ4q6A
Date: Wed, 14 Feb 2024 14:17:25 +0000
Message-ID: <1dec6f7fa4822d546e1026a00eade354a47c0f2b.camel@intel.com>
References: <20240214102435.7-1-francois.dugast@intel.com>
 <20240214102435.7-2-francois.dugast@intel.com>
In-Reply-To: <20240214102435.7-2-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5814:EE_
x-ms-office365-filtering-correlation-id: 29798491-cf0c-4e12-8d23-08dc2d67ab49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c+dTu/pwVut+tYRGjopmmvyOHYbQYkhQd6NUguAPtjpmWogjv1oHjnIN+QTJd6w+x9S703Q3wmRdn+aQFJEpWM3Vu2T0bErpux2QAWng6mgPwVoEFTKmxF+rj58UqUkTwR3bq5onn53rV8suR/7cvhSGDtlC8vN3Sz5gJQNB+bZ2jQk4v2yVcgKKWTIyW0udKnKe6++FHE8ClEtifToPTbPA7Kxv9V3BKCeIo86GlCmq3Y9TWf6NrJ9KW+7Ven04Pfw/ZB9xUP53h5CwcuiQ6I7iSnmOG8NyjwLMuAXxKNno3gHM5dcBuNiSpplBpe4CvT6vIfYtbWsCBGtafVMa1P+WnTlHOi+pKFMKPmPso2D+6uoQhrISfVXDpV+I+/sZvMByl4c3T1KRMW4oe3EKx5FIMRfLaz+2FPTnBaIFc7PFRZS6OyIjjPlhVCcfXSjjD8J3ALwFsh1LR5QJ3qS3IWk2Bd93LIu+8b4GUXS5MXGUbpQ+otJV7GKpMDSGRy6trRkRy9jZMv0CNjCwowpq8E73Ww+Iw0uUpbu07QdJws04xmKV1tcpqxrDo16lXqKMfXALnzLFHb2nCIlDYK4PTrbpjhDT8ZPdw0wXkqoh2KCrWrrosRfJ3J8+S23p3eg/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(2616005)(26005)(38100700002)(107886003)(122000001)(76116006)(4326008)(66446008)(8936002)(8676002)(5660300002)(66946007)(66556008)(64756008)(66476007)(6506007)(6512007)(2906002)(478600001)(82960400001)(6486002)(41300700001)(54906003)(316002)(71200400001)(6636002)(110136005)(38070700009)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGxPVGNoYTVhUXFSRlBEYzQwOUxrdU5JYm04WEllMlJyNWNwTU0yUmxoN3V1?=
 =?utf-8?B?NWxVNUVKMzdtT21rOFFKL3hNQWdXdWxDRzM4d0lwNjA5eDg5L1RVVjFxVXcr?=
 =?utf-8?B?d2xIYWkyb2l3ZDdMUEw0MW8ySHlQOWFUeWlNaWh3RzI3NzVwbGRMWURoNnpI?=
 =?utf-8?B?QzZNWE1xUGRuSDcxUjlNK1Vueld6V2I1bkE4OVl5VDJmVGowVktMcGFJV1FI?=
 =?utf-8?B?Y1k5dk83UWdhVG9lWmduREpxZXFUUUk0Vk5BK042SkpWK0xoSWd0c1cvTWRu?=
 =?utf-8?B?dXpJMEVVY3FvRURuY0R4KzYveVVXbmRtenA1UGtSWDM5NjBzVGVWUmFnRlN3?=
 =?utf-8?B?Q3VUdmxrWXdwQmhQWndRM1g5c2NNeXRCZzNBVUtQaDdYMGppN2VraXFhQURU?=
 =?utf-8?B?a3ZSMG1zK0RSbjdmZitqQWliUWs0bWh6RktxQ0FuMkszOXNwQndMZTBvWTk1?=
 =?utf-8?B?MGpadHUzQnkxZUYzRTE1Q0RJUm5zVGhGY1d1U3ZLWVFKMGVpQkJpZjFXVXht?=
 =?utf-8?B?Z2lkY0pwWDBueHNtUkg0WjRZMDRjeSs4eTJlMzhxck0wQTJQZmVNaGVWUkdj?=
 =?utf-8?B?TGl1ZmZ3T3VOL2hIV3V3UWZ4T25nMHpLcXRHM0xCZjRQVWQ1UGJqSFE3OERu?=
 =?utf-8?B?SzBFc2Y4NXlFUkxQOExraEZIWjZwMi9yb050dE5nY1VvK2tsZHdsNmxwQkQr?=
 =?utf-8?B?M0taRWRVRklOTXN1R2pvalVZYWlYb25EZWM5UnpxbTVldzRDR0RxMml6RjlH?=
 =?utf-8?B?M3UyWVlaNXd4aXFERkRSR0V2YzRUd2NhNlozK3FsMnk1bTNEaElmQndackFo?=
 =?utf-8?B?MVg3TS8rSUFnVUVhRWw0WFQ2aFpWYkRNVXRQNHNQM3J1Z0thZW9LRGlVdE9U?=
 =?utf-8?B?RTA2YUorM1JjRTVDUTNueVZjVER1MDc5ZFpZcUlmSWtjTmF1dFd3cXJ0SXRq?=
 =?utf-8?B?LzQvUEdLbHZQUWNoUXNrejFHelUxZ1MrUzdsa2lQdHhSMmYwYUFKdTFJUHdT?=
 =?utf-8?B?cWlRTmNvSE16SEdmcW9wTEtBNTdCazlWckczbG9nYnZLcU10Z2FoS25IdURj?=
 =?utf-8?B?ZC9JLzhTQUxwOElybHNjUFdJNnUvQmk0Q3gyWk9zUlY3TWh4dGF0Z3NZcXU2?=
 =?utf-8?B?a3A4QllOQmM2T2hHT0lLcTdYd3hUR05YRFg5SWJaUmZqb0JWdzh2SU5JbFow?=
 =?utf-8?B?Y3hJbmtCRFFGV2FDUXpDaUJBSzVLNXdJVVV2SEwyMzhWV1phT254OGJtenkz?=
 =?utf-8?B?d1JjTjl6OExVdUlkTUlmSDBsdHh2d1M2Tkgzbi84MkJRNllYMmpkd3Rjc0Fv?=
 =?utf-8?B?Y3dCS1NPREhRRy9kYXNYbW9wVzRTZmZKWm1BaERwbHhEMVdWd2lpd1BnRHFv?=
 =?utf-8?B?blhqTVdCTjF2SHVQOUVXb2dEMmFaaWJoRCtna2wwOTU5TU9oY2ZxRldZMjNR?=
 =?utf-8?B?UnZ2ckJWajNxT1lJaGpZQUxuRENLRm14NWRaRi9UZ21YZFdSQTU4eHJ0VjJN?=
 =?utf-8?B?YVlTaHY4Qkl2SGk4WTFZNTB3Z3lkcmMxRkRETElhYVI4U09ocnB0TlBDVlM1?=
 =?utf-8?B?Q1VpNUxVa090cWY0cVJSU29GVjEzM2tMR1l3UHh1M3p3WmFkTitYMXhwencx?=
 =?utf-8?B?VllITVQwSUZ3Rmxqbno0TXd2NlIzUjVIT2lNanpka0hrazluWVJPdXh3eUJW?=
 =?utf-8?B?V0FWdzAvY2lFQkUyN1VxMktWNElRSDFCUnU3bGJMYVNnTUlMdnNzdjVRWHhy?=
 =?utf-8?B?SDRJOWlyTlVxVFFpUXhtai9HbGxNU1U4RXdyVFZPYzNIQTI1dlpKVXZZRW9E?=
 =?utf-8?B?VHU2V3U2RXd1eEZjTjdneGNCTDgwblI3cWhyMWY1U0lOclh6Sy9FVWNSMTlG?=
 =?utf-8?B?OTFxNk12L0ovZGJzcFV2VTQwRk9IVTIzcThIaHFLRzRtNm50eGo2Ky9QaFFK?=
 =?utf-8?B?UzhQSmN6aE03bExBT2VLWXY0a2J1TjdUK3RoNVlnRVRQQ0w5YjFZdUNxUFRa?=
 =?utf-8?B?WTVrREJpZDdKQytsY08vSC8rcGFJeG90VTF6ZFg4eURBTTZJTWRScllLdVdP?=
 =?utf-8?B?TEZlVmQxZmxwcFFBTXFtUkEvTlZyQ2draENUQUZhM3daZmJrQUhxRmc1VzVR?=
 =?utf-8?B?ZXdNRTZJTTA4WUZqOGhYbS8rcFpiM2lMSWVWUVNoWndwZlI1ZHhkZUZmMXps?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01A2503FCD2F9B409BF53E7F8A30DC1C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29798491-cf0c-4e12-8d23-08dc2d67ab49
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 14:17:25.7836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cbvFNKctOp8D2UE5UdYaBD9P3Kg5wLKJDbgxmJKv47XDTdeL+Xy3FO6Xw36Wij+VPavEI3uYInRfK2+QxhIUSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5814
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

T24gV2VkLCAyMDI0LTAyLTE0IGF0IDEwOjI0ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IFRoaXMgYWxpZ25zIHdpdGgga2VybmVsIGNvbW1pdCAoImRybS94ZTogQWRkIHVBUEkgdG8g
cXVlcnkgR3VDIGZpcm13YXJlDQo+IHN1Ym1pc3Npb24gdmVyc2lvbiIpLg0KPiANCg0KUmV2aWV3
ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQo+
IENjOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KPiBDYzogSm9z
w6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+IENjOiBMdWNhcyBE
ZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRnJh
bmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGluY2x1
ZGUvZHJtLXVhcGkveGVfZHJtLmggfCAzMSArKysrKysrKysrKysrDQo+ICB0ZXN0cy9pbnRlbC94
ZV9xdWVyeS5jICAgIHwgOTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEyOCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaCBiL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmgN
Cj4gaW5kZXggYmFjZGNhNzg3Li4zYmQ3OTVmMjcgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJt
LXVhcGkveGVfZHJtLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaA0KPiBAQCAt
NTc0LDYgKzU3NCwzNiBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2VuZ2luZV9jeWNsZXMgew0KPiAg
CV9fdTY0IGNwdV9kZWx0YTsNCj4gIH07DQo+ICANCj4gKy8qKg0KPiArICogc3RydWN0IGRybV94
ZV9xdWVyeV91Y19md192ZXJzaW9uIC0gcXVlcnkgYSBtaWNyby1jb250cm9sbGVyIGZpcm13YXJl
IHZlcnNpb24NCj4gKyAqDQo+ICsgKiBHaXZlbiBhIHVjX3R5cGUgdGhpcyB3aWxsIHJldHVybiB0
aGUgbWFqb3IsIG1pbm9yLCBwYXRjaCBhbmQgYnJhbmNoIHZlcnNpb24NCj4gKyAqIG9mIHRoZSBt
aWNyby1jb250cm9sbGVyIGZpcm13YXJlLg0KPiArICovDQo+ICtzdHJ1Y3QgZHJtX3hlX3F1ZXJ5
X3VjX2Z3X3ZlcnNpb24gew0KPiArCS8qKiBAdWM6IFRoZSBtaWNyby1jb250cm9sbGVyIHR5cGUg
dG8gcXVlcnkgZmlybXdhcmUgdmVyc2lvbiAqLw0KPiArI2RlZmluZSBYRV9RVUVSWV9VQ19UWVBF
X0dVQ19TVUJNSVNTSU9OIDANCj4gKwlfX3UxNiB1Y190eXBlOw0KPiArDQo+ICsJLyoqIEBwYWQ6
IE1CWiAqLw0KPiArCV9fdTE2IHBhZDsNCj4gKw0KPiArCS8qIEBtYWpvcl92ZXI6IG1ham9yIHVj
IGZ3IHZlcnNpb24gKi8NCj4gKwlfX3UzMiBtYWpvcl92ZXI7DQo+ICsJLyogQG1pbm9yX3Zlcjog
bWlub3IgdWMgZncgdmVyc2lvbiAqLw0KPiArCV9fdTMyIG1pbm9yX3ZlcjsNCj4gKwkvKiBAcGF0
Y2hfdmVyOiBwYXRjaCB1YyBmdyB2ZXJzaW9uICovDQo+ICsJX191MzIgcGF0Y2hfdmVyOw0KPiAr
CS8qIEBicmFuY2hfdmVyOiBicmFuY2ggdWMgZncgdmVyc2lvbiAqLw0KPiArCV9fdTMyIGJyYW5j
aF92ZXI7DQo+ICsNCj4gKwkvKiogQHBhZDI6IE1CWiAqLw0KPiArCV9fdTMyIHBhZDI7DQo+ICsN
Cj4gKwkvKiogQHJlc2VydmVkOiBSZXNlcnZlZCAqLw0KPiArCV9fdTY0IHJlc2VydmVkOw0KPiAr
fTsNCj4gKw0KPiAgLyoqDQo+ICAgKiBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSAtIElucHV0
IG9mICZEUk1fSU9DVExfWEVfREVWSUNFX1FVRVJZIC0gbWFpbg0KPiAgICogc3RydWN0dXJlIHRv
IHF1ZXJ5IGRldmljZSBpbmZvcm1hdGlvbg0KPiBAQCAtNjQzLDYgKzY3Myw3IEBAIHN0cnVjdCBk
cm1feGVfZGV2aWNlX3F1ZXJ5IHsNCj4gICNkZWZpbmUgRFJNX1hFX0RFVklDRV9RVUVSWV9IV0NP
TkZJRwkJNA0KPiAgI2RlZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZX0dUX1RPUE9MT0dZCQk1DQo+
ICAjZGVmaW5lIERSTV9YRV9ERVZJQ0VfUVVFUllfRU5HSU5FX0NZQ0xFUwk2DQo+ICsjZGVmaW5l
IERSTV9YRV9ERVZJQ0VfUVVFUllfVUNfRldfVkVSU0lPTgk3DQo+ICAJLyoqIEBxdWVyeTogVGhl
IHR5cGUgb2YgZGF0YSB0byBxdWVyeSAqLw0KPiAgCV9fdTMyIHF1ZXJ5Ow0KPiAgDQo+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC94ZV9xdWVyeS5jIGIvdGVzdHMvaW50ZWwveGVfcXVlcnkuYw0K
PiBpbmRleCA5YTY3OTljODQuLmQ1MWU3M2VhNSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwv
eGVfcXVlcnkuYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9xdWVyeS5jDQo+IEBAIC03MzAsNiAr
NzMwLDEwMSBAQCBzdGF0aWMgdm9pZCB0ZXN0X2VuZ2luZV9jeWNsZXNfaW52YWxpZChpbnQgZmQp
DQo+ICAJcXVlcnlfZW5naW5lX2N5Y2xlcyhmZCwgJnRzKTsNCj4gIH0NCj4gIA0KPiArLyoqDQo+
ICsgKiBTVUJURVNUOiBxdWVyeS11Yy1mdy12ZXJzaW9uLWd1Yw0KPiArICogVGVzdCBjYXRlZ29y
eTogZnVuY3Rpb25hbGl0eSB0ZXN0DQo+ICsgKiBEZXNjcmlwdGlvbjogRGlzcGxheSB0aGUgR3VD
IGZpcm13YXJlIHN1Ym1pc3Npb24gdmVyc2lvbg0KPiArICoNCj4gKyAqIFNVQlRFU1Q6IG11bHRp
Z3B1LXF1ZXJ5LXVjLWZ3LXZlcnNpb24tZ3VjDQo+ICsgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlv
bmFsaXR5IHRlc3QNCj4gKyAqIFN1Yi1jYXRlZ29yeTogTXVsdGlHUFUNCj4gKyAqIERlc2NyaXB0
aW9uOiBEaXNwbGF5IEd1QyBmaXJtd2FyZSBzdWJtaXNzaW9uIHZlcnNpb24gZm9yIGFsbCBYZSBk
ZXZpY2VzLg0KPiArICovDQo+ICtzdGF0aWMgdm9pZA0KPiArdGVzdF9xdWVyeV91Y19md192ZXJz
aW9uX2d1YyhpbnQgZmQpDQo+ICt7DQo+ICsJc3RydWN0IGRybV94ZV9xdWVyeV91Y19md192ZXJz
aW9uICp1Y19md192ZXJzaW9uOw0KPiArCXN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5IHF1ZXJ5
ID0gew0KPiArCQkuZXh0ZW5zaW9ucyA9IDAsDQo+ICsJCS5xdWVyeSA9IERSTV9YRV9ERVZJQ0Vf
UVVFUllfVUNfRldfVkVSU0lPTiwNCj4gKwkJLnNpemUgPSAwLA0KPiArCQkuZGF0YSA9IDAsDQo+
ICsJfTsNCj4gKw0KPiArCWlndF9hc3NlcnRfZXEoaWd0X2lvY3RsKGZkLCBEUk1fSU9DVExfWEVf
REVWSUNFX1FVRVJZLCAmcXVlcnkpLCAwKTsNCj4gKw0KPiArCXVjX2Z3X3ZlcnNpb24gPSBtYWxs
b2MocXVlcnkuc2l6ZSk7DQo+ICsJaWd0X2Fzc2VydCh1Y19md192ZXJzaW9uKTsNCj4gKw0KPiAr
CXVjX2Z3X3ZlcnNpb24tPnVjX3R5cGUgPSBYRV9RVUVSWV9VQ19UWVBFX0dVQ19TVUJNSVNTSU9O
Ow0KPiArCXVjX2Z3X3ZlcnNpb24tPnBhZCA9IDA7DQo+ICsJdWNfZndfdmVyc2lvbi0+cGFkMiA9
IDA7DQo+ICsJdWNfZndfdmVyc2lvbi0+cmVzZXJ2ZWQgPSAwOw0KPiArCXF1ZXJ5LmRhdGEgPSB0
b191c2VyX3BvaW50ZXIodWNfZndfdmVyc2lvbik7DQo+ICsNCj4gKwlpZ3RfYXNzZXJ0X2VxKGln
dF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX0RFVklDRV9RVUVSWSwgJnF1ZXJ5KSwgMCk7DQo+ICsJ
aWd0X2Fzc2VydCh1Y19md192ZXJzaW9uLT5tYWpvcl92ZXIgPiAwKTsNCj4gKw0KPiArCWlndF9p
bmZvKCJYRV9RVUVSWV9VQ19UWVBFX0dVQ19TVUJNSVNTSU9OICV1LiV1LiV1LiV1XG4iLA0KPiAr
CQkgdWNfZndfdmVyc2lvbi0+bWFqb3JfdmVyLA0KPiArCQkgdWNfZndfdmVyc2lvbi0+bWlub3Jf
dmVyLA0KPiArCQkgdWNfZndfdmVyc2lvbi0+cGF0Y2hfdmVyLA0KPiArCQkgdWNfZndfdmVyc2lv
bi0+YnJhbmNoX3Zlcik7DQo+ICsNCj4gKwlmcmVlKHVjX2Z3X3ZlcnNpb24pOw0KPiArfQ0KPiAr
DQo+ICsvKioNCj4gKyAqIFNVQlRFU1Q6IHF1ZXJ5LWludmFsaWQtdWMtZnctdmVyc2lvbi1tYnoN
Cj4gKyAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxpdHkgdGVzdA0KPiArICogRGVzY3JpcHRp
b246IENoZWNrIHF1ZXJ5IHdpdGggaW52YWxpZCBhcmd1bWVudHMgcmV0dXJucyBleHBlY3RlZCBl
cnJvciBjb2RlLg0KPiArICoNCj4gKyAqIFNVQlRFU1Q6IG11bHRpZ3B1LXF1ZXJ5LWludmFsaWQt
dWMtZnctdmVyc2lvbi1tYnoNCj4gKyAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxpdHkgdGVz
dA0KPiArICogU3ViLWNhdGVnb3J5OiBNdWx0aUdQVQ0KPiArICogRGVzY3JpcHRpb246IENoZWNr
IHF1ZXJ5IHdpdGggaW52YWxpZCBhcmd1bWVudHMgZm9yIGFsbCBYZSBkZXZpY2VzLg0KPiArICov
DQo+ICtzdGF0aWMgdm9pZA0KPiArdGVzdF9xdWVyeV91Y19md192ZXJzaW9uX2ludmFsaWRfbWJ6
KGludCBmZCkNCj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X3VjX2Z3X3ZlcnNpb24gKnVj
X2Z3X3ZlcnNpb247DQo+ICsJc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgcXVlcnkgPSB7DQo+
ICsJCS5leHRlbnNpb25zID0gMCwNCj4gKwkJLnF1ZXJ5ID0gRFJNX1hFX0RFVklDRV9RVUVSWV9V
Q19GV19WRVJTSU9OLA0KPiArCQkuc2l6ZSA9IDAsDQo+ICsJCS5kYXRhID0gMCwNCj4gKwl9Ow0K
PiArDQo+ICsJaWd0X2Fzc2VydF9lcShpZ3RfaW9jdGwoZmQsIERSTV9JT0NUTF9YRV9ERVZJQ0Vf
UVVFUlksICZxdWVyeSksIDApOw0KPiArDQo+ICsJdWNfZndfdmVyc2lvbiA9IG1hbGxvYyhxdWVy
eS5zaXplKTsNCj4gKwlpZ3RfYXNzZXJ0KHVjX2Z3X3ZlcnNpb24pOw0KPiArDQo+ICsJdWNfZndf
dmVyc2lvbi0+dWNfdHlwZSA9IFhFX1FVRVJZX1VDX1RZUEVfR1VDX1NVQk1JU1NJT047DQo+ICsJ
dWNfZndfdmVyc2lvbi0+cGFkID0gMDsNCj4gKwl1Y19md192ZXJzaW9uLT5wYWQyID0gMDsNCj4g
Kwl1Y19md192ZXJzaW9uLT5yZXNlcnZlZCA9IDA7DQo+ICsJcXVlcnkuZGF0YSA9IHRvX3VzZXJf
cG9pbnRlcih1Y19md192ZXJzaW9uKTsNCj4gKw0KPiArCS8qIE1ha2Ugc3VyZSB0aGUgYmFzZWxp
bmUgcGFzc2VzICovDQo+ICsJaWd0X2Fzc2VydF9lcShpZ3RfaW9jdGwoZmQsIERSTV9JT0NUTF9Y
RV9ERVZJQ0VfUVVFUlksICZxdWVyeSksIDApOw0KPiArDQo+ICsJLyogTWFrZSBzdXJlIEtNRCBy
ZWplY3RzIG5vbi16ZXJvIHBhZGRpbmcvcmVzZXJ2ZWQgZmllbGRzICovDQo+ICsJdWNfZndfdmVy
c2lvbi0+cGFkID0gLTE7DQo+ICsJZG9faW9jdGxfZXJyKGZkLCBEUk1fSU9DVExfWEVfREVWSUNF
X1FVRVJZLCAmcXVlcnksIEVJTlZBTCk7DQo+ICsJdWNfZndfdmVyc2lvbi0+cGFkID0gMDsNCj4g
Kw0KPiArCXVjX2Z3X3ZlcnNpb24tPnBhZDIgPSAtMTsNCj4gKwlkb19pb2N0bF9lcnIoZmQsIERS
TV9JT0NUTF9YRV9ERVZJQ0VfUVVFUlksICZxdWVyeSwgRUlOVkFMKTsNCj4gKwl1Y19md192ZXJz
aW9uLT5wYWQyID0gMDsNCj4gKw0KPiArCXVjX2Z3X3ZlcnNpb24tPnJlc2VydmVkID0gLTE7DQo+
ICsJZG9faW9jdGxfZXJyKGZkLCBEUk1fSU9DVExfWEVfREVWSUNFX1FVRVJZLCAmcXVlcnksIEVJ
TlZBTCk7DQo+ICsJdWNfZndfdmVyc2lvbi0+cmVzZXJ2ZWQgPSAwOw0KPiArDQo+ICsJZnJlZSh1
Y19md192ZXJzaW9uKTsNCj4gK30NCj4gKw0KPiAgaWd0X21haW4NCj4gIHsNCj4gIAljb25zdCBz
dHJ1Y3Qgew0KPiBAQCAtNzQzLDEwICs4MzgsMTIgQEAgaWd0X21haW4NCj4gIAkJeyAicXVlcnkt
aHdjb25maWciLCB0ZXN0X3F1ZXJ5X2h3Y29uZmlnIH0sDQo+ICAJCXsgInF1ZXJ5LXRvcG9sb2d5
IiwgdGVzdF9xdWVyeV9ndF90b3BvbG9neSB9LA0KPiAgCQl7ICJxdWVyeS1jcy1jeWNsZXMiLCB0
ZXN0X3F1ZXJ5X2VuZ2luZV9jeWNsZXMgfSwNCj4gKwkJeyAicXVlcnktdWMtZnctdmVyc2lvbi1n
dWMiLCB0ZXN0X3F1ZXJ5X3VjX2Z3X3ZlcnNpb25fZ3VjIH0sDQo+ICAJCXsgInF1ZXJ5LWludmFs
aWQtY3MtY3ljbGVzIiwgdGVzdF9lbmdpbmVfY3ljbGVzX2ludmFsaWQgfSwNCj4gIAkJeyAicXVl
cnktaW52YWxpZC1xdWVyeSIsIHRlc3RfcXVlcnlfaW52YWxpZF9xdWVyeSB9LA0KPiAgCQl7ICJx
dWVyeS1pbnZhbGlkLXNpemUiLCB0ZXN0X3F1ZXJ5X2ludmFsaWRfc2l6ZSB9LA0KPiAgCQl7ICJx
dWVyeS1pbnZhbGlkLWV4dGVuc2lvbiIsIHRlc3RfcXVlcnlfaW52YWxpZF9leHRlbnNpb24gfSwN
Cj4gKwkJeyAicXVlcnktaW52YWxpZC11Yy1mdy12ZXJzaW9uLW1ieiIsIHRlc3RfcXVlcnlfdWNf
ZndfdmVyc2lvbl9pbnZhbGlkX21ieiB9LA0KPiAgCQl7IH0NCj4gIAl9LCAqZjsNCj4gIAlpbnQg
eGUsIGdwdV9jb3VudDsNCg0K
