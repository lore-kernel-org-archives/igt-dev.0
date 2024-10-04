Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82B6CFA745
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 05:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513DA10E0DD;
	Fri,  4 Oct 2024 05:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CpBxjXXl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9AB10E658
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 05:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728019186; x=1759555186;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=NTRxN0cF2ENERJy71HchiWtcN1rqbNcQ3eM5UaX4Z/k=;
 b=CpBxjXXll+G44a0vo1/8zNlGQX+KCn5sl2dxRSQodarg3qAFfXuF0lwr
 wDwlHlxX99wk18mBX4PMaWsYGH7ao5RFPzF3lc0ShyPnCO8s1uWIHOP64
 llmV2BwFlz3o/jGzk8xVsAIMOcKgF/VvBTBttdsXPfqgI6iN7f1PgfIqM
 JGyqrK+SNiDMb+nMLA2VuQLesylbTy9lN7c5Frjvv8ijNgU0AvUPGelQW
 ijh0dVR5qwkLay5CKj0Q3zcSshO4Rwod/XuTFaBcWwDvQwwbShLAWEilp
 tmrrFruh3ptx4tNYECM1RNalv1w0/wTRIGLoag1drXCQg+97mkReYKv2c w==;
X-CSE-ConnectionGUID: 5hziWcBZQAS5072fflw2Wg==
X-CSE-MsgGUID: DkIAeuCyRX+7ooV7uqsUPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="14853565"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208,217";a="14853565"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 22:19:46 -0700
X-CSE-ConnectionGUID: UlGioNNGTdy2G0ziiwsKEg==
X-CSE-MsgGUID: 1MmGsx98SDeFhcIQhwzKoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208,217";a="74278712"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 22:19:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 22:19:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 22:19:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 22:19:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 22:19:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDQwblwoWjCrg8UVYtkxPVuUuCI2D+M1vVyNSfnYG7cPRkRM0y1CpnOoR1eR3X0yBBDpjXtJ3woixpAiZcqGZZiQ0zKqfN75oIqFK/EcODM9YeD6Mukg0z0XHTA/Oc+rb6Baxyn/bnfb4eCWeRl9xFVDVuBs2p1pSa7LdyTszCxjA2pUKZwlgi6GklCYzPHbQ77/TwRgMFyG5STMoCzPzuNn+O9Trd4n7+sDDdBu11c9oiYO5UVPYz8BPnJnAYHqa8zFbcRwDdADhe25AfV539ozhSBY8lz8FH3/bZf5uGUluEd8ueyszNF8oLEr4ir9WALnOTTbLyg02Cwmqj6XDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XlYSDSNIcE4jKb8nmELIvh22DYuEdojuPQAq5UcRlQ=;
 b=jdy+/hf7l+zFTbH48Gb7AC02qEpZ6rJKNnVynqdYLijAIz+IflB06rhvCBl7oqSOBty0yvMw3ZfMUaxnSaBU30RFE0t5/88Y+weiJcEXrGbk5+Hv93C+83640m/4tzDRSu+myT/aMZLdd1ZLkJ0yNkimxE55OFevags47/mTMd/tZcchOM3CS+odXWlbXZbLcxxJohEgQNxOu0fA0O9dlFZlpCmdJsx+lbxAlHrqe217L6h6BRJwtLNKuAb+X021QiMu6DJyHzzo6Ui82uNM4po1JF18FwqibNKtBHd00xKrb+BaXbZ64opomUBKziI0q34V3B28wO89pBDruJ6MuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by MW4PR11MB6981.namprd11.prod.outlook.com (2603:10b6:303:229::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 05:19:42 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 05:19:42 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Topic: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Index: AQHbFNtF8WL1idnY80qJByEWkXMYLbJ2EE9J
Date: Fri, 4 Oct 2024 05:19:42 +0000
Message-ID: <SN7PR11MB675059F459088B309491341EE3722@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241002145503.910536-1-santhosh.reddy.guddati@intel.com>
 <20241002145503.910536-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241002145503.910536-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|MW4PR11MB6981:EE_
x-ms-office365-filtering-correlation-id: 077b8001-7753-4dbd-88d8-08dce43426d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?41T/eJfyKc43Ld0vnsT/zifhh4h9mQyvmrlmOxgmKPQZV0axso9qCTX6WltY?=
 =?us-ascii?Q?Kp1yTGTOlI4ZHoN9dJyVbOVwgjB5CAImuxs+u8a0ARuyYz7ln45+akOpG2XF?=
 =?us-ascii?Q?+JlW6CG74IyJ89hmS/LcEACwC8KqSvztXUi6K7wWfVAwhyEgWuR+X4dtGwuC?=
 =?us-ascii?Q?AoV3NEsPj4AsZeDh8UXgVKuARetjXk6PvrLGO5rJmskJI0hoIp9uwGHc340j?=
 =?us-ascii?Q?wNvjnck5/hJaUMfH0xlucRAVdOm4oZlDBNICpGm28rtnfB7800IS9TqxspvJ?=
 =?us-ascii?Q?ZbRENsz/8XZDtqB74N4IPS8EBdpgnTTA/O3z0Ji2uMDJjSjE1/SBGAj2vPZK?=
 =?us-ascii?Q?neyABGvrc29ASBEO0RSJtB34Gtp641paujALnKLlDvkGfp9De6aGjzSKtzLl?=
 =?us-ascii?Q?M//0Mvi+W8LeThWwfchEGvGLf1tP8v1a34sXJFq7c97MWkN/SlL69LSCCp+R?=
 =?us-ascii?Q?9RL7fDV/qCJAyL/ayP2vyLbhZa/kBChCQ9BnV8xmNHagN7nvELeiR9y46T7s?=
 =?us-ascii?Q?kHanQFQo5+I8PMpWnpvGC8E2RU9lRGhwmBnIUWO3gOWUeWV0f0Egr5rbd0QU?=
 =?us-ascii?Q?zd4RB1oQ+nm9SX1cvlLqzpyDWC0tP1fADiYQpoG5rDsY0hoFD3Vsmble/oRk?=
 =?us-ascii?Q?nX4g9HoFCb5+0nwomwvLdIoPgyOntPwxDCDKwsz8hblDnczmlyZWHX4hdVFm?=
 =?us-ascii?Q?chhWxk2I3ks8a1LAmH5mIgfIpoSFDmrdxUUkzzgnkId3xwJwxQUDusqY1YVC?=
 =?us-ascii?Q?lScZ8SEvVJQ71bronSAj8hoxlJCZFU0uR8iwd7YkVQ5EdASUSvyt2otO7luN?=
 =?us-ascii?Q?otb6eajySlPfCnNt+tmO959+CNIaPPorBkuujAYTS5q+nxBLVb4U+NPfySiH?=
 =?us-ascii?Q?FRcChK49OQpVqQpsmtU7QnLwzGuT+kFEnutXQWkl/XVhUvEi27cfCVc/IH0u?=
 =?us-ascii?Q?YWbVHOsFy1vnpuCFeE0PlrqNb46UfHU8eYAI9QdsMKolzgdcjgTvaxkTKtBB?=
 =?us-ascii?Q?+F5OYh7ic4cde3TcQMhv4LW3pSjMnnGmcW0WyIKA8wgfay0IN2xhkDU3MAvv?=
 =?us-ascii?Q?7GcC3OweWF/TE8yLkyZNEohC2zteCmdAcP8nspWeX1lWydPmGposDzFQcsmg?=
 =?us-ascii?Q?hCdbA79IZfpcHlPfw4JOYdbmmXxdGTvBtotBn/a/zzQ+ZteT2NUfGyb6j9Ga?=
 =?us-ascii?Q?cKc4ZLpTyODnfLKol+dWkesuPpvuHURM19ZjREZa5zZYQxoXjHtgr3uOt216?=
 =?us-ascii?Q?jJGGtFGEfQwL/PSZqpWdsA/KtiD9Z9xqegHPLu8yUiMTV8QHpowMvFDQLTln?=
 =?us-ascii?Q?hPhuSGDU8jcowAh+b34kVQynsjmmODoD0iMvgidpx0JpRA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MnLzuU8uRssfPq67jtO2MZY7hUQyWclYUu3J9+0XtTZH5jKVC8CVeqGj5/UB?=
 =?us-ascii?Q?KlVwPtXB6CEhRHx2WIMudgHOtYRR+ghou9hsXaZ6VYSOBbEtM8+6dwdwIhPg?=
 =?us-ascii?Q?jB38JhfWHcCCp1bK0XVxg1cvgNsoYHY+rpvDqQ59/D4WANbsYUeC3lvhmEem?=
 =?us-ascii?Q?nar+iGGJNVF/fdhLHUSbYX/yZnTyrYoKbv9NQAoIxdXrOL6r0dYQr2YezXBD?=
 =?us-ascii?Q?gMPWBMlVSStjZP29lf5YjOfV14rfRoe6dAHuOw0P/8unGgeiADxjHG3XTs7B?=
 =?us-ascii?Q?xMmDz3fYvHgLfTXZnn93xmUJ1rW+LlrSrnCI4V+MnKV+SOb8t06nyDvrrpYm?=
 =?us-ascii?Q?31JhtCvbfLhak/D9SXvprr8dD2RrtU3p0CVUW5H6iRnBClpBAbKVU+elV56m?=
 =?us-ascii?Q?tzpvP0sNRnwxSDgOm+NQl12tCdEkz4hSufplw9SvNJ8LcD8WKfwcM8TSSCku?=
 =?us-ascii?Q?ABtWneELRHtIOBU7jhwwe0ztQdHyJClyl/7zKjx6xmEjfcJxHSKT/FHDAfUo?=
 =?us-ascii?Q?W3ul6Fk8EyiaW2LuHYtH7wD4xhgoEgRBXcvpfva5fODirrBvMnRMbL2hawNY?=
 =?us-ascii?Q?Ub0XsTVvufvpBFAFzMDAMdm+VJH3bWK2506a5FqetN78bdW9Vykn/65bw4pN?=
 =?us-ascii?Q?IOha0hhfDA/wG1n1L8xwZXXk1JrR+23AFEykVRINBwgWnrxvM6DcCfLFesCR?=
 =?us-ascii?Q?lvpOaaVNE1D9cIcTWCkYO2rCJNgpS6uz0MmqvFMjPkEuNxjyJm9Hf6c3xAtp?=
 =?us-ascii?Q?bN5wKSXooL2X9PqGcgCC59Db+UZPGQA3X+L/4PUytQ5fBl4Gpx+tDM/J1wBW?=
 =?us-ascii?Q?AuRAhwPNJxTWCz1qVmOim8cDXhUQygOQE2j+2MTNiCDrRVZ0SI+Gq2xmgkjr?=
 =?us-ascii?Q?G7yQH278wOv9j02IwUNDiukk7h1HuD9UCX0u1T4319c/X/v2UkwwHoZoSszm?=
 =?us-ascii?Q?csgjitVXXnCBg0jwAcSuSKZt/1ql1IE0twGrPwt7sKeZmi6YldiyKqg51tnS?=
 =?us-ascii?Q?rWhwr6qfeMaQB68rYllhD5yO7xXSrN491QDW3N2dhfNz9m2Z7sNiRORURwSx?=
 =?us-ascii?Q?BSUZHKD9M2bsLqio7TkBgvseh0sRKS7RmUGZ8C09+NOpZXIX4/Ue7sVO5qQH?=
 =?us-ascii?Q?P5ScAQI/fsO5RQCYnYVibnFETRarte0V/NHiQ9Ps3089kP5xE+PgPU/wckvM?=
 =?us-ascii?Q?dx63nFA3neBNTcDOzesYjmV8xf5/jR0lbtevb05bpc1aHimUWgVnwiInienE?=
 =?us-ascii?Q?6u9SFnIlu3F0NwbqnxhNnKi6cFGOFIEio+B7pHT/3jEs2UPwnUgLhMwcY9ma?=
 =?us-ascii?Q?TSz8bntgO7OAdGQzlwMbK+55np/tbyBaJbRJh4pINyRPktTDIgTCbbRsIFw6?=
 =?us-ascii?Q?BjT5DvbluNbsKFQOO5Fzs19wlXKcvruWpq31VL1tMjd22mY50JA4fhnjteAc?=
 =?us-ascii?Q?rOGfpkY380NCp9j2Yv5I7OmCNhihXkuXmO+SB9HszwcLijBcB9Xav8NOUQP6?=
 =?us-ascii?Q?l44m23i/eOhE19ikyraCe0o79PYB6cDjfV4fRG0dO3OQOaVdoaxGvtq+2qVN?=
 =?us-ascii?Q?88M3aSERjgQSeeiqllnXF+mtfKmb+YTyoOaugU8Hh1m6nxn/2F60RlSrZSDH?=
 =?us-ascii?Q?kQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN7PR11MB675059F459088B309491341EE3722SN7PR11MB6750namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077b8001-7753-4dbd-88d8-08dce43426d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 05:19:42.0314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z+aiibAJBW+eAfj3zYtJkIEDUcBdo9X8/QbbeZoSK/phjmUXfnnmAvnddGjWgUYX3wLOXCI+P7BaNO/4Pq952A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6981
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

--_000_SN7PR11MB675059F459088B309491341EE3722SN7PR11MB6750namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
Sent: Wednesday, October 2, 2024 8:26:33 pm
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Samala, Pranay <pranay.samala@intel.com>; Kandpal, Suraj <suraj.kandpal=
@intel.com>; Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation i=
n HDR mode

Add subtest for backlight control on hdr enabled edp panels
by changing brightness via sysfs.

v2: adjust brightness range, refactor and restore brightness (Pranay)

v3: reuse functions, add flags to avoid duplicate code (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_hdr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f123c6b36..0f07e770b 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -64,6 +64,10 @@
  * Description: Tests static toggle with suspend
  * Functionality: colorspace, static_hdr, suspend
  *
+ * SUBTEST: brightness-with-hdr
+ * Description: Tests brightness with HDR
+ * Functionality: colorspace, static_hdr
+ *
  * SUBTEST: static-%s
  * Description: Tests %arg[1].
  * Functionality: colorspace, static_hdr
@@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bp=
c switch");
 #define HDR_STATIC_METADATA_BLOCK       0x06
 #define USE_EXTENDED_TAG                0x07

+#define INTEL_BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
+
 /* DRM HDR definitions. Not in the UAPI header, unfortunately. */
 enum hdmi_metadata_type {
         HDMI_STATIC_METADATA_TYPE1 =3D 0,
@@ -100,6 +106,7 @@ enum {
         TEST_SWAP =3D 1 << 3,
         TEST_INVALID_METADATA_SIZES =3D 1 << 4,
         TEST_INVALID_HDR =3D 1 << 5,
+       TEST_BRIGHTNESS =3D 1 << 6,
 };

 /* BPC connector state. */
@@ -448,6 +455,72 @@ static void fill_hdr_output_metadata_st2048(struct hdr=
_output_metadata *meta)
         meta->hdmi_metadata_type1.max_cll =3D 500;   /* 500 nits */
 }

+/* TODO: Move adjust_brightness to lib/igt_sysfs to reuse in other tests. =
*/
+static void adjust_brightness(data_t *data, uint32_t flags)

-----------------
 Do we not have a function in kms_brightness to manipulate brightness let's=
 reuse that rather than writing the whole function here

Regards,
Suraj Kandpal

----------------------
+{
+       char brightness_path[1024];
+       int brightness_fd;
+       char brightness_value[64];
+       int current_brightness;
+       int max_brightness;
+       int read_brightness;
+       int fd, i;
+
+       /* Get max brightness */
+       snprintf(brightness_path, sizeof(brightness_path),
+                "%s/%s", INTEL_BACKLIGHT_PATH, "max_brightness");
+       fd =3D open(brightness_path, O_RDONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0=
);
+
+       max_brightness =3D atoi(brightness_value);
+
+       close(fd);
+
+       /* Get current brightness */
+       snprintf(brightness_path, sizeof(brightness_path),
+                "%s/%s", INTEL_BACKLIGHT_PATH, "brightness");
+       fd =3D open(brightness_path, O_RDONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0=
);
+
+       current_brightness =3D atoi(brightness_value);
+
+       close(fd);
+
+       for (i =3D 0; i <=3D max_brightness; i +=3D 50) {
+               fd =3D open(brightness_path, O_WRONLY);
+               igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_p=
ath);
+
+               snprintf(brightness_value, sizeof(brightness_value), "%d", =
i);
+               igt_assert(write(fd, brightness_value, strlen(brightness_va=
lue)) > 0);
+
+               close(fd);
+
+               /* Verify brightness adjustment */
+               fd =3D open(brightness_path, O_RDONLY);
+               igt_assert(fd >=3D 0);
+
+               igt_assert(read(fd, brightness_value, sizeof(brightness_val=
ue)) > 0);
+
+               read_brightness =3D atoi(brightness_value);
+
+               igt_assert_eq(read_brightness, i);
+
+               close(fd);
+       }
+
+       fd =3D open(brightness_path, O_WRONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       snprintf(brightness_value, sizeof(brightness_value), "%d", current_=
brightness);
+       igt_assert(write(brightness_fd, brightness_value, strlen(brightness=
_value)) > 0);
+
+       close(fd);
+}
+
 static void test_static_toggle(data_t *data, enum pipe pipe,
                                igt_output_t *output,
                                uint32_t flags)
@@ -483,6 +556,9 @@ static void test_static_toggle(data_t *data, enum pipe =
pipe,
                 igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown=
 EOTF [0-9]+\""), 0);
                 goto cleanup;
         }
