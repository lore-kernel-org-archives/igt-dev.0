Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126E2109C028
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 15:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65D610E7BC;
	Wed, 25 Mar 2026 15:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSzfS4nV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D2F10E7BA
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 15:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774451568; x=1805987568;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aKenNNklufFeONQ4S3u3V0UN/UEjRnB70SpLnYB2KoI=;
 b=WSzfS4nVSX2NgP4coNAUaPeqO5B9ubKh8oagLn5dYIfW2bmi57n+dB8L
 VyAZWRGiczpn/qNujA9PbLZ8Dtlm5Bj7228utwUCnfUxxowsWB50r+GJw
 NI7u3fefSQT2R798UOYXOF9ySMnEOFgX8n/3fQLMjwuYRDoV/EWC4j/5r
 hLi1rsX5f3xIhyW9I9SnpPAHQlIyWf4lXtr8UbzZ5W7CUo60lKb+oS0Jg
 zZFD7BtPWo3PasA0/EClwxCwovyae8kJX6OdAMtIXGxXu42k/6AdMc8iB
 hYVqk9/7E3w+THgWoPThEOBAB3tHc3ZctAB/MlIktZhsqImwxQLX3qohy w==;
X-CSE-ConnectionGUID: YzlR0pZ7QG2+DRGJrU15gg==
X-CSE-MsgGUID: 3KxN4CQJRrW4WgtYidngLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86186144"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="86186144"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:12:48 -0700
X-CSE-ConnectionGUID: NWp2L3O6RQiqtCMp2Pb5KA==
X-CSE-MsgGUID: JLkSsT/+TkmAcZSR4IKu6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="247741907"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:12:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 08:12:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 08:12:47 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 08:12:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHwP0NeG/rcYkNkDTCyaF/8Kenogx/oJmPyTpoXvcUg8cHAGHSFNtoKgbiBL/MpbIGzu5BzyVcKNIjsAyXVrkc5V1sC/3vL7dIRQBbLgOCMySkt7ey1Rmo5a2KSH3CEn9DF3sIaANg3qag7lzM5yoHZrwQI0CBaa/wNCEc6jCb2irlgqCPx4l+rRHtKvSB1bwmgTEhmZc+Mxniqw6iIxlK9h+AKkcTvf8e56RM5SXfqRYRBjNBVV2f05e4RPbMS9h1lWkNJbBn2D2xSX71skOnhvEtgF3xM3HKA3cQ5RnW7WL8mJdHbzTuPhJ7dnbWOAMw484wXI8YnMmJdtVbHRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78XIqkavxtcij96fpq1oQ1pEP1+H5+QTjVN36xJnNnY=;
 b=ZkYOOu7p1Lor40KmycJO5ZHycmtOgqr39BkR3g1nA2fRYkPb29zSauLDeXFDVA+8wAyqp06zm36X2BZmLTa1ZTyFCKM95A+MuolCx1bE+RO+xktbNGFj/t+U3h642jVi6Xkk5fYG4dXTx5S1UO1rgjlq7F7uDLilXluKHMbuRM9Ngr0BtfNfaXjgJhHfRiXuFfkmzTKF9gU3d4K1Nq0Zk49iBtY5BVe6KSwzA4NHjk1ANRY/53jyyYai/tLtmZvjLEUTu7LJR+9TXudPGpsOckRN/SuyinTfJ522xfxpjDSGGCO2PVZyDK2DTMTAhH8jvyZzMIWFtIH3kUFvpE2Eyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH7PR11MB7962.namprd11.prod.outlook.com (2603:10b6:510:245::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:12:44 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 15:12:44 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 1/4] tests/intel/kms_fbc_dirty_rect: Avoid
 unnecessary PSR disable
Thread-Topic: [PATCH i-g-t 1/4] tests/intel/kms_fbc_dirty_rect: Avoid
 unnecessary PSR disable
