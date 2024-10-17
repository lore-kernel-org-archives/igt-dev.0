Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD88D21272
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 10:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A1110E307;
	Thu, 17 Oct 2024 10:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXB4FWpe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECB810E307
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 10:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729162749; x=1760698749;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=300HjiMhnqYAK17cAlva4qeMjOXwEqPr1WtUbpsxf1I=;
 b=gXB4FWpepVwIUu/+CCZR2Y8NFFPbn+MKVfWsS80I80+sOwM2gKGkYjSp
 mhhZkxxz488astbLuc7uJMCGBxqD6fDNsHRNvoVuKggUD+dNcgieVYDli
 t9PxBXkOR342s+XVQDyMxtAiPnqCHtgk50cNVgeFIc+j4mj6CNTDFk5nj
 ytQLsRbl2oWHsDD1HZK2NDM1VJenHtFjz7Yi2FZBAIqydGwYoyQLoMyc6
 kQ18y55SnVZ8BQTTNhcQaN1XKyCeEsWQIUTdD+ekMZAJK6+8VhCGx+EqM
 20JcZuPxP63VBPQ/YkhVw+VYOdB8SqB2iTB9Avvm0S/bz8rPs6yOxrFLZ A==;
X-CSE-ConnectionGUID: ZqlviHxsTPeNr8o/IOMLJw==
X-CSE-MsgGUID: 72gHLGJKShSf6nvIBOqWFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32327687"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="32327687"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 03:59:09 -0700
X-CSE-ConnectionGUID: DaMfL3mOToWhk/ImDMy/Yg==
X-CSE-MsgGUID: wvI09rkzQJ6bnUv/1Lp6yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="83068170"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 03:59:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 03:59:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 03:59:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 03:59:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 03:59:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHagaBgs1Xm91q2DK1gglvr/vxbDA/Mn3qzwD6vsdsujSODVazGYOU4f3MZxbqqFqkY8EBh+5MUeHc2JNAltsoLM9T4dhR7akuEJotFT5DdjuSuHPt3wsKdqDID+WyGSdf+Qy5lDKag5N/40IOa+Rm0tKfyWEXihjW67ntI9tsqphoJHUx7rUQyzbiZ5FEA4Y3FdCT8qXb2mIDxiASkoazgJPKxCfoN2mLnb1J58yfzefTWpp1gfZda+9VBVMfu100ukoj0UOgavbhBY2/d2EMJKzgIyo1M0pQlUPPQiV9IRSIG8NVcNqC7MExAslnZsEm/gXf5qhGehZ8i/PXzHtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3pVCrnpjPxS6gWRnZLrTscC2CPF5GlpSNUb9P0pyuE=;
 b=eo2V67+6HNpXAt3itvbgelPdv6G+oWunC+/5vp9RY4LCi82OGW2/o7xkulKV4+TmlitMujkx6RkdqqGk3yehzKSfAAJ994dLZJChVrnhLZ4CcICjMJldmEy1/Y/rVJUuwFpaf5ylxM6SPrLV/IYMikx1VeSDjsRorBF4eKSk8tfIxG5gDoiaxeD5In6uDxOOskAs8dufOsVRlhD9uHOc66y5MFCgzvUNBj4O489CWNZo3+yYnU9LbzaTQOXtzxFHVC85tmeb82omXY2rZTDG4c83r/BH1guY1Y/auI0u+R9LYFjUCgdBTxH/VuNO3KsWHCYSguunTh4HYKx5n5mEPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB8595.namprd11.prod.outlook.com (2603:10b6:806:3a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Thu, 17 Oct
 2024 10:59:05 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 10:59:05 +0000
Message-ID: <a4d3beb8-c57e-46fe-a3d2-3d98a340e784@intel.com>
Date: Thu, 17 Oct 2024 16:28:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/psr: update documentation
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241017082335.1362814-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20241017082335.1362814-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB8595:EE_
X-MS-Office365-Filtering-Correlation-Id: b121fa9c-0d23-428f-c15e-08dcee9ab74f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGFWLzAxZDgwSzVSZ1pGOUZ5TzRXdFBWNmJjVDVySEEzZ3g4ak5TQ0xFbzVW?=
 =?utf-8?B?MDF6aXhCSmxRN3FLOEp0TjJRSllLWDMvbE53amdyeVlVUUZtdXpWNkNBbEcx?=
 =?utf-8?B?dDQ2ZFd3WXFSNG91S2Yzam9DY2VoVUM1b1lMMDh2RlZFaVh5VEQ3UzRXTTZQ?=
 =?utf-8?B?T0o5RlBXaUNtbDNiZWsxZmk0OXR5MG44cVdmWEUrODl2T2IyeVU4bWFLZElM?=
 =?utf-8?B?RVdXVCtLL1JLcW9HcGU3Wk1iWE5kbzJTWVFPb0lteVN6SEp6UGNhcHRIdnhE?=
 =?utf-8?B?VWRZL2NOOU5XUmluTUtmdDBYQ2NrSURaSzE0bzR2K0lkaVRWemxjcy83aC95?=
 =?utf-8?B?R2NpSW1hZVVRRlNYN2hZZElTanQrbFE2K2l4OCs2OEpEZlRQM2tBSEJZK0ZM?=
 =?utf-8?B?bkRKTWFBOUJiUy8zVWNmV2JJblJUbXZnZ1dKdm4rWGdzekxNcDJiZDdDeFV2?=
 =?utf-8?B?cS90a0FaNVdjV2FybjROMjM2ZVorUTBOdDNXK000aWxXZlA1VlRCM0g1YlY3?=
 =?utf-8?B?TVkySGdqd3JwcmorOFY2NHUzREdsdGFPb3huUzhtaXplcmg3S0daaGNwSC9O?=
 =?utf-8?B?ZWUvTE4ydnFKaDlNd1lqSGZwSldrL1ZTSHo1RFJQeDRERVlzYUprSjY2MDFE?=
 =?utf-8?B?NjhXQWttdnhNdzRRckIyN3JYRlBsOHgvb3Ava3l3ZVhpOVA1SC9hci9yQnBV?=
 =?utf-8?B?Tk4vc2E3dWVZNjAxTk1EK284NWxuRHFaN01jc1ZuNTBDZXVhdC9yS05Ga1R1?=
 =?utf-8?B?SzQ0UEZ1YllER3F6V2s0ZUxaemk4aWhzS0IvaFVZbCs3WmI4NkZZY2lhV2Fl?=
 =?utf-8?B?c0FrdlNNNlFkMGx3My93KytESFNXNTFVdFNDdlc1Wks4TVpuTDh1UG1Dbkg1?=
 =?utf-8?B?RWFLdGhMaFBHaFFVMlpaRWtMNzlINHBxaFh4emN4TnhFSUtnckNlaUc2OGpy?=
 =?utf-8?B?b2ZDcEJ4TUIrd1h1UkEvTFBKL2FwZVdGa1c5N1AwTFdnUm11TzFsWUpZc2xR?=
 =?utf-8?B?R3hCbEVEbElLclJQTWtnUzRSa0FGTEM2bDUrTHZQdHdSQ1o4MmhHejZTQm1v?=
 =?utf-8?B?S3F2d3JxZ0VlQmZNenNyd3FRZmtrRzJzU2E3ZytOZGxwdG1JbjNaWFFuZDVi?=
 =?utf-8?B?czJRR3poTmY4dkljdjJ4anhPOVR4Qy9JY096NmQwdkFUQ0lSV1FXM004NkJm?=
 =?utf-8?B?eVBsalVtYmxrQTVBRDJNRXcxK09GaktQSFIvbE9rUzNXS3VOSW91OXFaYjhv?=
 =?utf-8?B?SFo1eE9aU0lZK3pEUnU5WTJDMEVIY3hXTlVhVk5RQXFWRjV1ZkxLV1dpY2Jm?=
 =?utf-8?B?Lzc3b2ZHbjZSQndURVVtV25DV3Zub0VyWDFYNVkvWGcxQ21FNmJKa1p2aVY1?=
 =?utf-8?B?THpWYzRkTmhCU3JuZ1Y3QWpmcThqL3RBNHcweldYVE1naC9LS3lWUXZYN1F2?=
 =?utf-8?B?eUtRMkY4aHh5WWdXK2ZkTWFaNm50V3p4L0h6eURnbnpEZnliajVmUlBCbjho?=
 =?utf-8?B?YXNTMmhZTjZYNDJyUkJiVWt4OVcwMEd0RGFlMytZMFJYYWQxTjFITUxqWlU1?=
 =?utf-8?B?VHRwaFh5ekJ4bXY4V3hMWWZZZU9uRlA5ZFVDekNhNjIwOWl4Z2dCeXdEYjBO?=
 =?utf-8?B?Sm5mcVZEanpPdDkvcEZMVXUzSjZEaUxDQU5NcDQ0Vmg2S3VtUVZTa09aTFM3?=
 =?utf-8?B?SGw1UHM1eXh6dG1lVFdEWUp5ZDBPK1pNZFNidWs0clJNSklhVkxmMTRJeUdS?=
 =?utf-8?Q?T5XxK2Cq7rqV+K3964=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Kzk5OExXTlhTVktrdFJYNEVLMmgzS1g4d3dkUXdWVWZIRm8yUHFwUG9ONnlw?=
 =?utf-8?B?U3Z6YmUydXhvWXFneDRyVnc3V3VKcFJCcEFwKzd1TDNNNFJOUEhVNzdGbVlF?=
 =?utf-8?B?VnNOaTkrS0ZSVThhMXFwZzhjWkFCb3d4MjBvMFhyQlg0RDJBT3d1NjMzazhF?=
 =?utf-8?B?MUk1aU5oRlpEc3lDK0tnQlIvakhrNzd2dWV1RUdyWEI2TlFQTUdtT21GM3hi?=
 =?utf-8?B?QmJTZ0NtMjcxMWdlTHVaOXVIV2crS2djNFlWeG84NTk4emYwZDZMbjVNVU5D?=
 =?utf-8?B?c0pRaEdUd3Y3QjJHdXRQaHFNNlR0Wi95Rk5sK1FJVnQvczNOT0p5ZkNyU0VP?=
 =?utf-8?B?Ym1wL3NBSGRYeUpIT0drdFh2ZEwyZ0FzUitCeVk3elVjTCtuSWVQMXhLUjJj?=
 =?utf-8?B?dk9RQnEvanVvZ0VzVm1ZUE1pL0xZMk5Tc2tTSXY4d0Q1M0NiQ1ZRZUd0dG8w?=
 =?utf-8?B?bkFTejQ4S0dNMHFKSHpkVmJxTnlqaFRFZmxsNHpJOFcyM2ZuOEpvOHF5RXB0?=
 =?utf-8?B?RzlFZEhMbVhUSU1LT21EdlN1bVUySG4vaUt1d0J3a3JOQzNOS3dPeXg2Q3hT?=
 =?utf-8?B?OTIxTEp4STByZWNpdFBROFZqc2xlN3NiY3JBeTVzcWp2b0Z3RkhjT0JlUFIx?=
 =?utf-8?B?cXFPL04vT0JGYitJMUlhNU9mVFI0NUc5NXNGZVZHT3g0UTJEWnZEWDZJclhz?=
 =?utf-8?B?dlJjSUtiSkNaQ1hMNm9uNDVKekVaeXM2MTdFcGFBME5QQ0pzeDFZN093bWdx?=
 =?utf-8?B?MEE1SUx1c24ySnp1akFjeS8yMkZkeGpFY0gzaDhEWkdpMm92NzhySjlwUk9x?=
 =?utf-8?B?MXVOVlpYczRYdysxcVkvUVJ0S0tSOWxmL3dzd3NBNmtNUXVLUWJINEJPY0Vo?=
 =?utf-8?B?UjROVXNNQWpqUkxtR1IyQk9nZWJOdm8xd1RoY1JwRWpCKzNIVGhlbjFrZkdP?=
 =?utf-8?B?K0NFSUxkUnJRUFlVdXZPOXNOam9kNlQ0RFRHNWZYU1NZN2RJdWo2aVFZSXRG?=
 =?utf-8?B?djFYTTdhQWpoMkxYeHhMdGxjalJVTUdDeUIrclZWTjE3eENxYnJHK1g1RXZ6?=
 =?utf-8?B?K1FWOEtCVEY3cWxVYmhjUjFUaThJdTBja1djOXEvSEw0VVhMUGloazc2QTNn?=
 =?utf-8?B?elJSQ2N3REF5NVc4WWh1Z0lueGFHc3FnTnV5V0ExcEQxOE5wck5DdVhLNXR5?=
 =?utf-8?B?cUw5amw5b29FWXlCWlEzK3B5d3A2anZJMG1IUzZlamk5UUpSQ01TbDlVWlNp?=
 =?utf-8?B?d2xBVG50Vlg5ek9qWEtJUzhxQ0dNWklYUWZIMm5Jc2FoZE9SWG42Sm1YTmlQ?=
 =?utf-8?B?djVFQW5BdGl0UktQVThla21lemw1M01IYWtOZmNzcFZvMWV0TjdWaTRYZGV3?=
 =?utf-8?B?STRRRC9hLzNIM2wvUEVra3Nud0xQRFpROGJsdzUyeW5FcXdDd2pKUlEwb3VR?=
 =?utf-8?B?ZjdRdXg4R3BuZG9tSDQ0MGFJUkwrWHcvalFRNTRHYkZMbFpqNzdhZzAxTWg1?=
 =?utf-8?B?V2Y5V0FaR05NSnNKSjk0bnhDa1gyQ1NJb2d5ck1EZUQ0bVpIL1ExV2VQZzdQ?=
 =?utf-8?B?RS91UE1VY3NUV3VRMHVwNlBteW83VVM5Q3RUYkk3cEFqaGVJVDYyanU1eFdF?=
 =?utf-8?B?cCtGM0I4N2tia1BVZkdWY1pRa3FRVDE1ZFk5N0wxZnZMRVcreDJNYzhPa25x?=
 =?utf-8?B?L0x6NzQ2Nm5WMWY5amFJTmJUeU4yYlBLMFhtTUJadmVVVnl5c2kzYjg1NDlV?=
 =?utf-8?B?b1NZZUptNHl6a2NXYzVTNnp2cmk3OGZEaWluMlUzQXZRUWdzZ1ZQcU5FZXhJ?=
 =?utf-8?B?MGV1RW9IK21mOTl5Y1NHVmNSMGMzam1qKzZRYkdzQVp0QndXQTNvK0tlTWp3?=
 =?utf-8?B?b25aU25Lcmt6M1NjV2N4b2M2YU5Cdjg3cjIzMnB2K09WRTBuZUVkYmFMOGJP?=
 =?utf-8?B?eHkxRUV1Ykk4R01TV1R4WHhIaU55WmlDMFBhRE1BVkJ6WFpwck1MdVRZRVRT?=
 =?utf-8?B?ZU5waEljeXVYeDQ2Z0hybFQ4SGYrSXlUQ3pBTVRIaUhzcHhwQ2ZONkd6T1JL?=
 =?utf-8?B?WUo4dzIxZEx3K3NUQ0RjdUhycGtmUHVBRDdzVVRYQVVna0JsRzFCdE9ibE4z?=
 =?utf-8?Q?aXjXXxnKm73EzHdrlpoTk9A/F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b121fa9c-0d23-428f-c15e-08dcee9ab74f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 10:59:05.0755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkXEgDmg3rS9c648RaXMOOMUw4hk48Zp3muQGDvmylcmM3dYeY4INf2vTNPO0VaABdE5P6qT+IOkVSYFI1L1xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8595
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


On 10/17/2024 1:53 PM, Swati Sharma wrote:
> Update mega feature from DP to Panel Replay.
> Also, update functionality.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_psr.c     | 32 ++++++++++++++++----------------
>   tests/intel/kms_psr2_sf.c | 37 ++++++++++++++++++++++++++++++-------
>   2 files changed, 46 insertions(+), 23 deletions(-)
>
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index 2badeeddd..ad49c18f0 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -182,46 +182,46 @@
>    * SUBTEST: pr-basic
>    * Description: Basic check for pr if it is detecting changes made in planes
>    * Functionality: pr
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * SUBTEST: fbc-pr-basic
>    * Description: Basic check for fbc with pr if it is detecting changes made in planes
>    * Functionality: pr, fbc
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * SUBTEST: pr-dpms
>    * Description: Check if pr is detecting changes when rendering operation
>    *              is performed with dpms enabled or disabled
>    * Functionality: pr, dpms
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * SUBTEST: fbc-pr-dpms
>    * Description: Check if fbc with pr is detecting changes when rendering operation
>    *              is performed with dpms enabled or disabled
>    * Functionality: pr, dpms, fbc
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * SUBTEST: pr-no-drrs
>    * Description: Check if pr is detecting changes when drrs is disabled
>    * Functionality: pr, drrs
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * SUBTEST: fbc-pr-no-drrs
>    * Description: Check if fbc with pr is detecting changes when drrs is disabled
>    * Functionality: pr, drrs, fbc
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * SUBTEST: pr-suspend
>    * Description: Check if pr is detecting changes when plane operation is
>    *              performed with suspend resume cycles
>    * Functionality: pr, suspend
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * SUBTEST: fbc-pr-suspend
>    * Description: Check if fbc with pr is detecting changes when plane operation is
>    *              performed with suspend resume cycles
>    * Functionality: pr, suspend, fbc
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    */
>   
>   /**
> @@ -230,14 +230,14 @@
>    * 		performed on %arg[1] planes
>    * Driver requirement: i915
>    * Functionality: pr, plane
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * SUBTEST: fbc-pr-%s-%s
>    * Description: Check if fbc with pr is detecting memory mapping %arg[2] operations
>    *              performed on %arg[1] planes
>    * Driver requirement: i915
>    * Functionality: pr, plane, fbc
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * arg[1]:
>    *
> @@ -256,25 +256,25 @@
>    * Description: Check if pr is detecting page-flipping operation
>    * 		performed on primary plane
>    * Functionality: pr, plane
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * SUBTEST: fbc-pr-primary-page-flip
>    * Description: Check if fbc with pr is detecting page-flipping operation
>    *              performed on primary plane
>    * Functionality: pr, plane, fbc
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * SUBTEST: pr-primary-%s
>    * Description: Check if pr is detecting rendering operations %arg[1]
>    * 		when performed on primary plane
>    * Functionality: pr, plane
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * SUBTEST: fbc-pr-primary-%s
>    * Description: Check if fbc with pr is detecting rendering operations %arg[1]
>    *              when performed on primary plane
>    * Functionality: pr, plane, fbc
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * arg[1]:
>    *
> @@ -287,13 +287,13 @@
>    * Description: Check if pr is detecting rendering and plane
>    *              operations %arg[2] performed on %arg[1] planes
>    * Functionality: pr, plane
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * SUBTEST: fbc-pr-%s-%s
>    * Description: Check if fbc with pr is detecting rendering and plane
>    *              operations %arg[2] performed on %arg[1] planes
>    * Functionality: pr, plane, fbc
> - * Mega feature: DP2.0
> + * Mega feature: Panel Replay
>    *
>    * arg[1]:
>    *
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index 2381360cc..e9a8dc141 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -49,8 +49,10 @@
>    *              visible area (no update)
>    *
>    * SUBTEST: pr-%s-plane-move-continuous-%s
> + * Mega feature: Panel Replay
>    * Description: Test that selective fetch works on moving %arg[1] plane %arg[2]
>    *              visible area (no update)
> + * Functionality: plane, pr, selective_fetch
>    *
>    * SUBTEST: fbc-psr2-%s-plane-move-continuous-%s
>    * Description: Test that fbc with selective fetch works on moving %arg[1] plane %arg[2]
> @@ -58,9 +60,10 @@
>    * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * SUBTEST: fbc-pr-%s-plane-move-continuous-%s
> + * Mega feature: Panel Replay
>    * Description: Test that fbc with selective fetch works on moving %arg[1] plane %arg[2]
>    *              visible area (no update)
> - * Functionality: plane, psr2, selective_fetch, fbc
> + * Functionality: plane, pr, selective_fetch, fbc
>    *
>    * arg[1]:
>    *
> @@ -79,35 +82,43 @@
>    * Description: Test that selective fetch works on cursor plane
>    *
>    * SUBTEST: pr-cursor-plane-update-sf
> + * Mega feature: Panel Replay
>    * Description: Test that selective fetch works on cursor plane
> + * Functionality: plane, pr, selective_fetch
>    *
>    * SUBTEST: fbc-psr2-cursor-plane-update-sf
>    * Description: Test that fbc with selective fetch works on cursor plane
>    * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * SUBTEST: fbc-pr-cursor-plane-update-sf
> + * Mega feature: Panel Replay
>    * Description: Test that fbc with selective fetch works on cursor plane
> - * Functionality: plane, psr2, selective_fetch, fbc
> + * Functionality: plane, pr, selective_fetch, fbc
>    *
>    * SUBTEST: psr2-overlay-plane-update-continuous-sf
>    * Description: Test that selective fetch works on overlay plane
>    *
>    * SUBTEST: pr-overlay-plane-update-continuous-sf
> + * Mega feature: Panel Replay
>    * Description: Test that selective fetch works on overlay plane
> + * Functionality: plane, pr, selective_fetch
>    *
>    * SUBTEST: fbc-psr2-overlay-plane-update-sf-dmg-area
>    * Description: Test that fbc with selective fetch works on overlay plane
>    * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * SUBTEST: fbc-pr-overlay-plane-update-sf-dmg-area
> + * Mega feature: Panel Replay
>    * Description: Test that fbc with selective fetch works on overlay plane
> - * Functionality: plane, psr2, selective_fetch, fbc
> + * Functionality: plane, pr, selective_fetch, fbc
>    *
>    * SUBTEST: psr2-overlay-plane-update-sf-dmg-area
>    * Description: Test that selective fetch works on overlay plane
>    *
>    * SUBTEST: pr-overlay-plane-update-sf-dmg-area
> + * Mega feature: Panel Replay
>    * Description: Test that selective fetch works on overlay plane
> + * Functionality: plane, pr, selective_fetch
>    *
>    * SUBTEST: fbc-psr2-overlay-plane-update-continuous-sf
>    * Description: Test that fbc with selective fetch works on overlay plane
> @@ -115,15 +126,17 @@
>    *
>    * SUBTEST: fbc-pr-overlay-plane-update-continuous-sf
>    * Description: Test that fbc with selective fetch works on overlay plane
> - * Functionality: plane, psr2, selective_fetch, fbc
> + * Functionality: plane, pr, selective_fetch, fbc
>    *
>    * SUBTEST: psr2-overlay-primary-update-sf-dmg-area
>    * Description: Test that selective fetch works on primary plane with blended
>    *              overlay plane
>    *
>    * SUBTEST: pr-overlay-primary-update-sf-dmg-area
> + * Mega feature: Panel Replay
>    * Description: Test that selective fetch works on primary plane with blended
>    *              overlay plane
> + * Functionality: plane, pr, selective_fetch
>    *
>    * SUBTEST: fbc-psr2-overlay-primary-update-sf-dmg-area
>    * Description: Test that fbc with selective fetch works on primary plane with blended
> @@ -131,43 +144,53 @@
>    * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * SUBTEST: fbc-pr-overlay-primary-update-sf-dmg-area
> + * Mega feature: Panel Replay
>    * Description: Test that fbc with selective fetch works on primary plane with blended
>    *              overlay plane
> - * Functionality: plane, psr2, selective_fetch, fbc
> + * Functionality: plane, pr, selective_fetch, fbc
>    *
>    * SUBTEST: psr2-plane-move-sf-dmg-area
>    * Description: Test that selective fetch works on moving overlay plane
>    *
>    * SUBTEST: pr-plane-move-sf-dmg-area
> + * Mega feature: Panel Replay
>    * Description: Test that selective fetch works on moving overlay plane
> + * Functionality: plane, pr, selective_fetch
>    *
>    * SUBTEST: fbc-psr2-plane-move-sf-dmg-area
>    * Description: Test that fbc with selective fetch works on moving overlay plane
>    * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * SUBTEST: fbc-pr-plane-move-sf-dmg-area
> + * Mega feature: Panel Replay
>    * Description: Test that fbc with selective fetch works on moving overlay plane
> - * Functionality: plane, psr2, selective_fetch, fbc
> + * Functionality: plane, pr, selective_fetch, fbc
>    *
>    * SUBTEST: psr2-primary-plane-update-sf-dmg-area
>    * Description: Test that selective fetch works on primary plane
>    *
>    * SUBTEST: pr-primary-plane-update-sf-dmg-area
> + * Mega feature: Panel Replay
>    * Description: Test that selective fetch works on primary plane
> + * Functionality: plane, pr, selective_fetch
>    *
>    * SUBTEST: fbc-psr2-primary-plane-update-sf-dmg-area
>    * Description: Test that fbc with selective fetch works on primary plane
>    * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * SUBTEST: fbc-pr-primary-plane-update-sf-dmg-area
> + * Mega feature: Panel Replay
>    * Description: Test that fbc with selective fetch works on primary plane
> - * Functionality: plane, psr2, selective_fetch, fbc
> + * Functionality: plane, pr, selective_fetch, fbc
>    *
>    * SUBTEST: psr2-primary-plane-update-sf-dmg-area-big-fb
>    * Description: Test that selective fetch works on primary plane with big fb
> + * Functionality: plane, psr2, selective_fetch, big_fbs
>    *
>    * SUBTEST: pr-primary-plane-update-sf-dmg-area-big-fb
> + * Mega feature: Panel Replay
>    * Description: Test that selective fetch works on primary plane with big fb
> + * Functionality: plane, pr, selective_fetch, big_fbs
>    */
>   
>   IGT_TEST_DESCRIPTION("Tests to verify PSR2 selective fetch by sending multiple"
