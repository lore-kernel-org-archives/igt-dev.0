Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FACC7115B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 12:44:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343B110EA1C;
	Thu, 19 Jun 2025 12:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgjqVghY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C0010EA1C
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 12:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750337050; x=1781873050;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=UZHn84wdSC+Z7p47yguIX5nDbDfWWKYxZ6On45/jyt4=;
 b=WgjqVghYNtGFrmem0dWDMc+dcCbEq+o3N/XQgPXiqJOQyXEgKqI22eIc
 7xj40YB/h30fqJaRqm+ukXpef7c7UG4TL8qemlyHb9gJENFb9bFLqanMz
 ewzJK19s0Nr6hvpYht+EzpI5g3kUSmthM19a4daX5K76o4l5I02nGgol1
 ATe0l9hTDoynRKwZ0BmoYEwdJDnvDBIwz2A9PCHL/jDGzhZWlUkuHfqLV
 XwktLUq7nd+ldZrhuBPQVksVAG0JqxoEdRxUgFwn9uWHOIwCKat1a9t6A
 Xm6LAOvVtY9Erpe336QTjHa+v8xsO/SGchvbrm9fnMQX2xKnE6d8pPigB Q==;
X-CSE-ConnectionGUID: cxGIb6tESCqZ8RmQmuGZPA==
X-CSE-MsgGUID: UaL1jYCGR5KWBT2bTur7cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="51820848"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="51820848"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 05:44:09 -0700
X-CSE-ConnectionGUID: jf/iTuTNQ4GNW02gHeyxTw==
X-CSE-MsgGUID: 5i07Ib1LSD+ZncX4nKY7OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="150770585"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 05:44:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 05:44:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 05:44:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 05:44:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hShPcNeAjN51juJQX8rv68YhwpXI1bwKCPPSkBVBg4LtU1nJqk9dSPWJV7IC8uAIjwT/85aZMObM9XOYdAPw9qYDhH0FRTRoZbBa1GfthIM/GDQxy3dUVG/kjeCssUAkP83gKZyoTkDt1Nr0OT+/00cCNIQtPY5iYjWvwl1mNFSxvTGDMGWcXnlr1gFp/7lkvvBs4IownvO89MgEy7SJaTHvmP1lYg0y754WQGtFyIkAieBCfzALpjw4YKwknom/2fhvv5gKPScJvwdimWO3jMv5i2dBT+1131FndnWlKdNOntW0Ws3b/8VlTjChJXHxoqVYeqD2FmhBJSmsFw+uMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTb8xbsiuag3oQmosQ2g3C3CBlI1tl4Ofx8KIOZx9zo=;
 b=xWoVuJxHTwWIE/Ia+STx4ZunuG2+UVM4MgKRIfK1wxe+1GjBhA8E2qxGqQdK4jLEnPPVfG2R1dw00me6GEyG7l9q/1cTQJl9AwAdi2qicYVpM4FNqZmZv38akOZbY8yWPRq3YFJkfo0b4dTTg8XjxXxfMN701eYUpNPC/exK9/hruuBeIHENfJ2BKNgJnKUZIl+Fw9NCAeUdtF2/wLrKPZlpJjdbs0zVJVwm7XbkN0zNioPpraszMK7xfDjnZNdzKpTWqCS0bMfALgv3kQEoihrc1aOVH/er8BqxbWe0WfdMZgcT0NauqBHEZ/CxbBBbjAoyrdcbX6BM9bpsHiMWHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Thu, 19 Jun
 2025 12:43:53 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 12:43:53 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250618230257.1721932-1-alex.hung@amd.com>
