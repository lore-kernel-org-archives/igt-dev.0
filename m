Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76566C47DDB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 05:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E9D10E41F;
	Thu,  1 Feb 2024 05:02:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E515110E41E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 05:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706763728; x=1738299728;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TI+UXm9+dEJB0j66AGfv6RnOqLuhOVKwscfpBdmEqcU=;
 b=C1P6v4XD8OgAw59r33iW3GbT372BsHDVBwsbsZiAbuodKTd1YCvvGvQa
 4FaJRiLmaOpL4m/mNiT3M0rDTf0PwYhlAVfg0y/i+N2+FGuOMFTGbOgVc
 S/XPbvs9bVzhZnXiZlxJLhiR+Hb3nTPjp8picXkBpvowHR7IOctrdUjja
 C+DuYY4oaWAzOgxPx3e/ZsVDX3e7OcwFhF4hp73oMl1Elt87+eHcRDBtZ
 iwMTBBGaUbDgIA3fjLa7n//gz1d6WFDssAX/5L3solKJKPpeO07hdVgV+
 PxVedk05+xjm5Fc5WoiV1T9TCqYYP2y3B9oG/GDrUQxV6hSU8Uljy7GKS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3645674"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="3645674"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 21:02:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="738321782"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="738321782"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 21:02:06 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 21:02:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 21:02:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 21:02:05 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 21:02:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpO9CMnnl3Xa29sCrD7i5sfnltgOgJ6YIktONHIooyE3FPGE1TEIR+zJl8dLh/qx+SVWXSWIsmOYDq5C3/ccW4DmCHO68USQsdB1uAyI+yUoY1OZSEYYSfyPkOjQg3FwAfy6bnKp5Q78jrq1plt6gH3Bx9b3MhmrfjHr0MgLWbnzdw66f0ylO/nLqaUrWWULnJQBruvNoCN8JYciBfT468oqL1LDW+qSx2l8mFsZ+lBygyJXB/NFpT/H9m0fNHp5W0Sq9QHN+aFPQDG/mh4UEA4+sSk9IuiuiR36p4mpQzV523uJOaGbg7pW6G22TpXQbQuizMDMuNJfKJLe3uBbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TI+UXm9+dEJB0j66AGfv6RnOqLuhOVKwscfpBdmEqcU=;
 b=OKujmEX9YEksibIBPb4GqSedpmCjPU41oeryMequd9qCqPNjruaxC4g4ChHRodt3wO/NSxShGVHre11VVMPB5FVd6fDEJn3+DLI0X5147rgeMshqcCYrTHYLCx692kT7QlmpBN6zOPKaQHcmuFy8L55dIenrXYaRrFKfzeh0zN/f6hm4HHqk2nFryG3qNCYfSb/r05HLg8bfQyjoRNqdU9sYhTFl3d2mvdJHSVfTEkiAK/Qh1CspbNUbL26K309Ttrhg7+bep+NvETdoNDinpkARPwnISmrlqQrlnGcJVssvtKRi/mnzN8JCQFlR28z5dUXSKUybhEvwIlifIP4F4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DM4PR11MB5230.namprd11.prod.outlook.com (2603:10b6:5:39a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.24; Thu, 1 Feb 2024 05:02:03 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553%5]) with mapi id 15.20.7228.029; Thu, 1 Feb 2024
 05:02:03 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t V2] lib/igt_draw: Fix the usage of FB width & height
Thread-Topic: [i-g-t V2] lib/igt_draw: Fix the usage of FB width & height
Thread-Index: AQHaU3GipXurk8LRr0WoG+5Ba75nvLDyeJfAgAAEtACAAnMukA==
Date: Thu, 1 Feb 2024 05:02:03 +0000
Message-ID: <DM4PR11MB6312AE6028E66C56B353EDCF90432@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240130113727.721365-1-bhanuprakash.modem@intel.com>
 <DM4PR11MB6312FA1F866732BC8436A42C907D2@DM4PR11MB6312.namprd11.prod.outlook.com>
 <e7e734d4-9ef0-4a44-9e01-7a8bf60c7188@intel.com>
