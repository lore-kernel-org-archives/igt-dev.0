Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AF8E6E815
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 05:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA52510E0F9;
	Wed,  4 Feb 2026 05:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmiD5IhI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEAC10E0BA
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 05:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770184028; x=1801720028;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=4VhfG1gx/RuF2tDFxxTStr7gbw7pUVkQnVTDTEMbL74=;
 b=nmiD5IhIVHTMgo5o0Nxx+KJ28fPeKBdCmOb0xYYrCiBew+N0IYTFyREH
 lM0AdBE9YobTqbG+HsqJgByBlvkZzlwI+XCU/vEg2N2rNFfmpmrYPAM/X
 y46/o5+Rx8j1TMAmSA6W8LyiPP3hKfj7Frg8j5J1DLUrijDNC/ocGOFgp
 4VeNeyrU4KKPnZBszJ2pwSAKRfK5U6+HwOcY+9LPQMYMxjMHnRxCNZrD1
 CBelyoIO5KgLxDtbte0qOyqy7zqFf2cceGKAkiGw56QyXagA7lzGuvDm/
 7Zl9Idlh16q2BWle2D3XhMS5TzYiJqHmCrk/NPLnwai5CAvyclLxoRFL+ w==;
X-CSE-ConnectionGUID: W5FVPzWDTGOWNnvcNEtFpQ==
X-CSE-MsgGUID: vDPxXnFSSsimZ5fSowt4EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75217817"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208,217";a="75217817"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 21:47:07 -0800
X-CSE-ConnectionGUID: 5ht0aPoHRc26a96lgG1f/A==
X-CSE-MsgGUID: B13Uc8NJTzGTGu2jEJSUKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
 d="scan'208,217";a="209169853"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 21:47:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 21:47:06 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 21:47:06 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 21:47:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7nLeEF59wAls8Coh6VEMHmEMbQ45J7XUjUpG168cLGqdujlIqfflDAIAoy0CNlsbdqIKwSpm9Wr/uwdX31exUg55vJhg2G/BoCLqEVw5pFO7RS53i/WUXvuP2EzwTOdcbSxdFaTZApKR+0se/2SR1wdqd7iVCGOTVpvEWppi2f1Pl+tfZa+3QYy2WBzf/V8aOm41Wi5C0zicWwQPbRQNSo5eGODmsuUhkp+e4YkUNmWor9iUpEPRY7TE+OnnXgsJFZPTrs9iW+3AIJHZjFWrCqSXt51D3TSOlbQIG9S7HvVrCKrPCbSvzbQW17U2VqsRJmo7ZX/A8u/sX77U+jlnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Z2UsX0FHM9Vw3pD/s59yQZSg0brmPbO46LdOcygfh0=;
 b=Q5a9UhMSUViiLvm5zJz5g4S6k6S51x9i3h22NfTlfrK4inGnKdZXgETJo9HY2/ZvE6gjdYVVu/NL/MwuOtNgh1pnpJHD21iT8lYxnOdiURiPhzwyDlTGh3MiyYP0SKldTMqIv6pxeprlu65xTvzYvCWs2SlzsiEGDYKHucg9IFJ8CjD8I2d5xu/TGe8FZJ0JB58AFiXasMQ+bGLc+6G1Wd32yGq4Z9gcQVi+iKZOxNOaJogeIXCdNDVXCC6L8gG84IPgaLexnMMqhKdvw//od2LxU2ZFg2M1qQ4Z6oheCYYyLrZVkAOuV/bG2lUu+hFVtHQoYT90T3JzQrPsq7YbFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DM3PR11MB8716.namprd11.prod.outlook.com (2603:10b6:0:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 05:47:03 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9564.006; Wed, 4 Feb 2026
 05:47:03 +0000
Content-Type: multipart/alternative;
 boundary="------------GLdo5RcMYBevnh0etTMabb3j"
