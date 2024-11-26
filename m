Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4C9D3B987
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 11:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20ED010E0FB;
	Tue, 26 Nov 2024 11:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gO2d1RWs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5480310E0FB
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 11:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732622065; x=1764158065;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iLI9ShyId1xGVqW3jC1Q6aSB2IaBv/c0IWtV4aXdhpo=;
 b=gO2d1RWsQf8qj/e5v7RcHbXkN7xe109f9srpsywFiAKZ2EwOEgyfqSVg
 w2sx10Lr3LeYtGefGF7fvCRhND9jm8HVcLokblsgXu8bg57z2HUmFVjAF
 csRqfWqgAfs1W5trMgNT/8fiUxcPWNC+w66WuEpiAGpyUOcyyjrUV1eKf
 5mp6v3V7R2NOgzG6xYXMEF1bSp7KLqimncwvHLRuYb5nhBNImKxyz3pn+
 UKOmaqq/Dr6SyUPsUcwqTmnjv/7kJjzItDey/qWnCL37RkQIvSn+MOh8z
 LLJxhun2QlL/65pZVek3Eb5K51kHKE5pZIQMdduzNc4RKzbqnPbxSduXu Q==;
X-CSE-ConnectionGUID: ika+noZ3TLeK2EiGZzC93A==
X-CSE-MsgGUID: RREObi5BST+sYsVdPzFYOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32924000"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="32924000"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 03:54:24 -0800
X-CSE-ConnectionGUID: VnLIHpA9RFqeGhlJvr2hJQ==
X-CSE-MsgGUID: 6dFOPGTTSES5Q13aIc3Q8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="91707957"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 03:54:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 03:54:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 03:54:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 03:54:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvbsAxUSdY//st5xfnJBnKZlBs8UDztVmdVxdEa3s3VWlOBW7GEfMv1FS698oFXTUuJzkUkXVdYVbAsPT+dACxfn2aoqWtwPfJltG/X485hzp5/QFEr42HP38kd47ncz3HUW7I9kzUrHWVbGd+iZleoKH4A4flXZw3UKjNnTdSOIc82wjZjdCU+VjQDnkZAJKBdhE4i64QIoYpCweHaqxQgOY+8tClVj/IJpveMnpD9PSGSJAivPPj74RzrJEIzVEVtNJVYMXU8uas6aZweNi1zl7wTJoiaVauwCg3afDaXjeUvGmvWTCZJXitW7dcXRUz/UMdsh6kJQ+VKJsh8bhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jK6z8y8unh6KXgCwA5PfHAbu9KxJqIseRhKFafTJ+LQ=;
 b=Zg5Ge+T0MFpbvbyrad34QwjdWabzbWliab29cyaB4VZ/vHq5XiuY7ByAOy2w3qFEaNkXjiXz7GiQA490DAn5tILXTHxDnz2hlSPcvWnAafGgJun2ywV9wAeklfEWTKYUfycmX18nDoHMMH/f0EYtpbiRtuSGPqZSbcjn5up3UJF3Ij4I6t5CKkhgVsWb/Iy3t+MOrWA2gd3VGZ4aprgqae7HCMlNyhUFPVAjcGETvnQwse5SuWzKWP872f21ylipF7TTb9B2kjm929Rtw3D9wekSZ2WTlIgEyuh8UzSAxWzDj/Y7Z85hKqTLtQ1Aw4MyCRfPXBaZqEWaD3RgCDYIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9)
 by SN7PR11MB7491.namprd11.prod.outlook.com (2603:10b6:806:349::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 11:54:20 +0000
Received: from PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::dfc9:d5e9:2cd4:8d2]) by PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::dfc9:d5e9:2cd4:8d2%7]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 11:54:20 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Petri Latvala <adrinael@adrinael.net>, "Krol, Karol"
 <karol.krol@intel.com>, "Musial, Ewelina" <ewelina.musial@intel.com>, "Karas, 
 Krzysztof" <krzysztof.karas@intel.com>
