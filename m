Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE931C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 14:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2276C10FF31;
	Tue,  5 Mar 2024 14:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvbEuWd/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B902E10FF31
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709648614; x=1741184614;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=JpEcAUIaYZDo5Hc/nPo2RQIC76vcIm/hxbZLCtG7f/A=;
 b=gvbEuWd/LSFdkq6LgTsS74ATGxCcKy1lRqEsEMm5SPiIOIV20XhKKEgl
 XGSfe1/B7DwW5rlpmtba6ncd4dtJMZg627eXY/XZ4ad2yDGCcm0G4I/8c
 lFsFFPgxNgVJ0DHGy2l/sexWV29A1nDo1JIJFC3VwqXyr/jH99YmudFi2
 +Xv/i8ma8KScPQlx+CPWQhu/kBjdBxghzy1zZ3yaw6UddmzRIKXivccF2
 EkS1LwAXTW5XODa3YJXPtQ9vf56Q2RZNQeGHbBwptMwpwONelYPXoheMH
 s2zK07om3BZz7psMdluIQSCDHRsTdil4zlkDOZhk8qfNEvff8u8VDbaYR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21660311"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="21660311"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 06:23:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9817978"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 06:23:34 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 06:23:33 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 06:23:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 06:23:32 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 06:23:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbiuBDz9oZhfRq2D8diGIGreLJRuAIuNz2gl4o5CHkP7jcfoKHpA3lT1Il01BU4g5eCbV8BT+u8x1b9ANqcL/C4jBtuiXGK6Cl9GHUWQrhdmt7v7IbnvedibqgmWJu82tkKjD9qbxR3sdWXyki7e4TI02b0nJvE9Y0k9/Vyyxf6qRDR9BOx056m8366dGVKNr7PJtBIp6AgsbMXH8LlCQZ+sXgCXGxzl90Qsv3JmTLF9BFlnAqHKWl3nGnJlLNthMLxDM7R6R0EKPav/RmGhgElO4gXP2SYHKxxWuYswCMR/6t0QDuhzFfNgLSZoQKvM6I0XklVAaatyjZzYA+QUTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvYycCWyuJEJUT7nNxfx4c6SR2sBquPmdUxg9qynl4k=;
 b=W79wcKjNIAmUeDL9DEWHltcJmEFlNUXpiv+5Kl15kFu1Z0tQPONzQakRMIVbWT7l/oetbS+x71O0HNmDRBQ1PmbWfQjHzBMXv+fl2Tm9fqaI5UiMbTc+aDNn1z/ZEKu2iphXXwomlXYkocj9jh0ImcaTXJRkRcmNC4qNFsDqF1OoFMDFnNhOMWAynlgJzm3OYTz2f5FUJ2YinBXq9J7Le06dUIHzgOysZ9HKkrH2unYN0xOoMRA/Cx6nzH0HQQADFf3Qx61XgPVyXE3mDNSX/Ohz+2dyQOSD3+03/6oG0sZfFV7iFvsdllv78R/rVz1Yo5UDjwmCk1Uaxt9L5v3o1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4677.namprd11.prod.outlook.com (2603:10b6:208:24e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Tue, 5 Mar
 2024 14:23:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 14:23:30 +0000
Date: Tue, 5 Mar 2024 08:23:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Allow to load kunit from alias
Message-ID: <zqmldqo5fr4bpuegclkh2we7twqwijppjin2ry5uktgh5yyobx@wixslkby4fbh>
References: <20240222193044.3004471-1-lucas.demarchi@intel.com>
 <20240304160529.rr2z4dmzbkeyih4o@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240304160529.rr2z4dmzbkeyih4o@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4677:EE_
X-MS-Office365-Filtering-Correlation-Id: 449f84da-3b8c-477e-2911-08dc3d1fd50c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mNjIMODczR7FR9qolIA3BC8r8bQBha6HzWTmfCUREeeq5ZgzACGY5NxVOR721qcYuv9row8qMDeszKe+LdJbakk7w4iOCNo5BAz9i3Z4dO5KnkPrWzpNKqI0GbaPBOv7yLDce0W6prgfYHiAEGCyM932eARluN+1D4GRT4r3gkoSnkk6lRYFhgQIXttemypIJ4u3fqKJSK9VN84ZUu6yWq0VN/7LmogU4dMnBAgAsrTE6ZNe5z2re57cU0D4mQV8aY74Ze6I4kc972O5P9ugthDRAcUoyuPGBLWAgeVZQmUcHXzEwmR+cCljL0BrDsq484HEutP3CO1lu86UV1vxfRf2gVWhmFjlbf27UqGBLUVLaPWyG2fCXd8E+omjQmpkSQ/sSFCx507rjdWXtN4EzURH7osYwtDca6pwbJ8R06mEN0Am9QlOKpxnh0OVaxuL+ec7m2Z4XOWZ1Re5Xw3K75XS/iFAGKdCt7bd/Ge94QLGMDJfRnDVR3q2wTkEgp4gxj3NeorZPu2xVtCsR8w+DWImCAmwG8MU97/Uz/r3BkeLcPU5jDLjSVjRfC2oQH2VSfQVV9YIHf/wkKcHw5euDGYFkLQRctTdSi/6p9979brBgOKlX/w61jw1OiRpnMQ5e8ajsJhaA0d/VKkHpm2+wg4JWif7gGTwMW6TycHVIAc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eKE5FPW3yPGpU1qxe7Uv5tCAg3BSzVAJd7apKenub20e4jJ/+vR79BOeGNcC?=
 =?us-ascii?Q?bF1U25bRecgjJ/NMbAtGvmSMHK4dNCnjNemhNjNlJMkz7jtyFsu0sW9ESL0L?=
 =?us-ascii?Q?UPftamcOhsOWAkKSWZf6e2jFhbsCXLRmovl6C2vpQuDutumAZ8rZwIqZIjc6?=
 =?us-ascii?Q?sAdoiNHp4UkHJmCVwC3q+N1D2m39C4c0xlW09ODsCS8e8QauLEgPdyR8RhGK?=
 =?us-ascii?Q?IeRly2P22U6YAFUQZ3C26Qd5UTETgVRPyTlguaLeEvo0hqHi/W91O+csIXNR?=
 =?us-ascii?Q?kNqQlOhRMGX13A/w4tCm1rm8REyZl4yy/UgD7UJ8IZM57/lYkInFWFgSCBAX?=
 =?us-ascii?Q?Cm0bMISQfQPrlqMWhVdaEQdSge9X2SRtWcM8QhGQuJEM03y1kwQKVZ6eB9xd?=
 =?us-ascii?Q?jS6QcO5VQ13ndfHbc7FHsn0c8wk2dysBI/7yNjCwg4vX2ouWFzfAxVsPzAtk?=
 =?us-ascii?Q?qJwtQrXo84giuNArkIQ8IorshUXDD7MIyPSdhrqAjZdQkJRSH1w9juSkpo2L?=
 =?us-ascii?Q?DVREi89NvLZqJt8uhr2h+5k2vRsi7gr/yWt0v4id0D5Q2CoBIQtUeGUYL4LZ?=
 =?us-ascii?Q?lcn/MqB9CBjB6icLchKBpSllDv54l7zkmkls8lDFst69oN/TEJ3vaQt3+Z+Y?=
 =?us-ascii?Q?lKpkBJryBXFUUfrzsJofZ/99cNIEyw+Bkee67ZYHH6VHs5/jOwh7BOCcCOgl?=
 =?us-ascii?Q?TT9c9Ww8eMClBUyrZEOzId1VuLuf5XJdw34RXgvYqwXElDLBMlxnVsGqit6p?=
 =?us-ascii?Q?lF2K/x1LPBQGP07jwLBP/Waf8CEeMQha4SHOG1yVg1kxv/nm7FNM3jDdv1Jr?=
 =?us-ascii?Q?pF3wQByGVtseTOrpVogkqzFLJOcfXGeGYu2bF0+gU8OhAtohmX+Md14RRsW4?=
 =?us-ascii?Q?MLVIhZ4sRqzP+WMiGrY7RVU0NkvERikAqXedA9yHGceF8kUP7n3igKqI5sY8?=
 =?us-ascii?Q?x95vZsIadblzRHqHI2YowU6DPi/0apEIyzKRh7J+wqmlctj+Weinwsm0xKZa?=
 =?us-ascii?Q?9JGXF7J5cpqb9D75taNskp5IA4gfzP2qJwCqyzcSAkDjGcpr10iYoIwmAgbm?=
 =?us-ascii?Q?Z5A1Y/ZtqZqWjNAKRDL4NEOlRE64+IPvWPvEztjMHexOc5itZu74ZJfT5Bn8?=
 =?us-ascii?Q?k68UmkIV/1/vEDx3jnKMOT8fRfzRLzgnHSKKmLhaxpO79Jf4v5tgvwrR7eF+?=
 =?us-ascii?Q?DVc92KqutJ/5O2qKZTJdKf4QxKwIhU2OTr2DJ965GKQDL1IN4X2VtJ6dcmXk?=
 =?us-ascii?Q?mBOfA1rnwXlJjqnrsFUdoK8YjV8KXku4cRT1UVVstOjyFJISwFThzpZ1O3mi?=
 =?us-ascii?Q?GQDcJ6ZEPH4aauO53m1eYti1MRqks9GpIPi+Rj1iu/4oi783H6fCPYKNUa19?=
 =?us-ascii?Q?hx+KnZmov6+wwTPuin490s2mO241Qy2roDx+P7gH85ol7Q6cjVgFjXn1/97+?=
 =?us-ascii?Q?bTFvRwiTQP3pmiPAmKYUYIL0TsnUTbQZ+EMs8ZEd6ImKfpiEVjI47+RxHSBi?=
 =?us-ascii?Q?BubU6oL05VjtZ9HTevlsr4Y1WwGZ2CrYw80iTJ7ZwktngiezjITtbSg4KaCy?=
 =?us-ascii?Q?w011l7OVBmtb+ih620Qnzx/uhqr5ZkHt6G3lsJ4BfVesv71/Pq0NCgBt7MLS?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 449f84da-3b8c-477e-2911-08dc3d1fd50c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 14:23:30.8123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhft4CTGXQaKD33MR0z6xxtWd9JINR/CHfOJdh1sBbbBGuShSTkRXrn24hVzZ2BzwGlH8nGTh5YUl4/YUlAhUp2EKUnsZIUi5+Bd4x1TAPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4677
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

On Mon, Mar 04, 2024 at 05:05:29PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-02-22 at 11:30:44 -0800, Lucas De Marchi wrote:
>> Instead of only allowing to load the from the module name, also allow it
>> from alias by using kmod_module_new_from_lookup(). With that a user can
>> have their on aliases and the kernel can also export a compat alias for
>> future module renames.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>It is somehow test listing failing: ./dmabuf --list
>
>tests/dmabuf:
>Checking invalid option handling...
>Checking valid option handling...
>Checking subtest enumeration...
>test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!
>FAIL: tests/dmabuf

how did you find what was the test failing?  The new version is still
failing, although dmabuf --list does return the same as before.

thanks
Lucas De Marchi
