Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A93E95392
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 12:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9A210E26C;
	Wed,  4 Feb 2026 12:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+yfZeaF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05F210E26C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 12:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770208196; x=1801744196;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SnQK2GKGi9R8r08Ps14InYhLbXTNpI+2sAY102SpwBA=;
 b=B+yfZeaFqktw0t7xSutLOxljfdMN9mxMJnzgeRU6Z3erTvCpNXuPSIQQ
 /GfhNTvPJw2zRxJeaQEjoTukIreFm7thYkuQobyUqOYPtN/b9rcIrxw08
 FRQKbyAtE28S4CbqTDLJNkF+uks3J/SfUhOhGidRbzr6q7lYNaDPGqeu/
 Ofoboag8fvF4P+KE7rJdGu1X3JWBxnwe8ZqbUapCu6LC3EkwF8b7ybpeY
 MAqP3/R4XS5XKWqL1EHXGcWpVOPQx81zjSrbnSJSr4XIQE0PtQyyUlW8H
 E+lqfhrHbmduiFvunLRu3NIRYrtetH1lO6ObreooC0G4u9FaID7mgUid8 Q==;
X-CSE-ConnectionGUID: l+8o0fvVTImHLwFqPIERAA==
X-CSE-MsgGUID: vT42y5hTSR2Ec5NwWm2P6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88971189"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="88971189"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 04:29:56 -0800
X-CSE-ConnectionGUID: GJ9m2cQDT8exhI1ZXpHt7A==
X-CSE-MsgGUID: jbX4e+WMTUaPoIF3vvdNmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="214637546"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 04:29:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 04:29:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 04:29:55 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 04:29:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/hEIbJLu92M8eRPcVwdiyGQ86iwFUwM2xjEuwUkMQJdw3lubuFXHCCZCNQUrYImbchtkLFkRiEH6kq0AUeDp+d9TigjD9YLX7ld/brMAK6xhO3xuFWQPT8jtFJe6dJwwOOUwqRH73h4mVvUgGX3BZtCPsQxbdSa8smt28jkAarRSdkaqMhd2yCC5w2vqy7HnYS9Sof/pdNBUYN0EFO9cQ1jy8Rx9vqy0hOXWMicVO6L7mMGR/wLGmce6o2P46sFASDaLcnEsoqbzCOwzsHUNXlnOc0yrWDU2u0nmjDnWnS1OukBZQuNXjf0z1kWOGjaMdH1Mlha+HWAjwJUEHnBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qBDDZ8pPmIhJzLTqQwW9qoFjH70zcR4BuXwujVAa6o=;
 b=StTuB1Teqblr7DHUkJJYaa2O96VmChFUV38St/V2N6m2hhlHOfyAXLxIMw/VBrhYNUXikSspWRepz0zgr4fiVko9VJIjXmaY40dK4sReLPM2us6IDDnOA5Yq2/X/vdaOerFeZ54n9o9+clbCFZxhknCwG+uZavsc7wGjP8JiuxH2f8t7wHuU85ztCblzb2ZEz7NhVV9kG5mDf/e1U4Y3UWVDf2Dlv+vvinH0Wjl0uAZL/1U3J7Sw9IvcEz0UicItkP60/eHgilCscK+JgTXQ5+5U6307U56viS/08SNvCLkZ5SlTH8qyPu9OgBF8tLR/3L9m6n8F1VL9mm1XQ1Pvjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by LV8PR11MB8679.namprd11.prod.outlook.com (2603:10b6:408:1f9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 12:29:52 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 12:29:52 +0000
Message-ID: <9e01c2ae-2628-4f2b-8f11-3394cffb3176@intel.com>
Date: Wed, 4 Feb 2026 17:59:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] intel-ci: Add valid skips on kms_plane to
 display blocklist
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260202083300.647462-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260202083300.647462-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::9) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|LV8PR11MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b72a34-33d7-42cd-6c27-08de63e91826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2dqVkxzY25mcHlHMnVJWUZRVWZkWS9BY1JuOWZOaUwwMnRZdXF2clZ1dHJM?=
 =?utf-8?B?em1xMVM1UlgzcjVsQWZYOHRBeXVsTXJpVTA3WFByTGhJUWMyeGlMOFJGZVVZ?=
 =?utf-8?B?ZXpNZGtBK3lWZzM0a0I3M2xYeXBvV1JGU3lld05oZjVkQjNFL3lNcXd3S3hR?=
 =?utf-8?B?Z2lCd2R0WmVFZTJNOUhHdnQyOG1OS01sM1BsR09ocS9wQW5tSytXbjJ0aDBh?=
 =?utf-8?B?Ylg1NDZ2VExITnlxM0x0Z1dXak1FMEJ6YS9OTmM0NFl5V29iWE4vK0hJU05h?=
 =?utf-8?B?NXB0d3JiSi9VSWVGVE9heDlDWUNXcWhzbzdoSGd4QWtxay9TUjA2d3cvZGMr?=
 =?utf-8?B?Uk1EanhxemFYR3NOK0VQSmUycHI2cWExdjdOK2FmTEFnNXdLY3RtMWhSRGkr?=
 =?utf-8?B?K25yWXNpTHFDNFFSODlTaEEvbUZoOUFWcnBCdVlnTVhad2dENVJlaG90UkNX?=
 =?utf-8?B?NGJoekVtVk9QN2FNeTRaSGZGT1F6R1oreUdhT2drbTVoU2Q4RUpzajJDdTNN?=
 =?utf-8?B?cTk1WVNxY3hIRm5OSXJBcW1Kbm8rM3ZudXdSa09TSEdaZWJSejc1blAyYzQy?=
 =?utf-8?B?aWloRTBLUjMrOEtqRjVsaElPUUVaYjVHcTluS0RFVHMybUtRc2ZUTGx4eFlv?=
 =?utf-8?B?em4wQTkxa3VhLzV2SWJ0elA2WU04NjZPZTNFVW55UVdOYjVueHE2ZmE3WUZq?=
 =?utf-8?B?Z2V3cTJrZnZIckJ1SlVQdFN3NndGRjBTem50U1NlWjkvS2YvR3YyWVArOW9N?=
 =?utf-8?B?YmYrUU45b3E1aUkvU2xRZUI3RHNRWVg2dmxKTVRMQm5RamRMZy9FdUxCek9j?=
 =?utf-8?B?bHJUZmtjNHNEZU1rRjQwQ0RqTWxEaGpqZ3lhWkhzZWEzZXFuUnV2NDdSMXNz?=
 =?utf-8?B?em0rL3VOd1l3UHpqb3UwTFJ1S1BGbms4bUtNUWR4emNKMzBiekdwMWRUMDlJ?=
 =?utf-8?B?MkpIazB5R3F1WVlvZmV0cE5VZmQ1ZmE5aDZGM3dQTlZ1TUhpaGRHc0dVYzZX?=
 =?utf-8?B?NVFUdnpPKy84WWdrd3pqbnZaWlhFMHRpQmlMaVpVb05NU2h0WldvaFpHekxD?=
 =?utf-8?B?QXRWT0RCa0cxRERzK09RQUM2YkVvU0c5SHd4Nkk5b1dCdmUyWTFGQ3RIZUdP?=
 =?utf-8?B?WU9uVkdmRlArT2NRdEdNV3Jna1h0eC9ZZk9aMlZ0UGZuNzErbFpNMDBDTURn?=
 =?utf-8?B?UjNBTG5xV3JJd2ZXL2k0eGw3aHhXYWR4aU9ZZ0M5ZERHc0sxekFkc1djWEdv?=
 =?utf-8?B?QUdOK1F3REVkcS9YRWZYQUt4eUhHVnE3NEJBL0tEZXUyNmpBcWJrTVFGeklO?=
 =?utf-8?B?UTU3VGV4MWNndE1zUmVUUGZsSmdDQko4NWV4TXRpYzJEOUVZTndORnJ4bk9D?=
 =?utf-8?B?SCtoZU1adERRTm81ZEtNYmpwV2FVS2JMbDlGZEVORjBpQ2sydEI3bmJSeGtE?=
 =?utf-8?B?bVZ6ME9idk9IaTVmRXY1cjhia0VLRlh5OCtqUVdOS2YyVml5amlTdkFDeHNu?=
 =?utf-8?B?bkVtY2dLQURHSTQyQ2szaE5ENGxhQy9RbGJxWDVlSkhXOFJjcmxycTdLbWhJ?=
 =?utf-8?B?aktpd2dubHJweHYwOEdaT2NEdXc5VzRiVWNWMVJhWHh3SENHTVhqWDh5T2lD?=
 =?utf-8?B?T3B5UjJpSEhrem1kWmpsV2VqcEhpNzYycGpCdDNzdVl3UDQwVmF0bDB6ZTNp?=
 =?utf-8?B?dmlqVFYxU0ZiRk9wUnJhRWtNbHpkQ0JaT290bDd4SWkzYjJac0lIaVZqbGpM?=
 =?utf-8?B?bEk2TEMzd2VFbWt3ZC9oUWhnS0lzSi9hZEluaGc1MXY1bW9zUXR6UndscGdR?=
 =?utf-8?B?eWhrcllTS241UVRIYUtSTXQwc1llSExrN2J6N2l4L2lUTUFMZzlIZTZKU2Jh?=
 =?utf-8?B?OFlxaThtSUd6R1lZc0RCVnJTaFlHcE5sNTFTNFNXcWlqODFTYzNKOFdneUl5?=
 =?utf-8?B?eEo4TUI2ZHRRb3JhQ291RjJyZW11WGszdGFmOGcrR05VN05hRDcrK0FiMjJi?=
 =?utf-8?B?a0RFSEQwdmJZcE4xWHlNWFZlY2JReG9lM1pQeS9FYndrUHFIUDJxRlQ3OGRk?=
 =?utf-8?B?UTVMNFNOdnlBdHZ2c3l5WFVRanVwdHVRQXd4T3l3SjN1YUI1M3EzUG5kYStC?=
 =?utf-8?Q?LNZY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEQyVzV3WXdZZzlNVmE1YVpRcnJRVnhrb3VzSFVWRGg2QTZXNXhpc1drY3VZ?=
 =?utf-8?B?U0pqWWhZYTI5UHM2SWVBUVZVRGNjZlkvWlhDbFlxSzF3SmozRGVmam1DTkhO?=
 =?utf-8?B?RW82ZkxROFZwNlRTVkFqQkthL29zZWRGcmtxeVFxajgraDlxTWVxYnhpek5o?=
 =?utf-8?B?R2VKRnlXcDZDSVdIRncwN3ZGRVdxbjZQNXhaSU12TE5uSFVNRzJ4R1dWTE9s?=
 =?utf-8?B?RitIOU5wVnRUejJoV1BtRERrOHRhQXJVT0luclBlMVA3bXk3emhXSXk0MGtr?=
 =?utf-8?B?TCt0aFAzVlk2clh6azhPSG9sbHFPRmxCTFhkb1hzc2V2ZGhNNFJWR0lKbGFT?=
 =?utf-8?B?QWROUjlEakx6a3FPTW5CVWhzRFRaZEtNMnZGY2RyL3FtZXp4L3g1NXpGcFp6?=
 =?utf-8?B?Q2J2MlBFK2h6OEFxa3FQZEE3THJpaWhtQmF5a0ljVDJkVEJuRXlIdXl5ZFB2?=
 =?utf-8?B?VnZ1Y2JWYnJzRVU2LzArZ3huaWd6Kzd2UStTZjFuQVdTTjd3K09qa2lkMlll?=
 =?utf-8?B?SUp2MEtIM3FXZXBOY3JjRDNub3dNWlNoUGRaKzh4ekZ4SVhFaGRlYUlJWlB4?=
 =?utf-8?B?QVdsSk1WcW9SYWRsR2xxVUpMcUZQK2xQK1I4UHN6WEhQTEJVMm0zVkgxM2cz?=
 =?utf-8?B?clpFNDBJSXkwUGZHUUZtMWVaMjY4QVI0ajM0VmJ2emNvMEMyRVRibFhkNmc5?=
 =?utf-8?B?dWYwVkZuc3lrUHg2WUtnZittNU1rSDZjSHJ3VzVSNlJUcXVEZDNsSEhicGo2?=
 =?utf-8?B?NEZhZllyMlYzTTJLMGwzbjBXU1AvVElCeVptQkxocUFxRllNMmJxNGhYUVB5?=
 =?utf-8?B?SFFjNGtEa25YQU4xbEc4eXdTTFp5NlRJQ1hMa0dFNG9TS2luNDJxQWQvL3BD?=
 =?utf-8?B?azMyVkNMQU1UM1E4RVFabE9wOGV5d1hWM1RNYXJ0bkVJZmNYaVQ3MThZaXNY?=
 =?utf-8?B?cHgvZzR2VGJTWVp0NXFvaDI1TjRVQnVubCtHeURPanFNREJJc2JHR2RLcTlS?=
 =?utf-8?B?QUEwcW0yRTZsemlOc1BTRHpjMHpJOUNvMElPdlV6OHpZQmZ6V0c0ZVBZT1l1?=
 =?utf-8?B?dE0wSjlhdFBaRUV6QjdrQndGYzhoRG5zcDZEVWxJSjY3UzVQVnRMbWVtTDVH?=
 =?utf-8?B?UitkTHE5d0pRVHNPczNCcHNLK0xnejdKemNFWWRsQk9ONWxvOWhPWk9ldita?=
 =?utf-8?B?T2tYKzVRY3NSNUNxVFE2U09hVkd2ZzlxTStON016S0xDQUUzOE51ZWRab1lr?=
 =?utf-8?B?YVhEWEx0UFdZKzVoS0txRDNKblZCNmtZQ3gzZWdUNmduWjNKMkoyM2xmQ0FH?=
 =?utf-8?B?TUw0RVV3VmpWcVI5Mlk5YjJNeHhvRmE3YWNFU05BajNOL2JrTVZIenVZekF0?=
 =?utf-8?B?Z0tUN09nQlpDQ3dWaEpGRHpIUWlnUzdIKzdzK0treWJHWm8xSHk0QUlQTHpU?=
 =?utf-8?B?T1Y4VElobzU1ZzRQci9JVWhtMlVDZ05xeUhqTTc3bDFSMVcydHNQZ1pJc3lt?=
 =?utf-8?B?a1Y4WjRHWkJuZlpWdnFXc2EzQU1sY0xXenlZb1dadjB5bGZXc3VYU3g3NjBj?=
 =?utf-8?B?TTRWdTdnVGNXdTRvaVloN3BoY3ZsNE1VaXlpZWNRNVhBT3FMY2ZXRkJsQUZ5?=
 =?utf-8?B?Tk1vTDJsRTI5TTJNRVJIRXlHdnllNUJFUC84THJ5Z05yNjdScnlLYkM1SGpI?=
 =?utf-8?B?a3FCNWdWRFpDYzJsbEdKVzVKQXlMM1VVNk9uQmFyUzVocU93OVc2UUNJb2J6?=
 =?utf-8?B?cE1RUmU5cjZTK2NHVlozbUlDRklKR2pSYzRvcnFSa210T0xUR3hKenhQdDdk?=
 =?utf-8?B?QkhEZ2Q3ckVPRVREMnBMMnBrMFJWMkJPclhxTVVhMGRWT3pSRDE5OG5iWFp2?=
 =?utf-8?B?MWdONmZEV211TGpUd0Z2OTEvdDA0Y0E2eTc0TForNkJ4czNnQlBKZjdCNWR6?=
 =?utf-8?B?QVhMcTRWWkJCVE8wd2NhZC85eFpQUzVvTkg5enBaOUtLcXB5b1lTbzZaQlk2?=
 =?utf-8?B?V0draGxJYU1VL201VCt6T2dySVlMeWJzM0sxMzV5eVE3NHNWK0pLR05XUUo5?=
 =?utf-8?B?VThlbXg1Q0ZaYS91RlQ0Ty9OQnBXWDVKSDVmeDF2MUpoSFQwUXpUNkUxSWtJ?=
 =?utf-8?B?bmFwUUl6SG1WZVpZVmI2N3dnTnJvZVNuTVIzYmlZdjRPUHFVM2dyUURFdVVk?=
 =?utf-8?B?Tmx1VmcyK2VXazd2OTNRMlFRb0FLSi9Wek1KL3VwaEsvV0VpUTJBdzVXd1g5?=
 =?utf-8?B?cFR2WjVDMjY0c2RXZzBIYXZ2d2pnKzJWS0hKamtHNW54THA3NC90TXpWc0VH?=
 =?utf-8?B?S0FtT0tDZnREQnVpclRaa1RXQVZ3eFhBYytBUEROc3NmUnRmUVdhV1dXV1B4?=
 =?utf-8?Q?hIEmM4m0cwp8z/Eg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b72a34-33d7-42cd-6c27-08de63e91826
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:29:52.0672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcGZwv8mxy/YEvYzVGGDawXdgJQkyQE1a2mSKxa551G71KbhX3l8sGeGZEh7YvRHNRZ8WI0lVEowVEqXlsrrtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8679
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

