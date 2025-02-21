Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB45C021AA
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 08:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D44210E136;
	Fri, 21 Feb 2025 08:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e+J0giS3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D28610E136
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740127765; x=1771663765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uKQEEBEspzzB9zhohGTH+T0zlkioN65br8nB4FXSTT0=;
 b=e+J0giS3o8WTHqUN1rnNF7oJ2g+JntpbO11DxydKQk658Z0wgXSe2tdi
 RmOApSomtkdBtzEOzBtBNIUO7RnkfvsIIF4Gdjk8ftxZY/W2ltJQSAlcW
 XTV3WHl44EdYHcK97Tyd/Qguvl1WWwQOOrYkZYJo9hBT6ZT3nM7J+3qll
 kiOxTUt8TPrmGom8Dgnk8SQoRmwpsciK77rruEkbqv345TEURcLqGG9Xw
 slHEpe5b/BFdUmQhpr6JfHJHgYGYhRHLVmVLYtK+E7GL8pAhVug/B4zkw
 05uKx7OM/4pCCHxY/xC+x9kMMRaoQjfySBUC2OFnDRLonwTz+yFbFrLej Q==;
X-CSE-ConnectionGUID: T3ShZ3IRQNOn4eajBsMMrA==
X-CSE-MsgGUID: eLHHUMJSQuCZQkADypxF7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40950492"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="40950492"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 00:49:24 -0800
X-CSE-ConnectionGUID: xtYkam80QFWkrr/NuvyIkw==
X-CSE-MsgGUID: zao+4WIiQYS0LAIaqgfiog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116200944"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 00:49:24 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 21 Feb 2025 00:49:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 21 Feb 2025 00:49:23 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 00:49:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gea9dTOxVOYCfNaHHfWWlVa+ePgKR0GcsyHJtxLfSqNJhgKtFXvuMcNrAUBzNmMT2j6h/OJ39KwwYzcn6MYbXG0xjB4LGoyaEtrU8zbYpZdetHhN4gtHLKgMSCY/9X9UeUPeayY+B0JPKBJ7+t8UPgaTVK/DfgfisFosulp1rcohcD5fDLWEUqsdeWqNjIJa053xYh+TJld/d0ltcmHeioDVX7+UGLAtLjn0Z7yRkRm+MwMMxiqa2XS+B89EbflkyoIbKG2wrSJyHpfSaX3zAJ1ufwDudtG/v4ig8rROX8RZdKOb8LHwXtJ3APzxxcqqv9qVh6CzyPVJwECEZDoegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SkXM1fp0dEUTOtmPTWLIXHlN+458Vi1zGcG+HNQJGA=;
 b=Jsy3xTmIoUqPJipshSYPKNwrAAufBtrGJUZ6fhnl5aNZnG2dmBkhoywjsHa7lO8wqz3AzsQc2M8YfkDrtZst6Y2zlFZLeAwKaup1ZcRZH0eE/kOMZl7BwOVN66OkNh2pF0LHNsLTKX6jCvh3u2ftKZ3m6K2oF/rE4D1/TYmlHemtgzX/Pvqh/1V0t1WNm49dZIQRJd8VzjuI++ieaAY1WlJ5BQVt+eEoYrq+3L7O2IkbCjVpNVCYkTWnQGgK0TLHfQfdy/bf5RaahTCVbpq+q+QXxSlxh4czcoYCn3ukvIUPl8nlI75BadV3tyG2ZamR+RvauX9ksejiuf6iMBbuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA1PR11MB8174.namprd11.prod.outlook.com (2603:10b6:208:450::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 08:49:21 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 08:49:21 +0000
Date: Fri, 21 Feb 2025 08:49:15 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2] tools/intel_reg: Add --pci-slot option
Message-ID: <qwxjvrlabijdbxzhogii64lmugihyi5wphdt4ya3nywwo7ehe2@o64fe4m777e3>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250219121050.71831-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250219121050.71831-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: VE1PR03CA0034.eurprd03.prod.outlook.com
 (2603:10a6:803:118::23) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA1PR11MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a5fa928-6584-4bd1-32fe-08dd5254a2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkN3cnJkczFyTmt6LzA1aDJUTitIYzBGNU1ZYzYwRHZhcVYyZnFyVUFhYmpH?=
 =?utf-8?B?bGM3NE5VbDI1aks3WEtCUmdvL0lGMG5oaFNCQURTa014YzE3U3NPZVR6WGhC?=
 =?utf-8?B?Vzl0WUl4NExvYVlQWnZyelhxWkdOaUdyYUVUMkFoV0NBVDFqTzI2a2h1OU5B?=
 =?utf-8?B?dU5ZUjF5ZzMzNS95eFpyVndZZUIvRVdKK3MvQWNtUmdzV25sZVUwKzhMb01I?=
 =?utf-8?B?TjRSb1FSRlBpMXZlSUplZHJEMHpjNGFUb3YzMU9TZDV4YS9weDdTMjNJMzlT?=
 =?utf-8?B?RU5Xb2xGOVNNeWVhVFptajA0bUw5UHh6SEhsbyt4REFxdld2U3JiTCtYU3ds?=
 =?utf-8?B?a3NEUHFjeWhJdEI0VEYvVG5JTFYwazNlL1NUZTRhbyttRWpuWnNadHFqL3Ax?=
 =?utf-8?B?cmFlOG1Pd1ZiZG04UjBLQ3orczZKMmVoNlF3MXZwT2hzT1Y0MER6VkRyTjVE?=
 =?utf-8?B?S2NrVDZlb1hRRXZhbWpJUGJXMUJMQ3VESG9SQ2trVDlnbDVCYUw3UjJ2bHdR?=
 =?utf-8?B?YXlOWmFCSVgvSTZTc2Y2MlcwZ0ZNa1AxS2FiZWxDYWpQWnVLbHc5bkFzZ1BI?=
 =?utf-8?B?OHkya1NoL3lQWXhGL1F6RXdUSUVLOGkxSy96ZlAzSzk5Z1p6dW1YUXhVWFZG?=
 =?utf-8?B?ek9qNzk5SUNOOUszdHJOdGx0VFdERXNpcjBlV0Fsc2tEU1JXandjU1d1UkNm?=
 =?utf-8?B?aWI3NFBIMWpoYWlmbVFXTE54cHZRbFViajVhaGNzZHhjZ3RDOHhmS3lxVGEv?=
 =?utf-8?B?M2VzMFlLNlB5MjQ4T0cwUGtOWk83aitDSXJlVzFWNHBoQnh1b20zMS9mMlFP?=
 =?utf-8?B?bzNSYnRlRUkyR3VNam5BRVlvaUxxbGNaTXdCN0lOSStOZjZVaDlLeWIyWVYx?=
 =?utf-8?B?b1FIcDFoUlcrejJFbXMxMUlPc2s0bnYyREV2V0ZVdFB3dThVNG1wTEkvK2ZD?=
 =?utf-8?B?cnNQNkw1T21CN0xGelkwTHVhSlEyRmlGdm9YYmVmT0FKV04wd1V2YmhoZ2tQ?=
 =?utf-8?B?VEhXU1ZuREt5eGVCWUNPRk9hRDhvaW83MDc2cHJtbXUyekNwdzNhTkpqS0Y1?=
 =?utf-8?B?UGE3emRHaVNJMEV0MnJLQjNBTG1lYkZsZ2JReDU4MlNKaXNpbXlsRG81ODJK?=
 =?utf-8?B?OUZMMS9iZG9IZTU5aytIMHBwamU1aW83M1hmenBESE8yN2QrV1dIYjRrOU1Q?=
 =?utf-8?B?YmNDTzR2OSt5dzlPL0s5eDBZd2U3N2tuVzZpL3BvNVk2cnVLYjg4blUyUW5l?=
 =?utf-8?B?TTRNdEFkRVhNcVVxbkJqTitNZkVkeXZxVE92U04wNEtkNEpuc29uL20vOGt5?=
 =?utf-8?B?ZWxWbE5ESUEyYUhLempFNVJiNWpvU3FjMEZ6aUJJaDBIM29tWXYwRE1OK2h0?=
 =?utf-8?B?VkNDZ2FRUGpxUytwY1ZIUFFJNW4rSjJtVEdpZzkxMTdUWXpPYTRjYmczMFNm?=
 =?utf-8?B?RGFBS09XNUZicjg5MFIrMFlBSVZaM1BhNUF4UWpnekxHUmRXOVZmaHRrb3lh?=
 =?utf-8?B?bzM5K2drcDdmWlV5K2NvaGFVOEpKZDZROEpsYnVpSHhsOUtqV1ZVaTVickhX?=
 =?utf-8?B?SVpmV2JQT3Irc25YNU5xdDdrc0sweHNwbTgxQS90bktjT2ZTZVhaRXJmcVpx?=
 =?utf-8?B?eGcxTXBENzk1MmkrTmNxUnJESGg5QW5mck5sQUFOeFBwNkhwS1lBd1d5dnlw?=
 =?utf-8?B?WXByUEpRbFBoZ09ZNkwrVXBLbEZubk1lYmtMbXFPcGU3WUxFaUZtbGJHZzJz?=
 =?utf-8?B?eVhpR2IzV3ZIeXNRNFRoc20zbktrUGpXVW0rbjlLd3VheFZqbUNtRGZmSEN6?=
 =?utf-8?B?M0FINlhCaFRWL0JuVjBZTUcwNW0wZzViQTMyT3RZSW02Q1RiUGJkTEtEZmtm?=
 =?utf-8?Q?+rA1eSPDIdNTi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MStSTDgxQmZOTnBjNDJybDROQUpZbkRTWFFKUVdhSHAwZFNpYWlkY05YUFpw?=
 =?utf-8?B?endKNmQzTkRqUURBM2FqNTRJNC9LcDJ6RElNYjBWc0lSR0pVQnVuRHEvTHBW?=
 =?utf-8?B?TEJ4MTBRRVdOZ1YxU3BvRVNGQjE0TzBZR2huQkowdnhDdnVNQlpQVm1PdVZk?=
 =?utf-8?B?dThHd1MvMy9FNGhQeVdBOHd5QnR6QXBlRkZ4S3FvNXJ4TTBlbXAxdzFObDZI?=
 =?utf-8?B?S0JSS3JJN1YrSVpvQzVkWHdWaFg4UFE1akl4NS9ONjdWYWFuL1Fzd1pDbmpS?=
 =?utf-8?B?ZEJ0TkM5RGEvMU4wTjArWmRFcHhBaENKQVBJUmhlMHhOS05WQ1lERUJucC9j?=
 =?utf-8?B?djIzMU90WmlOaEdNWjFwTXRjS3NERmh3MHo4NldXLzZMUTkxTE1Pck00UkRH?=
 =?utf-8?B?aVdnS1RyNkVsU3FnOUZnUWRmNWI4TTJXaThXZTY3dmdhbnE5b1k2aWMrSkIr?=
 =?utf-8?B?NjBZVEVuc2l4dVFyTEl1anZHaEllTmZUWXhTb2l0VytBaXllWVBna0FCK2Jm?=
 =?utf-8?B?eUN0dURZVEFqMHcwc2d3V1BUQjBrR2F2ODJSZ25wRjdyUS9Ja1l6MFBzb3Y5?=
 =?utf-8?B?N0E0MENyeFBIQytzSis1UWo4NUFnakZib2JXdkRtazJVOFNlN28vK1FqcnNQ?=
 =?utf-8?B?c3VJVzNabW5nY3oweGlDU1I1dHdkdFN5Nzk4ZnB5OWV4b0R5bTA0Sk5Menpx?=
 =?utf-8?B?TURWZVlyeGpJR2xucnd6WnFvM1NFK2psWkEvQUJIOXFrU3hKR2Z2Sjl5YVlB?=
 =?utf-8?B?QW1OalpsdGtPclBkL0lNS0N0WEt5bzU3eG9kK1JPMXVyaXltTW1NaVdVcWJp?=
 =?utf-8?B?WEtVRHEwVWNBTU81NzIzSUJ1UlI4R1hjem9zTVRtSXVJamNIa1VqWFVtUDAr?=
 =?utf-8?B?cGdweko3a3o1UHVObVA2MnVDZ2F4VWlzWjFGNytXQXQrUmZXZlpERFNCZmlm?=
 =?utf-8?B?Qk50K2Fzb2hxbXhGZlhBbTVPTXNmendveVk2SkdLSXhvODBkdDVLbFE2cG9T?=
 =?utf-8?B?YzBGZmpSVWhhdlppYlRPUW5SSmpqSDV1NHhpL3NXczBGN2pEV0RKdUdpc2cx?=
 =?utf-8?B?REJJcjZ0S21MeUFqaVpDSEZ1WjFXZ0o2cWhYSXNMQ1BpNk03SjNHWFJMbkVJ?=
 =?utf-8?B?UDU0L2R1U3E0Vnl4TmRsQmZSMStJNUZnSFh6TUJ5UUpudUJudFhjeTJiZmlS?=
 =?utf-8?B?NEVPU0MybGtJbVJaN3F5dTdLaGM1UVJIQi9nSWQvNzQ1T1l4U2hhU3hUL0RW?=
 =?utf-8?B?MURtdzFvM3pGUlZhWFhKWURtd1NBbWZ0WXBVK3pYbGVHZ1pjYkhxejNWSlVX?=
 =?utf-8?B?TVQ5WXU5NHBMZHRvWTg3YXJsMlk4MFB3clhkcXFpOXRPaXBHWHUzMmhmV2lV?=
 =?utf-8?B?Uy9uNUl6LzRKUkZsb3pOc2taYXJQSW5NWS9HSklib2Y0ZjkyeXp2RndvTVBF?=
 =?utf-8?B?dkw4Yjh2UnpQcm9DUGFtV3B5YUprWWE2OEE5dGY5alY2S3dycHJEd3JZcEFS?=
 =?utf-8?B?OGtJdG1zbDc3QVdVd0t2cmFPQU9QNGJJc0pBSWtvZVNyNEFqeGNKdnpleHJC?=
 =?utf-8?B?QmZXQVBFejFDWkFTbCsrbUQ0YnIvSmdOZ2lpVUpENnprbHhPNjFvSGNLRnZ2?=
 =?utf-8?B?OWc5bndPK0xtUldJMWp1dU8rL252MEtHQjh3eXRRYWZwNERsanpOMDRkK21n?=
 =?utf-8?B?cWFvcUhxZytwUHdTWmVtYVcrR3RTRXZ0ZnZlazhMNkJwL1JFWnlWOW1vL2I3?=
 =?utf-8?B?L1gwWEIwWXRUMWYwbGZkRUpoQUllejhFQ1BTTmVJRVdEc0Z1SDdOMzVvdG1m?=
 =?utf-8?B?K2ZBcUkveHRkaDluTk0yWEl2M1hIVFcvRlluUDJnWWFKY3ZoTVg1NkxReU1m?=
 =?utf-8?B?TDI1VThUc2ZDQnIyZ2x1dWlXN0pDQzFia0xDSldqSFdXQkJ1OHZ5UWlncndE?=
 =?utf-8?B?Qkt4cTY5NmxsQ3FSQ29hVWsrL09oMTZBYW5icVhDSUxSd09SRnVMdU1qRnNF?=
 =?utf-8?B?YW8vOEJjRmw4L2dGZlFOTjROWG44L2tNdVYva3NxWTBUYmpSSldkRGNpdVpB?=
 =?utf-8?B?d0xWVzVQT2JNZlN6anJ4VGd1UFo5Tm9McHdBWXJHRlhXbDJTa01Sd0ZXc0JQ?=
 =?utf-8?B?N0Rjd3NVS3JveVNPUFB6bDVsWXk4SlVoMGROV1c5cTA5TmNQNkdPRUt1blU3?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5fa928-6584-4bd1-32fe-08dd5254a2a2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 08:49:21.7997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzkflehlxjSW9zTgj7W3uOhqJCegWtdhkYYzyN1kIE36ee6Uy/TsPGM1ZsiSD8rEedt+4WL9yIuXqg9DcIFp8qSi90Uhn0ltnVAzoZsc7k0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8174
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

> Add device selection by PCI slot with new option
> 
> --pci-slot <domain>:<bus>:<device>[.<func>]
> 
> Examples:
> 
> intel_reg dump --pci-slot 0000:01:00.0
> intel_reg dump --pci-slot=0:8c:0
> intel_reg --pci-slot 0:8c:0 read 0x138108
> 
> This should help in multi-GPU scenario when someone uses two or
> more discrete GPUs. Also while at this update copyright years.
> 
> v1: address review comments from Jani (Kamil)
> v2: address review - added =BDF in help (Adam)
>   removed refactored code, add helper info when option is not
>   used, renamed function checking PCI card and improved
>   printed info (Krzysztof)
>   remove --help from commands arrary as unrelated change (Kamil)
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
