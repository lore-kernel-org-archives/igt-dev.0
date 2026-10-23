Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0AB606A319
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 03:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HRQ/E9g3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FD38825E;
	Fri, 23 Oct 2026 03:52:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C751E10E1DE
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 03:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792727478; x=1824263478;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=b/bR63I77qGl8f8g9TXPZSv+TscHAsRiKZ1JVuXWnig=;
 b=HRQ/E9g3xJJmIkaA/4adhNEvOyBo4uPfWbpFiumClexlG0CZIHHKWv9F
 j2WS2Qz7AYZ/QX32Jnic5JiNXasd0z9+t0FEUGZ1tRKYVBIMK/vYYWi/P
 PAYGDJ/Jd0zvt7mJ2kPGmJlopv2XhMcnpAcM2TAG0vnaTRYCs/3xuhh60
 SphpzmC9RGKmfgiohjMkV/LQx8tGVO3JaNNTKj837xdN3vadFrcppTHQZ
 2+LqgJHucvb9NjaoobyVV1o7g8QtTchkYg8fI9nLszml3tem84CfhKy99
 uu+inMpBpB8nEAqDI9N9GulRfXLsSr8lTJB+DA/vn/qi5Cotgbx+eVQ8z Q==;
X-CSE-ConnectionGUID: 1WBjk/aPQLyEHcbk7aNkpA==
X-CSE-MsgGUID: DLeekTRcSGKtd+Pzv6HlSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1367020"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; d="scan'208,217";a="1367020"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 20:51:17 -0700
X-CSE-ConnectionGUID: GH/dGJUjSnKo80jJ7HPtFA==
X-CSE-MsgGUID: Hv5MJPoPSfOaOwYEJu0qBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; d="scan'208,217";a="4009591"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 20:51:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 20:51:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 20:51:16 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 20:51:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecuZ34WRBWzWwJ1VkMsH+88kyBjw5990IUGvNWgi4+5vRq9HnLZL8OJEw0f6vg1mdNh5BalGWdXX2D1hyC+LZaCl2Sj+vlrd/hdYDnLPgpZd9BTOFLy0ohy3lrLilu5l/feIsVabU0Szq6aQqORYfR9wF8iEspW4QPX4N6m2tA5CcCCIXMasGReNthYl3coY9hX3IS/FDyiquYlpwGFNQsjTnCg7E78H+1OZhLTlM3ivtov8lOPeBFBLqjN0OtjIFHgdJc/XiCCCsZ/hKmNTAkHgFEgt5FqpI+pDvX9Nm1KqYylbZpwCmye6R7WbI6rT82JcG6wA+RRfQFZKFUGGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKoBUC38o4YPQ4+O+Miu1lWGYadi/ibS1OJjr/45Zdc=;
 b=xjcaqzaBcZ9ADI+R79a01pmk41vIYUSZ2iOcea0J8Ts+26poAW31nRfs4wi7jcDD8krjFyfPkD/nnQSr0W3qyzhZrip26HKnXB3u7/X04qXLFYCLDStmPymqnwT5rdvgKdV9a930r8/X5UDUCD4Ui7FjjkrbO3lzX1OhEIUjKIGZAGB74zFiQUpIVHdhCpdvFzKucUHkRGh3toqJx0uldBb7KZ5wT2QurNAt2bbx3npS1lkmC+Ewk1/Lz7AW4SOo7h0vjBJ1KSb03TOURCoLKHwhuOyUw+SsLijeaXJCH+iNA2L47ZFPMcpi/25fuTA8ByYRFFMSK62mo6Kvr23obA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 by PH3PPFD114713BA.namprd11.prod.outlook.com (2603:10b6:518:1::d50)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 03:51:14 +0000
