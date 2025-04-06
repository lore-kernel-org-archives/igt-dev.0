Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5A6C3600C
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 09:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C998910E038;
	Sun,  6 Apr 2025 09:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6mxEezP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F3810E038
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Apr 2025 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743931911; x=1775467911;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U2EfOxte3oiVYnrDFqXJ2UeVnewLK1giC2iDLYbUFQ8=;
 b=I6mxEezPUa8zUIJNQHJrmzoFgjo1fOY9UmlDQP4PVL0f+5565MP7CCom
 VAcnw+dkPqr67N4aN9gGrygd5Hw2kueJOub/R2E18iAoTryCIlrppNoXZ
 ivSRmOzqFmhrgAoSWiZ2uLJDOwa8z8+hvrbPU0KRCMgC80PaQx38U7DVt
 Qwz+wS5eAU8K6UX2xJoiiKeosji+Qr/LWP2hBPbts6iRtDwsNExU8v6KL
 xoON8ZYGdA3hOx1erkciIL/4bbI+7H7WSqpPw5OzT9l4z961XKIX1rvPf
 uz3fkFVO765DspnZmRSc/+H7kxcFfMqv96FHex/H/N17R0fFV4SBa+jdX w==;
X-CSE-ConnectionGUID: OTAvOBxXRO2Dfo5XpiUC6Q==
X-CSE-MsgGUID: u5FT8BBvQ4m8OL3Onw02gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="44468517"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="44468517"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 02:31:40 -0700
X-CSE-ConnectionGUID: rCN5d4IuSf2TG2nfBX6vUw==
X-CSE-MsgGUID: YFqq4SOYQxCMulp3gcgUXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="132826150"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Apr 2025 02:31:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 6 Apr 2025 02:31:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 02:31:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 02:31:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6gYcg8ECoIHLwaHcePXotHt2MvA3WBUuFVNuY5iwIR0YdrXtinGCoZe+4gcxEWcNZJyjNhNvO3NXLDLrDLOqcfWQQi29DKfqw0DLRp881BQR/yR6QzMsCxqnygNoN9Ca7Hyu9YmX2MpqDqMtp12dlLmRimxjsVhsTPxtMVzAxE1ma3BsGigUmTE0XAAASeyCl1rWkDs6L74OtFcT5uSwpShllJKFqb08JYqQSRCfkFcHGKgkw5DIZIdQL8t63fIViCKMu0t5H6j11TQ0cvjk6EGaXdG7dXQRXECCMzFAyM9iKm4LGKmIOUjhzV1AajmQD/HBerSLAvRiGS8yqi8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGZvIwY1HgoRtCPQYbkCmDHU5QAvhuYrdnJOc7MgxLM=;
 b=M/ikgRwZ8sSy3927NuNuJNp9DUKjSABPvAqF3Q+OkbOaw/9ficRjsqR+4wnwcvyHPgBWjM1bqpqs7IBuIzvzA16mCuWOMkl0Y0EGp/wbZcvEwlyzzNQv3e2Wi15qz9z6gEyIZDwhrZLvb1pcWxJfQSQcZmmNZ7Iw/xGQicGkPTpe+FYdorCBDPfw2hdByhLepQunEfN28ny/nu4m4EKIDDhKam3LbRj8qs5p9JRLE5s7tNd2GkZsU1OCR7B5WcK8hKClvvEx8sWK3gHn3fN/80wkZGMgqRBXy70WbIdGub+QUmOaiFcN9MrG708rUQT4tEmiLPctZ3q5MK9++a8wHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Sun, 6 Apr
 2025 09:31:34 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8606.027; Sun, 6 Apr 2025
 09:31:34 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [PATCH i-g-t,v2 1/3] lib/igt_chamelium: Add
 chamelium_frame_match_or_dump_frame_pair()
Thread-Topic: [PATCH i-g-t,v2 1/3] lib/igt_chamelium: Add
 chamelium_frame_match_or_dump_frame_pair()
Thread-Index: AQHbpTKdGYb0X34lWESU+bK7y4OGYLOWYqdw
Date: Sun, 6 Apr 2025 09:31:34 +0000
Message-ID: <SJ1PR11MB61297F693EF09D9655B39D01B9AB2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250404072930.695363-1-swati2.sharma@intel.com>
 <20250404072930.695363-2-swati2.sharma@intel.com>
