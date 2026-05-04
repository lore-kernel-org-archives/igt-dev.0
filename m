Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05983FF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 23:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5B410E8A0;
	Mon,  4 May 2026 23:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fa7Kj//T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052F310E8A0
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 23:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777935841; x=1809471841;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wt8CVuAl0Rj4CwRdz1eJFjOyWhj96x1pk8DjZkpZ04o=;
 b=fa7Kj//T0yIvOB11SjvTSxr7vykXnw0ntG1624sMh/ACXnry4AEPtCgD
 9KSvGY+EV7e99hT4wMutJOIQSV4o0OsYulhhAiO931lMbh6Y/kz8wq+Kg
 0cNu5IexvWfaV/tRDZiU1Epmug8qk9G7jCIdcbE0YFNrnI9sNoDUS/Pv/
 x+K/7YGD4o4ny4pga4+0IEO/W19C6WanASCbhZUJ4QppIDUuxSJwfOp0T
 +7l/oIDMy2KP2pDFGuYkI+wNw5QYOiCu16I+m3VZjwS7tPizBUBXjf7Wm
 kMoVw8zrhehZluDVOkPNPrBoO+sZkXF5lfAWQnED+rLOtDI1TVkqftZZo g==;
X-CSE-ConnectionGUID: IIlZbv53R9isT/3eFHIX8Q==
X-CSE-MsgGUID: Phtgo6QyRouyR1PYNitUfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89903962"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="89903962"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:04:00 -0700
X-CSE-ConnectionGUID: yHoIH9GpSt+XzbEEjTj+aA==
X-CSE-MsgGUID: iDswKSSaQ8ekg9xcENnopw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="235514005"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:04:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 16:03:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 16:03:58 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 16:03:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaLA4o6Qy1DF8fcquIA064wYtv/12z/OF3RpyzGTvvLtsOHWNnaO/7HscUpkFj/VKpr7hcuSZADSowNK1Kzm1sTu7cbtbRMdg0fYescJW1u5Tshabco0rPwkLKerOvbJbWSGfRjdBm/r1FzYqnN0CCD39vmUjUnl355oQrLtLKBzyPnw4zYx4aZMBg5BypRB5vWLVf4ZtnN7J9EtqNT8kztOnRFEtyL0amtZ1+YELydkwNjQQ7G7BKuUONd+Fvb0vFjLlUDMOgg1JCm98tVCIgSTj4g0wzYKq3qa62sopxV5CW21iIZkd/uE4Sm/4K3sSB7vVT3OQalHCLHwCdQqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxRYHjtfnE8wpGvw7ZiQRcPd3M3ljpGQ8GCnP5k6Ffs=;
 b=QPom7DO/ge7LhcYYmCGGHYEA+yN4Y8fo0tqDm/rsKZ7GSvBAIDeTGq2J+H1jAU3qlI/OopqNHcuD80svHP+y+xTqTY2mmTAba2672YdkxCwCqQFV4CcbdIfjLivg3kGmjxdilBHov5JZRgEVpMtZJjyj/WW9mkpuYJlwiKfanGLlFBUMsdHqZPVqJZrVjcHMkUy6XpRsXcD93Hx3/zmj0iAtODCMPMbYGm4CSDqAy8q1QMRpdYNAh1iZbzo1rjIoCg/Swcsg62ysmsVtaPpBfqc7+yooiQLKOGxDvvEAO37utldP65WTOFwqzNJQbz69T7L538njupkGdx6UHDBgRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH7PR11MB5914.namprd11.prod.outlook.com (2603:10b6:510:138::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 23:03:54 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 23:03:54 +0000
Date: Mon, 4 May 2026 16:03:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Wang, X"
 <x.wang@intel.com>
Subject: Re: [PATCH v2 1/2] tests/intel/xe_exec_multi_queue: use timestamp to
 check job start
Message-ID: <afkl18esqm3GfxWj@nvishwa1-desk>
References: <20260430041055.1901126-4-niranjana.vishwanathapura@intel.com>
 <20260430041055.1901126-5-niranjana.vishwanathapura@intel.com>
 <8f815c90d00b9c7f775725a911b78f088f4a24f1.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f815c90d00b9c7f775725a911b78f088f4a24f1.camel@intel.com>
X-ClientProxiedBy: BYAPR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::49) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH7PR11MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f2bb06-14a5-45f6-1857-08deaa3169c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: ODGBRZCfj4UOZBwQE0wK/rZDDWoTvh41TxPqyQVVvxwnG+Mt5zlQTjKYK/4W0gMjIh6KlOSCFNdDC/AvtUdo+tZySYZki6UBKrvRnCdrNQn2rO0qEm5oRdvUiSEXttYmkKpkSB9Ptd9YpQe2fLz9+4rZfIgVmTuB73c7F5rBUiyH0c/9QiSDLOBYIBCqk+f+BP3Zeph57VK3mpISm16oEVwsOFw8qiro406RSKxysPEz7s+r6CUk+bQQlPPdSb/Tyuojl7BApBo8BG7OxeUyKfs+1RyUx97dhvtFS1KWQMog0M3pdPh+SY18bFgk5qXGY6Pm6E7sdyn6+hgoZORY41gACTIO8KCcDy+BHfMaZfIHzfLukBTtaDWO2tR6rQhesANELZzdpUDlOCnpztHUZZzi8OjHhX7OMa0DfUoCPiVQMf+GJdz5hEw3hWWWRlKz0t530d7Lif3u0O/hJrBaE/X3Oj2o/sw/9afRH/YU34h6Z7v9fRrCcbJeTxhew51bp0gX7o5avkar1idBeOtbSutaZZ+wskXBvfSRf7SFtTZ5DXFMVToyU5i/YQQW23Yg48CkSsgJbSdmk1pXK7kfKQEzZOXni7SEoByFr81yezvZdf43EKfTsAKX5nNtXjeCns5mDT5Npztru6X2ISLOTuDvqVXbuWMjqSSyxRYSFl/rEqpshIEtgBfcvcc6uiuI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bjVvc49ld0tcenuvsunSdJV9jd5DuCGyKiN0jIVEnQr6CwxKQOiz4TTYAy?=
 =?iso-8859-1?Q?0jakZ+0J9y6+AiuxJAYGxs7wFy1fbuA7Zbr69WXKOagjoGf5/RSl8A1xP9?=
 =?iso-8859-1?Q?WBZ+JtA0rOW+Vf2Zqv7kgVsnoyMYW5CgjxUUIjx41xuOZMhOuCyXkRNZfi?=
 =?iso-8859-1?Q?MGNzgAifRPxmtkhTdisf5L4UvHO60edCgsR2qo4Ll/aJ6wibA7AYE1q1G7?=
 =?iso-8859-1?Q?Lv4UqwRU8IaROfAtqyX7uP2NDXZPBkl+TrlWdS8y8CWr4JWG+lcGXoMsof?=
 =?iso-8859-1?Q?iAjIC0hq+dQsMY/ULPcFDJ8hOXlozojJfS9tY5oKsPwQmL9W8uSFyziBPX?=
 =?iso-8859-1?Q?9mWSOtQjr30oreZH4o86cI8KQuPqYYb/v2SiHH5i/WQTnXkce/AWfX2N61?=
 =?iso-8859-1?Q?PyngUE+pJR7xZB6jfdsWpc1F+oMYrjP/9qFIqDW+cJQJaGbRE+59LBDX8n?=
 =?iso-8859-1?Q?hbFPVSCrc/RITFRUeAiWUxEnAC4UKx+OdRVzyJuWER9s7ZpygMF/XMn9O+?=
 =?iso-8859-1?Q?i/iqSQl/dF66aV9OjWNUcXG65rFDukAkfz+Xrz2704PcCOlx5gdIjDnoMd?=
 =?iso-8859-1?Q?h0ZsaKexKgKgsuv46GLXjCQ0aOxkRGah7CYh2y1yO/hWaPBTdLpY0Q83G0?=
 =?iso-8859-1?Q?Dn7sHeb26M2/949YG3ph3CEfBVfg3DNMW7kNgkFKXcmx31WxU7VvC4BTTM?=
 =?iso-8859-1?Q?FxOHsVaqZTNtq3PC7DMSyWetLdKVVFpoQfEkN/fjRUQ+tawbh5CxqqG0aj?=
 =?iso-8859-1?Q?Sh9WMOdVhrb+2BUZIMkbDZZiMOVzK+O4MMbZ7Zz09wTq/OxJ55NutUw+W4?=
 =?iso-8859-1?Q?I9kO4CPW6owmqODWEqBxPqqzAzB1St3XJURmRcIqRYyxjcNc4Jzae9b3gM?=
 =?iso-8859-1?Q?VSuU7j+pPnDfH5Qs/tjAazxQpRDhHGxDLv/hT60zkJ/FiGdGE8NWedLU6A?=
 =?iso-8859-1?Q?U73qUqyj5tziLZ2R8IQkCRdmWfwtboI+RrSnp4sjhK7GpRH/BJ6Q9FYVFB?=
 =?iso-8859-1?Q?JBXK6M9E/4xryYz6xLZIA937Nlxcv3sUw7Q5I6Io36lE0xaKnSG/kZA6DX?=
 =?iso-8859-1?Q?By8PVP1KFiOG2DM2hxyA01Gu0V2g1tF+rH5cqyKejBLHJML86i+ZVauR4R?=
 =?iso-8859-1?Q?9FBo0AtbftHvWqO6EX4fps9BQasREjYsturqsWWiR3G5Tq6uZvdqnLOxcM?=
 =?iso-8859-1?Q?Zuv0XLYXKt15hkaZSdBUqTkDoLO4bp/gcuQdSwwZ2C4Av/beRzqOA3Zolm?=
 =?iso-8859-1?Q?9Sg455UQCRuFK+Fs9jyIaqZPMcjhyRG80dktgGqh9L8aOHDSfpX1UWOEDJ?=
 =?iso-8859-1?Q?c0HuA9N2Ce5FfQad3CZKn7PQNqGx5LsQQ1ddIbKF+UllOU8g3xdJPo53sV?=
 =?iso-8859-1?Q?nNYca2/xLOB8Az0/hZEFUvPS/ppjxtN/HSXGFq5DmTnUOq9+VF+iJmLynV?=
 =?iso-8859-1?Q?GdEaodiYdGffVI4lqJURYCt4kpQOdpYB0AQFHnJnZYnINnVthdot+uvJeV?=
 =?iso-8859-1?Q?lefjnIUsFWTHRBlWMVSSa6zU7NiJLNG8IWQTmyeUZKRKYxpbQxih6S4tlW?=
 =?iso-8859-1?Q?mGh9xIMZrrGWfEP6Nb+dfS4iAIWoaVG1dhq6LGiOVgGfpJ/5NR5cybYlO2?=
 =?iso-8859-1?Q?+q91F4of/wHfFNHyzhZE5RMYYX0MPNTiBy43fxpeb8M+/I6entlxoM/d+x?=
 =?iso-8859-1?Q?uzFboRWaCQAXenzFZZbiTgXZbzC+3Mp9W1H3SZKM2QcFI+iOIQZI8wfqWZ?=
 =?iso-8859-1?Q?wogK35hE6NAoxTC8hibmXjYf7ttA1O8JMf2uKa+x8lhpzbgNIuQY+YVsr/?=
 =?iso-8859-1?Q?kUiL90Grc5OFH6oj0o4AU2V+DFB1C8S4lHwxq8Tew+sQI8Duv5w2?=
