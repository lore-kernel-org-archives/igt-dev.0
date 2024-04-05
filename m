Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CA4C67861
	for <igt-dev@archiver.kernel.org>; Mon,  8 Apr 2024 10:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4169410F2FD;
	Mon,  8 Apr 2024 10:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hsrgmmiu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B18410FF67
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 13:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712323078; x=1743859078;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tYhCw1lgMJLefA9+Ex+9rBS5iqio1YE4oCmWaotljlU=;
 b=HsrgmmiuWj04YkMkBkA0itqsdT2qPgqjf06KS0s6miM/IypAKJGvowPn
 CUKbmJ8YJuVL5wQvRLY7I08EpDLmh86TBaBdvM6DzaA6Mkvnu3y3z+CoN
 4PmdTd4rtGZmhwA2QGw+vL4a9ayxFG5S/DGxJcxvarE9X+U0AiE/CGC79
 P/Jt9KdT8keg/oC4MR/Q8muTi4OVM6lNBvFVNBRHunzjuwVZcrASCHVNa
 jgCkIjuF7yrz0T299UOLLlmKQFyQ0wKVJnyW8vBFaLL8pd7yScwVNKD7Q
 DPlbUlRztUgEcSBwtvv/3r4K7QwFeySWG9oYsQWNr0wKqTsFQswr0/7Wf w==;
