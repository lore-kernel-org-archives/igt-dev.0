Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734AA606FAC1
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 10:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OHXEdrkb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A12B10E570;
	Tue,  3 Nov 2026 10:59:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466FB10E7D1
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 10:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793703484; x=1825239484;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=3WIvo+I3dnUF2zC2kPxjnXUU5FAsm5APrm8caVOybxk=;
 b=OHXEdrkbL/FCYxyOnSBUr6K0cY0TIvKUDKiYRR0SU1tWW+g4eaJX6TyW
 rIOtz0POyf0zisjeUd2rsaGhmp7nk8sodGjruAgX7x2ldDeHgg9Kkam21
 nPYstfqdIkKVdW/CFzyExG72JV4fKjXf7gTOa647Fnete3xUdodvSFhVC
 hYpISYqpgmBlYLZdodJ7GBAugAkyOFlbIP4HTo3+UWpZHVyQfRFRzaT3D
 rCTmB/2IelSI4aF5qa+ZX9BUSLQtLhyfxjt6yYxHbDFFRw9z86HDP4s97
 rlCaP76XGugaBVFp6VyrlA3ROlvsRWJp3byyt8F77ELgwU+cihYb9vQ7T w==;
X-CSE-ConnectionGUID: pXI0Zfy8Re6YfEUJVGppYQ==
X-CSE-MsgGUID: +ezZX6UvRiebPWrkyyRy0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2330110"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2330110"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 02:58:03 -0800
X-CSE-ConnectionGUID: qmZm/YH9T/G/fkZlTarilA==
X-CSE-MsgGUID: LwI7fDc+S6m/SOmHLXxfMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8174150"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 02:58:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 02:58:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 02:58:02 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 02:58:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kea4fBSSwXXH26mq9zFZYAGBi/hjKsDx8/YGpVisf5r8r+F+c4twkMkg9tE0mDugWVRRM6Uh7WQWwNsTxmFtvvigSxcrn73OmFL5eKI4IdceJPTIT7ikj/cz4OSzLg7XanB4YLhzJwliFlDSpu1E0eOTQaa2rL+uLrfb2ZV1LqUryG6R3qDJKgREWPE9nt+PO1eSyunsE3T7egvBVg90A32HBEmD0vQNR5rwSZN7t4XD7EtkSpazw5egjR+r0UZko9v4+Sdih32a+IKQ7BTsHczvGVXvSHcKeTeVxUjaEIKtlqF9rBTkGKOGGIR19wpOg3DkVpOeQ2rVpN5rawW40g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WIvo+I3dnUF2zC2kPxjnXUU5FAsm5APrm8caVOybxk=;
 b=g+R9rf8JeKgO0q912Hd21zJ/uvl51EvPyYpXitWSi8KDCR5F+SkFSOE74p1pAaRsHuKRdZETzswgau0uJ6cADOd5YqF6Oil512otmWCuu5/pbpXxKiSwMK+04ELpx/dK/GQ5F+jZcpHm4rhiIDq6j0B8mp1T/zmxtKeXl9QR9snobIv8Dw5KEp9bRDGyPUh/+HVLSGQ9qn6RP8RVzm03jBfc6pT+JcrY3AozzTpsITnQoG73d50ppLj0hpyd68KwEewioBbUvlbWmOtPcgK4BcrcGLa8rvW1KoE8k8utiGVPK5UvjREg6Qp/wlwE1/vBnHo1g7QQFRv3uk+EYwjFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by LVXPR11MB9755.namprd11.prod.outlook.com (2603:10b6:408:389::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:57:55 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 10:57:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 3 Nov 2026 11:57:50 +0100
Message-ID: <DMLITAGRZ0FB.174JIVJFEEEFZ@intel.com>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Simona Vetter <simona@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v2] tests/intel: Add edge case and race condition tests
 for GEM_CHANGE_HANDLE
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: "Francis, David" <David.Francis@amd.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20261015145355.3972674-1-David.Francis@amd.com>
 <20261015145355.3972674-2-David.Francis@amd.com>
 <DMH9D1GKZHCU.3TINOPEPE1G04@intel.com>
 <CHAPR12MB999247A855D151A61B5801D113EF6A2@CHAPR12MB999247.namprd12.prod.outlook.com>
