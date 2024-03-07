Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F39C54E49
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 11:36:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207E510F3E3;
	Thu,  7 Mar 2024 11:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQD/tFHC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E299410F3E6
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 11:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709811399; x=1741347399;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=igZD0hFz5gCf7WCGN0ngew82RS+bU/niZq0KTpaZ8Yo=;
 b=FQD/tFHC6LvE3u7Z02p9bYPq1mVvm6Iw0FXWHest0Gr+kAW+PKn+cKHR
 Y9WuCLs3O0axnoatzNwPoqrtnuJUSrEO8a2tmNKTVHUNTvO66UXoiRdQB
 MYzwSYR5hZQ9tcadCdkmFKxLBlwNz34Vw4xevgRHvIhGtsK9eDiZq0v3D
 o5VBNy1ZeBTPkKf263wVjlMjWPt6ui408jo89DFR44B2bcP+pjmGlhTpr
 +2I+45csj4uEZ7SQrac/6P8XyD/W7c+vLPlDAvRNksExkOZQZcnAadamo
 O3cXZWIzKjEeU553LlFep7GvjIfT9RgeFYJVHV7MoWpJuA6SclDoPy5ee A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="29916713"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="29916713"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 03:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="33238745"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 03:36:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 03:36:37 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 03:36:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 03:36:36 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 03:36:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhhyE9vblkhgFQUhYMnLKpUSYCnQ483NVkQaydPrUxz564r5rdnYx790L0YZ82FokKF6Mczb1BEs9u7mcBO27eLOdtUpaRXqfjkZc8SPNVi9egibfNkT3d68AEDQb435MkQepguP6yOaff/VQ1EfZ398g9tCsP7WjN696TySy+6BGWxSzxpBIC5mwo1DZhcOsncpxeRW9vDDIeWRE7Zp7o+X9z+OddBy8r3MKB1gjO5QjN7zs1AAPRN+REStibGwtH8sd+o5G7Gx7CznVtabuX4kEkwwZAkH9qidiPi9NEw/abcOVaI76dvAKsyaBtJ/bw7OdQK2Eo4U65pMnQ7gLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igZD0hFz5gCf7WCGN0ngew82RS+bU/niZq0KTpaZ8Yo=;
 b=LH1+p3kJ4ajJC34wkAmfPxBgT7t6nkhp+tR5LZGiRvzC4y0bTAUnIM7HUdKr53pokY3KyBgvC0ocptXb5Fusxr82K6EPe3rY5+1cBrOrioMQ+HZJezroCJk3+7LCHRg6xxVp9V8I6cH2nbzMs83VksMazesB/zOBz1hecCydgCgBzxDZG4VvNvxiZAHmFqmMb5HXUHQ09I7jHR4JuYpPhGTxyjQX5ScKQsXBUY4Vno8v7/JnnXZpRsYQEdgBUaxfp7I+3LC9XgjOhVlkDX1nqetZEVrjoH+pWiTABzskzlXsUkY//LVb/L3xMdljyQTsakSKhKVb8Y4v19gUvJ0KgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by PH0PR11MB7635.namprd11.prod.outlook.com (2603:10b6:510:28e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.6; Thu, 7 Mar
 2024 11:36:34 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 11:36:34 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t 12/24] tests/intel: Introduce Media subcategory
Thread-Topic: [PATCH i-g-t 12/24] tests/intel: Introduce Media subcategory
Thread-Index: AQHabiW3GjGYW/dJrUKr4JV8ZMpehrEnsgcAgAR5AFA=
Date: Thu, 7 Mar 2024 11:36:34 +0000
Message-ID: <IA1PR11MB609791E81660012F16B2D2AF86202@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-13-katarzyna.piecielska@intel.com>
 <20240304161746.1c9dd9f4@maurocar-mobl2>
