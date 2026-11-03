Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CABF606A33E
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CtxcKGth
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FA110E80F;
	Tue,  3 Nov 2026 14:10:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CFD10F5E3
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 14:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793714961; x=1825250961;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ws/JQ0lPoPqcRTxflLiRHZXdcECxBJywthBZKwo5XMo=;
 b=CtxcKGthS1SwMpy+8hKSBNuCk1bjuWnOX1zN99Xxo+VIC2m5Kbb0azVP
 ZL6T2Jp9NWSMs0otJO5XZAKE0wpFRUnmh/TtpSH0M+8SBqijWkEbU7L9F
 xzAFtnBitHX29cjW1BDedf0Mcfr2w3dfMIbhf7weYFL9bysKFhhLxZUIs
 oPnTQm4LuqnSC4Muy3DPrjAz3zI5X4GlFf9/CpBQKHqVat6xP0kvSh96q
 rTKqRT9ijXy5PxpDE5j8nRVpBAGBi74zVblCRVi5ynR1XZDfhNmVat6WL
 6MRaqOPs/7qEBm4ftTA9s79BnadObSSyXL6i+ieEP6gL2slDUjlMLwvfh w==;
X-CSE-ConnectionGUID: uKyYlwN4Q+KWMTp797GXjw==
X-CSE-MsgGUID: /ZVyxD/sR9Kg/9pNd6BFgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2436148"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2436148"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 06:08:41 -0800
X-CSE-ConnectionGUID: 5e+yN/FjRiiB2Tkcgqqc6Q==
X-CSE-MsgGUID: wO4FOf4hQVmMeLuXAyM2Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8217847"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 06:07:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 06:07:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 06:07:39 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 06:07:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQLqyk/0jXqeJduVbCSkcwrylponKmxJxfnetqqHb48G38wvB+e0hThhjOhyCvwHV11tOLI15IcVrtrxaaZtLAzHywBQolLZYw4yZ0wxVu4iWgDgV7P1IWL4r9L0NC81vPk8vfgz1ZRZ6k9dxwTGuHRVJ+GUQto3KnLjavtoo6t+4Y+kMQh8wNF2kv/0HC4zYlRy4VK3KML+6Xjw1S1+bmfmROPaZntLNgAvBTJDE3uDj93Lbenxv8LtbXbyxylMhM923zGUrRcQtjobXTcRwAIy3AKqS1TWIIu611rF5LWNDCkpPUxoTREei5H+jGCZ4nAmtS0iTO2ZU1EkVl7oBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mR+XqvNk/JYxeE92LmdOPZ0Jo1ZGSAA427+wzt/k/s=;
 b=x9wIx0IfZcSmGprH9HyUcHbGddv90870auB9CJRemKB7RG7ayK/3XOXSNmbhFUvT76RN37c2yeRR+/Kn5MMIxwuqk475gaV0ChfxbozjGEoLP7/ANwEmnCjdEt6gIah9WscDm+3hYUmsIs0Qcbv8rLRBDCtp6HovJm6sltTNwbMpWHSnenpK8Q9yYYrydvrWVXshc8zxltXrngnP3/YqV/F5mTV3JioKwrRFfPAUE8aFSexBz3V5DIGIqKU0JHpNsf9L//nyZn62i2xOUBjCmucb9jlgMyCcdiKHQlBERT0Lyg2rymxe1B+fhgjF/naP03ZKgoF6FAPz59PLtPuMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 14:07:28 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 14:07:28 +0000
Date: Tue, 3 Nov 2026 15:07:13 +0100
From: Jan Maslak <jan.maslak@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [i-g-t] tests/intel/xe_create: add create-big-bo-interruptible
 subtest
