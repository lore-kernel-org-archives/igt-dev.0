Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B971D637D1
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 23:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C9510E258;
	Wed, 13 Nov 2024 23:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXX7wKLM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DDA10E258
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 23:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731540392; x=1763076392;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=tw/9c9COHCdEoUwn08rzULMpeaJ4tfa0H9TjQNBwKMA=;
 b=HXX7wKLM+h8wgCart5RgrHRBZpJh3nldnZw8CEaXMrvxcmVCeJQfE9nv
 jwIueMMcpWmOHu+IuCYZrfjHcwEtbqNaLJ9iVtt97unLVo4f7X0Tn674x
 VscAwo60Ij/+gFxDLwyvmabPATOomM7YP4k5xMfP1EwUiLQXfP7DFef/m
 xUbf7LcIPLnYYUXWu4ZmW6OqVMz8lOUD8DSW/5FXJh2aw7lulHFIgcHvQ
 Cxl6j5o5hgivJHvykRwW9BiZFQOGuIr6amoSA34pCsLifYzvYCGAYlvVP
 MyquX73R3KbFkTXe1ebql2A0BtZJxyMVc5c4PBTLh5343/EqF/20wJrdQ Q==;
X-CSE-ConnectionGUID: AuVPTiCXRW2789D5w5JlYA==
X-CSE-MsgGUID: C96LvQ+uRkShtuyWWKqd2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="31563155"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="31563155"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:26:31 -0800
X-CSE-ConnectionGUID: /1X7tnYOTMuEdOake9vOig==
X-CSE-MsgGUID: F2uPCpdLQXq285mybvRmlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="93077500"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 15:26:31 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 15:26:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 15:26:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 15:26:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vp0T833qR1oh9bMQ7CpYJURSKIqq1jLGopqO/42X/GWBqOY8XO6JLyP7pCJHzmCvVpH3xlUpaJA/CWo9uGtYApfuzgYt1OPJyL/+L1tOFElpwCXZ+N4QTV+BeJbrZc5SwHMcfqSmwLjGtab7TcNLUtkDH6/VB4UvIjo+Fj7bcOYSwBQyXFtdPZRevvNVsyWaWzdAzQFPUhyuNPF+/EfKUL+VN4L5QYG0A3L21sVgwvFQVSIM6cMOeRgtP3BK4ZMNqEQWYjgLYvldHC/DQCwwewyU20tRrqG+383Lj7USSFS9jdu6fR0jodg9Tip6N9SE78jx11Db5uuIUGyp3t3F+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tw/9c9COHCdEoUwn08rzULMpeaJ4tfa0H9TjQNBwKMA=;
 b=Fyz39V5VOLTiU7V/3PsgSbJsq6GBRTmfTfMxLSczX6cKtNfEh/Pw1ShM/RYjNE5oWCzGLaW9vVr+1LUxcuC2hEvXQq/Gxv1SBZRyrWU+40RQ+7Tg1tPL8DEFCZqjWIohclq0hbX2wmmoGwOkHZnNhYvZfdNKGUEuVOVbzD/vcOE+UdwtIQ1rtQrJBDr6zdyJYtmTkCwd7kC3KEirNn4xSx1EPuOHDNNSunCLW20z1sFNRokuw1abCWGW3ZFK8xquiO77snRoRQG/lS2SqSNNTfyiW0xwBpJ8PaSsiLSaK09SZiIWizNvHt6Gn+ehGabgcjqRgcgQuR5sumDpXXxCTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH0PR11MB8192.namprd11.prod.outlook.com (2603:10b6:610:191::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 23:26:28 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%6]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 23:26:28 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 1/1] tests/intel/xe_exec_capture: Add
 xe_exec_capture test
Thread-Topic: [PATCH i-g-t v4 1/1] tests/intel/xe_exec_capture: Add
 xe_exec_capture test
Thread-Index: AQHbJKAwRZeOQB+rLUSti19LYcdEBbK1/auA
Date: Wed, 13 Nov 2024 23:26:28 +0000
Message-ID: <1835cf617c0b4dd6816b14163bad1de74321910f.camel@intel.com>
References: <20241022163324.383145-1-zhanjun.dong@intel.com>
 <20241022163324.383145-2-zhanjun.dong@intel.com>
