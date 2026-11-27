Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E268D606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 18:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ILOY/Kc7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9443B112CF2;
	Fri, 27 Nov 2026 18:20:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540B9112CE9
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 18:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795803107; x=1827339107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=X51x9q+LjAt7UmmLNVnEh6BxUgv23Bh+ZSnZCZk1jW8=;
 b=ILOY/Kc7a51AwRlxK8Z/jucYd7T/YFvKKOvQnJf+ivO4QMSYn4vHRYwL
 mzH/Jv/U/4UqSOuexD8aImDWxGhWypVh0iiVoGmgw+AnfjLTN9b6Lb8Gl
 uqNE/lEPjkaLBs/P61xsCBbP0NJTZY4PNvSB7KMiVt7B9T0oHOzW+jrrW
 Ihvvo9nOlZasPP5vqdL4HrnwD1u0ZSPbiVr6Ww2Y6744GZ5Brg4X1mKOw
 xvEc9kPFSYLJvvspary1x8//EpMB9UrC21pkFEEbG68jKyEPZTalAKd9l
 BfKqY/FPk8zoizHGJNI/A6AQFEPYzti5ITWiFrBzaiZyBG5wSvkIcVoaz Q==;
X-CSE-ConnectionGUID: jUJ6EZjSRV2PB4cFNJX68w==
X-CSE-MsgGUID: xEKwTIc9T+2V6OTF8Pe+sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4602875"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4602875"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:11:46 -0800
X-CSE-ConnectionGUID: O8iujEd+QieP4ouS2wEEMQ==
X-CSE-MsgGUID: OvVdGxFeS7WbweSGomyJcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="14208056"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:11:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:11:45 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 10:11:45 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:11:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0GuIH1JifqU3O4pAOkYX+2MijQbYAx1n4G0n6Trq3k0FnuCGvkxGhfKWI3lHy+RRplTPzxiSlCW4noNVrQBRVJCvqyQKtMLdHj2XS926BL27VsUwPHQJf1R5QoATbg21U7En0XRedoutQm6V6aUxT7auEwLXqzk0q+sJb87usmRE0yHDtQ0ty/jAvzM/UCAYjNU3CrOiwWDeA6gB+EZhAWuldYe1LwLMIZGyLScci2Lf/xCMXCmUFNldPIpFnhJ5Vgf7jdesTQPGVqa5qk2i47upP7pUA2N1oAtqvcoPH1ahk4hnz92CJ1UCWDSiHjsXXSJJzaLAWXmqZMqGpJEiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDeQJU1H+SzIyOOaGcWZCIa18X0+lBdbE8GNz6fS5ro=;
 b=DeW9L561GVqTa3eYCB4Jjrn49IBHZTyMzizaBWwVMEvk9ULPyhHJDVBy2lUvWmzHpdBjGQoFgeEuC4EXeP4kra1AoU4Wc30r6H2MlmHn1+NCfWfCKWf7U+F8JV52dhyTmK1dZnyywaYst8kv0Jfxf7TEnZi1mbWzeoINkeYIflADW1XQhlFq3sEITGWxjDynnrhr/Nx8EHp2k9gFCTDs6x0M2prRCjwOfISYnJ2+rYYVr829Sn3ksMwbZKpPMaRZrIwLJU8ZTVUjp/RMs4l0rMX+1hQZrQxP9e892OBU3Z7Csx8vltIK4qD/b1KRpwniz1ed9BfKBTVtll8r7cIRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.9; Fri, 27 Nov 2026 18:11:42 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 18:11:42 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 2/9] tools/drm_ras: Add a DRM RAS netlink tool
