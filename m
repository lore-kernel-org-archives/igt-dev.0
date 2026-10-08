Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97C6CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 05:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3091B10E739;
	Thu,  8 Oct 2026 05:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfAtLfxm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA65F10E739
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 05:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791436675; x=1822972675;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CCBgsRevrwWYsqAHlvvpCHuM9KIR/d1RSj5Cz7JCCsU=;
 b=NfAtLfxmGcOmp1MLBauGwKFzHgQAziim+eZIAmIf+jNcoo0BbXzcVAzC
 sbp0kcbTS0gMOUiSoDxhsSl3wAVZPJ8uxCaiT5awQkU11UA3apaiQuarQ
 qXfezG+rth83mIcCiZw2Q8Kvs/HOAYZkPY3ZRWT6KlFZwJUmmOtMeaSDt
 zRcxCQGSF4a9qJxa9IS1JmTl2MXZA5Gw+x7huivEsf42l34cYdCva3kuS
 iG+4RucvuyG1CDaV7o75PWY3jMQTv7oK9IIUI0mULCFwq281u55Fb/ntV
 rLTck5QhEPuun78S4hlDcKFXWe4s045uJ9X9qWgphXWYnHR5CST9cqgWw g==;
X-CSE-ConnectionGUID: VYP72fpMTJCe7wu+Ej4nZw==
X-CSE-MsgGUID: R77OLSgJS8C1Lelem54qcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="227766"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="227766"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 22:17:54 -0700
X-CSE-ConnectionGUID: jFEcRYFnRaqvg2sjrTIIMw==
X-CSE-MsgGUID: Fy5VtPGASnyBQfwunS3cGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="20062"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 22:17:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 22:17:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 22:17:52 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 22:17:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXjhiUvXUieHRmmojm+X8N95Oyna+BWrJUCrX+C+ctxRPa1AitPr5/YQJCjKuucS22I4SF2qL59Uh9WSStWvsNAt8bdtc5jxE7uwMbyn03MeeEnRoOS8ATGcq+cFoYEJvNVuavOsJzQ0Pw4J4I52TXtBw28EwVD4HLn6L+HrXbFTlxOCmOJHOVGxwKV9gxhJBpiCHz3+kXloLZ143dyUOESomG8rYgvC2XMWOL6fGGA7YRogiEWyN1Dk2F9aCaG3aT+9opYCar8gobn7t3ktIMq0YZLt9TD0JUUzx0TbhgcIVNvXC7NEbjIT/PnbE9PP9DCqA1gQDBr9fGKA7skZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2CAhTE/GiYlTUx8/UwsWmMlPeGyuMYWgzddFWxZkL8=;
 b=pEg5gVnQ1i60kD9GNx78NZ/pMIApluwmu+L2WPvpQphpFwQf2hTbk6fubgVnUVhDrukcDk3LZG4AJ+jEBMHRZCQVgbAGfEKisL8edr0hZyNqhu76QQ5S5w9kyNQlHZG8fCAme+ychfBy98VvdZv4pJm2mO8JuwMG3l1Y1v3O6sHESLgzE4ruRcYsxW7YjofQI00f6MDdiKx5DPgJlOTWN9KI51lInU6otDD0K4sZS/9i0bP8O0Xb9x37dtadnIaMfEjH2lB8U2DjTwFl+jhMyT8csfiNe/roCx+30dNvDCAQ0hcks8+FkiWqEskn+673fh30INJZK81wFFXocpyCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 05:17:49 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82%5]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 05:17:49 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] Revert "intel-ci: Allow PXP negative testing on CRI"
Thread-Topic: [PATCH i-g-t] Revert "intel-ci: Allow PXP negative testing on
 CRI"
