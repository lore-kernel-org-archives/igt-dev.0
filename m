Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FC5CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 10:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F8E10E6AC;
	Thu,  8 Oct 2026 10:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="evsV+5ym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA6910E6AC
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791454081; x=1822990081;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZPtuWv3oafyF4wBtgoOopJGzqdcmKfp3puoMQdr/z68=;
 b=evsV+5ym2HHLtEHkILGGL0YeX6nB67h/ux0Cn+VkLfuaESPy5g9x1jq9
 tUOANVL7kabQlzy5EYVLpsPkPTqXdYeo1h5uByL6XBPpKfiVoJg0Liquu
 u6DCXYi08qmS3a/EHmybdU/w6ZoOgvYDjJUVEYseM5nsIdoYY0BrE4Jb9
 S05UY0Gsut9oCz+197nsWMSTv4pEUVOvCxIMU5pmupMPfyx9JIFnaiZ6w
 Wlym6vE6vEbmhB7gB7AC8GDFsUL3K/QDsL1TcsNrngm0Y8OawwUcgIZQC
 g1h6J4XCKWHB2mcg1Joh62MTrC57H/zOwXnWu6U2mu29GOnmeCx/2NqiB g==;
X-CSE-ConnectionGUID: hhnHVwyQSEO/x3gpgzANAA==
X-CSE-MsgGUID: 58LWwdteRfqQcOH+j5DxCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="114353"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="114353"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 03:08:01 -0700
X-CSE-ConnectionGUID: bLJr+7S+RK61gbXVsEvEtQ==
X-CSE-MsgGUID: smOOSc/TRjGban7QJGjM9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="15460"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 03:08:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 03:07:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 03:07:59 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 03:07:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDZtAJUniyqZgHJZl9Noe1AAOjno42lDaG/haBREu0eOAoLO44rJcZRcocN2Aym7y4PN+piF2zyobqLbNo3wbc639iWP9ZNih6G8fxEVTLf6AjwpmwybDAsiDOJr7o8tQBr5vcHVha6krF0hyQabpGO5PA30G/nzwGav5sNe60EOKxvxRKbuMBVjXYoryB47Tn20o5EJxjDLH62+/tzs2rMJ18/ELUCIOvjX5tzAOkgrnTVN+Mgk25eYBJVVHvB3CFcSGUkBI4X69TiUw5hSaknsAMpOavEXstvB3EuvHMEzziV9bhX1LVTWwj/Ae6Cg0mwkdcuThArRp6JBP67m2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPtuWv3oafyF4wBtgoOopJGzqdcmKfp3puoMQdr/z68=;
 b=VvWXMfCLuIzUVYu4hJpHpdWNPllC0VNErfebxNTK7fFTUsK7Hf1WW/ogdmMVIaklzzxLWcDZttVzLp+XcK9sNiYp7E3nidJDzajZVR7zhqPId+4RElXlM38kqUDNuUNR2S8k772oygAVp/7Tb6qUG7Ln5JZuWceTN2HwkEWxHjxmNaEndg9p+tY8rNmF8yQluSpQhEiB5xmXdJZSYkSE0wG/sd7b+K/MLoFc0JjcSFZhkRlz2Q9rUJMFsShmrKrOvZWRcelhsx+UtLnI0NS/4m2vYemjR0TqBWS0/XSPbJLQaBoChQr76BQX38T4LJcKRBRRV+mRD41Zs5mZtSMvBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 8 Oct
 2026 10:07:51 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb%3]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 10:07:50 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>
Subject: RE: [PATCH i-g-t] Revert "intel-ci: Allow PXP negative testing on CRI"
Thread-Topic: [PATCH i-g-t] Revert "intel-ci: Allow PXP negative testing on
 CRI"
Thread-Index: AQHdVuAmieFJi3SnAkSoPmeYqgqwGLbzabkAgAABE3A=
Date: Thu, 8 Oct 2026 10:07:50 +0000
Message-ID: <CH0PR11MB556411647C1FF782180BB34B98932@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20261008044627.2730162-1-himanshu.girotra@intel.com>
 <20261008095942.ux335bsybvyw6744@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20261008095942.ux335bsybvyw6744@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|SJ1PR11MB6156:EE_
