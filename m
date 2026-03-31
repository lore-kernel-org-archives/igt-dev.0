Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F27A109B467
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 13:37:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A2A10E9A7;
	Tue, 31 Mar 2026 13:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0utV9HJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAEC10E9A7
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 13:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774964258; x=1806500258;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wcu+KFft2IgXj8uo8uYd2vqDLnoE+ge78tJWFiDmRQs=;
 b=K0utV9HJE5tp0wEtfjlJwEX7MCJrdPGw9Jl/f0jgZfHtbt7KO0i1mXEv
 rbGP0kexzygfowyuVeGMVPvtFFmMlsItYH4O0KSAQxo8ihAtZCAW4RjlA
 XwE7V6Q4Ge60wuGh4eJ/8b7VN3OQuz9DGndmL8GKU7W1eynMqi2BEcc2D
 OJJxJUu6e1kDL6lNiInFA8xZcIKHooA4Lcxit3u41lEnJCHEuU6BxK/Gp
 hbyLQRG6mZTmyR7S2yZp5Yr5IBd8RuNYeo3u7vVSevK2xnqnTOg1EBh6/
 SKpxs9mBtut3D6lUuRi2h12p1LsuqXj35IKbgAiRLQiLxLWb8YUdRjYpU A==;
X-CSE-ConnectionGUID: 9xRXcMUdT16cF27MLium5g==
X-CSE-MsgGUID: rqFPuVBaQbuedZLN7aIBAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75940615"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75940615"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 06:37:37 -0700
X-CSE-ConnectionGUID: MDcAaz3UTFycGeLlz+ej+A==
X-CSE-MsgGUID: aS3rCpyhRGOrfveS3kruQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="226238268"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 06:37:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 06:37:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 06:37:37 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 06:37:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPy0Q7/3xJ8RoiX/A/8quP8ZwrPa1IC5O3gUwoW1TRKV+TXVzLGfMWoYC7RN4OpC86QPFnJus+ZX8KojjO6IWQk6VVcd842c+OW/nvusqVe0rHmrxOcFZhr5iaFRheCYgoi3L6dWlq0pf8I2Fqb0gUfeU5X7bfdjQ9Dd/2rZoOZqaH6q8Qz8AVdG4JFfnmDv51dSQpRV1dEa9PwmcoA/bw6lovIE8K9NEykRxJzsHYMjFlkVSbeVVatpRGd6nDcyNopVTf1Bn/8z/ziE7/McjykGcN6c9XnpFkvWb+NxAxC4/ZqkPMq4+evM3spj7dVXI4VVmMP2brXxIQbH5ahozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfNGyFrMUYIImU1BqJh8/e1ikkVRJTTJ4D+UnPh7hrY=;
 b=WN1HLMiEw1UbsbFI8iJB2MbYjyKQRNXdMSfU0TMCSaFQJYnAjL4zko9dpzRWZSePsbHeI9f/xniB6r8SbYMDqyAJXJ2fNqV0gFg4BpGW3IR0ovxoScnFjqp5BiGlbS16waJS6VCgo71CilHdlu1cfYfrN/lTcDbmMU08nM5Mvkp+s6nznXXFpcvf+i3fjWBFdS97g/2FfsssZUJi91QZvnLYI0rAKxreNigf7lEwd7clYG6VIh8vnCplzCQkHvw2qjGuVnNA3W027qXSCCRieQwS/rtTejSw0QmymIZsSH3UKtyHu17SCbXbAOZ9+4RH1cghvYAGbnfES0X7Hy3m+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH3PPFD9C09B4A7.namprd11.prod.outlook.com (2603:10b6:518:1::d54) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Tue, 31 Mar
 2026 13:37:29 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9769.015; Tue, 31 Mar 2026
 13:37:29 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_setmode: Add HDMI 2.0 clock limit for
 mode selection
Thread-Topic: [PATCH i-g-t v2] tests/kms_setmode: Add HDMI 2.0 clock limit for
 mode selection
Thread-Index: AQHcwPsZaXFExTjbu0CjX8vsqUuTTbXInF6AgAAIbGA=
Date: Tue, 31 Mar 2026 13:37:29 +0000
Message-ID: <DM4PR11MB6312922FD2D9B65F985EDE579053A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260331104100.614718-1-jeevan.b@intel.com>
 <acvGy0C97UmDxLg2@intel.com>
