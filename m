Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262D8CD3427
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 08:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D1310F3FB;
	Thu,  7 May 2026 08:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HztMDPFk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9837210F3FA
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778143990; x=1809679990;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=26PulW90JhDYcInR/z68JXZwuTkjWtBK16v3LdYLtA8=;
 b=HztMDPFk2Z408R5qM57fXPcXNrxKQz8TTU9t0CICXvJSI5Yn3ccmkivc
 TpEBBJIy+SLMD0JCzxO6mEAej/qzeR3JeiCaLGEZtvtXXStkI04IkbYwZ
 gYGGAAD8sKwM+wawQk9h0JbrXdkF8irW/vhGSuA97B8CzyLgq8v6K4hEE
 xIWQfc8YBOXhlhslNKJph5NvHzyHnylVMxxXO528HFn85Wi4McYixrT+T
 kdSpyCwMFmdBFymUjp8UTUIeR4MgbNBnhXqsnnb0Fll8HZ27Je6OZAvYQ
 drBM3EBTOc4I+MYIWs3KlyASEXUEsuaaCK6GQAmS7doEW/EiuxGOc+5RT g==;
X-CSE-ConnectionGUID: GFdw1NjRSTuB9tocRKaYNA==
X-CSE-MsgGUID: FwgcB5lYSzSZYy51iQA+tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78986890"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="78986890"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 01:53:09 -0700
X-CSE-ConnectionGUID: PyIdqeSnSLOqRsNq1rI7DQ==
X-CSE-MsgGUID: 82Qhpv4rQhW8fc4JhVe3/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="240734836"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 01:53:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 01:53:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 01:53:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 01:53:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Olb3DmrfKrzaB9XDdXUZ3fMz3HoEbaQ9FYozwUGcHIhKMC5MPJPbqvTGP/Uo8Fex4kZze52IAWvk+q9u9lNygJTCtMEUJ29U1byaxfo7l8hWM11B9cSEttEBcJ1S45tZPBqtf5UZK0M/S2wvo5rOps5UvULq8KSwi0t72QgQimys48cpG0mqLTxgqSS70cLy8o332evqmjFI82BGXR5NE+VOsKezIylBZEx6jUe7irUmJTwiQoaj//26Ldv39DNVNDIw+oXhN9AQrXGwNs/0dFaMqwVabjXFqpkZSrZdLasD75Y+YaYRv/FkuviVD892Yw6Dy7AP8kdwR8WlzNiFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mu3zES8rseDE5s4JFQkNoHgINjo5vLPc7ubuM+JBPf8=;
 b=jSjMDLIXF0IP8kdM6VEaIiBlxScMMEx9Jt10g1tpGRVogYiKqT2thFgcudkI0Mx7A4WUgjuXe/icswbiy6P4AHi0NHBFT1YurNFFIxNS+imeNVIbj4LFsj5IEMjoicAByF1WfmrGqNgTs8Gd/q1PyV30Sy8/B3a3reGcuncPwPrL7n9mbr1lVFso9qWyHpf2aHisLBt4fInI5DaE7zaM+MmiX/VTExKB8t/7CP82kTjF0hisvuYqwLv06LKGZSi6kGUCukkAraVbfOEYRHPfR7UwPaofU6LailpgfC3WW+Il3RqxWOSk6oA3WZy/30XyyoHGEYqsyvMSNNdIjIhc3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 08:52:58 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 08:52:58 +0000
