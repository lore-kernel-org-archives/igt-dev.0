Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D074C0218A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 10:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C65A10E645;
	Tue, 28 Jan 2025 10:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqGXlRes";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9B910E645
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738061127; x=1769597127;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YHq2PAlcDL0Jbb7c54EBkjF1EgOv3D5sCVnQTsQ9R/I=;
 b=VqGXlRes7lPlktF8U7uKZ7KL2feBwcozfsW0Mz1/VLDtpy+PfZXufROq
 NB6tpQadLHq9dPI5EytpiJgYs4krkCZiy907iyO1mFfA7omb+v4jCzhrM
 zlmm+HCV9tCdCs38Wtw7FsCZYas8aeijYt9Swr6DXnJU0Xsxthnz4AmKa
 WlkGpcKlFtJ2PL0vgJ61qbKarIfmPuuzF1UTSFP1hIaEHYYPx3l7hw3yv
 FnEEQZ9HBwj4YR3t3zM5z3apAcitdVfjWphrk1WrGwdSY848CJR6apHGy
 KUTO7R1APjKIYsVgDeLBqp4syyeZNNB1XgIAy8lGNMTH4J4ugKRb29kqA Q==;
X-CSE-ConnectionGUID: MNO1HbzESdmxYcxffE4v3w==
X-CSE-MsgGUID: s1U2mFOUQeC5Hx/EBW1zsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38791110"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="38791110"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 02:45:26 -0800
X-CSE-ConnectionGUID: R6nRMvhmRbWia78udL6sag==
X-CSE-MsgGUID: Zwl/j53/TEyPg+J4+8G7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="108505654"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 02:45:25 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 02:45:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 02:45:25 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 02:45:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyepfKlAQVsfZT61VuuFw0DE6jCamZVNPLAvS4BMuPIK1qNz1+ATCsDJQbobMeqIynKkyZKdRNN8Aw20ZVmnesswuVulmkvTzMEbJrsS99VD8sJdz4OVXeKtNLhKrDLAWYLvgcoPGtLr3WzZLO7D4h33izygXVFOExqd9M2CyI20RCEp5HnvovkuHBbKdKjZnpsO7CE367yv5uwcQ9tQINiuhgpFbjXo3WIFWcdwjYvOPQ9Q7eF3xDFPobpcdwyTS4Xe+2qTuOnE6tsZyfa35WFkynMvcOUfi2aEXeubv85oYWeVmYzhzyy/MYtdEBx9F5gLwhnDxaSd0TZpPw674g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkVkyJ7YZF3KLSTdtzk6CB+U64X5SFXLhKcD/WFgBSM=;
 b=VOL5FIJewVV2+CexPTsLx/5DveEqLohjtgQLqEGDegRBwa0aV7l+xt5TJV2GDT+6qUZ8wF+gbEQXPCjCuZN5sqVMkxesdHY6r3w+vNGUZeGMIXvGeKK7U0f+8ws8ZSOo+zMASTpFkzZZxuQK116mUKEuQbUnadt47rIk5WrOGP1dyR0e5inGkRJhCXWo7ta/O9SmlfTxvGOpZ3Y1paT5j3tLGIxHMfLUm3Je6dqS03Qb7woIoBcYOI8ujMzgJTv5U+UjRpOxuvSs21cWnyjAk72ObZr1/OPOeglRD7QJ2zQ6dL12GnTAEGdDlMk5ART3eUvVLoT4vwSIVX5RO5wUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA2PR11MB5194.namprd11.prod.outlook.com (2603:10b6:806:118::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 10:44:54 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 10:44:54 +0000
Date: Tue, 28 Jan 2025 11:44:50 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t, v2] lib/intel_compute: Use LR mode for compute
 when using Xe
