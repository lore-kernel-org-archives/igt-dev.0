Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E946C27C77
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 12:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0054E10E0A7;
	Wed, 12 Jun 2024 12:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFQ4R7e6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C964B10E0A7
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718194295; x=1749730295;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U7MKX00Gf86Uf/i2lqRH2cMI01fOIrKng1TGN+8rZps=;
 b=FFQ4R7e6TfJYTw4/bB8L9D5zwOxroO94vVjn7hN4sp+gLGV8Ux4GCh5i
 EAH/8JUcMj8e/htEZkPa4vp4Qbv/OaPdC3gHHN3nPVTTsUibZBDo/MeQV
 48dAJ5u2zrUdyWc7mMUsKl+8zt3/l87UPogwexw4iSIBXCMw8Xdqrbkfe
 2UUzPVqjfMDB7BUGEeVdzENPjMLT6SJa0MpZqKcYwTaChEDNyUrkJ7aNw
 HRRvwu5vwdSvK2+LArRBGkZmdKoP3UOmwOqSRsXSHxgweyRr8xyui6n5U
 15WoaS4wvVBS0SVtmZyhiD6lr2HMB/gkbl+5ynPAcqXLAZsGtcJfbhz0D g==;
X-CSE-ConnectionGUID: nLKOqY+tQziHyL4zFuZ6tQ==
X-CSE-MsgGUID: UYq6GwbrS5SUEJ94Z9Xp+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="14788623"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="14788623"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:11:35 -0700
X-CSE-ConnectionGUID: XmKs2zARS/qQKQVlewLBJw==
X-CSE-MsgGUID: AYkeEKHOQkWIBWESGByH/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39876001"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 05:11:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 05:11:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 05:11:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 05:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGzGrMefDlKH3WrpVVBwpREKldkcniQEJPnrMqJ7QDWbB+YMgG5sFl92ijD9HWW8yQmmtRfls3TpWLcT7fzVttWOkXkE6Z3bVFMedJVayCv+TPy/grnCzOBOd/rh9de4o45rAA2asqu6car5lIm5YFjRbCLBpGZfZDskjqKB0LxMDnYU+qJH7n/WUhDpswFoyAnsc6jP9jyFZvBpd2U4UK23EmWvoHaHqIBqQc/WShIEOrbTLNwV0OnQrQ64j8fGcdpOsgrk3T/Qie0PXTsqakGaFDTswtSZzwwg4lrIpfA6JW9zg4HOXowwF3C3evXDA6WMcThjCWK3mnbkjkwmCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rHfzoA4RQD77HjAhFIc4GHJfZxy0H3dkmrM84M+Mtk=;
 b=R419eXsmYumhwDdoggVW7Vwg9tO1S9DV81eHh1oMPxTcFCmwANtSvIox2fBUhV7vr9QkiyS2ZSEw+V65yrkK/BNFRvww9xsLW6EfGGys/8tMTpIbQLy+oLXJG3DyInRaZT/rFY/6giY1JpFj0PcUuj5ncVxzhNupn8HPkIFsVKmH4qf895+Rvo34keMats8s6ZFRx6uw1OV8oG7dx3J/Z/bOvL9xgD6j0pSQptTp21Y10/1gHtSVh5pmcYjF6Bw8MnXT9HT0RUuGgrThwgCgxzvcvtm5qtpFwr8XzqFNZoeboxt5PeO6EHOvrtvZLsoZA8pF2tjL5eePWKQ7dN41vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 12:11:30 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 12:11:30 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t 2/5] tests/kms: Drop redundant check for pipe/output
 combo validity
Thread-Topic: [PATCH i-g-t 2/5] tests/kms: Drop redundant check for
 pipe/output combo validity
Thread-Index: AQHaiXyfCIjxrDNIIkWSi7oeWeN7wrHEbwAA
Date: Wed, 12 Jun 2024 12:11:30 +0000
Message-ID: <DM4PR11MB6312DE257D5CD33C18924D6690C02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
 <20240408061221.291523-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20240408061221.291523-3-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB7127:EE_
