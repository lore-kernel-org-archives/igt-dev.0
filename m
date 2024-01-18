Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E295DC47DAF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 11:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE8610E79A;
	Thu, 18 Jan 2024 11:16:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EC510E782;
 Thu, 18 Jan 2024 11:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705576571; x=1737112571;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P1uj0Qu1sDRwplUj0BbDZmVE4U72lnpWAm/7Hco4gwQ=;
 b=nt0CI+oTImkiKzvXIs30HWhak7HzOHyQ9eWW/YYJaNePwl6R8JVMpYP0
 bGucxF3zCD8XtEnYI8td51gTikNNuzRCThOhxzC+yFLDHdTUWotUajMDE
 O44TzitAB4l4jgUbc9xFra9peC6gaD0fw71fHIQ4yUEnzIqOEKKgXaOWT
 a92Vh/JbcJEMmj5PL3X6y5fLAu2aRgiw66Bq5Xd6OIRA3mkNLsZ618TAU
 ZTfd8pVFII8cKZvMoZmFX0+OU8D86e8+jXR1nZLOf313cVQU4id+GESYK
 kHF2a3sh172r81W06lCdO2ISeSquLjMrKNrTtoKU3T/HIdxfLt00WC7KV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="322029"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="322029"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 03:16:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="760837546"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="760837546"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 03:16:10 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 03:16:09 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 03:16:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 03:16:08 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 03:16:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+kvyYro3/GOT9HKdDX1ZttCgVZUeBNLdcwskGshOsNT8cgL/Eq5zrOeTYsRDx++Q6eDKfUdWspuX5WLNjyQI2rY2pTkaUe7b7OwiPJTwKHWAQer8mnIwP/axpL5EJZogZJZ6REoN7zbuoqEKMibNn53ph2hNiAb4uJfD1mo84yPV8Xhi3EEgFOyI0k4zuW/Ssfr1nSST+oJZnuYoatZwHfXR7sq9IiXxU3fErt/IabGrauxPJcDz4sgdvALe9UIbQ8QCVIQRX/r6jFKB4Ash4M8NB0dVC9Dm89+EYBZq44pG9yXVTYgl/DAq6d3TtJ/pip5mJppHxR9M5aqucRgLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1uj0Qu1sDRwplUj0BbDZmVE4U72lnpWAm/7Hco4gwQ=;
 b=To4acfY1a0hCZDx2HIDYPrJ1qt72kI6OYPHzXcaGTW6QF8z7mU3kvQhMqtmn1gyrpi+p8mWh1LwpeRolnYFUs+fhREF/YMjvmdItpDvD+fUujbzYU6BvzygpcY8l6q/HOcrh9OX1IaSXfRT2GVO3PkCJJP/jW8BlrOvXXPv/SvepNdx0eZSUTp+EDj2eVHyXwXKDunfdZRxKYae3E14Bq2VPl/Ujq9cyWEX6pRWl+vRaPRStIjlREXaCVnqHtoKFM8srMyLUEccUc6OtWstUQATIOwTsukpspDsSDmKj+3N+Xx4iW3aiiNiiG/I1fWjwnzLZTqMd5836lWXMXdDnUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by BL1PR11MB5447.namprd11.prod.outlook.com (2603:10b6:208:315::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 11:16:06 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::4b4:61d6:9dff:eca]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::4b4:61d6:9dff:eca%7]) with mapi id 15.20.7181.029; Thu, 18 Jan 2024
 11:16:06 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBDSS54ZUJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwveGVf?=
 =?utf-8?B?ZXhlY19zdG9yZTogZG9uJ3QgcGFzcyBndF9pZCBhcyBiaW5kIHF1ZXVl?=
Thread-Topic: =?utf-8?B?4pyXIENJLnhlQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC94ZV9leGVj?=
 =?utf-8?B?X3N0b3JlOiBkb24ndCBwYXNzIGd0X2lkIGFzIGJpbmQgcXVldWU=?=
Thread-Index: AQHaRIAu4HnZnO64Pkq2ofzvjwA1ZLDWdLaAgAj2hlA=
Date: Thu, 18 Jan 2024 11:16:06 +0000
Message-ID: <PH8PR11MB675330124133F7416459D10CF2712@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240111090152.296752-1-matthew.auld@intel.com>
 <170497200787.271298.14081014318331454784@5338d5abeb45>
 <20240112174331.jv3mo7acbpbrfszk@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240112174331.jv3mo7acbpbrfszk@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|BL1PR11MB5447:EE_