Message-ID: <4c7ad3e5-27fa-4278-9da4-0b0523f6cd96@intel.com>
Date: Wed, 4 Feb 2026 11:16:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10 2/2] tests/intel/xe_pm_residency: Add subtest
 for ASPM Link state residency
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>
References: <20260121145747.1378494-1-karthik.poosa@intel.com>
 <20260121145747.1378494-3-karthik.poosa@intel.com>
 <20260122150007.r4btixs6doti3n2z@kamilkon-DESK.igk.intel.com>
 <3e0d1442-6464-4c7b-a275-2b18d8328775@intel.com>
 <20260123120703.uraxy7njgzi47uxh@kamilkon-DESK.igk.intel.com>
 <126b57d8-9441-47e0-aa53-3e887a0e2210@intel.com>
 <20260123140612.p26t6z76ekhwqgmn@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260123140612.p26t6z76ekhwqgmn@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MA5PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DM3PR11MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ac7f85-cfba-4846-5488-08de63b0d21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sm1qcElrOXdrTkZYZWQ2RE9jRFdLRDVXTTROMkpNRXh5TXhjRGdHWkhEMWVZ?=
 =?utf-8?B?Mm82RzlGcUN0YWNlV1h4TWpQeGxsYklwQ1A0MFdPOTRSZy9iK0hzd0M1VjZF?=
 =?utf-8?B?bVJrMlg4cTI3Y1RTalg0UGdkeCtLR3hzMVBHUDUzSXVsNm53ak5GTTYvcjl0?=
 =?utf-8?B?YnF3elM5eUZ4c0c1Nk9LR0JQZDBBdFJMMENPcHlwUUNDUGYzV3MrVWNIWG9l?=
 =?utf-8?B?b0hLeENRbWNpNTdoZlJiRjE4T1hCWFQzeTgyeDNoMnJXWCt2dGhlOHF0K2lt?=
 =?utf-8?B?YTNrQ2F2V1VxVld5aUJ6SHE1blBieWxUQmJQRWxpMzU5VVYwODlZN0pVOHJh?=
 =?utf-8?B?VkhOZnF6RG02K09TM21WdkZpcFJRVUdWdFhRS3pLQlFYVXdlNnBXVFk4VWcy?=
 =?utf-8?B?L1d1TjRQTEFvMWpnSDIyZVM3V0FUaXB1RXNLdlliMERSTmRCZ25RR3FQeHFp?=
 =?utf-8?B?Rkg2M0JKWWdjVnRWQlVUdk1MeUZNL21BMkhKSS9hSkhwQVZSTHV6UTZGTGpP?=
 =?utf-8?B?Skh1aTViUjYyckx6enl4R2NWWmlVWWhyUFUwMmlqZm1TQjBIQk5xVS9HVUty?=
 =?utf-8?B?WXBaOUtHSEswcWV2SXdVZTRjNWNVeThSNWh2VXdNMFZuSmExNzV3TGhycmhE?=
 =?utf-8?B?c1VrWWs4Ulo3M05qL1FSRVR0cTB0bHdOZDFRczVxTWpUZmpocmdoQThEN3F5?=
 =?utf-8?B?b1pRNlA0OUErSVFJMnVFM1NUekdyTjFkSjFBYWZCNnNHdmV6MDRJTGVKenIx?=
 =?utf-8?B?MERvUTJ5VmlFNDdUOUgrbXpnT2pydzNFSEEvRWtHd3ZoS1RBMkRNZ1IrRFNz?=
 =?utf-8?B?eVpDTmZ6RWRMY004K05mVmZjVlFzRklaSytMTXhKWlg0aTVuNFBBM0xtcWJY?=
 =?utf-8?B?ckRVdU8zZ0xhV2tQUEo3QmV3UjBETVV2cVVqdWVDSy93aWxUdVpHTGszNjVN?=
 =?utf-8?B?aCtKQWc2S0dqWTZnM1RhQ1IzTjhsaXl6NXE3UWVnTlRCRzhwRkZhKzdTazFT?=
 =?utf-8?B?a2FiZG81Tzk3T0pvZmhHSk0yak10SjhpYnJpWjRyTFNnNFllS0g3elo3ZWRJ?=
 =?utf-8?B?azVUdHNHcTBvUTkrei9VT1lTR3d2b0toYTQ2NmErQ0FjeFBUMC9lcmFUN3c4?=
 =?utf-8?B?QjFrS29QaXRsR0pYS0FMNnhId3ZPSVV1K21JaGtXRGxjejNURVR0ZVhYMkll?=
 =?utf-8?B?NC90cGlUcXBVeFlSdlp1OE0vWlFNNTZiRHkrdVRLSTlGVllXQzJCT254aGsx?=
 =?utf-8?B?VXI1SVlWc052QnpvNjd6ZTFaK2oybEVvOUgveFZSUVpvVHhvb21IcmRxNkRR?=
 =?utf-8?B?VU1rZkRnelJDbnNiYjJLUVNFblBONUNrSXg1S2dyaXVKTFk2SEEvcGlBb2Iz?=
 =?utf-8?B?eDJFYnNPdS95QTZTYlRlOGIzdjQ5K3ZPckd2czE2Ky9Ebk1PSlBmL0g1WCtC?=
 =?utf-8?B?WnY1OWtrZHozUXdTRlVMc2E4Q0ZpbVNiYjgrQm13dGlrcUlnSDcxZm9WaFNP?=
 =?utf-8?B?SUdjVk5zSktPcm1uMHp5N3RodzJTc3I1SEJBNDA2amhrUk4wcG9EU1A4NDQv?=
 =?utf-8?B?Z1BSSFZZREtWYmN5ZkhKUW5Ld0JsQmlROCtMTFJPYW01cE52bkZGcGxkQlRJ?=
 =?utf-8?B?L3JlTlVGOUZXdlVmRlB1TlBGN3VmL2M2WjNJaENCUTlBcmtrdnAxejlwWkVt?=
 =?utf-8?B?aFE5N2dSLzlrOWU0b25iY0hyVWM2d2ZZVXdINUhzeXJtSmNSdHYwWnovRUE1?=
 =?utf-8?B?cG1RdGZFT1d3bWVrK0JhYVp2N1hCY3cza0E5UzQ5ZmFWNEtNQ2tHQ3JKcVpv?=
 =?utf-8?B?Rkk1dEtlK3gzNm9XVDZLbHN1REIzdFgrbStkYU56cUtNcjMzTVJvVW5MMGZw?=
 =?utf-8?B?bUk2REJxTU9YTFNRSFgxMUZ0V1p0NW4zM1JZc1JPMWYyOFVqd3BJY1ZqOUpP?=
 =?utf-8?B?T1dkVXVXb3R0SytFK2NieEpnS25sTUZFQW04LzJUQjVDVFZRS3dTRXlpUVNo?=
 =?utf-8?B?eTF4MkFoS0hjQXF2TEJBcW0wNjUraUtlbGVEOVRkU1FadHJqRDRLcy9MOXo4?=
 =?utf-8?B?WHRWbktYei8zclB0em0yeTUxdllBSFlLYU5hY0FNS3cwZ3pFYjVIbWdYMkl6?=
 =?utf-8?Q?3qiY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHc1U2VhZjAyem1TeWlEL0krV1JBVXN1THlYWTZNdEJYVkN5Ni9xOHpJcUJ3?=
 =?utf-8?B?QmVuTU5naGRxWXIzWW1ZZXZBTDZWTVBSYS80aGN4WEZBdjI1K2xUd3VQVmt1?=
 =?utf-8?B?cmNKb3RZY05PWDV2Wmp3dk0wYnJrYUlmcGw3VFcxUmt3M21GanlCVzVtaUpB?=
 =?utf-8?B?dHB4UFZYb3U2UktjTXFObld3RU9qMks0TU9tZjR4bW1TVGJCdExpWmgyZ0xs?=
 =?utf-8?B?dGRqaUFqbEx0K2w5dEwwdzNUUngxRmVBbzdLSjlHVTVoR05qYndUTU11cnJX?=
 =?utf-8?B?MUxjelNoYk10ekQ4YTMvVGpTVlRUTUsxbXNlSjlSVXIrc0xZeTFwa2w1aWdS?=
 =?utf-8?B?WnlUSmlKVGxZVXA4bXlEc3JibFg1ekFyUjEvbzQzNEpLaVpna2p4eU9zajVV?=
 =?utf-8?B?d3BzWDcrM1VyOGdpZUU1N1VlU1kvUnhGckFNT3cvcmpoZmQ4THhMYk9nTzNp?=
 =?utf-8?B?cUx1dXg1c1E4TjBvTXFJbmpIeE4wUHFzaGpqT09hOFVoK0hYenhhWmN5NWRD?=
 =?utf-8?B?eDRidms4MXFWSDFLWUlrQVNmQnE0ODhNckVvT1pNaFFnQmVzbmN2OFJkTDBT?=
 =?utf-8?B?cElnMi95a0NKZkFlSnpmS28yekRXSGxzK0FCVEJpM2RGVHMzRDdSNFh2Rkc5?=
 =?utf-8?B?WEtSWXgwMzFCVGUwREx4Rmk5U2Y0SEpPdUVSRjkya0VhREUvbEd0aGd0SzE2?=
 =?utf-8?B?WnRxSFlYanl1Z3hrNHJFUW1YUWFLdDk3Z1grWjdQRVJEZ3dPaUVCQXNrc205?=
 =?utf-8?B?M01GaXFpU0JGT0NrMDdGSEhVK0NRWUtNZjJpY20xUWZPenFTTm14VWYxakU2?=
 =?utf-8?B?ZktmOFNxT0FScm12dVpqSmFwVU5LSnJ6MFRaTEUrWUo4aTZPbDJjV1VPSnpO?=
 =?utf-8?B?OHBLMTJ6TS9YV2xWZFpZTFQ0N1p0YVFLdWV3a21VYzFYTVJJNHIyWXlnZkZ2?=
 =?utf-8?B?K1R1K1VuNXRXd3A2cW4ySElkVHB1RjU0SU5ZTmhmUE5XZWorb3lGUnhXYW9a?=
 =?utf-8?B?NUJmUldLQTdFSFVmV210bWswWHlQZVhmaDZHUGRKZ0gyejU3WG9xcVVnem1Z?=
 =?utf-8?B?dE9OVWloZWJhOHk4NmFjU3JoWlpyL0xobzdaclhTT2VFbit2REtKRFNSVWlI?=
 =?utf-8?B?T1V4aWNUS3k3VVNUSWNCc29sZ1RDaFo1M2U0Q3dQWWQzRktqdjI5aGMzSlZa?=
 =?utf-8?B?SGlEMGVVc2JQMCtEdC9UZXc4UEE4L1ZoMFlqQXhicHcwaUtjdlc3WmsxdEFq?=
 =?utf-8?B?dHJGUVNORXVpNU81QS8ybGdTZXovTnl4bTlSdTA0SzNMQU82ZlJOZk9WRlhU?=
 =?utf-8?B?WHZGejdhYitXYWhkMUxxcUJrUDVMOC9yWVpYdGpkTFRxVkx4ZDRXaDhqNkZD?=
 =?utf-8?B?NzF0LzFtN3BDZVVCemRNZmdrNGhwM01jd3FId0RTNm1SMzFmazlQcEhVTi80?=
 =?utf-8?B?bTN3bXJLc3dSemRpbTFtSmJNdDg0SUhtVTlDN0Jkb1NQa25PWW5QSXBLSUF4?=
 =?utf-8?B?bkpoR0ljUm9HY1Baa3JpT3IreGVVQVhvU1RPQVgwR0Z4Zk93Q2VVOVhlVUl5?=
 =?utf-8?B?dm9mVkZFQmNFVWJiMDRYeUppNWJ4MlBydUoyRS96NEloMTBCSjhzeTFjSjNh?=
 =?utf-8?B?bGhIWnV1c2FGbkhDbWtlemdhcVNCUUJFR0xDejNsS0FSN2VZZ1h4STJLN2pa?=
 =?utf-8?B?dTBqV3E3ak54RGU4eU5NVU9pZCtqSkxiQnhNUFZXWHRtc1VoMkJ4MnprSStH?=
 =?utf-8?B?ajhRTmlRNE1BVzRsSFBVQkd4R0QycjFXelJiaGZYcTdsVys1UlY1eG02dmFv?=
 =?utf-8?B?R3Viakh1bFl0a1RzM2NkQzRxYWZ4NkVkSlk4ZXNGRUlDTTViV1ZQQlhvY0Zv?=
 =?utf-8?B?YnpqOTZrR3dOTWRpdlFuYUU4TjlHZU4zemc4YkcvdFVtRnhaYm9YbW5DKzAr?=
 =?utf-8?B?K0hBeWJ6bzNFYXlTMHNQemwyeVoybTVRWHFoUSsrbjdPeHlrT3JRY1g2UVIz?=
 =?utf-8?B?L3V5aHMvUnFURDNTeGlyTjE1c2VFeC93K1RyMGtvVHNwTmw0MnVIRjhBbUw0?=
 =?utf-8?B?alBzTE15dHpSYmxXQ3VCWVRubnBLZ0RqWm1lWmZBdVQ3MjJQL09CQ0lZQ2x3?=
 =?utf-8?B?eWFRQlBQajROTm1keXlZcnBiR3ZSTzIvdCtPWWVsWStQRi9TcWExNFl3Tm1v?=
 =?utf-8?B?UEtxbjRXZGxqaTV2YUhsM21tTzVKajNVVGhINHJKRDRURnFlbk80SWNJZzVU?=
 =?utf-8?B?c3V0MGRlaWRudXE5ak1SL2RiUTFLNWpoNnlDYXVsZVBUbko2WnFjOWQ5aFR1?=
 =?utf-8?B?dkZPU0dCUTQrK1FZN2ZtR3BXMklkNUNTUFZqYnlMSS9wNGZ0QU5MUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ac7f85-cfba-4846-5488-08de63b0d21e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 05:47:03.3298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGlSTgT9SYfEieTm67Z2LtlduO1FBj/dybcKBNIf+gaUZQ6tZ6xPbY0CzUWcuS84vEEae63OJByRImk6oNSYvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8716
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

