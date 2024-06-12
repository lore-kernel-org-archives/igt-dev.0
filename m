Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6D1C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 11:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D87810E21B;
	Wed, 12 Jun 2024 11:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMqvxhk4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3EE10E035
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 11:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718192141; x=1749728141;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F9C1LIUk61lC4b5ephGDzCiUJ0RN+15leEN+Qm4zll4=;
 b=KMqvxhk4w462zLBMY88eHqG0I4qTRHuBvhMR5SURC4YGTpRIzmGLJA/P
 SFYsb6d/CIFrBRpNuYa6gwlnU4OPpMRXDk44MQXiDMz5EsdPswmF34HNo
 w8tBGKt2boUTnrsD5k7pmHRBBen0oHMHmMvkG5z7KKov5Uh+oe+v3aCAp
 7rCoONlxgC27iVBLPBQq0gkvJ+S4Lyx92inPB9QRWacdBIvCUcWCmPJj6
 QbkqiUMYYnZQqJc6gx0PtbNIstPqVUucnYOM8jJlC2GfRUjM4zZFhXXKq
 nLmPQgf7HKYOySiS9N3imUGFcVlcVbuo0fuQCN1/6TQWxUsjTfolRTr6v w==;
X-CSE-ConnectionGUID: 2CnxZgyBTy+1DlWkaQZGlA==
X-CSE-MsgGUID: YG1q8IydQvS016oFXP2NnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26067103"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="26067103"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 04:35:41 -0700
X-CSE-ConnectionGUID: byk8QTm8SNK/o8DAb3jjcQ==
X-CSE-MsgGUID: fXmSMIiKQjibomQeXVJA4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39649425"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 04:35:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 04:35:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 04:35:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 04:35:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMh1zZsBsfJTx5dZo/3D2NL47VU4yNYYxdtcBPNdFJWWu520N74CyeiFJSJqYM0hIAJCylZlc5EdnnvLvSB08wzNIqwnI6J1Uxs6vArEPC4vMxzdU28MXqJ2+TmtllpT/UMkzjZBqQlBU4D/j7AUprljGZ1vTk7ZXtCWiPmNzXJewnYPap5e7p6TPryRQVR7h4h0vETgl+v4X04C44i88fiekA8KuHVOo17torvRd/Jns8YFqKJfykFHJ3DD/8qPmJ3MyEXXPX2/W5hj1405qcJi+nuTIH/ORDqYFHX1lpyMKnuvRzUOippnu9l3X6HmBt3X9pVarLSgV2NVdTRWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvfMqoXEYm7qMKLX7zyWcKVvczTj5gpuf9V1TUuYGoo=;
 b=mFBiaQldhMNplWrEuCAEW2Ab4TnBwAmkuM+Om9zGt5/P4BJu9lsY7g/QsCRPqvUVPc5I+4gLiSmO0Db3dHuLwQKX0YcZjO90FVcwjN3zHAlFnX8s7iv9LqaE+T8fwneB6bobakbwnlWdkYmRaEfw5wdAvLoxdPvo/rv+ovr8y+UfIxFCXwTTgP7ePLkX0ccQ5wU8gg05LQjSC+SpYso+wyMVulxGi2470znhm94IwBzNgy2Mg1j6iTyNoDr88zN6cPgo0ZgzNoYUjJwafvptkPIZYsAw7oionI5HzFJtgTv3YODeQTJ4G4VQ0P7WB743Gh8GhJsT43PFXd0kLPxTEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 11:35:37 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 11:35:37 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t 7/8] tests/kms_universal_plane: Test cleanup
Thread-Topic: [PATCH i-g-t 7/8] tests/kms_universal_plane: Test cleanup
Thread-Index: AQHau7x+B3mHQwnTjkOde7Y/NtEcFrHEAa2w
Date: Wed, 12 Jun 2024 11:35:37 +0000
Message-ID: <DM4PR11MB63126430A474B5EB5545331A90C02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
 <20240611045348.3727239-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20240611045348.3727239-8-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB7006:EE_
