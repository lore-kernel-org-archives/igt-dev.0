Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3367AC83F25
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 06:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D5E10E112;
	Wed, 23 Jul 2025 06:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bfl4OyuB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4269410E112
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 06:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753251908; x=1784787908;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GNRn8PHnG7xSATOHwTW/NMFS0tAYzLDi0nHaNto5ymo=;
 b=Bfl4OyuB2wLj+kzOSg+Bdo0YBuE/JFVdvcQryHZvn00gyo2BNtV+Yx7X
 j+KrOjnwhfACo9lB5BuzVXaAFxlGosdfNXfTXwpHdAfMCh6J3r9COgIGD
 GETw4R3muo0kGYEDIvd2iUP2hRjEpUWd41w4b+Zcajm267PexmzatuL90
 S2HRgCm/gmZoKe5yTeXbQxOujw1pJgM521tM+t9CzAnxcow8pHN3Xvswe
 aaBVybeYUeFEXtEFduL1gQH58damtzb2Bn00nxUUBQGBTlbZzMw1nha0d
 v4Elq/KSm4VWkMn6nfXjawsoVbV75tr9LzkL3tcRfYJ/r9Gtbn7vuxpAr A==;
X-CSE-ConnectionGUID: zAgPnvsgQKaxgHuLZGBQyA==
X-CSE-MsgGUID: US8Xa820SQmd74A0Xhyq6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55371143"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55371143"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 23:25:07 -0700
X-CSE-ConnectionGUID: QIIncuYqSeiEN+982BX5Ww==
X-CSE-MsgGUID: FsyC7WqgQJCSMYW6ufM00A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="163388051"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 23:25:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 23:25:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 23:25:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 23:25:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pk+1UwKqAjzC+8CKOogxOD7RZg5ye/uILsGEfFBtE9O0gCzja9aF9zxl0je+vMyugfYxJTh9I4ZNE2aR17oWn/HXm1n6dkaS+w9IfGUMWiOPKowdeVXdny4ElLtPykRgPa67bTXlbPrtvARfCzQOzDVL2cpOefetzNXfhx9daD3OOgG4pasT+Vs/ypMHJ5yRqedCyWt+wyMYDKaflJKmivQ59O9cXA9TTeVa0gbcfJww8qSJylkdOEx0vPGQV9WocNMj4Ov/3UhDR9Pn8nUxDEseuZccb5xWs5qNv4bc+4uknjteZ6k54jXXkVZyhCcn83Jr9WexafJEDXXgyPFXeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJFORXgUeJACrHcgGLDK1HN0kr6HH5SD9Tm+2Q2+CnY=;
 b=b2HBcAPAChaldBr5uE76YmdUe+YO6uTHuHQoMK+ys4iIwPAV/Mels6q0WnZqyuvxdizyZs3bqv1G5FV5W9K7wn9InJTde1UCLuDLQIeWm+0F6k5XwpTOSjrz1Y1ujXfG77uvEoee9+VIt87Md3mqZZ+kpJHOzjEyfAnWYK0ylkOxtEgx37m4pLOjqSqdbkGknpwBZVHmFHyny7blGkRS7/xad+orLPK0M5cgIzfaGbJIETVpgHAFu+TMoldjxLrevJ9Pxpl+6jkMppB81VbzMREYIPEq3m0VUGqtF2CBOiR+rFaH+FZ2J6EcMLeO+zEogNY1IEYgjFxPnT6gu6JKRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 06:24:36 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8922.028; Wed, 23 Jul 2025
 06:24:36 +0000
