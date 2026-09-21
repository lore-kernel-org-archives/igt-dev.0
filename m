Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26D4C982DE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 08:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AEE10E359;
	Mon, 21 Sep 2026 08:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9NZWS6k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D8D10E359
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789979970; x=1821515970;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3O/+xOI49WybhY2Fv3tW3aAUNw+M6DRlbHi5bDuESZM=;
 b=J9NZWS6kK/KH2PrrmQ74wGxUEIab9dSxx/b+unZgu4/vwcHG8ewIOl4g
 ljBWppOq3mGzNtq2y9loUdtUAi8CgrfV5FViOxCqc020vt3WGgsDc7prr
 SHgFx5Ek7PHVn7S0gdjZdHH1PVIejLXSrlBrD60jIil2hlR6Fo/K/CBqf
 lLTAtiUrWD7PsTDI05CSfxUjbkjmzse3/jBE2aI/nvVHecZQP1ZSUD263
 qZOfDMX+MTUqNSLT3uJD9VINeqYHzOt+GV/8k3v2W3y1vdaDJpolhqPA0
 wfFhauFiBDqYxdnJx2l9xdlXeXT0298pBJJr8m2EgUpyFzFfSFuzqY/PC g==;
X-CSE-ConnectionGUID: f67wfS4oRkOr5R4Q35RtzQ==
X-CSE-MsgGUID: vuXH3ImhQmKWz8fgC8QB/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90345636"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90345636"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 01:39:29 -0700
X-CSE-ConnectionGUID: FMw7mrRsTgS5nD9/DlI42g==
X-CSE-MsgGUID: nY0+/lb5RrSJy7eRb10tiw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 01:39:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 01:39:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 01:39:29 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 01:39:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRFIWidyN1SIsVbZgujdvI2CYpDMDeJRCtDhGFyIz9GZ6eZDsQdRqXiiNfL821nSxdOkEW6SVGg8wX8JQohrqxJvjIpE75fbfrTUlRXByNl11/wwCFxX7qvBn9xH+fJITw3U+2G8IB6hj3xWp3rW7kV2WDGUYsSjcGyEZpnqv8+E1mOt9C1a6ZNmo7Sn3uNTdVao4yB/ezd0iZaEBo7uQzJ0ipQFC0xFR99qUHuwjeaUo9AGD0OoeI4bKyZTkcZkSM2QRVmoq8HbhQ2+gCcAFeXl0AoklB29fJ8WmfkuFhbnP9ICWgqu2WqjSL3L0S2vxqRyPCCswF3FHW4xy1kywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rhf0/GNbRS5hi/l9EmOoW0iu9y03L+TR5u7xmNQ5hI=;
 b=k48pZfksQ6TwfTcAWwy2p5rwrHwB4/q/RdOQkM/8i242ECuPsFXqfDQV3DSRgbzIGhUJrMAiuxAdQOWu28R3RBe8wZlKDS/6NWe5RZutWKUf/d2PgjBoLqWCfN5rokLaI/ttKp3V/18kv7hU3t8yJfY7lZMBFzH3d4DB9gU72ESWp59kHn/nw1TFcId2vuRuLUxMTALZAm8rS9+3BtBH1o8yNLgHQQIptOJuphMb8jVqdxyqInhF9lOqk14iUVVZ10PfUiJwksHG5D4MXtyt+a7IcO0r0Ngl+Ib3ZTfFrGPuSGNaqfBVOM9i3MKGzMZDwxXmcBz1hamihhP2LP8edw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by PH8PR11MB7989.namprd11.prod.outlook.com (2603:10b6:510:258::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 08:38:43 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 08:38:42 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 02/13] tests/intel/kms_dp_link_training: Use the
 UHBR helpers from lib
Thread-Topic: [PATCH i-g-t 02/13] tests/intel/kms_dp_link_training: Use the
 UHBR helpers from lib
Thread-Index: AQHdRZPLA3QPQDQFCkufnhTGM82GHLbYveBA
Date: Mon, 21 Sep 2026 08:38:42 +0000
Message-ID: <PH7PR11MB67960B5C027EF88B692666BAE5842@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
 <20260916044801.1279102-3-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-3-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|PH8PR11MB7989:EE_
