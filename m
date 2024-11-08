Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6BED5C0F5
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 15:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B634F10E9F8;
	Fri,  8 Nov 2024 15:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ss6JMu/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B2E10E9F8
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 15:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731081069; x=1762617069;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=C406jKz2CNeMt3AaPtwfwhqvYZ7FpxnqpUuCUqVbLK8=;
 b=Ss6JMu/Y4HCvNv30xoWhWLoZWcsnA3nKu291hSYkq+J4azFqaa0tHAj6
 iUQtRgnJZqLtfTny11061MdDPEiBHVMgcRFd0s7dCJsSzm9VUyejZ3hzu
 PZI1mx36EAneFv+bZxld4RfSF1NEICy2q9KKEKvJaDVThZ+1QjgQb10E/
 1hVZSTZYTFzGOszaAijQz72cz4zA0RWKm7+ymcIYJPVkoDpYDjsm59UtL
 sc6UyVP5DdOOsqNPI5U9O2XZYg1vzPW5i03+v/Z51UZO7kOUiTq6BhRpV
 1evky8gKLsJR9tZ5OWmTqRvOaJYQMh96se8XSHVyqtIbLSxWiWrLdO4zT Q==;
X-CSE-ConnectionGUID: LQGSFNc1T/yi6zTe3++BqA==
X-CSE-MsgGUID: 2tI8cBPdTmqVONmLuK46Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30366292"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="30366292"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 07:51:09 -0800
X-CSE-ConnectionGUID: v+MBZi/zRiC7MzwCKfcY1g==
X-CSE-MsgGUID: tHrKctGbTE+gD8LtA7ZiLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="90160281"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 07:51:09 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 07:51:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 07:51:07 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 07:51:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9zIYEr0xs56muy0RnCo0XLKdujzpYR+wRGhToCLjgR8DbpBcWVHlrNG/9prMO1mvFcJqFFUhhNqOjRN+Xr26JTjucfBP6a4C6d+sURpUjXZdBR8AHs+AWw7Zjvwd6swC+4Lfg9GkE0Bpwo4ceBBcR+PkCEM68ndYmrGC+MvPdqn7o/bAC4xoieO6LjRPokxFshAThyfp68bwWmhu0B1j1LVt+sz84/8AlepFrHA8I81wsQ/8Q0R/+M+6rn0DapzbDLdm3OTrcdJ0itlB55C6y7vFzB2GUlxWK2FCkt8S8JQp14gq7jV1HmtVRzyGqclb4WJY2dJUmAmCYf4X1sdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnvQMi+5DxxuEQO82aZkQRf0s6gDYUtdNicjUztJaY8=;
 b=tXEiHL93Gx7VDYmJ0D/aTcXr87gW5DoKe6B9TiLi2xXkE/VMvpWwnqbU8pt7XvivuoE1ED4f3yYpZiV/G1T2hfsveXP5IO02dDJo6uI/1M/GSSCxM0TVEl/shpng6BHycKzny7Kok+Kd1O2qjkLHatnx1pbsL7q+LLYRfmdmTqyBrvyfKQQprBG3RmAP+bSHmIMd/WQQtYTOcmUIr9JB+EUJRGjKUORtgEepyAskjziJqVa5Ib45wqOSH+NPHHZCpiVAmXvS8CNO1kZ54cqzDg5EHK42+YBP6d3GROWPWRohps+/v60FVyn1t3g3TXloNfdrM3kv+CWR37ax22TbKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6382.namprd11.prod.outlook.com (2603:10b6:8:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 15:51:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 15:51:01 +0000
Date: Fri, 8 Nov 2024 09:50:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Ngai-Mint Kwan
 <ngai-mint.kwan@linux.intel.com>, <jani.nikula@intel.com>,
 <clinton.a.taylor@intel.com>, <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v2] lib: sync PCI ID macros with kernel
