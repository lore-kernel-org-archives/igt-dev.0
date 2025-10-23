Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F94CCD1BE
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 13:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8202F10E8F9;
	Thu, 23 Oct 2025 13:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUGj5sq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C037410E8F9
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 13:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761225702; x=1792761702;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tbsdgQuBgkTqo3e/A+lSodnJuL3ZuipTSiTCAgxiLWo=;
 b=mUGj5sq7wWLs9tsPg065uFuWhxgJWBsIbrd5QftXtt1EC5ddobpna5wy
 jGvld0pAhr6NWBwylxhcaN/besH3J5L8NwMolywSnHM32d8Cmy4H7LbSm
 P8PVj4erkkOwUApyVECebGxF+T3vul7V81psxpipFCZzxk50PCENT/Q2C
 C7VVCYStWc3dEhnU0+11Lncqr9lLKuUeqs/H5pPhN0SiMmBS2mYnIe7en
 G6DRRGdiCAAwkIGHNt/UfxDIrA5fre/dNIPoCGKhHQ9Lggds6atP5488K
 UqgUq2ANzNq3BKSm0BXB0mXS8v04Jrt0Gx3i8IYmkt+OLX9DKo+lwy3IG A==;
X-CSE-ConnectionGUID: 2FZ6nGZwQDidW0m1FZseQw==
X-CSE-MsgGUID: +MH8M1uKSTmg5+6KssI1UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67260466"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="67260466"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:21:42 -0700
X-CSE-ConnectionGUID: T9AXegtKQnyxOhDrKnVOXA==
X-CSE-MsgGUID: M+qzkCaHStmFtC4M6lfTuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="214812139"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:21:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 06:21:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 06:21:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 06:21:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyZsitK2u3I7FYOqadxPnfMpy4Fvw3PAKuhrjZ8sSu2kWcOBdJUEuS9xnoPtkmUNvTMQnuc7xnj266aaFs7mStqC55uD3hgwGDf0SNEct6CupB4e8FmmKIru6Ym83eimYUeLN7IKz/jBVw2556PlbvKrpKEXBZhistpBfdrXzfAiyhfD1+Dd74tNuk2OzX39uzi8hw8qDiIdNNKa7s6LqXBBHUYUKxbWbPigJjr52dBuqD9aHHLRL3o7R8GdCnXRtjYnC4kSVvsMsW5mc1ZPn4/oDkUKP7C36RNuZGOQ2dlBeoyN57BNHQNS4VnffyNMsJoendbQeLFnUfNFOLhi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5d4l4eP1SuQGxN6cvQnowloniipV9oI1OdXUgHFf7sk=;
 b=gRj2bckNf/xm/ugQoI/nrCLbAmCYHX10roKDWgbHpfgBIQiQUGTpSQs1h67hR0yo5fucMzdQiwGfrdkh7g//u7sLynkdrVR9m7aHcQCLBiYPJCg9/zj5A257hbt4ScrNt5TKEEoY72OS17aAIzyZg4cMF8M2PMjQsveq2MEj1KtwyBrrdks8X5R0n3GLpNiuc5UhQhDW1hFzN2GUUeZVw0kH1sUKaJFi1CfBYsuRTxYtDak9Fcu5DucXBkoxFdtdZ9QLXYaExblwyGWsCXx7oLbbqUJhohNdydYw+00B1tpPPYcxCdEtfEwg8jPnZzU93OKbFvsGxV6r9rHYjuHQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:21:39 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 13:21:38 +0000
Date: Thu, 23 Oct 2025 13:21:33 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, <dmitry.v.rogozhkin@intel.com>,
 <sebastian.brzezinka@intel.com>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <dmitry.v.rogozhkin@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: [PATCH i-g-t 2/3] intel_gpu_top: Refactor flag toggling logic
