Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6D5D2CDE7
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 23:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDE710E9E5;
	Thu,  4 Dec 2025 23:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxXr+uwn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F5E10E9E5
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 23:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764890759; x=1796426759;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZMwW8gYJnVQFuGZd6/hxAsdKkUC6ZSWKed8v6netcpY=;
 b=fxXr+uwnHXbzyTSH6Oij0qBRDgNBf9Ay4HAYNnr69ioBT6qt3shMl0Jn
 HfFe/AbgCUUs+i4HYXXUKWErMNcUR4eoTh5/RKcZQ4LXSmdfiAMj+RmU+
 GlPy7b3blzJp+IxBUdGlx256D5zMnCRCuLhBWBSg1Bk7sYZy29dzS4emT
 XFCx7WxRE0xm1V5BWD7FULCqsRdpf9pNCBw6OqUZrU7W5pSDw73kM96RD
 zEYpNCXZ+PY3lm7nVl46ujlvy8CsNir35Vy9pzomY47Vq5viBqH9gV5a8
 vGwU1n4jpsP4G3C8m2WC7m94dqsQOywcW2W0LxGm3A1xJNmaZeApYRwVS w==;
X-CSE-ConnectionGUID: CxtyoR1ZSkqTisU4PU53jA==
X-CSE-MsgGUID: YHfhssqzQQGgfcegQ5+pzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66647139"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66647139"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 15:25:58 -0800
X-CSE-ConnectionGUID: Wa6PlMUVR1mJ6QUfIISy1Q==
X-CSE-MsgGUID: t2YP5+03RrikIQ2CvwvYpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="199551927"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 15:25:58 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:25:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 15:25:57 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:25:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4rpvbQnAoPDtKXq5TZeeUJenfUhqQICZm+sfJCixYvAR2ZwwJKtjVIxWBRZ7ta7au1lJw4y2FAVC6ase9tLDKX+pBEljTClZdmPbB+icyIbmrUSUNUU3FsKM16BqZXLRxtXkVeaeFUi4h+QLB9R1P9eBNI/Cjd0oXrqU3K+f2/VT+X30+6oX0hcqcBoZem3I3L1Wf3/Pce5QwfrDGkXjFwqX0OoyQ4Rd9cCaspj+nwlr5BCP2lICrLD6y0PWNST0JxP5ArVh358z+Qs3Lm/dEpQGrniobcBGaxdDbNcvOLOG1t79osUOnylcd+gPRFP7DTd/4JRUmCYSRExWD+Bmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcrwlQscdz0taMUrQKtg9ZpqDkzCLxgnBWlF0qOB15k=;
 b=HiMUdR1s+N+svnzPNEbRomSaAWI8JecA4ZYS0L9AggsPVPBkHsUrhG7iBR3v7s0LCpOv4cf962ALZQKlmbzKqsT7o5K+dJJ+fVpdvO7ynQL0SkHhugk6FkoCvaFLHDZ2lF65isAnN2FvaTgmqaGE0CfRqI7ADNNpbH6HPSXUH+Z3oc5ic4CBRltlLukqpEYEeRLvlc+zq+2uFDDbx+sHMIdNAQ4sG3GzmdUpPuQpfqH44CyLBQMeGw5A+J86OLyq0VzojsEQV9SwLo+m5aCQqSqE6WEXHXaXWi3hxxrOjVATfJjxvRoD67P6S4njv1v/hbvZnBb93Gx54wpA7s58nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CO1PR11MB4947.namprd11.prod.outlook.com (2603:10b6:303:99::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 23:25:54 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 23:25:54 +0000
Date: Thu, 4 Dec 2025 15:25:51 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 12/19] tests/intel/xe_exec_multi_queue: Add fault mode
 test
