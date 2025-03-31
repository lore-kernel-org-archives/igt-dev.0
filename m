Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65729C36014
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 21:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDA310E4A4;
	Mon, 31 Mar 2025 21:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIzhJJMm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539C610E4A4
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 21:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743458189; x=1774994189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zw6NpujOkKTZskyEx5zwIG55SZZCZitGBzdx34Un3SI=;
 b=OIzhJJMmVulxiCg6SLD+sUKFpg8+bx3tt+WEPRcXvrMi0LlACjJXRZVZ
 rzfIcjODygjTv+4BtscErCgEbcO9NmxzLeq/Cs6lkko4Fq93ddPMCqLQk
 d6L7JXm5o8ZAfbuHpU2MIY4NlmaPE0scLjODcRfRDj90koUgVDEz1lkg5
 ulmy5sOBZ47YJyEAapGOQmz3Add6P2GVVZuoMx8nKuk6WQmu2Do+OAFog
 1nf3yBmgKSfW8hFdB1A1VV4YuVbBu/+lo9aEQ5B7fHFrTXq0lOXnVMMsa
 FFOAUDRukVzCg5OWyu8EJmXHjjUBHRhdWrq6dOPFXF7qtso0e+W/8ELAI g==;
X-CSE-ConnectionGUID: fSlU+eUTTEaqhcDncg2T7w==
X-CSE-MsgGUID: bxgIe4SCTkCt07g30LS2Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55421530"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="55421530"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 14:56:24 -0700
X-CSE-ConnectionGUID: EAXt8uKRTWGdY2Tim4tHBw==
X-CSE-MsgGUID: 3iWQnY7HT+iMJjuPiUxJvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="130312271"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 14:56:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 14:56:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 14:56:23 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 14:56:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZUq10Y+rNYdP6QSfrvJYcGw2PhcvVl0E7JnvqneCqwc2lXnlWbZOV18ezzzX2RFv7F97EZK7d91AEWXgj0pL2oacjeqa8RvF2dD9vX5JhAhg+ygPO2RXW6iXVJbVqq0CvVtIDEjloornDQecxo2qUki01IFJt9O+4AeSuv+FvdkZOjANLDMDWIrM26LvKvyw2zxDIrEJflvG5MuBSE+3QWUFSmaS7YbZ8VanzfnExMKQE3a530Bxq2BYD5k42n0rISJc45im8pUvO0L39OXCWnTz1wckW2vneDYrckzhB/8VzZmbl7IlrFBTSzNusIBbFLowGRuKiYfJeFFz8Abuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGnynrWP7Jooy7MdmpFERsMqXRmoWCUFJC/71UoqBlo=;
 b=m8phT2ID0Dse8J67gGZ3ExrV+2IagQ+6qapaPQshOE9UoAZMoKca1BgyFM2jH9DC0R5aUtCO8n7730Cge8sti+B+sC9r0r/hUUL8QsQcRYGtLnEmSpnDysuJR5Lm4r1lFvT8Fodf12jjRlcAczx3w9szl0QJgDYDO2qq65S5hNE0Mm2Kr4c86Rih9RaIrB/4KmxR3yj2Igcf2a2lciIPzsHAIzCnDmNhAcWGLeNJQ+ZzpERPABUXHp0XaNR0AoPZcyH40THYRc0PseoKsGk/axjzbEOOFmlcMGGyS+900xte2bmS8QTcK1qEYLP5zfcAq6rno68ddtOUsTdh4UA3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN0PR11MB6133.namprd11.prod.outlook.com (2603:10b6:208:3cb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 21:56:21 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 21:56:21 +0000
Date: Mon, 31 Mar 2025 17:56:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <himanshu.girotra@intel.com>,
 <aditya.chauhan@intel.com>, <pravalika.gurram@intel.com>,
 <sai.gowtham.ch@intel.com>, <ramadevi.gandi@intel.com>,
 <lucas.demarchi@intel.com>, <kamil.konieczny@linux.intel.com>,
 <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH v4 i-g-t 0/1] tests/intel/intel_sysfs_debugfs: Unify
 sysfs and debugfs testing
