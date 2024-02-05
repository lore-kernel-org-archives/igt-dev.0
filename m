Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C13C48291
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 10:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36B910F515;
	Mon,  5 Feb 2024 10:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJg+bM35";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDC610F4FD
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2024 10:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707130640; x=1738666640;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UtTlzhCCCD3xJdgJ1X7OTKVfQV/+UpG4uBrdTG4yjE4=;
 b=kJg+bM35gAbu2bhNwkxrGBFpW6ZvAfpKLqrS8T1dgv6C8CEXyEDOQNyy
 yadp1tnGkd4o6UqjGdavogEPBduLsLU2i+Mzugfm4YNB4+aH/ze6reBt5
 YL4F8+WWgzIJ7HFwzZVOSfOGrSS5ihwKJVoZXgtwZ7IXaf2sRXp6ayoma
 VWNm1H7NDUEP/ufu+k7uQ6LboxBgmCuVKRuJcnnyrELDq5/PX5k6gXk7t
 WzYZ/N1KhlpMkU+vbDOUe3HZwHhU4ot/ImNy7TW/HK/cQLLgdIRSo2geO
 hPwixgKl1gjQ7MFXtjn0U8OTf2tgpbto3nGF+yLtikYM58UZ4qdO6UMGn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11144136"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="11144136"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 02:57:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5307199"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2024 02:57:19 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 02:57:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 02:57:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 02:57:18 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 02:57:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtYtfle6nGFdEqBsQLV6Qi6vKbEJMh10hucU4tuA2K/kfshVSjLXcEyz2s7WKyhzm1R4eRUNZvfvtG26NjdUqd0iqxNRsgt4KLbv3tdSIuGe8+U+uOxJJdfhjJK3orc8V8i4RiNPHTkxH5qte8QoIh3rIv8vZETfxzHJGGvju+sJtBJusogd0HvZD8NvhBEl2fJCUNLKqcyqOO1T2ZcPehnERH5dO7vBeO96ocdgcvaK9u/AMhXxx9ysJfQHnWHOo/WvFEfb44R5zT49Tu8/Tm5wYrzbgsYwkmlqFVsnUrajqfkDCOAOSCjnYEAesg4leogl9Jk2IAcfNiEGEUVWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtTlzhCCCD3xJdgJ1X7OTKVfQV/+UpG4uBrdTG4yjE4=;
 b=Sooq5GLTPSJwAlSmkMi8+KvjMDTBTLCOEgacXRGhuGgDXR29wbGDLaXeRLJNh6ZUkx3wW7RLSEazzRz9W0eG4AJ7dF9SXjyj5TLg2FZgIh2FUyz9yhpCksAyShqVR6MV3EbnJx8MAa8D12MIQEVByA3QjUPBUBgREB/Zlm70ca8Yt0gWybyxlTnxze9R1dYLTSDycVpklE1bN37o/s/HHC1m7Le+VAjFAjBAv04uqKMnI+uYAbVHbrpyXbjTq092QhLMA9Voz+HTAuddOcBSmlZ2k4lxbYoasH4xYwU1i1HShvEprMUc/4FYfpUV144C6KR79/UtNsTiLqy/S2SKEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 10:57:16 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::bca1:ed6b:639:bdfe]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::bca1:ed6b:639:bdfe%4]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 10:57:16 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "Hogander, 
 Jouni" <jouni.hogander@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/rendercopy_gen9: Fix Xe2 missing pixels on
 non-modulo-16 surfaces
Thread-Topic: [PATCH i-g-t v2] lib/rendercopy_gen9: Fix Xe2 missing pixels on
 non-modulo-16 surfaces