In-Reply-To: <20241022163324.383145-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH0PR11MB8192:EE_
x-ms-office365-filtering-correlation-id: ddd329de-5616-46de-7ba4-08dd043a997b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R1VucktaQzRJSEYvZy9pb1YyaGxPR0htUnhqZldOUjJEWkxZd3k0Q3cyK1Nv?=
 =?utf-8?B?NnZmOUtHUkRObStoTkdMMWhWcTRUNzFXYzlNQy8wV1VUb1FxaEU0U1VtSjZm?=
 =?utf-8?B?dHFKRkRqRXBjMUdkTTlEL3FIMzdmeDJyWUY3OXFUcFVCdnJ3ZTF2V1hCYlZ6?=
 =?utf-8?B?SGlZM3lHbS9mOGRCUGo1algzUDZMODErWkl0YVk5TldqaW1ibVVweUpoZDFp?=
 =?utf-8?B?RXZENjhDUG15bWVxcDBkcmFaSEY0SzFiSlBDUDNNZnNOUllmR1drallGQVhF?=
 =?utf-8?B?UWJhL3I2M0lKVm4zdWV6d2FPQUFpaEF5L2VaamlRUTRKSXVPeXNlZ1grSWVn?=
 =?utf-8?B?OVQ0VlJEbXl4N0FIYm8xMktFRE0rbjU0TmRwRU44aFI4Y29MRi9RNW5vd0tE?=
 =?utf-8?B?bXJ2czhqdjZpVXIzb2dJbWorWWJ0eFlmbXU5QWo2dzNuVWp0cFg3M0hRVi9z?=
 =?utf-8?B?RDI0Q2hVYTNJWVRGakhvQ0p2bzhNNU1iMnlGYXkxb0lNd0ViOEt5bHhnNlBr?=
 =?utf-8?B?OUhYVVVTOE5TQzFXbm1BYXBEOW13Qm5BOVVVRVZCT3lsZ1dLR3hKTlcvZFFo?=
 =?utf-8?B?ZVlEOWFieTBWaXYwVXhhN2ZGVVNobDVKZmkxLzd4ZmVFVjg2eW1Zd0dqWjdY?=
 =?utf-8?B?ME9RdFZySzJIQlJlYjdEZWVkZjlVY1lZOXNJaWNBV2hySnlEY09UVmRuOXp6?=
 =?utf-8?B?UHVCSTRSS3hKczFJcWJMVko3VG95Z0tNZVpCYVJqSXhRZ0pCVFlHalFsU1Jo?=
 =?utf-8?B?YmZoVWd6d0NQeGtJbHBVYlFaRXJPRGRyUkswbDhJemdBdkxmT3habEIyNTl3?=
 =?utf-8?B?ZE1XR1dwT004ZGVNODVtZC9yVDJrRjllVWhPeDh0VTl6TGZYODNNS0huZ2ZE?=
 =?utf-8?B?cnc2ZGtDd1Y2TDk1dmVOSlJ4VnRRNCtRd2lZbDg4aVFVdGNuR0djRi9iMkFn?=
 =?utf-8?B?NGhBYy9McWRDMm5UN0JCVi9GQWpDdWJHM3FaV0VQOEs0OUxINjZjQ3Z6bk8x?=
 =?utf-8?B?d001ZEdHbUZzL0EyeHdhTkx2WDFORXE5dzk1ZGxUTGcvalkvdWdwSE4zdnpQ?=
 =?utf-8?B?VTVlWFFaVEw5a0lYSm1TaXM2TkNpdHRSZDA2RFI4ZmdLN0xqU1ZmUklGR01F?=
 =?utf-8?B?QkFuZDZ1Mk1yZlNOYmtNUEhLRldjUms1V0x1amdzNFhLZWQyc2VhT3pmcEg4?=
 =?utf-8?B?VGhDWlFER0RqK0lNcUN1S21HY0Era0hCQWQ5RU5wdkd6MlBMZXc3ZG9HaXow?=
 =?utf-8?B?WjE3cW53QnZDUkNnL291cGNxcURpT1N5QmZzQ09QcDNyeTlVK05LNTlSUlhi?=
 =?utf-8?B?c3hlcVZvRUFoeGRlbnFEMndYTXlFYmIxQ0tteUc3d2UwbnBzc1ZwY0E4d1ZY?=
 =?utf-8?B?UHNWSnBsT3ZTeUNjMzFvZzZ4UWVHdmlabDh3U3dRcC9yK0p5c1hWbno2MldR?=
 =?utf-8?B?eittaUczWExKc21GVFVmZjkxVnJJTVFuNzlkdEUwaThLdVQrUk1JQUV5Sk05?=
 =?utf-8?B?ZnpmWENwUlJ1VXZMSUc3TkRyWnBsNVgzeldpM1dFNzJKMG9qZXd6NWtSajFX?=
 =?utf-8?B?Rm5pZzMzK3JMcnJSMXRxU3J5QXdkTlZmSnd1SmkxT1A0NmFtTXptTHFLRFJa?=
 =?utf-8?B?aGMvbm45TXF0WFRWUVIyNzZCVEMzUG1UT1hVQjBaUEFxQlh3eUFWSEhuYW5q?=
 =?utf-8?B?TjJwdFlQbm9EYnV5ODFST25QRWNOblhwa3Y0QnFKOExqSWUyR0tvSTFaUGN3?=
 =?utf-8?B?Y1BhNlNUNk1nZ0tLbzFoMnBlbGRSNjRERkdXajR5UytwMzcyb3JmMmpzKzlP?=
 =?utf-8?Q?BwOm251/qHz4n3SQrILRVKej+Ok7d/z+3TzQM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzlKNlhEQy9mWUdVZ2tBRDF6VEVPdjllejZIa0d0Vm1oVGl3RTVXbFR4YVFD?=
 =?utf-8?B?OEI1UGlqYUI3RlBERzNma2dOMTZ3Ly9hMGxTek9sU2JvWE56TkdzTmFWc0dQ?=
 =?utf-8?B?emVmbXZtRitkcGRuc2hBSEdVNCs2amJDaHZVSHZ6am0va2Z3cUxKdW9ldTlm?=
 =?utf-8?B?ZEM2MWd0ZTFrWGE5aHRRUVF4bTRyL0tKOEplajRpWGJmKzdTYkVxZ1JTb2RG?=
 =?utf-8?B?OTNPTlBBL0kxNjVIL0ovakd0ZWZZL3VBQkptcFN4RTNkODE1NWdGVmxtdkJw?=
 =?utf-8?B?MDBNVU1hdUVOanVWb3ZJZ0tVQm11ajkrZnV2Y0pYbEZ0Y1Q4NXJjNWZYN1Nq?=
 =?utf-8?B?NFRSUlhWN2lRUWtuWHEyUGFsdk5ON2VnVENLK00wNGJDMVI2eFhNN0RUVm1B?=
 =?utf-8?B?SEl2VllsVVg4QU1Rc2ZGN3dlM0x3NW41SDZrMXdwU2JQd01qSUc1d3pxVUo1?=
 =?utf-8?B?dXcvVFo5dEtuaWZiNWNZOE56Z2JFVHRxTUI4dGpYSU16eW9zL0Z3VklJY0cw?=
 =?utf-8?B?dG5MaEs5QXhCL1dUK2xFYWZVNStBbjhRcFVnMTBJZ0ozdDFMaG8yNHFxVXpa?=
 =?utf-8?B?dDdwWFNjNDVtNEptUWdDd3VLRmpVUThiQTA3UTFuMHg3OVZhVGE3WmdGK0Fh?=
 =?utf-8?B?WjJzSDBzZFhiY3kyTnl4UXgwL0lDbjd4WGZJd0lJWFpWTW5Hb2RLc3hJYXdz?=
 =?utf-8?B?a1pWeXBqWDNSUHFXMWpxVUQ3eGo4NHZDb2dUQmdselQzRDY5REI1MURGRjV6?=
 =?utf-8?B?dVArNlRrN2hSVkNQb3Q4MTVleDgyQTBJRkdsRlVpOUJmRlFqaXZ3Ymg2S2FZ?=
 =?utf-8?B?eWpxTm5XVFZPbWphZEQrcFEvbGt2bURiZlBpdzR3MHE1MlVoaFErTnlnNmV2?=
 =?utf-8?B?ZkREOHVXbWovOEprYlBtV0RWZjIxRjBHQ1gzak5BcmFQL1Q0RkltZGFQaFpv?=
 =?utf-8?B?QmxHYnlGUWNTSDJCUXNzdHBCZjFYeFc3YUxDdUZUNEZvWFVBR0VCdFZ3K2dJ?=
 =?utf-8?B?VmFXNUV6ZGh1c2RQU283U1RnVHpJTXlGcWV6eVU4cXlBaFc2NXh3elp5cFFO?=
 =?utf-8?B?K2ZqbWRkd1Exb2RXYTM4eFYwR09rYVlrSzQ4U21ZaDBQd0xLaUhIM21GVHg5?=
 =?utf-8?B?ekp4ZjY1cnNTVWRHVzB1aGNLL3d6VUFNV1pOeUswbnFTUG0xRFZVanE1QnR6?=
 =?utf-8?B?Q3FUZnAzTzBXaWVmZVhmcnpsQ013bWJhTUZVOVlTN1VnNDVGaHg4d0F0VVRv?=
 =?utf-8?B?NVY3U0NqODNhY0tXNW9Lb2RjN2tqbnpoT2NqcGJsRnZ5WkVNOXV4UzUzVFVR?=
 =?utf-8?B?Uy8rTTNlbk8zVU9FQzRNV25RcmV2NjFRc3VGbFNLYjZmRDRZa09rYXdBYndQ?=
 =?utf-8?B?eGhPUUNqWWlOZ1ZHNjdpaTBCZWhodTV6dVFMVUF0SWlEd2lEendqRmpYWnQ1?=
 =?utf-8?B?UE55YWNWcGRJdUdCRWJLc1MrNkV6NERkRktQai9jM1NNUE9Sc2RoMzRvS0RH?=
 =?utf-8?B?SmJ5L2RLTlpWNjh0ZU5obmltUlNCTkVsUHVrYWJ5Y2t0bzU0VDM2Tno5bkt5?=
 =?utf-8?B?SEptV2w0dW9TcVQwV2VIaWpzdmgzM0VuMDhSRG4vRHpnK1ZmMmpWb002YjdD?=
 =?utf-8?B?aUR3OGhmcVQ3Y3VOVW9hYnFUemhXWXIzRkFlYU81K2ttbDVieUR2K0RoWGUr?=
 =?utf-8?B?M0tIOXBrdXZPcTFwWm1zQnZxYUZHM2t6UnVzZGJxRlRVNzVrWUw3aXhBL0lM?=
 =?utf-8?B?Ynl1cnp4WGY4dnB6WG5vdmdBUGNpNDJ0MWd4NXhHL0pUVk9qUDhKZDdLV3ph?=
 =?utf-8?B?SGJOUHR0TVRmd2QyOFd4N3YyMkd1V1Y3UFkvb3JsblNQbHN5ZklqcmJQRWVP?=
 =?utf-8?B?V25VdEZpMGtCbTkraVhBUVVPd2xmLzdvdkpYMWtjelEzaWFlZTNBZDR2byt0?=
 =?utf-8?B?YTNMaEVuOFlzY3lGaXYzY2cyYnJUSGgxMjAybnRNMkFGeXl4Z3pjclpZREVD?=
 =?utf-8?B?WUFnQm9TQUpXUDdPZnNVaENPVU5uZ24wVzQvSDVpNUpSNXpLWk9NdS9ma3BC?=
 =?utf-8?B?ampWMUNIWUNvR3FpZzc5amlELzFybGJxRlFobWdFa0JrRUJERU1EK3NWcWZC?=
 =?utf-8?B?MGVaQmNTQ3ZBYWtvemU1VndQVWFqNDZDTHE1a3BnRGpBSklNdjIrZHZ0dkQ2?=
 =?utf-8?Q?AcBHFEs0yPVXCgCGwIpEki8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EFE6871F5014C4B93F374E5FFB98756@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd329de-5616-46de-7ba4-08dd043a997b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 23:26:28.6012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vu+AsiM0SyFhzts7BpPU70B+YE8/PknBW+tiwnCvg1g8R3sB8itRdubVe4arRUZlfMKhF61IgOPNzrMFfpnOSuLSRChna2t15gwbwDhLNMXNQDZ6+XfF/OnomSpkzGjw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8192
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

