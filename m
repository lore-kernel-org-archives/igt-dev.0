Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AE4C2BBCA
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E4710E2FE;
	Thu, 20 Jun 2024 23:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2Z9gg+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0661610E2FE
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718926673; x=1750462673;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EczyiY/U/kcTZswc/SlWAs29y8w9198Z6LS4S3ujV8U=;
 b=P2Z9gg+LZ2nuHv8k4meEPe1pHyGpMoBw1Cq0JTNSPRwWFI8JuUJU9DTM
 LZbCL0E0cQrsqTFy3/v9PmfZRWzd2rkKeqxYZHNf6BqP9chVk+1UhG+tF
 w52uoItLnPYaMX03it5K89oIGtcQZ2sPQglNzT8W5YOJEsULARhJ39QhH
 dD2RZR7s2tmKDWMueu4gzcyEjrn7uCmBHsWtbZ6eRt+Iwt/Ku4Ij2SM0Y
 3tWLj0VTq7gMpbANiWroogG8kIbl8qlDdmBI4omUIS0x8uvR1v8/PPzjC
 UQjFzhfXh3QvVZwSCDasuqpUQAnJY4YPPquYmQDIhfhWFz4YnX0Fyt5Lw Q==;
X-CSE-ConnectionGUID: chvMQmNuQk+pNIGlg3Iomg==
X-CSE-MsgGUID: AuvkecS7Q2CyS2JmJZwIHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41347481"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="41347481"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:37:52 -0700
X-CSE-ConnectionGUID: V5zpsCaYQ/erKx6vlJfiTg==
X-CSE-MsgGUID: K/ZTohuFTKeCrVxXmohPOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="42268793"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:37:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:37:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:37:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vqs5o+MTlonBsX9WZjjxC9/SBRJdwzPSnbxCtoBpYP2bZ+gPClFuxlH+A2tWNmEdtFfcqewqrjux/dxkecL0izvwWlVn2Osq7ZI8KPyhXyGHvnFJ28dm47GwEAdbJijdWC22L/CT79O01grpzDn/I4PHy1cejAj0ZvGqsP8TB9mL2w7k6Dr5Sz6a4KqIohgyi+jbDbDXLaVEXco11FseCeBZ2+USjwavpApx6znyoOyh8LUE9kKIeubTMdj3IpKVrGa7qfSE59gxkLS3/KUrDFjNqpyRLZ7Ky+jm4N+27hYDJ1wHGlGoqIiyHh/1r+dgpRgCY1YzCSrL+u3AAtAfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tg2NVUfxR2BM3hdeSOduXZBM6PGVSKAjuUQKWGrVb/A=;
 b=PTGnI31ERZILJsJREchLWlS2UlFZa4/lOgUhBtlMLJoYzgpZziLELG4XIFZEARpyso2LdpYdjj6Ycidam1XX/wtfQQxmMJ4jHwlaKvJLxexUzdk5V4V8K7HIjEtXQxlrkhW05T/yO9vuLkckaPOTDUjMPvFo7MheFue6SdqhRt8dE2gYTu3CSNwQxmKl4A9Sqp5cCIpFjaE7wgpXFV3s8EnfGbpjpCkg3h52TDIAQnh5GgaGzRl6olDuXGy//XhYtbKRQtV+eqUaLBwPz94/NoA0ogkZKWwJEbFh6gppll8JuH5Ejlafw4bEG9qdvyG5516CJ9W6ulOFL23e7edgaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 23:37:49 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:37:49 +0000
Date: Thu, 20 Jun 2024 16:37:47 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 17/28] tests/intel/xe_oa: Exclusive/concurrent
 access, rc6 and stress open close
