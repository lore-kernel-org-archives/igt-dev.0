Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201FBC3ABCB
	for <igt-dev@archiver.kernel.org>; Mon, 16 Sep 2024 22:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45B110E3F1;
	Mon, 16 Sep 2024 22:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z3FQLAtR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD1C10E3F1
 for <IGT-Dev@lists.freedesktop.org>; Mon, 16 Sep 2024 22:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726524654; x=1758060654;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=u+7TBvwlOjDyyl8l3i+1pLieCXJgfFbHer1iFIT9amI=;
 b=Z3FQLAtR79OGCijKPxvjtNpHhzc6wDmtm/E1QFML0QP7XHPHtuTBLtF0
 9qG91/QZUUP96Ht3gL1vhIF0amNJ0dieaFbq/WNtbXHp3GqV2ti+2LEsA
 DJkwjjUj1NvFZlufRFC7I47hnPjXZcFPbsX9pgimEfnF26dUQ7i4EXm64
 9fpIA7Vs/pBJ6dGEj5Upp6csq5slZj0waiseO2xRbHFZtVUefQAqL4451
 xI0mCzfSqJsjDWapOzoO8PA0C0BDggnfyBg7e3Lf3XYnmcmNirAo17GA6
 IqY831Xqqe5ba8SiyzNBfU4BggdRP5wvVp5k8y42j7uTJuHokVsx8/0pC g==;
X-CSE-ConnectionGUID: kUswED8MQBqTShPVpo9WXQ==
X-CSE-MsgGUID: rG8rHELqScmNNy7dKy176A==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="47877123"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208,217";a="47877123"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 15:10:51 -0700
X-CSE-ConnectionGUID: 8i3Q5zirQ4CB3nzHj9OaOw==
X-CSE-MsgGUID: axBN7LTKSLSjDravmPQznQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208,217";a="92295084"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 15:10:49 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 15:10:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 15:10:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 15:10:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIpm3BOgII2Ygu1V1UCeWr9rSEdPSYlSas3sPcqJ0nDsOvFCHgepWQeOShldC/aqs/V/UkE9sduDOaYr+PcwXiXPT2FK0MeIm+UwBfrBBfB36eeMa/cOPO00BNkiCgZ1NhFFjfDxaBobOhbRVhenwJLb/dv4moEP7N6yUo3+qIxFOCpsmZQu3+xNgYyPeLLdGjVTs/rQ9aqySaMXOeAF7Zqv19oQ8IFNwRvaxoth7OUHv1EiPOH9LLqTYltZTB2wjX6VR7CMa6kGImIr+mE7iWYKDlGua4pRGB93u1fQyXd2smG8b4nrf/1dAOLXjjLPUiFnxbjk5PjFfc4rYWUZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCmGPBz6NwN+ql2AjP07oJwlsanR3PH746ZhWuECiDI=;
 b=UOz1p8mfCDz0mlcBH8dUE33MGU5E1OZLaD+0XGTNkf2rJZdKsN6XetDkUTZWZPJvJsweraDQU8WyskGPe7IPJvjykuEU43RamU+Jc+Opv6+4tw7QFokuT8tdQaGT3ve1+i5/cQkG+X2T6Pj0IJt9HyUPjT1oi9BipSFyyZ71jnSSW1kg3hWIutmfm9mvGbY7GQ80G3EHKvJo/7JmfkCBkEXN7GJbQeB8b4jGzBzV12xas7CdwelIz1wFEcZyUh/9k2L0B/oA2/1K0NkHMf37D96kCna16eP7sJOgBT265zzZh1KGXsNIua8g9wzLyCz8PyqeDhhefYksKptvQQhfnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.24; Mon, 16 Sep 2024 22:10:45 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 22:10:45 +0000
Content-Type: multipart/alternative;
 boundary="------------v7DOZYh74qzH3vyjpnXkCEJD"
Message-ID: <7968ee02-8cbd-4e66-8490-0628fb47b4a5@intel.com>
Date: Mon, 16 Sep 2024 15:10:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC i-g-t] kunit: Remove hard-coded test list from xe_live_ktest
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <IGT-Dev@lists.freedesktop.org>, Katarzyna Piecielska
 <katarzyna.piecielska@intel.com>
