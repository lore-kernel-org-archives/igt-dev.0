Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4362AC48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 07:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C877810E87F;
	Thu, 22 Feb 2024 07:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J974AIM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C5810E87F
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 07:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708585419; x=1740121419;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3wKJU6GDZxGH2BMd2JOx1Q894cMSSYO50ER88SV18YI=;
 b=J974AIM0pP7RBFvh4oirG1QQX/QTOsoLoKDIRqCZS1FdHSLYnmNaqMRm
 YqPkfqLn1HZR5E4/rNf2/TDet5O0maOv5kGpmQfDLDipTD6VrDS+qkwm9
 NdBM0zL758mw6DCsS60yDjSow8NsyuGH2h/BDxZfzElebLY47n7upAjCv
 VMfLRT9dRyGzejJSQjuydPgs3wHbt3E9bjM6ZkdlJpzFz/zspSTAZ8GjG
 yqBstYuWs42llAz+4n8UVJnJGyYkGZzt+6DHDDB5I/ayxRNNwTWwjohM5
 vlV2Gfu6xhrQIExeLsJd+f8asu77Q0WPzCEW1IamNtcN7cfG7MkI17pqG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2655171"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2655171"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:03:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5346922"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 23:03:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 23:03:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 23:03:38 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 23:03:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zw7xA2ZLWFQtpkWc903NHhCwZzzGiR/qqziy+NWLXhOzj+rlyJ7cR3FNzoc0UnKVN7yrIBzAeSiLDxLML8TG8x7dzeLRotxsl+PPLx2uc49+3nPSA6c3ieX5QxBNlEZ1GFgHTTXpFeAZu1VlJRfQocgmkb5UtqAK3Aos+vOD2cZGZEscLKwH/64eR101hqkoCD0IKLdjla7yJFs8MZ5JPSoHAJrpWUm3hNQ2HFBou2rOzig7eV4lAlwrrW/JAp/51EdZvlNTs7OmslKRS26EN5XJzLT+hdMn/MEnFOvfi1jl9wbYko7ZgMY5dMz1phcvrHtYddxar2qsvo/U0VNkIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wKJU6GDZxGH2BMd2JOx1Q894cMSSYO50ER88SV18YI=;
 b=j9iEkW17VhNtc0WK33175alBXUBL7HGojKIn0xq42L6Xc6Sh2oi123JPsI6t4CE8y+gYqESgOhhPqgIs0Gm6SECOqAs0WXUj+3pY2LLUHc5eb7r9OOjBbBNqv7kmtJbU24XdRFrVgILVq2qnLWtrGqCjB+6iWkCaR5ZJj4Sodp/RuD+OVgyo+Yy3NOVKHQgfcorhPhUMRzteSOmRI9R1PCEBRdEL9jl57XcFrr6Bkxz0sNsq3gjwN4TzkdnYWzHM8Ly2oacXaLh7kbbAtVTOElqdfY7tq/NgByM55uzickfbiGbbt/5McI3U/o5lNLhZ/nl7Gwftd9p9cNx1vGUcRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by MW3PR11MB4745.namprd11.prod.outlook.com (2603:10b6:303:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 07:03:36 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7292.033; Thu, 22 Feb 2024
 07:03:36 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t] tests/intel: Add tests to run suspend without display
Thread-Topic: [i-g-t] tests/intel: Add tests to run suspend without display
Thread-Index: AQHaZVtVRH8Lo8hLLk6vd6Uhpo4XJbEV7Z0AgAABEbA=
Date: Thu, 22 Feb 2024 07:03:36 +0000
Message-ID: <CY5PR11MB62114DF7228979346319F8DB95562@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240222070635.878953-1-sujaritha.sundaresan@intel.com>
 <cb29fe35-0e68-402e-ac9b-a18addd3a48c@intel.com>
