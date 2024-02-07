Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA8CC4828F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 22:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110EE10ECC1;
	Wed,  7 Feb 2024 22:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWXVwN5L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A01710ECC1
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 22:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707345781; x=1738881781;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z1d39Fpecy++DsmS3wP7QfLIZ3ukVMmOvszxcHBtGv8=;
 b=gWXVwN5LHKhaicExNd83lhB4Eq06Zy1dv12RzrfwJkDi8lMY6kGiyUzL
 zAm1GAv9hTSkeJR0qJzYxC++zq6EvYxtKBziSD0FUZy4EK2W4LCF/0BSr
 E3h7VyI1Lbb4CqavTQ/BsEeai5SmkCUQygy2H5Rw7sVio6lmy2KRaQa8o
 cUYIqrWALRsofgNoubpmc/DWc+IzgW+t9kRG8JO+VBtHBfuqpBKZlF+64
 /Y8oem1SioT6d4I1Y7t5LqVKe1W9itV9niR9PP+KAyiohtRfiF5uGpKEI
 Kzeh3ojQnyGHizIvxF6LyUne56cEEnNim3wLbhhsmDCAUhVs8hvJgWEI4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1243895"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1243895"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 14:42:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1490400"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 14:42:58 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 14:42:57 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 14:42:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 14:42:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 14:42:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXIrAFnOEdK2UFZs9rN6Xtt1+iPkLv83b9BeAZuevL9gHbCrmVJZZjZY49f2AFSHlQFgLx+r7YRo+zN0H2cf+gBdyVnA70/tK/1CD01m38SiJ2urXEtVITtViLJBGAnWPB+ol835bcZykEJ1u+jViVvzZPDR8YZevOhG1turEJEFncYilhYKKNzsBccMYnIhS7ZmVJRElbbJpMSHjtjUss7bxp2hfuEMQRGLym4YeH+N2L57Nq4Qp0b/1dVRSLBBeX3WX5FL0IH8IjJ6q1Ed3NnS8n3v50iVX5SLwoxl2N8WG8zH/M93BdBoTLH96NBJPh+Qb/QQ06H4l0mSY298rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/9IRHHq3iLws7g4KsS69hvCJz17XBY90y8qxyfy9vY=;
 b=OL3prIq8sTfpGPNNe/A1W18w+UegZC1AUM/nqbwL417tz63J8h+9otJt/Wcp8JaWA4Uxr4KAixCpt5y9h23iTJ66CmLwi1VoJdIlmseKkOXyX5HgOW/2MjhdkNESJ1VQaeKftVlyrvEfgc7DF3DlCkobe+dbsqD9KJiLd8zG3nXIaDbfYXqJ4749/PK89xoSdeYi8PAlOQI/J7KRS3/laoZIXzrmgZHSlUb9v7Ui2H/mS6KgvxpqkXfzPMFkaUiWL31i+i1JCGkNuJyMrDd2oaxlPCKGiYIp8cRDuaJQYUNScSCTqwsw2FC0baipPTJCoblvmxme2t8BrTvJTkP6/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5326.namprd11.prod.outlook.com (2603:10b6:5:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 22:42:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Wed, 7 Feb 2024
 22:42:55 +0000
Date: Wed, 7 Feb 2024 16:42:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: Re: [PATCH i-g-t] tests/intel/xe_live_ktest: Rename subtest to
 match suite
Message-ID: <mly7xlimmmzwnrpry7jywv2pevgm2gmddao7n5nqnqmmt4havq@ibfqmbojfrb3>
References: <20240207185925.235046-1-lucas.demarchi@intel.com>
 <38805745.J2Yia2DhmK@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <38805745.J2Yia2DhmK@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: 20555c94-c8f8-40d5-800d-08dc282e201d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rOusyLMBnQdgp2qznPXlNMa2RXvGfUs2RSUcHy1+9jU3ujsHBjtG0wvKZ5qtAW/X9XDXAXi8ZNqaguO0QnSsiCVWjtoBLNlnYE7rX75vHXhKlZ0Fd4zb739Kw3PsGCkvhgkRu0eSFdgOddaa2G+qSEuL7bmMEo+Vw5lfNAso3I6I0L0icaXTo4Gx8cnAtqH4tKsHvvm/jSZOjlkBvzMO6+17r8xOACQPLgwfrAeUM21dX7FefLyBLWw4fLtQSv0BrBAE1YyfenVicDq0cd/bw61BLzS3xgeja27F5/MQhmAgKSKIfoeXm9zowpmmw9y+je0NTs37wyWjDL/yLi2VAe+CgRS/5Mtf1WaiLetIE3CakznmQLFfr7HigfYVXDwnvL8RG7VrZlI7sOAdJFmViU3vuLdp85qgVRXWev3SSHRo1rQIP0SLN4kIgpK6VHWBGgOPlFn0tELel0bgr9nfNp6U8elx+yggF7pbzwREUfy2KKLWHYPUOTL+sAOaqkJsqjvl1gmq/gxcH8JnjBpiqSiq2qJj0Dahlr/p6o5ptys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2906002)(38100700002)(83380400001)(82960400001)(41300700001)(33716001)(26005)(66476007)(6916009)(66946007)(54906003)(66556008)(316002)(86362001)(8936002)(9686003)(8676002)(4326008)(6506007)(6512007)(5660300002)(966005)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8nqt2Wrm1yp/AbNnvYVx9s0xCiXVoQOKzdKjQsqnqmp6Ts2RBOA+b4H+zgw2?=
 =?us-ascii?Q?2zryUP8t9vLx9tccKKu5iuwUhYuNMdIKa8cPz/REVBKxS7IMqhMMBjVFyIKi?=
 =?us-ascii?Q?mLdq/00kvGDSl4Xdh7T86M8/o3oYCuu195Oa7lJqqZWppl51R51SPdXliSmI?=
 =?us-ascii?Q?AHx9CydjLTecYHBCw2563uXXy4JFh06tNca7lMpyGxIcJaYs6NrVw0K22w7q?=
 =?us-ascii?Q?Uew8620won7+qcFShg5alt09wAU7W7bz3+VtrlgvmuvNsHABcgWTRtXyHg2V?=
 =?us-ascii?Q?/gpnkdGk7StIrX+cNONvo7bz5KW15UhzkBapdKn25yZxSfsAkQY+qi/oEUmg?=
 =?us-ascii?Q?xANr6NqFFyZCAjt64YzScLTD7oZVaYPTajOPYSEwnn3cJFoUw6gTQA1+38es?=
 =?us-ascii?Q?oiJ4MwAU3x+CuQJi4d0SXZS46Jbv2PiZ45CxS/Erk4hF5pD1QwHhiQ65ZS2a?=
 =?us-ascii?Q?gITKSirFYgwBTw6rUqfhrVLh41ytzaaEldYmieW2FpaXVK6dARGjBgmwOgkT?=
 =?us-ascii?Q?0jb2uRQo+tatYetrgvUM601pmCAN8VHMMzK8EuUXwwymm3069gWHN3+d2cO4?=
 =?us-ascii?Q?SuNY5V7xLmuEY8r4bKOCfvgRen6tXJRXr681Q146a+iP+/wXlkcyOFlL0laa?=
 =?us-ascii?Q?sbFJUnMahGuacrBemUeBc2TKk82RqnptNiW60SN1eC4gvqSCW815ivzXBxSE?=
 =?us-ascii?Q?zWsf9n/hAqJI6PgpxFJP2HQPjO9tTiBWWXIXC7/SrV19KJXUjUcXhfJGhvpa?=
 =?us-ascii?Q?mEE2T4qiH8PXybj+qAXI+fniqtlNh5wtcOt0xUimMmiR4AmoADR1JCd5DF2N?=
 =?us-ascii?Q?m3bimIMiTkjimM3+0HCWGTl1ZyaRYf+jfE9s7D0BjumD6VY9qe867Ud3xHWN?=
 =?us-ascii?Q?TNBVpa6bsRWR145I8AREBQyfB8NM54CnDD30RPT0WiTfv9ijp0Muxrfkl8zc?=
 =?us-ascii?Q?ciRm54CZ0hK7Wf3wq7ieuhdmMkX3DQphF1vd0eimpN5uigmU9Mx7tq4DlVtc?=
 =?us-ascii?Q?rQqyXk8zLkxcBnNdfPggDfj5BdBDsludZ26TMN18Vc+Gbpo8P/xGn7mHdJ3L?=
 =?us-ascii?Q?0YqDLyiAE96qvmfcddx+3MhE8ymMdezSpkKF+lwkBtm0Oy0t1YMf6iZap7R0?=
 =?us-ascii?Q?75Rf9CP3/a+Wp+hOTOcdZzMSDbt1VYzu+S4lFa8F0xd6fBpkaWnpDWGVaJYM?=
 =?us-ascii?Q?zUUKlRxJ60BTmZWhRPO71oS6yXS+uvQ48t98+btTKeTRU18csAdmo/EPHnHv?=
 =?us-ascii?Q?ThjaaLr+cOefp6orOMciZC33lmcULI+aJOv5JRidc3jvM5uFrqcEMawB9UjP?=
 =?us-ascii?Q?raRT7RfZYS6JLIcipS27ARJhxytVZVIo+MlUHeEUr6mwQVDq2gVHH7SqLyC2?=
 =?us-ascii?Q?s8yNdAIO90nigo6SJyEkAkzuMleiSWL7ocThJ7YuoQu0fBD4/VRsNR3fxzWd?=
 =?us-ascii?Q?m4Da9z9PeTbRG3b4+z7hbxnopg0RbKPQKRbz8+wJiWVU4FfPRYaMguhtkhWo?=
 =?us-ascii?Q?s6fhg2I9gcMK2GURI7mdYUWtlVVmgpMkbcPaqWSrre2tTyCCjCmpndEKh62+?=
 =?us-ascii?Q?1/EiDZZokxeitpWkCIWF0KtmNJOcwRFMVpsgq0T6e1DZ3BT0BFHNhFzUha3R?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20555c94-c8f8-40d5-800d-08dc282e201d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 22:42:55.3853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iunIsa52sKcTd2Ufgbqoz9FY6Kmb4lKXSOSXPdAe0EYKF9+3QGQLZZsoLDoHJGVUkZ0MGTIilmvK2lmDjgyux9fr9tyfSVtFlmD3MUk0NBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5326
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

