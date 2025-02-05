Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADD4C02192
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 17:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC0F10E1F7;
	Wed,  5 Feb 2025 17:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yz3YyhSs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC6710E07E
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 17:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738776478; x=1770312478;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=2946ngOJx0puDXFk+Zsy6U02jycW2wtrsuDwyDgjSFg=;
 b=Yz3YyhSsVen+6cEAU1QhQWRq/TJU69RGSD4hgzWzIL5wMa3bgmXCsQoY
 apvNmkJy1071B0H807pPx2ukyzX/9VLoPqjtSiFa8sTVAgmFokmxxGdAk
 4UGh+nIpDgWtjmlTVsjPPUU4wE8kMFxbqdjJJvCI04j+BF1HEIfkGN5aC
 YjiJzM+1GAB60MitY+7tvfjmmXA5tyIjqmBMI8zs4ypk9hcFbtHwwq9PS
 v6ko7pj6RaXUJevrOLzV4NUUJDj2X5Gne1QIgKeYqw14Emdbh7l4L0ZXq
 FdS1P2pAIKpX3I/I18QkghKoxp4Y8kAhFW4csm4M31mZ+m6orZzcN2j9G w==;
X-CSE-ConnectionGUID: 2DwJuqNBTfSlrxxF7EO7EQ==
X-CSE-MsgGUID: OBK3/dkdQ9Gt3oycqssKMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38586684"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208,217";a="38586684"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 09:27:57 -0800
X-CSE-ConnectionGUID: kNkGRtstQNagabeJCjt2TQ==
X-CSE-MsgGUID: FSFiQSBfSd+HScgiXHpu4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
 d="scan'208,217";a="141844012"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 09:27:56 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 09:27:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 09:27:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 09:27:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ST/Z53iZkNOfnk5ZNZUEJhRFrgsPiAotZU6Ej6TN2fveOHmPV4bG8sJiLoFjgaoylM6hMq+j66RRiS16rkfjnFZ3/wS4C03211VEf+QKv2byLeoTq/66vliiNmFSkwrJfHAXWuuKhNNGOIsRWl2KLAlYdz0mH0TLRF6mp/SGogPGckiAZ/Sczb8aogFekQeUCsid9xHH4TMz6bFuSj8kBISfQa1TkjqUBRrhNMbk3q4+cGKlH4jhcee2s76yzTt1YRkiQiAXXMx54DR3P3NuvFbAMu4fU39tTeZOnGIU4cFf0aNvIQ4AKQmNFFm+V22C7apxIVIvgtegtldYfJIKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOB0o7SSRSVMMmll08QbHVYPvaQMlVw6JSkRhfbHLg8=;
 b=DCZu0jzxbHL9DxoPlJ2VbFhA8YCAQyWf34xtV7dfwJc7fXiEOAl0UdULkYvCxmxTL/doFq5ktqJTXNjcqJpxsQ5wxnr3tfHXmoEJX3mFRL5BL0K2g9D7vmb5+gPbip7wHfV+zO/yMSXH46AXZlDQDiH2sDgJdTSdDej8TJMHkPIUhWhJ0DJ3rXMGTjhJc3sHqkOW1b5wKeTjU+Aj14MrQQmlNSlTq4P6uM8RHjadkpVoIJ+8Zx2bYx9RDIm3BQzmhosJz3i1tfmECps41c7k7RFVlaGjP7N900yWk3DIfJOWtbebtFH0Q2BSzbB/HkpR+V7ikG9napM/2PQ7aKtpCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SN7PR11MB7639.namprd11.prod.outlook.com (2603:10b6:806:32a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Wed, 5 Feb
 2025 17:27:51 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:27:51 +0000
Content-Type: multipart/alternative;
 boundary="------------LBotfySwjqKw4ZJxytn2MerL"
Message-ID: <235efd17-1f82-49c9-addd-7e44ae6cf76b@intel.com>
Date: Wed, 5 Feb 2025 09:27:48 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/int?=
 =?UTF-8?Q?el/xe=5Fpmu=3A_Add_PMU_tests?=
To: <igt-dev@lists.freedesktop.org>
References: <20250205021056.1539902-1-vinay.belgaumkar@intel.com>
 <173875242509.1366620.134334149943466368@b555e5b46a47>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <173875242509.1366620.134334149943466368@b555e5b46a47>
X-ClientProxiedBy: SJ0PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:a03:331::22) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SN7PR11MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc0d1f8-6b20-4af4-8025-08dd460a6a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTJyWDlORzdxUThZcjhRY0RtVUVxd3U4ZEFqTlVDUHh1dWpPcmVLeFI3RlBx?=
 =?utf-8?B?SlJrL2VPWnVqSHR4OFRES0RXcVZlYTF6dE1mcTRjRVQrc0hNYVk0Q1BpeWRu?=
 =?utf-8?B?c2JVb1Fna3RhS05TS0JnT3VZUkRmRXRiT0pMb3N5SWoxWXdwUlE3am1vMlhC?=
 =?utf-8?B?UjBnbnpkaUp0Q1AxSFpCdEpNSGJpb2FKOGN5TWJPZTF6UGZGcTJRWnFINi9W?=
 =?utf-8?B?eXk0aGFEcjFuMFFVNTkzL0FTUzRpc2N3R0J6MGxkaXNrZGtIRmRoRFk5R0Na?=
 =?utf-8?B?aEUwR2c3dmYzSXJ6V1VCSHBkaFRzamx5SzJLM291VXZvZVRhN1BCaC9QSGY5?=
 =?utf-8?B?dnkvay95TmRFK2pib0FCS2tGbFIyL1JiUWhSNkFvK3B5MnRlUXg1eFg4MGgw?=
 =?utf-8?B?cmRhR2tSY2ZycUw1MW9zbCtSeDdhelBRVTdvQSs4VnovTmxmbG9IaVlucVVx?=
 =?utf-8?B?bUdUZUdqc3lZZXExQzlyZ1pUbVJiMmtvMXF0OWwvT3FzYnpiQlFIS0prTXZX?=
 =?utf-8?B?Mlo4Y2liYVlSbGNjbEdybjF0VlhTNDIwRlR2aWlNNWxINlpOdGpuZlZkTk4r?=
 =?utf-8?B?RlJhVjEzNlV1R2hDNlVGdTkreFMzOEtRTndKTktqdFBRaThxbHBTT1B4K2lp?=
 =?utf-8?B?TGNFc0wwWDhGZ1FhcDVzOW84NHpKUjVXblBjNzZtN0ZLZFg3d3liL1RaaERH?=
 =?utf-8?B?NlJkYXlIM2FoeVJXeG4zOTFBVm9wcytZMGJMOUNYcFpaYmlxa2VKQ0YyenNr?=
 =?utf-8?B?L0FBc0NaWkJURitoWnhiRWovL0pSSXBvbmJKOUY2akZvOStnU2MxSjNvaGZy?=
 =?utf-8?B?bms0WmJ6QzNVMnlmNTZPQy9uYnI5SzR4LytmajR6QUsxODlqSmVlWFI0N2JI?=
 =?utf-8?B?TnkvdVBHRE5BZ3htNDBxcUpLa2tUVS9EbEZXanJiL0pzdEtVbWxVOGdmdkdS?=
 =?utf-8?B?TXorc3Z5MXBLNUxja1JTVmFrN0JOL1dMTEVwa3ZQKyt3UVAzbElST1Z5M2pK?=
 =?utf-8?B?Z0FxRi92MGdkSjV6Rno0RTVwbFNzREFUUzhVK0hXRjdRN3ZMVFhhYWJBY3Vm?=
 =?utf-8?B?cFk3SXBGbHpCdGFXN2pvbDBYNDJTTERhcGUxTmxUc1U2Wk5pS05xVzFWdER4?=
 =?utf-8?B?Rlo0anBobzZIK0pjZEdQRVZEelhBTWVSNkg2SEs3ak0ySzRVZ0pwSGxjYjdO?=
 =?utf-8?B?YUEyeC9RVkhpWmU5OU00VFFDRUdsRFhIUjVRQjUxc01kQk5MSkJFazFNSHBa?=
 =?utf-8?B?TVFvWVhIUXJWR0RKcWV6ZExRZVFsU2g1NHFXcWRXMnVaVmNhOVcwbzNBU1JL?=
 =?utf-8?B?Ymo1MGc1RExUNDBzZFRLcHNLcVk0UXMrbVJwUHBrK25xcnZqdFJBWlZpTzJ0?=
 =?utf-8?B?V1p5Mm5QcjRUZjAyRnVodTVlY0lidUhpcERrOEJSaGwxUUpsR3VrbjFkRnVS?=
 =?utf-8?B?T2loTmt2a3IrOHVpaG1DNlFFM1dWYTYrS2szam9IZXZ3WnZ4MUZyclRFNU5O?=
 =?utf-8?B?b3B6TUpJRGVYVGtBREl2QlZJYU1Bb1ZNTHVsMWRINFBpQjVIWXdJcW9iS21B?=
 =?utf-8?B?T0VtV0ZoQTY2bGR6b1JzSnlxNFlUUzFSeks0cTN4QURYTWVPQnF6aVZ6ajEx?=
 =?utf-8?B?U3lBNDZleFY0ckRMcGZIZXBmQjdvdTM3M2trb0QvSzA4Rk4xYlgvVTVqQUdX?=
 =?utf-8?B?TmxkMzNjVzJ5eVdxdHJhMzhlRlVNb0hLZ1hheEdvdFI0dEIzOFdEMThTQzdB?=
 =?utf-8?B?d25pSHN4UTJMNWhBbkNCQlJlcjJYTnVGK3pBdng2aTlxRzhDWGJBU0dZL1NT?=
 =?utf-8?B?Y0kxRk5GSkFKS1pXUGs1Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGNKZC85U0ZyR1hLdEdSNXJMMW0vcnE1RE5pWXNCYXI0Y1NNc0pNSmNKQ1FN?=
 =?utf-8?B?ZnNRNjVlQUFVLzl0Y1dYQXZ0bEN6dmJxZnIxbzZyRWpMVENRaWF4V004N0hx?=
 =?utf-8?B?MlkrN3c1SkFkdVg0WjVNKzJCRFk0dE9PV3NrR1ZiOVlrNFd1Uk5sMjlDUFds?=
 =?utf-8?B?ZkFFTEhvTzZzNGVKWWZLNTExMWpaWlZZS1J0SWwrcUNGU01QV1c2cGxzVEVn?=
 =?utf-8?B?LzlqaklmQkxSeDBHKzRRRVhxSGttZVB4Tnd1elNZd0tZaWNPOWNLZmxyNFVY?=
 =?utf-8?B?RG5xV2FZVUJsdlBDYllRVU1xeFpDMlVncVhnQzNHMGwxb2gwU3BXaXV3N0F1?=
 =?utf-8?B?ajdRbkNpcHZSRkcxMmVrZmxBQThhczZHcDJKcTlxYnNPUGZtNmR1Q3ljSVBt?=
 =?utf-8?B?NWlsVHlFS3JWSUxtZ1VybkVJS0E2dDNOcmV2SEhHSUV4RkNCeDVzL21ZeUdq?=
 =?utf-8?B?ZmkvL1FsTXpBT1cxL2NuSk82bE9ySHR2QzkrNGtWVkRQVkY1N1AwelFMd0VY?=
 =?utf-8?B?SXBUa3FkNXloMzg1Z2FGb1R2NEdmbFppMjB4d3ZmUFlkSGFRMVdSdER1NTFj?=
 =?utf-8?B?a21Yd0JRMUVCVWNlOVpQZUQ0eWVxak16eEhTLy95YmlhUFdQa3J6TEpMT1BR?=
 =?utf-8?B?MnNjWUNIQXo3clBlRk0zVjVQOThBYmpyZWhNK0VidUVjL2pNc1RvNXcyMUZl?=
 =?utf-8?B?dUdIMmg0NFhUblJqR0RtVDZPd1B4KzZGM1ZKVGM5d3p0UnJiSXd1eHNyZ2d2?=
 =?utf-8?B?YTRaN0FoVXp1M0gxK0JhRm1XejRBeFQ3S0hPTGF5cFJsditCQ3p1cGRWa2E4?=
 =?utf-8?B?ai83WDQ2QVBQMkh1MFBzZ3VTbVJ4ZEhrdGdlc20yaloybzNOVkl0Wmk1MWJM?=
 =?utf-8?B?VUxCeDlhNG54WXN6SDYrdVhBWStGcERlSWV0QlFpYmQ0MG05M0VGYTRQVTBm?=
 =?utf-8?B?OXB0UitFMCtJRXIvTDlKbEVoblI3bWRSSHVPZ2RqUGVQalI3L2hDODFGWVpj?=
 =?utf-8?B?ZXRYOTh2c1p5KzMvSlV0Vnc3Z214RUMrcStTZk96OWJqdlp4aUo4dG1VYkEv?=
 =?utf-8?B?YmFHcXY0OEFwY0dNdmhMeXkzTmF4S3ExQnB1UXpJdlFkS2JabGZtVUZYMkg3?=
 =?utf-8?B?blZSU241RS9Ma25jQStMbHk5N05xV0x4Rlp2a0NRVCtaTmx0ZjU2SWluZThx?=
 =?utf-8?B?VFhtWjh0R2o1dlA1anhaQXUxY3p2NzNWZ1JJRGpyRTlzcTNJQzJqLzVYMVo3?=
 =?utf-8?B?RG9CckpnQ3QyK3VWelplRitXTy9nSG1ReitzQUxXQnVnN09RdlJYSVRBZjdV?=
 =?utf-8?B?N3QrbzhkMGZzWFdQRWFUYkg4WjhqODgwOGNmbXloemJlQ3dNL3hnMjRGV0Jy?=
 =?utf-8?B?VXBQSjhrZVVudDJ1OHRnMWZ2TUozb1BvTUxpeEJ3Y2NrZ09FTlVBRVM3dGhv?=
 =?utf-8?B?SGRJWnBrRnlvVU4xSUFYczViRFVHOXZDNm5LajBEc2N0bFQ5OUhFYjBDdDJ5?=
 =?utf-8?B?SWJDRFlzYUJXWStTQVZ0SnBJQlNvNVRPY3U0QVkwcTltazlJa01rU3E3dmNu?=
 =?utf-8?B?a082ZUM2N0dkblUwMmxHZ2ZZNi8wUEZEblFubTV5emFpZDhhT2JVais3Rjhp?=
 =?utf-8?B?SVVzS1FpWWJjeHZzQjZuekN5bU51Wi9DYXdZVGpXSjBRWlh1c0RlblNOb29j?=
 =?utf-8?B?QzNOM29GVWtVVFF0SmJLMXE5SDNWY0ZoSjZCWVMwSE1sM21QTEJQbDNVN2ZX?=
 =?utf-8?B?LzRpMTZiY1lEdURWTG9BTlliU3BEcnRrUG1ZUHdjcHZYZEIvK00yVWRzalJi?=
 =?utf-8?B?Y2RHUzZnS052TGhSVmF3Vm83LzFJaDJ4OFRGNHVqMDZoK0lqaG41RE1JTDRl?=
 =?utf-8?B?VUNMV3VFM0NKb1RiMnpYNzRpK3l5RkhLYUs4UzhoUm5pYlNpZ3crUndoL1Fo?=
 =?utf-8?B?MmprU09RTDE5YzJYQUtHdFFOU2FJaXZWVkMrWStkcndxYnlsZkVZRVNLckov?=
 =?utf-8?B?V0hza3RySG9aUVB4UjB6NDk2bU9lVFE4bElzbW5wWk5mSVRPRGhLamd5dHFN?=
 =?utf-8?B?aG1KcEpEMmtJcWV6OWFZNnp5ZURFZXFha0d5QllPNGVYcnNiY2xDQlRObU5u?=
 =?utf-8?B?dnhtL3orUlA5aUJOMXJabnRYRnhvempDY0NDbUlHZjI0WEJoTGhJTGQxMS9x?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc0d1f8-6b20-4af4-8025-08dd460a6a64
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:27:50.9075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rG6C1dQJ1sUVFwcLnY5eDOLSieDiIwHi40yWjW2WjGu0+sJ8bt1bWM37FDMLnLtGX0YtcMl+PN+/grUa5nEX4Pwug6Egixud6WItkg+0oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7639
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