References: <20240823182418.1771456-1-John.C.Harrison@Intel.com>
 <1942260.taCxCBeP46@jkrzyszt-mobl2.ger.corp.intel.com>
 <84c6520c-b634-4be3-89fd-98595b537cb8@intel.com>
 <3240976.5fSG56mABF@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3240976.5fSG56mABF@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: MW3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:303:2b::14) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS7PR11MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: ed629d43-94b0-4fa9-18be-08dcd69c6988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3JPcTQ4TUM3SnBYR1d4VWZONlNSc1ZaUlNoTnVnMWUxbmVYRnFXVGNnQ29T?=
 =?utf-8?B?bGtPc29tUk9QMEZSYSs4Mmt5dVQxSDNGRGhvVFF0OTUwQittR2JHMTFFYnls?=
 =?utf-8?B?YmlnSVgvR3VLTjRTd2EzczZ5MG9DOVFPajcyZjBSVGtXQ0ltenFZd0VhZVdr?=
 =?utf-8?B?d1BVa0dtR2xPTzRXUy8xM0Z6NGdNYlM3UXRnd2pmQXVaa1dtSlJIcDJDS2My?=
 =?utf-8?B?QlNiejFQWG9uaWsyM1V3aXRDVVZOZDNldXQ4RUNsanoyeFI4R04vaS9MVVcr?=
 =?utf-8?B?M2RxZ1Iya3pBSzh1UkpEZHkzd2FBTDR5VE5pTFh4VjlFdU81T1RtTFpBUHJR?=
 =?utf-8?B?bFJ0YUdUZDRRcllEK0hrbURtNG5rRFVibi9uUlVleFF4c0RIbnZUZW1VWUZ4?=
 =?utf-8?B?RUVqN0phaFZaOHB3OFBFMVMrZzh5bGdSMHJXSU9TU3BsNlBob0IvVVBpYmdW?=
 =?utf-8?B?YTdQRUpCZDRzMTk0aFBya2NZTEdTWmYrT01YNlNqWVU1S0pCQnRRdlo5c1o1?=
 =?utf-8?B?TDNnNVYzeVFMdHU5VVJqZHdnV01kbGkzWmsxRDl3RktUeGFhNG90TmdmOUxY?=
 =?utf-8?B?TG04cEdhTUlwcGxVSWpsdEY4c0hSNzBVSEpZWjVBTjB5S2dHQ3BwL1JERWpi?=
 =?utf-8?B?bUpodTFudGlxSWxsNXdWTGlsdmE4VkhBOHNPaGJsRWYxRHJ3emVmY01PcmpB?=
 =?utf-8?B?a3pwMzEvMjlyNFFzQ3BqdFB0VDJmTzVmOExVYUY4ZFJVWTdsYmJvdmt0MjRZ?=
 =?utf-8?B?djhYaldvcEszWmIrOU9BRFVtS0JkVEFDdW9IbDZxRGhveXRiNFMzNWRuMVhl?=
 =?utf-8?B?M3BlejhabW1iUjAvRXdoRDBQU1dKenh1cTQxRThGNFJOb2VRMjlVbDc3U0cv?=
 =?utf-8?B?RUZYaDQ2VWdyWXpkZFNBTFBmVzl0NEg4SVJ3Rk00T1JpQlhOWi9SNm1ta005?=
 =?utf-8?B?TkNRektqSjJBSlVKdzRRUWhydnNYTk5Vb2ppU3NyV3RDbmxaT0FKMlB5QzQw?=
 =?utf-8?B?RnJPZm9XSTJTUFFGVjlmVE5mWDQrcndPNW1iUUc1VGJtS1RxdndXeHNtQ2c3?=
 =?utf-8?B?Q1dZMVlJUExJa0VScmlNQUtHWk5kcm1JM2R4NjlYdE1tMkdtR2c3SXdQSmM3?=
 =?utf-8?B?ci9rYitnKytqQTg0VTBBSDIvdFR3OWU5b1VhZ3lsYmZjTXFJMm5sUEtnU1Z6?=
 =?utf-8?B?WnU0TDU5UHVCVk5uWHppQTRZZVRhOGFmOFBXVy9zOXQ3VzhkWk4vdk5aWEpu?=
 =?utf-8?B?Z2ZJL1JzZlU4SnJjRVJYR05TMnBZb1hIbGJyalRpMU9tNjIzdVN5K3IzUW9s?=
 =?utf-8?B?OEdaSXBKckM5NjdUQU9ESnIvSUFqMUNNeEJZK1ZhaVZBcTNzR2l5RWNjYm1E?=
 =?utf-8?B?MkV5Nlk1K2RYRDZNRVQ2Q3ZrVkFKYlF5TUJoRWhPd1pTbjg2aEt6dWJVY2Ny?=
 =?utf-8?B?WWNVMVpGT2xHRkJ2d1JVZXVFeldBVHZ6NlNuT1V5d1JOR3pEemZBL0ZNTHJB?=
 =?utf-8?B?Z1BVQXR6bGVNczg3U0JZM0N1dDJQeGhaSFgrbTZBcU9kSnRvcmE0MjFvV0sv?=
 =?utf-8?B?UERyY2hXU2hoWDJWeU5WRER6T0VCb3NxZTdmZElCVzJIU3N6TXhUaFJpOW9W?=
 =?utf-8?B?RHM5eGc0d1EvV2g3MDVoV3MxSXhvTjRGTVFCQ0xNa3RkNmZXL3ZCQk1jbHoy?=
 =?utf-8?B?WTVTWlFvVE9Fa0VDMUN1eGJ6VFViZytTckdmS1M1SG45MStwMWpHSFlSbW5z?=
 =?utf-8?B?ZCtOaHFjSDBHTmxmWEVxdGlzSXBOZFJrWm1vVmtMUUpnRm9xQlhWWEsrYlE2?=
 =?utf-8?B?eUZ1ZXZyV1M0cVU3UVB0QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUlVMGNraEZYM2M0bXplK3BKTUxmYW9zRC9QN1hTODRRN3V6cDlVdUJjZlp0?=
 =?utf-8?B?bkN4SSsvM0hva0ZpaUl1MnlnOG42NlVjS2Jqd3g3ZE9IRHVjS3BnUUhYMUZH?=
 =?utf-8?B?WTZHbjhkZ1laSEl4TDBPSzBrTkxnS3dWOC9iSkNQVkQ0MC9RTExTK1RHU0hJ?=
 =?utf-8?B?N2IyWFZVRVhLRGtHSm9Yekc5U1h5MlBhQmpVby9nQzFWY2dhY05JVmpZanB3?=
 =?utf-8?B?SHhIK3ZXalIwU2cvcDZrbDVMZ01Ka0p4OWVxWlAxQXdkRlVGcWVjOThza003?=
 =?utf-8?B?R1I2Zk13NUJ6MDQ4aEFlWGtVMTRMSWtkQUlPK0ZaZm9RRXlVbFRaQ1RDLzJ0?=
 =?utf-8?B?M2NTV2h2d1kydk5kZ1JqYmV0MWF1Z0dtWE5nSkhFamd5OUdJSXgzQWVLYmNw?=
 =?utf-8?B?WVoyRW9jcHJtNjgwd2U0eDFxamQzWklhSkM3MWJBQk1UY1RjencyQmZLL0I1?=
 =?utf-8?B?LzBDcC9wL00rdDdRcXFGa1hoUTZheGRoRjZtU3JvNUQvTGt1RkNwNCtXQm9T?=
 =?utf-8?B?OEdaOEhvWDVScWdxOFVpSWVrUDUzMGtscFBzbFVvR2dpWG9XRnZ6YUxUbnVI?=
 =?utf-8?B?TTM1Rk5mN1dqZm9yWjNLSDJOaXNDSk5oVzJpR2JncTJhaFJZQVBJLzFTTjVR?=
 =?utf-8?B?UEVzajE4Q2prbW1RWTVWYXRBRnZFVzY0ZHBTOURvVlFTN1h0aXJieWRWSmtY?=
 =?utf-8?B?ZGFZVEZOQUZ3dERCNDhjY1pjTUZqSDNpRU9XUS9EcGcwUU5xZ2lNK3ZCVXNr?=
 =?utf-8?B?MHZYNnFkdW9BQzRDVmNXcEw4cm54WVZ5dXVneWZsbkpJK1ltcGxnaXlHZ08y?=
 =?utf-8?B?bkc2OTNjVjM3Zys2aS9IbWEvNVFlZE92R0hLbDBDWDRSUnRyNm1XUnhCeFdQ?=
 =?utf-8?B?aG5oZUxoU3NvWElYeGJUWnVscmlBQSs0b0x6WDVMcXR4L3JtVXhPMGl0cG81?=
 =?utf-8?B?S3FGTFl4T3MrTWZERk1FbmtnWTNodGJsczE5b09KczNVMzB3c1N6SW16dnkv?=
 =?utf-8?B?b3hhVDhHZTB6dk5YejZ3S0RUK0U2akt3OGx2Tkt2TzNlNDFaOE0zLzNRd2tw?=
 =?utf-8?B?cEhYU2d0YVl0dkZwUlFZcHI0Y1gzQ1BrUE4rWHlNUXRsZDZFMElnWTN3M1gv?=
 =?utf-8?B?NUZMTS92WWRSaFpIMDYrWnFwVDVzT3FKK2oyd2E0cmFEdTVid3ZnblQ4VGNl?=
 =?utf-8?B?UjF4c0hYcG9WUWtETENkSnNQeGJoVUNGMTllQ0xpN3U2bWlSNXhuOHQzeDRt?=
 =?utf-8?B?ZzNUQXp5d0ZQMVBuNVJmWWVpU255enFadytkNS9nOU1XWFUzV3E5bEVSRjlv?=
 =?utf-8?B?NVIvUVlXUnJ2UVROcVBlcUpNb3ZoUEtpYXQxZ1BrNTRZSGs5eE1LVkJDVSs3?=
 =?utf-8?B?bFZSUTFIMnRRRzVTUHp0Y0pZZUh2OGdzdVBPRVI1cGw0QWgwWmlQS0V4b2pr?=
 =?utf-8?B?aFhEYXZFaFUybHordE44ZStVa3hwWTFkT2RNVE9wZTZaUU1PV29sVldKM1NT?=
 =?utf-8?B?MmNxZ25sTzl1RVNvZmVYQVZzYWFibmN6WGsvME5DNERUelZRdFN2aDc0T2hv?=
 =?utf-8?B?M3ZEVmt6USsxaGtnMExkTlAza0RJT2wwZVNqdUk4cnp6WVhmMzhidzU3N1Y4?=
 =?utf-8?B?Q3VUR09qNU9KNHJUV2xxTEpnWmdBUUZsanBYaDdYTnA3bE1QcDkwSGRROGdL?=
 =?utf-8?B?Z3lWMjZNdFUxQ1dqRk1aRUYyNTRSSFhvWUo1V1F0Y01KS28wTEZUTWdsUU5I?=
 =?utf-8?B?NW51YmtzRWlKSExZSXlkZEh0eXFSb052NEJqNUF0aDRraDZ6L1lwSFRKZ1Q4?=
 =?utf-8?B?ZTQ2bURtbVVvcE5pY2tzajVscTIyU1JObW1LN1RzelRkMFFzUC91ZWpzK3ZF?=
 =?utf-8?B?VUtaQ3FNMTVweWlpVy8zemFvRXhZOXZpbTl6VDAxYXU2V3hGTVNHeUxwdXQz?=
 =?utf-8?B?YXZmbUtpK1lRNkxpUHhSUFdIdFpiZ0JJNXFLbnZ4d1dPYjhyeXk2blRBc3Fq?=
 =?utf-8?B?bnBJSGE4V2VTd0ExaFAzMXRlb1A1MnpXWnBUQWN2YVVhT1FQQm1GdDltYnRl?=
 =?utf-8?B?RTdtclAzUm1iK3REb2Q3YlVBWlJEVTdpSGQwcGx5Vk9xdGhTbTdIbjFNbnFj?=
 =?utf-8?B?Nm8rQW1rVlNwbnVmbm1oNlZuZjFESGtZY2NuUG1tOTF3ajdDclhZRjluQlBw?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed629d43-94b0-4fa9-18be-08dcd69c6988
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 22:10:45.4828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCION6H/Ra1o/bVgeYseWhCI7oFSTttLlp2HLFT+L/+DIfw91/Tb/DJ+0JTTLZC/mnRFD9GZLjow4OLJjRMDcWvxs32l0LWCIspuKaaQbUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
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