+       if (flags & TEST_BRIGHTNESS)
+               adjust_brightness(data, flags);
+
         igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);

         /* Verify that the CRC are equal after DPMS or suspend. */
@@ -685,7 +761,8 @@ static void test_hdr(data_t *data, uint32_t flags)

                         igt_dynamic_f("pipe-%s-%s",
                                       kmstest_pipe_name(pipe), output->nam=
e) {
-                               if (flags & (TEST_NONE | TEST_DPMS | TEST_S=
USPEND | TEST_INVALID_HDR))
+                               if (flags & (TEST_NONE | TEST_DPMS | TEST_S=
USPEND |
+                                            TEST_INVALID_HDR | TEST_BRIGHT=
NESS))
                                         test_static_toggle(data, pipe, out=
put, flags);
                                 if (flags & TEST_SWAP)
                                         test_static_swap(data, pipe, outpu=
t);
@@ -734,6 +811,10 @@ igt_main
         igt_subtest_with_dynamic("static-toggle-suspend")
                 test_hdr(&data, TEST_SUSPEND);

+       igt_describe("Tests brightness while entering and exiting HDR mode"=
);
+       igt_subtest_with_dynamic("brightness-with-hdr")
+               test_hdr(&data, TEST_BRIGHTNESS);
+
         igt_describe("Tests swapping static HDR metadata");
         igt_subtest_with_dynamic("static-swap")
                 test_hdr(&data, TEST_SWAP);
--
2.34.1



--_000_SN7PR11MB675059F459088B309491341EE3722SN7PR11MB6750namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto"><strong style=3D"font-size: 11pt;">From:</strong><span st=
yle=3D"font-size: 11pt;"> Reddy Guddati, Santhosh &lt;santhosh.reddy.guddat=
i@intel.com&gt;</span><br>
</div>
<div id=3D"mail-editor-reference-message-container" dir=3D"auto">
<div id=3D"divRplyFwdMsg" style=3D"font-size: 11pt;" dir=3D"auto"><strong>S=
ent:</strong> Wednesday, October 2, 2024 8:26:33 pm<br>
<strong>To:</strong> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freede=
sktop.org&gt;<br>
<strong>Cc:</strong> Samala, Pranay &lt;pranay.samala@intel.com&gt;; Kandpa=
l, Suraj &lt;suraj.kandpal@intel.com&gt;; Reddy Guddati, Santhosh &lt;santh=
osh.reddy.guddati@intel.com&gt;<br>
<strong>Subject:</strong> [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightne=
ss manipulation in HDR mode<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText" dir=3D"auto">Add subtest for backlight control on =
hdr enabled edp panels<br>
by changing brightness via sysfs.<br>
<br>
v2: adjust brightness range, refactor and restore brightness (Pranay)<br>
<br>
v3: reuse functions, add flags to avoid duplicate code (Suraj)<br>
<br>
Signed-off-by: Santhosh Reddy Guddati &lt;santhosh.reddy.guddati@intel.com&=
gt;<br>
---<br>
&nbsp;tests/kms_hdr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++=
-<br>
&nbsp;1 file changed, 82 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c<br>
index f123c6b36..0f07e770b 100644<br>
--- a/tests/kms_hdr.c<br>
+++ b/tests/kms_hdr.c<br>
@@ -64,6 +64,10 @@<br>
&nbsp; * Description: Tests static toggle with suspend<br>
&nbsp; * Functionality: colorspace, static_hdr, suspend<br>
&nbsp; *<br>
+ * SUBTEST: brightness-with-hdr<br>
+ * Description: Tests brightness with HDR<br>
+ * Functionality: colorspace, static_hdr<br>
+ *<br>
&nbsp; * SUBTEST: static-%s<br>
&nbsp; * Description: Tests %arg[1].<br>
&nbsp; * Functionality: colorspace, static_hdr<br>
@@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION(&quot;Test HDR metadata interfaces a=
nd bpc switch&quot;);<br>
&nbsp;#define HDR_STATIC_METADATA_BLOCK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0x06<br>
&nbsp;#define USE_EXTENDED_TAG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x07<br>
&nbsp;<br>
+#define INTEL_BACKLIGHT_PATH &quot;/sys/class/backlight/intel_backlight&qu=
ot;<br>
+<br>
&nbsp;/* DRM HDR definitions. Not in the UAPI header, unfortunately. */<br>
&nbsp;enum hdmi_metadata_type {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HDMI_STATIC_METADATA_TYPE1=
 =3D 0,<br>
@@ -100,6 +106,7 @@ enum {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_SWAP =3D 1 &lt;&lt; 3=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_METADATA_SIZE=
S =3D 1 &lt;&lt; 4,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_HDR =3D 1 &lt=
;&lt; 5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_BRIGHTNESS =3D 1 &lt;&lt; 6,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;/* BPC connector state. */<br>
@@ -448,6 +455,72 @@ static void fill_hdr_output_metadata_st2048(struct hdr=
_output_metadata *meta)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-&gt;hdmi_metadata_typ=
e1.max_cll =3D 500;&nbsp;&nbsp; /* 500 nits */<br>
&nbsp;}<br>
&nbsp;<br>
+/* TODO: Move adjust_brightness to lib/igt_sysfs to reuse in other tests. =
*/<br>
+static void adjust_brightness(data_t *data, uint32_t flags)</div>
<div class=3D"PlainText" dir=3D"auto"><br>
</div>
<div class=3D"PlainText" dir=3D"auto">-----------------</div>
<div class=3D"PlainText" dir=3D"auto">&nbsp;Do we not have a function in km=
s_brightness to manipulate brightness let's reuse that rather than writing =
the whole function here</div>
<div class=3D"PlainText" dir=3D"auto"><br>
</div>
<div class=3D"PlainText" dir=3D"auto">Regards,</div>
<div class=3D"PlainText" dir=3D"auto">Suraj Kandpal</div>
<div class=3D"PlainText" dir=3D"auto"><br>
</div>
<div class=3D"PlainText" dir=3D"auto">----------------------<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char brightness_path[1024];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int brightness_fd;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char brightness_value[64];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int current_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int read_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd, i;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get max brightness */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_path, sizeof(brig=
htness_path),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;%s/%s&quot;, INTEL_BACKLIGHT_PATH, &quot;max_brightn=
ess&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_RDONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(read(fd, brightness_value,=
 sizeof(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_brightness =3D atoi(brightness_va=
lue);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get current brightness */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_path, sizeof(brig=
htness_path),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;%s/%s&quot;, INTEL_BACKLIGHT_PATH, &quot;brightness&=
quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_RDONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(read(fd, brightness_value,=
 sizeof(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_brightness =3D atoi(brightnes=
s_value);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt;=3D max_brightnes=
s; i +=3D 50) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fd =3D open(brightness_path, O_WRONLY);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Failed to open %s\n&quot;, brig=
htness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(brightness_value, sizeof(brightness_value), &quot;%d&qu=
ot;, i);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(write(fd, brightness_value, strlen(brightness_value))=
 &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Verify brightness adjustment */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fd =3D open(brightness_path, O_RDONLY);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(fd &gt;=3D 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(read(fd, brightness_value, sizeof(brightness_value)) =
&gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; read_brightness =3D atoi(brightness_value);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert_eq(read_brightness, i);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; close(fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_WRONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_value, sizeof(bri=
ghtness_value), &quot;%d&quot;, current_brightness);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(write(brightness_fd, brigh=
tness_value, strlen(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+}<br>
+<br>
&nbsp;static void test_static_toggle(data_t *data, enum pipe pipe,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t flags)<br>
@@ -483,6 +556,9 @@ static void test_static_toggle(data_t *data, enum pipe =
pipe,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert_eq(system(&quot;dmesg|tail -n 1000|grep -E=
 \&quot;Unknown EOTF [0-9]+\&quot;&quot;), 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto cleanup;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; TEST_BRIGHTNESS)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adjust_brightness(data, flags);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_output_bpc_equa=
l(data-&gt;fd, pipe, output-&gt;name, 10);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Verify that the CRC are=
 equal after DPMS or suspend. */<br>
@@ -685,7 +761,8 @@ static void test_hdr(data_t *data, uint32_t flags)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_d=
ynamic_f(&quot;pipe-%s-%s&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kmstest_pipe_name(pipe), output-&gt;name) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; (TEST_NONE | TEST_DPMS | TE=
ST_SUSPEND | TEST_INVALID_HDR))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; (TEST_NONE | TEST_DPMS | TE=
ST_SUSPEND |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_HDR | TEST_BRIGHTNESS))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; test_static_toggle(data, pipe, output, flags);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; TEST_SWAP)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; test_static_swap(data, pipe, output);<br>
@@ -734,6 +811,10 @@ igt_main<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&=
quot;static-toggle-suspend&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_hdr(&amp;data, TEST_SUSPEND);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests brightness w=
hile entering and exiting HDR mode&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;bright=
ness-with-hdr&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; test_hdr(&amp;data, TEST_BRIGHTNESS);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests s=
wapping static HDR metadata&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&=
quot;static-swap&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_hdr(&amp;data, TEST_SWAP);<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font><br>
</div>
</body>
</html>

--_000_SN7PR11MB675059F459088B309491341EE3722SN7PR11MB6750namp_--
