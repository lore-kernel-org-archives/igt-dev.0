Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5BECD8C9F
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 10:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C49410F14D;
	Mon,  8 Jun 2026 10:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZaWOU/t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA32B10F15B
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780914859; x=1812450859;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Pnqx0qbXFr4OkH85oCTNfoYBmBKumNPKBy4Cu8mR0VE=;
 b=SZaWOU/tlP36tUEbJ2lRGmBFO5bFVl+hNm+3Au2bripCwFtbVW45hCPA
 y4HNPJQS3A8s5pqte12aDtkCgS58NuDPWCVmy8a+kBh9CZghZErkgI0v0
 NEUrExyoTepPIzuKqST69zpkvzQAFjc/57HBzIRZT5RcxLDTt7WKl0Mq5
 DBi3Kg+alqwFFeQb8kGzPh9/6via1GtrllvvIOJbK8BtU/3J6Gtp7YSxe
 7ndKFPzvlmyldFmsTYbeSeO42htoyH+tPqGnAgq1Nlb1JDRQPLS5EAkZX
 GAyGAkgA2yYcRXLsbrUrITlbSGtCR2RZlP5RxzYd76hGt4KweHliMebmf w==;
X-CSE-ConnectionGUID: +716/ObPRiidDSa7VBahXQ==
X-CSE-MsgGUID: Ch5Uf9fBTUW2FiJXWohQ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85500093"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85500093"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 03:34:18 -0700
X-CSE-ConnectionGUID: odh246COSKeQmLj2kifJQA==
X-CSE-MsgGUID: QAA0UgIRSMq71vQ/DgBB3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="249815668"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 03:34:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 03:34:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 03:34:17 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 03:34:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fdf+x837x0lc+pFYn7mf/Dmo7Q+JZJJHrwLUbwRDDogLHinDGVJHuCX8lQRMPsgp6LLtrGhowkEniHzUqDV2k3l1LQRVBjv/PQ4HSLgL+6UGIeIk9BvoFNRMDsIFlgoGnXeL91WYfUKr5gf3oBC6oHED1OLBtbaH4L0BUDc63AXKTAr/HRb+nhFDmd8crZSyRJnWEwABxBpJuqgThkqa3TJRbrpyP+O0J8mfGJGGIacMCPV4iS03579NyDHRPCALo9VkG+2359qF2C+A08yh1hhZcl/Dhr0m804df55kUjS4+zQwW+K1MmeRLKupYgQspo05p62bjvNvt0Uww2V3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BnUKlJ1ZMTe0qG8NyMg1L/AmHozOojnIXFBfVkgaoE=;
 b=vhmmK9WbA/TpuUvdVPnMJNSHmoEwS2o6wrakLGctfX+X1uRVO3dRmjO+RL7id55mU15lgpDBNTKGCfwoCY1WJEEGtVg+kWd38N66RYYC2vEMoeOdDpvWfOtnq1FZhFrDP4k4wP67koZfhGCNLhQ1cLog+hXppNtetWEBbciQljmPFXwcqzNJyduoMolkWnaN0Ve3YhL68TlTWdsD73jq97R5h3JLGmAp7IAsNCP61bna1bUQlDvR62K2C7uU/9pm9wi0Fqzau2tIM/AtPL/PTG1/9sM4ODOziPOrS7eGxZtQxGE4ow+/xlRGG4p4w1owdz6DvsuxDlCabTA0w1znQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH0PR11MB9776.namprd11.prod.outlook.com (2603:10b6:510:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 10:34:15 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 10:34:15 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_dc: Add DC5 negative test for
 continuous page-flip activity
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_dc: Add DC5 negative test for
 continuous page-flip activity
Thread-Index: AQHctTZGSOQjtq0Z/k+FAERM0xaaIrY0xuSAgAAzMJA=
Date: Mon, 8 Jun 2026 10:34:15 +0000
Message-ID: <DM4PR11MB6360BADB8939D75F5550A556F41C2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260316111517.24452-1-mohammed.thasleem@intel.com>
 <20260608073019.9011-1-mohammed.thasleem@intel.com>
In-Reply-To: <20260608073019.9011-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH0PR11MB9776:EE_
x-ms-office365-filtering-correlation-id: 5f9c5d2d-621c-479a-375b-08dec5497d15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|11063799006|56012099006|4143699003|3023799007|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: J3sEZBstZzalilqsahAMv4OuFbklLlrlOzd5TDkBA3SEu6PAIKs3fC4oIodnL9/VCfxxHtTpopBU1O8hnvAZRycV8Uet+nlQt21wy//xmM2EZblErPoEKHG94CJhkm9WG4MASXYiLUmXOIUWEHQdoI969rrem7IaPh7QmU6HFcWkDY/xvWCBBsEGzeMie6giUIXLggSA8L5ttcsyr8fOi3rT2JKkOCcZUWrmY+lJ1yzXMn3jl8Z+VTGVLTmKSfy88iMJKJoKqHILENfKdEyRPja/RHAGn4ceuuOvsv4X47ltIou8WkqlQYTjliJDnrcE6GorXB0yGjFZZ1l/X8MayzVb0J83WfPqrQCZIX8H0m3KYIxxFFPaG5d8NMavddqAxxUOsWdiFGylE4AcfF1BLy4iUw56b/K324V1very04oebbWt7szfENo6g3oQRka3a2WUy28ZE9eI3/AlY913kBLZN7CKzWpq9DR6ZH8wsYdsildAIOcOz3HY84XOFcsjnwJbTNmUEnPy6tgPwQdPJPoZdy1swsknXhFhQluyrfRUq71G05wAKKJxcOWuL1wgWfaGDI7sX1B80GXfmJvv43dpG/18z9MIEPZlQeeGDUdn6mtfISxXx81YjLP0otGcHXWeRMGxKUh15hKX8TWMc5i03X9yXIlGl5cmNFjdMj0K4Of1jP+74kix2dE7xD0skH49/dIpxau6ftBhj1IIcIl0QDbQ/8LGZkEuVTAG+Kg1IUZ2VdMHX24N9yxqFkaM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(11063799006)(56012099006)(4143699003)(3023799007)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xVVXC3JEh106Sno86JR9AlusaTBWegdx6IJdT/sPneSrdW/Dpr1yhuXFkAe0?=
 =?us-ascii?Q?U5rdXMOcLci+jKxKls/E+z4ACmgISpK90dVk47uhZibS96twHx+TjNjXED1K?=
 =?us-ascii?Q?fKOyMlDZ3Jn9DrJP0kqNAOoi+iSRnjPauqptW8N9uNh5jV+OiT4eeJ3s9517?=
 =?us-ascii?Q?G/MCC35EwqgqnqlxcFoxv3RElRCl9Kg1f1UrJt1fShNzMWV+LRLF/3kQLMpX?=
 =?us-ascii?Q?pS7N4b8XxhlijP0Hssgi7CVtxdirsGiV/Uxe7ekbgHbDsVfWrRp+75ROKfHj?=
 =?us-ascii?Q?1gLsPRYT4JxzzkN/0ic3HXZuc1Pz5O2XUrP0TKDxezK02ORZu3tYE3y1fHQH?=
 =?us-ascii?Q?jW6vY3VlYG60cYBs2seFJvLhij1U7E+2W1kbU6mM4p1pQx36Er+A8oJh/1ru?=
 =?us-ascii?Q?4Y86A6JP5yVj2RMKyYvmQyqUn+P5Ubt1eS3X2atnUIbARD9ZykMFP3g9NwS5?=
 =?us-ascii?Q?Ed0y65UX19hc1rNQWYmyJcPykp4TiyEKzTrNoHbdZ+Nj4KmmZfAtMh5nffuV?=
 =?us-ascii?Q?cMg66V62y+WZBWsHReRuvZxtXS6RxvzrcJ5ERFGFdgPgeau5L34OdUAu1u9y?=
 =?us-ascii?Q?J44QkBhyTmQxxDIcxMwqotk3N0XXNIG/RXtLXAVkVeXzkbxJYirOqwBCp0i0?=
 =?us-ascii?Q?B/OlWXuauRpir6+Ol7mLLSnYWvfQoGE6hbGiMCprws4lGmLooi9rO337xtdV?=
 =?us-ascii?Q?8akxrLca7hnhNcBxkdklDLyG/Y3UTiMSyI/R9BZ26C10d4RzcPZVAiFzfwwC?=
 =?us-ascii?Q?m7oevfR113RUBV2oRSF4jW/RzgHy5QBL1DqPnC0fYwimpy7mH8saOrS1GBYx?=
 =?us-ascii?Q?QGPFfoNPCUXT+PgL3wzWueDdlaf0bHE8AdAMYM1+hzvyu2eEa35/BbkFpDOB?=
 =?us-ascii?Q?76xryQVldsWsy20G4ncZYN0OzycSVOZ8U1/QZXhBUggG78cJmE0PmT6UOgN3?=
 =?us-ascii?Q?pncOXgnpi6WLQd2h40lmUqMhM/lAxp5x8T4Wz2CG5a/xZGY2lyA/hw282BYy?=
 =?us-ascii?Q?rw+qIT347sWdQz7QoAtyC5dos7Fz23+39KJJM2pCg7J2vdUylBDo/GwFwqnP?=
 =?us-ascii?Q?eWdb9lpExKbWP38WjKqGZQwfEr6Top6dc99mavIDvf09vlxNmnkd/FxYzoFu?=
 =?us-ascii?Q?OJkJ6aOCB1HjvkMwakwkbkx4P8Iu3BG0FPKIVpIDxash073nK7ZC5VYyfwyX?=
 =?us-ascii?Q?l04PCsh81oB8Dyd+DX7XSGAIGdzOMZtugpzFr+PrgFp70gXH67Y8KrTsijKu?=
 =?us-ascii?Q?j8HO+rp6mJwSC7mg6xbULty2PkmjDEmjSoG9LdXmOoN6Q7R2Dcfsi7qnTDfQ?=
 =?us-ascii?Q?oBaLGONh6dY8ceXOdGNWWuthh0tOeAWOo4XqYJdkuss1R0pWszlNi1/sMlQ+?=
 =?us-ascii?Q?n0skaKUapIL2O4J313E9nso/2/gKW7aOzC2sVnV9ifU31DHg7u17MqRZNQY4?=
 =?us-ascii?Q?rQVWGbXPvYJqG97tls0wqTcJBqlQZ1G+fPuF/OEgU0hHSz3Bh7NgHve2MkxH?=
 =?us-ascii?Q?1a4/ARDQ9TfmBLCZ0nL1A8uMU+YMy6HCjwiLSjRIcA2k0PItqc+6DlP28+Kx?=
 =?us-ascii?Q?LEfQ8Iclx3IE8T/UnJja/u1ow8HyFpG2kAVNlW4PsSo2CcLO8M9Oq3aRDF8+?=
 =?us-ascii?Q?3jnLqN16SPK+8FAiAAVuGS+CMB6gIr+Sl+FcyvIsmWHl0OTVH+foIJTmOr2t?=
 =?us-ascii?Q?OAEwNjmvzJZG4ppqacJkARz/YlevbjjMufH8Sljc/y5v8NBc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HoUrRK2+SH51ucQEgFu6PppJonaedIRsw2sgjLMl+JCdf3zJEWgFDSJ6fXxsOGBO+tihhsQA3DnXqcRTrVQGwVrJV7FCMp5Sqd8cH/SJ9bD/ZaZdh7h07zZhMZBP+sdkX/S0WwcDSyWigGOvpWL2qx+ctQXk/0AadA1XdKRB2DTq6c+JeG8eJDwgYqp9LZrEn7Y9v0Dm62JGIqVQZoFFrKGArYUhZBorhx6SfOmoJ18dScyGuI76d6OZ45B7KejjGop6r99el2lX43z9v3bXho+nJ3C3dvSlkxWSwjwi3nwGJ5r6fWxewAVGc4Mryu8xGAnOGHFIvxYZmV0WV3rZVg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9c5d2d-621c-479a-375b-08dec5497d15
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 10:34:15.4601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/+q4mBVWD21vYGuBeaNwZS4cWRFc03Szhx0TfFI99khPsiHebFQazWFfvmQRsysKPD91U5dXnopHtxHdZlZ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9776
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
> From: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Sent: Monday, June 8, 2026 1:00 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Add DC5 negative test for
> continuous page-flip activity
>=20
> This test validates that DC5 entry should not occur when the display engi=
ne is
> kept continuously busy with back-to-back page-flips. The test performs a =
tight flip
> loop for 10 seconds, alternating between two fb's with no delays between =
flips.
>=20
> It monitors the DC5 counter to ensure no state transitions occur during a=
ctive
> display operations, validating proper power management behavior.
>=20
> v2: Update test description and test name. (Uma)
>     Update test assert message and minor changes. (Uma)

Change Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 58
> +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 423a5c4a4..90df8ee37 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -77,6 +77,9 @@
>   *
>   * SUBTEST: dc5-retention-flops
>   * Description: This test validates display engine entry to DC5 state wh=
ile PSR is
> active on Pipe B
> + *
> + * SUBTEST: dc5-pageflip-negative
> + * Description: This test validates that DC5 entry should not occur
> + during continuous page-flips
>   */
>=20
>  #define PWR_DOMAIN_INFO "i915_power_domain_info"
> @@ -622,6 +625,49 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");  }
>=20
> +static void test_dc5_pageflip_negative(data_t *data, int dc_flag) {
> +	igt_plane_t *primary;
> +	uint32_t dc5_prev_counter;
> +	time_t duration =3D 10;
> +	bool flip =3D false;
> +	time_t start;
> +
> +	igt_require_dc_counter(data->debugfs_fd, dc_flag);
> +
> +	setup_output(data);
> +	setup_videoplayback(data);
> +
> +	primary =3D igt_output_get_plane_type(data->output,
> +					     DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_plane_set_fb(primary, &data->fb_rgb);
> +	igt_display_commit(&data->display);
> +
> +	dc5_prev_counter =3D igt_read_dc_counter(data->debugfs_fd, dc_flag);
> +
> +	/*
> +	 * Page-flip loop for 10 seconds.
> +	 * No delay in between flips - here display engine remains continuously
> busy.
> +	 */
> +	start =3D time(NULL);
> +	while (time(NULL) - start < duration) {
> +		flip =3D !flip;
> +
> +		igt_plane_set_fb(primary,
> +				 flip ? &data->fb_rgb : &data->fb_rgr);
> +
> +		igt_display_commit(&data->display);
> +	}
> +
> +	igt_assert_f(igt_read_dc_counter(data->debugfs_fd, dc_flag) =3D=3D
> dc5_prev_counter,
> +		     "DC5 state incorrectly entered during continuous page-
> flips\n%s:\n%s\n",
> +		     PWR_DOMAIN_INFO, data->debugfs_dump =3D
> igt_sysfs_get(data->debugfs_fd,
> +		     PWR_DOMAIN_INFO));
> +
> +	cleanup_dc3co_fbs(data);
> +}
> +
>  static void kms_poll_state_restore(int sig)  {
>  	int sysfs_fd;
> @@ -717,6 +763,18 @@ int igt_main()
>  		test_dc5_retention_flops(&data, IGT_INTEL_CHECK_DC5);
>  	}
>=20
> +	igt_describe("This test validates that DC5 entry should not occur durin=
g "
> +		     "continuous page-flips");
> +	igt_subtest("dc5-pageflip-negative") {
> +		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +					     PSR_MODE_1, NULL));
> +		data.op_psr_mode =3D PSR_MODE_1;
> +		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode,
> NULL);
> +		igt_require(!psr_disabled_check(data.debugfs_fd));
> +		test_dc5_pageflip_negative(&data, IGT_INTEL_CHECK_DC5);
> +		psr_disable(data.drm_fd, data.debugfs_fd, NULL);
> +	}
> +
>  	igt_describe("This test validates negative scenario of DC5 display "
>  		     "engine entry to DC5 state while all connectors's DPMS "
>  		     "property set to ON");
> --
> 2.43.0

