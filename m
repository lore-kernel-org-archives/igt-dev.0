Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CE3C36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 09:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8245510EB90;
	Fri,  4 Apr 2025 09:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJo+Cx58";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2630C10EB90
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 09:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743757960; x=1775293960;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hYpKT/dclY47xmyYUb0hYgwRjg43MXcy8M3MD9Asa3I=;
 b=LJo+Cx583j40/hDNcO8Sqq1y079zx32xMBlRQNBP2EaIhysGBFl2r8DY
 A0xpdnroEQqEZ6KsXV6rHu4VQ0DAI7rDEa0T/CnPD3oBAXGYc+h0c5Xap
 gqDB3XxVGxTIBdUcKRdLx/Tk9c/rZ7yX8jmfVWcD0hDFQ/fXa6AN9TFFP
 BIKxuCOssiKOZsHFGUVDrwXFRjpOeNwaEGi8ILJBxJOFwasPAtNyrQGb1
 iJPcxBC92/goF9u7JbDtKcxNWTBfnHzwdmsPkc5xP72c/Ypz94hyxwJhk
 lUn5oV0aPEHGAX6qIW0iWCW+DNloUuYXuSmdG47we+2Hor7EE040hxITV g==;
X-CSE-ConnectionGUID: esZV6wRLStKq3DhGzQgC2g==
X-CSE-MsgGUID: c8fFmgd2Qn6LIm/zQKZc8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44910639"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="44910639"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 02:12:40 -0700
X-CSE-ConnectionGUID: P0mXwpe9R3qk4tCe355UYg==
X-CSE-MsgGUID: 70oHUpEASamV77mAhxfl7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="131964653"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2025 02:12:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Apr 2025 02:12:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 4 Apr 2025 02:12:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 02:12:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNx0cUmd3ncMNaLd7+wj+7YRNRZyBPJ0dr8N1G0mrcyOHZuu1xk/k3igawGNpaeGNxln5Uz074wbW/eU7Xtp62Gbw/6cHp3FTaP/vKMO4AbaNYdOlGB6C1JBdTkCjnE9rJWaLRONCcE7S/U8Eykdv8M+bNyBFG/ckPs047oLYZzXaFBVe1gjH1nQTrCAMN6jBvltVCGMQz1HKEmYnuzVbX3xs/t9uKP5zswbaGMGnmbZfK0FSuukCwWZqD7AcDKxzPkUBuZZLfDyBfnasu1zRi4GWWCXQ4Ol2Yah41lKOM2dr5hCROSs6awVttbbYNIHfeud9g30Zqq62TPXGczcXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyQTJCT3PcWXzeBF42uEAmgaYFUg9OXUz+7+YqcteFA=;
 b=BYgmvyWQIE5IJwQHnzJlUSyJtdYU5HxsUALOKgP8+hM6lS/0Dw2PTV/d3eLkrUz7bKzakZ6sZZJNgAhHY7HgrNC6pjwFzx6b2kupmCRkBhPuRTya6WGLpD17lJZGV5jck06glqw3LsE8kBV5p9X+TZQnOTBVHZASVGDfxozGiH8UDYmyZ41vCTrV8zzpPi/uFuXL5zI6Lu63AjMKt0qiOlJELMLCJei/gJAif+hkvwSBhq2PZJapkAOSWIGj8FvvJiwYT3FUA7GfCGOnOl3klgenJ1S+8ubrRi9YBLGA3lD5Y2UEiT8bH8aIibgDyFqjrS6SyTHIuVYMoJbXXxRbCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by SN7PR11MB6799.namprd11.prod.outlook.com (2603:10b6:806:261::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 09:12:37 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%4]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 09:12:36 +0000
