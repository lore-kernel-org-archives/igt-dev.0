Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5BB1049527
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 10:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEAF10E07C;
	Wed, 11 Mar 2026 10:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMAxEk+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527F310E07C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 10:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773224259; x=1804760259;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i8T08cYkQFSEb0xaEGbsTKukBDvopzIQ8r90Xwn2iMQ=;
 b=UMAxEk+eAn6ERvQDt2JHUMYH1Q1n9uTLpH8iu85CNpvt0YpDR0R5VwBw
 KfO1SsEufUk1oNW6mka2Uoc6/A43YAKlTTv6nMSPkGcPLpbb3O7y6T5ej
 xQWJ6ctOuDorLSywoUUHOML9tDODvTxpIfEnCZ6HyWiFNdudr3j02I8s1
 19chG3SoBrIJF26eQjTEcsclT3jr7HuWu7FmPY90agYc6a8hMVbePl9Op
 Pb0yg965DQ04OxLFjW+o/Q20Qj5qkOmw1Jw1zdfxAsQv4tp8FchwY7YxA
 WRXCd7kapFItkSJhmtCwVuxvBoRIAwZzMYvq5ZlzICD4RuLAft7E3KbWq g==;
X-CSE-ConnectionGUID: C76s6R/0SjCi58LoIYvOQA==
X-CSE-MsgGUID: ArLAT2rGQK6mp/DJsO6lRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74198437"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74198437"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 03:17:38 -0700
X-CSE-ConnectionGUID: 6CjsBRUtTd2YVnbrPD0YBg==
X-CSE-MsgGUID: EFk/qnP+S1icLJIQT6OH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="246014185"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 03:17:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 03:17:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 03:17:37 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 03:17:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1BecRjzFdqwSOjJBt0t+O+fPjozOa005elvPnQUI9PuVHIk7qXiG0ToL436w8MsYqlRQ89g7RuAUrnAq9Wa0Fq59lyThUo+ngrg26J7RfzRea73dnbPHOAppNPUncDPp3FTjGmzhkr74jw6/+wGUxTj6c3wIGm0OFVxxL4ExJmQAB2Ahko7cqAwbWboG45OynxHd+vAV73WlXuSKGACFyso/6k+7voVrSkt/QL+AtjGefNcejdWtJo/USs127xwKbsxdJ57SCfeEiCRWfkCSJ9n5qHkkPCB2N07sl/ZpCdbVb0AIL/+Agh8qRfpYZN4U6Q96684IWDxnsgChDWLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7UVh05UdM7b8Z0IAMF9yPikutFz8g6/5JEgTvLZlik=;
 b=Cz6mq4T+dvwsfYKpib844XsTX95Pa9kakVfEYJCyAbPgLA9/KVhUmzG97x9ppEbdFIwa6bZG/G2pMWVw1rlNg6GxO8TD/b8+dJ0ClfvL+9bLNq3A0JuKbGggQNjNA84v5VxFDH3Unb/J8NudpYOAxOtppI1lUzTyqL3gOvTjneh2T4fbbXO4z53sgb+oqiWwO4HqY6zaAKv+8mNlXcAigA+6LnX0Liu+/SQ1M1GxP8x7T9tnSGLpew89Hua3lAjMbP3g41j6geQ+AMdMV5tPoFiQWMbZmvN704QxgDTnLY7R9vnpiy9j7iL5VmebYt8A4+JFym3/iZeJVDjn9uAzhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Wed, 11 Mar 2026 10:17:35 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 10:17:34 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH v2 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
 validation test