--------------v7DOZYh74qzH3vyjpnXkCEJD
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 9/16/2024 01:17, Janusz Krzysztofik wrote:
> Hi John,
>
> On Saturday, 14 September 2024 02:20:32 GMT+2 John Harrison wrote:
>> On 8/29/2024 02:57, Janusz Krzysztofik wrote:
>>> Hi John,
>>>
>>> On Wednesday, 28 August 2024 20:04:06 GMT+2 John Harrison wrote:
>>>> On 8/26/2024 06:07, Janusz Krzysztofik wrote:
>>>>> Hi John, Kamil,
>>>>>
>>>>> On Monday, 26 August 2024 13:46:45 GMT+2 Kamil Konieczny wrote:
>>>>>> Hi John.C.Harrison,
>>>>>> On 2024-08-23 at 11:24:18 -0700,John.C.Harrison@Intel.com  wrote:
>>>>>>> From: johnharr<johnharr@invalid-email.com>
>>>>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>>>> Again invalid e-mail here.
>>>>>>
>>>>>>> The list of supported kunit tests is currently hard coded.
>>>>> That pattern originates from i915_selftest, where there are 3 stable
> subtests,
>>>>> "mock", "live" and "perf", each of them executing a (possibly long) list
> of
>>>>> dynamic sub-subtests actually provided by the module for each category.
> Also,
>>>>> IIRC there was a separate module for each Xe test suite before, each
> mapped to
>>>>> a separate IGT test, later merged into one module with multiple suites
> and one
>>>>> test with multiple corresponding subtests.
>>>> Not sure if you are just explaining the history of the test or making a
>>>> suggestion as to how it should evolve next?
>>> Both, I think.  Maybe not the history, but origin of ideas standing behind
> the
>>> implementation, and how tests are expected to use it (and maybe evolve if
> now
>>> doing that in a different way).
>>>
>>>>>>> Which means
>>>>>>> that adding a new test to the kernel also requires patches to IGT as
>>>>>>> well.
>>>>>>>
>>>>>>> The list of available kunit tests is already exported by the kernel.
>>>>>>> So there is no need to bake a list into the IGT source code. So, add
>>>>>>> support for querying the test list dynamically.
>>>>>>>
>>>>>>> NB: Currently, the test list can only be queried by root but the IGT
>>>>>>> build system queries all tests at compile time. In theory this should
>>>>>>> not be a problem. However, the kunit helper code is all written to run
>>>>>>> inside a test and not inside the prep code, which means that when it
>>>>>>> fails to open the root only interfaces, it calls 'skip'. And skip is
>>>>>>> not allowed outside of running a test. Hence the build fails with:
>>>>>>>      skipping is allowed only in fixtures, subtests or igt_simple_main
>>>>>> Looks like we should fix it, move out skips from kunit libs.
>>>>> I suggest you consider a different approach: for a module, call
> igt_kunit()
>>>>> only once, with NULL suite argument.  As a result, you'll get results
> from one
>>>>> IGT subtest called "<module_name>" with a bunch of IGT dynamic sub-
> subtests
>>>>> called "<test_suite>-<test_case>", one for each test case provided by
> the
>>>>> module.
>>>> I'm not following. This is what my patch does, isn't it?
>>> No, your patch introduces a runtime determined list of subtests --
> something
>>> not existent in IGT.
>>>
>>> An IGT test may consist of one or more statically defined subtests with
> pre-
>>> defined names.  The term dynamic subtest is usually used in two meanings.
> It
>>> may mean a subtest of type igt_subtest_with_dynamic, still with a pre-
> defined
>>> name, but with a runtime determined list of sub-subtests, sometimes called
>>> dynamic sub-subtests, but often also called just dynamic subtests.  Names
> of
>>> dynamic sub-subtests are determined at runtime.
>>>
>>> My approach tries to address your need for a maintenance-free kunit IGT
> test
>>> source file in a different way.  I'm following the IGT standard of
> statically
>>> defined list of subtests with pre-defined names: one subtest of type
>>> igt_subtest_with_dynamic, named after the kunit test module name which you
>>> have to enter into the test code anyway, and providing all test cases from
>>> all test suites contained in that module reported as dynamic sub-subtests
>>> named <test_suite>-<test_case>.
>> Can you please prototype how to do this?  I can read your words but I
>> don't really get your meaning and I have no clue how to implement what
>> you are saying.
> The test code may look as simple as:
>
> igt_main
> {
>          igt_kunit("xe_live_test", NULL, NULL);
> }
>
> Then, igt_kunit() will use xe_live_test module and should report results from
> all its KUnit test cases as results from a set of IGT dynamic sub-subtests
> "<test_suite>-<test_case>" under a single IGT subtest "xe_live".
>
> Janusz
>
Doing that solves the problem of not generating a test list at compile 
time. But it creates the problem of not being able to generate a test 
list at all:

    0:28> sudo ./build/tests/xe_live_ktest --show-testlist
    igt@xe_live_ktest@xe_live
    0:29> sudo ./build/tests/xe_live_ktest --list-subtests
    xe_live
    0:30> sudo ./build/tests/xe_live_ktest --describe
    SUB xe_live ../lib/igt_kmod.c:1475:
       NO DOCUMENTATION!


