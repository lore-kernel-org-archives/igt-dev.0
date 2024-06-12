Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C15C27C77
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 11:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3069710E495;
	Wed, 12 Jun 2024 11:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gahNyOT5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662C910E066
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 11:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718192844; x=1749728844;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q0DNzAD3t+gg4fKpTTZzBXEZOYK2EoVN5IdQ3xCAdX8=;
 b=gahNyOT58axKAVXoheDwfRlq8XKO3jSUBZO/UHKRuwrYBoIvBxS8QNry
 LxTMUZ6w8YM0oCoyos0Mgena/45saTGnSfE93cK+sI2Jxczo4Sb+G9fnc
 eWKlA1Dn4VX3wFqZFH3LNoFqgrfaVgkBkMaNIaA6t0UbdYrmm51mvPp2+
 UnQ7tIlivB/fpKr5H1YnbcR43ts6FpDgy6098DihXxTu6Ojk9WQ+q9ADD
 MUwjhqaOrcgOonf9ZY5TmZBAm4TLII0hhQNsKpzjMD0yXfnEdSSI6Ce9p
 2Rp7blhyy2AyFRQPQOF01ia+2LXuFNW+rPHJ/tYk9YbxsnBLKRiAUkLeY g==;
X-CSE-ConnectionGUID: HiPG+y5mTD69PPtWmz1YZQ==
X-CSE-MsgGUID: CYmAzC/JQnyvRIJ3HE2qhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="32434490"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="32434490"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 04:47:20 -0700
X-CSE-ConnectionGUID: 0sVUXf96R1KJhz6TjgYMPQ==
X-CSE-MsgGUID: /lhPXEIiRUWENlfdZ79yjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="44895867"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 04:47:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 04:47:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 04:47:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 04:47:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEOmSq4g29fQPSqfNnU3BiUQBmqJjLzBSRjErZahexIBnyXHEcd8hiUjYmTY882386tmf2t9FNNB82a4Ath5UlTI/mQGts+ammSzCcQxfHmTTqUiLJ3Wnl0Dc1b62HtSXcfhGgth9Nk3+4QpH5vYrcgabr73L797NG9QQEJp1uSkH9C3Jv5I33/pRtIZ4Y8YreXQ+KPqlSgRH9g9tGSdok+k6WZpIU6wWMc2Kfr0j0r23MXfFECnXZdwyPahOy4CLUYkPCOYTpLptm93s1UdDKaNc80jDY85Gtlzw2MSOO2V2waygCWwBOtqarbD2Csd7UdZUrR4VmVJYo8gNsA2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFlsX33Xv2UnUkZ+Sk/9HDpQLHik8DH0tkHFdVnHLQQ=;
 b=g7NsDCGs4NNl7ZngsDTFJ2lz2u9dNp6egAuJV9f1NEsCbP2feAJg2V3AC1ln1YwCAKWz7+2fMSWoNyRemSAksvfr0Kh1ob2K92va9hp9da4qcQvEs+qi3hNtZQu4TDzhE6D+crw6EI5KxFeQt4lTuQT/nWJC1lqInQTYT6s6PuxOIJ+xIboCtvbF+vUGQ+BP/QMUA27hE1k3cjt8ObqySMbt2FpeXXamlRyfMkAepoeEhUpm7XaqlkBFUMFpXRqqVU0FcwEgImza1es3rLq/POUO6iapFrtcIBg5HUpCokhjPIk6CA33RSy5ZcYwW5bSYe5ULirYPvmtsXCXukUMZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA0PR11MB7789.namprd11.prod.outlook.com (2603:10b6:208:400::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 11:47:15 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 11:47:15 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t 8/8] tests/kms_properties: Create dynamic subtests
Thread-Topic: [PATCH i-g-t 8/8] tests/kms_properties: Create dynamic subtests
Thread-Index: AQHau7yADKb9yBPaMEWqtUMlTdJ4JrHEBPKQ
Date: Wed, 12 Jun 2024 11:47:15 +0000
Message-ID: <DM4PR11MB63127C67846A9C78980FABDC90C02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
 <20240611045348.3727239-9-bhanuprakash.modem@intel.com>
