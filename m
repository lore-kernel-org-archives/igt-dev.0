Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3DBC48260
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 09:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B837310E02B;
	Thu, 25 Jan 2024 09:58:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED95510E02B
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706176706; x=1737712706;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ut0jrVZm8lrXA8uFVNMs+2YXfxqv+pnY74bEEKFEBjw=;
 b=JzgwUAI1kWKx5z8XKOmP1hbgSs5FqCmj9pj7yOLMeaIuKBuITguTESqk
 5KW/Qxq32rA2IeQ6xOlNbexahZv2x6zSi2SaBMgzIX4OL5GVEE10+OTPL
 HtYSfeM2ZR2m6ubBlmPckjb/klY10gZgk79IWha6s3TNr31x4jfIWhEIL
 Lr5A1jvrKB6Rwe0u6YJ1zMBel6iXAbLG05Sdv/sVib9kceQasFri2Bw2w
 b+10y6fTWpgo76AkQmQIJbwAC4fRgCXDKEJ/8Oh4jWSJ92K1r1lb4rgnd
 O6HKyrA1qV+3ByCFlJDhDnFVIGvmgsV9xp3TCfDHnJiV7qe9etAxOxm1U A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15650737"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15650737"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 01:58:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1117901495"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="1117901495"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 01:58:25 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 01:58:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 01:58:24 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 01:58:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cd2Sua7wyujx1wmSWWYxyOmjmB/BAKD6aSLllmFEpXzsjAGNZdvkxvju4+WiN+XUv1OHKIlE3XcJJb12oaG5gln2k8pE3ftncF9UyxQG+9gB7knS2ennZBvFJv0QMelmISPqZx6d4KOHK+OJsleK+qQZeRoil43geHMN6K/BKRw5EmKVbk3uwj0QpzqUpXpGgofTkQ6uBwCtJiD5/Cp5vzdqWlG4zXYc0qUsoF281Bvz063Rp8VW6JeU9JBAmutMoa1V2181ecEMi5ciLi+y0NxECv+EblmL4mjEFL6Kd9oyACUHRNL7xFnh33FTrLJlUuMBUvlek29bT3h4h6wlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut0jrVZm8lrXA8uFVNMs+2YXfxqv+pnY74bEEKFEBjw=;
 b=h20OrYZA4EIQiiL8LwGdmjP92eo0LHORX3+8pnpf9qdyayUEyqDLMoxIcZmq64y4/kDxuzUbWnbzfUTKujzM1ydq0JGChRyYav8hHlqeH9kZ214+hCATLNE4UEP8Y/sC0e27mwquWMJ5Q5/qPQVx+HCp/0aiyQF1nd86agiCmn0xPqO9O713D+PXUWJYyyTHOdYH/8Qsk0H2UqL4b+0q2BX+LakX+IVPBZKXpK2lXiGqLMXiGi4AHjkrM+xIlMWh92ZHktYK2o9ZSOmKXqd4LYUNURGUmcERQM68kmyR3ww8enGzFpAF6zmHDdF+qxBKUQIDTcIWS4yiw6XnuVfptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DS0PR11MB6495.namprd11.prod.outlook.com (2603:10b6:8:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Thu, 25 Jan
 2024 09:58:21 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::530a:5735:154:362]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::530a:5735:154:362%5]) with mapi id 15.20.7202.035; Thu, 25 Jan 2024
 09:58:21 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/kms_vrr: Reset to High refresh rate before
 begin drrs test
Thread-Topic: [PATCH i-g-t] tests/kms_vrr: Reset to High refresh rate before
 begin drrs test
Thread-Index: AQHaT3NgXfyGahz9AUWok4DG3qPhN7DqSrKAgAAAUsA=
Date: Thu, 25 Jan 2024 09:58:21 +0000
Message-ID: <PH7PR11MB8252AD88C8F4370DE9C409D2897A2@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <0240125055825.8915-1-vidya.srinivas@intel.com>
 <20240125092957.9518-1-vidya.srinivas@intel.com>
 <694e0799-b7f6-4f9a-9410-ce577e49374b@intel.com>
