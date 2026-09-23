Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64987C9830C
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 13:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BC18952F;
	Wed, 23 Sep 2026 13:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXlwO5wG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C462F10F067
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 13:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790171762; x=1821707762;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oRTy5tlgXxqSH6pYDiz2sFNjC15gRXNOsFrwb/1p5M0=;
 b=VXlwO5wGCPu8EIdORlbveRG/FVpwyFyAV/Zx2j8IVGS3cDz7FIJfsdLg
 dAufaOKYReCvQBlbgTvnK3/oy6csG0Wfj5DcvpZ9G8rX8sRd+25NQxE5+
 5aNIHQVyx3PO7f40GJU8UQTrLnaWF2YPSK+jUPYeH50qLL/BqQDAr5of5
 laoeATkEEeCALwbUMoiVNoKpaYxXQm6hop4fOkCk5372hbMASAS9e11Zp
 ui4r19c+rqjaD55FgrCYU6roe9SrHGQVQQsm21x46ATxTONM32GEq5wHl
 FyVbI6Qv4xLyYw4auUWEExTO9blC4lcRFVxR3yMUM8jWkrH1QB73iNh8r Q==;
X-CSE-ConnectionGUID: t5tD8NKyRWK42taD5fegbQ==
X-CSE-MsgGUID: HoIPDCeuQ2W10XWrZLHVJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101533048"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="101533048"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:56:01 -0700
X-CSE-ConnectionGUID: xnBprs8hRke/uUlhf5/BLw==
X-CSE-MsgGUID: gEZwnwa1SjGG3o+gWu6lpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4881620"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:56:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 06:56:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 06:56:01 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 06:56:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nx2JzWCa2QFHHW4OKpFAMBCQJ7Ie3tnnbU95S0fT+rKuuKPGTgyz+TgCLhSPqz4PRwUlfLhEtQPHDCxF3ciXIgMjij3zkri3iZZLWZsUJ2F8j9fAKhoeuscsVtHrSCxuIU6ivfNUVR2/O6GqpfPtIsb/3TL198MgVp+HNjEWsbIvIltwYzCMTL8VctOMiLVvBqbjOa85WkQ0M7s3SVGRTSIRWhz/Vr1eN2EB55JpYOF+2xehws/yJCF7gze+mkFmM3MBlnfHgQpF62cqbzqRj1M7rOkv5qKBvF1cg4rlQ/i6ku+eSUqb7/EljPUopQKl4hf4qJU4r1pCBZip+SBukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9G5T/m52uHPGl1EkFVjymSrKTEpxk27vuVnYDlZt/d4=;
 b=KyxopwNeUvDUMBWIWoY4fN4gE2HLhNAzamgp6GmioVVpmsW21vPukYhZlKyV4Y4Hcc2Oxz1D2RQ9pYO8NqEPxDHoOFV6R65TWJ2KC9owvv0x2FW6JoNbmzG5wHWU2wGEzapj/6DRKUuivgktNmj1WjDMPtPRUQKCUIvnTt1R3ropO/KiQmMvICVjUhEG8w79muG0BR1eLZlQPTa7elFSJeKYJITFbCOLtXm5fpZCAIIDFv91+d49HTkld7pvoVaIN1SG07mg6GC+7/dezGumrKRGKfuE4Nwc2GN79txQvKvudt0+3sDb+FarRx6ofTWunT4tQ5XRkbrEEkxivd138Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SA1PR11MB9682.namprd11.prod.outlook.com (2603:10b6:806:4df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 13:55:59 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 13:55:59 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 12/13] lib/igt_dp: Add link status predicates for
 both channel codings
Thread-Topic: [PATCH i-g-t 12/13] lib/igt_dp: Add link status predicates for
 both channel codings
Thread-Index: AQHdRZUKGllug42ltEK9thiGnk0t77bcOpCg
Date: Wed, 23 Sep 2026 13:55:58 +0000
Message-ID: <PH7PR11MB6796B6E7375B0CE74F7FAB3AE5822@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
 <20260916044801.1279102-13-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-13-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SA1PR11MB9682:EE_