Message-ID: <aTIYfxGicqGty9rA@nvishwa1-desk>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-33-niranjana.vishwanathapura@intel.com>
 <b3859a79cb9f643b1978d05aee064fc936384c79.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3859a79cb9f643b1978d05aee064fc936384c79.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CO1PR11MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: 81812e15-af2a-449a-c73b-08de338c785a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bRln/3ozAY3i6RObnBSLfKhW9zpAs3dROJbobHykZXzMETnU9jUlV5+vEQ?=
 =?iso-8859-1?Q?xt2Tpjwa1jhyEpIzurxNwblueF8Kpq5W6J8tl5YLthc7TayJbUD8ZEdUBi?=
 =?iso-8859-1?Q?+Dz17VsoFQmH8LsfCdLG1wpDtaAZY60p3UteMaEafH1MztY+5PxSGcOmq5?=
 =?iso-8859-1?Q?ghsN6TzJtuyVMVHwDZG9Tu8auGxc6BYwDp+SKkBFbgZz6M2DWtstmPpCUm?=
 =?iso-8859-1?Q?nHefZSv1w3qBdx1HJxwRi4k0uV3tBIxI68ssaXujYgNtq/bbsPfENgUD9p?=
 =?iso-8859-1?Q?OYJu5wO9pmeGCKIIJWJIhNqdaJW03N16CMQBkjADtBfKoqaJExsYTQjB2K?=
 =?iso-8859-1?Q?2kG4WkA0+s2a1gtfVuq9OQAVayZegjOF6jCNlfa84kJ5O942flKTT3zmYG?=
 =?iso-8859-1?Q?XYqZA+TcfIY4HilO6XXx69SHm8df+W7GrKlpxpR2evf7w0E/Q6GWHTgf6f?=
 =?iso-8859-1?Q?jq3S4kR4RVkaobWQfcF2Cz+7GuQ0pLnInuwBoktiqEfRBKoL5arbsdgu6R?=
 =?iso-8859-1?Q?P2xL8AiV1v+aI+f2OfofbLdvZFd7qtWV1t6797wPvypjRCBMET9cd41ubu?=
 =?iso-8859-1?Q?SlnUfg7MyMuivcfLmRSyPAcj/h0Ef6wrN7IJmkw5h0oAA6grtEhjtw6HX+?=
 =?iso-8859-1?Q?i74tbyI5ds8BjRW8yyrTAYj2Rc0Ctn2PnzJwW4gKV3sCZ6VuhO06Wc0Iwv?=
 =?iso-8859-1?Q?Wh6SlUDrwcYKHCcTDd4Nwylo5DaW0KZMZbpR9YJqxF1FnpSyCfoBvG+AKf?=
 =?iso-8859-1?Q?HDR1GChhcktnBxU4hvgRZDOsQdL8rxWY0qTpDTJL3RgAyy51wx8VOB0GjX?=
 =?iso-8859-1?Q?y5+MDqHuqtHky2ljfa7M7ooeGTOkOZ6kr943x30Fph7Ong4el1bWepbEtg?=
 =?iso-8859-1?Q?RxJtFsp4VHmQ6AcB2X0nwf3pUfWsKIBZk22JA0Ysr7cSi1MfH+Qsp91a5+?=
 =?iso-8859-1?Q?cmQFkqzw33KuY5wkW83A3S75OVrRUEHQ9nX4uJyPOULdkwucGt2KSCx+Y9?=
 =?iso-8859-1?Q?WNZkQI4CosIhh6jLGUXm7bTljVT67cFNhzANQl7U4oDA5ZhEJoukLUcRg8?=
 =?iso-8859-1?Q?H0IiVdT2xiSUrd3P4jSBbblMv+Ym1+IO31qdLxtEQrhiGbgTadB6aT2B51?=
 =?iso-8859-1?Q?t9wRtWhrOlKIY5iMA70sOWnx14/O43DJAbaykqrDRdVli6ysTSeqX9h41H?=
 =?iso-8859-1?Q?d1hgZS0nUIUfAya3s1HP6tBOlaKjhbx+7dVRzqKQadmkb37t0LjqV96bm3?=
 =?iso-8859-1?Q?Am5e2xlS69iv9+3KlnCryj+VOaRwvErgYQDetCin1HRc4XafMVbcBjpOkX?=
 =?iso-8859-1?Q?2wOWmsipk3+Vfa+t1RUUKd9Drhle8rnvoCsLrMm6f1+oUR0ZIGhU6nbxQq?=
 =?iso-8859-1?Q?H1pxNYEyKZwqDtncekBkUft3wLgaFJsN/XQwD40G2BDovajlht5/sNxpc8?=
 =?iso-8859-1?Q?eEiOjVjCNqPbFqdfTpfC2N6ZejXCUTFip2rxywsDl3Q/rOEc7nbJuscCHp?=
 =?iso-8859-1?Q?pfAMd6v+QnbMx1Bsy2FCH8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MgeLPL7Qq2Cd0ZCFFFGXU1MLGlcGE1tIk7WONfiq1UzGoNlCY3+EKI3DqF?=
 =?iso-8859-1?Q?kL8kNBeSMFr2em7wG7u1FMeGM1xmPb6m1FfctH67e5j4zWkRhHuYumvYaI?=
 =?iso-8859-1?Q?eHdXUtJ1HzPpE/OURjHtUg3y+bx/rjelMgq6Cdl+O1Nud7dsY4AScDV4cq?=
 =?iso-8859-1?Q?DME3rg3Pki2U5O2OGUXea48abhOmFWzoU0f938PlLiXqh0guXytLMTh6kP?=
 =?iso-8859-1?Q?5yVuMjJL1TQrxLoaGtMwVSDrIC6hPHFnwS4HCFKIiwmkVNzfb8MTHW9TNQ?=
 =?iso-8859-1?Q?H02EYln0BQ/a0ku6dwC78YS80dLEBZmnJ+fhFJ7fqTlkCdThRfFDenpLLN?=
 =?iso-8859-1?Q?0l0HV4CE9/Z1Vq+vUd45g8sT1rtJYUXO4h4l+Oll4vx4mJb0OBV1sUKLzA?=
 =?iso-8859-1?Q?vZr4m/sUKxXWCJD74X9kwaweReZz/N3Tm+a7WDoQbjOOk/OZNlDBZPRoBp?=
 =?iso-8859-1?Q?FCTnaJwyoH2taMKNMdc7v1D9JdTBk2SUbeyGQ6rCt/hoopw4KP4inYbk8/?=
 =?iso-8859-1?Q?c2L8aU2espzzhms9qrGsgtmq4AIu1ZnzSsqWbPQSVg3d9s0iOWU3LQIapM?=
 =?iso-8859-1?Q?jtesEDxW5hRFdICcEfIIYKQasWaj7NXX10g+Q4c3ibFM06rTwSGwPjP/dD?=
 =?iso-8859-1?Q?09Ov3lDUZRC0AzfKrEdESUjD18pnTfRauNknkx5Z08DtGEUsLnfQJO6QyO?=
 =?iso-8859-1?Q?zpz98ai4DzqDye1o9ygj8PZgGwexGTgi/0TmRKo7YkClgzFVF94IXV+l/p?=
 =?iso-8859-1?Q?fxaY+rxeLvw++qnVkJGx/DFRQgESJ32s4MGKntXoPerQG0NanLy5aWafrE?=
 =?iso-8859-1?Q?3ET5MuT3WzXT11gYyvu77sRjBuUN86YhiOhWGqP3sVZlo86ZsBrYgXk0Hg?=
 =?iso-8859-1?Q?bPkK9Cl/fY5VkDKn978a3bmGWuuf8FGI0fJVMha+sv4VFCPCc1CtWJdhH2?=
 =?iso-8859-1?Q?Di5T7MPUj0JgNy8Ir9Cm6DLT7tmvtu2Bkpq6VHuMqEBROlanEPNfH0F2Tu?=
 =?iso-8859-1?Q?DU9Dyeq3wJNqaSIk6rA0dZ4UeYoHjHQ0IrrWb1LWV3Tef8CpTpRKLeKbWf?=
 =?iso-8859-1?Q?bv447rRUYukVForJKC6YUr9j9vYriKM6wfVvkyIlgn6UK7hagb06m5GBiC?=
 =?iso-8859-1?Q?nRE0kgkJ/7SONYUG9RvzRfQwWmxGibdslERiEjspne2i9eAL1pPLkVCS93?=
 =?iso-8859-1?Q?abkm2hAw0Cxoe3DXa5DiwHeMV8ZLj9PTYSSWzEccW5Wo0dJ6ovp8KT7tst?=
 =?iso-8859-1?Q?RVSrzua99RR1tCFkZrs1yjHVoPPHiM0DAGBis1vAfQKgYf6NsLqLBfceNH?=
 =?iso-8859-1?Q?dlikXfn+7fmX2Rxo6EeIWL3IR42pZYMFjsmi25TT8nQCcQ+GNo3tg5754A?=
 =?iso-8859-1?Q?wIDzZYNBIp5cwyl6KcCFXg387NcA3waowkAiaca1DsstRxFScHUtNe+LVs?=
 =?iso-8859-1?Q?9LPA7KOI+0Y2RX2z0xjzVbFl+0VAbK0vRTncPy8SP8g377s/X3CaxJKqu9?=
 =?iso-8859-1?Q?bxlKzYXBvSt1ezykqOJ6UeAKkTOfa2MVGC6uJ6Ct5mkiQ9qIjdq9kxVcCS?=
 =?iso-8859-1?Q?RQuPQ1lOY/hW8YCmEhBp+QOcycKHRMubDxXBo4DByhOD3AJ+hX4uWOXn+4?=
 =?iso-8859-1?Q?zATeevZl3dkdRpHJRj8cSNrrd+FCitovMOtzpnM/uzWEppAqFB8pbdURJw?=
 =?iso-8859-1?Q?BKVDjjZHCTtAsK5VTvo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81812e15-af2a-449a-c73b-08de338c785a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 23:25:54.2524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0H8pYhG7mqo909evKdsPENoVIGImguFsWFn4vXWJwFmSVNvvivfv5d2nuTuNa0A39b139Y1FG+Sn4b2ET+qrD9cNQ+hYHP7uuXwy91Zwba1Uk0UJqiVk3rtSaUdodeYo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4947
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