Message-ID: <ZnS9S7soiNjpmun7@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-18-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-18-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:303:b4::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4d191a-99cd-4a7e-b96f-08dc9181fefc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDhxUXpCSWREMEhHekJDQWduNTRLN2wxb2lFMWZzV1FUN096eG1xMkgzR2xu?=
 =?utf-8?B?eE1IZGFHNG5zWVR1SUhGcGRxVGtUa3M4T0dNMmpqOVBYaE9hSU41SXhlaFNl?=
 =?utf-8?B?SXczd0lISUJBdklCQWlYYXljSEI1RTUwRUdSY0JZL2dKRWZxRjRTYTF3N0V4?=
 =?utf-8?B?eFdCVllTYmtBd1JmNXJpb1hWSVpwNWIrNThkMndCL0hDZlJnN1dUeXY3aUMw?=
 =?utf-8?B?YkZ6Nk1qYmZLdk9KYmVwMk9xR0RReCtwQWRpVlB0a2VyMmtPVk1idndLZkNr?=
 =?utf-8?B?bkZDVDB2Q3N1M0FmZHRKcEFRa3BKS2YyYUh5aUFBclVsdUU3YXRPWFhXZHBk?=
 =?utf-8?B?WEVEbDlSTnNWTGhlbzh2Qmcxdk1MSmhJOE9JTDc0U0NGRDkydCtwVmlGWU9L?=
 =?utf-8?B?RGpzODlDT3JIYXdZTzk3N0VpVm1PNW9jeGhnOUlaREZkUzl6VmFDV20rRkZY?=
 =?utf-8?B?R1FMNUZGNnZ0MXVsN1VlTnJIQ3pjNlI4SUI5SjYvZ3A2RzQ0MEYzUGhMN2h5?=
 =?utf-8?B?dEhJVnE4eGxKdkFXejZTTGlXaGtNMVZRdzVvT2lNVlY4ZkhjdURkZmd6bGd3?=
 =?utf-8?B?RGE0R1YzSEgvamE5clFLL2FRQ0lpSm0wWlhLelJ5R3hQYkczS2lCd2ZaODZo?=
 =?utf-8?B?Qk1jZE4yNzNjT04wZERTOGZQY2xJc29XYlpMU0E0d2RMeTZSNlpoS3BQT3ky?=
 =?utf-8?B?VHdCSlVyd0c2SjVON0ovbnZVL3B6Uk1mdzlGQWxBeEl5cG0zT204S1ZEZVBz?=
 =?utf-8?B?a2lrMkY3bGx4Vjh0U0tmNHplME9aSFM0TmxMdENKU1dsTHVNZ3dabHBpMmlJ?=
 =?utf-8?B?SVJ6bjBrWjRZTmllaEg1aUhUdHNUbTd1WFNQT3k2S0tUSVJrNWtTL3VvamVI?=
 =?utf-8?B?NzE5RG9mVGwxMnFMclpQUTBuT3RqenlyU0dFRGFFV2poa3lsK0Q2bUVGR1VS?=
 =?utf-8?B?T0kxZXZ3bHBkeFVrTWd2TmpiOEpieUxTc3FETFo4ajBvR3ovTHdpRkZOU3FS?=
 =?utf-8?B?MGYxR1BWSXJyQmxBZmtucWtqR0xLUDhXcThmNzU4K3Y1dmZXTUlLbjM2YlJK?=
 =?utf-8?B?Z01VT05obXV2NFNvbVVMUWUwYjVDVm83S3NSTU5rTFA1WUE4T29lenZ3ZURE?=
 =?utf-8?B?ZXVKVVhoZW1YQWhPWWpHVU9ITEo5WGlwSFBLK25yaEp4a0dPTWQzdTdMa3Zr?=
 =?utf-8?B?QlF5UDVNbGVYWDc1cTVTd3ZvblVORVY5QnpJQXB3dzBPVHduMWZ3QVd3UlQy?=
 =?utf-8?B?QW9LYjNnUC9sNUVKb0JQalJtbEk1MkRYTHlNZlN4RU1jOUF1Rm1LSHhqdjE2?=
 =?utf-8?B?TFNKQmtUbjk0dDB4Vlk0WWZGTFRaNGh5cENUVDZSd2VHT0ZvSFZJMHJjT0RO?=
 =?utf-8?B?YWlJVTlWaFNVdnQ2aTF6eWp5ZG8xRkVhR2Vpam1hL1RWczl2bkdXaDVRSTJO?=
 =?utf-8?B?S3NyNk9EOHJub1VxNmtUKzhiS3QvMlNNZ2trSHh5R1JiYzFQRlJZcnJFenNR?=
 =?utf-8?B?dHM4TDA4QWVvR2orN1JDQTZ0UlJORWxBZ1MwcXlMcHBwQVpHVy9PYmpwNTIv?=
 =?utf-8?B?dTNXRmh2WEJuUjFTVHF2TWNUbzdnNXQzZWdoWHU0WFJPcHEwYmZNYXI5bStn?=
 =?utf-8?B?c0J5U0tpbFRMNXlaZDJYTTNSd2ZYRWxvVDdHRWw0QlQ2NWlXeEkvNlliVExw?=
 =?utf-8?B?LzdKV3R0L3NtN3M1bkVZUVNtbnRJWW01a29ZMFptcm1ldndGZmNxWjNrOVlv?=
 =?utf-8?Q?0K/OiSf9GCxn4kZJxiWcyxhv4By2lH7OuVtjVVe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU1Kd3NQYnVvaytueFpCcU93TUluYXFsN21LelZDL3dUWm84U2dvcnlzS2E5?=
 =?utf-8?B?VFNrWVpEN1NBM0NRL25IQzNjcVhBRmlvdW0rT2tnRnljQnY2bWxIeGFiaXlv?=
 =?utf-8?B?N2kwdUMrRXdla0l3Q2tVSkhEeE4reUF0ODFXZVZKRWZFTVFkekFFQ3dxM0pO?=
 =?utf-8?B?eEtNemFQdW92djRISHMxbjVWVDhLdGtqMGNVaittSnJheEtlaUQ0ZmtCSjBo?=
 =?utf-8?B?dWRuWHV4Q29WUnVNTjduUkg4YnhwdXEzeWMvY013d2c5QWlLMStWU1IwdEg1?=
 =?utf-8?B?cDFKWkFlb0xLbURSRnRLWjRiTjZjeG1rQW00RGE5ZkFCM0pMR3h2WDRzdzd1?=
 =?utf-8?B?UzNLRGV6bmh3VmdGR3RUYnBuTmJkbVZRcEtlblp6Wk56eWZxYi9XL1VHa0Rw?=
 =?utf-8?B?enUydTh3Qy8xKys1WTNjeVZLcGc3UVF5VGdIdzZKNkQ2SWs5UVZwbW1vOVZ3?=
 =?utf-8?B?a25lanRnVFFTakN5OEtJTGJ6NDBTNk9MR0pibHRWODVSd2xkdmkrRG0wWGNx?=
 =?utf-8?B?QnBaa0NYdTU2RlJQK0lmQkVnRHpBZlZacWRUdnhSaE5JZzVDVzlQaWd4bEpR?=
 =?utf-8?B?R1FsZ3lnTUNxSGJnSUhRRDJsUnc5T1NERll1QmROanByVXFkdjFoRzhWc3lk?=
 =?utf-8?B?Zi94SDRnRjlLYmRYeWpsZVQ5ek5mZytOVWUvT012aGMvVnQrbmNwQ0VFbkpu?=
 =?utf-8?B?VEFyWHMweUVmN3JmTU5vYWJraGx1d3VIR1pXUTN1RGx5N3RtODFvWi9zNlNl?=
 =?utf-8?B?SnQ2MXZDbW9aYW9YcEU3YnFpNk1TL0EwTTRyM2pHRFM1aXJ3U2pXY29ZWHBK?=
 =?utf-8?B?c2dLMFJtd2hVRGdwd0hPYlZ5V2ppenM2YlVwVm4yTkdMc0ErTDlHNHpFUGxJ?=
 =?utf-8?B?bU4wZVFFK2hQd1dTeFNVTGVrS2JrYUZUenQ5eUFoTUNXdUw4WU1FSjRWdUd5?=
 =?utf-8?B?aUJvcUx2a24rRThSK0lMYUVFNGFoaG5lWTliMmpLUFErMlJMYTFUTUpBT3ZF?=
 =?utf-8?B?NllaTkx0QVJLYUxndDhGRURFTjBkRU5FRXFpUlo0Ky9ncHlKQUl6Rlp1SkxI?=
 =?utf-8?B?Y1NTSW03dXFLYk5oWGlJZHpHV2Z3MlcwMmlKMzlKYU40ZVhQOURUczdnbjE2?=
 =?utf-8?B?aDlENHhCalR0QUxkcmxvTm5NMkpjSVBsd2t4Qmw1anhTVGFKNS9WL0pVZFFS?=
 =?utf-8?B?Ym0rYi9VTWR1bS9vRk5WV2tBZGdwZVBLK1UrWkhEZ3NwOUVxM0hXVHZMUVB1?=
 =?utf-8?B?L2Vza1ljTlFQem5NUjIyN2xkS1JLWWUyWkxMQ1NYVlRkM1pTemFsczRrb0V4?=
 =?utf-8?B?dDROaEJsNnJnenpzQW9wYnhJSnNveUpXMW9MNURYSmFGdEVSMTFydVVFODho?=
 =?utf-8?B?QmRFNk10WEhmTlg4eCtQYVczQy8vMCs4cWtkZGZWMGJsejVzekFOVERTV29j?=
 =?utf-8?B?Ulk4NGJ0QjR0NVNtQlNwZVhIK0w1QVRqcXA2VXRwM1FvMXJhOFhleUxjQUs0?=
 =?utf-8?B?dUZOQlN1dU9nSFpjK1NEZmx6K3ZZUlRBOUhzU2lOTDJsWXVJRXdadWU5ekdN?=
 =?utf-8?B?bitxUDZNWGhsSlU3SERaUHhJRjMybmI2UlQzY1JTc2pwRWl3Q0FMTXZQUzF1?=
 =?utf-8?B?OVZtN2Z0WmdpL01lNlBiMmxjQTMvaHM0MjNRL004SE9qTW53SmVCU01GeUJj?=
 =?utf-8?B?WDFhdEZ0aS9IZDNFVUZVdGt0K1BqamQ4YldiMmtMdWg2NERBZzNoRnBYOERx?=
 =?utf-8?B?b242SGgyVitOZDNGY2xEbFdMMTRGL3pHSmVZdmR1WkpDLzFBSXNGazd3TGtx?=
 =?utf-8?B?RUVBL2tLSDJQeGthUkpSazhhZ3ZQQ1RIY1Z3d2U5K2JoalRFYy9YRzJSbTVK?=
 =?utf-8?B?WUVXMGNaZi9zRWhhRXd5cEwzRkVWcUtvOWtUeHNMalJaTGhuNVNCazVPMWNZ?=
 =?utf-8?B?NFdhOE9kK0tsWXc1eG1qZkNGNFpEdzdiVzRIT3lBWnhsakFKZ2cwYmZ6ZEZT?=
 =?utf-8?B?N2dvV3hWU2paRFJRc3ZjVkNrZUErN0JWQVg4S04wVXlNa0lpOVA2cHBwMFJS?=
 =?utf-8?B?Ky9tcGRvdzJJNlJnVlFlT2RIU0gvRG1hUHpzczd3aExMQnpEOTE0cUlGYnpQ?=
 =?utf-8?B?MWdLN2R2WTA2L2VWMXNQUGVmcDdDeFlqQmFXS1hqS1NlempFMTJQRXIvdjlY?=
 =?utf-8?Q?D8C04noW6IjZ65fjrnTPHXk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4d191a-99cd-4a7e-b96f-08dc9181fefc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:37:49.5851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgMEJ5oXwxtAdq6erZdshwWnScVBB2UkNcScnqqfU1WljkZw4ODPHv6YnGSxaP5Em/8y/AhBq2gkEhtXIH7S/m5ThMxuyUz8avUnAlr5sbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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

