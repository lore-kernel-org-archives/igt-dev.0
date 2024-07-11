Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8853C3DA41
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 12:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E90410EA42;
	Thu, 11 Jul 2024 12:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnoOnfNm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C67410EA42
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 12:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720699429; x=1752235429;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=czS5j7yGTfxaxpw032mjR8mpIvhrJIXlK8L4d0aZ9v4=;
 b=RnoOnfNmtJBdyl6ZL9lVk1XQRFq+FI8pkxHWVy9L1z/OHAXtFNwGyaYj
 jjfxN9E/RPx6FGd2zf+Jzx8uZ99DGqK2r3G2nQYjZjMMtQNbkxCTXm+e4
 mxsfsD6xXmYoAUkmi4Ii++t5PwtFQfuHpuE5Db99b0FkFQGWa12VM4onz
 OIPenoKhdMJmHHIYu6x+rHPQoRlvfdC/9si0XJ2pPgNJuwlo47PhtCHTH
 48t7bnoK2CYg//cXjM94oVSMrLrRpUp+Nwhr8RxLU+vHv9jMk2gp1s9V9
 gpMFgwr/A2s1IMBSB3OGsrYSy5DMjnY4yFADj65xDx4V9o/0jkLVdrQ5P g==;
X-CSE-ConnectionGUID: zAom9k6mQ1y30vU2Irb//Q==
X-CSE-MsgGUID: BNL68SrpS+eceC5Oar/CdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="43491862"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="43491862"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 05:03:48 -0700
X-CSE-ConnectionGUID: 2m/cwN2YTqqbSwJRnxZemQ==
X-CSE-MsgGUID: 9t2vg6VcRI6o/QTEIYniNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="86034552"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 05:03:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 05:03:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 05:03:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 05:03:47 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 05:03:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkP2sfGrWHQM+tiw5eZw20nleS/rTe2wwa8QUH73cEIoC450QtqKRr7F/ryq1dsIoa2C1CQ1Z4duz+/Lipd73wuGPhH/QkWqd16wxzv81OpvS68q/EhHdUi74SgwDXvygUKVOo3y4hvNWNEVvKgwiI+dLGBqesjgFhX1pU3X3yRVRje1djalaLxSSxVgot2tovfOgXhwBaKC5IM6rnflEA9FN1LMBviuLUlOMny7MgEYs5V2nioG3go4F9jJXuErDqkawQWRYGMtoGHvHgBAipwBsA5+3z/aSV0JqZrYaAKaZpFOPhuRsMQg4QxGCaaTBKK++7PV5HMFFBH9o5v14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czS5j7yGTfxaxpw032mjR8mpIvhrJIXlK8L4d0aZ9v4=;
 b=aayB3oFIZlYpy8Ybu58JX+R/apj7BAH89jm+V4lNcm0YVUCQ216iREO4IuqSNA66FcUc4dM/4XxgfgBpi102/GekmAh4Z5uT6Eao7BfJxTKYReqwLWI7dFGxb5VfDVTFB9pw6ScjRE0ssLXI5VBprOxI2bUjr4NliBflgQMbcmqS/MKPh8aCJkACuddr33wA20F7JRw0mppZNgt5mhdjOH8DwoO6a9UcsIUrhLXiIEoBNCFAdSrrvPTxjPhpe0JDxBlJ/ro/1kMuIIavOzN8fdEMj/oCQtX7qh7E17q/xGiMsQnDgW6Oz70ZgRwFKZkQ04ZMBh/nen5SIkkKROFqHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7970.namprd11.prod.outlook.com (2603:10b6:8:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 12:03:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 12:03:41 +0000
Date: Thu, 11 Jul 2024 07:03:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 02/10] tests/intel/xe_drm_fdinfo: Add
 basic-engine-utilization test
