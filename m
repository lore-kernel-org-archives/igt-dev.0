Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DB4C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 13:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF4B10E9F4;
	Thu, 21 Mar 2024 13:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8uipTLa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3B210E9F4
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 13:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711026442; x=1742562442;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VGfhI2EbeD+KD7YV3uKZQeID2mxWRGrpplnCELJiBYo=;
 b=N8uipTLaXb/+Zxja98GcRbt8ANby8LFv/jWYWCRmCP+Nbsw0QbxAKCSg
 5taZrcDn4zq1uUBgsh/F3p260m71wFEGscjHugNqJ+j9NW0vhM7h0tZX/
 XYkBxJBlZ/o4edSlckh4seF98+d6mi3Mcw6US28A533NAu8j21Jk8+jJt
 NL2i3BJ7hpshjuG0wnC61uoBdDq59h8bTzJHDDzjTx9HwgLu8yBOB5BX4
 cZVsFSNnQs+JA5g5LJrO1213iNeM0pDZ4vLPZlmbG1juv+q+G6Ob9zQgW
 JoQRzzfuGw5hSPGS6spiGCb8ck/BsWmS2r7zMkg23rM0EPVolnvp5yJXv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28484594"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="28484594"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 06:07:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19150033"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 06:07:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 06:07:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 06:07:20 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 06:07:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odS9peyJ55zT/pZIbxZK8EE5pIQlFx+7vnxul8pQJ48eN/SnSIJSS72OpFmOkltqgURV/MEB/Dro5TglOOlVCbeRlkPtte7cG6s3StbUNdm6zTwQFHYpqtpBrVHZ2bVWsnqkIMam8GmYPxSLe34G5y0WICjZv+NdRxFzLQbxKFDbf1K9FgY2s1zrkWATU+mZkDNL8YYn+rzdj0b+UGs3AgakZbXh28hjfr04T/UlgVFTBTz8FTI+6ubkXCrUIVw1rFg17Rx+UkERHqsd3g4zLe/N2gVaw+0JyLvwTc9geXNm9urQwI9L+V6rGIjBvdQlzXR2oBhyIpNu6nhdVCv3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGfhI2EbeD+KD7YV3uKZQeID2mxWRGrpplnCELJiBYo=;
 b=TC9Lwnu1ZnmdmKMuIpmCh7r1HP+yb+vRVQTVVBVKAGgGlIsA1hzYC0R73XWs0nh7WF8O+7gZd07CSGF7oPvhNMg6FtMp1mubXbg+Sqt1ywIAHHTNlcVLIGg2lLrV+a1+yzu61xtwQBC9mI7/p7mI9ruLgcW8t6qTQfXtZto+zBzM/LpkDl16s8Nt3rZYJGG28Gd6u3S9l0XAs7wpn6XorAa5fGoPbgTQLLrkOg+Lnb9tnkMBdfHxVPlUMzGm9QCHMjSLWnkFX2aP4rO8lxEbSrWOq7NPzv254zPtC6GOJne22bpd1loMFGqriS3GiDShDjJulNmxNuTj6sxWVdfcWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SA3PR11MB7434.namprd11.prod.outlook.com (2603:10b6:806:306::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.10; Thu, 21 Mar
 2024 13:07:18 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::925a:e0c0:f164:3078]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::925a:e0c0:f164:3078%4]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 13:07:18 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Janusz
 Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Subject: RE: [PATCH i-g-t v14 4/5] tests/intel/xe_exec_basic: add multigpu
 subtests
Thread-Topic: [PATCH i-g-t v14 4/5] tests/intel/xe_exec_basic: add multigpu
 subtests
Thread-Index: AQHaet9SrSOnhhlKPUy7FAQbVQ+/cbFCKzQQ
Date: Thu, 21 Mar 2024 13:07:18 +0000
Message-ID: <DS0PR11MB726409E1170E235B5CCFE1C1D9322@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
 <20240320155659.33518-5-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240320155659.33518-5-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SA3PR11MB7434:EE_