x-ms-office365-filtering-correlation-id: 7b94bc35-bd14-403f-335a-08dc8ad3c79c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info: =?us-ascii?Q?4VgDhi5W4jC8IMV1w49VrAVTjcu1qvoOWIQK7Ems/8vpxTwYkS7QPY4T56Y+?=
 =?us-ascii?Q?8bUFVJ/pOrFKiN+zWox4g/GmgLoY/FJhclzkMMoxtdYHfbp9MKlLKFip/A+Y?=
 =?us-ascii?Q?85jNDQw5Afb54Ekfzsu/liFyxmK/sjP1UB5qAMay1ZtLu2fGCw+IP+H0XY7w?=
 =?us-ascii?Q?RE4/Th8K7qZllUGvELZzvDQZxuRIBd3QhPT78HQb8YOkDm4covMvZrWsyu07?=
 =?us-ascii?Q?Aduv56Rm0ggoeC8qNTukytGAoVJmkqLJbpdpBv0Enkp/q1A0bfEaQifwvNgM?=
 =?us-ascii?Q?t/ui9e8drQ3R+uA3zPhySpuwBwjDFIq0YLl8D04smJjCKETnpjOFDZYzOZPp?=
 =?us-ascii?Q?mlkMPQBTnC4i+OhEocJs3WuJ8nWGXysh89EWG3HcX/EBhjDlLaGixsTMp96v?=
 =?us-ascii?Q?PY4YjntIYMQAR5TdlHzqcJa4ZD/QcCayvweonaxdONg+nzJSm4Es2cQAKulD?=
 =?us-ascii?Q?JRSDY7JbtVvoO4/8cRClFMy5Ou+UEMq1noDxb7vEy2n2gSKSX7abQPUm5x1D?=
 =?us-ascii?Q?rBBi3VZs93wJyWydXuszubrvmKkYHnsgpemNM+bXSjkDEPOFrIgRrB8Ny4/q?=
 =?us-ascii?Q?2w1e/xn20f3fySCjCLYJUM21bh17DwlAnOxnn6MSfd6V/+Q9xfxGgVnrQE0D?=
 =?us-ascii?Q?ISul9SNv+sEhtAIRrkW3nCKyznx5qPpQ3gwxCupVkkAp/hsaiE+jtAWHCao/?=
 =?us-ascii?Q?gVIOxagucjjcTs/901kPShAYfrVNBZ8ZXYN5Mv9UGRaNxsaA/KK1UfpAPB2Q?=
 =?us-ascii?Q?3DthqlYsPuHVAA2ltxAllNGUMPGcJx/7C27Sdn7pq4/9+j676TbkXBMTkVs6?=
 =?us-ascii?Q?DocmUiHQUd7p3tNYug+FOTnjurA8mIGbA270ixmopCSG0kchCpn3rujweclG?=
 =?us-ascii?Q?mU7YTXHDIpQ+DvVUZm06kp9jcjTAJBMN2Vy0SVi0XEQzd4HQX2J6cz9R7hGA?=
 =?us-ascii?Q?98yWkeM69ytrkM5saq6XBEaoU6mV3rIV8AANSnnVtScQtyiItHy7VwsBCRku?=
 =?us-ascii?Q?4nm5XN19UbgNNLI6s7W67fxsVxWAHn4sr7oZ2RuMMsayiJG79RffnSQrugxV?=
 =?us-ascii?Q?YZn9WEbe8pUz6UN7P0rWj1HG11RMInE7yHwUv5POwr72pWL9G+zuhZxyrgLD?=
 =?us-ascii?Q?YGuFUXumDmqNQxBioW8o8T04Q8gjHMVYXggZ6cK5j3UhsUAK+gTRHDF7zxFC?=
 =?us-ascii?Q?8kqQt15m73JrgD9YKlKxjsi33wdrxArKmJ57t6fhrmnt1aR7wtZuhx0fySB4?=
 =?us-ascii?Q?dECA+KS8Kilm3Bddqm7u32oEImGVLWv03XHzGA6l75dCWcDO8Uo3tP2VAWQf?=
 =?us-ascii?Q?BiR4pmF3HfT8NZVQLZPja0EBN6BXyQh5IN55AHBpzFvXN8bRiNI/iCwX2Rvs?=
 =?us-ascii?Q?Tostum0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DWxBLvTuHCjejjRcRcfwQ5sxsuazvmCAiouV2f51l09VIcXLCu658n+tXK/v?=
 =?us-ascii?Q?qJ9Z2Q0w/dCynMwe6ph25kT9KQyL7JjgijXLLp/WhOMxbl6tO5/K/KgIZcWB?=
 =?us-ascii?Q?bUPRv/y+z+RkrzIyDSbotOWiFIpYnl/PNcgkmKf2wZWUmMwEvGmnSTRwdLyJ?=
 =?us-ascii?Q?zxW9YBlmbmFQWv9nCfefUMlcfGC/XEaUQ0MoQSp+YeTaA24Ub5C+aAhkl9Lh?=
 =?us-ascii?Q?eRB+lJyUibo2voAkO0/92du8RluC2YnUix+PjPkdmy/TaQNqAUm+vnfYTQes?=
 =?us-ascii?Q?+Q7iHKuM/zxQjzOI46Xt+L0JzZOowO6HzaebLIVCTNXTN1ZnP6gHvQz8mjhs?=
 =?us-ascii?Q?nnBBmbt44TEU7SMnHnk4HEtuj5HFlA0F3bcuiXJpdfnvUFnl7I5JaSt8tvOj?=
 =?us-ascii?Q?CI1FV+K05l1EebwkWy3vpYSAWjyaQ+wkw/XmNlSRXo8JqOcVYhMuAz85xXkQ?=
 =?us-ascii?Q?nM9SBLBXX8/Y6W4sdTpQbxEwVy9kVgmp9rkmgX5hw37UGvQrR2l1JVJeNImm?=
 =?us-ascii?Q?/ieCyNzk7zbUaHExCkxy5lpyo+9b1S2i1DA4xRRdL+P4kUFkc+oZLDEx0rV0?=
 =?us-ascii?Q?Tpsj+kqkVDzmxSuQXjBIid2o9g+kotDiYjhAgS7lOTqMYOBPlxT6XHu6g9Mh?=
 =?us-ascii?Q?u0jd8kzayd2FTJIL5AIvsu8hsFnw7EmPZfUBq34fBb4HNScr9a9FC8tjEBqM?=
 =?us-ascii?Q?0ds7vclQ3bh4l8aeJ2/xwHXmtL17A+5QyilbvkpYZwY1hKtgExdqGmf+XuT6?=
 =?us-ascii?Q?ukth3C88BONWsIHGTD7sDkxnjZPPgMMerdTGcSt7Teiq1yZVaG5YW10SIoWR?=
 =?us-ascii?Q?fQCtA9/Fc5Q8ep5M5BblQ7sFVx4rLtq9bx7UZ2SlhVS6Mzj9NN2ak6mLnE57?=
 =?us-ascii?Q?DbdmzrYPBPNiHbfBMbC+sVhzUDU7ycwekiDCmAIME7Dj3b4ENu0s+MGbl4NT?=
 =?us-ascii?Q?LTUqlynuZBIOrL/H3xuWhVMXQYmXQhgAFhEsVznBTLSCYfzlc4k6NuN8ldOS?=
 =?us-ascii?Q?kPMC9dgnDGU/Ql2KdgWBc8dRDvpyw3hr0BkPWQflOQugEVthuDLL/hODyzpy?=
 =?us-ascii?Q?/XT+MjcpOXXWYj9AoHP/Yxxf1H4jBbcPhZPqSawFBZ/Bel/pZI3+x0RvbMUk?=
 =?us-ascii?Q?g/qQsrM23myfUv9Kw3a+O3HF+ew/LMJFykBl1z22JPooW3Klcwd+q0cw/ARn?=
 =?us-ascii?Q?O2Vyrun++W7IBCoGvwGS5+rpqKGxxi0X9OkVYaXy0vTzpyv4sExDAeqNv0zj?=
 =?us-ascii?Q?Q1ZnXVYApabmxn89Apxc3B891k0V29cTvT/kZp+W6cMW3lyYcMlgfpqQOP1s?=
 =?us-ascii?Q?CSzJ3KutC4CG17zuMvmQCBb0lQBC6UKIWMBmJBRadRDTfxXQbroWLocyR0L8?=
 =?us-ascii?Q?e96+Ia1B1LOUpKSpmLha0YVpwMZ7KIk4bKCApUmCCACD8XD7ZsSducMgvOP5?=
 =?us-ascii?Q?1r95WFPnl3wAFk/GqRn6WlTzhobUoa/lN2o84CfFaW03BSCQJRbfQjxsn630?=
 =?us-ascii?Q?8u9R+lshoKXfFfWzgZ20CYfZ8EbRp+aJsrknufAOA91ZRzJROcae6b9Lobj9?=
 =?us-ascii?Q?Vku7r0TC+nPNmmxAf3g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b94bc35-bd14-403f-335a-08dc8ad3c79c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 11:35:37.1013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WtqtrbLhcroJPQz7Wa7f2cicP3eXHxbjmSu9eughF66pgyJe333BKUNfDE//AP/JICxma4WlobrSkHZDf7tufw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
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

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Tuesday, June 11, 2024 10:24 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t 7/8] tests/kms_universal_plane: Test cleanup
>=20
> Make sure the below points in IGT cleanup:
>=20
>  - Sanitize the state before starting the subtest.
>  - Clear the states before exiting the subtest.
>  - Update existing libdrm APIs with IGT kms APIs.
>  - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_universal_plane.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c in=
dex
> a6e11777d..8c1ce8143 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -139,7 +139,7 @@ functional_test_fini(functional_test_t *test,
> igt_output_t *output)
>  	igt_remove_fb(test->data->drm_fd, &test->red_fb);
>  	igt_remove_fb(test->data->drm_fd, &test->yellow_fb);
>=20
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>  	igt_display_commit2(&test->data->display, COMMIT_LEGACY);  }
>=20
> @@ -386,7 +386,7 @@ sanity_test_fini(sanity_test_t *test, igt_output_t
> *output)
>  	igt_remove_fb(test->data->drm_fd, &test->undersized_fb);
>  	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
>=20
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>  	igt_display_commit2(&test->data->display, COMMIT_LEGACY);  }
>=20
> @@ -516,7 +516,7 @@ pageflip_test_fini(pageflip_test_t *test, igt_output_=
t
> *output)
>  	igt_remove_fb(test->data->drm_fd, &test->red_fb);
>  	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
>=20
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>  	igt_display_commit2(&test->data->display, COMMIT_LEGACY);  }
>=20
> @@ -603,7 +603,7 @@ cursor_leak_test_fini(data_t *data,
>  	for (i =3D 0; i < 10; i++)
>  		igt_remove_fb(data->drm_fd, &curs[i]);
>=20
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>  }
>=20
>  static int
> @@ -752,7 +752,7 @@ gen9_test_fini(gen9_test_t *test, igt_output_t
> *output)
>  	igt_remove_fb(test->data->drm_fd, &test->smallred_fb);
>  	igt_remove_fb(test->data->drm_fd, &test->smallblue_fb);
>=20
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>  	igt_display_commit2(&test->data->display, COMMIT_LEGACY);  }
>=20
> --
> 2.43.2

