Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6D6C25B75
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 19:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F12010E0D7;
	Tue, 21 May 2024 19:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtyM1L4E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EE310E0D7
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716320468; x=1747856468;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=s1Z5sgHmbS0NeEEagA912gylFcBGK8vfhzSNWA5o9SE=;
 b=OtyM1L4EZXwHxEW7n3iXNEGFhAy6aAJftiskcR8Zh1nMv7E+M8CHmWxM
 CSQkBUv2bzMpAgcVTh4GqQjOxy7CrMm58gaf5uvs1jysTm8bKsAt6kn86
 +xUkwQe5vEfxkoH0qTRCl+74yBM5z2Cw/xBW7/yfeQ3NLV75Rpvh6mzyE
 PKhFHRP/xIg3F4Xe6J5vjgoUP8CylDc1KpOrM+oLJCiWTMXmowHGtaBXX
 1C0IXwP0nr/Ua5Cnd69ePK5ribiRmMxfnf0/HZMB7O/xmRseGOrlS8nc9
 pjWas0ApBci0yXocJgBCpIe7wFG5vzbybEl2cQm8flX2KZlK5i+HHFoqC g==;
X-CSE-ConnectionGUID: gIkYJ0CaT2SE99b+BWD34w==
X-CSE-MsgGUID: kFZlxHymRdels3vgiYsfAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="35049869"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="35049869"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 12:41:08 -0700
X-CSE-ConnectionGUID: 0Z+sUohpSo2pJneZa17i+g==
X-CSE-MsgGUID: CbnTt5KtSAGWBoJkHOFHGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="70445864"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 12:41:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 12:41:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 12:41:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 12:41:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4qH69IKVsNSkWhIxDtqOqZmV0YzFWSxLzisWozCAcJaln+/Bs6oEyVg49+fLGkzs9oTqSS4nSlgaMlgdo202J1I3zIFfK1pHW/uTqfkmDPdlWPWs7yI4CcKUHeT4TXMdDYbf/63FR1+th5nLCciS6ANu+ZTzrBXlM9hDEY6TsSJ+jzcwYrs5t2ygWbdVEdUG3Xh8gHqaZQBu5MLPX5VvrSFS1sgStGWFWMoDBQfRrqB2E/EXhUAnHF7Ok03ztzF+ZuPLURk8BT7iZ/oJaxiLd2a0ylesgurO1U3tmeJEW9p00rqMIkOHKUhaeY83rgVQtpQZJmJfCI9Hm53X+14EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkR/I3eahXBxcYdw/hd8xa+Dyjes7rYF8bowCIVKJc0=;
 b=dPqTAMkUmmIt/qUeLBms5LBbuFOy4ylp+DpkbMSMTQufTbA+PuaiWGp2gahKLiBeJv28mTZqRT0KPb2GXJeqSEBIHzVOAkqGavm0DHdRGz74S/p2Gg7+DEci73wMjCcVOfuWf1OTz1FS0Yf9CQX8m4WVBFPLdmIgdD7/oZH4UAHKn2KtIakVMHvGdrbc482vkWXTAryDd8yqyoKe8sDTeVaMHMIAYhHLyt320o/vQZWTJddvZhYsd5OAYprSowuamegO5G+Y8otY0nznEQ6FoWKnlYaTzMDiUna+phYkEV+jkCNATs9ryDYsdMDAqmb76WVRjl2wq56loROPmGl3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4526.namprd11.prod.outlook.com (2603:10b6:806:96::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Tue, 21 May
 2024 19:41:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 19:41:01 +0000
Date: Tue, 21 May 2024 14:40:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/3] igt_hook: Add feature
Message-ID: <cpagq63o52papoxtexm7bthkigc6aw7vagmlq3qz6ohszjkfc6@wnavlnjdv6sy>
References: <20240509152442.189166-1-gustavo.sousa@intel.com>
 <20240509152442.189166-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509152442.189166-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW4PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:303:16d::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4526:EE_