In-Reply-To: <20240304161746.1c9dd9f4@maurocar-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|PH0PR11MB7635:EE_
x-ms-office365-filtering-correlation-id: d7658890-0f88-4ca4-3011-08dc3e9ad790
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iZVnadsvZoqfYbC7rOMik8RHvybjsaUov6kRD3Gl1gcOlFW7XvdxkXBU4wtzML8t6DgfjpoESmGQfnXZzjP7/AAYpngdJxorHJu0v4xNj0AfIum0PoMajsI0nEe/kkA5bMmF+KmE8qmbrUTwzayUYxJJ25Vc4svvk+mzNplafSOeqgDgWR/con2Jt2uLWJKKJVDuTHQy4/i83w7qn4CyFbiZ+8s4mveGXt17ZLovcoi1yJkS7xGEPCtGAaqpL9yKZcmhntbDHzq1pUvSbeutyWsD+q8YdyIhcAzalBKKJQLjv9iJEJXHyO/JwrgyxaeiZbj0w/5qJGbZVlfkJPAjQjoQzIBz7SOpTkt6Itl0IKhkYKyf7NPqJmily8GcNMz7amLLkn1b8R8fsrQXQUT/o4ZAO+mBkiKwUvshWxc5hUiqvVRqfr6RFBQk2Z+mf0a6RgpjglErRHp4nlQC+oWnGXWleDgdItQhWdKLOn74VzTYFvOdbeiRMjbzdjvFubS/mxQ0CyZs4/mbAQTcZqDwOMBrVpJ0RotE2TSrnU+14ax8x7EYC+eZgdJLgdxzVqs1xFpL3YvloNlLzM1b8vNuqnGoRxIuRzChCvyClQFNVxOqGY7x0CnxwplAIOqU3lnANcMgcgYrYnoQkLdTezDT9Zhj+0+kGoX9ECNk/yRfxdDCWODx85dmTPBPk/6kKDVnqJN1dgQiRoNhbQAm4z1bhjNX53TiTR60nNylyQqT1bE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHZpZ3lMUzdOLytQaXhZT0UzK1NJQXR4S3NXQUlqMDR2TDZkL2xkWldqaEhX?=
 =?utf-8?B?dGlONXpnOHM4ckgvVGRYREwyM0hOOE5LbjM0YzRRYnNiaGpEMUlVK1ZYS2Ey?=
 =?utf-8?B?d1hUQkFJMGw3dDN0cTA0U2djSlJiNUNoSHFtbGZHQzBXbDJVNTBjR2JxaW9q?=
 =?utf-8?B?OUhlNjM0ZkVuMXE3c2VxVmIyVGVkN1dpWS9wQ0RHK3pjVy9QNUFWWjZXRjdw?=
 =?utf-8?B?bUdNSjhvRDNZcXY3c1JWUStwNnV2RFpJZkpWSTBxVG1DT3VtNHZBKzhqckRP?=
 =?utf-8?B?Nzh3SHhrVVAweHV3eU9XMno0QW91bXlIZi9HdEdSM3M1bUFKQ2FVTHFTejdS?=
 =?utf-8?B?QzVSZHFjdFRjVjBUWHkrYzgxMm5HZmhHRzNzREhYU2RXZ2FaQ1VzdEM4WHJG?=
 =?utf-8?B?RWJ4WDFOOWZyRGdNdHhwS2YwVkU2TzFxVGw4bkpFZUJpTFVTbmcxbnBvYXlI?=
 =?utf-8?B?MkZmVFhMZXVWbGgzV0FTdVUrTjhUR25sTEVZeWdjZEpERE9hWkE4bFROdmdB?=
 =?utf-8?B?djV2djRoQnAreGYzRWhDeEEvdWRIVjhnY2taRmZqK1gyUU5yMVl2cDZtRW4r?=
 =?utf-8?B?Yk1TanE0Y2FMZG9iSkhhOXhqRTdLMG1Ed3UwWEFQYVk2anovckpJekpXOXNN?=
 =?utf-8?B?Y3M4Z3paeG9Dd3NxRWMzaTZ1UXZiTDdIMW8wdVpIbm1vaVdSN3VKd0F2VVlL?=
 =?utf-8?B?WG5vbUNmbE01dGpJNkNWYVBmUjFqN3VRWW12Rnk1RlZWZXQ0azIzNE8xc1RT?=
 =?utf-8?B?ajNtdjFQaERTRGJZMkY5djV3b2p0QU5TSEVqdkJnSXZoVXJFQi80QnI5cmdC?=
 =?utf-8?B?VGh2Y3RJTFVEVGt1OEE5U3V5aTJUNHdENDBkOGkrOWpvU3FwNG5SK0hkb01D?=
 =?utf-8?B?cmJhaDYzVWN4YXdVZXZ4VGxoYjh5QkR1MHBZRnh3T3RvdDR2VTg1aVFpeW91?=
 =?utf-8?B?Z1RuSkY2U3hpS3ZzU3U5Z1Z1dml0WmgzelI3ZzZRcmFpejRSdmZLbVRmbDdX?=
 =?utf-8?B?RTlFcWlKV0t3ZTEzVm9XaFBQZzRaZGNHOGhZaUxZMWJmN1JaNjBnbUt5ZWdU?=
 =?utf-8?B?dUZyOWZFWVA2VVhrclZtZUQ1eVhQVmdtTlU3Rk9xSjlmbUdWSW5TdG5LMHJp?=
 =?utf-8?B?MXdmdmNRTVFhUmhWT2lUSm9hblVhWjZJa2tMYkh4c3Z5aDJjWkxDdXhZYWJY?=
 =?utf-8?B?RGVFS1oxY2FvSmk3T01WalRHL1R2b21sajhLVG9UN3k5ZHdFMVlidkpSRnJa?=
 =?utf-8?B?VVQ1ZnpqQlZZa2k1VzF4MmV5WWE4akh4ekRZdnQ0Y1BRV2dXSVFRaW00Q0FJ?=
 =?utf-8?B?cUtTdFdBUUtTYjh3Ny9lbk1LU0FjZFFDOEk4c2hJek1KOTN4UlRzUGplVTdp?=
 =?utf-8?B?K3ZoemJhVFZSUmJ5UlFoVFpwUWpUYmNLaHhOblpWZWZOSi8zZXBHSS9uc1NN?=
 =?utf-8?B?YzVpVU0wMkUzTmZCeUIxM2VWRWl2VTZIV3pNSEs0Ti9ZYVhSNk1XVlhqQWoz?=
 =?utf-8?B?RzRRSFV3bStTdmhrTHZYRm5tTzVNdlJBQjN6TGNEWng1ZGZhT0VmaFhsOG5Z?=
 =?utf-8?B?SUxCZnJEWFFhQm1qdFRQK3ZDaU9Cc1kwcUxON2hHckhVRDhsL2txN2tiMXI5?=
 =?utf-8?B?SkpyMDI2OHBZd2wrcDVRUGt1ZGgwZlUvbHJkMjA2U29FR0JXSkhuUWVQRXpQ?=
 =?utf-8?B?Yk4rR05LYkdpallId1JPNjVDMmd1Z1FXUWttTVpHeTlwR0VXbFRKdkFJZUth?=
 =?utf-8?B?MFRwMFd0T0lrUVFpWUp2L0g1ZHlpMFduTUJ2dEVmaXJoUTlsTE51dzV0Qk9I?=
 =?utf-8?B?VWR0YWtaRndDZUE5MTB4OUVEWUkyQW5WZjkyY1RoQWphcjhQQVE0WnRSZmM5?=
 =?utf-8?B?NmtZT1B6WVBuWDhjeXl1M0pwelRhQU5NWCtnTXFpdVdYSkRxa0lGcFd3NHAz?=
 =?utf-8?B?clEybkt6NHBTazlmaUlwZWR2N2ZyT2ZxUTZudzBqWERrSHY1MnJTaVo1aW1Z?=
 =?utf-8?B?TlpXeDBGSEg5dTNzSlpUdlh4WDRabVdCTW9JNlpYc3NRL0dVNjVFWXZ5K3lP?=
 =?utf-8?B?UzN5QzNNbEQ1T3NkUUNxNFBFOEhGdE0vT05QczgyY2M2TWR5RXF6bHVVeG4z?=
 =?utf-8?B?NmFXcnRuT0VXU1R3M28yNWRxS0ZnZUNPbDNxbFRpRnJFU0w3cy96QThRV29h?=
 =?utf-8?B?M0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7658890-0f88-4ca4-3011-08dc3e9ad790
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 11:36:34.1861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xk+33PKqQQTXdprOvY+Vimkukwz8OeU/c/vOev55kkEWdNw8VJHB8MhgOgqyFDPwNeKSVoTq1UKRAOvMsA420m7piXuQjZbDlHXeMyL0EcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7635
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