In-Reply-To: <acvGy0C97UmDxLg2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH3PPFD9C09B4A7:EE_
x-ms-office365-filtering-correlation-id: fef89a8e-dc5a-4448-170a-08de8f2aa797
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: W9Y6/V1JXS5tJBmXMbxpTUvP2MJQdmw4G7Z2K4HdBlTpXN5iNh+KNCjM/Mg5rcWviufbF/O32yo/tIDsniduonFW0C/MPPchO9n6HVHWXrJso3YfJgRXRH1JFP8RvbDyS3dPKQLR/OZ4l24r5ffpK7uz3Q4l6KugFu0LPmniFDG/pJSPOss+ikPeAywrdmjXQlCNFVZl0uGRXxNg+mCHCPjmLNXD1QoBBBG3G4y0StfMystdyor3zwxbixWAob/F3cp1FVvZVvsIDv5armj62hCVK3LOMXUtKVPAKdCh25abs5QyBk0oCWqWqwTsIM7pEscd+G39XtToiUjoBp5a4+3a+Gr5HjPk9d1GtKcOzmiGJplvWogJLKl4uWQT8HLfjt/RGkXP48rQRzkB4JqidIHl5LQbusj0tDyBRvVuIaunM9AB2wk2nYHP+bryz1Zm51nqdkyipPit34uw8CGYhWjJXM9kOX83moBpbQSMtNlrdsCbj6bIgS/dG0qsjIjvhhBO+/EkrFpE/9XpUGJcQMgc99QuNQXjgKsDBRk3fcSjAzoyOyX7OfGjbMymu6sLJnoh0N/QyYNFaE5bCkg8TVuKeENh/+JwQ7a54jfoU+r/LH1IFCJIX7oyxbDURAWGlkEXbRn+cSRPSoYzneDLVBmzj2yUc/Y7/TtkgjJdAH7TMfN09Kw12BuDIFp/EEZ/YHtVOaa9L8HGK788MyBEF311PCLdO4FDM0YG9jdk7e85C6OCHRTS/2t2OBBxn1/ND9ZD13j8pqgYhQTgfbn5tzkSlsOxp/yZV43nuJ9g7Gc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?e++dz10UE7KDFFdAjTHSedAALubIDhdrRA7OzMZwZH+QohNVos3Wtn9WQK?=
 =?iso-8859-1?Q?bK+hMxXs2ELJ2KI9k18miihaTBJeXeX7/Zqiv/zgXtlgqP4b3egQsyl5sI?=
 =?iso-8859-1?Q?kG1txgKDSo2qAZEa9O3hrSKthlh12uB6pHqyBBhKk6Qioag6Zffblkfe4P?=
 =?iso-8859-1?Q?RwkK5zOGREThtyRCRWwAv7WGlK3aGTTp09Ky9552wUg4usXYeNM2gh7dWP?=
 =?iso-8859-1?Q?Pkjdh6DFNdKG9/PuzlrB4ALWcttcX7y8v3qq+GAcaNZmamZ5TLhIFMeJz/?=
 =?iso-8859-1?Q?nL5wzJNi8hD/RF+GseKM093LRv3A3rI5igz5N5PQRfC6aoS0CzbYzmEh2L?=
 =?iso-8859-1?Q?wePBICSkrqK/TLNvFEaIcjZW4Ep207PLmSLwlGH+VIjDBoyzOWLChZQWb2?=
 =?iso-8859-1?Q?PX/m6am1r3vSyiIJe6pxelazEv/bGcJZbps2Kbch0rj1psFnt94KDZz0gU?=
 =?iso-8859-1?Q?++0cMhljF3Jxy04wTpM9McgltymIcYtoT2Rkr87aTF1OCZ1s2K16lVYIGl?=
 =?iso-8859-1?Q?oLtA+MF5KauMaaQsXP8QoOoLzCpUgPlMSN5PZbwSPuLLyEyi1eqY6Eafpl?=
 =?iso-8859-1?Q?lRV4pn6YRnnkFCOxIfbjp1n5x8y5LwLUJNZxQYjMGzcxCKZQoXbJ0yNFw8?=
 =?iso-8859-1?Q?vAaH7Gw1tuXYDPqx3qPcvaV217N3of0y9VhYgfnvT9omf8ZtlL3KhCm89T?=
 =?iso-8859-1?Q?c8n0hlCA0l7P4v92lbkviiE7S01pB1re6ICSHVVgcfKh2xzXjTiD06yQPI?=
 =?iso-8859-1?Q?70Ue69AoWS62F0rdUZ5GwIF5iHqHm+32Ae7U0q0Gewq2lHh/HPQV63nG9l?=
 =?iso-8859-1?Q?hrpF7cQynkzz61eG443dBnrVVFSLZHwrvCkoRs3uysOi7OXgRGk9a0v/aR?=
 =?iso-8859-1?Q?DrlJDYEgYv1gr4uuYMmUwAaW3NgkGZk4GG46O20PFDRgU09lVIFX3NavrS?=
 =?iso-8859-1?Q?urj+wqW/kwr0YA+u7Om/8VJ9y4K+0muRrPp8si0fdiVNYleVnuLI0/xGek?=
 =?iso-8859-1?Q?khXS5MRGJwDrRJGU0PjPHkYUH/jDhXbRaBT4OlyRsdXbXLwsjMDB+hT6Sg?=
 =?iso-8859-1?Q?VqxIgY6MJ9PVAgstvyNuSg2TmcDNM+5TT0eCtaFhQK4epQOfrXn8PAUs/W?=
 =?iso-8859-1?Q?mInahkgu7kHm2mUqwMW2SYPkcVOKCDewg+nq5aX1ZyzsMOyEzL2q3d+FYa?=
 =?iso-8859-1?Q?LUehfPpWdj+h6RSfpKJJTIN/YLl0whIB/YIHMt2qVndSJ9NpJPUnE+okQi?=
 =?iso-8859-1?Q?Q9JB8X1phkgngOGynLBH66+i1MQLYk262hQGlJ5t8fDaNfeGBFyYHCBtGb?=
 =?iso-8859-1?Q?0448El+ga72h2sf8gGGWQGO/r1TtyP5lZXZ9M4riwkR7J2W1vKkcMBP4gk?=
 =?iso-8859-1?Q?yoOt+IKRPs6E3Sh//62LIxMm1MttvFrkJbGdpnChF/drp6njDHW+5sX+s3?=
 =?iso-8859-1?Q?a3a0PTz2f7vpH7dShNmGz0xraVvjMYLCYdmAbDjZ2bXU48O8HZ8pzGDugA?=
 =?iso-8859-1?Q?wFbDBJKidK49aG8+FJJUp+/M8AxSGGvxlDUJ1uNdvDSIU1ZM4gCGpAs01F?=
 =?iso-8859-1?Q?RhIC9JkLZyDTSJGRGsqLBH5xkRczen0wNWx1JSWBmxVVzf0cHM39ZmcsOm?=
 =?iso-8859-1?Q?riFbOpA+WvYca2BnIX/fTs41JpYtMPgmQuVYUpGliitOHYgzKl3xWkxJQe?=
 =?iso-8859-1?Q?p0Lu/oCsxGPsawYSXKNipdmvgtLcfzhxMc/g4tQ/2nRvg6ZMAYr/+WWvt0?=
 =?iso-8859-1?Q?mEjzqJZkAIbSeh1VD5NYrtBd22vugsopinrQq9Bj3eFKca?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: twyLGx+S/xJSMcR9kEa58fAGxYR1++xrNJJukxgeVTE8mkoL1Wx0Xqdzcx5MWLJSIWTlHscfm1YP6yhd8COO29wAc2OfOQBOLjJL2QZZ4B7LhLsf+gKLejFjR3zh9TeikmyoCMXGVwNLnoZbEp95YZZZqAf9be50qVumCUdZelwN1dKtaTjc3Sb0fksLWglcLLVBojX2T7V0lTkUjPgIU/EhZn8l0bfNw3TlJffb4+Y9RrJIxgzxoVTqZEdEMrDGixxAjXVqxkrYaL35aCM6qvQZdf+xdVxIAN8p0qMp7ltF0QHlCpDyjYaN8uP/ItpWtWiOoIOqnSHxkZVZbRhbIw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef89a8e-dc5a-4448-170a-08de8f2aa797
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 13:37:29.5972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qDRPLy51T1O2NglqHNUdW/D58ldVrH5qA4VDqpZvPTLnXF2ebIrpH477iyutpV6qe2XeluGPuR9Xns/6QYHBhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD9C09B4A7
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
> Sent: Tuesday, March 31, 2026 6:36 PM
> To: B, Jeevan <jeevan.b@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: Re: [PATCH i-g-t v2] tests/kms_setmode: Add HDMI 2.0 clock limit=
 for
