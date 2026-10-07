Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE9FCA5FF1
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 13:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D9910F5E1;
	Wed,  7 Oct 2026 13:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1LqI1BG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1849410F5C2
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 13:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791379837; x=1822915837;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XP2P+OoPtMVJdWJfgqQXWGzh435wJma/vdSJ4A2cVwg=;
 b=k1LqI1BGOVid4GDZSppYg/GC9rl251LMGzLyQYmFFozSF5D8+G2Dgn1T
 xtwh/VQejBDbZaONY73ws/mGawBYEfrWKU//UPoome65nst9csIN7j1tf
 5mzrrkaIWQ/305VJaPzmiasFqN3l1wbhxnHJDciTqH0k1M4Jvmb8y3CrD
 krnlshrl6agYoU7uZUJtEDKrxDwW0Is8UlrMkFn8qHahfJxycfFAGov/I
 Q6lwyfbD9h5oa92S0m8ssZaeN7snW9+x2PGop+1PT8X4aRqCBfLL4WdUq
 zDfhS4+dQXBxgXRTd69ynVlRlYXsHyyZdmZFiFx0RBto8Z/AZwJp92cAT Q==;
X-CSE-ConnectionGUID: rBiaFldGQoGpL8kq0RECcw==
X-CSE-MsgGUID: 4PTFaQ0WTPOv8hsWnGRsqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="40461"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="40461"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 06:30:37 -0700
X-CSE-ConnectionGUID: jYU0M2kPTNipE5A6Hhj9pw==
X-CSE-MsgGUID: lqRdbNwLQjC6QD+hsiFrVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="280730582"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 06:30:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 06:30:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 06:30:36 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 06:30:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKdRet7QvB8a2xAii+1jvcDqZ8Wc6b3CpovuR+P3TaAtEwSTtRskYx9gJSaFsa1ImGcjp/ZJu+E/BD4JWRNgxpXjG/B1P3EKCGap8+xWf90jQ2jDr7D59t61h1uEqreDyyAu/Aer4ef43gxmNUyHCIVGuCqovk/GpxtqKH7csyF+ETslAYfDLhJCcOJKh4gidhQ9FpEQMl6/SLp/Zxei7NznDWk9IaRkkDoaslsQZX9VzpNCoCAh+7OKpMZ0TbHLlyRmwlS4szDSQ0AU44R7kdYDQjih2zRvlITIukyxZJ/NaGVrV0Vj1h5vfmajNpzKgOkf0pc5sEVTOnfbYnoacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePKfDtoc3I78T2PB8zinqX/tjK2kDNmMOZmFgpBLawU=;
 b=YvpSvFqerZycTJ0UkXR1P0bkg6aLEsMYDe/ovf/CZMX7mvu9Fu6ZGEF8pi5Hw2pFLGoGjQOf4g5cmv+zx46ia3uBk6mmubu5bwnupaUj99nGjVCy8fHANgw0e+dnVFLx0vAUKbr/sLZD4uHUm4/3fTqsUL7TtabIw20Q/yJ7gk8AIsqABd3zSG3yXTm6IBb2dpeuzWskpPiuqw0SiooHnrbfEYBELM+OMRA9Ql9u8eTfMgxSEGvXD/bnl4GBmrYccO0JbBmwaGzYGYheX3oagC0/os5TIzkCRZnnM1h7p1gUxQyBkRnlen7UIuR1kmTM7bEnoHW3KsrDSFXsMBPvcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by PH8PR11MB6855.namprd11.prod.outlook.com (2603:10b6:510:22c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Wed, 7 Oct
 2026 13:30:33 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e%5]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 13:30:32 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 5/5] tests/intel/kms_alpm: add ALPM LOBF subtest