x-ms-office365-filtering-correlation-id: 07aa4bee-5130-4f99-90f7-08dc1816dd55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5E03pfPxT4LubJEhCtcGBaQWncBUfi/M6OFr5rAGwKRpN1/gug8uQIMdyl8G9WLckWcscLxKLn/Zvlba61TyDXUmBp9YpExIW4rB6MVji9f8IwYCKlKoqEAmn8WjZ/pHR5V30wAqhXTvedvHT3zjCfcJKm3znnWH19KbPOlXjITzOKMUA9LOQLNUE+FiQHIg66HgTt2jyWV5Y6oiZ3q8c57IzU14pWf6ucCY6WKoUKbNHgPcYvTFVRd+LeakT9pe/W3adzdzqitIKAzHVU/4RKAmgfE/xGaLRYFRdopHxBiqz6MEG6rSrGV21VZcjPT/GN7xLFlvOcf8js6ntoDb4kO+/LQCyIYMX/pVZ4m2ImGXZvcseiowNUyDDknRGfimORZn0yJdXqzEqdrVCrsnTuH1sU1oMvI6+WNSQ43X7v2EnbZ6HYhcN494YUbd33uJQCupDXe+10aiQHB4MemX0LeoHCC2s1Zs7f0/81+qsjKyCoFjfax67xi/2/0SKtaOgABiVS4cSiricalHqTkEOm0/K8bLWknJvN1GscyL4oZuqYEm8VcM17WPyZRgsC3oPKaafM/aAh/nmlrkfODFiHlhfPOEkDHiS37EbgDYhibt6FOKj5Ky6Ven8EayeIi/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(39860400002)(136003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82960400001)(38070700009)(33656002)(86362001)(41300700001)(6506007)(110136005)(76116006)(54906003)(64756008)(66446008)(66476007)(66946007)(316002)(66556008)(7696005)(53546011)(4326008)(8936002)(55016003)(26005)(478600001)(966005)(83380400001)(71200400001)(38100700002)(9686003)(122000001)(5660300002)(52536014)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUFKL0JadUwrK0R2aGZMdTYzTXdQRWNwK3NEM2s4TDRPSTNVZm1xUXNSbjJi?=
 =?utf-8?B?ZzgraEErWUVlWlJvcmd4LzNYSXdiNytoT3VONjJLb08vR3docUs0a0Mwck5F?=
 =?utf-8?B?ajlSdDdydHhGUncvenQzK3N2VVBYdGlpY0llSmhoS1JYVU5YTElNV29UVXlm?=
 =?utf-8?B?dUJkZG5YWW9ZOXI2ai9wRG5uU2RkWlRGVVhHU2x1S3VFVnE5aS91MEV6M0Rp?=
 =?utf-8?B?WnFRL0xqVFo1bStKSGczcnQ3Q0x2ZnpxR3d5LzdHOCtWQVdNRjhJWnFVOHF1?=
 =?utf-8?B?enhhNXJWUUxoMGVMeDVjSjkwN0ZUOGJXbFhyN000UzhKZDBuQ3M5QWw0MUdz?=
 =?utf-8?B?M1VYbThTM2NqQUhJQXNGVjRubnB4aTVZUkJQM0h0NkN5OTErcHNMcFN0MzZP?=
 =?utf-8?B?RlFtQkJscWE3RnFzS1BDRlo4RjVFRk0rcC9aVlVkcm45eTlHYUJKTW96SkFX?=
 =?utf-8?B?NTk0NXhCb2hwbmZTaW5HTlRCYWwrY29YNTVJeGtQcmFPOXVId0RzcEJNRGQw?=
 =?utf-8?B?RFNGakprV0NuN09oTXhBYU5nTmNlRy9MWUpMd3NlSGRuMDhScVVZM2N1OHdY?=
 =?utf-8?B?RWJ1R3gwYmplL2pKYzVYTGZuQ2kvWm9YQXZoYW4zRWNMMDcvVXAxVys2d2JE?=
 =?utf-8?B?SklZYThNRmZnS01TTGV2aG5uUXlIMDJ5SFR6b1pnOFZ2MFlpUDRiZ0prMUZK?=
 =?utf-8?B?NnZTVEFhV3lKMWpuYTZhNzdMY2hPc1NmcFRLUTRINWF3UlMveWY5cGlZL09k?=
 =?utf-8?B?Q3E0czlmWnY2aDdON3NKTzdMRXpNREduTmxkM1c2aFdod2hRc1J2ais4ZGRW?=
 =?utf-8?B?TjdQM0cvclFSdFhwMGZ2akdkUDZRRDZQVXNCQ1MvLzNpNXE3UXd0N1I5Qm93?=
 =?utf-8?B?V1ZpcDBwdjFkOGxrSzQyOGtGY1NhNVFPMHR6dlZkNVF3SkRwemlRZmxaYkU5?=
 =?utf-8?B?SUU0SFRDK0NadWNKYk82ZlhlZVNSejdLZld1dTFzQXZhN3RBa2VCaklnSlBP?=
 =?utf-8?B?dWtPbnVmeDlJRUg3ZEROd3dlNjBxQ0xMY0hvY21Qb2VoTDM5cTNXSW9qSG04?=
 =?utf-8?B?dlowL3dJdFppNERVWjRzV0Zwc3RXU0NvZENyeWxEZ254emppNkxONFBkcTJp?=
 =?utf-8?B?M0h5eXc5L0xnN3YyOW1xbXZoRmE5K3A3K2FFeVNkSE4vbUhNbDFZTUZiYUY0?=
 =?utf-8?B?ODZGY0VjaEtMaTUxZmdlTVJCTzhxY3FiTGtlc0w2SDB1VmtMbkZBQTllbGk1?=
 =?utf-8?B?R01TdUNPN05tOS9WKzh6YVYwMDFYaWpRSXQzclFBRmEya1JaVkVpd0lPUmQ0?=
 =?utf-8?B?NzdvajVpdkNvMnhLWTZqUjVIbDJqdDBkT24xZ2hHWnBlc1dLYnFZOGovaGo3?=
 =?utf-8?B?a1I2bkRmYWpVQWhINng3S005amFrbXJ5RUVLdkRJSjlDRVhlRmdOWWlYTDM3?=
 =?utf-8?B?amQwMjM2d0JNU3lOT3FCYWFFWmptd3FKQlJaWjBZMWpIdU1kSHJMRmF1anIv?=
 =?utf-8?B?d083NFNRVk9XcFhVb290UGNFS1R2YmRPOWt6MTl6S0tBT1ZwU0l1bkVkT21Y?=
 =?utf-8?B?enhIR2RCc1NVQlhlSmxZamtobVBucXFvLzNBQjkxbEdwUGVKWmRicVR3MjFY?=
 =?utf-8?B?WmJ1U2tTbk15WjZGWm9Pcis3U0dRMVZyN2VxME5zS3lPZy9qTVgza1ZDS0pH?=
 =?utf-8?B?Y3VTRDJXSFZCS2IwZ2tCbnU3NVlKR0QxRGJYcWlIaFhxRXlORTM2QTI3cVBw?=
 =?utf-8?B?L1ZpYTIzdDBJejN6MHNoREt2SGNVMnRvR3RENlBFWVFLeU1TN2FBUWlaUlkv?=
 =?utf-8?B?VU5oR3o5bXNteHlKTlRzeEF1T3hNL1czeUIrTmtTOTNvcW1qUVFLSG8wa29t?=
 =?utf-8?B?UVloelNLWC9JMGExMnRndHhaSkhkY3NiU1BkVjJqbDRNQkRyVWN3eFFxeVVk?=
 =?utf-8?B?Y0t1Tzdkd2NQTnFIbnFIVmlXQU9BNG00eHl0Nk1UVUtCU3JZbGN4YVVKV0lh?=
 =?utf-8?B?VXZ4UkNQTDZEMys5ak40eDM5dVFLUGpkeElzc0MydHdxcXh3RjNEWFJGejYr?=
 =?utf-8?B?SEROZE9SSlhaa0FzTE5xMW90dnJlaUJTM3ZkakhtdUpFdThYUGNCbzV5dWRU?=
 =?utf-8?B?a2Ezb0NjLzIzS25QdTlmZmxpZTRrbWpUWk5KbHZjV2JlTnNvSzc3R1VPMk1q?=
 =?utf-8?B?bXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07aa4bee-5130-4f99-90f7-08dc1816dd55
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 11:16:06.1062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0TtesUXP/1XGJMUTMiLoQzCV/gbA7G+yAK9evWCkXXK7JUMn8bZjqOvf1X0XTT+6BubpxkSkBiTA/m7M83O30QXgDCW2sGMf4j1SrAvZ/3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5447
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
Cc: LGCI Bug Filing <lgci.bug.filing@intel.com>,
 "I915-ci-infra@lists.freedesktop.org"
 <I915-ci-infra@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI4NTYwLyAt