Message-ID: <24aa9483-a6a9-46e2-b5e6-0a775ab6cc34@intel.com>
Date: Thu, 7 May 2026 10:52:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tests/intel/xe_eudebug: Add
 basic-vm-bind-ufence-no-ack test
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260227142638.3264013-1-jan.maslak@intel.com>
 <20260227142638.3264013-2-jan.maslak@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260227142638.3264013-2-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0031.eurprd02.prod.outlook.com
 (2603:10a6:803:14::44) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|SA1PR11MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 12bff2bb-ad16-49b3-4778-08deac160938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: cif6x5aFqk+Qe1qNUZ8QAUBB356Phc9awUy3q6ziLCC6wU/BW8sv3peus//wIA/xPLWGy5xo1jrLEYie7qMBlObw/aKgDSspn/8kuqXt3ztGYy3kRErn4dA3LOqtmLHllrmYu4sXmkXis53pPIkz4oJM4CJhO5xI68gXHuEoNOXtsDPJA9q1Xshmj67V+CrxbJSxoB9Tqar8ZjiyrnFyrtuXl8NISl0XrwX9Db53fp/0S1vOGls4/SXe64YzKOh3O4TQJiKi8sS3YcNxdEu7lbRle7NyIvNvba09ln2U15cwwBm3Y9CHdvCvNnVzpw5mEUNTncj+LR6izTP5xH9DdEutRAkuldVoG6i/Lke8fCtxfMFHvIdytGj9NmdSkQ/e0FxoEM/y/LL1bdS4OjxUf3RAmrWXsXduKTJx0wah0iQ7oEwrT1/5dIDHX/MyjwKQNW2pwq0I+PsLPcidIdcILg52k1z0JEQgBp+VrdPwB8fGOjtTWxf7ZhgEmy0Yb/Ub6ypqXgZT1UhlxSBB6UjN68UQVlQl3mw3/4EalawNXypU15h57REit9upccJzZBo9kN7ND6+orgRkjPBxDH863k2tZwGNgMuzuU6pnPBA9BepO/3rL/7gKfHvCC7FxX2sauAi1ifJ5yujQFMvxEuTrgxQ6NlmgZtU7J3fJf1LdHPVXtRS9Ej/NOStUyCTAPMQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emZZaldtdnkvd01uN3ptL28zVExBdUkzQTFuc1YwTllsbllRdHB2WTZwUlF0?=
 =?utf-8?B?SFRrb2EwLzZ6Y0hrdzQ1OXl2RGhvM0xKOGlMeEg2UGJReU1ZaTFTZVVEY0lz?=
 =?utf-8?B?VGRTNXJZM0lvMlBEdG10NFFDNWFGZS9jcWgza055ZHZ5WU1sYzg4MDdXRHl1?=
 =?utf-8?B?dy9nL2R5UlhNa21LckRMUnk5SVZJcEU0MFVNNjlZM05DcG9jd3dReCs3NWFq?=
 =?utf-8?B?T3M0ZWdiTXRIeW5pM09sdGl4MzhsMjBkUjdEQy82d1MwN1Zka25jTkZpaHBj?=
 =?utf-8?B?cWpycys1RURFZTFlcmxyTmxKZkp1ZnV1VmZNMlRxczhNeDdETVRJaHBuQkox?=
 =?utf-8?B?dE9vOUlLZkY0Q3c0NExVWHVzcTUxNkNMK2c0L3RHN2hpUHJpTk9IdURRamUy?=
 =?utf-8?B?TUt2QmppZ01NWE1nQitMTG1YUkVLcjNPOER6RUVTbnhXbWY1OXRPQ2ZneStv?=
 =?utf-8?B?WUJBQzZVUEtTMm5IcEVnSlJRYzJ2Ym9Lakd4UE1HSHY3OUFmckJlMDk4b1Va?=
 =?utf-8?B?NGJOZUd5UXNLTUZQU1hzODFaZDVIV0xER2Rsb3Z4aDZTcTdvM2FtcFYydUhX?=
 =?utf-8?B?WXhEazBXK3lHNUwweEdYTEdselkwT2xMTTJXTTJRTUc5cEtuOEwxL1JpZ3Rz?=
 =?utf-8?B?R1Q2WDF4a3NSN3pqcllJL2VrRHNNdWdobExsbDVaOFhBWUlwNlN3YTM4MlU1?=
 =?utf-8?B?Tk9neDZjVFIzbkVscjg1cU1FeE9YT0wzSnJ2RERwVHBDRGNldDlSWS8rQVdR?=
 =?utf-8?B?bHd6WjFCVFlhdGxUQlNBY2V6cW9WWGJyeXhvOHpyY01jQlc5YVRMLzJ4ai80?=
 =?utf-8?B?K0QzajZ0dzdZMHU4ZEtKNVE1QmlzQThMaDZxWW1uNFd5Y0hYNFFYb3FDdmxS?=
 =?utf-8?B?cG5GZkErNzZpLzhiRW1NVjVuZWRONVM4aWwwYnNWMmpGLzlwTUF5QmNZL3Nl?=
 =?utf-8?B?QkhqQnNqWVY3d0NTeENhTFRCSHB6cTc5UWZRbngwdll0Z2lzaGNGM2lUSmJX?=
 =?utf-8?B?ajBYRXhsTC9wWTI2WDdQYUZNTnl4YW95ckpkRmE4bnhUc2VUUlJQODIrRDhR?=
 =?utf-8?B?RjB3cjZNQmNHS3VEN0FZaFNuajZTcmhJbm5wQ2ZrQTZqeGVCMWZIcEhNQnRR?=
 =?utf-8?B?T1hVcG5uNXZNMTBuV3Rwb1ZzSUZiSWZJQzhQNVBlS3pDY1NVUldiOVBPY0FQ?=
 =?utf-8?B?eU1QR3ljUzZWMGlsZUdTdDNPOG5YQmJqRmhORVN6WjBXZlpHZmpDVGVjR3Zl?=
 =?utf-8?B?ZHN6cTZGTnpWR09LeXVhRlYyTUVYcjNqaDkxUXNrbW5RamsrbkRLUW1NY0pn?=
 =?utf-8?B?b2dHMVJyZ0tVeG9yaHZDSFpmcW8zMy9odkRLNGt3OXkycjIybWFEY0pMQXhZ?=
 =?utf-8?B?cVprLzhBY241NzR1ZFJYV3BXb0xWdmpsS0pzbC93REtJSjlzUDJzSndCYSt3?=
 =?utf-8?B?aEFIcFFQQnFad093ZFFkM280ZWxEcWkxZFY1d3dsK0ZKdllTWHM2WnR4YmZo?=
 =?utf-8?B?bFRTSjZlemFMZjBwVG1mU0FmVzNGemtTRUVFdmZzRjY1Y3pOV2NGck1OMkFi?=
 =?utf-8?B?eStOa05LMmVyT0dqTHczZU5UTlREdU5xU1drVDVtZmNOb3V3djQxZ1VJdEIr?=
 =?utf-8?B?MGVsemxWZUk1SmtBbVY0SmNVa2pJcGFuTGE3V0I1S0ZRZmRFM1U4L1g3cDlp?=
 =?utf-8?B?QnZLalkrTTZnSVFrdG1pSjhVeXFkcjVyb1BRRXVGM3NxZ3J6ZkpQZ1pFWmxn?=
 =?utf-8?B?M0J4TCtrcGcvWlNzSlNxeCt5Y1JpWnRKUWx0VjI4OHo2SEpXNGtWTDVicmJW?=
 =?utf-8?B?U1RGM2tXNUZ0Q21hYUhPTUlvQmxRMHh4ZXZHcUtGQ2w0N0s5b0pMRUU0WDV2?=
 =?utf-8?B?RGJjVGlhOXVydzlycWpSN0N1eTRvemtUa0orWEZJVmFwbWdCWTJhRThBcGk4?=
 =?utf-8?B?L0VtdUZUOHJ5NEdXdlNodzFHRTd2UTFDU0szWkxhNFl2U3dXNy9EbGdWaDNH?=
 =?utf-8?B?YjJiSzMzejdybHhJOUcwK1ZwTEZFNjBpVXZJcTF6dlRZVUpMWWlxQ3RzcnRp?=
 =?utf-8?B?N0RPVDMwTFdabjlHRlI1WmpUa2pqSDR1bk50TFcwSVNJT05Fa0I2UnQ1VVdC?=
 =?utf-8?B?clZ0YmVtOUJicTBYOE5EOHl5cVFlVU1RdGZRMkdxS2hnR3RzSkt3SEF6T2RV?=
 =?utf-8?B?RGdnVkZKbXdxTTFXVFZNT1l3U0VOSlRFVkhsWVVNNVg3Q3V3T05oYWR4WU1R?=
 =?utf-8?B?UHIyeW5HNHVTZTBzNTcrVGRXK3lJN1RmWkxvMlBXdW9Gck5vNUZWVnVybXp1?=
 =?utf-8?B?L2U3TkhWOUswbGhoYXY0b3RnQmJaYnJseHdwTk0zWkdxRzNYNWFHK2FQV0JZ?=
 =?utf-8?Q?/C0C668FDspsIpw8=3D?=
