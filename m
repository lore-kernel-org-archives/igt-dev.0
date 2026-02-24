Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1534DEFB810
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74A810E4F8;
	Tue, 24 Feb 2026 08:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NX3Ya5SH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BE710E4F8
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771922118; x=1803458118;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JtZLLU0BwPtzCr5Ypz7nBzSzFThbC5MYBwBlRd78F1s=;
 b=NX3Ya5SH4zmN0pT9JjvDmGiAXfPBFljb3noQ2gGbEJvziQCpzSIXFcxX
 x3/kw1z/hZ+EsecbeXSUQW22vLI7usItRNyblI4BJ/d4/5z3a+0ECRDWM
 R76wdiRRFqDOgJ9/S6BF371Ilu9G57j3nDfiGXoz+/11h4FMNAlS1us9b
 8z3kPoiqliOhWXbZcj16R1kD6mt2Uzw65O6EHIYr+j4twPCvIH45OkF0Z
 n1qx3ABwWM4WnPeoTomx2ebMEmzfXRQizY5PPjnKNrIe/1kkLlCWR1t+k
 Nn2l4/dkgwI8df54SSE0a64spQB6RmPSfPJDf32GKS9YR3IRs19/GIFWX w==;
X-CSE-ConnectionGUID: aBJ53fOyR9W6IpHxuphZ7g==
X-CSE-MsgGUID: 0DIVL5VSRcOEZG4+mIWhCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84292375"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84292375"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:35:17 -0800
X-CSE-ConnectionGUID: 96WxqbfPTOqJF5lbju9MqQ==
X-CSE-MsgGUID: GVMOqzFmQrycyWRZ8zAB+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="214194712"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:35:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 00:35:17 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 00:35:17 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 00:35:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5dqvk0wl1H+lVa22Rkj5jQH24HqXYaeTpTVmUkxpGQdyQND6UinUCsPM2Letewg9gMKln7aDM3urQ8Z+i+sbFjZgy6ne0dRXgeIMcF90iMDFSmhuqTTAIxd/jgDKCdsFt7Bh7lEtyyQhRM3OXOWpgyV88gDPSVZobx/fRcIWHz2nezeCSiA+S60IJxsy3DaSdYmydFyTY62ISu5dQuOHnjoPzPp/VTZmFrBc0YwxC+l1ec4r21yA0LLlntleKQeTnNAtPgHrKZoTa5sGIEwUIKEggtpEEj+ak5YfZrOgJZDtt1ZwvmLoCvMP0Go8K9qO9tNzeGOhxSOirNTAYb1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZhVERybKEArFtQ9Im/M6JNzghqKMKtXv9OXsTnV8dg=;
 b=jB6rXT1fmHCX6K7cOfzunZAGrJGUHgEOOCF4/J46BQQ+FaWPPUdgkUU+XZ3/Y8RVsTeGD0TFdBXRZs/SKH6xpAYJRdZiZC5RpE8+32dxtKSe8JmHjlseBsrc9KPYT7Xt0x0zGSFsS5u+PydAynqFaFjHBpec22c++QtVAkohIvLpNJZz3Kq6qqeleW44IqWspQRtIfeGh0JBsEiKMAU0Om5VgQsYr9iETzCk6pBXz3PpZUsj9/NoX/qjh19siMcpJdoM9cf0bXz+5c3i3f+YE9UTOS4r6MMKkriNhAmfVRegXAoYQNHICBbQRfNItK7XUtFTM3Qzc1+W9xflptRPRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by BL3PR11MB6457.namprd11.prod.outlook.com (2603:10b6:208:3bc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 08:35:15 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 08:35:15 +0000
Message-ID: <b2bf05a5-f786-484b-948c-3a7a99825d25@intel.com>
Date: Tue, 24 Feb 2026 14:05:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST
 suspend-resume test
Content-Language: en-GB
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260220152239.276034-1-kunal1.joshi@intel.com>
 <20260220152239.276034-4-kunal1.joshi@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260220152239.276034-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0236.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::10) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|BL3PR11MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: c06348a5-86fd-42f7-c4b5-08de737fa17c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzZhNmJXejdVUW1JeVdLdjBibmFBYk5CM0RRdzBKUjE3ZXFCbUFTTUNDQkRs?=
 =?utf-8?B?cm9wTG5RNGdjZExjZk5wZmxjOHh2akR6WW9BRlBjSFVSM1lqMkdZRXJyQnlu?=
 =?utf-8?B?Zm5KZUZHNE1rZVZDMHMvb21CdWN5RFcxcGR6aVZ1VC9rR2QxaVE2aFNjb0tw?=
 =?utf-8?B?YnpMTzMzNzAzOFR3LzVweE5lSXdxekErUlB2T0tFdURUL0szRlJaWXlJaDlw?=
 =?utf-8?B?RmFDZklIRmZMY1J4SXVDQUlJVlVjZkpXOHpVSS9HM2FLNDdXc0dPcmhKQkg2?=
 =?utf-8?B?c0NOUHhnMWFJTVB4WUVML201ak5GSkw0UFRtbVhXcStPYnpRdzBiRy84SU9S?=
 =?utf-8?B?NXpERnZjT3dPMFZLdlkyMFQweVRselJYRmVkbVo1UU9KUEtlVjAwNWFwNndp?=
 =?utf-8?B?dW1NTWt5MXYrWmxhOXhxaHZwUnhFaVBkVnM5K0pYY0hOYkhBMWhtK2RYWThM?=
 =?utf-8?B?TlZxTm96Z3E5cHFYZmZDUGt0Tm1GMTQvTVBKdGVEY3FZd2tNN05DSnJtZUVw?=
 =?utf-8?B?ZGk0b0I3ek9ZVUp5dGRncVV4NXlueXNYNHZtS3R3MGNMdkI2TDZNdGI4aFAz?=
 =?utf-8?B?V1BhbjJxRkNQK0UxL1MzZXBQbDU2RnVvaUFBSkpXR1pveTdhSThXNjZpcG9v?=
 =?utf-8?B?OUkvZk1CaXJWZXNYblY3YnpEeGROQkpGR3N4OWhJODdMR0J2TUd0TlppWWpx?=
 =?utf-8?B?S3FiOGtaRG1pQklZZnV2YjZPVmtEMFNINVBJbWNva1N5eXZ6T0xwQUhuMDVi?=
 =?utf-8?B?dVp4NFErOTJOSnltR1g2QkdJVHNsczBxR3ZuR0dmYnlBMWZaanZLTXU1aHVj?=
 =?utf-8?B?K0M0Tk10WFErVVhCSlQ3SmlOekRUdDFhVnowTFBGczQ2MEZ3N3FnUk1RTU1o?=
 =?utf-8?B?SSt6cEcvNndhNXluN21nZUdqcWhOUkJaU3JSc3l1TTRIbWw5STZvbzl6VDgw?=
 =?utf-8?B?SkJXbFE2ZGhTdlBqa1NTeUg1cUtQazJKYlZyYk5yOUYveVpHYTVCRTZ6Wi9N?=
 =?utf-8?B?ay9GclZsNElpYlgwYTNDdzNpV28wSk9uY3k4WFFrQlhWUUNjQy9NVVNGL0tt?=
 =?utf-8?B?R1JMYlV0U1NDSHlvWnJZa3lQVnl0UUJIQmRmaFg2dUlhNFlXSEVYUm9nSHJl?=
 =?utf-8?B?aGNNb2lxSnhqRkJPdTBWRi9OcWNrbjJSWGNUcXIrZG9NZjNDTkVQVkFOWTFp?=
 =?utf-8?B?Uk9TNXlBc3gvOFExT1BPcW5UWWlGM2N1c2FWU3RzL0hQNmNjOHJsekpnZ2Q5?=
 =?utf-8?B?V3VDYXJ6cGJyeFhYUXlSUWRUd0RHRnBtL3hhNHpxQ0lia0NYMnRBWWQ3K3kw?=
 =?utf-8?B?ZW5wUU9hRk5OSGs3bXl4UXhiOENEOXpIaXNPTFNUYUpjTjFNNTRSdjhQOUZX?=
 =?utf-8?B?TW90VWJES3IyV2hxTGZ4a2JIVkdTSmI2NmlOZUw2amM5T2hvbnRxTUVxc3NG?=
 =?utf-8?B?aGV2NWM3bDNuSTRsd3NTb1cvdjhVN0JMT1FUdVlYMllIK0RLOXEwY3d4UDJi?=
 =?utf-8?B?ZXZWQXFUckRZMXN5MVBoNEpRbm1jUWtqRmQ2bzhhRURrOTFsYlRFLzBhTHd2?=
 =?utf-8?B?U3ZoSW9XMXhhQmxmVXJibDJXekJudFJIQkhLU0ZFQlE4K2pHM2FNY29NUmwv?=
 =?utf-8?B?WGNia1ZKOUVDdW9lZVQySkRISmJ2TjRGNHpzSXo1aTRRMkVYU2NjaitkdzI1?=
 =?utf-8?B?cHh6Q09qWGY5WUw3UGlYTTlmRjI1ZGV1TmViOVFnaERGZU9kaTFESTJuOVdC?=
 =?utf-8?B?UVE3bFIxdDJWa3Fuem1pNG10Z3QycDlEVnNDMHplaUozQ0NtSlpZL2UyZE8x?=
 =?utf-8?B?WUxnNTh5d0k1Yy9sZEZmVnkrcGFERWFBTUFoVjFxelhIOGsyRUMwOTZXTEdo?=
 =?utf-8?B?RmtHWk1oUVNGNThJZmZsaHJhRHg1SUo0bWY2eXlUaW9GMXFvMVBTbG40eWRY?=
 =?utf-8?B?aFBOeXZ4c2VnU1VVL3dsY2xnMmRWZWxJOXhpZjYvOUtsckhBTEF2Q3V0TDIy?=
 =?utf-8?B?c1Fycnkva3A4S1ZPVmYzZ1dsc3BRcGhWMjdMaXRRajFnZ0Y4YzNsSFY5VjdX?=
 =?utf-8?B?clVTY29xcU12Vi9xaGsrWklETWs4amJXV0h2UGlnMXREd3U0UTFSSDBBWUx5?=
 =?utf-8?Q?+itA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTVTN2NKZ2pZaWx5enpKOWNCc0swR3VrRzFUZU5zMHRQYUp6UEVqaFNKRjk2?=
 =?utf-8?B?bjhxWGVQVXpFeXFuUEpMMVZtRHE3ekp0bTNldllBNXZSTnZldVZvQ3B6UjU0?=
 =?utf-8?B?VjBrck1UbnV0eW12a01LTm5mRW1BUGNDUWJhUU85YTNFUVlJVFBpem5sV0hX?=
 =?utf-8?B?THJuZy9DZVRHT1lBUkZPMWEyUDBuWXAzN3E2YXRIQWsxaGRoeCtnbU1Ibzh2?=
 =?utf-8?B?cXJiRzNRNVBkQUF2YjlhbW14TWlJYnZLSXNyc1hhcmRiMGJrMDd0cFNYU0Zi?=
 =?utf-8?B?OVBNcE9HNjB6OWFVMFBNbWU4NjhVeHJCV3FJMTRsYzRUZlhCNERyNlhGb1JT?=
 =?utf-8?B?ZzdMQU4rNDJiU2ZEbXpwSHFYSkZsVlVnY2dFZUpGL3dQeUQ3S0Q3UjVEdjFo?=
 =?utf-8?B?QjNjRThiK241L0JnZ0xiR3crYk5STmJjekgxQThvdlJkc2IwcEFsS2RONG0v?=
 =?utf-8?B?dkw0S2s2a3AxZFpkL3ljZHlUem1XYmNWZXZIUEtsK24wK3Y2aFJWME9SRWNr?=
 =?utf-8?B?SnJiNGhtK0V2d2VmNXBBNjJzcXp3eVRpenRYS3h3MkZiL3NvdnFoQnBtTGJC?=
 =?utf-8?B?QXRlVlNyY2J3M3dHczB6a0dPdkZacVdTMWFlcVRiTVlMaENyekgwWnNSNk5D?=
 =?utf-8?B?YzA1VFBKcXFiNXZBWGRJU3J1VjRZOWluQ1ZvNG02V001ei9qdTVXRTNackRZ?=
 =?utf-8?B?UjdMYVFlSmtNbnkrSFNUOHVtSFkrdUFIcUFBU0w0U0Vka0Z6NUFacktoNU54?=
 =?utf-8?B?d0tldHlLRlVNSnJ1R2RSY1VtUFYvU1A0R0JXRFphVHgzMko5RkxyMVNEdmQ2?=
 =?utf-8?B?cnh3blJUeFl3OGV5SUhNRWg5ZzhOc0xscFM5TWVNM08zUVY2MTBSMHY1amdw?=
 =?utf-8?B?OHVFOVE2TzlrMnZqeUtyTndXRFpDSnYxNDVmbHNEMnh0bjlNTk5WcjByaWFr?=
 =?utf-8?B?V29xUjdRK1lmeE9TYUp1TjFsNThZTWpNSFhuWjRaSFVFMnNoRjlpRXo3S0th?=
 =?utf-8?B?aml6NVJiNmRUbjlEK0NaNmxVZ3JSU21ZOWd4WXU3QThicVp5YVkzcThkcHl5?=
 =?utf-8?B?ZE90TzEweDJHRHVTT2F6UkNGMHMrOXZvK1dGbVFuTmJRN2JaS1QzbnlLelZ1?=
 =?utf-8?B?WnFTbjB3T1pUZlNVZnNGYTNQL0t2U0F4Ym9vczJleitFaWtXWWZPOGozeVZP?=
 =?utf-8?B?enp3d3lGRUsyRjdQSDVMVUVXZ1lRT0NONjdRTTYwZEp3bnJWR1VwTTY0V0Rk?=
 =?utf-8?B?c1NIY2ZZeWVYWHZBeHB5SkFIeE1uNUZpVTJaVUk1ZHhDUktCdi9Ya01OWnBB?=
 =?utf-8?B?VWJCS2tUa05qblBkODRiSTREak5tNVR1YkZoeUt2SFZFM3FrM2l2Skk2K0E0?=
 =?utf-8?B?UlJwMjZGQmk1cmt3cWVjY2hoalBTSC8yK05ENlRseTNLN213K3huYTJhcDJt?=
 =?utf-8?B?b1RvRVhCTGxjZUZGK2MzV1d2RVBZek1ZUDhVQUFZUlFVcWo4Ry93NXA0cGNZ?=
 =?utf-8?B?THJaVzMxWC90NWV4NzJzWHI0Y25iL1FRenhzblFUdE4rUVVSZnVteVg5dFpi?=
 =?utf-8?B?K3lkUWh5K2tHVWVqanFOd3RUeEFRRTVqT1B2c3hZOEFvb0MrSmdpSjVRTEZB?=
 =?utf-8?B?SC9HbnorNndsUUpyWjFPT250L3hIVWp5Wnl0dnZYVllzR3pkWHFsTk1wUU5n?=
 =?utf-8?B?TEpoR0VaNXFxQm5ENkFiemxxNk04TVNYZVpLUzFRRzhhaWx2UjF1RVgwKzd5?=
 =?utf-8?B?Smdrc3Jud29IQzBFekR1OVliaGhlRGtOb3JwaGJHc1dRSEdpdmdndUQxbW05?=
 =?utf-8?B?UHBDZWNzZ3dRK3RHOXVhbmJwS2VHYzNiQXVzTEJZYXpqcXU1VmlBNmJUdWF1?=
 =?utf-8?B?YUg0ZHZ4QWxRS0xmYTRRSkRPNUhNOTdsaituc1dXbTdUZnJjOUY0NE9mdmNh?=
 =?utf-8?B?ekd1OWVXVGErZUJBL1NtZGRRSVpRVmdrSTNiVGlaZTRxSGtNZmZ0QURSQU5h?=
 =?utf-8?B?UW1IVE9ScG5BaElndlF5dStTVk9xdTh5MTE4Y0lPeWFLaWlCYkJ6bzRuTUJn?=
 =?utf-8?B?WTlSNXJqaU92enJiclk0U3FlK2ZNeTBpb1R2WkIrUkJZMmdZVmxYdnZuRWVt?=
 =?utf-8?B?bzg3c09wNTZOd08yelR4VStobTREZzBVek5UMHZOZkJKUXpIZE5wRy9wSnpv?=
 =?utf-8?B?T0Mvc0xkVThnNHBYWlJIL0Y2UTZLK0FBMkJ5TFdlQzVVNmdBUmN2RUt4RExT?=
 =?utf-8?B?TEVJdkcxbU9Vdk56aURCbFVLM0J6N0krYlE5Y3d2dDg3Q3FvVXg5cGNvRUFZ?=
 =?utf-8?B?MUFoanA2MHdxOFV1eERJRHdZczRvaHZEOUx2bS9XdGJ6dzdQbkZxR3hMUFRs?=
 =?utf-8?Q?u2q8V+A+ks5eQLRI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c06348a5-86fd-42f7-c4b5-08de737fa17c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 08:35:14.5435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KW5nVLmO3LlObJYtf9RZinnmSNdVriZOuSpPtaWYHf4u8GIr1AZfldOJhthyCK4TLhsHuMHyoyjToOxVP2s1jLSpoA/O7Ekb/Dv5cmtc7sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6457
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


On 20-02-2026 08:52 pm, Kunal Joshi wrote:
> Add a new subtest mst-suspend-read-crc that verifies MST outputs
> preserve display content (via CRC comparison) across S3 suspend/resume.
>
> The test enumerates all connected DP MST topologies, and for each root
> connector exercises all non-empty subsets of the discovered MST outputs.
> For each subset it:
>   - Assigns pipes and selects non-joiner modes
>   - Fits modes within bandwidth constraints
>   - Creates green FBs, commits, and collects pre-suspend CRCs
>   - Suspends to memory and resumes
>   - Collects post-suspend CRCs and asserts they match
>
> v2:
> - Add error handling for igt_pipe_crc_new (Thasleem)
> - Improve log format with index for clarity (Thasleem)
> - Order declarations in decreasing line length (Thasleem)
> - Add print message when no MST found (Thasleem)
> - Add bounds check for idx in subset loop (Thasleem)
> - Use igt_crtc_crc_new() instead of igt_pipe_crc_new() (Ville)
>
> v3:
> - framebuffers missing in commit (Bilal)
>
> v4:
> - Drop cleanup framework
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/kms_pipe_crc_basic.c | 314 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   3 +
>   2 files changed, 317 insertions(+)
>
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index f7b6ec293..59a44e92e 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -32,7 +32,10 @@
>   
>   #include "igt.h"
>   #include "igt_sysfs.h"
> +#include "intel/kms_mst_helper.h"
> +#include "intel/kms_joiner_helper.h"
>   #include <errno.h>
> +#include <limits.h>
>   #include <stdbool.h>
>   #include <stdio.h>
>   #include <string.h>
> @@ -77,6 +80,11 @@
>    *              CRTC does not cause issues.
>    */
>   
> +/**
> + * SUBTEST: mst-suspend-read-crc
> + * Description: MST suspend test for pipe CRC reads.
> + */
> +
>   static bool extended;
>   static enum pipe active_pipes[IGT_MAX_PIPES];
>   static uint32_t last_pipe;
> @@ -96,6 +104,306 @@ static struct {
>   	{ .r = 0.0, .g = 1.0, .b = 1.0 },
>   };
>   
> +#define MAX_MST_OUTPUT 3
> +
> +static void collect_single_crc(igt_crtc_t *crtc, igt_crc_t *crc)
> +{
> +	igt_pipe_crc_t *pipe_crc;
> +
> +	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
> +	igt_assert(pipe_crc);
> +	igt_pipe_crc_collect_crc(pipe_crc, crc);
> +	igt_pipe_crc_free(pipe_crc);
> +}
> +
> +static void collect_crc_for_active_outputs(igt_output_t **outputs,
> +					   int num_outputs,
> +					   igt_crc_t *crcs,
> +					   bool post_suspend)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_outputs; i++) {
> +		igt_output_t *output = outputs[i];
> +		igt_crtc_t *crtc = igt_output_get_driving_crtc(output);
> +
> +		if (post_suspend)
> +			igt_require_f(crtc,
> +				      "POST-SUSPEND: no driving CRTC for %s (topology changed?)\n",
> +				      output->name);
> +		else
> +			igt_assert_f(crtc,
> +				     "PRE-SUSPEND: no driving CRTC for %s (bad pipe assignment?)\n",
> +				     output->name);
> +
> +		collect_single_crc(crtc, &crcs[i]);
> +	}
> +}
> +
> +static void wait_for_vblanks(igt_output_t **outputs, int num_outputs,
> +			     bool post_suspend)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_outputs; i++) {
> +		igt_crtc_t *crtc = igt_output_get_driving_crtc(outputs[i]);
> +
> +		if (post_suspend)
> +			igt_require_f(crtc,
> +				      "POST-SUSPEND: no driving CRTC for %s during vblank wait (topology changed?)\n",
> +				      outputs[i]->name);
> +		else
> +			igt_assert_f(crtc,
> +				     "PRE-SUSPEND: no driving CRTC for %s during vblank wait (bad pipe assignment?)\n",
> +				     outputs[i]->name);
> +
> +		igt_wait_for_vblank(crtc);
> +	}
> +}
> +
> +static void log_crc_for_outputs(igt_output_t **outputs, int num_outputs,
> +				igt_crc_t *crcs, const char *stage)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_outputs; i++) {
> +		igt_output_t *o = outputs[i];
> +		drmModeModeInfo *m = igt_output_get_mode(o);
> +		char *s = igt_crc_to_string(&crcs[i]);
> +		igt_crtc_t *crtc = igt_output_get_driving_crtc(o);
> +
> +		igt_info("[%d] %s: output %s -> crtc %s, CRC %s, mode %dx%d@%d\n",
> +			 i, stage, o->name,
> +			 igt_crtc_name(crtc),
> +			 s,
> +			 m ? m->hdisplay : -1,
> +			 m ? m->vdisplay : -1,
> +			 m ? m->vrefresh : 0);
--> I think we can guard this using igt_debug() instead of igt_info().
> +		free(s);
> +	}
> +}
> +
> +/*
> + * Select non-joiner modes for all outputs to ensure CRC collection works.
> + * Joiner configurations consume multiple pipes and are not yet validated here.
> + * Must be called before igt_fit_modes_in_bw() so that bandwidth fitting uses
> + * the correct (non-joiner) modes.
> + */
> +static void select_non_joiner_modes(int drm_fd, igt_output_t **outputs,
> +				    int num_outputs)
> +{
> +	int max_dotclock = igt_get_max_dotclock(drm_fd);
> +	int i;
> +
> +	if (max_dotclock <= 0)
> +		max_dotclock = INT_MAX;
> +
> +	for (i = 0; i < num_outputs; i++) {
> +		igt_output_t *output = outputs[i];
> +		drmModeModeInfo non_joiner_mode;
> +
> +		igt_require_f(max_non_joiner_mode_found(drm_fd,
> +							output->config.connector,
> +							max_dotclock,
> +							&non_joiner_mode),
> +			      "No non-joiner mode found for %s\n",
> +			      output->name);
> +		igt_output_override_mode(output, &non_joiner_mode);
> +	}
> +}
> +
> +static void create_fbs_for_outputs(int drm_fd, igt_output_t **outputs,
> +				   int num_outputs, struct igt_fb *fbs)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_outputs; i++) {
> +		igt_output_t *output = outputs[i];
> +		drmModeModeInfo *mode = igt_output_get_mode(output);
> +		igt_plane_t *primary;
> +
> +		igt_require_f(mode, "No mode available for output %s\n", output->name);
> +
> +		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +		igt_create_color_fb(drm_fd,
> +				    mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR,
> +				    0.0, 1.0, 0.0,  /* Green color */
> +				    &fbs[i]);
> +		igt_plane_set_fb(primary, &fbs[i]);
> +	}
> +}
> +
> +static void run_mst_subset_and_verify(igt_display_t *display,
> +				      igt_output_t **active_outputs,
> +				      int num_active,
> +				      int n_crtcs,
> +				      uint32_t master_pipes_mask,
> +				      uint32_t valid_pipes_mask)
> +{
> +	igt_crc_t pre_crcs[MAX_MST_OUTPUT];
> +	igt_crc_t post_crcs[MAX_MST_OUTPUT];
> +	struct igt_fb fbs[MAX_MST_OUTPUT];
> +	uint32_t used_pipes_mask = 0;
> +	enum igt_suspend_test stest = SUSPEND_TEST_NONE;
> +	int drm_fd = display->drm_fd;
> +	int a;
> +
> +	igt_require_f(num_active <= n_crtcs,
> +		      "Not enough crtcs for MST subset\n");
> +
> +	igt_require(igt_assign_pipes_for_outputs(drm_fd,
> +						 active_outputs,
> +						 num_active,
> +						 n_crtcs,
> +						 &used_pipes_mask,
> +						 master_pipes_mask,
> +						 valid_pipes_mask));
> +
> +	select_non_joiner_modes(drm_fd, active_outputs, num_active);
> +
> +	igt_require_f(igt_fit_modes_in_bw(display),
> +		      "Unable to fit modes in bw\n");
> +
> +	create_fbs_for_outputs(drm_fd, active_outputs, num_active, fbs);
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	/* rtcwake cmd is not supported on MTK devices */
> +	if (is_mtk_device(drm_fd))
> +		stest = SUSPEND_TEST_DEVICES;
> +
> +	igt_info("MST subset: %d outputs, n_crtcs=%d\n",
> +		 num_active, n_crtcs);
> +
> +	wait_for_vblanks(active_outputs, num_active, false);
> +	wait_for_vblanks(active_outputs, num_active, false);
> +
> +	collect_crc_for_active_outputs(active_outputs,
> +				       num_active,
> +				       pre_crcs, false);
> +
> +	log_crc_for_outputs(active_outputs, num_active, pre_crcs, "PRE-SUSPEND");
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, stest);
> +
> +	wait_for_vblanks(active_outputs, num_active, true);
> +	wait_for_vblanks(active_outputs, num_active, true);
> +
> +	collect_crc_for_active_outputs(active_outputs,
> +				       num_active,
> +				       post_crcs, true);
> +
> +	log_crc_for_outputs(active_outputs, num_active, post_crcs, "POST-SUSPEND");
> +
     Variable naming -->'a' could be more descriptive, might be --> 
