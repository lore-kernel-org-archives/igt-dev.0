Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6DCFC72A8
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 07:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B5510E079;
	Mon, 23 Mar 2026 07:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wqq0DAHX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C91610E0AE
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 07:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774250956; x=1805786956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yyaj4vX/BQRoNLHmdWhr/mfCCAFFRi2nX9pHdwgt+6c=;
 b=Wqq0DAHXNxoO/kiiJVesbI2kshHvZSUX909AyKv6hsAonkt+eGzdZmWE
 qQINwTOpu2Kncursdxfv9CToN6l00mPojkXJNJXKK2Bp3zFXEfkTCaAll
 6VflRI4yue5jFZE4zywxGsKJwYuU/mMEHOfx6TWHsTPm4RZK3NRUq57Xn
 pqaTdBl+jfDPyKjpdXKyZfJQYzLSvskNyP+IzMk0MivqEUwNHQtQ43w/k
 R53KeAUFpY0wdI6ShYsL+MFbD1yPZAMRCNDpHtJCRvbNzEJLHOlpt9fZD
 UURcDpwtc/DKhXIRqAEuiTvvwqP0YMK59ybQJDiZVfemESr82kBZ8LEzI w==;
X-CSE-ConnectionGUID: oPzA26EmQ6yHn4Tk3xiCQA==
X-CSE-MsgGUID: 2wuxqITNSMu2Y9jIGyGUTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="62800813"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="62800813"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:29:16 -0700
X-CSE-ConnectionGUID: v9EwUBb/TleJRwuosYLLBg==
X-CSE-MsgGUID: A7+ntpVlSLKj7s2um8tg3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="228666833"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:29:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 00:29:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 00:29:15 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 00:29:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9XJEaESxbVKxBJHeqhJZ9UX9d805CRhw3siJQo2IBQPiiRvPrUCXZ9Pi2bcyuXTarFABP7nxDLTEUuM+tcPYVLG2dwLFLzOvtpSb9o7l4i4OAzuTq0vXuXqzUd57SBUom8J4T4Z8a6giJyhzQIcjREisWOYhTG4eOkCSRkt7ZQQSFsF6Ckpkko2fCIALNmlcPw+947psm3Dv5aS9zKLHnK3bn1CDqC8zJyv9NdZic/wY9f0Q4l383o9G/Udjeu4SXtdgJr0ptWa6pYLC+9lTdL6/M3FmI3fP04Z5yBNd7d7cEtnJ/UdpAjhbhJmKZpYjZ+u8uEEM81vfQ3LFsT4EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izfb8e/QwB3YZgQrq+kx2fxK6k84lx4ZhBtUwzMgEY8=;
 b=X23BBkNEfm1B+xCRXxvp3/qKRpbMikDtPcFYgGasAPdiFuXPEdCqhP/GEmAxGDm5JSPiRE5BkBbLkagDxQeT/KRWtsdCntyrwztT31GGg7XCiwsfkyIajaBjxM3bR3mNyhgy6s+L2/xI8BfNzDKo34mHV6P+EJUdW5+xXsGagbCElFcIB7dp2JchAh4+LgdQKdMfn4wPAzzNtoffyVciTuzUkq74q+oW5LkwNvFmOrgodAaRIqG9I49e2ZeMp+bLEPouQzT3Q0XtKj+mfoIBzEdKuJKEuzAGtyzVlMzsZOmPW/W+QNGuV1O+Q2hPf4Ki7GPby1xi0IU+WuEV4j5euw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SJ2PR11MB8346.namprd11.prod.outlook.com (2603:10b6:a03:536::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Mon, 23 Mar
 2026 07:29:11 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%4]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 07:29:10 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_sharpness_filter: Use stable
 non-joiner mode for joiner bypass
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_sharpness_filter: Use stable
 non-joiner mode for joiner bypass