Message-ID: <sojqnvnniougw7y4yo5wmvstmxtuxvrhd2i376g6lig24r3jsm@islqlychrne4>
References: <20241107231457.70157-1-ngai-mint.kwan@linux.intel.com>
 <20241108144916.ejpqphj6lmig7iko@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241108144916.ejpqphj6lmig7iko@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: MW4PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:303:8d::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: b6440078-0491-4422-7276-08dd000d24d9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6H3DzKGCJenZMqhWmCXAYR6kpQjvwQzF0kwIjTAoWcAph/8ye7uE2J/Kdz?=
 =?iso-8859-1?Q?Q28rLa8t/fUPHCJoq7WEZ1Bd1YCGwrxEn9wOamkLqiG/mw/UTmXTTQ2Lkm?=
 =?iso-8859-1?Q?Tp2tvbVy+qpAG/nPRhSI9Mmy3maynZj0LlG1dAsG3UJulcOz14XSk8rsT2?=
 =?iso-8859-1?Q?ZqBgD0Hw2TvQhvPY8Saabq0S94xCYT/2JLvrDgLI8y7BOj9lqVcuGoDaJY?=
 =?iso-8859-1?Q?uvmKVirrcv5td7uOuiOaZ7NCJU3gRx1huEoRbMPQEUNhifgPQiitGuibPI?=
 =?iso-8859-1?Q?cfybPU1DO8v1Banm3IERNATIlXvdLKEo/yrSYZJ36Dak3peOzvewx7PNjy?=
 =?iso-8859-1?Q?vgpJ04nWqiZI+l9Ge6Mtz6OiUPtnFReT9HUvA7Gv/jEF1EhOI3aaVvqXgv?=
 =?iso-8859-1?Q?HivT5aLbkHaOI8pFGOjrSjVeE4chNuMeiRF5pi5YalM5IKLeg6Zp2+NLCB?=
 =?iso-8859-1?Q?AIEAdXjY1RWiYK+da9UILpy4wl5lodlbUWCrbilbbKgRorhDLii7p7N1NR?=
 =?iso-8859-1?Q?ocwMQKA1TVVRco8XQcm/uyRlGaxJycAcz4w5ZNfu5PPrVeaRmmwYszzNYM?=
 =?iso-8859-1?Q?9FlIOAI7FMT01cyOubl+I5wWhCKQRY+zKZRh0VIVg/00M66iLA6+u2LEWZ?=
 =?iso-8859-1?Q?g8mjtY6Z6rA3RbJooMBU/1NBRMom/lTEDccHFQzCYaUcbZx8JMM4vPmBLM?=
 =?iso-8859-1?Q?fkta0WJ4ohDEHAQKTL0mAL4GAwEHintajcRoK0C3tvFv+tjwEieyx6h5aH?=
 =?iso-8859-1?Q?v81KEgZIEF4Br4Q05viciVKed/wpNT7ZJsGlb9dpWls48cxRJeG6PgMpLa?=
 =?iso-8859-1?Q?d15eTcQXOEbxdqU/pX+RaG6HAyqPsphyo9w1KHx6ci19Dg6LIf/m5JYUbv?=
 =?iso-8859-1?Q?ciDo9kZ1K9ZrFFZXdbtm/11tI1uG0WqhTyZm1KsOUR5VtVX2vrw1AyLXcr?=
 =?iso-8859-1?Q?c6HUU1YO6K8MnY3LmQD/kHNLWS9uz2bbSrgRxMpVajwfqyx63h7uisvHyM?=
 =?iso-8859-1?Q?3MoNjnob15YFcMGHRqjo1FqqcVUewtAnq+pMQI1Ejd0mpFyIg1nd/DnnvY?=
 =?iso-8859-1?Q?CNElIEdZ6ddR/HiGJCslAgNMEJZe6k3fSSjNSspyqXnXdaEpiH6TczUcob?=
 =?iso-8859-1?Q?oFK2vasO6+gy9ZnSyF/A/EzXddo3YJs4ExhgkzcQzAiFlMhrD7nP1qQFm1?=
 =?iso-8859-1?Q?rcX5MlXnxQilV31wuCcWjzv6cudPEdnfMgDIgJtjxe09ALmuDQ+lFY6COq?=
 =?iso-8859-1?Q?fnIYtDdrkGt8zXcHr/Ya3rEA6yKxgqfuOLcjvazb04936jXBuPmtDgc56D?=
 =?iso-8859-1?Q?MRWPqhFxts6xxfUQBe2cPrONqpZSmrFPAqIUtrV3L/NA/VbhKTc1luiWfT?=
 =?iso-8859-1?Q?3dvbSYtXW9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pU5NJLdgXmbGoo/WV5strctCbjORRHtIKbPtrGAxuXrZcfz5ybS2d1mvvS?=
 =?iso-8859-1?Q?F3OwDEynQdznZbKOZA2L0rTGJOQzSGbFqPxMZrfxXl6CD52RW1bV0lKe6T?=
 =?iso-8859-1?Q?3OIyOhBKDU4EMkKifYy3LcKOMuy5X3Gvc5RZq11sz4MA2tJQlc+KGxVnlP?=
 =?iso-8859-1?Q?qSGwKnwjoYkTb2eo5GcZN2lJWtyVKT/UOniZG8M98TUbgTZO6WfheIi33q?=
 =?iso-8859-1?Q?SyuKq5t5PdiV3Ul5UYVlS8FYev7LRKjm6lguG0WrXXdPCI0Qf4PxA5e/0g?=
 =?iso-8859-1?Q?mBQOvyTvyTjVzExHaDDzuC+qr8UZaFGD+H4vVx9/80Z81R0GNxB3XVibfP?=
 =?iso-8859-1?Q?gUELzwuF5grZD40a0ZUIUV7EIq1nVwCEBC1kWJfIAqFhshcUdw1DDK5XIz?=
 =?iso-8859-1?Q?5fYoqow33Lk8nuNPKK94vBVLqaV95OKwugMuvuWdvWI7vyk1+bI/N3A8mz?=
 =?iso-8859-1?Q?AMLr/cs44thf/bmQ4tO9zCQj+OClhQ1LfFsoJzG6bwfFhbSFXXCoDFAnLq?=
 =?iso-8859-1?Q?Xc8BZt4pKaJbPx2CS3SFTOFl7bifRen1sl1p18AuQxIfJh2P7EMIpdou3T?=
 =?iso-8859-1?Q?e8XvYBDh8uWqPwXPpxyQCB55EFxX++79GqAfZqDexqTQO8s15OND3/54cH?=
 =?iso-8859-1?Q?+LPjTfUaOYHqoZ292qSQBZgkXoDv/hqNIMNAMh5dfpBi90G4vnXKKvS4FQ?=
 =?iso-8859-1?Q?bAzV3kXe1ce4f0ndp+LQcgDmQhpG8LA5zkNsVxyc+N+tMwCLRwGK8cUcZv?=
 =?iso-8859-1?Q?itbaIfC2QYqmzTKinfFbCQ2Zpf6+hvy36YJwIvBzFSNq9YDD7cCzztCGLg?=
 =?iso-8859-1?Q?xSjm+E0XN6+5HoPLQ3oaVPFMZJrcZe339F4mJ+A8xBVAj+p3Jvn+vnKf7W?=
 =?iso-8859-1?Q?dj4yUZC2jBq7rpOviee8ZHOh8g78ymLYhyZfgqlL3QeHCFdr5E0xtFIXuZ?=
 =?iso-8859-1?Q?OjGaHf3w6l+zjkY62+oxZc3whJMt9orFHGmPyHR2HI7CBj8alnyV/k2nBX?=
 =?iso-8859-1?Q?upQSn2IJvzOEmopYjH7355sXP+QeGWdjII0pLOM1s6FQHcdcQHpt5Ke1Mg?=
 =?iso-8859-1?Q?qUqwNdFogvfsL+LHSNICb6FZb+kra+Ltiu3IhqqGd15c1oJmyxQQlVtkQ1?=
 =?iso-8859-1?Q?yo8qvifrIg/p5bV0Tswx6hbqe+ZjRpkMfDXpxN3KwOpWuX75FkzEFdY8zX?=
 =?iso-8859-1?Q?LnyQkrpycO/odxgw70uTm4GBvUGBUJAoLjV2M0iy3ESJbC0Dcw42BHfAtx?=
 =?iso-8859-1?Q?Cm6jC+uC9J9TaCZUmpFNZfXIUNlPYOqNp7alQ6LuJ+di4kdZptlGvduq9P?=
 =?iso-8859-1?Q?lNrwQZQ+O3w0m24K2/Lkx3f7K+h+QuyWh4d0qNt/qqV2YwQQoSWP5A7Amb?=
 =?iso-8859-1?Q?LjxjO2iqGH5eA5cJz5l72KwtBkbBsFUTOsvwLapcthfwg5fzEGZpPy8E0K?=
 =?iso-8859-1?Q?n+Ho2y605btjurnkMvm7uaeVUe4nEnel9R8Zl5Obox4ZQ8XRQp1zbfH7OX?=
 =?iso-8859-1?Q?hWKsJ91KNaBAf65KbFGFxs0xiXDK+9P3vzuY+UIyvPwAu8c0IpY10VMRLZ?=
 =?iso-8859-1?Q?M88QXk3iaxkVH6PnmK1DwtNu8Ye1CCV2BYi2Qp8/z3AGbaIZB8UKEUM8Mn?=
 =?iso-8859-1?Q?xenz1sBLIk0qywpMb4dNmyNQTRJUEMVxJYcINUlRVXf9/LFc8f2l5+fg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6440078-0491-4422-7276-08dd000d24d9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 15:51:01.3122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyMycO8Yc3zxQo3JqQhcqKSAnqtbLUseU9UOt6Dg6XFifstAqfaza1C6ZPW/Ll5iMKhzSB5NH8WvWfAtnoNKhNBThUxSzXDj/6ETH9rX27I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6382
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

