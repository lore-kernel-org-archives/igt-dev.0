Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3755CFF886F
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 04:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01DE10E417;
	Thu, 30 Apr 2026 04:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVK2YQH8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E3810E08B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 04:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777521868; x=1809057868;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TpTfWQGq1ou9oX0VxlFsAvzdhRC6VUrQE1huBr/Bk5Y=;
 b=XVK2YQH8OZCSEUm8/lbSXXv4tEZY28Z/BJucs0mNqBkpTwoG55HXMQvc
 tNgspNmXPXiTMHiuqGdIP9pIFwA9Y6kcP+Hbk1bTxrWFjJJbjC1gI51ee
 Dll64P4OmZQs4KF6Gs9B0lOuWRRHBAL9NCS+4FOnjXTATzsWHBH2PT0D1
 rpfI3vwahx/ra+0NuCqui0gRNkVUP3JuXJVdpKm5DB9wC8xFzPW+CpyZC
 naKFhKye2YQY4+SaXYnMIViI/u/sy+RC5RYMT7UQFmlodUL6R+WuHBnn/
 wAG7Ofuyfs713Hm7Slk99dwvY/e8gUpnTFhnb6t7yb97JT/X//unW4Yxz g==;
X-CSE-ConnectionGUID: hyVeGPSNTJ2hTUGyl4lULQ==
X-CSE-MsgGUID: Pzr/WIB3SCC5UW4lS7GNNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78382186"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78382186"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:04:28 -0700
X-CSE-ConnectionGUID: wd+Qa+yaRUqAaFlAa1/4TQ==
X-CSE-MsgGUID: lPfBHw8eRFOykfIWP9sPbQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:04:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:04:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 21:04:27 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcYm81AZH094EJJhULMWCemJZ4ymWkQNmwKjLpIU6FYs3Q/+wIzy0NEG0rXqqlYh6d9TrcsmbwHRTnBvnkttcqf82E6egV0QI7kbq1JvfTOWVWbGdrXLPESVzbcKwIK2Hd09zvZmQImvgmb8qeghfO6ltFn+jOOTO0Il1HbxIkI2W4pbScRuUjJmepf8xc5eVDYAi+8zaWRZeHzEkZ+DM/rWXYAQA5y/OhMCl6RBjOXTEUmtdf7iN3VfFXcSWGC+V9F3GlnchZBtCUVbGofMB7Aro+e83ULUipYBHiiI9e97Uz33aahtr9hOrbOyQPudQ5OHR7TiHIi2siMzyTp++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWR4fI+HV9dKHSUwMLMSSaqIpopp/9aqnxMjxrq8MxY=;
 b=jhpYxGUhRO2F9SCI8x9Q22oFADCnUBS2yn6+B6WsZMSwCsIzgKGKZvgTHNvfvhRxFx1E7iWAG+Hc5jXB0JXkg0kTxz94anTjNOUgTFaUFruYX5ayAFAbq2qd8LRrwEdiVRrSM8C8WQhOtOZ9V9hkDY5Pi4WjB3HxX2ZPocCmcwJbVKnlCHla7ZpGl/wbsl96rTEm+CrT/NEabKKi4xVGWxGkrwr3he55LZ0OK1xOPz6+zoC5KeBmYWGqoKhkmqA7qVlJZ8ZpUa7lNmiqDXiJwvvmsH9k+uCfvHujDre0aW5AvpMQwrtXUO9mdqZFqQhzeKDWRFRjDFC2KLXSe8c6Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH7PR11MB6722.namprd11.prod.outlook.com (2603:10b6:510:1ae::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 04:04:19 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 04:04:19 +0000
Date: Wed, 29 Apr 2026 21:04:16 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] tests/intel/xe_exec_multi_queue: use timestamp to
 check job start
Message-ID: <afLUwHbEVkprM2wK@nvishwa1-desk>
References: <20260429020856.1857656-4-niranjana.vishwanathapura@intel.com>
 <20260429020856.1857656-5-niranjana.vishwanathapura@intel.com>
 <ac12c5478231abf50662c7e1f4451e58c8742330.camel@intel.com>
 <892f9f15894a881e8cf98fc9c12d2cc061314919.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <892f9f15894a881e8cf98fc9c12d2cc061314919.camel@intel.com>