Subject: RE: [PATCH i-g-t v2 0/4] runner: Allow limits at dumping dmesg
Thread-Topic: [PATCH i-g-t v2 0/4] runner: Allow limits at dumping dmesg
Thread-Index: AQHbO3qSBcKjdLIqMkSYs9w5MaNkcrLJfFTw
Date: Tue, 26 Nov 2024 11:54:20 +0000
Message-ID: <PH7PR11MB5819C96756DB95A62E41B7A2992F2@PH7PR11MB5819.namprd11.prod.outlook.com>
References: <20241120183208.146299-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241120183208.146299-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5819:EE_|SN7PR11MB7491:EE_
x-ms-office365-filtering-correlation-id: 91e52349-fa23-41c4-6e9f-08dd0e11103b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?dgK3ROZmCpcKu0bxEPsPCD27f5rRFti7JRzFdav9mFWWUrbOKrygkqx9WHY1?=
 =?us-ascii?Q?PKbS92N+vepvDBRLEFbdf4n7iIYMyYKJ7H7gySd5CLsdw4XxoJfsqKc1F/rM?=
 =?us-ascii?Q?cCGOIbTLH7Ic4tOiGt9coPJ4mrUZn8IZS0bsHzqtZZyPcVMZULOY39XDOrUL?=
 =?us-ascii?Q?1Etz6/S+TAozsPVn+wzoEn5M3TSUkTgUwRX31NQcJ9Otk7cEyMDvGpE9aAO5?=
 =?us-ascii?Q?bEGGkHBKHJutRH0PvdYPwARA0d4v5iJKZGBojME8iO9ZwLqG4NZC8pSwgI0Q?=
 =?us-ascii?Q?m6gkEZ6mHxmnjkI+hhLsQ1MSRKr77fHceCrxY+e9edDEuVTfZ0Hd24Qt+TPB?=
 =?us-ascii?Q?h3YxFsowCadJx69K+RmgJeU4wyFMdjy9MAB8A1XoNgxOCzsr9pxiA6OknJfq?=
 =?us-ascii?Q?hANomTZXRBEXZt0zCMJ7eK9zWrvcpZTmgLrmAXt20XvtviYpHEXwRyuwc07A?=
 =?us-ascii?Q?oDpe6Rqf7oes+Q9nQqGQnoWJRK0dk9J0NFblc18N0oJItND7DZv8nUq/fIqj?=
 =?us-ascii?Q?HWOX6giN/1G80lglRTVl1grolRdl+IDg8lMfH1KTQgIpnIq7WWgrEHKmOqt2?=
 =?us-ascii?Q?ULwjwntXj1GtGoBvskzI2nHfrGs9azIOag2+sBaqfh7IE/c/hodj3e4sNL2U?=
 =?us-ascii?Q?+0WPm+SmEJNRwoxPtHLuJu2Qsd/S+D/dIU73Xfq4cMviBN6yK+rybwR0J+/9?=
 =?us-ascii?Q?DVaSQE5mRtxAo4loTP4ZZn3JzsPxg7jU80pGk4cYC0ZhjShzNNJY5VIVuUb1?=
 =?us-ascii?Q?T2DMgGy1w4uWgKsUO39uWJQ2SYkKz/Pr1P4BlPhDZvlhGSNnY8XOCYD6m1sQ?=
 =?us-ascii?Q?2vNtKl8SV530siA2OqWKCHcCWzSyu4IqYoiaRbbWkCLiy3q56AZDoHcWer9C?=
 =?us-ascii?Q?g2yTYdMZ9wA6ZKz9TIuMlbm4Rb+hnDyYi8pVpJVlj83S4DJeJDrsPHPNPJBX?=
 =?us-ascii?Q?hfxEXXdtKjJQqqx2uYf8bBkoRiNxuP6eAoTgcaypMVOreezz/Qr0+0BOV45h?=
 =?us-ascii?Q?S+dW3tk4Nfyw6aEX8Pw+K3OOOwun21acRR2fob9UzAoi7POT6CxlzpgCwTfA?=
 =?us-ascii?Q?o9FxiU301Vf5Fe8to0B9Wix1mmx9kizkUmr2kXv4anVv0ADKFeWjJiWIJc7F?=
 =?us-ascii?Q?KJuAZgtjQzipb/8/VMExopa9RsOQ1A+CTxh0eeBsdz9LHhQCig5NxReLn9Yx?=
 =?us-ascii?Q?YP/CVcKWRog8ezE3P223M8ccSfClsjerGzkRr7NF5iX5gu1/eJQjiqjDjyeu?=
 =?us-ascii?Q?1XyGEdxyvKtqObNOlTzIf1gLghmRbOdrvZxJUeCsC+qlpQ2DULNCl16KEcB8?=
 =?us-ascii?Q?AbP4D/agNMbApM14LrlUW8jaWbmdkWgEMx1axNEEW7MQ31vspdgcyVBZeGuf?=
 =?us-ascii?Q?xAC/P7k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5819.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hn8Ne4lRHTXGrMFL4d0Z75fMFxN0QIyZI1jPRmNexzvunkYzsVQ+LbsTCEZC?=
 =?us-ascii?Q?/PtHdgo7aWPYiXuw2jObZ0HWPfxLaQ6c3B976X39Ka4Iv9XGttlimjvA1Rq5?=
 =?us-ascii?Q?TujbnH04wddrMv0XXCzIwl0FPdAF91FP7s803bmZAF+piyhKG0pp9QlTSk27?=
 =?us-ascii?Q?NufBoAbjV5A+8/2NGos+bt3bIxWAdBGluuFiVyMnYGUwLZYTGoTcOef5IxCh?=
 =?us-ascii?Q?jZ2Yze50zegzmf6bS+FXaw8lF3ljRR77heDC+Fo6VUK9Utvz8glAskm8zGJw?=
 =?us-ascii?Q?+6nhtHtK4IURWmpAjF1FIjwreZ35qjQWFb9i0dUF8ibi4eMriIkc6m/2GQSl?=
 =?us-ascii?Q?dIHzmMlnpAvWqwzESsqhaKb23ztyhzIVV1sy/Llpy9NW7x99hm0FBvwQTg9E?=
 =?us-ascii?Q?yp2WwU6/wnfMK48FaTbKAxs7HwqQhe/S3FZ0gwh6mL+WfElYNwoUODL0Gx6Y?=
 =?us-ascii?Q?D4KbGutEFtzt/mi3avhGCdSBLfz+AV3JGwFVWPS+fXlaItBG09XYTD2zOEFJ?=
 =?us-ascii?Q?QVj1L5++eBVYvyp5C55oliXq3u2DYP5buK8zpjVWeRpF4XD4lSIEB0CNnGXa?=
 =?us-ascii?Q?+h5KASre5qUHyC/iB9QjZVZy2ja/61eiPZzXlhuAmREdYgy7COhZIS+YQc72?=
 =?us-ascii?Q?bnF7/2uI82UXcqKwDEaS4/zgpydSezXfFzBf/d2d1/PgtP4q+9/4ekZpdI21?=
 =?us-ascii?Q?YdRzLSZNQ31Tup4nci6HFzw7SZ9g14vFdHuPCO7hOSs3dxJerSeB7zT8l93j?=
 =?us-ascii?Q?rJh6MHLtgtnP2mY1xxORLYMwjT+G21xEun505oy17A/jtbbgujXbjA1NZslq?=
 =?us-ascii?Q?y5RcvhUDy9vHeEK1ki5BtGTsHJ18PsuB34otWzM309u336PebQ1N9rZLb94b?=
 =?us-ascii?Q?BxrFGCmXTBVj8gZEv3Mah2hczfi9rPYR0RPb3rxu92u8HT+9twRlQHXgQd6w?=
 =?us-ascii?Q?JCVGlqf0W4d/9hr6ppthvlcMZ/+mVqIFydE/MHvboFiLqNHFh7Kt6zEGIbwC?=
 =?us-ascii?Q?V3dVHFolC5xeJlmegO/oxYo5WHM/i9hmHO+M6tWNHT6y79YLa6eNknFVmhjB?=
 =?us-ascii?Q?5kRw3TcxvMLITI4c1UsuyhrmvKpzROlo7sJVjnnQPRi+lBwQb5/DT06VSkID?=
 =?us-ascii?Q?q0wcEfYBWBIlQaz1S4Q68pc3AkAcShr2wkMdg55bDuO6kDf2c0chEcSSQc4M?=
 =?us-ascii?Q?fQwxji4s/VG2tBJCEJgjVm16CNQ5q6SF76CumGmC8VEBZR4lfcahNf/X6+MI?=
 =?us-ascii?Q?LZMX1FWMB+zBvFGGQ1KR7tOprZ8GvDi0xcrqWQiXlhVNRnuaWqTTyh0QHgGy?=
 =?us-ascii?Q?8LOgBi0kKSc2Na8mnjN30nzlkwNrP/7gw5tqbiiPPRyWXSuwQk4BYk2dS9mw?=
 =?us-ascii?Q?vzcnk1lsojgpWBmCLj/DNWq7Ipc9pp5bfpzqMX+Uv+P5aN5dlImabF4Lo/IS?=
 =?us-ascii?Q?nsawYEaLhYmwGrXuppX6iVmd3VoornkYR/OHrsuuluOSsE5w7UXoI6pO0C5V?=
 =?us-ascii?Q?XK7uc2by2LU4pdydhkAhgGnb/kT49J2F5L4SDV2Jv+7AnDGAoXbF9vlfbzjQ?=
 =?us-ascii?Q?SK7A5ECLx73ecZLIZBBcG9w+6MExnay0SwK2+feC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5819.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e52349-fa23-41c4-6e9f-08dd0e11103b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 11:54:20.5835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PZkH/GeOhVetVMwmI7HbS+QoYW2ncuy3hB17hVvNxjxccAWtTbg4R1HKzEif4wc4dMWHPZe8czC/QA42Fyv8nC4d5IQgqlcbuVc/w1ZmQM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
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

