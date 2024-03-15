Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC384C54E69
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 09:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C37112048;
	Fri, 15 Mar 2024 09:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AbBSyWEU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B944A112048
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 09:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710493595; x=1742029595;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rcb9TxzJRaTrvvh4nyAFZykNp78GVqsmWRiEbHQ84oY=;
 b=AbBSyWEUhUb/MG60Ai+Tqy48FhSR0n2lfJ2jxDqdgp0JXR1MhP/aZkve
 pMAmefgF8UD8wYN0fobFo1ZyT4tBujsglZPfUfWK5ecQUlbGwjfMhTeeB
 64jSYKviNvAfk817HKBr0r/ToycRwITzdm4PbeITx/lY71NVb4vSvyyhL
 91U/1FCXuRL5JDWWYRmqGeJRE3No1d8vKghNJWNXKBcr2+27KsjUMsZZs
 9krdTpm8k1U9AvTPZMLwnAsfcE8mantEWfkDmvPnLj88DUnj5wf39hbou
 niykBsYgoc/7LcBmA3ESt5JS+c1lFU7L/nD8TIO7Xh7vnn/7PadHyH/vU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5484411"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5484411"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 02:06:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="17073600"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 02:06:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 02:06:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 02:06:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 02:06:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 02:06:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TW9EVmS065o9KjFevo+LOcyxinl8mjpoi1OF/n2GrqwTA+m7618Ad5NKVQQlM4W6S76DbHb5X95AH2UplUSyPZYszrAHOY/VCeHGYHhHiSPhOtqnnlJx+eXmiivZLgtXFI+He7xd1IpOnpR72McV6J3OagW8Qj9Y1qHZo5PTJacPb39hl8KD0+je8Q4h5Pt5a7Oj9Uh9D184w9XA1R8dQyl/P/k4B6LcO8cEOWyHqoDCVZt8i6/c1DZsagx6SY7QXDVWTHnpAC7QLB9G3btjo2i4M/Vz9sclrqdQBatRK6rc7oEc2axTa/rClDK+8Yof6Y7tm9AhCsc1rO+Y1TlogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rcb9TxzJRaTrvvh4nyAFZykNp78GVqsmWRiEbHQ84oY=;
 b=CfnW1Iu/JpeanHRINIBdpXEdK/iIx1zG7I4NYfwjJdDoEriDmwf54vdlUwT1S9NaUlTRGVKMErIBJ0UHh924Uw4zAA8sYD/Lc4KnN5iZ9S+T3QBdzmHfRvGJs1flR8hyB7SYdNotq96pgAivtiKn/sJJPuQ8ldL8DYG6ZTmbhiKV01po110h2KkG053IUbSSbrwb6rkVTcm0evfLXszwVeSRISQKjIaWKrw8qSYIgUjL6QjJC0J1u8iygoukdDeO9FzREYBtD4/CkrPSSIlAHg9sNV8m/oz+YB5G5ZlxRdEGb8dqsQmhJ9Mfbi13ZCdDs0UsYt4M228Mkvoq+AZ/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by BN9PR11MB5290.namprd11.prod.outlook.com (2603:10b6:408:137::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 09:06:16 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc%7]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 09:06:16 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t] lib/intel_compute: Do not assume engine class