On Fri, Nov 08, 2024 at 03:49:16PM +0100, Kamil Konieczny wrote:
>Hi Ngai-Mint,
>On 2024-11-07 at 15:14:45 -0800, Ngai-Mint Kwan wrote:
>> Synch with kernel commit that uses common PCI ID macros:
>> 3c1d5ced18db ("drm/i915/gsc: ARL-H and ARL-U need a newer GSC FW.")

$ git branch --contains 3c1d5ced18db8a67251c8436cf9bdc061f972bdb
+ drm-intel-next
+ drm-tip
* tip

>
>I couldn't find this commit on drm-tip, did I miss something?
>
>What I found using google was:
>https://lore.kernel.org/all/2c1c07f5-920b-4f6e-87dc-752ae3725a2c@intel.com/T/
>
>and in that commit there are only additions to i915_pciids.h

the commit describes the state of the branch... there may be previous
changes being carried together. As long as it's an exact copy of the
kernel header in that specific commit I think we are fine.


Lucas De Marchi

>
>Please provide link to lore.kernel.org to a commit you are
>referring and also which kernel tree you are using.
>
>When this rename reach drm-tip?
>
>Regards,
>Kamil
>
>>
>> Refactor lib to use new macro definitions and pciids.h header file.
>>
>> Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
>> ---
>>  docs/reference/igt-gpu-tools/meson.build |   3 +-
>>  lib/i915/perf.c                          |   2 +-
>>  lib/i915_pciids_local.h                  |   2 +-
>>  lib/intel_device_info.c                  |   8 +-
>>  lib/{i915_pciids.h => pciids.h}          | 106 ++++++++---
>>  lib/xe/xe_oa.c                           |  12 +-
>>  lib/xe_pciids.h                          | 218 -----------------------
>>  7 files changed, 90 insertions(+), 261 deletions(-)
>>  rename lib/{i915_pciids.h => pciids.h} (92%)
>>  delete mode 100644 lib/xe_pciids.h
>>
>> diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
>> index d5db95e40..8d70a49b8 100644
>> --- a/docs/reference/igt-gpu-tools/meson.build
>> +++ b/docs/reference/igt-gpu-tools/meson.build
>> @@ -10,7 +10,6 @@ ignore_headers = [
>>  	'gpgpu_fill.h',
>>  	'i830_reg.h',
>>  	'i915_3d.h',
>> -	'i915_pciids.h',
>>  	'i915_reg.h',
>>  	'igt_edid_template.h',
>>  	'intel_reg.h',
>> @@ -21,8 +20,8 @@ ignore_headers = [
>>  	'media_spin.h',
>>  	'media_fill_gen9.h',
>>  	'gen9_render.h',
>> +	'pciids.h',
>>  	'version.h',
>> -	'xe_pciids.h',
>>  ]
>>
>>  test_groups = [
>> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
>> index ef2f74be8..9eb1141d4 100644
>> --- a/lib/i915/perf.c
>> +++ b/lib/i915/perf.c
>> @@ -37,7 +37,7 @@
>>
>>  #include <i915_drm.h>
>>
>> -#include "i915_pciids.h"
>> +#include "pciids.h"
>>  #include "i915_pciids_local.h"
>>
>>  #include "intel_chipset.h"
>> diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
>> index c404a51af..b85cfd779 100644
>> --- a/lib/i915_pciids_local.h
>> +++ b/lib/i915_pciids_local.h
>> @@ -5,7 +5,7 @@
>>  #ifndef _I915_PCIIDS_LOCAL_H_
>>  #define _I915_PCIIDS_LOCAL_H_
>>
>> -#include "i915_pciids.h"
>> +#include "pciids.h"
>>
>>  /* MTL perf */
>>  #ifndef INTEL_MTL_M_IDS
>> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
>> index 2a118eda6..546b9c65a 100644
>> --- a/lib/intel_device_info.c
>> +++ b/lib/intel_device_info.c
>> @@ -1,7 +1,6 @@
>>  #include "intel_chipset.h"
>> -#include "i915_pciids.h"
>> +#include "pciids.h"
>>  #include "i915_pciids_local.h"
>> -#include "xe_pciids.h"
>>
>>  #include <strings.h> /* ffs() */
>>
>> @@ -635,12 +634,13 @@ static const struct pci_id_match intel_device_match[] = {
>>  	INTEL_ATS_M_IDS(INTEL_PCI_ID_INIT, &intel_ats_m_info),
>>
>>  	INTEL_MTL_IDS(INTEL_PCI_ID_INIT, &intel_meteorlake_info),
>> +	INTEL_ARL_IDS(INTEL_PCI_ID_INIT, &intel_meteorlake_info),
>>
>>  	INTEL_PVC_IDS(INTEL_PCI_ID_INIT, &intel_pontevecchio_info),
>>
>> -	XE_LNL_IDS(INTEL_PCI_ID_INIT, &intel_lunarlake_info),
>> +	INTEL_LNL_IDS(INTEL_PCI_ID_INIT, &intel_lunarlake_info),
>>
>> -	XE_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
>> +	INTEL_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
>>
>>  	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
>>  };
>> diff --git a/lib/i915_pciids.h b/lib/pciids.h
>> similarity index 92%
>> rename from lib/i915_pciids.h
>> rename to lib/pciids.h
>> index 3e39d644e..32480b556 100644
>> --- a/lib/i915_pciids.h
>> +++ b/lib/pciids.h
>> @@ -22,30 +22,23 @@
>>   * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>   * DEALINGS IN THE SOFTWARE.
>>   */
>> -#ifndef _I915_PCIIDS_H
>> -#define _I915_PCIIDS_H
>> -
>> -/*
>> - * A pci_device_id struct {
>> - *	__u32 vendor, device;
>> - *      __u32 subvendor, subdevice;
>> - *	__u32 class, class_mask;
>> - *	kernel_ulong_t driver_data;
>> - * };
>> - * Don't use C99 here because "class" is reserved and we want to
>> - * give userspace flexibility.
>> - */
>> -#define INTEL_VGA_DEVICE(id, info) { \
>> -	0x8086,	id, \
>> -	~0, ~0, \
>> -	0x030000, 0xff0000, \
>> -	(unsigned long) info }
>> -
>> -#define INTEL_QUANTA_VGA_DEVICE(info) { \
>> -	0x8086,	0x16a, \
>> -	0x152d,	0x8990, \
>> -	0x030000, 0xff0000, \
>> -	(unsigned long) info }
>> +#ifndef __PCIIDS_H__
>> +#define __PCIIDS_H__
>> +
>> +#ifdef __KERNEL__
>> +#define INTEL_VGA_DEVICE(_id, _info) { \
>> +	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
>> +	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
>> +	.driver_data = (kernel_ulong_t)(_info), \
>> +}
>> +
>> +#define INTEL_QUANTA_VGA_DEVICE(_info) { \
>> +	.vendor = PCI_VENDOR_ID_INTEL, .device = 0x16a, \
>> +	.subvendor = 0x152d, .subdevice = 0x8990, \
>> +	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
>> +	.driver_data = (kernel_ulong_t)(_info), \
>> +}
>> +#endif
>>
>>  #define INTEL_I810_IDS(MACRO__, ...) \
>>  	MACRO__(0x7121, ## __VA_ARGS__), /* I810 */ \
>> @@ -771,16 +764,71 @@
>>  	INTEL_ATS_M150_IDS(MACRO__, ## __VA_ARGS__), \
>>  	INTEL_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>>
>> +/* ARL */
>> +#define INTEL_ARL_H_IDS(MACRO__, ...) \
>> +	MACRO__(0x7D51, ## __VA_ARGS__), \
>> +	MACRO__(0x7DD1, ## __VA_ARGS__)
>> +
>> +#define INTEL_ARL_U_IDS(MACRO__, ...) \
>> +	MACRO__(0x7D41, ## __VA_ARGS__) \
>> +
>> +#define INTEL_ARL_S_IDS(MACRO__, ...) \
>> +	MACRO__(0x7D67, ## __VA_ARGS__), \
>> +	MACRO__(0xB640, ## __VA_ARGS__)
>> +
>> +#define INTEL_ARL_IDS(MACRO__, ...) \
>> +	INTEL_ARL_H_IDS(MACRO__, ## __VA_ARGS__), \
>> +	INTEL_ARL_U_IDS(MACRO__, ## __VA_ARGS__), \
>> +	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
>> +
>>  /* MTL */
>>  #define INTEL_MTL_IDS(MACRO__, ...) \
>>  	MACRO__(0x7D40, ## __VA_ARGS__), \
>> -	MACRO__(0x7D41, ## __VA_ARGS__), \
>>  	MACRO__(0x7D45, ## __VA_ARGS__), \
>> -	MACRO__(0x7D51, ## __VA_ARGS__), \
>>  	MACRO__(0x7D55, ## __VA_ARGS__), \
>>  	MACRO__(0x7D60, ## __VA_ARGS__), \
>> -	MACRO__(0x7D67, ## __VA_ARGS__), \
>> -	MACRO__(0x7DD1, ## __VA_ARGS__), \
>>  	MACRO__(0x7DD5, ## __VA_ARGS__)
>>
>> -#endif /* _I915_PCIIDS_H */
>> +/* PVC */
>> +#define INTEL_PVC_IDS(MACRO__, ...) \
>> +	MACRO__(0x0B69, ## __VA_ARGS__), \
>> +	MACRO__(0x0B6E, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD4, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD5, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD6, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD7, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD8, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD9, ## __VA_ARGS__), \
>> +	MACRO__(0x0BDA, ## __VA_ARGS__), \
>> +	MACRO__(0x0BDB, ## __VA_ARGS__), \
>> +	MACRO__(0x0BE0, ## __VA_ARGS__), \
>> +	MACRO__(0x0BE1, ## __VA_ARGS__), \
>> +	MACRO__(0x0BE5, ## __VA_ARGS__)
>> +
>> +/* LNL */
>> +#define INTEL_LNL_IDS(MACRO__, ...) \
>> +	MACRO__(0x6420, ## __VA_ARGS__), \
>> +	MACRO__(0x64A0, ## __VA_ARGS__), \
>> +	MACRO__(0x64B0, ## __VA_ARGS__)
>> +
>> +/* BMG */
>> +#define INTEL_BMG_IDS(MACRO__, ...) \
>> +	MACRO__(0xE202, ## __VA_ARGS__), \
>> +	MACRO__(0xE20B, ## __VA_ARGS__), \
>> +	MACRO__(0xE20C, ## __VA_ARGS__), \
>> +	MACRO__(0xE20D, ## __VA_ARGS__), \
>> +	MACRO__(0xE212, ## __VA_ARGS__)
>> +
>> +/* PTL */
>> +#define INTEL_PTL_IDS(MACRO__, ...) \
>> +	MACRO__(0xB080, ## __VA_ARGS__), \
>> +	MACRO__(0xB081, ## __VA_ARGS__), \
>> +	MACRO__(0xB082, ## __VA_ARGS__), \
>> +	MACRO__(0xB090, ## __VA_ARGS__), \
>> +	MACRO__(0xB091, ## __VA_ARGS__), \
>> +	MACRO__(0xB092, ## __VA_ARGS__), \
>> +	MACRO__(0xB0A0, ## __VA_ARGS__), \
>> +	MACRO__(0xB0A1, ## __VA_ARGS__), \
>> +	MACRO__(0xB0A2, ## __VA_ARGS__)
>> +
>> +#endif /* __PCIIDS_H__ */
>> diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
>> index 17abfa454..db614b732 100644
>> --- a/lib/xe/xe_oa.c
>> +++ b/lib/xe/xe_oa.c
>> @@ -21,9 +21,9 @@
>>  #include "intel_hwconfig_types.h"
>>  #include "ioctl_wrappers.h"
>>  #include "linux_scaffold.h"
>> +#include "pciids.h"
>>  #include "xe_ioctl.h"
>>  #include "xe_oa.h"
>> -#include "xe_pciids.h"
>>  #include "xe_query.h"
>>
>>  #include "xe_oa_metrics_tglgt1.h"
>> @@ -119,8 +119,8 @@ static bool
>>  is_acm_gt1(const struct intel_xe_perf_devinfo *devinfo)
>>  {
>>  	static const uint32_t devids[] = {
>> -		XE_DG2_G11_IDS(DEVID),
>> -		XE_ATS_M75_IDS(DEVID),
>> +		INTEL_DG2_G11_IDS(DEVID),
>> +		INTEL_ATS_M75_IDS(DEVID),
>>  	};
>>  	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>>  		if (devids[i] == devinfo->devid)
>> @@ -134,7 +134,7 @@ static bool
>>  is_acm_gt2(const struct intel_xe_perf_devinfo *devinfo)
>>  {
>>  	static const uint32_t devids[] = {
>> -		XE_DG2_G12_IDS(DEVID),
>> +		INTEL_DG2_G12_IDS(DEVID),
>>  	};
>>  	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>>  		if (devids[i] == devinfo->devid)
>> @@ -148,8 +148,8 @@ static bool
>>  is_acm_gt3(const struct intel_xe_perf_devinfo *devinfo)
>>  {
>>  	static const uint32_t devids[] = {
>> -		XE_DG2_G10_IDS(DEVID),
>> -		XE_ATS_M150_IDS(DEVID),
>> +		INTEL_DG2_G10_IDS(DEVID),
>> +		INTEL_ATS_M150_IDS(DEVID),
>>  	};
>>  	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>>  		if (devids[i] == devinfo->devid)
>> diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
>> deleted file mode 100644
>> index 73d972a8a..000000000
>> --- a/lib/xe_pciids.h
>> +++ /dev/null
>> @@ -1,218 +0,0 @@
>> -/* SPDX-License-Identifier: MIT */
>> -/*
>> - * Copyright © 2022 Intel Corporation
>> - */
>> -
>> -#ifndef _XE_PCIIDS_H_
>> -#define _XE_PCIIDS_H_
>> -
>> -/*
>> - * Lists below can be turned into initializers for a struct pci_device_id
>> - * by defining INTEL_VGA_DEVICE:
>> - *
>> - * #define INTEL_VGA_DEVICE(id, info) { \
>> - *	0x8086, id,			\
>> - *	~0, ~0,				\
>> - *	0x030000, 0xff0000,		\
>> - *	(unsigned long) info }
>> - *
>> - * And then calling like:
>> - *
>> - * XE_TGL_12_GT1_IDS(INTEL_VGA_DEVICE, ## __VA_ARGS__)
>> - *
>> - * To turn them into something else, just provide a different macro passed as
>> - * first argument.
>> - */
>> -
>> -/* TGL */
>> -#define XE_TGL_GT1_IDS(MACRO__, ...)		\
>> -	MACRO__(0x9A60, ## __VA_ARGS__),	\
>> -	MACRO__(0x9A68, ## __VA_ARGS__),	\
>> -	MACRO__(0x9A70, ## __VA_ARGS__)
>> -
>> -#define XE_TGL_GT2_IDS(MACRO__, ...)		\
>> -	MACRO__(0x9A40, ## __VA_ARGS__),	\
>> -	MACRO__(0x9A49, ## __VA_ARGS__),	\
>> -	MACRO__(0x9A59, ## __VA_ARGS__),	\
>> -	MACRO__(0x9A78, ## __VA_ARGS__),	\
>> -	MACRO__(0x9AC0, ## __VA_ARGS__),	\
>> -	MACRO__(0x9AC9, ## __VA_ARGS__),	\
>> -	MACRO__(0x9AD9, ## __VA_ARGS__),	\
>> -	MACRO__(0x9AF8, ## __VA_ARGS__)
>> -
>> -#define XE_TGL_IDS(MACRO__, ...)		\
>> -	XE_TGL_GT1_IDS(MACRO__, ## __VA_ARGS__),\
>> -	XE_TGL_GT2_IDS(MACRO__, ## __VA_ARGS__)
>> -
>> -/* RKL */
>> -#define XE_RKL_IDS(MACRO__, ...)		\
>> -	MACRO__(0x4C80, ## __VA_ARGS__),	\
>> -	MACRO__(0x4C8A, ## __VA_ARGS__),	\
>> -	MACRO__(0x4C8B, ## __VA_ARGS__),	\
>> -	MACRO__(0x4C8C, ## __VA_ARGS__),	\
>> -	MACRO__(0x4C90, ## __VA_ARGS__),	\
>> -	MACRO__(0x4C9A, ## __VA_ARGS__)
>> -
>> -/* DG1 */
>> -#define XE_DG1_IDS(MACRO__, ...)		\
>> -	MACRO__(0x4905, ## __VA_ARGS__),	\
>> -	MACRO__(0x4906, ## __VA_ARGS__),	\
>> -	MACRO__(0x4907, ## __VA_ARGS__),	\
>> -	MACRO__(0x4908, ## __VA_ARGS__),	\
>> -	MACRO__(0x4909, ## __VA_ARGS__)
>> -
>> -/* ADL-S */
>> -#define XE_ADLS_IDS(MACRO__, ...)		\
>> -	MACRO__(0x4680, ## __VA_ARGS__),	\
>> -	MACRO__(0x4682, ## __VA_ARGS__),	\
>> -	MACRO__(0x4688, ## __VA_ARGS__),	\
>> -	MACRO__(0x468A, ## __VA_ARGS__),	\
>> -	MACRO__(0x468B, ## __VA_ARGS__),	\
>> -	MACRO__(0x4690, ## __VA_ARGS__),	\
>> -	MACRO__(0x4692, ## __VA_ARGS__),	\
>> -	MACRO__(0x4693, ## __VA_ARGS__)
>> -
>> -/* ADL-P */
>> -#define XE_ADLP_IDS(MACRO__, ...)		\
>> -	MACRO__(0x46A0, ## __VA_ARGS__),	\
>> -	MACRO__(0x46A1, ## __VA_ARGS__),	\
>> -	MACRO__(0x46A2, ## __VA_ARGS__),	\
>> -	MACRO__(0x46A3, ## __VA_ARGS__),	\
>> -	MACRO__(0x46A6, ## __VA_ARGS__),	\
>> -	MACRO__(0x46A8, ## __VA_ARGS__),	\
>> -	MACRO__(0x46AA, ## __VA_ARGS__),	\
>> -	MACRO__(0x462A, ## __VA_ARGS__),	\
>> -	MACRO__(0x4626, ## __VA_ARGS__),	\
>> -	MACRO__(0x4628, ## __VA_ARGS__),	\
>> -	MACRO__(0x46B0, ## __VA_ARGS__),	\
>> -	MACRO__(0x46B1, ## __VA_ARGS__),	\
>> -	MACRO__(0x46B2, ## __VA_ARGS__),	\
>> -	MACRO__(0x46B3, ## __VA_ARGS__),	\
>> -	MACRO__(0x46C0, ## __VA_ARGS__),	\
>> -	MACRO__(0x46C1, ## __VA_ARGS__),	\
>> -	MACRO__(0x46C2, ## __VA_ARGS__),	\
>> -	MACRO__(0x46C3, ## __VA_ARGS__)
>> -
>> -/* ADL-N */
>> -#define XE_ADLN_IDS(MACRO__, ...)		\
>> -	MACRO__(0x46D0, ## __VA_ARGS__),	\
>> -	MACRO__(0x46D1, ## __VA_ARGS__),	\
>> -	MACRO__(0x46D2, ## __VA_ARGS__)
>> -
>> -/* RPL-S */
>> -#define XE_RPLS_IDS(MACRO__, ...)		\
>> -	MACRO__(0xA780, ## __VA_ARGS__),	\
>> -	MACRO__(0xA781, ## __VA_ARGS__),	\
>> -	MACRO__(0xA782, ## __VA_ARGS__),	\
>> -	MACRO__(0xA783, ## __VA_ARGS__),	\
>> -	MACRO__(0xA788, ## __VA_ARGS__),	\
>> -	MACRO__(0xA789, ## __VA_ARGS__),	\
>> -	MACRO__(0xA78A, ## __VA_ARGS__),	\
>> -	MACRO__(0xA78B, ## __VA_ARGS__)
>> -
>> -/* RPL-U */
>> -#define XE_RPLU_IDS(MACRO__, ...)		\
>> -	MACRO__(0xA721, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7A1, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7A9, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7AC, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7AD, ## __VA_ARGS__)
>> -
>> -/* RPL-P */
>> -#define XE_RPLP_IDS(MACRO__, ...)		\
>> -	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
>> -	MACRO__(0xA720, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7A0, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7A8, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7AA, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7AB, ## __VA_ARGS__)
>> -
>> -/* DG2 */
>> -#define XE_DG2_G10_IDS(MACRO__, ...)		\
>> -	MACRO__(0x5690, ## __VA_ARGS__),	\
>> -	MACRO__(0x5691, ## __VA_ARGS__),	\
>> -	MACRO__(0x5692, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A0, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A1, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A2, ## __VA_ARGS__),	\
>> -	MACRO__(0x56BE, ## __VA_ARGS__),	\
>> -	MACRO__(0x56BF, ## __VA_ARGS__)
>> -
>> -#define XE_DG2_G11_IDS(MACRO__, ...)		\
>> -	MACRO__(0x5693, ## __VA_ARGS__),	\
>> -	MACRO__(0x5694, ## __VA_ARGS__),	\
>> -	MACRO__(0x5695, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A5, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A6, ## __VA_ARGS__),	\
>> -	MACRO__(0x56B0, ## __VA_ARGS__),	\
>> -	MACRO__(0x56B1, ## __VA_ARGS__),	\
>> -	MACRO__(0x56BA, ## __VA_ARGS__),	\
>> -	MACRO__(0x56BB, ## __VA_ARGS__),	\
>> -	MACRO__(0x56BC, ## __VA_ARGS__),	\
>> -	MACRO__(0x56BD, ## __VA_ARGS__)
>> -
>> -#define XE_DG2_G12_IDS(MACRO__, ...)		\
>> -	MACRO__(0x5696, ## __VA_ARGS__),	\
>> -	MACRO__(0x5697, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A3, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A4, ## __VA_ARGS__),	\
>> -	MACRO__(0x56B2, ## __VA_ARGS__),	\
>> -	MACRO__(0x56B3, ## __VA_ARGS__)
>> -
>> -#define XE_DG2_IDS(MACRO__, ...)		\
>> -	XE_DG2_G10_IDS(MACRO__, ## __VA_ARGS__),\
>> -	XE_DG2_G11_IDS(MACRO__, ## __VA_ARGS__),\
>> -	XE_DG2_G12_IDS(MACRO__, ## __VA_ARGS__)
>> -
>> -#define XE_ATS_M150_IDS(MACRO__, ...)		\
>> -	MACRO__(0x56C0, ## __VA_ARGS__),	\
>> -	MACRO__(0x56C2, ## __VA_ARGS__)
>> -
>> -#define XE_ATS_M75_IDS(MACRO__, ...)		\
>> -	MACRO__(0x56C1, ## __VA_ARGS__)
>> -
>> -#define XE_ATS_M_IDS(MACRO__, ...)		\
>> -	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
>> -	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>> -
>> -/* MTL / ARL */
>> -#define XE_MTL_IDS(MACRO__, ...)		\
>> -	MACRO__(0x7D40, ## __VA_ARGS__),	\
>> -	MACRO__(0x7D41, ## __VA_ARGS__),	\
>> -	MACRO__(0x7D45, ## __VA_ARGS__),	\
>> -	MACRO__(0x7D51, ## __VA_ARGS__),        \
>> -	MACRO__(0x7D55, ## __VA_ARGS__),	\
>> -	MACRO__(0x7D60, ## __VA_ARGS__),	\
>> -	MACRO__(0x7D67, ## __VA_ARGS__),	\
>> -	MACRO__(0x7DD1, ## __VA_ARGS__),        \
>> -	MACRO__(0x7DD5, ## __VA_ARGS__)
>> -
>> -/* PVC */
>> -#define XE_PVC_IDS(MACRO__, ...)		\
>> -	MACRO__(0x0B69, ## __VA_ARGS__),	\
>> -	MACRO__(0x0B6E, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BD4, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BD5, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BD6, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BD7, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BD8, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BD9, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BDA, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BDB, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BE0, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BE1, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BE5, ## __VA_ARGS__)
>> -
>> -#define XE_LNL_IDS(MACRO__, ...) \
>> -	MACRO__(0x6420, ## __VA_ARGS__), \
>> -	MACRO__(0x64A0, ## __VA_ARGS__), \
>> -	MACRO__(0x64B0, ## __VA_ARGS__)
>> -
>> -#define XE_BMG_IDS(MACRO__, ...) \
>> -	MACRO__(0xE202, ## __VA_ARGS__), \
>> -	MACRO__(0xE20B, ## __VA_ARGS__), \
>> -	MACRO__(0xE20C, ## __VA_ARGS__), \
>> -	MACRO__(0xE20D, ## __VA_ARGS__), \
>> -	MACRO__(0xE212, ## __VA_ARGS__)
>> -
>> -#endif
>> --
>> 2.43.0
>>