In-Reply-To: <20250404072930.695363-2-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB7663:EE_
x-ms-office365-filtering-correlation-id: 2e6b520a-c07f-4d48-1803-08dd74edd29f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aMiJ560oNNzAFo7YlmS7G9D3IetdEIa5sM3vzS6D4mR6uxqkfYyzmeWKSE41?=
 =?us-ascii?Q?TBLmtL9R+MhCcupr4nPXnK77IARffxJeLGolh/4EkUpKMHGnkuiZybvONeyg?=
 =?us-ascii?Q?YYaW7ujVi/2KedjFAatNRwyMpn8B+M/M5kTb/d6US8cOGHvVoyL3eTwljbbF?=
 =?us-ascii?Q?nWlUDFste7bxh9/G3mi5CNuj1mPZcOCcbMBIUFqdMwew5ONRyCQQ1bppe9A0?=
 =?us-ascii?Q?vKnEAJr15e/ftcIy71kuJ9vWU7V9xcsLXJYuSpMe52INZZ0644kAajefDYoZ?=
 =?us-ascii?Q?0OKs6sTCL60Wac0QEmKNLD6CTrYhlsLhVFNRKYiVtpswSaKO6zXqnOEAb+eP?=
 =?us-ascii?Q?p4WiqlAPlExou5+s2Nk1fRSPaf0u81LKcQRzt7Du7jiyzCLWgL6CLcOc2GcP?=
 =?us-ascii?Q?5GnjiobDF+LEsAXqaBFY13DxewSf3csIkAO3Lft1NsGkhK7HBO+pbWl7Wa0Y?=
 =?us-ascii?Q?kS7m0YU+y4WHKCmkzYN766C75Z0ELvvaFkq1IAlG7ZYq0Ix4d2X3vlxuICst?=
 =?us-ascii?Q?THes7u74/1s7XeKMuFQuPA7HuL1qrbn4oTq+VQMJwUDJQrMddUX4z5lRdgJl?=
 =?us-ascii?Q?Tul7wT12KiEO6gWg67TJKM7B8QT7KRYeUVgtj5GBRWz8dQB8CqJ1r1qE3h4R?=
 =?us-ascii?Q?ojgb6ff/oeLG2UUkMZgRjTipxyLa1cRHnCA/Uy+mn4EVsh3TxUAKwCpMOqXB?=
 =?us-ascii?Q?XH/K+2Dhf23JbWxVUqch75wISd67txFmCWLHbmBCAnSYwEBdxlItKGUNhRr1?=
 =?us-ascii?Q?uup7DBVskz3ztWvObllR+7devFVOZKUkFwyA107suz/FP2lvRXXu5tfZns2B?=
 =?us-ascii?Q?BCvn4gnEBhN/d1ox2PDx1TCTC2qm0I9S5mlysDQno/UtkS8KTCh8TC6aoY0D?=
 =?us-ascii?Q?8Z044Qy5vJb1iKuPTUtReCXF/5MJ9JY7/qhagRUHBaTlbOK7jeZV8TOOBdf8?=
 =?us-ascii?Q?3KJb91Bn1+N+GPnjuSfqOA5QUDTjI9LSeIZxB/zZEKkiImPYjJCx3QfbDG0q?=
 =?us-ascii?Q?yTWzSVjEJnbw/90wuVIMHhJU6FaoBqv8lBl8O4gHL+64yMCg5+BBAOPiInRj?=
 =?us-ascii?Q?diiqB80WXdAyFEcLYX5SLIUjas1uJQoUNFk3fXxdrYcY6K3YoJCg7Efa24Dz?=
 =?us-ascii?Q?mtO8tMSEgiJnNqzh791lP2ZfryDotN78I4x3NQRXVh4yR5Itw4Jgq1U6UONV?=
 =?us-ascii?Q?WGddfVYS2O2R5qpPYgGZwicz9mRksCas1hujflgQjJKKNn2kUiq51GsCO9zf?=
 =?us-ascii?Q?FXx2GqVfqDm4SDmEpxaubNh7B66JcZe30ad6WfCJDQYiKeoI86H+PGssipQh?=
 =?us-ascii?Q?0YGBMfEj1mGilGDddHDe3pp33eXwGMI7rfGtRwB3jPUq8EQ6oTcdRF+Hiv21?=
 =?us-ascii?Q?HZkqIv2v3AMwS+BVYM8shTTi/dZst/brMVp4UBXzjWpwc1mjRWc7/oiyvrv6?=
 =?us-ascii?Q?qiIfe8wYMu85fL7/242x09PCKMIRPAH8KFCGgI0Ze6yIGBVQ0sVi40zwgr/e?=
 =?us-ascii?Q?2ycCp0/6QhXdXq4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BKrssfvfkcPfUkYFLyXbZFU+emMrtG6KWFMLrvI5t40CEe16O99nEsFdBhdY?=
 =?us-ascii?Q?626vlyRy1lBcyY1lOFLAC0Si6y38qBWbxsRJeloDMEhl087aS6UWDQEe1XpJ?=
 =?us-ascii?Q?ygsz9/loQGKVHCe5RHQA7rx9QbotxU6IyGWJX4/jDYBJB7qDOYOj0gP1fC09?=
 =?us-ascii?Q?bWwR5qLwQpx44BjRUN3pJAf8gTWmpLW5ugPL/oQyNNmrJmAoBzawUbWdhgv3?=
 =?us-ascii?Q?wg8/n2wlpBUYykDayzFSaqttSrJaen1fthrwhnXX8bp/2UQFOF5w6COzZk3l?=
 =?us-ascii?Q?UwdMrvYUvCbWJ7yPOQeFWetebj7HecSSJ76RZnz8+MCe4Et4rSFQVMKTRToA?=
 =?us-ascii?Q?vgCDSF21cuW7chZoYMxR8F4Vj+ijHdwANT8+sJSGtm+2QlETfauN/a8S/uDX?=
 =?us-ascii?Q?gzsWA/Sm/0UUpVfpHBITvtF2CWowHfW+3WEE3dia/3Kqx83L8Ch8e6bw9TDF?=
 =?us-ascii?Q?UIXiZGDEjZhe8rvREVH7Fms4E7KSsE05YKGLzkt6OrzAq19nPtItIPuqNypt?=
 =?us-ascii?Q?MCuxwIsKcdbzcGk02a0vbwnd2iD8qBP3eQn5Tt4SkD/VHjOVXz7qlhRXyEt/?=
 =?us-ascii?Q?MUy0/hy9mSbXvvd9hH+7jjCbyGURGNm5HtSPvNJKIOuTQaaLguoxn0kHjFUN?=
 =?us-ascii?Q?mDIoBQlNGgirxKMOkMMk4d/Fs1opzzmhsWma8ptQeiO0GmpDLhYbfOMpcU7E?=
 =?us-ascii?Q?M02QFBmidlsbbCm2xyMZP/+Y9/o3Tw2mSHdUqT7Z/zvjVYpZVyGe+wU0+W2n?=
 =?us-ascii?Q?Xw66NQ/3/2QQjM13DHEKDrbKUYG2i+mrCs9K8wXbJq//TaAe82YkD54aPUVf?=
 =?us-ascii?Q?YDIZgGNZ9K0mR/Kew9+yo7xCubLkKgcR76gMS4N3ruaR0qUa/VWAscTh7yo/?=
 =?us-ascii?Q?eFXrKMn9+nWiLFpzBPJVNz700pGzHajnSvWks4myQBWVwL3tPuats/e8CKLo?=
 =?us-ascii?Q?Lbi7BS3Lgy4EatxD/wGvGrdRc08aMkAilsq2EDPids2uza2Knsa/MBUZD2vk?=
 =?us-ascii?Q?PWAEGDyjs30FPWJMcAd+y4cvZ/4/8eMWo72IV5GvVMwuGfnHLjbeFYVWvFh/?=
 =?us-ascii?Q?D1rNXyFRmo8iz4DqW+Dls5hXEqeoDkkTDuxSS1halZIDCvY4Udq1vlVmSfh9?=
 =?us-ascii?Q?+Qo5Emqya/g92l5o9jJKcSjPG51bTLiK5ueyKqhJm4Pcuzk4SLLkW6EM7ilA?=
 =?us-ascii?Q?XA9elCWsa9PioHuv4B7lfgSPMs9e8keyKSw/qrolPKUzxpEjEw683iew3OgX?=
 =?us-ascii?Q?TzYZkYhCTSpdsHokElk/EKt4vPSXfl2A7UZgPM11glQYfeRMm0fScjHSsptK?=
 =?us-ascii?Q?E+E/kfGVkVGZ9SVpzzdt6/PseujvNdCqOUojp7oOuwnXmWZJIUSDzlOmSqwe?=
 =?us-ascii?Q?TzLmNTcgQOZP4Tc8TA9rrzC0pbfGrYcOsn/iuizm8YWeVEYh6d09SZowwG9O?=
 =?us-ascii?Q?fuuufqJCPDoErunnql/9a3iI3T6ubf/79iY+DhbmULBGneq0pdfHqmXE1U0W?=
 =?us-ascii?Q?TesaV5l3XoYIPaxhXMCrnunpXp7WZ8xPfSbvRyf+VpcP/bzcOiREUjj8k89z?=
 =?us-ascii?Q?xtOG3DDoaqAXK76S5MnBhy5Mro9tsa+W5tTMi2dc51PB4D5QvEqcLMvWYDh7?=
 =?us-ascii?Q?0g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6b520a-c07f-4d48-1803-08dd74edd29f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2025 09:31:34.5862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /eMaqnis/6CKKags/xPdjsdvmY4pcKOQpHHWwRyB+zWzPDLGTDRZPz6TyoxSA2JfS6guWaJFFBtqxQR+CYueuyIryoSlFJvCnymSpMw028g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
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



