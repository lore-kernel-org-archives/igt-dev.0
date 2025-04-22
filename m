Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5146C369D3
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 11:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6397010E579;
	Tue, 22 Apr 2025 11:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmxCXF6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4456E10E585
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745322963; x=1776858963;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+gntXFxIQFFevIao8nuop2oo/UGnEkUxvmLVi0hgFSc=;
 b=NmxCXF6zsrZqD9PvW9O/Uhi+D5UjxTi2AV4JWZdxquKhUmKV6aFWSfm7
 /YtqxnES03VOdrNsLirPFnpjxcftp4d8RIdBCBX4R3GZ0fqqOYBle16h1
 m9LqDzBUnsXtHQ0tkMPurU4qdA2Lb9usYdFoi093IUK55yowg8OTrr1QX
 kzPjx2hc/WyKWmtkAK9rkuzW3q8exd1JH00i7Yb8+t7QrRD6VCmQAUxeJ
 9iCxNYXKrO93dkH/oqWPO6ZG8AsYbfvZMBwg5TBQoysURGn79kN37Onu/
 e8UeRRQT6gi73wPITovolllOmi0yQ09bS9s0nitVpehPWXDavp5dAAnF7 A==;
X-CSE-ConnectionGUID: BplIHbyERp61ydiYnQJ9fA==
X-CSE-MsgGUID: ikt3u+RsScutpnvQntjn+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="58253467"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="58253467"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 04:56:03 -0700
X-CSE-ConnectionGUID: yLmOI2LqTJCNRGZu9bTyVA==
X-CSE-MsgGUID: rouAQoMPTUOSSgFDoUd5rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="136784301"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 04:56:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 04:56:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 04:56:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 04:56:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvXysE+jegMaO71L77nt2Fh8enGTtjo+iN6UzbzS4SblYrTb5vdf1kk7eJO1hJBKg6zs+b5gxiz+f9OgpAnPLC1A533Homd2Y67yET7ieq/aWQsfTQtAv5wzeGQMj/sC9PCzk03dxlc2J45iuvL8pOBHmqE/qIQzu/DtOCR42cZ7vWYGw+JWWx/AUGH2tldFMS3R71n+nGVINX0ihjpZDMG4yaD2poBmoN35GXKbU2sUEZdoY8Yvpu03T5mqLQq3I/e1Dj3BWVo1Kv7p/BYx9lzWIRMvTJzioyuRXEWXF60B+3zark580gfDvDpiKxE8q5fK+5NNbZGL7DCPfphyuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AM+wO6HRzpRzgXm4qg7+Cc0FYv94NBHjaZLf30Muzjo=;
 b=x1VJ2vMO2AWclCLN3lm5EEXEDdTPjSkmIW3sxdrRIvDRa6T0hjcyycvB64hBQtE0irKgTC/EuWgA+jLPZr5ki2UYFp9edyQ4UTRrdbeD/2oV2fIXr5K6UYCTbNP87eFOlJ4py4fLv5XjUKwN10CzRhy47Wyy/I9jQfD/LRkEt6tlRniaW4lu1mWKjNV1f2YEZ5crHU/v5i0TWaRyjxIOyrPEX60mrnKH8HQe+fv7jdJd6DFqk2iZ2o9TuXDGvr97lEG+TudtPwCga/h6RBUOP70gQ7LdjTTcSGklL/awEDFGYpaN+QifUAbCZHmUN1RdQRiSlNoIMYHtldA+IoBe5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9)
 by SA1PR11MB6807.namprd11.prod.outlook.com (2603:10b6:806:24e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 11:55:33 +0000
Received: from PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::dfc9:d5e9:2cd4:8d2]) by PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::dfc9:d5e9:2cd4:8d2%6]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 11:55:32 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH i-g-t 1/3] tests/intel: replace div64_u64_round_up() with
 DIV_ROUND_UP
Thread-Topic: [PATCH i-g-t 1/3] tests/intel: replace div64_u64_round_up() with
 DIV_ROUND_UP
Thread-Index: AQHbru0TpzZpFN4PcU+CtwiU1YvOq7Ovmpfg
Date: Tue, 22 Apr 2025 11:55:32 +0000
Message-ID: <PH7PR11MB581969C107B128AC133CBE6799BB2@PH7PR11MB5819.namprd11.prod.outlook.com>
References: <20250416163053.117425-1-shuicheng.lin@intel.com>
 <20250416163053.117425-2-shuicheng.lin@intel.com>
