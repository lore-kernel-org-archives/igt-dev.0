Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E63E8304A
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 04:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC62E10E4FC;
	Tue,  3 Feb 2026 04:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nfdu5oAN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FA610E4FC
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 04:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770092766; x=1801628766;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NlSfiLMwXCOIgA5ZO3U0A+iJZs5x66jVZHNFCEk1pwA=;
 b=Nfdu5oANvhbxAVUScXtCJaJ4vpI3by1s1wrpu+MQsACxBQK4eltp+Zh9
 z47YYU6i4yKuTkgSaT594gKJIZ54myWHZZITQXq0a8QGe9LFoiVudGLLH
 yW8dyVPSDKmLcFGp7SVpE7jClF0NcAqtLR4/SZ+rJU+/0BjO7NagPfsl8
 XdKQq1t0f5qU8dTOYLUBBncKPMQwTK1gwKijQk+2A9y7mENeLLIOLHfBf
 HGrZuSGi9fBaqC96P7tk4u6kIT/X+Zddjm4+TjGu2CVh/h+3WllePQhIx
 EFo3Bzt47c8Eit3AAVeTygAG6m6paTvWEPEJCTR5TThFo3HnBNVIRWMgn g==;
X-CSE-ConnectionGUID: d22UMLO8SeS4tMZBqFUwSA==
X-CSE-MsgGUID: MZMyCp0zRo2bdWRtvnr0Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81995046"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="81995046"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 20:26:05 -0800
X-CSE-ConnectionGUID: Lm/42r4VQAWE/zjcckufYQ==
X-CSE-MsgGUID: b/h5SY6+RVa/HuWKCOFN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209920826"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 20:26:05 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 20:26:04 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 20:26:04 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 20:26:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZoSHzOqQ9B3+9jnhxe+BpjqEmXpVhiPBCX95BN5WNmlszZs1LpvGZ8kKaehP0pSzRp78nDJCDgo5i95hl9ncWA14th74H0un7sZsHKMcwkKrPUKTx4UA5wdKhKY+iF9STU8YmE/E/Xbwu+8rJF3WomKz2H+WVyg9jUIboJb9YCGNwjPRlX2zGTtgHadihw6aoq5NIaBXLCTVyYgiIEScjyhRn9g+VtVqyShVgN0mTJ1n+gzfaB0JgdW9vgHja7IXu/XNGZrOTUCBTRwOhcJzZrSgW0ybBMG+a8Fkggmt93QO+VH3nQouj0/j8qFRLitcwUFZxdKelnHUUeSApUjIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKWB/swKM2O4lSTiysANnSQJMtgaM3xXOmziPLFN/T8=;
 b=pghsAic+bFP4++Z8/urWfOdi72uhJtHYFJPv/Ei0jswgitmnA5fihtXgrjdpWqLhNJgFnYblZ78e0zXq2CzS92Qh8IONZlpffq62CnJ9WJpiTTftkIO7IeN1hgDWGqQgDbJdsshjCLQOunTyrd4tDhxZ2O6EvPWZZ9HOfqB1tdn+WKRNayIfjGbfeEwc4ZeIp/pdmBHmwYZepbWzGlPLqSyFlcZvmG2rsIR5BJTlXkYFuPSUfv3yecH9Zcj5VRwlpaJvfDF3sxmXdn6Vz2jp9Wz0Ovj2iVwSTd4CCWLQYhJ6cNPWX7l75BIQQWYa03SC8QSuN75j/j3cJdV51e52JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH3PR11MB7937.namprd11.prod.outlook.com
 (2603:10b6:610:12c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 04:26:02 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 04:26:02 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Topic: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Index: AQHcj0MzLVgbULUVXkufqsvSmucSv7Vlri3QgAABYlCACTX1AIABhXYA
Date: Tue, 3 Feb 2026 04:26:02 +0000
Message-ID: <DM3PPF208195D8D6DAFF80908F58917CE84E39BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
 <20260127043233.254107-8-sowmiya.s@intel.com>
 <DM3PPF208195D8D473384C8865D18E79369E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <DM3PPF208195D8D791E83C84958C85F3423E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <PH7PR11MB6796A4DD3F1643D9DF673F17E59AA@PH7PR11MB6796.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6796A4DD3F1643D9DF673F17E59AA@PH7PR11MB6796.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH3PR11MB7937:EE_
x-ms-office365-filtering-correlation-id: c43b1c0d-f62d-4c69-d806-08de62dc571b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ndHBwEesfFVH66sKQT6JkwgpQy9GplGnu1okUzYi3H6pobwE0mAYWgfSdRs4?=
 =?us-ascii?Q?iYKx5f+aZx+s1EdaiYX4wIl+HDygM5bsMvwrKCjZXZTawxZmMxeIh04gCoNr?=
 =?us-ascii?Q?GxcT7P00ks288HVPQG+4Jr9MDVrP8uqKbh60loxSKCYMMkDMkMiFGx8kaHrb?=
 =?us-ascii?Q?U8Xivjoiho2QP9+kL+rr1oAsQ5Be8eHCoKguYSSUOhaPwrlaRjgAUtPMK/VM?=
 =?us-ascii?Q?KS71GqNQb0HJoj7PWjQqqI6VdAoabZ37si1uxdOvfN+hNPvqokzzc55NayT7?=
 =?us-ascii?Q?NAFysBeBl9Lt2Ww7D/wM07ZS9W5pzdu48HlQaTocTkGF51fvjpVXKTVxwbo4?=
 =?us-ascii?Q?J8M4+5Ht0afdU+fnaIaYl3BpU77rcKQF5vKpOS38rZYaB5DPjwciJZuSNIks?=
 =?us-ascii?Q?R4dYSpWRx+gjIAy8fNhMsN3W/XLhu3sn+WmLL7BLegtMtnX9eCWdSzhuZBuh?=
 =?us-ascii?Q?VT9830f8shZcOdNevMTzTcxVUHmXXr/wuja8Vu/0DFmdf/YXJ5kO986BarF9?=
 =?us-ascii?Q?uppxat0YobJtdCl9Ke593uw1/N3124pPlteTwoLdNtr48LLt+a7kH64hSaUE?=
 =?us-ascii?Q?dfIFEz/ZeoksRh4bljoJVFTfAH3YpFdyiLOoU6vXLs/w976PjaSPknlzijdV?=
 =?us-ascii?Q?aBGVv6XG3tgP+/iDLfAZj9G+FO93H9BnXU6evvKL/MhMcXt2Vamm2bxfAoZq?=
 =?us-ascii?Q?xaGSb/VWZU+dbnP2ms66MVxu6LnBJ+EkXB/b6FKFzqGmUh1ApHuo120SNBe2?=
 =?us-ascii?Q?aIrAOHQNoqSHAyK/pBUbnhDEfd6XeCyeS5wKl/Q+6vXub5k1iQ8h94nAY8gz?=
 =?us-ascii?Q?yRzGULswJ/pxvwlv4zxhMZbzKEckVdtOok08jje0l5XO0EHo57E6XBtWReFv?=
 =?us-ascii?Q?/YLGMvYm4NdUxTqPwndj99LEcrawX1c/o/kCbDTaGXGTfeux0I7t0k8WBEW+?=
 =?us-ascii?Q?RDpGmUyfp/hlrCvPMdnlt6aZOi6cfDgc3Iu+u5AhcX12LMhad6p/1z5tcCIl?=
 =?us-ascii?Q?RuzRrHLQvQYRDeYm8z2xkjFybL1UAe/jv0aGTb2AwrzgLcTAJRCP0dK4It27?=
 =?us-ascii?Q?KXCbth7htqzqqwcuHm0GgCxNvVnlE+nt6hEwvu+o3Lzs0k6RgwYblXLi9HG2?=
 =?us-ascii?Q?p4IktnEjz6BBrRwPUoyWKhbleog9zyAt//+WhOFGxc9PNwjUzKOE9FFBp16y?=
 =?us-ascii?Q?xSVXFFt0yxXFNhABXs7qIyGToA5q47xADrYC+/vUSyCE9fYrb+eu03r6qQqV?=
 =?us-ascii?Q?kXr2Nf/ehSGSvr5ft63xZ/FXSE/hZxUBrOKOfTq2fwgFMPN6bAC0JqVo86PF?=
 =?us-ascii?Q?m4YWkGVWarKdzXstp7rox6BDY5PpARgly1To3olF/al/NpIS+LxD+Duh/KGy?=
 =?us-ascii?Q?6yeJXAOKZ2twt9c/UenNgYEaBtx79MgcruFe1qtG3n51x9T5D8dSjcZTcbMW?=
 =?us-ascii?Q?pwEi4IZkM51UnopspgdA+1ITTvSmx71F9iFHncdnvy+KwRnlmmj1ia1vMcTO?=
 =?us-ascii?Q?wsIxth8hHvzQsk0lDQfoa9YBmdQqiiRpHA4IDjPORshi8XH75gmk5Q1ynmze?=
 =?us-ascii?Q?5kOvFv9PjjAvkB3hOcoG0wDeOXJoL/HeULmP9PJhCIFeR3l9wRuKX3y061Jy?=
 =?us-ascii?Q?ecsYN0Ufdz7OJsP1EkBoDDA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qn3HxqYwLD5qMxUcP9DnvOg0V/+kYPGlRNflQJkAEv0dljdbdOZOFPEAyrV+?=
 =?us-ascii?Q?SJL8ezcvrWmht7KeSapzFixjmIWKNql4XbAxNc3Pilk4LCNyzwwoqd0N/QpR?=
 =?us-ascii?Q?2hHzC03eA9wQ/c2qFKWl0bBqCligXPfw3lLFI3YQVTZNcYYBImK1XeA/0H6B?=
 =?us-ascii?Q?kY/AuRWm48t/GoQlJQA0WA8ktTPQuDS3oIrQCaGOryLHESCM6TfzEE+Z5bEe?=
 =?us-ascii?Q?GFi9wTfcC0pFT8udK9Fb4atz5O0b9K+9Q9ym47NRQ2zSWNbOaELlCTgimjEC?=
 =?us-ascii?Q?jvhQg5UnQGYcbac3PwKTVBgnTD97E/hAZMSB0iYbcpAkax1FfAwIjR9rZm4m?=
 =?us-ascii?Q?yp6zK4BZn4RDkCC7bUwJEsAPDZp/7xcGaCujqC74LAt5mzybszqxjiIKObC3?=
 =?us-ascii?Q?syWQI/nO11jOrcTitvJKgMPLlai6SGv8wyynuNheD4D4DPEoy1VjsDlAUTb4?=
 =?us-ascii?Q?debIpbliHp3aLsOULfyVHG3653CeffDE30fFKlOqK6r7cUiotn5TDn4tKyoS?=
 =?us-ascii?Q?GjdmaR/xejMP05Um9CnhTPznhhrg1zJJJbY8GNUOE9LoP8zGAdgkCeja+Yui?=
 =?us-ascii?Q?W5VNG8Rf4uAhqs620l4Q3m0PtE5v1nnOfCSQWn+cwmD2dC4z06s85Aiy61sG?=
 =?us-ascii?Q?d74bkwADsJqSuzvp6ZRKW0blXl2VKY0PACdHNPrUY1lcRBx+xWfS+EvQZdmc?=
 =?us-ascii?Q?0nzMCOwaPN5Ax2dbvcMZ7PZCnxEsGKvLTizVq3Vd7FQnozFnJajKlGnWhkBx?=
 =?us-ascii?Q?lSGP06ukRCjIyWUqa5u7+KcLuGdkXvy6HLN8LxAJwiFLMn1ifAuQ0n0PlzWd?=
 =?us-ascii?Q?AsqPg0navuwEUQYio5LXCTX2QVAK8a0PMvyU53QTSzfqGFOntqhSV9nuunc4?=
 =?us-ascii?Q?E8DD8c/kBonbYX7pEOey4MzIFasuh/rB5JrmBCIc9ExCl0ms5aU9mWkLq1un?=
 =?us-ascii?Q?UIWdop3OsDy00e+fkU+WQqAgvzKaolXWex6QKER5kVE/DvnkgbAC2YTl9pxC?=
 =?us-ascii?Q?gx+kLvRS7Xyvur8cvO97a9aAPKl9qTrsF3tYcUtFaCccMwljWTag40moFzOI?=
 =?us-ascii?Q?CXXLIIzRkjw+xFxuox4CUl+lKQMdNF4XuPhN2DT7oxaYDxgX4nudg3VNGAmo?=
 =?us-ascii?Q?84iOAGJd4EY8usz3fwcWlo66a/owCYPzXbt510kLe4yR8s4N979QpgV6KZCO?=
 =?us-ascii?Q?f2gQ7DcJfxmnf1CS7lZRGRK43d84Sy/xgyNPe/kXnHSDCBe8IyxU4za0CWcz?=
 =?us-ascii?Q?rejJ/fdknhWOnAvSv+K20PxaLttnwDA2wBKNu2gtQQVDeV3AiXycYrd5NZuB?=
 =?us-ascii?Q?CyGigJRejAXiV445rphpqwOT+l7QT2zA9ytEwX6q8jtEsO1eEcYZD9G/H8rR?=
 =?us-ascii?Q?+yuQXcaFTwir5ZcGSciIVwBtcaTc8qeaWo3RROzVhOb5ryc2fytFFKWrF7OM?=
 =?us-ascii?Q?DnQFnWcsTTB8+VI5bVxCWICEq/SQ6JDckTb5JY7zuuzuvMUoxp4p/uJNTx0p?=
 =?us-ascii?Q?JZIn5LzuhjgqU3oP/G5YwRoF30L1wvOKN682et9/x1R0wTpFRxR43iPzo34g?=
 =?us-ascii?Q?tGCtft9UbXLY1184sITdMcFpUNjx/hfa9+m9AYeN62+562k6JhTpAuLniQf3?=
 =?us-ascii?Q?wspJGT3dlL3ASKvEnXGXYb6yuVf1wsEXIEg7Yt963Txx2nExsTzxCyZ1i3yM?=
 =?us-ascii?Q?azQR420tmxFjWQCATU2nP312XESvzpm2vePzA8qcvKQazcL5prG/CWB20+qw?=
 =?us-ascii?Q?51Hvm9v5jg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43b1c0d-f62d-4c69-d806-08de62dc571b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 04:26:02.6446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CiReBitKPuvuxdYaSvF51i7ReStkh/qOCbHyyZyMun36mw8n83PZM0LwlW5YcSRtAGMt+l1GM6ciDBPwKEoBLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
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



> -----Original Message-----
> From: S, Sowmiya <sowmiya.s@intel.com>
> Sent: Monday, February 2, 2026 10:39 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> invalid_fb parameter
>=20
> Hi Suraj,
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: 27 January 2026 14:00
> > To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> > Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> > Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> > invalid_fb parameter
> >
> > > Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> > > invalid_fb parameter
> > >
> > > > Subject: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> > > > invalid_fb parameter
> > > >
> > > > Remove the invalid_fb/output_fb parameter since it is not used
> > > > anywhere in the test. Reuse the fixture's input_fb for both 8-bit
> > > > and 10-bit formats to simplify the setup.
> > > >
> > > > v7: Remove invalid_fb in a separate patch as per review (Suraj)
> > > >
> > > > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > > > ---
> > > >  tests/kms_writeback.c | 12 ++----------
> > > >  1 file changed, 2 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > > > 58118b8da..8d5bf5294 100644
> > > > --- a/tests/kms_writeback.c
> > > > +++ b/tests/kms_writeback.c
> > > > @@ -297,7 +297,7 @@ static void
> > > > test_invalid_parameters(igt_output_t
> > > > *output, igt_fb_t *valid_fb, ig
> > > >  	}
> > > >  }
> > > >
> > > > -static void writeback_fb_id(igt_output_t *output, igt_fb_t
> > > > *valid_fb, igt_fb_t
> > > > *invalid_fb)
> > > > +static void writeback_fb_id(igt_output_t *output, igt_fb_t
> > > > +*valid_fb)
> > > >  {
> > > >
> > > >  	int ret;
> > > > @@ -706,19 +706,11 @@ int igt_main_args("b:c:f:dl", long_options,
> > > > help_str, opt_handler, NULL)
> > > >  			    (!strstr(igt_format_str(test_format), "BGR")))
> > > >  				continue;
> > > >  			igt_dynamic_f("writeback-fb-id-%s",
> > > > igt_format_str(test_format)) {
> > > > -				igt_fb_t output_fb;
> > > > -
> > > > -				fb_id =3D igt_create_fb(display.drm_fd,
> > > > mode.hdisplay, mode.vdisplay,
> > > > -
> > > > get_default_fb_format(&display, bpc),
> > > > -						      igt_fb_mod_to_tiling(0),
> > > > -						      &output_fb);
> > > > -
> > >
> > > Why delete these lines this patch is simply supposed to remove the
> > > param invalid_fb since no one uses this All these deletions go in
> > > the next patch
> >
> > Actually not the next patch but the previous patch and this patch need
> > to move before the 6th patch
> >
> Before 6th patch we have 2 subtests for writeback-fb-id, so refactor the =
test
> and then removing the invalid_fb seems to be an ideal way.
>=20

Actually invalid_fb is not used ever even without your patch series so move=
 this patch before the 6th patch
Also side note add a regards and your name after your reply so one can foll=
ow who replied by looking at that without having to
Look at the above mail chain. It becomes really difficult if there are mult=
iple replies with multiple people.


Regards,
Suraj Kandpal

> > Regards,
> > Suraj Kandpal
> >
> > >
> > > Regards,
> > > Suraj Kandpal
> > >
> > > >  				igt_skip_on(data.dump_check ||
> data.list_modes);
> > > >  				igt_skip_on_f(!(data.supported_colors & (1 <<
> > > i)),
> > > >  					      "DRM_FORMAT_%s is not
> > > > supported\n",
> > > >  					      igt_format_str(test_format));
> > > > -				writeback_fb_id(output, &input_fb,
> > > > &output_fb);
> > > > -				igt_remove_fb(display.drm_fd, &output_fb);
> > > > +				writeback_fb_id(output, (bpc =3D=3D 8) ?
> > > > &input_fb : &input_fb_10bit);
> > > >  			}
> > > >  		}
> > > >  	}
> > > > --
> > > > 2.43.0

