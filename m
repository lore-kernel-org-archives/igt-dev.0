Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8950F506D5
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 14:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F66E10E26F;
	Mon, 16 Mar 2026 14:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+nP9XuE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FAC10E3A5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 14:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773670554; x=1805206554;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YS+ZuyQpxUO9tmcqIUCHyZZ/3NZXacPT6efRvA3ov5o=;
 b=M+nP9XuE6ctsH0mQhAAN72PrjXKQ8mhJlE5BA4lw4YUBfxQchMVYvqRp
 e9TNkeWxClrZ2eMDj3yUZULjNsesM9dNwL2QddhZNqJgYxj9BjXYX5rC4
 JZxI3FGYZtQ/0u6rjVYsNIRlRp5rxuyDhySlrSFykcLP8nYV0TmTI4AK4
 5jgSydKKjYN0fdGv/NR2E4BHF6hLt5C3wOYKv8tPOSphIwZI+6nnbA9eq
 /hUhDqkLybDViBLKGnGMo3VEfaBnVX2CK3XF8zAsK5+26mWnexNmGkwuK
 cTYZpVmmoUvaUfghsTafWMPeOqPIxwkAcAKj2+tpg4yfvf4aW/8cK0w1c A==;
X-CSE-ConnectionGUID: iJZTsHLAQr2FusMq1gg0Tg==
X-CSE-MsgGUID: 9op+80rjQsiK6jPQJGhJhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85002264"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85002264"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 07:15:53 -0700
X-CSE-ConnectionGUID: fxjL0R9lQFecAEUKRHI0OQ==
X-CSE-MsgGUID: o+Uq4PL0RZqEwWVpnrCkNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226612080"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 07:15:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 07:15:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 07:15:51 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 07:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrAcZkSuNN9NN+u0WJpR1/Fj9feiWxoUIwMGjOMjJdwh1WsJ1P98b/Y+oIFPruFPAWyikLkR3ipjvUxVurTeJ+e7BNSmGBLfnmIJ4nMmBk9J41T/+hjZVhysvwjE4EmYcQLuYRO82pK50K1cdmP7h7iB/F7ZKhHBEkrCkHvKqm9vmP449XURuMD0J5wnP44w+LViz4gslLLKWIuAcBCLf1eU5g6cLssxLa+l7BNtpj+lLfND0UGXZx29COCsV13t9h2HRfUGmNqs4jLpY1Ewu4LgWbUmOIKOb+V3f0XgvhFTSK7gmnVryjd6rslEPAAeCh8v6FfdLo2ajGkbcR9juQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHDJk9A2h4DodDfrJc30ZRt2Nn+Q0f24nJRlZury4K8=;
 b=dG9smI835JRDwD+Wcztcy/82lqoAYgU+vnrWFxjumrVC834EMI7gGBKYmAXqjj42Nv5owMaqxoMqlZWvFFLetm9AzvKbwFYcZ1w8YTus81b4jO5CBhDOWauYQtaOmnWPdHAH/gjLm2PSZWh06uNsdDkRYlokwpWJlk+Y2C3VkTvzyXASepWuJW/LimgDQ0ywHvaA9s+mA+aZOHDWnPyTrHA/9sM18z9SJgJg3mUcyiDx7rumLUEBkRsTM/QixlAyYljj3V7gJAKxs5U5FEe8/NOOVP5oD8bx2EmSa8qHyNtSZbAmHRxf7hAtQuCjkAj80cSx/XfN3E9aM+MKeTr0bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by MN0PR11MB6256.namprd11.prod.outlook.com (2603:10b6:208:3c3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 14:15:49 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%5]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 14:15:48 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v1 01/17] lib/igt_pipe_crc: Add CRC stop-on-fail
 assertion and cleanup helper
Thread-Topic: [PATCH i-g-t v1 01/17] lib/igt_pipe_crc: Add CRC stop-on-fail
 assertion and cleanup helper
Thread-Index: AQHctR2lECNL4Ngedkee0VE5Q7D3C7WxMsyw
Date: Mon, 16 Mar 2026 14:15:48 +0000
Message-ID: <MN0PR11MB6034A8B0D65D33A627FD79478140A@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260316084021.419580-1-sowmiya.s@intel.com>
 <20260316084021.419580-2-sowmiya.s@intel.com>
