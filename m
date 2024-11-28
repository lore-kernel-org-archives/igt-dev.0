Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15D5D690E2
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 07:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970CE10E241;
	Thu, 28 Nov 2024 07:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jh7pzR6j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D7D10E241
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 07:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732778950; x=1764314950;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nf/NMGXUIBQXtqwcG8m4/X2gOlPQPQbJHGNLoj5utww=;
 b=Jh7pzR6jednNonOZzCCaATdHSRdWuuSqCfpdqmfJmfMwSB+NhbQ6dhh+
 IP1JhHh5z3lKTARcRe+u0NN/+ngWmo0zeHRB+yKBNoHQIjK6nUS++CAf4
 Arf4pPJnBdPdtZxTRKNAZUElVrUKZcJMFkFLZi62CuVD/x0M+Q9y62b50
 6GGPkyUs77Asyw7J3royrdTVOaLfyjsSd0Jzpo+wWM8JNQvcE/DvQn1NU
 O4WuB0viCLq041RVMci0QVMBjgjl5scF61+fHzQox5MonNSdmotCyXwPZ
 X/VTkGG7M9jS9Yd59Q3m4bn9EF/1K3graNNP2gPuNhBw1+3MIACzdMfmQ w==;
X-CSE-ConnectionGUID: RFQ0mSI+RzC9cUhr+dRHmw==
X-CSE-MsgGUID: 1IKNOsuiRyuMvs31cYW0DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33154743"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="33154743"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 23:29:10 -0800
X-CSE-ConnectionGUID: hrNXQBD/Snyl4gbl7/thBw==
X-CSE-MsgGUID: NytvAIRZQBW47TMpXfnMag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="96918083"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2024 23:29:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 27 Nov 2024 23:29:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 27 Nov 2024 23:29:09 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 27 Nov 2024 23:29:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAWbsYbqkWOFma8RvjHJywO+rG4FDtE73a/Sde0SNeB+LhTSf6X/AJ26DykWbaxbtgxsrCHy1+eJxkq6C5GBEexr74DadP19EaaoaCzCFEc/MdRE78afOLUl2Pp8dM2l6oIKcWmhYf2KUbDwxl4ALsMrFeqfcAnN29oGwUW6bwQmbrrQWuSjyyKUbx2yymuccRgI2I1CDkNDmwy/QDxzKy3xZCweesutZqWc13a9F0mabyWBEzc5SS9REXJYXvgYmWbLuBNoHRDdcGvQYfTNSkWTQcXouQfi29C/8xZ0NN4xGNlkAVKEXQTha6JbKNqVdPdab3jvmz3gL88H+ULrig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCpVSWzgZkCvr4/wF1Xrn3RO0VHXvgGgiN2el+S5QU0=;
 b=ft5mQ7rjehjuEkuhIsjne3e7ChRcC8gAr8X1kGLxZxZFjrnnRxaUtdfQDrL2787pQtLnLrQEP0Q/tXPLC0DGE5yBBAheID6QXyQt578o9nWiKO7Mogd38NlYQorLku5++9yn4wkbllIqlXmOk37SH2MR6WOCKGqS1BJDb2Hxx7hOHx7GUcD/sHpzmQWSfGPunevAgVMWF/deRXSoAaiCzN0BE1HB5XDjSapXXsIQxDjyELw9dsONCvfiQ5XWLWgi4CsK2TtSUXXfrIw0ptMFci/7FT23HNjLVf4WQbp9OiwouYd2L8gLhaHWDjSKQk3ZrZ5ao9Q/O0aUXqko/lJjrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.13; Thu, 28 Nov 2024 07:29:06 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 07:29:06 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_plane:Add more logs to skips/failure
