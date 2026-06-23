Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D8ECDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 08:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AF310E9FE;
	Tue, 23 Jun 2026 08:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9/UyAM1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665C710EA06
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 08:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782202970; x=1813738970;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0imVjnfnQVFMzi6WYKxyg9TjV23xutjguB+258qWpsw=;
 b=a9/UyAM10SmWWUXPdqalSi54IILhb2PSQN7mnKvI2WXk+kGeZCEu1Qt8
 nwAI8sb8oK6iC8Ag/UVVd8i7FSVDCkv340KN0vKRNdEpiJEIFNcludcgg
 Pdc7Pq1pce97X47IUgiPz+/hWgPxa+YP4sNAfXGZlLDGELyirIguFZseD
 g9dqeYpVSmyF+3VtRRO8vgpwiG0lG3/zr3Wxd9jhaCclmozi5luOCkqJK
 YjBBwdbCUGS/VPQnZIj1FXqCKlFGr5mNiKqeVGGC9/TxUNyYrd4V6tF+V
 M6XVJzQUC8a+kWD4tQ5jUtEtqvItqVmm5rYZPPdLvkZsuR8Kc2DYg9NK5 g==;
X-CSE-ConnectionGUID: S+yu1xtxQ1+TxY0uBEJGqA==
X-CSE-MsgGUID: P0DBGA3STx6yaxYTJC7vtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="86782301"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="86782301"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 01:22:50 -0700
X-CSE-ConnectionGUID: uLv/8y6lRHeVEAA62NrJEw==
X-CSE-MsgGUID: bv6K0fbbTDmkfThX1/s78Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="245318749"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 01:22:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 01:22:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 01:22:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 01:22:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlHruNfcTKpcD5Zc3+WFD3b7C55DNuy7j/2y0ciUTT5L1du28sHUoK1nEDhMOa8vSUchxJEn+0bJlPaOKjWopZy0d38GdXujsip8Q4/AkwE8zqtZbx1W9DxV5BtnKkeN7cJ2Z9MBW62juCcwc0bUW4bJ96g0cc1Fa+38Ig7Sab61edSwwVrMSmVVpJ0V0yXfwZUuz/k4W1PLw0wYcG8UscFGFOXRoEmK1uQGblYTx+7G0fbNKjwMpfP9IXgVupRIdKbpcdH0FjhNO1Q00WnrgLPWGs+cadsOnswwyJ8Qdt8SPbc2Lp+J/NyyQfXvwm+WWu0Hb8ITG2jbuIHSmLY5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrioMAstDCuzLFICwBrd4JutNdjky4PeWm9o6uQx924=;
 b=dt6G29hl0D3yJ36q01LxFOtIFkvLqFAvs8PYzLQIrKdZsfoZ+QZRdeIQJK25eW3eW6UHHVg0K+dgbtxTDKXB1xmLPzWEdIYnSZ9PSVVLxByHXlPvG4BF9seHqR1GPlKgrHXcw+QAYu4/Si2kM9wcMSSsDYNx5yGHWKpTZYBoZrdfmyhTXN6VLbHdSszFtBBDTjAnuJ5Gyc6HTDaFxudFO9opswuJM6yaayol6zDw6KkekcEFpMyD5e93Q1Z0ezBf11CVDui0kB5bOyY4QKDquzzOLhweDhSoQs74R4bu6ttAzFwBE1e0OGxz6M7Ki0C7GA6FvOypzTCr4XAUbbd+UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS7PR11MB8808.namprd11.prod.outlook.com (2603:10b6:8:257::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 08:22:41 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0139.009; Tue, 23 Jun 2026
 08:22:41 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_hdr: Enable DRM KMS debug mask for
 invalid-hdr subtest
Thread-Topic: [PATCH i-g-t] tests/kms_hdr: Enable DRM KMS debug mask for
 invalid-hdr subtest
Thread-Index: AQHc/2DJS4DgjXdBr0i1Yv0alkpT6rZL0cHg
Date: Tue, 23 Jun 2026 08:22:41 +0000
Message-ID: <PH7PR11MB60537E6989F86FBBD43FA37CE7EE2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260618203454.2717685-1-swati2.sharma@intel.com>
In-Reply-To: <20260618203454.2717685-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS7PR11MB8808:EE_
x-ms-office365-filtering-correlation-id: 73539db4-6358-47bc-2ada-08ded10097db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|22082099003|18002099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: AqB3G34/aT3DZLCJ15lzexz9lzAwjxunQoLYgO5NP4plROP9qrdcg52OKvPZIFc/keZwJN/MqUhvPzfz7lU/HrL7uMBMUXj8Doae59H/VL+/RJuSQaptpHsOhCp4O9DjGTVVPfzHqnbtgPdZcrTvX47sx6yAm4TMNKK2Gcm/GPz+X6S4zwkUNC8NxuaH+07GATKa6jw5I9atv8ERVpyzsG7zlgIRI2pAHgiP0Y0denGjx2/j5rLk2iqeaMN+mc+V+ewmKWKFsAG4DEH+uZjRFQo02awYNTsNjn5wVbMymNpCyfGPXD/cS1+/hFJ+NNmJKh53cMZoEmShpu3Qc8gS+7sEgiJLXBkceOvmSk1OwOOtTswkhK95aZP6qe2QOI4ZacrWsjv9mcMBUKNdncI7ExMTNHdYgkDTGKC0tDJu23tImjxe2+ol7qzR86ALS8QBY+O1nda5c5D8QlurFF0+GlMHi0jAbxcp9hy+4QWRC89T2C8RFk0WSLMagCqyiY8QKw5kYU/8bCKaffx/qyDtXODPdCaXLVbQS38wrlFjLgmpmL7DtZg6PLV/hr3MNIZY5lzUj+Kx823tG7627WRDVwDSAJk91BobTnvWyDq1/YBvNzC1kYa6Z4U56oS6UCMr7ZkZBFjnQT6y1eslYA5uuAf7KlAriGQ2Z1vUExJh/ImGym52O39EyF3OMG+UTkmcbLsSXM134lXjIJXTO6fZoEmbB3d3mfcsggYYX2eA5d8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3DgsegiugzIDUaRxDjl5pI6AWT/H1Bbh+oElambrZMoKEmu4t4C9rbbikU/0?=
 =?us-ascii?Q?c9ohIfFEvx8yEqOUdPAkfhFJtYxiP5LUZuXQNQQe9wWwhin/iVNeJYputMfW?=
 =?us-ascii?Q?AMJLGGyDX6vgztQ0b9UQLqkK9gHfW9goS2rz9Tbapb81Of6IzwqvX5kbayEs?=
 =?us-ascii?Q?DpnI5jnD8sCZ5BM4y7xaYLHnfMA3MCJ4QZyn1KyZ5jaGf/U6N5v2DcOejhuj?=
 =?us-ascii?Q?8nLyVpWKvKPIKUnEKBnnTpV+2yJog+0nczGvtLUPzCG0kXk+a2OMmeFkhqJx?=
 =?us-ascii?Q?mt/xwbxU2ZeLZwkEYx3Vt7oH5EaypT2nQQyk+cFJf9vgjwfqFgTyfeVrPPFD?=
 =?us-ascii?Q?lyWTW8GA/MBNz/GoOFlOMLibfo7yN41ZrY/kBRCA6ql1/vL4vaA2P/bo2bPa?=
 =?us-ascii?Q?B11wMTUY0IpB7NxErOmwsIW/dEjuVDShroZ8zXj6PF1nbMp8rQW8ClPyzk34?=
 =?us-ascii?Q?gVudmAzfDgJkLp1bmFoKOlpoSrwsTG5JGVACHkmYox6rLXKV01fKldseqCyW?=
 =?us-ascii?Q?cepEnjrvMs+0b3sQ2dSHhsqnwF8e4Nl7azT5+I4J3fWqOk0PJE1NYMIopIPi?=
 =?us-ascii?Q?S3dB8hTIDtOgAB55J6d9ucdr6sVtTjPjXwBTA/TSJM+bUlAfm9HgcTNErdXl?=
 =?us-ascii?Q?AL32eR2ZojL3jKxJonWR4i7LJjiWfHAYYg3AzwFvedu9JJyfsLmvmuesJ/QQ?=
 =?us-ascii?Q?/5zeh+RJOp0NW2cXn8ImiIOrAiNr2aM1qVqXhM2BXN+cj3n2JN6di2nsNUeG?=
 =?us-ascii?Q?ISLDxWFuzUqKv2ridyZL8AR8vrmrowhI2CMcfwoLavHKnzrCFZCK5QW/82RO?=
 =?us-ascii?Q?L2L1ONFqPsG6W01LxSOYxTJ7EfzfbkbDRJiG5WblkiAI8V5zz1mAf3IRJtXc?=
 =?us-ascii?Q?ouEuI+lh+GvuNjB8luS+z8YX/mSbqlAooFl0Tsr2i/5UBNA4opSSTLYXswMy?=
 =?us-ascii?Q?vgPuGwZP4m4SvKnZbzM6RKP6fF2yHIM6AiH02fTd5y2UL4llMQRP2d784ilP?=
 =?us-ascii?Q?8+yEn/c+EoVXyXlte8y9PNsMay4bMtHPmwqjBT+4414rhnbI1JLHpUTxuvud?=
 =?us-ascii?Q?vvL593P27+LUg55jKP9HBQPXIIX0lgHgK3Dh07vKC/pHrEM2K7hgLyWeOpHn?=
 =?us-ascii?Q?95Ajwix6tBBgET+8dzJ5yGm8NgnvY/IpJepPKvPVu6EMudFpTarftP6Jzk7y?=
 =?us-ascii?Q?GqFALEp7jjGieONeriQZM4cwT3C/0pTzdCU3FNCK5d+j0etlDhN3ky4Pp2H3?=
 =?us-ascii?Q?mc7DO18rDWM/bzN2vZDmPo2wQ4Xbm+MhRWeHR0FN/XyykSxe3tm7aXN+VtFn?=
 =?us-ascii?Q?9BPReotTD49NMjmjxYg3WaIt7mgnliOwwnjobXgE6pO6AzL75S1K9Xi2gRlX?=
 =?us-ascii?Q?64B8IGA741CoWBC0k08zL5MRlmWabmGAkvQxNduOq0cefWBk4fszdTihorZG?=
 =?us-ascii?Q?ZTfq+4JbqEGvE78GFc0Zgvbox4BM5w9usQYfQ8Ks/Uj5sAjzTbN2KGutf03t?=
 =?us-ascii?Q?98BqfNPTxtLAAVJ6mZ5zIfrCyFf7+HZaCnS3zZWHsOZWs6/3TuyaQ1dloKAh?=
 =?us-ascii?Q?azS89nawj5MOdXfw6DnPi4KbqJHeaZmqJUvFtec85XQHMZ4yAiaSoqQaIHJ5?=
 =?us-ascii?Q?AXpWXVCrkrDEpt19iJUumR1f9G+Dyget6unLAYlvoK4Um3rqQ3a598E/fC2S?=
 =?us-ascii?Q?Bg6OsRdfgaHIxfyrKF4eYY8DF1c6Ab5bGRlL2KzFGBWNJ62ZM/dzdGN4Wo5M?=
 =?us-ascii?Q?SsHYus2akQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QxQrMlvUJYQ5AI4B6z3D9OM2J8Joe/4BSCIxl9TgnFMd44U4f/Yjc0yktCpzV2iMmSG2wgHQwtj1WPwSpg6lFfhR+RwJJ1vjWV4T1Y7iG28atdvVfx96spcZpUCGfEI1nCzxPtDOiq3GPAL3Q0fzuirQoWfV+VwH6C67s7dk9KQYSm8bOO5wPFbpkTCeEYyWz0KwUJDKp3ojfdLxpTBRrvgjQsIScSpKhybXLFsnN4CQogeTFuqH9Zbksn2qcJrWXQ0Ud0TCz8kdO9zrZuISed84CL0yecebmiCgI+UXE76YnkfrMa95atMjBcN74rtUT2KlA/uZjHhhrEr551zoEw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73539db4-6358-47bc-2ada-08ded10097db
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2026 08:22:41.0505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DmlpWe8W8DWa/vg7h+rPxNGY54gnGv2sjSoe9SJ27pLV/IFZA8HqXQWabwcpUuPZsRvwHWxhoaCirrRobM68uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8808
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
> Sent: Friday, June 19, 2026 2:05 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/kms_hdr: Enable DRM KMS debug mask for
> invalid-hdr subtest
>=20
> The invalid-hdr subtest validates that HDR is not enabled on non-HDR pane=
ls
> by checking for "Unknown EOTF" messages in dmesg. These messages are
> emitted via drm_dbg_kms() which requires DRM_UT_KMS to be set in the
> debug mask.
>=20
> v2:
> - Scope DRM_UT_KMS enablement to invalid-hdr subtest only (Pranay)
>=20
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_hdr.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index b0b038413..99960cda7
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
> @@ -678,8 +679,11 @@ int igt_main()
>  		test_hdr(&data, TEST_INVALID_METADATA_SIZES);
>=20
>  	igt_describe("Test to ensure HDR is not enabled on non-HDR panel");
> -	igt_subtest_with_dynamic("invalid-hdr")
> +	igt_subtest_with_dynamic("invalid-hdr") {
> +
> 	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> +		igt_drm_debug_mask_update(DRM_UT_KMS);
>  		test_hdr(&data, TEST_INVALID_HDR);

The exit handler is enough for cleanup on failure/abnormal exit as of now b=
ecause=20
this is the last subtest in the subtest list.
Optional but better to explicitly reset the debug mask here. This can avoid=
 affecting=20
any future tests added after this.

Regards,
Pranay
> +	}
>=20
>  	igt_fixture() {
>  		igt_display_fini(&data.display);
> --
> 2.25.1