Thread-Topic: [PATCH i-g-t v1 5/5] tests/intel/kms_alpm: add ALPM LOBF subtest
Thread-Index: AQHdT/Gs0nYaHvM2MkyGIZcvpC1QOrbyGtrA
Date: Wed, 7 Oct 2026 13:30:32 +0000
Message-ID: <MW4PR11MB57761E0DE571DA4C8C4E788CDA942@MW4PR11MB5776.namprd11.prod.outlook.com>
References: <20260929090454.2796967-1-sowmiya.s@intel.com>
 <20260929090454.2796967-6-sowmiya.s@intel.com>
In-Reply-To: <20260929090454.2796967-6-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5776:EE_|PH8PR11MB6855:EE_
x-ms-office365-filtering-correlation-id: 685af197-4c81-4dbc-4ca6-08df247729a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|10067099003|4143699003|5023799004|11063799006|6133799003|22082099003|18002099003|3023799007|38070700021;
x-microsoft-antispam-message-info: l1qmT41ge5Ejt9nuy0Ac6MXmMLtdnxWOpkKeJhCaC3Sbe4K1y8YHqzA+1qtHfru10HjRSCM9Wrw2IvLapTq+u+xZorSaZijfTB8qcTmynMqpXRhht8B79XtFdPLpSttYiFDbXA0jHmgc6oDnFfsyCxG9jLrASYqUtZWLoyGBtQXPaIt5LMhiRO97MMGaBbZ1AsYg/sAsavzeKxeRspvL5b6dkL+2rfldqDY+BG/0IRYI4DaDJLpBJ6lhLehn5Evs8PIeTR3ZtmPPUEd+eRjInA699hJMjJhXcK13m/DPXy3f+asqDii93wEciN2LkFIJ/6J6Nbtzo0WcOqN2v1JVWeDsl5Hf7W13qUnUKMwOUnIXIPM7neigwPFI+3AN+94b/zOXujGubngNyNH9uL+3v/eY+4BNVBr/di5FAVIufuOm5shXTOOTZ4MJrXRd5m9JN8iH1P9uTk3cSMOULH0ZJgMxbqt8aXMQCrDH4WzYiEFb9ua52fTcKKeNI/EXR6mRNE7qUndVjc4IHqZ2rG8GX5VAjQA0oEajmIba8UAbxDOPXYA5C6RFZlv5JHpyY+vB1eMVEHnjZCIXFj20IShTFG0dDH9plBRWSM30jKTf+HRr/gVoFXGromQ2kATCXc7+NbYFQPuSKKNweo2Q3GnahpwMh7V8bqNwnWFtSPTrH6q1Wp6uwBo4sDA1Js9iMbBfDZL4zQHe76BVcfs9sACbz5amxGcHL74Z6JnKZFD8Rrc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(10067099003)(4143699003)(5023799004)(11063799006)(6133799003)(22082099003)(18002099003)(3023799007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fzVP9ik23yntuh9TZVtmhSfUoCTXUDo+a4zvqTvEOfJzBgi74x4TPNgXbWl0?=
 =?us-ascii?Q?BLri/1ksiaDGCzteCRFqQsAL1x3E1w9HUSrTP/yfqmLiBiKLXdiyfGR/AODQ?=
 =?us-ascii?Q?4MeY51p30UD4ZBsAKl9G12XKPGUl/GZBA8nLalXl7jureya1+kWJ0RpZD37B?=
 =?us-ascii?Q?J9CqV6ZSL0iHTs/pfiRu6S+1oTR1UIge9sroJ6KNmUEFUFZ0A8TuZuBEVKWs?=
 =?us-ascii?Q?4NtHiL9HIVNkVAyifJWPLrYJm2gO9kkEuLngJ2QsKm2wOPukNqB+fbqJEtpp?=
 =?us-ascii?Q?jjL+XSX6TBK41ZHNDMp2W8osKi/u26Kr0txI5BuV7s9oBuOL+l8q8I4aEkvW?=
 =?us-ascii?Q?S9YuxP9rBRxgqK7NDYpjKKrFFnjohBYqwU1aB1rXAE3xOyBUiIuhT2UBu2r7?=
 =?us-ascii?Q?XF+t8AGNf2WyxU2g/sKAFaoM/Bb/uQTL0hchT9tOrA9FcBGaIZocPsahEp6o?=
 =?us-ascii?Q?+EAr7kdBq0GV35Aa+G/eoLI0PItCWYKtRj6g6nQlhgz58FQ4Nk1vjHq2UW1p?=
 =?us-ascii?Q?pvmBXs/ITVuyalQhOdvlnSebC+jwS3LhfcKmpneyyjrdbsCFtmpDoOqgX7OT?=
 =?us-ascii?Q?YE60x7O4ZTub24JeGODbhKGcJlSIOWjID/Mu46AFmXsOe/tRoIqNqCH/SJ1S?=
 =?us-ascii?Q?w+x2dD+rCgaRajm/9X8zcvUOy0RrsYt+NTbWQswIkTmSxUeFhKL4Xgtc5anx?=
 =?us-ascii?Q?tWXsv8fUPGIhdzB++DlaZKGPnBrqMJ/3vqtyWo/WM6NBvkE9w8QzQBhh0KE8?=
 =?us-ascii?Q?ZFBjMR7ILggtWg364oTqUEDFcCue81vrqOXuFD5z3NpItCPb8PILeoT0JNkI?=
 =?us-ascii?Q?JKWsxQpdERm3DmgGXBWSzNEZOuA29T/hRo0PdkGtKZ+hPYMzV75mUsyH3DSQ?=
 =?us-ascii?Q?jhCCU8WxaQFLWZL2bisocKWgO6pFanhmA+JxWcjST+lJaPrvSJ5gb+KjhcV5?=
 =?us-ascii?Q?u/j49Hx3f3yv8vjzvO7Q/qjw6l+EZkm2LHWfXVq9iYT4f9Gek9zq1Y4tSlwY?=
 =?us-ascii?Q?h/vuQTlbdR/Ky+2qNoA+gyZwXcGdxIP3jDW12APq6U7Ay1HI63UoNc1cVdV6?=
 =?us-ascii?Q?5tVXLMSK0V5fr/nibBCPcQPCccPctq9PXTJeDvNban7nj2tGPEV1VOlJqnMe?=
 =?us-ascii?Q?Xf6AvMZG338qUS7iZh5CcoD2ziqxnVDGVpd7yQd0ya/dqk88rJiM28A3Azya?=
 =?us-ascii?Q?agdnoXM3Nrsh7B5noTWazawQZv54+FwEHKcM47WkPoD9TWlsRI7As4ggFOHi?=
 =?us-ascii?Q?W/8rxVgfoUNThuWi0cZpwJ/Dw8C3uJJHQDaa2PnMGWq7Wzfq2uKT7yn2dmmd?=
 =?us-ascii?Q?KpsWT4UHjKjza2LZ/BO09wAN3KiXjX+u5SuRQ4Fwc4R4gOjo7F/DOWGWdhYV?=
 =?us-ascii?Q?r3nicCMoDPI8BGjec6R2Y5mMsxdSj7qqmYlFXOCjimpOA1iUR3FhTVqwdUjY?=
 =?us-ascii?Q?cFKOxNigrlwMkDsyoJW7WJlW+z+SnUgcybFy3IEJFMDCercGebLwtE5A+v1I?=
 =?us-ascii?Q?AzVRAbth9tWoofOcoW2MtN3lc1tldkzE1ZpTfasCQQaQ6TNWSFp/8L0j5j3t?=
 =?us-ascii?Q?NAL9YXLwVFoovqw4TUZSAkuW/Z4Sr4T5uhiDZUZu9AH5s9crhXfuCmJT9rag?=
 =?us-ascii?Q?OjDcsSbcHa9U5ZH6nap5JtTDAcTJv460P5pI2Ey58t5e8Mj4vx/tR+o9jrX9?=
 =?us-ascii?Q?sQfyiSaNZpt7vZW82pjUUgBfCmn9GdZgKBKtrOTRL/Q0Iy5A8Shl3JbaSrUp?=
 =?us-ascii?Q?Wj9bty4zOA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: t5it5CJfaQyo1l1146km/z58TimtHxhyfbKXCybwL7TEpiMsnK7TcsV1AJubsJSJE/JJiN2Y8lvPqV84w4jo3ieqZA6YI8U36BgC0xl8rTUK2E6+bjv2SFwJhFtebhoRY6yy/U1gbXZIlPF7eOUWIbrgeAr5/wTpzeINf1KAfcZe6+AngF70KFfEiIXrsspOoRgFw4SGV4iwp5iY5pDUqXxOi7w7TZXgAwzduy/2bJ7KymsKA0N5Nu7sY0kETiy6S1PPd4t7ghKZSrKi+A2m8MISmqenJ7l/b1qiwKyoEK3P+QCQBa3uWVKVA74tvO+7u4p0S8og8HrEY4MaxWCVuw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685af197-4c81-4dbc-4ca6-08df247729a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 13:30:32.7792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bl4u9ebQbHS399+7GlBx0wrEErgvGHJlgSAya02YxzqNlK0RnhoLP+HvpcmrHUjWxiNjqF3c+ukvbV343Ty/Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6855
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

Hello Sowmiya,

> -----Original Message-----
> From: S, Sowmiya <sowmiya.s@intel.com>
> Sent: Tuesday, September 29, 2026 2:35 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v1 5/5] tests/intel/kms_alpm: add ALPM LOBF subtest
>=20
> Add the alpm-lobf subtest: verifies LOBF (Link-Off Between Frames) can be
> enabled on an eDP output once PSR/PSR2/Panel Replay are disabled, and
> that Panel Replay stays off while LOBF is active. LOBF is eDP only, so DP
> outputs are skipped during enumeration for this subtest.
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> Assisted-by: Gnai_Claude:sonnet-5
> ---
>  tests/intel/kms_alpm.c | 177
> ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 176 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_alpm.c b/tests/intel/kms_alpm.c index
> 700d5fb50..914b594bd 100644
> --- a/tests/intel/kms_alpm.c
> +++ b/tests/intel/kms_alpm.c
> @@ -30,12 +30,42 @@
>   *              eDP: Panel Replay may use either aux-wake or aux-less AL=
PM.
>   *              On both connector types, LOBF must stay off while Panel
>   *              Replay is active.
> + *
> + * SUBTEST: alpm-lobf
> + * Description: Verify LOBF can be enabled on an eDP output once
> PSR/PSR2/
> + *              Panel Replay are disabled, and that Panel Replay stays o=
ff
> + *              while LOBF is active.
>   */
kms_vrr already has lobf and lobf-dc3co subtests covering this: they
call psr_disable() and then check "LOBF status" while flipping at
video rates on a high and a low refresh rate mode. Please say in the
commit message what alpm-lobf adds over kms_vrr@lobf, or move the
shared pieces into lib so LOBF coverage lives in one place.