x-ms-office365-filtering-correlation-id: cc3fc5be-cec0-48d6-62e9-08dc49a7d639
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tobtFxO63+0t1YDzatP0+k8KjkdzvifH1aq7tHeeTl7iZBg2KhUkKJ+eUBcR8yWkDA1zbBCCrMmsaDzXyVzJRJxaKXlpVWyrEXNM9SKLJedWveQyLir1pgwoNLVyo36/Sty/lMN/hBvkZBVFhxaPzsoLyzG8kRxQt+mPlqs5YehD9sQ3IaUWeNCu2Y4xSM6qoB+d/94FFC6+TJyFnahBM1gYCLmmSY7uRd8DgwyO1myt77UpZB1XkGbwZIr3JAQw8kDzpjWBIzx7iKIgmOKq3Yp1O9C3P9kl8dLXnnNE4a3OHP15R3TKje3T5F/oQrnH0EF5xf6Kw2f7ch7Plq7xR0we00o7/WeT7KsRa/UHRLKXypvWm1beZ3CcH2F7+k+6Ddr8rzH2s4SZN2uZWBlcVFKHVO3WoY+E9F6n5tM1umd8LJ13RaF+QtWwQwrFND4IrsV4IVWDMPqDDBBX1ANb0kEO5XQOdMNz0hIFIOLo+a0vqOsKyinZk8wSySR/UG2wWzJKu6y1ohedWDCyjemwin+x1WKGNYzTQJUmOvNzrL2U8k8U7WvdCQyKjYPUyEh6A0c/w+l/QLJkvdlr+e5uBssil8l6ZpOpmHRnAex4RAoovtumiYeiS0/NmJdlTR/jQmo+XG6Bmp1KcSy6e+/cdA3iDl/ny6q/fuGYvMnuTEmZf+kka65sJs+TzvZlAbX6Kyx70Xs+Rf695Qq/hExmw92wO4icCJAKhAPgz4AY8jg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjlLOWp2YzZSK0J5RncxK1hsbnR2OE1IV2dZYkRJNGNEUlU1RU1XV094ODdH?=
 =?utf-8?B?M0dLU3RzbVZDQnBGVHF2eG1RTGNxZHEzaG9xT3Y0bU4xeWZKVklzekd3ZU1s?=
 =?utf-8?B?OEtaZWlTQWZKd280Z2FaMUFCNG04WVJnWTY3bklXSVFwVVVGMEJqckNLWEE5?=
 =?utf-8?B?cXFwU2NISHlKblNST0ZkZm85bXJ5MXJiWFJBSDVBSXZrVHJvRy9KY3ZkR203?=
 =?utf-8?B?Sk5McytFRGRCdGtzcU9UMUxVbC92TjE5b1h2M3RHZ0Z5cDR4bG1MWVBWcmww?=
 =?utf-8?B?K0hoZU1SYkhDdzQ0dkFwc25MclNESyt5QTZMUFEzSkVCaFUwNUhoZVIyU2xx?=
 =?utf-8?B?QUJGUlBsb1hYNmx2OHRXL2RWOWZxcEZUNFRmcjRtcVRFRktrKzBiSExia09V?=
 =?utf-8?B?SFpOeEgvWXNpbWtaM1ZlV3lxNExvbm91UVlpNVQwRVA1dXk5VTBsZHRJZkRn?=
 =?utf-8?B?U0swcGVORTFSNkJaK0p5cTBIWUt1NzZJYlR3eWZzVzJsb3Z5YkJFZk1DSEV6?=
 =?utf-8?B?Q3F6NERkTTRra1dDOStMcWxaamRxSm5URi9jd1NkWUowTFd2Y1BDaTlGcnFz?=
 =?utf-8?B?blBwbzhYNEo1aFA4aDQ0V1NaOVV6SkdjY2J2UFlJUUxSTEJIVk1qWko2VC9I?=
 =?utf-8?B?RktENzJEN0cwNFBuc3pGRFpxd052N25vWXJqYzZrMlEyVE00Qk9Uek9rNUxz?=
 =?utf-8?B?YzQrSDdQK2J3TW1ybWp5NUd5MEhCYURsS0pXbElmWmxKUE1GcGpYUFZLQXcv?=
 =?utf-8?B?bmlQVlRMUkVNTTN1UWE5NjN6TEs3T3FtTXR1bWV6cFdtMzZ3NWZsd2JCTnR4?=
 =?utf-8?B?Z2tRUll0N0FMN2VNTE5UWG5jYVFqaEFwVXNnSVNOMlMybXM0czhNR1JGM0ZE?=
 =?utf-8?B?dFBEV2xzZzdOYmdXN3ZuNGxGTnRlOVRhaHVpWmJpU244a0oyUGdYbzZmcU4x?=
 =?utf-8?B?c3VYaGR5aGFLV0JWNk9ZV0NMSk5qV1RCN1BQK1JrSHNOendUazluSVl2V3FT?=
 =?utf-8?B?NjJnWHpYNnQycUtKVnFURHhFWmhlSGpHTXFXcEpuY0lBWlA4c0Q0Ymxlclg0?=
 =?utf-8?B?UkQ1T2J2WlJ5SmJuZ3VEa1JVSEFtOWRJL3J5R2l1L0xJbStnVlVEYzVCYUxx?=
 =?utf-8?B?UUxSZll0a3pEZjN6K3p5WlRDcVlDcGZmOU5XQ2RudDViT2JGeDM2L0oyU3dj?=
 =?utf-8?B?ME8vZGR5V2VWZy85MVFDVWVJL25zTXRhTGVON3cxS3h0RU82dTMwekhjT3Ey?=
 =?utf-8?B?eVVLdU1ZbmZWNGpWVFFaT2s0VlJsL2twdUN6VjdxaDM1N0daZlpZK0syVTc5?=
 =?utf-8?B?aEliUnp2M0l3RmJZOUdQSDhLeFlMQ2dtNmRHMlFQb1RNOU9Bc3VjTWJlSWoy?=
 =?utf-8?B?VHVHWDBkY1E1UFRwcmtTeTlFRHZBUmpWbjlLWVFRK0RGVk9YQ3FyR1gvUU1x?=
 =?utf-8?B?akFJajdZZ3lQL0g0Wk8rSWdoeFI1SjRJb1JhM3JCblhxZEJsUGxPbDUvZ0JG?=
 =?utf-8?B?ckNOYzdMaFVPelRrMWZKd0RWVDVaK0lYWC9sM0lIOWV2NXZGSnliRTJoKzlC?=
 =?utf-8?B?RHMvZzBYZDZXMnlaRDIySFl6N3h3OTJLZlAxVStiSnIwTkRxMXVoUE5XblYv?=
 =?utf-8?B?R05UTWdSN2R5NldJbVk4R3l2eTcwVHZqcnlJVDVyMnN2ZjAyWEdpK2pZc1ox?=
 =?utf-8?B?cTROMHNnbWZFdzlmRE9XN2Nld3RTdzhEczM2bHNCbFZ5U00yd1Q0Wmhyanp4?=
 =?utf-8?B?MCtxSTE0dzlRdUpHNlNLamozNnQrSk9ydlBnakpPQ0FsWHJTaWxpUjdVbGM0?=
 =?utf-8?B?MDZIQnpBR05lRUpJSFE1UzNoNndLdW5oOEhDUTdUQlU1cXVXdGttbHFsZjAw?=
 =?utf-8?B?cHgxdGhvcHNLNUhsMXpldFFyMExDaFhUeElQVTJ0TGRYY0R0UTNHd0kzb0dq?=
 =?utf-8?B?YThwNHN5dHVZWjZpdWVtMjBaSFlXNE9oWUpyMmFZWGh0TnZPNFloSHl6UDBI?=
 =?utf-8?B?R0RWZlAvWFc3NmpVNFR4UFdqZ2R5RG9yS1Z1UUFkM3JQSkJyTFZqNDMxajli?=
 =?utf-8?B?L0NlZ3JyNEtxWlpmbWhpdm9NMFF5NFJwQVEvMTNNS2ViSml1UFJzeUJ4dUVP?=
 =?utf-8?B?dXN6dC9Kc2N2NXRyS2VaNVRDdndwMDF2c1RoenpPV2hNVmNsY2tERFE1a1I4?=
 =?utf-8?B?M0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3fc5be-cec0-48d6-62e9-08dc49a7d639
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 13:07:18.1662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y/G7xMpzqBtG7x+PoY/mu/hbrmieC5oAKDjmUR4umZUZACyZTEsPxMgh7/C+We/zEjyGS/giao+I43q/XpI2mrQwTR7bEZA3tgijxLInZD0DN49k5AbcUS6ZWQZsQUxT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7434
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

