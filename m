Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91CECD4F5B
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 14:26:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9928510E298;
	Tue, 19 May 2026 14:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8tw2g/v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B5B10E298
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779200759; x=1810736759;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=ZmejRSnH52v758C2xXOEvPhIC7eKPfetKqwNv3Y3SP8=;
 b=i8tw2g/vpVxVXao970f+oPz2G0tHYQwj5OdSYI33l2ChsVA7u5MYduKW
 QN0bxnXnrzfK9fmOwyv6RTSxOqqJqIheijrE1+yfDhjTePQ7bT7bGT0wP
 E5m61iHcaGpWMQU7UUSbU71+8u+u5wCmlWypWR8LYZ2kntYzo6efx5frX
 ttTXKQq2/RAlq+KVfcGj5/JuibTSQIP7dJLPUkWTCXmFwEWi2wbTNHmT8
 CTcNRdg6e0H64qNB1fvOz2BosVQ4ymzrozDDZdKsdeNCjm72ca+kTls8z
 t8InUW5iOl0Q/d+m73b6jO3hNA7yXfMnbUYT9N7n5uMK0h8MF9dDtJdwy w==;
X-CSE-ConnectionGUID: vDr7GqD1T5WewdCVrRmhzQ==
X-CSE-MsgGUID: vpu3pQ6IR1+OQO7XPPQaSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79931004"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208,217";a="79931004"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 07:25:59 -0700
X-CSE-ConnectionGUID: MX+NLiNYQ3OQRCGqfAos+g==
X-CSE-MsgGUID: 7FRhs5wSQum1F5eYAwJGwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
 d="scan'208,217";a="241617491"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 07:25:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 07:25:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 07:25:58 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 07:25:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ra7jyLqIJf6yHPYM2Wbs/oJr8cHc/Ar63Mn/HW9NO49knsMzt2ZTS+lWrPHG6imOePO9LBE9S4vKs3MVzXXyjY7D+DFZoKTtIZ+OniQJK5bo+S6fUPAPatZl2c8x8/UXRftZ59KEqaA5VDsfnNOPR+52ZuK8JsJYIgJj5Za5/Fa/t2uUmPphFnOhE65w7n/Gj5b7eKa/eE7WBfMuqiaihIHiMK7oZ/YagFrUTPKAZylBT63JDU6JEKCkLo06miu60sGXLqYSOjoz1rKH3ZQVkzMg8vWVYgRkYAHVgqFK3h04ScPsNH5R0OPaLoVjbAYSSm8yPFyvfinkSrAmSZkEiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttZr3jRNTinatNhu4royyLShrAYL4aknr830y6BCTjE=;
 b=REYgm8VQhiynP9KSXCFaxLB975XnB3BPzrOqAKbO6/VdsMM1ifBiZtJu4QNzJvNzHWPoypT1CnDRy+P0iNi0dJ2Jy5CKSSoe7AnCl49m/9cQlFsoowT6mlQ3fM2jEaLUqgdNa1sORheuo0reJyUezlAGCv5/yrB8NY9ueOQrS2OCuXP7zmNWnYYGm52NX1At/7XPQg9PczaUOViYrxzKc6EmFwj7xbAx8giJzz7WLWzKMOLdhu9X79dB9VklgR2TBjpaGnqVgA8WGJwWoVQyxAr6L09PMul/xjp5KENmNmaV/O80CU3mN5RszJvnqqFDUWnTe3669Vzq1qKCXTByuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CY8PR11MB7778.namprd11.prod.outlook.com (2603:10b6:930:76::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 14:25:52 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 14:25:52 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 4/4] tests/kms_color: Add background-color subtest
 to test the BACKGROUND_COLOR property
Thread-Topic: [PATCH i-g-t 4/4] tests/kms_color: Add background-color subtest
 to test the BACKGROUND_COLOR property
Thread-Index: AQHc3MfJVmb1m23EJ024dJT8P7/bobYVWXuw
Date: Tue, 19 May 2026 14:25:52 +0000
Message-ID: <PH7PR11MB6053708C6EB6F603AAF14A89E7002@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260505194419.500600-5-dev@lankhorst.se>
 <20260505194419.500600-8-dev@lankhorst.se>
