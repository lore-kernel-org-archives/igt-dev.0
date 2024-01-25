Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA8BC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 07:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C1810F827;
	Thu, 25 Jan 2024 07:14:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DF310F827
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 07:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706166890; x=1737702890;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5n607xpVCF3BbR7LHa7FSWbfiBSXlaCbBZwN6DN+4Tw=;
 b=TlQ+FZgStcN2Qh6Kp+NI3okP2zBqE9/sh951sciGlnbg0Vo+wWSdxrGn
 QafBkFahLZlT/98CaK5L1vVhYwrdxvMk5kDD9W5EIzwS7asb0LV4YM7n4
 ywoh5et/MqyK0J637tMdHp2VWEUCU/lQUC6dwjxyWfrqcJjYR3JJrV2sd
 2kxqDw8vMwt6hFDz8savCBwy+kY0M45H86dfF2xsndozZCJyOKMy9RqMj
 v4qtcsjmZ3NlLDk5J9bjRZC7B/E29vODJyfvC1IKrdVhsGG9m1vkyg45T
 MKLLuRwC9GTtGoI+4/2lwSyw9ThRXbG8PkYydvDiymUbOIREWq/xV22lW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400938343"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="400938343"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 23:14:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2183135"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 23:14:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 23:14:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 23:14:49 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 23:14:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6zf4e73RAmoLTH2aiJOr/o7q14gY4TtoFklckL2JDWk6IIo9b+RmCjWeZvtM49r0xXLPOltLTR89qjtscUSAU5uTOKOCtN4zmIjLNqrl6c+ZpvEe9Q6VV3HowpxE45ijyDUenBofuGxTYgPLoPCIa7lctHueVVPwh7FOGmEiAlLxvX5v3466yhK6AJKb2XAygnI6n/Ia1JzLehlNMgCxfHUzDJOA5ebQxfABCSyqgb6HR8KWhbuAQhBmRHCCE4aAM4acv7UIlYh3q2iQHqcZ1zDfrztWi8wZ1/mFgJd7bmpfmeyjuRpFe2SFVu/zliMUW3Ly8jlDX/FiYJ67+gPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5n607xpVCF3BbR7LHa7FSWbfiBSXlaCbBZwN6DN+4Tw=;
 b=hexfGmXQQlvjbHmqy9e+oESLde9cUXMXepjAvkmMa+6dfzgnk2KGANzTdy3wWEzmFpHEq16vudZd2mo8R1jI0rmnP87CjlBAYiKTVEeFXoOk7HppsgWsFaxo5/3xzvop6zD7tJHIJUSTGbnpNtmDjaFB+YRrlbGQvKo36/jVTBlkJ2Cn0kSNhz/BOgV3iRuimlF/MyfAO8pdiNmhKzmzNKC0axU5zeFYKqU+7Z/upNmU9nGIVMhDw4wK0ubRx/ZkVHT71wt7pGO9MSj/9E9GfFA7sj31E84ZS7YdhFm9sQM6tRIEqhXzpecw68qF5dp9MMj6lbYRhDeg9mXRqr8f0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 IA1PR11MB8098.namprd11.prod.outlook.com (2603:10b6:208:44b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 07:14:47 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120%7]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 07:14:47 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 5/8] lib/intel_multigpu: Introduced
 gem_multigpu_count_class and igt_multi_fork_foreach_gpu
Thread-Topic: [PATCH i-g-t v2 5/8] lib/intel_multigpu: Introduced
 gem_multigpu_count_class and igt_multi_fork_foreach_gpu
Thread-Index: AQHaTwXQGLNvwfG4kE24nIikIsWPX7DqG7Zw
Date: Thu, 25 Jan 2024 07:14:47 +0000
Message-ID: <DS0PR11MB72649E19DAD72439CB755B89D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240124204134.71451-1-kamil.konieczny@linux.intel.com>
 <20240124204134.71451-6-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240124204134.71451-6-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|IA1PR11MB8098:EE_