UmV2aWV3ZWQtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlh
dGtvd3NraUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBT
ZW50OiBXZWRuZXNkYXksIE1hcmNoIDIwLCAyMDI0IDQ6NTcgUE0NCj4gVG86IGlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pu
eUBsaW51eC5pbnRlbC5jb20+OyBQaWF0a293c2tpLCBEb21pbmlrDQo+IEthcm9sIDxkb21pbmlr
Lmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPjsgS2VtcGN6eW5za2ksIFpiaWduaWV3DQo+IDx6
Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBKYW51c3ogS3J6eXN6dG9maWsNCj4gPGph
bnVzei5rcnp5c3p0b2Zpa0BsaW51eC5pbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWct
dCB2MTQgNC81XSB0ZXN0cy9pbnRlbC94ZV9leGVjX2Jhc2ljOiBhZGQgbXVsdGlncHUNCj4gc3Vi
dGVzdHMNCj4gDQo+IEFkZCBhIGZldyBtdWx0aS1ncHUgc3VidGVzdHM6DQo+IA0KPiBtdWx0aWdw
dS1vbmNlLSoNCj4gbXVsdGlncHUtbWFueS1leGVjcXVldWVzLW1hbnktdm0tKg0KPiBtdWx0aWdw
dS1uby1leGVjLSoNCj4gDQo+IHJ1biBvbiB0d28gb3IgbW9yZSBHUFVzLiBNYW55IHZhcmlhbnQg
d2FzIGxpbWl0ZWQgdG8gdGFrZSBhdCBtb3N0IGZldw0KPiBzZWNvbmRzLg0KPiANCj4gdjEwOiB1
c2UgbmV3IHJlbmFtZWQgbWFjcm8gbXVsdGlfZm9ya19mb3JlYWNoX2dwdV9jaGlwIChaYmlnbmll
dykNCj4gdjEzOiB1c2UgaWd0X211bHRpX2ZvcmtfZm9yZWFjaF9ncHUgKEphbnVzeikNCj4gDQo+
IENjOiAiRG9taW5payBLYXJvbCBQacSFdGtvd3NraSIgPGRvbWluaWsua2Fyb2wucGlhdGtvd3Nr
aUBpbnRlbC5jb20+DQo+IENjOiAiWmJpZ25pZXcgS2VtcGN6ecWEc2tpIiA8emJpZ25pZXcua2Vt
cGN6eW5za2lAaW50ZWwuY29tPg0KPiBDYzogSmFudXN6IEtyenlzenRvZmlrIDxqYW51c3oua3J6
eXN6dG9maWtAbGludXguaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBLYW1pbCBLb25pZWN6
bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50
ZWwveGVfZXhlY19iYXNpYy5jIHwgMzYNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfYmFzaWMuYyBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNf
YmFzaWMuYyBpbmRleA0KPiBlNmY4ZGI1YjAuLmYwMjMwYTljYSAxMDA2NDQNCj4gLS0tIGEvdGVz
dHMvaW50ZWwveGVfZXhlY19iYXNpYy5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfYmFz
aWMuYw0KPiBAQCAtMTEsNiArMTEsNyBAQA0KPiAgICovDQo+IA0KPiAgI2luY2x1ZGUgImlndC5o
Ig0KPiArI2luY2x1ZGUgImlndF9tdWx0aWdwdS5oIg0KPiAgI2luY2x1ZGUgImxpYi9pZ3Rfc3lu
Y29iai5oIg0KPiAgI2luY2x1ZGUgImxpYi9pbnRlbF9yZWcuaCINCj4gICNpbmNsdWRlICJ4ZV9k
cm0uaCINCj4gQEAgLTU0LDYgKzU1LDE4IEBADQo+ICAgKiBEZXNjcmlwdGlvbjogUnVuIG5vLWV4
ZWMgJWFyZ1sxXSB0ZXN0DQo+ICAgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QN
Cj4gICAqDQo+ICsgKiBTVUJURVNUOiBtdWx0aWdwdS1vbmNlLSVzDQo+ICsgKiBEZXNjcmlwdGlv
bjogUnVuICVhcmdbMV0gdGVzdCBvbmx5IG9uY2Ugb24gbXVsdGlHUFUNCj4gKyAqIFRlc3QgY2F0
ZWdvcnk6IGZ1bmN0aW9uYWxpdHkgdGVzdA0KPiArICoNCj4gKyAqIFNVQlRFU1Q6IG11bHRpZ3B1
LW1hbnktZXhlY3F1ZXVlcy1tYW55LXZtLSVzDQo+ICsgKiBEZXNjcmlwdGlvbjogUnVuICVhcmdb
MV0gdGVzdCBvbiBtYW55IGV4ZWNfcXVldWVzIGFuZCBtYW55IFZNcyBvbg0KPiArIG11bHRpR1BV
DQo+ICsgKiBUZXN0IGNhdGVnb3J5OiBzdHJlc3MgdGVzdA0KPiArICoNCj4gKyAqIFNVQlRFU1Q6
IG11bHRpZ3B1LW5vLWV4ZWMtJXMNCj4gKyAqIERlc2NyaXB0aW9uOiBSdW4gbm8tZXhlYyAlYXJn
WzFdIHRlc3Qgb24gbXVsdGlHUFUNCj4gKyAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxpdHkg
dGVzdA0KPiArICoNCj4gICAqIGFyZ1sxXToNCj4gICAqDQo+ICAgKiBAYmFzaWM6CQkJCWJhc2lj
DQo+IEBAIC0zNjgsNCArMzgxLDI3IEBAIGlndF9tYWluDQo+IA0KPiAgCWlndF9maXh0dXJlDQo+
ICAJCWRybV9jbG9zZV9kcml2ZXIoZmQpOw0KPiArDQo+ICsJZm9yIChjb25zdCBzdHJ1Y3Qgc2Vj
dGlvbiAqcyA9IHNlY3Rpb25zOyBzLT5uYW1lOyBzKyspIHsNCj4gKwkJaWd0X3N1YnRlc3RfZigi
bXVsdGlncHUtb25jZS0lcyIsIHMtPm5hbWUpIHsNCj4gKwkJCWlndF9tdWx0aV9mb3JrX2ZvcmVh
Y2hfbXVsdGlncHUoZ3B1X2ZkLCBncHVfaWR4LA0KPiBEUklWRVJfWEUpDQo+ICsJCQkJeGVfZm9y
X2VhY2hfZW5naW5lKGdwdV9mZCwgaHdlKQ0KPiArCQkJCQl0ZXN0X2V4ZWMoZ3B1X2ZkLCBod2Us
IDEsIDEsIDEsIHMtDQo+ID5mbGFncyk7DQo+ICsJCQlpZ3Rfd2FpdGNoaWxkcmVuKCk7DQo+ICsJ
CX0NCj4gKw0KPiArCQlpZ3Rfc3VidGVzdF9mKCJtdWx0aWdwdS1tYW55LWV4ZWNxdWV1ZXMtbWFu
eS12bS0lcyIsIHMtDQo+ID5uYW1lKSB7DQo+ICsJCQlpZ3RfbXVsdGlfZm9ya19mb3JlYWNoX211
bHRpZ3B1KGdwdV9mZCwgZ3B1X2lkeCwNCj4gRFJJVkVSX1hFKQ0KPiArCQkJCXhlX2Zvcl9lYWNo
X2VuZ2luZShncHVfZmQsIGh3ZSkNCj4gKwkJCQkJdGVzdF9leGVjKGdwdV9mZCwgaHdlLCAxNiwg
MzIsIDE2LCBzLQ0KPiA+ZmxhZ3MpOw0KPiArCQkJaWd0X3dhaXRjaGlsZHJlbigpOw0KPiArCQl9
DQo+ICsNCj4gKwkJaWd0X3N1YnRlc3RfZigibXVsdGlncHUtbm8tZXhlYy0lcyIsIHMtPm5hbWUp
IHsNCj4gKwkJCWlndF9tdWx0aV9mb3JrX2ZvcmVhY2hfbXVsdGlncHUoZ3B1X2ZkLCBncHVfaWR4
LA0KPiBEUklWRVJfWEUpDQo+ICsJCQkJeGVfZm9yX2VhY2hfZW5naW5lKGdwdV9mZCwgaHdlKQ0K
PiArCQkJCQl0ZXN0X2V4ZWMoZ3B1X2ZkLCBod2UsIDEsIDAsIDEsIHMtDQo+ID5mbGFncyk7DQo+
ICsJCQlpZ3Rfd2FpdGNoaWxkcmVuKCk7DQo+ICsJCX0NCj4gKwl9DQo+ICB9DQo+IC0tDQo+IDIu
NDIuMA0KDQo=
