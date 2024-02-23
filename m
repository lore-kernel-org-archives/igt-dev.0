Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E05FC48BC4
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 08:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BE710EB12;
	Fri, 23 Feb 2024 08:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1Ei+Via";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05EF10EB12
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2024 08:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708675482; x=1740211482;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ORbZ4z19t83kAl9LQqDeKUVHql+HzxLnc+i0AMXXtpg=;
 b=G1Ei+ViaMsjaj5jOMMsDzZG0OQ0L8ieBW5DuoUwQCEWvVe42j9YuaxIT
 PYRbRZDco2QgSopzwKfMjD4gKoEQ4nm5+r6F7Hl1ip6Hk3kh4AxV3jJ9E
 MBvlWzg+euBvfhwfeYbRkyhYBHyNUfaKvosa2sDp+ltvwDTW7PSjOEew4
 vFAG2aWqLnNz1G7MX+XyX/+ZvTkzqQ1TEeyURRsfpO2uc93Qe14f0CTx5
 a18VvHCBaHkua6H7keE8vpMUzz/ZHFMSTeH29AIILb/nU5ivviToIiE2r
 FqJa/CidRgf58gXbT7WXw4Fzr2XLsHyHJL8hJ8ApGdkO5WM/qCZP9AE8z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28408995"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28408995"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 00:04:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28995453"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 00:04:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 00:04:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 00:04:40 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 00:04:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYB3nAhq0mda6qDbpNGO1U27OhGi0AH95pdhNtytbnlKMxxKcS2JzIpz70UnPiPgb2uYyTJaV7BjM3kpa2EC1r8RZZ7Z20IWP9qsPI1fi9CRSCct/0l/11CzrmE9jRQhGuOUCrCMPV+Sig5AccWsMQHTkd7vqBxsjP9Af4rgEZhzSQ4YADaaDaS/5FfGrWjiHOODnPPkCpC6CoVwA5tT87iXXt9S9zDhBVbzNHkn5ip7Ci6f8HBBGYdbqxgCDPFG/mkmOYet6+9V0HZyl1fVX3s63O4gCbhZt1VB4DLmIdY5GkD2xUX8z83dp4HMLHci09//U2vnPo0MDeHVDHK7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORbZ4z19t83kAl9LQqDeKUVHql+HzxLnc+i0AMXXtpg=;
 b=k9xbdRaJ98yrI6yygiC3WD5IUSzJSDZAQPchT+/Q5C3uU13YUmwl5cRTed7tMvJ1TT7PCvCdtCDXjMate4WpoaQSWZfjh8wqAs5dQpAUx+7VuQmeQK45Eoed3BrZnzuCHv+1z2uwY8T7UInZHeUjb9SQ4cUMIfH/cKtb4wlwgJlJzdZ66ms0iqJmtRJRnx/YZSqtx77RwLIfElGoj6XcIPFPYQ+XzKV9W0SzFx58QNTU17FpoZcMtKiVmCSb1QKKaJoqOvw5NecvD3bkKZWTop9UHv11jhN+WrS6Y2SjoZkaji9MTTG0Nq8RdNi/U3Qa50YYxu77yRYgK6TuTctaTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Fri, 23 Feb
 2024 08:04:38 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67%5]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 08:04:37 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Kumar, Janga
 Rahul" <janga.rahul.kumar@intel.com>, "Ch, Sai Gowtham"
 <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Stress test to
 validate long running workload on compute mode
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Stress test to
 validate long running workload on compute mode
