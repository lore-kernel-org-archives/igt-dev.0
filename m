Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696F6606D815
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 18:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O17Uf2Jp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A0910E56A;
	Wed,  4 Nov 2026 18:43:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECE810FCA5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 18:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793817760; x=1825353760;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Oo82izRLGjzR3dE1Emk+TbDP+OQE0G9bEpv84eRheIQ=;
 b=O17Uf2Jpm6FnsDUqNn6DPZB/kdkIkTWqvv3LsjjVqjoE6yheRpcgM7XQ
 AV2m1VD2WaPbcmUGWJ5uEWPYZmfuWhKjehSJMwPzElEZftMkeDu7HYywF
 uWL246JCGLV+fH9VFvamE/UopwNvOppt813Cwob4xp0+P8i7KCcP/ok8v
 RBE1UIkdeOUzPO4y+ocw69J5vfOQic+W9ZqmB3CWdrXIgwDM9rsy2zrK9
 KZXTXR8VdceS+ds5mraKZwtULGfPOXRSRrfAfIbNFFP6sJOd7imY2V242
 +Lj8teSCMBhZw436VNdtb8564j6AFxPMU3elzelC7UXRTXsldxRlsVdXL A==;
X-CSE-ConnectionGUID: 4rZVN9ZRQR+juavpb9Fdbw==
X-CSE-MsgGUID: x0NozpaaS563IxjqKCB5iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2473201"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2473201"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 10:42:40 -0800
X-CSE-ConnectionGUID: 1fZcXriRQeaZml705oRuyQ==
X-CSE-MsgGUID: Vl/LCqxuSlGzuW84a4R4SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="8655001"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 10:42:40 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 10:42:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 10:42:39 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 10:42:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxxUvTx+OdcgbbY/ltmjiJnlZEzEfKCVN6aQuFvW40y5NBQFFMwysUikmDRrFHyPVWcQNZrNuRR7E6/zUcEViH7NshHZackkg0ouSgGnxvzKpNizktd6WVYj+dvKH6xipJcTmDrfIEIWUQqlpPrLCuueCvrg9huRVoBCxmtw9Zj/YVuld4ceK6MNXqFggrprmBnJUXXWKr43Vei0x+v3buSA/xuD21/inEZOfm4F/0lYl8znEceY6YUE684llB+WNm6AlE73LKRSxaGtdyL2hCIl7nEzKa52D+Wczea2VnvAF0lUFEc9DmxzcBAGRR2BepwgfYaf/dQVp4LFXb7vBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hg+yYmcK3F4+1O1QGgADJ/Y3kDPjvAaW2ia2LuY+A3s=;
 b=myCWNpi+ARb2EGX8ZdszZMfhvmfaJ7uHk/PpBLS7shEhpZH1NTI1WzP1IH2yFNm/cHaZ/XuFWUPi2ijoXTWAP2hp93gJc2L4yqxQZWfqBka/B5gK1YEi0tf1F/e/5nFhE+ZrR/LsuMsiWm+apaorQ0jAiGtdVXvFCs2XHrds25CnMsNF/EH8SpYYUG6OjbUXuqprtKOrpzfQ8zqDMvaf3BNZjJCOHqQ8Xr6GTjbfHRkPhIjTQHrT3qJr3k/uTyWupafHT7EaF4ZiAcg4IAJre/M1paymW1qoL1K8TkLtaSDu/wMx4lpIsVGDVQrDuoNabQ7ZSQZAXRsRavF9M6Id1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by DS4PR11MB895587.namprd11.prod.outlook.com (2603:10b6:8:53d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 18:42:37 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315%7]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 18:42:37 +0000
Date: Wed, 4 Nov 2026 10:42:35 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/xe_exec_threads: Add
 multi-queue CGP_SYNC replay subtests
