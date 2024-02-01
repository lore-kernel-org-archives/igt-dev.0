Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542ECC4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 13:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E240610EDED;
	Thu,  1 Feb 2024 13:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyxPl7Pq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2867F10EDED
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 13:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706795400; x=1738331400;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bEfUETXXy8e9eWefqnst0/juWPHty6bvYAmmzH55BsM=;
 b=XyxPl7PqXQqE9tWx6AKWHgyYKhyhqitxh/RrfI+fZRM4eyb8siiVEkOA
 fskpRPQvcva8k21GeRv+8sOTzMpTfQp5gGUOBZsizb6tcmROKvqM6C4wY
 0k00b2PeI+Fc9q9dANobkePGHpPmtjuZMq9i0sLi9ogLuiQwCbHrCtDZy
 vDylCxQdjFx+o74a8CtOiaAhJLorHBVoyYW/quq/H0SaMiJiw9998JiMH
 xVFepSyj+I9FC5iRDyLSniKK3+O38qG3MwKVMJefMFEswWJpgGwdO8mnk
 4TmeDnCWGpQmJmqRMJVaHghwfSpK2F7qciTP6EVNUKkrcq8VsjkoAninC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17282931"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="17282931"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 05:50:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788936132"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="788936132"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 05:49:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 05:49:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 05:49:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 05:49:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h844n7F1+jm7rucyrrEnG9bw9m7xG8PKQBYhj9vLz3mT/e6zrOzUJGCnlRxkuOvnFiUFG1eWKHUeKZHvudSy9RKcZjtSvKKhnhgOus0zbrT7oZqCmkzhUDg6o3jJOeutXc8zzN+7nnCLCocvslEQX+J7XS1U8BcF1fA179vZU1BRrYqmpVmBFdmTBwXS524sh9twRtD3Vn/NVU/DU+Mj260hij17AD83svNdN6fzKVcS5mZVz3vfUMShWAh3NH8qTtHsfB6iP9aLb2ts7eqBUdfMxT7R2x+Qtqb4ZkL+D0fBjpEihlofMsQJTVKxbmHO0A9n8aw6dne7WcAUdk83vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEfUETXXy8e9eWefqnst0/juWPHty6bvYAmmzH55BsM=;
 b=MLHQjS7iMyt9shgA1rvNUwkpxRcIHH9ORcAk3AQFopuTZC6RooGd4xjEkDDf8NUdjxUdVgJjvu+/PpVSDR0XCQy3kx/LfSSA1cFsjEGrj1fcN42yOO4RVIsuU/bWQOYUZnE5G3Y7N0oeBax/4LRik9Iy15VBztJS70u/slDprYQ4ofwDiyzItyimaUtv84u6ZLfAS2Kerlk8XVk4y84CVG1Nd8uyFC148Z9npTwjmoszuYeaHYOg2H8uiTCpRxydOApuufmAY+GNnqF22UzzX95kJDxjrX8izvv73RpQczPEOFsSIuT6xb0tMYhWBPb2qygIBDAsBgjfJV1djAmZ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS0PR11MB6376.namprd11.prod.outlook.com (2603:10b6:8:c8::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.22; Thu, 1 Feb 2024 13:49:57 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::dde1:91ce:98c6:d737]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::dde1:91ce:98c6:d737%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 13:49:57 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH i-g-t] lib/rendercopy_gen9: Fix Xe2 missing pixels on
 non-modulo-16 surfaces
Thread-Topic: [PATCH i-g-t] lib/rendercopy_gen9: Fix Xe2 missing pixels on
 non-modulo-16 surfaces
