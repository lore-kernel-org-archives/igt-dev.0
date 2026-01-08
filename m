Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2EDCF6AB6
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 09:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC9010E6C8;
	Thu,  8 Jan 2026 09:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjl8I1QH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72A710E6C8
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 09:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767864866; x=1799400866;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9x3hfZBCD0tf0fYoN6KZKXer6xwbb+u5PVWtcYaH8lc=;
 b=hjl8I1QHMdzqwgdrgPpo1zqadfKoYHRcnMeOhdZ4DzTThfdGuh2/+cNu
 D25Kz+s0HVOowct8Dlmx7DQFJzl/1zoxTY4mOPSnIVSkKQKVwrYawe93n
 AtZC//mfLoy0eC4XknKkyXa0tKJcd5eQrVRkvkzLJQXyZGp00SqXvoe1M
 9PMNOWHzFkjjdSFdjiMfCHB8rqCkY5bUjUZ1EMscYB3Pnkv74VNCWIClA
 Bo9IJ0irJUuiITmujMWctNypTVG8oCErrFp8RIblASpamveqzLt7i2+em
 ti7F9CJTj3GksbFyC/r+gYPJCAV0ucdcpiJxCWjXXhat6MhRppWCwpBBU g==;
X-CSE-ConnectionGUID: QIdwtw2nSvexSnBKRwztQA==
X-CSE-MsgGUID: P+QdMgXRRKiaJSfuz8Z2Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69288839"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="69288839"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 01:34:25 -0800
X-CSE-ConnectionGUID: ug5VEm46Se6EdqBnKYjwYQ==
X-CSE-MsgGUID: idKtB4TCRKqw1vAuwEjxPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="202780948"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 01:34:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 01:34:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 01:34:24 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 01:34:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsyV8rZBChnuVTpnqOFs5gKqCWsSCu74f2URgg3q9Sr+iBSVkZ6hfP/euR5D3P38Sdn5nlBUC9O+K02dHwm2Nxanre32qCr3WZzu7cWlALhy5br6ynU9TxmtQT8UULFAhdJovIMjy5Nw93N4W6Idp4TxOYDK9KB3UyHsNnDgi3eT0A/dyYWHaGy7015VSfT2qNmASfupXNYMVk53ZmJpqgczU9UO/mmUW7crD6+vhYWUVmTpHecAGyBn9yrn4L7/18DTasr0YgzLJndErQA4qqyw6o/6UHv7Ab0cC119X78xFozHZ9rFA37M63zmK7O74ROy2fHIsMfKhsDzuI8tiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aywsUDMsr4P1JiBqzt9uLM98XsjAP/gDuztuhb1iZgk=;
 b=HCxmtFYB/qB1Day6tHz58jGKsVF12EZ8k4iofoh8RAufPuScVDtetCxjqL6j5I2dTvObweGQKcVBKaB2SrVK3IkCpZfMGtLLs7hLpJSppNcXtxOG8Z38PZPqzk4hhETxhi3EwTH7iOYnm1XdLYH458hjXKx1fXkPaSgCL+iG744iD/Upek7gNAhB6uVEQ2lcUgP5zVNeBxrekplOYTfNrpAU5I2pIu/C+ZB6/JQmzYgNnk16pU3DaeIvFm1Xe+7tYMDDeRxMp6lgvd4Qg3ZqJzoB0VUxcHPfLDcCBgj7ZzO1bP/GVmaPsFIgS/2S8bL3VIVIbh4gR/M2H7h/ALfkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by DS7PR11MB7807.namprd11.prod.outlook.com (2603:10b6:8:e3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.4; Thu, 8 Jan 2026 09:34:12 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 09:34:12 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v4 4/6] tests/kms_writeback: Refactor format
 handling in commit_and_dump_fb
Thread-Topic: [PATCH i-g-t v4 4/6] tests/kms_writeback: Refactor format
 handling in commit_and_dump_fb
Thread-Index: AQHcZDa3HGMWYwZOvES7mS4aoPPks7VH8rYAgABHLAA=
Date: Thu, 8 Jan 2026 09:34:11 +0000
Message-ID: <PH7PR11MB6796D9EAC6D7EE7C49E32324E585A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
 <20251203094307.3187669-5-sowmiya.s@intel.com>
 <DM3PPF208195D8D1343790F2DC5D6E2E430E385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D1343790F2DC5D6E2E430E385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|DS7PR11MB7807:EE_
