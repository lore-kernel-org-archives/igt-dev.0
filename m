Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54F5C9830B
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 12:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5B210E0C3;
	Wed, 23 Sep 2026 12:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdawyMyZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8604F10E0C3
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790167626; x=1821703626;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+dWbyt+CL2LWYXO4k8UFvcbieXi3NKwJMd2wdshSM68=;
 b=bdawyMyZPmOqlyOlwbwttKa8ZZrViehD4A7NJBTw42zOTyR0qNcjJqOj
 hI6Y8L3tbXRfziIOYhj0d2BgZr/Wo1Hh8GzG/NsG/7ZEGJK10p9XtBQAE
 0pu7dOg8E3XQweFSpXfUJjpFdbDdGiIU6jmVqEjOR3oQZW49oDu65eN7n
 YOW05wQiAEtuR1B/L4EqsWe5/cUzJ2JjBYRRltJVJEd8B0vwAxJVCe5pr
 Thk/Lb1LJMuMZGayMqfgXNLp4PpCRRC4wM4BtlinOugCHEd4a2VO7bHhR
 1M3cv8fe0SSpE7WgJBOnN701WfY86dty5xdR7VXr7GB4jUN3LusEgoRb4 w==;
X-CSE-ConnectionGUID: 22kGxGHqQxeE8bf2M7TH0w==
X-CSE-MsgGUID: JBURPbIoQe6e0y2vYSn6IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101447918"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="101447918"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 05:47:06 -0700
X-CSE-ConnectionGUID: OGQNeonRSAmO885zujmqGw==
X-CSE-MsgGUID: LWT5KsXaQ+KUXdMe2HVvmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="301521845"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 05:47:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 05:47:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 05:47:05 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 05:47:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slyiNDVoj3Fi97gBx1l4vh4CLlYWfO7U1XY7KfS0oPAN6aHmVSCevgQerWb94NlaTgAKIxmw7HN0FUm1EtBhb/S2ZE51yRBaqLvg6HNMYmqyi+MH7x1iCyJdC+iXGNyPV9jVIoDy5dP6Klwx+UVJ1GVN2O6z28emJPfDRnzCnS6uYvN3ZFLrAatmUpv9loN0VqpthrAcYqtKiLUs7RLanSZp0t5pamtSXZSiQD4YJoRRgb/dGe6dQOY+o/XYJ+5AN+Mc+wdyv/NS6fRlepqibZtMgLfh1xpLUS6zM9RZ4KR7rUycbijXn1AlzLuvB/zGNXsT/bPCftoe9RPE8HZtaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7k4Ii+XZnc0xjaif986s0D8ESPSVp2BXotDobg5SQ5E=;
 b=AVjgp6yx5a8UD3AatN/EwPfiuzoT7181N/9BFZOBpf8yMuophZ1HuQdQh1v+I1BTg0VCK3UB2/bZjRJq1XAJNcf5odH7RpE9vVGvI7oDNzNUKVmTBIoWRykxjI6bCFdkZslr4aEBqrVAed77jHliePajEWq85DIzCOmJjriGDA48ceiXro9/VA4K2843PtMaMREy7AJEvSrAliwVIsPySWaXsfxj1xADVIHQWeKJKfkV2/RyTvl2KJ0RGIcObuIdzOHmcVb6dFF5Qi7WRHx45jZC/f5A8pbAmyJhVa3Z8Yq6Ovak2R0tBy+GEYZ+EK2rYVQ4UuQy+D9slgvIH5Zxew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by LV2PR11MB886526.namprd11.prod.outlook.com (2603:10b6:408:415::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 12:46:58 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 12:46:58 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 08/13] tests/intel/kms_dp_link_training: Log the DP
 link inventory in the fixture
Thread-Topic: [PATCH i-g-t 08/13] tests/intel/kms_dp_link_training: Log the DP
 link inventory in the fixture
Thread-Index: AQHdRZQ3o4nzHBoQzkikddeoohTwbbbcJ0kA
Date: Wed, 23 Sep 2026 12:46:58 +0000
Message-ID: <PH7PR11MB67966EC8D4CBAD2FFB810A51E5822@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
 <20260916044801.1279102-9-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-9-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|LV2PR11MB886526:EE_
