Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AAECD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 08:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645CB10ED48;
	Wed, 13 May 2026 08:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpuclo0G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5079210E2F5
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 08:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778662220; x=1810198220;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f1el/KK8kHtxIgNCaQtGcY8+/UG/Gu0AJ7Hlq/22W5s=;
 b=cpuclo0GMXPWuRyHNtDJwZtHe0vT5BXHlN9EvWrL7DVmhEfI2qZplgcW
 DotCXhuvb1q7DFWn9j59L9hocILqEpceM8NscnoDdBWB9Sp9quBwBc8NO
 y1VIunF+7GkNkFzNVooncEyLepOYU68/hzxFPoj+uPjKtr1KlmTqxrdmD
 gg7jbV9J5snFY8UN6ruLEC82VTYuh6vrRx5RZ32e3VOdUWSfubuPSyU/a
 o14C3ZB/Jm3Gjhv0Ff9qHIwK8vlgTbb5parhZDcvMbnyRApmutQfmW4lM
 glTlJV+Dr4XQzBuPcWGxDz1e5NmdP4cJCGpXV8tFmhKzYQRFRT+WnNGpe w==;
X-CSE-ConnectionGUID: rk0IblLFR32V85x5VjUTxg==
X-CSE-MsgGUID: 6oh1pVUyQsCaUdyOFzxgQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79565800"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79565800"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:50:19 -0700
X-CSE-ConnectionGUID: 6Svt6ak2Qn2GHu97AZqA0A==
X-CSE-MsgGUID: AdrshtRrRIqEJUaRovJ/xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="233751339"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:50:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 01:50:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 01:50:18 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 01:50:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LURe/+nPqdf5mRbnQjTO+HfhdwHmH5nCKDh+296T+ORaSq6sqxWCcWvJ3K2FbjY2rB073enF64KWauvFbgfbUAe3xPTh85SifkDeiUgCkL+1qX+zzETqPtwbzxl9HXBpZHe0laLIRzMs/Ja+RmxrBc+fjxkMt3R/ktGa1/U9A9DVUIW4JMuWm5PjmENZNkw7J9IMTGEFFdBjqhfcfrVref3wZQka6Ttdf+wo86yTugc5OJug1FvS9HV8zSqm1QrvRR54ZVrsoUK16o6hTS6PCNzpCQ1lD2V/8zmXEx8G0NlbBaozUQqt4PGYBIBPGy0/By/RMPnuJAVa4vxV0P9rmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNjaV5yiNZoUkJOAlg4ScHI5t7W0SRkFG34EcVUjf+o=;
 b=mFvAsJjQ59OcwQe4EB/x7TUwAHXNEl+n3Spfbbo5XmhBeTG1eZW6XWaEApuxov7noX2CgI7/J2al5WcVSl5Y8nbjGslKmZBZ3uffFouv3LkdRsZOAiN/d6TWw9VguOngRFoQj8Db7RVO+QsBhEabX6w/aBrl1q8UfdNWtOHLshQwukFAO3PhPqwv8kQbmBXgaoxLdpEcRRFy0bTEAvTjNc86iGF3Dn6fxdOzoDS9YAdsgip5KC68PJ9vx6+ryqahX1NaIlgaYqN0pNAEM4ah/n8LCuMaWKFptI9ZS4/TQX5wNmHWihVT/r0pICkv2UNScw2sm89RXZkRIrqLUDFRWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH8PR11MB9808.namprd11.prod.outlook.com (2603:10b6:510:3c2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.11; Wed, 13 May 2026 08:50:16 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9891.017; Wed, 13 May 2026
 08:50:16 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Manna, Animesh" <animesh.manna@intel.com>, Dibin Moolakadan Subrahmanian
 <dibin.moolakadan.subrahmanian@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v2 2/2] HAX: kms_cursor_legacy: Use
 IGT_FORMAT_MOD_PREFERRED for cursor FBs
Thread-Topic: [PATCH i-g-t v2 2/2] HAX: kms_cursor_legacy: Use
 IGT_FORMAT_MOD_PREFERRED for cursor FBs
Thread-Index: AQHc4qAfRcGn3mkVCUK1UVmkP8ikPbYLocSAgAAC6oA=
Date: Wed, 13 May 2026 08:50:16 +0000
Message-ID: <DM4PR11MB631279797CC6D993EA04720E90062@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260513061503.645278-1-jeevan.b@intel.com>
 <20260513061503.645278-3-jeevan.b@intel.com>
 <1fe9ac6853b6bebc3fbdda98786c6944f66d7f82@intel.com>
