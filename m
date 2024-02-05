Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32611C48291
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 07:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B20112407;
	Mon,  5 Feb 2024 07:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BG6BDOs5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5373D11240A
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2024 07:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707119908; x=1738655908;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qJMSVxUVNICEBxtiFtgs/hsFTX0hZv3nldQTH4BNyiw=;
 b=BG6BDOs5dIBGywqjIV/qg1QPqg48QWcs09cjzTBKZnmTP8Fvqg9wdmwN
 ugVa90O7auRn5OO9afEojVOkjuazM8izvR3seOTYWparbfEBQQw6VWuf5
 9VSdYNixaSkOq3hBybRN8Iknv3adJs6Xs152K6GQS/dVNdJBeQy9+7Lf+
 2QwxUMncBsbCaoBpAHkAYY+26Y+v1YA4u+sK4uoDNHy8A0fcasBGJR0FA
 kEyvsrxd6pLp8IHyktDST2S7h+qpqnR/5O4SrydKPqjIUc6+CJFnm2iyC
 FQIrLVrFmvg1T0xvQyCQViX33Vhq2J5rUeuPMS8ucwAIE48UoRGXU4tpH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="22951197"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208";a="22951197"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2024 23:58:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="947514"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2024 23:58:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 23:58:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 23:58:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 4 Feb 2024 23:58:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 4 Feb 2024 23:58:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7sF2TC/qUi/7dkfnOKeh5l9orHU7T9fEzB+OX1ijgWvBw2V0o2hwm4lvaXoceCVwusZ5IS+t/ujf51kZdmWB/wjThDyWmUQklfkQtXUDC0pcSf78zpC1jxDzy2l2BwT01U5BnsNp9XufV8Ycsx5w7ckBFjtRpZ3LYKtx/C5kPEARwfNa7SJuQfvz+Vqhgf7d9wVeO6X+xP6prJUttLReN10JaBOhS1FKuVBqdle/UZkT+FwAGcDIi5Byz6obt/dwWBAmUhQKdb/9hfCp7gWhQ53qP6z1d3STj1cgEuMFb95h/Iyf6HOTbUZiTkNPVLJePBlHPBk3tlkh7Ok3N+3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lg6S8VIPtfW3QyUGBqXwlO8qHdXsX9/SIQcguCzoJtg=;
 b=a/yZtJ6OnaG5ejtDtJPsnegTycYiws5Of0crLKwOKoQdKOrsjuL2y6PLBwW8hADPGTTemt9jbuPaOp6pefP3JDdF1BamK1UerGyQ8Bw6HAOexRliI6iO5C/FrSZACFkZ+WJbtigMJujKg0Co4ku5LGUE1IRAPMbz/Nx/oAY4qGDhC4M4M0amuVYPW26f+9b1hbPpsqaxKnKAnDpFEoJM2a5e4+iAL61G1xQjZZhKjExnfghCMmFjzOX4Yenkh7g07V5+Rzm7i6y4TsSaSr+iJtZsMlMT3WWZpeA9hOI3EZUXLs/DE5x2XHk5AbgBI5k3d7BCs0dVXkFPBUfXzj0/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SN7PR11MB7537.namprd11.prod.outlook.com (2603:10b6:806:348::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 07:58:23 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553%5]) with mapi id 15.20.7249.035; Mon, 5 Feb 2024
 07:58:23 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/kms_feature_discovery: make display test
 dynamic
Thread-Topic: [PATCH i-g-t 1/2] tests/kms_feature_discovery: make display test
 dynamic
Thread-Index: AQHaUz01KgUMLBu2r0++Vx4diRKmXrD7a2qQ
Date: Mon, 5 Feb 2024 07:58:23 +0000
Message-ID: <DM4PR11MB63129C4E3073DE4E9663544590472@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240130053756.1478286-1-kunal1.joshi@intel.com>
 <20240130053756.1478286-2-kunal1.joshi@intel.com>
