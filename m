Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688E5EEB576
	for <igt-dev@archiver.kernel.org>; Thu,  1 Jan 2026 00:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB4210E0B0;
	Thu,  1 Jan 2026 00:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Db3mXyFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4313A10E0B0
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jan 2026 00:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767227259; x=1798763259;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i3ELWpH7oM+K6PTsMqPucyeJevDPySjmRlccIknS4yI=;
 b=Db3mXyFYBmh1xK/uvWpUWniFGTl4V7vqVj+FMVCzLyFAOvnspE3aD16T
 Bfj40T64TWf/nIB5NfwM428GUXmKJvIK1s9dk67j9pW8TZ68ovzFYoEzf
 LhiGfv+tS7uLBzNn1dZsVwNGc7azifDL0AvXZlzqZEijGSid/styXzj3p
 Ke1C+p/1yFGoMOa5OJc7W6LXwc1UMgaKM91+S+wg5JeKL8SdiUsVuGDi2
 pp2kcR+IJLV+g/vq4oNvHM0qH5tvTwhISGmdVK2aZoqFM6Ruz5AYjXOGR
 dLCn35m28aR6acQmcTKvPOgwr6AxDYBNRpKfokwQWKOyoxQwilLGq95C3 A==;
X-CSE-ConnectionGUID: qyjCrUqKReaf7/C984h3Pg==
X-CSE-MsgGUID: fxUI+vzyTLK5Sy74539CWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68944665"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="68944665"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 16:27:38 -0800
X-CSE-ConnectionGUID: K87VHlyAQZ6UlJv5w96I1A==
X-CSE-MsgGUID: xMJMKJuRSDSL5FLje3nN4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="232626429"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 16:27:37 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 16:27:37 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 16:27:37 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 16:27:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lby+sqvH5+2pROgooVH2avVAAsr6pBaN2b+Ncf3YxjL7eZ38eUqsprjEXvcVvW1tT4wfJDZHTQOkjRyY76waqbeiBBMbglT3zijCQYWJ7I6rGGC1UD/UgY4ZmwWqtCVfpy9KhG2Uk68OdcTEyhbpzC8UWVIPdSsVQSfBA2LU9rTVNINKopKBgBM7SEe/lWyy31WuqHai1+P56ajTLQsRnm/c5KOhxxNeWF7jpl8HNdgjojaSTmvFf34p27l2Hdd6zSeuauwqyT7+vzusnIvHBr67Ix+icReEVDq256/ygx/eMcXQ5KWk1poy/RRIkNNDig4a4JtAXKbIFsOiSHBZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=el/Bk3yx2pvnr8JlB/5zxqHxEFOfzw4L6XD6IjjmoHQ=;
 b=EDpCLCTLLJVHom5L++4UI4HcMRp5/SnIUEZRbfD3rccMBu+4OXmOLD2tB16TZI/tx2wB+jOUszisLqpbPPSW98A9Y/Isdw2IxkbcDLkik7qDa7TlvvJNMNhxsBl8Vaj8a3wPDqN60bIlcVxivZwI0xZPtycGU5e6j5Ls0Du/mAgxMs9lykQzCVIYAbYWQNAdzl3meO++KbuNh4991DOFJovLlZV2XAjU/3CRwWNBUP89fO1ZzrBAIZ60ZjFGRc4+M+TYxuzf9Gu5H5CqLxBJiEoQ/HSn02yGTTxCFzd81cx/T0gwVFITFqm7k8CAj2RiABEWL3qNMveeojWFmPjpAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 00:27:34 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9456.008; Thu, 1 Jan 2026
 00:27:34 +0000
Date: Wed, 31 Dec 2025 16:27:30 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/7] tests/intel/xe_evict: Enhance testing of multi
 queue functionality