Message-ID: <Z-sPgAOCPWBOz0dt@intel.com>
References: <20250331180538.57393-1-peter.senna@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250331180538.57393-1-peter.senna@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:303:8d::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN0PR11MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: f35931b4-c3ba-400f-4941-08dd709edf95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0msK8H/S3iuOKWVni7+p4Jw9M3QHBV2ghA+nvU9p/9ak3BszWCtfduOfYn5c?=
 =?us-ascii?Q?O69PW1SbUzUjZcmwcw1yJPQ9gg/Ch8CJdoOUNY+OQR3TLS2hf9VmB4bbJVsY?=
 =?us-ascii?Q?NyDWo/aqU/pRSWq+G2KaTNZl5oCiY1rA1nW0PrtZWkSatcaarqqTOv4pHOL5?=
 =?us-ascii?Q?A6s8GtqMQMlLQrC6DYZqou4PNMCYSu0bRWoxE/y0GibJYP/CagORsHanHMkL?=
 =?us-ascii?Q?H0Lvx6Ue3OXDqPo/O848EFtR3kG3W0YSMHrpSunornylw9ew2BfSkOVl5HK0?=
 =?us-ascii?Q?kPi1j+MN+Swzo/Bqrj4A7iwkbxMTxYEuRHO/IZI00o6n4g39WtqPBD6Arkn6?=
 =?us-ascii?Q?dSky2n2bWx+r8wLQMgBDWwQ0Z7fKQt2ucGLViLnZg1fqyhH9qtSpZKgC1uMp?=
 =?us-ascii?Q?eDpoNTitcSA/nhZxP7QuFoyxb5IMmHwdmEB1R7DU+Xdn430M4KRv1OijVTk9?=
 =?us-ascii?Q?oy8xCIgfFOp+nUaA+yr54gaTZD5/5avHPcicjmhozqdO7aJY+dJ4/7sHL657?=
 =?us-ascii?Q?YbpxZxbUGpZvJ5+IgUvhOF/2PVtnpaG4uXTr1QL2UcNzKMLL/s/74TWaKP0D?=
 =?us-ascii?Q?UNmikvuE135Mymo+Tckz8nb3D8S3UJThEev3pv7mPLIMcdowBsB9sbbuMBph?=
 =?us-ascii?Q?fs3v4bKP4OQYWZCZ0XdeawhwmkvFpBdRZUi9Ux2ULVVjZlDD1rc3k2tFgkd4?=
 =?us-ascii?Q?PrxkbTWE/TMCPdEJJN0Evxkv+tzVx0z49wd41VfEqdesjiU588d2iEX4qLrQ?=
 =?us-ascii?Q?a8b1N0q7tN0TFfl2Fv2ajHlF9e9u9gUe2YnviKmyY7S1n3jPZ3qQRLvYxTsB?=
 =?us-ascii?Q?BzmJZZhVDcjljNej+1lETUnfAl+ZOZZ8BJiU73No2bQBs6IvijdhBWAcbiNB?=
 =?us-ascii?Q?CwsUixaK+N87OFR30IJpUIhKgfXXymhgO/SB6lFMp6YaG7B86Obih8/7wTRa?=
 =?us-ascii?Q?ymO7BOjVWQM+K4uWsw29Rpw8KjJ9Qm9INvBbLymYWxyV3zs/aFVPimofYL7u?=
 =?us-ascii?Q?pSWuwuVVNf6KQ/aiYTS4TDf++gh2lK1eMETUXIbQ+soEaQtfFlHbtFm6wFF4?=
 =?us-ascii?Q?URQMM5Ye/+kw0v/avFslQ3kyLBazH4/lV+7rq4F0Arhi7RaI/kdpAijW33xx?=
 =?us-ascii?Q?nzoCMhuKPkEFt7uxO0lOxzCy8Hb/yyktBhx0gmRNtGp20LiWGMPxhBkCgcrh?=
 =?us-ascii?Q?hXrj7kHTsjxe/WIMnjY9kFfTyOWDC5LbSg9bouE8tTEmmi4Znb4ySBgrKQX4?=
 =?us-ascii?Q?CA4aKpRhhd4ucgYYELifmKKsMejQCAkTiovEbf74eDZl4+0pPcx6BhhhTVyj?=
 =?us-ascii?Q?2JbatmpX9F86czKo87Pg+J/UwozCHJszQSXTUtVdt4vOJqGl3upm/Z4Keb/G?=
 =?us-ascii?Q?PdWiNH5KV1g0URHDk0zHgVyidL9k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nsNCKy0DSu7QDELn6JV+oqnN77iakYOBq1vGEcI16yek+aMrk8zC2BrZnXBd?=
 =?us-ascii?Q?XZK7YHgvdfIkYYhl6lv7TwSaN/hAHA2ifXaUbdudxrsJFgVAHCn4KJUHJ4cK?=
 =?us-ascii?Q?vjI0OlmULsQtFchoZIByU9wRADQqji4vKTpsF7nZy13wyjP2AHUXof0KSBs7?=
 =?us-ascii?Q?KaIqgouZkver+ph8hPM8BLA2riQSRbekBPydv3WpCVJVWpC/HNCCCtI4NX1b?=
 =?us-ascii?Q?fjG2EYBUyGZkmBjrGjBEQe0GVgxfSaav0PmiE45hPkR3sl+dhSBojDTfL5xq?=
 =?us-ascii?Q?UABd1k+nJsLQuDtRCClyW19jpF3FtM6vU6sEsV1h/LAxfcw8yca5Ffy+gyhs?=
 =?us-ascii?Q?k0Tg2KZp2C9MV5IrUsrAZH+Mrt/e8kalPhPLI93ACMVIR6bTVifs+2nZmcVY?=
 =?us-ascii?Q?igCfc0ZgpvTCH/8F3Yxx9tFoOEwdxsOmePg2Th/ghEzacQaAa6QDlotM8rHy?=
 =?us-ascii?Q?ekO+5BUNA5uSpRSjVu+FOeY310kQazJIfAj0dYnvCSZ7hihe0ta5f3hw41VO?=
 =?us-ascii?Q?CFoxjO6SOvyjW78NqoLFEiuhdHVejKXTMkBXz+v8JElkDe4HkynUUY4RfMd/?=
 =?us-ascii?Q?7fY4DMpHvoaLhcT2s2dViW2Yu3eZnmBTShlSngYk0AXDBUDUuMJLqEbnXOSY?=
 =?us-ascii?Q?6ijmWA4FGRWmFAcDamrjy2D1d7ei8InyGFTxd965+SeCiwxli8G3rTrEmELf?=
 =?us-ascii?Q?kasUl1oQmEIsbYqOkFaQoywRAxcdx/v2+lKjWhNhGEAQFMGDruYWX+HOydQF?=
 =?us-ascii?Q?I1M6XoIQYMWB4qa9tRNRhbyK522zt4BY7svMfKkZ0uWpq/OTO9A5XWqtqUQf?=
 =?us-ascii?Q?ZgVE3hPOQpJqf36go/KZriykMjhjsJcapI0hBUv68S+mIi7jgPLKCIzLypnt?=
 =?us-ascii?Q?24UA2NklGLPXtnu1T6lC39qJdxsZy/jeI4nDOGkUPzB+vxFRWg3GUvgEp0pv?=
 =?us-ascii?Q?BCMePwYpz6xEWT1fXAZLoBheTkcrKzHgfQzJKFitpt4JY6GWcc9SbB7BR/rH?=
 =?us-ascii?Q?BJF0658z8M1wO9bdY6e+F7cIJAGP94tCQLYlG2lZmXgzynnQDZ1IBaseexmT?=
 =?us-ascii?Q?URQOacmJ+Wtt0eWYpz77hHqeF+rmnsWA3bhqQLMjYJzT+PFZsS5FxtQAne5v?=
 =?us-ascii?Q?6NOD8PJlVta/1d7DbDNDqzHrNCCIhYoDis9fT5KmS2PagehR5POiD8e4eZM9?=
 =?us-ascii?Q?g2ocuWTlfsOvmHrnwZP+qyrWPCoLwISrcXoAdJ8ebFLZ7G75yXN3jM/tc19A?=
 =?us-ascii?Q?Uiua5NyF/1kY7dM2uASJSvtWsinxw1pFnoxo8YAMd9W91ttMb+iP0hDNHqWm?=
 =?us-ascii?Q?5kc68rzBy9/ggACft9l9c3viqyXCeLZ9UnC5+A82e5mcxiFNZ01ajjDxyTGK?=
 =?us-ascii?Q?Q5zPJjY4rEvjzhxDPj7B8yJc9c+vTRlqqCW6uGeRRksOB4O7iaPaSAoFcNPN?=
 =?us-ascii?Q?9vuu6/ihq6+kFGniIE0+1FbaDUzZRoolU1ao56HsDWRQ3DdquVWF358RV60r?=
 =?us-ascii?Q?XmWbxP/KvSPKfr4bfhRtV16uvb7siMTGLPniuD9kP5IHNAzgkGN6lzdt9hPc?=
 =?us-ascii?Q?xRrQYZFNKQj4UehnyrTGXVXyiTvEjUWJbjkL18YOY3EhpzATltym8H72Galy?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f35931b4-c3ba-400f-4941-08dd709edf95
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:56:21.7057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxBldQBgD5VhtXMIRMZTFlQWv70SQ7WwbOTfip6AnKBzZJs4T92H/Adc7a0Og6SBdnd1NxPhSq+k8+wpDvPPzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6133
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

