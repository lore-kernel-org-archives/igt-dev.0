Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1078CD98E2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 17:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4953210EAA9;
	Wed, 17 Jun 2026 17:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aK18PJ6F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7453A10EAA9
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781717097; x=1813253097;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kH2OJOB24OblWRIsnw+X/8K3E9jHieO5mGGkngPJlHc=;
 b=aK18PJ6FEZg/scs1HRICPjajrrvhW329AOg3uRwdBmBSj7v9lwgIn8Ml
 EV79cQfZODi+YvNxJuJ+C5FohxnZmCNCUaXD6115PmtqtaqwPiFJYtV/u
 nNeJbg17wcY7chVRNV/Sxfh9MhJYhHOc2Fj3UUlye7NhYRGsC3ljapDOK
 m/hMNgHG8V57gYr2cWaB7QE8LZmTfjBMwN7yfeCvH9elvppC+2lz0Bn9e
 vM49NDxg6z6NzHrCerSx5N4qTlAWFRGWbC6dJ4Prd2xGBc8YDjmJJfpaD
 TyP26SuqaPBr0fZziBxXahgqkTnbhrrba+ieHHbVaUeudPV5nSNZ2pJlh Q==;
X-CSE-ConnectionGUID: CkYkcPirQ2WDyW67cIU6Yw==
X-CSE-MsgGUID: 9A9yy8uwSgCFEl/+UJuuXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="81514408"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="81514408"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 10:24:57 -0700
X-CSE-ConnectionGUID: oCNjcSdVRECcV6eODUQMmg==
X-CSE-MsgGUID: kXl1D7DfRjOd11cMDMrCog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="245741726"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 10:24:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 10:24:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 10:24:56 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 10:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syeJHv67s/m9L7Of5rT6fVaPk6ip4Qild6qeNgNGJEVsPsRtUgRT6W4hTAHsgaB1YpO8fWt1u0hwJgBmzU0+CcSj/u+yNEkeOmoBpXpWg252IqdNJW3q/8FUPO+ZlrBllhHFiLxbMLT791YO8Z1lZNBHwYVCB9R7zbDd52g1zzBa4Sai4hiugBv6TB65ocrJIK17xDzXL9wIwctHx1HxThO8maB96pTliIEr0cPcWeAlxDnN6Qg4qEiqKEA3O/QHRwZoeHT1/wHxo8dWHsdxb4t4t/0gqSuiFojSJ4mVGZLDTV0x6pF4uYTf2xKOipQAGQkI+A7ppF8wdmMI6Y5EIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYh78XJhq64/NUrYHJdw0BtdhQP2SOp51ZtgE/M9jMU=;
 b=OR4LOd/c9kI+G5aC1wCr0Lq9TOTrkt7C6YkTEBi21IuzdslUyGZFhmEpX4/4VuliulsZq+hJQrRfueZxL/2VIItu6JuOS8fDfUvnkA+Y0HcmjM673gaPXJDZ1zrUJSSiFMPV+Z2nHaWPgzqnlo3uf1LqRh8Xq1uyF2YU8Mjl2I0YwPJycFN9ESjz5H2p1de2ReROvKWJYfGvwZZBM92bNSfIvQhzuXJ9uVHY4vr53FGtsr+k7RPg2XAxLmHbZAV0ieHm4I6ojsvLsL0SGjVu6Q/g/GsrCxFb9geoTFq2k4CWFIhTDdoapw6tl35WEcPkSKE2OBdJMrjiwQjpDsLTXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS0PR11MB6472.namprd11.prod.outlook.com (2603:10b6:8:c0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Wed, 17 Jun 2026 17:24:54 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 17:24:54 +0000
Date: Wed, 17 Jun 2026 10:24:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <ramadevi.gandi@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe*.c: Add documentation to
 multi-queue tests and subtests.
Message-ID: <ajLYY_n7bLRFMqe4@nvishwa1-desk>
References: <20260617083549.1347431-4-priyanka.dandamudi@intel.com>
 <20260617083549.1347431-6-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260617083549.1347431-6-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::29) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS0PR11MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c9f88c-ba90-4417-4790-08decc955875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 22LqMKhJyJU8652asiVr/Rz+We5C4pGq6kC5eH8q+CJ75ICz5pn7HHWqwGalTYO9WfhS1mVZWrqdrQWHUJWNYtmnXLyIiZHUm1YUsmPBAsKu444X/2p5niddoEQJaXk65Bduj3zy4JHwzdEdi63WQqWEa2fWF+2nVurRNDZa2+JgndCgH0YDfhNVTpzdmtVj7Uwlqeorxon3WmY3qLDS3+63nsz1kURSZ4wdp9AdX+qVtgAVhqzzaBJm+lnVMRsgIrmsGcEyW9yoUHTaakpGub6IDvVpCu3BadSx93Bvn3JAUD3bjXzRUhj2qqMWWn6aer5MdugGvuEcvGdrYhG5k96Y9jWB0oY1D8orkNEE1g1fSJcFlnux91orbYUS0kaMBNqrE8aWQjTiem77bTIN1IA9KJ5Po3vV/kty84YqCrvJH++mj1yTfFlCbYvUTZYWpOlrVtKNTddj+ZVoEIH9GhKbGusvRaIEfs2kDPs8MJ4Om6igd7vQZiBW3RBOrV/KGoldOjCbPcWyKboh8/yp02CLvEvo+QMXArfDANTGti8+JpSMjrzKjQbAQEYEKdHu+AcHt1Am93z5WKhKLY7CXA6Y6GWaPKs2m5NvpIuPpgg4kQ1u6Bbuyd0GY5krQ1dv7X9o7yjQwFTW1vKzpXW1G20XGbvFcZQp6zyxdeCrlw7g0ZYpaReYH6MAMEt5a3iM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?samTL4P1TlxzejyNDQ18yKmuQLFKL5VkNhVpDd9Y8rgS54h99CXkrK74JaoZ?=
 =?us-ascii?Q?OLz5c7ND5UihwPieF3ck1Z73/cqMHNcBaertzEACo6sWCbKw359W9mq+2NMk?=
 =?us-ascii?Q?jw8MYyDcurBGzHBHU8WFuUaSr8OwkaRQb3FPVtRevpvde5YVw2tbiFktipPH?=
 =?us-ascii?Q?qHxBNPezeUApsCAzowJ5LH/jv01v7RMkZ3FGZlyNAogq5vJ+X+eQsTGBUi/2?=
 =?us-ascii?Q?tCprentryuKTOnItBpf7sf1ewYNrPtCne8NgYmNsfkfAYvAmyGL1qQlo5lYj?=
 =?us-ascii?Q?bvle75zeMWK6Gx5ofd1zsH3Wmy/3pe+R55MPq8hR7hrNB8TVo8YvAsFIWAUZ?=
 =?us-ascii?Q?J5FwU7Rw4xUGk64G9Iuf7oF3ocUN3sLvzlgliD6FmR66P07y7GjnUt3WD+Xr?=
 =?us-ascii?Q?QDlMxlX9UsQdEfSKNLUZBDLrvyZcL8wcg/IyG0E507wBZE79OVyAVp14ELWO?=
 =?us-ascii?Q?zDz4iKYkDFlHWut3/QVHhw5j8JsXKcLwoaQExo5sYNI4L/+I4xtrE2TOkxob?=
 =?us-ascii?Q?6BxkHYqW8KEDwN0Nbj4cAqL+OdmD15e3k0IjofISaYvVDDnACNU/PoynvkD+?=
 =?us-ascii?Q?dr6V44kOaoFlvebPLhrmBx0KASdH3b2nHQ0PQHr0+1pv9ySwsAJBnRSDiNnc?=
 =?us-ascii?Q?3F24JMLOJdiZI0pDjbDH3oje4XS5u8bkTnWivY79gTwYwK7ZrsLujgA/LH2l?=
 =?us-ascii?Q?Mpjd+uAJQ+N+Hpxh7Q+VznFanZiUU6d/rXEA5uxzDtKVx8M+4xZLFzDwzFFr?=
 =?us-ascii?Q?QEXCCoX0kP1oRP8Rb8s2ADyLdQF4iDJDloc09COqxsLtC7jhMz+xkvB41fuC?=
 =?us-ascii?Q?7LCCf2kKHpZv1DuO7cvaRd9S9+b59Apt3orwv6QQjFnrt/usHBv/mu4fOkmL?=
 =?us-ascii?Q?NiQ73VrZXc9u/TFhMbLC3mvJXOrOGd2skGAzbdNFBNAJuIiuWzKLoWRwBrDp?=
 =?us-ascii?Q?gt7uuoOW8wruPVrjAnhtaRB4DMd1w5TVLGeO8V9uAHv0CxKhps1I6Qvx4J+0?=
 =?us-ascii?Q?is/5SNmtyFW14IsJsIZ0IaO3YZK2ZUaKnEdJMQIY7lpFDWG+pgE50li25WeO?=
 =?us-ascii?Q?mcibvrCALliTFnVXjdLfA6JWSmt7AW+rlXeo2hEw7HKNB5ZVFmcokcTeIoR1?=
 =?us-ascii?Q?MLP1XqMsSYsUWGBCVN1i+JgEq+b0BSp4PXOJVuVBdHKlazSAlgIGFuNd4ae0?=
 =?us-ascii?Q?skkqScg0AlNN2cwNIXUM7Guy2wwW+RPxXrvsh4CMZCYGNoge5iz1FjtA9r34?=
 =?us-ascii?Q?U2T2WtslIVptA7WD1RiqPjYzJK1Bg3sKSK4+obfECl6//nxBr8rl1YHwudjt?=
 =?us-ascii?Q?3AYwCmhIx+iVcsTg7sW78zAytaSCzp7rlNr/e15GQMAf8idnRYIMBHEQxKjk?=
 =?us-ascii?Q?xCAvzNu2wMePaL5nlqkd77UcSuy5M+ri6vHg33JpS6iBGn6KvI28luBu4/Vf?=
 =?us-ascii?Q?rVbkqyGo4IqvTgHgZL4yGdl1g+0LzBcI5QlLTsP7ae6MDsciu571XOpfmvij?=
 =?us-ascii?Q?OHYXJVErlJ3aB8yDYPCDNN3qFzNmTSgFiWL5J+LdWAPk0NGQoKvyNKxLrOrH?=
 =?us-ascii?Q?LWUlvyAiEDK39mskZ4sVo8ZwuqRVMYLAiJudFYACDUEdjQWPayxr87qqsfUD?=
 =?us-ascii?Q?WIXTmAuwzyjNtXBVBehMYkCowST/ZiOm8zz3ZxUeHPKfzBA+Xs9jUrRc2ivo?=
 =?us-ascii?Q?eJNB8QrDCXNEiGuy6Ktx/fhXcGIcNOLkSeBO15TUCFF7AFEvM+TWldp3BdFP?=
 =?us-ascii?Q?0LqWz3tztGFdHQH4Hf9EIYnEnd0+KfQZMmj+G3EYSKzxMSoMahD+?=