In-Reply-To: <1fe9ac6853b6bebc3fbdda98786c6944f66d7f82@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH8PR11MB9808:EE_
x-ms-office365-filtering-correlation-id: 525dd2b1-702e-45cb-7428-08deb0cca77d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799003|3023799003|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: OGeFWz/zUxE0vczTkGceEEl2DIXN4MlYEYnm7jFzsh0Pm18uVsUVuX1cmUYZmmszH1F/91l9kLrNv6qacbroUprQ3gz5qawR79qL2flAUA8CDqwZocteYGhT0yZqcY+js0ejz3HaQ7NtRyjQuByOdspKQ10keY+5l3Th0/bw3lvy51Be2F5JbRJ0uumSTehxx0qa6e9ZdUBtTcQsa61H8lNU1iSYshSSTvHyM/LI3LNTAJaJmb5J2x7D5Ws+xsP9G8SoMdIxozkjrpg4jHo23FmBU4HoezIWUEhPKR4Ub5R2S64v66Tie+cvdADqC4je8nBFvx+NIaCNciZ3zzlTLE0M2Yn9UPbodJRZDsu6dc95E61jk1kCU7YPbpc/BLgDmFLLZx48cNhqoECyPpYVPZhkP/HtOW3wlv7viAsOm7+o8gh1tjj309Ivm3hQ2dSk/HJ8Ikz0sgSYQrP0T49JXfavZqJ4fZi6eXN6B1yhSf62xF3ZVhsl7FM7bqWZcAYeKTNmrgtEDRQWHE2uUG9qHTVC7uTDGuzUJCL6bD0ShVTgou1sfTMm0LFljBX0Z3rDCzoFXpFqaeiEfJmI0O/Vbft2j2St8z7CbGEsgNLMXafqLOioBIb295U+oNJV5kiykL/wOhxM9CeIaJX10VKvlcnB13C5cMGb4ROZx0cAYWwFrcWwuU+77frKoDbSoMB4xkNDozKFTGogT8Nu3KRDBdy076e8JX92mKXc1AjO9cTDzITSfa+TFldxOyG9VVkL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(3023799003)(18002099003)(56012099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?55M7n2Cf9KXJV7mjpiOH+zCQWsOnONWLnPkaOa2p7o1Z3TAOyV8UzuTkSJZq?=
 =?us-ascii?Q?zbQ3cdsu/imoPb+q9VA+T1YzX84LTFO455eX3v4oT1OVHhiQkLd6I/CVLyNb?=
 =?us-ascii?Q?sqIe6ZoIltpIoXnR05RrsZi8bQb8Pe3x4Vl76UGK4zV1Yy6e3Nb7nnqwSOKo?=
 =?us-ascii?Q?Q2EXe2YbXTaefbecXgLyJqb58wqL20yajstKwly98nhy0wNmFRD0ousBIyYX?=
 =?us-ascii?Q?ojBgDbEjfGJt5NE3ba8oRCkbu3usRK6w1/6uBSJSpq3sHs7/eG/4sU5rzpYx?=
 =?us-ascii?Q?JxndrldqR5+7y9EZwP1fIb9vdpYzZngfqGKRQbdQIzn4R3gXdubpJspXIACF?=
 =?us-ascii?Q?9mMjmAEra6BHoNNYG1PYQZ/UcTuOsjpiXvKkUG4scZFX4i48Udc58T4lGlGv?=
 =?us-ascii?Q?MOajULxAhIwkQwmIDHeOFUlu2uYKoZH8QG91D0/1S61icK4+OTtyIxroKhA/?=
 =?us-ascii?Q?4J4V5T2rVVRuAG6cnfWk2gKynXhvguhazcS+dfYUbNTFQ9ZXjR/ji1IOQKm6?=
 =?us-ascii?Q?/35IcG2ErpD1H6yMaL8mnLUTPLEsTDMkoxiYcxY/N0SHTe7uzinnB0gUDkxg?=
 =?us-ascii?Q?tOiY4sAO2i6ft+yKxnDv/zeZT6ZyJFvqEojQdv1EJjvWwm41jYgmJVUZ+EVa?=
 =?us-ascii?Q?d2LtCnYWpEw0m5v9B4PKV0EeXVdlXJDLs41bXf4DzHR4IPOw4QvdZyHb00wQ?=
 =?us-ascii?Q?LCCLtrYlDpEhM9rNh0zioJAqe7l4sn1eZh69XvZBaVP/90dDkUj0h8YP+WDs?=
 =?us-ascii?Q?GONizDhOSAlL5wYYj8PThfD0s1dXGdaU02SBOsRxPCuLjlp5+48KoU8Rc8Or?=
 =?us-ascii?Q?5XLBR6K0IuuvtehGn/ADh7lBf+KbLYjjYWPoEALHzgAihuxJeE1PMy6+MxD8?=
 =?us-ascii?Q?mx7REdXtHIFBwBYSuNfoR5oZr1mY2vcEl7TmMUCcpVPGfUNklQ2iresSfbYL?=
 =?us-ascii?Q?fiLCO/1kZov+yTwR3Gzd3fd3X71CXYikdNl37RNwA4emj+CeaUSN01vo4Plb?=
 =?us-ascii?Q?Gon2Wg/nMWS3bhCKtNST2eMeasldAQ7biqA8YlX4hlXJRhZ3GPm1P6oEIlwS?=
 =?us-ascii?Q?GFzvWNh56iNtLz2+n/KBePI7QkfzhGpaVPVSAwnf0vt3w69EohTTYeOBepXg?=
 =?us-ascii?Q?W8glKcSz0YgHqznXtQR500OZcR/Oe1TCG1KOXcLByiXNte5VgC1SFwbDohrf?=
 =?us-ascii?Q?1uI2fstuSORpsDHU5PB+KPNX/hJNPCBXOO+QU8lONnzdRcycQV0jfZbhQCd/?=
 =?us-ascii?Q?tKKDuJC/Tvjm9tUT6zrGM1E4EFKXIJunpjnpNJyXXf/9DIO62GoVdMneHuJ0?=
 =?us-ascii?Q?PV6qlEeD/Bx8i/BXldnt89vV/hpHYvYgz5KcP0xBqBSVbw+a9sAYCt9ff5fr?=
 =?us-ascii?Q?/uLQKfSGG1M5a700wztdIE7fuNhSelSlUCBgTxfLJPHrW2MsxYzzMHbVbe0Z?=
 =?us-ascii?Q?pHwemBTIqtXEwgWk0TfIR4DZx2maTD58yezTVHPeH4/mVpKuiWRc+oWVnyKN?=
 =?us-ascii?Q?yBDrgrBMAjMiHheaQkCyQWrBKnAGbsMK3si284Z19RqrvS+iix87T2+I6C9c?=
 =?us-ascii?Q?M78gWgG++ZYOPNtBO1NmtlmKnvII7IjDra3vXAVCHuLuxj3zB2VKXd0jGhoN?=
 =?us-ascii?Q?P3TZ3PnRYAw2DnbAwrR7Ztk9bRcN75ODTOU7e4JfDE/IImQne90b/ydsg6P/?=
 =?us-ascii?Q?FjVhrDuUNrjekXgKgZuDbzxgVF5jUlE1Qcpir3fv0eZembcY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZO3zwuM+vtZq0WewSBXi4nmXNRJVovWUmmnWhltq/no7ep4oW1LKTx7MktZ0wGCaNNghRb/NO4XhT6kvqMILvY2fjU62aVn9EKCMIR6j2ZrCih7kIUQvihTKQc5gH1tODh55zjoBr6H69WVyA4xSE0qYJIqYQBBDgENxiWjbYW4+KmwxZvjWOAmZ1XYOwvK7NxkePSOGVtQj3hawsDyUhMBPkZcaB2Wka4P6MsaX6epkk60JfbBBURtYZ9B03oJ5DCoMdu9GDLobAL8LZ0pK0fddaKuPAyUhJ+T4cablDmc40dXZmnzLK9py/KcZzS0tugZ+mVg0oxDnsdd3u3ErDw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525dd2b1-702e-45cb-7428-08deb0cca77d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 08:50:16.2792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3t162hTVD4Z7vIj1q871ASH1QjbZA9z9GfSz19JxWWPJgr5xYiQsAcmyVoa1pw/S8q6lclzC0qbhwvHF047NbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9808
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
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Wednesday, May 13, 2026 2:06 PM
> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Manna, Animesh <animesh.manna@intel.com>; Dibin Moolakadan
> Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>; Thasleem,
> Mohammed <mohammed.thasleem@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: Re: [PATCH i-g-t v2 2/2] HAX: kms_cursor_legacy: Use
> IGT_FORMAT_MOD_PREFERRED for cursor FBs
>=20
> On Wed, 13 May 2026, Jeevan B <jeevan.b@intel.com> wrote:
> > Switch all cursor-related framebuffer creations in kms_cursor_legacy
> > to use IGT_FORMAT_MOD_PREFERRED instead of
> DRM_FORMAT_MOD_LINEAR.
>
> Why?

Well, the plan is to remove this hardcoded modifier usage. Since these modi=
fiers keep changing from platform to platform,
we currently have to update them manually or ensure that only supported til=
e formats are used.
Therefore, we are considering introducing something like IGT_FORMAT_MOD_PRE=
FERRED,=20
which would automatically select the best possible modifier for the given p=
latform.

>=20
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >  tests/kms_cursor_legacy.c | 31 ++++++++++++++++---------------
> >  1 file changed, 16 insertions(+), 15 deletions(-)
> >
> > diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> > index 5399ef481..e32d2ac7e 100644
> > --- a/tests/kms_cursor_legacy.c
> > +++ b/tests/kms_cursor_legacy.c
> > @@ -373,7 +373,7 @@ static void set_fb_on_crtc(igt_display_t *display,
> > igt_crtc_t *crtc,
> >
> >  	igt_create_pattern_fb(display->drm_fd,
> >  		      mode->hdisplay, mode->vdisplay,
> > -		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> fb_info);
> > +		      DRM_FORMAT_XRGB8888,
> IGT_FORMAT_MOD_PREFERRED, fb_info);
> >
> >  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> >  	igt_plane_set_fb(primary, fb_info);
> > @@ -579,7 +579,7 @@ static void prepare_flip_test(igt_display_t
> > *display,
> >
> >  		igt_skip_on(width <=3D 64 && height <=3D 64);
> >  		igt_create_color_fb(display->drm_fd, width, height,
> > -				    DRM_FORMAT_ARGB8888,
> DRM_FORMAT_MOD_LINEAR, 1., 0., .7, cursor_fb2);
> > +				    DRM_FORMAT_ARGB8888,
> IGT_FORMAT_MOD_PREFERRED, 1., 0., .7,
> > +cursor_fb2);
> >
> >  		arg[0].flags =3D arg[1].flags =3D DRM_MODE_CURSOR_BO;
> >  		arg[1].handle =3D cursor_fb2->gem_handle; @@ -605,7 +605,7
> @@ static
> > void prepare_flip_test(igt_display_t *display,
> >  		            crtc->planes[1].type !=3D DRM_PLANE_TYPE_CURSOR);
> >
> >  		igt_create_color_pattern_fb(display->drm_fd, prim_fb->width,
> prim_fb->height,
> > -					    DRM_FORMAT_ARGB8888,
> DRM_FORMAT_MOD_LINEAR, .1, .1, .1, argb_fb);
> > +					    DRM_FORMAT_ARGB8888,
> IGT_FORMAT_MOD_PREFERRED, .1, .1, .1,
> > +argb_fb);
> >  	}
> >  }
> >
> > @@ -652,10 +652,10 @@ static void flip(igt_display_t *display,
> >  	}
> >
> >  	igt_create_color_fb(display->drm_fd, fb_info.width, fb_info.height,
> > -			    DRM_FORMAT_ARGB8888,
> DRM_FORMAT_MOD_LINEAR, .5, .5, .5, &cursor_fb);
> > +			    DRM_FORMAT_ARGB8888,
> IGT_FORMAT_MOD_PREFERRED, .5, .5, .5,
> > +&cursor_fb);
> >
> >  	igt_create_color_fb(display->drm_fd, 64, 64,
> DRM_FORMAT_ARGB8888,
> > -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1.,
> &cursor_fb);
> > +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1.,
> &cursor_fb);
> >  	cursor =3D set_cursor_on_crtc(display, cursor_crtc, &cursor_fb);
> >  	populate_cursor_args(display, cursor_crtc, arg, &cursor_fb);
> >
> > @@ -769,7 +769,7 @@ static void basic_flip_cursor(igt_display_t *displa=
y,
> >  	set_fb_on_crtc(display, crtc, output, &fb_info);
> >
> >  	igt_create_color_fb(display->drm_fd, 64, 64,
> DRM_FORMAT_ARGB8888,
> > -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1.,
> &cursor_fb);
> > +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1.,
> &cursor_fb);
> >  	cursor =3D set_cursor_on_crtc(display, crtc, &cursor_fb);
> >  	populate_cursor_args(display, crtc, arg, &cursor_fb);
> >
> > @@ -948,7 +948,7 @@ static void flip_vs_cursor(igt_display_t *display,
> enum flip_test mode, int nloo
> >  	set_fb_on_crtc(display, crtc, output, &fb_info);
> >
> >  	igt_create_color_fb(display->drm_fd, 64, 64,
> DRM_FORMAT_ARGB8888,
> > -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1.,
> &cursor_fb);
> > +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1.,
> &cursor_fb);
> >  	cursor =3D set_cursor_on_crtc(display, crtc, &cursor_fb);
> >  	populate_cursor_args(display, crtc, arg, &cursor_fb);
> >
> > @@ -1089,7 +1089,7 @@ static void
> nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
> >  	set_fb_on_crtc(display, crtc, output, &fb_info);
> >  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> >  	igt_create_color_fb(display->drm_fd, 64, 64,
> DRM_FORMAT_ARGB8888,
> > -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1.,
> &cursor_fb);
> > +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1.,
> &cursor_fb);
> >  	cursor =3D set_cursor_on_crtc(display, crtc, &cursor_fb);
> >  	populate_cursor_args(display, crtc, arg, &cursor_fb);
> >  	arg[0].flags |=3D DRM_MODE_CURSOR_BO;
> > @@ -1216,7 +1216,7 @@ static void
> two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
> >  	}
> >
> >  	igt_create_color_fb(display->drm_fd, 64, 64,
> DRM_FORMAT_ARGB8888,
> > -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1.,
> &cursor_fb);
> > +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1.,
> &cursor_fb);
> >  	cursor =3D set_cursor_on_crtc(display, crtc, &cursor_fb);
> >  	populate_cursor_args(display, crtc, arg1, &cursor_fb);
> >
> > @@ -1395,7 +1395,7 @@ static void cursor_vs_flip(igt_display_t *display=
,
> enum flip_test mode, int nloo
> >  	vrefresh =3D igt_output_get_mode(output)->vrefresh;
> >
> >  	igt_create_color_fb(display->drm_fd, 64, 64,
> DRM_FORMAT_ARGB8888,
> > -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1.,
> &cursor_fb);
> > +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1.,
> &cursor_fb);
> >  	cursor =3D set_cursor_on_crtc(display, crtc, &cursor_fb);
> >  	populate_cursor_args(display, crtc, arg, &cursor_fb);
> >
> > @@ -1513,7 +1513,7 @@ static void
> two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
> >  	}
> >
> >  	igt_create_color_fb(display->drm_fd, 64, 64,
> DRM_FORMAT_ARGB8888,
> > -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1.,
> &cursor_fb);
> > +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1.,
> &cursor_fb);
> >
> >  	cursors[0] =3D set_cursor_on_crtc(display, crtc[0], &cursor_fb);
> >  	populate_cursor_args(display, crtc[0], arg[0], &cursor_fb); @@
> > -1628,7 +1628,7 @@ static void flip_vs_cursor_crc(igt_display_t *displa=
y,
> bool atomic)
> >  	set_fb_on_crtc(display, crtc, output, &fb_info);
> >
> >  	igt_create_color_fb(display->drm_fd, 64, 64,
> DRM_FORMAT_ARGB8888,
> > -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1.,
> &cursor_fb);
> > +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1.,
> &cursor_fb);
> >  	populate_cursor_args(display, crtc, arg, &cursor_fb);
> >
> >  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC :
> > COMMIT_LEGACY); @@ -1709,10 +1709,11 @@ static void
> flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
> >  	set_fb_on_crtc(display, crtc, output, &fb_info[0]);
> >  	plane_primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> >  	igt_create_color_pattern_fb(display->drm_fd, fb_info[0].width,
> fb_info[0].height,
> > -				    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR, .1, .1, .1, &fb_info[1]);
> > +				    DRM_FORMAT_XRGB8888,
> IGT_FORMAT_MOD_PREFERRED, .1, .1, .1,
> > +				    &fb_info[1]);
> >
> >  	igt_create_color_fb(display->drm_fd, 64, 64,
> DRM_FORMAT_ARGB8888,
> > -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1.,
> &cursor_fb);
> > +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1.,
> &cursor_fb);
> >  	populate_cursor_args(display, crtc, arg, &cursor_fb);
> >
> >  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC :
> > COMMIT_LEGACY); @@ -1816,7 +1817,7 @@ static void
> > modeset_atomic_cursor_hotspot(igt_display_t *display)
> >
> >  	cursor_width =3D cursor_height =3D 64;
> >  	igt_create_color_fb(display->drm_fd, cursor_width, cursor_height,
> DRM_FORMAT_ARGB8888,
> > -			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1.,
> &cursor_fb);
> > +			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1.,
> &cursor_fb);
> >
> >  	igt_display_commit2(display, COMMIT_ATOMIC);
>=20
> --
> Jani Nikula, Intel
