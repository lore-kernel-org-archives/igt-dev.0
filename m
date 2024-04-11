Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B61C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 14:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FC710E9F0;
	Thu, 11 Apr 2024 14:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLDkVCBq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B62210E9F0
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 14:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712847516; x=1744383516;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FaB9zv3j3No5LpSHLwFmwSHp/6Szi+kAyjl0nnJWH+s=;
 b=MLDkVCBq/SogNOn6wHbNZkE80vkqnw3u5aPlXzMdxHB4HVMwuacRDG7K
 hjX5fKxHOUE9il+Awumdtnoq6xwtg1QWuqWJDsKzzAVxYsO2ak1jrk0QR
 5EBGWtaeZckgE3QMQUzFxdUU3ZSh/Fqq3yqleItaphifm5hBmA3X++4ol
 l3vcRIZJOn//97ZCFM2oaoR/04jNXFR65PliEuRiSW1wFfNZw90aKIpb6
 3wES7S2kUu4RiwAsXSVJg5Iw683zkvRE59DP5hlZ4J+XcHMy/gywSBVUk
 rI0f2+R020ynAPAkfwT+f0Ekog6U+0lHTL472noEnSxz0g3ghcGgE/dL6 A==;
X-CSE-ConnectionGUID: E/dme/t+QES7ei19HOrGmA==
X-CSE-MsgGUID: 47vHk1tyS5W3PmMJNRz/+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18865433"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="18865433"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:58:35 -0700
X-CSE-ConnectionGUID: pil/d3G1S/eKtTpWltitZw==
X-CSE-MsgGUID: FCvBSfojTYunVZPl6t2wow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="44205189"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 07:58:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 07:58:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 07:58:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 07:58:33 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 07:58:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePOCEFmgOyfvxP4jYX5j68wywqVXxgxnMubrIdTBU2F423a1T+Vxfab2Wx26XENZiMqBljCNkHZruT48nHcBdlwph3ZIgFlngLqjhFnPlCeZjN7dxF3CRPIk8UO1e+K5nI5ES4n5dvBAvsYSmBUNNI0xE83bn6T5fzipYGWF9ODzBfOhmDwVLMprLQjq/s5cemmYJDnEs+5ezGOpY0BWIUXp+/+qYOLZ2Jtldmw+/HYHxFl/Yv9J/lN2RyrNVEBXggVC7XdSgvBoX8jq/OnM4WeZAOgcrg0P80XbCN8UUlMmuU5on6aHIlfzy9AxGQOXmce848NF1CikCgBHjZGWHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gdMfmKFfJLjqTiKDLjI9KXYPeWgqFjpyc3lhmJ41TQ=;
 b=D29+s2hTjq146H7A3SnTxGqhiBuw9xJ7uS6Z8cbO36Y90eJ9u5Tky7SKME7tEhLiLD9qS8cXqNxdFGpOyZTy/CTaF2VbGQe2Ovv6Xe15iW5tEZ8MSv3X2XrCL6L5tqpPeGYDHi+jPRkH7cFcv0iO1pYiti6YvRrJD3V9RGos1fwjN3GyMi93eOK3hmwfRPfqYm6RRNdift9+PMoYOgrVud+HlCDeHsFjeCIhFlZTEqFD0rb1jSqS4+nmaN2YZXLIRYzcIXgJRDhb6xoSWy4CAxcaRLoX2xVuixvFtehaF3F4/OQWRPbbCk2ySAkYSkKdDKE2iNvEC5LuvCT7WXGslw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11)
 by PH7PR11MB8011.namprd11.prod.outlook.com (2603:10b6:510:24a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Thu, 11 Apr
 2024 14:58:30 +0000
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::2e00:6a0:1e21:b016]) by SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::2e00:6a0:1e21:b016%6]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 14:58:30 +0000
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] lib/igt_draw: Add support for writing onto
 already mmapped buffer
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_draw: Add support for writing onto
 already mmapped buffer
Thread-Index: AQHajAYK2N/HtedSKUaqYd62mt1VybFjIeUAgAAHLvA=
Date: Thu, 11 Apr 2024 14:58:30 +0000
Message-ID: <SJ0PR11MB6789ABCF32BD2957833D099D8D052@SJ0PR11MB6789.namprd11.prod.outlook.com>
References: <20240411114804.21206-1-vandita.kulkarni@intel.com>
 <20240411114804.21206-2-vandita.kulkarni@intel.com>
 <20240411143142.t74npydf2whvtotv@zkempczy-mobl2>