X-Exchange-RoutingPolicyChecked: OcCHwzMXiIUVgwOnhX2gQIEzpDuRh6ZW6EtGhw8lpktlu+/sDcsmSowicTNE7R6Q3Z+P8WhM++E0Bi3cynv3DPV7/ZOZUYGmYd8ldIdzA+z2OYDsJU3pDAq9BMudeMam5lBm/vTvq0iRHYPZQr47dYzavXDsFSv520AjDxI/x4eAj5LSoQAWAm9kKNHRbqhS4s+ksrD0i0rZ51rBI3bKmvDrwXhuuZ1600KTUwgU7EUJy4UO4bbvXEOzeW7c8bySlQIssHwbcPnL12fr4M0bkwl/SbrlD//tEbzT6wMU0vHcauJZ7GCgEulm+XdWng8OQ+MsFidI71fi/PypjHYVSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f2bb06-14a5-45f6-1857-08deaa3169c4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 23:03:53.9872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPfvoB0uPpF9VfwmCT/Vq5X7TLTkLRBIqgJ8J/g9/cV8StHRw0paqvgHur1mcCs92DOYSKnhGMOrYZK6fqP7bivuTZi5/TA8BwKXnMuOfw1Rk3UI9SAMwb8qP85C3f8j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5914
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

