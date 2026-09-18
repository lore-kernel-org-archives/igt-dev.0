Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D805C982D8
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 15:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FB610F3F4;
	Fri, 18 Sep 2026 15:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cr0MM0bM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7085610F3F4
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789743826; x=1821279826;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W7YnLRanFeBd/qWaEDkkD5BO0xmXOtnSJHb8IhypiWw=;
 b=Cr0MM0bMgcsumup8M3x12zagLvJWgB94/w4N4VN8n4nE9LyZXrfVMWz0
 NhPKqvgl2nifTJDET3JbVKcLL79kl4/nviELsMB2MLZ6xM3T5xhOAKRGA
 kHH7D6DJGPSqQvs0gd7l4HNDu9PA7+sjoW+fwtQhqIiMgwtzE3tLuDYff
 Q0se7Bi968N9BW9c0j8EMB/4dHZ5ih9Jo4dXvGTl0OrcmnuDWkX6ADLzl
 hVmRKHwRqrPMSUzv/YppBCgnPBrlq3OmrD2BhGDTPwYvCfAs3qHNOnkZN
 xD4qKThXCAO8hc55F+xtFhvMYzKhNgISeCr+7XHBsrMwo+Bu5dYvQNGbG g==;
X-CSE-ConnectionGUID: 485eR70mRTCGKZkqQRyhtQ==
X-CSE-MsgGUID: 66WwqBWcT4K8mFnffFsNBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90123002"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="90123002"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 08:03:46 -0700
X-CSE-ConnectionGUID: so2fWNRtSpebGIM5ZR1wbg==
X-CSE-MsgGUID: /Dac300gScaMTCKhGwXNPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2645356"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 08:03:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 08:03:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 08:03:45 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 08:03:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXiLZzLeiTL6bW+HrgJFEzzDbPYQ36iFH3n9IkdwneoF6u3P15mYak0VFAr0i2kCJpGl4aYYy+TaU99JV0nATkuVzlNt/8CUJb4J6S2xIcWID/EFgzrzSXTY+dynsjD5pfk4EcoBB7VY4vPyazFPSWmyfr969B+wSGQCKiDfk4bBLejPjOG1ILEZb1UfevhSzsRC62mkQI2wHbccs1gzUuM9xYezY3hOUtFEsk+HLU11V6BuoojS8jl0nSropGOvGdalrXncQz7WCZZIzoopNJ20D0Q6G7QO98jmPQ+tQQnRd0L+I+7lceVjPsrNdwgAH3z/HImsz5RPg0D4EuwaHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuEkUpteOCzDP12DQR6IS9epEhUPt9nCfpqZKD1DFPg=;
 b=jhMNNcvPJ4f0xw4ISHzbmsIm6ke5r5IzGCRlP9WtaXnmPKj4X6tpmcH0YV4wga+N6SfjnDe79kcle3+1S1+tQyjlvnoRobLqUVLUipVkei0+ByKrteLJsMdF3rqgW+3vA2af6lg2T5itYWm9rg5+5qfKTpVUHTdvdJdqFltrkeqZVYFrNzYzreEVzRshkprW+RHgFzRUMdCvaq5vkYufeLX19IEyqFMOAltAuiCCmWhW5eiDKQPY5CiA4RqrWO9kmp7xNH2s7u+hN7xSdbga7eAM6fKeRBoSLHrIryHzpJbUNqM6HjrbP1iIrVJ/WoHU498koerXmnITPfb+4RhYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Fri, 18 Sep
 2026 15:03:25 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 15:03:25 +0000
