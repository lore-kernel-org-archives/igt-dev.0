Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A5AC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 09:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A6910F876;
	Thu, 25 Jan 2024 09:32:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF4410F324
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 09:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706175167; x=1737711167;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+bkVD37AR7hlRpBdjGu6mINRBlZ85f5edxhZz6NXvJQ=;
 b=nrkzNKwmDK2UDYp5Ls1NXXhfJoLqbOkS8i6JvHHTOKWia7ZCEVosi/CB
 tX7JLy9UGuldCXrpU0HFayoaXtya32qEsz9rUR16413CGmvKINb9YLDL1
 DaJjSuuleqGhe4u4D4LI19DhKQwHdoSmhaxLix2KPbOOMN/VMUAfLnTkn
 zyh1Z3uCP1cHDjNqBKnwNrfLPXRDIjfI6yWwpiqKOkLN6qakiL/wJc8Kf
 QiXlihBo9dmGZuxQ8mSpNeZ4cpbdPWa5mfFdtUDRVw77cGjz9GpvNfOm+
 UonZY2A2GP8b3ZpyTkZUWYIAM3R9hfU5VIKYEe4XMaVh8h7sX/RbTnS89 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9225890"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9225890"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 01:32:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2214337"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 01:32:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 01:32:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 01:32:46 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 01:32:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWNko3TYxIkd+MQZ9PABJaknfx2pOkZNpCco0qxAlxzA+ysA4yv2yDvNhXUZukWxfja+li8Y1/OHO0RgdzRgMFoMMcKKLdQh1U1MeRz82ZYiQbbZH2kbHoLeLScD2aw6dxVLJITXDLb//eKGpNO+BHULvmWUAx4EAoST7cSgL3a8lDNfM54nDj3zz8lI5Axr7noF3HVxmqpnF0pC6g1qhxGqPJqPkHdl1WXkzALZvMbxJ+9R44VN99jeejNp84Hk7Sy/b0ccB692EbsCjNiNiko4Gl1TXDRr9kE87bzPAWS3kBSZ3vLAc4ClcEwTfS/M48B9WaBcQi2W/zknv00mFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bkVD37AR7hlRpBdjGu6mINRBlZ85f5edxhZz6NXvJQ=;
 b=d7Lbl6k9vXvdR9NnAt8oLHA2ShmBpLglk5uPYTR9EDEYGCRh9HK0WwpWHoVjQf9DkRvCPa2AtbwTh7ChmHvHzIvuYan8R2QxXJU2amAoY1db0zKQoCA0NCL1BkziLwkoEn82zoPIzBfFMPbeuaIauRgCmnCuyfftsxP9m2C2VLOxs7Ax6xi4G1NNDoQtYf69fQUgHUvTfTf/sfZVuVRc2WmX7UrArC3H2lwaipS6tMiIQ2inSqqBMAzCcpdcW3Cle1Fwt/qs3Pc34hqSICaNDrBN73iXQixWNQGh3JjyybZ4WKPw5DrnU4kjpgog8D22lmoSnBAxsV3W/ufNQVaxHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Thu, 25 Jan
 2024 09:32:43 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7228.023; Thu, 25 Jan 2024
 09:32:43 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v6 4/4] HAX: Add d3-mmap to xe-fast-feedback
Thread-Topic: [PATCH i-g-t v6 4/4] HAX: Add d3-mmap to xe-fast-feedback
Thread-Index: AQHaTruPO6uuPEHqhkumlAKKc5nDb7Do+BMAgAFMjXA=
Date: Thu, 25 Jan 2024 09:32:43 +0000
Message-ID: <CY5PR11MB62112F26089660F586DDC3CD957A2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240124115019.2067089-1-anshuman.gupta@intel.com>
 <20240124115019.2067089-5-anshuman.gupta@intel.com>
 <20240124133936.uffdw655o6ggywhl@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240124133936.uffdw655o6ggywhl@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH0PR11MB5627:EE_
