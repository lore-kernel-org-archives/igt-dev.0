Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85311CD8CA4
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 05:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D820410ED3D;
	Mon,  8 Jun 2026 05:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AlK21F1r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B2210ED3C
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 05:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780898196; x=1812434196;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eaVdWFiEpaa/Atr+qD7VbmlMW4HA9zcoMgeX4MAMECI=;
 b=AlK21F1rNylhvBBTmJ/M3YnAvNFqXCzjfvKnJ8zfFu2tuhignllBuxuV
 t7RPDU8mFoe1JMNyfv2PUybWyj/7Cx3LNcCY43+sqdkIcOnhHIrsbS9gp
 uvpr4fWcXS0VR4vgjcT6AklGjygixvQ4mX8ZNI1N/ir+9muMPHnRu0yN7
 3b0pHGGGaDHAV5jg6A4U0KD/7HGcIRK7Jgllk5aQhYSxzSVvNjLGuJYJ/
 rZH7petBWFWTqH4SPjbhaIcSqWXYziwv1yzx3lylHBSg68EITUdth0oDX
 RPECvFzRjM1YVGtfX0avQsGWgfyxn5Uk5+dB+05bVFsyAAdRAcs7VXY3D g==;
X-CSE-ConnectionGUID: p6cSyOjbTPOxL7UNeL+0ag==
X-CSE-MsgGUID: uoeA7XxPQEuaM9swDI1sQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="107066821"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="107066821"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:56:36 -0700
X-CSE-ConnectionGUID: LNn+Cyk6Sf+sswZ90YJ1aw==
X-CSE-MsgGUID: 5gMRFTaFRd2A3R/G8GDqlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="249373078"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:56:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 7 Jun 2026 22:56:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 7 Jun 2026 22:56:35 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 7 Jun 2026 22:56:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3Rs0qF6Z3Hsn3+ARnwFZtUtl4TbWz6mh6tj3ebSUaUh8CWc6gDg7GziYx2Nx7SfTWhFaowWtFbIPDf9aI38NNmRNA0lHv76XK2018XRpLeVT8xB7yK7uliGLUDNkxIo1qGdTc9gdYGVJKYPIXsikHvRqLuEpFhRCsJWzU7apo36hAwidlgRvAS3mZAGVUKyNxEgcg2WoSuP49pvzB73O2LhF37cwwpk19os/13BwE+HISBixDOlw4M0d8XZ10b5/08PYYeJ8uGeLkYzZ1+fqXiVcqhoXBIFch2r7JQL8XxNzbczq+t/8AiSf0au2mDZ3aKqbFuTkmS3mOpHllu9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwFAqRG5+f56HuxgvwExkyqhaJDucnkCzNbeX4chbCI=;
 b=wvbIO4x6mBB4H1WrDvGTqVYNPaEoxnvDnBt9dEzzLXgcb/eCCdRqcOsnt2RboFnNcdahTrYVwgSHjA/DT3VkbRdZVvP5UQuPcAWZfIdukQ3zBKntCv3h1A7LhZHsaK2RQ4f3ILNjMNdnxn/5r2K+V3tE+gPJbCC24iHX9T35vhAZ3smD3T7waxV775aEjMwbJYA9qG0BwSIvhj967JENbo5sBRs0Jnc/0VytRAqCkeMKlkHtz+zm6ga9wYqDZsyroK6u2U8vNxC+kBYIlLNXm1KWQ5i3Cx11O3hMVUEgF23wDGVAQQqECWliLDYp/iUWFGJ/UhCjDZLVm5E9MOn5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA7PR11MB9595.namprd11.prod.outlook.com (2603:10b6:806:4d0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 05:56:33 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 05:56:33 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Bernatowicz, Marcin" <marcin.bernatowicz@intel.com>
Subject: RE: [PATCH] tests/intel/xe_sriov_auto_provisioning: Require total_vfs
 > 1 for fair-allocation
Thread-Topic: [PATCH] tests/intel/xe_sriov_auto_provisioning: Require
 total_vfs > 1 for fair-allocation
Thread-Index: AQHc8qaWOEYEC/RCHkijRM3/87C4crY0MbEA
Date: Mon, 8 Jun 2026 05:56:33 +0000
Message-ID: <CH3PR11MB8434A6BCDC64504EEF6068B78D1C2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260602154247.967734-1-lukasz.laguna@intel.com>
In-Reply-To: <20260602154247.967734-1-lukasz.laguna@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA7PR11MB9595:EE_
x-ms-office365-filtering-correlation-id: 59d40ddd-d3ce-49b8-e65c-08dec522b1b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799006|56012099006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: zoiQmDFQUohTgRlnSDKPWIB8xlSvXnjZRFsTY3UFrUT4yBw5VWS7QIVTaQqzMWu0k7VWsXScHFtIpsdn+iqEhBRkT9jgtvwd4tugg8ho80xLcj5kwlwCcYIJzJxjlGg8jYbYYVYA77yJHzCXcSmMo0nzUUa6DA4W4fsaL38hoTA1+Tb3mpWlT8nlhvxfvV4gvgAawf3qihFrMOlz9VW2G0gjbVw/roNJ9xmL/pxcbKi0W+Qk8Vx1wExRcoZO68LRShKl989GMZynejvvBk2lv0SHd+VvhEuvZKYjJ2Ji1ekB2n7e6rimKEfgzqb3sJopU0dfSxMj74uUAXIScwCaPWCrrDL5qZ1UnKQ1ZIcyzRPSL3YG2ctou3HpBaSj1t+4861SwwbIxsZM30EJikBzpayqK8fctGhKf0ZZ3r+iBQmtR4JkrMvFEMjCM2DXMAZsM2FWCsCVfu9JTyfOuLZAIfBy1tWSYyWr8fH4I4DY3bLZ7BnilHbv026VdBmLrlLNsdynwKNxpBmGljeQNdB2y+ItQnUNlymI45+QNfAQov9M0gReQn9AVU1fKdKQOhZdDk+Za2cxMIXahoMvAZw/KanMtS/bpV7itpleyGoi5OlUvqqv2oj/E2hndOW+2neKLdlHXTYF06vng0httAdFCBifDBAoTePr8dNjy/kBjMMiLVduD47/IybVazaKyjASUT2amIyi+Ok5tKL2ZXdI3W9wyM7tzgFIzruGT6nkqIj5QcFG4Z6t+4dFsKKNWJNu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(56012099006)(38070700021)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y4r0V0i3gmyGtmHCKfTIqcNDC563BB+Dh80Zvk0kk6M1/8jJ/kuAJZWq8iN0?=
 =?us-ascii?Q?RIcU6+YyzGr3yCb6wJ1pWyVgd9pQpUNvTG2mCrTY4BmuVpXGxeppi9q2jPG5?=
 =?us-ascii?Q?8+UeRXii3lbHblbcEQRi4uhJygZxcriA108cYv9LC/WQG8itoKqZMQ+jw5+R?=
 =?us-ascii?Q?0RN4sdrMQ6DU6qUysiBmpR9BtX708oDMcPjli8kWD6bvVpU2nRh8CCDTwxMr?=
 =?us-ascii?Q?OiJBz4OdzPZ3IkLHRANcRMFwKzsnP7UaL9l8Rs088WgJVu2/X8ESfE6tydPu?=
 =?us-ascii?Q?TsZOKmc40vb/UAb3Vh8d9FQXW3z2C7ne1FYhts1zLkujq8kWcE7glJAzTcMC?=
 =?us-ascii?Q?CzOzToVV51gp4gxUe5PqMsaCPxb3cgPC/OaLeCOXkPb/a7qLxLa0hyRtUk3a?=
 =?us-ascii?Q?ayQdFNfiI7YfXwF5r3ezs3m+xZ6cGxYoa+ZkzJXSu4GiRGbmOxdyPDSbQxmc?=
 =?us-ascii?Q?oul33at2hquIRKExb76q4YONmyEFBn6lYZhnETIdmV9cFlUVqet/dztXEUpZ?=
 =?us-ascii?Q?F7jk0ItpzgEyFIpZpR2i/N9rmvGAFv6DgA6Uafq5Vh2migamTTuz3+rnsMjm?=
 =?us-ascii?Q?Fk+HjOor9kUelzePmDaARdbsOQmGVL0jP/ATZdgwhsN6YTtRbNYrzgK7f7OC?=
 =?us-ascii?Q?QK8EVGlNq5maekFZtSAa2Itqqg8K1uYWmsF4ipNhmyoUNOQnUgnkioNPlAlf?=
 =?us-ascii?Q?3AEvEz7+KdkpultekoSjGOU/5Ow10OQBKTYQHDLPFXq68wHM7nTvcbgO0y2q?=
 =?us-ascii?Q?3xHTpczkNhES3a4yc3qQdtnjWu3HXPeA30ovHiCpkgMA27HJhQ5RqxbiWPFk?=
 =?us-ascii?Q?7uCOLsUSGpM+btDAfNssd/os/VIhKmJOQeFMVe9C+8y3C2oel/agnKyFscX1?=
 =?us-ascii?Q?2vOFK4P+nRKs2CGDeraQ6nuCfzOYJUmTO4Bp/A4fQDpk6R2Ag3lmw4ESQ9c2?=
 =?us-ascii?Q?Xt/ypkV7wevndm9r178ChsM1PUHx+m3F7mTRtpHhszvGGV8ooDIwhp1WHv6D?=
 =?us-ascii?Q?Uneh9R3wUEeVLS8AekV+LeSKrUe3SRTZpc0iXxYOm5GkUwrkCB6DawmqI0hm?=
 =?us-ascii?Q?SB0u7RY/P1tmXLFEnMCHqQOlsBsF5oyVsr0gbSy/dVFhzonGqa0H/u6E8R1z?=
 =?us-ascii?Q?CukKE6HimQZm3N4nThoaJNNM3Q6W8uEYEVIKDgDQk164we65C0KJPLaHLS4U?=
 =?us-ascii?Q?U5vJwEVg0OGPQIPxJDlPRMmH9u5W1t7oimoUHtOgjW8plsrppnBYRotxMw8x?=
 =?us-ascii?Q?im8MBkvitM5pKb2UZaoJ/UfyKYL2h2lVuwunmzayIETJ6R0nxl5HUiG4eyIn?=
 =?us-ascii?Q?EeiEUXWyvcOe2Ad0JsiZsLXAuYgATq8geO/qRqpx5edcQ3wHkDUjtXSI/MYD?=
 =?us-ascii?Q?rVzLrIgtvx0Na6kn47VvoTRabv+8wkZ5Aj64gf3iFOjHt0UwR4hiSL1PCleM?=
 =?us-ascii?Q?C8cvvyHn/lNAcTRcIxLIXFECl7ndc/YGNG7er/3uJs0au1r9zJBPzwCMV0am?=
 =?us-ascii?Q?m3CrB7iUDdVBX6RUr4Lj8o4xFcox3W76M6Qn4LrhLVyIk26dbPJxFCTfCmL2?=
 =?us-ascii?Q?eG1sABX8Ke2HZoLa1mNgY8DnWuD12FTLkUrt2Gs7r5feqs/la/7vZxOK7ypb?=
 =?us-ascii?Q?HAW23l4k/eQw/grxH5Ib54X0qGlP7f1joUTwUwCzL1iRLUicI/g6HGzVVN0Q?=
 =?us-ascii?Q?Y+z4wm6LNe80/K6yuCD08aEQ9GZkjOczq4Km8aWUevUC0vDeM4/9OoKRYUTx?=
 =?us-ascii?Q?rK2iiSSwABJa1wY4mRHf0p1R706sUFY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NFsLGiu3JrP+JrfL7qW4MvxI10A9IQ3gdrohQmeEz0UFgF2VWGcqqffaoIwjeKhiZIt6Jmo7l8g5cmqlpxldBCVNbvRCTg+WwhIuV/o1y1rRgRZL8UR3mz1VplcISnbz5giEncVvJPLWCsy1eJU13ghToN/PV68CAO7NYwk1Uxd4X24IcKuAfJM4KhB6F2jRMZB/a2mll+cV7InVxfwIHkFOnixpUv7FybBjk5f7rSnktEikQtlXSZ4PbEQYgHVyd3Axsk0tMQySpmmS7nNa9hpgt6mqlCwpq/LH1ncPl4L9mYA1fBwWSPmPmD1wfmnE7yYALUQ+8C8tLeL0D20bbg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d40ddd-d3ce-49b8-e65c-08dec522b1b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 05:56:33.3543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+OTDdoZ7hYReKemuAIeusyB0QRvcR382xs9kUsX1tdRDVztEvtlhlaRGc03ZKIG6hY+l/v9CxO32GCdKCIeVYqkQw1xhFmPUyBF03k1lE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9595
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lukasz
> Laguna
> Sent: 02 June 2026 09:13 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Bernatowicz, Marcin <marcin.bernatowicz@intel.com>
> Subject: [PATCH] tests/intel/xe_sriov_auto_provisioning: Require total_vf=
s > 1
> for fair-allocation
>=20
> The fair-allocation subtest validates whether resources are fairly divide=
d
> between VFs. With only one VF, the check always passes without validating
> anything. Require at least two VFs to run this subtest.
>=20
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  tests/intel/xe_sriov_auto_provisioning.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/intel/xe_sriov_auto_provisioning.c
> b/tests/intel/xe_sriov_auto_provisioning.c
> index 8f573d234e..241a1bdd06 100644
> --- a/tests/intel/xe_sriov_auto_provisioning.c
> +++ b/tests/intel/xe_sriov_auto_provisioning.c
> @@ -351,6 +351,9 @@ int igt_main_args("", long_opts, help_str,
> opts_handler, NULL)
>=20
>  	igt_describe("Verify that auto-provisioned resources are allocated by
> PF driver in fairly manner");
>  	igt_subtest_with_dynamic("fair-allocation") {
> +
> +		igt_require(total_vfs > 1);
> +
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  		if (extended_scope)
>  			for_each_sriov_num_vfs(pf_fd, num_vfs)
>  				igt_dynamic_f("numvfs-%d", num_vfs)
> --
> 2.43.0