Date: Fri, 27 Nov 2026 13:11:34 -0500
Message-ID: <20261127181133.801215-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127181133.801215-10-rodrigo.vivi@intel.com>
References: <20261127181133.801215-10-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::33) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: d501f86d-171f-42b4-9019-08df4cb1e363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|6133799003|261009223027099003|18002099003|22082099003|56012099006|10067099003|261022105027099003|261028144727099003|261026140227099003|261102123227099003|261026121527099003|261021121427099003|261022075727099003|261022113327099003;
X-Microsoft-Antispam-Message-Info: AifpqYCs9rJpxtqRqm46ie7lM7lWx3KbLTpI2xDswsVA3YZ8ge/oQn2yqPohOsJQVZEY/Ms08pEswWVx+9ed9SNFosW31b0/Q/EGO3RigRTcSf8v4gj9VCKG+JhzHZ5W/iOUjhsvk0ybGh9erxi1UCjpaN8K6hyY2dXEKHanXAXfnufeqhWx+OJQPZGKFeehql3CR+XetTmOJfIeXfw+RnywUZa6a1ekKt7Jk9icqEV+9hgDlKVzvbCa6pCaBLodvrePjmfKRF5bCacLUaFjIxO4GRZKz+ngiwZ2QZdKue4GG6zXjIkjS8gdni4lJvh7Fg7xs3Syoxku+16hwWem1u21RBZJJHGql5Ybz+JyJwBUrV+cAK7SZtzog5TrHeBhTc5tb6yOkXdd2qb/m16sPbrBqxNIhBTfM6/QA2otL2zobWGOOJJDi7NgfFfrOcPe1rOLVouG4zXXYJMwHMvQ15OUjidRvFjdXdvar97E64dgpg1SlydWAdFNjt5R96bMjH3IZ1c3CT+LyJzsbXHH0/koRwU8d73Lrk+YwT5hYO0JUIYZ90rN4iXdWLrP87mO0Hpsb5fnoJJGMKZ34xDIgwyVqUauXc5BpdUj36aSTriK/vxF+PylBNURFr7ZtpONA/MAf4iHEFH3Pz2X54kYJqkc+Ypv3mJYNfSCetxL+fc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022113327099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVM3VWxJOTM1eng2RmFUQmJnWnY0cFhrclEwSHd0L3UyR2JQc29hSmt5THdj?=
 =?utf-8?B?QWh1OU55S2Y5TnBJN25Vdjl2M1ZaSVZ1T0NaOHQ4UU1za3BBUjBFYXcxRGFB?=
 =?utf-8?B?cktNSWNVbkJ5MjJGUFFUVGliL201YWVrUWhWWncyS2RXT2xRSkgzSW1TcE1I?=
 =?utf-8?B?SmpQcHBZRE1nOG1KNHBkVmt5NTJHK0pWNUZHa1pGbm12WUlRT1BkbjJxNFhH?=
 =?utf-8?B?UUdDWWphRTByU3VnTWc0OE90OTlSZWp6bGQ4N0lJYVBPU2QxVHY1WXl2YStn?=
 =?utf-8?B?OTBUc0lZTC9aSkJOOVN1cjdyVittMmdmK2N2TG91N3FnSUk2cjF1eUwyUHhL?=
 =?utf-8?B?U2NsKzU3bjdRQkZJOGlwWUxNWmFEaC8wZHJFd01IRXdpRExOYzNvWktlMkVt?=
 =?utf-8?B?Q251Q3NKbkljK25BM2JGbEtIVzlzeGlMMWhuVmhaZ1RHc2ZJVEtySXB0S3VS?=
 =?utf-8?B?SzlWRE1kd1U0cVQ2dXQ2M0phdHd3MXowMFpUbGhzVkdKWWdYSzZVeU94TG5w?=
 =?utf-8?B?cGdMTTY4bDlrbmF6a3huWEZkSDkzbXNYZEp3N0wzbitVeEV0ajluSjU5QU9C?=
 =?utf-8?B?akFhMHJYZUlVbnpwc01xQ2FQa2YyWkc3elVXdjJSbWhoYm9LeE5NOFp1RXIw?=
 =?utf-8?B?dFA5NWtVTjNJcjN2amtCQTdPcS9uOVRUZmZlQWRKQXFBY1g3anNJeU9SaElx?=
 =?utf-8?B?enZlVmlyZEZ0WC9LYWFqcVNMUy9UNHd3WlhhK1hYYzg5MjNuSGZZNDdUVUxr?=
 =?utf-8?B?Y2czdXNLcUV2OGZHK1BmWmxmeHlKL2o0dnJhbGxrYkFCRVA1T0M0M2wzcjlB?=
 =?utf-8?B?NW9UaWdGVHl4TmlMUmxLZTllbGJEWjJlOEU3RHQ5M2tVQWdNM1ZDTXpzSGM5?=
 =?utf-8?B?V2hTQ3lBU3FHOSt6TmpjMkVvZndvWWphSHpHd2hjRm1sNC93MmVVWEROUnZL?=
 =?utf-8?B?Y09ub0RFZnI3WXNXM0hRVm5rVm8wMnM5K1lPZGd0RWdQM1lUMkNydkFrNVRo?=
 =?utf-8?B?NGlEam1MM2w0cG5ETUkra2Z5Z0p4cUdsclB0NTEyRE9aTjNpcWp5NGhpM0Vj?=
 =?utf-8?B?T2Vhb3hmem9Ibnkyb1pMQ1loY3BWUnZuT3JIYitnTmtBK21vZCt2UjlqM0to?=
 =?utf-8?B?S3ErQ1ZWa0pWR0NSNGFzVTZzVTArOWVnK1cvekVPeHJBU0l2Qjd4YVZFbEFU?=
 =?utf-8?B?aEpydjluQVd0Ry9lVTZ0WXU4NFR0Rk1YanEyRkV6QXF4dzh5NzI4VHVEWlJK?=
 =?utf-8?B?SEF6cXRoNEtTZGZZdm9rVEI1ajFCNDFlUE9OcGpWRnlTYlkvc2RvNURaU1BU?=
 =?utf-8?B?WGdtQjd1U2IwZkgrWWVwUFJuSjI4SUpyMTgzc2ZKMlg2N3g4dkZwMS93VkZF?=
 =?utf-8?B?V1lLYm5RZ210ZTQ0aU1acENuUmo5TWtpOHJicC95L0YvTkxFSkJpOVV1ajFW?=
 =?utf-8?B?d2NYbmVaVEJlaTFKclMzM1B1MWxWVE5VWWFGSng0NHNxUWlJMEpNb1RWQncw?=
 =?utf-8?B?cDFmbkpLM21SZEJUamt1WTFiWnZicjlLSS9Gcjh2R2xCKzdIam5hdzBxZk5T?=
 =?utf-8?B?NlBJdUN5Sjl1R2VsaEd3OFpaUDdkSzg5Sy84UXE3bnRSNFVNaGdnZ2hsTmRt?=
 =?utf-8?B?djNuR0xaN2dvVENXMGRtNGRVMVRaa2lWWnlmWDJhazJReFVOVjhEakpZUHdx?=
 =?utf-8?B?YllXM3g1c3pGNTVVUXU1SEsycDZURlRqdk1zVWxPeVhtcmtLTmpkL2FXb3VO?=
 =?utf-8?B?elEzZDlVeHNuT2puZ3JBc3YvQU5lc09nQVZVVXprZ2hybzU3RmlqMnJxa0JM?=
 =?utf-8?B?Kzg5YmhBM2l5aG5WMzNiVTRNUzY2Si9ocUJrdUczVG1CKzRBQ002c1JaL2xx?=
 =?utf-8?B?SG9hRWxpeWlEQXRJWG85NkxoT0VDRG56QTdsdGJNZm9GT2ZaaExHd1pFeEN6?=
 =?utf-8?B?SmN3aDYwRm5nSW5kQzM1RC9xZGpjeVVDa1p3YTlTQk5XMTZ6VUlTZjR0OTZC?=
 =?utf-8?B?ZmZScS9BMUZMNXJ1TG9WUEFLMUpUdkI5OE1DUWtoL0JibXBkb2xkemRpZWJu?=
 =?utf-8?B?L2xzZGJydGcvbjdpTUVsN1RvN0VUV0Z0UkJ1d05XcXFyQ242dzA2VDFYaUEx?=
 =?utf-8?B?T0d5eVVKb0M0bjR1ekhSVjNmNVBFVWVSOXNHWC9ZcDQ2L0FXMy9SZFA0SFg3?=
 =?utf-8?B?Y29wWjF1bkxuTFAvU1pSUnlIWFdvb3REU0xCclFVYkl4ZjhZTHNmc2RkZ0NE?=
 =?utf-8?B?a25XVHZqZEtWVjhXVytaeVp1T2JOSm16MkVkNzEreWdpODJWTGhXaTljSE54?=
 =?utf-8?B?ays0NG00SzREV21BYkdoSTIzazlZT29UNUc5TEFBKy8veEdYd2xYZz09?=