X-Exchange-RoutingPolicyChecked: P0Bc7M93iyVI85KZLMY75dZS49XF/zseCXq1yAFsrC/sOdtO0GezWMKLJQ4IS3vH914n6lMWhgq7aEsHtEw2Ecj2nNa1ODTSvyJxwYn1aJ02wtSU9jfHrB/3N6TP2yd8PfAdSru1yPahvlKn3zQLEvC1kf3x7t3ATKzeOkTh/rhC09wbq8mwLwqg5d+YghIRmlb72JihZBfjGMw0JQ6oGz1jW1YIhqWzIhx6IwPmCCjEvFklDWYsuKzYXa1q9eG8qy0LY5AcHhKdjuHuDE2OoLBF6Zb325cAObxQ6UWSiJgVXFIM2D7CLdKr5dVzcsAJHwB/nEzK65tDCqYRnmVRqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bff2bb-ad16-49b3-4778-08deac160938
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 08:52:58.0460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLDXGRnPyGjPYkgBXVqgPr95Is19rHLTjbR5GG37ukAX6iYqvYviXrLt2m6d6XJhUUmV23MattF/uXqZ7LfCN5E9WT+sR++P5Xf8ZroCUjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
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

On 27/02/2026 15:26, Jan Maslak wrote:
> Add a test that verifies the kernel correctly blocks unbind operations
> on VMAs whose VM_BIND ufence has not yet been ACKed by the debugger.
>
> The test performs N vm_bind operations with user fences attached, then
> partially acknowledges them: the first (N-2) ufences are ACKed
> immediately, while the remaining 2 are withheld. It checks that:
> - the ACKed ufences complete successfully,
> - the un-ACKed ufences time out as blocked,
> - unbind attempts on the un-ACKed VMAs are denied with -EBUSY,
> - after the remaining ACKs are delivered, the blocked ufences complete
>    and the unbinds succeed.
>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   tests/intel/xe_eudebug.c | 144 +++++++++++++++++++++++++++++++++------
>   1 file changed, 124 insertions(+), 20 deletions(-)
>
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 134f31766..c899316fb 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -66,6 +66,7 @@ static void test_sysfs_toggle(int fd)
>   #define VM_BIND_DELAY_UFENCE_ACK	(1 << 8)
>   #define VM_BIND_UFENCE_RECONNECT	(1 << 9)
>   #define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 10)
> +#define VM_BIND_UFENCE_NO_ACK		(1 << 11)
>   #define TEST_FAULTABLE			(1 << 30)
>   #define TEST_DISCOVERY			(1 << 31)
>   
> @@ -1924,6 +1925,7 @@ static void test_metadata_attach(int fd, unsigned int flags, int num_clients)
>   }
>   
>   #define STAGE_CLIENT_WAIT_ON_UFENCE_DONE 1337
> +#define STAGE_NO_ACK_READY_FOR_PARTIAL_ACK 1338
>   
>   #define UFENCE_EVENT_COUNT_EXPECTED 4
>   #define UFENCE_EVENT_COUNT_MAX 100
> @@ -1973,6 +1975,72 @@ static void client_wait_ufences(struct xe_eudebug_client *c,
>   	}
>   }
>   
> +#define NO_ACK_HELD_COUNT 2
> +
> +static void client_wait_ufences_no_ack(struct xe_eudebug_client *c,
> +				       int fd, uint32_t vm,
> +				       struct ufence_bind *binds, int count)
> +{
> +	const int64_t short_timeout_ns = 500 * NSEC_PER_MSEC;
> +	const int64_t long_timeout_ns = XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC;
> +	int64_t timeout_ns;
> +	int err;
> +
> +	igt_assert(count >= NO_ACK_HELD_COUNT);
> +
> +	/* Signal debugger that binds are done - it will ACK first (N-2) fences */
> +	xe_eudebug_client_signal_stage(c, STAGE_NO_ACK_READY_FOR_PARTIAL_ACK);
> +
> +	/* First (count - NO_ACK_HELD_COUNT) fences should be ACKed already - expect success */
> +	for (int i = 0; i < count - NO_ACK_HELD_COUNT; i++) {
> +		struct ufence_bind *b = &binds[i];
> +
> +		timeout_ns = long_timeout_ns;
> +		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
> +				       0, &timeout_ns);
> +		igt_assert_eq(err, 0);
> +		igt_assert_eq(b->fence_data->vm_sync, b->f.timeline_value);
> +		igt_debug("no-ack: wait #%d completed (was ACKed)\n", i);
> +	}
> +
> +	/* Last NO_ACK_HELD_COUNT fences should NOT be ACKed yet - expect timeout */
> +	for (int i = count - NO_ACK_HELD_COUNT; i < count; i++) {
> +		struct ufence_bind *b = &binds[i];
> +
> +		timeout_ns = short_timeout_ns;
> +		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
> +				       0, &timeout_ns);
> +		igt_assert_eq(err, -ETIME);
> +		igt_assert_neq(b->fence_data->vm_sync, b->f.timeline_value);
> +		igt_debug("no-ack: wait #%d blocked as expected (not ACKed)\n", i);
> +	}
> +
> +	/* Try to unbind un-ACKed VMAs - kernel should deny with -EBUSY */
> +	for (int i = count - NO_ACK_HELD_COUNT; i < count; i++) {
> +		struct ufence_bind *b = &binds[i];
> +
> +		err = __xe_vm_bind(fd, vm, 0, 0, 0, b->addr, b->range,
> +				   DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
> +		igt_assert_eq(err, -EBUSY);
> +		igt_debug("no-ack: unbind #%d denied with -EBUSY as expected\n", i);
> +	}
> +

Hi Janek,

I would feel much better if I saw that there is two way communication 
between client and debugger/test.

Right now, as I read it, both are running simply in parallel not 
synchronizing actions between (more or less).

This part should generally work even on very busy systems with a lot of 
delay.

> +	/* Signal debugger that we verified the blocked state - it will now send remaining ACKs */
> +	xe_eudebug_client_signal_stage(c, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
> +
> +	/* Now last NO_ACK_HELD_COUNT fences should complete after debugger ACKs them */
> +	for (int i = count - NO_ACK_HELD_COUNT; i < count; i++) {
> +		struct ufence_bind *b = &binds[i];
> +
> +		timeout_ns = long_timeout_ns;
> +		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
> +				       0, &timeout_ns);
> +		igt_assert_eq(err, 0);
> +		igt_assert_eq(b->fence_data->vm_sync, b->f.timeline_value);
> +		igt_debug("no-ack: wait #%d completed after delayed ACK\n", i);
> +	}
> +}
> +