X-ClientProxiedBy: BY5PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::28) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH7PR11MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b18cda-af10-4801-9471-08dea66d8d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: PF1F/lxlhjvRKkkzNSuCqU8Su1xPQCe6HGn55TOLmU9g97kxgrNkBbNcB5H1gnMjDcml/6cZAfjfJMMdqvReHiBN1eTnHXH186O1+GYWe6Gs7V5LkO9yZcVNjjWOv3I9YQUl8jAJdFNFuNo4TsICh7J/x/JhYR4CVO5gUKMGS9QZxE2f9Cz0WDQfffugPFCHet/Y9nPBEkxW1ORBt+MwhjP8bvjv8pHuVQ1Zmb2RP+jSvbUlOisAKCqfVukvmWXu7e4j5XX5exHdaSYtfoOlQ84v4BfH+mKzxmQrWjZsKHP+5mRSdKvz98Cv9qVsrGRBQxKw6av5KypkyX0CGhJKD3c7E7MXkhaY+1hrd774Mi/Y0WQvHUKLQzRbgfePJXmtAfOtvokCpzj3f6V61NSrmnczKhuo+vtvjIMsGDJeooQYhliK0xcmL1eSzY35kDkCZYEE+tAOtWHgksiuTiEyRZ2P88BjW3aiUobweP/RoaX1yZjZojdnTj3Fqhhk/xJRmnZ2wEbzugeiut7A61fr2MNMWPEqtu076R05dD4oQq5exTPtSUmJha8HC5ArT+QGa0ss2XF6Pq3fycNsSppyEdfIeVuLObNLHlmftPI+1BWm/iQmGKEyTzpNtmpjw/Ze0Y4BY/okFnEgyzSbiMVRMWxSTpGg+wP/id+I3W/vAdsbE9t6hs91HDmf3gRoYFEzFX/+T5kNezVGsoFOgMT+VY/29bPPgdZQEAD72CQCBic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6ZyGUypzXz1eOFzd2Km9pvZcQ8EhNtoQQdnP2rOICW2Ck6ipk3FGPzNWMm?=
 =?iso-8859-1?Q?hdWyUH4CA4zYX13726wE51VNAYQdzZNyi3jEsZ9hwlQYCu8cqTPJWCrtiL?=
 =?iso-8859-1?Q?Pegn2DNCSGIR95Q2rYNPnhTn3/L4R73EfIMVwQmvYI4TXwyUuBMVXqiPuD?=
 =?iso-8859-1?Q?wT5uWgXhVOblRUYfy16YdZtFmZPVEu24rBn/SMP5Cbv8ltE0GgYEhhc8rc?=
 =?iso-8859-1?Q?WyPp/3T8WDUqEpmxEbdDsd+nVS/Utsvesx0VaFtWh5DB1bmi9RUDx1PVvO?=
 =?iso-8859-1?Q?CScqz0WnBCakWw16Rm+yqnzuSaSVfnv3OX3g4wv7q3+otmXKH/adVezV2P?=
 =?iso-8859-1?Q?y6ppHS1PSconanN+c4fd863ZQdiTsah5rP65Kk5vEnInIRKX9VIMQpQdcd?=
 =?iso-8859-1?Q?7BN6vBgWNfGiItfNvZjCXUP4kaQz2pv6FsxySWSqmM+de+xiDJTLf1uwKE?=
 =?iso-8859-1?Q?g4t8mAEZ/5OsKSDe/3/LGj2e6h3WXUoOPGKKlSBSmXBSx8pjT+y556c1nF?=
 =?iso-8859-1?Q?sgldrGJk7gkAQfBtAs4gmfTyWMStsC+RTjF0V0LXFZRFNQAtIA3vJMh1tg?=
 =?iso-8859-1?Q?HB/10/oQTARTPrvZ9iaLAAQg5h5OmdxqVfmawyy7ZjH1w4V0Z3YHTr3Hn3?=
 =?iso-8859-1?Q?Py1EBW76NjimnJ5iLYLZ8rJ7yJV+Ap9jDqLxPI2dIlFFNjEvRb55eZP2wa?=
 =?iso-8859-1?Q?okgCiEFGAwx2UscZuYL8iyjsccBfFEqRYfO0E+obBcu3GYNmc4zOYqmVcX?=
 =?iso-8859-1?Q?pesShh0kNz9NefMuWn5z6wK1LWXMnQ2v1eeFHGyR+CVLLaMyGKFHBTDhpi?=
 =?iso-8859-1?Q?EsAUO9s46yVydeYVnUX9GJuAwtLFXZcNrzHk2QG2taz658UZN4sKdYJMnY?=
 =?iso-8859-1?Q?RTxOUsQIb05ytSbb9awb71KB//AiJkGwDw/2vmAZmKrxO9DMS1sKfVuAAi?=
 =?iso-8859-1?Q?/gH4a2zw1D6qnavbSdxFcgyJXLOZjrsVV+pYiyQOaAFVXxu6lfQORGRbOW?=
 =?iso-8859-1?Q?jDFmeFpaJ4mGhXZaBZdW/kY8MW4dath6rnyzgGz7v/vV7u4UCLjumLv+zU?=
 =?iso-8859-1?Q?fnEcFRqDztGMCHtshu2zBMu6A8qmyhcVulpXonSTA7YdYSgo1WBohRZH1J?=
 =?iso-8859-1?Q?HUN6csbqoHPbNR2csKmuVwPbBHRCpK+SFWrxMzNi9ZryKeS3ZRp06pKpeR?=
 =?iso-8859-1?Q?wml6oG64E3rG1Zhiz7GaqlfF3KA+LcARRDz32PXk2/6kmUCbry4FYbcuZq?=
 =?iso-8859-1?Q?QBCJTCb5Mb3YaC2G2Acjlw6fRGaBmEnKHvDnf05ZaBF465t9Nrma1tcjRl?=
 =?iso-8859-1?Q?CNOk5pSsjxwQInksV+VK081C3h9PkasxbMViUZAWARuVw+jSk9S/UjvekJ?=
 =?iso-8859-1?Q?r8rYfPS+N/QXI5HoirJQmZHU5QXYomhraQdumzDstzphS12tjWbCddpY3B?=
 =?iso-8859-1?Q?UHgpXE9Pj5xmHmtriwIU7EzPITuh/1X6yt+UhuHLNSb6vAD3B+dDttR0eh?=
 =?iso-8859-1?Q?468TjVUluPVx9s7pSakNW6M/0wm7a6Xm+bR0NWWJLquAIEAY99wy1hPnHk?=
 =?iso-8859-1?Q?Jhbx1RaIiaLjnVddS2Pq4SXr1ruksMzBDnY2Bo94KbzeZWMfawCQj62lkV?=
 =?iso-8859-1?Q?NTP7HYlkcw7xeeHBz6HRDQBZasv8ydpKUPA6ifKoiOHDKZ/k8Kb8vAlgAe?=
 =?iso-8859-1?Q?vn5NF9LTwPxZhWGUzBsgYcKGQ0Z39bD2jxwQ5/Lmmd/wEeJ8u38bJOQPRo?=
 =?iso-8859-1?Q?UNSJFi3jPoUVzbPemFblePGC3o0DQBK14A5WZGzpeC3gyLaHpTrFCCF0Bu?=
 =?iso-8859-1?Q?0gO+ccrqH15UVFF8aK2B6zQZ+rmteUnrMOcSAMXVoU+8DkFM4PTX?=
