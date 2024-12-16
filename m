Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFF3E7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 08:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCF710E53D;
	Mon, 16 Dec 2024 08:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzz3lUe2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B7610E53D
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 08:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734338984; x=1765874984;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JzQFEcafgM38sP4Wc3L5xR5EqQqSwSJOwL03BOSwmNU=;
 b=mzz3lUe2fQAZfsL9kVb7duVSn8/ZWmHz8wQmnNgrEiBxK8lWeO35hOyd
 HaKvi47OH0PbXw+wIRNiCrUxSqs3p248xPonazhbqK9YlMlP7ZmfYIBeE
 zSsuA8PdrxeH9W8af+XZ0uIwXZSVsVfFgkwETeECFDrVaUpK5iA63ymtI
 1CCHgRJ/2VW3s/SmZiZNQog1+4bKdGuL9sjK4Cb1mympmg5sK29TtKcQj
 PlU+npZ2+bmzbcF7F1LfRKaOQlzVESVlLHcApEV4VWmuxYUqzX8JemnPS
 WtuNL6xsvu3TRHCoBHHPkx41hir2vea+qTzx5gao06Om1+9Ba80N+0QzG Q==;
X-CSE-ConnectionGUID: ZM7jIarBSnCYOANkHOqfKA==
X-CSE-MsgGUID: 3wBbYRuUSpuwFI+6612QeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="45405799"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="45405799"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 00:49:43 -0800
X-CSE-ConnectionGUID: s+HHzSyNQK+spkOAhNwi2w==
X-CSE-MsgGUID: 5n3dNVOAS1WFquAQ1yDbHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102229247"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 00:49:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 00:49:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 00:49:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 00:49:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4pujIqC8cMOgZzp1vBakBNCsKREXjobuIQPPVY9UffkNtfcg4c8iG/02SR/Wgpv335L7tatQfnPW8vHHcNUhWlsTmsKr6TytNs6xeRIMyJt014k3D6Fi4b9Iddc2Hk6qp5tLi79kDyQtwUkP32KSCk+N//yZeNr38RC/9jE/ysEgg0nQKxvOE/G6HeeH4UwYupdoloisVcyDMMUzSjC6zj/qDMoHhmmjFudyD6LXVoQzMO0te4DZ3prEGMN39duYpsfPvOWfVc0gI/VjOHCgTma4LTicZNh7eX1T4SfUY4FbFFNFePDos5ndA0bDjAF0ysHgCKUUMB6+sYlt81lwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GzAMeH0/Cv91jyyj9jSNmOFcROk/xE+JfF9f2Gcva8=;
 b=ApvVTN7vCrqxFfagO/kEKhMH3HoMIGr35eNrf1D7/LFSu8ncTxbio7MrZ9lHjf6ursPB6vggHOYve0Syc392V/AOAXh6CQ4qELbHsUW0OcwkqM/OGH0ETPa5AWJUI1AqNfl18XIpvgAgdIEcfA3zup0mws1Qn773SpdK1w26BU8r/9JHsIKRQ+pAUWr085yty/te9SSCq2z7U2XA/nwMGN4WWpd1FwbQKWu14pA54hfSm0do/bXEHvRd1HzryMqyB/gpbd0Xsg1tHQ1IMYCfWfuqu3MW3X8Lvw3EyKpWlVUmeSLxcOaSYILe2UX1ELj3jh0ENKNVndKYiRhTFM+ohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 08:49:27 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 08:49:26 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_cdclk: Refactor mode setting and CD
 clock verification
Thread-Topic: [PATCH i-g-t] tests/intel/kms_cdclk: Refactor mode setting and
 CD clock verification
