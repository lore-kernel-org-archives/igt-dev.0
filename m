Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABE4E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 15:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4150D10E105;
	Thu, 19 Dec 2024 15:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mIobgQoC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BB410E2BB;
 Thu, 19 Dec 2024 10:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734604099; x=1766140099;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Shq2/RPjIHqTXR/7a2lk0udVP4GcCHuxOSnZGi5SbQk=;
 b=mIobgQoCYBeGc7TAKpOhonAbpfcscNYwdIP96e0hBlquvAFK1zautfPw
 Jv5h1/D7MG4ogZwa/lM5mrtICJbmHvsD4iBafsSKXyfQVffukeo0M15D4
 OqXmtH3pmvcfOhnlDi+wgsQBL5p49bY+73xyvFbdgoFgugkb0BzuwQNop
 tVydnImCb+kHbb0TpmmNZ/RRnSIEQxneeaQb3kxXTGqVZ7L2otSr5SuZj
 n9Mve7kjXbI8aL0e3ElZO9H5H45iZEIfUqatXYKZ5JVvAjBwW1ud6bPu/
 di5Z/54yC0p0l2oW5zj2FsJVLFSQYNHA1Zs0exNmj6fl8pp0Uz6SYlauv g==;
X-CSE-ConnectionGUID: ct5qYhO3RWi9FVlHQae2YA==
X-CSE-MsgGUID: bU0j8cziRK+uITFs5Bk6PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46495694"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="46495694"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 02:28:19 -0800
X-CSE-ConnectionGUID: UTAPaelSR6mKhJYCc+fZ/w==
X-CSE-MsgGUID: 4ad/CRb5Ru6oNgoAMreo8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="103142878"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 02:28:18 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 02:28:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 02:28:18 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 02:28:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgrTeSF2lW9+l1AID7nb4oyEsjz9jPHxJcIaYXWfTXkd0yA4d4Y/zqhfGg9RqbNQ1wmggnb+iEDCOcM35XxTvYuAJBtJbBc/iW8+3ASFPpGTAg3iQ6IVJZJrwJ5FZLgrju5LAHlK3BmAW/4TSIgEb7IvuQpav9U6vTnfSnqruhNuC7waVUzWjKQlBUfqYhEp2o5+Ead6YgvdIswpgzZ5vlmwgnwyFW19ObYFCXs/dM+GTWIsYYU7pURzsF5ufOczfpOU49hH/5evWycP5EIWc1FHVs3sowQ5wQaDKIzCPgdpw8xND6v6eIhmBheEf/OR7fvOKDV9aEXnDAGEQvN+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Shq2/RPjIHqTXR/7a2lk0udVP4GcCHuxOSnZGi5SbQk=;
 b=hMv9gaCwA6Rr1fNsimWi6bzFWfxJstCR+u49bfuyQN5KnjD0fAiUn0ugE8dTHzvWISv7DwIChFBiOsr34Z5MjrScqfJl4eMzILDXTo4ZuUPuVd66agjHHauGJ1DROsxBezTwc0Sdc4heLXFrBe/PyzssQJdjsDLYxtZesSYZANNJYq4XC/zRVdO+wnmNfWMGQdi+L6i/NBBPAuVVhkDoBgRAhVR42obTkNOCjXqKwZmj/UuR0vPy3f99gVg+66p8UuExO6CiLyetUE5ZaLZb0BBDOR/8f5Wl7hjk9/7rQ9x1446zz3tBy7PxegCwwWHbMLgIfD5C6fNDSH7cpWiSng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by CH3PR11MB8591.namprd11.prod.outlook.com (2603:10b6:610:1af::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 10:28:14 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%5]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 10:28:14 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwv?=
 =?utf-8?Q?gem=5Fpxp:_Fix_requirements?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC9nZW1f?=
 =?utf-8?Q?pxp:_Fix_requirements?=
Thread-Index: AQHbULfSDU1qObDfCUCwEDQRi7Gf7LLtYB3g
Date: Thu, 19 Dec 2024 10:28:14 +0000
Message-ID: <CH0PR11MB5491352BF8E7B7DCEF5B1478EF062@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20241216153129.50964-1-kamil.konieczny@linux.intel.com>
 <173438992968.3469166.7237217777999239782@b555e5b46a47>
 <20241217191337.vaylwpewjisy3rs3@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241217191337.vaylwpewjisy3rs3@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|CH3PR11MB8591:EE_
