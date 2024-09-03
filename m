Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A2ACD13CF
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 08:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFE210E333;
	Tue,  3 Sep 2024 08:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+YE1Zww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0955110E333
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 08:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725350915; x=1756886915;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XwRLpfzCc5paRGYU7IV3oErjcDiE/yejwC2gTAEmJYo=;
 b=g+YE1ZwwR8Uus7LSumMUTy/yGt8dHUFhq1K3ZS1/5bj6PJsVTEk62cjj
 J6259jlG50fw84iJvX9cPOZ7XCpTK6reyfMOOd7qMgi2OfOveUI+qhYXo
 QJJZFvcmaYddch3SJFuk/qB4Gg1+Dtok72ThmKPoFZFBR707caccBllS3
 5QgqbYSGNJmsqCsNE0yVGAgZAfJJ9Kq4w4sO/95bMkxmtJ8XPbQElCIsf
 S/6h6anm2x5QzJsBbrD+oslZru3n/3nIttuHvg45B7vSuVqLlhWxG0OGs
 D8cPTcmcaRtRqpCaFchUYjh5tajKeE6FnGbqz7fOsc0vJ6HtLCq0dmTGC A==;
X-CSE-ConnectionGUID: UA1V2yrgT0STd/NVywWRfg==
X-CSE-MsgGUID: qmrOTrK4RV+dAZyjvPWUbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24070484"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="24070484"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 01:08:28 -0700
X-CSE-ConnectionGUID: mqa8tfD+RNew6IPdV/ahbQ==
X-CSE-MsgGUID: KnGViCk9QL2/JZ6RRJYykA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="65555088"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 01:08:26 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 01:08:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 01:08:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 01:08:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWzY8EZ7hdIhBN+YHkjsAx+65zuwEmabDHgqF7zWfoT4jUSQePBorZrgZtzu/bDMrA4KAlYqSt7i1uLbBTMn7bHevxtHxhjutiYfdJB0lX4IZYxj2VHilDriAFkw+WDNkvIQ9TpeVyxyt/TDwimJ0IGDF2KuHyMuKUgVnR1hreHMRjK2yTB3xg5UePHqhuDvRXgLTdImm+HSAIt00e6VOeatJnGJVx4pcFxVhbG8llvLHVDL08SCLJciaTGswoAV6yeNHtgJhZ+eaBm32nscnfPvCIuhSWHxrgnJGn0sfobM1e+yA58Diqm5B+vsS/eXpXxofM9ZwOKg6ZYQYegmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HXf7dSW7ips6oJDetwUafJdljuP0l93dkvXQ43RN7g=;
 b=eZXuRKZE9TSlk4k7z77JBH6zBdXif4G7+uY4p+vgLCtAuNcLn6eUqB4g1oDQsn/eXdcyZAw+GU9yUsVM+ToJ2uRrViMQxjgujD3CaWfJp4JBJvq1up4AgpU3T5ZRiD/u9PICVMpOlkV4psgjhWehe9A6B8gup8WGCmc0HBA+8B57iLcO5mDCRcqdSk56C69f6sISISh83mTfeBIffyvxWoH2whknr+2O9Ugd5M/iFdlA9ZsVL3mZ6g2ayPYI+QxNAum9Vzm6k/IPLOyeCDFIi9QIohzah23nOs/2LaneCxQJ07yZFyYOSg84VGZlOJAq455sAzrWcuWOkWPQoChy3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CH3PR11MB8517.namprd11.prod.outlook.com (2603:10b6:610:1ad::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:08:23 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%7]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:08:23 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 07/14] lib/igt_kms: add function to check force link
 training failure support
Thread-Topic: [PATCH i-g-t 07/14] lib/igt_kms: add function to check force
 link training failure support
Thread-Index: AQHa9xkDFc6HKy9PK0SJw4Lh80OtJ7JFwnOQ
Date: Tue, 3 Sep 2024 08:08:23 +0000
Message-ID: <PH7PR11MB60538224E81AFA721F6B236BE7932@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20240825181424.4034541-1-kunal1.joshi@intel.com>
 <20240825181424.4034541-8-kunal1.joshi@intel.com>
