Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F34DF3092A
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 10:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABF110E262;
	Thu,  5 Mar 2026 10:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dB9PkIL8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A2910E262
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 10:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772706976; x=1804242976;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=MAARYrEKhutZczV2hg9ZsEOjUe7Ez1gkbSfob9StX4o=;
 b=dB9PkIL8hoZjKE2xcctfnh+SDGfdKvmQEyGpBpEF2QduycLlmpC65S5e
 RWP1gH7Qtx3NnbteqBeTuQV1uf2bpr38OFfaez55spsWa0mECz9HzZFUj
 UTvkFr1gws4UIeN4eexfxnsJ215szhsY3Rv0xfeCt1mLMfeeUfF979+20
 4gppymPfGNkEKlKzi7Nu4+7XtpDZQ6n8MOX2cW4iA1vHzfGaUSqFjjg5/
 sZXYDTnhK6+o4Kq2imTppeEcGJuAmPeSvmNELFeDUTV3hflckm2smOjU4
 K+cUyrG9ix12AeKFuLzRTHzRoT78V+EMRzLBSfK+F0JSBdkGOlB4ddE83 Q==;
X-CSE-ConnectionGUID: yJn07AguSJ+VcVf6ipgLsQ==
X-CSE-MsgGUID: r2/6eJ5CQeyf+FOC0Dz1xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73859264"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208,217";a="73859264"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:36:15 -0800
X-CSE-ConnectionGUID: AYEo0t/bTl6s8iV8yerlTg==
X-CSE-MsgGUID: mzCyD2/5RCuMO0+P0EG0kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
 d="scan'208,217";a="222791732"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:36:15 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 02:36:14 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 02:36:14 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 02:36:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnUNpGUvJtdcStGeTzpGEo3IufoNDh8VCp2jd/gXOmI4CseDvjGiDk4QW8mq3k7z6UwmpzHwt8LRgsTF3fVIGrKH9WQvX8hkwgl3ugfl/WU5oF2FPqM7zam/C6VrG55KBJyciuOlRrQxvEYA4Aco/qyaf6a5rj2eTHGS2CXEQc/fqOrAA/wBT4VgfsQr35xsVpUw7KSG0gVfIdI9Pd/N5bli2phUmRN6tM39Ob3lUdtfgANKuV9xY6ieIzChpbzXGH3rR5m+WMzdWIagFW/XXWDhXkYRBet3iu95nAKisVfRerkkCSVwoaNEyrexcm0hNhLvo8D/IFBRmqIDXVhM/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSgISRvSOqwknR3hbFEPvAzVNF5puSlivry0w8bfKHI=;
 b=dYOPPrM5M0GRBabTDGgXN8naZWw1n/EDwXCdGiYRt/SCivxQHUq1qyUu22nwIVbM0sIsdLpTcSHwTbc4k0SkFP4fhljX2HxyAPzyCDW1PaIHnczzcyEqkufO3D4EG2C/RltetnEQNUU6Px3ofZQ/PxrC2lpHxTyYCkrLIVQMmhPkcaUWIwwUkq6K3wbkWEw6QbQqa+9BkFATg7C+dM/8lBmJrjdQqIRhyQ7b3kD+ZofvypbJGSyXj+oB9m5WKn8zrq2iEovrtUJtHz11Eo8iPmvlxNwMO6BrOmeHDZhGHg6hC0HBsiWhJbNtquCeMjqCDl4nPVbQvXubtxUvsHBu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by IA0PR11MB7741.namprd11.prod.outlook.com (2603:10b6:208:400::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 10:36:06 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%7]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 10:36:06 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "Karas, Krzysztof" <krzysztof.karas@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v9] tools/gputop: Add GPU frequencies to the client
 headers
Thread-Topic: [PATCH i-g-t v9] tools/gputop: Add GPU frequencies to the client
 headers
Thread-Index: AQHcmxti7PqgBCz07kuwexrUPysrBbWf3m6AgAABRn8=
Date: Thu, 5 Mar 2026 10:36:06 +0000
Message-ID: <CH0PR11MB54277E7C8A083A6629CD3CCE987DA@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260211054638.4090041-1-s.sebinraj@intel.com>
 <xocuvxchd3uo7rbewv463aes7sqgziyidmm3gre5om7i2z6vrr@udl5kmjtgypd>