>=20
>  #define ALPM_INFO_FILE		"i915_edp_lobf_info"
> +#define ALPM_DEBUG_FILE		"i915_edp_lobf_debug"
>  #define ALPM_INFO_MAX_LEN	512
>  #define ALPM_TIMEOUT_MS		100
>=20
> +/*
> + * LOBF needs longer to settle than PR/aux-less ALPM: after Panel
> +Replay is
> + * disabled and the modeset happens, the link visibly bounces between
> + * aux-wake-only and aux-less-only for a while before the LOBF bit
> +actually
> + * latches, unlike PR which comes up inside ALPM_TIMEOUT_MS. Observed
> +taking
> + * several seconds on a NovaLake eDP panel.
> + */
> +#define ALPM_LOBF_TIMEOUT_MS	5000
Any idea why link settling time is ~5s
Can you compare the timestamp of "Link off between frames (LOBF) enabled" w=
ith when the poll first sees LOBF, and retry with DC states disabled.

> +
> +/*
> + * Mirrors I915_PSR_DEBUG_DISABLE and
> +I915_PSR_DEBUG_PANEL_REPLAY_DISABLE
> + * from intel_display_types.h. intel_alpm_lobf_compute_config_late()
> +kills
> + * has_lobf whenever crtc_state->has_psr is true, and has_psr is set by
> + * intel_psr_compute_config() (intel_psr.c) if *either* Panel Replay or
> + * classic PSR/PSR2 succeeds - so LOBF needs both disabled, not just PR:
> + * DISABLE alone (mode 0x1) only gates classic PSR/PSR2, leaving
> + * panel_replay_global_enabled() untouched (PR keeps winning); PANEL_
> + * REPLAY_DISABLE alone (0x40) only blocks PR, and PSR2 then takes over
> +and
> + * keeps has_psr true instead. Both bits have to be set together.
> + */
Explanation seems to be incorrect, please reverify once,
Please use psr_disable() from lib/igt_psr (like kms_vrr lobf) and drop the
local defines, set_psr_pr_disable_debug() and psr_needs_restore. Same for
the comment above test_alpm_lobf().

