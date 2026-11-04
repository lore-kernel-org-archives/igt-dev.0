Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8D1606A32E
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 18:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m4qlxc/x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4878010E5F5;
	Wed,  4 Nov 2026 18:25:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E48310E5CE
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 18:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793816641; x=1825352641;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lO9SsAQzaz3ogz/FcM4foRUv3rcgTQ1jor/PBHQg2T0=;
 b=m4qlxc/xR3Y8snC7nXzmGcrF4xSMT08yyHtPrAwvvWl/JAwISFw9nJBc
 emQnK6NcFG82Teuk3I9ANs1VpaccOJqLlXPwfJ8PxFYpCKYdhTs/KeORf
 gGsrlm80BXhkteJo24yV39eofCCAendn+zEUJQCfUGLygZgrE703NS+r6
 CpjKfHYQbRyG78mvOh9w6KAmNCn9KI/7Op9LRs2FRt0BGh2A91y51xVwa
 jZ65OQ2F8QuQqR237AXowO3g0FlgEyoNbJO6ZfqY5w2loqOoxh7kKN62T
 9oJmjPhg1Cs30bCGX9dttg0yE6fDx2WQFmw2asglqYBqKKVC0cvWJC7ln w==;
X-CSE-ConnectionGUID: FAY4xBk2SzicH/NHtGGAaQ==
X-CSE-MsgGUID: +ZnXmLmCTAGtqVLrmm+/kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2456631"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2456631"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 10:24:00 -0800
X-CSE-ConnectionGUID: YHFLUxeXTg+UHRESMDZSTQ==
X-CSE-MsgGUID: BIdqlhd3RviXGMNG4KlFvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6687861"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 10:24:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 10:23:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 10:23:59 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 10:23:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1v3/9Vx8A4Qz5IriSYluILgTMa18MSWxSILVzeRfj7Z1/nXGXd83Sxpu6CTlJp8awv4Jnlp0n5fCkp/pSKa86dxVXGJP39ev50JqYJ/EzN9zHE/RutPWRLIxymhFqAz8MU14wNn0Mdan5BqkoMK5COGaZCgBa1za6KrWsgFoxruwZvYX6UQdKc/Hm+9a+LuTKBgom7OMz/enZwIkRKXi+9TnACgvLGMHAzKJUa0GMDn9NW5pC66Sjf2yDhSDzxH6vMEdtP8NV23JL+JlZqM8SmoZSlUWA4xy8cKKZwyR6XWLxNikf8i4BNvPuF2uYC7Trpzq5sI8pZaQnC+d6czRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzrYdf81TXSO7PZ773rp+JSt/PiAifuSh3Eqy+BgxQw=;
 b=SKpohvRcZF/L4rgnolOrv/HluksqNVBfCLZC8vZvRbfT2iFg9yCO4IwPE/LubN4dPSnbfb1KzEKW1Custqo//893vBzOPIQltAJz4IZo3c2gWzOmBjHL3T+SjMn5x0Wx70bDFnlHIhh025qcZ6/yNH5g0Hptqix7tBH1uCI8D6dW5Yq0d73twIWOgHlDDrjlZK76GsJ2/0e5HUu2cRCuYbaQS1Q9+GymiXmrJKNbknVH8OBWanTTjnEURtXZv2haYf+dscAjRv17iShtLH2xySB/pu0qZhOTYcaAa+SKp6oCPilMrmlSPir88oh8qZGWU58TrVEizkeC1SkqQJXUkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by LV1PR11MB8843.namprd11.prod.outlook.com (2603:10b6:408:2b5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 18:23:56 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315%7]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 18:23:55 +0000
Date: Wed, 4 Nov 2026 10:23:52 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 1/2] tests/intel/xe_exec_threads: Parametrise
 worker and queue counts