In-Reply-To: <xocuvxchd3uo7rbewv463aes7sqgziyidmm3gre5om7i2z6vrr@udl5kmjtgypd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|IA0PR11MB7741:EE_
x-ms-office365-filtering-correlation-id: 1edd7108-71b7-4196-c797-08de7aa301fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|38070700021|7053199007; 
x-microsoft-antispam-message-info: NkNUN8Eq0JJRuwLq4HppDJyU4GGqwaBXSdt/3DFmiqFMEWsUBPNoldKqQy3ZWoxeLQiSFcamSs9/KFdSVjvMwfNOGPNKURPpmYvdMJW8QmxBYZy0wtWSmJrl1zG2X7G/cZotPDU39n120zQBHDjSD52Wi7QB3zOi9sqvNL0qSWzsq2INSh26Hj3zMdzz+FWeX5o0J1p7uEVipvOByJPWNzuYd4StOY995mVKNgBEzTU6KTcHMrL9WYQ18RSQiQ/9FBF62JPaCjrfE3u2YBKwIIGAOFuo33wvxiSK8nN711pjBhRH6FaH4wAOEDwfpSWtco2NyXwXSwa5eoB7Gg2jSEpXJLM5mG/oidu3th/pLqLYXcVyjoYaYEIqBJCbp+Wl5nNz4RGok+BbYuMZr6SYE7pdhYi+CHUAaxcz0MpbuiedR8rcbeQzL9WHwh6Be6PrrdkPWIMUkb0/35QOo9D2nc9g0/0GRV3pAjKObJYNCDszCbsB6vmckC/RZRn4MeiAddqnaZwvAobpuaFnXk/cTJTIxQgaxMV9NMfdQrBENns/3vkK0HZTK3JLEAupFSzfa0r5ES/Xk0Sb0p5EXX15aUkIqcOpRt5ToGzku4XhSESE4PbqBML4i9w123RS2zcXhNJyiAOMIv0BWgP8JNPMyGf4OKX9auBxAwbpVsnrRh93fTcD8AYMjOxYJQPTTWx4wqSNLSZAG2Y4UV4TkADma6f1HCYKQILoimgGZAiSSu0tg7P/yhKZzJRC32kaUyE/55SEGG9a09tpTM46dIPnK29wNGtUgijM0IOWZx0rD2Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HgsSO40SineE+ZN17HY/tAba0fscrrprVdGOAwrgWlPQFHeu+H9/zoqaW8?=
 =?iso-8859-1?Q?B1WmYjV2ZnuK1Jgru8Q9DK6JOQzwi+jYvUY2G17e+q3Uh6CeX0KWEZw1jl?=
 =?iso-8859-1?Q?o+JDt5TeeyIIB7B/pxqC7IcnRPjfCSKK8VEha0iWDSyoYn6qK/0qLKI5GG?=
 =?iso-8859-1?Q?Je7nWagPXKXlRH5lUUC+wcy06oUIIAa1iIxo3c88qHegdNGzfTCNwny8GS?=
 =?iso-8859-1?Q?6d6pnQ3le9bC2UqIM6hjqRY8YFQRcJxqHr0eizgfb4IwLeKn5wqOyeMN4i?=
 =?iso-8859-1?Q?brHBRKRtbBZAM2sYwzX/1HB1+DuNR1cdmgXhsfKKTCrOLnjDxKnFRwiOzD?=
 =?iso-8859-1?Q?WyeCe4eenNQ5d+O75uhdLtEyE228zbMW5pe4i1YKFOWoO34gfyEmZF5Jq9?=
 =?iso-8859-1?Q?mPnOYSu8meLKwwTh3RagfquGakuAj49DmIBxwguQlD29pjGkPkkbpZH6JI?=
 =?iso-8859-1?Q?uH68G27hybCOiugv+G4q+nOBTB9Oz6gRzXFPL0Bfp9Kh5wu3tCe1ATZO0p?=
 =?iso-8859-1?Q?rBuyuBM2tZWa+RAawSyHC67wwK3EbigKBfcOAZj79Ykn1NLpnGKh/OH9OW?=
 =?iso-8859-1?Q?QD7AYuB94UOZxGxJsQiESCwQljJEKzPWP0mpGr0Avr2VxiYGKb38YJGyFs?=
 =?iso-8859-1?Q?xgMUM/qjpc0aOfV/VktiffQPpy3bo3AjuN55Hv0RMZWV+tS/EWWPtzIx0Q?=
 =?iso-8859-1?Q?0uDbCriy6v87W2reMFcpL3Dr6ZRrxn5A/O7JfK5W1qbSDtBcp/nfyyoe9u?=
 =?iso-8859-1?Q?0FETHwo+RBkwAMK2J0TOGV5CAv6/IsJUktv1yViIXbV/pXpmFe3Icwx82u?=
 =?iso-8859-1?Q?pVqHYBTSdsiWqkLNyf9ZTfclu6zko7c7siJmIRubiv/aC4DRu6GROrnpIS?=
 =?iso-8859-1?Q?b24uT1oQQ7qVdFxzHRtPKTeJfknWveUeiS/IIx/K1Q7cqZnA+BKWoMK5X7?=
 =?iso-8859-1?Q?xUljjAfKn95bpioCpp+moWx2dO+FpQRxtTE8J96E77h+bKz6nGvDOTGM5k?=
 =?iso-8859-1?Q?RVl9i4asjyEYBwPlSWCiwEMYzttWZrwL9X2h1+uqJTZLI0kVBcqap0waAm?=
 =?iso-8859-1?Q?UkyMsZMmu82hf3/7u6PImtM4V/Voj4piIjy6ItKt3cgJmNEFj6YuSW7dP3?=
 =?iso-8859-1?Q?FdZXhZqd4V6h9Iu4CMGn8XQhkus/TPzRmV/phj1GYpCGRFa1BrIqx58jOu?=
 =?iso-8859-1?Q?ZmwtQDOoHY3BFzU9SqVzn0Sf7njqBvIjsAOYkX2qDQIqZosHtnYLUfC8z7?=
 =?iso-8859-1?Q?3LEjp+5oC+XvhwBnRzmPWp9CgHyBMAYUmoFYEG9BVgmbs8RaXEJelF0EeR?=
 =?iso-8859-1?Q?9pXk3lRf9f49txncxCRJdDxOu+65zfFLk4hTfv9/n3ChdzrCGoJQZMRCJT?=
 =?iso-8859-1?Q?8nKSuGpFFWjHHZIW7ygpnScPa3Mzerna8lyKrwa0L2J/Tsk8tcwMScyO66?=
 =?iso-8859-1?Q?fb5p01rLaj8UY1EhpW/vt2iriWLA6W1W7mkMpOchPPCjstOJy5IzHeGp51?=
 =?iso-8859-1?Q?vJWXI4xKTVdMvRH2qAv3cDbHLWNHYIqcHIDYyQ7ordNA1jL24n0pOTWqgU?=
 =?iso-8859-1?Q?KkQP1xyLTBzQ9oBhwzXRHN3p113hjJb3Ic+5T5cF5TeCjHINedKrShpe6g?=
 =?iso-8859-1?Q?PWW7FrLXLeGs7ihWCX2hifLqDf6LwA61NU7Iqax/LVhr9PVD/6tCnhsfFK?=
 =?iso-8859-1?Q?Te+YZhfB4k7APBIFwzhslkfTvLTdXIZ3qpYvLnR/B+O7GXzepX8T2nDBPT?=
 =?iso-8859-1?Q?b2OsPDpaMdG/annZpNs9tl5WczSsxm2LxIJ1XsKfDIvq7S?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB54277E7C8A083A6629CD3CCE987DACH0PR11MB5427namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RqWDHRsKYlxnuBy1QuY5iOrXkCIIw5JrgvExZ+xfP1AxA2IY19Vq+sm3yRWyJeKFC4TktKW5DePXX949Mj3/u9rt9mtbRyGQDVH3sx/YQPsTjLQQBRVJmygQ9p23916n3dFJePAUnikeJkVw4XFzMc+HP+sYqwDnA6pJytznUeqC8OCAsNFblpGQnWaMAvySkyTF50FpjW1zyV2SgMxuYpLLl2VjGg5nAdB67LPN+5WNGsD28jws+JGDhgv0ytA2QfGXJxZ5PFfZNVI8XYqaEEMx55KnmAoXfljI7V0R0K2/MTMYfVAW9nDwehJOBtF4ImYG4iKajH5pJ7uXIHbWBg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1edd7108-71b7-4196-c797-08de7aa301fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 10:36:06.4500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aJ+EvYgIaVhbTEjEt+M2/e1hwUkA+AHiz/OCHrPGrcfwPjL3R5Whm+IzMpjXalApzBmyP1ITgLwNLCjY4jLBlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7741
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

