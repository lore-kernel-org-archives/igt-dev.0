Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DADC52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A918D10E02A;
	Tue, 27 Aug 2024 05:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHM6iK6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED39510E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737264; x=1756273264;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6MgFcbDYFM14amEokS/gyZim6zkkeFSyxHX2HzM3ubo=;
 b=MHM6iK6pIXHYWvvXwAEiti2y6HMmQqewxEmRin98VH5dT8r6CS3qLCpr
 2hAv+mnlzPKcIeAnNSk2ULazDuAxEx0tJxeiX5ZrtV2AqGu8zSGg+mYEX
 emm6UEiuP2/ssn09q2TFTKvEJjztd11/rGg/FmL/k2JSdjFuqVy2AOLUF
 PWzuUjHNinsbtciw9SKxSaHiX4nfMtsq5L5br+gOJwcJPzm26cZCItjDC
 tZBOUQDH3NQzEX+TM918T2a4+u3i9+RXUhlW0WpNwhMROenltqacEUQ5y
 PYQI7M8da4RfLsJrNRz04haeNEGgsfiHjC83pzcUf04ayPfT4Hi/Y/XzD Q==;
X-CSE-ConnectionGUID: AXDegS/YQKCHEUUmE1ZjEA==
X-CSE-MsgGUID: SpUNKXDUQOi4NwD5o8Qw3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22716408"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="22716408"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:41:03 -0700
X-CSE-ConnectionGUID: gt0PIqspQFCFu6IKM0dBKg==
X-CSE-MsgGUID: 3SfpmmBGSQOl+IEG14t6VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="93480431"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 22:41:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 22:41:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 22:41:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 22:41:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCut/T58B2HOPTD06EyYQv6LXJtNjpU3Sn+3+i/5kL0djk/+0mx2E8zBpCbTE1b8MbGRoRF2BjktAtbKhtDnTp38mGroHRAZSKxz81v3pco5PtefELwlOjyr02+v7fLrE8g1LMFO9QIsiX/Rc5Xtx2VMrcHBS54NZVtoR+lnDus2oOInd7FUxgaycdt4E7jrNognppfQUQhGMJwyefn53UUI2ykq5jWGFm4yKUT6hASElUT1X45JZnM/ZNRZ+K/IHkCvjvZFI7D9GlyobgKGPqXfcbB00sHAhbSn6xhBQ+dr0DyV09sylwF+10UB7D2ja+G64fNLehxjPKLvQUMu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfBaUKCUaOW1qYf1CKNzY8ITtv01yIWq6Cow0Abn5io=;
 b=NKY5wSCaVXCCtNvmW+dmpMZmwvStO0T1jsamVWjTXXKdIbqhZcv8K1uAPKy3tnXZJzqyggpTCjcB9LJ5N8n4r2yUjTsQr33KYKROlZa4mD+VSMytxfXCTWi5/0TQzXvM1A+ZfdfJmJALmPvMgHFAxwuYcRJOcsRvyBGhiC30dMKCJnFj4SBMImum7N9e58glniuCrc2U2RyQ0QQBrdzsWsPkS1bDns+g6+GOy6oKgIJGj0DZNer00lfhUzbwT4+90l5T7gOWfQyhCO9wg+gsK4TgkUoV6oQEekVDXh82t6A0VyNnfiJ3mw2RxslpTz5o/qgim1Nn+OnXDVzxY0Y9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 05:40:56 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 05:40:55 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 01/14] lib/igt_kms: add enum for link rate and lane
 count
Thread-Topic: [PATCH i-g-t 01/14] lib/igt_kms: add enum for link rate and lane
 count
