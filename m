Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6F4C52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 09:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D496A10E2D2;
	Tue, 13 Aug 2024 09:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="efHRd7cJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866D210E2D0
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 09:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723541188; x=1755077188;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SzvrYqf5rQSC/qU4VvRtKGg50/4h+m5Q3T/TaTbCtj4=;
 b=efHRd7cJ6JsqouSuDZIipPsJMo9qs0WfSBw5YGTfhyE9jh+dgd/NKXNu
 bZ/cJWs++ih+lWmXdTFYi2gxBV5QmJt/Cf/ODijH1BCzd5kAjs+3xb408
 n01XLqf6uwVxpyrm1NqWQY5/NpTI1pCYX3TY8aEQgmXqpGgmMPODYZpUZ
 MIFdMSujKKdTGxvMVfmcJW5CWS7Lftn1sQuO6tR2rNkf3+EGUYRlNiTPU
 bjFi7/jwUs7/lXJOUuRD7A31wAW9/Qh9UcWw8BnXKyulIph0//W9Ft9Cv
 IMEYtTP/irZf8gej7goOk1hlwJZd46SCIejvIavuccdWSSDY1q0BAex+8 A==;
X-CSE-ConnectionGUID: 9s55HGxYSe6IrPNv/ykcKA==
X-CSE-MsgGUID: /XUy1jd4QcWvyOUjYaJ+kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32368695"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="32368695"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 02:26:27 -0700
X-CSE-ConnectionGUID: 0E52WL7WT7yV+VqKrnHEaw==
X-CSE-MsgGUID: BrQEDuIrTfaLWxHc8VZuCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58678673"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 02:26:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 02:26:26 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 02:26:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 02:26:26 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 02:26:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIBP8FG2mKiNdEq1EifodeX4/sMhySjSDKDGQOCL3LK+cNSAAyCkPpANB+qvPJdq3XxZb89xccfLfxZhcO+73FmdfqtiP0a6o+tfUDMGxtqY1QIWMb3JqCWHC4ow0Es5hgkl0WfcHuKQIsfij8i1wnJyCCboY537/Gu0jrRiYwhJ/y3F7USyOhACkYYM0S8fOsry1q/U3BCqQDiv3/Fx8Zvj2g6QtbodHoUzPsuMsXqfvq2NpZGUv/OcIh6gmBqUpz2+GJR6uLFokkaGWMHNd5zhp01Al60iVg6hxUMLvOUCM+8MTRNWdqYPJGWs/eAMboQD5pD7AgBezeXK0mUslg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqzh7ihg8sxTRlE2UqsiDjnp6nl8qgDVfhEkENSQqIg=;
 b=oPiDF4q3DcR7vjaox4wGa6PeypzIi73qL7j70AlEKNBL4iEdiD7XCvHlUrfu9iHi8iVX8zoP5Yn+hkduD8wH+0tBYt9R1BNTptGea7YE2YTmDaSqQImB4B/Y3S49CH4eX6ypYILPiLu7A3G5ZLeMhQyCT3T8cK1i5Ft/+BeUfrgXUTwYytVENZEDQCE8x2ZuTfNDoNWF0V+yLkW4TuCxAYP9Na1CSTp0YIkpZ03K5S/68m2y+S1G9Dx7iGWYHxsH0lj8F9tRvpc6xFrRtZx0ize7GFp7TBI+pblDPf8zHyIRwpPsMN9QSpCGNySpyYsf9ysfFIhreWjDdgk9mq+42g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6761.namprd11.prod.outlook.com (2603:10b6:303:20d::5)
 by PH7PR11MB5916.namprd11.prod.outlook.com (2603:10b6:510:13d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 13 Aug
 2024 09:26:16 +0000
Received: from MW4PR11MB6761.namprd11.prod.outlook.com
 ([fe80::6b8e:aea1:6960:2430]) by MW4PR11MB6761.namprd11.prod.outlook.com
 ([fe80::6b8e:aea1:6960:2430%6]) with mapi id 15.20.7828.030; Tue, 13 Aug 2024
 09:26:16 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t v4 3/4] tests/intel/kms_pm_dc: Add polling for
 deep-pkgc
Thread-Topic: [PATCH i-g-t v4 3/4] tests/intel/kms_pm_dc: Add polling for
 deep-pkgc
