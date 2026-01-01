Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C923AEEB572
	for <igt-dev@archiver.kernel.org>; Thu,  1 Jan 2026 00:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F3510E7ED;
	Thu,  1 Jan 2026 00:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlmNxKlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCC010E7ED
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jan 2026 00:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767226880; x=1798762880;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zSH+/p9On5VIiWx8zAG/2oQPIZYAVQFL5VVQr+SlHaQ=;
 b=HlmNxKlMYq1p5wU65LfTU0kh6W48fpUFXttwiBY7HZdvb0pVCxXAbfRH
 Hffj0NGHWvep8wSylSiJ9qQVjIw6DvzzOvUiZf7zT6A9/PLQLrPXP8YCW
 elfUBBl0jvx2tETdz9M1ss33pmbd+xReoud6yFYuGmlol4ucG+T2d28OJ
 cQ03+xwtWM8J1uyR1EWyzakMz4FiCBZKNgO20ErC13CqauIVpONnTyZih
 FUmgf4vPdXuOmpzLqMHiMZhLqWRTEHins7sX9fH2fCyPwWZUokXWuDJWr
 E/fvYlNwdoXN1dGDiLFCXk2i8JT0ICxsXMKwG2wLgGs6qLqt8TAxIYLdT Q==;
X-CSE-ConnectionGUID: e/A6+yw6QQup2zMffeAiUQ==
X-CSE-MsgGUID: 6h/yIM1PSH66JOKSUwEDqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="79091185"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="79091185"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 16:21:20 -0800
X-CSE-ConnectionGUID: Cimij3LkQH+fH3ul4ZHgfQ==
X-CSE-MsgGUID: AIjf7DDHQZiNGKshRKbXpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="205682153"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 16:21:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 16:21:19 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 16:21:19 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 16:21:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMD2GFOVrDg+xyvTQlnvkRYckRLtQtadPSUoKRq501qwi0yr+UX6AVeq+05PyAxKvjb7DZbzDNo4ZeZ2v3z6IzSSa2jDtEcG2F+HuP21yzgo8GG5ei8HpG1A9VfSOcHJakDC0AoFpfs9pLrNjtFDGPtfQaVvp01VUhxNUIH4FnkiAN9fbnaIS2vYgQ12SUxiqxYGyieoXs1OB0W0LtLNyTqwhs2r2q31BkjpsnjwPXBww7b5ArXX7l/kSAdfyqoOfc1UHd+5+vJU0GuagroE/lX8uZ6WOZL6KAZNTEosV+Oa1hCA2oFIXxgGUwB0MGTPezSqkZ0IsTYVSYTNH+f5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5chzG2ZH5ctp3VEpBQxNbA2rw/xCk32dLOsL/0Nl1NI=;
 b=ZrjKBn/2EC4qpYj0oWsB2Y3Lva/OmxpKXPfSNOfH1CHOynq7ZRsZSUCKgL8p4hCyqVNs5IFtWcZqKbdXa9iEU0JmgQWXx0l5+SGhFl6W9iNxsGuu/NVfMUXtBRbOtnQoijhcvxHp4FI5nVJx6b4Nl6AYPO0KUfyOdDqw4Tqx6nboytT4pFblPuHvRp+9IR7c0UiGAI4GwjpbHxJWiSomezOodqnxWVB5sVzhd+U/Li46aCUg2gVkgoRXE7/LcW8H76qTfrzwpm6ywWTKdJ1ypKCys/krpC5HupTRf5bBy2wnY4BntUWKOSY7oPy9A9rgs/UG+Pxb3Y4vWSPHzqxdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA4PR11MB9444.namprd11.prod.outlook.com (2603:10b6:208:563::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 00:21:12 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9456.008; Thu, 1 Jan 2026
 00:21:06 +0000
Date: Wed, 31 Dec 2025 16:21:03 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/7] tests/intel/xe_evict: Add basic multi queue test
Message-ID: <aVW972BYDfDXJMXz@nvishwa1-desk>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-3-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251219120154.695287-3-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BY3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:254::10) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA4PR11MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: cad9457f-48c6-4c2f-e220-08de48cba795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rg+CcU3rIsNha2fitXur5gKsStKNI/dMDcKV8C1I020tOEI+V0Vh0PfEiJDw?=
 =?us-ascii?Q?sFutJnLRa2hr34Wkvuro7rnHXRyHsp2AiPwqQz1sdHyfuzwnjzsZzi3OHmen?=
 =?us-ascii?Q?hb6V9wJy6kE8g5qe26jv0TwWmJTjKOhoH6J8VUg9w38C6wBcJTivlsVKzKCN?=
 =?us-ascii?Q?/ronp7CBfoXFhO/tN31JgkjMa+NF5PnaGa5sah79+tZf9a+4jvXbb+dpqDWG?=
 =?us-ascii?Q?IKDgu2GD7+hw1PT3zyqlGKHkbY8Wz67B/+HvJv1Wn4I2AYw9j2gEaQkEICDk?=
 =?us-ascii?Q?eICClTZwI5fDReayTEDlF6k+hTFO8kWRcw9p02LPQx1YyseIcoqT9e68C4nN?=
 =?us-ascii?Q?fdFamomA/biUGbeF77xhmjvIBfqNxi/g5AHeIZRHj1jHEsRX87A8kSs3Zk+y?=
 =?us-ascii?Q?GJGVxQllxZX+L4qT27XpxBKmYpEDMQx+ILTPQC7P5vErRWamPo7T23EROXg5?=
 =?us-ascii?Q?ONuAEOft3MtumJDi4pWkia13CVKefIRUOJ97RYhHmN+OZhEqbitoa/5ULX/v?=
 =?us-ascii?Q?IfMrsh/wKayVRp4N//4wgUZGEVo7GoAPeUbAwwu1hI78aMmkMPb1g1v0fRd/?=
 =?us-ascii?Q?GY/G7aIKJE2SgvV7aKF/14/3J71t1rp/ZcrOFw2cZA5ZgUQExw5jiwHrvnId?=
 =?us-ascii?Q?Bp349DeBSrCFrBY6Mr5wSQLZ1zmRS1c69Hr1nYrdPgB8MuJMN2R7ZJwQUnSd?=
 =?us-ascii?Q?QIGGwp1TGfJqdbESjiW12Q6qOCrjLySLwqpm5wS1OwrpT3n8F1aX7paY0MLE?=
 =?us-ascii?Q?ENU3p3gwMgKsDX4tnIclxT8NF5SQEJ15YawZoatMuYPt/5qQxRkoUjBaHe5R?=
 =?us-ascii?Q?7g23hcNgvCbk/6SuWtmdJA7usU5BO7o9lAXI74dYjMbBTFrVH2r0Wz4yYD+P?=
 =?us-ascii?Q?J7V4UlL5jxUaCwgUWmpPqxXNG0dwxN0Cn2firkAY5XQzK6fcWy6XdqmegAJ4?=
 =?us-ascii?Q?csfLcR47GebD7q4kkN+/JkBE+wE/QYM+2gsD+Y956aKPJGiNaNgvO1YcE7S4?=
 =?us-ascii?Q?RFsnje9BiDJt+04PRnqRN9kcvnvnPTeMzS3b3ftSkV+7IXopaxIUYIbwGY+q?=
 =?us-ascii?Q?hptn0TElvWo6Tt7Gd2hBi2Uxvz9bUXUw4/k+I3FQy8CLpKlGifduSZnGTNV2?=
 =?us-ascii?Q?V7LuoLk/kD5qgB36i1eXawt5hGMJjFUyWcS/ZH8nBtLM798uPY475yesoh8n?=
 =?us-ascii?Q?NvVR6hboRWa+fz+hoviaJQSFfCgp8KemVlowBih3WKhQ74lJJ96RsXa81NqQ?=
 =?us-ascii?Q?hvEOsMXbcgmKt+RlY4SHSTeZFn7LLjZ79HMOgMfP7urSDKUvzwjdLje9qK2/?=
 =?us-ascii?Q?KnuMuXTpN3vGFveq2cfX7gf6k385Dy3VYOa0D83FMZI/Zb0EpF3jfcPlA7Tk?=
 =?us-ascii?Q?TG7gEY6bWmeBrMSbrdl0OS/aTwWNcpNwtV+8Yk45EUR16Gbdwpz9tWlE95vK?=
 =?us-ascii?Q?20nlGoRnXv2/MsxXcn05uv+2cF7MOLa8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1RJFIvma/2gO0oEeFEHKKF50qd/YnNCgWQBkcBV5qPFIzPj80S4oDI6cvKCC?=
 =?us-ascii?Q?7Y4iWCdka65S2gLVTNMjeHnSmuOk1uD5w8D5fcbzL88rsDsBM7/2PjYeFGn2?=
 =?us-ascii?Q?vkHT9HfSWqVSHeVITJg+Y9H286ChmpVnywku1VZD3nz49w7k5uzvIW+toH7k?=
 =?us-ascii?Q?+oVInu3X3b4c0Nh6lhJNomfbkFWikHP1daVRaUWVMgMP73EI+a6O8rZMe1zx?=
 =?us-ascii?Q?Y8zWEl+BPldrp4TAHuFQkoXJN7sDHRBD2Y7ybFuz0kGU2gmZ8d8U8qdYrWNc?=
 =?us-ascii?Q?SDtwjSAfvifUehZy0TKjuPw5YSKtiaJ/DGrVyUO1ISt4dr3Ozzs7mqVlMLKE?=
 =?us-ascii?Q?noIf54rhQ7JX4fVXpb9W0/KzzcJSL5S7hA/GFHAD/K/RKQ42tdHYmtTS9O7/?=
 =?us-ascii?Q?xtgaiSpAun5iRdcdZzM6F0zvNedW6vIv/K4iEth8fvIjt30DHGIsBQpeOQMA?=
 =?us-ascii?Q?p0HchBvwGRhEGd/6MOD6IN9+iRg2HTgwuwTAyJkrpOItci4nrw+9+wLaj2yj?=
 =?us-ascii?Q?0E9gUldTQyrFCAHt4HDVj0/Sr+XQ4gzc1dGrPJbXEK21CIEJf9SVY4pWnc+K?=
 =?us-ascii?Q?KmI6COVfN/rAnlbP4T2+0or9pAQngz4tc1BTXijwO6PcfupPWavGJIZoG/UA?=
 =?us-ascii?Q?FCBkmriMY+mCF+3xJFrvwhMUjAJotZ0YI+M029IEAfDKv4ITIggZArbWICD8?=
 =?us-ascii?Q?uCpeYIBpWHGPz8vEFzHBhFVvp9qg+Dfrw2FvH8J9CmGfgEaX+n5Yp4GV5Gl6?=
 =?us-ascii?Q?3/MurLL0Mq3ELk8l6WnHANqZMQCOlXtcmtqA5UT+BAOEH1KZ+HKy15hQT6Vg?=
 =?us-ascii?Q?VN8LmEAmsByZ2O/HnrhbEa0e5fRd8SlhyqPOJ/fH+OjB/gU3p3ANGFA8P+y/?=
 =?us-ascii?Q?Spb5dKfSG/Zb+0d/Z3Nh9D55Kz2xFY2zQ4Wod+2e5zVaHJkLhvsmuWSS16Iz?=
 =?us-ascii?Q?aI3D/IROwlyZgpc5iprcXHNbDr8Noo3503ctz/0VJoYra3UGyTFAFXFhena8?=
 =?us-ascii?Q?Ct4IoY+XkNnExOgGhTMv78QyISxKbCgtcqglF9otMbZgaY7r5btfxNn/WGKU?=
 =?us-ascii?Q?MYW7wce5rp/M3YK2h2dafqpxK3zvYwDPBn3ahr4RYguh9P4PrgZbKJjOfxhA?=
 =?us-ascii?Q?/aJ/AZ/G+slyaKY7Fsd2/GkpGBzNFXMjZZk6lDyPlNfA0n2CetKwgmR4hymx?=
 =?us-ascii?Q?UaFeWIcDlo3BhFvDHZlQwRQWv7NrRzpDSQenz3y3TMh3VD8MoGJ88ZP5jKG+?=
 =?us-ascii?Q?uEmgQoPVpmVfraSJZ+JMrACeYGgLK/lCJLEGFTeyHySluF2uTl/+BFRycYnO?=
 =?us-ascii?Q?lKZfxtHGi8a1ePPwGxd6/baB5Hf7n6wSTGiukeG5r7VRSMtVzgo4lY+OMX3k?=
 =?us-ascii?Q?wxT4R+unAOusyd7x2N5GRe3kfcpWrtYudXexYESl6wjzbMAV2B6rAWf/YgO1?=
 =?us-ascii?Q?aoZxPA+Mos/dKg68trAwDJbr5ct9Ffz4lyCH2YHFlm0gr96ArnKeu6UzJjLy?=
 =?us-ascii?Q?MwmkHnf3KB0cH9GAu9MSJtJgMLa8CVn7JvZdVixR8Iz+C8Xm434K26o5eIjL?=
 =?us-ascii?Q?osUq/EJYMak2tBwSkNuFrfmwzMEA+RV5PvoMJhee+SBQeMA6ftYiB+XfgZuO?=
 =?us-ascii?Q?CD4JN1hAawVvTF2Hr4wahBkoVF2WVfbRKczjWooCPh/cDgfdHwxdRr05sSDt?=
 =?us-ascii?Q?r3DXzNLp2mmwaFdJv2czEXfFoYDoXal0N4apbd+QdAbjgzg6ufcxVHRssftz?=
 =?us-ascii?Q?terbhdB21z1jQEvshOtCm1uYCXXccNxPhSx60SIZ0AbxSlGv2muv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cad9457f-48c6-4c2f-e220-08de48cba795
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 00:21:06.2522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqfcGJThNEzPqpDQKNQnFnLC76Df0ommK+ueZQYmE/+VaOQ9RvXfiluOhEzJZ1Zb7RDb//UiYzaRULAoIGWLTyMmFtC1l3rK/n4aZwN2pbs4kPNbZCWQIQzTKWNZ0wXt
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