On Wed, Feb 07, 2024 at 08:59:24PM +0100, Janusz Krzysztofik wrote:
>Hi Lukas,
>
>On Wednesday, 7 February 2024 19:56:59 CET Lucas De Marchi wrote:
>> The test suite name in the kernel modules contain an xe_ prefix.
>> Upcoming changes for filtering will make the match more strict,
>> so rename the subtests to match the test suite name.
>>
>> References: https://lore.kernel.org/igt-dev/3267150.N7aMVyhfb1@jkrzyszt-mobl2.ger.corp.intel.com/
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>
>> build tested only, let's see what CI returns
>>
>>  tests/intel-ci/xe-fast-feedback.testlist |  6 +++---
>>  tests/intel/xe_live_ktest.c              | 16 ++++++++--------
>>  2 files changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
>> index d8fd66a45..b5e96d536 100644
>> --- a/tests/intel-ci/xe-fast-feedback.testlist
>> +++ b/tests/intel-ci/xe-fast-feedback.testlist
>> @@ -228,9 +228,9 @@ igt@kms_psr@psr-sprite-plane-onoff
>>  igt@core_hotunplug@unbind-rebind
>>
>>  # Run KUnit tests at the end
>> -igt@xe_live_ktest@bo
>> -igt@xe_live_ktest@dmabuf
>> -igt@xe_live_ktest@migrate
>> +igt@xe_live_ktest@xe_bo
>> +igt@xe_live_ktest@xe_dmabuf
>
>AFAICS, the corresponding test suite is named "xe_dma_buf".  If you prefer

