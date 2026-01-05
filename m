Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A92C2A062
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 04:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C5310E332;
	Mon,  5 Jan 2026 04:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2oepASw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3251210E332
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 04:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585883; x=1799121883;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dZ2Vk7Hnx0IhGhMQ9q2nFn0SALYQmQhqRkue8qLN7hc=;
 b=j2oepASwrDiqbJvKLMmuTvY6YKZ3UxS73HYJdzkaG77gvqIzhBsnyQX+
 qhGGnecHMkdA0e4Y9tsZf106Jy0Amq/cmND8y5t6vxKxsqm8/LFON10nQ
 7LpNircCQ8woTThtge5lw9JZzVnHmBGf59nwj9zI3ODJqkloppFqYp1kR
 YVxEkXFEg9O5D2mTnuc8ZnBiDGYiPc0b0aZFF+i5djZfB4IUB5s9rymha
 YUn3wUWdiHZyRJkrNkA6lH/Wx7DedPcIgW6l8KdwqSGaepgLWnsOJt55Y
 ae8rUcov3Fkd1G+clZD7noaR+s23+5L2WGGZeWcchZ0/ecpWFaJmH90MA w==;
X-CSE-ConnectionGUID: ImcaKPKVRFOJws+0+3DI1A==
X-CSE-MsgGUID: E876wFnkSAOg72OuBKKKCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="91604337"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="91604337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:04:42 -0800
X-CSE-ConnectionGUID: Ctn5Qvo7R9iDthdtXvC7/Q==
X-CSE-MsgGUID: j/3tO7VcSkqVZAKsfTaNXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="207322812"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:04:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 20:04:36 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 20:04:36 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.62)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 20:03:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhCziPzSOSAQcv7XwKL1UN3tlVVhbMoTzUiETP0ateYaCnVP7Xo9omjh5XDo3veNiNc34o808opwbbM+fyGcgJ5VFouy7Z24CM4JpYLOygJw/HodkXhPIKkLrJS+y7mUz1hmRVtP/VB2E1bHyD4AYQ7K98Cd8jL5NHF+UMg8nMqi7bh/0fpg3GfS7IVLUuC6/juL7TMYM0B53ELI/HSkSVAuccVFaCLiHCJQWce9UxZt8NB+oKqoYc2pZZ6G0LmzCWXzxhqZcI2BFdPcua+54Uc79+7lJp9bVMxZU9zfGVmdoD4q/sKptX0b59oHly+Zr2mle6aE8ikeZEsCVm43Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRgREMli7IcX9+qLeN8ToYF2ZiH5axyqk3SWdqosJhI=;
 b=oDVUu/V4qMdoEXRiyJElz2WN2hhmo88mm/sEfb9T2T81jWeW58kZPifAFPUZDMmGIWqYDPnFTiUlCTsf57Q71D+UYSl9T7RyhM6MXtWukBO5U/7TqTwdY31GdGIsoZBdKxzAtrVwLhQM9wlasYm+9JRYx/SoTQMCK48VCyQZhUEJrlhQLu0biokqaraBtzStAR8IiIpK5RZcwqF4vcZX0jHMXgvvUfstPYYwr7opIqHh6SC4UOaqafcAzXtL3SWXtvlf6yXBKs66UheKMXJsW3u0ytRk96mlDIMWNwKr2np8cQQnnGY3ZimRlHOyLHrM0RZQIU9WUKKwE38JQegJsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 04:03:55 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 04:03:55 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [v2 3/4] lib/igt_hdr: Add helpers to enable and disable HDR on an
 output
Thread-Topic: [v2 3/4] lib/igt_hdr: Add helpers to enable and disable HDR on
 an output
Thread-Index: AQHce8yzwJFnAfFTJEqmSRPUOF8wGrVC+J/g
Date: Mon, 5 Jan 2026 04:03:55 +0000
Message-ID: <DM3PPF208195D8D1DAC95E04F23A04F5CA6E386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260102095451.42401-1-swati2.sharma@intel.com>
 <20260102095451.42401-4-swati2.sharma@intel.com>