Received: from BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4]) by BL1PR11MB6050.namprd11.prod.outlook.com
 ([fe80::37cd:d599:fc6f:eef4%2]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 03:51:13 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/kms_dirtyfb: Use a smaller fb on
 simulation
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dirtyfb: Use a smaller fb on
 simulation
Thread-Index: AQHdXS5tEhlJxiiCU0Gi0dw/mvovn7cJxXIAgAATmxU=
Date: Fri, 23 Oct 2026 03:51:13 +0000
Message-ID: <BL1PR11MB605095F7E9786308157D759EE7642@BL1PR11MB6050.namprd11.prod.outlook.com>
References: <20261016052243.633897-1-pranay.samala@intel.com>
 <0f394435-4ca7-4a39-84f3-57db6555864a@intel.com>
In-Reply-To: <0f394435-4ca7-4a39-84f3-57db6555864a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB6050:EE_|PH3PPFD114713BA:EE_
x-ms-office365-filtering-correlation-id: fc3912c6-feef-4044-8e2a-08df30b8e251
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|261021123027099003|261009223027099003|261022105027099003|261022075727099003|38070700021|56012099006|11063799006|4143699003|5023799004|10067099003|22082099003|18002099003|261021121427099003|6133799003|3023799007|8096899003|261022113327099003|261022115727099003;
x-microsoft-antispam-message-info: RmAirJciby7lzbYcXC7mz2jfMkepVyNoGvhpiEpys7pO9KmKCSD0XSRXZOamLAiEU+HzTtV26L+6VoRCn7OXn5ILcvljdPfF14KFmmn/xvpGXZdqDY2fprJLrfCO/ZyQ6m7gx/fLH+VgeeC6C7CZ1nEvgvEJQpqgZ8ux7ZvoR8sbC+596WbYvmne4R9t4azlm5KxPUy4z1QLrtED409pb5Lk5RMhq+nEUW7DCCAMPTCcOwthlToGzc6//4WhEUv/LojlMoryg/VfuS2qMiMG4/PVXnqlj/F09dFsOgFZ2whdD8avA6G4KlY4xQDYv0/vn5vataE76vBZDNhytzTWp+c4qUAQvdMpksNUzQlEVJF8e3iQ4gTyNjyqS0pwLL2071ZO0bEnMrkENZeHKLxDurHAkMO3gtIlYjxJVvFZZkzO6GUGx69cxOXYH4r3SAlMviBq+HNrCu9g99kKzW5UY7Jy7TtGo71UljBfYyFolFwfy49LfVYUQZLLn4v5UsPCDG7KQIfJjNzLy7v1V6Z6+UhsqP4nCHsisBPHX95nUtbXlkVbfpQxUb5BAvxTXw/CKIMdbInsFx+f+dRYVrmc+Zwf1Ne2hQZasz3oKKy2Szi0Nauaa9dU6on3/gZmTMfFGTZCDDo36rMNc06y00SMCg8YxDgMakq9e9TjAmUmrNj9iRigRuLdDS7cZNSVEhG0YSh7lvRH9Rv6oHy/ClKldvD1/suqOvsADrb8YYOMQmo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB6050.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261021123027099003)(261009223027099003)(261022105027099003)(261022075727099003)(38070700021)(56012099006)(11063799006)(4143699003)(5023799004)(10067099003)(22082099003)(18002099003)(261021121427099003)(6133799003)(3023799007)(8096899003)(261022113327099003)(261022115727099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Y1m5XvI5syRC0fUVtqRrJ5EEBM9Tsi/NmD2tTnRzuJpM/oxKWIJzuxBG94?=
 =?iso-8859-1?Q?U3xMseSupWvNP+ixNpV4H8x6EiRyeKb0IRuMPYxUTmxN6RmB5olQy4grgx?=
 =?iso-8859-1?Q?QgT/1tnvQFK2iL6nOohemAKPvThxVOdG5tX8maMgbGO2Yi4gD5wG6yJeMC?=
 =?iso-8859-1?Q?mNm6UU5CI5HwEq9c6lLu3ZJxui+ej0VDUgP+6lI1bbWUorBETCOkAMxvH0?=
 =?iso-8859-1?Q?RKSb5cOcVAteciOs1CI4LTAL4IBidx51g9tr5yxBzHvA6dl9zi/s71imsk?=
 =?iso-8859-1?Q?1eKPO7dAau3+4en1RnxvKjgg+0AJHt5AgLWpAtOar7ZrzVKcnyzw1PMdD3?=
 =?iso-8859-1?Q?pgwhqOOOnaDGSECG9p6sRTZGA0bQ5uU53elj8Yv/St7BQgeFeJ4tUiCTyk?=
 =?iso-8859-1?Q?S6f+hLq1gEvZ7172gv84cQcfW3infyqSp0HdL+p2TNAXH/Z/mGVcB5DoZs?=
 =?iso-8859-1?Q?QPkMKOgDKViHFxRw2WJpNKsAwle2fekL9P9qPIIljaDyfDov/llDvxmEE7?=
 =?iso-8859-1?Q?GfKjjuEKphdG6mPRNhepXQBEP+5hq8CuazQYCzfwA3LauHEAlSKLxag5S0?=
 =?iso-8859-1?Q?wb6GIIbhhqqNYggXRS2FYH+u6F9UcXlYKA1W/B78KfyBSHzyLvz7eQGbTi?=
 =?iso-8859-1?Q?56UUd4QXvrW+txaME+f8UUDNPGh+B07ccwfgXFHr6lWeJNMzr5Bb74sHDX?=
 =?iso-8859-1?Q?nOIVsfPZ8mzR0oNYOVRDbHrJvdKkN8Egzsn9q+G0i+6nCRQVOnu7UQgEur?=
 =?iso-8859-1?Q?6xkpxW6NVqmiEVca+/Xx8Xf40oKdMw1UEXHmjkKty98JqtzSnHYRm3l8LE?=
 =?iso-8859-1?Q?lgyB3xAjLPFm52Rw4petYpIM8wOoZlvEWmLlzM50mIZZZDTSg2LHFcUo3i?=
 =?iso-8859-1?Q?dXHRV8N14u9d8HHojtGQCxMdwrPoWygxZzOmJc6mVu1QGZw13Kf6v5OKWW?=
 =?iso-8859-1?Q?JKuOL0VZC6OFiysp0O+QSFMTIKnAim1GZesxhyy96dDAySoNNAchr7siQb?=
 =?iso-8859-1?Q?sCtTWhWWOyjevFcv1lEkjkRpW3p23C4IrIYsIlZHR66IZSAUDyNvbKXljj?=
 =?iso-8859-1?Q?JS8IGWl85qbPSE7o3jxEr/fRbyKOdq6wBZAdFm5GxIMkA8vq0wbH2ncQwX?=
 =?iso-8859-1?Q?LfG8E9hDCdJDGYwiKARaxjX4ZRLnAFD6+9s78sRo9xI7UW6+MBjuGS6zPh?=
 =?iso-8859-1?Q?nIrU01EjXFscdtR9PMlEkBli/S50VVQ0szRErNgK3eIqBJzCzaX8r17hw3?=
 =?iso-8859-1?Q?ttFTM5M0ilZiYEdPJMeF4KikgCzbrS1BPOqW83W0Y0ES8n+itjm6Hl0CH7?=
 =?iso-8859-1?Q?KamK+xsRaloMamwgQTzzjCfRAkEhZsnWi17VqSdM0fyLzgNqCBabnaevSw?=
 =?iso-8859-1?Q?N6ycS79AZ/5bVbWoZ45tTI3d2sJvsKD+kD3dodmMr9jNDVMqmDA6ISyuI8?=
 =?iso-8859-1?Q?7RfIlLnJk+RybpsDVMr9s5oBVhnzXaOr20ab4RQJNRHTkmKJOH0RWYfxT+?=
 =?iso-8859-1?Q?f8N/xeMOKqEOoOSUrYw9sSOg/i6LZJDHi6DFXmgW41HGcQHvzGIfOMRm7a?=
 =?iso-8859-1?Q?pZWLQ23e3nNl5oD0lEXWaJ5jQWnWnBNQMWJugtGfuWE8MdFJOcIoDMixN0?=
 =?iso-8859-1?Q?NWp3fcm03iFI61RNz3mPiMFU5UgJt2LcS6wskjB43MtfMI8zuv3GS7EGFJ?=
 =?iso-8859-1?Q?tFvjOYAtOCZ++QD4mAIb61lnj5fRmtvkySBxjOHyHChenvOxVolFHRFikU?=
 =?iso-8859-1?Q?m9oU9PBrV7V/a8jMM1VO9yscASN8OaGKWJC0oisAVgYuYajx9mOZDhGvE/?=
 =?iso-8859-1?Q?k1FCp4R7jw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR11MB605095F7E9786308157D759EE7642BL1PR11MB6050namp_"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: K45oCAPlIcV1wV939dykkRshci3X474H3EI4NJAPo0avz4jmfAxON02SlTS69p6pzplGNA00SCIpEEE/3wk269NpkFajJyVR11DMbPhO4HUu9nqNsKqc3O63ZJAPApof3qsf6HCXT5RYQoBak/Rm6BoJPxBsrIQWSb19QICvp96RmzPhZLOtg73hNt2MWAA+7I9vaXyK1G1QkMwRaIT4RY7NkVQP3AhoOj1f00Klzm1lj3IDuYAfcq6WA56vV7U8eS/vLw9HDnzIVtlBKfHRT67ye8O0HpYsZTn6+ETWEpVQfvWGsZ3ro1R6pUF4UasUKFyzCQFEREyKbXbwAp1Q4w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB6050.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3912c6-feef-4044-8e2a-08df30b8e251
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 03:51:13.8696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ItLekh+EwpAUC3a3kz76jmmccmgIG+58mtPE3MV8xAMhgp2x6Avm+RlAoRW3+Mip/ik5Ud/94E/F/j6TiaWYew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD114713BA
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--_000_BL1PR11MB605095F7E9786308157D759EE7642BL1PR11MB6050namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Rama,

Using a hard-coded 1024x768 framebuffer can break on panels whose native re=
solution is smaller than the simulation size. On panels with resolutions sm=
aller than 1024=D7768, the test may require scaling or may not represent th=
e native display configuration. Consider deriving the simulated framebuffer=
 dimensions from mode->hdisplay and mode->vdisplay to keep the test portabl=
e across different display resolutions.
Thanks for the review.
The fb size is derived from the mode. fb_width/fb_height are initialised fr=
om mode->hdisplay/vdisplay and only clamped with min_t() to 1024x768 when r=
unning in simulation. On panels smaller than 1024x768 the fb stays at the n=
ative mode size, so no scaling is involved. Outside simulation nothing chan=
ges.

Regards,
Pranay

From: igt-dev <igt-dev-bounces@lists.freedesktop.org> on behalf of Naladala=
, Ramanaidu <Ramanaidu.naladala@intel.com>
Sent: Thursday, 22 October 2026 16:10:50
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/kms_dirtyfb: Use a smaller fb on sim=
ulation


Hi Pranay,
On 10/16/2026 10:52 AM, Pranay Samala wrote:

The test creates, fills and copies full-screen fbs with

the GPU, which is too slow on simulation, and test hits

timeout.



When running in simulation, limit the fbs to 1024x768.

The CRC still covers the whole pipe, and the reference

and test frames have the same layout.



Signed-off-by: Pranay Samala <pranay.samala@intel.com><mailto:pranay.samala=
@intel.com>

---

 tests/intel/kms_dirtyfb.c | 30 +++++++++++++++++++++---------

 1 file changed, 21 insertions(+), 9 deletions(-)



diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c

index 48fcb6c61..4674bd2c8 100644

--- a/tests/intel/kms_dirtyfb.c

+++ b/tests/intel/kms_dirtyfb.c

@@ -50,11 +50,15 @@ IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working=
 properly with "

 #define PAGE_ALIGN(x) ALIGN(x, PAGE_SIZE)

 #endif



+#define SIM_FB_WIDTH   1024

+#define SIM_FB_HEIGHT  768
Using a hard-coded 1024x768 framebuffer can break on panels whose native re=
solution is smaller than the simulation size. On panels with resolutions sm=
aller than 1024=D7768, the test may require scaling or may not represent th=
e native display configuration. Consider deriving the simulated framebuffer=
 dimensions from mode->hdisplay and mode->vdisplay to keep the test portabl=
e across different display resolutions.




+

 typedef struct {

  int drm_fd, devid;

  int debugfs_fd;

  igt_display_t display;

  drmModeModeInfo *mode;

+ int fb_width, fb_height;

  uint64_t modifier;

  igt_output_t *output;

  igt_pipe_crc_t *pipe_crc;

@@ -106,10 +110,10 @@ static bool check_support(data_t *data)

         }



         if (!intel_fbc_plane_size_supported(&data->display,

-                                           data->mode->hdisplay,

-                                           data->mode->vdisplay)) {

+                                           data->fb_width,

+                                           data->fb_height)) {

                 igt_info("Plane size (%d, %d) not supported as per FBC siz=
e restrictions\n",

-                         data->mode->hdisplay, data->mode->vdisplay);

+                         data->fb_width, data->fb_height);

                 return false;

         }

         return true;