Thread-Topic: [PATCH v2 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
 validation test
Thread-Index: AQHci8zFhLcK0fgjl0yCVs+SaZySBLWpZ+JA
Date: Wed, 11 Mar 2026 10:17:34 +0000
Message-ID: <DM4PR11MB631276FB17A19D483C20ACCD9047A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260122182219.9635-1-mohammed.thasleem@intel.com>
 <20260122182219.9635-3-mohammed.thasleem@intel.com>
In-Reply-To: <20260122182219.9635-3-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB8206:EE_
x-ms-office365-filtering-correlation-id: d4f31f1e-cf7c-4f5a-a94f-08de7f5769af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003|7053199007;
x-microsoft-antispam-message-info: dE8ZeNqOlm4cpc/bbZD04NzV9hE94HSfCszTkvlB2hGUaN4vHUY91778/wPLx+68kQfxNq/2e1XKAkJyFkVsrDTHDBI++ntEbrjhhyl5o/q4WK18bnbdyTj/FCAuZqYddvTQeN02I8jzmOMXCYH0xCQns0c7lXAb4AKdi5gGft+3aywhzUohbUQqU5z+rpJx0m2xGzbRjecNwHlivSVBMfAbdcbIsFxLO90M1fEodGDD/xUu86nOw7RStd7httHq3qZcpKWvnl8/fCbNmf+tNNbp671RrEJ5gMWMHRPvEDXd9Ysvwh0OeK+U6jaJsVrd4+UMTiHNhygKLr5SSAzSbzeov/e5DrizgqJkb28Y7Mof89e+AhdbT9u48qagsej71PbkFi5eS02uSO7xW6vXz6XKr6vYjHcqXpIU0JRO1sbQsroAvpZZeMB5qbaDjfsAjQpZBRrbqkuDCdRrdPexjmXmr8yLRknn7pv6I1BTf0EhMF3aMKcUE/7+Hxr+1arSvr6NGODYrxbrofd/l5XssjkziUWVgIE/niPcLi9rPP2jfxb9OmCFTo5f6yq9pnXRSTq98Xv2xsg86WxbAkZbt9YvhHu5LOMfZ+NeREycP3sQUFsCulCEkoWlWI1BVDGKDXtIo/tvoIH6mIEjhh3lHjXn1CDSFZhTGWr/R74c5MnAYb7FQ+E5Lsc0cZtvm77OQLGxUREOiZY7J9X44K/7dohMWf4gJA0RMBNplN616Q9CgTv38SAtESYc3IHUkTXqJkEH2kgCWvQ1jv6vyuglnpmd9h2CVezu1XMaYr76fqw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2Uvhux4flZQvmWgOrwCfORwv/EAvF20PBGOYxjskSvV5KbzVoFOTIu6mMcNq?=
 =?us-ascii?Q?LtZz3K2ikvkDMeXudmddAUMewcnkwQQpa9mhAYtu+/cgbe/lupF2byInsIqq?=
 =?us-ascii?Q?0GrUFKPkjY836gAxw/eILkgEKaunGOUlyoaYExeOrFMNXE3dAf+BKH6BofnZ?=
 =?us-ascii?Q?Im5+l3sAXKVBKkElMJvXKEcYZ0r+QIuoqmR4R77XC1jHCMBlmfzozbSXZmvN?=
 =?us-ascii?Q?lW0vn0SSKauXxu0KjnhYOb1+FE8Cr9/GvsXYRHFPuZF7aAGs90rNvvM9A1PB?=
 =?us-ascii?Q?Um0v4/wcUiqWiHUpegJO8N8bw57VAjL9YDQSpmom/0iUgDJw2JiX2emkBqoV?=
 =?us-ascii?Q?XkJ+drXN9HB+GK0ccdI2319UCSpeKtDKCcRziQFi+9ZY6QDarz0xE6P1KMVT?=
 =?us-ascii?Q?IQAoXyP/o+QM7kdzwXCnwpKb0E9Iwc2gHpwx4eeQSCu7bw2wgrUJ0W1CnTq5?=
 =?us-ascii?Q?WuzfdcbUPXQNQGG/kj75s6+noakb+8iEfH1K3UPLpkhsVC+qSt71x6Wh0OSt?=
 =?us-ascii?Q?M4LwUH89rqco1SAksouuBwE/GtHQ7D93C5YijG/S4oP5PzIDLwG4aKSFJyaW?=
 =?us-ascii?Q?7rjSza6gKo0UKLi0F8rG+RN6Qvpe55OwfEQJryDJjVVssHB+DJ9bvHLv9zjv?=
 =?us-ascii?Q?ihnB1gScCH0BmdHITc0CsvcLvCQ1CTI2s/emF+tI/RQUJoCddlIbkcJFwxup?=
 =?us-ascii?Q?h0FowuUmXavfjKO9ej1U4GGgevweqgMaXTmeDHutlOlAMhjDU9fwx19+H6BL?=
 =?us-ascii?Q?aOMtPnPZ2j2S/IC3QxD9GA/dFA50PoiMR1LeedQKJ4GkQZj3MBQAXCOhAgXv?=
 =?us-ascii?Q?17N0ufIZcd+Ipemrdy0B5aJ9e/xJypD+OGl35Jn8unGV5E6qHwRzvCt4Kyzr?=
 =?us-ascii?Q?T0uPzFoxahjZ8SrnIi5XUykBeXvwyziyq9Q3Lnepie/yQtUtpmkdq2leuar7?=
 =?us-ascii?Q?cOIOnsOO7RVg4FEJPOvVOxMMAGW0WK4mOtrUocfdIR7XFcKvScxvRtKcnLgU?=
 =?us-ascii?Q?CU0VfRJSop4srBsVcN9CsklAgPxr9vr3ev+dPcA/mXPcvED/Nwh2x3CJoZd/?=
 =?us-ascii?Q?1Wwt70Ko1gplkKBzT3Zazq3vMFHXZMfPPdidXX4VN9OAvmdRSYd9zcEytLue?=
 =?us-ascii?Q?Dt+QjqPgMrzrizGPjn3HvmuoqdVOZc0QhkAK6uqs5MKdKQ/xPdLBUkOSJ8vu?=
 =?us-ascii?Q?zHMtk5nrjUTpr2VEYkRTARU8LhFY3Sty01263XcYEceIsMAITpXq95Jc4OX0?=
 =?us-ascii?Q?WdJ4es0GCMoMctZHMcAplzUgyurxwbmNVpoy7UoVoYZ2uo9eT48o+n/4TTJn?=
 =?us-ascii?Q?Ot8VJv6wQNEVdzjiVP60hENyvw57fkwUIq9TNvOWy8KN52I3wNPHd3nQPIB2?=
 =?us-ascii?Q?s9hTSmb7C0xyVnSNzdm2q2FOAAaV8Zglgr2nVmCednhnx18FJIGBYHbkTzEP?=
 =?us-ascii?Q?RGRhnWoEv9FzI8vFp08tNhzdbmzko9DRImbLzrli1VVqTS93H85YhQFNIVkw?=
 =?us-ascii?Q?3zeaXutzTsNfb0sV1ZYgeATK8iBjDu1CdKNOoDV/0wGMmGAkiD7I8XDv76qA?=
 =?us-ascii?Q?4tHmwmJbOqHchaAXZHw+Fx8sqP6yMjkLFquh20DXU7dZDcVc6MnnaXR+/4nH?=
 =?us-ascii?Q?tmDlZJp/sn3JnZ/UcVkX2oOpj4Za9aO01lTbAx21eXeAjyEClXG63BUjVqgI?=
 =?us-ascii?Q?nJ+fr3fns/NziUAMhrJemnV/RpS4Piw4d5r3efNxulx5NPSA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hRemh5SaeSiiFeUtCFddx6xqzAgN0Rx0IkY9H0W5zaBBrQejhRVnydYidnfw/44hlRSgoGnwlYlX//Y0b+WJkKihfg9ph+HRZwNqE81iQAJCIQ8s2O8JyUDbnaCBWL490YFykKB+keZwtM214NDpmajtKGmz0n+M7qcBiFAezee1UTHqhzAM13GW29EzoqamFZ9nn0MWx68AaJ+FVB4/PQSnnqu6DYXYp7KpS73nxBWkOWKmP0o9HkWwW48SNPrFG+Efwq1ogUZR6h7z/lT4XWmQscY2zhGvELxArZK/i8uNWqUFNAqlFWsAv8ztIjd0pk0+Eks+8yA3u+GVTb08QQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f31f1e-cf7c-4f5a-a94f-08de7f5769af
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 10:17:34.4130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dXC5izQOmxzfY3G83D6khRmnq36mkvcpkrpCcuWhMCk0HCew/Gys8Z5IvHrMBDXo9Cii5/h+LQ+PmZz7W8qdlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
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
> Sent: Thursday, January 22, 2026 11:52 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH v2 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
> validation test
>=20
> This test validates display engine entry to DC5 state while PSR is active=
, performs
> suspend/resume cycle, and verifies DC5 entry is restored after resume.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> fde16ebf7..8cdbfad9f 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -80,6 +80,10 @@
>   *
>   * SUBTEST: dc5-dpms-suspend-resume
>   * Description: This test validate DC5 state entry before and after
> suspend/resume cycle using DPMS
> + *
> + * SUBTEST: dc5-psr-suspend-resume
> + * Description: This test validates display engine entry to DC5 state wh=
ile PSR is
> active
> + *               before and after respend/resume cycle
>   */
>=20
>  /* DC State Flags */
> @@ -732,6 +736,13 @@ static void test_dc5_dpms_suspend_resume(data_t
> *data, int dc_flag)
>=20
>  }
>=20
> +static void test_dc5_psr_suspend_resume(data_t *data, int dc_flag) {
> +	test_dc_state_psr(data, dc_flag);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
> +	test_dc_state_psr(data, dc_flag);
> +}
> +
>  static void kms_poll_state_restore(int sig)  {
>  	int sysfs_fd;
> @@ -857,6 +868,16 @@ int igt_main()
>  	igt_subtest("dc5-dpms-suspend-resume")
>  		test_dc5_dpms_suspend_resume(&data, CHECK_DC5);
>=20
> +	igt_describe("This test validates display engine entry to DC5 state "
> +		     "while PSR is active before and after suspend/resume cycle");
> +	igt_subtest("dc5-psr-suspend-resume") {
> +		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +					     PSR_MODE_1, NULL));
> +		data.op_psr_mode =3D PSR_MODE_1;
> +		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode,
> NULL);
> +		test_dc5_psr_suspend_resume(&data, CHECK_DC5);
> +	}
> +
This test currently validates the DC counter by comparing the value before =
PSR entry and after waiting for PSR to enter.
If we want to include suspend/resume validation as part of this test, shoul=
dn't the flow be:

1. Read the DC counter.
2. Perform suspend/resume.
3. Wait for PSR entry again.
4. Read the DC counter after resume.
5. Validate the counter using `check_dc_counter()`.

This would ensure that the DC state entry is also validated after the suspe=
nd/resume cycle.
Same goes for patch 1 also.=20

Thanks=20
Jeevan B
>  	igt_fixture() {
>  		free(data.debugfs_dump);
>  		close(data.debugfs_fd);
> --
> 2.25.1