--------------GLdo5RcMYBevnh0etTMabb3j
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 23-01-2026 19:36, Kamil Konieczny wrote:
> Hi Poosa,,
> On 2026-01-23 at 18:05:01 +0530, Poosa, Karthik wrote:
>> On 23-01-2026 17:37, Kamil Konieczny wrote:
>>> Hi,
>>> On 2026-01-23 at 16:04:11 +0530, Poosa, Karthik wrote:
>>>> On 22-01-2026 20:30, Kamil Konieczny wrote:
>>>>> Hi Karthik,
>>>>> On 2026-01-21 at 20:27:47 +0530, Karthik Poosa wrote:
>>>>>> Add subtest aspm_link_residency to verify PCIe ASPM.
>>>>>> Active State Power Management (ASPM) is a power management mechanism
>>>>>> for PCI Express (PCIe) devices that aims to save power while the devices
>>>>>> are in a fully active state.
>>>>>> This test uses link state counters from the debugfs
>>>>>> dgfx_pcie_link_residencies to verify this.
>>>>>>
>>>>>> v2:
>>>>>>     - Add dedicated function to get pcie endpoint upstream port. (Badal)
>>>>>>     - Read residency counter as unsigned long long int instead of
>>>>>>       unsigned long int.
>>>>>>     - Print residency counter before sleep also.
>>>>>>     - Don't assert if sysfs not corresponding to aspm_link_state
>>>>>>       is not present. (Badal)
>>>>>>     - Run workload before validation of aspm link residency. (Anshuman)
>>>>>>
>>>>>> v3:
>>>>>>     - Move igt_device_get_pci_usp to separate patch. (Kamil)
>>>>>>     - Move reading of residency to separate function. (Badal)
>>>>>>
>>>>>> v4:
>>>>>>     - Add description about PCIe ASPM in commit message and code. (Kamil)
>>>>>>     - Add a NULL check for the return value of igt_device_get_pci_usp().
>>>>>>     - Resolve compilation warnings about using variable as format string
>>>>>>       to sscanf.
>>>>>>
>>>>>> v5:
>>>>>>     - Use igt_device_get_pci_upstream_port() which is the renamed version
>>>>>>       of igt_device_get_pci_usp().
>>>>>>
>>>>>> v6:
>>>>>>     - Refactor and enhance readability. (Badal)
>>>>>>     - Move save and restore of link states to separate functions. (Badal)
>>>>>>
>>>>>> v7:
>>>>>>     - Skip aspm_link_residency on integrated platforms as it not supported.
>>>>>>
>>>>>> v8:
>>>>>>     - Address below review comments from Riana.
>>>>>>     - Use igt_sysfs_has_attr() instead of faccess().
>>>>>>     - Remove unnecessary spaces, debug logs, if checks.
>>>>>>     - Wrap line length to 100 chars.
>>>>>>     - Use spinner instead of mmap for workload.
>>>>>>
>>>>>> v9:
>>>>>>     - Address review comments from Kamil.
>>>>>>     - Simplify couple of igt_asserts.
>>>>>>     - Remove extra spaces.
>>>>>>
>>>>>> v10:
>>>>>>     - Add exit handler for aspm_link_residency test. (Riana)
>>>>>>     - Remove unused and unnecessary variables.
>>>>>>
>>>>>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>>>>>> Reviewed-by: Badal Nilawar<badal.nilawar@intel.com>
>>>>>> ---
>>>>>>     tests/intel/xe_pm_residency.c | 196 ++++++++++++++++++++++++++++++++++
>>>>>>     1 file changed, 196 insertions(+)
>>>>>>
>>>>>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>>>>>> index d33a87b13..2d965ef7d 100644
>>>>>> --- a/tests/intel/xe_pm_residency.c
>>>>>> +++ b/tests/intel/xe_pm_residency.c
>>>>>> @@ -31,12 +31,36 @@
>>>>>>     const double tolerance = 0.1;
>>>>>>     int fw_handle = -1;
>>>>>> +int fd_pci_usp;
>>>>> int fd_pci_usp = -1;
>>>>>
>>>>>> +bool rpm_disabled;
>>>>>> +bool link_states_saved;
>>>>>>     enum test_type {
>>>>>>     	TEST_S2IDLE,
>>>>>>     	TEST_IDLE,
>>>>>>     };
>>>>>> +enum link_state_index {
>>>>>> +	LINK_STATE_ASPM,
>>>>>> +	LINK_STATE_ASPM_L1_1,
>>>>>> +	LINK_STATE_ASPM_L1_2,
>>>>>> +	LINK_STATE_PCIPM_L1_1,
>>>>>> +	LINK_STATE_PCIPM_L1_2,
>>>>>> +	MAX_LINK_STATES,
>>>>>> +};
>>>>>> +
>>>>>> +struct link_state_info {
>>>>>> +	const char *filename;
>>>>>> +	char state;
>>>>>> +	const char *parse_str;
>>>>>> +} link_state_sysfs[] = {
>>>>>> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
>>>>>> +	{ "l1_1_aspm", 0, "NULL"},
>>>>>> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
>>>>>> +	{ "l1_1_pcipm", 0, NULL},
>>>>>> +	{ "l1_2_pcipm", 0, NULL}, +}; + /** * SUBTEST: gt-c6-on-idle * Description: 
>>>>>> Validate GT C6 state on idle @@ -64,6 +88,10 @@ enum test_type { 
>>>>>> * SUBTEST: cpg-gt-toggle * Description: Toggle GT coarse power 
>>>>>> gating states by acquiring/releasing * forcewake. + * + * 
>>>>>> SUBTEST: aspm_link_residency + * Description: Check for PCIe ASPM 
>>>>>> (Active State Power Management) link states + * entry while 
>>>>>> device is in D0. */ IGT_TEST_DESCRIPTION("Tests for gtidle
>>>>>> properties");
>>>>>> @@ -255,6 +283,21 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
>>>>>>     	munmap(done, 4096);
>>>>>>     }
>>>>>> +static void do_spin(int fd, struct drm_xe_engine_class_instance *eci)
>>>>>> +{
>>>>>> +	igt_spin_t *spin;
>>>>>> +	uint64_t vm, ahnd;
>>>>>> +
>>>>>> +	igt_info("Running spinner on %s:%d\n",
>>>>>> +		 xe_engine_class_string(eci->engine_class), eci->engine_instance);
>>>>>> +	vm = xe_vm_create(fd, 0, 0);
>>>>>> +	intel_allocator_init();
>>>>>> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>>>>>> +	spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
>>>>>> +	igt_measured_usleep(USEC_PER_SEC);
>>>>>> +	igt_spin_free(fd, spin);
>>>>>> +}
>>>>>> +
>>>>>>     static void measure_power(struct igt_power *gpu, double *power)
>>>>>>     {
>>>>>>     	struct power_sample power_sample[2];
>>>>>> @@ -370,6 +413,143 @@ static void cpg_gt_toggle(int fd)
>>>>>>     		powergate_status(fd, gt, "down");
>>>>>>     }
>>>>>> +static uint64_t get_link_state_residency(int fd_xe, const char *parse_str)
>>>>>> +{
>>>>>> +	int fd_debugfs_dir = 0;
>>>>>> +	int ret = 0;
>>>>>> +	char *ptr = NULL;
>>>>>> +	char buf[1024] = {0};
>>>>>> +	uint64_t residency = 0;
>>>>>> +
>>>>>> +	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
>>>>>> +	igt_assert(fd_debugfs_dir >= 0);
>>>>>> +	ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies", buf,
>>>>>> +				      sizeof(buf));
>>>>>> +	igt_assert_f(ret >= 0, "Cannot read residency file dgfx_pcie_link_residencies, ret %d\n",
>>>>>> +		     ret);
>>>>>> +
>>>>>> +	ptr = strstr(buf, parse_str);
>>>>>> +	igt_assert_f(ptr, "Cannot find residency string %s\n", parse_str);
>>>>>> +	ret = sscanf(ptr + strlen(parse_str), "%lu", &residency);
>>>>>> +	igt_assert_f(ret > 0, "Couldn't read residency value, ret %d", ret);
>>>>>> +	igt_info("Link residency %"PRIu64"\n", residency);
>>>>>> +	close(fd_debugfs_dir);
>>>>>> +
>>>>>> +	return residency;
>>>>>> +}
>>>>>> +
>>>>>> +static void save_and_disable_link_states(void)
>>>>>> +{
>>>>>> +	int i = 0;
>>>>>> +	int ret = 0;
>>>>>> +	char path[256] = {0};
>>>>>> +
>>>>>> +	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
>>>>>> +		sprintf(path, "%s", link_state_sysfs[i].filename);
>>>>>> +		if (!igt_sysfs_has_attr(fd_pci_usp, path))
>>>>>> +			continue;
>>>>>> +		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
>>>>>> +		igt_assert_lt(0, ret);
>>>>>> +		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename,
>>>>>> +			  link_state_sysfs[i].state);
>>>>>> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
>>>>> Disable should be done in separate function, so there should be two:
>>>>>
>>>>> static void save_link_states(void)
>>>>> static void disable_link_states(void)
>>>> any reason for this Kamil, it will be unnecessary extra function.
>>> Because you mix here reading and setting. imho there could be
>>> a problem if setting first few succeeds but in middle fails.
>> ok
> Hmm, other way could be to read and set, and if any error
> occurs break loop, do rollback, and only after that make
> an assert.
okay
>
>>>
>>>>>> +		igt_assert_lt(0, ret);
>>>>>> +	}
>>>>>> +	link_states_saved = true;
>>>>>> +}
>>>>>> +
>>>>>> +static void restore_link_states(void)
>>>>>> +{
>>>>>> +	int i = 0;
>>>>>> +	int ret = 0;
>>>>>> +	char path[256] = {0};
>>>>>> +
>>>>>> +	if (link_states_saved && fd_pci_usp >= 0) {
>>>>>> +		/* Restore saved states of L1 sysfs entries. */
>>>>>> +		for (i = 0 ; i < MAX_LINK_STATES ; i++) {
>>>>>> +			sprintf(path, "%s", link_state_sysfs[i].filename);
>>>>>> +			if (!igt_sysfs_has_attr(fd_pci_usp, path))
>>>>>> +				continue;
>>>>>> +			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
>>>>>> +			igt_assert_lt(0, ret);
>>>>>> +			igt_debug("restored %s to %c\n", link_state_sysfs[i].filename,
>>>>>> +				  link_state_sysfs[i].state);
>>>>>> +		}
>>>>>> +		link_states_saved = false;
>>>>>> +	}
>>>>>> +}
>>>>>> +
>>>>>> +static void test_aspm_link_residency(int fd_xe, enum link_state_index aspm_link_state)
>>>>>> +{
>>>>>> +	struct pci_device *pci_dev;
>>>>>> +	char name[PATH_MAX];
>>>>>> +	int ret = 0;
>>>>>> +	uint64_t residency_pre = 0, residency_post = 0;
>>>>>> +
>>>>>> +	igt_assert(aspm_link_state <= LINK_STATE_ASPM_L1_2);
>>>>>> +
>>>>>> +	/* Get upstream port pci_dev */
>>>>>> +	pci_dev = igt_device_get_pci_upstream_port(fd_xe);
>>>>>> +	igt_assert_f(pci_dev, "Couldn't get pci device of upstream port\n");
>>>>>> +	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n", pci_dev->domain,
>>>>>> +		  pci_dev->bus, pci_dev->dev, pci_dev->func);
>>>>>> +
>>>>>> +	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
>>>>>> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>>>>>> +	fd_pci_usp = open(name, O_DIRECTORY);
>>>>>> +	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n",
>>>>>> +		     name, fd_pci_usp);
>>>>>> +
>>>>>> +	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
>>>>>> +	igt_assert(igt_setup_runtime_pm(fd_xe));
>>>>>> +	igt_disable_runtime_pm();
>>>>>> +	rpm_disabled = true;
>>>>>> +
>>>>>> +	/* Check if ASPM sysfs is present. */
>>>>>> +	igt_require_f(igt_sysfs_has_attr(fd_pci_usp, link_state_sysfs[aspm_link_state].filename),
>>>>>> +		      "%s is not present\n", link_state_sysfs[aspm_link_state].filename);
>>>>>> +	ret = igt_sysfs_scanf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, "%c",
>>>>>> +			      &link_state_sysfs[aspm_link_state].state);
>>>>>> +	igt_assert_f((ret > 0), "Couldn't read residency for %s",
>>>>>> +		     link_state_sysfs[aspm_link_state].filename);
>>>>>> +
>>>>>> +	/* Save current state of all available link sysfs entries and disable all link states. */
>>>>>> +	save_and_disable_link_states();
>>>>>> +
>>>>>> +	/* Enable only the ASPM link state needed for test. */
>>>>>> +	igt_debug("Enabling %s\n", link_state_sysfs[aspm_link_state].filename);
>>>>>> +	ret = igt_sysfs_printf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, "%c", '1');
>>>>>> +
>>>>>> +	/* Read link state residencies before and after idle wait time. */
>>>>>> +	residency_pre = get_link_state_residency(fd_xe,
>>>>>> +						 link_state_sysfs[aspm_link_state].parse_str);
>>>>>> +	igt_info("Waiting for link to enter idle....\n");
>>>>>> +	sleep(SLEEP_DURATION);
>>>>>> +	residency_post = get_link_state_residency(fd_xe,
>>>>>> +						  link_state_sysfs[aspm_link_state].parse_str);
>>>>>> +
>>>>>> +	restore_link_states();
>>>>>> +	igt_restore_runtime_pm();
>>>>>> +	rpm_disabled = false;
>>>>>> +	close(fd_pci_usp);
>>>>>> +	close(fd_xe);
>>>>>> +
>>>>>> +	igt_assert_f(residency_post > residency_pre,
>>>>>> +		     "ASPM entry failed, pre %"PRIu64", post %"PRIu64"\n", residency_pre,
>>>>>> +		     residency_post);
>>>>>> +}
>>>>>> +
>>>>>> +static void aspm_residency_exit_handler(int sig)
>>>>>> +{
>>>>>> +	restore_link_states();
>>>>>> +	if (rpm_disabled) {
>>>>>> +		igt_restore_runtime_pm();
>>>>>> +		rpm_disabled = false;
>>>>>> +	}
>>>>>> +	if (fd_pci_usp)
>>>>> 	if (fd_pci_usp != -1)
>>>>>
>>>>>> +		close(fd_pci_usp);
>>>>> Add:
>>>>> 	fd_pci_usp = -1;
>>>>>
>>>>>> +}
>>>>>> +
>>>>>>     int igt_main()
>>>>>>     {
>>>>>>     	uint32_t d3cold_allowed;
>>>>>> @@ -444,6 +624,22 @@ int igt_main()
>>>>>>     		cpg_gt_toggle(fd);
>>>>>>     	}
>>>>>> +	igt_describe("ASPM Link residency validation");
>>>>>> +	igt_subtest_with_dynamic("aspm_link_residency") {
>>>>> This should be igt_subtest():
>>>>>
>>>>> 	igt_subtest("aspm_link_residency") {
>>>>>
>>>>>> +		igt_require(xe_has_vram(fd));
>>>>>> +		xe_for_each_gt(fd, gt) {
>>>>>> +			xe_for_each_engine(fd, hwe) {
>>>>>> +				if (gt == hwe->gt_id && !hwe->engine_instance) {
>>>>>> +					igt_dynamic_f("gt%u-engine-%s", gt,
>>>>>> +						      xe_engine_class_string(hwe->engine_class))
>>>>> What are you testing here? If you need to start and stop spinner
>>>>> please describe here why. If you really need it, it should be:
>>>> we want to run a basic workload before testing ASPM entry.
>>>>
>>>> So we are using spinner as workload here.
>>> ok, but why do you need any workload? It should also work without it?
>> Yes, it works even workload also.
>>
>> This was suggested by Anshuman,
>>
>> I believe this is intended to wake up the GPU and ensure the engines execute
>> some workload before entering ASPM.
>>
> So please add a comment before xe_for_each_gt()
> why it is needed.
okay
>
> Regards,
> Kamil
>
>>>>> 				if (gt == hwe->gt_id && !hwe->engine_instance)
>>>>> 						do_spin(fd, hwe);
>>>>>
>>>>>> +						do_spin(fd, hwe);
>>>>>> +				}
>>>>>> +			}
>>>>>> +		}
>>>>> Add newline.
>>>>>
>>>>>> +		igt_install_exit_handler(aspm_residency_exit_handler);
>>>>>> +		test_aspm_link_residency(fd, LINK_STATE_ASPM);
>>>>> Btw any igt_assert outside of dynamic sub-subtest here will result
>>>>> in SIGABORT, not a proper test fail.
>>>>>
>>>>> Add cleanup here:
>>>>> 		aspm_residency_exit_handler(0);
>>>> but installing exit handler already does this !
>>> It could become a problem when someone adds new test after this one.

we don't need to call aspm_residency_exit_handler(), at the end of test 
in pass scenario,

as test_aspm_link_residency() at its end already does the cleanup same 
as aspm_residency_exit_handler()

>>>
>>> Regards,
>>> Kamil
>>>
>>>>>> +	}
>>>>>> +
>>>>>>     	igt_fixture() {
>>>>>>     		close(fd);
>>>>>>     	}
>>>>>> -- 
>>>>>> 2.25.1
>>>>>>
--------------GLdo5RcMYBevnh0etTMabb3j
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 23-01-2026 19:36, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260123140612.p26t6z76ekhwqgmn@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Poosa,,
On 2026-01-23 at 18:05:01 +0530, Poosa, Karthik wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 23-01-2026 17:37, Kamil Konieczny wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Hi,
On 2026-01-23 at 16:04:11 +0530, Poosa, Karthik wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 22-01-2026 20:30, Kamil Konieczny wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Hi Karthik,
On 2026-01-21 at 20:27:47 +0530, Karthik Poosa wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">Add subtest aspm_link_residency to verify PCIe ASPM.
Active State Power Management (ASPM) is a power management mechanism
for PCI Express (PCIe) devices that aims to save power while the devices
are in a fully active state.
This test uses link state counters from the debugfs
dgfx_pcie_link_residencies to verify this.

v2:
   - Add dedicated function to get pcie endpoint upstream port. (Badal)
   - Read residency counter as unsigned long long int instead of
     unsigned long int.
   - Print residency counter before sleep also.
   - Don't assert if sysfs not corresponding to aspm_link_state
     is not present. (Badal)
   - Run workload before validation of aspm link residency. (Anshuman)

v3:
   - Move igt_device_get_pci_usp to separate patch. (Kamil)
   - Move reading of residency to separate function. (Badal)

v4:
   - Add description about PCIe ASPM in commit message and code. (Kamil)
   - Add a NULL check for the return value of igt_device_get_pci_usp().
   - Resolve compilation warnings about using variable as format string
     to sscanf.

v5:
   - Use igt_device_get_pci_upstream_port() which is the renamed version
     of igt_device_get_pci_usp().

v6:
   - Refactor and enhance readability. (Badal)
   - Move save and restore of link states to separate functions. (Badal)

v7:
   - Skip aspm_link_residency on integrated platforms as it not supported.

v8:
   - Address below review comments from Riana.
   - Use igt_sysfs_has_attr() instead of faccess().
   - Remove unnecessary spaces, debug logs, if checks.
   - Wrap line length to 100 chars.
   - Use spinner instead of mmap for workload.

v9:
   - Address review comments from Kamil.
   - Simplify couple of igt_asserts.
   - Remove extra spaces.

v10:
   - Add exit handler for aspm_link_residency test. (Riana)
   - Remove unused and unnecessary variables.

Signed-off-by: Karthik Poosa<a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
Reviewed-by: Badal Nilawar<a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
---
   tests/intel/xe_pm_residency.c | 196 ++++++++++++++++++++++++++++++++++
   1 file changed, 196 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index d33a87b13..2d965ef7d 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -31,12 +31,36 @@
   const double tolerance = 0.1;
   int fw_handle = -1;
+int fd_pci_usp;
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">int fd_pci_usp = -1;

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+bool rpm_disabled;
+bool link_states_saved;
   enum test_type {
   	TEST_S2IDLE,
   	TEST_IDLE,
   };
+enum link_state_index {
+	LINK_STATE_ASPM,
+	LINK_STATE_ASPM_L1_1,
+	LINK_STATE_ASPM_L1_2,
+	LINK_STATE_PCIPM_L1_1,
+	LINK_STATE_PCIPM_L1_2,
+	MAX_LINK_STATES,
+};
+
+struct link_state_info {
+	const char *filename;
+	char state;
+	const char *parse_str;
+} link_state_sysfs[] = {
+	{ &quot;l1_aspm&quot;, 0, &quot;PCIE LINK L1 RESIDENCY : &quot;},
+	{ &quot;l1_1_aspm&quot;, 0, &quot;NULL&quot;},
+	{ &quot;l1_2_aspm&quot;, 0, &quot;PCIE LINK L1.2 RESIDENCY : &quot;},
+	{ &quot;l1_1_pcipm&quot;, 0, NULL},
+	{ &quot;l1_2_pcipm<a class="moz-txt-link-rfc2396E" href="mailto:,0,NULL},+};+/***SUBTEST:gt-c6-on-idle*Description:ValidateGTC6stateonidle@@-64,6+88,10@@enumtest_type{*SUBTEST:cpg-gt-toggle*Description:ToggleGTcoarsepowergatingstatesbyacquiring/releasing*forcewake.+*+*SUBTEST:aspm_link_residency+*Description:CheckforPCIeASPM(ActiveStatePowerManagement)linkstates+*entrywhiledeviceisinD0.*/IGT_TEST_DESCRIPTION(">&quot;, 0, NULL}, +}; + /** * SUBTEST:
gt-c6-on-idle * Description: Validate GT C6 state on idle @@
-64,6 +88,10 @@ enum test_type { * SUBTEST: cpg-gt-toggle *
Description: Toggle GT coarse power gating states by
acquiring/releasing * forcewake. + * + * SUBTEST:
aspm_link_residency + * Description: Check for PCIe ASPM
(Active State Power Management) link states + * entry while
device is in D0. */ IGT_TEST_DESCRIPTION(&quot;</a>Tests for gtidle
properties&quot;);
@@ -255,6 +283,21 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
   	munmap(done, 4096);
   }
