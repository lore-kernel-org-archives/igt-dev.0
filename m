Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE53ACAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 07:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E43110E3C0;
	Mon, 22 Sep 2025 07:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRCxqDrK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D619110E3C0
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 07:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758524426; x=1790060426;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PPXZDp39IxzKzTqyg61Wer+/iYWqWp0NesKexvMc2Fw=;
 b=WRCxqDrKzOQxGZgTr06KdtcB0tlWdkYkNS4yd8baBDaGxUB/VAo9mQna
 emgutgpgawtPUC3fPvkhoky1N3Ul84nItGZtaLM8rL07xiXS/mjZQPqfW
 IEJkDK87wJFwv36dQXWNjT6XO6QI6pVrBlhioTKu+ucVxbIe2Mc87Nwja
 1tbcxTSjyIP4AxPJAEBvevu+KcoM82ZSr9sfPghV/WWxR4wBpr1kFkALD
 FiBcDp8+tBJmh53kLjInOFxq1H9eSgI5URbBpJRzMSz5u/NlqBfAcPLKu
 evWEQvsOW6ojQBhP6dDK+KJ2cxBmH5kVLXX9o0KLDufDcGtCOM58Um3tn Q==;
X-CSE-ConnectionGUID: t3P5q22BTP+qYibwtU23Hw==
X-CSE-MsgGUID: M6tW3r7mQuqjQLtsGpe+EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="71404579"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="71404579"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 00:00:26 -0700
X-CSE-ConnectionGUID: pH35nZa7RiGpm2pA7wz2eA==
X-CSE-MsgGUID: M8BFHd9aR/uWnx2hQotaTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176310515"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 00:00:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 00:00:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 00:00:24 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 00:00:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeIGtNcWsvtRHf6JmRvz6AcsWd4fW+/o6jSgyWx0ANu0dXWHqoTqsd7h+qgwfL1GkRZrfTN9/iUsE07Q3x+HCy589EI67mo4OLgNEhcBfamz5PsQSS5zvRSD1OZxr25Kv6BtdsjL4EXUabeowRQlczyFc2jvQMpnoR247y6TBUbxVhxuu9kzeyutkc2x0aRKDvrFWJs0ehzzViQqtu6MoioLjRdD2iPuyyE6oC6mhFdhUQmwoNqAfUZz1DYalnRQEvk/b2HR5Htk2za3eEQaCfMJFzvTVQPsAVn+8jm4TtKb1Xp8++YkaZahNDPEyhN0KZ0rKJ9gbB3+Oykv/V+Zqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjxfpARRk6kZ1PzELr85XYChCSvloUto3/egrZ/d45A=;
 b=kMDzyjwpyZ2nlI0XyxyASzWWL1KAQXiBC215xlT6QdpZ6GKeM6G4wTyk3z8ZUNT8DFwLy6PFzPr/0cby7rwhSEWSChsJYaNmN0d+Lo8rajvfJNfkNFoq1i5wL79xeMOf3J+IsHyj4hWwB6jIeySVHYX6rWpoVsjfbkkuia2oapzCeMFealikGo8AXLvbaP74hGUb5jTAKu05j8CGoq/Rblr+T7PSHnqmSg01vMvqfSf45xkg0Fcgslsm2RqVDJ1LmIUMqFoHFSSGCEf+4WXcsNVuWnnVnOzEJl/Oi9qAqlSb8VOdngJtbZ4A43Cq5+pCFXR7wmR3CwhvS38uul22jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA3PR11MB9352.namprd11.prod.outlook.com (2603:10b6:208:575::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 07:00:22 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 07:00:22 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Balasubramanyam, Smitha" <smitha.balasubramanyam@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "Balasubramanyam, Smitha" <smitha.balasubramanyam@intel.com>
Subject: RE: [PATCH i-g-t] lib/compute: choose BO alignment based on driver
 type
Thread-Topic: [PATCH i-g-t] lib/compute: choose BO alignment based on driver
 type
Thread-Index: AQHcK4eyz4Vr8mf1CkKX1HdWg8Tw7LSexegg
Date: Mon, 22 Sep 2025 07:00:22 +0000
Message-ID: <CH3PR11MB8434684B1EFD0BF3B104C86E8D12A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250922061621.509408-1-smitha.balasubramanyam@intel.com>
In-Reply-To: <20250922061621.509408-1-smitha.balasubramanyam@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA3PR11MB9352:EE_
x-ms-office365-filtering-correlation-id: d7ea489d-c5ec-4bd0-f180-08ddf9a5b306
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?U9lAmdnJORPgrT0QipSqPMzbPxEcUOcqObKevEq6dmyBpOcgNY+OKpy6fxXF?=
 =?us-ascii?Q?NJZnKBqW5cUR+LUAJJRN68+HOb1lYARArIcBOPNOD+F1805NxrZDE3C8Pf5i?=
 =?us-ascii?Q?suNhT7AyA0RQ5ZlFwbTNwv71CkHJqKojapZ3l1m03yjxw3XwdRIpd8mk18pd?=
 =?us-ascii?Q?RieWmk9hXcvPDfOJOfzPx2dh11MPGJKj/7tIj6/kf+dB+CChCAbO3DXCBvje?=
 =?us-ascii?Q?u1L2itx+zqWxAJG+11xiY9xjgKhTC5l8y/nYiAHojlBllr4rqdmOXgvCA5RA?=
 =?us-ascii?Q?Qu6j7CLc1LbKnROQ1UPnfuAXNwGGPGPSMJ/prJNbagPvXPvlZFezjRX30ts0?=
 =?us-ascii?Q?+T+KNSrNdd8RduZQwNKOgtgxkTL9O6LVBq0J63GKzAynNaMCXLAF3x4Zo3w/?=
 =?us-ascii?Q?uM20P9jPB6cxjcmchqDpZdRls6qjqIQsqaTyyUzLM6DSzpopcPgQmc+sX5ag?=
 =?us-ascii?Q?6cAjfeEpb8QSXvAQ1nAEiK0q0hEfgGwczI7GmJEgmeX3uk4DOREWDHsK8xjV?=
 =?us-ascii?Q?mNuOPoqOcOf4n+HJCkNk37ARjFe++8WkAzx9ykVnJOEL4xhFDUZkocCBl34q?=
 =?us-ascii?Q?9u3CXHiXPUu4Qs0LpjgcLgQUfbmqw0yI5Hq+t8btZXr7yNIbj2ufG22G/bXr?=
 =?us-ascii?Q?HHFheTlrh7JahU2DcI4zIijPi2sU8zhPaDJfSJ8nnsvueHDhRqiHZvIou2fA?=
 =?us-ascii?Q?CrXNfuBCPQdM2FrrI1RQGpW/XJLsJahY1mrMqMlUkUisJX+RyNKPHE0HurIh?=
 =?us-ascii?Q?LFTwb4hiVmQ8KlQUCrsxF9v8ToX4JZ73odjqm1FDVnNGP+QYS/h1FnCbjMKa?=
 =?us-ascii?Q?7jb9fOdNu0VsZ189jGJ9EHr89itegGobUZRnsue/qOy9XHw/2zto6RRoqVQv?=
 =?us-ascii?Q?CNFdoUehiTHpKpeR51Eh7izc9VmbM6gYfnUYDxaplonxIjiekAbhttafRnnh?=
 =?us-ascii?Q?QeXwFOX8bxl4PxXC+6yZ8rFv3gpcNaQKt8znhgNmr70YnQeT2P75VnYCrLYI?=
 =?us-ascii?Q?1cVKl1WpgyMcLRMj2mw2U6FSMBUhpGGe8LERdE/h2/0RT0MkUNrwl8JB0sHG?=
 =?us-ascii?Q?DT+UDwHtv5vVIC1AvzmFU47Mw6JeV8jcI4uBAN8GGASERg4eMr05iBq1g7WC?=
 =?us-ascii?Q?6FVJBKtPWaZ/zzrmK0Zc4PPpyv0BMohPk7r4uAq3PSBm+qynJR3XOnQouvQ1?=
 =?us-ascii?Q?erOsWDMw1b85+0zzKQf7489vxNiJ0QuWiT1km4u08cSS+OFWxmAab7zbz76Y?=
 =?us-ascii?Q?Gh260WJjsI/AHFeW8uMV3GOcnTsUbKrLzJpuhAFp5kfU+aEHl+l2XHxcyi2P?=
 =?us-ascii?Q?dnFDpfSvSCy/0ohlW2P3za04H6dSbDYK1cTvjQiidN0tvuuHNbbNJKqVuCNd?=
 =?us-ascii?Q?0jPn1mRUa34Jm3gPIymq95e1r9GegZjs3InrEkp2O6qLTdakeyZangcVWZqV?=
 =?us-ascii?Q?CmsTeWAZWt9WpHk9UnHrWQLn3wyjepkbhZQwuckkPw3yip+Mllx9WCXVHx73?=
 =?us-ascii?Q?NM+GdSekXEpYtSg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MBLZuiXs6VLHPUB+ijx2pJjq+o8Yib1GQgj3zZb8RcCLWlopESVkHdadTMnK?=
 =?us-ascii?Q?S87HrWVEdttxWSIyLF9yvvRiIcskdCr8X7AsrS6mDvyNA27g//ACVaz7M8XZ?=
 =?us-ascii?Q?MC3PerfdmBmK3rLOLbSq8UnjoJySob0C7IC3uLKJhBxJI3G34GNKJ8DIVAxM?=
 =?us-ascii?Q?SN6ecAtkZopQTHesg5Way+gEJx24fVWkozX2fn0dIwhw22x/F/iBNtqZgaaN?=
 =?us-ascii?Q?MjoMb9a40Pt12ShCWehpFN2jTve/0zBWyGKCkeo2zXXUZ5USem84KBs08ELH?=
 =?us-ascii?Q?0X8QASRm/Jw+iVPVsUBpEMCSDd30rThnd9Ks8OKoFW86ZZAvakCSafvoMsBH?=
 =?us-ascii?Q?h7v/lInE1NsSjK+Eu8qbUtOkhianI9iZxS57pana0cxpSiITvrnOz1X7hNNH?=
 =?us-ascii?Q?o8K8yVaVG9n/DUcbZmNsAlUXKWqd/v+yaqrF1zMc1xJUZ+Oy9LbXOK/hg20L?=
 =?us-ascii?Q?QMI1J8HO5WelGlmCGrFbMRMKSwhYbs0+XdoGouuyDD2oq5ptYxW1jfKZM4X4?=
 =?us-ascii?Q?Rp5bOjfLNuMj7lob5JpHqADh65uqYzT1eeDW/uBRB9oZxg/dGeBQPL+pyPUO?=
 =?us-ascii?Q?MagegfnmbKc+Lo/btht5H0ydxhKkx9S8LcNXJw6q6gQu49Hj9K7gB67rketT?=
 =?us-ascii?Q?PZuQwYHj4ZhQdm3e+BbiYujEMubNr3ka37ZPT/U2uBxBR8gKmcloLE8Au37U?=
 =?us-ascii?Q?rnp9c6YVyLc20nSrREiC24rASa4Jpj+cfhRi2jFZP4NX7FT33PUvrJyfy1+2?=
 =?us-ascii?Q?J393wl7gOMsfsIV1qjEA3xMyqKb1R+iAFe5swRZE2FD8qI2YF4j1jQ/oCmJz?=
 =?us-ascii?Q?D9gBb4IudvMV2OYWhtbrAGTWBBFgHzbi9YZPGvGCXQi2rV9EvL+7njkiC8IX?=
 =?us-ascii?Q?JEf22Zo7l99kiik9YhDpyuqpKWp+cLJRJOB+2y8JSLW7EcNEaMeleNtwfmzz?=
 =?us-ascii?Q?88B0b6NMEb0638WOdkyVQzDPb3twxSEct8gIE6MHVUpFZenPFUAXIVDAulCR?=
 =?us-ascii?Q?ZojOJenCyzvXLtPSFv8UIzDjgFZS1/MuNeN6jRE8caH5c2bFW599LS3r1i7+?=
 =?us-ascii?Q?qp4nXpihWVLy3az3dCP9aDcGrfv8NtwpvOGF65xfAz3bIY8lCrRnIxeJxp0K?=
 =?us-ascii?Q?E95i40m+1ildECZJPtOZ7k1vZV+olyfERJN9LYOpXoPA/lMP2IfEwm2OmHFs?=
 =?us-ascii?Q?Oqf7l65HIeF7UMJRJbOFk7B2OfYQND9nHwfA1+9xtOZgdyT/Yjbi3EzVmQut?=
 =?us-ascii?Q?6IhQjWmTMNBluuWGEPgMe5lr+fAGPW58COmQhtziuc8y7AEq5ObXZ+DpW2TJ?=
 =?us-ascii?Q?1ojl4R0QdiCtZ/uFKT7N747yJkhpdvOlq3OKH/QUjxN13a5o9dQF8QD9d1R0?=
 =?us-ascii?Q?BltiGjaXZl5gJHt6XkrWAtkYkoqWcxO1IWkHkBptuGcSqZvy4lHgE9c/obL/?=
 =?us-ascii?Q?hvyW9pznN4kFz7UukUJXoksJ9a29RKJTUKYfKtBbjCWkkkdwjT7gMxfyCQtS?=
 =?us-ascii?Q?dwioD3AdlhYnPGFI/VrjhdxNc1UydTtjQJhfABN8uQi3fLc05YfwzFeTROJs?=
 =?us-ascii?Q?FpGN5zwy0t2MHwq6OHJ1HKEGY503C3LXFZBiEWw++6YPh/eI7ZMAoIWoHujN?=
 =?us-ascii?Q?rXbO0NHLyawuJ0heL+BquYcubgKpsGTIL92CA8aBT72xkWiYdIpYbFYiCm9M?=
 =?us-ascii?Q?6aKIew=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ea489d-c5ec-4bd0-f180-08ddf9a5b306
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 07:00:22.4845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s7IQ5+b3PkWaEdhPtfdAQM8GBXm4XbmCJ7G4aa8MfPJE8sSj9AWgX7ATZreLuARTRXPi2Oc5A/zQkl832Nman+uPdK8hgHHkSnXzMN5F9hA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9352
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Smitha
> Balasubramanyam
> Sent: 22 September 2025 11:46 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>;
> Balasubramanyam, Smitha <smitha.balasubramanyam@intel.com>
> Subject: [PATCH i-g-t] lib/compute: choose BO alignment based on driver t=
ype
>=20
> Previously, BO size alignment behavior was inconsistent:
>  - For XeHP compute, xe_get_default_alignment() was used.
>  - For XeLP compute, a fixed alignment value was used.
>=20
> This patch updates the logic to select alignment dynamically based on the
> driver type:
>=20
>  - For Xe: use xe_get_default_alignment()
>  - For i915: use gem_detect_safe_alignment()
>=20
> Signed-off-by: Smitha Balasubramanyam
> <smitha.balasubramanyam@intel.com>
> ---
>  lib/intel_compute.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c index
> 147dd2916..8011e8360 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1133,8 +1133,11 @@ static void xehp_compute_exec(int fd, const
> unsigned char *kernel,
>=20
>  	bo_execenv_create(fd, &execenv, eci, user);
>=20
> -	/* Set dynamic sizes */
> -	bo_dict[0].size =3D ALIGN(size, xe_get_default_alignment(fd));
> +	/* Set dynamic sizes depending on the driver type(xe vs i915) */
> +	bo_dict[0].size =3D ALIGN(size,
> +				(execenv.driver =3D=3D INTEL_DRIVER_XE) ?
> +				xe_get_default_alignment(fd) :
> +				gem_detect_safe_alignment(fd));
>  	bo_dict[4].size =3D size_input(execenv.array_size);
>  	bo_dict[5].size =3D size_output(execenv.array_size);
>=20
> @@ -1733,8 +1736,11 @@ static void xelpg_compute_exec(int fd, const
> unsigned char *kernel,
>=20
>  	bo_execenv_create(fd, &execenv, eci, user);
>=20
> -	/* Set dynamic sizes */
> -	bo_dict[0].size =3D ALIGN(size, 0x10000);
> +	/* Set dynamic sizes depending upon the driver type (xe vs i915)*/
> +	bo_dict[0].size =3D ALIGN(size,
> +				(execenv.driver =3D=3D INTEL_DRIVER_XE) ?
> +				xe_get_default_alignment(fd) :
> +				gem_detect_safe_alignment(fd));
>  	bo_dict[4].size =3D size_input(execenv.array_size);
>  	bo_dict[5].size =3D size_output(execenv.array_size);
>=20
> --
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 2.43.0