In-Reply-To: <20260102095451.42401-4-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CO1PR11MB5076:EE_
x-ms-office365-filtering-correlation-id: 9b5079b9-145a-4295-21c4-08de4c0f71fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Te2Vymi9eyTS14YMI6iCZaSbZDK3hAXZ8KEj9/VAY51+1mo9Wg1MhVrrgJIA?=
 =?us-ascii?Q?reosMU5WqHvTxGFh6131g3fAGUGUs3ykJIi9YqQZFafT2BpaflsPVWOwhfM/?=
 =?us-ascii?Q?n4ZX0H8zaK5orS1o29J5K6HV+WxG5+lPjEy6EZsNHuLdYWTT5BimoOwbToR5?=
 =?us-ascii?Q?y17Ru4zosCXNdEJiyxjwWFbaCW+1M575chBJ4V/OYPymiPo3rndYPFowLAKv?=
 =?us-ascii?Q?wZFGTMnoVaXjb9Kjw/FU2OWJQf3Zd40Su1VlHMehz+0TPK9R9v6QyWEvOadG?=
 =?us-ascii?Q?nMaMAviuQ2kpawEBzqWgoCVdlQBX7zuSyMZUQzNnYAW6O53/47fqcQ1C7rHf?=
 =?us-ascii?Q?kqx5vOR8y3rKJSJTOR7hZWllu+moHzP3kYFz6celr3vEffvmEa5e+Fhh5NwM?=
 =?us-ascii?Q?uUWlPwRcXN2PieWruvEiIPkdYwxSYZcRPzlixHVhcs0gGw0g/7dG5676JEcO?=
 =?us-ascii?Q?8fs7uHEFG+0SaE5BCMOGHHek/LEu8bwAh57zteS/Oww5rcaH8W6b13o0Swbf?=
 =?us-ascii?Q?1bgWDMCj05Fcw8udJXDS601CIAZfBic3rxUQ/3ZB7ggjO97ACBkahsg5H7qK?=
 =?us-ascii?Q?/31ujdrfj81bKgxDd261Lkg3K9hUvt/+5gqO60OjOMFbcmQMkiLd+lOJVXG0?=
 =?us-ascii?Q?sdgCQZCtIq2T6aE1E4CqNovYv+eKESMwDXPp2V8Nkk7ifk9Hxf52YAyTl9LX?=
 =?us-ascii?Q?9gxIw2nUaphoASr+h/fN3FshYokXOLHLviIXJMNykTuN8/ElJ1IEHB1xRJ5X?=
 =?us-ascii?Q?60nVbGQo+vYoX7DYUvMs5MDb7UBGRH5DRQplMN/hT+tdpdV+6dtB27Lhn33n?=
 =?us-ascii?Q?9CCLq/MD7jgSwkoj2zWNg9KK26+IIJtkrDX+EccniNIhSiW1Cd8tMYxDygvR?=
 =?us-ascii?Q?7TXqq6Xy+oKEvTsPUd8610mvHAU+dPgAvJASc7f71YDV0Byd4czTMJSf1Rlp?=
 =?us-ascii?Q?Js+7gpV7hZCfsgJQOv6RPpejyp1i83HkdAci9TsyCO/CYepZxTQZuP8zdh0o?=
 =?us-ascii?Q?VEauWMotDWlcvyes+BHhd2zpG1QgwOuu4r1FdjdqOkzA0S5XixeDfO/k2/8j?=
 =?us-ascii?Q?Plr5beaVTZvh8wuHn7AkLN+eul7OlcdevSeCni36dbCnB4ZcUrIyzxtaVHkY?=
 =?us-ascii?Q?ymfhbR8dX2+2KPQbWmEJZHUfaYzsPbXtfBlSy+xHeUZe9EfBh3uWIeKOF+JG?=
 =?us-ascii?Q?2okdoROO6W7bjZYiKdLiaI15DPlBYpovy79mp4Xs8YKZbh1Vkbes0RMzyJFF?=
 =?us-ascii?Q?tKjfc9q2vBKgpWE6RsazQ+fjsvKC+FM5RXR4aHA97WAv8KLyU8VMJtuZ9Ncb?=
 =?us-ascii?Q?YeRFbNqdIQOjhMa0P4Ixr0LcGbyGixEnsunF5LTknV0k3qIuWz682+7pBgkz?=
 =?us-ascii?Q?3lAS4QDJbUUyQxhjuTkkVJ4X+kUqxYNdydSaSBl+nzon7j4v0qPmSAA038QM?=
 =?us-ascii?Q?+yMS8t+KQkM32s3HyTsjG5COEEJu3O43WgA4haQZ8PjLxj0Y1feX4fjAFBd5?=
 =?us-ascii?Q?nXhabUZQy79WZHSmjsTKdypTxOgtLHDuegBT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oAZpWJKskofx7xPYONvAhLCt9L4u1j0Cx3c6+5MrmOU9e2SPloKmo0+cCnME?=
 =?us-ascii?Q?iIKCOK1V37P7Oa+sTUyn1A8EgrsN2aCQQ7As+0FJKj5+Ni/w2cb5dCNYX2pc?=
 =?us-ascii?Q?FMCrPmRkz0VL/cpaP4+7klrP0QUsi36HBI3e0g7SofsZns5c/XcQQDmy/a99?=
 =?us-ascii?Q?+wUENVLmDPadK5qGDWkK1GCwXEo2+BnhL9uYByoAFo3qcHbHLer9LlQ/A7PD?=
 =?us-ascii?Q?zWCDwE4pdkTpS/iyIbbnNJDbQnjmAhiMg9073oXhuwNNAVAe4qpo6fx5nLUF?=
 =?us-ascii?Q?xOhg02/DYcv1VAGJfbt/MrnWvx5SD4g+uJdVq/fq+kb2N0UWXPALwJ+g/KfG?=
 =?us-ascii?Q?pDOhIaCHryc/W9FZAS1WRdvYMrBuxJRl9hCGXu3kZF5Q0Dm5N38qZCVjofoJ?=
 =?us-ascii?Q?S3n5S5JXxci5eXlBHOYaMzN3Pk7eqoiQg7RIQLHdgnuVt49yhPjfxgzYCaVO?=
 =?us-ascii?Q?+fWONEofGfPlWMeHO9nc5luBFgHA65PRGHMSmyTP1FvHvl9cQtZYI9BktKPo?=
 =?us-ascii?Q?Z4K3t+I+qR6IXMpOeeFl/k9/WhQf6/22eGO6BTCMGvQRSVGR7WWHM/ceh560?=
 =?us-ascii?Q?ubtNzkTWOArOksKNYRtOjGG8kMVg6heGCPF9ZVXDuKGQSlApE3InQkDp1GoG?=
 =?us-ascii?Q?Eqo8eGfXJJtgisF6NWCMMZWQrJmmpzAnJQQoNF1NbwxD596erIpmikIUHT/n?=
 =?us-ascii?Q?MmEEUSxQ1RM0oZ0MrmPpTX/7h0ENdFlA550/gaiBRmzWxJtnyjUS9moeStaq?=
 =?us-ascii?Q?oqUfQ2TNScXx93qwuE6LrH4ZafVTRn60inoIqOgWq1vKBHyIqgx0QE1+S/aW?=
 =?us-ascii?Q?Z/nlKdC0TaWIBW3yg5Fn3y91bcZSxFjehSQZJBDc0+rWShUuYKwynFZHAPaE?=
 =?us-ascii?Q?YLEZNGNQVBS1bd7YTe9kJGe9DZBjD2nWPilgXSol3v8VMrHVcWcEqUTIDzzl?=
 =?us-ascii?Q?G9/b6qkqEf7hxDc9UNB0/ghyhxfe4Mn26qH1Bk8pEhPR+k3hVp3X1YiKaZjW?=
 =?us-ascii?Q?yLCEXHf07jbRsdRaFEu96Lofb1MTLEnbK3QDHbMQ/dlFqcjiU0vMyrwXcm8B?=
 =?us-ascii?Q?JbCnC7MTQP9zvX8h1v56Nel+h5g/q+Hn/pQotVf0v0cogXAilKWxHxPc1nlZ?=
 =?us-ascii?Q?c4/2gyUSn3V2hVIYbLg9LNeHEcNJezEokM/EptjttbI0qeLkdfvCmJWq/cmw?=
 =?us-ascii?Q?33LHgBuvgZoM1CFUGHfNRTI+kqBr85Cl/XKhLtukYUaCWn0STlHyzh58Zxo/?=
 =?us-ascii?Q?G1YqXP2IHRadkmqr7+THfmKR8LZLA2Uv0CHIKtanbkJRpf4oPwDiziBhG9s0?=
 =?us-ascii?Q?KwulgYcSAdNLBY7jG2jnpoSRGjYV7GJTNGh7/HRf7ZJwmT2KPJb4DjmKeddY?=
 =?us-ascii?Q?0iLCNX+PNXS48yH0bBca+VHI/LJlPubg0/AG2pR4NFTp+pYYSi3fq3v87pzL?=
 =?us-ascii?Q?9/vDoNpXOf4tX4a8tBhWFAHhA7XTOW+XDgpwrJ45fNA4EkLCL19V4O2Fic16?=
 =?us-ascii?Q?mymvWpQuvOFUw54hlW1GTdxFHqAeD/wjQwIVzGNZ/QRE5VimJ7cSGDrf+wIt?=
 =?us-ascii?Q?wgF4axKkvemp2PMsdCsGjHGgRJU+xg+gt8gww1MoCoJe4q5RaM/VEEDRAmoa?=
 =?us-ascii?Q?o3/jZ7tEwxERe3gAu39Yz8hg/kVBMs4AZJcEmKzxjcmpSu3SGDAXVy2kuBsR?=
 =?us-ascii?Q?bal4ZKZsCC9wd96ZwAR8oERA7a3ayRq7YVL3GZmsGZC935JyMV8UaGNiDQ0y?=
 =?us-ascii?Q?bUJ4Hez4Tg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5079b9-145a-4295-21c4-08de4c0f71fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 04:03:55.3359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q1QWS7ikACDBcgZDsJGzKrRXFX6Efgs3Vjvw43noJvkO+kD+XmHIX3qtigOcpWIqQS5olmZsYHtjE24SGNvi+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5076
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

