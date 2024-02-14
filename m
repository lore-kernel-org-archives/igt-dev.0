Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0E2C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 14:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE46210E28F;
	Wed, 14 Feb 2024 14:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLl6VZ1j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE4E10E28F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707920373; x=1739456373;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZHK2gwn5pU4IvIfP9K319W6mqQ1Qt13nIjiIFkXDYdo=;
 b=TLl6VZ1joNDTTP3dM4Rk/CzTTNhk7xSkHvz4xORTyAOyIkgE3kXcHhw3
 P66jvjPTsvKzRqidPL6PcpkzQ5voYNPeS9Z95dd7cF82PDb4GVYtIJm9G
 hCfFPOFEPclO/ESGKERrKjH6IiWVB4UfuJ+GLPrvSWinue9Sko+rxLI63
 XGsxC1ShYZ1tTLZDZVr/2aZ5Yg08CUD2tDzFCW+fCXzB+J+s+tis822kY
 4JkUTTaks4jyJVwOf0RfxSJEe6krfJGWDX9Jt/BXM2U4uiAMxR1g4Q5Aj
 9tlCSfq6Tbph29GmHEKAb5fiy0p1nzCeqYa0yVruGViat0MOXnTScLcgL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5783992"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="5783992"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 06:19:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="34260921"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 06:19:31 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 06:19:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 06:19:31 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 06:19:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJK8zlgC2xB++gTNnYk0+IscNObtnI5LRzkbNX92oEJG05qCHKtMaFSTEygUgHO4lVgxhvL3duvbmmUzVi+YCWMznwAMiG0DnfiQg0lYNLT5IlPvcIX7VtO64D/Zv5v8Cl8ZjTADXeNTzvBBr21Ql9W0iPbXlnvjhY8EIT312YKhQgJlDLAKxc2S2yElF1+nA11maxlYXfOaYZACK3PaE1K+dVigYBmYvCnxrp2SlSEi6ctXGrZyBYCiN6JabgjYzZkX0M1MBEeNo6FxQ6Yb5RQtYlEXH4ZZWqmnIADUqxiTr3veHAzeMyi6VQi5xn93qb300rQ7Hk6AOolAK3b8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHK2gwn5pU4IvIfP9K319W6mqQ1Qt13nIjiIFkXDYdo=;
 b=FdlGYsZTV15pexicRwpkRihHepvgBaaT+a0Pf0vhPYdLTx0JR1EGt2lg0jP4g4QXkb/zr8qrj6S0gP57qFgNjaiC2V1DjRy43eGbS+m0SzAXXfNArLielH54+cY5AQwjN/fDUTe5055LLx9jcg9pIxEY8ieZ4R4dvT0pBW8q5+ZJaBwFfh4LW0f13Q5UsuMBD4/83yj0+r9B5vkN1PVYS3altQKdv4xK7JbcvcAudGlAHh+l3uSOEHhHrx2bdtklJ6qd0VmZrSXCj8vT4CQZH6b9+PLJ0OVwYrXHfBLiQ+9aLT4g/thdkJVeUe1NS+ald3jlJhVswtsnD00fjd7CuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5021.namprd11.prod.outlook.com (2603:10b6:a03:2dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Wed, 14 Feb
 2024 14:19:28 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630%7]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 14:19:28 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dugast, 
 Francois" <francois.dugast@intel.com>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t, v2 2/2] drm-uapi/xe: Add test to query HuC firmware
 version
Thread-Topic: [PATCH i-g-t, v2 2/2] drm-uapi/xe: Add test to query HuC firmware
 version
Thread-Index: AQHaXzAPxOOzuxwEnEurZlbcP8b0xrEJ40AA
Date: Wed, 14 Feb 2024 14:19:28 +0000
Message-ID: <603ad09d4a04401381a4c5721314e84e00ec0d19.camel@intel.com>
References: <20240214102435.7-1-francois.dugast@intel.com>
 <20240214102435.7-3-francois.dugast@intel.com>
