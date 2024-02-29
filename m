Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB2DC54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 11:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93F110E458;
	Thu, 29 Feb 2024 11:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YytUpEbY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3137410E45C
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 11:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709204808; x=1740740808;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aN9HdnQx2HPIRVP/Oj7gW83mZmL2CgW84UTQLTiTkQI=;
 b=YytUpEbYupwAtktuA8HQlknnWYShl4UFz6OvCZzmpwSFq+CkRn+yJBIx
 0bcSLmBy0YUOgL8ynk8hUOOV9e0MKbkRqZr5KJP0sJH7QzPxfbr0oddKZ
 KVLezfu/0Wf/uAfxhMvvne2uKnJmL5+uqyiS+QOggfcBmhV9qeS+tPyqN
 2sXuDUQkfU54JiT9RLxnShmvpOMQM+/5gCEUfDAnT8auFfxCQOd0BB8zM
 JlTuXJs7PcCzYcPaXsumEQapzNcxROAinG5t6NxkfeXgrdylHlw8PVbQ9
 vuCFYv4nYTpC2y6yBGIokD5qzoMpRFDe1x/UcxV3mpJo2ngefh7YQY9VB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14818797"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14818797"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:06:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7701192"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 03:06:47 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 03:06:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 03:06:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 03:06:46 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 03:06:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdIkN0da+HtLfJYHlDDuikEfvRxEyWX6EOB8r8yDMcBQXBnExNhjBcnrfZWW8HgoQeXK79gdAfkPeBg/5DfyiT5JHR2sg/ZPZa84eQ535RAhOj7FdCr6gS/EDjqOkj8Xd/QhI9zI+don9Kkl+8oMocrCmeHbjhBFzW7KNFhQy0VMD5IEprUuFn+vSSmr3f0GebACdIQf8Tf3Q8EVvXq8mGoB6H/NOqmk4isFVQhdP24E/m4f9rY+O2Jcip0hGqokvqbTGoG21M9Jy0lPrSMuRW3UMMoL2g+eG6HrFG3xngl+ukpt4N9562zolCkwEF7tM3vP7QpAESbGuCjpZGjZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aN9HdnQx2HPIRVP/Oj7gW83mZmL2CgW84UTQLTiTkQI=;
 b=A7H+ygI1NGGp+K6v2bemGDe1YHVzfDsO9w7Ndj3Gw+nAmq9Ny0Ej8z19rShncR0dTtMP2fnDuKwRIVYh7/q50Bo1LU7dvB4QfMMiDr53ssB9qP9R0DLOiNgcPMA3Q7REXV0xUxq+Bu/msgkrbaRu7EbVzkXgUyoCIU//g3TLNpdgN1CvkCJH0H6znygOUIXV8GmqQcJJ5lA05JvCXxhY5qckFnY89ZLScj8UYqOozLFj5Fy+6oT6DWuvvybMdEXQmcwaKjPFQyHNaIHliz12olgQOLQwqc6bNQ0OoZK0BkAVi5h305UjIo6LZy6MGVr8P1hhGc8HuNPra3vmP/0Ypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Thu, 29 Feb
 2024 11:06:44 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7339.023; Thu, 29 Feb 2024
 11:06:44 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/4] tests: use Infrastructure category for all
 sysman tests
Thread-Topic: [PATCH i-g-t 2/4] tests: use Infrastructure category for all
 sysman tests
Thread-Index: AQHaatztW7zjH055oEy7AM7KGACpsbEhKQRQ
Date: Thu, 29 Feb 2024 11:06:44 +0000
Message-ID: <IA1PR11MB60977FC1D7B668ECD2454BF3865F2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
 <20240229065953.538861-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20240229065953.538861-3-mauro.chehab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|DS7PR11MB7783:EE_
