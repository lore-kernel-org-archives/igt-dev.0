Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9944C83F26
	for <igt-dev@archiver.kernel.org>; Wed, 30 Jul 2025 20:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D6410E6D6;
	Wed, 30 Jul 2025 20:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lv+9sfN8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB46410E231
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jul 2025 20:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753905982; x=1785441982;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VlP2sL93LRapuz5pr8+m58PhKsIMI24v+ICsNp+Z9Ag=;
 b=Lv+9sfN8/OwAoDNuj8Gt4ODe4jLMUsKauLpPEWpH3UGFUgf92Dc0kyZ3
 NVsGz7RBj68ZIMyj92EHvHifXU+KivgEr6/t26KokO5WrIU36d4H9KcD1
 PvHEjsP2HYxazRlzRQdmXg7PTuch3ZzX1uJlJBxeUczdjHlAFhTZB2sd3
 9yzdNFYD4AwkMjjoRUfRPZybqy2KrvMoPsAojsi/2krC97WXdRu3YbJTK
 co+AkyPo93MVadEH/h/vQraqa2ZTZAmFTB2H+d1Ma1w8OiKfVTr7Sp2WE
 TrwyXuIaiuBzzvwIO667vwwpYvTm83PnUR3VqlB3mza0auAYsTYp6+eEs w==;
X-CSE-ConnectionGUID: 0gbT2QFvSpWJXjXs9K5xHw==
X-CSE-MsgGUID: 05gd5hIOQkmTeNebDV0iwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="73678194"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="73678194"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:06:20 -0700
X-CSE-ConnectionGUID: qWuNDcWRRfiorcwzlbkQ/Q==
X-CSE-MsgGUID: pRZ29m8qQnCGFDIwZwug5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162787520"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:06:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 13:06:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 13:06:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 13:06:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5F8uJlcwfuxnJYcFb7hvYquaQREyXezE0khERrHxIA3a2GmjTJMlyApXFdvtrtz10i9GFtQPmRsgmVKvu7LTMlil5T59LxOQIoy3vRzAgofnJ6aYti4+0WNxZSH43LfGWS0RyqEXo91sDzVrXLgpH7JZG8O84oOfJ/L/utk25WKeIx8lkf7YpuaQG6i1zfB17LKfirVXMEDpiXu3oaAtkE+m6hI89JBSUF+9MSfch5PDyLwiSRkIdasyY654uSp8cMk7WORhdZl3XOV4oF2oAWy5y2wFW1MHhHCHGDkBWZb8GzQyC9mSKyagkEdKdo4dNLCWC3bDiz+Qxc4ntM9Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YA4VHdZb0PTI5+XQOp3EwF0JU18TrjQ86BpMQaJpQD0=;
 b=OjLLq9ET3kFLpgj8OcT+7jXgUv8V0/IX1tbdJ2yjE4YM0qfi8+lYW3Z2aMD65P2KreAwOnPGOYHAYq+Vwj3ylaTy+oXrQa1Ab017gF6QpiGHz6YJwQe5Ptu5c9+RdUQ/bMmVAujNs6f6rMuNEWqE7d+y9C+GAId+ezb0wZwvoB5JOdnjXuZUzzK/9dNgFQXghszOt2QoOGmroyAQv0iZ8JOIDiwh9z5NiWYrM8ReEuqKPIBFlWUz1vKErM9wgJKsnE9JYbU3yOGwsstBb9lvAgFgIoHmZ2Y334IEr8HhcmQ+owHJ09QBzlCC2ykMiq3U5zslzSod8JoO8GBX2JzcgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 20:06:00 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 20:06:00 +0000
Date: Wed, 30 Jul 2025 16:05:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, Alex Deucher
 <alexander.deucher@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, Riana Tauro
 <riana.tauro@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [RFC i-g-t v3 0/1] A tool to demonstrate use of netlink sockets
 to read RAS error counters