In-Reply-To: <20260316084021.419580-2-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|MN0PR11MB6256:EE_
x-ms-office365-filtering-correlation-id: 827e7d30-d387-4bdc-2ed0-08de836685dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|38070700021|7053199007|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: IBw4tG+eomQLNDBIUcl6DSnQ22PPMXYxgOTjlcXT1qzzPKQu8Q+4sSq4uYH2atVekh9eEI9mxqs4Wq01yT0jW342TTUb0hmjg72IUAsB0/ChfSrkkEZg6sXCyEqSlxqb4+V1uEezcT8fYxeUESS6LAi74lkeOt+S/WU7b0gLbu49xHxeJkKQTm3pd1cOKoQp7OTH2KvbAvtjT0ZI3IIr1eaNlrrvMtLIxubvr8mJVl2sTJHAFv6Fi8j1CSkrQg7rASAkZg1PELcV6DbAIyTLITkjwtWzRxNEv/T1STlDBiL2P+voqapmARWTTfDsnxWKfIdyhMEUZ+7yXk+82VKaQvGO3XONBi9puoJ0zYI1Jp3TxOSbMunRcgrqnJrz0WlaLSo1/KHdsfEBx/amnwFduZSkbQMSp8kk0APexWKoxZjxpmoQdll2k+rl+HkGN3bTUuG6QOyPbxVnFQsL+iKiUPQVG9jxQhOZXKF8B+PA3+KWlZiPr9Op+VgK9CMOPrEvJZoVFx1e95boeZX45t9lMSCwN7+iaPWa7PgOE8GI1O0L9Dnp+x/K5AnXt4fxL5HiEQNxNEbI0PUr50IRl/RGWe4kULaoYdN3MWI7lJPp6djl+X/nnyD/Eou/0iIc95F6Vv0ZAXw0Mud3tHOFDeMdcG3CkEgea5DhlQ7JmjbUYRbJkgIX/KBVsiPydkJovcVO25dFm+8gBDCm9MpOTQNLf53odYZ2ugItRH66mfd9jLvjqs7szWqlwbG2xU9Q8gMVOLrnVOPqYv8LOduIdAfuhQNghftFi0FiLULEq3M4QqE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700021)(7053199007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W0crWisveg+hgvdbYNSB3gM0bOvbO/dyr7n1cNFQoABDiiwrpo+g3J54yIvR?=
 =?us-ascii?Q?G2KHiiB6W9DRQOjzczMdWB3taAYexiK788T0sBLP3TnoACJl7+nfwQTmZsYj?=
 =?us-ascii?Q?b/gDjmqxPeUKtG8q1v+Tf6o1+jn7FUzuhb4vJR1YJBFTAzcnmHvf+1XF7zDV?=
 =?us-ascii?Q?C9SP9XlLS6PW7b2wM1Tv88itujCgaQ5V0YNAV7zu56SATg1a9JnzYnmUkz0U?=
 =?us-ascii?Q?6lBX9kmjAPDLlygZtDmI/x+KjUN0hoDez2npRuQTj8vJRjUpoXcFd+YQlANb?=
 =?us-ascii?Q?JPn9tvCK34fgw8sHAvicCKjaWt2dmn3m4TBW4PjRVcS62kMxenJse1QbQGQW?=
 =?us-ascii?Q?5QSu0UBj1FiB4iKPaA8pKHXLbLwKGagxmR+nWrUkEVPw/8GA9kFAGJUEr8O9?=
 =?us-ascii?Q?XbetkQGp+QPY3Wc7UzVRUT7JodsUyA0uFjedG6ErJ4ZBmbWBDuCgMWZNN0kI?=
 =?us-ascii?Q?XxN+gBJP1AHmHIhWrYAr/uYwxV+xbdQduh9eBwYd8Z1qdNm/Hl9Hv5BJiDik?=
 =?us-ascii?Q?Zmq7MO51ssEWakklVJc/5nQ8AsWEs8kGlhqv6++9A5vI9wUr9WHZ7YMf2OrN?=
 =?us-ascii?Q?gDFQASNTh8VgK9NB5xSFOTXb3taHdJy7XZx8mKxPOLAYOYYEYvdZU8dFVLM/?=
 =?us-ascii?Q?h0BbRTUvsXpr8MEFuvdIpu6jRkaZRpqnJN/Ena2OxAPQeS5GffDxZNDdd8dN?=
 =?us-ascii?Q?6bDBA21dljSFPwB1pfzeDbbf9pNUr4LQnR/b2IffOa2gvppgdWToyteHHFef?=
 =?us-ascii?Q?xKFNxDud3mhnOpwtizYcb6ca8XAcYr09X/Uvp6Asv8FDrkTEKBwgc5CCA+CA?=
 =?us-ascii?Q?CPMd/xilKGeSnQIZ6SESIHORJ7vvB2XAFoX2RdKrDxttr8ERl1yDjAOb800D?=
 =?us-ascii?Q?dRyvx+Yr/g6J3AcEGx6v23S/KGRlzcArpzAaNYxjqG2dAC5Q1Oqbf/s+oZO/?=
 =?us-ascii?Q?wyXyIsRcKmLIaK5Z1iwPIjj9QvFDlKHGcH4ZKjY9XirS61XQHNkyq94Sie/Q?=
 =?us-ascii?Q?uaISt6/7K2t9wT/g25taCEZruuD8i0F+e7dU+Gpg37V9tU5vQ7nDEIRW2ldr?=
 =?us-ascii?Q?kwRUBJvp9FbqV+ug/dE9WEtVmoOT8VPhi64K2Ejuexj9G9jeLSwSrYCcaQHb?=
 =?us-ascii?Q?0yxVyi0+tw8dYw2eM92bMgX1iXqJvW87O1f+cV6cSvIoAjHvQqbmciXtMLz3?=
 =?us-ascii?Q?OcpeTg6zoHyiPTODhpEfIIilHo6TmrpE+D1K7C3Wpe42+csI7uT/I34Ax2po?=
 =?us-ascii?Q?wD1WcOSJ1fPX0dXptfyvyz4xGL46cy1ylv75c4KBybfDrcZcb2hd810zEBrJ?=
 =?us-ascii?Q?JW4H0MYJY0g9/RhbQeIwxJaJw1hoaYXuO1moMywgAphowAFb2Oh6nSBriYH2?=
 =?us-ascii?Q?DKC7Ddr1l8i8s0NvCEStq57WY4wqVMeyQWa1+SVSSWSbzhG2PuLYLSzYEwz4?=
 =?us-ascii?Q?5K4h9Foe3RS/GmZpIz+jVf7GGITlRplhVLthflogHzDiAbviA8Ts2FnrUR2T?=
 =?us-ascii?Q?YJbFNISB7DI7twpeyYjbCBop+AnqdLLkniCbN52KrdAVSNvxhyw1mmFtsPeI?=
 =?us-ascii?Q?h/y9P/HoN2UgAyTXEcDV5BOsTO3lGu7CiKDEDJ2U3gIilzyLmdX3VdUyxb24?=
 =?us-ascii?Q?COBeu9eyAMfFI3rt/ukrHzpAZyQ38RABUAIx1yLcZx9PkII6Ppw0/dGPcO3G?=
 =?us-ascii?Q?3P3F0GpPiMzXEFa7Y1r9aEPj7wd2ns4JCsVtGNOGirb9Cq8hEuJLEkOLSiWh?=
 =?us-ascii?Q?vkh18cYxu4TGw8nrOgFl5PtiGkfAUezzJwjT0vvo1jNX4jd2MxWM91cW59bj?=
x-ms-exchange-antispam-messagedata-1: 2j8HFZArIp95oQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: luJJjpEzIsQAnu626AiMUe7BXY9Z3EfnV4YFqqFATaUfMb69rLDCQfV/ABdPhNApgJDahbJXwxDEJb/cRTLWkBZ60jirPHAGN5+cV/3fRvdn1MOqSACgZT6+2w0k3qTd9yHXvvQWJx8DULDhvdgJnSuDGJNHBOJAmXBYWp9glCe3Q1S+z59WJgn+HIDiAE2xuRRKbRiYtW8uAR5ig6nHEzrR3u5E2ifNi11B5m80i3WWHMpdouCAck1vDf6nAAudBiW7xah4WQxfkyg/r6w8RNgjoMxbMZLyAT9ExzIkmIqar6KX+6IT5WKNTuEmRt2B05sb6hHgsCA23Fn5ooridQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827e7d30-d387-4bdc-2ed0-08de836685dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 14:15:48.8670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6K8spft55CE6m248jBGue78EPrWtVwRsx56IFfrGNl4bFQDAlGGqPaa8yUJoJdxaN3SBAThiQZGQXg1m9OkZpw84LWsAfKxh7ZtEOryUXkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6256
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

Hi Sowmiya

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sowmiy=
a S
> Sent: 16 March 2026 14:10
> To: igt-dev@lists.freedesktop.org
> Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v1 01/17] lib/igt_pipe_crc: Add CRC stop-on-fail as=
sertion
> and cleanup helper
>=20
> Introduce two new helper functions to improve CRC-based test robustness:
>=20
> - igt_assert_crc_equal_stop_on_fail(): Wraps igt_check_crc_equal() with
>   automatic pipe CRC stop on failure. Stops CRC collection before asserti=
ng
>   to prevent test hangs and resource leaks when a CRC mismatch is detecte=
d.
>=20
> - igt_pipe_crc_cleanup(): Safe cleanup helper that takes a double pointer=
,
>   stops CRC collection if active, frees the pipe_crc object and sets
>   caller's pointer to NULL. Handles NULL and uninitialized pointers
>   gracefully, making it suitable for use in test fixtures and teardown.
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  lib/igt_pipe_crc.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pipe_crc.h |  4 ++++
>  2 files changed, 54 insertions(+)
>=20
> diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c index 9a79edd51..12f=
13cd62
> 100644
> --- a/lib/igt_pipe_crc.c
> +++ b/lib/igt_pipe_crc.c
> @@ -134,6 +134,30 @@ bool igt_check_crc_equal(const igt_crc_t *a, const
> igt_crc_t *b)
>  	return !mismatch;
>  }
>=20
> +/**
> + * igt_assert_crc_equal_stop_on_fail:
> + * @pipe_crc: pipe CRC object to stop on assertion failure
> + * @a: first pipe CRC value
> + * @b: second pipe CRC value
> + *
> + * Compares two CRC values and asserts they match. Unlike
> +igt_assert_crc_equal(),
> + * this function automatically stops the pipe CRC collection on
> +failure, preventing
> + * test hangs and resource leaks.
> + *
> + * The pipe CRC is stopped before the assertion fails, ensuring clean
> +test
> + * termination. Detailed debug information (CRC index and values) is
> +printed via
> + * igt_check_crc_equal().
> + */
> +void igt_assert_crc_equal_stop_on_fail(igt_pipe_crc_t *pipe_crc,
> +				       const igt_crc_t *a,
> +				       const igt_crc_t *b)
> +{

since this helper is used in many places , please make sure to handle NULL =
value=20
there may be possibility that caller may pass null on a error path .

Regards,
Mohammed Bilal

> +	if (!igt_check_crc_equal(a, b) && !igt_skip_crc_compare) {
> +		igt_pipe_crc_stop(pipe_crc);
> +		igt_assert_f(false, "CRC mismatch\n");
> +	}
> +}
> +
>  /**
>   * igt_crc_to_string_extended:
>   * @crc: pipe CRC value to print
> @@ -407,6 +431,32 @@ void igt_pipe_crc_stop(igt_pipe_crc_t *pipe_crc)
>  	pipe_crc->crc_fd =3D -1;
>  }
>=20
> +/**
> + * igt_pipe_crc_cleanup:
> + * @pipe_crc: pointer to pipe CRC object to clean up
> + *
> + * Safely cleans up a pipe CRC object by stopping CRC collection if
> +active,
> + * freeing the associated resources, and setting the pointer to NULL.
> + *
> + * Takes a double pointer to allow the caller's reference to be
> +cleared,
> + * preventing potential use-after-free bugs. This function safely
> +handles
> + * NULL pointers and uninitialized CRC objects.
> + *
> + * This is the recommended cleanup function for use in test fixtures
> +and
> + * test teardown code.
> + */
> +void igt_pipe_crc_cleanup(igt_pipe_crc_t **pipe_crc) {
> +	if (!pipe_crc || !*pipe_crc)
> +		return;
> +
> +	if ((*pipe_crc)->crc_fd !=3D -1)
> +		igt_pipe_crc_stop(*pipe_crc);
> +
> +	igt_pipe_crc_free(*pipe_crc);
> +	*pipe_crc =3D NULL;
> +}
> +
>  /**
>   * igt_pipe_crc_get_crcs:
>   * @pipe_crc: pipe CRC object
> diff --git a/lib/igt_pipe_crc.h b/lib/igt_pipe_crc.h index f648b2c92..186=
3edc14
> 100644
> --- a/lib/igt_pipe_crc.h
> +++ b/lib/igt_pipe_crc.h
> @@ -41,6 +41,10 @@ typedef struct _igt_crc igt_crc_t;  bool
> igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b, int *index)=
;  void
> igt_assert_crc_equal(const igt_crc_t *a, const igt_crc_t *b);  bool
> igt_check_crc_equal(const igt_crc_t *a, const igt_crc_t *b);
> +void igt_assert_crc_equal_stop_on_fail(igt_pipe_crc_t *pipe_crc,
> +				       const igt_crc_t *a,
> +				       const igt_crc_t *b);
> +void igt_pipe_crc_cleanup(igt_pipe_crc_t **pipe_crc);
>  char *igt_crc_to_string_extended(igt_crc_t *crc, char delimiter, int crc=
_size);
> char *igt_crc_to_string(igt_crc_t *crc);
>=20
> --
> 2.43.0

