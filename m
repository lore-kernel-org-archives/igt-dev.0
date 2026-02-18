Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B438CE9A02C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 17:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A90710E02B;
	Wed, 18 Feb 2026 17:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dd6bZQni";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A6F10E02B;
 Wed, 18 Feb 2026 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771435343; x=1802971343;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T78OnCflnwqMF9wXRhyEqjNvoO6Y8P8TL1SRAxMXtHQ=;
 b=dd6bZQni+xEGPNtwKoJbNt11N+yvI2Bc5bh+YHYvmBj/4Hn0jtU7l2J9
 VELw+YR7hg5WjXigAQgz2+oXqum3DAlOVlUqfnLmvXBTfn9MuHMf1VNHD
 /c/jEt94HMNZU5Q1A8oYnSFfuxwVlW6ENJAReY2/KUQ391niAtj+U98/f
 WwXuogHY+D5HI87eZ+8qOVNluVpXDtf4EsmY6M8QXXtPWTce2DwjzdcDM
 Ud/nskDrBtXD4TmJoY023/0zSQd0vsrfuABPJHdeTfrzPROvLG//OrCSH
 uQG5EZ3Ba6I8MJCFtATouOq6AhD5e3USnNlaf5AT4GHSbFZMNlox1W1iC g==;
X-CSE-ConnectionGUID: TBzPhHugTnio3ZJMKJgmcA==
X-CSE-MsgGUID: bvnv/6l4R/ittuG2MOHLtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72227618"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72227618"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 09:22:22 -0800
X-CSE-ConnectionGUID: +cD0ROcGQFeorHIp7vWUcA==
X-CSE-MsgGUID: LnXj+MgeQOesMxqoDfE2Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="219260283"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 09:22:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 09:22:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 09:22:22 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 09:22:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsWzkR72hodo5ZaXKNVpFImQrs8ewv0AG95CBXLUMZz4nxhK5YHIANQunIT4qh9vU4XBl3UR8wUGeLPOBY7kJ/3YCwuVXdM2vsfxPrieSsb9bN8SGToJTG8ITxr8npzliVGk6CVHDdEskeaKOp8ckpcKBG1tHu+6L+h3L9so+nFMGLIU8WXK+Ej7yQKW+24Y00i7L7MM4OaTXwCPqsLNwuc4vKGQTblkiTOwVhuHGHwhozLoNpvGE4SiyV41KfQ7RV+q1PjM9C2LbInvM4y/LfwMKywghFg00O/RRy80t+2v+xsVGxivews0wqXLAxmS376NA227RU23QAf67Nq4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lM41I5++levBcyYzWkEv19sdJ6Rx01TLMS1466bxAbc=;
 b=s5sAPArp5dAcIQliv/+IrLJ6+DqKGU/EpzRPKHH89hgo3uqu8Us+/qCyKrlyWulnQAbPKaXaxi6Y5RLvzW6QsbUyPyZx31iE/N3ELCX3yZvUHLjtctOjXhQSAUChbcB8ePMUuFd3adzCsLHy7tObd4ZiVvyPeVGN29S/860w3l301jwWWOinG97wVHlVrwqd3457Ngxp+iLS68g+QQY1r/qx7vdGHOEumLA9E7MOHlp3RTnP7b6JeOHepI37hfQ6HTP3viR4JiDSJxSc9G4J7bRjZNTO49CULidnOYgeAtVlCbIqMJd+tMV+BxEfvSazMxk5Lk9jrU2n8PuAwcsamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 17:22:19 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 17:22:19 +0000
Date: Wed, 18 Feb 2026 18:22:14 +0100
From: Jan Maslak <jan.maslak@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <I915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 lib/gpgpu_shader: set r1.4 to dim.x
Message-ID: <aZX1Rmjk4TqBY84/@ART-DEV-395>
References: <20260210102416.2796291-1-jan.maslak@intel.com>
 <177078200151.244788.3019774572777286772@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177078200151.244788.3019774572777286772@a3b018990fe9>
