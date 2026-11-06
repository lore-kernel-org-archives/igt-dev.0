Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EF3606A31B
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 03:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TZnsA8f7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924CE10E259;
	Fri,  6 Nov 2026 03:15:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0108510E259
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 03:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793934895; x=1825470895;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ep70fqIQahfNHdIG1VbS4Ta8H62QSLDbdnmfBlYybvk=;
 b=TZnsA8f7usyKeMozcnimYPDt8Ac2WqDxf8k4Ra5SuDpFFg7VEZDJFyDh
 nq+83jBj4BzesKUt9t/YSKGbQM7toULkce2kp8iPycDhc01tGCj33cfkz
 AEyU3HYJ8UhLfAI43o4GjSNMOhujFlACG/y9xqMzhM2aaZPfwLLJObktZ
 aVN6jrXmW/B4bkGqezX5sty2HXl9G+Ktx4rJRIxLYD6Y16VFGSfby1fxD
 zcL2svUT9LYw3TcKxW1p8xzqXeay42YjyKd8L+TNc3Fx8bukv5Je4xGKo
 QFlslw6z2Lnb432syJ5KrXQmFttR0/CiDgouLFBfb6TGYK7nbK6fBoWPS Q==;
X-CSE-ConnectionGUID: YwSSDCiZRy6Rz4yCCJpfxg==
X-CSE-MsgGUID: 22jb0DOwQ+6kH0r9gVdLcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2776346"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2776346"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 19:14:55 -0800
X-CSE-ConnectionGUID: oeBU5lc8R6aj3nPR8rEIow==
X-CSE-MsgGUID: Z+bh0fMkSn+M2jZnU/Y4cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7072836"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 19:14:55 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 19:14:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 19:14:54 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 19:14:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnqdsvc72Wew70/D2oSnminGZe/y8EuKKcmaqOcSyXe4VqJg2zOSNK+J0ebQ0WURR6BXTAR50ZMQ6oh+DLWP99WdoCKGcyhqgS2Hh8VgBMFtEcjY0qYpQpRBwaNf94So3mf9Usw807bnXjQ1pLEt2pVPG0FQprsit2pJvv0D9smH5twHP5aCOQc+F1u5VSxyXTzttRmn8h6Kbp/YNTITUIHMZ44js3FU5rpkdvE4A10PWpxaaQm8o1EdPgnhd5eIN8zb5kYDjO6SJTbgGUjaPfvpkj2VazCKXWfNFhLBlaCodzSwVPsaN0F4HGCaYmOXzTKm9JPS9VCkKoYTri4q0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7qhB56FAA8ZofdzwyS5/slZzZsl3hg+6akqXSfxXpo=;
 b=q476x0WyVc9BdPyRjLX471Pxem8rShfLG+d3URPjw402dWry5/FugHncAVce73Xb+Bda2GgZ8Ovc9Q5KlHrBfRN+9Cfugh2LcNdEHFyzhwGvljF26ETQr5HEAz7LNlqVb3ef9SSgh+RgfN4z8WZvsHIWA3sYjxV5K6p6iaJeZi6cmPV8riN5Rze3KN1d2IA8KLHi0+USeI+hAp33QSXaIDcSaHsoB2NV9XmT2aQN2TVn575JA9mk9bdfocihNqtAxV8N97GMVUMTp93cCQdC5DBnUpHoBbRvlo18sPbSk8w5mzF/uM9A4o+JZr4FCActvEfHksWSNt6REsKEBpmuNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by DSVPR11MB9579.namprd11.prod.outlook.com (2603:10b6:8:383::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 03:14:52 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315%7]) with mapi id 15.21.0569.011; Fri, 6 Nov 2026
 03:14:51 +0000
Date: Thu, 5 Nov 2026 19:14:49 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v5 3/3] tests/intel/xe_exec_threads: Add
 multi-queue CGP_SYNC replay subtests