Thread-Index: AQHaVQ/jiPASL/Nq4UaXdDw3kUnT2bD1gPEA
Date: Thu, 1 Feb 2024 13:49:56 +0000
Message-ID: <bdb9a8f410fc68c1bb4654fe5466b72bc4c2ce5c.camel@intel.com>
References: <20240201130904.388276-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240201130904.388276-1-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS0PR11MB6376:EE_
x-ms-office365-filtering-correlation-id: 12288fbc-c654-49ea-9472-08dc232cad20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 63myWd2dxrcHAJD9/kH5Pg70jmJyzr6Iadz8l+1jBCeE30uGqrbvd01L2tv4bpuOfX5I9ACS+c0inAHoeaJOtqbq8ROQQuhlaUBpX0d6uTDWMQmPyAE19tqWI60YBRm9Czmm21c41f1wWAAlGNGtSJSyKuqtLE+T3gdCNj/AX5TXhX3vztTxiQBlOedAuNOm9k33JmzyZp3lofbehJrm5XE/JRPK46IoM94zo9DaCk9+EQn4LED03TT+a4gN5IEu4OIaB8DnqsI1GZWKCZuIlQqKlrueKGsvO491nyHVpxCFDlgAkOSq3Xt3I7c32Kpnk9EQKKLhdaCxBp+pOEcIkcAMwBQVB2CL+BUvNQ6lQG68ttVBoNR30i6/8xjjh3QWq7JIS30gcrxinfLwXgrOkLoLI0NEJJWBjAoDVh6YPPgOSnYj3bb4RyQE7dlnS64sswdzjoANRwJsuZQoOHHz+yfIK5BrVMWREKsxH/XrbIS9aFiSazZA1A4r7vwEc4IfIbjzS67UolD+e2Ibur9TPm4BGEofb3ndqk6pYfAiYPVuHkPz/Fm90pEiR92V9Y2+Dj9yejnalBySG/1X8E0zV6kW2B4ssFy7JnTtUEzbXu95lweh1v5plhuo5s7oyqaQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(83380400001)(86362001)(36756003)(38070700009)(82960400001)(122000001)(76116006)(41300700001)(2616005)(26005)(6512007)(38100700002)(66574015)(2906002)(4744005)(6506007)(478600001)(110136005)(6486002)(316002)(91956017)(4326008)(66556008)(66446008)(5660300002)(64756008)(8936002)(66476007)(71200400001)(8676002)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2krOTJlN001Y1BWODZrQ3VGZE5SNldBd282UDQxOEI3V0NFK0oyTE1BUmI2?=
 =?utf-8?B?REM1RkNtbHVEMnNDNjNsTGpFVWtHUHp2MmR1cHpwNUhrUTg3azY0dDFVVWJm?=
 =?utf-8?B?QUpYMUpOWHo3MzdIeks3RkNINnNZRGxqZk5obVhhamNna01abElwd1NSYUZJ?=
 =?utf-8?B?M2FIUGJZMENyaUtoTWlnaWNlZ0hQaHlBZTUySllNZkMzMHdpSTZiQ1lNRmFZ?=
 =?utf-8?B?NjNPeHhxcWg0TlBmYWhtZjFncmV0UlphaDE0NmV0NjYzQ1Jvb29EZVA5MUww?=
 =?utf-8?B?TFJHNWc0aUYyTGQvNEllUUEwb3NURWRtL09rSTVOSisyU3czaTJtV0VWeEtO?=
 =?utf-8?B?eWpZd3VRZkFHdTBCVFNuMjFhRS9zOVo2NDRVaWhXVlVyTW9nbGxrbVhPbHN1?=
 =?utf-8?B?YmE5R1dDaFd4NDFLaW16RTBFZHRxZmloaHo4MmhoQXJLeDl3Z0wrL1VwcEZr?=
 =?utf-8?B?SEQxK25aUHBLWjdwN0VvNnpNZUVBejFIOU90YnRhQzBISmRzRVl0cHhoK0I0?=
 =?utf-8?B?aytxWmx0azR3Tk5LYnRHNjI3V0UzbGZkQW5JSU5kQ3NzRXdsTVdTRWVCSEdi?=
 =?utf-8?B?ZEx6RG5aVlh3TVlJTTFtSkdHaDRpQlVBNWIwQzNwL1VZeEJMMDdkeVZPQTFw?=
 =?utf-8?B?RHN2VXl3TDZ2dHhmMStoMDc2K2lHT1VMM0srSWlIVDNDUWlQNXNQU1hGK0FW?=
 =?utf-8?B?WjNwZTN3MEtORE56QlRMS2tjTUF1L1JOazJWemkzY3E5RHc3NWptaTBsdGhq?=
 =?utf-8?B?MkZqOWNJbHh3dUVzVmdjVG94ZFdJKzNQVlkxWjMzNTRIdU1KeFlveVNvZ1RF?=
 =?utf-8?B?MkNiRTg1bXVYdkFNVC9MREUxVFIzaFRuT3NIdnM4UVAzMUtRc29CbkFnd0pH?=
 =?utf-8?B?cFhVQlVPQ0IyckQ0QVVUOXNyS1RXMjlnS0JHcTFKcnhsRFRySU9UTXhCMTRv?=
 =?utf-8?B?aTdScGYrTnpDbVFWZ0FyR3BVV09WbXUvRzZaQzJpVmt4NXdQeUplb0tseGxU?=
 =?utf-8?B?bVVJcUhRcDM4dldPQWswQmlpbjl6aVZ0bXJ2Y0JHT1hyY0hMOWlQUXNUdDdw?=
 =?utf-8?B?bnpQbjRwcjZHSnUxOTR3NXUxSngxdVErYnRLT1l1SVNycUo0VWNMZURhblcz?=
 =?utf-8?B?dTFaeWtkbExsSHBjdFFrNjYxVjFKanVlM3V3NERuNkxGVkYyb2hXUzk5dWt0?=
 =?utf-8?B?a0hqcFp2T3dmUmZGR0RVU2FNMWt1SFdJL1BMYVk1dFpCWVRIaXVSd2RLMVVq?=
 =?utf-8?B?SHJ5L3RvbkZIMHhSa09RYVBPczAvcUlQWGVXay9ZS2xNK3ZHT0NmVm9aQkNt?=
 =?utf-8?B?YnRnR21QQ0VRWkNsWFF3SnVEZThUNHpNNTFJWG8velVLaU1LWkZMTS9WN0FN?=
 =?utf-8?B?cXBRcXZMUmVyd3k2TEQrMStOUTRMVzhKdnpBUXdHd1MrZHpERmQrRU91b1Va?=
 =?utf-8?B?ckppTHZ0NXRUVlBuUjZYR1o0VEs2SGFPSjRwSlMwWjRlODNhNGlMZDQ2b1Ny?=
 =?utf-8?B?eHExUkJCbjRBeEJGeFhtTXJYdForNjFObERrc3NXQWRXd1pvcFhLYVhZQWZE?=
 =?utf-8?B?VDlJM0lwSE96SEhDbEV3b0cwVm4vck9oUnl3MXpmaWtaMlRpaEhCcDJJVzJz?=
 =?utf-8?B?NUtXelI4azdUTlNnNGQ2NHc0eVVwYkVNeHE1ek8rYTlYTitSQk9XV1R4VHIz?=
 =?utf-8?B?emVoNHVpMEJ0MUVXbDFlVVZCUWNVTFlvMjZZYWJKUjVaMFc4ZHgzeDFZa05o?=
 =?utf-8?B?aHFFbDRDc0x6bzdWb1pvamJ0N2laVHRNNTBoTEUyZkFwOGU1NFJ1RGNrSWZ1?=
 =?utf-8?B?aElCSjA1clNwSFNhVWpEbWU1WnNFM0d6bTQ5OGMrRFZRN3lEQ1VXQ2Q3KzF2?=
 =?utf-8?B?OHZEZ2s0V3R0Y2VXVEg1bTNNOWl1NHBUQW5oQldsOWJjY1hBREJ5MHppMkM2?=
 =?utf-8?B?eUtLVDA4eEZ5b3p1MXJPNFNXQmV2UTZhRDJjN2xQd2xkdU1ocjVoMFUwS3oz?=
 =?utf-8?B?QW9zOXFzMzR4OVhFUkxTMHhNTmdIOFdkVzFtMEVJRG96dm9EUTZlbUZ0UDdZ?=
 =?utf-8?B?UE9RTHg3RUE1NFpIckI3TXA1ZzM1T1hWcmRTRGFRZHlNeGVsUEZaQ25WTkRy?=
 =?utf-8?B?THlzUEwyQTk0QTNtWlgweG9EVjlDVW5kSVMzT3ZlM3hLNU9OU1ZDV0EzYW1o?=
 =?utf-8?B?ZXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F50322561A0F5946B324D51311B29B62@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12288fbc-c654-49ea-9472-08dc232cad20
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 13:49:56.9520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 10aX96IgTbZWWoGyt7v5PyeSNEorBQjASKVuCCRQchnjwEHW3l7YPxScE6zDCzfHa9liuXgZgIpGAQYygaXVQKAnRlSyDf4CsYVhrs9fi10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6376
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

