Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3631CD343B
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 14:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A515410EDC4;
	Wed,  6 May 2026 14:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrkvdxqS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43B310EDC4
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778078285; x=1809614285;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GtaSJiLDU8mCSLjg7CCcX5flVUw6xBp7hpRAvfbKL2U=;
 b=YrkvdxqSwtwWxU9gXvLk08p0jsMWkKaRchv3kv60eRy/DkOtiL6H9HAB
 +dOkkA84yTP0M2pSbDkxuNV6NAZm44unhA/5vs/Zq5LiJZ3i+JJpYtQIw
 9gKuyn/kLkjbdL4J2BA0niskUPQsW446vvwtDULdYg+vPOUzFLDoycGk/
 9/9vHtWO2Dxc49OwDAsl79yetORVH6XX+aU5Bzir/jnU9HdktPCP3twcn
 8A2d9QFeDh1vYjJlQ/qe4BLhn8kkErUIUiD/x/4Z0nRKj1BMdlp/b49SG
 EKhM+962UnONfohvHZTxSZElQYUXzXeT1Pikd4nLaPr7/X/hiLzgY2MqM w==;
X-CSE-ConnectionGUID: 2QDfeMvUT0+yCiS35U1lzw==
X-CSE-MsgGUID: zSRwyJ7VREi+uFS4KTvyNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78159711"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="78159711"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 07:38:04 -0700
X-CSE-ConnectionGUID: ilj7BWLcT0GfFmTOJYWpcA==
X-CSE-MsgGUID: lMC5d9OnQm+nQQNGBP5c3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="231786208"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 07:38:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 07:38:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 07:38:04 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 07:38:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzZqK8gPfLiLbq5ONPS+0DCxsz1rJYvf6PNGyWEpvHIRu3Ea68aar5CbGpqCFZHNpqLCCQ5dQ18wVosr+VGVptz/nGrVzs87XhKRsHxZbYmK2rSJUw/MX4qET3ixQ69SbCGjOtF73nxInfMCsji6PggtBS9wgVSCfO520vE5pcemwDLVLuTOLwSRE9Rm79rteU0Z5fD5t9ui3zxzFmafF5d+RkiRHBb5RGhN38TaURMen0eqs2YEnN6oWHA9oiJXDRzci0k5l6eCbgLAjhCPjwtk6/dDeWdJnxe1Dvr+AVdQye0mIL3Xt/E0sCQVgzvw/ib7yUAdEyhRg4iuucKZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtaSJiLDU8mCSLjg7CCcX5flVUw6xBp7hpRAvfbKL2U=;
 b=FJ9Pqu9JTnDy064HFxryDuwL0AMo7Qq1FaLvvlA8opUj/t/6N774xPAGsuByusFIQd98XvKfS/6MXsyrOVrAAyWDUY5hQCHvVhY6Dhw3ucaOcTtsMPKU9rZfcbgtqeljBYd4ForWkW9YKocxwbT55umcWdaTKLlnsuGS7n/oYUzSs8GXr3yLslnIH35A8czK4jgZj2hoi/G8LcTekriHew8Idy6H/F/XOUadI7GMH9IAP/lDNtCY3R7OBt9GYk+VYIXjDNMAPkz54GX/i03/JDLtXEqUUK0y/oAvLF+LeK5dohyFknDpyeoviI/aPh9894nVaNIaULefGWifnKQEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by MN0PR11MB6206.namprd11.prod.outlook.com (2603:10b6:208:3c6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:37:55 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.20.9891.015; Wed, 6 May 2026
 14:37:55 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
Subject: RE: [PATCH] tests/core_hotunplug: exercise fd-holding subtests with
 Xe workload
Thread-Topic: [PATCH] tests/core_hotunplug: exercise fd-holding subtests with
 Xe workload
Thread-Index: AQHc3VtuBfTFiRhYNUWEsJ4PH/QVg7YBC6MAgAACdWA=
Date: Wed, 6 May 2026 14:37:55 +0000
Message-ID: <SA3PR11MB81181CA7FFDE5B350CDEBD51D03F2@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260506135714.1819588-2-nitin.r.gote@intel.com>
 <20260506141814.nseva2m4zhywwqxy@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260506141814.nseva2m4zhywwqxy@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|MN0PR11MB6206:EE_
x-ms-office365-filtering-correlation-id: b36f311d-3f67-4a51-1147-08deab7d0fbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: b8eSBJyO2nXixYFc66Q8BsPivYbOTVK9kh5ZqLZ6QWfYOxTKYL0Pfm0MwiB0WtgbQoEeyntk8hYkOsIJ8d2tnhu23UZi6/+S5PdyNL55h1/Ii0pwnPiAngdq+0FgpoW00YMu7CTO1qj1SMvJmyW1pwFz7h8cwjKA+exKELz7J+8bMKMDRIfG+yN+v6r6uBuqx/bu8E7IcTWGtmnGlWL6tw6I0VkyEK9eym0zZ8/zLV+8CHnREmInZnFAKNmgGZrT+Tt00AlwLKNeYASlVcN9T1xeG+FdibMjqdlXMw3xzQ01VK6GgV0/NUs6sMou6ZctJAvxdAW0bnM+sQjoWDVKjjF2HkCGDUByGoCPZWyrjKfInrYFIioWxCY+vaCkbZvi9HL614+iW87h4ZrBuSfIeWPQn3ZDEO62wL1RqpOKTuErWsxyZ0R8cAmw17et1zH8ZSHaJf3y0AbcmCflGzDfH9OxBSEDUinWSCFv995BkcS/AkVGF+c3mp51GaH8Zs79CozczCqhWMdV4GaCmoP/m8IxZyCPiLVtL/xGvzFkYOEsdvnIOQRl8wYpKEw1NJ/fkT0irzLc1xb3sjHS+kIBBW/GCQSJbA1+MXLElIiGXSN7gXeYt0s0aL1EtZ6aMAOxhKoHZAI0hx8uRXYEqwZG7ANWuarnT/m134ALXtgg5wQgpbrT7Oe69Zpyj5kOTlyy95bOG2edIPykh1hbhBwpFIDfPWOqqWZ8oMRJtnoT9tyeRBkhdfH00R9kcnTMt8oM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFVycUtaY3BWTWdyTE41NEt4cExsMXUrSW1zK1F5aTNVdmFXMUg3M204L0RE?=
 =?utf-8?B?NU4zQlkzNjMyS3A1NWMwY01BZGI0TXY1S1dUeUprYUoxQlh1enZneUlOMHB0?=
 =?utf-8?B?ckVKeXY4TDA0akMxbFovdnh2UTRaUHBKaFo4VkNoM0dHa0JhVi9MVHJ1R1Zl?=
 =?utf-8?B?ODJjZkQ0dnNjREpnLzY2dmw3ZjdWcVhWZnExWkt0aEtYRTZ3MjBSUjJVeTdr?=
 =?utf-8?B?dExQV2QxN1Y3Z0ExU3gzeTZaaTIvUUtCUVVhRHpYMHpNSWVlTWtpYjJ4OHR1?=
 =?utf-8?B?VGlBczQ4OS9lcHA2RE45aDRlRFhCbjQ1YVUrSUhtVTVIYlpzNW9uZlpHN2x0?=
 =?utf-8?B?dkdMR1ExREhtU2lNSmdLamFUcnJkdVlqanlIR2RFWnpZclRXdEtabjJNSEQz?=
 =?utf-8?B?OTVyVUFZVlg4VS9razR6S3hBek5kUDZWZkg3RTlhajNDbzVLZWNkcElqMk9R?=
 =?utf-8?B?M0lQckVHbzM1RVFoTVFEa1JWaFA0MTI0aVlCSTdZK0M4Qy9kYkxBRGEwOVla?=
 =?utf-8?B?RE5mblBhU2tSMWdDcUw0ZCtRQ2kzeGtLRkpJeHMzZDhURHlsK052aExzaWt6?=
 =?utf-8?B?RndTeXVGbnk2Nk5ERTJ5UzNWK2RlQUFOL2dsTXhuWml2NGxNb3QyeDFicjBI?=
 =?utf-8?B?UDF5bU1ScG4vRHo4OUk4b2NCU0tpR2NGUEY0N1J1REYzZGgvZm01NUJlamJi?=
 =?utf-8?B?eHEwcWFndzIzeXliVzZ0WUJJRkw1SDRVT1RhaTBNdFV6T2Z1cjRueEdWTE5U?=
 =?utf-8?B?ZXJmU3QraldJSXhGVTFicWVRSE9ncFFzQS9VTXNBWnY5Sy9OQzNXS3hIVW5t?=
 =?utf-8?B?Q0dHd2FadndXTXcwZi8xWGZJUERtalBFNmlSZkVqamxEVjVFWnkzdHZEY2Zh?=
 =?utf-8?B?OHhGalhxSkRodnJaVElwaUVHaW10RFIvaDByQkJTOU1jdGdlVkFPMFFMWWlV?=
 =?utf-8?B?Y2VadkJNaWx5N3Q4UndaWlhqSkRMWjc5ZC8vZU9HWGVscFExdmR4RzlvcytD?=
 =?utf-8?B?V2hjYy9YZDFodDRnNjZ1MHd2WW5xT0tGOWZCVEhZQ0pLSTBDNjBpdmx6VkF5?=
 =?utf-8?B?bXZ0K0RwT29PYTQyV21RRHpiNHJxWVhSSGkzRHF3ZGVoSENEZjVNZVIxbksy?=
 =?utf-8?B?SEZsYWNLK1ZzQVhWYTgrRmhzSEp0Y0VlbkQxdGRJby9wTGluaGdabUxZV1Zi?=
 =?utf-8?B?ZDhlMU5hajBpbnBER3RQOVNsek1obnZVUDBsNm9yemQ0dGJyTHFSNEtvOXFU?=
 =?utf-8?B?U0IzRlVTREl5aVVTR0lHU2I0S0JscytrMnFFNE12UmNiWWFwem5GRVhucXRG?=
 =?utf-8?B?dmIxOVcxSS96aWxQZGYzcUhaTE44WXQ5NlNIako3R2EwUUU4QkhYcHk1YXpk?=
 =?utf-8?B?eXlvRERSL2I0Y3k1UFFER2k1TlRtdUxLbWx0S29QNFEwWjhnS2pHRHZ2bWE1?=
 =?utf-8?B?RVRSbURBWEF4akRsMTk2OEs4eDRCcS9EN0lFOEd6dWl3Z2FlQ0tJNFArOTcw?=
 =?utf-8?B?WmZINkw1VCsvUWNWVXNWa21McGxmd1crM2lJbFE3cVFuN3hKZEM4aHRNdW1k?=
 =?utf-8?B?QXlBMnNUdms5OU1rWFI3dGdPS1NsNGIvRG9oMlZ2T3BmVFhSa0E4c0h5ZFQ4?=
 =?utf-8?B?M2N0ZjhOSnZJVHNQZHFRZ01QcjZHR3J4R0k1WlRPTjI2U1lqZ09VdUdlRUlq?=
 =?utf-8?B?akhOeHg2eklGaml2VWxVa0VnN0ZYYTZKOUhMa0tTMTNjMHZCcDlWQWJ1WmNY?=
 =?utf-8?B?R1BmY3V5MDRwTjFrSk5vSTJOUjQ5WWhmYXdzTkNiSm96d3dWdmhSVTRNaDdz?=
 =?utf-8?B?SDVVRUw2ZkhyZDZXdmtRT3luQkFmU2lIcGN2ekI0YzZERjhNTXpOdk40cXg3?=
 =?utf-8?B?TWZ3d3RRWi9IUHdIV0dKaG8wSGt6RTFTZnRidCt6bnI1MXhXVmhaWkxDMzBs?=
 =?utf-8?B?T0N0UzFWaC9rVnE2cjhzNFAxeVFvQ2duSWptS216VHNUWWl3RnpIWkl6ZU9D?=
 =?utf-8?B?VWFFeGxhdDlyclVOMjkxdWpSZ3BqQVU4Y2JGakRJT21NUVJEU25Edi93WW1J?=
 =?utf-8?B?VENYZWVLOGp2UUt5SmR5L3FFTmprVndTUXFQcnhEa1JnK1NxTVlFUGRqdmRS?=
 =?utf-8?B?R0FEYUhucjZDd2E1L1kwc0hCajF5RlJscmRHU3J6YXVEME9HdXFmdkJ4UFBl?=
 =?utf-8?B?WjlRbThFSjVxMVlEKzIrVmd1RTdFNlhBdUlzQkdXWXUwREJSVGt2YVl4NlFG?=
 =?utf-8?B?U3N4NFVWZ1RzSGpBSmx2R0JiSmdLdzBmaWxkc2trV0xTVHo0NE84TlNzWkQ2?=
 =?utf-8?B?OGNkZkVpdTQ1c0t4bHd2bzJPdkJCZWsrcUtnK3FBeTdCbU1SL0Q4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ORxhdfSNh23MMfHefj3SPuOrb5JXQFK5aci8wGyaAfgM1lQnqRtaTTvw3OjAsLh5xSYWUu4uVyAf2HkbeNq7+xfkIUrj3E2sZ8HaMgTM928hhailH9K2xwoLXgo1R9paUbC355y6TYRIr7istxKUc4Kqo+6suh1IAlL+xErHfAqIvtNDn24r3Dd4J0UipS+ykEFEd+tqOqL47TtTrP5y8kOVFXNpQoKRamSKhd6NjOTusSvq+JFfqHSq7m0gnYRT6/f3IbjmRawlhpt+0dpRTxYm3KVUd0Do8x2Fc50qI9TbrnY8WOzfNY42r7l/FpDkdusLc+P/VkMAdWEC9GWJ+A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b36f311d-3f67-4a51-1147-08deab7d0fbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 14:37:55.6130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JI13H1qW6j8ZmgHlpFh67RyVKUKklt8WY8LFTJW5yI6oIHvICaIQuFkCj5XhRpjorBgIVorqJj9jn2om+5Nt8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6206
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
S29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIE1heSA2LCAyMDI2IDc6NDggUE0NCj4gVG86IEdvdGUsIE5pdGluIFIgPG5pdGluLnIu
Z290ZUBpbnRlbC5jb20+DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQXVs
ZCwgTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNvbT47DQo+IEphbnVzeiBLcnp5c3p0b2Zp
ayA8amFudXN6LmtyenlzenRvZmlrQGxpbnV4LmludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gdGVzdHMvY29yZV9ob3R1bnBsdWc6IGV4ZXJjaXNlIGZkLWhvbGRpbmcgc3VidGVzdHMg
d2l0aCBYZQ0KPiB3b3JrbG9hZA0KPiANCj4gSGkgTml0aW4sDQo+IE9uIDIwMjYtMDUtMDYgYXQg
MTk6Mjc6MTUgKzA1MzAsIE5pdGluIEdvdGUgd3JvdGU6DQo+ID4gVGhlIHNpeCBmZC1ob2xkaW5n
IHN1YnRlc3RzIChob3R1bmJpbmQtcmViaW5kLCBob3R1bnBsdWctcmVzY2FuLA0KPiA+IGhvdHJl
YmluZCwgaG90cmVwbHVnLCBob3RyZWJpbmQtbGF0ZWNsb3NlLCBob3RyZXBsdWctbGF0ZWNsb3Nl
KSBrZWVwIGENCj4gPiBEUk0gZmQgb3BlbiBhY3Jvc3MgdW5iaW5kL3VucGx1ZyBidXQgbGVhdmUg
dGhlIEdQVSBpZGxlLCBzbyBvbiBYZSB0aGUNCj4gPiB1bmJpbmQvdW5wbHVnIHBhdGggaXMgbmV2
ZXIgZXhlcmNpc2VkIGFnYWluc3QgYW4gYWN0aXZlIFZNLCBleGVjIHF1ZXVlDQo+ID4gYW5kIEJP
cy4NCj4gPg0KPiA+IEFkZCB4ZV93b3JrbG9hZF9zdGFydCgpL3hlX3dvcmtsb2FkX3N0b3AoKSBo
ZWxwZXJzLCBnYXRlZCBvbg0KPiA+IGlzX3hlX2RldmljZSgpLCB0aGF0IHJ1biBhIHNwaW5uZXIg
b24gdGhlIEdQVSBhY3Jvc3MgdGhlIHVuYmluZC91bnBsdWcNCj4gPiBzZXF1ZW5jZSwgc28gdGhl
IGRldmljZSBpcyByZW1vdmVkIHdoaWxlIGEgd29ya2xvYWQgaXMgdXNpbmcgaXQuIGk5MTUNCj4g
PiBhbHJlYWR5IGhhcyBlcXVpdmFsZW50IGNvdmVyYWdlIHZpYSBsb2NhbF9pOTE1X2hlYWx0aGNo
ZWNrKCkuDQo+ID4NCj4gPiBWYWxpZGF0ZWQgb24gQk1HIHdpdGggYSBLQVNBTi1lbmFibGVkIGtl
cm5lbDogYWxsIHN1YnRlc3RzIHBhc3Mgd2l0aA0KPiA+IG5vIEtBU0FOIHJlcG9ydHMuDQo+ID4N
Cj4gPiBDYzogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiA+IEFzc2lz
dGVkLWJ5OiBDb3BpbG90OmNsYXVkZS1vcHVzLTQuNw0KPiA+IFNpZ25lZC1vZmYtYnk6IE5pdGlu
IEdvdGUgPG5pdGluLnIuZ290ZUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2NvcmVf
aG90dW5wbHVnLmMgfCA3NA0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmVfaG90dW5wbHVnLmMgYi90ZXN0cy9jb3JlX2hvdHVucGx1
Zy5jIGluZGV4DQo+ID4gN2M5ZGFlMWJmLi44OGEyMTMzYWYgMTAwNjQ0DQo+ID4gLS0tIGEvdGVz
dHMvY29yZV9ob3R1bnBsdWcuYw0KPiA+ICsrKyBiL3Rlc3RzL2NvcmVfaG90dW5wbHVnLmMNCj4g
PiBAQCAtNTY1LDYgKzU2NSw0NCBAQCBzdGF0aWMgdm9pZCBzZXRfZmlsdGVyX2Zyb21fZGV2aWNl
KGludCBmZCkNCj4gPiAgCWlndF9hc3NlcnRfZXEoaWd0X2RldmljZV9maWx0ZXJfYWRkKGZpbHRl
ciksIDEpOyAgfQ0KPiA+DQo+ID4gKy8qIFhlIEdQVSB3b3JrbG9hZCBoZWxwZXJzICovDQo+ID4g
Kw0KPiA+ICtzdHJ1Y3QgeGVfd29ya2xvYWQgew0KPiA+ICsJaWd0X3NwaW5fdCAqeGVfc3BpbjsN
Cj4gPiArCXVpbnQ2NF90IHhlX2FobmQ7DQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9p
ZCB4ZV93b3JrbG9hZF9zdGFydChzdHJ1Y3QgaG90dW5wbHVnICpwcml2LCBpbnQgZmQsDQo+ID4g
KwkJCSAgICAgIHN0cnVjdCB4ZV93b3JrbG9hZCAqdykNCj4gPiArew0KPiA+ICsJaWYgKCFpc194
ZV9kZXZpY2UoZmQpKQ0KPiA+ICsJCXJldHVybjsNCj4gPiArDQo+ID4gKwlsb2NhbF9kZWJ1Zygi
JXNcbiIsICJzdGFydGluZyBYZSBHUFUgc3Bpbm5lciIpOw0KPiA+ICsJcHJpdi0+ZmFpbHVyZSA9
ICJYZSB3b3JrbG9hZCBzdGFydCBmYWlsdXJlISI7DQo+ID4gKwl3LT54ZV9haG5kID0gaW50ZWxf
YWxsb2NhdG9yX29wZW4oZmQsIDAsIElOVEVMX0FMTE9DQVRPUl9SRUxPQyk7DQo+ID4gKwl3LT54
ZV9zcGluID0gaWd0X3NwaW5fbmV3KGZkLCAuYWhuZCA9IHctPnhlX2FobmQpOw0KPiA+ICsJcHJp
di0+ZmFpbHVyZSA9IE5VTEw7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIHhlX3dv
cmtsb2FkX3N0b3Aoc3RydWN0IHhlX3dvcmtsb2FkICp3KSB7DQo+ID4gKwlpZiAoIXctPnhlX3Nw
aW4pDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBUaGUgZGV2aWNl
IG1heSBiZSBnb25lICh1bmJpbmQvdW5wbHVnKSwgc28gYXZvaWQgaWd0X3NwaW5fZnJlZSgpOg0K
PiA+ICsJICogb24gWGUgaXQgYXNzZXJ0cyBpbiB4ZV9zcGluX3N5bmNfd2FpdCgpIGJlY2F1c2Ug
dGhlIHN5bmNvYmogd2lsbA0KPiA+ICsJICogbmV2ZXIgc2lnbmFsLiBTdG9wIHRoZSBzcGlubmVy
IHZpYSBhIHVzZXJzcGFjZSBtbWFwIHdyaXRlIGFuZCBsZXQNCj4gPiArCSAqIHRoZSBEUk0gZmQg
Y2xvc2UgcmVjbGFpbSB0aGUga2VybmVsLXNpZGUgcmVzb3VyY2VzLg0KPiA+ICsJICovDQo+ID4g
Kwlsb2NhbF9kZWJ1ZygiJXNcbiIsICJzdG9wcGluZyBYZSBHUFUgc3Bpbm5lciIpOw0KPiA+ICsJ
aWd0X3NwaW5fZW5kKHctPnhlX3NwaW4pOw0KPiA+ICsJcHV0X2FobmQody0+eGVfYWhuZCk7DQo+
ID4gKwl3LT54ZV9zcGluID0gTlVMTDsNCj4gPiArCXctPnhlX2FobmQgPSAwOw0KPiA+ICt9DQo+
ID4gKw0KPiA+ICAvKiBTdWJ0ZXN0cyAqLw0KPiA+DQo+ID4gIHN0YXRpYyB2b2lkIHVuYmluZF9y
ZWJpbmQoc3RydWN0IGhvdHVucGx1ZyAqcHJpdikgQEAgLTU5MSwxMiArNjI5LDE4DQo+ID4gQEAg
c3RhdGljIHZvaWQgdW5wbHVnX3Jlc2NhbihzdHJ1Y3QgaG90dW5wbHVnICpwcml2KQ0KPiA+DQo+
ID4gIHN0YXRpYyB2b2lkIGhvdHVuYmluZF9yZWJpbmQoc3RydWN0IGhvdHVucGx1ZyAqcHJpdikg
IHsNCj4gPiArCXN0cnVjdCB4ZV93b3JrbG9hZCB3ID0geyAwIH07DQo+ID4gKw0KPiA+ICAJcHJl
X2NoZWNrKHByaXYpOw0KPiA+DQo+ID4gIAlwcml2LT5mZC5kcm0gPSBsb2NhbF9kcm1fb3Blbl9k
cml2ZXIoZmFsc2UsICIiLCAiIGZvciBob3QgdW5iaW5kIik7DQo+ID4NCj4gPiArCXhlX3dvcmts
b2FkX3N0YXJ0KHByaXYsIHByaXYtPmZkLmRybSwgJncpOw0KPiA+ICsNCj4gPiAgCWRyaXZlcl91
bmJpbmQocHJpdiwgImhvdCAiLCAwKTsNCj4gPg0KPiA+ICsJeGVfd29ya2xvYWRfc3RvcCgmdyk7
DQo+ID4gKw0KPiANCj4gVGhpcyBtYWtlcyB0aGVzZSBob3QqIHRlc3RzIFhlIGRyaXZlciBvbmx5
IHdoaWNoIGlzIG5vdCBhIHdheSB0byBnby4NCj4gK0NjOiBKYW51c3ogS3J6eXN6dG9maWsgPGph
bnVzei5rcnp5c3p0b2Zpa0BsaW51eC5pbnRlbC5jb20+DQo+IA0KDQpUaGFuayB5b3UgZm9yIHRo
ZSByZXZpZXcsIGJ1dCBpdCBpcyBub3QgdGhlIGNhc2UuDQp4ZV93b3JrbG9hZF9zdGFydCgpIGNo
ZWNrcyBpc194ZV9kZXZpY2UoZmQpIGFuZCByZXR1cm5zIGltbWVkaWF0ZWx5IG9uIG5vbi1YZSBk
cml2ZXJzLCBsZWF2aW5nIHctPnhlX3NwaW4gTlVMTDsgDQphbmQgeGVfd29ya2xvYWRfc3RvcCgp
IHRoZW4gcmV0dXJucyBlYXJseSBhdCB0aGUgIXctPnhlX3NwaW4gY2hlY2suDQpTbywgb24gaTkx
NSB0aGUgaG90KiB0ZXN0cyB3b3JrIGV4YWN0bHkgYXMgYmVmb3JlLg0KDQotIE5pdGluDQoNCj4g
UmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+ID4gIAlwcml2LT5mZC5kcm0gPSBjbG9zZV9kZXZpY2Uo
cHJpdi0+ZmQuZHJtLCAibGF0ZSAiLCAidW5ib3VuZCAiKTsNCj4gPiAgCWlndF9hc3NlcnRfZXEo
cHJpdi0+ZmQuZHJtLCAtMSk7DQo+ID4NCj4gPiBAQCAtNjA3LDEyICs2NTEsMTggQEAgc3RhdGlj
IHZvaWQgaG90dW5iaW5kX3JlYmluZChzdHJ1Y3QgaG90dW5wbHVnDQo+ID4gKnByaXYpDQo+ID4N
Cj4gPiAgc3RhdGljIHZvaWQgaG90dW5wbHVnX3Jlc2NhbihzdHJ1Y3QgaG90dW5wbHVnICpwcml2
KSAgew0KPiA+ICsJc3RydWN0IHhlX3dvcmtsb2FkIHcgPSB7IDAgfTsNCj4gPiArDQo+ID4gIAlw
cmVfY2hlY2socHJpdik7DQo+ID4NCj4gPiAgCXByaXYtPmZkLmRybSA9IGxvY2FsX2RybV9vcGVu
X2RyaXZlcihmYWxzZSwgIiIsICIgZm9yIGhvdCB1bnBsdWciKTsNCj4gPg0KPiA+ICsJeGVfd29y
a2xvYWRfc3RhcnQocHJpdiwgcHJpdi0+ZmQuZHJtLCAmdyk7DQo+ID4gKw0KPiA+ICAJZGV2aWNl
X3VucGx1Zyhwcml2LCAiaG90ICIsIDApOw0KPiA+DQo+ID4gKwl4ZV93b3JrbG9hZF9zdG9wKCZ3
KTsNCj4gPiArDQo+ID4gIAlwcml2LT5mZC5kcm0gPSBjbG9zZV9kZXZpY2UocHJpdi0+ZmQuZHJt
LCAibGF0ZSAiLCAicmVtb3ZlZCAiKTsNCj4gPiAgCWlndF9hc3NlcnRfZXEocHJpdi0+ZmQuZHJt
LCAtMSk7DQo+ID4NCj4gPiBAQCAtNjIzLDQwICs2NzMsNTggQEAgc3RhdGljIHZvaWQgaG90dW5w
bHVnX3Jlc2NhbihzdHJ1Y3QgaG90dW5wbHVnDQo+ID4gKnByaXYpDQo+ID4NCj4gPiAgc3RhdGlj
IHZvaWQgaG90cmViaW5kKHN0cnVjdCBob3R1bnBsdWcgKnByaXYpICB7DQo+ID4gKwlzdHJ1Y3Qg
eGVfd29ya2xvYWQgdyA9IHsgMCB9Ow0KPiA+ICsNCj4gPiAgCXByZV9jaGVjayhwcml2KTsNCj4g
Pg0KPiA+ICAJcHJpdi0+ZmQuZHJtID0gbG9jYWxfZHJtX29wZW5fZHJpdmVyKGZhbHNlLCAiIiwg
IiBmb3IgaG90IHJlYmluZCIpOw0KPiA+DQo+ID4gKwl4ZV93b3JrbG9hZF9zdGFydChwcml2LCBw
cml2LT5mZC5kcm0sICZ3KTsNCj4gPiArDQo+ID4gIAlkcml2ZXJfdW5iaW5kKHByaXYsICJob3Qg
IiwgNjApOw0KPiA+DQo+ID4gIAlkcml2ZXJfYmluZChwcml2LCAwKTsNCj4gPg0KPiA+ICsJeGVf
d29ya2xvYWRfc3RvcCgmdyk7DQo+ID4gKw0KPiA+ICAJaWd0X2Fzc2VydF9mKGhlYWx0aGNoZWNr
KHByaXYsIGZhbHNlKSwgIiVzXG4iLCBwcml2LT5mYWlsdXJlKTsgIH0NCj4gPg0KPiA+ICBzdGF0
aWMgdm9pZCBob3RyZXBsdWcoc3RydWN0IGhvdHVucGx1ZyAqcHJpdikgIHsNCj4gPiArCXN0cnVj
dCB4ZV93b3JrbG9hZCB3ID0geyAwIH07DQo+ID4gKw0KPiA+ICAJcHJlX2NoZWNrKHByaXYpOw0K
PiA+DQo+ID4gIAlwcml2LT5mZC5kcm0gPSBsb2NhbF9kcm1fb3Blbl9kcml2ZXIoZmFsc2UsICIi
LCAiIGZvciBob3QgcmVwbHVnIik7DQo+ID4NCj4gPiArCXhlX3dvcmtsb2FkX3N0YXJ0KHByaXYs
IHByaXYtPmZkLmRybSwgJncpOw0KPiA+ICsNCj4gPiAgCWRldmljZV91bnBsdWcocHJpdiwgImhv
dCAiLCA2MCk7DQo+ID4NCj4gPiAgCWJ1c19yZXNjYW4ocHJpdiwgMCk7DQo+ID4NCj4gPiArCXhl
X3dvcmtsb2FkX3N0b3AoJncpOw0KPiA+ICsNCj4gPiAgCWlndF9hc3NlcnRfZihoZWFsdGhjaGVj
ayhwcml2LCBmYWxzZSksICIlc1xuIiwgcHJpdi0+ZmFpbHVyZSk7ICB9DQo+ID4NCj4gPiAgc3Rh
dGljIHZvaWQgaG90cmViaW5kX2xhdGVjbG9zZShzdHJ1Y3QgaG90dW5wbHVnICpwcml2KSAgew0K
PiA+ICsJc3RydWN0IHhlX3dvcmtsb2FkIHcgPSB7IDAgfTsNCj4gPiArDQo+ID4gIAlwcmVfY2hl
Y2socHJpdik7DQo+ID4NCj4gPiAgCXByaXYtPmZkLmRybSA9IGxvY2FsX2RybV9vcGVuX2RyaXZl
cihmYWxzZSwgIiIsICIgZm9yIGhvdCByZWJpbmQiKTsNCj4gPg0KPiA+ICsJeGVfd29ya2xvYWRf
c3RhcnQocHJpdiwgcHJpdi0+ZmQuZHJtLCAmdyk7DQo+ID4gKw0KPiA+ICAJZHJpdmVyX3VuYmlu
ZChwcml2LCAiaG90ICIsIDYwKTsNCj4gPg0KPiA+ICAJZHJpdmVyX2JpbmQocHJpdiwgMCk7DQo+
ID4NCj4gPiArCXhlX3dvcmtsb2FkX3N0b3AoJncpOw0KPiA+ICsNCj4gPiAgCXByaXYtPmZkLmRy
bSA9IGNsb3NlX2RldmljZShwcml2LT5mZC5kcm0sICJsYXRlICIsICJ1bmJvdW5kICIpOw0KPiA+
ICAJaWd0X2Fzc2VydF9lcShwcml2LT5mZC5kcm0sIC0xKTsNCj4gPg0KPiA+IEBAIC02NjUsMTQg
KzczMywyMCBAQCBzdGF0aWMgdm9pZCBob3RyZWJpbmRfbGF0ZWNsb3NlKHN0cnVjdCBob3R1bnBs
dWcNCj4gPiAqcHJpdikNCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCBob3RyZXBsdWdfbGF0ZWNsb3Nl
KHN0cnVjdCBob3R1bnBsdWcgKnByaXYpICB7DQo+ID4gKwlzdHJ1Y3QgeGVfd29ya2xvYWQgdyA9
IHsgMCB9Ow0KPiA+ICsNCj4gPiAgCXByZV9jaGVjayhwcml2KTsNCj4gPg0KPiA+ICAJcHJpdi0+
ZmQuZHJtID0gbG9jYWxfZHJtX29wZW5fZHJpdmVyKGZhbHNlLCAiIiwgIiBmb3IgaG90IHJlcGx1
ZyIpOw0KPiA+DQo+ID4gKwl4ZV93b3JrbG9hZF9zdGFydChwcml2LCBwcml2LT5mZC5kcm0sICZ3
KTsNCj4gPiArDQo+ID4gIAlkZXZpY2VfdW5wbHVnKHByaXYsICJob3QgIiwgNjApOw0KPiA+DQo+
ID4gIAlidXNfcmVzY2FuKHByaXYsIDApOw0KPiA+DQo+ID4gKwl4ZV93b3JrbG9hZF9zdG9wKCZ3
KTsNCj4gPiArDQo+ID4gIAlwcml2LT5mZC5kcm0gPSBjbG9zZV9kZXZpY2UocHJpdi0+ZmQuZHJt
LCAibGF0ZSAiLCAicmVtb3ZlZCAiKTsNCj4gPiAgCWlndF9hc3NlcnRfZXEocHJpdi0+ZmQuZHJt
LCAtMSk7DQo+ID4NCj4gPiAtLQ0KPiA+IDIuNTAuMQ0KPiA+DQo=