In-Reply-To: <cb29fe35-0e68-402e-ac9b-a18addd3a48c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|MW3PR11MB4745:EE_
x-ms-office365-filtering-correlation-id: 9672ccd1-b705-4fe3-79ff-08dc337463ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kb/YsTAkBfjranc47BjRX7bIVb7AkjviBgif9HkVIppnCYhr5OhIvcxOO2DNlXNrqe+XOr3nhTqEc959rnw7Nh1W1CvzkByh8eia6+z+KKe7zfpARP/efqa35IWagXoKGFpoGUrSsVHSQjSfBvD6I4YZtEEFcuvy0WLkFbG+pmphk6oyLlSftzly2HxaZSUacc/Pe+GRMGOAi7FMcqo8dIlKHCMJj/oEA2Wez3ML9X7/aBeMMG5B74x+9TFWL6ttJlVR8VQ9FLZ334KaUYI6d/ZEUvO6qPGbMlnwvwDhOAXPoaMZqy4tGdKYeJONNYSP/xHDU48NZKPY8H/bmB2VnXqSdC+BK4YCr2cZSKP3rM7yP5tHe9jnEeYOTAuJIZAoDk8mWkQhdSKXbRRM8SHcXnoNxwLcvMciP4aEFtDmX3cUWaFwgddtWbt0kOgjbV/PkwpH30U/efYnbQBCdNeDM6RabXnwoDgOXakaHy0xlyLLltxDFTHQA1hMJjfRyECXIILl0czgpApP8/pUDDQNvD48EkWxY7xoR3546FjzdmJ50UDbOIZgr5YYEJLf5Rxa9lqw+mkQSky4mm9CgAGG8FlVj3Pjo4LOI1wOjzkyhJmnMbW0LENp897B6dVxvX2e
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGl6ZVNSV1JISldOU3hDT0VvN2FSbU5Ka3VsNGttOTh5N3M3cVZ6ME1nMjg3?=
 =?utf-8?B?ZDVQQzBFbzVtczVtNHd3aEUxc3B0VXR3WGpOajRRVDNNNERTb0RkRHNKalZ2?=
 =?utf-8?B?Q0FKc0pESVFXQWZ0czVpZEcyNkMxc1FoY0txL1EwZWxxUWNza1p3a05qYSts?=
 =?utf-8?B?bXhRTXF0YWoxdG1aVkx6UjBIdjNxTjlaSzNzOFc3SzZCSXMyTVMyamNlUjh3?=
 =?utf-8?B?c3I1QWJBbWljbTlvSmFFcWNKUldseGFoZmFIU2FvcHdDak5KdW0wTTdmN3Zh?=
 =?utf-8?B?TU50M09mUThyZUVVWUdBK0NyWXhJeDBiK2ZmbEJ5cmRUUHgvWU9EZEVzWEdp?=
 =?utf-8?B?WjY1empuL1I3OFYrd0M4Y3JkclFucDRlYmlRSEZvNjBSbDhwVlA0TFlFRFZ0?=
 =?utf-8?B?NVVWemI1TE0rWjB0YnZ3blpoWTgxbmtVVXJVUHlwWWd4c0poZitWWElRRm12?=
 =?utf-8?B?c3g0QTc4aU82ZVJCSDArRFBEa2dpYWk2a3RLSzhraExDNXhYYzhqc3dBL3ZK?=
 =?utf-8?B?Sm9RQnJScEx0VSs1NGcvb1F6b0RJTkwzRU1XT2c0b0pvRFdtclRyYlJ2SXdn?=
 =?utf-8?B?THQ2OXJvN2djU2diQ0hIQlMzbmNMQ1QxQTdPOC9DbDlrVWE0QmRTWE54Zllp?=
 =?utf-8?B?YjI2ekN5ZjB2Q09sNjRFcTcxWWM3QVBJZ0lWUHhjWStIZVAwQTRXWW9kRkhN?=
 =?utf-8?B?VGpNbVJkSDdRdzloQ1I2RTAwUUN5WmNOTmhiRm1EZHNoZmN6N1dVWkxENlo5?=
 =?utf-8?B?TkR2WS9lamdSQ1VVRVVGWHJ5MVc0U3FLYW0vYnVqMW9WNkZRR0Fnb0xoYVlo?=
 =?utf-8?B?SWpxWnF2c0RXRHVmd0V1TGZhTnV0bENMWWVuVkhIcWVuUVRZdHVScis0QjJZ?=
 =?utf-8?B?ZE51NisweFZ6ZFlaVTBabUdBQXBBM3RoSWRkOXlOUG4wSHliTGtyZll1S0xR?=
 =?utf-8?B?QytXQWRrcng4WG1IdFFSdzRkMjkzZlZkck1IT0wxZDg1SkdvNXFZejl6eFlW?=
 =?utf-8?B?dDBrMytIT3JLdVFBNGxZVGFSSGdCS3VFVDBPRlAvWXdwRi9tN1Zjd3BXNzhr?=
 =?utf-8?B?cGFRdlp5TlBaZmlYSzdxQ3FrYnBxYUt5ckY0Ui8yelNHWFNLRktNYTRBeDhk?=
 =?utf-8?B?alNsRFRSYXZlUVdsZ3JLZDcweTl4YWlucDlSNTJ6bmhUOW52dlBWdlpSRzhN?=
 =?utf-8?B?aEIwVEJLeUJZTitQdWRLR2R4Mi92MzAvR080ZlhmM1NsZDBXcDVFN28vRnh2?=
 =?utf-8?B?dVpUdkNsUG1RMmZIYzBrcnBDc2Z4NlV2aCtlSThYeEJKNVhiU3gvcnIwWWZM?=
 =?utf-8?B?UmFnM3JGc2FnaGlLKzhyak9COC9SckxJbXVudEdwR0lhd1FJUnR4N1BxNnhR?=
 =?utf-8?B?cHJBQ0x0ai9ncnROTVZCa2ZRbWovNDJuSWJRb3E0S1MvQUNmSzNvcnh1dWti?=
 =?utf-8?B?RTJVaWZxYVVIYmtCZWdMeHNtMXJFSmFITlpLWW5xV3NEYTY2WW1zWCt1NmY0?=
 =?utf-8?B?bzRKWlNPVnRyZnZmdlpidW10dmc2S0daSnRZcklQM3V4MUZJS3FZeEVjT3I2?=
 =?utf-8?B?NkJGeDdHY01BZHladDdVc21jV0dkMzFHQmJJaFZyQnVOVng3NTR6UngyU21u?=
 =?utf-8?B?blc4Z0pNUjhCdnkyL1Bkc3h5bzZkL3ZjYkI3bVVOdDNkalJoZkg3R1YyaHpV?=
 =?utf-8?B?OWhvUkRPRVpVTXcvMXdxTkFxYlVTOStrdTdrRGJVd093OC9wdEluMURDWFcr?=
 =?utf-8?B?eldEUy9NWVdJb0tMVThIdXpkRnBJeG9ZbDJrdEhSQ2R4U1U0L0wxTEdRZWxk?=
 =?utf-8?B?YlRZVTNySmJiUkUxeDl6TlVSMHdJaGphZWlJNXVNVzI3eEVVRGcrcmRCbkxy?=
 =?utf-8?B?cVVqdEVwczFrOURkKys4TUhKa3ExZ1pReXVmaytRQWFybDBZd1JtZWcrTThN?=
 =?utf-8?B?bnM2dVRyY2VGdHpxdjJ3eVJueDg2NUJYKy9ZU3JoNTZBVWZMSzRDb2s0ZXFn?=
 =?utf-8?B?UzhaeXRKU3RXeU84UG5jQ1RYWHk0bER5emU3ZmhZV3doM1BQd2psZ3YxNTZ1?=
 =?utf-8?B?MnhqWFREN3RRRzk1Tk8xcVNkanRNRmtoQU11MkE0TlU4UUp1Vmp6MUtTSENZ?=
 =?utf-8?Q?6DdMouzo8rHAUcpqnXMjm+n0h?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9672ccd1-b705-4fe3-79ff-08dc337463ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 07:03:36.5051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D9C4lYgy4Q8xDzGBLxUUkGYvuz/RCK0GB5aMlrMQ3xvIctqkE6UsoCIjAR4gp5x5/Q7XncVMc9A4M0zCP8sSclOf5OJwcoVHRAkHYEdfZOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4745
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3VuZGFyZXNhbiwgU3Vq
YXJpdGhhIDxzdWphcml0aGEuc3VuZGFyZXNhbkBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBGZWJydWFyeSAyMiwgMjAyNCAxMjoyNiBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gQ2M6IEd1cHRhLCBBbnNodW1hbiA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW2ktZy10XSB0ZXN0cy9pbnRlbDogQWRkIHRlc3RzIHRvIHJ1biBz
dXNwZW5kIHdpdGhvdXQgZGlzcGxheQ0KPiANCj4gSGkgYWxsLA0KPiANCj4gQXMgYSBoZWFkcyB1
cCB0byB0aG9zZSByZXZpZXdpbmcgdGhlIHBhdGNoLCB0aGUgcHJlLW1lcmdlIHRlc3RpbmcgZm9y
IHRoZQ0KPiBhZGRlZCBzdWJ0ZXN0cyBpcyBsaWtlbHkgdG8gZmFpbCBkdWUgdG8gYSBrbm93biBz
cG9yYWRpYyBpc3N1ZSB3aXRoIHVubG9hZGluZw0KPiBhbmQgcmVsb2FkaW5nIHRoZSBkcml2ZXIg
d2l0aCBubyBkaXNwbGF5Lg0KPiANCj4gVGhhbmtzLA0KPiANCj4gU3VqYQ0KPiANCj4gT24gMi8y
Mi8yMDI0IDEyOjM2IFBNLCBTdWphcml0aGEgU3VuZGFyZXNhbiB3cm90ZToNCj4gPiBBZGQgdGVz
dHMgdG8gdmFsaWRhdGUgYmFzaWMgZXhlY3V0aW9uIHN1c3BlbmQvcmVzdW1lIGN5Y2xlIHdpdGhv
dXQNCj4gPiBkaXNwbGF5IG1vZHVsZSB0byBydWxlIG91dCBkaXNwbGF5IHJlbGF0ZWQgaXNzdWVz
IGZyb20gdGhlDQo+ID4gc3VzcGVuZC9yZXN1bWUgc3RhY2suDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBTdWphcml0aGEgU3VuZGFyZXNhbiA8c3VqYXJpdGhhLnN1bmRhcmVzYW5AaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICAgdGVzdHMvaW50ZWwveGVfcG0uYyB8IDIyICsrKysrKysrKysrKysr
KysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfcG0uYyBiL3Rlc3RzL2ludGVsL3hlX3BtLmMg
aW5kZXgNCj4gPiBhMDA0NWRhMGIuLmU5NDgzNWYwZCAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9p
bnRlbC94ZV9wbS5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfcG0uYw0KPiA+IEBAIC0xNiw2
ICsxNiw3IEBADQo+ID4NCj4gPiAgICNpbmNsdWRlICJpZ3QuaCINCj4gPiAgICNpbmNsdWRlICJs
aWIvaWd0X2RldmljZS5oIg0KPiA+ICsjaW5jbHVkZSAibGliL2lndF9rbW9kLmgiDQo+ID4gICAj
aW5jbHVkZSAibGliL2lndF9wbS5oIg0KPiA+ICAgI2luY2x1ZGUgImxpYi9pZ3Rfc3lzZnMuaCIN
Cj4gPiAgICNpbmNsdWRlICJsaWIvaWd0X3N5bmNvYmouaCINCj4gPiBAQCAtMjM2LDYgKzIzNywx
MCBAQCBzdGF0aWMgdm9pZCBjbG9zZV9md19oYW5kbGUoaW50IHNpZykNCj4gPiAgICAqIERlc2Ny
aXB0aW9uOiBzdXNwZW5kL2F1dG9yZXN1bWUgb24gJWFyZ1sxXSBzdGF0ZSBhbmQgZXhlYyBhZnRl
ciBSUE0NCj4gPiAgICAqIEZ1bmN0aW9uYWxpdHk6IHBtIC0gJWFyZ1sxXQ0KPiA+ICAgICoNCj4g
PiArICogU1VCVEVTVDogJXMtd2l0aG91dC1kaXNwbGF5DQo+ID4gKyAqIERlc2NyaXB0aW9uOiBz
dXNwZW5kL2F1dG9yZXN1bWUgb24gJWFyZ1sxXSBzdGF0ZSB3aXRob3V0IGRpc3BsYXkNCj4gPiAr
ICogRnVuY3Rpb25hbGl0eTogcG0gLSAlYXJnWzFdDQo+ID4gKyAqDQo+ID4gICAgKiBhcmdbMV06
DQo+ID4gICAgKg0KPiA+ICAgICogQHMyaWRsZToJczJpZGxlDQo+ID4gQEAgLTYxOCw2ICs2MjMs
MjMgQEAgaWd0X21haW4NCj4gPiAgIAkJCQkJICBOT19SUE0pOw0KPiA+ICAgCQl9DQo+ID4NCj4g
PiArCQlpZ3Rfc3VidGVzdF9mKCIlcy13aXRob3V0LWRpc3BsYXkiLCBzLT5uYW1lKSB7DQo+ID4g
Kw0KPiA+ICsJCQlpZiAoIWRybU1vZGVHZXRSZXNvdXJjZXMoZGV2aWNlLmZkX3hlKSkNCj4gPiAr
CQkJCXJldHVybjsNCj4gPiArDQo+ID4gKwkJCXhlX2Zvcl9lYWNoX2VuZ2luZShkZXZpY2UuZmRf
eGUsIGh3ZSkgew0KPiA+ICsJCQkJaWd0X2ttc2coS01TR19JTkZPICJVbmxvYWRpbmcgWGVcbiIp
Ow0KPiA+ICsJCQkJaWd0X2Fzc2VydF9lcShpZ3RfeGVfZHJpdmVyX3VubG9hZCgpLDApOw0KPiA+
ICsNCj4gPiArCQkJCWlndF9rbXNnKEtNU0dfSU5GTyAiUmUtbG9hZGluZyBYZSB3aXRob3V0DQo+
IGRpc3BsYXlcbiIpOw0KPiA+ICsNCj4gCWlndF9hc3NlcnRfZXEoaWd0X3hlX2RyaXZlcl9sb2Fk
KCJlbmFibGVfZGlzcGxheT0wIiksMCk7DQo+ID4gKw0KPiA+ICsJCQkJdGVzdF9leGVjKGRldmlj
ZSwgaHdlLCAxLCAyLCBzLT5zdGF0ZSwNCj4gPiArCQkJCQkgIE5PX1JQTSk7DQo+ID4gKwkJCX0N
Cj4gPiArCQl9DQpXZSBuZWVkIHRvIHJlbG9hZCB0aGUgZHJpdmVyIHdpdGggZGlzcGxheSBhcyBu
b3JtYWwgPw0KQW5zaHVtYW4uICANCj4gPiArDQo+ID4gICAJCWZvciAoY29uc3Qgc3RydWN0IGRf
c3RhdGUgKmQgPSBkX3N0YXRlczsgZC0+bmFtZTsgZCsrKSB7DQo+ID4gICAJCQlpZ3Rfc3VidGVz
dF9mKCIlcy0lcy1iYXNpYy1leGVjIiwgcy0+bmFtZSwgZC0+bmFtZSkNCj4gew0KPiA+ICAgCQkJ
CWlndF9hc3NlcnQoc2V0dXBfZDMoZGV2aWNlLCBkLT5zdGF0ZSkpOw0K
