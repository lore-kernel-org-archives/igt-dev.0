Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAACD5C0C8
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 03:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000E010E29B;
	Tue, 16 Dec 2025 03:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VedUrAVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89F910E29B
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 03:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765855608; x=1797391608;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=o50MAxuYvwtEW/u6gTXzrD59DcdmIL/tEq+IYXaXXV8=;
 b=VedUrAVBfHx4vRtfnTObB6oi0ljzhWiyMWKMPz+AN5RmMLlPkJ4DBe+s
 i2f4qRWx/TtJCNptGup4x8VvYqaPK5qFIhytoFYTdNHwhXRcZ3QyNIbUV
 hWpHnHGd2HeG1DTB4vsmhDhCB0NzZgkRyn/lNQZccP9Zr3cwbyYS1q1Lv
 BkEWUizx+bWJapM/RRuBpzAM2moqZ2yodqzpZoQsiHf46uOhltgYIHHYv
 NoGO7cDyfk1Mk+to9abPsExE4joOH6f/+QwQ1i2jA3ImhSoaFYsf4Lqqp
 fanX2xeK6RFmsQU+3ABthWllPbex5d9ttqDD5tCTycMsL6pYjA/kSBwfR Q==;
X-CSE-ConnectionGUID: gfkFx+DYRr24ugeymi25Cg==
X-CSE-MsgGUID: 1meSLl+/TE+cu1V/B5tT1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55333299"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="55333299"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 19:26:47 -0800
X-CSE-ConnectionGUID: 5Xdw2oB8RDS+4QDmjIRiBw==
X-CSE-MsgGUID: PcCWOjwsQpeDXtlQ7GBcww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197947632"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 19:26:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 19:26:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 19:26:46 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 19:26:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0fC5XFDkU1O5bMBj0cNcW4yPn+mZw4ZKRIz4AyH7YK/cysdjUL5Nnx0hkZpFtD6STKXr1QpXfuGB9atpinIdm3MDBBu65h+QY3/ySXbi55M2KLNLbok+A1gIyXiSzV0GM3fETCtt5frMAlzljSaw00iMw4lDpCqd4rEqP60jcnGj6seeYJvRxRvRmHQEZR43xKyEaNelmGzAmsUKzHjOfi7ZR3KI+1IQovkPS4JhLR3CRLpY8RWlfYHPq3NcO7ZfmQjL6FQe08uf+aRQ8JrS80dkSzTIl7pmjayeuPLj61TuxVHgL+e57p7gLdtLqnzHBDRFMtR8qDZ9GyBrBWS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uM4kei+EJQ5UvZy4hDkdn3Hhw2834y5Zpjd3+5A8KuY=;
 b=NMd3b+hxVLgsFC5An919HVOlgqDVGLw6q8oU58wo2/UEyTpi/IZwJiZpFynbmN3RyRr260eJGxsg2/62zUODnqBEc7boF12nxvkrf/fPU+PYtqq+RpbY1fdqrWUjgSGvPtCizi7KqocqtLY64GL4KQ6x33HQomvmetbEz0Vo9LqYrRmxEI4lNEnxfJnr6kivofBXbc7r4P6w2xYaHYbmS18nC1Qw780YQTQmLiFAxW3zDJYm5qZlTA5C/j8q4o8vlXzU7I/i2hTB+22I/l/YfUON6MSzr9kJkjj62g0StiCbn66dTzoc88Lu4r2GE7c5NHv1Dii/84NaQKJsB3vs6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 03:26:44 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 03:26:44 +0000
