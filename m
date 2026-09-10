Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7194EC79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 08:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CF410F380;
	Thu, 10 Sep 2026 08:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRrg0A0D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECDB10F380
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 08:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789030022; x=1820566022;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q+2r6L5lFaQohpDKxLT1gNxRXRrYwhcO8XkkuZJJsaI=;
 b=WRrg0A0Di+715P8QFhfmTs4zbsWZiFqgJUhln6fm0xAqlRZgg/3t6ptf
 woszqX9FqwvSde5WZJIgst2kazmQvmwSVTkP0CbkqVOvUY1hVhfAuzg8M
 q072dqNBHQxJH4LsGvbQa662sXwL6LXlZwl3+IJ+y1IN3t8/pbikBXPp4
 F7tKANMi4k5TXEiwheB772L9HHBbKPAA5idlXROmza8HkIoRg1+v9DAfb
 qC0QoR+ytGGFwkeW4XOo2Rh3tH38RNKUdy7L843g1rbv41595yrKdWYgJ
 i0rk6KzbSHSfWgt8XB6T7DrWx9BRNbRsfDA8PtpuDKkP3iT1he99er78H A==;
X-CSE-ConnectionGUID: qdvEu8/2RKuLNcVMUNTSvQ==
X-CSE-MsgGUID: 39SKEicIQpCs5EijWMqpXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93299768"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93299768"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 01:47:02 -0700
X-CSE-ConnectionGUID: VKJD3wHcSz+uuLA1zkfSpw==
X-CSE-MsgGUID: 6g3UVsG7Qt6xqwzCITA/fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="275345766"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 01:47:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 01:47:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 01:47:01 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 01:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZfnl9oTeBVxPRID/cQwVontrpxeMgBAzPDyR4uVsp63Q2CeTGnLekVqnNN3SIheL9xm2t1QQzVgZ076ngQOaXJsRTRWGCIUu0lQVh8Y7It1zulCiHrUzbzFamob4zN84TIR8eYwOG0x9YuNu29NL50ErTWO7q8DNjFJwsKjI6+TVHfdLbAg3zKsg3YRy55T7UkufNlhn1BtvSDKV90oZd6h1lCh3dPAPkBFtpuYh4V2txB5QCvsKrDLWC+V1CfM2NJEgWEmfY1r0y4M/Thgclz5mzPk+Nxkt4nqx+6hnI/fQrxxym0/dXbq6ZlTu8/x/osKgvgLhxZK2YTU5FQTkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MJkYz33GjJQbAHaIjxpSJyoq1OXpkPvSCIV7Mu6RI8=;
 b=NNvEc1geN+YxG/ysUiVEQkQnKu7yQO9wjwPvJ1O3ILSnZ6zmtOX/OHQmelpXFG/PpuyAPlnYBjceAvzOFJexcV4HSg2JZKhGjh6aq0XilIbJu8UXlyOCKk2SeRPErLJL6pe3NK2XS8HBLX8cAtR3X0oTHbtfKG81HIU6qOutnpB9zchMSmIYQKzoO0Ay4KP5JzuYOVH2sWLjV883BQjUSITWwIOzAo3ayryUwysM8+xhadDR94ORgWmA5AvXDVYG3mrSMTk3DSy1PWsxWoIPJVhpskR0V7D7ZEBjVWVP/lIQMd6R/lMxekYF6TGNRBqaM+qqmuN812JkGmJfbUjFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by PH0PR11MB5159.namprd11.prod.outlook.com (2603:10b6:510:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:46:58 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 08:46:58 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v6 3/3] tests/kms_vrr: Add CMRR fixed and video mode
 subtests
Thread-Topic: [PATCH i-g-t v6 3/3] tests/kms_vrr: Add CMRR fixed and video
 mode subtests
