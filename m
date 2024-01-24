Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94262C46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 15:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710E110F77A;
	Wed, 24 Jan 2024 15:06:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4069A10F779
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706108807; x=1737644807;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Y2tco3mU9T7Y0xJhotphi6n3bqozm/ZkDxRALK2Y7ko=;
 b=SI4Yp6DaqW6mv66SF2wBnvaK1kN7q8OJGwUmCEJUSazUBIjTMh2AZkWO
 55/+AjKFAJKVASNu4EKoimcRpy1isQ2TeBdF2geQOZH4+jlQ9rK3Xq3/s
 0QcpOjwfdNXPBRn9oAew30oNOelPcssV3ea2HxGaH1cKEsU32/Q75/8u2
 01DBotyebgov0BSgUvQzT5QRRF5AOLDp+Zh6y6rnTz8cz0VPhqAxXQzrJ
 fNqxL6KnpNuCD/tU1XItR8FkPEYPAwHMnT1M1DKIbzewRUV+rGPGlz/J3
 N1Y4zTP6+RMfYA7HCbgQXTpMwZsAAMnj32z+i54GWOBkC6fZBR+25dQsc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1738301"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1738301"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 07:06:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="786445691"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="786445691"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 07:06:29 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 07:06:28 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 07:06:27 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 07:06:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 07:06:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oF1LPpF1NjpdkEJIMlsxoCeuYZs1VV/BQ8SFhwCZxClVDU+Ijw9xLpd5WMVc8y4z9JkLae8jolAbfbTfnnQdoQ02K25gtEw/wv4dI9aeb5+vdrisIKxwe7sXOrmSsUY5XKdFrv4nby2DX9wg47e36uLdDGLhEuirG+ZQlsT8/YJfhK0ZYKQ/TkYYGWmLVHoxWdgbSz4rIr9pF8YEbpiEQGb2g55PmXgmyYoawouTZfxRm5ZivGt3XiG7ux2dBe3vUMMfwc//dCvmqkjj+Xp/59k6ZzBCRTt/Sv1ih8JGMqkvN3kG6LG0SrEIUgQSkUkd+CzwHticfuWP0i6oAMmt6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2tco3mU9T7Y0xJhotphi6n3bqozm/ZkDxRALK2Y7ko=;
 b=PrULv2l3bnljsA+MJB3tpAnra+6FePvpeYzJgclSdoQmCJML2cK+1z8pIiD2+K4yKSuDmrpYs0c0ZDbrWi16hb+XTPHcpgTiKSqHIDBJTS0cgHpzCnnFLX+AzKqwYGxtQyR1Q5E1K9R5LP4HWapiPnQ+7zaqxZqsMKy8tZMHyunomEtjTyUOFAO/uAt41bswJtJvz6ZBOVk76uu5TXudPySkKOc8H3+ExPhcftHtA1LTNKyWJVjhoK6k5ndHui6/FOmGSS9Rtaxyd8lQKVYAif95d5/53qJf9XCXZyPKHDzGoOOrRSCeQoIEDtk+2r5heznfnhH8Crmi9+P1ZIxZbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by BL3PR11MB6434.namprd11.prod.outlook.com (2603:10b6:208:3ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 15:06:21 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035%3]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 15:06:21 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B, Jeevan"
 <jeevan.b@intel.com>, "Srinivas, Vidya" <vidya.srinivas@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_psr: enable given psr mode only
 after checking enable_psr modparam
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_psr: enable given psr mode
 only after checking enable_psr modparam
Thread-Index: AQHaTq+QvShZ7R3CbU+8z/I4YgWdV7DpCccAgAAE85A=
Date: Wed, 24 Jan 2024 15:06:21 +0000
Message-ID: <CY8PR11MB6889638F55B0F884870A338BDA7B2@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240124103410.1259607-1-kunal1.joshi@intel.com>
 <20240124103410.1259607-3-kunal1.joshi@intel.com>
 <4ff7b717-8c2f-4180-a22c-4ac66c835972@intel.com>
