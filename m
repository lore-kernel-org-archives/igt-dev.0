Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241F2CD3442
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 20:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFFA10F209;
	Thu,  7 May 2026 20:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GOQ21TPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFB010F209
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 20:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778184438; x=1809720438;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fFInaIA8CPu2LYQYyd10t/JBvF6NqZLE6xs2u9SlEvE=;
 b=GOQ21TPPk/H8kjLrKXyKHgO5hcDrldSNTysbRxdzKPrHgGzDoI9ySKfP
 H8q7Ib+uHnR/r81wj6lyMHE8Y2SJJPPXHztTnE7aWbHxfuhiuhQATBRNa
 k2Bq5EUYxLUjnZCBmRBMoRaKbUCcSTipmbb4eLAVA1QiKD8QdcDKbNEiP
 FwPNMIlADJX0VFQGcxYupzk+5AFU15W7ZIN31M5pwwqiN1AQbo5XqFA/o
 jBga74ksMXWmQZWwqPmmUmldNfotndXBcgdrrqJpBpPtTadhOKDMRrQN3
 wu0wsi/peorcCwb+GzIsOqtmsq9zuJQVOeWafYyE0iouOP/2nxw1CeWJf Q==;
X-CSE-ConnectionGUID: e/jI8Fa5RaiUSkLJXrcelw==
X-CSE-MsgGUID: fJswxFDbRCCpV/O2IQJQKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78998686"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="78998686"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 13:07:18 -0700
X-CSE-ConnectionGUID: kmmhfxYCSRmrIbXlirsAyA==
X-CSE-MsgGUID: Ee3mf1lNS1eMRyP5+iMMqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="238353048"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 13:07:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 13:07:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 13:07:17 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 13:07:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wfv1fXm2MzmLVzAxnnLeuFnSQCieB8Mwx/TGcKQs+zlCt6liwuvk0WB8YHSqI9wq2hkNLjyor3GyMFvhmBPid6vYvgBOAbD4pX8O0UuuaZvekTzZwOwPOiFAmSoKuBvFeoR9OR6wbXeqbOwoWDYn99SHjtW7xHel1+9nDMFNegD42QjUaXQiWys0HDTVBA3vBur1i9GtXXH0uWD9lCtuSeZfH170SVQqNXUdox33R6KdzDP4E9LXouFlZSd9U7L7dBPHNHRXN9rbN58XbQKBwZZLvH5UoGm919VKvdZM9t6znKrv3wl0vVzqD4zIjRV62qk3Ixclr+q/N9rRRXRpog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lc8vO+7oVlz4moQnSbLAj1a2LwyS7MuEn+y0MWfZNk8=;
 b=cN5HWvXE1T5gM/14/HnlRfADC8ilZefw4jyZMxVB5uvXjVWgCcd64iET99eVddi8Gup7g6XuOK9eqS+8DwWBUQF1Bfj62MG3tCZQi3EcEFW/W8UQQ30IAUF9oJEWjg2WQ9PzqCOk9GYI3/szZP2W2Gj28gLD6eMQiXdltzAdPo75z7jNHqhFehCLWFGxVgIXu8wQChWGEb88QE2T0hoQoXztSapHbPDyIn9Z0J3mOWniSMI47Jat1a/1RvhRAOo8gGY+nwiBSBVANOTVT/RlUwtc2pwCzsn1LqDmopiQjyEE3WzOyZcDF2T09QXPrk2nEJjOZZCJx2E+lCSKtc349g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MW4PR11MB6667.namprd11.prod.outlook.com (2603:10b6:303:1ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 20:07:07 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 20:07:07 +0000
Date: Thu, 7 May 2026 13:07:04 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] lib/xe/xe_spin: Add option for QUEUE_TIMESTAMP
Message-ID: <afzw6OL1u22dfsAl@nvishwa1-desk>
References: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
 <20260506183137.51479-7-niranjana.vishwanathapura@intel.com>
 <81b70498fab2a302ad8c131ef9d589dd7e39c230.camel@intel.com>
 <afzq8QUcfKLm7jiT@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afzq8QUcfKLm7jiT@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: SJ0PR03CA0359.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::34) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MW4PR11MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 3509c4da-5d78-467a-d93e-08deac743729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: uH96kplOBtbmwOYrxSPOmLzgulImrmP0SMscSQ1A8NUswvXAJwS18Bd2xYLdIHL1dO3Rdw8feL5vvMvr3aLO++3FYuigtypZGZmA1JfgpxT4IQEfUJjUeDkDr2zpifhLI5pnPUl9GSxynV7skbKtrpgmnRgcAQ87BIEGSu409WJVtVvg6VRaAKSBkIaCMeYLBXqJt6jdXYl+pkoe8fM5XNv1wohH+j5IWx6cFcsdSLJFlxEaOUP3RmfvhIsgtnBdRwBiMyG8a2rIzbcPSrXDibpbw40KwLnb5Xt0i0K0tqWboEqsTDd5BRcC8SqupqXaSD1nMDgabPzDXD8tErFkEhrIL79nQ/M2sm3GsgNTAf8+J/RdL+8eK6mH1O+NaLtgelNNM+VH+NWYust6VWvCCcf/BQHuFq9ULjPmi9ppNosVTsxVtgdmIixlXRHXhaBFhI9o2RJCjX4ZL+wlrXWnCJhYATslLQ6Gj68V3rw042KSUMXqli4Z4mN1lo9/ZldOsifOQsZBLbl18l4jGsz9mb2XcugsAW8TrWqbxGUW1Le9ypww/TF8W/0pxCIMe6GRs0KjKgZZLSwxahppYFMTCapv/UJf2RJtO6PIrRt+jnVa5c5PKpLBGNBr8Y9k2jRSfSgoHI68yosgZVO2Tm878g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/jvLbM8wI+Nf3D9svNNUXColtsjkYf/Uqa6w/v8Sdx+OqJMkWcDDrMRHxQ?=
 =?iso-8859-1?Q?wzVAdMlp1vMDkC6S4UjNcWRe1OTfdayajFmzKdU6LupGs2PfUiu3d7IviF?=
 =?iso-8859-1?Q?fkdKIaVlhI2kcXhkZt1MEnG+9imh6ZcFqOdTl9NPF49zgi7VUceyj3K5wx?=
 =?iso-8859-1?Q?aGtM48/LGTrTmrDcu3MYNfsj8FeCaWzhTu8+2pM+lue0trrU3XxDx0G7XP?=
 =?iso-8859-1?Q?bWd2gTXIev1WtdaVIRCE4zMpttB9eVaXQYj6/rxw45Ifct/CGqF6KomFJr?=
 =?iso-8859-1?Q?jBPynkjn7waBwDYhfQbrH9idsxBHeyu7T4jN5Pifz5yL1mtRJ2+04MGzHH?=
 =?iso-8859-1?Q?/czTEm7LwDxD3zbkVmZOu1DU3/+afDO4s6QoUKiSYkOf+ticw0no2tMY/C?=
 =?iso-8859-1?Q?K1TglYuNYKYc3gdOBEZcKijE0grjKbhGuxiDxXb3m1IoBfVZ7sQ6G9CYzs?=
 =?iso-8859-1?Q?5P4La3vvU3WAYSsLSQ64IpYv3LoMRuBn2MYkQ5ZPeC2+nYuk1BII+7bmjm?=
 =?iso-8859-1?Q?s0B5wIyzi752BLxdpQhjbo1CPS5rLRVYh3QA94Y3n44rEY11QZRklIlHv/?=
 =?iso-8859-1?Q?JhxfS79Vj4vT5OTgQ2n640qwp7i1uqLMnYXopPBUKjwBRsNSzFZtFBEW97?=
 =?iso-8859-1?Q?rZEDgXFZw5Znsknu529bgw1m+/U7eQSAYa4s018lfu4qy94XMxqGHdrE1F?=
 =?iso-8859-1?Q?B1ZHTfuFiWQGWvJjtGFuly8MeD8iXwbpctZpKVkSACSU+eNuHvOZ2wzzoW?=
 =?iso-8859-1?Q?y9i5yM2yYNvnXHztx8qGfxh7lp1KfNLZuuVfLbpqSV1AnJgvOl4HTnRq2P?=
 =?iso-8859-1?Q?VtEBJ3RJqZGA7wWRsyjMroSZ1ah3TsMlJB0v4HzkL2vTNzDtPcWuyEqYta?=
 =?iso-8859-1?Q?fHGegs4GCDk8tOAxKnT1F1vUWdP8LrShNhqCMEe1OjpPtvPxLuj8rMxH/+?=
 =?iso-8859-1?Q?kX+n1kBesxL5+hzN8eQk82NiBqkEGtSY3zb9awvS/HDuDgKNnicNYUsNR5?=
 =?iso-8859-1?Q?47Q5NOchsAh3SU7M4KYmNlB6qg7/7D1JVFM4lQ2SWDdH1sLgSVu2/lD87x?=
 =?iso-8859-1?Q?oLqIJZhNxCtCfuEpmf7Joh3wd0qIpk5Aam50qtFDhO++uyMFHi+dIQD2Dw?=
 =?iso-8859-1?Q?JPes5vvUYJdOwGqKf91KlHvfOZPfJ7eVRtL/PauVxKveLGNq5MxB9nVfwv?=
 =?iso-8859-1?Q?MnWjVH1Cs565AfODM8uAjrisYsjLu8hZk1n8ZW6kPO/RmZy6mSmWevx9PQ?=
 =?iso-8859-1?Q?bMmZXt9Aw7YV/VBSnoWi5Qnv8/eFjFirJ7Z30AkjI8oT7rQLNOIHWrbjfS?=
 =?iso-8859-1?Q?zkTAccbr5GI0EX8pm2uUcQzwmF0GpTgjoAlktfYsn0UVwpEz62dOIc/VZY?=
 =?iso-8859-1?Q?aAKtl6VmKns1OcSTPc5Mqz2W0sMg8EcG4WuKpsErRCfg0uG6uNwHzwPTuL?=
 =?iso-8859-1?Q?A+LURcNa4EuO71QdmIZbiNbcBEupcKcdhLjXbWHdMhH+dfG8tSc8EyC93d?=
 =?iso-8859-1?Q?0VBjHdU86GxnIb6UxxoEF2RKk4KdHa9qHnr8t95iE+jFcYAHBFvWdox1Vl?=
 =?iso-8859-1?Q?uWSm+CWkN1EF3Y6YqPVOhwB8UX/SjGCi+B1fGRKcw3xAUoI5r1Giug/bw4?=
 =?iso-8859-1?Q?TmCugWZ2EnfT9qhVksceSySPs5dG8Gt/WmjZJgaxs6oCEvCpAfKJB5YVfO?=
 =?iso-8859-1?Q?DQ5BCel74kZUIYmcUxmhhr7fxfGhQyzpRJVxesG6t5YMhmsaCFVAWWbfpq?=
 =?iso-8859-1?Q?i1RjKbDo1SDN+QRcgTZI+CcAiHwFKVGjsvFgCOZFOJ52ogACxMCYhh4onn?=
 =?iso-8859-1?Q?1mdAGLldQr1G9IWhfbpkVgivEtY+dI9WddIXKrJmGC2CLtOe8X85?=