References: <20250618230257.1721932-1-alex.hung@amd.com>
Subject: Re: [PATCH] README.md: Update oneliner build command
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Alex Hung <alex.hung@amd.com>
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
Date: Thu, 19 Jun 2025 09:43:46 -0300
Message-ID: <175033702686.1504.17422631719024862630@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:303:8e::25) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 30bd88ab-ffdc-4488-efda-08ddaf2ef292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUEwc0pMTU5SZGFqbk9mUlFiUnhnQm9ieENTcXNrVDEzTzlPRmZ1c3JTUFpa?=
 =?utf-8?B?a0F0U0hJSGtPMlRmY2Y4RnZOMHZVVnNWYTl1ckYrcko0SnE0THNRSXhnVDJn?=
 =?utf-8?B?TWhzNFhtOHBveGk5TEVIVGNDKzNyUjJBcDVseWd2Q1E4Ymh1N0NLKzRIMWZH?=
 =?utf-8?B?b2diYWRVblkrVW9lZmxZVENCeFhMVXpqZXlSUHFDR2srcXNVNk10U013UDZU?=
 =?utf-8?B?SnlhaTBGSTdwK3NmWnhIazVaaUlWWmxjclE4bURsdVlhbkIreU55dVd2Tnhh?=
 =?utf-8?B?L1pEK29mVllUc1ZDME5sNXBDZTM5QzVaQ2h5WnFzOXFXMEJjWkpQc3Nuc1JS?=
 =?utf-8?B?dFNJUEd1a3JkNmRVZE1pTjMrRWxYb0dBTm1tZGlpTXhxNWNVbEgvb1pCbTZw?=
 =?utf-8?B?YkNiYmpWUVl0b3JJY09mcm40dW9XYk5aS1BBcEhwTnBrYUdMWmJzRnVXelV4?=
 =?utf-8?B?cFVIZGozSXNxcFlCUWZEMENXVFRNblB6RkZtQVYvRk1FWHd4bXRubDNsUjg5?=
 =?utf-8?B?WWNmUEhVcGhMSEJoYmtPMjA0UjFpczkxRW1kcUl2dGxYMFNZamVCQnJwOHB1?=
 =?utf-8?B?Vk5NUGVndnQ1SVhTdkcybkpJUmdUb1pjVEZTVjJ4azhHSGFrMmJWdzJ1dzJZ?=
 =?utf-8?B?UzNMWkhidXQ1LzUwby9hOFVqb1VLTlBrdEQ4dGZmeHVOZm05MW8wVTFYMUFZ?=
 =?utf-8?B?aFAwNTBkZkVISis3MzJxSFRzbjE1S0VFR1JxRjRWMi84UG9wNnhvSkdLQjha?=
 =?utf-8?B?Y0Rwemk3SElaUk82UHE5cklrRDRpaTVIL3JxQ3FQUUh1ajlmL3MwcW1CSmxq?=
 =?utf-8?B?WndsQndEc09jeEw5bzg5WGx4eTA4ajNiTWM3Snd0ZDRkbjFUdkRRa3VvMUxn?=
 =?utf-8?B?QzVqMDJ6eEZ1UWR6V0d6Y1M4ZVJsT3VnV3BxVzZWZ2I2anBicmEzNGZpeXBU?=
 =?utf-8?B?aDhDQWRnVThidDIxalRqTUpNM2E3eXF5S3BTbm5kOWNqRlIvZHJLMnNiRHMv?=
 =?utf-8?B?WUlUbDA4aENpUmUxS3BQTVg3eTl0QThBdk9Dam81U3IzbjlNL0lvc1lNV09K?=
 =?utf-8?B?SFV4QmZ0eU80Yng2SGpoRWtKeXBPSWtTU0FRZXAxQkZJYjJDdUVLRkVVOGhG?=
 =?utf-8?B?a2tWTVFUQ1pYeUhGU3VsVEVpNVNVTzFRVUVkc1JERlpWR2RDbWZIamlwd3Yz?=
 =?utf-8?B?d0FhMStPY0VES1ZGL3d3MzFMbHk3R2NiRTY5NnRGYmJrVXpZMUpwaUdncFBI?=
 =?utf-8?B?ZHZxODQyTGorRnhKeklTVVNOUDNUQzhvVTIvNzQ5bGlKNDhRaHRqQmVBbXZr?=
 =?utf-8?B?ZVFmc3JoWkJ5ajdLM1gvaTZsMDMvRXQ2WDB5eFpCNXgzMHNQZ3FFa0o4WUFW?=
 =?utf-8?B?SlJZcDZlMWlzWkk2cWMzMzVmUDZ6dHVsTHpMUDJjaVJPb3dxZ2ZNSTNaREJq?=
 =?utf-8?B?bTFTQndLOGY5OFJVVVI5Sy91R1M4dXUreW41YS9wTTJQVGhQWmt5dnhLMzVi?=
 =?utf-8?B?Y0NCTm83UzFwenhCQzc4Yk5ZOXZJVHFXZTdtTVpwUU56Nk9uamFMMjlIektS?=
 =?utf-8?B?TGV2WFZaUjNKMVZxWHpPK2dndmh6ZmYrWDJQNTZTSTFMdzllQ0J4M1NidFVh?=
 =?utf-8?B?Q3NYQ3F6UERwb2h1OGtkMDFYTzlEaGpZbDNDWE5rRjFVMWZIOGhLb1ZxeFhU?=
 =?utf-8?B?aGZZYW1mYThKb284VWt3STFOU2paMGNWZytZTzh6ZGRySkc5SzV0T3lMU1NQ?=
 =?utf-8?B?cGRUR2VwV3h2TXhKN095OVUzSkdvTnVTaUVhRnFPYkxuK0VQekV4K3cwcGI3?=
 =?utf-8?B?aFF0U3NLQ0JhQ2xSTGpleTlSV3N1TjNTd2xkSHVqdjlSMlo2ck80ZDFVL2hH?=
 =?utf-8?B?TTI1V29SVlBjRG9NbUdwbkt1MXdVWTVsL09iK0MrUnNNODZuMVpuSjRPOHlw?=
 =?utf-8?Q?De8bSOJEqjI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUg5WTJkRHg2UDgvOHRVRk5ick13eW9SVWJNclVXdHF3UW9DVC9VNXY0OFU0?=
 =?utf-8?B?bmxKYjZXQk1KTktBRTJKNGZHU2lsNFZpNE9zaXBWSXR4Tzl3dXRwQ0JZK3dr?=
 =?utf-8?B?NmwrSkh4R2RuM0YzVzloSzdVaEx0Q1EvdG01NG5qbmdpVnBkTFJDL1FMSWNv?=
 =?utf-8?B?bE9hWVgxcHlMamtGOGp3OEM3eTBzaTBLYjNOSzVnSitpK0dCem12Z0IxM2ZX?=
 =?utf-8?B?VEFlYUoyc3ROTDdJSHZlZy82Sms4eUJya2VTZHBXMXBlZnJIc2VkUWwySTRM?=
 =?utf-8?B?VVRCOTRQdjVMckE4Y0pMRVJBTWZ3WVA4blZOYkFEU1VhNmJqdlFoVnd5cUZr?=
 =?utf-8?B?bDZUeE1BYUNhdzd4NTdBKy80Z2lHUFdSeHpHN1NFaFNVL29rNUFiVVVXZXAy?=
 =?utf-8?B?NTl0QUltQzZxaDEwZ3pGckVXYmJSV2tUOUhXQ1ByTTEzZSsyY3VDQmFqNFBN?=
 =?utf-8?B?MmQ1NTdiZDJXc0x0WGZpNUp4dmJVcC9PakhNU05hb2RSWVp1L3JQMTc1N2h1?=
 =?utf-8?B?d0xXNzlJZFFFampwYmN2TzBmNit0RkpDUkJ5QndXVFljSFlSSkVwdlQ0YlMz?=
 =?utf-8?B?cSs4Nzg2ODliR2FyYUdobDJQSXZmSHpCM3k3M2wxdFRsRzlxSDF3cDBqZ2JR?=
 =?utf-8?B?cWtBUGt4S1dsSmN6b2RZR2dKSXFYejJ1cWxZcnlNaW1KNDN0cXR4aWJlRkhI?=
 =?utf-8?B?OTcvVWZ4bVFFYnhEN1hlVE9YZjhVOXU5MExxVTRJcUxDTkdkck93R0JDMjZ2?=
 =?utf-8?B?OVNFcXlFVzkwejM4eWVrQVF4TTQ0VWJCemNESjlLWUJCNkxsL0FFTTFNRzBH?=
 =?utf-8?B?Y3N0amxqVWYzbFNOa2w1LzQzTk55eDhjdXdEYzdqWEhuRXZpcXYxK2dzMW5x?=
 =?utf-8?B?QjgyaDR2U0J0MDd3cTJhZVhDVjF1VkZ5ekhuNFpSMXN0UVU4RmNSblVsczRC?=
 =?utf-8?B?a2FET0l2RHVtVUl1NFd5ZFpOTWdkTjlsMUowQWpPY0tVT2tXTVppOU55Rit3?=
 =?utf-8?B?ZkRKNy9qZUZoRWc0KzJ5Q0ErQitCaE1GbWpISnp0cms0NmZZTmdqNEI5TUtW?=
 =?utf-8?B?L00yZFpCcGFKdnN1TUd2WkJTbkg5eE43YWtDYUtDZlo1Q2pZRnJWcTVvVUFy?=
 =?utf-8?B?RnNNbDd2U1FPTWpIQkpiQ0NNTUt4cW5sSVVtNzZCTG1QQ3IzNTFodW5oTnFx?=
 =?utf-8?B?b1dKR0pUeXZPYkFQbGRwTjcyN2pWWGtReHJwNlR1K2NnVGdPS0FhQTJNeHdB?=
 =?utf-8?B?RWdEdGQ3Q1VObGYraWVESzZNWWlRdzNuT2NiVFJkZWg2d2RMcnI2ZmJLYWpv?=
 =?utf-8?B?R1FYRzhuTkh3TUwzMkx4dGtKQS9NTUhPbklrcmxmL0pQOHdKTExrTWdiTzYv?=
 =?utf-8?B?QkNXRkpCdTRuaWFQOERtK2VLd1ZtTDVLeUVMemJIM2h1OEpHM1Z2NjNsTksz?=
 =?utf-8?B?bzZpUVNHWWFnM09nZjdUdWJQcWNHd2ZBVElabnpDT0c5NndjVVZoZHdmNFZX?=
 =?utf-8?B?ZjdTTHV2dVY5NFltb0xmWDF1c1dWYzlSSXB3cEwxcFpkU1R1V0ZZb2djbXlM?=
 =?utf-8?B?SzZscWhtZmdUUCtGR2UvUE1WT3RkS1dTWEk2aHhFRkZXbm0xZTRTTlVOdC8z?=
 =?utf-8?B?ekE1VEdSajVPUjNld2IrSUZZMXljam9NMEFjM0pPR1J2LzZpQmsyWWF6ekMv?=
 =?utf-8?B?cytFQ2htQU5TbGlCR2xlVElHRDZlTUs2WDl0cEpCQ3QvNkNmY09LUUpwOHQz?=
 =?utf-8?B?ZWI2cE50dFhGSnVHWkVDam9WRy9YenhnSVN5ZzV2T1FDMk5uYjVyYnNtOGNE?=
 =?utf-8?B?TDFYZWI0K0Q3Sll4QUwvczFSVEpJMll3QVJ6QkEvZ055cXZmM0U3cXdxanZn?=
 =?utf-8?B?Z3dmUlJXNDZDN0hkQ2VIajVmQkxMVGxLMEdRRS96dlR2ZDRSUzZDSjd3L3du?=
 =?utf-8?B?aXA2aDZGNTRoRnN5blgzMVRkcTV3Q1FKR0xTcGpMRVk3Tit5RFJDSEJjakkv?=
 =?utf-8?B?Mitwdk1qYVVpbEY3WG10dWw4WGY3bFcwOWMzdVZLWG1GMnI0aGdRUjVNSDFr?=
 =?utf-8?B?cGUrdE0xZnhRV2ZsTWJ6a21YdHV0dUU1M2VmOXYyWjRPYzZzYjVEbmNhSHBs?=
 =?utf-8?B?SHhqRzhwL2JxVlREQXpPUllUSGVtL3lkKzF6WGFrWVB0OHhoc2VCbmM1b1c3?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30bd88ab-ffdc-4488-efda-08ddaf2ef292
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 12:43:53.2079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnIAJzgDHxdhdnxCZYuPtMj55kc39cR914WrZsMGc9ylQrR4NeGL5QkgharSEfRCNJHFWiSNlhNFthFsTkehXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8718
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

Quoting Alex Hung (2025-06-18 20:02:57-03:00)
>This fixes the following warning:
>
>WARNING: Running the setup command as `meson [options]` instead of
>`meson setup [options]` is ambiguous and deprecated.
>
>Signed-off-by: Alex Hung <alex.hung@amd.com>

Looks good, so

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

That said, perhaps we could take this opportunity to fix other
occurrences as well? There is another one in README.md and others in
.gitlab-ci.yml and meson.sh.

Quickly doing a git log on meson's manpage file, the setup command is
available since at least 2017[1]. So perhaps updating .gitlab-ci.yml to
use the "setup" should be fine?

[1] https://github.com/mesonbuild/meson/commit/d82c7e3c23ce6f3b0b68aea034c3=
f9d4d7b68935

--
Gustavo Sousa

>---
> README.md | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/README.md b/README.md
>index 9cef60d88..ed6647726 100644
>--- a/README.md
>+++ b/README.md
>@@ -37,7 +37,7 @@ Building
>=20
> Oneliner to get started:
>=20
>-    $ meson build && ninja -C build
>+    $ meson setup build && ninja -C build
>=20
> Note that meson insist on separate build directories from the source tree=
.
>=20
>--=20
>2.43.0
>
