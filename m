Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B04E77173
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 07:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B73810E2A8;
	Mon,  9 Dec 2024 07:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6ni2Mno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A71E10E2A8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 07:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733727854; x=1765263854;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I5ALymbFK1f3lf4UR377Le67UPDghZArqlalEfA9skY=;
 b=S6ni2MnoesnJhiW3s2bfC22k649/CJdTLRrWdGlYj1zKsywDZZ3XQ/Ak
 eybqUwYYWAzu3WdksW63YcDEQO6gB7kScOEqOmqB9wHNI0IfiJ8/qkOhv
 2k6DlApiwvI3Y64/P5U5PBZ+HlE58vYuIM8Uq5/DRAzUg3FqavEEmPTIF
 aj4+R8bkQlHez8d9KyrhwLRIjGLB/uvGG3g7WMYivsP/8MRLOUZPVIkRk
 iU6i7Jn72Hqv45QXuPfhd0oD+r6FXG5mss7MzpZk0Iy3c9xCFNclfNAjr
 uvU2k32a80nib0BGy/tQMm+1XVYC3XkcN1Qyq8cpDadli+zz2OqnH6b72 Q==;
X-CSE-ConnectionGUID: IX7SBbBkRqmgF/h6e0m3OQ==
X-CSE-MsgGUID: kux38xQeRjeWpTPNnmDxYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51537864"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="51537864"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2024 23:04:13 -0800
X-CSE-ConnectionGUID: Udh77JFxTBmwpXMK6uH+DQ==
X-CSE-MsgGUID: Adiud6xvSg6rLTrs2h7SZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="94853544"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2024 23:04:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 8 Dec 2024 23:04:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 8 Dec 2024 23:04:12 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 8 Dec 2024 23:04:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jtr+nLo9RpUrz1KKIZHQrskjJXfXaP4+bfb2cijI0gRKQH/OLP/D2RmELQD56olm3E+XcEx3b5raFPnmQV2Sm526OGlAwnyyIW1PHA2hTXO/Er1mkdtSb20helRyo4UdnIIEWEpJBDEJO4JYQHAPAvMWbexgl/Z9uvGebZews+PM/TABuFV695omVJpKdz4cd1AqqJV0SQpAqXXpTVppmEQZTHx07bp/6jrhdbKp6EkW1BA4n4pxDw/OCU26Iu2y47ir6NovulL3Iz/4Pf7QS90WuNOsotI3hgzP2cCScggy+08BGSbvr5sdILIWLrvL497d9chaq0dKCrwSA8HdJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JJQAwVQwA9iM65CwR4GWtliDi06hL1hLVbGr+zkAWw=;
 b=e5Pedg2umQsNIh5VEa+7lklS1yO3guob63NcWDUMZdJ8umi/mziFSBbE6XHnzLwu60eYCoLqQ465K/3Vb4VCZpvmZXcx5G8oe/OZvADkpjvSEwtks0P/704ZM5wMWvnQyPYeqj9hCKDWSwg2saMmcCX2s4s9KMmWFtDVJwoJmByVI3pijeYkXN5SHsUNQ7KqVGtfmDULWAa+aUq+sLekBvJ0XPs27d9iOjSLAosWs9XI3w5uUvOZi67Qx6pAvW8b4pVnAoBGaqcEktLNSqdyEJ/HUIFRW04G6PT2W+Wh/0CGF+Dw2+z6b/opQlUxrto2ljrGE78IN+ilbvRWsgFekA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:04:10 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8207.017; Mon, 9 Dec 2024
 07:04:10 +0000
