Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F7AFEA800
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 03:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5A510E24C;
	Thu, 26 Mar 2026 03:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGeP5Njx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FAF10E24C
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 03:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774495632; x=1806031632;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dszM8qcCsMZ/VEP82A14PdLAz3p1IXo8y7Eg0K8J1FE=;
 b=TGeP5NjxGCKypKg6mEdelL6G8k6ZX46gQEoiQuHRDCcwNtWzugaINY1f
 9oU0tbVGxfP8RZmhuxAEYUE5XbnGJTLCXYEwM6qnWMDCqB/CpaSMPDuOd
 P27lSnG9epJJjnh4GXXnKOFWJnvfHaQ8rPiiSH7XwXRwqgZaY3vOFcamw
 n+/A1hWG1yMDgTtymC+p8WUVZGGBJ3VFJ5zLbBWVeDx469iHisPi+FvSc
 RRuCcqc+YXSlovPtmFB8xB4p1C2fqcXLgoV6XJz/Lljv+eNY3BI02wHUh
 50f9HkKyeCWU+MOkWM6/kZLuI7/xfdWxV1iQy9BvEHeMhtYAodLK3lET0 g==;
X-CSE-ConnectionGUID: 3dkRMbOSRjacO+lGWHtzJQ==
X-CSE-MsgGUID: UisUdyJSRdypt9mNJHU+Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75448771"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75448771"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 20:27:12 -0700
X-CSE-ConnectionGUID: a/rOLX17Te+d8tssTK1w/A==
X-CSE-MsgGUID: nB2jUwRPRFyefgZe8EG2cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="248318206"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 20:27:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 20:27:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 20:27:11 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 20:27:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crToj+NdLTh9eKlQkum/I+xlSt9oJ2Nu6U4+UMuOq/ZreezWgk493tVg/fKanY7voS3zgZ+0U2ow0XV5XM3/8OL17U5KsLBHYzfcshauotOm1o2K0es/a7DG1jM3/cNQnVv62ivhv2Xkb0ml5SUnk2ghXqPkLxOMkjiD6y6OTxzVRJo+htJIysfPlN82lkH6XuCymmR9ts/6wTysjFnlt/Xf8uXJzxryHcnXZKuFaHaXUn/ad+cGwMYI4JgcRiZWHo9ZPSIhvJOcmEF5UnnA9Z3gmgA/hhjwTfuT8wCOC1RxghreGVp9encHotfrR9xWX2POWMbunEpiDSvZc9dVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjT8nB4X2A3x+s1k2uF+g3wurGUSsknt6cYl0Nu782I=;
 b=WMbo46DIgrpWDytzQhkgESk9ljoX3JAUqioy83K0v06hqXF1roUve0LOtU+3ueqWtWVCawuAiD8w4LUdagU1FVbgdAAfYZU6/UPO4cFEfpUF7QbSeq8hin4X/bIzRQrrr+2eEYIQCW0qBHSUmYcRfHyRkcmPGFSNhtkpOdstk1sfHpQFumo1NWYC3O623UBSnenJa2zh479o3iyVvhbb5JR9WWb878BbUn73i9haVGDGT/1KoXyUZHtPRcWYu/bJWrDmtDMhARFBQsJtLoL0JyIpWcwt4h+45TaQOljyGjUqu6la2yePzIKCdkT2Twn6+QNI4fX2FfpSmiMWCXk6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV1PR11MB8820.namprd11.prod.outlook.com (2603:10b6:408:2b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 03:27:03 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 03:27:02 +0000
Message-ID: <30fc7420-6ccc-447a-bc56-cb106b587b10@intel.com>
Date: Thu, 26 Mar 2026 08:56:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/kms_content_protection: Optimize
 framebuffer management
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, <igt-dev@lists.freedesktop.org>, 
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20260317160255.3351177-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260317160255.3351177-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0266.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV1PR11MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: ba94eb7e-025d-429f-33e5-08de8ae78bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|42112799006|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: LpCmQ6bMauT1S97H2n8Nvt6NckLrFa12Sq3D2RdVbDj1USY2owblNQdzZDR52s9hL5Z4JK1thCEmOuZUsp7vnV0KRqEH2dwkv3PhLKAXq7Xw4dp6SxzOulPm5kPj+w31H9V5V6c9yoRprOk9rIHYkpL0bhUXdcLsUanuUoyZ1xmffL5NGpLNe5s9CrD3EdNh2jagcfhiEuGFfy3cEQGiFjAcXu2QM+B+sK3yZWFODzcU939/GfaMpBG+F3CR5z25lXdqbZxs5d0xd41+i0TY/hyuQryvlVlDAXtShdmnV/9pnm1r/3cfL5eNuheh/p4xqiY/3gISZSD3atsA3VskNU1v0m4F6OEMC1kf6l1r/ShEk/LuxN43IKdWZRXrguDFAcO7ooRr0/6n0SxukzOYJi41YVMWo1nulZDzo/8fINM3kfXD0+OUbCPfDH0R+FCQNDaigoWnWb67Fqt4Sz6xxB/p1J/rqpZUmK9nt468a83WeWTU53VXQQ+UtL0o9/mTsbE4po3rHCvz9n9TBtElTpUZXK2wIvP5HYC5L8rkN36ZA/yot2MYx2o8i4HBUaeTR0qkE9nCNSyTkSeP4930K8qh0XbymNdSnHgcMMu48+3glq/juuggbt8ep6vcor0ggQwqa74R4SrONRHJk6bknBGEuIzgCV+K7LCJJ66h2n+K4k5aU9OQdt47yC/preBvqdw36uwa76NgHVAAAhNGXEMUHHPVoNN6Fj56Tx20Tuk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(42112799006)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUVuTGc0YjROY1ZQZVFpYVQ1WTl1SXlIY0dCd0tNcDNBNngyNnYzTzdTL0Ew?=
 =?utf-8?B?dDBiNVNLU0F3cFd1T1ZVaU5hSStlQlhKN2ZKQmpzQnRUWklpMWltQWdiKytE?=
 =?utf-8?B?VDROaktZQmVGR0x3YTVQZ0szV0JFVHN3TXM3cnNUT0hKcEl5N0JsOW1iT1Rt?=
 =?utf-8?B?YXB1Vk51ak1YeEJiMlBzQkhiMDVBd3U0OHdIQkpMYjhZK1ljV2xmQWo1WEdF?=
 =?utf-8?B?UU5yRkorTEEyNStTc3BZZEhCbzJqSjdJT2hTRXNESy9XWmtaU1ZwM0Jmc3p3?=
 =?utf-8?B?YkEyN2J5SW0wTnlTUnovcWdRaHozeHBON3ZINFdLdVBQbytGQklIV1FpTUo2?=
 =?utf-8?B?cUY3NTFuVFRFOEhhYUxneElRMFhzMkNpN2VBQnEvTTMwYnd4OVBPLzBRb0lO?=
 =?utf-8?B?Zld4OFh4VXJrelJ4Z1RKdWhCcDRKZDJ6Q2FpOWxiNlU2czhtUjFzNW9mR1N4?=
 =?utf-8?B?K295Z0MvTVkybVp5M0o5Qmw4bE13R1FiQkZ4OTljY284Q3o4RUQzcG4vQlVk?=
 =?utf-8?B?eVRya2g0bVIzZ1FkcDVRMUVySGREZlU0Rzd5TWU0WXVCSElxM05nYVUwZFdp?=
 =?utf-8?B?NmpjVEU3OStOTWkyNzdQaGdTMWZ4bWRnRmpsV00rbUpwc05vMEtIdnlmR1Ir?=
 =?utf-8?B?emdxM0gyZ0NERXNPN0dLdFVPWXFTTlJrU3hkZnZTZEVEYnBwdnJvNHgxM3JH?=
 =?utf-8?B?dzY1bHF3SlFoUzI1T244SVliSXoxYXVpVjdFbmh2Szd5dHdhZWQ5bmVEdGtX?=
 =?utf-8?B?S25lLy91QmFyU0hyQmdmQkVIYllLUVh5OXZTNmdIdk11QTM4ZFhtNTdsNFBH?=
 =?utf-8?B?RTh3WThQN3FtTkc1RWdta0s5TTNiV3FKMzVIRU9hL2YyYWF3MnYzamdEbzdY?=
 =?utf-8?B?Z0ZIQzdTM01NU0ZkNWVEMWQ1RUZGUVFoVXBZNFJsTWNLSTZPQy9uNmF3UTMz?=
 =?utf-8?B?QXlFWWtpNEhXRWlsMmhPekoyY2JwM0czdlo2aU84Z25HVmFnVnhoREtUTGps?=
 =?utf-8?B?Mmc3MkFxSW90bGJlYlEyQnJpUnZPWDg3K2FCZGtnNVUvVDQxSWNWVFpuZnN0?=
 =?utf-8?B?Q1ZRV3lta0VtL2s2ODJhaCtTZEhRMmZ3aDBpS05QcnJUTjRJT3lNUWVvMmhD?=
 =?utf-8?B?WUVBam9zN0k0bzAwZTVDVXdBMHlqRzVzNW4rdlQ3ZGJqT2hnQXNpZG93YWtk?=
 =?utf-8?B?bVN6cHZLdHdDSkRvMGcwLy9IbDhHNWQxU3dYTkU2bmt3Y0ZRSEpQSWYvZ2lX?=
 =?utf-8?B?ZlBXZlZOZ3V0VzhVWFlvYkEwakJUR0krbVl4aXlDTmRESmh6cGFTa0ZvNGIw?=
 =?utf-8?B?QnpZUzhLN3hJWERsa1dCdG5XL1hEMU1pck5hamZadHEwYi9acHBscVQyazFx?=
 =?utf-8?B?Tlh5OWhDN0dIL3cybVpmZDRVQ1NlTmgzTUJwKzlKVXNBamw3UGZsZitMUkVQ?=
 =?utf-8?B?dG9CZmpBVjZCRUtYTmRHVWVDTlpsdDJYS01OTDRGV0JxYk9ENXBVbVRsSzNx?=
 =?utf-8?B?RXQ1WGNNMmxkL2QxN3JFQUtzZ3VCZlpaSmxKWTJjcDNPVlJaeFNMV3JKZjlx?=
 =?utf-8?B?VC9wUit4ZXQ0T0JhNW1reHdKRTdhSWpyUzM3TEoyajVSeWlRcUVkWXlvOTJG?=
 =?utf-8?B?T25TVWV0aGdGWG91US9YcjkzZGNCbTVLVlJXR2haRWpJaXhRZ2tqVVpLdVdi?=
 =?utf-8?B?Mk9LV0NwWE5lZ0VuemVzanFYU3lKUS9iUzFCMXM4RWhHS1I3MG1DeHR1RXZY?=
 =?utf-8?B?UXJWeDNNVXAxNnM1WXFsTHAxZ25maWVxT0tYbXVQYm0zeFV1RlVLL25yZ3Zw?=
 =?utf-8?B?a2dJZGJ2RU9KZnVPck1HaGtTendvaWJxR3VwVlNvbHBXUHNBbHBBaE55QlBY?=
 =?utf-8?B?RUtWRWhBQThZbHFwdVlna1J4NWgrWGg4bHpqTGs1NU9hbStUOFhkNXJtdXFr?=
 =?utf-8?B?ZHRST05kUGRyUklucXY1Q2dxOG1GR1F5SXErQW9Kb0JiNEJNMFR0dGQyUFpv?=
 =?utf-8?B?M0JMRmJXZVlkSzgza3N3eUE5RjlEVFAvbm9ZdjJvTDNxdFdlY3lvZTBtTWZ5?=
 =?utf-8?B?OVIvOUxkTzRQdk91eUhodXNjWDVZZEg3Q2RmZUdrZXhkaWFLa2NEeUx4SGdC?=
 =?utf-8?B?Qy9vcFVGRmpjMTA5bkdYTFRJQWV2RkY0MDR1UTFxSm9NVnZrUGw5S3hDcFln?=
 =?utf-8?B?NU5SemNUMmtkV2t1U1V6c0xDdm5EL1lpeEc4UW1FQncvOS9kLzRoenZDVVZQ?=
 =?utf-8?B?SXRJVlRYalJFcHRxWk5BbW1IbU1zR2FIRVRBNzdLNmN0RFJqQVUzQ0NEZWNs?=
 =?utf-8?B?UEtwb1RRZ0x6ZW9rRTdvYWtIZCtXVVVzTGpWejBCdUZMTnU3blAxQT09?=
X-Exchange-RoutingPolicyChecked: HVSMp2qKvcZYb1j2riy8tPHQEXP05NnhCeMaO8U4iMNctAcwHfBX4VUAvACFw/MlPxt8Wt30uwvd+8sgiX/ltNVIs7NzGx6pmFp71xpQpz7E9bZdydYULsrQ2FGsa9BTpASBp2ni3tyotY7uYRQe38mimtddZW43bdRFrvzhLdQlC9oYW6Sqijl0qH95jiii1ERY0w/3VB7QY/rWTpUakAK/gSutsjKLfRpIJ1ZGvGw3ebjlh0HLoZEjVpeNoq7IUe8QRmZECzTTEM35oBC24cz+SMZWNAPJt7aP3u1BJmyyxhcJ2625CLsvBXhWTZz/iabtwnLu8pfJ90sQvF8HYw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ba94eb7e-025d-429f-33e5-08de8ae78bf8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 03:27:02.6910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jmGl0250LHq5MIR/Wof6YK1JRLEG9kdCrV138k1Xe9GgYJ2TdrC6k1qego7c1RBdC2q57HXM9FUq4TMzXOh+yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8820
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

Hi Jason-JH,

On 3/17/2026 9:31 PM, Jason-JH Lin wrote:
> Refactor framebuffer management to improve reusability:
> - Create framebuffers once per CRTC at test initialization via
>    create_fbs() and reuse them across all subtests
> - Centralize cleanup in remove_fbs() called at test fixture end
> - Use per-CRTC framebuffer array (data.fbs[IGT_MAX_PIPES]) indexed
>    by crtc->crtc_index instead of single global framebuffers
>
> Each framebuffer is created with the actual resolution of the first
> output that can connect to that CRTC, avoiding buffer size mismatch
> issues (e.g., 3504x2190 panel incorrectly using 3840x2160 buffer).
>
> For MST tests, multiple outputs share bandwidth and may require mode
> override to fit within bandwidth constraints. When mode override
> changes the resolution, properly detach planes before removing the
> existing framebuffers, then recreate them with the new dimensions.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Suggested-by: Karthik B.S <karthik.b.s@intel.com>
> ---
>   tests/kms_content_protection.c | 216 +++++++++++++++++++++++++--------
>   1 file changed, 168 insertions(+), 48 deletions(-)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index f35c9fa73a57..d470a8de5700 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -107,10 +107,15 @@
>   
>   IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>   
> +struct hdcp_test_fbs {
> +	struct igt_fb red;
> +	struct igt_fb green;
> +};
> +
>   struct data {
>   	int drm_fd;
>   	igt_display_t display;
> -	struct igt_fb red, green;
> +	struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
>   	unsigned int cp_tests;
>   	struct udev_monitor *uevent_monitor;
>   	bool is_force_hdcp14;
> @@ -257,7 +262,15 @@ commit_display_and_wait_for_flip(enum igt_commit_style commit_style)
>   	}
>   }
>   
> -static void modeset_with_fb(igt_output_t *output,
> +static igt_crtc_t *output_get_driving_crtc_assert(igt_output_t *output)
> +{
> +	igt_crtc_t *crtc = igt_output_get_driving_crtc(output);
> +
> +	igt_assert(crtc);
> +	return crtc;
> +}
> +
> +static void modeset_with_fb(igt_output_t *output, igt_crtc_t *crtc,
>   			    enum igt_commit_style commit_style)
>   {
>   	igt_display_t *display = &data.display;
> @@ -267,18 +280,19 @@ static void modeset_with_fb(igt_output_t *output,
>   	mode = igt_output_get_mode(output);
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_plane_set_fb(primary, &data.red);
> -	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
> +	igt_fb_set_size(&data.fbs[crtc->crtc_index].red, primary, mode->hdisplay, mode->vdisplay);
>   
>   	igt_display_commit2(display, commit_style);
>   
> -	igt_plane_set_fb(primary, &data.green);
> +	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].green);
>   
>   	/* Wait for Flip completion before starting the HDCP authentication */
>   	commit_display_and_wait_for_flip(commit_style);
>   }
>   
> -static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_style,
> +static bool test_cp_enable(igt_output_t *output, igt_crtc_t *crtc,
> +			   enum igt_commit_style commit_style,
>   			   int content_type, bool type_change)
>   {
>   	igt_display_t *display = &data.display;
> @@ -301,7 +315,7 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
>   	ret = wait_for_prop_value(output, CP_ENABLED,
>   				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>   	if (ret) {
> -		igt_plane_set_fb(primary, &data.green);
> +		igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].green);
>   		igt_display_commit2(display, commit_style);
>   	}
>   
> @@ -314,13 +328,15 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
>   {
>   	igt_display_t *display = &data.display;
>   	igt_plane_t *primary;
> +	igt_crtc_t *crtc;
>   	bool ret;
>   	int count;
>   	u64 val;
>   
>   	for (count = 0; count < valid_outputs; count++) {
> +		crtc = output_get_driving_crtc_assert(hdcp_mst_output[count]);
>   		primary = igt_output_get_plane_type(hdcp_mst_output[count], DRM_PLANE_TYPE_PRIMARY);
> -		igt_plane_set_fb(primary, &data.red);
> +		igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
>   		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION,
>   					  CP_UNDESIRED);
>   	}
> @@ -338,7 +354,8 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
>   	igt_assert_f(ret, "Content Protection not cleared on all MST outputs\n");
>   }
>   
> -static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_style)
> +static void test_cp_disable(igt_output_t *output, igt_crtc_t *crtc,
> +			    enum igt_commit_style commit_style)
>   {
>   	igt_display_t *display = &data.display;
>   	igt_plane_t *primary;
> @@ -352,7 +369,7 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
>   	 */
>   	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
>   				  CP_UNDESIRED);
> -	igt_plane_set_fb(primary, &data.red);
> +	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
>   	igt_display_commit2(display, commit_style);
>   
>   	/* Wait for HDCP to be disabled, before crtc off */
> @@ -361,7 +378,7 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
>   	igt_assert_f(ret, "Content Protection not cleared\n");
>   }
>   
> -static void test_cp_enable_with_retry(igt_output_t *output,
> +static void test_cp_enable_with_retry(igt_output_t *output, igt_crtc_t *crtc,
>   				      enum igt_commit_style commit_style,
>   				      int retry, int content_type,
>   				      bool expect_failure,
> @@ -372,16 +389,16 @@ static void test_cp_enable_with_retry(igt_output_t *output,
>   
>   	do {
>   		if (!type_change || retry_orig != retry)
> -			test_cp_disable(output, commit_style);
> +			test_cp_disable(output, crtc, commit_style);
>   
> -		ret = test_cp_enable(output, commit_style, content_type, type_change);
> +		ret = test_cp_enable(output, crtc, commit_style, content_type, type_change);
>   
>   		if (!ret && --retry)
>   			igt_debug("Retry (%d/2) ...\n", 3 - retry);
>   	} while (retry && !ret);
>   
>   	if (!ret)
> -		test_cp_disable(output, commit_style);
> +		test_cp_disable(output, crtc, commit_style);
>   
>   	if (expect_failure)
>   		igt_assert_f(!ret,
> @@ -451,16 +468,16 @@ static void test_content_protection_on_output(igt_output_t *output,
>   	igt_display_t *display = &data.display;
>   	bool ret;
>   
> -	test_cp_enable_with_retry(output, commit_style, 3, content_type, false,
> +	test_cp_enable_with_retry(output, crtc, commit_style, 3, content_type, false,
>   				  false);
>   
>   	if (data.cp_tests & CP_TYPE_CHANGE) {
>   		/* Type 1 -> Type 0 */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, crtc, commit_style, 3,
>   					  HDCP_CONTENT_TYPE_0, false,
>   					  true);
>   		/* Type 0 -> Type 1 */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, crtc, commit_style, 3,
>   					  content_type, false,
>   					  true);
>   	}
> @@ -470,14 +487,14 @@ static void test_content_protection_on_output(igt_output_t *output,
>   			     "mei_hdcp unload failed");
>   
>   		/* Expected to fail */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, crtc, commit_style, 3,
>   					  content_type, true, false);
>   
>   		igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
>   			     "mei_hdcp load failed");
>   
>   		/* Expected to pass */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, crtc, commit_style, 3,
>   					  content_type, false, false);
>   	}
>   
> @@ -496,7 +513,7 @@ static void test_content_protection_on_output(igt_output_t *output,
>   		ret = wait_for_prop_value(output, CP_ENABLED,
>   					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>   		if (!ret)
> -			test_cp_enable_with_retry(output, commit_style, 2,
> +			test_cp_enable_with_retry(output, crtc, commit_style, 2,
>   						  content_type, false,
>   						  false);
>   	}
> @@ -507,7 +524,7 @@ static void test_content_protection_on_output(igt_output_t *output,
>   		ret = wait_for_prop_value(output, CP_ENABLED,
>   					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>   		if (!ret)
> -			test_cp_enable_with_retry(output, commit_style, 2,
> +			test_cp_enable_with_retry(output, crtc, commit_style, 2,
>   						  content_type, false,
>   						  false);
>   	}
> @@ -577,21 +594,24 @@ static bool sink_hdcp2_capable(igt_output_t *output)
>   	return strstr(buf, "HDCP2.2");
>   }
>   
> -static void prepare_modeset_on_mst_output(igt_output_t *output, bool is_enabled)
> +static void prepare_modeset_on_mst_output(igt_output_t *output, igt_crtc_t *crtc, bool is_enabled)
>   {
>   	drmModeModeInfo *mode;
>   	igt_plane_t *primary;
>   	int width, height;
> +	struct igt_fb *fb;
>   
>   	mode = igt_output_get_mode(output);
>   
>   	width = mode->hdisplay;
>   	height = mode->vdisplay;
>   
> +	fb = is_enabled ? &data.fbs[crtc->crtc_index].green : &data.fbs[crtc->crtc_index].red;
> +
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
> -	igt_fb_set_size(is_enabled ? &data.green : &data.red, primary, width, height);
> +	igt_plane_set_fb(primary, fb);
> +	igt_fb_set_size(fb, primary, width, height);
>   	igt_plane_set_size(primary, width, height);
>   }
>   
> @@ -663,11 +683,11 @@ static void reset_i915_force_hdcp14(igt_output_t *output)
>   }
>   
>   static void
> -test_fini(igt_output_t *output, enum igt_commit_style commit_style)
> +test_fini(igt_output_t *output, igt_crtc_t *crtc, enum igt_commit_style commit_style)
>   {
>   	igt_plane_t *primary;
>   
> -	test_cp_disable(output, commit_style);
> +	test_cp_disable(output, crtc, commit_style);
>   	primary = igt_output_get_plane_type(output,
>   					    DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, NULL);
> @@ -739,7 +759,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
>   			if (!intel_pipe_output_combo_valid(display))
>   				continue;
>   
> -			modeset_with_fb(output, commit_style);
> +			modeset_with_fb(output, crtc, commit_style);
>   			if (data.is_force_hdcp14)
>   				set_i915_force_hdcp14(output);
>   
> @@ -753,7 +773,8 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
>   			if (data.is_force_hdcp14)
>   				reset_i915_force_hdcp14(output);
>   
> -			test_fini(output, commit_style);
> +			test_fini(output, crtc, commit_style);
> +
>   			/*
>   			 * Testing a output with a pipe is enough for HDCP
>   			 * testing. No ROI in testing the connector with other
> @@ -846,8 +867,11 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
>   		if (!ret || retries)
>   			igt_debug("Retry %d/3\n", 3 - retries);
>   
> -		for (i = 0; i < valid_outputs; i++)
> -			prepare_modeset_on_mst_output(hdcp_mst_output[i], ret);
> +		for (i = 0; i < valid_outputs; i++) {
> +			igt_crtc_t *crtc = output_get_driving_crtc_assert(hdcp_mst_output[i]);
> +
> +			prepare_modeset_on_mst_output(hdcp_mst_output[i], crtc, ret);
> +		}
>   
>   		igt_display_commit2(display, COMMIT_ATOMIC);
>   	} while (retries && !ret);
> @@ -869,6 +893,7 @@ test_content_protection_mst(int content_type)
>   	igt_crtc_t *crtc;
>   	bool pipe_found;
>   	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
> +	drmModeModeInfo *mode;
>   
>   	for_each_crtc(display, crtc)
>   		max_pipe++;
> @@ -889,7 +914,34 @@ test_content_protection_mst(int content_type)
>   		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
>   
>   		igt_output_set_crtc(output, crtc);
> -		prepare_modeset_on_mst_output(output, false);
> +
> +		mode = igt_output_get_mode(output);
> +
> +		/*
> +		 * Check if framebuffers already exist for this crtc from create_fbs().
> +		 * Since non-MST tests run first and share the same data.fbs[] array,
> +		 * the existing FB may have a different resolution than this MST output
> +		 * requires. If so, properly detach planes, remove old FBs, and recreate
> +		 * with the correct dimensions for this MST output.
> +		 */
> +		if (data.fbs[crtc->crtc_index].red.fb_id) {
> +			igt_plane_t *primary = igt_output_get_plane_type(output,
> +									 DRM_PLANE_TYPE_PRIMARY);
> +
> +			igt_plane_set_fb(primary, NULL);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].red);
> +			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].green);
> +		}
> +
> +		igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				    1.f, 0.f, 0.f, &data.fbs[crtc->crtc_index].red);
> +		igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				    0.f, 1.f, 0.f, &data.fbs[crtc->crtc_index].green);
> +

