Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68C5CCD185
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 22:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C80410E108;
	Fri, 10 Oct 2025 22:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bT6XLZQv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A02710E108
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 22:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760135237; x=1791671237;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CeMU29UxAffy+wY/qqfPFFr7XilwgU7NwJbmh4eiF+Y=;
 b=bT6XLZQvJDLrxf0Gn8MSIivnPWZ4xtyY8xphcluBNvhtpUpE0Cm6oQxO
 vfJLHzKaFmKCFbV1FY/sLeuMJ/80lHArqVUzyolmFdrGfh3wcrZUoZ3OO
 zb4HlWGvqpyn9ekU2+a4waRv6g89Hy0oV0qfSRUyLw1GUwZSeSPQMH0V+
 hV+MXDvMMzKImkqB7eYB9SZ5yZ0mCu2uARMBfkuThy66AT5EpY/DQXuNS
 wHxFwSZGha0t3jlEXVKdAeZBcVATK86DQlEt/Bp3yBuT+5Q1pYS24g2cQ
 A6wSFN52UB+PaHgK/GDBPN7+j9TDBZAo5BKD76Nj/MnqVM3hoc7N0Sgnu A==;
X-CSE-ConnectionGUID: qEmijv9LRzGXj9K4Bt2EsQ==
X-CSE-MsgGUID: eF3J7jZ6QRG9zrYG8Zn0LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62399894"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="62399894"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:27:17 -0700
X-CSE-ConnectionGUID: RmhGGzpJTGepjAivWEgURQ==
X-CSE-MsgGUID: 9YJtLeiTQ82hYBTNmLzbkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="180907881"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:27:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:27:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 15:27:16 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:27:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEjp086QcPhAqrK2ZA7pwr/Bx/w2QOg3gGBE7hezzA5/uTj7hlvi9eWg/mfV+d82aA6NxI6PmhDzG2kpPelYIHPUOglQmrtIHXffltUd8gqi9bU/ACGYrHdG0PtvJswjAcVXGPk1we57baE421tmnjILbJcsmb7B7Wm24DJ8pFJsuii80DyaYy4TNU/oA4+7/0v5Rt9nidwL+vX2lE4OQEpE5VzFOQOIV8npX6QUZdRM6GT9Ye+qjvOsPHuUxTXJOhZuLs45ufML4ls8CSC/yFtynZN4tB2l3qsuQ3r1rsSSbKDGqs6F/LBWTwiZ4qo5XKIZCSlFcI4aASAT38GUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4lEroes0XyFWKqlcx2BC0gC79nHe3XoHs/6nBVfI2I=;
 b=LXxRE99D9tDxf1qQG5PlXb/VlwT19WwlRUdBVdLP47Sazh5djTDyJL4DS6EbVNhNCovqADYkxlCs+W+DMajLtPzRo7kU+E6j8dNRO83GDvv1+RnBR8gwqemQZiMtGFyT7s2ipldqqKMJ262i7thFVIqZI/5GJbKgX/gOt2rSxwk1NboyIJwM/iqNXjupcIWO+/y4oqiU8qb+Vq3cqXALUTg2jUcaK6YzpRKBi6eEeKINZ8I+Gw1/3rIAaVsypjkotUFReNt8pvudsBdiV71sRbItjNvlWTCYTK4fi8LTnJFutThEjaOzu96iYEJqD8RhzXyPyJnSI8hJu90L4lyf6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 22:27:13 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 22:27:13 +0000
Date: Fri, 10 Oct 2025 15:27:11 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 12/18] tests/intel/xe_oa: Convert
 test_single_ctx_render_target_writes_a_counter