Thread-Index: AQHa7Cm1XikYoVk47EOMnqzsQHsBrbIk7MJg
Date: Tue, 13 Aug 2024 09:26:15 +0000
Message-ID: <MW4PR11MB67614F2A5C4B9664D2876CFAE3862@MW4PR11MB6761.namprd11.prod.outlook.com>
References: <20240811200359.1086166-1-ramanaidu.naladala@intel.com>
 <20240811200359.1086166-4-ramanaidu.naladala@intel.com>
In-Reply-To: <20240811200359.1086166-4-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6761:EE_|PH7PR11MB5916:EE_
x-ms-office365-filtering-correlation-id: b5f59b66-9753-4898-60ff-08dcbb79fb36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2IOBYiBgGJG822bzQwBh2pIv3IAy19iRjtZtJplViFi5xbVaZGCP+tZdiI/0?=
 =?us-ascii?Q?YTRPdjeB44dsC+Nm02UWAdZilDsHk8teyBeG1DgJvMm9vr80Vw6sgNaVF/5E?=
 =?us-ascii?Q?qp4Plpg6UPGJZcRc7/SworvS1PM/zxnVYF6O0x+mYQ3CnnVeb5S0daMXoi9g?=
 =?us-ascii?Q?XFGoXn4lpnco/5FcSXa9BCvzWeoQZEpHh4JqCQMxbwrfjDzvuthYf9JMlIza?=
 =?us-ascii?Q?k0tbwruZcE3bapfApk8LmzrvNhOTKI96HXg5+uNv7BoCtYOfAgYq1AAc4c30?=
 =?us-ascii?Q?HmI4Z20ccA7Ob/Vzwa36GOhbPbXP/r+KomrudIzUMZrummQVUchXfBU5ATjO?=
 =?us-ascii?Q?bRrK1/IuFoh4rgeS+SLxF6O5th/eKRZdXqBO1z2sK8JBS2QxcstaZrsKX0N3?=
 =?us-ascii?Q?dQU+2vMbY0SZbrejPi1JI1RtCQOaUQ7Re9qwN2+I7eDj/xUMpqI7NyVnOi0n?=
 =?us-ascii?Q?gjx1Br4clahLyrbfIoL/JqALDJgDdDTSuwZnyaIqRscMM2Y4Vuzk6X74tMU1?=
 =?us-ascii?Q?6gM7cmy8DLhAazcW48/0sj4QmtYQo/Exd7KLdYRpyeZwmFTitJO0KzzEUK+B?=
 =?us-ascii?Q?65RmCqkS+vLKOv93tav2wNRRtf6fFUaepUGHmreYWA6K4qML7IIxXcmCa7Sg?=
 =?us-ascii?Q?IgEDX4qLkBWvc9yGnkvbisxmK6yU8zQyHxNWNaXuGJOdqQCdxlD4g8rQgm/x?=
 =?us-ascii?Q?lhevGIF4YsyHwgEANU1tTj7vEIeb3hrUpkvDuMCCWlalfPlPX4tyywqWpO0e?=
 =?us-ascii?Q?RqiiDiXWzgmOJihpLC6HVxgg3Ho3C96AKAusnGxgMPMDWWhLAyFHuXyfeg3s?=
 =?us-ascii?Q?KwdpXULGIMcnteXoh+6bIkr/Vb4PGo8DL7a2N8Pqe4ieLXhOdfDyNaUai3Bl?=
 =?us-ascii?Q?rokNWoIirkWLqkqvNxzUprNPB45xYtOMXnSha7XZtySb7aPiPHuOk15jER8L?=
 =?us-ascii?Q?dEMtFAaqSHFAndXcAoICuAYWyyCIdU+0Vvhh6EQ3Sv5KW/JVuVJUm0O8cchi?=
 =?us-ascii?Q?k2C7oVj2/guyl8NGPsPJAvBEM544aAk4obaJfY/2MihoQyJ3jH+TbV7weEyK?=
 =?us-ascii?Q?T/0kC7osQUsXz36QBtDKll45FOq7OLr5MbHi7V2r9jIQet3Dcg1CihAY+DEK?=
 =?us-ascii?Q?N31aoCUEqjZGDBMEkL35A6ndn6gcHc1BimuGz8mL3BRkOLdlnxljj4PIwmQL?=
 =?us-ascii?Q?qPTb6uOkoe0o14ce20Fc15Nk7PxSLVvH5AqwTflhs+jVS8e/rpJjAjSnF/hd?=
 =?us-ascii?Q?prdFotz9Y41tsqK1I227DGhE1bar37paMt5eDYtbfew5RdObVosy2fkMx6oo?=
 =?us-ascii?Q?q+4O1rjHu3OSQKxLjnEvrqryW1kyfBUgQwBPNVP27XanC3XMBIVSgylqhmPo?=
 =?us-ascii?Q?B46GA79oa7uZIpkrYp/tcgWhC0X+GgILgia1xQxA5QJXdgIfDA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6761.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fgrSiV5Hu12ATu0eKODjYWOzSbRjzrFZfQoW0N4uY6zJ5SjrxrTbXRk4IcRM?=
 =?us-ascii?Q?0VrUNzgb8kP7F90emwD6Xx7g3OhuusYmrHW3Fa8V5uqQnWbyCfKo/okg0Amk?=
 =?us-ascii?Q?PwFLAOqIf3vmTK34FrxcV48qSEsb58K92UVVJOHKIDfMs/A+p8c0j/zoJs9r?=
 =?us-ascii?Q?Owp/gzcKMbgAzLJSBmnkV6jLKwgq0026/prAvykwXCQ2duhzIQkcAHZ7saZy?=
 =?us-ascii?Q?5djr0xZ7DyBcbN9+0VAPoOaUK39r0PwoeSqD3ys7Dy/xrr7AqAudicg6gyKe?=
 =?us-ascii?Q?H0aQPVpa7SSQHDrLJw7RtD49IPH9JyAGgmYE+ux4nwHePvdYVGeBXwqIM5FH?=
 =?us-ascii?Q?TLBpzsRVRJ4ydzqY6dG6iSpRNMDe/Nhlt+8K5riJsLBdPon4UJbmDtPpIKLI?=
 =?us-ascii?Q?AYig4m5JQMvdsR0FYwqUy2qyDXWo4q58nEesCneRKqigbHinM1kBv8tK+L6s?=
 =?us-ascii?Q?lDhUaWQZLE89MyHSS544ACuNtzMakyi5Cnn5ofTna32jo2PyJFwSffKoDuBU?=
 =?us-ascii?Q?FHWatnmECnDeCQQaO4a1L4zLcHeoQN9//0KKlbRt9N4lekN4hsm2Fm59+Kna?=
 =?us-ascii?Q?Cs8Yl413WsDFBdpzUGSYD8bkJY2VkAEJpaS1p+f9aSYYh1NYMDBGGzibzT+G?=
 =?us-ascii?Q?ozQPL6EAvaFlhVinpyCW4/P8HC8JgFJj7dNAfn8HCCL2tfdhReTnSiCbfQ07?=
 =?us-ascii?Q?vqGsvcyVo995bKA82K91lYNrJwn4lr5W5O0ARQxwpGHLGBlbfcXqzzjvDhea?=
 =?us-ascii?Q?8l72x7rA4BI6SI7t32FM09xg9MEqT5TjZVoDja0z059hZEPQpkB0pDZQqMzn?=
 =?us-ascii?Q?3L6IpNBluI4c3sKrI/y87VyXVLJrLlFHwcOYkZjdQBiaT9JxHm0UqY6r4yYN?=
 =?us-ascii?Q?qUV+1QjIelouqomBwNPROAauKru75h8SuDort+5URuH62byqBEOuFEJp+RVe?=
 =?us-ascii?Q?XBHKVKMoGuIdXQWoTh/KW0pM5FMx1FS9r7ArLzFHq+phC1prR6Rl+kST43/U?=
 =?us-ascii?Q?XorKTCFFeManvzGDw48rWwwjtzQEeb8C2t3ipe5iA9qpvkDH0Fn/KAbee/nM?=
 =?us-ascii?Q?hTlgkUTbZxtFv+I8DIodu/Uw4fkSgkoaOWGp9gmEHAYgkES8q8WVrmf8Srq3?=
 =?us-ascii?Q?+GyfVDYBqm5uBG6QDfBtZreK/ZW+4l5ERYBpJnC2NCU0226F+EWrx7CT901G?=
 =?us-ascii?Q?lnSmsD5LuMcQzA37uYBkfwoM6Q8qfYkuzmLXvk+ToeqzQz6PcuD7wXXMJ1YZ?=
 =?us-ascii?Q?RylAJrkl1f065CF/5S74b9XNAjKkTLaAQRUC0QKs6LG+2l7xRiTc6KeTouXy?=
 =?us-ascii?Q?CwhYKb63btx7cuITBxrh38eQ/9iqDyHoIfHBN13jhwjdCwDK3nvi3xXp6A9s?=
 =?us-ascii?Q?YPRr5vzpbeSwSIYAheo0DIFIWQCeSkpwwmCg+2K3INa3KXcAsRIy9WtLtbNy?=
 =?us-ascii?Q?+BYWalHqn/7Of2SFt/dCji9tJsaw8RRRlbS5+njCkzmy4xRwg/qft64I4vn/?=
 =?us-ascii?Q?rOMqbir3+ygo7ypQri9C6z3j6mz4RXI7Chq6aSOU62yCBJmKElOBm+xU6fH0?=
 =?us-ascii?Q?/SjMCR5c+0HvcRpXMcyUa7x7F47iQIhMjI1HrBUz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6761.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f59b66-9753-4898-60ff-08dcbb79fb36
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 09:26:15.9460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZlBb4OKC28uqNomoe/tOqoJ7k9xCV8Ip2vl6jmWXq/xn1wC39khGU4VH7bcOypqbXZj8OjKRlt6GeFW6wFkQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5916
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Monday, August 12, 2024 1:34 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kandpal, Suraj <suraj.kandpal@intel.com>; B, Jeevan <jeevan.b@intel.c=
om>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v4 3/4] tests/intel/kms_pm_dc: Add polling for deep=
-pkgc
>=20
> It should be enhance the test_deep_pkgc_state function to include the fol=
lowing
> changes:
> - Added an interval variable to control the delay between checks.
> - Added a wait for vblank to sync the frame time before reading
>   the package C-state counter.
> - Introduced a half-frame delay to ensure the flip occurs when
>   the frame is active.
> - Modified the loop to use igt_wait for better handling of the
>   package C-state counter read.
> - Removed redundant usleep call to streamline the delay handling.
>=20