X-CSE-ConnectionGUID: gIgXcBXZTweBYXRDlh/s4g==
X-CSE-MsgGUID: HDsuoafYTgSz1YVgiFNEsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7884982"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7884982"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 06:17:57 -0700
X-CSE-ConnectionGUID: G6Ir44nHRI2Sn+zw3OV3ww==
X-CSE-MsgGUID: PommhePgSbSEVwoFMGTpUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19183324"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 06:17:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 06:17:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 06:17:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 06:17:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 06:17:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9V2HJ9NV/Lc21/Dkw0v938uWVuQRNnpQBJpTFi1N0I5WCUhPQDO57ANS2W23lGdHkfG0ZgfgXDHwjuro5PdhyylNv+o88zcH1ax+cMRNk6nuSjs5NJCNRhtxVzFtRYB4neMCOkg/n3HZ8guIudFSvLwpSHaz8SKnxJGww9ILlk8ruuUHeYaF4eIntnN5c52BMiPsUeawrN8oTaO4kAIkPVsbtPg2mgpSRHpfAtHbeDo5OMFiwOhDrjZlgKr9iBy9xR8EAqZQh+GCOjgp7i1SC1qbyRMJszJnOxmpwRighzuTIyMya+Twd0kj3ei9AIuhyT9xDY8kD+2t4bS8moG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVeZ9VICYjNklm2IbjjlKq4fOzSQa8dS2D7k2ypSQno=;
 b=JsZvUJTShLnWBzyN6w7PE5pH2gJ7wPv6o9cRLFuLDh7nIAiUrJe6bbmsIQu5wtNr1Wm+u5nP7elV4OWuBq5JJR65EiBGiWmYsb0iQRwd+Ox45F4LTerZGKtq6O3fJD0cCiOmsfrsrTOwWGUsUSEHG08u48R9W7e8nEb4wBCSOsg0yrTI3C6gM5xcfntm+nGt4lOj2qS2DCdWUb1Mt5i7bTLsPLBdkp4iutO5OWAmLJbXG20fmmYMe+Xllsir4UTkEDUorUbLRSScWMuKpbFQDfVkGT5BoBgU3ysJkB224yYNl5sv9/RxAZEExIc09JQ8crnBbSLDYIRcWqZNUKibaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6)
 by CH3PR11MB8589.namprd11.prod.outlook.com (2603:10b6:610:1ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 13:17:50 +0000
Received: from PH0PR11MB5949.namprd11.prod.outlook.com
 ([fe80::b38f:31b9:308c:c04f]) by PH0PR11MB5949.namprd11.prod.outlook.com
 ([fe80::b38f:31b9:308c:c04f%3]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 13:17:50 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>, "Chauhan, Aditya"
 <aditya.chauhan@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2] tests/intel-ci: Addback evict & threads tests to
 BAT
Thread-Topic: [PATCH i-g-t v2] tests/intel-ci: Addback evict & threads tests
 to BAT
Thread-Index: AQHah1VJrFJEz/pLd0i8/isep+96OLFZqI6A
Date: Fri, 5 Apr 2024 13:17:49 +0000
Message-ID: <PH0PR11MB59497DF911DFA5DCBEB44F9285032@PH0PR11MB5949.namprd11.prod.outlook.com>
References: <20240405123154.15406-1-himanshu.girotra@intel.com>
In-Reply-To: <20240405123154.15406-1-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5949:EE_|CH3PR11MB8589:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QH4dOJBQcm80+6LUmluHE9SVVN+cjxRo+QwrWOfU0J9ziKdMRuSY45OQpEff+uvvMRwUJItKA/nIaLKZe3/wOSS6OeBU0RzDeqMV/jFMswsgcPzkuJeoRanmctGvy2oVbjU0xqfHTsweVlKzyHD+LGuRe9ZUC1Ci8xu+gYb5e8/H0IE8UL2iWaqvurxM0tSHR2nHY9VzpxiORPOT94HZfTPmhojHMqT/cL0v7+u8RKx7tr+Y1kjh8EDlVyz1iYN2m5EpGM7AwrwZt3675m8J/XzUF69bEljAmYhUJyba6wOo5RsMr8OTv4gqJ6x9LYblEnAVg990xcvjJauOjZXyB2lUhow5GWZ8RVUcomJRf6b5Y/25UvKsJQc2E/xRYPYLbuD0tqcQuwpRQNZCNnQySo2lKj5kvAqmESCWQTReo7g0bgmLiV+YPWO2Om+4bQCLCop1Fffn4Fj4ya0+SvZP+P/PJg9L9ttXmBip1lcc7UHI6dbWVoqVs6i2hukwpHU07W8GmcZnpLxC6fywBFp5ceX3mq4+Rwa3RflFHWofDKaESP8fORq7NP2eR0TvvKyyl0FXzBYHcaQgkHFhA052lDoGTvYncV/zjkYxh3uXAi5fDtdhFK2MdWZXib0P2YlTSeo8KApNFoQsY5OT+3m85ErD8ihcLrCWScnyA9YzHcY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5949.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YUX/z7/BUcTGMkjo9lie2tyH56A3gft+L5J9kLkAJKQ2NbW/r5epaDbltizp?=
 =?us-ascii?Q?6cdeUVn8FpDuc2uslTBgO1HkKrCzegV3rTozd01eXypUV9MN7NwgQOYfXiHB?=
 =?us-ascii?Q?Tg12Jt91uspZvyp3kyQdFsH2OsDFjc2wmWIrPcJ8di8NladvQysHiFjXex8F?=
 =?us-ascii?Q?98sAakzxfrJmHdEB6SjF/SynFEsWKubFebbGRCRRX3uD0nGSayDQc3suCp/P?=
 =?us-ascii?Q?yMXC29N2M5NtnwuFhWUV83VXhp1U7ODnqE7f9NmGH/BFh0cH6GS8Z+ZvbqcH?=
 =?us-ascii?Q?hfTjGkGmLC0srre3K2HJ5Yi0vv9pzfC1kK+R9MlJMTuDMmlDfN1v+or3dTPj?=
 =?us-ascii?Q?Blz6q+9nYnUnbHGhW6DuLE9DsP4AYeM8BBZvvkpZYfebJ988QBA0h/3DjY7F?=
 =?us-ascii?Q?DPRk4WpuvBJRJzmAIkDRI19ta1tqcqryJbiBxwHCFAkBPWxfb0Eos/bPxI7R?=
 =?us-ascii?Q?moC+SxLj/E8pUymiTuKTLVqM+DhLZV7g+AoMdsOBvJg2X0lXCzOzuddEVEjv?=
 =?us-ascii?Q?WTqAiIZ8Ib5tfzxVAKPPKq/Fg8zoTv8KGEtysHCGcuDO1z9me3UzOoutiHA8?=
 =?us-ascii?Q?t1XW1eKYZhmVYun7zIB6Npj7wUx3mPpKZiTdonrHLruG1ddUntJG90KisJKK?=
 =?us-ascii?Q?ySeXtG0uYaZzaSzsC7sSoMNd/MiAoPshKVEoSIEkFpANeHNXItFnzQOJF3TD?=
 =?us-ascii?Q?tUa2zcrlcu2fSPD3zdbMSUWIIgj8Ipm2UIDeyx0gEsMaRT0G3OlFEq/yhZl6?=
 =?us-ascii?Q?T5iumiyPAvqp3nmq1U3/a1NVRo1KF+ovXrunjXjxGvxDBL9c4Zdtm+gxIDW2?=
 =?us-ascii?Q?bCIIJBGxQ7LQ6EwFjKhxvpxcfEk/M3/o3mZGmrNH0+4PuVLZTbZhvXO/Si6i?=
 =?us-ascii?Q?ArHSw7vPM6gLjR/7f9Wp5zy5SuWk8fWW9Uz+wD4kcAl9J7wT6p9MYmKDeLVD?=
 =?us-ascii?Q?2aBZ7WUe9wFyYTZQakS0xTZjfq7KP6ondYijXHvPuFM1djLok0hQ+4dHB9tk?=
 =?us-ascii?Q?aNScKdYUNb1cbPGPaQXOYl00bkNDWTbHkjEamFgLPs42TKG7vV14fBSNXnRh?=
 =?us-ascii?Q?gxm2ZN4332wH7aWzoVX4IhKtHGRkLI9BYn+xQjwS83BjAZJgdIzV67xkhwU/?=
 =?us-ascii?Q?wnQsJoXVSm7NU8JAO9JminxE83Up8kTQGSb2Uz/NwGr7xspBbUjBz1Oh9ZHD?=
 =?us-ascii?Q?Y2LFfiZnaf06FGnqdVI9tKLtBTk9MTzXJ8/uH9Fvex8Nu1QytOkebNjnB2zk?=
 =?us-ascii?Q?fSsCTZ5k2LNiDgeXropNZkSs4wFn/wHzPCUs3fr3242YQiBAe4vD/qIt4Y1V?=
 =?us-ascii?Q?JlmjIbovhuXjmv/w3gFku7WCWcCeeeyNtHmM6Eu3rAuOtb0bD2eqjerZ7Asl?=
 =?us-ascii?Q?WsYIwRrWxfx91OAQlwduA2D0HGgNnYPK6mBEUZUaczXae8+t0BRAgeJB3Geg?=
 =?us-ascii?Q?H9lGIeZM07E5S+mx5KgFQrKhXgC4t7IV8SHOM7jpiS65DuQv6Rv9kZH/nS9W?=
 =?us-ascii?Q?h1Mu020ZPBp8Udv/EeeCalEVPluTHwKqVLpNJQh3TcfvI26S1d+HhImeXxi8?=
 =?us-ascii?Q?JNsVDq7pGAEsuzS3YZxsstR5Q7JIbA8PkGmIGAR9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5949.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35936c86-15d8-4ee6-5566-08dc5572cafd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2024 13:17:49.9649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V2ZnFNMtL2MlWftbGiOUJD6z6CjhrZ3oyaxn38zEfgk2YWr+HxzZdyinelP2Ya5+13aoNh64Slqo0OJJCOlvjlvpR8ydbCKxrVB3XkDRnYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8589
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 08 Apr 2024 10:18:12 +0000
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
Acked-by: Gandi Ramadevi <ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Girotra, Himanshu <himanshu.girotra@intel.com>
> Sent: Friday, April 5, 2024 6:02 PM
> To: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Chauhan, Aditya
> <aditya.chauhan@intel.com>; kamil.konieczny@linux.intel.com; Modem,
> Bhanuprakash <bhanuprakash.modem@intel.com>; igt-
> dev@lists.freedesktop.org
> Subject: [PATCH i-g-t v2] tests/intel-ci: Addback evict & threads tests t=
o BAT
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> Addback xe_evict and xe_exec_threads to fast feedback testlist to bring b=
ack
> the coverage of BAT and reorder testlist so that kms tests run before cor=
e
> tests to encounter problem caused by "6.9.0-rc1-xe"
> Regression.
>=20
> v2: move evict, threads tests at the end(Rama)
>=20
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 138 +++++++++++++----------
>  1 file changed, 80 insertions(+), 58 deletions(-)
>=20
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe=
-fast-
> feedback.testlist
> index c859acdca..f9dbf5705 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -1,6 +1,64 @@
>  # Should be the first test
>  igt@xe_module_load@load
>=20
> +igt@kms_addfb_basic@addfb25-4-tiled
> +igt@kms_addfb_basic@addfb25-bad-modifier
> +igt@kms_addfb_basic@addfb25-modifier-no-flag
> +igt@kms_addfb_basic@addfb25-x-tiled-legacy
> +igt@kms_addfb_basic@addfb25-yf-tiled-legacy
> +igt@kms_addfb_basic@addfb25-y-tiled-legacy
> +igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> +igt@kms_addfb_basic@bad-pitch-0
> +igt@kms_addfb_basic@bad-pitch-1024
> +igt@kms_addfb_basic@bad-pitch-128
> +igt@kms_addfb_basic@bad-pitch-256
> +igt@kms_addfb_basic@bad-pitch-32
> +igt@kms_addfb_basic@bad-pitch-63
> +igt@kms_addfb_basic@bad-pitch-65536
> +igt@kms_addfb_basic@bad-pitch-999
> +igt@kms_addfb_basic@basic
> +igt@kms_addfb_basic@basic-x-tiled-legacy
> +igt@kms_addfb_basic@bo-too-small
> +igt@kms_addfb_basic@invalid-get-prop
> +igt@kms_addfb_basic@invalid-get-prop-any
> +igt@kms_addfb_basic@invalid-set-prop
> +igt@kms_addfb_basic@invalid-set-prop-any
> +igt@kms_addfb_basic@no-handle
> +igt@kms_addfb_basic@size-max
> +igt@kms_addfb_basic@small-bo
> +igt@kms_addfb_basic@too-high
> +igt@kms_addfb_basic@too-wide
> +igt@kms_addfb_basic@unused-handle
> +igt@kms_addfb_basic@unused-modifier
> +igt@kms_addfb_basic@unused-offsets
> +igt@kms_addfb_basic@unused-pitches
> +igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
> +igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
> +igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
> +igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
> +igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
> +igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
> +igt@kms_dsc@dsc-basic
> +igt@kms_flip@basic-flip-vs-dpms
> +igt@kms_flip@basic-flip-vs-modeset
> +igt@kms_flip@basic-flip-vs-wf_vblank
> +igt@kms_flip@basic-plain-flip
> +igt@kms_force_connector_basic@force-connector-state
> +igt@kms_force_connector_basic@force-edid
> +igt@kms_force_connector_basic@prune-stale-modes
> +igt@kms_frontbuffer_tracking@basic
> +igt@kms_hdmi_inject@inject-audio
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
> +igt@kms_pipe_crc_basic@hang-read-crc
> +igt@kms_pipe_crc_basic@nonblocking-crc
> +igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
> +igt@kms_pipe_crc_basic@read-crc
> +igt@kms_pipe_crc_basic@read-crc-frame-sequence
> +igt@kms_prop_blob@basic
> +igt@kms_psr@psr-primary-page-flip
> +igt@kms_psr@psr-cursor-plane-move
> +igt@kms_psr@psr-sprite-plane-onoff
>  igt@xe_compute@compute-square
>  igt@xe_create@create-execqueues-noleak
>  igt@xe_create@create-execqueues-leak
> @@ -142,64 +200,6 @@ igt@xe_pat@pat-index-xe2
> igt@xe_waitfence@abstime  igt@xe_waitfence@engine
> igt@xe_waitfence@reltime -igt@kms_addfb_basic@addfb25-4-tiled
> -igt@kms_addfb_basic@addfb25-bad-modifier
> -igt@kms_addfb_basic@addfb25-modifier-no-flag
> -igt@kms_addfb_basic@addfb25-x-tiled-legacy
> -igt@kms_addfb_basic@addfb25-yf-tiled-legacy
> -igt@kms_addfb_basic@addfb25-y-tiled-legacy
> -igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> -igt@kms_addfb_basic@bad-pitch-0
> -igt@kms_addfb_basic@bad-pitch-1024
> -igt@kms_addfb_basic@bad-pitch-128
> -igt@kms_addfb_basic@bad-pitch-256
> -igt@kms_addfb_basic@bad-pitch-32
> -igt@kms_addfb_basic@bad-pitch-63
> -igt@kms_addfb_basic@bad-pitch-65536
> -igt@kms_addfb_basic@bad-pitch-999
> -igt@kms_addfb_basic@basic
> -igt@kms_addfb_basic@basic-x-tiled-legacy
> -igt@kms_addfb_basic@bo-too-small
> -igt@kms_addfb_basic@invalid-get-prop
> -igt@kms_addfb_basic@invalid-get-prop-any
> -igt@kms_addfb_basic@invalid-set-prop
> -igt@kms_addfb_basic@invalid-set-prop-any
> -igt@kms_addfb_basic@no-handle
> -igt@kms_addfb_basic@size-max
> -igt@kms_addfb_basic@small-bo
> -igt@kms_addfb_basic@too-high
> -igt@kms_addfb_basic@too-wide
> -igt@kms_addfb_basic@unused-handle
> -igt@kms_addfb_basic@unused-modifier
> -igt@kms_addfb_basic@unused-offsets
> -igt@kms_addfb_basic@unused-pitches
> -igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
> -igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
> -igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
> -igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
> -igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
> -igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
> -igt@kms_dsc@dsc-basic
> -igt@kms_flip@basic-flip-vs-dpms
> -igt@kms_flip@basic-flip-vs-modeset
> -igt@kms_flip@basic-flip-vs-wf_vblank
> -igt@kms_flip@basic-plain-flip
> -igt@kms_force_connector_basic@force-connector-state
> -igt@kms_force_connector_basic@force-edid
> -igt@kms_force_connector_basic@prune-stale-modes
> -igt@kms_frontbuffer_tracking@basic
> -igt@kms_hdmi_inject@inject-audio
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
> -igt@kms_pipe_crc_basic@hang-read-crc
> -igt@kms_pipe_crc_basic@nonblocking-crc
> -igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
> -igt@kms_pipe_crc_basic@read-crc
> -igt@kms_pipe_crc_basic@read-crc-frame-sequence
> -igt@kms_prop_blob@basic
> -igt@kms_psr@psr-primary-page-flip
> -igt@kms_psr@psr-cursor-plane-move
> -igt@kms_psr@psr-sprite-plane-onoff
>=20
>  # All tests that do module unloading and reloading are executed last.
>  # They will sometimes reveal issues of earlier tests leaving the @@ -235=
,3
> +235,25 @@ igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-
> rebind-prefetch
>  igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-
> prefetch
>  igt@xe_exec_fault_mode@twice-invalid-fault
>  igt@xe_exec_fault_mode@twice-invalid-userptr-fault
> +igt@xe_exec_threads@threads-basic
> +igt@xe_exec_threads@threads-mixed-basic
> +igt@xe_exec_threads@threads-mixed-shared-vm-basic
> +igt@xe_exec_threads@threads-mixed-fd-basic
> +igt@xe_exec_threads@threads-mixed-userptr-invalidate
> +igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
> +igt@xe_evict@evict-beng-mixed-threads-small-multi-vm
> +igt@xe_evict@evict-beng-small
> +igt@xe_evict@evict-beng-small-cm
> +igt@xe_evict@evict-beng-small-external
> +igt@xe_evict@evict-beng-small-external-cm
> +igt@xe_evict@evict-beng-small-multi-vm
> +igt@xe_evict@evict-cm-threads-small
> +igt@xe_evict@evict-mixed-threads-small
> +igt@xe_evict@evict-mixed-threads-small-multi-vm
> +igt@xe_evict@evict-small
> +igt@xe_evict@evict-small-cm
> +igt@xe_evict@evict-small-external
> +igt@xe_evict@evict-small-external-cm
> +igt@xe_evict@evict-small-multi-vm
> +igt@xe_evict@evict-small-multi-vm-cm
> +igt@xe_evict@evict-threads-small
> --
> 2.40.0