X-Exchange-RoutingPolicyChecked: CDb6fiWIGD/v8IFWUdwkwlQHQiPtAPgyFcOsUCFMSKoJz+dEfYBUMbhQ/Me9eNsxyPUXlI1yCayhiFrE9ZFM8zrraT4PWALJh0OI3yGlwoachmfnjGa+uaIU8yaSiEUdEIrSFCeFe0HcacFb0cq732xE3b6hdK6fESku7znJwh1MQLYpC+Ch1QLrDxISOa4sGJtA084JuM3Z/fisS+8mzCt4og3FqLlKnmHkVuY0bomC3YahC1J583xXRPRu9cK6FKAMqPuPjyvZofJzrySyH48UHNifX5mihjUptiftvxH1aljbJY1pzn3MC/r0dAu+a+c9IYVc+SEDqCG891tRmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3509c4da-5d78-467a-d93e-08deac743729
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 20:07:07.6707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fwpeuVRcPr7zdJL1dvpeCg2hWj9NKCGMTjBS053v9xQ4YDLCLUiLvANFUKrRwBiQtP8iTUoxFuZ04x9Mh1YCNVTRlA1VtE1Ohx7LeQLYPIgBd12o3mI8FFDslClWK1t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6667
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

On Thu, May 07, 2026 at 12:41:37PM -0700, Umesh Nerlige Ramappa wrote:
>On Thu, May 07, 2026 at 07:23:50PM +0000, Summers, Stuart wrote:
>>On Wed, 2026-05-06 at 11:31 -0700, Niranjana Vishwanathapura wrote:
>>>From: gta <gta@DUT4637NVLP.fm.intel.com>
>>>
>>>In multi-queue case, CTX_TIMESTAMP register does not
>>>provide the running time of individual queues of a group.
>>>Provide the option for spinner to read timestamp from the
>>>QUEUE_TIMESTAMP registers instead which is useful in the
>>>multi-queue scenarios.
>>>
>>>Signed-off-by: Niranjana Vishwanathapura
>>><niranjana.vishwanathapura@intel.com>
>>>---
>>> lib/xe/xe_spin.c | 9 +++++----
>>> lib/xe/xe_spin.h | 2 ++
>>> 2 files changed, 7 insertions(+), 4 deletions(-)
>>>
>>>diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
>>>index 14952ca90e..8743107898 100644
>>>--- a/lib/xe/xe_spin.c
>>>+++ b/lib/xe/xe_spin.c
>>>@@ -25,7 +25,8 @@
>>> #define MI_LRI_CS_MMIO                         (1 << 19)
>>> #define MI_LRR_DST_CS_MMIO                     (1 << 19)
>>> #define MI_LRR_SRC_CS_MMIO                     (1 << 18)
>>>-#define CTX_TIMESTAMP 0x3a8
>>>+#define CTX_TIMESTAMP          0x3a8
>>>+#define QUEUE_TIMESTAMP                0x4c0
>>> #define CS_GPR(x) (0x600 + 8 * (x))
>>> 
>>> enum { START_TS, NOW_TS };
>>>@@ -67,7 +68,7 @@ void xe_spin_init(struct xe_spin *spin, struct
>>>xe_spin_opts *opts)
>>>                spin->batch[b++] = CS_GPR(START_TS) + 4;
>>>                spin->batch[b++] = 0;
>>>                spin->batch[b++] = MI_LOAD_REGISTER_REG |
>>>MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
>>>-               spin->batch[b++] = CTX_TIMESTAMP;
>>>+               spin->batch[b++] = opts->use_queue_timestamp ?
>>>QUEUE_TIMESTAMP : CTX_TIMESTAMP;
>>
>>I see in [1] we are programming this register in the ring also. Will
>>this cause issues if we overwrite this here? I see we do the same thing
>>for the context timestamp, so probably no issue here. But it would be
>>nice to document somehow the expected interaction between the kernel
>>ring programming and the user batch programming if any.
>>
>>[1]:
>>https://patchwork.freedesktop.org/patch/723502/?series=164654&rev=5
>
>The MI_LOAD_REGISTER_REG source is TIMESTAMP register and destination 
>is the GPR reg, so we should be fine. If we were writing to the 
>TIMESTAMP registers, then that's going to mess up counts.
>

