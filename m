Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B15FC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 14:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4DC10F0DE;
	Thu, 25 Jan 2024 14:11:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DA310F0DE
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 14:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706191894; x=1737727894;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QBIZfVi3ovqMLFYruaUqk2jR2FePeKoILKpzA5dQm8E=;
 b=anEtaND6t36DtkSUIHVLHZWml7xuS6CKLl7lunq30p1kmiBOl4r4q53R
 f34LKy+iIc7JggZJspYurSX1WzAYKdseYpYkMekTAg88/hHBe/+mLpEbt
 Zz0In1lw969MUH/4Y7CT6TEs0/ehmGxnxYvWuQVJEWoi0ovusi++MkkQE
 chJhlDQlw3CVEPYJZLsaD+iPWguIIhcK8uxGilazlCK/4HgSHNIVMwx1u
 ePWCCK2Ib41wMrMP9/HLfTvRhBBJ0Xg7Uov0ErvZ/QyERJu498VmbywI4
 q9m8r4hBSSYGul9smo5oNzYYCsaRV1mBB6UFEWgbrSJYz3x7jejIN7ZO7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401821292"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401821292"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 06:11:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2258665"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 06:11:34 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 06:11:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 06:11:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 06:11:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 06:11:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbV4dnRNCllhpsiVqeQNySlS62lONzIPdpa7vpig/5XXvjVul+jhb7UtcDv33/rDF7kgYfrZNtcMgEULvyoIYqknS1bMj4FT9gMz4zXoZypE2DlaAzd2qJgkcnzDtLn/Y/DOwzf0pbsqT7ORXc6JZEjK0ftml387XR80YpZCwN+5Tp9V/bEZLu5LXPMyIdcrirNpeHZwj503OrHT4E6zd1lYCfjI7H/OjmWoTAlrNc76SG40lxZr+lh9gYQe17MWR/u1tfWBs5vRtUJN28Nne6IKnnmELMpwNX4JWk6+CejxTsSEZdAa+yxxqeV1gGGThx7gN08xiESoqNN3oSWJaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBIZfVi3ovqMLFYruaUqk2jR2FePeKoILKpzA5dQm8E=;
 b=gSoGEjdW4+ZD2Pgm7DIqq6fM2T9+/cpDpw0hQcpJn04u6TBrdUJY7ALEHZw9O4JK4V9wrzRyZ4Sgwgz+3XjscBwlz0S/nLIG90ERVFNPsThpbKAfX6Ccv8uCpA0wjB6BGL/6ELGDtNOoUXC//tHb6vzaSk0GuGk0SYeHh84eVZe2WwoSDFtKSNtubYV0jZtwjxlDNsKtSeTZc1WbdHcQX3DyARBZjQJTkoqe5QC64NC9d8z6lRJwEy+tcq0Z565vuSPoNyDUqYSM+CblGGtX17Hmr6hMmlvxm8KyWE4N6QqKHKDl8YU61oz92oHyrZLJTRoozW2sS7nab4vpwvSyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 MW4PR11MB7162.namprd11.prod.outlook.com (2603:10b6:303:212::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Thu, 25 Jan 2024 14:11:30 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120%7]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 14:11:30 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 6/8] lib/intel_multigpu: Add
 xe_multi_fork_foreach_gpu
Thread-Topic: [PATCH i-g-t v2 6/8] lib/intel_multigpu: Add
 xe_multi_fork_foreach_gpu
Thread-Index: AQHaTwXey3qspVfqMkmJeCq4PWaiM7DqHuAwgABvM4CAAANRIA==
Date: Thu, 25 Jan 2024 14:11:30 +0000
Message-ID: <DS0PR11MB72645846B83C131F2C3D6C6AD97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240124204134.71451-1-kamil.konieczny@linux.intel.com>
 <20240124204134.71451-7-kamil.konieczny@linux.intel.com>
 <DS0PR11MB7264ABE771F3BB080E0A3595D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
 <20240125135449.kjqwdarmd6eumkx3@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240125135449.kjqwdarmd6eumkx3@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|MW4PR11MB7162:EE_
