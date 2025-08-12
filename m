Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94374C87FCB
	for <igt-dev@archiver.kernel.org>; Tue, 12 Aug 2025 04:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FB310E582;
	Tue, 12 Aug 2025 04:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJi7CDI0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E616F10E586
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Aug 2025 04:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754974247; x=1786510247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k30jRwK+T3eyKf3NJ7Gj0M35Rb0iHLlDF4adNkFbeE4=;
 b=KJi7CDI0RYtqL6n7ICo5nKrGuoPRQ0VHjkXif5yFOWU3tESO7TtOiDZX
 8vJrV7yjRQga12biIa0Tr17dplpv0rgjf73JDFWX52SOfzme+0rbua4ND
 VE58y7cz522v2+fByiRktTSsvfk3BGzxGQvBcZOQPp3yNF4DjBTtC3yuV
 E3vMQ3nT7AwetMGDhlJyd/uIRX4+1Ec+DFEYKDMsb5U3MYj5vkZrsNcZ5
 yrWfrDbMbWQb+CYBee0ofCCmj1pvxiq5gE6XxO5JvX6ag8UUpNESMTBRA
 wEVlp2eyzJuD+UeSZ102dSSlzE2w154tPYXgzCi5UbArUdWn074kaMPW8 w==;
X-CSE-ConnectionGUID: vZuZqvQeSk6orTvOxDAAfA==
X-CSE-MsgGUID: loP62TsgQwqdyabgQq7EHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57106373"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="57106373"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 21:50:46 -0700
X-CSE-ConnectionGUID: JUH+8wOWSHeUkIDrEd0oKQ==
X-CSE-MsgGUID: kiitUlZoScuPinnKzJSKtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170541797"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 21:50:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 21:50:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 21:50:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.89)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 21:50:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPV9syxXUu2OgYO709UZzO66CzzxI/JuM9XmDXkMXf1m7jSnIPzGY0C5tVMbZl/ghKv2T9TVt6aQDwPbGPpW0qB50NKth0EvnJ7hRJWxREm6IMuj/p7WIJBGT7lFhK0wmXojj8nv+J2lMY1206rKxmRFnOwDqNDFzS0QSb8tDAWrVPwtI5mpUIq+AdscOR2hexlabK+0Tr0L3MfVDn9shRTkfQkwVovkQBLZzA+XDPvYfPnCXM0GOghGo3DlzHJ4eY+Jhqiz/buBVe9vZTLIC9iqRFrzdMMcgW+4XOYQd+J8CqJEi265hKLtBnYX00IV8ANzRudfhHUsy8oiNYo6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pY++BU+6pxUJKMGqsjuzI6obGnVkgMEDi5myGXhRngk=;
 b=d9bAC/MRBb/anHbnQfyUzqbbB737yqC+98SdZYReoSDPSNmnBZWfPJzFAxq1ehN9SHYkMj/Lgu7IFf10arcAMYrh9OxSGs5jEx/MoFzGikC+5GnpbkC3dZQyCr5bBxco3r2XEpt9XySjnqJMB0afZHe9qdc7WYYALqF/liB/3wSgbYlN2AQbUrUKXphEztqnToANZ7rxaHXE8lAYeuiSEiBm8HGmnG5pYP3VqR3mR+0DenCSWEmYinsWO5R8o5JQFzaoCwQuNSENVQIVHB5k+jrnjYMQkLpkpiSJ30Y4IG0h1VV9eSZh2ydhPj/nTM7ahAUo4Ikm2nXcyKd9kQqBIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS0PR11MB6352.namprd11.prod.outlook.com
 (2603:10b6:8:cb::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 04:50:43 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 04:50:43 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t v5 1/3] tools/intel_hdcp: Support for enabling and
 disabling HDCP
Thread-Topic: [PATCH i-g-t v5 1/3] tools/intel_hdcp: Support for enabling and
 disabling HDCP