Message-ID: <070d3642-31e8-4f72-86e7-8c33fdb13a4f@intel.com>
Date: Fri, 4 Apr 2025 14:42:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST
 bandwidth constraints
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20250403105335.2034060-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250403105335.2034060-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|SN7PR11MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: d5826bbe-5ae5-485e-f5c3-08dd7358d76f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yzk4bDRpQlBJcDJGdUdkcU14dGc5NERVVDFiejFncHJ5ZnBsS3hoTmFVT1lu?=
 =?utf-8?B?STlTNlA0TzNwUjZmUzJwcVdrV2FOMXJaN1VBSDVRVjF3Z0FaQWkyUmRkZ2tS?=
 =?utf-8?B?Tkxoc29lQUQzdWlvS2hnUzhqTlNVdUYwLy9zNEZBMFhMa0hyZFMxNStLcWpY?=
 =?utf-8?B?cWxBdWxkNHB0ZnNKZ1FNd0EvRW1XNGkxRUVXUGNMcVoyWkJSRGtNMEN0Y1Nt?=
 =?utf-8?B?b1R3bGdJdDVMYTZiZjE4Z2ptNFRLNG80eEJnOWl4UEMybkR5bXZ2TmFFcG1p?=
 =?utf-8?B?UWZtb3V2dmwrUnJydyttNnF4YmNvMloyL3Q4T2s5b0hFdEprQysrZytkWnVP?=
 =?utf-8?B?V3EvMXBWWW03dVVFU1YxTUFNYjMvWEFYTFNTdEJlc2lBTW1pNGNoYXRoSUJl?=
 =?utf-8?B?T2xtdHRDVUQwTFl1QTZQT1Znbm9RZ3dOL1ljdTVMNzlJNm5KbTRNWTFGUC82?=
 =?utf-8?B?b0p3S1Y4Z04wdkRqVGtUb3ROTU5ZMnFlK0IreWxjV2JkRHJURVN6UE54b1FR?=
 =?utf-8?B?T09XRHhuMHhISmNyWkhyTW8zbjJYRXUvTHZEK1pHOU1tMkpvTExaL3J4Qk5i?=
 =?utf-8?B?Y3F6SVczbWlTbFVNRUhTS0tEb1NzNnMrS1l2RS9CVEFpWEU0d0k5STk1aDRG?=
 =?utf-8?B?WkVCcVRtWk54TDZmTVdUWTdhaitLSGJhb3Y2ODBBMktqWEVrVTlQbitWNUpX?=
 =?utf-8?B?ekNzTTladzJiOFlvL0Y5NVMzbFFKVmtYUURDdDZxeHRkbjh0ejZxbzJEM0FX?=
 =?utf-8?B?a1czQi9DSzlzQnRVaUxVTUpqdEpHdXB6SnM3L3A5OEVHQXg4eGVKcjdzYnFj?=
 =?utf-8?B?QTJKQUQ1VFVoRVVUNlgwekJobnB1Uk1tbG5aRG9qWlNKYzM2WWxPbmpES3lI?=
 =?utf-8?B?cWVnU0JlS2FLeThDUm4zeEdnY2sraytXSWJlZ1J3Q01wTGdTTDl1cm4rL1N0?=
 =?utf-8?B?WkttaFQzWENLai85THF1YzMvSUwwL2xxNi9MR1Y5YVZaeHVraFNOSG8wQWla?=
 =?utf-8?B?RFZUdXZ3eGxuL1FSVUs5UWlQaCt1RlgxbFdUcEFwUGwxalJTQ2hOU2k1dFN0?=
 =?utf-8?B?enlxMFBBczlPRFFORHJiZWJaYzRsZVpCZEhUZFQ3K0VHblNDcG1Id1Z5c3d4?=
 =?utf-8?B?ZzdhdWlIQ1BJVkVRdmNWY200RURneXR4YmtmWW1XMmZQeG9jTGp5VzhqZkRS?=
 =?utf-8?B?R3BBSVNNZ2FSS0NSVWEyYjdYQjBkbWNyNUxTZlFOOVFKdmxpLzBQd2Z5QjBt?=
 =?utf-8?B?TEZTc2F0dFR6UDBmR292dTFKLytUQmZZbE44Q2NJWnY4UU9UKy8vZjhkVmps?=
 =?utf-8?B?aEtmZlc0ZXRETHNkUk5laFFIbDA4L2hGTlU4UmFTL2xwUTF0VVJDakRabDZG?=
 =?utf-8?B?T1lNVFFKdGtwUTNCWnhISkwyT2paRkx4aW1WQVJLcU9YTmx1ekFRSDdxUEJG?=
 =?utf-8?B?aVdWSm9Ubk5rSlI5ZVgwSktHcXVyM21CZ3Z6K2RwV2R6aU5zSWdoTEVTRFcz?=
 =?utf-8?B?VzB4VU1iclJ5RVVIckg1NHM1OTROdnA1cGlaMG1nemVObk1RUXgvSHE5aVNF?=
 =?utf-8?B?TjBWeEhXVEMrc3RMM2lFdm1jS3NBRjlhK05CQ1NwV283bG5NWnRsWDZYekNp?=
 =?utf-8?B?UEcxNk4xSG1hZTBZeDNmQXNjYUJtbzhybWp5Q1U1TlRvUHRMcDhVSW9mMkZM?=
 =?utf-8?B?L0N1UzNQUlRMUjh6MWxLckpWRGFpM05YTUl6bkZVMUJzRWpNVTE4anZxSFh1?=
 =?utf-8?B?YVowSWlqckFFSzlvOWFvaTRmalUvOVRzRFUyN1NFRVNOdGpSZ3BqVTZic2dY?=
 =?utf-8?B?ZGF2MmpNMlNqbHZFdSs3UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkhwaFU4WHFWWFp6R0w2cUFTQjlMREJ2OGhjSlQ3SVg3bFI0QzFKVGdGd0NS?=
 =?utf-8?B?RlBvd09BVnBEYmJxRnR5ZG1ZSEdaYWppWjBtN09zNFBSbkdhVVk3c05VOTRk?=
 =?utf-8?B?QVRzRkpvZDVZRWdXdS9DTVpkL2JqdmhIVFIyTzVrYzNoMDE0MTMxNHhjS0Z6?=
 =?utf-8?B?MEorUS9vZk5KS0M2Nm4wN3lVUzMwWFNlR056eEZlT0plSGV0bDhuZEd1SnJH?=
 =?utf-8?B?dHB0MWJPM1dBSmM3akVHb1NrUGRVUmdQVDd2aFcrbXp1ZTh4YzFVbXFCVW1W?=
 =?utf-8?B?QTlWMjFTY1hGczNzRnNwVnhKZDJuTFF6T2Z2WWFPL3Q0NHhZYVFBMmJzZDBh?=
 =?utf-8?B?Y1dNUVEwV3dXQVlKZFo1YzkvWERVZERaQThBRkdpenpjbkZYSkZaQ2xMUnJJ?=
 =?utf-8?B?QkhYdDFwVEx4TWwxZ0JNUmtYSnYxL05vM0ZCci9TckhVeHp5YU1McG9iYUtN?=
 =?utf-8?B?QWtKWHhwTk02eGNNL2Z6VC9HM1RuMzZZaXlCa3FOV08wcGFTY1dKell1SGFE?=
 =?utf-8?B?YmFVdmx2UEU1Z3hVa1g4OW5DeThqY3hCaERjZFJRM2ozd3hEWXJYdnZsMGo3?=
 =?utf-8?B?UXA0OUhMMFVOS2tYUnQvS2IzcVZGY3lud1ExaXJBTFR4a3A0ZDlVK1hjTGx2?=
 =?utf-8?B?NktxSkJ6L0sxTHZxR21HajY1MGNzSGlmeTNZYzhnVE5TalBTaFNzMkpueDdW?=
 =?utf-8?B?M2J3ZmpxZmJNRmJiMjN1elNicWlCSk5qVnJ1NW5acmJXUVYrV2cxK2JVZzJD?=
 =?utf-8?B?eHBEN21VSDdzNzdTR0h3RXgvemtsQk0zWXVKOVQxdWZ1ai8zRGRsVG1LaDZC?=
 =?utf-8?B?MXJ6dGM4OGZUckFiTGQ0RXlRSHFlbkZGbFpoU011ZjZsQmplV0ZzaUNuaXBO?=
 =?utf-8?B?TkpIY3BuWkl0TGoreHdZWCtNNTJTVXpveWY3cXNLdGZZNDF5NFh1WVNCa0o0?=
 =?utf-8?B?aUZoeVZWTFJTbjJ2YnNESStyZUFSb2JHZkNqUmlBMUZFSVFPaE9Wek4yUHdq?=
 =?utf-8?B?eFBNd1IycmxaeVJPZVZQT3FtZmI3OFVPYUlDbkJpbVlsMFJNdWIvTXpmTEFW?=
 =?utf-8?B?RGUvQ2tsd25RSWh1V01zRUdnK05CY1FEMFNqMjhscXN2ZExnVlplaDBvMW1k?=
 =?utf-8?B?R1NtU3lkbU1VZW5GU1VNbFcrMStqUUxpeUVZTElLUEZSZXg4TmNKWm9nQVNx?=
 =?utf-8?B?ME1iVk52eDEzV3VsRkIxVVlJUHloODBkcHgyOGVjSG10ZlJvSmMxbndJZTAr?=
 =?utf-8?B?eWd6L3NOVHBxVldXajRrMnY0eHUydys4bklkb203M2ZHMkdsMEg1djVYRnAw?=
 =?utf-8?B?SWJEU3pLZ28yUy95WjNQNkVMWlBSTk1WZTQrOUZRNitWQW42WUxwdFgyclRL?=
 =?utf-8?B?Z244ZTA0RUNNTTk0VEpSWnp5SEpPYlhxVFJSemNST2Z2V3VKV1VRUHBjbXR1?=
 =?utf-8?B?U1dEcFA5YXM5MERRcWxTWU1mMis0dXFQS2kvcFFvTTZ3QkhIZllTT3lMYlVh?=
 =?utf-8?B?R2xKU2s4dHhZS2UzTzdnaWxucDNWa2hnNmdXRlJrNWQyTU56TVVRYStPVFpj?=
 =?utf-8?B?RXJxWEVaM0l5Z0VlRm1OUy9DbEFMdmdwWUZDd1k2V3VmbzUzczRQOGNyWTBN?=
 =?utf-8?B?aWZuRjY3VHBBNWJTSEVURVBZemdJRjduMjloOWVPcUN5a3VRVzdpU1B6N2M4?=
 =?utf-8?B?aGFYSUpHc2ROZCtUSFQ4NkJ5YXovbWRWTmJKbWFpKzk2MDIzVXJnZ2JERXRy?=
 =?utf-8?B?QTUwLy92VmpuSlV4STIwQlFDWUNkbERCbVZabG1zVXJUQjRvNGM0WnpqWDFt?=
 =?utf-8?B?Y3lPcjhGT1hiaGgxQ0UxcFNxZTV4Y1B3UENESVNDQlJwRHRIQktXQm1wY2xT?=
 =?utf-8?B?d1ArQU1kQXI3Qm1ERmN4S3duR1N1VzBLd0JMUUVQMDN5ckJtZDZrWkxvdVU5?=
 =?utf-8?B?ZnU2U0FPcEdFOStvRmxhV3BKUHc3b0tnOG5xUGxjYTNCY09WcnFqcXN5NEph?=
 =?utf-8?B?eWJKNi9UZFo4dFMzUlBFd1Jadno3MHQ5aFEvVzA4RU1nQWpOMkxidU80eC9x?=
 =?utf-8?B?QURkSTlBSCtyMklRcGE0aWoxTXRlSzF2aWZFbkc1YVM1VzIvOGJ3N2o2eWV1?=
 =?utf-8?B?SVhYUjRjU3VBM2RydExDZE1CaUpSMmZPWHFBTk55VU9oSmJYREdiUGE5NERW?=
 =?utf-8?Q?JT8AdAdAna8P9KgFd/h5ji4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5826bbe-5ae5-485e-f5c3-08dd7358d76f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 09:12:36.8807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCoDjcvc9/vp/gIfXidOtNgC7HHy9qCtuQC3hWcicw4xw9lOJ6nu8nbi0jdytqfI/nvFLvqaMYTlyuBgHgrctrX6iU9B/UifBr/E4VvYHi5pFngLCktpx7Gq9Y0JT29O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6799
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