> +#define PSR_DEBUG_FILE			"i915_edp_psr_debug"
> +#define PSR_DEBUG_DISABLE		0x1
> +#define PSR_DEBUG_PANEL_REPLAY_DISABLE	0x40
> +
>  /*
>   * The kernel gates creation of the ALPM debugfs files on
>   * intel_alpm_source_supported(): external DisplayPort needs display ver=
 35,
> @@ -79,6 +109,7 @@ typedef struct {
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
>  	struct igt_fb fb;
> +	bool psr_needs_restore;
>  } data_t;
>=20
>  static bool output_is_dp(igt_output_t *output); @@ -296,6 +327,26 @@
> static bool alpm_read_status(int drm_fd, igt_output_t *output,
>  	return true;
>  }
>=20
> +/*
> + * alpm_is_enabled() alone isn't enough here: aux-less-only ALPM (no
> +LOBF)
> + * shows up as "enabled" too, and the trace on a NovaLake eDP panel
> +shows
> + * the link bouncing through exactly that state - and through
> +aux-wake-only
> + * and briefly missing debugfs entirely during the transition - before
> +LOBF
> + * itself latches. Wait on the LOBF bit specifically, with the longer
> +budget
> + * that settling needs.
> + */
> +static bool alpm_lobf_active(int drm_fd, igt_output_t *output) {
> +	struct alpm_status status;
> +
> +	return alpm_read_status(drm_fd, output, &status) && status.lobf; }
> +
> +static bool alpm_wait_lobf_enabled(int drm_fd, igt_output_t *output) {
> +	return igt_wait(alpm_lobf_active(drm_fd, output),
> +ALPM_LOBF_TIMEOUT_MS, 50); }
> +
>  /*
>   * psr_get_mode(fd, output) reads "<connector>/i915_psr_status" under th=
e
>   * device debugfs dir. Some kernels only ever expose the legacy single-e=
DP
> @@ -342,6 +393,43 @@ static void alpm_dump_status(int drm_fd,
> igt_output_t *output)
>  		 status.lobf ? "enabled" : "disabled");  }
>=20
> +/*
> + * The debug knob holds intel_dp->alpm.lobf_disable_debug, consumed by
> + * intel_alpm_lobf_compute_config() at atomic check time. Writing it
> +therefore
> + * has no effect until the next modeset.
> + *
> + * Since "drm/i915/alpm: Introduce has_alpm to decouple from
> +pr/psr2/lobf" ties
> + * has_alpm to has_lobf, this is also the only userspace control that
> +can take
> + * ALPM itself down on an otherwise idle DP link.
> + */
> +static bool alpm_set_disable_debug(int drm_fd, igt_output_t *output,
> +				   bool disable)
> +{
> +	const char *val =3D disable ? "1" : "0";
> +
> +	return igt_debugfs_write_connector_file(drm_fd, output->name,
> +						ALPM_DEBUG_FILE,
> +						val, strlen(val)) =3D=3D 0;
> +}