x-ms-office365-filtering-correlation-id: 33301bfb-7202-4533-da11-08df197a6587
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info: U1+n017h2va8rTfbR9uaAPQ1S7AtQ7t+vN/kUQRHkZfLTfjNE8c7co/TUqjlW3l44XDi4hTbDfh94WuUCflkhsCMA2tGxk6v6A9eMgs5Nwzb+t0owIIAEICXq7Yv2SbJ92vn1Zgz2izDVDUKh5xUB4C7R8alziOvhGIixRBzc+w/dDnKOQGqDMNuB2YXHuD89hPAE65yPk8RNI2llUTvlnfx67DpjsYhWSKSD8Tj8EPq2bYeeSYrPxGUtUsePw8Q1oMltlslSNonn3FfFwm4GWOOYaON0zq9vHKIsNFCQBUSytxG5BWKShFY0q21KMOFRzqYT5tP8IbHPe+N1jzzlXa+3QgBw52jLWd5tO7ahGTTfSKvKyk70lC893uJH0w5M0/znZLbR4Qu1d4iXWr5Mn7g2HNgF4/PYrLdmI+NEjL4YpYTxv9uX6mfGOh4LkrjkcwUqG4SCgXxTCC3PGbyzDbE70IFUsSLW+rhfWNcXmidQj9PeFqm5OGXA46np1iAzHwt7le5sb9hGKdQWbbZediInrbv3QvEXQ7ZCXqLu2gX3EVAFnOJWcfzeRB6cNBgCjOK4smkz/uUDRu2PKa79tBbS7tLgjazckCWDjXr8JjmsaqmjF5G4CTFQkGp3wAU9m+BEwZjmzwKClB748BSIWfl6Yh0UFQHdWlaBTHx3mtD3BC0qIm7/eTOwkNM/ad/eM4qwG6PK+lI1Q9WgrqvDKIm7a6mMsNMDypQVBMbLW4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7+Iw6ZWuBP6s7x9kr0h4VZ/xEEPROpTZbZsCX5uuFGk/iZzCPC7IVemehBnf?=
 =?us-ascii?Q?vvIDwJDYzaPRt3GO4fF09sISNIo/W16u+jk15E5S6yFcaycabgd85ylGyGZB?=
 =?us-ascii?Q?rHubSZxfESNmFu4VWViKd6IlqB538PZ0PjSNlE9G7lRWfxqXo6kP9cok0izy?=
 =?us-ascii?Q?hhCTRZQ3ejcAjkqG/PaHkkjp4xT3mk+NCbo5QYc64MRajCrIwkW6UHxHyT3r?=
 =?us-ascii?Q?4CMitEXlMmTjz1hbeLPiUMTLfOobbpJ5fSsA+3UgTPKXVlDepgDg/0BzbMiG?=
 =?us-ascii?Q?oEsDzVzZEojf5QCe43zSnJeOgIah4TGcwbMwYe8cFMOzdJFhJDq/9AVaKXbE?=
 =?us-ascii?Q?PA53LkYOyai6/Ft5/4NAnbKrh5siKs8lyJCMJcoZUcLEuPO41xrmRjEW4t5F?=
 =?us-ascii?Q?nK3rZ/344j4TF/xQsfv58JripZQQn0BR48X51H49I3hu7LbdH3G7G8UGphik?=
 =?us-ascii?Q?pAZFeRNgPxLmuHwTUqvNKT+tiT2OLi+5ZRoeWt9izysPMqKQrMyw6LEOBxlG?=
 =?us-ascii?Q?UZl0BXBoHmB+oNqJZ1LG/uXBoqSr7PcTcjIBHU1HLA4HWhlmbgDYNUEM4QVM?=
 =?us-ascii?Q?vY7RrQr100hm1P7Tt409KDDvVMVAFGBi9TD/NMOtjvspxJfcBuuQWu7+Ad0F?=
 =?us-ascii?Q?g4jeK66pVb5qArZvt8IOgHiFyN3JIwj//MRl/2J5usdOyLdgd+8kegzAN8Ye?=
 =?us-ascii?Q?1DK7zThYjLvOefP2tNUV4bv3/JR4nFl++Bi4l0Fe9pwv/nTZ0ffR+FuCXbAw?=
 =?us-ascii?Q?h3yhIhCOGbuDUISBoakwH/fYPQcAw6PYgoDSRwGO0b5hi/1JcpaiWbFJZEU+?=
 =?us-ascii?Q?1qcFlbyYqCXJ3MgJzzmd8HCQYM2eWgHeiSQaW6wHmoKQIcasLPgE0n8t/Jm0?=
 =?us-ascii?Q?qP3EWE5LGl9PBhmsBt1aTmbvsn09Y503BEImntguvbg+FlBKMXLGrgZ5M8/b?=
 =?us-ascii?Q?gBu0ghkcuL1EDABHVuY4R8k2/Od5uwnv22Zxo+MeLnAHaSdWmvOAJssroGc7?=
 =?us-ascii?Q?5XwHfmmVJ75nVAIQ1FbJsGgSvJtjWJHcCT00g4Lb1O9zyRTQMGquDZ0AjNZ2?=
 =?us-ascii?Q?HA4Kw41ZhTX+8pDvxkpGYYYKXKGpootrjKcS80ju9LOsIODUjDyf7F/qB6S2?=
 =?us-ascii?Q?vvbYo+MyUe9vsP9E88uMlBt65ognQS9hXXb9Yo2K2xOGOyPIFQY8qaJIm0gA?=
 =?us-ascii?Q?tewHUzKRxVYpHQDLBNB+dvJX9dDdGlOAlitICqFM0ujMOmSe7bhJ8dVqM676?=
 =?us-ascii?Q?bF4OUvXoK7BkIwlK0QqAF5VrEPZEuBQ4mMIMlfPVYNLSEFYa/N26OFHE95eY?=
 =?us-ascii?Q?iq9zSq1Tm7plFroGhA39KI90cLPEAntNoshe7H34NzXYYn8iD8qZw/uGL7JD?=
 =?us-ascii?Q?9uwt7qGVtqt7TmVkaN1/5tCNWGeObLsqX/PcuqkymQ296Lkj/6YntvNuQvFl?=
 =?us-ascii?Q?mGYGrjn6A1DlqjsELq9COiYgHg+DlR8yAp3FeYqD1lxZ91EFfRYzQSFL95Wx?=
 =?us-ascii?Q?+KfVx6KOxnCx8rfY5mL+XanW/m/tJvGV7N+hjcX2uVR1QHLxJDtLJ+TUHcHl?=
 =?us-ascii?Q?uE2cJwL2QXlfVO6ZlcOpfHHH+wK/yl7/2krrpInEDkU9J785/7vSMKF1H6fr?=
 =?us-ascii?Q?OkyS6VEIT8YtPGXqwefo0QOZFsdgtAXt7SPIZVJTYcm7DlGRg8aRaUWAEQoy?=
 =?us-ascii?Q?k4Pow1RckEnsBc2yKSvg7T2HFo6BYDRAgunD8RfGm6dlQkrh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uEP8WZkFXTWm2qS1+U8vQQhW/nVb7Qa+RDy+/cmrvJLgu82BJgxyvEs6sPtTwCaY/cKcWb5ZreR9WmAdBF6k5nx3IZyw96mnZ8QVc3QD6HvwmA1F6n3W5Ju6v9FdcE/SjahWB0d2POyo4WNAThbsDLbNWI7zfxZ66ijpWqO4vb5WedKXYWlJ598uyHu1YHwhQel4JuHXjcxIUl7ip4CmwZF177JiuasdQ/zr6VUnaichMJGJXLGlr3rVEInSCTfDsj343oUpkJOPM21EUFreAJCZedRb7l/i5REBJWm+FezhS9CgkHTZryPpEjP4sYKipkBX8f0rQ4u1SyPNO8rTJA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33301bfb-7202-4533-da11-08df197a6587
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 13:55:58.9793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZZJZ1tggH8niYJWtrpMH2SokfdkcTgDivmHH6YtmGSvD325fS5w3AO14cJQmampQgbxBJG0cr0AlyMvjCjPLgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9682
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

