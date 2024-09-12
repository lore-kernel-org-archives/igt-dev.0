Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94E6EE644E
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 06:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A53710EAD0;
	Thu, 12 Sep 2024 06:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAYL33tV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA68B10EAD0
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 06:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726120897; x=1757656897;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dDn07kWne5qhazKs2Wsmp+bVOrySxb31BH5cxbLL8bc=;
 b=SAYL33tVnGaPkANYQWdVE87wXFfnyKt1lAbxr7J9qGWmn1mxnok6Cki8
 kb+K0If6vh2Hq9eH3fWusfxFyt3JTkZ7O1jD2aiA9T856WVLo5eIeWwc1
 n/CutEdDwwV8NrLwMClkLw8ZaxNcJVdu4Scol4Wpj8LCztRe5e7LXsMUO
 +MCPVz6quwTPVDytoP2Apcrf67m2oTvZomR/3+ZvjnTkMlmiJsDfGObiY
 3IX1GyTD+WFBUgDu0WvocAiGdPch/hUV6U9UjSVtzcJbRs7SkV+A70B+/
 Gh1k1+slHxemJbap8qEemyPazjbw0siFv8U8DrZe9nLwawDwdiWsuo9++ Q==;
X-CSE-ConnectionGUID: o5lqDXnaQjK7ca/gluVESQ==
X-CSE-MsgGUID: Mm3xG69LQ0WR7WVeLWlgxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28688674"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="28688674"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 23:01:36 -0700
X-CSE-ConnectionGUID: +Ga4chn0SPi97//BrZQ75g==
X-CSE-MsgGUID: LgsYEcOfTay+owWe4NTQgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="72399502"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 23:01:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 23:01:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 23:01:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 23:01:31 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 23:01:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=le7EAx1yq12sJVqTZdZKlsa+Yj4mu62CXQhIORP4r4isxwU39GyLzW64KkLFVRBnpDMDweJYomGrcbKJRZ/g83UVvVWjKZGxvMmKN2NDkVjABgcKKVF5uonADFYWKSRvSH8NYnSBx54uQ4BvBNkKKMOfbd+7+4xrCmXQa05NCxJcTxBjkguV2rkx2jiqpmekq4gjPxB/OkSO3AIb50Tw6Vg7uHpIs4KValg9+wH80wgoVDfG+Xh+iQjY+SHJNJD8lbYWGrrEnYvne2qUrq93uiEO16OpS6iA9IzObGg3NO3nokUqvIgZVa+icu1SglGQMmpIvMcoFy1gpmf9kVHN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyBsnOC7RZ76u2SqO/V+M/s8xAjq406FJfOjD/+Ijow=;
 b=Z7GaqbT1jrM4y7WagFSOZWECwM3vE+64I19mqXwXbgG6m0ZzRAH8aBfQ9OhcSEeRCaoLEJ8hR6xWoAurumMEBo+Ye3rarJpPfsvr5i9QpRCdnCNzvUM9LZaDSxqahC4Acp8V4OCgJ9DLF3s7W+I9rTozCySDFM5y3Z/H2rBt9HhQqXFh58SNHtvGJIePs7wErTdpd+g86A+JzCqQVLxrMXaWob96FXqTFGzRDb9p/6gyNkBZzS14kU/dlCdEOfoCQ5LPj5TJL5+EaDwJpVET0cn0XpCkcCAtTZb3yZCn3O8aJz2mpFvlhh2FAqkK1U0lL6m06IUudl9NPmyhLoQnGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26; Thu, 12 Sep
 2024 06:01:29 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%5]) with mapi id 15.20.7939.017; Thu, 12 Sep 2024
 06:01:28 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 11/14] lib/igt_kms: add function to reset link params
Thread-Topic: [PATCH i-g-t 11/14] lib/igt_kms: add function to reset link
 params