Thread-Index: AQHa9yirwnCfWgkzRkuGYVmDLQo+IbI6mPKA
Date: Tue, 27 Aug 2024 05:40:55 +0000
Message-ID: <DM4PR11MB63127BC137D5BCE484EACE3F90942@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-2-kunal1.joshi@intel.com>
In-Reply-To: <20240825200612.4036178-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH8PR11MB6928:EE_
x-ms-office365-filtering-correlation-id: bebcb9a3-d438-4924-e2ed-08dcc65ad267
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?cUwATty79oBegbawqPSsUWElW4ST6ANF+oErl2ARdiy9mqBQKFPKU1wQHbrK?=
 =?us-ascii?Q?CpStSduw5OVYC2yCJHLmyQ8ibjV3VTFVCBz/5TSdRwqCwivIxJWMudgDly/d?=
 =?us-ascii?Q?ehetjIch8DWbHFbEog7O4nh5qAwwS6QdrPlAk7ASO9aGwbVfQGvk/DMsOboL?=
 =?us-ascii?Q?InjU+7tWIMj6r8OQfqSX/z7Fiy4QoX3dyZ4LeuZs+uBuPmCEjk0/eQD5K1vk?=
 =?us-ascii?Q?aBvfNc9uBPQIe3UOpadGm0ISDexuQYo0QtUI4Q/YUD4xw8rngRpYzIAXzAtO?=
 =?us-ascii?Q?t7YE2HouNTIUu3/9Mf0DjTvWUYgUvkxQqFlCXOwAJ1ZShRk4G+TmMKmO4DtR?=
 =?us-ascii?Q?yLXY6z03EBVh5LaArGgM7Nx9B7XiKlaS1VjEMgwBeiyXDHf2OOWbv/9nXfCf?=
 =?us-ascii?Q?O67ps//r1Mw5UfscH6INwsLwvZ+9Lleoby6vYm3qR1COPWh7Vl9IfmOwt3AH?=
 =?us-ascii?Q?vlYVOmN5ZSugcgyhRND4xQS3ul4XOooKno7EbO93T/nnqGv1cRj2y85XDZ8W?=
 =?us-ascii?Q?7qCXX+h+Lf2PJThJZmkY9ryHGIkmmePpgDRlb5WJsZZp3IXmLKXejwV6cfgC?=
 =?us-ascii?Q?elvwtNzHJ07k7CoSAwdZ5SbzvcE9LB4IAbrdMzwwhaAQuWNsbEd5pr0WB+Se?=
 =?us-ascii?Q?Pplo2Dy6n8sPsQasQTNrd68JDudh/TmQvtOs17ZqIsFSiSAFMHfW62lKS2Tc?=
 =?us-ascii?Q?hQwydqMVQK/U+NfY0S6DMdnOIWwQks9HYANyUq3owZAsIEzhTKmqeDsMpPGZ?=
 =?us-ascii?Q?JLIbsBdwNLhxzOUea98W3kujOfXL9Y5BGpHeE2Ei5xfkmKpF3gZo3YQhjaFD?=
 =?us-ascii?Q?xCmHMBrrUtumGMcrRJmHYRTFBbbec6gRAllDwN4c4/pvMw1IHU97u/4gv7uD?=
 =?us-ascii?Q?tAtxbbF4QPK84r/pj+aPzT7o5QRX0l60YY/U7F0cB9lLGTK8z3jLEYLm5Aiy?=
 =?us-ascii?Q?RPaWm55b6KuNSMbz2dl71oFSTWpD6coobx7nAkegc2MMk0L7d+yHcbVzB4Kb?=
 =?us-ascii?Q?oLX0izJaV22zlXidtxpSjlDnUdrXeSWvAWj/99tY6wZ2yHWy6fxNhrjl3ZDc?=
 =?us-ascii?Q?2i/l2oxevnHTgYvC4VxM39RGkZRcPV1xZOPqaX51RCADNkzKFVi5uch687ke?=
 =?us-ascii?Q?xv5crgA8r1AfUsyHXQ2cKAhfYCwTqEAGZuIoQeTktQ+ua4GRyh6jBDiwpNfC?=
 =?us-ascii?Q?+se0Cb0UUUvqKcZS6OiG3bI05sQDAmApQM49Mpm+3g/Rhc58A/MSOabR4Tx2?=
 =?us-ascii?Q?GTaMXEycJXAKojM0rpeJ5n9OPgi29xKju6wCeA6Fdvmeuk2mLw5EdNvCiPvA?=
 =?us-ascii?Q?EindlZCKaEYGPjGMgTyq1xf7XZB4xGZF5vT/z5lNJ33AJWD2rkHuMAxhwYoX?=
 =?us-ascii?Q?w/Afk4KqTRsinekKVhvO3/nw/CPgsJYSRG6ejWb+9GGo5WZl8w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L7KP2J+Z0wb0QWhL9ZABkOe0YWhChrneI2tv9gr0+griL9Zs1liygeN9zvMU?=
 =?us-ascii?Q?Y7d31muv+Y/th19J9B3Ut4BwRAm3R2AJZsXMP1mGlwOAPdLpwV1XqibT6b0F?=
 =?us-ascii?Q?NdZ5PcawXobTRd8yY167rg++w/F+KN2xHP+YfTWd0jFYL8/WwZ0EcLzkKZdL?=
 =?us-ascii?Q?Nf4B3GI8tt5fSgPE1hzO5RD9KA8Ab9ygtcJMd4nuDTa0R/PpI7j2RIvxcbbx?=
 =?us-ascii?Q?wc8ScvuGOc/QfeVz8LmZDoiBXorqbg5fBLxYH13Lr0JhZUJjPxZnoQJ09Nzz?=
 =?us-ascii?Q?voVE4dTHds4foQK9C25Y7eHnvHHtJwzOKBWxbcsSVRu8I6P/0J144x8hnmTn?=
 =?us-ascii?Q?jCr6sQdO7GBsNwE5cX9iG5dc5FyYnrqy/MkEVaJrIOIP1QzoA9lfNkMO4h2S?=
 =?us-ascii?Q?uwL2l1AWvHD1C/6/5PunDFS3tFK5/pHdHbkLGAymAPnmnprZd62FOlTPw5Dh?=
 =?us-ascii?Q?mwVjbWB+/a+WPTGYsL0wU7mHTqyJ1wI/Aah4hXd/Uq7rEWMwGEsrM20eDNYj?=
 =?us-ascii?Q?P6PIw8BXVTSdgejj2Y6Fw0nkCOz2l8Abn0codjgqCEGqQWX0i8Z9XY1ijU1s?=
 =?us-ascii?Q?EcM6IJmjaI1pwP9umQTwEmw36WEwiLXLl46LgwwX4E+zq/32jipms7G8wJVU?=
 =?us-ascii?Q?CLJdIYgmJ5YJ4KF7wZ2EcRUOwT/trSjS7LjL6zczfUZsOXRKcltwCR4MIUxe?=
 =?us-ascii?Q?nYtz2pFBCz5U02+YxLWf2/oujB+5j8AoemeS4rkajMp4i53jruSyXJ55mIn+?=
 =?us-ascii?Q?n0rXUtkMC1PSdzk+evj8clnDqR+aCPLeKWIy5ZKoz8jphpzRblhg6tan5Hbu?=
 =?us-ascii?Q?Ro3/8Watz6IVCwc4P089wJprqTi+jVuScKy9Fut4UJxYkcTn3f8Jc/FOt7K6?=
 =?us-ascii?Q?eIuQPd+MA7nExI7od95SLmTBRXEwD3p8uWZ/eyvRipZPrw0SM3oxd+TNwBn4?=
 =?us-ascii?Q?NcS1/GgnFYiVPhn3uqMAMZxaQRaUFBTvOBZV4PWz48altHz88nVvbAztfGaR?=
 =?us-ascii?Q?0YnlWiBI5oBLBfimnTuUhXOklfWbFrrNLGqCvKFpo0B+p/56eEaGWe5upvf+?=
 =?us-ascii?Q?b3HIe245AJf9jm+EpxW7TbSfmBzH4iAPl8NvXPyc5zs6Pn1aN3AN0CH6uwow?=
 =?us-ascii?Q?2cHkItk00hQZvXRWVPOrtg9LQG/VNJRYZdT3zPKmFKWYawlFp5lSoaM7mm1D?=
 =?us-ascii?Q?CwfDmI7DtbnOCebfErPif1uvytFLRI3fPmn5mmmaRPIK9tAzHTvhSaSrxy8b?=
 =?us-ascii?Q?+pZqglA7pvOXUCjK1XwIRQK2uuXdZpdkX4Jo6AYiFtUd4aex6wUrOLkKDpKy?=
 =?us-ascii?Q?VcycRjooPpPXtW0+xrf2YgMdkg0qUjKEqjmJOlJLtoH2NsH7jo9r9GnbeEcR?=
 =?us-ascii?Q?nvBU3IGh8NeKXML5Us6u5LK36keLFYO4AV1Y/6Z+2kOAMpjwHq+tBe4eYKeY?=
 =?us-ascii?Q?Du1/yx18X5Vs2e5cZ2CmVnlOVk+5EMkxVyNgdSSufF78WBCPtO8iZ4VGkD5f?=
 =?us-ascii?Q?MwPRuRKIVmMcxxMAOFHZLI2hczIdrblaNXJILiW4nqhdTEU5c/tN3u9cQ4vS?=
 =?us-ascii?Q?y1UgQME6+iDSBPjJbMk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bebcb9a3-d438-4924-e2ed-08dcc65ad267
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 05:40:55.9101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +4c2Hpip7j2k7yLXAwVhtb+lIxvMC8z8zz5pN/2le/mXfVu4IcVnp4Z8sKEzq0v4LsW5Dov/itq/aKUM1WbsaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Monday, August 26, 2024 1:36 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 01/14] lib/igt_kms: add enum for link rate and lane
> count
>=20
> add enums for link rate, lane count
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  lib/igt_kms.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 25ba50916..999921f9f
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -258,6 +258,29 @@ enum intel_broadcast_rgb_mode {
>  	BROADCAST_RGB_16_235
>  };
>=20
> +enum dp_link_rate {
> +	DP_LINK_RATE_162000 =3D 162000,
> +	DP_LINK_RATE_216000 =3D 216000,
> +	DP_LINK_RATE_243000 =3D 243000,
> +	DP_LINK_RATE_270000 =3D 270000,
> +	DP_LINK_RATE_324000 =3D 324000,
> +	DP_LINK_RATE_432000 =3D 432000,
> +	DP_LINK_RATE_540000 =3D 540000,
> +	DP_LINK_RATE_675000 =3D 675000,
> +	DP_LINK_RATE_810000 =3D 810000,
> +	DP_LINK_RATE_1000000 =3D 1000000,
> +	DP_LINK_RATE_1350000 =3D 1350000,
> +	DP_LINK_RATE_2000000 =3D 2000000
> +};
> +
> +#define DP_MAX_LINK_RATE_COUNT 12
> +
> +enum dp_lane_count {
> +	DP_LANE_COUNT_1 =3D 1,
> +	DP_LANE_COUNT_2 =3D 2,
> +	DP_LANE_COUNT_4 =3D 4
> +};
> +
>  struct edid;
>=20
>  bool kmstest_force_connector(int fd, drmModeConnector *connector,
> --
> 2.34.1

