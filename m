Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC056D2069A
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 04:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6244810E087;
	Wed, 16 Oct 2024 04:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtBZm43r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C799110E087
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 04:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729053047; x=1760589047;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S/irY15wMqqmHyuSQD2M6ghkwRY1h+eJq6EERnamOww=;
 b=gtBZm43rKb+I27ryXhylXW5eEk5CkYMaDbEcIGvYFGnFOw9YqH2HsVUM
 6hACBDpjVTas5bGRUSSNdSNDp37ElqBT/yNCMgEN4VOjGRPRG+O7qoEG6
 AgdRnrbllAM11AvvHdYZLN+FDGc3AHdJJLBK149lKRFOVJexVyLmrTLEW
 PUJZTxd08qucMJPXhut9TxAtm3sFEt88SY1AFyGVsVzraHCp5y3X1y4kJ
 kex5hWKPpWg0V2FNbw57SUyUh2rITdx9msdV+MxEUDSH3+XFHxTsNbB1e
 Duqbq/Z+gMhcjfwNS6wV51GxbSF8tRjqrYgYavOfrRgk43JSjyT26LLfp w==;
X-CSE-ConnectionGUID: HOdwNkWvRC28z8jwMBaqmg==
X-CSE-MsgGUID: SM8hfivkTeSWA6TDvnl0hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27921649"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="27921649"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 21:30:47 -0700
X-CSE-ConnectionGUID: MM8IZnpQRyu/vymrsEzqeA==
X-CSE-MsgGUID: AOYASvNPSG2oL4VKpTlS6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="82664866"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 21:30:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 21:30:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 21:30:46 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 21:30:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISxCBPSEcvVMMMzv+dRAU3HygBzPSHRkQ6JIA5vCDAjMeM51BN0XZHrII7nmx3z9GYQzTnZo2b5oD466hEDKSvjZYFql5haJMHE0h6uJyymJIGkaigrqrHuUg/Xla9vVTzLglITmybdhIKE2Pj6t9heoS9ARFQHxB8o/ONxv4eMA3QGHgjvS8zye4h4hHz584AKOmedd0WRm09gPJC3pYlxhlHTqbI7T/M6aIfa0pcP/WveF6Wo5g90jkTbJ5CqzasCicH1sS0aa25rMsYFqJfyZRdMm8hU8e6HiWqqfQlgCoHkC59Ygdjy0T2YA97MnZVHg3YJf7/C0iZDARug7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16gEbS2utLEm8xnhasjhLiWgT6wTeqqo4jQ1S8eI0x4=;
 b=YRHVC12MrtSy+ES0AM0HVj+JgSPcrYg4bTK31iHfPwdRMyxd3DpExbm68zpv94g2K00E6yw0AMfDuUqdtXXfX6dWHGyqxSleyyBi99Hd6nbh45bYDG7r+EFLfUU+0k3PK6Au0j6Nc+OzsIQufvdsKr6JXgdatZEWDMhR+fzHxkxhV/cvosEvXr8XFRn9SM3xBB8C8bLXvcKf3sQzosTfe+WikD9BOgLK0D6aWMAMcJPWbe12EEQ2j2RT6JE1snIT3ZO4+nibT3luajNM6L5d71bQ1d8TifkFmMyzmrMK5LBhD0kxaaEl91sx8ql/kALBGAfcPNNmQqj8/u+8dfczmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH0PR11MB4807.namprd11.prod.outlook.com (2603:10b6:510:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 04:30:44 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 04:30:44 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t v1 0/2] Move backlight read, write to lib
