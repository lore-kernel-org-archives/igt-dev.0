Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3937EC02193
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 06:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AAB10E10C;
	Mon,  3 Feb 2025 06:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJxZixMd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746BC10E10C
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 06:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738564962; x=1770100962;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gCA7Qun1/0yXXzo8iZiZwOVmO6Dv6wT75NwKI3ZOd/c=;
 b=XJxZixMdlKHypWgsJqtXTA4rbjG92uclWa6q3PUOKLDBg5yZh5xYYgxH
 iICtKArnMB0TEvZFsbVaUfwCOgFvGFNQeKXQVNjZ9N7J5zTZ6nyjWTL+z
 QFe/2B8WIPOPptw8HCBbuukBJPb8d+lidwjVW6JqdEjWccE7IYLwEo1yu
 hJpE52odie7mF4AVmhxu2VN1BTixIyYDRQZ8LBxhVO9hBAzmBRhV/c+S0
 boy7vgCOeKVWZ81/8up8uxpER5GjK9Lj5+Q4p9x4wn+Wzv8o6Eht41Zdt
 xYwMfL8A48vm42YD6lvzvVxUODUG+64gE6ZnQO/7Au506V0VNNV4k/Egf A==;
X-CSE-ConnectionGUID: niH/OxW4TlG1cea8FXhEYA==
X-CSE-MsgGUID: mpOxYW1IR0SQN/fdN/hGyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39147161"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39147161"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 22:42:41 -0800
X-CSE-ConnectionGUID: NS0bYfzSRGevjww9nBFfSw==
X-CSE-MsgGUID: Vz5wk0TuQhOx+GHqqfKeAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110784278"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 22:42:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 22:42:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 22:42:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 22:42:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QE/77OBb2VGrBrZ0xD2uf0/hXPPiw1WERtOO6jsvp1mu2NwpebKcPi0LWfey9C2DZJ856ip2rjZhS5KB9RvFk5OOQQm0J3qdZg7693LfRQQe9hixWp5idjtzOt4V4n94JEMt4w/okfvmIrxRFaxbC/soxQAIA3eomRMTi7lYPz/Z5e3zgK3RKI+AoJaQlS9A1qIDvbgNV+wdUUla5+htWtgSN87vFTHGHMvLQquK26QF7li6Jhbi4OyRuOvjrXzwtcyCbdjs5p9FreFRw+NlnTyvfiPwGTWFs5ju8RPu1jLoeseemhALJjA4FLHqB9h9IV2BtAT6rXAvmCDibfwRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEj0L7bMQWpsC6N43oN1Jg50tJGtl54DQ6Pg83MoecI=;
 b=TL54cmqOFv9kV8ItvDS9RvzP9LCbaiNkoIbq0yewIL72i9gjeD4VrhVP+RQKPzqUwHRpk8n2FJJkFwc2kgvYasa1hVkoKqnGQkQRFWVLHoiGt/LNauzAIVq/p9TtbrqmQ51D06BHx9iDS58Q6SqN1zW4WcNfcU8+uTTC332fcdoYZl8UljjjBEtO9CZSip5Sm6S1g5HG4ckUnb+n126eOAL43HScv0AJxefLqDnr4JCKWxexNBVMhrw/r4kr5AGkizJSdr78g8jcEzJKlCQWfCMVvZ3sdQJO/DfO6lOrsP13Keexdbti7dBPhNSlZ2CK+nkmGT5qr1edEsvoSJT7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 LV3PR11MB8506.namprd11.prod.outlook.com (2603:10b6:408:1bb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.24; Mon, 3 Feb 2025 06:41:56 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 06:41:56 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] tests/kms_vrr: Add function to return vblank
 timestamp
Thread-Topic: [PATCH i-g-t v1 1/2] tests/kms_vrr: Add function to return
 vblank timestamp