x-ms-office365-filtering-correlation-id: e57c53fb-8627-4cb8-c290-08dd2017d861
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NzltSXRZdG91RC9jc0hRSmNPTDBUUnU5VVZEbDVmT0ZKcWptdlZtODR4RGQx?=
 =?utf-8?B?bHBhWDM2dWIyUHFmaTIxQ3o0SlI2K216eUNZcWNGY01WZU5pNkZsVm10YnIz?=
 =?utf-8?B?N1BiTzNrdnp0OEYxYi81QTg2VVZQSlhoeDNTdnRSY3ZCZWxSS3QzSFZBTlZR?=
 =?utf-8?B?RzUwcEkweWhOYlBUZlhZVmRIN3RSSmZOSytCb1l6V2pBSWpIWTJabWVJUTdG?=
 =?utf-8?B?VThXa1l5c011bmp3QklVVlNDTENSd3hlRW1LUklya1pIS1I2SVJwYStnRXBQ?=
 =?utf-8?B?Q1Fpb3dMdjJNYmEvOFY1Q0Vsc21xV09ja2NXZHI2SmtKcmxCK1pvUmFFbm9C?=
 =?utf-8?B?WnVRckdXVFgvMFVPU2xialBlL244dzZLclJMSXcxSnJOc1pBTVFhejBwdk5n?=
 =?utf-8?B?cTAreUVXZzl4MnptT1R6MGtjbUluTUl1Y1lzeXNiQWlDWDNSUUM2MGFhS2pp?=
 =?utf-8?B?cnB1TTdXczVwaUQ4Z1VsYk1LMWVBNnpIWUo0VEVyd1U1SDBjb0gyL01TZ0Nt?=
 =?utf-8?B?dlJnWTgwVzFnVE9iUmxkMnI1ZENNR2w1am5hUWs2R0x3RDJDSHNmbnRDenh0?=
 =?utf-8?B?U0RlQnRpRlY0aWJ2NDBrLytoU2RRNno1Y1NaSG1JVWpZdk1NbDVxNFpkam1x?=
 =?utf-8?B?bXNURHBiK3Q1RDFkUDB0YzlaT2Y0TVlwNHJrdEVQZEhmcVpPSUIxdDF1M0k1?=
 =?utf-8?B?c25Ld0x0bXovQTFmejBiVzNzOW56ZGVFK09BMHhoeFQwbmZ6YTU5Rm1DM3FU?=
 =?utf-8?B?ZGczV2Fab3BROU1XNitGeEQ1S0FkdE1MeW84R3lZV29nNTAySk0waTFHNDN3?=
 =?utf-8?B?ZjZzTlBTclhmZllGRnpSaDFnLzZadFFIeEEvSnR6L3ArbURnR2wrTFlwNGcw?=
 =?utf-8?B?WERmTFZIblBBbkhzdkdualE4cGhKc29CTTFSSkRjblNOeW5aUE9uY3BuK0Yy?=
 =?utf-8?B?NGlwV25aMXFObUZsOEhkZWhhYkxNVEphTkF0a0hXUUNiQ1BpaXhpdDBYWjY3?=
 =?utf-8?B?QkJ4SjkyeTE5T0tkQmtsOGJyR21Qd3EvTVNDTkZiRnpaeGtpMXk1QUFDakVU?=
 =?utf-8?B?TEswUDBSaU56N1BKY1hud0FhelVyMUt1NnA0a1J2Y1F5SUdwOU9vQzNWb0VK?=
 =?utf-8?B?NXFPZ3hVUkdjMlhiMHpaL01wRXk4M3E3M21NN1hDdXBudVNMaEdJOURyaWp5?=
 =?utf-8?B?WW5Xano4ZUtpZ3VDYU4xTE9FVHRmWWx4TVkzLzVZVG9SWjRDamxJc2RZN3Ux?=
 =?utf-8?B?Ky85RDZlT2s4RkVnSnExeXlKclVsUVlsVjFGQVNSMTdxWW1Bem5BSTUvVUtj?=
 =?utf-8?B?MTFuWitSR2JNTUcwWW5UYVZGTk5CNWNIaE90U1h4R1BIRmhDc0t5eTRJMW5O?=
 =?utf-8?B?WUQ3cnVZcDlUclpnbUg2SUF4V0J3VHNvSXRuMU5JZzFEeFZSWG93RFZYbjQv?=
 =?utf-8?B?RVdKaXNXRUxNRlNOWndGMDhISzFYWmpyaVdZdFE2TW8zOGd1M3hRZDZXUU5v?=
 =?utf-8?B?MFFnMldaL2tUSDFRU0JLL0h0dE5mQlZKbEhsU2E1aU1saTFJc0o4Wnhac3o1?=
 =?utf-8?B?ZUxVWlFUVVhwQ3lPcXFHdnd1Ri9nRUVuVTUwWno5UlhvZmhLdXFoSURsSUdM?=
 =?utf-8?B?WTNURkxka1FwL2JMOVlZQjFva1VPTzd0bXp0eE1GQ2YzT3MwVk9Ndy94VS9z?=
 =?utf-8?B?TEdjVkJpbG5TSDlJQlRwREZRV3Z0ZmxjYm9WSlZQN2dkeHRnTE9WUERJMUdS?=
 =?utf-8?B?OWg2VE4waUlkdUJLK1VoMEQrQnZZQWppL1Z1T1FScjNFOWpaUXFOaVhOaUFC?=
 =?utf-8?B?eUNXTXZENUVlcFIvUVdwWVFXTnRscFg4Q2lhc3F5U1VKaFl3OTVmdGoyKy9R?=
 =?utf-8?B?UTJ3SzlWcFRBMXRsc21FZVNUWTNiL1JRWEU4QVdEQytrbWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFJqSXIvNndXcTJZWmdBV1BBTm9YWXdxdkRGaFdJejhqT2phb2tTSC9nSnJD?=
 =?utf-8?B?dEdmWXFQVmQ3dWJLbHFRaEtDbEp6cEt4RlJjSjFYcGgvaVcrN2h4Y0Zaa3pE?=
 =?utf-8?B?aW5qY0NZVFhNUzFWMWxyUG5sN2cvZ1BvWThVZ3FVOTNKSnZwQU1YczY3U1VT?=
 =?utf-8?B?YWtIc1d3OXBRZEY1RVdPbVd0KzJKSzV6NUNYSlIyclMxa2dQMFNNMHdQdlR5?=
 =?utf-8?B?R3BjcG5VaUYzOEd2OVludWRYSC9Ob1I0UDY0bk9tNUxJby8zUFo3TDVFV3dP?=
 =?utf-8?B?YW9SQ3h1NENrMm1PcUNoTlkwVUY2M1FJK3B3R1F4NXorOWxSbkNDVFhkUHlB?=
 =?utf-8?B?MTlVUkMweUZrSFo1MmFTbzZSTVV2eTVxQkpFZitYTStpTk9nUnBqZHpFMkZJ?=
 =?utf-8?B?azNCQXJDV0lGckorc2VtblRyWGxUZlhUazQvNHo2Wm9jcE9sTlFCSzk5RTZB?=
 =?utf-8?B?OXhERmNtTGFjRTRZWFBMcWpuMmdLU1cwc0pPd0dQclQyMVRsbmpaYkRRY3dj?=
 =?utf-8?B?VG1HczBZYWhOV3VUcXd6YmdxOEJaSzkrVmpUQzdpUTNrTms0SHZYNWgrVDln?=
 =?utf-8?B?N3B1TW9LMno5aDVPRXZ1Z2RiWTc4N2VLMm45Q1F2NFZpcEhJZlFOLytBeURC?=
 =?utf-8?B?MWFRYXd5V2RDRzBkckIzdXZEaFVyR2UyTzVZV3FJenM1ZWtYMGpvZlVzZkVE?=
 =?utf-8?B?R09WZ1gzNGpIQjcrZTFCang1TGNuc2ZTMjdjcnhkL045YmJqcytBQ3dEM2xm?=
 =?utf-8?B?c05zQ2VhcU1yRERnNzJlWVB2RjQ4dDBBQS9Fa2crdXZWRnE5emlEWnpaVHFF?=
 =?utf-8?B?N2ExcjNtSFVXdTRnM0xkdmhXUDRYdU1mSnFPTTJyY0ZjTGFXczJwWm1zSWFI?=
 =?utf-8?B?YTgrdS81U3JVL3pMangxUzBWVGJtL3lUL0FiOUVhb0Z2aTJUalFuRklWSjd5?=
 =?utf-8?B?S3pzaWV5N2FZMlFDUVFDbkxzZk1zd3RvblZHdTdURHJGbmgyZjducEdHTTNJ?=
 =?utf-8?B?Ri9VTzU2QlAxMlYxZWM1SUM2ZjV4elJkR0Mvc1ovNkVjWFBabG5CZFFtNlZD?=
 =?utf-8?B?b2VMRzRlWkh0RDdKeVIra1pxWElsdE1zRVk0WHdESjErSVhYbTg4TzFGZm05?=
 =?utf-8?B?K1dmeGRkMXlOWjZ1ZjZnbk1YN0RTU3dyditJQkJuaWpWMzRSSG02K1RPSzhq?=
 =?utf-8?B?OUUxQTBEOVRma3lsTU9manZSVkR5Z3hrNTFQd1IzcUVOd0dpTWgvNjRwYVJn?=
 =?utf-8?B?YlhXOE9iU0RPcXAwems0TEZVV256NTBFNWdvNmdVZ0ZINVF2WXlUNnB1MEdj?=
 =?utf-8?B?VWVELzU3Y0pSUGFYdENRL1RNZU5ONXNDR3Evb2ZJa3RtMjhiYlFneGd6bEN4?=
 =?utf-8?B?SkE3MndBbGdlMEtDNlIvckVDM1J4aHVQaG5VZmZyRGlaTURKdzlFUFIzcDJn?=
 =?utf-8?B?US9KUTVQaEIyRnoxWVdLODdjWHp6Z1VHL3N3WjVlcEZtb0FITmtuSmF6LytZ?=
 =?utf-8?B?cXhDWGJDY29aU0tuYlM4TzRHVGlnQ1VjbnpobG9YZW5JSE1OcFpRQ05PVi9Z?=
 =?utf-8?B?SmlPQ04reWRueCtqRHlGN1gxOE9nUGV6TC9MQXdIQS9xNWtUNnhCNDZOaFVO?=
 =?utf-8?B?eHh6TjEvNUt3UjBHWmxITEpQbEdodld1Wk9rdThZTkM5QmcwV2s5YXhjb1cw?=
 =?utf-8?B?QUFRd2hrM0s2LytvcFBuRHdYUVdxd1NIYzFTMEowQzh0S0g3enFQK1VyMG5o?=
 =?utf-8?B?WVZyV09wK0dSSG1JMzJCTlkrcG00RXRVTG5wbjNyRGJER2doUzEvSGplbTBG?=
 =?utf-8?B?UGxrd2hmUW5BbEl1aHo5dGFTd2tJbmkwRnpRVVp0Mm1lODF0T2t5S0hWNHVj?=
 =?utf-8?B?eSt0MHg1bDlJM3dVWWdGdWFZQlRMY3NQNFZBVHJTSCt5cHZKMUFmd04wSGIy?=
 =?utf-8?B?R1hOYllWOS9uelE5bzlTWUQ5NFZLWllmcVMrM2hhYTllRG9mVE5zeGp6ZkRH?=
 =?utf-8?B?U29ySERDb0RSZTdDUHVQQkEyUVVTKzFlbWRIZ1lrUFZqRG16cWVhZjhYTmV3?=
 =?utf-8?B?TWdzWWdMc2haMG05THN6R0FybmZuOFk3NXBaR3dPZ0ppaHpJa1JkNEMycUhw?=
 =?utf-8?Q?hzPmjCs0E9AfXOenmUVYRXRA+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e57c53fb-8627-4cb8-c290-08dd2017d861
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 10:28:14.2658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2i/xnXImJRDoXd/lX+PBncf9SWeEkgRxdyp3ncpeU+8E8RQNjkO0hHEU7AA765K6NqdkoE+DIdnOIioYmlYprhdFxRGzHLqspJEM/gb0LI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8591
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 19 Dec 2024 15:27:47 +0000
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

SGksDQogDQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0MjY1OS8g
LSBSZS1yZXBvcnRlZA0KIA0KWGUuQ0kuRnVsbCAtIEFkZHJlc3NlZCBmYWlsdXJlcywgWGUgY2Fu
bm90IGJlIHJlLXJlcG9ydGVkLg0KaTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NCiANClRoYW5r
cywNClJhdmFsaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1p
bmZyYSA8aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVo
YWxmIE9mIEthbWlsIEtvbmllY3pueQ0KU2VudDogMTggRGVjZW1iZXIgMjAyNCAwMDo0NA0KVG86
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogSTkxNS1jaS1pbmZyYUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5CQVQ6IGZhaWx1cmUgZm9y
IHRlc3RzL2ludGVsL2dlbV9weHA6IEZpeCByZXF1aXJlbWVudHMNCg0KSGkgaWd0LWRldiwNCk9u
IDIwMjQtMTItMTYgYXQgMjI6NTg6NDkgLTAwMDAsIFBhdGNod29yayB3cm90ZToNCg0KdW5yZWxh
dGVkIHRvIGNoYW5nZSBpbiBnZW1fcHhwIHRlc3QsIHBsZWFzZSByZXNwaW4uDQoNClJlZ2FyZHMs
DQpLYW1pbA0KDQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IHRlc3RzL2lu
dGVsL2dlbV9weHA6IEZpeCByZXF1aXJlbWVudHMNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0MjY1OS8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0K
PiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIElHVF84MTU3
IC0+IElHVFBXXzEyMzI2IA0KPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1tYXJ5DQo+IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlM
VVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29taW5nIHdpdGggSUdUUFdf
MTIzMjYgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAg
DQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBk
byB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJR1RQV18xMjMyNiwgcGxlYXNl
IG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwg
d2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPiANCj4gICBFeHRlcm5h
bCBVUkw6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBX
XzEyMzI2L2luZGV4Lmh0bWwNCj4gDQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDQ1IC0+IDQ0KQ0K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgTWlzc2luZyAgICAoMSk6
IGZpLXNuYi0yNTIwbSANCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhh
dmUgYmVlbiBpbnRyb2R1Y2VkIGluIElHVFBXXzEyMzI2Og0KPiANCj4gIyMjIElHVCBjaGFuZ2Vz
ICMjIw0KPiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0
QHJ1bm5lckBhYm9ydGVkOg0KPiAgICAgLSBmaS1wbnYtZDUxMDogICAgICAgIE5PVFJVTiAtPiBb
RkFJTF1bMV0NCj4gICAgWzFdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUv
ZHJtLXRpcC9JR1RQV18xMjMyNi9maS1wbnYtZDUxMC9pZ3RAcg0KPiB1bm5lckBhYm9ydGVkLmh0
bWwNCj4gDQo+ICAgDQo+IEtub3duIGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVy
ZSBhcmUgdGhlIGNoYW5nZXMgZm91bmQgaW4gSUdUUFdfMTIzMjYgdGhhdCBjb21lIGZyb20ga25v
d24gaXNzdWVzOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBJc3N1ZXMg
aGl0ICMjIyMNCj4gDQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91bmRzOg0K
PiAgICAgLSBiYXQtYXJsaC0zOiAgICAgICAgIFtQQVNTXVsyXSAtPiBbQUJPUlRdWzNdIChbaTkx
NSMxMjA2MV0pICsxIG90aGVyIHRlc3QgYWJvcnQNCj4gICAgWzJdOiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MTU3L2JhdC1hcmxoLTMvaWd0QGk5MTVfc2Vs
ZnRlc3RAbGl2ZUB3b3JrYXJvdW5kcy5odG1sDQo+ICAgIFszXTogaHR0cHM6Ly9pbnRlbC1nZngt
Y2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjMyNi9iYXQtYXJsaC0zL2lndEBpOTE1X3Nl
bGZ0ZXN0QGxpdmVAd29ya2Fyb3VuZHMuaHRtbA0KPiAgICAgLSBiYXQtYXJsaC0yOiAgICAgICAg
IFtQQVNTXVs0XSAtPiBbQUJPUlRdWzVdIChbaTkxNSMxMjA2MV0pICsxIG90aGVyIHRlc3QgYWJv
cnQNCj4gICAgWzRdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lH
VF84MTU3L2JhdC1hcmxoLTIvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJvdW5kcy5odG1s
DQo+ICAgIFs1XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
SUdUUFdfMTIzMjYvYmF0LWFybGgtMi9pZ3RAaTkNCj4gMTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJv
dW5kcy5odG1sDQo+IA0KPiAgIA0KPiAjIyMjIFBvc3NpYmxlIGZpeGVzICMjIyMNCj4gDQo+ICAg
KiBpZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91bmRzOg0KPiAgICAgLSB7YmF0LWFybHMt
Nn06ICAgICAgIFtBQk9SVF1bNl0gKFtpOTE1IzEyMDYxXSkgLT4gW1BBU1NdWzddICsxIG90aGVy
IHRlc3QgcGFzcw0KPiAgICBbNl06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2Ry
bS10aXAvSUdUXzgxNTcvYmF0LWFybHMtNi9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91
bmRzLmh0bWwNCj4gICAgWzddOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUv
ZHJtLXRpcC9JR1RQV18xMjMyNi9iYXQtYXJscy02L2lndEBpOQ0KPiAxNV9zZWxmdGVzdEBsaXZl
QHdvcmthcm91bmRzLmh0bWwNCj4gDQo+ICAgDQo+ICAge25hbWV9OiBUaGlzIGVsZW1lbnQgaXMg
c3VwcHJlc3NlZC4gVGhpcyBtZWFucyBpdCBpcyBpZ25vcmVkIHdoZW4gY29tcHV0aW5nDQo+ICAg
ICAgICAgICB0aGUgc3RhdHVzIG9mIHRoZSBkaWZmZXJlbmNlIChTVUNDRVNTLCBXQVJOSU5HLCBv
ciBGQUlMVVJFKS4NCj4gDQo+ICAgW2k5MTUjMTIwNjFdOiANCj4gaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMjA2MQ0KPiANCj4gDQo+IEJ1
aWxkIGNoYW5nZXMNCj4gLS0tLS0tLS0tLS0tLQ0KPiANCj4gICAqIENJOiBDSS0yMDE5MDUyOSAt
PiBOb25lDQo+ICAgKiBJR1Q6IElHVF84MTU3IC0+IElHVFBXXzEyMzI2DQo+ICAgKiBMaW51eDog
Q0lfRFJNXzE1ODQ4IC0+IENJX0RSTV8xNTg1NQ0KPiANCj4gICBDSS0yMDE5MDUyOTogMjAxOTA1
MjkNCj4gICBDSV9EUk1fMTU4NDg6IDYzYmUxNmUyMTBiMWMzZTQzYjQzZDhjYTliN2UxN2YxNTE0
MmQyYzMgQCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvbGludXgNCj4gICBD
SV9EUk1fMTU4NTU6IDhiZmI0OGMwNDUzOTYzMDU3NzFhYWVhMzVmMDZkNWVmM2JmM2ExOTEgQCBn
aXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvbGludXgNCj4gICBJR1RQV18xMjMy
NjogMmRiOWY2ODVhOTk3ZGI5ZjkzZDZlMGMwMzRiM2EyYjQ4Y2QzZWY5MiBAIGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gICBJR1RfODE1Nzog
NDhhNzBmNjc5NWU2ZDY4YjlmYWUyNzUyNjFhZTNiMDlkMzQwMWZlMSBAIA0KPiBodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMuZ2l0DQo+IA0KPiA9PSBMb2dz
ID09DQo+IA0KPiBGb3IgbW9yZSBkZXRhaWxzIHNlZTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIzMjYvaW5kZXguaHRtbA0K
