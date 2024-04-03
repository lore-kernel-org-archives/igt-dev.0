Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E042CCD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 20:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D5811287B;
	Wed,  3 Apr 2024 20:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJwqIVYi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A2C11287B
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 20:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712177208; x=1743713208;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=preA3YM/aBEzP2+5UMWorTFF0MUNiCaD2+GhzBpZwE0=;
 b=eJwqIVYik8sJKsM9NzD+VL62WU5H64r0EctIHLCh01L2Wf3cRpzVOa1t
 DTJrW53DMgjxv2KgkalhQehbeoPUXKn/xb6FF7+66yEgTmsqeqRfR0PQU
 xB57deHxn4R2HfuegFWhbT5nMawTRdxDbh1BC2ztv4zsPcoL1M4a4CFrC
 UfD+htxAP0lLBWIRuiQqBpV6QiW+nT/Zi/1HzH3fqfM+rzrKwiJr8Y0Ux
 v2kgyKl4Ws5LcEl+FbdJWcufJCTxbSn+DlzrZ9gv9MOxWOVzkbHfjMg3N
 ZWmFp1RuFQJFRsODZ2W+O/8fNT5YZsBW/boSGEI058S6Atvwha2hjc0Ne Q==;
X-CSE-ConnectionGUID: 8CSa+h83QSKZSZN8M4asXQ==
X-CSE-MsgGUID: /1cSTnGeSViKte/oBOWreg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18169466"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18169466"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 13:46:47 -0700
X-CSE-ConnectionGUID: oJLFoKHaSKOgnl8fYV0fXA==
X-CSE-MsgGUID: YZItvefHTB6EC/SjgMNOeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="19167592"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 13:46:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 13:46:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 13:46:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 13:46:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaLj+jleceYqh9Gw3qCUPnWOv5Lzii0ruXSL1LgZJYNP87vJWKSXt0ZnV8+7eJg0vxw5ZjlsDI9idiKIwvcMSr1MyFOkDrQKVTkNj7VtPWVipArZB2Ag9cp34x3kwFCTnbhLacu02dz7S5eSjQoyXDWlhnU0sBBjJV6KMqHwoQARQLZzxukm6sPsOzOXhOv9NEJ8B7QQZYFCAhtShULNvu5YBfg+qiB1EKwlhtxNch/126Kwt38ewUX0ttcR1uZjQF21EjG979pehgJHCHC67jE3DGvFxr1nNxaSoKbtai8Ce510vmijtxsfcQSzAYh5BUVmXARAiheEZ1pq1UXkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yl/sJIpraVzuKG3J8MlvpYHq3DoV/qOqiTjzBZ25sHY=;
 b=Qoh65o+aZHOd9p8i+PdWJjDpFA93GkGK8mnAbG0Odxh8bTb9w0ksQEVWwBywZO4JtDFk4wAmb71AHn/nyPzp9a+geHHFZ2ft9IEFyNLwmoC4IsSOZChiA0b76OhXHId7o3ZOGnOfrC7mH+hDH9emnKOcrmaWO11pL7CwzBx0/6LHqmAROiWk9VIqOe+QIxxw0jt7ZIt+357anOMK9HxvbRU9NUO5EeusLWQZjTB2IOKm7nYbdcRhzmjCUfcsUnHH1TogZSk9erQHZQqGO0TsBTS9/iedRCwEbedmn8NB2OOc9gXh+zZOAwP5jPpyl7nSzZac5sWvSE8h9vjWJX3g8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7737.namprd11.prod.outlook.com (2603:10b6:8:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 20:46:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 20:46:44 +0000
Date: Wed, 3 Apr 2024 15:46:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
CC: <tursulin@ursulin.net>, <daniel@ffwll.ch>,
 <boris.brezillon@collabora.com>, <kamil.konieczny@linux.intel.com>,
 <zbigniew.kempczynski@intel.com>, <igt-dev@lists.freedesktop.org>,
 <healych@amazon.com>, <kernel@collabora.com>
Subject: Re: [PATCH v2 2/2] tools/gputop: toggle sysfs profiling knob if
 available for device
Message-ID: <xc4vz6uq4llsexgwurudl3jtv6bke3b4vsqnqgvvhs3gtkd6ay@5glimn77s3dq>
References: <20240402222813.277470-1-adrian.larumbe@collabora.com>
 <20240402222813.277470-3-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240402222813.277470-3-adrian.larumbe@collabora.com>
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7737:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V8RDNMzlKlEENv5VfOsU8jXQNvTojZaX2ar/WG609VsH3jdiuNFFgjzJOqNQgRlYS/alH3tGQbjwWb9oCN5JQvMbg90Y5VXQaih8ibnRi76telKKc29uKenEeqOVVSrIEGq+M/UZNypS/cD4avJIajZ/472ZtyaMpgHB62p+zP4nKWPvDQFVtel7PddQFNqNKMZAX/9NB+idhG86eL/9cQawGzE6FSuDyRcDzvSgZvYtJLbBa5YuPoaAR6PwO4zoMGUw8WhwXPuV8nY1zqN2YVP0kg5C269Qixz5bCovTfJF7WcmP4lghxOHbOUrQR2iafD5aIG+rhJL/LDHXjYgIr/UY2h172B6MqkKgBJDAu/Fg10gxfU7n1uYa9nHGteElAY7V8OmXiNeOu0iS40as2zHhx11ByDFESQCwRuz+oMh1DiIqksIZARN5qyCYEuLgigL5QXJD2/5kFXP4+oQ/AAk5gX4tPOTqOdxTDuA5dHnHPsF3N/OtADFsZeKa3AOKWJkAV20nw285ZIzjyLbvvvrEfZAFMWUHVWOmh4VyBMySZZRVoOML6ErGEdHf9o36fZQEZGezg1RkRTlq5MoMGhccM0xSjJtwh/mTpFWVSwS6WrmCbW1HwWToJAn1SaB1PKuuPkz+QDtbFKNJ1LxxhWBRKg6aO//AwE6D0JYXnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w0RoyYUPEP/cJh4ZM5a7RkJIBcM6JnHlYPmTtRtyUWr1N63cSlPlCt1z9v?=
 =?iso-8859-1?Q?Wiy1Zu6yAk645BQTUCXQZX/uP4VDSKIpIaUJLGoPyEUxUdGeXQrTfqkGPZ?=
 =?iso-8859-1?Q?ckrtZM2OsPudrcZIQOENPQZeLCImw4UHr2OL+EAaR5H0MakVDzdUYXmpzw?=
 =?iso-8859-1?Q?5MiVEG0VxmJxytKOFYj3USdS3EmUL/57l1IFKbN5V4yuUUz9U0aw2WJdtj?=
 =?iso-8859-1?Q?56nisSCX4XTaEVs5zJsYQW1yObR2/b3Zm9yTvvEB05CGePY69y/TLUlVOr?=
 =?iso-8859-1?Q?SyMkzFqNr9ejUqUWskGpXHGYxx2rofPFyaheZR9pYo3qzz51RqczoM/qnF?=
 =?iso-8859-1?Q?u9CHEymGNd4BFngoGzyD7qxB+PiYFUI3EdfZiZNPoI9dbYPK2Z0cWWa1Om?=
 =?iso-8859-1?Q?37VM47QATC7zNUl5fMlLVOWiDHl6ysO8hP+jYg48U0NFOLZ2XE6B9AQV+k?=
 =?iso-8859-1?Q?UfWNHgt09TyMjkaaidiM6RU5+6vGZr+2g/c4DPd7INWCvi8nS5h5OXy4Z/?=
 =?iso-8859-1?Q?8v+8NyVIx+EcqSX4x7GmAs157QRB9a65bFR9/Qt/6MIWV77R0MVGJVGfsD?=
 =?iso-8859-1?Q?D0jyKLhw9gisSGCL3V8FzwEb1NLCqyyjlUlJup6alvd+WlsLlGxPZtkT17?=
 =?iso-8859-1?Q?fbSWxqhMHQYwcdL73bp6qlgiPooEd8BWLlx4NKey77i8LMudgiuilXMxSf?=
 =?iso-8859-1?Q?QHTz712d8cQKWK46qESv+W5mUAWnpUKulCw5H8vjlJ4qly4wj/9zOK5GJ1?=
 =?iso-8859-1?Q?Cl77CSdRDme/K/0XszpTgsbQQ25xehyQc7KeTnpocWIMrphsmzRyPZcmUW?=
 =?iso-8859-1?Q?DcpvnfDmqiv3M9HQHwwpRN8mod5enPJOXADBIGeyZtKRmfeTgYAzcWghs9?=
 =?iso-8859-1?Q?uEw2iXN+zglHfnnlaOhjZRO8ivmJnSJnfMSgXyUGJw4rlNu8SW5n081dkg?=
 =?iso-8859-1?Q?/tGAAz6J8g7SoWB9gmE2sbBoU7SlFiA4pKzXDDSwJch2LLWO8eZzl/KoDb?=
 =?iso-8859-1?Q?ILN2N50VivFxrBmlQQr9A2hukdfOcGTZ9G9zqj9hCm+RJxvpSROlbd9dim?=
 =?iso-8859-1?Q?kCsuQ3bqgCmbUpXm9KFHA+mYsFtagmAMzu6ktCr6Kml2yGKQgOBoMzQO5N?=
 =?iso-8859-1?Q?gcsxitlwmOSSKUsLbobAggtDBQIzpSvI0MEfKhx9FQApdCu1tKaKYkEVsi?=
 =?iso-8859-1?Q?mKwescxGFTxZ7HEq+7sttqZ5xeYfBBbw3Zs9dM+4wYF33SswqPrQAL0VpR?=
 =?iso-8859-1?Q?5YcSDF2jw4HlUFJ14jH/AElmhmeVlV0/8j4foxdL4mGsZQ0SDJQQzoijlo?=
 =?iso-8859-1?Q?Mx9N+QyShRG5yrwEZdv6UwhPYpub/59nS3r5DBVu/t2JcuswlOKnK18Mlw?=
 =?iso-8859-1?Q?lxqWNVqjryWJWxnmibbc7phhTOATfVMZFH2/fMqeUyG01ydOUpbzeVXA7P?=
 =?iso-8859-1?Q?uWWNCOXnhm/495NIof9Phg0DwXIqMVPRkauF2jZGVe27kEtOWDNyRhk6tk?=
 =?iso-8859-1?Q?RtJRYDd92ot0JkbmRUOvZYBb5gjJbeNsfVtLDMtVWT83CmJgQZxHHWn9Ee?=
 =?iso-8859-1?Q?N5gFE42c9vup+CNzuaGBSj4xIFbQZEGcQn6eAKWrsZXWkukl3HDGsl0wa+?=
 =?iso-8859-1?Q?QxD69LHrqG/lURIMyORQ6HAJ8xu0CbTBA9326lEx9lELzTdajqoZKR2w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d97ebdb9-b925-4e10-83f3-08dc541f2c92
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 20:46:44.9513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYj3/pvY/Mf2oMe53rQ4yb4QXNDr9i51uxBp24mPEM0y1YM9cfgfraVKhcfQgPGnLBpDlZJTIUaa+f3OirhNssB92BBzLSwsxIuT4y5L+78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
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

On Tue, Apr 02, 2024 at 11:27:45PM +0100, Adrián Larumbe wrote:
>For every DRM device that enables its job accounting HW from user space,
>toggle it right before obtaining per-client fdinfo numbers.
>
>Make sure profiling status is returned to its original state before
>exiting, by handling the SIGINT signal just like in intel_gpu_top.

isn't this something that should be rather tracked on the kernel side
rather than relying on the userspace to behave?

1) call gputop
2) call gputop, because you forgot you had it open in another ssh
    session
3) stop (1), because ssh session dies

 From the kernel side, I think it could be done by enabling it on fd
open, disabling it on last close.

Lucas De Marchi