And that last is clearly wrong because if I don't have a comment 
description of xe_live then it gives a build time error.

It is possible to run a specific sub-test, but you have to know the name 
already. E.g.:

    0:25> sudo ./build/tests/xe_live_ktest --dynamic-subtest xe_bo-xe_bo_evict_kunit
    IGT-Version: 1.28-g8df80ef3edc8 (x86_64) (Linux: 6.11.0-rc5-g2g x86_64)
    Using IGT_SRANDOM=1726523447 for randomisation
    Starting subtest: xe_live
    Starting dynamic subtest: xe_bo-xe_bo_evict_kunit
    ...


That seems less than ideal.

John.

--------------v7DOZYh74qzH3vyjpnXkCEJD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 9/16/2024 01:17, Janusz Krzysztofik wrote:<br>
    <blockquote type="cite" cite="mid:3240976.5fSG56mABF@jkrzyszt-mobl2.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Hi John,

On Saturday, 14 September 2024 02:20:32 GMT+2 John Harrison wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 8/29/2024 02:57, Janusz Krzysztofik wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi John,

On Wednesday, 28 August 2024 20:04:06 GMT+2 John Harrison wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 8/26/2024 06:07, Janusz Krzysztofik wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Hi John, Kamil,

On Monday, 26 August 2024 13:46:45 GMT+2 Kamil Konieczny wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Hi John.C.Harrison,
On 2024-08-23 at 11:24:18 -0700, <a class="moz-txt-link-abbreviated" href="mailto:John.C.Harrison@Intel.com">John.C.Harrison@Intel.com</a> wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">From: johnharr <a class="moz-txt-link-rfc2396E" href="mailto:johnharr@invalid-email.com">&lt;johnharr@invalid-email.com&gt;</a>
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Again invalid e-mail here.

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">The list of supported kunit tests is currently hard coded.
</pre>
                </blockquote>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">That pattern originates from i915_selftest, where there are 3 stable 
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">subtests,
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">&quot;mock&quot;, &quot;live&quot; and &quot;perf&quot;, each of them executing a (possibly long) list 
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">of
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">dynamic sub-subtests actually provided by the module for each category.  
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Also,
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">IIRC there was a separate module for each Xe test suite before, each 
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">mapped to
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">a separate IGT test, later merged into one module with multiple suites 
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">and one
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">test with multiple corresponding subtests.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Not sure if you are just explaining the history of the test or making a
suggestion as to how it should evolve next?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Both, I think.  Maybe not the history, but origin of ideas standing behind 
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">the
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">implementation, and how tests are expected to use it (and maybe evolve if 
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">now
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">doing that in a different way).

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Which means
that adding a new test to the kernel also requires patches to IGT as
well.