Thread-Index: AQHbTSQ9dO7KZRayQEql/5/evgQOKbLocYJA
Date: Mon, 16 Dec 2024 08:49:26 +0000
Message-ID: <PH7PR11MB60531086EB50D0CC1D2FD17FE73B2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241213060225.2144633-1-swati2.sharma@intel.com>
In-Reply-To: <20241213060225.2144633-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CO1PR11MB4819:EE_
x-ms-office365-filtering-correlation-id: f154518d-7831-4963-96dd-08dd1dae8c0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2dCsULs354QzQw/LeRLh9vcwR0Vytm1UVVtFfCoGpOPFTqf7QnaEDwBJ7bbq?=
 =?us-ascii?Q?AUVh5xDM9bOrwhox5soIq3PgRgHUZabtM+fXRdLGuWFoU1Dow6mYzIJwcGzo?=
 =?us-ascii?Q?pSLrdQ3W/v1qE/fdhtRRVyXTdvb2/HUHoWKL1tdXwxpArEAyblsOMOtaRMo4?=
 =?us-ascii?Q?fivhQJYrOQ29UeH181w/jfJeHVmp1QGPUtA3oEIohbHPVdlyHH5aa7HWB6MC?=
 =?us-ascii?Q?kfLH9Y0mnQnLXOoRkCnnaFOELzT4PdMQpnmZ9zoZgkACvrvg90DzDU7niK65?=
 =?us-ascii?Q?MzmV3qHIYzcQYDo+ZWI9VV71cy/4hb+fSw8hBxfv1v4ofcdb/b6DSWlkvnB1?=
 =?us-ascii?Q?UPEG5b76YBmxbH23M+d+bpJJaY9WjRi9Hm/iclbs7TDfd8JupGSPG9XXYpp0?=
 =?us-ascii?Q?Zp34v+ePB9STMeC4Av6wqYgFwnYuDDAJkw6M4SZ7LfZzWq7re1wehYriiE/K?=
 =?us-ascii?Q?5Gnf1L3l1tAE2dZsxqqikhdc7SDnH0whFazpRvHQ5UuD9jCLKf6F435rdEqH?=
 =?us-ascii?Q?FiFd3mcH5Gs3l3w4UdbPifGSe0UEGAT8l5oarLbWBSnpl+900YeyOnOQnaHY?=
 =?us-ascii?Q?Wj/ZKrlAtH2vUdqQtRq3elXt7NG80/t0PmTR9raoJUWokK5tXrMZYp6No2mx?=
 =?us-ascii?Q?wQHLwSsev3Xx185YW6x2jLuvpEujIe4J6JaMtqM9DQ4e/JH10gjxGYfWY0eA?=
 =?us-ascii?Q?rUyTAA4hwCogiaUOYrLYAtD/C+9pxbHQMWZEeFzlKm1E8/4a1Rqv0XGTv6LR?=
 =?us-ascii?Q?QiFMEYKW1D1srcfbxT6eMAxSur9uJvN8tW+AqQysMhKscum94ZkyN+kzYCZf?=
 =?us-ascii?Q?ukOBcoCz1HpXPT2DKpyXffvUXz7gdqe6R4FY/xl4ulD5oMW9HAf5RDYQun/M?=
 =?us-ascii?Q?oNrITfJ/jZ9vQHCpYBFUbzvWOM9RqivTHlno/biSzEqxEZrliMe0b6YRfNsf?=
 =?us-ascii?Q?gjtsNAEfPU8kRjGIfZhx3suk979vlm7CqJB2aso4a6KMAKyau74ugu0l71qy?=
 =?us-ascii?Q?jGq4Y22MM50lJzMOSr1i7gF7FWgVNUN78lMy2ozwDu5Xxfa9tlBJBRFN5hQJ?=
 =?us-ascii?Q?H+FbZ5vxXtgZxQExcIBhYfVHNn+KNKSr5DKnHtJqWU0zBkFs1mA3okQgXBI6?=
 =?us-ascii?Q?kFgt+9nNRcjWXFgMaHDQq0xqqGaADdT4uTcpUHVZKZ+2LbRypPRUTiVSx9/T?=
 =?us-ascii?Q?XbVuaB4LBlFmoJy2X87+csOuJ2fFmuq9NH+NsMXpNBSsb2pummK6N6yiozEu?=
 =?us-ascii?Q?Ii9uhiA48pDTE2hib4/4KGUe9c0xGXyyiFO5xvu7Vrm7X+Jf4RNs68ipRGv8?=
 =?us-ascii?Q?Jtm4C+M/E9MO7a6QoM4cEMAAFPa/nvjXTwIPbnZdpawA9h3M/jykV/x6n8fv?=
 =?us-ascii?Q?gyFM2fj0gwcGOSHntAYqeMljmegT2kM3UvqEFciHk+Q83OoL9o7wSl4Sw/y4?=
 =?us-ascii?Q?Ubo0bKTMq8vWfnkE+D7X0/itiLjffKtq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FyZYd72jE84m1wHOGgZKuFwD73MWVOuHYTx3D6tvNXMFm3CdqKOk49UqH3cU?=
 =?us-ascii?Q?XqA1MzeSOqoL3y0LvNC5VzPvbSjJ+A9ZpxPd+N5a7GXVeHYCXCmQN8qSGh9a?=
 =?us-ascii?Q?1NZilPspdueeo1utg0m4HL6sf2/EGzGxNoS3Zklc2WUI4okevvP0aPM7IYyb?=
 =?us-ascii?Q?jABxr55TbVh+GYoMwWBxnkkZfV9+d9sE0paB2u25SkM5wVn3YGrMgVEGq4jA?=
 =?us-ascii?Q?Q3+dQQ5eONr7XbiaWvr8mqfkAqOUXSUJxLMnrVqjIgqYDFj/4BBkWFBRdm8l?=
 =?us-ascii?Q?R5fLpi4wW1n71v2g8Z0A93fjybS5l10h4/euJo6KudE2IcCREJn294RZ3leO?=
 =?us-ascii?Q?OZPqMFiEqFGD46GUjjmvC3okgyK6gvVGAavpd8kcLHGcSmeiN16EI0ElS54h?=
 =?us-ascii?Q?Mz5wTrZhvO8vJPqnd3rArW/6CwEqb49FQ6AbnvKHWn/erqgp7tSXo1GU3/HH?=
 =?us-ascii?Q?9w7GfkqlcEvu8lArkqehvhXc7kJykyn87MIG593G1XaOuKqpQdTkIbz9K53T?=
 =?us-ascii?Q?4Q60mMDWA6RcsNofnCEwnPyeKLSl+WSnMvpdowR2CCZr7KAPftNZeUxINDwj?=
 =?us-ascii?Q?WeorN/S8d92dwyfLWZSWjoPf2OnhM4lW0ZEN8e3iwzcdDOHTbW04JRdw7HLX?=
 =?us-ascii?Q?2VY86OkEzLAIOM8Ebqek83hIQ7pcODH0Aveyk3WqtIX1PTiTFm+TQ9nmB0eD?=
 =?us-ascii?Q?itgmW+37BS0lHRU/rUv/itRP+jq5VcZN/tuKvNW37biWAXoFAXtbzPMkS7wM?=
 =?us-ascii?Q?ISjTpXuJtX5bDxDkqeYp50tuK6LNpRDeRTc36Y+FcgV/j/G7TQ2c4FNY7xl1?=
 =?us-ascii?Q?F/4Z1Xk+t7YHnOENXK2sli1ISidIUMerLYiUZB9BMVnNjVHT6utCvP5LCxYe?=
 =?us-ascii?Q?0LXevuZrQKJWYKbGJXuMH7khcLW7GkJLX+H7iDTRdY2f20auy8/63hS66+qj?=
 =?us-ascii?Q?pXc+Da9+t4IvEUTuZPFrXaJaW+Z99pgOBHRPcjt/vLgecrEi8xuwf9bnPFvf?=
 =?us-ascii?Q?+iWRrcRS4NrBZTKHv6iSqUPRhgd6kiBRW0FTUHwHONT7E+e1dB3f+hWGKEi6?=
 =?us-ascii?Q?PYDObZS9BKjhBbAtiHaqYBFPaZC30JuGygK+dv9RvF/iUjNqlOPbpnMQ9yoe?=
 =?us-ascii?Q?juYkzfxKAoVi/pGuIG/qwUVP/R9W5QZ/q46THg6+bdbc+zgNtnjIUDtQZWPF?=
 =?us-ascii?Q?mKwOX2aOh+ru9twTlJ7+3UC5etuuqj/pyLH20KzHIeAP+5fRRmm+daRIZAys?=
 =?us-ascii?Q?L5vwZid9b+DtkQNVzYChF7E3eM5uYOKC/SkxobF7EUEvgbA5Ydk/dwCG+Yc/?=
 =?us-ascii?Q?vdRq0PJNdbvLK9gv8EDWQvNCYVOtyNtoeY6od2SlPn151+Fn0MLrbVzRF1yh?=
 =?us-ascii?Q?f+2ZNTkHycPk9Sys9pVtfUZd3ub2TWsU66IIpPbZNdwLE4Gk374c1lMc0Bjt?=
 =?us-ascii?Q?feUymlSggO2GJn1VktYMmaAx5b4b3vix9OAWm/JPmqogUs5I3ZEPXD9fFprO?=
 =?us-ascii?Q?dt84k+WEm9vVz6Y/1ZyyxyzGEo30numLdLF0//u27sGBJE/DQm/w+y5jLule?=
 =?us-ascii?Q?ewb6Re/5OPhyo45r/52iDwdkmkDb+UL9PufLbfYC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f154518d-7831-4963-96dd-08dd1dae8c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 08:49:26.7381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ivy2jIKyg6xw+0pm09oJiR9fRzkVRtnAp48bqMCJkEBToC5QAWYB0kUo01oF0Rqqpfr95HcagdUVhRlplTpz2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
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