Thread-Index: AQHaZiJyP8o1xTvl1kORjmv3Rb9WWbEXkV7Q
Date: Fri, 23 Feb 2024 08:04:37 +0000
Message-ID: <CH3PR11MB84344063E0F850EC52888BE98D552@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240223063430.10135-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20240223063430.10135-1-sai.gowtham.ch@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ0PR11MB4798:EE_
x-ms-office365-filtering-correlation-id: 90954b2c-1f11-45da-d236-08dc3446145e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fp8ZvIna2yetN82QGKp7BTFxMY1qATut9SEWDmRFdRk9OYSABPrLByRVyXWgnLgg75oNni8HackqMN8T5UQ+UJl2oUNzjuNJLbfy0nMqzlUY3fsLHBpkoQc+QxVTUPtNGLGk75AAVdzJ+Dw6qdCJKI1PezC9vb1wdLiDfzKf13obhkSwsAUMZKrAM9J/4a8TZU5hiC2UuszAR/gg6LMIAyHcFQLg3d3IqawXaoGTK4fpsXFRBO1CRGiVLGTwITmVjcSh6dX6kAsS4HMQYAGQvFVsQK5hXzX6x40yTuw4MFEsoYa66hs7xNyZn6dppv3cj4Urx1xWqtJ2GK9kj0q/MzCWeYouMXiIC4L/OYpXXs4ki0cALP0agQmOpVqWtX/g7CNweHr8wyyfjOIrU54EiolwBIhNAdNDY2AGBhdoAcVRqmeKuSRtTbmw+dwtAaqsb3DxJFVtUCUH9BRJp3aSCOu6wRXGdyXEd1eNHCpfDIhnW3dBhZBTwbMcWZO6+vz7TWJW3wjvQElDkWJCafsQQLzld3pQ/4qw+9EeEsHfwtXlMzs6BGw3iILrjqeOj27HoS5UuRnuvVDb7Q4O1rySDrtIxuVeUC5jyZr7zCM6cGJb9ohMmM9YM4by5FkHKrDD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TW1qc3FITFBKakQyYzFMNzdlZGJEVXhkbldZd3NaaXhjLzlESkdoay9GWmND?=
 =?utf-8?B?ZFR0czlsR1dKQ05zOUs2aCsxMVNWeUF5M1ZvVzJOd3RmbWxtU3g1NFNxeWdu?=
 =?utf-8?B?dGtJWXliR2ROOWJ1YzhnemxldHQyQjVBT1E4eGlVVUo0TXU2TDFTb3M0TlFw?=
 =?utf-8?B?RG9LdHlWbE5CT3dxQkp1QklabUxQL3JLVUFzVzhuS21jK2lTcldBMmRyQ3NR?=
 =?utf-8?B?R0wxY096L2pEMGxpOThac1l1MURKdWVyZWFqYkhQTWdydm8wMXl1VXA5cFMx?=
 =?utf-8?B?NENvVjY2bzdob3pYaURLSUhxT0lMZGVxNk10UTdqR2NRa05PSkRDR3BKOWpN?=
 =?utf-8?B?OERoS0RjTlBIbnRDMnJnWnRvOURPcFJ3R0FpaXR4ZU05Q2R5N0V1TVVWYm8x?=
 =?utf-8?B?SDJXbnB5R2NDT0JpUkxDODVtVDJzT2dYQ2UxamVFSHZ5NTlXb0ZsNnVVcUNO?=
 =?utf-8?B?L2Eyd1Fya1U1RUVydXZGSHgyN1RSbTNWMnFyNU5rZlJDbVZpdGFHOGVteXdv?=
 =?utf-8?B?NkE1WlhBNXR1VWY3S2gzakIwbnRoWGpWTlJVZTVPOHVuWFpVbnNkYmNNVmVs?=
 =?utf-8?B?ZXZ6MGY2MkNkNCtySGpuemxJNzFlYUxhRkdiR1RCZ0kzWEg2bU5YMzhzckh6?=
 =?utf-8?B?VkRFRjlmalJiZi9FaXdla2JWd0xydGUybWdRRUtuM0xSeEhMVENGTzB3dDhS?=
 =?utf-8?B?alorY3BKRjJOL3RUdFVKWjcvOTBCUDNoZHNnUGk5NUFpTjROOWFvSE5DY3FQ?=
 =?utf-8?B?eDZFR0l6MjE2aVJ4VHNlT1RqRUtaYXA0cytKdmVIa3hjWjcvWUwvbTNoOUtD?=
 =?utf-8?B?NGtYeC9tcjV1MVpwN284VmRoeFAyNVlvbVd4eFlHdGdmRGR3Vk5VLy9SWFly?=
 =?utf-8?B?bFhQWE9mZ2JRaHE5OGgraEVWV0h0OHVBdjF0N2FwNWV3VGVOQkFWZzQvOEhX?=
 =?utf-8?B?OGRKWjFUV05mMWx1dTMzR1FiMDJjdkEwbUtnVE5ZajdCL0VMQ3N3U0hxZ2dO?=
 =?utf-8?B?aENxZUlnZE9RVzFKSU5Wamg4Zjd4Vzl1bVg4ME12TWlCa2gyMVA0bHl0cU1G?=
 =?utf-8?B?Z3NPWFA1TlBzbUZwODA4Vk93dXlRYXkra2x2QTVHRFNiWDA0NlJBSE5IeU1o?=
 =?utf-8?B?YktwanA3eGNPNWY5N0lkK0hMNVFnU0h0WDFZYTArUEhlVVFFWmpVVG8rNWt1?=
 =?utf-8?B?Nk5kdDNJUVpOOGpBdjh5TWpSQm5icml5dzBDUHlNM1NtYWdySWNHdWVZSkdS?=
 =?utf-8?B?WnhVQzZHZTBzemhSOElFcnhDc1pNUTdHY3FBUko4RjB3VlNQV1J3SDcwd0NS?=
 =?utf-8?B?SWpVR1l1RWpwYnBQSHFkbHQ4QTRNV0xzY2VWNE5ORE5qYmxJYWpIa2dGa0xO?=
 =?utf-8?B?M0UwUWw3WE1QSjBtTlZqdG0wQThzYkVpckNvVFdhdng2bEUrajR4R1VhTDFR?=
 =?utf-8?B?TmE0RUdabFZqei9pZ1AxUVhkdCtnNUVjRHJCV0hCUDE2eDE4U2tFRHJQNUU4?=
 =?utf-8?B?b2xSNzVuZkZzVDZEYW5zWmpCTldUUTZkNkFoSWE0T1l0cEcyTHJRUW9PdUFY?=
 =?utf-8?B?cWlUV1dHcUk2U3R4UVp0eGN2U0VoOUhTS2FGTnEvNTM2OVBmMDFMWk4zb2hG?=
 =?utf-8?B?dlpqSlRlemFZOWxCYXdMY003Tk5td0luRm1kTmpMZUwxZkVscmNmaHE0V3hP?=
 =?utf-8?B?NkpWTlFXZnhrdmwyTWhnUzZtZ3k5blFscFdMYlNNSnk0L3IzdXFhNGtxQmQw?=
 =?utf-8?B?RXFsZkYyNXNqS3FuWWVwYThham40RlAzOUZZclFwWDdmMmJTaDF6bEc5M0FK?=
 =?utf-8?B?NE9wZDVMME9ZVUNPSmJCMm9YZDBudHJGQXZWdVlGYmZqeVBmQkZZeFpaRU0w?=
 =?utf-8?B?QUZrQ3BiMmFCcXg4TzIyWjhGVUEzeklnQ1F2NkNVNTFINWVpRUFJVmEyckpv?=
 =?utf-8?B?MWNzSjhiVGRHcmdVZ20xbXBndTdLQVV0MFlqdnljOGE1L2JxYTFBeVptSHpk?=
 =?utf-8?B?VFBmdVI5Y3R6Ym1pY2tVUjMxeFJqdzd3Q1VFMkpzMUIvbHhqWDE3aks0a0Zp?=
 =?utf-8?B?T3lKalFJb3FaQkdIeVRSZEJSL0lnbWdoeGJaM0M0TDhLazltWnVITkZlV01o?=
 =?utf-8?B?ZGc3WlNiZGp2VjVOR0xNdHpWZ2RmRUozbHhWY29KQWJObmhnQUc1ZjJ2QkI4?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90954b2c-1f11-45da-d236-08dc3446145e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 08:04:37.3455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JaZ2qNva7uCrR+WSNXN2m4i+bzouA47OPKc4+ptSNeRpVimOhaq3GcLFFOzj4IpDW4t1IZovc7A/AXXR6dtnku+fJYdAHk+4cAuG1P0jSos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IHNhaS5nb3d0