X-ClientProxiedBy: DUZPR01CA0219.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::16) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|PH7PR11MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dbd0800-d664-440e-f28c-08de6f124505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzgycUNsLzJWTHJXbGdiUGczRXlrVVREbkZUY1JrVkVVZGRyblBkY2xKQ3l3?=
 =?utf-8?B?VkFUSFZiZFpQdVQ2cjBEOXltdVJ0dXZ4T1BGMGxSWHFRaGZJdUZBSENlTk5t?=
 =?utf-8?B?aDN4cDdmVENqY3VUMkIvWlBHWExUeEd4Z1o5YWxrUGM3cDNsOVl0RXBOalpN?=
 =?utf-8?B?UzlZSG4wWjZxL2FvZzRhd01rZzdGTzFSV3hJUDlEYjVjaHpMK25Xd2FhbUtV?=
 =?utf-8?B?bVFSSDJEZE1VRlFWeE5aeGVSLzRBcXRaQ3FZc1Awcnh4NElyRTRTOGVhcEpD?=
 =?utf-8?B?N1RjbTdSZktwZjl3ZXZ4YlB1ckl4TkR6THo0UzloNHh5NHlSbFgvSWQ4YlNC?=
 =?utf-8?B?NVVtTGlZQklHTU5UbWJzNmpnN2tpdjhNWE5vRXVBSFNGeklTRGMycm1jY3JD?=
 =?utf-8?B?Y0RRcUZHZTlQZ3Z1ejBFSFloeE5FbGkyM3QrN3JhZnFFOW02TFBaYmtuQTlZ?=
 =?utf-8?B?NUNMZkpURWtCaERqU0FjRGM3TW5yVVBUbHJvWGlyQkJmN05PZGhwVTJpZU0v?=
 =?utf-8?B?UzI1NERBWnNDOS8yNWhsM0s4VjIzOEZ3cVhiWWk4YUUzeFRZYkh6ZEFWbER2?=
 =?utf-8?B?T3h1L3h3OGd1TVRubTNoTkNHbDJNdURVUFUzMnF0bnJaanNNdGhLdlk0cEQ0?=
 =?utf-8?B?OEJ6a1ZzeEE0WDhobWE3VFY3bm16QVZOKzRBS25tUU1pNW1BL1ZNemswcE1D?=
 =?utf-8?B?SnhBZjZFdE1xS1NvL2s5VWtqNysrMHFiZEhLT0VUbldnWjBUeUYyQUtoL2VW?=
 =?utf-8?B?dHNjQWpkM29SaUR1WmJiRDRidWE3OEY3d0JjbkZiZzNYKzRnOE9rTXRMMUk1?=
 =?utf-8?B?VEc5SS9PMEtlbE4yWTA3MzA4cXRvTHVtYXplVTlCQ0k3MmJqejBYbW8zYWcr?=
 =?utf-8?B?d3FzVDUwdFE2NmxsaWI4OEZ0L0RYUDNhcEp3K2JtRkNYQVZmTGV0VmhBSTlH?=
 =?utf-8?B?NFJWTkIrRStjZzhtaUllTVQyczhJOUdyV2ZEMkQyWjhEVkxDdC93TjArMHNl?=
 =?utf-8?B?emp3bVNBUy9FNWtOdzh0TzJrV2gyT1VMdWFONW9TWU1uTTRxSFFLTUlqM1F2?=
 =?utf-8?B?YU5VanJhaHFOanJUM1BxbEd0VnI5LzJYaGVwcjZPajByMStwNjh2WjhjNGhY?=
 =?utf-8?B?THo2cXA4L1NRay9GWmhYZW1kdTlpVG9oUWErQXJUSTVUNXJPdDVSVkZ0R0pR?=
 =?utf-8?B?bDVRK0xoMW0yamlhNlpkaWVLTDllQTg3OU1pZEZnZE9kOHJWUXJuZTBaNWJB?=
 =?utf-8?B?NHYrQzNNRVhzNTcrcEQvY1gxUHgyZkdreStDTWFCVlpkcVVGRkJIQWVKUGsr?=
 =?utf-8?B?ZjRuZm1JcTdEdG9BQUtOS1dYUk81QnlwVVdzNmRNMklrY0RUVmhtV202amNH?=
 =?utf-8?B?dHM3Nmg3SjQ4UDBwR1haQi9zQVpyakkzTldJdUdNRVorOEhpL2tkTWRjbHBm?=
 =?utf-8?B?bGZmdWNsZHhtZE55bHdhWFd4UDN0bmliL2VUTm5CS2dUNlgrajNWMGp4ZUVP?=
 =?utf-8?B?ejdnSkNBK2RpZUF1a0N6cW85VkZFL0VSKy8xejZSQmRWYTQ0SUJudXBiY2h1?=
 =?utf-8?B?b0s4WkVycSsyOVRNSHJxZTZ5WmJkclJHeHVEY0ZxZ2J2dmNjWk5xY0NhbnlM?=
 =?utf-8?B?Z3M1UHUwdzNHbENaSHU3c3I1ZkVLLzNvUGY5c1JYL2U1QkprNHZyY3BtMWZz?=
 =?utf-8?B?cmtqc2liU0Vva1dBRkg4SklNQlFxOVl5MVNkK3hBRk9UczVzTEVHaUx0Wm44?=
 =?utf-8?B?RE9VcDFYZlNtNGxvY2I5SnpVV1VZejFLNEU1aFJWRWl6S3ZBOXJNdzNSSzJT?=
 =?utf-8?B?UHJ3QVdOQ2JMWUN2c3o2ZUYzWVVlZGN3cHFHTTJDWWFIeXRJYW9TaGg1N1hr?=
 =?utf-8?B?K29qcjJuYVJoR0VkVFJMaUFYMXB5K0g1S1o3U09hZnNTaitBVTNuZ0xOUEN0?=
 =?utf-8?B?MnhadjRaSTVzdWs3amhwc0NJUFQ0RWFabS82dVhPRTNMVkxDc0czeDFYeVBW?=
 =?utf-8?B?cW1SRzhLdmN2L2xnY0hIbE5MTy9UdTlzMXBMNUdPQ0ozZDMvSjFEbWNsYlF1?=
 =?utf-8?Q?0DaF8u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEdOMTNlenJCWXBtRk9LVHcycWR2SldGTStpVDlyWDNsOGZ5V3FPRml1L21M?=
 =?utf-8?B?NER3MCtUdW5jNFkxRENJVk5OZ1VubzgxVnJLK1duWjM4K3ZEeEs3N0l0YzB3?=
 =?utf-8?B?NDhmMHNIWTBFTFVkTDFyM2tINkh4WXI4UmN0YXdGQkxJTUxJYlVRNjB6ZjFL?=
 =?utf-8?B?bGJVaCtBMGtBN1FVdUhtekNQMGRTQjlZVUNsR0FnMFNzTVo2RFBMWXBuamx3?=
 =?utf-8?B?d0d6cS9PUnNXYUw1VWxhMndqWktGN0QwaUhxKzhzdXZOcDlTTWZZSktMZEw1?=
 =?utf-8?B?dkpiNytBa0lwWmdZcWY1WXozZGFaNm5EWUVxVXZBV2xVOWNOSVVsU3lBa0Vi?=
 =?utf-8?B?RUk0VUNNM1l5WHQxWnRDVXlYVVBjeDlPS0lQSUU1MlpPQ1VkNkl2T2ljeHR1?=
 =?utf-8?B?MW5MSmt4YWtkZzJRS0EwT25DTVU2cEdXeWJoOW41OHR4Z3dicGRpOEVJREFi?=
 =?utf-8?B?dDRiYVcyeVhTRE1hT2dISjZLcVhES0pOd2ZDUjhHQktmNnJqeHFRRFpSaW5E?=
 =?utf-8?B?SEhKRVhJYTJ4UFlQK1lrWlBLZDI3Mkh5b3hpOEJsNFpnVXBnWHhnaHp4UVlJ?=
 =?utf-8?B?MW5nd1RyNlNQUnZzWU9kdk93YWRNL1pEdk93anBuOXRHUTZYZytaRGQyYmt0?=
 =?utf-8?B?dnJQWnI4YnNkOFZSVHpzb0NRQ0owQWQrVy93VGZhLzNoaWxSdDFoRytZN0Rm?=
 =?utf-8?B?YTgyaCt5cktlQVZtSG50NU9MbWhMMXNGUnNoM0dxTWd0Tk9WRi9qRHFKcjUv?=
 =?utf-8?B?b3JrS2QvS3hodmIxOURXYWNpbkFodUxVajdoNE5wNHV4SVltRHZWaWVhbENy?=
 =?utf-8?B?ZjU4N2hxVGMxWU54UENHVkNteThsa3J2dS9ISlZXTGY2NUJzL2dPaGZRTkdv?=
 =?utf-8?B?VTFWRlo3UkZySGNDcEJlSUVxYnhXdW03TlpkYmNBMjBmRnQ0dVBFNVQvRjd1?=
 =?utf-8?B?QWZ6ZzhFT056azV5NmtYSzBqTFdNaDFnWHlDanBtUktXNTlDL2F0T2FtMkM4?=
 =?utf-8?B?SzVDMmVESFAzdTFQS0k4T0ZKR2RuVnYzQnZRZm9vd1lqazNZaHpWbEVhVCtO?=
 =?utf-8?B?bjM2blBRd0pPeHNITkNCK1F2QW9SZ0RqTWRqR1BEd0FKQ3FRZEZPdVkxdGhw?=
 =?utf-8?B?K0Q0ZE85bmtIWWxsUWF1azU0aklwK0VYT2pjdG5neGRkWUlaMlE3L3hFaGpS?=
 =?utf-8?B?aG42LzU3MFJqNnNLNHc0WE9TaStGSnlvOHFvc2tKaFMyeHNZV3FRMW9ZQjUx?=
 =?utf-8?B?NHB3TE9MMWtGZ21xZHlpNWUyMnhlSm9pRHllTXBQTHdkcG5sWVFxZHFMK1BY?=
 =?utf-8?B?cFNZcERrQVFsQTR6ejh3UmY1eGxzakNzeVNJR1l3ZlBWb2ZuNVUxdytUTEEx?=
 =?utf-8?B?bnllU255ZDNtdHV0aTdUbTVJeS94NlVZU1BRN0JhbGRaemZKc0hDOHQxcXJD?=
 =?utf-8?B?UzFOVEdtNU9jS2JRWkNMZUpxd21zSDJURlpEZ1YvSHdBRXlyT1BLM0tNZ3ZM?=
 =?utf-8?B?TnBRWnk1blN2UHF4a2hwRFBHeVNXZDEwSnNIbEhBK0FObFlmT2RnLzhmTEVR?=
 =?utf-8?B?ZFlGakN6eG1PY3YxM2VxR2x4QXBBR1ZJYzk1bGIrL3BqYm5GTW8yVDU1OFFk?=
 =?utf-8?B?YWpDZ3R2enpuZVo1UnVnQVZoQXlWN2xSM0k4WXM2ZXlJcmJDbGc4dzBvL056?=
 =?utf-8?B?UUhvM2puTGNpVkhjanNBR25ncTRjRFArbWR2REFzTExlM25zU04yNzFlZlhi?=
 =?utf-8?B?Z1VVbWFXeWNlVnplM0VvNnlUWjUveXdGOW5EZGZiLytkZjU5ZjZmQ0hFa1BN?=
 =?utf-8?B?NzIwSElXTXNYenJNdHlaTEdWeDBEbi9HVHZWbFJYZ3dvdnJBbkNONzBub3ln?=
 =?utf-8?B?TTg3VGhLTnpma0Y1bnJZdkdPT0I2UlpBY1hlVkcwSGcwQjBuTkthTlEyNlFQ?=
 =?utf-8?B?bU10MkQwSW1rM24yNWh3Vm5uMDVpLzZua0ZhSXU2M1BucVBUVVZMaTRmcktJ?=
 =?utf-8?B?dlFlV2J5STlTRGF3TTliaERpSGlYS0M3T2o3MmNVTHorNEErUlJIMDZ2Z2pB?=
 =?utf-8?B?UXpDZXlrSmVVR3RaR3dINU1hMlNsYWM2aXBYT3BvYVVsbGl5UkNGL3lnQTk5?=
 =?utf-8?B?MzFMbmpVZFBBWVk5S0RtaVV0SUhBcmh4bmU0QndLcXVuWkRTMnpSZ1ZtanFT?=
 =?utf-8?B?Ykt6cCtuUVJodmxNckhzbDBlcnd0YWNkaFU4Qk1ibDlBQUVrSWMzUjkxaXUw?=
 =?utf-8?B?a0VUTUhuZzI3aWxpcDdKK2t5bCtrZGgvWmtncmIxS240akdSMzdVY3hUa0xD?=
 =?utf-8?B?RVByS1pFNWN5WmgvanliaFlMWTBocVJINmZNaytXLytjSldKZEp5Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbd0800-d664-440e-f28c-08de6f124505
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 17:22:19.2718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hCcGpcLyOLG7iJf+a4lz6JFxgqL0zl4kNSrmbfiIyy5lE7BW1zfAyAAGxE3Hz8cXo642NZavUXxFd102zyxqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8527
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

On Wed, Feb 11, 2026 at 03:53:21AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/gpgpu_shader: set r1.4 to dim.x
> URL   : https://patchwork.freedesktop.org/series/161427/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17971_full -> IGTPW_14528_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14528_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14528_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14528/index.html
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14528_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-mtlp:         [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17971/shard-mtlp-2/igt@kms_hdmi_inject@inject-audio.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14528/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@perf_pmu@all-busy-idle-check-all:
>     - shard-dg1:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17971/shard-dg1-14/igt@perf_pmu@all-busy-idle-check-all.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14528/shard-dg1-14/igt@perf_pmu@all-busy-idle-check-all.html

My patch doesn’t affect upper tests. The failure is not related to my patch.