indeed, thanks for catching that.

>"xe_dmabuf" then we have to fix that also on the kernel side.

humn... that comes from drivers/gpu/drm/xe/xe_dma_buf.c
so I think xe_dma_buf is ok as suite name. I will send a v2 here.

thanks
Lucas De Marchi

>
>Otherwise, LGTM.
>
>Thanks,
>Janusz
>
>> +igt@xe_live_ktest@xe_migrate
>>
>>  # Move fault_mode tests at the end to unblock execution
>>  igt@xe_exec_fault_mode@twice-basic
>> diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
>> index 5f5f1dff7..4b8e60676 100644
>> --- a/tests/intel/xe_live_ktest.c
>> +++ b/tests/intel/xe_live_ktest.c
>> @@ -9,23 +9,23 @@
>>   * Functionality: kunit
>>   * Test category: functionality test
>>   *
>> - * SUBTEST: bo
>> + * SUBTEST: xe_bo
>>   * Description:
>>   *	Kernel dynamic selftests to check if GPU buffer objects are
>>   *	being handled properly.
>>   * Functionality: bo
>>   *
>> - * SUBTEST: dmabuf
>> + * SUBTEST: xe_dmabuf
>>   * Description: Kernel dynamic selftests for dmabuf functionality.
>>   * Functionality: dmabuf
>>   *
>> - * SUBTEST: migrate
>> + * SUBTEST: xe_migrate
>>   * Description:
>>   *	Kernel dynamic selftests to check if page table migrations
>>   *	are working properly.
>>   * Functionality: migrate
>>   *
>> - * SUBTEST: mocs
>> + * SUBTEST: xe_mocs
>>   * Description:
>>   *	Kernel dynamic selftests to check mocs configuration.
>>   * Functionality: mocs
>> @@ -37,10 +37,10 @@ struct kunit_tests {
>>  };
>>
>>  static const struct kunit_tests live_tests[] = {
>> -	{ "xe_bo_test",		"bo" },
>> -	{ "xe_dma_buf_test",	"dmabuf" },
>> -	{ "xe_migrate_test",	"migrate" },
>> -	{ "xe_mocs_test",	"mocs" },
>> +	{ "xe_bo_test",		"xe_bo" },
>> +	{ "xe_dma_buf_test",	"xe_dmabuf" },
>> +	{ "xe_migrate_test",	"xe_migrate" },
>> +	{ "xe_mocs_test",	"xe_mocs" },
>>  };
>>
>>  igt_main
>>
>
>
>
>