Message-ID: <85839062-d6a4-4e56-ba4c-88059de29f2e@intel.com>
Date: Tue, 16 Dec 2025 08:56:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/4] tests/prime_udl: Create subtests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
 <20251215223639.117028-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251215223639.117028-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0161.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::12) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: afdd3271-7479-416d-b67e-08de3c52efe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|42112799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFRHU1VYdnVGV05kNk1tNHpud29OdnpuU3UxS0s2dWdocVhLbmlCbmlxUGxv?=
 =?utf-8?B?bm5VOUhzaUZmZG53TUk3S1VDSGZkVUFnT2xzRnVyekhKV3I2SFU2bjlxNU9X?=
 =?utf-8?B?YXU5dU5lZDJpZzlkL2ZpSnpWaWxZbW1rWVkzU1V4ZkNVaUlzK2U4c0ZWN0x2?=
 =?utf-8?B?R21tVDNjMHhjTUppVm9sdHVlU1JOT1JiRDAwWm93eHpveG1OOHhzVVpSLytL?=
 =?utf-8?B?d3REK3NDNFhLZWJDbmd5a0Q5aWE0WWF6cFNIZ1dUam1yeFIrVkRKMURwWmlt?=
 =?utf-8?B?RSsyeXkwdE5GTUpvRFlrTTFPMlVGajRKeDBzTFNrWXF5MEh1a25lRzA5dGpa?=
 =?utf-8?B?S0FEbmczV1hjSEZTR0RneVNNR1BEMFVyNlFKSTEzRjRUYzB6Q3dzSXdiWGxF?=
 =?utf-8?B?bVpJMGlKNUY2N0NoN2F0aDFKRmJNanAzWThsS1FRT2U0ZnhPVFVOUDNrL1Vp?=
 =?utf-8?B?ZFRNY2JvMlkxRjlndUlFL3ovcGN2eG56UE1PdmdMSEJMaFBVdENGUHoxbXFC?=
 =?utf-8?B?UFFXUDFoaGJnVWxjYzJoN2trREpyMkxlOVFNRDNCTVJMVUUwMVpnOG0wTjZE?=
 =?utf-8?B?VzN0dHo4cmZLSUhXUjc2bXR6bUN6OVh2cy9nTldsVWQzMzNESlc0Nk9XTnE1?=
 =?utf-8?B?d25sQmZ5ZFdMR2poaGVVVDcrOTlJN0NyUEtsdy95MW9JY3p6czRnTEp5RTNN?=
 =?utf-8?B?SHlXN0c4R2wyVHA2cThRYkZFTE5Xak9Sa3BhL3dWcjF0czZmRlBjUGN0WStr?=
 =?utf-8?B?MW5JcFVVTHpCdXpEUlZTSU1wUmMzcUxYb203SXY1ekx6RVZ6azVPTXJJOHZO?=
 =?utf-8?B?OTd3UDNORDNxME5GendRTXpPbTA4azJvRnVybjhoZEcxbDFLcHdtZ0xlVXlp?=
 =?utf-8?B?U2ppR1Q2RDViWmgyaGtETTd6ZWtnR3J2WmNMVEkwSStZMXE3ZDBFaVhUUHJ6?=
 =?utf-8?B?NUx6VW50eGp5dGZwVVBrWjJkR21CWHh1eVU2d1p5dUwvWWNBcHVxc095aFVZ?=
 =?utf-8?B?eEd4Tk8rdFRiVVRWYVBrLzQ4UkJ1L1UxRFNpdUxldGhFaVl6VDRjUk4yVjk2?=
 =?utf-8?B?U2FzQUhCWEJ5cmlCbEFwLzc2Z2hUNm9pNnE5MnZLenBUSnhkVGhRbzNoQlRB?=
 =?utf-8?B?NTl1SlczbmRjd1pZZXVGYXQxOHRuZTNxQTd6dU4yd2YxTFBqeVE0akhhOW81?=
 =?utf-8?B?a1BoSjRHSGhzRTBxU050cnNSNEEyYUw5VXVSM1VMbVJmR3dsWEFkRnRCNytl?=
 =?utf-8?B?SUNHL3pwWldieHFmWjNFbjZrdUZWMW5xUjhvNW5oY2NleVVzS3hjM29FZ3ZK?=
 =?utf-8?B?Wnl0bnVON1FxM0d2bFYvQ0VTR3FlSCtDb0FjbDlJVFErQUdvVlJiaW5ZRG1p?=
 =?utf-8?B?SlNZanhlRi96U2dUcUhYL3NSUG5TaC81WHByN1VlOHB5YmdBTThJOG4zRGtD?=
 =?utf-8?B?NUdJbS9KcXNVakI3VEpyWDhZMjMxNTMwTVk3ZWtDa3AwVGVMcVRIeTMwQnVN?=
 =?utf-8?B?eDBXa3RFWEZ5bkRMMHpWUG9vd2plRzBVeFFVbFBnaC9pRmtidnNLZlVwT2hO?=
 =?utf-8?B?WUVIZHYwUFFCN2s1RjBraGdmaldtTDlrd3BrbVFqREY0VTIzZG9qTm5Da2VX?=
 =?utf-8?B?bzNnNUdOQXord2l6YnFPMVRWUmZjK3FHV2Q0YWJOZGY0bWJ6NHBRV2FsVWkr?=
 =?utf-8?B?bjVOTFI2d0FRb2poWW8yWjNESEx4Q0NNbXBYZkVoazgxaUtpNisrZHZQay9u?=
 =?utf-8?B?Qlh6Qno3anRESWlMbUNNM1Fkb1NqMWlLdDFHUEVqTTBvZGgwU0JQb3hpZ2l6?=
 =?utf-8?B?V2dRWURkNW93NGwySERLd3Z3UEhkcUxBUUJaNDExUXB5VDNjbjduRzB6ZUxW?=
 =?utf-8?B?aTVTZjhxZVJBeTgrZFp2S3I5SHd3eDZ2UjZrak9vOTNhMXY1aFMzQ3lEOXZ5?=
 =?utf-8?Q?MVcJiXtbJ2zJgUZt5JNNz23g6+/4b77W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0hvM085bnVtK2dMT2RuUE9sSlA5STQ0dHVzMDVxNEpSUHVXVUI0cnFVVFlH?=
 =?utf-8?B?MzQrTTBPSEFaRjU5N3ozNUFqMDhRSTBOYWxIak5uUDBWK2xyWVcrWFlZV0xT?=
 =?utf-8?B?UGlGR3d2L0IwelpUK0pEZlhMMUFDSkM4SWVhdTg1dHdEcFlFK3h4ZjBQUDM2?=
 =?utf-8?B?Sy9ZM1FPTTY5ekxDbXcwZ0RSamFnT1Z2c2dCUHBNZ2xjTXpMbTFaZnRWZ3dW?=
 =?utf-8?B?QVBsTkdISjI5aDNlQ2VTWVEzTXJNSVg4Z01kSzVnMytaRlpsNmJqa2o2b3ZL?=
 =?utf-8?B?KytiVGFydnJRYU11azlWdjA3Y0xMQXBPb0hYdzJMdElrMy9ZTVhuemx1VEY2?=
 =?utf-8?B?ejZNL2RMV3E5aTQ5L1RXSWYyRVlJSUJIRSthcFdmN3pnay9LTDN2Y1dlSVND?=
 =?utf-8?B?R0Vlc1g3OWQreHFBS0pHQ2RZVzNiaVhNL0NmNjh0aER1TzdBaHhzLzBYVHEr?=
 =?utf-8?B?K0pFMjdPVjNrMUk3dnAvS0JrZ0xrYlRKQXE4VStzdGt3YjhZeFdYdkl1czhn?=
 =?utf-8?B?Z25VTW5QUmt3ampxSWJnWUcwajNOTXFOTkdqK2ZLa2h6Z2p3cUw0RWVxSnd3?=
 =?utf-8?B?RUd5MVNVeXJ0ZmxnKzQ3Q21rNkFmSzN1VmFaWHhBcmU0M25YMjJ5aURxN0ta?=
 =?utf-8?B?NUh6Z0N4Kzd2TmU0cmkyU2xpYTcxcTBtblErWTZCaVNNVUVWdWs3bjhtRklR?=
 =?utf-8?B?RUF5T3R4S1JNOUYwNmtIOTVLd1VYaUFZUFlrY2tIOHQxdVlad0paRDFwUDJa?=
 =?utf-8?B?Slhibm5sMTVsVXI3M29EeFVjQU4vblN4cCtOMWVaMTdXWkh6R3FqTm04VlR0?=
 =?utf-8?B?ZVIyOVRDUVh3TTJGcm9ibnFGdUI4VTh6MjVaTFk2aWhPNFhCN0ZmOVh1US9T?=
 =?utf-8?B?LzFJdWFKaWZtSVBBNjJMWDR5cjkrS0o4MENGT21PUmR0dm91bDFqbm13NzEx?=
 =?utf-8?B?bUtvdjNodVBFUEpHc0ZISFJEOGpQT1dJLzdjZ2NueTUxUVJBSTVQRXpwZXdN?=
 =?utf-8?B?VGtoUGd3TUZxRkZRc09BOW9iNmpEcTNCNkI4Q2hJT090RG1KdVEza1RlOFI3?=
 =?utf-8?B?cHNIN1Q0dGVzdmw5VjYrSWFEaTVESzZsM3lBa2JoTmVOYUZnYUJlakNBOW1T?=
 =?utf-8?B?SlZBdGMya0syTkcxRzZJN1RJT0FDZFozcU1qV2dmR0lkNWQ4a1o0QURhNWlU?=
 =?utf-8?B?b2lnQlZuZjA4bFdXOTJoUi9jUzVVQ1FyRUl0OHg4Q29jNjVDZUdjVWJkb2ZE?=
 =?utf-8?B?aDF6eFhxZlNLdDE3SzF5MllnNGVjUVpvSGxqZkFIQ1lnemIreWVlak1aZW9p?=
 =?utf-8?B?RnJCWmZGc0l0aEVoYi9MVXVCYkxoWjRGR0tqVjRHM3ZBRTZZQVNKNGZnb3Ra?=
 =?utf-8?B?Y2RNSlNmbDJzbERsZnRaR0s3US9wbHJUM2ZERThtb2ZlaDNaQUIxWGlvZDkv?=
 =?utf-8?B?M1l3SHNKelJlZXpUTm10OTFnYzdIWXdXYkVsQVplNjdWcGY1ZVVtRmxzemR6?=
 =?utf-8?B?UWlWT2UxQ0k2MEVIMldYeVUxeWVBa2pMWW1ObGhGZEY2N2VVcmFTOElPV25z?=
 =?utf-8?B?bXd3V3pOUFlHNlJIUzk4d2ZiRVA3TXM5RFZuc2FSV3dESzh6SHlNbngrZ1VJ?=
 =?utf-8?B?WENjVnRKcU5xNllnN2cxYUVlZUdFRE5qZWVPbGdHWW4rWnhtbjJRd0hKSXJV?=
 =?utf-8?B?Rm5GdURCMDNyNTRLaWJjME1HNHgwbXc3OGM0MXl6Y0NvcUNPUDJmclJhQkt3?=
 =?utf-8?B?OGJWWjlib3BWT2dTdGNBZFBwNHJleDFmbkIvMDNvOVJXNlJVYlRFaUJobXFW?=
 =?utf-8?B?ajVPMWlHdUFMYzBJSzlvMzZzYkNDOFdrcTYrTjhpVDJrNXdJRk1nQXpQWEY4?=
 =?utf-8?B?VnhISkwwaFJrZWkrejNOaVpaUUFERVduTDZPZFlIU0NOaERYYm9VdFJyanhp?=
 =?utf-8?B?R1VMb0kxNUYwU1dXTjJwT0M5YnNwOWJpM1pPTTY0eW42TTJWMkROa1AzcGw3?=
 =?utf-8?B?YmpHUVhCd1ArVjRsQlgvaldpdFNXMnJPS1pNUGhqVDFCZ2c1akgzeDRwTVNa?=
 =?utf-8?B?ZjBaRlZoWFg3ck10ait5YlQ5cXBmakJsaExycEJka1FKVWV2c1pBY3M4b25h?=
 =?utf-8?Q?zpAodg9LLVaWT1yv6Eyw4/Vtg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afdd3271-7479-416d-b67e-08de3c52efe9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 03:26:44.6333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSh4M0cXp2UBFVIt7ynuUgqfNxVNOpkJ1l8YUvKPK3IY7BuZAhbhRfQVOfxPssF80p8CuM+HPRnKfOktU+t1ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
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


On 12/16/2025 4:06 AM, Kamil Konieczny wrote:
> Refactor code and create opening fixture, subtests and cleanup
> fixture.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/prime_udl.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/tests/prime_udl.c b/tests/prime_udl.c
> index c3e92be1e..117663a30 100644
> --- a/tests/prime_udl.c
> +++ b/tests/prime_udl.c
> @@ -123,16 +123,21 @@ static void test2(void)
>   
>   int igt_simple_main()
>   {
> -	igt_assert(find_and_open_devices() >= 0);
> -
> -	igt_skip_on(udl_fd == -1);
> -	igt_skip_on(intel_fd == -1);
> +	igt_fixture() {
> +		igt_assert(find_and_open_devices() >= 0);
> +		igt_skip_on(udl_fd == -1);
> +		igt_skip_on(intel_fd == -1);
> +	}
>   
>   	/* create an object on the i915 */
> -	test1();
> +	igt_subtest("share-import")
> +		test1();
>   
> -	test2();
> +	igt_subtest("share-import-addfb")
> +		test2();
>   
> -	close(intel_fd);
> -	close(udl_fd);
> +	igt_fixture() {
> +		close(intel_fd);
> +		close(udl_fd);
> +	}
>   }