Thread-Index: AQHdPvEplQFRcV8stUaDPHcNW/a/kbbHgygg
Date: Thu, 10 Sep 2026 08:46:57 +0000
Message-ID: <IA1PR11MB63489CE89EB7F70C87500E2CB2BF2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260907174836.3159214-1-ramanaidu.naladala@intel.com>
 <20260907174836.3159214-4-ramanaidu.naladala@intel.com>
In-Reply-To: <20260907174836.3159214-4-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|PH0PR11MB5159:EE_
x-ms-office365-filtering-correlation-id: 935c9113-8311-42a4-353e-08df0f1812df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|3023799007|10067099003|11063799006|56012099006|4143699003|18092099006|22082099003|18002099003;
x-microsoft-antispam-message-info: Wbdmf7ds+0QKIl6/8A+TtoFYNYNpBzGLQCo1Tp8tzujoz3yiaMPDlUEC4586d1sl90D1t91DrwJueZQNoRZAG/2CL8SuuiROXHDATaO19r4asWeooueyZq6eJlgMxxBR1Zi0Ri4iVXKMdlUh0YiQHMxaFwKl6Tf/YHys94dGZw16aBIPAaAR9dubx+EfFBjQU1by3j6imNHeQtEHS6bGE6SJsdmfGyQpbkH2k4x9dTz4WZ7xLo94JCOW0YbrmIv+qjQQHI5P+5kSZDuVmT/OrOamPKqM07IiCwYDMv4j42G7+8HDAj0k8ah+Idl3METwUlZT9Xi74of74Zu4Vdyh7jh8CHs+MxxrupZhZ2OvGEHfduh/IFhqbYygvKXY/ORCXNaf+acLCAyiQumwfWI+y6MsBHsb3PhRL4kEJXUYYlSg/cEax9dY/cNl/RDKOwz9R1xxa6xel4h0rAKVYEFFjDkpNC4i44ctvom0+OQRlbgsz0Q9DE6tdHvcoTUmcY3z2Vv9KwU6NPZrLL4IGMbwO1cBs/ZHJXmapzykfq9di1NHr3T+KeydRvM1tWoR9nj94OYeoX4PL/EOS1jfRqkz9MYXOKoF37+qBIOsT4Fr0Exb+G72MI3XIgFn6A+mp6mKm1KPRGL9FwMsqC9zLwJzzmAI0BDW1ZUO1hxjryHZ63ETHoMQKINQpldPDgh9z0hg2xoRtkCa4NzxMM6FmK5ih7mo1ESyHrAQIc3FwAmO3IE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003)(18092099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MyWbNeNdgJlwEae8eHlwxVqB9grSEUewx+gBpvVaypdKep3ZkjCBF0KM6juJ?=
 =?us-ascii?Q?5Kk0LwlRKK55Vf+pf/P7KTO0kUDo0VEz9fJelHcx+YMbtjJHLMRzbmgpy9i2?=
 =?us-ascii?Q?W7tDc0RnNVW9J8dOeMiJFPX0eZ9t8EHWGzUeGSNOS2hwGeCiXsPFnrHFwM4J?=
 =?us-ascii?Q?H3M/oin6T1ncKN2ds3axLZCeuJe/B60yfaBbDTwgqPRvKgCBJyup7KWVP5kc?=
 =?us-ascii?Q?7Ibfv3jD9UqjDml1p8afd4f3RuUsHPOYxNMb7dQwpK1v3U3kNPMR/2oN0Pnc?=
 =?us-ascii?Q?qSN7AcFqfnuM1N92vuMTf9BFTNBFyWOXygck0xKrLVU4SFgnYk8wYsQ6o0j3?=
 =?us-ascii?Q?QbQIZjcFSzNsQXINRAzco4nKg6MNnksZxfpDlk6J9BShB3Uw4Yjh9bRRuvCv?=
 =?us-ascii?Q?lADgmkwcIVe68Ur/d3lLgSkf2uGdXM/ILM40Mdr1XRYTmfk3/uoqTHOCdg/L?=
 =?us-ascii?Q?XqNYtLyI+QSpOYy2FcVxrTxFonyG/wXiTCdUjG+FXc5d80Jm78kIz+2Ncjkh?=
 =?us-ascii?Q?s48qoOfTJ3D/PmawRqul//d8saWnI/KR81BVsUX+JSO5pUZuPSk79lQsXLOV?=
 =?us-ascii?Q?tyb7HHYTI3vo/Ako0lvsSNIPM96OIsnXZWsdEwEW8auUNXeNX4YzdzRyxX8B?=
 =?us-ascii?Q?Un45JMxgKYMxsK+xz1RQnoutaEkDqpzej+3z9pz+9OhZ6jBuBGd+VBcCRZ2N?=
 =?us-ascii?Q?OAdhQOEs0skLzIWosRCunyrBfZUup6PipbRSGa/EsMdoPUk1Mj/DnNbZ0iyc?=
 =?us-ascii?Q?1SC+ZmmpRQrUYjoUKp7+OZQxhHa8Bk3vQqhW1xx4oNsJalGEw7H1v0DMpcpJ?=
 =?us-ascii?Q?FPVoPZKTOgRrpSQPr8gCPPm7ZXtm67a3BDpDJFIqTCKcWzUG3mIokcMeIIRi?=
 =?us-ascii?Q?K9RgsN7J845j/Gn7qlYws73O4tJWFRJDgMs5tfyouH82bTY81Y3OcGovOPnq?=
 =?us-ascii?Q?xDGdkI+LoVEAf/BLVnybwprmigJTmr6s11jLTHtDTnUysYsTWeFVxjcpjdsQ?=
 =?us-ascii?Q?rFXJm7OEKTWWXDrxaaUblha87zw211tgYNFLtfLiU8w9JwTaK85su7NiTgGZ?=
 =?us-ascii?Q?7zIm/gecVAZipFm+y+4NJroaIDrpYSPVmqSPZlTViAJ6vX/TZlq+aZ2bAzo1?=
 =?us-ascii?Q?2GNggihaEFANUOCnIFXoZB2kcq9YOF6Q1L9mJWr+r/6be0s4p+pWLnDz+2fq?=
 =?us-ascii?Q?ZsXfRX90X9BtB9iuJUrcIxYA620sVarhotwWk+qwpVVU22fpxBHlZSEeR8oz?=
 =?us-ascii?Q?um1BmbPAe/Q9Sg/YtNSMGLN8FdjMZyFV7X2uDJbiUEs9VdXZedlQGpC2fa7l?=
 =?us-ascii?Q?MSoQkxFHWKa61/JnrXOckqHxhZnIIvA6YdLhJzfiJbhXS8kFrxU9dT/TEmtu?=
 =?us-ascii?Q?XorMS5r2+/oM73B+IcLbKwfw8FCJBmtWHIJzyvk0j+ipDjE0UCMp0CffUuuS?=
 =?us-ascii?Q?uQdARsAfybYBDF5nsOVsjk1nO4Gkkjz616DKBY+A8Egf+K/yA6ad4H17ViNT?=
 =?us-ascii?Q?6smAx0FPNegtrFwO/NzvkDca+uRrotZiieoSZ5ZxqEvxgR7cm5GjiEKV5ady?=
 =?us-ascii?Q?Iu4yUggc5seL4jSbZHIVmqmlC98qyYi2dNfqGQuK05yx6G/yrIHks6xS8Myv?=
 =?us-ascii?Q?ocxAQqePr9sX7FoqEJy9fCCyiYF6xX35QswQ7xKOsJQRlg+A6k7jrlgIO9nc?=
 =?us-ascii?Q?y/VScBLKUV4+tPk8oWJuxPsJ2+zBWt37APhgl+hRIJ+NiPjoEp0QtHwaerRo?=
 =?us-ascii?Q?Dv8EBs7XJgl8E2l3LqXZWsTChftdkv8qMj2x8y0U4YchtUprjozs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GFYHRZPsUoB5Vp8OMbN0+JwB8LFMmnidwbJ4JArOQ6GeUjNgEsg+q7/Fgtjg1E9t5sr48Akv6Zc40gqr3gR5bq/CZpZZ9uMu9YyOaRiUk41Z/vvPXti9Rk1L226n9qeEUUlKOthwo0YtHOpIFyPnMX475IoR7B55sgRXmdlV/J+w+5SkwfTBEZqScHpTFejQ5rQLqu8TKiTUiVjSOzEtlGe3H/MVktl91w0kBpp6DRh7ABfcB8XIQWnAcseBU63iGCpPnQXW07aoxnrSNlsyLJM7TIDHOASa2C9FuJsK571CQoTUIJtTaTcW9VeYWHGAXUuNhR+ODS8KOYxt3NE2xA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935c9113-8311-42a4-353e-08df0f1812df
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 08:46:58.0041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rYQUlP2CAdLRyn01lPjkTYv8jz+sggIf7y5bbf+Dh0kaQXISKpfPpftPd5gvtEGPgU4+LJhrQOSmhYZqSL+xN/gLn/Xn6aEyeODXUibZOlhqtnnoguGQ5ruxtxNSEJsK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5159
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: 07 September 2026 23:19
> To: igt-dev@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v6 3/3] tests/kms_vrr: Add CMRR fixed and video mod=
e
> subtests
>=20
> Add test coverage to validate Content Match Refresh Rate (CMRR) behavior
> across both fixed and video timing display modes.
>=20
> This introduces a shared helper library to support refresh-rate mode sele=
ction
> and parsing, along with two new test cases covering fixed-mode and video-
> mode scenarios.
>=20
> The new tests measure actual display refresh timing during CMRR operation
> and compare it against the expected target rate to verify correctness. Vi=
deo
> mode coverage validates behavior across standard video timing rates, whil=
e
> fixed mode coverage targets display modes that fall outside the standard
> video timing set.
>=20
> Each test cycles through the relevant refresh configurations, applying an=
d
> resetting the appropriate settings between measurement passes to ensure
> consistent and isolated test results.
>=20
> v2: Fix test issue.
> v3: Address review comments. (Mitul)
> v4: Fix test issue.
> v5: Address below review comments:
>     - Rename CMRR fixed/non-video mode references to desktop
>       mode. (Chaitanya)
>     - Factor out vblank timestamp/sequence retrieval into
>       helper. (Chaitanya)
>     - Simplify CMRR tests by extracting common mode logic. (Chaitanya,
>       Mitul)
>     - Refactor CMRR refresh-rate verification and frame filtering.
> v6: Address below review comments:
>     - Document skipped vblank intervals and fix seq_delta
>       format. (Chaitanya)
>     - Fix minor style issues in CMRR tests. (Chaitanya, Mitul)
>     - Add mode existence checks for CMRR test paths. (Chaitanya)
>=20
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 240
> ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 240 insertions(+)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 27f18e8d0..109b4629d
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -32,6 +32,7 @@
>  #include "igt_pm.h"
>  #include "igt_psr.h"
>  #include "i915/intel_drrs.h"
> +#include "igt_vrr.h"
>  #include "sw_sync.h"
>  #include <fcntl.h>
>  #include <signal.h>
> @@ -80,9 +81,22 @@
>   *
>   * SUBTEST: lobf-dc3co
>   * Description: Test DC3CO entry during LOBF.
> + *
> + * SUBTEST: cmrr-desktop-mode
> + * Description: Test to set a desktop mode CMRR target refresh rate and
> verify
> + *              it is correctly applied.
> + *
> + * SUBTEST: cmrr-video-mode
> + * Description: Test to set standard video timing refresh rates via CMRR
> + *              and verify each target rate is correctly applied.
>   */
>=20
>  #define NSECS_PER_SEC (1000000000ull)
> +#define CMRR_NUMERATOR 1000ULL
> +#define CMRR_DENOMINATOR 1000ULL
> +#define CMRR_VIDEO_MODE_DENOMINATOR 1001ULL #define
> +TARGET_RR_SAMP_COUNT 100 #define CMRR_RR_TOLERANCE_HZ 0.02