In-Reply-To: <20260505194419.500600-8-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CY8PR11MB7778:EE_
x-ms-office365-filtering-correlation-id: e1469bc9-e489-4daa-012e-08deb5b287ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|3023799003|4143699003|18002099003|22082099003|56012099003|11063799006|38070700021|8096899003;
x-microsoft-antispam-message-info: viHSgyXmS2oXxEQf4wuZrD3UCZOVBAE2kcZM0cnNHkpmc2Fg5fZz4iYiaWvN0zOMGTB+KkF/c9oALBEERhjk8kM2e82qqj/C2C0UduuVpvTcsTDueRnBYBUSgHewhADsGh8CBylS9qGnnXIo4cqhF2PgmhqUOlMDevEP4N7Wt3n2thmoRKiKvRZtWbHJ4NyVPKhgMutKp3osKwC/6KM0Am20RDJxY8M0ijHWCIbH/a9vPjLEhlpVEzmnOE9XvMibb5ZCg3FZYZvG/9egyAlo6RRO5y9OMrC+EoL+gFvF3nwWYr6bsq5G7tcdDv9JroFqK1cGqEj8Baf4XZvKzSF2cvw4O+0bDAtQF7+xvE6zlxj6+wsuDnkMWun4VKG40Z4o/4CmL9aputkSmglB0d4g73O8Ks7U36lu5ZoP70BIvLUo7z+Z32X1aAFguIp+yOn0gz4ywComHJzmHW8HKAddS0bfTUviuoC+glYpQC/e2uq0EUkLZwccru2A6iPMKcdbB1d+G22fRevGRMh71HWmTes8qOMywCt5M2GL8hI240dBs/1C580/lzcDGXWegmvm1yzDH0iABvGqdzH1oFeuQLZLX3UpHh4xlKWpIKaacfGRnntq83wI2uo5aGmIyTnGAQcx8ZYiWiU58+xhvSXiPfqg59f2D/hUpGQNJBduDZabLXse35nIPMUtFLAT9zfc274puse48xfMwd8UfoXF0o1OVn2RMRHz9Lc20EsvU1/LoxTVFGRLk/Bb1j+PwavW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(3023799003)(4143699003)(18002099003)(22082099003)(56012099003)(11063799006)(38070700021)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q5S/NWLorcvIakFPmcB78d86Is4DcixXu6vijuFjc80xDxVELJEWhWEZzPlx?=
 =?us-ascii?Q?wMCF+bgpDLvMFfHbS3yTus1urZ/VaA+5f7mJN+rY77Gio/sykzUgq1iM5EDT?=
 =?us-ascii?Q?os8zkAK/dA9ZfMVU4K4Kg2KTg8pWagFr/IDJ+bkShFUP1xCg+4R1ay7DV4b5?=
 =?us-ascii?Q?NJWYPMWNHvEBwWfAxc8kdwHuy30oLrsBtzu32py3+ksjXUk/M1cUORS1KjQ2?=
 =?us-ascii?Q?BzFtzDAgCtd3EYgceE/sxMpOAdN1PZlkFkKK9HV7ie04CQ4BJw3jW2UYcvKW?=
 =?us-ascii?Q?HlOd0YdtA5x4Qa/YLWenQ9+d4CMvvaPEsBMOxu3aLMXke7iqx0vgFAcAZzI7?=
 =?us-ascii?Q?GFL+yZdbLSNr7tfYpEOHi8E49QiB/uzX5xsiIuOElgU3HQ6d68y0TuU0ox4J?=
 =?us-ascii?Q?7KHhcHqbc0kToCb6G5Q3GpaQBOW7n3eJPrXoyrAZFGkcgI2wnnJHMXwi5GZT?=
 =?us-ascii?Q?jEI6tODi/d3CZo+fTfQmDWcpemkPJPB2nR/b0KDdjw9NA7AjAX0IpezFgnyz?=
 =?us-ascii?Q?xkIVRy24DB04FVIigBrc2GrOpqOEzY6qTJKd7mOOJmjDf3U/ownY3peYZwf4?=
 =?us-ascii?Q?65vdMp9yUyTdfp4CtdPEQ75r2V+9WSOiZ+/M2/kwoaZfnxU1wgOqKRLkQdrY?=
 =?us-ascii?Q?tfYDhgLT1H4D0d3ZzOZHlMzyD3ETFzy/3RwNd1nWbKTiM+NsN3hY1U4eaWfg?=
 =?us-ascii?Q?M6uLBfrthti6GhQPkgrsUiYio82uo1P53qihs/TGk/xiOOVvtk1fFeU6mgvD?=
 =?us-ascii?Q?W+2X5IfCYHnovKSyJiGsl6lvenfEVI3eoH5eqVQSdNDVW3QCW0nvZn2i8zQ2?=
 =?us-ascii?Q?ytzQ9kx4czdzyyOJJkho11JVidK+A2fsEsfgfCSglu12ppPaJX6WGwTmndvl?=
 =?us-ascii?Q?W+/qVE69ZMay6QgWKStUcf0Ma0R2dBl021usmAQLQmTK+dC8euIvjNQm4F/p?=
 =?us-ascii?Q?/vqyhIDXxTLqn1n3iINK6ByUYvHsvQXuRhD7E6DLTMKI3EqSdKAmwaC0cpeL?=
 =?us-ascii?Q?/XB36t6nJt/n9Jz3W17Taml380JHQQSKPQqBDsnnEBmsuzOXFNRhlTOERhyn?=
 =?us-ascii?Q?iw+klVrB8f0iqN2YwCcGHQPrWKXoSbeMn8YlbmUYYhIWOjhiqWK/TZg/PVp0?=
 =?us-ascii?Q?ONszPy+3rQxmEad7Q9DlFkKzCsazL0m5YuejKYRG/ZnA4c+QACNIqQtf2uTZ?=
 =?us-ascii?Q?/vxIsHqTXAPJ0FfSVVqgrPPJR4Ijm7/tg182iY3xKtti2UTgz8Nn9xOy88ai?=
 =?us-ascii?Q?Z5G1HfiFKbSp7LZeAuwbTJtkMMGw36V7YtjyOB7JZQaSURGL2exT3ayBNot4?=
 =?us-ascii?Q?nQNULcUDjVZ8vyLFu7nYs8vovsDo1B+adfatn353ZEqee8km9/dB97XufNKt?=
 =?us-ascii?Q?nYJpVPyozQ1iAyyQT90DzGrUa1XkcoyWVp7e7eAFK2snACLX6TOJS1X97vkY?=
 =?us-ascii?Q?QOiOz8nG/c6YnE8bVExicqeBJIRCMiuzxfwnEJYECg77cf2ii9pQnDFkHtaL?=
 =?us-ascii?Q?9SODcGDLsByO2RaT/4vz7UaLxHDXpn64pOuf6GDFnqBZqvqc/eTTKIYrC8sk?=
 =?us-ascii?Q?Sl5/v5pvy/KqXMDr9s+Ha87SumF2GFyK7w3eefKLn2UHrCzUK4ooGeQpBWM8?=
 =?us-ascii?Q?nPEzrcc3rWfNwSaHRBy2+CBhI/LkcmbvkoHev0zjVfJuzgu3NPgdgMaPi9QY?=
 =?us-ascii?Q?e42iMll8je+H7lPno93refcuCpid1+1HsrSz8hGj2qW5WW0pMPVE32Wa4AYu?=
 =?us-ascii?Q?gv70AqxRRg=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH7PR11MB6053708C6EB6F603AAF14A89E7002PH7PR11MB6053namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QHABd4XWyjjb1dmQF7RwYO/mkxwUr64ct+kYSfH3fa2mRO94DA9Y/YzgXPew87IKv43ljhWycHfa8CTO+GXk8MPPtBh+SjZka094q8Wwem9Ef+1JUnpW9IG8z4x9F1wCGSaYUpHch++d3kxF6esUq/UJMHP/FZ4Ork3c7mM/vYw5xrhFzhfW7hGNkBZ3e4MxUXSf897zM68ywLMGiFH34G5BsEIQhWv9496To2Bf6lau8YxnfxZPsZxAZu/NgOlZUKvqIjCOSHjNZxzSakEy5thirderotRIlKffmTUiwhQ69PjHSJECP7m4HW2ffouOIgAnjLc35cxvRgbmF+q/yg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1469bc9-e489-4daa-012e-08deb5b287ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 14:25:52.2339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wodrWQyfsfWbWHqzde34XAU7g3I3a+OTh8NO9M85FyvxUmFOEQNdKlZw/agAJ6lyJMwzSp7m254STT0KcbRYhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7778
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

