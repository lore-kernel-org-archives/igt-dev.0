Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3219C4828C
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 13:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D5E10EDB3;
	Thu,  1 Feb 2024 13:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4CblPaI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496B510EDB3;
 Thu,  1 Feb 2024 13:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706793663; x=1738329663;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sIfDxuKyAIDJPpLWseg3p8sTsnKIT/JNquMSamGjhc0=;
 b=k4CblPaIVKpclGU9ALBQkiCp0JRZOCzhEqOpiv5HBEX6VkYPXlQsy9Xn
 L902CD+nwPXtQrxu+KgI0p683byO9NX3HtvmmCuRLJ3dbNWtWtGUrlSXs
 iRvA+bpgFqsP7RC9yt5Qs5UIKQ7FVyESduUFEUJLTzr3KmorYFvPTXaFe
 J9aOv4jXG09xulVvGuhDKJ/hV2hMCSioE/5V51SygOTNT1XMC6Ihw3KRC
 p+BBmPiw8NBsBpCGsv6d8MH5Weopq5m9XskEzdB4oQlDanWmvkzwqnHow
 EVb8hXkAQMYPS+RCEdkRSaBlurcurElkikTtL4Fr4LZNelDv3GibkqcD+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10544444"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="10544444"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 05:21:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4408106"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 05:21:01 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 05:21:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 05:21:00 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 05:21:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aq3AS45Cstfr80D405ImMGELTJcXv0p1dMImNVvZCp33gL1V0CZ7N9pZO21DghAKh88dssz9faAqCxcXqt2pAcNdY1MB5ZtD+FsaD4v7ALVIKezQ5mzdkM1uTcCbBbc+2gKIyZpXH3czlwXfLY6J52GN0jn7vhThOI2OeT/jByqXigxhM2sgiPTwZ8envJHqtt6HmJtDnxK8YZX7KgZaNLDX1N/nnUfzfgSB44uAYQC5BfXTKtZk4lyimnRJXRQqRslYqbaVUX0nbRIqgS0o02IPR39w7UFvUWAq/gCcKlhVrlSj3jPfwGTPr970Af+bnnJAb/1JrEKvo/KnlZrIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIfDxuKyAIDJPpLWseg3p8sTsnKIT/JNquMSamGjhc0=;
 b=IVbzhnsmp+Tq1q3In/6uygNfFz9TTz30HblkxzG7e9enmx1xOGHB1wMY90br624d6stJhbOt0X4gszQyPhFvAL/y8lwhqNIiE1Xb1i/+mZY5NRBhEjk+dMdeEPbujS9tm0j8Nf11HscIktHAYuQcNRxN4xVSjfHxFUkFvuXsE1RHFq7rpLAHAGqCOiuE2ebtNidehF2H/jm9eDWpVjFmBZz0zcnHUYM2xeZqk0MfoMuXVAhsQt4n69nq0F1qIcCBkwp55dHoV59vRrOnESxk8V/hgRWN4AFfKGdHo+0kha54elKDaP3DkINmlxH1Z6mxps4EKGX6AKQo/r+C1Z2fBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Thu, 1 Feb
 2024 13:20:57 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae%4]) with mapi id 15.20.7202.031; Thu, 1 Feb 2024
 13:20:57 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "vitaly.prosyak@amd.com" <vitaly.prosyak@amd.com>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>,
 LGCI Bug Filing <lgci.bug.filing@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBDSS54ZUJBVDogZmFpbHVyZSBmb3Igc2VyaWVzIHN0YXJ0aW5n?=
 =?utf-8?Q?_with_[1/3]_lib/amdgpu:_add_support_for_gang_cs?=
Thread-Topic: =?utf-8?B?4pyXIENJLnhlQkFUOiBmYWlsdXJlIGZvciBzZXJpZXMgc3RhcnRpbmcgd2l0?=
 =?utf-8?Q?h_[1/3]_lib/amdgpu:_add_support_for_gang_cs?=