In-Reply-To: <4ff7b717-8c2f-4180-a22c-4ac66c835972@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|BL3PR11MB6434:EE_
x-ms-office365-filtering-correlation-id: 93685ca9-5421-49e7-ad5c-08dc1cee068e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eQKILwuuN83lsF8jwoDVK3qwIIud7+D2S5nXAVBYDzKvNFT/XY2Nqvzxwckpje0hqxTwI/51Z3ml7+UbkTEAI/Ssji0nn/pVvFQyIMy3p7r5BCUrSUpupX9GcXG+cY8YLi3NGtn9PsSI7AsVxoPF/RDbL1Hgc/jWCg1Rbcx+N23PLbqNc5KDiNCwGe2F6WRFWahZ03cJnKNnWvOZgAgGfW8AigJ7LQuqtAPh+jpaz/Bp7lNxsFNGMqtAtkcw6v8laAxNvB1U6+6huJfxDcse60WN70y8D6B1WR52AOGOrTmDMSUmRGOFK0WnwiLrTouW9yoDnefJ6iNeM7KU4WXlpCcWmLpsqIJCopuG8h54YHhwNIXNdaqDmXG04IqE1Q0VG6Qm9CEHq4/J1+EW4vAC/NilYsa2QXrlSsRwxV5z21YXAOYSOveeUgPL+gFcKNLmcZ47/0ZvmxEo5odGoLBiT0zFYSIhaXOYPGaAlUUOkiNeF8N77cGTmaku0uivyXuyT2iWU+VYHpeiUb3Dmo54uosOaBEFIvAUf044x3UgthclgYppbvTVgNmj1WL4mIE0jpitdlgrdTd3n8fwqI8+zwxdmm3xiN2lEM1ZL9tpafhNiI724qySFyZuBoPqupo7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(39860400002)(366004)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(55016003)(110136005)(2906002)(5660300002)(52536014)(6636002)(66476007)(66446008)(64756008)(66556008)(66946007)(71200400001)(76116006)(8676002)(8936002)(478600001)(86362001)(82960400001)(33656002)(38100700002)(38070700009)(53546011)(9686003)(26005)(122000001)(316002)(41300700001)(83380400001)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VytMaUVyR0tibXBTOHIzSWQzRkM3QlQyZVVGcnRpbHp6Umx1ZlVPaERlQVJZ?=
 =?utf-8?B?Z3hkTkx0MS9OZjhva25ETEZsYnlIUTBuQ2VkbHA0U3RJR2FSRytzb0dXQUMz?=
 =?utf-8?B?WWJWZGc3V1kwMkUwUkVSODBROXQ4RlI2bG53cFgzbEZnOStSTEdTaDVKK2VH?=
 =?utf-8?B?ZmwxdUdqajRvdmpBR3Q0V2M1Z2ZhNVc2SmJRcUJTcUVZbWsrZ01hVVJXY3Fs?=
 =?utf-8?B?c01qaGJ6dkczYzJGa1N6TlQzaXRYS2RLbEhUVTEvSzNDSU1BdmpaaEx0bEVy?=
 =?utf-8?B?ZWJIYkU1bzZXNzUrajVDSU45a1VkSmxjbGNmcklCSThPblYyNTBza29oT200?=
 =?utf-8?B?NE9Qd1ZLZ3hDRHorRWNoaGZWOXhXMTRpbzMraElHZ3FEUkxNQmFzODhNNldN?=
 =?utf-8?B?Ynl6dm5xYlM5bzZMUnpLYkIrazNhWmY2MjlDeGV2R0xHUStHZ0NtSUxrZG9K?=
 =?utf-8?B?SUduTDFwU3crUTdiZ05CUnpPeE81a050bDdleThjY0dnVkVaMENPS0JDaFE5?=
 =?utf-8?B?WmVQUFc2aG5mdnJUNndtWWs2T2hpNklIMGRmUkpVQ0t6bmZ1MVVlV1NsdEsx?=
 =?utf-8?B?bEdEU2E2b2gvNm5uaFp0RGZWLzNadC9INXAxenBsb3FPcklkZFRPZUdXUVFD?=
 =?utf-8?B?U3pseGRHUHJsZjFVcSs0U0JCUlVRWnhZa0FzZ2VGVVl4ZVRJWXZoRVE3aHp0?=
 =?utf-8?B?YmVZZVZaL3E3bjFYN1RjUE1XTkVXdnBMNjVvai9YY2Fyck9XOC9taVBoR3dB?=
 =?utf-8?B?T08wSDY2a3ZuOU9BSUhrSUZYcXc0S1lwQlA3Rm1RTGZ4VVk1NTQxamxwN0o0?=
 =?utf-8?B?ZDB2eHphUEdmc2kzdExsdW56SWxtY1c0R2pqZ1FxTnZQb3ltTHMyb0w0dE54?=
 =?utf-8?B?aE93b1FibDhSbG9tSDAzNHRPR2xYc0h1YkVpWmZsdGozYTFRVkloR3pSVlJy?=
 =?utf-8?B?V2lrcFp2aWRLcmw1eVhCMHdxQllxNTcvdEp4UFdZc0NNVnVQY0grcTRhZHdl?=
 =?utf-8?B?cllMWEwyNElMOUVXRnd2eHc0eGszL0toZWVZVmRjOGZqaDEybk4zaWk1emRh?=
 =?utf-8?B?SFlzYUpBbDZ3bmpHSjVqVlA3ZVpXY0ZEQzBvUFd1SHhEa04wME1YUFY1NThP?=
 =?utf-8?B?K1Z0T1dTc1BONXBxKzErZUsxN0JwVWNVNFFrbWRWUUF3Wi9FVzF1Q1ZUMnZl?=
 =?utf-8?B?Zk5YQ0VCaitZUEVQRHlKdnRZK3Y4RDdnZm5jME5DY2sraGhiUjlrRU82ZWVl?=
 =?utf-8?B?bVY4RG1jbktyMWs5MUVhYkt2QWtreTVWVWl5czdJT0UweTFmbXBvQ3h3SWxq?=
 =?utf-8?B?amhsTjRZSmhLSk1tc0NJM3FoYXhBOFc4ZEVwenJSdDJwemtZNUJ6ZTR3aGxX?=
 =?utf-8?B?ZThkRERHcngrdGFLZnZRZWF3WHkyY2s3SGlIZ01OdkVZOTRwUGJUYU5TNHl4?=
 =?utf-8?B?YTI2S0V0ZmVMdEo2d1BGYURuTENGSXp1UkRvay9jRVNMRk5CZEgweXhCR2tv?=
 =?utf-8?B?eEFLSUMraThVU01TbzJ1R0hFWmNBU0Qxb2dkaGhLL1VUc1loeTVNQzNjWWxU?=
 =?utf-8?B?Z1oxUk5YdTdsTzRUd2NKTGl0WHdjTS9rMTV4bktOM0t4a2xSR0dCWGdLTG9Y?=
 =?utf-8?B?NjdSWFh3NnRnZVZWNkpJWjRISVpDRDlwZ1dvL2dsVUYrYlpDNmw0VzE5bE1U?=
 =?utf-8?B?UlBTK3NOQ2VQc1F1VEloejRJU0xSaWlzV0FFOEsydTR5cGh0VHFKRDNibnNt?=
 =?utf-8?B?SjdOSzE2S3NvcGpGaFZhQkJ3TDdLN0w0MllrMjdZSm5zN1JIeDMxMWdqbHlX?=
 =?utf-8?B?NXZWc2ZlNHBQNlZHQkdtMURxVGFoTk9lOTh5djFRSm1nYldaS0w1QWRQRkZl?=
 =?utf-8?B?cU44TElkK3pXZzB5YzJBV0NyU0ZXd1AvOTBaNzByOTcwdmhYRHJQdlpjM3ZV?=
 =?utf-8?B?clEzMjBvcmljbkVYMGtvU0tkc28vN20zMlY4L3VqdDIya1VLR1U3TkplM2Jk?=
 =?utf-8?B?eGFCRHViaDk4NWVrVGJxOXFHeklSY09NZUpJUEwrSG5Bb1hQUjlkRkFDZndv?=
 =?utf-8?B?OW54ZjdZb1RLN3FnclRvRjdua0FqdUp3NTZ6V0xHWDRYaHlKeWJCczZITEhT?=
 =?utf-8?Q?X982Q2/pW+EfaV9PkLd9GrmRj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93685ca9-5421-49e7-ad5c-08dc1cee068e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 15:06:21.7354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vYi8GkS+o2HxlSQCcBuSp6DhTrql72XsZXgDGgt5nKrFULYIbKf3n4F2NcgOGSlMvdah88ubYGqYqj42RzgCRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6434
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