@@ -234,8 +238,8 @@ static void prepare(data_t *data)

  data->pipe_crc =3D igt_crtc_crc_new(data->crtc,

                                  IGT_PIPE_CRC_SOURCE_AUTO);



- igt_create_color_fb(data->drm_fd, data->mode->hdisplay,

-                    data->mode->vdisplay, DRM_FORMAT_XRGB8888,

+ igt_create_color_fb(data->drm_fd, data->fb_width,

+                    data->fb_height, DRM_FORMAT_XRGB8888,

                     data->modifier, 0.0, 1.0, 0.0,

                     &data->fbs[0]);



@@ -256,8 +260,8 @@ static void prepare(data_t *data)



  igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);



- igt_create_color_fb(data->drm_fd,  data->mode->hdisplay,

-                    data->mode->vdisplay, DRM_FORMAT_XRGB8888,

+ igt_create_color_fb(data->drm_fd, data->fb_width,

+                    data->fb_height, DRM_FORMAT_XRGB8888,

                     data->modifier, 0.0, 1.0, 0.0,

                     &data->fbs[1]);

  igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[1],

@@ -265,8 +269,8 @@ static void prepare(data_t *data)

                  0, 0, data->fbs[1].width,

                  data->fbs[1].height, 0xFF);



- igt_create_color_fb(data->drm_fd, data->mode->hdisplay,

-                    data->mode->vdisplay, DRM_FORMAT_XRGB8888,

+ igt_create_color_fb(data->drm_fd, data->fb_width,

+                    data->fb_height, DRM_FORMAT_XRGB8888,

                     data->modifier, 0.0, 1.0, 0.0,

                     &data->fbs[2]);



@@ -382,6 +386,14 @@ int igt_main()

                                                     crtc,

                                                     data.output) {

                                data.mode =3D igt_output_get_mode(data.outp=
ut);

+                               data.fb_width =3D data.mode->hdisplay;

+                               data.fb_height =3D data.mode->vdisplay;

+                               if (igt_run_in_simulation()) {

+                                       data.fb_width =3D min_t(int, data.f=
b_width,

+                                                            SIM_FB_WIDTH);

+                                       data.fb_height =3D min_t(int, data.=
fb_height,

+                                                             SIM_FB_HEIGHT=
);

+                               }



                           igt_skip_on_f((IS_BATTLEMAGE(data.devid) && data=
.feature =3D=3D FEATURE_FBC),

                                               "FBC isn't supported on BMG\=
n");

--_000_BL1PR11MB605095F7E9786308157D759EE7642BL1PR11MB6050namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#464FEB;
	text-decoration:none none;}
code
	{mso-style-priority:99;
	font-family:"Courier New";}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}
