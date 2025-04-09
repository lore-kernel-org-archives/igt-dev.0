Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF44C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 08:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6392D10E309;
	Wed,  9 Apr 2025 08:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfWpZacx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BCC10E309
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 08:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744188428; x=1775724428;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JQTHuW8ezhdLOfyKyl5HJlC4WD+L1l7MWDzE1/tEQB4=;
 b=YfWpZacxCoaTms6tTyi7a9ACbYj7zaW/05K2L57TKxx9ilGxMc/RC9qj
 MuwJoGQemQiQDUJX0UyboOVpZo0yDCaiUuE4dOLxXRnz2ghYWQR3GZ4Vj
 JJzjNiDamdfaVUhzOEjOGHpRJybmk6a9MAUeMQRQMdVlnvVmerZ+7uOlw
 uU1Ijs15vat8TrnRCG0zczNbs8xjFK9i7cPJ7pRc8CtTkMbur5vjPHCyo
 UraDnOR25D7OCxIS0qMZ+Kk7EkgMYtfz2A4BG7c3GUxuz+INw6EigoWkI
 ZbOQpeHoF3r+AN0z0eGfETKinEL0JaSez7tElOpj/ta1HgVufEmzTRmUi Q==;
X-CSE-ConnectionGUID: o6KvEHKjR7audU6IHn4K5g==
X-CSE-MsgGUID: KftJmy7eRJajEFh8j9v+ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49496093"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="49496093"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 01:47:07 -0700
X-CSE-ConnectionGUID: I4+Nube4Tby16rhS5Ceh7w==
X-CSE-MsgGUID: g6msvDPgQ/+6P28NBULq8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="133232500"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 01:47:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 01:47:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 01:47:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 01:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/4xHms00Yx0KMtlZsoNpoUn1gRTC0K167gFRF9aR90zDKgbXKxeASIG2IJrx7xxxPm5jFTDJVyl2fmhVdx2a3M9NlFogbWsCyNuCUNe/3NIwHWqjnzCaqISOgAjoOCt8ycwKgBdkrC8gGiH8oyvEIO6t8D+b/zK4Yel33yFXyl0ro3ZwHfdoNNFD++jNmCukV0vwI/N8OZD4HcrlZ1INIYd9XOkEQRHHbMwFSNjCt3R0CPBNBBrzcSn/CBKFT4aEEL+RdzKE2cuJMbNL3sUg69kD7/cRD14I6z2FKv3LH2mhaXadUkoPt9CgsHYb4S9JhCMve+b+qkS+oTvP8ZrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQTHuW8ezhdLOfyKyl5HJlC4WD+L1l7MWDzE1/tEQB4=;
 b=WvUcgEoLUCKorPLol1NL7tElT0F8tvILdBg2Ln+qwzYaaVThFE/6ITHhYeJeYH0gfygrip2GFNTZLOBUKj+eFTekKKlVFke3J23uJyqb73HW0MT74kRRuveFWaNVWlPZteTjvsfTLb+CD9Hul9Wl2UYH0sauaLqW7muF9F+avyggmhSSMUZnd1M5nn3dxF8zTAzeKoaH16NoBBxs/JGcAFwAoCneDAImi4RE8YUlu6WFAcleM49h9jjJRz87gblQETMmLVhLWJNHLCsqvDMBab73m0etwckjFZYWIDAYB4ZeNF8Mc8hsvHdOsBsThbPxoixtJCOsajrtZ0+NTLgAQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS4PPFDB7809488.namprd11.prod.outlook.com (2603:10b6:f:fc02::56)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 08:47:03 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8606.028; Wed, 9 Apr 2025
 08:47:03 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH i-g-t v2 4/5] tests/xe_compute_preempt: adjust number of
 children according to ram size
Thread-Topic: [PATCH i-g-t v2 4/5] tests/xe_compute_preempt: adjust number of
 children according to ram size
Thread-Index: AQHbpV2XXQad4q7d8kOObxasjZdFpbOX6PDQgAMkHLA=
Date: Wed, 9 Apr 2025 08:47:03 +0000
Message-ID: <CH3PR11MB843409661EB1F07FF32791678DB42@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250404123140.260143-1-zbigniew.kempczynski@intel.com>
 <20250404123140.260143-5-zbigniew.kempczynski@intel.com>
 <CH3PR11MB843489EE72E7408D26B634D38DAA2@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB843489EE72E7408D26B634D38DAA2@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS4PPFDB7809488:EE_
