Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C8C10A88C3
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 15:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9757010E07C;
	Thu, 26 Mar 2026 15:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mj7R1jgD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224FF10E2BA
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 15:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774538176; x=1806074176;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kiNi5iHOaqGnowjKajM277ba1uYrdW5Mma6DJu8pZ/8=;
 b=mj7R1jgDKSN5ZPeuSR6hsGZs29Q9APINwA1K1N/JCexcJWX48qVRlgJV
 bsUKL8pGuWeElQBdjD2FLNE1MgUk6qAz1MwJmgMj/xHWvS4I345gaWMSW
 lsVRuwhedrm1tDnjLkDorbeFLyziIX9gpJ6eMMN0VY7Vrf6+FfC0Kld/P
 r8hj1WWSYP3MdjeoBiJVUq9p0z7etrA4q0gye/sNXd84MGP7daF21s/5M
 ZSUU64qyW+FnFEJnO1LpqeEJBZNGfAWK4WwvzWHBVnCjOtIE3UnmHVJ/v
 865NczfriAIGwMmA0iU3TvXWl/xc9TywMnyxpG6hFusxDZZxvXXzzSxC8 Q==;
X-CSE-ConnectionGUID: XvxHHyWyRBCQFAkFgFJp2g==
X-CSE-MsgGUID: TbArsY9gTKeHTbf932j2jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="63153795"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="63153795"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 08:16:15 -0700
X-CSE-ConnectionGUID: loOD+v5aTQSJMT33nYupTQ==
X-CSE-MsgGUID: H0nprr2NQMic6h3v6LMCMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224209775"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 08:16:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 08:16:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 08:16:14 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 08:16:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTkhAfeFtepKmRLTAY0Ck3h7eUp58VIBlQShzZdK/HgkRJGqIASMfDjHb7slYAakHiWuV5p7tcB/jc3wPYmTErEGOZHvcUiSATfYRX1puRcHrjfu864MPntSFnm0Qly2XyUYqNyitYYiiIsMXJHfCcwqlMmYD8fcYnYZKc7e0huVsZ+HQQj6ctSBrZiG5WqurykP54dW+FTehYbYCNT5T2DKIiq2WWpqFURX0GXfEaHIxShjJDewiJVjQgQQ45UdAEH0Pa8sxhpHJPTypA5qTyRKUz8GStw/JsXlWsxBesyaHjrLCDteK8oDkWZ1c9VNMxdtBH4xHImKVDFML+QEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFCmkSER6vZuVut5kbUH1RFF3v+HlbQV2Uyt6rG6nkI=;
 b=khjpd/UXk6umtgtsJx5pTsWQUGFH+zcfbS9MLcI+IZgQFWE6DcXeNbFsKo9hYlmpdGbtO+S9a59Wh+k/Eva604d03ZtHzd9i44Y0lKiA9Ix1SOBBQ2clW5zHbmFEvIGI2oWx8R0sS7CmYnm1OexVb8ZDD6AZZ6gfH8tkfYk5ByUi7rvqGvNQpExCW0KDp1r4vK0/l11sYPYMJOXE0CvFSlbkzSeg/gZJL293Z2c6yDj6mkwa3zBkJ7okW5wxuo+nCeyX7UGHfXjSFEkAwQTGLxMT6r5iStnBufaB/MBN3H6xjzPR4jGBNNOxqy8KgNaWeg69u27cI4k47jGnNPH9dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by MW4PR11MB6840.namprd11.prod.outlook.com (2603:10b6:303:222::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 15:16:09 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9745.007; Thu, 26 Mar 2026
 15:16:09 +0000
Message-ID: <dc6e1af4-35dd-4a01-be7d-6dfe4b5d0af5@intel.com>
Date: Thu, 26 Mar 2026 20:46:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 6/6] tests/kms_flip: test suspend at most twice
 on SNB && BMG