Message-ID: <b4277fb5-b12f-4f6e-bac3-f38abdffad70@intel.com>
Date: Mon, 9 Dec 2024 12:33:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_scaling_modes: Add informative
 messages for skipped scaling mode tests
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20241127190530.3421021-1-ramanaidu.naladala@intel.com>
 <20241127190530.3421021-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241127190530.3421021-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SN7PR11MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c55c72b-64f5-45f3-bd3e-08dd181fae18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTBHV0VxMGZYSG9uanFtZm9sRXZEck1wWWRjSXhyZkl4ZUpNWWdZZUFYZmMw?=
 =?utf-8?B?TTRaSWNtWEpVbGkwMllJd2NtakxneXkzY0NHSVlxTWJmcXBYZkl6NkkxeXNn?=
 =?utf-8?B?MGp6QysyN2RIa21KSmw1RkdjRThKaU9RYStvMEUrMTZyOGYrdFRpMkpTQ2NN?=
 =?utf-8?B?M01FSGc3S0NrWlVXTGNpYTRuT0kxcitzdURQWG03VEhDR0dFeHlrbjhMRXN2?=
 =?utf-8?B?VVE1RjR2d21peFhZYWh0NHNJYnd1dWR0YjA1MUFDdkJTaXNGbkZ5clIyTVFH?=
 =?utf-8?B?Z0hFaDZ4YjhFRWZ0ZXV3MHJMYXE1TFFoSFIzcG80NDYwbzREMS9wK2F1UzdI?=
 =?utf-8?B?bjdXNjFYU1lmbnpiZFQ5dGQyZkYrQUdKUkh5ZkhJR2JoQktVTFhqTmE3TndV?=
 =?utf-8?B?SWhJbEc1c1pEQWt0Ulo3clZtWnREcE9FNnY2Tm81NE5VVS90NmFKa0c0dkxS?=
 =?utf-8?B?R1dlaUJKN3hMUnI5bnZkazJLWHpYUGJLQVlNVDJ0Zk5ITnd6TnFXeWl3Sjl3?=
 =?utf-8?B?T1R4UGpsV2FhRWpTZHB5VmFiRk5hT1gxQlZGRmxSSHdkRm5BNEE1NTJ4a0RZ?=
 =?utf-8?B?blVFTGpLYlpML1p1WFBsVGlOWUo1R2NxMXJzc25ha3JaV21HOWpXTGh3cWRV?=
 =?utf-8?B?NmJkMkU5OU10L3F3emxVQ0lra01XZ2NjdjJuY3RkMnA4dkdGb01xSFpCNnBH?=
 =?utf-8?B?QmF3V3d0UW8raVVaVGpFWGpNaVhKcXFHLzRucFJacUNlU0pXcVZFK2Q0M1dS?=
 =?utf-8?B?bXMzZ2wxOVovZnFYOHhOS2pPSDA4Qlgzc1lSMWl0emw4eFdkWDdMRDBRcTVO?=
 =?utf-8?B?WEpOMkpNa3pOUHJWOFk4UUpvTXFqTHplVTYxV2FZK1RjQ0p4SDZUbDhxM1Q1?=
 =?utf-8?B?bzZ3N1Z5bjNQT3dLR3JqMjh2bWRjcmtodVhxYUUwdzExYmhyZEJUbzJ4T1lT?=
 =?utf-8?B?bVdTdmZSL3NNL2REWUdLa0t3blljTnU0RlovTkhGdmhPV1V2TW4rdnZ5MXE1?=
 =?utf-8?B?OGNuUXlqWXFscmN3c3FzUmR5a0pUUXlHVGlwY2NPUGFkM2ZWN2djYVFuZUNL?=
 =?utf-8?B?OTZqM3BpNUQ4M003bFdUd1czc3c5UFQyOTkzMjByR1RxTSs0QUlnWEtHZGpY?=
 =?utf-8?B?UThkdjJrQjdweEpiQjdTYVdIU1dTUmdTTWZCZmQ2MjkwK0xBK05ycHowRVdk?=
 =?utf-8?B?ckIwTFozRy9Bclh2Y0tnNC9jNGhuVDJYSFpWMGhyUHduUWxuUEFHNW1YS3JV?=
 =?utf-8?B?dWZxS0pWcTR0TkhlUWoyL2tXSWdvYWpPRm16eW5ZdUc0R2VzTW5XQW5pSTJy?=
 =?utf-8?B?V0g1YWEvL1JHVlpIZ0hJZmZ0a3VzZ1ErME0zd1pJcmNRWmdoVTJDeTJtTmlE?=
 =?utf-8?B?eCtnWG53TktZaTZ2WFNpSmxwMkVlb0xwd2IxWC9yMi9vbERoK2tRbUFSRmJY?=
 =?utf-8?B?bFRhNHhOR2hSTWxhdG45bTJyMDRtaFhteWtReGF1QTN2b3NUejR1cWNsemx1?=
 =?utf-8?B?aWVWazR4SWJJQWdNdlBMQVJlOHZCRTlPbnhqUkQwMm96M1d0dlpocndESVJm?=
 =?utf-8?B?YnRHZ1RHSGU3bldaV2FGN2tiY2ZwZHhYQjJQRTBCMTdqbU1HOFVldVdqMldO?=
 =?utf-8?B?aDlTQUt3bWVuSGpDak5FRDd6Nk0vZGZFU1J5bmhNWXBnc2tMbmhwYXBDYk1N?=
 =?utf-8?B?MHpqT1FMTVpCakRzRjErUmdwM1orTGUzU2d3a2huSVdSSmpIL0d5bktVQUx4?=
 =?utf-8?B?SDBiaXpEcmpRQmNOeGNwT1VlNThsUytjbWh2S1ZUeGg1U0xBeFE5N1BNZ2RL?=
 =?utf-8?B?ZUF0Y3Q5ZnlUSjd0TXlsdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnhzVG10VTRhYndGTHJhc1l3Y0o4ZGh4clZCc2RXRVliQVdnUzhUNmt6ak12?=
 =?utf-8?B?NVVPRG1aaStWazZhOHBVUmIzRWNybi9QZXhmMkVIT0ZsemIvdVhqMFB4OXBj?=
 =?utf-8?B?RTZ3aU43NVhES1I3NHVKUVJiZGM4NzdDdHdMNVUweFRVcE8zZ21QVFVkUVVY?=
 =?utf-8?B?WER1S2Rhb0VIOUZOdC85UVVJUDgyd3Flc0dpM1pEd0g4YzJMVFVYeWZOMXls?=
 =?utf-8?B?QWhYWkFXSUF5TGlvMmlsckR3WHJzS1F4SkdtOUt6MHZnRnRGOTB1dnY3UlRj?=
 =?utf-8?B?YmdrN0Nick5jcWhkM0ZZWkQ5T1BnTlI3L25LenJwbmEzTk1XdDhJOGZibXhL?=
 =?utf-8?B?NndOUCs2ODd2THluRzdia2hBaHZsVnN2bVZuaTZYUWdGbHdxTUZiM3R2cTB3?=
 =?utf-8?B?K29BVmV6VWRnZXpmUWFSaEZPNnpwTEcvSjNVd1lYSVhPSEcwaEVpdFNVeG1p?=
 =?utf-8?B?a0xEMkNjdllsRzRrRnBoZll0SzVwd051TEJEbTA5ZGRVSmROOXRwU21zTmNi?=
 =?utf-8?B?WVVDc29qK2MxcXZRRVFhZHdlVGtjdTFycEJPR01CbDFlMC9RdzBjSlBMQk95?=
 =?utf-8?B?U2dGeXI2T1Jzdk1mdW9VQ2xFeVFxSUxmTHJHRFdVSVU2TzQyMDd5V25MNHRZ?=
 =?utf-8?B?YkJ0UURGNDZyeG9aRzJERjhaMU5EK2h1dmczYU5ranprWHEzcmJNZGtnYkN6?=
 =?utf-8?B?MEF3RlRhUnZwckV0MTFJVWNyd3VCblAvbjdoSXJXMDg2VXhMMlZ1dDNoaWtF?=
 =?utf-8?B?UVNpa0RxVjZOUzEvdnREa1VUdFNacW1LSXJnaEY1NHVoa1hrRnBzTE9oZzly?=
 =?utf-8?B?aDhDRHBQZklsZmFEd2NORWFKYkcrY3AxRW9xSVcyY2Q4UWNzUld2MElGTjlz?=
 =?utf-8?B?V3JxdDhScTlHdzdDWHM4K1Vjb3Q3anhVbGRBZGJzek01VFNFK3R5VDdKR0c3?=
 =?utf-8?B?cXNhbEIrNXkvMGNCY1k3cXlkbXlFS01YZ1Y0SGZFN29laVJvUFZkaWwyNDFi?=
 =?utf-8?B?ZmxwQUp0V21NQW1MMFc1NTlZQ3RoeWVMdElEbXAxZmVtMWdBWGM4d3E5ZEJl?=
 =?utf-8?B?SXhRanMwcndVRzMzUGxrNFNhUmZ5dHcrVTZUaTZrNnZQUWhVM2M4UFMrY1ZD?=
 =?utf-8?B?anNTTzZ6V2hoQmxQZ3lNT1hCaG9qZ1RyODdFRkVKaGUvN3k5SjQyVXNSbm40?=
 =?utf-8?B?REM2aHZCR0pDM3krK01uRHg0bWJCeFp6ZGlTS0xpZmVZazNYMnI1b0paN0tI?=
 =?utf-8?B?cmVXekpOUmtSbkxSNHhXOFZIbzdOZzZyTnVQVXBZM29MTDRPbXV1N3V6NGY0?=
 =?utf-8?B?N3M4ZmlNQ0wwLzgxdHJnVXFsekE2ekszVTdaNDlZTkw0VWdaMVpUWWlyS3E0?=
 =?utf-8?B?RE1XbS9JV1JZTHNZdFIyYTBrLzZRTG16Z25ROEozSmRQMHpsenFQZ3RiRWln?=
 =?utf-8?B?YjUxZWJVK1FUL3JIY1NUVFFSMWlnU3IzNU1PY0o0ckFjbFN1SFk5RmpHLzhs?=
 =?utf-8?B?QmwzMkNzdS93eWp5aGI1VTliUkRvRWI1amtWcFl0ZFcwYzJXRnVTb1FFOGNS?=
 =?utf-8?B?c2JINGFvMHUwblNvbGtTK2RuOFE4dmhrdHdORjU3cVlrWjNwR1l4UFVXNnRs?=
 =?utf-8?B?cnNIQmMrcTJkNnh2bkJsWjBDUmNGSGxYQ0JoOVYwV24raE45ditBeU94UnFM?=
 =?utf-8?B?TjBpV3Uxb2hTUmdtcEpjSWxTY3l5VjNwRzhtcFR0d2ZrTDFCaFlqZUUzeWlZ?=
 =?utf-8?B?UWRyUnB3azhvYk5HdUowVzNhNWMyWkVwcm52azFqcDM5L3I2eEhFVFZMQVd3?=
 =?utf-8?B?aXJ0OEdZVGN6aTFRZ2lGcXR3a3BOK0JTWnVUbmVPQmdvOFpqUzFza2ZJMlZy?=
 =?utf-8?B?bG02dGcyQlkrVG1FZzYvSVdVNGkra0N6STNpK25yeExyVGZTNHFGeU1KZDl6?=
 =?utf-8?B?WUovR2MxOTBDYUovTjlBRUV0NHY0cjlFMUxmQnV3dWZXUG8rNmc4MEZoUFJ0?=
 =?utf-8?B?SUxMNktJMm5Zd1RpUkVHY2dsdEVaRG91ZmxTMzZnR09tVU01cjluVXJhZklM?=
 =?utf-8?B?YkVKbG5Jb2thSVUvVTd5ZXEyTFpLK1A3K0haRGpOM2w0MDBPbEhPZ2Y4Mnpz?=
 =?utf-8?Q?b24rsyf0yB9hHuWIdu/HmlGAI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c55c72b-64f5-45f3-bd3e-08dd181fae18
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:04:10.4232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vox+hnXp0U1y0OUs09e6Vd32+pOQqyg1eXi/fCi64g39FS2vL6f42W7PyIVaL46fEcrxAzVoXKaZm1/UIKj6lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
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

