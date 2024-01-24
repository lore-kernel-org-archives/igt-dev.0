Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2998EC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 12:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1B110E9F8;
	Wed, 24 Jan 2024 12:06:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D953810E9F8
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 12:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706098008; x=1737634008;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SDgTX3MBC+gVSk2XyN/TxD5XMM7jxJjYnFSSiyDePK4=;
 b=LIs7Q/upGzfDqV4BadsqF+bbi0VjyRmbP/NCXh2nDI2/lUYtdO09kifj
 bw17JrZTEM6Bkol8//9Vf5OS60FjuD6q61ulAZJQmPy0z/K2LalLDVb8V
 PKua2SEWs+23OzBq7WYsLEoUtOOc9xUkLqbinRneIiWKRFAT/iOi/t+wX
 YPior3e6e9M5+5JK6hjRK19agvZvIzdrfJ++C9tr5A7lHgfcRJIGVdM6U
 SePPDlkO9MnEVGY/7/6e+beMzTSoQGjYL+cpAdvyqMnyf4mkEwb7ebsf0
 N7vA52//A8I3DwtaOrb9aZYDl08wQRa/VqDYeKzD7UDhFyUt1X2VCpxLF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="23290559"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="23290559"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 04:06:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1909969"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 04:06:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 04:06:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 04:06:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 04:06:45 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 04:06:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbVtAa6nycDFpQfFc6XDdraMQ/kStt83V6mYFS6G78SK5DSv0kzxh0TfdA1GWQ3oIio32Msx2hgGUARtR0UtfN4L8NEiUPbkBq3UJm4kTAyKo2NXLlMOLR9m1Phfy23DHpYe6XxBah8j8WsAORtdgHn3ncjhTc7EZyM4MlBQo7IaEMAgbT5BeKUncDTCHiwdkVvzXpJWTVa6Rd8HtsOo0Favdv6d89dPR/hM5B/KVRt27J+VtnjH0ga7VIF5HKEWk5gDJTlerZsxx1XEnFGiSHpweOZkmLEY6vDbkgx94fR46eSY9/lJ+FahMolthHt0JUivUhn3qXuvELpgEpNBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDgTX3MBC+gVSk2XyN/TxD5XMM7jxJjYnFSSiyDePK4=;
 b=RYeelDwW9E1a7e/9mk3WBjkFvRH3qIdEfxDmSvyfopqWIxjsWdt5cS0Zma1tzX1WHSgS6UlL+MclrWXUKWVsQcATLQFSp1t/HZVUK6/G8+Djuu8aYMRwHQvz1wm0zldncjx152yicUZcY+l7KmVcDoh92709GwZUul9f0QdE3z/BDXkZnB36dmJ4kOVFkr9BuwjuKI8ADvR0Ysvv+9L1eQ0UspGnbATHx0DJIH74SmswnFLSKc4Sns+AheEKp/D67R4uOMUkCJ6LQ1r91PrBI9l4APUBOB6V60rIT2224UdBRhRLwABqGPC9epsbMbJJxLRzbsyW0Hf8Ae3QNUSpRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 12:06:43 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035%3]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 12:06:43 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] lib/igt_psr: add helper to check of given psr
 mode can be enabled
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_psr: add helper to check of given psr
 mode can be enabled
Thread-Index: AQHaTq+PQrptdua0f0C9wUYG4z5IRbDo27UAgAABMyA=
Date: Wed, 24 Jan 2024 12:06:43 +0000
Message-ID: <CY8PR11MB68892CCAC82F1B40750C22C2DA7B2@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240124103410.1259607-1-kunal1.joshi@intel.com>
 <20240124103410.1259607-2-kunal1.joshi@intel.com>
 <63ff29e1-66a3-4f30-be54-476f345a1aee@intel.com>
