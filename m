Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05F4C4725D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 15:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1B310EA17;
	Fri, 19 Jan 2024 15:14:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BE710EA17
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 15:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705677295; x=1737213295;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RocuT+kpxcl71+t/xfgdT5VGJbKAL1iXzD+uq4rTmhM=;
 b=iJqkGbbVQWgTBQR7uxs0r7WZjdS5ST1d0H8ySq9FpIkgoHqgz94IDkHr
 xOpYi4tm2n9/wW+0WPcUQWl0QOyJRNWxOPacrwJhEUEtwYjvJKAvwPHtE
 AOmFJ+VVCC4KOJEUN8f4dly3/BZDRdAnS8z5kicJ0bHqjNJAoMPWRuxbA
 eNwO5uhWafXShZVajnuI+PEQFEvkwtO4JW8dYlPphvZQJG9P3SjNsP9Jr
 INF20xVEHfP4eGF5CnRy4MzxOS+rLYmPc79qUINaip3YmLq5blRRP7sya
 QMwpeRyQRVEvbuY1rxAZznlOAvbEQirpawpV8C7J3Y4QjV07u75IdUjca w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="7466796"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7466796"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 07:14:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="609509"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 07:14:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 07:14:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 07:14:54 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 07:14:53 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 07:14:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ta41W+OPusKdNkLOeBjxdN5oU8Hz5HA/fSLF3DAd8bZ4liWu91Rw8uhjqAxRwTN2oqd9ClTQ2EWh2Zolr2D/6aem8K5HPzJleYcNgedo2L/yryrUDCJbH2CjI7qj7hoVZ09ekrbzQwlkLki64MqE2qzXf+I/a/gQBnBZOIZsRrTwG9C+hGU3aJEN8sD5l28HVfhCd7Rb5jNZ3giA2uKRVmGPxnyaXW6lQqinp9VCY7kCkxXKqqYmPoKjufgf9aCsptpMI0021WTsScZoUXln3LVN91I2C+8e7Ni7w7W+gb8h/dGAuAhAR5d6BgTxcDSl7AtuneLOT48+/z/RClLq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RocuT+kpxcl71+t/xfgdT5VGJbKAL1iXzD+uq4rTmhM=;
 b=ZfqZ0CBLiyAeBuxAWiHIM8E9mO5FT9vstylN1Kku6iWMcr9h0RxO2yjGeqSJCZR/ryaCwpT79ENzpmpZ28Mq2LBIxZnL+VAtH2BAcjHQ5ELDZcf3gA34uSt7XuhVsfN98o0Q+1VaHTxGGIEu+TQgJPquVLYXf+w1+gdQRkAtA2mDICpW/L8+HSNDXepUqEW4xqgbEBeJ49KcbnLTW2BPnzMkfYp06gJVweyJAtQe16y7Z6m5xTh6bxD0MZmoGMQv6Soscc7oKv/76uezZXiOOGgiJHxzwwT3z51xlXy+LMF0+zd4WNik+pH85lM5/xgAkbD/LBony4fl3sbuwdO0/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SN7PR11MB7590.namprd11.prod.outlook.com (2603:10b6:806:348::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 19 Jan
 2024 15:14:46 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7202.027; Fri, 19 Jan 2024
 15:14:46 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v5 2/4] lib/igt_pm: Add helper to get/set
 auto_suspenddelay_ms
Thread-Topic: [PATCH i-g-t v5 2/4] lib/igt_pm: Add helper to get/set
 auto_suspenddelay_ms
Thread-Index: AQHaSuPO84tYzK+Um0atYrAoD9bVhrDhM+mAgAAKp1A=
Date: Fri, 19 Jan 2024 15:14:46 +0000
Message-ID: <CY5PR11MB621106760D007101C31F353195702@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240119142823.1711688-1-anshuman.gupta@intel.com>
 <20240119142823.1711688-3-anshuman.gupta@intel.com>
 <20240119143611.2otaaqy3s6asshmd@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240119143611.2otaaqy3s6asshmd@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SN7PR11MB7590:EE_
