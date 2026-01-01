Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01F3EEB576
	for <igt-dev@archiver.kernel.org>; Thu,  1 Jan 2026 00:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC0710E0B0;
	Thu,  1 Jan 2026 00:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGqpXYJx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBBB10E0B0
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jan 2026 00:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767227023; x=1798763023;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bO6qG4FNzW6D5QCdttHq4DjbI/BTCVxJ7+zZwr1DR6I=;
 b=VGqpXYJx/MM0ibT/T0arjAOSdaMiOHsRlcHpm2e1n3ZF1Zxc2J/Q4nKr
 DSlEQwQqdOMXhKVxaDFiePdtKtC4WnInDoSVgbYr2+2TsU13p4lbc2D/O
 312CXd3Eto0/RxhTdyUycLpayi/NFFtyyP61o/5CsXUmVDJDliEat3GDB
 eBon0GvOFa/0Kx2vlQ5IOuqA6uTUh+cv1KYf8vvZqRgMzu15fdf8r9/mB
 UdGYWxdCbVRhydmC0GGLiomKmmA1nJtOjLcjCwYaz79Ko+2Ai8pXQkdKa
 sRPzfKV5kOh0Zt5udkFF3/Z71U4cYWQ15anyzVNn31oaS1pEEE0anS4GL w==;
X-CSE-ConnectionGUID: lq0oU1H4TNuVG7VWiZtdbQ==
X-CSE-MsgGUID: Xv2wCBfiSMq4JhmpsX6+jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="71362510"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="71362510"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 16:23:43 -0800
X-CSE-ConnectionGUID: dbF7SFPYQQayT+IR3R5I7A==
X-CSE-MsgGUID: BjbC4W32Q6+ma7+BbkmLMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="206582630"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 16:23:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 16:23:42 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 16:23:42 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 16:23:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UR1kpQ8RLYOkf3bms/imctTChBzpTxjYiVD4P7QAwJlLRp3dtZ5sxe8kAPr6A8r6LYS6VqrVX1IuCFJQIrVCslgTG+zSvMO4ZR/aFBeCOqBBdJiUknWHoRt46kfMvor0tmyip9l2sWaJs2FzMaMl7rND193i7kcokItAuetoMYCp760lKjCB2J1S7QbguGieiAPbNFfzpTIwKI+5TqMlIoeixu0H5WVEeD4FZPcbpf5U4c46nU3ZPCqxT08WS7XlUUxTys3yK1ejfozXelfhG8yTQMctqd7X1CWjdlNq5DtLw98yI/wscoo8mSrCADcr1FOsfF/t94cg0hURzhRxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HinlIL8SuQ72xiiXO59I30Q8qBJtCErmtpBkOkRMaSQ=;
 b=nxW3gQTBe9q08F6i7l5NKS9LZXc7i/duPLUTPFyU2Ws3DkYrTyE+a4Bmzfki+tALDlys/ur+MIJzPjsCzrHQ/yaW0e+dh8e5BjjHunV7IdLvTtLfRCHpJQy5T5AWgLyH8xNAnXSt8tH60d/bwRenhrNgfot03A+PYu285FsuY3BAF/RR0IjbNDi9L++x60zEU8i4rUz38GvaebGt4lYITUMTVKMaubisH4rdAFKmMSZiZWlU2YuLlsvv1tsqLcab7JJew75JBEDFuokpZkwTBDGnz/i3nLrLuFs125JOkmjlLz0oZxFWPWOCVfIECEqE0xu4B9KL1zAMfgKxWWDlPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA4PR11MB9444.namprd11.prod.outlook.com (2603:10b6:208:563::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 00:23:36 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9456.008; Thu, 1 Jan 2026
 00:23:36 +0000
Date: Wed, 31 Dec 2025 16:23:33 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/7] tests/intel/xe_evict: Add priority for multi
 queue