Message-ID: <aVW_clM1s2C1fy_2@nvishwa1-desk>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-5-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251219120154.695287-5-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BYAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::15) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MN2PR11MB4664:EE_
X-MS-Office365-Filtering-Correlation-Id: eedb459f-6d81-4971-d2e5-08de48cc8eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Eknu7EC13/9ORCvyOEfBspH2bnllhriXm1ulnTBN/S3wNgj+jd7Nh2GTQSC?=
 =?us-ascii?Q?DAmMkgB8W1/yTcSuC/ieFgsDm+lCqcW0XL4XyI7uNe9WYNS0Lo/HM4yfPKfQ?=
 =?us-ascii?Q?eH04RQm17zlfwv3zzwoGgiiJQhIvnhKrZDji2cECEpv2VUq+rBKTKRivE0a6?=
 =?us-ascii?Q?l4bHkGhqFo2QACHogm84mP7rCDrgAVHJ27hu8ba+Zpq1P7jogeAINBxwJqw+?=
 =?us-ascii?Q?ENsEagzzoSbdWswp0aV1MXh1ijYj3t72mh1B3tRIUGkOLZ6dGD38RyZLkw/H?=
 =?us-ascii?Q?2wA6Sg5HOYUC/LjKLXPXxwDlCW/bfPpxkzZRxqXxYsEAG5NeuVbVDFgXF40p?=
 =?us-ascii?Q?w5nddK71qWt4jWhJ0QGeMr1278gZ7iQy+7taxsSKaE8owNT3w3MSq24oIUJU?=
 =?us-ascii?Q?eHinjoEoM4LidtiLNuw0ldgzgTDxYD0qShPlbGDMGIQXAcumyrcJu44UHJ8s?=
 =?us-ascii?Q?yleZJYsX8d3ikAFd99LxpVKWP1QsEDTpdK2qRvtvKqQe7qY60NXhMnj4ODDk?=
 =?us-ascii?Q?7GbTDC190M5vse64z1GBZTAP4glvT/E5pjWieFXLt/LkeWvQA/yKyWe/2mIL?=
 =?us-ascii?Q?xwxfFLgS5dC0OZztWH0k5mIk7A1UEofazc4mX7VokbEburUaoANn6Dwnisie?=
 =?us-ascii?Q?qXOl1GkZo3glAVXbuAhHFz+PYiAG5Ksm/fecjgOXw9GF9sPwuAaqER5qM5Gj?=
 =?us-ascii?Q?itbHOv1JuRcILgZJj31Pg5FeWpjMDbeDV0QjpUFSkQ8crUgh2Bdnav4uZeTC?=
 =?us-ascii?Q?hwHJlDZh4ny8os4VFhR8drs59Gjcdbf8dSbAAKnE6iPKzMyWVjN9pQCwwxYb?=
 =?us-ascii?Q?M5Vujuk9i/6KENYJubdA3qsloYmYIBAQIeSggy6dYFzE4vnIBxMaysBIfgy0?=
 =?us-ascii?Q?AW8EjqCkGec4XkpvwQfRCKopNC9DhDuUbvrFZmzWahDIhJWKHlk0+bQkB8LY?=
 =?us-ascii?Q?zZQxGcple+u+eyqqpTJvt/voKOLDrnFTCQec9r/ubEUNVbkdA0qyMa0xL7Kw?=
 =?us-ascii?Q?dfm3DmONT7mpMkULfQ3n2xgyDpmz/mtQJDfFZ3K1/TrbE58843tAEJvIwOwK?=
 =?us-ascii?Q?8nZvZsJxn7HHSKpyzHi0fqOi/VyyUbxzqJz86kf4OgcJnkX/i9Tq/zgUbgRC?=
 =?us-ascii?Q?KZVOS25Z5G65C7/1PvJ/rfgVLhUqokoXJMelxvAkivglXKtVo0W6x+Bj3WhO?=
 =?us-ascii?Q?3fKqluGj/VhAVBfnw0yII+qErrhmwE05SGujtftJjsMkQnffAIvNuKthoupv?=
 =?us-ascii?Q?6ahLfkfTrdYPz0tzQYc2X5BEcHbV3IsEz2LIwh1wnl2H26I1ESxu+nryA7KC?=
 =?us-ascii?Q?nlDfG1magFw+rQzOS9/hjRHRBTji5+TZkJq85DDlK6KhcMqftgP9onTOvITx?=
 =?us-ascii?Q?ZhDajnmRB13B19eA4kxfMR5saL3/zqVW5YS4t3y5AdK9SXecg4eaRYtTqwQU?=
 =?us-ascii?Q?W1VWrZsUg7S71UUMfiP986RUpQFzdpcM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KIH9cUhIJCNLA2KW8ACnpYoHCRnsjc5h0HPrFiCxNim8ClvI2vb6f6/JKPS6?=
 =?us-ascii?Q?WL6MfbdhhtJ0q+3tM+BdWmURnqVTkSxA992edE06dG/CRPXOfjT04TleVjQ5?=
 =?us-ascii?Q?+vlRz1oAWo7kuBqQNueYZJETwOt423inDiwqrxcgrOmKt9Ku3zsnuJWIRGn9?=
 =?us-ascii?Q?L59JtNP8xfco4Zh3UsPlCLg1Ez+4HcqgbhpaE8e1fXEMOvO5mxSb8gYkJO+c?=
 =?us-ascii?Q?FStmOuaXFUug8Sf2y9tj/Lz4Ceb6yf4Xuo4N99VA7G+/b/n6GVSaOji/Wnva?=
 =?us-ascii?Q?YnXZOsoHYnZ36O7O+IWm+pRnQ1gkMUrsfuB8U0rQed9GVCSBvlKCUaLu+3/j?=
 =?us-ascii?Q?Eu7AbU/eVpXlGMoiG5HABVm0ZzgkFsrWs7rWwHxMMMEXyKpKN+4FmhMlwccx?=
 =?us-ascii?Q?vqZcVA8kKJYmkiFWvLfdgGMGPGN2v7+UAZ70/oMXvRNEt5jju1jjaGb/Lc+1?=
 =?us-ascii?Q?doJk3qxCk2DdrbqrbBkiq5JNs6BBaPQ03cxlcxMs7Bog2+tQ3RFvmqTaUt5b?=
 =?us-ascii?Q?UB3tnrew7b7hYMP29W87RGQoX4/KyQV1mi10Gr+eZieRLpKlvRQK2apYABgO?=
 =?us-ascii?Q?vJPuZfy/+KphIO4sX47CjkCbw/PZiSjF+vgBTDhN4F4Mvs0LMC+cor3GYpE0?=
 =?us-ascii?Q?Tbi6Skq4so8vFbHG9VOd/FG5bekP/YGi4sHb9Dt/848R30LXbEcnpw/TTk2l?=
 =?us-ascii?Q?VHKJfaycMupA2GZm05IiIsOP/EcDkzLfhwZhDuTojIjAfdkOZJGnfXcteJiD?=
 =?us-ascii?Q?Wnjr8HStpCmGuS9MDoZIKJ+1F7WuuLpJP6jiZ7Zq5IFA4pnRY3Z/SAMX8t7B?=
 =?us-ascii?Q?CqNLnfdwKAJWfYhHdfd2eO8g+XoM4zXLKVnCQVNS8hwFlUFu6NmrPotgKhm7?=
 =?us-ascii?Q?0wmmqrAcKQLqR/7rTL8HYrR4glT/PqoysxA9uShbizAAzEuUqKMcMcMydm7w?=
 =?us-ascii?Q?r5eXMN+o1q10lbTl0XyCSUFbuLgMJN7VNcoyDkQjRAEHAqoqE59On4COLKtA?=
 =?us-ascii?Q?aiZd31T7RofNAi6db7/SAqYWYmXzuY1q5BrJJBuIK2ujc34V29mN3A/LbYSw?=
 =?us-ascii?Q?6yI1JJ7lxUdJQznyhfHfJUukWWI/71kExsxrgpEHZodPgKz8VEkF/a3sQ1r0?=
 =?us-ascii?Q?9excZqUJiwLNWm5CnF0CTUHxFe8tMeGYgbZeKkCIdxJN94wiQdYCkHf+XV2R?=
 =?us-ascii?Q?X7ow5g/yJ1wsVhwVhi9anxpGGqxl1vsV9svhsd9f5LYR6jMK1EDWXDyy9xoG?=
 =?us-ascii?Q?BzYAn7x8v4AVQWBreL3x3YGdypCqfgGSvVU3AYoUeYLGSNUVDjoPEHl0haY3?=
 =?us-ascii?Q?rOMBiy1oLmWNGfJZwWJ0Z3Kh25TPC7NpvPYRYeZp0MITJz3QH0FPOvvYDQAi?=
 =?us-ascii?Q?G/yDOrTacFlfIT7I7vWGpt6oeHpQi5sATQwqpT7TW1SlJaUVXw5Z5k5tvKwu?=
 =?us-ascii?Q?eU/sixeM2uay/R8FS/VfeNk+sdZknS66pqnNwomIIdNjPwEnecI1mxEQkq2X?=
 =?us-ascii?Q?7vszNkDGxlBNe+8W9EnO8EfJmebQfgVcm60q8hQoJq46qnMd7L1o9KxgiJKC?=
 =?us-ascii?Q?XSKlZCgE23i5AtVRxOienzWT3FwNHBaOS80jWQro9cHxfaXlO9V3TLNAGsgk?=
 =?us-ascii?Q?GTrlG7qlPPbaMpWi0HrpVapJVEItUJmxYPAjOCkIJXQzZAbsAVKcgtEJEVjj?=
 =?us-ascii?Q?Z2g/TP7bJD5hPV6g7z2GOb+fytBn3NIaJ2Qs2Mo5ejBKDtuOTl9UhVW0R99s?=
 =?us-ascii?Q?tJvvB41giKqS92plsgLAmQpbq50EDk9IXqyS+Moo4oOlsG7rBpHg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eedb459f-6d81-4971-d2e5-08de48cc8eb3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 00:27:34.5457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDV45fqIBN/yxjpb+oj2Fb5ByDTCo7lN9TrAooJWUHJqk40xals+O2W8UfXCO4MXX1eZWnanC1OljdfK5I1AHgUwgOlt0A+DWDo72SrgQf0gYMAiTOgYDfjGo3bSYwPM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
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