X-Exchange-RoutingPolicyChecked: LZNPBQHcHFpGC4Hnq9MQKQ6m9cgVW0qLdNJrHD9Y4NfSmqdI3iqzDQDwLK/YZ2/xNbrlJGSfmErvbAdQI9bLvz1IGfNrhunoztq46ruZVfbd0Wvjemm61NuivFJbNynTFX9hClzXYdt96u6j5wD30eXsAdcQU9/O2WvAXc7I2uIwI/Zt32aWc5Fo5dJjXNXZOYpW7pyony1tOrKvJtMARLJDOlr8QeqKSXlT7z1rrCa8E3V9dqHByQCj4banwjIP0SYYuoqBEz1xXJL+ter2wvrys4JzwPREAX1uztHwbBjHMrraQHct9QRqUPvqyL+n6R5kXkxECQvhj2wuFEtgCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d501f86d-171f-42b4-9019-08df4cb1e363
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 18:11:42.0252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBcXkZiTw5BiSO073nNMFqd/k5fLLIbl98Cm9oD+2Qu9lFxqNAOUr2pvB13LvemRApdVcpURvzwZ4sAVVp7SVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

List the drm-ras nodes, and show the error counters of a given node:

  # drm_ras
  0	0000:03:00.0	correctable-errors	error-counter
  1	0000:03:00.0	uncorrectable-errors	error-counter
  # drm_ras -n 0
  1	core-compute	0
  2	soc-internal	0

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/drm_ras.c   | 106 ++++++++++++++++++++++++++++++++++++++++++++++
 tools/meson.build |   7 +++
 2 files changed, 113 insertions(+)
 create mode 100644 tools/drm_ras.c