Message-ID: <d45675703a882bf4b718c3e4427912b911a9b868.1761225010.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.34.1
References: <cover.1761225010.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <cover.1761225010.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU2PR04CA0306.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::11) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 437ada13-083b-45eb-a0f4-08de123718da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjhIN21icjlodVdyOXJKdWtYN25QdzQzY25SMXFLQm5iSk4rcFVyUy9KZUVY?=
 =?utf-8?B?M2g0Y0cwOGl2OTMrYTRJbXMvTnNpcHdrUTJRSzRGWUNHdUJGaGVJbEVPL1BG?=
 =?utf-8?B?MzZ6UjUwWDNrTzRQVWgrN0dJR2tNTGJRZ3oyZ1JWbk1xVVROUi9qU0gyOEVt?=
 =?utf-8?B?VDFETEo0QWhrTlI0bUVTK3ZsbkRhbE9aM0g2bC9jdjF3dUM3WXIyS2lIY09Q?=
 =?utf-8?B?b000bHN4VHBkSjdEckFlQmJLbTNpeUhqWmZEUlVwaFNPTVRFRjhSMy9LUTFS?=
 =?utf-8?B?Y1BuQmJSTU1HL1FwTGNONExXLy80bTRqRklrN01zMlhNdVpYcDkybU9zNGdZ?=
 =?utf-8?B?TFNMMkhQbE1RSlFPTUVtMXRaeTFXYzlkYzVhaFF3L2c0TVBDemtkdytDaEJl?=
 =?utf-8?B?em9iWjRFenNxOURXL1orQ0dLRk1wSUFXMTBHM0wzOUNSeHNDV2p2a3A0VVJC?=
 =?utf-8?B?VVdZUkMvbk9ySzgwTmtXWVlVb09XczVydXRFaHcvNW5FRE9hMld6SnlIUXVq?=
 =?utf-8?B?elRRNFdod0RSZ2c4KzhGUEtrMCtYRFV4Vk5TWUxjTTdMZXpDWkk3WEo1RDV5?=
 =?utf-8?B?MFlNblRETysxSHc5Vjc1WmcwT1VRa3lOc2N3aUMxQzl0WWZCRllKUXgxcTVo?=
 =?utf-8?B?Y082Zkx3Ymx1OWJSTWxkNlQxTHFxS1NTUzZCaytQQ2dheFZUQkozK1cwZ243?=
 =?utf-8?B?c3VwRk1oWmpFa0RaUFdkSGtoYWMvVGN1L2hFUXJ5TUVRVmFOZ0I5bllwK1dm?=
 =?utf-8?B?bzE1QlNzbVE2bWFtdURLS0ZIcVFmNWdNZFBvWTUvUk43MjhRMjB0a0JvVkJz?=
 =?utf-8?B?ZEU0c3BQVXJoTG0xWVYzVUdLMC9MQ0FPdHFqR0N1VzZZL0s5Y2xscmtmckty?=
 =?utf-8?B?ZDZSYzY0VEpSelRUS0d0RFVWZmZybnlheWs2cW10UksxQWIyMDdjVGp6OTJY?=
 =?utf-8?B?aG9vMFpJeTd4UE5yMTl3M0o0WFF3QnBtZXlpenMwNUZrVDNJV1pWSU0rMGpK?=
 =?utf-8?B?VS93T2ZqNXJ1dHhtWUkrMFlYcnIyamxmTm5kaWkzR1BsYU4wUTcyaHc2WjJw?=
 =?utf-8?B?MW8zY2xqT0ZTNUdLV1hNVVZQUisrTVZqdDJua2dtanR6ek1yY3dBSDhjeitm?=
 =?utf-8?B?b1Fqa2IwWjQ1bTg5bEZUZy8vb2tDT2NMZktUWnRjZWtoK0JXSGpYUlRLY0JB?=
 =?utf-8?B?N3FudE1INTJGeXdyT2VSeUErZzBFMmFIcStSSFpwRDZaNitEVnhEc1E2YmtU?=
 =?utf-8?B?ZW9lNmpjVHNXMWhGL2o5SHRpRG5WNjkwTzUxZXpZaFJpUnUxOFRubW02blAx?=
 =?utf-8?B?RWhrdmhxMnVzTENCTDd1ZUV2U01qajRRdGNWRDMwTUlJdWdKWUZ5OGNHMjBM?=
 =?utf-8?B?dmxZSE5OUVBpR3YzTkNHbytGOG80a1M5S1A5RzdZdVRoS0V6QWlyb01rSUtE?=
 =?utf-8?B?RmFUdjYyRUFXSXUrclgrQ2R3MGt3TzUrajRCTnRKUWN2WGhiUVpRK0g2dEt0?=
 =?utf-8?B?RjBOWXF0Q0k4VnhkY0ZhVzZpN1NqZVpTOVh2eGRFYU5zMForZTBaSjZLMURl?=
 =?utf-8?B?Um93blA5bVAzWHRNRkloa1hHdUQ5SlJ6Z2pRYUpITjdUclllK014aXhsUkxS?=
 =?utf-8?B?RFFSVWoxbmlTOTg0OTh4cTg2Wnc5U01FSDhnYUVUQUlUUVFPMkFxVlVZeDh3?=
 =?utf-8?B?NHBkOUVGaEVjQjFlVVpwM1pYbVB5dWt1S2VWVHFJRXI0cjgvSktVU3NKdmQx?=
 =?utf-8?B?dlhUNUhZMFRpU01DeW5XUkhZcnZxcWRPbUpYSkpLMDFQVGpDdGRKZ1k0ZHRO?=
 =?utf-8?B?VDYxdzJuVlFSUk9FYjdrRDJkYnNjU2xkNEVNL2ZpMFZBaEdLV1ZOR3FoQVZN?=
 =?utf-8?B?cmxVczRmM0srWC9MS0hvTmd0a2grNUJmR1JzK0RlRHdpUGZGK0pJcWdHRFh4?=
 =?utf-8?Q?RVz7Sd20DxxGrjQkn1mpTEkl5M2VDM22?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGhnYkhNZFU4ckJRaVcwUVRFTDJTSlVRMXNaT3labm1FaXZ4STlYd1ZZNTlp?=
 =?utf-8?B?ZldxcTVuOE1STStQN1dvZGpFYUNXdzlWWTBTZk9GUGVDcEpBVXpueFhZRWJy?=
 =?utf-8?B?anRRUXc2RUZoK1I4YmhSR0J4RGpsL2hQQ1ZPMjNlYUJ0MGo0NUV4MDBZcnla?=
 =?utf-8?B?L0NmUnY1OW80eGRNRXQ2TzJVcGVPYXQ0cnhKcWFLbERHbjFGR1E0Wi94WHFP?=
 =?utf-8?B?blJKbEN0akFhNE5YeCtzcjk1SE4xcjZZY1dqVjFrcTNFeU1BU0tlOTBVMHB2?=
 =?utf-8?B?Yi8wdUIwQWZjVWtaaWdKYkhqVGVQMklrODNxUmFJUnpaQk9NYWRnMW5hMVZv?=
 =?utf-8?B?RXdOSzJTZnhiM1U0a0MrRjgxNDB2VW56WFhKcFk2S2pEWEJqYyt6ODgvbnlU?=
 =?utf-8?B?YUNOQjBIcFVyUW1CRlYwdTA1UkQ3eENYNVBXaUJnRVdFV21hcVdKcDNSWnV5?=
 =?utf-8?B?aGVndXlKMFVjNG1zWUpQU2V4ZDlDNStwRU81Rm5xbFZpcm5hYTNEaTdYckFk?=
 =?utf-8?B?VjZESHRrWjAvb3NXQzdMay9SeHpicWRwWTQzdFRIQ1dYM1dGSHBSdnVteS9C?=
 =?utf-8?B?Mk9tL3FzSkE5Y3o5ZUFWWWIrV0pUTlFxZFdqc1ZDY0hPM05nWnlLY3RDQ25V?=
 =?utf-8?B?NkJxeWxiVEpHUlhHVUl4OTlXb0lVZjFNZEtzdUJ5dHg0alhIcnpVKzRrQ2Fi?=
 =?utf-8?B?enFYOEtoeUMzaEVVOGZGQ1RtUzFQRzVtTjg2bkFkbTRMT3JFOEZackhkR3pm?=
 =?utf-8?B?akl1emMycGNDODRwejczMCtsRU9vWWQ3TDdDWWNDaW93aVV6bHJrWlFOZk40?=
 =?utf-8?B?eVNqMmc1ZXVERENNL0tOTlM4Z1c0V3JLNHNBYkVXaXNvTUlPWDVSWTdSMk5N?=
 =?utf-8?B?aEVqOUJYNlErWTFveHk4RWx3a25aT2R6Tlh2LzUxcWhFZm93dDhqY2lLNXhV?=
 =?utf-8?B?TjNDSUlUaDFqQWtZWThIM0FmVmoyZUtkSGozbHl2anVlRzFScGljZDVyeEZu?=
 =?utf-8?B?RzJHV1R2bmE4MW9DZkM4dkxoWnJKdVZkd05HZ3gvekZnc2FVenVKdlBCQlJO?=
 =?utf-8?B?YkZjczY5U2JhZGFtK1BBOFFUeWJKUnZBZHREVFNyY21IcFR0UjYzYUs4QXhL?=
 =?utf-8?B?ZWlxV3VaWVpsenFhd2NOWU0vNllpeFBudll3clZGWnVyQlIrR0dDRlVtMGtN?=
 =?utf-8?B?ZU9VbU45QVZJUzJuaVZTdjhpV2MyTDBmMk15QnlIVlJydjU2LzlNcVpLWElF?=
 =?utf-8?B?eHFXT3k2M28rQmNMb3ZVRSs2QkR3RDNkdkRrLytjQmFxNVB2MlVENG1mWG1M?=
 =?utf-8?B?Q291RklSNFdLcTU2WjZ6YTlraVowTGswNXNFSDFJZ1N3cGE3eXA0WWtWSFJv?=
 =?utf-8?B?dytNMHdBaFdBYjhnblFIN0VBT0Q2d3NEOFR2QTdFbW12WmszTmg3Q1l2UWdW?=
 =?utf-8?B?cWduUm5SRVdCNTczUkM1Y2dyT0kzanErdGpGNk1XK2hKeWtzNDhVa0E3dTNl?=
 =?utf-8?B?dTVRc3FscE1XelQ2RnJUbGl0YjM3dEtWRG5zNVNEMHVMQTdWYlBhZEl0bDRo?=
 =?utf-8?B?QmY0Q2t4bmc2bkFLc1VNZENlTm5HMXBsYTlsbkJHZjBYZVNoZStHc05LTXBQ?=
 =?utf-8?B?UndNekQvQWlrOUVZZmI5Z2VVVUc4Rk5VLzJMSzlGNFY1VjZ4bzU2ZmxsYkZN?=
 =?utf-8?B?d3oxNmZHUkVYUGhrNWdZSi9meEpmUW1WRHFNOExrcW1WSmpjVjlkS0FScXJU?=
 =?utf-8?B?Rzd4cmI3RGJuZjc5amxET1d5MmwzOEpERFlrelI0VStrdGQ2MnJYekd2ajF5?=
 =?utf-8?B?Z0RmRUxmZ0xHUzJ0VVJrV1NDbUdTRlp5MHZkL0RqRVl5SDRDb1ZEMUxFekxW?=
 =?utf-8?B?dWF0Q0tIRG5KSk1CSE5vdGNpcEJ6WklZL001VFdFUkhYL0xOVEF0eW5PTG1z?=
 =?utf-8?B?a2RaOTAxMGU0d2hRQjBGVHVlOW1idW9sK2NqYlAzVSsyVk9sOVp3c0x1YS9s?=
 =?utf-8?B?dE44RktiNThNcDVtdmUzVkpGSXdoLzZVVkRvYkJSbVd6alVrNC9SUFlDR0F4?=
 =?utf-8?B?UnFqcHhNZkUwaFFGd1pOZDd0VGMzTG5zSHc1dlBvTkNxQzJQVFprd3pseWF4?=
 =?utf-8?B?ZlNwcS9QaENUY2JVQlB2WDU4V2tuTTBUSGtKdVlZVkljcGZxREJIeXZxK3N1?=
 =?utf-8?Q?OgC3RLReGtf7EdhSeW0ZX9k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 437ada13-083b-45eb-a0f4-08de123718da
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:21:38.3917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcUPUgJuQPaWYcUQDREpCCdURgH66M9vtoeBaVbpRQoD0HcEDo9tRgocgKRLs4ntwt+c1iovMjOrU0XcWWSFsx7l9OdHQcKJr4g+wW2pUW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
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

