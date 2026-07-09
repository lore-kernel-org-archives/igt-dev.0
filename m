Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A7DC43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 03:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE5010E69E;
	Thu,  9 Jul 2026 03:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEqJ4Kfx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEEF10E677
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 03:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783567637; x=1815103637;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Od2SODFfaK5ZcnSuJpoeEkepczt1fZxLDUpdQOr3j4Y=;
 b=gEqJ4Kfx3wPheQyktcNv6zzmNBLz9Y1I9ER8MwM/COGfd1O7HIfFpe06
 pUuRdrrfOeFyss+s4HJDRRiGm4KAKsCuOco1jfFDjCxEjXb3OQLj2X0te
 j35QgXLbhDM4EoBnNfqpe+T7cqThC4biZUxmPw30ZkiQ2KwH/gEyTUVjE
 m+Zv5BKi4zyRqD/Zw3TtUuQa/nABYlmFu5389sABce1nZpqhmYT3gB505
 op6CQf+sIqBqvj0aLpfWbcIQbUz0FYpuzGCioPEvnHeadfRTGZYFL7MKE
 Y7/xrbz5tQF5815S1SctbwwpbXTMFUAvfTBM4S1ECqW+HWQmFhi49had9 w==;
X-CSE-ConnectionGUID: ACzdcl3LTkGRHIJ1kzrGFw==
X-CSE-MsgGUID: gZKyYxTFSYGyVMrslMqXHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109788182"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="109788182"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 20:27:17 -0700
X-CSE-ConnectionGUID: qKapKp3gQIq0vqnXbK2dpQ==
X-CSE-MsgGUID: P5up5OXpTGOiBv/QL8dE2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259361838"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 20:27:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 20:27:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 20:27:16 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 20:27:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnA7V6aeKxHgCXA97IxLTRRuBmL84bb5rdOrDsGYNvwUppgJmnBKUr0hwFohBNyIpM4Ac41LvtBb9V3u8eTmW8c+7lczQfVj9Uut40KY/pqLBaNbpayPr7JKqVKfpfRwuGbAq6uR99imDd8DFhM91Acef72szRITNZBxV/+bMD8Y6D91iu1hHdhY1oRsIpL93ZtC6AxL5Tg/4j6fkCwTcdCq/pe+lMP86L+VJM1FBa7Pp3Gtq69014DYZAkaXeF14PBHPzjRvyZkakK7t0ZF2qkp9oHa8aZgGbJyXEtdsfZTVpMPY8x/1xyt+SKhC1gxvM0ebdDxGRFRHUl2nKyPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaEpW6rRukHN7kudTaJIacKoQiOq3QQu+la27OJbLMw=;
 b=c/WD1Iw1Tagp3puIB+DIGa5va3z8WvTK4b3Q+2R5+l4WStpNoqK+kPOBvscJVS+fBtnyIM8iurugJUFY05gpjiGC2n3yOBH1d4QRF/GUQFR7F/0mBkjZ5r/tP+U3rqlyboFv/eZPMrSc2xM+nvsS4VFOvMfjCZaL9+RW0PfzOA1rYJC0PbovftWDf1o7k4U08GTGIm7JfbLp/0i5K1+QuqP+l+JX6QYLI7+HP5fOysFjeTjJJOvP4sZlaT1kA5+vfAS8WBo9guAMGqQ1+SnMT8odZqUPaI4gGNnYBqD4pl47o6PF9gEeOzF7MWuoQz+qls55dNFsYNb7kGNp+Mf4Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH7PR11MB6355.namprd11.prod.outlook.com (2603:10b6:510:1fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 03:27:08 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0181.010; Thu, 9 Jul 2026
 03:27:08 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_hdr: Enable DRM KMS debug mask for
 invalid-hdr subtest
Thread-Topic: [PATCH i-g-t] tests/kms_hdr: Enable DRM KMS debug mask for
 invalid-hdr subtest
Thread-Index: AQHdDgkyJRw/AeNrfUO0LDsQbzX2sbZkiTiQ
Date: Thu, 9 Jul 2026 03:27:07 +0000
Message-ID: <PH7PR11MB6053EC178AB80B62041E6599E7FE2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260707121528.2984729-1-swati2.sharma@intel.com>
In-Reply-To: <20260707121528.2984729-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH7PR11MB6355:EE_
x-ms-office365-filtering-correlation-id: 0c03ede2-1c98-45c0-5d6a-08dedd69f4bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|38070700021|56012099006|11063799006|6133799003|22082099003;
x-microsoft-antispam-message-info: l4KiJrSVJR2Awy/UTuEHr0hm7w7W+xYN73Fu0AP6MjmF9bhJJtnZUh1BsTw1aFDlyre4coMLtxE6toSoS69OMP2NOWT+Eya9wcdGa4wjBUCO8haPcpa1+XBRDv/eBAb1u453btJ1QBUg1LOCWwKBIlvmPDXdsF8sMHRcceFjAD/PdJlEG5K2+r5HA7A4hf5tyfqAgHHWS4wkglfofF48Fsb2xbU6+v6Y5tgbmiLZZOr8+wyUp33v6gI3trTg/zfWuaX1rj/m8Fyjol1F8OGsOnbI/GPOPAVHy+1DdUt05H6bIBmC8kvWH8lSCApgxPRhpCfcpS4hZCf6eAmBaMfdEM0A9FrdTrloeaL6TkA5/CEVRizeVnBrDgGFF5+Isp30prEVND5jF2aNLojFK4mJQm9zc9y9BARvPrEhlNGkPtxJTOuhtkfLihJddAEw4PPLFRNx2i4DnZfJnHrK/QNR7GzkdOV/PksofP7YvrvI6Z1V6yXuEvyCbJy1AzaFt3CQG/JOPp02xDJ1LAdmsDL4bbvbA4hiY0AR7yVvFGUJJP7L2TR7B/pSeObsbLZMAA3qGpeIMHU2jabdsfsJyhrXgp/THh/KTzYG/gkxpgZPUjikc4WIEhU+UmPVIjkVjuS32ZmrmGUE/gBDo7t4EEOyjWapcOxRhgFBnzQkQhaHaOg46y1vA2Vkhgv1OH3NDOTIdEIQaPDdvJjtRW0NqPCL8qTREOCg0ZW2QHXPsG9D06o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(38070700021)(56012099006)(11063799006)(6133799003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vOgwmPGXRJTY8Wdwxn+WDss9gZhSBrvFJ6NzwFK9Gp9SimSbef5CKRzv7ia9?=
 =?us-ascii?Q?8thERq21lTb+i4Cwy+ZL2loQFPgswxH4j0n0zOhVXAMrRCW1XJqk0nuoCBMY?=
 =?us-ascii?Q?5RE372syxUlIV8AIg3vG8uJzic4FmaW36uxoAc+SDLlTQ6fCZm/1AZMgCvxz?=
 =?us-ascii?Q?5Y0n0DgPvXGedqIaXuGjFdOcdWV6iX0P5+fe7pWew1ZDoQDIyqfhtygCHCAx?=
 =?us-ascii?Q?XgvsmKK8KCtJIG4PUQGnFrZNxEMS5hf5pfL2ADejCueL5prtMnvex/lchHQ1?=
 =?us-ascii?Q?afG0tMD5B5dMw3MgPzzi5t/Bj/19RXxqtNSHhk9gHl9KcuF61yvQ8M9jWlzg?=
 =?us-ascii?Q?lb3adZbKjqoWVX/qrplWqlJWa+5fP928DhUCXGYhrNCyR1ieX9yT/0YOQMLl?=
 =?us-ascii?Q?daXnxpUh6jf+UXm3wicZbsHy+Q0paQYE3OwHfi+7mKbs392SZT7sznSOuDy9?=
 =?us-ascii?Q?dJwt9uONI9lhIIFsy/sb1/g9jhnWN1wcEnUJALdDnK04r+CGNvYwlE/YRdv8?=
 =?us-ascii?Q?mTb9IEaBrTzdu19W0Uw34MDsybLatc8oWEJHRaCnVbsFa0gDgKGwOR9XEVFm?=
 =?us-ascii?Q?52RsryDjXAoTIJz3QNAGRne+6QHZFF4AvA9s+zhb3gaAWsNcsTdCWdTdJqZ2?=
 =?us-ascii?Q?b2Lh4hTMc3hbbx2TzUNJoYbEjRYsqb9nz/hz90jcmTMzphr7uXqgZQKbRFJu?=
 =?us-ascii?Q?0QAsgNBnjj6e1qSApe8Fh0ZJnYVV8LB3z/Es+ahPVF6oLqu+Aw8WyTjAP3rh?=
 =?us-ascii?Q?aXP8t/m2+MxOYl7D+Rpafl0tazBr1qL2HpgcDkK0ABV/UMFLqJU3IrtVDSIJ?=
 =?us-ascii?Q?J4Fxpq9Z9gUBkLSCPRWwXXpvkobGEraAn6RPzKYlfiIdrghs6xuv16+7FGpg?=
 =?us-ascii?Q?1YW5tCAlJof0Ef0Zxqyq5EQaYxhBzOaPy9mEUU7oEhKhNPukwJsooiF6HqAZ?=
 =?us-ascii?Q?hehKUoNIhIwo1B6nUVAJc5KwGo0n5XI5+tp7MmApf/RAKFX1v6HcN8dSdZEw?=
 =?us-ascii?Q?9K1RtoD1jVHV8rE2QXOBf8PaiYidLdsDkvPKylBykIpQWxi1oWX0FftFhyHd?=
 =?us-ascii?Q?PLfjKfyKwa7xHn0l3LHoP/DjQEpyyDJyMP33CvEpmfcAJV1ejWF61O/F+4by?=
 =?us-ascii?Q?vdXMUhDhUa5b6fofIDokk3Vk205BGuiRCy0LrtzvZiifHlk2KpSJHaNbcwU9?=
 =?us-ascii?Q?+rIp7dznh/ylPH4XywncRM1SOLzjBtzbzCD+Hz6ldr1oG6bmN71oPiNNOIfi?=
 =?us-ascii?Q?gjinz5OC0NipC+CQV/RkwKetg+0soisBgd/EpwCKM83CVDTywddrTD8RJhGG?=
 =?us-ascii?Q?M3RNKFrKiWMhcmpDhXjeqiB9Lhx8P066mEfjXXoSMJ6Gx+HB83NIg6joPWTx?=
 =?us-ascii?Q?+65d7LCGRNUHeloHB1AYZ3VOeuBV9gJlUaczxAv9qPiWdD14d7bjenWbQLog?=
 =?us-ascii?Q?JZh2R61jYSNGuWP40vka4RIR4bXbHMXKVAK16zT5LIbMe6zGl9ODO57a6A13?=
 =?us-ascii?Q?pAOpkibc7uc9B4njCsKDHI30X25ksdxRF1KhThjkVKi/0k90w2TI3BS+dVkt?=
 =?us-ascii?Q?1KKp0ek0bXtjxusT/67kAvlL9EGRB2s6E8I6wAigrM86NhjTBipr86uZyc9y?=
 =?us-ascii?Q?JmvuT1DXLDXDAW/hvZhzGgfxeuOS3QlwD4ap0oV0muj+Je4hYkM+RWT1Nrqj?=
 =?us-ascii?Q?mTiXEMa754KnWrMdARCDzmAigg7SEvW8LN3pkOKEF5TEwwbcooGRikiiKe2G?=
 =?us-ascii?Q?ds2iMrxRdQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tBT0cDXMLc21WFs66vTl7Uaj3Ts9FNEwA2qFkso3nLI6eCM+FX/64u9URJZeI/Ro3cv5y5PYeift5rqrbq9tK+e8hGDzGwWsx2qlh+Q0jB0nTrbsVH6KU+qDWA6zTaUJ81NKRFa9psBKqEkq1s+fHurgH8v6lvaXtU/E4LPGJwjCPhH1CW/v9VVPlcqxkvY/Vb5nvKZuuhhESfgnqZffoOeuMbNEa/eQAmQu6mVoEP6shFz37mqvTSuJTSZKEAgW0qzq728FZwkL5h4HMGUMqfrhrHoS3JtFgj+m77avfdM5gOcFKiRGxUKPkaZfhUbtuj71g3OP1Zl8IhQHFyQldQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c03ede2-1c98-45c0-5d6a-08dedd69f4bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 03:27:07.9533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JECuRNo8kGVmbxUre4YrVDrqBzisWRhoqqFrpVVKCYtQLC4lC5PP2o1vTQgGO/dbkhNyEM2PKEZGfS9ZuHjJQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6355
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

Hi Swati,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Tuesday, July 7, 2026 5:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/kms_hdr: Enable DRM KMS debug mask for
> invalid-hdr subtest
>=20
> The invalid-hdr subtest validates that HDR is not enabled on non-HDR pane=
ls
> by checking for "Unknown EOTF" messages in dmesg.
> These messages are emitted via drm_dbg_kms() which requires
> DRM_UT_KMS to be set in the debug mask.
>=20
> v2:
> - Scope DRM_UT_KMS enablement to invalid-hdr subtest only (Pranay)
>=20
> v3:
> - Explicitly reset debug mask after invalid-hdr subtest (Pranay)
>=20
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Changes LGTM,
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

> ---
>  tests/kms_hdr.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index 2079bc154..5d6337c1b
> 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -34,6 +34,7 @@
>  #include <unistd.h>
>  #include "igt_edid.h"
>  #include "igt_hdr.h"
> +#include "igt_sysfs.h"
>=20
>  /**
>   * SUBTEST: bpc-switch
> @@ -713,8 +714,12 @@ int igt_main()
>  		test_hdr(&data, TEST_INVALID_METADATA_SIZES);
>=20
>  	igt_describe("Test to ensure HDR is not enabled on non-HDR panel");
> -	igt_subtest_with_dynamic("invalid-hdr")
> +	igt_subtest_with_dynamic("invalid-hdr") {
> +
> 	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> +		igt_drm_debug_mask_update(DRM_UT_KMS);
>  		test_hdr(&data, TEST_INVALID_HDR);
> +		igt_drm_debug_mask_reset();
> +	}
>=20
>  	igt_fixture() {
>  		igt_display_fini(&data.display);
> --
> 2.25.1