x-ms-office365-filtering-correlation-id: d08d5fa1-d797-46a2-3876-08dd774319d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ZUpHenZEZFk5eDl0aGloZXNQS3licWtCQmNsa1N1K0tFTXkwK00zUk5UWmhP?=
 =?utf-8?B?b2l5Q2NQYmo1K0ZQd2JrLzJFOHAxVS9PM0ZnaVBLblcyZ1JqdXhsendUbDd6?=
 =?utf-8?B?NE03djZ4REtjNFhuRkgxemF1NEovcklneVhpZ2U4NGtkY0VLWmIyNTYyZWRr?=
 =?utf-8?B?bmRYUGJXT1JVWWk4YlBCemVoRWMycjB5SHpHT2QwT1liSUZxRml3Q0dPUkM0?=
 =?utf-8?B?MldSZ2w3YnhUSWc2bHNHV2wwWmlncnpXVXp1R0xHd3JlbWVRZE9NNVFhdjFM?=
 =?utf-8?B?Sm94VHJ6c0xjd3VuRGJDVm9xSThFN2dqSWRmeElaOGVObEl5TmtYOHNjYWl6?=
 =?utf-8?B?RTlsVldhZVc5ejFMQkszZEJnY1k3Z2xLUEdXa1RTTUZrWVZIYXRkNVhqc1Qy?=
 =?utf-8?B?RzBuSzhxTHoyejlzVTVaRFJTcVZyeXJtbStVZTJ0cXEvOU1BS3ZKaUM4Y01C?=
 =?utf-8?B?V1c5M3F5QUNkZ290UnlpM3hvTGl5dzZhRzZiNWZDS2xnUkQ3dmRRV1o4YUVD?=
 =?utf-8?B?Q1FyM0tkdmhHdkF5VzY1dnNrYTZjT3JhTzJkdDBUcFlzMWV6N2o4eFJEbkJX?=
 =?utf-8?B?b2VvcC9UMXJZKzZFQ0t2bTNqVlNEMGRmMlRub21GdHFod092TW1MMTUvSVNv?=
 =?utf-8?B?SE0vZTlNNklWL21Zcmo4bFZFamI2c1hkR29LMWtQWEVOODdoQVEwb0JlYjFw?=
 =?utf-8?B?YVkxSGs4ZzExeHdIdnhQY1dDTUYwTWwxbEF0MndheVAxMTFGOGlMRVQyN3kz?=
 =?utf-8?B?d1lOTy9ta2VrRnVyeCtCNXZyTWhMeDk5VVRaZmR4bzVySlViaEowZ3pCTk05?=
 =?utf-8?B?S2wrakNueXVrc3NMR1RyTHlSbHNSd0UvWXIwZk9zZ3EwcjFGbHdoT3l3UXpP?=
 =?utf-8?B?dEV3VE05cFRxSU1MUlV3emg2WE5aMnppMlZCTUJRZ05tc21WWk1NWURnT1hR?=
 =?utf-8?B?SURJT2VnZGRlNXBaTUY5UVgySytzcTgycDlUTlpLQVF2cUVpQksvQlpTZXk0?=
 =?utf-8?B?NWNmRCtvK0VSbmE2Snd4M0NkYkN1Q0dpN1B2aUpHcy9lS0k5U0pqZ2tqSHJD?=
 =?utf-8?B?TEZ6T2ErR2UxYTdJN1RLYzlhVmloaDlicFhPd1NTNEdjd1pzdVJ0UHhMeHVM?=
 =?utf-8?B?dkxTaGFuQ1ZpekwwYUoxRGJURU9ocmpRNTZka3hZbkJHcERORS9SZWlPZ3lr?=
 =?utf-8?B?K1kwSzdkd1F3eFYxSDcwa2xnZy9KYmtGUm5HYjF2L2xKWndvUFBMMXU3d3Nl?=
 =?utf-8?B?a0hKWFZRRHJ0MDRncFBiVTNCTzBQUnRuSC8yVHM2SmVCdjhyTE5tbDkwWEtl?=
 =?utf-8?B?OUFkQllub1FuVjVHUDk5d1FHbDFYbnN3ckxSZkNydzhHK216eUN4MUR5dmhE?=
 =?utf-8?B?QlE5Lzc3RVV1bTIyRXpwdFM0blFIYStFV01KS0xEdFhpTXpQUGFoZHhJTmdW?=
 =?utf-8?B?Tm1CVFByTmMyN2ZSWkU3VDEzWkVMNzdjWStuWGltVWQxOVFpRXdCYUVwbFRX?=
 =?utf-8?B?cVZNcnloVXJ5Uno4ZXkvRzR2V3BqVThRck5zcHRSdzdtOGlBZHUyeHhOVXBI?=
 =?utf-8?B?VkZhcmdEMFlqVjlWVXg5OHVhbk5TZVYwUFlwSmwxRDIxOE1jRndlTlNxdklY?=
 =?utf-8?B?MS9mYkt6UFlWbG9RZlhRUHUrYnhUNjdiYW1OaElpSDlHVlJqV3kweEtGNXBW?=
 =?utf-8?B?U1hMMm1sNWpNbnlQaWtYZUVPMTc4L1EwY21hZTZIZTJ2akpIaWJ0TGlMQUxP?=
 =?utf-8?B?NE1UL3FTcUV5RFpXYnZleE1wek5nTDBnTTIxazd5TlBwakF2Mmwyc3BJWkc4?=
 =?utf-8?B?c2pMci9Oa0hoc1ptWGUrV1p5TDBLaDJLelg0V1gvMDBxcFpyZW4venB4ZkVV?=
 =?utf-8?B?U2FhS28rdFFUb3k3NmFHQTJvektvbFZOVUY2aVluWEcreEluRWczWVY1MG8w?=
 =?utf-8?Q?/wWtYltLAwFID8jrcxnw0xX9YEjUypYV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0JZVXVEVU5GQkxTdFlCMGZEN3BuNStRUUFHcnl5aTFSVTRqb2tmRDE4L3dt?=
 =?utf-8?B?R1hlQWEyTDMrQzhFa2xTNVlPaDVNb0xCQnNQWml0ZVoyemZsSnNBYitNZGYw?=
 =?utf-8?B?S3ZIZ0JtVnN1MG90T1haZlI3MytxNFUyWmwwbXRLdnpTcW13RXY0U25PYTds?=
 =?utf-8?B?UVl4eUxiWml2UTVDbG5HUDFjSWhuQXRIQkxKeXJVRjU1N1dPallNR01RSnZs?=
 =?utf-8?B?MzFDV3g0NGFyNDliSEdBa250UkFpVzVndGJzTjhDNjNCMGRsZEl5RXRoUm1K?=
 =?utf-8?B?dSt1VGwxUmQ0eHZiY2phVEtPOHVxZmtTQk5IelQrZUxFa1VkL0s2MHB3cmlk?=
 =?utf-8?B?ODNETmVOcFNzYnN1YktUVmtLcytaajNLcmFFSGNGNWtaNVk5eVpnUXRuL0Rx?=
 =?utf-8?B?Mkx1cVc4UGtVTDZtczNBN0JMOUkrQ1liRzZxb0NWbk5YNkkyRlZ3Y1I4Y082?=
 =?utf-8?B?d0t3ejVqLzVZYXhSUE9NMXYzL1RCOW1XK1RTaHZOYzBwa0J0bXFFSWNnQjVx?=
 =?utf-8?B?Vk94M3VqUDlvaTEzeHBGbUpKUCtSbGZFTEFLMkl4c2NRWjUyMWhQUCt4USsw?=
 =?utf-8?B?SzVjUFJCcU1jSWlnWStyRjJMYUw1Nlg0U2tvdnVtTmtmdTlNWWd1bThGV3Rr?=
 =?utf-8?B?M1NLV1hZbDdOd2svR0NPa2RveXVJSzVPQjRRSWtqb0F4amtXTjl0a0Y3L2pK?=
 =?utf-8?B?S3IrWHVQbjU5SW9iYUtlNnVlVlVFTGxGdWpiMThLN3RhbVdZbUhCcUNYMnRn?=
 =?utf-8?B?bWJhdENMb2xIQUlsV2I4dFFpNVJ6VTBwSm5nclVsVGpqZWpaZ09xSk1sZ1RB?=
 =?utf-8?B?L281RE82ZkkxcTdLbFJDNWFGdE9DSFh5alE4NEp2NnYzSmUyZk5VQzM0Yk1p?=
 =?utf-8?B?TlVoTGVmRW9zN3cwaTFzakRKc2RhTDQ5OFRCS1p0OGp2OGVMMHZhSEl6NlFq?=
 =?utf-8?B?QnRVQ2h6eVJYZ1BybVMwbXBxNzUrWnVzREErWGJiQ2VHVjZtY2Y5Sk5iQTVp?=
 =?utf-8?B?NHZlRFVVTlpabS9HYi9EY0M5VlZ4MnF5YnpiakRvMjFSbml4cENDek9ZOXQ3?=
 =?utf-8?B?UU45TWZKMGtsd2VGN3hzTTJBUEtTeXh1SW1BdVFGSzB6bWVqN3owM2NGVGdW?=
 =?utf-8?B?c3lRNlRPU3pFS2VrTnlHNGdlV2U2aVU0c2w1SktCMjZnYmxiVFJieGRVcUFj?=
 =?utf-8?B?a0dxRkpoMmpPcUxxVm9Mbjh2eWQwbEM5Wk9WT0JjdEkzU3hJTFdwdTZnYTlk?=
 =?utf-8?B?cUdzeEZyU2pQSkhZVnNMQW5KcXZuSXdnRDhLcXdWVWluRUdqQ3NiM3NVWENM?=
 =?utf-8?B?amFxSVFBMTg3SXFWS09pREZ5eDlJTnNjV2pJcWZtM1Nua3g2QTBYb0ZmVmpD?=
 =?utf-8?B?dUUwVnAyZ0sveHFINC9tK05UR3J1ZzlFREMzMllUTzl6bTlvTkl2amY2dmRE?=
 =?utf-8?B?U0hlMGlxZXRBQmtTczBjMEU1U0tGU1pFV2lnL1o2Wmt1MzBMazg2bHNBK2xR?=
 =?utf-8?B?M0pFV3dxTnFiZ3JPM2FQVlRmd1pUclFuZ2VrOStTb1hOdW1sakhtbXdkKy9Y?=
 =?utf-8?B?R0lQVU9aOXJhNUI1RVgrdDFxanVLeU0yN012bEpqTUJWbmJNc0x3SFMvUDFT?=
 =?utf-8?B?K0NDZHJua2gvNGZTbXRRKzA5OEc1ZDlscVg2Y1p5MXBNdzg2a1kycXR3NGpP?=
 =?utf-8?B?MnZCVEs2ckx5OHZyT0J5S3ZIVXFmcmZDU0NnR2poU0F6dnp1MHp6QjNlOGd4?=
 =?utf-8?B?SnFrT0RFSUZEYzRrWE5vTmdoeXM5YVc0aCs4U1FMWnBUUk12R2x5RlFhS2Fp?=
 =?utf-8?B?eGttUndUS3BIajlBM0xVVjdJMDZVaG10dDhoSk0reHROK0lFd00xV2VNUDhl?=
 =?utf-8?B?REtZUk1mTHZjRVhiZ01tVHZhSTdxWFJnYm5oNEhEbnF0UTRXdmV6cm1mNkhF?=
 =?utf-8?B?VEticU5xUkRnNEhLbzlldjQyMk5wWlBRNVkzR0lkQUg4Q21oYnN0dFhFMnMw?=
 =?utf-8?B?UzNpdFVsSlhuOTFWbFlsM0FnUUlsbDFaU01JZDRaTEVmMTQrbWhmYzVUaGV5?=
 =?utf-8?B?QXBjQm1nSFpKUk4xKzFMOFZ3RGgyU1dHRkQ1bys5emNqWnR1R3JYQXlnVDBt?=
 =?utf-8?B?UUI4djdIYUhCVkJyU3EyVzQ4L2NNK0RZN1dQcndsNjNOVGFVa1JkbWplN21G?=
 =?utf-8?B?TVJKQkE3ZnVIMi9yM3dVTG5SYUIrMHJjTjE4UmNCWnNDM2JqTysvNkRsTmlI?=
 =?utf-8?B?UWZ2bzZBTFhmSjRiWjJFQnlwSWtnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08d5fa1-d797-46a2-3876-08dd774319d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 08:47:03.6365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O6brn01Q1VzWc9mg9+E5uxhPU3EM9zmsHyEJNcNeVHc7/mK2XEw81f16Sns7VthFIUHxuOP2NYLglno1z8POx6KXJbSM/a8Tyn++FPYyLb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB7809488
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