CmFsYW46c25pcAoKPiArc3RhdGljIHZvaWQKPiArdGVzdF9sZWdhY3lfbW9kZShpbnQgZmQsIHN0
cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpbnQgbl9leGVjX3F1ZXVlcywgaW50IG5fZXhlY3MsIHVuc2lnbmVk
IGludCBmbGFncykKYWxhbjogT25lIG1vcmUgdGhpbmcsIGJhc2VkIG9uIHRoZSB0ZXN0aW5nIGZs
b3cgZnJvbSB0aGUgY2FsbGVyLCB3ZSBjYW4gcmVmYWN0b3IgYSBsb3Qgb2YgY29kZSB0byBub3Qg
dXNlIGxvb3BzCmFuZCBub3QgYXJyYXlzIG9mIG1vcmUgdGhhbiAxIGV4ZWN1dGlvbiBxdWV1ZSBh
bmQgbnVtYmVyIG9mIGJhdGNoZXMuIFRoaXMgYWxzbyBpbmNsdWRlcwp0aGUgbG9jYWwgdmFyaWFi
bGVzIGluc3RhbmNlZCBhcyBhcnJheXMgaW4gc3VwcG9ydCBvZiB0aGUgc2FtZS4KPiArewo+ICvC
oMKgwqDCoMKgwqDCoHVpbnQzMl90IHZtOwo+ICvCoMKgwqDCoMKgwqDCoGNvbnN0IHVpbnQ2NF90
IGFkZHIgPSBCQVNFX0FERFJFU1M7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRybV94ZV9zeW5j
IHN5bmNbMl0gPSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgLnR5cGUgPSBE
Uk1fWEVfU1lOQ19UWVBFX1NZTkNPQkosIC5mbGFncyA9IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFM
LCB9LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7IC50eXBlID0gRFJNX1hFX1NZ
TkNfVFlQRV9TWU5DT0JKLCAuZmxhZ3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTCwgfSwKPiAr
wqDCoMKgwqDCoMKgwqB9Owo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1feGVfZXhlYyBleGVj
ID0gewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAubnVtX2JhdGNoX2J1ZmZlciA9
IDEsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5udW1fc3luY3MgPSAyLAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuc3luY3MgPSB0b191c2VyX3BvaW50ZXIoc3lu
YyksCj4gK8KgwqDCoMKgwqDCoMKgfTsKPiArwqDCoMKgwqDCoMKgwqB1aW50MzJfdCBleGVjX3F1
ZXVlc1tNQVhfTl9FWEVDUVVFVUVTXTsKPiArwqDCoMKgwqDCoMKgwqB1aW50MzJfdCBzeW5jb2Jq
c1tNQVhfTl9FWEVDUVVFVUVTXTsKPiArwqDCoMKgwqDCoMKgwqBzaXplX3QgYm9fc2l6ZTsKPiAr
wqDCoMKgwqDCoMKgwqB1aW50MzJfdCBibyA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3NwaW4gc3BpbjsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdWludDMyX3QgYmF0Y2hbQkFUQ0hfRFdfQ09V
TlRdOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1aW50NjRfdCBwYWQ7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVpbnQzMl90IGRhdGE7Cj4gK8KgwqDCoMKgwqDC
oMKgfSAqZGF0YTsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfc3Bpbl9vcHRzIHNwaW5fb3B0
cyA9IHsgLnByZWVtcHQgPSBmYWxzZSB9Owo+ICvCoMKgwqDCoMKgwqDCoGludCBpLCBiOwo+ICsK
PiArwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0KG5fZXhlY19xdWV1ZXMgPD0gTUFYX05fRVhFQ1FV
RVVFUyk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHZtID0geGVfdm1fY3JlYXRlKGZkLCAwLCAwKTsK
PiArwqDCoMKgwqDCoMKgwqBib19zaXplID0gc2l6ZW9mKCpkYXRhKSAqIG5fZXhlY3M7Cj4gK8Kg
wqDCoMKgwqDCoMKgYm9fc2l6ZSA9IHhlX2JiX3NpemUoZmQsIGJvX3NpemUpOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqBibyA9IHhlX2JvX2NyZWF0ZShmZCwgdm0sIGJvX3NpemUsCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2cmFtX2lmX3Bvc3NpYmxl
KGZkLCBlY2ktPmd0X2lkKSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9WUkFNKTsK
PiArwqDCoMKgwqDCoMKgwqBkYXRhID0geGVfYm9fbWFwKGZkLCBibywgYm9fc2l6ZSk7Cj4gKwo+
ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBuX2V4ZWNfcXVldWVzOyBpKyspIHsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXhlY19xdWV1ZXNbaV0gPSB4ZV9leGVjX3F1
ZXVlX2NyZWF0ZShmZCwgdm0sIGVjaSwgMCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHN5bmNvYmpzW2ldID0gc3luY29ial9jcmVhdGUoZmQsIDApOwo+ICvCoMKgwqDCoMKgwqDC
oH07Cj4gKwoKYWxhbjpzbmlwCg==
