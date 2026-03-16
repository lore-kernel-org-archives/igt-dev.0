Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FFDF53D7F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 17:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AC710E1F5;
	Mon, 16 Mar 2026 17:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWoX96vG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C6710E1F5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 17:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773682040; x=1805218040;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aUSn1WDhoIemuIaxWyUuBP3mEzKtqHr48S1nAaThyAs=;
 b=gWoX96vGPBK2Xdz/VthgtBSe5EsQCuDSYceu4ckq/rRvtDnGXd23sQEw
 PEeknzIkg8JCghWZnQGhHQP54p8C/p98/2zUwlCCGIRTjB0v0yDsMdDuA
 1NcXhFVpdfFhTtjUbr4CCulAaDUR8VHDS0LPvo2u/uO4rU7JCZUSOK/oe
 r4YVtT2spqDbaDIkNqyBlL/nukBCG6XtE1pC278X5PKZmB7xgipetczgv
 bKhj2NnyLvQuuizWsmIKzrIfv5T/0BeeVj39g7vOdhSEnSsHzC2iAbQfp
 gMBrl0wlUJM0eA29Lllr6tfJOERt2ac5ktL0zeUTVa3oBr/1uas+rFx/Q A==;
X-CSE-ConnectionGUID: f2Oxys7nQqKfTjnRR+3YcA==
X-CSE-MsgGUID: TA3BusZ6QXKeLb5xxMNhbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="86059576"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="86059576"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 10:27:20 -0700
X-CSE-ConnectionGUID: vymvLUw8RpqTAVNQ4DPvxw==
X-CSE-MsgGUID: lz9O+UsKQ+G4tiCcIZaQrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221227862"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 10:27:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 10:27:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 10:27:18 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 10:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMjUbbFy0LKhQiaDI+rF1o+WsTFwazaS6+jscunDTXO5RbB0my75fQRdngAilCJp5NdlVOkePhg7srAJe76tbppGwSKXDxqYCIw7f0GE2i333PKK1yefd34LB6rM+CHbF2YMHrDP8EsRCmYY47kIMgu/C4svozZIou5Lbfzj9CaELGUL5RPwZH/faH50YDS1oDLUJ5vtORtS8i4uMSxvX1NRA6nw4DZ4nyW/F1jyBrhW+OkOWJf9mqp5KWLOC9TJEBNJSkI35eufQG/G5H9UfYXVrDorRgtiuQu2AgdWtwvrQIU0Je5nJnHZHUOAIRroj9SIgGY57nBJpcYqJ3EeFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhn6iz2XuHKKwlWo3d9n1kt8SlSCQnZTwfj1OCfzamg=;
 b=agWDeHDX4+xpahOlyyoa+8XX4lrWKSk/kYCGyKzgpz7PJlP9AQ9gmSMiThe/8Fm78ZME4fZDG1slGEjj7J3cywd/4cdlt9kIaew8W+Lkse00cQe6qS1rwxqa/gln+B5SLwXc70QeR9RV6zD7qedK/71oi8iYHSwbt3cW0QQ51FzWHYgNfNU1UxR36XkyO10hnzgWlz/AEbZzwcaMqGs9YwhkdfLPrkXRA5MBoWM46B0hFxSLrWGKrmGwg0Mj6Xl7fd2qPI933Kp47maiIDxuo5Iahzdq56GtuqbHs/4rAmhY8qIBh+rIV/sVgFigIotLhoojBtHJhv82H7/tYFoW0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.9; Mon, 16 Mar 2026 17:27:16 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 17:27:16 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier when
 supported
Thread-Topic: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier
 when supported
Thread-Index: AQHctPaLDYcsBBeUBEOmmbykcWgRbrWxPO4AgAAtJIA=
Date: Mon, 16 Mar 2026 17:27:15 +0000
Message-ID: <DM4PR11MB6312386897459B61FF1CC3BA9040A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260316033807.24078-1-jeevan.b@intel.com>
 <abgWhvmToId2i7mj@intel.com>
