Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3517BC5DF81
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 00:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73E310E10F;
	Thu, 20 Aug 2026 00:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z21smjWm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0B410E10F
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 00:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787187255; x=1818723255;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OEPGtsjUYY/WO37XZw3Tzb/300fdBX7U4q5BmO3EYCQ=;
 b=Z21smjWmcBSnILYE1uklSWmpBW4kfZVetWIOB29MHuZ/IS2xrw0Ufyi0
 oYtoj2d0r1a/niHplqteB+CnPd3YhVOK7zlo8up26HAUz0JcxcAidP44h
 PmJ9WmNmiUgWKSwf7fr0NTsc0beiiJfGLh5H3reUi6iTIvXLuRnVXoP26
 VE114KUel1A1UPDgex5bzoTwpUU0VVUXScLdPFzl8wgI2amyrz7lKxm8s
 fI7w4Q1TKDQBns7eGQPy1qGgO2iKBEDT0bJK3mAja7Bxila2/W7ipKbH0
 TfbV5rrHjwm4oKcr0K+B4p4oORZFjH5Fvy8Iscz87a4py7FILja3yUBCC A==;
X-CSE-ConnectionGUID: tmpkpCE2SXa8nyhkKLG2oA==
X-CSE-MsgGUID: ZBHJ3HeXSkiUeX7CHeZNQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="90231850"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="90231850"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 17:54:15 -0700
X-CSE-ConnectionGUID: IlUOnav2Rn6kUYizDm3G1Q==
X-CSE-MsgGUID: jCOJ3k0fSiCj99tHT5dUZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="263109680"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 17:54:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 17:54:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 17:54:14 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 17:54:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FY9CHCmQdwBx9QNcZJbBufCT7WFR6k33sMev62FBUcDt4QRddRoPo6AQ6i06lkeiLUXDn3WbIRPdknDAsf0/QHJhIjZ/t/RSxWx6kT50O0vK1cuSJG1NvR8neF/NcXgHwkYaEtk+so1FSDjJ1EDVUE+9v9hDvABQBMPScqjKkerhrCQ6cIh02GUar8kTLebXjDQe7wjqg3g12brujZRnpvu28HmGITwedS61uxONYXusebcQPDDRmYhH7XyfTPx5ItzmfiFXnSoBqOvxRuJ3j62JsoFy+acfqrZKjVZHJUmuE9ANlN0waMHdAcvP73JDC4103i2IcJsdP+JFijop9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEb6TK51kKtyCPc0Z0C5KWPWSpwudGXJMiT8hLr45Ho=;
 b=wDURDwGROOWMDN5ovSmx1HNur8PpFxLYB9BlTA2b+UtBO12zUeVvwN9uBQyKbRYEmFVfCPNqF+SdOAgIivnKhO3jtOm4wdqUWcgbq3gOeeWpqK7f+cZw683YLe26v8GAsf9D/eNzMs5uLc6RQ6o2dg1z9fCA6txpQ8u3+z+pUGvb7WwHDorn7Ci/9Um0v7Jxoc2Csdp85wODBQNFtVdpzs7TrjZcjjpD/IvPfQdV6d32Rei5L9vuXUkrj2ra1vY45NZw5n2qlQCjn/OZ4MJBh1P16+omqcyxvCl5Cdfx1+DshiNs600xzYuPaPwWrOBLP9op/sI4/ZXsGwaC2Shbaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CY8PR11MB7745.namprd11.prod.outlook.com (2603:10b6:930:90::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 00:54:12 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 00:54:11 +0000
Date: Wed, 19 Aug 2026 17:54:09 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t, v2] tests/intel/xe_exec_mix_modes: Add multi-queue LR
 spinner switch subtest
