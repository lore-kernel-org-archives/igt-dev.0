Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83146C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 02:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0268B10E388;
	Thu, 18 Apr 2024 02:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROZRumld";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0013110E388
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 02:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713408171; x=1744944171;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xJuQHQeQG/PHJlDBiIznr0Oxp7vcwJfjrlDFCbROX/w=;
 b=ROZRumldf3B2+fnjFhwU/hD2AjXrWIOTS2JIR9uVy5hOMin/rY/nk4ft
 XSB0V+JWyfI0YZaZ9EoatenTVKME7d0uhYOBcFR8lCNwl9dO5v5tvjwTY
 NY+BFQD+TVMouxacDX74EoXKBAB9naQniF1hHhe4s9w0wrnuFjh6EYOQ7
 A6RJ7Zke72HltoKNRkkG31I8McnsW82aTRzp+tlGlFD88Fxv4wZb4Ox8c
 W16irNavrvMJun+44ssC3ehA9+sp8+423wNXTGNDdMRercQIpWywvfswN
 /5zRr9Ke3GZhi58Q2j3ptTfuMAIKg6jCbyTHuuqXjujcmlxR6WNOt5Iq+ Q==;
X-CSE-ConnectionGUID: 4u5AKkCqSayylO8SuY/kgA==
X-CSE-MsgGUID: 5MEQlzJ+QjGIt3DzU366Bg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26442045"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="26442045"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 19:42:50 -0700
X-CSE-ConnectionGUID: FbFP8J1tRoGHE38kOFGVRQ==
X-CSE-MsgGUID: iPQlr3WTSH6y7/Y4Zt4UKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="27628771"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 19:42:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 19:42:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 19:42:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 19:42:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 19:42:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6k0t828DArpTQCNJZdIpG6aZcs3tNfzAfZfVOYEXmhW3ZV9K6pXdF/FjS5WFzI/Jw6wBKREe1RutQASnurbMiNbp2w6QPDqtg7uEszWwaOrRVXOrw+8J7FsOQU9Axvqx9QJE/L1EIApOMbstyXwktX6nowVnaykL00TUkzWsDKyUbb+V04RIOkKBRjgMY1DzLWJVZKUFYDq5w5UY5y2woMjSGyUr4tV5vRh8nl9d0ttLnA5mFx+RwlrT7jkN3Mfc6qepWoniiFoWDAGFngMdQoic4KqqbpssM+HV8UJJu/lLPLDBRv77JoW3YQxsu7a0YjNWklnjIdADTs85KLKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVaKAcTspxwUYjeKQkrAuJHwgKGTk5OfLv/uQCeygRg=;
 b=lrd0UYGoMS3SEHJH+e+EtusU5aGLoiJ31cDgy1wNYKf9kr0RUT5Zp4EIOvBs1A/MYewhC7RcEtZ1wAjJNqYB7T8kfsEkPqv7Mx5pPQrD5cmtiM/yRTOSVfTN3IblZtEJ5h16jC5YX5/UZQrJtukHbtnNos+zaUFylazdX7WDXIPJmCr62azQPZ5SXYIeDUYDo4Nl89QCy7LtYFCxBDF7P6ljFfzoHTj5AB3EGRA+ovyl40ycozesHu5ROb06rZEDa8VdjHXjOjhiY4WVeKuWZAl0dYfaZf7coEcn2ZEHNxdPPg0bFYsDBiBC402vj42lwoi70C8T26zpAimGzcKlhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11)
 by MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 02:42:46 +0000
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::2e00:6a0:1e21:b016]) by SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::2e00:6a0:1e21:b016%6]) with mapi id 15.20.7472.027; Thu, 18 Apr 2024
 02:42:46 +0000
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 1/2] lib/igt_draw: Add support for writing onto
 already mmapped buffer
Thread-Topic: [PATCH i-g-t v2 1/2] lib/igt_draw: Add support for writing onto
 already mmapped buffer