Thread-Topic: [PATCH i-g-t v2] tests/kms_plane:Add more logs to skips/failure
Thread-Index: AQHbQV+0Bn/mkECjtkOmkBTYrR/BtrLMS2vw
Date: Thu, 28 Nov 2024 07:29:05 +0000
Message-ID: <DM4PR11MB6312E3173B2618698136FC9B90292@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241128063539.1984668-1-pranay.samala@intel.com>
In-Reply-To: <20241128063539.1984668-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB7580:EE_
x-ms-office365-filtering-correlation-id: 42d5abf1-c7e6-41b4-cff1-08dd0f7e573d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?h1aEJwlEZ7S98sLtAOOLOUuGK0qeckQWSttPBSizISW11QdWGl003IUw2LTc?=
 =?us-ascii?Q?waYLzAKel4nOu0+PBGlv69i+YReQ22GaJtMY+W8NZXm3TnPO3Yn8p1UZljJm?=
 =?us-ascii?Q?xmrwrLYYwasmBW9UGf5A64sV8vLZUx/uLzWOE26v6ETCPTXyuWuHeeFso78F?=
 =?us-ascii?Q?DI4XNyKJ3ryK/ugsXYSrNHtf09Pd52r9jx4q1z2I17MKcyx2mVOJYM9UiFej?=
 =?us-ascii?Q?+f6+yzqsjy8b5Luu/15E65we5e7BWWrLdgtOyjulbx8RK8fEcJMVr8T1M08x?=
 =?us-ascii?Q?C8LeodPmW5xGoCWu1DJmBPco05erOEhB5JGxey/zlpHynkZn103MQJVEbMyX?=
 =?us-ascii?Q?cvRzMcyz7MaVTcX6nmcc9z4h/caxiItGH6jw8lgBWHN9OcBZSqU6PCBXrS8g?=
 =?us-ascii?Q?x/h2NcWEo3d9q5azQWjYeVAkr2gFiyf0O3O9VitCEhdR1GBJ5AcBjh9R3qQo?=
 =?us-ascii?Q?u/bkmaHeZLMlorEj8XHBC93mfIAZBt6QAexDO5q88QgAfCISKOujCOiTkQcH?=
 =?us-ascii?Q?Km6fgVX0EcT3DDE47HwwKaNQiWynDjuzVSiEnWtcA5N1EAg5OgPaBBHmCHU3?=
 =?us-ascii?Q?o3nRIPH9IS2sn09lhi/AtKAq+n1yRk3VxOVrQOuQJ4x32osf05uOT3TzsXEs?=
 =?us-ascii?Q?leK2+tiF6sEvgE04Q4vPrfCnCO3GzK1yfnrocbi65oRKOtSkgXnuxE/wVzC+?=
 =?us-ascii?Q?wE3a4ylg0Yt57KJfON0YcuXFDI/HwSViVN/V9veewISNdRokJPAGC8S3OmaZ?=
 =?us-ascii?Q?2Owsk2F3SkVHAgCE6WBn7Aprv/bx8vLIm0SEBxVwGx/3RQ+wKZCcLg9Ko4kU?=
 =?us-ascii?Q?7P7ecPNEzENpsCMbo6RgdNTadp6Wp2iUjGoz6jiLnX/vdh0jCdcut9fbPX0j?=
 =?us-ascii?Q?bf7w9u/u9jvAwPNHREL+xungfEU5Qjyu1qbTLFJ/UAyG0llzAOgXEVcDGG+o?=
 =?us-ascii?Q?nMk6mm5Yi2K3mqdzs1x1nngLHvq3yGucVTFZgxCYETevubxWWlBbvmw/ytbZ?=
 =?us-ascii?Q?jf1NjcC3idHbphaGQO5J2/vLc/xuCj1zYf/exS91V2RleF+j7aE2hKLZsKPh?=
 =?us-ascii?Q?s++LtM7DvbB4L45Fe5Q0gziBrbgvqx+hqGUM6O1hDmnN5Zv7bPCiKGE/3nWA?=
 =?us-ascii?Q?TXLJTj2Pe4JDhPd91RTJJWOyjOLOpAYxYK4wadgOyci6a04b8DAPCMZ3sOik?=
 =?us-ascii?Q?NiDF6RwxQErUn/NldKRXMezwqCIp5BPC/lS+ox7u7/g+yL0Triu6vjZiDoC4?=
 =?us-ascii?Q?JzKzeD2VTVmfwSTC0IULJlPxeVg40h8BjdhSeuWjiJ6XjCUVqCZ2Ba9p80Ey?=
 =?us-ascii?Q?H/xhfaYI/g882xB2o3I9Xxgj3y0EHuu8tgZ0qus+Wl25Fz+8R9pL/LVNYKda?=
 =?us-ascii?Q?8sZFXXAaHM2ks3RQu0cDXROolD9R94GtafKopPEWqS4FELm5gg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FfyFn75CqlV7iP76MZwybOoC+12kHhFLRG+Zd/jwgY1PP3S4A3tWK8Td3Hs6?=
 =?us-ascii?Q?3iH7AD5zEOlU0JlkDcBS0vqsLM3U9JQ8IRRiXXPHwJ4FIgq3B+b3/Rv7Xqw9?=
 =?us-ascii?Q?ckpaDI+OjEfUrYiV4hoNRmfCRqd1/iK4+X1zluoXRW355PZSu0Rc/ZxvEIoz?=
 =?us-ascii?Q?vfn6TKfhRX+Pn+/tBC+U/hTLyPiZjsiCdh95MW3e2VNOBxbRIHm5UiyDIikl?=
 =?us-ascii?Q?ZQMOX7l34d/mdo5Cg/na8ww2ozgV2cBQ7uiHWuDtBYiCL6VFfQmtbUuFUIoD?=
 =?us-ascii?Q?xDcFdqkJFs5B2Z64fzoKemDvwAsyr4P8c2blyvi4OF3wFep1dv7zSfuOeNWM?=
 =?us-ascii?Q?GMEz5lMIXNA7958UrPapbqfZSPTpogcpLfxUyi0eyIoYTQbinlW1KifTw9gg?=
 =?us-ascii?Q?HfM9mRZ23GfA7VpM78ZrxbrrghsYk4R1B0J5W6rIRmtxT3W+oOR07CxURklK?=
 =?us-ascii?Q?cBG6qsl23cV+usXtUGOMO3dTdRKJaPokOMdSZRP33fF1GNL+RKOYdlHS5MFS?=
 =?us-ascii?Q?EqL3iXc+Q0uDZOx04JTDSE20MSNeOPbwrPnWjJF/PZ8XV3g4ihIHeRZWFRcF?=
 =?us-ascii?Q?qX6J28JCchqXGxREONOXWaDrt71AFOYb9fSPxch/W9vHZpyt/gL30c0hU2DS?=
 =?us-ascii?Q?aBBR7OC1guH6mAVjyRiAzAW1S8ZPPSQLSxCLAh7eeHn4sJFgUQ9BtpaTx8WS?=
 =?us-ascii?Q?7/x+lHrKv8SzdW1fIJpOyr77aYAa7B5aCXXAoc9m2ZETGDgEiu641LgzJUxH?=
 =?us-ascii?Q?bzTfcSrybBiBb68r+YKNjXY9nUPbEQztpJ23QR2JW53xqC2WEaINTL7420/F?=
 =?us-ascii?Q?8zs430qXWGdtsfxgQMq7NKnbI3eRJfy1/mA4krAiCYSbfNFpqdl2SeEzS28i?=
 =?us-ascii?Q?y20GjlIopfR1bsF+o10q/JlgUvaNCUQ9pHmaPoKv6v1Jt+LFk7bg908JnGaB?=
 =?us-ascii?Q?sKDFVPRCDF1Mp5OSGY5KpJkhxCWGXCFeehjECOg+UEaWQ3hFTBLKbXhKsPt9?=
 =?us-ascii?Q?y1/IL+pu9gCp9CNjW6RLOZpVXopCr7rzUYtPcGxmSSRhUOB0mJMvz9SrERT0?=
 =?us-ascii?Q?BvwWiLmblXm68DvNQu4elQ8ssLW+E11kERwwdOD4PA/TMtGzCKO6snglEmVV?=
 =?us-ascii?Q?iqB57nEpk6TZHLkmoXR3HUHlFehoTDEqdg4lWGe/QJfLdHNPFhywlT/sln46?=
 =?us-ascii?Q?lrZjDKMBaxXcBI6vXfeAWN5nh11StYmwXLED/LIO9qkAHtNkoytuNgixiZ3n?=
 =?us-ascii?Q?P3UvPFAhHkTWhonTO1kQ/X6IhmHjKXhFAZ9WnNwrDHuGMVstX25jBSLPtPBM?=
 =?us-ascii?Q?KTakjhzAgM/QwFHVSl69cabzqdAHLQeh/8ufL2ywtzuHdt4IxS3Y48NItZYo?=
 =?us-ascii?Q?5sqCx0HQ59HkuDafGtpZjEQawVity94gDXfGmB2lu2jKzqF0p3I9pa6mJgYz?=
 =?us-ascii?Q?wbqDAqkdEqqvdcedhW3BuCu/KqZPeExkNGcBKFuvw9DF1rY/zcVCylUGuLGn?=
 =?us-ascii?Q?FDRjkaVHRS/g78JKA6r38X9INJ1/ixSsdku7FvQ/fSSO0s/AOqMaLvMkHfBh?=
 =?us-ascii?Q?aZiKpITs1rd25JZIA0h2ZhoafyUb02BLeixeD5XA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d5abf1-c7e6-41b4-cff1-08dd0f7e573d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 07:29:05.9911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 86WG+RwW7WptSVzbWeJKpFmPrBVgVMiyFfcM8MM6/PJWuK/rqEn1AhBW9d0AirtcKaJYLSY+HkqJweT0iEDWbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
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
> Sent: Thursday, November 28, 2024 12:06 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>;
> Lattannavar, Sameer <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_plane:Add more logs to skips/failure
>=20
> Having some logs for test failures and skips would make debugging much ea=
sier.
>=20
> v2: Remove the extra logging statements (Jeevan)
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
LGTM
Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/kms_plane.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c index 77a669dc5..b9bf0=
25bd
> 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -293,8 +293,11 @@ test_plane_position_with_output(data_t *data,
>  	create_fb_for_mode(data, mode, &green, &rect, 1, &primary_fb);
>  	igt_plane_set_fb(primary, &primary_fb);
>=20
> -	if (!igt_plane_has_format_mod(sprite, DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR))
> +	if (!igt_plane_has_format_mod(sprite, DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR)) {
> +		igt_info("plane-%d does not supports XRGB format and Linear
> modifier\n",
> +			 sprite->index);
>  		return;
> +	}
>=20
>  	igt_create_color_fb(data->drm_fd,
>  			    64, 64, /* width, height */
> @@ -493,7 +496,7 @@ test_plane_panning(data_t *data, enum pipe pipe)
>  		mode_found =3D true;
>  		break;
>  	}
> -	igt_require(mode_found);
> +	igt_require_f(mode_found, "All connector modes are skipped due to low
> +memory\n");
>=20
>  	if (data->flags & TEST_PANNING_TOP_LEFT)
>  		test_grab_crc(data, output, pipe, &red, data->flags, &ref_crc);
> @@ -1263,7 +1266,7 @@ static void test_planar_settings(data_t *data)
>  	 * If here is added non-intel tests below require will need to be
>  	 * changed to if(..)
>  	 */
> -	igt_require(data->display.is_atomic);
> +	igt_require_f(data->display.is_atomic, "Atomic mode-set not
> +supported\n");
>  	igt_require_intel(data->drm_fd);
>  	devid =3D intel_get_drm_devid(data->drm_fd);
>  	igt_require(intel_display_ver(devid) >=3D 9);
> --
> 2.34.1