> -----Original Message-----
> From: Sharma, Swati2 <swati2.sharma@intel.com>
> Sent: Friday, April 4, 2025 12:59 PM
> To: igt-dev@lists.freedesktop.org
> Cc: ville.syrjala@linux.intel.com; juhapekka.heikkila@gmail.com; Shankar,
> Uma <uma.shankar@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t,v2 1/3] lib/igt_chamelium: Add
> chamelium_frame_match_or_dump_frame_pair()
>=20
> Add chamelium_frame_match_or_dump_frame_pair() to compare frame
> dumps captured from chamelium. If they do not, this saves the reference a=
nd
> captured frames to a png file.
>=20
> v2: -let crc be computed from compared_frames_dump() (Chaitanya)
>     -remove passing of reference_crc (Chaitanya)


LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>



>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_chamelium.c | 46
> +++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_chamelium.h |  5 +++++
>  2 files changed, 51 insertions(+)
>=20
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c index
> 620fbbf7d..c86773898 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2070,6 +2070,52 @@ bool chamelium_frame_match_or_dump(struct
> chamelium *chamelium,
>  	return match;
>  }
>=20
> +/**
> + * chamelium_frame_match_or_dump_frame_pair:
> + * @chamelium: The chamelium instance the frame dump belongs to
> + * @frame0: The chamelium reference frame dump to match
> + * @frame1: The chamelium capture frame dump to match
> + * @check: the type of frame matching check to use
> + *
> + * Returns bool that the provided captured frames matches.
> + * If they do not, this saves the frames to a png file.
> + */
> +bool chamelium_frame_match_or_dump_frame_pair(struct chamelium
> *chamelium,
> +					      struct chamelium_port *port,
> +					      const struct
> chamelium_frame_dump *frame0,
> +					      const struct
> chamelium_frame_dump *frame1,
> +					      enum chamelium_check check)
> +{
> +	cairo_surface_t *reference;
> +	cairo_surface_t *capture;
> +	bool match;
> +
> +	/* Grab the captured reference frame from chamelium */
> +	reference =3D convert_frame_dump_argb32(frame0);
> +
> +	/* Grab the captured frame from chamelium */
> +	capture =3D convert_frame_dump_argb32(frame1);
> +
> +	switch (check) {
> +	case CHAMELIUM_CHECK_ANALOG:
> +		match =3D igt_check_analog_frame_match(reference, capture);
> +		break;
> +	case CHAMELIUM_CHECK_CHECKERBOARD:
> +		match =3D igt_check_checkerboard_frame_match(reference,
> capture);
> +		break;
> +	default:
> +		igt_assert(false);
> +	}
> +
> +	if (!match && igt_frame_dump_is_enabled())
> +		compared_frames_dump(reference, capture, 0, 0);
> +
> +	cairo_surface_destroy(reference);
> +	cairo_surface_destroy(capture);
> +
> +	return match;
> +}
> +
>  /**
>   * chamelium_analog_frame_crop:
>   * @chamelium: The Chamelium instance to use diff --git
> a/lib/igt_chamelium.h b/lib/igt_chamelium.h index d979de4a2..8882e13fb
> 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -257,6 +257,11 @@ bool chamelium_frame_match_or_dump(struct
> chamelium *chamelium,
>  				   const struct chamelium_frame_dump
> *frame,
>  				   struct igt_fb *fb,
>  				   enum chamelium_check check);
> +bool chamelium_frame_match_or_dump_frame_pair(struct chamelium
> *chamelium,
> +					      struct chamelium_port *port,
> +					      const struct
> chamelium_frame_dump *frame0,
> +					      const struct
> chamelium_frame_dump *frame1,
> +					      enum chamelium_check check);
>  void chamelium_crop_analog_frame(struct chamelium_frame_dump
> *dump, int width,
>  				 int height);
>  void chamelium_destroy_frame_dump(struct chamelium_frame_dump
> *dump);
> --
> 2.25.1