Message-ID: <aunqkZXCF9AsnnH6@ART-DEV-395>
References: <20261021142240.826942-2-matthew.auld@intel.com>
Content-Type: multipart/mixed; boundary="3HFxHpVxPVBDr3vT"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261021142240.826942-2-matthew.auld@intel.com>
X-ClientProxiedBy: TL2P290CA0029.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::19) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|SJ2PR11MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ec6072-5d98-4b2b-09b9-08df39b3cb01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|6049299003|376014|1800799024|366016|6133799003|10067099003|22082099003|18002099003|4013099003|4053099003|56012099006|11063799006|261021121427099003|261022075727099003|261026140227099003|261028144727099003|261102123227099003|261026121527099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: WHNl5hLNXAyK6sbEVSqpg4sr5ZMbB1DEjbcmLioAqPtE3k6/JtwjP7CUNCycLKHI3A/Zt5jyuHuMzjqej64IVhX+S0atNZx4d9csQDzW3wST0vd90v9Kwo0uvmJh/8/o3nM8pmArzPB4ozT77JlDcsGtxw04uK0pZGhLrQH+iq9mTMw3PU/vkKcnNtmh6PB+ZRDL6uJ45Tv2jSB3flv1HyvkYUnzNzll4B15At3uD7Tgso/KXxnaoLccbtkxCdbjVSHTga6m9l9d+4ZEKGz71RHcLWJm9/4/widULYtH9SkCjfBc2GnXyvEi0v8j55EMke6FQP4ojlyLGC1wW13F1fIzp49j7lQIgXr85ySjj2IEyp0C4fg2h72lcCszUckYJCYoXUrKps41CDOltkSwwsFWujA8y4PxGQQYZZkloRjS5KdZIiXxglN4jSXF1B8Oic18EpB50r4kjvCe7HyR6gqHYCdT3/FKTOCUy5yg1qnYu+qy1xjGES48EogR3nJkZFl/dAUabZytyOVkJYp9c5MCIlutinsvJyjD7Bt7iHXH+yv+PHhohXZUIobulII1d05v1ccxacNoFIP/4/HP2OYofqogCf461Qwmwfp8t9o4TmYbYtrWsk3xOg3DNJAd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(6049299003)(376014)(1800799024)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(4013099003)(4053099003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261026140227099003)(261028144727099003)(261102123227099003)(261026121527099003)(261009223027099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dmTkr8BoQJwNi4uxv4aZo94yVFj5U94ZOSWEpviqpyrtD0Jhx1+TZP6qHi?=
 =?iso-8859-1?Q?mrPJ+GWUIU0YoFjb3gzxuo71ObnLo5QcYvtmf5vihOTVO8J4dTLgRoFbDw?=
 =?iso-8859-1?Q?TxGQK2/R317f1N9G9jp8M8q4sCmhrBzX0+o3a4WItZBSPFT+lXCYP6uHc5?=
 =?iso-8859-1?Q?aNfqzGAB83UUKP4ezo3d0tjtmjy/03gLTq4Z66j1z6k4CdPr3xCeejbDYc?=
 =?iso-8859-1?Q?HQOPUsiyFYcZDRvuRAlKQsruUnS7yRD2sxx+/uM5+qZi3uC8lwLY59Prsf?=
 =?iso-8859-1?Q?RUG07LPKHUO97plcZ5um7/6AqoZRnP5u7RE4ira0KHW360eL0rMdjbkcSX?=
 =?iso-8859-1?Q?GfDkB/vVGc3qnbA+jVf6PvtczwCjmixi7isXKflQR4m8dugJ8OOTrO+B/Q?=
 =?iso-8859-1?Q?ydLpKUIY1ySz3849PPHOaDjUui7YBHYeoJ9Afuc9n+UF2OtFwMUFDrhbsI?=
 =?iso-8859-1?Q?qY+Fa8EABpVSyZ279trUOH8QLVK3JK+rCSnxUc/EWeHgX1OME31nPIW+FF?=
 =?iso-8859-1?Q?iBPqdADUcP3M5DvSXBxjED+gYwsU1Tck49qTN2P8SQHA8elgFoeDHaVF5U?=
 =?iso-8859-1?Q?f8puAI/Dk6vTzll+AXFYjDpzATNU4Fyer2VyxMiGX9Yy6Bk/328Ywh3KcF?=
 =?iso-8859-1?Q?sjxtgJr/feyWcPwtPHixEd46HVhfQApUX4YLmK31LyxdqH+6mt2XZm/JRc?=
 =?iso-8859-1?Q?DQ5KBsJZF6oMuoG+F9hd5Cg0pKCxfJmS+Rs2OTmj/m4vDDutweOAac47oW?=
 =?iso-8859-1?Q?B9gxOYCwL0/XYEHc5KA5vW3oH/Xs8T1dCiNvuiAwpCNxpUnj80W57rrfAh?=
 =?iso-8859-1?Q?CU8u04KNaxGrKPPtUdjLefGhOEBVl7uu0TeGse17THvwPP+V/4I/R5R5Gq?=
 =?iso-8859-1?Q?U3c6OlSAuuXpRcfv56dmjYS9zUTm6ZMZAgiE9/dy4t1aTsZcDT9JNni4Lg?=
 =?iso-8859-1?Q?XH5jugClP9G1+GLAYongKipiUyBBtvyVe8424buOL3C8QLjuJA8EYncC+T?=
 =?iso-8859-1?Q?ysyBCuYH4YpVGU3RDOmtP4j4RPlz/eCtImIopLlp2gCKaGJAdNlSFT6mxd?=
 =?iso-8859-1?Q?BESWnh5wjORh9vHG/C+IckghpuvaPOJoo5wX4nyilyvd3YgrD7tjvt6iVt?=
 =?iso-8859-1?Q?TP1YubtkmizmlfqCc0GLXXFxfbucHhhbR6UNnExZwshs8103skxwUojzHZ?=
 =?iso-8859-1?Q?md3kjSqaOypqD4+Hcg/zrnXEXzmot9R9A4dBl1v/lwtiacj/ueq0nAyEu7?=
 =?iso-8859-1?Q?ND8qhY8gfj2rEmqF4GDHDFSOe0Rb4njivy9yW7qIaxtsmMnxDuId1qcLXJ?=
 =?iso-8859-1?Q?1HTVhsSbIXIxq6rb7kd7g74pLyYfv5rc6/JXgz1Alu8uFHJs+h+MfVTpWW?=
 =?iso-8859-1?Q?btxCA+ahXyfsiAhfk47cJr5H/6UEznXI+ydl/jwSN0kXT/toAMWyFGA3GD?=
 =?iso-8859-1?Q?7aTNtql1iZ0maukaenOoA99o3SlRpYZDsI5m1Ud7GDWG5UAsOw15CflMvQ?=
 =?iso-8859-1?Q?ib5vxhaXqUlxE816206fgrFsDMPTlHdgdy7fAUEQErgsRz5ycScCzFkQ+6?=
 =?iso-8859-1?Q?zvjewws4GYCa3shmikURG93sBrRw8XL5oAMmtcE2MvK/64EnmvlpHqPf0I?=
 =?iso-8859-1?Q?EGJYaaaQ1aY1VMgjXBfvb5cYWl2awgrR3GYzcsi33n9Sy06j7bnFCb162Z?=
 =?iso-8859-1?Q?wqOoFTsr0bhzmIRGcyUnfPhuzvPeDRATkJEu56Bp8fRFEDYVSBiHcy+o2L?=
 =?iso-8859-1?Q?o7ngEkNLaxkVxvIvzhdTKwETycgmrDMAtsCEn+kKoNqeVgZ17Kwmu3bW9s?=
 =?iso-8859-1?Q?sEGW4NXPHA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 1a8+gtm7fNs5vXgO8XvilU0/6omP4F5B7VrvkBBonER/funmdyO9PKr7Djm42eIV3i7rGwk3COJFbQEZtB8zBreR2MexBNTRNMZSluWpzTITFxaqXvBdk8hmQOMzGgMq4lnOjw3e38pYldIUxgtaHy2dyp8xyjRUgH6DeSIQqDUrMWRBsKrO1/wjFOjRXz75Ib1mDXioiNL5dP2ZRbQlj9w9OQcqiU5mEwXBpq1DkEC5KrpQjTDWSa16N9MU4iEyah0uvEfVEK3/qEXt9woRtUH8KuIhWzyi6FSAsZH8yXnPIEbizRjBrsR7tbFBKPWOleIXdgiue+CjDqlD5czfEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ec6072-5d98-4b2b-09b9-08df39b3cb01
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 14:07:28.1659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DzA+/tEaCpy+vupaI+3lzP+j+JIkU5/RyE/hZ5LlYBTuV4pY1XJXSj+T49b3mmgiuGLCpTJJk7uvtpZ7krKAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7617
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

--3HFxHpVxPVBDr3vT
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 21, 2026 at 03:22:41PM +0100, Matthew Auld wrote:
> Add a create-big-bo-interruptible subtest that wraps large BO
> creation and CPU mmap verification in igt_fork_signal_helper() /
> igt_stop_signal_helper() (500 Hz continuous signal interruption) and
> also supports non-VRAM (iGPU) platforms using a 512 MiB system memory BO
> (roughly matching bug report).
> 
> When a large BO creation overflows the migration batchbuffer
> suballocation pool (gt->usm.bb_pool), an interruptible suballocator wait
> aborts xe_migrate_clear() with -ERESTARTSYS, synchronously drains all
> in-flight migration jobs at err_sync:, and restarts
> DRM_IOCTL_XE_GEM_CREATE from scratch, livelocking under periodic signals
> such as Xorg's SIGALRM smart-scheduler.
> 
> Current working theory for user reported bug. Running this locally, it
> does indeed run forever on BMG. Patching the intr wait on kernel side,
> fixes it.
> 
> Assisted-by: LLM
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---

Hi Matthew,

> 	bo_handle = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
> 				 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);