DQo+IExldCdzIGhhdmUgbWVkaWEgdGVzdHMgdW5kZXIgTWVkaWEgc3ViY2F0ZWdvcnkuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBLYXRhcnp5bmEgUGllY2llbHNrYSA8a2F0YXJ6eW5hLnBpZWNpZWxz
a2FAaW50ZWwuY29tPg0KPiBDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1w
Y3p5bnNraUBpbnRlbC5jb20+DQo+IENjOiBBbmRyemVqIFR1cmtvIDxhbmRyemVqLnR1cmtvQGxp
bnV4LmludGVsLmNvbT4NCj4gQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWF1cm8uY2hlaGFi
QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55
QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC9nZW1fbWVkaWFfZmlsbC5j
IHwgMyArKysNCj4gIHRlc3RzL2ludGVsL2dlbV9tZWRpYV92bWUuYyAgfCAzICsrKw0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9p
bnRlbC9nZW1fbWVkaWFfZmlsbC5jIA0KPiBiL3Rlc3RzL2ludGVsL2dlbV9tZWRpYV9maWxsLmMg
aW5kZXggNzlhMDZmN2I4Li42NWI1M2E2ZTAgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL2dl
bV9tZWRpYV9maWxsLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwvZ2VtX21lZGlhX2ZpbGwuYw0KPiBA
QCAtNDksNiArNDksOSBAQA0KPiAgICogVEVTVDogZ2VtIG1lZGlhIGZpbGwNCj4gICAqIERlc2Ny
aXB0aW9uOiBCYXNpYyB0ZXN0IGZvciB0aGUgbWVkaWFfZmlsbCgpIGZ1bmN0aW9uLCBhIHZlcnkg
c2ltcGxlIHdvcmtsb2FkIGZvciB0aGUgTWVkaWEgcGlwZWxpbmUuDQo+ICAgKiBGZWF0dXJlOiBt
ZWRpYQ0KPiArICogU3ViLWNhdGVnb3J5OiBNZWRpYQ0KPiArICogQ2F0ZWdvcnk6IERlc2t0b3Ag
Y2xpZW50DQo+ICsgKiBGdW5jdGlvbmFsaXR5OiBmaWxsIHN1cmZhY2Ugd2l0aCBtZWRpYSBibG9j
aw0KPiAgICogUnVuIHR5cGU6IEZVTEwNCj4gICAqDQo+ICAgKiBTVUJURVNUOiBtZWRpYS1maWxs
DQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9nZW1fbWVkaWFfdm1lLmMgYi90ZXN0cy9pbnRl
bC9nZW1fbWVkaWFfdm1lLmMgDQo+IGluZGV4IDM4ZWJkMTU3ZC4uZDU4Yzk5MGY3IDEwMDY0NA0K
PiAtLS0gYS90ZXN0cy9pbnRlbC9nZW1fbWVkaWFfdm1lLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwv
Z2VtX21lZGlhX3ZtZS5jDQo+IEBAIC0zOSw2ICszOSw5IEBADQo+ICAgKiBURVNUOiBnZW0gbWVk
aWEgdm1lDQo+ICAgKiBEZXNjcmlwdGlvbjogQSB2ZXJ5IHNpbXBsZSB3b3JrbG9hZCBmb3IgdGhl
IFZNRSBtZWRpYSBibG9jay4NCj4gICAqIEZlYXR1cmU6IG1lZGlhDQo+ICsgKiBTdWItY2F0ZWdv
cnk6IE1lZGlhDQo+ICsgKiBDYXRlZ29yeTogRGVza3RvcCBjbGllbnQNCj4gKyAqIEZ1bmN0aW9u
YWxpdHk6IG1lZGlhDQoNClNhbWUgaGVyZS4NClsgS2F0YXJ6eW5hXSBXaWxsIGJlIGZpeGVkIGlu
IHYyIPCfmIoNCkthc2lhDQoNCj4gICAqIFJ1biB0eXBlOiBGVUxMDQo+ICAgKg0KPiAgICogU1VC
VEVTVDoNCg==
