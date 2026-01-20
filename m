Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B805AD2ECF9
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 05:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5970F10E4B7;
	Tue, 20 Jan 2026 05:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKPPW3fa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3FC10E4B7
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 05:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768887226; x=1800423226;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cwviZdHe4WgylWw1X1TL1Tjbcb70iJgnwP5OzKvv7i4=;
 b=iKPPW3fa6nKFZhnvCgv9lYMLvpeNviy+UJ+FActVMoBQCoxeTgaLaBpl
 m9YVoVQL8Lwut70BlIM8za+/SvljJ2CArfz3k7kgK5xk6BwLKPeYviQM0
 dsrwxRisp+Tm/L3iA2pzh2uNKtb4BfRDjH7eHUjpYs3mXqoI31Ac/UA5T
 jvyuNL7+j34tSZrHJ3RWSnfaE0xMS7iEyCOz3BaFlnyMQh10yXaZsYiEt
 Cs9+CHMv7WUIUxaDllztMkzH3ocMO3zKK1JrBPX6zHTEQSNJ6giNF295i
 MkT9XiSCq8AC48vbdmpDh+LKvTelBGGTUxXkoswN+cQ9oPDmboHArAbtH Q==;
X-CSE-ConnectionGUID: RADZeWa2QZ2s9VrEL59qbw==
X-CSE-MsgGUID: +449DTsdTL+wx3vdioMtNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="72675079"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="72675079"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 21:33:46 -0800
X-CSE-ConnectionGUID: pdBPbtCFTt2+9nTw70DyJA==
X-CSE-MsgGUID: HfwsAGAGTxm8Vi185cpReA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="210499567"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 21:33:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 21:33:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 21:33:44 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 21:33:44 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 21:33:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boPNfLwJHmIh+rO3HB95sHDkiq+FUqf/uxE3naLx176F4ruB3z58bvARQF7iiPDGNAoCTJYiS4bKpUgfJVOmMKBP8JOkdkn5ZRMGHYMeULcwp+FKcgmq6CX1fpnQ6E6sCNDyCugtth5wZiLmsLb/30cO2Cay/ds7mx42hEdOdN1YXfMArlTOFP3BEQlTnLdbCP92ehiHnw1MqOLKy/iFpm4o3qvvWACqsOaHCP5Q7ygWFgn3B6eknVztyMjyyeXF8DV4euqn3DOaKnRcviK4xgqOgQs5X1sZSKIRC55RU1opfnkSc1FdoU9EI/RiEGJdN/LKIXCFQQXTuBTmAeP54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5cnCLHhPkKr1lpdfyTQSCAGjevgisuuvwrdzFtSLyI=;
 b=CFTA5HnFBJPX9yWla2K42p216blnMo3pySW9O15u6A48vbYhsUidjsSyjrn25GkxwB6pa+yzniQQ9x2+2CVvCfP+e4eW2iFA38xsFDFJfweVVl81oky/rv3xUBSjAs8Q3ip/wZVp5cInD8eELVUp+vtbYZc5sS4aksU62IXf714ULtqj427+7mkwGDumqcG+6YSw3Bs1Um1ICTT9C0Hz5Ck3CT9P9EnyGr2wXVD1P6WouZ8ZjLQeFWQruCg4Jy1IInln7wDQz8sgk18qLavE8fwliMxqw9DXiS7hDMvmvz8M3uA34iy4GAynRKxbnvZEsYkOqxtFZMptjSK2zndCCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ2PR11MB8421.namprd11.prod.outlook.com
 (2603:10b6:a03:549::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 05:33:41 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 05:33:41 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Alex Hung <alex.hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>, "Borah, Chaitanya
 Kumar" <chaitanya.kumar.borah@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH 2/2][V2] lib/igt_color: Improve fb compare time
Thread-Topic: [PATCH 2/2][V2] lib/igt_color: Improve fb compare time
Thread-Index: AQHcicfhQE1FoTIvFkeJ4iL56NZLyLVah/Ng
Date: Tue, 20 Jan 2026 05:33:41 +0000
Message-ID: <DM3PPF208195D8D35E613A1294E50864481E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260120044646.589301-1-alex.hung@amd.com>
 <20260120044646.589301-2-alex.hung@amd.com>
In-Reply-To: <20260120044646.589301-2-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ2PR11MB8421:EE_
x-ms-office365-filtering-correlation-id: e39bd692-4579-4e4a-571f-08de57e578c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?xYYOkMSOCUIr7oYN4RXFh03GyV6ecgLPsZRu/dVv6zA5ZsyZ6fOBWRhT4RJo?=
 =?us-ascii?Q?CP5R6Rb+5QApbIG9SvwGpGIWNlGSksbTahRwJ8o0m3c6AJhAULmVrAkHr5hS?=
 =?us-ascii?Q?BGURq3ffIe2J1J3ieQuFxPCacrGRxv2v6J9N0EPxSIVnI67IC22WofThn1L0?=
 =?us-ascii?Q?H+bXHYd6a/eLA0kT3dbA5WB1kAfmHAwLmgPOOu2bJlaAphk0z8xtaCxOCJFw?=
 =?us-ascii?Q?Bh1AX0mSgTvSo9lWjgqTK9L50a9cEoO0BlieQxn2cDQYZzwlqH8zrmGffhUd?=
 =?us-ascii?Q?jOor+w6n/5A9kNNJDduRE9dxTs2SuzyfeVvvc3QOglbMm8hDoMTmuj4cAey0?=
 =?us-ascii?Q?dICdbA7wrZlmKn5tCb/4AtSvsS0dzjHekAzVeCk5bYgkVeQwJcxUSZLM5sJG?=
 =?us-ascii?Q?qFWyIc6VDW/P47EIeKJTrQxY5+uQA66Z2W97yFqhKdACAE6ncGPTT/XuM6IT?=
 =?us-ascii?Q?0YIvGBOYVIkVMu6rIs9I6/r28FgO7OVHOUFOn183BE0vfc+fQluP7WaFM237?=
 =?us-ascii?Q?fjOkUnkQYwku3KOC8+W2oKYTmBNjXuWW6mUjWPCr4OSxa5XcsAHKJJsIpW2k?=
 =?us-ascii?Q?VvEudzqDQmfTrgV5gi6k13HoUWz5uYNOwC+MU+ClvZfSbnpMsrXKCwZYQdWG?=
 =?us-ascii?Q?E+8eRIFdZvkKwsekEpXdPrXUS7P3Zf5beHGPufY96LP8K/uqrjHpqNDmimo4?=
 =?us-ascii?Q?6dVmi3/0wwxzIrImFirxfCmTTzngsTZZwU5A3L+3Wkd8PVd+NL9eh3NQRaJc?=
 =?us-ascii?Q?gVGHxHHEKWSpUcBq4dut72BgyphKJqY/v51Q9QLstqKqYd6ZR9I9ulXavqVM?=
 =?us-ascii?Q?ynrfp83zOJHEAIbSeF9eor7wNemmqRD+t5T41kUCdOW/b9mxTCthu40xfus/?=
 =?us-ascii?Q?RMwJKx2apcXREk2pDX+WBDyFYXpYBRCFu5ICfNHX7yORK0o8sn8Y83T3BHmd?=
 =?us-ascii?Q?gVzkEypdyCBbbl3fvfQuFtjkUSWMi1I5LS+uQVOe+ycXzjLn+PX5CnlfiudL?=
 =?us-ascii?Q?20nImJwlbpwLEeYOsvANEBQmGEBfYaCFqMz2GRJ7Mfq/FRFdKrX3liyKfRu2?=
 =?us-ascii?Q?HR51lhWx4f0yXTL6k3DCP++gjiFNa15iqBMBKpF+JT6jOo9XBFy3NxYkKgSi?=
 =?us-ascii?Q?H6ZJ9NnakLyReLEq0sCIZ5kw8raQ4xUJk8QA7FP/0ABcb2svkQHsVerpXDP7?=
 =?us-ascii?Q?sutAokyLyNRXJjJIyTmNPQHaqdCBkVaEEFJ2E8j59EIqu6gwHl8yUj9R9QEG?=
 =?us-ascii?Q?c2U2hfK9AoTzQVcbVcl4cRc6Z7KQdl3N1F/JzzstzRE89HfvxgAAb36NsYuS?=
 =?us-ascii?Q?OG+Af9lPRrkHu31Vp0r1b+dSFYCfJX25lP4v66p54rYvEC+CKcSFiFuIT9jh?=
 =?us-ascii?Q?J3jTirX/0H8nhrMonWqKtXB7u9/7nyG9XWtdBfg54IzresizE/DzkTW7MRPZ?=
 =?us-ascii?Q?VIUD0+pEIB/7+KOmgpkAYyBJPCoy79Qdo0tNUVPVvQBsPt0WmVr/D2LfSAYa?=
 =?us-ascii?Q?RqrKvsZ/3JU2KjkoW3ef0AfPOgNYPcbOU3kk1JizV3gaYxUbUo6q+L93O3nn?=
 =?us-ascii?Q?wUfc1fuQqBz2PMUCb5fqrJU7rrlpFb67CWsmzxh8Gta6Svr4LQ+Y3/BBgL37?=
 =?us-ascii?Q?+X8/o71fwvikmeL7Y9QP/Tg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cZkL38Cdew08ygnjmvEqKs+w1la+wKlQfocyenF7fQNskCwPnjvbfFQuKi4d?=
 =?us-ascii?Q?gFt7iJLQ0L+tP2tZJoL1sJsgef88wnFB502wDD/C0uvBlpoF4/6AmWO5BQdN?=
 =?us-ascii?Q?5hLfITeRoanCsXfRFpuNP43gWzadPncCrmRLu8u7lFPxZqS+R31UCOjCEZxe?=
 =?us-ascii?Q?/BiYmIV/mxVv9VVXYwYLwj78Ca2eb1xLvVD1TYuXcv5M3I3DY3g98bQmlXh5?=
 =?us-ascii?Q?wirxbU0Zy6GDPXgu9AcZrqXu/cyrs3pqkyzOpL8mGpyqqC/qT67PASJN9Pns?=
 =?us-ascii?Q?nyt3BXpikmbEr+GI/wwCuJfB02w/mlKWkhZ1ttwsX6wseGvKiHF8BPmQd8qp?=
 =?us-ascii?Q?8Jo63CZBbYnXFvpQ55LyPnjOnfda0tlM5XycGDEFdvATqTcmIojEh5eF1/xR?=
 =?us-ascii?Q?lL7lIKbcREQGXJjQYgsCGO4ymNoa5oKOHUHD6SSFpSXCcnlBYxwllUfjNo1b?=
 =?us-ascii?Q?QcLJz51fF5uW9ZdlEXqMx3x+t55rYmsghi6u8JKwBc0Qg8r6hWVoKYCVNif3?=
 =?us-ascii?Q?FjCLH/IK5oS6fZzsl1zdOCnfB80zZqs7hN9nafFrp0Ov4vmX1mSyzgOdGe3B?=
 =?us-ascii?Q?GL0KM03jl+UpmNctlbTAAnFK94OjP3JpA610Tq5K383mbGLD8TZnJIMfZcph?=
 =?us-ascii?Q?DfondihDo7G1bluvo5g3SndQ8/Ei64bF5a4TUDR33KuTyIeEzgSPaDj/MEcD?=
 =?us-ascii?Q?Od8SdXyZ6hHUWln6/Kdx4Y23yBrsS8O12zqO47H68uxdO1qnmLFvJpKqJSPN?=
 =?us-ascii?Q?jowbx5SRySlVGTvB3QZSSO+II/hoM7EnbRPDAxpNs3PMevbwo3TWfaSj2wPd?=
 =?us-ascii?Q?nnS/L5yoP2Tf+Nt43SB2QcuSIpOXK2eWAcpSbUgGSMJs7zd05EXVRbL/1kja?=
 =?us-ascii?Q?IelpbGYgIR0N3YW8KSCj3q73z4mc6edWL9xgzkED14nc5T+Bv1XEc8ItJSTF?=
 =?us-ascii?Q?dIOsjmyxwm0KzsFARqPvkoCshCEt5ixc2HLiSMemHxlCsdoMQazPTmbKX/Tg?=
 =?us-ascii?Q?jbf3aIYaTDAOeQcSMOyRW2Aud1xPQI8jvlgKDKTmZIWzizvJD6n1DBpu8XKA?=
 =?us-ascii?Q?uodSxMJvmONm8DsB3MaAJy5SBqlrU3qE+g4G8e2rAhurO3ccGue7HWlxa5KC?=
 =?us-ascii?Q?ZBcr3cMEB5gPN6rYkFLQqVAqwYdUUrEQXYPw7yZsPpDk7IDsFP+Ok2s/n3j/?=
 =?us-ascii?Q?rpmRDbH/bmGF3YBTdqyZXMBd19PfTsw+fnFJ7K7XcShjp0vl4r2RYZzGFs1k?=
 =?us-ascii?Q?PlmU1suP4PrlaHE2lqlubPNKm84xpp7ehrpu/J6FEXGUMB+jwuEvTuSONi9D?=
 =?us-ascii?Q?l5ZZK1wQTZ4KoZ4+nFZQAsQ6wE0mXHIvovdBUb9EWuJ0UDEIIB+kv696tqhC?=
 =?us-ascii?Q?E0/qsAS+X/RIkecFz3ai+UpTu5h+4y+p1OPX6QDdK/rKt9XbQUs6xAk8burf?=
 =?us-ascii?Q?MGLlK0KncxnswA7Hnjjn/ZgxJxV4pCGEYp9cPSdPLvrTLH9yikNO/xbKM/Fw?=
 =?us-ascii?Q?vBkrZQcbXFxCwfvzOXmVhGtUhC1n8fuBdAPoRFyj4hCuIE6kKuyk8HWss3lV?=
 =?us-ascii?Q?nZPhfDPaw+eFYFLiEBK6hxaVHO6L8jdIZfkn2ez7dwhYt9NBYJAHepTvIGEL?=
 =?us-ascii?Q?9F/O8NH6aHRweHntIlhcYPDjg6Ck4LYkTy03cBCH9Tz0xWR10szGlRylTpKm?=
 =?us-ascii?Q?rHk7e+U0BeAF4LVwoLlXli5B6/uWHLY7B4vPOFSOwjioeqrE9XRiNgz3N2mE?=
 =?us-ascii?Q?/w/RdzeW8g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e39bd692-4579-4e4a-571f-08de57e578c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 05:33:41.8017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lP4r6EYk64VGEMIO3WhPW8RctQSiT2Awl/mjImpFq17Twq+sYoI+mGn4HMwMdtI6P+k+5CipPJt27l5EXBU/WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8421
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

> Subject: [PATCH 2/2][V2] lib/igt_color: Improve fb compare time
>=20
> Copy the memory to a cached buffer first to avoid slow memory accesses on
> dGPU.
>=20
> This cuts kms_colorop execution time on dGPU from 1 min to 17 seconds.
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  lib/igt_color.c | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
>=20
> diff --git a/lib/igt_color.c b/lib/igt_color.c index 4d94421ba..4a7b20b2b
> 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -575,15 +575,31 @@ bool igt_cmp_fb_component(uint16_t comp1,
> uint16_t comp2, uint8_t up, uint8_t do  bool igt_cmp_fb_pixels(igt_fb_t *=
fb1,
> igt_fb_t *fb2, uint8_t up, uint8_t down)  {
>  	uint32_t *ptr1, *ptr2;
> +	uint32_t *map1, *map2;
>  	uint32_t pixel1, pixel2, i, j;
> -	bool matched =3D true;
> +	uint32_t *cached_p1 =3D NULL, *cached_p2 =3D NULL;
> +	bool result =3D true;
>=20
> -	ptr1 =3D igt_fb_map_buffer(fb1->fd, fb1);
> -	ptr2 =3D igt_fb_map_buffer(fb2->fd, fb2);
> +	map1 =3D ptr1 =3D igt_fb_map_buffer(fb1->fd, fb1);
> +	map2 =3D ptr2 =3D igt_fb_map_buffer(fb2->fd, fb2);
>=20
>  	igt_assert(fb1->drm_format =3D=3D fb2->drm_format);
>  	igt_assert(fb1->size =3D=3D fb2->size);
>=20
> +	/*
> +	 * Copy WC memory to cached buffer for faster reads.
> +	 * Reading from WC memory is extremely slow so this is important
> +	 * on dGPUs where framebuffer mappings are typically Write-
> Combining.
> +	 */
> +	cached_p1 =3D malloc(fb1->size);
> +	cached_p2 =3D malloc(fb2->size);
> +	if (cached_p1 && cached_p2) {
> +		memcpy(cached_p1, ptr1, fb1->size);
> +		memcpy(cached_p2, ptr2, fb2->size);
> +		ptr1 =3D cached_p1;
> +		ptr2 =3D cached_p2;
> +	}

I think you need to take into consideration what happens if there is partia=
l allocation for cached p1 and p2
And clear both cached p1 and cached p2 in case there is partial allocation =
so that you are not using more memory
Than required

> +
>  	for (i =3D 0; i < fb1->size / sizeof(uint32_t); i++) {
>  		uint16_t mask =3D 0xff;
>  		uint16_t shift =3D 8;
> @@ -614,15 +630,19 @@ bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t
> *fb2, uint8_t up, uint8_t down)
>  			if (!igt_cmp_fb_component(comp1, comp2, up, down))
> {
>  				igt_info("i %d j %d shift %d mask %x comp1
> %x comp2 %x, pixel1 %x pixel2 %x\n",
>  					 i, j, shift, mask, comp1, comp2, pixel1,
> pixel2);
> -				return false;
> +				result =3D false;
> +				goto cleanup;
>  			}
>  		}
>  	}
>=20
> -	igt_fb_unmap_buffer(fb1, ptr1);
> -	igt_fb_unmap_buffer(fb2, ptr2);
> +	igt_fb_unmap_buffer(fb1, map1);
> +	igt_fb_unmap_buffer(fb2, map2);

Unmapping of buffer should happen under cleanup if say igt_cmp_fb _componen=
t fails you have a leak in hand

Regards,
Suraj Kandpal

>=20
> -	return matched;
> +cleanup:
> +	free(cached_p1);
> +	free(cached_p2);
> +	return result;
>  }
>=20
>  void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
> --
> 2.43.0

