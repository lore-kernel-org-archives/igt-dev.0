Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F505C48BEC
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 10:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0628710E5A3;
	Wed, 14 Feb 2024 10:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bM1+ATdE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FB610E5A3
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 10:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707905657; x=1739441657;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pMFyLP3X03RqdIB6bxbaRXgDu/z60+Y7SEQAP48SuvU=;
 b=bM1+ATdERdOFc/oL2UnhSR5Pm0anli98aAmToyhi6WbPsdpUa4B9fzyE
 S72hc2ovSRKO29cLn6CIEVooZvTVorvgLARpYq/W6gY8j1b0LvAMrsf6S
 hvB5Zf0yULcTgqJqR0T8ANoiuIAVQsEuLLwDVoTEhvr5c7cI86BGeyj/v
 txAaqAnfZ3AV1xGx7tXzRgkXF2UslQxAVXI24TloeCh2scVlew3w6PnGQ
 cbfhTQgeuhlbhyk/l2YqK1jDrd8sBfNVXqeCwVUKrnawPXw2f83M3j0rC
 BgEgkSD+EZsJUztZzpyH2eGJhyQ7SBJGhXNJXxMdWPPppBL1Kjq/xDoXY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1851714"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1851714"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 02:14:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="40625636"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 02:14:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 02:14:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 02:14:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 02:14:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 02:14:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWoiShiD9aRgfP/muEF+zymvQGqmy8mlren1BkdgfgIog1PL7L/4sm7Jd1ohURiv4BWsZ4RFziXdshoBMPFAsE5yZUlQ3n8WNSfV+xgeLTu5ejxHn1ZAKTCAe+SjwWKAGc/RGc54YiMIvFe6YE1+NWutxrPDpQsLNsIaH1So0wU8zWn9fiAQCbB0kBqzBzNtUvfzc75bCfXuTFT9uMZ6nt9rgfiIZ7F5/qP6ZQplr/aljkTIeNohzsUEow0F95bPVr0CfPxCSCXkb0BJi/5BsUdyI1smXE6k0RjsteNxfCsjOsCkhpu5eBVyKhibQQ2a4gvJSVDtxSAsVfadZvXodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feGOexkqotGImaS6q/VcCoGSEG2mqXpA+0J1wxKse74=;
 b=EgsO+mXJCWf+mcS9HJA5VNHRKKc/sVQVNDhDnEvZOV27P86D2EjfDxIoBadj01IjiiOjA1v2oHlQhhQ8aSYsfO6qNzwz3iF4s+wKI777y4p6MKg+6wktE0g0J6cWKTqyJqzeYRN5kH6RCp6y6Odt/ySiGAi6dooklm+CbsACh+vNkpPa2jy/XQJxldxG/TX+7SkfhwS8jkBHbRZxCNsGIO1PwkkQnXqPVc1+AhbpjX1YSdR4bQSW9b9Pfdu1JHUS/sRXzPfU4ya4CwJEfgVEGaUWDv18jfnOWJMfizDabGkWT6LwbUiJcp0Sh8TQbMvIuIU+EV9S/qv21Vs0bg4Wew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB7003.namprd11.prod.outlook.com (2603:10b6:510:20a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Wed, 14 Feb
 2024 10:14:11 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553%5]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 10:14:11 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH v2 1/1] tests/kms_plane: Restricting number of pixel
 formats for simulation
Thread-Topic: [PATCH v2 1/1] tests/kms_plane: Restricting number of pixel
 formats for simulation
Thread-Index: AQHaXyNE45XReUJnW0Sx6ogZsAQmK7EJnlZQ
Date: Wed, 14 Feb 2024 10:14:11 +0000
Message-ID: <DM4PR11MB6312CB9B2EE9D7A0253F7167904E2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240214085328.2024-1-pranay.samala@intel.com>
 <20240214085328.2024-2-pranay.samala@intel.com>