x-ms-office365-filtering-correlation-id: d433d37d-104f-4281-a815-08df17bbbe4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|10067099003|3023799007;
x-microsoft-antispam-message-info: XOkybZZRUhSJ+F2c9JZffrFHBPBC/JIU6PfSLfkFlFNQnGKmrltXm9mMu91h0C+nYNI3b6RrRNeb4QUVvWudByrmSPLXYVKxAsLfeczccW3gDjYnPXteG7xNOHMyigod8xaJMsNBgWa35UJ7ez0zdpMuydlIGEdG1CeDpzYCdiRP+7DJvmfL5IdXuiyyaKJh+LRxiiXUdENMagma30F2aLpMGE753zw57BsgHrjl4dK4Jbdvp3KrpqEduEwQ+SsisfNpl4A2GlwAB1hbdSSdcuZ5cEnxGE06ELn35knH4RfMXKUJDHq+oozyjFSUgEX8kB4V8eqvW5ABZ36/xhtYt5FTIPrd7hHysWJSY12MJdmdRyG5qVwQ+ZmRcmsGlqfQtTtc6JR5cZB3wXJnRDIvV+o0Ru6mRf1/dYTTb7xZIWUxAXt6no0SvaecsDuRC/G4YW6xbsi1ZJiCoTYLk60xOXeHVDRrsJ2o/nwd+1BTFz7hFlh8nFj67hCAgmwK/M1dKCNZrSJ4Mmf8XwWXtzSPX8PkNl/BGASwIdZK3DvQzn4Dw1h+kz9EBT94Z/zlaDDI0ExsXEm1ZolQqOS7zUzWijOYaAjgJ41v5rz/PDeKKxFOzchD/J7o90kC1qAXNUFPThqTniNUcQ1SUZMVIsstRSYnvPtu4GS2fOgEbLmqWPRpo6R1Drm8GyANRYue90zXveZg5u0b6ew5+axqDaD47w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PtAvSzzKI9VxZI40TQSUw1/AGpjWL18c1wljNUXx5nRaK6jGszuoEUdSyE1+?=
 =?us-ascii?Q?kqVudQWZgrRupPxhErTgueUk6ActKP2yaidhfnYvvF0B5COucsgUvWDksMYY?=
 =?us-ascii?Q?h/5Opx6IwAueWBunrB6tajjnTzXk4gMuLrfAm8OBHy9riYWOHYI4H8Ehgv9J?=
 =?us-ascii?Q?FseTXMjbhEc96PCJyfr0vg+/lU3yTPIGVgAy8goFowzhEUyKiJM1tO7Pl4BI?=
 =?us-ascii?Q?ghDBlo+vhViTEuhX+c4FTGHzqh9Nz0FcouE3OMse4f+VNmPaOeHyaoZnEyaZ?=
 =?us-ascii?Q?ywMUUAo5oYBT/uqQbl/waIoHhUtXhWm2Ewh/fo0M8mMvg4GCuSV0YmAihyPI?=
 =?us-ascii?Q?6fmu4SpughjAjh+QQyItytg0QmDBau25BYuf86n6KE75WxCr11a7NZQBpCDS?=
 =?us-ascii?Q?2AuQv2ciqPZVDs4QtHTeuOq2aVzpLS1VYiXQlG9/rL+xN2zM5/nZrnElG3AJ?=
 =?us-ascii?Q?gL2hDVUdtRaq/yCotfQS5XbgMMHSuVo6pmE4Q/QEYC9sL1jh1GMDNYKO1q0h?=
 =?us-ascii?Q?Yj2hIVUWwc0adOm6Ds6Ys5DPTaDY1qL4j7GDx5HaZp2KwZg5Y9YvIqKShZ9W?=
 =?us-ascii?Q?BnFKFTmS0F3bJFr8ab5dR2loAa2gYjAqEVE/ZvE+Xw8OsHWpHheDjSDMKhU9?=
 =?us-ascii?Q?9B5AiMoKj2sY1rPOrohvFy933l2AjZ0ruYF73Ks5qVc4Dq7daiU2iD0/viqo?=
 =?us-ascii?Q?YM9i3/J+Htasyvy6otJcPSZFGNEnnJtgop2qAMRa9eqCU7bHCFMlYLMQeTMC?=
 =?us-ascii?Q?9aK31+X5RBfNiu7etIqjiqOGB+ErZt3xoK704s9JDLOr2XZUFvM211EU5y1a?=
 =?us-ascii?Q?MJ5KVUh61AFQWsVobEGNLJPdUeJFBaZ4k446gRBVOyzKQW4bze+7AN5534Eo?=
 =?us-ascii?Q?+nVkFWP46qpWZaRFqVNOmV+Laon0LNhhiGcfp8eaHTlPCOrNtq/Nq6Ko4HF5?=
 =?us-ascii?Q?aq2cQu/UlQNxoJH4cSImFxrq+zGaYVb37+xgKGvV92oNu6esQHoduKgvxAC2?=
 =?us-ascii?Q?AYE95Ljjis7EtoPAMPdGQcjrnsISImcDkesfnZ3/bJTZO54+urx5nC4kLBnJ?=
 =?us-ascii?Q?T65R2N5x0sAQzpCzJgQiGF3cYHJ+rcY/tiY9j+ml/T6qJPbucuFOrqho9x+K?=
 =?us-ascii?Q?9SZAONWR2KG6sW80/jM8DkLxbl6I8ywRgjskl9FIdgDFTGDUOW+aXaQJMSRF?=
 =?us-ascii?Q?6/Uao6fBtEvQi2tMT6do5HccGBeaMC3RhwHhnL15fAnDYPUXUtSAgdFKJfu9?=
 =?us-ascii?Q?EDLMAh3Kt/veE996rE2s5eC27MwGou3XuiBDh9lPHBkTj0go9vcUdL1X5YJ6?=
 =?us-ascii?Q?Z+v2fzw/HIZcbiFIGZJKsFtPMFJ1u9aRKiDdIpP6FuWZy59WpaMP4vb4en7e?=
 =?us-ascii?Q?zqHQfF9ktZnBfKpp6W2UqfWDB7WjPD1bnFpYE9pzceJP1QAT6irr0VpBGC1v?=
 =?us-ascii?Q?qsHrxSKSNkyYSSFTzZKgaa/IFCS7GB/jIo4b7CU+F0Y0lfrJhursj1nM8plu?=
 =?us-ascii?Q?1g3PaLkO1hj2ZNZ7tjRq/O2/RuEVzwfdYePN5giRhMg9tdm1e94xwfdXI8E/?=
 =?us-ascii?Q?O0LqmrXBSIvm5vbAU5nTEwS3CkFobwzdA1nyGPvN8Sf/aR4z7ajzfkOYGpdL?=
 =?us-ascii?Q?EcoNV6PVRDpF1ahjM0qm4ccXA8RUcUCcJ05NU2WtTj/TW8bLiRnUsbkJFZvz?=
 =?us-ascii?Q?Uir2ecNUxdGVuXBzdehI8JnWCgJFnLElagmTF+c2oujn6Oj6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ppKF47Nq7dixg5EnC5p3uTf9625MxyfK2Is+Yjw3HMZXpOo48pGB/nfCilMARnMdOpklDcpe6VIdob7AdqKYv3rh30pdlm+zZWVZ2/bsehKkKqXc3yK5I4MHUi0kA6iBZECEMTwnq2u0CfbM2gMDYen7I5oh+nxcC8SncPmMgwaW+Q/lgkAcbb46PLaEqJqF06q6SzSXiBQ92mFTEnhOC9y1+N7FtaYNLphSDHrXSurGEKKecA0kb4/wssp7THd19VkGMCbKRsz26FeljyNw1dadmbfTK0peLp4yB0NiiVyJbsidJB+1grM/msRp1k3lW+gVqaw2h+/o3g16xPnYuQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d433d37d-104f-4281-a815-08df17bbbe4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 08:38:42.8893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 78tyz9tTHTT4DJxELohwEXwjU9weNWfqtjmrt26e0akWfdAXHqzvvqNn3yogYbsELcSGffpD0wNZZ9+TP23YvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7989
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

