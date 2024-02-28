Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C594C54E41
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 05:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A8210E191;
	Wed, 28 Feb 2024 05:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBOKf/KQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BEC10E131;
 Wed, 28 Feb 2024 05:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709099907; x=1740635907;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eExVIpeauLIxJbPG+VmedPIuc5i6o31veieYoci16e4=;
 b=CBOKf/KQ7I/hXvFDIxHituTfZYrYnr65JICvPSy2thLTikpfyXr/j2PQ
 hmZDf9rQvc12/jMoqPPQY77BRlCVNYcf5/sBNnrOGFkgy+Y94yXff88bl
 BYPKJy51LJn5aBQdnpD6P4XkYr/BaKNup1HaPWAZmZUx2/G/9JZnMSWPA
 v7ATcxl7+wJGpp5gl4kEju/BRJnikJMPIscRBz+QSdfNTNJ/ZJz5JKy4A
 a8lOSY+h47WkoeL3DHbVpGZq6cYoyyCvvrRykduzA0PRPb6ItziSRsqlD
 AQHd0SO9f/DSbsGwTOlyG3+BXLGM5zXjKK12eo2+uNI5+sW4vjIA1Yz3N g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3326085"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3326085"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 21:58:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="11902017"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 21:58:25 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 21:58:24 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 21:58:24 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 21:58:24 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 21:58:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIcFyjB+Yzn6JI+Dbk2FrHaQDXDUdolacPPtQaazPWjG7DXN7FM6BBNtojrECAPCSEmubO29RXH2wvY+A9mlPUeh88tvDjv2uoT86AvrmI/k7GPf0/b9p+e4QStHB7r/MEFj5yED+42/fZpCbIuC55+aarveLhxX7cMddDstsO0bks6tEig1gf6GYMPHrBn4zf404LP2plQ7vSWDNjdgOvx/CCcKZ5N0EdzkO+mWJNj9uQKaqJ2spAh/T+ekjshFruZPCQOzE48ZxY0KCowaAIlNGyALxz7mV4Ve/BY09I4ny2bonQFrpAa9m9SR1TjNWMtW+neSXngzS6aP08xewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eExVIpeauLIxJbPG+VmedPIuc5i6o31veieYoci16e4=;
 b=lSJN2wuPlUy6Vy7GrRdELU8q3TA+NGGel3TQa5gd/M63z/iuDV+Hd5KQKWzIkrYvox2lMNsXHPTJ8Ct5TaTYaCuELw/1DyCMjLmi7H06RXhVw1F6H06t5U3Rn6TqABLxsetv03dMlnaVlDWUf4sKOfN4taPLPgFo4am1LnqcM5yGAKH60+DX88h9ZtLoQ+2oPVt++fDl9ECNu0cSJy2ifyVEUvbNJPZHbQrjVGJyPTgIxjqnB+9ZyjxrnXLQDUNijbSa4ZHJAF/ENSP8fjECOGEzY7xBNdTheXYto3ZpEMcqorJUghG50yhSLz1s87/7vidacjleBW1z+BvlLim+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by BL1PR11MB5416.namprd11.prod.outlook.com (2603:10b6:208:319::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Wed, 28 Feb
 2024 05:58:16 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae%4]) with mapi id 15.20.7339.009; Wed, 28 Feb 2024
 05:58:16 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>,
 LGCI Bug Filing <lgci.bug.filing@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIEFkZGl0aW9uYWwgZml4?=
 =?utf-8?Q?es_for_IntelCI_testlist_generation_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkaXRpb25hbCBmaXhlcyBm?=
 =?utf-8?Q?or_IntelCI_testlist_generation_(rev2)?=
Thread-Index: AQHaZZGrrLVju7DTM0iHYByDk+gqnrEcfX2AgALNcNA=
Date: Wed, 28 Feb 2024 05:58:16 +0000
Message-ID: <PH8PR11MB6753BB1020EED86B98D143DDF2582@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240222114741.196042-1-mauro.chehab@linux.intel.com>
 <170860787853.216641.10773422745482929340@8e613ede5ea5>
 <20240226110949.o3utlue4xh7qcdm5@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240226110949.o3utlue4xh7qcdm5@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|BL1PR11MB5416:EE_
