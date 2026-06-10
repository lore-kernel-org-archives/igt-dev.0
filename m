Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437D8CD98C5
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 04:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DF210E6C9;
	Wed, 10 Jun 2026 04:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oc7ykjC6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0317A10E6C9
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 04:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781067332; x=1812603332;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rUPkQJyEZco+9ouG5JFrCW0T0G44Vlr+Xg2tNaqZ13k=;
 b=Oc7ykjC6zTwsVFXp5NR8LB/qd6Ft6Wv5ylWf92Kzd6FA1xOAoJ6HF47O
 2jufvzlonuLq4/HUd7RU4vqjIN9gYghHooFxRd3AJMA+S1Tvd0Nv1+LqS
 olk3hVgZjfBax2Od3ccZJX05IefGf5oCS8OaMjthrBvqXzJNtnfo57gb3
 6odL7SJN0ysdUWmGAICP0M94jJiTLksWebkINwUJxbvisDJtC+9omwikL
 1PT2PMnKeul6GQ+v6wUU6NuPG11bq6bxIaEefWNPgB8Ex3W//tFfbnjBw
 +kA4cRVnFzCewOb/egk2f3PHP5WRBfUfLskX3gytx0U8QdmKecTy7VnkT g==;
X-CSE-ConnectionGUID: bSlKT0h0TfCRd7KodOMS3w==
X-CSE-MsgGUID: QMDav/TbRoOJiEARaOSqOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="99268348"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="99268348"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 21:55:32 -0700
X-CSE-ConnectionGUID: 5Pqe2tBzSJ6VlqlMJj0avg==
X-CSE-MsgGUID: uZYSDsNgTyOZm8OcloKSyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251135384"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 21:55:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 21:55:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 21:55:30 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 21:55:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWtXPWRT6j1+deLcdIxbtQ4GLDFp41zWRfTTD3DYyFu7hLvuABchfiMNy5sIqabKVQswDtPdq+maY4YbOaEX3sW+JENYPC5CS0/rXBij8lWU2soaVMtnyfsDmeNn0ute4qThe43h0+VSL5bQQq4sjbhU4N3XqVi+R/74g1tC5sLx7qWl3iKWWaCGIrnDTkNKVqR7W9m/s7kxeKyg7JOlktDItuPt4dSpD7CScVYyHex1oMSIG2YFJ9M3qKjbQXy5ZyXbf8zLcbA3y0C6YVw8D16PvK5dJOtIF3lmpjDIXVszb/s0s5m4/hv6yH3c7eceXMGA4F+SlaSEfZWG68CA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgKYOP+toQfX9sRVEvhSxlbPET/cyiV2FgC4QsQgC10=;
 b=fMR3UxY5Q0OTCAph0VnI6zFYYNobqS1QwJ5JPVthSXiRnq1UBWabwiB9ImMKhXfbkPfNnBxktdIi1OKPu8YtDmg+rVXn1eQ5WuP7ict3O1jYZlVaCp5vPInZrJD1sNLRwKdno836Cr3KxeGI3i1r3QowtBFbpKM2+Aw947pCF98HvfRohLePFUtnE5RTqAXLR8PtW3TrcVS1UzCKXO915SluBYI9ZHBhukIRGXPz3KKVpAL6dXA76MhbuSGu+99A4GhGfYonSVQ/UyFc8H5k9sFFIjlV3HX4bpCuYUZ8oiu8zXUWqMPz4TMJF0FEqo2O+h98WjVGcaBSrVeb/JjXjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Wed, 10 Jun 2026 04:55:22 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 04:55:22 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH v3 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
 validation test