x-ms-office365-filtering-correlation-id: fa8e4145-b58d-45e8-07aa-08dc1d755007
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: seiYfwT+yEvqUY+HfjYpbmg+2j7iPg7mgmta6YugSSYhZUIwKc7TmZW81Siu4PhjePNTfVqN4BMe6yN8CFKELq9oTquGTLRKmSGK55Lr6E61McPv4OrkWRWHdZTr3REJS2ySAM1nQjpHul41rBhFOgW0ybXH5k5lBbJDTLnTZHICmWb2OLE68XUtCmtRCG1wynMhnJ87F1+mUvQKCd62Q6rdCAe81qS6kaNO2hicZdEgdOSSkdhYHa29Li5imDDZ2RDhS5v+m/pHqYGiufQfhb7pI/m+78TtoTrevUmHBO51SYoWZcO5W2ZWvohL8qlx7+NpB7FBQe1dVg0e7lW1GGvQQoNLNUoyKVQPV8+hM6vmFDiGrFUyCbNdxTMR3kkHLUpNFx6iMQBGNAo0qh1kLOGd00qKFFk5O+I2JvB4aIldiIhvA+dz0zBZWRCX1/ROPTe5GO8BjtYuBf65qoj1CuNO96bGcKCPbZ9CawqjJguN/eFxcQh+1O1akCbycfRSo9kem1tI4Mt2rU7Ster2M5BWUbF3NjiHKyqtaqSMJw/t1E7WKq3rxm7/60uQCBTMR9BGz1hIsd1q73SXMZQGecSS1LvBRJi2pWhloOYZSdQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(110136005)(76116006)(55016003)(2906002)(5660300002)(66476007)(66446008)(66556008)(66946007)(316002)(71200400001)(64756008)(52536014)(4326008)(8676002)(53546011)(8936002)(478600001)(82960400001)(86362001)(33656002)(38100700002)(38070700009)(26005)(9686003)(122000001)(83380400001)(7696005)(41300700001)(66574015)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUFQUDY4MFdXSFdOU1lVR05VbVcrNXVsY28yaUU5WWpiWVJCa1JaeVVtdkZB?=
 =?utf-8?B?K2ZPQ1JQOTd6c2plT0g4TnBKSStjb0RVcGhJM2NFUGl4RmxRT01ZSmlhZjZq?=
 =?utf-8?B?ZUJLMCsvM1dnQnlYNEQzTUxjMEljMmR2UHZHRGhVMTI3UCsxYy8vOXBrVllm?=
 =?utf-8?B?eHpiWFpUTUxkSGdCVUpudDZ6K01FN3RsRktycVhnY1M1MGxOTU1PV0NQY2N5?=
 =?utf-8?B?ZE9GOFN3UHFSdGgweFI3UzVWdWJmVlJkKzAwZlNFN0djTy9seHRnUUtEUnJy?=
 =?utf-8?B?dnBBdzduRlhVWGFKNFBqRXZzRlBLTFJncEFjRmJPQUtQdHBWRmtIWkZFSnB1?=
 =?utf-8?B?ZGk0NXV6V3ZnUGljbWJlTERxZW9HWUV1Q2ViRnhSR3dZK3cvS1pvUkFrZ0JW?=
 =?utf-8?B?N0NQTXJFR2NwR2lyY2NvT1c2ZUdRUFVyUEhYZktjQjhLcnErRDhTM0hDU2c5?=
 =?utf-8?B?UGlYVzFzdTFPVktsTFhGYjdMc2U0cFVCS2NQYXZnZkxvOE1iWjdGRkZBQ295?=
 =?utf-8?B?S2xBWVE1SXZSN2M0TWF1b25aemJ5d1lHYVN5N2VtMytjaWFuOHhEcU9YMTZ1?=
 =?utf-8?B?Q1BUclBzUTk0YU1qQzJNVFo2cUhSSHF6WTUrSDdqc1V2MDNidHdFOThlQ0pQ?=
 =?utf-8?B?UmJ1bWdmZ3lOVmNlYWJRNnVSMHp5SzA2d3NFVkhmS0c3MjFWRktvSmNlNjR6?=
 =?utf-8?B?UEFpNXcxMUlpL2pRMGhqM1B5Z3FlUVdUMm1teUIwZkh0UFpQTjFwajlSWjdR?=
 =?utf-8?B?bkRBWHBUdGZZVjVGOHFQUGI2aUhVUE5XcnIzb1htWWtoYlA3Y3VZU2c2a1kx?=
 =?utf-8?B?ajdLY0lnR0VDdDNEbzdlMXhOL1BLVDVMYXl4K3Q2YVpBMDlYdERpOVhTc0dm?=
 =?utf-8?B?dnpjM0xucmJVZ0plMzc0Smp4T0NRT21qZ3JrTzJCcTA4KzJJVnZrbGM4UGZE?=
 =?utf-8?B?QnhrOVdpMEZ2SkF1Zm5GdUhrVUtSS1Y5SFVIMTIyMmZDbnBmOUMzVWVST0d5?=
 =?utf-8?B?NEZ5YldzTlNvb1FSSGdadUwwaHVITHU1YkkvU1FMcGdGeHVnT1YxOTVOdVha?=
 =?utf-8?B?RkRQOGM3SkU5ODB1WEM5VHZEcnRKQXkzN09WOTI0UXZ0SVZNdUtsb2hWTFJJ?=
 =?utf-8?B?UHFUdE50dHU4K1pKVGV0MHJoNG40K1V5REVUcmQ0WW93NFJ5NEFwL2xWT1cx?=
 =?utf-8?B?czl6dmVvQ3UzNmFTSnNDU0J2ZXN1VHVJY0xqYWFSMWtkNTQrNTBhemhyUzhP?=
 =?utf-8?B?UUQyZmd0cjA0T3pEdlJDYVBsNFEvRys5OVN1anhLRDc3NnVDSmJFdXBBZmJM?=
 =?utf-8?B?YVJ6WExHYytxbysrdXFiWDh2YzVBb3NYSkQra2JrYnRZeTVUNEZQL0k2TUFZ?=
 =?utf-8?B?a3R2aHA1NkRyUmoxVHpXc2ZNa2ljSGJXTThaMjdhVHNna21weDQ2UFA2Qm9G?=
 =?utf-8?B?NjNwZVJOWCtKbmNmbHhudjFJSnoraHdHZkx0Z1hQRXQ0NVd0STlUTDVVVDJF?=
 =?utf-8?B?eWRqZ0FFYkswNXovSTFPcVdYMlpVQkhGcW82cFdIalpaaGxRUVZrazA4WGRs?=
 =?utf-8?B?cWNqMEkyb3NJYU04azVGUjFxcEo3NlQvVllGcllwazVnYkNlcnEyOTJuN2hs?=
 =?utf-8?B?TFljd3dFeGNPV0xMVi8wVjhaVGNmMzJ3V1dyZC9obUxCbW10WkVWR0hYRzhR?=
 =?utf-8?B?RVRsdzI3aFJZRWx3WlBxaUppUlJ6ME00UHpLUlZGZmo4VGE3bU9oeXJHVnlJ?=
 =?utf-8?B?WUlnelRVNHpaL04vSVpYcmJZMDBIQmVIcTZCc0kxWFR2TmtKU2ZlbytEdnR5?=
 =?utf-8?B?eG9iOVl3R3VQSVJMVlFXd2RGYU1xVDEwOEEvejRHUFZPSnZnMmFubjg0dzlX?=
 =?utf-8?B?VkFoekNpTGM1ODZQbHNXUDZVTVRRdWptK3ZxWUVBa0hnS3N2eWRnUlJnVHBt?=
 =?utf-8?B?NldLY0I0K21oNmdvdHdJVVpnYkxYSUFxeXhtMll1RHRRWFNWOEF6UStDb3Bm?=
 =?utf-8?B?K1FLNjNUeFdkUDRGS0hETXhORlIyaVpKNmk0Q1R4MTM0dnloeUh6MUk3RFNZ?=
 =?utf-8?B?bS9FNllxa1hUbmFWKzBhQS92WE1mMzNadTREdTBXVUtkL00zQ05iRnl2WG5l?=
 =?utf-8?B?SDRoUjNJQ2ZkbkhmM09Fb2FENWhEY3h3cnF4SUFmWk04MDllWHFRcWo0dlFV?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8e4145-b58d-45e8-07aa-08dc1d755007
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 07:14:47.0431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GWIuBEjs2usiQCeR44Fte0V68ZzpJhrJwl08Bh9tQewMl1QfiXaErpyfrYzu7zPXkw/CwVgz/sIJk31HFi544GGjwdak6aTYQhO5UCTE7Xj/U4zdNUlxS7VINnz9WRqi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8098
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

