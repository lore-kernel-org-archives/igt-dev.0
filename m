Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1A0C43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 18:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AE910EA5D;
	Mon,  6 Jul 2026 18:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6hq6AW2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4512510EA46
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783362052; x=1814898052;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PRn2PjBjP4uWAW4OQLJwoglFnUnIgY2umRjK+IrTlFA=;
 b=W6hq6AW2t71CyL8chxKhleWJr9Dx8EZ77PA7MwwUSk1CmvYbMjZ7mtmo
 QrRJ70qFXuD+ym6Yhyy3CBEdxjJxJzlBgZzDs6b5huivGqcIhnq6S3aRP
 WeH26By22/OiLxaCFJIrdAoCSdk1MJyGbk7fffYHcYogktZXgMyGTgZrY
 mse3ZweoQTbQOo8ZPuFHlyjmgW3K10km5I+ojtMiR1/cu5tHpK+AlQ/XA
 t9eefvJMoycin5NQ2oCo5mdY1X3o6621CJ3f7TLBo4ww2APJ6njWK9nsO
 KBvh0K+24pj+s7E4qj8Uuo4BqUMxo702O+ckUl6TIeFiYDSBTynT5xGFJ A==;
X-CSE-ConnectionGUID: vYvQEpESQpWe7G4OhFCwOQ==
X-CSE-MsgGUID: yuBq2gieSDuQnIWHb9vx0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="95516468"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="95516468"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 11:20:51 -0700
X-CSE-ConnectionGUID: T8yU6urkTIK8D6Hry2Byyw==
X-CSE-MsgGUID: FrPFJ6OxTa6Gx9tsMdXl+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="255716408"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 11:20:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 11:20:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 11:20:52 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 11:20:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPnZMih0ytXbNejqQnlHqihK3Ol4U9ntxugfn0h09LHOkLjB8nlGTFNCJuN740+FYfkLeibdDei3sQiKPn4dIN6loQieRztudRxp0siNIHGP7xSmbS7HA1AO6+BTdfBSpyXaWXrmDAf7vRe7OXBaf2tbUiGcsZ5IdYPn2P0h2OypZHK9O4VWaW1jUAClkpM1uFWZz4TQP4p5Hkpn3xnmTkiwETtHz0Hc0pwcAFRm3qD1nMgaM4cXlNb4y43Tv9o3+7+h1yV+g838rAiwfZQocNyo1c9ftTDaCv/dJYYj4dazocquwDO3b1czUCs8zoKLiibITacPVvBmQzwsKnspgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yXBm3fPT6NwO54GQN6Dp1IzudZxeXLMPdLhswT0XRE=;
 b=YeG7+BAqBK3SC3ZMVqDCRSXIfRT234rorvUNPjlqw8zexg08c23FtUN++qR/ZUib5BIYOEygZiC5Y19u2+TMvDXNIVjz8SlZt2SOpAJ2Mdg8r40gAbrM5couQSYyZMvIkEJw/mM3xBuZd8lcnuQZI2u5DpQ6RDHE/+9d9gUikvOwsESCNrP6GelHO9QSpMs3TuLnqtba58RXM28Y42vXu8RvZlmBTxPgpoSEmoD0qEuEGboNhTuXNy5qtYQUJDuUUSfP3xtRhTCBqmLi96zxQ/hWdBtJwp/1lum4n6ZsmzUAges5/UTDudF3kKrkW3JOWnG1h/b/xGbDCPKpbhRkvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS3PR11MB9793.namprd11.prod.outlook.com (2603:10b6:8:363::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 18:20:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 18:20:50 +0000
Date: Mon, 6 Jul 2026 11:20:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Ignore expected
 CAT error in fault subtest
Message-ID: <akvyAC0XKxAyNtfV@gsse-cloud1.jf.intel.com>
References: <20260706181752.3039184-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260706181752.3039184-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR04CA0360.namprd04.prod.outlook.com
 (2603:10b6:303:8a::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS3PR11MB9793:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e840d5-1b47-4889-f371-08dedb8b4f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: aHnPB3u9wfy/w07kf0lMyER0QNWjw7en++L7s314aJEaN0GjQfKl/PfiZM1IB/c6rDkg83D+ya4RqyeDaTuCF/XgMG0kdZuMdxQHOH7yICb52+T/+kvM7L9seyAahUkCRJ4E3D7H8io1wRXE3WhjXcTImMna6W1vyd0tKDJgRizz3nkMtRw63XowHobjtjjoMaJJUnHhVW57HRtULxnq19icMErM5nRKig+7Hwq2KpvPCz6CxEEnXRgyDz0bP5qkNMUSahBv5VUQkqkcw61mnhFPe8Et+wRPV8aubiXDS9CnBZ4kqlbzGxFO/5Id59xHVNCxS8PEg2Zf78z8uPPtTBoowMogcnbjCsbLbp9tWi40QnGxFBLYCIc6XxORX8Vd0+CUU8Laz6mpXHa2tA4vUBzg+ctg/yrMdBZACxg1QQekhkiq2df6xgwcifvdbvh/pJowIw4XkTAemCgPns/fKRTRFnkV3bGwIJzXHba/OQwGZa64G3iQMAOVflhzlojuKWZ85A9N04DYjPkVLYZhYNd9Sg48UM7xEnlhi9J/2V85fkJ9/EB1s6HM2NGK0KXSEV1uIwGcn4/UCDPd4YG0Izavl4YcNQxNWw+CITz0FgqCh7caXDpM+iHwddXPv0JfrkHpv8DkMzc7T3+/cgiKErRZxb/cTUOPCkQKz5AJAKA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TyX0JlARTpAQiMj3XvDUGt8h1NVyIItrcTj2ig4McxnQnXOOipku4OhW/68Y?=
 =?us-ascii?Q?9Pl1GwXKmcFXFwk50yQq6x72qKSf1mCJKa8PgBkNOLzJLnbRMqDnHY+mINIB?=
 =?us-ascii?Q?KyuMePxisLJbmtje15TaxQq/n93sLPBUq9aC7JvAqoeMLXccWGZKZw9viMFC?=
 =?us-ascii?Q?AahcNBmid0B5gQo0jakYtDxxWdX7bICeSTRCOSd0i9A6Bu2YqipmCsAan4EQ?=
 =?us-ascii?Q?xri6MUkA0N91UokrVzHZ+9uLvrgSzLc7tH2wnWHBz6wR24rqHAdTx4zNBAP1?=
 =?us-ascii?Q?Q/c17QnGb1VFLhOvKF6IapYuGMpDF4DDn0QFDRzyqk/RrVvdQ3kCC7vbb7TL?=
 =?us-ascii?Q?cvem7QHSHN7W5Z6BH9haSH6zec64/EGBoRIAVTh2DJ0qh21h56Kfy71s8/9w?=
 =?us-ascii?Q?vQSCug+TjeTX7onwWRN8PIb1DT2loA94mxpvGKU5oJF0/EMKObFOz9BLkOrX?=
 =?us-ascii?Q?YtZ/jKXMOrzGT56vs6KOleXTReQTDnjCz0d85j/osVF/JEHrW1hItS2p2/Jv?=
 =?us-ascii?Q?s8b4q4sVoCgSShXl7vT9bZJIXkYFji4ClM2Wm+HLsPxIokDzZ8v031Zkuem9?=
 =?us-ascii?Q?uha1N7FMiIGthTfZFWeWpy+nnTtS/8yA1UGXC2fcBOjVD4WoNdDsQMniW64e?=
 =?us-ascii?Q?IQEOVyKw0EEzwivbrILqeVuF06xA4zyzL2v992WW9nojsHZAJM8WnSJTYp3P?=
 =?us-ascii?Q?WDqiBjMbj8rn272hIukwF0JPaP10Ce8b0PmmmASnqIvolph1yLmm3X0UGYh/?=
 =?us-ascii?Q?hB1YLCTl0CJNDNqHwAHo7BQ/tvQCmyysrllWk2P9MNwnm5m9rYWBLhC7q1M6?=
 =?us-ascii?Q?WqTfuaQX+dqp3ci0Vp24lwXd/F1pYKUW5Xc6rt11PlKgceP1SVpuLvDrpK1z?=
 =?us-ascii?Q?Wf+Egqlm9JF65gnDWKzA9YCuKceWYp9wWEk/DIfsgTFIUNHNLu3yQsgtXTx7?=
 =?us-ascii?Q?MzTaeXAPtTUPazlaEdyFi4qUMU92x5L6fnW+ojX4mzYWS2anRyUXbz+llmOk?=
 =?us-ascii?Q?NMnC2JwIePELVcIjBsdiWYujPe1A1WUhlN5rFjQtB29OKJR1M4EM1kNvllnX?=
 =?us-ascii?Q?Kj2iz7A485oYW5+YmqYF2WgQWauVuVSpS89umWSg1WBZYaHEZqt2ZAmnWjgK?=
 =?us-ascii?Q?9DQpYKNgEDdPNuoHF6lwoJPSFJJDgfrb84Yuai91Lltfhe7ZQ/iZLX+VuWKK?=
 =?us-ascii?Q?83VKgDRcVwqA9EtC2Ztl/OokbufU3eASQ7UuZy618shyLDhz40aoaeQvT7FC?=
 =?us-ascii?Q?AYHIR29dNpR/89Q9LpY4JujRa17X5+UOM0xtaClCa4PNkXJEYJTF5GHcW625?=
 =?us-ascii?Q?kOtTJBnICoVopX6FFxARuG1KXlp5ShEwCg6ZOiTMEKdnxMjovtwBKvc4sk8z?=
 =?us-ascii?Q?zqrSK2+HxnLhKKQ9PeTsEhgyXeeJcVcYj/zcGCj+8F1nPUcH6QNgXLq0A6/F?=
 =?us-ascii?Q?uaLRY58kEKFfgoPNY7SlyU12ndm0wUf5yYKAUQOUxSCiK7oNbxV0vtsf9qNQ?=
 =?us-ascii?Q?Lo8HxLjIxAuwmjnM60DFZ138xTwO0RbURGyiBoOKKorDAWY+lOCSiN/Unm3/?=
 =?us-ascii?Q?YC/6qAilRujyzUJAe7lyHyAHSDD+AyRe3BYO21qtoiTjzuwpwy+nDwbiBi6O?=
 =?us-ascii?Q?oWBS4ELGtl6bte3tbex8kWHumhHpWFu7/ZoQbpegt2Ity0P+cQFW0PalupSV?=
 =?us-ascii?Q?EmZvmpmOVSYUwj0Ay6ouvZIkgihThM+FcBIyHiF8nRYCew1mDE4Qo6k2ypfn?=
 =?us-ascii?Q?5bk2ksKP2Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: eD1QzcflKx2K1uRCBKeIn1V2fgfTfdMFzK8LePtUc2YDn4ZM+wZ8NE0yKDT1d63ARI2rBO/LdDYS0LLpnjWaNzkUHKFkO7HMxD7kMIhl/Rlq8yoyUGnzByOgPIPoJnnplKAKcy0CrrpXyJO7TO2RGrczDz93VUvGqF/REALmVFZskHZDkQlj0jECGPe8tVgj+k8JkW3Z4HYRwZmwtgb4EIWwLHUH9B6I9BWzW/YOEZ0XoLRbq7PZJ4MA/bVLToes0oH9NQ4bfKde7eWiI9FkhVQ9bV7Kbbu2b3GhIJFbtCF3JsfTKHS8EVvBhWZrKLcOWKsS2SKf/2jn2iDPu3AaOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e840d5-1b47-4889-f371-08dedb8b4f11
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 18:20:50.7969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mv/6S4Vw+GN8zGWvKcogzOWP7eTP2HkSDW5P8sCfe3u3vzVgBl0bZMWg4xsP9m5JnnvklCWY/zM78KZkKQCww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9793
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

On Mon, Jul 06, 2026 at 06:17:52PM +0000, Shuicheng Lin wrote:
> The 'fault' subtest submits an exec with a bogus batch address. The
> kernel nacks the unresolvable pagefault, which the GuC escalates to a
> memory CAT error and engine reset. The resulting 'CAT error' dmesg
> messages are expected, not a real failure.
> 
> Emit an ignore-dmesg regex to suppress them in CI. It matches both
> 'Memory CAT error reported by GuC!' and 'Engine memory CAT error'
> messages.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_exec_system_allocator.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 24fc5b708d..fd7520e519 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2752,10 +2752,12 @@ int igt_main()
>  	igt_subtest("threads-shared-alloc-many-stride-malloc-race")
>  		threads(fd, 1, 128, 0, 256, RACE | SHARED_ALLOC, false);
>  
> -	igt_subtest_f("fault")
> +	igt_subtest_f("fault") {
> +		igt_emit_ignore_dmesg_regex("CAT error");
>  		xe_for_each_engine(fd, hwe)
>  			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, NULL, NULL,
>  				  FAULT, NULL);
> +	}
>  
>  	for (const struct section *s = psections; s->name; s++) {
>  		igt_subtest_f("partial-%s", s->name)
> -- 
> 2.43.0
> 