--_000_CH0PR11MB54277E7C8A083A6629CD3CCE987DACH0PR11MB5427namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: Karas, Krzysztof <krzysztof.karas@intel.com>
Sent: Thursday, March 5, 2026 3:55 PM
To: Sebinraj, S <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Badrappa=
n, Jeevaka <jeevaka.badrappan@intel.com>; Konieczny, Kamil <kamil.konieczny=
@intel.com>; Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Purkai=
t, Soham <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v9] tools/gputop: Add GPU frequencies to the clie=
nt headers

Hi S Sebinraj,

[...]

> +/* Detect which driver is bound to the device */
>This comment still does not answer "which" - it does not give
>you the driver, which is bound, but it checks if the driver you
>gave it is bound.
>This is a minor thing though, so address it only if you plan to
>prepare v10, otherwise ignore it.

This makes sense, but I hope w.r.t 'function name' the meaning is
as expected ie. ''if the driver you gave is bound or not".
Also I'm not planning for a v10 here, so ignoring this as you have
suggested.

Thanks for the Review,
S Sebinraj

>Rest of the code looks good to me:
>Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

> +static bool is_bound(unsigned int drm_minor, const char *driver_name)
> +{
> +     char path[256];
> +     char link[256];
> +     char *driver;
> +     ssize_t len;
> +
> +     /* Read the driver symlink */
> +     snprintf(path, sizeof(path), "%s%u/device/driver",
> +              get_sysfs_drm_path(drm_minor), drm_minor);
> +     len =3D readlink(path, link, sizeof(link) - 1);
> +     if (len =3D=3D -1)
> +             return false;
> +
> +     link[len] =3D '\0';
> +
> +     /* Extract driver name from path (e.g., "bus/pci/drivers/i915" -> "=
i915") */
> +     driver =3D strrchr(link, '/');
> +     if (!driver)
> +             return false;
> +
> +     driver++; /* Skip the '/' */
> +
> +     return strcmp(driver, driver_name) =3D=3D 0;
> +}

