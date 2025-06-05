Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A760CC5B543
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 17:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E7E10E316;
	Thu,  5 Jun 2025 17:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEVnbwgR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438BA10E2C8
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 17:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749143809; x=1780679809;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ujeEOCO7whFApyj7X7K3qSB25/ByPcXIq3HT1RHA47E=;
 b=cEVnbwgRKtloBdVFnWMKrgTd+M+64GMLI43wmQ67E/vdDAu6zQLs0Xeb
 Gqy2wwwOvVOJZMM/+7xF4Vr0bh3FoNeueGh9TWqTxUjF2hasFyqbWgGyL
 BJeEIpoHKDnd20+4AXJZIEq82100sHvKLlxZFMfiIzbCTMp32F5N/BpwQ
 8dK5fdBIzfDQrBN1iSGzhLNol3V7IKQayz6/Sehq/yc3iVkJvqDGObW92
 5cZEc7Zz5sK1tXHbwbW0iuz2OJuBYENwRNV4TDQ0AwklwzZlhQQYTLAAA
 blDyhtokK/24mWiOX3+JcNUKCqliqX1K9GToD9BgyKW0OOtM4I6SH6CtN w==;
X-CSE-ConnectionGUID: PDUw0f2OSjqeBnFAhjrC1g==
X-CSE-MsgGUID: 1cjWzNLxRYKu82D/4GIsHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="76676439"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="76676439"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 10:16:49 -0700
X-CSE-ConnectionGUID: mrTbs3qiRmG8RcFMIMPuUg==
X-CSE-MsgGUID: y/0tTiRaR+CAdZbJbzXC3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="145460935"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 10:16:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 10:16:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 10:16:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.67)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 10:16:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0fpAu3jv/Qs5ryJvniRsjwJ+q6FZGX3Cwuz7H3z533R+Hk8sB7U9byYaX4PZhffht8/FfLq87/ck40QlpuORvXHxDg40ivrBd2fE2yoJ/P8gf9TXzdxTNm7yIpJaIkJyaOyU/YfMW6t02Wf92Yr7pyTCAC78Q1gJh1ftBns2W8sjnsp5QLAyuf2//TdZI3RyVFfCTzOBtFBJqW0DQK0KYZsqIz1gRQx2hJ5BgpqE/u10hOG4YEAhizC2TsBVeVY+2KVfpTLflc+Hz/mEFq1DPrihVCnW6j0/JliMol7XEQN+89X4vJR6IKh8l6dTbYTnFa3TsuN0+x5Jvo2zk9K3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qjErI96/OAV1afvqqDwfynh5p4MxvjMePtJs8oxRYU=;
 b=axn125lfU4bJIblIsO/0wUU01qcPNfH/oO03eMV2Vx6OLYQ+eLqxeIR+aZE0MHb9fhEGgahci0dWa/CqC2lYOajE34OMl1raUhJzcly99XmYOFyBMo1bBrhSufbsYsEUfqJrEkv/UA59mkwDK3R+S/xdu21w7YAkilPEUwDqYJN734LcGaM3S7IpOUrhy/6b6xtqPOZwkv2OFoFMGMHHuoXQxklrSmbXmfTNTOki1Wegq4e1X69GiUiLAT6qHlal46ImrNfHuM3R5saJfW/PIbsP0uDnGLecTiXIl3bMsekG0yH3rgtKWD8/QNUAqtEIdPwMz5D51ZI3bHFiOnquRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW6PR11MB8390.namprd11.prod.outlook.com (2603:10b6:303:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 17:16:46 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 17:16:46 +0000
Message-ID: <f0c53d07-457d-4ace-ace1-e4b517b25fba@intel.com>
Date: Thu, 5 Jun 2025 22:46:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v11 4/5] tools/gputop/xe_gputop: Add gputop support
 for xe specific devices
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <krzysztof.karas@intel.com>, <zbigniew.kempczynski@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>
References: <20250522154447.496407-1-soham.purkait@intel.com>
 <20250522154447.496407-5-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250522154447.496407-5-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW6PR11MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: f41752c4-a8ac-40f4-9c20-08dda454c012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFN6ZjhjS0xkZGtmWk96Y1Nwb3l6WjF2ditJWWhxZFA5UUdScUUrcmxYblk0?=
 =?utf-8?B?WG95RFROUk5kQm4rVDZhNmlZckZxYjFsT2xUZGJ1d2lJQmtOQjRMS2RTYVRy?=
 =?utf-8?B?TDQvSjNsWmpuaGtrdlRpL0ZnY2d1TnFMQVYzZmJSaG12b0hLSUN3QXk1bU1j?=
 =?utf-8?B?eGJxRGtKQWtWM3dQc29wQkwyRkZhZVVpOEhVWnFsc21KSnZkdGZSbTV0WG9v?=
 =?utf-8?B?bmJ2cXdONGJLdzNtVFpBS0JReVA4SUFOVG1obGFKUHZtYjlCMGlRUDFoMTZL?=
 =?utf-8?B?eU5QdFoxYXJpVHhhUlpWSEJRdTdwMTZnTnJ6MjUzRUF0cjhwUm9GZ0hGaW9K?=
 =?utf-8?B?NENheUpRZng1bmtFcDI0TVBabjlZKzc4bE9VQkN2N2FyRmpOdTR5N3BCQi84?=
 =?utf-8?B?cmxFMzlCNUpjVDFJQVNxOXhhWDZUcFFHY0lWdFN2cGNKTElIYXZPZHJFQ2NX?=
 =?utf-8?B?RUg1cjBOVU4xU2QxK2xmRlZVajVIZkxPTlF6MzJoWFhieGpKRHg1MW5NUjAy?=
 =?utf-8?B?eWlPQW03TWtCRUZ1cWxLRkNHZTRsaitSZ0E5QThkYjc3Zmt3MTlDOHVqRzlk?=
 =?utf-8?B?TlpaUGVvcTZmdDRNQ3VvaGtQOEhjejRNU0tCZFFSRlIwR2pDNFFHSThlS2N3?=
 =?utf-8?B?NTQ3eXNIaFdrTWgzeSszQ1EwdmZLaXhJRmdobU93akl5SzJ3bzMycklYT1pN?=
 =?utf-8?B?emxzenE4ZnNmNjB0Rmp5QloyY1ZyRXRaK2dtK3NxUlZjenRkREdTYVFhT3Bh?=
 =?utf-8?B?Nk93TTZZeGt1Zmx1RWRLN3BWcFJ0S0NCS0FTaUZRMlNadlBjUDF0OEhTRWxU?=
 =?utf-8?B?bU9SL3RmRWxEeVVEb0orWnpaWThWV1orL3BNNjVXVlJudlZjV29lV2hpTzNv?=
 =?utf-8?B?OUh2VklnMEtPcGpZNCtzUGwvbE15TnphdHl5ZkVsRmdlcVpmeXdOanlQUFZR?=
 =?utf-8?B?amF4SlkzOWEyK2w5WVdWYlNDZ0pGUTliWGtIa0J0K2FFeVFWc0JiTzhGWEZC?=
 =?utf-8?B?SUZHcnZLV1laTTNmbUl4alBRcXFDd21Ga2E5dUhEcFNXZldoakxpcVJTb2Zp?=
 =?utf-8?B?MmR4SVlVWXVmNWl5LzZsNTVrTnpzWW9zY01ycElraVV4S0Y5RWZmbVBpeVVS?=
 =?utf-8?B?d1d4YVFzaTVCT2UzRmIvb1BuekYvQnM0TzFRVlZIWmU5VGJVRlNFc2V4NE1X?=
 =?utf-8?B?VG5nbDVudDdDMXF2OENmWmlmUkZTSWVjMktmWVozQm9JdDNUcUNENnNtcmlk?=
 =?utf-8?B?ZmZDZ3BXOXYyNzdsa2NleUJlekkzNUhGTmZsTTVLM1poVFljdW4wR25SNVRP?=
 =?utf-8?B?SkJMK3J3UnVmbUMzZmtQUnVIT3hZTlNENTFEc05HK25Wc05ESmhScmFkcnZN?=
 =?utf-8?B?cGkxQ0tMRkNzbHBubm8rakdtRTVnY25iL2tVbFQ1bVVodk52OWYrRGVYSHJB?=
 =?utf-8?B?NXgycjBQeHNKSWRISUxmWnlnZWg3WVN4VWsxNU1SNVMvd1YrZ09nelVNampD?=
 =?utf-8?B?UnIxWWRkR3g3M2k1UUtvRmN3eFptdkYwTzdNcjE1emtEd3ZXR2czTXo4Z2tL?=
 =?utf-8?B?enQyWWYxaWliU216WW54K1hzamNEVml5L3NudGs1UlIvNThRTHhNVDN3N1lv?=
 =?utf-8?B?N2ZraHFsanZMeTNEaHJMQUJTWEpzNjNoaWJBdDcxZVZDZVFSYW9BYTNacXUr?=
 =?utf-8?B?ajExMnRnemJYTFZtUU5FTGZIeU9qUDZJMERjKzhRVUYveGpHa1hHRkQzVlc0?=
 =?utf-8?B?eTFyU1V6R2tLblIvMmlaOG14eHhvTHY2dGFpdmRkRlE1NmxMMDF6SnFGcUg0?=
 =?utf-8?B?eFZSekh1UjFTQS92V3RkdmJUdGV5RTd4eHhYOEFBWWZNc1RrZmZ2Ukh0T0ov?=
 =?utf-8?B?dG1NZnZXR3dMUlZmUkxzY3pDbE1HRllFT0FrSm1rNjZDcVkxSmxMVlFEdGFJ?=
 =?utf-8?Q?sRI6p2PSFHI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEhGWGNCZXVUNlk2YWdydWVQV25WcTEvbnl6bnZiWjEydFNWMnJFV2dhMXJT?=
 =?utf-8?B?U1hUclAvaGdHWWRGNFVNaFlGTGtJdFo5QUNhRlBVVHVNUjUwYmF5RExWQ3h3?=
 =?utf-8?B?Nk81Si8wT0NLV0x4eHdqcTY0T01LdExFeEhPWG82Y2hPRWRDS285Ky9SV2o2?=
 =?utf-8?B?OUtPYStndWZadnlLRFo5L1ZMTzhHdEFsTDhNejdSbGNINWVKZHB2OWRDcnZG?=
 =?utf-8?B?ajlNTWpQNGl4M1NzRm9yWWNWUEJhZDUxdHkwa2NDYWY5L3lENmlrTERKV1Z6?=
 =?utf-8?B?OXlDdzdkMlE0WStPeVNPYm9nbXlxTk13Tjlndm51TGhOb3hZWk5FakRDbW8r?=
 =?utf-8?B?UHE3bS80ZWQyR3ZzaTB1a1dTWC9mdXVZSzdicFl1MysxWElqczJKcENtd1ox?=
 =?utf-8?B?dm5KaElqYnpETDVKekNzZEh2bzJmc1JERkJUbitlblFNRTk1L05hcmpSSm9Q?=
 =?utf-8?B?NkhBT05UdjZ0UlZPMUVndFVOU1BYUFhhb0hEaW81RkswNzVlcFh6YTVFN0RI?=
 =?utf-8?B?Z0xyQy9hY0VJRWN6c3pqN29wSGdKTE9nNUxvUE9sSllVV1dIMFdmbm05L0tm?=
 =?utf-8?B?V0N4SDcrOE1YT3hjd0Nld3J5cDFjSGZReUMrZ1ZKYW90R3NmTVREQWlaKzI0?=
 =?utf-8?B?SGtIWlluYWFUU3JpTkdGV1BSZlBnNmtrdCtSaXA5TkZOYnMwNWloeFR6MVph?=
 =?utf-8?B?a2swRkZ2QlVacDErcUk4RFBtY2dmaWoyN0VOM2pLQk1uY1gzSlNiQ3QyQitH?=
 =?utf-8?B?cjdBZGhNRHlFWkhtempiVng3MXFpMlA0RnJPQytyb1hXTmlYbDJkYjdPeTRy?=
 =?utf-8?B?NnZZMmdIWVlxTHNiUmtoeVpHODd3bE5tWFIxenRVNUI4TzBuRkZ0VC9LMldl?=
 =?utf-8?B?WVFXZzY3cVRwMDVkazZ4WmdBNVowaWpOZ2hFb2k1WktZM3BrZGNhOG9VNHVJ?=
 =?utf-8?B?dW1VOW9MVmxJZkNwQnllNTJvZ0I1Q3NLdXlrZmpzbDgrM0ZqNGEraWJyT3VL?=
 =?utf-8?B?NEhBcXI0TFJvV0VYMGdlTmxXb0NFQlNIU0xlcUdHOVZDcEIra3NyQ2dKYWRC?=
 =?utf-8?B?MUlEKytVWXFFb3BXTU13a1RrMFpEa2RXY3QvS05aVmlObGo3TlUraUlialRk?=
 =?utf-8?B?OHhobU1pa3VhSnM0c0NwTHVOeFZKNDFiNWpSU2NMd3JnUGhESEk5b2pGY3hD?=
 =?utf-8?B?WnRjYVN6VmxyMGg5aTl3Z0NuTncxTjg2SCs4ZTk4MHVpZzZteC9VOGR3Lzkx?=
 =?utf-8?B?YWRabVNtbWdMTHUrRmpaVWVRSDAxSHdBd050eDJNRmM3NmorcTk3QzVUYlJM?=
 =?utf-8?B?SXlxU0pkZDNjTm5leE9KN3ZJUEFkSHpHZ01lb0ZrUlVHY1RuR2Q4aTlYaVZp?=
 =?utf-8?B?VFFuczdyWFZmTTlDazFCdEFWMEF6T0lQTVMxRFlNdHVTWERjMXozdDJNRVhK?=
 =?utf-8?B?Smxac2NoWGNOTUxnTTVvV1M3TlM1U0VTMzdTS1dPbGp0N3JScDExNUo2UDcx?=
 =?utf-8?B?M0RkWC8vSUdENCtnQ05pcUhrekxwZzduM3BOK2lVbEFJSW4xNnhpS0p5WGdw?=
 =?utf-8?B?eDEwQS9FaUJTSmEzTm15aksxODNGZHE4WkszNThqSndjTVoveVJlSlY5SFhz?=
 =?utf-8?B?Mk41UTZlUEZPY3BkODdvZkZkTzhYQXRPekNuUTlRQjZIZHlWRHlZemZuY0E2?=
 =?utf-8?B?MG93ai9kbXNJTE1oRDJ5aGRyRHBGNTAzbTJhd3RwR0Zzc1NqOUtjUUk0dy93?=
 =?utf-8?B?MERVa1ZFcit1dWVncHowUW9GK0RHV0F4V2dxTytNcEtUU0phblMzMGN3RS9x?=
 =?utf-8?B?djRqN29YVmhXSDN1MldkOTR0T2FRUy9TNmtRUjgzTEpVN0hmeml0OXJURXgr?=
 =?utf-8?B?T09qTmZ4ekZTOHRZaHlJNVJDY2Fsd0dPQ21qZzVGUm4xdUFFbEN1UWg2NG9I?=
 =?utf-8?B?TncxbVgyQitiNTYrSFBjMVl3WnVWM09hTFF0TVJZZXNwdnJZWEhJN3Y5TDNj?=
 =?utf-8?B?S2ZEWGZOamRZWTA4ZDhxclUvTjMwKzh5aTdOc3U2TDh5R1JaVWlxK2RUdTU3?=
 =?utf-8?B?YkQ5WmwwcUg5Q0hNVVJJZkxiQklRODFjSWNhSWxlcmlJMldyQjkrV0owR1dh?=
 =?utf-8?Q?dTP4CyP9xKb9ElXtQ3S4wKyt7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f41752c4-a8ac-40f4-9c20-08dda454c012
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 17:16:46.5258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6fkT/Cr/vwSdoYRCaw2Y5lbiwHES+ygPeqUxpFGsq5IijK5zO2G0IlDr8wK9/OM4qX0Boj2FqzVEmSPWigTQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8390
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

