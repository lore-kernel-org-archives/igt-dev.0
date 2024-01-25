Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581FFC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 14:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E176210E24A;
	Thu, 25 Jan 2024 14:09:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E794610E24A
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 14:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706191747; x=1737727747;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Q+1cwI+Cyr63klwyNdgWFLqUAB7c0GlSK8T4V20TihA=;
 b=X71uDszDTxCDjfOTbMtfLumKwbQVJ8jBEUy8Suiye8M/cK5oq5KwIKft
 E/+yMRt4EflPrWQdL5MxWdPqGCRo5VCgUoqAGC8awurb0FG3TK7+lPOYc
 cNhyOn3iRO1+Jmf4V7mX0QNAfBPvFD8w+27Fjyh+U73+79vb+G/NxQRWl
 oUqeBAHXWhAVQUxXW7eDZDtvG1cvdu5sCUV+/1vCuPKQGa0hRWSFSlR8n
 LGL4dIz0nTc0+eKDpH4uz/wp7PzSsJ59n8Vw8DIwAvtJ5bqaSXNyYgW8V
 OBYA1sXon5R0lroomQqTEv3KWK01e8uifn5wrAT+8NvITHYi6TYm5m2TB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="392575978"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="392575978"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 06:05:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="857069597"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="857069597"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 06:05:52 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 06:05:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 06:05:52 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 06:05:52 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 06:05:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikIprp6isahSBh85yWFVKNbyUTfML/CoFKXzG6b2tiqaPtp53bV96RgZnTefVpbFi2UfJAH4F7qG5WOFbGleQrADgI2Hw6bd36VnDl1NIzxyuks4JrWxtHxip2nyV3SfjsuyyOilSLBdhcbF2e5m7rPClmICQjTiQeMvbyp8ylGhT1OwYLuZdyoZg0GQs296HLl/Ppn3SVDENo8qSgGOdybIOhAPWHa7/DVxLDIFdeT/UJ/tUt8L871w4oaKuivJ9MbehQtxv1Sknj4qhsKr8Ipr6LejpvlfvnDoAdP3mOPx7V8vLjDfkLETHdi7IGxzTKw5msuJJrSWSr1fK9tcdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+1cwI+Cyr63klwyNdgWFLqUAB7c0GlSK8T4V20TihA=;
 b=l9b8w0jlsAj9a06QocOM7rVh2u+YpgvK+FzmZ+CYZlUBfu4j9AfGiJecQw/SmwL9dVKzpfMq4PjyKJ7BQlC7gV0aUnIRMWWNzMo8REBfszbsXKSvYbj4f57DUqf3UI0ab1uEg7aO/QCFOfHOyIoowNwm2cOCXCALrz/FpKP6NMN2CV6EfCp4eBkbuFnlJ3ZiKeTkEkV8flR4c+sdU+Pz3KYVt6QLI/iesUZfFRc0vy2DxVBaxZT+4fkE0isOSHh93jZnPxMgH3+B0++OxXRspl6CDiEPgtq0YnwMoTEyS6LyoWPXfEY8v4GCYvoGO1GIxDNe7ESgsDY3ZXd3yfwZOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 CH0PR11MB8235.namprd11.prod.outlook.com (2603:10b6:610:187::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 14:05:50 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120%7]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 14:05:50 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 7/8] tests/intel/xe_exec_basic: add multigpu
 subtests
Thread-Topic: [PATCH i-g-t v2 7/8] tests/intel/xe_exec_basic: add multigpu
 subtests
Thread-Index: AQHaTwXg85wbugtFvE+n6onNFvm+yLDqJ87AgABjW4CAAATZIA==
Date: Thu, 25 Jan 2024 14:05:50 +0000
Message-ID: <DS0PR11MB7264760DF1609A487245C762D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240124204134.71451-1-kamil.konieczny@linux.intel.com>
 <20240124204134.71451-8-kamil.konieczny@linux.intel.com>
 <DS0PR11MB7264D6CB83ED0B4ACD836998D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
 <20240125134423.v4hshoo4rtbh4zvk@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240125134423.v4hshoo4rtbh4zvk@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|CH0PR11MB8235:EE_