x-ms-office365-filtering-correlation-id: 0835b4e4-b267-4e96-3232-08dc391683f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6bjBUiYpAZppCtsfXyuk45TLfrqdac1Gle+PLwyi9nQoeDsOzbMx3WYxUYfpwZ+pSwFgzNnmvFOn6NjtLNx4qiUWnbh/o4cIr4MRg43ZVAIGX8kLSKYdShlkDAPrHEhUuQQvkLS8Mz36qklhXMphnA28+vELvkU6YPqlFc1VMROapSYFBH9Tqy8p/Q/XPc8fMaZqRot4AKsJHh+qONi+aFs4Tf3eCIEAKtdWfMSPq3yKuH9P6MRy2SzOSj2qL6baMEGYV2gF8d7zMjzo2h/zgoRoiR07muM5dNNnxfIHUrJRZnVv6ak8iP83HlgmAvrcatuiJ/PKm+3x0INoLqENNTE+GAzH6yK3v3RPR4FQC/yFPtRfvqMmsiBPD9BQc3mzBY0uL4jF9RbaVD5Agu/t7LNq0TtDOqecOjsw6j/rTJl/AUwnnctfG+6y0DpkDNTUGIxsssqJ3kZ7vUKhGYxLhaz2DzKpPnN1aTggpWz6blBlhh8MJ+lVxDxea43r4zPgMtiY7Vzip/fVVgO/9uFdBgUmvHFElZIxH5mOzRa+SE3W8M73xUVsgrpzT4u8RUo0sMN9ENnPlGv8KJHEb4bc9Z7V/GN47zFuzfOwfjLr7I7ly+Uki8ywEJWWUNnvAE4iwHGmGudhyFOOU3X+wSLAqRkr1QKUw7KWHXjhSx7t+7tB4onWIOWiY+xy08sVaq6t+lKwuR2QEodpAKPvGnfryA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3JrUmcwWnpaa0FnTXFIenV2UGJxZ2xDMGYvUEhJMTQwT2hOM2pvR3poT242?=
 =?utf-8?B?TTZidnhnenNJWE1sWkZhS3RYRGcyQWd5ajlJZ2hPN29lSnNTWWNOOEN1ZHpD?=
 =?utf-8?B?cXgvL3dlWkxPZzFQRENvUVgxZEZQTzNwV1NFeGwvYXBpeC9UNnF5Q1ZTUUYx?=
 =?utf-8?B?RFQwUzlCUGtaa3FWdm1CQm5uQjNoWU1VTGI0RDl4VjdCNW5HbDhmWDFoN2lQ?=
 =?utf-8?B?N1FKSk1SLyt6NmFJK0ppbERMOE40b2hscjlVbEMrZEQxbnJSSUF2cSs5K2xT?=
 =?utf-8?B?UUwxVEI1ZDQwR29oeSs2MktpalhKeEJvNXVKSFlKKys5R1gzL0NlQTI2dXlU?=
 =?utf-8?B?cS9YZnpCOEpudCs3YjhNbkVrN3YrUjdaajRGVEJWdVp1SWtKNG8xeVhRcUJP?=
 =?utf-8?B?c0hZNGZOdzFiVTBVSjBYMXZLSDVVWWFVQTNRQnZDSkVPc2JneXY2a3Y0eHdI?=
 =?utf-8?B?YVpteHBCblZhazdha0FBMGZKV0dDSm1tdnVVemt2NGt6aEdhL2gvaU5KQjRy?=
 =?utf-8?B?dGNheStRcWZyMnBLd20wdEFSM05ka2I5TzBrQk4yY1FwUVNHMy85T290TU9u?=
 =?utf-8?B?ZTV0QXdZMFVzamN6SjV5aGd6VWJSTVU1YkFIbklpM3BWY1MwaVdmUWs5OFJI?=
 =?utf-8?B?NXhtYy8wbEJFNDFSbVJON3UrR2FkejRqaVNjb3VSK3c0Z29tT2xoTXJIY01Z?=
 =?utf-8?B?WnBSUjU1V1lIYTdaR2ZpU1hMb1pWeW9HRWV3a0F0dlJubVhQcDFjbklMaHJW?=
 =?utf-8?B?QVl5aWg1azcvT1g2RXMwa0VKdFFWY1ZDeHRVMVZtMnIyaXNGWkV6Nm5kTnJT?=
 =?utf-8?B?OGNXd3ByWitVNm02VVB5dXVDYWg0VDQwZEZyUEtTZUJ6Z2dmN3NSR0JuYWdm?=
 =?utf-8?B?KzNiRlAxZ3RZL0FwRk5GQ0lJaGVmVklkTWdOQjJDZFpzRmVQTEpoQ2o0TGxo?=
 =?utf-8?B?R3VMUERGQ3BBL1htMjZDenNhd1RBNWJ2dnBqc2JoMGRzVmF6TStGVDJLRlo0?=
 =?utf-8?B?Y3RQRlJJN1p4VTNRbEJXOVlRRnhCNkJubndVWTBpY3gvQTVCeWY3U1k5NVhJ?=
 =?utf-8?B?QnJUMFBKR25GVEZaVitqdkd5ZDRHdG9DbnhtdDd6LzlMY0NnUjRjUjFnTktp?=
 =?utf-8?B?N1JEMEhKbFFMN1YrNGgyNVFNcUJ5aENZL2JvZUl4TEY4d2piK0IrN21Hc2d1?=
 =?utf-8?B?RXhFZ0loZS9vT3g1dHFVYXdhVkl1RVpGc3oxK1hKVkR3VGNaWTRKRW9kSHBh?=
 =?utf-8?B?VUt0N200TWt1Q2NOMGdlZjVDaGtXM2NWMzdRdWVBandEYmxrcUNKVEM1UGtB?=
 =?utf-8?B?NGRrNEJhcjZyalU2c04xSVdGVm8zL1RGTyt1SlFPNkZPbnNOUUdnVzA1LzNk?=
 =?utf-8?B?Z0FxVi9IeEY3UlJyQUpJeGljSEpWZ3Jmb3VPRXAzMzhKRHorQjFGSHBrcitV?=
 =?utf-8?B?dWFqL1ZRaE44NXdDd1FQWkU5N25SSE9qQ2dJVzd0aWorbldVTmtKbmpVb0FW?=
 =?utf-8?B?Z1o1UzNzVUlVc1BXVHRCM1hnUEhyV1IrR0FDbU9RcmVWQ0NyanVXL0FQZFdM?=
 =?utf-8?B?eFhDSVRVT2NET0kvaVRNcUlORW9zRXJPNXYrS0ovZjI5UzZYTEZwRko1OVdT?=
 =?utf-8?B?TGRzTFVwWnV6S3dzNGRKWGJwSFVsU1I3UGdGRldiSFU4ZDd4U0t2VWU4WG9B?=
 =?utf-8?B?MEg5NFB6YUNiV3FGcHl5MXpTWEZadFZ2NkxlMVNnQmZlZEVISzcvaDl0c1k3?=
 =?utf-8?B?TldHM1JEcnY1cUdxN3U3UGdDay8wNGxmSzZ2cHl6SW83ejlLUW5ybEVxTldO?=
 =?utf-8?B?THRYZkpBcEs3TysvSEZZUFhyaTBQMTJxaVF3N25lUTRNdUk4bTNOcU9kanZD?=
 =?utf-8?B?MFZ2SUlVRUUya0o4dnBKTHBLaWRRNGUrbFlSZG9FTTNTdTNtYUpIRjhjS1lp?=
 =?utf-8?B?SFJHcmkzYXJCYlJZbkRXRUlHcFVpT0FUSlFWMkdOMHpKQTBhWGpORnNUSmhs?=
 =?utf-8?B?RmxvaytnOXZJM3NoRkhNd29LMTI1b3JQRkcwTUtUVW0vcFJFMWhDRlUrQk9z?=
 =?utf-8?B?dGtIRlY1aHpaWVVyam1nTGpIaGhBMFpyTTZ1UStrOVBZc2lMU2dvRWJCOTBj?=
 =?utf-8?B?SE1lOElsTGdLZUhFTXIwUnVsbTc5eEVTN3d5WTBOblZMQUFtUFI3L1o5ck5Q?=
 =?utf-8?B?REE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0835b4e4-b267-4e96-3232-08dc391683f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 11:06:44.5021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X9iKizTFAoAuq8Aj6AOEtR1EB36X93rNkbw94DuszOhiNbZo/Wl/Q+i14Y8XQorIQrUkl+HPeZr29Gw64uczJiJD66boR0bXS2D7vnGKdEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7783
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