Message-ID: <au1GKVdjKPj0Lj2o@nvishwa1-desk>
References: <20261105184242.14910-1-jagmeet.randhawa@intel.com>
 <20261105184242.14910-4-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261105184242.14910-4-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:a03:331::19) To MW3PR11MB4684.namprd11.prod.outlook.com
 (2603:10b6:303:5d::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4684:EE_|DSVPR11MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d5517a8-3da4-465c-764e-08df3bb41f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|10067099003|4143699003|261026140227099003|11063799006|261026121527099003|261102123227099003|261028144727099003|261022113327099003|261021123027099003|56012099006|261009221227099003|261022105027099003|261022075727099003|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: BOOH0Ks/jVH1aJx9JQdxcjYHQqlEo3DGAXl0HFc2BRvOFSAQshjEgQ80mXjdw0p2x+GUGxYSI5FrUpDf7hOGvPQGNDLiglsPs6S+GjQ8eL3Z30XeryQRxkHsFxGZra0DC5ra7i7ILoB/HKh1FPGBmHnReT4pC2+jJMGE7z0fYuK2o8x2lwPn4R6pPFmAG8gpfqsbIRBpzrLJ7bnJ9OOFDHtAuKY8Cm8AP516hKm5V8iNZvd1X/xkannPgmztlqERWUenv42GYpc9V2OC5dPALp8RjG+U1MCWj2n4pJGpocklBtN2g4tAexzjzI0Wxm/rk7Euf7HuCEfBCfkg4BCg3V1/pDGwKVR6PdrSkYE3LtURlKoChpMsNEmQER4WLt6hk+wJi0/k+Ld/uBw9HIRMos7p92NqxFh/1Ll54MtXbXEmH2ItJg2caShnDq2unm+2kEN8zrsH02VxUziWhAaPZkbtbnYmfVhKl5kj6owlaM+X1/lkPb3lM8HEeAd2uzvOy8hOUmoVatGB3lG24j5E4x7mUzQwY67GBcKjP1kroEyZ5Nh0P8w+TDGj+OCciRwmzn8eCkRGxu395/HA0MN0/Hsk5EFJdFABY5HgBzuvJck=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(4143699003)(261026140227099003)(11063799006)(261026121527099003)(261102123227099003)(261028144727099003)(261022113327099003)(261021123027099003)(56012099006)(261009221227099003)(261022105027099003)(261022075727099003)(261009223027099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DuHQcmk3xrlLmgqdg991rKYNTdwPUk8BF0sPnI/PByacMtr95VQQwdGC8umZ?=
 =?us-ascii?Q?umEUVzBpk2vMdru+Ags+P4/viU1ksgtMQ8BFahYEnm3l6Eq2VwsdOojFLyKw?=
 =?us-ascii?Q?jFul/LUXllL0y/BXWDwrHzfzCUR8FHNdAUtWVzR3TeyuBTZJRozvu1pXsKZ6?=
 =?us-ascii?Q?gzrcsB/lu/4XXnGYGRiH8Gm46LYvNAa98kSsrnqOdM/r5djvMdi4ioawFtUs?=
 =?us-ascii?Q?A1qogwcaWaEuRCS9UcZan+wTF18VQ/DE6oUdG8al3blT6pmnLwAitFcREo9t?=
 =?us-ascii?Q?slj5eaZiSP8i87Md5s8qfOHk5YQ469gi3BUQEyfa7GHCfH6PbVRwonFdRLph?=
 =?us-ascii?Q?IrF04ORcKpfS+Qy+NwYzWQtcyXqU+2pU9zBaPZtt5tOg5xgoAY6VhrlZeV+C?=
 =?us-ascii?Q?X0qe8wdPwZ/d9b1Urud+ieOxB6DJJ/4pPnUPfc10H+nSvNEZCXyUIyaeLtir?=
 =?us-ascii?Q?DKrqb3fjv2BybhcnyR2qq4IQo9P0RGcNGlxbaQj1WXOcL9a5MibNpcEhTCNq?=
 =?us-ascii?Q?flt6xro6i3ONfii0k9Fy+uIH3d+yGJkhQv5Qpz/4rlrVyyAl3oRPMbv3CGc2?=
 =?us-ascii?Q?rPOflWoRN5PwmdVTf6EEPR1E6Wj5i/iyCoAkFvif0Z7vuQq6xF55JYyICY61?=
 =?us-ascii?Q?5aok/4wyS7aF7x7jC9e/vmmijDD0e539b6/o4MWB2Fd/xQApO1o8oFWto6LC?=
 =?us-ascii?Q?m0SqMAHSEaoTllcXgRT2CsvT+Ztmq7UiGAoNx9/s6DPUsTnBUnjlTIeFkc3i?=
 =?us-ascii?Q?4tdENwSrCL6iMfY7puPwo3SnJ5jpUi3v8vmwrjLdq7MIHENn1p3+JNSnV3jx?=
 =?us-ascii?Q?HTLE9fD4bvdEsH1pccoI+4tcI/7AASGdKCitAZsJ7lbG58Gag/YDag0ncKQD?=
 =?us-ascii?Q?PYkMe1mV72MjbSf5qy8P/7VFOlFj6OTEjJihwAUqSotD9gS/K0fzaqoq3OwT?=
 =?us-ascii?Q?t+v/4ngu+5LKOFkoOtIDUe/onpBOlRI9L18l0Ll9JgiprKx0JzonQJyu88B/?=
 =?us-ascii?Q?9lp7aVVGzSYOdZEWd23IXBPuCtnaDlA49mPESf+oL75kEEvFfY8V1nZASc4S?=
 =?us-ascii?Q?FJ7S+ZTFXM9iIijDBBYia1BnI/Sk25w9USiorqEYDcYzO2XPyww2yiBJJisn?=
 =?us-ascii?Q?febEjJwRLOVqcneV9KWuQBW4snM0Q5OFb/947x01Kf/gPW9FWXRcnpK7zwcf?=
 =?us-ascii?Q?svbw9svThR3g66lAIH/xgs1rHI/R/jpOdte+Iw9jMrdvUoKwDLYwCqRhITg2?=
 =?us-ascii?Q?T1RLO5MCLmQy25q5CGdC6OBs+NReW2I3F0gqxwpNNCsAD0Sc6nZLZejRYPT6?=
 =?us-ascii?Q?qk4J/tJ0eF1b6CjMOK4sYt7q5Ej9Ub5evCWAHenYK4fmkFVOG17AASzJbSNh?=
 =?us-ascii?Q?irlQh7yLt4+vabyDIwpPEn8JkC8Nfdh6DzY27MXuQb0BOIITKowa6/uwUfeS?=
 =?us-ascii?Q?dyEAlR+OiZPln9AJZMIFy5WpbZH2jnufYv1QPVzJzFslen/QCyPvoUAuXY8i?=
 =?us-ascii?Q?9qJh9ZFMQ6u2PpjC6Xt/qyyGArJ0quPXlkks4lZSzoLOcDlJI8c5nWWmANEE?=
 =?us-ascii?Q?XkrYqXmg2mKXXKDXqdwJnKDt96dSms8mXihHiYGe1GQdIweIa/IAP3NmPHJm?=
 =?us-ascii?Q?1UTcnbK3rEjXy3zNdq20b5SmWAmroRMrcYZWxwrhFK8wHfg8fWvzUOaH4bmQ?=
 =?us-ascii?Q?VS1WB0C97fBrzOp3cRjVn2TByeazo7Nw84M+v7w9yncPEX+NQFXLER1CA9qf?=
 =?us-ascii?Q?C8ROIG8FmpmV2mBd4Mw0pP6buEFrEtv2q75WIdPzz3YUO7e1jFpr?=
X-Exchange-RoutingPolicyChecked: sv9osyZaVhQcvVy8R/3tL9BqY3SEEEdZgEXnM/MXu40fd5n1yHiyeFxWW/MUaa/yzs9fi/veerr4k72LlOjAc49mcWL72NYvhx8EeWZJ3nGwv7hdU/H8Tl7Y279OWDIjVCoxF+Pe8vf0XS93WTRNT7MdUUZHBUZdh7wJ5RM32XWeFx1JvEiSBioi7kkZIekbCiMpH/u15hMSGG9DKDl1Wr6v9tMHYv5SwBYBSsCfkY0hjnoDNV1VpRomomUeMQ1lrp4yS1USaaY2LA7Tcm2ZPmZ4NKu+cytYhQTlCW9aAoX/VtAaM5IWdXlhJlunujsQ0RxNZFIf6WY2g7CyUog2RQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5517a8-3da4-465c-764e-08df3bb41f63
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 03:14:51.8994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6usazDfshzBVRxsP0mDYGHy6OD1B+o+pjIJlp9gyWQvXNfWmkWlEGstgcjt9Ju2J3ydqidM2egEfpiIvdot8OwFP+FU/qR8pBbvwBnylXgIWnrjO7VgNxejdZwmIXvyk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9579
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

On Thu, Nov 05, 2026 at 06:42:42PM +0000, Jagmeet Randhawa wrote:
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
>queues than that spans several groups and registers them in parallel. Both
>the legacy and the compute mode paths place queues the same way, so a mixed
>mode run spreads the groups across both.
>
>Add MULTI_QUEUE_PRIORITY to issue a short burst of priority updates after
>each exec, alternating the values since the KMD ignores a set to the
>current value.
>
>Add three subtests built from these sources, repeated under
>igt_until_timeout() with a bounded wall clock:
>
>  multi-queue-many-groups        registers several full groups in parallel
>                                 from multiple workers per engine
>  multi-queue-mixed-many-groups  the same across legacy and compute mode
>                                 workers
>  multi-queue-groups-priority    drives dynamic updates on those groups
>                                 from a single worker per engine
>
>Registration and dynamic traffic are kept apart. Driving dynamic updates
>alongside many parallel registrations makes an update wait long enough to
>exceed the KMD sync timeout, which bans the group instead of leaving the
>update to be replayed.
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
>---
> tests/intel/xe_exec_threads.c | 77 +++++++++++++++++++++++++++++++++--
> 1 file changed, 74 insertions(+), 3 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index 6f46781d8..969e845ff 100644
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
>@@ -362,6 +386,18 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
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
> static void
> test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 		  struct drm_xe_engine_class_instance *eci,
>@@ -446,7 +482,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 			};
> 			uint64_t ext = to_user_pointer(&multi_queue);
>
>-			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			multi_queue.value = multi_queue_group_value(exec_queues, i);
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
> 		} else {
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>@@ -691,7 +727,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>
> 			uint64_t ext = to_user_pointer(&multi_queue);
>
>-			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			multi_queue.value = multi_queue_group_value(exec_queues, i);
> 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
> 		} else {
> 			if (!(flags & MANY_QUEUES))
>@@ -789,6 +825,16 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
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
>@@ -1237,6 +1283,12 @@ static void *thread(void *data)
>  * arg[1]:
>  * @multi-queue-basic:
>  *	multi-queue basic
>+ * @multi-queue-many-groups:
>+ *	multi-queue many groups
>+ * @multi-queue-mixed-many-groups:
>+ *	multi-queue mixed many groups
>+ * @multi-queue-groups-priority:
>+ *	multi-queue groups priority
>  * @multi-queue-userptr:
>  *	multi-queue userptr
>  * @multi-queue-rebind:
>@@ -1518,6 +1570,9 @@ int igt_main()
> 	const struct section {
> 		const char *name;
> 		unsigned int flags;
>+		unsigned int repeat_secs;
>+		int n_threads_per_engine;
>+		int n_exec_queues;
> 	} sections[] = {
> 		{ "basic", 0 },
> 		{ "many-queues", MANY_QUEUES },
>@@ -1764,6 +1819,13 @@ int igt_main()
> 			USERPTR | INVALIDATE },
> 		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
> 			USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-many-groups", MULTI_QUEUE, CGP_REPEAT_SEC,
>+			MULTI_QUEUE_THREADS_PER_ENGINE, N_EXEC_QUEUE_MULTI_GROUP },
>+		{ "multi-queue-mixed-many-groups", MULTI_QUEUE | MIXED_MODE,
>+			CGP_REPEAT_SEC, MULTI_QUEUE_THREADS_PER_ENGINE,
>+			N_EXEC_QUEUE_MULTI_GROUP },
>+		{ "multi-queue-groups-priority", MULTI_QUEUE | MULTI_QUEUE_PRIORITY,
>+			CGP_REPEAT_SEC, 1, N_EXEC_QUEUE_MULTI_GROUP },

Almost there...
Given that we support compute mode also now, it would be good to fully support it
with priority brust also. Currently, that is only supported in legacy mode.
Add that support in compute mode also, and change the "multi-queue-groups-priority"
test to "multi-queue-mixed-groups-priority". Also, as priority test also uses
many groups (though with 1 thread per engine), probably calling it
"multi-queue-mixed-many-groups-priority" would be better?

Niranjana

> 		{ NULL },
> 	};
> 	int fd;
>@@ -1773,6 +1835,11 @@ int igt_main()
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
>@@ -1783,7 +1850,11 @@ int igt_main()
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