Content-Language: en-GB
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20260309092528.3336467-1-michal.grzelak@intel.com>
 <20260309092528.3336467-7-michal.grzelak@intel.com>
 <a9ecfa3b-5ae3-40c1-9a5f-04c598386fdc@intel.com>
 <17afd2fc-7994-2e40-02da-f7725c58ccc5@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <17afd2fc-7994-2e40-02da-f7725c58ccc5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::16) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|MW4PR11MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: faec4e9b-067d-4676-1cc2-08de8b4a9bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: NdC99+vppAXaDaxIsR1mKe/guWJKQrnNnemXpaziTrvMtfkALTpRAqR0T32prO0bsikFvrS8MEQGa9MiIsM47JAuZuTfvIVChT+XHDwkyVBNykYXT5NdeVr6yNdOleY2eA0S8TjiJuTVQ2nBwzUDCbv6iPk0M7/LuiExbixB+0D00ujOja6ToOoFzimSAuOaO9ITXAFcDb0jjAa0789TQN3xZxKOMsFCgJJAFdRG/mGOC+98V5Xe6GPfNLGFPtwlCPpKIUpUIv43qduhxKnsXagHJUpNevpJVEku0LTo0qKVT6nsDO3zG7GMq9Zg1BHTEWgRRbzkI7dTQkTl+jRO5xvUKsxSA1af9WKqCMMx2usz4btSfVvY62IiG1ybXNlTC8sZiTw+V2fyswFtNooRNGK6KpCaOxKumANghsVe+To73oYbnCL7Yi6dew9tA3SXfEFDv1lqibd0qCAVnztrviPfXB5S69ZMzzAXKvWagUaurzyHipgy86C5JwBSvk/DByBAbbDqj+PD95PugeXbkoiE/x8fllth3ViLqh36QOuvwPa13oZUbNnY3AA32CLPDgB610kYZ9rA957cxIKTnC+p6pUQY46UYQnqKHRjg1RzYneAa46DuQ6oMvxjSrGfiAbV8NOfHhaeCM++Db0zoqICzyTzl+9mkQ0uL+ZqhJGdNHNST7IvRIYl99SVkkFt7/XthNETcXYBzP9bbGLmvAL1Vufi0DB/UuAZTfLCR64=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjNkSXAvSHZobmk5aDZFQ3B6SWJCaCtsb2M4WnJZakdvTXd3d0tkYXgzeVVm?=
 =?utf-8?B?THJha29oaDRLU0FmUTcvV3FPdGdyMUJaS0dyOEJvbEozQTJHZEErNkxBR0JU?=
 =?utf-8?B?K0d0Qk9TME1SSld2S1grdFhqR1dBcWNLWmpSWXFiMVJ3Yk9rR0VVRjE0dGNU?=
 =?utf-8?B?bUlDS21Yd0tuZDJVNjFwUXRjam1kNU40V1B1UWZyMmJCalhoT1Bid2Q5TUg0?=
 =?utf-8?B?L0Q4ZzJ6K3EvY24wOFJ3SjlPSXNxRUdKcmp3TjlpSC9QR1d4ditZbzNKem9x?=
 =?utf-8?B?S2NldWcxOExmR0JuRVFMZmdtNHpoZFpEOHJ6Mlo4Qnc5SG5WcVVMZHc4VSs2?=
 =?utf-8?B?elFsYnA5c3N4VVVOQjlCeTd0bzkzUWtLZ1I0emdEQ1VQR1RORjlhY3NXaXRO?=
 =?utf-8?B?NVBaWlJoblJaUmRVTTJBZEx0RlRCTERUVlhPTHhjUFVPbEE4Y2JXU29GbmhP?=
 =?utf-8?B?N2E5MGZlOWs0YkYwNGEwVmdCSGxsZERqQXF2S1NIS3ZFMFZXeFRFZ1RqYTky?=
 =?utf-8?B?N2FVdTVwQVRPVGg5WkxrS3gzUGdNQXRPVFFCYkhtVnRCdHU0aEJuYUVaWDhD?=
 =?utf-8?B?QmRDNG5RVkNqalJ2UmpMeW1yUGt1MVBnaGcwOVdaaGlSSlJQL1p5M3pxbVlk?=
 =?utf-8?B?OGMySldESTB4WHB5MnBoSFM1bTE1cFkvbVNGVFFDeTh6eU1mRlAyUW12dk9E?=
 =?utf-8?B?bDAraHR3YmR2UmZLRWltc1dqT2RVNDR2NkNGSkg5cHk5YjRUTi9SQnFhZFdx?=
 =?utf-8?B?NUh0Nk1ROUhKczk0eENjQmxad3BpMGNkS0o3YlJNR1hoVTVpL21CdFlxRkhl?=
 =?utf-8?B?RTFLS1d0ZWo3bmFyaTFTTjlkaFRva1lFbjdsSGh3QnZzbkcwbk9TZnFidVFU?=
 =?utf-8?B?U3JCc2ltMUtvMk4wQmtVNGRqL21ObmYva2ZYNjF1aEpZUDNIdmNYaVQ2UWhV?=
 =?utf-8?B?K0RPUFpyMi9McXlGQ21jUFA1OFFwL2FWdTZmMGx3Z3BNUE95NStPOHg2WE01?=
 =?utf-8?B?RlJXMnBHUVN2eGk1YzJ0M3NPYSt6cU11RC91YVVBbWxmd2FKVzZTdjA3UEtJ?=
 =?utf-8?B?SGJ5NDllZzZmb0tzOS9QcFdzMVB0MUN2SFVudEtxcFNjOE1DbUpUQi9pM2E4?=
 =?utf-8?B?U2xYTTlFR3g5Z3V3UUk1dkQ0M2pYZE4zSGh6QVFiWTdPSTRiT2h5UVcxTXZV?=
 =?utf-8?B?aXZXcHFyMEF5aXVhc3lRRTEzZmFFL3JhanZmaU1UakV4eFZhREd1VEl6SkZl?=
 =?utf-8?B?NEF2UU1PTDRjK3BsdFdSUE9iN3dTdS9vYmJ5b1BzZjVRTEJSN0JDdmFpeDZj?=
 =?utf-8?B?Q09qWFlaOEJaYjNTUEQvellJdDh0bTlJbW1hOHNDVWI2OFVnc0loVDBMS1Az?=
 =?utf-8?B?cVdEdXJtMlFVZG1yOUIvYVpreE5nTU1FNVVNUXFxTnB5amxqaFlPcWd4czdn?=
 =?utf-8?B?OUhRZk5EM1RlTUQzTmZOUUE3eUVyKzVITzVjQTl1ZDVDdVVRMExVaXZqNUE0?=
 =?utf-8?B?dDU2em9rNzI5ZWNDM0UvM1dCdEtTZlhVODVwQXdVV0J3UHRPZW8wdUlTQkxh?=
 =?utf-8?B?Y3pMbWtDUDBVTXJXcytxYURMZUZ5Y25HNXNpWFcrTnZteGJmT1pBbXA3eHJi?=
 =?utf-8?B?QUUwYk9qM0NjdEsyUVRTaFVETGlBWnVpS2NSOWNFeDQ3Q3R4bHo4M3dLdEl3?=
 =?utf-8?B?RmhZK0hwby9FNFc5bitCdzhKMUhyS3hybjFKZjJZTHFQNEtia3NrdzgwdTlq?=
 =?utf-8?B?WnlUem44d3d6ek5zYWsvaDhEbWZlWnhacG5ZQUhwWDVTNG1GNU82Q2lnT0pm?=
 =?utf-8?B?dGx5bGx3bk5rL0hNK3dpZ2JkcVVTbVpkSU1LYzBENzl3V1pOeTdoN1YzNzZE?=
 =?utf-8?B?YjdPTWh3bnlwdXg3NEljU1NuT25PSmZoWVFkY3ZFeDc1VnBCdCtQNHFLK1c1?=
 =?utf-8?B?bkVJZEF2cE1zczdpK3BteWs1M01mUUFYeFZOeGN5VUNIOFp1YjVLNDRKWnFy?=
 =?utf-8?B?cmo3Ri9ObU5Ia2E0d21tWC9MVnZoMzlkWmlGa0RyaE1jOTZRV0lqczI0TnVk?=
 =?utf-8?B?TklzSUxOUjErdmtvRkRjK3lzdEFqZUN4aFZmRUIrMUxxUzVRQit4UlNwRDJo?=
 =?utf-8?B?VjVqK1hKRlNUTTluT2ZyWEdNR3F0M3RnT1hYYW1vZEx6OFZFdTUwdGlzVU9n?=
 =?utf-8?B?eVp6T1h5MktrSHhFbDhTU0V4UkZjdUt0aDVQdmx1blRkSnJCZVdWYW4vMkxL?=
 =?utf-8?B?d3A2b3BOMEdFWFZVKzRGLzhucjkvbVNYTkY2ZHRPMXZnN2JhS25FWWhuTnJW?=
 =?utf-8?B?R08zQU8yK3QxbU9wVCtCN0V6SUhOZUJ0eCt0SnM2ajVPNGlWQW1MdXRyc1hp?=
 =?utf-8?Q?P35f0P+OzzahO2Uk=3D?=
