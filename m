Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DF5606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 15:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FBXIehWQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97D8112364;
	Thu, 29 Oct 2026 15:04:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6011112371;
 Thu, 29 Oct 2026 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793286184; x=1824822184;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rbNw0MUpRlUkEY/R1Wj+q9TqgT3fNkquP6Qnc/EQ4/s=;
 b=FBXIehWQT5E+VFguSPl5vVMpiJeET19YGo/XvFYVlWNgw5dfaLqfmP1X
 DXV+nZQRSp1rJMUlFsBgzI5dcXLIJ348Pir+SAqxM8U8pjvCRwJ46euo1
 AuTG+E4272g1aTec4Q0yGuwuEdNDRM7T4rC1oI3EfVm7ZPpGYyT1GP9uB
 PeV8+XWaXPO3yKtJsn8yoPPEY6qOv5AZYBynhPeEydm6M0K5FczjibylC
 2RH0lFByKXNAoJQiD/y4CJQxPpiUbIwBpDZ/UH92dAHT6VRv2jnbjopIy
 /R3NNd4RNrWKC3l5Fmd/cwIXah2ey0KdcaA0/+DJLp/6X32P/0nq5Vs67 w==;
X-CSE-ConnectionGUID: TrwEiFwuSAuLIcxhrDgWPA==
X-CSE-MsgGUID: I6aol7XeTKqHcz+Qbv4b1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1925822"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1925822"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 08:03:03 -0700
X-CSE-ConnectionGUID: M0VRZIV+QfOTOtHc96ObsA==
X-CSE-MsgGUID: DaUZAx40TIuJwn1a6f0CrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5073129"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 08:03:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 08:03:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 08:03:02 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 08:03:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZJlWNTUTfaQzoKQEazg84akNkqDVe07/MxLnnbboTmUua+iYEdCFnAFU2TZOXD3kU177ZkAsMspLwdNjEMEWYrMxuferjECKHWgpA43xx1JkrYJhBfOLLYAUts2fLLrtmeIrOd9FYMN/JkTgGKxpOls03chAe4oblAA0QsuKSlndu7Yk0UkPMnetqKc9tMa/gnOliiZXnpD2/SXb3u0fuGgnwCZGQwdEhs7T2nPO/F9JlQjMCwApK6UPFWy2L3VLrcc/pWXDwhvW4hyQVMM53rBQGS13Qrlg2JvcspDjfOarW6OzP9T6b8nIgVGX0w5gGqaRMCat1TQx4e9X+nsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkX4Z8777+uTWzZxOE5re052RagzTXVgzf7lwGrmQPQ=;
 b=wwgAm1CTlBIViVRdIyczn/pIb8TYypKgcueXOn2tHVq0L+TqGMOCVsf8UuEZorB90RhRqbzSvTHDNwAxzOKnxYSIaqoLjoj8J+93YuER7JTs9GJGDfmegr+o6HGbX/ml/YbNG4SfmyN1/7mci49/SFXhPXO6YGt7CHhWXeKuVJJLdyzpI8OIQq7VODg+tBymSriUmYiGWporzBH4bKYwBZpusYSuBIYteUDuRVf1OPLJxQPsLmUQAFHXMQEvZLi9pM3JjN6kiirGwrY+dyNg9KWfXCk5OzK0kfbReEi1WxVrluPdRkK42MstrXy7Qi+sl/0r/JDEGFFBymTmfZg/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB352303.namprd11.prod.outlook.com (2603:10b6:8:50f::18)
 by SJ2PR11MB7426.namprd11.prod.outlook.com (2603:10b6:a03:4c4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 15:02:56 +0000
Received: from DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b]) by DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b%7]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 15:02:56 +0000
Message-ID: <0eeccff5-c902-4dd8-86c3-a4a38d597741@intel.com>
Date: Thu, 29 Oct 2026 16:02:51 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_xe/shaders?=
 =?UTF-8?Q?=3A_remove_explicit_regioning_and_channel_offsets_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20261028-remove_gpu_asm_annotations-v2-0-270a5878b2fc@intel.com>
 <179326165127.86446.3441886875113415779@221881a7231d>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <179326165127.86446.3441886875113415779@221881a7231d>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0202CA0018.eurprd02.prod.outlook.com
 (2603:10a6:803:14::31) To DS4PR11MB352303.namprd11.prod.outlook.com
 (2603:10b6:8:50f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB352303:EE_|SJ2PR11MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 78213e7d-c21f-433a-c303-08df35cdb6a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|261022113327099003|11063799006|4143699003|5023799004|56012099006|261009223027099003|261021130227099003|261022075727099003|261026121527099003|261026130827099003|261022115727099003|261028144727099003|261026140227099003|261026135527099003|261021121427099003|261021133027099003|261022105027099003|261021123027099003|261021135927099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Rh2sW/zgurxFNL1JnJDGvYwHl3dgmmj7j1uQFrYSWHbSjqOpwcOb1MDSU7uDSjPUYykYbj2JMsIpAJ/o8rSoe4PtRa8HE4z8e3BujbrLyS814R3dZxPA3O75AJM5ojqiv6QuzOemHxljLYkFWGOFu7zJfxTsGJSA71pJvp2EvbgO1tRDlzsKWq3z3VXauVb5CowaFEAjIKCm5Gr8VXJb/clH7yiotzK71hFoVEggT+M0zGbqKECBMJfIKuR5fYxMbr6LtnLABHJmcMtDmfb0n6xY1/k5ER8yU7l04n+URHcIZJP06B0Yi5gxyiTvrZnNk6cSi/jf7x4hQLjqHulPXOX0hE/sgkMMGew26hPzr93BHoQxRSVsWrXqBLmlpsMhEC48KtE6VDoURWIGi3Ivu23ObIpezrcN7OdO+ZQlyNF0bCoezaOnBlZc1ZkB3AqJBagdSNC5jE1zH0TIKw/DTn1P9A91EZH3itkUrrbb/rpDGAX44uqTFb+LnOpSS/o115cDNcFZJp5FvXpSU1esK6Q1eRdVei/L0dRA8tPd1+xIFsxgs0KR3VW+5buQ+2wsvMx19wD7KmEwzgxDU94qoiEJNucUE/cqQP7x4P4zDEk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB352303.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261022113327099003)(11063799006)(4143699003)(5023799004)(56012099006)(261009223027099003)(261021130227099003)(261022075727099003)(261026121527099003)(261026130827099003)(261022115727099003)(261028144727099003)(261026140227099003)(261026135527099003)(261021121427099003)(261021133027099003)(261022105027099003)(261021123027099003)(261021135927099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnhBSytGbWNKSzVadDF2dFdyMTNydFBQekc0cm9jdFlONkZDeTlkR3Y0bWZk?=
 =?utf-8?B?elhuMnJKWkJ0Qk9LMEI4SU1OYmZuWm9UUTRhcEVhVEFhdmdleEdPMUZ1cTh4?=
 =?utf-8?B?a05UaVZNaTB2Y3VMc09BeXZHTnAwUEpUS0lqSHBHSHhnNDVsazNNKzQzd1BK?=
 =?utf-8?B?SUhEUlU5OWswajN1Zmlyd2F3cHdqb21zbmFEWkxVVFlZMHFObHVDRmFsUUdr?=
 =?utf-8?B?TUJ2bmVSekdMck9sTXpveXlmNURPSkhnRjU3c3pmcEs5cUZGLzJlQ245cE02?=
 =?utf-8?B?WUg5YTEzZ2dwMzhFNEdUM3NSQ3FuYWd5dDBuelRzeGpVSk5Xb1pBU1NVKzVG?=
 =?utf-8?B?MnlpTDE2VDZaZk41UlZGdzJpRXV0VUg0cktWZ0tWY1pQaklBZ2NVVG5zblN4?=
 =?utf-8?B?WUVrdnlrc1Z4aW8zM0tsZ0I3VEo3NlpEckdtRXJGOHFIWGdzd3ZDTU5SdEd2?=
 =?utf-8?B?b1BlN0J1SW5NWDROZHlQQ3Y3b21paHNOUWtGV1hkQ1Y4ZFBzY09sdVRFeVpy?=
 =?utf-8?B?UElvRFpCWTROYk5kTFpLN2RRWHlRdkk3dnRaSzdvWHpOVW5ZRUNwWGxDMm01?=
 =?utf-8?B?MFFFbjdicUt2QnVMWTFFYXFkQjJ6RkFWRW1UUVFFWlNQUlNqZzZzbmp1SWs1?=
 =?utf-8?B?VEtUbndETUgzNGZ2dEpsdkFTeFJBaFNrTWN2UXdncWFWOEhCclRIZDl2aFhE?=
 =?utf-8?B?MTc3a0ZxVi9hVk9wQTdZSUc4U0xyWXJ3clR6QkU2azdEWFdlNVZabW9ORktl?=
 =?utf-8?B?MXNuUG1pUEUrb3RqM1VWTnB4bHA5RnZ4bWlZMEladW9PMmpoRXlnSlBvTzFD?=
 =?utf-8?B?a2owUEpreHlHK0VleTBsR3A2NW9NSXBKRVNyVC9YaTBSeUJXemFoNmxDd2kz?=
 =?utf-8?B?eHo4Zkh3bFZVUUEwUGxUSUZhaEwrOTB5b3pBUDE1eFJBY3d4U2lMSnk3WTBh?=
 =?utf-8?B?RXhzR2Z5SnZzM3pBczJZd201dFNjbFNXZnRSOU5wMXI0Vkh5MFI3dTF6cUJD?=
 =?utf-8?B?QUt1V0RjK3FTZGE0dkZPdzdvQ29ESVU5UjNVanR1Z0k0Nzg1d0xxamg4aHc4?=
 =?utf-8?B?bkttR21NMU1uaVhzSWo5ZDMrSUZhYlU5ZkJiWHEwRE1oZzVPdGhYdThqKzNx?=
 =?utf-8?B?QVovMFlVaUh4ckxGamFsejRjT2pZajZMQWo3b1gyTE5EQWljWHdzWS8rd0xK?=
 =?utf-8?B?UkFTckptTWlJSmFmVUJEN0Zmc0lFTW5xN3JZUkhRNUZNdUlNWW1sek9keWVM?=
 =?utf-8?B?TVhjY3AvUWxSNGM5TDFRdXpqQ1JCbU1JY0NZbUQzcmRiVkVUWEJmYlRSQUYr?=
 =?utf-8?B?RmlnZHVobUZEYmRaUVM3Viswdlo3NmN3T3JFYkFuaU1mbkdmejNYTENHbk5j?=
 =?utf-8?B?K0V5OUxjSXJ0VXZnWk5GQy9teVdxRDdQUTlhSFcyR3J2dysyakhEODJOd2Yr?=
 =?utf-8?B?MEI1S2Q1czVyR1B2ZXRNdjRBbTRKRkszanEzTytGQ2dzSnp4TjFqeGF5KzRM?=
 =?utf-8?B?SU9iYmVrWVE5b3NXenRBWjlYWFpHQnlsVklXeUFwMVlrTjEwYmVxSkFVV2NF?=
 =?utf-8?B?T3BuQ0UwWWJlQ254VFJsVytFSUZlYUQwT2dVUWt4SkNIVkx0WllJUk5BSFJV?=
 =?utf-8?B?K2dwY1RjZEFWUUwxa2NPUGZ5aDNzZ0pDSTNGM21ndytFQUY4UUVNMzdiT1d6?=
 =?utf-8?B?Zm1JamRnbk9vOXN2ZWZGZkJPVjdDWmUwaXJFZzJFZ1o4Uytva3k5bVBXTWZk?=
 =?utf-8?B?a2dIK0x1djNURm8vYW1XRSswT0JrWnNOdlgrTHg2R01aWEZFVVFrNG1uRTli?=
 =?utf-8?B?R1NyTDZjdmZhRUk1dkRLbDY3b0huYzVVVEVVRnVVWTBlMFJZdkdaMjhkVTNj?=
 =?utf-8?B?NjE0VkxLdW1sY0UzTFNyYmZQSEJ4cnN4cWRwVll3Zk9aSFVNS1BYVUxTblFM?=
 =?utf-8?B?Y2d0d0hncldxeVY4UmFQK3BzeTVFVnVSTjFaa29LYVhEaWhlTkdOZnZBYjFU?=
 =?utf-8?B?Ky9EQzJvK3lXNmZYQk9La2pHeHFpZlhGVU4zTytpaVhScHNGdVllR1hNdDdx?=
 =?utf-8?B?M2UxbUpVb0o0QmhKL1MyRmtGa2VYWGhGWGVVWjdKMGZzYzd6d21PRXluOGkx?=
 =?utf-8?B?enFhVHU5ck11SW5GYzUySEJzMTFzaHlHTUE5WG40bFB4SE9lSUJqU3F4Y1pJ?=
 =?utf-8?B?Y1VpNGpweGhXZXprWW9UY2t3QzJ5NnBLK2QxaDMxSGNjUWpCM0krWTVrVVMv?=
 =?utf-8?B?dUVJOFp2QXVwUVA4M2hFblREemkwRnVibGRMcHFHTjByblAyZm5UclNNR0tj?=
 =?utf-8?B?cFoveW9pWitkaTBza3VBaHRWSjdMdTdYVXZIRDBhbWRQSHY0Q3N5UT09?=
X-Exchange-RoutingPolicyChecked: jw3TU+JZCTUQIG/RNi91XLUp+v7zMKdOSd42vxPls9z+FbVrAxlHeBP86K9FuvXk1UvkNz0GxSd0g8FU+FOELm+tg59e3wZ0zftJGYqt9BQE3scH0Q6J6KD1HFBU+318AEwfWBDBU24h3St2AK0I3GvEKdFP5m210pkStsdlCz3T30uQftcpOQTX8kc23OZ/xUP0ncm/K6xsuKrPliJREYx6nXh83Voh+K6JoKUi+QR4cYFQhu0EaxDkoFeZJ6ncH2VPXjXYbrLiyDm5DTYuZxW4Xzsuow/sQ8vX6pFs2u6mfYsx0kKz0mAw5QvXkJ17b4mvVPVT7QlWbBFvY5VDsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78213e7d-c21f-433a-c303-08df35cdb6a4
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB352303.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 15:02:55.9647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyGc6phInHZs3mbefMbFRVDbyBkx+lUTG10KnysYxe17kKFmz2kG4xAyxBSWfVhTq7zGof4LkUT0PD0jHIMEVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7426
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


W dniu 29.10.2026 o 09:14, Patchwork pisze:
> Project List - Patchwork *Patch Details*
> *Series:* 	xe/shaders: remove explicit regioning and channel offsets 
> (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/176973/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16062/index.html
>
>
>   CI Bug Log - changes from XEIGT_9170_FULL -> XEIGTPW_16062_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_16062_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_16062_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (3 -> 3)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_16062_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_sharpness_filter@filter-dpms:
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9170/shard-lnl-7/igt@kms_sharpness_filter@filter-dpms.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16062/shard-lnl-2/igt@kms_sharpness_filter@filter-dpms.html>
>         +1 other test incomplete
>

Both full logs issues (xe and i915) are not related.

Regards

Andrzej

