Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CFBE7716A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 09:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7C010E8B9;
	Tue, 17 Dec 2024 09:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mC17abCO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E08010E8B9
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734428088; x=1765964088;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=guFwBKtBqToY/UggyXLGW248+Yj8J310gmmntXj0xzE=;
 b=mC17abCODJjuoFFE7wvWNY1kclV7JeO6h6RsYhTajJj9+jTdN7APzLDo
 9cZ239rxUjsoNpVUdfbJ9lml86+1fpK4NGjBMAQx2JXAnOZokMdn4I6+P
 gRruIFjZZ+TUNNDgh3v9EWOuVeCNTIThKn1trd1O+eySL2eZAwp0uHFM3
 U0rjDIJ0PNnRctyOeNgUzwARpqc/ztTZ4eZ/D9/avaw7qseV4H9l6cBLA
 4+nTGDt2OW6yNEcwW2Ip0MGKrT5u7Z8lS0+/tEi4Rj53BNEdFAc+U67Yo
 B0EKFglBpx8vUnTN5T3xhY4NDIDbWB0abN+Km6Tz7pRjAP2z+6MBRiZtR A==;
X-CSE-ConnectionGUID: qKYR/g21RlO0AZ8bgSsxIQ==
X-CSE-MsgGUID: NHyOql8SQ4uJ1dhid4fv9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="22436074"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="22436074"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:34:29 -0800
X-CSE-ConnectionGUID: NLzYPkj3Q+CDSnefrqLiNw==
X-CSE-MsgGUID: rdLhDZ4aTEWJVwnFqm1Nbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97329169"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 01:34:29 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 01:34:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 01:34:28 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 01:34:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrwwT4o+5RXOvkZF3izIMEk6tRQLsKnHnczZ/iNgziFARMXn7Co3fJpFirNFEkZeq9krXRoxo2RixNuq02r8BxVdZ47+1hIg07vJa/OidbceFQcgKXdXG6dPnLVccEvkLRj7+Orsw28dWsit0u1aZ9kmJbUaYcFeBIYHXVCr6dd1z3aiZ4ZJN51uPbOQCcbbGSO3ei9B5bs0nRvxL+iZ8qzLpMQj7KVUwlAwsra8bE77uVcqcGVoPQvvsJff5jvtqRXgkCjtIJzIvRwyzY0Gl2qGlkYbgrEMUWsELklzmm+8HSGsXj9xR0TGzn9q4AUgxvBhPxy94W63IcYUJnANyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PUC2ytHWV5fZXkx76jy5+RdJe+fl5ETP4a60jT0JjQ=;
 b=LZxAj+H4QO/1lrebvze8j0HWv1t9O8xP5PBNUzPaBilkosOu5hxCPGP5n6VNGCBg8VuiuErTLXabrUtOLiP/7ELXjubLNHmnWBOCuP36/W/ppu2TGl/dtsGyFXmF24XAw5raEPr2CwRqNpWKVwUnZ4UYvG8QYaKLh6v+5VWSDLZtm2/f1D2WOnnSWTTZKY71Gn/8BNCb0kkVEWi33fhXor9G5Ib6hXxKK5YkvikvMBTtsu5VpSIZl0LqfeA/P5TcQPnB7jOW9797WskZgIXfMtDuLpSNneCOCpx9cnrIvKH1TrlHZxYQwboTuUB0L7P5/jnD/Z32OvLUGzB2n5wxhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 09:34:20 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%6]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:34:20 +0000
Message-ID: <7e2803d1-3298-4f57-be6a-e37517aae91c@intel.com>
Date: Tue, 17 Dec 2024 10:34:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/xe_eudebug: Use library helper to enable
 ccs_mode