In-Reply-To: <abgWhvmToId2i7mj@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SN7PR11MB7509:EE_
x-ms-office365-filtering-correlation-id: b3ce5b91-57de-47f8-04d0-08de838144ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: vrrQ1SV7dIz7A56xHTCxV0aydMIRflnbp9y/Fqcy6MFaWLU49A0NUJfKspHsIN6t4iqt4jEBP5M86zpVWtCGL5t69uYnlI+AI5nVSot9iQqgWPeCmZlZcC4PCPgXsLiUJpzKBnlKzCalbRnXLAzxfT9TX6FnpxbLW+ucM8DdQ1JM2NdiPAYQD+4jyZs6OvlNnN79Yy95mTUv9UekVY518EZLZV0RysafDZIXI9gL3ID859MALtZ5KY+JWIWsbw6Z95pVh4lkoXFMrvqbGx/KCmSrCW1ui6hMMirev6iZLSqrgIpf4IoRbrfWE4445xSNXzJcHZHyqaT2l3mS5DUy1/hQsC4obyn2qw10hQ3LZLUsZbJQt/cdhQJ6XN4Bn1mRi0CZzslGzZciSaP25+hcccdiH/ZFuvpIscpblBebhXpo00keLdilcdxO/YlSUYEZRCIRlz4fu9KyISgsBRw3v9qCPCkt7qBX4FgzUGYLvhKkPO5iUwkx1BFCnxU4MnnA40tDIClGJI22yytAzrArg1kolh41TOZPKWVneG/hx7HLESmj+2IyypuFRXJzwcvQP84J4I3loVvHDlBbC7mPsRREtnq+d0lTrdZBTHvAJx/A6zk4aK8V5ulABrx6T9kSSMiPLl07ftBxVTgirH5HcPnIz9IHVHt0LHhgpA1HFDa6CYQaJvAxQNrXSX2T+o8ChNHWvLndS+bcYnMVi2q5jdLuUzwMZUVoaqVNA3YAle92V191yP2pdlDVoywAhB7Z4eXOFEGwirDS51kXnnsJ/uG2JUpapr8HjveMzSpDHUo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?EVKyZwTVU2XaXZ2slfzEO3n14jpBGtu9oCHbqau6Uv3Qhnpytntuahdib/?=
 =?iso-8859-1?Q?2JCh2YGEI+PMsTmcKDJdk26N9rlvbM8XdsQkuSpAkgTBRWFQSuzLZ1cwo6?=
 =?iso-8859-1?Q?Y046VhEhflULmpkissLSs2sSruqxcOzT4VjnC5ynZ4bmxQv39MAtrJP/sp?=
 =?iso-8859-1?Q?gvTwagLkMdbBd+MgVZg3zL4zOwgP1VtlTijxgg0WHp+c/eCo61NVUzB9Ns?=
 =?iso-8859-1?Q?p+TZnyQpfvTU6P1QX1VgF5XLMxltoz5ZMebjH4scB2iQNhkyfYOXwbVcZZ?=
 =?iso-8859-1?Q?3ZjUsX+CQdCRKneQ/mGaxwtZ7BeIoeM9PgwhKdmZxUFqZana8EyjzJrnHQ?=
 =?iso-8859-1?Q?M8POhVs5wkzPuQNlJYRPZ3Bh1AJsTsXukF6NoXMU7hFacNezy38pqdDoG9?=
 =?iso-8859-1?Q?rF1N0fq7EC4KKIiHHa/ELBfW/GznhIVL/TEJLR/rn5Q230uJhDwyvfeQ/D?=
 =?iso-8859-1?Q?UsiYwR/nnJNA92ZtBrZImF2mQO6EJuyWY24HnIMuVcVKZzbzbzwZgtZwPt?=
 =?iso-8859-1?Q?1aH3APrLOVh7zEtlqCi+hV57XsjIp54vDprAT7eJed9sB3vsprDbcxWSBx?=
 =?iso-8859-1?Q?rzxuzpDCkvhpe9ryEGipzYwflvlnK6bM9fyaO6bMm7vXriHn/h1yLAVPrI?=
 =?iso-8859-1?Q?848DyHXfj8ajXwjSUCrP6dWVEDvCCx2YprpMFjQt/Wloo5YWQ6B8ssMiJJ?=
 =?iso-8859-1?Q?Wxn089SHdpdNJpbsklIiORYTy/eF7VSrT0dR21fgEkByWyKM8t+u+hSsO8?=
 =?iso-8859-1?Q?6mLyUSOvEKGkwOVvyWbXhtCW9f5UjHnWkZogiie11gCdLqH8Cmzit8LUYm?=
 =?iso-8859-1?Q?YW05UFEJzlzTbZF87Wq7w7Pujih7cIl2piMBRTUvLmpTiu5/WQZhNRWpt4?=
 =?iso-8859-1?Q?eEWMqzjt3z4sMUFgZFfDsgU2UJzP1H5zSH60bpzyrvIQJPsQXRwZU8RD9A?=
 =?iso-8859-1?Q?R13Ehq+TSJF6YKJLZ6rWsB0hADNPnWv9AXK30ONrnkkqpb4waCLVTTPnPo?=
 =?iso-8859-1?Q?8sIhGmJ84iWba9R1Hlt21TRmgxwY/+KHuo/A/5A+s4Y2eIKUhiWEvj87Pc?=
 =?iso-8859-1?Q?ezAAdctcEu0eSRF8tm9X4sMeYGyHayBBzcLUvCrmmrLkNUsfacSWwXdKf+?=
 =?iso-8859-1?Q?s5Hf/pVrv+7KfM4dAuF2Ug5tTbQUP8Ie8vj7kwL/p2XsjrKtkeSLTfHvTw?=
 =?iso-8859-1?Q?ZUw5xf3cNAoSVTZjkpAL7ueW1SHjD8nJEOaOCGzcOM3hPg63jGQ7RG6Ckz?=
 =?iso-8859-1?Q?fLxhveLwKvkfJ6kvqSkbmcwcVF9KESu+c6aC9YscS0BrgRE7ROp4c/NEeu?=
 =?iso-8859-1?Q?9uQxkuyr6j5k7dyZaEjdniSVmCuZR1qtOW7Hy44RWPFi7I0SsE49ak6HGn?=
 =?iso-8859-1?Q?kRjwSKsoS2qL5/P357zIOZ7cBZd3OdjLarJZMWHAFOa4Rev+GtVbiReAm1?=
 =?iso-8859-1?Q?gbGP0l/pOEGr8isg9HatFTFDWJiLjrQPUv3hbCwBjqst2Z/LP7ZY4U5BtE?=
 =?iso-8859-1?Q?MedlJ5m3TjZwYHC/s4trh8tlK+M6b+c/+SIy6zGccAAwpcBCO3uasgCydL?=
 =?iso-8859-1?Q?ojvP8tetpZJLbfFF0yt1aQeP40J46k8DhiPUwFWHK+14dc6q8ZApYigQr7?=
 =?iso-8859-1?Q?aQXlu+I4/OLU/bCAPFRr2Xcr2dHvLsK+XRnbTNIEQ/uMKIXqFelcQetYAq?=
 =?iso-8859-1?Q?NuIvP4bkO/ERe9oOCEYdOxJSlbP8sROg0Vb6LiXqUZwfvUFsJgicBjJqhh?=
 =?iso-8859-1?Q?MHVHrAyhHpogVgjJi8HE3DRZa5/k0jt2fVuJNsOKfCz8D9?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kahGXk0qEmYO0XOsoIS+6A8rTZrxWszDBZ/3Z+yox82peSW4RAOeCvPNqEZIKCXCDSXXro3Vk501fYwNeBJf/+x9z1DO9y9GkU5U5Sn1YKU81mca1/2563cZOjrn/ZSNGdZt0/ldwlD/qcSbWGDNsWtSi1B7H1ipFFvyhUafJgknQAd7Xpz5KK3wr+AqW36W4ISdAytsmPKIYCkw3OEU1RKvljR+YJyaJsv3oYo02WVHDKhangQq/hpm0AoQhuiwqmebaSd9gIC6doZnHY1iSWaC3T+zX0Y5VyvXLGXaRFKVKAyLyWJbWRYnSMRoh/H1B+hd08axbn2ml61t7jl8gA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ce5b91-57de-47f8-04d0-08de838144ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 17:27:15.9115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yA7NVDoO1XPZRdqb5WzUYlgJ1wV8hEqxwgrJ1D//osFNnZcnqeIgmKYoUQJOtWwADXKSeDfQqh9cTPpMhdCVxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
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
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Monday, March 16, 2026 8:15 PM
> To: B, Jeevan <jeevan.b@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier=
 when
