Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61CCC5DF67
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 06:13:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDC910E4E3;
	Tue, 18 Aug 2026 06:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAZDM6Eu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCC610E4E3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 06:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787033552; x=1818569552;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UTVAAht+K3EXDy5+FDSMGFekSAY2znAqRsLeBKIApuY=;
 b=GAZDM6EuWt+TV1FpbTxxCerhGyYhvBIygPXXIGt0pWIYCjPLzRU21V7s
 QFjGLmqJV8BXz4zbUW7s0TNUPrP/uav0TPGonayvROKI3u/eVt2pDewm3
 ickk7zoaXkFboc+AZRPr6QVP3n5MTbKdwxvWmIDGnMWPAg/wbiIHm8IIw
 Pp8gFHUGkZ7FTaxIQLPMvwB2EemD6+qB1XfU8hw9tOs/fWxp6g3iTlxOw
 ewldEnMf2RO+WE9e9UriyCq7a9UqtcYq/qlRNt7sdCE/X+/dDVfES7ayX
 U98G6kFkc2wmGscDS5ZUIPWXPxZJGhG/JJacJ1m/vMleihFaYYAOpEXKm w==;
X-CSE-ConnectionGUID: Ml/jWPb/TbSG6vu4IsaEJA==
X-CSE-MsgGUID: sngQFAWCS2Sqy1mYycMpVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87278011"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87278011"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 23:12:31 -0700
X-CSE-ConnectionGUID: Y883jXgvT3aAnJ2vfUVBpA==
X-CSE-MsgGUID: 4ODnOgMsTtG7EAHMwNo69A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="261381573"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 23:12:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 23:12:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 23:12:30 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 23:12:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfYkaYuFrxh/V4mojrk/M7ojGJ5iDV41eGJOj8p9JRQvfeq2lDP/cW3MjSq9Okf4Kar5+Sb+rtUkIDw+s9LM/emc2mh8R07sSPQehEVOXfqY6vY9J2aBnq3GkpzWsL4GIPnsAU5Z/GlqGTDWvjmLuOovoXE5l693pgXRcmEUtyF6lRLADSwVS0Z8DKUT2+h+n5E6r/UkZzSfM3PbJgY4LIBGZhTgsalHydOjlyL1NzUPZTo9wQUe7YDdC1FZvtDpO+ZIhnZ7VRXLoTgaT4/P/4930Ol0FwodBxPWgdauYbeHVgGb7jtWhg3Ap10HOVVRiLASHh/q42wrA8bai0XKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pRzIRWF8Ei30TmhrQbxiW67C/TMsCsUvyFGOC7vILQ=;
 b=xMJflIxYOUz7TusEzv3qjeNDXJg1CRLlmsDyxTYxGtOPkdrYXZ56mfkjQPw5cFtEcV4AD8c1JP9UOtTfZdYH1XLHvXTChwFA9ykYiqlQ3rl1xUtcJEcS7o+eBt3sHBPXbuqhkvWpaEC/hTYYEbwLDYAgB/K0AHRAIx9WYx/Hm3+pAwgL4ZxVn6PQqjk2XZLskUJrHGQf4JsxldAqjRwLuyKvlKep3VwjrnN+hW4eQHotYSwqbpyZrzHcBWZyGUjkMVe1AdjSzhpxvnmMjFsvlfNwarAwjy2HiUxCi0TiMFaXZ8k+Gw4y+KaLrO4c1sZ4YreeOg6Xs9mm/UH4qWClPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 06:12:23 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 06:12:23 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe_prefetch_fault: add L2 prefetch
 fault subtests
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_prefetch_fault: add L2 prefetch
 fault subtests
Thread-Index: AQHdLtJLLzdtROwKUkm5WMkr13Yd9bajU1Pw
Date: Tue, 18 Aug 2026 06:12:23 +0000
Message-ID: <CH3PR11MB843426D711FD8545D49ED8078DA62@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260818052716.156973-1-varun.gupta@intel.com>
 <20260818052716.156973-3-varun.gupta@intel.com>