Message-ID: <aVW-hdFmYXEYFzy3@nvishwa1-desk>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-4-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251219120154.695287-4-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BY5PR20CA0033.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::46) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA4PR11MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: 19db2267-4c4d-44be-e82a-08de48cc00e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5zukIgE4U0HXSFf2tUnFj7wr2QxX4z1Y3bCYHWSYBDUlm0LlG+sF5/exm6ga?=
 =?us-ascii?Q?YRw/0Wr7LhIBcpavibv02zyVig2RMPE79E+h4wucrXMEX1OJonPpiZ7hN6uF?=
 =?us-ascii?Q?dsBCXXJeOYhc8HFME5o9hXh5y86D3VSBlSCzQF/h0yKGHf2kpC9EqZWQQhTF?=
 =?us-ascii?Q?duoyhDmmvd64t6OS1/KzpSCwnQb3pTBtWH63V7TlAEGr0/Ju6wHk2rOKykkV?=
 =?us-ascii?Q?PzWSZKqwh7janVC2x5ApLDW0DQf8kmYFQBjZVtvZdIVWYgz3KGdvYMnUpgpZ?=
 =?us-ascii?Q?VuKdRgJTdbdpnr/wJgscQpN30dEzgxJARAh+kGv9YllPKynPEDEHoKzfgO5D?=
 =?us-ascii?Q?wt377hhHTGJQUvHYAvfSBki/SjylHSJbMkfIr58Cw0+NJoD5loUpe56XcKo1?=
 =?us-ascii?Q?EsC+eG2ZyGlQXKPSVxt8N0mdu2JJDy8XE8ul7PwdPPWinKaqqRu+My8zgRgy?=
 =?us-ascii?Q?C2d5VzpxtXWY9cyqC/jUCPrWewGHum+cEkyI1u4CAoD2koxZNiqyJQ8KCRtL?=
 =?us-ascii?Q?nKOagSrDHghDjScWEuIuVHDoT+57sTA0Eah6XwfLz3tEUa0TYuieu8WW5GID?=
 =?us-ascii?Q?ZBNLYi8MFVOEj+3l3wRjiH/ckv6iMybpNsNgB/ylSUHCcE221wXGokkK4kHl?=
 =?us-ascii?Q?hbnVbs/msPL31PrD75z8k+TviTeWoH7nbSRt2WVviSwXa8pa9kABcD8iW7ca?=
 =?us-ascii?Q?C3ecfQTsrGKCz0OPrOWXY1WOLpj5z6SCGxshMlYdsDUOE23bLVDyNwity5l8?=
 =?us-ascii?Q?/VL/ZKUTGI3XyZ20W2HiWLhV3Rk9AywmoDx5OCZ1bTZKgrzRHh2T7PcSWxFr?=
 =?us-ascii?Q?uigjipQ5H9FeHaEPvLHdD88k0FOn0E+Sq18o/jgs20HS8fO1vrvvdr9Tb73p?=
 =?us-ascii?Q?gmXam+9KMsIkvR6jpV8QJc4vD8s5jf6fBXebzaG0H7OqV7cwuyco7maufFdI?=
 =?us-ascii?Q?qqIWYUiqh6siCpOI39zF8vOZnBO0gxZOX7/hHLCSiTQL9JaNfu8tW0uLdCBp?=
 =?us-ascii?Q?nYbdb8nqqQZN3Z6YrSjEfQUVRB3lEEcAEbrCRXFCYel7WxrjJe4cdSXdikWR?=
 =?us-ascii?Q?iSPX1y19AdmO6WLPiZR5alrw50J7psF8bNCDwMK2XEP1MO1lhzrjkd6xqfk2?=
 =?us-ascii?Q?MtYgZOwtruDWxZsd3b+BnCewxo2QZh9UNpohtBeK3ySwE8AC8yYB8nM1gv3L?=
 =?us-ascii?Q?GvV7ZFy1o8k0CqRnonv7fPNiiY39RT8Om+rpxeXJ6KcjloyOwvcNjT8zJHJ8?=
 =?us-ascii?Q?TlnOlc0BRaqHihMX9kPjjB1/Lmi8Vs5wqsnCmgJ1TiheIaS0bx9ziNdAsjrN?=
 =?us-ascii?Q?Tp8o+I1CZqHKECLv8WjLooeBcPhk8ewfftdQYHXthZYq3/ec65F2UIJ3gLy/?=
 =?us-ascii?Q?Qr6x31W0hkjVH8J4nCAsxYAtA6g3wR7xWFSHzl3pcyk7ISpu/48S56x4B8Y9?=
 =?us-ascii?Q?qRUX15Gvqq4dzd8MmCWlqDxGaIieH21X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mnup6MrCrLWfOGNGyMTS/x7+mZmcJ4fPMZ3pYhkI9TWlr6qFQXwxpUHNJsKV?=
 =?us-ascii?Q?qYKd2AP6HhsEqbrC1a7hlyikus0DxrYzfrc8HuMCAsxOfjvv0AEKBDdjTRH4?=
 =?us-ascii?Q?S09Ej2dPyEpDCQ1JoXS7vUy4A4FQQ9iCzfJ38m1SuMy24yT4200SRP0fQEJC?=
 =?us-ascii?Q?fERKH6XuhFsIvB42Fd6q33yvNomR0KIMQVezym9QsTHMJfHxyvwp9iDwPIKd?=
 =?us-ascii?Q?/JQKWzpD3qxOvo4d3cEnYDowBVjjW97zEcxrPNh7+VD8VaxrUT2VqLJ+f+W/?=
 =?us-ascii?Q?pf7z2htO3WcBJI9PUM3ezhYjoEpp9h0O+LV+rmp8EkqbJYNuTq+ukln6+GM2?=
 =?us-ascii?Q?PYlyQA4pU0VQW3vDsxkyG3F5F3laFUsUzfqGuibuvKgqfyRj5aEe5lus1r1N?=
 =?us-ascii?Q?WOCf0OZZ7lvd2HCkx7OuDVgk0XH1HoYvqUk/9p3apnapWfCBO86HePUo0GOP?=
 =?us-ascii?Q?+Eb7rdyVDyZXAjZ938dbafM2YpMdB16jUdzzACKBL6mjLgqmDiARMTM0Boek?=
 =?us-ascii?Q?PysmCH34PgKkCtzXjgOChlWWOvbqvU7NXOGanUe5MAIbi8usfqYIvJ/tIhOm?=
 =?us-ascii?Q?jNKocGrx9zDlbThbrtptOUFIRmYRWlOiQpHmiNeRkMp38/9nF8zYY7fU67HK?=
 =?us-ascii?Q?zGGqiyZfxfN7C/fHj0dSWcnv7F8RlEDCt19YgKCHpQgdw0C8CZ2vHl/Cr1BA?=
 =?us-ascii?Q?a2DtiEFkfbjaCZ8pz/vCMqAwQe0mPjTBsKIaAj9mabNxzzEDMcrUe//wTZ0T?=
 =?us-ascii?Q?9odK8CNnY2duN+p1wX85Z6abQ00g8in+ShxJy+G6YtGpwRMJdJI9MhhudnJn?=
 =?us-ascii?Q?9AV/cAafVAggw/UnXjG77mvr7m/j8ojtL1BqN8/vMEANeuQsvZ+N5K+TmoKb?=
 =?us-ascii?Q?Xz2GTiWF/Fmgh8BRR8jL2BIUdSH/GzpxbOb52/rh3Genx5T8RWfdOYy5GQhx?=
 =?us-ascii?Q?Ox43MJF8HRmyi1Zt0Wxy4U10jpyiE6+PnBihu2LByLs7nSwcE8lzU2bYBkOj?=
 =?us-ascii?Q?PRWSr5e8JPh4QY3V3P3OCLMdejmxW5EIcdeCz9MmaKnbSQND18DvlZbTVt/G?=
 =?us-ascii?Q?3v7RVVIah2Bphs4Jk8X2fSj/EkyXZfGGEIMCsfO/SfSZ8J49woJq7BJbzaxV?=
 =?us-ascii?Q?WnKtxR3CzDUU9qLW8fc1MiHt2B2m2wITe+mDT2YLWwSqvi2ni8lf7FPoQinX?=
 =?us-ascii?Q?E2PPCYiqlB/8F/8l5+emDoJuduGBg9aWV+CSvg1KSurDP8awuu0LLswYqXaC?=
 =?us-ascii?Q?cqsV4xJUKcHHKTTJp9rY2or34IdMBn/eth7B5f4QX7QZ0fKtdRc2pTElNIPC?=
 =?us-ascii?Q?tvguBedEp2yCdGB6cWT+ZUkgIJYbe2PCdDuCsRIPJWm+m+oQl4eZDFJS/z1i?=
 =?us-ascii?Q?Y6qxiDuA8kTs5OWfral6BKFvnoKeJPaY+BXeBRT7mazkCSV2ImOI1fCjxcvc?=
 =?us-ascii?Q?xbydswG5z+JrwWSuOJ5MNs50mC3hPU2oJfJXQnrk2UI8NWgU54bV0qrt+Btx?=
 =?us-ascii?Q?AYlLSXX2hKZdnmC8ZJeL+diXtDuZSJJNXLc/jDwGUC1HO2g1LHBFt1E42ifK?=
 =?us-ascii?Q?6Dh5re+xV0nryb+EsbyMoDFIOudMz+rhH2UmDIiE1PyQjy9JiMPQDSS0OlPM?=
 =?us-ascii?Q?xtn7Sn572Ta1Mc2vko0yAkDdZ3a0MacFKx0JkZG+n0pGWF3mqjKg81xyWu4q?=
 =?us-ascii?Q?kfHqUFGv0dKkJ/Vck4RKq8TypQKfbE4HAIRksDvCLSaBH/VLgpYPUBIFEMad?=
 =?us-ascii?Q?NiXaiGBbSREAKyIPNek5fvRdn2wAfDlC0DK8/p6O0SyIB33EXw3+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19db2267-4c4d-44be-e82a-08de48cc00e0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 00:23:36.0378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+JKTFz1Ad78YhK0iTSkT29RLnn1fwMeup0PqTQudEzVXaH8iXhL7brG2jn+KXIeWYU8Cj3CTXhPR2iEUaVN6hbZjJzNV9mNqdHUcsE3SmIfnvFmUf8u+geNjfrBi6WE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9444
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

