Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2691ED3C521
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 03:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA1D10E643;
	Wed, 10 Dec 2025 03:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFLknN4q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749CC10E242
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 03:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765337690; x=1796873690;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3VeXv7knjM10nFnb7tyY2L4HZIgIKkPXmK0AAlwQN/k=;
 b=LFLknN4qIJhSrD0Fp6EemEpYhwaC11BycyGkKmb15XcduvuIxPXmhuaO
 0jY5oEuPXpEksFo+hu0VGCcWj84bfRTi4sR+8J7tafpyeXlLs3GXvTSj8
 +lwLIGsQ6UhoXsfeUpkv9pelbAtTD9eTgIidHU5/7Wx6XeVurumQYKVQS
 FZtRQy1bnsjzdTT/SMuxrY7uHVOaSZawNQfMLNdOVwzlDtI/oUfzxMta8
 uXaWstpxhKuQx/coD3ykp+Lxud05phYeDHm32L/0bffARSHDo/Su9IGJg
 RT3AthK9KFWrbJMwKcwTn3/5OFfCuDFyRFvEigExwU3brODC7U7keZpxV A==;
X-CSE-ConnectionGUID: Ji0jM6/GSN6KZSIIW4HM2w==
X-CSE-MsgGUID: OBB82PD+Qg2IHfqOKoy9ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78666001"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="78666001"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:34:50 -0800
X-CSE-ConnectionGUID: dXN0i16lQbKdQjwYScQk3Q==
X-CSE-MsgGUID: 1aZ40N6YQOmq8zs8SvSlhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="197177691"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:34:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 19:34:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 19:34:49 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 19:34:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3BbMedEWnEcPZaIG1mQmUAcSNiB4ZeF5WZGEeBeCGOz/Fo5UfmY/mCPqK1UoUbw+iR03YIjJzVl86/qpaYrrw88z0o7Xp51bdzE7n7M3j+xL8BMAOhd0Zr/hcnKRXrL5JMRiojccfVZ5VMXGUqSdLfydFZ1sqFPVcUHzli6QfWewL959T6MF5Qe1pcIQFBR2duaEH8uEh9fUbh1tREAuhPnwwQNH755upEs2EKXU6EiuvUvFpUUSXqOQz6/gosaXqRnqCKdktme9iacuHOyeXKmhv3bRSoQ+02+wo5Zzcaz/L+uCjf2pV2CIUmpdXwhLXoGlZh7ETcWRduhujooYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKVaoF0lHlzSGrnEUCv+y4dJf1RikmyO3pQqDRgI4tA=;
 b=fptubX7yr/F2A3NRuG4qcgjpJExONUr/gXMKV8W5qr1bWfmV09bKSk7a1OcC1mopCINFN5/SH4f/gMh7BjV/W3udlrkcijfi8OxRqqfiarISTKb7xbY+rbUGrfG+AjHBGASqDJ4J8G5eJS1Eww0aEN59N+VKSTOl1xLD4UpcZd33G1CqTpppUHsow4ZF+mu2N2/i32LrpkYav/11IcOJsaIoiexaSmDVSsKB2ZU7G+PwcdymtmBf0GS6v0QyTpz31xmUb8J+E5gvvoSdgLkUWASvFOhp6M4EnSPdKlqYBJW7w5SLy/rhiIkNRu+TPqOIdgfV2BSVRd0LQ0bbhxQb9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA1PR11MB8426.namprd11.prod.outlook.com (2603:10b6:806:38d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 03:34:44 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 03:34:44 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t 1/4] lib/igt_fb: Add wrappers for painting test
 patterns to framebuffers
Thread-Topic: [PATCH i-g-t 1/4] lib/igt_fb: Add wrappers for painting test
 patterns to framebuffers
Thread-Index: AQHcaYRkBM3oL/3wnEKKtEV2QbP80bUaOHcA
Date: Wed, 10 Dec 2025 03:34:44 +0000
Message-ID: <DM4PR11MB63125FA2DDF7E617D94ED2E490A0A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251210032349.2781106-1-karthik.b.s@intel.com>
 <20251210032349.2781106-2-karthik.b.s@intel.com>