--_000_PH7PR11MB6053708C6EB6F603AAF14A89E7002PH7PR11MB6053namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Maarten,



> -----Original Message-----

> From: igt-dev <igt-dev-bounces@lists.freedesktop.org<mailto:igt-dev-bounc=
es@lists.freedesktop.org>> On Behalf Of

> Maarten Lankhorst

> Sent: Wednesday, May 6, 2026 1:14 AM

> To: igt-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org>

> Cc: Maarten Lankhorst <dev@lankhorst.se<mailto:dev@lankhorst.se>>

> Subject: [PATCH i-g-t 4/4] tests/kms_color: Add background-color subtest =
to

> test the BACKGROUND_COLOR property

>

> The BACKGROUND_COLOR crtc property has recently been added.

> Add some intel CRC tests to verify this property.

>

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se<mailto:dev@lankhorst.s=
e>>

> ---

>  tests/kms_color.c | 79

> +++++++++++++++++++++++++++++++++++++++++++++++

>  1 file changed, 79 insertions(+)

>

> diff --git a/tests/kms_color.c b/tests/kms_color.c index

> 565edb2dc9..e445c8b002 100644

> --- a/tests/kms_color.c

> +++ b/tests/kms_color.c

> @@ -46,6 +46,10 @@

>   * Description: Verify that setting the legacy gamma LUT resets the gamm=
a