In-Reply-To: <CHAPR12MB999247A855D151A61B5801D113EF6A2@CHAPR12MB999247.namprd12.prod.outlook.com>
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|LVXPR11MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: b53196a8-c28a-4de9-5bfc-08df3999503a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|261102123227099003|261022105027099003|56012099006|11063799006|4143699003|261009223027099003|261021135927099003|261028144727099003|261022075727099003|261021121427099003|261026140227099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: wz1RZYtbSwaMWMy7mTIWJFXj5Y121f5A7kkoTLTsty+l4VohUUjNlbcVDLNPuoUhWYQffoj0bgVARu3vG45j8DQssjJGt5Ye2wJbF9zvTyHqeYEdNLG6R6RZcBW6tgkyGP5Jo3E+yAYClfrwTEydSlqdyrGpZ8LKwK+hvC0l95Ff5wwR0ZPSV7rSykr2xhIyLQc7X9CbZLYfEfG29u14dHxXHg+lFoKMFbFyaLb9CQNnUbhyf4HKgB72xE+M7rKK7MhyHKMfsc/am4xBq7oS/bP9C2T/nYhoy5o1UHie3X6Hj+H8J57M5AejimgXraVd8zhGMEjWsQQ6IviPGE208ZtzDT1tgyUIi0PtzGf2Bpeapzy6NohkbVIw3x+j1Q6gXU6BDib99Uvq4ZrlpODvJ6SSEXbm2HhIGX4S72VbnkNaCfGMmHyVxHOkL3dT0dG1tXfuTo6k3D1reZ/0yQbjq9yVmKYORTGUDnvSEEhJYOuNr+SpAyQ3zWmb0j+mIjFDkoZ7QkHzN5JzwJkYAecXhhFOX9Uyr/e+dP1QauYbyp5FmdSnnSyoes97yIncRIHIPWxmn3+yEhS9Z+qxb9ppobBV4VT6DVF8hj1AbecFKJ2KG2/FZnE+PPxDiqj+7l53
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(261102123227099003)(261022105027099003)(56012099006)(11063799006)(4143699003)(261009223027099003)(261021135927099003)(261028144727099003)(261022075727099003)(261021121427099003)(261026140227099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uzl3aXgvZ080TUt0Y2plS0FtZHcrY1ppbHpaR2xqUlZha0RRUDNwZ2JQTW81?=
 =?utf-8?B?VmFHMXhRNHZvZElHQkdmNWZERVhzcTNZR3E5d2ludExyOC94S1grSDBrbWFa?=
 =?utf-8?B?WVIybU1NdUFEMUlTLzNCY0kzUVFST1BJaHFQaCtqVVNGTWdBNExXMFZmNnla?=
 =?utf-8?B?SGROWnVGRkkyK081cXJ3RFpiZW42bHJXRG5hUnZlZE1NMkpTOWE3cGVKWjN1?=
 =?utf-8?B?NFFZTXgxU2FXWktqV25vZitMRmhyMWZBemloY1F3cmhRRFU4c2dGaHVKbDJL?=
 =?utf-8?B?NnRDY0RCc1VuOWxuZ3RoY3puRGdMNWIwL1l0U1BtYzBOWkxpM1l2RDBhUWdk?=
 =?utf-8?B?WlVPUk9Ib1dpenBjdXlleFNyT3ZOUUlPSU5Cd1N3Zm5HNllzKzBaZWh6eTlj?=
 =?utf-8?B?Vk0xWU9FK2x4WlJITGpQYWlBSG9HbmZYWXVUTzc5MmNBM2NoczFqSkZremhC?=
 =?utf-8?B?ZFpVSm5lY0xsTVRqenJkenh0Rys4NFc0OWNDeGtXa0R6dE15THZDM3krdjVM?=
 =?utf-8?B?dmlEeStVa3hMdnlWdVkzWDZhR0pVZEZFYnNDNDk1VTMyNHpyQjVVUGJ0b0NK?=
 =?utf-8?B?bnIxRHVGZmVML2lPQ0NEZE5tZlZ3SkJuajMwQ2IwQlVuK3drVlVlRmNCY1Fk?=
 =?utf-8?B?c2s1d0dTR0R3NU9CdG9SSjlzaHNSMXJybk9Oc1o2M081Z2RseGdiUEFLV1lx?=
 =?utf-8?B?WGRiMTZvNkR4bEUyandncFl2alE1dmE3aTZOVEFFOTEvN3g0WWFkUkdmVzY4?=
 =?utf-8?B?Y2d6V3lhdEk3Tm02QXZ3STg4aVh0UHMwOVk5T2FYRDYxdXJQTkpadVNEakpk?=
 =?utf-8?B?dld1REZiMGhBQnFway95c0VRRDdYdFBNRzJOdzBBWWcvZlVUSTNTYXhuWUhw?=
 =?utf-8?B?cDRjcStCajdIVVJRWU92YzFSN2NvN3dORHExY3pmeXZRMTF0TVdiZXh4bnV4?=
 =?utf-8?B?aWZVNzlHeXpQd1Q2bm1ybkd3YWR2Y29CNXN0OHI2TkNxS3AwV3N4OTliejBI?=
 =?utf-8?B?OXYvTzREczdEaVJ4YVk4ZTVlTmVMMmljbm0yMWVDYVdPYXRMREV3ZkJQanNo?=
 =?utf-8?B?dkNXKzlQQnplcGdTdFBJUG9XVEVHN1J2Y21acHRkK2tGWEU1YjlrSm9mNVVW?=
 =?utf-8?B?ZjVhOEN4cVQyNjNtc0cyMEZHdmIrV2tndUdlczMyMjE2bGI2UjArbUpaRTZl?=
 =?utf-8?B?dW9LVzhSbnFWMTZRTE5LNEdDWU5Qdkt0K0w0Y2daV0F6QkVwb0hONkpzZUdM?=
 =?utf-8?B?czlXVEV1V1ZqK0pEUXR2TENzVHlkUm1QTHZ0Ym1pa1BQR0JjUjhmMVRUVlI0?=
 =?utf-8?B?ZHJscXliVXQ5dEliUGhsRHNzRndWdHZodDV2ckE2bGFuUitjZGdlQjMzbUY0?=
 =?utf-8?B?dlBLUkliV2NkYkpFN241ZU4xd2FUUW9iRjJ3RHBRWHpldGtnRHo0czRQc1lU?=
 =?utf-8?B?aGlHNXFkWERFUEduTkxXUlgvWUFBc09LYy9GbUZ3SS91Yit1VnpPaFlTMnFK?=
 =?utf-8?B?Qy9peFpCNUNLcURWazAzY3BPaGxBbVJFSE1KTStMZjNkQktibHJRenBMeWRW?=
 =?utf-8?B?V0lrZmM0Wnhqc0JWaStoSWI4bWt0ZXdnYlBCMXhvbFdJZTNFU09xS2RIOVh3?=
 =?utf-8?B?SUMxbnNoZkx2ckgzZ1BZYmRCbUdhZjlnNGdmZEowV3ZLNk5kZkkxQldRQ0ZG?=
 =?utf-8?B?dG1RNm41WjVobW5NWFc3RWNxZ09GdVZsWWhuamdxU1dVN2dPNlBkWm5jTCt1?=
 =?utf-8?B?L3Y5MnlVL2VwQ3k4ajdYOEpRK3IwZUh3bU9HL1ZUZlI2NHlKcEFUa2M0SjFt?=
 =?utf-8?B?U1dtQlV1T3NBV2VQYVdONTZZZWlUaHpuL1h2VHhWT0hybERpOThCYmkwMVJ2?=
 =?utf-8?B?bGF0UUsyTmVwa1ozYjFPVHBmK2xuQ1hvSHRLUlExMjdneWc1M29iWVBoczQw?=
 =?utf-8?B?VkNLQWVEVXRjek1oU1hHNnVvRWxxMmZQZE9sK0JOWjBsV2M2VzhHanpGanAw?=
 =?utf-8?B?T2hJbWlaeW9oTHJydmhQU1NNcXpFQWFkb2h2aGlLZlRqcXhqR0N2b2tibVo0?=
 =?utf-8?B?T04yb1RZdVR2akZVUEJ5NnROUHhuSW9QVzZNY2JjTGhDVTRtQ1p2WWUzQVBI?=
 =?utf-8?B?MDFUSHhoWm9SaE0zZ3l4Snc1ODhVcFNMNWtCL0RaZGlVNVkxRFpKNHg3cW5P?=
 =?utf-8?B?MHZYVzUvMGpiTzRuR0NGdEZzV3JYQ3lvVjhncE5YSTRoUWFYOW5mUmszbklD?=
 =?utf-8?B?TFpYaTkxSjgvUEU3MUJiNTREcVFtS245THVyd3RsRU5Zc1c1N2ZCNGkrZjB3?=
 =?utf-8?B?ejdqUTFubnZHRkJ4ZHVza2ZTbFZ0U3V2WHE4SGxqdVBKUW53T2tjWXdqZVFp?=
 =?utf-8?Q?EQd14Z5QXVKch2oA=3D?=
X-Exchange-RoutingPolicyChecked: bGFcQ7lWFRqAzS1VHWMPYeBU1Cp+vEWpuVZlx3owN/2DPSSMKIua+jAZVO1PQa2IJ95uyQei6I+Q66cWqY4IHHBK3P39zvugbUESa9ffg7rbp7j3OBAfuAtrltm/ofOrxhnvlhXh57bvwIHKeEKjRb4yT+8rrKtArpEE15/VphbACXPI8zzYZivsSDx2geOszAnL2mY2k0ZwHvabODUCUGGBlDaf9x3LOum832fhTn/gJvnBI8jqCTcWh1UsVwNNJ4LBpDSZNqZ7wY4njOBZqEhCnMJa4B6N2wJoMplGoq0S68zN1AyJf/LxPhSrw2bRPxdHGcs7+oKLicBAgK9hvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b53196a8-c28a-4de9-5bfc-08df3999503a
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:57:54.9405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ab2T9hk/Z34ecVATAKM0vOD6jQwz7WAwzBJ7FSlL/UN/LZm5Ao2RTiRao0RcSWyfnEbo8brT5fA65iJBO+KY6xi2Mp2oj/R8l1/mPF2qjRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9755
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi David,

On Mon Nov 2, 2026 at 4:10 PM CET, David Francis wrote:
> Thanks for running the tests. I'm new to the IGT development process.
> Are these tests good to merge or do they require additional review?
> I have this change on a gitlab branch
> (https://gitlab.freedesktop.org/fdavid-amd/igt-gpu-tools/-/tree/gem-chang=
e-handle-tests)
> What is the procedure for getting a change merged?
>
> Thanks,
> David Francis
>
To me these tests look reasonable, but we need to make sure we don't
pollute CI with failures. GEM_CHANGE_HANDLE is still=C2=A0drm_invalid_op=C2=
=A0
in DRM core, so on current kernels every subtest fails.

The best path would be to merge the kernel side first. But since these
tests are a prerequisite for the kernel patches, we need to work around
that somehow. Until the kernel part lands, the tests could skip when the
ioctl returns -EINVAL or -ENOTTY. Could you add that in the next revision?

For the contribution process, please take a look at the guide:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/CONTRIBUTING=
.md

In short, patches are reviewed on the igt-dev mailing list, not through
GitLab merge requests. It would be nice to get an ack from one of the
maintainers (Kamil is Cc'd) before this is merged.


--=20
Best regards,
Sebastian

