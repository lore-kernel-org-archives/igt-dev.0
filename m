Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72146CD484A
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 13:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2506910E720;
	Mon, 11 May 2026 13:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3ZAv8MM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B7D10E724
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 13:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778505832; x=1810041832;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uq8XXxNeSYtfZp+lZa0H/HrecuI3G00hnPE8feFeZRE=;
 b=J3ZAv8MMrLH+FtXWta6rNQa9zE1DN6JUgA0eQGa8c8cg1WwAm0sykRhY
 pOrgQryFNVkLh9SqM8cl51gZDw3v4ybdau8odRF1k6yfpkO2+2CDcupzZ
 DXm8eiKx66Mu6CJE2HlPPRLVq6JRegdEzTnHSl7fSDJTXlKIUdnp6yEDg
 0F7Evp7UcmZlgaYHmbpoth6rzLpixgdP2yhYZp49DfdoXD/Qs8RejU8ft
 MZ7KrzRh4XcWywlwmhkgalJqQfD0GnQDyNeKxSIoyzRO2l5veLv9fjNHz
 GrOvQMK/aHUQ2yhjCeH0nRsSg5WT35GHaC3Ypq9BANx7QRRwnMy+DyBiy w==;
X-CSE-ConnectionGUID: n1XsZ9shS+OvCAK7SZvZQw==
X-CSE-MsgGUID: /aWkPy6ZRYWJsGbJbsB+tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90857978"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90857978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:23:52 -0700
X-CSE-ConnectionGUID: I/LBPKClRIGVMlr+GwlPhA==
X-CSE-MsgGUID: 35E0NKLUTS290bjGQPn9oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="242418502"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:23:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 06:23:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 06:23:51 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 06:23:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNFtoeS35z1VxlfRFrQnnmQ84dLW7p3R31fVCS0xMxt6q51CmMVR6KfePYvv1V+SiXxJBduFsfVGhm3UyfZcnR2+ExNyA341KQ2+G6ZdyqX35nyjDAbBdm7UaEgXmdS6PtiWZWdliIlPY/G5nCW+2hq+if1E8FFVl9TMgi3FXI18jXUPDoIwwALmoblP8HbGGEwkApoGdsQ441ylDjFxgjhZss2sYNQIRDzYNneEHnp/znAnxgCOQJG1GkuZ3RkqYKrhSkzFDNIl5Rm1Nm2EJh0OsFVAwUIUvmBvPwi2Js8djAA//DtS+1moqkffPiX7tiLHT1c4N+tXlL1VFgNBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZeHWVdFLcnfD2WtPancMqqqlI26oo0hagBD2E7hdy4=;
 b=gJKQ3JxaeTWYqSdAgcFYUKcSo0zzknoAPtPbE1IGSQiTrEPOdk9pwI89t2eQDg/RscJuoxIhIVaKvGoZmS1/AOSWejhBRzvYFCM+k/txo9qYV0idJnJN0GgCodJjNMpqGAgyCBw6A2XqpX9GcSTi6WVwh9ipSC04TzCvjZzUiisN5gIggCtxX9rqbcAmD6x47ut8ZNz7oU57sg790LBZDvamW75Byz1g62iO4rTTwzYuszrf7rmkIOw9KYILovx8MzGqpyZWQikZ6WCZb6Q4ndghZN1qidieKMjyFZ9teqTwb9T2XeC2HVWMFNh323RGn/foEFa2zz87KEX9mWS8kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CY8PR11MB6963.namprd11.prod.outlook.com (2603:10b6:930:58::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Mon, 11 May
 2026 13:23:42 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9891.020; Mon, 11 May 2026
 13:23:42 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sebinraj, S" <s.sebinraj@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_explicit_fence: Replace fixed sleep with
 vblank wait
Thread-Topic: [PATCH i-g-t] tests/kms_explicit_fence: Replace fixed sleep with
 vblank wait
Thread-Index: AQHc4R5UcU2UHNKb9ESGWFx7RpTcsLYIzTpw
Date: Mon, 11 May 2026 13:23:42 +0000
Message-ID: <PH7PR11MB605371E5E04D84945ACAD206E7382@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260511081117.2315474-1-karthik.b.s@intel.com>
In-Reply-To: <20260511081117.2315474-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CY8PR11MB6963:EE_
x-ms-office365-filtering-correlation-id: 8a7d3c9b-3445-4943-21eb-08deaf608551
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|11063799003|38070700021;
x-microsoft-antispam-message-info: Vxk3ZiulvIgrT6shlp0X4kxl0Kzc4nLvqssCFQ4GhWsIP3HSqy+D0MqEVTLUDITTqTDwlVyDNOF3qf/4Agpeey8mqbEkejGnL4ORxVTW/bmFpVpUv4H+0xSqb3pXZ7+UNDD+w8Q7S3DTPcAFm2uX4ab+DJiVc8Wt/0JZ5NOzVIUpj8KFabzwtYjs8f8Zd5WLNM+gQQYp/+B8SEW0G4kY8mZN9lu7T1f1Ri+r9hK8StlZtF049/yVG9ydMBotnn19LwG8b+mcBoRdN466zhW7f4BOVYdd1tNma2yb5eXGBjSuy1Zg9NSnVHc0sVcW/OksNEV/RlkttfmqyCSxUpKt0chVC0zH+JLUeX31iuHXZi2BssxcdkASoog2rQRYOZCcUoYQoq/4h3NVVK9+ebOz7rVeuVy/CfGLQRF7K5oyuYgFCmAVR+qdqIHlV9SeJAuZ/LLy3X8wWC8RXZ6eM1WD+1UAJ5TlTbePobmcxvt/4un5C2WhhSR5dWyPB9Pudw0QDb3oeV0Y9K1Uvp7m95BiZ+SVM3u/Y1pdLRNTmnvaOICjaMpJFFqOOTD/jU6BK1+d1Ov83cMiC1wsOE4rN5uDps6rv+ayxgLRhb2L/aOBFrKGg4myAkDkQ+4CqYt0edK8Iwu/0m6INpIMZJeDD3Yh1PgQQTHYmHYGNTuS0Wb/aLAcV/sVnTuMc0vLzBcNKhfOshjcZn3zCKZrH4CLbj3it5WHX3qQS67F9k78EZmuCOHVXk0sPMJ34LeBnV9+I8Ri
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(11063799003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i+HhU3VoOV1/hA93VeIsM0QiTtI+LOTp/FLo7wJLfWei0gdgSxjxmw0C6gbR?=
 =?us-ascii?Q?z/dtbgwmhA/F5sEl39kBqrzDopKLu9psVg6lcHEo8KZI4aVWXRRIB80/n5No?=
 =?us-ascii?Q?fBuOk8SVruCy85gkKihz3mGzf1pHULYJT+qzoSvTknOPYuNF6Vabs80mZaq/?=
 =?us-ascii?Q?p+wZWXGVjlM20kgTPynw2rDS6ZTeR3/MorSGbpza40MC0rVI7swee6jSQFpS?=
 =?us-ascii?Q?Zz7epHg1uC0HEehOoXxAyAw9c+hVMfv9+ygkAafTbquzajLT5r1Cx1mcPsvX?=
 =?us-ascii?Q?yNAL8LwvTWuSPwkajELoti2RsuQa7goLjrqioLC/195w/Cx43m3mQboo2arD?=
 =?us-ascii?Q?7iQT9D2NnMMlDY/3TugeftvE7N6DgC7Br7f65Q21rs5t6H9GNqnVttQ6dx/k?=
 =?us-ascii?Q?1QNQkomfdC7fb2PmVnw4ibbC1u49rFQPInD1+fmooqCI+UiIG2BqzLactPFN?=
 =?us-ascii?Q?2T41mU7Duoh6l7QNWyQEpoTMRCraTX5/m80y3oZuovS4j9DzEk1tHwZN77Qi?=
 =?us-ascii?Q?bDno6Q06FQawWV7LXk2UyA6PMxMOy0Oz7hllQxvZvT4OgnMHmyKs3Z8GEX2m?=
 =?us-ascii?Q?z4c36jfrhJ52rHaeuc+ir+wejy2AkxjpTzEev0jxf3q7TOzDjyqFQoyAoEVl?=
 =?us-ascii?Q?Qrl4OMoud2gAaJGINK2VmdamU9MWXrjEdEBOF1H2wP4z/4T8YfwmIpExKzmo?=
 =?us-ascii?Q?TmVfPEtnVoroKQ0Dt/FRyypTwMMtb7nlum9FWKgAidYSgaYasqtmCI6Yos5U?=
 =?us-ascii?Q?Qh1xCSn/OG4K8fCKe0uKmmMS9Cb4Hu+VluY4Qro7X/Gci/44GtyM/u1Q3ntk?=
 =?us-ascii?Q?nYbzPOjSNLfu52aCvRWiIm4HFn60mToHTeflSAQcZ6CpxICjpQ/2EVrD50dd?=
 =?us-ascii?Q?4CW2SbWqMj+Qj3J6aHhgmpz+pPTGgvVldCpJ09Lh/LMXQmKNOt54nKIKro7O?=
 =?us-ascii?Q?788si9YdwTIrNu4SBModFnVDS+SBSLcqeSWRNitaN/wtmAktM0vEPcmXjX6X?=
 =?us-ascii?Q?o0oCSPgoTx0Jtx1bcrOMwzgeJ0ykM7XypUo51epLVtFAJr8FEED5uESIKz+T?=
 =?us-ascii?Q?7KJRmMdeITU6RPX88XH6IUqLr2WjL3N/heq9GJpEjlbX/vBaQJnQY45DMv1E?=
 =?us-ascii?Q?ROZt9ovFeP6xXZQ5a6n4z2VXGwgLK+zpMiFVKhi2IbbGmSJFAfyTuT54Q0V6?=
 =?us-ascii?Q?IB4bA3gnfsCHHk+bLaQ/mwZlXxcLEADQmb6CEPMkuoCI8TOM34mpEsg4vYhy?=
 =?us-ascii?Q?YEwBjLOfPpO0u73R9wnhpUf3AWmuOKAmhGJKA1WEfKJI5Kh8i7l6b+fd5JX6?=
 =?us-ascii?Q?BOYhNYXP8qTfvVsyh45SPJa4LPdXNxul62l+nTbAYNesxcEff5AWn66BX0lk?=
 =?us-ascii?Q?0hz2fw2MrV51nZTzPYa4Iuws5TvoNdQ3pVvwIH/kc2ICcVYcwkRnOggiQ+2j?=
 =?us-ascii?Q?ICDElXNTvtxyU9xzsC/4RB14r7nN3qh8KAqqDfSZcdSKVCA/d8r6lSEefo1G?=
 =?us-ascii?Q?QxXL6365WyvOfuybVseXnX9z4t3Zrqb0LA7c/o6OtTiVDBR7pti8eJjBc8E9?=
 =?us-ascii?Q?ObFf+nceO8DkST52ln7C5PaEwLL/gzuReL8UkW6jyXGhiQNmaCI85Bzi3CT+?=
 =?us-ascii?Q?hfu2bXnCYGaQAisq/JpJTOv33ZI9UhRukLBsS/CjoEP7dHPE1vs1l/ooKiqY?=
 =?us-ascii?Q?kF3F+rZZ0q9aIWY/dQwKjGqMGrkIa2dwyaNDfGdEFRg788jhaUI3Y1pB8dJT?=
 =?us-ascii?Q?DPviDujWew=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oOqEVG5ITY7z7yswf/oA5opt+s0RGsXBc9yPIUYFhryH7AJcDDlIGtGZhKCpVVhH7u64AF5wmFx1z282Pi1lPaPr++bnnupV2XSwG6K/JFucFZMPF1s1ZelM93bhHpyiB0SFf60iINgLJHPDgH5DRysllm2J8RujcdPFqs16o5mD5Ph3uNdd/AViCmm24ccA+iCuZ5DUsSCuEPgWRcwFOi4Y48NYdqUA93jWwoLlNrkLoVvYhD0bvBDB2Ywmul9Qc+jhlU0QuEMzeLAohLHsZZbOw6d+iC02OEwDPRJ28SvRCxEG6pFATkALeBzFqQlGsxrP4df0UTo/tJdHmbUk8Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7d3c9b-3445-4943-21eb-08deaf608551
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 13:23:42.0921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XaOwdVA1W0rjmfGMLQ5WY+1ZEpiauq6alKAFjA8gq1seNtCwHzTpfzaIuMfOUR+bSksfhQlf/wrNvFBy+UIKhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6963
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

Hi Karthik,

> -----Original Message-----
> From: B S, Karthik <karthik.b.s@intel.com>
> Sent: Monday, May 11, 2026 1:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Sebinraj, S <s.sebinraj@intel.com>; Karas, Krzys=
ztof
> <krzysztof.karas@intel.com>
> Subject: [PATCH i-g-t] tests/kms_explicit_fence: Replace fixed sleep with
> vblank wait
>=20
> The premature-update detection window between the NONBLOCK atomic
> commit and the CRC sample used a fixed 100ms sleep. On high-refresh-rate
> panels this 100ms wait covers many vblank intervals (~24 at 240 Hz vs ~6 =
at
> 60 Hz) and is long enough to let the display engine enter PSR/DC5. A
> subsequent CRC read then comes back as 0xffffffff (read from a powered-
> down well), causing the test to fail spuriously on these panels.
>=20
> Replace the fixed sleep with 2-vblank wait:
>=20
>  - It is the minimum wait that guarantees one full vblank boundary

Minor wording Nit: Imho, "interval" would be better instead of "boundary"
Apart from these, changes LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>

>    has elapsed past the commit, so a same-vblank-latch bug in the
>    driver still has a deterministic window to manifest before the
>    CRC is sampled.
>  - It scales with the panel refresh rate, keeping the wait short
>    on high-refresh panels (~8 ms at 240 Hz, ~33 ms at 60 Hz).
>=20
> Cc: S Sebinraj <s.sebinraj@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_explicit_fence.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c inde=
x
> 2ec9bf39d..d50a5af63 100644
> --- a/tests/kms_explicit_fence.c
> +++ b/tests/kms_explicit_fence.c
> @@ -283,10 +283,10 @@ static void multiplane_atomic_fence_wait(data_t
> *data)
>  		     "driver did not wait for all IN_FENCEs!");
>=20
>  	/*
> -	 * Wait briefly and verify display hasn't updated via CRC check.
> -	 * In a buggy implementation, the display might update prematurely.
> +	 * Wait 2 vblanks to catch premature latch bugs while
> +	 * avoiding long idle windows that trigger PSR/DC power states.
>  	 */
> -	usleep(100000); /* 100ms */
> +	igt_wait_for_vblank_count(data->crtc, 2);
>=20
>  	/* Check if out fence signaled prematurely */
>  	ret =3D sync_fence_status(out_fence);
> --
> 2.43.0

