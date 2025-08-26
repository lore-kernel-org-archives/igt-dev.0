Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2713ACA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 05:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C975510E2C7;
	Tue, 26 Aug 2025 05:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgQ5GBkl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC9310E2C7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 05:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756186661; x=1787722661;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v3j1Wcdq2jp4/cwUArPzP4vruYauD24nOh8nD/vGtHI=;
 b=HgQ5GBkllZKfjYhYAyeU0pHL74Mk6BfQN2JW3Z+zEZ6B4vfdDMLF3QlG
 U91PFbQVO32Itl6EiKNtt92JKBmssuXU//Rj+sXbTw8Xu+RcvyL8hDK7k
 0SPHd1tsq4Gl2QTttvcjy2bCbNq5ECgrv2YJzKCm4mFDUnx0qovhQZzjx
 ME+hQz8vd8AzRc0wO3pcq7IaCuFDBQKdUrHDIKZiYyoj06bhtFEfxpMic
 9g6dSSzJFq2cVOZ5BVSghZKcAVJzpFYU4I+7SNLFz5uzJ9sDEqEAt/ieA
 rHXm4JF/BqUoh1AEdMtgi6ZkR5sVcJTqB2Ay9D4dm4Gv9t0d6sRVpbieb Q==;
X-CSE-ConnectionGUID: PYiAlrBsS5mAf8rABKrzfQ==
X-CSE-MsgGUID: IbXqS3yARBaxiJjYaJIHhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69783458"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69783458"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 22:37:41 -0700
X-CSE-ConnectionGUID: Vtul40FuTBCgHh9ea6xGag==
X-CSE-MsgGUID: 2zgQHKJgQVO9tXUPaZpIvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="168987744"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 22:37:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 22:37:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 22:37:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.78) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 22:37:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlvawTHEoX7+ROCBb1TkSY4U+w0AXTNELzYUugJW9c1q0a/kKL1p5QIy56Fgzf9bPeXOHN0ZpgQXhszk9yCqX1ElcslTeJSqAGeJRyK2AaXm/Q10xOj+7H9iEq0bIXLTrqdgtyacH0jBTYfCEsjGkajq8oxlhv3ntps8ovW6jtz95hkWgh1bBuIEj3WXPH0ESfSU/arDbDmCLKQGObxyzUwybB/DD8fMXxRN56bMQ/yUdSWf85poktSQovj6s8She0YGesiKigBvy6cOzNIjjD/+NUS/WazDDfhqfsmOlgTfIMAoht75X+3BKX3m7ylkG6O09hjRdNXTjq4Wt8f9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4vY9T5QT5t8FvQr0Ce/ZFnQeus/oi58exSNuxHUrHg=;
 b=gf/9sGZGZyhi9l55e6zt8z90sLiwOr8LrCloHl5F+0kZ1AUUZzIf2s1Ga2941KyGSvzENaeUdcjzw3qu09Ty2U4lIKfqEDw0ibM7n83TEPYXJzLymVNoKnuTuqtTL/JuohIkrfHe+isPkz2Y7woQrBp3iDVZH1oOBPAbkNLsUXIGQc+NZqemvYzr3us2ht5gG9181KwGzZkd62DRw7zqNYLwBDPaym2zGHxnE8KlKKMfF8d/G3wE/EIqpiLn/R344z+EHx/KuGzt7ZUyRPJdRPrNcjVWENB3lvQNDMLkHogQSP/mG46CurKcmyhVp+d0c0lhKaQuEVXgYdlKToAaDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 05:37:30 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 05:37:30 +0000
