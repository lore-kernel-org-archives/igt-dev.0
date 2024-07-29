Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994E4C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 06:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5787A10E30A;
	Mon, 29 Jul 2024 06:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlsBDmgt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4123410E30A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 06:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722235369; x=1753771369;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jFyudquo3+/Ht94dDt0Ccn/YCbi2isMYVgwGOqXlw7k=;
 b=JlsBDmgtur8Yh3XZt8yBovUCL0PIiGw3cy+5dLdJxCa2G1xpsKb1XKvC
 KK9J/2mMmbueGa0tc03fhMSPIl6nAUFQeEq8G6D+yPKamuqCPSLAlSpBe
 EcyxVpzijksYNRvW9Ie5HV2R1zNwp6afxt2aKmqodnzLOypGzCFOorTz5
 uGCA1Q/BVumv9IwPf9Fha2FdKVN9I+eXX24M/19e319Lwq+PIpDOzi9Ig
 6s9PZD2rCa0Jhys3uBcmXAwH+VSqvH7PCkskzKjV7DyD3ZMB8jVHhTZGr
 9ZSX2zhWBYJO2FuenA5em9Ki4088KqK9RNb6e9siKezIPTQz7FqCiuhK7 g==;
X-CSE-ConnectionGUID: HrvMvRr8TS2ss9gvOF4vFA==
X-CSE-MsgGUID: 4jsxf6esQ4qzd4BfQzhMCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="37436335"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="37436335"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2024 23:42:49 -0700
X-CSE-ConnectionGUID: ZriEjdJuTxyoxTzV/lDHyA==
X-CSE-MsgGUID: WFoSNyKoRH+A8KBOUBjHrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="77123276"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jul 2024 23:42:48 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 28 Jul 2024 23:42:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 28 Jul 2024 23:42:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 28 Jul 2024 23:42:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZAhGj5xL+sOXW/P6RBr7gZ6r5AVvQoaCjzBWjiUVjzxnKsPxrA5UghhAMABHjVG6sMZMyV5aZsh/1EeiGFMLia5iK/zN/fXN3BKzBlC8Xd5q/4k5sVwaP0qY3rbZlTUh90YICs+YHfYTk0IcZx5Av52C2Ih4cWmXJGQ4luALED8v6bdWX3hME9NdZjHMyK6mvu8+sv12oWvupKc5D5WvZO7Y+5LiCjahyz08Jk4dp8PF/frd196tR8LvbzIEQw8F7SBbo5/q3/BQ5Lpe310WkxrLxrwEtzrQfr9mFscY7IwXi3cl9OWANenmzyhzTlqTt6Ra5W2Y44VTyUB7FiiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rq+jdPSdeCzVAw8iK5LlGmfqEgLsLs/4odSPgTu667k=;
 b=SrPsN+Pwq5QNuQ12S4/m+V5xsWUkrBzUL1WCWOMJGPQptSxmTPoKzmLV68c4Eexg3ve4Nipd8+HVXyBEvYe70Sb65DHKU51mj7ZI18LaRMtcbsQ1/4JP+meVNu02xzmO9aKl4N3MciWo+WEyS2SdB+myqWqPZq0pTKwyCBd0cwo9mu7CtPMIAs+0MSJTaKurUP8HMatWdEXLF/2A9f24wJi6QgrR7Msj4jKGz0ZSib6WnpcYVJl+yKv6BCt9HqH5R0AYBgB8EPq6ePvFPDvbrxLQDG1pNdhE++Njko6RnFhSjpo1TcHUv5inAIKt3VYBZuvpNZT+8eGwkt8+unwkAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CYXPR11MB8753.namprd11.prod.outlook.com (2603:10b6:930:d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 06:42:45 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.7784.029; Mon, 29 Jul 2024
 06:42:45 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v3 2/4] tests/intel/kms_pm_dc: Update test duration
 to 4 seconds
Thread-Topic: [PATCH i-g-t v3 2/4] tests/intel/kms_pm_dc: Update test duration
 to 4 seconds
Thread-Index: AQHa30MmfHt+2dI60U+0OhXzmT54SbINRhrg
Date: Mon, 29 Jul 2024 06:42:45 +0000
Message-ID: <SN7PR11MB6750E786BC1D97F1DA3849C3E3B72@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240726100751.918038-1-ramanaidu.naladala@intel.com>
 <20240726100751.918038-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20240726100751.918038-3-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CYXPR11MB8753:EE_
