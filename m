Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B95CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 27 Aug 2025 13:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A360710E817;
	Wed, 27 Aug 2025 13:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mi2/1mzH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EF310E817
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Aug 2025 13:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756300623; x=1787836623;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L9QLhaRWN+YA8fr+5UuYKQPwGoMhXON53SCzqp582rY=;
 b=mi2/1mzH+Gl5Ovi8FQx9OaK/nb+E2ixeEfUECLngs04AJDxbvqZ5SKr4
 0kIod1zbKAsc7vTEbYF6E3MOEbpTED0pNqyrdf5Z5EM0L1o87KrB37l5W
 rcILS6vLTUfzTQQVV7Eahxrtd/XDua91ihrLxUhV5YK3cal+IpdTNvqH8
 CsaHAAGShlgkUG3dVltZgl6wQLLHxX2UfF2EkmHx135XPjgFqCypwS6Sv
 FAvnJezADtl26VYx0Qb5EbhcesPY1dEYP+O6xhO5EESoNtPio7i0OZdxs
 FI6ECqgemfKxCLfq5+7k5195iXLTFGtg/Ix9ED2jSrA0B0VreylPe+xGE A==;
X-CSE-ConnectionGUID: rp9D1XerTkm8UEHuk7sTiA==
X-CSE-MsgGUID: EUS3FVTKRDeNxppzlm92Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69990259"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69990259"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 06:17:03 -0700
X-CSE-ConnectionGUID: paBqmXgfTD2jfroviEoGPg==
X-CSE-MsgGUID: kgXb8ODSS72OfjYp57tsfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169743549"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 06:17:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 06:17:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 06:17:00 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.54)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 06:17:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyH0Djo1ZY23uRrU1xhhpPrHmjPt4xzmP7KJxAroVmtgmgv5Y49lbkaHkv3JjMQRek3q8ddg+PnvDFLIERKHNqp9/C6YEExRbbv20ATTqOJsVAualgQG5ErT+Dtv5NeiulTcsU/JIAQ0PLj2oMR6qhH16+n3ecBg4DadCpBwI3d3zZKmGCQukhDPIFwCeTGkl85MymSgL7zHcEO+iKPIshMzAb8NULQG0nVBvfKHnkRjVFAD5xxsGa8pg5JNtRy1+9zyPvdhuEsQ18BuIZ/+NooVHO0svD+K2JOLObMGsbTwXS65QLj0XgyZ4X76/9/ScSjAObMDWsjqX3f0u/Ma+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0Su+dkxdQc/92u2PFDFmRlgs+TNTkWM04qGZQTA2ls=;
 b=OhcqDSW4y0zswgMfHaTgYsHRTvqcbpgJ2nKMnkXlEkQThTK4vVR8iTyp9nsqKkUrDmAutcvFILyrI0m8nYi/KugT+IM1LpcwwAYhzum3ZvVgSVifUFqqxB2FnvO8sDkwDPr2JBdmMwuuJjZmuZAWWtm9e0Csau8X7gH38IkfRrbQtrexPAsUQogUmOtRr3Oeb0LxK1UQ5AeXIbF9ihYM18GHDUnJxFEn8NIpppi+wIoHONgQzbHJzGYVeKnu/2pDGv3Hfmv0rmzi2BCdezPjDsXThLLaCNNGlPeF+FSnviNUVyl1FVkKf/b0C4Zek4G1ANuu4qmhcmd5j3iODRZwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH0PR11MB5877.namprd11.prod.outlook.com (2603:10b6:510:141::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 13:16:53 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.9052.017; Wed, 27 Aug 2025
 13:16:52 +0000
Message-ID: <1df1d1d2-310b-4c17-bdad-7b7fc8140b8a@intel.com>
Date: Wed, 27 Aug 2025 15:16:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_sriov_vram: Add test checking VF
 access to VRAM
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <michal.winiarski@intel.com>,
 <satyanarayana.k.v.p@intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>
References: <20250717090812.28628-1-lukasz.laguna@intel.com>
 <20250717090812.28628-5-lukasz.laguna@intel.com>
 <efe4389c-9380-45a6-af0b-157121595e82@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <efe4389c-9380-45a6-af0b-157121595e82@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::23) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH0PR11MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: 6569c3c0-12c3-45a7-cda4-08dde56bfd07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGp1cElSTm5uK2kwNEp3ZWlhT0hMUEJPU0U4d0E1M1ZJd09jQWFIOSs4U1pr?=
 =?utf-8?B?NWxRcmpTMXpTcUpNcEtGejlybnJDZGRPVTg2SytJMEVHZm5ZT3FlV3Z5RFFE?=
 =?utf-8?B?TXI1WWtKUnNkNjVHTnhqRGJFc1p3Zmd4dk56T2t0VFEwTmlaSlpwSVFOeHJh?=
 =?utf-8?B?a2lmRGI0d0R1RWdMYVN6RllCUHJFQXRpT0lOaUJmR1RwbWdTT29nU1pPUzMr?=
 =?utf-8?B?ZzkvdTQ3ellUWnMybHFjYXdLKzQ1clBqZVJ3SnZPRUVmbUN3Yldadi83T3Zz?=
 =?utf-8?B?Z1M1VGVsUTNNNFpEaWt2S3RrLzczS0ZvRXFDd040RE03UmFrTVRqYVg1TVRk?=
 =?utf-8?B?T245QWsvczlXbGlvb0NFVWpiRVlCSVV2RWJIVGdqcTdFb3pPZjh1RWh1cm45?=
 =?utf-8?B?ZGw3bUhKa2p2RUNtVGY3Y0ZaVEVNcThUK3Y1cEZ3NTh3a0hFV0tzeDRRemhj?=
 =?utf-8?B?YUZtMTJvS1JQQjhhZ00wUkp6Tk5Wd0djNVdNSDlHTWJUcWZxdHRoSXBvbkdZ?=
 =?utf-8?B?REVaQ0t1Y1JhbzVZdUdmaEphS29qcEJoWFozQXlaQ2hGUnBMNHlHRDBrWjZr?=
 =?utf-8?B?YTF5OUpnS1NQQytoVXRFL2xQWnRXbVgzSEgvRmNYckJpcHJnWm9PcCtoL2x4?=
 =?utf-8?B?UmMrR1dnMGxxSWJPNTRTeHl0c25ncm1MWENIUGk4Q2NqTXlwdFk1WnFKeDdF?=
 =?utf-8?B?NWNiQ3B2TGpmUUI0dDdtZ2FuVnZETnZaT0EvOU1HZUtEVzhzRGplYTJNdWI5?=
 =?utf-8?B?RjJ6cFJSeVQveWFSd2RlbDZjRXRGajRwNnBkVVNKaDFEejkrT0RUaUJmeXgz?=
 =?utf-8?B?a21uYzhrcmpUdmcrNjArWnpZYU9zWGRla212aEQweGR5RDkyVlZidythS1J4?=
 =?utf-8?B?TE9SRzY4SUFuMVdVU2tvQi9WaTUwV2s5K0xFNFVqcmhwMmt6OUFydnlUNnkv?=
 =?utf-8?B?TDUrN2tHbkFBWWkwUkJUWVZUQldibFN3UTFPSFRTai9QUWtSM2FXVzJyR1Zm?=
 =?utf-8?B?UVhzTXBrWUFKdXkxeTkwcXNFazFpS2xLZDhIdDVXRnJWWHBBdzFMN0d5Tyto?=
 =?utf-8?B?M0dOZENDZTN5RkltTDRSTERzTERmRmhVUEVHVXJ0bFdEeW1pYkowVmNqR1Mx?=
 =?utf-8?B?VloyYU8yUGRHbU85d09tZ0pjUkxBMVNOMDhrdFZoTm5tMmEyRXlEVzNIdWQ1?=
 =?utf-8?B?RkROYnFNV05kL2FrZzJDb3VLSG9Eeko2bDhBYXdMT3dESEp0UlNjU044T0Rx?=
 =?utf-8?B?Ukd4TGw4M1gzNkRqYVhCWTViejhMUHNVUURvZ3hhMy8xa0l6T0Nnenk5R3dx?=
 =?utf-8?B?anp0TjM1RThLNTlId2xLZ3NjOElRdzRIU2xhUGdhd29wWWJtU2FZN09QWTBi?=
 =?utf-8?B?Z2JyMVRTbzh4UG0rc2tYcGVKNGFYRitBSVo2eGVxUXo2K0NSL2gvck0zYWlC?=
 =?utf-8?B?dkVTY1hXTFNhVnVNZUtKRzRwZFBYV3BOcStmNXFHK0pPUWtKT0Rkc0tybUx3?=
 =?utf-8?B?WTZzWVFseEh4Q0o4TGVoYldzcVNPRTZwbDJsZUhpTWg4amdPUEVFMVZ6dm1r?=
 =?utf-8?B?L1dIbkFpN2NuWmJ2MzdPVjZDSmlEWFNUTXBrUHJZd3E0Q214SmRVSFNJSk5G?=
 =?utf-8?B?RHhyTHpMaDVUVm5rWFBJSnc5U2Q1MWdRdk01ZEw5YngvTFBWU1pJSEpHYXB0?=
 =?utf-8?B?Y0xQU3FFbFoyVjJ6QmF0NW1DOTgvazRrdTZydEs0ODYzR0ZVcEVkYUdZL0FN?=
 =?utf-8?B?UzlwZ2lhTEZYYnVWbHppMHVQTzVWYVNNZHFlek1wUkh1STJsM0F6ZFJCcVpH?=
 =?utf-8?B?cng1em1qTHFpREM5SDk0eXZQbHRDSW9pd2hlSHA5S1I3RlQwMFhQcjV0SHRp?=
 =?utf-8?B?dlB2cElqV1hWTitNd3k1cXNCV2RiY3ozMm5HY1NHQXRld0dwYnk2QklPVUxB?=
 =?utf-8?Q?vLmQ54FNfxc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWJmYTYyVThzcnB3RGpSVmE3WmxEcmh0WUMzZDRlRXY0ckg5UzhHeGpQUFI1?=
 =?utf-8?B?c2MzbVM3d2Q1RE9ucVFSckdwT3V2YkxUd0NQYkVqSUphbnVGNnFIM3h0LzhU?=
 =?utf-8?B?ckx4aTJNdms3U1NXZDNOZ2ZaYXEvWG5Pa25TV0RWeHNYcUlXdE1ieUdOUGN6?=
 =?utf-8?B?dHdBL3VkeXg5dmFsZUZtQmgxNGJrZENLUjZiWjFvYmQvdGN2b0M5MHZxbUFa?=
 =?utf-8?B?dUpRdVlsd0ZuYVlhcmE5Wjc5M1l2TVQwNnRTTjBwUWIxbjVUa3ZoMmJvemx3?=
 =?utf-8?B?RktjTGpMN2plMFVYSXM4ODFxNlJybG54ajBKbEtqcUtpQ3dGV0FHazFxZWFP?=
 =?utf-8?B?Qzd2d3RiTTF1NnZXanhRSGswYnhzNzhTTkg0RVlGUTJ2WHR1OFIrT3ZlVzAr?=
 =?utf-8?B?MnBPODZPcUFyT3F1eGpQdGJFdjA0Q084c2pvcENlR3dMNVo2NkhqQmszUTdI?=
 =?utf-8?B?RVhMajdKRkRBMEZuYlc0a2diR0s5SG1WTzFxclBCMmEwNlRjUHR1RWdDNk9j?=
 =?utf-8?B?dkxtZVpwYVRBSklaV0NJdHhhYWRsSFBhZVlodVd1TUN6ZFArK3dlMlIweXQw?=
 =?utf-8?B?YVRTWnJWR2dzTENIenUvRDZ4VTM2UXFBM2J6NDl5NUNmTnBpSnlQbW16Nmd5?=
 =?utf-8?B?U1JUaDVRbnVFeGt5ZThodjcrNlZLbzRlWkdSU2ZiZ1Y2MENXU3QyK0JZd05y?=
 =?utf-8?B?MU93Q3V6MlhpditkMzBEaFd2NHRIL3ROWlIxQ2ljVk9Nb3A0OVVGVHptZTB0?=
 =?utf-8?B?RFBxQXlKOHhHV0N6QW0xdmpaUDVPalc2dndBYkNoajl2a0UxNmRSekQ2bk55?=
 =?utf-8?B?NnFlbjV4YlFuQVZ6bGJyc0pYTGw5dzIwMWNvN3dIajFicHJYcXAwUlQzSlRY?=
 =?utf-8?B?SkRTZE43NzV0Q0hmWC8vcS9MYUFpRTVGaWZqTEVDR095cmFlSWF6VEdhNHRE?=
 =?utf-8?B?UjFlekNoRVdLVUl6MlNzT0xNWEVjNXNSc1phOGZMZFRsOFhYK21jNGlIeUV5?=
 =?utf-8?B?QVdvVWRyajJselNJRWlDR2M1NGdFUGJqVlBhU2ZRNDdTMkFlNFgxSnYwa1NT?=
 =?utf-8?B?NzNYd0FQMkxrcVpxTjJvZ0M5bTBmdEFVZ2VwZENTeXp6S2dVVWt3SVNQb3lL?=
 =?utf-8?B?dnhLYy82cHl2U2l1YkVyYjRpN1pBMlhhdnpGYkxVNDFWdTZMdTR0ZUY0OWNI?=
 =?utf-8?B?UmQwSTQwRWJ5aXZyQ2xTSUltOXViU1k3UWE0ZzU5NENrczdYbXlPZSsvQWVz?=
 =?utf-8?B?VUQraTJsRjNTREpQSzhkcDlxemxnWUZ3ODl0V1lTWURXQ055KzE0OVpqeHc3?=
 =?utf-8?B?ZXIraE1GU0V6WXAzQzlXRkNoZUtjaGVjd3lQODErajZoTTkwVFhYaDRuSWdF?=
 =?utf-8?B?VmRVaEtRVWhIZ1RIemgvNDRnQ3lZU2J6TmMxc0t0R1psMU9CWTV2aENJTTQy?=
 =?utf-8?B?dXBJNlpNU3pmNjlGYktlc3YyazN3TGY0RkN3YjlEZ3ZoOVAzRWxsUm5vMWJp?=
 =?utf-8?B?ejg2VEZVYzBsNWl4UzhaU01FSXRkR25EelhWQ3RZK3JDVkVhc0JCbERLUE5h?=
 =?utf-8?B?U3FlMk90TUo4bTI2Q0diS25wRHZVZ2hmUHcweVN4d2cxcHRTVHQ3a2k1Zmtj?=
 =?utf-8?B?dGkwUHRYNFVpRCtYcFlWU1pGY0JQbUNGMmdZbnlJUENUdFRWSTBvelBtWVBB?=
 =?utf-8?B?cEdKMkE5cjZMQWpXSHBIclVjYmNPakdaYVZXTXZiR0NKSWxxWVpXb3BDSi9R?=
 =?utf-8?B?d1JxanFiaVpURVFVR0NvSG5MYUFoQmoraUJOQ3hNMXZRVlRUZ0tycGR2bDFp?=
 =?utf-8?B?d2V5RUNyZGZ3RldKeVR3WnVyTHRCUXBLaU1aeTh3d3JnYW5zN1VvUXBDczNF?=
 =?utf-8?B?bXp2bnRqNUN3amd2azBMczhGd3VwYll0ajEvV0xQMW8vUnd6VUx3ZEpSc2Z0?=
 =?utf-8?B?cE1vbjdtUW5EMndRT0MzRUk0MHdDcE5lU3V0aDlWZWk1QnYvQW9oSTEvTWdX?=
 =?utf-8?B?d0ZhVEtCTTFKYlBOVGIzaWxEbk4yMEFMUHAwZ21wUlp6YmpLZ2ZOTWs4UmRM?=
 =?utf-8?B?SG9QaFFjK0hJZjk2dmZiTlc5M3F4TVVoNFppakxmekxlQW5NOFVwMFROYzVv?=
 =?utf-8?B?bTRUSUJVRHFZRm80SjRmRUlvSXJ0ek9aQU9sTUg2REU0MUhZVSt3MnlWWHR2?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6569c3c0-12c3-45a7-cda4-08dde56bfd07
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 13:16:52.8147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQWz38dB6OUdNW/7cJ60fbcHzZVif7Bjy1aHm+Yzo24A89N2FfKGCSNSGHaDKL9ExJXr++8OJZNhWxKmaPQsEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5877
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