Message-ID: <90f9b32a-759f-4eef-91c3-763d434dbab3@intel.com>
Date: Tue, 26 Aug 2025 11:07:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/kms_async_flips: Fix for HRR panels
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250808114443.988421-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250808114443.988421-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CY8PR11MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: c287b5f1-764b-43ac-4ee8-08dde462a602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmFKRzNVbmVmcXYxZkNYdXJHZ25YK0ROOTQzMERwY0UyTlhZTm1SdG1CSVBZ?=
 =?utf-8?B?ekNCMnBWV244TVlLYTBCWmRuV2NML09JVk5NV3JxbTdMNDN4TUZ2cDhKWUZ4?=
 =?utf-8?B?WG9VaVBoY0N4R1hVeXZkUEFZVGxWdURLQ010Yk9nWThXSFIxdERtbDlMdlAx?=
 =?utf-8?B?dnlyOTF4bDM1bGd3RzVSWWpXMHI3L3lZWEdhUW1JY1p6alp3QUcvMmthK3li?=
 =?utf-8?B?K1NXSGhTN0ljSWl5TDVyVmt6NEZ6ak8yQnB2WFlkSUtoLzFGWlkrSU5sUVhU?=
 =?utf-8?B?dGgrRnR5UUJHRjB1TkF3cm05cXJjaG1TT1VZSS9WMXlQaC9zK0ptbEgrdjVq?=
 =?utf-8?B?bUlhMHc3VGg5ZzlSM0IzdEduV2pNcks2MWQ1U3NPK1J2WVl4aUQzUU9BSStw?=
 =?utf-8?B?RUFiNWRQMTJRRmNYZjZ1K3pidVYrcWtabFN5K1dJcUNvZmNpc2Y0cmdsbnVS?=
 =?utf-8?B?SXJzQTVpWU01bjVxLytrcmNjWk5TQ2VSMGw5K1BIbzJMd3NyYlM0UXhQaDBu?=
 =?utf-8?B?akdzSCsvTG9KbkR2RURwbTl6bUhVNzY3RGhDNlhSWmRISGhLZTZFR3JzN3NL?=
 =?utf-8?B?OGVLcnFpdkNKTjlSRnlRSVl3VlNXWW83aU1sSDBIY1luMUo3TVJvVmhJZnhC?=
 =?utf-8?B?SGJRcXZIZGtJbnpldytMSXJYblVqV2xnZTNMUGtENVBCZXowbXpmOFEwaG91?=
 =?utf-8?B?TWNXajBnU3lIVWVTQ3doUHVQZWsyWEwyQW13bU5kR1FNcmhsMUdFbnNUMFRY?=
 =?utf-8?B?OVptc2hvMStWdjV0N0FRL21QS2hYSWVCZzQwOTEwQU5hTldWcmdPRlp6andr?=
 =?utf-8?B?dk4yNkcyTXJ4b0lLTk90ZS9xWW5XZjVUUC9Dd1E3TXlVWGNIMGFTazc0Qmlt?=
 =?utf-8?B?d3BQQk5IZG1Hd1BRY3dQSEZMSlJYL3JOOHFwT1Fsa25CaXpHZHRHK1B5U1BQ?=
 =?utf-8?B?MmNySmdsSU9YMCtIMXNvSXNxWlViYkQzbjdXajJqeTNFYzgwZVJYd2dtOGdm?=
 =?utf-8?B?S21oaUR1NVI2V3dhR0ZER1ZENnZudVA3R2RVU0RneEFjWmw0TnVKK2RDZnkv?=
 =?utf-8?B?MXBWRG9xbW01dVlQVDlYNXJ6allneDJ0L0dPdC9QNDZxRE9UQVFGTFJhN0hm?=
 =?utf-8?B?M2tCb2hmYkVEUmlaZGZJZlg3QnlQU0hzTWNkTVZiWGt3Y2JST3VETVFQaElt?=
 =?utf-8?B?QnBPTW9nY1pDcnhpY3FybGpJZzBtb29zMmdiVjFhOFdPZXBWYUU1MEE0Wk1o?=
 =?utf-8?B?eUZwRUplTVMyazcrWERXcElBdFJ5VUpoVmRSbThvamN0RWNNYjIra2R6alZ4?=
 =?utf-8?B?VWQvR0l3dUNHSFpWTDVMRUpDUTc5a1lnRWh6cVpndGI3UFlPditrRG5MMm9V?=
 =?utf-8?B?aE5yZ3NZSDhZOWEvM0NzTG9STTE4L1RYUjhhRFZXZjZ1VmtHVWtwbWFlWVBM?=
 =?utf-8?B?YmxTNGQvTXdhTlY3VEpMUkdRb3RvdDNLWUl5d3pEMWFULzRjOE5CZmN5QkRE?=
 =?utf-8?B?NG8rM3hXcGRkUVVoc1RVVnVqWHZYL1pxU09nMUlPVFdlRElRb2VQQnoreXJZ?=
 =?utf-8?B?WkZZNElKQW14UXQzYlZmYVBOT0RFTzNRc3RFTmZCUC9jRXFRajVjbXcxckxm?=
 =?utf-8?B?L1BqeU1QVFpTdCt0aGErUlZpRnNJZzgxYnVtbVd3a3A4bWJMLzNJV2RNVHov?=
 =?utf-8?B?LzBqT29laGZKSDB3TzR0cktaLzNib1B0ZHF0djZsN1VuODFYNGVZNUlaQU94?=
 =?utf-8?B?ZHpWM3hWZGRBR010NEYyOXhMeTFMbDFQYk5SRjVkWkZaWmZDMWsxNStxOWZW?=
 =?utf-8?B?VWd6R0gyMEpVaVo4VXVMaGtJVCtYbGFQa0NrV2tZSnJHMnJkYS9zdlNYdWoz?=
 =?utf-8?B?M2laclBKTUQ2Vm9qZERIbERvVlQwdDFaMisyVFlrQzh0OVNadW1uZVVQc0lE?=
 =?utf-8?Q?mx0uc1vu9UY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zkxicnh0VWV5N3J2VExUZGdCTTJiYVhwWk9xaW5rSnd0T0t5bFNCV0lmN2l5?=
 =?utf-8?B?ZThvRkR4NDVLbGhsQnNNRTVUbXdIemFEaThRVGtZdSsyMDFsVVNmZzlrWEpi?=
 =?utf-8?B?bW1aODVoODluN04rb3JEd0cyTWNjNGtDR0RsWVgvSFk2blJ2VkM5Yjl0Sis3?=
 =?utf-8?B?ZEFCR21MRHB6V0UyaGFjR2E0OEdyL0NXZEFxNU1yOTBjdE8vYWlmN3ZaWnVE?=
 =?utf-8?B?cTBCTnlEZlVNUFF3VzROcEJrRG4rNmNmUzRPMlp6R0ErTTNnS3JuL0taUG5s?=
 =?utf-8?B?TEc5R2dLdkc5d094ZjY4MzlheEd3NWllN21WY2NXSy9YTHhFaHpFQTVUMFJs?=
 =?utf-8?B?NUwwZTlJV3QzYWFkcE5mcDNyNHJVWHJ4NFo0VHNQeUE4aHM0ZU5zRHc0ZXBM?=
 =?utf-8?B?RHdvMEdmVGRGZmMxUU9DL2UvWWk4My9KUHZiQ2h2cmhHUXBXQ0ZvaFZTTFph?=
 =?utf-8?B?MGpmeXNSQXlkOGIzV0o3MjJ3VnVTa3AvTWN2S2ljSnhPdjcvcVBMcEhxaWhH?=
 =?utf-8?B?anRHZitNSFhsdm5hVUxOS0w4dlVCMUxqcEQrMEhaSzQzTVFqMUlTTk1jNXlO?=
 =?utf-8?B?VVY4YjJ1OG9Ta0g0dWcxb2ZaM0M1aU9NcTJ2cXpzb1RQVmJ3VnB0b09YTTRn?=
 =?utf-8?B?QVNQbGFZaWVRcGZ5U3FtUW5yY1EwcGN0bUtqTUNJUHVWWEczMFFjS2VDUXpF?=
 =?utf-8?B?UmRKVXA4djVWaVVKWDN4ZXhUS1cweUFFOWs0d2lWZTJpenUxYjlMeE1kOEw4?=
 =?utf-8?B?YmZJb09LTmtydnM4VGpNUHlwTVIycE1QQ2o4bzFubjhXSFg5VSt6c3hPSnFZ?=
 =?utf-8?B?OEtDSXI5NnkvUUpGVi8zM0hNNXpzWkdPT1F6ck95RHVQTXNLWmpaYmNuS0VU?=
 =?utf-8?B?aHFpWTlFVmd5aUdaejBEZkdCNzBNTXJ6dGNUV1JoRTNXdXNJcXJJQVIzRW80?=
 =?utf-8?B?YVVxblJ2TDltdS9FUmZJbTdEcWxBVXRWTXZ6UWcrMllja2pxRlhPaFNDUUFU?=
 =?utf-8?B?bVRIVmd3Z1hSZTcyYmlIb2xtckplS283RzBDOVRoeDVUOEVDeTlhdXpsSTZJ?=
 =?utf-8?B?czBqK3lXd2o5RTRHc3p3YXRTUzBvK3FyZkhsSytqd1VwdU80cjBFekRyMGkv?=
 =?utf-8?B?MytVR3lVdGx2OXJyS0l4OUpuQlBIcDB5MU5mK3JSNUlaVEI5UFNiTFY0MjJr?=
 =?utf-8?B?cVhNMHZpdkNzcjk2dThNWkxJd2M3ek12U0ZtRXEzeUdhbjFMNi83MlJaTS9m?=
 =?utf-8?B?a1JhSERuWkxDQTZJemI1SVVaRE5EUWtVNHZCOVRQQVdsQWcxcWV4bkM0aERN?=
 =?utf-8?B?R2cxSElqZTFsZ0ViQmFNSFpQMVBZbUx2VWgvTUZrR0kzQWdseSsrS2JnZzE3?=
 =?utf-8?B?VVpRRExweFNKMmRqaGo5M1ljSm5RVzRTT0F2SUdtVk5Ncy95cFk5Rkc4RG55?=
 =?utf-8?B?QkVSNEpjd3ZBOWF2Q2tWdDR2dHlSTHUwN0NrMWtYUGtnTVV4cWJvMTFzR01D?=
 =?utf-8?B?Ynl1SDBFQnNwSWIxS0pjd0lYSUVkYjVneUJZZ1VuT1JXcDJYb0xqYVJvaFp6?=
 =?utf-8?B?WWdTVWVhcmFsS0lNNG1GMkZZT2RFSE1RaDZib2ZQTEpwWFZrMXJzcWs4SnhB?=
 =?utf-8?B?bDhpUVQ2SWl5QWFMRjlDM0dKck9qaEVDSGUxSnR4VXdubXlmM2VBME5DUWtX?=
 =?utf-8?B?TXJjSDVvTXJXZG9IVSsxcklGZEdJUUNyaFlGR2s1amFnTExrQ0JPbzdTam5I?=
 =?utf-8?B?NVVKdTEwRnZ1YXdNVXBHSzd2dlZ6aStUUGJUVStWeVVPenlHOWdla0NwSVAx?=
 =?utf-8?B?NTl6TFpZdzIxT0VkNUNvTm5qNmxwbUR5dnd6TnFncHJzUm55R3dOOHNLcTYx?=
 =?utf-8?B?UkE1Y2E0Z0U5NE9CbEhZbEhrRUdIWjcvbGREb1Z1Zi9EZ2lYTkVQb1VBella?=
 =?utf-8?B?cDY3V2tiUFJMUFB3UTRwWGpMZk5BQk9EQWluTXVjZjRqeGFWT256cU9wcUdD?=
 =?utf-8?B?RDFySTNtMkwxa1AyQy9qUWF4SGkyQ3B3TmcxZUxPUTFMajh2dFYyeWI1MHFI?=
 =?utf-8?B?ekd3N2lxZmFNb1o0TUsrdkxGc2gybmtoMy92MkVidU51LzMwSTFRZmQvdTh6?=
 =?utf-8?Q?rJk96Es4VptzfRIdKJkLRtLeS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c287b5f1-764b-43ac-4ee8-08dde462a602
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 05:37:30.3665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1WRxe8SiBMxt/ZAYzUMXSSX+syWwGjunJ5rF1MGd0+/ENvxHe/9WUqtj7HUvnaP2P8qgJMFLriuLQkz6NlHZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7828
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


