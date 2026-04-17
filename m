Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06154F8E4AD
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 06:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A745010E248;
	Fri, 17 Apr 2026 06:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2uXbI91";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5549510E248
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 06:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776406651; x=1807942651;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K21QwJ/go5EMB7rLNg8Pxiz+Abc2YmA0D9vfhlkTEfw=;
 b=I2uXbI91t48vE6su3VNCDtD6nnGOWqWrjD58DYa8SDNg90sqUattNo5g
 iJLDH4eJ7SnzAMUFlCiIU/BNTT5I8b+d3VSdclvpyDVwk8L++36lsTeGz
 9TNeSoT92GJh3aBWaRbXUEL3Ki8VkrHrvYAVGJBe+GDgt5L5k/N4V2eCu
 obqCJJw2oUG6bKPtN30qbuvVwlA+f2BMZzAMDERYUr80KMdeH8fp8c1vY
 L+04We/k7MH7hsSzo4PHjFrc9AlzukzQsnLY3ejyAMTLEKmaAv0rHzSaW
 N4/U79pc4nK1TW4VgOo7EQsGUKxL3Y8mT/Zd435vDV1JonreXklO1JMZp g==;
X-CSE-ConnectionGUID: B678vOQQRxmuUh5XM1cZgg==
X-CSE-MsgGUID: eI7krZDATJqGRMgOzAXxoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="100064977"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="100064977"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 23:17:31 -0700
X-CSE-ConnectionGUID: JpaI4ULaTsO7b8Gu2neX5g==
X-CSE-MsgGUID: ColB0fQyTTa57l1uLNn49Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="232702081"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 23:17:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 23:17:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 23:17:30 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 23:17:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biIWyv+5hzHg3VJ5x+RkJwOngjY+GBGmR0pdBTSldoMrxUs65Dr2LGPFmcf2RQfVQhSnqYVY4aCndVwo2kDVB0+urEoe1cl6JNL57ui/0K2SnKAHlsDlRRtfxBAAHt4TZANcf8cCXL6qqbbs/lWe4v/N1cZp0av//ilmyULb8/0fM3rMpuB7b68Bib8j73AKfmcXBvkd7iex0zR9ky1SzoBB5y9ZK16cJRgPSIeq6hzFcGkqRoifQ+NTHxFbWstLq8ETvml6v0+C390BqwezfinAe11USJJNC5nqCWoyNXJahRL5itK8ZtiKKcnMFsXR+tByGT0VKn+j+GJceAR02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K21QwJ/go5EMB7rLNg8Pxiz+Abc2YmA0D9vfhlkTEfw=;
 b=lIGNInA7mcaeZg3hHNfq4AwibcCmEPJHNfqGlr+NejZDTzQPHnu0Qqgd5PUBdaVV4VTLrp0upLIQ1OiRs0My83xNOkpf3ZvZuB0y4b352XiLTB/oKPhiqcTM0XgrQe5sIyAU3B4E9PEmBvaDYBrw1MwtS3AUGY0ZtU+YDFRcv0uYc31YDzBSN0Z6uAM7c0RfdNAc4ugKcj2pYgsmN5/aKgwh1iPAT4Md9qSeQJSSztJ6IPmZ6qTSt5dNtgl3Wp3MMFZxogvSUd7CEvqjtJwNz09aPmppbrRlRftbk59jGmOD8Nj82ZL6993d+JOXNX/u1a2VgDNyfQNY+zj1pputlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW4PR11MB5910.namprd11.prod.outlook.com (2603:10b6:303:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 06:17:24 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 06:17:24 +0000
Message-ID: <3bd2ed35-97b4-40f0-8d18-21e23f697826@intel.com>
Date: Fri, 17 Apr 2026 11:47:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with commit 1b85a9b04681
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>
References: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
 <20260417041031.2187889-2-ankit.k.nautiyal@intel.com>
 <4b8f88f0-e1c2-4702-a262-651b3104545b@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <4b8f88f0-e1c2-4702-a262-651b3104545b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::24) To CH0PR11MB5332.namprd11.prod.outlook.com
 (2603:10b6:610:bf::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW4PR11MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c68e3fd-1464-4eed-7bf3-08de9c48fc03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: bo4psKZZ2TrPMwziRcAuk3yGE28fd2ERD8BbYgaCb31NRYsQBCd3vMLgL2+wpp/UHM6th8kf8lpUKlMPW2yvYA8UbH5Q7t11CLK0HvOS1qeqsfZInThBxFa4501JZjY9rDHMEgBTCa+kOjFybGzEYl320QzyZOBC7mzQmImn0r7kXLsAzJAac3SqMLjsk9n3ElqQXlQzkI224H9pA/jlcljUB1oCFaistT63QFLBAz3XSkcfwEUDAwyidOiVx9I+4XA/RAuwNOvWPckg9floKTQir2jsXS1BlpOwNLJrMnhURMOMHJFxAn7hWXdCafDOxHg3o9sUpfcC0q7m3U022eRULFfJNnzaiJDOagHR85Cud3wihWh2VGHmJTDf/zcSepJb+7fhlsp9330S8MDQ1am3rwFTos7b7sW8Uq8fKZTHGNaGZOZ90+xyW3+4M5U4s7qd2ScQh03fhC2zr+TTN9ONt2QQ6tRDxBABXqP3wLPvMNbiq/Gh9hHU7SxFIJ2nwBNwOrM65YDTihFma+BXpHu0Y63wmQBolgwg6KMDKGi7TfHR/CTqsIFxoaAeKCfgF1B9o8kShbw26cKDd4GMvdsy0gMOuCmALmvexpuh81hIyL/FwXE7f5w4t+7JRuthAwgYw9gzxgAkOmiMnwtfGNHJlb0mGEzIMBQ9EreL3dIaSo4fQatIreTdgImDivpzjQVtw3t+nSJutQcdB6USjkXSVPnRoytNgvExOl8fyaU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlhMQ3Vid0RXNlJjQkNyMU52djk5WFltZ2ZrVm55bUZRMWtIM2JLZEV3d2k5?=
 =?utf-8?B?SUVhVGp2czRnYnh0aFZzUU9EcEN6SWVhdzdmOXFrS2pUYU5LSXJ0d1VGeDUy?=
 =?utf-8?B?bnFHdWFKUnIycVZSMEVkck1lMDg0bnlieVFSR2QrR1RjTWhSVEdGZ2dORG1t?=
 =?utf-8?B?S1FlSUtxR05QTkJQcmRPNnFKMFh5OFhNei9mbnpoRUc0YlFVUXVCdWRQR2JW?=
 =?utf-8?B?dHBnbFc0enBncVo0UkJqc25uOVlNc2J0Q1RyeTlhWTV3ZGFmdWg5UmhrZkRj?=
 =?utf-8?B?cHpzQnVXSUpocjFUV2RjQ0RXVHI2cnJtaDBwTHorbDFpR2ZaeHI5U3g5VnRQ?=
 =?utf-8?B?WjdCQ3hWTkloSDMwRHo2V05GM0FYWUZheEt1Uncvb2FFNFBrclh1VDdrRkFn?=
 =?utf-8?B?cE1ZaU8vR3Arajc0UGROd0hodnNTZVlhdGF5R0FsZ3dFbjllMzd2TmRhWE1V?=
 =?utf-8?B?T0NUS3J6WGk5RkZuWmRpamNCdmd1Yk9VUTYraVFkc2tzUWhJV2FYK0c2T3J2?=
 =?utf-8?B?K05XNm5TWWhwY3YvTmdGUVNFMmR5TTd0eUN0dTRCRklCbjBKaGgwU0pVeThn?=
 =?utf-8?B?RnZGc0lveU14ajVHY01scHg1SEJQeExVRlJFSEFTbXc1NW93b3JFSG0xdG1h?=
 =?utf-8?B?TVBYZWJ5b2VjMWdRT0ptQm9qT0tWTy9jTk01bytrVU8wMWJweEV5czJPbk1Y?=
 =?utf-8?B?VWFQWGk2eFAyWndzSVJuTFMxM2ZkZUFnamUzYklKV2M5YUtFbldZWk5hS016?=
 =?utf-8?B?eVZxdFlXeUlsaVFnbXZlbU1RenRQdWZFaEx1T0d6cG9IbVN2MGt5cEpRd2tG?=
 =?utf-8?B?N0xjbnJlVDBvT0VvRjMvLytsYlhTT3dBd2ZZeC9ZQ3dhSk94RnRMeVNBUE0x?=
 =?utf-8?B?aWlQSnNrNHJncGJNYjloVlQwMEFNRXI1NE1ISHdLZncwMWlYRzVDcHFpdzIy?=
 =?utf-8?B?SkFwSFk0UnBZbmVsNjZTeURvNHVhRm1odVZWdktabzJXcC9RVTZZUUFOOHRl?=
 =?utf-8?B?a0VHQVkzZ0grMXROb21HU1haQ3VuSDF5bUVjZTJTYTRCRjA3aGRYOHJ4T2c4?=
 =?utf-8?B?TlQrZkc5YmF2TExwR2RFa0FOTTl0Tjk3aWlzS2FzL1h2NDlZWUJSbWRDTlFL?=
 =?utf-8?B?VGxMZGJleXJXVDAxYmoveldXNXRTYU51cGpHS2JBcm5jemV6TnlsUE1kWmx5?=
 =?utf-8?B?UjVGeDVlS3pwSGUzb3NVSytJV1Iya0xQRWVGS1RPN1N2YUdKZVllRVF6cTIx?=
 =?utf-8?B?a2dhdmR6TllWMkMxdnQ4RjBJNDVsQldub1VmclFYYUlpb2N2QUNOZitqOWov?=
 =?utf-8?B?ZmkySUh6am5idDFabFVxVTlMT3NSL0NzQ2kxdDdGTHd2RkhzTGRRZjJFU3BB?=
 =?utf-8?B?ei9RTTNPa01RRGVTUlNOWkZmT0FXTG53dlNGcjY5SGtmSVFwM1dkTDMydTZV?=
 =?utf-8?B?NUFSa3hRSEFZT0hOT3psV01vM1dLOXRaU1lQOE96Z29OcWt3azVHTE1jKzBI?=
 =?utf-8?B?UE5ZR2paR29QZ0tOK1VIVVNoVFZCRG5iaU00NzNNU0srNkU4WUN1V2ptV3p0?=
 =?utf-8?B?N3VmMjduNXVYOThjSTE0NmpuM2hSVmdBR1V4RXR3eWx6UktwK1B0RXhzckxB?=
 =?utf-8?B?andFMU9KVmNZNTdqQ3ZxcDZRNDRnd0FqUFowUmQ0Y1NNRGVqZUFaWTg2RDdB?=
 =?utf-8?B?a2EvVzh0L1dkLzhFTWhqYWZJUndKa2ZCdUQyV3JOOVNwZnNCZXdNZlhWUmlF?=
 =?utf-8?B?TlBHNnVZTGx0TzUyVGJTa2szTlIvdjRmR3VROGVhVkgzN281U0xYOE5NdFRM?=
 =?utf-8?B?VWFWOEljTVN3cjVVRVZ2dTJEd2x1K3FyY2dXOTQ3L2kxZFNIZ1E1dzNtd1Nx?=
 =?utf-8?B?VWh3QUZKMHQwaTFwMnV4T0IvNkVTL0w3RFlXWWNPNTAyVE5JNlg5K0hjSXZx?=
 =?utf-8?B?bllUWFN5MUI4Y0Zhdko3L1pBTTJWR2JkNU1ZZ0RFVlhvbHJKbTEvemY3NFh5?=
 =?utf-8?B?YVJRd1UrRkRZWThMRi9QTDZsc1BWQ0IzZm4ySUxOeWw4OWxMK040QVBkTDl2?=
 =?utf-8?B?d1AyZUhvdTNreGRKZ2FTcFdKSnN1WDZ3K3FGYXcyaXFhRklmUlFKT280UGZZ?=
 =?utf-8?B?Vyt5QlVaTDMveTNyWDhDQzI2dFh4Rlk3YUtoVHlxR21BbkloUUU4dlZNRjlZ?=
 =?utf-8?B?SU0vT0ljUzlDR0hob2FNaG1ZT1dsVzUyM3FxSkhKWXJWbkRUcStRUGNMcVNO?=
 =?utf-8?B?LzhDbndKd2Y1YStDRDRlOFd6UFlud2IwbzRCTzBUWk5Ray8xWGU3amZEMXZz?=
 =?utf-8?B?WWZhZmdCcERSbUtaQ3p2MFdQSUlyTU1JdFZPeUx3MS9HYVY3Q2Mvb0hBZU5s?=
 =?utf-8?Q?ZtYdWTqN9fyFnA3Y=3D?=
X-Exchange-RoutingPolicyChecked: iEbTw9lGNdc+XVNDR54laa32Qu3xpZSSq9kOeP9mge/INVjcWvmQ92Ky3FmVRkMnadsvccplHzCJdUaoRmdXqJLu5kw+frSyXMxjBgtKVeooypvHL49KyEOXXfn37vR1OZ0EsAGPnyaAA+sfMc1Zq5SbZ4YXieNqqUwKkcrZ2jqZLq13N/fhYAXsEUXiipUPvVUYx2sH9Kd4kIxXfVWipQ3+W3n4ooV5dp63WcH8GtMmkv6KX601TxKJ4pTQe+4kCG3soA6wPkWTGbpqwJ10HRbxcdjsWaKxNJEdpdVmVKZyF9RZnmdh1il63ii926oByNP9d1oqh2nh4B0HqSK+lg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c68e3fd-1464-4eed-7bf3-08de9c48fc03
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 06:17:24.0298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QdgyqqzHqgYqdQM8EtlQ9Es9/Wr2rE2CBYyFodFcKDrxk7/BG3qsW/nmY5+oV12ukaql56qezdDnpUmwOULuXC+XVrqcz7fhsFkjCdrENWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5910
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


On 4/17/2026 11:09 AM, Karthik B S wrote:
> Hi Ankit,
>
> On 4/17/2026 9:40 AM, Ankit Nautiyal wrote:
>> Synchronize intel_vbt_defs.h with kernel commit:
>> 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
>>
>> Bspec:20142
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>   tools/intel_vbt_defs.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
>> index 6612d3a4ec49..550a9bfba868 100644
>> --- a/tools/intel_vbt_defs.h
>> +++ b/tools/intel_vbt_defs.h
>> @@ -1090,6 +1090,7 @@ struct bdb_edp {
>>       u16 edp_dsc_disable;                    /* 251+ */
>>       u16 t6_delay_support;                    /* 260+ */
>>       u16 link_idle_time[16];                    /* 260+ */
>> +    u16 joiner_enable;                    /* 261+ */
>
> The variable name should be 'pipe_joiner_enable'. With this updated,
>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>


Thanks Karthik, will fix this and send shortly.


Regards,

Ankit

>
>>   } __packed;
>>     /*
