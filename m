Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7738EE9380A
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 02:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C8810E2F2;
	Mon, 13 Apr 2026 02:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FA1NAhiD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B3910E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 02:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776047398; x=1807583398;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CuQ/9KP+CMk8WKWWdDeTU6lkcOZDyeRZ2fSH1wvr8+0=;
 b=FA1NAhiD9U0FEkk5VJAdcEIpuqrbSWfhXPeosB8rXulVPEfYELdd4o8n
 hKIM237gwtDQ47D2XkzONdLqEMQk/UdbF317ddq7Y+d1vAFMCQb+xvyU0
 gKp8mz+elMc3hZLxIXAVM/PazXF/+VwIH8kPHTClbAkG/sFYUUYpJ9FIK
 38ebedIEm2xQY6sPzcvzimKOUtPhJouTjqiF0MvkXoyP/B3LZlcgBEzos
 Os5nPYN7lfTsCrWVDtOIfAf63NK5LLof0KlTIDtrUycNS8EQyiafnqZfe
 ZDs99AUeFuFQekC/y+EsLaQU7xloUWLkM7fZVvdIjaHPgb/jp6OLajzvp g==;
X-CSE-ConnectionGUID: 7jhFAer+QCKwm006+RynAw==
X-CSE-MsgGUID: 4ymgYQQXQfuGz/c6KwyVUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="87272675"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="87272675"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 19:29:57 -0700
X-CSE-ConnectionGUID: JXbGoUG9TZG1/pYEMbpU/w==
X-CSE-MsgGUID: j/m+HRxsSnyLaGcP59/AYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="253053693"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 19:29:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 19:29:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 12 Apr 2026 19:29:55 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 19:29:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iuplsePFCF+Cf72YaD1FIRYu1bLMtpmJreWAzrRFFs57kkiekFdwuMUzlJsi7JPp9HbWvYLJ7TZvAMQlOINStZ0WuqE2PBKITUwwgK6DrzC6oJOGCtj7duWDBZGDFnMIaTD6H0cvoVaS68QD//03SjqLkhK7IOIOYfpgElsbd/uSXf2dc59diCpC+UzCmRmzUEeqr8BzLFHhHl47lcQ6EsLFHdAwdXz+kTXpyGuLok4zIL8KVdTV4DiN/bPffBR/9GTVvQQZpJhFtSbETeNd00dv+Vt9TxhV93bDCtH3YbNhBVjjs92knGBIO7I6z+Jhdd6pzSFM//nin2qfG72baA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/go4CTNcLB6BrBGiYJvLNS4PZbF3uRi5M/qundxT04=;
 b=mfEgV4aTVyaLp62quk0jory4FNxq3SroQvQwLgv9ztzSWIstP+/PMTKy8l4gtsv+TmzVYBgiltK4IAlyU1f0yMPA3bOFwMabytH0VJ+4tleI/NjCf9pysf9bIi79i8DicyKBglQf18NEUo384BnICJFKMD2uNiElpDUzAJxSqA6gGvnMxLeVrwk3ebzOohdq3EonPJlJed9x3OqwV2RD47wdaosqkzmT9cbzDXrFVf3jpqsfcazRV5rpqEBYOerg/uv/BPATzSD41mlTM74Y59/nHCHbXUDsTir5L+ATEuPm/R3I+VsCVoZT/AxT68iDTvoUybo9Np1Ka6NUhTlDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.47; Mon, 13 Apr
 2026 02:29:52 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9769.018; Mon, 13 Apr 2026
 02:29:51 +0000
Date: Sun, 12 Apr 2026 19:29:49 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_exec_reset: Add a comment about
 return for syncobj wait