Message-ID: <Z5i1IhJnCmVDaJrc@fdugast-desk>
References: <20250124113140.2525323-1-francois.dugast@intel.com>
 <20250127051329.a6dkqga5g5uycjkq@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127051329.a6dkqga5g5uycjkq@zkempczy-mobl2>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR0502CA0008.eurprd05.prod.outlook.com
 (2603:10a6:803:1::21) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA2PR11MB5194:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b846a4c-9e3f-4b9a-fe5e-08dd3f88cce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUN0alRPaEEyNmV3WjVwZGJTSnNJRENwanF6MXZpdFpRZmhhdnJtcy91TSsv?=
 =?utf-8?B?ZjJVcExRMG1YK3Ivb3ZrTVo1NGYva2FFaFg5NTJ1VEpSWkt4bjlKUU5oemJs?=
 =?utf-8?B?UkJ1K3hoWElXcEVGb1Q4ZDROeTdBRm0xNjU0VjdHaVpFcTNtY1dEcTlMTFJE?=
 =?utf-8?B?RTJ5d1piWGliRC9YV0s0RUF6eGFzTi9NdE9lWThVb1RmbTlaMlhZSUhPWEZQ?=
 =?utf-8?B?bjhQNjZDa09BRDFPTnd5ZGlMZERBMjVkamN3MWNSb21uTEhCRndxbmFRbGRk?=
 =?utf-8?B?TVRZajFPQVQ3TytqTlRLWWRqQlZtUnZhMHFlN3F2QzhVK3pHWVFGNmk0UHdR?=
 =?utf-8?B?VzM1eU5HQ0t5V29GY1NUUktpdVBVME1uTVpGbUVlZzIvMHFiaW9NOHdpTDgv?=
 =?utf-8?B?L2hGelZGVVVJMW5tREQ0SmdOeUkvRW9oR0J4MXh3SVZlaXRFN0ZKUUY3N0tl?=
 =?utf-8?B?Zm9WV3FORVBTMFdnT0Z5YXEvTEdudFlLd05MUXc4eG93NXhTcng4bkdpTGtT?=
 =?utf-8?B?d2ZZNkZpcVVlckpoVG5QVll4T1AzdlRVZW9LaDQ4ZFptRWZMZmhDQXltUUxG?=
 =?utf-8?B?YVM0eG1mdUR3QU5JcGdENGNweTNvK1JEdGpzay9RQmtGMmJyMHhxeHZOazFj?=
 =?utf-8?B?STNuMTJJdUI5Ylg0and4QVZ1Yk1CTW5SaDdsd2REMC9aL2ZTdEU3c3Nqc2Jt?=
 =?utf-8?B?bll3WGNrODA2dTRUSnArdTRBeUhsZ2wxaXdaS0t1VW5TTlFLMkpsRmJicG91?=
 =?utf-8?B?VHRFR3VXR3BMRHVzZDJIaHVNWU5wWDlaRUtRRVc1YytCVEJVSVhsL21EQVpJ?=
 =?utf-8?B?ZGl5R1NodnJqaUtTSHNENlFheFErd2NRL29pcngzckdJZEFFd0V0a2dGK2xU?=
 =?utf-8?B?WkdhNG9vUkRvTGNLM0V2T01wbFR3NGZ2clZvQmZFZ0c0TURVY3lmOHQ5Wnky?=
 =?utf-8?B?Vk4rQzZvZ3NlMGY2VHZOZSsrMmZ3Rkp0T3lQSWJKdTFPa3hjaVpFSmRET2po?=
 =?utf-8?B?bWJLR0FtZDJRVGR6NVM1cmdxTGNyNEM4enBNeERKREZXODVUb3d1cjc4K1ZJ?=
 =?utf-8?B?VlRuUkpOVlEyakg1YS9QMXpiZTRXREpvNjNpMUJ5ZFNZRkU0NEJTZ0c2L0xo?=
 =?utf-8?B?RU1PbmlJellDNHRVYnk2YUhVU1dWRDRPanErMkcxaWdBeElsMVUwLzdkaE8y?=
 =?utf-8?B?NFhJVEdUOEl2NU9WN3RFdnAzM2NMQ0tiMHJrcmxUNkVWNnkxRkxDVFFhaHhT?=
 =?utf-8?B?OG1uUkY0dHN1U3BWU29NRVVhMTRsVlZydVJnbnVVWXI4akJEWnJUaUtrbDhK?=
 =?utf-8?B?OXU3MUFmTUo1VVdsSERyWFIxTE5kQ3ZyUTJuWGJQNmp4WHVzZHFJTVVGVE5s?=
 =?utf-8?B?STZPd0VmN0MzOEdkZ2pkUTBLRDhacnA0KzNnbWxWOUhqbHpiOXJhcVN4NURP?=
 =?utf-8?B?RWpveHh4VE9ucXd0ZXFXY2hOWXNVdWdZajlkL2l3S0NoWFpuYnYzdzV0ODhp?=
 =?utf-8?B?WnJuODNzL3R1SFp2bmIwdXR5L0RPS0d0b28rU3VhVWRxRXRhbmp2WnJrQ3pk?=
 =?utf-8?B?bkdXeC9mNzJhMFNlTHZTUWQrb1UxUndCWEUxelk5WHpkMkJkMzZqUlEzYWFW?=
 =?utf-8?B?R1dMTGtjenJEaFY3Y0ZLRUZLOVJFWEVGUkMzbk1LbE1vb0hQdVZwMlNoQ1hP?=
 =?utf-8?B?L2N6ZzdMRjZDZWJlOVZDY1pzVGJpL1ZwaGU5SUwxNXJBcjhaVHpYMnRTeFlB?=
 =?utf-8?B?cWFuNjJsd1pEU1BoWVBjZnU4R3dNTFdHbm9KZGZjbzd2YmJ5M3lTcnJQZ3hw?=
 =?utf-8?B?bGN6NHhHeVU4NVc0UXk0S1IvbTBscEcyWjlCbDF4WlVkU2FjZ3R1bTlCNnpm?=
 =?utf-8?Q?bxFLx8QYE5a7M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1pvS0RGRFdPblVENkVHeU9ScjNHbmVMU2k2R25yQS9ud3pPdnlqdlJvWUgz?=
 =?utf-8?B?YnArUkNtRkUrSGtOdGo3WHlBVnovNERocTkwNCtSQTVzaFhHWk91YzQrWjgx?=
 =?utf-8?B?YjlreFp5eGlCVEZ0NFlEYll2WFgzVGdBTnlQNFUxZ0w1ejFyZ1BvWWU2SDhL?=
 =?utf-8?B?aGpSaTdpVVFyUGtkY3k4OTdUeFV1cEdBSE5SdFFKMStPcjkxcE9IdFc5aVda?=
 =?utf-8?B?SEluMS9vYndjNjA5QXYzc3hCK1N2M3FwK0QrR21GcTdHM0VFazdsaW9zY1RK?=
 =?utf-8?B?NlIzQmtBcFdiZzBFdFU2ZGczbG1ocjFtYWxWNXpETGxKYVJOSGFaSmxVQ2RX?=
 =?utf-8?B?R3FKb01qK21FdER0NXArR2wyMEp5VTNibGZ6VFBScFFaYmVCMnRhckljTWtk?=
 =?utf-8?B?UmRMd0JNYkNJaVcyeFpObEhBejJaNWxud284c2Z5NjNBbDlwUnFqQzNEVnFE?=
 =?utf-8?B?eXhISmo3RTByUEhsaWxZdlQ2T2NZajQ4dU95Vkd5UFBiSTU0WWp4WnpjZnU0?=
 =?utf-8?B?bmh2bVRyNldMYWFNdkJ5T3JJWHhiMmxneERzc3dyMEtEUW9mcEJEVnFCU2tQ?=
 =?utf-8?B?REZPOEtRV0ZMYmZGWG9vL000Z3ZVMjZUNlVaZVJUVUVSNld6WjJSZllPQVhn?=
 =?utf-8?B?SEtxTzAwRzNCUk01MlhKckNKMjM2VDNGOUlOUEsxbTk0a2RXenI4WnNjOE1H?=
 =?utf-8?B?ZVpCUWxXMGlyTzdZNysrNnkvNGF1cE93aktwZys5eTRtdi9KSmxFSFo3YkJs?=
 =?utf-8?B?MkF0Z3ZmbTU4STNPaGkwRWpWNWc0ZDdSc0JpdlBGTFd3ZUkxZVFRRTQvUXBo?=
 =?utf-8?B?UFd1bzVYYW5qcGV0eWhYTzNlcEtMcGJOR0JmaUlPOWJScjFRd0xUL0xjR0pT?=
 =?utf-8?B?K3hvUG92ODJGQldHT0FWdXVVQk05Q01TTkYwVFRDRGRKWnB6K3cyMkdwYzVi?=
 =?utf-8?B?M1VHRkQyVFl6eWRHelQvS3VISnoyOE9IU0VZVUpOZTJIQjcxM3M4dng2anhQ?=
 =?utf-8?B?OElnenpGU1E2Qng5OWRxdWRhZWNSdHFCUTVHQjRPTFlrMVk5ZFBnOUNsRGp5?=
 =?utf-8?B?QzBTN1BaVEJLYWNEa2JBUXJObUM0V1IyUE4reU9jb00vZVVGZW1qeUJhSXYx?=
 =?utf-8?B?NVlEV2IwTXVjTmhjcDFXaU8vU1dtSE1jeGdseG9Qc1RvUHdCYzZLNkY0ZlFl?=
 =?utf-8?B?VDF0U0EwTUlzOTVaT2FiaUZ4QVJqb0dpek9SUW1VN1VRcUpYZFZFMDB6WDJX?=
 =?utf-8?B?UVpsRWVXMi9iN0RFNUpQVWFKbHkyanlVdlAremR3anV6eVM0RjhUZHZIeFRZ?=
 =?utf-8?B?eXUwL25BbFErbDIxcDdSUXM3aU1qSkhZZUtCdGY1TE5yNTJkRUQzeko0ZEZD?=
 =?utf-8?B?Um5TNnQ0c1dMdlBXL0thUDF0UGhMbUNVaVltV2pMUXFkMFZOUHJ6S0lmTTNF?=
 =?utf-8?B?c3VIdHhuZ0VaZVVlL0pDaXhMLzdWWXYrckxEbk5EWGJGeDU1cFNuYUhUeGlS?=
 =?utf-8?B?dk9CZFBiZm9TZzViYldwOUQwWWlpaHF4T2h6UTNwZ1ZmOFp0cVVnYVJBWlRx?=
 =?utf-8?B?TVNKUGRBKzRCaVdwQ1RWM3Nrb0VZOHBvVk41UkN6aTN5TjFZU3dyVC9Fd1hh?=
 =?utf-8?B?TEo0TG1HR1d4MnJoU1VDNWJ3K3BoQkRyam81VXZSZm9LVUREMGp3VXA0UURi?=
 =?utf-8?B?ekdnSjVUK0srMU9HZFBTOWVVYi9URWFYQ1g1Y25PdDBNdkhGRmdvYXE3Nnds?=
 =?utf-8?B?Sy90YUdBYnJYSVRMdE5XS1hRUGtoTGNZUGJ1RzlwMk1EWTI3ckI4Ung2MzVS?=
 =?utf-8?B?RG1CUmZKZEFJT21HTERRZFJCNnptU3YwT0MxbTNwREM5dVcrbmFheDN3VXkx?=
 =?utf-8?B?bWE3ZHIvdmg0b2ZYVzM4aHdGTVJnbkhJejZ6SjJ0Y1FLckdnZktwMkVOUkFr?=
 =?utf-8?B?VURnenExZERvUVhpY3YydGhBL1l6dEtCcXkyVTAycE9JU1ptNzg2L2JHVElo?=
 =?utf-8?B?RXNRampaQ1FVc29uNlFkRkh5SFY4d0pKRk91dlhGaTdPSXZQa0JaUjRmcjV0?=
 =?utf-8?B?M2ZhMmZ3NzZmcmF4M3lJZ0UvZjAyWTNKcTVadTZMNkpYK2Jnd1VRZzc3SWVt?=
 =?utf-8?B?RlhKTTVFSnpYTUYxQjBxYzdTOU1DMC8zOHVpTUdKQUpacS81enBZRjNnczNS?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b846a4c-9e3f-4b9a-fe5e-08dd3f88cce7
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 10:44:54.3828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLGqUwPSlRbMqnuaeS/S+c8UecTXvzed3skP50k+H6jinL/Wn+Qod5SxmqRfR3+FCf/V20wBcPMF57dANmU/2j/+DXnL1nZHY5FFKkvZI5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5194
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