x-ms-office365-filtering-correlation-id: a9646099-d738-4d40-42b4-08dc1d88954d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lt+1DGXvWcUVr3avfkcL1iqebrBTfgny6itI5ygXxiWcfOkjGe2Bzb6dQs95JDjupkUJe1O7QeVoIoeglL/p0Chr3fJBsHRmV4XZlFeoPOfBnhgZPvTDGqUHciTPZefJfSf8MrfgHSu023ODpxqLgMmIpOhMJ8xooqN5b2fa0mj9wmDY2sq6PsIxstGVdUOl7ujOKB2FxBYq0ffExsNHEgjgO5qVAYZPMxObZj+dhbs1y2XBEB0W6qmukMbGfhngYHjjTX9ey9M/yiDnUigcQDKSrLoRivq/pxZguXXM3b47u4262xUKcYzjVxnK4n+Rjv76Z0vLq829vXfYJ3PGNDRgc6oHfwuDAOAeIiOW2I2hO7DY8nyyVae46Ccp0Tgx5qmttL1TUFgTtsqQXXBgv7IN7HNpe5DPTkMoZKxw6O+si3HHnrYrJw81geEnV6ta2Yo+tFxzSV49elHIGP3Xic3HYymBnVu6QaWhih1tBWcqpMffA2401hPWZNJG7CGMqyfh99dwrtO/TglPhOghoVh8tiDA6gzHvejyFtzjtz9NQ10pzhjIK+jp14bu+LQOUkwhbeGrZhy00RlFzTrsn8cUPfoLJ5ZKBBALo4np7bertB5TQUGaQIDEIBk3QLFa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(396003)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(41300700001)(55016003)(26005)(38070700009)(83380400001)(7696005)(6506007)(9686003)(53546011)(478600001)(71200400001)(82960400001)(38100700002)(122000001)(5660300002)(2906002)(316002)(64756008)(66556008)(76116006)(66946007)(86362001)(66476007)(33656002)(8936002)(52536014)(8676002)(110136005)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjlYVStjdnFHczVqVnNyRGs2cmZuSnp5VWZCOE1BMGpTSkxjUzVaVjBKcFlR?=
 =?utf-8?B?UTh4aFJHSk9TSWVxaWx1dE5hVU42WEJBalZvYXlMM0tnYnd2UVFHd2x3WDZE?=
 =?utf-8?B?djU5Vkh5THVOendtWG81Zitwd3RuRzZMN2Z2UWFlQmVqRzUvR1NsMEw1ZFFs?=
 =?utf-8?B?ZlI1NnVFT3c3aXFBVmlLUXF0WEdJTnFtenN4UGM0WURENXZlUDlobzNwV2I1?=
 =?utf-8?B?WExmcGErVTloTFU4b2puV2QySVd4MEYvNVhZUnI5ZWtnVVR3UjhhWDc1cGkr?=
 =?utf-8?B?eEk3ejAwZlpGV3VIeXYvd25xekd0blR1MDF6MFZIc3gwdExDVStJWEcvNVl6?=
 =?utf-8?B?UTFkYjViV3lucEFFcVJoY3ljU1kzRE9zUmJSckd6VjRQVm16MDcyd3ZZSEF5?=
 =?utf-8?B?aS9NaXhVT3ZpRkxNZndMK2pqWTdweWJvY0kvQ0E0cHhIS2N1R0E3NVYvaUxE?=
 =?utf-8?B?Um01aGI5K0VWWlJCMFJzL0N5Vi9OMlFTUmZNZmZzSk9qL0hXbEZPTWY1clBM?=
 =?utf-8?B?RCtCYXdYbjJoVDJrSzlUUGFpSWhmbHhzUzl0NnhPdkxWZ2F2U2hHL0FuU2tZ?=
 =?utf-8?B?bG9LZUhiaGNJNDBwVzBnaW5XbUpxY1dMdDQ4STZuOFREa2pQZkFXa3BkNTkv?=
 =?utf-8?B?bThsRTR3bzArK3h1Q2VoK3k0T1VFZHJBZ1JVak4rSXUyZzkyM1kxMkJwaUdC?=
 =?utf-8?B?VGFIZTRaMEt6Lzl2bmVkZDIzZ1JBNHYzR09BQVBFMGsxNFA1ZkpFZWxlVnlm?=
 =?utf-8?B?aFcwczZ6SGtTUEU1dklDNVQvRmNJMXh0MkVBdG53czI3VU5SNXNVTWVsZXpp?=
 =?utf-8?B?QjV5UzJYVzZkejdGNVdKVE5ZVjJQbXZKMVNMczdFdUlTTVdXRnUzRDlZUUE5?=
 =?utf-8?B?ZFIySzFmWTdad1RJYXBNZERyL2haR2R6ZEd4NE5PZyt3akp2V245bzBUMEg2?=
 =?utf-8?B?K1Q0aGFQVllrS0lkYW5EamxIQkpmV0k5dGZSdjVQQTQwdUViVFlhUFhFK1A5?=
 =?utf-8?B?bk9rOFg3bzYxUDFCUzcxelN2ckFSSjVIRDdhQjNFREczUlA3eTE5OUtQR0Nt?=
 =?utf-8?B?WlV3aEp6UE1nRUdKK09MRmgzRDM4eXN0N29maldkMzZRMndGY1ZKcFFab3Av?=
 =?utf-8?B?b0NkTkdXN2wxQUE4OUNrTHRxOEo5VnpyTW5QaEZEaEpiMFBBK3BjVWJLQ1ZG?=
 =?utf-8?B?U0xYais0MCtSakdzVUlBQmY5SmdONE16S3o0OWx2MzgzUUREcWtMejJBRmFI?=
 =?utf-8?B?eVBmSjJpVU9aSFJkZEN1S0luOXg2aEhyem5XWjYxNkJ2L2E2bWFQRnJKclBi?=
 =?utf-8?B?ZVlpSk9jMEVYam53WklYVVNCTTd2WkJzenltd2pMZUZsZVlhVXJ4SE9CRHVz?=
 =?utf-8?B?a25ocGlRWTRnVWcyQVdESnlPT01vUEZCWHFQNyt5b1B3S2Y1TGRNN1NzWWhi?=
 =?utf-8?B?bTZZa3orcHN5M2RKY1BBWitKLzJ3N1FsVG9lcjMvQ2d3TGlCUmxWM2ZuN3VP?=
 =?utf-8?B?KzZoUVh4NCtmUVl5Yjdxa3lkWnBsSTIwU3c3aHVZRmx0L2tMczhBdDZJWVMw?=
 =?utf-8?B?RVJRU0V5cnZRNUp5YkxKYm5sVnYyNUpUMVJlTVBKQ0dCZnJDdEo4YXlyZzlJ?=
 =?utf-8?B?WmQ5OVFCbENNM2dJeTlRTDlLVjJ3dVZzeC9PV3RNZnNyTTYrQk5kOUtCME1l?=
 =?utf-8?B?T09GQlhBaWtQL2VtV1FGakIxN3JHWXpabmZjeGRiM3I0N2N5TjhuYTZwbjYy?=
 =?utf-8?B?bFZVU0w4SU1WUGFQMksrQmJLL0VtNnNoNVVuaEUwejVrd01IV1ZZMXNMaHUw?=
 =?utf-8?B?WUhTd09hRnBKV3AwWElqNmJ0S0VHZHZVSlZmWFBibUdscjVHVXpSMENGU0ZB?=
 =?utf-8?B?cktsZGxkQ3dlRWFLM2FDdTlFU0hIZGNJc1o2VStSSTVpYkdESDBsK0RuczMy?=
 =?utf-8?B?M2MyanNXQ3dzdG0vc3ZHeXhrVlplSTlQM0daUHVhYXNXaExWZ29RRFMxZ1d2?=
 =?utf-8?B?cEg2TE1MSjlPcGhFUlkrVjJZd2lETEV0Lytxbm1acURKUENCOWpVM2c5STNO?=
 =?utf-8?B?WldvNW5RS1VNSGwyNURGNXpxMndRcFBBOEU2alVZTTJTdUZqblIvMWloWm5C?=
 =?utf-8?Q?7CYJm7Dk6rtybeyBPlrBVCVpv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9646099-d738-4d40-42b4-08dc1d88954d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 09:32:43.7289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2dl5k8lWJ+KqVqPxK2OUCnCZHbwm+Df11Iyk+0JbFe02AWZ3LGnhfg1dv8cUiWAEfGjNfycy36Irfwa0V0fjc2ug2C8kvi15EhuE4wdw6qI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5627
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEph
bnVhcnkgMjQsIDIwMjQgNzoxMCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gQ2M6IEd1cHRhLCBBbnNodW1hbiA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIGktZy10IHY2IDQvNF0gSEFYOiBBZGQgZDMtbW1hcCB0byB4ZS1m
YXN0LWZlZWRiYWNrDQo+IA0KPiBIaSBBbnNodW1hbiwNCj4gT24gMjAyNC0wMS0yNCBhdCAxNzoy
MDoxOSArMDUzMCwgQW5zaHVtYW4gR3VwdGEgd3JvdGU6DQo+ID4gQWRkaW5nIGQzLW1tYXAgdG8g
eGUtZmFzdC1mZWVkYmFjay4NCj4gDQo+IEhvdyBsb25nIGRpZCB0aGlzIHRlc3QgbGFzdD8gSWYg
ZmV3IHNlY29uZHMgeW91IGNhbiBhZGQgaXQgdG8gZmFzdC1mZWVkYmFjayAoZS5nLg0KPiB0byBC
QVQgdGVzdHMpLg0KPiANCj4gQ0kgbm93IG5vIGxvbmdlciBtYW5hZ2VzIHNlcGFyYXRlIGYtZiBs
aXN0cywgd2UgY2FuIGFkZCB0aGVtIGlmIG5lZWRlZCBzbyBpZg0KPiB0ZXN0cyB0YWtlcyA8IDEw
c2Vjb25kcywgcGxlYXNlIGNoYW5nZSBzdWJqZWN0DQo+IGludG86DQo+IA0KPiBbUEFUQ0ggaS1n
LXQgdjYgNC80XSBpbnRlbC1jaS94ZS1mYXN0LWZlZWRiYWNrOiBBZGQgZDMtbW1hcCB0byBCQVQN
Cj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBHdXB0YSA8YW5zaHVtYW4uZ3Vw
dGFAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICB0ZXN0cy9pbnRlbC1jaS94ZS1mYXN0LWZlZWRi
YWNrLnRlc3RsaXN0IHwgMiArKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kveGUtZmFzdC1mZWVkYmFjay50
ZXN0bGlzdA0KPiA+IGIvdGVzdHMvaW50ZWwtY2kveGUtZmFzdC1mZWVkYmFjay50ZXN0bGlzdA0K
PiA+IGluZGV4IGYyOTdmZTk2NS4uMWQ1ZWNiMTlkIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2lu
dGVsLWNpL3hlLWZhc3QtZmVlZGJhY2sudGVzdGxpc3QNCj4gPiArKysgYi90ZXN0cy9pbnRlbC1j
aS94ZS1mYXN0LWZlZWRiYWNrLnRlc3RsaXN0DQo+ID4gQEAgLTExNSw2ICsxMTUsOCBAQCBpZ3RA
eGVfbW1hcEBzeXN0ZW0gIGlndEB4ZV9tbWFwQHZyYW0NCj4gPiBpZ3RAeGVfbW1hcEB2cmFtLXN5
c3RlbSAgaWd0QHhlX3BtX3Jlc2lkZW5jeUBndC1jNi1vbi1pZGxlDQo+ID4gK2lndEB4ZV9wbUBk
My1tbWFwLXN5c3RlbQ0KPiA+ICtpZ3RAeGVfcG1AZDMtbW1hcC12cmFtDQo+IA0KPiBUaGlzIHNo
b3VsZCBiZSBiZWZvcmUNCj4gDQo+IGlndEB4ZV9wbV9yZXNpZGVuY3lAZ3QtYzYtb24taWRsZQ0K
PiANCj4gd2l0aCB0aGF0IGZpeGVkOg0KPiBBY2tlZC1ieTogS2FtaWwgS29uaWVjem55IDxrYW1p
bC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KSGkgS2FtaWwgdGhhbmtzIGZvciBjb21tZW50
LCB0aGlzIGlzIHRoZSBIYWNrIHBhdGNoLCBub3QgZm9yIG1lcmdlLg0KQ3VycmVudGx5IG5vdCBw
bGFubmluZyB0byBoYXZlIHRoZXNlIHRlc3QgaW4gQkFULg0KVGhpcyBwYXRjaCBpcyBhZGRlZCB0
byBnZXQgdGhlIHRlc3QgY292ZXJhZ2UgcmVzdWx0cyBmcm9tIENJLiANCg0KVGhhbmtzLA0KQW5z
aHVtYW4gR3VwdGEuDQo+IA0KPiA+ICBpZ3RAeGVfcHJpbWVfc2VsZl9pbXBvcnRAYmFzaWMtd2l0
aF9vbmVfYm8NCj4gPiAgaWd0QHhlX3ByaW1lX3NlbGZfaW1wb3J0QGJhc2ljLXdpdGhfZmRfZHVw
DQo+ID4gICNpZ3RAeGVfcHJpbWVfc2VsZl9pbXBvcnRAYmFzaWMtbGxzZWVrLXNpemUNCj4gPiAt
LQ0KPiA+IDIuMjUuMQ0KPiA+DQo=
