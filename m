Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8F1CD3442
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 20:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4DB10F209;
	Thu,  7 May 2026 20:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCjxDkSU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642AF10F209
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 20:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778184682; x=1809720682;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=reXQhF4vO3C+aOmhK1MmkYgbt3riTXHe3/xJZ9g6ac0=;
 b=mCjxDkSU05szfRmN3hkooHGKV15Ed2qijePG6K+wG+KF5oDkVUiUIieu
 px9WAzsg13wU81mjvD423u3E6zj2V8M1eo+Tjjpw0Z1I2V4sjACqj3b5X
 HZ6jGrtE3TUsnFXAV0LWY05nN2EnjeG4vXsTwrdN2U7s2nPxj1khspiqY
 qCCmuNFwfq+jAL+HyujkaVZsUMq2hbrK/R9eHVAslSGFxmbXfNydn7G2E
 hfF4Rp9UIooVfZSvBLEmA4CQXZco33dP8ZcznzV2qpum+TruncrHKxFJJ
 qnzbUddQDr275Vvm5bdOJbsbNke4tntqea4gNcdDqD26qUnkdM6Yo+FQa A==;
X-CSE-ConnectionGUID: YDO1HIoPQY6oNIc6W2Nd1w==
X-CSE-MsgGUID: u0O+iWviShW4f+mQ9GpdDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78171631"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="78171631"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 13:11:21 -0700
X-CSE-ConnectionGUID: FNC8WQqVQIWpKfEpin7XQg==
X-CSE-MsgGUID: pRfLsaJnThC/15Owb8rdTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="260275532"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 13:11:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 13:11:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 13:11:20 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 13:11:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJe2kKaviWRPz8IFXcNPRwxVi/4jkyAC/1yTDPeP/QhxLl4ziucwWMYK/5tEQnlQcud+ygPhISIpB9AgCPEtmawRRq/uPsn0hLhhhIip63C7ew9e6x5Bp8HQUWcxacDRp33K1cj/0FoQolhsuZZdnjdVdmL75nZ/abPy+gJe+SFXqjKQcQDBG2mCFlVY/bpw/xCzUfh7TB0pyvaidCyit1QK+pLn8fYaE4mqY8BL3ADJIR5Jjw35r4RbyG1HvSVvaDEnghmyWBdJNnehTevVijYQYvxm1dg0skwfNs7A1sA4o0dl5WIP1KvpoXlDQhb7Fxf1wcYa4W3hXxfqe8ejxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dwr+OC5w1IJyoHLEKwlnESW/XlVqRiGIXKSA3pR84zo=;
 b=VNoQDHOa5zuYymraFMs+WOP5BWOkJfmo7qDPLI7EPc/yAa/DD7EfzJAKEXNDGvEdlh+fp54SVE9QpbIa2lhmeJ9N9i3ToY0OoRtQ59FnHHttXE+eEiEhRK2PL8XJCfKZhIDypggwgo1+TAsvfOb+AXRZM9jCg23s+3VmV9zAKXHxp783in6EFsiUPesA0yjNSxR4RC77tuJJyfYTQlZqJJbgQ7MWzuwuxoyy0Pbvl8pSprRDE6eeugHR/jYKKuk8vISdjkfe6AT0ua7hH4qrFHeWRkVM9ePyP0uhPtwQaNLnxsOIWJZILzmYdz59GSCo1PClx3OnGtICMAVgWKfpDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 20:11:17 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 20:11:16 +0000
Date: Thu, 7 May 2026 13:11:13 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] lib/xe/xe_spin: Enhance multi-queue switch option
Message-ID: <afzx4crzetVT4YnA@nvishwa1-desk>
References: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
 <20260506183137.51479-6-niranjana.vishwanathapura@intel.com>
 <9575266a54ec7fbce26b586c4c70f70750ea9d83.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9575266a54ec7fbce26b586c4c70f70750ea9d83.camel@intel.com>