On Sat, May 02, 2026 at 05:46:20PM -0700, Summers, Stuart wrote:
>On Wed, 2026-04-29 at 21:10 -0700, Niranjana Vishwanathapura wrote:
>> In __test_priority(), enable write_timestamp in xe_spin_init_opts()
>> and use timestamp value to determine the queue switch order. This
>> replaces the indeterminate sleep() with a more deterministic wait
>> based on the GPU timestamp.
>>
>> Pre-set all spinners to preempt-wait before submission so each
>> queue, once scheduled by HW, blocks at the semaphore. This ensures
>> all queues are running on HW before testing priority-based
>> scheduling.
>>
>> v2: Read timestamp to check if queue is started
>>     Use usleep to ensure all semphore updates are visible to GPU
>>
>> Assisted-by: GitHub Copilot:claude-sonnet-4.6
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  tests/intel/xe_exec_multi_queue.c | 57 +++++++++++++++++++++++------
>> --
>>  1 file changed, 43 insertions(+), 14 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c
>> b/tests/intel/xe_exec_multi_queue.c
>> index ca96099d36..0b31dd7a3f 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -454,25 +454,24 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>         for (i = 0; i < num_queues; i++) {
>>                 uint64_t spin_addr = addr + i * sizeof(struct
>> xe_spin);
>>  
>> -               xe_spin_init_opts(spin[i], .addr = spin_addr,
>> .multi_queue_switch = true);
>> +               xe_spin_init_opts(spin[i], .addr = spin_addr,
>> .multi_queue_switch = true,
>> +                                 .write_timestamp = true);
>> +               /*
>> +                * Pre-set all spinners to preempt-wait so each
>> queue, once
>> +                * scheduled, immediately blocks at the
>> QUEUE_SWITCH_MODE semaphore
>> +                * after writing its timestamp. The HW switches
>> between queues at
>> +                * this point, allowing all of them to schedule
>> deterministically.
>> +                */
>> +               xe_spin_preempt_wait(spin[i]);
>>                 sync.addr = spin_addr + (char *)&spin[i]->exec_sync -
>> (char *)spin[i];
>>                 exec.exec_queue_id = exec_queues[i];
>>                 exec.address = spin_addr;
>>                 xe_exec(fd, &exec);
>> -
>> -               /* Wait for job on Q0 to start, other queues block
>> behind Q0 */
>> -               if (!i)
>> -                       xe_spin_wait_started(spin[i]);
>>         }
>>  
>> -       sleep(sleep_duration);
>> -
>> -       /*
>> -        * Expect the job on other queue to not get scheduled while
>> the spinner
>> -        * on q0 is not waiting on preempt condition.
>> -        */
>> -       for (i = 1; i < num_queues; i++)
>> -               igt_assert(!xe_spin_started(spin[i]));
>> +       /* Wait for all queues to start and write timestamp */
>> +       for (i = 0; i < num_queues; i++)
>> +               while (!READ_ONCE(spin[i]->timestamp));
>>  
>>         if (flags & DYN_PRIORITY) {
>>                 /* Assign increasing order of priority for secondary
>> queues */
>> @@ -485,6 +484,36 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>                 sleep(sleep_duration);
>>         }
>>  
>> +       /*
>> +        * Clear timestamps and release all queues from the semaphore
>> wait.
>> +        * The order in which they next write a timestamp reveals the
>> +        * priority-based scheduling order.
>> +        */
>> +       for (i = 0; i < num_queues; i++) {
>> +               WRITE_ONCE(spin[i]->timestamp, 0);
>> +               xe_spin_preempt_nowait(spin[i]);
>> +
>> +               /*
>> +                * For Q0, wait until it is running again to ensure
>> it holds the engine
>> +                * when priority arbitration is triggered.
>> +                */
>> +               if (!i)
>> +                       while (!READ_ONCE(spin[i]->timestamp));
>> +       }
>> +
>> +       /*
>> +        * Sleep to allow xe_spin_preempt_nowait() to become visible
>> to the GPU
>> +        * for other queues before checking if they have been
>> scheduled.
>> +        */
>> +       usleep(10);
>
>Ok I still don't understand this sleep. The fact that we hit the
>READ_ONCE(timestamp) above means we should be in a waiting state, so
>I'd expect the asserts below to always pass. If they aren't that seems
>like a bug to me. And if they aren't passing because the timestamp
>write to 0 in the for loop above didn't take before we hit the nowait
>at least once, that also seems like a bug to me. Do we need to
>something else to flush the write in that case? Or what is the real
>problem there? What is the signature you see if you remove this on a
>sufficiently slow platform?
>