Do we really need this recreation here before we even tried 
'igt_override_all_active_output_modes_to_fit_bw'? Because I'm thinking 
that the mode we get here should be the same as we got earlier in the 
create_fbs?

Regards,
Karthik.B.S
> +		prepare_modeset_on_mst_output(output, crtc, false);
>   		dp_mst_outputs++;
>   		if (output_hdcp_capable(output, content_type))
>   			hdcp_mst_output[valid_outputs++] = output;
> @@ -905,9 +957,31 @@ test_content_protection_mst(int content_type)
>   		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
>   		igt_require_f(found, "No valid mode combo found for MST modeset\n");
>   
> -		for (count = 0; count < valid_outputs; count++)
> -			prepare_modeset_on_mst_output(hdcp_mst_output[count], false);
> +		/* Detach planes before removing framebuffers */
> +		for (count = 0; count < valid_outputs; count++) {
> +			crtc = output_get_driving_crtc_assert(hdcp_mst_output[count]);
> +			prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc, false);
> +		}
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +		/* Need to re-prepare after mode override */
> +		for (count = 0; count < valid_outputs; count++) {
> +			crtc = output_get_driving_crtc_assert(hdcp_mst_output[count]);
> +
> +			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].red);
> +			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].green);
> +
> +			mode = igt_output_get_mode(hdcp_mst_output[count]);
> +
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    1.f, 0.f, 0.f, &data.fbs[crtc->crtc_index].red);
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    0.f, 1.f, 0.f, &data.fbs[crtc->crtc_index].green);
>   
> +			prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc, false);
> +		}
>   		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>   		igt_require_f(ret == 0, "Commit failure during MST modeset\n");
>   	}
> @@ -933,8 +1007,9 @@ test_content_protection_mst(int content_type)
>   	/*
>   	 * Verify if CP is still enabled on other outputs by disabling CP on the first output.
>   	 */
> +	crtc = output_get_driving_crtc_assert(hdcp_mst_output[0]);
>   	igt_debug("CP Prop being UNDESIRED on %s\n", hdcp_mst_output[0]->name);
> -	test_cp_disable(hdcp_mst_output[0], COMMIT_ATOMIC);
> +	test_cp_disable(hdcp_mst_output[0], crtc, COMMIT_ATOMIC);
>   
>   	/* CP is expected to be still enabled on other outputs*/
>   	for (i = 1; i < valid_outputs; i++) {
> @@ -945,13 +1020,26 @@ test_content_protection_mst(int content_type)
>   
>   	if (data.cp_tests & CP_LIC)
>   		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
> -}
>   
> +	/* Detach planes before removing framebuffers */
> +	for (count = 0; count < valid_outputs; count++) {
> +		crtc = output_get_driving_crtc_assert(hdcp_mst_output[count]);
> +		prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc, false);
> +	}
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	for (count = 0; count < valid_outputs; count++) {
> +		crtc = output_get_driving_crtc_assert(hdcp_mst_output[count]);
> +		igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].red);
> +		igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].green);
> +	}
> +}
>   
>   static void test_content_protection_cleanup(void)
>   {
>   	igt_display_t *display = &data.display;
>   	igt_output_t *output;
> +	igt_crtc_t *crtc;
>   	uint64_t val;
>   
>   	for_each_connected_output(display, output) {
> @@ -963,34 +1051,56 @@ static void test_content_protection_cleanup(void)
>   		if (val == CP_UNDESIRED)
>   			continue;
>   
> +		crtc = igt_output_get_driving_crtc(output);
> +		if (!crtc)
> +			continue;
> +
>   		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
> -		test_cp_disable(output, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +		test_cp_disable(output, crtc, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	}
> -
> -	igt_remove_fb(data.drm_fd, &data.red);
> -	igt_remove_fb(data.drm_fd, &data.green);
>   }
>   
>   static void create_fbs(void)
>   {
> -	uint16_t width = 0, height = 0;
>   	drmModeModeInfo *mode;
>   	igt_output_t *output;
> +	igt_crtc_t *crtc;
>   
> +	/* Create framebuffers for each connected output's pipe */
>   	for_each_connected_output(&data.display, output) {
>   		mode = igt_output_get_mode(output);
>   		igt_assert(mode);
>   
> -		width = max(width, mode->hdisplay);
> -		height = max(height, mode->vdisplay);
> +		/* Find a valid crtc for this output */
> +		for_each_crtc(&data.display, crtc) {
> +			if (!igt_crtc_connector_valid(crtc, output))
> +				continue;
> +
> +			/* Skip if already created for this crtc */
> +			if (data.fbs[crtc->crtc_index].red.fb_id)
> +				continue;
> +
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    1.f, 0.f, 0.f, &data.fbs[crtc->crtc_index].red);
> +			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					    0.f, 1.f, 0.f, &data.fbs[crtc->crtc_index].green);
> +			break;
> +		}
>   	}
> +}
>   
> -	igt_create_color_fb(data.drm_fd, width, height,
> -			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -			    1.f, 0.f, 0.f, &data.red);
> -	igt_create_color_fb(data.drm_fd, width, height,
> -			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -			    0.f, 1.f, 0.f, &data.green);
> +static void remove_fbs(void)
> +{
> +	igt_crtc_t *crtc;
> +
> +	for_each_crtc(&data.display, crtc) {
> +		if (data.fbs[crtc->crtc_index].red.fb_id)
> +			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].red);
> +		if (data.fbs[crtc->crtc_index].green.fb_id)
> +			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].green);
> +	}
>   }
>   
>   static const struct {
> @@ -1155,9 +1265,18 @@ static const struct {
>   int igt_main()
>   {
>   	igt_fixture() {
> +		igt_crtc_t *crtc;
> +
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
> +
> +		/* Ensure all CRTCs can be indexed within our framebuffer array */
> +		for_each_crtc(&data.display, crtc)
> +			igt_assert_f(crtc->crtc_index < IGT_MAX_PIPES,
> +				     "crtc_index %u exceeds IGT_MAX_PIPES %u\n",
> +				     crtc->crtc_index, IGT_MAX_PIPES);
> +
>   		create_fbs();
>   	}
>   
> @@ -1216,6 +1335,7 @@ int igt_main()
>   
>   	igt_fixture() {
>   		test_content_protection_cleanup();
> +		remove_fbs();
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
>   	}