Thread-Index: AQHaT1MqENM2lqSi7k2U9pyUgmdaCbDwu2AAgATH7CA=
Date: Thu, 1 Feb 2024 13:20:57 +0000
Message-ID: <PH8PR11MB67531F0C32888D005D1EE23BF2432@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240125034413.232349-1-vitaly.prosyak@amd.com>
 <170616214313.709515.13480237695014375689@5338d5abeb45>
 <20240129121640.22qm5guwuht5b3ak@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240129121640.22qm5guwuht5b3ak@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|PH0PR11MB5047:EE_
x-ms-office365-filtering-correlation-id: 1e9cf0f0-00ef-4fec-1abe-08dc2328a03f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RDFM8mWqfCdd/JFnFpWu+kqxXY25I+2pZ7YPrUuNpu21XYUcEVkEwPRa/K/jzjYkh5fLyrLahXHJL7iZJc/6jF6oHN+u8SBHEeFBgegBBUbdj6UZwL8kDLBwOp4vC5dS5/x0t6Iaeym5AEiGF+X/9foZreAj9TBMSnkU95QEPDqeTQ2F7TaFA6gHPsID39Xe5+n2UyOypBUMrYJ4zHrLnc1lAtE7ocusvt+Zf2PAMR/7EYkO3IO2YGjjAgT+u+WWZsYg+uwyiMrSrji+ge70Xyq/VOiqeyzXJ16nDllKTLyJSEBmdz5Cy+MeklC8zj2qq1zvIAp5dsYWEbCq6AWNAwwRV/phN5Q6dlAGzKLYB2vwXlAIBb2jdCJdYeozg0fCboWbD0YaO+O2joPBaQkvZ2vChaQS1gmlMZxIJAMSTxcz24nU1eoVsSd4k5m78482dc8eONcGc7ecwhGpOaKwueaYAcZ3iBQwcS68jUmSe+gkGEMX+H2gFQmjmaoB8juZ9nmkt9KdIpM2gl6iSdcY1nM47cDHZXOr8eHlpJSPd4l99IF7ef0xOg1nEeHRELrc9uwFjhL8DS0Y65ZZ+6C59MPYgXINg62E09iFHOp006A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(26005)(83380400001)(82960400001)(38100700002)(110136005)(8936002)(122000001)(66946007)(76116006)(64756008)(4326008)(66556008)(54906003)(66446008)(66476007)(5660300002)(316002)(41300700001)(52536014)(2906002)(71200400001)(7696005)(6506007)(53546011)(9686003)(478600001)(966005)(86362001)(38070700009)(55016003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2Yydm05TjZSVm5nK1JISFdYaDVnY2hHTVNZbXZPays5bXFER2s5bFRmdUJv?=
 =?utf-8?B?aXVUZEgvRW1haVUzU3BMU1NOdzdVMGJ6ZXppZ09yQUUvd2VYUklwcnRZSmk0?=
 =?utf-8?B?bVdWVUFQSk9PL2daVmpYamxaUnhOQXVod2pQbUlESngwanBUTzlFSnUxVldn?=
 =?utf-8?B?cmJzT0hYZjczV2t4cklET2ZtYVpPR3pscmVvMXhEKzBXL2lBKy93ZTh4anla?=
 =?utf-8?B?a0F2S3FQWXAwOVBmb0MwMkR6Tk5MWXZ3UE1ya0hqd0EvM2RVL0d6eDk2QUlX?=
 =?utf-8?B?UzdQKzZZVkdNVzZxQUorQ2paaHBtMHp1cHZlSlhTWjRhTGw5dVpCQ25nUU1i?=
 =?utf-8?B?OHJkV04zVDJNdHc3b3QwMzRVZENTT0dtZDZmMjZrQVpYajR2MjJzcmFYNTdT?=
 =?utf-8?B?QW5ZZDN3NDRITUs0Y002KzNENk4yVlhJWGJZYytHeTE1Wnc0cGxLY2RjVlBs?=
 =?utf-8?B?dXVQcHdRelpoNGJ0UW1uZDBjb3hEYzNaOWptNW12SFIrY0dLNTRlOXl6cjBq?=
 =?utf-8?B?VDFkb0JKdDNOa2FqdVdHd3MvL1c3ejFVYlk1eGZLSS9SdUkrM3RTaThxdFIv?=
 =?utf-8?B?VXArM0o2eFI2dFNSQkxhTnVvOWdIK0VSdDZzelFYeVZWeGwvangrUDZVT2Rw?=
 =?utf-8?B?Sk9XSnIvanMyd0h0YmRqZ09pZCttYUxESWVUNWJqU0NiM3RnNHVCSlcycytx?=
 =?utf-8?B?cml4dEtURk9TeUVTZU5OYXgyOTdpc2JSTWdKRGdWRll6SUdESWNFRjJMZjVz?=
 =?utf-8?B?UGhNVVpWanNHYlRGalQ1eVZNdldYZVhCVmh1U25KaGVwdXlmbXlGdFVtVXdR?=
 =?utf-8?B?SythdXNDQ0YwRE5iYU1FOXB5NmQ4d0kzRnMrMXhPTHo2OU1KaG9rajFVeFQw?=
 =?utf-8?B?REVEY045UnErc2R3Z0Q1dVRpVUFyZCtyQU1Qcmhac3VycE9iZ1ZEOUh2MnNa?=
 =?utf-8?B?SGJwaFRLTWxJTVlhcnQ4WWRzeWk5MVo0Tkl6MDBJNVozRmNtcm9hUXpNajFM?=
 =?utf-8?B?WFRwZ0Z4bXBFemZRWVEyeEtkUHVZVVYyVTQxQUpvR1hpMXZ2eUd2cXY4V1Yv?=
 =?utf-8?B?dXhKSEhaaFlYT0VnVmhGUGNFNmVFNnJsM01FencyM29FSmlqM2JBRmF4cGRV?=
 =?utf-8?B?eFlJMlhGRG4xdHE5TUJ5aGhINHp6bHRqWWdvWTBtRUhvek93NG9ubGtkbW9p?=
 =?utf-8?B?OVQwMEFNS1B3MDRFendwcHlsUG1DMGN6c3hDa3FzSFRUSnFYSWNDOGtuMi9C?=
 =?utf-8?B?VG5ZRkFtTkh4YyswSzEyM3FWaW1XZ015dHVBM1NKSEY2OUFqTTN2WHp1NWtF?=
 =?utf-8?B?aE80c29lU0g2LzBBSGtlWkR1MEFXNGErQ0FEaG5jcG9XUi9HbHRTbTRic0dh?=
 =?utf-8?B?M0Z5Rk1FckNBVDc4dk5BL2NNVnlwM3k3bm84Ri9sQmhHeitQa2pZOG1mOEkv?=
 =?utf-8?B?bUlzSFpDVXFsRHdIcE1UWVM3VmJ3d2xpZVJHSXkrajljY0RUUW14MU00cUhK?=
 =?utf-8?B?dVYySkc5Wm5VbG8zSW1vZXBUQ0lPNzZ0NERaMzlDWEpwQnVYQUZHNmw1K2tx?=
 =?utf-8?B?YTY2eURiU1dFcFhxS1VTNERzYVdGUjRaYzkrRHd4Z2p6WjNXRFBHR3RlbDVP?=
 =?utf-8?B?WHZkUUJzWU9jUVlxaDVLc0dpcDlxK0NKUGRpaTZqK0Q5ZlVBYXlHRDlieWYr?=
 =?utf-8?B?cjU3VElodEpSZEVhMGpRRzFVQkFyWGhoZWtVOFNqNWdpUDBza2QyNUFSbGdG?=
 =?utf-8?B?L2hoQi9CYUFsclVMR25mVnphNzRNbXdsbjNKYzhHUzVoRGt5T1BDR09CN3k0?=
 =?utf-8?B?a3ZTVmlFYWYrajFLOE00VVp4TS9Nek1MS1JRZUJZMnNBOHhGZjBudXRZZG02?=
 =?utf-8?B?L1ZQczRycWp3SjExVnNxOFc1RzZiaVNCMlhCOEFqOVJxZTNZSDVMTndEUHJJ?=
 =?utf-8?B?UHBwd1JNS0cxRThreFFxd21jWENQRE1ubVpZMWlpREtxbnFNRi9NamlSU0tX?=
 =?utf-8?B?TFQzSFpaTjlPRm5RZnNYSndLa3hPWmhJRDRjN1pzd2lSVy93VUVnSHhWKzVn?=
 =?utf-8?B?bzVZVHJubitmVjRzbjZyYzlyMkwxUnFCbGNOWGlZOTRkUDd3TExMbmJRVCtL?=
 =?utf-8?B?SUY3ZFFxbkxaVDlPUUJrd2tpakRLczhRU0I0NTlpR21XU1V5U0JnY3Z6czZS?=
 =?utf-8?B?WUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9cf0f0-00ef-4fec-1abe-08dc2328a03f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 13:20:57.3290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dXlOuJpNo9yi0mHjIkszYp14VIdrUPl3Mc/erCf5gqIq9GY3mnEwiF0iFklXyXeHP8B9e6tPBcR6S+tbA+jgy0ws/Qk4lUKXVAnJLDRd7BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI5MTQ4LyAt
IFJlLXJlcG9ydGVkDQoNClJlLXJlcG9ydGVkIC0gRmkuQ0kuSUdUDQpBZGRyZXNzZWQgZmFpbHVy
ZXMgZnJvbSAtIENJLnhlQkFUDQoNClRoYW5rcywNClRlamFzcmVlDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51
eC5pbnRlbC5jb20+IA0KU2VudDogTW9uZGF5LCBKYW51YXJ5IDI5LCAyMDI0IDU6NDcgUE0NClRv
OiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IHZpdGFseS5wcm9zeWFrQGFtZC5j
b207IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBMR0NJIEJ1ZyBGaWxpbmcg
PGxnY2kuYnVnLmZpbGluZ0BpbnRlbC5jb20+OyBJbGxpcGlsbGksIFRlamFzcmVlWCA8dGVqYXNy
ZWV4LmlsbGlwaWxsaUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTog4pyXIENJLnhlQkFUOiBmYWls
dXJlIGZvciBzZXJpZXMgc3RhcnRpbmcgd2l0aCBbMS8zXSBsaWIvYW1kZ3B1OiBhZGQgc3VwcG9y
dCBmb3IgZ2FuZyBjcw0KDQpIaSBpZ3QtZGV2LA0KT24gMjAyNC0wMS0yNSBhdCAwNTo1NTo0MyAt
MDAwMCwgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4gU2Vy
aWVzOiBzZXJpZXMgc3RhcnRpbmcgd2l0aCBbMS8zXSBsaWIvYW1kZ3B1OiBhZGQgc3VwcG9ydCBm
b3IgZ2FuZyBjcw0KPiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9z
ZXJpZXMvMTI5MTQ4Lw0KPiBTdGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1bW1hcnkgPT0NCj4g
DQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gWEVJR1RfNzY5MV9CQVQgLT4gWEVJR1RQV18x
MDU4Nl9CQVQgDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAqKkZBSUxVUkUqKg0K
PiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBYRUlHVFBXXzEwNTg2
X0JBVCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICAN
Cj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRv
IHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIFhFSUdUUFdfMTA1ODZfQkFULCBw
bGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBt
b2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIA0K
PiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoNCAtPiA0KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4gDQo+ICAgTm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+
IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAg
SGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNl
ZCBpbiBYRUlHVFBXXzEwNTg2X0JBVDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+
ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEB4ZV9leGVjX2Zh
dWx0X21vZGVAdHdpY2UtYmluZGV4ZWNxdWV1ZS11c2VycHRyLXJlYmluZC1pbW06DQo+ICAgICAt
IGJhdC1wdmMtMjogICAgICAgICAgW1BBU1NdWzFdIC0+IFtJTkNPTVBMRVRFXVsyXQ0KPiAgICBb
MV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVF83NjkxL2Jh
dC1wdmMtMi9pZ3RAeGVfZXhlY19mYXVsdF9tb2RlQHR3aWNlLWJpbmRleGVjcXVldWUtdXNlcnB0
ci1yZWJpbmQtaW1tLmh0bWwNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvaW50ZWwteGUvSUdUUFdfMTA1ODYvYmF0LXB2Yy0yL2lndEB4ZQ0KPiBfZXhlY19m
YXVsdF9tb2RlQHR3aWNlLWJpbmRleGVjcXVldWUtdXNlcnB0ci1yZWJpbmQtaW1tLmh0bWwNCj4g
DQoNClVucmVsYXRlZCB0byBhbWRncHUsIG5vIG5lZWQgZm9yIHJlc3Bpbi4NCg0KUmVnYXJkcywN
CkthbWlsDQoNCj4gICANCj4gS25vd24gaXNzdWVzDQo+IC0tLS0tLS0tLS0tLQ0KPiANCj4gICBI
ZXJlIGFyZSB0aGUgY2hhbmdlcyBmb3VuZCBpbiBYRUlHVFBXXzEwNTg2X0JBVCB0aGF0IGNvbWUg
ZnJvbSBrbm93biBpc3N1ZXM6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMj
IElzc3VlcyBoaXQgIyMjIw0KPiANCj4gICAqIGlndEBrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmdA
YmFzaWM6DQo+ICAgICAtIGJhdC1hZGxwLTc6ICAgICAgICAgW1BBU1NdWzNdIC0+IFtETUVTRy1G
QUlMXVs0XSAoW0ludGVsIFhFIzEwMzNdKQ0KPiAgICBbM106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVF83NjkxL2JhdC1hZGxwLTcvaWd0QGttc19mcm9udGJ1
ZmZlcl90cmFja2luZ0BiYXNpYy5odG1sDQo+ICAgIFs0XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4
LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVFBXXzEwNTg2L2JhdC1hZGxwLTcvaWd0QGsNCj4g
bXNfZnJvbnRidWZmZXJfdHJhY2tpbmdAYmFzaWMuaHRtbA0KPiANCj4gICANCj4gICBbSW50ZWwg
WEUjMTAzM106IA0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5l
bC9pc3N1ZXMvMTAzMw0KPiANCj4gDQo+IEJ1aWxkIGNoYW5nZXMNCj4gLS0tLS0tLS0tLS0tLQ0K
PiANCj4gICAqIElHVDogSUdUXzc2OTEgLT4gSUdUUFdfMTA1ODYNCj4gICAqIExpbnV4OiB4ZS02
NzQtMDQ5NmZlMjBkOGVkNWU3M2VkMTg2ZDI5M2VmNjdlN2JhZTQ2NThlYiAtPiANCj4geGUtNjc5
LWU3ZGE4MjA1OTFjMzU1ZTU5MWZlODgwZmYxZTAyYjg1YTNmMWE0MTMNCj4gDQo+ICAgSUdUUFdf
MTA1ODY6IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA1
ODYvaW5kZXguaHRtbA0KPiAgIElHVF83NjkxOiA3NjkxDQo+ICAgeGUtNjc0LTA0OTZmZTIwZDhl
ZDVlNzNlZDE4NmQyOTNlZjY3ZTdiYWU0NjU4ZWI6IDA0OTZmZTIwZDhlZDVlNzNlZDE4NmQyOTNl
ZjY3ZTdiYWU0NjU4ZWINCj4gICB4ZS02NzktZTdkYTgyMDU5MWMzNTVlNTkxZmU4ODBmZjFlMDJi
ODVhM2YxYTQxMzogDQo+IGU3ZGE4MjA1OTFjMzU1ZTU5MWZlODgwZmYxZTAyYjg1YTNmMWE0MTMN
Cj4gDQo+ID09IExvZ3MgPT0NCj4gDQo+IEZvciBtb3JlIGRldGFpbHMgc2VlOiANCj4gaHR0cHM6
Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUvSUdUUFdfMTA1ODYvaW5kZXguaHRt
bA0K
