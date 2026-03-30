Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688D8F3D5E7
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 08:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F4110E52D;
	Mon, 30 Mar 2026 08:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="invZ0RcV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F256A10E52D
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774858790; x=1806394790;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dacXAvoyQSnDrOLAR1J0MeeDfGW/IwCU6scRi0nH1/0=;
 b=invZ0RcVH2euvfUKJXiFOm1JyCiLW8xL0EUbuPvX3jPMgCVfTEybct+p
 nfJ6ergk4ih99MZMiPXxFyFnErHweGl9AQndoepJDlYIU60UFuK5Yjew+
 hoYlL2rhM403iDNd0mX22XhfNP9MFevo3VS8YbsAGBLq+ZqhN1pNqCsMH
 Ff69oZ59tY7xS5hNRTI3B2RXJn1v0OgwL0aCr6TOpo8zZS2kNIVV3BmvX
 wriwav4Dzhev4W2LxOzEtR4O2Aq5r5118XQEnXDjgQM9TKym1Xjo2VvJG
 proyj5UmnqWU6/Ezc2+/taeovvnLZ18bBTLL0ygNGWi6v9WdKsL/IKsfB w==;
X-CSE-ConnectionGUID: VyRaU7t2QjSEhuXRXk6Z4Q==
X-CSE-MsgGUID: 1dW8rF9fQfOPoiWdcTvOqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="63397146"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="63397146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:19:49 -0700
X-CSE-ConnectionGUID: anxczEq6QheV8osgbpENpA==
X-CSE-MsgGUID: X67HDMcLRw69l0rG9OvfOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="230899385"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:19:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:19:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 01:19:48 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:19:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeQEk927snrF3gzYGmO6G/wQR2SILek0TyhurNeAnM0B4cxiFwKX4bss4Bjb4piRAN91dMY0S9m3jYY6RD0t7CrQJrTBBrJJNPP/1hgitJL/ryJPzNMaW2it7+Kh83dhfzRiFHBnxuoUIBMszYOdkZ6Ds42Af5sHzn3w5NlY34ybL8xKTHYZTpE9+cKaCQ9vU4cMPg32X8ewHf/dD5Xfzpc4jHD4/vGocMwoExJxXS8kcLb+F8noO8ZFhSM7fd7jSlaSz55YpZeAfNhc0bCw8MrLpJeo5GH5nZxCuCXdY+yd7m/kQoA82F//eF/UQP67qlcu9Hjss0Y02lDDBgR/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLtCmhHCx7Y0Obg7WKK8iq7kldi8s3U3FDOlhbnP5bA=;
 b=l7+xtu0/Ms2bcKK/nwVUy3j91cWBojgdwsH+MIPrZUJLgRf0vx3vJRtioiuLuVViOlzQQoyM5BZ9vl4LcWCx30LDF2V/GpXUmsUicDRP250kBsLp2z1q6LakSqIV4JzPPbZFPMBpeiUqY8USZ5otdHcGhkvRRAbACwnhuwfF9uXjsRAi0zDTzLBUCk5Vdy+3H7tkOe5KqJ0KrtZI/B3P1CE6f/t9VSfmbo4jxam85k/a6xSp1FLmMwhb03jRcBEzsUI1qTkKLRwk4CJENIYcmw/d8vjwpsL9TWPn7Us2HLN3gek9kFrdFqeC4x+UM+mZuajvxOqYjtIyn/2WsgeXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 08:19:33 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 08:19:33 +0000