X-ClientProxiedBy: BYAPR21CA0001.namprd21.prod.outlook.com
 (2603:10b6:a03:114::11) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH7PR11MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc9eafa-df62-44df-9373-08deac74cb81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cPyxHKEMp9mEyPivAXq499Ej/qZ12uButL8PF7DYpwIQHvoOhd6kDl8FmideTMqFeubz8bTARru34oWlcXlvMCANFeYpcpUV1UXwOnHzgibkVeWqt3kod5U92ruTrw3z00RU7Cv8DMywH6ps/csfZA6kyzN0e98rUe7YlefCLus/96FwFkqDWKqC0YmDtutMhRyIih5iRd0ICoq91Nasj1Ax5lQj3R2ZSiSy6jnkNuYgEj0ryrvSTphymDdfuwZ3jD0IJTnIIvk2iKGQSBpO101t1EWq69cie2K5PfPexHgfxCbtIH523Sj3N2ITCy9/sWeacFsCBGPsYOs1gjBXSlhw1TJbYxYMEhlx4iyMO9NZG2MVqGxuPdYfWGE3PFwE6QQGwdDU+5+MW+ksQrHaHM8xTiRZVrZf6YJIDJ1SU0lTum3Nhydu3wt3NnfwavB2zEIibp/V8hs52tHHk4yIDzi0avfmTaZqCdqrqM1bmE7DV1S4N8qACNB4yZCvknlbWRu123qmbPPDw+rzMuAPZWe1fTRLMSsPaf4Lg8oty5trsWVdeFsti442foVaxw/jQ07ZtvNqSkvmAa7BHY5JJz4J4tX3IQbmIB/Ae3UBNHvGhsPXpie6c4CwVVHnKut7qKy/fZreWwDNX3vteDjirRj2X8ixDJZThCAUcQh8okBSFatxaNIvRr/PHtv+aKuu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(3023799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pUmOVVLs6005rt0yIpLcuVqQ4aDFC9gQ0L/vvXSiTMB6yBA0ibYdvPYo/c?=
 =?iso-8859-1?Q?lATWxtr2YwC8jE4GPGKN2nLFi/xwXCR9roag/UN3OF4QcjoHDXABy8zD/F?=
 =?iso-8859-1?Q?8wW0E6QjfAxhpWI5JNAabDIvySOldupzBTKhodBtlvZWjzY69aGtcJdJFs?=
 =?iso-8859-1?Q?RDbLfbp+n12GdBgKQkik6SJLIs9iV494QoqR++lptmGOkCqtzoj19V1Nlx?=
 =?iso-8859-1?Q?56cm3aYKuPQfKrN0DCut+1Hrj4qmmTkXPLgkQpbNFD0SbcM1b6ZISEaw4v?=
 =?iso-8859-1?Q?TWx3km0TfHIdz4PJ5NuvMxHcuCkXx3nEcNCGU2xZnFJDKBjAxijVZPXha+?=
 =?iso-8859-1?Q?C+rkXIW7OrhJWhJi5fYuYI5Sebq1uuRVgEH3m4muLMtxbOExVyC2E1r0/u?=
 =?iso-8859-1?Q?Axca6PwPFYJuyvhTXf3cmTVSm0+wn2j/aEHwQB7WVS42gcKuJ6lEXvxBKV?=
 =?iso-8859-1?Q?YL6GFYTnKsDxtc6BZMynV/lYa39KTRWwihQcaxUA4HcDP/KMaTUoM0mpl7?=
 =?iso-8859-1?Q?wX7Vf8K0gej8YlH/Sc7fTklzg23Rfu5VvnhnTp0zUQva/OFPgPnOfiSaqP?=
 =?iso-8859-1?Q?LcN5Q9GMr8hktsMEBt7NGUwv4t+uIDEG9QlJmwjD2kpa/vaymAq/Md514E?=
 =?iso-8859-1?Q?nVelbg41fZkSZ8iOj6COYKNLhoXzxkazZkJT66257ITLESr5dAqv2B6Foi?=
 =?iso-8859-1?Q?A/FU2OcKklD7rCQOkGuflL02yJfXs2z0B+G/Zh60boWxExZDZv0+aPreP8?=
 =?iso-8859-1?Q?kX4O6DXX4DtU5FVc3LBED9HJRcXYYKnYO9i30/iIdHsFmqI5hEH3ImjEls?=
 =?iso-8859-1?Q?GnaQRxSy04RBLWVgX0nFc20daQKBl/AFol+n32gId+pn3jlCOeW3lBqIi6?=
 =?iso-8859-1?Q?MojZ9bweE7ig+ZWI5YCwoIjhGzOVHc+N1ZvsJTX6WsB+ND2/sxVnh44CoP?=
 =?iso-8859-1?Q?KsOg+BYo+V3SiVQB/qx0Gtq8SRcar+V7X+vCOEooaJc/ErRhnyKMgS3PX2?=
 =?iso-8859-1?Q?HayeKW36OidOEScvm8FAt+7Qky4le4saPBLNge1asiFgLwyuUeDdxjkjTq?=
 =?iso-8859-1?Q?HleSnD+Ofu8QcIQohpyOCJL3tGy7rAADI9Ike/3kbmep2K7DYxtSmwC3nW?=
 =?iso-8859-1?Q?xEprKeCbb6CjU4cArVUDXELsIu5VmSsgOz/PvFLh8kEihaK9zt3ktg+UHa?=
 =?iso-8859-1?Q?NCnR5EPdJwZaTtM5btlY13EO+6dtaLuLjcEjE2aHeMnJj1aTQ3dGO3EMJv?=
 =?iso-8859-1?Q?4I2vWhPHqefuJqOZ7b+d+Icho6DHrH/WUiLXa0J1q1D3k7GQi8LNUx0EMV?=
 =?iso-8859-1?Q?Jgv6iNfFRbKKcZ/Nmmlr6bfeZ+ZjRO2GM+9yp4ug8k6baPLtdU5NGjAkDz?=
 =?iso-8859-1?Q?pghkZD9Lt0CapEMyjRcd7TmK6LUJ654uwcFCaurVuONSRGn9GCcnvPt2HX?=
 =?iso-8859-1?Q?zMcvhvzE2zPoudBpMT091xRz3uhfZFDqnjkij7vIhhxyhz73JtOvO+7Y9H?=
 =?iso-8859-1?Q?tZWm8MhbxJPmoU2/BxHjp+QPfsqFDDjhar/s9/AEVrZKJoO6/MuNI1iSU9?=
 =?iso-8859-1?Q?hQhG0y5JM0DMghFBraxHqvVE4qsp/R49vdgMidmthH2XVa1apSNS1eV6e8?=
 =?iso-8859-1?Q?FGD5yshkil3455x7m6jTk5gpMDzHxZU/jTVRWvnGN+UyMpdZ+0hNDOW0PF?=
 =?iso-8859-1?Q?b+dnsKxJAEt9s6267a+PfXf2g9xtMJgrEhgKXlL5p+54ccy1rpjhq9j522?=
 =?iso-8859-1?Q?gRyU/YMCjjema9Vs+7UDQzACjECoLoWRD4Pjt6EF4eZlUWtpOB8ghHORzc?=
 =?iso-8859-1?Q?cnRoKY4slIO/wJLIk/PyJmRjh9xOltLzWSoNN05eqG8t9fekj0n3?=
X-Exchange-RoutingPolicyChecked: WhtvxIgdS14LPcn5NfkRK48iXk9HD1mrYm3Kn5Ma3gBuVGGL+LHpELJK6Drg7bBL/xUVzRcxRkXVXv4GxvLhNraWRSpWQtz23Kh3fFIBhSU8dZj0NLgYutm+d7hkPw6vx9gcbI+jHccyOoB/drv7VtF8aA/cG5h8Zwj5z8WvfUFcP6zX8lsYyDzno46xA8z0soW8S3VIIFH/2KKF2WZGOW/x2ttZ9/hNAYuznAYrJ16LuDqjMozuRk+EvYhMNIN2LZYV6TCnlpE6CMSm+5i0YSdABhBKtv9Iy88irMC4Cv0BnocTL0UfXGThhDQmDJIqr888rpSBgk1wXky3suy7tw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc9eafa-df62-44df-9373-08deac74cb81
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 20:11:16.4654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYOG1PZbQDQUwaPYGYogY/ltiJ2tP4qhk2XAUgWyjsLm7gEd54w2XdpQYkyHQkf/nqnTw4fVhQp+uccwRDG4NlKAkOWhUgoM/QGkf+SArVdkeADPdlYMUBdwG+t0RDxE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7717
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

On Thu, May 07, 2026 at 12:15:10PM -0700, Summers, Stuart wrote:
>On Wed, 2026-05-06 at 11:31 -0700, Niranjana Vishwanathapura wrote:
>> From: gta <gta@DUT4637NVLP.fm.intel.com>
>>
>> Allow user to control whether the multi-queue switch should
>> happen after parsing the MI_SEMAPHORE_WAIT instruction or
>> only if the instruction is unsuccessful in getting the
>> semaphore, thus having to wait.
>>
>> Ensure that in xe_exec_multi_queue@priority test, the multi-queue
>> switch happens only when the spinner has to wait for the semaphore.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  lib/xe/xe_spin.c                  | 13 +++++++------
>>  lib/xe/xe_spin.h                  |  6 +++++-
>>  tests/intel/xe_exec_multi_queue.c |  2 +-
>>  3 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
>> index 4dc110c222..14952ca90e 100644
>> --- a/lib/xe/xe_spin.c
>> +++ b/lib/xe/xe_spin.c
>> @@ -179,14 +179,15 @@ void xe_spin_init(struct xe_spin *spin, struct
>> xe_spin_opts *opts)
>>          * Insert a MI_SEMAPHORE_WAIT_CMD instruction with condition
>> controlled
>>          * by the user which acts as a queue switch point in multi
>> queue mode.
>>          */
>> -       if (opts->multi_queue_switch) {
>> +       if (opts->multi_queue_switch || opts-
>> >multi_queue_switch_on_wait) {
>
>I don't have any problem with the way you're doing this. I can see we
>might want to use this without multi queue though at some point, so it
>might be nice to have the switch_on_wait as an option on top of
>multi_queue_switch - basically rename multi_queue_switch to
>semaphore_wait or something and then add the multi_queue_switch_on_wait
>as an additional option. But that also means we have to keep track of a
>separate parameter in xe_spin_init_opts() and since multi queue is the
>only user right now, it might be overkill.
>

Note that we use the bit MI_SEMAPHORE_QUEUE_SWITCH_MODE to indicate
whether multi-queue switch should happen on wait or after parsing
the command. It is a multi-queue specific bit. I don't see if that
option is available for non-multi-queue case. Yah, we can always
revisit if we get that option for non-multi-queue case also.

>Otherwise LGTM. Please apply the author related changes Xin had
>requested before merging:
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>

Sure, Thanks,
Niranjana

>
>>                 uint64_t wait_addr = opts->addr + offsetof(struct
>> xe_spin, wait_cond);
>> +               uint32_t sema_cmd = MI_SEMAPHORE_WAIT_CMD |
>> MI_SEMAPHORE_POLL |
>> +                                   MI_SEMAPHORE_SAD_EQ_SDD | 3;
>>  
>> -               spin->batch[b++] = MI_SEMAPHORE_WAIT_CMD |
>> -                               MI_SEMAPHORE_POLL |
>> -                               MI_SEMAPHORE_QUEUE_SWITCH_MODE |
>> -                               MI_SEMAPHORE_SAD_EQ_SDD |
>> -                               3;
>> +               if (opts->multi_queue_switch_on_wait)
>> +                       sema_cmd |= MI_SEMAPHORE_QUEUE_SWITCH_MODE;
>> +
>> +               spin->batch[b++] = sema_cmd;
>>                 spin->batch[b++] = 0;
>>                 spin->batch[b++] = wait_addr;
>>                 spin->batch[b++] = wait_addr >> 32;
>> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
>> index 31154997b9..db0febd8ab 100644
>> --- a/lib/xe/xe_spin.h
>> +++ b/lib/xe/xe_spin.h
>> @@ -46,7 +46,10 @@ struct xe_spin_mem_copy {
>>   * struct xe_spin_opts
>>   * @addr: offset of spinner within vm
>>   * @preempt: allow spinner to be preempted or not
>> - * @multi_queue_switch: Add a multi-queue switch point
>> + * @multi_queue_switch: Add a SEMAPHORE_WAIT multi-queue switch
>> point
>> + * and have the queue switch happen after command is parsed.
>> + * @multi_queue_switch_on_wait: Add a SEMAPHORE_WAIT multi-queue
>> switch point
>> + * and have the queue switch only happen if waiting on the
>> semaphore.
>>   * @ctx_ticks: number of ticks after which spinner is stopped,
>> applied if > 0
>>   * @mem_copy: container of objects used for memory copy (optional)
>>   *
>> @@ -56,6 +59,7 @@ struct xe_spin_opts {
>>         uint64_t addr;
>>         bool preempt;
>>         bool multi_queue_switch;
>> +       bool multi_queue_switch_on_wait;
>>         uint32_t ctx_ticks;
>>         bool write_timestamp;
>>         struct xe_spin_mem_copy *mem_copy;
>> diff --git a/tests/intel/xe_exec_multi_queue.c
>> b/tests/intel/xe_exec_multi_queue.c
>> index 0479554bb6..6f90c3e4e8 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -459,7 +459,7 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>         for (i = 0; i < num_queues; i++) {
>>                 uint64_t spin_addr = addr + i * sizeof(struct
>> xe_spin);
>>  
>> -               xe_spin_init_opts(spin[i], .addr = spin_addr,
>> .multi_queue_switch = true,
>> +               xe_spin_init_opts(spin[i], .addr = spin_addr,
>> .multi_queue_switch_on_wait = true,
>>                                   .write_timestamp = true);
>>                 /*
>>                  * Pre-set all spinners to preempt-wait so each
>> queue, once
>