We need this sleep() before we trigger the queue switch below.
We add the sleep here or after we verify that the secondary queues
have not scheduled in the loop below. But we need it before we
trigger the queue switch. Without this sleep, I see that sometimes
a low priority queue starts running immediately after we trigger
queue switch, then rest of the queues run properly in priority 
order. So, looks like we just need to give enough time for the
xe_spin_preempt_nowait() to become visible to the GPU. This is
way better than the multiple seconds of sleep we had earlier.

Niranjana

>Thanks,
>Stuart
>
>> +
>> +       /*
>> +        * Verify that secondary queues have not been scheduled while
>> Q0
>> +        * holds the engine.
>> +        */
>> +       for (i = 1; i < num_queues; i++)
>> +               igt_assert(!READ_ONCE(spin[i]->timestamp));
>> +
>>         /*
>>          * Trigger a queue switch by making the spinner on q0 to wait
>> on preempt
>>          * condition, allowing job on q1 to get scheduled and finish.
>> When we end
>> @@ -501,7 +530,7 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>         i = 1;
>>         while (i < num_queues) {
>>                 for (j = 1; j < num_queues; j++) {
>> -                       if (xe_spin_started(spin[j]) &&
>> ((already_in_order & (1 << j)) == 0)) {
>> +                       if (READ_ONCE(spin[j]->timestamp) &&
>> ((already_in_order & (1 << j)) == 0)) {
>>                                 start_order[i] = j;
>>                                 xe_spin_end(spin[j]);
>>                                 xe_wait_ufence(fd, &spin[j]-
>> >exec_sync, USER_FENCE_VALUE,
>