aGFtLmNoQGludGVsLmNvbQ0KPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDIzLCAyMDI0IDEyOjA1
IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgS2VtcGN6eW5za2ksIFpi
aWduaWV3DQo+IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBLdW1hciwgSmFuZ2Eg
UmFodWwNCj4gPGphbmdhLnJhaHVsLmt1bWFyQGludGVsLmNvbT47IENoLCBTYWkgR293dGhhbQ0K
PiA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIHRl
c3RzL2ludGVsL3hlX2V4ZWNfY29tcHV0ZV9tb2RlOiBTdHJlc3MgdGVzdCB0bw0KPiB2YWxpZGF0
ZSBsb25nIHJ1bm5pbmcgd29ya2xvYWQgb24gY29tcHV0ZSBtb2RlDQo+IA0KPiBGcm9tOiBTYWkg
R293dGhhbSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPiANCj4gVGVzdCB2YWxpZGF0
ZXMgbG9uZyBydW5uaW5nIGNvbXB1dGUgbW9kZSBieSBzdWJtaXR0aW5nIGEgc3Bpbm5lciBmb3Ig
MzBzDQo+IGxvbmcuDQo+IA0KPiBDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5r
ZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IENjOiBKYW5nYSBSYWh1bCBLdW1hciA8amFuZ2EucmFo
dWwua3VtYXJAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTYWkgR293dGhhbSBDaCA8c2Fp
Lmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL3hlX2V4ZWNfY29t
cHV0ZV9tb2RlLmMgfCA3Mw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
aW50ZWwveGVfZXhlY19jb21wdXRlX21vZGUuYw0KPiBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfY29t
cHV0ZV9tb2RlLmMNCj4gaW5kZXggN2RhZDcxNTA5Li4wYTcxYmZkYzUgMTAwNjQ0DQo+IC0tLSBh
L3Rlc3RzL2ludGVsL3hlX2V4ZWNfY29tcHV0ZV9tb2RlLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwv
eGVfZXhlY19jb21wdXRlX21vZGUuYw0KPiBAQCAtNDAwLDYgKzQwMCw3NiBAQCBzdGF0aWMgdm9p
ZCBub25fYmxvY2soaW50IGZkLCBpbnQgZXhwZWN0KQ0KPiAgCXhlX3ZtX2Rlc3Ryb3koZmQsIHZt
KTsNCj4gIH0NCj4gDQo+ICsvKioNCj4gKyAqIFNVQlRFU1Q6IGxyLXN0cmVzcw0KPiArICogRGVz
Y3JpcHRpb246IFN0cmVzcyBMUiBtb2RlIHdvcmtsb2FkIGZvciAzMHMuDQo+ICsgKiBUZXN0IGNh
dGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4gKyAqLw0KPiArc3RhdGljIHZvaWQgbHJfc3Ry
ZXNzKGludCBmZCkNCj4gK3sNCj4gKwl1aW50NjRfdCBhZGRyID0gMHgxYTAwMDA7DQo+ICsJc3Ry
dWN0IGRybV94ZV9zeW5jIHN5bmNbMV0gPSB7DQo+ICsJCXsudHlwZSA9IERSTV9YRV9TWU5DX1RZ
UEVfVVNFUl9GRU5DRSwNCj4gKwkJIC5mbGFncyA9IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMLA0K
PiArCQkgLnRpbWVsaW5lX3ZhbHVlID0gVVNFUl9GRU5DRV9WQUxVRX0sDQo+ICsJfTsNCj4gKwlz
dHJ1Y3QgZHJtX3hlX2V4ZWMgZXhlYyA9IHsNCj4gKwkJLm51bV9iYXRjaF9idWZmZXIgPSAxLA0K
PiArCQkubnVtX3N5bmNzID0gMSwNCj4gKwkJLnN5bmNzID0gdG9fdXNlcl9wb2ludGVyKCZzeW5j
KSwNCj4gKwl9Ow0KPiArCXN0cnVjdCAgew0KPiArCQlzdHJ1Y3QgeGVfc3BpbiBzcGluOw0KPiAr
CQl1aW50NjRfdCB2bV9zeW5jOw0KPiArCQl1aW50MzJfdCBkYXRhOw0KPiArCQl1aW50NjRfdCBl
eGVjX3N5bmM7DQo+ICsJfSAqZGF0YTsNCj4gKwlzdHJ1Y3QgeGVfc3Bpbl9vcHRzIHNwaW5fb3B0
cyA9IHsgLnByZWVtcHQgPSBmYWxzZSB9Ow0KPiArCXN0cnVjdCBkcm1feGVfZW5naW5lICplbmdp
bmU7DQo+ICsJc2l6ZV90IGJvX3NpemU7DQo+ICsJdWludDMyX3Qgdm07DQo+ICsJdWludDMyX3Qg
ZXhlY19xdWV1ZTsNCj4gKwl1aW50MzJfdCBibzsNCj4gKw0KPiArCXZtID0geGVfdm1fY3JlYXRl
KGZkLCBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSwgMCk7DQo+ICsJYm9fc2l6ZSA9IHNp
emVvZigqZGF0YSk7DQo+ICsJYm9fc2l6ZSA9IHhlX2JiX3NpemUoZmQsIGJvX3NpemUpOw0KPiAr
DQo+ICsJZW5naW5lID0geGVfZW5naW5lKGZkLCAxKTsNCj4gKwlibyA9IHhlX2JvX2NyZWF0ZShm
ZCwgdm0sIGJvX3NpemUsIHZyYW1faWZfcG9zc2libGUoZmQsDQo+ICtlbmdpbmUtPmluc3RhbmNl
Lmd0X2lkKSwgMCk7DQo+ICsNCj4gKwlkYXRhID0geGVfYm9fbWFwKGZkLCBibywgYm9fc2l6ZSk7
DQo+ICsJbWVtc2V0KGRhdGEsIDAsIGJvX3NpemUpOw0KPiArCWV4ZWNfcXVldWUgPSB4ZV9leGVj
X3F1ZXVlX2NyZWF0ZShmZCwgdm0sICZlbmdpbmUtPmluc3RhbmNlLCAwKTsNCj4gKw0KPiArCXN5
bmNbMF0uYWRkciA9IHRvX3VzZXJfcG9pbnRlcigmZGF0YVswXS52bV9zeW5jKTsNCj4gKwl4ZV92
bV9iaW5kX2FzeW5jKGZkLCB2bSwgZW5naW5lLT5pbnN0YW5jZS5ndF9pZCwgYm8sIDAsDQo+ICsJ
CQkJYWRkciwgYm9fc2l6ZSwgc3luYywgMSk7DQo+ICsJeGVfd2FpdF91ZmVuY2UoZmQsICZkYXRh
WzBdLnZtX3N5bmMsIFVTRVJfRkVOQ0VfVkFMVUUsIDAsDQo+IE9ORV9TRUMpOw0KPiArCWRhdGFb
MF0udm1fc3luYyA9IDA7DQo+ICsNCj4gKwlzcGluX29wdHMuYWRkciA9IGFkZHIgKyAoY2hhciAq
KSZkYXRhWzBdLnNwaW4gLSAoY2hhciAqKWRhdGE7DQo+ICsJeGVfc3Bpbl9pbml0KCZkYXRhWzBd
LnNwaW4sICZzcGluX29wdHMpOw0KPiArCXN5bmNbMF0uYWRkciA9IGFkZHIgKyAoY2hhciAqKSZk
YXRhWzBdLmV4ZWNfc3luYyAtIChjaGFyICopZGF0YTsNCj4gKwlleGVjLmV4ZWNfcXVldWVfaWQg
PSBleGVjX3F1ZXVlOw0KPiArCWV4ZWMuYWRkcmVzcyA9IHNwaW5fb3B0cy5hZGRyOw0KPiArCXhl
X2V4ZWMoZmQsICZleGVjKTsNCj4gKwl4ZV9zcGluX3dhaXRfc3RhcnRlZCgmZGF0YVswXS5zcGlu
KTsNCj4gKwlzbGVlcCgzMCk7DQo+ICsgaWd0X3VudGlsX3RpbWVvdXQoMjApIC0tPiBDYW4geW91
IHBsZWFzZSBjaGVjayB0aGlzOyBJIHRoaW5rIHNsZWVwIGlzIGdlbmVyYWxseSBub3QgcHJlZmVy
YWJsZQ0KLS1Qcml5YW5rYQ0KPiArCXhlX3NwaW5fZW5kKCZkYXRhWzBdLnNwaW4pOw0KPiArCXhl
X3dhaXRfdWZlbmNlKGZkLCAmZGF0YVswXS5leGVjX3N5bmMsIFVTRVJfRkVOQ0VfVkFMVUUsIDAs
DQo+IE9ORV9TRUMpOw0KPiArDQo+ICsJc3luY1swXS5hZGRyID0gdG9fdXNlcl9wb2ludGVyKCZk
YXRhWzBdLnZtX3N5bmMpOw0KPiArCXhlX3ZtX3VuYmluZF9hc3luYyhmZCwgdm0sIDAsIDAsIGFk
ZHIsIGJvX3NpemUsIHN5bmMsIDEpOw0KPiArCXhlX3dhaXRfdWZlbmNlKGZkLCAmZGF0YVswXS52
bV9zeW5jLCBVU0VSX0ZFTkNFX1ZBTFVFLCAwLA0KPiBPTkVfU0VDKTsNCj4gKwltdW5tYXAoZGF0
YSwgYm9fc2l6ZSk7DQo+ICsJZ2VtX2Nsb3NlKGZkLCBibyk7DQo+ICsNCj4gKwl4ZV9leGVjX3F1
ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWUpOw0KPiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsN
Cj4gK30NCj4gKw0KPiAgaWd0X21haW4NCj4gIHsNCj4gIAlzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9j
bGFzc19pbnN0YW5jZSAqaHdlOyBAQCAtNDYwLDYgKzUzMCw5IEBADQo+IGlndF9tYWluDQo+ICAJ
aWd0X3N1YnRlc3QoIm5vbi1ibG9ja2luZyIpDQo+ICAJCW5vbl9ibG9jayhmZCwgRVdPVUxEQkxP
Q0spOw0KPiANCj4gKwlpZ3Rfc3VidGVzdCgibHItc3RyZXNzIikNCj4gKwkJbHJfc3RyZXNzKGZk
KTsNCj4gKw0KPiANCj4gIAlpZ3RfZml4dHVyZQ0KPiAgCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsN
Cj4gLS0NCj4gMi4zOS4xDQoNCg==