Thread-Index: AQHdVuAFegCSk9MzfkaZZbGj0+1647bzGY4g
Date: Thu, 8 Oct 2026 05:17:49 +0000
Message-ID: <IA3PR11MB90136B01CBDE660ABFAA478385932@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20261008044627.2730162-1-himanshu.girotra@intel.com>
In-Reply-To: <20261008044627.2730162-1-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|SJ2PR11MB8421:EE_
x-ms-office365-filtering-correlation-id: 56357d61-6d8c-407e-17ef-08df24fb7ee0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|38070700021|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: mU+kAiIlLMHwZXT94z854EuAXbAHDhrs2Wj/HOwnnn4M0/L5EPE47/Iz/0w6cKpY4qVzZn6vYPNXzuJtAE1Cj1wa+C7pM1e67N1Oew16HP+9lFzyOK8DMFpAjLdw6kzSMjQLQbebMjRaGZbs0saXzM5tUL1VgDOslvrNbouO0FqrEncYBCkmzB2ZYalZKGMgLsO5NM4JeJyCc9GpOW9UXvLfVPZ/HmDEoU/2lvUoald1diGbsy/jww47+wN6AoL0UhsVkplMUCE1eMIbl5xifFDjzCj7q9Q/BP72motUay0NZHheamUoP0FjSEgsMYMJGPatkX5jhn5j9ZNRZ72e2sqAMw5vJd5GzZnuak3+y3hrcoTqGttO8HLlmYQvtE9tiT4yEMKlEAw8dIQSS9lf/rayF09AF8gDxYObdfs0Q7CD3gvxF5rpu44dZXz03EukjIrD28PYkN3VK56PTpYOkUiQz0dzI/muMgbG5BVP0gpTsElbZ0y7sPkroOr90nHLR4KDeh/1dy7nf8BpuX9Ay25EKoxUY3nhdwH3C7tRrvr2P3ZFfcab9KY0XbamtkzGDCI2ydZRu9RoteJoTugcOTKaabDX4rYxZKUtnqmh8GHR6rUppNksvD/8h8HgukLbekQZJeJVo3AwhRRQ6N4h8AIdWBxVQOdwLljb5jn1GwT/+J8ukNhjL4kQ6ODDDSaGltpDl8hx4RZk2rDGdyvhPb63PTkr0xvCfsLwRuHfxrU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aeZ+OvoQtqkmYCSsOj56X9C1/hlKfVHUeUcAYNThcyfXWOiAIqeLT6lHXSXH?=
 =?us-ascii?Q?7H3oS5QBg3MYcauQsE6ZiMMMb8+ItK662zFrYekNWqKAODr+b/zQEQzwhWO6?=
 =?us-ascii?Q?OSOAlbsQHmEKtBDhiZ5mNGqmEwIuMTotiASM99Kpc/FNibGPoRQKkuIGlEUe?=
 =?us-ascii?Q?4qdxfIUNvyXUiy0W1k1SN7aqHJzuiEZkiJPuIEMh74tX0IX+0PWF1r4a9XfV?=
 =?us-ascii?Q?5jDPne+5Bjl80fGCG8X6UqWmfLBBexxBrpe+iKHZdbbYCHu2cj7jUOvxQIE5?=
 =?us-ascii?Q?92k+hnKf7F9g/jMBZVKt/yUja7WyV0AYZsRawDEK65DBBEqDqJ8qKMBpFBzV?=
 =?us-ascii?Q?UsZCbzbfbv0wmUOyDC0uM9M20UC8SENBAIljeX6LKYksyN32IiM2Ur1VtFQV?=
 =?us-ascii?Q?oKOHY/4YNhUAaF4QL8NHX9H3rQK0zV/g0OX2s8qcYV98q6+iNXcYTH+pUF+h?=
 =?us-ascii?Q?ZZPrKxIRxLe+0BL0wOauB71W4Nw8xO9t0MqzwZM+2iBcgjsojhgNiAC9MHCm?=
 =?us-ascii?Q?mMpNko4PacYNjPpG0tfLBogV31mtrTYEhsdcgt960KGGBa87boMdz+NK6KWO?=
 =?us-ascii?Q?sBsY3uFVcGT1p8io9RUb+B3eqkeYLNj3h9ESKshsDPwtyf4g2EVTWsu3Y2qF?=
 =?us-ascii?Q?jAieecZWad98I3xr0mIKgIQT6v4e+qx81NjyDP2kp9gSHKofrJ3DUQKVMgZL?=
 =?us-ascii?Q?uFvl5R48ku7Jq9PX/yDMesGwBywcWutECCclgiVNkmEq7goHBqIHtsB3JQVl?=
 =?us-ascii?Q?t2s4ZuPjAlXe/nkuTS8E3PzuNzfkEX0klvVVBWRHQqUA0lxlHxPSOlpTJGob?=
 =?us-ascii?Q?byuD3YmFxurISezn0nL91Tpe6lI7/aYBnq9gO5uhMHU98UX85l9tAwD09cff?=
 =?us-ascii?Q?C5/J4QpzD3qLdqz9KPmKJA1oXQ+/GSzBDmE4KBUjCs+nw2pWAoWKbNs+sTMa?=
 =?us-ascii?Q?PuR6gx/axpr40g6F39qLAGuF1aIlUhkncshrNmVp1vtgJk1hm0Ylt+sv9kzW?=
 =?us-ascii?Q?S6ogSuzeVFdObcIQBxqRTQBm/jprCTyOAwJ9mknNXzVcV/od4KDuI2azSViT?=
 =?us-ascii?Q?ZTZltAEXjkfo/fuEtLg+EmPdMluK1VHTPhPnZx4shULEziNOAcmVyNS3nkVe?=
 =?us-ascii?Q?Y3pJWiSuF+o837uWqY8/benCyL3bParTHmfjk0THUG3jMrMVCjROR4vwFsep?=
 =?us-ascii?Q?Lw0sRaeQB+cP5FX/Ldu+WueiNt+lLouM7vX5Fs2mmAVHC+fUambVLF/PNgi7?=
 =?us-ascii?Q?3U8N4HLKEsWCiC5752vFGpfPqn/u2Tn5pduf1UtmnVsYqETxDtomlt3+0cW/?=
 =?us-ascii?Q?vukg+sN30VgcBpVTc0uFI/UiwW59PliSOuadWKYSIOfrojFg1HibWZh8iH3y?=
 =?us-ascii?Q?Spi8a6PMRDe8qTTTDtnf1KeOat5aFjcw1lUsuNp8T1y5gg95tifD7ax85DhV?=
 =?us-ascii?Q?jxLk7JekKSRlaMD8snE8GS1XaG7cXFEQjvR6bxnZd1AU3OIibrlqwMV10wEf?=
 =?us-ascii?Q?gRhELI+5biKOq6KBnirmkdJVpHiD9hXjhzRUc1FffY9mWx2CgN01D6KDii75?=
 =?us-ascii?Q?IdKR3xdN4jaNcxGi/QlLvUyZDHmUgOuCaCGAfYYwAieZ9C1bwRihsvpelMk9?=
 =?us-ascii?Q?OBySwgwwTwHG2HTy4gglhI/QGldpetR+uZQrg75aHZA8qmIG3dP5Z7MRmKGe?=
 =?us-ascii?Q?an83KpZNF/jZMH4t4yYiokSc7rvtPsnz7ZooHoTYUeKFYua7gUPj9UzCCF22?=
 =?us-ascii?Q?SPy3b0f4Nw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q1PaBhP8zXY1TqEwKue49pq4YdJhF33aad+NiL+Qa1JDUnAK5pX4ewALFouaLqx6dvgD2tP8WjFyn/D5rJlYrwvceA4wvUWYWdQ3mJBvtT+RJ6ggdr8NHyDuy7A5DkaJxxu8A8QtQsnYtnfeh7zjz7s5ICPl3aZZGEsCu964BTuP7nqYvNH0RkhpnJ18lkHlN7os1KgudGkd6EReJGaOhhBVAk8kEx810RS7VlgsNYl4mTYyW6QM2IbmRU3mV8EOfNSmEr3Yp8layaumh2uwuH8k15GwTewYgUfgN/huQwBg1WwPEdrTA9BxlrTlesY6gVVe3aQzVEfqgETI2CiWKw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56357d61-6d8c-407e-17ef-08df24fb7ee0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 05:17:49.3427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hjYaM9YGMRJiH6xb12edM2is9Cedif1aLMKvLBlJihRO0gOQWcN/b3S0LR/PiZFxiJaz5UlfS4gI/9thIROwb4oh4cHECmUwtbEVO+GS6YI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8421
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
Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Girotra, Himanshu <himanshu.girotra@intel.com>
> Sent: Thursday, October 8, 2026 10:16 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>
> Subject: [PATCH i-g-t] Revert "intel-ci: Allow PXP negative testing on CR=
I"
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> This reverts commit f38ee7c7b3e3e5377808bfd793b56c536c16fda4.
>=20
> Both pxp-bo-alloc and pxp-queue-alloc require the render engine class to =
run,
> even as negative tests. CRI does not expose a render engine, so unblockin=
g
> them just makes the subtests SKIP on every CRI run instead of being exclu=
ded,
> adding noise and hurting the overall pass rate in CI without providing an=
y
> coverage.
>=20
> Re-block xe_pxp@.* on CRI until the tests are reworked to fall back to a =
non-
> render engine class when render is unavailable, so negative testing can s=
till
> happen on platforms like CRI.
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel-ci/xe.cri.core.blocklist.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-
> ci/xe.cri.core.blocklist.txt
> index 2e7779064..41328186c 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -9,11 +9,11 @@ igt@fbdev@.*
>  # Valid skip: Features / hardware blocks not present on CRI
>  #   - xe_huc_copy@: No HuC support on CRI.
>  #   - xe_oa@oa-tlb-invalidate: valid only for older gen12 platforms.
> -#   - xe_pxp@.*: No PXP on CRI so skip except negative-pxp tests
> +#   - xe_pxp@.*: No PXP (Protected Xe Path) support on CRI.
>  ##################################################################
>  igt@xe_huc_copy@.*
>  igt@xe_oa@oa-tlb-invalidate
> -igt@xe_pxp@(?!pxp-bo-alloc$|pxp-queue-alloc$).*
> +igt@xe_pxp@.*
>  ##################################################################
>  # Valid skip: multigpu runs in separate config
> ##################################################################
> --
> 2.53.0