On Fri, Dec 19, 2025 at 05:31:51PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Extend testing of multi queue functionality with flags
>like EXTERNAL_OBJ, THREADED, MIXED_THREADS and COMPUTE_THREAD.
>Rename multiq to multi queue across for better readability.
>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>---
> tests/intel/xe_evict.c | 159 ++++++++++++++++++++++++++++++-----------
> 1 file changed, 119 insertions(+), 40 deletions(-)
>
>diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
>index 35192aad0..26b6091a9 100644
>--- a/tests/intel/xe_evict.c
>+++ b/tests/intel/xe_evict.c
>@@ -7,8 +7,7 @@
>  * TEST: Check VMA eviction
>  * Category: Core
>  * Mega feature: General Core features
>- * Sub-category: VMA
>- * Functionality: eviction
>+ * Sub-category: Memory management tests
>  * GPU requirements: GPU needs to have dedicated VRAM
>  */
>
>@@ -84,12 +83,12 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
> 			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 : vm ,
> 						      eci, 0);
> 		else if (flags & MULTI_QUEUE) {
>-			struct drm_xe_ext_set_property multiq = {
>+			struct drm_xe_ext_set_property multi_queue = {
> 				.base.next_extension = 0,
> 				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> 				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> 			};
>-			uint64_t ext = to_user_pointer(&multiq);
>+			uint64_t ext = to_user_pointer(&multi_queue);

Please don't make such name changes in a separate patch like this when it can be
done in the first patch that introduced this.

>
> 			if (flags & PRIORITY) {
> 				struct drm_xe_ext_set_property mq_priority = {
>@@ -97,10 +96,10 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
> 					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> 					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> 				};
>-				multiq.base.next_extension = to_user_pointer(&mq_priority);
>+				multi_queue.base.next_extension = to_user_pointer(&mq_priority);
> 				mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
> 			}
>-			multiq.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
> 			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
> 							     ext, &exec_queues[i]), 0);
> 		} else
>@@ -553,14 +552,13 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>
> /**
>  * SUBTEST: evict-%s
>+ * Functionality: eviction

I see many such changes in this patch that are not multi-queue specific.
They should not be here. If you really want these changes, put them in
a separate patch.

>  * Description:  %arg[1] evict test.
>  * Test category: functionality test
>  *
>  * arg[1]:
>  *
>  * @small:			small
>- * @small-multiqueue:		small multi queue
>- * @small-multiqueue-priority:	small multi queue priority
>  * @small-external:		small external
>  * @small-multi-vm:		small multi VM
>  * @beng-small:			small bind exec_queue
>@@ -569,6 +567,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  */
> /**
>  * SUBTEST: evict-%s
>+ * Functionality: eviction
>  * Description:  %arg[1] evict test.
>  * Test category: stress test
>  *
>@@ -584,15 +583,13 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
> /**
>  *
>  * SUBTEST: evict-%s
>+ * Functionality: compute VM eviction
>  * Description:  %arg[1] evict test.
>- * Feature: compute machine
>  * Test category: functionality test
>  *
>  * arg[1]:
>  *
>  * @small-cm:			small compute machine
>- * @small-multiqueue-cm:	small multi queue compute machine
>- * @small-multiqueue-priority-cm:	small multi queue priority compute machine
>  * @small-external-cm:		small external compute machine
>  * @small-multi-vm-cm:		small multi VM compute machine
>  * @beng-small-cm:		small bind exec_queue compute machine
>@@ -601,8 +598,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  */
> /**
>  * SUBTEST: evict-%s
>+ * Functionality: compute VM eviction
>  * Description:  %arg[1] evict test.
>- * Feature: compute machine
>  * Test category: stress test
>  *
>  * arg[1]:
>@@ -617,27 +614,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
> /**
>  *
>  * SUBTEST: evict-%s
>+ * Functionality: mixed threads eviction
>  * Description:  %arg[1] evict test.
>- * Feature: mixted threads
>- * Test category: functionality test
>- *
>- * arg[1]:
>- *
>- * @mixed-threads-small:	mixed threads small
>- * @mixed-many-threads-small:	mixed many threads small
>- * @mixed-threads-small-multi-vm:
>- * 				mixed threads small multi vm
>- * @beng-mixed-threads-small:	bind exec_queue mixed threads small
>- * @beng-mixed-many-threads-small:
>- *				bind exec_queue mixed many threads small
>- * @beng-mixed-threads-small-multi-vm:
>- *				bind exec_queue mixed threads small multi vm
>- */
>-/**
>- *
>- * SUBTEST: evict-%s
>- * Description:  %arg[1] evict test.
>- * Feature: mixted threads
>  * Test category: stress test
>  *
>  * arg[1]:
>@@ -655,8 +633,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
> /**
>  *
>  * SUBTEST: evict-%s
>+ * Functionality: compute mode threads eviction
>  * Description:  %arg[1] evict test.
>- * Feature: compute mode threads
>  * Test category: functionality test
>  *
>  * arg[1]:
>@@ -669,8 +647,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
> /**
>  *
>  * SUBTEST: evict-%s
>+ * Functionality: compute mode threads eviction
>  * Description:  %arg[1] evict test.
>- * Feature: compute mode threads
>  * Test category: stress test
>  *
>  * arg[1]:
>@@ -680,11 +658,31 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * @beng-cm-threads-large-multi-vm:
>  *				bind exec_queue compute mode threads large multi vm
>  */
>+
> /**
>  *
>  * SUBTEST: evict-%s
>+ * Functionality: mixted threads eviction
>+ * Description:  %arg[1] evict test.
>+ * Test category: functionality test
>+ *
>+ * arg[1]:
>+ *
>+ * @mixed-threads-small:       mixed threads small
>+ * @mixed-many-threads-small:  mixed many threads small
>+ * @mixed-threads-small-multi-vm:
>+ *                             mixed threads small multi vm
>+ * @beng-mixed-threads-small:  bind exec_queue mixed threads small
>+ * @beng-mixed-many-threads-small:
>+ *                             bind exec_queue mixed many threads small
>+ * @beng-mixed-threads-small-multi-vm:
>+ *                             bind exec_queue mixed threads small multi vm
>+*/
>+/**
>+ *
>+ * SUBTEST: evict-%s
>+ * Functionality: threads eviction
>  * Description:  %arg[1] evict test.
>- * Feature: threads
>  * Test category: functionality test
>  *
>  * arg[1]:
>@@ -699,8 +697,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
> /**
>  *
>  * SUBTEST: evict-%s
>+ * Functionality: threads eviction
>  * Description:  %arg[1] evict test.
>- * Feature: threads
>  * Test category: stress test
>  *
>  * arg[1]:
>@@ -712,6 +710,79 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * @beng-threads-large:		bind exec_queue threads large
>  *
>  */
>+/**
>+ *
>+ * SUBTEST: evict-%s
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Functionality: threads eviction
>+ * Description:  %arg[1] evict test.
>+ * Test category: functionality test
>+ *
>+ * arg[1]:
>+ *
>+ * @threads-small-multi-queue:	threads small multi queue
>+ *
>+ */
>+/**
>+ *
>+ * SUBTEST: evict-%s
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Functionality: compute mode threads eviction
>+ * Description:  %arg[1] evict test.
>+ * Test category: functionality test
>+ *
>+ * arg[1]:
>+ * @cm-threads-small-multi-queue:
>+ * 				compute mode threads small multi queue
>+ */
>+/**
>+ * SUBTEST: evict-%s
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Functionality: eviction
>+ * Description:  %arg[1] evict test.
>+ * Test category: functionality test
>+ *
>+ * arg[1]:
>+ *
>+ * @small-multi-queue:		small multi queue
>+ * @small-multi-queue-priority:
>+ * 				small multi queue priority
>+ * @small-external-multi-queue: small external multi queue
>+ */
>+/**
>+ *
>+ * SUBTEST: evict-%s
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Functionality: mixed threads eviction
>+ * Description:  %arg[1] evict test.
>+ * Test category: functionality test
>+ *
>+ * arg[1]:
>+ *
>+ * @mixed-threads-small-multi-queue:
>+ * 				mixed threads small multi queue
>+ */
>+/**
>+ *
>+ * SUBTEST: evict-%s
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Functionality: compute VM eviction
>+ * Description:  %arg[1] evict test.
>+ * Test category: functionality test
>+ *
>+ * arg[1]:
>+ *
>+ * @small-multi-queue-cm:	small multi queue compute machine
>+ * @small-multi-queue-priority-cm:
>+ * 				small multi queue priority compute machine
>+ * @small-external-multi-queue-cm:
>+ * 				small external compute machine multi queue
>+ */