span.EmailStyle22
	{mso-style-type:personal-compose;
	font-family:"Times New Roman",serif;
	color:black;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#464FEB" vlink=3D"#464FEB" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black">Hi Rama=
,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid #C8C8C8 2.25pt;padding:0in 0in =
0in 8.0pt;margin-left:30.0pt;margin-top:11.0pt;margin-right:30.0pt;margin-b=
ottom:11.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:#666666">Using=
 a hard-coded 1024x768 framebuffer can break on panels whose native resolut=
ion is smaller than the simulation size. On panels with resolutions smaller=
 than 1024=D7768, the test may require
 scaling or may not represent the native display configuration. Consider de=
riving the simulated framebuffer dimensions from mode-&gt;hdisplay and mode=
-&gt;vdisplay to keep the test portable across different display resolution=
s.<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black">Thanks =
for the review.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black">The fb =
size is derived from the mode. fb_width/fb_height are initialised from mode=
-&gt;hdisplay/vdisplay and only clamped with min_t() to 1024x768 when runni=
ng in simulation. On panels smaller than
 1024x768 the fb stays at the native mode size, so no scaling is involved. =
Outside simulation nothing changes.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black">Regards=
,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black">Pranay<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:black">From:</span></b><span style=3D"font-=
size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black"> igt-de=
v &lt;igt-dev-bounces@lists.freedesktop.org&gt; on behalf of Naladala,
 Ramanaidu &lt;Ramanaidu.naladala@intel.com&gt;<br>
<b>Sent:</b> Thursday, 22 October 2026 16:10:50<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t] tests/intel/kms_dirtyfb: Use a smaller fb=
 on simulation</span>
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<p>Hi Pranay,<o:p></o:p></p>
<p class=3D"MsoNormal">On 10/16/2026 10:52 AM, Pranay Samala wrote:<o:p></o=
:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre>The test creates, fills and copies full-screen fbs with<o:p></o:p></pr=
e>
<pre>the GPU, which is too slow on simulation, and test hits<o:p></o:p></pr=
e>
<pre>timeout.<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>When running in simulation, limit the fbs to 1024x768.<o:p></o:p></pre=
>
<pre>The CRC still covers the whole pipe, and the reference<o:p></o:p></pre=
>
<pre>and test frames have the same layout.<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Signed-off-by: Pranay Samala <a href=3D"mailto:pranay.samala@intel.com=
">&lt;pranay.samala@intel.com&gt;</a><o:p></o:p></pre>
<pre>---<o:p></o:p></pre>
<pre> tests/intel/kms_dirtyfb.c | 30 +++++++++++++++++++++---------<o:p></o=
:p></pre>
<pre> 1 file changed, 21 insertions(+), 9 deletions(-)<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c<o:p=
></o:p></pre>
<pre>index 48fcb6c61..4674bd2c8 100644<o:p></o:p></pre>
<pre>--- a/tests/intel/kms_dirtyfb.c<o:p></o:p></pre>
<pre>+++ b/tests/intel/kms_dirtyfb.c<o:p></o:p></pre>
<pre>@@ -50,11 +50,15 @@ IGT_TEST_DESCRIPTION(&quot;Test the DIRTYFB ioctl =
is working properly with &quot;<o:p></o:p></pre>
<pre> #define PAGE_ALIGN(x) ALIGN(x, PAGE_SIZE)<o:p></o:p></pre>
<pre> #endif<o:p></o:p></pre>
<pre> <o:p></o:p></pre>
<pre>+#define SIM_FB_WIDTH&nbsp;&nbsp; 1024<o:p></o:p></pre>
<pre>+#define SIM_FB_HEIGHT&nbsp; 768<o:p></o:p></pre>
</blockquote>
<p class=3D"MsoNormal">Using a hard-coded 1024x768 framebuffer can break on=
 panels whose native resolution is smaller than the simulation size. On pan=
els with resolutions smaller than 1024=D7768, the test may require scaling =
or may not represent the native display
 configuration. Consider deriving the simulated framebuffer dimensions from=
 <code>
<span style=3D"font-size:10.0pt">mode-&gt;hdisplay</span></code> and <code>=
<span style=3D"font-size:10.0pt">mode-&gt;vdisplay</span></code> to keep th=
e test portable across different display resolutions.<br>
<br>
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre><o:p>&nbsp;</o:p></pre>
<pre>+<o:p></o:p></pre>
<pre> typedef struct {<o:p></o:p></pre>
<pre>  int drm_fd, devid;<o:p></o:p></pre>
<pre>  int debugfs_fd;<o:p></o:p></pre>
<pre>  igt_display_t display;<o:p></o:p></pre>
<pre>  drmModeModeInfo *mode;<o:p></o:p></pre>
<pre>+ int fb_width, fb_height;<o:p></o:p></pre>
<pre>  uint64_t modifier;<o:p></o:p></pre>
<pre>  igt_output_t *output;<o:p></o:p></pre>
<pre>  igt_pipe_crc_t *pipe_crc;<o:p></o:p></pre>
<pre>@@ -106,10 +110,10 @@ static bool check_support(data_t *data)<o:p></o:=
p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></pre>
<pre> <o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!intel_fbc_plane_=
size_supported(&amp;data-&gt;display,<o:p></o:p></pre>
<pre>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp; data-&gt;mode-&gt;hdisplay,<o:p></o:p></pre>
<pre>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp; data-&gt;mode-&gt;vdisplay)) {<o:p></o:p></pre=
>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp; data-&gt;fb_width,<o:p></o:p></pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp; data-&gt;fb_height)) {<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_info(&quot;Plane size (%d, %d) not supported as p=
er FBC size restrictions\n&quot;,<o:p></o:p></pre>
<pre>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  data=
-&gt;mode-&gt;hdisplay, data-&gt;mode-&gt;vdisplay);<o:p></o:p></pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  data=
-&gt;fb_width, data-&gt;fb_height);<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return false;<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<o:p></o:p></p=
re>
<pre>@@ -234,8 +238,8 @@ static void prepare(data_t *data)<o:p></o:p></pre>
<pre>  data-&gt;pipe_crc =3D igt_crtc_crc_new(data-&gt;crtc,<o:p></o:p></pr=
e>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;IGT_PIPE_CRC_SOURCE_AUTO);=
<o:p></o:p></pre>
<pre> <o:p></o:p></pre>
<pre>- igt_create_color_fb(data-&gt;drm_fd, data-&gt;mode-&gt;hdisplay,<o:p=
></o:p></pre>
<pre>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; data-&gt;mode-&gt;vdisplay, DRM_FO=
RMAT_XRGB8888,<o:p></o:p></pre>
<pre>+ igt_create_color_fb(data-&gt;drm_fd, data-&gt;fb_width,<o:p></o:p></=
pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; data-&gt;fb_height, DRM_FORMAT_XRG=
B8888,<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;data-&gt;modifier, 0.0, 1.0, =
0.0,<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&amp;data-&gt;fbs[0]);<o:p></=
o:p></pre>
<pre> <o:p></o:p></pre>
<pre>@@ -256,8 +260,8 @@ static void prepare(data_t *data)<o:p></o:p></pre>
<pre> <o:p></o:p></pre>
<pre>&nbsp; igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;data-&gt;ref_c=
rc);<o:p></o:p></pre>
<pre> <o:p></o:p></pre>
<pre>- igt_create_color_fb(data-&gt;drm_fd,&nbsp; data-&gt;mode-&gt;hdispla=
y,<o:p></o:p></pre>
<pre>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; data-&gt;mode-&gt;vdisplay, DRM_FO=
RMAT_XRGB8888,<o:p></o:p></pre>
<pre>+ igt_create_color_fb(data-&gt;drm_fd, data-&gt;fb_width,<o:p></o:p></=
pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; data-&gt;fb_height, DRM_FORMAT_XRG=
B8888,<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;data-&gt;modifier, 0.0, 1.0, =
0.0,<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&amp;data-&gt;fbs[1]);<o:p></=
o:p></pre>
<pre>  igt_draw_rect_fb(data-&gt;drm_fd, data-&gt;bops, 0, &amp;data-&gt;fb=
s[1],<o:p></o:p></pre>
<pre>@@ -265,8 +269,8 @@ static void prepare(data_t *data)<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;0, 0, data-&gt;fbs[1].width,<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;data-&gt;fbs[1].height, 0xFF);<o:p></o:p></pre>
<pre> <o:p></o:p></pre>
<pre>- igt_create_color_fb(data-&gt;drm_fd, data-&gt;mode-&gt;hdisplay,<o:p=
></o:p></pre>
<pre>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; data-&gt;mode-&gt;vdisplay, DRM_FO=
RMAT_XRGB8888,<o:p></o:p></pre>
<pre>+ igt_create_color_fb(data-&gt;drm_fd, data-&gt;fb_width,<o:p></o:p></=
pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; data-&gt;fb_height, DRM_FORMAT_XRG=
B8888,<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;data-&gt;modifier, 0.0, 1.0, =
0.0,<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&amp;data-&gt;fbs[2]);<o:p></=
o:p></pre>
<pre> <o:p></o:p></pre>
<pre>@@ -382,6 +386,14 @@ int igt_main()<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;crtc,<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;data.output) {<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.mode =3D igt_output_get_mode(data=
.output);<o:p></o:p></pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.fb_width =3D data.mode-&gt;hdispl=
ay;<o:p></o:p></pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.fb_height =3D data.mode-&gt;vdisp=
lay;<o:p></o:p></pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (igt_run_in_simulation()) {<o:p></o=
:p></pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; data.fb_width =3D min_t(int, data.fb_width,<o:p></o:p></pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SIM_FB_WIDTH);<o:p>=
</o:p></pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; data.fb_height =3D min_t(int, data.fb_height,<o:p></o:p></pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SIM_FB_HEIGHT=
);<o:p></o:p></pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></pre>
<pre> <o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp; igt_skip_on_f((IS_BATTLEMAGE(data.devid) &amp;&amp; data.feature =3D=
=3D FEATURE_FBC),<o:p></o:p></pre>
<pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;FBC isn't support=
ed on BMG\n&quot;);<o:p></o:p></pre>
</blockquote>
</div>
</body>
</html>

--_000_BL1PR11MB605095F7E9786308157D759EE7642BL1PR11MB6050namp_--