TEdUTSwNClJldmlld2VkLWJ5OiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVk
aUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFu
ZGFtdWRpLCBQcml5YW5rYQ0KPiBTZW50OiAwNyBBcHJpbCAyMDI1IDAyOjIwIFBNDQo+IFRvOiBL
ZW1wY3p5bnNraSwgWmJpZ25pZXcgPFpiaWduaWV3LktlbXBjenluc2tpQGludGVsLmNvbT47IGln
dC0NCj4gZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRHVnYXN0LCBGcmFuY29pcyA8
RnJhbmNvaXMuRHVnYXN0QGludGVsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSCBpLWctdCB2
MiA0LzVdIHRlc3RzL3hlX2NvbXB1dGVfcHJlZW1wdDogYWRqdXN0IG51bWJlcg0KPiBvZiBjaGls
ZHJlbiBhY2NvcmRpbmcgdG8gcmFtIHNpemUNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25pZXcu
a2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiA+IFNlbnQ6IDA0IEFwcmlsIDIwMjUgMDY6MDIgUE0N
Cj4gPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBDYzogS2VtcGN6eW5z
a2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBEdWdhc3QsDQo+
ID4gRnJhbmNvaXMgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+OyBEYW5kYW11ZGksIFByaXlh
bmthDQo+ID4gPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogW1BB
VENIIGktZy10IHYyIDQvNV0gdGVzdHMveGVfY29tcHV0ZV9wcmVlbXB0OiBhZGp1c3QgbnVtYmVy
DQo+ID4gb2YgY2hpbGRyZW4gYWNjb3JkaW5nIHRvIHJhbSBzaXplDQo+ID4NCj4gPiBTZXR0aW5n
IGFyYml0cmFyeSBudW1iZXIgb3IgY2hpbGRyZW4gaXMgcHJvbmUgdG8gb29tIHNjZW5hcmlvIGFu
ZA0KPiA+IGdldHRpbmcgdGVzdCB0byBiZSBraWxsZWQuDQo+ID4NCj4gPiBTaW5nbGUgam9iIHdp
dGggc2lwIHR1cm5lZCBvbiB0YWtlcyB+MTAwTUIgZm9yIFhlMiB0YXNrcyBzbyBhZGp1c3QNCj4g
PiBudW1iZXIgb2YgY2hpbGRyZW4gdG8gY29uc3VtZSB+NTAlIHJhbS4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50
ZWwuY29tPg0KPiA+IENjOiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5j
b20+DQo+ID4gQ2M6IFByaXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiAgdGVzdHMvaW50ZWwveGVfY29tcHV0ZV9wcmVlbXB0LmMgfCAy
MCArKysrKysrKysrKysrKy0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94
ZV9jb21wdXRlX3ByZWVtcHQuYw0KPiA+IGIvdGVzdHMvaW50ZWwveGVfY29tcHV0ZV9wcmVlbXB0
LmMNCj4gPiBpbmRleCA4NzZlNTM4MjM3Li5mMDdlODdkNGM0IDEwMDY0NA0KPiA+IC0tLSBhL3Rl
c3RzL2ludGVsL3hlX2NvbXB1dGVfcHJlZW1wdC5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVf
Y29tcHV0ZV9wcmVlbXB0LmMNCj4gPiBAQCAtNDAsMTMgKzQwLDE4IEBAIHRlc3RfY29tcHV0ZV9w
cmVlbXB0KGludCBmZCwgc3RydWN0DQo+ID4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAq
aHdlLCBib29sIHRocmUNCj4gPiAgCWlndF9yZXF1aXJlX2YocnVuX2ludGVsX2NvbXB1dGVfa2Vy
bmVsX3ByZWVtcHQoZmQsIGh3ZSwNCj4gPiB0aHJlYWRncm91cF9wcmVlbXB0aW9uKSwgIkdQVSBu
b3Qgc3VwcG9ydGVkXG4iKTsgIH0NCj4gPg0KPiA+ICsjZGVmaW5lIENPTlRFWFRfTUIgMTAwDQo+
ID4gKw0KPiA+ICBpZ3RfbWFpbg0KPiA+ICB7DQo+ID4gIAlpbnQgeGU7DQo+ID4gIAlzdHJ1Y3Qg
ZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqaHdlOw0KPiA+ICsJdWludDY0X3QgcmFtX21i
Ow0KPiA+DQo+ID4gLQlpZ3RfZml4dHVyZQ0KPiA+ICsJaWd0X2ZpeHR1cmUgew0KPiA+ICAJCXhl
ID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ID4gKwkJcmFtX21iID0gaWd0X2dldF9h
dmFpbF9yYW1fbWIoKTsNCj4gPiArCX0NCj4gPg0KPiA+ICAJaWd0X3N1YnRlc3Rfd2l0aF9keW5h
bWljKCJjb21wdXRlLXByZWVtcHQiKSB7DQo+ID4gIAkJeGVfZm9yX2VhY2hfZW5naW5lKHhlLCBo
d2UpIHsNCj4gPiBAQCAtNjQsMTMgKzY5LDE2IEBAIGlndF9tYWluDQo+ID4gIAkJCQljb250aW51
ZTsNCj4gPg0KPiA+ICAJCQlpZ3RfZHluYW1pY19mKCJlbmdpbmUtJXMiLA0KPiA+IHhlX2VuZ2lu
ZV9jbGFzc19zdHJpbmcoaHdlLT5lbmdpbmVfY2xhc3MpKSB7DQo+ID4gLQkJCQl1aW50MTZfdCBk
ZXZfaWQgPSBpbnRlbF9nZXRfZHJtX2RldmlkKHhlKTsNCj4gPiAgCQkJCWludCBjaGlsZF9jb3Vu
dDsNCj4gPg0KPiA+IC0JCQkJaWYgKElTX1BBTlRIRVJMQUtFKGRldl9pZCkpDQo+ID4gLQkJCQkJ
Y2hpbGRfY291bnQgPSA1MDsNCj4gPiAtCQkJCWVsc2UNCj4gPiAtCQkJCQljaGlsZF9jb3VudCA9
IDEwMDsNCj4gPiArCQkJCS8qDQo+ID4gKwkJCQkgKiBHZXQgaGFsZiBvZiByYW0gLyAyLCB0aGVu
IGRpdmlkZSBieQ0KPiA+ICsJCQkJICogQ09OVEVYVF9NQiAqIDIgKGxvbmcgYW5kIHNob3J0KSBq
b2INCj4gPiArCQkJCSAqLw0KPiA+ICsJCQkJY2hpbGRfY291bnQgPSByYW1fbWIgLyAyIC8gQ09O
VEVYVF9NQiAvIDI7DQo+IEhlcmUgaXQgc2hvdWxkIGJlIENPTlRFWFRfTUIqIDIgb3IgQ09OVEVY
VF9NQi8yID8/DQo+IC0tIFByaXlhbmthDQo+ID4gKw0KPiA+ICsJCQkJaWd0X2RlYnVnKCJSQU06
ICV6ZCwgY2hpbGQgY291bnQ6ICVkXG4iLA0KPiA+ICsJCQkJCSAgcmFtX21iLCBjaGlsZF9jb3Vu
dCk7DQo+ID4NCj4gPiAgCQkJCXRlc3RfY29tcHV0ZV9wcmVlbXB0KHhlLCBod2UsIGZhbHNlKTsN
Cj4gPiAgCQkJCWlndF9mb3JrKGNoaWxkLCBjaGlsZF9jb3VudCkNCj4gPiAtLQ0KPiA+IDIuMzQu
MQ0KDQo=