Message-ID: <ecc0560a-f5a4-4ec6-a90b-8509174915a0@intel.com>
Date: Fri, 18 Sep 2026 20:33:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] lib/igt_drm_netlink: add event notify
 subscription and event wait support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-9-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260903073335.339540-9-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0271.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::8) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 122c8741-bb38-4060-89cc-08df1595fd33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|6133799003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: k0aDiKfS7y1+bGiorwdL8+0qTDXofoTYrndMjr0VdUpBt8aKIgjhwK7am4W71sv0dQe6fBMNMaZ3e10WL6aGKp3NxBee237n0iuLttQtyf2SzwHo6KeDbLn8jfB2uPyFLOcKBu/If+LJex6Iq8bWLQdQZsViFqm3p4dF1VvVIQyuqaN+6OiMtpt7nDB2URPNT0G20U8hF6ZwEhvWDFpJRdTEdLKjbulaUbI7bx5tYrWGzoy2j2lzXB3NkwY7OTb26Gel6E6lr9eB3rr23Gmqc3Zr3sWsxKmKqN7lpL4PijDo95DHjz+SyGDWTd/cf4+OFHhxkiEq0OnJl8FBKraeOxy8SVcKFs2nnqBgIWGlDvqEStMzZM4j4dedFhX8soVxaeLZ4vDud+cK7U9A8c1VcygKsBvh1WnkTE9Cdezo1r/fkge2j1kKd1HFLlgFvOO5A9wMwKJWScNazWV7F5HsgMDhI25bDe70XMuNZEJsKcg1E5n3papR+VHV3ktZp+TQYMwTqcmWWvzLNU4d2+u1Ped0weuJzPfeObfOkVPCnLOguVzpfWWEAn6s06vFqmQcbDltl5ubiOh4nBhMt0Bb5/+FzgqRTjSETfpc2FFSe6R7xEB2nVyiqNUWqAELaxsubcH77u7Mca1+Bj9nPvITQX8y3Qqdiog4pr4Gt6dZx0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWt2MmhHVlluQjc0cTVjOU9VNnBlalFvQkRkaXRrdUJxWXcvakk0WGdWS3ow?=
 =?utf-8?B?RkJLU3E0cUt3bjNzaUU4ZDc2R0VyOEt2Yml4ZFF6TjYwQ2xkWE1yNlZuRm92?=
 =?utf-8?B?WDc3RFIzWFhsZkNZSEo4a3hiUWdjdWIwdlNxNHFOT2huU3M1MTB6VFhWWEF0?=
 =?utf-8?B?V1lKZGkxU01VODNtS1F0ZDZVRkdPVzVLeWl6ZUl6MW80bCs4RjlOb0VxMmhZ?=
 =?utf-8?B?WGdCRCtQajRxdlhsdmlZUytVSUpsQ0dvVS8rZFEwOThpTXNIeFdpTXVxdGVT?=
 =?utf-8?B?Q2lYRXpTUXpPcG05NkIvSXpJRHcxZ0RYdzRUdERySStSR1QrREJYaXd4UDVN?=
 =?utf-8?B?L2EwSXZscGh3UGwxd0t0dUJoZ3NkY0J2cTRZZVZrZm42bjVTdU1oTFFlaUxz?=
 =?utf-8?B?SkpETUx4NXJPYWM5cVdoUThoc2lRZG9sb0VEbXBOYkpSVWppNHVUVXU4K0xB?=
 =?utf-8?B?SnlsTU9jR01QNDUyMzNBQitEdm96dFFlTHdrRndtQTlvMjBVU3dOc3ZDYmVC?=
 =?utf-8?B?S05HbWI3RkI4emxsM1I1SklKbzRTZ2JxOHh2c09FaGxlTU1CWGIvQlN0OVU0?=
 =?utf-8?B?UzNBR0l2MmJFdldRc1NZbmVvSXZIV2ptNTkwRnZSTnJTak9iWHgrQkNSRzRz?=
 =?utf-8?B?cVhFZDdXS0JPVXVjV2NEOXRmRGpORldSRCtYckZYckVtODdzcCsyRnRiZ01q?=
 =?utf-8?B?SW8yeTZjTkdtdU90bXJBczNYV0lkdlA0elhPdFpOVVkwOG1ucmRaTGpQS3RP?=
 =?utf-8?B?dHphZE02Z3MvYWErSXNEaEhwK1VXSGhsRkkxak5OVWw3eDg1aENEWWVtRVZN?=
 =?utf-8?B?QXFtOHRDMnFJQUdGa2VEZTBtTjYwQ0Rzdk1UWEw2WU5LODlNN2s2MkZ1K3U3?=
 =?utf-8?B?dzNvS0tzR2JsN2VhekF6MnFRRXhkbm01Q2JGWkZlZmQ2M2Q1ZWhqT3FjdW4r?=
 =?utf-8?B?b2x6aldlYXRkZi9TUWJDT3REL0U0TzRBVUNkdlhGakExVis0TUt6VnlQSXJW?=
 =?utf-8?B?MUtlRURPYmJIdXVMajJ4VmlZRGVVQ09laEZlN29VZnBUQm9BamdkVUZSRmh2?=
 =?utf-8?B?MTFqZWRRaWNSbkZ5WnYvbTdFblY5Z2VRdy96bEtsNjdmNkZDVm5hUUl0UnFt?=
 =?utf-8?B?RFVCU2FsYk00RkE5TEhOUGZuZzEwSThybWs3TDFxMWFrWEhKcHBvS2VpYTQy?=
 =?utf-8?B?Mmp2UllGc2NWMHVHQWJrR1Jhdlg5V3VvL05kSC9SMnlrSWVtdWxkamRjWUZy?=
 =?utf-8?B?RmxWUURCalpiYUFHMUgzeUM2MmtYOUFkMVQrb3VHUXRBNVh4UzNhUmpzQXRx?=
 =?utf-8?B?VlUrbjk3MVJTTkdZT3p5ektMQStmZXZjZEhiYVhuRGFNWXh6S1BpSHhWUHky?=
 =?utf-8?B?L2VFR2RTSG9Zek1GV1JpT1R3Tjg1STRJSkZoRXhKUTlqNjl6U3ptNHo4TkV2?=
 =?utf-8?B?elpYeEg2S2xmQVNtbVdKL29uQ3Fid3Nhb1ZJV1AwL2RUME1VSm9wNUYxQU12?=
 =?utf-8?B?cUhkTTg2NTBpUElPLy96MWc2eFc4dEZQaGpBeHJiWVN3WGxSSjlaWFRTd2pr?=
 =?utf-8?B?YWRkNmIwY2FWaGNteEttTEk4Z3Y2d29wbWZrQVdnZW5saDVIVXpJWmN4cUJD?=
 =?utf-8?B?ZDNZNnZJK211QThLTTZtdjRsOXZVdG01QzhLb2FVSDZoTlMvTGN4aGNHbW4z?=
 =?utf-8?B?V2srYVI2cFlNZVphQzRpL3JWT1ZqOGxqekM4dmVBb0ZvUmNmcEhKdytZUDJs?=
 =?utf-8?B?SEVDcGhtQ29mdklIMjZqTGo3ME5hemQxdVB1RWdPYWhaMDRhYXM2MXNkMndV?=
 =?utf-8?B?MUprSU9IdzlhVlBHQ2RBbXBJNkdzQjhjMXhCMkNWT05WNjVqTzlrb1c0UEZE?=
 =?utf-8?B?TzNWWFRsaU5lbENub2dpeUpzcEZEYVVhdFdNaGN3RUZTK0xjcENNaXpKeFc4?=
 =?utf-8?B?cS84MEpEaDAxMjkzWWc0c0pMYjZ0S3hrU284VkJ1WFZoV3J3Vm5IVUNuY1Zm?=
 =?utf-8?B?TlZyQThUSkt4YWlidit1dnA0V1MrZC9GN3ZDQTFsdFMxMERkaDlwRU9NeGgz?=
 =?utf-8?B?cXJMaDN6K21PNG9VM0RvM29yWHlSQnplMFVYNGxTNmRnd0p1aFU2Zi9oYk9B?=
 =?utf-8?B?TUg2RndlN2RxbU1TWVZnMHdqZDV4a3phWG9sSkpFYzl0UDdvWHZPOWlabHVD?=
 =?utf-8?B?TDRkRjR5T3MyN1VrSlJDUFJUckhDRWxNR3JwVVJJVytDdUw3aG9aVHdwSjVq?=
 =?utf-8?B?SzZXTWxPT09BWTVNRklaUHlPNkdZeWQ4cUhEMkxuc0IrTWVXVTkzZTRPZERJ?=
 =?utf-8?B?TEtpVlRJVWk1cks5K1BMOUJOR0E2blBzVHhCUG1Mc0VNUVE3K05rTUJoYWFp?=
 =?utf-8?Q?VpidaJdHXU0kzpkA=3D?=