All these patches LGTM.

Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>

>Subject: [PATCH i-g-t v2 0/4] runner: Allow limits at dumping dmesg
>
>There are few patches, first is a check for write error which could
>happen at full disk, second is a revised solution to a problem with
>dmesg dumping exeeding disk limit in runner. Also while at this
>inform user when an actual disklimit occurred and correct one error
>path.
>
>Previous proposed solution: runner: check disk limit at dumping kmsg
>https://patchwork.freedesktop.org/series/114353/
>
>Gitlab issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/12=
9
>
>v2: correct size in case of no disk limits used,
>  also correct one error path and inform user when an actual disk
>  limiting could affect what is written in log (Kamil)
>
>Cc: Petri Latvala <adrinael@adrinael.net>
>Cc: Karol Krol <karol.krol@intel.com>
>Cc: Ewelina Musial <ewelina.musial@intel.com>
>Cc: Krzysztof Karas <krzysztof.karas@intel.com>
>
>Kamil Konieczny (4):
>  runner/executor: Check for error at writing dmesg dump
>  runner/executor: Limit reading dmesg to chunks
>  runner/executor: Fix error handling at terminating test
>  runner/executor: Inform about terminating
>
> runner/executor.c | 107 +++++++++++++++++++++++++++++++++++++++-------
> 1 file changed, 92 insertions(+), 15 deletions(-)
>
>--=20
>2.47.0