The list of available kunit tests is already exported by the kernel.
So there is no need to bake a list into the IGT source code. So, add
support for querying the test list dynamically.

NB: Currently, the test list can only be queried by root but the IGT
build system queries all tests at compile time. In theory this should
not be a problem. However, the kunit helper code is all written to run
inside a test and not inside the prep code, which means that when it
fails to open the root only interfaces, it calls 'skip'. And skip is
not allowed outside of running a test. Hence the build fails with:
    skipping is allowed only in fixtures, subtests or igt_simple_main
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Looks like we should fix it, move out skips from kunit libs.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I suggest you consider a different approach: for a module, call 
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">igt_kunit()
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">only once, with NULL suite argument.  As a result, you'll get results 
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">from one
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">IGT subtest called &quot;&lt;module_name&gt;&quot; with a bunch of IGT dynamic sub-
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">subtests
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">called &quot;&lt;test_suite&gt;-&lt;test_case&gt;&quot;, one for each test case provided by 
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">the
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">module.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I'm not following. This is what my patch does, isn't it?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">No, your patch introduces a runtime determined list of subtests -- 
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">something
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">not existent in IGT.

An IGT test may consist of one or more statically defined subtests with 
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">pre-
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">defined names.  The term dynamic subtest is usually used in two meanings.  
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">It
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">may mean a subtest of type igt_subtest_with_dynamic, still with a pre-
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">defined
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">name, but with a runtime determined list of sub-subtests, sometimes called
dynamic sub-subtests, but often also called just dynamic subtests.  Names 
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">of
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">dynamic sub-subtests are determined at runtime.