> mode selection
>=20
> On Tue, Mar 31, 2026 at 04:11:00PM +0530, Jeevan B wrote:
> > eDP modes with high clock rates were being forced on HDMI 2.0
> > displays, causing kernel to reject with EINVAL. Add clock validation
> > to skip incompatible eDP modes and fall back to supported modes.
> >
> > v2: Add HDMI 2.0 clock limit helper, drop crtc_supports_mode(),
> >     and ensure per-connector compatibility to avoid invalid modes.
> >
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >  tests/kms_setmode.c | 44
> ++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 42 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index
> > 1f2849bc2..f1c1afe45 100644
> > --- a/tests/kms_setmode.c
> > +++ b/tests/kms_setmode.c
> > @@ -79,6 +79,9 @@
> >  /* restricted pipe count */
> >  #define CRTC_RESTRICT_CNT 2
> >
> > +/* Clock limit for HDMI 2.0 */
> > +#define HDMI_2_0_MAX_CLOCK_KHZ 600000
> > +
> >  static int drm_fd;
> >  static drmModeRes *drm_resources;
> >  static int filter_test_id;
> > @@ -165,6 +168,16 @@ static bool
> connector_supports_mode(drmModeConnector *connector,
> >  	return false;
> >  }
> >
> > +static bool
> hdmi_connector_mode_exceeds_hdmi20_limit(drmModeConnector
> *connector,
> > +						     drmModeModeInfo
> *mode)
> > +{
> > +	if (connector->connector_type !=3D DRM_MODE_CONNECTOR_HDMIA
> &&
> > +	    connector->connector_type !=3D DRM_MODE_CONNECTOR_HDMIB)
> > +		return false;
> > +
> > +	return mode->clock > HDMI_2_0_MAX_CLOCK_KHZ;
>=20
> Starting to test all kinds of random thing here does not seem maintainabl=
e.
>=20
> I think the one sensible option is to make the test skip rather than fail=
 if it
> couldn't find a common mode between the connectors and the modeset
> subsequently failed.
>=20
> As for the external vs. internal connector situation, the test should pro=
bably
> try to find a mode on the external connector(s) that has the same refresh=
 rate
> as one of the modes on the internal connector, and has the same resolutio=
n
> (or less) than the internal panel. That way we can use pfit to upscale co=
ntent
> on the internal panel instead of attempting to force the external connect=
ors to
> use the internal panel's native mode.
>=20
Thanks, that makes sense.

This test iterates through a large set of valid and invalid
crtc/connector combinations, so trying to enforce strict compatibility
in mode selection is making the logic complex and hard to maintain.

It's also becoming harder with newer internal panels supporting high
refresh rates, which often don't have matching modes on external
connectors.

I agree it's better to keep the selection simple and skip when no common
mode is found or the modeset fails, instead of adding more heuristics.

Longer term, it might be worth rethinking the mode selection strategy,
but for now I'll keep this change minimal.

Thanks=20
Jeevan B=20
> > +}
> > +
> >  static bool crtc_supports_mode(struct crtc_config *crtc,
> > drmModeModeInfo *mode)  {
> >  	int i;
> > @@ -270,8 +283,35 @@ static void get_mode_for_crtc(struct crtc_config
> *crtc,
> >  				if (conn->modes[j].clock < mode->clock)
> >  					mode =3D &conn->modes[j];
> >  			}
> > -			*mode_ret =3D *mode;
> > -			return;
> > +
> > +			/* Check HDMI 2.0 clock + per-connector compatibility
> */
> > +			{
> > +				int k;
> > +				bool compatible =3D true;
> > +
> > +				for (k =3D 0; k < crtc->connector_count; k++) {
> > +					drmModeConnector *other_conn =3D
> > +						crtc->cconfs[k].connector;
> > +
> > +					/* HDMI 2.0 clock constraint */
> > +					if
> (hdmi_connector_mode_exceeds_hdmi20_limit(other_conn,
> > +
> 	     mode)) {
> > +						compatible =3D false;
> > +						break;
> > +					}
> > +
> > +					/* Ensure connector supports the
> mode */
> > +					if
> (!connector_supports_mode(other_conn, mode)) {
> > +						compatible =3D false;
> > +						break;
> > +					}
> > +				}
> > +
> > +				if (compatible) {
> > +					*mode_ret =3D *mode;
> > +					return;
> > +				}
> > +			}
> >  		}
> >  	}
> >
> > --
> > 2.43.0
>=20
> --
> Ville Syrj=E4l=E4
> Intel