On 8/8/2025 5:14 PM, Santhosh Reddy Guddati wrote:
> Current logic in the test is too strict for high refresh panels,
> It expects the flips per frame to be 5x times the refresh rate which is
> not ideal for high refresh like 240 , 360 Hz.
>
> Introduce func to determine min flips per frame depending on refresh
> rate of the panel.
>
> v2: Remove hard coded values and calculate min flips based on refresh
> rate dynamically (Karthik)
> v3: Revert changes in test_crc()
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 27 +++++++++++++++++++++++----
>   1 file changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 1ac5e6db0..bbfcc0c10 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -117,7 +117,7 @@
>    */
>   
>   #define RUN_TIME 2
> -#define MIN_FLIPS_PER_FRAME 5
> +#define MIN_FLIPS_PER_FRAME_60HZ 5
>   #define NUM_FBS 4
>   
>   IGT_TEST_DESCRIPTION("Test asynchronous page flips.");
> @@ -158,6 +158,22 @@ struct format_mod {
>   	uint32_t format;
>   };
>   
> +static int min_flips_per_frame(unsigned int refresh_rate)
> +{
> +	/*
> +	 * Calculate minimum flips per frame based on refresh rate scaling from 60Hz baseline
> +	 *
> +	 * High refresh rate displays fail async flip tests due to
> +	 * unrealistic timing expectations.
> +	 * This ensures async flip tests remain meaningful across all refresh rates
> +	 * while avoiding false failures due to overly strict timing requirements.
> +	 */
> +	int min_flips = MIN_FLIPS_PER_FRAME_60HZ * 60 / refresh_rate;
> +
> +	/* Ensure to have at least 1 flip per frame */
> +	return max(min_flips, 1);
> +}
> +
>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
>   			 unsigned int tv_usec, void *_data)
>   {
> @@ -415,6 +431,9 @@ static void test_async_flip(data_t *data)
>   	int mid_time = RUN_TIME / 2;
>   	float run_time;
>   	bool temp = data->suspend_resume || data->hang || data->dpms;
> +	int min_flips;
> +
> +	min_flips = min_flips_per_frame(data->refresh_rate);
>   
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> @@ -473,10 +492,10 @@ static void test_async_flip(data_t *data)
>   		timersub(&end, &start, &diff);
>   
>   		if (data->alternate_sync_async) {
> -			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * MIN_FLIPS_PER_FRAME),
> +			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * min_flips),
>   				     "Flip interval not significantly smaller than vblank interval\n"
>   				     "Flip interval: %lfms, Refresh Rate = %dHz, Threshold = %d\n",
> -				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
> +				     data->flip_interval, data->refresh_rate, min_flips);
>   		}
>   
>   		if (data->suspend_resume && diff.tv_sec == mid_time && temp) {
> @@ -527,7 +546,7 @@ static void test_async_flip(data_t *data)
>   
>   	if (!data->alternate_sync_async && !data->async_mod_formats) {
>   		fps = frame * 1000 / run_time;
> -		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
> +		igt_assert_f((fps / 1000) > (data->refresh_rate * min_flips),
>   			     "FPS should be significantly higher than the refresh rate\n");
>   	}
>   }