My approach tries to address your need for a maintenance-free kunit IGT 
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">test
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">source file in a different way.  I'm following the IGT standard of 
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">statically
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">defined list of subtests with pre-defined names: one subtest of type
igt_subtest_with_dynamic, named after the kunit test module name which you
have to enter into the test code anyway, and providing all test cases from
all test suites contained in that module reported as dynamic sub-subtests
named &lt;test_suite&gt;-&lt;test_case&gt;.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Can you please prototype how to do this?  I can read your words but I 
don't really get your meaning and I have no clue how to implement what 
you are saying.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The test code may look as simple as:

igt_main
{
        igt_kunit(&quot;xe_live_test&quot;, NULL, NULL);
}

Then, igt_kunit() will use xe_live_test module and should report results from 
all its KUnit test cases as results from a set of IGT dynamic sub-subtests 
&quot;&lt;test_suite&gt;-&lt;test_case&gt;&quot; under a single IGT subtest &quot;xe_live&quot;.

Janusz

</pre>
    </blockquote>
    Doing that solves the problem of not generating a test list at
    compile time. But it creates the problem of not being able to
    generate a test list at all:<br>
    <blockquote>
      <pre>0:28&gt; sudo ./build/tests/xe_live_ktest --show-testlist
igt@xe_live_ktest@xe_live
0:29&gt; sudo ./build/tests/xe_live_ktest --list-subtests
xe_live
0:30&gt; sudo ./build/tests/xe_live_ktest --describe
SUB xe_live ../lib/igt_kmod.c:1475:
&nbsp; NO DOCUMENTATION!</pre>
    </blockquote>
    <br>
    And that last is clearly wrong because if I don't have a comment
    description of xe_live then it gives a build time error.<br>
    <br>
    It is possible to run a specific sub-test, but you have to know the
    name already. E.g.:<br>
    <blockquote>
      <pre>0:25&gt; sudo ./build/tests/xe_live_ktest --dynamic-subtest xe_bo-xe_bo_evict_kunit
IGT-Version: 1.28-g8df80ef3edc8 (x86_64) (Linux: 6.11.0-rc5-g2g x86_64)
Using IGT_SRANDOM=1726523447 for randomisation
Starting subtest: xe_live
Starting dynamic subtest: xe_bo-xe_bo_evict_kunit
...</pre>
    </blockquote>
    <br>
    That seems less than ideal.<br>
    <br>
    John.<br>
    <br>
  </body>
</html>

--------------v7DOZYh74qzH3vyjpnXkCEJD--
