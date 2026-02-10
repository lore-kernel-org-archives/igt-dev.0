Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D27DEA3F00
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 05:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6587C10E4B6;
	Tue, 10 Feb 2026 05:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLGfs8AC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2317810E4B6
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 05:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770700609; x=1802236609;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rqEMvc/pIL/SHMjjBkSvMe6oJJQAKzEn35KVXP/Q5Ag=;
 b=CLGfs8AC47bDVn9nTCtUey1YSjkJbmmzw+4siOKUyk8RW2+1vWkuFUY9
 dKuUsDCvgB8Kam2D0Ih2Wax9fv7LEPJq023qBq1vt0rU/+OMSR7ESGd7l
 O6DLYjemzGDktojILVIoHMG+e5fNagu84XjFmvW3dP6+EOC2ZWoOvO/lI
 OA5LUpPUgsYOiBYM3JTUIY868oTT32uYbukbByaAMOzqFIP26l6DqN3To
 Hjzs6snSrf127rQIHT6ESIwlQAYZV+CjaI6T7hMrHuLAZ1jF7t3BoO5gi
 uRjcEYHcZ7GoSqb5vNfXRcyQjfXPt85ZMycjZK+edN6yeKzFy8XmCjcWs g==;
X-CSE-ConnectionGUID: VwmS/D37SVqCk4IrJRPyqA==
X-CSE-MsgGUID: pg/PlfzvR7avCUViinw8QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74426035"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="74426035"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 21:16:49 -0800
X-CSE-ConnectionGUID: ZfO9w8U3RVy1Y+7vSvST4w==
X-CSE-MsgGUID: vMfGUDt+SIe9hia2hSJueg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="210908002"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 21:16:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 21:16:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 21:16:48 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 21:16:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYOxMke/z1iq8Y5h/7WpMvkk46jSSjg8ytHsu/ChMDuS0++E2AGrL32mmSanw85bW3YloSgI4lFn6wrgqrwukMFtRQBUkVV/GAnRb8zagyn5UJ/HPbVQDIV1tJ2Ocg0co8ODZIIIvWBgGcy4UVLnn0VhKC4xvwrl+MmsSVfifnDHwAUryPVXuXD7Xhz4coVU6OGexxFa/hg7s+Y8WtdGb0p+gVH1EYFWH4JIJ8mIuK1+Ij1kcOaDksDqhZqjmXLvc3mEbNrshq65R18JOYm+ReK7y8rbajhWsFXXjV76DTxHHwIJUU7KtNv58oLC8UM9PGSGZTphHa/S+JBIwOHTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2e3givF4Byj/FBksjrLo0oqLblDiEDnEuYVvK/e7Co=;
 b=eXnHj5gutG4MZ/+nDyAyhfDzkE26VUJDHkQH1unM/F0pLlRXnFeAhGKGmBf8cvk9KPMIT9t8WdbxVcJ7uRp/3rNMouTuk24wMF9lidB1+wkopAU/RVbJVH0mGsdJj8XnMRfpJd2miqLLo8OFF37TVu4EFd2lD/l1ae4lWSGWaDRE13C0jkqxK7ICRJh/N1dnzQUFPADkovQA/xHfEBgUoSfILfbilp2Q9qBXZN/4ACE0pKsan05/jTfIj8+eV7F+Az8stk5ozCv9j62FXvH1FddZ4CK6HGEioWDbYHQvYQoesYpprJ18zSnY1f0ZXzWWeUaugwa4AxRfnUZED863mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CY8PR11MB7243.namprd11.prod.outlook.com (2603:10b6:930:96::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 05:16:46 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 05:16:46 +0000
Message-ID: <7fb12cd6-a88c-4750-b125-db8939941f01@intel.com>
Date: Tue, 10 Feb 2026 10:46:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe2_hpg: Apply Wa_14024997852
From: "Yadav, Arvind" <arvind.yadav@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>, <nitin.r.gote@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
References: <20260210025130.770085-1-arvind.yadav@intel.com>
Content-Language: en-US
In-Reply-To: <20260210025130.770085-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::15) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CY8PR11MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 148132fc-4c53-4008-48f5-08de686395e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGYxWElMWll1R1dsbHNVaUZoYWVGdklYaC92OStxVjlWK3REZnRNK2s1UlV1?=
 =?utf-8?B?N3BnTjZaUmtMY3VZWGV2YVZuZktTOGQzSjlkbSt1WFNTdU1QellYcStXOG5s?=
 =?utf-8?B?UUNyM251SWoyWXdkZnRpbkhGeEZ5cTR2QVhEZlRrNDE5b2JaUmFSQStvR0Y4?=
 =?utf-8?B?L0hLU09hVWtBTy9nZkNvS2drZ3MxOWMxMzVkcldLODRQVEdaMlgzbUM2RDE0?=
 =?utf-8?B?QnlEVnE5b05vVDVaM3pEZnBYWWhUQUlBUkpTaTI3QmJGTXEwTlBOUFpzdDBu?=
 =?utf-8?B?ZjlPdGtXNjNaOEE4L2pOWkxDbE91OWlqdlZmN3J4MndwWDAwOVN1cmVaTXpN?=
 =?utf-8?B?S3VrZm1qNkRYVHFkclhWWnptaXJMUWRsUzBCQmtyaTJoWUtPZGhqUGpQWWhR?=
 =?utf-8?B?dnlzK1pGWnFXOXhDU3UrcU1GMnRpL0RuL2RTYkVCakorNDhaaVJLa090WkRE?=
 =?utf-8?B?NHpLTXExM2dSdGJTbHRYd0FsRHMyYTg2ZTRBbys2dTJCRXUxT3U5RXBGbTR2?=
 =?utf-8?B?MXVTUURxR3YrVHFVdzg5Z2tVa1ZsUDNOV1ZtZWszMVMwMkp1RzFLNGQvTlBr?=
 =?utf-8?B?U3pRL2xQK3FLejdlQnZUWHpJREJtRjlOMkhSVTFQZUtSdlVsRmNObStJTTBY?=
 =?utf-8?B?dzVDVVNMQ0RJenBlem5UaEI1OFhtcDlqZHJNNXJvTTd1MkVEbEg2WWRnUU9y?=
 =?utf-8?B?NmFvVkVQcWw3SzN0UFo5V3NJcWdMUkNZN014dkdiSEVzTURsWjJQeTFIbmRK?=
 =?utf-8?B?bzZTOTVTaGVvVGdrSjV3WkY0aEt2ZzJFRnI5WkFYczFlQW1UNGtzMVkwT2t4?=
 =?utf-8?B?RVhkWGNUUXZ6cy9DSkp6WWFIZnorVDJYeERIa24xOHRnbVVvbXBQYlhPV1Rh?=
 =?utf-8?B?eUp4aU9XVGZtZThFY2grYm9RRnVKR3V0azVaVW8rWkxpcHZzQkx1N1BRSmIz?=
 =?utf-8?B?YmhVOGl3NElwdW1TMHRUOEZPSGJUMzVxQkh5M3BYcWxSMDM5RldPQ0h1UStp?=
 =?utf-8?B?WjgrY3M2WEVZbDZkMlVBWDVZRDRVOVlKSVJiQmxSQUZYbWZUcy9GenNZUkJl?=
 =?utf-8?B?T1Jyb1didk0wdFd5OC9tckN4QjdxOGJUcVFack04TGlGdFhubU9EbnRGU0Rp?=
 =?utf-8?B?ZllIZnBtQ0tJZmJVaDRFUWZkR0pPVGdYb05McWtHa0llVTJvVVhqVUlmT2F3?=
 =?utf-8?B?UFlENWlYaEJFRm93Q1p3UFJmLys1NDhKN3M4ZGdPbFRWVlFoNzJqODlpRXRV?=
 =?utf-8?B?bWdKMTFOZmRoRzl4ZWd4M2ZmKzN0N3JOb1cyaUk3SXluY1E5dzc3eGJpcXdo?=
 =?utf-8?B?TlhKN0UrSC9ORXE0b1MzYWJrVmlWVGJLZ3lvQVArTTBGSzU3TWNmdGJNQXd6?=
 =?utf-8?B?alc4ZWFpVnVGN2Rzd254TkFHU0ZabDI5NmZQMUJTay9WMkp2RVNZNGRrVWVo?=
 =?utf-8?B?WlJaZ1djOVNZSkFxYWhRU3RicGpRcFltSCsrbTRrTEs2U0F1a2pNM3p4cXRn?=
 =?utf-8?B?Um1UT1YxRVU5WXdUZHVQNk4wWGJPSUZYSFgrRTNIZ08wbjlkT3pxUnVETlRz?=
 =?utf-8?B?TEVEYmVRS1VlNFdFMlM4Z1F1RlIwVFMyVFg5Z2t2L0pyUlZmckdZV1JGYUh3?=
 =?utf-8?B?R0VMcTVnZFFBdkF6Z3BuTjJ1cjJ0TXBpVGdveTdMUTdzUEljRjFGc3M5OHBy?=
 =?utf-8?B?QVNub2dQWHpRMkxYQ0kxUExuOWluL3RPdTB0RkhEY2Z4NW02OVAyakRnWmVF?=
 =?utf-8?B?THpCSXdoKzJtNkdaMlRhV01yYVJ2Z3dkUUNtRk55b0ZkOFlSTGdPLy9Jc0Vy?=
 =?utf-8?B?Y0JqZWpzS3ozUmdlQ052bHF3aDhMR1o5SWRrcTVGSldZZGZDbzFpc1J2cWMx?=
 =?utf-8?B?ZlVXRWlnZzVjaFZvd05udXJaa0dNM0QwNkVGV21UYlNCK0FYUEEwUVFQeElW?=
 =?utf-8?B?R05aWDRnTVFzOXU5VVdJZ1Y0S2w3SEpyNU9QbVJPcXU4cTMvV0hWUXU0KzJs?=
 =?utf-8?B?L0wvbkdSVldJWWYydktDb3BCWnpjMXpTL2RXbEFsUDF4VDE1VTRoNTFaYzB3?=
 =?utf-8?B?Vm1rNExpS2liZWdDYmtGRFpheml2bDRWNzQrcGRNb3JUR2pHTjFQOVhMNUJk?=
 =?utf-8?Q?YZ2w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXBCSXpBSzUxeHM3dWZJUTdKUTZoazVyOXNmN0VHanh0T2lUeWpBNzZtMzJY?=
 =?utf-8?B?bEhlMDF5VWVndW8zRHBjTFJ0QUdoS3F3Ri9teWF4cFNudDB0NWRtV0Q1aS9C?=
 =?utf-8?B?ZEJUY0IrMXB0ZzU5S29iVlNYeGloZnoxcVdlcThZazMvb1oxdHNZdUFFdWVw?=
 =?utf-8?B?c3hDWTVIRnlzVnBVbEdhcW82RzVQbGJ0bXJRNGxlOTk0T0tlU0pvZE9YSk9n?=
 =?utf-8?B?eEdmSjdXNTRLYWxIVDUyT2krM2laRVFHVHNqU1N1QVVzQzY0S0ZWNHowaE8r?=
 =?utf-8?B?R3BveGMxS0pXOTE4UHp5dXdaSm1iNFQ4Zkcrb0wrSWdpN0oxVzZYbWhwbXoy?=
 =?utf-8?B?cTdNdGJVa0tBd1BtRysvUmM2b2NYOG9JeVc4em44dUNpVzBiWUZ5czAzMzJw?=
 =?utf-8?B?MUZpU0FvUjZtZnNFQW5Xdk9HaUpOOUhyeTE5b3BwWW5FQWFXWnlkZUE5cFBp?=
 =?utf-8?B?QmV5dlRxb3JZaW0rTnFRbnMxY0VuWXZGbEViVS9FQXlERFl1dnRzbG56MDBI?=
 =?utf-8?B?N0lzMzlBUTVmUDYyekd4ZG5ab3F2WGJIdWdYdVN3VGNGNEFaaWovZU9ITXJP?=
 =?utf-8?B?SkJmN2hqUTJIY1lJQjhLeEh4R2lLdTduY1RweDNUOWYrcGoyRWVwNFB3WGVv?=
 =?utf-8?B?cTZqVjZSWWVsNStjaHNiUFRvdjUzSnNJV2hkVktnR25vSWZxTG5WLzk0VXNG?=
 =?utf-8?B?SWNDS1pRYVdYR0dHbExrOGp5SmU3N3M5MGc5eitJWlgvMTFsV3JrUWxJajVw?=
 =?utf-8?B?eUpUTTlWSE55VDdZbHFtZ3IvYVZaeG9BVmdWNXhnTzZKNitxbk9YWWFYYkpy?=
 =?utf-8?B?WXlocjhjQXowMS9OTmJ3MmRWN2RGcllrNXpxUUZ0cFZ2R0pPa3Q5SFFyNXdo?=
 =?utf-8?B?cE5vcUNDcm4wbmdCeTBQUG9NM1Z0NFl2aS9idk5WbldETXQrRVZObjUwSyt6?=
 =?utf-8?B?YW5PT0J3Q29uVlM2a21pajkzQXNIdjFMdFlOcURNRmV2NTNkNFJYNUVmRDJT?=
 =?utf-8?B?N05MZ0JXeFV0RjdOcG4xZHhTRVp1ajdoZlNDR2Y2c1dWeHZHYVd3YU4rajZT?=
 =?utf-8?B?WkIrM0F3MWljMnEwQkhoWjhKMlB5TGpITitlTnRRWWtmRmxZMVVITkpnbXFp?=
 =?utf-8?B?aFhNRXJkUHhEbXROK2tqYXpNZG9KZDdYN2RKMFZNNHEyWkJvR1ZtMU5NaHUx?=
 =?utf-8?B?Y2d3dkVHODY5UUJVeFNPWWtTcSs3bkZpMXJCN2xwcjhuNUZWVlkxZ1NWL3Fo?=
 =?utf-8?B?NmNIT0c2TlVHRXhrUlk1S3k5ZW1Jb2R6ZU5WVEJ6bFllNjhKN0gyMEFrOHJ2?=
 =?utf-8?B?Vmw4eHRuZURNTkd3Q0JmM0FNblY2NTB4VnhzZ1o2NFpUbXBsSEtubUtnczBh?=
 =?utf-8?B?RTdkTWlONjhOVmhUM2pxekh6bkY3aWgyRlpNWUEzSkxCTWhmaS92aGUrZ0t5?=
 =?utf-8?B?WW1iUzJ2clI0RkUxUEtNN2dqcWVxclB5bmxpdmZIcHIwdU41eUw2cG1CVFlj?=
 =?utf-8?B?dVA5QzB4Vm0rUW10TC9PL0FZSDdHWC81MU1WOVRRdjZ4aFNnYkJrTnI0NGwz?=
 =?utf-8?B?SkM4NmZ5cjNMZkM0MUtaN3pYYlppMzNCNGp3dWZ2Qm9pRGVxODIxcjMrWGFL?=
 =?utf-8?B?Um9wTm0xeGo1Q0dSY3BCU1VsSFpZeDlwTi9kL09VSFVPLzFndG1hMXl0OWNq?=
 =?utf-8?B?cElsTXUvV2dmWkc2a0RpWmlTVEY1K1VlY0t3cFpGUEMyVDFxcWRiS0xjZXpi?=
 =?utf-8?B?Ni9VazdvUHFNemh3R0dUSVJMSWlWVkdnb0s0ZDgxTkhoeWY4TGxMRytrc2pB?=
 =?utf-8?B?bUZscHRuMGdTeEs0NWxXOXpzaGJ1eEN4MFZZQWR4OE16QTFocHhMdlpkb2xD?=
 =?utf-8?B?MnFKMUlZWC9mWDN2NE9nd0FJWmorVHYvdTh0L3p1Z0cyQS95cG5URFBkNjZG?=
 =?utf-8?B?ckRWSGp1TzBvengxVytqMjBWRzFhQmNTQ05vSDFKMjhBU0hDUEFGcVBwanVv?=
 =?utf-8?B?OGpOeVRWdjZpNUNoZm9vK3dvZVF4SksyRXVxeGp0b0JIUU02MkJmUXJnTHMw?=
 =?utf-8?B?RVlVVXBqdlBZQkIwNUVxc3djVmtXdG5ZK0FPMkZEcTFydEh0SkdJcDB4M0dK?=
 =?utf-8?B?YU42Zm5OVWtrOWZBT3luUFVvYlFOdWFuOUdmQ054MHBmSjJPWW1SOURTUGd5?=
 =?utf-8?B?bHpqRURKKytwVXJ0UE5MaU1PRW9KdjF6M3RtUjBBOVBwT1A5eDdSSWh6bFJl?=
 =?utf-8?B?blhkVGRmeHNST3oySk1GYjNBMXdzaTVHOWo5R0Z0cEt6NTFDc1JGUWJiWElR?=
 =?utf-8?B?T3JvajV4MDNKdllGUEtYQ0w5THA3Nzd5WjJ6Vzd0M0U5QitPMHovZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 148132fc-4c53-4008-48f5-08de686395e8
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 05:16:46.2555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIbSeMCbSwdvuJsHSNUC2QdGxAlxm5dB0g5l8LVkdvE8TIbblk2cPa50NRxhRLZecLmhLUkSFFWWSOvwZXd72A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7243
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

Ignore this patch.. NAK

On 10-02-2026 08:21, Arvind Yadav wrote:
> Applied Wa_14024997852 to Graphics version 20.02
>
> v2:
>     - set Bit 31 of FF_MODE, for TE autostrip disable (Nitin)
>
> Cc: Nitin Gote <nitin.r.gote@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_wa.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 1e8d61ac581b..08a7dcdc1a72 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -874,6 +874,18 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>   	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
>   	},
>   
> +	{ XE_RTP_NAME("14024997852"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2002), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_MODE,
> +			     DIS_TE_AUTOSTRIP |
> +			     DIS_MESH_PARTIAL_AUTOSTRIP |
> +			     DIS_MESH_AUTOSTRIP),
> +			 SET(VFLSKPD,
> +			     DIS_PARTIAL_AUTOSTRIP |
> +			     DIS_AUTOSTRIP))
> +	},
> +
>   	/* Xe3_LPG */
>   	{ XE_RTP_NAME("14021490052"),
>   	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