Thread-Index: AQHcuoIQJUG2aJsw5UCZ49aRZekuKLW7tq5w
Date: Mon, 23 Mar 2026 07:29:10 +0000
Message-ID: <IA1PR11MB6467222C2F24562B961BEFCDE34BA@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260323051049.2627387-1-pranay.samala@intel.com>
 <20260323051049.2627387-3-pranay.samala@intel.com>
In-Reply-To: <20260323051049.2627387-3-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SJ2PR11MB8346:EE_
x-ms-office365-filtering-correlation-id: e8887b04-c4b2-46b3-98b2-08de88ade020
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|7053199007|18092099006|38070700021;
x-microsoft-antispam-message-info: 0qn9smPMIWhQ6wQx4pK+Wp/zX8j64223bymMKrAHV4X/3nOI7VAFdp5p5n1XEu9SHByELJ/SK0icPKHapWy4PBG8S4dg/8jtoM7D9PfV1a6XEFl1zUCi8zktAG0GL/rvHjlzlCJy9O2MRnAQSz1NYgNiULrsPP8kEESStdl/iJUwE5593e9fCmnyhps0bbOjY9/YXWthtkJgCS+z19KRX0mpCkheGvTOXfDByoiUCBLmEgiC+daHQsrET1GR0rHyAynNLw2MdLTUqVTghUiCumn22cRZ0tssjJQhCOg091tc/m0J08ltNFCn8vPgSu0m3HMe9r7Vksd5Fc4bDeZcSpBoxvg+nsbErJSDGIYDrGI6YY6fQLAuW2OZx8E1Jd2wzhbporyX9D1ug/GTyeoe3LuKmylJ1Ey44w4Act93sX3FRFEI8WYTCYy5jEfsAzQemazY3x2ZwAdE8cgi+Mho0YpU6SMeOU4xxSEgrvTw5OZllU/2cIwz8tourF0x/uJTTZzy0qpo8L4MzZ/o9wBS7Kpf0n7+XMrqglQPrc/aPA4uNqI43NyKme2f8I9WHVvj61w2HBqiu2F5uHPHcVPNOrfThDSBDYmY9gc+UHvGjrc3eTbv2JTnyE0Ig87MCIxA3RWKjSHp8Yp4BdYqe0qqfajk8rGWQ47bXplJJU2okaSg8DcDGw0PxV3Vs0Vfky7appTJ4YKTqrsf5SXWAueLvTo/+mV10HGxufdlvshiN1f69SCKm9dxHXh4DDe++3eIv0mAWUQzSkYg+xqBvJVqAQEjlxuuZgaFQqiAJLNdw1E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(7053199007)(18092099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rPhpj2AVtbCBY21Au394lRp7BCB35l4vtjHzrS/ld4AJ4oIZxkTbDx7iT4J3?=
 =?us-ascii?Q?vdKVEWPbx8KqeLgorkGmBf5JgjnhmfgikY+FlYeoaaRYwGe5h64Wb+VSBFHy?=
 =?us-ascii?Q?TR39OVcLHCvkM4iTqJrqjizLT9Cwz2yxQm0AAZzG7BKDO+CI0N8HwyRGzB/2?=
 =?us-ascii?Q?XA9N6iPZigAtZuo6y2MiqrD5ficOG9Fkalt1CDltAjo7m5BbaRf2gTgA4I+O?=
 =?us-ascii?Q?6jD2e8vUFP7Ucfa9NgYWtr2yXZZ6ofkOzZYpEpANOdHh2oCzxrArWEhhniUP?=
 =?us-ascii?Q?QMdweQXJ5jWBSVpu+qzvY5u+VNpjyTMd/gKQBDn5oPjdFjcEhljVVnWFaxq3?=
 =?us-ascii?Q?8FU+jbl6Lrbt8mbxNJzelca4O1rbGACTTfYzYT4iXE3pnE4W5vUFPYayLJaQ?=
 =?us-ascii?Q?M/AJlxTIjTPW1OyhEXOdEtU+fkmdmzVKYoPsYZEWuj6igOCYJz/52LmklBW3?=
 =?us-ascii?Q?s3dsoQniaedyC1q1d2S7IiDP3q2S6rGmA7mpRg+4Uyz8IMnC2SY5wCiP18Cr?=
 =?us-ascii?Q?8JoG9Jb4tiu8/0jkfUMC+ahImSkiwMTrzG9fUaFf0c+2aivDo629eZQ/0Ns/?=
 =?us-ascii?Q?wGeGebVfgbvEdENeCX6icVX9P1yGZRgISZ524lytEQm+ateL/ui0Lw5rQkIV?=
 =?us-ascii?Q?UCRLD8rKTqMd0vcbywqdmbjL5I2y9c/xxYjVQLD2U02ZQhx5N64JhYDa+fVT?=
 =?us-ascii?Q?SEnBPSlfNIFZFA7QaL3CtVwRroBQQEKpwpMkiP4MCOmzaFa7T0/IKcmfCyGT?=
 =?us-ascii?Q?JrYxsYzBdgBYalCEj5U9gzBgwDEApJqW4+me7NGu59R8n4hlcjNGld6dMaSF?=
 =?us-ascii?Q?k6fMhhKF5GE2MdDj2Q9sxPR7mHfsrKNxnpxHq/z0POUVTfXNezTAB7huI5Ni?=
 =?us-ascii?Q?nFGdLR+/lB2e8Dv2+QOkK6vFAcrfpi8ntVFuujB4jcQTRj+EMim2isTreJfu?=
 =?us-ascii?Q?/bw6V1VgxZcRrTas/rb47QpW+64fkLkJyFl3tPAvbFKezZGp8CidXn7+tK2w?=
 =?us-ascii?Q?H4HAeGrwhbg6+4X/U6QaJhWnk8DTM2pnPzGVPdE3YEj/KCPJxqopBBgV136r?=
 =?us-ascii?Q?DNoCYhKzG3MOj9OCtghoZSVuWe32+axP+JvrDCqyXbJrl+FC8blxKsAc4hzi?=
 =?us-ascii?Q?DinL3wZKY20lFyUSsVIkugo8hpReCl4w24+px0RXPGqAzzeK/Zxgn0MVME8I?=
 =?us-ascii?Q?DWFXC112jgzw1UYmj/5GPdt/mRunRRfeH6pHPYeZYWYy7fLRU1SAY2GdhkCS?=
 =?us-ascii?Q?SSJGoEF1CBkVmt9T8ESPQrZQALSbAk01wSDhVRveecGcN86n+EozTJlcUOOk?=
 =?us-ascii?Q?bVCAyRM6cpWoza5E5BjNWsy43WfrjPhSgB9WWTu5LCEOnTG/1d8ymbJJdUaF?=
 =?us-ascii?Q?lDCK2dJJ2n/ffeyIzsuAlplhvnJSvIbfD8/41ITHkE7ybvDcqFjEv0KI1LPa?=
 =?us-ascii?Q?mjL7Ph5kNpCBn5SIMStHs4QOhNdHwtvDUGNo/3sAPHEyea5FqDIRL4yxTZID?=
 =?us-ascii?Q?7uqQqQ4ndkHkv1Wt7rVuCVFqd74oqc6AS684vhqsNuxY68Onw6D2coCFjJHl?=
 =?us-ascii?Q?XnSVoBHPzCYBEjYR8H2OBgJmvnGuFQoPgYae5I+RJ3FtFVQSMby+5l7+43yB?=
 =?us-ascii?Q?4R20EnQwA24in9tnvRtI5SQdHBWiWoHAlWd56pMRnzuL/2eH8zFuSTpkiT7W?=
 =?us-ascii?Q?YhotVxPmBzRSV1gAEhx5ok0nRuhemJaCStVVKj176amaMkHPuEeYBkgjfwLK?=
 =?us-ascii?Q?ed6Ozs/KLQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AMjFXASS6LTLXd2B2uPJ93rRsB4xUOprIgxly3SjuvDI2dNPMXpZOKLnL8RxyAuVWciXW13UTbAuaHRNa4ZabHgAKGEaZCAElp15qiBqxlH5psKx+lDJ/Yc4zn1Y9aa2/0hQCmaPKsnxhxXzPApg4v7CM73VNNSZDONA8U5GbsFDURrT3wwDDpAATzp3/zqQSy7c50bUKZTrMgRMcUzaHLvgHosE8YvoHEedxqYHc6r2PvVJN9/UbAiAlSHXNuI3ML5iZq3A+/iuj90MBixBtKRcC+EjV8UrCEZ9ygKuAR36owyMn7avXynEYjCyrSbIrYTRrOD2gdFHYrPRxDrmHw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8887b04-c4b2-46b3-98b2-08de88ade020
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 07:29:10.3931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJbD+jZ97MXshVU+iwah0avGHDP6Vabbwf7ZYyZCBjr2Uo6EyJzn5GQbTAV9GlR2iuu5rHLUWztVLWejZJKmHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8346
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: Monday, March 23, 2026 10:41 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/kms_sharpness_filter: Use stable n=
on-
> joiner mode for joiner bypass
>=20
> When joiner mode is detected, fetch a non-joiner mode into local variable
> and store it into the caller-owned copy.
>=20
> Also override the selected mode before commit so the programmed output
> mode matches the mode used by the test.
>=20
> Fixes: 10dccc7fc82f ("tests/intel/kms_sharpness_filter: Detect and bypass
> joiner modes")
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_sharpness_filter.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/kms_sharpness_filter.c
> b/tests/intel/kms_sharpness_filter.c
> index 96fb139ae..881fab746 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -430,6 +430,7 @@ run_sharpness_filter_test(data_t *data, enum
> test_type type)
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
> +	drmModeModeInfo selected_mode;
>  	char name[40];
>=20
>  	for_each_connected_output(display, output) { @@ -438,15 +439,17
> @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>=20
>  			data->output =3D output;
>  			data->crtc =3D crtc;
> -			data->mode =3D igt_output_get_mode(data->output);
>=20
>  			/*
>  			 * FIXME: Joiner + CASF currently unsupported.
>  			 * Remove this check once support is implemented.
>  			 * Until then, run on non-joiner mode in joiner
> configuration.
>  			 */
> -			if (is_joiner_mode(data->drm_fd, data->output)) {
> -				data->mode =3D
> igt_get_non_joiner_mode(data->drm_fd, data->output);

Hi Pranay,
I guess instead of retuning bool value we can the pointer whether NULL or n=
ot and then assign the mode , something like this:
If(!igt_get_non_joiner_mode(data->drm_fd, data->output))
   data->mode =3D igt_get_non_joiner_mode(data->drm_fd, data->output);

Thanks,
Nemesa

> +			if (is_joiner_mode(data->drm_fd, data->output) &&
> +			    igt_get_non_joiner_mode(data->drm_fd,
> +						    data->output,
> +						    &selected_mode)) {
> +				data->mode =3D &selected_mode;
>  				igt_info("Executing on mode %dx%d@%d\n",
>  					 data->mode->hdisplay,
>  					 data->mode->vdisplay,
> @@ -463,6 +466,7 @@ run_sharpness_filter_test(data_t *data, enum
> test_type type)
>=20
>  			igt_output_set_crtc(data->output,
>  					    data->crtc);
> +			igt_output_override_mode(data->output, data-
> >mode);
>=20
>  			if (!intel_pipe_output_combo_valid(display)) {
>  				igt_output_set_crtc(data->output, NULL);
> --
> 2.34.1