Message-ID: <aIp7I5OjRMx6MPmh@intel.com>
References: <20250730061342.1380217-1-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730061342.1380217-1-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:a03:100::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB4969:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6234e5-8da4-43a9-1398-08ddcfa480b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VKAld4vNKon1m7RwRNkQcW1uTTZ0sgdwn+UtFz+w2bStuMah9M9/CekgeIVd?=
 =?us-ascii?Q?qAPtDUAwliyuIErDekIPgNdBhVy44exl5nZFU+6gWgMYj552BnI2+vRNAm/P?=
 =?us-ascii?Q?V79Z7DVbYK0tmW1fFACBoUWNZeSDDzIdVJoNHxZwN9HdPRl0acqTROvkojZC?=
 =?us-ascii?Q?lWh3c85Cl14Sz5QL56au0yw6pVJ7xvlM44sC2dahGLWhJZIl5IOtLJE3gy7d?=
 =?us-ascii?Q?th0kMxGJ+NitepniNzJHtVafqfNT9g+ZG3bfe/gTyMd3la4ulcZV9yI3EDmi?=
 =?us-ascii?Q?fX07lpCxQBq0qxUgO4kUDeiOtWVNxv3c1wu/ZcQLwCkAlY1+n3onq1poy/py?=
 =?us-ascii?Q?WVsttFCwpBKS4iZrf4L1T0D+vTbPOOR4bR1SWqWQWAWx0GDF1mX/V4u9zCdX?=
 =?us-ascii?Q?faKPcHjSyumDtJ7knJ59WLTcHmCQHRFBOCyyvMdhEN5LIvuWqe7FE5VtSg4x?=
 =?us-ascii?Q?SP000Ug5GWPl3aA+hlLfnzT/ZqWjXr4nxG2sn5dnqi5YaeezsPUMXG4zfUmx?=
 =?us-ascii?Q?vduCIHl7HeU83y830UCigcjk2pYG5MGzBhUsm/Xev0DasIfUsYBcHk6kJ8cz?=
 =?us-ascii?Q?PYeMr/e9/M1V4oU2KxaQ2CYjqIpdjubwV+fNbjswUUwwKhQKj6l/UDAjglMr?=
 =?us-ascii?Q?Q55rWBP/4PYUxE2kwyrxHjRNvRJTHsbDDZLpg+lu95eC0oXV7pGaJyO9QNvt?=
 =?us-ascii?Q?gjIdPN9Fb3WScpT1M6YTeADIpgrBZQolZxSe2472U3rGfKkywawOZ6Tve0wt?=
 =?us-ascii?Q?9C3zs10fQgulb8VxXbN3zGtFNjTtLCUTOIG5wfiZEvXtbvOy+TxT/pzTm8G6?=
 =?us-ascii?Q?PEwg+Ht4YO33ySdpfkk1xRRBRwEcLW97ssZyC03v4tSd03NUYhQCPF/kO24r?=
 =?us-ascii?Q?2mss1e2mVVm6KvNL6DS3GNI3hG1BGpOvDePHaoznKiK0Mg4GzRujqx3Vz0st?=
 =?us-ascii?Q?fVosaY6SviNqBPBjj4vKxbhMAuAmlMa7PZ8qo7+bSItEGKOdoKRmrTF023HS?=
 =?us-ascii?Q?7mRRQxxp0FPL0oJHlnxRBfVvYwVVxjH8rJJksVcr1MvqB2wYIwD1VcaeODy7?=
 =?us-ascii?Q?vgUVSeawtEHJ9W6/sD7CfMv3vKF9U4U1z6P4xyX/sONcSAj/OeZGDjwPcqfY?=
 =?us-ascii?Q?pXj+L/i8fiyhRfdxxLq98UuBsbUr7YXaw2HBU2A3OtbyywPn7BCb/QTRNdSq?=
 =?us-ascii?Q?47iXoGLptZ/t2PSFcijqwpWzLRoUTqnms5JzPQsndFtARf6TqNtSxlup67c3?=
 =?us-ascii?Q?IiMVyt3sOxLD9iQ2Dc+HtFm9Yq19EXNxtF3yAr9GMUGKs3AnibepPHHINyYT?=
 =?us-ascii?Q?OMbpkhPWZAecq0eCnub8HFWafkOYwphHcSu20Md7F14CG9Azcd9E5yz1Njp5?=
 =?us-ascii?Q?GVo4E4YSGEdcFOiR6icBcurQbqNgp7BJEQXNWyjIchPzgCY3iN9IytyGYDXi?=
 =?us-ascii?Q?0gGUIhb4eRE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t67kRhCHL2YBllD7/ggCTZvJpve9u/IKi+zvKJ/EegeMIq8eyyfuRPu+AiZ1?=
 =?us-ascii?Q?hb9jSzlqZxZSIouwL2UCmiF2fcI/wP4/V10HQBxVHAeWyZAmtDUUpfhaKxW1?=
 =?us-ascii?Q?eJmpd57NxP1HU3Zyspk2uBlGEDRbnlbTST6yij7n3nV+dekVSYcsIvF26dL8?=
 =?us-ascii?Q?FbTmJBA0Xaa2iGTzjKRf/MGgUWu5HtjRauFnArCeCCCUk042wKv5dqsZn/R5?=
 =?us-ascii?Q?/rK6JbcMtEWjPe6zD3s6Zl3wKkZXxF/4f/K7e6w4dJrEcRVSadxQwfhIgEbV?=
 =?us-ascii?Q?6soC6cPWKvzLszXtr/X8QzY9NGFOsvM0Dw/MyB6FWKmMEjeVWtC5LhQ5dB6M?=
 =?us-ascii?Q?IxyUAtpELHhaumiJmYuDWwznK0f1gC3SH7xSUkAyRLA2SNXIeA3k0LdeN3QI?=
 =?us-ascii?Q?QIN+Z7ToJl4Iq/Glh5UDs3l8MlD41WPembPShG9YOm42ufAz8k1VQa7eO1mO?=
 =?us-ascii?Q?nVs3zG26ipiC0oVKzTQcM8JDndgPqbRIuPv+OIzFCizfRQLLE9wZpJr/F0YM?=
 =?us-ascii?Q?zsuza8q7qi7VldjpX9RjfD9cluvxLmmY20o0WFqItnxuUmV2J4g9oC32vbVZ?=
 =?us-ascii?Q?r63vj3WeNXFqxj01Uoh6pXJSY5fgQEwgP9MjBz1bweAOpIbJbHHuNYpZe8Dv?=
 =?us-ascii?Q?gpnnuIZ4Dz+CmxflXLEiHC4rf2m+/rSfHIYPDjNWOcOgRZenVhYmdQYIeMtT?=
 =?us-ascii?Q?QDTAeFj15Sy5v5Oe4rB74DiAs1RD7PSoBwRUJvey+qnWKKKIVMQ2TRFL5eLk?=
 =?us-ascii?Q?WAXXlsrcmq/dbF5btOz5zQrZ1GJ1ZiHEt5NmdKrekhgZdRO9Bw77Fd2EMbLy?=
 =?us-ascii?Q?eXvzxojOmEhAngwjh0L9uNHnuniflRJ2cWvVVL4L5smt4fBV03FRL1Ae+RSy?=
 =?us-ascii?Q?OmdkUBXLFx38shLp9zk4sKShWxewuhyCVWkIk5a8t4wN6Mdulhb7eQrw1dB7?=
 =?us-ascii?Q?lrm6/A1VKaWS07PKVGok/3S0I/Wj6zrW4fi9FA1yFMBsb+D+gZXdHnI61aYk?=
 =?us-ascii?Q?YdMrwzJ6BcKEvWg+o1Znp3vYM55k3037iBBzG6ZkptiHhyEk/mwSQ8NPAeKo?=
 =?us-ascii?Q?2CqgaS3y/MT/TW9NI1QPpXcUpJufABiVMftz/eW8eS9i8fTB1/UynE6pWRbY?=
 =?us-ascii?Q?j7PHPHbRBoQOpHwV4t0Fmc2aBtNIud+gdimIWWRTo1eP3WKSO0b4G2KtOC5b?=
 =?us-ascii?Q?9ZQlmWiGkfQl2AsWAk8YfE4rR5Y5VztvdjoBmrNAMAiCr4JYEI/4kUcByR0j?=
 =?us-ascii?Q?dyy/d2N8l00vVDrWoiRMAIiI9tj1yEeRPvX3Pb6GsQQy3F9Pewu6/N7rn9h6?=
 =?us-ascii?Q?vidqXvUe1ZSIWtq+Y4Ey2LsVTW3h7SGF2BGnI7F82ydimGbhEpT+lVwrOnMz?=
 =?us-ascii?Q?sKGMNvn+MnGpeUBAkmXBjflgbJLeNJ+q1GkiMuGT47HVfFqMOTiS0D9XCXk5?=
 =?us-ascii?Q?cCc7qrttEW+UoWAf/qikx7I+Kfv6/5Lswhk7c0YrHH7557NBujtvIR/arr/b?=
 =?us-ascii?Q?mljpEyWejlh4A1ZldsNBUiXieyszH4w6l8JI5DiAKboZJWZJ+TB5zLFMoiRm?=
 =?us-ascii?Q?MLZCSGAn+xW8xGBo8lnJiOqLWuHvVczHU+Pg/TJPGfS8KbbV+p5JlrCPFVmI?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6234e5-8da4-43a9-1398-08ddcfa480b0
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 20:05:59.9358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPzOCYfBBjm0syf+TL6f5rlDonn06mwAmeqLl+z3aZ/43L/rtO7WXbcTwa51bjUY6eGF4fViIDdfYZEDCtQIwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
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