x-ms-office365-filtering-correlation-id: 2ae07ef3-28e0-48f9-c180-08dc1daebc91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C8rOYj8J4Fstc9OyPj1Nvc3nQoGf8PNN200mVUugudT2K1R8F/hzUqxsJeP+RACBfnGCXcHc98EC4/xBvXyv9aNQQYKKC4fXqCzjHJ2LtZNlRfWj4lcebMXzc29aSf1FHrdK9SKJEoL3BAloJ88Yxhn8lNgXnCq5RYP0PKHnwvilI1dg+0B0jxcZBJvRy+csO7K94A3SG3ugQ8gq8qFJ1S87Tx4Qy5QcMBW4k9Pt8UDhWcO3MCkfJBn/BuiIEkOVlhaqZvWDWiV3YSpKJPLOVRPHt1t9c6Pe+eWql0bOPHJ1hJtT5IixR4IeJDNShrnindgd7MA3tRxKAP+Ge8wRHlAIRjfivYtp+BYiE/IIAdV9VbGp6H0xRgwpXG6EgawXijxsDEenrMUVVrAY3NCMzPsem8Ef1Iv4JspbFk5t+eQ4ifxA4k8XeuSrH3uTEj832ffDE6JHjD+R8U9tN5SNrSVQ6VTf2T9AFCVzi+H60I409QU678QDormuRPbX6cQIAPdl9x7MJUiJPPfOf6ZTEf4taNJnZw7F9kEJK3ZOngGdwVJIa7AgJDPRodrMDvKLiTQRTZhzIHMRwmlogu78IbJoP/W2ZFcSbz3hNTf5k/70t9m1OjcrIVghw33rqffM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(376002)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(5660300002)(52536014)(8676002)(55016003)(122000001)(82960400001)(83380400001)(9686003)(41300700001)(66446008)(110136005)(86362001)(76116006)(38070700009)(26005)(478600001)(8936002)(316002)(66556008)(53546011)(66946007)(66476007)(71200400001)(33656002)(64756008)(2906002)(6506007)(7696005)(38100700002)(66574015);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTlqaUFVbWZBNEluckx3aFdpdW1reTVaSmxmSWdDZkRLUDYvSUNoL3g4a0J0?=
 =?utf-8?B?dHhmZjRZM1pPRitlMUYyYmRSR0JIdnhEUHZMM2d6cjQyVzRzcVhpVVpINGcv?=
 =?utf-8?B?QnNPMnlBdEg4MUoxakNrMU4yeUNjS0ppR0NiRllGMUhJN2g1dzM4QjViUjlZ?=
 =?utf-8?B?dklFQytEK1dNMEw4enFmeisvSk4za1BaV2N5N3ROdGlscFVZRlZMYmMydDI1?=
 =?utf-8?B?VTJsY091ZEtWRk9RankwcmZ4NEFrMEpSc2RaV3hBU1E2Sk0rYk8vc2MzQVV4?=
 =?utf-8?B?ZzBPWlhWdEtYc2trZVFYMFJMdVB0ZGM1RFlzOEp3WnJiYkE4MVN1Wjd2T1dX?=
 =?utf-8?B?QnZiZUZDNDJ4TDVUZWhUSnN0R3o2bG9ISFdFeERCT3JEZGNLNHNCcFhrOGRs?=
 =?utf-8?B?RVJoS0l6NGVQVVk5SjdoOFpVc1dSaUwxbFkzWkV3WTJRVC9SNDZwUEFWREJC?=
 =?utf-8?B?SDVBVGNnREROL3k4ZTc3NVpoQlR4VDRDcFJabTg1Y0NlRXdjNzF6My9VUmdU?=
 =?utf-8?B?cktDUjVmSHVFZGZKbmRxd0hrTmcxWGNHWkpNNk9STzM1YThWTTQxRGVMOVRF?=
 =?utf-8?B?ZGVod0VUakZxZThwTUcreUE4YTl2d0dIVU5NU1F6V2xZa3dvQ1FyS0VWYjV3?=
 =?utf-8?B?dnczdHNxWEhueHBFV3BxSTM2NlVnbE1FbCt5OWFXdStpek1rbkkrQXB0ZUpk?=
 =?utf-8?B?aFl3UVZuU2VqRWdTemExVGIxOHFZWXBFVE5rODRtUWNRNmg0MStWTldZNzV1?=
 =?utf-8?B?cGs3ZWdLWEZtWTJoTlhDRDhmK25UNEJ0L0JOVUtwVE8zTVExVU5NMXF6ZkYx?=
 =?utf-8?B?MkJLVkIxVXZjZ1VpVkhMS1ZwK010MVRZTitlQUlSVVZSa3JJWVhwZk5zVGRW?=
 =?utf-8?B?YjBmeGZmcDBuem9vTTJndFpFbUJILzB0bStkbEFqOUlEY2hyQ0RlcDVWWWdR?=
 =?utf-8?B?M3dyVGhqMk1WNjd0QnNBamFnSUR0aXZrUlBnc2FnWEpTM2NSdHMya3dyV2hq?=
 =?utf-8?B?RGdlQmdGRnVPQUUxRHhOQ2M1ODd0S2wrMDg5aEVvK0lVSW5EeTBrUVpLQkUy?=
 =?utf-8?B?T3NBYzBTd3RFeFRtcm5RSThKelZURW1vN0cwcjFkdVc2ekxGUUdYKzRjRTFI?=
 =?utf-8?B?REl5QWFpdjRsYmZVQ0lTdWM5NFJVMlNVYnUrZVUzNW4yOXpWNlZ0OWYzbVhN?=
 =?utf-8?B?WENoZ203MUNoemtGY2RJd09PYVd1SFVtZDRuWnd5UllMcmdjd1l4c2FQNURQ?=
 =?utf-8?B?SVZDWGJoNnpUY1AzUWJBdnd0Q2NHZ3c1OHdZWlR1MFRZMFhFakRoaUZIMzlO?=
 =?utf-8?B?YVkyOXE5c1VldjYzc01KMng3RW1iTFNmdW9KamxZZ1J1cmNGVzcweWd2b2R4?=
 =?utf-8?B?WGhCRStOMjFsYzNiY24zRE1xUzlUMmk2SkM1Q1ZTMkZlQTBHVmdxRWZkQmF4?=
 =?utf-8?B?S3hISm0yMTgwVjV3bFp3K1hSOEdDNmJjYmd0Z0NPeFpVVTVoQUozckhJbUIw?=
 =?utf-8?B?UFBuY0pMN3M0d3hVSlFobnRFU3pTcW53QXpNMWxqS2NjNkE2dTZSejBGd3pu?=
 =?utf-8?B?dnIvUmVlRm5HMUc2bkUvOHFaTnoxNGdyTmNFZlNDQzVDMGUxUXRIMEJNbisr?=
 =?utf-8?B?Wkt5SFZMV0Q1TzU1MzRJOW9BdmNvYXpTLzBJTDdYdzArNlVEZ283KzJOZUpa?=
 =?utf-8?B?QmE1UjJqSlFmOWZFUE40Qncvd1lCdk1NSWZCNjQrRHIvTGdVZnU4YTFzU1lu?=
 =?utf-8?B?em9MRW05V0prM2FXd1piNllCZXRNamNLNlBEcTJZSXRzRkJabjZSWEh5M0po?=
 =?utf-8?B?T1pHNkFHT1ZVWUQ1YXBzV3ZDaG8wRWV3VFh1WUUzSEpGS1BYYjFQc2JSeXlo?=
 =?utf-8?B?aUdCb3pEb0YrVitQK1h0alFLNWVMS2tuK3pVTWNkSEplV2VUNGVNQ2I1MU9S?=
 =?utf-8?B?T2FEc2dhc0JHbTBDLzQ4TzBMMmJ4Ky81THVnSENLQlJKaVhOVHlZTE00TnVt?=
 =?utf-8?B?VW1hWVIwYkhEL0g4K3JqWGpHME81TG05cXpHbHFWdnVTWEI1bjE2SEQrb2hK?=
 =?utf-8?B?RVVHWC9lUGZHb3R5NkFTWkxrOFQwTXQ3WDUxTy9Ba0pVVHFMeks0YXZrbWRt?=
 =?utf-8?B?eXNEZElGYTR2SGExV3BrTjFiNTlXR0FLeDNaak4wNzNwQnZxNUpJcWNrcXFn?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae07ef3-28e0-48f9-c180-08dc1daebc91
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 14:05:50.4453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BrUDH7ZKasf/N/gWU4ocPpU5hgwnj+fitK30Yl/vTkkXMRgbzj2fd13CSF8N7KaO05SITBmhVjSiM7l+mGyaVRifMJI7ImbtSYXddF4aVpuS950QJt5hlmHuP2PYd/5S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8235
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

