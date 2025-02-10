Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EF4C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 19:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A34310E3C9;
	Mon, 10 Feb 2025 19:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PweSMUMq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A2910E3C9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 19:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739215708; x=1770751708;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=XKDuXQytnTe9rEpUn/P3CzT8+LG4uvRpeIiXF27bwJs=;
 b=PweSMUMqsSbgVjZ2bT/I1VkWvkluir0jJ7GfabRg2wNeOai9woujQv2v
 WzME2Vu6zXPpDRB9ZqKgeeReGZZ6LPjDrk7XWkj8emlW2gquBGnhi4vLv
 AKfz1tb+sqteDHOezsfxl2Uhohhu8U0wZ2Pi8XSqL8XDa1c5ONYh0TKyG
 LImqK8lvIjwfWMyS5kWjCjTZoUI7ibm3c9sW3yOSkAEQWsGHvBQzI5u6f
 UASVELsZFIbdEvUbMiPcdeA0ThmV3ofFcXKB2C5KLES61T3G87m6QivJI
 Pn34vkPX/fuL3UOpzgmJmp5n6LX2bjfxfVKE/3BjLsqBV1hgnpTyZpx2J A==;
X-CSE-ConnectionGUID: M0eUHXmmTUu/3dCDvNaUWQ==
X-CSE-MsgGUID: LliM5PNwQROZ92m48ef8Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50443660"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="50443660"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 11:28:27 -0800
X-CSE-ConnectionGUID: EUoqtVmRTqqDviuhpu+HAw==
X-CSE-MsgGUID: lL6ESnEHRryjDsK+9NZsFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112504031"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 11:28:27 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 11:28:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 11:28:26 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 11:28:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mh/5JBno3diOTeHNlDMT2vBQQeStTwXHEbNR+7j6k9KSHJQRXKlKYIGXCAgrTWr/+x5lPMlyVp0R30k9OXDCUMO+8e6TM59vCvYmVi7cF/Lj3B1J/BGBZbiuKcO2j2Nk8GIDtzAk3qwnBRT+lwC7sG8ncM7sNsnrRxuMcOVAUJob+i8gyun2oMecGbHwUYgPA/oIPEz1qap9iV4y7+JuzCoEDZknLOEDbWiVOU4BIwsdIY/WwnPI2rm6uNpkuRCV1tDIFtS46pFrBfuTlp9gtYbP4LN/2BOpmfMa9M6KRHUYafqU+l97sbuE1GkOb+wOW6CiKQ2mAlwj6kC3rtIcQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTrgk5Sp1+OQS5QX7OH/0WrOH/EHr1q18568MZE2fsU=;
 b=aI842TbOFXTINFRj2meMhWOa09tvttwaC+VSEt1Bzn6ptN1RG+coAdOa2THm3exPqm5BngNnctnPwRGFzKJe6k5b4y7U2TTfEgfjWj4JzaiDk0ZTF+7JeVL+5vT31cmSDV+PyCgSAnZq5ta++co2ntedXB0FaGPL+679i2NNbbZKn3WOU5NCSfqlosT5BAvn4GB9qPHdrJMQFuadVJpz+rl4RYiRr9NyC/Itia5Qsy74RIxK5WtyyIoxchS0SxIA5E07XUmSMI15r/yKzniX1wDlal4l0uyfl0vcTjwJBCW63Pw51A9RuQ40TTVWg7EaDDaZeLoHQsh0L9pRzKdF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4861.namprd11.prod.outlook.com (2603:10b6:a03:2ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 19:27:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 19:27:42 +0000
Date: Mon, 10 Feb 2025 13:27:39 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: [CI i-g-t 00/10] Add igt_runner's cmdline to results
Message-ID: <c73ibxwb574j7i4sb6kioce3txxozyvknj7byx2ofj2gujzqk3@c4x5alcpsubh>
References: <20250207231039.2883195-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250207231039.2883195-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0175.namprd04.prod.outlook.com
 (2603:10b6:303:85::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e584459-c27c-4398-5521-08dd4a08fcd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VV4CpRib6P/bdm0dWa+sKjFEUk0/ZidrtDu9/slu8nKvKVF7bRAWGaGtQpmN?=
 =?us-ascii?Q?fLlg3FUYdTcIFtGghzASNepCnBr8LXRmmjzJAlbtLpFUyDKEYzaYqepRd4kd?=
 =?us-ascii?Q?O8h59KZJ3YW775cndOG4AXTOKiByIZQXCtEIH5IljsVmDcjAWy6ouLQ5Zq+u?=
 =?us-ascii?Q?TpxdnKZ/2DBH+9oNH50WCkWc0wCzYxXlYqwFgcrLnrGcQIBFeD08JqrUyMfS?=
 =?us-ascii?Q?WqR3Tw6L0cVupoSC4YdUOhtKZD39U87aXkX6pDEwkgYuUeioNEQPmYKelja7?=
 =?us-ascii?Q?J+JBfZO89DTxqPtx3s0+XiMAQUtN/VEJVjnQqnhCEokTgEA3lhGgc1GdgxO4?=
 =?us-ascii?Q?5wVshmp8cvd7836Rwf8nINDQM8U1TO+5sDA4TpHZJdkq8d1H/uPGPQmi1EiW?=
 =?us-ascii?Q?FrRLQTxJzvyQmSc8e2VLd/nRG7OVvv1XnZPxr7+zihU1VezZ0Cn4YY5n9u2j?=
 =?us-ascii?Q?2Pn+UXZ9jbxyCWKoAGPZcPfueLhWa/CvMmBAvQrlIJVvDnQjFy7WUV+nLnln?=
 =?us-ascii?Q?pjZfV4OZe2USD/f6H7TbjFV2zYzt6PmVqWi9t35lcCM5UW4kaSzydiXLdusp?=
 =?us-ascii?Q?EZWxkGfW1ZOuiOWIfHvYwbhOhUe02muxJI9zG04bRNk5iII8AfqPuKy9cszl?=
 =?us-ascii?Q?ME6poMZww5EPBu5QJh5F+OYOxeRFFFraXxMmRoi8O480pktDggtBaHDXbLze?=
 =?us-ascii?Q?gthkImZgvlUlhRQbvqTdEIXWvuDC1H0NpHzYd98eLI7FvOWuT6Oo2URNyZJz?=
 =?us-ascii?Q?+oYOpGYyHL48lUydr/VYyE7bLaIf0TlOJRoZ7g8FJtilgvZosXR1DKNBG6+Z?=
 =?us-ascii?Q?d3pZephbbDesY8xMm4OW62jLNZE18KC7H09Bio1e0Knqt9n/G9wy65FJL/tp?=
 =?us-ascii?Q?3ajxFhV4yw+pAVepG7Un0CxdfiZM5L0t2eIUue0uoBBftUvSDc91aBV6Bqfb?=
 =?us-ascii?Q?zhUaOCduhtp9Gfdv03iSj52L5BxCKS2y1EVyIEuPaRWVvBxr+juMDulES6Bg?=
 =?us-ascii?Q?RYCy/nT6DQMgLpE8DvxsymSNnXVBBipcU8a913biXtYHwsedU3gFMPsdMaQp?=
 =?us-ascii?Q?o0B/yLt6Q/njX1mQU86jJxWYGhl1Z2mMFvr66kcioh7OW+SXB6x/7KJEQ4lc?=
 =?us-ascii?Q?YehLoN65l2FRlwEKEsp70v8Z+wTURh+lhMoA3DnX0I6QQgd1HzC2ljjmz2+s?=
 =?us-ascii?Q?ZwuSgU5xHa2tA1PLKywErJlhjHT2b1FWiGpgpOL4mzd73UN+N3tEpkEGxWyo?=
 =?us-ascii?Q?/ax5mpTdqYl8gxJaE6TtiOYoCWZeixDgT6LUOyQF/CrlxFMl5r2bv56aqBzD?=
 =?us-ascii?Q?/vYrbUyBQ7VJ5cZxojC3B22QCoTxqYrSOIkH1b6UDLw93I4192bDaYuJPMck?=
 =?us-ascii?Q?ex9Ipf2jnprTo9lLKtz9/rnY+1rp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lDMTdCI1/fGO/1OF+SjyyKPZUoQ2PZAAe4NPOxjxyTnkrKaTFYTr5KphAsl7?=
 =?us-ascii?Q?u1tX41JZZqzCf4eCgbQolXmlXLu85+j/K3j2+6Ldvo4y2yLfRxvuuXdLUhKR?=
 =?us-ascii?Q?UZEQ28YT2IQShmOQFfgL5emnnlPkX8PcCacmDMBHppcRZ0/3qbzU29K5yJfw?=
 =?us-ascii?Q?2jH+bPT9kEmYOIe5puU4CUPO2DoOurw0/jwdJx8oc75to3hZTOUaGDxDJcUE?=
 =?us-ascii?Q?Vmz5aWVNSXazDzrKNX4OHflsHwpvKFCdfEKNLcHaxVBKAwFA5vPwCEfKEzNL?=
 =?us-ascii?Q?3GBPbLi6O5MnF44DO8OTO3JOjK8gU2Zv+4rd0iV9SSE5Y3rkdA3+hGmbL8Us?=
 =?us-ascii?Q?qx2g2vE6mQkFZR2z39Fh1eOdQWSFrnNBmyHsAUOWKl5cTg1F4bTqABqnQ5GV?=
 =?us-ascii?Q?+5KFkX1jFf5fF0kcwkc8FvAynP7I3VKPyLwyQt7uUBs6qPaIuFcKyEreo4GT?=
 =?us-ascii?Q?/brX6nFrbu9DOit+PV+9Rksi5706s6rQGnCdca7kE2K2tzTgcslLcklUOoq7?=
 =?us-ascii?Q?dAAdn8Nx/WVRO42CdreMw1QQVn2DnXXsRNsmi4rXHmzNyJ2rnurCVWnidLgS?=
 =?us-ascii?Q?dIeL+YwDrT1FfiCKTfDQaGyz6+k1u56rsJEoAW+fHZOYDeA1R5pEtvz494Dw?=
 =?us-ascii?Q?CzbSG+kEd+9UUC+lg+Qfgd62wsgcRBUciYdXa2Yk9GCVUSmyxSLdJHi/wqXF?=
 =?us-ascii?Q?QWY3flxBcxm0+slDLEddw/jxzDlkZ+qlGmuexK51w1R45LeqzIbsWEEJ+T6e?=
 =?us-ascii?Q?UiFMwbIb0X+C4gHOjZaaFWOsv5heN/zc6arZpaLxpRMRM8mjnO3VM2GQvAcm?=
 =?us-ascii?Q?CXKodasf6+sG3XNjYk5Cy/VsNR0Q2hKb1mchg7wztjjsRnjg5OpHDpo6PQ9D?=
 =?us-ascii?Q?9XlxF8xaV7IzV+WRGw68F8brzOmhpwHsqe9la81CVepYv08Sd1I3QAxjGcVr?=
 =?us-ascii?Q?UdJarEsSLjCElrIKgO94zuIeakTdYGnKBR1D87tsqS6PrIjFZgzRIH2+Lacg?=
 =?us-ascii?Q?P1Upe8+vx9uGTw+tCWCacVS9fy70UrOpbTaH5+mEwCEJ6UWfIXOCP6uYDigP?=
 =?us-ascii?Q?ZmJj5mP0Z+GdwrKJVJRweTOZi3GlDKj7g2pDbD/dYOUrDSWMO6Dra+KA6HYn?=
 =?us-ascii?Q?PDWn26K8vocCJTcgxZHZprBoxGLj/TOPMWJx4H4KgfAl/wFzbpaqDQP/Y5TC?=
 =?us-ascii?Q?igNvftHQrIFHVNk4FZJK1aDTSeQ18IeIlEpcVz9xYx7WP+1ekamy8KNLWPYx?=
 =?us-ascii?Q?PQr2v48mNebn//5G99hUhZ2HYMtnTn/Qp3+cOyvBX99DOb9rlnSazPfeafh2?=
 =?us-ascii?Q?8AyDL82ZUkou+zNo11Mh8unNBI4qROZWfxp8xHYqcDQrW95Fzo9oAqupw9Zp?=
 =?us-ascii?Q?GUYtZAoh9cpE2rJAj9Hb0jvQr/5PquVLKrNgPXFapnc8RAJBVAmC1mqiOt1J?=
 =?us-ascii?Q?fN0wIJr5RdM1ECA3lCWzo2U5rlkla3dDCfQQrBnz5ybsdiAFfOtZ8Y4j7iti?=
 =?us-ascii?Q?yikZ+STNqnaQF4PzRy6ElKWkW6GPhX5VkV6Ae6tf2dw24+IUaYAOkWRPRDNA?=
 =?us-ascii?Q?21gi9RTffg6eeGVhN3UxFHBuCAcbA5qfY208zof3qh2qjhH4OdPk4a33e5YS?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e584459-c27c-4398-5521-08dd4a08fcd2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:27:42.0756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvIpChSxFIOJSi4YQ3kuKAiaugTFx/fchAtSEIPeo/VYQJ8J48kbbt9gcGL/zfU0aqw6a3m6U5asV7EotVDjoH1tsFg+5zpnjXmFZgJJDQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4861
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

On Fri, Feb 07, 2025 at 03:09:34PM -0800, Lucas De Marchi wrote:
>Help devs to reproduce what CI is running by dumping what is the command
>line being used. While it's true that in the shard case we don't have
>the testlist, just seeing the right incantation of command line is a
>great improvement.
>
>I plan to follow this with the env vars, but first want to get this
>in. It seems we already have an environment.txt saved, however that
>doesn't contain the igt_runner's env, only options passed via -e to
>igt_runner which is then forwarded to each test. I'm wondering if this
>is a source of bugs when using igt_resume:  if the environment doesn't
>match, it will run with different options on each execution. (answer:
>yes, it is a source of bugs if the exact environment is not re-created
>for running igt_resume)
>
>v2:
>  - Fix more leaks as prep commits
>  - Fix leaking argv that got lost in all other pre-existent leaks
>  - Add dummy array to the reference.json files so it passes runner's
>    own tests.
>
>v3:
>  - Better split patches and reword commit messages according to reviews
>    by Gustavo and Peter
>  - Add generic escape/unescape functions to be used for metadata.txt.
>    Besides preparing for cmdline, it fixes other uses of \n.
>  - Provide a single macro to parse array, which adds the proper code
>    to parse both the array items and the length
>
>CI: minor adjustements. Let's make sure it passes CI.


Thank you for reviews and feeback. Patches applied.

Lucas De Marchi