Hi @Joshi, Kunal1,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: 16 September 2026 10:18
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 02/13] tests/intel/kms_dp_link_training: Use the UH=
BR
> helpers from lib
>=20
> The test defines its own UHBR_LINK_RATE and open codes the UHBR
> comparison, while lib/i915/i915_dp.h already has
> I915_DP_UHBR10_LINK_RATE and i915_dp_is_uhbr_rate() for exactly that.
>=20
> Drop the local define and use the lib helpers.
>=20
> There should be no functional changes here.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
This is a refactoring patch .LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index f67fdf59d..2d5241246 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -27,11 +27,6 @@
>  #include "intel/kms_joiner_helper.h"
>  #include "intel/kms_mst_helper.h"
>=20
> -/*
> - * DP Spec defines 10, 13.5, and 20 Gbps as UHBR.
> - * Anything below that is considered NON-UHBR.
> - */
> -#define UHBR_LINK_RATE	1000000
>  #define RETRAIN_COUNT	1
>=20
>  typedef struct {
> @@ -217,7 +212,7 @@ static bool run_link_rate_test(data_t *data, bool mst=
,
> bool uhbr)
>  	max_lane_count =3D i915_dp_get_max_lane_count(data->drm_fd, data-
> >output);
>=20
>  	/* Check sink supports uhbr or not */
> -	is_uhbr_output =3D (max_link_rate >=3D UHBR_LINK_RATE);
> +	is_uhbr_output =3D i915_dp_is_uhbr_rate(max_link_rate);
>  	if ((uhbr && !is_uhbr_output) || (!uhbr && is_uhbr_output)) {
>  		igt_info("Test expects %s, but output %s is %s.\n",
>  			 uhbr ? "UHBR" : "NON-UHBR",
> @@ -244,9 +239,7 @@ static bool run_link_rate_test(data_t *data, bool mst=
,
> bool uhbr)
>  	igt_info("Current link rate is %d\n", current_link_rate);
>  	igt_assert_f(current_link_rate =3D=3D max_link_rate,
>  		     "Link training did not succeed at max link rate.\n");
> -	igt_assert_f(is_uhbr_output ?
> -		     current_link_rate >=3D UHBR_LINK_RATE :
> -		     current_link_rate < UHBR_LINK_RATE,
> +	igt_assert_f(i915_dp_is_uhbr_rate(current_link_rate) =3D=3D
> +is_uhbr_output,
>  		     is_uhbr_output ? "Link training didn't happen at uhbr rates"
> :
>  		     "Link training didn't happen at non-uhbr rates");
>  	igt_info("----------------------------------------------------\n");
> --
> 2.25.1