On Fri, Dec 19, 2025 at 05:31:49PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Added basic multi queue test for small buffer objects.
>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>---
> tests/intel/xe_evict.c | 62 +++++++++++++++++++++++++++++++++++-------
> 1 file changed, 52 insertions(+), 10 deletions(-)
>
>diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
>index 2350487c8..a62230ec6 100644
>--- a/tests/intel/xe_evict.c
>+++ b/tests/intel/xe_evict.c
>@@ -29,6 +29,7 @@
> #define COMPUTE_THREAD		(0x1 << 4)
> #define EXTERNAL_OBJ		(0x1 << 5)
> #define BIND_EXEC_QUEUE		(0x1 << 6)
>+#define MULTI_QUEUE		(0x1 << 7)
>
> static void
> test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>@@ -80,7 +81,18 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
> 		if (flags & MULTI_VM)
> 			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 : vm ,
> 						      eci, 0);
>-		else
>+		else if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multiq = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+			uint64_t ext = to_user_pointer(&multiq);
>+
>+			multiq.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
>+							     ext, &exec_queues[i]), 0);

Do not use name 'multiq', instead use multi_queue to be consistent.

>+		} else
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> 		syncobjs[i] = syncobj_create(fd, 0);
> 	};
>@@ -259,7 +271,18 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
> 		if (flags & MULTI_VM)
> 			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 :
> 							      vm, eci, 0);
>-		else
>+		else if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multiq = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+			uint64_t ext = to_user_pointer(&multiq);
>+
>+			multiq.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
>+							     ext, &exec_queues[i]), 0);