Could we use xe_bo_create_caching() with DRM_XE_GEM_CPU_CACHING_WC
here? The existing VRAM case already defaults to WC.
For system-memory BOs, xe_bo_create() defaults to WB, which skips CCS
clearing on LNL, leading to the test passing without calling
xe_migrate_clear(). WC exposes the stall on LNL on an unfixed kernel.

> +	if (interruptible)
> +		igt_stop_signal_helper();

If a dynamic case fails before this, the helper stays running and the
next GT aborts at assert(!proc->running). I reproduced this with an
injected failure. Could we move the helper start/stop into setup/teardown
fixtures around a group containing this subtest? Then create_big() no
longer needs the interruptible parameter either.

With WC and fixture cleanup, I compared the results with and without
the kernel fix [1]: three 60 s external timeouts without the fix,
versus three passes with it. I've included a suggested diff.

Thanks,
Jan

[1] https://patchwork.freedesktop.org/patch/764504/

--3HFxHpVxPVBDr3vT
Content-Type: text/x-diff; charset="us-ascii"
Content-Disposition: attachment; filename="review-fixes.patch"

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 0a1b54ae4d..3c96ac8d90 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -418,7 +418,7 @@ static void create_massive_size(int fd)
  * Description: Verifies the creation of substantial BO while continuously
  *		interrupted by signals.
  */