Thread-Topic: [PATCH i-g-t v1 0/2] Move backlight read, write to lib
Thread-Index: AQHbHx7pAJOPLSTcWk2ojbJbSz5KeLKIyeZw
Date: Wed, 16 Oct 2024 04:30:44 +0000
Message-ID: <SN7PR11MB67506F9366E07C03B8CCA9E2E3462@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241015162336.304730-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241015162336.304730-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH0PR11MB4807:EE_
x-ms-office365-filtering-correlation-id: 9d0707e2-369c-47be-8a93-08dced9b4ca6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rOvhZxo8JSioM3upFpnhMhT9cKznEU/FACLNmdVpeWuohrF7bTrgcKf+rVHf?=
 =?us-ascii?Q?FokHFMuUN5up6u7TArFkPWyTsDFQZJ9dkmJsElaLAEXmzezzG3V28Uq4scke?=
 =?us-ascii?Q?bavc6HAuk5B5+a0L4xSUU5GBXLY6rCe2VG4iwQ6iHELiuk+yEUTL/iwACPXR?=
 =?us-ascii?Q?s98dmKyytUSg+KK4onrZlMkPEUVf3+pHWruM46lcinzJkHX5v2qA8tOfY5hA?=
 =?us-ascii?Q?Fqz1Zb+9Ry9xFL5TXUjED/O5xoEvjM7lIFqZf4d443Y/1AJx16I1aVbmVafK?=
 =?us-ascii?Q?YZQxHd87z3Gha+byOa6tV4wY0ZqBMPzVJMYdKhJdNdgp8WKk6tHKzK31h/KD?=
 =?us-ascii?Q?U2uByRSnIuwVBvHqvBV5jyMotSo8qknI4X42gRdQF3oTUHPnnfrGBqNW5lXp?=
 =?us-ascii?Q?GkkMfQ9PYzDMfd6AJB/DibZ/YJF6u54YI+uWihBLTsBHcG2Ip1G/JVXUYIz7?=
 =?us-ascii?Q?O26GgT4gCi7/vG1YOs5WQ6ATb/0Kicjj/cLSsJYzfdYdmOnBmsJFWdtD97VV?=
 =?us-ascii?Q?s+jvhfWaHB51y+yA6A639dS1tDRdf+B8jmLeGDFxWGyhg8Uzxy1nre6g2Rj3?=
 =?us-ascii?Q?AbxMCICCKtejkPtF/JghgLeNehJWX+fKiozBsSMwGzaj/9iyJ3n7dJ2pSpi9?=
 =?us-ascii?Q?uEj3sTiVE5W7Zk59F11l8/tolp4LSxzWEC3P/WckzcGes8bFJJv8MQ00wWMw?=
 =?us-ascii?Q?29gXDCMSPkV7aQN7bf2httup46878JK9frhBTnhaO0CXY9GUKWKfD+VQ6lsQ?=
 =?us-ascii?Q?Uciht+mEdjeByHzru/K2WcY4qughz0PhiCaE4kVOZdyXHobladgo5+93eq7N?=
 =?us-ascii?Q?uV2g4dTAcTpX+vveMrqmqRhk2kmRJZphIidjU2bhdBXjpNUBvAQ3LeWfN7ku?=
 =?us-ascii?Q?eUbgwA2BmDvGTAu2lkMFqVF4Hkr0fz5ETiqmHDDb81cHbfeZU2cfqkro0CUn?=
 =?us-ascii?Q?CEKJiLnPVd0CxN4EYW0mnml3YL+7605G6Ch9kY2L1l4pqWaWt+/c+2C3Q1ef?=
 =?us-ascii?Q?Savx6ptMTT/tc6Qj/yYKKoplyDh+CnxmUkI2t6/8sWdIq7Eq00H7XA2hw1R7?=
 =?us-ascii?Q?aWK9hjHp7rLqiev8G1Aw4Maq/8Fa9quuvnf56e5njbWv+mKet8D7X74MEDz8?=
 =?us-ascii?Q?B/Pp+FO1B99hqhQGrAHZf9m0fdIw8+lOfWhImW2DCKv8onq82/NbpG0Mfc0X?=
 =?us-ascii?Q?rqwMGtW8HssYWgGdRDG7pzv4rhkpQKk9ValZbUP9A9XrbrVweZiR64C3oaAU?=
 =?us-ascii?Q?/V0Gyv3hBbzyXkk2cTNubEGS9qprXVOt22wKKkuwM0wmMjPEYHmXeHXZWQwe?=
 =?us-ascii?Q?PW/dOl4DWIJd3JUxrDzcBkKYIktv4WvHTsNSuiZhBazZ2w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?53DSaQcSSAlL4o2Hnd/a8EMawClc8KI+8MQO6BQkWMp0Sa4tpZa1TORbFFiR?=
 =?us-ascii?Q?keSXaqX/6ol3IWFRHG/N1eZkLVWqVbXuBiFD5bbt7rAdu113CeCo9GrYixm8?=
 =?us-ascii?Q?Qb+SV0ycTshLt2mq+Kq+uV16+fbodsn2K11HOHO2za/UTJfebt0AgIRS6SJz?=
 =?us-ascii?Q?hvSX4+bUk4pLo+3BouAEmmhhrI6+BG5E2HzniM3SzWei055mWrmpow9A87m3?=
 =?us-ascii?Q?IZhGv7cP8oj4MCRqZ2RcNDsmy6vIjDXU7Kj4BTtIUBJpYLIUd+n9llY1NvaM?=
 =?us-ascii?Q?6ZYdxk1uf5ZuBAQP3XMA1iLa2hE21rqEnG2FiyevN7we2ULGD5kb5p4n+euM?=
 =?us-ascii?Q?S0zpKk0giFm+e7/5+8YR4LqzapthqUJntNeojxoBsIslgAtCLHKdEfY70kz8?=
 =?us-ascii?Q?+h07NAWVME6RE4xGVvNseXZJ8l4dNvq++Xwt66QqHj0ThddiZIi79cjyxiaO?=
 =?us-ascii?Q?lqHnjVESALcuL27XRe8IZQ421TjZpPzj7nduX1T3SyAYGEauODJWfqUhQyKy?=
 =?us-ascii?Q?G/Fx7z/3iSkOHmIOmnEV86J0iDG7Q1oTPJjocs/N72IKat1Hk6rtlnkBd/Mv?=
 =?us-ascii?Q?ap1r+ar1wZRVzbnM4Ng7xWHHROcMo8hSyzMbUpOxq0Y5wKNfvvRsFFzYD6k0?=
 =?us-ascii?Q?sGeRvVvhH4DlG1tOmTp/zfXTficCY/Nj6opTh3XAVOcAMzSWd0c6DbUAYcGQ?=
 =?us-ascii?Q?ZG34YqmZV0FMDD5vmHHfEJaiUu9fIXayD/wiO/GQIakMRqMPf7T7WFZE/FoT?=
 =?us-ascii?Q?mCPIZIPtmgduMKWBApFH8vKHzuG52SUR06IVniarxRruSHkDlKEznI8fF6xm?=
 =?us-ascii?Q?F6qZxKIvRuV57Zlv0ISkNJyMxfg8cPM7ghbYc5LuKWFTMWZRHXpGaR3HeP2k?=
 =?us-ascii?Q?1GHeD2Lm1NwPs4OnlJ4Jauxc4AfVcvfZonRAy5fStypiCkKXSXDI1HdbI8Dv?=
 =?us-ascii?Q?PY2AMkzBUDsXAB/wR/CEEV3VdgUA2CHL3t0O9v+xKWX47Zb+KCNJCL8Jr5WL?=
 =?us-ascii?Q?GkTaNYZ3cO9yV3KW4iYzSpBKoqkMNZMd2lOSMjUFKcSfPJzaBN99BpnKBhRx?=
 =?us-ascii?Q?Wu18p6tLlFTTfHoxUX8PthJezUjQD7Cx2ysm6fiqwSlkLDhT0qMPaCJoHyuG?=
 =?us-ascii?Q?6x+oDYVMYCTshu2wi/4cGxXuZ00Pt7v5HOhCTYwkKisn2E0NUbvGRbL54zL7?=
 =?us-ascii?Q?di2BPyy7KiWL26Z45bP4A+CwXeUFdR0fKLyjasTTI4vCPJpsdLp1GCP2chDx?=
 =?us-ascii?Q?Tc6sLJlSTQVp9DH5Ad0FCrQU32nJ0XquXHNpg19PCVaVHq0mV7clcVeRFcnc?=
 =?us-ascii?Q?1q+kQHO/uqCLZ7I0RkVxvpUT/DfWDbs86OqCT1PCXYrsM//N0/aaYz8BE7f1?=
 =?us-ascii?Q?mMx861FsRKhmeCu5tYnxX6TqRUPZOscboEcXeOXT7qII7xFYsFaSfE2N6Jha?=
 =?us-ascii?Q?/PxoUJKEpUMSME2bPAX6JNJizZdwUKvwO3lFRnKUNh5yjknF/uXqZALCA4M7?=
 =?us-ascii?Q?/CvSHlRCQAQUPbHBPhi1G6INg/siuTu7ZVBInz+X6WSRmpDHt6bs1+oFOCE0?=
 =?us-ascii?Q?Lp8xD8OpCd7V5MlYZExZjLkU7He8CVS+LV7e4IXt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0707e2-369c-47be-8a93-08dced9b4ca6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 04:30:44.1259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vPZMfYI5kqds47Q8VpJSOyxptAXuG6NEK194XGv7SwY0BmyTSrLVPxMgTP3Csf2c7cktWM8+TmimpdSbeeueXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4807
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Tuesday, October 15, 2024 9:54 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; Modem,
> Bhanuprakash <bhanuprakash.modem@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1 0/2] Move backlight read, write to lib
>=20
> Move backlight read , write functions to library to re use across other t=
ests.

This is not the only thing being done in the series pleas add more here

Regards,
Suraj Kandpal
>=20
> Santhosh Reddy Guddati (2):
>   lib/igt_kms: Move backlight read, write to lib
>   tests/intel/kms_pm_backlight: Refactor and use functions from lib
>=20
>  lib/igt_kms.c                  | 60 ++++++++++++++++++++++++++
>  lib/igt_kms.h                  | 13 ++++++
>  tests/intel/kms_pm_backlight.c | 77 +++++-----------------------------
>  3 files changed, 84 insertions(+), 66 deletions(-)
>=20
> --
> 2.34.1