TEdUTSDwn5iKDQpSZXZpZXdlZC1ieTogS2F0YXJ6eW5hIFBpZWNpZWxza2EgPGthdGFyenluYS5w
aWVjaWVsc2thQGludGVsLmNvbT4NCg0KS2FzaWENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWF1cm8uY2hlaGFiQGxpbnV4LmludGVs
LmNvbT4gDQpTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMjksIDIwMjQgNzo1NiBBTQ0KVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogUGllY2llbHNrYSwgS2F0YXJ6eW5hIDxr
YXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgMi80
XSB0ZXN0czogdXNlIEluZnJhc3RydWN0dXJlIGNhdGVnb3J5IGZvciBhbGwgc3lzbWFuIHRlc3Rz
DQoNCkZyb206IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPg0KDQpD
dXJyZW50bHksIHRoZXkncmUgZGVmaW5lZCBvbiBkaWZmZXJlbnQgcGxhY2VzIHVuZGVyIGRpZmZl
cmVudCBjYXRlZ29yaWVzLiBVbmlmeSB0aGVtIHVuZGVyIEluZnJhc3RydWN1dHVyZSBvbmUuDQoN
ClNpZ25lZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3Jn
Pg0KLS0tDQogdGVzdHMvZGV2aWNlX3Jlc2V0LmMgICAgICAgICAgICAgfCA3ICsrKystLS0NCiB0
ZXN0cy9pbnRlbC94ZV9zeXNmc19zY2hlZHVsZXIuYyB8IDIgKy0NCiAyIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3Rlc3RzL2Rl
dmljZV9yZXNldC5jIGIvdGVzdHMvZGV2aWNlX3Jlc2V0LmMgaW5kZXggZWYwODE2NGFhZDQxLi4x
M2JkNWFiNWZkYjEgMTAwNjQ0DQotLS0gYS90ZXN0cy9kZXZpY2VfcmVzZXQuYw0KKysrIGIvdGVz
dHMvZGV2aWNlX3Jlc2V0LmMNCkBAIC0xNiw2ICsxNiw3IEBADQogI2luY2x1ZGUgImlndF9rbW9k
LmgiDQogLyoqDQogICogVEVTVDogZGV2aWNlIHJlc2V0DQorICogQ2F0ZWdvcnk6IEhhcmR3YXJl
IGJ1aWxkaW5nIGJsb2NrDQogICogRGVzY3JpcHRpb246IEV4YW1pbmUgYmVoYXZpb3Igb2YgYSBk
cml2ZXIgb24gZGV2aWNlIHN5c2ZzIHJlc2V0DQogICogUnVuIHR5cGU6IEZVTEwNCiAgKg0KQEAg
LTMyLDEzICszMywxMyBAQA0KICAqIEZlYXR1cmU6IHJlc2V0DQogICoNCiAgKiBTVUJURVNUOiB1
bmJpbmQtcmVzZXQtcmViaW5kDQotICogQ2F0ZWdvcnk6IFNlcnZlcg0KICAqIERlc2NyaXB0aW9u
Og0KICAqICAgVW5iaW5kcyBkcml2ZXIgZnJvbSBkZXZpY2UsIGluaXRpYXRlcyByZXNldCB0aGVu
IHJlYmluZHMgZHJpdmVyIHRvIGRldmljZQ0KICAqICAgdmFsaWRhdGluZyBkZXZpY2UgcmVzZXRz
DQotICogRmVhdHVyZTogcmVzZXQsIHNyaW92LXJlc2V0DQotICogRnVuY3Rpb25hbGl0eTogcmVz
ZXQNCisgKiBDYXRlZ29yeTogSW5mcmFzdHJ1Y3R1cmUNCiAgKiBTdWItY2F0ZWdvcnk6IHN5c21h
bg0KKyAqIEZ1bmN0aW9uYWxpdHk6IHJlc2V0DQorICogRmVhdHVyZTogcmVzZXQsIHNyaW92LXJl
c2V0DQogICogVGVzdCBjYXRlZ29yeTogR0VNX0xlZ2FjeQ0KICAqLw0KIA0KZGlmZiAtLWdpdCBh
L3Rlc3RzL2ludGVsL3hlX3N5c2ZzX3NjaGVkdWxlci5jIGIvdGVzdHMvaW50ZWwveGVfc3lzZnNf
c2NoZWR1bGVyLmMNCmluZGV4IDk1NGRhZDEzMDVmMS4uNWEyMmFiYmYxNGJiIDEwMDY0NA0KLS0t
IGEvdGVzdHMvaW50ZWwveGVfc3lzZnNfc2NoZWR1bGVyLmMNCisrKyBiL3Rlc3RzL2ludGVsL3hl
X3N5c2ZzX3NjaGVkdWxlci5jDQpAQCAtNSw3ICs1LDcgQEANCiANCiAvKioNCiAgKiBURVNUOiB4
ZSBzeXNmcyBzY2hlZHVsZXINCi0gKiBDYXRlZ29yeTogU29mdHdhcmUgYnVpbGRpbmcgYmxvY2sN
CisgKiBDYXRlZ29yeTogSW5mcmFzdHJ1Y3R1cmUNCiAgKiBTdWItY2F0ZWdvcnk6IHN5c21hbg0K
ICAqIEZ1bmN0aW9uYWxpdHk6IHNjaGVkdWxlciBjb250cm9sIGludGVyZmFjZQ0KICAqDQotLQ0K
Mi40My4yDQoNCg==