X-Exchange-RoutingPolicyChecked: GbV47Wcc57dnzsk6aqIbPPjBWzl0Uns4nbok99bgZWjOOD4YwnP02M5cZ9HCLo4W8g1OOS6op9HqKk3rfmdbpYntPR6o/v4pRNbW3QyZBl8ndKpsEp+dpv+l3F/CSAYlauUTdZyNS/JLVBAS1AGLvmuj+N9vOKof5gGXzNV3thx+sZkpoYPH4+EzL9mfN6bx3AivuqAFR9qs8KIaQk5gm6rbN2UvNhIwp4sZI3DhJBanie6aKd6HZuYV2O4OKrwy1bkSvgCGZVy29X/XStkdbrFdXcdu+o0vc8gJIIVvgJ+sS6eeUiiyRTJeOUa+xgqZuw7AYkOvEd0SImZNuOH7EQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c9f88c-ba90-4417-4790-08decc955875
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 17:24:54.1628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6T/E+AGfiHj1ICF9Tb2m7LRgun4yvipXzrO5NKggKfU9kyi67lLemLMmFKwMN4rFrnOif0mcs8/q3lsv6FK9RM13alyBmjm+ibijgNnq7be3olnpYzq+0lDnMkgoDhIv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
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

On Wed, Jun 17, 2026 at 02:05:52PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Add Mega feature and Sub-category fields to multi-queue tests and subtests.
>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>---
> tests/intel/xe_evict.c           | 72 ++++++++++++++++++++++------
> tests/intel/xe_exec_fault_mode.c | 81 ++++++++++++++++++++++----------
> tests/intel/xe_exec_reset.c      | 28 +++++++++++
> tests/intel/xe_exec_threads.c    | 44 ++++++++++-------
> 4 files changed, 167 insertions(+), 58 deletions(-)
>
>diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
>index 82a6cde0a9..70cfa11bbb 100644
>--- a/tests/intel/xe_evict.c
>+++ b/tests/intel/xe_evict.c
>@@ -559,11 +559,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * arg[1]:
>  *
>  * @small:			small
>- * @small-multi-queue:		small multi queue
>- * @small-multi-queue-priority:
>- * 				small multi queue priority
>  * @small-external:		small external
>- * @small-external-multi-queue: small external multi queue
>  * @small-multi-vm:		small multi VM
>  * @beng-small:			small bind exec_queue
>  * @beng-small-external:	small external bind exec_queue
>@@ -593,12 +589,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * arg[1]:
>  *
>  * @small-cm:			small compute machine
>- * @small-multi-queue-cm:	small multi queue compute machine
>- * @small-multi-queue-priority-cm:
>- * 				small multi queue priority compute machine
>  * @small-external-cm:		small external compute machine
>- * @small-external-multi-queue-cm:
>- * 				small external compute machine multi queue
>  * @small-multi-vm-cm:		small multi VM compute machine
>  * @beng-small-cm:		small bind exec_queue compute machine
>  * @beng-small-external-cm:	small external bind exec_queue compute machine
>@@ -629,8 +620,6 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * arg[1]:
>  *
>  * @mixed-threads-small:	mixed threads small
>- * @mixed-threads-small-multi-queue:
>- * 				mixed threads small multi queue
>  * @mixed-many-threads-small:	mixed many threads small
>  * @mixed-threads-small-multi-vm:
>  * 				mixed threads small multi vm
>@@ -668,8 +657,6 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  *
>  * arg[1]:
>  * @cm-threads-small:		compute mode threads small
>- * @cm-threads-small-multi-queue:
>- * 				compute mode threads small multi queue
>  * @cm-threads-small-multi-vm:	compute mode threads small multi vm
>  * @beng-cm-threads-small:	bind exec_queue compute mode threads small
>  * @beng-cm-threads-small-multi-vm:
>@@ -700,7 +687,6 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  *
>  * @threads-small:		threads small
>  * @beng-threads-small:		bind exec_queue threads small
>- * @threads-small-multi-queue:	threads small multi queue
>  * @threads-small-multi-vm:	threads small multi vm
>  * @beng-threads-small-multi-vm:
>  *				bind exec_queue threads small multi vm
>@@ -722,6 +708,64 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * @beng-threads-large:		bind exec_queue threads large
>  *
>  */
>+/**
>+ * SUBTEST: evict-%s
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>+ * Description:  %arg[1] evict test.
>+ * Test category: functionality test
>+ *
>+ * arg[1]:
>+ *
>+ * @small-multi-queue:		small multi queue
>+ * @small-multi-queue-priority:	small multi queue priority
>+ * @small-external-multi-queue: small external multi queue
>+ *
>+ * SUBTEST: evict-%s
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>+ * Description:  %arg[1] evict test.
>+ * Feature: compute machine
>+ * Test category: functionality test
>+ *
>+ * arg[1]:
>+ *
>+ * @small-multi-queue-cm:	small multi queue compute machine
>+ * @small-multi-queue-priority-cm:	small multi queue priority compute machine
>+ * @small-external-multi-queue-cm:	small external compute machine multi queue
>+ *
>+ * SUBTEST: evict-%s
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>+ * Description:  %arg[1] evict test.
>+ * Feature: mixed threads
>+ * Test category: functionality test
>+ *
>+ * arg[1]:
>+ *
>+ * @mixed-threads-small-multi-queue:	mixed threads small multi queue
>+ *
>+ * SUBTEST: evict-%s
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>+ * Description:  %arg[1] evict test.
>+ * Feature: compute mode threads
>+ * Test category: functionality test
>+ *
>+ * arg[1]:
>+ * @cm-threads-small-multi-queue:	compute mode threads small multi queue
>+ *
>+ * SUBTEST: evict-%s
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>+ * Description:  %arg[1] evict test.
>+ * Feature: threads
>+ * Test category: functionality test
>+ *
>+ * arg[1]:
>+ *
>+ * @threads-small-multi-queue:	threads small multi queue
>+ */
>
> /*
>  * Table driven test that attempts to cover all possible scenarios of eviction
>diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
>index 3e92dfbd9a..23a1c31301 100644
>--- a/tests/intel/xe_exec_fault_mode.c
>+++ b/tests/intel/xe_exec_fault_mode.c
>@@ -78,14 +78,6 @@
>  *					bindexecqueue userptr invalidate
>  * @bindexecqueue-userptr-invalidate-race:
>  *					bindexecqueue userptr invalidate race
>- * @multi-queue:			multi-queue
>- * @multi-queue-userptr:		multi-queue userptr
>- * @multi-queue-rebind:			multi-queue rebind
>- * @multi-queue-userptr-rebind:		multi-queue userptr rebind
>- * @multi-queue-userptr-invalidate:
>- *					multi-queue userptr invalidate
>- * @multi-queue-userptr-invalidate-race:
>- *					multi-queue userptr invalidate race
>  * @basic-imm:				basic imm
>  * @userptr-imm:			userptr imm
>  * @rebind-imm:				rebind imm
>@@ -101,15 +93,6 @@
>  *					bindexecqueue userptr invalidate imm
>  * @bindexecqueue-userptr-invalidate-race-imm:
>  *					bindexecqueue userptr invalidate race imm
>- * @multi-queue-imm:			multi-queue imm
>- * @multi-queue-userptr-imm:		multi-queue userptr imm
>- * @multi-queue-rebind-imm:		multi-queue rebind imm
>- * @multi-queue-userptr-rebind-imm:
>- *					multi-queue userptr rebind imm
>- * @multi-queue-userptr-invalidate-imm:
>- *					multi-queue userptr invalidate imm
>- * @multi-queue-userptr-invalidate-race-imm:
>- *					multi-queue userptr invalidate race imm
>  * @basic-prefetch:			basic prefetch
>  * @userptr-prefetch:			userptr prefetch
>  * @rebind-prefetch:			rebind prefetch
>@@ -124,17 +107,63 @@
>  *					bindexecqueue userptr invalidate prefetch
>  * @bindexecqueue-userptr-invalidate-race-prefetch:
>  *					bindexecqueue userptr invalidate race prefetch
>- * @multi-queue-prefetch:		multi-queue prefetch
>- * @multi-queue-userptr-prefetch:	multi-queue userptr prefetch
>- * @multi-queue-rebind-prefetch:	multi-queue rebind prefetch
>- * @multi-queue-userptr-rebind-prefetch:	multi-queue userptr rebind prefetch
>- * @multi-queue-userptr-invalidate-prefetch:
>- *					multi-queue userptr invalidate prefetch
>- * @multi-queue-userptr-invalidate-race-prefetch:
>- *					multi-queue userptr invalidate race prefetch
>  * @invalid-fault:			invalid fault
>  * @invalid-userptr-fault:		invalid userptr fault
>- * @multi-queue-invalid-fault:		multi-queue invalid fault
>+ */
>+/**
>+ * SUBTEST: once-%s
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>+ * Description: Run %arg[1] fault mode test only once
>+ * Test category: functionality test
>+ *
>+ * SUBTEST: twice-%s
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>+ * Description: Run %arg[1] fault mode test twice
>+ * Test category: functionality test
>+ *
>+ * SUBTEST: many-%s
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>+ * Description: Run %arg[1] fault mode test many times
>+ * Test category: stress test
>+ *
>+ * SUBTEST: many-execqueues-%s
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>+ * Description: Run %arg[1] fault mode test on many exec_queues
>+ * Test category: stress test
>+ *
>+ * arg[1]:
>+ *
>+ * @multi-queue:                        multi-queue
>+ * @multi-queue-userptr:                multi-queue userptr
>+ * @multi-queue-rebind:                 multi-queue rebind
>+ * @multi-queue-userptr-rebind:         multi-queue userptr rebind
>+ * @multi-queue-userptr-invalidate:
>+ *                                      multi-queue userptr invalidate
>+ * @multi-queue-userptr-invalidate-race:
>+ *                                      multi-queue userptr invalidate race

Here and elsewhere, may be we can add one more tab instead of going to next line?
Also, all tests start with 'multi-queue', may be include that in SUBEST tag as
now we have seprate definition for it (like SUBTEST: many-multi-queue-%s).
That will also reduce the test name length here. Same applies elsewhere also.

Niranjana

>+ * @multi-queue-imm:                    multi-queue imm
>+ * @multi-queue-userptr-imm:            multi-queue userptr imm
>+ * @multi-queue-rebind-imm:             multi-queue rebind imm
>+ * @multi-queue-userptr-rebind-imm:
>+ *                                      multi-queue userptr rebind imm
>+ * @multi-queue-userptr-invalidate-imm:
>+ *                                      multi-queue userptr invalidate imm
>+ * @multi-queue-userptr-invalidate-race-imm:
>+ *                                      multi-queue userptr invalidate race imm
>+ * @multi-queue-prefetch:               multi-queue prefetch
>+ * @multi-queue-userptr-prefetch:       multi-queue userptr prefetch
>+ * @multi-queue-rebind-prefetch:        multi-queue rebind prefetch
>+ * @multi-queue-userptr-rebind-prefetch:
>+ *                                      multi-queue userptr rebind prefetch
>+ * @multi-queue-userptr-invalidate-prefetch:
>+ *                                      multi-queue userptr invalidate prefetch
>+ * @multi-queue-userptr-invalidate-race-prefetch:
>+ *                                      multi-queue userptr invalidate race prefetch
>+ * @multi-queue-invalid-fault:          multi-queue invalid fault
>  * @multi-queue-invalid-userptr-fault:  multi-queue invalid userptr fault
>  */
>
>diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>index 9f5fde1a74..e41c663342 100644
>--- a/tests/intel/xe_exec_reset.c
>+++ b/tests/intel/xe_exec_reset.c
>@@ -350,9 +350,13 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  * Description: Test long spinners with many preemptable jobs, use queues again spinners complete on media GT
>  *
>  * SUBTEST: multi-queue-long-spin-many-queue-switch
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test long spinners with many jobs with multi-queue switching
>  *
>  * SUBTEST: multi-queue-long-spin-reuse-many-queue-switch
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test long spinners with many jobs with multi-queue switching, use queues again once spinners complete
>  *
>  * SUBTEST: gt-reset
>@@ -383,42 +387,66 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  * Description: Test compute mode close exec_queues close fd
>  *
>  * SUBTEST: multi-queue-cat-error
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test cat error with multi_queue
>  *
>  * SUBTEST: multi-queue-cat-error-on-secondary
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test cat error with multi_queue
>  *              on a secondary queue
>  *
>  * SUBTEST: multi-queue-gt-reset
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test GT reset with multi_queue
>  *
>  * SUBTEST: multi-queue-cancel
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test engine reset with multi_queue
>  *
>  * SUBTEST: multi-queue-cancel-on-secondary
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test engine reset with multi_queue
>  *              on a secondary queue
>  *
>  * SUBTEST: multi-queue-close-fd
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test close fd with multi_queue
>  *
>  * SUBTEST: multi-queue-close-execqueues
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test close execqueues with multi_queue
>  *
>  * SUBTEST: cm-multi-queue-cat-error
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test compute mode cat error with multi_queue
>  *
>  * SUBTEST: cm-multi-queue-cat-error-on-secondary
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test compute mode cat error with multi_queue
>  *              on a secondary queue
>  *
>  * SUBTEST: cm-multi-queue-gt-reset
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test compute mode GT reset with multi_queue
>  *
>  * SUBTEST: cm-multi-queue-close-fd
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test compute mode close fd with multi_queue
>  *
>  * SUBTEST: cm-multi-queue-close-execqueues
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>  * Description: Test compute mode close execqueues with multi_queue
>  */
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index 2f44d5555d..894fa49bff 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -1203,6 +1203,14 @@ static void *thread(void *data)
>  *	balancer mixed fd userptr invalidate
>  * @bal-mixed-fd-userptr-invalidate-race:
>  *	balancer mixed fd userptr invalidate race
>+ */
>+/**
>+ * SUBTEST: threads-%s
>+ * Mega feature: Multi-Queue
>+ * Sub-category: Multi-Queue tests
>+ * Description: Run threads %arg[1] test with multi threads
>+ *
>+ * arg[1]:
>  * @multi-queue-basic:
>  *	multi-queue basic
>  * @multi-queue-userptr:
>@@ -1244,49 +1252,49 @@ static void *thread(void *data)
>  * @multi-queue-fd-userptr-invalidate-race:
>  *	multi-queue fd userptr invalidate race
>  * @multi-queue-hang-basic:
>- *     multi-queue hang basic
>+ *	multi-queue hang basic
>  * @multi-queue-hang-fd-userptr-invalidate-race:
>  *	multi-queue hang fd userptr invalidate race
>  * @multi-queue-mixed-basic:
>  *	multi-queue mixed basic
>  * @multi-queue-mixed-userptr:
>- *	multi-queue-mixed userptr
>+ *	multi-queue mixed userptr
>  * @multi-queue-mixed-rebind:
>- *	multi-queue-mixed rebind
>+ *	multi-queue mixed rebind
>  * @multi-queue-mixed-userptr-rebind:
>- *	multi-queue-mixed userptr rebind
>+ *	multi-queue mixed userptr rebind
>  * @multi-queue-mixed-userptr-invalidate:
>- *	multi-queue-mixed userptr invalidate
>+ *	multi-queue mixed userptr invalidate
>  * @multi-queue-mixed-userptr-invalidate-race:
>- *	multi-queue-mixed userptr invalidate race
>+ *	multi-queue mixed userptr invalidate race
>  * @multi-queue-mixed-shared-vm-basic:
>  *	multi-queue mixed shared vm basic
>  * @multi-queue-mixed-shared-vm-userptr:
>- *	multi-queue-mixed shared vm userptr
>+ *	multi-queue mixed shared vm userptr
>  * @multi-queue-mixed-shared-vm-rebind:
>- *	multi-queue-mixed shared vm rebind
>+ *	multi-queue mixed shared vm rebind
>  * @multi-queue-mixed-shared-vm-userptr-rebind:
>- *	multi-queue-mixed shared vm userptr rebind
>+ *	multi-queue mixed shared vm userptr rebind
>  * @multi-queue-mixed-shared-vm-userptr-invalidate:
>- *	multi-queue-mixed shared vm userptr invalidate
>+ *	multi-queue mixed shared vm userptr invalidate
>  * @multi-queue-mixed-shared-vm-userptr-invalidate-race:
>- *	multi-queue-mixed shared vm userptr invalidate race
>+ *	multi-queue mixed shared vm userptr invalidate race
>  * @multi-queue-mixed-fd-basic:
>  *	multi-queue mixed fd basic
>  * @multi-queue-mixed-fd-userptr:
>- *	multi-queue-mixed fd userptr
>+ *	multi-queue mixed fd userptr
>  * @multi-queue-mixed-fd-rebind:
>- *	multi-queue-mixed fd rebind
>+ *	multi-queue mixed fd rebind
>  * @multi-queue-mixed-fd-userptr-rebind:
>- *	multi-queue-mixed fd userptr rebind
>+ *	multi-queue mixed fd userptr rebind
>  * @multi-queue-mixed-fd-userptr-invalidate:
>- *	multi-queue-mixed fd userptr invalidate
>+ *	multi-queue mixed fd userptr invalidate
>  * @multi-queue-mixed-fd-userptr-invalidate-race:
>- *	multi-queue-mixed fd userptr invalidate race
>+ *	multi-queue mixed fd userptr invalidate race
>  * @multi-queue-cm-basic:
>- * 	multi-queue cm basic
>+ *	multi-queue cm basic
>  * @multi-queue-cm-fd-basic:
>- * 	multi-queue cm fd basic
>+ *	multi-queue cm fd basic
>  * @multi-queue-cm-userptr:
>  *	multi-queue compute mode userptr
>  * @multi-queue-cm-rebind:
>-- 
>2.43.0
>