In-Reply-To: <20250416163053.117425-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5819:EE_|SA1PR11MB6807:EE_
x-ms-office365-filtering-correlation-id: c024f10e-97a6-43e5-2f4d-08dd819495d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?w0a+wILaxiDsSlok4NRMQkod2oPttkx5bu9SGKIZAuHUh0xUj2LJQvnkw/t1?=
 =?us-ascii?Q?aXIa7Sp5FShc8XbLd/auZb4KKhn28QFouHnL+LX9oDJFMHSc5erTj44Xn7dn?=
 =?us-ascii?Q?yPE0BGiVeuWlCWnJGJAgdsqA6mbloxLkWeSMnay9ZXiVQCpek4zkY69R8+j7?=
 =?us-ascii?Q?rAChS3AzV86mT2Jqs5k+JrSWSKCIau1NOsXg/w5u7xl95sN9FzeHkALWN962?=
 =?us-ascii?Q?lwJynLEgLFI6MsMELzddyPFowJpxhBJKfZ4+j/czDIenas782TWNzYwVAiBM?=
 =?us-ascii?Q?OfIwfM8nsDmkqJRlAZwQkMmKwH2s+dqGlyfDMD6nICg+AQ/7pl1JzwgkTCZz?=
 =?us-ascii?Q?u5XdFsfh+Nw7V8VWGRWQXlkh0YNfC5/AmfPoAoC+1OL8Pa+BKSlHViuAA2gI?=
 =?us-ascii?Q?owEdpdTRGVNTaZjza91Y2rh6G6q6CkPmtOW16nPOwk4C7l27E0cDxcCVWf7v?=
 =?us-ascii?Q?LFOwSf2IT4AZNK6pdH6vcQlBXrq14OTVbkPSGTJMttrv0vdl5/W3UlZXMY06?=
 =?us-ascii?Q?2Dh+r7OwG5zUZYVPsb8lkRq44dk6P97pTZDOt2nmWtWnqYMBzA9PArBnjk4f?=
 =?us-ascii?Q?Qe30IWL4um0ju957t8MJq4lVUiLi/tMnNp1C2V8C2pNb0i3tY5IxeFNj+56L?=
 =?us-ascii?Q?inUxM9V7wcstBi2GoIT2EuLJlrD3wvNcA+Yy6cqNlo8q5qssXM4K8U6L36oA?=
 =?us-ascii?Q?ov2QvoG0E/oQ4VmxBx30I2UldqA++IYAVZ/TuN2r1vQDWkSiWgDXTLcl7QcU?=
 =?us-ascii?Q?I4MmG1oBSEogXVW9j8Ekl92CCnfQPTvUrNWw/fmkQ80YzyEUf/8RhDLMjQqX?=
 =?us-ascii?Q?BOQ5fgJspHzHelZ6Tg2eLXJaQKviWF/36nthkckbGAp2vfia4b3TqKXLI0rz?=
 =?us-ascii?Q?gKghbRxczN1QEmdzR2sMhhvbUwl4rxaRAkg+IiTLrHfqpgimoRXm7maT/rTl?=
 =?us-ascii?Q?P3T0j/E2gXuO1O0G5RIUQqjBJQB758KddMldzwbKhiMWp/n31fSFeKIXYRFE?=
 =?us-ascii?Q?CqDVyafPCtYOsPvGA0zT8dkAdrYbdv6Pto+O/ut+21HE3bI7R/eAgheO1Gl9?=
 =?us-ascii?Q?Ydiob46UNAoLX/WYREAVtfDY5txo4jE+Qc6Zo5Pw8ekI76BepfJFhKhqqECh?=
 =?us-ascii?Q?Ty507VDOCqjvPzK3r0KxBSOBNHAJWWa7HhGRTu2vQim1l798Wb5xTF2h+FWx?=
 =?us-ascii?Q?WSGCyElfnoUmJDO19hQueZvU+7RahSER4Siz8bXu0L2vkSlLlmCgTgk70va1?=
 =?us-ascii?Q?5/785XdbZ7337I93kKK8Ckbv08vyFlACXwCh0Yqk+uQHv1KyF/Fsdoo9AzHO?=
 =?us-ascii?Q?4I5co8q41DalVTUeHEiXuwJKMkJ5xTz1f52Jxh91yB6fSrc2gLKVMW3lUU4M?=
 =?us-ascii?Q?2G2IrKSJ5TE7QeAbLPWqc6bq/9rHNnaNGldgpIwBbIPE9kimtlYfV3EQC7bw?=
 =?us-ascii?Q?6+bCnoQ9TF+LVaI6tUr+O3le4SdKqi4DIVEce+UnRLuf8k7NRz0+hCtfXf3j?=
 =?us-ascii?Q?NvkBd81ogbuC+KU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5819.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cD7vHNBBedSawrQUkNuf0274TXnljMtppDcUNZXc6KrdXK9YsbLU8X9MTmVR?=
 =?us-ascii?Q?O9SsrfazdmBL69oA7yBEb7+hYGZEXZ8lwJIxZT3Zc3oByIX2QKT9Bm0JGQ0B?=
 =?us-ascii?Q?QG1a9ELKJyfmVLvxu8vThOL1XrqOFLEhGkLy0Xe0txFZFtxxl74xjLez/h2/?=
 =?us-ascii?Q?K3CEJwtgza5PmWC3jcMx2+JH+6H1A10akPXQWaS4K8vwqdW2dvkJ3BIwyNBh?=
 =?us-ascii?Q?8MSzFKHw2DQ7WksQFzh5XPrXz9f3fFsRRs77Zfiws0kcNRQlMU/6zucpKYZo?=
 =?us-ascii?Q?R9oDoICDOAEz2wjsDdw3e/WSQ4h4SW3SebDUJGkY8KcQfeNjF3C9BUKDFESU?=
 =?us-ascii?Q?tjOEMPTfDw3T+oOnqeu4pzL585ZiodHJucX2LKLmoU4Y17Yvg0IbBM6v7f0/?=
 =?us-ascii?Q?ATArJlMoiHOFzClSgNWHJjt5ont3dcNtIQ8miGAZ/NRGnTPJLTLB1ZQRFDSt?=
 =?us-ascii?Q?9EOBdniTjUfvdE+uaMO0sz66cu6+pxIJYHCyCbBvoe5FKmUUwU1Vt1ICZS/Q?=
 =?us-ascii?Q?Y6zG6NZ1TJlmYNI2r6JRcQ4uBHVhYHys5vL2C8Xx76OvNJMvGSDX9GPDY+b3?=
 =?us-ascii?Q?b4LG1DIE53g3r3e75Ltpq1sF4CJvGCwkQhlBL25Vz64CR9QtBrGNZGsg/uip?=
 =?us-ascii?Q?K+IOPkeOVPKWqTWQ5OZb2BfjJLB6cB7vuPQ6p54PGVyAdUf3WAwfoCgVEEJ5?=
 =?us-ascii?Q?JZTT9nXzv5Aqj0gLadJns4a8salOxY7a6DqBDIb8pyYTUUmY5NHFkBiWyDH9?=
 =?us-ascii?Q?WqOBEBSusgLNDh1kNdxumLV4ar3WMQWtrlvjkkHIJsnTvUKTLF5bNL2RYZVs?=
 =?us-ascii?Q?xvymDL5/fLddJ8tP1qM8rdG4Q8gVUG5DP0s7mV8p60t3RrudGVeyNKU3dxGr?=
 =?us-ascii?Q?a2yx31em9e4bAo6RRR4R4msYFSnBIfLbZ7/3WUbjHEV2rIGjC07nk8/PL8hW?=
 =?us-ascii?Q?cLVlIEdjAb2V5iS5S0EaLkb1teaN4Y7E01FvEzzj/N4bgOFhHlDRawrS07ZE?=
 =?us-ascii?Q?PnyMmgqkfHGuxHhaCvlBVQ+rFegZVuhffN0LtGxOR/5t98WFhq3KEy16VRo7?=
 =?us-ascii?Q?WNsDEyuXcwhCtzN/ldX6P+U4WOa8hhpYcy+eiW3v3Mt7sTtPtO7V8IKV8GyH?=
 =?us-ascii?Q?7A/TmvtQgflSdcwWMhLxVN7/VU5Kfa+vn6C2vhRIRkoqm9tZUUCZnr8kXTrR?=
 =?us-ascii?Q?tU3ZbuEWg0OG5irVatzM5fjirGtt+cT90y1frpoP1LYGSklBA8OLllePKos+?=
 =?us-ascii?Q?sMMkB1M+5TQ37o1+Uxu2kIjBszd0dMwm3UykGRR5v9oygPPNIT50N5suksPd?=
 =?us-ascii?Q?fWYoS8h075xYMGSK+4iAxP02hrnYvYZYIEp6ZBA6qqhG+w1zEXLE4yFTW6YA?=
 =?us-ascii?Q?LX7+7S1oqxHYAPRQGJeUsJ9TgX2kq6Ej3pHtXWE+HZBF/Bdtsc5QA08kG8ej?=
 =?us-ascii?Q?ig9AyKxgkzVgH+MPbVPHMPtN+CwstWSnbjItlQNCDdsIr2ZQwxzWQZ/bO/q9?=
 =?us-ascii?Q?gmIhHhrTGMwSLcR9/pgqHE0CsMu18WoXz4fkSz2DJBpSOhJyc78AI7BGA5fb?=
 =?us-ascii?Q?E9SrJsrFUcWCgigELfN2r3TU10wq5QQGS7MN8ZT3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5819.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c024f10e-97a6-43e5-2f4d-08dd819495d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 11:55:32.4825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r3EAbzhOCRaYxICDKBN1VnWYbhCoyoYsfdCfRL4xsTQFXZiXajMJQmYQRJ2i0FD2llz7wytWBXcCpTEodvOilVNL9isvCZ5oR0mF0+Y1hvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6807
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