Message-ID: <7cf520e4-71f6-496d-ab7f-3821bfde1a77@intel.com>
Date: Wed, 23 Jul 2025 11:54:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] intel-ci: Block VKMS for i915 runs
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Swati Sharma <swati2.sharma@intel.com>
References: <20250722123920.78238-1-kamil.konieczny@linux.intel.com>
 <20250722123920.78238-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250722123920.78238-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA0PR11MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 5072caac-9ea3-4967-6cfe-08ddc9b19731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|42112799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkRtbHkzTmd4WlBxUjBVWXJ4UUFwdzR0M1FYMSt3LzRYdTJXUjNoczhHUlJB?=
 =?utf-8?B?ZDlnemJnQmEwTSsyc2VJZU9icnRYTTFKT2RpN0VxbnFGQ3kxbDNBRk5wSXNz?=
 =?utf-8?B?ZTRmcWFMZXI5cmlGT09CMG1STlphMlN3MkRkcFdhbEx2QjczT1RiMjNxeXNq?=
 =?utf-8?B?dnE4b2tscFRhQzFMeE1GdkFHS1kvQ3VqQ3A5a3BOa3VwNmxMdkNqVjVObWJF?=
 =?utf-8?B?U0Fnckk2UCswdW5ucDNoWTllVzBkK1d3cjcxMVhVdU9BSmVZUXQzWWZ5c1NB?=
 =?utf-8?B?dVZlQnFUY0RTdE5DRkNFUSs0L1NESlBVNjdZZFhpeC9HVzhOT2lvanNodmF5?=
 =?utf-8?B?bWIyWjd4Z0EyMmxYWC9CaUhaNUFkdlNJL2kwK3JEamoyVDFDdHVZUUhVSkky?=
 =?utf-8?B?ZXBVV05jbWM0T3JSdUYwaUF2K05yT3h3OEY5ZVRvbmRDV1ljekZZV2g1Z1NX?=
 =?utf-8?B?UFVIU1JuT2RSdDkvZ3l5Q204K0NRMm5QK3g2Ym9pTTFid05qTkluSnExNDEr?=
 =?utf-8?B?NGR5SFNWNFhybXFYTnBqMlJLVEpJZStpRUFNR1lGRmRTb0ZaT3ZUNkxIZHJo?=
 =?utf-8?B?Tk5IakZUU3dLa0YwWWdFRmo5L2IyMFNjM2pOa2tjZlB3SHp1bkkzbHJmU3BH?=
 =?utf-8?B?OGpkbFdPdmxpRnIyOElKODdQTDk5K0RxTjdLeGt2Rm10TWMvTUpMTWNYeXVD?=
 =?utf-8?B?M0M4NkY5TXIzUUlGT0JVeTFyZzBmeEl3dTNHL3FyUCt4RTdxTU40MFZPUnFs?=
 =?utf-8?B?bzRGUGV4bnpRK3duZzJUN0cwcmt6U2dwZHR4YVRpUlJzV1cwMW1IYlBUN3Z1?=
 =?utf-8?B?V05OZk5aSjdvZS9HR1drSUlpYW1pcGU1QUJpZm9jU1VVbnNiVkZkMHdMVWVa?=
 =?utf-8?B?ZUdIMHRreWFtbVVOaGRYTXZkdjVNMGxnNU5oVkNkZVFNMmxZOFdLWFlhUnpH?=
 =?utf-8?B?WjcwOGZrRTRJei9WVHZHWHZiUFlTVWFLSGdSUlFRTDRSVnlISHY3clRLL1E3?=
 =?utf-8?B?dHhiZXBZQWlPTkxKU3Ruc3g1RWpnVktWMXlleWVEZ0VmS0lEWEhJMi9vNEl6?=
 =?utf-8?B?VHk1Y3BuK2owWmI3MUo0eXY5V2FHL1BXdUdrb1RYdXJELy9TNVBFeHBEZUZ0?=
 =?utf-8?B?eVo4c0xGTG1XdUlsL1I4U1oxd0llT3FpUkV6ZmJXaXZMbktzV3BVSk5vcDBz?=
 =?utf-8?B?dHFZZjE1a1dzdS9KTGZ5eUd0V0luRHFmbmNCaUJraVQwckg0dEx2Tk5zUXNZ?=
 =?utf-8?B?ckt5TmFRTzU5L1ZjWVJOdnUwV3BXVnlWbTl6THVaQW5pZ3czOE5Ua3hVSUlY?=
 =?utf-8?B?c1AzOG1kd3FXdStJRW9TNXA5cy95cG0yeDV4YUJwN2YrWXkxQStUb2RjSzdC?=
 =?utf-8?B?SVhYTUpvRy9MbERXa0UwUkNneDNPN1c0Qnd2bEhnYTBpTXlaUGpUZS9DRFhU?=
 =?utf-8?B?MjgwcXZxaGo1cUN3YWhnTWxCdmNhREhZYmZUeUxheUY5Z3UrVDhJakJyRytn?=
 =?utf-8?B?VkdEYVF0NG9ubjVKb2t5ZGJzOVVJSFB2d0tENGtIT2FuSDd0NyszenFwV0o4?=
 =?utf-8?B?Y0c2aCttYk5wUEc0b0c5RzNhZVBKcVhibHZnYmxHaHVtaUxscnphUW1qdXZP?=
 =?utf-8?B?VTlnU0x2UnYzeFB1Q3hBMmltM0RpVGZXQTIyajcveGtlTzBXUk1UZnVNV0tl?=
 =?utf-8?B?alVHLzFwWWtDZHNBS1QvVS9HdkZYYU1ucXJqUzZDOU1DSE0xUHVaaE1pWTls?=
 =?utf-8?B?aXhNOVI5QWFXbzFDSG9udTQzUzc0V0JWN3IxRG42R2xyVzR5NllQTW5QMFpY?=
 =?utf-8?B?TjVwQk1lU1hMMjNRbVA1bG5WdGNkbFJRNlpBanVEZkFnd1M3MW5EQUpFbDg5?=
 =?utf-8?B?Z2E2SWRHMUVJeFZMRFlOeVdsaCt1TUdRSkMyWnJ4MTZQUm9sV2thSlh3RE5s?=
 =?utf-8?Q?jrr2/lhpr3o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzB0MmNKYUtmWEFFU1hEeVVOSEV1ejVQeHhqSUh3MzVuQ2xTbFRLS0RONW5u?=
 =?utf-8?B?ZEhhZ3A3WnpvbFo0SUN3MTNOZ2ZKdk9LMXVkbWpZOWRBRk1BYkgrZ2Z4WWk5?=
 =?utf-8?B?THRSOUVQb1BlZDRxVGl1cFpQWDhoSjJsU3FBWXZpS1ljZDF5b2pEMitTQjkw?=
 =?utf-8?B?a2N4dzY2VDl6dDdGN0tlcXJqRi9GTzBUWXJCM1lwL0M5cnBkeXY5ZWtJSmpY?=
 =?utf-8?B?SGRPRW9yZFVDenJBV3RjUDdVTkFkczlmSVRFaG1HcHNQeHJJYVZSWE54b3dZ?=
 =?utf-8?B?Y2YrN0ZBZDFNeDBPOG43Y2dLZVpWZ0IwZXpFRnNvU3hObXVRV0Jsb05SRVVK?=
 =?utf-8?B?Mldvd3hrV0xVS0dNcG8zK005dmN2Z3FCdFJTRlZrYnZUZ2ZscUVhS3QyaU9Y?=
 =?utf-8?B?S1E3Sm9aL3FaeDRrNWRCMzVqWTlxVEI4dU96UFdrUS8yaGlnYnhJUytGSUhI?=
 =?utf-8?B?Ry8yV0tuWWlmeHdYUzFqbXN4REt4RlZmN0poQ25RN1YzZWFiTlZlb1NLTU16?=
 =?utf-8?B?K3UweE11cE9ERXJVQlU1ZmJjR1FIaDNZdE4xQ1M0MEtiR0RhVFQ0QTJxdkJM?=
 =?utf-8?B?VkMzc2ZHcjdBeG1GZXZNUSt1NTl5VThUR2FJL2FENThZUEZUMXRPbFgrWlFN?=
 =?utf-8?B?aERrVWdHbHFHWkRXVEZYSkpWYXh3L0JkdnR4L25URTgvNVdUQmN2Y0ZwdlV3?=
 =?utf-8?B?TCtPOXZ5YWhXNUM3U3I2Vllld250RlBUcEFwbU4zTHlxY21LdHo5d0NtNU93?=
 =?utf-8?B?QS8xbzk3SGR2cHg1Mkh6WFJJVHRnSHFGU2FqM0QzVC9QYldURG51Ny9xaDdq?=
 =?utf-8?B?S1A5dUpNakhmLzIzNlFUdHpVN3Roa1FpVFU3MHUwL2FRMVpKQko0bjY0UHJu?=
 =?utf-8?B?TVozczNBN2t6U2Z4ZFVwOXZjazRmb0VDbE1lbDJiT1gvRVNSWjlhYlMvdDcy?=
 =?utf-8?B?TEN0UkNzdW1ndFVaNkdYaU1GOUt6V2xNVnVsTVVReEplTHkvQjB4S01iQ2N3?=
 =?utf-8?B?U2pQZkxOa2VTRi9xQk1GU3JKZldEMHFna3NuR2tvT0ttOGFLV3dOUlFGZ3d4?=
 =?utf-8?B?VmJVaE1Vb1FKYktHaWNBYXl0b3lQaFhZTmwzSXBlKzJJNk9qcGhrMzNIOXVm?=
 =?utf-8?B?aGx3dzdRcHZTR2NKeit2Mjcrd3FOb3FtNkNOZ0dSajBnSHNGeWMwYTB1dDFN?=
 =?utf-8?B?SnV2SEtGVDJxdllUME52aEcwWkJGVFhBQm92OGxNMGw1cVluQzF5R25QQmRy?=
 =?utf-8?B?dzM3RDZaUXJ2L2FvRnd0ZWo2WFByMk83d0VTTTJwRTZEcSsrWDA0S2RNa3J6?=
 =?utf-8?B?N3FnQmNsTm5pZHp2NWN4bTVCMlo2eGN6MTBkVnpqYzVmVGVlSkNBVVVTQVpq?=
 =?utf-8?B?cFBRZFE0NEV5OGUza1FOblQ3NkFVckdrakdLMHBIcmszM3VsNzA4SndpZmtm?=
 =?utf-8?B?akVkd2pUaGRSRVpsVHhXc3lCc0JFNU1BY0xObW83M2dKcVNEQkoxR3lkWE5X?=
 =?utf-8?B?NXlrQiswVE9lNFpGSzBjSmltbzlId05zMTV3MzltWUZBMHlBenhMSGNzUndx?=
 =?utf-8?B?MVhwaHhBUEh4NnlZN2tzeWxYSEJDL3VvdDNZMFVMd2V5WktEUDA0RFFLVWtS?=
 =?utf-8?B?M0FoTWtDNTdJYkxQNFNQODh1eVQyQUJCd0tZL0xIY01qRkVEUUl1d01qNktu?=
 =?utf-8?B?L1owK0k3RXlKVWlwamEraEx3SndnWi9XbFhGTlFwMWs0QlJ0S2QyMFBudG9U?=
 =?utf-8?B?N0JDU2ViZzQwSnByT2wvVWZiQjBLTzVWRU5MQ2VHV2lWaEFPZVh5K2pvM3ZB?=
 =?utf-8?B?ajE1VUttK1k0bXptVEFsb3hlNlh5Q25zcmtSaWZncW1xNEliT0prMXBZTE1y?=
 =?utf-8?B?eUNqTzlXbXFFeWxWVEFvWE1tbmlrM1Nkakd6TzR2bVN2TXl2eDJleWhtaVRS?=
 =?utf-8?B?OURjN2dLQi9uUkl0cExVeUhiZXk4azZ3blBySkZTNkJLbTY4NEpabkpkWTc5?=
 =?utf-8?B?K3JjSzBKS0hiM1VFZ053eFVhaFZUUXBkcnZ1aGo5ZlZUOTJxS3Z5NGxGS0Zh?=
 =?utf-8?B?Zld6blV2VEZoL1ZPOTlTcm1XMnp2MkZ2bjdCalFLUGFaK3hoMlF1dmJ1ZXVF?=
 =?utf-8?Q?gwtmz3/bzl2DM+kzaOJtcg6Au?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5072caac-9ea3-4967-6cfe-08ddc9b19731
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:24:36.3620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHnKwJO5EXKj4I4afrBeYPOia2wqghTUJq8PN8UkbGqQv0iEK+fZ7MseskHDB8RmuAnsUHWJFJzq27/2/QEaTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8353
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

Hi Kamil,

On 7/22/2025 6:09 PM, Kamil Konieczny wrote:
> These are non-Intel tests so block them from running.
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/i915.blocklist.txt | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index bb4b8dfec..ac9bb2f0b 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -126,6 +126,10 @@ igt@msm.*
>   ###############################################
>   igt@.*virtgpu.*
>   ###############################################
> +# VKMS
> +###############################################
> +igt@vkms.*
> +###############################################
>   # Hibernate: not configured correctly on CI
>   ###############################################
>   igt@.*@.*-hibernate