Hi Karthik,

If possible can we add similar change for xe.nvl.display.blocklist.txt ? 
These skips are valid for NVL too.

On 02-02-2026 02:02 pm, Karthik B S wrote:
> Multiple kms_plane@pixel-format-* are skipping as those modifiers are
> not on bmg,lnl and ptl. Add these subtests into relavent blocklists.
>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/xe.bmg.display.blocklist.txt | 2 ++
>   tests/intel-ci/xe.lnl.display.blocklist.txt | 3 ++-
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 3 +++
>   3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index 2c0c4a0e8..86c1bbd72 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -11,6 +11,7 @@ igt@kms_flip_scaled_crc@.*(yf|y)tile.*
>   igt@kms_async_flips@invalid-async-flip
>   igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
>   igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
> +igt@kms_plane@pixel-format-(y|yf)-tiled.*
>   #########################################
>   # Valid skip :- 90/270 rotation is not supported
>   ##########################################
> @@ -116,6 +117,7 @@ igt@kms_ccs@.*-dg2-.*
>   igt@kms_ccs@.*-lnl-.*
>   igt@kms_ccs@.*-mtl-.*
>   igt@kms_flip_scaled_crc@.*dg2rcccs.*
> +igt@kms_plane@pixel-format.*(mtl|dg2).*
>   ##########################################
>   # Valid skip :- Simulation specific
>   ##########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index d92e12d64..d280fb16a 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -11,6 +11,7 @@ igt@kms_flip_scaled_crc@.*(yf|y)tile.*
>   igt@kms_async_flips@invalid-async-flip
>   igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
>   igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
> +igt@kms_plane@pixel-format-(y|yf)-tiled.*
>   #########################################
>   # Valid skip :- 90/270 rotations are not supported
>   ##########################################
> @@ -85,7 +86,7 @@ igt@kms_ccs@.*-dg2-.*
>   igt@kms_ccs@.*-mtl-.*
>   igt@kms_flip_scaled_crc@.*dg2rcccs.*
>   igt@kms_ccs@.*4-tiled-bmg-ccs
> -
> +igt@kms_plane@pixel-format.*(mtl|dg2).*
>   ##########################################
>   # Valid skip :- Simulation specific
>   ##########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index e9d0775e7..bb5c83f15 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -19,6 +19,7 @@ igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
>   igt@kms_flip_scaled_crc@.*(yf|y)tile.*
>   igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
>   igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
> +igt@kms_plane@pixel-format-(y|yf)-tiled.*
>   ##############################################################################
>   # Valid skip: Test skip due to hybrid config requirement
>   ##############################################################################
> @@ -71,6 +72,7 @@ igt@kms_scaling_modes@scaling-mode-none
>   igt@kms_ccs@.*-dg2-.*
>   igt@kms_ccs@.*-mtl-.*
>   igt@kms_flip_scaled_crc@.*dg2rcccs.*
> +igt@kms_plane@pixel-format.*(mtl|dg2).*
>   ##############################################################################
>   # Valid skip: Valid for display ver < 13
>   ##############################################################################
> @@ -148,6 +150,7 @@ igt@kms_rotation_crc@primary-4-tiled-reflect-x.*
>   ##############################################################################
>   igt@kms_(plane_lowres|plane_multiple|rotation_crc|big_fb|flip_scaled_crc)@.*(x-tile|xtile|tiling-x).*
>   igt@kms_pipe_stress@stress-xrgb8888-xtiled
> +igt@kms_plane@pixel-format-x-tiled.*
>   ##############################################################################
>   # Not supported by current CI configs
>   ##############################################################################
