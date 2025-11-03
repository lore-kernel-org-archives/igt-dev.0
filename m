Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3CECCFA06
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 10:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D47E10E3A8;
	Mon,  3 Nov 2025 10:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TItc4HmA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E422A10E3A5
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 10:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762165225; x=1793701225;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iH/E8JxgEYCS39ABwMCahAfYDC0zVlZla/9xiIOtBXU=;
 b=TItc4HmALNW5geLtz6w5B+MRDHoKKkW5vh8fZpAxqQxhwLth4YnEUBVz
 nZqiimBsCTvZrqXos1EtpPOBfExSTjBJ5M7KYVnT6TUP+OVjhjBO5e1kd
 Y3HV0Ixckj+tj+CdXLoZq4gr9plqbqMBG50rSWsdbu0Awcg3davi7XqiI
 wHOmLBg//zpdFRIDYmExqBjFFGZUgaOW5sz9fpC5qulreR0ZLEyo3Dlr8
 mSMsJPGiVencRjZZbZDyXEGW62ZR8ksdmF+lJ7VoGxvuyhvPCEFbaacJx
 KN+kOBUOVbxB+5Dz0bfolQMMeJPp/vcLg6uh0owbQYeYmbh4XnJR09O5i A==;
X-CSE-ConnectionGUID: YcllIO/mTVagKQv+HuUReg==
X-CSE-MsgGUID: N910Yhn/SamZ7XuIHnNINg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64387659"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="64387659"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:20:24 -0800
X-CSE-ConnectionGUID: FFqPNcMOSmec/gjT568aLQ==
X-CSE-MsgGUID: T6sVtwE/RO2nS/XNJxnK1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="224070736"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:20:24 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 02:20:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 02:20:24 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 02:20:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zr9j0k7Sp4Rd5CoXfBi5sZcw6HaVHWIV898+5pCskbURVvShXpp6oeVhtEyUjrOkRLWQEeJkfiGTqVhygFgfY8+fN868iC4jCf4MjEyMrAYeBtkUYncsmJXVgAGqiN0Rsqspruws92+e+dP3hupD15uXgK01Xn0jyI0eWAwnXoq5pMnIM7Xw4SOnayNaEEOebFoWtZHj7X+ccZdRpMFJNthNAep1xUgLuY+fbNywscwpanm/o1AHRqZTZgW2Gk88lsPBjpT0kISL0xXSd1akchDPaxD3eUvt0ZfGqxQs1WmLUioFpZkAMeR6QZ5krvTC6Tg12i+16YH87j66gL4SOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUsDNajfmVO0P0L4EoUhNi9sz5vFR1v170E4fA9dDQw=;
 b=yCVizBfq39IuzNrWtmeNHWjFUBGaCAN6Me4Tvxy/bhaybt7uIbrDI6i52RLHp7JZCWYbHsdaTy7T9nV2j/oGijVQ0IQsu8IqdQ6fCvyXKvQkTrR8uKUvap5QG1bkeMSm5gIqM24oZtG3JV5xrmd39nTeeU1zEAAQRPrW8fsRglB7XX10YbjV4feRBLvk3uULNDjVqp/JTW99U4xARSI31HAYGi6FkouQcnu9eZrHMAoy8Kh0Ya8kmMGmqxisfqO6PlHm97X0A6dmMfQAln4bmtByubLA2xDzGdW6L4YPZcIn0vWHQRm5VqEPeyWK3oA6U0Ey2wIdR1h6Jj8GWbIpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 10:19:00 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 10:19:00 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