Message-ID: <adxVHTOVXhsrydLn@nvishwa1-desk>
References: <20260409203702.4350-1-stuart.summers@intel.com>
 <20260409203702.4350-2-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260409203702.4350-2-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::9) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CY5PR11MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d30c05-c2da-42ee-1e93-08de99048aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: zFBTq8XEo/p38ZHjLKaNwZyncG9WmAqtE+fZgWn6kJPt5vmgmsaeqY64rk2fpsIG9uOHnOrBN9xT714CAvEa5Rp1V0fSVPKAgoxbIMZge3TA/z/SC524A+v4vwxvzKn/G5V4IWx2Z+pMXXN2v8Ex1qce+xua+Nk3Hphcehvm6jQ8xQ9IxD8RHO/zEyo3Kb7FBeYZObEwrXsxZOh46Y9NgKDaM2mAudD8j0bxaU+/+zD4AZhOhphb4ueqfZ0UfqzGaVZ0nsN8JdX+0lijfYsXtN+TsaQ9A6aS3DpvgWkRnMgPa6cCnitcoPFhCG1CBBDmIN5V26d4Xd0zkJZWEJ1ki6nNFylAKsr/rJoRPVZKK4pJTYWKWAHpSUZqxhskL242PB+OcSwEhvHQaEZUZq9kLoeWlzeCPkDvi5DwXinWDCw+ViT+QI2qFsr8vDRmRE99CGdLhyhFMKOanVf9CxJzUYYK5XiWniHxeUnORHOhcDPpHzSvyYAg9ha5bEmKyTxrdWA2uhuv8AjVF65SnYBhTs4aP+sERJatMkGmFpEe3iYDTsaZw7nXKCNUXhTRTamFyKxZqRYECek6pPlkmWxMZKBXkAlkqcL2UVKHuM4ztZJUp+zH8+XOHu9VJkQ5FqdsjXyMr1IHcEBONZQEaIm8BaAzJa4IE6HFijSi5gGgmsNI2P1C2McO43rRg+UbBvr1jLwxhBPtgCn8nOUiqqIIyiugh+MBqTXqBCfFZVcWJXQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vb1BHYl2j3FfaRqcsBvb0pHp0kI146OBgLblF/iFIjyGawGfJuDhLHqN1tGY?=
 =?us-ascii?Q?FCYpsTyeX10w4vpELzMVmX/yVPKw6go5nl7Ca1hnL7Ik975pKOaD20UcIT6Y?=
 =?us-ascii?Q?3feXHJMSNReOap80yyd++YPpeGbO15bda3ctsg8Dw5Bz+2PzlDKy6yxOVvJd?=
 =?us-ascii?Q?QA1EoAhbA0IOxmt9l7wEdcDkuNlINb0z9Tob5/jGHOww03IIQW8ks7wEtnOb?=
 =?us-ascii?Q?7D2fJCNjiK5EzeUCBWXvw5HmmQcD022P28FZwPtTqHzLChimlPMDZtRrWilf?=
 =?us-ascii?Q?LKdoUZgjBH+0MYbArJf4NfWtMx96xoXGh8uQMIzrxMTQ2Xz8XUmMPptz3cuV?=
 =?us-ascii?Q?okYM5Ajt7g9puDGK6Jhw41tU0KVKbkUtNGIaW8Sf3ppV/6gMHZ1xGrqN9Yi/?=
 =?us-ascii?Q?a5CwecNJjabCW1XxACloHXptwY982Z/q9/IPoTOqFFaMCDn9aJrsFVfUBJ2s?=
 =?us-ascii?Q?UTLp1SZqFEnzJpoDHqVPQB46YkdTSMOAZgXFjYc4OXHpNi8kns484KddBQDL?=
 =?us-ascii?Q?KdiaI1GpaMXg1ZS2nIiktIel1hCjtAryOGVSRAes4NA6FcG3WlK4pkXAMv7e?=
 =?us-ascii?Q?ONNB2fo/yLPl6N+S61M7PpbbKy6WUZZN4+BVSikf5R6u3QYJFkOI4vqTDGeE?=
 =?us-ascii?Q?cm2WMeiqrglTwFjTuWuwTDG+H5JCxHy1eXhUXglkDNe6nN3HRuexoFCfZ3qu?=
 =?us-ascii?Q?dcLifj78C6LFh3FLZ06ysL/GnYp6zXDxJHFvBKexaduuq1jyJZwXwWY5k7qI?=
 =?us-ascii?Q?ooZzVQBsgHrsEm+UCvl2wgbRxaCrF95GtVPB2gp0blOBFSsbzJNm+nYfGFMO?=
 =?us-ascii?Q?CLSfyWorKLVg/Zo26uxA6nlR8mcvYK0+FwBsX6ZEDKo8/QUVnqVSx6zCu/SO?=
 =?us-ascii?Q?l6cktlFkzQMh5vXGNAazxhUApmQXtrhZQ/EeoJd7yy1idihijZsQGNsBHCf6?=
 =?us-ascii?Q?sSbJ92A21P58bjJVNdfxUtgp2ZNI+xDK9QSDNCuCNwLN4dALjIBSBdJonb5y?=
 =?us-ascii?Q?c99s+/PhqbITOg5BpVwOzWvn4vH7ygBnJN+Om8ktKPkLkOUH0Dbnci7qABAB?=
 =?us-ascii?Q?NWMCWJpCVAeDHdOl8FyMrc9wzASLjw+/wv8BO1Ah9dpt7c1bBaZvdAfvzscs?=
 =?us-ascii?Q?fwaIUb60InMePuDQNpHaY+t+pn8UJAbBrThktVDGuGceXbn/z3oTVfXkMy/V?=
 =?us-ascii?Q?8VcYqd3vKi3orzWufBjAkZLxgflUHHAsI56Cpx8ONpxoi+/msF+XXchI3ICu?=
 =?us-ascii?Q?bil2NK2cywd/npOJOYy6VWfud1B4K/NDo98WG42CzAgTER+oVkYDh3dtWHQG?=
 =?us-ascii?Q?sBBTNlCnCQnk0o06sYxHBVLCjWzekfaeYZUp0Nj/XxqS0b/qU6PNYJG3IoMx?=
 =?us-ascii?Q?9u7CFFNHtvzweBpS66gbpEzDYo54loG+P1t+6SOSxFgcGNED4umL+bkXau4q?=
 =?us-ascii?Q?Mf4BCs/xTfdrJnncFX0yLh2QusNsDxPa8eNh3VbZ+g20bWniRahStTv9iAcd?=
 =?us-ascii?Q?JDl7YS3DznnFv870NAFGBlu/Q/TQ7JNLZM1O1ND3qRUuZK0kEGH+uEgSbR1B?=
 =?us-ascii?Q?VE6rrhtXsgHwOHPbOIyVwcJ1euRscEDemg1Ww8ozTxUVCZKYY3NASEB5fVDh?=
 =?us-ascii?Q?6mG5fCbSPmCPZ7A2eycZU74dtZgm9wC99QTB3eB88QOfnpih5Xrx75zo96fQ?=
 =?us-ascii?Q?Lt4vlXlGYKEad8+tdJRSMb3bryO9JUFo/8X1bUiN79Epp5u5WWv2oxsTMKs1?=
 =?us-ascii?Q?7htyE79V9h5N3KnO59+2HzUjbaoW3ITDv3T2KqqZiJXVfb8V0rxV?=