This is only called with disable =3D=3D false from test_cleanup(), so the k=
nob
is never really used. Also, cleanup writes 0 unconditionally and overwrites
the user's value, and nothing clears it before alpm-lobf, so a stale 1 in
i915_edp_lobf_debug makes the subtest skip with "LOBF not enabled after
modeset".

Please either drop it, or save the value at start, set 0 before the test
and restore it in cleanup.

> +
> +/*
> + * i915_edp_psr_debug is global (one file for the whole display,
> +applied to
> + * every PSR-capable encoder), not per-connector - see the FIXME in
> + * lib/igt_psr.c's psr_write(). "0x0" restores I915_PSR_DEBUG_DEFAULT.
> + */
> +static bool set_psr_pr_disable_debug(int debugfs_fd, bool disable) {
> +	char val[8];
> +	int ret;
> +
> +	snprintf(val, sizeof(val), "0x%x",
> +		 disable ? (PSR_DEBUG_DISABLE |
> PSR_DEBUG_PANEL_REPLAY_DISABLE) : 0);
> +
> +	ret =3D igt_sysfs_write(debugfs_fd, PSR_DEBUG_FILE, val, strlen(val));
> +
> +	return ret =3D=3D (int)strlen(val);
> +}
Following on from the above, please use psr_disable(). Besides being
the existing helper, it registers restore_psr_debugfs() as an IGT exit
handler, so the debug value is put back even if the test is killed or
aborts. test_cleanup() only runs if the process gets that far, so a
crash here leaves PSR/PR disabled for every test that runs on the
machine afterwards.