T24gVGh1LCAyMDI0LTAyLTAxIGF0IDE0OjA5ICswMTAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IE1pc3Npbmcgc2V0dGluZyBLZXJuZWwwRW5hYmxlIGJpdCByZXN1bHRzIGluIGxh
Y2sgb2YgcmFzdGVyaXphdGlvbg0KPiBvZiByaWdodCBhbmQgYm90dG9tIHBhcnQgb2YgdGhlIHN1
cmZhY2UuIEZpeCB0aGlzIGFzIGttcyB0ZXN0cw0KPiBkZXBlbmRzDQo+IG9uIHRoYXQuDQoNClNl
ZW1zIHRvIGZpeCB0aGUgcHJvYmxlbSB3aXRoIG1pc3NpbmcgcGl4ZWxzIG9uIG5vbi1tb2R1bG8t
MTYgc3VyZmFjZXM6DQoNClRlc3RlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRl
ckBpbnRlbC5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNr
aSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBDYzogSnVoYS1QZWtrYSBIZWlr
a2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gLS0tDQo+IMKgbGliL3JlbmRl
cmNvcHlfZ2VuOS5jIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9yZW5kZXJjb3B5X2dlbjkuYyBi
L2xpYi9yZW5kZXJjb3B5X2dlbjkuYw0KPiBpbmRleCBiZGZkOWJlMDg3Li5hNjNkNTMyMGIzIDEw
MDY0NA0KPiAtLS0gYS9saWIvcmVuZGVyY29weV9nZW45LmMNCj4gKysrIGIvbGliL3JlbmRlcmNv
cHlfZ2VuOS5jDQo+IEBAIC04NjMsNyArODYzLDcgQEAgZ2VuOF9lbWl0X3BzKHN0cnVjdCBpbnRl
bF9iYiAqaWJiLCB1aW50MzJfdA0KPiBrZXJuZWwsIGJvb2wgZmFzdF9jbGVhcikgew0KPiDCoMKg
wqDCoMKgwqDCoMKgaW50ZWxfYmJfb3V0KGliYiwgMCk7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKg
wqBpbnRlbF9iYl9vdXQoaWJiLCBHRU43XzNEU1RBVEVfUFMgfCAoMTItMikpOw0KPiAtwqDCoMKg
wqDCoMKgwqBpbnRlbF9iYl9vdXQoaWJiLCBrZXJuZWwpOw0KPiArwqDCoMKgwqDCoMKgwqBpbnRl
bF9iYl9vdXQoaWJiLCBrZXJuZWwgfCAxKTsNCj4gwqDCoMKgwqDCoMKgwqDCoGludGVsX2JiX291
dChpYmIsIDApOyAvKiBrZXJuZWwgaGkgKi8NCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChm
YXN0X2NsZWFyKQ0KDQo=