x-ms-office365-filtering-correlation-id: 0c8e8477-45fb-4866-09cb-08dc8ad8cb14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info: =?us-ascii?Q?S0QxJdVyUCZiU980rysMK4/Vm3tR1ZxWZnTEtYwJogwQYr4frQ1TSD/Qx7jq?=
 =?us-ascii?Q?BBzeE8TloiXGbQ/jBez7FPML35SbipzQ9d3ilCIgzemZoHrX03Z47BX2Rwth?=
 =?us-ascii?Q?E/oLtqZ74LhILsU17w731k0nMNXQXYsXW7yBkYW9Q8Bmts0qGXQ2lncBiPH6?=
 =?us-ascii?Q?Fus68RmuIOcINMtCVeDu1CG5Ss/0ZMm2xWLFEFIRYTr3Bvfh+TQ114nic1VO?=
 =?us-ascii?Q?su0iseS0+CKwY4tvP0SBclZ0nkYt+vxQqrDA/1D5iRmUi+fNE6zFN2Lla5Aq?=
 =?us-ascii?Q?GDoheFySrSkQRlHf7eJ3mJO2qWLjAPIJq+9wpAJ4DTgSO1ifKU/q/oV/i+mH?=
 =?us-ascii?Q?bD0pZgeiUibUTREbm8TwdfodF3xsqhpnlZxWtSdezPgbxCMYpizzL4syzXoZ?=
 =?us-ascii?Q?Q6ih9Kh1F5/bFRQnTuv4jZOunzAtNvv5hNdfqxdG+EqYtBx4JxGpdywkGwGq?=
 =?us-ascii?Q?jSv3mpg16N/sB2wQmnNfJfNuhm+zTvvujFn9/Ei1KWa/nBw5jmv4x3qA2pvP?=
 =?us-ascii?Q?gBRxjPcM12WJTWB3t7vMMIWpAI+YBo2s3n5ZL2aooOyf+lvvUfxwoiLr179z?=
 =?us-ascii?Q?yHfS9klZbBM1Wr3B698xssQY+V/qksvmspgJ1h3/l+RfTEXwfYAMVSdAsPiv?=
 =?us-ascii?Q?IXVBlb+/ARQoHuiPOeJuk8xxYhGdVMnsyu/ZR88bi3JK+pPfnlfSQnHEhKZM?=
 =?us-ascii?Q?sZRZ0BOEvr+ZhLGOgLb6hobA/atMPmBg/q93vPCjgzl/CFS3/0w4aBpZOZks?=
 =?us-ascii?Q?mPgFYXmy/l8K0fJ5SVjNt/T2jfz6KWqCWVjqF+VlQkSJ2pyRiTkDGk8Uk1ag?=
 =?us-ascii?Q?q2NinoKMfNd0bExYQTKEuYE7KQR0p0wQbQmisiH3Dz0w0bxIgywIEQdz3Zu2?=
 =?us-ascii?Q?XV2oMF+soFc8N820hI+r8AcsflmmhMr1DXesvLG1MgJ2skfKxuB/VMiGKHWO?=
 =?us-ascii?Q?StwLzH4aU6osjNcl2Bep8f7ksQZ7iTNWl8TzyJyk+o2Fvucw/qvryFGbfR0g?=
 =?us-ascii?Q?rwK2A/Ee90sf5buMaLGgvJsxC9Q/oYUPlIlN7fW3G1mNlFjypyGnDX60+aIu?=
 =?us-ascii?Q?Ni7sEx0AW2ZvYbE4+RWw8Oe9kYHlDzagN8T227ZDhiwpkXwwR9HXqxaMxdYM?=
 =?us-ascii?Q?seUtGZVcWcJ17mlx8tt6HzxxkEsncwlBm81T/Afg8MJC+PMGOSjf8R4ed5fO?=
 =?us-ascii?Q?zm1ELnCAIAoPRI0HqP1OWYAFrV3WP+Ahx4Pyj6DAvSSkoE7rUG+lIO2CJXOV?=
 =?us-ascii?Q?IqC4VS4kHAXcOoCiTjdxc1pmTIXI/ET/KKngjlSYsMgTB2JtjzgwzMn9UXch?=
 =?us-ascii?Q?h0cSJIII5GQgk0wKCmtOD/HXAQLN4BqETdUqc0FkJr/TnpaAqRIVjZkkktnB?=
 =?us-ascii?Q?uJ0Ieh8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lbIEmYrphteFyP8Vh5V/rWPxOB+CGUMD7uMEHhB+UImu0I6nSVBUNn+SLan0?=
 =?us-ascii?Q?w42xQ+W/jt5+HQmZmUWoj2kNMcxXD7Yy83uNWfaVQfT+ml68h1UpJhxGiaca?=
 =?us-ascii?Q?GMzLZGhgjv5aHTdLPrULhnjIFKgOpkiSHmyrvYnnEPjjGUx7w1DqPXF8bHla?=
 =?us-ascii?Q?nlkA/t4CLItb0f30Wj+QKZetxZ+ihP27RrYdExyJwmKYyFnWtJ/Y7OcbXdcj?=
 =?us-ascii?Q?z/qtQhqhkTDnZgR9AVe3AQp6D+01YFHoEfr6DBc0FLYtJftzJcPuoOmrww0v?=
 =?us-ascii?Q?pIgfDKzJgMkRaIlAHMtEh7ssk7S3FpV2YGdQ/HKV4VflVzLfzuwqE10jt2gR?=
 =?us-ascii?Q?vu6Cr2mCe7GTesdX9OYh513eym744GUg3Kx80wPzpjgcpmJV/KRVBvTmZ3v5?=
 =?us-ascii?Q?G9dAKYKmCJNCs7BBNVT011+wlfOYIga/uBA2mbZ9F2Q9Xe5SAT2t7OSM9gs9?=
 =?us-ascii?Q?J1Q9OkUvzFYGUIDVaESvBArzv4DyYqCKmzOl5KqpUvBPBL44ClexDJuCFLJ8?=
 =?us-ascii?Q?S76QqfbJW+28z7fPf/sxufv26J2hxH7GujuRvf25qgjLbkweWDWVXGNAJ6KX?=
 =?us-ascii?Q?VSSfPps3O/HjraGmhKGtypJe5Unj4R+6/WZ2XPKvk4OzALU0xw3YS6LYX9ES?=
 =?us-ascii?Q?fmKjGKqMRcznIrNi801PS+sLnl0ZGQTOIOQqUj1u8Ogg7eT3BiiFVMe25kSx?=
 =?us-ascii?Q?I6PVooy9/QhntMA12baGTiR2/VybJsEd58U4ocx7LPAAuwYjiU33lEFDtNVh?=
 =?us-ascii?Q?UAF2905pbeeIGaW0YM+adheOO7GoFV/9hMaB7w/juVHohTsFmeUvtqsz7T6G?=
 =?us-ascii?Q?25+8UVdZbsu1vFPcaUZQk5zZjDgY6wDPyqeFeXSoVjyE6OS2qgT6/iD+GW1r?=
 =?us-ascii?Q?+vdVbzUrP9VgPIzJg9XJf2+Tx82oqk116WpRN8RUb6uRUqItRvkuiurpEwFm?=
 =?us-ascii?Q?I8ZDJTozS6H6P5PNEHlqSve/SWIRulyuIknviw47bB58fAUM5jhS88gJA05z?=
 =?us-ascii?Q?0B11cLsQmhcEGldECXeaivbneImlQf16o4vRNDJlv9yoxMQRkfv4DWWr6Fsm?=
 =?us-ascii?Q?v6bekwIKljHlBU0UCjlu+rNByswQJuXIzHrqJotniEIs4SLXJIwKz3Zr0S9r?=
 =?us-ascii?Q?+q16YwTOcuNQl6VQ5XheTqbnjzj28wKhKSzgyl29hzM4DOag74f2+w8rDm2r?=
 =?us-ascii?Q?aXXaZa//dtTmqMBreU/TznnZP5WC3obeXicUE+r0rlu6Fz7Z2O33V950ySHv?=
 =?us-ascii?Q?S3uTLL09gaqWjGNpoYIWRClBkLV45rDzCBjgj/WIOFvo9pvPNzgIe8QnUQUS?=
 =?us-ascii?Q?d6EsOxomXKvViQx5dGowOOLrN8o0W7IoepCym2PoZDPR1+UFKhIPI02oYbUD?=
 =?us-ascii?Q?EyvggkJfz4SYjXYXex9ywwEzgInxPWx6GyQ1qO5qAFFWCVBlVc/81filyCLR?=
 =?us-ascii?Q?x/R/DVDoDQfQLVMNvIlhPtQENA8R2IV+0++CGXmkDIhohFTx9j6rifXkS6wY?=
 =?us-ascii?Q?P1I6uVbiZBQgxJinHCKhymVDIAsD10jWQhwAb3gfW5hk4SvAXQUC/i03w4hQ?=
 =?us-ascii?Q?Gllrs76oNPR+0nFWSKg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8e8477-45fb-4866-09cb-08dc8ad8cb14
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 12:11:30.4193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4XVrII9GSCn5NZsDSaWX0OwQBd+qVpt1SnUJPzV3lgXNDtvx9VewmNSNRwDLZsfxwQhr9Fw9MJxbEjRuLFcZnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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

LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Monday, April 8, 2024 11:42 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t 2/5] tests/kms: Drop redundant check for pipe/outpu=
t
> combo validity
>=20
> As intel_pipe_output_combo_valid() is taking care of pipe/output combo
> validity, drop other redundant checks.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_content_protection.c |  3 ---
>  tests/kms_properties.c         |  3 ---
>  tests/kms_vrr.c                | 22 ++++++++++------------
>  3 files changed, 10 insertions(+), 18 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 6858b22e2..e9a468eb0 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -564,9 +564,6 @@ test_content_protection(enum igt_commit_style s,
> int content_type)
>=20
>  	for_each_connected_output(display, output) {
>  		for_each_pipe(display, pipe) {
> -			if (!igt_pipe_connector_valid(pipe, output))
> -				continue;
> -
>  			igt_display_reset(display);
>=20
>  			igt_output_set_pipe(output, pipe);
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c index
> bd414f534..6f92b218e 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -337,9 +337,6 @@ static void connector_properties(igt_display_t
> *display, bool atomic)
>  		bool found =3D false;
>=20
>  		for_each_pipe(display, pipe) {
> -			if (!igt_pipe_connector_valid(pipe, output))
> -				continue;
> -
>  			igt_display_reset(display);
>=20
>  			igt_output_set_pipe(output, pipe);
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 15c62b34b..2a160b990
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -733,22 +733,20 @@ run_vrr_test(data_t *data, test_t test, uint32_t
> flags)
>  			continue;
>=20
>  		for_each_pipe(&data->display, pipe) {
> -			if (igt_pipe_connector_valid(pipe, output)) {
> -				igt_output_set_pipe(output, pipe);
> +			igt_output_set_pipe(output, pipe);
>=20
> -				if (!intel_pipe_output_combo_valid(&data-
> >display)) {
> -					igt_output_set_pipe(output,
> PIPE_NONE);
> -					continue;
> -				}
> +			if (!intel_pipe_output_combo_valid(&data->display))
> {
> +				igt_output_set_pipe(output, PIPE_NONE);
> +				continue;
> +			}
>=20
> -				igt_dynamic_f("pipe-%s-%s",
> -					      kmstest_pipe_name(pipe), output-
> >name)
> -					test(data, pipe, output, flags);
> +			igt_dynamic_f("pipe-%s-%s",
> +				      kmstest_pipe_name(pipe), output->name)
> +				test(data, pipe, output, flags);
>=20
> -				test_cleanup(data, pipe, output);
> +			test_cleanup(data, pipe, output);
>=20
> -				break;
> -			}
> +			break;
>  		}
>  	}
>  }
> --
> 2.43.2