In-Reply-To: <694e0799-b7f6-4f9a-9410-ce577e49374b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|DS0PR11MB6495:EE_
x-ms-office365-filtering-correlation-id: fd7d84cb-b802-4b2e-4e74-08dc1d8c29c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oiWX357VBH1fR6WAtBcvG8vZuMA+q9EasJMrViffpfGy0L+PVoAp+mPiFIyIHfqtJDVy6oSs7E/Od5P1g838k7lJxnVGCADSGnErCFEh9mSqk1tSiYHcd7vWEVOqbhQs47OWxWIdl0oOQpjjPkUxwsV+sRUb9H7LO61M5S5NT1RxW/t179qWw0CMmQZNBVEKVxAxfpmL8TWRD5yz4b2aSQuHA/KvfZkH1L+kWmo1Kjw2M4vaUghE/MEe76xxXLuMUFrgx5+BDkK4pTgtXtyT0LdHBsglHyjhoIaE7Dx+zMPsE2HkuPhWCWxu8Hg3bEkAFnc7ABqv4TWliw5tDiJQUhNPycVg+fjAg3J4rngzkWbWZdakpmZeUqa8roakg3UQ4oZLXdP5idlOlIyhoVMjD9XhCT7BYmLT0+UmshnKREWcC2A67MuZxorxApMl2OJ+5guM47esUo6FvD4T5jXY/ME/tp+x0mgeNLxUQccvpjkfW0DxSG4JT8jbiMi2nkzZf+EPQmiDzbOEIpyVRUn1/gWNPUkEyHjReb1TuldK3lJFBSd7GYrXRtQBgJV+YNu9Diz/GrO1AxigCf8i/YShFlHa+wMhU+qVdFBazJy/D6STl5/aPn3ddPqLC6xAZ+Ra
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(376002)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6506007)(7696005)(53546011)(71200400001)(9686003)(83380400001)(66476007)(2906002)(478600001)(52536014)(5660300002)(66556008)(66446008)(110136005)(66946007)(8936002)(64756008)(316002)(76116006)(8676002)(82960400001)(122000001)(86362001)(33656002)(41300700001)(38070700009)(38100700002)(26005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2w0WGtCTmExekdNZlRXMUNodDZrL0NTQUIwdEVnS3cwNTRjM2lEbmdGRU9S?=
 =?utf-8?B?a3BvK3JPbGlJUnpkN2Y1WFBhRnZoenhROHRMbDNjSG1FcFpxdDFzWHlMRUZL?=
 =?utf-8?B?Tzkvc3BudFZCQWxqUkR5OHN2SlMvK0ZkMEZHanp1ZmtROEVVaVhqRzF3MHJW?=
 =?utf-8?B?b2Q3ZnRoWUdFRDhPL0M5dEVKTWE3bGdaZXIzRjVwZDVqRmVEUTZNck4xUWph?=
 =?utf-8?B?T3ozQXcrVVIzTWVIZEszc3JteHFNa051M0lHN0pyMnB5SHJVS2RYKzNqL1NK?=
 =?utf-8?B?RUQ2d2hMTmU4K1RKaUV5TEN3VHdkTzUyb2Ywb3JFTUdlaGJyNys0NFdhMW1T?=
 =?utf-8?B?MSs4bzlIOUhTbHJUb2htQzdMWGZLTktCaWhVb2h1cy94SVhWUHp1ZWh1a2Vk?=
 =?utf-8?B?QzlVNC9kYXJzN2VvRVV0L2Rqa0diQU9QLzV2empOdWhGMnJHTnIydk1Dejlw?=
 =?utf-8?B?NGZFRmRVWG9LcWdwMFlmSXFtNmRjWTl5WWlhQjBiQUJmckFnRjVseUZtQVRv?=
 =?utf-8?B?QVgxVll0RVFCZmZ3VERxc09aTUE0blNDZUN2cWFzb0FLakJqczUwZmxvVC9j?=
 =?utf-8?B?a2NDZnBITVhqWjhQMWQ2L3hDVXRadWdhZXpLMXU0WHB6a0YzREZxa3JMOXBm?=
 =?utf-8?B?V0t5SlUrTUYwTXBxdzdTYzZyYk1GTGVWc095bFNhV2dkN2dPYUduQlJ3bUph?=
 =?utf-8?B?SXlVSmh1ekJYN0VzWVN6MlNuektLVExnWVNjK1czbVRNVTNzamVSblJtdEdR?=
 =?utf-8?B?R1J5TE5xR20zWGQyR3crRUpjNkY4OW1VMXVJNFpKWFRlNTd5QXRJbG05VFBw?=
 =?utf-8?B?OXpIUVJTdUxSaStaMzJzWkJlVXpoOVlKRGFka2Q5Rk9NWVA4NmFWR3hqQ29Q?=
 =?utf-8?B?NWRRSWhRS0NLbEZ1eW0wTWExTzlBaXlTMmorUFdGQ0ZOaFlBcWRZRFMxM05v?=
 =?utf-8?B?U2ZvZjQ4M1NPUXFaZjh1S1laM1FZZEZKVHZYbHNvMjdsK0JVa1h4MUIxSDRn?=
 =?utf-8?B?WHRybXJrMmRmR3FlQnppQWhKUnlPeTA1ZlkrZmI2NGh4T1FkRExyMDAreXRM?=
 =?utf-8?B?c1JoZkJVM2tVTlVtbFZzU2JidFBZdU9aL3JXRGRCNHMxZWIybVVKY0VqZHZr?=
 =?utf-8?B?UE5XYUV6VnE2MXEwMkRMS09lbThLUG1oZlFzT2NNSmhPa1NVQXBZZ1UyRjJy?=
 =?utf-8?B?WmpRWlEyWTJ6Z2ZncWlLWm1XSG82aE1FK253ZGhRbG5uSzNpRWdFZEV2Lzlt?=
 =?utf-8?B?VG80dklnRGRFR0RFV2JEdFlzUW5RTWFkaFdSTVphQmozbWZ0YWoxajlWbnA1?=
 =?utf-8?B?bW1jTVV6OHNTVnhJd0JPbG0xbXFTK0MxRTJ4d1MwWWVqaWxWMUIwdjRORm9u?=
 =?utf-8?B?dDFuTmhFSkdDeTF4VUVSY1ZFZ1ZvUjNKbUdVcTViWmVNZ1pRM2hwUGFSd2p0?=
 =?utf-8?B?VmpyQ3Izbys0WnE4NWNOdE9hRHkvNXRvaDVQdzVEWkNFM3dPMWl0aVI5bU9S?=
 =?utf-8?B?eVpXZGdTYkhOeDJPYkpIcytFUStxR2oxTHA1eG9LaC9qcm56bzlBWG5yWjds?=
 =?utf-8?B?b2dxNm16MDFZblovY0cvV2RVZXVnYW5zZXZvNmo3bllMVVZoWXpjc2ZETW5C?=
 =?utf-8?B?eFYyZUllT2pXYXd5dUlhNDh0Ylg0T09JcFduVkxPMWhDaDVZRUlRa1p2bkJJ?=
 =?utf-8?B?dFFrQjFDY3BoekVsUGxTTk1KdGpzK2lWN0lzV0ZUM05qMmZ6aVZGdjNVR3Iz?=
 =?utf-8?B?NUlZN1NEbDV5STZJZjdoOWhic1R5ZVd5RXh5KzdIb3RMMmFuNDlza3dCYmI0?=
 =?utf-8?B?SUxsUVY3azhNSGN1UllISVZjZUJ6aWhWdkUyZG5mMFRVTmJKcUEyYm1leWxE?=
 =?utf-8?B?S0FsbTdubm5sOEJibXBsUjk4bEZDejJtN0VLSWF0emg2MHk5V1FmdzZqcnR3?=
 =?utf-8?B?UEVlV254Q21raWF6WU4rYlhtQVBXcEFuQVhTM0FwZGRpRE1DeWZkL01UNW9n?=
 =?utf-8?B?UGtmSGpidnpCRlZRK01kRm1wcDE3QkdSb21jVXhHZlpHamxKQjlTSFJmUVRP?=
 =?utf-8?B?bzdYbGRRTHdHdkhnYXBDcDQzdGZ6VDF3UXJkYkZ3MlhSV3EwbkNZVURUT2M4?=
 =?utf-8?Q?L9fELIP8dg5ZXnhOVo5NXc0RS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7d84cb-b802-4b2e-4e74-08dc1d8c29c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 09:58:21.2673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c8PopC850NSwlRourb9+JV6O50UY+XajgTRgLEcGdpJ5vSt2VxqwseN5GFGsZtZ29/CgDwomIedmTza3nO2gz3u4bZgZzhi9yMdegW9V2zA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6495
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTW9kZW0sIEJoYW51cHJh
a2FzaCA8YmhhbnVwcmFrYXNoLm1vZGVtQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEph
bnVhcnkgMjUsIDIwMjQgMzoyNyBQTQ0KPiBUbzogU3Jpbml2YXMsIFZpZHlhIDx2aWR5YS5zcmlu
aXZhc0BpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIGktZy10XSB0ZXN0cy9rbXNfdnJyOiBSZXNldCB0byBIaWdoIHJlZnJlc2gg
cmF0ZSBiZWZvcmUNCj4gYmVnaW4gZHJycyB0ZXN0DQo+IA0KPiBIaSBWaWR5YSwNCj4gDQo+IE9u
IDI1LTAxLTIwMjQgMDI6NTkgcG0sIFZpZHlhIFNyaW5pdmFzIHdyb3RlOg0KPiA+IFNpbmsgd2l0
aCBEUlJTIGFuZCBWUlIgY2FuIGJlIGluIGRvd25jbG9jayBtb2RlLCBzbyBzd2l0Y2ggdG8gSGln
aA0KPiA+IGNsb2NrIG1vZGUgYXMgdGVzdCBwcmVwYXJhdGlvbi4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFZpZHlhIFNyaW5pdmFzIDx2aWR5YS5zcmluaXZhc0BpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gICB0ZXN0cy9rbXNfdnJyLmMgfCA4ICsrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Zyci5j
IGIvdGVzdHMva21zX3Zyci5jIGluZGV4DQo+ID4gNDRiYzM0ODBkLi42OTc2OTdiNGUgMTAwNjQ0
DQo+ID4gLS0tIGEvdGVzdHMva21zX3Zyci5jDQo+ID4gKysrIGIvdGVzdHMva21zX3Zyci5jDQo+
ID4gQEAgLTUyMiw2ICs1MjIsMTQgQEAgdGVzdF9zZWFtbGVzc19ycl9iYXNpYyhkYXRhX3QgKmRh
dGEsIGVudW0gcGlwZQ0KPiA+IHBpcGUsIGlndF9vdXRwdXRfdCAqb3V0cHV0LCB1aW50Mw0KPiA+
DQo+ID4gICAJaWYgKHZycikNCj4gPiAgIAkJc2V0X3Zycl9vbl9waXBlKGRhdGEsIHBpcGUsIGZh
bHNlLCB0cnVlKTsNCj4gPiArCWVsc2Ugew0KPiA+ICsJCS8qDQo+ID4gKwkJIFNpbmsgd2l0aCBE
UlJTIGFuZCBWUlIgY2FuIGJlIGluIGRvd25jbG9jayBtb2RlLg0KPiA+ICsJCSBzbyBzd2l0Y2gg
dG8gSGlnaCBjbG9jayBtb2RlIGFzIHRlc3QgcHJlcGFyYXRpb24NCj4gDQo+IFBsZWFzZSB1c2Ug
cHJvcGVyIGNvbW1lbnRpbmcgc3R5bGU6DQo+IA0KPiBFeGFtcGxlOg0KPiAvKiBUaGlzIGlzIHNp
bmdsZSBsaW5lIGNvbW1lbnQuICovDQo+IA0KPiAvKg0KPiAgICogVGhpcyBpcyBtdWx0aWxpbmUN
Cj4gICAqIGNvbW1lbnQuDQo+ICAgKi8NCj4gDQo+IE5vIG5lZWQgdG8gZmxvYXQgdGhlIG5ldyBy
ZXYsIHBsZWFzZSBmaXggdGhpcyB3aGlsZSBtZXJnaW5nIHRoZSBwYXRjaC4NCj4gDQpIZWxsbyBC
aGFudSwgYXBvbG9naWVzIGZvciBub3Qgbm90aWNpbmcgdGhhdC4gVGhhbmsgeW91Lg0KDQpSZWdh
cmRzDQpWaWR5YQ0KPiBSZXZpZXdlZC1ieTogQmhhbnVwcmFrYXNoIE1vZGVtIDxiaGFudXByYWth
c2gubW9kZW1AaW50ZWwuY29tPg0KPiANCj4gLSBCaGFudQ0KPiANCj4gPiArCQkqLw0KPiA+ICsJ
CWlndF9vdXRwdXRfb3ZlcnJpZGVfbW9kZShvdXRwdXQsICZkYXRhLQ0KPiA+c3dpdGNoX21vZGVz
W0hJR0hfUlJfTU9ERV0pOw0KPiA+ICsJCWlndF9hc3NlcnQoaWd0X2Rpc3BsYXlfdHJ5X2NvbW1p
dF9hdG9taWMoJmRhdGEtPmRpc3BsYXksDQo+IERSTV9NT0RFX1BBR0VfRkxJUF9FVkVOVCwgTlVM
TCkgPT0gMCk7DQo+ID4gKwl9DQo+ID4NCj4gPiAgIAlyYXRlID0gdnRlc3RfbnMubWF4Ow0KPiA+
ICAgCXJlc3VsdCA9IGZsaXBfYW5kX21lYXN1cmUoZGF0YSwgb3V0cHV0LCBwaXBlLCByYXRlLA0K
PiA+IFRFU1RfRFVSQVRJT05fTlMpOw0K