In-Reply-To: <e7e734d4-9ef0-4a44-9e01-7a8bf60c7188@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DM4PR11MB5230:EE_
x-ms-office365-filtering-correlation-id: 2018b512-a8d7-4137-4431-08dc22e2ee10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LWKg8n0DhnIcjFWh48800C3gRaN2VKm10YO+hrN2bmeNgbugsj73rUnZLpLSIWFQSihIbiFONi+LRwsDc/SFZ/gQYvAgoF8lACKxuRO9bcTnen+4K3UzZnnBYDvAtg8RRlvII96McDUknZjHRRglehKr6qp5sMYXi+xQRCRC6awWdqLf6heQf3irT2cU5B2iA+pD9lVVIkeVYc1BbErXJs4Ago8kB+tWO65P96GrrZU+cJwtsMgw2sXeOJwVnYi7Ph9qW2pMUWsR6RDBgZVxdI0Yq46BqsX30IIf2//212aPWaL3nfC8B4QjuE5U0wInLI68IZ0eY3Le2eTAXCsSp8QmhRnW3KZ1emUzgiJOttIzaok6K9dAVKr+MCH7iH9S2Sqa9A4Yw6v77pK2dD1R0FG5LmKVfmV0OK+dptOX+7s7aBS+FQ/lK7UaU+Xa2dNhR2cHhKpXKIVGKasIpbluOh0hmKp+TI2ZV1dNq5NAyj7XFml+IgYfYjueVricKMMNt1gBBYh8jWozl5jzdx6GGOcs6rA6lLJ8Y9lUFp79TQcIKHjO+1z3MkScG2Dh4fdTp3Oh8l0Lexz3oY+AljNuOa/nvieapqHvIZ1fPhMDeB4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(83380400001)(76116006)(8676002)(26005)(9686003)(38100700002)(66574015)(122000001)(53546011)(52536014)(966005)(8936002)(5660300002)(4326008)(2906002)(66556008)(66476007)(64756008)(66446008)(478600001)(6506007)(7696005)(66946007)(316002)(71200400001)(110136005)(38070700009)(33656002)(86362001)(82960400001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEpyUGJLMEpDeGg2a2M1MHFhNmh2aFlPVFpWU0ZiYXZXMW41VXFvSkN1NVJw?=
 =?utf-8?B?ZkdNbEVEY1U3NFltcFFSZ0c4eHlqampMaHJNRFp6ajhSbUV4L0x4dy9qR3BV?=
 =?utf-8?B?Nk0xT2poWFpxQWdvNmg1RFQ3bi9GSE5BZVVrYTBpdmxDUmRvem9PTEVMb2J3?=
 =?utf-8?B?bDhKUFRyajc2VFpZZ08yNkdBazNHUFpkeFJZSU9BVVkrb1BJbzB3WWp4TGlO?=
 =?utf-8?B?VWt4cTNGSkVQWkVTblRHNVdnT0wrTXZmMGsvM0wrNy9KWnJ3R3VvWlRkQkxW?=
 =?utf-8?B?UG9aREF2UHg5Qk9RUHJucVZkNThac3loMmpvM1dDWGlnaFc5eFFlS25kL1Vt?=
 =?utf-8?B?K3E1dm1RdXh2YVpVSHJtOWFlR3VyWGtWMnk4NC96TEdWUmswcUNTK3FseVlj?=
 =?utf-8?B?U1g3M1pVZ1ZudVJVdVF1cnhsb25CS2FEVUZCOTU3cXZIcEFwU0xhS09VRWli?=
 =?utf-8?B?WVVrNmZRMENMQ0Z1Z25QY0VPc0MweXcwUUM4UG5tVER4RVpxRWZBNDdhM3hu?=
 =?utf-8?B?MVFoOVlsWENRY1NuMlByL09QaUpWdmVWc0NkclljUVJRTmN1UklxQnY4S0Nl?=
 =?utf-8?B?MGcrdklHanRDTzdvZVlCUnNDK2RwY1hNSjMzWkNLdElmOUZpdjJpSGFyaWZI?=
 =?utf-8?B?MFkyWlkwMlFRZGhTV3JyYlNOTHA3YStjZmxEaTdseGhRL2ZSU002RmtOSFhw?=
 =?utf-8?B?UVk0QTRmN2tZZzZtSFNON0NiKzBRMDdLQ21qZWFnT2c2VFMrZStoaEpDWVZt?=
 =?utf-8?B?eFdFSmtWaDNxdFFJN3ZoRXBrOVNmNEtoVmVEakV5Y0VFT21vQ1pIOVltRTNt?=
 =?utf-8?B?VlZPcnRPRUdGMk9OOHVEME5wSVF4ZUNtQ3V5clgycDZ5WnpUSXBYeDllWDFD?=
 =?utf-8?B?c0xTWW9FZ3NHUm9mUCtpVDdjZEFyVGlzU3dkZlIxYlZvMHBpQkJtTlYwcjBs?=
 =?utf-8?B?b01TVmF4WFdhL0xyengxa2Q1S3oxVFAvVXJKYlZvN0YvTUVGN2ExdEZ6RTlO?=
 =?utf-8?B?ZUFGdzVnbXBsUWtpTExocmxTUmxLRTA2WjN3T1B0eU85VU1Ua1dTWUNleGRV?=
 =?utf-8?B?d2lUT0NTeFBXeXFKNU1wRUg5VUh6WmVUWnJhQzNIRmhEbWZtSytHcmZVd1ZB?=
 =?utf-8?B?N0czSkJrL21JZWJjS1pDZjlMOFV2b2tDZTRyWUhEOXZQeHhhaUxjUWRUV29i?=
 =?utf-8?B?T2lFT0p0YWhDcXJWdDd4eDk4RDlZS2RZMUdtY0t2Q0xDK3E0RjVrOGNoSE5L?=
 =?utf-8?B?SmIwNGIyQzc4SXJNLzhUdVJhUFJKakUvMzU2dStwUkZpeDl0SmJLT0NtUTg1?=
 =?utf-8?B?TnRJTTByYVY4aVpkUlpKaFBNTDI2SDh1cXJCSk8zcmVHa1ZLbFR4NzFicjcw?=
 =?utf-8?B?U0lKUXZ3ZEdERTlnYmkzcEV5dFN6TzY4MjdaL2JkTkVyaWlGVWlZQjZLaHZu?=
 =?utf-8?B?TDQ0NHJVYVN5V21uVnVDYlZUbTBhbzlUYWVMUmpZYWtXMC94TXI2eW5Sb01O?=
 =?utf-8?B?YS9WSUtTaDhGZVMyY0Fnb2I3ZGhwM2pwMUJRODV1VWxkNEdwYXllSk5veFdX?=
 =?utf-8?B?Z1dsYk1vSTdhekpPc3E1dlk1Q1hFR3VRUFhtMzZaZUl2WmtVRVQ1N3MxZDRr?=
 =?utf-8?B?R29rVkNHZzA3YUx0MDRYMkYrZnFGNkg3c0h6dlFnWTZEOTNnVWx3ZjdUNi9R?=
 =?utf-8?B?VlZxMEpydG5XbExEa2sxbWdZVWF0aFRXR1pJbWpOMExjVlg3eXpTV2QvM1pL?=
 =?utf-8?B?QlE4K0VDRFNDeFBNOXdZZEdiaXJJN3hKZTROVnhaSVU2RGdpMDZwRWt6Y1Nn?=
 =?utf-8?B?anBPTm9qVTBpRzJOTS84andrVktBTDdOTnZWVkZMSDdPT29FYUpTNXFubmU2?=
 =?utf-8?B?UDlxb0pXTkM1RGZlMlFyQVpmanFkV1RHeVNjc0MvOFlOVXhFSEg0SFE4SThN?=
 =?utf-8?B?OXZFWCtEdVU0MU5TSTB5UjMrUDBUL2xOR2NiRkdORE1UblBRUnpYY2NQZzBz?=
 =?utf-8?B?QUtUbTZtS2M3QlF5bTYvSUJEd1hmV1NsY2VHSG1rVm5qTk40SjhyNVdWMmx5?=
 =?utf-8?B?aWxsdWhzbi84ZExIdDVJcU9nQTNqZ1RkTi85QkI0cjIyRldzWHdzLzlBSmpT?=
 =?utf-8?Q?l4RE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2018b512-a8d7-4137-4431-08dc22e2ee10
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 05:02:03.1731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eGU2xXuyj+ENsNBhEU+TivfjQG0s8Jz7lyX4mKQ9eH4AIjcPzNnpROFNGC/JnEp2tmB1dddCmKn2AC0j3hHhxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5230
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNb2RlbSwgQmhhbnVwcmFrYXNo
IDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5
IDMwLCAyMDI0IDk6MDYgUE0NCj4gVG86IEIsIEplZXZhbiA8amVldmFuLmJAaW50ZWwuY29tPjsg
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEp1aGEtUGVra2EgSGVpa2tpbGEg
PGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbaS1nLXQgVjJd
IGxpYi9pZ3RfZHJhdzogRml4IHRoZSB1c2FnZSBvZiBGQiB3aWR0aCAmIGhlaWdodA0KPiANCj4g
SGkgSmVldmFuLA0KPiANCj4gT24gMzAtMDEtMjAyNCAwODo1MSBwbSwgQiwgSmVldmFuIHdyb3Rl
Og0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBpZ3QtZGV2IDxp
Z3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gPj4g
QmhhbnVwcmFrYXNoIE1vZGVtDQo+ID4+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMzAsIDIwMjQg
NTowNyBQTQ0KPiA+PiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4gQ2M6
IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+DQo+ID4+
IFN1YmplY3Q6IFtpLWctdCBWMl0gbGliL2lndF9kcmF3OiBGaXggdGhlIHVzYWdlIG9mIEZCIHdp
ZHRoICYgaGVpZ2h0DQo+ID4+DQo+ID4+IEFsaWdpbmcgdG8geGUgZGVmYXVsdCBhbGlnbm1lbnQg
aXMgY2F1c2luZyB0aGUgbWlzbWF0Y2ggaW4gZGVyaXZlZA0KPiA+PiBoZWlnaHQgZnJvbSBmcmFt
ZWJ1ZmZlciBzaXplIChoZWlnaHQgPSBzaXplLyBzdHJpZGUpLiBJbnN0ZWFkIHVzZSB0aGUNCj4g
Pj4gb3JpZ2luYWwgd2lkdGggJiBoZWlnaHQgZnJvbSB0aGUgY3JlYXRlZCBmYi4NCj4gPj4NCj4g
Pj4gVjI6IC0gRml4IGlzc3VlcyBpbiBDSQ0KPiA+Pg0KPiA+PiBGaXhlczogaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvNjA4DQo+ID4+IENjOiBa
YmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4g
Pj4gQ2M6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+
DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEJoYW51cHJha2FzaCBNb2RlbSA8YmhhbnVwcmFrYXNoLm1v
ZGVtQGludGVsLmNvbT4NCg0KTEdUTSANCg0KUmV2aWV3ZWQtYnk6IEplZXZhbiBCIDxqZWV2YW4u
YkBpbnRlbC5jb20+DQoNCj4gPj4gLS0tDQo+ID4+ICAgbGliL2lndF9kcmF3LmMgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrLS0tDQo+ID4+ICAgbGliL2lndF9kcmF3
LmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArDQo+ID4+ICAgdGVzdHMvaW50ZWwva21z
X2JpZ19mYi5jICAgICAgICAgICAgICAgfCAgNyArKystLS0tDQo+ID4+ICAgdGVzdHMvaW50ZWwv
a21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgfCAgMSArDQo+ID4+ICAgNCBmaWxlcyBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0
IGEvbGliL2lndF9kcmF3LmMgYi9saWIvaWd0X2RyYXcuYyBpbmRleA0KPiA+PiA2MzdiOWJhNzYu
LjA3NTdlOTgwMSAxMDA2NDQNCj4gPj4gLS0tIGEvbGliL2lndF9kcmF3LmMNCj4gPj4gKysrIGIv
bGliL2lndF9kcmF3LmMNCj4gPj4gQEAgLTc1LDYgKzc1LDggQEAgc3RydWN0IGJ1Zl9kYXRhIHsN
Cj4gPj4gICAJdWludDMyX3QgaGFuZGxlOw0KPiA+PiAgIAl1aW50MzJfdCBzaXplOw0KPiA+PiAg
IAl1aW50MzJfdCBzdHJpZGU7DQo+ID4+ICsJaW50IHdpZHRoOw0KPiA+PiArCWludCBoZWlnaHQ7
DQo+ID4+ICAgCWludCBicHA7DQo+ID4+ICAgCXVpbnQ4X3QgcGF0X2luZGV4Ow0KPiA+PiAgIH07
DQo+ID4+IEBAIC02NDgsOCArNjUwLDggQEAgc3RhdGljIHN0cnVjdCBpbnRlbF9idWYgKmNyZWF0
ZV9idWYoaW50IGZkLA0KPiA+PiBzdHJ1Y3QgYnVmX29wcyAqYm9wcywNCj4gPj4gICAJdWludDY0
X3QgcmVnaW9uID0gZHJpdmVyID09IElOVEVMX0RSSVZFUl9YRSA/IHZyYW1faWZfcG9zc2libGUo
ZmQsDQo+ID4+IDApIDogLSAxOw0KPiA+PiAgIAl1aW50NjRfdCBzaXplID0gZnJvbS0+c2l6ZTsN
Cj4gPj4NCj4gPj4gLQl3aWR0aCA9IGZyb20tPnN0cmlkZSAvIChmcm9tLT5icHAgLyA4KTsNCj4g
Pj4gLQloZWlnaHQgPSBmcm9tLT5zaXplIC8gZnJvbS0+c3RyaWRlOw0KPiA+PiArCXdpZHRoID0g
ZnJvbS0+d2lkdGg7DQo+ID4+ICsJaGVpZ2h0ID0gZnJvbS0+aGVpZ2h0Ow0KPiA+PiAgIAlpZiAo
ZHJpdmVyID09IElOVEVMX0RSSVZFUl9YRSkNCj4gPj4gICAJCXNpemUgPSBBTElHTihzaXplLCB4
ZV9nZXRfZGVmYXVsdF9hbGlnbm1lbnQoZmQpKTsNCj4gPj4NCj4gPj4gQEAgLTY4Niw3ICs2ODgs
NyBAQCBzdGF0aWMgdm9pZCBkcmF3X3JlY3RfYmx0KGludCBmZCwgc3RydWN0IGNtZF9kYXRhDQo+
ID4+ICpjbWRfZGF0YSwNCj4gPj4gICAJaW50ZWxfYmJfYWRkX2ludGVsX2J1ZihpYmIsIGRzdCwg
dHJ1ZSk7DQo+ID4+DQo+ID4+ICAgCWlmIChIQVNfNFRJTEUoaW50ZWxfZ2V0X2RybV9kZXZpZChm
ZCkpKSB7DQo+ID4+IC0JCWludCBidWZfaGVpZ2h0ID0gYnVmLT5zaXplIC8gYnVmLT5zdHJpZGU7
DQo+ID4+ICsJCWludCBidWZfaGVpZ2h0ID0gYnVmLT5oZWlnaHQ7DQo+ID4+DQo+ID4+ICAgCQlz
d2l0Y2ggKGJ1Zi0+YnBwKSB7DQo+ID4+ICAgCQljYXNlIDg6DQo+ID4+IEBAIC04MDcsNiArODA5
LDggQEAgc3RhdGljIHZvaWQgZHJhd19yZWN0X3JlbmRlcihpbnQgZmQsIHN0cnVjdA0KPiA+PiBj
bWRfZGF0YSAqY21kX2RhdGEsDQo+ID4+DQo+ID4+ICAgCXRtcC5zdHJpZGUgPSByZWN0LT53ICog
cGl4ZWxfc2l6ZTsNCj4gPj4gICAJdG1wLmJwcCA9IGJ1Zi0+YnBwOw0KPiA+PiArCXRtcC53aWR0
aCA9IHJlY3QtPnc7DQo+ID4+ICsJdG1wLmhlaWdodCA9IHJlY3QtPmg7DQo+ID4NCj4gPiBJcyB0
aGlzIHJlcXVpcmVkID8gSSB0aGluayB0aGVzZSBhcmUgbm90IHJlcXVpcmVkLg0KPiA+IFBsZWFz
ZSBjb3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcuDQo+IA0KPiBUaGlzIGlzIHJlcXVpcmVkLCBvdGhl
cndpc2UgY3JlYXRlX2J1ZigpIFsqXSBtYXkgZmFpbCBkdWUgdG8gdGhlIGdhcmJhZ2UgdmFsdWVz
IG9mDQo+IHdpZHRoICYgaGVpZ2h0Lg0KPiANCj4gWypdOiBodHRwczovL2NnaXQuZnJlZWRlc2t0
b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzL3RyZWUvbGliL2lndF9kcmF3LmMjbjgxNw0KPiANCj4g
LSBCaGFudQ0KPiANCj4gPg0KPiA+PiAgIAlpZiAoaXNfaTkxNV9kZXZpY2UoZmQpKQ0KPiA+PiAg
IAkJZHJhd19yZWN0X21tYXBfY3B1KGZkLCAmdG1wLCAmKHN0cnVjdCByZWN0KXswLCAwLCByZWN0
LT53LA0KPiA+PiByZWN0LT5ofSwNCj4gPj4gICAJCQkJICAgSTkxNV9USUxJTkdfTk9ORSwNCj4g
Pj4gSTkxNV9CSVRfNl9TV0laWkxFX05PTkUsIGNvbG9yKTsgQEAgLTgzNCw2ICs4MzgsOCBAQCBz
dGF0aWMgdm9pZA0KPiA+PiBkcmF3X3JlY3RfcmVuZGVyKGludCBmZCwgc3RydWN0IGNtZF9kYXRh
ICpjbWRfZGF0YSwNCj4gPj4gICAgKiBAYnVmX2hhbmRsZTogdGhlIGhhbmRsZSBvZiB0aGUgYnVm
ZmVyIHdoZXJlIHlvdSdyZSBnb2luZyB0byBkcmF3IHRvDQo+ID4+ICAgICogQGJ1Zl9zaXplOiB0
aGUgc2l6ZSBvZiB0aGUgYnVmZmVyDQo+ID4+ICAgICogQGJ1Zl9zdHJpZGU6IHRoZSBzdHJpZGUg
b2YgdGhlIGJ1ZmZlcg0KPiA+PiArICogQGJ1Zl93aWR0aDogdGhlIHdpZHRoIG9mIHRoZSBidWZm
ZXINCj4gPj4gKyAqIEBidWZfaGVpZ2h0OiB0aGUgaGVpZ2h0IG9mIHRoZSBidWZmZXINCj4gPj4g
ICAgKiBAdGlsaW5nOiB0aGUgdGlsaW5nIG9mIHRoZSBidWZmZXINCj4gPj4gICAgKiBAbWV0aG9k
OiBtZXRob2QgeW91J3JlIGdvaW5nIHRvIHVzZSB0byB3cml0ZSB0byB0aGUgYnVmZmVyDQo+ID4+
ICAgICogQHJlY3RfeDogaG9yaXpvbnRhbCBwb3NpdGlvbiBvbiB0aGUgYnVmZmVyIHdoZXJlIHlv
dXIgcmVjdGFuZ2xlDQo+ID4+IHN0YXJ0cyBAQCAtDQo+ID4+IDg0OCw2ICs4NTQsNyBAQCBzdGF0
aWMgdm9pZCBkcmF3X3JlY3RfcmVuZGVyKGludCBmZCwgc3RydWN0IGNtZF9kYXRhDQo+ID4+ICpj
bWRfZGF0YSwNCj4gPj4gICAgKi8NCj4gPj4gICB2b2lkIGlndF9kcmF3X3JlY3QoaW50IGZkLCBz
dHJ1Y3QgYnVmX29wcyAqYm9wcywgdWludDMyX3QgY3R4LA0KPiA+PiAgIAkJICAgdWludDMyX3Qg
YnVmX2hhbmRsZSwgdWludDMyX3QgYnVmX3NpemUsIHVpbnQzMl90IGJ1Zl9zdHJpZGUsDQo+ID4+
ICsJCSAgIGludCBidWZfd2lkdGgsIGludCBidWZfaGVpZ2h0LA0KPiA+PiAgIAkJICAgdWludDMy
X3QgdGlsaW5nLCBlbnVtIGlndF9kcmF3X21ldGhvZCBtZXRob2QsDQo+ID4+ICAgCQkgICBpbnQg
cmVjdF94LCBpbnQgcmVjdF95LCBpbnQgcmVjdF93LCBpbnQgcmVjdF9oLA0KPiA+PiAgIAkJICAg
dWludDMyX3QgY29sb3IsIGludCBicHApDQo+ID4+IEBAIC04NjIsNiArODY5LDggQEAgdm9pZCBp
Z3RfZHJhd19yZWN0KGludCBmZCwgc3RydWN0IGJ1Zl9vcHMgKmJvcHMsDQo+ID4+IHVpbnQzMl90
IGN0eCwNCj4gPj4gICAJCS5oYW5kbGUgPSBidWZfaGFuZGxlLA0KPiA+PiAgIAkJLnNpemUgPSBi
dWZfc2l6ZSwNCj4gPj4gICAJCS5zdHJpZGUgPSBidWZfc3RyaWRlLA0KPiA+PiArCQkud2lkdGgg
PSBidWZfd2lkdGgsDQo+ID4+ICsJCS5oZWlnaHQgPSBidWZfaGVpZ2h0LA0KPiA+PiAgIAkJLmJw
cCA9IGJwcCwNCj4gPj4gICAJCS5wYXRfaW5kZXggPSBpbnRlbF9nZXRfcGF0X2lkeF91YyhmZCks
DQo+ID4+ICAgCX07DQo+ID4+IEBAIC05MjUsNiArOTM0LDcgQEAgdm9pZCBpZ3RfZHJhd19yZWN0
X2ZiKGludCBmZCwgc3RydWN0IGJ1Zl9vcHMgKmJvcHMsDQo+ID4+ICAgCQkgICAgICBpbnQgcmVj
dF93LCBpbnQgcmVjdF9oLCB1aW50MzJfdCBjb2xvcikgIHsNCj4gPj4gICAJaWd0X2RyYXdfcmVj
dChmZCwgYm9wcywgY3R4LCBmYi0+Z2VtX2hhbmRsZSwgZmItPnNpemUsDQo+ID4+IGZiLT5zdHJp
ZGVzWzBdLA0KPiA+PiArCQkgICAgICBmYi0+d2lkdGgsIGZiLT5oZWlnaHQsDQo+ID4+ICAgCQkg
ICAgICBpZ3RfZmJfbW9kX3RvX3RpbGluZyhmYi0+bW9kaWZpZXIpLCBtZXRob2QsDQo+ID4+ICAg
CQkgICAgICByZWN0X3gsIHJlY3RfeSwgcmVjdF93LCByZWN0X2gsIGNvbG9yLA0KPiA+PiAgIAkJ
ICAgICAgaWd0X2RybV9mb3JtYXRfdG9fYnBwKGZiLT5kcm1fZm9ybWF0KSk7DQo+ID4+IGRpZmYg
LS1naXQgYS9saWIvaWd0X2RyYXcuaCBiL2xpYi9pZ3RfZHJhdy5oIGluZGV4DQo+ID4+IGZlNzUz
MWI3OS4uMWRlYzk1ZTg2IDEwMDY0NA0KPiA+PiAtLS0gYS9saWIvaWd0X2RyYXcuaA0KPiA+PiAr
KysgYi9saWIvaWd0X2RyYXcuaA0KPiA+PiBAQCAtNTQsNiArNTQsNyBAQCBib29sIGlndF9kcmF3
X3N1cHBvcnRzX21ldGhvZChpbnQgZmQsIGVudW0NCj4gPj4gaWd0X2RyYXdfbWV0aG9kIG1ldGhv
ZCk7DQo+ID4+DQo+ID4+ICAgdm9pZCBpZ3RfZHJhd19yZWN0KGludCBmZCwgc3RydWN0IGJ1Zl9v
cHMgKmJvcHMsIHVpbnQzMl90IGN0eCwNCj4gPj4gICAJCSAgIHVpbnQzMl90IGJ1Zl9oYW5kbGUs
IHVpbnQzMl90IGJ1Zl9zaXplLCB1aW50MzJfdCBidWZfc3RyaWRlLA0KPiA+PiArCQkgICBpbnQg
YnVmX3dpZHRoLCBpbnQgYnVmX2hlaWdodCwNCj4gPj4gICAJCSAgIHVpbnQzMl90IHRpbGluZywg
ZW51bSBpZ3RfZHJhd19tZXRob2QgbWV0aG9kLA0KPiA+PiAgIAkJICAgaW50IHJlY3RfeCwgaW50
IHJlY3RfeSwgaW50IHJlY3RfdywgaW50IHJlY3RfaCwNCj4gPj4gICAJCSAgIHVpbnQzMl90IGNv
bG9yLCBpbnQgYnBwKTsNCj4gPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19iaWdfZmIu
YyBiL3Rlc3RzL2ludGVsL2ttc19iaWdfZmIuYw0KPiA+PiBpbmRleCAzZWI0MzUxNWEuLjBiZDc5
Mzk0YiAxMDA2NDQNCj4gPj4gLS0tIGEvdGVzdHMvaW50ZWwva21zX2JpZ19mYi5jDQo+ID4+ICsr
KyBiL3Rlc3RzL2ludGVsL2ttc19iaWdfZmIuYw0KPiA+PiBAQCAtMTg5LDE4ICsxODksMTcgQEAg
c3RhdGljIHN0cnVjdCBpbnRlbF9idWYgKmluaXRfYnVmKGRhdGFfdCAqZGF0YSwgIHsNCj4gPj4g
ICAJc3RydWN0IGludGVsX2J1ZiAqYnVmOw0KPiA+PiAgIAllbnVtIGludGVsX2RyaXZlciBkcml2
ZXIgPSBidWZfb3BzX2dldF9kcml2ZXIoZGF0YS0+Ym9wcyk7DQo+ID4+IC0JdWludDMyX3QgbmFt
ZSwgaGFuZGxlLCB0aWxpbmcsIHN0cmlkZSwgd2lkdGgsIGhlaWdodCwgYnBwLCBzaXplOw0KPiA+
PiArCXVpbnQzMl90IG5hbWUsIGhhbmRsZSwgdGlsaW5nLCB3aWR0aCwgaGVpZ2h0LCBicHAsIHNp
emU7DQo+ID4+ICAgCXVpbnQ2NF90IHJlZ2lvbiA9IGRyaXZlciA9PSBJTlRFTF9EUklWRVJfWEUg
Pw0KPiA+PiAgIAkJCQl2cmFtX2lmX3Bvc3NpYmxlKGRhdGEtPmRybV9mZCwgMCkgOiAtMTsNCj4g
Pj4NCj4gPj4gICAJaWd0X2Fzc2VydF9lcShmYi0+b2Zmc2V0c1swXSwgMCk7DQo+ID4+DQo+ID4+
ICAgCXRpbGluZyA9IGlndF9mYl9tb2RfdG9fdGlsaW5nKGZiLT5tb2RpZmllcik7DQo+ID4+IC0J
c3RyaWRlID0gZmItPnN0cmlkZXNbMF07DQo+ID4+ICAgCWJwcCA9IGZiLT5wbGFuZV9icHBbMF07
DQo+ID4+ICAgCXNpemUgPSBmYi0+c2l6ZTsNCj4gPj4gLQl3aWR0aCA9IHN0cmlkZSAvIChicHAg
LyA4KTsNCj4gPj4gLQloZWlnaHQgPSBzaXplIC8gc3RyaWRlOw0KPiA+PiArCXdpZHRoID0gZmIt
PndpZHRoOw0KPiA+PiArCWhlaWdodCA9IGZiLT5oZWlnaHQ7DQo+ID4+DQo+ID4+ICAgCW5hbWUg
PSBnZW1fZmxpbmsoZGF0YS0+ZHJtX2ZkLCBmYi0+Z2VtX2hhbmRsZSk7DQo+ID4+ICAgCWhhbmRs
ZSA9IGdlbV9vcGVuKGRhdGEtPmRybV9mZCwgbmFtZSk7IGRpZmYgLS1naXQNCj4gPj4gYS90ZXN0
cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiA+PiBiL3Rlc3RzL2ludGVsL2tt
c19mcm9udGJ1ZmZlcl90cmFja2luZy5jDQo+ID4+IGluZGV4IDJhMjY5MGQxOC4uOTEyY2NhM2Y4
IDEwMDY0NA0KPiA+PiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcu
Yw0KPiA+PiArKysgYi90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiA+
PiBAQCAtMjI0Miw2ICsyMjQyLDcgQEAgc3RhdGljIHZvaWQgKmJ1c3lfdGhyZWFkX2Z1bmModm9p
ZCAqZGF0YSkNCj4gPj4gICAJd2hpbGUgKCFidXN5X3RocmVhZC5zdG9wKQ0KPiA+PiAgIAkJaWd0
X2RyYXdfcmVjdChkcm0uZmQsIGRybS5ib3BzLCAwLCBidXN5X3RocmVhZC5oYW5kbGUsDQo+ID4+
ICAgCQkJICAgICAgYnVzeV90aHJlYWQuc2l6ZSwgYnVzeV90aHJlYWQuc3RyaWRlLA0KPiA+PiAr
CQkJICAgICAgYnVzeV90aHJlYWQud2lkdGgsIGJ1c3lfdGhyZWFkLmhlaWdodCwNCj4gPj4gICAJ
CQkgICAgICBidXN5X3RocmVhZC50aWxpbmcsIElHVF9EUkFXX0JMVCwgMCwgMCwNCj4gPj4gICAJ
CQkgICAgICBidXN5X3RocmVhZC53aWR0aCwgYnVzeV90aHJlYWQuaGVpZ2h0LA0KPiA+PiAgIAkJ
CSAgICAgIGJ1c3lfdGhyZWFkLmNvbG9yLCBidXN5X3RocmVhZC5icHApOw0KPiA+PiAtLQ0KPiA+
PiAyLjQzLjANCj4gPg0K
