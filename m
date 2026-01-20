Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1819ED2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 05:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B51510E4C1;
	Tue, 20 Jan 2026 05:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3drTUTE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1C110E4C1
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 05:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768888566; x=1800424566;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nnfkDiM+CJagabvjisaCUODqQ0QvpmQ0owsRuPmg86U=;
 b=D3drTUTEKw2S/mZmQkKxh74ag0wZHSW/7jnY8Bebhy2LaL9ULhJoqdmx
 oaa1bHucxd32xasAZqlj+sBaqlOtMT/W2p+Yb+CGZyg+M1t+W/2GRmBo9
 JCslesJ/W/BayDr/sfz0bIY0MXqwSzY2x0gtQ8gMl2VdNKZsfx3pRHAkz
 lhtW38mldW2GRBX1aJstcMJ+ndzGfluNhF12V3S0JIdue6W7oHbDzNfnz
 +52o/kwwfQwSva9sMPbvGoZib9k+a5lKCwL/Q03O2lizCIr1fFfWF8jD7
 B8R9uQJsJEs94USoowYdfDSpvb+qhvJFoFYjthJ2KHpymHu4IbOL/g/bF A==;
X-CSE-ConnectionGUID: s7brkxNER+eEjIno2liSsQ==
X-CSE-MsgGUID: H2eMd2RRTyi8f0qJsMCTrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73718265"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="73718265"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 21:56:05 -0800
X-CSE-ConnectionGUID: JCA1fiFERWOqrJ1oNR2SCQ==
X-CSE-MsgGUID: 2rm8/Se2QQ6xOKnHcFzEOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="211049037"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 21:56:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 21:56:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 21:56:04 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 21:56:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+/mTVx5FBvYP13pd0nMULfS+pUMMJiOJeQoDfFJFZBf+y+hZgEzjnuyrJx9o+dJscQcrtIwr3DKVOqap5KWgExELoRQ5jT6R8a0oTKc3HJvaJVLx3Y6agsma6hmTW+X3uao5u+sbYXsPdGin0eoT56XdyYWPFyHYes2IvlsTcJVJXHHuiqjdlNlcmQyDdfigNHUwIi9kkURucJcfVkhJwLYpu2uICqRoqg2VJ13EtqRmrzCVEwTg4fMwVXYHNrH3h63tFE9ZoNimSdrYH/mUAKQ97eNVzHazIBkApuATQ3g+QAxuh2skNgLdt6cfg1xlqrdRKZxlecGj6irRrGwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JutwDXLY3R0LP3cBoOPxXi9aa6AI8qdq40Jf7S4pK1Y=;
 b=svX3ND2paTcVZ2loWAizcewna7pY4IFhA/lBo4S/9G3tWXJbRfk5Xu6+mFcc6BCsW4Zj7uJSmf2guuomNzZE1oEEF2w1XOdW2cmnF2IM0nN5viGxNtscuLF7CX9pZcu2gGXBwi1m3MT5b6pEzIUKhu91h79q6vnZhrB0ReCSYOpq1px6VtsIMAd6KonQYBDxTuF8S6/t+jRhm+pK1ixfCHGnod+hbLCD2NRKDeG1dWkbcFHVdt5JE9WnTI7gO9PNh/7gmC/5AF9MOoZ/FIOdhWIdIs57hkOxeTqY7mc3sVJ9+INX5wSnIs/p0ep7mBDehOeACuLzNjZyXsDba/NUfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by BL3PR11MB6340.namprd11.prod.outlook.com (2603:10b6:208:3b4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 05:56:02 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 05:56:01 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHciP7X1P9ibmH1gkqbVBcT/BDFKbVY8kaAgAGaTCA=
Date: Tue, 20 Jan 2026 05:56:01 +0000
Message-ID: <PH7PR11MB679646F3DC6513E02391A293E589A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
 <20260119050732.110985-7-sowmiya.s@intel.com>
 <DM3PPF208195D8DF52BB0D3BE58C7D4F1E9E388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DF52BB0D3BE58C7D4F1E9E388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|BL3PR11MB6340:EE_
x-ms-office365-filtering-correlation-id: 9f43923e-4ff0-4c25-8672-08de57e89783
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6xmfT+mxpQEeVDdB71rdK4JVagY4npcFVqb5Lbjp/To+PYOalyZa6bNcQw8W?=
 =?us-ascii?Q?0sCkOrYpO2cHKp5f0YBfb55gOwK34rxyqteoX8g86tL0YT8LDE+HzyEQQFe2?=
 =?us-ascii?Q?F+j5Qu0IgpYg5i1Lq+PjxP2NaqN6PRdk90tGjrx/stnLsowDUn3lhs7c4cF7?=
 =?us-ascii?Q?ndomms8ErtOTI8oRk+R1uU5tTCBO4UvGDUDhIkfrCKltIEo6MUOjk1BDrqW4?=
 =?us-ascii?Q?FZteyNuFM5OCTh4iQBaj8RktrecZCFz+rL2/2Z7Z67SuFZIJBJOFEezCP+iv?=
 =?us-ascii?Q?7KrieJk+Vss6l2YFSkU/sC1Fz6PRb84b9ATdKSTAjr3fTarhYP2LHQ+GnaEj?=
 =?us-ascii?Q?StRvNg1msnnO7GWpk6X2lbOv+EUtcbj2zg1PfxgsnFCdQnsNVFCfLLXrKAd2?=
 =?us-ascii?Q?WmRLqpyiUdKmoBZzWCvSIuw999wilwkWiFUm6sHyT+UOgQ0sj/+NASzbZk+B?=
 =?us-ascii?Q?XsmWjyHGJGpmMNinuIePUx1FP5FoDEC1BAX8T2N0Uug/Pajmm4wsmdqoeVUh?=
 =?us-ascii?Q?xADLWlk7XRAtr/ke/1s/nc0aKDRVVWgnYMWKhMz3EBVqNEG0kEkqI4LxbVxK?=
 =?us-ascii?Q?4ewe6nH+TOVe3g4ULQB922OBDBnVdPDJ9Ix3E8w6xdGxH/Bca7styzmFsiQ3?=
 =?us-ascii?Q?QlZCjxTYyedFfWstV0ZEXhKECK+eu3+KPTI3h0sTRk3sbCjzoF1BUYArizZl?=
 =?us-ascii?Q?SusTXS+PkXHGMi+J5vLZ2Q8rcx1gN6shRbPHL1VnRrksB6oC8a/RsyeaVbP1?=
 =?us-ascii?Q?j8B6e5M2Pet7G2pwyjUnaHxyGLvit3sWztPhQ+5hzJkmOASh+jgE2D9kmEyK?=
 =?us-ascii?Q?Ifv+5Z0LJ4x+gaDfQwhu0f2hjw8UVx748vkj11OOWeVS6JD6Soefs2DHfLb7?=
 =?us-ascii?Q?ArNGUM0j3DYrRmGtseg0ZER1WaKObalZht8E2Vkz+SLMMrPmfwI1svAyuo7Q?=
 =?us-ascii?Q?dIhGdKGbotFhD2W/eBCwiS0KcxiFPaLre/1BqJadpeGN+5fLdBpLqqu+NAKn?=
 =?us-ascii?Q?gxhuJ9ZKe2vLbMAz3DhryZgpT7IY00dBtp7h4ASlZIuMCeNwPmjlUhHXS5mb?=
 =?us-ascii?Q?R5uXzpfWyU0jldO1wIiBgWQDkjpdjski6bYJXggg10Ufp9I5FHuZj1DZVwU1?=
 =?us-ascii?Q?fxctC88DmkU9wOQdk7aelOUq2NddVG6EF2va3w6uCKo2TTIcw2CVI8bHqxnE?=
 =?us-ascii?Q?QC2xt8ANfXZXXFlu8BLn7xfZhVBroPA0kgcI8SFne85371+E4RWvMOcVecyn?=
 =?us-ascii?Q?EWXmJAC776xXp5Xj6ZZJ2G6d41ZKS0lZiLASZE8j1xhNRgoP/TiWIU4TmZgJ?=
 =?us-ascii?Q?htjsFPHRW0esqbZCC5HNCH3yiDs4WeuLD7RfFDESIA90hDfByl287uIipZ39?=
 =?us-ascii?Q?qZGww6DKNNoeBaF4Bo6+BOQGb8lVyAHZ/lUZPHK8RoKDACT7Duh8rAziPahq?=
 =?us-ascii?Q?cFC6U3mt2OdktT6vfu7oNWj9Lt0ucPB96bt+ecQhLHP7kcOr2viw6ReXVRqM?=
 =?us-ascii?Q?Wb037Jd9rnrOTpDXCS8IeKzkZWUiFp5bp2oslO7z/gJzHEpbD0V+y8+/SJyS?=
 =?us-ascii?Q?oZ5oom76/fsUFJLsqNM3Y74wZ17w0UgjdkPPsX99PVNVXFikWr+c5yA4gi6+?=
 =?us-ascii?Q?+mH98oNYWln6+0nwzjgkzf0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8wrNE8YJOFg+pFhfbz0U8cVEcZefEwgCVRlRL5otyoNg4YuvvoQALVp1Uudc?=
 =?us-ascii?Q?zp42RT2YtnqHRw3q78/tQS12TQ/7UbqTc+ukJU4r76zxQmzJkzlFGw48/0ys?=
 =?us-ascii?Q?CIfq90XLPs1JoSLa5IVMiTC+tubu843sZbLSSaWHKVQYw5NCts50pIyk+zAN?=
 =?us-ascii?Q?9FZKRsvL4koKgu3cBxwVyy+R8Oz3MNcW2EQY9XY9pWz+8YWnfIzJtFrpy1mf?=
 =?us-ascii?Q?fAnq7S1haZd0zUQskZc1wnE/HucWSlR0sy21uZXXl30ECfE3GpLu13TBCas1?=
 =?us-ascii?Q?6wY6sRTtWkB0zZB5TTNtj/hbw7Dse0KD0wnfFImjsJjY7cGn4sC7RBIkjGr8?=
 =?us-ascii?Q?hDN/TO1TeJkkSlcYvbMTbwORda8cVM42spzBE/ks937sKRmKR5jQ9+Oxqf+T?=
 =?us-ascii?Q?HETyVbFoSqBzvrLGkKSz7KGXJHxEZrRpFaMTavdmJ2DRLYUd9Tvo5DzG0f8B?=
 =?us-ascii?Q?C5Vr9BQiyNOzwUiHv8tF1I7k5XQZtKSP6CslflvktQ/YvRxch89tLhcHFjOF?=
 =?us-ascii?Q?RVeorvLQ2p7dUVIb0nGx7ak1FWr9aIb0ydI7bbjOKaL1hRPiC+QKy+ZSvvv1?=
 =?us-ascii?Q?jn1hNo+8fUnLcaF+mwaNbTuWYXpJYj+XRebR6Z9zR/g0qxLag2+eSWssUl+E?=
 =?us-ascii?Q?pKtedXkV5hVGcp7ol3eqC455lzBfANFd6kl4VXKNVKIvqhqUKTy2Iwre8dqh?=
 =?us-ascii?Q?goipH7KczoC819g0/umiKMFH/VvZ2V+T4MSemW1HtG6LS3F2TtEzX7XKHknd?=
 =?us-ascii?Q?lFpC7qV3Kt10OukxBC5aGp8v9ACf0zXaqEXwaoj0qXc17jylvMcNI+l58Xc4?=
 =?us-ascii?Q?wWdGm+KdrOjF7payzWBnUFe+EEOtiMhHij8HyUkQWo3PzDL4TjwzU6OB8x7G?=
 =?us-ascii?Q?CUREXh7I6vh7wNxjsKII/TkBZH61BJHWk/1Y0FY37KZRPs9Ctcfx9xDYZO66?=
 =?us-ascii?Q?aFa+JPJroztf0dsnRd8pq6/4pql0lNeUMCYSPuTElcWEaKbfgHuRSfzOKxNF?=
 =?us-ascii?Q?zQRBd+qp4LZhjWbSeAvg+gKM/7A9H1DsHbxlPNpTAeubT/oSt1O/NqoD2KE3?=
 =?us-ascii?Q?BW3851c9wA7XzA2KPYxhl6KGVmlp9c6pJsg8UoN8JBgO4mmy4YBp4c4oF4Dq?=
 =?us-ascii?Q?T902VZqUvp+rI/YoK034qNw3KL6ij6Bn7Zbni3csnxVGvAu2zD+NqFlWDbJ1?=
 =?us-ascii?Q?1H26UZ1WhybS0sJ7HjxfgKlw9c9YweJjY4q3JtdV/QZyaBkXTIuAdd4fjmSX?=
 =?us-ascii?Q?q3mXJ4xyZH9Vl8LPqt3IFVSmkh8d+gbXOZAQdyLyr3BXwKa4ozEUmAd+vqWs?=
 =?us-ascii?Q?BLp5jmpSGc9x27kVdLZc0Q9jMF9jb80bOXd/chMJCJn+fbAaJzoQJClyTFRQ?=
 =?us-ascii?Q?CqE3K37KvWYcgr5wHyjnea6ikqBdNMc7WPxQCyaVX7OZQ41miOqG2WNYlnRO?=
 =?us-ascii?Q?djAPybtBSmRqNQMq9NyBG8p6qd80/0GInnLOy1z4oBMOeRIFnewQ92gzx6uu?=
 =?us-ascii?Q?rHkjAGd+voNg2ZMjj+iiNC1Y+Xu75oPmapM+jRT2gVdYBqkIFmkzUx4DfCwg?=
 =?us-ascii?Q?K7houZ5w+sfTpwrq+O9GdE8lKbYvtsWkS09toaukaKalQfnDGch/Jl9lgVyY?=
 =?us-ascii?Q?GuZHY/IH48o7Ch4ICCS2SZAJFXKnrvCEDF4L5I6+hOgc2vihXtiKb7ve32yu?=
 =?us-ascii?Q?rhW8rzNI6dkzgODIqtisXh6MPUqnJtz52IdrD/8LIUxD02MM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f43923e-4ff0-4c25-8672-08de57e89783
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 05:56:01.8882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M6ndEeWiNUy0b/DNG5N5i4aF+d83e9bHrB1na+JuDf3p07j/5QFT76WyLOfdzmxIJcTm/QKcgYeBo5LwAQAk2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6340
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

Hi Suraj,

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 19 January 2026 10:42
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor writeback=
-fb-id
> subtest
>=20
> > Subject: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
> > writeback-fb-id subtest
> >
> > Remove individual tests for each format for the test writeback-fb-id
> > and introduce dynamic subtest generation based on the formats supported=
.
> > Framebuffer creation was now part of the subtest level based on format.
> >
> > v4: squashed the FB creation function with this commit (Suraj)
> > v5: -Update dynamic subtest documentation (Suraj)
> >     -Rename input_fb to in_fb
> >     -Set plane to in_fb and remove unused input_fb as an arg to
> >      writeback-fb-id function.
> > v6: -Remove in_fb inside subtest and reuse input_fb from
> >      fixture (Suraj)
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  tests/kms_writeback.c | 60
> > ++++++++++++++++++-------------------------
> >  1 file changed, 25 insertions(+), 35 deletions(-)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > 63917bf4f..0ed86c865 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -51,9 +51,6 @@
> >   * SUBTEST: writeback-check-output
> >   * Description: Check writeback output with CRC validation
> >   *
> > - * SUBTEST: writeback-fb-id-XRGB2101010
> > - * Description: Validate WRITEBACK_FB_ID with valid and invalid
> > options
> > - *
> >   * SUBTEST: writeback-fb-id
> >   * Description: Validate WRITEBACK_FB_ID with valid and invalid option=
s
> >   *
> > @@ -300,7 +297,7 @@ static void test_invalid_parameters(igt_output_t
> > *output, igt_fb_t *valid_fb, ig
> >  	}
> >  }
> >
> > -static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb,
> > igt_fb_t
> > *invalid_fb)
> > +static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)
> >  {
> >
> >  	int ret;
> > @@ -700,37 +697,30 @@ int igt_main_args("b:c:f:dl", long_options,
> > help_str, opt_handler, NULL)
> >  	}
> >
> >  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> > options");
> > -	igt_subtest("writeback-fb-id") {
> > -		igt_fb_t output_fb;
> > -
> > -		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors &
> > XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> > -				      DRM_FORMAT_XRGB8888,
> > -				      DRM_FORMAT_MOD_LINEAR,
> > -				      &output_fb);
> > -		igt_require(fb_id > 0);
> > -
> > -		writeback_fb_id(output, &input_fb, &output_fb);
> > -
> > -		igt_remove_fb(display.drm_fd, &output_fb);
> > -	}
> > -
> > -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid
> > and invalid options");
> > -	igt_subtest("writeback-fb-id-XRGB2101010") {
> > -		igt_fb_t output_fb;
> > -
> > -		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> > "DRM_FORMAT_XRGB2101010 is unsupported\n");
> > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> > -				      DRM_FORMAT_XRGB2101010,
> > -				      DRM_FORMAT_MOD_LINEAR,
> > -				      &output_fb);
> > -		igt_require(fb_id > 0);
> > -
> > -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> > -
> > -		igt_remove_fb(display.drm_fd, &output_fb);
> > +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> > +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> > +			uint32_t test_format =3D fourcc[i];
> > +			int bpc =3D igt_drm_format_get_bpc(test_format);
> > +
> > +			if (is_intel_device(display.drm_fd))
> > +				if (!strstr(igt_format_str(test_format), "BGR"))
> > +					continue;
> > +			igt_dynamic_f("writeback-fb-id-%s",
> > igt_format_str(test_format)) {
> > +				igt_fb_t output_fb;
> > +
> > +				fb_id =3D igt_create_fb(display.drm_fd,
> > mode.hdisplay, mode.vdisplay,
> > +
> > get_default_fb_format(&display, bpc),
> > +						      igt_fb_mod_to_tiling(0),
> > +						      &output_fb);
> > +
> > +				igt_skip_on(data.dump_check ||
> > data.list_modes);
> > +				igt_skip_on_f(!(data.supported_colors & (1 <<
> > i)),
> > +					      "DRM_FORMAT_%s is not
> > supported\n",
> > +					      igt_format_str(test_format));
> > +				writeback_fb_id(output, &output_fb);
>=20
> You have also started using output fb as valid fb  we previously used inp=
ut_fb
> as valid fb please be mindful of your Changes and mention these changes a=
nd
> why they are needed.
>=20
> Regards,
> Suraj Kandpal

As of now it will use only two formats BGR/RGB 8 and 10 bits. So, I will re=
factor it
to reuse the input FB for 8 and 10 bits accordingly.
>=20
> > +				igt_remove_fb(display.drm_fd, &output_fb);
> > +			}
> > +		}
> >  	}
> >
> >  	igt_describe("Check writeback output with CRC validation");
> > --
> > 2.43.0