Thread-Index: AQHa9yioc0btYP98R0G/nXwxQs3cwLJGLCOAgA2XVyA=
Date: Thu, 12 Sep 2024 06:01:28 +0000
Message-ID: <CY8PR11MB68894E6FCA8E56C18D6B8377DA642@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-12-kunal1.joshi@intel.com>
 <ZtcchZEiGan9msTA@ideak-desk.fi.intel.com>
In-Reply-To: <ZtcchZEiGan9msTA@ideak-desk.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|MW3PR11MB4649:EE_
x-ms-office365-filtering-correlation-id: 1be4a603-96c6-4e4e-bbec-08dcd2f057e8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?vuLS825f/haQPNvIIJvpbrnSogZSQtOjWlh7UtxIoN0I+3W1cdclwJb4Rela?=
 =?us-ascii?Q?gwarc5tVo7EsS/+idLQU6jvru2P8tAnLnoC05cW0eqy4WUH3xKbJpYKj6+Vp?=
 =?us-ascii?Q?QHlvCWmndqP314XLrUdukhp56+TCpuBn0tHbX6ZkWelqD0CjaKx3janX7F5X?=
 =?us-ascii?Q?jW9saujkgM6wWFqhqyLPanDB9baciYga21B4tcxeZLZWtGSgRgiH06uypPfo?=
 =?us-ascii?Q?B+gk1+4fiAaKsZ4dNfXlJdTwG0JMU4Zt/pB0Kf9sQUb+6pI2DSbJIUGXR/43?=
 =?us-ascii?Q?xZ1lDRaCh+rTQuXtcagmCfJ1KOscuWOpH4XMiO2Ga+2iAfRVgFv46roi6ZiR?=
 =?us-ascii?Q?36XDvA8BlOwdPCWU8dBbwDasUREnh9J+WTmRLwMaBCXV8dhAIrpChSUNCB7C?=
 =?us-ascii?Q?qj7gcVUvFXmAmjoyXILgV+I0yiqBE2CgMwe9/A9b1ijcTzCqq6+dshLDUIxh?=
 =?us-ascii?Q?M3VAR1wU38acAhYnwf4GybXIbzUqTuo2lmntUNGatLMtII7HixyO8kb5SUIy?=
 =?us-ascii?Q?9cEHk9DAcG0A3eF37CRM+QR4aqbN0ubngC5btdkabzsHtyEzREKDfzbvO3lp?=
 =?us-ascii?Q?h8dI283hoNBoTMiLXx4WrXTsiQC6jlXkDBlZABvv0rzWcPA4ifVGQyPXYXlY?=
 =?us-ascii?Q?21bFQNsS8bkSbHjjXAkipIEFC58szrGB1RUz6ngfn0mNKtApBRNS8bm/gJis?=
 =?us-ascii?Q?JhsVzcI6zs766xeij2N04PDvg8y+SnAS5bj9lBrz/hTVeCnO6ck9FlDr52dc?=
 =?us-ascii?Q?0f8xV2kLEXDPJSneaAANrE5uAxx9+ZMRwMuzPtVTfXa3ZukSwGDQ67edvNNU?=
 =?us-ascii?Q?qjofcfynF0/o8UyZR2KJb2RtU6MNnAhrZ0j1ONSTxuirsl6QuapM8evtRs77?=
 =?us-ascii?Q?Fi8dkmWcx3G4/x+0hyFmNrhjCD+hGL7urVx9/M0E6hvkYrBggntWEa8LQiof?=
 =?us-ascii?Q?88COwSoWQm9DKng5E6mKEep8GWzQLEc/xn4vRFcXVXMG95c6NoHMCNXeVi5k?=
 =?us-ascii?Q?kfcZStd4XgwYNJmLvNtGH8UyqzRGbPaBZwRroJMO0TZlnZSmKLra4YrCNS28?=
 =?us-ascii?Q?0jTV21YlWgwMVkjSmtlh/qOQUZNyNYvGjcOa+DcFKuZ4fOBUvUJUUysqkBvk?=
 =?us-ascii?Q?vtsMkWX8rPYYQzWADyNSH1Y3kjz5HoRpk8nsfnrlDTdlwDta55c8ntTE0s7y?=
 =?us-ascii?Q?D8x8S8t2Gtuo0xARM27oxtuiwYwivcLMY/jhHxlwqTWQ2/uluRieSnf7R61P?=
 =?us-ascii?Q?utDgdNpGcIPO2lCztfjS7tK9Z4gSz23krGw2Gi3tqZ/ZNgpwBqKi8nXnxJ0o?=
 =?us-ascii?Q?l2xNbljTGM0fFGIFomqPLiPMp5gizDJihS4bK0W6ldQoKtWsu+jDv7L2C3GY?=
 =?us-ascii?Q?ztgxFLy0uo0VNvbfoatCxXmSLueyamWRIDZ+SNKZi8Dk/A503A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Fywcok46F4TrDplFuOLKtsBbdTcx9Z2tSzxGUA5nmId/60wr78TwOU9ZSRBA?=
 =?us-ascii?Q?/7yDVQBPrjIVfNCnMT9r6HBpCBovtyGEarmmB4CJaPk002VAuERUCP2PmwwT?=
 =?us-ascii?Q?5VGk6hJCLenDcx+6aFA0Q69EXD1KWVrcdgnf79n9OUwRZaMFc0kVqC02uINR?=
 =?us-ascii?Q?afV1cx+j1iLTXDRcCwXu7i2SVcRmWI/hucyGRRwhVDd7fLc0iPI86fZfEwrH?=
 =?us-ascii?Q?QkY46yqKTASjpw/MB90lecVeMVCFnCRZ123XSO0b6ixEwluHEtXT7gK7QpRJ?=
 =?us-ascii?Q?wrlbdGuiwaDJJqHY0O4KOIDgRuQVI6frV5Gved/PypTMaw1ucvts/j1XQd+C?=
 =?us-ascii?Q?sYH/Zthy7vq47HJHN5C7WWJzd5UfYedO7QjhqUZqR3kmRj+2yqLB61PGiAlV?=
 =?us-ascii?Q?+ZXuzhwiJUrJA9MvQDFNHSLHVBpG4gn7c9X6VrhdlXNdYeZ8ZDekmZee+U0w?=
 =?us-ascii?Q?0vU/7E74FLOd/55/L5DEheAGTdQV17H8MNUDEzHRBfhac7jTt+ozkG+E1Hjv?=
 =?us-ascii?Q?HuqEHcvDuV1y2b40wCB9cmG6UBU1ASRVpFfgXN7769wg9BGFbWS+txd6+VrO?=
 =?us-ascii?Q?KVd32HtYBNRItQPiPKKPCmGijm3aQwF7HSLrP3QTBkpX/W5oH80ip8MWhtKy?=
 =?us-ascii?Q?89Q8aRa8beugBoc9lRuyY3HFVs9Dc9b3YBFqGg3j6ZcWVira1eN0P7Xk6CLd?=
 =?us-ascii?Q?D1duhP1zN1kZyQagBMuVeoniCmeCJzVvUFZA3VhausriYGc8kOTbsZIW35XL?=
 =?us-ascii?Q?9vr7Z/qpNGU7Yafokf3UE6HAlIsJujtV1trSeD8KyDASCo5pFN7EOQWB1pFT?=
 =?us-ascii?Q?wEFj0yaR0sWaLXECCscS+kIWYgZD8FKKdsQNL8aYlVSD7IFNZnr7MptOayrW?=
 =?us-ascii?Q?t4bpYS8BVB+m+DlQIU6lvYDdjaw+VFiSTdVLEJUj/t508tz/ubjLwhMM/lfF?=
 =?us-ascii?Q?9GK0PmaqgU3moWgis7DGcDuGRDnf6phYbivAl9ajG0ufVP0dUf4XTWUpcBRM?=
 =?us-ascii?Q?gMqcL4o6kwnHYa3oCEwrf7aipyifMwWXyeddu5NmhDmZPDDvPs9bGYrFUCcG?=
 =?us-ascii?Q?1MiZKig4PSO+/zIrN6fwRv+AqOmctsU5ps+4pzx8wmIcaO4kpS03BqH5SMTj?=
 =?us-ascii?Q?9NQfFZDiCVn8XYe8rJtoAQmkNxO+m06yxQhILH71gAT5ERfUowN1ryiW54vT?=
 =?us-ascii?Q?TBvgWknxIyI3QYaVcjwWxDX/Hhf3x0WWJvKHJSG20HA8WkRScv4qrUYeUHTH?=
 =?us-ascii?Q?Mv2GmHelvfpIANO0aYl6ebEjEku4c4/MsotUmCWLWiZlYPGF1I2B37XP/mDv?=
 =?us-ascii?Q?AxdrAyqlC78uxedMHqs4keaxdExI5P8czSOqPmAUWnq18CefiwSFGmhhpCpZ?=
 =?us-ascii?Q?kTRmWQmUxQNLEPx1HN+h94Bcd3ro1XogShGRphIUpE59ZQrBbgIlKR3PIiOT?=
 =?us-ascii?Q?6rRoSRQ082/4b68jVAQv2eTC1oUv6nwGWkf467LXbsqCHF887us6UgWKgMZq?=
 =?us-ascii?Q?Hptjwj4lshZ/CtyMRMc3j6S96g5b+xOmxbIq+0CvtV8LRNoHLmh5G94Oh+qI?=
 =?us-ascii?Q?tHXWS6S9Uev/2NyB6rgSgFHDrcpSRjLi6Z0XBar4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be4a603-96c6-4e4e-bbec-08dcd2f057e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 06:01:28.8072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DaFUkfBPlRFqhcfvuwQJEc3U7pDxloOQ8butWqx18u1TdlTQ+tNk3w2eYZ1ZgAH5lr2NS9+cVGV19fYwhB8/HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
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