Thread-Index: AQHcArBc1yImBUMhoEeoBpxBBTmkxbRedJMg
Date: Tue, 12 Aug 2025 04:50:42 +0000
Message-ID: <DM3PPF208195D8DFA148AECA974A4C7312EE32BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250801064701.911143-1-santhosh.reddy.guddati@intel.com>
 <20250801064701.911143-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250801064701.911143-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS0PR11MB6352:EE_
x-ms-office365-filtering-correlation-id: c7fe1cc2-9445-4334-9eef-08ddd95bcb2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?+HZDqZEnGXi3OZMuIW0go69f1hMduBWVNT/B7EuHH+c+ascTd1eio9YJB1TI?=
 =?us-ascii?Q?qXU2qfIqhZlfFjt4s7CLqCX+loetbLvdVoK2J6D+PgjIcpD279/nnVENWxKd?=
 =?us-ascii?Q?cNOrKX0O2+kdrXKmEMWYKd67EvTuauUAJIf7ku1VUMw9+qwToL+vzH/GTXTF?=
 =?us-ascii?Q?rjlVyI/ygwZuqkV7nAdG0JGqeVSrhdxzu6VVvEVAugAh6hszI8zKNUnF5L8z?=
 =?us-ascii?Q?4FxYvCm5wWcO3aavsRAiVgrrvX3FnJr0bpcfHwfyw5uUPAtccc7xNNiaI1q7?=
 =?us-ascii?Q?kG9pp5elrA2/oifGq8/WNsUwFyHfK7E/L5/D7QTeZkPviXVLfgv+csAWKWJ1?=
 =?us-ascii?Q?e/5wALWGEPrkfVYoMJj1lEsNrseXyg8ucwq1//yxBZfilVHCvJY8bFqCB1ee?=
 =?us-ascii?Q?3XyUp8GGHIvCN+R3wG3vqWEYZLwPT0StZ+5wEJkwFvGuXNMQ9ccrzwj526Z8?=
 =?us-ascii?Q?ZAdpe8mxWVyw54MPztg1yvIi5W14UC2NefiPO635mtrRMBgqIcYtmFPIkDDu?=
 =?us-ascii?Q?meAtNiA8n1IC8ZnbWanwuH21OxcN0ldu5n6Dft6Sj51QnviAUO1kRrlCgn0r?=
 =?us-ascii?Q?trMEZYoD+dQR3yIfqCUvf00JQwoIjSwLZlpoKpqhOt86C4oJwnsQwNOMRWL1?=
 =?us-ascii?Q?5n/NcmBIQkcFjbb3l4arC5X8S5j1UONQ5TnytOzYr1sfVCokA2AxaCEzTbTw?=
 =?us-ascii?Q?VKCUAaQIvTpLJaBMLgQ/ODfmFZAW/jRm448Ly0XP4C0+vFaeBeemEq2FK/oi?=
 =?us-ascii?Q?Ky3CIXpNcS5/POUn9OrNXNTsUsplleqzcM9UK/tRXUmPpfgEDwOoVbbfOgqH?=
 =?us-ascii?Q?c7x34894S8VYwVxmGKNiSsQ4rmZkE76xr/eLNs3bxKWwWUXIsKNYLFCvmZOA?=
 =?us-ascii?Q?OK14YSkwem7yvMz2z7Sbc8XY351GQ+8/DbavCECwh5cN49IbKeYG0sccFKSP?=
 =?us-ascii?Q?5iAj9LKXdHLU1CCenEqqlAv8DdltML7QF0cEN5vlWDttMPBiog1lhcZutmTi?=
 =?us-ascii?Q?a6dwiyBXybig2xlMdUGPicrfP1Th8xuaq3+k2MMeGu4WzIUQaazYGO0ywVEL?=
 =?us-ascii?Q?PUESGlV3C9QL7VvHbytfin4Ob/AN9GZrSQpByMTsHP7lwXJBs2OvUq1D9OoL?=
 =?us-ascii?Q?/YK/btRDhvC1nSNNzzP33+AawY/AQIh1BBiNEoLEVTtPgg65FKXHp9nWB4wP?=
 =?us-ascii?Q?MTQG+NJakDBxX4irTcArWUQQ7t6NyYRbo1+A1UyYdUA7Lhwt/DImhG9Q+iib?=
 =?us-ascii?Q?WpXx68pYlUfxNpIM57CTkqM6ti4wPK2qRZ14/u5UVg6gPHcqMx0eVqeBkKut?=
 =?us-ascii?Q?8CMfCuci8YCMA8PgzvW088/CPS+4moSZyVVAyTYF7N2Jk2xB7+Wg8tIJgqa7?=
 =?us-ascii?Q?HYW3EmCIqkI2ajNbnkE0NKKafsKLtzUATfjAyX7XKXSIlCNbKAkprjQZsqhS?=
 =?us-ascii?Q?0sNa/uxZo0jE31aqm6fcTa24VoKDU52RFYyQERlxtDbiuXoIdmS/3c/hNLta?=
 =?us-ascii?Q?7/r4d/tV2a1KLkw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FzBWRvVYdhcq2mQ7NnHFAZtml2lY0d+pIPQc9gfE7iH3NZe0ylb/d4BLNZc2?=
 =?us-ascii?Q?SO3nKmZX/MstWJSE5xExZeiL6/5aJ1NNiAm0xt3OEUmGDiAvpgsxG3xmFcaO?=
 =?us-ascii?Q?QqOQ0APOWTfNr6Gv7ATEultY14d6QQakLJmvG+kU90Zxo/ZwvwtGGgfTdJd1?=
 =?us-ascii?Q?QxRaOdkRGT18UB1LxIPjffVGgp6jWbqYjOr64gX0R3Hg3V18ENsAJykQY+5X?=
 =?us-ascii?Q?d85uvPvcb4JRpdi5TC0YbkAAhPPWMFIunLDdqdAVUHUkIf3g30NfeDGI0doE?=
 =?us-ascii?Q?XdOk6PTq5Mjhd86ZXH2nokWpJCMX0M7BAUIfGQfinkF/u/Eai+ZDupKfN+hu?=
 =?us-ascii?Q?xd89aOrA4COAdqNGj0PQuc75cx/yfo4M31HLOvGb8oaKktSd4gJmRiOzGJbN?=
 =?us-ascii?Q?YuJS96XODRpKAZWg7fBx7s3pyyIe1pBMMzR5SlqcEtyS4Kxss07xUK3WTxNp?=
 =?us-ascii?Q?KFRh23prGvgckwzYiFvarbNLnEY1lgyS2wDAjfNU5QR48GAC1q1Dd/Oqk8to?=
 =?us-ascii?Q?ElhpT/+aLvKXJ4tbUBYnjnOuKlfUtV76XPThXuLkhdhLsEgUf5kLabqu1fdD?=
 =?us-ascii?Q?SKIlvtD6grhkJZfm+fgZLrC+kjG8JTr2yjl6k3lktAgv+ebNAIPQ14HiAKyU?=
 =?us-ascii?Q?A40zMGJxd+F+kwVoSQi44a/1CGpNYPYFhDKXBVhQ7Zqj1F17qnJZkrwpAOxQ?=
 =?us-ascii?Q?jrBldB8kM640xftFqdE6hBvXLFdh/4d9/4tQn8YFoc2k2yJNefz70dF9VP7o?=
 =?us-ascii?Q?gDoGiL2UyPsU/TJO6wiQlSdeLfJw9lHAgWLnZ8K8jdJ7TuxauATmdG243ijl?=
 =?us-ascii?Q?h8UqkIQKEGVmfJKPg7drxVrBpvqG1B1koXvXOhfWGxdqHxLcLN18tlqKd3iU?=
 =?us-ascii?Q?84pOAQ8KnXpgcCyORv5RNcSxQy/P3EIgPk0s7UOXpN9sKzp08OAC034ot7op?=
 =?us-ascii?Q?W+/Ir2gXLSHtk0CzP4aGvyabEzknJKBtbiG0VbcvcW91VdhEYEcBLfUME5Z+?=
 =?us-ascii?Q?cPI+kVPL2yb23SyToLT2KNjcauTBh8QAxx7lpUM/JTAmUQvTn4hhh98x6lVj?=
 =?us-ascii?Q?1FT1RvcQLJvOo+yro4C23DIQzTc66ae6u4x/uW7ay0CDcTSEF+JL1zCpnKz9?=
 =?us-ascii?Q?WowqSneUJyzja4wGr51zkBmIXLuddDY5ywil5ooMyOWofEiCbDLXeLDrVqDK?=
 =?us-ascii?Q?4MO/KyrlxI6Dk6ABPFYNNQks6ldTWVstKtI43byLNlzpzBfu7SnBLHgIAOVA?=
 =?us-ascii?Q?3+pK/qyfCbvWI5zuptX0a3AYkCNMdzIFa+Lw7lZN3F2grb4C+T1u8KoE+vQd?=
 =?us-ascii?Q?1UllcEOXnBV3TjRvMmfRTxVgLUdqLLVltw0sCLvt7xqj+vup849Cj4qnCiZc?=
 =?us-ascii?Q?7+PE2K8rj3Vel9TIhWw7BwJl4fz22PdX21d/ki50VCQ4ocDugAy7f5rcKyOG?=
 =?us-ascii?Q?d2DMulH65o8bu6FUWomDnff3IzWGFnuCmKrmPLGga/I2Qpx2Y0YEYCoziDk+?=
 =?us-ascii?Q?mEEgqaFuEMMEp+hIfiWYfuN/DZxIsf3cnWTNHI3kecoflTPC9U/e+ngJ1mK7?=
 =?us-ascii?Q?wvIrE+mTFnK+mbarx4vPP3gnuBXct3uv8bFdwZXC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fe1cc2-9445-4334-9eef-08ddd95bcb2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 04:50:43.0155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J9dXZfYgcckuLrcZKm8Jz/zMlYz4rZ8XUfYo+QeiLqNKZWDf8CiPjjTUDKUm+EYsFbnILp37m+yRUSjQrFxzgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6352
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