> supported
>=20
> On Mon, Mar 16, 2026 at 09:08:07AM +0530, Jeevan B wrote:
> > While creating the framebuffer, prefer tile4 when it is supported
> > instead of always using linear. Fall back to linear if tile4 is not
> > available.
>=20
> Why?
On Xe platforms, using the linear modifier takes longer to prepare and subm=
it a flip compared to tiled modifiers.=20
On HRR panels, the available frame time is small, and this delay can cause =
flips to be submitted in the Evasion region,=20
leading to sequence mismatches.
>=20
> >
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >  tests/kms_cursor_legacy.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> > index 5399ef481..4c4e477a1 100644
> > --- a/tests/kms_cursor_legacy.c
> > +++ b/tests/kms_cursor_legacy.c
> > @@ -367,15 +367,21 @@ static void set_fb_on_crtc(igt_display_t
> > *display, igt_crtc_t *crtc,  {
> >  	drmModeModeInfoPtr mode;
> >  	igt_plane_t *primary;
> > +	uint64_t modifier =3D DRM_FORMAT_MOD_LINEAR;
> >
> >  	igt_output_set_crtc(output, crtc);
> >  	mode =3D igt_output_get_mode(output);
> >
> > +	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> > +
> > +	if (igt_plane_has_format_mod(primary, DRM_FORMAT_XRGB8888,
> > +				     I915_FORMAT_MOD_4_TILED))
> > +		modifier =3D I915_FORMAT_MOD_4_TILED;
> > +
> >  	igt_create_pattern_fb(display->drm_fd,
> >  		      mode->hdisplay, mode->vdisplay,
> > -		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> fb_info);
> > +		      DRM_FORMAT_XRGB8888, modifier, fb_info);
> >
> > -	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> >  	igt_plane_set_fb(primary, fb_info);
> >  }
> >
> > --
> > 2.43.0
>=20
> --
> Ville Syrj=E4l=E4
> Intel
