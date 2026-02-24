Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5A7EFB819
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 09:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE06210E535;
	Tue, 24 Feb 2026 09:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CH2aZWeL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF4010E527
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 09:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771924173; x=1803460173;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C4U5gSJDCeQIhlFKWjLiQAyOWbzYcXuoGF4k1203Fw8=;
 b=CH2aZWeLb17TXVdrNHkbbmo23TeS9kbQJqXcpqNPxZJ+RRBliAW1iifz
 fYnyGTPa7GT8vmG0IGeLOcZ5gGje0VIoTdgWkZe6Ux199ZeSo1T7XcGCD
 f0rKrKzE1Yx8p2VcbiIa/DKPOrDwhcEj24STZ/+DD0BaSEKRNBJdTXTlR
 YRCOvLTko1ljbmmshvwjTFnCr/usxTuROjOBdt3UbMSJM/v9+V8YV61+r
 g9UQijd+zeW93/e5bax8iucjuz+5+r4t0ClGSCo520ngisMKR8LAIOqHm
 RZQdE3OpioqqGGXhBEjib12JGSIAZwzAqOpTpb0/zffyIMN2NDPgHTvwd Q==;
X-CSE-ConnectionGUID: XoUv3cWeTyigubnvwespMA==
X-CSE-MsgGUID: Je6rrTE7QuyhqfhyKOaDzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72844424"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72844424"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:09:33 -0800
X-CSE-ConnectionGUID: K04th7c/R1WOe8fjmaLd6Q==
X-CSE-MsgGUID: IyoN70/SQR6W6GoEfmPR7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215862596"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:09:33 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 01:09:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 01:09:32 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 01:09:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EswyakCXAtQ+0Q5Wsoeo3x4x0I8KABLP4F/xOjuRtTq6/XFnbk2VIpJ0myeZPwA+OYVdeVCR9pQdG7HSY7yNNg8dZl9Od5RdRwpcq/C1IonzKDu4+tI5r4X+/YxPBqzYEeZ2rHEthIc/Bn3afaUSYKGEHdfQHomhjBwvWtJsLZ+eom/JrDGjOPNE8wt1/4LqtNuxuUigbQVizQWcVxliT2cfJB2sPto+zM46c4XPvAb18FaqCJ4UW08T3FWGtg0GvJAS6jK9OLvYcQIogbKvo4OMnk9YeSt4b1xjgI9S/ciQWoruJMnwwe6BKioGhjbBPjsUfYup4fkdMiu/TIOiLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EphfTMHQMiPQECDhcaAsTtib5vLwKBL2z6G6I3sUzfo=;
 b=QSWhlyYqVi69u1x+YvIlqe5WMlAlYnHR3tOLaQg2PllZ0UTP8a17jMasYvIT1AN0q0Fji9Au4Kqtr1SWV+rPddghKW7+n1OD1vSDU9yHozMXHPjWBfsPNpzivuNaBz63CpK6a90C0A6kcCLT+0GpWi2br0yGFC3sSxRNHGbYXQo0M1KnO1j7m45BK0Y2g/sU1VKEcIvLTySn1TUH9UbZnpz0YrDVOhyhjg5Ri+mNYkfP9hmRmDpSLoYtuPTkyrsp/GwmJa1e9fTkjG0AlmcpLX+AFAR+QhfDZDpq34HzoJsM1IspPswz1p6sy+kfpCDJbVZo5TD5ArA/tEFVo6V/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 by DM4PR11MB8160.namprd11.prod.outlook.com (2603:10b6:8:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:09:25 +0000
Received: from PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::84fe:e701:add1:4de5]) by PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::84fe:e701:add1:4de5%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 09:09:25 +0000
Date: Tue, 24 Feb 2026 09:09:15 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>, "Marek
 Beyer" <mbey-mw@gitlab.freedesktop.org>
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: fix JSON comma tracking with
 per-level state