> LUT

>   *              set through GAMMA_LUT property

>   *

> + * SUBTEST: background-color

> + * Description: Verify that a 8-bit background color has the same CRC

> + * as a 8-bit primary plane in the same color.

> + *

>   * SUBTEST: ctm-%s

>   * Description: Check the color transformation %arg[1]

>   *

> @@ -957,6 +961,68 @@ run_deep_color_tests_for_crtc(data_t *data,

> igt_crtc_t *crtc)

>             test_cleanup(data);

>  }

>

> +static void

> +run_background_color_tests_for_crtc(data_t *data, igt_crtc_t *crtc) {

> +          igt_output_t *output;

> +          struct igt_fb fb;

> +          typeof(data->mode) mode;

> +          uint64_t black =3D DRM_ARGB64_PREP(0xffff, 0, 0, 0);

> +          uint64_t red  =3D DRM_ARGB64_PREP(0xffff, 0xffff, 0, 0);

> +          uint64_t green =3D DRM_ARGB64_PREP(0xffff, 0, 0xffff, 0);

> +          uint64_t blue =3D DRM_ARGB64_PREP(0xffff, 0, 0, 0xffff);

> +          uint64_t colors[] =3D { black, red, green, blue };

> +

> +          igt_require(igt_crtc_has_prop(crtc,

> IGT_CRTC_BACKGROUND_COLOR));

> +          test_setup(data, crtc);

> +

> +          output =3D igt_get_single_output_for_crtc(crtc);

> +          igt_require(output);

> +

> +          mode =3D igt_output_get_mode(output);

> +

> +          data->color_depth =3D 8;

> +          data->drm_format =3D DRM_FORMAT_XRGB8888;

> +          data->output =3D output;

> +          data->mode =3D NULL;



After fetching mode into a local variable, setting data->mode =3D NULL is n=
ot required.

Either you can remove this data->mode or fetch mode into data->mode itself =
and

avoid use of mode variable.



> +

> +          igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,

> +                               data->drm_format, DRM_FORMAT_MOD_LINEAR, =
&fb);

> +

> +          igt_output_set_crtc(output, crtc);

> +

> +          for (unsigned long i =3D 0; i < ARRAY_SIZE(colors); i++) {

> +                         igt_crc_t plane_crc, bg_crc;

> +

> +                         uint64_t color =3D colors[i];

> +                         uint32_t xrgb =3D

> +                                        (DRM_ARGB64_GETA_BPCS(color, 8) =
<< 24) |

> +                                        (DRM_ARGB64_GETR_BPCS(color, 8) =
<< 16) |

> +                                        (DRM_ARGB64_GETG_BPCS(color, 8) =
<< 8) |

> +                                        (DRM_ARGB64_GETB_BPCS(color, 8))=
;

> +

> +                         /*

> +                         * Set a different background color and  a fully=
 opaque plane

> +                         * with the correct color.

> +                         */

> +                         igt_draw_fill_fb(data->drm_fd, &fb, xrgb);

> +                         igt_plane_set_fb(data->primary, &fb);

> +                         igt_crtc_set_prop_value(crtc,

> IGT_CRTC_BACKGROUND_COLOR, colors[i ^ 1]);

> +                         igt_display_commit2(&data->display, COMMIT_ATOM=
IC);

> +                         igt_pipe_crc_collect_crc(data->pipe_crc, &plane=
_crc);

> +

> +                         igt_plane_set_fb(data->primary, NULL);

> +                         igt_crtc_set_prop_value(crtc,

> IGT_CRTC_BACKGROUND_COLOR, color);

> +                         igt_display_commit2(&data->display, COMMIT_ATOM=
IC);

> +                         igt_pipe_crc_collect_crc(data->pipe_crc, &bg_cr=
c);

> +

> +                         igt_assert_crc_equal(&plane_crc, &bg_crc);

> +          }