Message-ID: <aoZQMe_KU3vF33hI@nvishwa1-desk>
References: <20260819193926.4442-1-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260819193926.4442-1-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ2P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::8) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CY8PR11MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: cb37d541-096a-4773-be6e-08defe558c7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|6133799003|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: Aq5HKdDafxhXwuqXFZae0CgJ5s1L+Lq+GlrSy4cINv49ZaTrmpGaNIS4KMLagyloB1NM2QWHzEwTZtK91qzRIKx+2LES4v/dy+v/6LKy6b6Dyga2ClWBzvKhtjRbfWrzsglKAdAeeHKW2eugfoHqgtxiac9yMqApJkG1xXAJrbZancQQo7Qk1yHmASp83kyMXL48crkSCvBCKBSyaqk9ojeMSYEmnYxF0uwZYDZ8vP3X0S81J6wMlZtLXdUSMNwH0tFaoGEbiqWfX3lpfEJl2R74uRlw+7mWk0jNQEFaTt9pQBAEI5yyMczBFRSbD61GttJ9dQRu8yZfqp32gdGJ8okTrM3sd3nFhONR8R/rxIOnc/auhvnr2mo7A5FIInZJ6cMBsLniqOALixlssbbbQAEwC0Iil4ARs+BISXr5xdhZ8YlY62kZLXLbUP5FdKDeU2OyPXQZAj4AWNeWrDFDRUJhZ6bw3o743PHOAHjQMXTa2W8hlf7iCnKssuNIYtP6vd6qhB2auUXWJszyEB9CiudbnYnZorCqCd+zJCaRwYRD5A1EpDJ4OcpaKP4T0ofS1/32UrPQQeQp1N49k8vHpPGUse0pB8Hez0iZPq1vUn1uy6khM33D6r/Iz1ilK0qWBrizSpmJyjM7A9qWEbuttwoE3wX/Y2gpxKP9oceYwko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(6133799003)(56012099006)(18002099003)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2VfSQoBpaAXGcsI6cLod41qNCop2EuMOIkJcO2Az20/0/HP3e9+i4VA3UXlr?=
 =?us-ascii?Q?ghcGQUC7p1SNCtX6JaVabGxhvZOhDWi0fw5490ZF5611aqeqyKw2YAAum5pX?=
 =?us-ascii?Q?95d0oatNdlzrk/TYmep51rtAqkbWW9kxbq6ieVc1ENF9uX9marHvHLABEBz4?=
 =?us-ascii?Q?rwKkRo3uogjOPica7sJtd/NpEoLsM4m4knHlbhqRsAlllb+0dKUPl3DwmZZd?=
 =?us-ascii?Q?48AhgtTBNIMCoWVQeKww1e6iOWSlsAlhlb9lyIKeicYKizNEYBN/xlODNLHP?=
 =?us-ascii?Q?QLeH1489CP6y4bKC3iquqdvLGLMtp++YBQZosGz73bvj3qYBLSIpJawVdSoS?=
 =?us-ascii?Q?y5KN00/tLuNqn4OLGni2MHcJZxodHPRdIQM+XUL08cO/V//8gypVAY5mAuGI?=
 =?us-ascii?Q?/pQkiaiBceLJL7dEN6msZyB1YSgOKkTyW56bhXIhujZ92Mq0FTFt7Zu/YXwP?=
 =?us-ascii?Q?2S0rUwyJPMQYvp2p2EL877KObolK3rUm4RyqRm//+kuxeC6xMXG/LLV+5yxf?=
 =?us-ascii?Q?0e4SaPFxZ5KSQFiV5KV27zTXRl0jlPFDfn5Ky49VXgUhiH28WBzf134zxqbj?=
 =?us-ascii?Q?inmbHOglb2LEuoTN05WhwrltfjExMsOWy9EPH9epMDIyoRBezxa96CGk/sz0?=
 =?us-ascii?Q?2c7Mgp76ldDCGMecqis7NDDnNIh3l4bWVxvUgXqSDey/75zAa8pU6A8L1erh?=
 =?us-ascii?Q?QECCFoUO7gA/OPcAELX52e3JkQBvcsW7lWi6DumVeapzNp5yxj1/w1SoLyvS?=
 =?us-ascii?Q?GAABkmdU/VMKn8HzWbbTpj/mAWilgpfmmrv2jAr6ubQyR0sUkQ38kf7UByda?=
 =?us-ascii?Q?UbqIpP/j56FU/6kqA9j/ZaHZja6BHrWqu9X0IM1YljwH+VJeMqiU3zrYRZFk?=
 =?us-ascii?Q?daSR2h4EkSrEPzYZOSyHI7g7RoiEtAOHMAAGKWfypCuczxp76YPzlHgmjaz+?=
 =?us-ascii?Q?tqLRrvwrDQ/eUuerE7INPgOWSQmAeiv5DO5j1Nu1VhSxFgmBWIUHFIk7Fdjf?=
 =?us-ascii?Q?XhtegGexEqsFxhLle91k5a8Uo+MSBVO/M3Zkr/PjSptXQEC4MAAcdHk6ZL+S?=
 =?us-ascii?Q?IT/WlbWZAU1X0h2FaSn1nRsPphGd1PTYjecajatG4LnfEtyXBCONlwZ+iPfk?=
 =?us-ascii?Q?/zIUzdPVYlIjzQYH3i1Ln/RbhDGi3QwZRlMMANlpN02C1b2cjITDBx7WMsUd?=
 =?us-ascii?Q?AI8PUed8qk2gSxJ3tccCy5rYDob+6Jj4MdUhZGbB+Jr3YBcBjzVsRU86JYLY?=
 =?us-ascii?Q?UJFoQRERl+yjxnqATCS5HUyD5OECcZ0mgsmZCh/u0Mz2nI0WxIfwFaDVV6EM?=
 =?us-ascii?Q?yXvGcywQtM4LNoAwseNiS7tx7/nL80WMxNIrLWja0WPOBffxrvRwjk8EkeTo?=
 =?us-ascii?Q?89mGxCSUgpwol2VFcuG8ox1lz8R2+OlKvppaLZoR75YNoxDGLgsIBHaoRxrT?=
 =?us-ascii?Q?aJWfzsL63AXUriLBSUzOFHQNLHnlUZITebWrzraYMuElPol9hCa8FEPp+Pt4?=
 =?us-ascii?Q?3qa9AUOEucU1FW/CASpEjLyPwgjVDkK0KnbajPdkXpva0b7KdtCwpLoVQw0j?=
 =?us-ascii?Q?YEXwLeS3fAiiQgsLuprqbPqbMM+39Pc62KTK/xhUlMPSwKi3fjHtKU+MBnzf?=
 =?us-ascii?Q?qF3xcHbodptTzKxMK0M1a4Y37zyO9Vn8KRR7ymRCBJstuRAmf0ejhKxtpdod?=
 =?us-ascii?Q?cVTTBfPLzlzctYDbNzJXwHtD0GkUU1M93xdR4+65oF5ooSYBDoUw1XqvLIUt?=
 =?us-ascii?Q?32DyeBR1+Qjdg/xcxpc63/M66WZBFBwugFbq5bjKlPlAhpXLn2Y+?=