x-ms-office365-filtering-correlation-id: 6cab79e2-6f46-4e14-08ed-08df1970c180
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|4143699003|6133799003|3023799007|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: wrg3LCRmvr/oqFL+mATY6rpPwhQ8snYffdmjjQlaupiXIsl3ApXby+ennYaYuS5yEP2PXXpkAnhhEm5vHzHHBbNCyMwUieLnB9WzvoYq9ttriM4a8p7YCbeeIiQRZ5UQVCm/aquFU/dqscQoP2aUO99fFyBtyfp3Xt8ecG7fdkh1kaecGZooKHSK1JDyDgelO8KRG9sgDGIEt5YcnsJyzGRo2TgV6m8hB9eVTP97mauOTv514Bk38fXytTtv2QigaxcrbWwX34kZtYCdB2hYB7ivc4VD7cnp31jYFfp74EwN5VkehJqnmX59KpktDQE84YL6bY/WeRgwZMuJb+fEyUn2mmdCCpHSlQ+tx504JGiY2tgMiXGMsTp0dlk6FKAmcPW4F+VggXfsrv/NE68YrBwOI0d656o7tHM472g2+38tfP6lGJ2VakAtfD1v/ES2mJxJYuHJtbzVtKw59Z7tWUBcbp7RkmYeg9KJQdq6sso6Bg+0ryAb8GP4eqIEKq6bQ/9+PQ3TQWGOeBvkHpkzeywzm/fVsTS5bB2KwDKA9uFxeyYsFEq+B8JRprLhJWHpJveK4BN/jPzOdRv2eGIq8aPLDJ7LbKfsVkKwxzMBQIdKeWHODMzGrY6yNv8PFZU8it8vXMnbFlSMq2a5f8a5jjNBSqYH+QugQ90XdxobrFU+Iq3PDnw/0iF3zgS6yWjsRtlCYGsyw970ZmCi1uHn/osroQ/xsI9GIjMAYZglEHU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(4143699003)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hzMfIorhQZ4QLouBf2rkwuRvgM2kYwHEHT6S50NokYMxJUcWqEWY35x/D3aB?=
 =?us-ascii?Q?3tqmfxO3hzewlNWgRhCf770y7YwxGrx3GiONrHx+G1BxXX1R6tKkZaljKi1k?=
 =?us-ascii?Q?NrBFayj/okJaXky2FT60mpopHEp4VtN85kryG5MHFTGiX1+o1CzvJsAakpll?=
 =?us-ascii?Q?RAyxMQ6tTFpIBdJeQkP/kYDTeLI7Vtexnps1xiUZz8zq+4jJ317fUPBSkA32?=
 =?us-ascii?Q?8/lsOeF5gG8aR7El4bRXwTZUtuGozCvZbPpgEOYkPcRBsefzEnaStn2cRAml?=
 =?us-ascii?Q?e+mXCefPn9I++YPgQAwezlaKC32WuEhBHWSLL/MFFPfMx69MlHVVDCAepn1/?=
 =?us-ascii?Q?WfjPdk4ut3FT50HFdlzbMHB53LcZpv/WbStkDAsD4jWE38OfJ/rcPfe340DX?=
 =?us-ascii?Q?EU3eIiskZexp4g4T6K/GC4+K9ei7/RsnTf0BGm902B217dMAIi4sZgZyQFwA?=
 =?us-ascii?Q?dnIPxiXMU5BwYY7T2WXojdFO00n3gSxbSKFPbiAzJYsZwPN1pmNOd6IhPl/w?=
 =?us-ascii?Q?RyYw6364NsSN3lg06hXM1+K6lKZD6w2bkm1Li33z2kFAehfkyv9GRVj2sK41?=
 =?us-ascii?Q?YOYrLEwhTbOkt80yJLCfYYXSqeiO5gL0mjaV9C6OsHc+jGQ+VB1Ggh3OgRqu?=
 =?us-ascii?Q?6kRdI0ySMBgzNHSXGoFI4BKyoy8UfzKc7w6UK63NnQZuEY9cYpAZI2smTfhD?=
 =?us-ascii?Q?AapHXre2givWYMJvVfj9LOWnDhUKia+UXHocxi6fgUNbM6Gu0bLeIoVhGt+4?=
 =?us-ascii?Q?L7gmj0+7qUla4bxmgMs7LH/bcg4+E/koP/U36aMTmgtQVmhO+sQcpvq2ug7P?=
 =?us-ascii?Q?vVaCODHfXN3dyedd4fbI76Mj2ne/kqJq+8+qve4KV7bw3gXAAbd7wsDgGYIB?=
 =?us-ascii?Q?mrNGHjw3U81CuafawgTd2zoYmxx7/niEPxxH4PlBSX+A43iA+Lrwl3QfioXf?=
 =?us-ascii?Q?9LIAPp+1Q/kVpntBvBm0m3GxOpzSnrtF+rG242MkEBUtW+WVcNnmqarhNn2G?=
 =?us-ascii?Q?bch4n5ca60+uDuLDmEln47Ew95wSJPwXITG3dKjo3ipk6sSLp/0cnYzw82va?=
 =?us-ascii?Q?DG8xNPvPbMu7U09tJjjYgp8zQn/obJeFDMabppsDVPr08P1r26uqi/ZwYoEw?=
 =?us-ascii?Q?CRyx2CjPLjEwV7rxMQrRwBBEyNTj1+BQWim45WOfoBNri/uSUN6sBtdpUEMl?=
 =?us-ascii?Q?C6lM7Ush4hWP4IU2ZjnhcAlRGtn1PsxEloNLUbNo8ZBRtkkD53ES0A0wjFCb?=
 =?us-ascii?Q?teM67eBm3HlB3Ha6h/9GgiGU+9TGkELfmxz4dMxwUKvtsz8MZsFyITnEdf1F?=
 =?us-ascii?Q?cKfuMfnk8teYUJlqS9wklotLNrwjf7G16UsMCbQeNnUQKyJ6RvuaRZKQ4YkL?=
 =?us-ascii?Q?A1E1qC40dZfL6xN+ggaFz6K6ebek4AJJjsPWKVva+Pvm/aLsHKZXyma0kK0d?=
 =?us-ascii?Q?THzkF2BujmVhJC1SwpFDgG3Yyi5W9LxFR/d6BiE3Y1GAjOXr94MKmU8ca7Cu?=
 =?us-ascii?Q?Uoh10iYisGfleC3U7K+U9SE2gky+bxMI9lmkKY8UZr0C5DMd4N1cPgR1rmzS?=
 =?us-ascii?Q?uZ4kLMscen1hNrAjuIE2GcqGRLxROy4YrNwel4+ETVo8uJ3R/A9q43u2YK2m?=
 =?us-ascii?Q?YMc/W5h9i6cgPU31OaFbkWTHFcuOSR39UScZS8y7zhadisziLGUnHigZ4zom?=
 =?us-ascii?Q?AwEkxmOXWi1pCsLi5Dp7ZjzuaYYFW7tyXfa6WT6KdwgkiyWg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xJrUHGsit4rtBV+tVz5J/WX7EdUr/El6OnQ4dUZs6Kq2QOFEmDRadF6rHp5NdcQ7mOW1HSHos3DvrtUUj4nmr2/43FeKZZkJ/GFB6eZCL/9CruV4d1fgG1NYTm82bItxIIHr3Hq0z3RgPmRukTVzla4YeeW8K2MR9K5MFRFCs4Vuoe3A7pczjF8hkqCCStJRQFZfqMcB7u6eHPhFl7yIUG17rX30/foqHLIYmQ/wqKi1jvPUOxbM88X3RtaU+Way8LPyf0a36DNZwMIww7Ddu3+i9tE6TBnTuNm+qIkBo4JHwG+gO98wsBmXGlj6ukEcf+SjzXVqvfD+ZxD11+V8WQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cab79e2-6f46-4e14-08ed-08df1970c180
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 12:46:58.3212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MDYfQgS+WHZObX3WfTQlU8gF7O0ZJBlcQin167E2FNB/qEfUiLQy1KfRpQCI5NSMTeQBWpj7Kb6233gXDXM4Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB886526
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
> Subject: [PATCH i-g-t 08/13] tests/intel/kms_dp_link_training: Log the DP=
 link