Thread-Topic: [PATCH i-g-t] lib/intel_compute: Do not assume engine class
Thread-Index: AQHadlnN0VzPxF4RsUOuHQkvyLDI67E4gy6A
Date: Fri, 15 Mar 2024 09:06:16 +0000
Message-ID: <MW3PR11MB47481DF338FF6D74F8B211A5AE282@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240314213748.6323-1-nirmoy.das@intel.com>
In-Reply-To: <20240314213748.6323-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|BN9PR11MB5290:EE_
x-ms-office365-filtering-correlation-id: dbd741de-28bc-49fb-dc26-08dc44cf2bfe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jFwzf77KLtexVTddUZNprLzP4bigQXoEMweLfRp3JHPyWJIrEzEje3VjGhY36IwaZAuY+QGY8hwo9ZBfHLcV8sLtWMEXiuo4ZPZ6M/dXe2vp3UyDrwNBU1sZ74ZsQkgTerO6l/lmvx+TcBzRBVIq3Z6a7VC9xAu+YEs8Q9mfe5K9TzfK9w48SGgtCOO/LCLwqkr8v2Fg2p9G8obggcr831UyO6iXRne3wjhzsyma7VHuUiZO1gHK5aPPDV2jAHwsJ478tmL1M+Ja0AY3N2sYr51MU2MQjtCtxhSvYnux5kPluteZ9xLe2Vd5r1Vj7KVRoQYC0OKN73kX+ofu2TwOiaAEbtOAqGT5IcjzIhkUG7jWe4B9C7LbYJxXn1Kv/SjrnI3b++ECwwTo/igLtgZ3reqqv8TzRu8Gbeerxz35LrLGQO+jsd3qVaTJW3GtxQC8rAcAKQCuicyXlI2/4e85x0/StO2MGQy/Qc1TWNXvSGjY5Yw6JQSUJQRwDaHB64H7aDsfzwolCoq77hUG3pj0oxeex+JkWeAmd6zLha8b7P0IIekcF8TFuBws6xAtynt8xgZbwdnZ37TRGohwwm9FP8yOMho8q0LFRrUFZ4t73MgzYj2o0yhadJWTgs5WPrfimuqz+f0xrafW2bFYhw7H1d+WkStPKCsiD8NFijQQmWCiO1vRvn12tLT3MyyI5lEKATsu4FaA4SraH5iwJvCTPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WW02aUdPSHdqN2lOVGd2bmg0YlVwSHFYQWt5WE5kUEtFNHJnYWYvS2U4U2pK?=
 =?utf-8?B?d2IwZi9KME9KYWNmSHlVaEw3TkU4eFgxUXJaS3NVSFFSc2RCVFJEbEpEUG1S?=
 =?utf-8?B?V0FiUGlIbWp0R2xDTGUrakJzVTNxcUpkUjRsN2V0MlFLMUJINWtVcGhxbml5?=
 =?utf-8?B?dW81blBEMlJhekc2eEJDVnBDb09YQUJXWTd6Yml1bE1YY25ZdW1VZTRZSnhN?=
 =?utf-8?B?OGxvak1YR2dCT0FrS1ZpL1BUcFRiMFhmNTlwOGxnUzBhUmcydCszNDNOWlI4?=
 =?utf-8?B?SjhISEplWkNURHJDS0F3N3h1Z1VabDI5R0RSellIL0tkdU9nbEJWVlE0Um15?=
 =?utf-8?B?Ky81MW9EdDNOeFNwd05CMUVQZGZSQzJYU0lmQW4ycTN3ZHRyL2U5S0xwWHk4?=
 =?utf-8?B?aXVGQ1o2emU3RGl1UlhoYTBpVEY1SE05ZjMzYjc2N3FnT2tlaVh3T1piSndy?=
 =?utf-8?B?eFB0TnpjbVZ5MXR5YmdKaktORExkMC9rWFlodERMSnl4cWIyazlMQjIrVURM?=
 =?utf-8?B?eU10bmFqazJpTWUrdFVuUjZXLzF0QWV1MEJKSlIzaDNDQVBKRWY4Ukd2UWpn?=
 =?utf-8?B?Qlh6YUdSdHl4cmdmbzIxQk5vaUZaTnNGV2JiNU0wdi94SU9WcVY4bHF1WHlE?=
 =?utf-8?B?T3Q3RWdyd1VjSkxHODFvaS9sOGhEZyt0WllNYmZ3blhDK0JTOGExZjVRT3Mr?=
 =?utf-8?B?TGt5RGxiaDJuRGVLWkljbjl2cUYrcTU5d2dZR1hINFlqRE9HZUZUcFkxckl6?=
 =?utf-8?B?dFo5Rit1UldNMjlyNnVDNVJVelcyUGw3eGpJUkFiR2E4YUt6YmhySVR4ZkNQ?=
 =?utf-8?B?UmhwcFhMc1JYV2R4VVJ3RzJwMGF5UzZOeTd5Y05Jall4dGtPb0tKa2U4NHFY?=
 =?utf-8?B?T1VUNzVzVXlmK0F5K1hhbGk0R05xRXRwV3djQmZuVHIwcGEwYU5JVEl4VEtS?=
 =?utf-8?B?cDBwWEQ4UFhmNEdERERMZEpzblkvY3NFc2k3VkFYZEJhYWppZGg5NUZ4RjZF?=
 =?utf-8?B?U2s5eFJtNUwrVXhBYXBLcisrZ1diWFJ2MEZ0dG1KUDV1Z3dKOGxYOU1DcExO?=
 =?utf-8?B?OHpOdmZXeVVBeXRGbXdSQXBSZkZTSHBQcmVEVGYvN0hodDlMOVBqcXJON3l2?=
 =?utf-8?B?OTZmRW9JSGdoemJpVjRTMFFxaXExaHp3Z1k3Q2lreElnTHdhUDhzYVk4eExE?=
 =?utf-8?B?R05leFdlSVBjMFlVZmUyN1M0MGNzakVtNnRYZnhzSTZrc2YrK1UzYlVzM1c1?=
 =?utf-8?B?RDc2V09HZlQydTdaVk9IbE9TNy93VThRa3Jud3htR3B3RHVEZ01XNThJSm1h?=
 =?utf-8?B?UUt6TlREOTRiZkdPZUdvbGUzc05KU3RsQlN4cHVnWnZPWVlZVCtVdUphQzY1?=
 =?utf-8?B?OVZ1QnBrcDBsN3dIS0I2TVd1ZnhIaWo5aGk5ZEZlVEhobUJnZlJQV2FRdXFY?=
 =?utf-8?B?RlgxbDdIVFlmaFFVTlc1a0FycTBCVTJSWjJ0TEdYODYrVDRnaWI3ZmFhS1pk?=
 =?utf-8?B?dDNwQ2xrK3FJMmZiNkFUeGxUVVZ4Uk1HeG02cm1jUWdpQUpQT25kRjhTK09y?=
 =?utf-8?B?clZudUNwVi83MW4zTVdzUXQ0Z0p2akRldXZBcXkwWEIwZUZXYWVrNmFsVVdH?=
 =?utf-8?B?SnVVZ0ovYjdjUE0zTzVzVlZ3VW0yR3UzbGhKN1Z3MlJSQlNxQU9FYzBzQjc2?=
 =?utf-8?B?SW5UTkFUZFhmTE16LzYwcnhUNC9aSExsQ1Q2Smxtd2xQVzZEWDdEWnc2UzJW?=
 =?utf-8?B?NDE3allYTG9iTW9kREM2N2J0T05ka1p5Rm8zVU12aHBITjNsMEVSL05NOHY1?=
 =?utf-8?B?QTY2eUtEN1Y5QTg5RmdtM0VHdWk0eE5xbVg3ZmZnaWlrTlE4TyszRDhKK1g2?=
 =?utf-8?B?SXJhNjJUSi9nQ2lIMVNIRDlsTnBQTmFEcXl3eWxDVkxpVis2V2lWZlBrMito?=
 =?utf-8?B?OXhHUVIwN2wzL21XOC9MQjJFWmlDYmYyL3E2dzRRQUFKQlQzam1QSmpqS3VF?=
 =?utf-8?B?bUIyOXhNQUgwRUNlajNxRGpBR1orcUVpYndhQ3E0UHNETjVWcHBmbXNMUmps?=
 =?utf-8?B?a2pTV2hzY1kra0tTdVh4L3VnWHVCQnMvdS8rUDBmVDIzVWdPYkoraHZtdWYy?=
 =?utf-8?B?N2sxN0VTOFNiWlpWVndadUJDU3lMVFdSUklFb3ltTzU3L09xM3hyeE5CcDV2?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd741de-28bc-49fb-dc26-08dc44cf2bfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 09:06:16.6763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TM32s/H6+ZES2KsPpvT5xaMdOuIh9R+S+eeOFOTufwknKkOjrb+dRWpBgnw9rRNV6Pkn95w9AAnRDq6pZbSz+7U8dtbaXPaSjcOc3EkBs78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5290
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFzLCBOaXJtb3kgPG5p
cm1veS5kYXNAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDE1LCAyMDI0IDM6MDgg
QU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBEYXMsIE5pcm1v
eSA8bmlybW95LmRhc0BpbnRlbC5jb20+OyBLZW1wY3p5bnNraSwgWmJpZ25pZXcNCj4gPHpiaWdu
aWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47IEt1bWFyLCBKYW5nYSBSYWh1bA0KPiA8amFuZ2Eu
cmFodWwua3VtYXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIGxpYi9pbnRl
bF9jb21wdXRlOiBEbyBub3QgYXNzdW1lIGVuZ2luZSBjbGFzcw0KPiANCj4gTGV0IHRoZSB0ZXN0
IGRlY2lkZSB3aGF0IGVuZ2luZSBjbGFzcyB0byB1c2UgaW5zdGVhZCBvZiBhIGxpYiBmdW5jdGlv
biBkZWNpZGluZyBpdA0KPiBmb3IgdGVzdHMuDQo+IA0KPiBDYzogWmJpZ25pZXcgS2VtcGN6ecWE
c2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IENjOiBKYW5nYSBSYWh1bCBL
dW1hciA8amFuZ2EucmFodWwua3VtYXJAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBOaXJt
b3kgRGFzIDxuaXJtb3kuZGFzQGludGVsLmNvbT4NCg0KIExHVE0sDQpBY2tlZC1ieTogSmFuZ2Eg
UmFodWwgS3VtYXIgPGphbmdhLnJhaHVsLmt1bWFyQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIGxp
Yi9pbnRlbF9jb21wdXRlLmMgICAgICB8IDIwICsrKy0tLS0tLS0tLS0tLS0tLS0tDQo+ICB0ZXN0
cy9pbnRlbC94ZV9jb21wdXRlLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKy0NCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbGliL2ludGVsX2NvbXB1dGUuYyBiL2xpYi9pbnRlbF9jb21wdXRlLmMgaW5kZXgN
Cj4gOWQzYjk3ZWZlLi5jOTZlNjAwMjcgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pbnRlbF9jb21wdXRl
LmMNCj4gKysrIGIvbGliL2ludGVsX2NvbXB1dGUuYw0KPiBAQCAtODEsMjQgKzgxLDEwIEBAIHN0
YXRpYyB2b2lkIGJvX2V4ZWNlbnZfY3JlYXRlKGludCBmZCwgc3RydWN0DQo+IGJvX2V4ZWNlbnYg
KmV4ZWNlbnYsDQo+ICAJZXhlY2Vudi0+ZHJpdmVyID0gZ2V0X2ludGVsX2RyaXZlcihmZCk7DQo+
IA0KPiAgCWlmIChleGVjZW52LT5kcml2ZXIgPT0gSU5URUxfRFJJVkVSX1hFKSB7DQo+ICsJCWln
dF9mYWlsX29uKGVjaSA9PSBOVUxMKTsNCj4gIAkJZXhlY2Vudi0+dm0gPSB4ZV92bV9jcmVhdGUo
ZmQsIDAsIDApOw0KPiAtDQo+IC0JCWlmIChlY2kpIHsNCj4gLQkJCWV4ZWNlbnYtPmV4ZWNfcXVl
dWUgPSB4ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwNCj4gZXhlY2Vudi0+dm0sDQo+IC0JCQkJCQkJ
CSAgIGVjaSwgMCk7DQo+IC0JCX0gZWxzZSB7DQo+IC0JCQl1aW50MTZfdCBlbmdpbmVfY2xhc3M7
DQo+IC0JCQl1aW50MzJfdCBkZXZpZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZmQpOw0KPiAtCQkJ
Y29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvICppbmZvID0NCj4gaW50ZWxfZ2V0X2Rldmlj
ZV9pbmZvKGRldmlkKTsNCj4gLQ0KPiAtCQkJaWYgKGluZm8tPmdyYXBoaWNzX3ZlciA+PSAxMiAm
JiBpbmZvLT5ncmFwaGljc19yZWwgPA0KPiA2MCkNCj4gLQkJCQllbmdpbmVfY2xhc3MgPQ0KPiBE
Uk1fWEVfRU5HSU5FX0NMQVNTX1JFTkRFUjsNCj4gLQkJCWVsc2UNCj4gLQkJCQllbmdpbmVfY2xh
c3MgPQ0KPiBEUk1fWEVfRU5HSU5FX0NMQVNTX0NPTVBVVEU7DQo+IC0NCj4gLQkJCWV4ZWNlbnYt
PmV4ZWNfcXVldWUgPQ0KPiB4ZV9leGVjX3F1ZXVlX2NyZWF0ZV9jbGFzcyhmZCwgZXhlY2Vudi0+
dm0sDQo+IC0NCj4gZW5naW5lX2NsYXNzKTsNCj4gLQkJfQ0KPiArCQlleGVjZW52LT5leGVjX3F1
ZXVlID0geGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIGV4ZWNlbnYtDQo+ID52bSwgZWNpLA0KPiAr
CQkJCQkJCSAgIDApOw0KPiAgCX0NCj4gIH0NCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRl
bC94ZV9jb21wdXRlLmMgYi90ZXN0cy9pbnRlbC94ZV9jb21wdXRlLmMgaW5kZXgNCj4gNDJmNDJj
YTBjLi5jYjk4YjAwZDUgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2NvbXB1dGUuYw0K
PiArKysgYi90ZXN0cy9pbnRlbC94ZV9jb21wdXRlLmMNCj4gQEAgLTE2Myw5ICsxNjMsMjggQEAg
dGVzdF9jb21wdXRlX2tlcm5lbF93aXRoX2Njc19tb2RlKGludCBudW1fZ3QpDQo+IHN0YXRpYyB2
b2lkICB0ZXN0X2NvbXB1dGVfc3F1YXJlKGludCBmZCkgIHsNCj4gLQlpZ3RfcmVxdWlyZV9mKHJ1
bl9pbnRlbF9jb21wdXRlX2tlcm5lbChmZCksICJHUFUgbm90IHN1cHBvcnRlZFxuIik7DQo+ICsJ
c3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZTsNCj4gKwljb25zdCBzdHJ1
Y3QgaW50ZWxfZGV2aWNlX2luZm8gKmluZm87DQo+ICsJdWludDE2X3QgZW5naW5lX2NsYXNzOw0K
PiArCXVpbnQzMl90IGRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChmZCk7DQo+ICsNCj4gKwlp
bmZvID0gaW50ZWxfZ2V0X2RldmljZV9pbmZvKGRldmlkKTsNCj4gKw0KPiArCWlmIChpbmZvLT5n
cmFwaGljc192ZXIgPj0gMTIgJiYgaW5mby0+Z3JhcGhpY3NfcmVsIDwgNjApDQo+ICsJCWVuZ2lu
ZV9jbGFzcyA9IERSTV9YRV9FTkdJTkVfQ0xBU1NfUkVOREVSOw0KPiArCWVsc2UNCj4gKwkJZW5n
aW5lX2NsYXNzID0gRFJNX1hFX0VOR0lORV9DTEFTU19DT01QVVRFOw0KPiArDQo+ICsJeGVfZm9y
X2VhY2hfZW5naW5lKGZkLCBod2UpIHsNCj4gKwkJaWYgKGh3ZS0+ZW5naW5lX2NsYXNzICE9IGVu
Z2luZV9jbGFzcykNCj4gKwkJCWNvbnRpbnVlOw0KPiArDQo+ICsJCWlndF9yZXF1aXJlX2YoeGVf
cnVuX2ludGVsX2NvbXB1dGVfa2VybmVsX29uX2VuZ2luZShmZCwNCj4gaHdlKSwNCj4gKwkJCSAg
ICAgICJHUFUgbm90IHN1cHBvcnRlZFxuIik7DQo+ICsJfQ0KPiAgfQ0KPiANCj4gKw0KPiAgaWd0
X21haW4NCj4gIHsNCj4gIAlpbnQgeGUsIG51bV9ndDsNCj4gLS0NCj4gMi40Mi4wDQoNCg==
