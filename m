Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67AFEE645A
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 16:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174BB10E1ED;
	Wed, 31 Dec 2025 16:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZuwkxWkX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246EF10E1ED
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 16:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767200214; x=1798736214;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V65Qo1q5Mq+tvc+PCQg/PlqwvBU3upiStLBM2Q8tv4s=;
 b=ZuwkxWkX6nCSAu9m2PpwhSLz1RvGaZEHfie/amZiv/Y01IC/2o/7x1PJ
 ofjcsbm6dNaUtjw4F6OARAcmaaGJMG8/N+jC/b684a+dEwW6i9Q59zi/x
 +KNNseIB5oA5vbfRsafN50guA17IiC7qSiAqG1rLIHLmVhjgcDybcrFVq
 rHACEJz8P9qzb5Y2zkIE+lFB+kO/uajb3vj6rN8Vgh0L661HeEiUGk8tU
 ZTD7TIsVvxWSnlmMs1BRKDM2sr6DySLu5XTdYUW2QTa6cpJxJ1kNlFA7M
 9Fw+Q4DWhjXt0fng6C6sRmdmBATLchg/zKwVIbaUQa3g0LHJQ44OE2QrN A==;
X-CSE-ConnectionGUID: rQ6+c8apTdC5V15qJS4WRQ==
X-CSE-MsgGUID: ti7U81I7SY+zso2bTHH7NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68669395"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; d="scan'208";a="68669395"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 08:56:54 -0800
X-CSE-ConnectionGUID: 9zSjZOEPQ1yfjXffiUlj4A==
X-CSE-MsgGUID: E0SBn9RPS5uqpsvv6Jal0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; d="scan'208";a="201477167"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 08:56:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 08:56:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 08:56:53 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.46)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 08:56:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfGXXUKD8F+uDeU7pDS0IWalEulEn33SMhREVhEVzbsiDpab1IJpgisI3zgi4AJmaUUavAvI0UueX/yROwvtmeN8XHFeW3PY/zEPMW0HrsPWHxaDGJQQCubSa4AO+844m4ApbcZUIPwNHtAYnCfIyEyYPkuJGKBrlFLgc0tZFiokkunCpOP/+KQiUzPguqjobGmquottBsxhyp3YUL15d6fSRyTt3cnAvty+NtvwFghpZk9P4zKqbxwKXmWyNhIqtATZRXIunZ6Gra9qdM/C1bNwhkF+WtLxoMmtxBpDswD8oGmkve8csgLKZ7/Li1Jfp0b8eZ8ljAYWkgoU54eNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZT0/ZMQzWs2vWipfyi+cVnemUB3RqdtzHWP7KUPd9pw=;
 b=qJNDuR4dsrF0xkXGe3cFYOCZx8UGNapMWf0XU6fWn7KfLXnmnGYl9hRX1G+dLrizkNkUnxDOTvK8fXqHSaQehhRQdJFvn7EkJrLsLTDSsj9tQUR1vDLITwKhsKi2b9+3KDvhFGpHNtCdBqvccCocI9AXCZ+l+nhfyyT/x32bpQpH8lp8SonEfc2KYTLepTaFGVG0AmnDUdtKuChjNZZYwqMSnBLm+wQ/5ItC0c4S/rPn4TM0iM6TaF03BfaXK86rXtgfoSjJpDtZP+4p6xbPGBAr9PfpTFlOHIuWFVV6RunSHKTKQexptfnM8zYXC4Yb1Ih2NERnPdqRXOC04i3Tnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7084.namprd11.prod.outlook.com (2603:10b6:930:50::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 16:56:48 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9456.013; Wed, 31 Dec 2025
 16:56:48 +0000
Date: Wed, 31 Dec 2025 08:56:45 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <alex.zuo@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>,
 <kamil.konieczny@intel.com>, <ravi.kumar.vodapalli@intel.com>,
 <zbigniew.kempczynski@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v9 1/5] lib/intel_pat: add pat_sw_config debugfs parser
Message-ID: <20251231165645.GY4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251231055525.51524-1-x.wang@intel.com>
 <20251231055525.51524-2-x.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251231055525.51524-2-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 6333d89f-edac-4d7f-bfa9-08de488d9684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlJNY0FnYkhoYmJIaFF1ckNCZGlacDR5THE2OTJKaWVSaGV0VktNTEpDQzhl?=
 =?utf-8?B?QzNVdVd6MXhRamtPSERuVDVlaU1DK2pjSTVPK2liSU1JRzVNWmVNMSs5ZU1y?=
 =?utf-8?B?clZLYXVtampldnBTVEtWWWlaNEVFM2FNUDJXbG96eFFWWjVENzZ2SlNRYVQ0?=
 =?utf-8?B?czY2bFhORld1cEthV1k1QVpFWU50V3N3NlFHOGRNNDlEVHkwQWdUSG9MNkc5?=
 =?utf-8?B?U1pwbFgwS1E3T1dQRFRYc3VGNFVHaVozN1MwQWlrTVA2eDlJYVVaRVVVSDRj?=
 =?utf-8?B?citYNWl6S3lwMEVpbHNYT3AvNml2N2NHSnpZcDlwQVBTUGlkbTgweE5yNmhi?=
 =?utf-8?B?WERkdXBYZThhTW5pMFFsYzdlM1FDcnNnWGJvalZJd3BLSndoWitYRWkyUGlH?=
 =?utf-8?B?a0NuSWt1anJ2b0htRWRPeDZLTHcvSFo2a0pWei9mZHRvclFrNjZsaEp2am9v?=
 =?utf-8?B?Z3REZkVGejY4WDY0d1JlWTNDSnJNWjVWNW1DSDNNQmtDUG9GaDlONTRUMSs3?=
 =?utf-8?B?OFlkTHNMSXpaTm5JVHlHeXZVOGFvY1NBU2hiVFNVVGgrakJMM0ZhTzlnYUZK?=
 =?utf-8?B?TmZoaFpaL25WeDJMZjVRbXVYaTVyUTN5enhJNi84WWR4cmR4a20xSW5ldk1Q?=
 =?utf-8?B?TTUvSDFmWHZOL3M0enJZT3VKT2lwQ2ZJLzhVYWU2WWxoT1NmQ2xzbEdGYTNE?=
 =?utf-8?B?Z1VRRXZ5MU9PNXNKQUZKREpJNzF5SmlZN2dmU1VDVC9xRDZiME5TNXNLWS94?=
 =?utf-8?B?KzNLeWNKZ0dqN2szZ0R1QkI5dmthUXRlZFQzMUNnTS9vZFIzN3crM1A4ZFZj?=
 =?utf-8?B?WlV3QS81NUdLajUxbEJFNGxHbnB0TS9qcFlUaGJEUXEzalpWY0czYVJJTVhy?=
 =?utf-8?B?KzNnR3pWZEREM0UvMG5pbGZ2UnVLK3FPK0NablFZcFZHZWJhWFJGOUpUTDlZ?=
 =?utf-8?B?MmhFMjUwci9qcHB0LzRvNHhzbUNzREo4SHZ0UnhwN2drRHhUeDhPSUNXSjdD?=
 =?utf-8?B?SUFrdjF2QmFqNDFZUFBlTTNNUUl0eEdKQnpFckxvWjQrV1kwekIzdlZUV0Fw?=
 =?utf-8?B?SmRtMFlQb1dwclFTbjB4UUhXeG8va3hxU3FpRFZKd2RrYTg5NXJObzNGeDE0?=
 =?utf-8?B?NlpodUlLLy9oU2FXQjIyYUwyTXZQaHhEcG1LR0t4V0pJL2l6Y1RrUUtvSCta?=
 =?utf-8?B?R25EUTlFcDVranlNWUkxczF3QkNvbTVvRXBoUDRidWFhK05lK1ZudWV3WEJI?=
 =?utf-8?B?NkZGclpBMWpWWnRqYVBaK1hzWitmRW1hOTdUR3YyYU45MGFUYVdmcGNMbmZz?=
 =?utf-8?B?MTlkdk5tUjJPUUQvT2Q0UllPa1kwaTJWK0RDdU53eDkyckxjTFBQd0FzbEJ6?=
 =?utf-8?B?ZVc0RUJ0WnZxSUdGU3dYNlFoNFBGa1pZZDVPRTEyNm5TWXA5eTIwS2RaLzVr?=
 =?utf-8?B?ZW5QdEhtVzRXdHRNWlJPVnJIY2JJM3orWXIvc1JvQVdZdm4zMk9BVDhXWjg5?=
 =?utf-8?B?Nk56VTBiWDl0N3pWdXRpYkNFclgxWVRGZm1kVERyOXYwR3gzZWg4cU1hVkNh?=
 =?utf-8?B?TzE4U2lZK3ZYMkdTSnlQVG42R0NQVXpEcEJLUVJRaVY0VDM3enNjenhtaVVz?=
 =?utf-8?B?UnhHK1VXUmhLYUdFRUdjNXlKUlA1QzdmMXpIUDIxTnRNM0ltK2ptWDNSQ1hD?=
 =?utf-8?B?UHk4VGJyaTgrVlBESGM4VkNDdE5aWUU4YnVSQXQvRFJxdG5vNUk5TU5tcjEw?=
 =?utf-8?B?aDloNkhrck5JSXdwc2lHZXRXVjZjR1hYRHBsOVl3N25YenhqUXh1SnNvMUlu?=
 =?utf-8?B?bm5wMzduc0pnV2tkVHNJNVczdVNDYXNYR3loYlpnYkl1a2U1WTFOV1BTaGlO?=
 =?utf-8?B?NHhwYjJNUDYxanRobDhBY25ETGx3SkY3bWc4S1p5cmc4eG52NGNzOTNYdVBu?=
 =?utf-8?Q?8OWHQEIRrbvuhklUS+MbXiRFvu+nn0DW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEhIRnZjRjFkc3NpSllUQXhvSU8xTGx3b1U1Sm9KOXU1N3kxamYwR0EyQmxq?=
 =?utf-8?B?S3BLajY4N1A4Z0hXcnoxbzlkK2VORFJ5d2FXamltVTBZNmljbHF0ZmRTL0xX?=
 =?utf-8?B?d0o5K21DbXlodDZZSWVrWGtxZ0hDMmY0b05FcnVKV0tOYnFBZ1MwY2hFQlVG?=
 =?utf-8?B?U24yT09KR3JvOC9iSHpmSzN1c2JONzhxT0lXRWt6MWwyOVdGZzNIWXdxcGtu?=
 =?utf-8?B?cldIcDNPeHRSdW9qeVg0NkRDRGZ3V0NYT2Rya1RSbVNMcXVZcUkxQjFxdVJB?=
 =?utf-8?B?T25IOXNjOXZDOEZZa2crR3F1aUxEbkZpRFAzNmdaeXdYazlXWG5pK043WStV?=
 =?utf-8?B?a0ZNV1ozamNUaGxYa0R2aWNDdlNzY3BPM2lJcDRVTFRIVStGdVMzdGtVZVdP?=
 =?utf-8?B?K0lPVXdIOTZHL1NQeUIybDBKMTFCWWNRaXdiYXlWbmNjekRWUTlMQjFKa0Yr?=
 =?utf-8?B?YTVGNkJ2Smc5VmVIUHd4ZVpRL2p4Sm01MHNmbGdmaGNhL0VpcE9UYytQeExL?=
 =?utf-8?B?c05SWDlQQjJXRThvS2E4N2pzNUtyZ1RiMFY3NU56TnRmMW5yNU56UHhMaDdP?=
 =?utf-8?B?d2NidGR5RmFaS3ZTd2xQWUp6ajR1MmhCMTlFa2xVblNFL0xtdkZRQzFOdCtU?=
 =?utf-8?B?ZGowMGZ4M2N6Q0pYNGFsU3hKVXpVcnQ2THhxVjhUNmwzUGZqNHVyU3NRVUI2?=
 =?utf-8?B?ZFRHdG9vdW5ZNGc5UmpJRjR2Qys3c2ZXT2ROc3c3Z1lxc1gvNjFSRXZYQ21s?=
 =?utf-8?B?RUpOOFQ0bnhZem9hSkZRZjJ2c0VIYWNXdFJwdUc5L1VuTXpBR0JrbGo5YUgv?=
 =?utf-8?B?eFlXVmpDMG9mZzkyWWFrM3NEcm02MnJ2T21QUk1CK3lzNW4zeEczSEEzNXJa?=
 =?utf-8?B?eFdydFU3bkl4U0JkTlNlSk5qNzc5V1Voc2hLUkZSZjh2Vlk4eHdKVkd0T2Ix?=
 =?utf-8?B?cU5DcXdLbk9BWk5aMlhTTG1lclQzWUpkTWtYMC94VFd0aVAzb3VPcHF3dEFG?=
 =?utf-8?B?Zyt0MWdlME4ydy9BRFJrWUNWTXprNXVidm1nNzdHVnl0MnBPbWZkQ0FzeCtj?=
 =?utf-8?B?b3o1UnB5TC81ZU55b2FtY1ZjU0VCVkRwbmZJV2FHRVZjM3BMd2MrN3BrcFBC?=
 =?utf-8?B?NGZMSTIydHN1SjdQRHNoNzcxU3UxUmlJUDF2RDcwRzBJZ3QvYzEyVGRQczdr?=
 =?utf-8?B?eCt5c2JYeGxLZktRVjI2dmVMRmV4ZnEyb09QNjQvdncvdTVGMUk0cDlUZHNZ?=
 =?utf-8?B?Z1ZYSU9YaDdLeWp3UERyTm52NXJoUk9rNDUzSk5FY29FMUo4K3k4TStmcFFs?=
 =?utf-8?B?d2k2eGVvakVJWmZFTmJGblRPMWU5TXJNM3MxOWRHRmM0VDNwcEdja04weGpS?=
 =?utf-8?B?SVE2S3ZMWUhvcFVvTXgyeFN0eXhTaHpuQkZQNVhWbTRnUUhjZmFwaVcyMnZP?=
 =?utf-8?B?SW9wSkFSWjJsczBJbVA1aVhQOVJHOXc1Zm1QYkE3OFZaaitYUzlERWxubUk3?=
 =?utf-8?B?L200ek9DVjdVL0FCQ3llekxGRG1ZeG9md3hyOURBVHZVR3lMTDR2d0lCdlNZ?=
 =?utf-8?B?OEcwa2ZPaW5ZbUNVRE44Nk02VHJDTFhFV2x3Mk8zN1FVMGhjbFVBYXZsL253?=
 =?utf-8?B?RmVZbG1uQm1yUTAxQ0ZRbzdMdmNXcWF0bjcwb2o3dHo3VUtuMFdIbFhNY1Rs?=
 =?utf-8?B?dStHWUdzTTdUeHFva09BbGJXUk5neVFJczBKK2hJRk9yVUpYZUYrSElKYnlL?=
 =?utf-8?B?U292YWM2SXVWaVBBUEZjaC9JSXBvaThFb2tjc3pFdUd0MVpTYUtYVk1ScEhH?=
 =?utf-8?B?NWo5UG80bk80dlhEQThndDJETGNIRkduV0U0ZE8zaWdVN2JjT1ByMTY0Tkg1?=
 =?utf-8?B?dlJ0SUpnMzZTWWFicWFHK0JIM2JLSlY3enpqT1I1ZTdvYXM2RlE4cXpIWTdK?=
 =?utf-8?B?Qno1RFlBTmFua1BFdmhGR0VCM1dlV2tHaGdiSEtMODRkdEJ2ZmtnenVrNjRG?=
 =?utf-8?B?VmNqRGFHYWc1MXgxNmF2SHAzdVZXaTNWZE1tUmVXeWk1QndnRUl3bGp6RWFD?=
 =?utf-8?B?RWNKSGJjV090aTZxV1hvcDZzNUMrUXFHOC9CS0xUUkRNL21jVVJ2SkxQLzY3?=
 =?utf-8?B?alE4b1VyckhkTG9OVXJyNWJscnBXTm5YQUxSVzhpZDIwN0FZeXpOcXVISVU3?=
 =?utf-8?B?VWNkbVYwb1F4b2dKNEY0MFVBOHljbGE0ZzVpV2Z1cndsRnlET1pXWEVUU2ZY?=
 =?utf-8?B?TVI5YzZ4NkJjUlQ1SDM2bGxKeklndzJCQkhSK015aEo5OFlTdExpTXE3dzZL?=
 =?utf-8?B?eVNvTmdPYXMzcnhCSG5KR2NxTFd5VVVEQzBQaHI1c2pIdHhDaG9oZ05wMTdi?=
 =?utf-8?Q?0HijJhE5an7FwtYM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6333d89f-edac-4d7f-bfa9-08de488d9684
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 16:56:48.7890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3wewTkKMLqWfamgv9hLO6ilymgPke23X2ywaPu+hqunYPnf9ec7wQJ2xbXXivWdKj36pL8JbDZ9yUN/1+5ehqhSex+DUFV6l+RgwhQNhBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7084
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