--
Best Regards,
Krzysztof

--_000_CH0PR11MB54277E7C8A083A6629CD3CCE987DACH0PR11MB5427namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Karas, Krzysztof &lt;krzysztof.karas@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, March 5, 2026 3:55 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Badrappan, Jeevaka &lt;jeevaka.badrappan@intel.com&gt;; Konieczny=
, Kamil &lt;kamil.konieczny@intel.com&gt;; Kempczynski, Zbigniew &lt;zbigni=
ew.kempczynski@intel.com&gt;; Purkait, Soham &lt;soham.purkait@intel.com&gt=
;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v9] tools/gputop: Add GPU frequencies=
 to the client headers
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi S Sebinraj,<br>
<br>
[...]<br>
<br>
&gt; +/* Detect which driver is bound to the device */<br>
&gt;This comment still does not answer &quot;which&quot; - it does not give=
<br>
&gt;you the driver, which is bound, but it checks if the driver you<br>
&gt;gave it is bound.<br>
&gt;This is a minor thing though, so address it only if you plan to<br>
&gt;prepare v10, otherwise ignore it.<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
This makes sense, but I hope w.r.t 'function name' the meaning is</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
as expected ie. ''if the driver you gave is bound or not&quot;.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Also I'm not planning for a v10 here, so ignoring this as you have</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
suggested.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for the Review,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
S Sebinraj</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt;Rest of the code looks good to me:<br>
&gt;Reviewed-by: Krzysztof Karas &lt;krzysztof.karas@intel.com&gt;<br>
<br>
&gt; +static bool is_bound(unsigned int drm_minor, const char *driver_name)=
<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char path[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char link[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *driver;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ssize_t len;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Read the driver symlink */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(path), &quot;%s%u/devi=
ce/driver&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; get_sysfs_drm_path(drm_minor), drm_minor);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; len =3D readlink(path, link, sizeof(link) - =
1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; link[len] =3D '\0';<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Extract driver name from path (e.g., &quo=
t;bus/pci/drivers/i915&quot; -&gt; &quot;i915&quot;) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; driver =3D strrchr(link, '/');<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!driver)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; driver++; /* Skip the '/' */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return strcmp(driver, driver_name) =3D=3D 0;=
<br>
&gt; +}<br>
<br>
--<br>
Best Regards,<br>
Krzysztof<br>
</div>
</body>
</html>

--_000_CH0PR11MB54277E7C8A083A6629CD3CCE987DACH0PR11MB5427namp_--
