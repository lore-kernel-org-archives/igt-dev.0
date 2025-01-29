Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24508C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 10:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA77E10E78C;
	Wed, 29 Jan 2025 10:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7eldBul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03BF10E78C
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 10:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738145793; x=1769681793;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=llUgYu2sMsx+3FpgdGMKgLrSo8oEoBeF4+LSLiIuWYM=;
 b=l7eldBulm/xw8TtJA3qG8FXXGm4nZjbY+oDundGL3fgrT3+tzMFQO8ZF
 a33ZTzNYn3Vlz4CsdCQrSnPbQ5n5O+lNIRnQ0nD2Cjou1nwlD+MHMZvYQ
 scfcrliva3rYV4elaAqH1fE9/tGKI06nHONs75wrntttAX3tOgFNe1ytK
 l2rKaowxu7lGmUzQZuqMXps2GZ9IS3uBLvtV/4gO+57Uquy8CFiMArJOv
 MklDMrr7yrS9NRgb/yYczUkxAxYJ5+7/4LN+JBRu0YA0608iayR/9MyTE
 srvSy8cS6vmGzdBfJdiVdQKr9ceatCcRQ3F9f+3PTLgpLotJWfrKHpGMH Q==;
X-CSE-ConnectionGUID: 1cP7ryAsTKOkBEAjn/4tyw==
X-CSE-MsgGUID: Gt6gkbvKT1K47FY8S4GqZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38683779"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="38683779"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 02:16:06 -0800
X-CSE-ConnectionGUID: IU2bjskNSWqYRulm53hi/A==
X-CSE-MsgGUID: ILPOAxyJTe+LwcmPAnneuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="109098190"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 02:16:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 02:16:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 02:16:05 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 02:16:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzaBb7QAqxmOLRQgpffUkelamSI/8J4HWxQMEkNbM4fgpO0WI6BeBZgwYtwZazGxfG5kbEJeogn98Hg79s3ctW13dF+vYRPyoBsa7vQ7SFzHCitCeyR1YTM54BrBvLqrkbMNxeHTWrE04ZddV4wr3GJnjYLDBkjRNW89fHda7k1lVyerIYv0KNhiCopsnZxpAk341QHdGSfmSkjwrmgFJu7+MrRb8idOb9rRi9ocliEc6Q23gl7eeW8rj5KkMnQj9Lauu7r/B4cpWrjGmOSkwh9DmUoBXopu3JPwfxSbHBWo9YcntJwaW/WOFwIHilp0yUED06VqJwA2xR1uLtKivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JHS7N49fEFBLo77axOEiTfE1XPFtYW0Q96ObL/iphg=;
 b=Ql6JFPH/cWXlJwausCe6wS+vAY2Zlx7Mwy4U/7noSpGVwBvaWnQy2nzpttcD/EHQVQpWPte8/aMwlMr/Hjmkgikt9H7Sg8QqDBbZghC7u5HjTIGfr5Kk3WP1uzMSIcH0qajAkIx+9toR1notXifLDPrZElcSJdawseoGdQVjX4IS07/fEkL/o2PlVs1pGDly+pCxYp/V7EvPwJqDQXJBW1qi4KcQlfJSzwOdb2MucLXSFy7NQFx4JTbQGY72oHVWOPTea6bQ69A66zS4drCev/B6hjkNl6iZquYJ4GFmFvoyMpKN9KGfDX7xrzxgEczXiLk3anDz6te40fsf5+E75g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CH3PR11MB7865.namprd11.prod.outlook.com (2603:10b6:610:128::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 10:15:22 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 10:15:22 +0000
Message-ID: <6fa3827b-ec0c-4135-a30a-8d35f5229bc7@intel.com>
Date: Wed, 29 Jan 2025 11:15:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/4] lib/igt_sriov_device: Add helper to iterate
 over VFs from starting number
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <marcin.bernatowicz@linux.intel.com>, <satyanarayana.k.v.p@intel.com>,
 <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20250124081039.31201-1-lukasz.laguna@intel.com>
 <20250124081039.31201-4-lukasz.laguna@intel.com>
 <aa0f8738-1db3-4880-95c7-ec4638a49a29@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <aa0f8738-1db3-4880-95c7-ec4638a49a29@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0043.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::32) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CH3PR11MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: 737d77da-a513-403a-2a81-08dd404dd6bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnlnejM3V2tPYUh3WGoyM0dwREhwNGY3QkFTbm9LeGZmTlFORjZ0VjZxYW5u?=
 =?utf-8?B?d0dtV3NubXNlcmdNU1BkTXMxbVJmMGR3WCt1anhDVExkcW9NeW1mdDdrMG5T?=
 =?utf-8?B?Rzdpck43NURZRTI3TGRWbEpMcWhNbkxNTnFXN3ZnUDZHU296SjVSa1ZLTDc0?=
 =?utf-8?B?QmI5YWJKMXV5cDVlT0UzaE00VUdFZVhkSlR5VVExc1M1bmhPV2VrRUJMSWNy?=
 =?utf-8?B?Qm4rd0MxbEsvQXNDcUhzYktRbkYxeVdFR0Q4Y2ZhenE0K0xGOGVQSW1CZjBl?=
 =?utf-8?B?eWdoYTZndjlVVkFsME41QzZiNGlFWFBuSzY4azNlOFAyZ0dnS3M0MDVhTkFu?=
 =?utf-8?B?UnBqdGUzNjJ0a21ZQWJmQ1lZUEJPVEZkZythWVNpTm52MFVNcXRVc0JwL05w?=
 =?utf-8?B?aWZPU0RBSm9EZWZpYThETFdZeDVlSjdJbkRJWTJOMjRuTXNwMXVzZUZkZnZw?=
 =?utf-8?B?MzVnanllVGJOWVo3N05EUWZSMW01b3RmSjd3MDR0M2RiSW0wVnU2SXRWQ2dS?=
 =?utf-8?B?bytoRmhFdjhXTjBaTUtaeWRBSWxoNUNxV1dPMWtNVGN0d0g2dDV2M0d1OERI?=
 =?utf-8?B?RENPZDAvZ0s5V0dZUVhrbG9rZWZNSE1sby9VeXAzd3hhT0NIS0JtNlVacVN1?=
 =?utf-8?B?MmFlTjJuMWJQaDZVSFkzVHNUOVFxZFNiNVhvdlV4K21YQXZBTGJOK3dXMEx5?=
 =?utf-8?B?OTd1WWhGWTMxUXdQbDFkWGFyYVBabFlKV3EyZ21XZE0yVGI4QlNraHFRdmZs?=
 =?utf-8?B?MHJLNHZwbkJTZHNoNWs0TzdjVnhwOGdsb0NkWEplWmJjcFVVNHZPdjMrVytm?=
 =?utf-8?B?U1V1ZEtlUlpXMVZXSHZoQzQxZnpRellHU3MwWGJ1V1RQSFBudE9haUVSd0Na?=
 =?utf-8?B?aHNEcmZod1lKT3Z6YVRmakUzcDlHcUE4NTV5c09FQzAxdE5KUzliZGUzVGFn?=
 =?utf-8?B?bk1pek9BSC9JQVVWUzhvVVZTcm1UZkFxV3hBVWRvRzJFZm16QnczajNGaURZ?=
 =?utf-8?B?cnYxRWFsektmQjAyZVljZnNpekdwU2lBV2NpOXJrbXVvM3Q5U3gzWTBwcVMz?=
 =?utf-8?B?MkZ1N2gwbDFCWmR2M2JnRm5tMG1GRmwzb0IzQTdOWlA2SDYvc2J5SFFnT1dO?=
 =?utf-8?B?VE5JSVdFVU9LVWUzcDg1NU1ja1k5V01DS1lZSGQ1eGM5ajdNa2xsMXdRUFZQ?=
 =?utf-8?B?ZWhGOGc1VER1azJ3YkluS0xwbVZBY2xtRVIzMngycDYyOUpuY0RCeWtOOFF2?=
 =?utf-8?B?clpaMmtVS2RuMFArcFhuTU9jRXR4ME9PUWloaWNMOE5id3FHNmliZjlpaEdN?=
 =?utf-8?B?cjQzRS9jMzJmaGk1TVpNTFppS3NVWnNkZGp1MjJ5MHkwRDJXaDRGNm51aHNu?=
 =?utf-8?B?L0VVeEZDQXROSHFwMXFHZVM4WEhhOGRWNWpUUDl6YWswKytJSVVNY2VaT3FB?=
 =?utf-8?B?QnczcnI1bnl5Q29mVEtKYmVkQ0d6aTl2ZmVDNzhFcldqM3o5TU9nN0ovTUI5?=
 =?utf-8?B?QnpDSzdJSUluVnFrZUhROFV4b2JraUhWQnBlcWlCYk4xVjc4a3IwWDFJL25O?=
 =?utf-8?B?VjhtMUdGcHlmaS9sd2FudzdPWUMzSmxCZ1JDRG5nZzJyVlNvcGptYUVWQXN4?=
 =?utf-8?B?b2FmNEg5RXN6bUpjNk84dFM0bjNMaWNBakIzaHNiVTVGZWJFU0VhWnVaN1RD?=
 =?utf-8?B?RjQwNDZVcDM3cEV2dU9oT3NKalFzVng0ekI3ZnFLVFg2Y25KT3FRQlFkRmJo?=
 =?utf-8?B?aW56ckppcHpCQ01aVjlYZjloOGpnOVdOSVdNWU11dkFJLzkzZnVIUmVBeklC?=
 =?utf-8?B?RE1SUG1nY2NQTHA0aTNTSGMrN2lDQTlSSHQ5VzRBeGZvbHFlVk9DY1NoMnRq?=
 =?utf-8?Q?+DqonDeULuE2f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDJrb3lSM3FLdGZCMzRJUVIyNnBZaHJXN05NOGgyZHBDM0t1NWpidnk1YVZZ?=
 =?utf-8?B?eTR3emZNNEJNZ3RtY3A0cjliay9TeEFSblpETWsvRG8vRGp4eFJkR25veWcx?=
 =?utf-8?B?NVZKQ250R2xYNFVMWWdoOEJiVGQreWVEb0szbGJ5N1Vzam1ZMyswRWxib1Fs?=
 =?utf-8?B?Q2hVK2xLRGc1Z1k5U3pWdk5mUzVQYXVFaUxpMTVCM1U0a3RDNzE4S09VcW80?=
 =?utf-8?B?Qy9jM0l5M3JONzVuQUE5a1BxM1dtbUJCaUZ6VGh3ZXhwRndKaVdRcmQ2dndB?=
 =?utf-8?B?VVdvd2FnSGJJS2NDbWpxUXU4UWpSMEFTRmR1aDRITnRFaVNDZWFxOUVtQjNk?=
 =?utf-8?B?TnE2M0tpUXpKdGJoMVpHbzJMQVZFLzJxM0M5V0JSSnpvejc0YnVUOWVHeGdF?=
 =?utf-8?B?aERsaG51QmNWY2IwSXFwM3BkejhMdEZkV01TdVM5NHgrbzR1VEsrU0JHdVl1?=
 =?utf-8?B?R1dyVVFaeHhZcFFmaitraE9TajZTVVZJbmx3c1pmL2NoWk5nSFlhU055RFFG?=
 =?utf-8?B?WEpPUjRhMW0xNjJwLzlFWnNBdjRxSVBTdEVtOCtZUUMvVXhOejJQS3FDODA0?=
 =?utf-8?B?WnZlOU9aZk5YOVBvT1hDOGNaMlAyRTA2aGRMOGcxWGlvbHJHcXVYSkNTbm1j?=
 =?utf-8?B?WmJ3aHRNeEQrOTNHa1l0QUFRZHJqWjRzcTU4WEZvK2tHSnBQdEZwcWRCVDVz?=
 =?utf-8?B?TWFmVGE1bGhhUE5aNWozTWpSZXlJcWlXV0Z5dXl4My9VUzRtSkxCa28wQTRp?=
 =?utf-8?B?bTB1NXRwNlVwNUVqOHpVbGt6UG56d0lZNHJ5MjFTYnlGWjBQZ0JRdzJlZUNl?=
 =?utf-8?B?ZlFBRkpBTjVqdTgyaEVNdGhoS3dxNmVYQkhkczljMjN0cUxkQWRZUEJQNUdH?=
 =?utf-8?B?OGkwcGtqUWtQMlM1UFkwemdrOUxObGNINSsveHZRcjhpYU5ZNTREZVUveWxG?=
 =?utf-8?B?cEl0SDl4Rm10azRUNzZLTkVYcXhEbkhzR3pCbTFxZUtyV3NUMmtTUkdQNUNB?=
 =?utf-8?B?ZnZuTktWS3A3UG5vODVoQUhvQzkwUUo5TU1HKzRVZ2U2TVFsTXhQVldWRlFZ?=
 =?utf-8?B?RnhEQlVnVVFkM0htQmU4MXBCVm11NVZYdWJGYkhocWQ2Si8vdk9iczJnbXpS?=
 =?utf-8?B?ejJid21PR0pxUmhoZ3FzRjJjRS9PZ014WjljcUs5L3hCa1pmaW5PREFqL29D?=
 =?utf-8?B?ZDRsMHQ2OEExb09odVBaOE04b1AvejRpZDlZSnYrU2FnajhKTHhFUGk1eCsz?=
 =?utf-8?B?SERUUGpwTWFQSHdqZ01UemhiM09XUm5rUFZSNVZyS1RZL2RwNUw4ZFBySVFZ?=
 =?utf-8?B?dzBOcm9XclBXV2RHcEFuUW5OZjBhcHBiaHdZR0doMzh1cWNpaW1sQWo5Smdk?=
 =?utf-8?B?UUpTa1B5NUZmR0VJZVNOSUxtRkRsdldERzJiQ2kwUm95YTN2aUJ3SmRmN0Jt?=
 =?utf-8?B?SzlGM0dCc1VFNXkydnZFOW5CbkQ1eFdFdFdMYnlpVHBpa2JxWFEvRmdEYnJQ?=
 =?utf-8?B?bW9tVFREVjJkMmtxRlFoMlVpYWxCa3YxL2xLaWV3OG5EY1gxNVQwcElyMDhP?=
 =?utf-8?B?UkxvRlp4WXFjYitPME5LSER5ZFhYQ3Z4RWJPNjFvZzN5Q2x6ZVNmRS9NSjlL?=
 =?utf-8?B?NnRuUzh5NmFFa1UvMXRDTDJldE5wTWRpNmVXZW51N2NCZjYyYVZBdm9mdTNO?=
 =?utf-8?B?ck5pWko2SGRwVlNpVTE1U2czZmpReFFaZ2RHcVE2Z3pqbkJ0d0t2VW1iMGlN?=
 =?utf-8?B?SlNubXBKOU9ZRXRHaURZQjNtTjNVREIzR3RodkpmOW15ekhHTU1SSHZHNVQv?=
 =?utf-8?B?M1UySVNJMXRkZVV0bGgvdXNsY2NGS3FCblA0Wk5WN0p3d2xDOVFqOW5DakdT?=
 =?utf-8?B?cEQwbkN0S1lkSWpJdEx3RnBaTWpLZit2MEtQM2ovTGNJYWQ5bUhJL0E5TlZH?=
 =?utf-8?B?VmVHNFE3aFpJUjFiRFBSQU9LMGMwZXdSSlZJRkhKaVRMcUcxQnB2cStoenZF?=
 =?utf-8?B?R3RXQmFoVHlDbzZXdlNzQm1XN1daM0ducnFQOTdGRUpQcFMvdFVBQXZRcHpD?=
 =?utf-8?B?bHJ0TERhTHFWMlVReUdMekdNcHZuSGJrVTh2a0FLTERZRUJMVHZJdG9USG1s?=
 =?utf-8?B?dnI1M1haRTl5cVlrTHBWcEdzYnNUb2UxcnpuRjV0aXdzNDJ5UjVKUDhxZHNO?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 737d77da-a513-403a-2a81-08dd404dd6bb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 10:15:21.9211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmNqNva6UYWPfKeoLfqI9uHmwK/G4fnRJ25PtZbe/xwu7JYSn/tHJdP6NyXRbjyPFdnbSDRAWOmO+uW5RuZwyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7865
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