In-Reply-To: <20260818052716.156973-3-varun.gupta@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MN2PR11MB4758:EE_
x-ms-office365-filtering-correlation-id: 966d31da-034b-4c48-451e-08defcefab84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|23010399003|376014|6133799003|22082099003|18002099003|38070700021|5023799004|11063799006|4143699003|3023799007|56012099006|10067099003;
x-microsoft-antispam-message-info: g92JekttL5Fu8a/m+6q69H2x6EcBga1yhzWLpKe4cF4LrDltHkf3cryxxskpYB85pkZFCiDSJEp7608iVVs21O7sioCNsZhPE+Bd2Urlz8sRGWSLIeEOdADiawpr88iovnodLceMxlSpDn8yyEvIafyFzsmAplPjxuFUxXeJNy5EEi5Xqph4dg/3rcwSqE53Zwzsjn+1bF1VsBMEnP38ySK6+btMFhBjAxscbVB78lsQuvZJzHX+SLISbsaFeHupVGxgqorH93r+e8OfAKVsW3PhRCOvnMXXwKEzCVHeBtJakDXdar+MoxAfnbWcQ7GiHrRiS0U441Q0Iy+Cxo6WbN7YZvB82RvRNCtdfZ/eC3+ivbOfqiuP1IBTIev53MV5VyxGhxG4KijM2raP+jO0GLFVfmEsfiKXevM4xfxxj3JvlpU6BbNf3ghxlhXba+2OYV4xS0T9tb/97uFlvse3Ee2XsRSvNixaHjZqoCK+8NyKufrUPHPUMCSaTP77xi3lAozcLV6JRmFgoikIBLqK0AMD21Z70R2elQJpiB8F/5C1+ddazYsyYf8t2cJkNLhQb47HK1lG7t/72X2qKrhdiMyCBQ3Pguzy3lkPNlJv3ZSld+w9bfnqN+q/dsx7QEPiGVgI2CteTkOXJ4dXIiDQIlat8nNdVxd4xx38Gkr1W3WqtajP9vwySxgNuOmtbWHdw25QIWn32WSi4cdwUWusq4c1sXKxrYfhmTBpQmVAH6A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(23010399003)(376014)(6133799003)(22082099003)(18002099003)(38070700021)(5023799004)(11063799006)(4143699003)(3023799007)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PimRbA0iZF+os6gpjpwOTY4xyI3LdsEIpt92k+F9CpSHdQP2Dbyxr4U9ZrHI?=
 =?us-ascii?Q?podiQFDaAc9KJCsASrKgAO6tlnZe51SDahKyrDBdtq0f89AnROxBJ21x5doy?=
 =?us-ascii?Q?j68CtzEu2fF7nc8S+Qmz5vZQTfrSet+wF4QOBQSkGrO82qaTnG9TNaEzWga+?=
 =?us-ascii?Q?/xFvSidBZv2leGI2d0I6HAVX+TX7qcO6LJ3PljrRbqsRsETi5Sh7n9lLQbgG?=
 =?us-ascii?Q?Xuw+zsL9/DWgjkIs6JXQeLxLzGJ86+A8Alo8xcQlCg/3UgKbKSr0fP8F3m27?=
 =?us-ascii?Q?A725Chwpmm3hINd307qcqCkftKTLhHGJt8y7SuKX2o4sLa52fhoti7fV5m8C?=
 =?us-ascii?Q?eoYW7HMbY3f9d5xTykySYZ3/fDGYGr9fo4fDhXGpikq9an1uOEsjUntTvIEk?=
 =?us-ascii?Q?qtcYJ3yFQ5chsj2coNWNG4OQgFHmmB2dkiXrS/qfwLihMtxmEj3BGXffZ7+Z?=
 =?us-ascii?Q?ooAEmupN1LZOWC2z2GvwGdVqOb3Zar4DtJlCY2R3QYBZPWrSMn629Qumr8fz?=
 =?us-ascii?Q?zgDwujcxF/yIBkzfcZVAHOu9A5mqs4HUSC1ALbVtgnTeeoTzqei4xKr8KJQe?=
 =?us-ascii?Q?eBeLC6emSHP+lltroEgxHXYZmv1j2CfftvhFZge1aqB4vm1dRsYtikpYyDxZ?=
 =?us-ascii?Q?i3E+XXUnedV1oqR8CPDFZ1NYAuN2h44SzobXu0cwWODApvkZ3fNCNYeE0L8D?=
 =?us-ascii?Q?EjEAO9V//mIUMXTWG2Q3WUU8PJuQ7Trog97tlCsUngtGDkATs0my2f5HGBmJ?=
 =?us-ascii?Q?gOx0Xm/LVlUu0pqvo4PjG/dOWRSD4gRLRmKwQneD9STkSbO+IpmnOnSJ7UBT?=
 =?us-ascii?Q?HOVBjJnDK2rYuIj0eXyjqpvva/38rlr3J2DzIC76jR4Lq9jiVFcRU1tVZuxT?=
 =?us-ascii?Q?P1Qik1J+gVCkjJeoPPUe9iuvi2C1lexSFAtsVAH4JXnjfIwyrbvsmqS2vDha?=
 =?us-ascii?Q?VoOZqM+IUJR8HjQr1TiHxacPH+wXno8LzGSS8eyR+aX9qfd+IvQAsAcS7FG0?=
 =?us-ascii?Q?RReDvS2KKPvp/AuyRdNOX/YAeCV8ybmXm61EAlyZTpr/we0u+vSB40vs5jnv?=
 =?us-ascii?Q?6aEiisEZv+oI+91FyX3+0u0k0aKeX6847T+Ng637VC3kZpXMVngjuP9YKsJ2?=
 =?us-ascii?Q?h9Sf4Fc6pw5s9Recu3r2ABHI7zdrDK0W5DDznJmr14nCE7O1E4KeIudyyU6p?=
 =?us-ascii?Q?9yuwlZRW81/273Dj0pMfJ3UC0yAy8YpXoVDotY1Lukbo5SSUbT0RaUNK6PA9?=
 =?us-ascii?Q?n51FXvw4zASuZULD5DrnbA4Uopu8SWrLElqdVPazGz1jHcW9hTFOwwAMYWcp?=
 =?us-ascii?Q?MDC5ph2rfZnPPI5TuAxKeNQxccaEhBtZlFxve0rolfUzVUE2CWZ9oH6Pj1UQ?=
 =?us-ascii?Q?s9vJ3YBXUBHZctd8Zx62SsuOuIXHKOlGv0Nz7kTAeUJJmtEEGrIBSuNRnv6E?=
 =?us-ascii?Q?gisKRZsrqYXK78BGDbGdNgtMQ+wzcsNiHYAxUs2hv6n/zXhww2PyA8dCtgSO?=
 =?us-ascii?Q?OGR0R0t0UCbfwiDDHBoE5wiwA67Fd0kCOPlpsAcn6TtfLZ1FjpCfRmabGz+m?=
 =?us-ascii?Q?lnNbW8qmaAx/jVvnoEXdAG4IUDeIcOswcIJVu0mQqQ0yAZIu4FTs4rDFp77d?=
 =?us-ascii?Q?kvSSrhXOA1MzfEZmv+6BLXOvZTUBQDMRygAeNqu8NqAzdPaZD9NttN2MmeDl?=
 =?us-ascii?Q?dKYr0Y9+GjyQJZXnHBOnaf68HiVuxKENIYXjHV+GuiW/MBI89zmwS720xGCM?=
 =?us-ascii?Q?9Iho7xvQSqJ53+rR+9glDSn2ENgxMCPCt3KiAOhtNRKK0u0AZcIwODKKBZoc?=