Yes. Note that we program the batch buffer to only to read from this
register here. KMD whitelists these registers with only read permission. 
We are not changing any of that. Only using different timestamp resgister.

Niranjana

>Regards,
>Umesh
>
>
>>
>>>                spin->batch[b++] = CS_GPR(START_TS);
>>>        }
>>> 
>>>@@ -83,7 +84,7 @@ void xe_spin_init(struct xe_spin *spin, struct
>>>xe_spin_opts *opts)
>>> 
>>>        if (opts->write_timestamp) {
>>>                spin->batch[b++] = MI_LOAD_REGISTER_REG |
>>>MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
>>>-               spin->batch[b++] = CTX_TIMESTAMP;
>>>+               spin->batch[b++] = opts->use_queue_timestamp ?
>>>QUEUE_TIMESTAMP : CTX_TIMESTAMP;
>>>                spin->batch[b++] = CS_GPR(NOW_TS);
>>> 
>>>                spin->batch[b++] = MI_STORE_REGISTER_MEM_GEN8 |
>>>MI_SRM_CS_MMIO;
>>>@@ -97,7 +98,7 @@ void xe_spin_init(struct xe_spin *spin, struct
>>>xe_spin_opts *opts)
>>>                spin->batch[b++] = CS_GPR(NOW_TS) + 4;
>>>                spin->batch[b++] = 0;
>>>                spin->batch[b++] = MI_LOAD_REGISTER_REG |
>>>MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
>>>-               spin->batch[b++] = CTX_TIMESTAMP;
>>>+               spin->batch[b++] = opts->use_queue_timestamp ?
>>>QUEUE_TIMESTAMP : CTX_TIMESTAMP;
>>>                spin->batch[b++] = CS_GPR(NOW_TS);
>>> 
>>>                /* delta = now - start; inverted to match COND_BBE */
>>>diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
>>>index db0febd8ab..75a6ada420 100644
>>>--- a/lib/xe/xe_spin.h
>>>+++ b/lib/xe/xe_spin.h
>>>@@ -51,6 +51,7 @@ struct xe_spin_mem_copy {
>>>  * @multi_queue_switch_on_wait: Add a SEMAPHORE_WAIT multi-queue
>>>switch point
>>>  * and have the queue switch only happen if waiting on the
>>>semaphore.
>>>  * @ctx_ticks: number of ticks after which spinner is stopped,
>>>applied if > 0
>>>+ * @use_queue_timestamp: Use QUEUE_TIMESTAMP register instead of
>>>CTX_TIMESTAMP
>>>  * @mem_copy: container of objects used for memory copy (optional)
>>>  *
>>>  * Used to initialize struct xe_spin spinner behavior.
>>>@@ -62,6 +63,7 @@ struct xe_spin_opts {
>>>        bool multi_queue_switch_on_wait;
>>>        uint32_t ctx_ticks;
>>>        bool write_timestamp;
>>>+       bool use_queue_timestamp;
>>>        struct xe_spin_mem_copy *mem_copy;
>>> };
>>> 
>>