X-Exchange-RoutingPolicyChecked: IOhVK2EHgIV3/K60Eb5HUP0FlvJ9H0GxFLmwS2g+1H7ZWdw2jk7EUX+AGwrO4Iyp2rNFj70ErgkdlyA5M+B/p45PZ77LTyVcEwUNLIbQIH5vwernkugxeTJnD3AQ9pyJkR6L0TnsF3A1fjiwSmS33On5K4kSdV4M8EGNqqmIS2dmK5WV+XvSZooBVG30WEWvLDyZ9gFCy1RD88qWLUZ+0VBvOjtqUdh08sUuzoVs0awvtyyTi4OZy4AU/Iy1KVEE6RnfM9DDNR4r6jHaC7dCf471ZJs+pUWcMaUzuEDU5ZkmWelYyOp/4pRFq/a4CuZozIDfsYZYDaHEo2aCIpE/rA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d30c05-c2da-42ee-1e93-08de99048aa5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 02:29:51.9273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTp/v6sHXA+qDoFY4Z/SrVd9b2vYa8q3yAiz5CdGthBGQLo0XDKL9GkoouUobpxrSeVoYf0XJh8fHj5l+ZdB0HmnNjfFuehC0GQk4nL7rAouJ/pBRxSFv31eyb0LQUw2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
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

On Thu, Apr 09, 2026 at 08:36:59PM +0000, Stuart Summers wrote:
>Add a comment to the syncobj wait after a hanging submission
>to indicate that even for the hang case, we expect the syncobj
>wait to return successfully as opposed to the wait ufence case
>where we only return successful if hardware did in fact execute
>the batch through the MI_USER_INTERRUPT to satisfy the wait ufence.
>
>Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>---
> lib/xe/xe_legacy.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
>index 084445305..6aeddc578 100644
>--- a/lib/xe/xe_legacy.c
>+++ b/lib/xe/xe_legacy.c
>@@ -181,8 +181,13 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		return;
> 	}
>
>-	for (i = 0; i < n_exec_queues && n_execs; i++)
>+	for (i = 0; i < n_exec_queues && n_execs; i++) {
>+		/*
>+		 * Expectation here is that on reset, submissions will
>+		 * still satisfy the syncobj_wait.
>+		 */
> 		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, NULL));
>+	}
>
> 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>

LGTM
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>-- 
>2.43.0
>
