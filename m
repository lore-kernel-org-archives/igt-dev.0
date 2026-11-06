Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4F8606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 19:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=krackAFr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BAB112FAE;
	Fri,  6 Nov 2026 19:18:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB96112FAE
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 19:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793992582; x=1825528582;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sZ0JE0QB7WCigRK7+kaE5INjF8Npsd/lEb5Nelbk5JE=;
 b=krackAFrjQ+ZexET66Ww9TpAJKbKzIN8jGAjj8nBCmlKP+ft1buzqyIC
 VmsFPFknW7FnPwqzvMnerG6y7uQCe3Ec1WOJ/lVfl7gpVp3kV4MYhgAnf
 v/LKEv0oYmOsSssj37GurfyosE1aNOrC35K2LNdb8DWcNSQRXjTk7Hhv/
 Zb6NISxf0WYoyR3zYq1WaFRkBeTxO0rqIHu0N2DjVVxbDn/SJwHI83Zf2
 hj0sqKibOL/2SXK177R5iHiBSCJTU+FJRFo1i155zyMipsZ6/YSH1/gEZ
 R2ucWGXRK4z0cpK+abseVJjdryvLMaJO3xcrwfxOciAqNXtWxzn6tEDyN g==;
X-CSE-ConnectionGUID: KIpiiXyvSg6ldV4sjTrrzQ==
X-CSE-MsgGUID: EzbE5lHMSs6O6VeA20DN+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2844785"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2844785"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 11:16:21 -0800
X-CSE-ConnectionGUID: 6mP6uDIXSVqBAAZ5NL/MdQ==
X-CSE-MsgGUID: Yv9bTUbVQX+G8CpR/WVxIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7915248"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 11:16:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 11:16:20 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 11:16:20 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 11:16:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6sFDAjMF7J/NskgmthZuOfr/3CcSPoW3POl9sggUOeGWyixklfXWVAzkgdUKZMWW+ihU9gJVCzUjtlRzXphStvMeoZSP9N8cuTZG1jydwguyOPkWqJYoWIHA4YoVPdfQZaE08ptMsFt3MwL2N8CbQbGdrBaunxcfakFdqR2D8IP2H9j+hN1s2KIzRkwV1MCSoZSARLp6WT7aAkxTwTUcoGp95ENf8SNr0BqoMVlMBQ751VjOXEqQ3sb7K4AEbWyzAMIa0wjsin590EpxnHuAeV4sjZrIQdFdUkC39XdaarcVtnuzZXvzE9+GffZGCibn9jBn4plKbWb3cgcOnNFWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7Nk2a0ZHKPwaXwfF9b8YuBf7O78VRIIIn+zkLzIbUs=;
 b=OrE7xQoCPIHb8OhTXCd9XAEbfbHCrXxoVOxfWJKAm5rPuaBplr1iIXEMc3Qz8FlLK7JnvPmM0e0oUCF/IsJVwQ3J5IahesSiFg093VbkbB+SXBEHIcgcQ5WwwshWGd6VXF3sHtNe9fMqOXYMoak3DrbX7iwZsjH6ip9xm7xSSDJ86FREk6TZTPcLr4KzPGPPs0PlkslgfPaN9Z+l8awAZlmaDSMPqaWFbMw8RcgLtaWz6RWiLbIy8cN7hfkldz5vKV/lBLiqVszkT2JvSwg5e9m/8UFXtluGChoN8MEBsmAqu9Qebs6qU947HIKAd3AglYno8SbHhtHA/ASb2cLdVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by SJ2PR11MB7502.namprd11.prod.outlook.com (2603:10b6:a03:4d3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 19:16:13 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315%7]) with mapi id 15.21.0569.011; Fri, 6 Nov 2026
 19:16:13 +0000
Date: Fri, 6 Nov 2026 11:16:11 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v6 3/3] tests/intel/xe_exec_threads: Add
 multi-queue CGP_SYNC replay subtests