Hi Ramanaidu,

On 28-11-2024 12:35 am, Naladala Ramanaidu wrote:
> Add `igt_info` messages to provide more context when skipping outputs
> that do not support scaling mode. Include `igt_info` messages to
> indicate when invalid pipe/output combinations are skipped.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_scaling_modes.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
> index 5fd34c4b2..dd2c6426c 100644
> --- a/tests/kms_scaling_modes.c
> +++ b/tests/kms_scaling_modes.c
> @@ -117,12 +117,17 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
>   	for_each_pipe_with_valid_output(display, pipe, output) {
>   		igt_display_reset(display);
>   
> -		if (!has_scaling_mode(output))
> +		if (!has_scaling_mode(output)) {
> +			igt_info("Output %s does not support scaling mode.\n",

Please update the igt_info as igt_info("%s: Doesn't support 
IGT_CONNECTOR_SCALING_MODE\n", igt_output_name(output));


> +				  igt_output_name(output));
>   			continue;
> +		}
>   
>   		igt_output_set_pipe(output, pipe);
> -		if (!intel_pipe_output_combo_valid(display))
> +		if (!intel_pipe_output_combo_valid(display)) {
> +			igt_info("Skipping invalid pipe/output combination.\n");
>   			continue;
> +		}
>   
>   		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
>   			test_scaling_mode_on_output(display, pipe, output, flags);
