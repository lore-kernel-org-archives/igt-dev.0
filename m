Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231DE106F303
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 08:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB32510EA08;
	Thu, 26 Mar 2026 08:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKbbSUYZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D30610EA08
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 08:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774514659; x=1806050659;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Gn7wUNVC30X8thNBUYV4IPKk41iv7HvIFGT/goodvLo=;
 b=IKbbSUYZLzViKe0HqwwHQ2G1BJgJdFS5P0sWWaNMEw22wTm00RxPm8Kw
 cMlmhLzKqTgdrL/EbYhWm52Lgh6gPLxiujTFVGgCPJVFK+tIrGO3ljGfS
 TSEdWc8JTIxUrMJO3Y6euwqqO0is9OVn0j59tDg0SZpOeMfZC49Qxnf7s
 UmUjWUkKY36XUi6+AhViCQZurNBx1DzdXGEHJqHTq4hPUOivbyU248ujq
 m8XxZyCrK+IFHvY0uZlxJ6sShJ28pIrYEG5QsOrQFtsn79ME2U26hXBs9
 J32voZzpfArSNQN+CVD3ibUAVWRAI9FWvEo1tfahA3X0tYwIRzbqShvol g==;
X-CSE-ConnectionGUID: XMJnzaONS3qpcm178lRjEw==
X-CSE-MsgGUID: cDelD0guQHy0oYWlwJeV2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="85872437"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="85872437"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:44:18 -0700
X-CSE-ConnectionGUID: KBea0Q4PSR6/TbkqBBdCnw==
X-CSE-MsgGUID: C83M9wr9ToamAbSVEg+QgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="221634106"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:44:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 01:44:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 01:44:18 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 01:44:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVH1ihBP7sdA66F775n1fQQ3SNedhqbwapyUeAe97MaKY3SnynzktPq9z00zxEDAUBrNoh1wfLIS9EPsbNUltYOiUZFm4tKNiK2Srkn7EYuT4quUVc1ozFqhAZFijdQJA+rmr6mCWIFn7q1Wln8SV/zCFlt58gR4Z0IHikNx8WeBNkGWUcX4lM9MjP1DYnLDERzpxtLMtn6WqfqhcRzKr3eQV4KED51CADMDo+zZr/sWl+yXYZTGy+XbFlWHXanmbL6KC4dGFJ1aRETGuHt+2s8ydhWxz2HTjeG92pxXxyFqOC1GURY6dWjInBBq+GkFWgM+DavWdwYbLarOh+ayyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXWEn+wDAxrApaNR6ya8XotBrgca2yThde7tPPnIExY=;
 b=EmF8aiiDU/qGMp2n2rJMnyHVBI54WTciZmyMg5nIIBWwfdZXkhdY0riciBWVJnpb+vGtZRq7WpEfpqtu4YLTU6O0Sk87JqvPy6KS6ZrFOpPiX63ieMpzs8jcFzt/Hq4qB5NDalHooOKBMt6dKdt4Oa5X/efa8nqxS6EDGdHzDlsdgWTUGcydX2trvc3NMlxzI7XwaSKPbQm7isDoPK69OjpQmeABA7kC1p2ofCCWbr9K9BeosfWJjHQsDGBTwK8gblskxgsDRIZ/81Qma3t9MCjEgxT4XGgNOQFWWihZ7M6Nfc7lD3Ss1DekH52nEFwoinE6JzEVMpmILYCXvak//A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CHXPR11MB9626.namprd11.prod.outlook.com (2603:10b6:610:2fa::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Thu, 26 Mar
 2026 08:44:11 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 08:44:11 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 3/4] tests/intel/kms_psr_stress_test: Select
 PSR-capable output
Thread-Topic: [PATCH i-g-t v2 3/4] tests/intel/kms_psr_stress_test: Select
 PSR-capable output
Thread-Index: AQHcvHfnyZABsWNMJkWzMv+sKvFhnLXAgEnQ
Date: Thu, 26 Mar 2026 08:44:11 +0000
Message-ID: <PH7PR11MB60539C4E940D030BB1C76003E756A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260325165140.115520-1-jeevan.b@intel.com>
 <20260325165140.115520-4-jeevan.b@intel.com>