In-Reply-To: <20240214102435.7-3-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5021:EE_
x-ms-office365-filtering-correlation-id: e34dd4b8-ae28-45f8-bf71-08dc2d67f481
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pFFLxUR/NDmXDm66wWZAIcXYlzivUN8oOH4a1uIn41r4H+2NvsphljjrntWUgDCdlvMR0dTTFrmivc6h1oOf9oqB+Lobc/3KFEC4a1GQuTWOrTOcW4rZMmNZwhOJXB+ZvAe3qZg3BKMkxGhWfAnZSCgS/5agmP/tF5t9mX2uOHkNZeUA2n+oSObwxicmLTgKFYtq1dEXmMcfWxcKnHW1FIU/cy0zxqPnOGHfXM+uoH1Gsg7Pu4O/SjI8lh9fLM1YqKwxQP73HmcatTn+nt2aJZbwaz2NssxEiWEDm8XsYl5lzpAehvj0SiCceZpND5ft14EsEey5c50NwFA91aJvpsdtbGM6AVuS5qC9wxqPQvC4U6Dd+vZV1gaiN/aUZf5hCHYdRteuxDBN2HdaaDF3r5mAKE++SGOJSGbV1TthECUq4lugsS2UH0k+QdDl/xPRvrHfxuivs+rNgMnENPKU6vcvQzlzUpPKyFdMd5QINYjdQxOJaYRFuM0OYDC4cASiuUxHJhHIOGW4uLmGdSERXqH01WFxYVwy9S4ubG7mhPolR7hClXhsJgSVZUpc9FBwhdL17z5hmIex6zRRC0hhWDERmN0YNnWQELyw671pe1ODeuSfZcerTrWcAXjM1RyZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(396003)(346002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(6486002)(478600001)(6512007)(41300700001)(4326008)(38070700009)(8676002)(8936002)(2906002)(5660300002)(110136005)(86362001)(71200400001)(54906003)(66476007)(316002)(76116006)(66446008)(6636002)(66556008)(6506007)(64756008)(66946007)(2616005)(122000001)(82960400001)(26005)(36756003)(107886003)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1pTcUJESW1rOTJFdkdlaWR1S1dVb25iVE9GOGkvaVZsVEU3Ulhtbmtmb3VW?=
 =?utf-8?B?N2Y4aDFabnpXWVU5MFJTMkJFSEV1L09LcXpORjdNblV6RE84Wm1qV1pwVWdp?=
 =?utf-8?B?R3dVR0FrRTZPWEtGZVZuOWZEN2NEYnNqV0xqUTdDTXZpNlBHL1AxZy85ZUF4?=
 =?utf-8?B?K1FLZDV0azBrN0FiSnU0ZmVhS0U5ZlE2cW1wOEo0ZzVuK0lLYzN1VTBPbUhF?=
 =?utf-8?B?OGZnM24wSmQybjdTK1F0S2lRaE92VUYrUGV4UytQYytkNUhOcjVma0ZQcW9l?=
 =?utf-8?B?WDdwUmZkUEhPU0c5amxtZFB3VTJUamU3dVIrVnZuZ04zVVU5M2IwZVcvYlhQ?=
 =?utf-8?B?MU8xZzNiRnJzWVFtMDIxVUUvbzYvZlAwSCs4M3ZHUW5NaTl2aFQrd0tkWWxS?=
 =?utf-8?B?dHoySDV0cDhZbWNUMFFaRTZyeEF0UjRQNm02aVJSNzhSSkNGcUhuc29NdkNp?=
 =?utf-8?B?QTJHV3d4ZUVLTjNoT3dKc2N0bmtXWGc2K3NTQUFwNGx4Y1NjaEFNZEtKR0Z0?=
 =?utf-8?B?dUJWdk5NS0ZrSHFZU1VnV0c5UWNGV3k4ZkREMi91KzIwZEdTOG1wcmdJNlpw?=
 =?utf-8?B?cVB3WU5UaHg0U2J0S0dkWUhBVGQzL3VDZXpkT1AvWmM0SzRyOVBxMlV2RnRU?=
 =?utf-8?B?SUlMdVcvR1B1aSs3cVBNR05McnNoWkNGTFAvTk5WaTJnakxIbzhNQVE0dGJx?=
 =?utf-8?B?bVVkUTRwRXVHMnNEUm9lZ0RhRGxFbkVreUJ2WXRhTDR1V0RlQjA3RDBSaXJ6?=
 =?utf-8?B?Nm02Ti93SXdjMWtGNG9vQlFWSk5lUnphZUc1czJnZDlTTm5iVmxvbTUxY0VP?=
 =?utf-8?B?NCtGdytwV0RLMzZLQzdTdmxrc1l0T1BaSDVwVzh4K01YeXBwaXpiOWE3SVZO?=
 =?utf-8?B?UWFYYW1pWmUxeGEwZlh6dXRUbVBUdkcyYms2WEswMk8zVzJtYTZaY3pLc1gw?=
 =?utf-8?B?L0gzU0dEdWN4aFZVUVdsdXpkWTBHWWZpVHBwUzNncFAyY3ZTNFlPNGtCeFNY?=
 =?utf-8?B?MVFGS0RKUXlBaktkcDlVWDNMZjYwdkNOdGl4UllTRFZmbGl3ZkV3NVNQRDZT?=
 =?utf-8?B?S0svbGc5SXJtb2dBSmdNbHNlc0Q0SjRvOUFDV2MzbUlGSEtUUE1ZbzUrNnZh?=
 =?utf-8?B?Z3hYNkh5ai9oN3IyMmU1d2VZTDlPblJVVTFtWHNUMFlKUSt5ZGdpNU5RVTNi?=
 =?utf-8?B?T2RLUlRHdkI2dnljV1NIcUNDdWRWeDB0SEM3QmEzbVVNZXdkOUhFdWlJUHBl?=
 =?utf-8?B?aUhGUzFkUGhIUEIwcXZ3cDB6cmhwWTA2YkRqK2YvZnBEakg0T0dJTHV1eWRE?=
 =?utf-8?B?akJrdVJzWnRDN2J6VGp4eUNEbjMwMjM5bGhlNTh6Tnc2YzBiR0FtU3ljdmhC?=
 =?utf-8?B?MnVWc2JrKzNSdmFYdmhlRUVKYzJXcG9UbVhDSTh1RCs4ZkhESTFYK0FhMnow?=
 =?utf-8?B?OVFXT09YWGNwTGl0aGU0V2JZQ3JZSSs4Q2lZQ1Bkd0IzN0JNclllMTZyd1pu?=
 =?utf-8?B?Qjh6a01Oc2wyNnRKTHNSbm00bkpQa3lZQTJ2SlI4YlliZkVrM3duWXYzRDN3?=
 =?utf-8?B?VUtnbEVFQTN4ZEhYVWRWRWNHYWZpR3pGem1hS1d1TVBRak90a0JKaUd6M2pD?=
 =?utf-8?B?YUN0ci9zcVZGVzcvL09CM0dFZjNnei9BVjN6aldzNnc0bm9qZU9obGM2VDFC?=
 =?utf-8?B?OFFxWjBHMjAyV3NCM09Ub3pJYU0vNjdyTERaTDQ4a2lEd3FuS3hka1UvYU5F?=
 =?utf-8?B?NzhjZytxNmtXZU9YeGJsdk1OdHdET0tEbnJjRHE4bmc3VFZ0MFd6T3p2RWhH?=
 =?utf-8?B?N1pkZjJXeG4ybnl0RnNSdzEyQ25TdzZ6YmhKeXg5OStLaitiZWJXVHBFZFMy?=
 =?utf-8?B?MmJVdTdsRVp3VndTSGRLSmR2YnRwNUJweVEyNHptc2dZdDhSZHREZGsyU1hO?=
 =?utf-8?B?ejRYaEFyb1ZhNkdEZ0JEdnh6THZpaFlHTWRDS0JkQUhlSE9hNkhxMEJLM2I2?=
 =?utf-8?B?ZEF1UDFKY1FiYThlSTRYZmZaamxPb0pidllSTkY0QzJKQlhEVllEcDd4VTFr?=
 =?utf-8?B?U0tzOW0rdCtmbW90RVVHMFFoNjV5UUtXblBlbmJ0ZzlGbVlCQWlraDh6UnZF?=
 =?utf-8?B?aU1uQnpSQUVpRUpRMFUxVE8zbXZ1YVd0VTFHZUIrSHRQWFQvQUJ0bUdXd3Mw?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69382FA7FDDF7842BA17F26266AA86EC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e34dd4b8-ae28-45f8-bf71-08dc2d67f481
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 14:19:28.6165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iD4eGHubJV3HeQt2vM2tl3CRoEHHHT0RTs+mcKjtEzRH2APf3N0hcbvA0AZBptNYAcpdlsYu0+zRXZ75LPlpEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5021
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
DQo+IFRoaXMgYWxpZ25zIHdpdGgga2VybmVsIGNvbW1pdCAoImRybS94ZTogRXh0ZW5kIHVBUEkg
dG8gcXVlcnkgSHVDDQo+IG1pY3JvLWNvbnRyb2xlciBmaXJtd2FyZSB2ZXJzaW9uIikuDQo+IA0K
PiB2MjoNCj4gLSBGaXggcHJpbnRpbmcgYnJhbmNoIChGcmFuY29pcyBEdWdhc3QpDQo+IC0gTWFr
ZSBFTk9ERVYgdGhlIG9ubHkgYWNjZXB0ZWQgZXJyb3IgKEpvc8OpIFJvYmVydG8gZGUgU291emEp
DQo+IA0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBp
bnRlbC5jb20+DQoNCj4gQ2M6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5j
b20+DQo+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4N
Cj4gQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+DQo+
IC0tLQ0KPiAgaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaCB8ICAxICsNCj4gIHRlc3RzL2ludGVs
L3hlX3F1ZXJ5LmMgICAgfCA1NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmggYi9pbmNsdWRlL2RybS11YXBpL3hlX2RybS5o
DQo+IGluZGV4IDNiZDc5NWYyNy4uY2U0YWNmOWQ0IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2Ry
bS11YXBpL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmgNCj4gQEAg
LTU4Myw2ICs1ODMsNyBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2VuZ2luZV9jeWNsZXMgew0KPiAg
c3RydWN0IGRybV94ZV9xdWVyeV91Y19md192ZXJzaW9uIHsNCj4gIAkvKiogQHVjOiBUaGUgbWlj
cm8tY29udHJvbGxlciB0eXBlIHRvIHF1ZXJ5IGZpcm13YXJlIHZlcnNpb24gKi8NCj4gICNkZWZp
bmUgWEVfUVVFUllfVUNfVFlQRV9HVUNfU1VCTUlTU0lPTiAwDQo+ICsjZGVmaW5lIFhFX1FVRVJZ
X1VDX1RZUEVfSFVDIDENCj4gIAlfX3UxNiB1Y190eXBlOw0KPiAgDQo+ICAJLyoqIEBwYWQ6IE1C
WiAqLw0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfcXVlcnkuYyBiL3Rlc3RzL2ludGVs
L3hlX3F1ZXJ5LmMNCj4gaW5kZXggZDUxZTczZWE1Li5lNTIzYzM4MGIgMTAwNjQ0DQo+IC0tLSBh
L3Rlc3RzL2ludGVsL3hlX3F1ZXJ5LmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfcXVlcnkuYw0K
PiBAQCAtODI1LDYgKzgyNSw2MiBAQCB0ZXN0X3F1ZXJ5X3VjX2Z3X3ZlcnNpb25faW52YWxpZF9t
YnooaW50IGZkKQ0KPiAgCWZyZWUodWNfZndfdmVyc2lvbik7DQo+ICB9DQo+ICANCj4gKy8qKg0K
PiArICogU1VCVEVTVDogcXVlcnktdWMtZnctdmVyc2lvbi1odWMNCj4gKyAqIFRlc3QgY2F0ZWdv
cnk6IGZ1bmN0aW9uYWxpdHkgdGVzdA0KPiArICogRGVzY3JpcHRpb246IERpc3BsYXkgdGhlIEh1
QyBmaXJtd2FyZSB2ZXJzaW9uDQo+ICsgKg0KPiArICogU1VCVEVTVDogbXVsdGlncHUtcXVlcnkt
dWMtZnctdmVyc2lvbi1odWMNCj4gKyAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxpdHkgdGVz
dA0KPiArICogU3ViLWNhdGVnb3J5OiBNdWx0aUdQVQ0KPiArICogRGVzY3JpcHRpb246IERpc3Bs
YXkgSHVDIGZpcm13YXJlIHZlcnNpb24gZm9yIGFsbCBYZSBkZXZpY2VzLg0KPiArICovDQo+ICtz
dGF0aWMgdm9pZA0KPiArdGVzdF9xdWVyeV91Y19md192ZXJzaW9uX2h1YyhpbnQgZmQpDQo+ICt7
DQo+ICsJc3RydWN0IGRybV94ZV9xdWVyeV91Y19md192ZXJzaW9uICp1Y19md192ZXJzaW9uOw0K
PiArCXN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5IHF1ZXJ5ID0gew0KPiArCQkuZXh0ZW5zaW9u
cyA9IDAsDQo+ICsJCS5xdWVyeSA9IERSTV9YRV9ERVZJQ0VfUVVFUllfVUNfRldfVkVSU0lPTiwN
Cj4gKwkJLnNpemUgPSAwLA0KPiArCQkuZGF0YSA9IDAsDQo+ICsJfTsNCj4gKwlpbnQgcmV0Ow0K
PiArDQo+ICsJaWd0X2Fzc2VydF9lcShpZ3RfaW9jdGwoZmQsIERSTV9JT0NUTF9YRV9ERVZJQ0Vf
UVVFUlksICZxdWVyeSksIDApOw0KPiArDQo+ICsJdWNfZndfdmVyc2lvbiA9IG1hbGxvYyhxdWVy
eS5zaXplKTsNCj4gKwlpZ3RfYXNzZXJ0KHVjX2Z3X3ZlcnNpb24pOw0KPiArDQo+ICsJdWNfZndf
dmVyc2lvbi0+dWNfdHlwZSA9IFhFX1FVRVJZX1VDX1RZUEVfSFVDOw0KPiArCXVjX2Z3X3ZlcnNp
b24tPnBhZCA9IDA7DQo+ICsJdWNfZndfdmVyc2lvbi0+cGFkMiA9IDA7DQo+ICsJdWNfZndfdmVy
c2lvbi0+cmVzZXJ2ZWQgPSAwOw0KPiArCXF1ZXJ5LmRhdGEgPSB0b191c2VyX3BvaW50ZXIodWNf
ZndfdmVyc2lvbik7DQo+ICsNCj4gKwlyZXQgPSBpZ3RfaW9jdGwoZmQsIERSTV9JT0NUTF9YRV9E
RVZJQ0VfUVVFUlksICZxdWVyeSk7DQo+ICsNCj4gKwlpZ3RfYXNzZXJ0KHJldCA9PSAwIHx8IGVy
cm5vID09IEVOT0RFVik7DQo+ICsNCj4gKwlpZiAocmV0ID09IDApIHsNCj4gKwkJaWd0X2Fzc2Vy
dCh1Y19md192ZXJzaW9uLT5tYWpvcl92ZXIgPiAwKTsNCj4gKw0KPiArCQlpZ3RfaW5mbygiWEVf
UVVFUllfVUNfVFlQRV9IVUMgJXUuJXUuJXUuJXVcbiIsDQo+ICsJCQkgdWNfZndfdmVyc2lvbi0+
bWFqb3JfdmVyLA0KPiArCQkJIHVjX2Z3X3ZlcnNpb24tPm1pbm9yX3ZlciwNCj4gKwkJCSB1Y19m
d192ZXJzaW9uLT5wYXRjaF92ZXIsDQo+ICsJCQkgdWNfZndfdmVyc2lvbi0+YnJhbmNoX3Zlcik7
DQo+ICsJfSBlbHNlIHsNCj4gKwkJLyoNCj4gKwkJICogTm8gSHVDIHdhcyBmb3VuZCwgZWl0aGVy
IGJlY2F1c2UgaXQgaXMgbm90IHJ1bm5pbmcNCj4gKwkJICogeWV0IG9yIHRoZXJlIGlzIG5vIG1l
ZGlhIElQLg0KPiArCQkgKi8NCj4gKwkJaWd0X2luZm8oIlhFX1FVRVJZX1VDX1RZUEVfSFVDIE5v
IEh1QyBpcyBydW5uaW5nXG4iKTsNCj4gKwl9DQo+ICsNCj4gKwlmcmVlKHVjX2Z3X3ZlcnNpb24p
Ow0KPiArfQ0KPiArDQo+ICBpZ3RfbWFpbg0KPiAgew0KPiAgCWNvbnN0IHN0cnVjdCB7DQo+IEBA
IC04MzksNiArODk1LDcgQEAgaWd0X21haW4NCj4gIAkJeyAicXVlcnktdG9wb2xvZ3kiLCB0ZXN0
X3F1ZXJ5X2d0X3RvcG9sb2d5IH0sDQo+ICAJCXsgInF1ZXJ5LWNzLWN5Y2xlcyIsIHRlc3RfcXVl
cnlfZW5naW5lX2N5Y2xlcyB9LA0KPiAgCQl7ICJxdWVyeS11Yy1mdy12ZXJzaW9uLWd1YyIsIHRl
c3RfcXVlcnlfdWNfZndfdmVyc2lvbl9ndWMgfSwNCj4gKwkJeyAicXVlcnktdWMtZnctdmVyc2lv
bi1odWMiLCB0ZXN0X3F1ZXJ5X3VjX2Z3X3ZlcnNpb25faHVjIH0sDQo+ICAJCXsgInF1ZXJ5LWlu
dmFsaWQtY3MtY3ljbGVzIiwgdGVzdF9lbmdpbmVfY3ljbGVzX2ludmFsaWQgfSwNCj4gIAkJeyAi
cXVlcnktaW52YWxpZC1xdWVyeSIsIHRlc3RfcXVlcnlfaW52YWxpZF9xdWVyeSB9LA0KPiAgCQl7
ICJxdWVyeS1pbnZhbGlkLXNpemUiLCB0ZXN0X3F1ZXJ5X2ludmFsaWRfc2l6ZSB9LA0KDQo=
