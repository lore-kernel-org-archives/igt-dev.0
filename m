Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3664AC4828D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 06:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04431129CB;
	Tue,  6 Feb 2024 06:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNk3Hz0G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5E81129CC
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2024 06:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707200835; x=1738736835;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iVy+3q1Ma8xq8OETqD2EYVItqoC4hjB7jDHRi37pUgs=;
 b=eNk3Hz0G3xhJoHNyJWS4S+pKapKeS/WHmaLu6NQRrhf98zqwQgZ20ywq
 g38DBGO1XWM1TfW8I5iV3kDE/6wJZyxDjn/tLc5EFBpuuVpa+9yFKpLeJ
 AKXRm2zWS0FPJ46TB06leNJfhtoMTHgdBTbQUztdA3Z7yFq1ARYp01tv3
 JDGSVXijH3KXdXB09BdjWdRRgtYUAOnFD1kxkuetxq2IgIaby/B5jpVhI
 w+O8NSz9B57abeEwBniv/CUrpaGLsbRiBnYaex5/bBMfbYFLt2KMt+SNT
 zeDS/D8kwha1TW3689U7M4QpMUFeyQn9HqE8gSa5owp5CLoZfF7psZzHY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="395099856"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="395099856"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 22:27:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="5528886"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2024 22:27:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 22:27:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 22:27:13 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 22:27:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YB2qEl2oQF75rV19jM5uyQjLfAT6h0rh3jgguJEm8Sib0xghbmHVmD9h6QydM0XGUAhQlB4A1aWe8NeTkQWsAP8Rt2/QuvK8xs9FnboYpr7bDbGxHmRpkPS3IbG6hiB4DUcj+bcwN2VOGbW0Opzc5ECyj26MPFfvOrDhjQA5lzypfG9jPBuzfLJP/BoehdUyoT63QjNr3XxOGe05OIjQ6eAhhyY0qYqCmQVj1fIplMubBYNFgearm9wsRyt6oeVYKzMAbWFfsK0rf/IDhCLdHwP3o0TSkXpcX7qiG+5y7CirCYOmwqVb6UUqZv2CccIQJMiSGihGAbVr63qNqYvhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJyrlYlyb1SmE/XZHKQgsd1qLiIqPyL70HXoINghTMU=;
 b=SfOCbsBt36VzFp03wnHnaaLpbu4ywTXd8I+tb2h6ipYQR5LGUWyZKprb3ex4dISzwYxp/HM61shSng6CcCWkGZriz2g8qUIE6RK7GGxl76IJLxAZ+1Sb1ZKk4X4d8TleapVscqNVW+05u+2oZuOFvYWORPJG1yjD/JX7A5eqTPtpdSTajB7vhzEtYL2l/olg2QQMA8Mv1/LjtzXbfb2e8rzdKXKVVncUTbAAzB+87To8iSglFQir2M2E41JRcrLFutJf9/6tn9eAZqOEmu00WgFhrqaIVM9rOBO+ffHWJzun525NBtS/y+kT8CEkq05BTmPMYCJkYmAFimwpbqeMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 06:27:10 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fcae:ecc0:72c7:cc9d]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fcae:ecc0:72c7:cc9d%7]) with mapi id 15.20.7249.032; Tue, 6 Feb 2024
 06:27:10 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: RE: [i-g-t] tests/intel/xe_exec_queue_property: Remove
 persistence queue property
Thread-Topic: RE: [i-g-t] tests/intel/xe_exec_queue_property: Remove
 persistence queue property
Thread-Index: AQHaV/c/hi5pDMgZ/U+xK1cuSD7+bLD7QEUAgADSn4CAAMbXcA==
Date: Tue, 6 Feb 2024 06:27:10 +0000
Message-ID: <SJ1PR11MB6204C6F3B61024F92E0DD37C81462@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240205060225.35672-1-tejas.upadhyay@intel.com>
 <SA1PR11MB8428E53B7F5248D735C845868D472@SA1PR11MB8428.namprd11.prod.outlook.com>
 <qq7osstwzjkbz6h34kwwyb7ma3wxgzeqp5qr3gac6torzl2a2q@2i64awq4ltd7>