To: <igt-dev@lists.freedesktop.org>
References: <20241216131137.50945-1-dominik.grzegorzek@intel.com>
 <20241216131137.50945-2-dominik.grzegorzek@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241216131137.50945-2-dominik.grzegorzek@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0068.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::11) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|SA2PR11MB4794:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f946ed-553c-42be-92c7-08dd1e7dfc23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFpuMjNGRDB5Y2VRcmRKY3FDV1BZT3V5WkpZSDY5UUdJYThucUpGZXlybWRN?=
 =?utf-8?B?M2dOb0pzeGdIQ3hsM200a090UDZndG5zcmdhVEs3N3lzdmkzMDdsMTdhbnNt?=
 =?utf-8?B?Z0ExL0xWVkYxV05CVlRkV291QmQ4U2JLcFF3bTVKOEM1U2dlZWtkLzdSYk9I?=
 =?utf-8?B?ZW10bHhvOFk2YjNtbTd2UUpaNG1IVExFdm03enBLQjM3cHdYMUpJK094bGFK?=
 =?utf-8?B?Q1c4cnpkbkFVUXBwTEFoQVVNSjlTNi9sZytJTTMrdllvRnduSllseHBKRHJx?=
 =?utf-8?B?UDQ4WjBoM3JydHNlZVF3Q3RuS2NodCtyYll5Y2VoUlgwNzdFTWJjWHhLT1Vn?=
 =?utf-8?B?dzlhVHVxZEluc0pVSndrakN2L3NaeXdQeExnczgzRVord3ZyTXdkNGYzazhD?=
 =?utf-8?B?Q3VTeDN5eGFFV0xpcXhSOWNJK0tXZmlpTmZaRk9ERktac2RFQXJVdFFaSmll?=
 =?utf-8?B?dmFsZTdjTWp0NSt1U25UR3o1TWZsUmJUTFZNTk43TGxXM014K3dvOTJDdE1P?=
 =?utf-8?B?Tkt0K0F5OUhDM0dMcnFIUzNCSW5tSUtQN1h4L3I5dXBMNkp0S2hXMldPenJv?=
 =?utf-8?B?RVNpbndGRmcwVmlTTkJzUDBTd3hmMm1SRzQxMDNuSjZlR3FzN3ZrY2hXUFJ4?=
 =?utf-8?B?OFNsN1ZSZTFUdDBJQjRlSDRtNkRNWEtjYzY1bjFaNzhiS21kYXZ2QnpUV0hi?=
 =?utf-8?B?TncvLzh1WURicnZaSGdGb1NHOVdybWJ0ZDNaUUtCSTVrM2F6b1gwVXRnbGda?=
 =?utf-8?B?Ni9SdkQ2UjA2RFg3V1VOalRFOHFvZWY1ZUoxV05HSTZHNlNiT21SbW1hTXda?=
 =?utf-8?B?S1RvRzRtVStPRmNNMWZRRk1YZDJjeEdZb2lqOGJQTXBQYUJwMnRXWnUrZkp4?=
 =?utf-8?B?YlN6ZkZzTVk5ZkhzNkxPZ2llWDhKbGptajJsZVJFcHMyWkY3S2RRZ1hMek91?=
 =?utf-8?B?RkFndnRDNUJRQzJXTXF3VklVaTZPSnJwd3VqV0JKZkFNTTk4K3VZZzBXZ1dx?=
 =?utf-8?B?c3MxU3NHWGVlK3lsN05ITExVa0UvbnZ2NlErQmlhaHFmNHhENlFDek9MMGFJ?=
 =?utf-8?B?VGNVQTdkSkRWMkpCSXZuV0QvWXlHcXcyTWhXdEUxc1NqYUNYVkFSWVQyU0gy?=
 =?utf-8?B?MTZ1c3c5K3NHVjJTWktpRGRkRm9iMXlMMFk4aUl4cGZ4MU1JNnIzMHFKcFpv?=
 =?utf-8?B?RFBva21kUjBFa1pOVFpXY0dKV3pvbUVqSlNsRk1TVys4WDluTVM0VVlhRWpx?=
 =?utf-8?B?V3RUN2JSRE9Wb1JkYnpKQUJYSEd6NllQcGoyRHRmQm5pYjdzYmFRWDgwcXNX?=
 =?utf-8?B?N09QZ0wwT2pOWkdhRmozS0U3YldSNmlrN3FtUEgzdVBOZUt2aE51Qy96K1FC?=
 =?utf-8?B?d1d0ZHJTa2lVU3IvS1dzeDlFamF0b3BUdkhZd3AzZVUvWnZWZ05TUkZGZHpO?=
 =?utf-8?B?WmlJVG8zSlJ3YTZ4dmRubkZ5NWJ2RnNyeUNWRlhHU2VmNnYzaVlCeUt3Mzg3?=
 =?utf-8?B?VGNhZStFS3JsWWpqNFhtZVRITjh6aVMvd2kzSG4xMXQ5WGpIcjIxVDFWMmlv?=
 =?utf-8?B?Lytva3NsNTA1SVJlT0NGTTZESEdadUNzVmVWejV4ajJxbkhRaDhZRGkzZnJY?=
 =?utf-8?B?NWJESXBLUHBQM1dIZ2dxS3kwVUhHTWxTSVA2NUZKUVNVUlF0ZHNxWU0zMzVa?=
 =?utf-8?B?MEMrbENHZGpoRDNhWXc1NENDbnBkWmxsTEIzUFpDR1lIdjlTajJMSG9URWJn?=
 =?utf-8?B?T0Z6RENES2hOb01aVngzR2x4SjliMTdsTWtrYUhoVXh2RWUrTnI1dWoxOW4y?=
 =?utf-8?B?UWxpcW9jWktIUkhTSWpUdXBUM2d4Ui9tOWc1eHN3RXJIbG8vUEdwNmFLOGkw?=
 =?utf-8?Q?HYV7fAGBmYEeZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2lzU1ViQk80TVFyTkJHVk8rSkp4dTN5dmdza3dxS2F1NHJpM3BhamN5MFVB?=
 =?utf-8?B?My9NU0g3ckpQWGM2WlVNYWF6UXI5MnpYcytNbmZzak1NMktZT2c5UnhnaklE?=
 =?utf-8?B?WGxxc0czSm9NOFcyTXRPZnRodjFjSm85eWllY2JPSUQxTzJrd3NObDhydHJx?=
 =?utf-8?B?cDZZdy9PQTN3Uk5kQ0ZJR0VvQlY0TXhTdWFjZWZWb0E5eVlkMXFkekFpU21J?=
 =?utf-8?B?ZzRLQ1NpRUtyU2piUVZFR2xnSVNvcnh2bnJCUndXdllqUFQ3Z0hYcHVsVXVp?=
 =?utf-8?B?cmNTK3NmTS8zdDVndm13YWlhZ3VYRnc1ckllV1FUVHA0R2xLYm1OTWtLSFh5?=
 =?utf-8?B?YUpPdGdwazVWOE8yMVZDdC9WWnFyWDV6MXBPY2NTUEtMUnVpNWtIeWdiSmtj?=
 =?utf-8?B?aWtUcEdzRmowT2NsU21vOGNhT1k4UFlNWmNpVCtjMkF4dWVPbHNQMzBKWlBk?=
 =?utf-8?B?TWc2ZVR0TVVtUUNNVFhxL2JQaFVXYUxvYVRMZENpSTUrYjFadmFIUk8xalBI?=
 =?utf-8?B?SkRwM3ErOXVsK0Q1ZVlTMEpEVi9OcUZqeE03QTl2QnRaQ0ZnL3o1ZVBIQVhk?=
 =?utf-8?B?RVltdDFrRDhZMkhoeWVsSFNMaEQxT0kvUW9DMWdqNDd3R3JqTUV2Z0NXMEhD?=
 =?utf-8?B?TWx6RmFuTUlWa240dzZpMmhsKzdQc3BQL1lCYkZRVnA2bElXUXZIa3lxcnY4?=
 =?utf-8?B?THE0cnZRRXlUcmJjMkRpSTdIN0x4SFVJSlpSc1gyUFRWVW5XNkx2dG1OZHRQ?=
 =?utf-8?B?WGtyQkJIK2NoSWp1UGtoVmxiMWlOWWhKY3JIei9tcGpiWTd3amN6bmh0N2Jj?=
 =?utf-8?B?RUMvWGNaSTdqY1ZiejJPRndlVmppTjBML3ZDODRWcFFRNVRsbWNkanpFTGh2?=
 =?utf-8?B?TWpYS0F4WFBOL0NuR2IvdnBPZnA3b3BOTGd4Yys4NG13ZEhyMmNHQ29Fcmxx?=
 =?utf-8?B?dFBtajdiZkVabnhRNTJPWnVGQ0ppWnhyY0d5SXlMa1NNZXFWeGlldmNXWHUz?=
 =?utf-8?B?SGIyTFAwR0VoYXdHeGQzOUF2cUZENERrZndyaGVsM3Irb0tWaGtxZ2pXbVNh?=
 =?utf-8?B?YkpTRFJJdkNoeUN6TXZvd1gzYzVkcmQvNEsyMXVmNmN3QmI0RlZnNXg2MDNY?=
 =?utf-8?B?Vk81TEp1d0ZhMFZSbkd5UmhuMzQxRGt1Z05oc3d0N0JWWHpQNzM3Y0V5L0hm?=
 =?utf-8?B?T3VGcFMxQ0FvdHg2aEhBVTJWWjF5NUFoK3Q4eFc1b1NHWGVySHFqSFRYTmFP?=
 =?utf-8?B?Y3JLNmFaQ2lvOGV2Z0VnV2ptcS9vZFdlbTFFL3FvbEJqckZFRUh5bENkeVF3?=
 =?utf-8?B?aStRakxvdTJNbktYbXcvdWtQM0p3TGRtRjRzMk9Ea2QzelYraG1rVVEzSTRu?=
 =?utf-8?B?RURzT3c3UHFidUV4a1lkQ0NCRmRBekxaQ1ZFSy9BZUwyeXREMTVrbmlxdTlD?=
 =?utf-8?B?bElIKzJSOXExcEpGRm5BZXhlYklqT2ZzZGNrdlBra2dvaFRvWVBaTzJ6c2Jr?=
 =?utf-8?B?cGNkd3c2aGdqV2g2MVN5eU5VcDVHSkozWmZZOEQvZ1crNGo4OVJ4NTliQWFt?=
 =?utf-8?B?c2hhQlVtQk9lbEJ4OGkvWkZoTGp3eWFqak1HcmpGT01JVVpDT3ppbHl2M3lv?=
 =?utf-8?B?VGRWbDB5aCs1anMrSENnMFlyVjBDQzU3TXRwTC9FZVBneDZBa2UyOFpLSVls?=
 =?utf-8?B?SDIrWUFPRU10Y2lNQzlqaGFBM1A2c083TU83NUJSVHViUEswUG1pOTRJaTc3?=
 =?utf-8?B?cWFYYklpYXlnayt1dDhUOURvQ0Zta3Z4VlRXeUJFWHNNR1VxQWdSNFdZM1BI?=
 =?utf-8?B?aGVzZnVPbHozb2FMbzVXaFptakYzS0ZiN1FpUFVOVGZ4OWlGUVJha2ZtOGNM?=
 =?utf-8?B?NFZlT3dyZG45RUZ1Sk1HZDdHdENVYVViZU42K2pQdS94dWY4Q1VGN3grUUlk?=
 =?utf-8?B?M0ppT01iOFF6ZkVkbStCb09YZHlJTldscVplRFZCREF4R2JmRitVVmFTcktp?=
 =?utf-8?B?L1plZ1o1ZllHdks0emo2UnZOeCtLR3dnN1J6ZjBERDJWMXV0RlFhWldTS0RX?=
 =?utf-8?B?bnpMKzVIOEx1NUFYUmxidXR6YjZnK3dHMDk2aXY2d3dvR211c0pUNUhlZS9Y?=
 =?utf-8?B?RHk5WGlCckNaWGR6R0FNZko2TDl0QVYvVzR2bzhZUitKSi9iZG5MSllTWXl3?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f946ed-553c-42be-92c7-08dd1e7dfc23
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 09:34:20.8676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8vcay0tjEg2alIV2h+QzFgHAwyNvqTk+YEUas1JQ2tK30LLkNeq806uRrysN3bI95asWZvywlyTdCsHyiTTJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
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


