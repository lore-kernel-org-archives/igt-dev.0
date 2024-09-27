Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531E6CEBF76
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 06:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F5F10E1DB;
	Fri, 27 Sep 2024 06:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxx11Q3r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C8510E1DB
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 06:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727417662; x=1758953662;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eLjb9W+LLNk0KkkGVmo4iEKdczDPhiONPWADaYqhNlw=;
 b=mxx11Q3recSSBUYNSCipNrW8zpWb2+k8LzTJidCU6JN3tc6E7pkB8BdK
 Np7omShzG9VOoGKKDuydjfqfqGF5PGp+ApMyTkiTOZ5RU+GAQ3FQX2qcY
 YKsza1fhqHtcrZW7Y6GZtlvrvTzRuuCu84RfK6nClYu7FGnlheIdhSA0H
 8m4bulzJKEQEi5lV0oJMMM6mCn67OIHKT/wku78R5hAafHJbU4cj4iK+T
 IEFWCA7dLdtA1koDsFrguIYFj1X0UoDrdpnxK20DA1PD5n3oIz5Sd82tc
 Yep5z++iaTCT+7QwdIGT97QqegaDsQN0MqzhykifWAer9mo0MevuPwXv8 A==;
X-CSE-ConnectionGUID: t4K3d5IyTRqS6lUj0nbGdg==
X-CSE-MsgGUID: xwNVwyM5T96WoPTUuO/EWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37131218"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="37131218"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 23:14:22 -0700
X-CSE-ConnectionGUID: NAb5BI4zQC2rbSK/VcHnVw==
X-CSE-MsgGUID: hnMNvLuGR/++Le8x23VAYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="73216621"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 23:14:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 23:14:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 23:14:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 23:14:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 23:14:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFrVZL+blQIX0pGkIAfEqSivCiQxFruNmx6Anu2+QBp2JhB8pDe6NMDm5RJ4RV2Uc/y8eC598O2QZmIVg72mlvSkaqS+4U6XZsoVprhYVmy/vYQoXeRi+ken8G6Upn7Gkoj/wafyqHEbYfLdHRtbzXOfn7Na5H0waZAqDQ+8DO9HR+ES5IBA/jeznO3Wje0WBh/kCpoMsrfUItdQekxMGlRv6mya7PIDrk7t0tPvY9KsPEl/Ece0iMuDE+CYmnqiW214T9qaEu722iye9hK+ntSqXbqF8Tca08vKM7HgnAX/kc8cGH52fAzDznPQyJviRDEkLubYRPP8YKPskva25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHpKXo15jSU4GgpLshlqtA/VJgqwECo0xrPYOkWswvw=;
 b=XcfeavNsSsr/nXTvqDkTV6wqRQD7TpclgbTvRMrr54MRptXxpFXx8o/637PjZNmd3ahBgo6uX0Z8xdzffakOqOLtOT7xG++onstpU6Z1n9zfoQfrlqZMIkBv+hbqfMMk6Faz5mSz6EhEQy3s60AdgS9lLbNW4N51Mvik+Ql71ohC5aMvkUDkJ4XwOJIvCthAALxCqOcPI65XUMiAi+GeMh3tzosUgLKF4PSFtlbETzIh4Bh+y0y3BApX0pqvWPLur4ViKBs6s8X9QB6TgIH5+gx71ccIdL543ZPSve6JHmZK0RRUcaHDuy0Xjcu5D83Iw9dB/gxrDzTIpYxh6GPycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH0PR11MB5783.namprd11.prod.outlook.com (2603:10b6:510:128::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 06:14:18 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 06:14:17 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_backlight: Remove eDP check for
 backlight
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_backlight: Remove eDP check for
 backlight
Thread-Index: AQHbEEzFdTbGFvPbkEultw4pixyz7LJrKB7g
Date: Fri, 27 Sep 2024 06:14:17 +0000
Message-ID: <DM4PR11MB63127A03A41DE28796222DCC906B2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240926194507.701146-1-mohammed.thasleem@intel.com>
In-Reply-To: <20240926194507.701146-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH0PR11MB5783:EE_
x-ms-office365-filtering-correlation-id: 4ad8cb54-5ebc-478e-d292-08dcdebb9e7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?v8JvKkgSe2bCLwZYA+Ky09Xz0+XI8ql679pKneFa5gzbt5ymnt42W+ds46B5?=
 =?us-ascii?Q?VF1uvkcEfIB2bTt3cQKkAw256gmLkLUhSTk/MNr0G5PPoIrJPxjLX6wMSHoz?=
 =?us-ascii?Q?m1bByX5yykVJZ6bqDz6nsmTMfxv/XP9mFucHpQpPiVTIXHe155S+2pkyKZlA?=
 =?us-ascii?Q?xlk3OnV5HksxEw3FUonXC8XqZ0ILzVkcJ4D7N6cZ3dxlLPDlP0Dg/xf/x3Tv?=
 =?us-ascii?Q?PmZerbPJjrZ3EIdBKKJoKAn7YozSjkUduGVOFWamogxOz0rwsmqjNdQnLkNd?=
 =?us-ascii?Q?qlInYPBjuti9MuXhp0HCKWhwccG6gFmTaXfl592y7NDggxj8GW147C5DQWQs?=
 =?us-ascii?Q?C94OJ9jfvzNtuLxt98mrsV4aupSus6YoadmoBuBPraFMV3WLGwiIcHpCz0h5?=
 =?us-ascii?Q?oxLTdI/c4XtfYH9PQ5uoIwat+o/eWHUwdugnDOKTIviNFU5NTZiUvfz6vYv3?=
 =?us-ascii?Q?yAL7TUTcEapBkwr98mlr3FNVjb75lX/bij9hG69DXysoKvk2IjmYPdnq4ky5?=
 =?us-ascii?Q?HyhZ4257l/EeMU/xm2akhNlghBoJZ7PExbCYMuzoCHziPsK5e04bnrOiXCFQ?=
 =?us-ascii?Q?gRyZftH20V/a2+elJyKdsRoheMWK5qW7k0zjJCooJidBHnVD16QJEcIOHPMN?=
 =?us-ascii?Q?EQ4iLOgxXcPYodX+5i1NQI2z871ZTl+oFMlz9L4IFCoj3xWgAjFndSOL3HLg?=
 =?us-ascii?Q?O9/6MAsOwDyXQlBywvaVkRs1pzMqHBSi4u6EYdaPuDti67qNNuq3kWbOIXRV?=
 =?us-ascii?Q?mQCPh0Ulk7wZ5b/ClF8l5MVefkO35p9Stf2pS0qMM1P3+iCkDwzwbCVx7Ij9?=
 =?us-ascii?Q?UBmH7KwYKJYQoRW1QDpf8COHedC+8lEygMu6y5+Sxny7DGsnF+mrGrqdC0Wk?=
 =?us-ascii?Q?FwRZjjg64mQ8NZdfIQmiLbeEJe3kRYeHa7tuDcfyQp8vV5E0Y6zADmhMtpc/?=
 =?us-ascii?Q?zLEY2ipkjUOpRJyHWfGwcs6K7CZmNcfATNMaZoTpkWQ4Xm4mDh3Jfm/xzDPt?=
 =?us-ascii?Q?NpjXQWBOx0IvQUJPJzDp0ca/kYSJswx2GYGzQrrvKHrl0Mz2yreJbwASMa2M?=
 =?us-ascii?Q?eZJ1T9td6d4j0T0cWKHaRUvY0RJV8I7IEwxLEoZB3D4FSQrjCCBVHOSv9s6U?=
 =?us-ascii?Q?jV7loOJcFRLP95wtFHe0nhVeGx91WKWGGs9VnTfHZXJowI+CokrY33TADBFr?=
 =?us-ascii?Q?cLwjAes6Ux4rMOAJgWuybW0CHE0SlmtbItzCSkD6Y8ILLqbbf9oW/vXKAEot?=
 =?us-ascii?Q?8ZmuhzGuINuvvixxXumf2UnCZEyt2SJeNjfHp4lbkqoA5m6300H0I5yir96n?=
 =?us-ascii?Q?3Qo3defL+JGE6gA33D/STein5Js93d0fCr0Rk3PZEwW1LA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rX/YJ0gUXANBpmiHzXhzJr2nv8xoV6sVpYOg1O6aglo8Uq6HKF8RR7bwtl23?=
 =?us-ascii?Q?vPT6lTdq44bSWz6OvQi+hn1jqb6MeXBOBsGWmdpQBt55hAUFHeViNiOydcJw?=
 =?us-ascii?Q?MIn8b/Gr/4eQu2PRB6CupZG4PRO7SFJRTmaniTL6/7zjab4qXYKpXCnnoPe8?=
 =?us-ascii?Q?oWRRtV0jWTxhQ/lNx07a65emetEMYHb4A7NVJAwmygldNZpzst8+YoeNOGgK?=
 =?us-ascii?Q?/oZLL7vcYVNmqNZMDiK6GT+dmLk+bVQTBmX6g2WdLpBazTbGCLtF4mA3bO5G?=
 =?us-ascii?Q?fbYp+LHyxdNCgrLwNJs9tpsImvWRM7A1BeP0ffBnlZ9prPQROSVvyOKmxQtY?=
 =?us-ascii?Q?m3zJjC5iMmKGX9ugJTqh84d0dJVJ8Fho1Cg9SYRkHEGb/1SaS4Qn+8jEF96i?=
 =?us-ascii?Q?eufU5vmkEhqlvyEcCCiOG5xiUBVTZBw/PbNwaCUZzx6Rvfv7R+h74B0uCxsA?=
 =?us-ascii?Q?zCiVwDzq5h14le7lKbI/ub5bWxT3EKEnkRTTU4mwyaP0G7nCZVGiccVMYtcN?=
 =?us-ascii?Q?ZwNYDdDUd9HAz0qajNb8IB7cOhM6swYBe4pjk1CiRpqdfglj7DEiIGhjpsH8?=
 =?us-ascii?Q?d1OJCpOfRS7VfwK0gYIGHeydB3x3iXpjTtF0QQc7f5qdtrbGS5nbtIzC7Oc9?=
 =?us-ascii?Q?22AY3GqVlZ2juR/UQcc8earQTAYCIBGsmWAoc2Y1RZND5Rhhay4c9kY8h/GY?=
 =?us-ascii?Q?wXLU7329G6CcHWFUscQLSbzpxrBEPPD6oRZmXvmJPaSdAEDkeoKrlSdC6Kgt?=
 =?us-ascii?Q?fRo5csiY7rqgcWjsryu8A2zjc8jEz+3ZRc8zdEvN8zk5TFJvSn2GCfOQOQMV?=
 =?us-ascii?Q?pxuN9G93lLnFn+WOmhrHOOm56h48Ee2sR+LhcAW1be2HHwvx8WnoMby0CD4K?=
 =?us-ascii?Q?bdiUlGYwlZyS0SBXhkOtipktN6xLRHiLxjOlEwdTC7yhc64JKY/4OHwMS1dw?=
 =?us-ascii?Q?qD2JJvu01Kjz2B31+3weMWuaatf7OUra8Lbwvw4LAFr8V3eXn7aTWC+BT757?=
 =?us-ascii?Q?DtWiSCvujDLaw2REJ2FOO361KXeF+VB29+s6wS2uUQCrIafNu2uHrT1t1kvR?=
 =?us-ascii?Q?KuufexT++qAP86kuIV/za5aEKLzJSWqBxviqhYQmFFrRYu/l6/dX6n2umCap?=
 =?us-ascii?Q?D+Kbw8d2v6rHD8NE1TYyEwnn6+L+pcL8dMb17Jc/ScArvIUPiCbd/xnbZq+i?=
 =?us-ascii?Q?rvYmlBLQH5f+vCNFsJKu8MfVPNjVm4qCfTm3m+uhmXRnZZL2Na7jyjKUO3c/?=
 =?us-ascii?Q?GdlkhlSdO1080bBcTL5PX7t8kJV9j0ccv+Z8qVa1uyZiptNC+lPnbIBiEl0M?=
 =?us-ascii?Q?6Xgf7GTs0tRFhhJRz8vIG+5TJce5WTEqngjSUWi1WeoF+U653/xq9UOc0cxM?=
 =?us-ascii?Q?JdxVbX/r525iarWmIijct5u8YY/Kc77CTwXHjjyIIq79/XSoRmFV4w7SICNp?=
 =?us-ascii?Q?yc+MkzL96AT2E0FMOimCBUkGqATNAgLQTBTIEK8KhW3gs6dETMjm6FaY++UO?=
 =?us-ascii?Q?55VLPgbLTwMN4WgJxmlwC7RLBSgViOcX4snFDhAkmSEufhkC6mOEGi0Rsm+b?=
 =?us-ascii?Q?9RHSFs1gdSngH/rztOA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad8cb54-5ebc-478e-d292-08dcdebb9e7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 06:14:17.8675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MGTz4+6DBZgwEB7ZuIerZJe5V+UEoyoeJDOkR6I/kAQtzZRsBJ9dNrAGiyzKmE+vD/PjEaHcAvjY7D8Qycliyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5783
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Mohammed Thasleem
> Sent: Friday, September 27, 2024 1:15 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_backlight: Remove eDP check for
> backlight
>=20
> Backlight not only for eDP, it should be used for all internal connected =
panel.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/intel/kms_pm_backlight.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_pm_backlight.c
> b/tests/intel/kms_pm_backlight.c index 140a95bcc..6f1e24bac 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -292,7 +292,7 @@ igt_main
>  		igt_display_require(&display,
> drm_open_driver(DRIVER_INTEL | DRIVER_XE));
>=20
>  		for_each_connected_output(&display, output) {
> -			if (output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
> +			if (!output_is_internal_panel(output))
>  				continue;
>=20
>  			if (found)
> --
> 2.25.1