> Subject: [PATCH i-g-t v5 1/3] tools/intel_hdcp: Support for enabling and
> disabling HDCP
>=20
> Introduce support for enabling and disabling HDCP on specific connectors
> using command line options.
>=20
> V2: Refactor logic, simplified frame buffer handling, remove update_displ=
ay
> and integrate its logic to igt_output_set_hdcp().

Quite a lot of issue with this right now
To begin with this just sets HDCP either enables or disables it which is so=
mething the igt test already does
the point of the tool would be when it plays HDCP content continuously and =
the then HDCP Status can be enabled
and disabled at will. So this patch will require a big rework

>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 129 ++++++++++++++++++++++++++++++++++++++++---
> --
>  1 file changed, 115 insertions(+), 14 deletions(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> 8ec698828..b9e91276f 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -9,6 +9,15 @@
>  #include "igt.h"
>=20
>  #define MAX_HDCP_BUF_LEN	5000
> +#define MAX_CONNECTORS		10
> +
> +#define CP_UNDESIRED		0
> +#define CP_DESIRED		1
> +#define CP_ENABLED		2
> +
> +/* Max time per authentication allowed =3D 6Sec */
> +#define KERNEL_AUTH_TIME_ALLOWED_MSEC		(6 * 1000)
> +#define KERNEL_DISABLE_TIME_ALLOWED_MSEC	(1 * 1000)
>=20
>  typedef struct data {
>  	int fd;
> @@ -17,6 +26,79 @@ typedef struct data {
>  	int height, width;
>  } data_t;
>=20
> +static void igt_output_set_hdcp(data_t *data, igt_output_t *output,
> +bool enable) {
> +	uint64_t prop_value;
> +	igt_display_t *display =3D &data->display;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +
> +	mode =3D igt_output_get_mode(output);
> +	data->height =3D mode->vdisplay;
> +	data->width =3D mode->hdisplay;
> +
> +	igt_output_set_pipe(output, PIPE_A);

Setting this like this is wrong
Lets take the scenario of when you have a eDP and DP connected you take awa=
y the
PIPE from eDP in that case you need to add a logic to find the available pi=
pe connector config
. This needs to on later stages be moved on to be customizable that is let =
the tester choose the
PIPE and connector.
Won't go into the MST Scenarios right now.

> +	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_create_color_fb(data->fd, data->width, data->height,
> +			    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
> +			    1.f, 0.f, 0.f, &data->red);
> +
> +	igt_plane_set_fb(primary, &data->red);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_output_set_prop_value(output,
> IGT_CONNECTOR_CONTENT_PROTECTION,
> +				  enable ? CP_DESIRED : CP_UNDESIRED);
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	if (enable) {
> +		usleep(KERNEL_AUTH_TIME_ALLOWED_MSEC);
> +		prop_value =3D igt_output_get_prop(output,
> +IGT_CONNECTOR_CONTENT_PROTECTION);
> +
> +		if (prop_value =3D=3D CP_ENABLED) {
> +			fprintf(stderr, "HDCP enabled on output %s\n",
> output->name);
> +			/* Switch to green to indicate success */
> +			igt_create_color_fb(data->fd, data->width, data-
> >height,
> +					    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
> +					    0.f, 1.f, 0.f, &data->green);
> +			igt_plane_set_fb(primary, &data->green);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +			igt_remove_fb(data->fd, &data->green);
> +		} else {
> +			fprintf(stderr, "Failed to enable HDCP on connector
> %s\n", output->name);
> +		}
> +	} else {
> +		usleep(KERNEL_DISABLE_TIME_ALLOWED_MSEC);
> +		prop_value =3D igt_output_get_prop(output,
> +IGT_CONNECTOR_CONTENT_PROTECTION);
> +
> +		if (prop_value =3D=3D CP_UNDESIRED)
> +			fprintf(stderr, "HDCP disabled on connector %s\n",
> output->name);
> +		else
> +			fprintf(stderr, "Failed to disable HDCP on connector
> %s\n", output->name);
> +	}
> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->fd, &data->red);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, COMMIT_ATOMIC); }
> +
> +static void set_hdcp(data_t *data, int connector_id, bool enable) {
> +	igt_output_t *output;
> +	drmModeConnector connector;
> +
> +	connector.connector_id =3D connector_id;
> +	output =3D igt_output_from_connector(&data->display, &connector);
> +	if (!output) {
> +		fprintf(stderr, "Failed to get output for connector %d\n",
> connector_id);
> +		return;
> +	}
> +
> +	igt_output_set_hdcp(data, output, enable); }
> +

All this should be in a loop where we set HDCP then change framebuffer base=
d on if it is enabled or not
After that we should just check the connection status and keep changing the=
 frame buffer color based on
The CP Property status.
Next this you need to introduce is a thread that listens for key presses wh=
ere we can do the following
'1' to enable HDCP1.4
'2' to enable HDCP2.2 Type 0
'3' to enable HDCP 2.2 Type1
'4' to disable HDCP
Also let the Display start with HDCP disabled and let user enable what he w=
ants
The above options can be written on the display screen itself using cairo.

Regards,
Suraj Kandpal


>  static const char *get_hdcp_version(int fd, char *connector_name)  {
>  	char buf[MAX_HDCP_BUF_LEN];
> @@ -57,24 +139,24 @@ static void get_hdcp_info(data_t *data)
>  	fprintf(stderr, "Connectors:\n");
>  	fprintf(stderr, "id\tencoder\tstatus\t\ttype\tHDCP\n");
>  	for (int i =3D 0; i < res->count_connectors; i++) {
> -		drmModeConnector *c;
> +		drmModeConnector *connector;
>=20
> -		c =3D drmModeGetConnectorCurrent(data->fd, res-
> >connectors[i]);
> +		connector =3D drmModeGetConnectorCurrent(data->fd, res-
> >connectors[i]);
>=20
> -		if (!c)
> +		if (!connector)
>  			continue;
>=20
>  		asprintf(&output_name, "%s-%d",
> -			 kmstest_connector_type_str(c->connector_type),
> -			 c->connector_type_id);
> +			 kmstest_connector_type_str(connector-
> >connector_type),
> +			 connector->connector_type_id);
>=20
>  		fprintf(stderr, "%d\t%d\t%s\t%s\t%s\n",
> -			c->connector_id, c->encoder_id,
> -			kmstest_connector_status_str(c->connection),
> -			kmstest_connector_type_str(c->connector_type),
> +			connector->connector_id, connector->encoder_id,
> +			kmstest_connector_status_str(connector-
> >connection),
> +			kmstest_connector_type_str(connector-
> >connector_type),
>  			get_hdcp_version(data->fd, output_name));
>=20
> -		drmModeFreeConnector(c);
> +		drmModeFreeConnector(connector);
>  	}
>=20
>  	drmModeFreeResources(res);
> @@ -85,7 +167,8 @@ static void print_usage(void)
>  	fprintf(stderr, "Usage: intel_hdcp [OPTIONS]\n");
>  	fprintf(stderr, "Options:\n");
>  	fprintf(stderr, "-i,	--info		Get HDCP Information\n");
> -	fprintf(stderr, "-h,	--help		Display this help
> message\n");
> +	fprintf(stderr, "-e,	--enable	Enable HDCP on the specified
> connector id\n");
> +	fprintf(stderr, "-d,	--disable	Disable HDCP on the
> specified connector id\n");
>  }
>=20
>  static void test_init(data_t *data)
> @@ -103,11 +186,13 @@ int main(int argc, char **argv)  {
>  	data_t data;
>  	int option;
> -	static const char optstr[] =3D "hi";
> +	static const char optstr[] =3D "hied:";
>  	struct option long_opts[] =3D {
> -		{"help",	no_argument,	NULL, 'h'},
> -		{"info",	no_argument,	NULL, 'i'},
> -		{NULL,		0,		NULL,  0 }
> +		{"help",	no_argument,		NULL,	'h'},
> +		{"info",	no_argument,		NULL,	'i'},
> +		{"enable",	required_argument,	NULL,	'e'},
> +		{"disable",	required_argument,	NULL,	'd'},
> +		{NULL,		0,			NULL,	 0 }
>  	};
>=20
>  	test_init(&data);
> @@ -117,6 +202,22 @@ int main(int argc, char **argv)
>  		case 'i':
>  			get_hdcp_info(&data);
>  			break;
> +		case 'e':
> +			if (!optarg) {
> +				fprintf(stderr, "Missing connector ID for
> enable\n");
> +				print_usage();
> +				exit(EXIT_FAILURE);
> +			}
> +			set_hdcp(&data, atoi(optarg), true);
> +			break;
> +		case 'd':
> +			if (!optarg) {
> +				fprintf(stderr, "Missing connector ID for
> enable\n");
> +				print_usage();
> +				exit(EXIT_FAILURE);
> +			}
> +			set_hdcp(&data, atoi(optarg), false);
> +			break;
>  		case 'h':
>  		default:
>  			print_usage();
> --
> 2.34.1