X-Exchange-RoutingPolicyChecked: A6zpw5aBDMCtOLAeg/rpcsPQahbtP+RVyIhRElqeJIhwWwSMT5j2Qo22N3n3k+j3LOdszl4Y8H9YOtsA9nWxVFGzWd2Td1f/NRzu3UJQRSIRmw8nM4vgrCCql9HxlSGHzTBIjhmgsKQfJilQlbwupEMnv81re4rhm+Xk4cFgakhyo9qOYmIJcQZPklheAF5Ih49F4DE590WdnVOuK97vEspVCa4he+WZCfwQaPii2vym3OeBYOZow+/IW3nu15rk08+SzcUvspOJ25A91M+qgi+yp+PL7RNOq5gMEDEWbqqhNzB67azH4RmzZp0SHlZ/iR/6DBhJxZxYwoOHJohUiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 122c8741-bb38-4060-89cc-08df1595fd33
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 15:03:25.3613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPHIfiy87acTgdCOJzZaDKqB/FyR+3diK45ojfwug4dukPfp83ZBTa4ClH3MZSOYvu4fIet0RfvsHrVTtsxzww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
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

Hi Ravi,

On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
> Added event notification support with subscribe for an error-notify event
> and wait for the event notification functionalities.
>
> Cc: Purkait Soham <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Cc: Jadav Raag <raag.jadav@intel.com>
> Cc: Nilawar Badal <badal.nilawar@intel.com>
> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v2:Handled SEQ_CHECK nl response using separate callback
>     Added monotonic-clock deadline to wait for messages without exceeding the
>     caller’s total timeout.
>     Added support to receive events until it sees an event whose node ID and
>     error ID match the requested values.
> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>     Jani & Kamil)
>     updated error event name from error-notify to error-report to align
>     with the latest changes in drm-uapi/drm_ras.h
> ---
>   lib/igt_drm_netlink.c | 154 +++++++++++++++++++++++++++++++++++++++++-
>   lib/igt_drm_netlink.h |   6 ++
>   2 files changed, 157 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
> index c0e3aff9b..6a3e475e8 100644
> --- a/lib/igt_drm_netlink.c
> +++ b/lib/igt_drm_netlink.c
> @@ -6,6 +6,7 @@
>   #include <errno.h>
>   #include <poll.h>
>   #include <stdint.h>
> +#include <time.h>
>   
>   #include <netlink/genl/ctrl.h>
>   #include <netlink/genl/genl.h>
> @@ -28,6 +29,27 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>   	switch (gnlh->cmd) {
>   	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
>   		break;
> +	case DRM_RAS_CMD_ERROR_EVENT: {
> +		struct nlattr *attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_MAX + 1];
Move this at the start of the function.
> +
> +		ret = genlmsg_parse(nlh, 0, attrs,
> +				    DRM_RAS_A_ERROR_EVENT_ATTRS_MAX, NULL);
> +		if (ret < 0)
> +			return NL_SKIP;
> +
> +		if (!attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID] ||
> +		    !attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID] ||
> +		    !attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE])
> +			return NL_SKIP;
> +
> +		ctx->event_node_id = nla_get_u32(attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID]);
> +		ctx->event_error_id = nla_get_u32(attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID]);
> +		ctx->event_error_value =
> +			nla_get_u32(attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE]);
> +		ctx->event_received = ctx->event_node_id == ctx->node_id &&
> +				      ctx->event_error_id == ctx->error_id;
> +		break;
> +	}
>   	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>   		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>   
> @@ -61,13 +83,20 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>   		return NL_SKIP;
>   	}
>   
> -	ctx->reply_received = true;
> -	if (ctx->ack_received)
> -		ctx->cmd_done = true;
> +	if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
> +		ctx->reply_received = true;
> +		if (ctx->ack_received)
> +			ctx->cmd_done = true;
> +	}
>   
>   	return NL_OK;
>   }
>   
> +static int ras_multicast_seq_check_cb(struct nl_msg *msg, void *arg)
What is the use of this callback ?
> +{
> +	return NL_OK;
> +}
> +
>   static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
>   {
>   	struct app_context *ctx = arg;
> @@ -121,6 +150,23 @@ static int register_callbacks(struct nl_cb *cb, struct app_context *ctx)
>   	return 0;
>   }
>   
> +static int register_multicast_callbacks(struct nl_cb *cb,
> +					struct app_context *ctx)
> +{
> +	int ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_SEQ_CHECK, NL_CB_CUSTOM,
> +			ras_multicast_seq_check_cb, ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   static int send_and_recv_nl_msg(struct app_context *ctx,
>   				struct nl_cb *cb,
>   				struct nl_msg *msg)
> @@ -263,6 +309,10 @@ static void reset_drm_ras_netlink_context(struct app_context *ctx)
>   	ctx->ack_received = false;
>   	ctx->response_required = false;
>   	ctx->error_threshold = 0;
> +	ctx->event_node_id = UINT32_MAX;
> +	ctx->event_error_id = UINT32_MAX;
> +	ctx->event_error_value = 0;
> +	ctx->event_received = false;
>   	ctx->family_id = -1;
>   }
>   
> @@ -407,3 +457,101 @@ int igt_drm_netlink_set_error_threshold(struct app_context *ctx)
>   
>   	return 0;
>   }
> +
> +int igt_drm_netlink_subscribe_error_report(struct app_context *ctx, const char *notify_group_name)
> +{
> +	int grp_id;
> +	int ret;
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0 ||
> +	    !notify_group_name || notify_group_name[0] == '\0')
> +		return -EINVAL;
> +
> +	grp_id = genl_ctrl_resolve_grp(ctx->sock,
> +				       DRM_RAS_FAMILY_NAME,
> +				       notify_group_name);
> +	if (grp_id < 0)
> +		return grp_id;
> +
> +	ret = nl_socket_add_membership(ctx->sock, grp_id);
Before this it is better to have a check for duplicate-subscription.
> +	if (ret < 0)
> +		return ret;