Message-ID: <aOmIPy9fWQpG+3KF@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-13-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-13-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:303:16d::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7c70a0-41e5-4e06-e16e-08de084c28c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGVjdjNzNG1yQ0s0cmlLVE52YjZaclJIR3dnellpRi9ka1dZVUdWMkVQYVdr?=
 =?utf-8?B?dVNVNTRtMGYwUnpOa3Y4N2pQYitkT2pROWowZkx2NnV0eDdVd3hrVU0xcnpQ?=
 =?utf-8?B?aXl2RFVDRHN2V21xTDloTjU3RldMZnZ2QWVEUEV4eWVMTXB1V1Nrc0hKTXhF?=
 =?utf-8?B?WkpTOUdNR1FCL2EzQ2pHaU9HY2p1WHY5V080YThhdjE4Rk1WbVRoOTFwUGV1?=
 =?utf-8?B?ODNpakRQVVhJcisyc0lXVE94NGtSYkhWS3lzNjd4SGxrSHFGU3JrbDM4cTBZ?=
 =?utf-8?B?MWpjdDJHbzc0ZE5pN05Ja1JpcERRZDhZTGtyazJEVU9GZVlPNlJUNnlrZzk1?=
 =?utf-8?B?dy9MSmNFUXZ2clVMR1hKNUdxRlVpUXVRbExRU1h6VUY4Y0xkZFVBM1NseHov?=
 =?utf-8?B?L3dITXJINjN3eUdXM1FpQUx1WU5TV0NvUVJ5cDRpVGs3RTlZdTlyYXZHRGF1?=
 =?utf-8?B?UU1pT1JBRTA5UlZBdmRjZ3FjU2FsTVoyOGMyN1JHNTVURTJCYXJEMndLQ1pQ?=
 =?utf-8?B?eTlBWTdOUk9pZ0xkWGtQdkR6dHI2Ym5PRjFoRDdSL1VTT09kbml2RGJaelRm?=
 =?utf-8?B?RTdyK09HMjFiUHZsQlZtanBueWJJVERRV0dVdEJabTdFeHMrYVkvdmVkZmRh?=
 =?utf-8?B?VlNDWUJWOTh4Z3JCUXN4V0VLZWJhaGVHcTd5eFFFZ1VwQ1RUejFmQUUwc3pu?=
 =?utf-8?B?WnppN29yTG0xamd5dFUzVTVleGJLRHpmdjg3VzNhQkxSYkQ4cHcxRXhmWG9l?=
 =?utf-8?B?TTVVVnlUc2hHczkrRG1IOTI1K3o5U3BYOXdmMzJ4ZHFmdXBXajZncDRKMm1T?=
 =?utf-8?B?M2FuOXZ1WjI0STlDSGI4V28yTTBiWjJlZEZIUE5yQm1KeFc3d1JlbUgyaXBD?=
 =?utf-8?B?YTNSRWdrclgyd2V4blVHSi9FU0VDRDhTT3NYdm52cUIzSy80QlRHT2Fsd2cw?=
 =?utf-8?B?N1NqK0pBaHVZOVh2blJRT3dXQnN3VVpxYlR0a1FZSlJmQngvNXVOOE1QZ2pD?=
 =?utf-8?B?bU93T1FUMHV6aXMxVHZ3emh2WFk2RXhDckl0UEFLczZidGVKNVVML201U1Z6?=
 =?utf-8?B?bTRja2IwcDl6Sm5TeUJqNTRvMXg2Z3Vad3Ztbnk2emFMVlRLNUtvRmEzdzNi?=
 =?utf-8?B?c04reDg5N2ZGaWhOUlQ3TWk4dHhwcmYyazZtRjU5cXhvQjFpT3l2S01ySWFV?=
 =?utf-8?B?amRoMnZiVzA1UTkvTFgwRXRaRkZ5UkYwUUROdlFFYkszSGllRVUyUlB0dFlO?=
 =?utf-8?B?THhrWklnc3JRMzZxZWJXK3AralVQR2t6a09BZC9GRWJqUE8yNzN4M2Ezc2Fl?=
 =?utf-8?B?dFR6Zlg5SjJtaTZLR3Z5d3Rud2lWd2JBUkQvcFFtc3gvQTZmS0I3NHZhWWJy?=
 =?utf-8?B?YWVCcmZITnlpYzRyQmZpaXR6eVFsQ25rQjBUdU0vNFJSODg1V3dEdit4aGRt?=
 =?utf-8?B?RTA0NGQvVFZHc3FBMU16cnhxN1Qra0JsUmpPWUVSbnYvWWFSdDQ3aXBSeWN3?=
 =?utf-8?B?dmpMZHVvazJ4emVqTUdrTU0vaGhPS1lQa2lDcTZHWlZhRXhnVnljM0dxWDdO?=
 =?utf-8?B?L0dNS29IR1ByMG13dm1GMy94MXEwS0R2Q3VscWFKYVpxWG1yTTB6QmFvRDBx?=
 =?utf-8?B?YjYwK2tUSnJLNURHVHBTcGRuMU9tdzFuV2dKNDhuN3d5ZXJWRVY4VXJYdFYr?=
 =?utf-8?B?dWVzQjJ1NjF0SGtBaGJpdnh0U0ZDQ3dSelY3NzJJYklnMk1SbmxkVksyZWlq?=
 =?utf-8?B?bG52UzNXWld1T283UndHSVJNb040MXVrSG5RWVkzRUNXY0lreDRKUXpSZkFV?=
 =?utf-8?B?cTJvOWY4WXo3Z3A2LzhNdEJVSWdhUktPS2xVaDZrb085RXJsT0kzMFdVeGpF?=
 =?utf-8?B?UHJLd3lqRWY1ZEVRdE92dHJDdWZiT052UHVTUEYyZDM4eWFBTGt0d3RHaGll?=
 =?utf-8?Q?iiuckovukSHKqv2DRPtvC88SkEXC0iRZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enNwakRFeG5YWDdaUFA2YkNWdytTYk1lbEF1WW5pVkpCWlRIeW1CNUVBWEtP?=
 =?utf-8?B?N2t4Y2orTzF5bE9FSzdXaVpvZGNkRTR6dXZONWhRS0xEMjdDZUxJaFBmYkY2?=
 =?utf-8?B?ajFoUFpLRzMzdm1HaTNvaVBuSW1ZSXNIUS9leU40bFd6R1k3L0hNVG5FMjdN?=
 =?utf-8?B?L3d0L3BHMytGN1BUK0F6WkVDUDZUZEZGMXl3aGRpdU10em5PbElPSTZBaU05?=
 =?utf-8?B?QlJHSE9IQjh2blZGTCtCSlNoRUhKV3FScWZZRHNzczJiMm1RT3FXMjAwVEtw?=
 =?utf-8?B?eDVJN3ZGNkFzcFlEdzNna2VadlZqTFZKYUlOVmFCRUdMTERhMFJReGMvdEZu?=
 =?utf-8?B?TkZRMno5aXVDelFxTVVudUtVZDVNQ0E4L2RCSWhqd1FmVllkZ2FaWVVQTEFH?=
 =?utf-8?B?by9sbGxGeUhPYStyemhMVmk1a01ObEpkK0RzYytYWGZFV3gzK2ZySnVVc1Av?=
 =?utf-8?B?MHZ4ZEZkVEJwUks0TysvWkh6SmdsUmF3QXNydkczY3UvTENNbmR2c3hwcFcx?=
 =?utf-8?B?T2h4c2FSNDJFbTA0NW42R3NLOU1Td0xwUmRJRFRmc0FsdjB5ekZMVXB6TUNn?=
 =?utf-8?B?YysrcFM5TUwxVGdrVEQ1S3hxYld5bUw0MnVRN2Y5ejN6Q3ZzY1VZTUdLT01B?=
 =?utf-8?B?cDhMZ3JHYnRDSkJ2UUZDclJoeDArc3FlYkJMa1hyUzhHSTVjRmgzRnJSZytp?=
 =?utf-8?B?djhxK2tDbVpXQVEwZzJyUG45T2Q5U2wwVXNGOHR6S2J6a0lNZlExUDhQbW5s?=
 =?utf-8?B?NUdwWXZRdnlqaWM4NC9PRmpndmdpNXlrcnFXYmVBNk4zREM5cmVRUEdUQkIz?=
 =?utf-8?B?Y0hjT3JMZnZqK3ZyZ3o3azc0b2dqV3ZRTUw3UGpGM3dLaGFRV2w4OGlCR3lE?=
 =?utf-8?B?QlBzRTRlWWZlNXl0ZlBqM2kyOUdERmVBWU5TczFWS0pKWmsxRGpoL3hSMG9T?=
 =?utf-8?B?T25ZWmc5ck9pUEJPdHROOGtSYnF0L0pnOVhNN21PMzltNzAxcS9HaUt4aHhS?=
 =?utf-8?B?Z01RQlBNQVV3U0MxVzNzQis1UXQzNjZsTklFa1lLVG5DTTlnNm96dzNobGZT?=
 =?utf-8?B?MmNBV1JWY3puYmFnbHlzQ1lOOWlwNDhIZFBVTVRpNmdMNTZTc0FqRVJUMXFH?=
 =?utf-8?B?OEJQZERhc2VuMEpnblE1K3ZJOXB1NExIRm9MYVdUbUZNWXhBKzhkT01DOFc3?=
 =?utf-8?B?YzV3aHF1YlBoM25HMlloRDJzMUF5Rzd4b3FDRS9BRHRmSUJ5TU95ZHdyU1Fs?=
 =?utf-8?B?M29QT3U1TE1CRTVVc2hPWlduQ1ZSdXE5SUpseWwvUlF5STBLYXJNVmFDVWp2?=
 =?utf-8?B?VW0xbEVJUWtTNzZoWWJ3dEZEUHgxYnBZaGJ3eWREcnNWUVZRUi9DNXZydm1F?=
 =?utf-8?B?SFkyU2dDVzVGN1duZERUTFZkM05hQm1IalIyamtXNTh2OFF4alZxLzlYR0I0?=
 =?utf-8?B?NVEzbGxYZEtSQiswWjJpM252ZmlrMnpyMVQzcjJPSXYxTkE5bXV5c0pUTlBP?=
 =?utf-8?B?bzVKUFpnU3NQU2dSb2N1NXpFOWhaenAvcWJFV0ErNWF6UVRjOURwVmVYN3hW?=
 =?utf-8?B?YXVmazZWOEhlWDNQMDd0eFJ6NkdNVmNMYlFIaWdjWWtDajUrNDhxMFRId2hM?=
 =?utf-8?B?ZzJtakp0aDI1bUVrNE5VVEhoMG00enpHeWFJc3QwYkZIMDlwWmI3Skk3VUdK?=
 =?utf-8?B?azcrM2hmQ1hhYkRqRGtuY3hzeVNKbGNMZjZSeVVyS3FzT0xZNkp2TG8yODVV?=
 =?utf-8?B?MFZEa291ZEphV0NacTRhMXd4Q2I1S29BSEJONXlKbGJxWHo3SnJwNGh6Uk9l?=
 =?utf-8?B?OWJVUHdyYmltbTBMTjEwb29uRzFnZm5GSTlOQ2dpUWFHTEN2VFlPZzd6MEQ4?=
 =?utf-8?B?OWlWUGR5QU5TYTB0anZCQWtQZEpraHBEU2RTMHVmdXEyZG50L1ZtTnFhOVNi?=
 =?utf-8?B?c3RlNmVMNTFuQ0JVamZPOU9hUERoeHF4SSthcU4wWEJHV3cycng3WHZlT05i?=
 =?utf-8?B?ZEl5VnlndERndlo3VUxIOU52aVJmZFl0Vk9tUlFmVWkrbzdQWVkxUXpWUjdp?=
 =?utf-8?B?WWlsSDhlazd5M2QvTXE2dlBhallwZlE5N3owb0VLT0c1dGJVOGxxOXhVNXU5?=
 =?utf-8?B?M3k3YUdQQXlGZzBJNlZiWXpCU0hMdHpRcGdNdFp0MHlUeGg0cG5tN1VYeXVs?=
 =?utf-8?Q?axZuaMII5xsvLWUajjgpiNQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7c70a0-41e5-4e06-e16e-08de084c28c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 22:27:12.9732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFxDpFYHpfRmvptG3foBYLSHTbSZeNEbDkXdVra0ZG/fe9IE1uqmIqjsvLNZm8+yd+OF1FpczXpjyol+jK6TQZwREOHCm/9jHwePEG144O0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
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

