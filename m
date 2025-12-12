Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E89D44145
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 09:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1090810E55C;
	Fri, 12 Dec 2025 09:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKMRTGIp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E3210E55C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 09:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765531063; x=1797067063;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Lx0pGTMgZL8+Wu2qRf5qYszuCw5p0lrpCnncyFnT35o=;
 b=DKMRTGIp/dtWhfdVn5s7zChQ277S/YyOX5fGXbBxxriWrCIDY98W0zgF
 lOucZUfJf7TMkR7KQQoWJCCqKkOZYSkOKRTPQOgaXEz66yE3WF2OyPjRh
 kYxA0N31ggs5hbyVoK2T0Dt52mz0VorxTybBsuRKQYFl/LysoBVmmKKhh
 n861f3GFgeCWr7no3sncz+0lONEvuk7M9eJQcm+stHOlyktD8XE9Zp9UR
 6zd9+kR6A9F+9tIXozQRzWl0v5EN0fmvJD/OYkxomeQ7q0WNf1rIKZ7rP
 gxQJ9VVqdmdfViPAN4p48+pwPuFeRRsC2fddiC9ikISB6yyucnASNqV7l Q==;
X-CSE-ConnectionGUID: WSvVTgGrR+6cRxmwiGEGyw==
X-CSE-MsgGUID: yRf/Yj4fQY2rkbKUB1K3EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78887330"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78887330"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:17:42 -0800
X-CSE-ConnectionGUID: H1x8EYRdQfubqGPuIUQDNA==
X-CSE-MsgGUID: SHfPXOfTQSWGWCYgTeLQIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="196796769"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:17:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:17:41 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 01:17:41 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:17:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=st9n/LQcLWpqglu2CPAYOabFOiyIZ0F4ycYCdeVYU4sie4fMTHW2hJsptGNPAXZwI3ZWfHOCa/VJ4JLcRXuIeHadR9ImI3rPlZ5wdefgsOIiMjtoIS6PHaZmnOxyvT8+vtlMJk+91ssUqMPCkj5tobLEIwCHJfcv1tRjzGuw7W6iM5M/cTpeq9p/WqqRd+mLoJSd9ogzBhm5fT7nLFzmfv+lBxv/fd2ukFnDSOUQROSrGYGXYhHmF6Pdt1qWhkiaNtmAh8iDe4af2sK940swW4PCliuOkqaUwBC5FB7XFchLkpAD4KCR02HGWP62m3svqvMvcl3v2po82Q6uCe2Q+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1aXbKlNiTBsiT3G5oloCyBwqrZL+DFhQvxJWSsW/7w=;
 b=Q5CX8BP1i/46F7c/HJ4xYKrbV4Wo+qfUEN+/0gvaD9kZhzaEvINRMGpC1oaIEQqSlV5Xzzft3P35jkxi27r4YzrYYNw69htQhRTSnQMt5fBL47V52bHhuHO9kz2MublVSdIWT/U97/8FWm1fcTW7qWJrzkze9cgxHXuk/CNdToLuNxt3QCTfchmTs2qtRIrsQXbIT75UziZAbnVPK1mXsTsphWT9hvbvHb6XP3HaxCHhyTkMKo/R3LKSBpJgMqadeeQGZ5TfeANDnHlSBZq4llmpgSmQLqlVuUL8yUbiw6DTpSMR+MAGyVSKOetgWpHyd9OsLrQ2NVyd4xeaELr8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA4PR11MB9011.namprd11.prod.outlook.com (2603:10b6:208:56b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Fri, 12 Dec
 2025 09:17:34 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 09:17:34 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, Stylon Wang <stylon.wang@amd.com>
Subject: RE: [PATCH i-g-t 4/4] tests/amdgpu/amd_assr: Use lib function to
 paint fb
Thread-Topic: [PATCH i-g-t 4/4] tests/amdgpu/amd_assr: Use lib function to
 paint fb
Thread-Index: AQHcaYRmZ6zeo+Dmo0G1HbKAKtj8krUdvSSQ
Date: Fri, 12 Dec 2025 09:17:34 +0000
Message-ID: <DM4PR11MB6312412CEF22F7420984CB4B90AEA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251210032349.2781106-1-karthik.b.s@intel.com>
 <20251210032349.2781106-5-karthik.b.s@intel.com>
In-Reply-To: <20251210032349.2781106-5-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA4PR11MB9011:EE_
x-ms-office365-filtering-correlation-id: 25369a69-43a7-4287-cb25-08de395f4920
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1b9P6E5u7VPqCtJjWztkU0vK/YtcwcWd93GwPzuL0WoLmvcNMznAOj2Wdq8K?=
 =?us-ascii?Q?JiZ08q41Yn9XqhwD2fTmnbVdvgl501wN2K8ZLJCQLH+OZGazm3McOjDyfa/w?=
 =?us-ascii?Q?RA9ZRzxjYDOg+b23v1Q2joc2zrGKxNv+Lr18ksr1Wzmlf8U37XXH3bjPFTF1?=
 =?us-ascii?Q?1Sef7kocI3CxNiZRyZnLZTofKtIQ8iou7hpYA2h+wPhzC4SBrTOj8qxg/0jN?=
 =?us-ascii?Q?7Ev5Vpexoc68GSL6bwGcU4AKX1vggdSc65VOjX21gxjLH/50Gr023F4BeOJZ?=
 =?us-ascii?Q?DaSVdpYS41f8WR/60E05xOw0qa+s4uXIsqcCAG8NDxz3GbWsjZpTyMs/ptK9?=
 =?us-ascii?Q?3IFyVVmGproumt+x5rSLK/ZR2oOnOEIgJjDMBxy+Zq+mR3rI3LqMS1MjUwPv?=
 =?us-ascii?Q?7USQwqNNIQD8i3EgeE1iWw58VFBY3Fjz9FfJElUbJpzsYoyIhBleUJPFrsmE?=
 =?us-ascii?Q?JKaa0Vb0VqEgeWCdLaPjGE1+A/9CF6KMqpiVi4D6i+Isyc8dn7sKq2updXyR?=
 =?us-ascii?Q?wcnKEyqIbkMVCN7VHKLRQ85hqDLazRdT0yv4wHy++KITi8Gi9dMETFQwDh/y?=
 =?us-ascii?Q?e5I9LeIwAxZ0ADEjyX6w++hNzvEBY1uW4wAOX1f88H6kQ30gfXoeWHfjvtIR?=
 =?us-ascii?Q?E6sm+PItQ5s8ddsq3XYAoI6+P7h+LLRYBdG/+kdqQZ01UbIpDJIa8sLaTIHM?=
 =?us-ascii?Q?5lexGx4OrV6JByy2xgaKLkjKpjZRO3+gfaUNU19PM1Hg62WVp6I0iJ2UtXc9?=
 =?us-ascii?Q?gB3CdakDK+WKxCtFBeaCdeBbblV9h/h7viqmOfNDdpYBVpRkmtn4Thc9TWSx?=
 =?us-ascii?Q?D3tdt7duFerYUPkw1xYyHW26oYTujKe6prZidcpZxWyPg/f2PfKfxGc3xUvH?=
 =?us-ascii?Q?NFDytZu3B5YgyX0i4KMiQgSaATYO2fuUMU0f021o6nIqZZTa5ik99s/k9JEM?=
 =?us-ascii?Q?/Zw5ApBYtrI6wqygrbX3xuL9hXSZqNP5g3ENepcG8KLiL8ZWngwgV617QSQD?=
 =?us-ascii?Q?bXqHnDcEJguLs8omoNLX0ffAMWrLUzitjHEJtumcrzorJeIthVKuKKo4Npf/?=
 =?us-ascii?Q?FgSe70Pvuq4LQzyWm8AMPpYYAwD9TsxEpNbQNNcqfrnNFJpkWfTUFziO2g++?=
 =?us-ascii?Q?PiPD3e0wEA6IWlNM6FNKmkSZjVSzx6cckLyPb3EdW2CUJityJcJB+3zlREeE?=
 =?us-ascii?Q?zKCJY1eU9BhhsbPIool44ZmvHmMI0SWC5I2hBb4eOirSrnnHw09yasLpM2/J?=
 =?us-ascii?Q?TXGxsbgeR6J2UGv/BA3A+FkuLvi8nLR06eSTrH3ifXjlu4Ivc+JGXwAowEQZ?=
 =?us-ascii?Q?12rYcZE3fNJuSxuxL7O0DaFgihl994ZrmLleU7mnMwumuLsbsgn2OT9Obkvv?=
 =?us-ascii?Q?djm5drPOCkl5BIuhzPTdWy51DOLMo5jUf46QeTfRb89IihzSr1pYoUU7ByWY?=
 =?us-ascii?Q?aDfAFXPXXP79OuyNQ7j8fXuNvGJGauDlFgQ6mAG2Ju3dPG3uvJckuGQN+1gJ?=
 =?us-ascii?Q?HtJ9SsE6syYms6O7kT+Y79hq651T3GKn2g+k?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aG4GoBiYeZD29DRTsMSaUUM44ldZMIlHFjMbXH6S4kgeYAvPmW+xbh3HUMv+?=
 =?us-ascii?Q?EkoiBORxkVK41SmOvGCWCgUSm7qgvTM/B0w5tB2E0vUhCmEgz26hgw4p+x5Q?=
 =?us-ascii?Q?WmXcjXEfUZuv3et0Xpk3KCKZHp/cv43wRSu7kfzh/OYB6nHehL08svl7kIYz?=
 =?us-ascii?Q?uxsoVp9tDFbUKUai10VmCYRxC0o6y1FMd7DRk+OrlPOnwsddb1Uei8MrEpwd?=
 =?us-ascii?Q?Ky0OCp6rzxIxx8nPGWxEL6fcL7lRCLP6/YFPuA0pdnkIs5SNQcUyZW0yyy8a?=
 =?us-ascii?Q?q+AtnM0pu6XETktcu92rVuHff55Abkp1nHyAS7+LP0L7CtXtIf6pVjIOYBW/?=
 =?us-ascii?Q?+QrCLUzGOeFPUAxINIZ9L22ZYWg1IbErqt6iRnKZ/qFN4HBW27+2Da0/fpc+?=
 =?us-ascii?Q?OsAk516mtsp4gb8LzNSR5RDjpAmxGZ/tpBQyAzky2xXAeMo7CWhAruu+DBpx?=
 =?us-ascii?Q?iFXpLLrF5S99nC6G4HJcwgrsaOR4tzjF4GNQgTJXSIxk8ThmlKcadhzZtFaE?=
 =?us-ascii?Q?I4vhngAZJAZoVXuJjaqj9epzP0VMS8ZGvddbINbaEF0WtmxnX3MMdFHNlbeV?=
 =?us-ascii?Q?BDtin7+F+6ljGpamGKgAy9q/Pupge+pQVKRbxisgoAjN3KPYOSraKPTMekue?=
 =?us-ascii?Q?++FHlLKwpyozG9jDptw++noO6t91vgXep604QRoMIZtHsEUB7rZ2BK1oC+R4?=
 =?us-ascii?Q?UH4OxrYY0E3KYHunt0bowEx4d6HTyfoaIB9AI8f8KwPUhQmhoMkQJNF/HrUb?=
 =?us-ascii?Q?Yx6yMZDjNBbL2o+Q/VjqkKfH29udorXi/h5Lj6I7tCg6llgOgNTjfsdVUiZQ?=
 =?us-ascii?Q?lM2jSAg9TdIZkg2pBkOXXhzM7pPCtxnskdwLex1ahbV7ZxrdyobSf5okzPeX?=
 =?us-ascii?Q?cbHUPvSWdkcXCV/+Tu4DdIaEW/NZ8Ycsh3T43PIcA3iVCGsJs/PZ4C0ln1UR?=
 =?us-ascii?Q?7HDN48ZyIbriCwKyu1aUSTDb3BbwaGC2BoqxT39HNaPqiNoYKsO6DuCtbBiz?=
 =?us-ascii?Q?WJ5Y7PvHr23rmKpgRkj3B2EUoVajjvh0u/xDM+GdXDinEh8SDKtf5p6amBqp?=
 =?us-ascii?Q?P6CAKnHqe4N1ipjCvPWbvv8tRzJhHaiz7EZM7d1e8gx5JGP/SUfAgBImBmhu?=
 =?us-ascii?Q?4ZB+ls36R30w+V21Ybb7PEH8jzaB7ecpy1h2GGNYWpldoSx375lLvUlSmzfH?=
 =?us-ascii?Q?zIwxiDFjYe4s6zJ46L8sxdarXRltSK955D4XkQFAwmb9/OUn0wB/MuESPK7F?=
 =?us-ascii?Q?+x+BTksjfKFV0D6pdiQ5CLfYbM6scr7220IyHLb+MuCwy/UDvO1f5DpNvO8t?=
 =?us-ascii?Q?62m0HldHFUKZaXMeQTbXSkSKoMmwn05lwxX/+sC2RNKpZRooTORUdUEOeUXw?=
 =?us-ascii?Q?ldBg8YZv5vg+U3mo+H0tmaxPRZpJpmC58MBCbYZf4SRGH4gI/EyfKA1+8GHA?=
 =?us-ascii?Q?D7Fv0SIFwH5evzTYuXwCFAjsczVAviObKsbmO7mcJoF3467gphVbftrjuorr?=
 =?us-ascii?Q?dumOiMYxAcxrSnfPmGAv2sSddSz1mXVCgICdDiODGw6VqK8J/FlvOyuXjyRU?=
 =?us-ascii?Q?Z/DumXbqupBNnpD9M50=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25369a69-43a7-4287-cb25-08de395f4920
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 09:17:34.4396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H1uOITnHzHuZJ6k9NnxzB8O6LS56suyFoTPYa5w7pjdbuJSpTlsHtZUrA/ucqk9pKLPoKLboVFkJjeFsjHqY3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9011
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

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>=20

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B S
> Sent: Wednesday, December 10, 2025 8:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Stylon Wang <stylon.wang@amd.co=
m>
> Subject: [PATCH i-g-t 4/4] tests/amdgpu/amd_assr: Use lib function to pai=
nt fb
>=20
> Use the lib function igt_paint_test_pattern_fb to paint the fb instead of=
 doing it
> locally in the test binary.
>=20
> Cc: Stylon Wang <stylon.wang@amd.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/amdgpu/amd_assr.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c index
> 8a42baa0b..95c1e3061 100644
> --- a/tests/amdgpu/amd_assr.c
> +++ b/tests/amdgpu/amd_assr.c
> @@ -163,7 +163,6 @@ static void present_visual_pattern(data_t *data,
> igt_output_t *output)
>  	igt_pipe_t *pipe;
>  	drmModeModeInfo *mode;
>  	igt_fb_t fb;
> -	cairo_t *cr;
>=20
>  	mode =3D igt_output_get_mode(output);
>  	igt_assert(mode);
> @@ -175,10 +174,8 @@ static void present_visual_pattern(data_t *data,
> igt_output_t *output)
>=20
>  	igt_create_fb(data->fd, mode->hdisplay, mode->vdisplay,
>  			DRM_FORMAT_XRGB8888, 0, &fb);
> -	cr =3D igt_get_cairo_ctx(fb.fd, &fb);
> -	igt_paint_test_pattern(cr, fb.width, fb.height);
>=20
> -	igt_put_cairo_ctx(cr);
> +	igt_paint_test_pattern_fb(data->fd, &fb);
>=20
>  	igt_plane_set_fb(primary, &fb);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> --
> 2.43.0