On Fri, Dec 19, 2025 at 05:31:50PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Add 2 tests small-multiqueue-priority and small-multiqueue-priority-cm
>which sets priority for multi queue.
>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>---
> tests/intel/xe_evict.c | 24 ++++++++++++++++++++++++
> 1 file changed, 24 insertions(+)
>
>diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
>index a62230ec6..35192aad0 100644
>--- a/tests/intel/xe_evict.c
>+++ b/tests/intel/xe_evict.c
>@@ -21,6 +21,7 @@
> #include "xe/xe_query.h"
> #include <string.h>
>
>+#define XE_EXEC_QUEUE_PRIORITY_NORMAL   1
> #define MAX_N_EXEC_QUEUES	16
> #define MULTI_VM			(0x1 << 0)
> #define THREADED			(0x1 << 1)
>@@ -30,6 +31,7 @@
> #define EXTERNAL_OBJ		(0x1 << 5)
> #define BIND_EXEC_QUEUE		(0x1 << 6)
> #define MULTI_QUEUE		(0x1 << 7)
>+#define PRIORITY		(0x1 << 8)
>
> static void
> test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>@@ -89,6 +91,15 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
> 			};
> 			uint64_t ext = to_user_pointer(&multiq);
>
>+			if (flags & PRIORITY) {
>+				struct drm_xe_ext_set_property mq_priority = {
>+					.base.next_extension = 0,
>+					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>+				};
>+				multiq.base.next_extension = to_user_pointer(&mq_priority);
>+				mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
>+			}
> 			multiq.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
> 			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
> 							     ext, &exec_queues[i]), 0);
>@@ -279,6 +290,15 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
> 			};
> 			uint64_t ext = to_user_pointer(&multiq);
>
>+			if (flags & PRIORITY) {
>+				struct drm_xe_ext_set_property mq_priority = {
>+					.base.next_extension = 0,
>+					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>+				};
>+				multiq.base.next_extension = to_user_pointer(&mq_priority);
>+				mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
>+			}