Hi Swati,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Friday, December 13, 2024 11:32 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_cdclk: Refactor mode setting and C=
D clock
> verification
>=20
> Add conditions to filter valid outputs. Encapsulate the mode-setting func=
tionality
> in the set_mode function to reduce redundancy. Remove redundant framebuff=
er
> and size setting operations for the plane. Simplify the CD clock frequenc=
y checks
> to ensure it increases after the mode transition. Clean up unnecessary pl=
ane
> operations and redundant framebuffer handling. Enhance the readability an=
d
> modularity of the mode transition logic to handle multiple outputs more
> effectively.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_cdclk.c | 112 +++++++++++++++++++---------------------
>  1 file changed, 54 insertions(+), 58 deletions(-)
>=20
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c index
> 382b3e9d1..93276f45e 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -54,6 +54,7 @@ IGT_TEST_DESCRIPTION("Test cdclk features : crawling an=
d
> squashing");
>  #define VDISPLAY_4K	2160
>  #define VREFRESH	60
>  #define MAX_CDCLK_4K	307200
> +#define MIN_DISPLAYS	2
>=20
>  /* Test flags */
>  enum {
> @@ -269,90 +270,86 @@ static void test_mode_transition(data_t *data, enum
> pipe pipe, igt_output_t *out
>  	igt_remove_fb(display->drm_fd, &fb);
>  }
>=20
> +
Please avoid this blank line

> +static void set_mode(data_t *data, drmModeModeInfo *mode, int count,
> +		     struct igt_fb fb, igt_output_t **valid_outputs) {
> +	igt_display_t *display =3D &data->display;
> +	igt_pipe_t *pipe;
> +	igt_plane_t *plane;
> +
> +	for (int k =3D 0; k < count; k++) {
> +		pipe =3D &display->pipes[k];
> +		plane =3D igt_pipe_get_plane_type(pipe,
> DRM_PLANE_TYPE_PRIMARY);
> +
> +		igt_output_override_mode(valid_outputs[k], &mode[k]);
> +
> +		igt_plane_set_fb(plane, &fb);
> +		igt_fb_set_size(&fb, plane, mode[k].hdisplay, mode[k].vdisplay);
> +		igt_plane_set_size(plane, mode[k].hdisplay, mode[k].vdisplay);
> +	}
> +}
> +
>  static void test_mode_transition_on_all_outputs(data_t *data)  {
>  	igt_display_t *display =3D &data->display;
>  	int debugfs_fd =3D data->debugfs_fd;
> -	drmModeModeInfo *mode, *mode_hi, *mode_lo;
> +	drmModeModeInfo *mode, mode_hi[IGT_MAX_PIPES] =3D {0},
> mode_lo[IGT_MAX_PIPES] =3D {0};
> +	igt_output_t *valid_outputs[IGT_MAX_PIPES] =3D {NULL};
>  	igt_output_t *output;
> -	int valid_outputs =3D 0;
> +	int count =3D 0;
>  	int cdclk_ref, cdclk_new;
>  	uint16_t width =3D 0, height =3D 0;
>  	struct igt_fb fb;
> -	igt_pipe_t *pipe;
> -	igt_plane_t *plane;
> -	int i =3D 0, j =3D 0;
>=20
>  	do_cleanup_display(display);
>  	igt_display_reset(display);
>=20
> -	for_each_connected_output(&data->display, output)
> -		valid_outputs++;
> -
> -	i =3D 0;
>  	for_each_connected_output(display, output) {
> -		mode =3D igt_output_get_mode(output);
> -		igt_assert(mode);
> +		const drmModeModeInfo *highres_mode;
> +		const drmModeModeInfo *lowres_mode;
>=20
> -		width =3D max(width, mode->hdisplay);
> -		height =3D max(height, mode->vdisplay);
> +		highres_mode =3D get_highres_mode(output);
> +		igt_require(highres_mode !=3D NULL);
> +		mode_hi[count] =3D *highres_mode;
>=20
> -		mode_hi =3D get_highres_mode(output);
> -		igt_require(mode_hi !=3D NULL);
> +		lowres_mode =3D get_lowres_mode(output);
> +		mode_lo[count] =3D *lowres_mode;
>=20
> -		igt_output_set_pipe(output, i);
> -		igt_output_override_mode(output, mode_hi);
> -		i++;
> -	}
> -	igt_require(intel_pipe_output_combo_valid(display));
> -	igt_display_reset(display);
> +		if (mode_hi[count].hdisplay =3D=3D mode_lo[count].hdisplay &&
> +		    mode_hi[count].vdisplay =3D=3D mode_lo[count].vdisplay) {
> +			igt_debug("Highest and lowest mode resolutions are
> same; no transition\n");
> +			continue;
> +		}
>=20
> -	igt_create_pattern_fb(data->drm_fd, width, height,
> DRM_FORMAT_XRGB8888,
> -			      DRM_FORMAT_MOD_LINEAR, &fb);
> -	i =3D 0;
> -	for_each_connected_output(display, output) {
> -		pipe =3D &display->pipes[i];
> -		plane =3D igt_pipe_get_plane_type(pipe,
> DRM_PLANE_TYPE_PRIMARY);
> +		valid_outputs[count++] =3D output;
> +	}
>=20
> -		mode =3D NULL;
> +	igt_skip_on_f(count < MIN_DISPLAYS,
> +		      "Number of valid outputs (%d) must be greater than or equal
> to the "
Please add backslash (\) at the end of this line to ensure that the string =
is=20
concatenated correctly.

> +		      "minimum required displays (%d)\n", count, MIN_DISPLAYS);
>=20
> -		igt_output_set_pipe(output, i);
> -		mode =3D igt_output_get_mode(output);
> +	for (int i =3D 0; i < count; i++) {
> +		mode =3D igt_output_get_mode(valid_outputs[i]);
>  		igt_assert(mode);
>=20
> -		mode_lo =3D get_lowres_mode(output);
> +		width =3D max(width, mode->hdisplay);
> +		height =3D max(height, mode->vdisplay);
>=20
> -		igt_output_override_mode(output, mode_lo);
> -		igt_plane_set_fb(plane, &fb);
> -		igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo-
> >vdisplay);
> -		igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo-
> >vdisplay);
> -		i++;
> +		igt_output_set_pipe(valid_outputs[i], i);
> +		igt_output_override_mode(valid_outputs[i], &mode_hi[i]);
>  	}
>=20
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> -	cdclk_ref =3D get_current_cdclk_freq(debugfs_fd);
> -
> -	j =3D 0;
> -	for_each_connected_output(display, output) {
> -		pipe =3D &display->pipes[j];
> -		plane =3D igt_pipe_get_plane_type(pipe,
> DRM_PLANE_TYPE_PRIMARY);
> -
> -		mode =3D NULL;
> -
> -		igt_output_set_pipe(output, j);
> -		mode =3D igt_output_get_mode(output);
> -		igt_assert(mode);
> +	igt_require(intel_pipe_output_combo_valid(display));
>=20
> -		mode_hi =3D get_highres_mode(output);
> -		igt_require(mode_hi !=3D NULL);
> +	igt_create_pattern_fb(data->drm_fd, width, height,
> DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR, &fb);
>=20
> -		igt_output_override_mode(output, mode_hi);
> -		igt_plane_set_fb(plane, &fb);
> -		igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi-
> >vdisplay);
> -		igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi-
> >vdisplay);
> -		j++;
> -	}
> +	set_mode(data, mode_lo, count, fb, valid_outputs);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	cdclk_ref =3D get_current_cdclk_freq(debugfs_fd);
>=20
> +	set_mode(data, mode_hi, count, fb, valid_outputs);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  	cdclk_new =3D get_current_cdclk_freq(debugfs_fd);
>  	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new); @@ -
> 360,7 +357,6 @@ static void test_mode_transition_on_all_outputs(data_t *d=
ata)
>  	/* cdclk should bump */
>  	igt_assert_lt(cdclk_ref, cdclk_new);
>=20
> -	igt_plane_set_fb(plane, NULL);
With these changes fixed, code LGTM.

Regards,
Pranay Samala
>  	do_cleanup_display(display);
>  	igt_remove_fb(data->drm_fd, &fb);
>  }
> --
> 2.25.1