-static void create_big(int fd, int gt, bool interruptible)
+static void create_big(int fd, int gt)
 {
 	uint64_t bo_size, size, visible_avail_size, alignment;
 	uint32_t bo_handle;
@@ -430,6 +430,7 @@ static void create_big(int fd, int gt, bool interruptible)
 
 	if (xe_has_vram(fd)) {
 		visible_avail_size = xe_visible_available_vram_size(fd, gt);
+		igt_require(visible_avail_size);
 		bo_size = params.quantity ? params.quantity * 1024ULL * 1024ULL
 			  : ALIGN_DOWN(visible_avail_size * params.percent / 100, alignment);
 		igt_info("gt%u bo_size=%"PRIu64" visible_available_vram_size=%"PRIu64"\n",
@@ -441,11 +442,9 @@ static void create_big(int fd, int gt, bool interruptible)
 	}
 	igt_require(bo_size);
 
-	if (interruptible)
-		igt_fork_signal_helper();
-
-	bo_handle = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
-				 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bo_handle = xe_bo_create_caching(fd, vm, bo_size, vram_if_possible(fd, gt),
+				       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				       DRM_XE_GEM_CPU_CACHING_WC);
 	bo_ptr = xe_bo_map(fd, bo_handle, bo_size);
 
 	size = bo_size - 1;
@@ -457,9 +456,6 @@ static void create_big(int fd, int gt, bool interruptible)
 	}
 	igt_assert_eq(0, bo_ptr[0]);
 
-	if (interruptible)
-		igt_stop_signal_helper();
-
 	munmap(bo_ptr, bo_size);
 	gem_close(fd, bo_handle);
 	xe_vm_destroy(fd, vm);
@@ -604,20 +600,28 @@ int igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
 
 		xe_for_each_gt(xe, gt)
 			igt_dynamic_f("gt%u", gt)
-				create_big(xe, gt, false);
+				create_big(xe, gt);
 	}
 
-	igt_subtest_with_dynamic("create-big-bo-interruptible") {
-		int gt;
+	igt_subtest_group() {
+		igt_fixture()
+			igt_fork_signal_helper();
 
-		if (xe_has_vram(xe)) {
-			xe_for_each_gt(xe, gt)
-				igt_dynamic_f("gt%u", gt)
-					create_big(xe, gt, true);
-		} else {
-			igt_dynamic("system")
-				create_big(xe, 0, true);
+		igt_subtest_with_dynamic("create-big-bo-interruptible") {
+			int gt;
+
+			if (xe_has_vram(xe)) {
+				xe_for_each_gt(xe, gt)
+					igt_dynamic_f("gt%u", gt)
+						create_big(xe, gt);
+			} else {
+				igt_dynamic("system")
+					create_big(xe, 0);
+			}
 		}
+
+		igt_fixture()
+			igt_stop_signal_helper();
 	}
 
 	igt_subtest("create-contexts") {

--3HFxHpVxPVBDr3vT--