In-Reply-To: <63ff29e1-66a3-4f30-be54-476f345a1aee@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|IA1PR11MB7919:EE_
x-ms-office365-filtering-correlation-id: 14d933e4-2f80-4e72-29d2-08dc1cd4ee20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9qic/Opewm69veKtrW80E/xHntaCNgGMG5UznCMYoWPK16RUMkLlizRijqKkYYtK0ZKSSS5CgWdGGUdJI63t3duYo9hs4cZxrmxz5yqQJe3gT/DoxHYnby/C/C9IB/f8HmJY0oMSRW/9NWvMzvVbnasIp7CZmI0A7U5pNLlJhhMKLKFK6CXixo3jb5J/teQ1scDUJOeasDc5TUJa9GxZs0qwN4pbNCgMlPcckkdAcG6mLZWjSfdC3Po7ydaA4FMku56meC9BVddMawhnP0+9cMDuPFaw/37mo1W0qEY71vgLxG13oefn4D7UMjpBHwvFvaOZzutifvy6rLzoepbkNWvHmt2SabwU7KfDJPxCjT1iVkgzNrYyaCGhHfD+am5zGEozJt0yaN6T1Bu7DHlzqIZUbvgkkGhYRH70BUT+tlQoUFJZSGkz0I0ot2YslXbZmTd56DEF+aQ7FQoiuGdJBCNm8oStSOpecMjumqOGKarHxU38vd2WWOW92MRQ1mN2LyrExcDKUU/nrBH6UVLZcUD2CTK1SrcEwJYe6vTjO2Z/8WPBsmEkwHuTmw46szS0Bx2K3Ch693VfcnJz0wi9kxrI0wLCVHC3P2lqfCLgLp8auSnd1wOTCMq4AZXtGU1L
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66446008)(82960400001)(122000001)(38100700002)(478600001)(7696005)(38070700009)(86362001)(53546011)(6506007)(41300700001)(71200400001)(33656002)(8936002)(4326008)(8676002)(26005)(110136005)(316002)(76116006)(66946007)(66556008)(66476007)(107886003)(64756008)(5660300002)(2906002)(52536014)(83380400001)(9686003)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDlRTWdlTXlqTEdBcWNDdW5oQWZDZmxIcm90ME0xc3dGWUVseHREQ0wyZ2d5?=
 =?utf-8?B?c1k3TUFuWjVjVmJobTZsbHh6WUZFcE9IVEZIaUQ5Mjc2MjJYTmpHS05aSmNu?=
 =?utf-8?B?aWM1bjNDRGgweXJsbS85aytDb0E3LzhNenEyTHAwd3pTdUE5U0t0aENHSk43?=
 =?utf-8?B?WE9GNEVZUDFEU1lkYk5Yb1ZDOSs5b2xFcVN6dnBZb3dxNUc3T2dDRTdyYzEy?=
 =?utf-8?B?M3ZBQ2ZISXJmVDJpeXJXQXo0RFpUdlR1TFdiRUNPamdwVk8veGJTbnZtZW1t?=
 =?utf-8?B?cmFqQVZBM2ZTcmVkRmhnYzNiVCtRb2tlNzdTcStnU0VTcytvS3ZOL0k5Szkr?=
 =?utf-8?B?aEU2VSttOU1HRXVQYjB4Z1ZraXJHNlZpdEk0VUVWRzE5V2dJQlFITDdqeTZ2?=
 =?utf-8?B?c1RQcDVXejR6N0d3RkllYjk3cUZJSkJzSGRzTG1NckRNY2xLVGJKLzRQUWRE?=
 =?utf-8?B?ck1OQXVRa28zQURWTmc1cEg5Q000Nm9wMXBFT1JDT1o4dnZvVy9zQmJIdWNO?=
 =?utf-8?B?UzhtblNtc2hnd2VCNTYza2FrdVVtTGhRV0FwZnNTdUFCNVRYUG1YQlMxU01D?=
 =?utf-8?B?QnQrdjR2SVk1SGNoMGhla2tXRHorZGZyZDIvOGlQcGJ4Y29rOFI1bEh0ZEFB?=
 =?utf-8?B?alg3REtId0hzaDErR0NiWUNwN2c5NDFwZTRjQzRMMGx6aDN0T1pGTndZQkdq?=
 =?utf-8?B?bExDSHMxSjFCUVlXcG5aWXF2aU51ejM2TUpaSjYvYUNXZ0RVMVNES1B0Zk9R?=
 =?utf-8?B?a0xpM3hQZVB5QndvWWpjYlJ5VE5OR2FEalpiVDIwUlRJdHhVOVhNLyt4VjBp?=
 =?utf-8?B?dmZQbVBoM2ttK3JlbGVSUTd0QWNoSCtlUEllMlI5dXlpdWJRTlFkc0NzY2ds?=
 =?utf-8?B?a05neUR5QS9JbjZVMEVnL1V3ekY1MllycXZhcmhoeHlHeTltMkk1a0NFeTdm?=
 =?utf-8?B?Zk4wVHE0R1BQV0RveFRyeElXeTNYRHNoR08rUkdvY2N5dWtCSHV2SVYvMVU2?=
 =?utf-8?B?ZmtiVWJpSDZuMGZ5U3drZDJUTkoyK2dPQXNzU2oyeklXMXQ2Q1FaU1Z5T2Uy?=
 =?utf-8?B?NHRGeE1iODhhR3N2dzMyOGtTb3E2SUJFUzYwS2doS1FFU2MzTWliMmkwSnhC?=
 =?utf-8?B?dlJGaWVNME9qWkRFY2JhZmZjeVJYR3dIakN2QndaZmIxWFlMNjVXSVR3NTN1?=
 =?utf-8?B?MmdNcjFiT3hQTlFKck43cTBQeXdmOHRDczNGeG85RStjQlFrTFlYdDZkQnQx?=
 =?utf-8?B?WGJnZ1B3OHBmVThxRFNFeWc2OHd6ekdsTVhKK0VwLzVRTytjYkVHVWtZTzJl?=
 =?utf-8?B?bnR6SjZGbXVydzFmenNIdXF3c3pYSTF0VElDZzJhTndKMXVkY29lTmwrcGR2?=
 =?utf-8?B?ZzU2UkpxNTZVOHVUQ21LZGJ3OWFCbGxZMWlLOExWTWpmaDI4L1ZYc3hVZ2tL?=
 =?utf-8?B?OElNaTFkZUlJMzBGaWx0czZoMjZGTXh6cGlYWFhPVXJTdmZ2SXFzSXB3VHpu?=
 =?utf-8?B?NVBCRmJ2ZHI3a2s5ZXlMQ2hYOTd6b2lxRmtkYkZxd21MdjI2ekpmN2N1UlBa?=
 =?utf-8?B?TXVXbGd0Y0EzUGlHQjBqckpndHhWeExhRythYW9WOU15UmZiVjJybnNkallY?=
 =?utf-8?B?RWRqNTRsSE5lbWRKWXVUcHE3bTlhU3ZUSFA2UkFBdFpVVlBicTFTcW16Zmd1?=
 =?utf-8?B?MXRnay95Y3RKRUZmOFNkaE5GM0x5Sk0ySGRLbXcxWWJuTjJBb2dPTCtkZHE1?=
 =?utf-8?B?K3dnTGtJSlNNc2lTSXQ0NjgrOHFJaEt3ODJSN25zMEJsMmV0ZUZoQ0VGZWc5?=
 =?utf-8?B?d1U2S1hLK3VnZzFHSHBINzVlOHFJTGVhb2JEOU9kL0ZhV3pkTE5BMGkwRDl3?=
 =?utf-8?B?ZVM2dWdORkFpV2ZiLy9ZOXVpdkNPY1dZYTlwbTJtZ0VFdVZRZms3eGRrQW9y?=
 =?utf-8?B?OS8yRDhmSmlxVkZJTTV6RWRZVGc5T1pQQXFSMkNhditPaHNtZk5SZmNMMXVC?=
 =?utf-8?B?Um5WUWR3dnhOcEJnSTU4OWtSVU9KN1JXV2k5eXdDMVhBckpua3crM3AxTXRY?=
 =?utf-8?B?T3FzL0FDYkdPbVBxZlFGTWIrS1NkSkJpa0ZrWnNLKzF5Q2FwUWUzYzhVOEFp?=
 =?utf-8?Q?Ykke4iUBDxH/iCVrXiRfvTmh4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d933e4-2f80-4e72-29d2-08dc1cd4ee20
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 12:06:43.3364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BxOdELp7KIHNh2WQPHg475P+26G0Z5IrPQyZjFfhkXmuOvHwnL68etLwwI81I3jvbLnuhkjj/TRzQkvGm9mpIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
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

SGVsbCBiaGFudQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTW9kZW0sIEJo
YW51cHJha2FzaCA8YmhhbnVwcmFrYXNoLm1vZGVtQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNk
YXksIEphbnVhcnkgMjQsIDIwMjQgNToyOCBQTQ0KVG86IEpvc2hpLCBLdW5hbDEgPGt1bmFsMS5q
b3NoaUBpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEIsIEpl
ZXZhbiA8amVldmFuLmJAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCAxLzJd
IGxpYi9pZ3RfcHNyOiBhZGQgaGVscGVyIHRvIGNoZWNrIG9mIGdpdmVuIHBzciBtb2RlIGNhbiBi
ZSBlbmFibGVkDQoNCkhpIEt1bmFsLA0KDQpPbiAyNC0wMS0yMDI0IDA0OjA0IHBtLCBLdW5hbCBK
b3NoaSB3cm90ZToNCj4gQ2hlY2sgaWYgZ2l2ZW4gcHNyIG1vZGUgY2FuIGJlIGVuYWJsZWQgYnkg
cmVhZGluZyBlbmFibGVfcHNyIG1vZHBhcmFtDQo+IA0KPiBDYzogSmVldmFuIEIgPGplZXZhbi5i
QGludGVsLmNvbT4NCj4gQ2M6IEJoYW51cHJha2FzaCBNb2RlbSA8YmhhbnVwcmFrYXNoLm1vZGVt
QGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogS3VuYWwgSm9zaGkgPGt1bmFsMS5qb3NoaUBp
bnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPg0K
PiAtLS0NCj4gICBsaWIvaWd0X3Bzci5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4gICBs
aWIvaWd0X3Bzci5oIHwgIDEgKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jIGluZGV4
IDY2M2JhYzE2My4uYWMyMTRmY2ZjIA0KPiAxMDA2NDQNCj4gLS0tIGEvbGliL2lndF9wc3IuYw0K
PiArKysgYi9saWIvaWd0X3Bzci5jDQo+IEBAIC0zOTQsMyArMzk0LDIzIEBAIGVudW0gcHNyX21v
ZGUgcHNyX2dldF9tb2RlKGludCBkZWJ1Z2ZzX2ZkKQ0KPiAgIA0KPiAgIAlyZXR1cm4gUFNSX0RJ
U0FCTEVEOw0KPiAgIH0NCj4gKw0KPiArLyoqDQo+ICsgKiBpc19wc3JfZW5hYmxlX3Bvc3NpYmxl
DQo+ICsgKiBDaGVjayBpZiBnaXZlbiBwc3IgbW9kZSBjYW4gYmUgZW5hYmxlZCBieSByZWFkaW5n
IGVuYWJsZV9wc3INCj4gKyAqIG1vZHBhcmFtDQo+ICsgKg0KPiArICogUmV0dXJuczoNCj4gKyAq
IFRydWUgaWYgZ2l2ZW4gcHNyIG1vZGUgY2FuIGJlIGVuYWJsZWQsIGZhbHNlIG90aGVyd2lzZS4N
Cj4gKyAqLw0KPiArYm9vbCBpc19wc3JfZW5hYmxlX3Bvc3NpYmxlKGludCBkcm1fZmQsIGVudW0g
cHNyX21vZGUgbW9kZSkgew0KPiArCWNoYXIgKnBhcmFtX3ZhbHVlOw0KPiArCWludCBlbmFibGVf
cHNyOw0KPiArDQo+ICsJcGFyYW1fdmFsdWUgPSBfX2lndF9wYXJhbXNfZ2V0KGRybV9mZCwgImVu
YWJsZV9wc3IiKTsNCj4gKwlpZ3RfYXNzZXJ0X2YocGFyYW1fdmFsdWUsICJDb3VsZCBub3QgcmVh
ZCBlbmFibGVfcHNyIG1vZHBhcmFtXG4iKTsNCg0KSU1ITywgUGxlYXNlIGRvbid0IGFzc2VydCBo
ZXJlLiBJbnN0ZWFkLCBhbGxvdyB0aGUgdXNlciB0byBkZWNpZGUgaWYgbW9kcGFyYW0gImVuYWJs
ZV9wc3IiIGlzIG5vdCBhdmFpbGFibGUuDQoNCi0gQmhhbnUNCg0KSSB0aGluayBpdCdzIGZpbmUg
dG8gYXNzZXJ0IHNpbmNlIHdlIGV4cGVjdCBlbmFibGVfcHNyIHRvIGJlIHByZXNlbnQsDQpzaW5j
ZSB0aGUgY2FsbGVyIG1heSBub3QgaGFuZGxlIHRoaXMsIG9uZSBsZXNzIHRoaW5nIHRvIHdvcnJ5
IPCfmIoNCg0KSSBjYW4gc2VlIHRoaXMgaXMgZG9uZSBzaW1pbGFybHkgYXQgbWFueSBwbGFjZSAN
CmV4YW1wbGUgOi0gaW50ZWxfcGlwZV9vdXRwdXRfY29tYm9fdmFsaWQNCg0KPiArCWVuYWJsZV9w
c3IgPSBhdG9pKHBhcmFtX3ZhbHVlKTsNCj4gKwlmcmVlKHBhcmFtX3ZhbHVlKTsNCj4gKwlyZXR1
cm4gZW5hYmxlX3BzciA+IG1vZGU7DQo+ICt9DQo+IGRpZmYgLS1naXQgYS9saWIvaWd0X3Bzci5o
IGIvbGliL2lndF9wc3IuaCBpbmRleCAzNjcxMWMwZDQuLjgyYTRlOGM1ZSANCj4gMTAwNjQ0DQo+
IC0tLSBhL2xpYi9pZ3RfcHNyLmgNCj4gKysrIGIvbGliL2lndF9wc3IuaA0KPiBAQCAtNjEsNSAr
NjEsNiBAQCBib29sIGk5MTVfcHNyMl9zZWxlY3RpdmVfZmV0Y2hfY2hlY2soaW50IGRybV9mZCk7
DQo+ICAgDQo+ICAgYm9vbCBpOTE1X3BzcjJfc2VsX2ZldGNoX3RvX3BzcjEoaW50IGRybV9mZCk7
DQo+ICAgdm9pZCBpOTE1X3BzcjJfc2VsX2ZldGNoX3Jlc3RvcmUoaW50IGRybV9mZCk7DQo+ICti
b29sIGlzX3Bzcl9lbmFibGVfcG9zc2libGUoaW50IGRybV9mZCwgZW51bSBwc3JfbW9kZSBtb2Rl
KTsNCj4gICANCj4gICAjZW5kaWZbDQpUaGFua3MgYW5kIFJlZ2FyZHMNCltLdW5hbCBKb3NoaV0g
DQo=
