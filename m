Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C7EC02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 17:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB5810E377;
	Mon, 10 Feb 2025 17:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anqNTfdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253EE10E377
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 17:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739209501; x=1770745501;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GLRLu7KynAYTEphulradLlBgOTOGPeIe4Y2Bs7G0A6g=;
 b=anqNTfdR1/FyQxi+1Cm6BXSrxKgVz1VZ/udeJSZnYMBUUxKeB5i8pBhS
 uLKh4uwW22Saxh2QfCRjTbzWXpSCjfJy5b4YHEH2raradeGiLi85YntHr
 TH6PaTMxLyXtf0RDYzDdtHOYJ9f1WC6LnD6mdZ/5TYsn7uQJ5uaSvEE+O
 QuCEcH8O/+tE124/Oi0PNSKZORLKXJ6gjr5/vSUNXVh+MBhZN5GdZv8WQ
 O8MGGJaV6k9DQxJqoSgyLpkgKyBsQzkKe1F7T8ufraF0xMcxkkHZCaRfL
 QeNNympiX47K0Zjy/tSWjHfyAZi8p6Lu8YhbNmY51GZX8bt0sVAEsYoxN Q==;
X-CSE-ConnectionGUID: rgZul9UwSY6dDgfEWCCd3g==
X-CSE-MsgGUID: a+fW41DXRHikIdJI4M20Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39491098"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39491098"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 09:45:01 -0800
X-CSE-ConnectionGUID: gG4zQq7ZQLKzXO0l8fdKbA==
X-CSE-MsgGUID: BIx1nexZQTSWPu1CQhm9cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117470322"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 09:45:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 09:45:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 09:45:00 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 09:44:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DF75cnbZq/bxPJPerRlYAl8MFOEaxfMDmxCbIHRrihnY9Vbd/V1kWVVFMdwaPVkTyxcMBFFWWaz43z+W7OQiYvMRmjIQZuOYDWgU0eSdrtwAcTMjTJn7T4Qx5bRI71CJaihQdHtBJbKYGLWrjIa47xYqpyKS3UVpFjnG4IKL8t3bZ1dwaWBOF1+HSt7fiBbE5Ce5wseGsoX3mtpH6dTUCPtKUnMTOI4ILncVf8HineY0KSFS+KVblyW6w5be5A3iKA+UzlOFndh5a2P+hVvM46wnRNRfDThpcxkkfhowXNlR3zHk/lB2BfmgyiY6oZ7JCEfLteYpxtmEUBWRRq5l7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyaeXQTzCZURNZ9xzz2m8gx7PZv2yOympmQ5hgUiVDw=;
 b=WwFfkTMK7oJFp1PR7+lAgOPWMOk/M7f75WQhAnxjYC7XcRdJ7g3U0olTOzrK4rkHoX0RgsbG5wqRGSKmoHZNYjvGziPFA7SYMkKs45e8CvmdDGKinwVeB4CaskvGnh9dcY1hZF1k71AQouJccjc1tSKgXu9J4dEZenEojQDmakL+VqPD+Sn6cXkiYkfc8WuFqqfWjwZzaS0Oy279Ey+3Am7KvLgQ8FEuJMvvgbfdl/EVw8A+zmJldcTA7Lim1YFQLjivsguQZmLY3dIoNFZW3x1qpJ8qY9Q51YSlT8hKhmQCDkCDUJ53rYI5SLIKDlw4DlCSkXrwgRwGnCgB4IA8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by IA0PR11MB7210.namprd11.prod.outlook.com (2603:10b6:208:440::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:44:52 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:44:52 +0000
Date: Mon, 10 Feb 2025 12:44:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Matt Atwood
 <matthew.s.atwood@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
Message-ID: <Z6o7EUQm6ydURxq1@intel.com>
References: <20250204175302.18147-1-matthew.s.atwood@intel.com>
 <20250205233055.GV5109@mdroper-desk1.amr.corp.intel.com>
 <Z6TsGM6LD26qIcRY@msatwood-mobl>
 <20250206180113.GL4460@mdroper-desk1.amr.corp.intel.com>
 <Z6UMzbDHC9vMPRI2@msatwood-mobl> <Z6UPA-zaG1AwWAlX@intel.com>
 <20250206194447.GM4460@mdroper-desk1.amr.corp.intel.com>
 <y2wm334262gpb2vj5axwxkuyjkmbfjznmhnsrrd4w6bdgyuyrj@jcwf7vhsf4cw>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <y2wm334262gpb2vj5axwxkuyjkmbfjznmhnsrrd4w6bdgyuyrj@jcwf7vhsf4cw>
X-ClientProxiedBy: MW4PR04CA0072.namprd04.prod.outlook.com
 (2603:10b6:303:6b::17) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|IA0PR11MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: f34d5f4c-c6c7-4e0e-e055-08dd49fa9f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WNHW0k3iiYYDogHIhi321l8BEcyHh1WLihleo9/JRai127mqSAXhQao4JVo6?=
 =?us-ascii?Q?ASGS9FY6HioDiVCDR3I70WbECcbiR+HV10RozTsPwONkTSyVlP8XDCuGnDP9?=
 =?us-ascii?Q?OUuCk5mPh+Ny7Bn0P9Zm7yCkNcYyfftnDQ1bQ+jNka74Ga7wg24xXNhAw2Fa?=
 =?us-ascii?Q?j3MV7jZFXkzJggf6VEOYUGkvQeVgtI5+/e74JxmpCt/Z+BboUaKMPBzDt5vu?=
 =?us-ascii?Q?J7yvoE+X28nh6913aYpl9VoSvMNnX8M9kmu3H73HTIWJFLk+cpyog4xtxHdS?=
 =?us-ascii?Q?Z1SHM+f5+nDl7UAy0bE0FTyM4WQ+jUo93J6U2kG61Zp3bg/FLXaDgtgSqVFC?=
 =?us-ascii?Q?X/t3P4GJgm6RAMKoFdfgpr80jUmUOoWfbr2n1sDAPOTyJyA6AHrM6Z1Rwzhl?=
 =?us-ascii?Q?QKGmQk8014lGFWRr4ZmRq+1xSiQsUDdf/C141gxn4+F1bQyKulzHrmr0n93e?=
 =?us-ascii?Q?4tdSrhAEL+qUlNWDmwLaa0fHizXiSyJ5eYpYPDcpcdEDcvGcjdmhkaB87jMa?=
 =?us-ascii?Q?qNAawC/oqVuJyqRNTD9JinnJAgX+pUBTMmo5qZC9vaDRkOT19BsqWOGAGy7O?=
 =?us-ascii?Q?zIA4tpCpeBaQI2aD1712srR8PpaTQqiYomMeicxn7PCqT+1S+X5+WlbqXucc?=
 =?us-ascii?Q?g4bpS0GUmt773F4Z4aT78gCEvf3xl5YR8rC4x/q0dj99v0W4nvI5zwqonjxc?=
 =?us-ascii?Q?UPT43YAz+GQIx5VJJElQGiQVcfMe8YGVddN73Xkfu2eUIpRciUjTOwPRscHR?=
 =?us-ascii?Q?uIoSKCMWwsmYYtMmaeo8bTluXvxF6Uhw19LkBE0UGafKM/RkeZxNvmTUjZb1?=
 =?us-ascii?Q?lwfN9PpR7r/scb9+3wb+Aw02YdmFUxV0Q/DvkGNK73PT31B3N98yKCiObTGz?=
 =?us-ascii?Q?xqO618I/33buWYb2L8EiboqK+F7JTl8571WT5xTNTWwNOlEGWXboa8w9V1mF?=
 =?us-ascii?Q?dOywc27P2t7iPQBuNUxATBnitTNak+r9Bb617IPkqGYlY65G7HnvN/JyK3a5?=
 =?us-ascii?Q?4BPbK3BpxgOquhBFLv47xdZ3HTr9orhIHFM8GG0izdBuYC6W1MigR9XuHRH0?=
 =?us-ascii?Q?sTbhPoKCYOBCpgxxA8WIhDKfS6TGNJUwtzXOTnk4CMd02NlaGtBVvX5MOZBI?=
 =?us-ascii?Q?ZjAwBGeE9FatXBpoIMttqpT6Bj4e5h3SUSFGdpQKx09gpZcuP0uouc+PQPae?=
 =?us-ascii?Q?FLA7tYE6He4EQKtohBxjZm+W0hKhpPhBC0J38bFFGKra4lzHJfAvRH5dfS7F?=
 =?us-ascii?Q?CUZw9FPQEMqcs/csrQuoGPepHe7l0zj0fircq4SkEkVxHRT0jB8IF3E95XI0?=
 =?us-ascii?Q?DqUg4nlBOOeU41zppPhryzpA9zOB31HWkWypqwJnD4KPPA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K4g6cQqQpGRbXmXHokzdqom/scM4TBggs2QP+NV9wKdVvS1KoolTFI9Hw8FW?=
 =?us-ascii?Q?0bo/eEErsQ+w9uLsRg06u4h/xnDlbvv9anbMt9jHI2Ybnq891rYb0lknnd9Y?=
 =?us-ascii?Q?WC8dDtfj1Z7dcWc9J8NHU7EKp7R/HW6bs5/glFiVXu+vvc5prfxwjMf6c/qx?=
 =?us-ascii?Q?8/A52rKNnV+N0sqt5a2lQwa9yM16sEJ6YNFUw0pHwXDH0HZvAGA7Ky03dJ47?=
 =?us-ascii?Q?bE/GFgmwcibRtmrPpV+CjYO/PnibuM3BLj1wCiW8JUTLld8DZtfgy9IwPwPw?=
 =?us-ascii?Q?d+kmc5GI2lydZiqi2owVds4nQPLl0OWXYiLinXK4FOIYlnKaYc8ELkeEHE3Y?=
 =?us-ascii?Q?uKpxShWnE7wL8irBxB+funCVtQXwGujUt+QPH3VaXpbE/rpJkvKMAtGI4Hbx?=
 =?us-ascii?Q?vX58/Q5N2/o91ERsgZpR8olSFdKw9cFbLA0/cRWwer/ZBNh5vlh8o68/nReE?=
 =?us-ascii?Q?GpXpcNLvyGa9GgCeU4tXk05FE4vhyc8YleexGCelq2hf/6dcJSVvLnKcmusz?=
 =?us-ascii?Q?E1K/ZuI1tSkkaAWJurJAupmshaDzaQGkp3OKvIo9WvnXbSZxfnrcfmXupzfs?=
 =?us-ascii?Q?CwVZhGLs34XGy7y9t6/vpkzCI6ETrUoafVq1pCyrWYWqV2qvvdpIqqhjnlso?=
 =?us-ascii?Q?/hWnQSNKOkXQDQ5gNuR1txSDLO1j8QI6X5XwuDWWHncgYaThy4I62Lf8O7ll?=
 =?us-ascii?Q?dLaCgGK8WEfzpHj+DYZjGOyIoqFMFX/pLlPXiXJ1aKMBeNlpiH98jhbONgCz?=
 =?us-ascii?Q?fJMBxSWIoqIj44V521JP75JFUz+XEzImzmLJgIgfleH41ECbv1zg/zSxw3vE?=
 =?us-ascii?Q?9k9RcD5vZiSp0tHdY7iByzkDO8v0wiZQoomkQIIIu0LmbJhUtfRgtQ5mBAUx?=
 =?us-ascii?Q?oDlUlWi+eTm/LxU1Tl13CziRe7++9weUfehS6DqFpkn+2oTCuKRkVkJcw5Ye?=
 =?us-ascii?Q?voUQXLH/nyAygP8kca3LQMF4FliI2Qd08mtP9qnsPpM60VPaYgNNgY+PXTUA?=
 =?us-ascii?Q?Z98UJuGKCnQv/woFOUb5rJwk27s2RnQ7V59lscm/fsqN2cDZnYQpVREUChNv?=
 =?us-ascii?Q?ZHZFNCgXW5SO9Z0b9UkllwoJJM9vE5/gtBUq9xLmm9ea088CY7J9fw7+kDZu?=
 =?us-ascii?Q?Rxw06BJWrEPZL79F3i0YXDZJ32IxinCRYt/jq78q5/jXKbYqix1wk7xZFwqW?=
 =?us-ascii?Q?RyLIb04oKa/qYVEnxP0+A0XAf6KhgdlBGVv5R0hrsn6oYGgHba0xPpSvGYHe?=
 =?us-ascii?Q?nBWZWlXu85KYeWuIIrSiM8KoWfQP40RX7jCK+aKDZ5TnawAv/+p4dwYfd4Pi?=
 =?us-ascii?Q?r+Fi9xr3zccee6+SXdwDsJ8zN2SbIwQHwbVCKmEp8vl0tgCMJqfkKFkiqY/f?=
 =?us-ascii?Q?8nUmvVEGIaiF1poy8Aea01UTO/RO2+G6ZV5ak6jE3IskIF2WFf80MsbLKTLZ?=
 =?us-ascii?Q?ikpwmVfwnyxqjDz+T7w3A6i4GR19TdLRbakCamx+Ru9mSl4Ov9ERK8nHhgi6?=
 =?us-ascii?Q?f/OsEWIuSvqbZ5Mpqif2t13kzCUzbQSoGIERePplkpJXGB4LFIVdxFyddVqo?=
 =?us-ascii?Q?APNFc91EfQZXYbgPDFhEVA9S636+H1m+5OovWC6cNOo0OwC+jn/QP7ltF3JN?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f34d5f4c-c6c7-4e0e-e055-08dd49fa9f51
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:44:52.3489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8cHZepSCP6MzBXU4LEgFMBC0JK+FuDCOOUasN0nxKb7g+gYolY0poMGABVI0wsb1hjvank+0CyIUz3JnArBLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7210
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

On Fri, Feb 07, 2025 at 03:04:44PM -0600, Lucas De Marchi wrote:
> On Thu, Feb 06, 2025 at 11:44:47AM -0800, Matt Roper wrote:
> > On Thu, Feb 06, 2025 at 02:35:31PM -0500, Rodrigo Vivi wrote:
> > > On Thu, Feb 06, 2025 at 11:26:05AM -0800, Matt Atwood wrote:
> > > > On Thu, Feb 06, 2025 at 10:01:13AM -0800, Matt Roper wrote:
> > > > > On Thu, Feb 06, 2025 at 09:06:32AM -0800, Matt Atwood wrote:
> > > > > > On Wed, Feb 05, 2025 at 03:30:55PM -0800, Matt Roper wrote:
> > > > > > > On Tue, Feb 04, 2025 at 09:53:02AM -0800, Matt Atwood wrote:
> > > > > > > > There have been several changes to pciids upstream that need to be
> > > > > > > > sync'd into igt.
> > > > > > > >
> > > > > > > > Sync with the following kernel commits:
> > > > > > > > f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
> > > > > > > > ranges")
> > > > > > > > e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
> > > > > > > > fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
> > > > > > > > 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")
> > > > > > >
> > > > > > > The updates below look correct (they match the kernel header), but the
> > > > > > > commit message here is confusing.  IGT updates to this file generally
> > > > > > > specify which actual kernel commit you're synchronizing against; none of
> > > > > > > the four listed above match the content you've copied here because there
> > > > > > > are additional changes not present in those.
> > > > > > Because there are now several out of sync next branches, saying as
> > > > > > of this commit idea was not working. Hence this approach.
> > > > >
> > > > > You should generally be syncing with drm-next after things land there.
> > > > > So which drm-next commit are you syncing with for this commit?
> > > > They hadnt been in a drm-next commit yet. At the time it was just after
> > > > a next cut, at this point we can probably just wait for them to land.
> > > 
> > > I agree with Atwood here. We had changes coming from drm-intel-next
> > > and changes coming to drm-xe-next. In the kernel history the changes
> > > coming from drm-xe-next are on top of the drm-intel-next ones. But
> > > they landed first here in the IGT.
> > > 
> > > Now it is in a situation that individual patches from drm-intel-next
> > > would conflict here badly. The safest thing is to keep it simple and
> > > use a single patch like this.
> > > 
> > > This is the final copy of the file directly with the proper mention
> > > to the commit ids. I really believe we should just go ahead and push
> > > this to finalize the alignment before something else gets in the way.
> > 
> > But in that case we should be explain what we're actually doing in the
> > commit message.  I.e., we're *not* synchronizing IGT with a kernel
> > commit like we usually do.  Instead we're manually rolling up individual
> > changes from various kernel branches before they propagate into
> > drm-next.
> > 
> > As I said before, the actual patch is fine; we just need to fix the
> > commit message to more accurately reflect what's happening, especially
> > since it's not how we usually handle things in IGT.
> 
> I think being explicit of what was done would be: 1) show what was the
> drm-tip used; 2) mention the changes that are contained.
> 
> 
> Example:
> 
> 
> lib/pciids: sync with kernel
> 
> Synch PCI IDs with kernel, up to drm-tip commit
> a293777d70b3 ("drm-tip: 2025y-02m-07d-16h-56m-38s UTC integration manifest"),
> which contains the following additional commits since last synchronized:
> 
> 16016ade13f69 drm/xe/ptl: Update the PTL pci id table
> fa8ffaae1b152 drm/xe/bmg: Add new PCI IDs
> e35ecd95ecf28 drm/i915/display: Add MTL subplatforms definition
> 6a04bb5a20460 drm/xe: remove unused xe_pciids.h harder, add missing PCI ID
> b99dcb91ef551 drm/intel/pciids: Refactor DG2 PCI IDs into segment ranges
> 
> ^ this was obtained with
> 
> 	$ git log --format=short --oneline --no-merges \
> 		3c1d5ced18db..HEAD include/drm/intel/pciids.h
> 
> If instead we want to show the commits from -next branches, we could do:
> 
> 	$ git log --format="%h %s" --merges  3c1d5ced18db..HEAD -- include/drm/intel/pciids.h \
> 		| while read -r h x; do  echo "$h $x"; git log --format="   %h %s" -1 $h^2; done
> 	f28030b19c846 Merge remote-tracking branch 'kernel/drm-xe-next' into drm-tip
> 	   5b380838930f1 drm/xe: Add stats for vma page faults
> 	ea9f8f2b21795 Merge drm/drm-next into drm-intel-next
> 	   2014c95afecee Linux 6.14-rc1
> 	220ed690436e9 Merge drm/drm-next into drm-xe-next
> 	   1c470f4f61f3d Merge tag 'amd-drm-fixes-6.14-2025-01-29' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
> 	0dc853865ab52 Merge tag 'drm-xe-next-2025-01-10' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
> 	   6a04bb5a20460 drm/xe: remove unused xe_pciids.h harder, add missing PCI ID
> 	28eb75e178d38 Merge tag 'drm-next-2024-11-21' of https://gitlab.freedesktop.org/drm/kernel
> 	   a163b89507786 Merge tag 'drm-xe-next-fixes-2024-11-15' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next