>DIV_ROUND_UP is defined in igt_aux.h with the same function as
>div64_u64_round_up().
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>---
> tests/intel/gem_exec_balancer.c |  9 ++-------
> tests/intel/gem_exec_fair.c     | 11 +++--------
> tests/intel/gem_exec_schedule.c |  9 ++-------
> tests/intel/gem_watchdog.c      |  9 ++-------
> 4 files changed, 9 insertions(+), 29 deletions(-)
>
>diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balanc=
er.c
>index 46ea19a2a..1ad87036b 100644
>--- a/tests/intel/gem_exec_balancer.c
>+++ b/tests/intel/gem_exec_balancer.c
>@@ -2636,15 +2636,10 @@ static int read_ctx_timestamp_frequency(int i915)
> 	return value;
> }
>=20
>-static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
>-{
>-	return (x + y - 1) / y;
>-}
>-
> static uint64_t ticks_to_ns(int i915, uint64_t ticks)
> {
>-	return div64_u64_round_up(ticks * NSEC_PER_SEC,
>-				  read_ctx_timestamp_frequency(i915));
>+	int f =3D read_ctx_timestamp_frequency(i915);

Personally, I'd use the end result type already, that is, use uint64_t, ins=
tead of int.
On the other hand, read_ctx_timestamp_frequency returns int, so what I've j=
ust said is just a minor nitpick.

>+	return DIV_ROUND_UP(ticks * NSEC_PER_SEC, f);
> }
>=20
> static void __fairslice(int i915,
>diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
>index 19df66921..cdceb8927 100644
>--- a/tests/intel/gem_exec_fair.c
>+++ b/tests/intel/gem_exec_fair.c
>@@ -187,23 +187,18 @@ static int read_timestamp_frequency(int i915)
> 	return value;
> }
>=20
>-static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
>-{
>-	return (x + y - 1) / y;
>-}
>-
> static uint64_t ns_to_ctx_ticks(int i915, uint64_t ns)
> {
> 	int f =3D read_timestamp_frequency(i915);
> 	if (intel_gen(intel_get_drm_devid(i915)) =3D=3D 11)
> 		f =3D 12500000; /* gen11!!! are you feeling alright? CTX vs CS */
>-	return div64_u64_round_up(ns * f, NSEC64);
>+	return DIV_ROUND_UP(ns * f, NSEC64);
> }
>=20
> static uint64_t ticks_to_ns(int i915, uint64_t ticks)
> {
>-	return div64_u64_round_up(ticks * NSEC64,
>-				  read_timestamp_frequency(i915));
>+	int f =3D read_timestamp_frequency(i915);
>+	return DIV_ROUND_UP(ticks * NSEC64, f);
> }
>=20
> static void delay(int i915,
>diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedu=
le.c
>index 84219b4cf..1055e8501 100644
>--- a/tests/intel/gem_exec_schedule.c
>+++ b/tests/intel/gem_exec_schedule.c
>@@ -3031,15 +3031,10 @@ static int read_timestamp_frequency(int i915)
> 	return value;
> }
>=20
>-static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
>-{
>-	return (x + y - 1) / y;
>-}
>-
> static uint64_t ticks_to_ns(int i915, uint64_t ticks)
> {
>-	return div64_u64_round_up(ticks * NSEC_PER_SEC,
>-				  read_timestamp_frequency(i915));
>+	int f =3D read_timestamp_frequency(i915);
>+	return DIV_ROUND_UP(ticks * NSEC_PER_SEC, f);
> }
>=20
> static int cmp_u32(const void *A, const void *B)
>diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
>index 1edde8b3c..4cb92c68e 100644
>--- a/tests/intel/gem_watchdog.c
>+++ b/tests/intel/gem_watchdog.c
>@@ -289,11 +289,6 @@ static unsigned int offset_in_page(void *addr)
> 	return (uintptr_t)addr & 4095;
> }
>=20
>-static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
>-{
>-	return (x + y - 1) / y;
>-}
>-
> static int read_timestamp_frequency(int i915)
> {
> 	int value =3D 0;
>@@ -307,8 +302,8 @@ static int read_timestamp_frequency(int i915)
>=20
> static uint64_t ns_to_ticks(int i915, uint64_t ns)
> {
>-	return div64_u64_round_up(ns * read_timestamp_frequency(i915),
>-				  NSEC_PER_SEC);
>+	int f =3D read_timestamp_frequency(i915);
>+	return DIV_ROUND_UP(ns * f, NSEC_PER_SEC);
> }
>=20
> static uint32_t __batch_create(int i915, uint32_t offset)
>--=20
>2.25.1

LGTM
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>