Message-ID: <aut8m2k1Rwjjf2uh@nvishwa1-desk>
References: <20261103195149.48923-1-jagmeet.randhawa@intel.com>
 <20261103195149.48923-2-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261103195149.48923-2-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To MW3PR11MB4684.namprd11.prod.outlook.com
 (2603:10b6:303:5d::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4684:EE_|DS4PR11MB895587:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d24cc9-817d-4658-ba39-08df3aa365eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10067099003|22082099003|18002099003|11063799006|56012099006|4143699003|261102123227099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261028144727099003|261009221727099003|261021121427099003|261021123027099003|261009221227099003|261009223327099003|261009223027099003|261009220027099003|261022113327099003;
X-Microsoft-Antispam-Message-Info: FaCnCi546N+dEQJTIZE7/DrMvbtXlXDm0if1kpWGlbNKAVPCRtf0jYiG+L7ua7zoW6ixJqXUNZ4oJZ4wzG2UMRRb7q5sLhQ/0rJNTXTFcKdV/sc2fYZPY1FYFMBgRhdlyJ2skOd+3b9czt8F5pmFDs8tdRmlPQxLeFH2KMYYvSuE9noBqlWZCN8E3JH8py/9PvWEfP+RCLBc8fI1F6wTYHuiQprlcyugs/p91n1ddEcEmeKS603rl8WmsHQa0kjHANxCCOvS+FYrQn03SCRBsFSWN53U8FSbmHzvJnqwoeoLnVK8WYNtB/yxch4mgYZgSzIL6i8bjMWMAG1YTOeOP2g+FB2qn8R7Brr3aq2PB6xTzEBk8GBm94rbzazVVYQXKH69+OaBYbf2BPd/YVpgOpaPjKndkp4lVpKpek6zBJfZgqJWdpNKk/XcTSzippkZqqkH2yXsQpBZy5hH7XDGNkge2/ywO2Qidz5KWuVtKEIv+5z1NjTtTAbPL+/99QOmNciFha0ZxITe/TKN2skWucDX+QSfOSd6FIYQGLNyTzL3PN7smbCQqE5FvAmoUXGNHDh17B8LMZjTMsljvr0foW7sWjmI+FW6OVnk9f9/W8M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(261102123227099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(261009221727099003)(261021121427099003)(261021123027099003)(261009221227099003)(261009223327099003)(261009223027099003)(261009220027099003)(261022113327099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4gnoDckjrrReBqYL7G67iHJCPATtRCsP7xlzlOspMUEsPxTHW79qnT/n4EE6?=
 =?us-ascii?Q?XMy9oWfZa+wI9U8uib5E0ESLCd3NS+v260f3nOdO6NmUgzSiz7rSdblX7Dvr?=
 =?us-ascii?Q?UENvcOemI0oSxvrAZYQn1HANYUWlGMIy3xtDYVgVwFWOojXZDfLKM+myFut9?=
 =?us-ascii?Q?wt3J4sCc57Xz+Ndc8AkrUAmKfGL2J9+F/DBc++NG0MZLyk55MXpQDb0fLvkt?=
 =?us-ascii?Q?WxKzAZM0AnjQARQ3uw+zYInJvbsGyTeZy492naqizrZO+OaRK4rX+7LtoK+I?=
 =?us-ascii?Q?WE0FHm8ikMsD0O7vKb9iyzJfbbwu3YC0Hba0bBd7m1QgNKQeXq4qAsFjMxtV?=
 =?us-ascii?Q?J1AiP/S1uVl5YcZQ5ZQ4lhXwFR1NBKycAvUnvGKptvuZUA7DSwSroUhXXI9+?=
 =?us-ascii?Q?FOclEQ7IBXABoGKCHtqKeuDj4+d/hwD/0Hso63tb3ugoR0el47snUYKQGxsX?=
 =?us-ascii?Q?OfrdRypNqiwdaXiRWiqsYF9gZtDmEWAv+JTdXb9hP/5FC9AYYuobo5Ho+ekW?=
 =?us-ascii?Q?ldexcvdfXHVgzIAnIBCIGnY+fqnXDYG3MtecsSUBFP4YoeszAVkbMHf4/Dfm?=
 =?us-ascii?Q?V14o5WhjRjXC+RM1PkPC2CHtHbuRPJB/CSPXbUouzZO34N8i+1YKhaBiz6yu?=
 =?us-ascii?Q?KAe8n2OF/GWv1DALqC6YH1EeEWWoAcWrtHTLv+j/2D9croy1DtEpNGkGrLYp?=
 =?us-ascii?Q?CWbj/Q6CS6302U6RBbiFo6oYdslcw3MCdcN8ldPW2tcJ3SApXRgd/aAoSoEi?=
 =?us-ascii?Q?+7tP+6ZWXxccGJxS40MNiJaylRUakpazTj22jtLqZcV5+CmYFCP2vMc3jHVL?=
 =?us-ascii?Q?kuPvHnKsXV20hvqhK0HL8vCpGrSMpq3p2jLP5dDZ5JloTdTch+9WXEjjQ8Ct?=
 =?us-ascii?Q?Hez/HcAZuNhZ1RaT4rjDCwOtbVz+VuN16PotHH8NhMyGwBm0TvBnZvD5/4OG?=
 =?us-ascii?Q?fqZlsD2B/WLjkZZlPD0ZeAOdou29LtPYQS0T+dN2w5jmrtDn9Bx1ABqiaWFV?=
 =?us-ascii?Q?vgNZpXKsJOke/gkvlBZtKnPOnDS2/TDRPA949PCSAKq1rEjzqC9qFtLsycyw?=
 =?us-ascii?Q?MowY8COLWl9CdMQqngXNrhlospzjHDNx0+7pyQTtjqYzmGV8+Elsit+w5nKv?=
 =?us-ascii?Q?EXXT4n7Cuw1FjxGue92T6O/0L/EFK3nGuJ0UIdpgRu8FOY9Gf7rUsGuMOOOI?=
 =?us-ascii?Q?RQVczQfKYO4IA/MFegqpVAPAaKhgZncqzeZj6V8lR6lZ9cVU8x6PVoE3Vzr/?=
 =?us-ascii?Q?Xfz/z+jn9qnve4B1zJZjs5Vn7G1qPThvQOiEgxDBb1OSjmaHArKWj+lJ5Omd?=
 =?us-ascii?Q?kQ7nveEBEbjylIDeCaTr/PDOKDuKZT2QgQE5/he803Y0Bm7QLubWwZStggak?=
 =?us-ascii?Q?vC7nMFZyKrL8BVKB+B1MwVKg8lzxU/QXK3hiLe4bCDwnkNxCcDZsvWsgL7yT?=
 =?us-ascii?Q?sP79f1SXwy4o8g+jm/KF/h+AarNSRkj0oAupmul6Y0uqjhVH+n6bPBxN7fXG?=
 =?us-ascii?Q?w1FxniNv554rr2/BE7yfk5wBGfkg7gxWah/2xQoObhJzNQlTvWszJHjHbezy?=
 =?us-ascii?Q?IMNODW4Aaec2qYaJ7hz5PkMtjGvQFI362E4Y7rzxJehG6do0M7qav2idDH/2?=
 =?us-ascii?Q?nylbYpCkgMUOshvD8OZGQGI12EhjX3YuTX//N0ouDegJIrzriB0ucGyMiPTn?=
 =?us-ascii?Q?WgisKxH5DuBL2+/Jypi4ARcmWppZPxjA9YVy6jCCngQrPf7Mlm4olTUTiCYx?=
 =?us-ascii?Q?AesdmLGfsFm8w+WaQwNHUNpxKHCzhbUrKD1MzJX7iL7Fph+3DQ5W?=
X-Exchange-RoutingPolicyChecked: qI6EYr0bOswh3Fo4kgHROMQgjfRgaHgo18L69Hievg6wjXaMJfVnvo3G/FsMZzq6n/WSVg3enTgcUj1lmFLG8O9eJg/FsXpnTvk3QSCvgZdO+eQRoUTgGHp5F3KZUK1Y/j4JPixP2zyaCz0kkr303HKCtaPE5WS9d02vaJavm3AB5zMCdELLa++fxRSqGIKebBm0jsNi1u2/4Dr3ld+w8pM9dzSxzce3adZjzTr6jlExOnlbRz10wufPZqASdJ5oahjxh8dFVrj9yVXG8k88jxTFUoqd2GwbEUSZKfiVImmF84u8tBJ5bKAfZB+349+6fCJtxbSpKIrgurZxlx0O2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d24cc9-817d-4658-ba39-08df3aa365eb
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 18:42:37.4697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0iPOq/2YE7H8+yH75pyoq0LMtHCjuk3/0H37ZZHZMa8KNU1vfA/jjZOA587XIwgZ05jmiA0hLdrkItYpbq1aK6DPwWtzU5hMxkON1j/Q5u61MOexgdKLJ+ngwmII4wm0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB895587
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

On Tue, Nov 03, 2026 at 07:51:49PM +0000, Jagmeet Randhawa wrote:
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
>queues than that spans several groups and registers them in parallel.
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
>v3:
> - Use the MULTI_QUEUE prefix.
> - Drop the many groups flag and derive the group layout from the queue
>   count, since a group is limited to MULTI_QUEUE_GROUP_SIZE queues.
> - Define the multi-queue extension once and only vary the extension
>   passed to xe_exec_queue_create().
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
> tests/intel/xe_exec_threads.c | 89 ++++++++++++++++++++++++++++++-----
> 1 file changed, 77 insertions(+), 12 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index e7e472b4a..19d7e8fdd 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -31,7 +31,7 @@
> #include "xe/xe_spin.h"
> #include <string.h>
>
>-#define MAX_N_EXEC_QUEUES	16
>+#define MAX_N_EXEC_QUEUES	512

If we want to increase this, then probably we need to dynamically
allocate memory for arrays that are currently using MAX_N_EXEC_QUEUES
as count and are having memory allocated in the stack. And allocate only
the required size. Otherwise, we are simply increasing the size of those
arrays even for cases where it is not required.

> #define N_EXEC_QUEUE		16
> #define USERPTR		(0x1 << 0)
> #define REBIND		(0x1 << 1)
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
>+	       exec_queues[(i / MULTI_QUEUE_GROUP_SIZE) * MULTI_QUEUE_GROUP_SIZE] :

NIT: can use 'exec_queues[i & ~(MULTI_QUEUE_GROUP_SIZE - 1)]'

>+	       DRM_XE_MULTI_GROUP_CREATE;
>+}
>+
> static void
> test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 		 struct drm_xe_engine_class_instance *eci, int n_exec_queues,
>@@ -638,6 +674,12 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 		uint32_t data;
> 	} *data;
> 	struct xe_spin_opts spin_opts = { .preempt = false };
>+	struct drm_xe_ext_set_property multi_queue = {
>+		.base.next_extension = 0,
>+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+	};
>+	uint64_t multi_queue_ext = to_user_pointer(&multi_queue);

We don't need to move this here if there is only one place where it is used.

> 	int i, j, b, hang_exec_queue = n_exec_queues / 2;
> 	bool owns_vm = false, owns_fd = false;
>
>@@ -679,16 +721,9 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 	memset(sync_all, 0, sizeof(sync_all));
> 	for (i = 0; i < n_exec_queues; i++) {
> 		if (flags & MULTI_QUEUE) {
>-			struct drm_xe_ext_set_property multi_queue = {
>-				.base.next_extension = 0,
>-				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>-				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>-			};
>-
>-			uint64_t ext = to_user_pointer(&multi_queue);
>-
>-			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>+			multi_queue.value = multi_queue_group_value(exec_queues, i);
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
>+							      multi_queue_ext);
> 		} else {
> 			if (!(flags & MANY_QUEUES))
> 				exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>@@ -785,6 +820,16 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
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
>@@ -1228,6 +1273,10 @@ static void *thread(void *data)
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
>@@ -1503,6 +1552,9 @@ int igt_main()
> 	const struct section {
> 		const char *name;
> 		unsigned int flags;
>+		unsigned int repeat_secs;
>+		int n_threads_per_engine;
>+		int n_exec_queues;
> 	} sections[] = {
> 		{ "basic", 0 },
> 		{ "many-queues", MANY_QUEUES },
>@@ -1749,6 +1801,10 @@ int igt_main()
> 			USERPTR | INVALIDATE },
> 		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
> 			USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-many-groups", MULTI_QUEUE, CGP_REPEAT_SEC,
>+			MULTI_QUEUE_REG_THREADS, N_EXEC_QUEUE_MULTI_GROUP },
>+		{ "multi-queue-groups-priority", MULTI_QUEUE | MULTI_QUEUE_PRIORITY,
>+			CGP_REPEAT_SEC, 1, N_EXEC_QUEUE_MULTI_GROUP },

So, we no longer need multi-queue-primary-only case where we destroy and re-create
queues (as in MANY_QUEUES) any more?

Niranjana

> 		{ NULL },
> 	};
> 	int fd;
>@@ -1758,6 +1814,11 @@ int igt_main()
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
>@@ -1768,7 +1829,11 @@ int igt_main()
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