x-ms-exchange-antispam-messagedata-1: lwDpXnVY5AHoXg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lwVFN1/64oc+kbMQaRxb8yFLKBpmB4MEwr5Vm4nnCDsiZqtiDQkdAwdO+mhrqPBk2oVwY64FidwYDpEyLiw44B6RZoVrGVy1lFalPeKV1hpvNJGBgaglsaIvre4USDwmy1py42e1AenTcfQe7u5q4ymcB/oslBRt73i9rNPfc7vepAtB+aogVOVIe5XBLdzw2Cm/c5H2LZDYl4sQbvk3AGSIP8O34wbUxkLqeV1QkHgMsE71IaNIpp3AE63uRmPO3+2TjJTl2EdSNpCGKKWbTwHZGi2k+lu0D+r2CD/TS2tXFe54P6uzITLxwf5Nc7SARUSEMQnVP8SWUsV+OZsqPw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 966d31da-034b-4c48-451e-08defcefab84
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 06:12:23.7719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H0LALFxHio8BqmX5J60PvIIO5rjo7erThMIIShkKM+jRDlJfUE8VAj+IJwT7d/9qrtprRDsf79UczFvpxMUZzhNEH2tzhbijZb4y/qP2CRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
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
> From: Gupta, Varun <varun.gupta@intel.com>
> Sent: 18 August 2026 10:57 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/xe_prefetch_fault: add L2 prefetch=
 fault