Hi Jeevan,


On 03-04-2025 16:23, Jeevan B wrote:
> Instead of checking only the current modes, find a combination of
> modes in the MST topology that can be accommodated within the
> available link bandwidth.
> 
> v2: move fit_modes_in_bw to lib/igt_kms
> v3: update tag from fixes to closes
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1542
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_kms.c                           | 24 ++++++++++++++++++++++++
>   lib/igt_kms.h                           |  1 +
>   tests/intel/kms_dp_link_training.c      | 24 +-----------------------
>   tests/intel/kms_dp_linktrain_fallback.c | 18 +-----------------
>   tests/kms_display_modes.c               |  4 ++++
>   5 files changed, 31 insertions(+), 40 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 99c8707c7..f8274f49a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5046,6 +5046,30 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display)
>   	return __override_all_active_output_modes_to_fit_bw(display, outputs, n_outputs, 0);
>   }
>   
> +/*
> + * fit_modes_in_bw :
> + * @display: a pointer to an #igt_display_t structure
> + *
> + * Tries atomic TEST_ONLY commit; if it fails, overrides
> + * output modes to fit bandwidth.
> + */
> +bool fit_modes_in_bw(igt_display_t *display)
> +{
> +	bool found;
> +	int ret;
> +
> +	ret = igt_display_try_commit_atomic(display,
> +					    DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (ret != 0) {
> +		found = igt_override_all_active_output_modes_to_fit_bw(display);
> +		igt_require_f(found,
> +			      "No valid mode combo found for modeset\n");
> +	}
> +
> +	return true;
> +}
> +
>   /**
>    * igt_pipe_refresh:
>    * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 0381c82ad..fe01eaf3f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1226,6 +1226,7 @@ void igt_require_pipe(igt_display_t *display,
>   void igt_dump_connectors_fd(int drmfd);
>   void igt_dump_crtcs_fd(int drmfd);
>   bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
> +bool fit_modes_in_bw(igt_display_t *display);
>   bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
>   unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
>   unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
> diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
> index 9e9b1e6db..9b6248c6f 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -140,28 +140,6 @@ static void setup_planes_fbs(data_t *data, igt_output_t *outs[],
>   	}
>   }
>   
> -/*
> - * fit_modes_in_bw - Tries atomic TEST_ONLY commit; if it fails, overrides
> - * output modes to fit bandwidth.
> - */
> -static bool fit_modes_in_bw(data_t *data)
> -{
> -	int ret;
> -
> -	ret = igt_display_try_commit_atomic(&data->display,
> -					    DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET,
> -					    NULL);
> -	if (ret != 0) {
> -		bool found;
> -
> -		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> -		igt_require_f(found, "No valid mode combo found for modeset\n");
> -	}
> -
> -	return true;
> -}
> -
>   static void do_modeset(data_t *data, bool mst)
>   {
>   	uint32_t master_pipes_mask = 0;
> @@ -204,7 +182,7 @@ static void do_modeset(data_t *data, bool mst)
>   						  "Unable to assign pipes for outputs\n");
>   
>   	setup_planes_fbs(data, outs, out_count, modes, fbs, planes);
> -	fit_modes_in_bw(data);
> +	fit_modes_in_bw(&data->display);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   }
>   
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 6a872efd2..64f21ec6f 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -151,22 +151,6 @@ static void set_connector_link_status_good(data_t *data, igt_output_t *outputs[]
>   							  DRM_MODE_LINK_STATUS_GOOD);
>   }
>   
> -static bool fit_modes_in_bw(data_t *data)
> -{
> -	bool found;
> -	int ret;
> -
> -	ret = igt_display_try_commit_atomic(&data->display,
> -					    DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -	if (ret != 0) {
> -		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> -		igt_require_f(found,
> -			      "No valid mode combo found for modeset\n");
> -	}
> -	return true;
> -}
> -
>   static bool validate_modeset_for_outputs(data_t *data,
>   					igt_output_t *outputs[],
>   					int *output_count,
> @@ -176,7 +160,7 @@ static bool validate_modeset_for_outputs(data_t *data,
>   {
>   	igt_require_f(*output_count > 0, "Require at least 1 output\n");
>   	setup_pipe_on_outputs(data, outputs, output_count);
> -	igt_assert_f(fit_modes_in_bw(data), "Unable to fit modes in bw\n");
> +	igt_assert_f(fit_modes_in_bw(&data->display), "Unable to fit modes in bw\n");
The function fit_modes_in_bw causes the test to skip if valid modes is 
not found, but here we are intending to assert the test. Are both 
contradicting?

>   	setup_modeset_on_outputs(data, outputs,
>   				 output_count,
>   				 mode, fb, primary);
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index 588820170..f2bbfafe2 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -93,6 +93,8 @@ static void run_extendedmode_basic(data_t *data,
>   	mode[0] = igt_output_get_mode(output1);
>   	mode[1] = igt_output_get_mode(output2);
>   
> +	igt_assert(fit_modes_in_bw(display));
> +
>   	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
>   	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
>   
> @@ -138,6 +140,7 @@ static void run_extendedmode_basic(data_t *data,
>   	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   
> +	igt_assert(fit_modes_in_bw(display));
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]);
> @@ -158,6 +161,7 @@ static void run_extendedmode_basic(data_t *data,
>   			  DRM_PLANE_TYPE_PRIMARY), NULL);
>   	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe2],
>   			  DRM_PLANE_TYPE_PRIMARY), NULL);
> +	igt_assert(fit_modes_in_bw(display));
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
>   	/*Compare CRC*/