SGkgS2FtaWwsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwg
S29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIEphbnVhcnkgMjQsIDIwMjQgOTo0MiBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gQ2M6IFBpYXRrb3dza2ksIERvbWluaWsgS2Fyb2wgPGRvbWluaWsua2Fy
b2wucGlhdGtvd3NraUBpbnRlbC5jb20+OyBDaHJpcw0KPiBXaWxzb24gPGNocmlzLnAud2lsc29u
QGxpbnV4LmludGVsLmNvbT47IEthbWlsIEtvbmllY3pueQ0KPiA8a2FtaWwua29uaWVjem55QGxp
bnV4LmludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYyIDUvOF0gbGliL2ludGVs
X211bHRpZ3B1OiBJbnRyb2R1Y2VkDQo+IGdlbV9tdWx0aWdwdV9jb3VudF9jbGFzcyBhbmQgaWd0
X211bHRpX2ZvcmtfZm9yZWFjaF9ncHUNCj4gDQo+IEZyb206IERvbWluaWsgS2Fyb2wgUGnEhXRr
b3dza2kgPGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQo+IA0KPiBJbnRyb2R1
Y2VkIGdlbV9tdWx0aWdwdV9jb3VudF9jbGFzcyBmdW5jdGlvbiB0aGF0IHJldHVybnMgYW4gYWN0
dWFsDQo+IG51bWJlciBvZiBHUFVzIHByZXNlbnQgaW4gc3lzdGVtLCB3aGljaCBhbGxvd3MgZm9y
IHdyaXRpbmcgbXVsdGktR1BVIHRlc3QNCj4gc2NlbmFyaW9zIHRoYXQgZG9lcyBub3QgcmVxdWly
ZSAtLWRldmljZQ0KPiBwY2k6dmVuZG9yPWludGVsLGRldmljZT1kaXNjcmV0ZSxjYXJkPWFsbA0K
PiB0byBydW4gYXMgaW50ZW5kZWQuIEJhc2VkIG9uIHBhdGNoIGJ5IENocmlzIFdpbHNvbi4NCj4g
DQo+IEludHJvZHVjZWQgaWd0X211bHRpX2ZvcmtfZm9yZWFjaF9ncHUgbWFjcm8gdGhhdCBoZWxw
cyB3aXRoIHdyaXRpbmcgbXVsdGktDQo+IEdQVSB0ZXN0IHNjZW5hcmlvcyBpbiBpZGlvbWF0aWMg
Zm9ybToNCj4gDQo+IGlndF9tdWx0aV9mb3JrX2ZvcmVhY2hfZ3B1KGk5MTUsIERSSVZFUl9JTlRF
TCkNCj4gCXRlc3RfZnVuY3Rpb24oaTkxNSk7DQo+IGlndF93YWl0Y2hpbGRyZW4oKTsNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kNCj4gPGRvbWluaWsua2Fy
b2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8
Y2hyaXMucC53aWxzb25AbGludXguaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBLYW1pbCBL
b25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgbGli
L2ludGVsX211bHRpZ3B1LmMgfCAxMyArKysrKysrKysrKystICBsaWIvaW50ZWxfbXVsdGlncHUu
aCB8IDE1DQo+ICsrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2ludGVsX211bHRp
Z3B1LmMgYi9saWIvaW50ZWxfbXVsdGlncHUuYyBpbmRleA0KPiA5ODhjMjAwMzMuLjBlNzZkOGFh
MyAxMDA2NDQNCj4gLS0tIGEvbGliL2ludGVsX211bHRpZ3B1LmMNCj4gKysrIGIvbGliL2ludGVs
X211bHRpZ3B1LmMNCj4gQEAgLTMsOSArMywyMCBAQA0KPiAgICogQ29weXJpZ2h0IMKpIDIwMjMg
SW50ZWwgQ29ycG9yYXRpb24NCj4gICAqLw0KPiANCj4gLSNpbmNsdWRlICJpbnRlbF9tdWx0aWdw
dS5oIg0KPiArI2luY2x1ZGUgImRybXRlc3QuaCINCj4gICNpbmNsdWRlICJpZ3RfY29yZS5oIg0K
PiAgI2luY2x1ZGUgImlndF9kZXZpY2Vfc2Nhbi5oIg0KPiArI2luY2x1ZGUgImludGVsX211bHRp
Z3B1LmgiDQoNCkEgdmVyeSBzbWFsbCBuaXRwaWNrOiBpbiA0LzggI2luY2x1ZGUgImludGVsX211
bHRpZ3B1LmgiIGlzIGFkZGVkIGEgbGluZSBiZWZvcmUgaWd0X2NvcmUuaC4gSW4gaGVyZSAoNS84
KSwgaXQgaXMgbW92ZWQgZG93biB0byBtYWludGFpbiBhbHBoYWJldGljYWwgb3JkZXIuIE1heWJl
IHRoYXQncyBhIGdvb2QgaWRlYSB0byBwdXQgaXQgdGhlcmUgaW4gNC84IGFuZCBkb24ndCAiZml4
IiBpdCBpbiA1Lzg/DQpPdGhlcndpc2UsIDEvOCwgMi84LCA0LzggYW5kIDUvOCBMR1RNLCBidXQg
SSB0aGluayBJIGNhbid0IHJldmlldyB0aGVtLCBhcyB0aGV5IGFyZSBvcmlnaW5hbGx5IG15IHBh
dGNoZXMuIFBsZWFzZSBjb3JyZWN0IG1lIGlmIEknbSB3cm9uZy4NCg0KRG9taW5payBLYXJvbA0K
DQo+ICsNCj4gK2ludCBnZW1fbXVsdGlncHVfY291bnRfY2xhc3MoaW50IGNsYXNzKSB7DQo+ICsJ
aW50IGNvdW50ID0gMDsNCj4gKw0KPiArCWlndF9mb3JlYWNoX2dwdShmZCwgY2xhc3MpDQo+ICsJ
CWNvdW50Kys7DQo+ICsNCj4gKwlyZXR1cm4gY291bnQ7DQo+ICt9DQo+IA0KPiAgdm9pZCBnZW1f
cmVxdWlyZV9tdWx0aWdwdShpbnQgY291bnQpDQo+ICB7DQo+IGRpZmYgLS1naXQgYS9saWIvaW50
ZWxfbXVsdGlncHUuaCBiL2xpYi9pbnRlbF9tdWx0aWdwdS5oIGluZGV4DQo+IDk4ZGM1YTRjZS4u
MGViYzczZTRhIDEwMDY0NA0KPiAtLS0gYS9saWIvaW50ZWxfbXVsdGlncHUuaA0KPiArKysgYi9s
aWIvaW50ZWxfbXVsdGlncHUuaA0KPiBAQCAtNiw2ICs2LDIxIEBADQo+ICAjaWZuZGVmIF9fSU5U
RUxfTVVMVElHUFVfSA0KPiAgI2RlZmluZSBfX0lOVEVMX01VTFRJR1BVX0gNCj4gDQo+ICsjaW5j
bHVkZSAiZHJtdGVzdC5oIg0KPiArI2luY2x1ZGUgImlndF9jb3JlLmgiDQo+ICsNCj4gIHZvaWQg
Z2VtX3JlcXVpcmVfbXVsdGlncHUoaW50IGNvdW50KTsNCj4gK2ludCBnZW1fbXVsdGlncHVfY291
bnRfY2xhc3MoaW50IGNsYXNzKTsNCj4gKw0KPiArI2RlZmluZSBpZ3RfZm9yZWFjaF9ncHUoZmRf
XywgaWRfXykgXA0KPiArCWZvciAoaW50IGlndF91bmlxdWUoaSkgPSAwLCBmZF9fOyBcDQo+ICsJ
CShmZF9fID0gX19kcm1fb3Blbl9kcml2ZXJfYW5vdGhlcihpZ3RfdW5pcXVlKGkpKyssIGlkX18p
KSA+PQ0KPiAwOyBcDQo+ICsJCWNsb3NlKGZkX18pKQ0KPiArDQo+ICsjZGVmaW5lIGlndF9tdWx0
aV9mb3JrX2ZvcmVhY2hfZ3B1KF9fZmQsIF9faWQpIFwNCj4gKwlpZ3RfbXVsdGlfZm9yayhpZ3Rf
dW5pcXVlKF9faSksIGdlbV9tdWx0aWdwdV9jb3VudF9jbGFzcyhfX2lkKSkgXA0KPiArCQlmb3Ig
KGludCBfX2ZkID0gZHJtX29wZW5fZHJpdmVyX2Fub3RoZXIoaWd0X3VuaXF1ZShfX2kpLA0KPiBf
X2lkKTsgXA0KPiArCQkJX19mZCA+PSAwOyBcDQo+ICsJCQljbG9zZShfX2ZkKSwgX19mZCA9IC0x
KSBcDQo+IA0KPiAgI2VuZGlmIC8qIF9fSU5URUxfTVVMVElHUFVfSCAqLw0KPiAtLQ0KPiAyLjQy
LjANCg0K