In-Reply-To: <20240214085328.2024-2-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB7003:EE_
x-ms-office365-filtering-correlation-id: 17c83d5d-2e2c-4276-4af5-08dc2d45b070
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vAES6s9vy4JCpKIU5GxnKTbGPHwXUkeJW/ZiLdAOyBJ0xEVsegebVFxlz/LJXtfUz1AFdhvt0v+ciY1wJvrCMRXekxtsEv8E3rnYFDVEArQsGsg/WO5+waBLFJi8rNh66FSf1K3OnkuPNNdgUJpYCVbBnwveV+5Ktn+cnXllz2zA1vnMQZuzshYleRIj2PpBTjgAEa24TvGPZAHNURqP2/d1QFt1T7HA2UNRiUHmhDQFtWiWe3kmfQL7pg7/deMWYrdliiuwBAAXZyF+0csPfP1o9aZ3w/qy4Ai6M3mJBkZPulNbiCGtsyb9lArwnhr4I4PNIU4LuciL+hOxLgSEeZe9+kBY0tBGFL2AdVBqmNonMLiOMoVY7s8nNxEHUrAFXgmYVDj3+TPN9OuTjfe+jQEY1cI/jIVpUGo9TQ/wN/AWL/Q66TPrmnjA2k2VRHDPiLcoEiIxcbpqfVYJaLIfuOgsd2ZB93ZaYiDlkC2sPVg9s6Omhz7cKPN09C5zfpyvDfrx+LKZ803yX+3y+2P+zxBeBkPnbd56nwRae93frM7LneJTrRYUi2h0t+lMGhevAeLF5lRJSDVpe8x+3yrE09jTJwKZa7AGkgqDs6EpzjF0Dbra3SqvMNGdu6npcnIy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(39860400002)(136003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(55016003)(6506007)(33656002)(2906002)(7696005)(38070700009)(5660300002)(66946007)(8676002)(86362001)(38100700002)(122000001)(71200400001)(9686003)(82960400001)(478600001)(110136005)(53546011)(316002)(4326008)(83380400001)(52536014)(66556008)(66476007)(41300700001)(64756008)(8936002)(66446008)(26005)(76116006)(107886003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mfNul3oFLidxMfDKNghB9mpCQXygVfd39aAOhvY5nXYT1HSSMbaAeAKxVrPK?=
 =?us-ascii?Q?pisg/wpHMz4+nS56x3Cq7rtKwYtQ9X8yHHt7r5O/O10muati5NHQSvtNWKI0?=
 =?us-ascii?Q?SzCA9SUJS9WutdGEr0glbAB45TFEl4wdmxlPk0ZeKaDiUQkFU5ZUeTgWU9kh?=
 =?us-ascii?Q?COZuiVhXGYOhusU8wseUOIuVUYYRy5uLKdyW3TFNMamI76HPUER29QG+Wo2D?=
 =?us-ascii?Q?+H9jy7S8xURX9lzfQKDg07OkqLJwm8y+IaJEOZ/hmIFcUhpKsXYFQnVcNTb1?=
 =?us-ascii?Q?pWly3SLdMsPqI1FiwceTr9JmFuHA5nqDRL/Kemm8KeTRHNmDt/14QMJkfFG5?=
 =?us-ascii?Q?rJwke5Q+yw5lDg4ZeDOi/s31QrPdJCxtH56yrbs3CtQKpmG0dHCoFbloLDqg?=
 =?us-ascii?Q?Vln/SHqgT/wVbjeJ/Om8aMRTyFo8rV6AaFXWMZxJ8sW+/6P/OFnfYVq0rtsN?=
 =?us-ascii?Q?gZQrAFqN+Meg/G7mnl8pPIa8Hz/N2WzkOXYH1yZIUsJgJ2/K7tWt5m28QYm7?=
 =?us-ascii?Q?V5FEIOUM2BZv+k9ebIrY7+5aeUfT9BsBrLK3vEkpl0FWHcx0WYG3Xi1zYXJW?=
 =?us-ascii?Q?izvaHc9uZCP/G4FtRnyovJtrUXzAcszPbA7FOvl1eGbl9vNGBfKgNXbYnijr?=
 =?us-ascii?Q?GZoFFD5A3GSghyCCTxrjT3omno5w8qEBZK+Ty90qOEVAvMhASh71S40D7svq?=
 =?us-ascii?Q?pZZMG1kVrYwNERBC3cTKH1cTaDr0opErHNDF0wX+co32VZt6J/Iifx8P+k3F?=
 =?us-ascii?Q?L5zmq0AFvmtHdjNTdML6LYqKQWk7/M6nhA7KOnrgeJ9JQu7/7VUK6ZLvitjv?=
 =?us-ascii?Q?oTkimaWhiGRf0pej8PVeSsrFp7jkItC5MnqQbAeFKReI9T0lUARhTIENE5hx?=
 =?us-ascii?Q?XO5HX2dvefOmkE679hC5canO1QmVAWvkps2viovdgE6ZQD25TT2t0rj9zyxV?=
 =?us-ascii?Q?Cw99rcWWx0JMwltV78zo47PqpsLvcoInD8UcVYTHdcn1vQdzvbC64O5TAG71?=
 =?us-ascii?Q?xQLMkLeVRymznR8PNL8+zHyIGFqjlTWGA3Ozrx3Eugd7+Clj7M4SSX54cnOc?=
 =?us-ascii?Q?aAsbG8HgBkvwh6pIHzppFtYrzMlakRFlhWUwNu5KpeGYr+qIQFL4zrFEuivF?=
 =?us-ascii?Q?cj/OJD5g9fYY3lg5oINhzhdKQ8KLpmcN+tnNlQgIJnAOOawZVi9kLfh+nADv?=
 =?us-ascii?Q?eTe//+KIavozQeULhE748TqCiT/mywkS8VHHcuvcOYJzahBi+tb9JAQgDbaR?=
 =?us-ascii?Q?EJB02mTjWMakY1GUAFrlyIlLoBqVMtYwGof7W91FKFo0RbLBN9wg9qQ3XCa3?=
 =?us-ascii?Q?AAXkRrEZzHYuYjEuE5Am4MsL+3GtZf7i3PcTcxlzXmEW6Ork6oKBBus+ho6E?=
 =?us-ascii?Q?yuV5gu1wW2cLm9GRSiszW+kO9o7OI9prsqT/YPbbUPPe3mri2Bq7cmCoSEuB?=
 =?us-ascii?Q?Q9FRPGopaa6U9qFCJvR/ENrYRGTliJXcEWWhjPFxWzapkHU3hYoYIY7z0bkU?=
 =?us-ascii?Q?Sql7g2sLqWt+vVygPe+KiETjFCUneR/IywKLIRlfmCGrFk/4raCaNNAEHHNg?=
 =?us-ascii?Q?tjxxTsl39QLe3eNxQ6Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c83d5d-2e2c-4276-4af5-08dc2d45b070
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 10:14:11.5471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mLrK57dP8P9CUUj966jv9RJgfd/nAaTqeLUOvG5g+Y5P3Ob42A057QIUwoqcoTDW1KzMndOPgoj2q8W2+ooHUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7003
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
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Wednesday, February 14, 2024 2:23 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>;
> Samala, Pranay <pranay.samala@intel.com>; Samala
> Subject: [PATCH v2 1/1] tests/kms_plane: Restricting number of pixel form=
ats
> for simulation
>=20
> The pixel-format subtest runs on all pixel formats, reducing it to single=
 format
> to reduce execution time on simulation.
>=20
> Cc: B S, Karthik <karthik.b.s@intel.com>
> Cc: B, Jeevan <jeevan.b@intel.com>
LGTM
Reviewed-by: Jeevan B <jeevan.b@intel.com>
>=20
> Signed-off-by: Samala, Pranay <pranay.samala@intel.com>
> ---
>  tests/kms_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c index 406aecc04..fbffc=
3cb0
> 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1081,6 +1081,9 @@ static bool test_format_plane(data_t *data, enum
> pipe pipe,
>  		    f.modifier =3D=3D ref.modifier)
>  			continue;
>=20
> +		if (f.format !=3D DRM_FORMAT_XRGB8888 &&
> igt_run_in_simulation())
> +			continue;
> +
>  		/* test each format "class" only once in non-extended tests */
>  		if (!data->extended && f.modifier !=3D
> DRM_FORMAT_MOD_LINEAR) {
>  			struct format_mod rf =3D {
> --
> 2.34.1