X-Exchange-RoutingPolicyChecked: jtL0lQ86zSmNO87IHybxmrFNxNyXHwvCuB5bUoHddBLKRFtGlZIyMaS5622I7Cf2ky4rlFu5veonx3fIGspKj5tk0j2QUXKQtw4LqOQprHV60qV2jS+BCKqQhftEkhHLl2tjgJbSqre34MWOCi8XOMatOis9Ts/qO69YpASBZ/azgxdHi1GZ6Pe0tGjFxjV751RSHwNP3lk0EFTZxIaz96+RxgpT6gXzSvy0f/Lr4vBQ/5gwXGYu+S5A0GqErPV9JjuSIoBb108mMXAFujhKBsTYGqFiv/tpg3shpR7e6zbugmDHqSNjjz9JJ8iLcwNkRMVSdjedOUhohAfNx/Ju4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: faec4e9b-067d-4676-1cc2-08de8b4a9bd9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:16:09.5440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5XzKYBESHim7BiJICG21phSZHcdF5uXa+Ha4n/y2xeSb4VC3xQxODQ65WKHqd9LgMpiqLPoMXBvoY0ZdSZf26hTeZi6nKhGHULKfMNH/DU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6840
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


On 26-03-2026 02:58 pm, Michał Grzelak wrote:
> On Wed, 25 Mar 2026, Thasleem, Mohammed wrote:
>> On 09-03-2026 02:55 pm, Michał Grzelak wrote:
>>
>> gettime_us() on SNB and BMG does not return proper time after starting
>> suspend tests. This results in too many suspends issued before we hit
>> the duration_ms. Break the loop on second execution.
>>
>> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
>> ---
>>  tests/kms_flip.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
>> index f17d027cc..3c5428ff0 100755
>> --- a/tests/kms_flip.c
>> +++ b/tests/kms_flip.c
>> @@ -1322,6 +1322,12 @@ static bool event_loop(struct test_output *o, 
>> unsigned duration_ms,
>>  {
>>      unsigned long start, end;
>>      int count = 0;
>> +    int devid;
-->Use "uint32_t" instead "int" as" intel_get_drm_devid" returns 
"uint32_t".
>> +    bool wa;
>> +
>> +    devid = intel_get_drm_devid(drm_fd);
>> +
>> +    wa = IS_SANDYBRIDGE(devid) || IS_BATTLEMAGE(devid);
>>
>> Why only two specific platforms?
>
> That I would also like to know. :)
> As it is described in the first sentence of the commit message, these
> two platforms have been reported by CI to encounter such issue. If it is
> not clear, I can update the commit message.
>
>> I think, platform specific wa not needed here, instead we can have 
>> generic execution for all,
>> which can work on all platforms. plz check.
>
> Since we are observing the issue only on those two platforms, I don't
> see how to work around it without specifying those two platforms,
> without changing the already present functionality.

I mean to say, use the below suggested code belwo instead using wa.

>
>>
>>
>>      start = gettime_us();
>>
>> @@ -1342,6 +1348,9 @@ static bool event_loop(struct test_output *o, 
>> unsigned duration_ms,
>>          if (count && (gettime_us() - start) / 1000 >= duration_ms)
>>              break;
>>
>> +        if (count && wa && o->flags & TEST_SUSPEND)
>>
>> if (count && wa && o->flags & TEST_SUSPEND) --> if (count && o->flags 
>> & TEST_SUSPEND)
>>
>> +            break;
>> +
>
> I am unsure of this approach. This will break the loop on second run on
> every suspend test, on every platform. While commit c75dcbdac51d
> ("tests/kms_flip: various improvements") says explicitly to do at least
> two rounds of tests, so it would change functionality on every platform.
> I can refactor the patch, but I would retain the WA. Can you provide
> some rationale for changing the functionality on non-affected platforms?

Thanks for exploring this. My suggestion was based on fact that 
clock_monotonic freezes during suspend,
which casue the duration check to never fire correctly  after 
suspend/resume cycle.
Instead adding pltform-specific WA for each new effected platform, I 
suggested a generic solution.

However, as per Daniel  vetter's commit c75dcbdac51d points intent is 
"at lease 2 rounds
always complite, as suspend tests were bailing after just 1 round and 
testing nothing".

I am okey with current WA approach and provided minor comment,
plz check  befrore next version.

>
> BR,
> Michał
>
>>          count++;
>>      }
>>
>>
>>
>>