On Thu, Jun 20, 2024 at 01:00:42PM -0700, Ashutosh Dixit wrote:
>Add the following tests:
>* "oa-unit-exclusive-stream-sample-oa"
>* "oa-unit-exclusive-stream-exec-q"
>* "oa-unit-concurrent-oa-buffer-read"
>* "rc6-disable"
>* "stress-open-close"
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> tests/intel/xe_oa.c | 264 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 264 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index c4a45568aa..12a76ef4a8 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -431,6 +431,23 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
> 	return hwe;
> }
>
>+static struct drm_xe_oa_unit *nth_oa_unit(int fd, int n)
>+{
>+	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
>+	struct drm_xe_oa_unit *oau;
>+	u8 *poau;
>+
>+	poau = (u8 *)&qoa->oa_units[0];
>+	for (int i = 0; i < qoa->num_oa_units; i++) {
>+		oau = (struct drm_xe_oa_unit *)poau;
>+		if (i == n)
>+			return oau;
>+		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>+	}
>+
>+	return NULL;
>+}
>+
> static char *
> pretty_print_oa_period(uint64_t oa_period_ns)
> {
>@@ -518,6 +535,14 @@ write_u64_file(const char *path, uint64_t val)
> 	fclose(f);
> }
>
>+static unsigned long rc6_residency_ms(void)
>+{
>+	unsigned long value;
>+
>+	igt_assert(igt_sysfs_scanf(sysfs, "device/tile0/gt0/gtidle/idle_residency_ms", "%lu", &value) == 1);
>+	return value;
>+}
>+
> static uint64_t
> read_report_ticks(const uint32_t *report, enum intel_xe_oa_format_name format)
> {
>@@ -3461,6 +3486,95 @@ done:
> 	return ref_count;
> }
>
>+/**
>+ * SUBTEST: rc6-disable
>+ * Description: Check that opening an OA stream disables RC6
>+ */
>+static void
>+test_rc6_disable(void)
>+{
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		/* Include OA reports in samples */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	unsigned long rc6_start, rc6_end;
>+
>+	/* Verify rc6 is functional by measuring residency while idle */
>+	rc6_start = rc6_residency_ms();
>+	usleep(50000);
>+	rc6_end = rc6_residency_ms();
>+	igt_require(rc6_end != rc6_start);
>+
>+	/* While OA is active, we keep rc6 disabled so we don't lose metrics */
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+
>+	rc6_start = rc6_residency_ms();
>+	usleep(50000);
>+	rc6_end = rc6_residency_ms();
>+	igt_assert_eq(rc6_end - rc6_start, 0);
>+
>+	__perf_close(stream_fd);
>+
>+	/* But once OA is closed, we expect the device to sleep again */
>+	rc6_start = rc6_residency_ms();
>+	usleep(50000);
>+	rc6_end = rc6_residency_ms();
>+	igt_assert_neq(rc6_end - rc6_start, 0);
>+}
>+
>+/**
>+ * SUBTEST: stress-open-close
>+ * Description: Open/close OA streams in a tight loop
>+ */
>+static void
>+test_stress_open_close(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+
>+	load_helper_init();
>+	load_helper_run(HIGH);
>+
>+	igt_until_timeout(2) {
>+		int oa_exponent = 5; /* 5 micro seconds */
>+		uint64_t properties[] = {
>+			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+			/* XXX: even without periodic sampling we have to
>+			 * specify at least one sample layout property...
>+			 */
>+			DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+			/* OA unit configuration */
>+			DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>+			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
>+			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>+			DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>+			DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>+		};
>+		struct intel_xe_oa_open_prop param = {
>+			.num_properties = ARRAY_SIZE(properties) / 2,
>+			.properties_ptr = to_user_pointer(properties),
>+		};
>+
>+		stream_fd = __perf_open(drm_fd, &param, false);
>+		__perf_close(stream_fd);
>+	}
>+
>+	load_helper_stop();
>+	load_helper_fini();
>+}
>+
> /**
>  * SUBTEST: xe-ref-count
>  * Description: Check that an open oa stream holds a reference on the xe module
>@@ -3547,6 +3661,137 @@ test_sysctl_defaults(void)
> 	igt_assert_eq(paranoid, 1);
> }
>
>+/**
>+ * SUBTEST: oa-unit-exclusive-stream-sample-oa
>+ * Description: Check that only a single stream can be opened on an OA unit (with sampling)
>+ *
>+ * SUBTEST: oa-unit-exclusive-stream-exec-q
>+ * Description: Check that only a single stream can be opened on an OA unit (for OAR/OAC)
>+*/
>+/*
>+ * Test if OA buffer streams can be independently opened on OA unit. Once a user
>+ * opens a stream, that oa unit is exclusive to the user, other users get -EBUSY on
>+ * trying to open a stream.
>+ */
>+static void
>+test_oa_unit_exclusive_stream(bool exponent)
>+{
>+	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
>+	struct drm_xe_oa_unit *oau;
>+	u8 *poau = (u8 *)&qoa->oa_units[0];
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(0),
>+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, 0,
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	uint32_t *exec_q = calloc(qoa->num_oa_units, sizeof(u32));
>+	uint32_t *perf_fd = calloc(qoa->num_oa_units, sizeof(u32));
>+	u32 vm = xe_vm_create(drm_fd, 0, 0);
>+	struct intel_xe_perf_metric_set *test_set;
>+	uint32_t i;
>+
>+	/* for each oa unit, open one random perf stream with sample OA */
>+	for (i = 0; i < qoa->num_oa_units; i++) {
>+		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, i);
>+
>+		oau = (struct drm_xe_oa_unit *)poau;
>+		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
>+			continue;
>+		test_set = metric_set(hwe);
>+
>+		igt_debug("opening OA buffer with c:i %d:%d\n",
>+			  hwe->engine_class, hwe->engine_instance);
>+		exec_q[i] = xe_exec_queue_create(drm_fd, vm, hwe, 0);
>+		if (!exponent) {
>+			properties[10] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
>+			properties[11] = exec_q[i];
>+		}
>+
>+		properties[1] = oau->oa_unit_id;
>+		properties[5] = test_set->perf_oa_metrics_set;
>+		properties[7] = __ff(test_set->perf_oa_format);
>+		properties[9] = hwe->engine_instance;
>+		perf_fd[i] = intel_xe_perf_ioctl(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param);
>+		igt_assert(perf_fd[i] >= 0);
>+		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>+	}
>+
>+	/* Xe KMD holds reference to the exec_q's so they shouldn't be really destroyed */
>+	for (i = 0; i < qoa->num_oa_units; i++)
>+		if (exec_q[i])
>+			xe_exec_queue_destroy(drm_fd, exec_q[i]);
>+
>+	/* for each oa unit make sure no other streams can be opened */
>+	poau = (u8 *)&qoa->oa_units[0];
>+	for (i = 0; i < qoa->num_oa_units; i++) {
>+		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, i);
>+		int err;
>+
>+		oau = (struct drm_xe_oa_unit *)poau;
>+		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
>+			continue;
>+		test_set = metric_set(hwe);
>+
>+		igt_debug("try with exp with c:i %d:%d\n",
>+			  hwe->engine_class, hwe->engine_instance);
>+		/* case 1: concurrent access to OAG should fail */
>+		properties[1] = oau->oa_unit_id;
>+		properties[5] = test_set->perf_oa_metrics_set;
>+		properties[7] = __ff(test_set->perf_oa_format);
>+		properties[9] = hwe->engine_instance;
>+		properties[10] = DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT;
>+		properties[11] = oa_exp_1_millisec;
>+		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EBUSY);
>+
>+		/* case 2: concurrent access to non-OAG unit should fail */
>+		igt_debug("try with exec_q with c:i %d:%d\n",
>+			  hwe->engine_class, hwe->engine_instance);
>+		exec_q[i] = xe_exec_queue_create(drm_fd, vm, hwe, 0);
>+		properties[10] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
>+		properties[11] = exec_q[i];
>+		errno = 0;
>+		err = intel_xe_perf_ioctl(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param);
>+		igt_assert(err < 0);
>+		igt_assert(errno == EBUSY || errno == ENODEV);
>+		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>+	}
>+
>+	for (i = 0; i < qoa->num_oa_units; i++) {
>+		if (perf_fd[i])
>+			close(perf_fd[i]);
>+		if (exec_q[i])
>+			xe_exec_queue_destroy(drm_fd, exec_q[i]);
>+	}
>+}
>+
>+/**
>+ * SUBTEST: oa-unit-concurrent-oa-buffer-read
>+ * Description: Test that we can read streams concurrently on all OA units
>+ */
>+static void
>+test_oa_unit_concurrent_oa_buffer_read(void)
>+{
>+	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
>+
>+	igt_fork(child, qoa->num_oa_units) {
>+		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, child);
>+
>+		/* No OAM support yet */
>+		if (nth_oa_unit(drm_fd, child)->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
>+			exit(0);
>+
>+		test_blocking(40 * 1000 * 1000, false, 5 * 1000 * 1000, hwe);

If this fails, there are no debug logs since this is being run from 
within a fork. Do you know if that can be fixed? It would be worthwhile 
to get the debug messages for this. Maybe the igt_asserts in the test 
can be changed to igt_assert_f with a message. If not now, we can create 
a enhancement issue and track it later.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>+	}
>+	igt_waitchildren();
>+}
>+
> static const char *xe_engine_class_name(uint32_t engine_class)
> {
> 	switch (engine_class) {
>@@ -3715,6 +3960,25 @@ igt_main
> 		}
> 	}
>
>+	igt_subtest_group {
>+		igt_subtest("oa-unit-exclusive-stream-sample-oa")
>+			test_oa_unit_exclusive_stream(true);
>+
>+		igt_subtest("oa-unit-exclusive-stream-exec-q")
>+			test_oa_unit_exclusive_stream(false);
>+
>+		igt_subtest("oa-unit-concurrent-oa-buffer-read")
>+			test_oa_unit_concurrent_oa_buffer_read();
>+	}
>+
>+	igt_subtest("rc6-disable")
>+		test_rc6_disable();
>+
>+	igt_subtest_with_dynamic("stress-open-close") {
>+		__for_one_hwe_in_oag(hwe)
>+			test_stress_open_close(hwe);
>+	}
>+
> 	igt_fixture {
> 		/* leave sysctl options in their default state... */
> 		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
>-- 
>2.41.0
>