+static void do_spin(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	igt_spin_t *spin;
+	uint64_t vm, ahnd;
+
+	igt_info(&quot;Running spinner on %s:%d\n&quot;,
+		 xe_engine_class_string(eci-&gt;engine_class), eci-&gt;engine_instance);
+	vm = xe_vm_create(fd, 0, 0);
+	intel_allocator_init();
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
+	igt_measured_usleep(USEC_PER_SEC);
+	igt_spin_free(fd, spin);
+}
+
   static void measure_power(struct igt_power *gpu, double *power)
   {
   	struct power_sample power_sample[2];
@@ -370,6 +413,143 @@ static void cpg_gt_toggle(int fd)
   		powergate_status(fd, gt, &quot;down&quot;);
   }
+static uint64_t get_link_state_residency(int fd_xe, const char *parse_str)
+{
+	int fd_debugfs_dir = 0;
+	int ret = 0;
+	char *ptr = NULL;
+	char buf[1024] = {0};
+	uint64_t residency = 0;
+
+	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
+	igt_assert(fd_debugfs_dir &gt;= 0);
+	ret = igt_debugfs_simple_read(fd_debugfs_dir, &quot;dgfx_pcie_link_residencies&quot;, buf,
+				      sizeof(buf));
+	igt_assert_f(ret &gt;= 0, &quot;Cannot read residency file dgfx_pcie_link_residencies, ret %d\n&quot;,
+		     ret);
+
+	ptr = strstr(buf, parse_str);
+	igt_assert_f(ptr, &quot;Cannot find residency string %s\n&quot;, parse_str);
+	ret = sscanf(ptr + strlen(parse_str), &quot;%lu&quot;, &amp;residency);
+	igt_assert_f(ret &gt; 0, &quot;Couldn't read residency value, ret %d&quot;, ret);
+	igt_info(&quot;Link residency %&quot;PRIu64&quot;\n&quot;, residency);
+	close(fd_debugfs_dir);
+
+	return residency;
+}
+
+static void save_and_disable_link_states(void)
+{
+	int i = 0;
+	int ret = 0;
+	char path[256] = {0};
+
+	for (i = 0 ; i &lt; MAX_LINK_STATES ; i++) {
+		sprintf(path, &quot;%s&quot;, link_state_sysfs[i].filename);
+		if (!igt_sysfs_has_attr(fd_pci_usp, path))
+			continue;
+		ret = igt_sysfs_scanf(fd_pci_usp, path, &quot;%c&quot;, &amp;link_state_sysfs[i].state);
+		igt_assert_lt(0, ret);
+		igt_debug(&quot;saved %s = %c\n&quot;, link_state_sysfs[i].filename,
+			  link_state_sysfs[i].state);
+		ret = igt_sysfs_printf(fd_pci_usp, path, &quot;%c&quot;, '0');
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Disable should be done in separate function, so there should be two:

static void save_link_states(void)
static void disable_link_states(void)
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">any reason for this Kamil, it will be unnecessary extra function.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Because you mix here reading and setting. imho there could be
a problem if setting first few succeeds but in middle fails.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">ok
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmm, other way could be to read and set, and if any error
occurs break loop, do rollback, and only after that make
an assert.</pre>
    </blockquote>
    okay
    <blockquote type="cite" cite="mid:20260123140612.p26t6z76ekhwqgmn@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+		igt_assert_lt(0, ret);
+	}
+	link_states_saved = true;
+}
+
+static void restore_link_states(void)
+{
+	int i = 0;
+	int ret = 0;
+	char path[256] = {0};
+
+	if (link_states_saved &amp;&amp; fd_pci_usp &gt;= 0) {
+		/* Restore saved states of L1 sysfs entries. */
+		for (i = 0 ; i &lt; MAX_LINK_STATES ; i++) {
+			sprintf(path, &quot;%s&quot;, link_state_sysfs[i].filename);
+			if (!igt_sysfs_has_attr(fd_pci_usp, path))
+				continue;
+			ret = igt_sysfs_printf(fd_pci_usp, path, &quot;%c&quot;, link_state_sysfs[i].state);
+			igt_assert_lt(0, ret);
+			igt_debug(&quot;restored %s to %c\n&quot;, link_state_sysfs[i].filename,
+				  link_state_sysfs[i].state);
+		}
+		link_states_saved = false;
+	}
+}
+
+static void test_aspm_link_residency(int fd_xe, enum link_state_index aspm_link_state)
+{
+	struct pci_device *pci_dev;
+	char name[PATH_MAX];
+	int ret = 0;
+	uint64_t residency_pre = 0, residency_post = 0;
+
+	igt_assert(aspm_link_state &lt;= LINK_STATE_ASPM_L1_2);
+
+	/* Get upstream port pci_dev */
+	pci_dev = igt_device_get_pci_upstream_port(fd_xe);
+	igt_assert_f(pci_dev, &quot;Couldn't get pci device of upstream port\n&quot;);
+	igt_debug(&quot;Upstream port PCI device: %04x:%02x:%02x.%01x\n&quot;, pci_dev-&gt;domain,
+		  pci_dev-&gt;bus, pci_dev-&gt;dev, pci_dev-&gt;func);
+
+	snprintf(name, sizeof(name), &quot;/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link&quot;,
+		 pci_dev-&gt;domain, pci_dev-&gt;bus, pci_dev-&gt;dev, pci_dev-&gt;func);
+	fd_pci_usp = open(name, O_DIRECTORY);
+	igt_assert_f((fd_pci_usp &gt;= 0), &quot;Can't open link directory upstream port %s, ret %d\n&quot;,
+		     name, fd_pci_usp);
+
+	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
+	igt_assert(igt_setup_runtime_pm(fd_xe));
+	igt_disable_runtime_pm();
+	rpm_disabled = true;
+
+	/* Check if ASPM sysfs is present. */
+	igt_require_f(igt_sysfs_has_attr(fd_pci_usp, link_state_sysfs[aspm_link_state].filename),
+		      &quot;%s is not present\n&quot;, link_state_sysfs[aspm_link_state].filename);
+	ret = igt_sysfs_scanf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, &quot;%c&quot;,
+			      &amp;link_state_sysfs[aspm_link_state].state);
+	igt_assert_f((ret &gt; 0), &quot;Couldn't read residency for %s&quot;,
+		     link_state_sysfs[aspm_link_state].filename);
+
+	/* Save current state of all available link sysfs entries and disable all link states. */
+	save_and_disable_link_states();
+
+	/* Enable only the ASPM link state needed for test. */
+	igt_debug(&quot;Enabling %s\n&quot;, link_state_sysfs[aspm_link_state].filename);
+	ret = igt_sysfs_printf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, &quot;%c&quot;, '1');
+
+	/* Read link state residencies before and after idle wait time. */
+	residency_pre = get_link_state_residency(fd_xe,
+						 link_state_sysfs[aspm_link_state].parse_str);
+	igt_info(&quot;Waiting for link to enter idle....\n&quot;);
+	sleep(SLEEP_DURATION);
+	residency_post = get_link_state_residency(fd_xe,
+						  link_state_sysfs[aspm_link_state].parse_str);
+
+	restore_link_states();
+	igt_restore_runtime_pm();
+	rpm_disabled = false;
+	close(fd_pci_usp);
+	close(fd_xe);
+
+	igt_assert_f(residency_post &gt; residency_pre,
+		     &quot;ASPM entry failed, pre %&quot;PRIu64&quot;, post %&quot;PRIu64&quot;\n&quot;, residency_pre,
+		     residency_post);
+}
+
+static void aspm_residency_exit_handler(int sig)
+{
+	restore_link_states();
+	if (rpm_disabled) {
+		igt_restore_runtime_pm();
+		rpm_disabled = false;
+	}
+	if (fd_pci_usp)
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">	if (fd_pci_usp != -1)

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+		close(fd_pci_usp);
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Add:
	fd_pci_usp = -1;

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+}
+
   int igt_main()
   {
   	uint32_t d3cold_allowed;
@@ -444,6 +624,22 @@ int igt_main()
   		cpg_gt_toggle(fd);
   	}