ops, I just got to this after pushing the patch. I'm sorry.

So, the patch itself that is syncing the ids and already mentioning the
missed commits is more important then having the whole log and details imho.
So I ended up pushing it. Sorry.

> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > >
> > > > MattA
> > > > >
> > > > >
> > > > > Matt
> > > > >
> > > > > >
> > > > > > MattA
> > > > > > >
> > > > > > >
> > > > > > > Matt
> > > > > > >
> > > > > > > >
> > > > > > > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > > > > > > ---
> > > > > > > >  lib/pciids.h | 62 +++++++++++++++++++++++++++++++++++++++-------------
> > > > > > > >  1 file changed, 47 insertions(+), 15 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/lib/pciids.h b/lib/pciids.h
> > > > > > > > index 23f349f65..4736ea525 100644
> > > > > > > > --- a/lib/pciids.h
> > > > > > > > +++ b/lib/pciids.h
> > > > > > > > @@ -717,37 +717,66 @@
> > > > > > > >  	MACRO__(0xA7AB, ## __VA_ARGS__)
> > > > > > > >
> > > > > > > >  /* DG2 */
> > > > > > > > -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > > > > > > > -	MACRO__(0x5690, ## __VA_ARGS__), \
> > > > > > > > -	MACRO__(0x5691, ## __VA_ARGS__), \
> > > > > > > > -	MACRO__(0x5692, ## __VA_ARGS__), \
> > > > > > > > +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
> > > > > > > >  	MACRO__(0x56A0, ## __VA_ARGS__), \
> > > > > > > >  	MACRO__(0x56A1, ## __VA_ARGS__), \
> > > > > > > > -	MACRO__(0x56A2, ## __VA_ARGS__), \
> > > > > > > > +	MACRO__(0x56A2, ## __VA_ARGS__)
> > > > > > > > +
> > > > > > > > +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
> > > > > > > >  	MACRO__(0x56BE, ## __VA_ARGS__), \
> > > > > > > >  	MACRO__(0x56BF, ## __VA_ARGS__)
> > > > > > > >
> > > > > > > > -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > > > > > > > -	MACRO__(0x5693, ## __VA_ARGS__), \
> > > > > > > > -	MACRO__(0x5694, ## __VA_ARGS__), \
> > > > > > > > -	MACRO__(0x5695, ## __VA_ARGS__), \
> > > > > > > > +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
> > > > > > > > +	MACRO__(0x5690, ## __VA_ARGS__), \
> > > > > > > > +	MACRO__(0x5691, ## __VA_ARGS__), \
> > > > > > > > +	MACRO__(0x5692, ## __VA_ARGS__)
> > > > > > > > +
> > > > > > > > +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > > > > > > > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > > > +	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > > > +	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
> > > > > > > > +
> > > > > > > > +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
> > > > > > > >  	MACRO__(0x56A5, ## __VA_ARGS__), \
> > > > > > > >  	MACRO__(0x56A6, ## __VA_ARGS__), \
> > > > > > > >  	MACRO__(0x56B0, ## __VA_ARGS__), \
> > > > > > > > -	MACRO__(0x56B1, ## __VA_ARGS__), \
> > > > > > > > +	MACRO__(0x56B1, ## __VA_ARGS__)
> > > > > > > > +
> > > > > > > > +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
> > > > > > > >  	MACRO__(0x56BA, ## __VA_ARGS__), \
> > > > > > > >  	MACRO__(0x56BB, ## __VA_ARGS__), \
> > > > > > > >  	MACRO__(0x56BC, ## __VA_ARGS__), \
> > > > > > > >  	MACRO__(0x56BD, ## __VA_ARGS__)
> > > > > > > >
> > > > > > > > -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > > > > > > > -	MACRO__(0x5696, ## __VA_ARGS__), \
> > > > > > > > -	MACRO__(0x5697, ## __VA_ARGS__), \
> > > > > > > > +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
> > > > > > > > +	MACRO__(0x5693, ## __VA_ARGS__), \
> > > > > > > > +	MACRO__(0x5694, ## __VA_ARGS__), \
> > > > > > > > +	MACRO__(0x5695, ## __VA_ARGS__)
> > > > > > > > +
> > > > > > > > +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > > > > > > > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > > > +	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > > > +	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
> > > > > > > > +
> > > > > > > > +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
> > > > > > > >  	MACRO__(0x56A3, ## __VA_ARGS__), \
> > > > > > > >  	MACRO__(0x56A4, ## __VA_ARGS__), \
> > > > > > > >  	MACRO__(0x56B2, ## __VA_ARGS__), \
> > > > > > > >  	MACRO__(0x56B3, ## __VA_ARGS__)
> > > > > > > >
> > > > > > > > +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
> > > > > > > > +	MACRO__(0x5696, ## __VA_ARGS__), \
> > > > > > > > +	MACRO__(0x5697, ## __VA_ARGS__)
> > > > > > > > +
> > > > > > > > +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > > > > > > > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > > > +	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
> > > > > > > > +
> > > > > > > > +#define INTEL_DG2_D_IDS(MACRO__, ...) \
> > > > > > > > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > > > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > > > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
> > > > > > > > +
> > > > > > > >  #define INTEL_DG2_IDS(MACRO__, ...) \
> > > > > > > >  	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > > >  	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > > > @@ -782,9 +811,12 @@
> > > > > > > >  	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
> > > > > > > >
> > > > > > > >  /* MTL */
> > > > > > > > -#define INTEL_MTL_IDS(MACRO__, ...) \
> > > > > > > > +#define INTEL_MTL_U_IDS(MACRO__, ...) \
> > > > > > > >  	MACRO__(0x7D40, ## __VA_ARGS__), \
> > > > > > > > -	MACRO__(0x7D45, ## __VA_ARGS__), \
> > > > > > > > +	MACRO__(0x7D45, ## __VA_ARGS__)
> > > > > > > > +
> > > > > > > > +#define INTEL_MTL_IDS(MACRO__, ...) \
> > > > > > > > +	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > > >  	MACRO__(0x7D55, ## __VA_ARGS__), \
> > > > > > > >  	MACRO__(0x7D60, ## __VA_ARGS__), \
> > > > > > > >  	MACRO__(0x7DD5, ## __VA_ARGS__)
> > > > > > > > --
> > > > > > > > 2.45.0
> > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Matt Roper
> > > > > > > Graphics Software Engineer
> > > > > > > Linux GPU Platform Enablement
> > > > > > > Intel Corporation
> > > > >
> > > > > --
> > > > > Matt Roper
> > > > > Graphics Software Engineer
> > > > > Linux GPU Platform Enablement
> > > > > Intel Corporation
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
