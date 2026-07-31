Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD78C55167
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 09:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0598410F204;
	Fri, 31 Jul 2026 09:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nash8nSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B7910F203
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785491450; x=1817027450;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6y93BnLxkfUqosdfyNQTmzz7LhyiIPV4s3YY4t8iEr8=;
 b=Nash8nSgMVzto8U9W3jZeWs5/5fYEMBESnFwaOjQw48+oaWgdg0CTHaZ
 NIbP+6jQrRec/7FEghNzVTg2ujMwdDkmqisJIYysFCfxnYK9QGu/5LYxd
 cqe8cOM4ypqaj15M/WwaBUDcZlyaL+N9nBimMcsikcJy2IN45QKGSRnrQ
 08QTPVWc4HFOem6AVIxrW+bqHwAmnCiF2z+MBaoaMdOzZjSaMvj/5x+r1
 4G9MLMJV4ERgnJr97AD1m0UUq3RW+Kr9fpJkM7LxCZnV9miCmfT9hYIqL
 bYFYLTE9zch8yGYB/QH0q+DVm5W842flosgTMppuEbXcM0A7YarOwZt2E g==;
X-CSE-ConnectionGUID: 5BGwz9Y7Q76TT0T8rikgfw==
X-CSE-MsgGUID: eQfeSA64QNmuc69pxk6+Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96703489"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="96703489"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 02:50:50 -0700
X-CSE-ConnectionGUID: n7pO/0ZrRKmDs1y1tDyVZg==
X-CSE-MsgGUID: XJvfv+MPR2azsBlaeLL5tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="264352067"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 02:50:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 02:50:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 02:50:48 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.28)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 02:50:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1fuVcwkjTwsjv4vUV47p/IMZhJg3DCFGHqKMMW8H0MHBuUmHQzxMxyTXFaXl0YDmJC+UPDJvKzLJ23i7ZX+n0Fae6uOSy7g5GGjeHnt5WHj+gKnWaeW9BKuldy8121QGOqcJokuhRVWZMnDrDc9sMfAilfwhVPmMsChmQdgj75SEIbo5x/6xCxTioEKzY3GuUra7OyAMBPy5Wfek3VpWfApHmVAaBDtRRN5kpR1IUmSRstgTqUcu4GYRJ1zjR8ruxvnbIW9aNWUJFuEPwD+o78th/aTX+p3wZ+zMP1jQ0I6NWWYubypKhdWrO7FBrPpueumV1H5GA2IF/sqS3FwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S62XIizQxCAjHTBjkhtAo46Ny21ARsI3BUThmZ9+VvU=;
 b=R0mUYM+XIIO48aNY1boY6dMtOlWmwFzV5+abR6pkqZlA5isVCVC2rS5SaiGhGryfbSwPjzNEFwxLirnJsjQT9ujJGeGjqbIT9ANbRJz+ECEWGhQ6FhsnfTUw2FE+/Zal/g6lOPB/JBsuYZXdXYZgITY3fZUGtV0vVG3U10XFZBzBiHwmggcStyq+ghPirbjXQMRaeICjJszwWjEhAcpzw+zgD+M6Iqn5ik9SBooQWHOxOM9B0OsvHhEAXMyzBapW5S1fiO/UOsRHAx96USJMJv4/T4J8fP2LueFyxZ6nvp5yTwRMtlZl2oHvAbhJ7KJUmARzZT87pRlKNUtZN0cqfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB7907.namprd11.prod.outlook.com (2603:10b6:8:db::13) by
 SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 09:50:46 +0000