On Wed, Dec 31, 2025 at 05:55:21AM +0000, Xin Wang wrote:
> Add xe_get_pat_sw_config() to parse the Xe PAT software configuration
> from debugfs (gt0/pat_sw_config). This is intended for test-only use
> to validate the kernel-exposed PAT layout against IGT's predefined
> UC/WT/WB/UC_COMP mapping.
> 
> The intel_get_pat_idx_*() helpers continue to use a predefined per-devid
> mapping, keeping them usable from unprivileged users. This avoids
> introducing a debugfs dependency in the common library path while still
> allowing tests to detect PAT table drift as new platforms are added.
> 
> V2: (Kamil)
> - Show a detailed skip info when opening the debugfs file fails.
> V3:
> - Save the Xe PAT software configuration into the xe_dev structure
>   to prevent scenarios where certain test cases drop root privileges
>   after execution begins, which could block access to debugfs.
> V4:
> - Cache the parsed PAT table the first time we read pat_sw_config
>   and reuse it for subsequent calls. This avoids repeated debugfs
>   opens (and failures) in tests that drop root between steps, while
>   still returning the correct PAT layout.
> V5:
> - Make PAT debugfs parsing lazy: avoid requiring debugfs from
>   xe_device_get(), so tests that don't need PAT won't be skipped.
> - If PAT info isn't available at device init, keep pat_sw_config empty
>   and only require debugfs when PAT indices are requested.
> - Add xe_get_pat_entries() helper to expose the parsed PAT entry table.
> V6:
> - code optimization
> V7:
> - Keep intel_get_pat_*() usable for unprivileged users by switching back
> to the predefined per-devid UC/WT/WB/UC_COMP mapping (no debugfs required).
> - Stop reading pat_sw_config from the common device setup path: remove the
> PAT debugfs fetch from xe_device_get() (and drop the cached field in the
> xe device struct), avoiding a global debugfs dependency in lib code paths.
> - Treat PAT parsing as test-only plumbing: make xe_get_pat_sw_config()
> explicitly root-gated.
> V8:(Matt Roper)
> - Return the correct error code when reading pat_sw_config fails.
> 
> CC: Shuicheng Lin <shuicheng.lin@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> CC: Matthew Auld <matthew.auld@intel.com>
> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/intel_pat.c | 94 ++++++++++++++++++++++++++++++++++++++++++++-----
>  lib/intel_pat.h | 20 +++++++++++
>  2 files changed, 106 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index e3588110a..127f2160a 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -3,17 +3,95 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include "igt.h"
>  #include "intel_pat.h"
>  
> -#include "igt.h"
> +/**
> + * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
> + * from debugfs
> + *
> + * @drm_fd: DRM device fd to use with igt_debugfs_open
> + * @xe_pat_cache: Pointer to a struct that will receive the parsed PAT configuration
> + *
> + * Returns: The number of PAT entries successfully read on success, or a negative error
> + *          code on failure
> + */
> +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
> +{
> +	char *line = NULL;
> +	size_t line_len = 0;
> +	ssize_t nread;
> +	int32_t parsed = 0;
> +	int dbgfs_fd;
> +	FILE *dbgfs_file = NULL;
> +
> +	dbgfs_fd = igt_debugfs_open(drm_fd, "gt0/pat_sw_config", O_RDONLY);
> +	if (dbgfs_fd < 0)
> +		return dbgfs_fd;
> +	dbgfs_file = fdopen(dbgfs_fd, "r");
> +	if (!dbgfs_file) {
> +		close(dbgfs_fd);
> +		return -errno;
> +	}
>  
> -struct intel_pat_cache {
> -	uint8_t uc; /* UC + COH_NONE */
> -	uint8_t wt; /* WT + COH_NONE */
> -	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> -	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
> -	uint8_t max_index;
> -};
> +	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
> +	while ((nread = getline(&line, &line_len, dbgfs_file)) != -1) {
> +		uint32_t value = 0;
> +		char *p = NULL;
> +
> +		/* Expect patterns like: PAT[ 0] = [ 0, 0, 0, 0, 0 ]  (     0x0) */
> +		if (strncmp(line, "PAT[", 4) == 0) {
> +			bool is_reserved;
> +			p = strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) == 1) {
> +				if (parsed < XE_PAT_MAX_ENTRIES) {
> +					is_reserved = strchr(line, '*') != NULL;
> +					xe_pat_cache->entries[parsed].pat = value;
> +					xe_pat_cache->entries[parsed].rsvd = is_reserved;
> +					xe_pat_cache->max_index = parsed;
> +					parsed++;
> +
> +					igt_debug("Parsed PAT entry %d: 0x%08x%s\n",
> +						  parsed - 1, value,
> +						  is_reserved ? " (reserved)" : "");
> +				} else {
> +					igt_warn("Too many PAT entries, line ignored: %s\n", line);
> +				}
> +			} else {
> +				igt_warn("Failed to parse PAT entry line: %s\n", line);
> +			}
> +		} else if (strncmp(line, "PAT_MODE", 8) == 0) {
> +			p = strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) == 1)
> +				xe_pat_cache->pat_mode = value;
> +		} else if (strncmp(line, "PAT_ATS", 7) == 0) {
> +			p = strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) == 1)
> +				xe_pat_cache->pat_ats = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_NONE]", 18) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->uc = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_WT]", 16) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->wt = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_WB]", 16) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->wb = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_NONE_COMPRESSION]", 28) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->uc_comp = value;
> +		}
> +	}
> +
> +	free(line);
> +	fclose(dbgfs_file);
> +
> +	return parsed;
> +}
>  
>  static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>  {
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> index eb48cbc65..e9ade2e2e 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -6,9 +6,27 @@
>  #ifndef INTEL_PAT_H
>  #define INTEL_PAT_H
>  
> +#include <stdbool.h>
>  #include <stdint.h>
>  
>  #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or better */
> +#define XE_PAT_MAX_ENTRIES 32
> +
> +struct xe_pat_entry {
> +	uint32_t pat;
> +	bool rsvd;
> +};
> +
> +struct intel_pat_cache {
> +	uint8_t uc; /* UC + COH_NONE */
> +	uint8_t wt; /* WT + COH_NONE */
> +	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> +	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
> +	uint8_t max_index;
> +	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
> +	uint32_t pat_mode;
> +	uint32_t pat_ats;
> +};
>  
>  uint8_t intel_get_max_pat_index(int fd);
>  
> @@ -18,4 +36,6 @@ uint8_t intel_get_pat_idx_wb(int fd);
>  
>  uint8_t intel_get_pat_idx_uc_comp(int fd);
>  
> +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache);
> +
>  #endif /* INTEL_PAT_H */
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