Message-ID: <au4ne09IT0ho_jUH@nvishwa1-desk>
References: <20261106183246.14482-1-jagmeet.randhawa@intel.com>
 <20261106183246.14482-4-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261106183246.14482-4-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::28) To MW3PR11MB4684.namprd11.prod.outlook.com
 (2603:10b6:303:5d::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4684:EE_|SJ2PR11MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: bce0ceb0-86e1-42b9-d39a-08df3c3a6c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022075727099003|261022113327099003|261009221227099003|261102123227099003|261022105027099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: v5WF1uiA2HbmgP+JO9gmnJSw2qxwsomqDlashL4RZ8NUQAeMFkD0/SJcfPPgpRuCdIFoPVrAjijYPSlv/q8i8OhXDfPbozVibRPI3xoNQ60OMNaOYlgMe7IQ6G4f7naqwQuqOC4nQeC2LPb4M69XPNqP1/M7RKxpsxHvraksGBJ+VVcEmF8QY6g5aCmLvI7GAU89PFBbdJnctfINMMwUg9Fe0x3Qc+XpqFH/hkAzfITtj6mgCJJ8hmCZ8VhYdibtRGXm/Voli8Vqjo0wEcXWI1JdLihr/dmCZ6Q/xQbI7lpV1BYOPX+x7ONZ4GMODbaKwW7CwSEjw545VRZnPPAL64h4STvJxGfPwtz5660Cx0Qu7I0xI4DZOTYU1BdxLoBHoYclU+MtWzN6MzUCRqRtiaugWfO863Ji4NK8DtRFfCzKruYZ6rLkNT8tYOBUm2sXB0Gm8N5regsjWgDugdJBir7eOSX38ncHHZ71qdX4wS5wNZU2WAQ1fXPMshscP6tJ5HRJqyskxH8g5tqtJmqrrzh5LpPhmYQsFrbGoTxN/FMs+YlVhItssPEd2ZKScRV/U/JavUUKLWG/aRUOYTydCTMNZ9+xRvgcY5oOpMfQCH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261022113327099003)(261009221227099003)(261102123227099003)(261022105027099003)(261021123027099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pvMXtlx+QU//qCIANV6ZowJvBlxyXmXa2uuZKQplPUKIz3hpmUdHQvrYH6YS?=
 =?us-ascii?Q?l7jXznplqMC90K1PaY4rYToKM0In8P0p/pA1L0IFlbdVvBJow+DMP1S4L9ZN?=
 =?us-ascii?Q?c8JvSABw5niAq52kIUh6hr5cPVSPSuO5KQDSUJaiInHZ4fRUkFB+u4yiY5BO?=
 =?us-ascii?Q?uNJtL6aXnzRB0qYjWn9CX6mtUpghbzMOECMuPp71mNfBsYUNOT8ckXA0uXny?=
 =?us-ascii?Q?H+dU7nyutFipmBaDoLCoY30ueIpVwsrGz80m+IufS6puN3aTSeA30dsfQ660?=
 =?us-ascii?Q?rENgYxD13LVAb6b/0ZDWsAw6ZCK+siNRtD8oxIszR1VyI23Ef95/3lLFryOK?=
 =?us-ascii?Q?QH9rwhLYcotpyrSfuNgtcUFzHkixVV5O5/9OeFyWEQp+M5lH1kHK3BAPeQBj?=
 =?us-ascii?Q?ndOWkqUroeKIuDocW+2A9JwtbNmMT8lW0e2WDbHCH/wKIQHON3tIoHT7M8NJ?=
 =?us-ascii?Q?TqdO5OcWwVvVHY2XMu4eCyGaB60OfLVQGGc11cUVaq+JSmwrGtfzGrsDXsHH?=
 =?us-ascii?Q?2pyW+YiyeCk5dAty4xuQTyJT39Gnq2wTR2uGK4qqiyMODytqj6ASbszQpuSc?=
 =?us-ascii?Q?xkeAeNZevNP3LguV/EtSNfEg/LnZtOowsv0gqTaSVObmQL0eRF3mZCDOewwP?=
 =?us-ascii?Q?nyWhg/OTrFwT9j1mXTfjOmE3xgF3zwwoxvVB3VX3rJYI4SvHF6lmoyeWWT2+?=
 =?us-ascii?Q?CcnMVNaXGXaqU6tGVKBDR4N8ENOEPja/V2j9nWKbT6+JZAQqM0/LyysR7Gzg?=
 =?us-ascii?Q?lWRsPo2qoNMBKSB63a2fYzqWJh7xXJgbNsjGCW+oYEjwMe6btOqA5VcyJ1G7?=
 =?us-ascii?Q?FWII/ocT/nSAOo6JzkXhuiKWSEsMkKXTsSn6rvskmVa2OmOnJCUXskoBBfIS?=
 =?us-ascii?Q?NCvyZSO6Gd2rP6K5ykK5AEQAOHbHLeU9dP3mwEXp4wykKrRAevTw88cqEV5Z?=
 =?us-ascii?Q?tNHBquAD+1nWLgMtal5mxFzmJpDxlcEwySQp8mCx/4xW2KV7p5nDvYdCoaFA?=
 =?us-ascii?Q?+QLgfMq+qs+kvVqoggpzLcHOkMFN0g1IVWYs/Bn7PjTJVj7tmaUVMHAfT/+T?=
 =?us-ascii?Q?e6nSIYop7iouHgrGSRFgbDW23njZizr4fg2jGyHJDKqrkZ2+ryJZbBYlgWiM?=
 =?us-ascii?Q?kwXGiMJMjU/gB+56MQBGxvBx+MWwZEiztPz5NeG7ag88WyHOvvy9bugnQnk6?=
 =?us-ascii?Q?zk0EcL6CWScknAd7NBlVcSngpdgT/K5ctiuEUd5VHloY9lh55Ly6sb1REhJj?=
 =?us-ascii?Q?mcZO/gh4uQ7kDnMrAwtpnJxvKLhRMMwYh7lwil0a39uBpEhMDlqzUmoq2yOq?=
 =?us-ascii?Q?6vuw9y14UHK/qM3FN0grbEkTzvtkQMk9exVfCxQ9DXrDcRauuO437HuooZBj?=
 =?us-ascii?Q?ULz0uhtXtRAAmfYKzXDPaK7EBzVVKvup4xA4uR+RBEfGCsGmm3wraaKYGOaU?=
 =?us-ascii?Q?3keKvASvVdIRc9sVX3SRM9/qGmwkGML5z88tHItxmByEzf1t+4rd9uM9uVn0?=
 =?us-ascii?Q?PcTc7fjdGDF6QrhNOm7uMcyJ2wpzYMy0F9j7QOZ+p1ZexpD7ZOQq4hnCsvxk?=
 =?us-ascii?Q?RobgubpsaivQFeLiGEdwFwXYTsVaMT2dNHQ4abThY7JCNWDuJPVZ1PxDJmgI?=
 =?us-ascii?Q?eETO20BsYZasi8xyX7LdifnUjP53yvfiSjfgoAOpvzniATf178QHuD5reCmU?=
 =?us-ascii?Q?USANPUeY79OWjRCtnIR/aWVTXnHJkXxVX5By8ELHVU93u8K3SVdm0b+IzAAq?=
 =?us-ascii?Q?pLEwnOR7Mvk5wdD/a7uQ9/2bLyUZNwuCUkEudQd2ucDTBM7+ubub?=
X-Exchange-RoutingPolicyChecked: dsT25uHkl+du81UTz8Qpe/ZrWWQpy648T7wo5BEDWvk4pxDwYlC6Xe4SSFhqkySFqdJTndD5kS0ouWfkaQU+ZAPiRCSeC55WojBJhyFYzBP/RDYK28h85TjrHAcojeDg4ROkXtEfk9EZIC42WbsOyn6USFAwdOPoyl5frzokyLEk6kERR5DIPw/fQX2OJJ9e2w7a77AIcz4C5qcEBYmgjUtijmvQ9S6GkB6G7q/wpTgHuH62AoymvlVDD9z75LniK0h7ap2obZgbZOXfPwXySICsu0Gv9mDnj4Mq7rPrpny67e67UsaL8LBdCdqWtiIZg4Kjw4PhWXFU94Yl+20c9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: bce0ceb0-86e1-42b9-d39a-08df3c3a6c26
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 19:16:13.0913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tB9UOrD77iLZAIrlzTlt08xVXM9Z3FOa1vUCZGWCtHn2lifhUlQTBPPZEamvtyl3cRsgDP5smF3PR51isu3DVEAcyAYNDUf04OsmSantyJRV4pJCgsbv2R2KsBfgk7M8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7502
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

On Fri, Nov 06, 2026 at 06:32:46PM +0000, Jagmeet Randhawa wrote:
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
>ones. Both are driven from the legacy and the compute mode paths, so a
>mixed mode run spreads the groups and the updates across both.
>
>A group holds at most MULTI_QUEUE_GROUP_SIZE queues, so asking for more
>queues than that spans several groups and registers them in parallel.
>
>Add MULTI_QUEUE_PRIORITY to issue a short burst of priority updates after
>each exec, alternating the values since the KMD ignores a set to the
>current value.
>
>Add three subtests built from these sources, repeated under
>igt_until_timeout() with a bounded wall clock:
>
>  multi-queue-many-groups                registers several full groups in
>                                         parallel from multiple workers
>                                         per engine
>  multi-queue-mixed-many-groups          the same across legacy and
>                                         compute mode workers
>  multi-queue-mixed-many-groups-priority drives dynamic updates on those
>                                         groups from a single worker per
>                                         engine
>
>Registration and dynamic traffic are kept apart. Driving dynamic updates
>alongside many parallel registrations makes an update wait long enough to
>exceed the KMD sync timeout, which bans the group instead of leaving the
>update to be replayed.
>
>v6:
> - Issue the priority burst from the compute mode path as well, and make
>   the priority subtest a mixed mode one.
>
>v5:
> - Rename the worker count to MULTI_QUEUE_THREADS_PER_ENGINE.
> - Move the dynamic array allocation to its own patch, it is not specific
>   to multi-queue.
> - Place queues the same way in test_compute_mode() so the group limit is
>   honoured there too, and add multi-queue-mixed-many-groups.
>
>v4:
> - Keep the multi-queue extension at its only use site.
> - Mask instead of dividing in multi_queue_group_value().
>
>v3:
> - Use the MULTI_QUEUE prefix.
> - Drop the many groups flag and derive the group layout from the queue
>   count, since a group is limited to MULTI_QUEUE_GROUP_SIZE queues.
> - Take the worker and queue counts from the section rather than deriving
>   them from flags.
> - No subtest destroys queues, so the churn flag and the queue recreate
>   path are dropped: registration traffic comes from the repeated runs
>   under igt_until_timeout().
>
>v2:
> - Drop the secondary churn. A secondary cannot be replaced within a live
>   group.
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> tests/intel/xe_exec_threads.c | 83 +++++++++++++++++++++++++++++++++--
> 1 file changed, 80 insertions(+), 3 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index 6f46781d8..6378b78fe 100644
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
>+ * Workers per engine for the registration subtests. Registering several
>+ * groups at once widens the window where one queue's CGP_SYNC is still
>+ * outstanding while another queue waits on it.
>+ */
>+#define MULTI_QUEUE_THREADS_PER_ENGINE	8
>+
>+/* Wall clock budget for the CGP_SYNC replay subtests. */
>+#define CGP_REPEAT_SEC		5
>
> /*
>  * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
>@@ -362,6 +386,27 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
> 		drm_close_driver(fd);
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
>+static void multi_queue_priority_burst(int fd, uint32_t exec_queue)
>+{
>+	uint32_t prop = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY;
>+	int z;
>+
>+	for (z = 0; z < MULTI_QUEUE_PRIORITY_BURST; z++)
>+		xe_exec_queue_set_property(fd, exec_queue, prop, z & 1);
>+}
>+
> static void
> test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 		  struct drm_xe_engine_class_instance *eci,
>@@ -446,7 +491,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 			};
> 			uint64_t ext = to_user_pointer(&multi_queue);
>
>-			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			multi_queue.value = multi_queue_group_value(exec_queues, i);
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
> 		} else {
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>@@ -491,6 +536,9 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 		exec.address = batch_addr;
> 		xe_exec(fd, &exec);
>
>+		if (flags & MULTI_QUEUE_PRIORITY)
>+			multi_queue_priority_burst(fd, exec_queues[e]);
>+
> 		if (flags & REBIND && i && !(i & 0x1f)) {
> 			for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
> 				xe_wait_ufence(fd, &exec_sync[j],
>@@ -691,7 +739,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>
> 			uint64_t ext = to_user_pointer(&multi_queue);
>
>-			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			multi_queue.value = multi_queue_group_value(exec_queues, i);
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
> 		} else {
> 			if (!(flags & MANY_QUEUES))
>@@ -789,6 +837,9 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 			xe_exec(fd, &exec);
> 		}
>
>+		if (flags & MULTI_QUEUE_PRIORITY)
>+			multi_queue_priority_burst(fd, exec_queues[e]);
>+
> 		if (flags & REBIND && i && !(i & 0x1f)) {
> 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
> 					   0, addr, bo_size,
>@@ -1237,6 +1288,12 @@ static void *thread(void *data)
>  * arg[1]:
>  * @multi-queue-basic:
>  *	multi-queue basic
>+ * @multi-queue-many-groups:
>+ *	multi-queue many groups
>+ * @multi-queue-mixed-many-groups:
>+ *	multi-queue mixed many groups
>+ * @multi-queue-mixed-many-groups-priority:
>+ *	multi-queue mixed many groups priority
>  * @multi-queue-userptr:
>  *	multi-queue userptr
>  * @multi-queue-rebind:
>@@ -1518,6 +1575,9 @@ int igt_main()
> 	const struct section {
> 		const char *name;
> 		unsigned int flags;
>+		unsigned int repeat_secs;
>+		int n_threads_per_engine;
>+		int n_exec_queues;
> 	} sections[] = {
> 		{ "basic", 0 },
> 		{ "many-queues", MANY_QUEUES },
>@@ -1764,6 +1824,14 @@ int igt_main()
> 			USERPTR | INVALIDATE },
> 		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
> 			USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-many-groups", MULTI_QUEUE, CGP_REPEAT_SEC,
>+			MULTI_QUEUE_THREADS_PER_ENGINE, N_EXEC_QUEUE_MULTI_GROUP },
>+		{ "multi-queue-mixed-many-groups", MULTI_QUEUE | MIXED_MODE,
>+			CGP_REPEAT_SEC, MULTI_QUEUE_THREADS_PER_ENGINE,
>+			N_EXEC_QUEUE_MULTI_GROUP },
>+		{ "multi-queue-mixed-many-groups-priority", MULTI_QUEUE |
>+			MIXED_MODE | MULTI_QUEUE_PRIORITY, CGP_REPEAT_SEC, 1,
>+			N_EXEC_QUEUE_MULTI_GROUP },
> 		{ NULL },
> 	};
> 	int fd;
>@@ -1773,6 +1841,11 @@ int igt_main()
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
>@@ -1783,7 +1856,11 @@ int igt_main()
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