Not sure if we really need this test. Not sure why would priority effect
the eviction. The non-multi-queue subtests here do not have a priority variant.
I am fine keeping it though as a interesting test scenario.

Niranjana

> 			multiq.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
> 			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
> 							     ext, &exec_queues[i]), 0);
>@@ -540,6 +560,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  *
>  * @small:			small
>  * @small-multiqueue:		small multi queue
>+ * @small-multiqueue-priority:	small multi queue priority
>  * @small-external:		small external
>  * @small-multi-vm:		small multi VM
>  * @beng-small:			small bind exec_queue
>@@ -571,6 +592,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  *
>  * @small-cm:			small compute machine
>  * @small-multiqueue-cm:	small multi queue compute machine
>+ * @small-multiqueue-priority-cm:	small multi queue priority compute machine
>  * @small-external-cm:		small external compute machine
>  * @small-multi-vm-cm:		small multi VM compute machine
>  * @beng-small-cm:		small bind exec_queue compute machine
>@@ -714,6 +736,7 @@ int igt_main()
> 	} sections[] = {
> 		{ "small", 16, 448, 1, 128, 0 },
> 		{ "small-multiqueue", 16, 448, 1, 128, MULTI_QUEUE },
>+		{ "small-multiqueue-priority", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY},
> 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
> 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large", 4, 16, 1, 4, 0 },
>@@ -740,6 +763,7 @@ int igt_main()
> 	} sections_cm[] = {
> 		{ "small-cm", 16, 448, 1, 128, 0 },
> 		{ "small-multiqueue-cm", 16, 448, 1, 128, MULTI_QUEUE },
>+		{ "small-multiqueue-priority-cm", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY},
> 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
> 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large-cm", 4, 16, 1, 4, 0 },
>-- 
>2.43.0
>