X-Exchange-RoutingPolicyChecked: a1A8Lcyj8MTa7DQynHfq2LGFX7Hh0N7shF+e68som3AJ0RswSnqN5VfRu+Gso5hkhORhWznMYs/dYOpopKS7cLOkkOuyHS6unBKBCgqe4DuamS8r0BltsiGF6KdeggE+JcLArAyak404dviiCWRJ9H4LLxprv96/7czwDaHbqojoihF8g+pc41yM93XBPxvtDaNDBRdFYYfYAeDJznmqqfr09gi2BBdsr/cggHFZ7Pgx6A4nlw5TiXxBMUR4rKlsDIHeS6PWC6z2u4npq01g9Fkz2mBClNbZHVRjNPg4JXeV+Q0osFTvQ8JsFYuHsCrJxu4+W1q720mEjbWI3z3C3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b18cda-af10-4801-9471-08dea66d8d85
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 04:04:19.1193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXR28U8L1yZOiUea3fc2Cc7PgDwa/M0GZdc4jaSInuA5EW3ckB2iz72LF2C939lJ7f831AMgK93xSJ/rjHJwhiagkXPT+UkaZMUE92v4apGDP9Ubn068mfOWZwnF5LDn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6722
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

On Wed, Apr 29, 2026 at 12:24:31PM -0700, Summers, Stuart wrote:
>On Wed, 2026-04-29 at 19:18 +0000, Summers, Stuart wrote:
>> On Tue, 2026-04-28 at 19:08 -0700, Niranjana Vishwanathapura wrote:
>> > In __test_priority(), enable write_timestamp in xe_spin_init_opts()
>> > and use timestamp value to determine the queue switch order. This
>> > replaces the indeterminate sleep() with a more deterministic wait
>> > based on the GPU timestamp.
>> >
>> > Pre-set all spinners to preempt-wait before submission so each
>> > queue, once scheduled by HW, blocks at the semaphore. This ensures
>> > all queues are running on HW before testing priority-based
>> > scheduling.
>> >
>> > Assisted-by: GitHub Copilot:claude-sonnet-4.6
>> > Signed-off-by: Niranjana Vishwanathapura
>> > <niranjana.vishwanathapura@intel.com>
>> > ---
>> >  tests/intel/xe_exec_multi_queue.c | 51 ++++++++++++++++++++++-----
>> > --
>> > --
>> >  1 file changed, 37 insertions(+), 14 deletions(-)
>> >
>> > diff --git a/tests/intel/xe_exec_multi_queue.c
>> > b/tests/intel/xe_exec_multi_queue.c
>> > index ca96099d36..382705d065 100644
>> > --- a/tests/intel/xe_exec_multi_queue.c
>> > +++ b/tests/intel/xe_exec_multi_queue.c
>> > @@ -454,25 +454,24 @@ __test_priority(int fd, struct
>> > drm_xe_engine_class_instance *eci,
>> >         for (i = 0; i < num_queues; i++) {
>> >                 uint64_t spin_addr = addr + i * sizeof(struct
>> > xe_spin);
>> >  
>> > -               xe_spin_init_opts(spin[i], .addr = spin_addr,
>> > .multi_queue_switch = true);
>> > +               xe_spin_init_opts(spin[i], .addr = spin_addr,
>> > .multi_queue_switch = true,
>> > +                                 .write_timestamp = true);
>> > +               /*
>> > +                * Pre-set all spinners to preempt-wait so each
>> > queue, once
>> > +                * scheduled, immediately blocks at the
>> > QUEUE_SWITCH_MODE semaphore
>> > +                * after writing its timestamp. The HW switches
>> > between queues at
>> > +                * this point, allowing all of them to schedule
>> > deterministically.
>> > +                */
>> > +               xe_spin_preempt_wait(spin[i]);
>> >                 sync.addr = spin_addr + (char *)&spin[i]->exec_sync
>> > -
>> > (char *)spin[i];
>> >                 exec.exec_queue_id = exec_queues[i];
>> >                 exec.address = spin_addr;
>> >                 xe_exec(fd, &exec);
>> > -
>> > -               /* Wait for job on Q0 to start, other queues block
>> > behind Q0 */
>> > -               if (!i)
>> > -                       xe_spin_wait_started(spin[i]);
>> >         }
>> >  
>> > -       sleep(sleep_duration);
>> > -
>> > -       /*
>> > -        * Expect the job on other queue to not get scheduled while
>> > the spinner
>> > -        * on q0 is not waiting on preempt condition.
>> > -        */
>> > -       for (i = 1; i < num_queues; i++)
>> > -               igt_assert(!xe_spin_started(spin[i]));
>> > +       /* Wait for all queues to start */
>> > +       for (i = 0; i < num_queues; i++)
>> > +               xe_spin_wait_started(spin[i]);
>>
>> So I see in the spinner batch that the c0ffee value is written before
>> the timestamp... should we change that order in the batch to account
>> for this scenario? And should we have a check before we go into the
>> for
>> loop to clear the timestamp below that all of the timestamps are non-
>> zero first?
>>
>> I'm wondering if we can hit some race condition where we mark
>> everything as started, but some of the queues (well.. at least one of
>> hte queues) hasn't actually hit the semaphore wait yet.
>>
>> That's the only issue I see here really, everything else looks ok to
>> me. And maybe I'm just being paranoid about the case above, just
>> trying
>> to see where we could have some hole here if things are running
>> sufficiently slow for some reason.
>

I understand your concern that GPU job might have started, and have
written to start_addr, but not updated the timestamp yet by the time
we allow switching to happen down below. But I am not sure if that
happening is a real concern here as GPU runs much faster than the
test here.

But I will change the code to read the timestamp until it is non-zero
here instead of xe_spin_wait_started(). That will ensure job has run
past writing the timestamp before waiting on semaphore. Claude generated
code like that to begin with but I changed it to use xe_spin_wait_started()
thinking it will be less confusing for the reader.

>And it could also be, of course, that the timestamp gets written but
>the semaphore wait hasn't been seen yet... so maybe in addition to the
>non-zero check, we should make sure it increments at least once
>somehow?

That should be fine as we clear the timestamp below and ensure Q0
is running before we allow queue-switch to happen. That ensures all
queues are waiting on the semaphore at that point. All we need is to
ensure Q0 is running and timestamp of all queues are cleared.

Niranjana

>
>-Stuart
>
>>
>> Thanks,
>> Stuart
>>
>> >  
>> >         if (flags & DYN_PRIORITY) {
>> >                 /* Assign increasing order of priority for
>> > secondary
>> > queues */
>> > @@ -485,6 +484,30 @@ __test_priority(int fd, struct
>> > drm_xe_engine_class_instance *eci,
>> >                 sleep(sleep_duration);
>> >         }
>> >  
>> > +       /*
>> > +        * Clear timestamps and release all queues from the
>> > semaphore
>> > wait.
>> > +        * The order in which they next write a timestamp reveals
>> > the
>> > +        * priority-based scheduling order.
>> > +        */
>> > +       for (i = 0; i < num_queues; i++) {
>> > +               WRITE_ONCE(spin[i]->timestamp, 0);
>> > +               xe_spin_preempt_nowait(spin[i]);
>> > +
>> > +               /*
>> > +                * For Q0, wait until it is running again to ensure
>> > it holds the engine
>> > +                * when priority arbitration is triggered.
>> > +                */
>> > +               if (!i)
>> > +                       while (!READ_ONCE(spin[i]->timestamp));
>> > +       }
>> > +
>> > +       /*
>> > +        * Verify that secondary queues have not been scheduled
>> > while
>> > Q0
>> > +        * holds the engine.
>> > +        */
>> > +       for (i = 1; i < num_queues; i++)
>> > +               igt_assert(!READ_ONCE(spin[i]->timestamp));
>> > +
>> >         /*
>> >          * Trigger a queue switch by making the spinner on q0 to
>> > wait
>> > on preempt
>> >          * condition, allowing job on q1 to get scheduled and
>> > finish.
>> > When we end
>> > @@ -501,7 +524,7 @@ __test_priority(int fd, struct
>> > drm_xe_engine_class_instance *eci,
>> >         i = 1;
>> >         while (i < num_queues) {
>> >                 for (j = 1; j < num_queues; j++) {
>> > -                       if (xe_spin_started(spin[j]) &&
>> > ((already_in_order & (1 << j)) == 0)) {
>> > +                       if (READ_ONCE(spin[j]->timestamp) &&
>> > ((already_in_order & (1 << j)) == 0)) {
>> >                                 start_order[i] = j;
>> >                                 xe_spin_end(spin[j]);
>> >                                 xe_wait_ufence(fd, &spin[j]-
>> > > exec_sync, USER_FENCE_VALUE,
>>
>