Message-ID: <d30c79be-5f0b-4c03-8ca1-d16e84dd0778@intel.com>
Date: Mon, 30 Mar 2026 10:19:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 4/4] tests/intel/xe_sriov_vfio: Add region-info
 subtest
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>
References: <20260327140627.64574-1-marcin.bernatowicz@linux.intel.com>
 <20260327140627.64574-5-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260327140627.64574-5-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0048.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::19) To DM4PR11MB6214.namprd11.prod.outlook.com
 (2603:10b6:8:ac::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA2PR11MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: 32dcb689-502e-423b-4556-08de8e3512b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: MlAfbJhGGKsn5TLjf0w86fajiIXSdnqS1CRY76rL2ZgzSiLFny5KcYmui2vOj4IY/l2822WtsGjqkWDFtcWNEVwhfTrN0SI2ANAfdsIiI6uO4OlhlhJmoFvnOWRAcSc117ZZm4c/D2Fqbe8tK5asaXho04MnKVpvCVJpgOprSkMmkxXLLHO18Y5v3JfLx1o8YGjgCdiuLm41iHhbOvdG2qbf8J91NpNdQhVMoBu04j+N3Y/y7T71EC7ynkkz5znd3Ivs4/NQJHFA3L3woHrUCywe86U9+HfhXEiyyFgKH2g6+Yl3FeWfoghEAjo5BgHIKBqoQiwk/1KzySPGMEqhD6tKMSD72KW6upau6/+OKQeIDhCZDpCZ0t1p6DGQ0fQBciNd6KHCQuOVrSKhzkRSMGqnREf7PpKhRkMpTJJbZfDGf3BA2an46ReoFWzIPT9cU3juo1lO5Cb9r0nVMBuCaYDD0YS51smtKrFvoFxrocgCZhR2/gnYskHol7cBJ9VRD+fnYNNcgl/OzaU0IjWKepZF7taeDjxdIPtetk/X3VYrJ5749/zBh7FaLapk7t47ln6x3s63Z65ETRqfdIgSB2DBqh0BHwilw818ZWSHWSRr5HoneaQ7SOpw3zBAllCDetkpFHspF3DSWS+5NEI8pa2LRdEycmmg2MytuzgiwuEVWbJYSzvxtg6ST8JLLxEND5eCyJg22M9WSv5YXNPNRRlkkBVznlEI+Kt5/FMb26A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjN4L3NaeXBqbTNMUUNncklNdFdoZER5bTZQVkV2eGtpNHRMQTc0cU80Vyt3?=
 =?utf-8?B?dDVhcEducU0wYWpPSzJuVVNmdDFYS1FhTVcwZkVzdmdWclBYOVUvUldIUTQ2?=
 =?utf-8?B?OGFWd2NraCs5dkxCQnRHQ1BYdTlqaC9iSlRoMExBS0FIZ01BM3pCTE5vNjRZ?=
 =?utf-8?B?U0xIVENLcnR0Rk4wdW5rNldyR1BGVWZmalkzUXA4MktZVldNdERMSmZNcitm?=
 =?utf-8?B?NnJTSWJXR1dOS0ZLL0NVZHBVWHcvR1U1ZUVwSHRaZE5XQXdDcE9NMVhkZlIw?=
 =?utf-8?B?eDRjOE8yL0twTlppa0tqZE1PeUtuZnZxZFJSZGJPdE1JVTlLem4zb250c01G?=
 =?utf-8?B?ektwWjk2ekZUWXoxaDNOYkp2dmE5YWlRQ0JWOXBvL3RhbTFxZmc1YW9oRXgv?=
 =?utf-8?B?M0JyTWc5YkNVS2VyWXduN3dTUjdWY3FjL1BVR3REN2R6MUNZa0lZYlFVYUdr?=
 =?utf-8?B?R3ZZZHI3UGdrdVQxUjRHMUJNRENPWTh5R3FvdVJ1ZlpRZVA0YXJYUkR4WWZz?=
 =?utf-8?B?YXc2NTkwRkpMQ3F3ZVcrNkNGZkVDekpNZWhYbWE2ZHo1K2F0bUJOaTlDcHlx?=
 =?utf-8?B?RVY3cStXL3dBa2tlVkd4amNzMG8yN2NVS2FaRVltaEwydWVvaFJ4RlVNQTNK?=
 =?utf-8?B?b2dWVk42R0xIN2hHaEJoeDVzU2pYdkN1Q3NtejJma1FzODl5Y3BKaDFZV1NY?=
 =?utf-8?B?KzA3WGFOZVJuNFhtZHFGN3JEQjA0dVgxdlZFRVJ5bWZUUDVkUjlnbnhGTDNy?=
 =?utf-8?B?TFRWWndnS2I5M2RSejhyUEF4UWxtOTJ5RHJRbHhCdGYzWW13ZjVjeW1naHl6?=
 =?utf-8?B?UHNVZURvaUtKTk8yTEtYT3Jra0lLdlBDUWNCQS9UVzRqRjhwNE1EUXlNVkhN?=
 =?utf-8?B?b3dWbmRSYWR3clJVY2p3K1BvN3JJbjRQUzhGZFdYeExsTG12dXBEeVJUVWRN?=
 =?utf-8?B?NTBENVpxQ1Zmcm9vNms1WEZGUGViTDJIRWhXUGErQXN3ekZHeE1DMlY0NVBn?=
 =?utf-8?B?eDhOcjYzaVhYeFBXeStNcDRvZng2SFFlVnE1RU9pR2Jtbk0xWFZOZDR5a3JM?=
 =?utf-8?B?RVZLV1VsTWtkRFdkaVBsQjQ0U1Z4eE4yOTBmSG5jTFFVd2pDV29PWHZiQW16?=
 =?utf-8?B?V0hIYXdyQ2NCREdYNjk1bUVuSmk4K3RoRHFzQmZyQ2s3WGE0Wkcwd0ZsSzhw?=
 =?utf-8?B?NFcrTnMzWVN6YUxlOVFydmxoZCt3ZzFCTFB2M0RYTW41U3UzTUxhZlRVMVRD?=
 =?utf-8?B?U3krYUg5VnBjNWhnNnRBbDYzZ1FyTlVXM2lNRVhtVmlQSXIxQjRFTDk1ZlRT?=
 =?utf-8?B?Z0RMTm13ZklLSlo2UENsbHBjOXB3M21zNnQ4bzdvTjdiYkF4SGNlc2ZiaWdT?=
 =?utf-8?B?MnFSOWphOURtZWQ1SzR0U0k2cGNUS3RWMDNGWWVmeWttVVRxNURtN0ptMzJH?=
 =?utf-8?B?RzRNVW5LdXJnN1M1cHV0clpmL0YzcTlzNG50UmhnYnU4TmM5K0M3cjUrdEgr?=
 =?utf-8?B?d3g3MWlMeSswSFU5cUY0blUybzM0QW1zRXBNcmxNQXQ3bENIVnN5K1Zqdkk3?=
 =?utf-8?B?ZTVPQVZxRXZYeExwVWtUZWhKSTBNczJHV0F6WnZ3aUZqanJVUm4rdFpVb2F4?=
 =?utf-8?B?dmlGRWpDSE0rWEFKbmQyUjFCeERIeU5xM0ZRSUlhYWhxazlsWmo4SE1VOUhj?=
 =?utf-8?B?SjNNVWxiYmJvK0lDVzQ2U0RDMlkxd2FoejBGbEhZMDUvbWlCRnhycWdCMVdF?=
 =?utf-8?B?MDlTWTQrTGlBalN0NWdTYm52ZkdSR2pUMHhsM2FrdlV2OTRsR3g1Slg1aTdT?=
 =?utf-8?B?RjNqWU54YWd0U2xRbHc0VnorWDEyVWYvaUZzNXltRyt5UGlUYXM3aHZrMitr?=
 =?utf-8?B?ai9uTWVWMDF5emZvZnM4czlQaktrc0J3QWtWU0ltRWZ6bkJDM2NMRnIyOWRy?=
 =?utf-8?B?S0N4bE53VnBkM3ltMmFTbi82Z0t5MHhKRG51dURtTjJ0b2ZzTU1ldmo5ek9V?=
 =?utf-8?B?MXIrWGl3RVpuNWNsZlJUZHY1MlZacG1SdUFiMlZtZkt1NW1wRGlFY0ttTnpn?=
 =?utf-8?B?Z2tXYlNrQU5HRUtnRDErVmpBc05JMWs5b05JTk82ZVhPamo2K29xRDBmbmdQ?=
 =?utf-8?B?WEN3OVRWdTBPL042dmlFMnlpVnAxelJEMWR5S0Z4RS85bkNJTXcvcXBiQ0gv?=
 =?utf-8?B?RHFBOVROMVFuSFlyVWpOZVAyc3cwRE5yNTJtQ2pFNVBsRkNsaUhVUkc0UnBt?=
 =?utf-8?B?U3ROMUJwSGQ5aC9ndWFwNkZxajU2N1hZRTBFQm43YUExTTd2dWNBWUJxQWhP?=
 =?utf-8?B?Wmx0UG1wSE53NmFCNzYyNEdFUjhycXNRaG1CdG1KcndJZm9WOU1IUT09?=
X-Exchange-RoutingPolicyChecked: Gg9WzYdeUrijgmZ4lscBsalMmG2ioIiClxvW+/OHJIX+UglxynCKlNZyt1+QGZQ8BqViH7/DT0+5/JtsBdfK7ScaUy3Mq1pI67bFjW44w5hSoCM0vtloAAQA8JOtJFyYGbAdgM21M+leyLmZsLM1tg+YmwhXR4ATXEjc773lriftLuyYBV6L1hPVnKh2vGL/cvxxYbVkSx5aperpeQ9Ana7Ben7ldneCs990GphMoUqkEa22OSPrzo0tdzuJlI0iHXV88zmCk95rdubSCjaoLjnbldpOkofKC0xFA4jd+aqmwLa13Wd9iccQ1ITzLbsQuydaYoa4TuHtfAEZuqemoQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32dcb689-502e-423b-4556-08de8e3512b2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 08:19:33.5922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJiBiSsRfK+XGuz3zJMJ5VBZ5axANSXgecbyen8dPA3Wv3KjDIJ2lVc2R2WqP2LhGN5hP1ptGT9v6z6lS/ZwQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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


On 3/27/2026 15:06, Marcin Bernatowicz wrote:
> Bind a VF to xe-vfio-pci, open the VFIO device, and query VFIO region
> information. This provides basic coverage for VFIO BAR exposure and
> device region enumeration.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
> v2:
> - Introduce vf_num variable for clarity (Lukasz)
> - Remove unnecessary unbind (Lukasz)
> ---
>   tests/intel/xe_sriov_vfio.c | 85 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 85 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
> index 6a86b3780..f42deaea6 100644
> --- a/tests/intel/xe_sriov_vfio.c
> +++ b/tests/intel/xe_sriov_vfio.c
> @@ -28,6 +28,9 @@
>    *
>    * SUBTEST: open-basic
>    * Description: Bind VF to xe-vfio-pci and perform minimal VFIO group open and status ioctl.
> + *
> + * SUBTEST: region-info
> + * Description: Bind VF to xe-vfio-pci, open VFIO device and query VFIO region info (BAR sizes).
>    */
>   
>   IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
> @@ -218,6 +221,58 @@ static void vfio_open_basic(const char *pci_slot)
>   	vfio_close_device(&fds);
>   }
>   
> +static void vfio_open_device(const char *pci_slot, struct vfio_dev_fds *out)
> +{
> +	struct vfio_group_status group_status;
> +	int ret;
> +
> +	vfio_open_group(pci_slot, out, &group_status);
> +
> +	igt_require_f(group_status.flags & VFIO_GROUP_FLAGS_VIABLE,
> +		      "VFIO group %s is not viable (flags=0x%x)\n",
> +		      out->group_id, group_status.flags);
> +
> +	ret = ioctl(out->group_fd, VFIO_GROUP_SET_CONTAINER, &out->container_fd);
> +	igt_require_f(ret == 0, "VFIO_GROUP_SET_CONTAINER failed (%d)\n", -errno);
> +
> +	ret = ioctl(out->container_fd, VFIO_SET_IOMMU, VFIO_TYPE1_IOMMU);
> +	igt_require_f(ret == 0, "VFIO_SET_IOMMU(VFIO_TYPE1_IOMMU) failed (%d)\n", -errno);
> +
> +	out->device_fd = ioctl(out->group_fd, VFIO_GROUP_GET_DEVICE_FD, (char *)pci_slot);
> +	igt_assert_f(out->device_fd >= 0, "VFIO_GROUP_GET_DEVICE_FD(%s) failed (%d)\n",
> +		     pci_slot, -errno);
> +}
> +
> +static void vfio_dump_region_info(int device_fd)
> +{
> +	struct vfio_device_info dinfo = { .argsz = sizeof(dinfo) };
> +	int ret;
> +
> +	ret = ioctl(device_fd, VFIO_DEVICE_GET_INFO, &dinfo);
> +	igt_assert_f(ret == 0, "VFIO_DEVICE_GET_INFO failed (%d)\n", -errno);
> +
> +	igt_info("VFIO device: flags=0x%x num_regions=%u num_irqs=%u\n",
> +		 dinfo.flags, dinfo.num_regions, dinfo.num_irqs);
> +
> +	for (uint32_t i = 0; i < dinfo.num_regions; i++) {
> +		struct vfio_region_info rinfo = {
> +			.argsz = sizeof(rinfo),
> +			.index = i,
> +		};
> +
> +		ret = ioctl(device_fd, VFIO_DEVICE_GET_REGION_INFO, &rinfo);
> +		igt_assert_f(ret == 0, "VFIO_DEVICE_GET_REGION_INFO(index=%u) failed (%d)\n",
> +			     i, -errno);
> +
> +		igt_info("region[%u]: size=%llu offset=%llu flags=0x%x caps=%u\n",
> +			 i,
> +			 (unsigned long long)rinfo.size,
> +			 (unsigned long long)rinfo.offset,
> +			 rinfo.flags,
> +			 rinfo.cap_offset);
> +	}
> +}
> +
>   static void open_pf(void)
>   {
>   	int fd;
> @@ -343,6 +398,36 @@ int igt_main()
>   		igt_sriov_disable_vfs(pf_fd);
>   	}
>   
> +	igt_describe("Bind VF to xe-vfio-pci and query VFIO region info (BAR sizes). ");
> +	igt_subtest("region-info") {
> +		unsigned int vf_num = 1;
> +		struct vfio_dev_fds fds;
> +		char *slot = NULL;
> +
> +		igt_skip_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
> +			      "Failed to load %s\n", XE_VFIO_PCI_MOD);
> +
> +		open_pf();
> +
> +		igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_sriov_enable_vfs(pf_fd, vf_num);
> +
> +		igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
> +		igt_sriov_enable_driver_autoprobe(pf_fd);
> +
> +		slot = vf_pci_slot_alloc(vf_num);
> +
> +		vf_bind_override(vf_num, XE_VFIO_PCI_DRV);
> +
> +		vfio_open_device(slot, &fds);
> +		vfio_dump_region_info(fds.device_fd);
> +		vfio_close_device(&fds);
> +
> +		vf_unbind_override(vf_num);
> +		free(slot);
> +		igt_sriov_disable_vfs(pf_fd);
> +	}
> +
>   	igt_fixture() {
>   		cleanup_pf();
>   		restore_xe_vfio_module();