On 1/27/2025 10:06, Michal Wajdeczko wrote:
>
> On 24.01.2025 09:10, Lukasz Laguna wrote:
>> Helper allows to iterate over VFs associated with given PF, starting
>> from a specified VF number.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   lib/igt_sriov_device.h | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
>> index de25a7d98..741b1bcec 100644
>> --- a/lib/igt_sriov_device.h
>> +++ b/lib/igt_sriov_device.h
>> @@ -86,6 +86,21 @@ igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
>>   	     ++__vf_num)
>>   #define for_each_sriov_num_vfs for_each_sriov_vf
>>   
>> +/**
>> + * for_each_sriov_vf_starting_from - Iterate over VFs starting from a specified VF
>> + * @__pf_fd: PF device file descriptor
>> + * @__start: Starting VF number
>> + * @__vf_num: VFs iterator
>> + *
>> + * For loop that iterates over VFs associated with given PF @__pf_fd,
>> + * starting from a specified VF number @__start.
>> + */
>> +#define for_each_sriov_vf_starting_from(__pf_fd, __start, __vf_num) \
> nit: there is no need to use underscore for the macro params as all will
> be expanded/replaced as-is
>
>> +	for (unsigned int __vf_num = __start, __total_vfs = igt_sriov_get_total_vfs(__pf_fd); \
> macro param "start" shall be wrapped in ( )
>
>> +	     __vf_num <= __total_vfs; \
>> +	     ++__vf_num)
> macro param "vf_num" shall be wrapped in ( )
>
> and there is a risk of param re-evaluation due to param reuse
> maybe just add new local temp var for it?

The macro ensures that __vf_num is treated as a variable name and not an 
expression. I don't see a risk of param re-evaluation in this case.

>
>> +#define for_each_sriov_num_vfs_starting_from for_each_sriov_vf_starting_from
> why do we need another alias for this new macro?
> if the original name is wrong then just use a better one ;)

Depending on scenario, we want to be clear that we use number of VFs or 
VF number.

>> +
>>   /**
>>    * for_random_sriov_vf_in_range - Iterate over a random VF in a specified range
>>    * @__pf_fd: PF device file descriptor