x-ms-office365-filtering-correlation-id: c8fa8638-9b96-490e-4633-08de4e9914d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5MGJ9PTAA/Tu1evWbUoik4RCg3xFMDgToPjxFSKVbqe1VQwd98x7LbQSmWKY?=
 =?us-ascii?Q?o/O5ue1/CBQucS9D2xmD4mhFhbAtxIENJJ0H0DP1+r10aACm4rQ4uOD3F2ZO?=
 =?us-ascii?Q?zqVhVuTLGkktYi3i0iF1YIiC2sVtrJM74su5Z+K9ONWdkUNfowBaKbvRCO88?=
 =?us-ascii?Q?jV0m6HsyxnTrUzuL1MNSL8z+49V1rb1QcmUJ7rDzaSDK+pyIpB8lJG/hCRF6?=
 =?us-ascii?Q?GldTa0AZo2+xJ8+BDzuN5XsO9E8dBgBoyZ2A5h1U1WezNKlYwZ5iM8H5s5qB?=
 =?us-ascii?Q?uVxOZNF0c+LStAN8/4H5RNTobf7BOAZm1SzyAppOP7mcb/ctobM5GTbys/Zk?=
 =?us-ascii?Q?dwtn07MC+gkVr2b8xW9C1g3KLwDsg60UN5aThTJerOWH0xv+6MHY1gtI2tJ5?=
 =?us-ascii?Q?RyukK30BtRBEKnOGda+rAVLTto2SBYDRDji3XuXBEUPma9f97be0x7Ogo7tN?=
 =?us-ascii?Q?mFzzbqJ3LM2+wJH6xcB3t7XmiYabaH7ZEgCZDl0aV0zcH8mkSiu0dMvOYbFX?=
 =?us-ascii?Q?/C9I8wmp6R/W2HLzSOJ5kHcnJZH+zzlS/uFAX65KjOP9q3C7XqDWL7PhWpK8?=
 =?us-ascii?Q?t8peXS0PHwMBqBnhKC6jGUzSuKp1GMnC36F07nx9J4gb6q3IczKVbsl3g8G6?=
 =?us-ascii?Q?Q1gvlwpd9s1A+Hn6zaJrzwDrRytHi3C1nmNrERGB8xUlItMeaSyt/8bg4Sek?=
 =?us-ascii?Q?mTWYOrue5a/JN4BdUAyvRiVT99j0ulYL6lZ+nfhbCJxjR3GdcYwhS1B2akO9?=
 =?us-ascii?Q?9yQhUx4bUwvN3eEViNOE7iosumyYiTgNL+wEOLLS0bApFXBdqvvQJCBRgEJy?=
 =?us-ascii?Q?hNM6oC1aPcn4tbMMbtzXCd3h4Eh0LHKf/qX0szuQfkzR8L/fuUwhOVp0h3R6?=
 =?us-ascii?Q?ub9QeEX3sx78KiMr7RoYaeG4I4sfwE5TkbklFZ65MUObLyNP7DOKjCBYGldO?=
 =?us-ascii?Q?s84yrQfJl11tvAjczEorO/kqTFxg4lqoUy4O97d9UehsSUQ1R8C1CgCeNdQN?=
 =?us-ascii?Q?u+GObOViO9wImHyrmReLY9oUW3SBI0ROImUjpcWpoJ5a09yLqsP3OOuhye0Z?=
 =?us-ascii?Q?/wJcPRQu/C+gSDj98BCe3G+7T1bWCG9SwV168i9FN8W+FNFKo6qBfRmKPxng?=
 =?us-ascii?Q?qlvsC7LSvQ4oktI4xekg/MiEA1ussQfwpG/lo4GlpQFgznylBO8vDc/XqbmH?=
 =?us-ascii?Q?EE/xynqPCu91vjUtramxWveWcMcnxtl0T2YCbB6HBdSE0FB+3BZTIZAFVDGK?=
 =?us-ascii?Q?TNnjj5yATZIbyuWmnnuTOM7Pwd4RejHNMiMmtZ6o2oAV6qcbPNgTbghpPFIb?=
 =?us-ascii?Q?nAmEIhR/3xkIOK1xK9i5zv1GcgH7gjh+ZKhIM2zDe1MTFxNlxCNpyGa29uCJ?=
 =?us-ascii?Q?bc/f1IZ9RIoGMugTQ1RJSP21UBuXR0MxjRZP+W8B9CoFR2pCqLeWbfaHpjsW?=
 =?us-ascii?Q?EuhLQKQh+8te5gv0okrDnr7gcphIqkdEFjC1Bp0/zRtQ+KSOIbgndw6+Eny5?=
 =?us-ascii?Q?aaI25ie0HSUG4l94/EfNNpDN6SIWKaOTjRTZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZdKmt7VK2P/r61O383MtgRqTIbHHEzbpZj092UnwNk0FeB7JdJRVXKuwcTWd?=
 =?us-ascii?Q?nsKhE9c7IJrACE3VSUcsOS9jOYZ2FhBKIfw3yOOMxo7Sjei4lxsJcgONOr6u?=
 =?us-ascii?Q?F+0dmB++coskCLJQ0ljW5OsWdo4A2JfeT5S5XoIK2jnykLbIPDEnvNfAgtxZ?=
 =?us-ascii?Q?7BbE9PcMNMphPwp1MeTBU1ykn3EQa6phJcyBHBaNCLVTLf2FD7W1zEPhW1/U?=
 =?us-ascii?Q?+3FF9uKej7WidhY2aVxwAamf3xzzObLo0t2PVDbW0XewhVourOHeYfqwLw8f?=
 =?us-ascii?Q?zbQJbAMFjjw2RdfPT1Qpi5rle8zVkALydvx+I6szSENsZcZwj+8+K4crW/E4?=
 =?us-ascii?Q?FBXMPrZhsZ28Rzc2R3dYNpwdiz+wHyDzCom63E74Rix15CMWPbZN//eyiAxx?=
 =?us-ascii?Q?xq3zzOucmYtFC96pZPhEe+10uM+i+AcV126EtFIenDVu0vVw69kZ3/iG+o9c?=
 =?us-ascii?Q?0v0LFXLQ3QiZdvDQRkc1ARCAjoVKy+yFxNuxk4riuV7L1SUe4ldfStKxuiAa?=
 =?us-ascii?Q?S230Vyei3l95eaBxwvsx3QL7ErdaV+vLfmJjKSvbOhslFLZOt03Nm7fZ9kwN?=
 =?us-ascii?Q?yUWwuLXcsr1jYMStwVNVN/3gCmj7pVTr/G2zg5GvD/Xj85UnHIcLZ9v6tESO?=
 =?us-ascii?Q?2aDGs72FPvaqEH0Qj89e+lRJRyvkGCgZqsOGkM5peWw1aOD+KEt37M1tKVLI?=
 =?us-ascii?Q?6VG+lHETS9aoWRt9SevD24lx00AGL7j5yifSmI5A3iVpP6soRoRpn1T8R5Tp?=
 =?us-ascii?Q?zxep890ju0MpW5UEBoDfhm3tIJEvvKbpVd6spMTnwz4CdloRnKuGt2U+dQdL?=
 =?us-ascii?Q?3zXTR1695UaHtLU7c6DCfqAr+gH14ENEQmRvn1RCBfgfE8bgE4jYy7E/P2hY?=
 =?us-ascii?Q?Q+3U/doA/YbuUYsYIzRpfAlk6h9V/CB87d5oQYs/3fUg6ETLo/pftgvTUYjP?=
 =?us-ascii?Q?GAgJiqABuUJYhZ1jnh3c+bgj7jNkY81CbG/ww932dB5nll89aFSZCKicS6ED?=
 =?us-ascii?Q?qjEAE5I9aBDI9pj17JeDiUflJB/ijXsDG3C7JqElMx3IYOu7T6SV2JM1Pkpu?=
 =?us-ascii?Q?o1z75zb9gp/u0KzokPVBaVInnYGa09hh8u/hmEH8Pba65ki9RwaAo1Y2bYC9?=
 =?us-ascii?Q?mH7duNmwMS12TFoo8TWay09wusVthIrsarF4v/Np3Ln7/eWpKkBVck8mXqSo?=
 =?us-ascii?Q?rD6rnqRYniUuQYXc9xIyNU5NQ5a/h762mliZ+Tf8zx3z0bHjNo9vpAMsMjJ5?=
 =?us-ascii?Q?HiLkUQm/BcuVyx18XXlCqesHwNsJrJznrJoXpvQKNeQcZEQuGo2+iV0KMYv0?=
 =?us-ascii?Q?VnG6tvDKs8gUcqm+C123Y/J3qId4Jd4LVhpQ2ZDtVw6nSR1Gv5CIKo8bPtdC?=
 =?us-ascii?Q?m5LYz+wOTWOK0qfnow9vwvYZyzD6a44ibS6SY5Lyu3fAM1Chf1TTeWKiYsM4?=
 =?us-ascii?Q?mUgqk+S4Smo6EHzCoBxwtPG1OYSMHsBMeQfuYXpS2SV3ovJgWw2ulHjCBCAa?=
 =?us-ascii?Q?w/QR9sVul0nOiCWzJWc+/EjO7sdJKAKs3dLPA9H0TA0nwf3TBe9bXw8a/Ehp?=
 =?us-ascii?Q?Lgz3F+buLPhoUiKd+8x9GY0VmOMabrt7RTsgh36+xvgTajz91FXCTGm1F4Q5?=
 =?us-ascii?Q?E/XTIJ2Sn5GPe6g51Yy/pUj1fx4xhY0/pqf6gwLsEfgmAeLuDfoJSRcpjHTE?=
 =?us-ascii?Q?VBdjGZkiux2/JzUVFQokgZ/Le7fXR+2qxhvckm3E2PbM1WFN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8fa8638-9b96-490e-4633-08de4e9914d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 09:34:11.9567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YO1iuff/Ro2xPnxeDqV14UPRsldXb0VAhRghnDPdpN4rYudoShTTdXqAW3VVVqubVvqU2uFRmbGkV5xbD/6FoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7807
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
> Sent: 08 January 2026 10:44
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: RE: [PATCH i-g-t v4 4/6] tests/kms_writeback: Refactor format ha=
ndling
> in commit_and_dump_fb
>=20
>=20
>=20
> > -----Original Message-----
> > From: S, Sowmiya <sowmiya.s@intel.com>
> > Sent: Wednesday, December 3, 2025 3:13 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> > Subject: [PATCH i-g-t v4 4/6] tests/kms_writeback: Refactor format
> > handling in commit_and_dump_fb
> >
> > Modify commit_and_dump_fb to select supported formats if provided;
> > Apply default format based on the platform when none are specified.
> >
> > v4: Add get_format to assign format based on platforms
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  tests/kms_writeback.c | 38 +++++++++++++++++++++++++++++++++++---
> >  1 file changed, 35 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > 473f6c58c..6725f5ea3 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -101,6 +101,13 @@ const uint32_t fourcc[] =3D {
> >  	DRM_FORMAT_XBGR2101010,
> >  };
> >
> > +static uint32_t get_format(igt_display_t *display) {
>=20
> Get format for what? Function name should be clear and definitive rename.
>=20
I will change it to get_default_format_by_vendor, that will be more clear.

> > +	if (is_intel_device(display->drm_fd))
> > +		return DRM_FORMAT_XBGR8888;
> > +	return DRM_FORMAT_XRGB8888;
> > +}
> > +
> >  static bool check_writeback_config(igt_display_t *display,
> > igt_output_t *output,
> >  				    drmModeModeInfo override_mode)  { @@ -
> 446,7 +453,7 @@ static
> > void do_single_commit(igt_output_t *output, igt_plane_t *plane,
> > igt_fb_t  }
> >
> >  static void commit_and_dump_fb(igt_display_t *display, igt_output_t
> > *output, igt_plane_t *plane,
> > -			        igt_fb_t *input_fb, drmModeModeInfo *mode)
> > +				igt_fb_t *input_fb, drmModeModeInfo
> > *mode)
> >  {
> >  	cairo_surface_t *fb_surface_out;
> >  	char filepath_out[PATH_MAX];
> > @@ -455,12 +462,37 @@ static void commit_and_dump_fb(igt_display_t
> > *display, igt_output_t *output, igt
> >  	char *file_name;
> >  	unsigned int fb_id;
> >  	igt_fb_t output_fb;
> > +	uint32_t format;
> >
> >  	path_name =3D getenv("IGT_FRAME_DUMP_PATH");
> >  	file_name =3D getenv("FRAME_PNG_FILE_NAME");
> >
> > +	if (!data.wb_fmt) {
> > +		format =3D get_format(display);
> > +	} else {
> > +		drmModePropertyBlobRes *formats_blob;
> > +
> > +		formats_blob =3D igt_get_writeback_formats_blob(output);
> > +		igt_assert_f(formats_blob, "No writeback pixel formats\n");
> > +		igt_assert(!(formats_blob->length % 4));
> > +		for (int i =3D 0; i < formats_blob->length; i++) {
> > +			format =3D ((uint32_t *)formats_blob->data)[i];
> > +			// Skip zero or unknown formats
> > +			if (format =3D=3D 0 || strcmp(igt_format_str(format),
> > "invalid") =3D=3D 0) {
> > +				format =3D 0;
> > +				continue;
> > +			}
> > +			igt_debug("Supported writeback format: %s\n",
> > igt_format_str(format));
> > +			if (format =3D=3D data.format)
> > +				break;
> > +			format =3D 0;
> > +		}
> > +		drmModeFreePropertyBlob(formats_blob);
> > +	}
> > +	igt_assert_f(format, "Given format not supported\n");
> > +
> >  	fb_id =3D igt_create_fb(display->drm_fd, mode->hdisplay, mode-
> > >vdisplay,
> > -			      data.wb_fmt ? data.format :
> > DRM_FORMAT_XRGB8888,
> > +			      format,
> >  			      igt_fb_mod_to_tiling(0), &output_fb);
> >  	igt_require(fb_id > 0);
> >
> > @@ -583,7 +615,7 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> > opt_handler, NULL)
> >
> >  		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> >  				      mode.vdisplay,
> > -				      DRM_FORMAT_XRGB8888,
> > +				      get_format(&display),
> >  				      DRM_FORMAT_MOD_LINEAR,
> >  				      &input_fb);
> >  		igt_assert(fb_id >=3D 0);
> > --
> > 2.43.0