IEFkZHJlc3NlZCBmYWlsdXJlcywgWGUgUFcgY2Fubm90IGJlIHJlLXJlcG9ydGVkLiANCg0KVGhh
bmtzLA0KVGVqYXNyZWUNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWls
IEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBGcmlk
YXksIEphbnVhcnkgMTIsIDIwMjQgMTE6MTQgUE0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KQ2M6IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+OyBJOTE1
LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTEdDSSBCdWcgRmlsaW5nIDxsZ2NpLmJ1
Zy5maWxpbmdAaW50ZWwuY29tPjsgSWxsaXBpbGxpLCBUZWphc3JlZVggPHRlamFzcmVleC5pbGxp
cGlsbGlAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IOKclyBDSS54ZUJBVDogZmFpbHVyZSBmb3Ig
dGVzdHMvaW50ZWwveGVfZXhlY19zdG9yZTogZG9uJ3QgcGFzcyBndF9pZCBhcyBiaW5kIHF1ZXVl
DQoNCkhpIGlndC1kZXYsDQpPbiAyMDI0LTAxLTExIGF0IDExOjIwOjA3IC0wMDAwLCBQYXRjaHdv
cmsgd3JvdGU6DQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IHRlc3RzL2lu
dGVsL3hlX2V4ZWNfc3RvcmU6IGRvbid0IHBhc3MgZ3RfaWQgYXMgYmluZCBxdWV1ZQ0KPiBVUkwg
ICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI4NTYwLw0KPiBT
dGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBj
aGFuZ2VzIGZyb20gWEVJR1RfNzY2OV9CQVQgLT4gWEVJR1RQV18xMDUxMF9CQVQgDQo+ID09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1
bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAqKkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVu
a25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBYRUlHVFBXXzEwNTEwX0JBVCBhYnNvbHV0ZWx5IG5l
ZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICANCj4gICBJZiB5b3UgdGhpbmsg
dGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMN
Cj4gICBpbnRyb2R1Y2VkIGluIFhFSUdUUFdfMTA1MTBfQkFULCBwbGVhc2Ugbm90aWZ5IHlvdXIg
YnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0
aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJl
ZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIA0KPiANCj4gUGFydGljaXBhdGlu
ZyBob3N0cyAoNCAtPiA0KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+
ICAgTm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+IA0KPiBQb3NzaWJsZSBuZXcg
aXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVua25v
d24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBYRUlHVFBXXzEwNTEw
X0JBVDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVn
cmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEB4ZV9leGVjX2ZhdWx0X21vZGVAdHdpY2UtYmlu
ZGV4ZWNxdWV1ZS11c2VycHRyLWltbToNCj4gICAgIC0gYmF0LXB2Yy0yOiAgICAgICAgICBOT1RS
VU4gLT4gW0lOQ09NUExFVEVdWzFdDQo+ICAgIFsxXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVFBXXzEwNTEwL2JhdC1wdmMtMi9pZ3RAeGUNCj4gX2V4
ZWNfZmF1bHRfbW9kZUB0d2ljZS1iaW5kZXhlY3F1ZXVlLXVzZXJwdHItaW1tLmh0bWwNCj4gDQoN
ClRoaXMgaXMgdW5yZWxhdGVkIHRvIGNoYW5nZSBpbiB4ZV9leGVjX3N0b3JlIHRlc3QuDQoNClJl
Z2FyZHMsDQpLYW1pbA0KDQo+ICAgDQo+IEtub3duIGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0NCj4g
DQo+ICAgSGVyZSBhcmUgdGhlIGNoYW5nZXMgZm91bmQgaW4gWEVJR1RQV18xMDUxMF9CQVQgdGhh
dCBjb21lIGZyb20ga25vd24gaXNzdWVzOg0KPiANCg0KLi4uY3V0Li4uDQoNCj4gDQo+IA0KPiBC
dWlsZCBjaGFuZ2VzDQo+IC0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgKiBJR1Q6IElHVF83NjY5IC0+
IElHVFBXXzEwNTEwDQo+ICAgKiBMaW51eDogeGUtNjE3LWJkYTk0MzcwMzBkOTE0YWVmY2JjMTQ1
ZDNiZTFhOWY1ZjA1ZWE2OTMgLT4gDQo+IHhlLTYxOC03OTE4NGU3MjI2M2U5MTUyODE5NWRiMDE3
ODMxNDg0MzVjN2U0ZmFkDQo+IA0KPiAgIElHVFBXXzEwNTEwOiBodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEwNTEwL2luZGV4Lmh0bWwNCj4gICBJR1RfNzY2
OTogNDE4MDY0ZTQwY2E2Mzk5NzAwYjA1NDg5ODNmZGI2NzliZTRkODU1YiBAIGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gICB4ZS02MTctYmRh
OTQzNzAzMGQ5MTRhZWZjYmMxNDVkM2JlMWE5ZjVmMDVlYTY5MzogYmRhOTQzNzAzMGQ5MTRhZWZj
YmMxNDVkM2JlMWE5ZjVmMDVlYTY5Mw0KPiAgIHhlLTYxOC03OTE4NGU3MjI2M2U5MTUyODE5NWRi
MDE3ODMxNDg0MzVjN2U0ZmFkOiANCj4gNzkxODRlNzIyNjNlOTE1MjgxOTVkYjAxNzgzMTQ4NDM1
YzdlNGZhZA0KPiANCj4gPT0gTG9ncyA9PQ0KPiANCj4gRm9yIG1vcmUgZGV0YWlscyBzZWU6IA0K
PiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xMDUxMC9p
bmRleC5odG1sDQo=