In-Reply-To: <20260325165140.115520-4-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CHXPR11MB9626:EE_
x-ms-office365-filtering-correlation-id: 43ed6ee6-dffb-43d4-598f-08de8b13da11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: nfaSipTnc1YeIYFq+QnqJboACpqyq2BM3NnlNVvSkJQ8YA2SHeif+PY2MaCUrjuI9qaStgtQ8gQnS1QM0PhRww8heZjpHeh2cPnIey9gq1dE7J2R8BGqAXh5VQueXOUoJIE8OtuuE5GPe2cA1GYbIFTl/2QY8WW9Z4Uxmi65hcAk9zyI0jUluCTSn2BAC8tlM6f0xNF4neyzp5P4BHzcYhrTgg6NoeRMWEnGL+tMzW3tEh1v9C6UGCofEAnQfg0zB5SY1HW8yXAMCIf7kPH1GHru78VbzwTaQH9IKnVvrqWAq19Skwtt5FRbdvNbLf2HjYhbaelvWl22JQ4Wg2KeCMCWdJ3rk1h/PXYgq6d+bXEo3Y18IZiP5WmNglHopOuGKlp50EFpUcyQq/I7phbJGxXtcma0+saJQsq0N5wUf8GDg8VsouPSTJEzQKvBquy79CYkyHZovW/wWhRIHsPZ1KBvo1x+ZsPOtAYvGecibqmYuYWpq0jIe5QvjJORrBvKyXYUrEekx6WNBA7fUaevBPNxzFXeByOAbGQk5PoLgGIaWNJPohpoNPmScPO6BsCkFWTMGU9c1vFSgYY9cnk5DjiZlieZR8A4UbqBc1qV0tRd06DMdOzdthADIhX0OHxCpUWUW7VwPKuVCZPLwE2+b3pI3Z9edzIC52vg5fqCUTKHzKnKO1u3zIvvYjgGgMgvFukA4WvJyd0TnTGIqZGeD96I5BoVd3vKo0onkHbaDETJdDo+tB2j1BlHhL+X1TUMM/LTVdFu0FezpeMmBaijvQmd0jhlHGvy6nqpJ4w7U40=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2p64zK4VAHPv8z9holXj/Nc+bKGuc+vXKZf8xDqCcHlla456+gceIR+5e/06?=
 =?us-ascii?Q?KjnTrWJ+ZopeAN5f8fxpj3fiRfpkQsA6Xgagro+M/fQ1KsrmIN6kUYxDlnT2?=
 =?us-ascii?Q?yu/pfmo4IhqJvWhzZHtDX5g33B8vn8lI8ooG526OH9LsyxPOg/xyow/Aj4P2?=
 =?us-ascii?Q?hkBdCfYWLuk4OsbcwaX126QP9UewgpGfbMXvOC/I2EIgaq5SxRCSvzXd6fnS?=
 =?us-ascii?Q?5TWlTKsoJvOFVvpDLJ9le9rnHzQj6RjZumWY+77puEoTyTu0Y5wj+NmJp1Rp?=
 =?us-ascii?Q?CG4tTdq5FOjKMzCnx0zThzeXusYyQMK5UnWUpTm0y3kLl546i78R4k1D3vuu?=
 =?us-ascii?Q?fJUtaiZcl8jV4V78NvW4mjsAoeMVlfiXsksXzfTkLhpJiKTpCNlk4rSv8ur0?=
 =?us-ascii?Q?s2Y3IXDsKVX5A6YBPiv1EYXmdeLLPOOiTPM3YragB+PROKX9bvN1H/cUGWK+?=
 =?us-ascii?Q?2wIbrpRdf/iGHIJe1tK2t1n2PcglsPBhGdDrwNDx6CYnJqLBxCC7bA9bWpdx?=
 =?us-ascii?Q?v7BCNTSyfiDgljYCT/Ws/Gp4cUw0HvHJ4soHu9rV/f//hShJCLINKsgmyewz?=
 =?us-ascii?Q?bRAwNgrB/zdZQ8VZiPCROc97oBBxUA/xhNUHSlwSaL3yK7/FY82Fh2k0XYWS?=
 =?us-ascii?Q?h8AXwkZaaEHPk/2gSdJtOKKRQQhnX2hCfE6MgKP/UG+q3Q/4+Lrf9DpqYfAy?=
 =?us-ascii?Q?7+vOZZONRcxr2c5hSFQfBaomRg962fOdCIlkarUFeqIZLADaj5buOCo1aZeB?=
 =?us-ascii?Q?N0/dxwbrBuH6jV9GHDSP8+D4YtXpTO6r5GfKEz4/O+Tfp3QttAM5MdN6ur5r?=
 =?us-ascii?Q?yvbMuEelvX4T8LPs8oHN14o957Ds39kZ+v+UM6imKQSZTTuPzWoHEeBsPKQ5?=
 =?us-ascii?Q?cAJkz3MFPsbOwX6oiX44p6zwGBSIUIJFOuR/ohl6YYH2xUnEVlwMCV9sC4dU?=
 =?us-ascii?Q?u91vc9mInh50cwDOt2BnRAuvF6JqarRIq6ERe6N8Zm/Gcsi6pvwrAtEztKBv?=
 =?us-ascii?Q?fZZsMiHVM3oMAWWt7Fsh5sOufbbJWtSQIkE93ciRbu+F6xSb0HsOkFuaTX3z?=
 =?us-ascii?Q?ej44/JojPHTWdyraBajOj1JgLahocHTip/9h696Ck5Gg4gJNDN8pPJcC9DBJ?=
 =?us-ascii?Q?PdtxhYZ8Bll/lgQRBPzlCbtlshClrU1IcpV/0HPwbmCuQ8Q4dJthyVaMeSuv?=
 =?us-ascii?Q?2LufPWBGfsU2zQpxXaZXviWR+ZK2G6tYCjh/GmcrWdDnUBqSVzDWpB/D1T9U?=
 =?us-ascii?Q?1rBTdtjHh736L2NJwqmxcvauMZ26lt1wTJcZvA3aUkgJMkaa2JS+Yfxs5wm8?=
 =?us-ascii?Q?pNMusIieXZrP9SUVicd1s9qbpeCsXdVbRIsynpuk8eVmBaUmUYmD1uNTdPrO?=
 =?us-ascii?Q?mr6lxf606Px89Z4Lx/JQC6i+AfgmBNSjFW+IqzOGgBeD7g/UFDWemC2SgxP6?=
 =?us-ascii?Q?p41RVsshmXUETSmpp3GfukUG8rpK7TmjSZ9gZmqTcsw5KTQj2OYy5VacvrZl?=
 =?us-ascii?Q?Zok23HvWCC6/wSH+vsMRYHgWu96fUrpoYpTOiBhCudR3lOowYgHlQE+KVm29?=
 =?us-ascii?Q?n59Eh1ioGKX7fV4uc9H+y/eysjTOtcpdfDc+GbfOzGI7ZfSuxEmC1jaYWnr8?=
 =?us-ascii?Q?KzIC1/8a80WcQjVmWolScdyT9xXoUCXXvwiv/eN1sgiXDuG5O/JgTCmtc5i2?=
 =?us-ascii?Q?+rEj9GAvmo/FjeZMwQ434EQgDrVc9J2hZUJ1NFGU1vHnXk4x/OliIig1vvCo?=
 =?us-ascii?Q?TWvA5wNeBA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AKHkPbDtfXQvrwCcO2W5y5Tnax38umxxLDcSe/M4FO9SgMZk2yCsSWI/Ld8HjvbjPxjZO6+c281mFaIgbGmznIpmVeCm1IsjlC9MWb7cUEpWX3fLemhYX/jZRhrFFuFKZdUsnUL8mOa6RnuGFM15mMGDvhqCHyCtwMm9IK6gGroKRDxr6wVUhoz/B/r3SzTUds20F072f8nR4MuPshIKLN/onT2x+RvacFI8Q6e02qKgFpUPthXitM7gmPeBEBIgT+mm5skhWvh6q8wTC6C182+5S5R5BoHDnWi1WrMaOmhMbkJbDatw1hyOUdrMqRoMHzu4JxK1/Vr7nfsWZsE8RQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ed6ee6-dffb-43d4-598f-08de8b13da11
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 08:44:11.1779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYzElsi3d64jz4Oj3m+/EzyziyynEQ2Od0GwulfswAZKSv/vFWZ1psFu+52NcuqDpTZroHj/nWpKXBLT02hpVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9626
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