Message-ID: <aut4OMBl-hC6jSRD@nvishwa1-desk>
References: <20261103195149.48923-1-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261103195149.48923-1-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0162.namprd05.prod.outlook.com
 (2603:10b6:a03:339::17) To MW3PR11MB4684.namprd11.prod.outlook.com
 (2603:10b6:303:5d::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4684:EE_|LV1PR11MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2fa636-a02a-4d3d-8c8c-08df3aa0c8da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|261028144727099003|261026140227099003|261022105027099003|261009223027099003|261022075727099003|261021121427099003|11063799006|56012099006|261021123027099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UUwtYRJXn0vrQl+59Xr4FO888LQmyr60oUkSIW+deESRhtI0PkEi3zo1ebHkOZP++8sYwVBau6tATWtwkUT++5ePWuPIr06r9ugqlxUUvJJpQMFresopcCfoRRhPHM2SXNkmpPVtjMlokhrO85cEgm4uhJpY5XSB/VpIXEAlIYiMS0TKm+JQM84A/7oBiC6fK1ejQkTMOnhfkp5Qh8/MalZmswAuq0VK+26XKsr/xltEKwMfhkHjseZUyNn7FcI52E8zXZIBwNdf5E/j5nS2/W0MuVA/p/s6TcsmwGwS/jE2wm51TSD97txBZ6eWp99uwQFeH6J5x0JiHD+YlWfoW3xnZf/scQ2QdJCSY2HpWEO8VfPLIpeUbgIlIa03cIVNbj5EwoC4tx+PZE8c0EyeK8NjhEqK3ghfg2k/iWhz1FrBjHbjLdEqPBZPKib+L0g2kSK5QxR9piEQNeMoslgldcASEPaYSlrK9x629e7xXckquwrBT4EgTitCf506+KyQZ2jDsjsgzWVPksuEA/C+tM3kd71EmeRMjmcwxtFggShgmfCuuxCe3nVrU5f3Xo8KEOgwnFl+Ls9LsCBKLtqGFhZgeMHKBO6fy1tiiSmTqFC8NbNGQf82kuIQXKPxxM/AEJLjYO5baCUlMNY/nK4p7VVD5LK/js3Fa8z0VF5CLVw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261028144727099003)(261026140227099003)(261022105027099003)(261009223027099003)(261022075727099003)(261021121427099003)(11063799006)(56012099006)(261021123027099003)(261102123227099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HwXmGUXuSorPLFtzuIoljN6faIX2UoN1rLPl+N6YLYsTa81iJRLj6ayb8waq?=
 =?us-ascii?Q?KAz07+wxftri2UmKhYYOTr6mNqN3tByDZbwWg1dIUA7l/BwwmUeRNfDfGfM+?=
 =?us-ascii?Q?jsEwm6lPSMRCjTMI4x6hoPrSRwJJ4fQhDr+JqcVeVA7nIT8uo3pryMCZPpUY?=
 =?us-ascii?Q?DbhOQXBx/r50EQxZ/IXRNmoZ9452cEKUrGVVSPbHRXxssRiFSHEhDXJbn9jw?=
 =?us-ascii?Q?GlL9QSPQSi6lcYCMAonglfkAnL8cMBQn5xe6ohVk1/WhpQ/hhkbUwbXOdWIM?=
 =?us-ascii?Q?v4hJuJHDgh5vrORMsDQupVrp0XL1V7EcLEgRbGH2d1RamPVmpaC2Tr1WuQB1?=
 =?us-ascii?Q?zSYR3stis1aC3nNGPcjT1vA4Uvlf88CU9hq8qmbwR0lWuAtMKWn/PptL9b75?=
 =?us-ascii?Q?BYFNdBVVlPAMZOsGsNQj9COJvTIf/u+4wSYIxj27N2vefEmYOsqT39v/S00Q?=
 =?us-ascii?Q?bV2JsgTy3kMA2IGrszKhazOE444BbtpMg4RXIj0fDBbtiEPj2fH7URpLOJCU?=
 =?us-ascii?Q?AAtKz9gnPTYpmOIKlcKsdyIEcC95R0u7uvUxtzUoqYWKputhQLEAB2AaG/52?=
 =?us-ascii?Q?yTkXTKDGg44630mLOT4qFMTPVcUt+B/eAC/Cv38KFNjuUsvGgj2yCb0Oj18N?=
 =?us-ascii?Q?4eV7rtM/XTwqj5hOVSdE8mVJ7JIXK2dPfPttKNrhXiwlRVEFwVeIYbFY5xRJ?=
 =?us-ascii?Q?+CxGrKsbvTeMzNhSt16yjtR7eZi5GhAaz5tWCRPNIhVybSOpJVy3/9mA/2uL?=
 =?us-ascii?Q?1q09aib116XjkKDpM4karDLjuaTgmRf0TYsj/4XTsbH5ljn2F1MWXE0iaxgw?=
 =?us-ascii?Q?gBBtNz7x25ECedKUwhyJEdxubdgsqoK11jciMaMCCzDa3VPr/zHe7XFa16Vv?=
 =?us-ascii?Q?pNWHunZotvDrbSO0+XeTiwuuyNkpSlJ2a5WKYhduWbjQVf/uStKY/b6YYaFV?=
 =?us-ascii?Q?Kz/FE6hnjJJdDtFOssSjIqY4EcBPj1Kkm3NQ4Id2grFLnZJCfi1rPRqDNeTM?=
 =?us-ascii?Q?zjNc7/sLQEQ7jGVjK/X+v5uLFODzat7qhByi3QXtcbbRQoUlBhL+4C3ENFZh?=
 =?us-ascii?Q?OB5HFBLcdPIZH3CebQ+D07gYyIp9gRh8CZvOVvr0woQbQT/v7a8cf1luIXDg?=
 =?us-ascii?Q?yANj3+A8PyQnz8G0frFq2W9+Y4fdsIQ3XWSHDKRHg8GcRqXP8bLbug9sTFtW?=
 =?us-ascii?Q?ZRaJ/7Fm7Tf4PK+1zdzY0fJbBHasaTxiaz9GeQ1lY1krotfjeQmNdsKhfk9l?=
 =?us-ascii?Q?0ufTVWjhdGbL1KKraizvaYwDHeTwhDLel63Dd4iSZsmwlSOKeq4I18BUYyxn?=
 =?us-ascii?Q?fFSkz+eaQdXTrrVFeBjdDn3P0PwuBkKt9WorTRJjZjoxzznTMkw6wuLVQA8Y?=
 =?us-ascii?Q?oJ5qmGLUbJC4oNV7i+An5b/y9zMhMDEk/Qrq4cWZcFhlpPPfN/3L6BWCaYJ0?=
 =?us-ascii?Q?hnSwZ4q5EruqdiY+WplH6u/364JjgBcTR69s4/1eeimXOnSMjNhKnbyoHL6w?=
 =?us-ascii?Q?MPRs92hLJo6kBKwPgq0+TxONj0HpE0INs8s/LXW75yeZOYkafpdfi7OlZxI2?=
 =?us-ascii?Q?fd3ypYFuqG+/fLHT6jaY3aSHZ3mBcXNFAj8zKCmTHLUoiW3LIXwRwGLBsair?=
 =?us-ascii?Q?4vL6VibSI/ZnUrymemwICEdlu2HUipzRH0z2B074fF4k5aIMMH01I9mAKz0j?=
 =?us-ascii?Q?0dtZlVqLENNn2h9WYWEtRCzRY3Q3QefQjE2WaGnijhFiYiwCs9ISFLaBKsvm?=
 =?us-ascii?Q?eMnAlsROB8fiwV+L+h+4iqo78nW9ujS1fbU+/x2Vz+Th1hSutZFK?=
X-Exchange-RoutingPolicyChecked: 4MPyuylwVYLL2BcWpGhJuRb6xqy4/9kFwYz6D8lSdObXG1GqKJbx5CtsRb/CHdY/Qal/XsljdIwUv2zmoMa8egzsX/t4RDh7X+Qd/Ip3s2fIhDfi2ywyRTE8spxR9MffxaGSWaaKyoW6Fyo+Azf93ion0KUNoWg9Z+uUA1EM2GZcTJks5wAfY6Aaa4xe0LECB0h/uqYD7nRA0a+u+ms2QCPWYRokfvHjun9AVHJrniGBfzCgGdafnWE+uH1eNsNI94iThcUUY6pLZD0U+VqhwPrPI2qN2Y/XlFAuiFyv8ZNFizeSGhEk7J4MTPA0iVhmFfXQ8yF2BtiUDwTZ+vwNZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2fa636-a02a-4d3d-8c8c-08df3aa0c8da
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 18:23:55.0280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MW97Reec2eX9bKOJyrO2buX6+p62MFEEm/2abf1HbxMvNSGhsZfYIx7BP3j5/YRbSjZ+pJ8ghWgWSbe4/JV396MbVgsd+NY3/HmS1ib+aB+f6GUe14q1qOOoVHZnWk9A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8843
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 07:51:48PM +0000, Jagmeet Randhawa wrote:
>threads() hardcodes one worker thread per engine and N_EXEC_QUEUE exec
>queues per worker. Subtests that need a different shape have no way to ask
>for one.
>
>Pass the number of worker threads per engine and the number of exec queues
>per worker as arguments, with the existing callers keeping the current
>behaviour by passing 1 and N_EXEC_QUEUE.
>
>No functional change.
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

Patch series missing cover-letter. Please add one in next revision.

>---
> tests/intel/xe_exec_threads.c | 71 +++++++++++++++++++----------------
> 1 file changed, 39 insertions(+), 32 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index f03f20142..e7e472b4a 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -32,6 +32,7 @@
> #include <string.h>
>
> #define MAX_N_EXEC_QUEUES	16
>+#define N_EXEC_QUEUE		16
> #define USERPTR		(0x1 << 0)
> #define REBIND		(0x1 << 1)
> #define INVALIDATE	(0x1 << 2)
>@@ -1343,7 +1344,8 @@ static void *thread(void *data)
>  *	multi-queue compute mode fd userptr invalidate race
>  */
>
>-static void threads(int fd, int flags)
>+static void threads(int fd, int flags, int n_threads_per_engine,
>+		    int n_exec_queues)
> {
> 	struct thread_data *threads_data;
> 	struct drm_xe_engine_class_instance *hwe;
>@@ -1351,7 +1353,7 @@ static void threads(int fd, int flags)
> 	uint64_t userptr = 0x00007000eadbe000;
> 	pthread_mutex_t mutex;
> 	pthread_cond_t cond;
>-	int n_engines = 0, class;
>+	int n_engines = 0, class, t;
> 	uint64_t i = 0;
> 	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
> 	bool go = false;
>@@ -1374,7 +1376,8 @@ static void threads(int fd, int flags)
> 			}
> 	}
>
>-	threads_data = calloc(n_engines, sizeof(*threads_data));
>+	threads_data = calloc(n_engines * n_threads_per_engine,
>+			      sizeof(*threads_data));
> 	igt_assert(threads_data);
>
> 	pthread_mutex_init(&mutex, 0);
>@@ -1387,34 +1390,37 @@ static void threads(int fd, int flags)
> 					       0);
> 	}
>
>-	xe_for_each_engine(fd, hwe) {
>-		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
>-			continue;
>-		threads_data[i].mutex = &mutex;
>-		threads_data[i].cond = &cond;
>+	for (t = 0; t < n_threads_per_engine; t++) {
>+		xe_for_each_engine(fd, hwe) {
>+			if ((flags & MULTI_QUEUE) &&
>+			    !xe_engine_class_supports_multi_queue(fd,
>+								  hwe->engine_class))
>+				continue;

It will look good if we reverse the loop order and add the n_threads_per_engine
loop here after the above 'continue'. That we we truely create required number
of threads per engine on which we will be running the job.

>+			threads_data[i].mutex = &mutex;
>+			threads_data[i].cond = &cond;
> #define ADDRESS_SHIFT	39
>-		threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
>-		threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
>-		threads_data[i].fd = fd;
>-		threads_data[i].vm_legacy_mode = vm_legacy_mode;
>-		threads_data[i].vm_compute_mode = vm_compute_mode;
>-		threads_data[i].eci = hwe;
>-#define N_EXEC_QUEUE	16
>-		threads_data[i].n_exec_queue = N_EXEC_QUEUE;
>+			threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
>+			threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
>+			threads_data[i].fd = fd;
>+			threads_data[i].vm_legacy_mode = vm_legacy_mode;
>+			threads_data[i].vm_compute_mode = vm_compute_mode;
>+			threads_data[i].eci = hwe;
>+			threads_data[i].n_exec_queue = N_EXEC_QUEUE;

Still setting it to static value N_EXEC_QUEUE instead of dynamic n_exec_queues.

> #define N_EXEC		1024
>-		threads_data[i].n_exec = N_EXEC;
>-		threads_data[i].flags = flags;
>-		if (flags & MIXED_MODE) {
>-			threads_data[i].flags &= ~MIXED_MODE;
>-			if (i & 1)
>-				threads_data[i].flags |= COMPUTE_MODE;
>-		}
>-		threads_data[i].go = &go;
>+			threads_data[i].n_exec = N_EXEC;
>+			threads_data[i].flags = flags;
>+			if (flags & MIXED_MODE) {
>+				threads_data[i].flags &= ~MIXED_MODE;
>+				if (i & 1)
>+					threads_data[i].flags |= COMPUTE_MODE;
>+			}
>+			threads_data[i].go = &go;
>
>-		++n_threads;
>-		pthread_create(&threads_data[i].thread, 0, thread,
>-			       &threads_data[i]);
>-		++i;
>+			++n_threads;
>+			pthread_create(&threads_data[i].thread, 0, thread,
>+				       &threads_data[i]);
>+			++i;
>+		}
> 	}
>
> 	if (flags & BALANCER) {
>@@ -1448,7 +1454,7 @@ static void threads(int fd, int flags)
> 					threads_data[i].vm_legacy_mode =
> 						vm_legacy_mode;
> 					threads_data[i].class = class;
>-					threads_data[i].n_exec_queue = N_EXEC_QUEUE;
>+					threads_data[i].n_exec_queue = n_exec_queues;
> 					threads_data[i].n_exec = N_EXEC;
> 					threads_data[i].flags = flags;
> 					threads_data[i].flags &= ~BALANCER;

This is the BALANCER loop and we are not applying n_threads_per_engine here as
it is not required. But we should add a assert in the beginning of this function
that n_threads_per_engine is always 1 if BALANCER flag is set.

Niranjana

>@@ -1471,7 +1477,7 @@ static void threads(int fd, int flags)
> 	pthread_cond_broadcast(&cond);
> 	pthread_mutex_unlock(&mutex);
>
>-	for (i = 0; i < n_engines; ++i)
>+	for (i = 0; i < n_threads; ++i)
> 		pthread_join(threads_data[i].thread, NULL);
>
> 	if (vm_legacy_mode)
>@@ -1762,7 +1768,7 @@ int igt_main()
> 			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
> 				ignore_multi_queue_hang_warnings_in_dmesg();
>
>-			threads(fd, s->flags);
>+			threads(fd, s->flags, 1, N_EXEC_QUEUE);
> 		}
> 	}
>
>@@ -1863,7 +1869,8 @@ int igt_main()
> 			atomic_store(&wq_stress_hang_detected, false);
> 			igt_until_timeout(WQ_STRESS_DURATION_SEC) {
> 				threads(child_fd,
>-					REBIND | BIND_EXEC_QUEUE | WQ_STRESS);
>+					REBIND | BIND_EXEC_QUEUE | WQ_STRESS,
>+					1, N_EXEC_QUEUE);
> 				if (atomic_load(&wq_stress_hang_detected))
> 					break;
> 			}
>-- 
>2.53.0
>