x-ms-office365-filtering-correlation-id: 17900274-ded9-4f06-91e9-08dc382241a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i0psg7UrvDl/MA0oAAbUaxRcuzQXhT90hZYT83B50KMi2yIvwvFG934WrswKFwS95lKzY87JhyDJK3iBfeCP07xu3Ju2DXIMe/ViyiGsNXLOSghLfx68mwjk0HUFE+Whd8ZwQslzHJvEREpM1PbNwWGRb+PpemKHlBKUqjfSAnuPejA+6IZRW/LWoBXE4C1taGTIGJxhY71F4Pm8C6kd/R9ifhoPAwFu4RH8TqUja4ctjvnlf2T5TbYzJDscDGZQrZIVqgLQ+cEsxpLuUdmj+Dp8bic62nXFyL1oCJP/vo9hNfinu6kAjC8d5/C1K3tNuvPdJDZ96Xdo31nzxH/k/2iRt0b6pAhcZlxtz4Ukf3E6Dk7oNxFdM4ek6ayy+qRBcl1GEx3xGw48wOm/G5nO4Brjz2Rap8dSbOFvDO5q+7loSi3e+SVDzl8+JaA3xS66k9T9JB1/3u4hjUijLqjbwP1FzpxBcywlypr6Zpii+GddUYcZf7HsQKmn534h7cv66LDlYkoBgHNnyAxRTj9l9WjTTj43wCOqryWfh++HRaHK2P9IzhteMuupzHAcizBqF4eEZgadKHcHnSCQyH3eiQsnGnTShn/vqBy3IBc20YqhRy+757h34N23WkCMr1pJdpcBGmcxLA62OlSvMWDF2pkqPhFi65/qqF/2V2UpiUPFrzCu1JH6DAr84ZubOUKU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTFKaTBqTzRpT3lwNDZkczhGV05WR0lrcnl3Vk8vd1NIUGJsVUI5TFEyVm5M?=
 =?utf-8?B?WEJOODRnRU4vb1hDWlE3VXd2cEhCVU9QQys1ZkF3Zk9SR0xaVTY5MjV3a00r?=
 =?utf-8?B?MUdUaWlGYjV5bVppZjdxaGo4bFljZ0U3b1Z3Rmo1bjFYR2pSQkFGMDBkN0xJ?=
 =?utf-8?B?QmhaWVI0OFdGSG03VHAzMU8xZ3lFREFPc3dzRHprdFNOaGMwMDdESUliV2kx?=
 =?utf-8?B?UzgyWVRuaHhXMXh1a0prRFZNY0VzM2o3K0VITVlwWlJSVW9wcVVLTWpHUExq?=
 =?utf-8?B?WmtveTRMU3prZmtUblUyT0lLUjlOaHZpNkpOWlNBcDVEZU03bkRtV0grbVo5?=
 =?utf-8?B?RjFMNVF0SFNHTFZjWFlVMXFoNGVzNm04b2ZvVTZFdUhPRU9IUC9HcEtkMFQ3?=
 =?utf-8?B?d05XeEZIbHJuZzd5WW5oeGVpQm8rdElrZkpxc0thWmVFdEI5RUFpMUpRQStu?=
 =?utf-8?B?M3pOeWpST01EWnczTjJWb1ovMzdRQTBwOXlkOElOTlFnR1loMzBRU0NyOGda?=
 =?utf-8?B?R2VxQmNQOU9mcVRaWGlQaWIwT1p6TXRKSG1IRzAwaWVHOG4zOFRhRDJkaUQ5?=
 =?utf-8?B?MEdMSEVBU2VHUkN3WGJCbnYxcFZHeVJnYjF6c001WU0zQ2h4ZXJlUW5Mb2lu?=
 =?utf-8?B?NkRvZmlkMUhhTzFFTTdQdDJ5V3YycmlFZUZNQ3FlNGZpbXpYM0RZVUhuWmdM?=
 =?utf-8?B?NlNPSDdBcGw2Qms4N1U5UjlhWm9HK3Vsa1JRS3VVRlhyN2RBVmVDZFZkcHVv?=
 =?utf-8?B?aUpVUDF4UHpmdlc3RXN2Q0c2d2M2enBFRkloZXd4YzJrRC90eUh0ckw2VE1O?=
 =?utf-8?B?V0JpUkJjcFI4L3JXWTJkeGJtUGlqSGZ0ZWhXTGd6bVFjRUNMQzhyL0FYanBT?=
 =?utf-8?B?ZDFHbTREbWtBWXlBcEg3RGZ5ckJWOC8zZ0MzcjZaTEt0bnF3Z1BaWTQrZjcz?=
 =?utf-8?B?M0liSXQ2Um5rb25GRXJ4dUw0cWljZ3VYMkR5TG42OVdtaGQxNTcwZnlkcVRK?=
 =?utf-8?B?Y2tacUhmTmppVERFWTltb2s5cHI5OHNML2hDSWZzUExhTWtJSHRyMFpIL3dI?=
 =?utf-8?B?Rk5iTHQrc0VoOVNFUWptZVhDckhsK0lYMFlmOVpYdGxob25ubGFkQ2tvRVl0?=
 =?utf-8?B?T3dmbGJ3Tko2NkYycm1EeXcvRUFrVDB1bndmdkl2eEttekZQcnoybktvQXFo?=
 =?utf-8?B?ZVFlSEdxQkhpQkVoYVhUbVB5dXdoOUVhTGE4WjVQRGlKM0ZwU3lzRy8xNmRm?=
 =?utf-8?B?bXBIR0xZTTdpVzJUbkdGdkk1eWhZYU8wV0k0VnpHR1NEWlNiY2NyZGEwckVF?=
 =?utf-8?B?QmlUU1NVNU9FL245NlhPMVFLektwcndDZDhmeGp0YUpKekVPMVBMSDlqSWdK?=
 =?utf-8?B?TU1lUDJJN0lHeCtpSllQaW9WMkRMaXNIb1lnOXBEUkpNUGZMRGx0bDJ5UGRW?=
 =?utf-8?B?MnRSWEJoVlJtellneGJoRGdXY0JJL1YvV1haYldySklzUkMzMkNQQkRZK1Jo?=
 =?utf-8?B?enY5aHJKZXpKQm9QaC9kME00VHlZL0dZaHJuRmdteFJtUnk0QzZTZXlkdnNz?=
 =?utf-8?B?V3dFcUd2YTlERDVHM0JYbHRETm9qWDRzTnNWeE1YRy9PZlVhekRvWmVta1gr?=
 =?utf-8?B?UndCRzZvbGhsKzNEeWR3N3EwTWI5SVhMZ0loVWhOd3k1T1krNVkzakE1dlF4?=
 =?utf-8?B?OS9HVHZUc1lOZzUxTXEyZDFtdmZZTW1oYlZBRmJQeXpYWFNDTDNXZ3I4YmVO?=
 =?utf-8?B?NnVsb2RLa1pSLzF4UUNlcG9EeXVrc0lvRVF3ejhJWmhaRzhROURFQy9KVENv?=
 =?utf-8?B?NzMwUXpzUTlCbkNlWjQ4cWdKeklDa3h5OGFqQVh4Sks4Q3pGK0pzRjFMR0dv?=
 =?utf-8?B?MUtIaGRrTGNndUIwR2ppYUU1TEhMaHBmUzljUS9HT1E1MGFFYmlMV2xka0ZN?=
 =?utf-8?B?TFpWYzRWaWxuVFhFbTBDWnV3Vmx3QWFKL052S2tDNjNYaDNWQkVjZ2JpeUU5?=
 =?utf-8?B?RnFGanRFbDVacXRETWVyUm9KY0tlbFRuNlZyelpVY1EzYTJqNmkrOUozOUpq?=
 =?utf-8?B?TWZwTzZVcjMzQVM1cjcxMUdaRzZzTHgydDRscmhJMzhRVTVwRXN5YU1BVUM4?=
 =?utf-8?B?MnhMYkhzL0tkcTd5cHlvUzBvbE5uTjMyV083aS8yTmF1VDdmaHk5NmJaQnB6?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17900274-ded9-4f06-91e9-08dc382241a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2024 05:58:16.0364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDoq1v9ve4cYKPGCA/rSxFdR6430KgQqZHfNzZSiTy2N38/QcS9NN0KC0iTS71JvcHeDU2n1pl5BSwqQTjdfFrx5lFr4d5Kl9maV/6Gon3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5416
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMwMjQwLyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50
ZWwuY29tPiANClNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMjYsIDIwMjQgNDo0MCBQTQ0KVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxt
YXVyby5jaGVoYWJAbGludXguaW50ZWwuY29tPjsgSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IExHQ0kgQnVnIEZpbGluZyA8bGdjaS5idWcuZmlsaW5nQGludGVsLmNvbT47IEls
bGlwaWxsaSwgVGVqYXNyZWVYIDx0ZWphc3JlZXguaWxsaXBpbGxpQGludGVsLmNvbT4NClN1Ympl
Y3Q6IFJlOiDinJcgRmkuQ0kuQkFUOiBmYWlsdXJlIGZvciBBZGRpdGlvbmFsIGZpeGVzIGZvciBJ
bnRlbENJIHRlc3RsaXN0IGdlbmVyYXRpb24gKHJldjIpDQoNCkhpIGlndC1kZXYsDQpPbiAyMDI0
LTAyLTIyIGF0IDEzOjE3OjU4IC0wMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNlcmllcyBE
ZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IEFkZGl0aW9uYWwgZml4ZXMgZm9yIEludGVsQ0kgdGVz
dGxpc3QgZ2VuZXJhdGlvbiAocmV2MikNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvc2VyaWVzLzEzMDI0MC8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBT
dW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIENJX0RSTV8xNDMxNSAt
PiBJR1RQV18xMDcxOSANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVS
RSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEw
NzE5IGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAgIA0K
PiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8g
d2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4gSUdUUFdfMTA3MTksIHBsZWFzZSBu
b3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcp
IHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdo
aWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwg
VVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18x
MDcxOS9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhvc3RzICgzNyAtPiAzNikNCj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEFkZGl0aW9uYWwgKDEpOiBi
YXQtbXRscC04IA0KPiAgIE1pc3NpbmcgICAgKDIpOiBiYXQtYXJscy0yIGZpLXNuYi0yNTIwbSAN
Cj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4g
ICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1
Y2VkIGluIElHVFBXXzEwNzE5Og0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMj
IyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGk5MTVfc2VsZnRlc3RA
bGl2ZUBoYW5nY2hlY2s6DQo+ICAgICAtIGJhdC1ycGxwLTE6ICAgICAgICAgW1BBU1NdWzFdIC0+
IFtBQk9SVF1bMl0NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0NJX0RSTV8xNDMxNS9iYXQtcnBscC0xL2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAaGFu
Z2NoZWNrLmh0bWwNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xMDcxOS9iYXQtcnBscC0xL2lndEBpOQ0KPiAxNV9zZWxmdGVzdEBs
aXZlQGhhbmdjaGVjay5odG1sDQo+IA0KDQpVbnJlbGF0ZWQgdG8gY2hhbmdlIGluIHNjcmlwdHMv
aWd0X2RvYy5weSBubyBuZWVkIGZvciByZXNwaW4uDQoNClJlZ2FyZHMsDQpLYW1pbA0KDQouLi5j
dXQuLi4NCg0KPiANCj4gQnVpbGQgY2hhbmdlcw0KPiAtLS0tLS0tLS0tLS0tDQo+IA0KPiAgICog
Q0k6IENJLTIwMTkwNTI5IC0+IE5vbmUNCj4gICAqIElHVDogSUdUXzc3MjIgLT4gSUdUUFdfMTA3
MTkNCj4gDQo+ICAgQ0ktMjAxOTA1Mjk6IDIwMTkwNTI5DQo+ICAgQ0lfRFJNXzE0MzE1OiA2NjFh
OWIxNGMyMTViYzNiYTI0YmFkY2FjODBjZTRlYjNmNTdkM2ZmIEAgZ2l0Oi8vYW5vbmdpdC5mcmVl
ZGVza3RvcC5vcmcvZ2Z4LWNpL2xpbnV4DQo+ICAgSUdUUFdfMTA3MTk6IDEwNzE5DQo+ICAgSUdU
Xzc3MjI6IDQ4MTk2ZWYzNzlhNzc2NzVlYTZhZjgyYTgyZGE2MmIyYWQyZDlkZWQgQCANCj4gaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLmdpdA0KPiANCj4g
PT0gTG9ncyA9PQ0KPiANCj4gRm9yIG1vcmUgZGV0YWlscyBzZWU6IA0KPiBodHRwczovL2ludGVs
LWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEwNzE5L2luZGV4Lmh0bWwNCg==