--------------LBotfySwjqKw4ZJxytn2MerL
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 2/5/2025 2:47 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_pmu: Add PMU tests
> *URL:* 	https://patchwork.freedesktop.org/series/144348/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/index.html
>
>
>   CI Bug Log - changes from CI_DRM_16066_full -> IGTPW_12544_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_12544_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_12544_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/index.html
>
>
>     Participating hosts (11 -> 11)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_12544_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@kms_vblank@ts-continuation-suspend.html>
>  *
>
>     igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html>
>  *
>
>     igt@perf_pmu@semaphore-busy@bcs0:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-7/igt@perf_pmu@semaphore-busy@bcs0.html>
>         +5 other tests fail
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk2/igt@perf_pmu@semaphore-busy@bcs0.html>
>         +4 other tests fail
>
One more place in perf_pmu needs to be updated where measured_sleep() is 
used.

Thanks,

Vinay.

>  *
>
>  *
>
>     igt@perf_pmu@semaphore-busy@rcs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-mtlp-3/igt@perf_pmu@semaphore-busy@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@perf_pmu@semaphore-busy@rcs0.html>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-11/igt@perf_pmu@semaphore-busy@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-8/igt@perf_pmu@semaphore-busy@rcs0.html>
>         +7 other tests fail
>  *
>
>     igt@perf_pmu@semaphore-busy@vcs0:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-3/igt@perf_pmu@semaphore-busy@vcs0.html>
>         +4 other tests fail
>  *
>
>     igt@perf_pmu@semaphore-busy@vcs1:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@perf_pmu@semaphore-busy@vcs1.html>
>         +5 other tests fail
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_16066_full and 
> IGTPW_12544_full:
>
>
>       New IGT tests (4)
>
>  *
>
>     igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-dp-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.71] s
>  *
>
>     igt@kms_plane_cursor@primary@pipe-a-dp-3-size-128:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.48] s
>  *
>
>     igt@kms_plane_cursor@primary@pipe-a-dp-3-size-256:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.43] s
>  *
>
>     igt@kms_plane_cursor@primary@pipe-a-dp-3-size-64:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [3.40] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_12544_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@api_intel_bb@blit-reloc-purge-cache:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html>
>         ([i915#8411]) +2 other tests skip
>  *
>
>     igt@api_intel_bb@crc32:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@api_intel_bb@crc32.html>
>         ([i915#6230])
>  *
>
>     igt@api_intel_bb@object-reloc-purge-cache:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@api_intel_bb@object-reloc-purge-cache.html>
>         ([i915#8411])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@api_intel_bb@object-reloc-purge-cache.html>
>         ([i915#8411])
>  *
>
>     igt@device_reset@unbind-cold-reset-rebind:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html>
>         ([i915#11078])
>  *
>
>     igt@device_reset@unbind-reset-rebind:
>
>       o shard-dg1: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@device_reset@unbind-reset-rebind.html>
>         ([i915#11814] / [i915#11815] / [i915#9413])
>  *
>
>     igt@drm_fdinfo@all-busy-idle-check-all:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@drm_fdinfo@all-busy-idle-check-all.html>
>         ([i915#8414])
>  *
>
>     igt@drm_fdinfo@busy-idle@vecs0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@drm_fdinfo@busy-idle@vecs0.html>
>         ([i915#8414]) +6 other tests skip
>  *
>
>     igt@drm_fdinfo@isolation@vecs0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@drm_fdinfo@isolation@vecs0.html>
>         ([i915#8414]) +18 other tests skip
>  *
>
>     igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html>
>         ([i915#8414]) +15 other tests skip
>  *
>
>     igt@gem_basic@multigpu-create-close:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@gem_basic@multigpu-create-close.html>
>         ([i915#7697]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@gem_basic@multigpu-create-close.html>
>         ([i915#7697]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-2/igt@gem_basic@multigpu-create-close.html>
>         ([i915#7697])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@gem_basic@multigpu-create-close.html>
>         ([i915#7697]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@gem_basic@multigpu-create-close.html>
>         ([i915#7697])
>  *
>
>     igt@gem_caching@writes:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-rkl-3/igt@gem_caching@writes.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@gem_caching@writes.html>
>         ([i915#12917] / [i915#12964])
>  *
>
>     igt@gem_ccs@block-copy-compressed:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@gem_ccs@block-copy-compressed.html>
>         ([i915#3555] / [i915#9323])
>  *
>
>     igt@gem_ccs@block-multicopy-compressed:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html>
>         ([i915#9323])
>  *
>
>     igt@gem_ccs@ctrl-surf-copy:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-7/igt@gem_ccs@ctrl-surf-copy.html>
>         ([i915#3555] / [i915#9323]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html>
>         ([i915#3555] / [i915#9323])
>  *
>
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         ([i915#9323])
>  *
>
>     igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html>
>         ([i915#7297])
>  *
>
>     igt@gem_create@create-ext-cpu-access-sanity-check:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>         ([i915#6335]) +1 other test skip
>  *
>
>     igt@gem_create@create-ext-set-pat:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_create@create-ext-set-pat.html>
>         ([i915#8562])
>  *
>
>     igt@gem_ctx_exec@basic-norecovery:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-mtlp-8/igt@gem_ctx_exec@basic-norecovery.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-7/igt@gem_ctx_exec@basic-norecovery.html>
>         ([i915#13193])
>  *
>
>     igt@gem_ctx_persistence@heartbeat-close:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html>
>         ([i915#8555])
>  *
>
>     igt@gem_ctx_persistence@heartbeat-many:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-many.html>
>         ([i915#8555])
>  *
>
>     igt@gem_ctx_persistence@processes:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-snb1/igt@gem_ctx_persistence@processes.html>
>         ([i915#1099]) +5 other tests skip
>  *
>
>     igt@gem_ctx_sseu@engines:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@gem_ctx_sseu@engines.html>
>         ([i915#280])
>  *
>
>     igt@gem_eio@hibernate:
>
>       o shard-dg2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-1/igt@gem_eio@hibernate.html>
>         ([i915#7975])
>  *
>
>     igt@gem_eio@reset-stress:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg1-13/igt@gem_eio@reset-stress.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_eio@reset-stress.html>
>         ([i915#12543] / [i915#5784])
>  *
>
>     igt@gem_exec_balancer@bonded-semaphore:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@gem_exec_balancer@bonded-semaphore.html>
>         ([i915#4812]) +5 other tests skip
>  *
>
>     igt@gem_exec_balancer@bonded-true-hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@gem_exec_balancer@bonded-true-hang.html>
>         ([i915#4812])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@gem_exec_balancer@bonded-true-hang.html>
>         ([i915#4812])
>  *
>
>     igt@gem_exec_balancer@invalid-bonds:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@gem_exec_balancer@invalid-bonds.html>
>         ([i915#4036])
>  *
>
>     igt@gem_exec_balancer@parallel-balancer:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html>
>         ([i915#4525]) +2 other tests skip
>  *
>
>     igt@gem_exec_balancer@parallel-bb-first:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html>
>         ([i915#4525])
>  *
>
>     igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-10/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html>
>         ([i915#4525])
>  *
>
>     igt@gem_exec_capture@capture:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-8/igt@gem_exec_capture@capture.html>
>         ([i915#11965]) +1 other test fail
>  *
>
>     igt@gem_exec_capture@capture-invisible:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@gem_exec_capture@capture-invisible.html>
>         ([i915#6334]) +2 other tests skip
>  *
>
>     igt@gem_exec_capture@capture-recoverable:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html>
>         ([i915#6344])
>  *
>
>     igt@gem_exec_capture@capture@vecs0-lmem0:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-3/igt@gem_exec_capture@capture@vecs0-lmem0.html>
>         ([i915#11965]) +4 other tests fail
>  *
>
>     igt@gem_exec_flush@basic-uc-prw-default:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_exec_flush@basic-uc-prw-default.html>
>         ([i915#3539])
>  *
>
>     igt@gem_exec_flush@basic-uc-rw-default:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_exec_flush@basic-uc-rw-default.html>
>         ([i915#3539] / [i915#4852])
>  *
>
>     igt@gem_exec_flush@basic-wb-prw-default:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_exec_flush@basic-wb-prw-default.html>
>         ([i915#3539] / [i915#4852]) +1 other test skip
>  *
>
>     igt@gem_exec_flush@basic-wb-ro-before-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-2/igt@gem_exec_flush@basic-wb-ro-before-default.html>
>         ([i915#3539] / [i915#4852])
>  *
>
>     igt@gem_exec_params@rsvd2-dirt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@gem_exec_params@rsvd2-dirt.html>
>         ([i915#5107])
>  *
>
>     igt@gem_exec_reloc@basic-cpu-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@gem_exec_reloc@basic-cpu-gtt.html>
>         ([i915#3281]) +6 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-cpu-read-noreloc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-read-noreloc.html>
>         ([i915#3281]) +8 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-wc:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_exec_reloc@basic-gtt-wc.html>
>         ([i915#3281]) +1 other test skip
>  *
>
>     igt@gem_exec_reloc@basic-scanout:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@gem_exec_reloc@basic-scanout.html>
>         ([i915#3281]) +13 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-cpu-active:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@gem_exec_reloc@basic-write-cpu-active.html>
>         ([i915#3281]) +6 other tests skip
>  *
>
>     igt@gem_exec_schedule@preempt-queue-contexts:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html>
>         ([i915#4537] / [i915#4812])
>  *
>
>     igt@gem_exec_schedule@preempt-queue-contexts-chain:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html>
>         ([i915#4537] / [i915#4812]) +1 other test skip
>  *
>
>     igt@gem_exec_schedule@semaphore-power:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@gem_exec_schedule@semaphore-power.html>
>         ([i915#7276])
>  *
>
>     igt@gem_exec_suspend@basic-s4-devices:
>
>       o shard-dg2-9: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_exec_suspend@basic-s4-devices.html>
>         ([i915#7975]) +1 other test abort
>  *
>
>     igt@gem_fence_thrash@bo-write-verify-none:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-none.html>
>         ([i915#4860]) +1 other test skip
>  *
>
>     igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html>
>         ([i915#4860])
>  *
>
>     igt@gem_fenced_exec_thrash@too-many-fences:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@gem_fenced_exec_thrash@too-many-fences.html>
>         ([i915#4860])
>  *
>
>     igt@gem_huc_copy@huc-copy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@gem_huc_copy@huc-copy.html>
>         ([i915#2190])
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html>
>         ([i915#4613]) +1 other test skip
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         ([i915#4613]) +5 other tests skip
>  *
>
>     igt@gem_lmem_swapping@smem-oom@lmem0:
>
>       o shard-dg1: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>         ([i915#5493]) +1 other test timeout
>  *
>
>     igt@gem_lmem_swapping@verify-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-8/igt@gem_lmem_swapping@verify-ccs.html>
>         ([i915#4613]) +5 other tests skip
>  *
>
>     igt@gem_lmem_swapping@verify-random-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html>
>         ([i915#12193])
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk9/igt@gem_lmem_swapping@verify-random-ccs.html>
>         ([i915#4613]) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@gem_lmem_swapping@verify-random-ccs.html>
>         ([i915#4613]) +2 other tests skip
>  *
>
>     igt@gem_lmem_swapping@verify-random-ccs@lmem0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html>
>         ([i915#4565])
>  *
>
>     igt@gem_media_vme:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@gem_media_vme.html>
>         ([i915#284])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@gem_media_vme.html>
>         ([i915#284])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@gem_media_vme.html>
>         ([i915#284])
>  *
>
>     igt@gem_mmap@big-bo:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@gem_mmap@big-bo.html>
>         ([i915#4083]) +2 other tests skip
>  *
>
>     igt@gem_mmap_gtt@basic-short:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@gem_mmap_gtt@basic-short.html>
>         ([i915#4077]) +14 other tests skip
>  *
>
>     igt@gem_mmap_gtt@cpuset-big-copy-odd:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html>
>         ([i915#4077]) +12 other tests skip
>  *
>
>     igt@gem_mmap_offset@clear:
>
>       o shard-rkl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@gem_mmap_offset@clear.html>
>         ([i915#12964]) +19 other tests dmesg-warn
>  *
>
>     igt@gem_mmap_wc@bad-object:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_mmap_wc@bad-object.html>
>         ([i915#4083]) +1 other test skip
>  *
>
>     igt@gem_mmap_wc@copy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@gem_mmap_wc@copy.html>
>         ([i915#4083]) +3 other tests skip
>  *
>
>     igt@gem_mmap_wc@write-read:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@gem_mmap_wc@write-read.html>
>         ([i915#4083]) +7 other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@reads-display:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_partial_pwrite_pread@reads-display.html>
>         ([i915#3282]) +1 other test skip
>  *
>
>     igt@gem_pread@exhaustion:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_pread@exhaustion.html>
>         ([i915#3282]) +6 other tests skip
>       o shard-tglu: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-6/igt@gem_pread@exhaustion.html>
>         ([i915#2658])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-7/igt@gem_pread@exhaustion.html>
>         ([i915#3282]) +3 other tests skip
>  *
>
>     igt@gem_pread@snoop:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-2/igt@gem_pread@snoop.html>
>         ([i915#3282]) +3 other tests skip
>  *
>
>     igt@gem_pwrite_snooped:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-1/igt@gem_pwrite_snooped.html>
>         ([i915#3282]) +8 other tests skip
>  *
>
>     igt@gem_pxp@create-protected-buffer:
>
>       o shard-rkl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@gem_pxp@create-protected-buffer.html>
>         ([i915#12964])
>  *
>
>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html>
>         ([i915#4270]) +2 other tests skip
>  *
>
>     igt@gem_pxp@hw-rejects-pxp-buffer:
>
>       o shard-rkl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-buffer.html>
>         ([i915#12917] / [i915#12964]) +3 other tests timeout
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-off-2:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@gem_pxp@reject-modify-context-protection-off-2.html>
>         ([i915#4270]) +2 other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html>
>         ([i915#5190] / [i915#8428]) +2 other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-1/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html>
>         ([i915#5190] / [i915#8428]) +4 other tests skip
>  *
>
>     igt@gem_render_copy@yf-tiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@gem_render_copy@yf-tiled.html>
>         ([i915#8428]) +4 other tests skip
>  *
>
>     igt@gem_render_tiled_blits@basic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@gem_render_tiled_blits@basic.html>
>         ([i915#4079])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-5/igt@gem_render_tiled_blits@basic.html>
>         ([i915#4079])
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         ([i915#8411])
>  *
>
>     igt@gem_softpin@noreloc-s3:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk7/igt@gem_softpin@noreloc-s3.html>
>         ([i915#13306])
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-rkl-1/igt@gem_softpin@noreloc-s3.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-1/igt@gem_softpin@noreloc-s3.html>
>         ([i915#12964])
>  *
>
>     igt@gem_tiled_pread_pwrite:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@gem_tiled_pread_pwrite.html>
>         ([i915#4079]) +2 other tests skip
>  *
>
>     igt@gem_userptr_blits@coherency-unsync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@gem_userptr_blits@coherency-unsync.html>
>         ([i915#3297])
>  *
>
>     igt@gem_userptr_blits@map-fixed-invalidate:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate.html>
>         ([i915#3297] / [i915#4880]) +1 other test skip
>  *
>
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html>
>         ([i915#3297] / [i915#4880])
>  *
>
>     igt@gem_userptr_blits@relocations:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@gem_userptr_blits@relocations.html>
>         ([i915#3281] / [i915#3297])
>  *
>
>     igt@gem_userptr_blits@set-cache-level:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@gem_userptr_blits@set-cache-level.html>
>         ([i915#3297]) +2 other tests skip
>  *
>
>     igt@gem_userptr_blits@unsync-unmap:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap.html>
>         ([i915#3297]) +1 other test skip
>  *
>
>     igt@gem_userptr_blits@unsync-unmap-after-close:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html>
>         ([i915#3297]) +1 other test skip
>  *
>
>     igt@gem_userptr_blits@unsync-unmap-cycles:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         ([i915#3297]) +3 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         ([i915#3297]) +2 other tests skip
>  *
>
>     igt@gem_vm_create@invalid-create:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-snb7/igt@gem_vm_create@invalid-create.html>
>         +415 other tests skip
>  *
>
>     igt@gem_workarounds@suspend-resume-fd:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-glk4/igt@gem_workarounds@suspend-resume-fd.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk2/igt@gem_workarounds@suspend-resume-fd.html>
>         ([i915#13356])
>  *
>
>     igt@gen3_render_linear_blits:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-5/igt@gen3_render_linear_blits.html>
>         +5 other tests skip
>  *
>
>     igt@gen9_exec_parse@allowed-all:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-8/igt@gen9_exec_parse@allowed-all.html>
>         ([i915#2856]) +2 other tests skip
>  *
>
>     igt@gen9_exec_parse@basic-rejected-ctx-param:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html>
>         ([i915#2527] / [i915#2856]) +4 other tests skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html>
>         ([i915#2856]) +1 other test skip
>  *
>
>     igt@gen9_exec_parse@bb-chained:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gen9_exec_parse@bb-chained.html>
>         ([i915#2856])
>  *
>
>     igt@gen9_exec_parse@bb-start-cmd:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@gen9_exec_parse@bb-start-cmd.html>
>         ([i915#2527]) +3 other tests skip
>  *
>
>     igt@gen9_exec_parse@bb-start-far:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@gen9_exec_parse@bb-start-far.html>
>         ([i915#2527] / [i915#2856])
>  *
>
>     igt@gen9_exec_parse@bb-start-out:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@gen9_exec_parse@bb-start-out.html>
>         ([i915#2527]) +4 other tests skip
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#10887] / [i915#12817] / [i915#9820])
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-glk7/igt@i915_module_load@reload-with-fault-injection.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk2/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#9820])
>  *
>
>     igt@i915_module_load@resize-bar:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@i915_module_load@resize-bar.html>
>         ([i915#7178])
>  *
>
>     igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>
>         ([i915#7091])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>
>         ([i915#8436])
>  *
>
>     igt@i915_pm_freq_api@freq-basic-api:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html>
>         ([i915#8399])
>  *
>
>     igt@i915_pm_freq_mult@media-freq@gt0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-1/igt@i915_pm_freq_mult@media-freq@gt0.html>
>         ([i915#6590]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-5/igt@i915_pm_freq_mult@media-freq@gt0.html>
>         ([i915#6590]) +1 other test skip
>  *
>
>     igt@i915_pm_rpm@system-suspend-execbuf:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         ([i915#12797])
>  *
>
>     igt@i915_pm_rps@min-max-config-idle:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@i915_pm_rps@min-max-config-idle.html>
>         ([i915#11681] / [i915#6621])
>  *
>
>     igt@i915_pm_rps@thresholds-idle-park:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@i915_pm_rps@thresholds-idle-park.html>
>         ([i915#11681])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle-park.html>
>         ([i915#11681])
>  *
>
>     igt@i915_pm_rps@thresholds-park:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@i915_pm_rps@thresholds-park.html>
>         ([i915#11681]) +1 other test skip
>  *
>
>     igt@i915_query@hwconfig_table:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-1/igt@i915_query@hwconfig_table.html>
>         ([i915#6245])
>  *
>
>     igt@i915_query@test-query-geometry-subslices:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-3/igt@i915_query@test-query-geometry-subslices.html>
>         ([i915#5723])
>  *
>
>     igt@i915_selftest@mock:
>
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk2/igt@i915_selftest@mock.html>
>         ([i915#1982] / [i915#9311])
>  *
>
>     igt@i915_selftest@mock@memory_region:
>
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk2/igt@i915_selftest@mock@memory_region.html>
>         ([i915#9311])
>  *
>
>     igt@i915_suspend@debugfs-reader:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk3/igt@i915_suspend@debugfs-reader.html>
>         ([i915#4817])
>  *
>
>     igt@i915_suspend@sysfs-reader:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-glk9/igt@i915_suspend@sysfs-reader.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk6/igt@i915_suspend@sysfs-reader.html>
>         ([i915#4817])
>  *
>
>     igt@intel_hwmon@hwmon-read:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@intel_hwmon@hwmon-read.html>
>         ([i915#7707])
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@intel_hwmon@hwmon-write.html>
>         ([i915#7707])
>  *
>
>     igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html>
>         ([i915#4212])
>  *
>
>     igt@kms_addfb_basic@tile-pitch-mismatch:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_addfb_basic@tile-pitch-mismatch.html>
>         ([i915#4212]) +2 other tests skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html>
>         ([i915#8709]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html>
>         ([i915#8709]) +3 other tests skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html>
>         ([i915#8709]) +7 other tests skip
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_async_flips@invalid-async-flip.html>
>         ([i915#12967] / [i915#6228])
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_async_flips@invalid-async-flip-atomic.html>
>         ([i915#12967])
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         ([i915#9531])
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         ([i915#1769] / [i915#3555])
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         ([i915#1769] / [i915#3555])
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_atomic_transition@plane-toggle-modeset-transition.html>
>         ([i915#5956])
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-3:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-3.html>
>         ([i915#5956])
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         ([i915#4538] / [i915#5286]) +8 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         ([i915#5286]) +11 other tests skip
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         ([i915#5138])
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html>
>         ([i915#5286]) +9 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         ([i915#5286]) +2 other tests skip
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-270:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-270:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_big_fb@linear-64bpp-rotate-270.html>
>         +19 other tests skip
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-90:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>         ([i915#3638]) +4 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         ([i915#3638]) +2 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg1-13/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html>
>         ([i915#4423])
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         ([i915#4538] / [i915#5190]) +7 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html>
>         ([i915#4538]) +9 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html>
>         ([i915#4538] / [i915#5190]) +1 other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         ([i915#5190]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         ([i915#6187]) +1 other test skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html>
>         ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         ([i915#12313])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         ([i915#12313])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         ([i915#12313]) +1 other test skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html>
>         ([i915#10307] / [i915#6095]) +9 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3.html>
>         ([i915#6095]) +126 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html>
>         ([i915#10307] / [i915#6095]) +191 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-3/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1.html>
>         ([i915#6095]) +84 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html>
>         ([i915#12313]) +1 other test skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         ([i915#12313])
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         ([i915#12805])
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html>
>         ([i915#6095]) +111 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-2:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-2.html>
>         ([i915#6095]) +4 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html>
>         ([i915#6095]) +11 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-glk9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html>
>         ([i915#12796])
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html>
>         ([i915#6095]) +24 other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html>
>         ([i915#6095]) +49 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html>
>         ([i915#12313])
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         ([i915#12313])
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html>
>         +298 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_cdclk@mode-transition.html>
>         ([i915#3742])
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html>
>         ([i915#4087]) +4 other tests skip
>  *
>
>     igt@kms_chamelium_audio@dp-audio-edid:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-5/igt@kms_chamelium_audio@dp-audio-edid.html>
>         ([i915#11151] / [i915#7828]) +6 other tests skip
>  *
>
>     igt@kms_chamelium_frames@dp-crc-single:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@kms_chamelium_frames@dp-crc-single.html>
>         ([i915#11151] / [i915#7828]) +3 other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-multiple:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html>
>         ([i915#11151] / [i915#7828]) +2 other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-single:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@kms_chamelium_frames@hdmi-crc-single.html>
>         ([i915#11151] / [i915#7828]) +8 other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-frame-dump:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_chamelium_frames@hdmi-frame-dump.html>
>         ([i915#11151] / [i915#7828]) +7 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@common-hpd-after-suspend:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_chamelium_hpd@common-hpd-after-suspend.html>
>         ([i915#11151] / [i915#7828]) +2 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html>
>         ([i915#11151] / [i915#7828]) +4 other tests skip
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_content_protection@atomic.html>
>         ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1
>         other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@kms_content_protection@atomic.html>
>         ([i915#7116] / [i915#9424])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_content_protection@atomic.html>
>         ([i915#7118] / [i915#9424])
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_content_protection@atomic-dpms.html>
>         ([i915#7118] / [i915#9424])
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@kms_content_protection@dp-mst-type-0.html>
>         ([i915#3299])
>  *
>
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html>
>         ([i915#7173]) +1 other test timeout
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_content_protection@lic-type-1.html>
>         ([i915#6944] / [i915#9424]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-3/igt@kms_content_protection@lic-type-1.html>
>         ([i915#9424])
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_content_protection@mei-interface.html>
>         ([i915#9424]) +2 other tests skip
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_content_protection@srm.html>
>         ([i915#7118])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-4/igt@kms_content_protection@srm.html>
>         ([i915#6944] / [i915#7116] / [i915#7118])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_content_protection@srm.html>
>         ([i915#6944])
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html>
>         ([i915#13566]) +1 other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html>
>         ([i915#13566]) +3 other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         ([i915#13049]) +1 other test skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         ([i915#13049])
>  *
>
>     igt@kms_cursor_crc@cursor-random-256x85:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x85.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85.html>
>         ([i915#13566])
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html>
>         ([i915#13049]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x170.html>
>         ([i915#13049])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_cursor_crc@cursor-random-512x170.html>
>         ([i915#13049])
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-4/igt@kms_cursor_crc@cursor-random-512x512.html>
>         ([i915#13049])
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-256x85:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html>
>         ([i915#8814]) +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html>
>         ([i915#3555]) +4 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html>
>         ([i915#3555] / [i915#8814]) +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-128x42:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-128x42.html>
>         ([i915#13566]) +1 other test fail
>  *
>
>     igt@kms_cursor_edge_walk@64x64-top-bottom:
>
>       o shard-dg1: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@kms_cursor_edge_walk@64x64-top-bottom.html>
>         ([i915#4423]) +1 other test dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         ([i915#9809]) +4 other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         ([i915#13046] / [i915#5354])
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         ([i915#4103])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         ([i915#4103]) +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html>
>         ([i915#13046] / [i915#5354]) +3 other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         +98 other tests skip
>  *
>
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html>
>         ([i915#9067])
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         ([i915#4103])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         ([i915#4103] / [i915#4213])
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         ([i915#4213]) +2 other tests skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         ([i915#4103] / [i915#4213]) +1 other test skip
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         ([i915#9833])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         ([i915#9723])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         ([i915#9833])
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         ([i915#9723]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         ([i915#9723]) +1 other test skip
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         ([i915#3555])
>  *
>
>     igt@kms_dp_aux_dev:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@kms_dp_aux_dev.html>
>         ([i915#1257])
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         ([i915#12402])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         ([i915#12402])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-2/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         ([i915#12402])
>  *
>
>     igt@kms_draw_crc@draw-method-mmap-wc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-wc.html>
>         ([i915#8812])
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-6/igt@kms_dsc@dsc-with-bpc.html>
>         ([i915#3555] / [i915#3840]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_dsc@dsc-with-bpc.html>
>         ([i915#3555] / [i915#3840])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-8/igt@kms_dsc@dsc-with-bpc.html>
>         ([i915#3555] / [i915#3840])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_dsc@dsc-with-bpc.html>
>         ([i915#3555] / [i915#3840])
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_dsc@dsc-with-bpc-formats.html>
>         ([i915#3555] / [i915#3840])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@kms_dsc@dsc-with-bpc-formats.html>
>         ([i915#3555] / [i915#3840]) +1 other test skip
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html>
>         ([i915#3555] / [i915#3840])
>  *
>
>     igt@kms_fbcon_fbt@psr:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-4/igt@kms_fbcon_fbt@psr.html>
>         ([i915#3469])
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html>
>         ([i915#3955])
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_fbcon_fbt@psr-suspend.html>
>         ([i915#3469])
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_feature_discovery@display-2x.html>
>         ([i915#1839])
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_feature_discovery@display-2x.html>
>         ([i915#1839])
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-4/igt@kms_feature_discovery@display-4x.html>
>         ([i915#1839]) +1 other test skip
>  *
>
>     igt@kms_feature_discovery@psr1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-10/igt@kms_feature_discovery@psr1.html>
>         ([i915#658])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_feature_discovery@psr1.html>
>         ([i915#658])
>  *
>
>     igt@kms_fence_pin_leak:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_fence_pin_leak.html>
>         ([i915#4881])
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html>
>         ([i915#3637]) +6 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html>
>         ([i915#9934]) +2 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-fences-interruptible:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>         ([i915#8381])
>  *
>
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         ([i915#9934]) +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         ([i915#9934]) +6 other tests skip
>  *
>
>     igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html>
>         ([i915#3637]) +5 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@kms_flip@2x-plain-flip.html>
>         ([i915#9934]) +9 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-snb5/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-snb1/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>         ([i915#11989]) +3 other tests fail
>  *
>
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         ([i915#3637]) +6 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-tglu-10/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html>
>         ([i915#11989]) +3 other tests fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html>
>         ([i915#13027]) +1 other test fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html>
>         ([i915#13027]) +1 other test fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
>
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html>
>         ([i915#118]) +1 other test dmesg-warn
>  *
>
>     igt@kms_flip@flip-vs-fences:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_flip@flip-vs-fences.html>
>         ([i915#8381])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-8/igt@kms_flip@flip-vs-fences.html>
>         ([i915#8381])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_flip@flip-vs-fences.html>
>         ([i915#8381])
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@a-edp1:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-mtlp-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html>
>         ([i915#11989]) +1 other test fail
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html>
>         ([i915#11989]) +2 other tests fail
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1.html>
>         ([i915#11989]) +4 other tests fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html>
>         ([i915#2672] / [i915#3555]) +5 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +5 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html>
>         ([i915#3555] / [i915#8810]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html>
>         ([i915#2672] / [i915#3555]) +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html>
>         ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html>
>         ([i915#2672] / [i915#8813]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672]) +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html>
>         ([i915#2587] / [i915#2672] / [i915#3555])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html>
>         ([i915#3555] / [i915#8810] / [i915#8813]) +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html>
>         ([i915#8810])
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html>
>         ([i915#2672] / [i915#3555]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html>
>         ([i915#2672] / [i915#3555]) +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672]) +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html>
>         ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html>
>         ([i915#5354]) +4 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         ([i915#8708]) +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html>
>         ([i915#8708]) +5 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         ([i915#6880])
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         ([i915#8708]) +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html>
>         ([i915#3458]) +4 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html>
>         +39 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         +57 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html>
>         +38 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html>
>         ([i915#5354]) +25 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>         ([i915#1825]) +57 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         ([i915#5439])
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         ([i915#10055])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         ([i915#10055])
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html>
>         ([i915#3458]) +20 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         ([i915#8708]) +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html>
>         ([i915#1825]) +35 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html>
>         ([i915#3023]) +41 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html>
>         ([i915#3458]) +12 other tests skip
>  *
>
>     igt@kms_getfb@getfb-reject-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-1/igt@kms_getfb@getfb-reject-ccs.html>
>         ([i915#6118])
>  *
>
>     igt@kms_hdr@bpc-switch:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-11/igt@kms_hdr@bpc-switch.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-3/igt@kms_hdr@bpc-switch.html>
>         ([i915#3555] / [i915#8228])
>  *
>
>     igt@kms_hdr@bpc-switch-dpms:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_hdr@bpc-switch-dpms.html>
>         ([i915#3555] / [i915#8228]) +1 other test skip
>  *
>
>     igt@kms_hdr@bpc-switch-suspend:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_hdr@bpc-switch-suspend.html>
>         ([i915#3555] / [i915#8228])
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html>
>         ([i915#12713])
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html>
>         ([i915#3555] / [i915#8228]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html>
>         ([i915#3555] / [i915#8228])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-8/igt@kms_hdr@static-toggle-suspend.html>
>         ([i915#3555] / [i915#8228])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@kms_hdr@static-toggle-suspend.html>
>         ([i915#3555] / [i915#8228])
>  *
>
>     igt@kms_invalid_mode@clock-too-high:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_invalid_mode@clock-too-high.html>
>         ([i915#3555] / [i915#6403] / [i915#8826])
>  *
>
>     igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html>
>         ([i915#9457]) +3 other tests skip
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_joiner@basic-big-joiner.html>
>         ([i915#10656])
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@kms_joiner@basic-force-ultra-joiner.html>
>         ([i915#12394])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-2/igt@kms_joiner@basic-force-ultra-joiner.html>
>         ([i915#12394])
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         ([i915#10656])
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         ([i915#12339])
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         ([i915#4070] / [i915#4816])
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_panel_fitting@atomic-fastset.html>
>         ([i915#6301])
>  *
>
>     igt@kms_plane_alpha_blend@alpha-basic:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic.html>
>         ([i915#12178])
>  *
>
>     igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html>
>         ([i915#7862]) +1 other test fail
>  *
>
>     igt@kms_plane_lowres@tiling-yf:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html>
>         ([i915#3555]) +1 other test skip
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html>
>         ([i915#3555]) +8 other tests skip
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_plane_multiple@tiling-yf.html>
>         ([i915#3555] / [i915#8806])
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html>
>         ([i915#12247]) +8 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html>
>         ([i915#3555]) +1 other test skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html>
>         ([i915#12247]) +10 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html>
>         ([i915#12247]) +18 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5.html>
>         ([i915#12247] / [i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html>
>         ([i915#12247] / [i915#6953] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html>
>         ([i915#12247]) +3 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html>
>         ([i915#12247] / [i915#3555])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html>
>         ([i915#12247] / [i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html>
>         ([i915#12247]) +22 other tests skip
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html>
>         ([i915#9812])
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         ([i915#9685])
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_pm_dc@dc5-psr.html>
>         ([i915#9685])
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@kms_pm_dc@dc6-dpms.html>
>         ([i915#12913])
>  *
>
>     igt@kms_pm_dc@dc9-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html>
>         ([i915#3361])
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html>
>         ([i915#9340])
>  *
>
>     igt@kms_pm_lpsp@screens-disabled:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-5/igt@kms_pm_lpsp@screens-disabled.html>
>         ([i915#8430])
>  *
>
>     igt@kms_pm_rpm@cursor:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_pm_rpm@cursor.html>
>         ([i915#4077]) +13 other tests skip
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         ([i915#9519])
>  *
>
>     igt@kms_pm_rpm@dpms-non-lpsp:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_pm_rpm@dpms-non-lpsp.html>
>         ([i915#9519])
>  *
>
>     igt@kms_pm_rpm@fences-dpms:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_pm_rpm@fences-dpms.html>
>         ([i915#4077]) +2 other tests skip
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         ([i915#9519])
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         ([i915#9519])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         ([i915#9519]) +2 other tests skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         ([i915#9519]) +2 other tests skip
>  *
>
>     igt@kms_prime@basic-modeset-hybrid:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_prime@basic-modeset-hybrid.html>
>         ([i915#6524])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.html>
>         ([i915#6524])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@kms_prime@basic-modeset-hybrid.html>
>         ([i915#6524])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_prime@basic-modeset-hybrid.html>
>         ([i915#6524] / [i915#6805])
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html>
>         ([i915#11520]) +1 other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html>
>         ([i915#11520]) +7 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html>
>         ([i915#12316]) +7 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-3/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         ([i915#11520]) +11 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html>
>         ([i915#9808]) +2 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html>
>         ([i915#11520]) +11 other tests skip
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-snb4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html>
>         ([i915#11520]) +10 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html>
>         ([i915#11520]) +13 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html>
>         ([i915#11520]) +6 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html>
>         ([i915#11520]) +4 other tests skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         ([i915#4348])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         ([i915#9683])
>  *
>
>     igt@kms_psr@fbc-pr-basic:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_psr@fbc-pr-basic.html>
>         ([i915#1072] / [i915#9732]) +5 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-sprite-plane-move:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-4/igt@kms_psr@fbc-psr-sprite-plane-move.html>
>         ([i915#9732]) +24 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-blt:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html>
>         ([i915#9732]) +8 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-primary-mmap-cpu:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html>
>         ([i915#9688]) +18 other tests skip
>  *
>
>     igt@kms_psr@pr-cursor-plane-onoff:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_psr@pr-cursor-plane-onoff.html>
>         ([i915#1072] / [i915#9732]) +34 other tests skip
>
> *
>
--------------LBotfySwjqKw4ZJxytn2MerL
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/5/2025 2:47 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:173875242509.1366620.134334149943466368@b555e5b46a47">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_pmu: Add PMU tests</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/144348/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/144348/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_16066_full -&gt;
        IGTPW_12544_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_12544_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_12544_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/index.html</a></p>
      <h2>Participating hosts (11 -&gt; 11)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_12544_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@kms_vblank@ts-continuation-suspend.html" moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html" moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@semaphore-busy@bcs0:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-7/igt@perf_pmu@semaphore-busy@bcs0.html" moz-do-not-send="true">FAIL</a> +5 other tests fail</li>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk2/igt@perf_pmu@semaphore-busy@bcs0.html" moz-do-not-send="true">FAIL</a> +4 other tests fail</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>One more place in perf_pmu needs to be updated where
      measured_sleep() is used.</p>
    <p>Thanks,</p>
    <p>Vinay.<br>
    </p>
    <blockquote type="cite" cite="mid:173875242509.1366620.134334149943466368@b555e5b46a47">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
        <li>
          <p>igt@perf_pmu@semaphore-busy@rcs0:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-mtlp-3/igt@perf_pmu@semaphore-busy@rcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@perf_pmu@semaphore-busy@rcs0.html" moz-do-not-send="true">FAIL</a></li>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-11/igt@perf_pmu@semaphore-busy@rcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-8/igt@perf_pmu@semaphore-busy@rcs0.html" moz-do-not-send="true">FAIL</a> +7 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@semaphore-busy@vcs0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-3/igt@perf_pmu@semaphore-busy@vcs0.html" moz-do-not-send="true">FAIL</a> +4 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@semaphore-busy@vcs1:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@perf_pmu@semaphore-busy@vcs1.html" moz-do-not-send="true">FAIL</a> +5 other tests fail</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between CI_DRM_16066_full and
        IGTPW_12544_full:</p>
      <h3>New IGT tests (4)</h3>
      <ul>
        <li>
          <p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-dp-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.71] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary@pipe-a-dp-3-size-128:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.48] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary@pipe-a-dp-3-size-256:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.43] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary@pipe-a-dp-3-size-64:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [3.40] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_12544_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html" moz-do-not-send="true">SKIP</a> ([i915#8411]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@api_intel_bb@crc32:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@api_intel_bb@crc32.html" moz-do-not-send="true">SKIP</a> ([i915#6230])</li>
          </ul>
        </li>
        <li>
          <p>igt@api_intel_bb@object-reloc-purge-cache:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@api_intel_bb@object-reloc-purge-cache.html" moz-do-not-send="true">SKIP</a> ([i915#8411])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@api_intel_bb@object-reloc-purge-cache.html" moz-do-not-send="true">SKIP</a> ([i915#8411])</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@unbind-cold-reset-rebind:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html" moz-do-not-send="true">SKIP</a> ([i915#11078])</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@unbind-reset-rebind:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@device_reset@unbind-reset-rebind.html" moz-do-not-send="true">ABORT</a> ([i915#11814] /
              [i915#11815] / [i915#9413])</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@all-busy-idle-check-all:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@drm_fdinfo@all-busy-idle-check-all.html" moz-do-not-send="true">SKIP</a> ([i915#8414])</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@busy-idle@vecs0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@drm_fdinfo@busy-idle@vecs0.html" moz-do-not-send="true">SKIP</a> ([i915#8414]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@isolation@vecs0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@drm_fdinfo@isolation@vecs0.html" moz-do-not-send="true">SKIP</a> ([i915#8414]) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html" moz-do-not-send="true">SKIP</a> ([i915#8414]) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_basic@multigpu-create-close:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@gem_basic@multigpu-create-close.html" moz-do-not-send="true">SKIP</a> ([i915#7697]) +1 other
              test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@gem_basic@multigpu-create-close.html" moz-do-not-send="true">SKIP</a> ([i915#7697]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-2/igt@gem_basic@multigpu-create-close.html" moz-do-not-send="true">SKIP</a> ([i915#7697])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@gem_basic@multigpu-create-close.html" moz-do-not-send="true">SKIP</a> ([i915#7697]) +1 other
              test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@gem_basic@multigpu-create-close.html" moz-do-not-send="true">SKIP</a> ([i915#7697])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_caching@writes:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-rkl-3/igt@gem_caching@writes.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@gem_caching@writes.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#12917] /
              [i915#12964])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-copy-compressed:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@gem_ccs@block-copy-compressed.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#9323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-multicopy-compressed:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html" moz-do-not-send="true">SKIP</a> ([i915#9323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-7/igt@gem_ccs@ctrl-surf-copy.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#9323]) +1 other test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#9323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html" moz-do-not-send="true">SKIP</a> ([i915#9323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#7297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html" moz-do-not-send="true">SKIP</a> ([i915#6335]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-set-pat:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_create@create-ext-set-pat.html" moz-do-not-send="true">SKIP</a> ([i915#8562])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@basic-norecovery:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-mtlp-8/igt@gem_ctx_exec@basic-norecovery.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-7/igt@gem_ctx_exec@basic-norecovery.html" moz-do-not-send="true">ABORT</a> ([i915#13193])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-close:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html" moz-do-not-send="true">SKIP</a> ([i915#8555])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-many:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-many.html" moz-do-not-send="true">SKIP</a> ([i915#8555])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@processes:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-snb1/igt@gem_ctx_persistence@processes.html" moz-do-not-send="true">SKIP</a> ([i915#1099]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@engines:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@gem_ctx_sseu@engines.html" moz-do-not-send="true">SKIP</a> ([i915#280])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@hibernate:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-1/igt@gem_eio@hibernate.html" moz-do-not-send="true">ABORT</a> ([i915#7975])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@reset-stress:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg1-13/igt@gem_eio@reset-stress.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_eio@reset-stress.html" moz-do-not-send="true">FAIL</a> ([i915#12543] /
              [i915#5784])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-semaphore:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@gem_exec_balancer@bonded-semaphore.html" moz-do-not-send="true">SKIP</a> ([i915#4812]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-true-hang:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@gem_exec_balancer@bonded-true-hang.html" moz-do-not-send="true">SKIP</a> ([i915#4812])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@gem_exec_balancer@bonded-true-hang.html" moz-do-not-send="true">SKIP</a> ([i915#4812])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@invalid-bonds:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@gem_exec_balancer@invalid-bonds.html" moz-do-not-send="true">SKIP</a> ([i915#4036])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-balancer:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html" moz-do-not-send="true">SKIP</a> ([i915#4525]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-bb-first:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html" moz-do-not-send="true">SKIP</a> ([i915#4525])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-10/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html" moz-do-not-send="true">SKIP</a> ([i915#4525])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-8/igt@gem_exec_capture@capture.html" moz-do-not-send="true">FAIL</a> ([i915#11965]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-invisible:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@gem_exec_capture@capture-invisible.html" moz-do-not-send="true">SKIP</a> ([i915#6334]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-recoverable:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html" moz-do-not-send="true">SKIP</a> ([i915#6344])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-3/igt@gem_exec_capture@capture@vecs0-lmem0.html" moz-do-not-send="true">FAIL</a> ([i915#11965]) +4 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-prw-default:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_exec_flush@basic-uc-prw-default.html" moz-do-not-send="true">SKIP</a> ([i915#3539])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-rw-default:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_exec_flush@basic-uc-rw-default.html" moz-do-not-send="true">SKIP</a> ([i915#3539] /
              [i915#4852])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-wb-prw-default:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_exec_flush@basic-wb-prw-default.html" moz-do-not-send="true">SKIP</a> ([i915#3539] /
              [i915#4852]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-2/igt@gem_exec_flush@basic-wb-ro-before-default.html" moz-do-not-send="true">SKIP</a> ([i915#3539] /
              [i915#4852])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@rsvd2-dirt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@gem_exec_params@rsvd2-dirt.html" moz-do-not-send="true">SKIP</a> ([i915#5107])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@gem_exec_reloc@basic-cpu-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-cpu-read-noreloc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-read-noreloc.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-wc:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_exec_reloc@basic-gtt-wc.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-scanout:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@gem_exec_reloc@basic-scanout.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@gem_exec_reloc@basic-write-cpu-active.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html" moz-do-not-send="true">SKIP</a> ([i915#4537] /
              [i915#4812])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html" moz-do-not-send="true">SKIP</a> ([i915#4537] /
              [i915#4812]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@semaphore-power:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@gem_exec_schedule@semaphore-power.html" moz-do-not-send="true">SKIP</a> ([i915#7276])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_suspend@basic-s4-devices:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_exec_suspend@basic-s4-devices.html" moz-do-not-send="true">ABORT</a> ([i915#7975]) +1 other
              test abort</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fence_thrash@bo-write-verify-none:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-none.html" moz-do-not-send="true">SKIP</a> ([i915#4860]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#4860])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@gem_fenced_exec_thrash@too-many-fences.html" moz-do-not-send="true">SKIP</a> ([i915#4860])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_huc_copy@huc-copy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@gem_huc_copy@huc-copy.html" moz-do-not-send="true">SKIP</a> ([i915#2190])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html" moz-do-not-send="true">TIMEOUT</a> ([i915#5493]) +1
              other test timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-8/igt@gem_lmem_swapping@verify-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random-ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12193])</li>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk9/igt@gem_lmem_swapping@verify-random-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +2 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@gem_lmem_swapping@verify-random-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html" moz-do-not-send="true">SKIP</a> ([i915#4565])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_media_vme:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@gem_media_vme.html" moz-do-not-send="true">SKIP</a> ([i915#284])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@gem_media_vme.html" moz-do-not-send="true">SKIP</a> ([i915#284])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@gem_media_vme.html" moz-do-not-send="true">SKIP</a> ([i915#284])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap@big-bo:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@gem_mmap@big-bo.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@basic-short:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@gem_mmap_gtt@basic-short.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_offset@clear:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@gem_mmap_offset@clear.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#12964]) +19
              other tests dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@bad-object:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_mmap_wc@bad-object.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@copy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@gem_mmap_wc@copy.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@write-read:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@gem_mmap_wc@write-read.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@reads-display:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_partial_pwrite_pread@reads-display.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@exhaustion:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_pread@exhaustion.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +6 other
              tests skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-6/igt@gem_pread@exhaustion.html" moz-do-not-send="true">WARN</a> ([i915#2658])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-7/igt@gem_pread@exhaustion.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@snoop:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-2/igt@gem_pread@snoop.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pwrite_snooped:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-1/igt@gem_pwrite_snooped.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@create-protected-buffer:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@gem_pxp@create-protected-buffer.html" moz-do-not-send="true">TIMEOUT</a> ([i915#12964])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-buffer.html" moz-do-not-send="true">TIMEOUT</a> ([i915#12917] /
              [i915#12964]) +3 other tests timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@gem_pxp@reject-modify-context-protection-off-2.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#5190] /
              [i915#8428]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-1/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html" moz-do-not-send="true">SKIP</a> ([i915#5190] /
              [i915#8428]) +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@yf-tiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@gem_render_copy@yf-tiled.html" moz-do-not-send="true">SKIP</a> ([i915#8428]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_tiled_blits@basic:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@gem_render_tiled_blits@basic.html" moz-do-not-send="true">SKIP</a> ([i915#4079])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-5/igt@gem_render_tiled_blits@basic.html" moz-do-not-send="true">SKIP</a> ([i915#4079])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html" moz-do-not-send="true">SKIP</a> ([i915#8411])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@noreloc-s3:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk7/igt@gem_softpin@noreloc-s3.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#13306])</li>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-rkl-1/igt@gem_softpin@noreloc-s3.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-1/igt@gem_softpin@noreloc-s3.html" moz-do-not-send="true">DMESG-FAIL</a> ([i915#12964])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_pread_pwrite:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@gem_tiled_pread_pwrite.html" moz-do-not-send="true">SKIP</a> ([i915#4079]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@coherency-unsync:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@gem_userptr_blits@coherency-unsync.html" moz-do-not-send="true">SKIP</a> ([i915#3297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate.html" moz-do-not-send="true">SKIP</a> ([i915#3297] /
              [i915#4880]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html" moz-do-not-send="true">SKIP</a> ([i915#3297] /
              [i915#4880])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@relocations:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@gem_userptr_blits@relocations.html" moz-do-not-send="true">SKIP</a> ([i915#3281] /
              [i915#3297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@set-cache-level:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@gem_userptr_blits@set-cache-level.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-cycles.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +3 other
              tests skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-cycles.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_vm_create@invalid-create:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-snb7/igt@gem_vm_create@invalid-create.html" moz-do-not-send="true">SKIP</a> +415 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_workarounds@suspend-resume-fd:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-glk4/igt@gem_workarounds@suspend-resume-fd.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk2/igt@gem_workarounds@suspend-resume-fd.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#13356])</li>
          </ul>
        </li>
        <li>
          <p>igt@gen3_render_linear_blits:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-5/igt@gen3_render_linear_blits.html" moz-do-not-send="true">SKIP</a> +5 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-all:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-8/igt@gen9_exec_parse@allowed-all.html" moz-do-not-send="true">SKIP</a> ([i915#2856]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html" moz-do-not-send="true">SKIP</a> ([i915#2527] /
              [i915#2856]) +4 other tests skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html" moz-do-not-send="true">SKIP</a> ([i915#2856]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-chained:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@gen9_exec_parse@bb-chained.html" moz-do-not-send="true">SKIP</a> ([i915#2856])</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-cmd:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@gen9_exec_parse@bb-start-cmd.html" moz-do-not-send="true">SKIP</a> ([i915#2527]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-far:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@gen9_exec_parse@bb-start-far.html" moz-do-not-send="true">SKIP</a> ([i915#2527] /
              [i915#2856])</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-out:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@gen9_exec_parse@bb-start-out.html" moz-do-not-send="true">SKIP</a> ([i915#2527]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-with-fault-injection:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">ABORT</a> ([i915#10887] /
              [i915#12817] / [i915#9820])</li>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-glk7/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk2/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">ABORT</a> ([i915#9820])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@resize-bar:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@i915_module_load@resize-bar.html" moz-do-not-send="true">SKIP</a> ([i915#7178])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html" moz-do-not-send="true">SKIP</a> ([i915#7091])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html" moz-do-not-send="true">SKIP</a> ([i915#8436])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-basic-api:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> ([i915#8399])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-1/igt@i915_pm_freq_mult@media-freq@gt0.html" moz-do-not-send="true">SKIP</a> ([i915#6590]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-5/igt@i915_pm_freq_mult@media-freq@gt0.html" moz-do-not-send="true">SKIP</a> ([i915#6590]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#12797])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@min-max-config-idle:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@i915_pm_rps@min-max-config-idle.html" moz-do-not-send="true">SKIP</a> ([i915#11681] /
              [i915#6621])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-idle-park:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@i915_pm_rps@thresholds-idle-park.html" moz-do-not-send="true">SKIP</a> ([i915#11681])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle-park.html" moz-do-not-send="true">SKIP</a> ([i915#11681])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-park:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@i915_pm_rps@thresholds-park.html" moz-do-not-send="true">SKIP</a> ([i915#11681]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@hwconfig_table:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-1/igt@i915_query@hwconfig_table.html" moz-do-not-send="true">SKIP</a> ([i915#6245])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@test-query-geometry-subslices:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-3/igt@i915_query@test-query-geometry-subslices.html" moz-do-not-send="true">SKIP</a> ([i915#5723])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@mock:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk2/igt@i915_selftest@mock.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#1982] /
              [i915#9311])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@mock@memory_region:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk2/igt@i915_selftest@mock@memory_region.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#9311])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@debugfs-reader:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk3/igt@i915_suspend@debugfs-reader.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#4817])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@sysfs-reader:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-glk9/igt@i915_suspend@sysfs-reader.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk6/igt@i915_suspend@sysfs-reader.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#4817])</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-read:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@intel_hwmon@hwmon-read.html" moz-do-not-send="true">SKIP</a> ([i915#7707])</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> ([i915#7707])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html" moz-do-not-send="true">SKIP</a> ([i915#4212])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_addfb_basic@tile-pitch-mismatch.html" moz-do-not-send="true">SKIP</a> ([i915#4212]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> ([i915#8709]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> ([i915#8709]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#8709]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_async_flips@invalid-async-flip.html" moz-do-not-send="true">SKIP</a> ([i915#12967] /
              [i915#6228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_async_flips@invalid-async-flip-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#12967])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> ([i915#9531])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html" moz-do-not-send="true">SKIP</a> ([i915#1769] /
              [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html" moz-do-not-send="true">SKIP</a> ([i915#1769] /
              [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_atomic_transition@plane-toggle-modeset-transition.html" moz-do-not-send="true">FAIL</a> ([i915#5956])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-3.html" moz-do-not-send="true">FAIL</a> ([i915#5956])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> ([i915#4538] /
              [i915#5286]) +8 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) +11 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">FAIL</a> ([i915#5138])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) +9 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_big_fb@linear-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_big_fb@linear-64bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> +19 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_big_fb@linear-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> ([i915#3638]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> ([i915#3638]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg1-13/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#4423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> ([i915#4538] /
              [i915#5190]) +7 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> ([i915#4538]) +9 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> ([i915#4538] /
              [i915#5190]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> ([i915#5190]) +1 other
              test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> ([i915#6187]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#10307] /
              [i915#10434] / [i915#6095]) +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> ([i915#10307] /
              [i915#6095]) +9 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +126 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html" moz-do-not-send="true">SKIP</a> ([i915#10307] /
              [i915#6095]) +191 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-3/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +84 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12805])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +111 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-2:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-glk9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#12796])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +24 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +49 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> +298 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> ([i915#3742])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#4087]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@dp-audio-edid:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-5/igt@kms_chamelium_audio@dp-audio-edid.html" moz-do-not-send="true">SKIP</a> ([i915#11151] /
              [i915#7828]) +6 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-single:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@kms_chamelium_frames@dp-crc-single.html" moz-do-not-send="true">SKIP</a> ([i915#11151] /
              [i915#7828]) +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html" moz-do-not-send="true">SKIP</a> ([i915#11151] /
              [i915#7828]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@kms_chamelium_frames@hdmi-crc-single.html" moz-do-not-send="true">SKIP</a> ([i915#11151] /
              [i915#7828]) +8 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_chamelium_frames@hdmi-frame-dump.html" moz-do-not-send="true">SKIP</a> ([i915#11151] /
              [i915#7828]) +7 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_chamelium_hpd@common-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#11151] /
              [i915#7828]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html" moz-do-not-send="true">SKIP</a> ([i915#11151] /
              [i915#7828]) +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> ([i915#6944] /
              [i915#7116] / [i915#7118] / [i915#9424]) +1 other test
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> ([i915#7116] /
              [i915#9424])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> ([i915#7118] /
              [i915#9424])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#7118] /
              [i915#9424])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> ([i915#3299])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html" moz-do-not-send="true">TIMEOUT</a> ([i915#7173]) +1
              other test timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> ([i915#6944] /
              [i915#9424]) +1 other test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-3/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> ([i915#9424])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> ([i915#9424]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_content_protection@srm.html" moz-do-not-send="true">SKIP</a> ([i915#7118])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-4/igt@kms_content_protection@srm.html" moz-do-not-send="true">SKIP</a> ([i915#6944] /
              [i915#7116] / [i915#7118])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_content_protection@srm.html" moz-do-not-send="true">SKIP</a> ([i915#6944])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> ([i915#13566]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> ([i915#13566]) +3 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x170.html" moz-do-not-send="true">SKIP</a> ([i915#13049]) +1 other
              test skip</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html" moz-do-not-send="true">SKIP</a> ([i915#13049])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-256x85:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x85.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85.html" moz-do-not-send="true">FAIL</a> ([i915#13566])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send="true">SKIP</a> ([i915#13049]) +1 other
              test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send="true">SKIP</a> ([i915#13049])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send="true">SKIP</a> ([i915#13049])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x512:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-4/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> ([i915#13049])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html" moz-do-not-send="true">SKIP</a> ([i915#8814]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +4 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8814]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-128x42.html" moz-do-not-send="true">FAIL</a> ([i915#13566]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@64x64-top-bottom:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@kms_cursor_edge_walk@64x64-top-bottom.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#4423]) +1
              other test dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html" moz-do-not-send="true">SKIP</a> ([i915#9809]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html" moz-do-not-send="true">SKIP</a> ([i915#13046] /
              [i915#5354])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#4103])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#4103]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html" moz-do-not-send="true">SKIP</a> ([i915#13046] /
              [i915#5354]) +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html" moz-do-not-send="true">SKIP</a> +98 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html" moz-do-not-send="true">SKIP</a> ([i915#9067])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html" moz-do-not-send="true">SKIP</a> ([i915#4103])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html" moz-do-not-send="true">SKIP</a> ([i915#4103] /
              [i915#4213])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#4213]) +2 other
              tests skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#4103] /
              [i915#4213]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9833])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9723])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9833])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9723]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9723]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_aux_dev:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@kms_dp_aux_dev.html" moz-do-not-send="true">SKIP</a> ([i915#1257])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@kms_dp_linktrain_fallback@dp-fallback.html" moz-do-not-send="true">SKIP</a> ([i915#12402])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html" moz-do-not-send="true">SKIP</a> ([i915#12402])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-2/igt@kms_dp_linktrain_fallback@dp-fallback.html" moz-do-not-send="true">SKIP</a> ([i915#12402])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-wc.html" moz-do-not-send="true">SKIP</a> ([i915#8812])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-6/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840]) +1 other test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-8/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-4/igt@kms_fbcon_fbt@psr.html" moz-do-not-send="true">SKIP</a> ([i915#3469])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3955])</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3469])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_feature_discovery@display-2x.html" moz-do-not-send="true">SKIP</a> ([i915#1839])</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_feature_discovery@display-2x.html" moz-do-not-send="true">SKIP</a> ([i915#1839])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-4/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> ([i915#1839]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-10/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> ([i915#658])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> ([i915#658])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fence_pin_leak:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_fence_pin_leak.html" moz-do-not-send="true">SKIP</a> ([i915#4881])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html" moz-do-not-send="true">SKIP</a> ([i915#3637]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html" moz-do-not-send="true">SKIP</a> ([i915#9934]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_flip@2x-flip-vs-fences-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#8381])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz-do-not-send="true">SKIP</a> ([i915#9934]) +2 other
              tests skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-13/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz-do-not-send="true">SKIP</a> ([i915#9934]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#3637]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-5/igt@kms_flip@2x-plain-flip.html" moz-do-not-send="true">SKIP</a> ([i915#9934]) +9 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-snb5/igt@kms_flip@2x-plain-flip-fb-recreate.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-snb1/igt@kms_flip@2x-plain-flip-fb-recreate.html" moz-do-not-send="true">FAIL</a> ([i915#11989]) +3 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#3637]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-tglu-10/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html" moz-do-not-send="true">FAIL</a> ([i915#11989]) +3 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html" moz-do-not-send="true">FAIL</a> ([i915#13027]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html" moz-do-not-send="true">FAIL</a> ([i915#13027]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#118]) +1
              other test dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-fences:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_flip@flip-vs-fences.html" moz-do-not-send="true">SKIP</a> ([i915#8381])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-8/igt@kms_flip@flip-vs-fences.html" moz-do-not-send="true">SKIP</a> ([i915#8381])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_flip@flip-vs-fences.html" moz-do-not-send="true">SKIP</a> ([i915#8381])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-mtlp-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html" moz-do-not-send="true">FAIL</a> ([i915#11989]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html" moz-do-not-send="true">FAIL</a> ([i915#11989]) +2 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1.html" moz-do-not-send="true">FAIL</a> ([i915#11989]) +4 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +5 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8810]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555] / [i915#8813]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#8813]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672] / [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8810] / [i915#8813]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> ([i915#8810])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672]) +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555] / [i915#5190]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555] / [i915#5190]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#8708]) +9 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#8708]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-4.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html" moz-do-not-send="true">FAIL</a> ([i915#6880])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> ([i915#8708]) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> ([i915#3458]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> +39 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> +57 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> +38 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) +25 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> ([i915#1825]) +57 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html" moz-do-not-send="true">SKIP</a> ([i915#5439])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html" moz-do-not-send="true">SKIP</a> ([i915#10055])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html" moz-do-not-send="true">SKIP</a> ([i915#10055])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> ([i915#3458]) +20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> ([i915#8708]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> ([i915#1825]) +35 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html" moz-do-not-send="true">SKIP</a> ([i915#3023]) +41 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html" moz-do-not-send="true">SKIP</a> ([i915#3458]) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_getfb@getfb-reject-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-1/igt@kms_getfb@getfb-reject-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#6118])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-dg2-11/igt@kms_hdr@bpc-switch.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-3/igt@kms_hdr@bpc-switch.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-dpms:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_hdr@bpc-switch-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-suspend:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_hdr@bpc-switch-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> ([i915#12713])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228]) +1 other test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-8/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@clock-too-high:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_invalid_mode@clock-too-high.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#6403] / [i915#8826])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#9457]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#10656])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-12/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#12394])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-2/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#12394])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#10656])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_joiner@invalid-modeset-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#12339])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> ([i915#4070] /
              [i915#4816])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> ([i915#6301])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-basic:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic.html" moz-do-not-send="true">FAIL</a> ([i915#12178])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> ([i915#7862]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-yf:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +8 other
              tests skip</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8806])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953] / [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +22 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html" moz-do-not-send="true">SKIP</a> ([i915#9812])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> ([i915#9685])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-14/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">SKIP</a> ([i915#9685])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">FAIL</a> ([i915#12913])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc9-dpms:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#3361])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@kms-lpsp:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9340])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@screens-disabled:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-5/igt@kms_pm_lpsp@screens-disabled.html" moz-do-not-send="true">SKIP</a> ([i915#8430])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@cursor:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-17/igt@kms_pm_rpm@cursor.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-1/igt@kms_pm_rpm@dpms-non-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@fences-dpms:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_pm_rpm@fences-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> ([i915#9519]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16066/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> ([i915#9519]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-modeset-hybrid:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-2/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-11/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524] /
              [i915#6805])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg1-18/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#12316]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-3/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#9808]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +11 other
              tests skip</li>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-snb4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-glk4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-10/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html" moz-do-not-send="true">SKIP</a> ([i915#4348])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html" moz-do-not-send="true">SKIP</a> ([i915#9683])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-basic:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-dg2-9/igt@kms_psr@fbc-pr-basic.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +5 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-4/igt@kms_psr@fbc-psr-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> ([i915#9732]) +24 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html" moz-do-not-send="true">SKIP</a> ([i915#9732]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-mmap-cpu:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-mtlp-6/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html" moz-do-not-send="true">SKIP</a> ([i915#9688]) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-cursor-plane-onoff:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12544/shard-rkl-4/igt@kms_psr@pr-cursor-plane-onoff.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +34 other tests skip</li>
          </ul>
        </li>
      </ul>
      <p>*</p>
    </blockquote>
  </body>
</html>

--------------LBotfySwjqKw4ZJxytn2MerL--