x-ms-office365-filtering-correlation-id: 2b415935-4667-45cb-2206-08dcaf99a79a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?gV8agVQFxfwf4o6X+1lNcqpWJpC4JWWnP6tqUGH7IFFLUkDPVDqht7QJzroi?=
 =?us-ascii?Q?nzVA4Yaz7/+jVy/gZ78j7sVnYBSA9ERp68G9GNHlLXX77f7u/40oasM3R2cW?=
 =?us-ascii?Q?ED6LGYS7agroUMUPhOPFo7JnxXvQKosxchJT7w4kEXEh1YHrv4rh+ikKWf3i?=
 =?us-ascii?Q?iV85o21m2V7/4C7qqLwtUyfrDRc2hMarjIft3zY0TCAsiG387AbXoeX23AK5?=
 =?us-ascii?Q?COWTLLcwetkYSugVzkQkmwas2I4HTUVFkyMucGmHCDf0iDEznXfcsHPUJ8wt?=
 =?us-ascii?Q?74tVraE5hZvXgVJ/GjUzSCYlQ1p9OsMeqg3g65s/l4t9r22O4JxtiTcpSkZj?=
 =?us-ascii?Q?Nlm6hsudl7DhsjsihASLIMzT8qLaMJeD5b3hPhyZDOiFQru6mqkTzr7j8OdT?=
 =?us-ascii?Q?Vyy0a1VCAREFmXCzygVSF42+jxSb1YY8mbfqsKg9yuP9YxaTDhFH3reMqCjb?=
 =?us-ascii?Q?+W6fTbisXAd+NSy85fgqkvJjil2FZ1PqlpcHA4GJJ8Lqh9VVH79hvUhuJGxJ?=
 =?us-ascii?Q?mtJxn3+7GSArev9+NGeENN+f4e3vpL0IO8WXleZi1tDg69FLmClEp8SQeYbw?=
 =?us-ascii?Q?OxJWFAEXmGjlAVaU1nJFuXcnr/BG8iVShxZAp/zklUGEwb0KbQGwiceB7o4G?=
 =?us-ascii?Q?rhjZ3IzN9vW3s6a4LSS/dPtIlz+lJv0E/dxSvET+3m8tFdii9bTFU6PsMnZv?=
 =?us-ascii?Q?lLAn3XQL3SVC6hJamkyAqLbRT0yvJJbkYbZTUfAhGI4sZsoL+ivINyowIggz?=
 =?us-ascii?Q?FXd8KRHSrQ38R0/L3v5KHHJavVCtwen1BP441jZU/dHfFOWaJLIAtMzp+Qq0?=
 =?us-ascii?Q?TovL94/6fboBII5yENaP8jOLTQqx/9WhtqpoUXCMTgK45gMnzSGV/1svEMVf?=
 =?us-ascii?Q?tNyo9IaE8yD0s4HOHuOhVaARIMPhI6K5GPxS37zinCO4WQz55KO8z9q6Fxv0?=
 =?us-ascii?Q?zVAp0rgDYZV2F3s1nr8TrZCnitH+R/dzXFLoWI+3dojttX+6wuxPTCJ7BXf2?=
 =?us-ascii?Q?RsW1LJpiZ26KVrf8I/gepOIA5sV4S/2CcuZZSSbnz00i3amu78tdVnbKGaY6?=
 =?us-ascii?Q?Uhyncy6k648h94ufhogxkwMfdVhz/Rw4FvsBF7NTrc4yznPdU1EoM5T0AUqL?=
 =?us-ascii?Q?7ZAfiHms10qr5LeYzYYUyCG+k7ICBiyw8nmz/Bp0aPntMk84rh/9kstouaUU?=
 =?us-ascii?Q?RDz93mop7g1xCv2eJffcZvlQqTaSfa75fe/fnIXsV9/tDof6EPEfEF1lPtK3?=
 =?us-ascii?Q?4pNktVrhVIXv+PbqU5J2K/fInCff8o0UgRlvcS7ZLwxXGxJwznQVo7WON3mS?=
 =?us-ascii?Q?oRz0wUl2kD35UMhGR9Luh77vrZKv3DK61eH1xiGmuJYqRfZI5/axlz1ZbPhs?=
 =?us-ascii?Q?3nQAJobCKXXDTbJjLUd7Xx3T7lPavnLzHu1qpe65Ws1FRqLEkg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3UlnhBN3qcMw/ZbRaC3W2tXEtIlGzV4RDVasuawXIVx8Klw0/pSmwjN9kh4t?=
 =?us-ascii?Q?QEsXGLTTFCNqFeJ6SlXn47Z595gMgO1s2An/nhVaX+XYSni2nkfBPjv4csSX?=
 =?us-ascii?Q?iCWCZLXR42EMnUbVSSdJq7/4z8MjiVsUzoFuQO+k56olc5ZQscSMIzSsGhpk?=
 =?us-ascii?Q?dfYacxObtPEatXDfKQ2rs4hHIysvgsv+vIkwMHuPIjoePY3VA31YIzT0EbPO?=
 =?us-ascii?Q?VZdUZ+f97Cnp4Xs9w32SZVyxSX2ohKI6A88Ab8i/apt02dKndyFQVyk59exV?=
 =?us-ascii?Q?9M7tvQyYbYTfwteh84W0xvIfUq4Z5viQaxmeSO4JA5rC7ktOB31PULyAHnSc?=
 =?us-ascii?Q?2QL8k8ptPO9wqtaa1b1CHd5zmLgP9rngxtOgzDWwtYQIrZYBT276cKsgT+Gy?=
 =?us-ascii?Q?FfhoZ6ELryxtPlzkcieA4ZiPyZ8M4BFpfE3fE4XF9jaJKm3HeGWQ+wJlnhDa?=
 =?us-ascii?Q?XcXYD+bEEmvjhb94VqOCd34fqf01CGZ5auGC7HTRAtkX72jZjzb9RHb0+nTb?=
 =?us-ascii?Q?iyuWQZMCCMk5vOD4PFGxZSK9DSyeBIsVDTRr4JjslQMz2xkoP3fMw694Pf95?=
 =?us-ascii?Q?LiAakZoVe1ORR71819MSZFqjuFpugZjOiyQkOnJ0y99QbIuXKjp2spO7X/yX?=
 =?us-ascii?Q?843WsF6lcOaZgew2Ecv0N138Afj7jwLArPIE6T+s2VyRq/BgTXL3YWRiSP+8?=
 =?us-ascii?Q?Jf/hMaU+RnN8Bm2FCHlkX+6iKsBssIVYzXXfLxOPGVSyw5W0TaSHiNHT+3JP?=
 =?us-ascii?Q?wsqgVZgo3uNfF8gj+GuCF0exEFa1TfHHHnwLaCrlwVxGXto/Wnay+3oUFND1?=
 =?us-ascii?Q?8rXfrJqd5ScGNcQFfNBmxiOkyEnaJ0QM3cjvISm1UYsjO2CKJVFqwmbDV/AR?=
 =?us-ascii?Q?LoYSOAIqXdkGbAAz0gJGw2EvEHjZxAL6wdw26vHTh/3trYAGfmp/832OHFzf?=
 =?us-ascii?Q?Ws2DSHlIlBNg+laFTggWp/MPYkK3tVRA3nmFx1xPts7o8jINsFLG7BJKN+Ho?=
 =?us-ascii?Q?FUyXhg0LsqD+ccjumOgKcOysQF/DbOklbKRl37mM7ycYs6wqw1J01gJq6my4?=
 =?us-ascii?Q?ZJl6vQ9CgPpcbgWf1fvL3INO6BYkIntISMh5+2FvRvZ6JexBOyXmkqHNTcF3?=
 =?us-ascii?Q?hmjHx9iRmiu17X7LTu+dLR1ANSwt88QGZV/CQKBaf0KCOAItaNYZK+AsS1SO?=
 =?us-ascii?Q?APK1gPaZ3MawIb5YR6eDa8dSKJNQJ6kWrJ3abSvwMR2fM3SYJzK4nOOsxeW1?=
 =?us-ascii?Q?uDQJW28bDoTj9lLQCF8l2KONdal9t4f42ElvJw5F6DKJOZbIUwP6YKWQAgns?=
 =?us-ascii?Q?ktmK7zQW0c6s3HhTU0P9AZ+eM08GbRXnnGMEcg9ubs9/TsJ8mM4ms1RpKSr7?=
 =?us-ascii?Q?bEnYwNOV9VkfrbUjwjAKTx6jsLIe3NN/GMthj5RAUg09LQ3GiyP+U3YUU1QF?=
 =?us-ascii?Q?tpKmtOd7uAAvH8j2j4erR383N2lYMEWwxt7Th67HMSY9eAEzM7GMLb/nNz/c?=
 =?us-ascii?Q?o5hMYCrV3P/JtHkw5MPoL5GqDDEPrS+O8NcRQpAtfYfEn2e07r11k+a+Q6nC?=
 =?us-ascii?Q?uZQfJL5jrS/ZUcyry67YNnzJwOWoBt/lDewm7fBK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b415935-4667-45cb-2206-08dcaf99a79a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 06:42:45.6323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLiC5SPV8QrgKKPQXHydXbNj/3qrjynbZbUQw3mmxJSNgfHSjM4qfv90v5tgZe2gOTlx1kV/4UsxbuY346FHbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8753
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
> Sent: Friday, July 26, 2024 3:38 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Konieczny, Kamil <kamil.konieczny@intel.com>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v3 2/4] tests/intel/kms_pm_dc: Update test duration=
 to
> 4 seconds
>=20
> Certain features can prevent timely entry into the C10 state, causing
> inconsistent results. So increase test time to get accurate results.
>=20
> v2: Split the patch into two. (Kamil)
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 3d37d4a25..09d362694 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -592,7 +592,7 @@ static unsigned int read_pkgc_counter(int
> debugfs_root_fd)  static void test_deep_pkgc_state(data_t *data)  {
>  	unsigned int pre_val =3D 0, cur_val =3D 0;
> -	time_t start =3D time(NULL), duration =3D 2, delay;
> +	time_t start =3D time(NULL), duration =3D 4, delay;

I feel declaring them in new line looks cleaner.

Regards,
Suraj Kandpal;
>  	enum pipe pipe;
>  	bool pkgc_flag =3D false;
>  	bool flip =3D true;
> --
> 2.43.0

