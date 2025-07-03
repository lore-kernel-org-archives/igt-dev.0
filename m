Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182EBC83F03
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 20:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA4510E1CF;
	Thu,  3 Jul 2025 20:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fU2vUHm0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D3F10E1CF
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 20:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751575035; x=1783111035;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mHMqQ+2Nk+vCbHOuuN0zfpnu5tN69rqMvuU8WbBnS0Q=;
 b=fU2vUHm0IEU1NRl5eJ7OuwfrrJYdtLUu5rxzX+n1jYdgocXbQ5O7GOQm
 OnX1A0vGYtty+RCnmHfaUfH8wQdWfdzr2v2rktIBrcW9HAB/a7+B/9abT
 s7z4nw/7QpNahAkKm9Hbi6hyI3nBhu7tIhuDYNihm+ihSyjOqdVAk6pxk
 tWFzTUfNr+kHmSoodWVWM9NaT4WTodrf3ns5upqUwPZye/K8JuEbSEOgX
 0wGNvCrQ+xAQUtrMji/OlODM52fTFLH3KO4I3AFirbTCR339Qw5qg9X85
 zKu8NVttvJV2BXiRBk3vs/LTlsEyhX/UMGZd8nEx0LasHIoD2CnKgZxBi A==;
X-CSE-ConnectionGUID: lv/dvq9xTJmKwUmaaQLUQA==
X-CSE-MsgGUID: AARiDzxvRiSB2YX/AkNWPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57721953"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="57721953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 13:37:14 -0700
X-CSE-ConnectionGUID: X1Vng72ZT0yXH3wgN6sz6A==
X-CSE-MsgGUID: qtxohi7DSqiEElUePG3myQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="153881249"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 13:37:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 13:37:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 13:37:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 13:37:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmaArpRo10wO+8rJELpfyJjNwwRo4XGhvzCy2H2VHvFWMDs9J2Z0NLca9LF/LyQjsltzyaFzBaMKLSJm7uejbZ4XmTgjksW3cK35ypfRhC9JI6c8inISXkmum6QVyimHggIHJRXpMvPCkAkCOHmd89ZZqvmkCgn1j+tf5J9/YdOcnT8NFUCBtagLQBrCgQWyt3Ek0o/pvaa7xezXoCOA7SSsgb7+ae6Nt2LRXMxJ3YffdVdSpEpa/ds7Zkqmcnv8Tbn0DpdtjkRXkzCsTxEYsN7EhiSqoCmjnDL4D82V/e+mzzeG49/9LSqRum4yZS+x8XUx2UjrBuJjUw8gDs/aAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dy0o3H4GYZntuyupPh7RkoX7Yb0DOqJ7iPQwZp6dCPE=;
 b=ZM0jg4X7k/VnFL03nFdWNllcX+e3xAWhMDiBWQVCJ3ov3sZ1WcdDvxzwzrND6BKtAEu9LXNn/c0sjtoTb49VGw/BzYaaHO0KV2I/KMe/8+rZO/E48aQiTZ4aEmm2vrt8JYrkDeRF/zI473ohOOytbFOJPOXmrWg8N/TfbHeZEGK7P6W7qy1yogYa0XJ4lvXBxGRIo6VsxM7v+ruc9KSaQk+YYpalXChNQaJV8sqXen13vVvSyjBtxK7xmRQjbXq7BD42e9e7cICkctJELwMq4ms5u2vHzngV4O47CeE8PkMPPt2QvJvBR7wmrH3aPQdaPtKidUbkrN1nB5KWzbT/1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA0PR11MB8302.namprd11.prod.outlook.com (2603:10b6:208:482::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 20:36:31 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.034; Thu, 3 Jul 2025
 20:36:31 +0000
Date: Thu, 3 Jul 2025 16:36:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <michal.wajdeczko@intel.com>,
 <marcin.bernatowicz@intel.com>, <kamil.konieczny@linux.intel.com>,
 <katarzyna.piecielska@intel.com>, <zbigniew.kempczynski@intel.com>,
 <ewelina.musial@intel.com>
Subject: Re: [PATCH v3 resend i-g-t 5/6] tests: Add xe_debugfs
Message-ID: <aGbpyhgv6AwZ41Sm@intel.com>
References: <20250616074240.45818-1-peter.senna@linux.intel.com>
 <20250616074240.45818-6-peter.senna@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616074240.45818-6-peter.senna@linux.intel.com>
X-ClientProxiedBy: BY5PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA0PR11MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a61ed23-8dd8-405f-2064-08ddba714b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vJG2r5HNlhWuuNzjqG1zFY61ZeeRGZdo9x0mdxA79322CzZED+KJCjJZx5?=
 =?iso-8859-1?Q?dRW5GYCY+Bc+BPH0sL4JVpoFVAqQNgimHP24DkkxjlxNzsuBmrC+pF/DOp?=
 =?iso-8859-1?Q?4xA4XMOKPO4cja9VXqQM8luGpVaoODpXlOLRhk1Yk3i7Y4o1RU9lTiouy1?=
 =?iso-8859-1?Q?cVzj8dHQznrEv1mu2jQpoX/N1tcL+8o9RSbqBZTGd17vopsf+9VSv3tbuE?=
 =?iso-8859-1?Q?n2zD4LNtQg2WPFRpeVWQtFD5dRBVIiSZoR06HAdU6dCAhvY3ZGc2n3xvH+?=
 =?iso-8859-1?Q?hnRiXwj9Mlq1UYiY0JKcywlciyImiIfCo9OiaoDlfmqqEgJYQkZ8V4MQ6A?=
 =?iso-8859-1?Q?7qQ88FBP8J4NIJFws4qDTphLs4lbwVmfpQG9XpXtEVt1qs/47fMzrVt4Sn?=
 =?iso-8859-1?Q?Ncn+lB0uwCRN+tG0ReZSESQ/Bnjr3KP6HAnEQWjHDKDYX4hmjlF3Lv0xRL?=
 =?iso-8859-1?Q?ijScrDMX5b5IWBT6roPNCH7tR7Tk+Ephe9Jm3NYtOv79ml8zE2EJkI6UMV?=
 =?iso-8859-1?Q?IPAqHO6N5iD6iheIZbMs7mLP3H/tw3qcDIOFBwp4yIGFDYr5X0YHFbgjrF?=
 =?iso-8859-1?Q?mQXEHS8+bQEDFoI++UX7qnNof+XdLu2v0y6nwIFbHCu4hEukzPDmjsVVT2?=
 =?iso-8859-1?Q?q595r8XlIP0AxqWhms/jJfaLfRxQI+Gi0D1dVZp60fJvdQ9K5xSpk3Rolz?=
 =?iso-8859-1?Q?D6afU+Cn57km+OGCmPEicordNAksv2XedL5UDl5dN1jHsR+sKe0gsJZ976?=
 =?iso-8859-1?Q?3lNCta5ts8ef+b8YUZW6YmXiW6vjS0/vpt8+6NArctoa8z85UYvEJZ4uGm?=
 =?iso-8859-1?Q?+zEj97bPsLZSCQ9STQGiYRQLK9/O7DuCFw5tjMSgkPTJTfEIs4PSRaeO0j?=
 =?iso-8859-1?Q?xrElyTF1Cvpqt11H/kA1ShqXDUEIGjUVi7v/O22kr/ImXc+azIUsXHvklQ?=
 =?iso-8859-1?Q?b1FVyWrTc3ScgLtuGCloxCmvvvj3U8qi9GvDzqEsQsQ8SfyJWuq2V8UgLp?=
 =?iso-8859-1?Q?h2/0/pM2NIObMh/tgOHiCXVgG0E1f2Sc6j40ufU6WmmWgSANpJA9YPswfE?=
 =?iso-8859-1?Q?h3Ez9IY2wmOlh7/l/Tgxt5dJnCzUQ72O3jNU6ywz06UZyG7RfjsILKFP9G?=
 =?iso-8859-1?Q?BXAO03ODvHbphR9VW/mEvzjpmJYMGPVxUv06YaQzuz25LZNI/SQOs3sKNw?=
 =?iso-8859-1?Q?Tso+6s0TtVISAWJe9h0/be04R7vofIbslOg5b614SSC/2o06iGO39jtmwJ?=
 =?iso-8859-1?Q?KUUsq12nAAtpbJsp26Nwoze1P1kubvwdTlSJQOLXFPjbEdR7xseWLWkHQ3?=
 =?iso-8859-1?Q?NcNvHwJR29AgcAgb3fAsCcwsMfHM0D88iNs8W9YnSPyF2sTbcophlew873?=
 =?iso-8859-1?Q?Qegi3PQXRyws/gDOAHFIGvLdtW96VfK7R6bKqwEri2hi2S4aGOrKX8w7Rb?=
 =?iso-8859-1?Q?r8sFPfBKQbuAupb60x3xeSOZ7YmvpR2z9IBUPJLlTAteREqKixqRUP/yz9?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3VkdktotnZQ6DVa7SXqPLnKQBytlSzxgMGRk3YcJ5xtxxcrdAdSwGtoqO1?=
 =?iso-8859-1?Q?wZ10CvQBgLGSay8XzAO+Ym8q3unWiyJeS+y8hmO3IWenEmMHWHbsFYKev6?=
 =?iso-8859-1?Q?rT5LnTC5Cq8xzrWGiAsWhSh2Wo2E/aFMS4miYVHjCGk7KCoIZLmhpLGw0i?=
 =?iso-8859-1?Q?u5OHmepBbgl6FG483+0alhzJt/aDIPbvqBKF36yfXX+TXbIcb8qRj9tLY2?=
 =?iso-8859-1?Q?XdzFd1AYeqruvmkczEXS1fkEZNXP8dHL01a6sTWj7lcVjkZWOje8iE1v8K?=
 =?iso-8859-1?Q?1XCkzH5IhDn5fsD90yWRkkOuAOD5YHXXBrf0aSBtRJpr9gTYkM/Q/fplPk?=
 =?iso-8859-1?Q?mye+QPIG973pfJNBwLtEmC0UD2I82zh1UNgMPVyeJ229xYvfzbyHAsfJ6I?=
 =?iso-8859-1?Q?/D+3mr2OzrGYJcsT1QMXc0nmzxbYLW9BBdmJJfX6dlvz3/2GoWSaqOxaVw?=
 =?iso-8859-1?Q?2BZltiysK+QMy9eBYX0KUWIo2lB7pQCuOPziFFPtfKQyau8Z8y0uS35mVd?=
 =?iso-8859-1?Q?OK09JGFeIrgMdNsJuYYjhxjtR6zfxi/0GL/KkeVFV+oRvVSW87EOtgyFbk?=
 =?iso-8859-1?Q?4ewAqIL1tPtaBpxxNwajU4u6aaUgdKFitUMsAXrFHjMRQnLYPGdr8J6y2b?=
 =?iso-8859-1?Q?FFNcIM+88EXTrfr1MU6gbPlzUyukCZWulNyIZixmdwqpI0xZD2Nq7aZpYr?=
 =?iso-8859-1?Q?6bvv5vSEfnKbrqjTQAwCPFJe69rj0VF+CtzhXYLxw0RUOxmyOScfqz7uIa?=
 =?iso-8859-1?Q?5G6hCU1DMGZp59P5ATZ5D+lmmTFVTIkcr+McJJOpPUttC4tYTt4ZyIod45?=
 =?iso-8859-1?Q?qPM8GbI4jftrLsXOX9uVSWx+PgI9PPa6Pu9eHgUQ7SpZizv7w1RksiMBgZ?=
 =?iso-8859-1?Q?UENVqfKcGF/XkcDqUfONCY/drqO+JgyRIzaK0A5qWAYBQPFULsGzyChdYh?=
 =?iso-8859-1?Q?NqoeCJI0qtUHM5dxfRZRRCTcqxuu49SYPnk29swiwQtzuRF8KNuQ0L2el+?=
 =?iso-8859-1?Q?+z55s467Oth9CSPOuyZfF6ry66rSiN2dofxqRwOrBaL9R/egWGr4QihjeH?=
 =?iso-8859-1?Q?cdO4DuJkmnWrvdQCVZUS+k89VV8jDJdyZhLKghcy1wOiEwQdib4e4cPwWs?=
 =?iso-8859-1?Q?bjIiSKbOHtkuEHexaDFlatD+Z7rSF8rNdUKsXUBzQV0GqGZkDp5+WJ5zbR?=
 =?iso-8859-1?Q?Gu7osK4PyTwdO0OUqk8zlyQW4AXr5eXjWkod6e5Z+w5EPeofVFbXzi8Q98?=
 =?iso-8859-1?Q?SS7fVlUDY5a8x9ITH206oDgVQB0yzWe4BdKCW+GMYDgF5+6H/vkD2n84PW?=
 =?iso-8859-1?Q?VjmGKUFfJWRtMoQH95U4XHTIKKwdZektCpWIiw0pBPK7Pya1qihRH5rwpZ?=
 =?iso-8859-1?Q?s+nXAqI8Qt1QrXQDkmDNf102HB7OYayl8UtUn1XPPucwXGStJtYVc9AofC?=
 =?iso-8859-1?Q?+SeNFBRBcsXOPvWMK7sLoNfUGGTzfPOGtqHCAH6mBHKnMuTkI5Rlebm55e?=
 =?iso-8859-1?Q?s4Nx6SYL5Wmc1rIuiLdF0vVWYOJbTbFP7FiWPTZcLxbXrrEgdx82dvpRet?=
 =?iso-8859-1?Q?SdX0OgKZYNolM3hDkxBkkUg9vcFwSwGWmGZytX+HyNpFJyNbgzGAGkBurT?=
 =?iso-8859-1?Q?I5xoE+N2ezUbftMUmfodGBY4S/KyvMhrgf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a61ed23-8dd8-405f-2064-08ddba714b51
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 20:36:31.7134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9G8YDnZkOwleTgnZ2e7lNr9MJYdFQbg6rI61QNMJHCXrY1taNQ9Br2Lc1EP4DbKbrlxKeVmnd0fPqzU4DUzYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8302
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

On Mon, Jun 16, 2025 at 09:42:37AM +0200, Peter Senna Tschudin wrote:
> xe_debugfs is a test specific to Xe GPUs. It is intended to complement
> the existing generic debugfs tests core_debugfs and
> core_debugfs_display_on_off.
> 
> Additionally, this test has been updated to use the igt_dir
> infrastructure, resulting in simpler code.
> 
> Cc: michal.wajdeczko@intel.com
> Cc: marcin.bernatowicz@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: ewelina.musial@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
> v3:
>  - unchanged from v2
> v2:
>  - changed style of comparison to NULL
> 
>  tests/intel-ci/xe-fast-feedback.testlist |   2 +
>  tests/intel/xe_debugfs.c                 | 208 +++++++++++++++++++++++
>  tests/meson.build                        |   1 +
>  3 files changed, 211 insertions(+)
>  create mode 100644 tests/intel/xe_debugfs.c
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index a5f799f6b..c52f08953 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -78,6 +78,8 @@ igt@xe_create@create-execqueues-noleak
>  igt@xe_create@create-execqueues-leak
>  igt@xe_create@create-invalid-mbz
>  igt@xe_create@create-massive-size
> +igt@xe_debugfs@xe-base
> +igt@xe_debugfs@xe-forcewake
>  igt@xe_dma_buf_sync@export-dma-buf-once-write-sync
>  igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
>  igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> new file mode 100644
> index 000000000..66a5fa0f6
> --- /dev/null
> +++ b/tests/intel/xe_debugfs.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +
> +#include "igt.h"
> +#include "igt_debugfs.h"
> +#include "igt_dir.h"
> +#include "igt_sysfs.h"
> +#include "xe/xe_query.h"
> +
> +
> +struct {
> +	bool warn_on_not_hit;
> +} opt = { 0 };
> +
> +/**
> + * TEST: Xe debugfs test
> + * Description: Xe-specific debugfs tests. These are complementary to the
> + * core_debugfs and core_debugfs_display_on_off tests.
> + *
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: debugfs
> + * Feature: core
> + * Test category: uapi
> + *
> + */
> +
> +IGT_TEST_DESCRIPTION("Read entries from debugfs, and sysfs paths.");
> +
> +static int xe_validate_entries(igt_dir_t *igt_dir,
> +			       const char * const str_val[], int str_cnt)
> +{
> +	igt_dir_file_list_t *file_list_entry;
> +
> +	if (!igt_dir)
> +		return -1;
> +
> +	igt_dir_scan_dirfd(igt_dir, -1);
> +
> +	for (int i = 0; i < str_cnt; i++) {
> +		int hit = 0;
> +
> +		igt_list_for_each_entry(file_list_entry,
> +					&igt_dir->file_list_head, link) {
> +			if (strcmp(file_list_entry->relative_path,
> +				   str_val[i]) == 0) {
> +				hit = 1;
> +				break;
> +			}
> +		}
> +
> +		if (!hit && opt.warn_on_not_hit)
> +			igt_warn("no test for: %s\n", str_val[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * SUBTEST: xe-base
> + * Description: Check if various debugfs devnodes exist and test reading them
> + */
> +static void
> +xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
> +{
> +	uint16_t devid = intel_get_drm_devid(fd);
> +	static const char * const expected_files[] = {
> +		"gt0",
> +		"gt1",
> +		"stolen_mm",
> +		"gtt_mm",
> +		"vram0_mm",
> +		"forcewake_all",
> +		"info",
> +		"gem_names",
> +		"clients",
> +		"name"
> +	};
> +	char reference[4096];
> +	int val = 0;
> +
> +	igt_assert(config);
> +	sprintf(reference, "devid 0x%llx",
> +			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
> +	igt_assert(igt_debugfs_search(fd, "info", reference));
> +
> +	sprintf(reference, "revid %lld",
> +			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
> +	igt_assert(igt_debugfs_search(fd, "info", reference));
> +
> +	sprintf(reference, "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
> +
> +	igt_assert(igt_debugfs_search(fd, "info", reference));
> +
> +	if (intel_gen(devid) < 20) {
> +		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
> +		case 48:
> +			val = 3;
> +			break;
> +		case 57:
> +			val = 4;
> +			break;
> +		}
> +
> +		sprintf(reference, "vm_max_level %d", val);
> +		igt_assert(igt_debugfs_search(fd, "info", reference));
> +	}
> +
> +	snprintf(reference, sizeof(reference), "tile_count %d", xe_sysfs_get_num_tiles(fd));
> +	igt_assert(igt_debugfs_search(fd, "info", reference));
> +
> +	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
> +
> +	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
> +	igt_debugfs_dump(fd, "gtt_mm");
> +
> +	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM) {
> +		igt_assert(igt_debugfs_exists(fd, "vram0_mm", O_RDONLY));
> +		igt_debugfs_dump(fd, "vram0_mm");
> +	}
> +
> +	if (igt_debugfs_exists(fd, "stolen_mm", O_RDONLY))
> +		igt_debugfs_dump(fd, "stolen_mm");
> +
> +	igt_assert(igt_debugfs_exists(fd, "clients", O_RDONLY));
> +	igt_debugfs_dump(fd, "clients");
> +
> +	igt_assert(igt_debugfs_exists(fd, "gem_names", O_RDONLY));
> +	igt_debugfs_dump(fd, "gem_names");
> +
> +	xe_validate_entries(igt_dir, expected_files,
> +			    ARRAY_SIZE(expected_files));
> +}
> +
> +/**
> + * SUBTEST: xe-forcewake
> + * Description: Check forcewake debugfs devnode
> + */
> +static void
> +xe_test_forcewake(int fd)
> +{
> +	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);

What I don't see here is how do we avoid the forcewake_all to be read
in the other test? Or that doesn't matter there?

> +
> +	igt_assert_neq(handle, -1);
> +	close(handle);
> +}
> +
> +const char *help_str =
> +	"  -w\t--warn-not-hit Produce warnings if it founds a devfs node without tests";
> +
> +struct option long_options[] = {
> +	{ "--warn-not-hit", no_argument, NULL, 'w'},
> +	{ 0, 0, 0, 0 }
> +};
> +
> +static int opt_handler(int option, int option_index, void *input)
> +{
> +	switch (option) {
> +	case 'w':
> +		opt.warn_on_not_hit = true;

what about make this the default?

> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +igt_main_args("", long_options, help_str, opt_handler, NULL)
> +{
> +	int debugfs = -1;
> +	int fd = -1;
> +	igt_dir_t *igt_dir = NULL;
> +
> +	igt_fixture {
> +		fd = drm_open_driver_master(DRIVER_XE);
> +		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
> +		debugfs = igt_debugfs_dir(fd);
> +
> +		igt_dir = igt_dir_create(debugfs);
> +		igt_require(igt_dir);
> +
> +		kmstest_set_vt_graphics_mode();
> +	}
> +
> +	igt_describe("Check if various debugfs devnodes exist and test reading them.");
> +	igt_subtest("xe-base") {
> +		xe_test_base(fd, xe_config(fd), igt_dir);
> +	}
> +
> +	igt_describe("Check forcewake debugfs devnode");
> +	igt_subtest("xe-forcewake") {
> +		xe_test_forcewake(fd);
> +	}
> +
> +	igt_fixture {
> +		igt_dir_destroy(igt_dir);
> +		close(debugfs);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index a06172d2e..847598255 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -283,6 +283,7 @@ intel_xe_progs = [
>  	'xe_compute_preempt',
>  	'xe_copy_basic',
>  	'xe_configfs',
> +	'xe_debugfs',
>  	'xe_dma_buf_sync',
>  	'xe_drm_fdinfo',
>  	'xe_eu_stall',
> -- 
> 2.43.0
> 