Again use imperatives

> v2: Address and correct review comments (Suraj, Jeevan)
> v3: Update commit subject/message.  (Kamil)
> v4: Update commit subject/message and added comments. (Suraj)
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 565c3d48d..270912c46 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -596,6 +596,7 @@ static void test_deep_pkgc_state(data_t *data)
>  	enum pipe pipe;
>  	bool pkgc_flag =3D false;
>  	bool flip =3D true;
> +	unsigned int interval =3D 5;
>=20
>  	igt_display_t *display =3D &data->display;
>  	igt_plane_t *primary;
> @@ -640,22 +641,25 @@ static void test_deep_pkgc_state(data_t *data)
>  	setup_videoplayback(data);
>=20
>  	primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY);
> -	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
>=20
>  	igt_plane_set_fb(primary, &data->fb_rgb);
>  	igt_display_commit(&data->display);
> +	/* Waiting for the vblank to sync the frame time */

Use imperative comments eg Wait for the vblank

> +	igt_wait_for_vblank_count(data->drm_fd, data-
> >display.pipes[pipe].crtc_offset, 1);
> +	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> +	/* Added a half-frame delay to ensure the flip occurs when the frame is
> active. */

Use imperative comments eg Add a half frame delay

Regards,
Suraj Kandpal
> +	usleep(delay * 0.5);
>=20
>  	while (time(NULL) - start < duration) {
>  		flip =3D !flip;
>  		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
>  		igt_display_commit(&data->display);
> -
> -		cur_val =3D read_pkgc_counter(data->debugfs_root_fd);
> +		igt_wait((cur_val =3D read_pkgc_counter(data->debugfs_root_fd))
> > pre_val,
> +						      delay * 2, interval);
>  		if (cur_val > pre_val) {
>  			pkgc_flag =3D true;
>  			break;
>  		}
> -		usleep(delay);
>  	}
>=20
>  	cleanup_dc3co_fbs(data);
> --
> 2.43.0