> subtests
>=20
> Add L2 prefetch fault testing. When L1 cache policy is set to uncached (U=
C),
> the prefetch bypasses LSC and is sourced from L2 instead.
>=20
> Add a new shader gpgpu_shader__l2_prefetch_fault() that uses message
> descriptor 0x49C00 (L1UC_L2C_L3UC, cache control value 4) instead of the
> existing 0x99C00 (L1C_L2C_L3C, cache control value 9). Only bits [19:16] =
of
> the descriptor differ.
>=20
> Add two new subtests:
>   - l2-prefetch-fault: validates L2 prefetch fault with unmapped address
>     followed by hit-under-miss with mapped page
>   - l2-prefetch-fault-svm: same as above but in SVM mode with HMM-backed
>     CPU page table resolution
>=20
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  tests/intel/xe_prefetch_fault.c | 97 +++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>=20
> diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fa=
ult.c
> index e86cd68d9..4843f56fd 100644
> --- a/tests/intel/xe_prefetch_fault.c
> +++ b/tests/intel/xe_prefetch_fault.c
> @@ -81,6 +81,56 @@ L0:
>  	)", lower_32_bits(addr), upper_32_bits(addr));  }
>=20
> +/**
> + * gpgpu_shader__l2_prefetch_fault:
> + * @shdr: shader to be modified
> + * @addr: ppgtt virtual address to raise L2 prefetch fault
> + *
> + * This shader can only be used when in efficient 64bit mode.
> + * For a given arbitrary ppgtt virtual address, it raises an L2
> +prefetch fault
> + * using load instruction with L1 uncached + L2 cached cache policy.
> + * With L1 uncached, the prefetch bypasses LSC and is sourced from L2.
> + */
> +static void gpgpu_shader__l2_prefetch_fault(struct gpgpu_shader *shdr,
> +					    uint64_t addr)
> +{
> +	igt_assert_f((addr & 0x7) =3D=3D 0, "address must be aligned to
> +QWord!\n");
> +
> +	emit_iga64_code(shdr, xe_l2_prefetch_fault_prefetch, R"( #define
> +IGA64_FLAGS ""
> +#if GFX_VER >=3D 4000
> +#elif GFX_VER >=3D 3500
> +L0:
> +// Set base address with scalar register
> +(W)	mov (1)		s0.0<1>:ud		ARG(0):ud
> +(W)	mov (1)		s0.1<1>:ud		ARG(1):ud
> +
> +// A64 offset
> +(W)	mov (8)		r30.0<1>:uq		0x0:uq
> +
> +// efficient 64bit Read with uncached L1, cached L2 and uncached L3 //
> +sendg ugm load - L2 prefetch (L1 bypass) // Message Descriptor
> +//      DP_LOAD_STORE_STATELESS_DESC (HAS:2209865465)
> +//      DP_CACHE_LOAD (HAS:2209865465) value 4 =3D L1UC_L2C_L3UC
> +//      0x49C00 =3D>
> +//      [45:44] Offset Scaling: 0 (disable)
> +//      [43:22] Global Offset: 0
> +//      [21] Overfetch: 0 (disable)
> +//      [19:16] Cache: 4 (L1 uncached, L2 cached and L3 uncached)
> +//      [15:14] Address Type and Size: 2 (Flat A64 Base, A64 Index)
> +//      [13:11] Data Size: 3 (D64)
> +//      [10:10] Transpose : 1 (enable)
> +//      [9:7] Vector Size: 0 (Vector length 1)
> +//      [5:0] Opcode: 0 (Load)
> +// Prefetch operations are implemented using a NULL destination register=
.
> +// L1 uncached forces the prefetch to bypass LSC, making L2 the fault so=
urce.
> +(W)	sendg.ugm (1|M0)	null	r30:1	null:0	s0.0	0x49C00
> 	{A@1,$5}
> +
> +#endif
> +	)", lower_32_bits(addr), upper_32_bits(addr)); }
> +
>  static struct intel_buf *
>  create_buf(int fd, int width, int height, uint32_t color)  { @@ -130,6 +=
180,17
> @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
>  	return shader;
>  }
>=20
> +static struct gpgpu_shader *get_l2_prefetch_shader(int fd) {
> +	struct gpgpu_shader *shader;
> +
> +	shader =3D gpgpu_shader_create(fd);
> +	gpgpu_shader__l2_prefetch_fault(shader, xe_canonical_va(fd,
> PREFETCH_ADDR));
> +	gpgpu_shader__eot(shader);
> +
> +	return shader;
> +}
> +
>  /**
>   * SUBTEST: prefetch-fault
>   * Description: Validate L1 prefetch fault and hit-under-miss behavior w=
ith
> @@ -140,6 +201,16 @@ static struct gpgpu_shader *get_prefetch_shader(int
> fd)
>   * Description: Validate L1 prefetch fault and hit-under-miss behavior i=
n SVM
>   *		mode with L1 cached, L2 cached cache policy (fault source:
> LSC)
>   * Run type: FULL
> + *
> + * SUBTEST: l2-prefetch-fault
> + * Description: Validate L2 prefetch fault and hit-under-miss behavior w=
ith
> + *		L1 uncached, L2 cached cache policy (fault source: L2)
> + * Run type: FULL
> + *
> + * SUBTEST: l2-prefetch-fault-svm
> + * Description: Validate L2 prefetch fault and hit-under-miss behavior i=
n SVM
> + *		mode with L1 uncached, L2 cached cache policy (fault source:
> L2)
> + * Run type: FULL
>   */
>  static void test_prefetch_fault(int fd, struct drm_xe_engine_class_insta=
nce
> *hwe,
>  				bool svm, get_shader_fn get_shader) @@ -
> 296,6 +367,32 @@ int igt_main()
>  		}
>  	}
>=20
> +	igt_subtest_with_dynamic("l2-prefetch-fault") {
> +		xe_for_each_engine(fd, hwe) {
> +			if (hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_RENDER ||
> +			    hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_COMPUTE) {
> +				igt_dynamic_f("%s%d",
> xe_engine_class_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_prefetch_fault(fd, hwe, false,
> +
> get_l2_prefetch_shader);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("l2-prefetch-fault-svm") {
> +		if (!svm_supported)
> +			igt_skip("SVM not supported on this device,
> skipping.\n");
> +		xe_for_each_engine(fd, hwe) {
> +			if (hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_RENDER ||
> +			    hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_COMPUTE) {
> +				igt_dynamic_f("%s%d",
> xe_engine_class_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_prefetch_fault(fd, hwe, true,
> +
> get_l2_prefetch_shader);
> +			}
> +		}
> +	}
> +
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  	igt_fixture() {
>  		drm_close_driver(fd);
>  	}
> --
> 2.43.0

