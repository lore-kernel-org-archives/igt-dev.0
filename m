Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9781EC3DA41
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 22:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5878410E1EC;
	Wed, 10 Jul 2024 22:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bij8z5aR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D6F10E1EC
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 22:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720650321; x=1752186321;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TSfKFso6g8lg4zTnMUJi2W/9murPxgLCGlBRTCvXSmI=;
 b=Bij8z5aRbZisNXgbuWgclboSEnMGgLQ3hvuFU7TeotDSphze0P9yxMEF
 oDYFmjJT4j4XUCDW00Y+7vwWwQLSJULMfeHLiQZQXYvuj0s+Jw1so76dI
 AlwMZwZwCDxWGZ9CJgLvZMVX3Y5s5XhnjqjC+RtQDkczpBWxa19xSfshD
 NgWZGuL9+zGBbobI2A/kIPob77DtZABnxLIgHo1nJVPQZGlk3kw8NnVlo
 kWPSNVNKwYzGH0V/DbSAeko+AzUf/MYq3dKKZez7FE7mt5O5RDefcGd6g
 VAC/rO4DS9hIIlbijXKl8V/I1uoBjP/7HtwUkqk5nRHch6Z7tDxRawBfY g==;
X-CSE-ConnectionGUID: 9qBqzqV9QHKEw2jlCcvgmQ==
X-CSE-MsgGUID: q3I2u7cPRV6Rz2i4u8/aAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="28594631"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="28594631"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 15:25:21 -0700
X-CSE-ConnectionGUID: KUdrlDfvT/2mhSO/HvzUtA==
X-CSE-MsgGUID: RAgunqn/QN+I/gJG0xtCLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48250898"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 15:25:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 15:25:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 15:25:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 15:25:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 15:25:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcQ8OtRzi+TZxRvapzv2gze7xgt0Ou3Qn+2SjvYRI4Ccc3EdtpbWiOA+3skGk4XJKEFgHzrbcVCKW5GVFUaODBGUh2IBFg2+T5p7wmFMcVXxiIoUJSbOZHqiqMGZBotmZnUiL6GOKsr0k9k8YFhgodeEiu8DDPtrBtoaF8Tuo2K1HBLc7jIwODm1E1us1bsvkkIFmRwq7AZkL7E0tchWhQGDZDjZV2y6G+5dbYpwEQmCaC658cyFWNKekP3FV1COUfWsJdOrLFSAC57UAFu0HGMaE/GB0110W4uqaBhLN3YQpYsOQ+L4Fhh+ZsGmO9i2evKthWYlJx3i73YrGFefwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WR8AE28FnFzYdwz3CQdYZvORNGC2wPX1AtIm2fWSpeU=;
 b=OaNb8efzd1vZ0ZTIdc1G9zT3U5314hH0Lv8oyvf+QntFOX4Wm6ZArOE6gkyTvQw716y9apAskzGYwRDpq1+exRGQ0nf+SxPO4uCmGsODGHdquwdI5KEdMBV4jeN6RYv+3TLl9oTH0tkMnXXRAQ5j0ibp0L6zZi00TjLoxMIvlXSkolLhV6o3DdIFJBd9k0x+PYkjwVuoA9XBfj4KF5y485Dd3HO0ptPjx2JZixI1wqSzlQchc9Y33osx6K0/hDRxxe7BNNNSgrZuL5Xp0+OPZA4FW3rFVofHLywRoVlqB3PS9VDlflVPm646TIr/Ch+FUjC9mo656sCAm6uu09i0NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA2PR11MB4827.namprd11.prod.outlook.com (2603:10b6:806:11f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 22:25:11 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.7762.020; Wed, 10 Jul 2024
 22:25:11 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/intel/xe_query: Sanity check EU width
Thread-Topic: [PATCH i-g-t v2] tests/intel/xe_query: Sanity check EU width
Thread-Index: AQHa0xSyDipPgto+u0itGfG7t9q1ALHwhlgw
Date: Wed, 10 Jul 2024 22:25:11 +0000
Message-ID: <CH0PR11MB5444356E4D80DD4F29F45723E5A42@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240710220050.2169596-1-lucas.demarchi@intel.com>
In-Reply-To: <20240710220050.2169596-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA2PR11MB4827:EE_
x-ms-office365-filtering-correlation-id: 7331bcf6-27ff-4a77-6cc8-08dca12f29cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QQPIvS01pN8KWIWKu89PTQ2Yt0sLHCsbUJX7JpsS9jrSDnBeMnbd2gLP+yb8?=
 =?us-ascii?Q?D+5q6bI8rYVvtNVBEF/kW0E4L7/gR+qjGW6fjSLfwdp3o82gyM+4Ehekdu91?=
 =?us-ascii?Q?WTAWDvARkipP030IlxURuJLLgwnEknLIwvP205RCVxOCacCxGcKrLM7bd85A?=
 =?us-ascii?Q?HkZRegRMxkiDs6nBIquV4MGt/0UmkFEJsO3W4bfNDqXPGh8G2sdQ5BjT43l5?=
 =?us-ascii?Q?CsW1n9nIOFLVW9GpCb4MctOgMuTUoupn9PPUjMvCaE9nw/EiMVZKMCyl2lHE?=
 =?us-ascii?Q?QfWpPd2abag+hWzxhpfWV/LzvEevXOfE034qdYU3XsRIpmV96Dg3Q8fnWC1H?=
 =?us-ascii?Q?S78Fn7xI1Aj7WidfTDtrzMuN7IIQQoC4FzCx8Uo+r6LMxt8oxyCmqW8qOxuA?=
 =?us-ascii?Q?CwXq0iRsxKxZNFQ2Cz2PVa6TPAID8CwcUhuLR/xG/cdMSPUMrcUNV5Kbqc10?=
 =?us-ascii?Q?CXDyA3OWhsaExtXJtcLqidd7U9b9gUcuXrjD3Px8C6nw5jrSF9LCtqdZpbin?=
 =?us-ascii?Q?MvfLkAEE7DbqIqQbR2GkrxMSyc523eb0NMmt44BeY2mrq/lgjP/+hojC3XRB?=
 =?us-ascii?Q?UoqALN9zfJCuV8x30YoDsyWZDTfQ5Dr7iinyjFrnpcTKz/o8/8D3KL1DsJjw?=
 =?us-ascii?Q?IgFJFVROeTC5zmwW9x3DvvXY9DfmJhKM1bCgMW8RaRtXW2YWCB3Z+S4LMYvl?=
 =?us-ascii?Q?UAmgbhMorSu7ouda0svkzr1LsKofNK2DrkXWt5I6lN0cGPLB2fIWivvGI+WX?=
 =?us-ascii?Q?GdA9vvTQy8F2q769IBRTO7iHirkhAbLj5A3SnpWigpQCMXzmoC+c0wQhG37v?=
 =?us-ascii?Q?WBK5lq1jURZKR5E1Ke8HcqqgfxLmifxSzjA9p5sXdbQ91oHPvEWZK0TRVtlU?=
 =?us-ascii?Q?hL2ZFCkKVwaSQ7M3YzMw7XRBz30UXiY25Se4z3HxrosIyJ7AfZgGpvz9uNvv?=
 =?us-ascii?Q?ko67h7j6fZbzMS87GNtQlnaCDqxlmdfCzQNz8cR3UHAdvvIP2csO8e1J9468?=
 =?us-ascii?Q?+DjSvclCHN7cQE2MOcNz/SqPQ5T5Qh+DWBO30+c8JINzzrgYOs6Sh2jOsZAo?=
 =?us-ascii?Q?kDm7vnPXFAMQUSfyCN8WLuRM3TNN51zl0paWp0hh0xwK4eAFhPE6MZFQS0BA?=
 =?us-ascii?Q?Nh+/iGO+wrZezAdJxo/u95Vjueoq2KtYiFp8/htFsBotGsWtqIYKb72d/mem?=
 =?us-ascii?Q?HRLRp+23JGuo2Mdg78CVd1UpxyPA1cabRwKHcP5DPBVm9rcmchpBsmylqUAn?=
 =?us-ascii?Q?EPuoak3EePeSnUmqsZlLvIMNJaqMzmtSod8RR62txvQg/ZdQXYKPa2/DOaMJ?=
 =?us-ascii?Q?fb0YGbQugoTiFQHP3HlZtSjk5+ugJr8Ezkl0LDXjlks0qu6CPMJHJoYKAuIQ?=
 =?us-ascii?Q?DcS+RKCyjPqFFLHYaDd865k+Qoesszgh2BxVa1nNpv0YId+8lA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PRCV2Zar8oL/v72K9Ydl/6xgWwVYM6Sm+8l6sROQ3paZ5JxLaHRwYsOcZOo5?=
 =?us-ascii?Q?SOJjJUKbXEFa+kCbWyPDx9d4/V+g4vWsIxUDh8U3GqEnhkmRlTMALJNmdhlR?=
 =?us-ascii?Q?ZiTSz9LbkJ7OFlFc8s0JymBJ9xZU0zB01relPYUPwlt/0y5rFGqMAJd2hAx9?=
 =?us-ascii?Q?hNaal27W3M6Oy+y3L0zQZxGeVEKCOPtrQkCFdGsAly08KEQjYgI9V7iOUTS4?=
 =?us-ascii?Q?a8kud0FnlqaN1dO2NFv8u38OM6F2QsgQp+Eay/mFC0HSauiCF2gXlJ7JwuB4?=
 =?us-ascii?Q?hjv/aZ7zP0bzVyVr5caofopiGUAmtzasAqNzyn2lpCPgHnHWpEOckvtKGd+W?=
 =?us-ascii?Q?r3nElhobSZqVdgsqnJ0e1o9tDUXkGxNvwva8+eWjf9wny+m01NI5MyKVUhTZ?=
 =?us-ascii?Q?hk5T2aXuugeUQ8XKEU8R7iWmUfO4S/rWJD10Gx7n8yVfzVGubWK6hZ42afC8?=
 =?us-ascii?Q?bbwsb8Io2R8dojGWkUsyCtPtfkEfsi2aujytN4ggYmlzWKithC+rISqRkvy6?=
 =?us-ascii?Q?378O6+//AZpk3peG3IkdnGpE/S+I/DW0qzha6gKIochbzIGsy4PR65egEN2g?=
 =?us-ascii?Q?30xO+6Wf1eTe6O2AIS2hHE4W2HSLrmzLIYnrImx9VItHkzixy6FgWmWQplr8?=
 =?us-ascii?Q?BrkpsgUicLLWV4wiuUnD04QIMJB8pwezsiprt/AhSy6N2dkw+ixOqFfvbh8d?=
 =?us-ascii?Q?IO2Q1tn5KimwtkD2O74FK8ROCmzYSUY7PbUuiWUmBzKZtAGp/pt8egKtcawB?=
 =?us-ascii?Q?+IAz7HCog6lMUSaMnZ2IttxsIZHVLLJ4/0dysdiO595VdwC/cBmSGr6dTEvg?=
 =?us-ascii?Q?vjqlurQ6QLln8ixN3t4yKW0w4wRyVAri/E37V6m2a09LdtW3iBZVMI9f8KqV?=
 =?us-ascii?Q?1aWKVFCYZzc0cvUOoS78US8DfQ3DGI+smrGseqDleqOF1VVfc40DLRih4oZp?=
 =?us-ascii?Q?yxtYZa1Sf2bxmVBI0EOPGJySpVhqb63D2PlBo+gIGk97KEPV8IBYtkQjm4nP?=
 =?us-ascii?Q?uc6tekBPTNZhHX4RjoU26GNoeUcHoRHWxlIpk0RxcFcDo7ehYsf+YeAOmerL?=
 =?us-ascii?Q?z+dD2Nnerft6R1IGJG0LhOGw6TAW751llx3YxhU4ltmQYQhIMaS3jIszp3Cq?=
 =?us-ascii?Q?nalJqtW0sm7S4O8z2TamF3rBvtEY/PxlmRrhRlisKnogaClQfuAyBjvJSKIe?=
 =?us-ascii?Q?6mhjyXtDwOLEO5owCuAFNJqG7HkN7QC4D/BU+nGfCNzofROaN0nPfMVYHwTe?=
 =?us-ascii?Q?jUoLgc1QpXguVDS8YNxU7HFelHAv9xkYdJS6zSl+yExz2U0f9aYWmZbVyG1y?=
 =?us-ascii?Q?QLRcxhBfgGUQ70F16h9df3MAIDlqJXsv6kWCkDsZITHdsIXjphMOPqkv+a0s?=
 =?us-ascii?Q?UoRbV4Kp+Z33HX2wXWqk5iIgADbD04RiMy6PtekhT36ygfn+5pXUF1pyGEOl?=
 =?us-ascii?Q?lDe1tHuR3ey93rFMTUAUOOrNUiu6dhQAy4qnlwetJzAuSFLuKd3aqeydIc2K?=
 =?us-ascii?Q?nTokYT8QQh/qtVwveJ3n/gNuTJZIoKKxXJRCFiTSf2Xxc7qHEd4q/KqLmN0G?=
 =?us-ascii?Q?drQSgW+rN5SB1qBBZTqavpZkfD6nf5496QEP7Gcx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7331bcf6-27ff-4a77-6cc8-08dca12f29cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 22:25:11.6540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HTaOE1CahiBPuNPHPlUvVWQVf+0CmC2Nv93cy1jAeF4r5Qw7zPdGHJk9uBUAVN1aba+Cqf07kcegEuHXIeYRBrvD6mnx8rOxIxMYUx70mpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4827
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De=
 Marchi
Sent: Wednesday, July 10, 2024 3:00 PM
To: igt-dev@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_query: Sanity check EU width
>=20
> Add a sanity check for kernel returning the expected EU width in the
> topology query.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>=20
> This depends on patch series to be submitted to the kernel. The local
> defines are done to be able to test, but should be replaced by an update
> to the uapi headers.
>=20
>  tests/intel/xe_query.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 92f82f6ee..361c30492 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -20,6 +20,8 @@
>  #include "xe/xe_query.h"
>  #include "intel_hwconfig_types.h"
> =20
> +#define LOCAL_DRM_XE_TOPO_SIMD16_EU_PER_DSS	5
> +
>  void dump_hex(void *buffer, int len);
>  void dump_hex_debug(void *buffer, int len);
>  const char *get_hwconfig_name(int param);
> @@ -168,6 +170,7 @@ const char *get_topo_name(int value)
>  	case DRM_XE_TOPO_DSS_COMPUTE: return "DSS_COMPUTE";
>  	case DRM_XE_TOPO_EU_PER_DSS: return "EU_PER_DSS";
>  	case DRM_XE_TOPO_L3_BANK: return "L3_BANK";
> +	case LOCAL_DRM_XE_TOPO_SIMD16_EU_PER_DSS: return "SIMD16_EU_PER_DSS";
>  	}
>  	return "??";
>  }
> @@ -354,6 +357,7 @@ test_query_gt_list(int fd)
>  static void
>  test_query_gt_topology(int fd)
>  {
> +	uint16_t dev_id =3D intel_get_drm_devid(fd);
>  	struct drm_xe_query_topology_mask *topology;
>  	int pos =3D 0;
>  	struct drm_xe_device_query query =3D {
> @@ -362,6 +366,7 @@ test_query_gt_topology(int fd)
>  		.size =3D 0,
>  		.data =3D 0,
>  	};
> +	uint32_t topo_types =3D 0;
> =20
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>  	igt_assert_neq(query.size, 0);
> @@ -378,15 +383,28 @@ test_query_gt_topology(int fd)
>  	while (query.size >=3D sizeof(struct drm_xe_query_topology_mask)) {
>  		struct drm_xe_query_topology_mask *topo =3D (struct drm_xe_query_topol=
ogy_mask*)((unsigned char*)topology + pos);
>  		int sz =3D sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes=
;
> +
>  		igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%d] ", topo->gt_id,
>  			 get_topo_name(topo->type), topo->type, topo->num_bytes, sz);
> +
>  		for (int j=3D0; j< topo->num_bytes; j++)
>  			igt_info(" %02x", topo->mask[j]);
> +
> +		topo_types =3D 1 << topo->type;
>  		igt_info("\n");
>  		query.size -=3D sz;
>  		pos +=3D sz;
>  	}
> =20
> +	/* sanity check EU type */
> +	if (IS_PONTEVECCHIO(dev_id) || AT_LEAST_GEN(dev_id, 20)) {
> +		igt_assert(topo_types & (1 << LOCAL_DRM_XE_TOPO_SIMD16_EU_PER_DSS));
> +		igt_assert_eq(topo_types & (1 << DRM_XE_TOPO_EU_PER_DSS), 0);
> +	} else {
> +		igt_assert(topo_types & (1 << DRM_XE_TOPO_EU_PER_DSS));
> +		igt_assert_eq(topo_types & (1 << LOCAL_DRM_XE_TOPO_SIMD16_EU_PER_DSS),=
 0);
> +	}
> +
>  	free(topology);
>  }
> =20
> --=20
> 2.43.0
>=20
>=20