On Thu, Dec 04, 2025 at 12:59:09PM -0800, Summers, Stuart wrote:
>On Thu, 2025-11-20 at 19:57 -0800, Niranjana Vishwanathapura wrote:
>> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
>>
>> Test multiq functionality with fault mode. Adding a flag check for
>> xe_vm_create for fault mode test cases.
>>
>> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  tests/intel/xe_exec_multi_queue.c | 21 ++++++++++++++++++++-
>>  1 file changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c
>> b/tests/intel/xe_exec_multi_queue.c
>> index aa86f8a38..da8117d57 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -31,6 +31,7 @@
>>  #define PREEMPT_MODE           (0x1 << 3)
>>  #define DYN_PRIORITY           (0x1 << 4)
>>  #define INVALIDATE             (0x1 << 5)
>> +#define FAULT_MODE             (0x1 << 6)
>>  
>>  #define MAX_INSTANCE 9
>>  
>> @@ -244,7 +245,12 @@ test_preempt_mode(int fd, struct
>> drm_xe_engine_class_instance *eci, int num_plac
>>                 fd = drm_open_driver(DRIVER_XE);
>>  
>>         igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>> -       vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> +       if (flags & FAULT_MODE)
>> +               vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>> +                                 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>
>Does it make sense to test only fault mode (separately from only LR and
>LR+FAULT) if we eventually plan to drop the LR mode support? We have
>this case covered in other tests as well.
>

FAULT mode is only supported along with LR mode. So, FAULT only mode is
supported. LR only mode is supported, but KEEP_ACTIVE flag is not supported
in that mode. So, I think we are good here.

Niranjana

>Thanks,
>Stuart
>
>> 0);
>> +       else
>> +               vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE,
>> 0);
>> +
>>         bo_size = xe_bb_size(fd, sizeof(*data) * n_execs);
>>  
>>         if (flags & USERPTR) {
>> @@ -583,6 +589,12 @@ test_legacy_mode(int fd, struct
>> drm_xe_engine_class_instance *eci, int num_place
>>   * @preempt-mode-priority:                     preempt-mode priority
>>   * @preempt-mode-close-fd:                     preempt-mode close fd
>> without destroying exec queues
>>   * @preempt-mode-dyn-priority:                 preempt-mode dynamic
>> priority
>> + * @preempt-mode-fault-basic:                  preempt-mode-fault-
>> mode basic
>> + * @preempt-mode-fault-userptr:                        preempt-mode-
>> fault-mode userptr
>> + * @preempt-mode-fault-userptr-invalidate:     preempt-mode-fault-
>> mode userptr invalidate
>> + * @preempt-mode-fault-priority:               preempt-mode-fault-
>> mode priority
>> + * @preempt-mode-fault-close-fd:               preempt-mode-fault-
>> mode close fd
>> + * @preempt-mode-fault-dyn-priority:           preempt-mode-fault-
>> mode dynamic priority
>>   */
>>  static void
>>  test_exec(int fd, struct drm_xe_engine_class_instance *eci, int
>> num_placement,
>> @@ -637,6 +649,13 @@ igt_main
>>                 { "preempt-mode-priority", PREEMPT_MODE | PRIORITY },
>>                 { "preempt-mode-close-fd", PREEMPT_MODE | CLOSE_FD },
>>                 { "preempt-mode-dyn-priority", PREEMPT_MODE |
>> DYN_PRIORITY },
>> +               { "preempt-mode-fault-basic", PREEMPT_MODE |
>> FAULT_MODE },
>> +               { "preempt-mode-fault-userptr", PREEMPT_MODE |
>> FAULT_MODE | USERPTR },
>> +               { "preempt-mode-fault-userptr-invalidate",
>> PREEMPT_MODE | FAULT_MODE |
>> +                       USERPTR | INVALIDATE },
>> +               { "preempt-mode-fault-priority", PREEMPT_MODE |
>> FAULT_MODE | PRIORITY },
>> +               { "preempt-mode-fault-close-fd", PREEMPT_MODE |
>> FAULT_MODE | CLOSE_FD },
>> +               { "preempt-mode-fault-dyn-priority", PREEMPT_MODE |
>> FAULT_MODE | DYN_PRIORITY },
>>                 { NULL },
>>         };
>>         int fd, gt, class;
>