Hi Soham

Some minor comments

On 5/22/2025 9:14 PM, Soham Purkait wrote:
> Add gputop support for xe-specific devices. Separate
> driver-specific code into respective source files.
> 
> v2 : Fix for refactoring GPUTOP into a
>       vendor-agnostic tool. (Lucas)
> 
> v3 : Separate commit. (Kamil)
> 
> v4 : Headers in alphabetical order
>       Engines memory allocation at
>       the beginning all at once.
>       Removed PMU normalization. (Riana)
> 
> v5 : Refactor to eliminate redundant
>       and unused code segments.
>       Fix for proper resource cleanup. (Riana)
> 
> v8 : Allocated card structure memory inplace and
>       accordingly modified the clean up code.
> 
> v11 : Loop optimization in xe_populate_engines.
>        Removed short_name.
>        PMU fds are closed on cleanup.
>        Removed unnecessary comments. (Riana)

lot of versions maybe squash all the comments into one and start new 
series. But upto you

> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tools/gputop/xe_gputop.c | 378 +++++++++++++++++++++++++++++++++++++++
>   tools/gputop/xe_gputop.h |  62 +++++++
>   2 files changed, 440 insertions(+)
>   create mode 100644 tools/gputop/xe_gputop.c
>   create mode 100644 tools/gputop/xe_gputop.h
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> new file mode 100644
> index 000000000..ac3ed76e6
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.c
> @@ -0,0 +1,378 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_gputop.h"
> +
> +#define engine_ptr(engines, n) (&(engines)->engine + (n))
> +
> +static void __update_sample(struct xe_pmu_counter *counter, uint64_t val)
> +{
> +	counter->val.prev = counter->val.cur;
> +	counter->val.cur = val;
> +}
> +
> +static void update_sample(struct xe_pmu_counter *counter, uint64_t *val)
> +{
> +	if (counter->present)
> +		__update_sample(counter, val[counter->idx]);
> +}
> +
> +static const char *class_display_name(unsigned int class)
> +{
> +	switch (class) {
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return "Render/3D";
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +		return "Blitter";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return "Video";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VideoEnhance";
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return "Compute";
> +	default:
> +		return "[unknown]";
> +	}
> +}
> +
> +void xe_clean_up(void *obj, int len)
> +{
> +	struct xe_engine *eng;
> +	struct xe_pmu_counter pmu;
> +	struct xe_gputop *dev = (struct xe_gputop *)obj;

Use inverted xmas tree

> +
> +	for (int i = 0; i < len; i++) {
> +		if ((dev + i)->card)
> +			free((dev + i)->card);
> +		if ((dev + i)->eng_obj) {
> +
> +			for(int j = 0; j < ((struct xe_pmu_device*)(dev + i)->eng_obj)->num_engines ; j++) {
> +				eng = engine_ptr((struct xe_pmu_device*)(dev + i)->eng_obj, j);
> +				if (eng->display_name)
> +					free(eng->display_name);
> +
> +				pmu = eng->engine_active_ticks;
> +				if (pmu.present)
> +					close(pmu.fd);
> +
> +				pmu = eng->engine_total_ticks;
> +				if (pmu.present)
> +					close(pmu.fd);
> +			}
> +			free(dev->eng_obj);
> +		}			
> +		if ((dev + i)->pmu_device)
> +			free(dev->pmu_device);
> +	}
> +}
> +
> +static char *pmu_name(struct igt_device_card *card)
> +{
> +	int card_fd;
> +	char device[30];
> +	char *path;
> +
> +	if (strlen(card->card))
> +		card_fd = igt_open_card(card);
> +	else if (strlen(card->render))
> +		card_fd = igt_open_render(card);
> +
> +	if (card_fd == -1)
> +		return NULL;
> +
> +	xe_perf_device(card_fd, device, sizeof(device));
> +	path = strdup(device);
> +	close(card_fd);
> +	return path;
> +}
> +
> +static int _open_pmu(uint64_t type, unsigned int *cnt, struct xe_pmu_counter *pmu, int *fd)
> +{
> +	int fd__ = igt_perf_open_group(type, pmu->config, *fd);
> +
> +	if (fd__ >= 0) {
> +		if (*fd == -1)
> +			*fd = fd__;
> +		pmu->present = true;
> +		pmu->idx = (*cnt)++;
> +		pmu->fd = fd__;
> +	}
> +
> +	return fd__;
> +}
> +
> +void xe_gputop_init(void *ptr,
> +		    struct igt_device_card *card)
> +{
> +	struct xe_gputop *obj = (struct xe_gputop *)ptr;
> +
> +	obj->pmu_device = pmu_name(card);
> +	if (!obj->pmu_device) {
> +		fprintf(stderr, "%s : pmu_device path returned NULL", card->pci_slot_name);
> +		exit(EXIT_FAILURE);
> +	}
> +	obj->card = card;
> +}
> +
> +static int pmu_format_shift(int xe, const char *name)
> +{
> +	uint32_t start;
> +	int format;
> +	char device[80];
> +
> +	format = perf_event_format(xe_perf_device(xe, device, sizeof(device)),
> +				   name, &start);
> +	if (format)
> +		return 0;
> +
> +	return start;
> +}
> +
> +static int engine_cmp(const void *__a, const void *__b)
> +{
> +	const struct xe_engine *a = (struct xe_engine *)__a;
> +	const struct xe_engine *b = (struct xe_engine *)__b;
> +
> +	if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
> +		return a->drm_xe_engine.engine_class - b->drm_xe_engine.engine_class;
> +	else
> +		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
> +}
> +
> +void *xe_populate_engines(const void *obj)
> +{
> +	struct igt_device_card *card = ((struct xe_gputop *)obj)->card;
> +	struct xe_pmu_device *engines;
> +	int ret = 0;
> +	char device[30];
> +	struct drm_xe_engine_class_instance *hwe;
> +	int card_fd;
> +	uint64_t engine_class, engine_instance, gt_shift;
> +	uint64_t engine_active_config, engine_total_config;

Use inverted xmas tree

> +
> +	if (!card || !strlen(card->card) || !strlen(card->render))
> +		return NULL;
> +
> +	if (strlen(card->card)) {
> +		card_fd = igt_open_card(card);
> +	} else if (strlen(card->render)) {
> +		card_fd = igt_open_render(card);
> +	} else {
> +		fprintf(stderr, "Failed to detect device!\n");
> +		return NULL;
> +	}
> +	xe_device_get(card_fd);
> +	engines = malloc(sizeof(struct xe_pmu_device) +
> +			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +	if (!engines)
> +		return NULL;
> +
> +	memset(engines, 0, sizeof(struct xe_pmu_device) +
> +	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +
> +	engines->num_engines = 0;
> +	engines->device = ((struct xe_gputop *)obj)->pmu_device;
> +	gt_shift = pmu_format_shift(card_fd, "gt");
> +	engine_class = pmu_format_shift(card_fd, "engine_class");
> +	engine_instance = pmu_format_shift(card_fd, "engine_instance");
> +	xe_perf_device(card_fd, device, sizeof(device));
> +	ret = perf_event_config(device,
> +				"engine-active-ticks",
> +				&engine_active_config);

wrap around at 100

> +	if (ret < 0)
> +		return NULL;
> +	ret = perf_event_config(device,
> +				"engine-total-ticks",
> +				&engine_total_config);
> +	if (ret < 0)
> +		return NULL;

add blank line

> +	xe_for_each_engine(card_fd, hwe) {
> +		uint64_t  param_config;
> +		struct xe_engine *engine;
> +
> +		engine = engine_ptr(engines, engines->num_engines);
> +		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
> +			| hwe->engine_instance << engine_instance;
> +		engine->drm_xe_engine = *hwe;
> +		engine->engine_active_ticks.config = engine_active_config | param_config;
> +		engine->engine_total_ticks.config = engine_total_config | param_config;
> +
> +		if (engine->engine_active_ticks.config == -1 ||
> +		    engine->engine_total_ticks.config == -1) {
> +			ret = ENOENT;
> +			break;
> +		}
> +
> +		ret = asprintf(&engine->display_name, "%s/%u",
> +			       class_display_name(engine->drm_xe_engine.engine_class),
> +			       engine->drm_xe_engine.engine_instance);
> +
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +
> +		engines->num_engines++;
> +	}
> +
> +	if (!ret) {
> +		errno = ret;
> +		return NULL;
> +	}
> +
> +	qsort(engine_ptr(engines, 0), engines->num_engines,
> +	      sizeof(struct xe_engine), engine_cmp);
> +
> +	((struct xe_gputop *)obj)->eng_obj = engines;
> +
> +	return engines;
> +}
> +
> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> +{
> +	uint64_t buf[2 + num];
> +	unsigned int i;
> +	ssize_t len;
> +
> +	memset(buf, 0, sizeof(buf));
> +
> +	len = read(fd, buf, sizeof(buf));
> +	assert(len == sizeof(buf));
> +
> +	for (i = 0; i < num; i++)
> +		val[i] = buf[2 + i];
> +
> +	return buf[1];
> +}
> +
> +void xe_pmu_sample(const void *obj)
> +{
> +	struct xe_pmu_device *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	const int num_val = engines->num_counters;
> +	uint64_t val[2 + num_val];
> +	unsigned int i;
> +
> +	pmu_read_multi(engines->fd, num_val, val);
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		update_sample(&engine->engine_active_ticks, val);
> +		update_sample(&engine->engine_total_ticks, val);
> +	}
> +}
> +
> +int xe_pmu_init(const void *obj)
> +{
> +	struct xe_pmu_device *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	unsigned int i;
> +	int fd;
> +	struct xe_engine *engine;
> +	uint64_t type = igt_perf_type_id(engines->device);
> +
> +	engines->fd = -1;
> +	engines->num_counters = 0;
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		engine = engine_ptr(engines, i);
> +		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
> +			       &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
> +			       &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +	}
> +	return 0;
> +}
> +
> +static double pmu_active_percentage(struct xe_engine *engine)
> +{
> +	double pmu_active_ticks = engine->engine_active_ticks.val.cur -
> +				  engine->engine_active_ticks.val.prev;
> +	double pmu_total_ticks = engine->engine_total_ticks.val.cur -
> +				 engine->engine_total_ticks.val.prev;
> +	double percentage;
> +
> +	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
> +	return percentage;
> +}
> +
> +static int
> +print_device_description(const void *obj, int lines, int w, int h)
> +{
> +	char *desc;
> +	int len;
> +
> +	len = asprintf(&desc, "DRIVER: %s || BDF: %s",
> +		       ((struct xe_gputop *)obj)->card->driver,
> +		       ((struct xe_gputop *)obj)->card->pci_slot_name);
> +
> +	printf("\033[7m%s%*s\033[0m\n",
> +	       desc,
> +	       (int)(w - len), " ");
> +	lines++;
> +	free(desc);
> +	return lines;
> +}
> +
> +static int
> +print_engines_header(struct xe_pmu_device *engines,
> +		     int lines, int con_w, int con_h)
> +{
> +	const char *a;
> +
> +	for (unsigned int i = 0;
> +	     i < engines->num_engines && lines < con_h;
> +	     i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		if (!engine->num_counters)
> +			continue;
> +
> +		a = "            ENGINES   ACTIVITY  ";
> +
> +		printf("\033[7m%s%*s\033[0m\n",
> +		       a,
> +		       (int)(con_w - strlen(a)), " ");
> +		lines++;
> +
> +		break;
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engine(struct xe_pmu_device *engines, unsigned int i,
> +	     int lines, int con_w, int con_h)
> +{
> +	struct xe_engine *engine = engine_ptr(engines, i);
> +	double percentage = pmu_active_percentage(engine);
> +
> +	printf("%*s", (int)(strlen("            ENGINES")), engine->display_name);
> +	print_percentage_bar(percentage, con_w - strlen("            ENGINES"));
> +	printf("\n");
> +
> +	return ++lines;
> +}
> +
> +int xe_print_engines(const void *obj, int lines, int w, int h)
> +{
> +	struct xe_pmu_device *show = ((struct xe_gputop *)obj)->eng_obj;
> +
> +	lines = print_device_description(obj, lines, w, h);
> +
> +	lines = print_engines_header(show, lines, w,  h);
> +
> +	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
> +		lines = print_engine(show, i, lines, w, h);
> +
> +	lines = print_engines_footer(lines, w, h);
> +
> +	return lines;
> +}
> +
> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
> new file mode 100644
> index 000000000..825ac7e34
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_GPUTOP_H__
> +#define __XE_GPUTOP_H__
> +
> +#include <dirent.h>
> +
> +#include "igt_device_scan.h"
> +#include "igt_perf.h"
> +#include "utils.h"
> +#include "xe/xe_query.h"
> +
> +struct xe_pmu_pair {
> +	uint64_t cur;
> +	uint64_t prev;
> +};

Is an extra struct needed here. you can add it in below struct

> +
> +struct xe_pmu_counter {
> +	uint64_t type;	
> +	uint64_t config;
> +	unsigned int idx;
> +	struct xe_pmu_pair val;
> +	int fd;
> +	bool present;
> +};
> +
> +struct xe_engine {
> +	const char *name;
> +	char *display_name;
> +	struct drm_xe_engine_class_instance drm_xe_engine;

%s/drm_xe_engine/engine

> +	unsigned int num_counters;
> +	struct xe_pmu_counter engine_active_ticks;
> +	struct xe_pmu_counter engine_total_ticks;
> +};
> +
> +struct xe_pmu_device {
> +	unsigned int num_engines;
> +	unsigned int num_counters;
> +	int fd;
> +	char *device;
> +	struct xe_engine engine;
> +};
> +
> +struct xe_gputop {
> +	char *pmu_device;
> +	struct igt_device_card *card;
> +	struct xe_pmu_device *eng_obj;
> +};
> +
> +void xe_gputop_init(void *ptr,
> +		    struct igt_device_card *card);

Wrap around at 100

Thanks
Riana

> +void xe_populate_device_instances(struct gputop_device *dv);
> +void *xe_populate_engines(const void *obj);
> +void xe_pmu_sample(const void *obj);
> +int xe_pmu_init(const void *obj);
> +int xe_print_engines(const void *obj, int lines, int w, int h);
> +void xe_clean_up(void *obj, int len);
> +
> +#endif /* __XE_GPUTOP_H__ */