In-Reply-To: <20251210032349.2781106-2-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA1PR11MB8426:EE_
x-ms-office365-filtering-correlation-id: c2adf948-1a5e-4609-6b74-08de379d0fd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?GY5YOYts7LcuoWT7eYzkP1Bm/7vcC8JdaejVpVAiO5/MaVKx0YXwrPUwEbp0?=
 =?us-ascii?Q?Bv/wWDKm+ymo3F1qbJ1O/2cxl4UD1sKyvlYLiXJyQjnafdM+BVBXKByL+fYR?=
 =?us-ascii?Q?dBGJiGtgnGicMq9JJMEKKM5V3z2yrnz/FQq9+N+sDaHP2pIaMyy4Yee0XQQZ?=
 =?us-ascii?Q?6RMeG80/IjcIyl8rcItR7tSO1yQx9OaTvg2BIQM2rMlknnuLHQ+tb57qT9Dz?=
 =?us-ascii?Q?GnV85btX4YYJ+v0Uz+UDY/DOzT1Nc9US7BopqFnYmAuTu9SE8h+GgynqSCOU?=
 =?us-ascii?Q?8zDRd5wChhotl+HzZknYmvCPq8oS2fl7qne/Rr8AoET+LIqXK1AQLRdOj3Hn?=
 =?us-ascii?Q?clt/Y7KIoMQk6dHrMKyl9Sd+bHPqPVfk+/VoIaLzvta7pziKZE41o4Jc8ur0?=
 =?us-ascii?Q?zraFF0/6kDP3xEZZVl7d2E2lZELy6ZIsQtv5juF/XA9LLu91XMWtgAgPqKTk?=
 =?us-ascii?Q?sykmc9HvYsW7GIVsX0frDl1k6WCiGVfVP78qQB4kJYiVEd5k//vE3fwq/L6A?=
 =?us-ascii?Q?GI8UP7w8S9We/xlSDR8/ss/0m6guxen1uo9iyPnxL9867THaNjwuqnw4mmqQ?=
 =?us-ascii?Q?45MHKaCOS7POWV7+TXrb5o+iR5QTxBdztoFGseywrb53QBWXK22N1c7EBEAt?=
 =?us-ascii?Q?eVOr8jIKmBva9YZugtOG0YHSrEEu7WpFvQGL4YRG/jEjlRTPDtadOWW/xLh6?=
 =?us-ascii?Q?XrHeW/D5h+yJ3wrz6pCtYCIAeyq1TphycD9+yRnnsRJuslLTwmh5g+0UP7ok?=
 =?us-ascii?Q?l6l3u9Zcfgm1qzc1Kc/WxgGXyq6GEPE+kv/tgUB6vmyTtLdCTW01muwgH+Gu?=
 =?us-ascii?Q?JT6BZy40Xo1013KZcbMpZr9wP/pM5lsNWtuv0yy162JNy73gNWX0R2RXCQIC?=
 =?us-ascii?Q?AM5UxdvL3omflyblOmaFXOKAdp9iyjueLpi/SGleHpOKv6bhHUXTG3h9xSpc?=
 =?us-ascii?Q?FCp5hIJ7vmfoRzI7j2C8ijpgtCUULvqp2hj2HsyY4iLFf5aj7mGD/BZ+5rTg?=
 =?us-ascii?Q?WT9brMn2hiXyxm1ZJ7B+OsuIrPASEOhmKIr61sIFoZ2uBbuj5cQI41WMrNax?=
 =?us-ascii?Q?NskfCqFyeJ3uhradI4BMujio95wMl6lpVrutNlBsrFzn0zeOxRyW69A/yBJS?=
 =?us-ascii?Q?CelIzVVN/VYAQHdU75IRhDJVrwjXanqbCLexEV6pSNkDyIfooS2AO/37wDZ3?=
 =?us-ascii?Q?CD8UbAbI5Kaw69kgO7DuT7yKg5IJqdgEKCz0tADGEY2dvVLzBbDgi/RTOs5r?=
 =?us-ascii?Q?ViwZ+9u5SgKmkVmPndGS1+sUEBzTQHPtkobdV6yYf6uD9B6wsS1fUhammYiG?=
 =?us-ascii?Q?GpIEnoM0ZPD/cFemYfxT7+vHRlsINsSy3UMwalTebmnVc3kkjA8E9wpd+YY+?=
 =?us-ascii?Q?OKnZOscpdVys5+G5SQWbpGF6fb3V3vl/J8FZeezuz0Gdz5tkLaCY6HJ5zJ/b?=
 =?us-ascii?Q?eqz3iFRLRmz8MGreTKNgzf9pPO2Yi/ljumtKPt3RH9f+HcLD0P+ihIsL9CAv?=
 =?us-ascii?Q?XHiUVM0ZDSODl7FW5NLp66yZ1us1+jq38TML?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CCR6B8bqHRwkwxc7hpUU18Stk4I2zRgpmO2lAv1fmWrXwoN+EI2jcTiJwaeU?=
 =?us-ascii?Q?W8GptmTZfl5asucqMIZqgzNwDtPJ2CYjlHyj2a4LcAyEmVbnp/w5+pPjXUxy?=
 =?us-ascii?Q?jAbTiVqvtE6n2ksORVR9UgkO3nDom15fKmB8KbGY7rqpc8cKHmEbaAscXstS?=
 =?us-ascii?Q?R60E9Q4OQIFVCOr0yPMOwZsebLdYEHqHzptZlSUMciN0LTSGf79ombHdYRnw?=
 =?us-ascii?Q?5D5zicdLO9OEfPpsAs720JQJcTGQExuyoJe7xRPAFLHyDh0lnK1DOJ0xRQH+?=
 =?us-ascii?Q?3X0iBjErW3C8xmHN8y7dzOeX0Q6wvyPGctb2B18fthoi0JGx9BT1+6cR4DFF?=
 =?us-ascii?Q?qq301c8p/lc7KOskTDIqO5QcVFulGTgVSBqiEbIm1XFOt5Hs8iHaIjyzWCdM?=
 =?us-ascii?Q?jE5Tzw8uUWWacnjJBgLuBBws4hZb1cJLpxoNH4oeAJanfMtpuz2Rl0/pXOLp?=
 =?us-ascii?Q?ahae3z3dUczjOMC0ty/CmWV80kVJbybBA3HnOxVIohpp02l9e5UKe0PDadHU?=
 =?us-ascii?Q?M++zexmd0uOb009/CSm+P5b7RYJ892/+Hgy/Ja7RLSZL9s346/ULNix/5Q+t?=
 =?us-ascii?Q?GCQke8eT2bTtUAQgAM9vsu2G6p4CU54+46OcLNwsEey+efeSw5AOqEBXMLPB?=
 =?us-ascii?Q?OKBhWPv2Sd3SEBslFQ6WSIhGDgBAu76Ard+/yI7tovDPLit1e43oY4gZmUzy?=
 =?us-ascii?Q?kRWFUhMaXPCWraALfPW/kRz1gRhrSGrNeQ3F7Qa0c8KIwhrYw8tX80kXKYul?=
 =?us-ascii?Q?zhVg5l2eOkgc9y7GlaXg8n5TMV2LlpyucxMYtfc9IbIsF/cvdowKJL1zaHny?=
 =?us-ascii?Q?Cpu9KGJnfnoso44zcdxNJhpWC77kfk0rJHv5waSUv5h6Mix9D0AQwIdgMB7v?=
 =?us-ascii?Q?UOcP45wk54serenpGX5jG8i4PNWnpFi2Ng/kn0Yu68AHEVsUFKSY/GTYDSbV?=
 =?us-ascii?Q?15imw8feWrzz0kAn1H1W6FNRuLoRnsEi9/oXFOeFqzWNFz0VvYEEAUe+nXyP?=
 =?us-ascii?Q?zU/ahHdm5rkPYAX0odgoAnqdpfSi4VgQz8HrOekswiHUWxBjwYlvDvgirfB9?=
 =?us-ascii?Q?eGFtJHJWjkeoYWfI0RFTQl6qaDg1ppUcQq403OqADsigFshYTG8/zGLyW20M?=
 =?us-ascii?Q?Jqjz13NMjCZnc2SCdJ2jPKe+f5VYvZHfVNzsrvJBRrNYEDX7gJZzrtQEf8gj?=
 =?us-ascii?Q?/nxd78Rc/gmsgVLAoWcT16OIeLHpyRih+W/ifQtKq9JIbTVpbYLU/+xskdKN?=
 =?us-ascii?Q?fyUkqQbSXoBlC5XZzI8TqtSkq8DCrndg4Aboovy+8GqeW1Z8olIqUWHLC6Re?=
 =?us-ascii?Q?JCZaMOXt0iK/T1OCbpyMOnmvNPI1QR8FQvonIDONTftgaVsp4rJLwUbVhxJj?=
 =?us-ascii?Q?7fcdLIbuOoMsOmaYOKkqpwBLyLGyuLwSMoBw/G9tU7GJR7qqTHtHMhJ/eCH/?=
 =?us-ascii?Q?5/XM7ZESXLTca6jkKdsQqXpvFaquW4udSXUaecWOhe4uWE3VD7djYFFnPtP7?=
 =?us-ascii?Q?sKsxFDuA+YQ6dzf1GkkfG5vUM2/l0StZIvMzaStYFdgLqqTPsZQjl+RXz7a0?=
 =?us-ascii?Q?CRZA6x62LDoXUI52sFE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2adf948-1a5e-4609-6b74-08de379d0fd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 03:34:44.6576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b+dkTLes7IaE9VhnlmFOqfS5qVR4EfzmARqKmDqzpb0EBHcFsLJsR1S5l7GM1m3Kvzs6Hdp7/xiSkrHB1OjGlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8426
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: Wednesday, December 10, 2025 8:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>
> Subject: [PATCH i-g-t 1/4] lib/igt_fb: Add wrappers for painting test pat=
terns to
> framebuffers
>=20
> Several tests manually create a cairo context, optionally fill a backgrou=
nd color,
> paint the standard IGT test pattern, and then destroy the context. Add he=
lper
> functions to wrap the igt cairo paint functions which can be used in test
> binaries to avoid code duplication and improve readability.
>=20
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  lib/igt_fb.c | 38 +++++++++++++++++++++++++++++---------
>  lib/igt_fb.h |  3 +++
>  2 files changed, 32 insertions(+), 9 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c index 0a8299d26..ef16fafb9 10064=
4
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2017,6 +2017,33 @@ void igt_paint_test_pattern(cairo_t *cr, int width=
,
> int height)
>  	igt_assert(!cairo_status(cr));
>  }
>
Please add documentation comments for all functions.=20
Apart from that patch looks good to me. =20
> +static void paint_test_pattern_fb_common(int fd, struct igt_fb *fb,
> +					 bool fill_bg,
> +					 double r, double g, double b)
> +{
> +	cairo_t *cr;
> +
> +	cr =3D igt_get_cairo_ctx(fd, fb);
> +
> +	if (fill_bg)
> +		igt_paint_color(cr, 0, 0, fb->width, fb->height, r, g, b);
> +
> +	igt_paint_test_pattern(cr, fb->width, fb->height);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +void igt_paint_test_pattern_fb(int fd, struct igt_fb *fb) {
> +	paint_test_pattern_fb_common(fd, fb, false, 0, 0, 0); }
> +
> +void igt_paint_test_pattern_color_fb(int fd, struct igt_fb *fb,
> +				     double r, double g, double b)
> +{
> +	paint_test_pattern_fb_common(fd, fb, true, r, g, b); }
> +
>  static cairo_status_t
>  stdio_read_func(void *closure, unsigned char* data, unsigned int size)  =
{ @@
> -2277,14 +2304,11 @@ unsigned int igt_create_pattern_fb(int fd, int width=
,
> int height,
>  				   struct igt_fb *fb /* out */)
>  {
>  	unsigned int fb_id;
> -	cairo_t *cr;
>=20
>  	fb_id =3D igt_create_fb(fd, width, height, format, modifier, fb);
>  	igt_assert(fb_id);
>=20
> -	cr =3D igt_get_cairo_ctx(fd, fb);
> -	igt_paint_test_pattern(cr, width, height);
> -	igt_put_cairo_ctx(cr);
> +	igt_paint_test_pattern_fb(fd, fb);
>=20
>  	return fb_id;
>  }
> @@ -2319,15 +2343,11 @@ unsigned int igt_create_color_pattern_fb(int fd,
> int width, int height,
>  					 struct igt_fb *fb /* out */)
>  {
>  	unsigned int fb_id;
> -	cairo_t *cr;
>=20
>  	fb_id =3D igt_create_fb(fd, width, height, format, modifier, fb);
>  	igt_assert(fb_id);
>=20
> -	cr =3D igt_get_cairo_ctx(fd, fb);
> -	igt_paint_color(cr, 0, 0, width, height, r, g, b);
> -	igt_paint_test_pattern(cr, width, height);
> -	igt_put_cairo_ctx(cr);
> +	igt_paint_test_pattern_color_fb(fd, fb, r, g, b);
>=20
>  	return fb_id;
>  }
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h index ac0e0909e..8e5907dab 10064=
4
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -210,6 +210,9 @@ void igt_paint_color_gradient_range(cairo_t *cr, int =
x,
> int y, int w, int h,
>  				    double sr, double sg, double sb,
>  				    double er, double eg, double eb);  void
> igt_paint_test_pattern(cairo_t *cr, int width, int height);
> +void igt_paint_test_pattern_fb(int fd, struct igt_fb *fb); void
> +igt_paint_test_pattern_color_fb(int fd, struct igt_fb *fb,
> +				     double r, double g, double b);
>  void igt_paint_image(cairo_t *cr, const char *filename,
>  			 int dst_x, int dst_y, int dst_width, int dst_height);  int
> igt_cairo_printf_line(cairo_t *cr, enum igt_text_align align,
> --
> 2.43.0