Can we have one header for all these tests like 'SUBTEST: evict-%s-multi-queue'?
Or something similar?

Niranjana

>
> /*
>  * Table driven test that attempts to cover all possible scenarios of eviction
>@@ -735,9 +806,10 @@ int igt_main()
> 		unsigned int flags;
> 	} sections[] = {
> 		{ "small", 16, 448, 1, 128, 0 },
>-		{ "small-multiqueue", 16, 448, 1, 128, MULTI_QUEUE },
>-		{ "small-multiqueue-priority", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY},
>+		{ "small-multi-queue", 16, 448, 1, 128, MULTI_QUEUE },
>+		{ "small-multi-queue-priority", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
> 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
>+		{ "small-external-multi-queue", 16, 448, 1, 128, EXTERNAL_OBJ | MULTI_QUEUE },
> 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large", 4, 16, 1, 4, 0 },
> 		{ "large-external", 4, 16, 1, 4, EXTERNAL_OBJ },
>@@ -762,9 +834,10 @@ int igt_main()
> 		unsigned int flags;
> 	} sections_cm[] = {
> 		{ "small-cm", 16, 448, 1, 128, 0 },
>-		{ "small-multiqueue-cm", 16, 448, 1, 128, MULTI_QUEUE },
>-		{ "small-multiqueue-priority-cm", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY},
>+		{ "small-multi-queue-cm", 16, 448, 1, 128, MULTI_QUEUE },
>+		{ "small-multi-queue-priority-cm", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
> 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
>+		{ "small-external-multi-queue-cm", 16, 448, 1, 128, EXTERNAL_OBJ | MULTI_QUEUE },
> 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large-cm", 4, 16, 1, 4, 0 },
> 		{ "large-external-cm", 4, 16, 1, 4, EXTERNAL_OBJ },
>@@ -792,10 +865,16 @@ int igt_main()
> 	} sections_threads[] = {
> 		{ "threads-small", 2, 16, 128, 1, 128,
> 			THREADED },
>+		{ "threads-small-multi-queue", 2, 16, 128, 1, 128,
>+			THREADED | MULTI_QUEUE },
> 		{ "cm-threads-small", 2, 16, 128, 1, 128,
> 			COMPUTE_THREAD | THREADED },
>+		{ "cm-threads-small-multi-queue", 2, 16, 128, 1, 128,
>+			COMPUTE_THREAD | THREADED | MULTI_QUEUE },
> 		{ "mixed-threads-small", 2, 16, 128, 1, 128,
> 			MIXED_THREADS | THREADED },
>+		{ "mixed-threads-small-multi-queue", 2, 16, 128, 1, 128,
>+			MIXED_THREADS | THREADED | MULTI_QUEUE },
> 		{ "mixed-many-threads-small", 3, 16, 128, 1, 128,
> 			THREADED },
> 		{ "threads-large", 2, 2, 16, 3, 32,
>-- 
>2.43.0
>