Hi @Joshi, Kunal1,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: 16 September 2026 10:18
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 12/13] lib/igt_dp: Add link status predicates for b=
oth
> channel codings
>=20
> A link that is up has, for every lane in use, clock recovery done, channe=
l
> equalisation done and symbols locked, plus interlane alignment done for t=
he
> link as a whole. 128b/132b reports that differently from
> 8b/10b: there is no clock recovery phase and so no CR_DONE bit, and a tra=
ining
> failure has its own bit in DP_LANE_ALIGN_STATUS_UPDATED.
>=20
> Add igt_dp_link_status_ok() covering both, mirroring
> drm_dp_channel_eq_ok() and the drm_dp_128b132b_* predicates in
> drm_dp_helper.c, so a caller does not have to know which set of bits appl=
ies to
> the rate it forced.
>=20
> Add igt_dp_channel_coding_ok() next to it, reading
> MAIN_LINK_CHANNEL_CODING_SET, so that the DPCD offsets stay inside the
> library and a test can ask the two questions it cares about without handl=
ing raw
> registers.
>=20
> Both return 1, 0 or a negative error code, so that a caller can tell a si=
nk which
> disagrees apart from a DPCD it could not read at all. That matters becaus=
e the
> AUX character device is not always there.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  lib/igt_dp.c | 103
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_dp.h |   4 ++
>  2 files changed, 107 insertions(+)
>=20
> diff --git a/lib/igt_dp.c b/lib/igt_dp.c index 0b1fe73de..a7d9f1e77 10064=
4
> --- a/lib/igt_dp.c
> +++ b/lib/igt_dp.c
> @@ -281,3 +281,106 @@ int igt_dp_dpcd_read_byte(int aux_fd, unsigned int
> offset, uint8_t *val)
>=20
>  	return ret =3D=3D 1 ? 0 : -EIO;
>  }
> +
> +/*
> + * DPCD registers and bits used by the sink side link checks, mirroring
> +the
> + * kernel's include/drm/display/drm_dp.h.
> + */
> +#define DPCD_MAIN_LINK_CHANNEL_CODING_SET	0x108
> +#define  DPCD_SET_ANSI_8B10B			(1 << 0)
> +#define  DPCD_SET_ANSI_128B132B			(1 << 1)
> +
> +#define DPCD_LANE0_1_STATUS			0x202
> +#define DPCD_LINK_STATUS_SIZE			6
> +#define  DPCD_LANE_CR_DONE			(1 << 0)
> +#define  DPCD_LANE_CHANNEL_EQ_DONE		(1 << 1)
> +#define  DPCD_LANE_SYMBOL_LOCKED		(1 << 2)
> +
> +/* DP_LANE_ALIGN_STATUS_UPDATED, the third byte of the status block. */
> +#define  DPCD_INTERLANE_ALIGN_DONE		(1 << 0)
> +#define  DPCD_128B132B_LT_FAILED		(1 << 4)
> +
> +static uint8_t dpcd_lane_status(const uint8_t
> link_status[DPCD_LINK_STATUS_SIZE],
> +				int lane)
> +{
> +	return (link_status[lane / 2] >> (4 * (lane % 2))) & 0xf; }
> +
> +/**
> + * igt_dp_channel_coding_ok: Check the channel coding the sink was told =
to
> use
> + * @aux_fd:	AUX channel device file descriptor from igt_dp_aux_open()
> + * @uhbr:	Whether 128b/132b is expected
> + *
> + * Read MAIN_LINK_CHANNEL_CODING_SET and check that it selects the
> +encoding the
> + * link rate implies. This is the only direct evidence that the coding
> +a UHBR
> + * rate implies is the coding that reached the wire.
> + *
> + * Returns:
> + * 1 when the expected coding is selected, 0 when it is not, or a
> +negative
> + * error code when the DPCD could not be read.
> + */
> +int igt_dp_channel_coding_ok(int aux_fd, bool uhbr) {
> +	uint8_t coding;
> +	int ret;
> +
> +	ret =3D igt_dp_dpcd_read_byte(aux_fd,
> DPCD_MAIN_LINK_CHANNEL_CODING_SET,
> +				    &coding);
> +	if (ret < 0)
> +		return ret;
> +
> +	return !!(coding & (uhbr ? DPCD_SET_ANSI_128B132B :
> +DPCD_SET_ANSI_8B10B)); }
> +
> +/**
> + * igt_dp_link_status_ok: Check the sink considers the link trained
> + * @aux_fd:	AUX channel device file descriptor from igt_dp_aux_open()
> + * @lane_count:	Number of lanes in use
> + * @uhbr:	Whether the link runs at a UHBR rate, i.e. uses 128b/132b
> + *
> + * Read the link status block at DP_LANE0_1_STATUS and check that every
> +lane in
> + * use is locked and the lanes are aligned.
> + *
> + * 128b/132b reports this differently from 8b/10b: there is no clock
> +recovery
> + * bit, and a training failure has its own bit in
> + * DP_LANE_ALIGN_STATUS_UPDATED. Mirrors drm_dp_channel_eq_ok() and
> the
> + * drm_dp_128b132b_* predicates.
> + *
> + * Returns:
> + * 1 when the sink considers the link trained, 0 when it does not, or a
> + * negative error code when the DPCD could not be read.
> + */
> +int igt_dp_link_status_ok(int aux_fd, int lane_count, bool uhbr) {
> +	uint8_t link_status[DPCD_LINK_STATUS_SIZE];
> +	uint8_t lane_mask;
> +	uint8_t align;
> +	int ret;
> +	int lane;
> +
> +	ret =3D igt_dp_dpcd_read(aux_fd, DPCD_LANE0_1_STATUS, link_status,
> +			       sizeof(link_status));
> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D sizeof(link_status))
> +		return -EIO;
> +
> +	align =3D link_status[2];
> +
> +	if (uhbr && (align & DPCD_128B132B_LT_FAILED))
> +		return 0;
> +
> +	if (!(align & DPCD_INTERLANE_ALIGN_DONE))
> +		return 0;
> +
> +	/* 128b/132b has no clock recovery phase, so no CR_DONE bit. */
> +	lane_mask =3D DPCD_LANE_CHANNEL_EQ_DONE |
> DPCD_LANE_SYMBOL_LOCKED;
> +	if (!uhbr)
> +		lane_mask |=3D DPCD_LANE_CR_DONE;
> +
> +	for (lane =3D 0; lane < lane_count; lane++)
> +		if ((dpcd_lane_status(link_status, lane) & lane_mask) !=3D
> lane_mask)
> +			return 0;
> +
> +	return 1;
> +}
> diff --git a/lib/igt_dp.h b/lib/igt_dp.h index 44f3b11a1..332656aae 10064=
4
> --- a/lib/igt_dp.h
> +++ b/lib/igt_dp.h
> @@ -36,4 +36,8 @@ int igt_dp_dpcd_read(int aux_fd, unsigned int offset, v=
oid
> *buf, size_t size);
>=20
>  int igt_dp_dpcd_read_byte(int aux_fd, unsigned int offset, uint8_t *val)=
;
>=20
> +int igt_dp_channel_coding_ok(int aux_fd, bool uhbr);
> +
> +int igt_dp_link_status_ok(int aux_fd, int lane_count, bool uhbr);
> +
>  #endif
> --
> 2.25.1