x-ms-office365-filtering-correlation-id: 58c5f4dc-5862-44f5-3919-08dc19015f7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vq3P68+Bf3G7AJc/ej9LDbfYE+4mSQ6E44v9bmOeoYTJOZQrYASc2vU0Dt4Qj2i0VNCC6m4RzDzOYVURmQ+M/sqDw04yAai1MUu1c3luo4lyENFU+OnVHrsAzgczVYV3Jxe4fpwrp+E1LCcMXzz78Bs7sKXtHrqGtAjU3FMQ+BV92VYwSn/GH7N76itX8auNeJBNhrZj5K4NnuU6bTUURmgDa+M2obPqmTklIultQOuRW5MfouxzUVA4DGXc8k+v92C7PLBfAHQ9xwQqDdM2xGxRz1lez4WSujDyvrprObXvMYuogOwhO+8jEspU+OAsHfUeNa6jKPwHmoeJIPnuZllZffYcRY2aXdPH2VRzSaP6cbaF/UeRgkPlPv1vvtZdScrAjx2W9wmOr+Vfyg26vlSDi66xhzKDX9yJCR71JV8PJRp3h6NFZWIGJezTyAqNqdPhGszvDBRslwLm8a8N0BHbqCRjpkGFvp082cT1Kvh5ZDAU4qU7DQBAElhfdZ0hv7gGwSAL3ipqUdgVUSyFw1MD7U8uTsuF30tBUn5WiFrkoA5qxZyulDeSjUy9aRIo/4vjN7h6GowQ2cKjIlvJQ3U433Mt7zYp52J8FJ6c6DWhvGr5LV7IZ+CSjoOdaiYf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(136003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(71200400001)(64756008)(8936002)(110136005)(6506007)(478600001)(66946007)(316002)(66476007)(83380400001)(7696005)(26005)(52536014)(66446008)(76116006)(66556008)(8676002)(53546011)(41300700001)(4326008)(5660300002)(33656002)(9686003)(2906002)(38070700009)(122000001)(82960400001)(38100700002)(86362001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjAvaFhDSFFNV0llbTdSRmw4TE4wT3B3VXZhT2xlTFZ0MVBKcWlDc1NaazRO?=
 =?utf-8?B?QnJuRXZadk4zRDVHc3hiM3VyWjBlbFF2djdxb0NTRVk5ZmhDYXI3bnprRmdo?=
 =?utf-8?B?V0RNdVZNdXJQd0p4WmUrWWdIWGFiVHdUdFp2NkhBVE9EcHFacEhUL0paYUVL?=
 =?utf-8?B?bGhBZ1VwS2xTckRRTldqei9CTCtrSERDNC9aYksvYTVPYnhFWEdCbGJqMHNn?=
 =?utf-8?B?ZjQvZ0lyb2hLQ2hiSUtZNkFvMUlaWGpEWEg2L2RmMXRUdTVIemhMMlpxT3pu?=
 =?utf-8?B?WUJNUHo1bFBmbzNpR0J0UVNuTHVVbjBnRWsxNEdwektnUzYvaVByLzYrcm9N?=
 =?utf-8?B?RGUzWTlXdGZsZnlLUSs0MnRtZnp1THRXc1oyVGg3WkpZcGZMbnBSc2xUVHdN?=
 =?utf-8?B?aTFHUkdYWU90YnVLWURXSmdMdVUyYWFvbFY5T2lZa0JtTDQxMUJEWElCZDZz?=
 =?utf-8?B?S2wyQTUvY0FNdCtvSS9RZW1ZeUdsZm5tTUl0TGEwZDczdk1ZNDhQN0FDQmxR?=
 =?utf-8?B?QTBnY2FYeENtZmRKQlcvRGdwVjdkamxzUU1STytFUjFTNXJDZktJSDdIWVU1?=
 =?utf-8?B?cE1URFpGTHJTTWdjcWU3cWFhZHY0Z0tlMU5ZYUtCU0s5RkVvRE5NUXA2eXlh?=
 =?utf-8?B?YzJDenVqRnNrbkxCeG1pYWMxTDhQVXZCVTMxRnpNUlNjcDJwUmhGeTlFdDRR?=
 =?utf-8?B?SEM0R2gwRTNyME1OVmJiU3FxenRhVHhoNHU1aFhWTkRleWxBTlcvRlFwd2M0?=
 =?utf-8?B?dm9yYy9id1Y0RTZuKzdCQzAwQWwxU3RyakpiNEl4UEo0cXlJc1VBbVdUNFJK?=
 =?utf-8?B?dWYxZHNMSGxpNkNycGpEcWNtZjFWZmVUcmk2U2NTQjZvNFpCcGVWaHJRVG1Y?=
 =?utf-8?B?cng1UURjalpTckFnRkMxazFQMmVRTlNKeThiTjJrKy95S2phMEVNSERNc1F3?=
 =?utf-8?B?ZGdlNGVYQXhVZTFHYm13R3cyMjltd0RabVpzaTJhSFJwRG1lR1VTZTdwMHBV?=
 =?utf-8?B?VGI1YXFtZWgza2lWRG5hQ05hSnB4YS85VEVvc2d4dXU0TDQ2RThuaGZrbVJ2?=
 =?utf-8?B?a0psY1lsK0xuemxkUHZQckcrVXJ6bG15MFN6dTVUSWg0MGRwNVp6WnNTS2ZP?=
 =?utf-8?B?STdWSUJNYjlQcHFpOTBjTEI4MmhmYkZ1Q0ZLbWpnNjlaRGlEMUFLTDNOYXgx?=
 =?utf-8?B?a3B6THVkNWVydDNHdkI0S1FaWU94TlBIZk10WVNTSFNDZjRHWkVWOTBxTndF?=
 =?utf-8?B?THluU2JYeEFic1hpcTUzNDN0NjFrUGg1M2JFVnIrOEhET0piaGUyQlk2ZTFN?=
 =?utf-8?B?d3hKVlhIZkhuTzZEMzZkcTBJY2JmWlhLZTBYdWNkSkFmMmhFaWpwY3QyTnpl?=
 =?utf-8?B?SXlVaXpia0hsc0xkOEtYQ1JkYlRwOWhaTDFqdGpROVFVOWNQY20xdmgxODNp?=
 =?utf-8?B?S2t3T3VKWFZLZ2p0QzZJU29zTmpLYk9LVlhwQk9GUWRpamNEeldqYWg3RUVp?=
 =?utf-8?B?aDJueGJPZ3BPRXFCWmJMTDBHTy9NMUFVNVREZFJyQnR0SnY3citXdHhDa09n?=
 =?utf-8?B?bncrV2VKb2tGTnprbXAxQ0o5ZHFWcTBXS3NEVGczcUVMbXZXeDFpaXdheGNM?=
 =?utf-8?B?QU54YldtTlV3MEYwM201WWMyK21URkdUSDVDNkszU0ZLaW9IS01kZmVTWCt2?=
 =?utf-8?B?bnZQZk85OGhHMW1heXRVVk1rdjQ1UG1hRkZTeElxNFZEL2ZHS3ZocVdzNGpr?=
 =?utf-8?B?dGJHVlpFZVIwWTF3eVE1emZrVlhSSWlBZGc2akRMSWhWa3d4VE1Rd0ZRRWpR?=
 =?utf-8?B?ZXJzc05nZStFQ0xwVWJDSFJPWWVHdmRBMlZvekZZRDdCaGo5OUlGcXNyMGR3?=
 =?utf-8?B?bUVpNmJ3MkFsMTJyZm5GYWNCU1lYU1dCUjJnTnU5ZmpuRlR5YzY0dldlcU1G?=
 =?utf-8?B?QkhWcFFBQTRlaEpRcTNRWHI4THF2ZFZ1WXNnT21GTjA2S0JLTlV3TkZvekFY?=
 =?utf-8?B?anVZYUI2ck10eWE3Y2pzcTA1d1dZWjgxRkhUSlB2ZjZMamtEalp2VUY4ZmFD?=
 =?utf-8?B?QmlYMWFPNjUzVVdhTnN0bk1TZHZSd1FXRG1EZVBWVkJIS29McjVlZk9lc0M3?=
 =?utf-8?Q?wVs9y0H++X0Tw6wMHzo0HwU3s?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c5f4dc-5862-44f5-3919-08dc19015f7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 15:14:46.7067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /aIgJaCXBzJkZDEeqtpC44uqoDnD+y5G6AmxYuoPq5soZ07qCpT2oPFM86Xw3HxIyASU3UGHPpMwscBNMzA35RMTHjk91ugqp7bbNex0vl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7590
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEphbnVh
cnkgMTksIDIwMjQgODowNiBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IEd1cHRhLCBBbnNodW1hbiA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPjsgVml2aSwg
Um9kcmlnbw0KPiA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCBpLWctdCB2NSAyLzRdIGxpYi9pZ3RfcG06IEFkZCBoZWxwZXIgdG8gZ2V0L3NldA0KPiBhdXRv
X3N1c3BlbmRkZWxheV9tcw0KPiANCj4gSGkgQW5zaHVtYW4sDQo+IE9uIDIwMjQtMDEtMTkgYXQg
MTk6NTg6MjEgKzA1MzAsIEFuc2h1bWFuIEd1cHRhIHdyb3RlOg0KPiA+IFNvbWV0aW1lcyB3ZSB3
YW50IHRvIHRlc3QgcG0gaWd0IHRlc3Qgd2l0aCBhbiBleHBsaWNpdCBhdXRvIHN1c3BlbmQNCj4g
PiBkZWxheSwgdGhlcmVmb3JlIGFkZGluZyBoZWxwZXJzIHRvIGdldC9zZXQgdGhlIHBjaV9kZXYN
Cj4gPiBhdXRvX3N1c3BlbmRkZWxheV9tcy4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBSb2RyaWdv
IFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zaHVt
YW4gR3VwdGEgPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgbGliL2ln
dF9wbS5jIHwgNTMNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tDQo+ID4gIGxpYi9pZ3RfcG0uaCB8ICAyICsrDQo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvbGliL2lndF9wbS5jIGIvbGliL2lndF9wbS5jIGluZGV4IGMyZDk4ZmNlYi4uZDQzNmMy
YzUwDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvbGliL2lndF9wbS5jDQo+ID4gKysrIGIvbGliL2ln
dF9wbS5jDQo+ID4gQEAgLTEwNjgsMTggKzEwNjgsNiBAQCBzdGF0aWMgdm9pZCBpZ3RfcG1fd3Jp
dGVfcG93ZXJfYXR0cihpbnQgZmQsDQo+IGNvbnN0IGNoYXIgKnZhbCwgaW50IGxlbikNCj4gPiAg
CWlndF9hc3NlcnQoc3RybmNtcChidWYsIHZhbCwgbGVuKSA9PSAwKTsgIH0NCj4gPg0KPiA+IC1z
dGF0aWMgaW50IGlndF9wbV9nZXRfYXV0b3N1c3BlbmRfZGVsYXkoc3RydWN0IHBjaV9kZXZpY2Ug
KnBjaV9kZXYpDQo+ID4gLXsNCj4gPiAtCWNoYXIgZGVsYXlfc3RyWzY0XTsNCj4gPiAtCWludCBk
ZWxheSwgZGVsYXlfZmQ7DQo+ID4gLQ0KPiA+IC0JZGVsYXlfZmQgPSBpZ3RfcG1fZ2V0X3Bvd2Vy
X2F0dHJfZmQocGNpX2RldiwNCj4gImF1dG9zdXNwZW5kX2RlbGF5X21zIik7DQo+ID4gLQlpZiAo
aWd0X3BtX3JlYWRfcG93ZXJfYXR0cihkZWxheV9mZCwgZGVsYXlfc3RyLCA2NCwgdHJ1ZSkpDQo+
ID4gLQkJaWd0X2Fzc2VydChzc2NhbmYoZGVsYXlfc3RyLCAiJWQiLCAmZGVsYXkpID4gMCk7DQo+
ID4gLQ0KPiA+IC0JcmV0dXJuIGRlbGF5Ow0KPiA+IC19DQo+ID4gLQ0KPiA+ICBzdGF0aWMgdm9p
ZA0KPiA+ICBpZ3RfcG1fc2V0dXBfcGNpX2Rldl9wb3dlcl9hdHRycyhzdHJ1Y3QgcGNpX2Rldmlj
ZSAqcGNpX2RldiwNCj4gPiAgCQkJCSBzdHJ1Y3QgaWd0X3BtX3BjaV9kZXZfcHdyYXR0ciAqcHdy
YXR0ciwgaW50DQo+IGRlbGF5X21zKSBAQCAtMTE2NSw2DQo+ID4gKzExNTMsNDcgQEAgaWd0X3Bt
X3NldHVwX3BjaV9jYXJkX3Bvd2VyX2F0dHJzKHN0cnVjdCBwY2lfZGV2aWNlDQo+ICpwY2lfZGV2
LCBib29sIHNhdmVfYXR0cnMsIGkNCj4gPiAgCXBjaV9pdGVyYXRvcl9kZXN0cm95KGl0ZXIpOw0K
PiA+ICB9DQo+ID4NCj4gPiArLyoqDQo+ID4gKyAqIGlndF9wbV9nZXRfYXV0b3N1c3BlbmRfZGVs
YXk6DQo+ID4gKyAqIEBwY2lfZGV2OiBwY2lfZGV2Lg0KPiA+ICsgKiBHZXQgcGNpX2RldiBhdXRv
c3VzcGVuZCBkZWxheSB2YWx1ZSBmcm9tIHBjaSBzeXNmcw0KPiAiYXV0b3N1c3BlbmRfZGVsYXlf
bXMiLg0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1cm5zOg0KPiA+ICsgKiBhdXRvc3VzcGVuZF9kZWxh
eV9tcy4NCj4gPiArICovDQo+ID4gK2ludCBpZ3RfcG1fZ2V0X2F1dG9zdXNwZW5kX2RlbGF5KHN0
cnVjdCBwY2lfZGV2aWNlICpwY2lfZGV2KSB7DQo+ID4gKwljaGFyIGRlbGF5X3N0cls2NF07DQo+
ID4gKwlpbnQgZGVsYXksIGRlbGF5X2ZkOw0KPiA+ICsNCj4gPiArCWRlbGF5X2ZkID0gaWd0X3Bt
X2dldF9wb3dlcl9hdHRyX2ZkKHBjaV9kZXYsDQo+ICJhdXRvc3VzcGVuZF9kZWxheV9tcyIpOw0K
PiA+ICsJaWYgKGlndF9wbV9yZWFkX3Bvd2VyX2F0dHIoZGVsYXlfZmQsIGRlbGF5X3N0ciwgNjQs
IHRydWUpKQ0KPiA+ICsJCWlndF9hc3NlcnQoc3NjYW5mKGRlbGF5X3N0ciwgIiVkIiwgJmRlbGF5
KSA+IDApOw0KPiA+ICsNCj4gDQo+IENsb3NlIGRlbGF5X2ZkIGJlZm9yZSBleGl0Lg0KVGhhbmtz
IGZvciBjYXRjaGluZyB0aGlzLCB3aWxsIGZpeCB0aGlzLg0KQW5zaHVtYW4NCj4gDQo+ID4gKwly
ZXR1cm4gZGVsYXk7DQo+ID4gK30NCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBpZ3RfcG1fc2V0
X2F1dG9zdXNwZW5kX2RlbGF5Og0KPiA+ICsgKiBAcGNpX2RldjogcGNpX2Rldi4NCj4gPiArICog
QGRlbGF5X21zOiBhdXRvc3VzcGVuZCBkZWxheSBpbiBtcy4NCj4gPiArICogU2V0IHBjaV9kZXYg
YXV0b3N1c3BlbmQgZGVsYXkgdmFsdWUgdGhyb3VnaCBwY2kgc3lzZnMNCj4gImF1dG9zdXNwZW5k
X2RlbGF5X21zIi4NCj4gPiArICovDQo+ID4gK3ZvaWQgaWd0X3BtX3NldF9hdXRvc3VzcGVuZF9k
ZWxheShzdHJ1Y3QgcGNpX2RldmljZSAqcGNpX2RldiwgaW50DQo+ID4gK2RlbGF5X21zKSB7DQo+
ID4gKwljaGFyIGRlbGF5X3N0cls2NF07DQo+ID4gKwlpbnQgZGVsYXlfZmQ7DQo+ID4gKw0KPiA+
ICsJZGVsYXlfZmQgPSBpZ3RfcG1fZ2V0X3Bvd2VyX2F0dHJfZmQocGNpX2RldiwNCj4gPiArImF1
dG9zdXNwZW5kX2RlbGF5X21zIik7DQo+ID4gKw0KPiA+ICsJaWYgKGRlbGF5X21zID49IDApIHsN
Cj4gPiArCQlpbnQgd2M7DQo+ID4gKw0KPiA+ICsJCXdjID0gc25wcmludGYoZGVsYXlfc3RyLCA2
NCwgIiVkXG4iLCBkZWxheV9tcyk7DQo+ID4gKwkJaWd0X3BtX3dyaXRlX3Bvd2VyX2F0dHIoZGVs
YXlfZmQsIGRlbGF5X3N0ciwgd2MpOw0KPiA+ICsJfQ0KPiANCj4gU2FtZSBoZXJlLCBjbG9zZSBk
ZWxheV9mZA0KPiANCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+ID4gK30NCj4gPiArDQo+ID4g
IC8qKg0KPiA+ICAgKiBpZ3RfcG1fZW5hYmxlX3BjaV9jYXJkX3J1bnRpbWVfcG06DQo+ID4gICAq
IEByb290OiByb290IHBvcnQgcGNpX2Rldi4NCj4gPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wbS5o
IGIvbGliL2lndF9wbS5oIGluZGV4IDMwNmE5ZWI0Ni4uODM5NDMxNWM2DQo+ID4gMTAwNjQ0DQo+
ID4gLS0tIGEvbGliL2lndF9wbS5oDQo+ID4gKysrIGIvbGliL2lndF9wbS5oDQo+ID4gQEAgLTc3
LDYgKzc3LDggQEAgaW50IGlndF9wbV9nZXRfcGNpZV9hY3BpaHBfc2xvdChzdHJ1Y3QgcGNpX2Rl
dmljZQ0KPiA+ICpwY2lfZGV2KTsgIGJvb2wgaWd0X3BtX2FjcGlfZDNjb2xkX3N1cHBvcnRlZChz
dHJ1Y3QgcGNpX2RldmljZQ0KPiA+ICpwY2lfZGV2KTsgIGVudW0gaWd0X2FjcGlfZF9zdGF0ZSAg
aWd0X3BtX2dldF9hY3BpX3JlYWxfZF9zdGF0ZShzdHJ1Y3QNCj4gPiBwY2lfZGV2aWNlICpwY2lf
ZGV2KTsNCj4gPiAraW50IGlndF9wbV9nZXRfYXV0b3N1c3BlbmRfZGVsYXkoc3RydWN0IHBjaV9k
ZXZpY2UgKnBjaV9kZXYpOyB2b2lkDQo+ID4gK2lndF9wbV9zZXRfYXV0b3N1c3BlbmRfZGVsYXko
c3RydWN0IHBjaV9kZXZpY2UgKnBjaV9kZXYsIGludA0KPiA+ICtkZWxheV9tcyk7DQo+ID4gIHZv
aWQgaWd0X3BtX2VuYWJsZV9wY2lfY2FyZF9ydW50aW1lX3BtKHN0cnVjdCBwY2lfZGV2aWNlICpy
b290LA0KPiA+ICAJCQkJICAgICAgIHN0cnVjdCBwY2lfZGV2aWNlICppOTE1KTsNCj4gPiAgdm9p
ZCBpZ3RfcG1fZ2V0X2QzY29sZF9hbGxvd2VkKGNvbnN0IGNoYXIgKnBjaV9zbG90X25hbWUsIHVp
bnQzMl90DQo+ID4gKnZhbHVlKTsNCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=