Thread-Topic: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
Thread-Index: AQHcSpVMRtyK1IsNCUGeCp0+9ih0y7TgwRqA
Date: Mon, 3 Nov 2025 10:19:00 +0000
Message-ID: <CH3PR11MB8434BD6B791069E1740E89618DC7A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-16-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251031183555.1882721-16-niranjana.vishwanathapura@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM4PR11MB7205:EE_
x-ms-office365-filtering-correlation-id: 64f3a47f-c3b8-4720-a82a-08de1ac26809
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rST7Yb9fPqJh5f0e8eFx2BID3dYTm/CbcXSKQ3Wp5LRTuRxVokQOjOqCNrbC?=
 =?us-ascii?Q?QyOWbLX9Yymv/Ll33ffOtigA7CU/4OuieHZ5CFAwvBrZaNt6ofG2fGeaZW2n?=
 =?us-ascii?Q?5OGwdSvRIrPfmfv2XdiNIgx05ElXVXG+29P4fDNIukr7kFES40xD/GVrqQ/Z?=
 =?us-ascii?Q?Mhms2MDLZUCRPdTkVqV+Ts5eSGVDMAV9UbaRUGzVXfJn7L6mgJ3e74kdMQ7J?=
 =?us-ascii?Q?5g0YKhVzl4Aoozu4S4SWqWPV8apQgUWJ8Ys1QTMFVEVAnV1pbR+v6PWLqVJ0?=
 =?us-ascii?Q?0mOGMGCWirO0dQVfH8e1iepoon010CAgUQ58HBkvY9hWQutv6aTprxaWgrgm?=
 =?us-ascii?Q?srN5KpfjN02BnKr/XszenaLLp86s/LgdFOJmSdNy6kGus8VWMG8y5QSbxv1Y?=
 =?us-ascii?Q?RYoAOxAHM01EM1XjMdlMDk6KlhioCnmpUznd7zP7upHU2hzz4kgGqx1lT5oN?=
 =?us-ascii?Q?GUBM/QN26iiOlSRWnWYah5QBpzzNGeAwHgNokVX53gAGXP/SJCClJlPNBoGy?=
 =?us-ascii?Q?uDNdGyerr2W0Eg0Q7sGuO0lzU/Kk5cc4gHX8zW9zhlYrrIeXYkcwyABDCH6f?=
 =?us-ascii?Q?9Njk08ZYCysciUev0VR/8HZOJ+yh0aYfH2HiQ/l9z/OF1O/tZ2Gq5yDQuKB/?=
 =?us-ascii?Q?iVljCxA2LrCMdnja1cskd/jP+3wGRuAjDk5oPRB5z0sWi35ywoE6gMTrbxvs?=
 =?us-ascii?Q?k7VM2pLYNc6w8SrbsrLxPAI3OjaTcbGVuuNbOdYThQKVkh09Sp6j59v78sv8?=
 =?us-ascii?Q?Yi41WzluVnGVWXfH1vrfKrsXONDct+RF1gS26jUxU1i10r2Qjx0MJKjenzbE?=
 =?us-ascii?Q?cAuAHrmWxN6yI3d0YO0dY2KySQSD56oUbJvPEIT3gvqubtWCYun2UpZ4v1Ge?=
 =?us-ascii?Q?YTEbAolPXB0tcBkmO5k0w6QEZParfipnHRjEMuaDM0KM53WxcoCbDVp8R6jf?=
 =?us-ascii?Q?vrEhdETJap+Q/uZiZiNLLIBW4l78B/2aYODiQ3USVjjqed5+JhU1moStPtSF?=
 =?us-ascii?Q?dNGNkeyfOXj4h5uUmfYJ8niCpvcXmlQOtnmFuMicAPWFecRjaMxQRRFd8UYM?=
 =?us-ascii?Q?hq1Cn8iSyfb57LpJh0pRW+o42/HOkG0e61TFOpTvgk+hphhWBefMpyNuQEUV?=
 =?us-ascii?Q?OTmnz7VToLz8sTLUzpvNaaQjdON04QHVfLUQbTT9B4Vufcx9CnNxYrDejSdb?=
 =?us-ascii?Q?J5KBj2Zf9W3crBAERuFsAVTXytASwDNSJ5Ka+OdEd+DKQ2cfPR0bK7X7JyEb?=
 =?us-ascii?Q?OnnfLfbZciDo13jlgXQw8cNtdAkX18nzTNrBKZ6VEKnjbPiCC26LH3HBcncL?=
 =?us-ascii?Q?LE73o6Tw2oeZOtBytMpQ2N73+eDByO4V+jzPsL82KsVCqAsSGLyILGQY+TWm?=
 =?us-ascii?Q?tjEULD0z4LYg8r4oZq5g0P8EmWJON6UOYIAjHSq3ZLkqjutA2XqZ9eSyVVQR?=
 =?us-ascii?Q?xGL+YbaOYfqp5E2SG3jibgFL7BmHsYkxo5akL/18JzkOMiTVer/QNujakfBD?=
 =?us-ascii?Q?JSDG9QdkOL/Zzj308PlZXkB98Ep5A8Nwz1DU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JuwUzmRlj3dkG+3b79ZJdS/cPzq486G/44N+oc3uCaQ4RB5ZevYu3sBxw0kt?=
 =?us-ascii?Q?ELwUjAXzSGxg3bL6vShaIyVwWGfwa2g/GbV7r/j5OJGeecqWSSXS338aCBCz?=
 =?us-ascii?Q?3u6z0BbhmCsgs/IwQZU12Ma29KTWplcXlfUN70tueq4vFGpsU3Mi6COMy6Gt?=
 =?us-ascii?Q?qY0LceFw6K2j2AFeH5kxwbHc3Ap6jJD+J6w65puaT1SHVurQZGA3W+kfRvYe?=
 =?us-ascii?Q?n7S/g2F8IL3f6PW5nuIXtYWeO1PU6Hjje47CX9OvDuu7pxjQj968CWiqyF2K?=
 =?us-ascii?Q?yOM2lOB6kAgeOjtbfy8ZI51JRyuX/cyLH7UbfJhljQvn5hCF1f9LQIWBn6Uk?=
 =?us-ascii?Q?YdyzLZLtrncTkRCjJpzMoulf+filU1v/kV32drGx8FE2qswi8MFFNuGeAZU2?=
 =?us-ascii?Q?aMFsuc8dl/8xoF4dhwYQfLQOnxrprFEtOYEfvWG8OT1YoBL6CkwXNX2A+6Zz?=
 =?us-ascii?Q?taLBWCFcuydgIF+lW2upcfU5i3NAJuZzPzaNqQzAxoYz8qu1dOZetcvPnLGg?=
 =?us-ascii?Q?kscZFMN1/lREiSYbwa8isZLmmcYtARX55HH0LjonDd21PGVRWkuH4LPFtCnA?=
 =?us-ascii?Q?Cs70NMc9dJQfAqG0IzQHX2sVlTDTvza2+kZDnj0EqKveSMPgpQaXVEnUha52?=
 =?us-ascii?Q?PCBbApMK7aotMSHLndw9Jdf9QTJE6fgRbjs+ElVImLkJmK/gIzOUo65wcl8W?=
 =?us-ascii?Q?iIfTcCecHZlQP6cRXtEP/klXqz/FiJN9altOV62GfhPVA+7G36KwAlGbfB0n?=
 =?us-ascii?Q?e5i6K+jBQBR9hicqoCuaSFwvjhVsBjuBvdkxx+MvhMLpVapNPwSvTdcqyVIB?=
 =?us-ascii?Q?KrgX8GahhkQd9zVsVQiq2P9afT9onxZTjjYiM3p4s95lBlWAglXp9o7sinbn?=
 =?us-ascii?Q?61HpxuI+zw1y+wdKCUqXbHaJV1f37DU2JUablHMHW72vr04ClZUpgRUE5rOC?=
 =?us-ascii?Q?kAQOGxGKBkc0t/v6tF66kzFp7xeUCfK/cxpcDnhatMUDSFshhv+1vnyO4PHM?=
 =?us-ascii?Q?LgwQuelVd7W2T9WxzGHP0FMTKS/ZrOKE74Vx0D+gzV7uccLCbHKld3kO4WwD?=
 =?us-ascii?Q?xpHk0c07SoXkDPOhiAJFyyZ2QUNpzI8VotcL7gjZnrXRwV+BUzvS1kR94JQZ?=
 =?us-ascii?Q?qEdLGHfPY5RRDye/73GRsd1wVdgFRdraon6/ReXhKWyabF8uIUDzRibZRcPu?=
 =?us-ascii?Q?bEU/ucBst7ajbIjt+CVwW1n7+zM+5+p9L8gRKO7M9D4DLcpRYbW/8X7SQkJe?=
 =?us-ascii?Q?lMIO1U34XQtHh7avzBckuWzghhVgX7GKZg9N/DW26gqzjPS+jJBoVtrDW9uv?=
 =?us-ascii?Q?7LvlXi/JWAvAeBfKW1lDLX8g1h2N354kgnVEXa9ZZPovcKUF70o2fbMFuzfa?=
 =?us-ascii?Q?I64dF0u2dqSAe+uvBoIGcugkhaR8L7YWQh2K3dGaAZfTl6ObYdALns6o+zme?=
 =?us-ascii?Q?27XpkgX3dD7HOxCpijjJGZSxiogtILF+wu32cShaGEORQQFokNNLi3VsWtij?=
 =?us-ascii?Q?Wd9vxz/+K4Gx1lfKp8XEoMacup5MFEhHwr9UKkerjGTtsg83++u09mbgWl8q?=
 =?us-ascii?Q?NmKduu46bz4RhVRh82SuvPu+iHzr6Gj03GcKV7Ex+FFpy11IyC7lahcznOE7?=
 =?us-ascii?Q?9sdqM2pjK2XSbQ5uPWSqklr6v6oC4CyMaQJs2pHoW3/6uybMxLSEbaX/UUgl?=
 =?us-ascii?Q?PAn3fg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f3a47f-c3b8-4720-a82a-08de1ac26809
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 10:19:00.4017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fH9oQHUC+FN72u2ubawnnQadGRH9+V/jS2MkryPi1yjR9KwyOQugCZY5G1EKnsOseU03CumMLQfy9I7ZiETz6zg0G2p/3deJmlZrAT4TuiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Niranjana Vishwanathapura
> Sent: 01 November 2025 12:06 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
Name here need to be changed from xe_exec_multi_queue and same thing need t=
o be followed for patch 16.
>=20
> Validate intra queue group priority setting.
> Validate that a higher priority queue in a queue group can preempt the lo=
wer
> priority queue of the group.
>=20
> During a queue switch, the currently running queue is always switched out
> without regard to its priority.
> The priority is only a factor in determining which other queue of the gro=
up
> will be scheduled in.
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  tests/intel/xe_exec_multi_queue.c | 212
> ++++++++++++++++++++++++++++++
>  1 file changed, 212 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_multi_queue.c
> b/tests/intel/xe_exec_multi_queue.c
> index 7aa5acfdd..9cd4a7a16 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -13,15 +13,20 @@
>=20
>  #include "igt.h"
>  #include "xe_drm.h"
> +#include "igt_core.h"
>  #include "lib/igt_syncobj.h"
>=20
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> +#include "xe/xe_spin.h"
>=20
>  #define SIM_MULTIPLIER	100u
>=20
> +#define XE_EXEC_QUEUE_PRIORITY_LOW	0
>  #define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
>  #define XE_EXEC_QUEUE_PRIORITY_HIGH	2
> +#define XE_EXEC_QUEUE_PRIORITY_MAX	3
> +#define XE_EXEC_QUEUE_PRIORITY_N
> 	(XE_EXEC_QUEUE_PRIORITY_MAX * 2 + 1)
>=20
>  #define MAX_N_EXEC_QUEUES	64
>=20
> @@ -33,6 +38,7 @@
>  #define INVALIDATE		(0x1 << 5)
>  #define FAULT_MODE		(0x1 << 6)
>  #define SMEM			(0x1 << 7)
> +#define WAIT_MODE		(0x1 << 8)
>=20
>  #define MAX_INSTANCE 9
>=20
> @@ -210,6 +216,208 @@ test_sanity(int fd, int gt, int class)
>  	__test_sanity(fd, gt, class, true);
>  }
>=20
> +static void
> +__test_priority(int fd, struct drm_xe_engine_class_instance *eci,
> +		unsigned int flags)
> +{
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +	struct drm_xe_sync sync =3D {
> +		.type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value =3D USER_FENCE_VALUE,
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +	uint64_t vm_sync =3D 0, addr =3D 0x1a0000;
> +	uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N];
> +	struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N];
> +	uint32_t vm, num_queues, queue_priority_max, bo =3D 0;
> +	uint32_t start_order[XE_EXEC_QUEUE_PRIORITY_N] =3D { 0 };
> +	int64_t fence_timeout;
> +	size_t bo_size;
> +	/*
> +	 * Q1 - Q6 are used for the priority test.
> +	 * Q Priority =3D id % 3
> +	 * 	QID	Q1 Q2 Q3 Q4 Q5 Q6
> +	 * Priority	 1  2  0  1  2  0
> +	 * The Priority 1 and 0 are the same priority so hw should pick Q with
> priority: Q2, Q5, Q1, Q3, Q4, Q6
> +	 */
> +	int expect_order[] =3D {0,2,5,1,3,4,6};
> +	uint32_t already_in_order =3D 0;		// bitmask to record Q started
> info
> +	struct drm_xe_ext_set_property multi_queue =3D {
> +		.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> +		.value =3D DRM_XE_MULTI_GROUP_CREATE,
> +	};
> +	uint64_t ext =3D to_user_pointer(&multi_queue);
> +	int i, j, sleep_duration =3D 1;
> +	void *bo_map;
> +
> +	queue_priority_max =3D XE_EXEC_QUEUE_PRIORITY_MAX;
> +	num_queues =3D queue_priority_max * 2 + 1;
> +	igt_assert(num_queues <=3D XE_EXEC_QUEUE_PRIORITY_N);
> +	igt_assert(num_queues <=3D 31);
> +
> +	igt_debug("%s flags 0x%x eci %d:%d:%d\n", __func__, flags,
> eci[0].gt_id,
> +		 eci[0].engine_class, eci[0].engine_instance);
> +
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	bo_size =3D xe_bb_size(fd, sizeof(*spin[0]) * num_queues);
> +
> +	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id)=
,
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	bo_map =3D xe_bo_map(fd, bo, bo_size);
> +	for (i =3D 0; i < num_queues; i++)
> +		spin[i] =3D bo_map + i * sizeof(*spin[0]);
> +
> +	/* Use the default priority for Q0 because we are explicitly waiting fo=
r
> it below */
> +	exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext);
> +	multi_queue.value =3D exec_queues[0];
> +
> +	if (flags & DYN_PRIORITY) {
> +		for (i =3D 1; i < num_queues; i++)
> +			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> ext);
> +	} else {
> +		struct drm_xe_ext_set_property mq_priority =3D {
> +			.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +			.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> +		};
> +
> +		multi_queue.base.next_extension =3D
> to_user_pointer(&mq_priority);
> +
> +		/* Create secondary queues with increasing order of priority
> */
> +		for (i =3D 1; i < num_queues; i++) {
> +			mq_priority.value =3D i % queue_priority_max;
> +			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> ext);
> +		}
> +	}
> +
> +	sync.addr =3D to_user_pointer(&vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
> +
> +	fence_timeout =3D NSEC_PER_SEC * (igt_run_in_simulation() ?
> SIM_MULTIPLIER : 1);
> +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> fence_timeout);
> +	vm_sync =3D 0;
> +
> +	for (i =3D 0; i < num_queues; i++) {
> +		uint64_t spin_addr =3D addr + i * sizeof(struct xe_spin);
> +
> +		xe_spin_init_opts(spin[i], .addr =3D spin_addr, .preempt =3D
> true);
> +		sync.addr =3D spin_addr + (char *)&spin[i]->exec_sync - (char
> *)spin[i];
> +		exec.exec_queue_id =3D exec_queues[i];
> +		exec.address =3D spin_addr;
> +		xe_exec(fd, &exec);
> +
> +		/* Wait for job on Q0 to start, allow other queues to run to
> completion */
> +		if (!i)
> +			xe_spin_wait_started(spin[i]);
> +	}
> +
> +	/*
> +	 * Wait for jobs to get submitted to hardware.
> +	 * On simulation environment, we need longer wait
> +	 */
> +	if (igt_run_in_simulation())
> +		sleep_duration =3D 4;
> +	sleep(sleep_duration);
> +
> +	/*
> +	 * Expect the job on other queue to not get scheduled while the
> spinner
> +	 * on q0 is not waiting on preempt condition.
> +	 */
> +	for (i =3D 1; i < num_queues; i++)
> +		igt_assert(!xe_spin_started(spin[i]));
> +
> +	if (flags & DYN_PRIORITY) {
> +		/* Assign increasing order of priority for secondary queues */
> +		for (i =3D 1; i < num_queues; i++)
> +			xe_exec_queue_set_property(fd, exec_queues[i],
> +
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> +						   i % queue_priority_max);
> +
> +		/* Wait for priorities to take effect */
> +		sleep(sleep_duration);
> +	}
> +
> +	/*
> +	 * Trigger a queue switch by making the spinner on q0 to wait on
> preempt
> +	 * condition, allowing job on q1 to get scheduled and finish. When
> we end
> +	 * the spin[0], it triggers the CFEG to perform a queue priority
> arbitration
> +	 * rather than a full context switch out. Consequently, in both
> semaphore
> +	 * (WAIT_MODE) and non-semaphore scenarios, a priority check will
> occur.
> +	 */
> +	if (flags & WAIT_MODE)
> +		xe_spin_preempt_wait(spin[0]);
> +	else
> +		xe_spin_end(spin[0]);
> +
> +	/* Wait for jobs to get scheduled */
> +	i =3D 1;
> +	while (i < num_queues) {
> +		for (j =3D 1; j < num_queues; j++) {
> +			if (xe_spin_started(spin[j]) && ((already_in_order &
> (1 << j)) =3D=3D 0)) {
> +				start_order[i] =3D j;
> +				xe_spin_end(spin[j]);
> +				xe_wait_ufence(fd, &spin[j]->exec_sync,
> USER_FENCE_VALUE,
> +					       exec_queues[j], fence_timeout);
> +				already_in_order |=3D (1 << j);
> +				i++;
> +			}
> +		}
> +	}
> +
> +	/* While ending spinner on q0, bring it out of preempt wait */
> +	if (flags & WAIT_MODE) {
> +		xe_spin_end(spin[0]);
> +		xe_spin_preempt_nowait(spin[0]);
> +	}
> +	xe_wait_ufence(fd, &spin[0]->exec_sync, USER_FENCE_VALUE,
> +exec_queues[0], fence_timeout);
> +
> +	igt_debug("Order\t Actual\t Expect\n");
> +	for (i =3D 1, j =3D 0; i < num_queues; i++) {
> +		igt_debug("  %d\t  Q%d(%d)\t  Q%d(%d)\n",i, start_order[i],
> start_order[i] % queue_priority_max,
> +                         expect_order[i], expect_order[i] %
> +queue_priority_max);
> +
> +		/* The priority 0, 1 are the same, so we can skip the
> comparison */
> +		if (expect_order[i] % queue_priority_max <
> XE_EXEC_QUEUE_PRIORITY_HIGH &&
> +		    start_order[i] % queue_priority_max <
> XE_EXEC_QUEUE_PRIORITY_HIGH)
> +			continue;
> +
> +		if (start_order[i] % queue_priority_max !=3D expect_order[i] %
> queue_priority_max)
> +			j++;
> +	}
> +	igt_assert(j =3D=3D 0);
> +
> +	sync.addr =3D to_user_pointer(&vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
> +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> fence_timeout);
> +
> +	for (i =3D 0; i < num_queues; i++)
> +		xe_exec_queue_destroy(fd, exec_queues[i]);
> +
> +	munmap(bo_map, bo_size);
> +	gem_close(fd, bo);
> +
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/**
> + * SUBTEST: priority
> + * Description: Validate queue priority setting
> + * Test category: functionality test
> + */
> +static void
> +test_priority(int fd, struct drm_xe_engine_class_instance *eci) {
> +	__test_priority(fd, eci, 0);
> +	__test_priority(fd, eci, WAIT_MODE);
> +	__test_priority(fd, eci, DYN_PRIORITY);
> +	__test_priority(fd, eci, DYN_PRIORITY | WAIT_MODE); }
> +
>  static void
>  test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int
> num_placement,
>  		  int n_exec_queues, int n_execs, unsigned int flags) @@ -
> 708,6 +916,10 @@ igt_main
>  			xe_for_each_multi_queue_engine_class(class)
>  				test_exec_virtual(fd, gt, class);
>=20
> +	igt_subtest_f("priority")
> +		xe_for_each_multi_queue_engine(fd, hwe)
> +			test_priority(fd, hwe);
> +
>  	for (const struct section *s =3D sections; s->name; s++) {
>  		igt_subtest_f("one-queue-%s", s->name)
>  			xe_for_each_multi_queue_engine(fd, hwe)
> --
> 2.43.0