> +



The FB is never cleaned up, and output is not detached from the CRTC on exi=
t.

Please add full teardown (igt_output_set_crtc(.., NULL), final atomic commi=
t, and igt_remove_fb(..)).



> +

Please avoid this extra blank line.



> +          test_cleanup(data);

> +}

> +

>  static void

>  run_invalid_tests_for_pipe(data_t *data)  { @@ -1165,6 +1231,19 @@

> run_tests_for_pipe(data_t *data)

>                                                          break;

>                            }

>             }

> +

> +          igt_describe("Verify that the background color is set correctl=
y");

> +          igt_subtest_with_dynamic("background-color") {

> +                         for_each_crtc(&data->display, crtc) {



Since test iterates over all CRTCs with one compatible output each, lets us=
e
for_each_crtc_with_single_output() helper. It already provides a single val=
id
output per CRTC, so we can drop the extra igt_get_single_output_for_crtc()
lookup and avoid igt_require(output) inside the dynamic subtest.



> +                                        igt_dynamic_f("pipe-%s-backgroun=
d-color",

> igt_crtc_name(crtc)) {

> +                                                       run_background_co=
lor_tests_for_crtc(data,

> crtc);

> +

> +                                                       if (igt_run_in_si=
mulation())

> +                                                                      br=
eak;

> +                                        }

> +

Please avoid this extra blank line.



Regards,

Pranay.



> +                         }

> +          }

>  }

>

>  int igt_main()

> --

> 2.53.0



--_000_PH7PR11MB6053708C6EB6F603AAF14A89E7002PH7PR11MB6053namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">Hi Maarten,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; -----Original Message-----<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; From: igt-dev &lt;<a href=3D"mailto:igt-dev-=
bounces@lists.freedesktop.org">igt-dev-bounces@lists.freedesktop.org</a>&gt=
; On Behalf Of<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Maarten Lankhorst<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Sent: Wednesday, May 6, 2026 1:14 AM<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt; To: <a href=3D"mailto:igt-dev@lists.freedesk=
top.org">igt-dev@lists.freedesktop.org</a><o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Cc: Maarten Lankhorst &lt;<a href=3D"mailto:=
dev@lankhorst.se">dev@lankhorst.se</a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Subject: [PATCH i-g-t 4/4] tests/kms_color: =
Add background-color subtest to<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; test the BACKGROUND_COLOR property<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; The BACKGROUND_COLOR crtc property has recen=
tly been added.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Add some intel CRC tests to verify this prop=
erty.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Signed-off-by: Maarten Lankhorst &lt;<a href=
=3D"mailto:dev@lankhorst.se">dev@lankhorst.se</a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; tests/kms_color.c | 79<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ++++++++++++++++++++++++++++++++++++++++++++=
+++<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; 1 file changed, 79 insertions(+)<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/tests/kms_color.c b/tests/kms_c=
olor.c index<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; 565edb2dc9..e445c8b002 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --- a/tests/kms_color.c<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +++ b/tests/kms_color.c<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -46,6 +46,10 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp; * Description: Verify that setti=
ng the legacy gamma LUT resets the gamma<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; LUT<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set through GAMMA_LUT prope=
rty<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp; *<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; + * SUBTEST: background-color<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; + * Description: Verify that a 8-bit backgro=
und color has the same CRC<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; + * as a 8-bit primary plane in the same col=
or.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; + *<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp; * SUBTEST: ctm-%s<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp; * Description: Check the color t=
ransformation %arg[1]<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp; *<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -957,6 +961,68 @@ run_deep_color_tests_fo=
r_crtc(data_t *data,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; igt_crtc_t *crtc)<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_cleanup(data);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +static void<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +run_background_color_tests_for_crtc(data_t =
*data, igt_crtc_t *crtc) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; igt_output_t *output;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; struct igt_fb fb;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; typeof(data-&gt;mode) mode;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; uint64_t black =3D DRM_ARGB64_PREP(0xffff, 0, 0, 0);<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; uint64_t red&nbsp; =3D DRM_ARGB64_PREP(0xffff, 0xffff, 0, 0);<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; uint64_t green =3D DRM_ARGB64_PREP(0xffff, 0, 0xffff, 0);<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; uint64_t blue =3D DRM_ARGB64_PREP(0xffff, 0, 0, 0xffff);<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; uint64_t colors[] =3D { black, red, green, blue };<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; igt_require(igt_crtc_has_prop(crtc,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; IGT_CRTC_BACKGROUND_COLOR));<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; test_setup(data, crtc);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; output =3D igt_get_single_output_for_crtc(crtc);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; igt_require(output);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; mode =3D igt_output_get_mode(output);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; data-&gt;color_depth =3D 8;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; data-&gt;drm_format =3D DRM_FORMAT_XRGB8888;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; data-&gt;output =3D output;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; data-&gt;mode =3D NULL;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">After fetching mode into a local variable, settin=
g data-&gt;mode =3D NULL is not required.<o:p></o:p></p>
<p class=3D"MsoPlainText">Either you can remove this data-&gt;mode or fetch=
 mode into data-&gt;mode itself and