Hello Imre,

-----Original Message-----
From: Deak, Imre <imre.deak@intel.com>=20
Sent: Tuesday, September 3, 2024 7:56 PM
To: Joshi, Kunal1 <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 11/14] lib/igt_kms: add function to reset link pa=
rams

On Mon, Aug 26, 2024 at 01:36:09AM +0530, Kunal Joshi wrote:
> Writing auto to i915_dp_force_(link_rate/lane_count) and retraing=20
> afterwards sets max link param's supported by sink.Reset link rate and=20
> lane count to auto, also installs exit handler to set link rate and=20
> lane count to auto on exit
> ---
>  lib/igt_kms.c | 36 ++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 37 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index e0533f6ae..b7511ccfc=20
> 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7000,3 +7000,39 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_out=
put_t *output)
>  	sscanf(buf, "%d", &ret);
>  	return ret;
>  }
> +
> +/**
> + * igt_reset_link_params:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Reset link rate and lane count to auto, also installs exit handler
> + * to set link rate and lane count to auto on exit  */ void=20
> +igt_reset_link_params(int drm_fd, igt_output_t *output) {
> +	bool valid;
> +	drmModeConnector *temp;
> +
> +	igt_require_f(output->name, "Invalid output");
> +	valid =3D true;
> +	valid =3D valid && connector_attr_set_debugfs(drm_fd, output->config.co=
nnector,
> +						    "i915_dp_force_link_rate",
> +						    "auto", "auto");
> +	valid =3D valid && connector_attr_set_debugfs(drm_fd, output->config.co=
nnector,
> +						    "i915_dp_force_lane_count",
> +						    "auto", "auto");

Couldn't the above use the corresponding helpers added? I don't see those u=
sed elsewhere.[Joshi, Kunal1=