output_idx? or any suitable..
> +	for (a = 0; a < num_active; a++)
> +		igt_assert_crc_equal(&pre_crcs[a], &post_crcs[a]);
> +
> +	/* Detach FBs from planes and remove them to leave a clean state */
> +	for (a = 0; a < num_active; a++) {
> +		igt_plane_t *primary =
> +			igt_output_get_plane_type(active_outputs[a],
> +						 DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, NULL);
> +		igt_remove_fb(drm_fd, &fbs[a]);
> +	}
> +}
> +
> +static void mst_suspend_read_crc(igt_display_t *display)
> +{
> +	int n_crtcs = igt_display_n_crtcs(display);
> +	igt_output_t *active_outputs[MAX_MST_OUTPUT];
> +	/*
> +	 * igt_find_all_mst_output_in_topology() internally caps
> +	 * discovery at IGT_MAX_PIPES entries, so this is the
> +	 * correct upper bound for the buffer.
> +	 */
> +	igt_output_t *mst_outputs[IGT_MAX_PIPES];
> +	/* Fixed upper bound for tracking traversed root connectors. */
> +	int traversed_roots[IGT_MAX_PIPES] = { 0 };
> +	int drm_fd = display->drm_fd;
> +	uint32_t valid_pipes_mask = 0;
> +	int num_mst, i, num_active;
> +	uint32_t master_pipes_mask;
> +	igt_output_t *output;
> +	igt_crtc_t *crtc;
> +	int num_roots = 0;
> +
> +	for_each_crtc(display, crtc)
> +		valid_pipes_mask |= BIT(crtc->pipe);
> +
> +	igt_set_all_master_pipes_for_platform(display, &master_pipes_mask);
> +
> +	for_each_connected_output(display, output) {
> +		int root_id;
> +		bool root_seen = false;
> +
> +		root_id = igt_get_dp_mst_connector_id(output);
> +		if (root_id < 0) {
> +			igt_info("Skipping non-mst output %s\n", output->name);
> +			continue;
> +		}
> +
> +		for (i = 0; i < num_roots; i++)
> +			if (traversed_roots[i] == root_id)
> +				root_seen = true;
> +
> +		if (root_seen)
> +			continue;
> +
> +		num_mst = 0;
> +		igt_require(igt_find_all_mst_output_in_topology(drm_fd, display,
> +							output, mst_outputs,
> +							&num_mst) == 0);
> +		igt_assert_f(num_mst <= IGT_MAX_PIPES,
> +			     "MST topology discovery overflow: num_mst=%d > IGT_MAX_PIPES=%d\n",
> +			     num_mst, IGT_MAX_PIPES);
> +		if (num_mst == 0) {
> +			igt_info("No MST outputs found in topology for output %s\n",
> +				 output->name);
> +			igt_skip("No MST outputs found in topology\n");
> +		}
> +
> +		if (num_roots < IGT_MAX_PIPES)
> +			traversed_roots[num_roots++] = root_id;
> +
> +		if (num_mst > MAX_MST_OUTPUT)
> +			num_mst = MAX_MST_OUTPUT;
> +
> +		igt_dynamic_f("mst-root-%d", root_id) {
> +			int mask;
> +
> +			for (mask = 1; mask < (1 << num_mst); mask++) {
> +				int bit, idx = 0;
> +
> +				/* build subset for this bitmask */
> +				for (bit = 0; bit < num_mst; bit++) {
> +					if (!(mask & (1 << bit)))
> +						continue;
> +
> +					if (idx >= MAX_MST_OUTPUT)
> +						break;
> +
> +					active_outputs[idx++] = mst_outputs[bit];
> +				}
> +
> +				num_active = idx;
> +				if (!num_active)
> +					continue;
> +
> +				igt_display_reset(display);
> +
> +				run_mst_subset_and_verify(display, active_outputs,
> +							  num_active, n_crtcs,
> +							  master_pipes_mask,
> +							  valid_pipes_mask);
> +			}
> +		}
> +	}
> +}
> +
>   static bool simulation_constraint(igt_crtc_t *crtc)
>   {
>   	if (igt_run_in_simulation() && !extended &&
> @@ -525,6 +833,12 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		}
>   	}
>   
> +	igt_describe("MST suspend test for pipe CRC reads.");
> +	igt_subtest_with_dynamic("mst-suspend-read-crc") {
> +		igt_require(igt_display_has_mst_output(&data.display));
> +		mst_suspend_read_crc(&data.display);
> +	}
> +
>   	igt_fixture() {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
> diff --git a/tests/meson.build b/tests/meson.build
> index 7f356de9b..06c0d8e98 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -399,6 +399,9 @@ extra_sources = {
>              join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
> +	'kms_pipe_crc_basic': [
> +		join_paths ('intel', 'kms_mst_helper.c'),
> +		join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }
>   
