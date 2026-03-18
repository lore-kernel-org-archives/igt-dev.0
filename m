Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2B410775F8
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 17:28:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D70110E4F2;
	Wed, 18 Mar 2026 17:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buJzrlOc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B7F10E4F2
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 17:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773854900; x=1805390900;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=czSXz+H+pui6aqDvtxLEgZGTt0AXmv5MnA5p+QTjcJA=;
 b=buJzrlOc45Pv/8yFDLNWlf7Oyp6MQH7ZID8ZejngPgf8dQAxeJlqWJNR
 jM/165fGbG5wiyFK2InNgzzhAU+je3XCxOnQuxTPukzNlTuL0Ma3GuUD/
 8RsoVgL6gbgqMk+3xij1HkjBorvdy0gw2aDdvi6jUqRH3XcBgEjZS1INa
 PUAx062L/M9z8LimbzhaZvLfXnyF65t7s93LHZzPPvjVuF74P07+/Y0oS
 ECkpbgJbVikfNXqgA7ilSL7MK4bRsIeXahLAtTwwhkwB/MDYZRsqWAVG2
 5wO7H6qddWCBu2nACrOhUh3z8R75QYL9xYXhCwuW/pENkeX6arY4ETB6z Q==;
X-CSE-ConnectionGUID: yG5heCS7TKmrLE8RDrlx1Q==
X-CSE-MsgGUID: hMhzPg/uSz+uux7ncf8Siw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75100138"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="75100138"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 10:28:19 -0700
X-CSE-ConnectionGUID: 32zZINJDSzCXsaeroy0MVA==
X-CSE-MsgGUID: VIPWXqrrSEy+0TtPQFkIkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="227647832"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 10:28:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 10:28:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 10:28:19 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 10:28:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eK7hZTraYsczaMLL2+C07td1aUgx4I2AsBWx4JY9w+IMySw3dWYzI+tNPXf5LULxtQSTH1cIJfKRn4P3VgLB7vZ9wXzTCFDI2S8qHH4+NKvKGbXUBX9+ioERDznLEoB9o7ciNqgulNdGD8KstRwqsJBWrZa0xA6nPiMY4SqolsWa5IE9pYoz9/1/Tf17TRi4cg1WpRLwzH6pwjjTf5WwMWDixQD7RegkTRUvrHreXzdA+ROmkSHtfeSniqVz0cuiCNSywpU9Z9HdiB2hGgL/4s3nCk48dj5fdx+QwMSk+YJzWbMHlsHuGaSNsqTRA1Sh+xSt1xxVBHxSb0KWl0DB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ianHwjCjDvKaK7peUGw09xGkenM2yCBA7CMISLynw9Q=;
 b=azIqMRRTwBIxoHN7NdUCqTixwzhGtkxEZD3Ii5HyEMBBqFY6Mp/m9cE6FfnhzkzLnO6s3wnkLztQTXmA/hTE5p+vsF88Ih4y+eohnERWPO1T6yeEg1oJjeVweJ+ENhOzy6w1cbgQXjUf7O5Yog2kOaxxe+n+6q6y9SYGUCWC/LKmgE+A/HJIQNbu2CXgCHkB6zMPzmrnnOtAz4Dn60r4g9P9xqolcOVsksmvn3NLtE7PTFi7sESw/RuXAGEOpziMcNdbCktEDrHIYevNmXysqElWBz1jBxsyv3TT76OvbMGbxvs79y3kM2QOnKlAsn/1iazrZRwATGBiRSpyT6DkIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by IA3PR11MB9086.namprd11.prod.outlook.com (2603:10b6:208:57b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 17:28:15 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 17:28:15 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Kishore, Sumit" <sumit.kishore@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Kishore, Sumit"
 <sumit.kishore@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_properties: Add skip on headless
 machines
Thread-Topic: [PATCH i-g-t v2] tests/kms_properties: Add skip on headless
 machines
Thread-Index: AQHctuADkBaiVbn/BE2fFl4EPYsH6LW0iQWA
Date: Wed, 18 Mar 2026 17:28:15 +0000
Message-ID: <PH7PR11MB60531885FEC138F3F10FB600E74EA@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260318140120.283593-1-sumit.kishore@intel.com>
In-Reply-To: <20260318140120.283593-1-sumit.kishore@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|IA3PR11MB9086:EE_
x-ms-office365-filtering-correlation-id: 79027940-70e1-483b-3079-08de8513bcff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003|7053199007;
x-microsoft-antispam-message-info: d3aNua2BqHfgkqFJOFKylQsT2D3hD1DomGjXmyC0MSWy7u43mwaHk2LY1AiyLEWuh473ZrJVnNJ3deQezm6X+1rDoG53aKPkc2dxbsFyP6GwbpcGuvTf6xGX5IacNsN+w2RAXHbQALbYWwEjpy3URsVe7/M7iYh+Hw1aqt1Z5a0lXxhxPOuUx5+sWuSMBwoJMYszsU0Avs5D18DYxdW/6b0w2HqKQsgojokYfx7ATqA0PHLEnc0FYO31jRYj5LwEeRiq0amWauhr7IagRXeCF16NBbWdCqJDm1T4Xae6RLRYhFrUiJyzEAFBdNsSA1Va0Q42cDH+Mm1H7mfP1/tGeVaOA0pbItOCUwuYjOqXlJoaZtlZcwBgVa73ri2uWznMm/GiwkJmbiOymXGL/pRid7y+t4IeetHX4DP3jQQlXtYcmBqXDIq8sZEyhXy/rX154fZy/sRtRPIm3BAj7lrN+5K5xyoX37A3LPBd32/oJ+NFUGBC425oWOYaqpvB80b+BlLRBg9I5lntWWvwUckfyPJOBh4PXb4Z7GT3eZ0yg6ffLVIqwjVg/Qy+Xg7QQe8d11wM5mtw0+3qiwhDcDlS3vLbUrmjQNzxjxfqJLbQmGavmFtejSYt+HqKgMTNXK0eQc84lTziJQd/ly5XXT9y5XES/ykTsrZISTODpHUJ1dpbCej7VBfUdNiiAnI5tM9+YA+40zFgFgrGPvv2K1nVI9315T27msHO7xNQ0G/MG5UBhFdbfdlTGe/v4cofytLoz0aXKSKi/TzEOS3iQ36DESDibZ1lWZ/RHvcYL9Cu99o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Cuy2jC8TX5wz0WqYCOTR4nILjFXPEpA38nyE70SaGGa9o13u/1qoRK1MMvwE?=
 =?us-ascii?Q?MRiFTIBWcmdJPho8/3b2bJaWFZf2BOeLRIjAi3Jp+3SYzH4iEu9FNKzczMWX?=
 =?us-ascii?Q?6lwlJtqt5cSZVy26pGZKwiciVxtsmXHsKhDxFz2bm+HhLq5cryFea2hooIgR?=
 =?us-ascii?Q?oPQe9d3bDQ68RKw2YZfuR5cuDqC37CZPFDChVF2w7BqhU8qNXo8obKc2W3W9?=
 =?us-ascii?Q?7sWXcEVfRXMPkM02yvWzCpw93BH//tNk+0Y7bbgo6vR6lhwTWMF0kT0Xll4r?=
 =?us-ascii?Q?lsTfAnoon6bJ1ZMWlNJcYNz2n8OZrK2RbJw1siviMVRxPffUJz60+93TACPZ?=
 =?us-ascii?Q?ki+/Sb4++6mhYXAzCztBxVE/0WhfHZr4DSwB3sh4gz8XUmi/AcFzxQy85zND?=
 =?us-ascii?Q?z3vlegFIK6WlJ6Yq2OqPSdwRPi/jaaaH4A3KEkJrM2Zdrf3Uvj+CIv2j83JS?=
 =?us-ascii?Q?6VMtt5wlL56hPppBVf+F3xo87/kCFNl0MSn8fBjmVyl5yI8o+xjUx7fOwzYz?=
 =?us-ascii?Q?v0sUr60E1/OcdzCiW7hlF46e5opSPPYpMOP67fSY7YtD/yW7CHszGxVopzS5?=
 =?us-ascii?Q?LbeRNkgi1hx2jZOW+X5bttXBbCAGVl5Bf0fUTApeJRJ03KmzYN0WsYfjo0A6?=
 =?us-ascii?Q?qdAukpbyLMB3UnbTv6GpaUsf6iRtRWu+vOVJVsZaL2qf23ZFKOZnco/jOVPW?=
 =?us-ascii?Q?krYXG/HDlJRpBJX3ZxUfwjKJUdAGzEyy1pYxaC9VkynOPgpsweKPsC/6c7c5?=
 =?us-ascii?Q?U+FXMuPRHfwC2A9ZyJT0K9hJoRS+Czmiwrpced4HSQ2pYuw59FeGZQ+Wh5j/?=
 =?us-ascii?Q?YPikNuEHQDf0JBpt91pcax0r98IrXF/upcmYK91kUL1Wfefi/1BgNRViEX2y?=
 =?us-ascii?Q?h6W5zD64SQ+jjXG9QzcBlYTUR75lPzZkhLFdD3ubDyrkO2YX1XitA09JZkzF?=
 =?us-ascii?Q?V/UHkrwUxf+li68Z828zMO6tU5FHLBuCEgPZTZaVIDTIelua9i7N+orzzUcV?=
 =?us-ascii?Q?Jx7zrDx6OFeJncuTTOptviRCErDJHDiqDh1QzpFbKnoRxi02+85ypnsEJrCY?=
 =?us-ascii?Q?RoqZnPc4LwvD55jF00PmUj4Sy/CKpz5Y7TvuouC+WlZ3JE2JfIR9dGbSdPrf?=
 =?us-ascii?Q?ajm0tOLT2Ama/JVazkHF7k0g76Kqis0ImD02f9lSarid1QJ4lLZ3LXEjuIJ0?=
 =?us-ascii?Q?PraJTiiw7Rw7aCM+9cZveZ+8jfD+I1ddPAxZ5iclfcT/TSIy50uY2I5dLnw0?=
 =?us-ascii?Q?nQzO7pFjPxv144HMsANGH5G5LHePflZm9oqb052TbSCe51q5AfIwP1LbSG44?=
 =?us-ascii?Q?XhVCb8hpAdp5UcxZ3QJk8SG701GuAjuAIpUOCMgCATv/aTP/cQOH34Q9Wuad?=
 =?us-ascii?Q?ng/K8COCRywdIL7j4ZTraxGhuuKERujtN9ixDb+K58PgZwAThHypbndVkPXv?=
 =?us-ascii?Q?SwVXDBg155wzW3pcJ/Q76ZVnw+448TiJctYd9drpTuDy/ly1bJjlx7GTZGzp?=
 =?us-ascii?Q?37bNp5vKkg5BQpDqaZjpkKqMr6bBMRd1LLx1/fnYFtuOyPU2po60GVzu2imy?=
 =?us-ascii?Q?VaGaSGuoEPBMnYHZ8JU4zQLJPgG3UpiROIaF6yJWqChmxGwIXsJSU/ht6nEA?=
 =?us-ascii?Q?O+mhUf/J+wFIbu2P1eoI4RjB69KeH4xbYU0lEDDBEsJby3rSFmo6gvUytKAV?=
 =?us-ascii?Q?qqb2JyK7tNXXVJ0BgZFoCs2fy2yxXVQcJD1apwJbOxvyOMOdPJiu0EmAHBk/?=
 =?us-ascii?Q?VAEbtJcFeA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gUFZ39+r3HNEkQboEznwXfp+eSitRnPH2FkJCJkMB18yE+SkNU9LxdXuSm6pJE/PZ6wjlO4ILhoWDhMvhKUJCZNX5EZmluaIukdUEmj9JrCUAy8aHDRZvX+vq2TNkjkXcGHCGBhwcdxva5ZLFVp0vWNwU1jOOS7DoekL/D9ZPiFGSc49kv3iDXX7k3YJ16o/QU8HnxHgvbc9i5r7zQ3eMm5Str7ehr2Xgyca8LSvdRXafWthyjKOUHztbxQ3ZjRt4nJVRNmMTsU/BjtC2d6m0kDmGMY/Vb+glGE1+uKQrkyLQBLmNWezOf3egy4pFz9qxWcXr+bzmT/pdUAMaPgJIw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79027940-70e1-483b-3079-08de8513bcff
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 17:28:15.4610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MeKdLY0AKdpJ6YbvO2C2k6riwTGdf9c/pCSX6vekw3zniJ3poHv+wBKoFhvmeZtKK8KvP2pJ4fiDxZPfe+ymhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9086
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

Hi Sumit,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of sumit
> kishore
> Sent: Wednesday, March 18, 2026 7:31 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Kishore, Sumit
> <sumit.kishore@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_properties: Add skip on headless
> machines
>=20
> Print debug messages for sub-tests which are expected to skip on headless
> display systems.

Commit message says print debug message but change just skips, but doesn't=
=20
print any debug message.
Please update the commit message as per the code changes.

>=20
> v2: Use existing library function, instead of
>     defining new (karthik)
>=20
> Signed-off-by: sumit kishore <sumit.kishore@intel.com>

*Sumit
*Kishore

> ---
>  tests/kms_properties.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c index
> f735839da..9f5649c90 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -377,6 +377,8 @@ static void plane_properties(igt_display_t *display,
> bool atomic)
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
>=20
> +	igt_display_require_output(display);
> +
>  	for_each_crtc_with_single_output(display, crtc, output) {
>  		igt_display_reset(display);
>=20
> @@ -400,6 +402,8 @@ static void crtc_properties(igt_display_t *display, b=
ool
> atomic)
>  	igt_crtc_t *crtc;
>  	igt_output_t *output;
>=20
> +	igt_display_require_output(display);
> +

Changes only updates plane_properties() and crtc_properties().
colorop_properties() can also end up skipping on headless.
I think we can also add to colorop_properties()

Regards,
Pranay
>  	for_each_crtc_with_single_output(display, crtc, output) {
>  		igt_display_reset(display);
>=20
> --
> 2.43.0