Thread-Index: AQHajDIcAzh5sehaWkOnO1ZRwgG2s7FkQEcAgAkZu+A=
Date: Thu, 18 Apr 2024 02:42:46 +0000
Message-ID: <SJ0PR11MB678988145AE7E50B411CA8AF8D0E2@SJ0PR11MB6789.namprd11.prod.outlook.com>
References: <20240411170312.5615-1-vandita.kulkarni@intel.com>
 <20240411170312.5615-2-vandita.kulkarni@intel.com>
 <20240412073756.6srn5npdagj2simx@zkempczy-mobl2>
In-Reply-To: <20240412073756.6srn5npdagj2simx@zkempczy-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6789:EE_|MN2PR11MB4757:EE_
x-ms-office365-filtering-correlation-id: 115beb9e-37bd-4bf5-f4a0-08dc5f513ae0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YGUidiS0AN8Na6phGOS1nIH8misURB/dYh1jqtQJ/X4hm19tfT8ULADkpn/fcRCDEftKkZ1oR3cvmvCCwUn5rh6yIcsxFHLHTcdrwDiPi52EKwn3z/DWe6Hh8BUD2FSKfgABDmWMn6B9zhOWO57RWpwThMyCA5SiLwMxsY+gw9BaniUdFRXg2ZXSsSmkWGbJ4QDMxZenSgRli9JW8HxovrwiFf1bUpxDqk+J+e6bg9L5wLn/66YczOy4cMc6BO7k2OTRYVlVd7PiVexHXW76vdeSHOT++qL57tKaYNX23zACJR5tXD2f5mzAEboKStg4vTtNrWN1ynMm7wuWBDfck8DJ9RcvhhGS9vQDh6X7cEUT8L+VVZQFED/W0TK9zC75pXP+Os/cSgfRk9chraThK7EMpxhAsqej8YnUbPBaqM1dx6mUVa5/emaYC//nDxBRUsYBuJohiPet/XwghCvx50QUvJEU2d8HjczCqAGpN29CV1seHxbi3qcFtbRZMZcp/H0sQjE3sAATZZXM9t1hs5/NHtOAye6V59ZCyKMgUy22RhkmvDNK39VqtHsdCt3rQ/cif0MSGTsPX9sRREI+F+75KLWwWqEb/AapDX+utYEf2M5Z+eY/tSkPlWGR9KMDoC6zQdeVPsE0C3OGpbhl+xZSmV4+GYpHmcHretG24Dx6FcUPnsvYsY0r/55mJ0sxwIQzSIs3ml2CTxP/STiFYBDw7R/7acPVjFEU5o431LY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6789.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mivB4naEXtDm4Wo0N1ZJXyRokwPkIrMzBvGgew/LE51JzuYvZJZQHowSSItS?=
 =?us-ascii?Q?hWwEK5BaUfnodsHihxkfjHM2I0JXRMj8s7xRs6pnacEn6NMRvbTw+mXQw03Z?=
 =?us-ascii?Q?5QcAwh9b3K/iSk18tM/UxOOWoVMKD5TNMHTOb/mweGWLn304n0dDC0npUMRB?=
 =?us-ascii?Q?CXHnSsGnoRTXRfj+1GNgto57geMv2t7G64QofXpCUso+2yPpnnKG/ikLPORU?=
 =?us-ascii?Q?TPOX83Q27dazhggUeKsxOkvoHIQbqobA917koz9CmXGRKm0TvtTQ1V0Stzd2?=
 =?us-ascii?Q?N21a+wy0SNePd1Q6ZGD+hZlqRzMIHSL1yhr2sen2pKwCveqIe8xVhwBNkspM?=
 =?us-ascii?Q?W26scLsxDXj9IpROF5N60HTLlZWL96T9YTAWh98dfXpvaIeM4tCb7zWcrH2N?=
 =?us-ascii?Q?8NPEmvrrO5QlAq4deRqzbKcf3/sNtfbpbm28WtNpgUsVan8N/k2kCtL0Feyt?=
 =?us-ascii?Q?gogKtOWRMNjxAgb7DJRgXv4x2/CVZoEv3YtnfUzOxuYsGROBCOirHTZ4fv83?=
 =?us-ascii?Q?w9FE7158YXvI3SMtFQIFfyJxJu2vsloWxdeAuzGRWVdp4mlawmUuNWrDjnxy?=
 =?us-ascii?Q?/ewjwB7Ve2JR/Qh0TqLNLngU2PnsGR6u8SMD86I55Pr9ueON6a4XqZ7piMR3?=
 =?us-ascii?Q?ixBkm6V55eA6uME/yRMQ5dqi461Bi/6OZ5sAHA40WBFwdmqI3K9oxC+uOBCS?=
 =?us-ascii?Q?jbUDqgVgMxtQvuivpuC0jq0wSr9qEFooLEp3mdSkslsVItSP5rsrqdYfxpYa?=
 =?us-ascii?Q?cKG/LALjfwRbh+0yd16kyePaWOjBjRSv8HZp8GB6Gb1GhDhTXlfECckYoWJn?=
 =?us-ascii?Q?S0SfjBwxgPohXekAN30QXzfTLzUMM0WY09c5GXsx+dJDyRduM7HS4brjvP8Q?=
 =?us-ascii?Q?jZe8dwK7akNtwSyLRvGl3oCnh44U6+W3w52GP4pEoCwLfwfLBgeDWbF9Xhwr?=
 =?us-ascii?Q?yj61D01/biEtVbwIDt/tFP+jDmzj3h8yo4CLIvb+Zm1h1Rqwzv2EUfmH6mHV?=
 =?us-ascii?Q?thvwWHMw1QGc5riCeNr8NOwJh5GJTybhS8ONmI0PcSgQ92Vd1U0PyqkvFUM0?=
 =?us-ascii?Q?hR+k6k71QjXIYoY5V82laIEKwtgCVdhfCStLWzgoSL7rnN/pq4BSfL9sdltn?=
 =?us-ascii?Q?1q4qyxivK+xLqaYc/AAbJ/Xh+nRPtidOFMohyz7wPVJkjcgpBM5KKTlCXulj?=
 =?us-ascii?Q?xzoh3rEOUrAwcqYV0g507agbsmFSnZ9XePYZosF5sA/5nKfFxI0R1buwk/hw?=
 =?us-ascii?Q?HBg9I/+VCJPfk25z36ay1Skuaaq+4qH0WdMBNcoGFjsTR6naYCM2kvs9pA4i?=
 =?us-ascii?Q?mYSVLn5ReJVgxBwoCO9h0VUdMNUpET3doJQA37dM7Aof1TBMUMObZ5RxXHJf?=
 =?us-ascii?Q?AEW0SDX/Mvbs2DjEy3gBV5ykGjB0PK2RiFPpx3EK/kBAYntUqoAvdMSh3toE?=
 =?us-ascii?Q?DYHZO/lnS2/Kp99LHwG/Xy3sQi9L2AXrf2Qmq3/yDhYoG+KqY1P4HD8Pmxov?=
 =?us-ascii?Q?h54VD/faeYgKnvYWFrb+LNaMpiQhhA/CdfEHtUdMclT/LAgNq3VXNUmeqzW0?=
 =?us-ascii?Q?o7qpfVCHy4kvToFZzhiKrgpPNhScYqI7T64G/y4/vN768StaEJYjo2oB1AKU?=
 =?us-ascii?Q?zQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 115beb9e-37bd-4bf5-f4a0-08dc5f513ae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 02:42:46.4135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDo9G6DhEoH/tF1gwHPA/S2ZT/L12fLPyR9vqV+qLLjNHnZm7ToOTz4k/wOxBLRtlkk2hOyKCVdqA2zBbVwS7eXbewK9ccZ2xj8zMrLBtm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
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
> Sent: Friday, April 12, 2024 1:08 PM
> To: Kulkarni, Vandita <vandita.kulkarni@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t v2 1/2] lib/igt_draw: Add support for writing o=
nto
> already mmapped buffer
>=20
> On Thu, Apr 11, 2024 at 10:33:11PM +0530, Vandita Kulkarni wrote:
> > Provide another draw method, for supporting drawing onto already
> > mmapped buffer.
> >
> > v2: Use fb->fb_map instead of fb->driver_priv (Zbigniew)
> >
> > Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> > ---
> >  lib/igt_draw.c                         | 37 ++++++++++++++++++++++++--
> >  lib/igt_draw.h                         | 10 ++++++-
> >  lib/igt_fb.h                           |  3 +++
> >  tests/intel/kms_frontbuffer_tracking.c |  2 +-
> >  4 files changed, 48 insertions(+), 4 deletions(-)
> >
> > diff --git a/lib/igt_draw.c b/lib/igt_draw.c index
> > 2c01d7b02..8673a6e58 100644
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
>=20
> Checkpatch complaints about space before tabs, I think you should use
> spaces only here.
>=20
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
> > +		      fb->fb_map, fb->width, fb->height,
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
>=20
> I thought WC is enough, how this supposed to work on i915/dg1/dg2?