SGVsbG8gQmhhbnUsDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBNb2RlbSwg
QmhhbnVwcmFrYXNoIDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwuY29tPiANClNlbnQ6IFdlZG5l
c2RheSwgSmFudWFyeSAyNCwgMjAyNCA4OjEzIFBNDQpUbzogSm9zaGksIEt1bmFsMSA8a3VuYWwx
Lmpvc2hpQGludGVsLmNvbT47IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBCLCBKZWV2
YW4gPGplZXZhbi5iQGludGVsLmNvbT47IFNyaW5pdmFzLCBWaWR5YSA8dmlkeWEuc3Jpbml2YXNA
aW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCAyLzJdIHRlc3RzL2ludGVsL2tt
c19wc3I6IGVuYWJsZSBnaXZlbiBwc3IgbW9kZSBvbmx5IGFmdGVyIGNoZWNraW5nIGVuYWJsZV9w
c3IgbW9kcGFyYW0NCg0KSGkgS3VuYWwsDQoNCk9uIDI0LTAxLTIwMjQgMDQ6MDQgcG0sIEt1bmFs
IEpvc2hpIHdyb3RlOg0KPiBkb24ndCBlbmFibGUgYSBwc3IgbW9kZSB3aXRoIHBzcl9kZWJ1ZyBk
ZWJ1Z2ZzLCBpbnN0ZWFkIGNoZWNrIHdoYXQncyANCj4gdGhlIG1vZHBhcmFtIHZhbHVlIGZvciBp
OTE1X2VuYWJsZV9wc3INCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEt1bmFsIEpvc2hpIDxrdW5hbDEu
am9zaGlAaW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTogSmVldmFuIEIgPGplZXZhbi5iQGludGVs
LmNvbT4NCj4gVGVzdGVkLWJ5OiBWaWR5YSBTcmluaXZhcyA8dmlkeWEuc3Jpbml2YXNAaW50ZWwu
Y29tPg0KPiAtLS0NCj4gICB0ZXN0cy9pbnRlbC9rbXNfcHNyLmMgfCAxMiArKysrKysrKysrKysN
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3Rlc3RzL2ludGVsL2ttc19wc3IuYyBiL3Rlc3RzL2ludGVsL2ttc19wc3IuYyBpbmRleCANCj4g
MzQ5NjcxYjAwLi41MjFkNGM3MDggMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19wc3Iu
Yw0KPiArKysgYi90ZXN0cy9pbnRlbC9rbXNfcHNyLmMNCj4gQEAgLTQ5NywxNiArNDk3LDI4IEBA
IHN0YXRpYyB2b2lkIGZpbGxfcmVuZGVyKGRhdGFfdCAqZGF0YSwgY29uc3QgDQo+IHN0cnVjdCBp
Z3RfZmIgKmZiLA0KPiAgIA0KPiAgIHN0YXRpYyBib29sIHBzcl93YWl0X2VudHJ5X2lmX2VuYWJs
ZWQoZGF0YV90ICpkYXRhKQ0KPiAgIHsNCj4gKwlpZiAoIWlzX3Bzcl9lbmFibGVfcG9zc2libGUo
ZGF0YS0+ZHJtX2ZkLCBkYXRhLT5vcF9wc3JfbW9kZSkpDQo+ICsJCWlndF9za2lwKCJlbmFibGVf
cHNyIG1vZHBhcmFtIGRvZXNuJ3QgYWxsb3cgcHNyIG1vZGUgJWRcbiIsDQo+ICsJCQkgZGF0YS0+
b3BfcHNyX21vZGUpOw0KDQpUaGlzIGNoYW5nZSB3aWxsIGNhdXNlIHRoZSBza2lwcyBpbiBkeW5h
bWljIHN1YnRlc3RzLiBTa2lwcGluZyB0aGUgZHluYW1pYyBzdWJ0ZXN0IGlzIG5vdCByZWNvbW1l
bmRlZCwgaW5zdGVhZCBkb24ndCBydW4gdGhlIHRlc3QuDQoNClNvIHRoZSBwcm9wZXIgcGxhY2Ug
Zm9yIHRoaXMgY2hlY2sgd291bGQgYmUgYmVmb3JlIGNhbGxpbmcgdGhlIGlndF9keW5hbWljKCku
DQoNCi0gQmhhbnUNCg0KSSB3b3VsZCBhZHZpc2Ugd2UgY2hhbmdlIHRoaXMgYXBwcm9hY2ggYW5k
IHNraXAgZHluYW1pYyB0ZXN0DQppbnN0ZWFkIG9mIHVzaW5nIGNvbnRpbnVlIGFuZCBwb3RlbnRp
YWxseSBoaWRpbmcgYW4gaXNzdWUuDQoNCj4gKw0KPiAgIAlyZXR1cm4gcHNyX3dhaXRfZW50cnko
ZGF0YS0+ZGVidWdmc19mZCwgZGF0YS0+b3BfcHNyX21vZGUsIGRhdGEtPm91dHB1dCk7DQo+ICAg
fQ0KPiAgIA0KPiAgIHN0YXRpYyBib29sIHBzcl93YWl0X3VwZGF0ZV9pZl9lbmFibGVkKGRhdGFf
dCAqZGF0YSkNCj4gICB7DQo+ICsJaWYgKCFpc19wc3JfZW5hYmxlX3Bvc3NpYmxlKGRhdGEtPmRy
bV9mZCwgZGF0YS0+b3BfcHNyX21vZGUpKQ0KPiArCQlpZ3Rfc2tpcCgiZW5hYmxlX3BzciBtb2Rw
YXJhbSBkb2Vzbid0IGFsbG93IHBzciBtb2RlICVkXG4iLA0KPiArCQkJIGRhdGEtPm9wX3Bzcl9t
b2RlKTsNCj4gKw0KPiAgIAlyZXR1cm4gcHNyX3dhaXRfdXBkYXRlKGRhdGEtPmRlYnVnZnNfZmQs
IGRhdGEtPm9wX3Bzcl9tb2RlLCBkYXRhLT5vdXRwdXQpOw0KPiAgIH0NCj4gICANCj4gICBzdGF0
aWMgYm9vbCBwc3JfZW5hYmxlX2lmX2VuYWJsZWQoZGF0YV90ICpkYXRhKQ0KPiAgIHsNCj4gKwlp
ZiAoIWlzX3Bzcl9lbmFibGVfcG9zc2libGUoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5vcF9wc3JfbW9k
ZSkpDQo+ICsJCWlndF9za2lwKCJlbmFibGVfcHNyIG1vZHBhcmFtIGRvZXNuJ3QgYWxsb3cgcHNy
IG1vZGUgJWRcbiIsDQo+ICsJCQkgZGF0YS0+b3BfcHNyX21vZGUpOw0KPiArDQo+ICAgCXJldHVy
biBwc3JfZW5hYmxlKGRhdGEtPmRybV9mZCwgZGF0YS0+ZGVidWdmc19mZCwgZGF0YS0+b3BfcHNy
X21vZGUpOw0KPiAgIH0NCj4NClRoYW5rcyBhbmQgUmVnYXJkcw0KS3VuYWwgSm9zaGkNCg0KDQo=