On Wed, Oct 08, 2025 at 02:17:59PM -0700, Ashutosh Dixit wrote:
>Convert test_single_ctx_render_target_writes_a_counter to take 'struct
>drm_xe_oa_unit *' argument, to enable it to be run on all OA units.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 18 +++++++++++-------
> 1 file changed, 11 insertions(+), 7 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index efcac06e15..01df791dc5 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -3125,12 +3125,14 @@ emit_stall_timestamp_and_rpc(struct intel_bb *ibb,
> 	emit_report_perf_count(ibb, dst, report_dst_offset, report_id);
> }
>
>-static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
>+static void single_ctx_helper(struct drm_xe_oa_unit *oau)
> {
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>+	struct drm_xe_engine_class_instance *hwe =
>+		&xe_find_engine_by_class(drm_fd, DRM_XE_ENGINE_CLASS_RENDER)->instance;
> 	uint64_t fmt = oar_unit_default_format();
> 	uint64_t properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>
> 		/* Have a random value here for the context id, but initialize
> 		 * it once you figure out the context ID for the work to be
>@@ -3172,6 +3174,8 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
> 	uint32_t ctx_id_offset, counter_offset, dst_buf_size;
> 	struct oa_format format = get_oa_format(fmt);
>
>+	igt_require_f(hwe, "no render engine\n");
>+
> 	if (format.report_hdr_64bit) {
> 		ctx_id_offset = 4;
> 		counter_offset = 8;
>@@ -3429,7 +3433,7 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
>  * Description: A harder test for OAR/OAC using MI_REPORT_PERF_COUNT
>  */
> static void
>-test_single_ctx_render_target_writes_a_counter(struct drm_xe_engine_class_instance *hwe)
>+test_single_ctx_render_target_writes_a_counter(struct drm_xe_oa_unit *oau)
> {
> 	int child_ret;
> 	struct igt_helper_process child = {};
>@@ -3444,7 +3448,7 @@ test_single_ctx_render_target_writes_a_counter(struct drm_xe_engine_class_instan
>
> 			igt_drop_root();
>
>-			single_ctx_helper(hwe);
>+			single_ctx_helper(oau);
>
> 			drm_close_driver(drm_fd);
> 		}
>@@ -5190,8 +5194,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
>
> 		igt_subtest_with_dynamic("unprivileged-single-ctx-counters") {
> 			igt_require_f(render_copy, "no render-copy function\n");
>-			__for_one_render_engine(hwe)
>-				test_single_ctx_render_target_writes_a_counter(hwe);
>+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+				test_single_ctx_render_target_writes_a_counter(oau);
> 		}
> 	}
>
>-- 
>2.48.1
>
