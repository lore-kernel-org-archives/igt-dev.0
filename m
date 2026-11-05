Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4651606A31B
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 02:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c2bFUQSs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E7610E8BB;
	Thu,  5 Nov 2026 02:31:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD23810E8BB
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 02:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793845841; x=1825381841;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dnizRMsygAjTYRpJ+G9E1qgnEArqXRcBKZxznPCyUUs=;
 b=c2bFUQSsQHQsaJMKbzrdo8sJwFjalVpcI9zzRFLEdo0witTQ7vA7f7p8
 ESjRn3QNha1RICzrsHLczR9tj9upAmsD+2cCBgFHUGl0kYgoA6jGk1Kfn
 AV07uyE7jjA/b8BJ+31oRfTvp6z6Rl9bY/cBbbGjjvXWrMMKy02B6FDBO
 dl3sJ7O2zD6r/9ZZE4v2XeUeqdROrqy9ZZ17irThEI0e+FWx8999Luovv
 WEGDx0heCJ3lgh/jIV9dAlJgxqlJao/Bs9MJq5okEwcuKVsaWga8KwqIg
 PjyZnJ1++omAVMpQPm9hw1DhAMSoMvCjZyHF8E0jARIbknhZk7LsAHec8 Q==;
X-CSE-ConnectionGUID: wzyj79y1TD2bpthvGBqVww==
X-CSE-MsgGUID: Jc88POfpTYqzBtZDqE2oDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2527685"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2527685"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 18:30:41 -0800
X-CSE-ConnectionGUID: D8oGKj4bRaiaSntg5VmHoQ==
X-CSE-MsgGUID: nvG5BFlcTBOAWjoV7G0rQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6760207"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 18:30:41 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 18:30:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 18:30:39 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 18:30:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMJGFTs24c1hcT008QCJO5Y2G3++fCo83XQKq5w3w0x0wCjaderTS4X+5QK3L7tkWl/wlPG2MBYJXJUtngnhR+wOvFzkCHN7jz5nCdOPO7FUTSNoaFShlqH6w6CT+dOvni6i9tcHz28XLRewGoTb4I57PRkC8loj8xV2Ib74Ix1mMj3JibndHXp/aUueYORMoMVioHnV/mu+csb9inv9hIqiC3u+YUjef3B54yGLMRWNWU+j1ZDE8Kw14d+UR/R6jrq6jU6Ui6gH9AcJDNeeQg1hu0rUnAbhmLK5qcr9y4ZwaJMJv7gI1HkugIwhKEsrebR9mfyCl+tKmlcRp0B+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQpCB9O+cqBQyi5vPa8BBv7w4hr1r79UblwplBUYcKY=;
 b=cXc2PCSFmqGugQpOrUZnbSrDGeYFnupBS37RZUgF8DOT2ESGG++/ZSKM0WNyMi/SILH5A3or+NvZA988h+jbVOpNrTQHrAk/+Neg8TqSglN2dKHqTVg4Q0sR6UlfO5ro7giJSLIJdarLGdqqxFsxXSm8K1ARfyry1CirYctGAUqbIbiMMxqCsZhjtPjsx3/kmQdUZh76lB4y8tuHbdT3mVpKsv1gad/OxwM6nBMCG8AaUYF2bcS2CYWCtCLrkOK6yNJ3/DXu8uiKoMYIAjmQD7YvNj6UzCateb+iYQiKfasjp1IijpGXd+r1AuyWXNKOYTju3i2ktqenF0uvVu9s7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by SABPR11MB9937.namprd11.prod.outlook.com (2603:10b6:806:4f0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 02:30:37 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315%7]) with mapi id 15.21.0569.011; Thu, 5 Nov 2026
 02:30:37 +0000
Date: Wed, 4 Nov 2026 18:30:34 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 2/2] tests/intel/xe_exec_threads: Add
 multi-queue CGP_SYNC replay subtests