Message-ID: <skfjguwghaw23jlx3p36sqlc4hpkkz5qfbum4gaeylhw4rvoi4@j45lylpuhjam>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-3-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240703002532.3156277-3-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 883767c0-8eb1-4804-17ae-08dca1a1817a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LIewNaRDAvm47mfDgSH9RbM7xj/VVm/tPXwzM7wbljvD6dtxZG7tOJ2vjiCG?=
 =?us-ascii?Q?U8MstS7SsvcqVIOSEFhcNU3gjl5r7BKl9BswG9C/uXIavWv7YoGs5BBLnfvS?=
 =?us-ascii?Q?DWB2j5iSZbd2vOQ20CEA3NcvMqx4HdgW1O+5q6nxhYQoEG+YP6AOiTs9yYVX?=
 =?us-ascii?Q?IVJiaR4f1CaIobu+mrH/wLyI8fdHVzpu8wDPS9U/VEc7tfqoX6Pm5DuQyFo5?=
 =?us-ascii?Q?0AnIAnJtOJFmyelhutkZMeUIBpNIwKFH+gDUpSIxJZDLiZ6sARgWkw0z84tS?=
 =?us-ascii?Q?Yd54gq5haTfCJO15P4bVPpX0ie4zFuvS8+n8JK9M2pT5Vql/jEZfasOpbPsJ?=
 =?us-ascii?Q?wEeEeFCFLGrEtfxGtAX/Xov8TylhcS+Zn19kRcrlpP+hJ6kZo+bNtjsmENqV?=
 =?us-ascii?Q?pbO5FMjzCrQci6SGZoaZFCXDLg+UfceEgAn3imSwVdBw32eN123kHP9x+O+r?=
 =?us-ascii?Q?UIvSW0vgIDfVZ0G788EGDSg/IbF+uPhMZJYZBUYH02hhgpeRm2NR054h4Huy?=
 =?us-ascii?Q?cL3jCvhdtKQs8gBiHELCa0TDfbaOUYA65rhmUNMFJ2DVZVevt2aWDof3/6vZ?=
 =?us-ascii?Q?3A/AWvywRjLMjq/4305oC12GMspL/rkxZleeOUB42Kqr3ppZ8p5/Foc4/9gk?=
 =?us-ascii?Q?t8b0r9TKlJOufL0bKTpbdiij0IfVvSVFL/YWpb3fUX/5vFe7TfRysfh9VP0V?=
 =?us-ascii?Q?oqZx5VuQpxmhdgSjTVeFQI0zQZzuMuu891rV2IikvoVecH42okF0eSNlMvMk?=
 =?us-ascii?Q?6ATygr3rGDx6iz58vqCLSayFZJHmEEFmgJr9MCnpWgN4Ot9zDTcsUsf5bcT+?=
 =?us-ascii?Q?0HpVLC4v+cGZbDUmYAcHdlpMxhXaxDmjuA5fug14QwO5+icPHcTJFCui6KaG?=
 =?us-ascii?Q?LlPCj/Cckul99K+vjSqUK3ecH9GO9H6KVUkxM3XobnigykmH6Br/RB9FZgBO?=
 =?us-ascii?Q?PnUhrRhobYUEf0FQ+xP+QF7K0JqBLdwLGjHhfWVxgjZjCIlKEJ1/wL9seeuc?=
 =?us-ascii?Q?lSIqhD3C9+9FtJ0CjR6fpsfkHXdrZ3gQtxLQZ2kC0jGpADhrkewgW+VvW6P1?=
 =?us-ascii?Q?oDxO5C/hUNe1eAlCj7SRVTbUVLQ/8Rqkja9ynClCQOv1A0/oApnheAC4w1V5?=
 =?us-ascii?Q?qANaXR26lvJuA3YccO36334SWVpNtksMKqQOLaCnqa1GsfaztsmcwOdoz/f6?=
 =?us-ascii?Q?tmUaN1mBy1J6FJIN5zPukx46p6EQ4tFstxdhliqkdZEOQYMR1/tt/lCYclVb?=
 =?us-ascii?Q?wtbwHMEeF5ybigbnyuXqM9n4APeVd6GNHSf9TyY8nV1uDF3ZNkdKm0HD9O14?=
 =?us-ascii?Q?uRkVkXeKVhIHmclqOeyhYIr7PoKhDXaPmCqZ0MbKTiHiew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nDq3+RoAtFS7TY3TWnFN4XUYO5D83DT+u/vWPNnAYKjAkin4TppQ2DSRZtjg?=
 =?us-ascii?Q?ZAvHb00Kd/T9iugwDqcnqrTosh1WgqE78WPg7zKjtwlLjXOx9Hr7TLf4or/C?=
 =?us-ascii?Q?vApwLUVwsUhui9Nm56oRhnkU8rU+HUYxHeFRKTjQYdAO8nrxUzTSJS0pWWRy?=
 =?us-ascii?Q?msDV4fltTVABl5rkh/zeFbJL7qSbrRL9PmLTBv/KZhmjE2F5/m4yadurP/Zx?=
 =?us-ascii?Q?s5w2zr6Bgw1rXm8sbHEhXRq2eMtiy6kT4n2u0PhEbZSt/gUvY0EDZxep3FtL?=
 =?us-ascii?Q?mpDbt1TcgOfnjQ4xqbI/ORpVbT2hNruCqMKyWwKDXtL0QcXVDwBgBqV2B8Ry?=
 =?us-ascii?Q?S5dnXwSciezOpcnrdcWsH5ECciPDrOuHKgfADc0gLUQvnCYFbmRjlY0sQc46?=
 =?us-ascii?Q?BEZNP25WWXGmO0IzP4nbQnGEL1AgVXVq/h53yPuX68zJh5HMyxyZqAOfonmm?=
 =?us-ascii?Q?TBGxsfvx/qdDf6y857mc8TY19ZUtlHfgqT8M3jQOiu3h2FG1PZZvNXs9iezK?=
 =?us-ascii?Q?uXUu2F/8q2qk08YK+f+GDWxBs91qU1BaUvxDZlzcbdwY6oqqdOx8POwy9isr?=
 =?us-ascii?Q?IEvA9viNpVgZDYp+L5ag6uyICv768UxJ0zhLDeAf/OAftvcU4WefCEWbX4jP?=
 =?us-ascii?Q?De3sTSqFwMQPfS8jHgiYC4dnSdwAHzKppZnts6g6FSmDw7eRvNXto+A180pp?=
 =?us-ascii?Q?j0DR2REuTLcJpYkPbT9xJOTZUthl+3sn26SNbdQlL0qMep2IZxULp+BxIbZC?=
 =?us-ascii?Q?+mrY/1jtxpo1BGSfik8u70iI7sxqxI4yr/Q+QvF8OeoGbY4cTMvEpd1ibspt?=
 =?us-ascii?Q?ZfuwgRaZ0EfLmhELuOkRvJl0nT1K/9ovIPkQW79F+o6vldqtQaPM6kTVS4V/?=
 =?us-ascii?Q?qkFy0V58zgZVgwbdfYmThmpEZIu3oHwgaNnlMF3paGHn43BKJUzvm2/wEtcw?=
 =?us-ascii?Q?21LPqmNwzU+O3IueivKBNWqgKAKGGNmtd2JJNjDv6BUuKTXYOiw9dFOs1847?=
 =?us-ascii?Q?dtEa56gUlagzve4cUhmuFrgPj10DupJARc5ess42JQr1/Q7x58pfz713IpA9?=
 =?us-ascii?Q?QPRTpSqoPoC78No8XypPZzw6eCtOXLmtW/GIVRfsPwDxcD0rFK2+l1uM3o7M?=
 =?us-ascii?Q?0mRDbHsp4rU8v2pj/7wGX66op8gNEAHMbkQebuHtKfNNCIfwX4l0ZIjiihyV?=
 =?us-ascii?Q?rx8UlIzkLp/zEBavnQAAwvjfZc5ZXAOMZcJvGHyy7AsViq4s1bw0UFUYlsDs?=
 =?us-ascii?Q?LNIOoH3J4OI4i6x3pWlaiCIjMeABj6bIlJH4H/SkMbsxDPy5Qh+Fv5AxVF95?=
 =?us-ascii?Q?sQY3jnSWX+5bE9pvUx1OrkFSPlV9O54FHvH01NLdtz127RULOZa5iYDycQM+?=
 =?us-ascii?Q?5UitX24DYTUahXlU1NYhk0Sb2fLoiPBwKMA/WyUMmu5InYS7AA/0xUo90Sg8?=
 =?us-ascii?Q?3XsZKrHQsWB/W47Q1418veNhTGEtVrD6HtnSHZEPIi/4h7xteddIhZFD8YM0?=
 =?us-ascii?Q?7qISbHFlpi21FkNee2uhF+AOKvCOGCbm17BLnxLdnjaiSyGkyxkumX3bl3/P?=
 =?us-ascii?Q?4/CDyGeQ6nIUKY8YsXQNGsBLCGCGDalJDClH2t8UGJfxJhV0VYVkSUiMKnXk?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 883767c0-8eb1-4804-17ae-08dca1a1817a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 12:03:41.4685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jN5uOv1ixv3DzA8LFMo225QMRmaLGr9M23b2FTcfW/wF5lVMdTYrxEwIWD66Em4qw4+w/NcBn5ObYocGDAnoeMhjIwYXfJ+p2d4FE6B0kbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7970
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

On Tue, Jul 02, 2024 at 05:25:24PM GMT, Umesh Nerlige Ramappa wrote:
>Add the basic test for engine utilization.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