W dniu 16.12.2024 o 14:11, Dominik Grzegorzek pisze:
> igt_require call within ccs_mode_all_enginesi() when
> condition was not met left fd variable uninitialized, what
> caused xe_eudebug_enable in the cleanup fixure to fail like below:
>
> Test assertion failure function enable_getset, file ../lib/xe/xe_eudebug.c:1795:
> (xe_eudebug:23606) xe/xe_eudebug-CRITICAL: Failed assertion: fstat(fd, &st) == 0
> (xe_eudebug:23606) xe/xe_eudebug-CRITICAL: Last errno: 9, Bad file descriptor
> (xe_eudebug:23606) xe/xe_eudebug-CRITICAL: error: -1 != 0
> Stack trace:
>    #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>    #1 ../lib/xe/xe_eudebug.c:1851 xe_eudebug_enable()
>    #2 ../tests/intel/xe_eudebug.c:2870 __igt_unique____real_main2757()
>    #3 ../tests/intel/xe_eudebug.c:2757 main()
>    #4 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
>    #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>
> Fix that by using xe_sysfs_enable_css_mode library function which opens
> drm fd before calling igt_require. As here, move the check outside the
> fixture to simplify code.
>
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   tests/intel/xe_eudebug.c | 38 ++++----------------------------------
>   1 file changed, 4 insertions(+), 34 deletions(-)
>
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 22b0da658..c566d0980 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -26,6 +26,7 @@
>   #include "xe/xe_eudebug.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
> +#include "xe/xe_util.h"
>   
>   /**
>    * SUBTEST: sysfs-toggle
> @@ -2729,31 +2730,6 @@ static void test_basic_exec_queues_enable(int fd)
>   	xe_vm_destroy(fd, vm_non_lr);
>   }
>   
> -static void ccs_mode_all_engines(int num_gt)
> -{
> -	int fd, gt, gt_fd, num_slices, ccs_mode;
> -	int num_gts_with_ccs_mode = 0;
> -
> -	for (gt = 0; gt < num_gt; gt++) {
> -		fd = drm_open_driver(DRIVER_XE);
> -		gt_fd = xe_sysfs_gt_open(fd, gt);
> -		close(fd);
> -
> -		if (igt_sysfs_scanf(gt_fd, "num_cslices", "%u", &num_slices) <= 0)
> -			continue;
> -
> -		num_gts_with_ccs_mode++;
> -
> -		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) > 0);
> -		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
> -		igt_assert(num_slices == ccs_mode);
> -		close(gt_fd);
> -	}
> -
> -	errno = 0;
> -	igt_require(num_gts_with_ccs_mode > 0);
> -}
> -
>   igt_main
>   {
>   	bool was_enabled;
> @@ -2856,15 +2832,9 @@ igt_main
>   	igt_subtest("discovery-empty-clients")
>   		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
>   
> -	igt_subtest_group {
> -		igt_fixture {
> -			drm_close_driver(fd);
> -			ccs_mode_all_engines(gt_count);
> -			fd = drm_open_driver(DRIVER_XE);
> -		}
> -
> -		igt_subtest("exec-queue-placements")
> -			test_basic_sessions(fd, EXEC_QUEUES_PLACEMENTS, 1, true);
> +	igt_subtest("exec-queue-placements") {
> +		xe_sysfs_enable_ccs_mode(&fd);
> +		test_basic_sessions(fd, EXEC_QUEUES_PLACEMENTS, 1, true);
>   	}
>   
>   	igt_fixture {