We need this support on both Xe and i915, as this test optimization is need=
ed on both.
I have been using igt_fb_map_buffer in the test app, in turn that calls map=
_bo.
map_bo has support for all kinds of mappings, hence I added support for (is=
_i915_device(fd) && gem_has_mappable_ggtt(fd))  || is_xe_device(fd).
I have tested this on i915 on mtlp and that works.
Is there anything specific to dg1 dg2 that needs to be done for map_bo?

Thanks,
Vandita=20
>=20
> --
> Zbigniew
>=20
> >  	return true;
> >  }
> > diff --git a/lib/igt_draw.h b/lib/igt_draw.h index
> > 1dec95e86..4979342c0 100644
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
> > @@ -46,6 +47,13 @@ enum igt_draw_method {
> >  	IGT_DRAW_BLT,
> >  	IGT_DRAW_RENDER,
> >  	IGT_DRAW_METHOD_COUNT,
> > +	/*
> > +	 * NOTE: This enum is placed after IGT_DRAW_METHOD_COUNT in
> order
> > +	 * to avoid it being used by other tests which test all the DRAW
> methods
> > +	 * Once we add support for this draw method in all those tests keep
> it
> > +	 * outside the total count. Some examples are kms_draw_crc,
> kms_frontbuffer_tracking
> > +	 */
> > +	IGT_DRAW_MMAP_PTR,
> >  };
> >
> >  const char *igt_draw_get_method_name(enum igt_draw_method
> method); @@
> > -54,7 +62,7 @@ bool igt_draw_supports_method(int fd, enum
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
> > diff --git a/lib/igt_fb.h b/lib/igt_fb.h index 834aaef54..0dae2b4a4
> > 100644
> > --- a/lib/igt_fb.h
> > +++ b/lib/igt_fb.h
> > @@ -72,6 +72,8 @@ typedef struct _igt_crc igt_crc_t;
> >   * @domain: current domain for cache flushing tracking on i915.ko
> >   * @num_planes: Amount of planes on this fb. >1 for planar formats.
> >   * @strides: line stride for each plane in bytes
> > + * @fb_map: Pointer to mmapped buffer, used in case of
> IGT_DRAW_MMAP_PTR,
> > + * 	    can be NULL otherwise.
> >   * @offsets: Offset for each plane in bytes.
> >   * @plane_bpp: The bpp for each plane.
> >   * @plane_width: The width for each plane.
> > @@ -96,6 +98,7 @@ typedef struct igt_fb {
> >  	unsigned int domain;
> >  	unsigned int num_planes;
> >  	uint32_t strides[4];
> > +	uint32_t *fb_map;
> >  	uint32_t offsets[4];
> >  	unsigned int plane_bpp[4];
> >  	unsigned int plane_width[4];
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