Thread-Index: AQHcuqWMrlagEcjQHU+Tb2mx87iwP7W/U1awgAAJQOA=
Date: Wed, 25 Mar 2026 15:12:44 +0000
Message-ID: <PH7PR11MB6053479543624C327171A243E749A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260323091205.100585-1-jeevan.b@intel.com>
 <20260323091205.100585-2-jeevan.b@intel.com>
 <PH7PR11MB60537107B78B57562D3DEFFCE749A@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB60537107B78B57562D3DEFFCE749A@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH7PR11MB7962:EE_
x-ms-office365-filtering-correlation-id: f2feb7cd-6a6d-4356-5e79-08de8a80f775
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|7053199007|18002099003|22082099003;
x-microsoft-antispam-message-info: KoAR86tTxFlWkaph7u9O8gHjZidiiVuCqWDPU5/l9GBTiQkI7ZRhA3uAZej7cZ2SQHeBz8PsfurAq4iKP51ZVhg+AZ3UwwON9C3ttZUGYeHd2s94FX3tpl/VXN+IrvOZduJ2OJuwrO2LJxstRJ/D0zpfclrEjGDvR9q/wHw2063bYTSkqSGVueGzfcDn3gZYen2RS3HUjb96mUiyyR7u2d1eMRAwLVPZF5BFg+TyQmKYz97p6Tr294WC6AUeiaSHOZ5NOm+9aUAlktmeDx9f7gh5wU+A6GoexquBRoWFOlZu2D43jU872iPttmICsc/jTxtP6i0IuDE4QTsfPUZEFJsYIDC69dhl7LUAlUcBjAaY2F2XPxhjmurRV5lzhrbeZzf2u8mYmGgTMQDAma6bqGh6QfXcNiHEw60Cmkgs04jVXpG4WeXuCZRyDE/cW2qW3zKPwpjt9xahueG/y2pwmKcL+WGeqKDWTq+7RdoxArrUE6VORYmzgIgN+IzPiNsasuYs/k0vWXInNRme2fwkOB7VxEP0yvjHzhUq8iBAl8I8WzXLDvNQ84TF8oeA43JOETgKlr8pbv7iBQWqefO+gAPVX0xcL9NjuPhYG10W3xdktufYgoXIXmpdiVJGdLt+lL1A4fEOJOdPXjNHFMSt8gP7bAGnVcMQvvshWgG07Dnt/cEdqeR1tTxIG25e5FHmUoIIS/FPFbTWtzQARjtDKZm9xux3skxJ386VPo3b/L1riUU59lYglkKnesUA0PLyweq8mcjgWMdP6Xq4gnqWM80f7uoVBM+30xtNXrGjcFs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(7053199007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eDj1PdqF77fGm7DTrbUQaiCELDJc8IG/2ROi8ox1t+IeR0JHsib5EyYAdwq/?=
 =?us-ascii?Q?Bsjpkc7oKdoUU13xm1el33u7ewKCc7sG1fyMK6ORG1l2WnxosIXyiwI//CSt?=
 =?us-ascii?Q?FNqikJQTQeR4JXRXLyAWAlZhOiVB5sl45WLZw7IibFsAhTei/y1lZwfTSrgJ?=
 =?us-ascii?Q?2Ib5JyhOeWjUwYS2gCJ0CKe+/ifQvsCjMPCFtoLdfmZSCnweK3M2PpGQwAY2?=
 =?us-ascii?Q?HoiUQeu8JWRpUi3XSyf6/k5JmBzpxRMJq3Tb6KLwKq17E2sQro9a8hCcTNYj?=
 =?us-ascii?Q?Dpuz+nlauTsL3skfJe2JcBeoyqtvRvsmSDiV5dSLocGSDNQtyEVsy3auM/HS?=
 =?us-ascii?Q?3jc3ukFtXr8KITudJapsoPIlzL59O8TOIKRS7GXvuaCcfac6mvH5vJokMgB0?=
 =?us-ascii?Q?1YJVGGsxIYOk3Uv0vqhRlDciblDEq3yZgLUzAFAntX8y0zG6aeI+yi8pQGjE?=
 =?us-ascii?Q?ftDVSCGCY+I0G4PnAkoid0JleWP23DLISQSJbOgT5Gg095swhbLVPxEeicPU?=
 =?us-ascii?Q?0Gz1Wz+xGhk02MnNaak9JPQoQ5YEY6+GLY/WJtEIa9/llm4o3qHKEDGdR0AL?=
 =?us-ascii?Q?ZFJ0DvvompDveWf9mF3y4QNIz+9V0Ron9DGkepbg/WMtICx+hCO5U3V6mHEr?=
 =?us-ascii?Q?RAG1UgZT/JRFEQPJWCDT6f3K6IOMjvQPx0LqzQrXNqlcBeV3Yy24wQeZ0j6r?=
 =?us-ascii?Q?yfz80f98ckUvUt2w90xf76myMhSeFxnwjVBpXOA0A4oZr2r1HEnlma8mjoEm?=
 =?us-ascii?Q?b9sWaKXE9d5EIK4xF6xveFjYWrfBtLaCGo0mkeY15yR+xPrhvRNzhC0uG5GG?=
 =?us-ascii?Q?F2gPmJL7BrFa7Qudxd8cY6nG6vD6Q2VEaZENj71tC5ImxNFw3o/OE+242eXM?=
 =?us-ascii?Q?YMLtJZj6Sd1v2TMCmPbuEuVVICIy8/S23l+/U2wWJCLhfSsbxO5xIxROVlXS?=
 =?us-ascii?Q?yN/wcX/+3jYgGCJ+GGPJLsipO1YYaI4Hojom4lEYZMnFon2CthLJf7srb6wz?=
 =?us-ascii?Q?X3Q3nI5sfRbNptXiZzK4MlbbJXeoioFj13bPs9ONnjIgIn3OkHTDnXHbvHuW?=
 =?us-ascii?Q?VA5a4lyAEUG/XHsIV3x5rfKZRYN2aTFj58IM385O9GC0OwE0eFoYbHE1emwE?=
 =?us-ascii?Q?2Il+sqRHefMxtkEFVnAwa26PiG4ZGXjjNiDiPkBoI8V6TZrJsDuGKoJgF/v2?=
 =?us-ascii?Q?Zph8zdxSi6ln6j96PBjiMcqPmcFFsC2KDU7NsnvFl3/dcFJXlxRl6IhCPDr8?=
 =?us-ascii?Q?h/qp+kNhrpHZuPaM8XGaXtPjXH3XWkVdF/piYz3WSJJeDF40tYfcPYL9o8RG?=
 =?us-ascii?Q?3VE/zgF6sF51/9Ga7mwQ51WTnXy6iyD/mKJRUtFdeuvkkrsXpTCWUQ8HM8iV?=
 =?us-ascii?Q?1enT1vJYvCTjkPyUuSFgDMX+6A9qTl5p11nCfAIQtjBkSpDDkd6sWM47SkpH?=
 =?us-ascii?Q?lHhYlwQI7B8uc9+wxJ29SFn2ho989CBWNFXeZMoD5ITIqWPnmNsF3quXGIBH?=
 =?us-ascii?Q?5J5VSbW4e5NxBDV4G5pubwbK6RdykzFnqWykh/eQZY48ZRqakfU7ESQfg7Lj?=
 =?us-ascii?Q?YXF45C35fcV54v04tPubHf55W9Z1Jv04u4iN9zgjD+8imITCSWYMJynCN2I6?=
 =?us-ascii?Q?ksiS9Y+bm9R2InWN7+N/M11QT8BrI1SLe9Hy12QYNxGd8egtL4YCSvstAwPA?=
 =?us-ascii?Q?yzdYMLCws/gQW+IAKu373ce3vkuVcxp2SUXTL5K9F5uwvyFgk8nSnBT880zU?=
 =?us-ascii?Q?AbvOJXl+CA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fBLBOa1XkBLM08vrhqEG5ddKvvGQIjLfR9i9HrtOW0zILa/cgLesg9W44uDXXvPZEObb4o5xdxSiFYn/HEnRRLrugEtAKBGqT+VcUgCzqp/bewp59eLWAbtnzkpNwRe0KghFT3OPZiG2KmdnYVdZR2xzF9KD5kIkwy3zesnE0KyAz0idtfSMNX00XfPGfJH9xURjNtpawD9wjSxTNN+FwKeQA3Z4qstMTB4FzOEvNV4tg96m1mvYSvp/JW4iZyvBn4esydubI1zVXyqu1+2/5VHQChOBG7YD1xF9Q5NjFATktFmDQYCEcunwrAiGywbnub8QRkeOQl7hPcmfQoGSpA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2feb7cd-6a6d-4356-5e79-08de8a80f775
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 15:12:44.4534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RAffDRjl8lgq+0BwF84C+IyBrGy6ifHwtLpdTdagufEwhRNJinFulsnwTW0MmX5KP6NzHdDFPmR9x7cAujYfaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7962
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Samala=
,
> Pranay
> Sent: Wednesday, March 25, 2026 8:19 PM
> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Hogander, Jouni <jouni.hogander@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: RE: [PATCH i-g-t 1/4] tests/intel/kms_fbc_dirty_rect: Avoid
> unnecessary PSR disable
>=20
> Hi Jeevan,
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Jeevan B
> > Sent: Monday, March 23, 2026 2:42 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Hogander, Jouni <jouni.hogander@intel.com>; B, Jeevan
> > <jeevan.b@intel.com>
> > Subject: [PATCH i-g-t 1/4] tests/intel/kms_fbc_dirty_rect: Avoid
> > unnecessary PSR disable
>=20
> It would be clearer to highlight in title that these change makes the PSR
> check per-output instead of global.
>=20
> >
> > Pass output to psr_sink_support so PSR is disabled only when the sink
> > supports it. Using NULL performs a global check, which is unnecessary
> > and can be incorrect on multi-eDP systems.
> >
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >  tests/intel/kms_fbc_dirty_rect.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/intel/kms_fbc_dirty_rect.c
> > b/tests/intel/kms_fbc_dirty_rect.c
> > index efbd46985..e7634dbab 100644
> > --- a/tests/intel/kms_fbc_dirty_rect.c
> > +++ b/tests/intel/kms_fbc_dirty_rect.c
> > @@ -414,9 +414,9 @@ static bool prepare_test(data_t *data)
> >  	igt_require_f(intel_fbc_supported(data->crtc),
> >  		      "FBC not supported by the chipset on pipe\n");
> >
> > -	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> > NULL) ||
> > -	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2,
> > NULL) ||
> > -	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE,
> > NULL)) {
> > +	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> > data->output) ||
> > +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2,
> > data->output) ||
> > +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE,
> > +data->output)) {
> >  		igt_info("PSR is supported by the sink. Disabling PSR to test
>=20
> Should this log message include PR as well? Since the above condition che=
cks
> for PR status too.
>=20
> Regards,
> Pranay.
>=20
> > Dirty FBC functionality.\n");
>=20
> Since the check is now per-output, consider updating the log to include t=
he
> output name for better clarity.
>=20
> >  		psr_disable(data->drm_fd, data->debugfs_fd, data->output);

Suggestion: Since this test depends on PSR/PR being disabled before validat=
ing=20
dirty-FBC behavior, should we also consider checking the psr_disable() stat=
us?=20
Failure to disable may go unnoticed and later it may show up as a misleadin=
g FBC failure.

Regards,
Pranay.
> >  	}
> > --
> > 2.43.0