libnl error codes (NLE_*) are not the same as standard errno/-errno codes.

Thanks,
Soham
> +
> +	igt_debug("Subscribed to DRM RAS multicast group '%s' (id=%d).\n",
> +		  notify_group_name, grp_id);
> +
> +	return 0;
> +}
> +
> +int igt_drm_netlink_wait_for_error_report_event(struct app_context *ctx, int timeout_ms)
> +{
> +	struct nl_cb *cb;
> +	struct pollfd pfd;
> +	struct timespec start, now;
> +	int remaining_ms;
> +	int ret;
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0)
> +		return -EINVAL;
> +
> +	if (timeout_ms < -1)
> +		return -EINVAL;
> +
> +	cb = nl_cb_alloc(NL_CB_DEFAULT);
> +	if (!cb)
> +		return -ENOMEM;
> +
> +	ret = register_multicast_callbacks(cb, ctx);
> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		return ret;
> +	}
> +
> +	ctx->event_received = false;
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +
> +	pfd.fd = nl_socket_get_fd(ctx->sock);
> +	pfd.events = POLLIN;
> +	pfd.revents = 0;
> +
> +	while (!ctx->event_received) {
> +		if (timeout_ms == -1) {
> +			remaining_ms = -1;
> +		} else {
> +			clock_gettime(CLOCK_MONOTONIC, &now);
> +			remaining_ms = timeout_ms -
> +				       (int)((now.tv_sec - start.tv_sec) * 1000 +
> +				       (now.tv_nsec - start.tv_nsec) / 1000000);
> +			if (remaining_ms <= 0) {
> +				ret = -ETIMEDOUT;
> +				break;
> +			}
> +		}
> +
> +		ret = poll(&pfd, 1, remaining_ms);
> +		if (ret == 0) {
> +			ret = -ETIMEDOUT;
> +			break;
> +		}
> +
> +		if (ret < 0) {
> +			ret = -errno;
> +			break;
> +		}
> +
> +		ret = nl_recvmsgs(ctx->sock, cb);
> +		if (ret < 0)
> +			break;
> +	}
> +	nl_cb_put(cb);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!ctx->event_received)
> +		return -ENOMSG;
> +
> +	igt_debug("Received error-notify event: node_id=%u error_id=%u value=%u\n",
> +		  ctx->event_node_id, ctx->event_error_id, ctx->event_error_value);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
> index 9376e3dee..ebc575da6 100644
> --- a/lib/igt_drm_netlink.h
> +++ b/lib/igt_drm_netlink.h
> @@ -19,6 +19,10 @@ struct app_context {
>   	bool ack_received;
>   	bool response_required;
>   	uint32_t error_threshold;
> +	uint32_t event_node_id;
> +	uint32_t event_error_id;
> +	uint32_t event_error_value;
> +	bool event_received;
>   	int family_id;
>   };
>   
> @@ -27,6 +31,8 @@ int igt_drm_netlink_init(struct app_context *ctx);
>   int igt_drm_netlink_get_error_counter(struct app_context *ctx);
>   int igt_drm_netlink_get_error_threshold(struct app_context *ctx);
>   int igt_drm_netlink_set_error_threshold(struct app_context *ctx);
> +int igt_drm_netlink_subscribe_error_report(struct app_context *ctx, const char *notify_group_name);
> +int igt_drm_netlink_wait_for_error_report_event(struct app_context *ctx, int timeout_ms);
>   
>   #endif /* IGT_DRM_NETLINK_H */
>   
