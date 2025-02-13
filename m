Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316F6C021A7
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 05:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A938210E092;
	Thu, 13 Feb 2025 05:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4WD5Tzc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5E210E092
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 05:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739425496; x=1770961496;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=e+c3czrCwWjloF8iic/7vlNbVlgbn8yk67Mhrbpleds=;
 b=j4WD5Tzcq7zp8C7Is/sHgGyPhS0LdMFYALovQmAOiw2H1Mio8h8+2uYT
 SHH6KM555xC14WW/RI2p8WMklEt/UuNY8HSOJjkf0z2kO3S344Utt2DTE
 ozYPgDtd4DLlj0GaE5iMamf1fkbU/bZfKfbOwPIavTb8HliSYHnmx6nzx
 XJz7t+sw/CiUrlNC6o4NBx3cBP30+ocl4ORp4Ois6mRVvdBWTsY7aful0
 /4I/jS24xf7xyDIK7dWjJW4zyB8iOG2trTpo69XFsOzRp75j/7ZmyoihB
 qdEln/7gMwi3a6ZE46DxvCVcpBLuD86JPtfuE3V9VqJVUcAheUAKPmtWD Q==;
X-CSE-ConnectionGUID: /r6vUt6iS0+75K/OrKE6Eg==
X-CSE-MsgGUID: A57IS57NRMqYAAclb7a3JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65466672"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="65466672"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 21:44:55 -0800
X-CSE-ConnectionGUID: fkEg6JDKR+ufxanCz8s4CA==
X-CSE-MsgGUID: f5LQvWdaTCiJ4NytZZYZkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117151856"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 21:44:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 21:44:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 21:44:54 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 21:44:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAIhLLOqPeX45H7GL0/GXj4brM9+9Pgzd08Cexa3no6UutUc5j0i1fxJPFfdty8d+NkEaHf0jvDPp5SyO4mxO0NI+PXsbjfkS76c6gvlvCAfr2v8r+7mJcJqDbfn6fqrTqawIKIfWK0rhWcR5ZySAXv/WouACy3PU7xI5ZWmzWs0tO5hOCywzc7sJ1HF+j3vOBQ4AfQIub8YqHCIFr8b61fA0SGJKEouRqwk+donvg1Qx3yOo/C3/vCsmdVgMYoTzTqma6ckdtvxAFtwvkIaiTdHQi3rNmdHwlv1ORVz2+4VjtFgrxSECstVtVUFMNWWkZMZj/7t4GUiAbTjWPnIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzRzQMzmSqq9DiAviiHqlekPvCe4chv4+W0/pcgihMg=;
 b=jRNy+igDouQvqOADIKlZn6Pha4iRxhMcv/VX3/SVJ4GfWdd5lGpKKkzji0hF8ihwvfl2pUczKnb4B2pXFUomZvLyrLRTT4RhSV1/EQ/qGBckaSsSqFjSy4Hwy4leAsttAP/0/08q5RNw7QFPixjak/IeJVH3RrWsyLUHlw9IXxZWWLcbDZO15vShb1n9+4YtIfTVlK7l1Ybjfj2vzC149qxlLKpNbX4lDPyGi85Zj5ElrRzQirjlwGdYJPJR7sI9d6+gKrFkhdsfD6t8RAiq/TNveM8nP7huyRRlUeskHykS8CEYpAVorton1QN1ycYgfEM8PBA36k0jdw6inSUzPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW4PR11MB7005.namprd11.prod.outlook.com (2603:10b6:303:22e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Thu, 13 Feb
 2025 05:44:51 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 05:44:51 +0000
Message-ID: <03d146cb-a59b-4636-823a-d5608a72e400@intel.com>
Date: Thu, 13 Feb 2025 11:14:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/7] tests/intel/kms_mst_helper: add helper for
 MST-related functions
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
 <20250211180542.1430676-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250211180542.1430676-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW4PR11MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 36ed7a3c-b085-4231-fc24-08dd4bf188bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHhhb1liUld0STRWVzRoeUROOENTdmxTZjZacG9UcGxoQzNoaGxqY3dyTWxD?=
 =?utf-8?B?a0htVSs3V3hLenUzNjlwaHVXbytYVnFxWEZ3TmdhUnBVakVSNUZZL0ZkQm81?=
 =?utf-8?B?WWg1Y3FmNEtrc205UzdUcTNvWmNVOG5TNDVPSmx6RzVKRmpuaS9lenpGS3BM?=
 =?utf-8?B?bHhLc1p1bW9uOGEyNTBYVGk3dmNjT1R3M2IrRXE2QzB2SUdpMENHZFRZcHAx?=
 =?utf-8?B?cXF3bXJjWjIyTnNCNkF2Vk5PNEw1WGhzVzBZSnY1TVBFNGt5MVNXdmV5RmhR?=
 =?utf-8?B?TmVtcUVkRUVlRkpCOXlNdzlxb3U3aC9Falo5dDhBMDdURjhVMnhyWkxyVGRV?=
 =?utf-8?B?Y21FUVhCL3VIQnVIa3M3REFRTFN1eUpNMnVqOVdmc0c3ZDZXOStER1YrSlNB?=
 =?utf-8?B?N2JzZXdOdXY0T2xJY1NlK3ViQndCcytieFQ5bHdwcUgzelMzWFA5WThkckRt?=
 =?utf-8?B?U0FqMWF1T1k1bE5LYkxKRGRpcWQ1citndTU5MEZ2T3VtRHR5Yk15KzNBSWJ2?=
 =?utf-8?B?SzV3NlB1R09ocStMNThiV3ZhdzJJRk1nTzJKaGJYZ29nN1UvOFFIS3RJa0Q4?=
 =?utf-8?B?THBEWEtROEw2VndtR09tLzlidjcwQTV3ZzE3TVNBdFBpM3Z5RmFKcVlGTDhi?=
 =?utf-8?B?YTVlK25FdTdLbTBmM2FteTRYdE1sNG90cTBaSjN3SmN5YTlIUUJRYWdnQmg1?=
 =?utf-8?B?Y2pUenVOZ0oyMkpNUnBtN09wWVpyVjNTb2I1MDcrZDBGeEIyZm55UU1ES0Qw?=
 =?utf-8?B?eU02SHdjUXl0T01SQ1kzUzZVc25PaXg3S0FIWHY2LzNnejVGRXlrZmVMQXFT?=
 =?utf-8?B?TUxzbVJFenhzM3NERkFWMmFFdjZXSUZSckxZb0gwMHI1WTBHZkNIKy9zbEpG?=
 =?utf-8?B?dnp4MGZqTGlDNWtlblcxbHExeFJJRm1HYVZzZEtOb1pzQ0Zzdk5KZjBHTHpR?=
 =?utf-8?B?cExFeFBHaEd0VXY2Zk5NNFJ3czZQWTRmQWRyc090STc2L2dhWEVTa2tmVXYy?=
 =?utf-8?B?S1RoOGg4OFUwNkNCb0lRM0VXNmU0TEhtSXdiM28zUmNCdGVoQTRDV0RDMmln?=
 =?utf-8?B?eDRHNDBBSmtrWWV0M0NTcjhNM25BaW9GU0dKeXZUQ3lVTlJNejBBM3Y5QzFq?=
 =?utf-8?B?UXdNYlViaFFTa1dHL3djS0lwMnM3N2NQYTdGeDhhRlV0ZWZNODBJalk5Qklp?=
 =?utf-8?B?Ry8xenF3djAvcCt0K244T2tLTWxqTmZEYU5EekFCKzNGZTV3U3ExT2h5NmlW?=
 =?utf-8?B?clJvQjZSVWxMU0NybWNFZjZiNTB6VXhhTUJGOHN2Y2dLMkRRR01ZU3A5WmdL?=
 =?utf-8?B?WkU5M3pTWjN0dllVSWFpUytXYW9uWjJKck9pdGZ2TmtxUFVCY3RaaWZQNDZR?=
 =?utf-8?B?NDhQMHloWndMbGlrRmFLeWhVK0lQSmJCM2dtY1dhUU1ndmJCU3FQMCtEK29l?=
 =?utf-8?B?cVZISWd3MTlrUkFHWGdZejUrSVRKWWt0UTdySU53YlpnMFFWUWxSb1BiMjhw?=
 =?utf-8?B?VjAwZk1MUG0xdGVpeXZteWdDWVFNWlNkUS8zaVNXNmJhajBhOXEwa3A5UVp1?=
 =?utf-8?B?ZDJIcE96c1JmRitWMC9STEN2dlhRNkxiVlZQeTNIb1RFMnh3S1FwTDNrdHA0?=
 =?utf-8?B?NEpHRHNqb1FvdWMwdEk3K29YUkNyRWx6aUUrSzRUYnpzYmtrYzFCODZIZHdu?=
 =?utf-8?B?NFJQYitCczNlYy9NQmlLbTdzWjB0UklRYUk1dWNHQUFsVndtUEtrQ2dUaW0z?=
 =?utf-8?B?TldQano2UnFvQUovdnBaNTd4K1E1Tm1qR3VWSDJtQTVPQmVzVFFSdUpXemNW?=
 =?utf-8?B?T1lHeFRkNExyZjRhbTVKckNndytWVDlNTFN5U0M4L3FqdGgyVGRLR3N1TytC?=
 =?utf-8?Q?fVcRK6X0M1Uao?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2lNbG5rc2ZOQjl4aG5KWmhESE05R29ia1h0Z1ZjU1RGaEJRbXppbHFjM1J2?=
 =?utf-8?B?YTNZbDI0a0xVWC9wV1prM0V6SUdUajFOTEhHZFBFaEpqVlZDVUd3ck8wem9z?=
 =?utf-8?B?R2ZHZElZZ1JFZ1BJVXNnejNSOVpkVElNVHl6bmxrQlhMZms4SVlLMmE0V3lR?=
 =?utf-8?B?ZHdsR3J4TDNxdVRYNlV1VC80Q0JpWVpTOGRZeUJZRkxaQStIVEw1VGkwaEpn?=
 =?utf-8?B?VTNtZ2ZlS0J4UE9wUlFCS1FLQTNXZFJtZ2VHMjkxZWRLZkNWb1RBQml5cUdR?=
 =?utf-8?B?MGJzUE5XclVRMmRyRnRxZzFIMHZKdHd6SVNSUlR2VS9HYUdCdnBZdkhTZ3Vr?=
 =?utf-8?B?NEhmM2lQVFpuaVREcDZ5aHNUL0NzVEdDNVZOSVl1THBMcWVpS0l4K2s5V1RF?=
 =?utf-8?B?NG9BQ2hyMk1rY0lrOUMxclE4SEdvZ3pKYUhJMXdobmxuMWY0Zjk1WEFUYkgw?=
 =?utf-8?B?TVpuTjNNYmhIU05acHh3ZFI4UUd0V3BQN3JVbzhJZXlreUIyVmV3YVQyZ1hS?=
 =?utf-8?B?dk05eC9YM2V2cHR1RGNNMWNzVmw3cnZRU2R1YzQ1Uy8zN3pkNGNBN3NpLytY?=
 =?utf-8?B?ZnZvRy83ZUdrMWRGMXhua21uSkVWcHFoRlplS21uWFpJQ2tCYUFKVlQ3elBm?=
 =?utf-8?B?b2JTcXBGR2lKWDZYTHRXem8yMUp3eVJmUTgrVVNIeCtvYm1KY2dKNnlBQnJF?=
 =?utf-8?B?YTdLbE9lL2UrUUVCN01yb1lSU0V6THFPTTE0MzRlWXdxUUpKaXMwdjI0RW5Y?=
 =?utf-8?B?NithWFBHSGpva1cvTjdUeTdqTkwrRzBnWjhjOEdDVWY2ZTZaY09XSXBuZ08z?=
 =?utf-8?B?ck81RDdPN2dobU1jQzRZVXBSckxNTnNXNCt4VW94VitNR1NSSUJrL0pXajh1?=
 =?utf-8?B?c21tZE5wZUhhcU1ReXJCcXliaXlINFBIOEJFL1BMVTNjNTBWR0ZDTXpNMkFZ?=
 =?utf-8?B?Z1NxamRaazh0TFdXSEg4SVdjeGxibUZEeXdtMGJmL1hCSVh0WElpaU1CVWVZ?=
 =?utf-8?B?cEx2SkZBK2JVMWtLcUFFVUdoNjM2QkNFQXNNdGx5SSsxRUFnRElQNEFHRVhm?=
 =?utf-8?B?OVQ4WEE3TTJReGpKU0ZRc1lOMlgyWE5COWo5WXpoL2RNOWpKTFA1Z3FFblpp?=
 =?utf-8?B?Q3ZoSnRTcFJlbUtJZWpBSW1ZMXVNcy9qR21qdEdEWXB5eEM1eFNVNFl1Z1NQ?=
 =?utf-8?B?UldpZEpQMG9Yb29xNkxCSDVjbHlZQXRvVWV6YVh6UFFPUTBxQ3Y0Q1BPU1hN?=
 =?utf-8?B?cVIyK1FMdmRVbldtQS9FNDVTRGpzYTZJeW0ycVpZWTFUU29IVFYyQzh0R012?=
 =?utf-8?B?QjB6S2FCWWEzaktBYUZLeXRMUkxxekhDSGdndnQ1aEY3S0hnRExaU0hjekx1?=
 =?utf-8?B?RGtPQnpuWmRwZ2JUOTBTdGpRL3RrdlZDSkVqUlhqKzZqZTB2WVNwVWpCOVBX?=
 =?utf-8?B?SDZrL3hYNE9yZWJ3eGN2VW1qVStLK2RCM2g0Z3ZFVW1UTjRjT3NGd0tmZFBN?=
 =?utf-8?B?akNMa25vNkpoZkV3VTc0Y3Fqakk4Y3JWa0JKZjgxZ2o5ZDBLQzBsTVAyckgr?=
 =?utf-8?B?Vy8rbG85NFFIWWpydE9CenpnaDRibTQzb2JqWjk2bUVmUnFWcHp2S0JhUVN5?=
 =?utf-8?B?aXo3T2orY29RN2doSWRJY2xmalkyL2ZaTk12TllxYTZwaE5zdmx1bGUzL3h6?=
 =?utf-8?B?dWoyMGl0U0ZVbGNXc1NkRFBtWC9sMWFhaGoxcVphQmJyazUzTG1ic0RSblR0?=
 =?utf-8?B?cTlId1g2UWF3cDFhdmVuNk9oRElUT24xdUd4Vk1XVFZnZXdQaDJZTW9QVWRP?=
 =?utf-8?B?eTFYTko0UkE1Q2ZPaW05WEtncDhLb2ZhQVFXd3RTM2xFSE9rRGQ0M24vREtN?=
 =?utf-8?B?eU9YeXlTTU8xSWZ0Ujc2Z0pyVVFuNVJpWWt4Vzd5dEFZd0YvdHpHWlVrV1BB?=
 =?utf-8?B?V0tIZUppRi9MQ1ArTzRZd0lTNk1tbUlhQzVyM0tXZjIzSVNnRVhzWlFTQTBv?=
 =?utf-8?B?L3FLSi8zUk5kQ2pkT1JHVUlIY2tabk44UUJJRzluNU1QTHVtbkJ5WmdldnJx?=
 =?utf-8?B?NDFOZ09WSGl3NHJSazh3Qm1nWFBtaWRsc1NLRmZiK2E3RHhXKzVuSWpoaksr?=
 =?utf-8?B?TDVJWTVSZElnV0M4QUxmNXJyRDd1UUpxTk5CZkxwRlBlYWpwOFV5NFFWRUth?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ed7a3c-b085-4231-fc24-08dd4bf188bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 05:44:51.3295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSKIeesvmTVXuWMCZxDu7iA97lxxa8HjcbAIhbAwFxI3v/TBZgmlBYrtPvZIaSybds8UzvG22l2cfmjBHtqMONlqXfWh27k22rPS/lpkasI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7005
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


