Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88916D7495C
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 06:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1FC10EE23;
	Fri, 19 Dec 2025 06:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAbZXQ/H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9556D10EE23
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 06:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766126503; x=1797662503;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ru0U9r8fn78ruI743m58M1t0JTV3kHatzCZqHfi6v8A=;
 b=NAbZXQ/Hk7qWFt3HFovh/AIKMDevdjl5dPj1Vwsc3mulT0ViObUX5Gn0
 K2KmzwSAi2uyq74Zs2A8zEiK70iOzyXJi0ujQtnXU+hRBJLAiiG9qq5LC
 1/h04CBeGgMfgnQAq4E/UPEAvy9cAP5hPF/Xy+8VGbEQsSt9VBgor/ynD
 TfTczSonQdu00MSCOAvuQ+ap/ElOy4nb3xhF0asCkRH1Rk74ykMziAjAV
 uuj/0tmq0+3xDdey5wLY690UaeWjJpoaxEGeQ7j3j2bdJ8e8WQYWsjLvI
 nNIBr3LCIzixAgpuF+7SYlATJT7MEaknuB9cSzLl0AawCYQ3sYzqBnvYq w==;
X-CSE-ConnectionGUID: OynMk/IORjKOYuVG8Yu+WA==
X-CSE-MsgGUID: menHxS7KSoq+Ahn0Cel0bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="90744238"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="90744238"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:41:42 -0800
X-CSE-ConnectionGUID: yAwQaGcbRJeWkn1aRVqDwQ==
X-CSE-MsgGUID: ufC3qcFLRAmFVii7PZAMog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222205615"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 22:41:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 22:41:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 22:41:41 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 22:41:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnMlblSZ6cKxwK9B2Q10LM64UejQNs3t279q2GZ0JyIdVsmYlXlIJnZnWasKMwjMJYfXeNUZzAFTyR9FeVkc7OazFhpPsGP2IFAzmv9d0p6KAFBNf6FRh8KjknJyVSK5qpWPlryD07HdH3uF/ERyaukIz9bfr9J9wpKdbf02+tVi+msAePHXBwwvEaV5ZZHd40A75M17ySVRxuR5RPuwga8MQCH5C34D4ixqHyfhLWzqNhNCvVi+gRmFTyq9O8YuEAEG/wMAddlOp9ELF0LBQ9G5ngr+/lekp9z2g/IzcA2Oiem0HKM467XsyIXhKmKAFiDK37g78ZEVxbfbTv6vnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frkQW+updJ1EOeIS6cN8P2meJ6s+PSMtV46C336/WnM=;
 b=byG366hK9YV2Imt+j+DpTm5caTb13Hm77HkURRi1ONyagMBYGpfqd9NprSnLfBVFtVT6e9qd9EWhOi09ATLrCycsNafOnRuqlJYdMuv1De1PDAQ8Le+y2e7KNugfi8TYEBMkDPodP9WE8KELs5ACqoxUbJ29aN+ogRoQLvOpS5SBdmTVc/dFJ6VpYGacLYZya58VRYZ7ETet+08ScE6xdc1vCkUYyqUG8dfXzHDE7mm2V3/Kw/O5HSpF0mY4AF1loTTH81yu+ZlhfNRP33I2cgcFPjRYhWOOe+1cU0X2LBMkWgYIjXKopLx8Jy8QAesrxsfvGzPGOQg2s5BxWZ574w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 06:41:37 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 06:41:36 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] lig/igt_fb: fix x-tiled framebuffers on intel xe
 driver
Thread-Topic: [PATCH i-g-t] lig/igt_fb: fix x-tiled framebuffers on intel xe
 driver
Thread-Index: AQHcb/6rCn0ATMbilE2FxbAmA40+L7UohPng
Date: Fri, 19 Dec 2025 06:41:36 +0000
Message-ID: <DM4PR11MB6312AF9E89685A2CA1E77DF890A9A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251218091326.341270-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20251218091326.341270-1-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA0PR11MB7752:EE_
x-ms-office365-filtering-correlation-id: ffc96cf3-34a2-4502-4946-08de3ec9a86e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?phnPeC+UlQjwc06qD/uRC06fylw+8gmJoMHHg/bu7TqgbGmeq5DFNuuH6fc9?=
 =?us-ascii?Q?T495QXxllSCpAm6AH5joQ+4HZ/nXfv5TdmeEF5O33uGeXW5RP0BFPoFp2LeO?=
 =?us-ascii?Q?wujPRlnjVIqdxtzx2FRwRKb8I69f4yNNhJiDgEExwYTPsJi23n7dgHZbAZHq?=
 =?us-ascii?Q?Ajp7vGY5agBiA+TpjhRGqt6/o9T0Q92TMQ+FkNIwgLx5aVjovpZLEyAcD9Gd?=
 =?us-ascii?Q?RZkM6YQQWSI369US8hjkdKzU6GnaBNc3d96yCizPyR9ftYPHkvcKwZE9Nr4u?=
 =?us-ascii?Q?2KgvGLAE0nIAF6JzeHypcQbckqjkKh/GqaHYp4pFPGq39hlyTUJoCt3s3Rr9?=
 =?us-ascii?Q?NhWbtklwoJcTnQwdJiAW0ZXkRj7lQLQA4+tLRr7mco6NhGmyPedKtc/o0mcQ?=
 =?us-ascii?Q?zZ0t6R7OnS/inyRHZT8bo1/gouCGjr8ALD69QxeFpBBot756NBLY50dd113x?=
 =?us-ascii?Q?ndQw9f0KTgRPrMlBEHs1otX8TdrwPs9xZUeVxbV1gi9k5tvqoW7nSDHeZ7uY?=
 =?us-ascii?Q?oFtmpRkoBOojf2X8fmpXTqOkY3mHHm5ycG/d/t5S8DxgWVDnrUnS3FWKQ3SC?=
 =?us-ascii?Q?WANKKvxZlUaF1fLfroZMDtln2/F/AxcFucjOBDUIILwlVktvAP7l4cMg9EwU?=
 =?us-ascii?Q?c9grSB/Ds/xrUFg1O/QlvnWFKUFEmxsWKhxyCtdetVmMKwLAYV2hSyA2//YI?=
 =?us-ascii?Q?Um7w7a6hUzqJNpRnUjd1IZp/I8KlTnaqaLoR1YUt674+u7tcifROgqfySAk6?=
 =?us-ascii?Q?CYgsB6pGTHI69IcaGiGtNhGWMCQm2AaZ0SqB80vy9aYhFGsqb0Mua7DA1RKB?=
 =?us-ascii?Q?0P+RgAn2MYQqKrHL1jvbv5VniyizSptB1hY3htWvy8nkqRAN23wfBk89glTb?=
 =?us-ascii?Q?TpIX/zHbK8qQVj2tMmNjd0XqRpREwXzukUbU77RKC5d0akthvChJ5OlS3672?=
 =?us-ascii?Q?MR20+cM2jPzT+nbN3TjaaoH2nhTgRhMR2kosuJ8R/6f/SbPXT9qm4dKIG7ZR?=
 =?us-ascii?Q?U6tIBOjY64hChOTf58j1mpTnLQ32L/Tcpa5dBpzj2szyGUAFD8vcIz7csDkj?=
 =?us-ascii?Q?4Ny9JGn+Q8XDZON6CM5QhEumcq7blBdaWrlWy+tBqukok2I4/zbwyQuX+Gys?=
 =?us-ascii?Q?in1xYuTBLgWE5TH0LRefNwwqyCtN0gIyO5s9Td20YqXhio9AcaJ5OU5NFP9j?=
 =?us-ascii?Q?nArgunuNZWRLGiRvWH9Fc2PDltlnRn/orKNqtZWKh6ZIwmMRhsp3RJHFs+rA?=
 =?us-ascii?Q?1bQGPOr9RMPI3Y03ysRKABFlGmb1R5h4ovLAMAm7ox4IWi19lSbk4FEabQiK?=
 =?us-ascii?Q?PhoV6sCc7n7t6Cjt+HJ+nVZUrOMqiQySDtzPdgHUzBTl7G/lBDagtQFjh/kS?=
 =?us-ascii?Q?jftPoMup3TCJglvcdHzyx3VpAcLIjkIqi6+VLBDoxG3m5trDSGXVlehKW8Oy?=
 =?us-ascii?Q?7HnCX95VRML3Jw2lpPCQSZ97zCKoYtvhsEnSOI22AGyMPSAzOaLAyoaasEv8?=
 =?us-ascii?Q?/By/XIJbVDo/z8jYuD7SFXB02ut4+wAMzP2l?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lcQF2/UZBRem4Qs2u3U7mBu68RcIXbvO096i/CRasyLURfCEhW7P8X7t1UEU?=
 =?us-ascii?Q?a7cicamu95Qk1PoG4oSk46GvqG9nsTO9oWiM3O6ecdCKaFoIZjaaMdmWZsbI?=
 =?us-ascii?Q?vvBuBwsGTVFS1C9J/H8RGtRmG2RHAf3m9vulrxq3F6aEaSSybYhq6jMPebli?=
 =?us-ascii?Q?JybTpoYcuYP80mIFlJXKyraDeIFpXKTU0EbN5IAfYetRvOxLFKv7GMNwcMYS?=
 =?us-ascii?Q?WRSkUAXxQZpxkb0NKCeRnANX0cZWNOMr82mvXOOXtMRQc7ZRB2Yg/qluapnT?=
 =?us-ascii?Q?lMVavIhty6nw+iKpImoU66HJVGXtm+VNbgbJh8LelaQ5lvGgV8yUxkcGUtu4?=
 =?us-ascii?Q?l/fupXEv8p5EXxchdzvSEzVaxrYuBJxXx98bKHUoUGFAkfA6cpUhKkbrGFEh?=
 =?us-ascii?Q?mFCKdK4DhpmoxQLqXL/UfxTWbCFjQ9VfpCbnY8sZ+2eO15GV65p4nde8zEP/?=
 =?us-ascii?Q?JpK+JWWT7CkMJ/vWxLrhXOLutAacWQxNpC7YGAvoi99jy0oa6e0pveNHzfgJ?=
 =?us-ascii?Q?VUwBUQPHOV/ivxC1rQRS8g+G+MVJoIsxz+3406lH2dEHKh4BMvasCpjxRy9+?=
 =?us-ascii?Q?l92lBwoFq/J6LaS0lLpLmXCLNWSugJFBEk5B+hho2ZIRgg6/G8LVQL0eV5lK?=
 =?us-ascii?Q?TSduAVIhIPKeWIZ/RP7YlUi3ZEo6z0sNzP+n+8Xq6l6xJ0Zp0GU7nQoo40U+?=
 =?us-ascii?Q?EDeqmnOzCHzGhC79Zj47f44O4LGElXRXVF4UB5b70MvBP+TztYMAzNf+NKYP?=
 =?us-ascii?Q?A97k2K3+TPjAmGi8wj8paY3QG9+D27rUbvVE5P1I70jEZaLsgyK5Q/vzgXVd?=
 =?us-ascii?Q?4CFNfWzpIgEwblnKzhMMB3EOKFzByTQ8puInVqdu6oHEeK+jHPm85RZR/8dH?=
 =?us-ascii?Q?zXYNs6yxJ3/5NZwXk9yTYYrbxw3404xHzU3SJA/Spff9FCoF47jn7RdJoSki?=
 =?us-ascii?Q?XTXA4/PNTAmY713tXb0oObrNrxLyUIZuAqmIcOCsfLjP4Xe3mdY2+j+UGNBR?=
 =?us-ascii?Q?acXOhc6ikDI6MsGxI9iw5DfihgvUZ4uP4ChzfhOHw9ndFdnuVXjwifBr6uph?=
 =?us-ascii?Q?4VFv7JpIn7lLqbSLXS4tCrvoeVVfT8oRxc1sEKwknF2RVJLXQbQMoWmyjMln?=
 =?us-ascii?Q?7gm4GIdF3fA0RmkvtO45ZfWs1Hdg/CU7JVjarqlKu4iwCoV8csv9pE22kebC?=
 =?us-ascii?Q?U567QFK9RV2FUTxg47Sk/XnSSYSmf/ELE4HaYRI/keFZW/GofxqtTXxUd0YQ?=
 =?us-ascii?Q?XpakfJPi7VpgJKQJ53I7HL6l7isptlTM+r2sAxFsKakoJP0l9ox7W/p6hrhI?=
 =?us-ascii?Q?mWVAGzaOXkNs2Ixvv9SuR0jcXnrvGNpNCnJnCQbhjCW9fkkNXxFVJirpY9Ai?=
 =?us-ascii?Q?TQIvHpOxliudow7qPSChwNXhmE1sCejIAzc10xHYJtC64o3M/p8xuK6dIneU?=
 =?us-ascii?Q?5rI24s+vwlWUWgqy+8yvzjWuEXE1lwlS8V3esINsLRg2J/2lGvmFC420JSvA?=
 =?us-ascii?Q?uK60+WYhblb9HZ5obCwEJdR7tL+AdHKg+FHCvIdXBHaVVHFtX5kpJAdzHm9I?=
 =?us-ascii?Q?CAlm/f6OUQs4iYoc3aw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc96cf3-34a2-4502-4946-08de3ec9a86e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 06:41:36.7920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L48AfmZrgI41M+ffFFiPyhnrT+duDjrzEfZpox/0oxmCEbZ616UoBBmugyICvB6pAv71xbuL39fchXB03vOgsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Juha-P=
ekka
> Heikkila
> Sent: Thursday, December 18, 2025 2:43 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Subject: [PATCH i-g-t] lig/igt_fb: fix x-tiled framebuffers on intel xe d=
river
>=20
> On igfx x-tile was not utilizing blitter on Intel Xe driver causing crc m=
ismatches.
> Here fixed that.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c index 0a8299d26..28b1db921 10064=
4
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2643,7 +2643,7 @@ static bool use_blitter(const struct igt_fb *fb)
>  	       fb->modifier =3D=3D I915_FORMAT_MOD_Y_TILED ||
>  	       fb->modifier =3D=3D I915_FORMAT_MOD_Yf_TILED ||
>  	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
> -	       (is_xe_device(fb->fd) && xe_has_vram(fb->fd));
> +	       is_xe_device(fb->fd);
>  }
>=20
>  static void init_buf_ccs(struct intel_buf *buf, int ccs_idx,
> --
> 2.43.0