Message-ID: <vtlinhydp7tzirr6j6is5lhka6wizrxyyfrjbzc7x4r5ccwgtd@h3ufjtb2pkzg>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <4edeeeddd4141f3de463548785d3d9a4ca696823.1771848992.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4edeeeddd4141f3de463548785d3d9a4ca696823.1771848992.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To PH0PR11MB5064.namprd11.prod.outlook.com
 (2603:10b6:510:3b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5064:EE_|DM4PR11MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 05aa0c9c-865c-488e-d134-08de738467dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTNxUFNHYzhERlhhZUkvVTB1TnM0MkZTUTVGQkM3QlNPeTN5dHVwaXUzNHAz?=
 =?utf-8?B?dFpFWUZFeFoxditEdnVXTmNvWFZDVDZZdFhsUUtIS2ZFM0JDZDNTYmErT0Fz?=
 =?utf-8?B?TXA5RWMwaWRMTktVZjc2dTVxaXRhZ2JtNjJCaWs1emtGN1Y2d3dkYlVsZW04?=
 =?utf-8?B?ODBOUStNSi9HRC9WQmgvYnBYdE5zZVRlekN6Y3FkUkJPWTBObk9HWGlFZVZw?=
 =?utf-8?B?TTF0ekJFNlFia0pTRXNsOWhtZmRvYXdPeTZjQW90TkJHZ0l6L1RqandrSW9I?=
 =?utf-8?B?RG02Sk55eE5zMExWcWxyb0ttZUVYNlFETS9DQlBReUYrUGpndzFocHMwSGRv?=
 =?utf-8?B?RmR4L0tDc01wakh2dUo4TTBVZ0IwZVp5YzkxdTI0T3pzZGN6SDRmcmlIdUlZ?=
 =?utf-8?B?cXRwcWFGVkxmRlc4aVRhV25uT1JBcWV3NkMzeERNU0F6RU1wQ2tNVmhaaWRS?=
 =?utf-8?B?bWtDVDd6eDdXaXV4a3dlbGFiQStLbWxmZnhaLzhYSGViTDlxSE9HTTV3UXhN?=
 =?utf-8?B?UEtLTGF5NFFoTDNYbTBrRjBjT3R3ZEtIZnFXV1NBOFZHSmhmRkpwMnFuaCt1?=
 =?utf-8?B?YTQ3NlpKWVdXS0dLRHNmdjRIZlRtdUczaThoQzd4VUo4dUYxQUVNb1JJMi8v?=
 =?utf-8?B?T2dubjlvaWFHN05rQlFGK2RrUjdDUHJtUmk0NStrdmQwZzFiYmlWSUd4aXRQ?=
 =?utf-8?B?UVFzczFSakNNNCtUVjJLMWZ2aTdEYjN5andxY08raGJ0NGZJUWIwaWtIUzZE?=
 =?utf-8?B?a1JyRncvSnh0L3RMUEEwMGlwOTZLTWRlcWh5LzBVSTcvQm5IUXltRk5PV0k4?=
 =?utf-8?B?Y01Jb3dFM3A2M24zYnNldHZlSXYwTEx1WlJuc3picGVMRU5xTnF3djZsNFNW?=
 =?utf-8?B?dmFCL3lmRVRlcUNYdjl0MXRwVTduZzU2NmtuQllUbVlFNVVVamxqUTBKVkJn?=
 =?utf-8?B?TW9qZURnRm1yN2VtU0dKZ3Zqc2N5ZXBBWHphM1YycGZXVkpzaEM1cDhrTjBJ?=
 =?utf-8?B?RUc1dFZ6TUJzUFhqaWR1cHNzc012NVZ4VHpBRmVPYTBrZGZKTFk1cHB6dWlk?=
 =?utf-8?B?bW5kaEsyU0ZhNWpMb2pXOW1EbnlnKzBUNnJmbkNWSi9acVlDRnVPcnVFZlAr?=
 =?utf-8?B?VTlVSy9GQmNMSm9FajRRT2RsYldCRDFqdTNycU42eUQ5TGN6U0RZQTR0MTV2?=
 =?utf-8?B?WGhwcTliTUNUdEptazdvZUp0Q0djcXZLYy82a2xNRDlpaStKenJrNzYrZTAw?=
 =?utf-8?B?LzBNSVdzd29Dd25NQmErUVc5NkMvakZyTWlWeStNNlhPekM3d2g4R3Joem9u?=
 =?utf-8?B?Y3A2VWtlN2hZSFkzQW5LQUlvOVhydWx4Y2o3T1JCc1FhTmlHSVhnUEdUMFpn?=
 =?utf-8?B?YUtoYmF3YWo5d3NraXp4V2g5TXdVS3pYYU5tM2I5TTUxRnJTREx0N2ZQTjZD?=
 =?utf-8?B?Zk1RdGlVc3R6bkpYeHcvT2F5NnIzenFOczcwT3BPTVNCUlNTWEM0VjluWitC?=
 =?utf-8?B?R1FGTDJldXlDQ1VJZ2hKMnJXbTNQVnc4VEFKQlB6R1A4a2VJOVhkWVp0eGZz?=
 =?utf-8?B?ZlNEVEUrbG9oZmFVT0lsQ05neEhXRkovRjd6STBnU2pkbjduc0RvSjNESWNs?=
 =?utf-8?B?RTB4dUVrcnc5eXVqdWtnc3pnc01Wak53d25HYUQ2L2l2S0gxRWVCUG1ONy9M?=
 =?utf-8?B?UlR0N3pMYXUydEQ3dmltenMvTm4rM1BvbENtUjlraFZadFZ3U1JHVjFvOXFx?=
 =?utf-8?B?RlY4azFOR0JYTUkrOHNPTXVCMFhmK3VTOHZ4R3hUb1VuL285bWo2SGQxbkJw?=
 =?utf-8?B?c0dOTmQ0bGg5UENiRDZVZENmYWMvVDVRb0orRFNiWnlDSnRIVVhGQUxlSjgx?=
 =?utf-8?B?TDZSSXV1MitSeGxoU2xjRzZWUWZaelBVU2FOSGduUmdtcTI3ZUdBVFg3MXJG?=
 =?utf-8?B?UzQ5M0RhMkhZL0lPOXl5YlF4VzZkU01JYXZheVo0cUswZWFjbXVndUZhcHBP?=
 =?utf-8?Q?nt+NCPMvjlH1DBdMK90KHIplF/ySFo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5064.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjV1SmMydi9PY1RFdnZVeGFWTnBEY1dSVklpTVhBZ3FtWTVWTGhOalRRZnFY?=
 =?utf-8?B?alI4R2xvUmZCbFVVZmk2RE9BRDBnckNUYzhzWVlTNCt3RUtURnpVM01IbkNy?=
 =?utf-8?B?UU9VcGpDb1JDL01kYytUN2E1V1UwdW5SY3ovNkhjdXNyUjd3Qy81SHpMZlp0?=
 =?utf-8?B?ZDJvWmZKMzkxRmM4RWdTeTUwcjJoZithVEZyT2pUU01EZTliM0NuN1J6MWE1?=
 =?utf-8?B?dzcyM3pzS3ZkY0hKVXNSQ1hQeG9PeTNvVXhHbDE3azkydUhuRXJzeWdBQXgw?=
 =?utf-8?B?Um1qa1RqL0ZoWS9ROXJjdXlwNkRjOVJxS2RxWlBtOGc5Tkp6OGREUU5IZ3pQ?=
 =?utf-8?B?b3ppWTVEK2s4bjk3UG5QR0RQS3ArQlo4MHJOaFcxazhHeklleXY3clJXM2g5?=
 =?utf-8?B?Y29tZ215c1Zib2dPOEN2bHcrL0Vab2FVOTMyd0tqaXMxNDB6Ry85dTFzNm81?=
 =?utf-8?B?MkxEV0NYTTdhMkt0ak5VS0Rxc29QUjZRcVQ2VGRtcEs0Nk1YTTZKYmNvZWYz?=
 =?utf-8?B?aHYvcWs3cW5ibjJZaTRNOUJDZVRTWFNaWVppN1N5K3lJVllJS1VNNjRMcHNw?=
 =?utf-8?B?TktudXdhQmw3OUk4YlpmQUZpb0wwWEZIRzhSZXFsV2ZVeDZuaDlGek1CWGhl?=
 =?utf-8?B?VlJkTUdwQVBVL1lJLzFweVhpaUpyMFQwY1RQMXdwUFNzUWFUR2NiVnBHK2pC?=
 =?utf-8?B?U2VFTTYyNkVZK2pFMld6ZzdubHdrV1J0dkdidU1WOG5EQi83N053aGpYeHhu?=
 =?utf-8?B?Y1lDZ1VVWERCRzB3a0RaL2NTcDlSR1JpN0ZoZU5Id2JNa3FEVVM3VkNIa2tx?=
 =?utf-8?B?QW1neWRrdTVuVklpWnlXWCtuZHo1TmIwdE5ESVhZQ0Q1S0d1SkVTbk1XUU44?=
 =?utf-8?B?QWlXdzY2c0htZlltc3drWVlwTlNnUWdEb3lIQk51b1l5KzQ2elJidmtQTTNM?=
 =?utf-8?B?dUtzM3ZVSzdKb3ZOZWR3d0xlY0x5UkVpUWJwRVdZcUNTTEZtaHVjRDIyeDhI?=
 =?utf-8?B?c2NiZUt3cDVsdkZqZm1wRlN5TXJEQU5mUXFkVzJGcFFZUlFVOU43WEE2ZmRm?=
 =?utf-8?B?VjZRNHBtRENYSFE0YVVMY1Izd2s4TG9meGpFZnRyZDZ4SldXdlB5enk3U3ZY?=
 =?utf-8?B?T29oV2NXTFhFV2Q3RU1rTVhqeDRMN3l6YjBDbndxMm9La2ZXYU5KZUtQYmJB?=
 =?utf-8?B?QlNDc2NXcDNBSG9GcUNPUDdjUVlRMDBld0ZBZXo3WWdKUFJvcVZHWDgxMHhX?=
 =?utf-8?B?YmRFTXdLUFVHbTA1VisycmtvUzA1em5vaUhvMWVBUmNjTFRGbUxMM284YW80?=
 =?utf-8?B?QVN2M1dGcVFlcVNOSDg5eS9oWkhxSXZtQ0RrWXQwWk4vbjlVTzBSN2hvNUpC?=
 =?utf-8?B?cUpJdW5MeHhDZFphK3Q0cTRHNGpINEIwN2lTa1dzMjN3ZHdNV1VXT1F0M2Rl?=
 =?utf-8?B?OGE5NVlrU2l3SWRqUXpDcVRBRFh2a2hueHd1bTFsMVBnRVhNSDRIdmFySEJy?=
 =?utf-8?B?N21zTlZPMGQ3S0llcUx2QnVqZ3hjd1ZlNEZmWllEQ3RrNGZkcDMxSDdDMjk4?=
 =?utf-8?B?ZUlIVWJQQjh2ZVFKWnI2VDAxN1dhbEtBTi96K0JVTVZwYWUzMitCdENnQ3Bq?=
 =?utf-8?B?RTF2dHU0SlpCdU52SmVzeDhsVDlmc1JKalEzQzh1bmJkbWRkQ3kvditpQ3NW?=
 =?utf-8?B?RmUrNUpvanEvc2JhMUNLV1J1enl1RGo3cDNjQjlJMEt5QXh3akV3UHA5a040?=
 =?utf-8?B?WDd1L3hrQjRCcDZ4ZFBza2xsQ0YraTBmYVo1NUtaYmJPN0hvYmkyZmZXc2Zw?=
 =?utf-8?B?YlAwQWVLRjYrdlBjT2dBU0FQRzVMYUVMUUdoMFcwZHV0T1pxa1dGMkc5Nklq?=
 =?utf-8?B?SWR5K21zYURxM0p1M0c3UDBYa3lMUzNRUmhBSUlwQkhDcjYrb2llVEltZnR5?=
 =?utf-8?B?T09wUGRmclRUTllEREVMYzlCZE5ZcVR5U3RIQ29mK3M4eDFsM1NsbE0wenBL?=
 =?utf-8?B?OXFTc1RqY3dRYmJzaHR3U2x2NVBMeE9xY0hoalpmOUNLQlFOL0lmRVdvdHRw?=
 =?utf-8?B?WmhqVnE5WDJiKzZsWFd5bzVLdjVuaDZyZHRyL28xeHBxTUI2OTBtNjZqUTI0?=
 =?utf-8?B?TExIekJlLzFrQlllMDZueDVVeGVXMzVtY0liVTllQlpCZXJDblJNeitpV0RK?=
 =?utf-8?B?cXRwRWdKdjlldFBsWUpoV3UrVTVhYm1jWjArc05hN2c3V0N3Qi9XVWZhU3p2?=
 =?utf-8?B?YnJ3M0ttZnpxaDdFSCszNWZkS0tTaG9BZnpkMDZyYXZqc0lTbzhMV1NjT3FQ?=
 =?utf-8?B?bFNZQ2tocDlKbmVWekNpR1N3WkQ5aHZBMEgrWFVXRFVYUk1PcjNxKzZBc3ZK?=
 =?utf-8?Q?d6ngiGovi/jFT2sQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05aa0c9c-865c-488e-d134-08de738467dc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:09:25.0094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjZIu2QXTqYhzE4VKxVoZo/aar/1nkdFSkHKYGi/lK+WBZJnX99wHaaGSVQKo2J/8kKKzb/LDEuHSDNbDlpricSm3lyV3nRON5dztHFgzM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8160
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

On 2026-02-23 at 13:23:42 +0100, Sebastian Brzezinka wrote:
> The previous implementation used two global counters,
> json_prev_struct_members and json_struct_members, to decide whether
> a comma separator is needed before each JSON element. This approach
> only preserved one level of context: opening a third nesting level
> overwrote the saved parent count, and closing a nested struct left
> json_struct_members at the inner value. As a result, when an empty
> (or any) nested struct was closed and the parent then emitted
> another member at depth >= 2, the leading comma was silently
> dropped, producing invalid JSON.
> 
> Replace both counters with a bool array indexed by json_indent_level,
> sized to ARRAY_SIZE(json_indent) - the same hard limit already
> enforced by the existing asserts. Each nesting level now tracks its
> own "has preceding output" state independently.
> 
> Suggested-by: Marek Beyer <mbey-mw@gitlab.freedesktop.org>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/199
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---

LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