> +
>  /*
>   * Light the output up. ALPM on an idle link is reached via LOBF, which
>   * requires a fixed refresh rate (intel_vrr_is_fixed_rr()), so the mode =
is @@ -
> 374,7 +462,27 @@ static void test_cleanup(data_t *data)
>  	igt_output_t *output =3D data->output;
>  	igt_plane_t *primary;
>=20
> -	/* Clear any output mode override left behind by the mode under
> test. */
> +	/*
> +	 * Clear the debug override unconditionally. A subtest that fails
> +	 * midway would otherwise leave it set, suppressing ALPM for
> +	 * everything that runs afterwards on this machine.
> +	 */
> +	if (alpm_has_debugfs(data->drm_fd, output))
> +		alpm_set_disable_debug(data->drm_fd, output, false);
> +
> +	/*
> +	 * test_alpm_lobf() sets PSR_DEBUG_DISABLE |
> PSR_DEBUG_PANEL_REPLAY_
> +	 * DISABLE in the global i915_edp_psr_debug file. That write outlives
> +	 * this dynamic subtest (all of them share one process), so every
> +	 * later output/subtest would run with PSR/PR forced off unless it is
> +	 * put back here.
> +	 */
> +	if (data->psr_needs_restore) {
> +		set_psr_pr_disable_debug(data->debugfs_fd, false);
> +		data->psr_needs_restore =3D false;
> +	}
> +
> +	/* Clear any output mode override, matching the debug-state resets
> +above. */
>  	igt_output_override_mode(output, NULL);
>=20
>  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY); @@ -471,6 +579,55 @@ static void
> test_alpm_panel_replay(data_t *data)
>  		 output->name, alpm_mode_str(output, &status));  }
>=20
> +/*
> + * LOBF is eDP only (DP2.1 ALPM only ever runs through Panel Replay,
> +see
> + * test_alpm_panel_replay()). intel_alpm_lobf_compute_config_late()
> +(kernel
> + * intel_alpm.c) unconditionally clears has_lobf whenever
> +crtc_state->has_psr
> + * is true, and intel_psr_compute_config() (intel_psr.c) sets has_psr
> +from
> + * *either* Panel Replay or classic PSR/PSR2 succeeding - so both have
> +to be
> + * disabled together, not just PR: PSR_DEBUG_DISABLE alone leaves Panel
> + * Replay's own enable check untouched (PR keeps winning), and
> +PSR_DEBUG_
> + * PANEL_REPLAY_DISABLE alone just lets PSR2 take over and keep has_psr
> +true
> + * instead. psr_disable()'s plain I915_PSR_DEBUG_DISABLE write is
> +therefore
> + * the wrong knob here.
> + */
> +static void test_alpm_lobf(data_t *data) {
> +	igt_output_t *output =3D data->output;
> +	struct alpm_status status;
> +
> +	igt_require_f(!output_is_dp(output), "%s: LOBF is eDP only\n",
> +output->name);
> +
> +	require_no_audio(data, output);
> +
> +	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> output) ||
> +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2,
> output) ||
> +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE,
> output)) {

Besides disabling PSR, please require the LOBF sink preconditions
here: the ALPM cap (0x02e bit0 or bit2) and AS SDP (rev >=3D 0x13 and
0x2214 bit0)

> +		igt_require_f(set_psr_pr_disable_debug(data->debugfs_fd,
> true),
> +			      "%s: failed to write %s\n", output->name,
> PSR_DEBUG_FILE);
> +		data->psr_needs_restore =3D true;
> +	}
> +
> +	test_setup(data);
> +
> +	alpm_dump_status(data->drm_fd, output);
> +
> +	igt_require_f(alpm_wait_lobf_enabled(data->drm_fd, output),
> +		      "%s: LOBF not enabled after modeset\n", output->name);

