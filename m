Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8742C4725D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 14:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D3010E190;
	Fri, 19 Jan 2024 14:48:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0009410E190
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705675678; x=1737211678;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5aocT5H7S1yIk4g/mIvEIaRJhiojgoc4WXXNTwW3qc8=;
 b=et8CwXW8XbGbUH+grZ9Kpi19iwfuU9ahNDeMHtWBYjgxYyFOcfxKJl12
 kZY4QQkgT/ztt0N27BvA6mJe1Y2Ma47OmoWxyroxUEgobJ9karibDLng7
 +mQj/He8UDxSkGohC9f5Uu/Aaz2Yujl1YSVklQF8EuFlRPsGozRhZE2YQ
 DpLoMXVHVkBjozNuTevio3LmZOxnPdP6XaXB8vQn0jQMoxJjFO+qg9J4j
 SFTPj9+NU5AUfjFasL8jMGoIjCb+fZ0WpkIO8QqspdFr6a//z9karhn76
 CjXY6t3KxTqKQTvW4ppY0YqKyt/N/kV6Cckg97xcyvhRfLJV+NUFQ3tDF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="399627790"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="399627790"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 06:47:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="908345854"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="908345854"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 06:47:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 06:47:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 06:47:56 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 06:47:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APkeOYdpm0SIfmUPB3aAUH1AtZUwsJWjbKg+ILncOqL+vBadEcsPDuSkKWjVw6x0XQ3+LRbC1YULIJpmS6ElRsEfeT1L+xL2ysMb3WW9pdBM52i5v8xDQE1gjDqwwD5jZDW5AqzqsUTuxXoF3BmHEMO3eLO7+bwk6ka522ibdvppmeAWfGxVpW9MDqGo/5uIMoolL7ME91J4nODYRYh+G7UxHiX6D1B/VPoLBYgQmoJiC/y4EnqwjtsgVqPCHwecYtvI9nkWhjy8tpyraMXysPX6TvON6Mj0A2lemfMa/qx6q1WA+qJ7KhORchRgVpApl9j0jxo1AVRYy0Cm+w7teA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aocT5H7S1yIk4g/mIvEIaRJhiojgoc4WXXNTwW3qc8=;
 b=ns9Hqw637JKw91HudN2ZcWSKQ91AGNtHtQwVTwrN9cb1wZOrbExWY2Ru7fzMtQ1MQ6GWg6HOjT+ka9OUb8JXxZfbm3+ZD0+GwEf+AQzW1LxtoiygD+ca8tvH8gT3IUdflOmFNBgPo6yflEJd0xqvmG/RYOGGxc2WpfzxZa+2QMP+T0VyDo/27gvYtLiZdXZ0MRuYby6K6vBP7tm4WiuMD25DgQtnvcLS+EhcdMsRcJjb2fwjieqnrVYBbUPg62W2Lsfm1v4t/aLr1/CR23sYfqiVgg6qB793NZ496b2r8uh9dTMQMBwzsHmPsRLxpdG91w8EkdynArW7+WPaYZeubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 14:47:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7181.031; Fri, 19 Jan 2024
 14:47:53 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [PATCH i-g-t v4 2/4] lib/igt_pm: Add helper to get/set
 auto_suspenddelay_ms
Thread-Topic: [PATCH i-g-t v4 2/4] lib/igt_pm: Add helper to get/set
 auto_suspenddelay_ms
Thread-Index: AQHaNCucZkvLbEVxNU2UpiUwFYF0wLC95LOAgCN2D4CAAAnagA==
Date: Fri, 19 Jan 2024 14:47:53 +0000
Message-ID: <90e04338b0bcb55504733504d5642c699086d2e6.camel@intel.com>
References: <20231221163338.2157257-1-anshuman.gupta@intel.com>
 <20231221163338.2157257-3-anshuman.gupta@intel.com>
 <ZYzEGVSh0WbrGyeH@intel.com>
 <CY5PR11MB621114B6F0AA5A5B872887DF95702@CY5PR11MB6211.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB621114B6F0AA5A5B872887DF95702@CY5PR11MB6211.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|MN2PR11MB4661:EE_