diff --git a/tools/drm_ras.c b/tools/drm_ras.c
new file mode 100644
index 000000000..0af1ca919
--- /dev/null
+++ b/tools/drm_ras.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <errno.h>
+#include <getopt.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "drmtest.h"
+#include "igt_drm_ras_nl.h"
+
+static const char * const node_types[] = {
+	[DRM_RAS_NODE_TYPE_ERROR_COUNTER] = "error-counter",
+};
+
+#define name_of(names, i) \
+	((i) < ARRAY_SIZE(names) && (names)[i] ? (names)[i] : "unknown")
+
+static void print_node(const struct igt_drm_ras_node *node, void *data)
+{
+	printf("%u\t%s\t%s\t%s\n", node->id, node->device_name, node->node_name,
+	       name_of(node_types, node->type));
+}
+
+static void find_node(const struct igt_drm_ras_node *node, void *data)
+{
+	struct igt_drm_ras_node *found = data;
+
+	if (node->id == found->id)
+		*found = *node;
+}
+
+static void print_error_counter(const struct igt_drm_ras_error_counter *counter, void *data)
+{
+	printf("%u\t%s\t%u\n", counter->id, counter->name, counter->value);
+}
+
+static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
+{
+	struct igt_drm_ras_node node = { .id = id };
+	int ret;
+
+	ret = igt_drm_ras_nl_list_nodes(ctx, find_node, &node);
+	if (ret)
+		return ret;
+
+	switch (node.type) {
+	case 0:
+		return -ENOENT;
+	case DRM_RAS_NODE_TYPE_ERROR_COUNTER:
+		return igt_drm_ras_nl_list_error_counters(ctx, id, print_error_counter, NULL);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static void usage(const char *name)
+{
+	printf("Usage: %s [-n <node-id>]\n"
+	       "List the DRM RAS nodes, or show the content of one node.\n"
+	       "  -n, --node <node-id>  show the error counters of a node\n"
+	       "  -h, --help            show this help\n", name);
+}
+
+int main(int argc, char **argv)
+{
+	static const struct option opts[] = {
+		{ "node", required_argument, NULL, 'n' },
+		{ "help", no_argument, NULL, 'h' },
+		{ }
+	};
+	struct igt_drm_ras_nl_context ctx;
+	long node = -1;
+	int c, ret;
+
+	while ((c = getopt_long(argc, argv, "n:h", opts, NULL)) != -1) {
+		switch (c) {
+		case 'n':
+			node = strtol(optarg, NULL, 0);
+			break;
+		case 'h':
+			usage(argv[0]);
+			return EXIT_SUCCESS;
+		default:
+			usage(argv[0]);
+			return EXIT_FAILURE;
+		}
+	}
+
+	if (igt_drm_ras_nl_init(&ctx))
+		return EXIT_FAILURE;
+
+	ret = node < 0 ? igt_drm_ras_nl_list_nodes(&ctx, print_node, NULL) :
+			 show_node(&ctx, node);
+	if (ret)
+		fprintf(stderr, "%s\n", strerror(-ret));
+	else if (ctx.dump_interrupted)
+		fprintf(stderr, "List changed while reading, rerun for a consistent view\n");
+
+	igt_drm_ras_nl_cleanup(&ctx);
+
+	return ret ? EXIT_FAILURE : EXIT_SUCCESS;
+}
diff --git a/tools/meson.build b/tools/meson.build
index 68c31da92..78587ec74 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -38,6 +38,13 @@ foreach prog : tools_progs
 		   install : true)
 endforeach
 
+if have_libnl
+	executable('drm_ras', 'drm_ras.c',
+		   dependencies : [tool_deps, libnl, libnl_genl],
+		   install_rpath : bindir_rpathdir,
+		   install : true)
+endif
+
 executable('igt_stats', 'igt_stats.c',
 	   dependencies : [lib_igt_stats, lib_igt_tools_stub, math],
 	   install_rpath : bindir_rpathdir,
-- 
2.56.0

