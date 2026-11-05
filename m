Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAABF606A31B
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 02:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TZaNcE5m
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E53F10E1C3;
	Thu,  5 Nov 2026 02:23:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9067E10E8FE
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 02:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793845377; x=1825381377;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z4vwZJ5fIkyxy5tQIXj2YCY5Jbhu1wBx4kdm21yDPe4=;
 b=TZaNcE5m3D4pZYSxfRYmWfBR0X/xEqS1Ib8cilsBPRrkZX4HC+V1J0cm
 bvZF0Tagw0cc9USVWblicLF0aHl7pATFs3jsewT0Xmvv91hQX6rB+ylOE
 rAqASF9j9MmEGf3sFnP6ysRY/IEQ/zJy8kJy9y8bsBgXEuH2EryJNWD17
 gb2WpVDXkyT51c+5Wcj0hmRkTg9lTzlufU9SuPb+dpsqK2XVOa0QohckA
 NIC5Pn4ID7U62iv4tit12lMo4ikE8v61JjA5/x6SVg5gBLjhE8zqKtLck
 29ehizlqM+ckhHSHxm/l/Rq4wsReL824b3wtBPqnr7HXbxYfLCh/SdvUN Q==;
X-CSE-ConnectionGUID: Fbsc+VvqTySOqBemq0I58Q==
X-CSE-MsgGUID: 9VlHm7e3S0mtAvFIfeCTMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2507493"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2507493"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 18:22:57 -0800
X-CSE-ConnectionGUID: doj3p+K4REm8UTjkOjw/wQ==
X-CSE-MsgGUID: J1u79pgoQgO+97y7PqcFeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6903570"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 18:22:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 18:22:55 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 18:22:55 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 18:22:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmwK1dlvIapNJVka+X8Fwt4zCDbLIM0BfzF5LjrwFU4+V6t9XwP7OLE2X++FMsFNP7wEQkeYoMKQiwarQrdiONgw+Ho4vQPpE6qBFMGRJ5/1CV8QxKlBkWJBuhmeCzH4s0tgafbqX7m1iZrJ0SBs7dsnqgJlxM40S4YKaTg+0/UJjFBCZxG2A1o8MizNf2vxMyuWMIKxCuLm3l50evuOxqxsEhZgM3iw0Ipx2Cz+2Yd1KkSpawDJHvL9i3B4XE4mg3BsYfAD16g3Xb1ZkDhhLiY3TC9de3AT8SdRI3UPsnGILhy63/iDc/ax8KmSpScvTwcgeLgi3OXQzm3qzFFaqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqtwUBEg6kZqpk/jiz67F5D/ogORgCOth0XjEHI5DOI=;
 b=IPW7Ng2NcIWYHFQhQLS1ndJuQqUGczwWL001Kvr4b2z7hu6TQ+NLQWbYRVN5jLBvIYzB23p7DIa3e848bMcDymCrkrasYQyseGkODsXD6YqLYsCciZEJxZ06w7Nf/2yfxPdpjiOOYAfKww0b77WJGlYx/EPxlNOupgHIUhf8+ihEwGmM3zMAFMyrKks3TrMu3UWLF/3N+QCogCjjdfx6l1/g0U2Ie1LIk4KzhE5c6MENAoRwgTy0kH6z0ACeZHHl6bAIhBkXrDDfA8fVsEv6Hld/yV2mQoWoPNfJbDF8rVPnjvF6Zk7+91/xuMtbxYy6YAyj8ukO63Yu0x9waLusYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by SABPR11MB9937.namprd11.prod.outlook.com (2603:10b6:806:4f0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 02:21:23 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315%7]) with mapi id 15.21.0569.011; Thu, 5 Nov 2026
 02:21:23 +0000
Date: Wed, 4 Nov 2026 18:21:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 1/2] tests/intel/xe_exec_threads: Parametrise
 worker and queue counts
