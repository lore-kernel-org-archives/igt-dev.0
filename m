Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05C1C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 16:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF04510E6C0;
	Tue, 25 Jun 2024 16:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEBJsWC4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA0C10E6C0
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 16:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719333440; x=1750869440;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dt5Avvnf3k6KrUDS7QpGe+7i9TruDsG/wLenCkTww8U=;
 b=VEBJsWC4r/CNWBDFQPlCuPt2V6ZCQopCn++fqDvPZeGuPHPNtn/bwt9N
 SXVpX3WPlVaBJG2TFfkQZr71o7u1I+8frIUngfvlxj95UW64E5EQgxffu
 L7hrqfeHroRwStq6Os0550Apm+t1oUuu39DtKqifwPLO2FRkB0wnNCVDA
 wUG3B8d8JTdeB1MFBJA+u/Yr9ZR2xof36uKv15Tmpw0dVJicfHdJbCPXO
 auyuJex/JpuUqFnXSterNTbWz50TdMjWDt++FgPXInAgxDT/w5xGiJd3M
 x9Skeu4jFkEA67Z9AR+Jb1FllbDOKlcxOBXLfx1ulF3IGOdlrnFcgxWKL Q==;
X-CSE-ConnectionGUID: lbBnW/osS3OhnnEEwIWrHw==
X-CSE-MsgGUID: AxSHoXbeRWqbjjY1rGkpKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27506019"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="27506019"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 09:37:07 -0700
X-CSE-ConnectionGUID: 8RRhu2ZzSwm710gSq5ZrMg==
X-CSE-MsgGUID: 6qvgAzwZQkOROBxAGvk6bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48282816"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 09:37:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 09:36:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 09:36:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 09:36:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 09:36:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bS7VTM08N6muIZivwP0JWBEq7UYzYOsEr9P4g7kblNVsXkQfBm0ra6MdPifWbgAM3M0CFWJ/gX/hPVEH10Rj3obfjNYN//rIa18WXix5Z/k0iDzO5IqV+zvMXg0lTmz+g16KSo+YkRwiXqSjPiwidGsOu93CTmqfgcS2Y2QAPRoXZVWFlATgxzpgvaW9yrrBCG1+9QLo05h9xCvWmthbKHDXxA0FiGyTAojr0WlUfZnyR3+SBKfFJO9sB+7XMjElAG5bezLtQry6vXixKfZ5vtag6De1rv5vROeyetdeWP+2/A10pl8hR/tappvZM/gNVC1HQegqMAyu2AKXMa6SkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjKbDp2Nzq+oBFJSraQwTFrAusm339jg0o9hf6YYvIU=;
 b=gBChTFxlORrsDN+i6YsnX0Rn3ak3kKboGyZHMNYDAIdHj9tVMjCSKukwaqVZI+MNT9u722CvOkZhmBpJ1ry/wwFmJwg8bQACg+AkX600EQ06wE8gks4wA5XFIePDHi03zSvKGnvKAcBlYJEzerKEKLI+dZHriUO5eiaQMrFGZd0Gbqe8Jus5uhHelNTbCnK8oYefQMPnqH4CYoyAvsRjMs5wRVsdm2aX1Hn2r8ruNOBCoNVUIJAoRY/9oaRc7pWykHaeiulFuVLdwLwkc+BKBqZ/0FUvPW7/ytW5HclWbJxceb5P2O5Hksx4GHUiScln6ynbmq9s4BPcOVg7dKQCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ0PR11MB7703.namprd11.prod.outlook.com (2603:10b6:a03:4e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Tue, 25 Jun
 2024 16:36:50 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 16:36:50 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t V2] lib/igt_kms: Format cleanup in DRM mode printing