> Subject: [v2 3/4] lib/igt_hdr: Add helpers to enable and disable HDR on a=
n
> output
>=20
> Add convenience helpers to explicitly enable and disable HDR on an output
> connector.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_hdr.c | 16 ++++++++++++++++
>  lib/igt_hdr.h |  3 +++
>  2 files changed, 19 insertions(+)
>=20
> diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c index 85a6b5712..762eaba16 100=
644
> --- a/lib/igt_hdr.c
> +++ b/lib/igt_hdr.c
> @@ -199,3 +199,19 @@ bool igt_output_supports_hdr(igt_output_t *output)
> {
>  	return igt_output_has_prop(output,
> IGT_CONNECTOR_HDR_OUTPUT_METADATA);
>  }
> +
> +void igt_hdr_disable(igt_output_t *output) {
> +	igt_hdr_set_metadata(output, NULL);
> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 8); }
> +
> +void igt_hdr_enable(igt_output_t *output) {
> +	struct hdr_output_metadata meta;
> +
> +	/* Fill HDR metadata and enable it on the output */

No need for the comment the function name makes it obvious what's going on
With that fixed,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> +	igt_hdr_fill_st2048(&meta);
> +	igt_hdr_set_metadata(output, &meta);
> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
> }
> diff --git a/lib/igt_hdr.h b/lib/igt_hdr.h index e03fca59e..127b5f6d1 100=
644
> --- a/lib/igt_hdr.h
> +++ b/lib/igt_hdr.h
> @@ -30,4 +30,7 @@ int igt_hdr_set_invalid_metadata(igt_output_t *output,
> bool igt_output_supports_max_bpc(igt_output_t *output);  bool
> igt_output_supports_hdr(igt_output_t *output);
>=20
> +void igt_hdr_disable(igt_output_t *output); void
> +igt_hdr_enable(igt_output_t *output);
> +
>  #endif /* IGT_HDR_H */
> --
> 2.25.1