> inventory in the fixture
>=20
> The test logs which rate it trained at, but nothing about the link it tra=
ined on:
> whether the connector is SST or MST, whether it is tunneled over
> USB4/Thunderbolt, and which configurations the driver would pick from.
> When a subtest skips there is no way to tell a missing monitor from a mis=
sing
> dock without re-running by hand.
>=20
> Print one line per connected DP output in the fixture, giving the protoco=
l, the
> connector mode, pin assignment and max lanes, followed by the allowed
> configuration set:
>=20
> 	DP-2: MST, tbt-alt, pin assignment D, TC max lanes 4
> 	DP-2: allowed configs: 4x2000000 4x1000000 4x810000 2x810000
>=20
> Read the allowed set with the forced parameters reset, or the set being
> enumerated is the forced one rather than the real one.
>=20
> No subtest behaviour changes; this is log output only.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 68 ++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index 71531e8dc..812c4b6bc 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -288,6 +288,71 @@ static void train_link_config(data_t *data, bool mst=
,
>  	assert_link_recovery_idle(data, config);  }
>=20
> +/*
> + * log_link_inventory - Describe every connected DP link once.
> + *
> + * With the configuration in the subtest name, most subtests skip on
> +any one
> + * machine. This is what tells a missing monitor apart from a monitor
> +behind a
> + * dock that offers no UHBR configuration, without having to re-run by h=
and.
> + */
> +static void log_link_inventory(data_t *data) {
> +	igt_output_t *output;
> +
> +	for_each_connected_output(&data->display, output) {
> +		struct i915_dp_link_config configs[MAX_LINK_CONFIGS];
> +		enum i915_dp_tc_mode tc_mode;
> +		char configs_str[512];
> +		char pin_assignment;
> +		int tc_max_lanes;
> +		int num_configs;
> +		int len =3D 0;
> +		int i;
> +
> +		if (output->config.connector->connector_type !=3D
> +		    DRM_MODE_CONNECTOR_DisplayPort)
> +			continue;
> +
> +		tc_mode =3D i915_dp_get_tc_mode(data->drm_fd, output,
> +					      &pin_assignment, &tc_max_lanes);
> +
> +		if (tc_mode =3D=3D I915_DP_TC_NONE)
> +			igt_info("%s: %s, %s\n", igt_output_name(output),
> +				 igt_check_output_is_dp_mst(output) ? "MST"
> : "SST",
> +				 i915_dp_tc_mode_name(tc_mode));
> +		else
> +			igt_info("%s: %s, %s, pin assignment %c, TC max lanes
> %d\n",
> +				 igt_output_name(output),
> +				 igt_check_output_is_dp_mst(output) ? "MST"
> : "SST",
> +				 i915_dp_tc_mode_name(tc_mode),
> +				 pin_assignment, tc_max_lanes);
> +
> +		if (!i915_dp_has_allowed_link_configs_debugfs(data->drm_fd,
> output)) {
> +			igt_info("%s: no allowed link configs debugfs\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		/*
> +		 * Enumerate with the forced parameters reset, or the set read
> +		 * back is the forced one rather than the real one.
> +		 */
> +		i915_dp_reset_link_params(data->drm_fd, output);
> +
> +		num_configs =3D i915_dp_get_allowed_link_configs(data-
> >drm_fd, output,
> +							       configs,
> +
> ARRAY_SIZE(configs));
> +
> +		for (i =3D 0; i < num_configs && len < (int)sizeof(configs_str); i++)
> +			len +=3D snprintf(configs_str + len, sizeof(configs_str) -
> len,
> +					" %dx%d", configs[i].lane_count,
> +					configs[i].link_rate);
> +
> +		igt_info("%s: allowed configs:%s\n", igt_output_name(output),
> +			 num_configs ? configs_str : " none");
> +	}
> +}
> +
>  /*
>   * override_lowest_mode - Drive the mode with the lowest pixel clock, so=
 that
>   * the largest number of link configurations can carry it.
> @@ -524,6 +589,9 @@ int igt_main()
>  		 */
>  		igt_assert_f(igt_ignore_long_hpd(data.drm_fd, false),
>  			     "Unable to disable ignore long hpd\n");
> +
> +		if (is_intel_device(data.drm_fd))
> +			log_link_inventory(&data);
>  	}
>=20
>  	igt_describe("Test we can drive UHBR rates over SST");
> --
> 2.25.1