Thread-Topic: [i-g-t V2] lib/igt_kms: Format cleanup in DRM mode printing
Thread-Index: AQHaxrUqAixvgs6jrkOCYvGFwE5RI7HYrfCw
Date: Tue, 25 Jun 2024 16:36:50 +0000
Message-ID: <DM4PR11MB6312A6BED046835E211C828690D52@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240625035856.230338-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240625035856.230338-1-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ0PR11MB7703:EE_
x-ms-office365-filtering-correlation-id: 6fbc7f4e-c118-4573-a2f8-08dc9535034c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230038|1800799022|366014|376012|38070700016;
x-microsoft-antispam-message-info: =?us-ascii?Q?KLf67qea8wQo8LRPCk99SvG78hs6jEJWseygB1YdcSc32N7+eyWZLqF5Tg2v?=
 =?us-ascii?Q?NUXcNsGioci6UImVpSpHwE3cWEYiidP2sOYb9ps6LyGrVy385lTO4DxfCxR/?=
 =?us-ascii?Q?qOvYMi4O0pIypPYRBFS6gBwOFCkmFxSrbXJFdjxESbXuzwBn/guhKBG1cwjA?=
 =?us-ascii?Q?LI4oWz5LRuhvcmF+q/4NEw6t5hbDGviPPEmCDXhOMs7B8EbKUsDQ6YvmHGNm?=
 =?us-ascii?Q?5Ioq7A6+mI/O9VbiV4NCtMDmp2lH5a1+bcbqDVdH62Eg4B9f38Zeq0I8RhCn?=
 =?us-ascii?Q?hWChumWrgsKFPHp0GUUV8UD97M9QtUJgMQXTPMVhkvx2gK0B8dMEu6XfR5Rc?=
 =?us-ascii?Q?OFRrHaiw+EL4+icFJCpp4xdRho38SzB3ZSXcuuMUWSv2KUnyl8Eu14pNHQWg?=
 =?us-ascii?Q?dCspSdU9FLQ2SGCeKoKFOofK6IbrfkAFnvq6cxXqOx/li7MLil3YvxrVOrKW?=
 =?us-ascii?Q?6mICMA4+fHJ65hOBl5mj5/7oC5XLPXZkCQKrFIwK/Otr0EMBI7j2Wk+ScP81?=
 =?us-ascii?Q?91/Xg8h6L5DvpAKSXo5YaEEMN15CoPemR12cf8q5aJscR+E2M89ZtV32PL5M?=
 =?us-ascii?Q?c8fQDKc5mjYmKaQ3IXvlAEa1MHsMEscOlAAtK3c9Aj+37a+Atl8qXObCcZ3X?=
 =?us-ascii?Q?MImejC4NkSiLAM15T0I+Qb5bNUroeY6pIwqOIjiMKmPKsWri6CZiM58ani0h?=
 =?us-ascii?Q?nXqey+No7vGgwyVOp2BJmsvbAGntivf76yXxGu9m07P7wEJCB0R1Gp34uN0B?=
 =?us-ascii?Q?QtqFaQumX0chaD2DsVB43ZdIcPcNYKFWhtgHG02KmFpyOCrrYF3xSs+kIYln?=
 =?us-ascii?Q?ztHIB3bQA/6i0bjTy7vbhQcpxMAEAxcVj6s70qxndv55mNc3HQA69f5PmX6i?=
 =?us-ascii?Q?OYzFvlJWVpC9q9cmvgTpKuVFsupf7Uy+LblMcLyXLiopT2mBPtsIAkiUwGSa?=
 =?us-ascii?Q?D/8k8B2XdjJkCF2emz/aLIgF2sOBYulNOd8Lajax9bhtwgXLMoOZT3sjImAy?=
 =?us-ascii?Q?utDX90GQ2Sh/97a4RjGCMcNKfy3escyUyIAIqAiReLicjE+rMiSPKgC2VBQ8?=
 =?us-ascii?Q?nM0QJNAkoJyH9yAhsMFSXa6M0KWReLhbfGZqFMuM5DGJJunIrb5cQnxGigb3?=
 =?us-ascii?Q?AdYC8JfYNNLXhY3udZFKbqJghA91nawsXwd4mlfGnqf8LCbM9GQpu2+33v5b?=
 =?us-ascii?Q?pW0SifYekmYTl7vD8DaaIF2gWFajpgz8Vc+GAm2qyqizwuPdrNs93D+lRwFJ?=
 =?us-ascii?Q?Yvi0ie3pMfYO/n+v9KZ16BlDNvAtQ93VMs12V08fSUW0lGSWW6CvylbXzxeR?=
 =?us-ascii?Q?o3/Amk8Y+ilpsV9wZ2YShCiFFzs2HU/FF+t/M5FZVBGkR7gK19kS5XRY7iPx?=
 =?us-ascii?Q?YLNIGBk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012)(38070700016); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TY0tyAFcbVZNpnF3y80Fo/TkT50//bKJ0ysQt0tZKZLviN6QuEeKqZVhj+ty?=
 =?us-ascii?Q?2Qr3fG/hHqSbpyLuFvXBRdVI84WjDQ73SdpFUbgsK0YLzShqu5qJPWU60H0g?=
 =?us-ascii?Q?Dg+TjBeQ2aOzT/EVha8B6hOquAlWL81r+KKyq32jxWGOFPrfZu6LmozFrDYt?=
 =?us-ascii?Q?jJl9vvDp1j80m8jJqymHQRbqwBeIuNLaRIqldRmTvy418wNpb22laOpdNO8A?=
 =?us-ascii?Q?E3eFQkE5oT4LRBKwbTy9l5XB/RBJCZcG9do8I9BI8QXw9yBcYNWZL0hTq8Lg?=
 =?us-ascii?Q?RUWr6TU4mXmjG6wrTDgPXmgsIsDnvGiceoyg9l447jjmgBWnDK3/o1kJCeK4?=
 =?us-ascii?Q?mc2O679cj0dma3/uimL3yEDcFmkycBSQBSHJM7WAeyUgWtsR/kbsatu6AXBx?=
 =?us-ascii?Q?9AZxhQSh6Ri3Ukk1Gz6R0umjdjl8WMPiOtnSqJkPCWd+GPGeAbkN2sOt8v78?=
 =?us-ascii?Q?O+WEgdXw0eXoBlxNHl5DCyJvTeGeNXLYlEoVYD2pFeJtmZHOBwF1zpXLLwLD?=
 =?us-ascii?Q?k3LdBr1UmlIfPPK734VAyjq7llpEtKv96JxF+fOmVS5hOzB3PI8jGcwdYOeG?=
 =?us-ascii?Q?AMZgoqCbpGeqojP/os6GLiJTE9hRZe+1Lo+Z5Mt3o+MZsUtfE/a0Xn9nLe+L?=
 =?us-ascii?Q?om68aelpWukCNFAXku8M5dXJg/iG4yLSOgW7D8/TVTE4x9VwC0siarn0iPgS?=
 =?us-ascii?Q?bFN/BQxTFDvzwbJIA02jjpkNlm/FtCMxvoLxH8FSNLLb6SOm3Rph0r2xEgqD?=
 =?us-ascii?Q?DWswkksEyXEZtT5zGZtynxA50MAwceiJOm1rOr8xuk+KHGP3gL7lkprqPsx+?=
 =?us-ascii?Q?GDaw2+LTjQgCXXYtwcJUx5jQnDm6FPJq7IoNE1oMD0x/JWlFcRepqKb4zc4C?=
 =?us-ascii?Q?xCIcSH4EMxEx32ZWPL1NfZZ1BflaSCy2hpHoAdvZi+Q/ACIJWnWpnYLlE4Ri?=
 =?us-ascii?Q?Np2VloX0jm6VFAW3VrAYZDU0hCn/1KySLmym2z1NxV3luqUCS6aqQECmhjd7?=
 =?us-ascii?Q?IiLjgIwH+VRwW6/6o5u/6r/LacZWH0YnfpFYdJ+AdGACpFQIBeVRKMt0ymK5?=
 =?us-ascii?Q?rDRUgchoiHAnH1kETWXGmS0M5H1pbQ3l1GMyhoMTP/f0vTbnF+68MO+udnbq?=
 =?us-ascii?Q?XB/9FbpqDOtuxRwHJgrhwqRLv6Z5nLIa7TDVKRN/m9X2n9kVKPJgkiOeRDVG?=
 =?us-ascii?Q?qT1+38AWMLBfF2NHfb3O++0a6QQJ1nLMZfQNgBCSS1ISoEOmNOP07QL4duGV?=
 =?us-ascii?Q?JV6XH69fGR0gFkK2bMwYGPVqUIi5mAxEMQUwtvp6jvlZJ3/PiLwZ5+QeEX+O?=
 =?us-ascii?Q?cP8ZATVPL91u5tWZo2+kZ/8XyNAqXek2Sq2we40rMNy32AbLLQtTaleTwcjJ?=
 =?us-ascii?Q?OFiMVl+EMXQuFm5454CQ2cUQ6hDc/OevSq181U4HzNzep7f+9Qf2A6oDiJkK?=
 =?us-ascii?Q?DNs7+H4jvvb1g4iPMSsXa8pYJN7cneuhiGMZonGpU1Oa+jZ2IPnn61NmXBii?=
 =?us-ascii?Q?6jxZyAy/KNDRsKvQhgZ4YW3o8irMVMH4wUx6jaRbZFdKS4fjZXRmS07LKAuA?=
 =?us-ascii?Q?Tm5hQDSrd6NhV93F8GM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbc7f4e-c118-4573-a2f8-08dc9535034c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 16:36:50.0467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +I6trMoamLrLFu+Cxmcoz9J3yfNEaKEHK0obQq3Uz6Z/vogt932ai2Tb4y0HFWw15O2g+gITo9VbV9Ag9JpOAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7703
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

LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Tuesday, June 25, 2024 9:29 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [i-g-t V2] lib/igt_kms: Format cleanup in DRM mode printing
>=20
> While printing the DRM mode, align the style with the Kernel logs, so tha=
t it
> would be easy to compare & debug.
>=20
> Example:
>  Old:- 2880x1800 60 2880 2928 2960 3040 1800 1803 1809 1906 0xa 0x48
> 347710
>  New:- 2880x1800: 60 347710 2880 2928 2960 3040 1800 1803 1809 1906
> 0x48 0xa
>=20
> V2:
> - Minor cleanup (Jeevan)
>=20
> Cc: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 2e6f44e3c..174bbe6c4 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1144,13 +1144,13 @@ void kmstest_dump_mode(drmModeModeInfo
> *mode)
>  	const char *stereo =3D mode_stereo_name(mode);
>  	const char *aspect =3D mode_picture_aspect_name(mode);
>=20
> -	igt_info("  %s %d %d %d %d %d %d %d %d %d 0x%x 0x%x
> %d%s%s%s%s%s%s\n",
> -		 mode->name, mode->vrefresh,
> +	igt_info("  %s: %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x
> %s%s%s%s%s%s\n",
> +		 mode->name, mode->vrefresh, mode->clock,
>  		 mode->hdisplay, mode->hsync_start,
>  		 mode->hsync_end, mode->htotal,
>  		 mode->vdisplay, mode->vsync_start,
>  		 mode->vsync_end, mode->vtotal,
> -		 mode->flags, mode->type, mode->clock,
> +		 mode->type, mode->flags,
>  		 stereo ? " (3D:" : "",
>  		 stereo ? stereo : "", stereo ? ")" : "",
>  		 aspect ? " (PAR:" : "",
> --
> 2.43.2