On Mon, Mar 31, 2025 at 08:05:35PM +0200, Peter Senna Tschudin wrote:
> The existing debugfs_test scans and reads relevant sysfs and debugfs
> files, but it is limited to i915. Meanwhile, xe_debugfs.c provides
> similar functionality for Xe but has two key gaps:
>  - It lacks sysfs file testing.
>  - It does not attempt to read all debugfs files.
> 
> This patch introduces intel_sysfs_debugfs, unifying both tests into a single
> framework that ensures comprehensive coverage for both i915 and Xe.
> 
> Follow-up improvements
> 
> Once this patch is merged, I will submit a follow-up to:
>  - Remove the redundant hwmon-basic test from debugfs_test, as
>    intel_hwmon already provides full coverage for i915 and Xe.
>  - Remove both debugfs_test and xe_debugfs.
> 
> The removal of existing tests impacts external test lists, requiring
> updates that take time. By first addressing the test gap, we ensure
> complete coverage while minimizing disruption. The follow-up series will
> then focus on cleanup for improving long-term maintainability.
> 
> v4:
>  - remove the 5 seconds timeout to read each sysfs and debugfs file

Thanks,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
and pushed

> 
> v3:
>  - rename test to intel_sysfs_debugfs
>  - fix copy paste error on commit message
>  - expand Cc list
> 
> v2:
>  - renamed xe-specific functions with the xe_ prefix
>  - created two igt_subtest_groups: one for i915 and another for Xe
>  - prefixed each test with either i915 or xe
> 
> Cc: himanshu.girotra@intel.com
> Cc: aditya.chauhan@intel.com
> Cc: pravalika.gurram@intel.com
> Cc: sai.gowtham.ch@intel.com
> Cc: ramadevi.gandi@intel.com
> Cc: lucas.demarchi@intel.com
> Cc: rodrigo.vivi@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> 
> Peter Senna Tschudin (1):
>   tests/intel/intel_sysfs_debugfs Unify sysfs and debugfs testing
> 
>  tests/intel/intel_sysfs_debugfs.c | 498 ++++++++++++++++++++++++++++++
>  tests/meson.build                 |   1 +
>  2 files changed, 499 insertions(+)
>  create mode 100644 tests/intel/intel_sysfs_debugfs.c
> 
> -- 
> 2.43.0
> 