In-Reply-To: <20240411143142.t74npydf2whvtotv@zkempczy-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6789:EE_|PH7PR11MB8011:EE_
x-ms-office365-filtering-correlation-id: d6f7b568-7733-402e-2e44-08dc5a37da11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A5XD5ZvUKhHAoap1u7wcEbJNNj3WorAtywfs66ONSwKqL/uXh75bWUVO2mdjx1Nj5Dbiomk3RnGDQ1fyWelrxyQBR3B25UWItXaJGuNnqnqOmWlE1dIhuvI4jhONGaNGjIPvE8Ysvtk3j8rZhwFnyFoxK2a0WVkbFzF+iIAJK2Lud2rmPedoCWloyXAN79BnZcfqjTdotmoEtmyLwhA/CH2aFM5mJsosorIF2lRcpN77atAa8cSvk/tNAyXGK0UDifbzvN49WDbEeLm9SmwyJAxu71Jm2LZjYLZoSX/n6B/+fCQ6fDBlS7d/pMZYM+rM8Cosp8ASyYJyHBhmOLf+5RW58DYOJPicJqpRNpixJcV8iRWNHT7uuTELCt6tKtxYXyu+XmcBWHIO4hGi+06BQlEr6mAqwl5fD0/yPbbTTn2jGIFWGB9pSsy1zeDtf7bqcfOF6UQZP2pWMLXsUq2wivNtbynf8qh2dD5Cpw2FyHxpC+y7vK/DyWNCJPFpxvbpq/rG9JFCdzyJ6r53DHogjo5FEiXaIadLwW99svk2phZPfv6QANY7XRaMQwp4L6sozxYTngVl3PVEgsGoHpvYy9xIJBvU6t41h/+N0VLDS888kpRWeGro8o0KAKJWVYebIYLJiWPzciJOV4wCg1CdT8E/6BD/Vwj+tIECV1NOYqdFyY46X0Rih81Tq/75uYZmGt6cZIoi1vmTQwRD7HBrc9tNTu2j9ROHr5qtcqQvhQs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6789.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V98ZvrSj3OB+XeCmpPcGyrfqcNJgV5LsNQVg3qelStnLuCrux8/HokqudUEQ?=
 =?us-ascii?Q?nTVBIhuMWxorbSkmkIx6uUFCKxBuo2ojo3hR32tiE6YcXkeQgFP76eKOPC62?=
 =?us-ascii?Q?GUIXPGFQBUYNezaph+JFcb57LEUfeFPRQF0xVAVWLBqZYgTtckOfZdT88orO?=
 =?us-ascii?Q?FywEfkon4wyPErwWDMUXruhrmDFueo9aq1+q2nHyRM56YVl4E3RI/ekJxYNn?=
 =?us-ascii?Q?c0QX81yXxdExMNFWIwgOiF0aRfh5n86++u4YOlUYsqGqOSf+eOOq8TaAVoDn?=
 =?us-ascii?Q?qZQI9YfuCp9qZ3YeEllMX4oWXMXKl5bvzyGBB9CDvNO5SGAsui5l9OLCpaeA?=
 =?us-ascii?Q?25bkXGT5YLqvrBLGXkz+iHHvFMXF9Tj90KitAPjGtKgTmn93yUeoVVmpsRx3?=
 =?us-ascii?Q?hFnDAQzGAlB2MTzg/q5e2/+41keU8P+DBYuB0cf6NdVkJTvyp6LqDXtsFJRj?=
 =?us-ascii?Q?kETQVFFAwv6cfbJKyPv+3xBcH8Soy8xYDudSphnCLCYbH3AnNKk/BifQNmor?=
 =?us-ascii?Q?tWc4+arMCK9veBLwMiwwKgi8Dy9SYvkqHfaH9Zzoo94bMSs5FjWD93PzRair?=
 =?us-ascii?Q?gwWjrfItlbRLy98AsiuXcHSQ1uApUpA1UPYSns8y9s/smK3XtXTNaDk2dFxF?=
 =?us-ascii?Q?cN2481iMkJ2I4Q6genWZfGJD5lMnGv992zaZSJrHEkGONjfu9raquiwVm0fY?=
 =?us-ascii?Q?YI7sTmBo5sakiWckHezqU+FkQUQVoUbiZ8jIKEJw85WpUVza9ADetvPBC9la?=
 =?us-ascii?Q?Ot0nbx43PXG5wpCYo6b8Ckym+PgpDxEXaBMTzQNtvtub56MUppHh0ktMG7AY?=
 =?us-ascii?Q?KT24qNjSdRjzaLuTD5zH1oEihxsvY9d5eHoEdue85ZslIlLWODZO2MyPNm0b?=
 =?us-ascii?Q?DyjUVTbk9NSXW4G4TD27pMubJxxvPrux7GVJ5aYpSZquz/6oM0CFpGkDgJC4?=
 =?us-ascii?Q?Fji+SFgsTURYsJuFvxahdLZJxXu6tnyjszcgHIKMPmFZVtgVIsB0WfOeUSMk?=
 =?us-ascii?Q?HIyCRFdOyA5XRYPjXJ55fCNVuMeuNEQsML8HJA1ewrkfVpYBXV/jYpOnsuoN?=
 =?us-ascii?Q?SSdvGtBB3+uaN4vsTD2mQPGR5LX8y/zNhsTsFAq0Q1juoq+T72LjLbNAXx2p?=
 =?us-ascii?Q?4asPAK3fsQrctxfCTPnzwInb1/Y/7I3Qqy+zlQ2XMr8lv/iSpr9ibBFhM/OC?=
 =?us-ascii?Q?s/+0NG5Oyeh5f7f528v6+WE5jIy/fiBJ/orXYk16ZDosin7oBwm4SQUIlGms?=
 =?us-ascii?Q?bJgw0yBtGs+PyKImqVVa1zMRVcLz66PhnoAozRbEbngwesl5B11pZDlxRj1A?=
 =?us-ascii?Q?wtXPGKsEs89p3SnRkakyH7LqzmYPoic3w3WfSSdjYbZgheNSp4d3q3Kwv/KW?=
 =?us-ascii?Q?VTeTULcXyOMlxiSBusKnQNnQVxiqV/PChy330AEiO06xOP0Tu3uu63b3VUIR?=
 =?us-ascii?Q?7jKbdQ5BkuE9QvFxjKqDX8AMOj7lin4tzxKzHjYYtdoE9sYzn5o9hQulBIRf?=
 =?us-ascii?Q?p3x9Rj36+M9nzE0Vm1RcXjCSW9FeOWHNE+JROeQGu6xiMoboRUmh5wKd13m6?=
 =?us-ascii?Q?xyfpjs0JZNfsddPqlSMxYzlSOa4TjChRuv8RhlHQ8cEOK/9IXGX63BwT8lal?=
 =?us-ascii?Q?vQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f7b568-7733-402e-2e44-08dc5a37da11
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 14:58:30.7647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k5HK7WN7rS4doNiU1geHABlayQPcYhml3dpFG76FUdaf9CWmXBblPhvMSwxUiGXHKdbjhr1pDtBAVzkLISuH0UvkEg+Bua5G79hcOEGlHDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8011
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
> From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Sent: Thursday, April 11, 2024 8:02 PM
> To: Kulkarni, Vandita <vandita.kulkarni@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t 1/2] lib/igt_draw: Add support for writing onto
> already mmapped buffer
>=20
> On Thu, Apr 11, 2024 at 05:18:03PM +0530, Vandita Kulkarni wrote:
> > Provide another draw method, for supporting drawing onto already
> > mmapped buffer.
> >
> > Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> > ---
> >  lib/igt_draw.c                         | 37 ++++++++++++++++++++++++--
> >  lib/igt_draw.h                         | 11 +++++++-
> >  tests/intel/kms_frontbuffer_tracking.c |  2 +-
> >  3 files changed, 46 insertions(+), 4 deletions(-)
> >
> > diff --git a/lib/igt_draw.c b/lib/igt_draw.c index
> > 2c01d7b02..e458238f0 100644
> > --- a/lib/igt_draw.c
> > +++ b/lib/igt_draw.c
> > @@ -75,6 +75,7 @@ struct buf_data {
> >  	uint32_t handle;
> >  	uint32_t size;
> >  	uint32_t stride;
> > +	void *buf_ptr;
> >  	int width;
> >  	int height;
> >  	int bpp;
> > @@ -110,6 +111,8 @@ const char *igt_draw_get_method_name(enum
> igt_draw_method method)
> >  		return "blt";
> >  	case IGT_DRAW_RENDER:
> >  		return "render";
> > +	case IGT_DRAW_MMAP_PTR:
> > +		return "mmap-ptr";
> >  	default:
> >  		igt_assert(false);
> >  	}
> > @@ -541,6 +544,27 @@ static void draw_rect_mmap_wc(int fd, struct
> buf_data *buf, struct rect *rect,
> >  	igt_assert(gem_munmap(ptr, buf->size) =3D=3D 0);  }
> >
> > +static void draw_rect_mmap_ptr(int fd, struct buf_data *buf, struct re=
ct
> *rect,
> > +			      uint32_t tiling, uint32_t swizzle, uint32_t color) {
> > +	igt_assert(buf->buf_ptr !=3D NULL);
> > +
> > +	switch (tiling) {
> > +	case I915_TILING_NONE:
> > +		draw_rect_ptr_linear(buf->buf_ptr, buf->stride, rect, color,
> buf->bpp);
> > +		break;
> > +	case I915_TILING_X:
> > +	case I915_TILING_Y:
> > +	case I915_TILING_4:
> > +		draw_rect_ptr_tiled(buf->buf_ptr, buf->stride, tiling,
> swizzle, rect,
> > +				    color, buf->bpp);
> > +		break;
> > +	default:
> > +		igt_assert(false);
> > +		break;
> > +	}
> > +}
> > +
> >  static void draw_rect_pwrite_untiled(int fd, struct buf_data *buf,
> >  				     struct rect *rect, uint32_t color)  { @@ -
> 839,6 +863,8 @@
> > static void draw_rect_render(int fd, struct cmd_data *cmd_data,
> >   * @buf_handle: the handle of the buffer where you're going to draw to
> >   * @buf_size: the size of the buffer
> >   * @buf_stride: the stride of the buffer
> > + * @buf_ptr: Pointer to already mmapped buffer, to be used with
> IGT_DRAW_MMAP_PTR,
> > +	     otherwise can be left NULL.
> >   * @buf_width: the width of the buffer
> >   * @buf_height: the height of the buffer
> >   * @tiling: the tiling of the buffer
> > @@ -855,7 +881,7 @@ static void draw_rect_render(int fd, struct
> cmd_data *cmd_data,
> >   */
> >  void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
> >  		   uint32_t buf_handle, uint32_t buf_size, uint32_t
> buf_stride,
> > -		   int buf_width, int buf_height,
> > +		   void *buf_ptr, int buf_width, int buf_height,
> >  		   uint32_t tiling, enum igt_draw_method method,
> >  		   int rect_x, int rect_y, int rect_w, int rect_h,
> >  		   uint32_t color, int bpp)
> > @@ -870,6 +896,7 @@ void igt_draw_rect(int fd, struct buf_ops *bops,
> uint32_t ctx,
> >  		.handle =3D buf_handle,
> >  		.size =3D buf_size,
> >  		.stride =3D buf_stride,
> > +		.buf_ptr =3D buf_ptr,
> >  		.width =3D buf_width,
> >  		.height =3D buf_height,
> >  		.bpp =3D bpp,
> > @@ -907,6 +934,9 @@ void igt_draw_rect(int fd, struct buf_ops *bops,
> uint32_t ctx,
> >  	case IGT_DRAW_RENDER:
> >  		draw_rect_render(fd, &cmd_data, &buf, &rect, tiling, color);
> >  		break;
> > +	case IGT_DRAW_MMAP_PTR:
> > +		draw_rect_mmap_ptr(fd, &buf, &rect, tiling, swizzle, color);
> > +		break;
> >  	default:
> >  		igt_assert(false);
> >  		break;
> > @@ -935,7 +965,7 @@ void igt_draw_rect_fb(int fd, struct buf_ops *bops,
> >  		      int rect_w, int rect_h, uint32_t color)  {
> >  	igt_draw_rect(fd, bops, ctx, fb->gem_handle, fb->size, fb-
> >strides[0],
> > -		      fb->width, fb->height,
> > +		      fb->driver_priv, fb->width, fb->height,
>=20
> May you add 'fb_map' to igt_fb struct? It will be more clear.
Sure, will do.

Thanks,
Vandita
>=20
>=20
> >  		      igt_fb_mod_to_tiling(fb->modifier), method,
> >  		      rect_x, rect_y, rect_w, rect_h, color,
> >  		      igt_drm_format_to_bpp(fb->drm_format));
> > @@ -971,5 +1001,8 @@ bool igt_draw_supports_method(int fd, enum
> igt_draw_method method)
> >  	if (method =3D=3D IGT_DRAW_RENDER)
> >  		return
> !!igt_get_render_copyfunc(intel_get_drm_devid(fd));
> >
> > +	if (method =3D=3D IGT_DRAW_MMAP_PTR)
> > +		return (is_i915_device(fd) && gem_has_mappable_ggtt(fd))
> ||
> > +is_xe_device(fd);
> > +
> >  	return true;
> >  }
> > diff --git a/lib/igt_draw.h b/lib/igt_draw.h index
> > 1dec95e86..e6cce7295 100644
> > --- a/lib/igt_draw.h
> > +++ b/lib/igt_draw.h
> > @@ -36,6 +36,7 @@
> >   * @IGT_DRAW_PWRITE: draw using the pwrite ioctl.
> >   * @IGT_DRAW_BLT: draw using the BLT ring.
> >   * @IGT_DRAW_RENDER: draw using the render ring.
> > + * @IGT_DRAW_MMAP_PTR: draw onto already mmapped buffer.
> >   * @IGT_DRAW_METHOD_COUNT: useful for iterating through everything.
> >   */
> >  enum igt_draw_method {
> > @@ -46,6 +47,14 @@ enum igt_draw_method {
> >  	IGT_DRAW_BLT,
> >  	IGT_DRAW_RENDER,
> >  	IGT_DRAW_METHOD_COUNT,
> > +	/*
> > +	 * FIXME: This enum is placed after IGT_DRAW_METHOD_COUNT in
> order
> > +	 * to avoid it being used by other tests which test all the DRAW
> methods
> > +	 * Once we add support for this draw method in all those tests keep
> it
> > +	 * outside the total count. Some examples are kms_draw_crc,
> kms_frontbuffer_tracking
> > +	 * Similarly add support in igt_draw_get_method_name and
> igt_draw_supports_method
> > +	 */
>=20
> Instead FIXME just annotate this as 'NOTE'. I think it will stay here wit=
hout
> touching for a long time.
>=20
> --
> Zbigniew
>=20
> > +	IGT_DRAW_MMAP_PTR,
> >  };
> >
> >  const char *igt_draw_get_method_name(enum igt_draw_method
> method); @@
> > -54,7 +63,7 @@ bool igt_draw_supports_method(int fd, enum
> > igt_draw_method method);
> >
> >  void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
> >  		   uint32_t buf_handle, uint32_t buf_size, uint32_t
> buf_stride,
> > -		   int buf_width, int buf_height,
> > +		   void *buf_ptr, int buf_width, int buf_height,
> >  		   uint32_t tiling, enum igt_draw_method method,
> >  		   int rect_x, int rect_y, int rect_w, int rect_h,
> >  		   uint32_t color, int bpp);
> > diff --git a/tests/intel/kms_frontbuffer_tracking.c
> > b/tests/intel/kms_frontbuffer_tracking.c
> > index e45d17dd6..32cc50712 100644
> > --- a/tests/intel/kms_frontbuffer_tracking.c
> > +++ b/tests/intel/kms_frontbuffer_tracking.c
> > @@ -2262,7 +2262,7 @@ static void *busy_thread_func(void *data)  {
> >  	while (!busy_thread.stop)
> >  		igt_draw_rect(drm.fd, drm.bops, 0, busy_thread.handle,
> > -			      busy_thread.size, busy_thread.stride,
> > +			      busy_thread.size, busy_thread.stride, NULL,
> >  			      busy_thread.width, busy_thread.height,
> >  			      busy_thread.tiling, IGT_DRAW_BLT, 0, 0,
> >  			      busy_thread.width, busy_thread.height,
> > --
> > 2.43.2
> >