x-ms-office365-filtering-correlation-id: 7e284ea3-bc75-4817-7583-08dc1daf8760
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q5mkmERYbvJ2QDQWZPBkNVukz8671g3WSrbqg+7LYf9SLN5h/bkYYrRFJGWqGa0DTCodvOtSVmcFFszEiSx6pBR5KxFpEE1haVFJDcSYPE5K0Nfstz8CVcNQyUkOiaAckhpj2EdgePTln8PF5+8XLQ2HkkcG/seUOXCxGMqhmBUfHhsY69S+a3fPWTDKS5A2hmnY55gknUWF/PzyE6Y6PiwrzYGFe7udBhw1TGydNAmOjelgzKoMLjjmmnvv/7UHpS5DCQMjZdTA9GRuU+5jgKDCX+4k0zS3uqSwdT0hoQnbT9JHDIrj9B3xjEAjV/c/hn8DjMaRXfGf9y8fVSqHwb28CSg4X1MjR0bBUVrBm0aJkGrNrEVKVvlkouYp01wWdFIVD7NWuujc9MvDtoyL83NfzaK66UN9reZ8FDxWmVXxj0Ko8BOfZ0SeZZ7iz59JAf3r8WMHnMHovrgk04LuzEVglNwEIUj9Vnj5+VjSpGBkXorteAjjXcV/WVrKyHUz9Hp+vDcmSpcdxsjnM6tyXDjG7JqhBL8Xe9IbIxbkmeueFSjZ7/+FRjENXn19ZHVS5eMxNQjR5M2JuN5yah1dgFF5Ku3TqsqXJLm/EvD89d6hDXrTnSufPV3SxwFzEEIF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(55016003)(38070700009)(83380400001)(41300700001)(86362001)(82960400001)(33656002)(122000001)(38100700002)(52536014)(26005)(9686003)(66946007)(66476007)(53546011)(6506007)(7696005)(76116006)(66556008)(71200400001)(110136005)(316002)(66446008)(478600001)(64756008)(2906002)(5660300002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFZqZm5JQTR2WTd4a1E2aFFCZkNXQUFWS2NWakZFRWRyS0x6YVp3MHdyc21Z?=
 =?utf-8?B?eUtsMkRlMmhqc3lGWmU3ZkYrOEJFbzg5UXBpSVBiNW5rd1FSczJyWUF6R045?=
 =?utf-8?B?aU14UFROVlJIbEg3eW1iUURxbHdlZkdYNkxicXZnQWdZMFgxdjI5UElJK3du?=
 =?utf-8?B?T1psODdWSlU0RGVyQ1JKWnFwYjRRSDFZMGVqUGs0cnlzRGZsbDRoNWQ5QytB?=
 =?utf-8?B?UUpvVUV5NWZIODVPQlV6SUhueGdhck41SzRkZ09aeWhSOTJnNjV3UDJ0ZE5p?=
 =?utf-8?B?WWU3ZDZKL2dwWGVLbEcyUTNLV0VlZnNuZDdYdzFIZFlGcmZMZUV4dmgwQ2VU?=
 =?utf-8?B?QXZDb09pQXJJZk0xa2EyTlBla0tzOHRhNFhBNVk0SS9JcHk0aFlNRWFyVUVi?=
 =?utf-8?B?TkxIYUNTczQyY2RibUpPaW82aWZDNzVSZHNkQ3dSR2YrUWo4WDl1YVQrSlY0?=
 =?utf-8?B?YkpBSDRYSXUvcWZpZ0hyOGhSZUN4YytVdmQ1My9SSUUxSjhXMFhVU2FmV2ly?=
 =?utf-8?B?bTVKZngwUXpkYVZzbDZERUZiQ2JBTGpaSzNuOG11OGRKWDZZT0Q3Y1pTTUp5?=
 =?utf-8?B?Mzl3a2ZTMytkTk9WbG5mMmNPTEJmaVBsWk1xRVAwZlljbmliRWtHWDcxZ3FQ?=
 =?utf-8?B?V2ROMkQ4dkM5UitNVExyMS9zRXk0dHU4Q2RybmFZUUN4bWJxS0ZFN2IwQjI0?=
 =?utf-8?B?cWV3Z0NxODNKMmQrd1h4K2dSVk1kVXB2aTVHd0cySEdqWHBRaDZyZExCMVNx?=
 =?utf-8?B?UmlzUWdJRUVlYmhBc2JFU0VlL09HMWQrcGFtT0hZblZWREErWUsxS20yR21v?=
 =?utf-8?B?S1AyUXpLeU9ndFo0YXUrVFdUNitjUzZmUEMrUnhHQnVDMnYyV1UySFc4V0Jq?=
 =?utf-8?B?Ukp0YUl3YmpERDNEeThrcDV2QUhJenhWbHNPc21rdGg5ck9TUERsOGx4UnNh?=
 =?utf-8?B?ZWgyQ2c4YUlmYlhyWXRhTFJOQWtuS09qMXErb2ZnclhlNjBwK3lpRk9JWHlv?=
 =?utf-8?B?allGZU5Pd2REUjFLREREU2dCSk5OU3NTTGFRTWJFeUswaXhweUZ3VGlBWGxF?=
 =?utf-8?B?a2tablY0cGdwTHFnRTRpNFVJVlN1RVpGcFNUS0Z2QkxaTUQzOFk1dnpCRW83?=
 =?utf-8?B?UTkwMEp0RDZueUd5U0ZKMzVqQzg5UzdDeWxKTGl1RDZYNi91MFYxYnJxbWpi?=
 =?utf-8?B?ckRyblNNYmZZT05STWxtMXppYnFFUGp2ckQwSkt4UWUrVXRxNHdQT092MWgy?=
 =?utf-8?B?QjYzd0poUUZoQWRUVkJPeW1mejlFRjVvQS9RUGpaQzdBRnhsem1QQmJIMVNH?=
 =?utf-8?B?YnpFczVkdVBVOGRIZW14azlwbGdXUzVuQTFRU29MenpPTFk3QWhmUU1TaGxw?=
 =?utf-8?B?cmJpNXJ4UXZMa3RIQnNLaFZQMXUzZk1mTkk0K2tZUWVrQVg5aFBVdHA3VVNa?=
 =?utf-8?B?V2g2UWlZNElDSFZ4SUVtRmNCVlZYMzZDVHBIWnlwWjloanF6b3JRcXRRMVpO?=
 =?utf-8?B?blRTaGUvMmZKUHI3cmxDVkNFaGQvK1hoOTZsdHNncFYwVVhxU3NvQysrdElN?=
 =?utf-8?B?QVJMeS9OaFZ4TnBwNmZWT210NW5zN0xoYUVUV2pDR1ErdTVvSm5xMmJRRFRL?=
 =?utf-8?B?VGhJSWs2SWkrbGs3MlcwWExkMThYQjlSTmU5Tko0cndMM2t4ZGI0S1B2RW1J?=
 =?utf-8?B?aHNobXBseCtTemExd1BOeXRJSWJLMHBYZEQrZmJBMDFkeWt2bitic3dYTGNh?=
 =?utf-8?B?aEtaYTZ5azBrMFZDY0w3aWcwQk5DeVF1ZWs0Z1hSREROSmEzMXE0OTRkNVRI?=
 =?utf-8?B?VGNNNEVJZy94cS9waG12a3lLbU02elZiQXRLT2QyWUFuR2xXVDZGUytRVmhs?=
 =?utf-8?B?dzZXK1RvOHl1NGJBaVlQVEI2eVJvbVBCM3hUZ0Vxb2VNZzJrZWlac2hqL3V2?=
 =?utf-8?B?SUcrRDA4WElRZEordHFlb3dkYXN1dmE5WHVEQzY0K2c0TWl1SkU2bzZlTlg1?=
 =?utf-8?B?MVc4N3Q0T0lQRkFZcWpUdzdZdnA3M3hwazNGb21JRHFwTHNycURPS1Nwb1ZG?=
 =?utf-8?B?Zkl0K2dYc2cySHQ1enl1YkRTcjUyem5CTzlYUmtoRkJuK0ZCZHhsZ0xySmdr?=
 =?utf-8?B?TG1hZE9MbnNWZjhUK3ZROTRrSEwzK0VmclNtTENFYmc5TzNudDVQVnd5YjJj?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e284ea3-bc75-4817-7583-08dc1daf8760
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 14:11:30.7398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S69fwZVt0abV+t5nAUimH5q+qTwTa6gWQra+idOFnjcJHdQj/MQdDWKhcHc/GC4183GPLAOMZJoMxgXmTMRKdoW+gRbZpLGVUjw0l9sEdMZlFRi31rYjk82fRiOMDBQg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7162
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
c2RheSwgSmFudWFyeSAyNSwgMjAyNCAyOjU1IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogUGlhdGtvd3NraSwgRG9taW5payBLYXJvbCA8ZG9taW5pay5rYXJv
bC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2MiA2
LzhdIGxpYi9pbnRlbF9tdWx0aWdwdTogQWRkDQo+IHhlX211bHRpX2ZvcmtfZm9yZWFjaF9ncHUN
Cj4gDQo+IEhpIERvbWluaWssDQo+IA0KPiBPbiAyMDI0LTAxLTI1IGF0IDA3OjQzOjM1ICswMDAw
LCBQaWF0a293c2tpLCBEb21pbmlrIEthcm9sIHdyb3RlOg0KPiA+IEhpIEthbWlsLA0KPiA+DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogaWd0LWRldiA8aWd0
LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+ID4gPiBL
YW1pbCBLb25pZWN6bnkNCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAyNCwgMjAyNCA5
OjQyIFBNDQo+ID4gPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+IFN1
YmplY3Q6IFtQQVRDSCBpLWctdCB2MiA2LzhdIGxpYi9pbnRlbF9tdWx0aWdwdTogQWRkDQo+ID4g
PiB4ZV9tdWx0aV9mb3JrX2ZvcmVhY2hfZ3B1DQo+ID4gPg0KPiA+ID4gQ3JlYXRlIG1hY3JvIGZv
ciB0ZXN0aW5nIFhlIGRyaXZlciBpbiBtdWx0aWdwdSBzY2VuYXJpb3Mgd2l0aCB0aGUNCj4gPiA+
IGhlbHAgb2YgZmV3IG5ldyBtdWx0aWdwdSBmdW5jdGlvbnMuIEFsc28gd2hpbGUgYXQgdGhpcywg
YWRkDQo+ID4gPiBkb2N1bWVudGF0aW9uIGZvciBwdWJsaWMgZnVuY3Rpb25zIGFuZCB1c2UgbmV3
IGhlbHBlciBpbiBleGlzdGluZyBtdWx0aS0NCj4gZ3B1IG1hY3JvLg0KPiA+ID4NCj4gPiA+IHYy
OiBjb3JyZWN0ZWQgZGVzY3JpcHRpb24gKEthbWlsKSwgcmViYXNlZCBvbiBjb3JyZWN0ZWQgcGF0
Y2hlcw0KPiA+ID4gYWZ0ZXIgRG9taW5payByZXZpZXcNCj4gPiA+DQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+
ID4gPiAtLS0NCj4gPiA+ICBsaWIvaW50ZWxfbXVsdGlncHUuYyB8IDk0DQo+ID4gPiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiA+ID4gIGxpYi9pbnRlbF9t
dWx0aWdwdS5oIHwgMTIgKysrKystDQo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMDEgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL2lu
dGVsX211bHRpZ3B1LmMgYi9saWIvaW50ZWxfbXVsdGlncHUuYyBpbmRleA0KPiA+ID4gMGU3NmQ4
YWEzLi5lNjMxYWIwZWQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9saWIvaW50ZWxfbXVsdGlncHUuYw0K
PiA+ID4gKysrIGIvbGliL2ludGVsX211bHRpZ3B1LmMNCj4gPiA+IEBAIC00LDEwICs0LDE4IEBA
DQo+ID4gPiAgICovDQo+ID4gPg0KPiA+ID4gICNpbmNsdWRlICJkcm10ZXN0LmgiDQo+ID4gPiAr
I2luY2x1ZGUgImk5MTUvZ2VtLmgiDQo+ID4gPiAgI2luY2x1ZGUgImlndF9jb3JlLmgiDQo+ID4g
PiAgI2luY2x1ZGUgImlndF9kZXZpY2Vfc2Nhbi5oIg0KPiA+ID4gICNpbmNsdWRlICJpbnRlbF9t
dWx0aWdwdS5oIg0KPiA+ID4NCj4gPiA+ICsvKioNCj4gPiA+ICsgKiBnZW1fbXVsdGlncHVfY291
bnRfY2xhc3M6DQo+ID4gPiArICogQGNsYXNzOiBjaGlwc2V0LCBlLmcuIERSSVZFUl9YRSBvciBE
UklWRVJfSU5URUwNCj4gPiA+ICsgKg0KPiA+ID4gKyAqIEZ1bmN0aW9uIGNvdW50cyBudW1iZXIg
b2YgR1BVIGNhcmRzIHdpdGggdGhlIGhlbHAgb2Ygb3BlbmluZyBhbGwgb2YNCj4gdGhlbS4NCj4g
PiA+ICsgKiBSZXR1cm5zOiBudW1iZXIgb2YgR1BVcyBjYXJkcyBmb3VuZCAgKi8NCj4gPiA+ICBp
bnQgZ2VtX211bHRpZ3B1X2NvdW50X2NsYXNzKGludCBjbGFzcykgIHsNCj4gPiA+ICAJaW50IGNv
dW50ID0gMDsNCj4gPiA+IEBAIC0xOCw3ICsyNiw3IEBAIGludCBnZW1fbXVsdGlncHVfY291bnRf
Y2xhc3MoaW50IGNsYXNzKQ0KPiA+ID4gIAlyZXR1cm4gY291bnQ7DQo+ID4gPiAgfQ0KPiA+ID4N
Cj4gPiA+IC12b2lkIGdlbV9yZXF1aXJlX211bHRpZ3B1KGludCBjb3VudCkNCj4gPiA+ICtzdGF0
aWMgdm9pZCBza2lwX29uX3NpZ2xlX2dwdShpbnQgY291bnQpDQo+ID4NCj4gPiBOaXRwaWNrOiB0
eXBvDQo+ID4gSSBndWVzcyBpdCBzaG91bGQgYmUgbmFtZWQgInNraXBfb25fc2luZ2xlX2dwdSIu
DQo+ID4NCj4gDQo+IEdvb2QgcG9pbnQsIEkgbWlzc2VkIHRoYXQsIHdpbGwgZml4Lg0KPiANCj4g
PiA+ICB7DQo+ID4gPiAgCXN0cnVjdCBpZ3RfZGV2aWNlc19wcmludF9mb3JtYXQgZm10ID0gew0K
PiA+ID4gIAkJLnR5cGUgPSBJR1RfUFJJTlRfU0lNUExFLA0KPiA+ID4gQEAgLTI2LDkgKzM0LDYg
QEAgdm9pZCBnZW1fcmVxdWlyZV9tdWx0aWdwdShpbnQgY291bnQpDQo+ID4gPiAgCX07DQo+ID4g
PiAgCWludCBkZXZpY2VzOw0KPiA+ID4NCj4gPiA+IC0JaWYgKGlndF9kZXZpY2VfZmlsdGVyX2Nv
dW50KCkgPj0gY291bnQpDQo+ID4gPiAtCQlyZXR1cm47DQo+ID4gPiAtDQo+ID4NCj4gPiBBcyB0
aGlzIGNvbmRpdGlvbmFsIHJldHVybiB3YXMgbW92ZWQgdG8gZ2VtX3JlcXVpcmVfbXVsdGlncHUo
KSwgdGhhdA0KPiA+IGZ1bmN0aW9uIHdpbGwgd29yayBjb3JyZWN0bHkuIEFsdGhvdWdoLCBjYWxs
aW5nIHNraXBfb25fc2luZ2xlX2dwdSgpDQo+ID4gZGlyZWN0bHkgd2lsbCBhbHdheXMgY2F1c2Ug
YSBza2lwIGR1ZSB0byBhbHdheXMgcmVhY2hhYmxlIGlndF9za2lwLg0KPiA+IEkgc3VnZ2VzdCBj
aGFuZ2luZyBpZ3Rfc2tpcCB0byBpZ3Rfc2tpcF9vbiB0byBhdm9pZCB1bmV4cGVjdGVkDQo+ID4g
YmVoYXZpb3IgaW4gdGhlIGZ1dHVyZS4NCj4gDQo+IFdoYXQgYWJvdXQgY2hhbmdpbmcgdGhpcyBp
bnRvIHByaW50LW9ubHkgZnVuY3Rpb24gYW5kIG1vdmluZyBza2lwcyBkaXJlY3RseSBpbg0KPiBi
b3RoIGZ1bmN0aW9ucz8NCg0KQ2FuIHlvdSBkZXNjcmliZSBpdCBmdXJ0aGVyPw0KDQo+IA0KPiA+
DQo+ID4gQWRkaXRpb25hbGx5LCBza2lwX29uX3NpbmdsZV9ncHUgY2FuIGJlIHJlZmFjdG9yZWQg
dG8gbm90IHRha2UgYW55DQo+ID4gYXJndW1lbnRzLCBhcyB3ZSBhbHJlYWR5IGdldCB0aGUgbnVt
YmVyIG9mIGdwdXMgcHJlc2VudCBpbiB0aGUgc3lzdGVtLA0KPiA+IGFuZCB0YWtpbmcgcmVxdWly
ZWQgY291bnQgb2YgZ3B1cyBpcyBub3QgbmVlZGVkIChpdCBpcyBhbHdheXMgPjEpLg0KPiA+IFRo
ZSBpZGVhIGlzIHRvIHVzZSBpZ3Rfc2tpcF9vbiB3aGVuIGRldmljZXMgPCAyLg0KPiA+DQo+IA0K
PiBJdCB3YXMgYW4gb3B0aW1pemF0aW9uLCBJIHdhcyB0aGlua2luZyBhYm91dCBvdGhlciBkaXJl
Y3Rpb24sIGFkZGluZyBvbmUgbW9yZQ0KPiBwYXJhbWV0ZXIgdG8gaXQgYW5kIHByaW50aW5nOg0K
PiANCj4gbnVtYmVyIG9mIEdQVXMgd2FudGVkDQo+IHdoYXQgbnVtYmVyIG9mIEdQVXMgcHJvZ3Jh
bSBnb3QNCj4gbnVtYmVyIG9mIEdQVXMgYWZ0ZXIgUENJIGJ1cyBzY2FuDQo+IA0KPiBXaGF0IGRv
IHlvdSB0aGluaz8NCg0KT2ssIGJ1dCB0aGVuIHNraXBfb25fc2luZ2xlX2dwdSB3b24ndCBob2xk
IHRvIGl0cyBuYW1lLCB1bmxlc3MgeW91IG1lYW4gdGhlIGNoYW5nZSBpbiBnZW1fcmVxdWlyZV9t
dWx0aWdwdS4gUGxlYXNlIGZ1cnRoZXIgZGVzY3JpYmUgeW91ciBpZGVhLg0KDQpEb21pbmlrIEth
cm9sDQoNCj4gDQo+ID4gPiAgCWlndF9pbmZvKCJQQ0kgZGV2aWNlcyBhdmFpbGFibGUgaW4gdGhl
IHN5c3RlbTpcbiIpOw0KPiA+ID4NCj4gPiA+ICAJaWd0X2RldmljZXNfc2Nhbih0cnVlKTsNCj4g
PiA+IEBAIC0zNywzICs0Miw4NCBAQCB2b2lkIGdlbV9yZXF1aXJlX211bHRpZ3B1KGludCBjb3Vu
dCkNCj4gPiA+DQo+ID4gPiAgCWlndF9za2lwKCJUZXN0IHJlcXVpcmVzIGF0IGxlYXN0ICVkIEdQ
VXMsICVkIGF2YWlsYWJsZS5cbiIsIGNvdW50LA0KPiA+ID4gZGV2aWNlcyk7ICB9DQo+ID4gPiAr
DQo+ID4gPiArLyoqDQo+ID4gPiArICogZ2VtX3JlcXVpcmVfbXVsdGlncHU6DQo+ID4gPiArICog
QGNvdW50OiBtaW5pbXVtIG51bWJlciBvZiBHUFVzIHJlcXVpcmVkDQo+ID4gPiArICoNCj4gPiA+
ICsgKiBGdW5jdGlvbiBjaGVja3MgbnVtYmVyIG9mIGZpbHRlcmVkIEdQVSBjYXJkcy4NCj4gPiA+
ICsgKiBPbiBlcnJvciBza2lwcyBhbmQgcHJpbnRzIGF2YWlsYWJsZSBHUFVzIGZvdW5kIG9uIFBD
SSBidXMuDQo+ID4gPiArICovDQo+ID4gPiArdm9pZCBnZW1fcmVxdWlyZV9tdWx0aWdwdShpbnQg
Y291bnQpIHsNCj4gPiA+ICsJaWYgKGlndF9kZXZpY2VfZmlsdGVyX2NvdW50KCkgPj0gY291bnQp
DQo+ID4gPiArCQlyZXR1cm47DQo+ID4gPiArDQo+ID4gPiArCXNraXBfb25fc2lnbGVfZ3B1KGNv
dW50KTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArLyoqDQo+ID4gPiArICogbXVsdGlncHVf
YXF1aXJlX3ZpZXc6DQo+ID4gPiArICogQGdwdXNfd2FudGVkOiBtaW5pbXVtIG51bWJlciBvZiBH
UFVzIHJlcXVpcmVkDQo+ID4gPiArICogQGNoaXBzZXQ6IGNoaXBzZXQsIGUuZy4gRFJJVkVSX1hF
IG9yIERSSVZFUl9JTlRFTA0KPiA+ID4gKyAqDQo+ID4gPiArICogRnVuY3Rpb24gcHJlcGFyZXMg
ZmlsdGVyZWQgdmlldyBmb3IgR1BVIGNhcmRzIHdpdGggZ2l2ZW4gY2hpcHNldC4NCj4gPiA+ICsg
KiBPbiBlcnJvciBza2lwcyBhbmQgcHJpbnRzIGF2YWlsYWJsZSBHUFVzIGZvdW5kIG9uIFBDSSBi
dXMuDQo+ID4gPiArICogUmV0dXJuczogbnVtYmVyIG9mIEdQVXMgZm91bmQNCj4gPiA+ICsgKi8N
Cj4gPiA+ICtpbnQgbXVsdGlncHVfYXF1aXJlX3ZpZXcoaW50IGdwdXNfd2FudGVkLCB1bnNpZ25l
ZCBpbnQgY2hpcHNldCkgew0KPiA+DQo+ID4gTml0cGljazogdHlwbw0KPiA+IEkgZ3Vlc3MgaXQg
c2hvdWxkIGJlIG5hbWVkICJtdWx0aWdwdV9hY3F1aXJlX3ZpZXciIChpbiBmdW5jdGlvbiBuYW1l
IGFuZA0KPiBkb2N1bWVudGF0aW9uKS4NCj4gPg0KPiANCj4gSSB3aWxsIGZpeCB0aGlzLA0KPiAN
Cj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+ID4gRG9taW5payBLYXJvbA0KPiA+DQo+ID4gPiAr
CWludCBncHVfY291bnQgPSBkcm1fcHJlcGFyZV9maWx0ZXJlZF9tdWx0aWdwdShjaGlwc2V0KTsN
Cj4gPiA+ICsNCj4gPiA+ICsJaWd0X2Fzc2VydChncHVzX3dhbnRlZCA+IDEpOw0KPiA+ID4gKwlp
ZiAoZ3B1X2NvdW50IDwgZ3B1c193YW50ZWQpDQo+ID4gPiArCQlza2lwX29uX3NpZ2xlX2dwdShn
cHVzX3dhbnRlZCk7DQo+ID4gPiArDQo+ID4gPiArCXJldHVybiBncHVfY291bnQ7DQo+ID4gPiAr
fQ0KPiA+ID4gKw0KPiA+ID4gKy8qKg0KPiA+ID4gKyAqIG11bHRpZ3B1X29wZW5fYW5vdGhlcjoN
Cj4gPiA+ICsgKiBAaWR4OiBpbmRleCBvZiBHUFUgY2FyZCwgc3RhcnRpbmcgZnJvbSAwDQo+ID4g
PiArICogQGNoaXBzZXQ6IGNoaXBzZXQsIGUuZy4gRFJJVkVSX1hFIG9yIERSSVZFUl9JTlRFTA0K
PiA+ID4gKyAqDQo+ID4gPiArICogRnVuY3Rpb24gb3BlbnMgR1BVIGNhcmQgd2l0aCBkcm1fb3Bl
bl9kcml2ZXJfYW5vdGhlcigpLiBGb3IgaTkxNQ0KPiA+ID4gK2l0IGNoZWNrcw0KPiA+ID4gKyAq
IGlmIG9wZW5lZCBjYXJkIGlzIGZ1bmN0aW9uYWwuIFNraXBzIG9uIGVycm9ycy4NCj4gPiA+ICsg
KiBSZXR1cm5zOiBvcGVuZWQgZmQgZm9yIEBpZHggY2FyZCAgKi8gaW50DQo+ID4gPiArbXVsdGln
cHVfb3Blbl9hbm90aGVyKGludCBpZHgsIHVuc2lnbmVkIGludCBjaGlwc2V0KSB7DQo+ID4gPiAr
CWludCBmZDsNCj4gPiA+ICsNCj4gPiA+ICsJaWd0X2Fzc2VydChpZHggPj0gMCk7DQo+ID4gPiAr
CWZkID0gZHJtX29wZW5fZHJpdmVyX2Fub3RoZXIoaWR4LCBjaGlwc2V0KTsNCj4gPiA+ICsNCj4g
PiA+ICsJaWd0X3JlcXVpcmUoZmQgIT0gLTEpOw0KPiA+ID4gKwlpZiAoY2hpcHNldCA9PSBEUklW
RVJfSU5URUwpDQo+ID4gPiArCQlpZ3RfcmVxdWlyZV9nZW0oZmQpOw0KPiA+ID4gKw0KPiA+ID4g
KwlyZXR1cm4gZmQ7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gKy8qKg0KPiA+ID4gKyAqIG11
bHRpZ3B1X29wZW5fZmlsdGVyZWRfY2FyZDoNCj4gPiA+ICsgKiBAaWR4OiBpbmRleCBvZiBHUFUg
Y2FyZCwgc3RhcnRpbmcgZnJvbSAwDQo+ID4gPiArICogQGNoaXBzZXQ6IGNoaXBzZXQsIGUuZy4g
RFJJVkVSX1hFIG9yIERSSVZFUl9JTlRFTA0KPiA+ID4gKyAqDQo+ID4gPiArICogRnVuY3Rpb24g
b3BlbnMgR1BVIGNhcmQgcHJlcGFyZWQgd2l0aCBmaWx0ZXJlZCB2aWV3LiBJdCBhbHNvDQo+ID4g
PiArY2hlY2tzIGlmDQo+ID4gPiArICogb3BlbmVkIGNhcmQgYWdyZWVzIHdpdGggZGVzaXJlZCBj
aGlwc2V0IG9yIGNoZWNrcyBpZiBvcGVuZWQgY2FyZA0KPiA+ID4gK2lzDQo+ID4gPiArICogZnVu
Y3Rpb25hbC4gU2tpcHMgb24gZXJyb3JzLg0KPiA+ID4gKyAqIFJldHVybnM6IG9wZW5lZCBmZCBm
b3IgQGlkeCBjYXJkICAqLyBpbnQNCj4gPiA+ICttdWx0aWdwdV9vcGVuX2ZpbHRlcmVkX2NhcmQo
aW50IGlkeCwgdW5zaWduZWQgaW50IGNoaXBzZXQpIHsNCj4gPiA+ICsJaW50IGZkID0gZHJtX29w
ZW5fZmlsdGVyZWRfY2FyZChpZHgpOw0KPiA+ID4gKw0KPiA+ID4gKwlpZ3RfcmVxdWlyZShmZCAh
PSAtMSk7DQo+ID4gPiArCWlmIChjaGlwc2V0ID09IERSSVZFUl9YRSkNCj4gPiA+ICsJCWlndF9y
ZXF1aXJlX3hlKGZkKTsNCj4gPiA+ICsJZWxzZSBpZiAoY2hpcHNldCA9PSBEUklWRVJfSU5URUwp
DQo+ID4gPiArCQlpZ3RfcmVxdWlyZV9nZW0oZmQpOw0KPiA+ID4gKw0KPiA+ID4gKwlyZXR1cm4g
ZmQ7DQo+ID4gPiArfQ0KPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9tdWx0aWdwdS5oIGIv
bGliL2ludGVsX211bHRpZ3B1LmggaW5kZXgNCj4gPiA+IDBlYmM3M2U0YS4uMDAzMmE2MTllIDEw
MDY0NA0KPiA+ID4gLS0tIGEvbGliL2ludGVsX211bHRpZ3B1LmgNCj4gPiA+ICsrKyBiL2xpYi9p
bnRlbF9tdWx0aWdwdS5oDQo+ID4gPiBAQCAtMTIsNiArMTIsMTAgQEANCj4gPiA+ICB2b2lkIGdl
bV9yZXF1aXJlX211bHRpZ3B1KGludCBjb3VudCk7ICBpbnQNCj4gPiA+IGdlbV9tdWx0aWdwdV9j
b3VudF9jbGFzcyhpbnQgY2xhc3MpOw0KPiA+ID4NCj4gPiA+ICtpbnQgbXVsdGlncHVfYXF1aXJl
X3ZpZXcoaW50IG1pbl9ncHVzX3dhbnRlZCwgdW5zaWduZWQgaW50DQo+ID4gPiArY2hpcHNldCk7
IGludCBtdWx0aWdwdV9vcGVuX2Fub3RoZXIoaW50IGlkeCwgdW5zaWduZWQgaW50IGNoaXBzZXQp
Ow0KPiA+ID4gK2ludCBtdWx0aWdwdV9vcGVuX2ZpbHRlcmVkX2NhcmQoaW50IGlkeCwgdW5zaWdu
ZWQgaW50IGNoaXBzZXQpOw0KPiA+ID4gKw0KPiA+ID4gICNkZWZpbmUgaWd0X2ZvcmVhY2hfZ3B1
KGZkX18sIGlkX18pIFwNCj4gPiA+ICAJZm9yIChpbnQgaWd0X3VuaXF1ZShpKSA9IDAsIGZkX187
IFwNCj4gPiA+ICAJCShmZF9fID0gX19kcm1fb3Blbl9kcml2ZXJfYW5vdGhlcihpZ3RfdW5pcXVl
KGkpKyssIGlkX18pKSA+PQ0KPiAwOyBcDQo+ID4gPiBAQCAtMTksOCArMjMsMTQgQEAgaW50IGdl
bV9tdWx0aWdwdV9jb3VudF9jbGFzcyhpbnQgY2xhc3MpOw0KPiA+ID4NCj4gPiA+ICAjZGVmaW5l
IGlndF9tdWx0aV9mb3JrX2ZvcmVhY2hfZ3B1KF9fZmQsIF9faWQpIFwNCj4gPiA+ICAJaWd0X211
bHRpX2ZvcmsoaWd0X3VuaXF1ZShfX2kpLCBnZW1fbXVsdGlncHVfY291bnRfY2xhc3MoX19pZCkp
IFwNCj4gPiA+IC0JCWZvciAoaW50IF9fZmQgPSBkcm1fb3Blbl9kcml2ZXJfYW5vdGhlcihpZ3Rf
dW5pcXVlKF9faSksDQo+ID4gPiBfX2lkKTsgXA0KPiA+ID4gKwkJZm9yIChpbnQgX19mZCA9IG11
bHRpZ3B1X29wZW5fYW5vdGhlcihpZ3RfdW5pcXVlKF9faSksIF9faWQpOw0KPiA+ID4gXA0KPiA+
ID4gIAkJCV9fZmQgPj0gMDsgXA0KPiA+ID4gIAkJCWNsb3NlKF9fZmQpLCBfX2ZkID0gLTEpIFwN
Cj4gPiA+DQo+ID4gPiArI2RlZmluZSB4ZV9tdWx0aV9mb3JrX2ZvcmVhY2hfZ3B1KF9fZmQsIF9f
Z3B1X2luZGV4KSBcDQo+ID4gPiArCWlndF9tdWx0aV9mb3JrKF9fZ3B1X2luZGV4LCBtdWx0aWdw
dV9hcXVpcmVfdmlldygyLCBEUklWRVJfWEUpKSBcDQo+ID4gPiArCQlmb3IgKGludCBfX2ZkID0g
bXVsdGlncHVfb3Blbl9maWx0ZXJlZF9jYXJkKF9fZ3B1X2luZGV4LA0KPiA+ID4gRFJJVkVSX1hF
KTsgXA0KPiA+ID4gKwkJCV9fZmQgPj0gMDsgXA0KPiA+ID4gKwkJCWRybV9jbG9zZV9kcml2ZXIo
X19mZCksIF9fZmQgPSAtMSkgXA0KPiA+ID4gKw0KPiA+ID4gICNlbmRpZiAvKiBfX0lOVEVMX01V
TFRJR1BVX0ggKi8NCj4gPiA+IC0tDQo+ID4gPiAyLjQyLjANCj4gPg0K
