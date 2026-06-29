Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074FEC43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 22:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EC710E120;
	Mon, 29 Jun 2026 22:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Exj8M/eN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C6D10E120
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 22:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782772410; x=1814308410;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=cyypTsWZE2TAmsH3wydhQFUmXleHCoDbDAvDOKG9ZsY=;
 b=Exj8M/eNwbur8TzEwyNEpLfuBPtcVhniOJJ7ZBjtxKOYK6HFxmQHkemd
 pC+jIHxurn8USfONR2+O2KZNrCvyyiZxRguov+VgDRati/WqM1ea7OvWv
 PRbMTMgMaZ85W9dFW/TyxKVT4phdt7tlaJDEx/oHgpWX9CgVSBjGJP6xm
 AIt7nxYC40ZtmAHFSPS+Ej8RlO7Q+zl0diJceoRCzOQkHzYCVNvMqXU49
 VzcauM9jZufIRvsLNyDWPNLKdP/rDWlrwuoEhh8mNjAQZVUFSCOzcKUFC
 BwhzL5QO2F8+EjktBEQFXfBnYBkzradpVpAFnUtInkrEvIgrGT0ofv7C+ A==;
X-CSE-ConnectionGUID: 9hPOeZQ9Q/eugqCFHhuxXA==
X-CSE-MsgGUID: BeXD9jNTSWGjYQhTvE05vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="109028688"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="109028688"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 15:33:30 -0700
X-CSE-ConnectionGUID: L2x+8B+xRhKlYBvZI7uuIQ==
X-CSE-MsgGUID: ILBw5M7FSzmf2NfW0ICfow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="248105795"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 15:33:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 15:33:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 15:33:28 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 15:33:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYRHvHbxKYZLPg3SD5WBx5Fzopu/SEagFFLc3yRUNx+G3AadEHR1I3/VYqehNnQzVZe3SnSwUFCzW/dEOGOGzM5/3W53WKyHgK+txjRk7WgL6L6cqw9xdjwyUTrmbaZc0rk8ZKP66DZ7FvkLZTl8v7zcGs2FhiB3XH0OQXaobg9Gi+5SGBXGnzp5Ffub8bbfFPrQ7gpPfmvaaDAkalu5JArOpMC8NCPGMiDqwUTeODeZQRoV8XRvy9yUwwlkNSGblOgqNfC3dy/qPQ9dlfjvL4KF435cvM/5KbnzkLNKK5F9T90k9wglcQB/JlAOjcYMoixeX2e8w+DFcLRtwh/Ccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOohOtCIexK6SgdpT6czTiY1eKIY0dxElY0xOIUp8pU=;
 b=AVvg5CvCrcMcrsy1NJxTHV0xcfodR6O/+aZ1QPDaMmuC5U/6UTf+kziY4vMxKe4uU/aKlI8esUR/AIwmJF+tmbU2E0zymQTHRpu4j+K8VE7jRFk/WrVR37UvSgrrHjRZL49OpoUr9RLFrJCtzxo6iTt1fgKCC8uHxiaQIFsxtcHfOE98oSHJ9onlfUGCRKU63fL6DRJ+xm7dVYmq+uPbrWmmuF7g8fg1ow1dr3MLMiNkmWGF01xOkJM2xd6g8dUSregrB68wNMLL9XtimSUttsws6NI2P5V4bnkVYxCVzVr0Hq/LPB0tHUs3Nwlg9JqnbyyES3e1GYAsUvzlqFiwmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB4887.namprd11.prod.outlook.com (2603:10b6:510:30::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Mon, 29 Jun
 2026 22:33:18 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 22:33:17 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_hook: Fix realloc size to avoid memory
 overwriting
In-Reply-To: <2oskxsgbneasu3zcty4lrikgmbcqg6bdhefkqcorqmpa336mw6@p2gn3cjtkxrd>
References: <20260629115408.158220-2-zbigniew.kempczynski@intel.com>
 <877bnhtua6.fsf@intel.com>
 <2oskxsgbneasu3zcty4lrikgmbcqg6bdhefkqcorqmpa336mw6@p2gn3cjtkxrd>
Date: Mon, 29 Jun 2026 19:33:12 -0300
Message-ID: <874iilt1sn.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB4887:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3b0b87-62c2-415d-f78b-08ded62e6a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qdoa6VHYUcCDn+/pVFLnf/YKVq5bWiE3WowpYTdwfsoMUEZRRdhj3xzMR4GAKFh1sWlttxsz3sjMOqhN74afJ8K6d19ZwZXtnT7VtKCVtN5lG+VUSao/pofP7r2v6xYSyAbRbSSpvP1lv9kNy+n7cJpnC9mHxTw6vYKitOVEcbUE21gcg9ilX2mAUngNRInUPa+/gLr/rHuX3KGWUWVqFmcmC75qr3VVwYSG3Qv3DjCXrViYJukGw7pRdqmCorC9l5xRYalBsZGmW0SpUhuIfspFdLX4NiBNKCUiCv8nd/LbBTkdDTylkLN6FeESMPUOAwxSsxo0/3zAZAhYi5NF/pkPpYd9NnFZEDZ5nOANe99nsynqIFSK8nllhN4quO630RHSXZJoD21sGRC7zceKDjYbJZdRiwLiVZmtm+QP8rnhAaa8SEaX+brwNOulelFA+eEcu3kg3XxkVgHq+O6b9bmtgsltfRuO0OHIa7TIL8PjDxk2NQGvqcdbezJlghdnIznRPYdFOamhShIvkqdPNvLzRhr2tZ6IIdrAMd0A7ICGf6PekD0qcdaJiBpwzBZRutt9zoOEC1DYLAESd0jBRkCaAV157AZMnTxAvOLUbbsAK8agewm+4RW1FT4A4+p1f5HQm6f1oHRWBKqklvNwOO2C4tFoL07+gKElOqFSVyo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDNES1BOd1liQktiZ3lwK2Jta2dneHlFMTdpb2tVZmZiT3B3RUlnTlhMNmE1?=
 =?utf-8?B?Zm8xajd0QXZRaWtMMDArSXdmb3FPejF3dVVXOFRmbHVGbVJHYlg4L05sNWwx?=
 =?utf-8?B?QkdvRllvZ3NzYW1Pb0tsZHVyUk5LTGdlVFJiQnhERk5kR3VDbVZsQlg1Wklm?=
 =?utf-8?B?SEFOSWhGYWhjeGlhYW9DU3R6WkJsMFNyRUtYNFROZUhVUDB0Q0pXSlBjaUZj?=
 =?utf-8?B?ZTlIcFZjQytMQkM0NC9hWjJISHpXcE42QVJYczU3eGdyc0VweTZleDNIQ3Zp?=
 =?utf-8?B?VFhLTmNHODB1dm5IZkR3Y1VyRzBwdElDOGhyVEJETDZKWnRsdWFKUHlIb1l4?=
 =?utf-8?B?UHdEVis3NG9FMUtic1l3SFU1OXNRZ1g0a3ZrV1NBdVhCN2dEQk03NHlxUlVz?=
 =?utf-8?B?Qmd1aU90QzhXMklLYzhrNTdlclVUSXRjc01VWHJCbEs1Q0ljTWZTSEgrOVFK?=
 =?utf-8?B?a1F4NjFmeEVrekFzVkJxb1dCUUxXK0tsd2kycmV6OWlCUkV0bnMwemNqdjBh?=
 =?utf-8?B?a3VORjUraWtrUFR1UVdDY3NIK3hYK0psQXNYbU55V3FLTVJDaCsrdlNBTUZB?=
 =?utf-8?B?R2xvSVhjb2E1N1VOdEFCeWlkZEpLSVNVZkFlcUxkTXRBZDgwWkJIZWdOY003?=
 =?utf-8?B?cFFEK2p4d3d3UjF5M3k1QlY0TWxXNjRVUW00VUdYK2dwZTZsQU5tTjBNYVVO?=
 =?utf-8?B?bEdYOHY2a3FUWHYwNkdxSENZT0d0azNPdm54U01yNExadXNDVEtuVlJIcHlK?=
 =?utf-8?B?dTJIWUoxUDl3dExFblMxNXV4bDQybnc5V1UyMUxMNHhDUTlSMzE2ak5XRlVJ?=
 =?utf-8?B?QmVYRWpRQjQwVkVVa01pYWY1Qk9uTGNXYlhmMGswZHlCc3lCM3BEc0ZOMUp0?=
 =?utf-8?B?aEhiN20rcUZNRE40UHdaMlpxblhiZnlYZ0ZwRktjVGVnMUZDeThiSDNSQzhl?=
 =?utf-8?B?YVNmdHUrU3JJbFJ5NGNwZHRwQ0V4NGsrclhoS3B5dTJha21oU01WdDk2ay9L?=
 =?utf-8?B?ajY1WWlkbDZWTTVjU2J6aDArZDBoVFhRVEJlZ1ZWYjhoQnRlanVqOGkzMEwz?=
 =?utf-8?B?V29JZVdIVFVJUEdoQXlkSytDLzI4aVRqMktkOHduak9BZ2taNzRZZmkxSmlp?=
 =?utf-8?B?SjA0WkFFS1lSMXZRelowYmFqdU94TTVyTXczZUNla2FJakdDOTU3Wk9wVW1h?=
 =?utf-8?B?cjJrbktSckVyazBBZk9xbjFIaGUzbW9jVkEwcEE1UzVvT3BPWVNQZ0IrSjFO?=
 =?utf-8?B?aWxwQ0NhbnlGem5Rc1lKRFJJWTVhUEg3V0xlTWcvUUFKL1NVNUhyZDlhWWpO?=
 =?utf-8?B?TWV6UVVJNDE2VWovR3hsTmFYSENGYTA3cjVubi9MN2d1M3pISExhMG1HUzc2?=
 =?utf-8?B?NlNsOHNpY1F6bHBKRkZQaDBNSERFUVhBVkp3bmo1QlU4eUREVzVwQnlnVnlR?=
 =?utf-8?B?VXMvWFRIcWZxNzBoenpTTzFNa0FtaktkY1lJZlJGVTJpVnptcXh5NEhLeU1I?=
 =?utf-8?B?WjR5cFh5SE93UVV4U1FvVlFKR002ME83N2NGdSs2Y0RCS0dJOGRmQW1GY1Nz?=
 =?utf-8?B?TDJ0MXlqQ3BCeThTVVBZZlRiZ29IQXRqU21wK2ozdlpURmoyY3JqRXpMWVpz?=
 =?utf-8?B?ZFh0b25KVFlZNXpYYzB5dlJ2b2R5SmxjSDJRblEzYXV5YjJPbUxPbzVQZVhk?=
 =?utf-8?B?dlQvVGhIKzBYblZRNUpINkViRCtZNjRRL01UblFnVFV0RWtzaVR5WkhReWJz?=
 =?utf-8?B?QTh2ZmRYN09jZnk2cEorVzZ0bUFqY1E3WERjd3BlR3Znd0orV09KZElVdE1v?=
 =?utf-8?B?aVJvSGduRDJMaFRkWWpLcmpmd3hNOG1pdm1RWUdqQ3JVU0VlSXRSZStFeWYz?=
 =?utf-8?B?eXNxc0UwTG1IY3NxcGVvWEttaFYxV3Y0NndEQ3RYSkFLeUp1MEJmaUVCZnI5?=
 =?utf-8?B?NEg2ajJqcFJMekdpOWVXNE5IanI4Ukx1R2NVc0ZuemphdHozYUV0WUxxZ2ZK?=
 =?utf-8?B?eW45V2hMeUN4YU9jYnAzS0kzVGhxNHFFUzMyWEdNNmJjQmJodFY2cWI5Z1NW?=
 =?utf-8?B?dGJVYnFjbUpBcVRIOGpaUzBidEJhbmgwamVRZ2pJcG9HVlA4QW9sMU5uY3ZQ?=
 =?utf-8?B?aExmcXgranJqWDZ5QkxZMHJZWG5jS3B3LzZ6d1BWcEpJN2gwTTNYeXJ0ZHlJ?=
 =?utf-8?B?RG5LLzFHd3g1MTFQc014VWxmd2NIUU1PSzlxVWtQTjVYRUIrVExkNjBGM2FM?=
 =?utf-8?B?Z3NhdVdRVTlNeWJHeS8wV2RWa01xdE10VGszd3Q0cmE3MDgzVFdWOFIxM1lQ?=
 =?utf-8?B?T1ZqUDZidFpWYWVtc2RFUlVlbVMzY2wvMjd3MjNMVmRldEJEeXpVZz09?=
X-Exchange-RoutingPolicyChecked: Z5CnUy+gd9yH7RFM47y8drOW3dm/D3zeTontGPzsvba8KJBxLU+G5bJjB8USk7MTpskOVdOBJ5LpQGclH0Q0frCPXRe/CeJ9UsQa4O5tCmJU/u/2iaTpA7dqqtbD6LTsESXavG1B6/FjtCNCAF6uLnc0+hwOF586GeXI8HNQ5jAh5E7kVAWPoyzK79GmC4otM2eVKob3xvyK0JKUIL/ERomCVL1br362B9AKo9nLl7YzqAhVLLdGeV6tivV8boHBHNERjVwuq4Y6glPnYvvbucGelSC1etyghXZ3pwLnbkLlxr4R7Jbj3J/AO+7XUGuNlWisWRgdASnvc3dB3T5SSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3b0b87-62c2-415d-f78b-08ded62e6a1a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 22:33:17.1569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPy2wrGrZShl+KFqxV/Na9OMnlVk2eOGJNrzMJDh1TvZl07R46+8BtgK55MYWbSXdT7BUi0AEgHE0zTsV28nxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4887
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

Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:

> On Mon, Jun 29, 2026 at 09:17:53AM -0300, Gustavo Sousa wrote:
>> Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:
>>=20
>> > Doubling test name size might be not enough for realloc if target name
>> > length is larger than test/subtest name size.
>> >
>> > Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.c=
om>
>> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> > Cc: Ryszard Knop <ryszard.knop@intel.com>
>> > ---
>> >  lib/igt_hook.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>> > index b8f25b6c7a..a44b852da1 100644
>> > --- a/lib/igt_hook.c
>> > +++ b/lib/igt_hook.c
>> > @@ -300,7 +300,7 @@ static void igt_hook_update_test_name_pre_call(str=
uct igt_hook *igt_hook, struct
>> >  	if (len + 1 > *size_ptr) {
>> >  		size_t fullname_size;
>> > =20
>> > -		*size_ptr *=3D 2;
>> > +		*size_ptr +=3D len + 1;
>>=20
>> Oops. My bad. Thanks for finding this!
>>=20
>> Do we need to use "+=3D" instead of "=3D" above, though?
>>=20
>> Also, perhaps we could use roundup_power_of_two(len + 1) to reduce the
>> number of follow-up reallocs?
>
> Sorry, I haven't explained why I used "+=3D" instead of "=3D". That was
> first what comes to my mind to fix the issue and try to decrease number
> of reallocs more than with simple '=3D'. For smaller sizes I'm not sure i=
f
> size of power of two is better than any other value. Glibc adds some
> overhead to malloc so I think any strategy we pick which increases
> buffer underneath is acceptable to me.

I just though "+=3D" adding exactly the size needed as an "extra" looked
odd and didn't initially get that this indeed had the objective of
avoiding extra reallocs in the future. I wonder if future readers of the
code will get the same perception or if that's just me.

--
Gustavo Sousa

>
> --
> Zbigniew
>
>
>>=20
>> --
>> Gustavo Sousa
>>=20
>> >  		*name_ptr =3D realloc(*name_ptr, *size_ptr);
>> > =20
>> >  		fullname_size =3D igt_hook_calc_test_fullname_size(igt_hook);
>> > --=20
>> > 2.54.0