Received: from DS7PR11MB7907.namprd11.prod.outlook.com
 ([fe80::12f4:5e22:c1b2:3809]) by DS7PR11MB7907.namprd11.prod.outlook.com
 ([fe80::12f4:5e22:c1b2:3809%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 09:50:45 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: RE: [PATCH i-g-t] lib/gpgpu_fill: Implement gpgpu_fill for XE3 which
 uses ugm intead of tgm
Thread-Topic: [PATCH i-g-t] lib/gpgpu_fill: Implement gpgpu_fill for XE3 which
 uses ugm intead of tgm
Thread-Index: AQHdIMcKJml6rkIgqEqvDLWH/GsVC7aHYL3A
Date: Fri, 31 Jul 2026 09:50:45 +0000
Message-ID: <DS7PR11MB790780D1454C57A0A8EC8679D9C82@DS7PR11MB7907.namprd11.prod.outlook.com>
References: <20260731083127.168212-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260731083127.168212-2-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB7907:EE_|SA3PR11MB8022:EE_
x-ms-office365-filtering-correlation-id: ab12d6a1-bd21-4e74-4361-08deeee93183
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|11063799006|56012099006|38070700021|10067099003|6133799003;
x-microsoft-antispam-message-info: +SvEGdjWDTlklF4d3wn96vbSb+Y11dIgrfZ7YBE4e/TKW40zuTsaQdJJMUp6I2LTv6PiW30CnNbkY5cdYnYRcuwC1oqDnyu4t7iKbR0oNfnt9ecIo0RfpIgJ7+ULSoOvfkQGi3occGgia9HZmi5kiRVVl35rT4N0jzuleMCuXvbGM+5lJVmQa3swWxunWdorkg9N3Q7imQ6NCBvDSGpOALYB9zZt3bpXxTFrMDUEiT4c4A4JXupkDyZjRoeCfw1EAhQpIfcQhjAD5Yu13e3v6gbCIUWH1uL3NfyKRl//Uk1NMFWyoaTtFpSTcbsrn5Gweg9sum8jbnLC+6WewHeXgw59f6Yl44j6h6MdJA6DPZ6Uds8FU9tu1MzNgA5+aMSpU2sdSizDZUsi2Okc0InuLduiawmu93HjKHL8+r+XUB3Lyk5+NRI7Bf1fnxjbvZu+YyeBwZ2rELVnUr6eI4i9cNZGkptwbVQ0UNU2SvK/Kf0X07WLQ5rKysGaS0Gy7Hn37WdJOQxYvLyE8xXz0ctvt4J8rQnyg0TAWYupY+HPFXqrNuhTigIVP9/Zz58X7BER5zgE1RiQVU6YhJblvKA1dXfAblnjDPacxtQ2wEaziF9b2zDb/6Rc0gI2fC+p6/ytLDzlZrCmytBiBpiAkLzvXxo0XzUdaJSdEPxjLrjExjcifn4IsrnMXlsjw5VCWfRybcjFL0bM+qmBbqrViWYu4B+2ZapNumSTF3dETzn7XDo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7907.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?p2sSTFgQr5bxJzmKMkUO361JPio+1lRuudqauI1wn1KoGlCRQUdoQJWCM1?=
 =?iso-8859-2?Q?sz3gQLebUS1gJalI+huB1dJ/boORfj/KhwUy60ZWnlyMxgAAlVg0diunQD?=
 =?iso-8859-2?Q?qhES56k45l+4hebugldL4JxMFPJ5/+p15pFrVZMNui4sZA4upnfB2gghoA?=
 =?iso-8859-2?Q?dhN2wyQ5J3qDGRAtbOdg7PYbYkRtQ8jaZe2/L7nDL2EV1iKdFt0MN3MOId?=
 =?iso-8859-2?Q?Ew75dVbeavSiWDOFG2UqqeTAnw7hpFCbp09pPS+q5fAOBYjQjTO3yFtKeM?=
 =?iso-8859-2?Q?sw0AB28gkqsiJVb1qMoPbzToJ7d0jovTH1+m3Que+NBxKaedCqoff67BnL?=
 =?iso-8859-2?Q?AhgtJX9epDop9Rr+gZmRRuw5pe/EljA6PWmWBmKAlq+MDRuPnxwKExJjl2?=
 =?iso-8859-2?Q?6dpGF95Sz3TDcZCdSFIOLYaeGlGrMDQ7HIKYC8U7WRSRnmba++CDnOrI6K?=
 =?iso-8859-2?Q?JsWgcu6bz4ebAn6eqc9HH+HfVAP5nStGj1iN6dmGp7msFxbsGENLKYpoBs?=
 =?iso-8859-2?Q?tQGCQkv7bLvorGZcGPbZPPzn9kCXvQ6G13ijTG2+Z2i9yVs+YOJjNjUoDL?=
 =?iso-8859-2?Q?iqjoVA7n7WIgwb5eRgy/pxugz0KcalXs2J8wJY6k7rab5/iMrP4nro+3zC?=
 =?iso-8859-2?Q?AbooJQAbiZjk6R8eBZVrAYeurdPSPnce212KhXYZ3wGO+r4fqj6lQSIQgn?=
 =?iso-8859-2?Q?yc5TcwL73yy1qLPyItIhOJpFqWp3cl8kqYhIpbcFekKILwe+31dyeWrWW3?=
 =?iso-8859-2?Q?FAJQ64gmVYc3S0Zi2BmJ1B2iIjhEs1qpu6o/fTMkD9829IjnylUe6rKMxC?=
 =?iso-8859-2?Q?wG0Ff2bgAWEdiJeokYR0DW49GvTbTr/Ze15Dfae7+lSMktAce6rCgX1NIc?=
 =?iso-8859-2?Q?Dqlvk19VT2ATjZ5x91VrPdyKFOO+4ndzzlPivNq9Ngx4bN0bbDpehqsOxX?=
 =?iso-8859-2?Q?fjGs5DJZzZ/i/8GGrB56eWN7M7r5G5YzvS4UJyO9Z+PDwPyEdIAMFPwyKg?=
 =?iso-8859-2?Q?Ifvr/JaaEYEYELDqok4Sr0qmCqkcHgmoGhrbOhGtQvj4DIULxidZQWJth5?=
 =?iso-8859-2?Q?9G9FRQyY/i5A9jp/aQNT2pjoDsnfZT6GF10J0kC5fWACe+W+IlaF2rfEy5?=
 =?iso-8859-2?Q?p1ZNELMc/rjHOFFzfXHM4H0jj4IqjhLhwZN8I4HqN4lSL5FxmYv2VhdfnF?=
 =?iso-8859-2?Q?BvMUWSFfm8mUfixB0fe0kKkVPuxFe9QJFZFYXjqMTEM8mSqOBWh1lPjMgx?=
 =?iso-8859-2?Q?9G18Q1sx5r07aANNSU0qzf2W/BaGPG8ZjpJIA9aIK0WWBesIb9nw1hII9H?=
 =?iso-8859-2?Q?gTk+xQvDwO/GK3la/OItCqor6zqP0H7l+OxWg0r4RszdvJgVw613HnG/Vr?=
 =?iso-8859-2?Q?C0pt/GNpyetTSYnbnNjN6KPCSZuEEUb9mbQaL/8N68G3wSd5ZvWzMx8S0i?=
 =?iso-8859-2?Q?DOJAu8tTUJbg4egPqKfi8mi4Q/ppHPUH60p5pqYXFm3Ebn7kpdWK4uUlMX?=
 =?iso-8859-2?Q?JiHHsGSJeSSuTOVmeQsitabnyqh3EB+qltQwLPKC2uRD7G2NkN7dsBJFba?=
 =?iso-8859-2?Q?bvBKWPcgvk9yvyVSZsvrhZI787QlElw+rv1ZTi27DsagIpQKkhae9oyHLN?=
 =?iso-8859-2?Q?vXH6Y12lLzwy3nsx8aG9+hOKTHYwB0H38nK4B58AypK3ETZia1TtTqaK5a?=
 =?iso-8859-2?Q?VidFMzl7K3Qy3FBv52f6uPz7SnOk1hlBXKxSt/a8uCcb5vtmXYCUmz58Q5?=
 =?iso-8859-2?Q?Lrzc6eFN/47nyRPrl286m1Cyp8yJDdsE2PcsM84CnGqEbAT8z0AtJSaYCG?=
 =?iso-8859-2?Q?OKWFDWgA+izuDbl8G0zJ0+7sj4NvdEM=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GIMCHsKBUe/pvvyN9mImrez4ZAWigR6cJqd0w759PwvkNE47atVOwNxcz+4tJmKoRa6Y6P2yGHpJx5BUs3ma4+ZAOlFQl6Kdzq22eLvgOtGWNzvZgGBNFtJhhs6xuQ1SkBktVNMKcngt96FvvkUWPS8AOI23Z6KOgWFSlYUu86bdWdgU/zwnOCxlyP7pLz/eXqDQRPf74pRUsZ980vztPL9kjLoqjS01QLygBXp7gGugdzNsSSoc/oLD9uhZ7BqzMAN3pLmCNioNMl5zjBKUFjowBG4AIOfdXHlORraWvjCZ61YP/bKZ+kwZoltHce1p6XcM9hy0/QPyj5D0ewCOlA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7907.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab12d6a1-bd21-4e74-4361-08deeee93183
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 09:50:45.8123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FjLqFOMWLNIRpjvvhLTYvhz5J/x478MxFqCGZA+vfZT9oQROUtpxWBYau1+iWyXMmfW8qu62rWUPwnPXAOiDZdZ9gOohHQ7/nSJDKqdj3zyx/JFSvGepP+shSyTbPjbN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8022
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

LGTM,
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Sent: Friday, July 31, 2026 10:31 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>; Kempczynski,
> Zbigniew <zbigniew.kempczynski@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>
> Subject: [PATCH i-g-t] lib/gpgpu_fill: Implement gpgpu_fill for XE3 which=
 uses
> ugm intead of tgm
>=20
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>=20
> Use ugm shared function (untyped 2d block store) instead of tgm
> (typed 2d block store) on XE3 platforms.
>=20
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Zbigniew Kempczy=F1ski <zbigniew.kempczynski@intel.com>
> Cc: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/gpgpu_fill.c                   | 38 ++++++++++++++++++++++++++----
>  lib/gpgpu_fill.c.gen.iga64_codes.c | 20 +++++++++++++++-
>  lib/gpu_cmds.c                     |  2 +-
>  3 files changed, 54 insertions(+), 6 deletions(-)
>=20
> diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
> index 2c47169d2c..93a474e67a 100644
> --- a/lib/gpgpu_fill.c
> +++ b/lib/gpgpu_fill.c
> @@ -282,9 +282,10 @@ __gen9_gpgpu_fillfunc(int i915,
>  	intel_bb_destroy(ibb);
>  }
>=20
> -static struct gpgpu_shader *__xehp_gpgpu_kernel(int i915)
> +static struct gpgpu_shader *__xehp_gpgpu_kernel(int i915, struct intel_b=
uf
> *buf)
>  {
>  	struct gpgpu_shader *kernel =3D gpgpu_shader_create(i915);
> +	uint64_t offset =3D xe_canonical_va(i915, buf->addr.offset);
>=20
>  	emit_iga64_code(kernel, gpgpu_fill, R"(
>  // fill up r1 with target colour
> @@ -313,7 +314,7 @@ mov (1|M0)		r4.4<1>:ud
> 	r0.5<0;1,0>:ud
>  //	[18:14]		MessageType: 0xA (media block write)
>  //	[7:0]		BTI: 0
>  send.dc1 (16|M0)	null	r4	src1_null	0x0	0x40A8000
> -#else
> +#elif GFX_VER < 3000
>  // load block offsets into message header payload
>  mov (2|M0)		r4.5<1>:ud	r2.0<2;2,1>:ud
>  // load block width
> @@ -327,8 +328,37 @@ mov (1|M0)		 r4.14<1>:w	0xF:w
>  //	[19:17]		Caching: 0  (use state settings for both L1 and L3)
>  //	[5:0]		Opcode: 0x07  (store_block2d)
>  send.tgm (16|M0)	null	r4	null	0x0	0x64000007
> +#else
> +// load A64 base surface state offset into address payload
> +mov (1|M0)		r4.0<1>:ud	ARG(0):ud
> +mov (1|M0)		r4.1<1>:ud	ARG(1):ud
> +// load surface width
> +mov (1|M0)		r4.2<1>:ud	ARG(2):ud
> +// load surface height
> +mov (1|M0)		r4.3<1>:ud	ARG(3):ud
> +// load surface pitch
> +mov (1|M0)		r4.4<1>:ud	ARG(4):ud
> +// load block offsets
> +mov (2|M0)		r4.5<1>:ud	r2.0<2;2,1>:ud
> +// load block width
> +mov (1|M0)		r4.14<1>:w	0xF:w
> +// Untyped 2D block store
> +// Message Descriptor
> +//	bspec:63981
> +//	0x2020007:
> +//	[30:29]		AddrType: 0 (Flat)
> +//	[28:25]		Mlen: 1 address register written
> +//	[24:20]		Rlen: 0 registers read back
> +//	[19:17]		Caching: 1  (L1 uncached, L3 uncached)
> +//	[15]		DataOrder: 0  non-transposed
> +//	[11:9]		DataSize: 0  (8b per data element)
> +//	[5:0]		Opcode: 0x07  (store_block2d)
> +send.ugm (1|M0)		null	r4	r5:1	0x0	0x2020007
>  #endif
> -	)");
> +	)", offset & 0xffffffff, offset >> 32,
> +	intel_buf_width(buf) * buf->bpp/8 - 1, intel_buf_height(buf) - 1,
> +	buf->surface[0].stride - 1);
> +
>  	gpgpu_shader__eot(kernel);
>  	return kernel;
>  }
> @@ -422,7 +452,7 @@ void xehp_gpgpu_fillfunc(int i915,
>=20
>  	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
>=20
> -	kernel =3D __xehp_gpgpu_kernel(i915);
> +	kernel =3D __xehp_gpgpu_kernel(i915, buf);
>  	xehp_fill_interface_descriptor(ibb, buf, kernel->instr,
>  				       kernel->size * 4, &idd);
>  	gpgpu_shader_destroy(kernel);
> diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c
> b/lib/gpgpu_fill.c.gen.iga64_codes.c
> index f15a9a23ab..19905659e9 100644
> --- a/lib/gpgpu_fill.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>=20
>  #include "gpgpu_shader.h"
>=20
> -#define MD5_SUM_IGA64_ASMS 23974a9fa727a81b32058bbaa8d3ebbc
> +#define MD5_SUM_IGA64_ASMS 50a6ea7d435db3bab74c742ce25265c0
>=20
>  struct iga64_template const iga64_code_xe3p_gpgpu_fill[] =3D {
>  	{ .gfx_ver =3D 3500, .size =3D 144, .code =3D (const uint32_t []) {
> @@ -50,6 +50,24 @@ struct iga64_template const
> iga64_code_xe3p_gpgpu_fill[] =3D {
>  };
>=20
>  struct iga64_template const iga64_code_gpgpu_fill[] =3D {
> +	{ .gfx_ver =3D 3000, .size =3D 64, .code =3D (const uint32_t []) {
> +		0x00080061, 0x01050000, 0x00000104, 0x00000000,
> +		0x00000069, 0x02058220, 0x02000014, 0x00000004,
> +		0x00000061, 0x02150220, 0x00000064, 0x00000000,
> +		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
> +		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
> +		0x00000061, 0x04054220, 0x00000000, 0xc0ded000,
> +		0x00000061, 0x04154220, 0x00000000, 0xc0ded001,
> +		0x00000061, 0x04254220, 0x00000000, 0xc0ded002,
> +		0x00000061, 0x04354220, 0x00000000, 0xc0ded003,
> +		0x00000061, 0x04454220, 0x00000000, 0xc0ded004,
> +		0x00041f61, 0x04550220, 0x00220205, 0x00000000,
> +		0x00000061, 0x04754550, 0x00000000, 0x000f000f,
> +		0x00032031, 0x00000000, 0xf00e040c, 0x0080050c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
>  	{ .gfx_ver =3D 2000, .size =3D 44, .code =3D (const uint32_t []) {
>  		0x00080061, 0x01050000, 0x00000104, 0x00000000,
>  		0x00000069, 0x02058220, 0x02000014, 0x00000004,
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 9dad73b6df..7a72166a0e 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -1021,7 +1021,7 @@ xehp_emit_cfe_state(struct intel_bb *ibb, uint32_t
> threads)
>=20
>  #define _LEGACY_MODE (1 << 6)
>  	/* number of threads & urb entries */
> -	intel_bb_out(ibb, (max_t(threads, threads, 64) - 1) << 16 | (dfeud ?
> _LEGACY_MODE : 0));
> +	intel_bb_out(ibb, (max_t(threads, threads, 128) - 1) << 16 | (dfeud ?
> _LEGACY_MODE : 0));
>=20
>  	intel_bb_out(ibb, 0);
>  	intel_bb_out(ibb, 0);
> --
> 2.54.0

