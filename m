Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0E2C4829A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 05:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65C110E7E0;
	Tue, 13 Feb 2024 05:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RR+WJF4+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406F610E7E0
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Feb 2024 05:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707800780; x=1739336780;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G9GVGF/kBTgqnNT0vudGekpBP2lQighvGmXnmcaQ6tw=;
 b=RR+WJF4+mXqoOzlGKwWoHRTbewK4R1W2CvtBW7AHo31JPNVlUkKUHbcP
 ksR+xhfUmj7kqCqQBSDTs3v6/Q1NWUhJLuZwfxZoWSJK8OFyCyrL/kwfi
 kaYBLbLe3sgzCzH3gJ4sU62j8ASynfDWRVU53zYxg2i0OFYRrnEJnP+Yu
 pTnikHfIOS5ABHYRATch5ZUM0kJWCqxFfo4ZyMAypC/QYhri9oOg3x2QV
 RpI9h0dyl4ea+WgpS5DXAkpjVLAnHo0ta1RVBLTjXEyoZ0TD05ZhCWbhG
 tg89sus8Kr+9JzqERwKD44QR14IwsfpR2dcbG3wxG+UyI4uqtVDGL6D11 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1679195"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1679195"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 21:06:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7426277"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2024 21:06:14 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 21:06:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 21:06:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 12 Feb 2024 21:06:14 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 12 Feb 2024 21:06:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgF815N7oDZLITk0xg5/kCarGGYMDWDq4Cycji89+x2HsxWlxrTNmg39UxlmNrTKJfnZQvRuQ3eBdNciquseODz99Kg5JNYAs0f24P16FmYuRJDxrXZExCWjrvOZPeLvAous4fe8CXsbTXSUVj3vdMaIYPO+yRZu7HjI8H573IEBS5bNkuBD3+zTqcX7zHgGWeTHYUcbieEtXc85x2j6jSiG4FG1xYHbT4cbI9lOC/fU6ped+dBUa4K9meNY7m/FGgRndNoZhsiaJkgUtj8JF71EL36f7591U6MJ57khmXcBxFCW/fki90pI/yNAtss/4W/XVcgjVadZpOzyamLMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnVWqneSTlQreVi4C0lFAQ+OlQSvombGo6Er+8oq7dk=;
 b=HIuvBqnOi2U89hglK5qomVthaSf1SXMiGACZzKIAT0sLVzkfBZdFoJJiJxFt0qbuaXQ59Ji848sJUOtTrBIDIvceNFSTYh8mgqF6CG1cIL4hXhdnEzbWNKzlh/c0XEqaQbevRUK0RZzFZn01sTf/i1xF6J71/1pazMOWiJFPazdBgsqnkUK4/DZq5jlEoQIzg+RBIqEeU6dU5A7bQEC9K4BecvJRn5zaMuvD5E5k1ijuDF4iE6tagkSY6hZAdIGGMRSIbptXPwOBLWos8DkQP/2sWBLQJgIDEZvL6E27JcxAh5nJ+SCwmYnH8enes5oRedRNfUW7Ie4JR/rntNO1Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 05:06:10 +0000
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::879e:1ed3:5c7d:2cd9]) by SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::879e:1ed3:5c7d:2cd9%4]) with mapi id 15.20.7270.033; Tue, 13 Feb 2024
 05:06:10 +0000
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [i-g-t] benchmarks/kms_vblank: Add XE support
Thread-Topic: [i-g-t] benchmarks/kms_vblank: Add XE support
Thread-Index: AQHaXcWADTgNR+de+EesaJOAMxvJ0bEHuKmQ
Date: Tue, 13 Feb 2024 05:06:10 +0000
Message-ID: <SJ0PR11MB67895F44FF50A30B1BB6ECC38D4F2@SJ0PR11MB6789.namprd11.prod.outlook.com>
References: <20240212150113.736295-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240212150113.736295-1-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6789:EE_|SJ0PR11MB4831:EE_
x-ms-office365-filtering-correlation-id: 4d78457d-8916-4d3f-56e7-08dc2c517e82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TRmPsRjpPDfWo8l9ZZVcRi/BL1NvXRo/uha9V9mdYjeEki7mhyB5IvdZSurU4aEenKaoKlyFcKZE21vk6ftb5UDO13c/L11leZSeayBjG6oWIvQ7bE5CG3wM9LzAA5+gsV3KYyORdz/yCAC3FhQBQI8AmZUgdzpqBbqU8OCYUC4wADkgeDvPB/bIror2MGuCkOLxMDddxxqXzRF2GsTutTdMcIh/2svGQof/J/sO1yrI5uio4eD/qE8R8o4Aj+94Z1DyCrXmX++fxezXnQQ7J2pMAyZ38Ur2vsOwCk/R+gu7VyWNvf0c41PLpCOpP3Sz7BF3cv89AoPlraOfRdzPySIoCFbhwo6JrUxB2i09fRnSNOsq5RSUEwCppVs23ZrAAIlF4DhcakV2mNvLwDl/SjPrARB+DEE8xTlGbRY1kZLWEjf12nhxi6tTmtWanW7+raWZRcVkqLo673rzIFzN77ecIFeKMrhScyo/wxdbLcOaZpdHLXnZmJ4cPiPn7eaD6hTpTC79XZjnl6oIzJtXc+wwMtN95p0CRH9Y2OTneaa+ardXgOhABB49oH01kAhvuWG6emoLQff/0Bzph5Tr5yxWF8PkBZRS28T68a9nDusnK1uxntKM7Apo9tMmnzj8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6789.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(39860400002)(346002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(2906002)(4744005)(5660300002)(55016003)(26005)(107886003)(41300700001)(8936002)(8676002)(4326008)(66946007)(66556008)(66476007)(66446008)(64756008)(53546011)(6506007)(52536014)(76116006)(83380400001)(38070700009)(7696005)(33656002)(110136005)(71200400001)(316002)(9686003)(478600001)(122000001)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rHTHON2ZhHWQisMMX3aJtR1HEB9iFhEBjjGVEQtcNsqDOqEwhnSPs4MzYGaC?=
 =?us-ascii?Q?nQJOpRnaFkMalY4J/95ww+6LASfvBFFjpBBqPJ+HDH597w3zLr7CzQOcnjIp?=
 =?us-ascii?Q?8Hyau9S3knlWSjwtkZXJ8jxr4E9xLU0FAQrdwt0Hl7bdEUEqqfDBeK7SHiyc?=
 =?us-ascii?Q?+gDyIFpt2UJOtr4r2ZKYCHh1lYYw2wcGIim9WPVlcE+dcA7jlkTMe/Q5/aHv?=
 =?us-ascii?Q?QckB5+lQpDLah3TL9/jXlaGoyUZ1RaywQVevN7vmVaL+omUPsS5DphQARN4J?=
 =?us-ascii?Q?S8t5ii3zNWRN87F2JYSOH4w86BTzue1MJu+s6rbSWipCsHo1vHVM6AhkEc5Y?=
 =?us-ascii?Q?PLNAV6oMArKBGMcy8KQETNsbCwUdOKyApGJl+OIqMbQKBY1yf6mLvrm6AKWi?=
 =?us-ascii?Q?4melQWvmKlJnb6zM+qauqWwZGfW+VDbh16aTtWsJLpwpkCmYFXGB4R46kLSn?=
 =?us-ascii?Q?iaEx5iPbIRqNSA59dxio48qH0zmjeCZhyC0lyvCfcQkAIvbKk4NpYBHLm5IQ?=
 =?us-ascii?Q?80S0Kha0oeMwVs+ASAA8qOXhPEXfimdKjgF6hLjdBTXC2pQrynx8BBkcbydf?=
 =?us-ascii?Q?9gI09KSH9AC9fkTY60z3Pj89byMYMW3+vc4lyOoFtu+4NbuOWpoD0RysVGl5?=
 =?us-ascii?Q?Vj/22c/ai6WcMxXznSG7w/jhs+BvajPWszmhn4+PQVkTbag1Z5OU0ohdzuY9?=
 =?us-ascii?Q?TVvj0hOB4t1ip9vuh5QY5TdwnNxXfe0caDXNLDH8FQE7FB9MLRa9SZAwGS4N?=
 =?us-ascii?Q?bsHl6cuqhsWmY7fOOPCY2RG8FtlMBFQ4JuWFmeyI743dg0pqBC5BEX94ibWV?=
 =?us-ascii?Q?4wZ8VgxnF85JuEiShEGvK5hS36eMnvg69pJlS2QfQe61ZyZ1gp56SDUt51mA?=
 =?us-ascii?Q?ldwp3z0VN/VxC6YR4YzyDQFQlxGGbtOx8nSzSkGL5nllVEPVsMiKs4n2b4c7?=
 =?us-ascii?Q?zkK5marvzKgM683eRxXL5CAkZecC8h2Y6tt1mXpm2UxL7BH2FZsHqOoxplvF?=
 =?us-ascii?Q?bTA5wtnYBrNgqcDDK33Ndw7JvSy3TJdJBBjO0IUOWlzlfjfKEMjqoi9+nUfP?=
 =?us-ascii?Q?53YBgw+iPhHkdyVNAgaLJZ3lt3ToNerikM8DBXWMNUM3EndSmeKmuew2n0f4?=
 =?us-ascii?Q?baWyG8Jbywx6j3O+1nP/EqBk1YViqWGwakAmmEV5Bz0VbX702FjOAaIjeE5Z?=
 =?us-ascii?Q?yN8nATWjGrFu0kCIXEtaj6XoSlHoSb7LuUKCOvAhbYc7OlmEP5A/VAxfKvI5?=
 =?us-ascii?Q?B+z+2/Imk2wLExB30WA16t24XqEEl6SJPrRED5jn5ae8j8mTrYquRnDAdt2r?=
 =?us-ascii?Q?mnGvyci652jhSe49W1TBFfNZI3QZrRl4f2FFRHcCCZy69UTrxQ+Vbo0Ahasr?=
 =?us-ascii?Q?fyBb5mQ1mMhTQlevOGcB+cQk37kMtsFpWPom7bhD2hM++2gC9aZzOLvqCu+z?=
 =?us-ascii?Q?zbQl9Jc7FJ52EVGiyOInn665b9fqmluoRCba7jmcmNIdjFL0eKYRQl26zAJs?=
 =?us-ascii?Q?sH7MZUMWEPgkTct2wIt6+v3qGFYcpGH79bOGp/iDaxTXuiBHmhEvdFKjGJEe?=
 =?us-ascii?Q?c7whq11807YhB4WXHsO/Xg7Ebzn+cXlhapWwDDgDOvgUakDMIJ8oyW96WtXN?=
 =?us-ascii?Q?4Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d78457d-8916-4d3f-56e7-08dc2c517e82
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 05:06:10.5621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OHWdsqdaBQmMeTsGnOZKIvsFd+pc+7XgL3Jb1Uti8Herqh0r5tERaXcpmLJvi+pXcVHq3HE3LI+h1dNRAr9OOzAc1dq8YvEMwrm+5aNlMrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4831
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
> Bhanuprakash Modem
> Sent: Monday, February 12, 2024 8:31 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t] benchmarks/kms_vblank: Add XE support
>=20
> Add support for XE driver.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM,  Thanks for the patch.
Reviewed-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  benchmarks/kms_vblank.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/benchmarks/kms_vblank.c b/benchmarks/kms_vblank.c index
> f32cc9e32..8668bacab 100644
> --- a/benchmarks/kms_vblank.c
> +++ b/benchmarks/kms_vblank.c
> @@ -161,7 +161,7 @@ int main(int argc, char **argv)
>  		}
>  	}
>=20
> -	fd =3D drm_open_driver(DRIVER_INTEL);
> +	fd =3D drm_open_driver(DRIVER_INTEL | DRIVER_XE);
>  	if (!crtc0_active(fd)) {
>  		fprintf(stderr, "CRTC/pipe 0 not active\n");
>  		return 77;
> --
> 2.43.0