In-Reply-To: <qq7osstwzjkbz6h34kwwyb7ma3wxgzeqp5qr3gac6torzl2a2q@2i64awq4ltd7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ0PR11MB4878:EE_
x-ms-office365-filtering-correlation-id: 58befdb5-8e98-4bb4-59d7-08dc26dca64f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BfxpKIvWYoKfg3KB9tr3apxSLOzY57xTLloY3uZpV7BBs70/g34ewR/b1Anc4gWqcIJ8MLJj3txKtfldaAo1Jt6o3CXk36lHKBjPdNLevPq3Njy4kTimE28R6Aqwy2jIAygQe9tJg0KIMod1hwHwEUi50HaY/FZOMIRFZKdQ4LAZ1YS/+0mSbqIKX9eBmWdNQgJZq2cxqz9RQDChKbWijuMogsL5NfncL6tRXAQoylddl2IhQRf61xdFnNg0X5anlmmbq/K6vMlqzcIBcNb5+YLAojKuF9/L2z6Nq9L2loaIQoeH1qx3mJshqEskSj6xegGcFX7iJp6gOUA/YGT9qp62v1/7Fv/XXiWO8IP5Eee8QB3zT1cRZ6ngpaiRwT35nQhKOoLeTEGvCsMSG4bznfjZXLFklOrF1VfHyTwvBJ20CQOzbzkBlvQm4l2bsKhOAPTqbnNiXqXxi6LPM40fKZLd/wp08Fbd3VwdlBAXCuBqKNSy9PWzYF+ulzz/HcASgRtND7xGz1Q/FYAMGTkxruujm1tDoLm2UGfkKcqRg3BEbRJCt6T+XrHcBi/GEGsJFAjw3us0PAyzuXZtpDAtUHfeZPkI+0iRQZVJRw+8odU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(396003)(376002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(52536014)(2906002)(55016003)(41300700001)(83380400001)(38100700002)(26005)(122000001)(82960400001)(86362001)(33656002)(6506007)(7696005)(9686003)(53546011)(110136005)(64756008)(6636002)(8676002)(8936002)(71200400001)(478600001)(66446008)(66476007)(66556008)(66946007)(76116006)(966005)(38070700009)(4326008)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fZQYGOg4ygqqwYaZkZgplSRMgRjdYFBxchz217FSuyAi2jQfjx7SGsh3CpeH?=
 =?us-ascii?Q?7uc5plVqorMXvXT2+1xd0gxZVxmY1MG2sCgtWScFVUcDRw/wh1JtNi+jq+Ig?=
 =?us-ascii?Q?8UBAkcktgTj5hhYfzFdhTpGvMuHmOAs+F1a8VaVLyLcKC46Dj62SYe+roTuL?=
 =?us-ascii?Q?CN83PrTCWcQRiSZLFWBM+8ecAsRsy9jh5zC99r62sAroHHrDU6BxwxH88jX/?=
 =?us-ascii?Q?852X2XFOD+eErSUKPw3+ZF4sIHypYw+T1Jbc/hlnlrs74lPy1paUX/3Fi3JU?=
 =?us-ascii?Q?UIKemoLKOYYUjJTt3Q8pNUNfRPG/xL8AWtAPoQVTKrk0TIiuNhFWBc/HTL6Q?=
 =?us-ascii?Q?0VpSelz9HkSyNsrmTQmtSc1Bxy+yI4BK+Z45WNNzlIeJd0AoW3/sENd8OhtL?=
 =?us-ascii?Q?jrjfUcPf/cwvVdrSCKffTE5CkhNUyN61OXO/hGxfPEWkvMETHTtbecF44ger?=
 =?us-ascii?Q?8PDsFW2KPwjWp2iUp8OEUneNE8D0/6GzGdt4IUba0YtWlV3KZrdsp03VgLTG?=
 =?us-ascii?Q?wGSHRJK61zgOSUXRCLhHFZ7j5f6GAeXvQiPNTEZC8ak13ykkls9Vd6PzhLsp?=
 =?us-ascii?Q?thK8765X9lsuJtX+ZpEWqg2UJYNNmzhPeNEFEy6iwt6LGK792ZsrFUKU6VB0?=
 =?us-ascii?Q?532YtRErZr7lb83OQd07xtS7+G2hhrV9t2n7hGgDqq2T6gT/W4+hgGPPlqy7?=
 =?us-ascii?Q?wCs2JLrbEE30Sh00dniIFO3HieoKlGJMHGp+IsFhBysRwFbq2Z1zAVvL9p2W?=
 =?us-ascii?Q?idXBZRkvx7d9uF6xk356cEyp0brYZIX9xWip13XUUifwG6TpX6+me8GWv33u?=
 =?us-ascii?Q?gnnjQtGaHBS9gyVBe+u7f6/aGuzv+S0W6I+zqyoi8D4gOCyOCkberGpbuVc3?=
 =?us-ascii?Q?DdTBZ2yAnCv9xUoNnM5fRDd52C/E9LwweHMK8QDTP0LES3KyYzhXJsf/htLB?=
 =?us-ascii?Q?6L7SIWALVMjCckC2M219tm8/iWkfqku0t+j1T3ylEPQwGluHQXvx3u3tjFxB?=
 =?us-ascii?Q?C3GNDsAJ/W0rP13A65eK24SrI8lr0GZMPwAhrv5vS5jFWitx4mua3DhjvNpx?=
 =?us-ascii?Q?CsQ+NjFkpdJluxWTNop5eDOK4kum9GNfTf/7wYqviWjsPmtI92Qjl6CtAFOd?=
 =?us-ascii?Q?29/mtgen/1wRuIhm2iNLkEiSH9gelto8cC15XIrWp3lWkTN2at9d9GWo+H2/?=
 =?us-ascii?Q?hwS3hPbZu0HjcXRVWtGQb3mau9rFe2y4X4cL2kcffzjCv+wogCHGX1vb3tk/?=
 =?us-ascii?Q?pNc4R6FPIU4U19GBOwK6j6hO9ohm7MtBDa1L/6uAcEvXZsVp1DEPbM4D35ep?=
 =?us-ascii?Q?dkPC6Ndcu4Ox2NOOtlIg9m8b+AlsdoXm4aSVHvn1gMo3kGy5z2R6+jej2aDk?=
 =?us-ascii?Q?1EhIDLy9174X9mJMpYS+5SoIfuimXUnY+bBRFLrH3SxKQlilLeRZFrfWj7h0?=
 =?us-ascii?Q?+rak2/Il4Ybh2mb0f0A/Nz3eAESbBXvz7UQZFswszTVjiP8SI4fXqi39sXzr?=
 =?us-ascii?Q?JZmPWgkfFsJmAuA9qGm9+V+wuxLpt+YjIL9O49KdScFFe7y68b1I+tF4ZDKr?=
 =?us-ascii?Q?lhzAntPToBoHcu4X1/uhd4rGnKlqLeC0W7Bxq5+a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58befdb5-8e98-4bb4-59d7-08dc26dca64f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 06:27:10.4503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xl606QSMCN+ooZDokutvOJFpi7vzQOPNEIkkstYS7NZXr16BKu4Os9pL41QhJ6v/BQhfuclsiv2nP11k1AzYjNFMfcXjFhRGAWW/YfV7nZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4878
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Tuesday, February 6, 2024 12:01 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; igt-
> dev@lists.freedesktop.org
> Subject: Re: RE: [i-g-t] tests/intel/xe_exec_queue_property: Remove
> persistence queue property
>=20
> On Mon, Feb 05, 2024 at 05:56:46AM +0000, Dandamudi, Priyanka wrote:
> >> -----Original Message-----
> >> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> >> Sent: Monday, February 5, 2024 11:32 AM
> >> To: igt-dev@lists.freedesktop.org
> >> Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Upadhyay,
> >> Tejas <tejas.upadhyay@intel.com>
> >> Subject: [i-g-t] tests/intel/xe_exec_queue_property: Remove
> >> persistence queue property
> >>
> >> KMD has removed support setting persistence queue property here
> >> https://patchwork.freedesktop.org/series/129311/, to have parity
> >> remove test
>=20
> wrong link, should reference the patch by Thomas. Either
> 20240130125220.5517-1-thomas.hellstrom@linux.intel.com or the new
> version

The link I shared is from Thomas only. By the way I am not able to open the=
 link you shared. Please help me to understand what exactly is needed here.=
 I see there is only one version of patch from Thomas here https://patchwor=
k.freedesktop.org/series/129311/

Thanks,
Tejas
>=20
> >> support as well
> >>
> >> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> ---
> >>  include/drm-uapi/xe_drm.h            | 9 ++++-----
> >>  tests/intel/xe_exec_queue_property.c | 8 --------
> >>  2 files changed, 4 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> >> index
> >> bacdca787..1917e4c50 100644
> >> --- a/include/drm-uapi/xe_drm.h
> >> +++ b/include/drm-uapi/xe_drm.h
> >> @@ -1046,11 +1046,10 @@ struct drm_xe_exec_queue_create {
> >>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> >>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE
> 	1
> >>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT
> >> 	2
> >> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE
> >> 	3
> >I see from the KMD patch they are renaming.
> >DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE to
> >DRM_XE_EXEC_QUEUE_SET_PROPERTY_UNUSED_1
> >Can you please check this?
>=20
> The file include/drm-uapi/xe_drm.h shouldn't really be modified by igt as=
 it's
> a pain to keep it in sync this way. Instead, it should be a straight copy=
 from the
> kernel source when it changes.... so whatever is in the v2 of the patch b=
y
> Thomas should be the one here. Or just leave the header alone and let it =
be
> sync'ed next time it's needed.
>=20
> Lucas De Marchi