Thread-Index: AQHbc2/swcBGMlNw10CFZVUpaltbmbM1JaSw
Date: Mon, 3 Feb 2025 06:41:56 +0000
Message-ID: <DM4PR11MB6312C3EA276604AE0098BFF790F52@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250130235246.4142758-1-ramanaidu.naladala@intel.com>
 <20250130235246.4142758-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20250130235246.4142758-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|LV3PR11MB8506:EE_
x-ms-office365-filtering-correlation-id: aab2c92d-7c2d-43e3-d9c3-08dd441dda79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FX7Oj4ho1gpb1rB1x/aWpgIjlqgMOkJvrYZMPVRoj2OqZLJGmpavwyG3aDw0?=
 =?us-ascii?Q?0uuwMrco5mXuciMM6JQhwp5OupI6llYXUMINLLDnoYaOX+wcOayNbHumOvpt?=
 =?us-ascii?Q?0pGd4Bznux01qZhPVbj8Iy5a5pzViopV/uakiCdqhJqDPxo4yv4k9BFYH0Sh?=
 =?us-ascii?Q?w0cFOnjNZciZuxHNIh94EiTGDg1+hta92KMZWlxxUWhHA9zuSolaDVNvmfw6?=
 =?us-ascii?Q?kF2W1ojB1/02miBc5doxBZDSzMv+jsZd2W202ShZ4C5x/ElNRvXWltKNEicn?=
 =?us-ascii?Q?3DsT2fh/LmkbNFRPi9UWWNEM+i6BaApKysueypae4lv0Pu5U/jY62Nu058hy?=
 =?us-ascii?Q?ikHl+52BxUlyUd5kgP9c+b15u+qkOprJNfHJoVIPR29pfhyV0JCN/hfzsf/u?=
 =?us-ascii?Q?mvm7T0NLG5p43J3IhquUOBF6vVRHVKLQyt3SvMUcAAvMt5Jv9JOS4oJv2lr9?=
 =?us-ascii?Q?pC5/xytzMbXWhcHtf7EEljSrupMBgdk2aHzV3jjTMVxW4dZAvXB1pNGznp1/?=
 =?us-ascii?Q?AyEUA6xNs6QjIH06BXn2TY/lwGKtWybj7AyAbRI1dqUNOl0PD/2qcvtwO7+P?=
 =?us-ascii?Q?G7+Po2DRunSQ3rdS9B6Ivau9kh00KsiJTWtX6ik+icYikSG3bQCdyhxBmZE5?=
 =?us-ascii?Q?GGa7Muu8pfNnZPSe51OV5jQYsiyr7wM9H4BYFMh1ET/Xka6YLneNsB8Regl5?=
 =?us-ascii?Q?qWNJdcHMlyUcbiWoY96ubeTwEpSdqoJGbQrq8wWxYTjJYGHWOOqlDz4YcZiX?=
 =?us-ascii?Q?KlUxuSr2CsV/VdZPyNg+yVnZUSWMPumeNynU2YF2Vs/9p9UcsjxhEq07DvMS?=
 =?us-ascii?Q?4XKfleaYBn/9y1uSkFQ26Ud/99vHi6fUGTtuKN258O/a1B167+pRjiFn3d6F?=
 =?us-ascii?Q?eLzHZKfT+xwhzVYBtpkNbAsC9862RYiY5yFzLpSiaqpAuxKJ/boS458tRqFi?=
 =?us-ascii?Q?ElVGj5qLFK8SNK0eOrjv2vZZzPIoKu4kBySB1z58V2f+eaALy2GjjjvAa3gq?=
 =?us-ascii?Q?ZYwrq98LCSkJi38VrsZT7EJcJTEN8U5MVJ70LqPGpPIdXsOz3wbM9U/JV8aY?=
 =?us-ascii?Q?a+VWZOedGXvaoZgsyKjJ3utussg6/nWQar7Hhy2VR2VF2rsCGM+kBsP9DeDf?=
 =?us-ascii?Q?gj+L+IjoUa6TRe2xnFA+YdMmACY5eydaLcdLDt6VIbEhdQlDDGcD97KZg98C?=
 =?us-ascii?Q?Gv1o3/Bzh4gLpI4TjV/n+3f8HVRbWPrS7ggGmQmlxQuGKEBOIr5vZ4UIyNU9?=
 =?us-ascii?Q?T57KL7UInR5gnSSmMER+mNzGRPgvaHzv63U3fRc2JDWuE3hISaj3om8kkXbQ?=
 =?us-ascii?Q?NUFgHPbmdYa4dBJMc6OhiE3NkhOe1iKFuW02iU9nb/H6EUQdKrcurXV+vSeT?=
 =?us-ascii?Q?KPRM0G/Ln4RoONZBNPSkBLcneN1RypjNpOyxR5GHUuxzHVRAVeg14GnU0Ob3?=
 =?us-ascii?Q?mwUKVl5vjCILLub7bWSADvZ9TL9aXe+o?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oMoiaaBSaYnZcsL9DgHjP++viK4erogarsX41uzkafFp3lAHbLfK2Vue+tLa?=
 =?us-ascii?Q?0JVeuF3jHI1oo2pjaRFTC3Fn7NPJuQNPZXa56oZrmGk1D3tSEdLyiUZs6qpQ?=
 =?us-ascii?Q?WuMwdUpPph4A05p4yCgUJeT2TPg6tnPzakc7YJhFOTShTUxf+WnapAsYIOpg?=
 =?us-ascii?Q?LMVNK4vsEtz7wk791GymmaVwcClD68W9pdq3YI0arpAQFQ2J1UhCnryBjj+4?=
 =?us-ascii?Q?dZd2AOOw6crJ9l68wEPQbCPXqroU6fmdVxddwZ7NmaeSyjwAmHbIDswE3pve?=
 =?us-ascii?Q?34Y8Ktxb51GUcjtkRX6QiQh0/MJunp3MW/R84X1jaLXal7KRW/V97ibWHkIQ?=
 =?us-ascii?Q?mTDLB08vvhBVhdEBDqmmRwB8QMhziGtdaD1ofGZDYN/D6j4e7fxBPj1v1KK2?=
 =?us-ascii?Q?O4lTZcCxlJz2DCs0HiCfgj0oqDkpCd75NrdnD2MfKy6GA0bU9Tzxf8u0s8RF?=
 =?us-ascii?Q?hMwZhBFpGPA6PIwwcX/N2yIPCSR/T9ivvTbGzzlwY+DAswPXIToRuQ61ysok?=
 =?us-ascii?Q?O20dAzg9Irex5qvDznq2gmxf4nbC2Sf/55/9FfiTQvkC7xY8FoXoFkyD6VbV?=
 =?us-ascii?Q?Zjj3Jy/jlXD6MQOJue1lXRkWeNyHjxqH1V2CbzV5wvr/68XFOq1WJUrxm9ad?=
 =?us-ascii?Q?ltWERLGr2ASelUNP47RqARSMStv80XlzSNi4XxbXyHUWkSR50QgeEgDFgt2j?=
 =?us-ascii?Q?6fTsW/M/cBhIRVi7n+lSuCE6in/KQ8+ttvAhxtWKtq0iaguN3i7pABq8Xrcb?=
 =?us-ascii?Q?Ig3ylZvb/j0wvSlwJpnrqpHG6OVscKbEbVc0huilMPhlXPCCvsUi9mFsl04b?=
 =?us-ascii?Q?mogZDjizFmGxhOkmEzicg6I/byywmBvnIo7p77HilywlKYAchz5Vl5WnFfzd?=
 =?us-ascii?Q?Jf7gS4CQxcZQ7bG0UdRWhgwbyRnKbCKDVTOmOPRiQEvIIEWkoi1xAVrbC+Q8?=
 =?us-ascii?Q?DVwHF+sPwKWnHmZDM47COcQ6t0WveJ1BcREtCCwzSf4/UOSQARqzjnVNIQXn?=
 =?us-ascii?Q?A+JztfO/ZM2LmTPkTKYsFkDPojUmddKeC/oEZe+3VVn8GPoPXehA6NxlveUj?=
 =?us-ascii?Q?JoSIUTOwIhncMRI/Zp2WQtGE+dvJCCXdy/TJ34o93b3C1zZ0UdglLMviMNvv?=
 =?us-ascii?Q?wLKvlpg/HEF9jJA8A9IOyCEBJ5Xm1VVxQot7b/VxFtp5SUOUD7whNKVWBLD+?=
 =?us-ascii?Q?UqLTATXiirLEik5TY7ScwQ4NF7mQydC5crUmzBkP8kF/CfDidr28BZuUOEQJ?=
 =?us-ascii?Q?V6Odj0/i/0aLRfFa1sW+Yv0TrSMq+qVoP/AsWQJT/JhSStYasxXMmQFoFmMa?=
 =?us-ascii?Q?U4Bb9v/TRhQcOySUvU1Edw+ZWXFcoBbZdj+x7mJzWvpqPi9KiEEWyWF+tuLv?=
 =?us-ascii?Q?grjO/Q4n+8pijLI5Vmd0jGrQuTX9aZG6bKtRIotTGrW+1V9MThhQEzOmQ+mg?=
 =?us-ascii?Q?ZzsVpy4HvWk3FLfRoQ0LbZzHKeZrFy0IQ6HGC2B/FijCCfBztc5nWsE4IuyC?=
 =?us-ascii?Q?8UvCyC0XosuCZO0fMEw03ca4IEHvAYJqRsShs26D/sMuZQyBqGmrsZSksak5?=
 =?us-ascii?Q?QZqn/cek15LlUSUcJe4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab2c92d-7c2d-43e3-d9c3-08dd441dda79
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 06:41:56.6119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aixBF0LOWS6UEspHJBffIa35wdEZokyM4SXlgc5KvYE6Vb3FGfhXflexZ02KY9lBmMIo8yTxeZauNNNfUxqKVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8506
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nalada=
la
> Ramanaidu
> Sent: Friday, January 31, 2025 5:23 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Sharma, Swati2 <swati2.sharma@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1 1/2] tests/kms_vrr: Add function to return vblan=
k
> timestamp
>=20
> This is useful for subtests that require precise vblank timestamps.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index e7d2ff1db..fac7cb4f7=
 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -172,6 +172,27 @@ static uint64_t get_kernel_event_ns(data_t *data,
> uint32_t event)
>  	return ev.tv_sec * NSECS_PER_SEC + ev.tv_usec * 1000ull;  }
>=20
Can we reuse the existing code for igt_wait_for_vblank ??=20
Also why are we adding this in kms_vrr.c it should be in lib.=20

> +/*
> + * Wait for an vblank event and return its timestamp in microseconds.
> + *
> + * This blocks untill the event is received.
> + */
> +static uint64_t wait_for_vblank(data_t *data, int pipe) {
> +	uint32_t pipe_id_flag;
> +	drmVBlank vbl;
> +
> +	memset(&vbl, 0, sizeof(vbl));
> +
> +	pipe_id_flag =3D kmstest_get_vbl_flag(pipe);
> +
> +	vbl.request.type =3D DRM_VBLANK_RELATIVE | pipe_id_flag;
> +	vbl.request.sequence =3D 1;
> +	do_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &vbl);
> +
> +	return (vbl.reply.tval_sec * 1000000 + vbl.reply.tval_usec); }
> +
>  /*
>   * Returns the current CLOCK_MONOTONIC time in nanoseconds.
>   * The regular IGT helpers can't be used since they default to
> --
> 2.25.1