x-ms-office365-filtering-correlation-id: 024c8af2-8af3-4beb-4fa5-08df252402f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|38070700021|11063799006|56012099006|4143699003|18002099003|6133799003|22082099003|10067099003;
x-microsoft-antispam-message-info: MY4mti+T/8Dbw4K7YWPoqY7kBinRHhHv00BUXsL41BLpr1Ah57Me4i1RLVNy6vNPXYU0I0goxJ/5sSuAn0vLABTs3JIyhqLSLmukvV7pqg4NZ0PSwH6/Z+K/L8Ox7Nf7vU2E6v9kFoMseJ6okbvWRdvJO39Xr1X88/WjT+Y8hF6OekK0WHQW81PQ9V8Pd67XdDC6ljzN8Ggp9lkjE7vTs0SEvCQ6OjJdyYk7Is0X4gIo3/Kbz4b6kUgfd2qoh9P4aZlFRkZUolQX4+wwwaqIW4qXAreOFaJJGuaZv7YrOOv+h7gk78Youml59mM5PcJS0eaIwTFmk85q7ml9liUCI6bZpIDCcluD83uOvWL1UJPumFyudGHpA/pJvoA2pK27HvnlPhSAf/g5m6yLoJx3oVRyy9diqMQS4eujFxnVAo1VVfzTt+JCunfy0cmKz3+AzM7R7Ip9SvAYspX/Bn42BqDnZBGkQmohJY/kCO5QKxHnir8hw2RLCuHSpONdHEoJdsPQeBc02jMm58wX08k3Vqae2Z9aFHf46adPqbXCaA86xflrm9IacMDfgv1/6C/dHiK2Q7eKCbxNHKbnQNVDQR95Htberg7bexR7bzGvoymVQH8Q+tbdsUsv6nPRW4MQwnxLRaMn6Or8bOe4hPXISSYxSnsnV64WuZpi84TvtPz6EE/Uj4FV43PU6xjTGfvHfhRh9jkjFvS/VLh7aR9fE+2X+v2wihB0e5kmkGb88K4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(38070700021)(11063799006)(56012099006)(4143699003)(18002099003)(6133799003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TndURGhVb3UwNWlIaWJsVW1oMVE5cVBiT01pKzRFUEFhaXBaR0s4VkZzcXRP?=
 =?utf-8?B?ZHYzTjVmUHFrNzRiNlgrbWdkSFlZZUF6M3dYR1NSU253NUV3WjYrTTlnbS9a?=
 =?utf-8?B?SUZvakVZaGt0Q05SaWpsZ3l1OXZ5S2dGUnhUWDhCYVJVQTRWa3RqWXhrWmMy?=
 =?utf-8?B?ck5yN05LaUY0T3BTVzlVMlh6MVoxaW9VZWpSZHZtK0pZQWZGdWMzam42MXBR?=
 =?utf-8?B?S3M0d2E4WUpja3F2c1lvaE51QVIzUk9rOVlOcWZ6UHhBNWJGR0hiY0EzbkNF?=
 =?utf-8?B?TEVHY0prZlBRSGUxYXNYV2phQjI3MGZLN1F3UVFEb1BQMmJqSjlURnJ0WmJy?=
 =?utf-8?B?VkhXYzZXZkVKRUtRbG9sR3FhL0duZFo5ZDIyWDlubm5vTEJEWkJhREFsaHdT?=
 =?utf-8?B?N3ZvL04vS0szV2l3bTBDb1ZkSXkvM0RyVU16dVc0QjJRTkhQU1psamFMRjBq?=
 =?utf-8?B?TWVwREhsNDFjd0tLRnNOenk0N1g4S3FSdHAyTGFhSzZHcDcxdnVKTVQvNWE1?=
 =?utf-8?B?TXhYakZkbnI1YUxWKzBOQzNXa25GZ0NBaEw4UWxnbkZ5M2R5bUorZ1VxTHFP?=
 =?utf-8?B?Y0dZbzJwZjRSMmFlZm8xOWtOellSRUtjYWNIUVZDbjB5VSthWDJGakQ0YjdQ?=
 =?utf-8?B?dUV3YkdJeUx3NFBOVW45ZVNVME5SdjkzaWZMRUpHU2t5bmNzUnBYcEI3eVM5?=
 =?utf-8?B?d1BRSGp5SWVlM29MQUU2VlYxY1UyNzdDaWZrdU11RlJWemF2eWZ5d091b2dy?=
 =?utf-8?B?YW1WU1lENmZFNDJNaUZmT002VW5VdHYyVEtUd3B1M2tUeXZkNVZiRDRlN29Q?=
 =?utf-8?B?TXBKUjc1QW02Zk9GRmpFN2k3d0U0cW83ZVB6Sng1c1ZQT054Qklib2FBKytJ?=
 =?utf-8?B?VkJ1cU5mUVBRTmhvU0lYOEZ3VXdCc1JVMkhTL0J1a3UvbUtBa0tPWUVYY090?=
 =?utf-8?B?QUhaRytYb2EweklqbUJ3WXVEYkJvQ3hHMWNOZUZ0VzkvdFU2RDZBNVVlaE5l?=
 =?utf-8?B?VU5rd0lIRGpHVHNHRG9kcG9rdmpXd211TVV4RFdiOCtTSGoyN21oby9QODlx?=
 =?utf-8?B?SGRIYk4zVWNSZ29oL2N5d1U4MHVxYnlMNEdTUkF3UG5xODhBdE9YQU1PNHli?=
 =?utf-8?B?NGQxWmtNZXljY0tBVVcvc0pwdWxiQ0xCTFdrMFdlR0NJRUZPb2xBVVp6MHRH?=
 =?utf-8?B?ajArVWJKOU1OWE9NUldVRFhqMEYrQ3E0eUJldWRIQUtEaGdHZU9MaldpZVdy?=
 =?utf-8?B?WnNpVTRNQkNrNW0ybUZQcjJZR2lCUGh5d3NDeGtCRWFwdXpCZnpJNzZ3Q1Bt?=
 =?utf-8?B?QUNsa29ZK2JOdVFFUWF3cjg3WjU3U0wzMG04ZVh5L0lkdWtqOXRlVDdxTkdi?=
 =?utf-8?B?Njd3bEdVZ1A1OFJIcHl6a29HbUpNTUQ2aDF2eXNHRkIyZ0hyM2VxMkh1clhs?=
 =?utf-8?B?eVRiTUhyMVB3cFRGNXBUQ3ZNUXZTNHBYbHlCQ0J3Sld1M1l5MUZnZDNUZnNk?=
 =?utf-8?B?dW9SUDVrQzFwZWU4OHVjVFhUN0pZMlp4TzJpMGNsazhHdkYrY3pRKytnbGtL?=
 =?utf-8?B?OFVKQisxSmpDcWRuREdORU01dUxMRUlnZWhnL1RpU2xoT0JVcDAyOWgzREUx?=
 =?utf-8?B?blZUcHljVk1ZVGtOSEpKd1BvSXZhRE44cGlocjVXaEhkcDE2NStsbXpQbVdm?=
 =?utf-8?B?UFJNMVFtRW53bjIwL2M0QXN1UWVjYWN4MU1ockFlSUx3a1ZSd2R2YmllS2JE?=
 =?utf-8?B?RGxwcTlVM1pGYTlYejhiOUdEMVRKaEErQW9aNHdXY0FHczlKRlFIVUJPemFD?=
 =?utf-8?B?b2QwZDBRdGdTOHU1TFJ1L05vdTJyeHMrb0lrWXhQbVNtdXAzSnZoK1hYdnRJ?=
 =?utf-8?B?dVFOZUQ3VnhRUzJ2akw2NVlBYmRRcDhOeWRFa0N1a3grYjh2VTFPK0NpQTB4?=
 =?utf-8?B?M3o3UFpqUHVNZUZjSTlueGNERnZpbHdUdVJXOGt3eDB5K1prbFgzSmNCaUlV?=
 =?utf-8?B?TEp5MElYYlVXdDRTTXJwMkpCUFRzMDJpempoMGZjY2VqbFc5RzBPeitycDQ2?=
 =?utf-8?B?MldjUlJFb0ZoMTE1Q2RuajZoNjFRSEYvL1huTEVZUWxIOUhiOG9jSkJrVEZ3?=
 =?utf-8?B?YVBpOHJUeHdnYmd4cXh3Uk0yUEtWU2NMdTF3V0d3L3dlaDdJTUo0TjRrcVlx?=
 =?utf-8?B?VWpiUXcwUkxQZXh2RkgzMjRBdkh2UitsK2I2WUVtakF3MHFZTTBwUEp3dDFo?=
 =?utf-8?B?Z3pDRlJ1eXpGV09lMHJ0RTQzSkZ6MW9Ec3d0V1MrVHMvbjlwYldmb1BIVlRD?=
 =?utf-8?B?MmVET25COGlFN1B0N0haYU5iL3IvU21TREQyREl1dkhsa1ZCNXNXQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Hq8kU2RjJbmkDGhiBKBn+6MeVei5UAeTfhpqPmd/vh1Rx8DzJj1xZusqbM8LT9FI5O3tZBHWjrRCuu9HNTH3kcby+SDMcwYBlS2r8iyVEUaZWE2WPjBd6kdXfxZqEf/KMKyyET4aJWaPN73wmFyywhIel3MuMa/h4Vwp7ggmd4IZQr8SIY93jd+E8skuw9H892FtnNH9gvwSgZkW5MJty/s/WdWTDALuRiOGeGaHFksYH96VrEbi4mS39bMOc+KDzcnZ4HNTbCSDHfJIztcO4FIM8PWmyFELBALLYBFdNIS+vLZvaMfB80fcGwybsEcxMpvwOHVG0YqDnItkr5IW3A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 024c8af2-8af3-4beb-4fa5-08df252402f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 10:07:50.8560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VMKVJdsvSYfhgAuUX12INxwBJbzN9jIMZfrdRSZvBQhLKoIfpgKgjLsT3G/FDH3c2lr4rX0uOyXgiL4p4I8Q+jeEvsoKqu4EOtC8s4HC7FA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEthbWlsIEtvbmllY3pueSA8
a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogMDggT2N0b2JlciAyMDI2
IDE1OjMwDQo+IFRvOiBHaXJvdHJhLCBIaW1hbnNodSA8aGltYW5zaHUuZ2lyb3RyYUBpbnRlbC5j
b20+DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgR2FuZGksIFJhbWFkZXZp
DQo+IDxyYW1hZGV2aS5nYW5kaUBpbnRlbC5jb20+OyBUZXJlcyBBbGV4aXMsIEFsYW4gUHJldmlu
DQo+IDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIGktZy10XSBSZXZlcnQgImludGVsLWNpOiBBbGxvdyBQWFAgbmVnYXRpdmUgdGVzdGlu
ZyBvbiBDUkkiDQo+IA0KPiBIaSBIaW1hbnNodSwNCj4gT24gMjAyNi0xMC0wOCBhdCAxMDoxNjoy
NyArMDUzMCwgaGltYW5zaHUuZ2lyb3RyYUBpbnRlbC5jb20gd3JvdGU6DQo+ID4gRnJvbTogSGlt
YW5zaHUgR2lyb3RyYSA8aGltYW5zaHUuZ2lyb3RyYUBpbnRlbC5jb20+DQo+ID4NCj4gPiBUaGlz
IHJldmVydHMgY29tbWl0IGYzOGVlN2M3YjNlM2U1Mzc3ODA4YmZkNzkzYjU2YzUzNmMxNmZkYTQu
DQo+ID4NCj4gPiBCb3RoIHB4cC1iby1hbGxvYyBhbmQgcHhwLXF1ZXVlLWFsbG9jIHJlcXVpcmUg
dGhlIHJlbmRlciBlbmdpbmUgY2xhc3MNCj4gPiB0byBydW4sIGV2ZW4gYXMgbmVnYXRpdmUgdGVz
dHMuIENSSSBkb2VzIG5vdCBleHBvc2UgYSByZW5kZXIgZW5naW5lLA0KPiA+IHNvIHVuYmxvY2tp
bmcgdGhlbSBqdXN0IG1ha2VzIHRoZSBzdWJ0ZXN0cyBTS0lQIG9uIGV2ZXJ5IENSSSBydW4NCj4g
PiBpbnN0ZWFkIG9mIGJlaW5nIGV4Y2x1ZGVkLCBhZGRpbmcgbm9pc2UgYW5kIGh1cnRpbmcgdGhl
IG92ZXJhbGwgcGFzcw0KPiA+IHJhdGUgaW4gQ0kgd2l0aG91dCBwcm92aWRpbmcgYW55IGNvdmVy
YWdlLg0KPiA+DQo+ID4gUmUtYmxvY2sgeGVfcHhwQC4qIG9uIENSSSB1bnRpbCB0aGUgdGVzdHMg
YXJlIHJld29ya2VkIHRvIGZhbGwgYmFjayB0bw0KPiA+IGEgbm9uLXJlbmRlciBlbmdpbmUgY2xh
c3Mgd2hlbiByZW5kZXIgaXMgdW5hdmFpbGFibGUsIHNvIG5lZ2F0aXZlDQo+ID4gdGVzdGluZyBj
YW4gc3RpbGwgaGFwcGVuIG9uIHBsYXRmb3JtcyBsaWtlIENSSS4NCj4gPg0KPiANCj4gSSBzZWUg
aXQgaXMgYWxyZWFkeSBtZXJnZWQsIHNvIHBsZWFzZSByZW1iZW1iZXIgaW4gZnV0dXJlIHRvIGFk
ZCB0byBjYw0KPiBhdXRob3IocyksIGhlcmUNCj4gDQo+ICtjYyBhdXRob3IgQWxhbiBQcmV2aW4g
PGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQoNClN1cmUgS2FtaWwgLCBJIHdp
bGwga2VlcCBpbiBtaW5kIHRob3VnaCB3ZSBoYWQgYSBtYWlsIHRocmVhZCBydW5uaW5nIHNvIEFs
YW4gd2FzIGF3YXJlIG9mIHRoaXMgaW5jb21pbmcgY2hhbmdlLg0KPiANCj4gUmVnYXJkcywNCj4g
S2FtaWwNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSGltYW5zaHUgR2lyb3RyYSA8aGltYW5zaHUu
Z2lyb3RyYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ludGVsLWNpL3hlLmNyaS5j
b3JlLmJsb2NrbGlzdC50eHQgfCA0ICsrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRl
bC1jaS94ZS5jcmkuY29yZS5ibG9ja2xpc3QudHh0DQo+ID4gYi90ZXN0cy9pbnRlbC1jaS94ZS5j
cmkuY29yZS5ibG9ja2xpc3QudHh0DQo+ID4gaW5kZXggMmU3Nzc5MDY0Li40MTMyODE4NmMgMTAw
NjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwtY2kveGUuY3JpLmNvcmUuYmxvY2tsaXN0LnR4dA0K
PiA+ICsrKyBiL3Rlc3RzL2ludGVsLWNpL3hlLmNyaS5jb3JlLmJsb2NrbGlzdC50eHQNCj4gPiBA
QCAtOSwxMSArOSwxMSBAQCBpZ3RAZmJkZXZALioNCj4gPiAgIyBWYWxpZCBza2lwOiBGZWF0dXJl
cyAvIGhhcmR3YXJlIGJsb2NrcyBub3QgcHJlc2VudCBvbiBDUkkNCj4gPiAgIyAgIC0geGVfaHVj
X2NvcHlAOiBObyBIdUMgc3VwcG9ydCBvbiBDUkkuDQo+ID4gICMgICAtIHhlX29hQG9hLXRsYi1p
bnZhbGlkYXRlOiB2YWxpZCBvbmx5IGZvciBvbGRlciBnZW4xMiBwbGF0Zm9ybXMuDQo+ID4gLSMg
ICAtIHhlX3B4cEAuKjogTm8gUFhQIG9uIENSSSBzbyBza2lwIGV4Y2VwdCBuZWdhdGl2ZS1weHAg
dGVzdHMNCj4gPiArIyAgIC0geGVfcHhwQC4qOiBObyBQWFAgKFByb3RlY3RlZCBYZSBQYXRoKSBz
dXBwb3J0IG9uIENSSS4NCj4gPg0KPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICMjDQo+ID4gIGlndEB4ZV9odWNfY29w
eUAuKg0KPiA+ICBpZ3RAeGVfb2FAb2EtdGxiLWludmFsaWRhdGUNCj4gPiAtaWd0QHhlX3B4cEAo
PyFweHAtYm8tYWxsb2MkfHB4cC1xdWV1ZS1hbGxvYyQpLioNCj4gPiAraWd0QHhlX3B4cEAuKg0K
PiA+DQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMNCj4gIyMNCj4gPiAgIyBWYWxpZCBza2lwOiBtdWx0aWdwdSBydW5zIGlu
IHNlcGFyYXRlIGNvbmZpZw0KPiA+DQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gIyMNCj4gPiAtLQ0KPiA+IDIuNTMu
MA0KPiA+DQo=