Please add clear justification for adding this number.=20

>=20
>  /*
>   * Each test measurement step runs for ~5 seconds.
> @@ -103,6 +117,14 @@ enum {
>  	TEST_LINK_OFF =3D 1 << 10,
>  	TEST_NEGATIVE =3D 1 << 11,
>  	TEST_FORCE_RR =3D 1 << 12,
> +	TEST_CMRR_DESKTOP_MODE =3D 1 << 13,
> +	TEST_CMRR_VIDEO_MODE =3D 1 << 14,
> +};
> +
> +enum {
> +	CMRR_VIDEO_MODE,
> +	CMRR_DESKTOP_MODE,
> +	CMRR_DISABLE,
>  };
>=20
>  enum {
> @@ -221,6 +243,38 @@ output_mode_with_maxrate(igt_output_t *output,
> unsigned int vrr_max)
>  	return mode;
>  }
>=20
> +/**
> + * get_mode_with_video_timing:
> + * @output: Display output containing connector mode list
> + * @fps: Requested integer refresh rate in Hz
> + * @matched_mode: Returned mode that matches @fps
> + *
> + * Find and return a connector mode that matches the requested
> + * video timing refresh rate in Hz.
> + *
> + * Returns: true when a mode is found, false otherwise  */
> +
> +static bool
> +get_mode_with_video_timing(igt_output_t *output, uint32_t fps,
> +			   drmModeModeInfo *matched_mode)
> +{
> +	drmModeConnectorPtr connector;
> +
> +	connector =3D output->config.connector;
> +	if (!connector)
> +		return false;
> +
> +	for (int i =3D 0; i < connector->count_modes; i++) {
> +		if (connector->modes[i].vrefresh =3D=3D fps) {
> +			*matched_mode =3D connector->modes[i];
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>  static drmModeModeInfo
>  low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)  {
> @@ -580,6 +634,177 @@ flip_and_measure(data_t *data, igt_output_t
> *output,
>  	return 0;
>  }
>=20
> +/* Measure and verify the effective refresh rate against the expected
> +CMRR target rate. */ static void flip_and_measure_target_rr(data_t
> +*data, igt_crtc_t *crtc,
> +			   double vrefresh, uint32_t cmrr_mode) {
> +	uint64_t last_vblank_ns, vblank_ns, frame_time_ns;
> +	uint64_t total_frame_time_ns =3D 0;
> +	uint32_t last_seq, seq, seq_delta;
> +	uint32_t err_frames =3D 0, valid_frames;
> +	double avg_frame_time_ns, avg_refresh_rate;
> +	double  expected_rr =3D 0;
> +	bool front =3D false;
> +	uint32_t i;
> +
> +	switch (cmrr_mode) {
> +	case CMRR_VIDEO_MODE:
> +		expected_rr =3D (vrefresh * CMRR_NUMERATOR) /
> +			      (double)CMRR_VIDEO_MODE_DENOMINATOR;
> +		break;
> +	case CMRR_DESKTOP_MODE:
> +		expected_rr =3D (vrefresh * CMRR_NUMERATOR) /
> +			      (double)CMRR_DENOMINATOR;
> +		break;
> +	case CMRR_DISABLE:
> +		expected_rr =3D vrefresh;
> +		break;
> +	default:
> +		igt_assert_f(0, "Invalid CMRR mode %u\n", cmrr_mode);
> +	}
> +
> +	do_flip(data, &data->fb[0]);
> +	(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> +	igt_wait_for_vblank_ts_seq(crtc, &last_vblank_ns, &last_seq);
> +
> +	for (i =3D 0; i < TARGET_RR_SAMP_COUNT; i++) {
> +		front =3D !front;
> +
> +		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
> +		igt_wait_for_vblank_ts_seq(crtc, &vblank_ns, &seq);
> +		(void)get_kernel_event_ns(data,
> DRM_EVENT_FLIP_COMPLETE);
> +
> +		frame_time_ns =3D vblank_ns - last_vblank_ns;
> +		seq_delta =3D seq - last_seq;
> +
> +		last_vblank_ns =3D vblank_ns;
> +		last_seq =3D seq;
> +
> +		/*
> +		 * Use only single-frame intervals. If delta > 1, one or
> +		 * more vblanks were missed, so the interval is not valid
> +		 * for calculating the average frame time.
> +		 */
> +		if (seq_delta !=3D 1) {
> +			igt_debug("vblank seq delta =3D %u\n", seq_delta);
> +			err_frames++;
> +			continue;
> +		}
> +
> +		total_frame_time_ns +=3D frame_time_ns;
> +	}
> +
> +	valid_frames =3D TARGET_RR_SAMP_COUNT - err_frames;
> +
> +	igt_assert_f(valid_frames >=3D 90,
> +		     "Valid frames below threshold (90): valid_frames=3D%u,
> err_frames=3D%u\n",
> +		     valid_frames, err_frames);
> +
> +	avg_frame_time_ns =3D (double)total_frame_time_ns / valid_frames;
> +	avg_refresh_rate =3D (double)NSECS_PER_SEC / avg_frame_time_ns;
> +
> +	igt_assert_f(fabs(avg_refresh_rate - expected_rr) <=3D
> CMRR_RR_TOLERANCE_HZ,
> +		     "CMRR refresh rate mismatch: measured avg_rr =3D %.3f Hz,
> "
> +		     "expected_rr =3D %.3f Hz\n",
> +		      avg_refresh_rate, expected_rr);
> +
> +	igt_info("Average RR (Hz): %.2f, Expected RR (Hz): %.2f, error frames =
=3D
> %u\n",
> +		 avg_refresh_rate, expected_rr, err_frames); }
> +
> +/**
> + * Programs the requested CMRR target refresh rate for @mode, verifies
> +that the measured
> + * refresh rate matches the expected CMRR behavior,then disables CMRR
> +and verifies that
> + * the refresh rate returns to the mode's nominal refresh rate. The
> +function asserts that
> + * all target refresh rate programming operations succeed.
> + */
> +static void
> +run_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> +	 const drmModeModeInfo *mode, uint32_t cmrr_mode) {
> +	uint32_t numerator, denominator;
> +	bool ret;
> +	double rr_from_mode =3D igt_vrr_mode_line_refresh_hz(mode);
> +
> +	switch (cmrr_mode) {
> +	case CMRR_VIDEO_MODE:
> +		numerator =3D mode->vrefresh * CMRR_NUMERATOR;
> +		denominator =3D CMRR_VIDEO_MODE_DENOMINATOR;
> +		break;
> +	case CMRR_DESKTOP_MODE:
> +		numerator =3D mode->vrefresh * CMRR_NUMERATOR;
> +		denominator =3D CMRR_DENOMINATOR;
> +		break;
> +	default:
> +		igt_assert_f(0, "Unsupported CMRR mode %u\n",
> +			     cmrr_mode);
> +	}
> +
> +	igt_output_override_mode(output, mode);
> +	igt_info("Override mode:");
> +	kmstest_dump_mode((drmModeModeInfo *)mode);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	ret =3D igt_vrr_target_rr_debugfs_write(data->drm_fd,
> +					      crtc->crtc_index,
> +					      numerator,
> +					      denominator);
> +	igt_assert_f(ret, "Failed to program CMRR target RR (%u/%u)\n",
> +		     numerator, denominator);
> +
> +	flip_and_measure_target_rr(data, crtc, mode->vrefresh, cmrr_mode);
> +
> +	ret =3D igt_vrr_target_rr_debugfs_write(data->drm_fd, crtc->crtc_index,
> +0, 0);
> +
> +	igt_assert_f(ret, "Failed to disable CMRR target RR\n");
> +
> +	flip_and_measure_target_rr(data, crtc, rr_from_mode,
> CMRR_DISABLE); }
> +
> +/* Validate CMRR behavior for supported video and desktop display
> +modes. */ static void test_cmrr(data_t *data, igt_crtc_t *crtc,
> +	       igt_output_t *output, uint32_t flags) {
> +	drmModeModeInfo mode;
> +	bool found =3D false;
> +	drmModeConnectorPtr connector =3D output->config.connector;
> +	uint32_t j;
> +
> +	igt_require_f(igt_vrr_target_refresh_rate_supported(data->drm_fd,
> crtc->crtc_index),
> +		      "CMRR not supported\n");
> +	prepare_test(data, output, crtc);
> +	set_vrr_on_crtc(data, crtc, true, false);
> +
> +	if (flags & TEST_CMRR_VIDEO_MODE) {
> +		found =3D false;
> +		for (j =3D 0; j < igt_vrr_standard_video_timing_fps_count; j++) {
> +			if (!get_mode_with_video_timing(output,
> +
> 	igt_vrr_standard_video_timing_fps[j],
> +							&mode))
> +				continue;
> +
> +			found =3D true;
> +			run_cmrr(data, crtc, output, &mode,
> CMRR_VIDEO_MODE);
> +		}
> +		igt_require_f(found, "No video mode found.\n");
> +	}
> +
> +	if (flags & TEST_CMRR_DESKTOP_MODE) {
> +		found =3D false;
> +		for (j =3D 0; j < connector->count_modes; j++) {
> +			mode =3D connector->modes[j];
> +			if (igt_vrr_mode_line_refresh_hz(&mode) -
> mode.vrefresh <=3D 0.04)

Any reason behind adding this number ?

Add justification for adding this number here ?

With these clear justification adding,

Changes LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

> +				continue;
> +
> +			found =3D true;
> +			run_cmrr(data, crtc, output, &mode,
> CMRR_DESKTOP_MODE);
> +		}
> +		igt_require_f(found, "No desktop mode found.\n");
> +	}
> +}
> +
>  /* Basic VRR flip functionality test - enable, measure, disable, measure=
 */
> static void  test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *out=
put, @@
> -591,6 +816,7 @@ test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t
> *output,
>  	uint64_t rate[] =3D {0};
>=20
>  	prepare_test(data, output, crtc);
> +
>  	range =3D data->range;
>  	vtest_ns =3D data->vtest_ns;
>  	rate[0] =3D vtest_ns.rate_ns;
> @@ -1147,6 +1373,20 @@ int igt_main_args("drs:", long_opts, help_str,
> opt_handler, &data)
>  		}
>  	}
>=20
> +	igt_subtest_group() {
> +		igt_fixture()
> +			igt_require_intel(data.drm_fd);
> +
> +		igt_describe("Test to validate CMRR in desktop mode.");
> +		igt_subtest_with_dynamic("cmrr-desktop-mode") {
> +			run_vrr_test(&data, test_cmrr,
> TEST_CMRR_DESKTOP_MODE);
> +		}
> +
> +		igt_describe("Test to validate CMRR in video mode.");
> +		igt_subtest_with_dynamic("cmrr-video-mode") {
> +			run_vrr_test(&data, test_cmrr,
> TEST_CMRR_VIDEO_MODE);
> +		}
> +	}
>  	igt_fixture() {
>  		close(data.debugfs_fd);
>  		igt_display_fini(&data.display);
> --
> 2.43.0