In-Reply-To: <20240825181424.4034541-8-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CH3PR11MB8517:EE_
x-ms-office365-filtering-correlation-id: 99bd4c87-82f6-4a44-24ec-08dccbef94d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?wGRtxoAPpxoEaEpxGQD0ZFz7FOlHv3rMj0bM7Zo4z6ebUicbVzm/tIMeATrZ?=
 =?us-ascii?Q?kuwnDdrhm8tpbNrJiVbN0AViy3refOB9I6NaQ1cxkY40mHGzdCyJ8qaa67ja?=
 =?us-ascii?Q?MQfojsD7cy7NdL7lxbtj/ZL76AqFb4YeKZILtR0nfxhPMmStPQd4vdNmpEaK?=
 =?us-ascii?Q?gSj8mNllzPbkxhEVQNTZdM5RG4TUwG2VoSZ16HuUs75u2SzvIvek2CPdf6E5?=
 =?us-ascii?Q?ueTZHw6qQar+unXSh2s9dldIHINZTjEwIaJUXW6rhmvw4ReCUzXBY0wcnYlQ?=
 =?us-ascii?Q?1lF2U3QDGsHhOneJBizBXa8UxyYcWygDgDQDnCYnjsehBqfDBHajkB2LJ0Rp?=
 =?us-ascii?Q?nCIf218vTqr62TbT3X597RlR8JpWBnYpgMF/o/T7NasZ0XotjgtY3bGI9A+y?=
 =?us-ascii?Q?o1MqraGm8aQENv6S7N16vs68dpuu6UM8Y8NlUyYieh79KTHVRbM5bZxKb7zZ?=
 =?us-ascii?Q?qrDwBQ+iYrusb1AGjDsUWWzoYIL3jBYlbOLdPmYh/4XLReNZx7JnyXjnlqV1?=
 =?us-ascii?Q?3Zq/iCIwxzK+SGbkf7JNG4ZNoRyuBz2m6dOcRKD3jrB0uEe2eFddMlHTaPsD?=
 =?us-ascii?Q?uEVG4Qd0gSxVDS3+qfEiG0iR1VHuNYE1tLwtN1bav0UNJWmLYLagKyM7cwNJ?=
 =?us-ascii?Q?YCwxzMfW57YYf2DxPua0DHQTKzL56dmJENI9gstIZvz0knkd993NbbKuWbPR?=
 =?us-ascii?Q?QmAu/GwNpZqsFqGHDOur38sq2OLBMsECWmjTxBb7FoghNdShNoCnGIdFJHH5?=
 =?us-ascii?Q?NZo9XvEHoulAtnIXK8z2nCNby/2HQNA9WkNf1NqkudFY9W9s90RV7XFJZ0kH?=
 =?us-ascii?Q?z8L4sLoaBlWC8n7xtnQfonVx7g/iez2jAtOUXiVu9gW5SeQLJ8u3vX/TFURH?=
 =?us-ascii?Q?I4JM1mNnyy8p+kt4LfAVlHhlXdwj+mYjerGYPNrbLUenJSWcewp9FlYgZMMj?=
 =?us-ascii?Q?j2GkT+SGAm1vOXacHoGlYBJ4sSyI2GxB2PTv/XSRbZXCy15Zahoj9boq+ZLQ?=
 =?us-ascii?Q?TcNcWFJcuvw/1hX6xH5v/2TnLSS+77SBjuOYnVKHqQxDCqX6cI+6Z3Rg9+/7?=
 =?us-ascii?Q?9nRkgHUpZR1vkQDjf4ds2nwKLMYromYMq6ZBA0IXJczQBSnjqn56WBk+4NIk?=
 =?us-ascii?Q?/yksKFeMAhntqJTsyxlLfKGoMyUUbk1aPx3EvbOzwVCtKYG12ssEwM9F4C32?=
 =?us-ascii?Q?il5hfrvxrycNX6jYcO0boD7dLjlRYoRiw7m+fXMZS0LkhnIFaPEgMoZvOpyD?=
 =?us-ascii?Q?zcuRNvTOkR1VWat+Su9wqugndS7ZoLaxKmbLZOq8b0dLeDIKkBs4WY49ML/o?=
 =?us-ascii?Q?TjrfrGqkRPMrDACv2i1Ebsgpo7Sri9f5CdjeaSf+Rq42hDYzrmDIBuV25srd?=
 =?us-ascii?Q?ZTh9koyzPWVD6ZwcseRblRMpCmckUdhkmh6Dl/qboXERD+PWBw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h7mVTrDe/vfByUr9RhyZoiaTr5Bb703no3xHOC3pPO+JDC+MUmEZhl8qDFkg?=
 =?us-ascii?Q?ndQm5ekUwfVLOckSN1BaItIobYZLP909IIkJLigQezK5AD5s2ht3TCvVe+iv?=
 =?us-ascii?Q?c3LYNJPNSlwmo25ufPbAFlAKFV0olQvHCl7t5jFMxz4jtX1HisuHsIrtZCUc?=
 =?us-ascii?Q?mO1ce+GO+jsJUWdTbe6p+3ztFLuc0a9ZmWcLEfh7kKHjFHU2kxs18jZioacd?=
 =?us-ascii?Q?ENOGazkfsW9N7g404iEvu/ad7t8wlTh6qi6knfhqzUgkCKqD1RfmJOsBtxz+?=
 =?us-ascii?Q?6+NKgsFLgYV4CL5yy0VJcXTKkmMm3mH0NoXdu2B+z40WOfsZ93ib6fX2u/wQ?=
 =?us-ascii?Q?6pZ3XHk7gPCEfGDnz/LV1W/GAeMLr/9yX3w+42FziDz4BiU3tQ3qPXSEMDzt?=
 =?us-ascii?Q?+ID8jFjyfKACCq1DUi2IPGPWLj+Ngq7sPX7ZO1g8QgXy2nXze7NWUg/jGmbR?=
 =?us-ascii?Q?P/FVPt+WVltP0o+Z8HhnS2Q+QTUk8c0u6Gw/K9GIBcsv95CZA2azIvb496mz?=
 =?us-ascii?Q?GukdoqwlOoklnxLXIZv8LdbE31OmqtuqzZbz54H8CZy8ZbBNgC92k3qQZ+Fy?=
 =?us-ascii?Q?/g32587b/kZ5ttHGJyrCoc/NLNH7EELq18w1xndYOYJf+xI7WHp18/xWb6VE?=
 =?us-ascii?Q?5Nts+8FN4hno4N5OaMrrX50EPzkg84NgGvvKQyj502xKOY1ozC9X1MM1Mu80?=
 =?us-ascii?Q?9MR10ZfZ4P095hKJCCEvppw3Rw8dQ2WWyZXCNYfmhO04rnlFkQIcp8K6Y7cI?=
 =?us-ascii?Q?aLkOaAlKoMqO/vSvcq24uvhS93B6tzbw6V8QDy0kiwR4dvSnaMS3j3Uo2TPP?=
 =?us-ascii?Q?oDqLzwEY5gNdOn7ZcSAv6pz+z/0v6+PohUt22rVitKQAJkmhmTWRhAHg+mIR?=
 =?us-ascii?Q?pFVPSQAGdvCnI8/biEfUECVMnD6mRHGmIJPqYeKCGVvFO9fdzRnADwfOQO6s?=
 =?us-ascii?Q?qQ79NM5mo09qheHkxaf9GZsz6iCpf8UkoQerV5hFkB2VBKgjUvFtKHXwJMur?=
 =?us-ascii?Q?B+tQRmuw/AN9ZTwm4X96UyIQ7jGbXTj+XdtblN8e2AXwVNy1ZdA3XlNIzt+K?=
 =?us-ascii?Q?dJIMMQ8NbZtFz0FbrKRfnic2afDcsfq0ZaitBOMn4d/AAe48tWT15/731Srs?=
 =?us-ascii?Q?H9vBPmAlt1m2lo4Pj68WU9INlEh7hfoXKptRC4N9b29gNrgPzsNfBn0NkWyC?=
 =?us-ascii?Q?GZrHy5/2ToCLV/7Y2XhokJ5Yn+Sb0EbtOUrWsN1HqUBkF/Q7ol/mJ2L+6HVJ?=
 =?us-ascii?Q?vSm9KCBMy7WzT3SNgzQ1OAAseIOUd2XM9F6+g7vv62IYgJYqScXFiXF7YhY0?=
 =?us-ascii?Q?Z+Ge08vLnHOG6Z3sh6flGf5KAQ9LvoHWa9sWT3a39Kf6SgjDZ69siByg+imY?=
 =?us-ascii?Q?E/irJ82+TXW0QAmi87bVkQ24KdGaGqViZ3cOL8AjjTWblXrzInTujkfK6n8c?=
 =?us-ascii?Q?PmPHndloyY/J5MDjxOOxBhLvHgtXgLA5swrt9HEItg5kOMH4KIOmht0hobBF?=
 =?us-ascii?Q?l4K4G7jX0WsYXAHxC4RwvGaawK5WeQHoVO86EtG4gh+zagxtPc+w8kCkQBdq?=
 =?us-ascii?Q?ip4lRfwtWvXKOlAHt2rv6AzzhbECIu5sAbxEV2gM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99bd4c87-82f6-4a44-24ec-08dccbef94d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 08:08:23.3594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MNRQN2oDMvGVMMF3GqsuxylC2YerFUksKn+XHz/2x5e2ErZdY+JLVax2i0BZVXkdQyMD1UVR9PrhE+LypyeF8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8517
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: Sunday, August 25, 2024 11:44 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 07/14] lib/igt_kms: add function to check force lin=
k training
> failure support
>=20
> add helper to check if platform support forcing link training failures
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_kms.c | 25 +++++++++++++++++++++++++  lib/igt_kms.h |  1 +
>  2 files changed, 26 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 2720095d4..4ab47e2e9 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6893,3 +6893,28 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd,
> igt_output_t *output)
>  	igt_require(res > 0);
>  	return strstr(buf, "yes");
>  }
> +
> +/**
> + * Checks if the force link training failure debugfs
> + * is available for a specific output.
> + *
> + * @drmfd: file descriptor of the DRM device.
> + * @output: output to check.
> + * Returns:
> + *  true if the debugfs is available, false otherwise.
> + */
> +bool igt_has_force_link_training_failure_debugfs(int drmfd,
> +igt_output_t *output) {
> +	int debugfs_fd, ret;
> +	char buf[512];
> +
> +	igt_assert_f(output->name, "Invalid output\n");
> +	debugfs_fd =3D igt_debugfs_connector_dir(drmfd, output->name,
> O_RDONLY);
> +	if (debugfs_fd < 0)
> +		return false;
> +	ret =3D igt_debugfs_simple_read(debugfs_fd,
> +				      "i915_dp_force_link_training_failure",
> +				      buf, sizeof(buf));
> +	close(debugfs_fd);
> +	return ret >=3D 0;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 2d69d794a..5ae324f6f 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1254,5 +1254,6 @@ enum dp_lane_count igt_get_dp_max_lane_count(int
> drm_fd, igt_output_t *output);  void igt_force_link_retrain(int drm_fd,
> igt_output_t *output, int retrain_count);  void igt_force_lt_failure(int =
drm_fd,
> igt_output_t *output, int failure_count);  bool
> igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
> +bool igt_has_force_link_training_failure_debugfs(int drmfd,
> +igt_output_t *output);
>=20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.43.0