Hi Jeevan,

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Wednesday, March 25, 2026 10:22 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH i-g-t v2 3/4] tests/intel/kms_psr_stress_test: Select PSR=
-
> capable output
>=20
> Iterate over all eDP outputs and select one that supports PSR instead of
> picking the first available eDP. Skip the test only if no PSR-capable out=
put is
> found.
>=20
> Previously, the test relied on a global PSR capability check and could se=
lect an
> eDP panel without PSR support on systems with multiple eDPs. This could
> lead to incorrect behavior. this ensures the test runs only on a valid PS=
R sink
> and avoids unnecessary failures on multi-eDP systems.
>=20
> v2: Drop redundant 'found' variable.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

Changes LGTM,
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

> ---
>  tests/intel/kms_psr_stress_test.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/intel/kms_psr_stress_test.c
> b/tests/intel/kms_psr_stress_test.c
> index 09e73bd49..0c9f0a0ef 100644
> --- a/tests/intel/kms_psr_stress_test.c
> +++ b/tests/intel/kms_psr_stress_test.c
> @@ -93,6 +93,10 @@ static void setup_output(data_t *data)
>  		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
>  			continue;
>=20
> +		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
> +				      PSR_MODE_1, output))
> +			continue;
> +
>  		igt_display_reset(display);
>  		igt_output_set_crtc(output,
>  				    crtc);
> @@ -107,7 +111,7 @@ static void setup_output(data_t *data)
>  		return;
>  	}
>=20
> -	igt_require(data->output);
> +	igt_require_f(data->output, "No eDP output with PSR support
> found\n");
>  }
>=20
>  static void primary_draw(data_t *data, struct igt_fb *fb, uint8_t i) @@ =
-
> 232,7 +236,7 @@ static void prepare(data_t *data)
>  	r =3D timerfd_settime(data->completed_timerfd, 0, &interval, NULL);
>  	igt_require_f(r !=3D -1, "Error setting completed_timerfd\n");
>=20
> -	data->initial_state =3D psr_get_mode(data->debugfs_fd, NULL);
> +	data->initial_state =3D psr_get_mode(data->debugfs_fd, data->output);
>  	igt_require(data->initial_state !=3D PSR_DISABLED);
>  	igt_require(psr_wait_entry(data->debugfs_fd, data->initial_state,
> data->output));  } @@ -345,7 +349,7 @@ static void run(data_t *data)
>  	}
>=20
>  	/* Check if after all this stress the PSR is still in the same state */
> -	igt_assert(psr_get_mode(data->debugfs_fd, NULL) =3D=3D data-
> >initial_state);
> +	igt_assert(psr_get_mode(data->debugfs_fd, data->output) =3D=3D
> +data->initial_state);
>  	psr_sink_error_check(data->debugfs_fd, data->initial_state, data-
> >output);  }
>=20
> @@ -359,10 +363,6 @@ int igt_main()
>  		data.bops =3D buf_ops_create(data.drm_fd);
>  		kmstest_set_vt_graphics_mode();
>=20
> -		igt_require_f(psr_sink_support(data.drm_fd,
> data.debugfs_fd,
> -					       PSR_MODE_1, NULL),
> -			      "Sink does not support PSR\n");
> -
>  		setup_output(&data);
>=20
>  		data.invalidate_timerfd =3D
> timerfd_create(CLOCK_MONOTONIC, 0);
> --
> 2.43.0