X-Exchange-RoutingPolicyChecked: Tfb/Uld7lVvEzMKWqQPob6pt+8ppiEfT8zShpAteFKdiTZBsVwc9ozyTodEeR6HugVYJlhC1SF83GF7psj3RCaUKnX+Wf9tpNdI0S6zki0r96piY3/LmVG5u0DUKdal0aj7ui5LpbXIGcRjbU7yndK5vrsMPy/uAZ+1KnSDbiDtdDGjwkGOktPHLfoMjgSdBn64HcfNEDsHxMwOYt0l9AiyAC1bRS+Ip+nCMaMjkxhc3urv/MEKFIDVuSdvuiY9unFn8pDLKET01lIcdkJgyzAblGZA/589Lu4NhW3736xMpVYJxIEe7/k1pY9r/kpqN8Cn4Kd3SSeGXNnKPFVzhgg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb37d541-096a-4773-be6e-08defe558c7d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 00:54:11.7540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XG4JOmTIGVUQpGApNQyLbzTgKxv8PECTylBzgNzw2n0kg9rsCuLvX7QVLcZH+5bxbEM0LguMDeOPSsYbOmVC/CIabpqatmmNtyL/BnPB4xOsjMXMyfScIA7Ls7/VhvCb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7745
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

On Wed, Aug 19, 2026 at 07:39:26PM +0000, Jagmeet Randhawa wrote:
>Add exec-multi-queue-spinner-interrupted-lr, which runs preemptible
>spinners on every queue in a multi-queue exec queue group in long
>running mode, then submits a dma-fence job on the same engine to force
>the group from FAULT into DMA_FENCE mode.
>
>Each spinner uses a multi-queue switch point (multi_queue_switch) so it
>yields the shared engine to its sibling once scheduled, instead of
>busy-looping and starving the rest of the group. This lets every queue
>in the group be genuinely resident when the interrupting job forces the
>mode switch, exercising suspend/resume of the secondary queues rather
>than just the primary.
>
>The dma-fence and LR (preempt) multi-queue suspend/resume paths are
>already covered by the userptr-invalidation tests; this adds the
>missing FAULT-mode coverage.
>
>v2: (Niranjana)
>- Use a plain multi_queue_switch point; drop xe_spin_preempt_wait/nowait().
>- Drop the redundant "still pending" ufence check before ending the spinners.
>- Move the capability check to test_exec() and assert FLAG_EXEC_MODE_LR.
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> tests/intel/xe_exec_mix_modes.c | 101 ++++++++++++++++++++++++++++++++
> 1 file changed, 101 insertions(+)
>
>diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
>index 209825f58..373058277 100644
>--- a/tests/intel/xe_exec_mix_modes.c
>+++ b/tests/intel/xe_exec_mix_modes.c
>@@ -27,6 +27,7 @@
>
> #define FLAG_EXEC_MODE_LR	(0x1 << 0)
> #define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
>+#define FLAG_MULTI_QUEUE	(0x1 << 2)
>
> #define NUM_INTERRUPTING_JOBS	1
> #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>@@ -34,6 +35,7 @@
> #define SPIN_DATA		1
> #define EXEC_DATA		2
> #define DATA_COUNT		3
>+#define N_GROUP_QUEUES		2
>
> struct data {
> 	struct xe_spin spin;
>@@ -221,6 +223,92 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> 	xe_vm_destroy(fd, vm);
> }
>
>+static void
>+run_job_multi_queue(int fd, struct drm_xe_engine_class_instance *hwe)
>+{
>+	struct drm_xe_sync sync = {
>+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>+		.timeline_value = USER_FENCE_VALUE,
>+	};
>+	struct drm_xe_exec exec = {
>+		.num_batch_buffer = 1,
>+		.num_syncs = 1,
>+		.syncs = to_user_pointer(&sync),
>+	};
>+	uint32_t exec_queues[N_GROUP_QUEUES];
>+	struct xe_spin *spin[N_GROUP_QUEUES];
>+	uint64_t addr[N_GROUP_QUEUES];
>+	uint64_t base_addr = 0x1a0000;
>+	int64_t fence_timeout = NSEC_PER_SEC;
>+	uint64_t vm_sync = 0;
>+	size_t bo_size, spin_size;
>+	uint32_t vm, bo;
>+	void *map;
>+	int i;
>+
>+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>+			      DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>+
>+	/* exec_queues[0] is the primary, the rest join its group. */
>+	for (i = 0; i < N_GROUP_QUEUES; i++) {
>+		struct drm_xe_ext_set_property multi_queue = {
>+			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+		};
>+		uint64_t ext = to_user_pointer(&multi_queue);
>+
>+		multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+		exec_queues[i] = xe_exec_queue_create(fd, vm, hwe, ext);
>+	}
>+
>+	spin_size = xe_bb_size(fd, sizeof(struct xe_spin));
>+	bo_size = spin_size * N_GROUP_QUEUES;
>+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, hwe->gt_id),
>+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>+	map = xe_bo_map(fd, bo, bo_size);
>+	for (i = 0; i < N_GROUP_QUEUES; i++) {
>+		spin[i] = (struct xe_spin *)((char *)map + i * spin_size);
>+		addr[i] = base_addr + i * spin_size;
>+	}
>+
>+	sync.addr = to_user_pointer(&vm_sync);
>+	xe_vm_bind_async(fd, vm, 0, bo, 0, base_addr, bo_size, &sync, 1);
>+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
>+	vm_sync = 0;
>+
>+	for (i = 0; i < N_GROUP_QUEUES; i++) {
>+		/* Yield the shared engine at a switch point instead of busy-spinning. */
>+		xe_spin_init_opts(spin[i], .addr = addr[i], .preempt = true,
>+				  .multi_queue_switch = true);
>+		sync.addr = addr[i] + (char *)&spin[i]->exec_sync - (char *)spin[i];
>+		exec.exec_queue_id = exec_queues[i];
>+		exec.address = addr[i];
>+		xe_exec(fd, &exec);
>+		xe_spin_wait_started(spin[i]);
>+	}
>+
>+	/* Force the group from FAULT into DMA_FENCE mode. */
>+	run_job(fd, hwe, EXEC_MODE_DMA_FENCE, SIMPLE_BATCH_STORE, false, NULL);
>+
>+	for (i = 0; i < N_GROUP_QUEUES; i++)
>+		xe_spin_end(spin[i]);
>+
>+	for (i = 0; i < N_GROUP_QUEUES; i++)
>+		xe_wait_ufence(fd, &spin[i]->exec_sync, USER_FENCE_VALUE,
>+			       exec_queues[i], fence_timeout);
>+
>+	sync.addr = to_user_pointer(&vm_sync);
>+	xe_vm_unbind_async(fd, vm, 0, 0, base_addr, bo_size, &sync, 1);
>+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
>+
>+	for (i = 0; i < N_GROUP_QUEUES; i++)
>+		xe_exec_queue_destroy(fd, exec_queues[i]);
>+	munmap(map, bo_size);
>+	gem_close(fd, bo);
>+	xe_vm_destroy(fd, vm);
>+}
>+
> /**
>  * SUBTEST: exec-simple-batch-store-lr
>  * Description: Execute a simple batch store job in long running mode
>@@ -235,6 +323,11 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
>  * SUBTEST: exec-spinner-interrupted-dma-fence
>  * Description: Spin in dma fence mode then get interrupted by a simple
>  *              batch store job in long running mode
>+ *
>+ * SUBTEST: exec-multi-queue-spinner-interrupted-lr
>+ * Description: Run preemptible spinners on a multi-queue exec queue group
>+ *              in long running mode, then get interrupted by a simple
>+ *              batch store job in dma fence mode
>  */
> static void
> test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
>@@ -243,6 +336,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
> 	enum engine_execution_mode engine_execution_mode;
> 	enum job_type job_type;
>
>+	if (flags & FLAG_MULTI_QUEUE) {
>+		igt_assert(flags & FLAG_EXEC_MODE_LR);
>+		igt_require(xe_engine_class_supports_multi_queue(fd, hwe->engine_class));
>+		run_job_multi_queue(fd, hwe);
>+		return;
>+	}
>+
> 	if (flags & FLAG_EXEC_MODE_LR)
> 		engine_execution_mode = EXEC_MODE_LR;
> 	else
>@@ -267,6 +367,7 @@ int igt_main()
> 		{ "simple-batch-store-dma-fence", FLAG_JOB_TYPE_SIMPLE },
> 		{ "spinner-interrupted-lr", FLAG_EXEC_MODE_LR },
> 		{ "spinner-interrupted-dma-fence", 0 },
>+		{ "multi-queue-spinner-interrupted-lr", FLAG_EXEC_MODE_LR | FLAG_MULTI_QUEUE },
> 		{ NULL },
> 	};
> 	int fd;
>-- 
>2.43.0
>