SGkgS2FtaWwsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwg
S29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVy
c2RheSwgSmFudWFyeSAyNSwgMjAyNCAyOjQ0IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogUGlhdGtvd3NraSwgRG9taW5payBLYXJvbCA8ZG9taW5pay5rYXJv
bC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2MiA3
LzhdIHRlc3RzL2ludGVsL3hlX2V4ZWNfYmFzaWM6IGFkZCBtdWx0aWdwdQ0KPiBzdWJ0ZXN0cw0K
PiANCj4gSGkgRG9taW5paywNCj4gDQo+IE9uIDIwMjQtMDEtMjUgYXQgMDc6NTE6NTYgKzAwMDAs
IFBpYXRrb3dza2ksIERvbWluaWsgS2Fyb2wgd3JvdGU6DQo+ID4gSGkgS2FtaWwsDQo+ID4NCj4g
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBpZ3QtZGV2IDxpZ3Qt
ZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gPiA+IEth
bWlsIEtvbmllY3pueQ0KPiA+ID4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDI0LCAyMDI0IDk6
NDIgUE0NCj4gPiA+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+ID4gU3Vi
amVjdDogW1BBVENIIGktZy10IHYyIDcvOF0gdGVzdHMvaW50ZWwveGVfZXhlY19iYXNpYzogYWRk
DQo+ID4gPiBtdWx0aWdwdSBzdWJ0ZXN0cw0KPiA+ID4NCj4gPiA+IEFkZCBhIGZldyBtdWx0aS1n
cHUgc3VidGVzdHM6DQo+ID4gPg0KPiA+ID4gbXVsdGlncHUtb25jZS0qDQo+ID4gPiBtdWx0aWdw
dS1tYW55LWV4ZWNxdWV1ZXMtbWFueS12bS0qDQo+ID4gPiBtdWx0aWdwdS1uby1leGVjLSoNCj4g
PiA+DQo+ID4gPiBydW4gb24gdHdvIG9yIG1vcmUgR1BVcy4gTWFueSB2YXJpYW50IHdhcyBsaW1p
dGVkIHRvIHRha2UgYXQgbW9zdA0KPiA+ID4gZmV3IHNlY29uZHMuDQo+ID4gPg0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwu
Y29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgdGVzdHMvaW50ZWwveGVfZXhlY19iYXNpYy5jIHwgMzYN
Cj4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2ludGVsL3hlX2V4ZWNfYmFzaWMuYw0KPiA+ID4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX2Jh
c2ljLmMgaW5kZXgNCj4gPiA+IDg5OTQ4NTlmYS4uZGViZmZhYWYzIDEwMDY0NA0KPiA+ID4gLS0t
IGEvdGVzdHMvaW50ZWwveGVfZXhlY19iYXNpYy5jDQo+ID4gPiArKysgYi90ZXN0cy9pbnRlbC94
ZV9leGVjX2Jhc2ljLmMNCj4gPiA+IEBAIC0xMSw2ICsxMSw3IEBADQo+ID4gPiAgICovDQo+ID4g
Pg0KPiA+ID4gICNpbmNsdWRlICJpZ3QuaCINCj4gPiA+ICsjaW5jbHVkZSAiaW50ZWxfbXVsdGln
cHUuaCINCj4gPiA+ICAjaW5jbHVkZSAibGliL2lndF9zeW5jb2JqLmgiDQo+ID4gPiAgI2luY2x1
ZGUgImxpYi9pbnRlbF9yZWcuaCINCj4gPiA+ICAjaW5jbHVkZSAieGVfZHJtLmgiDQo+ID4gPiBA
QCAtNTQsNiArNTUsMTggQEANCj4gPiA+ICAgKiBEZXNjcmlwdGlvbjogUnVuIG5vLWV4ZWMgJWFy
Z1sxXSB0ZXN0DQo+ID4gPiAgICogVGVzdCBjYXRlZ29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0DQo+
ID4gPiAgICoNCj4gPiA+ICsgKiBTVUJURVNUOiBtdWx0aWdwdS1vbmNlLSVzDQo+ID4gPiArICog
RGVzY3JpcHRpb246IFJ1biAlYXJnWzFdIHRlc3Qgb25seSBvbmNlIG9uIG11bHRpR1BVDQo+ID4g
PiArICogVGVzdCBjYXRlZ29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0DQo+ID4gPiArICoNCj4gPiA+
ICsgKiBTVUJURVNUOiBtdWx0aWdwdS1tYW55LWV4ZWNxdWV1ZXMtbWFueS12bS0lcw0KPiA+ID4g
KyAqIERlc2NyaXB0aW9uOiBSdW4gJWFyZ1sxXSB0ZXN0IG9uIG1hbnkgZXhlY19xdWV1ZXMgYW5k
IG1hbnkgVk1zDQo+ID4gPiArIG9uIG11bHRpR1BVDQo+ID4gPiArICogVGVzdCBjYXRlZ29yeTog
c3RyZXNzIHRlc3QNCj4gPiA+ICsgKg0KPiA+ID4gKyAqIFNVQlRFU1Q6IG11bHRpZ3B1LW5vLWV4
ZWMtJXMNCj4gPiA+ICsgKiBEZXNjcmlwdGlvbjogUnVuIG5vLWV4ZWMgJWFyZ1sxXSB0ZXN0IG9u
IG11bHRpR1BVDQo+ID4gPiArICogVGVzdCBjYXRlZ29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0DQo+
ID4gPiArICoNCj4gPiA+ICAgKiBhcmdbMV06DQo+ID4gPiAgICoNCj4gPiA+ICAgKiBAYmFzaWM6
CQkJCWJhc2ljDQo+ID4gPiBAQCAtMzY5LDQgKzM4MiwyNyBAQCBpZ3RfbWFpbg0KPiA+ID4NCj4g
PiA+ICAJaWd0X2ZpeHR1cmUNCj4gPiA+ICAJCWRybV9jbG9zZV9kcml2ZXIoZmQpOw0KPiA+ID4g
Kw0KPiA+ID4gKwlmb3IgKGNvbnN0IHN0cnVjdCBzZWN0aW9uICpzID0gc2VjdGlvbnM7IHMtPm5h
bWU7IHMrKykgew0KPiA+ID4gKwkJaWd0X3N1YnRlc3RfZigibXVsdGlncHUtb25jZS0lcyIsIHMt
Pm5hbWUpIHsNCj4gPiA+ICsJCQl4ZV9tdWx0aV9mb3JrX2ZvcmVhY2hfZ3B1KHhlLCBncHVfaWR4
KQ0KPiA+ID4gKwkJCQl4ZV9mb3JfZWFjaF9lbmdpbmUoeGUsIGh3ZSkNCj4gPiA+ICsJCQkJCXRl
c3RfZXhlYyh4ZSwgaHdlLCAxLCAxLCAxLCBzLT5mbGFncyk7DQo+ID4NCj4gPiBOaXRwaWNrOiBj
b25zaWRlciB1c2luZyBmZCBpbnN0ZWFkIG9mIHhlIGZvciBjb25zaXN0ZW5jeQ0KPiANCj4gTWFj
cm8gZGVmaW5lcyBhIHZhciB3aXRoIHRoYXQgbmFtZSBzbyBpdCByYXRoZXIgc2hvdWxkIGJlIGRp
ZmZlcmVudCwgZm9yDQo+IGV4YW1wbGUgY291bGQgYmUgZ3B1X2ZkLg0KDQpPa2F5LiAiZmQiIGlz
IHVzZWQgaW4gb3RoZXIgYWRkZWQgdGVzdGNhc2VzLCBwbGVhc2UgZG91YmxlIGNoZWNrIGlmIGl0
IHNob3VsZCBiZSAiZmQiIGFuZCBub3QgInhlIiBpbiBtdWx0aWdwdS1tYW55LWV4ZWNxdWV1ZXMt
bWFueS12bS0qIGFuZCBtdWx0aWdwdS1uby1leGVjLSouIFItYiBjYXJyaWVzIG9uLiANCg0KRG9t
aW5payBLYXJvbA0KDQo+IA0KPiBSZWdhcmRzLA0KPiBLYW1pbA0KPiANCj4gPiBPdGhlcndpc2Us
IExHVE0NCj4gPiBSZXZpZXdlZC1ieTogRG9taW5payBLYXJvbCBQacSFdGtvd3NraQ0KPiA+IDxk
b21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0KPiA+DQo+ID4gPiArCQkJaWd0X3dh
aXRjaGlsZHJlbigpOw0KPiA+ID4gKwkJfQ0KPiA+ID4gKw0KPiA+ID4gKwkJaWd0X3N1YnRlc3Rf
ZigibXVsdGlncHUtbWFueS1leGVjcXVldWVzLW1hbnktdm0tJXMiLCBzLQ0KPiA+ID4gPm5hbWUp
IHsNCj4gPiA+ICsJCQl4ZV9tdWx0aV9mb3JrX2ZvcmVhY2hfZ3B1KHhlLCBncHVfaWR4KQ0KPiA+
ID4gKwkJCQl4ZV9mb3JfZWFjaF9lbmdpbmUoZmQsIGh3ZSkNCj4gPiA+ICsJCQkJCXRlc3RfZXhl
YyhmZCwgaHdlLCAxNiwgMzIsIDE2LCBzLQ0KPiA+ID4gPmZsYWdzKTsNCj4gPiA+ICsJCQlpZ3Rf
d2FpdGNoaWxkcmVuKCk7DQo+ID4gPiArCQl9DQo+ID4gPiArDQo+ID4gPiArCQlpZ3Rfc3VidGVz
dF9mKCJtdWx0aWdwdS1uby1leGVjLSVzIiwgcy0+bmFtZSkgew0KPiA+ID4gKwkJCXhlX211bHRp
X2ZvcmtfZm9yZWFjaF9ncHUoeGUsIGdwdV9pZHgpDQo+ID4gPiArCQkJCXhlX2Zvcl9lYWNoX2Vu
Z2luZShmZCwgaHdlKQ0KPiA+ID4gKwkJCQkJdGVzdF9leGVjKGZkLCBod2UsIDEsIDAsIDEsIHMt
PmZsYWdzKTsNCj4gPiA+ICsJCQlpZ3Rfd2FpdGNoaWxkcmVuKCk7DQo+ID4gPiArCQl9DQo+ID4g
PiArCX0NCj4gPiA+ICB9DQo+ID4gPiAtLQ0KPiA+ID4gMi40Mi4wDQo+ID4NCg==