x-ms-office365-filtering-correlation-id: 8b38dd27-013c-4d04-1fd4-08dc18fd9dd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e9ZEz7Pj//t0+764Pt+GHCsWQS4WLKKi21vGWKcT7Oz/+vImw1KyKZcIP7sXHWi1sT3PaBKzOGgHy7GznW7zcLV8QsAfGEnpYmQuHKL1By/OEB0nOSVoH9jBUSRH2dFZ65JHqcqmOy3cEjKvvtYXF3WDZWRAmBYhOs2t28G4h3VOfLWWl+ySxyCUP1/frTbm9YwfIovwUU3jKMNzPq/uX9rPvpIxjSRhFCariVOEJPx9PG8qlEx2/wOruLJQY6vNX2fDobBHGO4cYM4ZOROHLHWozRQP1/yGwCy1xzOcfi2vkYG3NOIzv4t1+1NYy5GG4mGavFIIzbiTlWzY0vTiTnnpC0qXFca1FO8fcaSj9rVN43E3WEnIogaPLBL1hNKMWu9xZmFmr2ltXiPHGGchBt9gcyFlzLOMT6bH4H6RMniCeP0P+S9Q455t9Kmks9bf9UEwocgEyBPRiTgnq48705kXp9aUM2qAxaj4uPBU36Q1MCpBfv7XjRwTasZwvDgafGZ5HT02ILcSzXRGXdEwytZGwDkuGmhUBUs49LN1QqgiwRrhnmEjH7yjUBN/iDolfVRS7SxWRD4gc0PLuM3DyOlBVjYW525Uw3IV47bBv0Sd+qnH2x4FKmduDNEnjKcp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(376002)(366004)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(38100700002)(122000001)(2906002)(36756003)(86362001)(41300700001)(82960400001)(316002)(91956017)(6636002)(71200400001)(478600001)(66476007)(64756008)(66946007)(66446008)(54906003)(66556008)(37006003)(76116006)(6506007)(6512007)(53546011)(6486002)(8936002)(4326008)(8676002)(6862004)(5660300002)(83380400001)(2616005)(107886003)(26005)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3hKSWxxVVplb1AxZVo5aVpLZkQ1RFppeWc1RStQTEVuRXpSNzNqdllpODlx?=
 =?utf-8?B?SmhTNExJWlp2YWFZM0g2emEzcTJzanpMRko0SzZpemRzWUR2dnozczA5WTBM?=
 =?utf-8?B?Mm9oZVRGODB6VzdVM3lZZ2lLRkd2eFg2WXErRU1UZTd2T3NocVdMeXdONE9N?=
 =?utf-8?B?bXgyVXllWGVCQnJ3OFBWSTE1ZUVGVFF2V240MGNHZXQvZTdIY1V1OVZNVTBV?=
 =?utf-8?B?c2k2dnBHaFZnQThYWEJhNE03Q2lvRlZRQi8rcTB2aHFwbVhHV0NzZVdmMTRi?=
 =?utf-8?B?ZStsa0phaUVzdm1PbGRrOHZ4amxXUUpJVVA4TWZuREFlUUtFNjlyY0Q2N3lG?=
 =?utf-8?B?TXZKUkxSNmxVcjRscms0QWdBUm1GcFlPbWwzK0NJbGJtdWQ2Z1VsL1Q3STI3?=
 =?utf-8?B?LzFZeUN4aVBvOW43dml3MHFnZ0tZKzdpeDAzZW5obnZFVTRuaU1Kbm9lRVFK?=
 =?utf-8?B?TGR5aWpWeWt4dHJkbDhmQUZoVUxuQUhlNWd4Ujhrck42TUlWTFEyQ3FCaVBr?=
 =?utf-8?B?OTNJNzhrVk1YZDI2YzJ2YW1tcnI0N2djV29adms5ZkFXMklLbUk4ZTZJV1FH?=
 =?utf-8?B?MzYyc2plWk93VlRIMkIvUjNvblhyMTlDc1RJdC8wa0tjUXRCSnFTblpFVHVL?=
 =?utf-8?B?YUpFdlVyaXUxTjY5Wndqck9WcTZzOVdlSlVrYVNOOXFhb0xVY1FMb1p5Qnh4?=
 =?utf-8?B?WmdSc21BdlpyMlpBYTlJZkxLUUpScjR2aFlweUJmQWNiWlBRV2hRS3JVSktY?=
 =?utf-8?B?eG5YM0FYdzdRSTRwT3lrLzNDakY3YnFuRnBDcUdHbGFwaFYxV0lHR2dVa2xk?=
 =?utf-8?B?dUNNaHlkVEVLUkZlN1FBdE1RYVRkTVlEekQ3ckg0b05pUGxPUDJGdVpsTTR0?=
 =?utf-8?B?Y3FOc2NnSE9yNW9yUGJ0akl2YnBNYnVXZGo5dC9QVXR5bmR6QWJySVlpbE8z?=
 =?utf-8?B?ajVPdDc2Mk9pYWl5YWtyeSt2SEZ2ZzM5TUkyQXN3elRMVEFxL0ZNaVhHcXA1?=
 =?utf-8?B?bFB4WGlpQjVvUGF5NnNsbVJTQzZ5SHVvTzJyczFyVnFPRjVxL2xxR0JGbTI0?=
 =?utf-8?B?NTdMN0VYbmk3cGNybmJJcGpCV3hUSVNwWFZqempnSUxBb2t1UnRWcEw5ZUt5?=
 =?utf-8?B?cWorQWZ6SzVWeFRhY0ZXQzlvOTVxWFNMU2tud2EzQ1Rpd0NqVzJsQXJCL0hj?=
 =?utf-8?B?ZjRlWXBEN3NqNDNVTHlnakR6d3hPRDZwNW9XbHlYOC9KaHlwczJJbTczM1g0?=
 =?utf-8?B?REFSVGRLU1FIYzlIU2JZMnNXbncyclhaKzdyWHVUbWVDbG41NEtRcFBDYXRX?=
 =?utf-8?B?dUJ3MWNsemo3MHV3TlFHb0gyK1RWNU5ocGxRemhIQXhQQmFLVVJNYndiVTUy?=
 =?utf-8?B?aGNmdzdmcDhOaVZTZFZCQ2tuNTcvd3luaDBzTVRjQ3R4MW1Pa3Z4aFcvckVi?=
 =?utf-8?B?akVndkdTdGdGQm9GUFNwYzZqNU9jTEM2YlVadVJpN250R2o4b21lQUlQcGV0?=
 =?utf-8?B?Wi92dllrNC8yV1RzSjV6b1ZqMTlqdzZ2YmtxNlJnT2U3d0kwdWZnTGN6QVRm?=
 =?utf-8?B?S1hLYUlobS9pZGIrZUM0RFE0Z2pmV0hTcFZSWDFYYk9TUWx1SDVHdzNmclAr?=
 =?utf-8?B?TEdFSEcyYkw5aVJxZkxVZ3lsYUlFc245UTB3T1FnYWsyaVEwMUt4b2MvVEhE?=
 =?utf-8?B?Ukx4blFMUG15VXQwdHNRSjhpQ085eWg1ZG9FVjVFMm1aTEl2cUJSb3htVjZD?=
 =?utf-8?B?eVUvZ1djNERQbENkcXppSkZoUnRZUXlqbFV3ZDA4QUlsS05RQW1NcWsrN21C?=
 =?utf-8?B?UVp6TWFDdjZqb2tIa1BlY3FLbnVnSEhYNEVWaU82bllOd005dmUraXp4MDR1?=
 =?utf-8?B?MFZmZmFkbkcrNnhLVnVNQlhwbEZHbkFkT3RzSTN6a3lPeXc3THVwYW9NQlRJ?=
 =?utf-8?B?cmd0QUpmS2RsclZwMFQzaU54VGlsbGtzVFRjTWVaS2E3eFBUNklSOU16eVB2?=
 =?utf-8?B?U1ZHclU0WW1yL2VYQmU2UWN5ZW5Qc3ZSZlZxS2FIVnJSL0ZQZFJKYzY2VW5r?=
 =?utf-8?B?K3kwYWQ0aFNveVBPdkxqd0ZURVMrRmVUK1ZlVXpKMkl2RlFYZFNqTzdybW5I?=
 =?utf-8?B?cGxTYkxhd3o0S2YxUkZ2RzZCUjUrNDlNbVhvWTVveXc2azJtMWNOcjdkcGlq?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA81E5EE5FD9A04689051734938AE8A9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b38dd27-013c-4d04-1fd4-08dc18fd9dd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 14:47:53.3278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Urxq1+NcUMU54eXiRc154JFYgNvivMwnfowKq/Retf/ecuNC30n8hrPZL+rUQRrADtodvqCQX/Hb8TD1/MGLLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDI0LTAxLTE5IGF0IDE0OjEyICswMDAwLCBHdXB0YSwgQW5zaHVtYW4gd3JvdGU6
DQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFZpdmks
IFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gU2VudDogVGh1cnNkYXksIERl
Y2VtYmVyIDI4LCAyMDIzIDY6MTEgQU0NCj4gPiBUbzogR3VwdGEsIEFuc2h1bWFuIDxhbnNodW1h
bi5ndXB0YUBpbnRlbC5jb20+DQo+ID4gQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBUYXVybywgUmlhbmENCj4gPiA8cmlhbmEudGF1cm9AaW50ZWwuY29tPjsNCj4gPiBOaWxhd2Fy
LCBCYWRhbCA8YmFkYWwubmlsYXdhckBpbnRlbC5jb20+OyBLb25pZWN6bnksIEthbWlsDQo+ID4g
PGthbWlsLmtvbmllY3pueUBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWct
dCB2NCAyLzRdIGxpYi9pZ3RfcG06IEFkZCBoZWxwZXIgdG8gZ2V0L3NldA0KPiA+IGF1dG9fc3Vz
cGVuZGRlbGF5X21zDQo+ID4gDQo+ID4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6MDM6MzZQ
TSArMDUzMCwgQW5zaHVtYW4gR3VwdGEgd3JvdGU6DQo+ID4gPiBTb21ldGltZXMgd2Ugd2FudCB0
byB0ZXN0IHBtIGlndCB0ZXN0IHdpdGggYW4gZXhwbGljaXQgYXV0bw0KPiA+ID4gc3VzcGVuZA0K
PiA+ID4gZGVsYXksIHRoZXJlZm9yZSBhZGRpbmcgaGVscGVycyB0byBnZXQvc2V0IHRoZSBwY2lf
ZGV2DQo+ID4gPiBhdXRvX3N1c3BlbmRkZWxheV9tcy4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogQW5zaHVtYW4gR3VwdGEgPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT4NCj4gPiANCj4g
PiBSZXZpZXdlZC1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+
IA0KPiA+IHdlIGFsc28gbmVlZCB0byBjaGFuZ2UgdGhlIGRlZmF1bHQgdmFsdWUgZnJvbSAwIHRv
IDEgYXQgbGVhc3QsIGFuZA0KPiA+IHRoZW4gc2VlDQo+ID4gaG93IG11Y2ggbW9yZSB0aW1lIG1h
Y2hpbmUgd2UgdXNlLiBCdXQgMCBpcyB1bnJlYWxpc3RpYy4NCj4gVGhhbmtzIFJvZHJpZ28gZm9y
IFJCLg0KPiBZb3UgbWVhbiAxbXMgb3IgMSBzZWNvbmQgPw0KDQpvcHMsIHllYXAsIEkgbWVudGlv
bmVkIDFzZWNvbmQuIEJ1dCB3ZSBtaWdodCBhdHRlbXB0IHNvbWUgc21hbGxlcg0Kb25lcyBsaWtl
IDUwMG1zPyEgMjAwbXM/DQoNCj4gVGhhbmtzLA0KPiBBbnNodW1hbiBHdXB0YS4NCj4gPiANCj4g
PiA+IC0tLQ0KPiA+ID4gwqBsaWIvaWd0X3BtLmMgfCA1Mw0KPiA+ID4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiA+ID4gwqBsaWIvaWd0X3Bt
LmggfMKgIDIgKysNCj4gPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCAx
MiBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcG0uYyBi
L2xpYi9pZ3RfcG0uYyBpbmRleA0KPiA+ID4gYzJkOThmY2ViLi5kNDM2YzJjNTANCj4gPiA+IDEw
MDY0NA0KPiA+ID4gLS0tIGEvbGliL2lndF9wbS5jDQo+ID4gPiArKysgYi9saWIvaWd0X3BtLmMN
Cj4gPiA+IEBAIC0xMDY4LDE4ICsxMDY4LDYgQEAgc3RhdGljIHZvaWQgaWd0X3BtX3dyaXRlX3Bv
d2VyX2F0dHIoaW50DQo+ID4gPiBmZCwNCj4gPiBjb25zdCBjaGFyICp2YWwsIGludCBsZW4pDQo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydChzdHJuY21wKGJ1ZiwgdmFsLCBsZW4pID09
IDApO8KgIH0NCj4gPiA+IA0KPiA+ID4gLXN0YXRpYyBpbnQgaWd0X3BtX2dldF9hdXRvc3VzcGVu
ZF9kZWxheShzdHJ1Y3QgcGNpX2RldmljZQ0KPiA+ID4gKnBjaV9kZXYpDQo+ID4gPiAtew0KPiA+
ID4gLcKgwqDCoMKgwqDCoMKgY2hhciBkZWxheV9zdHJbNjRdOw0KPiA+ID4gLcKgwqDCoMKgwqDC
oMKgaW50IGRlbGF5LCBkZWxheV9mZDsNCj4gPiA+IC0NCj4gPiA+IC3CoMKgwqDCoMKgwqDCoGRl
bGF5X2ZkID0gaWd0X3BtX2dldF9wb3dlcl9hdHRyX2ZkKHBjaV9kZXYsDQo+ID4gImF1dG9zdXNw
ZW5kX2RlbGF5X21zIik7DQo+ID4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoaWd0X3BtX3JlYWRfcG93
ZXJfYXR0cihkZWxheV9mZCwgZGVsYXlfc3RyLCA2NCwNCj4gPiA+IHRydWUpKQ0KPiA+ID4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9hc3NlcnQoc3NjYW5mKGRlbGF5X3N0ciwg
IiVkIiwgJmRlbGF5KSA+IDApOw0KPiA+ID4gLQ0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgcmV0dXJu
IGRlbGF5Ow0KPiA+ID4gLX0NCj4gPiA+IC0NCj4gPiA+IMKgc3RhdGljIHZvaWQNCj4gPiA+IMKg
aWd0X3BtX3NldHVwX3BjaV9kZXZfcG93ZXJfYXR0cnMoc3RydWN0IHBjaV9kZXZpY2UgKnBjaV9k
ZXYsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpZ3RfcG1fcGNpX2Rldl9wd3JhdHRyDQo+ID4gPiAq
cHdyYXR0ciwgaW50DQo+ID4gZGVsYXlfbXMpIEBAIC0xMTY1LDYNCj4gPiA+ICsxMTUzLDQ3IEBA
IGlndF9wbV9zZXR1cF9wY2lfY2FyZF9wb3dlcl9hdHRycyhzdHJ1Y3QgcGNpX2RldmljZQ0KPiA+
ICpwY2lfZGV2LCBib29sIHNhdmVfYXR0cnMsIGkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBwY2lf
aXRlcmF0b3JfZGVzdHJveShpdGVyKTsNCj4gPiA+IMKgfQ0KPiA+ID4gDQo+ID4gPiArLyoqDQo+
ID4gPiArICogaWd0X3BtX2dldF9hdXRvc3VzcGVuZF9kZWxheToNCj4gPiA+ICsgKiBAcGNpX2Rl
djogcGNpX2Rldi4NCj4gPiA+ICsgKiBHZXQgcGNpX2RldiBhdXRvc3VzcGVuZCBkZWxheSB2YWx1
ZSBmcm9tIHBjaSBzeXNmcw0KPiA+ICJhdXRvc3VzcGVuZF9kZWxheV9tcyIuDQo+ID4gPiArICoN
Cj4gPiA+ICsgKiBSZXR1cm5zOg0KPiA+ID4gKyAqIGF1dG9zdXNwZW5kX2RlbGF5X21zLg0KPiA+
ID4gKyAqLw0KPiA+ID4gK2ludCBpZ3RfcG1fZ2V0X2F1dG9zdXNwZW5kX2RlbGF5KHN0cnVjdCBw
Y2lfZGV2aWNlICpwY2lfZGV2KSB7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBjaGFyIGRlbGF5X3N0
cls2NF07DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBpbnQgZGVsYXksIGRlbGF5X2ZkOw0KPiA+ID4g
Kw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgZGVsYXlfZmQgPSBpZ3RfcG1fZ2V0X3Bvd2VyX2F0dHJf
ZmQocGNpX2RldiwNCj4gPiAiYXV0b3N1c3BlbmRfZGVsYXlfbXMiKTsNCj4gPiA+ICvCoMKgwqDC
oMKgwqDCoGlmIChpZ3RfcG1fcmVhZF9wb3dlcl9hdHRyKGRlbGF5X2ZkLCBkZWxheV9zdHIsIDY0
LA0KPiA+ID4gdHJ1ZSkpDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0
X2Fzc2VydChzc2NhbmYoZGVsYXlfc3RyLCAiJWQiLCAmZGVsYXkpID4gMCk7DQo+ID4gPiArDQo+
ID4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gZGVsYXk7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+
ID4gKy8qKg0KPiA+ID4gKyAqIGlndF9wbV9zZXRfYXV0b3N1c3BlbmRfZGVsYXk6DQo+ID4gPiAr
ICogQHBjaV9kZXY6IHBjaV9kZXYuDQo+ID4gPiArICogQGRlbGF5X21zOiBhdXRvc3VzcGVuZCBk
ZWxheSBpbiBtcy4NCj4gPiA+ICsgKiBTZXQgcGNpX2RldiBhdXRvc3VzcGVuZCBkZWxheSB2YWx1
ZSB0aHJvdWdoIHBjaSBzeXNmcw0KPiA+ICJhdXRvc3VzcGVuZF9kZWxheV9tcyIuDQo+ID4gPiAr
ICovDQo+ID4gPiArdm9pZCBpZ3RfcG1fc2V0X2F1dG9zdXNwZW5kX2RlbGF5KHN0cnVjdCBwY2lf
ZGV2aWNlICpwY2lfZGV2LA0KPiA+ID4gaW50DQo+ID4gPiArZGVsYXlfbXMpIHsNCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoGNoYXIgZGVsYXlfc3RyWzY0XTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlu
dCBkZWxheV9mZDsNCj4gPiA+ICsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGRlbGF5X2ZkID0gaWd0
X3BtX2dldF9wb3dlcl9hdHRyX2ZkKHBjaV9kZXYsDQo+ID4gPiArImF1dG9zdXNwZW5kX2RlbGF5
X21zIik7DQo+ID4gPiArDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoZGVsYXlfbXMgPj0gMCkg
ew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludCB3YzsNCj4gPiA+ICsN
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB3YyA9IHNucHJpbnRmKGRlbGF5
X3N0ciwgNjQsICIlZFxuIiwgZGVsYXlfbXMpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlndF9wbV93cml0ZV9wb3dlcl9hdHRyKGRlbGF5X2ZkLCBkZWxheV9zdHIsIHdj
KTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoH0NCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiDCoC8q
Kg0KPiA+ID4gwqAgKiBpZ3RfcG1fZW5hYmxlX3BjaV9jYXJkX3J1bnRpbWVfcG06DQo+ID4gPiDC
oCAqIEByb290OiByb290IHBvcnQgcGNpX2Rldi4NCj4gPiA+IGRpZmYgLS1naXQgYS9saWIvaWd0
X3BtLmggYi9saWIvaWd0X3BtLmggaW5kZXgNCj4gPiA+IDMwNmE5ZWI0Ni4uODM5NDMxNWM2DQo+
ID4gPiAxMDA2NDQNCj4gPiA+IC0tLSBhL2xpYi9pZ3RfcG0uaA0KPiA+ID4gKysrIGIvbGliL2ln
dF9wbS5oDQo+ID4gPiBAQCAtNzcsNiArNzcsOCBAQCBpbnQgaWd0X3BtX2dldF9wY2llX2FjcGlo
cF9zbG90KHN0cnVjdA0KPiA+ID4gcGNpX2RldmljZQ0KPiA+ID4gKnBjaV9kZXYpO8KgIGJvb2wg
aWd0X3BtX2FjcGlfZDNjb2xkX3N1cHBvcnRlZChzdHJ1Y3QgcGNpX2RldmljZQ0KPiA+ID4gKnBj
aV9kZXYpO8KgIGVudW0gaWd0X2FjcGlfZF9zdGF0ZcKgDQo+ID4gPiBpZ3RfcG1fZ2V0X2FjcGlf
cmVhbF9kX3N0YXRlKHN0cnVjdA0KPiA+ID4gcGNpX2RldmljZSAqcGNpX2Rldik7DQo+ID4gPiAr
aW50IGlndF9wbV9nZXRfYXV0b3N1c3BlbmRfZGVsYXkoc3RydWN0IHBjaV9kZXZpY2UgKnBjaV9k
ZXYpOw0KPiA+ID4gdm9pZA0KPiA+ID4gK2lndF9wbV9zZXRfYXV0b3N1c3BlbmRfZGVsYXkoc3Ry
dWN0IHBjaV9kZXZpY2UgKnBjaV9kZXYsIGludA0KPiA+ID4gK2RlbGF5X21zKTsNCj4gPiA+IMKg
dm9pZCBpZ3RfcG1fZW5hYmxlX3BjaV9jYXJkX3J1bnRpbWVfcG0oc3RydWN0IHBjaV9kZXZpY2Ug
KnJvb3QsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBwY2lfZGV2aWNlICppOTE1
KTsNCj4gPiA+IMKgdm9pZCBpZ3RfcG1fZ2V0X2QzY29sZF9hbGxvd2VkKGNvbnN0IGNoYXIgKnBj
aV9zbG90X25hbWUsDQo+ID4gPiB1aW50MzJfdA0KPiA+ID4gKnZhbHVlKTsNCj4gPiA+IC0tDQo+
ID4gPiAyLjI1LjENCj4gPiA+IA0KDQo=