X-MS-Office365-Filtering-Correlation-Id: a596b90a-5e5b-4106-9791-08dc79cdf1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7TtJDXEB8gKEhaIqckurcEBjOoIfc8KZ+qvmIZxssY+GNRB+hgJ8vZGh8Z?=
 =?iso-8859-1?Q?aAn8amv0X83Hn6kp7HlTbbz9MfD29JKC4Y3hp46J1963ue0gcIfzdyqoQy?=
 =?iso-8859-1?Q?6fOqqULeye6KpEsva5rFL9AMpZz4kXdSp7fGnmvEOVfMky/0HGyiFsufPf?=
 =?iso-8859-1?Q?vvIVVxDsc6ZuE5Ew4zglMLya86okc7jt0dd2JoBdv5diJyo8Wf5+aT3Fte?=
 =?iso-8859-1?Q?y7Lqb0AYmH0aVnFUNbDruTHh6z7aGiaXx+xTQQmpcknH/qcbsPagvYeqqT?=
 =?iso-8859-1?Q?DlZ4mkrsB9Xze00q06mMlq1JZFe6aD6fbw80dkqcWZuUtQ3MY5A02wVJlz?=
 =?iso-8859-1?Q?Tes8IlO7K5m9X2mf1B7FLKfugswDfjXaejfq6Zvei1h44o4wXn4ieuIxIb?=
 =?iso-8859-1?Q?nGAELXZbqW3aJF+SQ6k8nS6o41ghGCFGjAwOlsnmDP+uOKTDb1YXR6LWzE?=
 =?iso-8859-1?Q?jxSILUiqNeDFg0gxJLc9O1ueFPv2n3yHFCS/ROugolBYyvB/KLLlPUUJk6?=
 =?iso-8859-1?Q?YgVzZetm0bxVi7wS2Vu2Of+gRDTbYy8DXLYn+gJHv7aZRqT/bDWPDciLcB?=
 =?iso-8859-1?Q?XphzEfwoiqZKnD8VQXLy37l49YdbvF7LaaWgqWgi8uNdLT62WyTornEBb+?=
 =?iso-8859-1?Q?kmIAebWeMpOJ3v9QVL5C/X+dYPWsJyzthV9lkFy8+avESnp3J5LyU0lhdL?=
 =?iso-8859-1?Q?5mAzhCkCcZD60ygVKP2MW0pv0eb/2loUO6OM5uAktzMRQypnlkmDoQqL8T?=
 =?iso-8859-1?Q?j0Z2qUhUC+MOPPkZrWyW0IFl/7j8QFIVifIyFlcVfdSmKAdg2gus2Ax08B?=
 =?iso-8859-1?Q?isxzAzB78boxJnHDYfg0YPSz54RBt+zQdARu0/01Xe8VEU33xHizZB/z/g?=
 =?iso-8859-1?Q?LjneCPCrZRLyLoLaUONtLSbzjnMOsOO7b6zfsY8f/1TgdXN/yxQ8/tKqJP?=
 =?iso-8859-1?Q?UgDUrEE3xxp2/zBftELKgLSuB//C1PHhHA/7/fur0uZZ7ZSQFpxz7cOEif?=
 =?iso-8859-1?Q?ESPJYIGXNJezaQQsSA6ixZ00wP/Dxh+qGK/MEyl+wh0h9k2sCpUaP1LnEy?=
 =?iso-8859-1?Q?qqhxp5iq/jue7o8YcIV7grexawGLaW46KmYczhLFTQKMNKtDfAgI9PR8yq?=
 =?iso-8859-1?Q?Z7kcPYNbCUYIuW7iEhuwGwarNrjXhblKGaKGk4QDTyvjO+/TSurCkVlDJP?=
 =?iso-8859-1?Q?PTSjwYmuzFNu7Uz6yt37tBdagcZSAoxMbBAXInrkOZyMskCOOR2F8CkIrM?=
 =?iso-8859-1?Q?dB3id9+hMdjTMbSFfNUjMbWw/zHQJ8yfSh3vZ160DVgLcJBWUK1LtU/q9d?=
 =?iso-8859-1?Q?9+iuzJ0Xc/xMtRcTJOs+JFDR+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9+mBStEn/lwl/Kc1Ah+jE6SJmKAh29rYdWChZsSKB8rSbyK6Y3vVUVbWMS?=
 =?iso-8859-1?Q?7bjaL9hVGrHsTX6TSsYXmFYA9QqTLjEdzduHmHxVGbN7ZTfyjCnNaREYH9?=
 =?iso-8859-1?Q?/hQayjYeq9JYozRfmbOJZM4ZZXcpH/CFZghVTSX1KvFL2BtDsAr55/CKKY?=
 =?iso-8859-1?Q?d1l/y6gizqKp5R7jVPj0qonU9ji7uIT7Rv7HRyjxXJ223dgCIoJEp7Bdg1?=
 =?iso-8859-1?Q?N0vP8Ez6ANXC1vkpIM9IPcSTBEDFV6D3pdYB3qgwbZxSTtucSEOAqg2429?=
 =?iso-8859-1?Q?aOgMf7OeJrafW15o13rhaTZTyZsHkZ1ei2YSgGfgvOdZbatxQykOL+8Pl9?=
 =?iso-8859-1?Q?rIlgSgzFkqqKrp7Eb6Wy6L9HBCWiLPmzsEPf2kY+kVOoXV90aN1G6CrTjM?=
 =?iso-8859-1?Q?foOIpv9jVdjrf1b9eWkPhHhIXjWBUrur+Cl/P+7uDpI0idsMx3Z427kwB4?=
 =?iso-8859-1?Q?27TA5PL5uxkJF42hBjWADekKxHEArhdralQAKnmwTNCGMff2dxSNYStDUr?=
 =?iso-8859-1?Q?w7TpQZyeGF9fpice3F8hO4gDoI2kMVInfu9x4SJuV3oCkEYQ++3boQL41r?=
 =?iso-8859-1?Q?N2sQ4olKKoYkidMdqBol/ZQdH2OC3TKOaezbvmY26flRDzJIWUvxUPVmvk?=
 =?iso-8859-1?Q?k9IkWUOzJy5xF/0lMpDMf54KKaDJ1zLTdVoWoJjx0DOkDPF7n39SN1WgHV?=
 =?iso-8859-1?Q?kLyAl1NlcxZRCNU8S838XBZFCnrSm/FdkfJPnrZ6aOLgrZ49v/ZfzkS3pE?=
 =?iso-8859-1?Q?uJN53c1FcEBTb1Mf3+GBmWvMK+wOxwMiSTiBqCk4ax61p2sADPAz2C65sL?=
 =?iso-8859-1?Q?u3DBcnufg5g54BXNYtxjkKmxgZpQKwtmEuR/wT8wwnAwWvrjTyI7tJFv0v?=
 =?iso-8859-1?Q?gnvc+G4LA/Mh3CYneRUVgxr4cZf27rdj0oZ9mOn/LE88RM6bM7Diqit0Vo?=
 =?iso-8859-1?Q?QnTY9a3iVDZ/eVapgZSUip0FyP4wvz3X1SK/+gCl4wao0/hXm9pslZNxTN?=
 =?iso-8859-1?Q?1xuvk0IL8zA2sPoFQ3CLBB9EYqbl8Tn2WuQPE0HEQgDPLbu2bIIJ32tV1i?=
 =?iso-8859-1?Q?v0X6lGY3OCL4m+I3l/tZQvKjiZcQ0eB0Y+ij1QBxT4SnwYOhWQAvh8Yqn8?=
 =?iso-8859-1?Q?0dq1KWF7yCzus7PN9jBdmTTJuZmZRR+tOXENXYIZl0mpqHnDO1z16ebwcD?=
 =?iso-8859-1?Q?0aur3Y3fdrROz0fZJz/7H4Sq6lb+yfACWFJ7BEjcA0/8TcQt0Vo9Jko1eG?=
 =?iso-8859-1?Q?+GG9Q6SxzDIWttv/MZ1shyMIKlZ6ID3bXhHADlE1IoPA6gseyl/EWrCb5G?=
 =?iso-8859-1?Q?UusFxBFtv7ekE/39GOZ3KUTW5EDHRIMRWz/Luk74Nabd+Y3MHdJeK+BXBv?=
 =?iso-8859-1?Q?/n8CmE3P53Kck74cl5tcnkLJKpd0QF5tksE01ei8V228DehdM4wh9mfrs0?=
 =?iso-8859-1?Q?oOCJKAnZpalygx+7AoBLh/A9j/LSN+c6p8eV/lBcneLfGXJrh5By8jsYCn?=
 =?iso-8859-1?Q?gOFkn0+JDZGoMv+SqGwtanFRjUbdPcGNTVsQ2YSWr+MKRgAxhGKz4pVTR4?=
 =?iso-8859-1?Q?04RUJDJwwexkz13omQDXh4tqwcSv9XZ/SMRj0ZAJ9GEt2AJJBhSzxFs+HD?=
 =?iso-8859-1?Q?yCnpgx7iYXMQTk+53z4Fj/1ZpbDnuKJ7T7DTmI8PTAe29pOVdWsUkk+Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a596b90a-5e5b-4106-9791-08dc79cdf1c7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 19:41:01.6022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFT6S2uHjPMxgmpW5OJroH6WTAVBqcQcbK6AiIcNGbn5EgXSeDeEiUQKRJX7IpuMwiGMbzikSs4n6knYzU7hS/Up82SaS4Q+6rIjHUy7k/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
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