On 8/21/2025 18:53, Bernatowicz, Marcin wrote:
>
>
> On 7/17/2025 11:08 AM, Lukasz Laguna wrote:
>> Add a test to validate VF access to VRAM via BAR. The following
>> scenarios are covered:
>> - VF can access all provisioned memory via the VRAM BAR,
>> - VF cannot access memory beyond what's provisioned via the VRAM BAR,
>> - VF can access memory via the VRAM BAR after reprovisioning.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   tests/intel/xe_sriov_vram.c | 310 ++++++++++++++++++++++++++++++++++++
>>   tests/meson.build           |   1 +
>>   2 files changed, 311 insertions(+)
>>   create mode 100644 tests/intel/xe_sriov_vram.c
>>
>> diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
>> new file mode 100644
>> index 000000000..82f0a2f09
>> --- /dev/null
>> +++ b/tests/intel/xe_sriov_vram.c
>> @@ -0,0 +1,310 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright(c) 2025 Intel Corporation. All rights reserved.
>> + */
>> +
>> +#include "drmtest.h"
>> +#include "igt_core.h"
>> +#include "igt_sriov_device.h"
>> +#include "intel_vram.h"
>> +#include "xe/xe_sriov_provisioning.h"
>> +#include "xe/xe_query.h"
>> +
>> +/**
>> + * TEST: xe_sriov_vram
>> + * Category: Core
>> + * Mega feature: SR-IOV
>> + * Sub-category: LMTT
>> + * Functionality: VRAM access
>> + * Description: Validate VF access to VRAM
>> + *
>> + * SUBTEST: vf-access-basic
>> + * Description: Verify that VF can access all the provisioned memory 
>> via VRAM BAR
>> + *
>> + * SUBTEST: vf-access-beyond
>> + * Description: Verify that VF cannot access memory beyond what's 
>> provisioned via VRAM BAR
>> + *
>> + * SUBTEST: vf-access-after-resize-down
>> + * Description: Verify that VF can access the reprovisioned memory 
>> (reduced size) via VRAM BAR
>> + *
>> + * SUBTEST: vf-access-after-resize-up
>> + * Description: Verify that VF can access the reprovisioned memory 
>> (increased size) via VRAM BAR
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Xe tests for VRAM in SR-IOV context");
>> +
>> +const size_t STEP = SZ_1M;
>> +
>> +static uint64_t get_provisioned_vram(unsigned int pf_fd, unsigned 
>> int vf_id)
>> +{
>> +    uint64_t size = 0;
>> +
>> +    /* TODO: adjust for multitile platforms */
>> +    size = xe_sriov_pf_get_provisioned_quota(pf_fd, 
>> XE_SRIOV_SHARED_RES_LMEM, vf_id, 0);
>> +
>> +    return size;
>> +}
>> +
>> +static bool validate_access_basic(struct vram_mapping *vram, 
>> unsigned int vf_id,
>> +                  uint64_t provisioned_lmem)
>> +{
>> +    uint8_t read, orig;
>> +    bool passed = true;
>> +
>> +    for (size_t offset = 0; offset < provisioned_lmem; offset += 
>> STEP) {
>> +        orig = intel_vram_read8(vram, offset);
>> +
>> +        read = intel_vram_write_readback8(vram, offset, vf_id);
>> +        if (read != vf_id) {
>> +            igt_debug("VRAM write/read check failed on VF%u (offset: 
>> %#lx, write: %u, read: %u)\n",
>> +                  vf_id, offset, vf_id, read);
>> +            passed = false;
>
> Do we want to continue after first fail (isn't it too noisy) ?

Yes, information about all offsets was already helpful when debugging 
the issue that was fixed by:

commit 3fae6918a3e27cce20ded2551f863fb05d4bef8d
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jul 2 00:00:52 2025 +0200

     drm/xe/pf: Clear all LMTT pages on alloc

>
>> +        }
>> +
>> +        read = intel_vram_write_readback8(vram, offset, orig);
>> +        if (read != orig) {
>> +            igt_debug("Failed to restore original value on VF%u 
>> (offset: %#lx, orig: %u, read: %u)\n",
>> +                  vf_id, offset, orig, read);
>> +            passed = false;
>> +        }
>> +    }
>> +
>> +    return passed;
>> +}
>> +
>> +static void access_basic(unsigned int pf_fd, unsigned int num_vfs)
>> +{
>> +    uint64_t provisioned_lmem;
>> +    struct vram_mapping vram;
>> +    size_t vram_bar_size;
>> +    bool passed = true;
>> +
>> +    igt_sriov_disable_driver_autoprobe(pf_fd);
>> +    igt_sriov_enable_vfs(pf_fd, num_vfs);
>> +
>> +    for_each_sriov_enabled_vf(pf_fd, vf_id) {
>> +        provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
>> +        igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n",
>> +              vf_id, provisioned_lmem);
>> +
>> +        vram_bar_size = intel_vram_bar_size(pf_fd, vf_id);
>> +        igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, 
>> vram_bar_size);
>> +
>> +        if (vram_bar_size < provisioned_lmem) {
>> +            igt_sriov_disable_vfs(pf_fd);
>> +            igt_skip("VRAM BAR size is smaller than provisioned 
>> VRAM\n");
>> +        }
>> +
>> +        vram = intel_vram_mmap(pf_fd, vf_id, provisioned_lmem, 
>> PROT_READ | PROT_WRITE, 0);
>> +        igt_assert(vram.addr);
>> +
>> +        passed &= validate_access_basic(&vram, vf_id, 
>> provisioned_lmem);
>> +
>> +        intel_vram_munmap(&vram);
>> +    }
>> +
>> +    igt_sriov_disable_vfs(pf_fd);
>> +
>> +    igt_assert(passed);
>> +}
>> +
>> +static bool validate_access_beyond(struct vram_mapping *vram, 
>> unsigned int vf_id,
>> +                   uint64_t provisioned_lmem, size_t vram_bar_size)
>> +{
>> +    uint8_t read, orig;
>> +    bool passed = true;
>> +
>> +    for (size_t offset = provisioned_lmem; offset < vram_bar_size; 
>> offset += STEP) {
>> +        orig = intel_vram_read8(vram, offset);
>> +
>> +        read = intel_vram_write_readback8(vram, offset, vf_id);
>> +        if (read == vf_id) {
>> +            igt_debug("Successful VRAM write above provisioned size 
>> on VF%u (offset: %#lx)\n",
>> +                  vf_id, offset);
>
> Current wording sounds as if the test succeeded, maybe: "Unexpected 
> VRAM write beyond provisioned size ..." or "ERROR: VF%u was able to 
> write beyond provisioned VRAM ..."

That's true. Piotr pointed the same, I'll fix it. Thanks for the 
proposed messages :)

>
>> +            passed = false;
>
> Do we want to continue after first fail ?

Yes, the same case as above. I would prefer to continue. Based on the 
information about offsets to which VF is able to write we can e.g. 
deduce that the problem exists only after VF reprovisioning.

>
>> +
>> +            read = intel_vram_write_readback8(vram, offset, orig);
>> +            if (read != orig)
>> +                igt_debug("Failed to restore original value on VF%u 
>> (offset: %#lx, orig: %u, read: %u)\n",
>> +                      vf_id, offset, orig, read);
>> +        }
>> +    }
>> +
>> +    return passed;
>> +}
>> +
>> +static void access_beyond(unsigned int pf_fd, unsigned int num_vfs)
>> +{
>> +    uint64_t provisioned_lmem;
>> +    struct vram_mapping vram;
>> +    size_t vram_bar_size;
>> +    bool passed = true;
>> +
>> +    igt_sriov_disable_driver_autoprobe(pf_fd);
>> +    igt_sriov_enable_vfs(pf_fd, num_vfs);
>> +
>> +    for_each_sriov_enabled_vf(pf_fd, vf_id) {
>> +        provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
>> +        igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n",
>> +              vf_id, provisioned_lmem);
>> +
>> +        vram_bar_size = intel_vram_bar_size(pf_fd, vf_id);
>> +        igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, 
>> vram_bar_size);
>> +
>> +        if (vram_bar_size <= provisioned_lmem) {
>> +            igt_sriov_disable_vfs(pf_fd);
>> +            igt_skip("VRAM BAR size is smaller or equal to 
>> provisioned VRAM\n");
>> +        }
>> +
>> +        vram = intel_vram_mmap(pf_fd, vf_id, vram_bar_size, 
>> PROT_READ | PROT_WRITE, 0);
>> +        igt_assert(vram.addr);
>> +
>> +        passed &= validate_access_beyond(&vram, vf_id, 
>> provisioned_lmem, vram_bar_size);
>> +
>> +        intel_vram_munmap(&vram);
>> +    }
>> +
>> +    igt_sriov_disable_vfs(pf_fd);
>> +
>> +    igt_assert(passed);
>> +}
>> +
>> +static void resize_and_access(unsigned int pf_fd, bool resize_up)
>> +{
>> +    const unsigned int vf_id = 1;
>> +    uint64_t provisioned_lmem;
>> +    struct vram_mapping vram;
>> +    unsigned int total_vfs;
>> +    size_t vram_bar_size;
>> +    bool passed;
>> +
>> +    total_vfs = igt_sriov_get_total_vfs(pf_fd);
>> +
>> +    igt_sriov_disable_driver_autoprobe(pf_fd);
>> +    igt_sriov_enable_vfs(pf_fd, resize_up ? total_vfs : 1);
>> +
>> +    provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
>> +    igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n", 
>> vf_id, provisioned_lmem);
>> +
>> +    igt_sriov_disable_vfs(pf_fd);
>> +    igt_sriov_enable_vfs(pf_fd, resize_up ? 1 : total_vfs);
>> +
>> +    provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
>> +    igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n", 
>> vf_id, provisioned_lmem);
>> +
>> +    vram_bar_size = intel_vram_bar_size(pf_fd, vf_id);
>> +    igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, 
>> vram_bar_size);
>> +
>> +    if (vram_bar_size <= provisioned_lmem) {
>> +        igt_sriov_disable_vfs(pf_fd);
>> +        igt_skip("VRAM BAR size is smaller or equal to provisioned 
>> VRAM\n");
>> +    }
>> +
>> +    vram = intel_vram_mmap(pf_fd, vf_id, vram_bar_size, PROT_READ | 
>> PROT_WRITE, 0);
>> +    igt_assert(vram.addr);
>> +
>> +    passed = validate_access_basic(&vram, vf_id, provisioned_lmem);
>> +    passed &= validate_access_beyond(&vram, vf_id, provisioned_lmem, 
>> vram_bar_size);
>> +
>> +    intel_vram_munmap(&vram);
>> +
>> +    igt_sriov_disable_vfs(pf_fd);
>> +
>> +    igt_assert(passed);
>> +}
>> +
>> +static bool extended_scope;
>> +
>> +static int opts_handler(int opt, int opt_index, void *data)
>> +{
>> +    switch (opt) {
>> +    case 'e':
>> +        extended_scope = true;
>> +        break;
>> +    default:
>> +        return IGT_OPT_HANDLER_ERROR;
>> +    }
>> +
>> +    return IGT_OPT_HANDLER_SUCCESS;
>> +}
>> +
>> +static const struct option long_opts[] = {
>> +    { .name = "extended", .has_arg = false, .val = 'e', },
>> +    {}
>> +};
>> +
>> +static const char help_str[] =
>> +    "  --extended\tRun the extended test scope\n";
>> +
>> +igt_main_args("", long_opts, help_str, opts_handler, NULL)
>> +{
>> +    bool autoprobe;
>> +    int pf_fd;
>> +    static struct subtest_resize_variants {
>> +        const char *name;
>> +        bool resize_up;
>> +    } resize_variant[] = {
>> +        { "up", true },
>> +        { "down", false },
>> +        { NULL },
>> +    };
>> +
>> +    igt_fixture {
>> +        pf_fd = drm_open_driver(DRIVER_XE);
>> +        igt_require(igt_sriov_is_pf(pf_fd));
>> +        igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>> +        autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>> +    }
>> +
>> +    igt_describe("Verify that VF can access all the provisioned 
>> memory via VRAM BAR");
>> +    igt_subtest_with_dynamic_f("vf-access-basic") {
>> +        if (extended_scope)
>> +            for_each_sriov_num_vfs(pf_fd, num_vfs)
>> +                igt_dynamic_f("numvfs-%d", num_vfs)
>> +                    access_basic(pf_fd, num_vfs);
>> +
>> +        for_random_sriov_num_vfs(pf_fd, num_vfs) {
>> +            igt_dynamic_f("numvfs-random") {
>> +                igt_debug("numvfs=%u\n", num_vfs);
>> +                access_basic(pf_fd, num_vfs);
>> +            }
>> +        }
>> +    }
>> +
>> +    igt_describe("Verify that VF cannot access memory beyond what's 
>> provisioned via VRAM BAR");
>> +    igt_subtest_with_dynamic_f("vf-access-beyond") {
>> +        if (extended_scope)
>> +            for_each_sriov_num_vfs(pf_fd, num_vfs)
>> +                igt_dynamic_f("numvfs-%d", num_vfs)
>> +                    access_beyond(pf_fd, num_vfs);
>> +
>> +        for_random_sriov_num_vfs(pf_fd, num_vfs) {
>> +            igt_dynamic_f("numvfs-random") {
>> +                igt_debug("numvfs=%u\n", num_vfs);
>> +                access_beyond(pf_fd, num_vfs);
>> +            }
>> +        }
>> +    }
>> +
>> +    for (const struct subtest_resize_variants *s = resize_variant; 
>> s->name; s++) {
>> +        igt_describe("Verify that VF can access the reprovisioned 
>> memory via VRAM BAR");
>> +        igt_subtest_f("vf-access-after-resize-%s", s->name) {
>> +            unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
>> +
>> +            igt_require(total_vfs > 1);
>> +
>> +            resize_and_access(pf_fd, s->resize_up);
>> +        }
>> +    }
>> +
>> +    igt_fixture {
>> +        igt_sriov_disable_vfs(pf_fd);
>> +        /* abort to avoid execution of next tests with enabled VFs */
>> +        igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed 
>> to disable VF(s)");
>> +        autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
>> +                igt_sriov_disable_driver_autoprobe(pf_fd);
>> +        igt_abort_on_f(autoprobe != 
>> igt_sriov_is_driver_autoprobe_enabled(pf_fd),
>> +                   "Failed to restore sriov_drivers_autoprobe 
>> value\n");
>> +        close(pf_fd);
>> +    }
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 5c01c64e9..6054a2c34 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -329,6 +329,7 @@ intel_xe_progs = [
>>       'xe_sriov_auto_provisioning',
>>       'xe_sriov_flr',
>>       'xe_sriov_scheduling',
>> +    'xe_sriov_vram',
>>       'xe_sysfs_defaults',
>>       'xe_sysfs_preempt_timeout',
>>       'xe_sysfs_scheduler',
>
