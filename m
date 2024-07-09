Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326FEC2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 05:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67A910E47A;
	Tue,  9 Jul 2024 05:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIuqvpRc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C5C10E2A4
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 05:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720504268; x=1752040268;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3iPAyZabUhrctqbOM8KP79AyE9tIxPA4CgoBRpCbpq8=;
 b=CIuqvpRcZ/zUwXdjJfbkEB1I8EK8lccXkzjiXUvehvx/TENj9rhXog8y
 cFD3OrSlCxC/SJwqd0h04f/aogElAM39VSn2lAEezGEqwHDBaxfaQMrH6
 Nv3T7HKWXncx0TmcvxZPqRiXiaTatLGGVRC0gT35khOFzfKKeI4yUSKLt
 hHVERX6y94lMp0Zn0RkmI0BGYlEn6/6BgzJOGDwfCsbFXUugtIrx2U5uI
 pZnYLDOHtEBQtNYnTzZNdOSJzsMTVLZpPFUcVfQCXCmsRqOEU6/9D3ZmP
 oyy98cdHem0FtH024nA0XHAKc/YL2MkHzWRK71bDhkNDuPP1nx5n595N5 A==;
X-CSE-ConnectionGUID: t2NbvzcXQzCiTuzNDEhIpg==
X-CSE-MsgGUID: YSRUU/HkTemZGIz9+vIiyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17872236"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="17872236"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 22:51:07 -0700
X-CSE-ConnectionGUID: 7iakjWTuQ+WDlNWFeplmkw==
X-CSE-MsgGUID: TUtsce9WStGAU7ifLwknYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="52918570"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 22:51:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 22:51:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 22:51:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 22:51:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 22:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbevrqYvhJVp9kYmFCq3NyIM6SvY2vltUhNmUaFp0o5xAtaGxwxbxxWYgwVQdA4i+ljkLKMHkrVDNxV4wuVu7JyZv481MfIFQFE1o0EX2uct19Mo82OqGqZ1KN7q2RbWNsk4RSyJ9AQ/P0GTPV1qZKBttoQ9uyNSCcfl/sAfmjMe6DIBcdRfFWH5SuOOkEK5deDyz/Vw09MPczLOyOSc/ImI+a8cWxEnoz8QceHLY5lptMiQy6dhpDkGzxeyX3akYRrHeav7dhK8WSTpON+GGrgL1oABCMmm2++Ik/KotqTpqVlcfTKdixGUavlH4goqaXZ19BBBYOlhX0tQfbCcpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xN+bVXjH1JMffdNtYQN5CLwdoKIYCK/KUgtIKCOPjqI=;
 b=VsY1YjdS1ieYvrBKYSevOppX+xQ2dpyQvaE0i5yV1TmG9e3i2eDlFTjvMmmEjhIeyeXj1s9B6AW3EDKYbJ7QIMy+x4sFgEb5FrWWBS/qOW5sYxV6XuxWCjRArHvXadDS9ib6VTOtJJ0ip3yO4LkvpYEgMCYOF1yWG7TvabZjUGrLLdyX5j1TqkAhpLyN8RCn6TTdBinJ8/DEUDEytVtPynhXCWgJiK1P+8H5ze3aAQkUIvaAXQ5moLbiKenev1hiHTuT5PBfE34/pWAfxdrCpSyZNXKoWNt12gsyYv5+iBnXBv5+O3Kyc5GdgSBmc1zDROihiVoBpA4TAtaHsysolQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7136.namprd11.prod.outlook.com (2603:10b6:930:60::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.34; Tue, 9 Jul 2024 05:51:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 05:51:00 +0000
Message-ID: <2ced9f5f-9374-44eb-ab8e-2bfc32bd1430@intel.com>
Date: Tue, 9 Jul 2024 11:20:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/3] tests/intel/xe_pm: Extend mocs-rpm test to
 support D3Cold
To: Badal Nilawar <badal.nilawar@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <janga.rahul.kumar@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20240708145607.272869-1-badal.nilawar@intel.com>
 <20240708145607.272869-3-badal.nilawar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240708145607.272869-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f47ea99-bc0c-43dd-8d56-08dc9fdb1c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGsyU2R2S3ZVYzd5T3d1bHFIRnBGRjdGQ2JtWDZWN3p6bXI1TmRzeGduTUVC?=
 =?utf-8?B?UG53cU9XK3BoNEVFS2x1QVcyUFJoeWlJZ2xiNHVLdjFrSVEvSjljT1pUeVVi?=
 =?utf-8?B?ZnoxRmkzdW9aZFhCQXR4WkdaQmdZWVM5dGtnbVV3cktYUC8zMnpkbWczQ28z?=
 =?utf-8?B?V1JuSHU2TndPcWhHMzF2RUpLNzI1VkF6SFVkZEdtRnFWMUZkUVZpZUs0OVFk?=
 =?utf-8?B?Mzd1NmlETjl4NVJqUUY2V0NsbHh4SWxYd2x1WkFnNGhUMVVCdDhVQVZGcFlX?=
 =?utf-8?B?c0lMSUF1L1RPa2NaVXlOSWgycTdFWUQwTFhKM01LTElpUi9PNVllbGJVNHYx?=
 =?utf-8?B?Yit5blQ4ZU9jOTNJV1F4MDhMU2xWZ0ZIUEZaOTZUTDJkN3d1WGdMQ1lNZ0Z4?=
 =?utf-8?B?anErVlA2SE0xUHhEUW5PVVhxTEZUZjhwTFU1S21CRVpvOUlxVFhySFNYUEo3?=
 =?utf-8?B?V01ndkdmVDJ0Yk5zL1lwUm51VzBKOU10NTVYSi81Y0wwY1dySC9KSlI0SENi?=
 =?utf-8?B?WmZjNXZSOVpveFliekpVRG94VzJlTDU3ZktySXdzN0tLTzZGVmJSNmZTc21E?=
 =?utf-8?B?M0VuNmNzUWxJU1dDS3N2S09QdXRvdTEwTUZ5c3FCQlFuUkVwY1BYdHhpaW1I?=
 =?utf-8?B?UFBXRjFob2trTFY5RUVxUFpINUkxb1JOUit4QjROWXR5NlJqb3liRDZjZWdO?=
 =?utf-8?B?dEVrOUExQXdoWUg1NmVDUUkvbUkyL01XYzZ3bndaZ2JzcG8vb1ZoTlRNNStr?=
 =?utf-8?B?SDRrYms4a0xZTmNTVG5LMkJBcDBRamdFVUJxK1dYckNFTkZnbFFqSWtVRHRR?=
 =?utf-8?B?M0pzMVJxaUMrMnprVkc3VzJxVitJWS95MkJPYlY3VmNWVElSZG9hSFV1dVly?=
 =?utf-8?B?bnVDNXl3SW1zV21BQVBSaW8rVHRNczloU01KMXBRWmFLOEliQUxIWTZZN01i?=
 =?utf-8?B?OVd1MnZuMXBMbVU4bFp6bGNDSDE2VjllNWRUbXM5Ylg5VVp0V2xWUE5WLysz?=
 =?utf-8?B?QjFFbzBXM0VZWktOaERvbE1EazJuTWFvWm40d09KdTlnTDBpbVlQQ3VRN0Nx?=
 =?utf-8?B?L3pyTG5TUFFaWVp4Tmd1M3FxUE9zYmJmVUVxMC9ER0VTcklURElnMjFVVm9y?=
 =?utf-8?B?dWhOYWQvbDh1Vms1TUNqVENyQTF0QXQ5M2lOWlN5UHd4ZDdkY0pEQ1NHb09m?=
 =?utf-8?B?TUJlT2IveVdOUis0ODdVVlZjVHcyTWttaURxV1NmZExoUW5OYUJ5UzRpUUlw?=
 =?utf-8?B?K1RjVzJ0RHhMcnZ0eVFRckg2bUVpRVkya05zNTlwY3BxSjJPZVlvYy96OHJr?=
 =?utf-8?B?eVN5SWRvVjFJMWFBS3ZteXFLS2MrclN0bllSU0treHh1UHJiTjBsc3NMazQ4?=
 =?utf-8?B?M2wxdFZwY3NheW4va1dVV3llT3JFMHpjYUQ3bndhQTNhR1lKT0pRUE43SmUy?=
 =?utf-8?B?Q3BUempLeG43KzF2TW1qVzlibURjdUhXQkRSa0JxNEtJRFplbXp4ZmpoWjYv?=
 =?utf-8?B?OUF0STJibkw1Q2k5UkxKbEo0T1ZsVFgzVEFLQ0ZzRFByam42clJBREZmR2xU?=
 =?utf-8?B?S0FkMkdBOGNXVVFYQ1hiSnl6dXBoQnd4TVJtWSs2cGJRU3hvRmlEaGh1T01z?=
 =?utf-8?B?QTJBRzJ1aktJV2FDazVQSmk4SEZIT2ZseDZvbitFRHdjRkdHZHBjbnRYdzFJ?=
 =?utf-8?B?MFkxbFV4RVlrcnV0c2VvdTdPa0FmTUlESzhGLzZLcTZmdllRa1hzMFh3cjJL?=
 =?utf-8?B?cDRKeVJLY09Gamd2M0JiMWtMckJrT2tnRHBMUGdYRmtZNmVnTk42Vi9IUXlU?=
 =?utf-8?B?QTliekU4U3NSUXo3RVRpZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk5PM2llYmtITC94SVY1TlFOUllpcUVrWGpwRFpuZndhSEgrbDFOdmlvdDhE?=
 =?utf-8?B?TE5EYlVlQldLRW9rV3MwVWlXSG9VVmdoelE3ZDI4Y1QvMGd3dmhHYmVLYlYv?=
 =?utf-8?B?NUJuMExHMlBWc25KZ1ZWVHZpM25hVTFoSlA2RWFWeFI0bkVQNXlDUWpoM1hD?=
 =?utf-8?B?c2EwNTNJM05Qb0w2TzRJRklnSW5nSHJxTXV5bUJhMEdlamZ2cnV6UTNUSXNU?=
 =?utf-8?B?dG5LMlMraXE3cGxkdWNJS3RvQ3FNWHZJU2sxYytXT0t1MmpHK2NYenV1cDJa?=
 =?utf-8?B?UXN3VEhEKzZjZTNUK2R5TThmOG41MEg3YStSQnBYN2lRd2ppc2NUT2NwUDls?=
 =?utf-8?B?SHJNMVhnbmtld2tObjJDRmR2VUZCNFdUYWh2VnNJdGRCMW1CV0JEQUdMdXlT?=
 =?utf-8?B?dmhzK3ZKN0prc1NHWXJSWk04Nytra2tKS0FwQnpWeEk1YVg2UUhzZ3FrN2F6?=
 =?utf-8?B?R01XTVhpNXF1QzFMTysyZ0NnSXJMenByWmgyZ3lOczcxVjQ4ajJ4MU1KVDAr?=
 =?utf-8?B?N1YwSmZudDF6NjN6RWZ1UU1VVDBuZzZjdUMwK0I4UXZvUDN2R1hod29zci9y?=
 =?utf-8?B?M0FpcWIvRjNWUllUaHNMMGtPWmFUa3ZUK3JXQmtoRjJoSE9lMUV1a2ZORG5s?=
 =?utf-8?B?UWlaVTZrdnViWTdaZFdHbUQ4VklCMlpUbWZTOHRlanBwZi9rL21mMGVKNXYy?=
 =?utf-8?B?Y0Mzb3BrUU50MEtKNzBJZjBCSDg4bzdCbVNDalRBZkovcHg1N0tUODRwZ0NU?=
 =?utf-8?B?SW1lR21zb282a3Zlc3YrQy83NVBwUHp1SlU3OXNrcDJyMFRta3JDT0VrWTRu?=
 =?utf-8?B?R0VteVQxWWtBVXgvdFZsc2ViVmF6Qk5pbDd5TXVQUzRZdUZOb3F6WVd3VXJK?=
 =?utf-8?B?ZlhYaTlrTmR0K2NpNkRQYy9iR1JlZWpkRjl4TW9qdEhwRTZhTTFxMUtMellN?=
 =?utf-8?B?MW5zYVFUWHlKZ2o0Nmoza0pVdU01dXUvVjBmSDI1by9VK3FQVHZYaDlsM0lu?=
 =?utf-8?B?M2kyM1lBWW5JTHA5dHNjS1lRanJGcmVQUjZuOTNVUEZiTi8rNzJQNjhNM0Nk?=
 =?utf-8?B?dnhSVHhuSmhXMDNyMTBUTU5MN2NBd2lWcHk5OXFYRGovUlhWWnFjMDZldWNO?=
 =?utf-8?B?OXdjdjZBKzlvZ3FRRHlGSkFuZkVUamxqS3E0VitoU2Y1ZTBDU1hxTzZaQXM4?=
 =?utf-8?B?RjBndWdVSE9HM1lSRFkvQ053ME1mMnpqdVNHVExtQVMrcTh5dW5jTkphM1FD?=
 =?utf-8?B?MVhZMkZBb1hhdUI4VUhGaEl1QW15blJNbzBxaDRRMUsyRDhlTlozSkNJeDNM?=
 =?utf-8?B?Z2dWMi9BY3YvSWNKaUNXWjVQa3ZXckQ5TlE0TTUxSkpoQkxBKzc2VmJ0UCtp?=
 =?utf-8?B?ZUNvdDh5c3ZEZ2tsT2VqWUJjUk1COERxaWxRbDMxTXhYeksrVHVQZVRzS0xL?=
 =?utf-8?B?eEZQeTVPRzNzSjJDZmRHbkpZeHZFeU1yR0p2dWd5c3NBTS8rb3k2bENWQXd6?=
 =?utf-8?B?NmdSbXBXQUFla2IvV1FXSUVsemluRHBRcVE2RVlUeUJDL28xMnI3UWNRa0tl?=
 =?utf-8?B?RHdSR2hFSWpxYkwxVHdZYjdVekVzSlRDeWhSQ01TdmpKZkdiVmk0a3hKNm5U?=
 =?utf-8?B?bUxEWXp4UWljWmt1Z0VPM1JiOUVQclRkd0NWQklYeVpRSlVqMERIUjNQS1E2?=
 =?utf-8?B?dFRtSHc1MG9mNEFlODVIaHpSSGIxRXVYU3c3R0xKdmduc1I2Z2tmbTJzK1lp?=
 =?utf-8?B?bHZjZnBYN0VTeEVHV01wU296Q1A0Rlo2ZVduUFBTb1FjSmpFOHFSV3B1NUxv?=
 =?utf-8?B?eWp2YzJlSWxWa01GSEJocy9nN3FqRUVWTi9JS2dDaDlyZEJJanBjcFFlM3hu?=
 =?utf-8?B?emJEWS8xZlBFUEQ2Y1lacE53bTNYTHZzR04xSGdWMWZpVkdRZEtZeUR5a1Jr?=
 =?utf-8?B?b3p1OXJ3KzZORlVmTUFNcm1QL0RxdWZZa2p3cXliY3oxSUZmM2h5UDdVREV6?=
 =?utf-8?B?SkZiRGVjSTR0NVQ3QkFDNjVGQnVEZnVnSERJZUJCVThxZ000c1E1RWpFK3Nm?=
 =?utf-8?B?NTJxKzExYWp5SWptdjJxVjNYQWxXaFdKRThRaDBqL3hqRUgrZmhxUDhYNkI5?=
 =?utf-8?Q?ln2NMGrm4dCkw2x9XCoVB+ceh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f47ea99-bc0c-43dd-8d56-08dc9fdb1c8d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 05:51:00.9135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: na7Gy8Qry95TgCxKmkHdzbFO5/9WFsdfoY3hD9+aFfYouw9c8u4+5z1vUVgCUEERleJ4RPRN15NS+UPWUNkO9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7136
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



On 7/8/2024 8:26 PM, Badal Nilawar wrote:
> Extend mocs rpm test to support D3Cold using existing d3 helpers.
support D3 states
> 
> v2: Update documentation/description (Riana)
> 
> Cc: janga.rahul.kumar@intel.com
Cc format is not correct

With the above comments fixed
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   tests/intel/xe_pm.c | 60 +++++++++++++++++++++++++++------------------
>   1 file changed, 36 insertions(+), 24 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index b30e94a2a..8b115e2f6 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -610,28 +610,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>   	close(fw_handle);
>   }
>   
> -/**
> - * SUBTEST: mocs-rpm
> - * Description:
> - *     Validate mocs register contents over suspend resume
> - *
> - * Functionality: mocs registers
> - * Run type: FULL
> - */
>   /**
>    * SUBTEST: %s-mocs
> - * Description: test checks for mocs state before and after %arg[1] state
> - * Functionality: pm - %arg[1]
> + * Description: Validate contents of mocs registers over suspend resume
> + * Functionality: pm_suspend
>    *
>    * arg[1]:
>    *
>    * @s2idle:	s2idle
>    * @s3:		s3
>    * @s4:		s4
> + *
> + * @d3hot:	d3hot
> + * @d3cold:	d3cold
>    */
> -static void test_mocs_suspend_resume(device_t device, int s_state)
> +static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_state,
> +				     enum igt_acpi_d_state d_state)
>   {
>   	int gt;
> +	uint64_t active_time;
> +	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
> +			  d_state == IGT_ACPI_D3Cold);
> +
>   
>   	xe_for_each_gt(device.fd_xe, gt) {
>   		char path[256];
> @@ -639,24 +639,34 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
>   		// Mocs debugfs contents before and after suspend-resume
>   		char mocs_content_pre[4096], mocs_contents_post[4096];
>   
> +		igt_debug("Running on GT%d\n", gt);
> +
>   		sprintf(path, "gt%d/mocs", gt);
>   		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
>   		igt_debugfs_dump(device.fd_xe, path);
>   		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
>   
> -		if (s_state == NO_SUSPEND) {
> +		if (check_rpm) {
> +			igt_assert(in_d3(device, d_state));
> +			active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +
>   			fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
>   			igt_assert(fw_handle >= 0);
> -			igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +			igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +				   active_time);
>   
>   			/* Make sure runtime pm goes back to suspended status after closing forcewake_all */
>   			close(fw_handle);
> -			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +			sleep(1);
> +
> +			igt_assert(in_d3(device, d_state));
>   		} else {
> -			enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
> -				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> +			if (s_state != NO_SUSPEND) {
> +				enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
> +					SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>   
> -			igt_system_suspend_autoresume(s_state, test);
> +				igt_system_suspend_autoresume(s_state, test);
> +			}
>   		}
>   		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
>   		igt_debugfs_dump(device.fd_xe, path);
> @@ -766,7 +776,7 @@ igt_main
>   		}
>   
>   		igt_subtest_f("%s-mocs", s->name)
> -			test_mocs_suspend_resume(device, s->state);
> +			test_mocs_suspend_resume(device, s->state, NO_RPM);
>   	}
>   
>   	igt_fixture {
> @@ -825,6 +835,14 @@ igt_main
>   
>   			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
>   		}
> +
> +		igt_describe_f("Validate the contents of mocs registers over %s state", d->name);
> +		igt_subtest_f("%s-mocs", d->name) {
> +			igt_assert(setup_d3(device, d->state));
> +			test_mocs_suspend_resume(device, NO_SUSPEND, d->state);
> +			cleanup_d3(device);
> +		}
> +
>   	}
>   
>   	igt_describe("Validate whether card is limited to d3hot,"
> @@ -835,12 +853,6 @@ igt_main
>   		test_vram_d3cold_threshold(device, sysfs_fd);
>   	}
>   
> -	igt_subtest("mocs-rpm") {
> -		dpms_on_off(device, DRM_MODE_DPMS_OFF);
> -		test_mocs_suspend_resume(device, NO_SUSPEND);
> -		dpms_on_off(device, DRM_MODE_DPMS_ON);
> -	}
> -
>   	igt_fixture {
>   		close(sysfs_fd);
>   		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