In-Reply-To: <20240130053756.1478286-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SN7PR11MB7537:EE_
x-ms-office365-filtering-correlation-id: 69284ca5-37b5-4748-2730-08dc262039e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5uBb6FqzrLTSDvRCqRhPqUoHAeNFX4EbUXy/ML6+fIfTeJS+S/OPI4k8SVN5UObJZlLPA3me2MnrDRkquFP4SaFwzD8TLOGIoCtyTicdSGNGwigHXkXtan8Ga80OcB07bcM0SCCaULRiTFRHzv7MqtJ4e9DGSuENGrjxTeCnziBCj3AX/+On4ORZFgopHD+1zfYIxuZBzs+IBBnpsnrdbqCfWepHwdoS1sU7AlB3QNX395ovxTJokHeBr2og1z+68rY02PTrHkl2rrI3OlIizNA52ABwYtX05cKwKoifmraZnntyvcDOOxNGfeSvuiVqOdCwQUw+Ebd5Yym3QLqLnuIYUMyqZvic3Rbd+VEMAeu9Z7vXe3EYGQ5nrhPdyuq+xrYAE/vR2zna6BPLPhZYXaV0cQwmnVfZqZ+T3dTZktUM2N+VbBv4y2tCaeKWWR/kcjwcPw0Vq9kg2QxkkYENm+qh83eMgBAovAEURFeIcJonrF+Vnr/uqEzyJe+vCL4k4CPwT1lEuLdTEsY+r4lLBNe401Vff/yRP0G5cSDuPOy2VLD3RhzAzX8JwiIVIqpDszF2Ne4oC2mIJVjr85WgoYQzJcwA9EoF3DoALkObLsRZjdEgIVkQv/04gcoYEoxr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(86362001)(33656002)(55016003)(26005)(71200400001)(5660300002)(2906002)(9686003)(53546011)(7696005)(6506007)(107886003)(41300700001)(38070700009)(83380400001)(66476007)(76116006)(64756008)(66446008)(66556008)(478600001)(52536014)(110136005)(8676002)(316002)(66946007)(82960400001)(38100700002)(4326008)(8936002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z5UsWrl7zCKB3kn7dqe/rDpn1lbxT7Wfg/EvlWtZDEVDKpiEDa7zYcQdvA4v?=
 =?us-ascii?Q?T2Nss1uI6UToNNtwKwjYlsNo2NLjUe0uRrgqXNKVal8nqHPyum5uDS7Qvw8W?=
 =?us-ascii?Q?ti+Vu8O+nr3dhnKe52TpB56dCxQ6JO/AIhXIAFBBbh3mdtiJuRQpvlzt+15J?=
 =?us-ascii?Q?aEHccdqCFT77P+lcwlVbblt9F4w2XjFmh4ko6gBreFltQTls74hY4e54FFtZ?=
 =?us-ascii?Q?74343e/jGhond0Frh+/mrAsGBFypMHsSaSCsPewN3m5wiHwdCEW9AIyVP/v2?=
 =?us-ascii?Q?W+ik73bgIjZBm6iV0iBeSAE3TWWSkigrdOmzbDxZ7bw0MV4awTPvCvDTCo7z?=
 =?us-ascii?Q?ZV8nqFhDzTZf1V04DfApKte3Ac7u4pZqct2W1B26Gnk5uGiPD7tEDEbzAOS9?=
 =?us-ascii?Q?qnLa2uR8tzo7jK0Uh1ZbubbYVe2f0/oooGdDz0CIpy7TlnL9yJVVfCbgZVtr?=
 =?us-ascii?Q?+mDw59PcldN6rSsNyu1EmUf3lG2BFWaaEfaM6rSB+ZTGcXDZRE+6smlJ6URn?=
 =?us-ascii?Q?kT1jawwL+liAXdJY4zphpeDIm+JadoU8ZGD3FGAuyd3Gs6NkUQrH/dOZ4OJW?=
 =?us-ascii?Q?XZ9ZVX/LMz7u4Ot8wVfqBTkYKzhnJSfTD5sHsoyHixD08T4BVIuAZ8wMutzL?=
 =?us-ascii?Q?6CiclBw9DMZm73fP09c1okY7Kwf/FYXqu/w3T8ydxVQcaKJbgY5ItRimqiD5?=
 =?us-ascii?Q?OdJtJaqiNxCKUDBBBL0kti78He7TTpMH+giFaugXlGoL2JO5ZV8rd2CmPohu?=
 =?us-ascii?Q?e4om+DkmeiiMjm9KaYi4HeGEUrki/fFOfRSZct1pKOdKocdzviVDo2cfNHVx?=
 =?us-ascii?Q?jVbcBOaJN8LPkHn35yoWBk48ov2+WcerRLCQMsLcpsGITYnFL45TDucQnt0C?=
 =?us-ascii?Q?SfoXBRYHgFBYjlfL/yLqyRcWjZw3Mr2TTugQYck3mwwSGaZXTtPuNHwcMxk8?=
 =?us-ascii?Q?heKyhv/1yl7II4yiYG1055V8VDUseOTz0pDDZqRveYkr3WT7LodT6yg9TBBP?=
 =?us-ascii?Q?ZtZEIYx12kGsJ8m6gapNbaZ3PpMqXUZSQHh58v+mWW3aeahO3wejkGrayQ9U?=
 =?us-ascii?Q?m/J3zGK+5oqSRKxwKk8ssLQB8kIh9eTvww1osZoFdNVBQzF8magTEVzV9NSa?=
 =?us-ascii?Q?4uP3E23bBicTatqURbDRXyygR4PEqyZf/laLvSYBvTi2tj3sv7a9rL8sa6pK?=
 =?us-ascii?Q?fS0PJlWSfQOdt6QBAqCpiHQyDEMzZVao+4pf3JO+9EIQ3eA675F42lFuUwh4?=
 =?us-ascii?Q?44PoP692e19QFVIARMo/SmtGHhaUjaoDcwrMHf5bndNl9o5f9UYTEjFtmYS+?=
 =?us-ascii?Q?h7SJ/yUOQ74N56hjL8NTZC+Wm8ns7LLnUWl7qOgl6y8CJW5kgz3AMPnlRFa7?=
 =?us-ascii?Q?7VfihYZQEKp22AlMFE/KmMQnt6SO+2zqwfwI5q6KJsoMZDZw9LntK4DuGYVv?=
 =?us-ascii?Q?nv1M1VulXkKcnTiuN3d3SbHG+0Hef3970xOcddMNepN+fTHrqFU7ks/Juk6q?=
 =?us-ascii?Q?nAFMK3ygPNUaAR98PBf77RcVsfDBkD+raUKH40ut2I4GNUwHcPFNC0Vqozsz?=
 =?us-ascii?Q?TrF8sB57TqV3gF8wnLM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69284ca5-37b5-4748-2730-08dc262039e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 07:58:23.1280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxdUyAzJPOIEwCSp7KBv1xFLJKhB79pOglPU57HpqIqA2MOlwp9aGckFrR1O2lhIobuoXOFpI2uleRsjhcvNfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7537
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

LGTM=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Tuesday, January 30, 2024 11:08 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/kms_feature_discovery: make display test
> dynamic
>=20
> currently kms_feature_discovery@display checks for number of display from=
 1
> to 4, make it dynamic to check from 1 to n also reducing unwanted skips.
>=20
> anyone who needs to check number of displays for a particular config can
> check kms_feature_discovery@display test result.
>=20
> v2: skip if 0 outputs
>     test name fix
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_feature_discovery.c | 36 +++++++----------------------------
>  1 file changed, 7 insertions(+), 29 deletions(-)
>=20
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.=
c
> index 5bca9ad76..2dd4efea4 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -47,10 +47,6 @@
>   * SUBTEST: display
>   * Description: Make sure that we have display support.
>   *
> - * SUBTEST: display-%dx
> - * Description: Make sure that we have display support with %arg[1]
> - * 		outputs connected.
> - *
>   * SUBTEST: chamelium
>   * Description: Make sure that Chamelium is configured and reachable.
>   * Functionality: feature_discovery, chamelium @@ -69,8 +65,6 @@
>   * Description: Make sure that we have DP-MST configuration.
>   * Functionality: feature_discovery, mst
>   * Test category: functionality test
> - *
> - * arg[1].values: 1, 2, 3, 4
>   */
>=20
>  static igt_display_t display;
> @@ -92,11 +86,6 @@ igt_main {
>  			igt_display_require(&display, fd);
>  		}
>=20
> -		igt_describe("Make sure that we have display support.");
> -		igt_subtest("display") {
> -			/* will skip because of the fixture */
> -		}
> -
>  		igt_subtest_group {
>  			volatile int output_count =3D 0;
>  			igt_output_t *output;
> @@ -117,26 +106,15 @@ igt_main {
>  				for (int i =3D 0; i < display.n_outputs; i++) {
>=20
> 	igt_output_set_pipe(&display.outputs[i], PIPE_NONE);
>  				}
> +				igt_require_f(output_count >=3D 0, "No
> display's connected\n");
>  			}
>=20
> -			igt_describe("Make sure that we can use at least 1
> output at the same time.");
> -			igt_subtest("display-1x") {
> -				igt_require(output_count >=3D 1);
> -			}
> -
> -			igt_describe("Make sure that we can use at least 2
> outputs at the same time.");
> -			igt_subtest("display-2x") {
> -				igt_require(output_count >=3D 2);
> -			}
> -
> -			igt_describe("Make sure that we can use at least 3
> outputs at the same time.");
> -			igt_subtest("display-3x") {
> -				igt_require(output_count >=3D 3);
> -			}
> -
> -			igt_describe("Make sure that we can use at least 4
> outputs at the same time.");
> -			igt_subtest("display-4x") {
> -				igt_require(output_count >=3D 4);
> +			igt_describe("Make sure that we can use at least n
> output at the same time.");
> +			igt_subtest_with_dynamic("display") {
> +				int i;
> +				for(i =3D 1; i <=3D output_count; i++)
> +					igt_dynamic_f("%dx", i)
> +						igt_require(output_count >=3D
> i);
>  			}
>  		}
>=20
> --
> 2.25.1