Kernel that stops enabling LOBF makes this SKIP.
Once the preconditions are required, this should be an igt_assert.
The one legitimate skip is the timing condition the kernel checks in intel_=
alpm_lobf_compute_config_late() (window1, and guardband vs. wake lines), wh=
ich userspace can't see.
For that, kms_vrr retries on a lower refresh rate mode before giving up; I'=
d do
the same here and only skip if no mode works.


Thanks and Regards
Kunal Joshi

> +
> +	igt_require(alpm_read_status(data->drm_fd, output, &status));
> +
> +	igt_assert_f(status.lobf,
> +		     "%s: ALPM enabled but not via LOBF\n", output->name);
> +
> +	igt_assert_f(!psr_panel_replay_enabled(data->debugfs_fd, output),
> +		     "%s: Panel Replay must not be active while LOBF is
> enabled\n",
> +		     output->name);
> +
> +	igt_info("%s: LOBF active, ALPM mode %s\n",
> +		 output->name, alpm_mode_str(output, &status)); }
> +
>  static void run_test(data_t *data, void (*test)(data_t *))  {
>  	igt_output_t *output;
> @@ -481,6 +638,18 @@ static void run_test(data_t *data, void (*test)(data=
_t
> *))
>  		if (!output_is_alpm_capable_type(output))
>  			continue;
>=20
> +		/*
> +		 * LOBF never latches on DP: has_lobf is unconditionally
> +		 * cleared whenever has_psr is set, and DP always sets
> has_psr
> +		 * via Panel Replay (see test_alpm_lobf()). Skip enumeration
> +		 * entirely instead of creating a dynamic subtest that always
> +		 * SKIPs.
> +		 */
> +		if (test =3D=3D test_alpm_lobf && output_is_dp(output)) {
> +			igt_info("%s: skipping, LOBF is eDP only\n", output-
> >name);
> +			continue;
> +		}
> +
>  		for_each_crtc(&data->display, crtc) {
>  			igt_display_reset(&data->display);
>  			igt_output_set_crtc(output, crtc);
> @@ -526,6 +695,12 @@ int igt_main()
>  	igt_subtest_with_dynamic("alpm-panel-replay")
>  		run_test(&data, test_alpm_panel_replay);
>=20
> +	igt_describe("Verify LOBF can be enabled on an eDP output once
> PSR/PSR2/"
> +		     "Panel Replay are disabled, with Panel Replay staying off "
> +		     "while LOBF is active.");
> +	igt_subtest_with_dynamic("alpm-lobf")
> +		run_test(&data, test_alpm_lobf);
> +
>  	igt_fixture() {
>  		close(data.debugfs_fd);
>  		igt_display_fini(&data.display);
> --
> 2.43.0

