Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05287E9B24D
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 11:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A663110E29A;
	Tue, 24 Feb 2026 11:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UP2q6Dll";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3EE10E29A
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 11:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771932104; x=1803468104;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IAFo/m5pG+aJxSnJXt5oyKg78Ien1oMihdxP9u4+iGs=;
 b=UP2q6DllTdBcTLT/FSCyVb8/R1XKEP6qKZrFA5m2EaG0Zx0PSlb39AWS
 pEURGKAJAp+Z3nlWgszoUueAEsFHLUw0eg5M86P88D9do/tHPYR4uIDPh
 8EdARnJOtoDwUi2cVNWyc5RADHo6UWQIrE84GfnzuqH25DO1NUC0Xqr9O
 HapgRh4DZAdxpBd6cuGutVg19JB6i7UFNGg4OSk6vCL3R8R22fTZG74M9
 kEMCGQCi6J+k0KmUd6WxKM+jPEG13KC2DGjUSewssKR06ooF3oFANtYv+
 uvFhxXJyenkqC36ObJvIraXuqW+eGAsrwLxusv2DpiDRNWCDKabgh4Sox w==;
X-CSE-ConnectionGUID: wMsL7nhlSzWuUBbONO2yeQ==
X-CSE-MsgGUID: CWTft2RoQC6SF1TZE7eryw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75551469"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="75551469"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 03:21:43 -0800
X-CSE-ConnectionGUID: AOm+vrowSCSvCbDSAS+rqA==
X-CSE-MsgGUID: 0QQBV65wRu2UAZioMHabMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="213697523"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 03:21:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 03:21:43 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 03:21:43 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 03:21:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDNf5q/SFz0B5bX8PXQPAQkB4Hvj6C8jD8ZgyRSFc0CDp1yZJY1tpR9gMpYvV7B1h/4FPzXxo1I1j50FS/s5TNnvlkbQUJz/l19cBLCL8H/W/P7p12I9/bMGX2QFoYqRAgwezgZ9UKo4E9x4G2WvIGkMSSHpY4mQ8N6qLPq68Lhfo0M66zuiuAbitwS8/7HAou46OZhVs3c6ilrCbxo5LQ75wlr9bX6w732pYJ3A9ZYAS6Q/3Rqj8j+J8SxozbCvk9vxC2wkn+IJLy/RdO3+KvzqiVB2BQMmK+1U5WGX/RJCQXAX8xk1ZyzZPBjBT6wKIX7Thu21m0/eifysjhLVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xsAx1rLcT2eL17PdwZomXL/hLZ9g91fX3Ynjv4fHIM=;
 b=Sg12xsM7DOML7tGcnYcd1+Rp0FMV816UukFZ6zJZ7qwmPjs2hW4l87WhoFTH+r6b2AANiuWOaUU8l8RIy/VRXFNVzPF1nz+nW0Ulvsy0jeI4LQfWkNCQc6tVhRcIwMX+YqhHq1n5nJwbP0LFTocuA+xzsyC13UaLiTTa4eXqeSdi+Pe/wpbgwfuugC43f0LkS2Z2wl1VjDKLhkw+4I28V6GP4Sr7SkUQ6VN6PzCjRHpDCicWPnD3tzq8JJdgGqV+3gb7HzhmudnvTlp0R3YU1dpFr2FFeA1nMDiCRo9EjuSgiqAJ8ksqQf2ypvRHWMhIUVNASuRMIQP5BTDV8YnbXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 by MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Tue, 24 Feb
 2026 11:21:35 +0000
Received: from PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::84fe:e701:add1:4de5]) by PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::84fe:e701:add1:4de5%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 11:21:35 +0000
Date: Tue, 24 Feb 2026 11:21:26 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v3 i-g-t 2/4] lib/igt_tools_stub: Add igt_load_igtrc()
 stub implementation