On Mon, Jan 27, 2025 at 06:13:29AM +0100, Zbigniew Kempczyński wrote:
> On Fri, Jan 24, 2025 at 12:31:40PM +0100, Francois Dugast wrote:
> > When Xe is used, create the VM in LR mode as this is what the
> > compute UMD does to run compute kernels. This makes those tests
> > more representative of real world scenarios. A side effect is
> > that user fences must be used.
> > 
> > v2: Minimize changes, stick to xe_vm_bind_userptr_async()
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  lib/intel_compute.c | 98 +++++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 81 insertions(+), 17 deletions(-)
> > 
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index f1520aad4..a7d5d3e0d 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -27,6 +27,7 @@
> >  #define SIZE_BATCH			0x1000
> >  #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
> >  #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
> > +#define ADDR_SYNC			0x010000ULL
> >  #define ADDR_BATCH			0x100000ULL
> >  #define ADDR_INPUT			0x200000ULL
> >  #define ADDR_OUTPUT			0x300000ULL
> > @@ -43,6 +44,8 @@
> >  #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
> >  #define OFFSET_STATE_SIP			0xFFFF0000
> >  
> > +#define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> > +
> >  /*
> >   * TGP  - ThreadGroup Preemption
> >   * WMTP - Walker Mid Thread Preemption
> > @@ -58,6 +61,10 @@ struct bo_dict_entry {
> >  	uint32_t handle;
> >  };
> >  
> > +struct bo_sync {
> > +	uint64_t sync;
> > +};
> > +
> >  struct bo_execenv {
> >  	int fd;
> >  	enum intel_driver driver;
> > @@ -81,7 +88,7 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
> >  	execenv->driver = get_intel_driver(fd);
> >  
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > -		execenv->vm = xe_vm_create(fd, 0, 0);
> > +		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> >  
> >  		if (eci) {
> >  			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
> > @@ -107,8 +114,8 @@ static void bo_execenv_destroy(struct bo_execenv *execenv)
> >  	igt_assert(execenv);
> >  
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > -		xe_vm_destroy(execenv->fd, execenv->vm);
> >  		xe_exec_queue_destroy(execenv->fd, execenv->exec_queue);
> > +		xe_vm_destroy(execenv->fd, execenv->vm);
> >  	}
> 
> What's for this reorder?

Sorry I sent v3 before answering your question. The exec queue is created
with a vm, see above in bo_execenv_create():

    vm = xe_vm_create(...)
    exec_queue = xe_exec_queue_create(vm, ...)

So the resources must be destroyed in reverse order to prevent this error:

    Test assertion failure function xe_vm_destroy, file ../lib/xe/xe_ioctl.c:241:
    Last errno: 16, Device or resource busy

The sequence:

    xe_exec_queue_destroy()
    xe_vm_destroy()


...is consistent with what we have in other tests, see:

    grep xe_exec_queue_destroy tests/intel -r -A 1

Francois

> 
> --
> Zbigniew
> 
> >  }
> >  
> > @@ -119,18 +126,30 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
> >  
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> >  		uint32_t vm = execenv->vm;
> > +		uint32_t exec_queue = execenv->exec_queue;
> >  		uint64_t alignment = xe_get_default_alignment(fd);
> > -		struct drm_xe_sync sync = { 0 };
> > -
> > -		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> > -		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> > -		sync.handle = syncobj_create(fd, 0);
> > +		struct bo_sync *bo_sync;
> > +		size_t bo_size = sizeof(*bo_sync);
> > +		uint32_t bo = 0;
> > +		struct drm_xe_sync sync = {
> > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > +			.timeline_value = USER_FENCE_VALUE,
> > +		};
> > +
> > +		bo_size = xe_bb_size(fd, bo_size);
> > +		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
> > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		bo_sync = xe_bo_map(fd, bo, bo_size);
> > +		sync.addr = to_user_pointer(&bo_sync->sync);
> >  
> >  		for (int i = 0; i < entries; i++) {
> > +			bo_sync->sync = 0;
> >  			bo_dict[i].data = aligned_alloc(alignment, bo_dict[i].size);
> >  			xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data),
> >  						 bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> > -			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> > +			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
> > +				       NSEC_PER_SEC);
> >  			memset(bo_dict[i].data, 0, bo_dict[i].size);
> >  
> >  			igt_debug("[i: %2d name: %20s] data: %p, addr: %16llx, size: %llx\n",
> > @@ -139,7 +158,8 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
> >  				  (long long)bo_dict[i].size);
> >  		}
> >  
> > -		syncobj_destroy(fd, sync.handle);
> > +		munmap(bo_sync, bo_size);
> > +		gem_close(fd, bo);
> >  	} else {
> >  		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
> >  		struct drm_i915_gem_exec_object2 *obj;
> > @@ -177,19 +197,32 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
> >  
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> >  		uint32_t vm = execenv->vm;
> > -		struct drm_xe_sync sync = { 0 };
> > -
> > -		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> > -		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> > -		sync.handle = syncobj_create(fd, 0);
> > +		uint32_t exec_queue = execenv->exec_queue;
> > +		struct bo_sync *bo_sync;
> > +		size_t bo_size = sizeof(*bo_sync);
> > +		uint32_t bo = 0;
> > +		struct drm_xe_sync sync = {
> > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > +			.timeline_value = USER_FENCE_VALUE,
> > +		};
> > +
> > +		bo_size = xe_bb_size(fd, bo_size);
> > +		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
> > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		bo_sync = xe_bo_map(fd, bo, bo_size);
> > +		sync.addr = to_user_pointer(&bo_sync->sync);
> >  
> >  		for (int i = 0; i < entries; i++) {
> > +			bo_sync->sync = 0;
> >  			xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> > -			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> > +			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
> > +				       NSEC_PER_SEC);
> >  			free(bo_dict[i].data);
> >  		}
> >  
> > -		syncobj_destroy(fd, sync.handle);
> > +		munmap(bo_sync, bo_size);
> > +		gem_close(fd, bo);
> >  	} else {
> >  		for (int i = 0; i < entries; i++) {
> >  			gem_close(fd, bo_dict[i].handle);
> > @@ -204,7 +237,38 @@ static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
> >  	int fd = execenv->fd;
> >  
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > -		xe_exec_wait(fd, execenv->exec_queue, start_addr);
> > +		uint32_t exec_queue = execenv->exec_queue;
> > +		struct bo_sync *bo_sync;
> > +		size_t bo_size = sizeof(*bo_sync);
> > +		uint32_t bo = 0;
> > +		struct drm_xe_sync sync = {
> > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > +			.timeline_value = USER_FENCE_VALUE,
> > +		};
> > +		struct drm_xe_exec exec = {
> > +			.num_batch_buffer = 1,
> > +			.num_syncs = 1,
> > +			.syncs = to_user_pointer(&sync),
> > +			.exec_queue_id = exec_queue,
> > +			.address = start_addr,
> > +		};
> > +
> > +		bo_size = xe_bb_size(fd, bo_size);
> > +		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
> > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		bo_sync = xe_bo_map(fd, bo, bo_size);
> > +		sync.addr = to_user_pointer(&bo_sync->sync);
> > +		xe_vm_bind_async(fd, execenv->vm, 0, bo, 0, ADDR_SYNC, bo_size, &sync, 1);
> > +		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, NSEC_PER_SEC);
> > +
> > +		sync.addr = ADDR_SYNC;
> > +		bo_sync->sync = 0;
> > +		xe_exec(fd, &exec);
> > +		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, NSEC_PER_SEC);
> > +
> > +		munmap(bo_sync, bo_size);
> > +		gem_close(fd, bo);
> >  	} else {
> >  		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
> >  		struct drm_i915_gem_exec_object2 *obj = execenv->obj;
> > -- 
> > 2.43.0
> > 