Same here.

>+		} else
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> 	}
>
>@@ -516,6 +539,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * arg[1]:
>  *
>  * @small:			small
>+ * @small-multiqueue:		small multi queue

Same here and below. Use multi-queue to be consistent
instead of multiqueue.

>  * @small-external:		small external
>  * @small-multi-vm:		small multi VM
>  * @beng-small:			small bind exec_queue
>@@ -546,6 +570,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * arg[1]:
>  *
>  * @small-cm:			small compute machine
>+ * @small-multiqueue-cm:	small multi queue compute machine
>  * @small-external-cm:		small external compute machine
>  * @small-multi-vm-cm:		small multi VM compute machine
>  * @beng-small-cm:		small bind exec_queue compute machine
>@@ -678,7 +703,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  */
> int igt_main()
> {
>-	struct drm_xe_engine_class_instance *hwe;
>+	struct drm_xe_engine_class_instance *hwe, *multi_queue_hwe = NULL;
> 	const struct section {
> 		const char *name;
> 		int n_exec_queues;
>@@ -688,6 +713,7 @@ int igt_main()
> 		unsigned int flags;
> 	} sections[] = {
> 		{ "small", 16, 448, 1, 128, 0 },
>+		{ "small-multiqueue", 16, 448, 1, 128, MULTI_QUEUE },
> 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
> 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large", 4, 16, 1, 4, 0 },
>@@ -713,6 +739,7 @@ int igt_main()
> 		unsigned int flags;
> 	} sections_cm[] = {
> 		{ "small-cm", 16, 448, 1, 128, 0 },
>+		{ "small-multiqueue-cm", 16, 448, 1, 128, MULTI_QUEUE },
> 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
> 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large-cm", 4, 16, 1, 4, 0 },
>@@ -820,6 +847,9 @@ int igt_main()
> 		xe_for_each_engine(fd, hwe)
> 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
> 				break;
>+
>+		xe_for_each_multi_queue_engine(fd, multi_queue_hwe)
>+			break;
> 	}
>
> 	for (const struct section *s = sections; s->name; s++) {
>@@ -829,9 +859,13 @@ int igt_main()
> 					     1, s->flags);
>
> 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
>+			if (s->flags & MULTI_QUEUE) {
>+				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+				igt_require(multi_queue_hwe != NULL);
>+			}

May be also assert that s->flags do not have MULTI_VM flag set.
Same applies to below sections as well.

Niranjana

> 			igt_skip_on_f(!ws, "System memory size is too small.\n");
>-			test_evict(fd, hwe, s->n_exec_queues,
>-				   min(ws, s->n_execs), bo_size,
>+			test_evict(fd, s->flags & MULTI_QUEUE ? multi_queue_hwe : hwe,
>+				   s->n_exec_queues, min(ws, s->n_execs), bo_size,
> 				   s->flags, NULL);
> 		}
> 	}
>@@ -843,10 +877,13 @@ int igt_main()
> 					     1, s->flags);
>
> 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
>+			if (s->flags & MULTI_QUEUE) {
>+				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+				igt_require(multi_queue_hwe != NULL);
>+			}
> 			igt_skip_on_f(!ws, "System memory size is too small.\n");
>-			test_evict_cm(fd, hwe, s->n_exec_queues,
>-				      min(ws, s->n_execs), bo_size,
>-				      s->flags, NULL);
>+			test_evict_cm(fd, s->flags & MULTI_QUEUE ? multi_queue_hwe : hwe, s->n_exec_queues,
>+				      min(ws, s->n_execs), bo_size, s->flags, NULL);
> 		}
> 	}
>
>@@ -857,9 +894,14 @@ int igt_main()
> 					     s->n_threads, s->flags);
>
> 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
>+			if (s->flags & MULTI_QUEUE) {
>+				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+				igt_require(multi_queue_hwe != NULL);
>+			}
> 			igt_skip_on_f(!ws, "System memory size is too small.\n");
>-			threads(fd, hwe, s->n_threads, s->n_exec_queues,
>-				min(ws, s->n_execs), bo_size, s->flags);
>+			threads(fd, s->flags & MULTI_QUEUE ? multi_queue_hwe : hwe,
>+				s->n_threads, s->n_exec_queues, min(ws, s->n_execs),
>+				bo_size, s->flags);
> 		}
> 	}
>
>-- 
>2.43.0
>