Thread-Index: AQHaVTLIRNY388I5tkySIxgfjQx/xLD7mcCA
Date: Mon, 5 Feb 2024 10:57:16 +0000
Message-ID: <387a31cddc81f8ab84c91e85116267afe57dc652.camel@intel.com>
References: <20240201171840.412905-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240201171840.412905-1-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SN7PR11MB7042:EE_
x-ms-office365-filtering-correlation-id: 187700a0-02f0-4447-446a-08dc2639373c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Irsq0nDTq1XmVBnrNEJ9SVvelS3lET7tcAEdlVlfUAL64PhluHnHl7YKAmM1/TNNkuSu5oaCOQP5jqqTN+t0dUm0nJoBew0xn2ENw5bIYGVWM8Gxc3E3RQ3DIsfy/Oytumyjz4fHs4AUmZD8dUDpItKbpTZ7Y6l3urtMyJw6AQF/X+g1AVv79Jyfwslb3BFIFFF3VQk/Zinzv52seRPu/TCrEU2HZmoW39GanMzx4wRAnNrZt+la2TQhW4/rgkBRcKfhyhklQquN2P/g4WzMOvGNq/QzKFfoTn1aImxE+oWxhDclpV5EjtD0X1Kdd3GEqQSItWdEvhN5Jn0OLt/2oVsRpUrGCVQpvgtuemv0jcyZVcfGkQBWFQfTSd05tudnSEZ2kaVROdibcGzO6W9aROUsexkOAykNAztKwPxgnRxpbP6ZH9fNUIHr2s8OBBMGnCIXMS6K2c4TljFCoPfBM1yrJs+xZwX87lux4VdwmjpZeqKH7+lJyM2sqNMKv3HfNBCDhnnY5rKvOmOhsIg2lDX6eNedPqP/RNsH8MmeP+rDWGAL2cmaXf4vTrDEQLmjjt9Grz7aPtWTswco5Fk9N/84g2vdoPBCxniu23KpVAtFl2qgV/uafDR0U/R4UWd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(41300700001)(38070700009)(36756003)(2906002)(2616005)(110136005)(76116006)(66946007)(107886003)(66556008)(6512007)(6506007)(6486002)(478600001)(66476007)(64756008)(66446008)(86362001)(83380400001)(71200400001)(5660300002)(316002)(54906003)(26005)(4326008)(8676002)(8936002)(66574015)(38100700002)(82960400001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUhJVzVCZzNTMndJTndGU1Ewbko0ZjR1ekxNTXVLbEd4SWlIdVNIcHBOSlpR?=
 =?utf-8?B?RElFTTNSMnNLV0pFZ3pRYy9DZG5rZGhvME84ZWRRMzVPdEMvQ3diR2FRUXZl?=
 =?utf-8?B?eG95Uk9vWExKcWVUbnlqejdBY3hzQ28xdFpQYWhpd2gzdkR3bGlER0w4VkNv?=
 =?utf-8?B?WFNrWHA0dERWTWpNMGt0amlna0VkcmM1Q1JaTjNyM09QSDhsc01LV0dlVlc1?=
 =?utf-8?B?R0FnU3phZ0w2clIwc2x0bkFrS3IzNVY3UWRSTld3dW1Jam9DV0RKV05xVHZF?=
 =?utf-8?B?dkFqWXkyZGdCMHgzQk9rbVE1b05mK0d5YjZ2UkFncjFWUzVpd01nVzluL2hx?=
 =?utf-8?B?ZUZ6WkJ3eTBheXJDUWQ0Q2l2M0pFam04K3cwaUlROEJrUks5QnNlWmJ0UElE?=
 =?utf-8?B?VGtPcE1RRzJZdGNxNTdFZGNNaEVhSUdORnNUanBhRVAvb09saE1kVlhPSFFN?=
 =?utf-8?B?WjVHWFBKdFRaVkFyZkdLbjV2bVhNSjhSaXlLYUJrUlVDRkpqNFIxMlhoT3Ex?=
 =?utf-8?B?dUpGZXJqZTl4WUtkUWVPbGwzR3FTREh1Tkhhdyt5dmI5a3JXQmcvNldNa0ph?=
 =?utf-8?B?Q1M3WVNUR0VMNFhydHphZnU0cjB1Z3NyZnhBRkVzSGJiaGFBWVM1TzBGV1Fu?=
 =?utf-8?B?bjRpV2F6T0tEcjg3bWM4ZUJQaEowZWlVbEpTUDB3aTZUb1dWbmoyQ042Uk9F?=
 =?utf-8?B?dFIva2dkYW1IUHUxLzBXWlphOFBoUHlqYnlYSW01U25FN21JL2VlaE55aDlv?=
 =?utf-8?B?WnJJS0Z4ekdIbkp6eFkzZTkxdXFldUtDUFJZUlEyN3U4VkJwMm5JblVnZUpk?=
 =?utf-8?B?UGZnU2ZGZEVJd0NnM2VNRU43YUdyb3BGcUVuZDJ6a2l0SG5pMDhGaThrTXQx?=
 =?utf-8?B?c0pvWUZIZEk5aWllTytFenV0bExLMDh6V3dyQTlySjZZNXNNQnltUTZIQ0FR?=
 =?utf-8?B?NXExeTFiVnk1U0JoQ1UyV3E5cU9PanJnVE5XSFN0WDdLam9mUVNrc3FNamRJ?=
 =?utf-8?B?YTBaQkNsdytOZ1M3YXlwSndScXY0bkpwVTdaS0Q5eWZJaDhsajh2MG5ERUdC?=
 =?utf-8?B?QTM1N2piMkJWV01zcnMvSmluS25WTk9iRjFLS3JHYytSczYySzNnV0cyL3Rz?=
 =?utf-8?B?ekVUVGxuNkRtRk82bHZrSUhUWUFQTHA4ZHlPMGFWbjhhUUMyWHloY3pxRGxz?=
 =?utf-8?B?YTFTWitZSXdCQ3lXWGJRWE5HTVVZemtaNkx4RFkxOVp6TExIaWZ1aGgwMmpS?=
 =?utf-8?B?K1RqTEs5Uy9TVSsrcVViMy8wWGg3SS93NnN1U2FIbGg2blUyamhPY0ZicmdT?=
 =?utf-8?B?c0cxSzZvZjVqYm4zU2tyTzBzVUhUMkxYTElSa3NSNVFwWnRwZkc2SjZqTTZk?=
 =?utf-8?B?V1lPT0R5RmhCZXo3K2JvTDRIa3MxVC9aUEt4Z2V2d0J4QmpzY0o0aTVFVllx?=
 =?utf-8?B?NmxOS2psZzBXWEVDNytOWWU0aEwvanFTSzVLaXFlVndSZ1pDTVlZbzhyZzla?=
 =?utf-8?B?bGNzTjY1WTROd0ZYUWhMRkVCWFV5SjhtQ3VoK1JTcnJ1RStSYlJQK1hPSDk3?=
 =?utf-8?B?QmMyM1QxZjNNZEFvbmhrYWJhdkc2MmprTnVocDB3SmdzODhWTVNGY1dMWi8w?=
 =?utf-8?B?QWpNcnQ1MXhLaSs1dmNaMnJFWHFmdlBtdklTdU5iVk5rNVlGZkFBSXo4ZnBw?=
 =?utf-8?B?elNIM3RGOEc4WGs3UGtBV2x1a3BsMXpXQ05hUVN6RnhLVUtOZVJQRlVzOUhq?=
 =?utf-8?B?U2xMQitObjRaYTZRMUV0WVNka0U0b05mNTJIVU9nZGN4ZGxLZEJmWmd3blF4?=
 =?utf-8?B?NzBuekRqS3lvblgzUXJOckVMRnN1SFF0QlY2WHBtbFMzd3JHb2lJeHlxazBa?=
 =?utf-8?B?NGJ4TjJ5L1lQNER4a1VZRVFQUVl6REpMV2NCajBmb2ZCTDVaNllRVkkrYmpU?=
 =?utf-8?B?SFNGTW9QbmZ3d2VNaCthQzdoWmllOEs3UEI5MFVKTXhNNE03bmhDR2k0QlUr?=
 =?utf-8?B?MTBXd2hvQWFqTmE4bWZQdjFLcXB4L3E2N05WdXJpSnFoVWJCV0Yyc1RQdjQ2?=
 =?utf-8?B?WWdXV2R2QU9PNXlXcGhXMnJuT2NUZWdXRk5RL0Q4Z0JqRUVxSUJZNTNnQnZ6?=
 =?utf-8?B?dUNiSHFxTWVHTkNxM3hTRlFhV0I4SkZVZE95RE1ucmU1TnNYUGg5TTU3aTJL?=
 =?utf-8?Q?a6zArZ6DM1CmysGGsqXnARg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E97FDA06FF94640B20413E6B3BEF048@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187700a0-02f0-4447-446a-08dc2639373c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 10:57:16.1115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PjLoCkYNLjt6Sro0+hLurb/0RhM1r97eso9il9GnQ98bK7hpGNqsadFe9NjdAaKDkFIwSJNcezyJrvKh3CUlFZxkCiLk13AbLwt00e2eI7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
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

T24gVGh1LCAyMDI0LTAyLTAxIGF0IDE4OjE4ICswMTAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IE1pc3Npbmcgc2V0dGluZyBLZXJuZWwwRW5hYmxlIGJpdCByZXN1bHRzIGluIGxh
Y2sgb2YgcmFzdGVyaXphdGlvbg0KPiBvZiByaWdodCBhbmQgYm90dG9tIHBhcnQgb2YgdGhlIHN1
cmZhY2UuIEZpeCB0aGlzIGFzIGttcyB0ZXN0cyBkZXBlbmRzDQo+IG9uIHRoYXQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tp
QGludGVsLmNvbT4NCj4gQ2M6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2ls
YUBnbWFpbC5jb20+DQo+IFRlc3RlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRl
ckBpbnRlbC5jb20+DQo+IC0tLQ0KPiB2Mjogc2V0IEtlcm5lbDBFbmFibGUgYml0IG9ubHkgb24g
WGUyKyBrZWVwaW5nIG9sZGVyIHBsYXRmb3JtcyBpbnRhY3QNCj4gDQo+IA0KPiANCj4gLS0tDQo+
ICBsaWIvcmVuZGVyY29weV9nZW45LmMgfCA1ICsrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL3JlbmRl
cmNvcHlfZ2VuOS5jIGIvbGliL3JlbmRlcmNvcHlfZ2VuOS5jDQo+IGluZGV4IGJkZmQ5YmUwODcu
LmE0MjIwZDc4ZGEgMTAwNjQ0DQo+IC0tLSBhL2xpYi9yZW5kZXJjb3B5X2dlbjkuYw0KPiArKysg
Yi9saWIvcmVuZGVyY29weV9nZW45LmMNCj4gQEAgLTg2Myw3ICs4NjMsMTAgQEAgZ2VuOF9lbWl0
X3BzKHN0cnVjdCBpbnRlbF9iYiAqaWJiLCB1aW50MzJfdCBrZXJuZWwsIGJvb2wgZmFzdF9jbGVh
cikgew0KPiAgCWludGVsX2JiX291dChpYmIsIDApOw0KPiAgDQo+ICAJaW50ZWxfYmJfb3V0KGli
YiwgR0VON18zRFNUQVRFX1BTIHwgKDEyLTIpKTsNCj4gLQlpbnRlbF9iYl9vdXQoaWJiLCBrZXJu
ZWwpOw0KPiArCWlmIChBVF9MRUFTVF9HRU4oaW50ZWxfZ2V0X2RybV9kZXZpZChpYmItPmZkKSwg
MjApKQ0KPiArCQlpbnRlbF9iYl9vdXQoaWJiLCBrZXJuZWwgfCAxKTsNCj4gKwllbHNlDQo+ICsJ
CWludGVsX2JiX291dChpYmIsIGtlcm5lbCk7DQpBZ3JlZWQsIHRoaXMgS2VybmVsMEVuYWJsZSBm
aWVsZCBkb2VzIG5vdCBldmVuIGV4aXN0IG9uIHBsYXRmb3JtcyBiZWZvcmUgWGUyLg0KVGhlIGNo
YW5nZSBpcyBkZWZpbmV0bHkgbmVlZGVkIGFuZDoNClJldmlld2VkLWJ5OiBEb21pbmlrIEdyemVn
b3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQoNClJlZ2FyZHMsDQpEb21pbmlr
DQo+ICAJaW50ZWxfYmJfb3V0KGliYiwgMCk7IC8qIGtlcm5lbCBoaSAqLw0KPiAgDQo+ICAJaWYg
KGZhc3RfY2xlYXIpDQoNCg==