but this part is something I fear may cause sporadic error.

What I would suggest is to add additional stages:

Debugger tells - done with acking ufences 1 and 2

This will synchronize the clients checks with debugger actions.

>   static struct ufence_bind *create_binds_with_ufence(int fd, int count)
>   {
>   	struct ufence_bind *binds;
> @@ -2024,7 +2092,10 @@ static void basic_ufence_client(struct xe_eudebug_client *c)
>   						&b->f, 1, 0);
>   	}
>   
> -	client_wait_ufences(c, fd, binds, n);
> +	if (c->flags & VM_BIND_UFENCE_NO_ACK)
> +		client_wait_ufences_no_ack(c, fd, vm, binds, n);
> +	else
> +		client_wait_ufences(c, fd, binds, n);
>   
>   	for (int i = 0; i < n; i++) {
>   		struct ufence_bind *b = &binds[i];
> @@ -2147,6 +2218,13 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
>    * Functionality: SIGINT
>    * Description:
>    *	Give user fence in application, hold it, send SIGINT to client and check if anything breaks.
> + *
> + * SUBTEST: basic-vm-bind-ufence-no-ack
> + * Functionality: VM bind event
> + * Description:
> + *	Verify that missing debugger ACK for VM_BIND ufence blocks the application.
> + *	ACKs only the first (N-2) ufences immediately, verifies last 2 are blocked,
> + *	then delivers remaining ACKs and confirms client unblocks.
>    */
>   static void test_basic_ufence(int fd, unsigned int flags)
>   {
> @@ -2169,26 +2247,49 @@ static void test_basic_ufence(int fd, unsigned int flags)
>   	xe_eudebug_debugger_start_worker(d);
>   	xe_eudebug_client_start(c);
>   
> -	xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
> -	xe_eudebug_assert_f(d, wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC) == 0,
> -			    "missing ufence events\n");
> -
> -	if (flags & VM_BIND_DELAY_UFENCE_ACK)
> -		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
> -
> -	if (flags & VM_BIND_UFENCE_SIGINT_CLIENT) {
> -		filter = XE_EUDEBUG_FILTER_ALL;
> -		kill(c->pid, SIGINT);
> -		c->pid = 0;
> -		c->done = 1;
> -	} else if (flags & VM_BIND_UFENCE_RECONNECT) {
> -		filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM |
> -				XE_EUDEBUG_FILTER_EVENT_OPEN;
> -		xe_eudebug_debugger_detach(d);
> -		xe_eudebug_client_wait_done(c);
> -		igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
> +	if (flags & VM_BIND_UFENCE_NO_ACK) {
> +		/* Wait for client to signal binds are done */
> +		xe_eudebug_debugger_wait_stage(s, STAGE_NO_ACK_READY_FOR_PARTIAL_ACK);
> +		xe_eudebug_assert_f(d,
> +				    wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC *
> +							   MSEC_PER_SEC) == 0,
> +				    "missing ufence events\n");
> +
> +		/* ACK only first (n-2) fences */
> +		for (int i = 0; i < UFENCE_EVENT_COUNT_EXPECTED - NO_ACK_HELD_COUNT; i++)
> +			xe_eudebug_ack_ufence(d->fd, &priv->ufence_events[i]);
> +

xe_eudebug_debugger_signal_stage(s, STAGE_DBG_UFENCE_ACK_DONE_1);

> +		/* Wait for client to verify blocked state and unbind attempts */
> +		xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
> +
> +		/* ACK remaining fences */
> +		for (int i = UFENCE_EVENT_COUNT_EXPECTED - NO_ACK_HELD_COUNT;
> +		     i < UFENCE_EVENT_COUNT_EXPECTED; i++)
> +			xe_eudebug_ack_ufence(d->fd, &priv->ufence_events[i]);

xe_eudebug_debugger_signal_stage(s, STAGE_DBG_UFENCE_ACK_DONE_2);

>   	} else {
> -		ack_fences(d);
> +		xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
> +		xe_eudebug_assert_f(d,
> +				    wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC *
> +							   MSEC_PER_SEC) == 0,
> +				    "missing ufence events\n");
> +
> +		if (flags & VM_BIND_DELAY_UFENCE_ACK)
> +			sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
> +
> +		if (flags & VM_BIND_UFENCE_SIGINT_CLIENT) {
> +			filter = XE_EUDEBUG_FILTER_ALL;
> +			kill(c->pid, SIGINT);
> +			c->pid = 0;
> +			c->done = 1;
> +		} else if (flags & VM_BIND_UFENCE_RECONNECT) {
> +			filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM |
> +					XE_EUDEBUG_FILTER_EVENT_OPEN;
> +			xe_eudebug_debugger_detach(d);
> +			xe_eudebug_client_wait_done(c);
> +			igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
> +		} else {
> +			ack_fences(d);
> +		}
>   	}
>   
>   	xe_eudebug_client_wait_done(c);
> @@ -2882,6 +2983,9 @@ int igt_main()
>   	igt_subtest("basic-vm-bind-ufence-sigint-client")
>   		test_basic_ufence(fd, VM_BIND_UFENCE_SIGINT_CLIENT);
>   
> +	igt_subtest("basic-vm-bind-ufence-no-ack")
> +		test_basic_ufence(fd, VM_BIND_UFENCE_NO_ACK);
> +
>   	igt_subtest("basic-vm-bind-discovery")
>   		test_basic_discovery(fd, VM_BIND, true);
>   


With that it's done.

Maciej