On Wed, Jul 30, 2025 at 11:43:41AM +0530, Aravind Iddamsetty wrote:
> This tool is to demonstrate the use of netlink sockets to read RAS error
> counters, which is being proposed via series

Alex, what tools are in use for RAS on AMD side?
I noticed something in the mesa repo recently. But perhaps you have other
high level tools as well?

I'm wondering if we should we try consolidate in this tool here in IGT
as some official one to drive the RAS netlink APIs in a unified way? Besides
converting any other tool to this API of course.

> "[RFC v5 0/5] Proposal to use netlink for RAS and Telemetry across drm subsystem".
> 
> v2: update uapi header.
> v3: Add DRM_RAS_CMD_READ_BLOCK command to read errors from an IP Block.
> 
> The tool supports the following commands:
> READ_ONE, READ_BLOCK, READ_ALL, WAIT_ON_EVENT, LIST_ERRORS
> 
> read single error counter:
> 
> $ ./drm_ras READ_ONE --device=drm:/dev/dri/card1 --error_id=0x0000000000000005
> counter value 0
> 
> read all error counters:
> 
> $ ./drm_ras READ_ALL --device=drm:/dev/dri/card1
> name                                                    config-id               counter
> 
> error-gt0-correctable-guc                               0x0000000000000001      0
> error-gt0-correctable-slm                               0x0000000000000003      0
> error-gt0-correctable-eu-ic                             0x0000000000000004      0
> error-gt0-correctable-eu-grf                            0x0000000000000005      0
> error-gt0-fatal-guc                                     0x0000000000000009      0
> error-gt0-fatal-slm                                     0x000000000000000d      0
> error-gt0-fatal-eu-grf                                  0x000000000000000f      0
> error-gt0-fatal-fpu                                     0x0000000000000010      0
> error-gt0-fatal-tlb                                     0x0000000000000011      0
> error-gt0-fatal-l3-fabric                               0x0000000000000012      0
> error-gt0-correctable-subslice                          0x0000000000000013      0
> error-gt0-correctable-l3bank                            0x0000000000000014      0
> error-gt0-fatal-subslice                                0x0000000000000015      0
> error-gt0-fatal-l3bank                                  0x0000000000000016      0
> error-gt0-sgunit-correctable                            0x0000000000000017      0
> error-gt0-sgunit-nonfatal                               0x0000000000000018      0
> error-gt0-sgunit-fatal                                  0x0000000000000019      0
> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a      0
> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b      0
> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c      0
> error-gt0-soc-fatal-punit                               0x000000000000001d      0
> error-gt0-soc-fatal-psf-0                               0x000000000000001e      0
> error-gt0-soc-fatal-psf-1                               0x000000000000001f      0
> error-gt0-soc-fatal-psf-2                               0x0000000000000020      0
> error-gt0-soc-fatal-cd0                                 0x0000000000000021      0
> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022      0
> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023      0
> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024      0
> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025      0
> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026      0
> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027      0
> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028      0
> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029      0
> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a      0
> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b      0
> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c      0
> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d      0
> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e      0
> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f      0
> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030      0
> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031      0
> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032      0
> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033      0
> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034      0
> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035      0
> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036      0
> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037      0
> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038      0
> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039      0
> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a      0
> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b      0
> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c      0
> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d      0
> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e      0
> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f      0
> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040      0
> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041      0
> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042      0
> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043      0
> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044      0
> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045      0
> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046      0
> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047      0
> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048      0
> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049      0
> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a      0
> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b      0
> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c      0
> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d      0
> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e      0
> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f      0
> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050      0
> error-gt1-correctable-guc                               0x1000000000000001      0
> error-gt1-correctable-slm                               0x1000000000000003      0
> error-gt1-correctable-eu-ic                             0x1000000000000004      0
> error-gt1-correctable-eu-grf                            0x1000000000000005      0
> error-gt1-fatal-guc                                     0x1000000000000009      0
> error-gt1-fatal-slm                                     0x100000000000000d      0
> error-gt1-fatal-eu-grf                                  0x100000000000000f      0
> error-gt1-fatal-fpu                                     0x1000000000000010      0
> error-gt1-fatal-tlb                                     0x1000000000000011      0
> error-gt1-fatal-l3-fabric                               0x1000000000000012      0
> error-gt1-correctable-subslice                          0x1000000000000013      0
> error-gt1-correctable-l3bank                            0x1000000000000014      0
> error-gt1-fatal-subslice                                0x1000000000000015      0
> error-gt1-fatal-l3bank                                  0x1000000000000016      0
> error-gt1-sgunit-correctable                            0x1000000000000017      0
> error-gt1-sgunit-nonfatal                               0x1000000000000018      0
> error-gt1-sgunit-fatal                                  0x1000000000000019      0
> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a      0
> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b      0
> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c      0
> error-gt1-soc-fatal-punit                               0x100000000000001d      0
> error-gt1-soc-fatal-psf-0                               0x100000000000001e      0
> error-gt1-soc-fatal-psf-1                               0x100000000000001f      0
> error-gt1-soc-fatal-psf-2                               0x1000000000000020      0
> error-gt1-soc-fatal-cd0                                 0x1000000000000021      0
> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022      0
> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023      0
> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024      0
> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025      0
> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026      0
> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027      0
> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028      0
> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029      0
> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a      0
> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b      0
> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c      0
> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d      0
> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e      0
> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f      0
> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030      0
> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031      0
> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032      0
> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033      0
> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034      0
> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035      0
> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036      0
> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037      0
> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038      0
> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039      0
> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a      0
> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b      0
> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c      0
> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d      0
> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e      0
> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f      0
> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040      0
> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041      0
> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042      0
> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043      0
> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044      0
> 
> wait on a error event:
> 
> $ ./drm_ras WAIT_ON_EVENT --device=drm:/dev/dri/card1
> waiting for error event
> error event received
> counter value 0
> 
> list all errors:
> 
> $ ./drm_ras LIST_ERRORS --device=drm:/dev/dri/card1
> name                                                    config-id
> 
> error-gt0-correctable-guc                               0x0000000000000001
> error-gt0-correctable-slm                               0x0000000000000003
> error-gt0-correctable-eu-ic                             0x0000000000000004
> error-gt0-correctable-eu-grf                            0x0000000000000005
> error-gt0-fatal-guc                                     0x0000000000000009
> error-gt0-fatal-slm                                     0x000000000000000d
> error-gt0-fatal-eu-grf                                  0x000000000000000f
> error-gt0-fatal-fpu                                     0x0000000000000010
> error-gt0-fatal-tlb                                     0x0000000000000011
> error-gt0-fatal-l3-fabric                               0x0000000000000012
> error-gt0-correctable-subslice                          0x0000000000000013
> error-gt0-correctable-l3bank                            0x0000000000000014
> error-gt0-fatal-subslice                                0x0000000000000015
> error-gt0-fatal-l3bank                                  0x0000000000000016
> error-gt0-sgunit-correctable                            0x0000000000000017
> error-gt0-sgunit-nonfatal                               0x0000000000000018
> error-gt0-sgunit-fatal                                  0x0000000000000019
> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a
> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b
> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c
> error-gt0-soc-fatal-punit                               0x000000000000001d
> error-gt0-soc-fatal-psf-0                               0x000000000000001e
> error-gt0-soc-fatal-psf-1                               0x000000000000001f
> error-gt0-soc-fatal-psf-2                               0x0000000000000020
> error-gt0-soc-fatal-cd0                                 0x0000000000000021
> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022
> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023
> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024
> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025
> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026
> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027
> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028
> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029
> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a
> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b
> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c
> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d
> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e
> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f
> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030
> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031
> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032
> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033
> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034
> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035
> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036
> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037
> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038
> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039
> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a
> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b
> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c
> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d
> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e
> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f
> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040
> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041
> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042
> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043
> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044
> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045
> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046
> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047
> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048
> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049
> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a
> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b
> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c
> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d
> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e
> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f
> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050
> error-gt1-correctable-guc                               0x1000000000000001
> error-gt1-correctable-slm                               0x1000000000000003
> error-gt1-correctable-eu-ic                             0x1000000000000004
> error-gt1-correctable-eu-grf                            0x1000000000000005
> error-gt1-fatal-guc                                     0x1000000000000009
> error-gt1-fatal-slm                                     0x100000000000000d
> error-gt1-fatal-eu-grf                                  0x100000000000000f
> error-gt1-fatal-fpu                                     0x1000000000000010
> error-gt1-fatal-tlb                                     0x1000000000000011
> error-gt1-fatal-l3-fabric                               0x1000000000000012
> error-gt1-correctable-subslice                          0x1000000000000013
> error-gt1-correctable-l3bank                            0x1000000000000014
> error-gt1-fatal-subslice                                0x1000000000000015
> error-gt1-fatal-l3bank                                  0x1000000000000016
> error-gt1-sgunit-correctable                            0x1000000000000017
> error-gt1-sgunit-nonfatal                               0x1000000000000018
> error-gt1-sgunit-fatal                                  0x1000000000000019
> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a
> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b
> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c
> error-gt1-soc-fatal-punit                               0x100000000000001d
> error-gt1-soc-fatal-psf-0                               0x100000000000001e
> error-gt1-soc-fatal-psf-1                               0x100000000000001f
> error-gt1-soc-fatal-psf-2                               0x1000000000000020
> error-gt1-soc-fatal-cd0                                 0x1000000000000021
> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022
> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023
> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024
> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025
> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026
> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027
> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028
> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029
> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a
> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b
> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c
> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d
> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e
> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f
> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030
> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031
> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032
> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033
> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034
> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035
> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036
> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037
> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038
> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039
> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a
> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b
> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c
> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d
> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e
> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f
> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040
> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041
> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042
> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043
> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> 
> Aravind Iddamsetty (1):
>   tools/RAS: A tool to read error counters
> 
>  include/drm-uapi/drm_netlink.h | 105 ++++++++
>  meson.build                    |   4 +
>  tools/drm_ras.c                | 428 +++++++++++++++++++++++++++++++++
>  tools/meson.build              |   5 +
>  4 files changed, 542 insertions(+)
>  create mode 100644 include/drm-uapi/drm_netlink.h
>  create mode 100644 tools/drm_ras.c
> 
> -- 
> 2.25.1
> 