<o:p></o:p></p>
<p class=3D"MsoPlainText">avoid use of mode variable.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; igt_create_fb(data-&gt;drm_fd, mode-&gt;hdisplay, mode-&gt;vdis=
play,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;drm_form=
at, DRM_FORMAT_MOD_LINEAR, &amp;fb);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; igt_output_set_crtc(output, crtc);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; for (unsigned long i =3D 0; i &lt; ARRAY_SIZE(colors); i++) {<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; igt_crc_t plane_crc, bg_crc;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t color =3D colors[i];<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t xrgb =3D<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (DRM_ARGB64_GETA_BPCS(color, 8) &=
lt;&lt; 24) |<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (DRM_ARGB64_GETR_BPCS(color, 8) &=
lt;&lt; 16) |<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (DRM_ARGB64_GETG_BPCS(color, 8) &=
lt;&lt; 8) |<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (DRM_ARGB64_GETB_BPCS(color, 8));=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /*<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; * Set a different background color and&nbsp; a f=
ully opaque plane<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; * with the correct color.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; */<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; igt_draw_fill_fb(data-&gt;drm_fd, &amp;fb, xrgb)=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary, &amp;fb);<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_set_prop_value(crtc,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; IGT_CRTC_BACKGROUND_COLOR, colors[i ^ 1]);<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit2(&amp;data-&gt;display, COMMI=
T_ATOMIC);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp=
;plane_crc);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary, NULL);<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_set_prop_value(crtc,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; IGT_CRTC_BACKGROUND_COLOR, color);<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit2(&amp;data-&gt;display, COMMI=
T_ATOMIC);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp=
;bg_crc);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_crc_equal(&amp;plane_crc, &amp;bg_crc=
);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">The FB is never cleaned up, and output is not det=
ached from the CRTC on exit.<o:p></o:p></p>
<p class=3D"MsoPlainText">Please add full teardown (igt_output_set_crtc(..,=
 NULL), final atomic commit, and igt_remove_fb(..)).<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">Please avoid this extra blank line.<o:p></o:p></p=
>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; test_cleanup(data);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; static void<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; run_invalid_tests_for_pipe(data_t *dat=
a)&nbsp; { @@ -1165,6 +1231,19 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; run_tests_for_pipe(data_t *data)<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; igt_describe(&quot;Verify that the background color is set corr=
ectly&quot;);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; igt_subtest_with_dynamic(&quot;background-color&quot;) {<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; for_each_crtc(&amp;data-&gt;display, crtc) {<o:p=
></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Since test iterates over all CRTCs with one compa=
tible output each, lets use<o:p></o:p></p>
<p class=3D"MsoNormal">for_each_crtc_with_single_output() helper. It alread=
y provides a single valid
<o:p></o:p></p>
<p class=3D"MsoNormal">output per CRTC, so we can drop the extra igt_get_si=
ngle_output_for_crtc()
<o:p></o:p></p>
<p class=3D"MsoNormal">lookup and avoid igt_require(output) inside the dyna=
mic subtest.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dynamic_f(&quot;pipe-%s-backg=
round-color&quot;,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; igt_crtc_name(crtc)) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_background_col=
or_tests_for_crtc(data,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; crtc);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (igt_run_in_sim=
ulation())<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bre=
ak;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +<o:p></o:p></p>
<p class=3D"MsoPlainText">Please avoid this extra blank line.<o:p></o:p></p=
>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Regards,<o:p></o:p></p>
<p class=3D"MsoPlainText">Pranay.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; int igt_main()<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; 2.53.0<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PH7PR11MB6053708C6EB6F603AAF14A89E7002PH7PR11MB6053namp_--