Thread-Topic: [PATCH v3 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
 validation test
Thread-Index: AQHc9Lr3Crmr+bRrx06W5WWV9HaUq7Y3QQoQ
Date: Wed, 10 Jun 2026 04:55:22 +0000
Message-ID: <DM4PR11MB6312ED6A1E5B1CB5389B521B901A2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260605070235.42439-1-mohammed.thasleem@intel.com>
 <20260605070235.42439-3-mohammed.thasleem@intel.com>
In-Reply-To: <20260605070235.42439-3-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DM4PR11MB7183:EE_
x-ms-office365-filtering-correlation-id: 27cebc2c-d6c1-485e-6e7d-08dec6ac7a7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|6133799003|22082099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: IAzJkzbnvEglvMoXw/JeWAugvCrhCYtEeUmDQcw0qj63eNJhGfRJcODkZzpnd7ISJ5QI8PdQ93e5tpd1WZ7OzaRrwHzm7ONl7TlDhhvwjSCLvjzQgoZfmfw/elao1tWZg1AXjmCm+5uCDMq2W6Xqyf9wqsIOJWlLdFxDTDxpvWR9Er110YMZSU1FZjRma1cEe3pkYjMWRu/EV4QTp1hXamgEm6ysrb4kdHE9GUEGJZlT60YmUvoCkGmlRx/6Wkhe5+dRiBlxqayg0ULh0lwceIVnmKQv841gTthj4V6TUzjfK/5MTuyhnh38OGM8ToLykBUtiQkiAOZnxXCo80a4bdXjwc7MtSPVr+irda4QqqIXSuyysNGjyRawAFEqOVmg+rWBATD42fYylvPv98RUWlc+77Cr4vEDOxhI/dOgKdfy/Wvnzh/ucMfeSjp5s6yumKfuDViRSLnfdm7fQai5d9wrI6B0/dP5I58dadc2rAi60PdPSZ1fXwf0lNgxeNmbFcTPatPpEy5P0kV7ADcC+ehAWJSO2BSybxT9ixhsuilq7qebmQw0mM3wG15YE8zrje9d4ofAFMGV3l2hiC47e1GF+BhJbBMIyuSGoSAOEw1xiIvy7fYciyImOZXM6zr4j+OUCVuEL2xw53qFYj+Hl+QZaxO9m3TZgC5HpTRkHljTyLqa/NmYxX80xOi8Qfg49nGXuTcb6Yir555RGhwwHRGGLNpI60bLAM7IJY2ECIhJtCBegkrhqNN6eh5RlvB8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(6133799003)(22082099003)(38070700021)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gSp+I9MeFJq4IRSWrPjh4sOMbhqqaiTne/qOVJBaekfLbG8TbKj6E7Y0zN14?=
 =?us-ascii?Q?K+pfuWS5i5Su51/zXNUEyl3hP4ksvTf2W8FxE0SjNvsdNmP/BB1/cbMTILuC?=
 =?us-ascii?Q?F7FezMdbBxk5xhn+S+A7HSPeIjh0V4FeSEtckWuV+eTxkFcMamGdt1NOhuA0?=
 =?us-ascii?Q?9YvZNHl91DvuKlfx+S7dQ7smfd4YmMmsrf1WqQo4btd7B1a83pvNOFdSw4g/?=
 =?us-ascii?Q?3SBBjf934TqUYmmLS7Xz+rnBNDqQu5DB1G4A+xmabVDhW/A33ReYI4CJgqUO?=
 =?us-ascii?Q?In1Q/FY0JF2mVL07o/beKrmQOvU3AbQGBHgR1Q/yHfO/cycqmK0wjnUcw87J?=
 =?us-ascii?Q?lby5iVw2FsOJOWQt3eRJ7fcypcuNh8wlRCF51yNzz//wB41ql7cvr+0AAb/5?=
 =?us-ascii?Q?VqihBMuyESKVF4YWG52tZ+hUh9dnIafBcrvxg1bDi7+ma9nox+w0Z404F7LD?=
 =?us-ascii?Q?/t/flg2sP7vMsRRoH1GfbMSKMPvfujpx4w3xt8o+5nBUIoXpR1e6kvbXldic?=
 =?us-ascii?Q?QYJwfTdzHic0UAxNZhznDuAezhX8FcchKaYOkIiNvuKBG2NuCByEFWfyRmFO?=
 =?us-ascii?Q?BXoTNhX26ZyIBdcEK206Bol1Lw2HRYz7xCrCt71vVKbIG+anRsa8JLMhOmj2?=
 =?us-ascii?Q?tgMZhz9qyxY+rJ/mT7hAB0Lz5/jnGtNbvp0SgwQ1fekurRu9xmCSkQDggnjK?=
 =?us-ascii?Q?0npocp84MShVOXBFBMyU71XnICOHbO55cyGJr6xcZAabp4kpa3Izy+r3BaBV?=
 =?us-ascii?Q?bwWdaN+h6fB8lUfi0lqu6v1QgY2ckjxWWi143S/aumiheiZjoHdcrSCcEzx8?=
 =?us-ascii?Q?O76JtsCywPI9GMQMjj1ikCAAb1UGs1lIkFVdwtWmxWrv8p0oZC0t31YK7aNK?=
 =?us-ascii?Q?aSvPwRQhR0AVtWIQ/g5PXE3ejYlCrRC/8nb0/XFdhDDPG5toNGgbSgJFc/5q?=
 =?us-ascii?Q?rOqYB1TtZGCCEeFHSuU6R+mq6VYr+bio110c2Un1D5nZldT5eeUXj4SIJeyD?=
 =?us-ascii?Q?Y7vLY2UsWumB9/veocs2PTodYuChql1+vTeihgHkrHJuUg+0sDGH6KP3jg60?=
 =?us-ascii?Q?W8RpeZm1xi0+gXXgzbp2zdaJALXDvJpm+PKPdj2gaqwaIldPis5wzTVBdn6y?=
 =?us-ascii?Q?e3mRCZTD5kvLj2nFVr5o5ak0rd26Y/FYENgFu5JEpboX6zw6ApoCRf9xLjC9?=
 =?us-ascii?Q?C35gg6ATz7NZ5pG/gbPWqS7159ZmbmfBBlxxxdHJ1Pc3DEiWEeSpaNRZmBNk?=
 =?us-ascii?Q?9yturH2OK7awQ3nP1inBvNdImFGYGGwOklLkEtVmACy5f0zT+gNZ4EPkt50o?=
 =?us-ascii?Q?x2DVjS8Y4dL5I6rNJnkz9GA5ZhFndGarxXGpWJmP1ko6//dI9BJPpaSvERAA?=
 =?us-ascii?Q?qidebb5AFBt7IJi/sCJUApShfpk4WOPPPf1oEDa/WD5CzrRd0AZKCmfCw3TJ?=
 =?us-ascii?Q?8DmoahafFzyhV00mNraGkGjdQ/xB9JHqbDfgHDopYeTLXSYD9zop/QEsSnv4?=
 =?us-ascii?Q?9/tp3ynGVR3HrSHmlqBfo2Su62J7kpcGRjryhwvY5mbRL7MzoUYMA6UjDpgq?=
 =?us-ascii?Q?Bt+ufdC6xwIztGZVPECuDyQtiHrXn4D8qJbCTR67xyb7eG93cK4mg3DW070F?=
 =?us-ascii?Q?pcxkwwL2wU+J+Y7qt/kwIb+OZjlqmP5TLBl0nZDtmt9VSHmdvEDF2+DX0ytO?=
 =?us-ascii?Q?27eaOAD/m9q8adBVRXu3YLE5aBNvP+DwXopVyMILvGSl0lHq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PogBoS3RH2tqo4uWX0ieSjrPcme2rHZd9WIrebl9891tNUvMgYHLWqy1nlSSJytiT/ldSpXJOGkcZOArU5rYVUE1vzh7PjbpCE4j+rltx1BSIDRUaIr+VBXbsDkny9fHXfX7UOBeDtAPqz/wHEqhX4K8Nw0nZ6cWH7EU95t/8+I3AYjtLck6lveW2bSzbbLl2SMjp3d2zIseDdrhMJbshksr7Em4f7k+4pm5uL1WJFJbzoNnfglE9Avx+ayuoEnJOXxa1txBBOr62G2CV95BL2ntFRwGRWfaMm6FK5dJ28IcBT7+RylvSjGK52end0Mj2UgTepPmqUMi59nhwwHERQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cebc2c-d6c1-485e-6e7d-08dec6ac7a7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 04:55:22.4649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFpSTNZ6frBdAC1jcfJ1mI0xtiNFsXswEMN0DIYvrGz1kR68y9b9GoS8SnI04DtlcwWigVekSZAhWo0SJpua2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7183
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mohamm=
ed
> Thasleem
> Sent: Friday, June 5, 2026 12:33 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH v3 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
> validation test
>=20
> This test validates display engine entry to DC5 state while PSR is active=
, performs
> suspend/resume cycle, and verifies DC5 entry is restored after resume.
>=20
> v2: Update test description and psr cleanup. (Jeevan)
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 249d9e11a..b97cac7fb 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -80,6 +80,9 @@
>   *
>   * SUBTEST: dc5-dpms-suspend-resume
>   * Description: This test validates DC5 state entry before and after a
> suspend/resume cycle using DPMS
> + *
> + * SUBTEST: dc5-psr-suspend-resume
> + * Description: This test validates DC5 state entry while PSR is active
> + before and after a suspend/resume cycle
>   */
>=20
>  #define PWR_DOMAIN_INFO "i915_power_domain_info"
> @@ -632,6 +635,13 @@ static void test_dc5_dpms_suspend_resume(data_t
> *data, int dc_flag)
>  	test_dc_state_dpms(data, dc_flag);
>  }
>=20
> +static void test_dc5_psr_suspend_resume(data_t *data, int dc_flag) {
> +	test_dc_state_psr(data, dc_flag);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
> +	test_dc_state_psr(data, dc_flag);
> +}
Info like first patch is needed here also with that Patch LGTM.=20
Reviewed-by: Jeevan B <jeevan.b@intel.com>
> +
>  static void kms_poll_state_restore(int sig)  {
>  	int sysfs_fd;
> @@ -758,6 +768,17 @@ int igt_main()
>  	igt_subtest("dc5-dpms-suspend-resume")
>  		test_dc5_dpms_suspend_resume(&data,
> IGT_INTEL_CHECK_DC5);
>=20
> +	igt_describe("This test validates DC5 state entry while PSR is active "
> +		     "before and after a suspend/resume cycle");
> +	igt_subtest("dc5-psr-suspend-resume") {
> +		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +					     PSR_MODE_1, NULL));
> +		data.op_psr_mode =3D PSR_MODE_1;
> +		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode,
> NULL);
> +		test_dc5_psr_suspend_resume(&data, IGT_INTEL_CHECK_DC5);
> +		psr_disable(data.drm_fd, data.debugfs_fd, NULL);
> +	}
> +
>  	igt_fixture() {
>  		free(data.debugfs_dump);
>  		close(data.debugfs_fd);
> --
> 2.43.0