In-Reply-To: <20240611045348.3727239-9-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA0PR11MB7789:EE_
x-ms-office365-filtering-correlation-id: 7c65620b-fba9-4799-0fe2-08dc8ad567d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info: =?us-ascii?Q?/YzjSyJXT94VYc04VIuFzYXCAW9KzZI4OIWrPEmmEVFAVB+0V8Li7MyP17KN?=
 =?us-ascii?Q?LpLgIGpvWRM+qjuV0QvejVj6F8nI/RGJXGRsgEfoHUmaRZEBC4hyAgAumf4D?=
 =?us-ascii?Q?DLcO9EG/uXIne7oOnGmRK1qGnlLziwN+f/gZTBEaAkEpSvCoLcPvQKja81Rn?=
 =?us-ascii?Q?wNBrxqpxpUcz/uBweoW2R0bYXWfoGah40PzrSdokICu6xQkzbP/EXgCdpWDA?=
 =?us-ascii?Q?qogDGuKboACY6p5v9jwBVvilBxJrBMD607PVkoxbDB+Kx4b5CeDeDAuzR6lL?=
 =?us-ascii?Q?TAA0Ae+/SobBky5gULluYUw1DNKnFIzDcJl60sEegJ/MxZ8cTr32PQY28BzO?=
 =?us-ascii?Q?fGFO4LLv3IMGVrSph5gCmTWgPUlq40ZnwHfSz58sNC8QJsaY4wgXl3vLQ+ut?=
 =?us-ascii?Q?PoNhj/zl84K3vDYC52z88skQDIHRen/C3p2lNVntM8HXBFK6lq7TiI8QHecD?=
 =?us-ascii?Q?gcPbiF6AkIoqBiuU3T66njlqynoyjr8RnRe+R0EbfYUSGpheYR5ILIqZJQut?=
 =?us-ascii?Q?9dWH/sYijrA3khmJxQjNEgfn/SV+dTq5ujlkXMnOWtQI0tcNUN50lqAGmQaF?=
 =?us-ascii?Q?OzI4DP4bJVB8jU8qImca4tvaxErXAI3W6QNBFx7xXVFusSAW650wYTmiS5Ww?=
 =?us-ascii?Q?9ue+oIZDA3eyeLGaHUuQ4ZIBuWbwvMDzKAvxXxElVLhg06DY5pNQv+xspcuT?=
 =?us-ascii?Q?+Rj/V5a1OkNXpFivd2xSxl4KBfRXPk632hKOgTA4Fq21+W6+nTMFm64pMpdp?=
 =?us-ascii?Q?p6lVXermegbpPcK10HxxSi6MLZJuRUCwR7zW1iVegN5G2FI9e9LO6WCBm6eG?=
 =?us-ascii?Q?iOQkpl/xwdI1pRanDpyCI31RTsr0j3ngYo3/a8AIplgN9OIe1zEUwD/mHg+m?=
 =?us-ascii?Q?gJhGup1dtCDcnBoma2IJUdozIfRk8+XUF9O5PNJEjKIeYpTwV9tcYYoOFARt?=
 =?us-ascii?Q?y9hroq1+YvXGuq9d4D51y2WVesWKXfqhEpHD3pL0MhHVL++1Q+nB+TIqlmKj?=
 =?us-ascii?Q?q9ppogFT1zh1i3+WvklZ0o/Xbv96jgq7EFASL4jVrJg8gIWm3ZLpdIngx7mc?=
 =?us-ascii?Q?eobypu9IfOR5AftPKhpofhoTAVyaezqXvCtOaE8o9heGUdZWc77KfqKvSNV7?=
 =?us-ascii?Q?5gnqwEyzV0xN0BulDdeQvkkZ7n/LMez+0hjQj2vZpuFevSkpL8uRP3atjNNn?=
 =?us-ascii?Q?mXtpLzJToeNP63JCu+k8r1DNMvnw8hXFUa7j2t1dU7KPU/m7VAHHwSahZVpY?=
 =?us-ascii?Q?ZKAbHyjeb01XTESU2RMjIIjFXJJIiRScze6NcArWa9erFNJHowT5ET0crqf3?=
 =?us-ascii?Q?05BqUSpe5mWIU2bCCBM6+JBHpmauuSDROqzojQARtsCxufs1pfia1q/v0y0S?=
 =?us-ascii?Q?0ao/+cw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y29s9r/ibEV/I4Vy1sul9MhrHc39QDphi2ClWGVDC8/Q6FUJMn8ncPPO01D6?=
 =?us-ascii?Q?Cs812mkdRZXfazsDYD/6U3nwFZWAHLvBccOelhs0gMBzyVIxKPx22D7Ccz0W?=
 =?us-ascii?Q?vuMRI439nBw+jLM46Bz8+JWD01Nk34mGHSSCNyFywFdSpkEcWJHnZI4EVAnF?=
 =?us-ascii?Q?ITzXdiWrc5zDRsT0rjPetDUJTUoXjpXS/aApgfYeTa4/dHb4g0yPepUhrNk+?=
 =?us-ascii?Q?AUS9kWFWD0RQ2VXUvRmvMBDEsLg2OvVpFAiRuDYgXX/6EENJtvNJtBiUsVCH?=
 =?us-ascii?Q?jsurgYJF5UZexsesC75F97G8GPNv3zyT+QkEvZeUjfFwle/+6jlNcaf4atK3?=
 =?us-ascii?Q?zoE7bEXeHo+s9OGxIVA3cfsjpqbgBD922csN4G5SY8oK1/cxv3i5F/KwmSq5?=
 =?us-ascii?Q?XJ6DOi0nbfz/fjnRVNpbzidzSiFBGN/+rpHSQU5qc1OwsCMw+6gJUt/bLndG?=
 =?us-ascii?Q?Dr49N0uoO0qYcGbvOUWsTYQ0k7gZRXGFkwGe0IBLLfmv+st8tjBxsqsRBvIR?=
 =?us-ascii?Q?tIOtgQ6mhGgb1nEF2GI9qVGfqBT7yT1AcYdgluuHSbHJYF+AGwthN38k4Kd8?=
 =?us-ascii?Q?TT1EvrApKVhP1hj3wyPWG95sZO739/1Dv1yXlBpmeo7Jua05Jj/ohEQqphs7?=
 =?us-ascii?Q?IhlL8HfaDH+kZWfvG5YsJmqSGIqZwfNSzgHKK1bE8KzIUrTatnO1U9GOYFLK?=
 =?us-ascii?Q?GrHDPXdkbT0aWI7LXUHslkKeCVqXK5N7izPKju21AVI7SBiZZrEzR1dQzSln?=
 =?us-ascii?Q?N7K6MYw3hU4TmWVVygBqe3mHJqX5sg2yUCMps71W2//RKVyWtNwmkBTeZO4c?=
 =?us-ascii?Q?/9HPZ+vFzMImMytABNJvokgnaZqoYJWYQYnIshQ1KxAhhgQ/l7nTJeyuFN22?=
 =?us-ascii?Q?XPfDuSQNuN93J7eqZFua5aW4mDnW1RP1wSOIsIPUt0wXX4q+Cq9i9oFj2ahZ?=
 =?us-ascii?Q?s9rhxxq979goqySTLy+ESTaSXxQGnb4L9xUuHB3z6I0MYFnKbcz//hon55Z9?=
 =?us-ascii?Q?2CBZGfjwp2bLZoaNaaYqBwzqjfWspl/1btqMeytfhA93+8owlG5SlcBHLfRd?=
 =?us-ascii?Q?nNdHufnpzFKdOEQ6HhrT24sYlzrwYUXIPcdxY1O3OLSP0Mtu4/Qu9NwzYhUw?=
 =?us-ascii?Q?FvCLrt0Faz5CxxJPVFokRRgI9o4LWDfEQ4fGh9q5A8LjX16PNVpAEoDuobcD?=
 =?us-ascii?Q?dG5f51Ho1tEfhbA4KD1QABHdAQENF1Ew3QSpI4k+6LqyS6/gdBeb6ruuDGUu?=
 =?us-ascii?Q?42xqPK3TNRxNrPyBJaF5FylJ2/w23vXqa6QdIlZfT+/ukLlv+dbomI0qJbBH?=
 =?us-ascii?Q?OHK5HOQeA8O6Q4TKdeSxiCGEHz5OUNK0HJ0+UUOXc6eZLSOcysEHmzmUCvSF?=
 =?us-ascii?Q?CwuV4qAzFclIRvyL2sM/JSx7wxUB6qCuOzuDPCEciYViyqnR8ubQAYXzFbcF?=
 =?us-ascii?Q?kDw6hSuSpwK17SiMsXwL0HRRgQmrrGhYYVOsFIeSzkK5i88wNDe1WA2ec+57?=
 =?us-ascii?Q?qVDL6fYsChGp/AuHsu5I/BU1CEGPPN3oBbpkm0z22Y4oeaMdpDJb3usG8jLy?=
 =?us-ascii?Q?TxDx33KRb2Jpelzlv6U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c65620b-fba9-4799-0fe2-08dc8ad567d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 11:47:15.3955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YftxrzMaRAdc16d/NfwWgvzu54HDjIu2hGThjHarcxbJaUuLiOM813l4kgmeritHx2dv+tIMyDYnTuKan2GtDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7789
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
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; Modem,
> Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t 8/8] tests/kms_properties: Create dynamic subtests
>=20
> From: Mohammed Thasleem <mohammed.thasleem@intel.com>
>=20
> Modified kms_properties to include dynamic test cases.
>=20
> v2: Fixed compilation issue.
> v3: Removed redundant code.
> v4: Moved get_prop_sanity calls to igt_subtest_group.
> v5: Replace for loop with for_each_disconnected_output.
> v6: Moved cleanup part to igt cleanup patch.
> v7: (Bhanu)
>  - Rebase
>  - Handle disconnected outputs
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_properties.c | 188 +++++++++++++++++++----------------------
>  1 file changed, 88 insertions(+), 100 deletions(-)
>=20
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c index
> bd414f534..17e6c0471 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -268,95 +268,76 @@ static void
> run_connector_property_tests(igt_display_t *display, enum pipe pipe,
>=20
>  static void plane_properties(igt_display_t *display, bool atomic)  {
> -	bool found_any =3D false, found;
>  	igt_output_t *output;
>  	enum pipe pipe;
>=20
> -	if (atomic)
> -		igt_skip_on(!display->is_atomic);
> -
> -	for_each_pipe(display, pipe) {
> -		found =3D false;
> -
> -		for_each_valid_output_on_pipe(display, pipe, output) {
> -			igt_display_reset(display);
> -
> -			igt_output_set_pipe(output, pipe);
> -			if (!intel_pipe_output_combo_valid(display))
> -				continue;
> +	for_each_pipe_with_single_output(display, pipe, output) {
> +		igt_display_reset(display);
>=20
> -			found_any =3D found =3D true;
> +		igt_output_set_pipe(output, pipe);
> +		if (!intel_pipe_output_combo_valid(display))
> +			continue;
>=20
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +			      igt_output_name(output)) {
>  			run_plane_property_tests(display, pipe, output,
> atomic);
> -			break;
>  		}
>  	}
> -
> -	igt_skip_on(!found_any);
>  }
>=20
>  static void crtc_properties(igt_display_t *display, bool atomic)  {
> -	bool found_any_valid_pipe =3D false, found;
>  	enum pipe pipe;
>  	igt_output_t *output;
>=20
> -	if (atomic)
> -		igt_skip_on(!display->is_atomic);
> -
> -	for_each_pipe(display, pipe) {
> -		found =3D false;
> +	for_each_pipe_with_single_output(display, pipe, output) {
> +		igt_display_reset(display);
>=20
> -		for_each_valid_output_on_pipe(display, pipe, output) {
> -			igt_display_reset(display);
> -
> -			igt_output_set_pipe(output, pipe);
> -			if (!intel_pipe_output_combo_valid(display))
> -				continue;
> -
> -			found_any_valid_pipe =3D found =3D true;
> +		igt_output_set_pipe(output, pipe);
> +		if (!intel_pipe_output_combo_valid(display))
> +			continue;
>=20
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +			      igt_output_name(output)) {
>  			run_crtc_property_tests(display, pipe, output,
> atomic);
> -			break;
>  		}
>  	}
> -
> -	igt_skip_on(!found_any_valid_pipe);
>  }
>=20
>  static void connector_properties(igt_display_t *display, bool atomic)  {
> -	int i;
>  	enum pipe pipe;
>  	igt_output_t *output;
>=20
> -	if (atomic)
> -		igt_skip_on(!display->is_atomic);
> -
>  	for_each_connected_output(display, output) {
> -		bool found =3D false;
> +		igt_display_reset(display);
>=20
>  		for_each_pipe(display, pipe) {
>  			if (!igt_pipe_connector_valid(pipe, output))
>  				continue;
>=20
> -			igt_display_reset(display);
> -
>  			igt_output_set_pipe(output, pipe);
> -			if (!intel_pipe_output_combo_valid(display))
> +			if (!intel_pipe_output_combo_valid(display)) {
> +				igt_output_set_pipe(output, PIPE_NONE);
>  				continue;
> +			}
> +
> +			igt_dynamic_f("pipe-%s-%s",
> kmstest_pipe_name(pipe),
> +				      igt_output_name(output)) {
> +				run_connector_property_tests(display, pipe,
> output, atomic);
> +			}
>=20
> -			found =3D true;
> -			run_connector_property_tests(display, pipe, output,
> atomic);
>  			break;
>  		}
> -
> -		igt_assert_f(found, "Connected output should have at least 1
> valid crtc\n");
>  	}
>=20
> -	for (i =3D 0; i < display->n_outputs; i++)
> -		if (!igt_output_is_connected(&display->outputs[i]))
> -			run_connector_property_tests(display, PIPE_NONE,
> &display->outputs[i], atomic);
> +	for_each_disconnected_output(display, output) {
> +		igt_display_reset(display);
> +
> +		igt_dynamic_f("pipe-None-%s", igt_output_name(output))
> +			run_connector_property_tests(display, PIPE_NONE,
> output, atomic);
> +
> +	}
>  }
>=20
>  static void test_invalid_properties(int fd, @@ -424,7 +405,6 @@ static v=
oid
> test_object_invalid_properties(igt_display_t *display,
>  	igt_output_t *output;
>  	igt_plane_t *plane;
>  	enum pipe pipe;
> -	int i;
>=20
>  	for_each_pipe(display, pipe)
>  		test_invalid_properties(display->drm_fd, id, type, display-
> >pipes[pipe].crtc_id, DRM_MODE_OBJECT_CRTC, atomic); @@ -433,7 +413,7
> @@ static void test_object_invalid_properties(igt_display_t *display,
>  		for_each_plane_on_pipe(display, pipe, plane)
>  			test_invalid_properties(display->drm_fd, id, type,
> plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
>=20
> -	for (i =3D 0, output =3D &display->outputs[0]; i < display->n_outputs;
> output =3D &display->outputs[++i])
> +	for_each_output(display, output)
>  		test_invalid_properties(display->drm_fd, id, type, output->id,
> DRM_MODE_OBJECT_CONNECTOR, atomic);  }
>=20
> @@ -763,7 +743,6 @@ static void invalid_properties(igt_display_t *display=
,
> bool atomic)
>  	igt_output_t *output;
>  	igt_plane_t *plane;
>  	enum pipe pipe;
> -	int i;
>=20
>  	if (atomic)
>  		igt_skip_on(!display->is_atomic);
> @@ -775,13 +754,33 @@ static void invalid_properties(igt_display_t
> *display, bool atomic)
>  		for_each_plane_on_pipe(display, pipe, plane)
>  			test_object_invalid_properties(display, plane-
> >drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
>=20
> -	for (i =3D 0, output =3D &display->outputs[0]; i < display->n_outputs;
> output =3D &display->outputs[++i])
> +	for_each_output(display, output)
>  		test_object_invalid_properties(display, output->id,
> DRM_MODE_OBJECT_CONNECTOR, atomic);  }
>=20
>  igt_main
>  {
>  	igt_display_t display;
> +	int i;
> +	static const struct {
> +		const char *name;
> +		void (*func)(igt_display_t *, bool);
> +		const bool atomic;
> +		const char *desc;
> +	} tests[] =3D {
> +		{ "plane-properties-legacy", plane_properties, false,
> +		  "Tests plane properties with legacy commit" },
> +		{ "plane-properties-atomic", plane_properties, true,
> +		  "Tests plane properties with atomic commit" },
> +		{ "crtc-properties-legacy", crtc_properties, false,
> +		  "Tests crtc properties with legacy commit" },
> +		{ "crtc-properties-atomic", crtc_properties, true,
> +		  "Tests crtc properties with atomic commit" },
> +		{ "connector-properties-legacy", connector_properties, false,
> +		  "Tests connector properties with legacy commit" },
> +		{ "connector-properties-atomic", connector_properties, true,
> +		  "Tests connector properties with atomic commit" },
> +	};
>=20
>  	igt_fixture {
>  		display.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> @@ -791,59 +790,48 @@ igt_main
>  		igt_display_require(&display, display.drm_fd);
>  	}
>=20
> -	igt_describe("Tests plane properties with legacy commit");
> -	igt_subtest("plane-properties-legacy")
> -		plane_properties(&display, false);
> -
> -	igt_describe("Tests plane properties with atomic commit");
> -	igt_subtest("plane-properties-atomic")
> -		plane_properties(&display, true);
> -
> -	igt_describe("Tests crtc properties with legacy commit");
> -	igt_subtest("crtc-properties-legacy")
> -		crtc_properties(&display, false);
> -
> -	igt_describe("Tests crtc properties with atomic commit");
> -	igt_subtest("crtc-properties-atomic")
> -		crtc_properties(&display, true);
> -
> -	igt_describe("Tests connector properties with legacy commit");
> -	igt_subtest("connector-properties-legacy")
> -		connector_properties(&display, false);
> -
> -	igt_describe("Tests connector properties with atomic commit");
> -	igt_subtest("connector-properties-atomic")
> -		connector_properties(&display, true);
> -
> -	igt_describe("Checks each property of any type with combination of
> mode object with legacy "
> -		     "commit and make sure only valid properties are set to
> mode object else "
> -		     "return with relevant error");
> -
> -	igt_subtest("invalid-properties-legacy")
> -		invalid_properties(&display, false);
> -
> -	igt_describe("Checks each property of any type with combination of
> mode object with atomic "
> -		     "commit and make sure only valid properties are set to
> mode object else "
> -		     "return with relevant error");
> +	for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
> +		igt_describe_f("%s\n", tests[i].desc);
> +		igt_subtest_with_dynamic_f("%s", tests[i].name) {
> +			if (tests->atomic && !display.is_atomic)
> +				continue;
>=20
> -	igt_subtest("invalid-properties-atomic")
> -		invalid_properties(&display, true);
> +			tests[i].func(&display, tests->atomic);
> +		}
> +	}
>=20
> -	igt_describe("Test validates the properties of all planes, crtc and
> connectors with atomic commit");
> -	igt_subtest("get_properties-sanity-atomic") {
> -		igt_skip_on(!display.is_atomic);
> -		get_prop_sanity(&display, true);
> +	igt_subtest_group {
> +		igt_describe("Checks each property of any type with
> combination of mode object "
> +			     "with legacy commit and make sure only valid
> properties are set to "
> +			     "mode object else return with relevant error");
> +		igt_subtest("invalid-properties-legacy")
> +			invalid_properties(&display, false);
> +
> +		igt_describe("Checks each property of any type with
> combination of mode object "
> +			     "with atomic commit and make sure only valid
> properties are set to "
> +			     "mode object else return with relevant error");
> +		igt_subtest("invalid-properties-atomic")
> +			invalid_properties(&display, true);
>  	}
>=20
> -	igt_describe("Test validates the properties of all planes, crtc and
> connectors with legacy commit");
> -	igt_subtest("get_properties-sanity-non-atomic") {
> -		if (display.is_atomic)
> -			igt_assert_eq(drmSetClientCap(display.drm_fd,
> DRM_CLIENT_CAP_ATOMIC, 0), 0);
> +	igt_subtest_group {
> +		igt_describe("Test validates the properties of all planes, crtc
> and connectors with legacy commit");
> +		igt_subtest("get_properties-sanity-non-atomic") {
> +			if (display.is_atomic)
> +
> 	igt_assert_eq(drmSetClientCap(display.drm_fd,
> DRM_CLIENT_CAP_ATOMIC, 0), 0);
> +			get_prop_sanity(&display, false);
> +			if (display.is_atomic)
> +
> 	igt_assert_eq(drmSetClientCap(display.drm_fd,
> DRM_CLIENT_CAP_ATOMIC, 1), 0);
> +		}
> +	}
>=20
> -		get_prop_sanity(&display, false);
> +	igt_subtest_group {
> +		igt_fixture
> +			igt_require(display.is_atomic);
>=20
> -		if (display.is_atomic)
> -			igt_assert_eq(drmSetClientCap(display.drm_fd,
> DRM_CLIENT_CAP_ATOMIC, 1), 0);
> +		igt_describe("Test validates the properties of all planes, crtc
> and connectors with atomic commit");
> +		igt_subtest("get_properties-sanity-atomic")
> +			get_prop_sanity(&display, true);
>  	}
>=20
>  	igt_fixture {
> --
> 2.43.2