On Thu, May 09, 2024 at 12:24:29PM GMT, Gustavo Sousa wrote:
>For development purposes, sometimes it is useful to have a way of
>running custom scripts at certain points of test executions. A
>real-world example I bumped into recently is to collect information from
>sysfs before and after running each entry of a testlist.
>
>While it is possible for the user to handcraft a script that calls each
>test with the correct actions before and after execution, we can provide
>a better experience by adding built-in support for running hooks during
>test execution.
>
>That would be even better when adding the same kind of support for
>igt_runner (which is done in an upcoming change), since the user can
>also nicely resume with igt_resume with the hook already setup in case a
>crash happens during execution of the test list.
>
>As such provide implement support for hooks, integrate it into
>igt_core and expose the functionality via --hook CLI option on test
>executables.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
> lib/igt_core.c                                | 116 +++-
> lib/igt_hook.c                                | 499 ++++++++++++++++++
> lib/igt_hook.h                                |  86 +++
> lib/meson.build                               |   1 +
> lib/tests/igt_hook.c                          | 187 +++++++
> lib/tests/igt_hook_integration.c              | 297 +++++++++++
> lib/tests/meson.build                         |   2 +
> 8 files changed, 1180 insertions(+), 9 deletions(-)
> create mode 100644 lib/igt_hook.c
> create mode 100644 lib/igt_hook.h
> create mode 100644 lib/tests/igt_hook.c
> create mode 100644 lib/tests/igt_hook_integration.c
>
>diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>index 9085eb924e85..11458c68124b 100644
>--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>@@ -32,6 +32,7 @@
>     <xi:include href="xml/igt_fb.xml"/>
>     <xi:include href="xml/igt_frame.xml"/>
>     <xi:include href="xml/igt_gt.xml"/>
>+    <xi:include href="xml/igt_hook.xml"/>
>     <xi:include href="xml/igt_io.xml"/>
>     <xi:include href="xml/igt_kmod.xml"/>
>     <xi:include href="xml/igt_kms.xml"/>
>diff --git a/lib/igt_core.c b/lib/igt_core.c
>index 3ff3e0392316..291d891cf884 100644
>--- a/lib/igt_core.c
>+++ b/lib/igt_core.c
>@@ -70,6 +70,7 @@
>
> #include "igt_core.h"
> #include "igt_aux.h"
>+#include "igt_hook.h"
> #include "igt_sysfs.h"
> #include "igt_sysrq.h"
> #include "igt_rc.h"
>@@ -241,6 +242,9 @@
>  * - '*,!basic*' match any subtest not starting basic
>  * - 'basic*,!basic-render*' match any subtest starting basic but not starting basic-render
>  *
>+ * It is possible to run a shell script at certain points of test execution with
>+ * "--hook". See the usage description with "--help-hook" for details.
>+ *
>  * # Configuration
>  *
>  * Some of IGT's behavior can be configured through a configuration file.
>@@ -273,6 +277,8 @@ static unsigned int exit_handler_count;
> const char *igt_interactive_debug;
> bool igt_skip_crc_compare;
>
>+static struct igt_hook *igt_hook = NULL;
>+
> /* subtests helpers */
> static bool show_testlist = false;
> static bool list_subtests = false;
>@@ -338,6 +344,8 @@ enum {
> 	OPT_INTERACTIVE_DEBUG,
> 	OPT_SKIP_CRC,
> 	OPT_TRACE_OOPS,
>+	OPT_HOOK,
>+	OPT_HELP_HOOK,
> 	OPT_DEVICE,
> 	OPT_VERSION,
> 	OPT_HELP = 'h'
>@@ -810,6 +818,8 @@ static void common_exit_handler(int sig)
> 		bind_fbcon(true);
> 	}
>
>+	igt_hook_free(igt_hook);
>+
> 	/* When not killed by a signal check that igt_exit() has been properly
> 	 * called. */
> 	assert(sig != 0 || igt_exit_called || igt_is_aborting);
>@@ -907,6 +917,8 @@ static void print_usage(const char *help_str, bool output_on_stderr)
> 		   "  --interactive-debug[=domain]\n"
> 		   "  --skip-crc-compare\n"
> 		   "  --trace-on-oops\n"
>+		   "  --hook [<events>:]<cmd>\n"
>+		   "  --help-hook\n"
> 		   "  --help-description\n"
> 		   "  --describe\n"
> 		   "  --device filters\n"
>@@ -1090,6 +1102,8 @@ static int common_init(int *argc, char **argv,
> 		{"interactive-debug", optional_argument, NULL, OPT_INTERACTIVE_DEBUG},
> 		{"skip-crc-compare",  no_argument,       NULL, OPT_SKIP_CRC},
> 		{"trace-on-oops",     no_argument,       NULL, OPT_TRACE_OOPS},
>+		{"hook",              required_argument, NULL, OPT_HOOK},
>+		{"help-hook",         no_argument,       NULL, OPT_HELP_HOOK},
> 		{"device",            required_argument, NULL, OPT_DEVICE},
> 		{"version",           no_argument,       NULL, OPT_VERSION},
> 		{"help",              no_argument,       NULL, OPT_HELP},
>@@ -1225,6 +1239,24 @@ static int common_init(int *argc, char **argv,
> 		case OPT_TRACE_OOPS:
> 			show_ftrace = true;
> 			break;
>+		case OPT_HOOK:
>+			assert(optarg);
>+			if (igt_hook) {
>+				igt_warn("Overriding previous hook descriptor\n");
>+				igt_hook_free(igt_hook);
>+			}
>+			igt_hook = igt_hook_init(optarg, &ret);

this is a pair with igt_hook_free(). I think it's more common to
call it either _new() or _create() rather than _init().


>+			if (!igt_hook) {
>+				igt_critical("Failed to initialize hook data: %s\n",
>+					     igt_hook_error_str(ret));
>+				ret = ret > 0 ? -2 : -3;
>+				goto out;
>+			}
>+			break;
>+		case OPT_HELP_HOOK:
>+			igt_hook_print_help(stdout, "--hook");
>+			ret = -1;
>+			goto out;
> 		case OPT_DEVICE:
> 			assert(optarg);
> 			/* if set by env IGT_DEVICE we need to free it */
>@@ -1274,9 +1306,24 @@ out:
> 			exit(IGT_EXIT_INVALID);
> 	}
>
>-	if (ret < 0)
>-		/* exit with no error for -h/--help */
>-		exit(ret == -1 ? 0 : IGT_EXIT_INVALID);
>+	if (ret < 0) {
>+		free(igt_hook);
>+		igt_hook = NULL;
>+
>+		switch (ret) {
>+		case -1: /* exit with no error for -h/--help */
>+			exit(0);
>+			break;
>+		case -2:
>+			exit(IGT_EXIT_INVALID);
>+			break;
>+		case -3:
>+			exit(IGT_EXIT_ABORT);
>+			break;
>+		default:
>+			assert(0);
>+		}
>+	}
>
> 	if (!igt_only_list_subtests()) {
> 		bind_fbcon(false);
>@@ -1284,6 +1331,15 @@ out:
> 		print_version();
> 		igt_srandom();
>
>+		if (igt_hook) {
>+			struct igt_hook_evt hook_evt = {
>+				.evt_type = IGT_HOOK_PRE_TEST,
>+				.target_name = command_str,
>+			};
>+
>+			igt_hook_push_evt(igt_hook, &hook_evt);
>+		}
>+
> 		sync();
> 		oom_adjust_for_doom();
> 		ftrace_dump_on_oops(show_ftrace);
>@@ -1487,6 +1543,16 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
> 	igt_thread_clear_fail_state();
>
> 	igt_gettime(&subtest_time);
>+
>+	if (igt_hook) {
>+		struct igt_hook_evt hook_evt = {
>+			.evt_type = IGT_HOOK_PRE_SUBTEST,
>+			.target_name = subtest_name,
>+		};
>+
>+		igt_hook_push_evt(igt_hook, &hook_evt);
>+	}
>+
> 	return (in_subtest = subtest_name);
> }
>
>@@ -1517,6 +1583,16 @@ bool __igt_run_dynamic_subtest(const char *dynamic_subtest_name)
> 	_igt_dynamic_tests_executed++;
>
> 	igt_gettime(&dynamic_subtest_time);
>+
>+	if (igt_hook) {
>+		struct igt_hook_evt hook_evt = {
>+			.evt_type = IGT_HOOK_PRE_DYN_SUBTEST,
>+			.target_name = dynamic_subtest_name,
>+		};
>+
>+		igt_hook_push_evt(igt_hook, &hook_evt);
>+	}
>+
> 	return (in_dynamic_subtest = dynamic_subtest_name);
> }
>
>@@ -1602,6 +1678,17 @@ __noreturn static void exit_subtest(const char *result)
> 	struct timespec *thentime = in_dynamic_subtest ? &dynamic_subtest_time : &subtest_time;
> 	jmp_buf *jmptarget = in_dynamic_subtest ? &igt_dynamic_jmpbuf : &igt_subtest_jmpbuf;
>
>+	if (igt_hook) {
>+		struct igt_hook_evt hook_evt = {
>+			.evt_type = (in_dynamic_subtest
>+					? IGT_HOOK_POST_DYN_SUBTEST
>+					: IGT_HOOK_POST_SUBTEST),
>+			.result = result,
>+		};
>+
>+		igt_hook_push_evt(igt_hook, &hook_evt);
>+	}
>+
> 	if (!igt_thread_is_main()) {
> 		igt_thread_fail();
> 		pthread_exit(NULL);
>@@ -2274,6 +2361,7 @@ void __igt_abort(const char *domain, const char *file, const int line,
> void igt_exit(void)
> {
> 	int tmp;
>+	const char *result;
>
> 	if (!test_with_subtests)
> 		igt_thread_assert_no_failures();
>@@ -2318,12 +2406,7 @@ void igt_exit(void)
>
> 	assert(waitpid(-1, &tmp, WNOHANG) == -1 && errno == ECHILD);
>
>-	if (!test_with_subtests) {
>-		struct timespec now;
>-		const char *result;
>-
>-		igt_gettime(&now);
>-
>+	if (!test_with_subtests || igt_hook) {
> 		switch (igt_exitcode) {
> 			case IGT_EXIT_SUCCESS:
> 				result = "SUCCESS";
>@@ -2334,6 +2417,12 @@ void igt_exit(void)
> 			default:
> 				result = "FAIL";
> 		}
>+	}
>+
>+	if (!test_with_subtests) {
>+		struct timespec now;
>+
>+		igt_gettime(&now);
>
> 		if (test_multi_fork_child) /* parent will do the yelling */
> 			_log_line_fprintf(stdout, "dyn_child pid:%d (%.3fs) ends with err=%d\n",
>@@ -2344,6 +2433,15 @@ void igt_exit(void)
> 					  result, igt_time_elapsed(&subtest_time, &now));
> 	}
>
>+	if (igt_hook) {
>+		struct igt_hook_evt hook_evt = {
>+			.evt_type = IGT_HOOK_POST_TEST,
>+			.result = result,
>+		};
>+
>+		igt_hook_push_evt(igt_hook, &hook_evt);
>+	}
>+
> 	exit(igt_exitcode);
> }
>
>diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>new file mode 100644
>index 000000000000..8a39e19e3e5f
>--- /dev/null
>+++ b/lib/igt_hook.c
>@@ -0,0 +1,499 @@
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ *
>+ * Permission is hereby granted, free of charge, to any person obtaining a
>+ * copy of this software and associated documentation files (the "Software"),
>+ * to deal in the Software without restriction, including without limitation
>+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>+ * and/or sell copies of the Software, and to permit persons to whom the
>+ * Software is furnished to do so, subject to the following conditions:
>+ *
>+ * The above copyright notice and this permission notice (including the next
>+ * paragraph) shall be included in all copies or substantial portions of the
>+ * Software.
>+ *
>+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
>+ * IN THE SOFTWARE.


I think this should follow kernel and some of our igt and just use SPDX.

>+ */
>+#include <assert.h>
>+#include <errno.h>
>+#include <limits.h>
>+#include <stdbool.h>
>+#include <stddef.h>
>+#include <stdint.h>
>+#include <stdio.h>
>+#include <stdlib.h>
>+#include <string.h>
>+
>+#include "igt_hook.h"
>+
>+/**
>+ * SECTION:igt_hook
>+ * @short_description: Support for running a hook script on test execution
>+ * @title: Hook support
>+ *
>+ * IGT provides support for running a hook script when executing tests. This
>+ * support is provided to users via CLI option `--hook` available in test
>+ * binaries. Users should use `--help-hook` for detailed usaged description of
>+ * the feature.
>+ *
>+ * The sole user of the exposed API is `igt_core`, which calls @igt_hook_init()
>+ * when initializing a test case, then calls @igt_hook_push_evt() for each event
>+ * that occurs during that test's execution and finally calls @igt_hook_free()
>+ * to clean up at the end.
>+ */
>+
>+#define TEST_NAME_INITIAL_SIZE 16
>+
>+typedef uint16_t evt_mask_t;
>+
>+struct igt_hook {
>+	evt_mask_t evt_mask;
>+	char *cmd;
>+	char *test_name;
>+	size_t test_name_size;
>+	char *subtest_name;
>+	size_t subtest_name_size;
>+	char *dyn_subtest_name;
>+	size_t dyn_subtest_name_size;
>+	char *test_fullname;
>+};
>+
>+enum igt_hook_error {
>+	IGT_HOOK_EVT_EMPTY_NAME = 1,
>+	IGT_HOOK_EVT_NO_MATCH,
>+};
>+
>+static_assert(IGT_HOOK_NUM_EVENTS <= sizeof(evt_mask_t) * CHAR_BIT,
>+	      "Number of event types does not fit event type mask");
>+
>+static const char *igt_hook_evt_type_to_name(enum igt_hook_evt_type evt_type)
>+{
>+	switch (evt_type) {
>+	case IGT_HOOK_PRE_TEST:
>+		return "pre-test";
>+	case IGT_HOOK_PRE_SUBTEST:
>+		return "pre-subtest";
>+	case IGT_HOOK_PRE_DYN_SUBTEST:
>+		return "pre-dyn-subtest";
>+	case IGT_HOOK_POST_DYN_SUBTEST:
>+		return "post-dyn-subtest";
>+	case IGT_HOOK_POST_SUBTEST:
>+		return "post-subtest";
>+	case IGT_HOOK_POST_TEST:
>+		return "post-test";
>+	case IGT_HOOK_NUM_EVENTS:
>+		break;
>+	/* No "default:" case, to force a warning from -Wswitch in case we miss
>+	 * any new event type. */

yeah, I like -Wswitch for this purpose, but I don't think we need a
comment. Instead return something here.

>+	}
>+	return "?";

and return nothing here 

>+}
>+
>+static int igt_hook_parse_hook_str(const char *hook_str, evt_mask_t *evt_mask, const char **cmd)
>+{
>+	const char *s;
>+
>+	if (!strchr(hook_str, ':')) {
>+		*evt_mask = ~0;
>+		*cmd = hook_str;
>+		return 0;
>+	}
>+
>+	s = hook_str;
>+	*evt_mask = 0;
>+
>+	while (1) {
>+		const char *evt_name;
>+		bool has_match;
>+		bool is_star;
>+		enum igt_hook_evt_type evt_type;
>+
>+		evt_name = s;
>+
>+		while (*s != ':' && *s != ',')
>+			s++;
>+
>+		if (evt_name == s)
>+			return IGT_HOOK_EVT_EMPTY_NAME;
>+
>+		has_match = false;
>+		is_star = *evt_name == '*' && evt_name + 1 == s;
>+
>+		for (evt_type = IGT_HOOK_PRE_TEST; evt_type < IGT_HOOK_NUM_EVENTS; evt_type++) {
>+			if (!is_star) {
>+				const char *this_event_name = igt_hook_evt_type_to_name(evt_type);
>+				size_t len = s - evt_name;
>+
>+				if (len != strlen(this_event_name))
>+					continue;
>+
>+				if (strncmp(evt_name, this_event_name, len))
>+					continue;
>+			}
>+
>+			*evt_mask |= 1 << evt_type;

pre-test,pre-test,pre-test:echo foo

^ shouldn't this cause a warning?

but see below for alternative interface

>+			has_match = true;
>+
>+			if (!is_star)
>+				break;
>+		}
>+
>+		if (!has_match)
>+			return IGT_HOOK_EVT_NO_MATCH;
>+
>+		if (*s++ == ':')
>+			break;
>+	}
>+
>+	*cmd = s;
>+
>+	return 0;
>+}
>+
>+static size_t igt_hook_calc_test_fullname_size(struct igt_hook *igt_hook) {
>+	/* The maximum size of test_fullname will be the maximum length of
>+	 * "igt@<test_name>@<subtest_name>@<dyn_subtest_name>" plus 1 for the
>+	 * null byte. */
>+	return (igt_hook->test_name_size +
>+		igt_hook->subtest_name_size +
>+		igt_hook->dyn_subtest_name_size) + 4;
>+}
>+
>+static void igt_hook_update_test_fullname(struct igt_hook *igt_hook)
>+{
>+	int i;
>+	char *s;
>+	const char *values[3] = {
>+		igt_hook->test_name,
>+		igt_hook->subtest_name,
>+		igt_hook->dyn_subtest_name,
>+	};
>+
>+	if (igt_hook->test_name[0] == '\0') {
>+		igt_hook->test_fullname[0] = '\0';
>+		return;
>+	}
>+
>+	s = stpcpy(igt_hook->test_fullname, "igt");
>+	for (i = 0; i < 3 && values[i][0] != '\0'; i++) {

			^ ARRAY_SIZE()

>+		*s++ = '@';
>+		s = stpcpy(s, values[i]);
>+	}
>+}
>+
>+/**
>+ * igt_hook_init:
>+ * @hook_str: Hook descriptor string.
>+ * @error: Pointer to error number.
>+ *
>+ * Allocate and initialize an #igt_hook structure.
>+ *
>+ * This function parses the hook descriptor @hook_str and initializes the struct
>+ * to be returned.
>+ *
>+ * The hook descriptor comes from the argument to `--hook` of the test
>+ * executable being run.
>+ *
>+ * If not #NULL, @error is used to store a non-zero error number if an error
>+ * happens. A human-readable string for that error number can be obtained with
>+ * @igt_hook_error_str().
>+ *
>+ * Returns: The pointer to the #igt_hook structure on success or #NULL on error.
>+ */
>+struct igt_hook *igt_hook_init(const char *hook_str, int *error)
>+{
>+	int err;
>+	evt_mask_t evt_mask;
>+	const char *cmd;
>+	struct igt_hook *igt_hook = NULL;
>+
>+
>+	err = igt_hook_parse_hook_str(hook_str, &evt_mask, &cmd);
>+	if (err)
>+		goto out;
>+
>+	igt_hook = calloc(1, sizeof(*igt_hook));
>+	igt_hook->evt_mask = evt_mask;
>+
>+	igt_hook->cmd = strdup(cmd);
>+	if (!igt_hook->cmd) {
>+		err = -errno;
>+		goto out;
>+	}
>+
>+	igt_hook->test_name = malloc(TEST_NAME_INITIAL_SIZE);
>+	igt_hook->test_name_size = TEST_NAME_INITIAL_SIZE;
>+	igt_hook->subtest_name = malloc(TEST_NAME_INITIAL_SIZE);
>+	igt_hook->subtest_name_size = TEST_NAME_INITIAL_SIZE;
>+	igt_hook->dyn_subtest_name = malloc(TEST_NAME_INITIAL_SIZE);
>+	igt_hook->dyn_subtest_name_size = TEST_NAME_INITIAL_SIZE;

up to you, but in this kind of things I tend to prefer the strings in
the outer struct so we have fewer separate malloc()'s and thus fewer
chances of leaking them

just calculate the size ahead and then update igt_hook->test_name,
igt_hook->subtest_name and igt_hook->dyn_subtest_name to point to the right part.

>+	igt_hook->test_fullname = malloc(igt_hook_calc_test_fullname_size(igt_hook));
>+
>+	igt_hook->test_name[0] = '\0';
>+	igt_hook->subtest_name[0] = '\0';
>+	igt_hook->dyn_subtest_name[0] = '\0';
>+	igt_hook->test_fullname[0] = '\0';

with the benefit that then these are covered by the calloc.

up to you.

>+
>+out:
>+	if (err) {
>+		if (error)
>+			*error = err;
>+
>+		igt_hook_free(igt_hook);
>+
>+		return NULL;
>+	}
>+
>+	return igt_hook;
>+}
>+
>+/**
>+ * igt_hook_free:
>+ * @igt_hook: The igt_hook struct.
>+ *
>+ * De-initialize an igt_hook struct returned by @igt_hook_init().
>+ *
>+ * This is a no-op if @igt_hook is #NULL.
>+ */
>+void igt_hook_free(struct igt_hook *igt_hook)
>+{
>+	if (!igt_hook)
>+		return;
>+
>+	free(igt_hook->cmd);
>+	free(igt_hook->test_name);
>+	free(igt_hook->subtest_name);
>+	free(igt_hook->dyn_subtest_name);
>+	free(igt_hook);
>+}
>+
>+static void igt_hook_update_test_name_pre_call(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
>+{
>+	char **name_ptr;
>+	size_t *size_ptr;
>+	size_t len;
>+
>+	switch (evt->evt_type) {
>+	case IGT_HOOK_PRE_TEST:
>+		name_ptr = &igt_hook->test_name;
>+		size_ptr = &igt_hook->test_name_size;
>+		break;
>+	case IGT_HOOK_PRE_SUBTEST:
>+		name_ptr = &igt_hook->subtest_name;
>+		size_ptr = &igt_hook->subtest_name_size;
>+		break;
>+	case IGT_HOOK_PRE_DYN_SUBTEST:
>+		name_ptr = &igt_hook->dyn_subtest_name;
>+		size_ptr = &igt_hook->dyn_subtest_name_size;
>+		break;
>+	default:
>+		return;
>+	}
>+
>+	len = strlen(evt->target_name);
>+	if (len + 1 > *size_ptr) {
>+		size_t fullname_size;
>+
>+		*size_ptr *= 2;
>+		*name_ptr = realloc(*name_ptr, *size_ptr);
>+
>+		fullname_size = igt_hook_calc_test_fullname_size(igt_hook);
>+		igt_hook->test_fullname = realloc(igt_hook->test_fullname, fullname_size);
>+	}
>+
>+	strcpy(*name_ptr, evt->target_name);
>+	igt_hook_update_test_fullname(igt_hook);
>+}
>+
>+static void igt_hook_update_test_name_post_call(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
>+{
>+	switch (evt->evt_type) {
>+	case IGT_HOOK_POST_TEST:
>+		igt_hook->test_name[0] = '\0';
>+		break;
>+	case IGT_HOOK_POST_SUBTEST:
>+		igt_hook->subtest_name[0] = '\0';
>+		break;
>+	case IGT_HOOK_POST_DYN_SUBTEST:
>+		igt_hook->dyn_subtest_name[0] = '\0';
>+		break;
>+	default:
>+		return;
>+	}
>+
>+	igt_hook_update_test_fullname(igt_hook);
>+}
>+
>+static void igt_hook_update_env_vars(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
>+{
>+	setenv("IGT_HOOK_EVENT", igt_hook_evt_type_to_name(evt->evt_type), 1);
>+	setenv("IGT_HOOK_TEST_FULLNAME", igt_hook->test_fullname, 1);
>+	setenv("IGT_HOOK_TEST", igt_hook->test_name, 1);
>+	setenv("IGT_HOOK_SUBTEST", igt_hook->subtest_name, 1);
>+	setenv("IGT_HOOK_DYN_SUBTEST", igt_hook->dyn_subtest_name, 1);
>+	setenv("IGT_HOOK_RESULT", evt->result ?: "", 1);
>+}
>+
>+/**
>+ * igt_hook_push_evt:
>+ * @igt_hook: The igt_hook structure.
>+ * @evt: The event to be pushed.
>+ *
>+ * Push a new igt_hook event.
>+ *
>+ * This function must be used to register a new igt_hook event. Calling it will
>+ * cause execution of the hook script if the event type matches the filters
>+ * provided during initialization of @igt_hook.
>+ */
>+void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
>+{
>+	typeof(igt_hook->evt_mask) evt_bit = (1 << evt->evt_type);
>+
>+	igt_hook_update_test_name_pre_call(igt_hook, evt);
>+
>+	if ((evt_bit & igt_hook->evt_mask)) {
>+		igt_hook_update_env_vars(igt_hook, evt);
>+		system(igt_hook->cmd);

this polutes the env for the current process just so the child process
has those env vars. We could either duplicate the environ on startup and
use execle(), or to be simpler, just make sure to zap our env just after
running the command.  This avoids undesirable behavior because we didn't
clean up the environ.


>+	}
>+
>+	igt_hook_update_test_name_post_call(igt_hook, evt);
>+}
>+
>+/**
>+ * igt_hook_error_str:
>+ * @error: Non-zero error number.
>+ *
>+ * Return a human-readable string containing a description of an error number
>+ * generated by one of the `igt_hook_*` functions.
>+ *
>+ * The string will be the result of strerror() for errors from the C standard
>+ * library or a custom description specific to igt_hook.
>+ */
>+const char *igt_hook_error_str(int error)
>+{
>+	if (!error)
>+		return "No error";
>+
>+	if (error > 0) {
>+		enum igt_hook_error hook_error = error;
>+
>+		switch (hook_error) {
>+		case IGT_HOOK_EVT_EMPTY_NAME:
>+			return "Empty name in event descriptor";
>+		case IGT_HOOK_EVT_NO_MATCH:
>+			return "Event name in event descriptor does not match any event type";
>+		default:
>+			return "Unknown error";
>+		}
>+	} else {
>+		return strerror(-error);
>+	}
>+}
>+
>+/**
>+ * igt_hook_print_help:
>+ * @f: File pointer where to write the output.
>+ * @option_name: Name of the CLI option that accepts the hook descriptor.
>+ *
>+ * Print a detailed user help text on hook usage.
>+ */
>+void igt_hook_print_help(FILE *f, const char *option_name)
>+{
>+	fprintf(f, "\
>+The option %1$s receives as argument a \"hook descriptor\" and allows the\n\
>+execution of a shell command at different points during execution of tests. Each\n\
>+such a point is called a \"hook event\".\n\
>+\n\
>+Examples:\n\
>+\n\
>+  # Prints hook-specic env vars for every event.\n\
>+  %1$s 'printenv | grep ^IGT_HOOK_'\n\
>+\n\
>+  # Equivalent to the above. Useful if command contains ':'.\n\
>+  %1$s '*:printenv | grep ^IGT_HOOK_'\n\
>+\n\
>+  # Adds a line to out.txt containing the result of each test case.\n\
>+  %1$s 'post-test:echo $IGT_HOOK_TEST_FULLNAME $IGT_HOOK_RESULT >> out.txt'\n\
>+\n\
>+The accepted format for a hook descriptor is `[<events>:]<cmd>`, where:\n\
>+\n\
>+  - <events> is a comma-separated list of event descriptors, which defines the\n\
>+    set of events be tracked. If omitted, all events are tracked.\n\
>+\n\


I think the interface git-rebase is more natural for this kind of
thing. You have 2 concepts: event and hook with n:1 relationship
because of the interface chosen.

Why not simply use 1:1 and then allow the program to have multiple
hooks?


Just in git-rebase we do  `git rebase -x "echo foo" -x "echo bar"` and
the commands are appended, we could have:

igt_runner -x 'pre-test:echo foo' -x 'post-test:echo bar'. Then you only
warn when you user incorrectly used the same hook type.  I think it
would be more natural to eventually embed the support on a test list
(with the exception we'd not warn anymore), with something like:

hook@pre-test@echo foo
hook@post-test@echo bar
igt@...
igt@...
igt@...
hook@pre-test@ ....
igt@...




>+  - <cmd> is a shell command to be executed on the occurrence each tracked\n\
>+    event. If the command contains ':', then passing <events> is required,\n\
>+    otherwise part of the command would be treated as an event descriptor.\n\
>+\n\
>+", option_name);
>+
>+	fprintf(f, "\
>+An \"event descriptor\" is either the name of an event or the string '*'. The\n\
>+latter matches all event names. The list of possible event names is provided\n\
>+below:\n\
>+\n\
>+");
>+
>+	for (enum igt_hook_evt_type et = 0; et < IGT_HOOK_NUM_EVENTS; et++) {
>+		const char *desc;
>+
>+		switch (et) {
>+		case IGT_HOOK_PRE_TEST:
>+			desc = "Occurs before a test case starts.";
>+			break;
>+		case IGT_HOOK_PRE_SUBTEST:
>+			desc = "Occurs before the execution of a subtest.";
>+			break;
>+		case IGT_HOOK_PRE_DYN_SUBTEST:
>+			desc = "Occurs before the execution of a dynamic subtest.";
>+			break;
>+		case IGT_HOOK_POST_DYN_SUBTEST:
>+			desc = "Occurs after the execution of a dynamic subtest.";
>+			break;
>+		case IGT_HOOK_POST_SUBTEST:
>+			desc = "Occurs after the execution of a subtest.";
>+			break;
>+		case IGT_HOOK_POST_TEST:
>+			desc = "Occurs after a test case has finished.";
>+			break;
>+		default:
>+			desc = "MISSING DESCRIPTION";
>+		}
>+
>+		fprintf(f, "  %s\n  %s\n\n", igt_hook_evt_type_to_name(et), desc);
>+	}
>+
>+	fprintf(f, "\
>+For each event matched by <events>, <cmd> is executed as a shell command. The\n\
>+exit status of the command is ignored. The following environment variables are\n\
>+available to the command:\n\
>+\n\
>+  IGT_HOOK_EVENT\n\
>+  Name of the current event.\n\
>+\n\
>+  IGT_HOOK_TEST_FULLNAME\n\
>+  Full name of the test in the format `igt@<test>[@<subtest>[@<dyn_subtest>]]`.\n\
>+\n\
>+  IGT_HOOK_TEST		   \n\
>+  Name of the current test.\n\
>+\n\
>+  IGT_HOOK_SUBTEST\n\
>+  Name of the current subtest. Will be the empty string if not running a\n\
>+  subtest.\n\
>+\n\
>+  IGT_HOOK_DYN_SUBTEST\n\
>+  Name of the current dynamic subtest. Will be the empty string if not running a\n\
>+  dynamic subtest.\n\
>+\n\
>+  IGT_HOOK_RESULT\n\
>+  String representing the result of the test/subtest/dynamic subtest. Possible\n\
>+  values are: SUCCESS, SKIP or FAIL. This is only applicable on \"post-*\"\n\
>+  events and will be the empty string for other types of events.\n\
>+\n\
>+");
>+}
>diff --git a/lib/igt_hook.h b/lib/igt_hook.h
>new file mode 100644
>index 000000000000..6fef7254a317
>--- /dev/null
>+++ b/lib/igt_hook.h
>@@ -0,0 +1,86 @@
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ *
>+ * Permission is hereby granted, free of charge, to any person obtaining a
>+ * copy of this software and associated documentation files (the "Software"),
>+ * to deal in the Software without restriction, including without limitation
>+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>+ * and/or sell copies of the Software, and to permit persons to whom the
>+ * Software is furnished to do so, subject to the following conditions:
>+ *
>+ * The above copyright notice and this permission notice (including the next
>+ * paragraph) shall be included in all copies or substantial portions of the
>+ * Software.
>+ *
>+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
>+ * IN THE SOFTWARE.
>+ */

ditto on SPDX


Lucas De Marchi