Message-ID: <auvqSoR7W7bi8vAW@nvishwa1-desk>
References: <20261104201119.14137-1-jagmeet.randhawa@intel.com>
 <20261104201119.14137-3-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261104201119.14137-3-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To MW3PR11MB4684.namprd11.prod.outlook.com
 (2603:10b6:303:5d::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4684:EE_|SABPR11MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: b2cd0d4b-3aaa-4105-74bb-08df3ae4c67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|10067099003|56012099006|261102123227099003|18002099003|261009223027099003|261009221227099003|261022075727099003|261022113327099003|261022105027099003|261021121427099003|261021123027099003|11063799006|5023799004|261026140227099003|261028144727099003|4143699003|261026121527099003;
X-Microsoft-Antispam-Message-Info: ai2R9Uefccu8mO9zEWMUppHYeHlywAWqdBjUpBOh8H1YLEftucfV56U7/xPfIPaMeoUSOiEvaNFLbZa+OELl2/1ikXXWEiyasy/eEVmN11I1bekUlSM6bmwSMq/BqcMLiUh0uMd+Jk/vD8Kf6K4T+ci9bnPAv4Xo2yduRPKkvfy2quZjFEsZhzY026ybXVFMZnzFgwANKdElN+C47GT6XcXsD5+8jLMBzMZmkoU+Aywi77NgSpTfBEsk106Pn2fotQKmcKz1JrlecnlonvM9D6juFRcyqs2fK6LVg+f+aYI45VRpgYhA2zuGlVRr1h/4F+9cM66m/JkRGTcXky9D7WK6ti1CVMZS7U+Ifr54YfpwfY70NE271WVJ8xdy75B9dt3eNK7fUOzsE6nTJZ7Mk7zcXt8sU1cntoAbnodHilaLQ8MsrMYP1iEaHIXa3nVyj8HKsl4BlUQLKGYJzU/khWVKG7nG0V4X/10a+OBewlzZpjRtmoRrVUVeo4DaGJYe1WA5Q/b+AMtSZhYRim7pNOeBiycl4tyR8CGD1C/oaju3wnHngKY4L9zzX6gd9BTd8vY3vdwcGvVDGaVHBv9tWpkpcckpQ9KFkQBCZ7yotzbz0t0VmWpETgg3IuOA74Rb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(10067099003)(56012099006)(261102123227099003)(18002099003)(261009223027099003)(261009221227099003)(261022075727099003)(261022113327099003)(261022105027099003)(261021121427099003)(261021123027099003)(11063799006)(5023799004)(261026140227099003)(261028144727099003)(4143699003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oj9Rcz0jSnubIcRpEEOWkRjUPh0Cvpy4Xurzu6RXkolTF/L9zHkmP5Oczof+?=
 =?us-ascii?Q?Dnm8mgX7dKuMaagGwNNL2qO0LPm5JKjuasPWLzwX1WCPuNCNVp1dU63HUUKl?=
 =?us-ascii?Q?rZdAwD+LaWOPN5W9VGuILR3j0XvLv6vDfIVibJP/pKmgP+HGy08G9dGrsvUI?=
 =?us-ascii?Q?EjlZA7DfcFvbso/uvDw7fWw9zMnV99g4C283zNP4bcrkRRxMbnys+QOde2F7?=
 =?us-ascii?Q?QzYlOKM2Jor03kMAf5ICk9R5RChPbaTFOT3Tf3x7MvNdqRfWHuTPpKfkgrcR?=
 =?us-ascii?Q?vOVTMhOX+X//iY/PMX0T7vig8KAkMGe3Rl197hl3fPeg/E2kFneM5Pwlkgt6?=
 =?us-ascii?Q?XsIVSGvLF0tzh/KVDadBKHqKnfw55iQfMJkR07p2Wjc6+z+SFw00fEFU3ahM?=
 =?us-ascii?Q?TaWpaXflIP8MPd6VaKus+gkoPXTphGjisOR/GtPV183tHEZC3/hHQPlHuyOV?=
 =?us-ascii?Q?NV5bg9gt8kSXcI8x2NUXFE3yzk8Ixw5evIKkl2Os4BqSeW0yhijtj7IOqRbp?=
 =?us-ascii?Q?djstSkiSO0KW2w/8KF2ibw4mBAIMDGDYk15m/ExmjVkCb4MgNmgMKZF9UCOu?=
 =?us-ascii?Q?8EMoY3uyiFhs7yXmEfndSyfBJF2IMZHc6aCfnW7Ia7d6fxhy3d+EbKoVQunX?=
 =?us-ascii?Q?pk4zz41a704dappnyPzVUsSyVBpU6bElgI+QLjNoAVWLG4pjNGA8MXXHdb5E?=
 =?us-ascii?Q?inxNGk0f/TbaNLNW1XbbwemctG0BrA93JA/C5N20Yk0HVW1qJjLzOJw7YKQ3?=
 =?us-ascii?Q?5E5ur1bKbogm6FR9bE16sMwUamnk7hNpDv7eIyFIFSbiqVI0SGYFh23XZf0E?=
 =?us-ascii?Q?hW5fRmAB/oYLbxg6KHr7i6TzRR2VrSERzop502ZvzMMJgB6DRzscDQtW+20F?=
 =?us-ascii?Q?Wb3ZmBRcWw3OHp/9ItjJHjOlMsZ8Wq8t5qtLiEkN1TmZZrXPJqtWZTTytcZ4?=
 =?us-ascii?Q?xWaWzPdBgdzc0Ukz8XLRv+XUa+rRnygzDpUeb6OYJNsOl4BdGDuK64LTJI1d?=
 =?us-ascii?Q?2efGGKec/HSzBQhEXPUUdjC/MvOMkUWR14ZJYIts8SE0UKecsz6kQeL0mxWo?=
 =?us-ascii?Q?14HFSwBnhD3LHlN5vfiKOXBlzxjhHxdxnaOeIF1SFcFyYsDHT4iUjUm+TCgi?=
 =?us-ascii?Q?JkQ3p55YYB2JYmRru6PlcG82cgm3FAX/4BztVzGJ2jHLzfzvCR+LFk/umbjR?=
 =?us-ascii?Q?3Zn0bcXRpaPQ/Hz6gdDiCRv1zA+A3CXU+0N7SfFSvADPTkBdZ/mUJb15Xpjv?=
 =?us-ascii?Q?8pS8GbBNku3xXmAlT43bG4339lwNpnVKg4hcrEWZ7bP4yxHhZByjTkrdvL8D?=
 =?us-ascii?Q?IuHAE0zAoI+jeExUbfJrtDXTcWdGSFYoCSLVUWJrcYcjHM4Li/62AEWa1kP1?=
 =?us-ascii?Q?PyuijiqvzHAD8ArrLRF6rCk44wbqMSWQ2lDQH6RJgjf+jHawQxB/WxI8mUKe?=
 =?us-ascii?Q?ziCLD19SRhGnw0fcUga2vMjM/W4iJFJn/wtp54zIEVGlm32YcJ4NmYi+vYi2?=
 =?us-ascii?Q?z+I2yzAjtsVWCorHGDzcQZROg1+BFTL1DpQQyBziiEab1C8MoVL2VNNb0d2V?=
 =?us-ascii?Q?pY/ydtsxkZG7sx9iGdPo3SNwxlIVxVPClXfcqCLAg+S3I4pjlMxyf511faNP?=
 =?us-ascii?Q?fA6zroOhSRk0FrYQX3A2ebFKfpynw0U7/UL+zHH7yabppGhl+trdW6vAKlx1?=
 =?us-ascii?Q?7xmgstpMLiJUpjQE9W5E3vitKIaq0qqh6d6XPh7UDw9WaCAu2j/m4A+AeFsj?=
 =?us-ascii?Q?Lz4nhSCu8ZefuWjMJN3R0EtS4UrTIbneSR1dmBlyRKTDZ3JxaOVr?=
X-Exchange-RoutingPolicyChecked: mcrg9vbiqWN3inZwLTnjOizUNpPmful4eRBv8LRt1BYrR4jJSP+FQnKBIuQqtJEghHs1baryDlPe/NBvTJoabl7o8Y93rIC5LBNZsxFD+VJWaROu9xo6Zl+LfIofZSIZjTGX67VKpWOno+4lsF28RKCcLyMZpJz64SM+Qy9qTyIHU5HQyRZh5EcWIUWbxVkR+gZJxaioeg+KqWYPs+LHAr+2STjpTzscopAfPgeQ3VAHra2dguTfphTOaySC5qnbPVUgM5bb+X88XeKPl++weFqMfb8ubU7qDKgSRchkHAOvwpMeyT7CGImIRaFnne5UrqDinvYLg04O4QnLlNBLlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b2cd0d4b-3aaa-4105-74bb-08df3ae4c67f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:30:37.0956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZn+o6PSNqnIiQKvenKm00q/keudOKIDpSM5BglmVCpW7+T9Htka1IehyzTKJjGhLL8GDDz8HGdq7JU5Jops/ayGo1glx/5ONVjK6hnFUn3K6DbbTu9hKk3ZZp9f+bXh
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

On Wed, Nov 04, 2026 at 08:11:19PM +0000, Jagmeet Randhawa wrote:
>Add coverage for the replay paths introduced by "drm/xe/multi_queue: Handle
>lost message during VF migration":
>https://patchwork.freedesktop.org/series/165324/
>
>A CGP_SYNC message can be lost during VF migration and is replayed by the
>KMD on recovery. Exercising that needs a CGP_SYNC queued or outstanding on
>a live multi-queue group when the migration lands.
>
>A group serialises on one outstanding sync, so both CGP sources are needed:
>queue creation for registration updates, MULTI_QUEUE_PRIORITY for dynamic
>ones.
>
>A group holds at most MULTI_QUEUE_GROUP_SIZE queues, so asking for more
>queues than that spans several groups and registers them in parallel. The
>legacy mode queue arrays are sized to the request rather than to a fixed
>maximum, so the larger counts cost nothing for the tests that do not ask
>for them.
>
>Add MULTI_QUEUE_PRIORITY to issue a short burst of priority updates after
>each exec, alternating the values since the KMD ignores a set to the
>current value.
>
>Add two subtests built from these sources, repeated under
>igt_until_timeout() with a bounded wall clock:
>
>  multi-queue-many-groups      registers several full groups in parallel
>                               from multiple workers per engine
>  multi-queue-groups-priority  drives dynamic updates on those groups from
>                               a single worker per engine
>
>The two cannot be merged. Driving dynamic updates alongside many parallel
>registrations makes an update wait long enough to exceed the KMD sync
>timeout, which bans the group instead of leaving the update to be replayed.
>
>v4:
> - Size the legacy mode queue arrays to n_exec_queues instead of raising
>   MAX_N_EXEC_QUEUES, which would have grown the stack arrays of every
>   other test.
> - Keep the multi-queue extension at its only use site.
> - Mask instead of dividing in multi_queue_group_value().
>
>v3:
> - Use the MULTI_QUEUE prefix.
> - Drop the many groups flag and derive the group layout from the queue
>   count, since a group is limited to MULTI_QUEUE_GROUP_SIZE queues.
> - Take the worker and queue counts from the section rather than deriving
>   them from flags, on top of the preceding patch.
> - Four subtests down to two. Neither remaining subtest destroys queues, so
>   the churn flag and the queue recreate path are dropped entirely rather
>   than renamed: registration traffic comes from the repeated runs under
>   igt_until_timeout().
>
>v2:
> - Drop the secondary churn. A secondary cannot be replaced within a live
>   group, so MANY_QUEUES is no longer combined with MULTI_QUEUE and
>   MQ_CHURN_INTERVAL is gone.
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>---
> tests/intel/xe_exec_threads.c | 88 +++++++++++++++++++++++++++++++----
> 1 file changed, 80 insertions(+), 8 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index e5056192b..393ab8d75 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -50,6 +50,30 @@
> #define MANY_QUEUES	(0x1 << 14)
> #define MULTI_QUEUE		(0x1 << 15)
> #define WQ_STRESS		(0x1 << 16)
>+#define MULTI_QUEUE_PRIORITY	(0x1 << 17)
>+
>+/* Mirrors XE_MAX_GROUP_SIZE: one primary plus its secondaries. */
>+#define MULTI_QUEUE_GROUP_SIZE	64
>+
>+/* Enough queues to span several full multi-queue groups. */
>+#define N_EXEC_QUEUE_MULTI_GROUP	(8 * MULTI_QUEUE_GROUP_SIZE)
>+
>+/*
>+ * Multi-queue priority updates issued per exec. The values must alternate:
>+ * the KMD ignores a priority set to its current value, so a constant value
>+ * would generate no CGP_SYNC traffic at all.
>+ */
>+#define MULTI_QUEUE_PRIORITY_BURST	8
>+
>+/*
>+ * Workers per engine for the registration subtest. Registering several
>+ * groups at once widens the window where one queue's CGP_SYNC is still
>+ * outstanding while another queue waits on it.
>+ */
>+#define MULTI_QUEUE_REG_THREADS	8

Though we are using it for validating registration time cgp sync drops,
the test itself just creates this many number threads per engine.
Probably better to rename it as MULTI_QUEUE_THREADS_PER_ENGINE.

>+
>+/* Wall clock budget for the CGP_SYNC replay subtests. */
>+#define CGP_REPEAT_SEC		5
>
> /*
>  * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
>@@ -611,6 +635,18 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 	}
> }
>
>+/*
>+ * Group membership for the queue at @i. A group holds at most
>+ * MULTI_QUEUE_GROUP_SIZE queues, so a larger queue count simply spans
>+ * several groups.
>+ */
>+static uint64_t multi_queue_group_value(uint32_t *exec_queues, int i)
>+{
>+	return i % MULTI_QUEUE_GROUP_SIZE ?
>+	       exec_queues[i & ~(MULTI_QUEUE_GROUP_SIZE - 1)] :
>+	       DRM_XE_MULTI_GROUP_CREATE;
>+}
>+
> static void
> test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 		 struct drm_xe_engine_class_instance *eci, int n_exec_queues,
>@@ -620,15 +656,13 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> 	};
>-	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES];
>+	struct drm_xe_sync *sync_all;
> 	struct drm_xe_exec exec = {
> 		.num_batch_buffer = 1,
> 		.num_syncs = 2,
> 		.syncs = to_user_pointer(sync),
> 	};
>-	uint32_t exec_queues[MAX_N_EXEC_QUEUES] = {};
>-	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>-	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
>+	uint32_t *exec_queues, *bind_exec_queues, *syncobjs;
> 	size_t bo_size;
> 	uint32_t bo = 0;
> 	struct {
>@@ -641,7 +675,11 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 	int i, j, b, hang_exec_queue = n_exec_queues / 2;
> 	bool owns_vm = false, owns_fd = false;
>
>-	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>+	sync_all = calloc(n_exec_queues, sizeof(*sync_all));
>+	exec_queues = calloc(n_exec_queues, sizeof(*exec_queues));
>+	bind_exec_queues = calloc(n_exec_queues, sizeof(*bind_exec_queues));
>+	syncobjs = calloc(n_exec_queues, sizeof(*syncobjs));
>+	igt_assert(sync_all && exec_queues && bind_exec_queues && syncobjs);

This change is also not specific to MULTI_QUEUE and should be moved to the
prep patch (patch #1 or separate prep patch). This patch should be multi-queue
specific.

Also, I am seeing this change is not done in test_compute_mode. Looks like
the new tests are not compute mode tests. We should make similar change in
test_compute_mode() also and add compute mode/mixed mode tests also.

>
> 	if (flags & FD) {
> 		fd = drm_reopen_driver(fd);
>@@ -676,7 +714,6 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 	}
> 	memset(data, 0, bo_size);
>
>-	memset(sync_all, 0, sizeof(sync_all));
> 	for (i = 0; i < n_exec_queues; i++) {
> 		if (flags & MULTI_QUEUE) {
> 			struct drm_xe_ext_set_property multi_queue = {
>@@ -687,7 +724,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>
> 			uint64_t ext = to_user_pointer(&multi_queue);
>
>-			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			multi_queue.value = multi_queue_group_value(exec_queues, i);
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
> 		} else {
> 			if (!(flags & MANY_QUEUES))
>@@ -785,6 +822,16 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 			xe_exec(fd, &exec);
> 		}
>
>+		if (flags & MULTI_QUEUE_PRIORITY) {
>+			uint32_t prop =
>+				DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY;
>+			int z;
>+
>+			for (z = 0; z < MULTI_QUEUE_PRIORITY_BURST; z++)
>+				xe_exec_queue_set_property(fd, exec_queues[e],
>+							   prop, z & 1);
>+		}
>+
> 		if (flags & REBIND && i && !(i & 0x1f)) {
> 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
> 					   0, addr, bo_size,
>@@ -942,6 +989,11 @@ wq_stress_cleanup:
> 		xe_vm_destroy(fd, vm);
> 	if (owns_fd)
> 		drm_close_driver(fd);
>+
>+	free(sync_all);
>+	free(exec_queues);
>+	free(bind_exec_queues);
>+	free(syncobjs);
> }
>
> struct thread_data {
>@@ -1228,6 +1280,10 @@ static void *thread(void *data)
>  * arg[1]:
>  * @multi-queue-basic:
>  *	multi-queue basic
>+ * @multi-queue-many-groups:
>+ *	multi-queue many groups
>+ * @multi-queue-groups-priority:
>+ *	multi-queue groups priority
>  * @multi-queue-userptr:
>  *	multi-queue userptr
>  * @multi-queue-rebind:
>@@ -1507,6 +1563,9 @@ int igt_main()
> 	const struct section {
> 		const char *name;
> 		unsigned int flags;
>+		unsigned int repeat_secs;
>+		int n_threads_per_engine;
>+		int n_exec_queues;
> 	} sections[] = {
> 		{ "basic", 0 },
> 		{ "many-queues", MANY_QUEUES },
>@@ -1753,6 +1812,10 @@ int igt_main()
> 			USERPTR | INVALIDATE },
> 		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
> 			USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-many-groups", MULTI_QUEUE, CGP_REPEAT_SEC,
>+			MULTI_QUEUE_REG_THREADS, N_EXEC_QUEUE_MULTI_GROUP },
>+		{ "multi-queue-groups-priority", MULTI_QUEUE | MULTI_QUEUE_PRIORITY,
>+			CGP_REPEAT_SEC, 1, N_EXEC_QUEUE_MULTI_GROUP },

As commented above, probably adding compute mode or mixed mode tests also here
would be good. I would suggest probably adding one 'multi-queue-mixed-many-groups'
would be good enough.

Niranjana

> 		{ NULL },
> 	};
> 	int fd;
>@@ -1762,6 +1825,11 @@ int igt_main()
>
> 	for (const struct section *s = sections; s->name; s++) {
> 		igt_subtest_f("threads-%s", s->name) {
>+			int n_threads = s->n_threads_per_engine ?
>+				s->n_threads_per_engine : 1;
>+			int n_queues = s->n_exec_queues ?
>+				s->n_exec_queues : N_EXEC_QUEUE;
>+
> 			if (s->flags & MULTI_QUEUE) {
> 				igt_skip_on_f(!(xe_has_multi_queue_engine(fd)),
> 						"multi_queue is supported on graphics version 35 and above");
>@@ -1772,7 +1840,11 @@ int igt_main()
> 			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
> 				ignore_multi_queue_hang_warnings_in_dmesg();
>
>-			threads(fd, s->flags, 1, N_EXEC_QUEUE);
>+			if (s->repeat_secs)
>+				igt_until_timeout(s->repeat_secs)
>+					threads(fd, s->flags, n_threads, n_queues);
>+			else
>+				threads(fd, s->flags, n_threads, n_queues);
> 		}
> 	}
>
>-- 
>2.53.0
>