Introduce `toggle_flag_and_set_msg()` helper to simplify repetitive
flag toggling and header message updates. This reduces code duplication.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/intel_gpu_top.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index f1b7ab46f..1bd88ba7c 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -2396,6 +2396,12 @@ static void process_help_stdin(void)
 	}
 }
 
+static void toggle_flag_and_set_msg(bool *flag, const char *msg_on, const char *msg_off)
+{
+	*flag ^= true;
+	header_msg = *flag ? msg_on : msg_off;
+}
+
 static void process_normal_stdin(void)
 {
 	for (;;) {
@@ -2411,18 +2417,14 @@ static void process_normal_stdin(void)
 			stop_top = true;
 			break;
 		case '1':
-			class_view ^= true;
-			if (class_view)
-				header_msg = "Aggregating engine classes.";
-			else
-				header_msg = "Showing physical engines.";
+			toggle_flag_and_set_msg(&class_view,
+						"Aggregating engine classes.",
+						"Showing physical engines.");
 			break;
 		case 'i':
-			filter_idle ^= true;
-			if (filter_idle)
-				header_msg = "Hiding inactive clients.";
-			else
-				header_msg = "Showing inactive clients.";
+			toggle_flag_and_set_msg(&filter_idle,
+						"Hiding inactive clients.",
+						"Showing inactive clients.");
 			break;
 		case 'n':
 			numeric_clients ^= true;
@@ -2434,18 +2436,14 @@ static void process_normal_stdin(void)
 			in_help = true;
 			break;
 		case 'H':
-			aggregate_pids ^= true;
-			if (aggregate_pids)
-				header_msg = "Aggregating clients.";
-			else
-				header_msg = "Showing individual clients.";
+			toggle_flag_and_set_msg(&aggregate_pids,
+						"Aggregating clients.",
+						"Showing individual clients.");
 			break;
 		case 'm':
-			aggregate_regions ^= true;
-			if (aggregate_regions)
-				header_msg = "Aggregating memory regions.";
-			else
-				header_msg = "Showing memory regions.";
+			toggle_flag_and_set_msg(&aggregate_regions,
+						"Aggregating memory regions.",
+						"Showing memory regions.");
 			break;
 		};
 	}
-- 
2.34.1