Message-ID: <auvoIUnk8NEJlCWj@nvishwa1-desk>
References: <20261104201119.14137-1-jagmeet.randhawa@intel.com>
 <20261104201119.14137-2-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261104201119.14137-2-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0095.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::10) To MW3PR11MB4684.namprd11.prod.outlook.com
 (2603:10b6:303:5d::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4684:EE_|SABPR11MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: 19de1eec-2a37-4203-0ddc-08df3ae37c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|10067099003|56012099006|261102123227099003|18002099003|261009223027099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|11063799006|261026140227099003|261028144727099003|4143699003;
X-Microsoft-Antispam-Message-Info: AzrSyEEuhBOh/pQ4nQ1uaQnBKdIxhnNONiQ+hF2GWLxQLj6WNreGNEjViP1FQeYEIxrAMUV1Bb9iidzcBHvMrGgoBVRJ/TiCEyjHzhGw6Fk42woSKNXiS2rphUvbrL0uLBltL7lzA/BQ9+h/+fF708jal91t9y/gaB/ijp5al3iGmqk/YsUqwBAufaUDE/28kR/nQ39EsdlWSAqdLIDIUm45TntztpQdG75qLXuRV4+HO7JwtAqxMOA30fJoqXkq91kMeF9Vt6h/cliO6m6TRHwhSOmCIK2YbgBwT+d7dreADEEVJR4+/eIEGACGt4o3rxHJ5OBLU9Q3UjYiNnCwQTSITtuYzbUOsMn+ShTPlmdkcgttaoznbBGuWX8gx/J0tDOZeAbxMCAGzpF+O07v5fRHKykqKhaZOQO2mQ7Hd+GvPWLvj7ZZPAbxcTAch/iaraQg+TxBAT+LzJWb1ZtfgFEkCjwX66RzQdosdD/neIu/fCgFf9ls9CETes8Fhp7zqOSeVoNn2bIzfFSsWY4+50yU+JXb0JrbTD/Wt0qKH4VR4ofKWfoYmc66Hlw3Wg30optRZdimfYuT2wIb2xgbHuvMRGIez+/iG8eQtcafPJjf+SFK3xQFA8dmZkFpWwPs0ucKZJhmf3ZHoft5mmMM+OpOaTDHERFiNGypYHON3NE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(10067099003)(56012099006)(261102123227099003)(18002099003)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(11063799006)(261026140227099003)(261028144727099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0b6xbgdGsJnJtGXHSL87g/WNlBm1rlLmLiQCBTtu3FTmKqAMVc7E0oVQlxEP?=
 =?us-ascii?Q?Xnc4rU4gNMUSduKk/A8TDts1g+MMXqVTCeaa3vj7gM/Tid5IlpT3RcvLOG56?=
 =?us-ascii?Q?djiA/LZJWubyRPlVjL9sj2zb5pWe/wrEVqEpsWITE4juKUWIR0I8TWpghOZs?=
 =?us-ascii?Q?Jkj4uQ3Uo5+KuTPfp73q2zFQ8IeYn93rl4aFa6RWGGpUE3IfDPcpHDybm6J2?=
 =?us-ascii?Q?nsZU8rcnBU9oVZjqr9hGMPhe106nXeOcJFpSJwAg7ZhEoY+w22VfdkVIWLkJ?=
 =?us-ascii?Q?l3jae/uuCZPxMHM27g028j9olgo0bl+gngN0TDe9ebG24JUp2JCApDWDGmlx?=
 =?us-ascii?Q?ngKm5mt0noTdSpG9tdKW4ee+a69T0O+dnNaN38a3lpQS7upBkDUrCettJjLq?=
 =?us-ascii?Q?9ifwiifD7XY6g12WXv+VEuiBZmKTOKEb/BNsT8V8+XT0/4BcOtFU7s3rgETi?=
 =?us-ascii?Q?iS4clT+fpDvmmfJYbrcOuF7+uAPzqSasv704hJvOciC2TuD+fw59lxhnFNvI?=
 =?us-ascii?Q?UbUtISXJrDSO0wpB7vfY19rgKoSqSCJ1LOEyA0jOJJc1MJEZAF4/tFcWYJYK?=
 =?us-ascii?Q?uPaakuiOlXXapRR1a5yDhFqKMNO9O0yKqL1B20JCUnanM0SWk7Ea6g74btdZ?=
 =?us-ascii?Q?feA/BW51ajCvXDgZoR2MRIx8PVd6t5KnZYL9qUecsQq3rcIETeiCsyBS8TdM?=
 =?us-ascii?Q?2Pj0NXRwFQ99TlLKC+s2k3qo5i0iIShxfeWchCa0+EXnzdZ+S74jxt9TmC0k?=
 =?us-ascii?Q?uZjofBjKD1mwjs74gQ5z7wqr1ac1sW7ul8NCO7xp6vPfjUtGs/mACVleLKsE?=
 =?us-ascii?Q?4YUnL/JDjSlkHaCtIbAo2JvgFhqaL8Np8tW+10gHglpGBrrGuWPec1fUnPNV?=
 =?us-ascii?Q?vYo+Vpg6ZW0GgSZkN69Ix/dhmrIGP1LbyE322QdlV7cDuB+PHzIliMQYWY9M?=
 =?us-ascii?Q?o9Yrev9gqAle/SyjKk7UQvUyxsk9vGBBXwUF+X5KWqj8ZrOg0PDmIi+zlzpn?=
 =?us-ascii?Q?tVx5eYeROL8NUaCzuXzGY8P4s0DXDP2eoJ1RdOdSbejfLjqQqHf5B07dAsJI?=
 =?us-ascii?Q?1t56MSEtt4cavHTa6iyUmwxTlzwqMJ76S2oU6WwqsMfhPom5LbER9ha8V02/?=
 =?us-ascii?Q?SUNWWHxrJg185AIp6J+c+wwim6bRs/H3SBnM+EXrcNuW3pXYE6Y+7ohg5Rvx?=
 =?us-ascii?Q?wiPs/nQQLaaVh4GYXUMDFhWAK2jH/03VdNGz0YhelOznb3xil3hRbF7nXk8Y?=
 =?us-ascii?Q?jQaDmqOVJCeiLSqVylyXDaYKSzTw6V6yhQ+xOZocmpcO+3/8GE29lfqCDr4R?=
 =?us-ascii?Q?3zhfmd7A5R/GKbQzpmXx+7KkThGGTTBM6jBT397T5WwoGIhkb3nnkKUjcdvv?=
 =?us-ascii?Q?e5haRTS8TMFV9+Cnl7QQ0lyuzi5+TITvubH33Ztuu/gEaeKOcUcPUTseF/JH?=
 =?us-ascii?Q?ux3Qy9RbjPNIWTQvDEzbNiZoEN8AsJPNza6mQtUh9JJ4cBVJ5H5vW6br8GmF?=
 =?us-ascii?Q?Lvhe5bDG3jc4xTcaC9WhXr6MMniSG9CZDmzOH5wr7jxsJKM3rIeTch1LCOFm?=
 =?us-ascii?Q?bDeuEwZCE2FAq19Rnb+iIX5SDTzpHhNxjZ5cq56pGRB1ZGz9wjyea3C7ejjo?=
 =?us-ascii?Q?D6R6ZChrN6FG+B7UTjsl/9mafFS4+2ZXw0eIhGyf1Q6jCWpmW/knTR6DMFry?=
 =?us-ascii?Q?QF00mV5/+HKfXNqDijc+ZMuwJgyv2bpcQbp2FzkTLVYfdD6OQNqqFtTNnVRN?=
 =?us-ascii?Q?pn7DC42dJsyWz58hirOdLw0H9m64Zm9XtAPnRNMOIqUFVispRscX?=
X-Exchange-RoutingPolicyChecked: LauChXGUGVg0Y18aZaFb3xhnoPo6LNhGhSYyQ/C9kSzVE7jHgBsG1e/+Lkr2JM3EL7trMJs8+3qIvOcOoUoaWMmaXCHMfknF5u9bAVxQh8OwfKi1H1iBMdKrjS2WQH4Vy1bOYP7PwjKR13F2Sp7QaUlVw49IQp7n+73VfSuxtiRrNef+zWia4YiTh1+8f3PuiS5grTcB/2mLZDxe/NdO/1OeTIRpOKd7NwbdCZnhEykdjme269VK1yATRbw1yV/gT8pghHnhNpwZ5z+GjfznapAmyb2u/hQynidV5rqqxgsE7k9f2r6+6Kp9AErgEgjBievz59VanzqKnyopj/AF+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19de1eec-2a37-4203-0ddc-08df3ae37c7e
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:21:23.2788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnzbVKnFXrukrfsZDbOoJvkXlDV3qFMDC94YmYFInqOpIAdYDigK5YcdDQYR+llDZnK6ntt+2pC4r3WFmbUKCVbsPP4frGae3P/uBKSPXFoQCJM49D8isqpcGEQN6MHd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR11MB9937
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

On Wed, Nov 04, 2026 at 08:11:18PM +0000, Jagmeet Randhawa wrote:
>threads() hardcodes one worker thread per engine and N_EXEC_QUEUE exec
>queues per worker. Subtests that need a different shape have no way to ask
>for one.
>
>Pass the number of worker threads per engine and the number of exec queues
>per worker as arguments, with the existing callers keeping the current
>behaviour by passing 1 and N_EXEC_QUEUE.
>
>The balancer threads are not created per engine, so require one worker per
>engine when BALANCER is set.
>
>No functional change.
>
>v4:
> - Actually use n_exec_queues for the per engine workers. The previous
>   revision still set the fixed N_EXEC_QUEUE there, so the queue count
>   never reached them.
> - Nest the worker loop inside the engine walk, after the engines that
>   cannot run the job are skipped.
> - Assert one worker per engine when BALANCER is set.
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>---
> tests/intel/xe_exec_threads.c | 71 ++++++++++++++++++++---------------
> 1 file changed, 41 insertions(+), 30 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index f03f20142..e5056192b 100644
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
>@@ -1351,13 +1353,16 @@ static void threads(int fd, int flags)
> 	uint64_t userptr = 0x00007000eadbe000;
> 	pthread_mutex_t mutex;
> 	pthread_cond_t cond;
>-	int n_engines = 0, class;
>+	int n_engines = 0, class, t;
> 	uint64_t i = 0;
> 	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
> 	bool go = false;
> 	int n_threads = 0;
> 	int gt;
>
>+	/* The balancer threads below are not created per engine. */
>+	igt_assert(!(flags & BALANCER) || n_threads_per_engine == 1);

May be also add an assert for MULTI_QUEUE and MANY_QUEUES are also not
set at the same time (not supported currently).

Niranjana

>+
> 	xe_for_each_engine(fd, hwe) {
> 		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
> 			continue;
>@@ -1374,7 +1379,8 @@ static void threads(int fd, int flags)
> 			}
> 	}
>
>-	threads_data = calloc(n_engines, sizeof(*threads_data));
>+	threads_data = calloc(n_engines * n_threads_per_engine,
>+			      sizeof(*threads_data));
> 	igt_assert(threads_data);
>
> 	pthread_mutex_init(&mutex, 0);
>@@ -1388,33 +1394,37 @@ static void threads(int fd, int flags)
> 	}
>
> 	xe_for_each_engine(fd, hwe) {
>-		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
>+		if ((flags & MULTI_QUEUE) &&
>+		    !xe_engine_class_supports_multi_queue(fd,
>+							  hwe->engine_class))
> 			continue;
>-		threads_data[i].mutex = &mutex;
>-		threads_data[i].cond = &cond;
>+
>+		for (t = 0; t < n_threads_per_engine; t++) {
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
>+			threads_data[i].n_exec_queue = n_exec_queues;
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
>@@ -1448,7 +1458,7 @@ static void threads(int fd, int flags)
> 					threads_data[i].vm_legacy_mode =
> 						vm_legacy_mode;
> 					threads_data[i].class = class;
>-					threads_data[i].n_exec_queue = N_EXEC_QUEUE;
>+					threads_data[i].n_exec_queue = n_exec_queues;
> 					threads_data[i].n_exec = N_EXEC;
> 					threads_data[i].flags = flags;
> 					threads_data[i].flags &= ~BALANCER;
>@@ -1471,7 +1481,7 @@ static void threads(int fd, int flags)
> 	pthread_cond_broadcast(&cond);
> 	pthread_mutex_unlock(&mutex);
>
>-	for (i = 0; i < n_engines; ++i)
>+	for (i = 0; i < n_threads; ++i)
> 		pthread_join(threads_data[i].thread, NULL);
>
> 	if (vm_legacy_mode)
>@@ -1762,7 +1772,7 @@ int igt_main()
> 			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
> 				ignore_multi_queue_hang_warnings_in_dmesg();
>
>-			threads(fd, s->flags);
>+			threads(fd, s->flags, 1, N_EXEC_QUEUE);
> 		}
> 	}
>
>@@ -1863,7 +1873,8 @@ int igt_main()
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