Message-ID: <u7ddawkpnjugknbsgsn2wmml4jf6yuut6ciefeqzed5tthikyg@owvfa6v6lyth>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1771510028.git.sebastian.brzezinka@intel.com>
 <763881965f67ba856f33bfd5c351e90a80d0ae60.1771510028.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <763881965f67ba856f33bfd5c351e90a80d0ae60.1771510028.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA2P291CA0039.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::25) To PH0PR11MB5064.namprd11.prod.outlook.com
 (2603:10b6:510:3b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5064:EE_|MW3PR11MB4555:EE_
X-MS-Office365-Filtering-Correlation-Id: 949558e8-447a-4d54-798c-08de7396de9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bC9pczlvMmI1VHBrMGNGK2pDendWRFk0T0pVYnlsMGtENGhLSG9oMHFRRUJk?=
 =?utf-8?B?U2xDV0dicU8vTUVnbllHenM2Vys3ZndNM2lCUXEzT0FCR1pDQzdQaXN5emNX?=
 =?utf-8?B?Sy9zK0JPcnN4SlgyY2RHOGdya0ZFcjJEU0puWFJmcW12alpoR1g1VlkrN3JS?=
 =?utf-8?B?L0c1NUZiL2RXaWRhWmMyWGdNcnBEUG1hditwb0N3b3k2UU9YTFp0bkVQd2No?=
 =?utf-8?B?elRjaStVd0t5S2FTc3RwUHNXTnlGYWV4Tkx4TG9yaVI4STBWWlZzcWRueWhE?=
 =?utf-8?B?bHZzR25ReHZ1b0tpOUhSZ0VYMXZabExaQWxaQm42Q1pjTEovbGVmOVNCdTU4?=
 =?utf-8?B?UDRVeS9HUkp0RVVmdzFPbmZsY3VNSVNhVDFKRlJjQnRNbitnemF1K2wrWCtj?=
 =?utf-8?B?ZXRaMk93OElBTnJIYjJ0ekhUTkprUzBMZUN0cExYdTFVMHZhRlhjWDlzdnQx?=
 =?utf-8?B?RlIyRjhVSlB3TjF6dzR5c1lDenFaVStOWDdJVW9Wak5WSU1RRGNlOFN1V0tI?=
 =?utf-8?B?YUVRMjZpbi8vS3RoRVpIYmRQbkx3ZUhCcGtWdUFPajZQTTRxUXc5LzJQTDFR?=
 =?utf-8?B?c0s1S0U1c0hnMGE5QmNMb09vUjNjYmYwZ3JuK0QyR2I1L01haE41R2Rqc2dk?=
 =?utf-8?B?MElIMk40dTRDbnlqTGFuM1VDSFZqZWdpUEVva1VrYzZSVWFkQTN6bzN1blA4?=
 =?utf-8?B?anl1UGQvajRZT0gvYWV4cjVlL1BiS29WU2UyQWlqWHlnMHk1Q2lHVCtmNndn?=
 =?utf-8?B?cm4zMFVWZUExZ3hKbUpwdUVOZmRSVWlscXZzVmdRSFlkdXlLdmNOZFBSdldS?=
 =?utf-8?B?Nml6VjM3Y0laSWVkb05aWXpaSklxU2plVndEdzNwdExuUW9SS3JpeHVXTnhX?=
 =?utf-8?B?K3MxMXVwa0prbGF3RFB1UkNVYjhXQzB5VjkrRzd6bHd1aWpLa2k5bjNrUGNp?=
 =?utf-8?B?bm9kWjdTTHNZdW1rZ1IyY0ZTcVB0QUd5Q0dGcjlCRks5TjBHaXlZY3o1eXVO?=
 =?utf-8?B?WDBPdEZSZGhzLytFNnQxNXBQQzZ4QzRIdHlERXFJL2ljNUlkOHIvLzB2ZThX?=
 =?utf-8?B?TUxXTXdaV20rOUdEQjUwZEdYeFVjRS9qT25IS3VIZFRyNHRZamVtWUNmQkYy?=
 =?utf-8?B?NE9yQzFGTTYzNGptcXJGbU05M2l4d3lEVGlpQ3NPaTFSZk8reG95dDVldkg5?=
 =?utf-8?B?QzJaVDdoWmR1UFlpbXR5TlZRb1ROaUQ5NXhNMndtSEp2UytWdExpU2pnSVNK?=
 =?utf-8?B?MDJyMHRXbjdMNzJ2dUwwMXpucnA4T3hiYW1IeFJFbTl0OWFVc1JRREdSNmZl?=
 =?utf-8?B?TzM5NEtGdzVFN0gvaDRULytZWml2NDVvZXljeXpMSmtLcitsKzdYdjRFbFV3?=
 =?utf-8?B?eHJpeFFvNXJ5UDNSMEpaUzlwOTlXN3YzK2lWODEvOHhmNzZJVzVSOHk5b0Y0?=
 =?utf-8?B?UUs5dlRDU2NCaS9kUEtRSUY0UVUvVG9vbEdJcENLQVdibHR2V1ptTFQ0QWxB?=
 =?utf-8?B?L2ZBK2dZczNpQldSVUJ3Um5MMDI5THdqZ25telpqQTRhVko1Z2dQdGRGOHJx?=
 =?utf-8?B?TllnbnJmMEI4Rk9Ici9uSTRxVGE5VTVhREdVUVdoRm1iVkFsbkNYejljcGhF?=
 =?utf-8?B?MmduRUdsOXEvcUt0WEVhZENQYkZqZnM3SHY3VFE3OHBlTUVZcVBrclNYT3ZV?=
 =?utf-8?B?a3J5T0kxYysxWStTckNqQ0Q2eE1DTHpCKzYxZ254S201eXZvbWFLTEZCcC9Y?=
 =?utf-8?B?dEVjeG9hT3ZvbUpHdTBLOHpQTk1GdkxPeG1QL2pUbVZtMHRhVmQvVEtIT2ZZ?=
 =?utf-8?B?clk3VGl4UlRwS2dPb25yK0tibXZTcStlSURIbGw4eC8zWDJLOXJrTU1wTnY3?=
 =?utf-8?B?SUxlWURLS0ViTkl2Uk5EbzJIb2JyUG5UOGJrSm1MenplNEhzbmc1TFZRdmQv?=
 =?utf-8?B?THA0NTdUdk40OUNFblJZM2RsUGlEU01zcmdTZ1FsTk8rTHpNektNem9tVVRq?=
 =?utf-8?B?VUtMc25iV0ZiZjJxaTZoeWVsS3Vtc2U2SUUxNnl4ZTJaOVBaRk9yMU1pYTlx?=
 =?utf-8?B?Nkc1UGFRSWtNUU1KT2YvcURVSEVFUUtMbmd3eHRFYlBIOEZ0aU5DMnFkZjVN?=
 =?utf-8?Q?HOsI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5064.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1hZMHJQTGFLajJBU29LU1BxWFFSUjJEOVlZc2RDMUNRM1I5KzhRMWtoS3E1?=
 =?utf-8?B?T0lzWnRrWldZZWliMDRJOWJibnhTdkNGWGNTNjlidGlubDZzR2hGZ2laTlk0?=
 =?utf-8?B?OHBqSzZLelhJcTJqSzhXT1JVdnBQVU44bG9JYS84Vk9xVHVqdDZjcXhmVk9w?=
 =?utf-8?B?S1Q1M0ZnZmFSd3FjcnE1UVcvcnhPWiszWjhPdmtrRk4valZ0OGJZekcwTkxE?=
 =?utf-8?B?TkVtbm9FQXM2dkhBWkhiQmhMcTJNaCtpb3NnMTI5eWxDVDdKOC96SVlHTG1h?=
 =?utf-8?B?NWVMZnhDTDR5Q1Z1S3F2LzNCWFNFYmZ5a0VNUzgwanhvT0o1Rm1pakJXNjYv?=
 =?utf-8?B?cVlFSW9HNlRXenV0YWh5UklMRmRPTnNUdXE3ZHV1K0hQdXNPMk1acWluRUMx?=
 =?utf-8?B?Q3lnOWJzQ2ttaGcxOGRrTWN0azV1TXZiQi9QR0lwSjdMRG1XNXBTcnVZa29M?=
 =?utf-8?B?UmRLeko5ZzJDSXQ5U3pnUzdpSE9Sa050M1Q1THpjN3FwTmdNK1ByVngxSGNV?=
 =?utf-8?B?b3dBQ1BtVlF0QzhWWmM0UlgxOVBod3lMMEh0Q2NUdWN0OWoreGxsdHJCalNP?=
 =?utf-8?B?VVUyVmsreDY2dkFDeDRvcE9JYy9OMVNrRWhGNnZKR0JoaTZUVEl2VE0vY3Mr?=
 =?utf-8?B?dHF2ak9ac24vdWVJZkZvdU96WlN4R0EvSEpPZDErOHNZYW5TVHI1SitRdVVH?=
 =?utf-8?B?OXQvdDMzdU5taERGRnVxUzhobHlxbE81cUJyWmdZNm1WaU9HdVVjaC9PVEJs?=
 =?utf-8?B?ZlAwbDJGQmJ2c3h3SXlJVkg1M2NlU2tWWXNkeXdZVEdKUERxek1hU2d3T0o5?=
 =?utf-8?B?WUpVVElXQndDVGpjRU8wR0UxaU8zUldLNU4wNU96ZVRteFRSRGZXN2ViU2VT?=
 =?utf-8?B?YlYrNFoyWjI2aHlHVkdVOWpWT1dkWGU3RW1NVXlXeWVyUitFb2xVaDJMSGlU?=
 =?utf-8?B?RlBUbWJGUmxJTmgyOHM4Szg0SkU5eUpBWW9oNnUrYkpTbVF2bGFSV2JaUGhj?=
 =?utf-8?B?alJwb1VScUQzdVFaNHJlUDU5YWZLT25DWlRUZGFyL3g5ajZTbm9PYUllV0Qz?=
 =?utf-8?B?NXcyK0wxZW84di9WMXB5WDZlTHlETkJQeWtRWlcyc3lWeTNEUEZpSHpEeXJZ?=
 =?utf-8?B?VDJOMjF3L2lKWFpVV1dobmt2ZENXU21NMGh4VFBxSlpyRXhLVitXVXNESWFR?=
 =?utf-8?B?cFdjSWQ0WTdBZklDdXp0cnVKWTdEOUVveUQxanU4dHBwdVZDUzlNSlNpeHZo?=
 =?utf-8?B?akVsMUI3aUZseTBPRE1rcVB5dmt5NndQRWlqa080aDZERElWRzRGbGEyZy9X?=
 =?utf-8?B?ektnWmlLQmxXZkgzODFFSTBHWDBONXFGNmxXL2tPVVYxRFk1WDlXT0k0WnN6?=
 =?utf-8?B?Nk9UUXF3eW1jS0FwUVhoS0hJai9pMWpYZEV6c2wvOTUvNnkzYlRDTHZPSElo?=
 =?utf-8?B?NGUvQnFsaVVYczlOQnJRdGR5bWFuVG1scWNvYmJaZ0VnMXlCMzdxQmlSb0V3?=
 =?utf-8?B?cjNMU1FqUklsZlVrZmpmSnZQNWh6M2pVWUZPZXpMS1U1ektOU284UnJhbEJn?=
 =?utf-8?B?UlFsQmtEWnordDNmdGQ1dWpaNTVCVnVOaTNLTDB6d3djbmNxL2NmTUFrbkU3?=
 =?utf-8?B?NEZuODBheCs2TGl1K2pMdmhXN09VSWFRbXhBeSs1VFJMK2RyRngwc0lXcWJV?=
 =?utf-8?B?ZG9GNnJ2SnVtdG9pS2Nsblk3cEZ1U2FsLzZ1ZEpxNVBVcGs0cEc2TkVRN0lR?=
 =?utf-8?B?Z1YrclN4SlArUThlYUdpRDUrUWplZjRGblZGRFJ5QThVVlFNTWdrbXcrdnR3?=
 =?utf-8?B?d2JuMnNJdzhTakcwRFNubVZrYmlxZVZqeG4wU05tak9SKzQvU1lKTFBoTzcv?=
 =?utf-8?B?d1owK1N1L0UxT2V2NXdRVWRSU2g1TnBlQk9ldkNiL0Vudnp4Y2phNDhEWUZx?=
 =?utf-8?B?LzUrNFdUOFUrQ2p4RzdUZXlmVVJXUEJiUVR1ZE5ma3VUNGVUK2JiYmF5OENM?=
 =?utf-8?B?bGUxc3BKcnV3bEJWQ1dZb0V1aE5JUFNpc0VFOWt3N0FZdnE0RWU3WWFqeit6?=
 =?utf-8?B?Ri8yU2FEWm1OVVN5eTl5dElYTE1QQ2p1dU45Vk5ZUTdUN1ZqeGtoc0JPYnlK?=
 =?utf-8?B?MmNCQVFIWXJEbmhEcHZCV3g1dThpd1IrNEdqZVlWdTZwbEJkNy9qYUdtbHpv?=
 =?utf-8?B?aDVxeVM4cWliTjY5WXZ3a1ZFKzduWk1FSUxZUUxLczhPRFhaTU9LYjl5eWdY?=
 =?utf-8?B?QzA4d1djeG9xaEpXdHUrWVpzYllXQXRYOGx2aFpyQzA1NlFTTE9nZ2RLR1BG?=
 =?utf-8?B?ZXRGWkdodWMwN1YwUU5wNW9EUkZ6WUtscWFrQVNxWTJzZXdSUGRYcTl4ZUhm?=
 =?utf-8?Q?Ufd6qn5cD7g0uDRM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 949558e8-447a-4d54-798c-08de7396de9b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 11:21:35.1375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brW7GB3b3j/YiteTcnRXtwVT8tAlyu3qaxDf9gcMBoEhzH8usYiswgyNvSAQv+BXy6pgWoNlHcF/6vxX0KLqM+gdwQ79v2m43WTy99b5eC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4555
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

Hi Sebastian,

> Add a minimal stub implementation of igt_load_igtrc() to allow lightweight
> tools like lsgpu to load IGT configuration files without requiring the full
> igt_core.c and its heavy dependencies (Cairo, Pixman, X11, etc.).
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