On 2/11/2025 11:35 PM, Kunal Joshi wrote:
> Add helper to centralize commonly used MST-related logic.
> Move find_mst_outputs to lib.
>
> v2: fix docs (Ankit)
>      split patch (Ankit)
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 38 +++-----------------
>   tests/intel/kms_mst_helper.c            | 48 +++++++++++++++++++++++++
>   tests/intel/kms_mst_helper.h            | 15 ++++++++
>   tests/meson.build                       |  1 +
>   4 files changed, 69 insertions(+), 33 deletions(-)
>   create mode 100644 tests/intel/kms_mst_helper.c
>   create mode 100644 tests/intel/kms_mst_helper.h
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index edf9409b6..145bf2fc5 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -16,6 +16,7 @@
>   #include <sys/types.h>
>   #include "igt_sysfs.h"
>   #include "igt.h"
> +#include "kms_mst_helper.h"
>   
>   /**
>    * SUBTEST: dp-fallback
> @@ -47,35 +48,6 @@ typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
>   
>   IGT_TEST_DESCRIPTION("Test link training fallback");
>   
> -static int find_mst_outputs(int drm_fd, igt_display_t *display,
> -			    igt_output_t *output,
> -			    igt_output_t *mst_outputs[],
> -			    int *num_mst_outputs)
> -{
> -	int output_root_id, root_id;
> -	igt_output_t *connector_output;
> -
> -	if (!igt_check_output_is_dp_mst(output))
> -		return -EINVAL;
> -
> -	output_root_id = igt_get_dp_mst_connector_id(output);
> -	if (output_root_id == -EINVAL)
> -		return -EINVAL;
> -	/*
> -	 * If output is MST check all other connected output which shares
> -	 * same path and fill mst_outputs and num_mst_outputs
> -	 */
> -	for_each_connected_output(display, connector_output) {
> -		if (!igt_check_output_is_dp_mst(connector_output))
> -			continue;
> -
> -		root_id = igt_get_dp_mst_connector_id(connector_output);
> -		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> -			mst_outputs[(*num_mst_outputs)++] = connector_output;
> -	}
> -	return 0;
> -}
> -
>   static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   			      int *output_count)
>   {
> @@ -90,10 +62,10 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
>   			return false;
>   
> -	igt_assert_f(find_mst_outputs(data->drm_fd, &data->display,
> -				      data->output, mst_output,
> -				      output_count) == 0,
> -				      "Unable to find mst outputs or given optput is not mst\n");
> +	igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd, &data->display,
> +							 data->output, mst_output,
> +							 output_count) == 0,
> +							 "Unable to find mst outputs or given optput is not mst\n");
>   
>   	for (i = 0; i < *output_count; i++) {
>   		output = mst_output[i];
> diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
> new file mode 100644
> index 000000000..c12bf0703
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.c
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "kms_mst_helper.h"
> +
> +/*
> + * @drm_fd: DRM file descriptor
> + * @display: pointer to #igt_display_t structure
> + * @output: target output
> + * @mst_outputs: filled with mst output of same toplogy as @output
> + * @num_mst_outputs: filled with count of mst outputs found in topology
> + *
> + * Iterates over all connected outputs and adds each DP MST
> + * output that shares the same MST connector ID as @output
> + * into @mst_outputs.
> + *
> + * Returns: 0 on success, -error on failure
> + */
> +int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> +					igt_output_t *output,
> +					igt_output_t *mst_outputs[],
> +					int *num_mst_outputs)
> +{
> +        int output_root_id, root_id;
> +        igt_output_t *connector_output;
> +
> +        if (!igt_check_output_is_dp_mst(output))
> +                return -EINVAL;
> +
> +        output_root_id = igt_get_dp_mst_connector_id(output);
> +        if (output_root_id == -EINVAL)
> +                return -EINVAL;
> +        /*
> +         * If output is MST check all other connected output which shares
> +         * same path and fill mst_outputs and num_mst_outputs
> +         */
> +        for_each_connected_output(display, connector_output) {
> +                if (!igt_check_output_is_dp_mst(connector_output))
> +                        continue;
> +
> +                root_id = igt_get_dp_mst_connector_id(connector_output);
> +                if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> +                        mst_outputs[(*num_mst_outputs)++] = connector_output;
> +        }
> +        return 0;
> +}
> diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
> new file mode 100644
> index 000000000..5b62b979b
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef KMS_MST_HELPER_H
> +#define KMS_MST_HELPER_H
> +
> +#include "igt.h"
> +
> +int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> +                                        igt_output_t *output,
> +                                        igt_output_t *mst_outputs[],
> +                                        int *num_mst_outputs);
> +#endif
> diff --git a/tests/meson.build b/tests/meson.build
> index 33dffad31..a6f6ad560 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -366,6 +366,7 @@ extra_sources = {
>   	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_dp_linktrain_fallback': [ join_paths ('intel', 'kms_mst_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }
