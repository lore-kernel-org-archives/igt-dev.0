Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDBDC35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 08:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DF410E512;
	Tue, 25 Mar 2025 08:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIWJ9hcL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CECA10E067
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 08:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742890976; x=1774426976;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=64zt0rKbCpmBVsewz3yeRk1LE9nWGc4Pqny7tXcH47c=;
 b=BIWJ9hcLoOV9zUDf05E6TCPXjGaQVIgNnUJihtqT17puLPVunPFNsgFf
 g52Uhl2pu5Eig+9r0FFd5l1g/8Nl9f2S66fy64fWoLBZV1boD+js1QHfy
 Baapf3ynJypeTMnC1ALh+mXGeJFsFvpcuFqmE+oH5Ilyv/z4yIkHn1jph
 pW0UC6MvH0RlSAcJ9BOiifLebJpUPDfpAwxUoAx2ML64vIrCtFLC/wmns
 C++MLkqaXxz8gA2gLXaow2S2DA0l0ZjQMiqjckj0gfKfjHtRn7WMTpDos
 Z+6af8C3HVJxnhIDXZGy+j6ifeo99Ibz9On3RN+h3UBjIofK0llb1WlWl A==;
X-CSE-ConnectionGUID: Wf0dZGVGTkC29AwfY7ce9A==
X-CSE-MsgGUID: yWAeaPdyQmKiY2gDfhUDiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54770546"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="54770546"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 01:22:52 -0700
X-CSE-ConnectionGUID: 9M63lSiOTBWnW9+MCHJdgg==
X-CSE-MsgGUID: gJe0h8mzS6+PApqR/IvPyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="129485520"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 01:22:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 01:22:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 01:22:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 01:22:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gD+iQ+TzXXWhJ31uUrydrAZu6K/Wg0UY77HDSqpL8SqxewS3OYWlX83HkldqsYn1LUI0RQ4VsqcgvMPiwW1sq8qPqmh5Un8767ROCG2u0tiXIx5x3v27Xgxh7xyRRRiB15QH481KvrR7YwdlEXycYsOiZQQdpL5KYGxFqN8M0R33qdvoY7i8Sg6wsmEsU6mkqnf30hFAV3PHisCtgXar1id5DAbDJbJYQo080Bb9tjMNGrz5gCFAdTMMLuAZwB0SmAQrvj/uVEgZvjZMhzrRh6mRfHtBHz6G4U1PnNDZ9MPVDExI6dYovmV3m8A9gDvvybYO1EPOJBT43EAC1M1Gwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJFt3/a2jxUAvI4a1Wwu7j7HCp3IfCdLxFxMGhe/nlE=;
 b=OQ3i4rEDNvHcxhUpZRzdp4ne9RzbbwBp0HepxEqkTXKiHGr/YIPqbQ8K/k5l7uIeUVqySZ1JJfyH921lfvmtDap8VR5o2NKBQE5yViiNB6rzfc2uE9NI8e81Nu+2pThcjNPIFvvwoGFKT7Zz9iithY7WUJSPdx6OcN+1fgSEGtW+L5GIg89ZptIvFy5vhmuXbwU+Jf5m7o2zs2q4ULoRlP0bebs6r09ZvJ6brtfNUYSLgMj6F4FNR7YBrPiL7CZJXJ7vUQUxZLqiZQ/JMwJvS6IhAuHdwHYeGWTZLubkasde0meQy5GsQtHPC8DjVSpTHLV8uMdrWIhO5gd38D/+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 08:22:49 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8534.036; Tue, 25 Mar 2025
 08:22:49 +0000
Message-ID: <4008a7da-a901-4bc7-a600-5e56100c27e9@intel.com>
Date: Tue, 25 Mar 2025 13:52:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] scripts/test_list: Do not stop the build process
 if documantion fails
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <kamil.konieczny@intel.com>,
 <jari.tahvanainen@intel.com>
References: <20250320140508.825945-1-karthik.b.s@intel.com>
 <20250321185002.73kzuscjdahh37fe@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250321185002.73kzuscjdahh37fe@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aad127a-9049-4c4f-39cf-08dd6b763a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bW1ZSmszKys3bjN5QjVvV28xTkc5N1VGSDJXOEdWSjdPUWhKMDk2OU5DeURP?=
 =?utf-8?B?a3VMeXJjd0JtZU1TTitKcm9tSS9WcExicmtjWGFnU1FiKzRTWTlLS3ZTSlE3?=
 =?utf-8?B?MXdxMVNWU3grdlhDbG11UGd4bk83aERTanVSMDRoZWxUNUt6TE1wWXBHc0Qw?=
 =?utf-8?B?MnMwZEYzS0lrUWtRREtNRHQ4Lzl2Z2tKYnQ0SWtMZyt6aTBXTTFqeUtjejJ2?=
 =?utf-8?B?NElicTkvSGdUSGpnVGZockUrU2E4Sk5BMW1pN0RBRXVyUk0yb0tDdVpmSy9l?=
 =?utf-8?B?azV0WHFwdDdyMDVhUzkvb2x5QkV3SzAvdnVnWm5DRXJ4Uko0MitFakNVSXlH?=
 =?utf-8?B?ZktwamhKNzJXR3NNMndXcmRUUG04b1NFa2FMaGsrRU1KejNLTEgxYXZramJK?=
 =?utf-8?B?SjZKNm5na1dXNG1HQ010R2RUeWN5WUV4Y1d4UWxjNGZKT1RIWEhKbi9QTzlG?=
 =?utf-8?B?bjVmOFRHWSs3bERtSG1Xb0tLWE9rUnFQYTVkbHlKVlBMaGY5MTNkcHgvUEo2?=
 =?utf-8?B?SGF4NU5ueGMyOHhKNkJ5N1B0VGZqMUR4SjkzaWJxSkdDOWJwZ2VLTDM4UjBr?=
 =?utf-8?B?V0FyazhYUk5WUkhwRlhFUWdZL1BZdmFwQWxsMk5lS3h2YVFDc2hmM1BzWnl0?=
 =?utf-8?B?VlRkeUtnaTltd3p0ZkRQTGc5Q0dMTUZLZDNYV3hzRkhVTlYwYldiY3IxbTZD?=
 =?utf-8?B?Q1BjREw2aHVxY2tNdlhWNWRTV3VqVm80OU5xY3EvZ2JacDd5WUVGT2s5UWpa?=
 =?utf-8?B?RFNBMXFIRTdCNFQ5RG84RXpDSDhnb2lSWXhyQURzdDVUR3FhUG82NDNVblI0?=
 =?utf-8?B?NWxrVG1IU3FNOHhvNUNOMG9WR2R1amFUOGVIM1FkNlF3QldaZ2dLOHN1V0di?=
 =?utf-8?B?TE5TYlhybjBCTkloZkdvd21vVE1VUVArWHJsTjBjRlBuRmcrRnJiblhvSzZa?=
 =?utf-8?B?dmFQQW9UR2hIbUt3V2FWbjRhWGZYL09ZTUZMcFlMOHh2bXNBSVFuMGE1Qklh?=
 =?utf-8?B?UFQ3T2tOT1hJWTg5c0cvbk5HY3dIdGE3bTQ1R2l4VlRJdWRyWkV4bjdmM0Rk?=
 =?utf-8?B?WldxWFhIOVJxTTNBZi9KYXlYRFNEK3ZtUlRnb3p1a0dNOENZQktyZ01XQnBz?=
 =?utf-8?B?aEcrZGdUaklkdEl5eDllMkM4TUtRQWRxNnBhajU4bkx6bG5Pei9aa085OWZm?=
 =?utf-8?B?K2xwV0o5OUYydVpXSmRsaE9VOWxqTWdnTmZ2QjdiWW5nMEZKMm5ua2lHMU1P?=
 =?utf-8?B?RVo5NGpqeHcwNUt4QnE5WDNDUTNkZktMT0ExVlBkbEh4MHUxWk9IOEw0TFY1?=
 =?utf-8?B?VG5XMVBsd2pKRjFPb3pWcjFVZnZaUE9SMWxOalNTQkRJb3hRVzJFakZOMHJi?=
 =?utf-8?B?Mm5XUlk0Mms2QzlQWnhwRlZHRThjd3F2RW4xYzdGeHZSQ0t1Q3JVamZVcUF1?=
 =?utf-8?B?OVh1WDR0VWhQQ1hTV0pMRkJyN3BqallYZnJ2Z3ZBSUxOUzRxSEVmTXB0em96?=
 =?utf-8?B?dG00UXQ2aUVjL2ROUnZsU3Y4dTZQR1Y2SkF5L0syQkFNaUdwMFZOSUJvYnJx?=
 =?utf-8?B?WHRsQWF1bUtyV2FDYmVjR2NnZTFzKzdDc1pHdEtHSEpOU3JMV1JlQm9NdmdX?=
 =?utf-8?B?aWw1SHYrTVRPTVlwTXhiTTBJS3VGVzJneVRjMDBuOFFVdldBUHk0TDNFS3l3?=
 =?utf-8?B?d3BjbDFxSWhjK1dWQVg3eEVvdEx5RHVrK0w4TWhkR3MvK0NXSW16ZDA1TGw5?=
 =?utf-8?B?ZkhuV25HOVhzNHQwVW43ZjRqV3pDUVJjQlVqdEJSaDFYci9OUkxVQzAycHNG?=
 =?utf-8?B?ZWpNdDIwWWZicWlJMUVOVGNFcm1veVZlR2QyUjlvMFY1aHRPcHhmOEtrZ05h?=
 =?utf-8?Q?1nZuX/YHkHu/B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmNtdmNBOEJXWFBPcWNUeWpkMCs4NnpVTTV1bmNlWGkxMFQyVkVEckJOVzhw?=
 =?utf-8?B?bW92VXVZdUQ2MjIrQmFTWkUwTzF5ejdZQUpOUklIVTBJQXQ0VzhrVW5wR1BZ?=
 =?utf-8?B?RmhWNzNrUVZETy93LzhNeVN6dGJXRExPZmkwZ1VsOWF5VFZWOUwwd3BTdytC?=
 =?utf-8?B?OExXTUtJcnE1TXMvSDNBL3hDMVZZZnVIdjFtUmE2eGtQd0hpZTVWdEpONGdz?=
 =?utf-8?B?TElIYkxEazVyUElEYVphUmlOSGFXUUhqOUJhZ21DQkc3dDg3VWkzZFNtTW9p?=
 =?utf-8?B?bUdRSGIvRHdLQTNpcUNSNzlDNGd4Qk9Cb3IranBQemRrVlpiczhraWZRVDZT?=
 =?utf-8?B?OE9WYVh4TlJxc0NITXI5NmROdUpvR1ArNWJuK0NvV0pMZXJBLzgvZG9sdnpD?=
 =?utf-8?B?TjZycm9pcGU0N3ZhQitPTEp3VUJCaE1QUzJvd0lLYzRMakdrWmdyMUZzYzRN?=
 =?utf-8?B?dXhZb1FzL1NPN3NDRGRqdFVKSW55UGJWdUh0S3pvcGsyN3VJakhhcjFFbllS?=
 =?utf-8?B?R09Zd0Q1MWl4RHZraEVnVktOcVhXbGxTREhMb1JKUDgxd0phNWtXVnVsTnBu?=
 =?utf-8?B?dGpKY3RFL3B3bTJkQVBGbFd6a2liOWd0TVd3NlgxNjh3NFdpcnVJVmhRL3U3?=
 =?utf-8?B?ckFkRzVDU2gxaXQ3UnhtcHRabmVpUlBlZmxYa3V4VVBoZkRuWUo5VHgzTUc4?=
 =?utf-8?B?NmNQOTJqTkZUc0xrajh4MU1DYTJ0KzZtVFlEcTZGdVNpWS81VmlPeENwc3pK?=
 =?utf-8?B?RGEwR25aWGQ2ak9VVnZXSURxRkplUEFQb3FNRmRZUW9PZmdZc2xLc1FHOEFH?=
 =?utf-8?B?dzNqMyt6STZlYUJUUVFMWGV5dXUzZ1pWaUtaVWNiRkhFM1VCQjcxbmd1M0Ix?=
 =?utf-8?B?REczVENtbTNaYzZRelUwYmdKSktsclhNOWRBMzdOb295T1o4MGpqbThIRDZo?=
 =?utf-8?B?UDJ2TzZwQzJRMTFkSkgxVlpZbHJ2ZzNJVXVkcDFUeWdaVnZzcnNmajBDNjN1?=
 =?utf-8?B?OXcwSEVjQVZQc0huOGhHTzNTdWQycUY4MzgvTWhnVnY4aXB1dmJPL09ydytk?=
 =?utf-8?B?THNVY2VuUHRoMld6cTkwdWp2MU1raTFrSzJpOHcxblZHeHFDQytmck1ybWhk?=
 =?utf-8?B?R05hSU5laGt5c1hlYXVKSU9BclBaNjhWbWFkWXlsWStPZTk5a0VtamttTTBN?=
 =?utf-8?B?ZUdCK1RRTC9ZbEs1Z1l4bzI2dDZjaXg1T0R0cnpzSzMyaEVnNzZwTVhIRFo2?=
 =?utf-8?B?SnFld1p6ZGxFVE1HNmpBUVQ4RFpPVWRSMnhXcXJkencydExEZC9PRm1udzUr?=
 =?utf-8?B?MDJ5VXpUTGN4SGpyOURuR0FRZjlBdW1iNFBSQWpSai9Qek1XdVdHbmlRVTZT?=
 =?utf-8?B?bm8xRDQ5SHdIQUxuS1ZxMUJnYm0vNXI4Q3dYSFczd2VHRU4rR2dSQmMrUnl3?=
 =?utf-8?B?aDlNMnVCV0FMYzk4c0dVby9yRDV4TlNHRm9sQkhCZXpHaGx0ZzBFWFNHbEUz?=
 =?utf-8?B?OVY5WFppQjNKSXFRK3g0c2xxSDVjZS9IUWxaVDZaazVHSktDWERvQmNTQi9M?=
 =?utf-8?B?aXY1VzhzU2QxUU5ZaHpiYzJZOWFaanZDbmFwaHc1cjQ0aHNyTnB2d3VMVzBt?=
 =?utf-8?B?ZzVVSU4wNzdCWkJmTWhDSXNkZ0daNW9HbmZxKzBuRUhhQWdNK3kvbHFVVXp3?=
 =?utf-8?B?Ymh6ZzlrQ0VRdHEvMXlGU3EyWHRSZFdNVlZVZG1GSXVBL05yem44dGRvODNj?=
 =?utf-8?B?R0pGRWgvbkw0RTJra1hYZVpodmZPbXFtbDJUMS9TOVM3S1hIMEwybmZVdnNG?=
 =?utf-8?B?dEVGam92em5Dd1JnUVFwL3o1dWxLbnhCOWNWdTlMcU1sRFFLWERNMjU1U3hO?=
 =?utf-8?B?Y2s4RTQyRE80U0hlUC9pVHBmTncvZ2p6QlN1WVgzcnd6Y0JQYkRxT0VZNTVD?=
 =?utf-8?B?NS9USS9Xc0FHcnY5NlBTMi8yZWRKaDFTc0VXaUYxSHhBeXVNaHNFODh0ZVFs?=
 =?utf-8?B?Ty81ZWhmalFQcTJSMU0yMlE3YzlUWXI0WXRRUlZuMEd2dXBsTHAyeXpkczEv?=
 =?utf-8?B?d2lUMnRGRVQ5dXRuTThUc2pDdUN6VFowa3dOT3A2MzhKNytCZzJsQTBsS2gy?=
 =?utf-8?Q?kJcaK7FzFzKwMULUyV1ETpepd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aad127a-9049-4c4f-39cf-08dd6b763a5d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 08:22:49.0290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JhGcp70zjxf2QTtl0vEViW/3lCuqDmIEbTvdyc6xMgi7jyXvX3OtuFSTEQQU3I36afvAhFjTd3+KsLI34rURA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
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

Hi Kamil,

On 3/22/2025 12:20 AM, Kamil Konieczny wrote:
> Hi Karthik,
> On 2025-03-20 at 19:35:08 +0530, Karthik B S wrote:
>
> small nit in subject:
>
>> Do not stop the build process if documantion fails
> -----------------------------------^^^^^^^^^^^
> s/documantion/documentation/
>
> What about also shortening it a bit?
>
> scripts/test_list: Do not stop the build if documentation fails

Thank you for the feedback.

Will make these changes and merge this.

Thanks,
Karthik.B.S
>
> Regards,
> Kamil
>
>> Current approach stops whole build process on a case that there is mistake
>> on documentation. Let's have entry on logs instead and continue.
>>
>> Small fix also related multiline data e.g. on Description part.
>>
>> Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>   scripts/test_list.py | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/test_list.py b/scripts/test_list.py
>> index 867d28400..5f1b4218b 100644
>> --- a/scripts/test_list.py
>> +++ b/scripts/test_list.py
>> @@ -1399,7 +1399,7 @@ class TestList:
>>   
>>                   # Handle multi-line field contents
>>                   if current_field:
>> -                    match = re.match(r'\s+(.*)', file_line)
>> +                    match = re.match(r'(.*)', file_line)
>>                       if match:
>>                           if handle_section == 'test':
>>                               dic = self.doc[current_test]
>> @@ -1408,7 +1408,7 @@ class TestList:
>>   
>>                           if dic[current_field] != '':
>>                               dic[current_field] += " "
>> -                        dic[current_field] += match.group(1)
>> +                        dic[current_field] += match.group(1).strip()
>>                           continue
>>   
>>                   # Handle multi-line argument contents
>> @@ -1427,7 +1427,7 @@ class TestList:
>>                       continue
>>   
>>                   file_line.rstrip(r"\n")
>> -                sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
>> +                printf(f"{fname}:{file_ln + 1}: Warning: unrecognized line. Need to add field at %s?\n\t==> %s" %
>>                            (config_origin, file_line))
>>   
>>       def show_subtests(self, sort_field):
>> -- 
>> 2.43.0
>>