+	igt_describe(&quot;ASPM Link residency validation&quot;);
+	igt_subtest_with_dynamic(&quot;aspm_link_residency&quot;) {
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">This should be igt_subtest():

	igt_subtest(&quot;aspm_link_residency&quot;) {

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+		igt_require(xe_has_vram(fd));
+		xe_for_each_gt(fd, gt) {
+			xe_for_each_engine(fd, hwe) {
+				if (gt == hwe-&gt;gt_id &amp;&amp; !hwe-&gt;engine_instance) {
+					igt_dynamic_f(&quot;gt%u-engine-%s&quot;, gt,
+						      xe_engine_class_string(hwe-&gt;engine_class))
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">What are you testing here? If you need to start and stop spinner
please describe here why. If you really need it, it should be:
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">we want to run a basic workload before testing ASPM entry.

So we are using spinner as workload here.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">ok, but why do you need any workload? It should also work without it?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes, it works even workload also.

This was suggested by Anshuman,

I believe this is intended to wake up the GPU and ensure the engines execute
some workload before entering ASPM.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
So please add a comment before xe_for_each_gt()
why it is needed.</pre>
    </blockquote>
    okay
    <blockquote type="cite" cite="mid:20260123140612.p26t6z76ekhwqgmn@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

Regards,
Kamil 

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">				if (gt == hwe-&gt;gt_id &amp;&amp; !hwe-&gt;engine_instance)
						do_spin(fd, hwe);

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+						do_spin(fd, hwe);
+				}
+			}
+		}
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Add newline.

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+		igt_install_exit_handler(aspm_residency_exit_handler);
+		test_aspm_link_residency(fd, LINK_STATE_ASPM);
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Btw any igt_assert outside of dynamic sub-subtest here will result
in SIGABORT, not a proper test fail.

Add cleanup here:
		aspm_residency_exit_handler(0);
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">but installing exit handler already does this !
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">It could become a problem when someone adds new test after this one.</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <p>we don't need to call&nbsp;<span style="white-space: pre-wrap">aspm_residency_exit_handler(), at the end of test in pass scenario,</span></p>
    <p><span style="white-space: pre-wrap">as </span><span style="white-space: pre-wrap">test_aspm_link_residency() at its end already does the cleanup same as </span><span style="white-space: pre-wrap">aspm_residency_exit_handler()</span></p>
    <blockquote type="cite" cite="mid:20260123140612.p26t6z76ekhwqgmn@kamilkon-DESK.igk.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">

Regards,
Kamil

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+	}
+
   	igt_fixture() {
   		close(fd);
   	}
-- 
2.25.1

</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------GLdo5RcMYBevnh0etTMabb3j--
