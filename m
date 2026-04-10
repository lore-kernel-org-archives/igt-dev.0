Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AEEF36BAD
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 06:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD9B10E131;
	Fri, 10 Apr 2026 06:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oe4Ivg0a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0054010E131
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 06:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775800820; x=1807336820;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UZ1Jy7iCW5oc+QSgM760aboDx25WWMa+hKRHYFkJw8Q=;
 b=Oe4Ivg0aHOvlsdTRVX94xlQRS8RhZJyI/15Q2H1I7FsmoYB38JHfG/XN
 +/ZX64OhSQh4OrN+8OleB3VGy1gcFq1tUptYsRY9ADJK4g3O6NtEfe53b
 t4gOpK+xFHa8i/cTc5BX1l7ZO2T32HxRKZu5or7DoDJp14VarMKvlsGCy
 IqiBGr+Lif7oAYRIU2po3x5VvT/FvjPLaWMdW2bvwb/3O+WpppGy449Pp
 nFiEdVLAzOFWzWe+Yz9BC2IUTLieWCFcs/I+/g9w5Wj1iKYnZQbWBh/Rj
 /rEXV4D17qNW9xy4dcCjzEX/aYZNZRPQ3YK+WNCWyAeL0uzwZ2u6q9XMy g==;
X-CSE-ConnectionGUID: YXjRuPGRSmC9ey04Bhe6JQ==
X-CSE-MsgGUID: GRI5DF9aR6mt3CiTnmVVhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76936833"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76936833"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 23:00:20 -0700
X-CSE-ConnectionGUID: Q0Nc0KAfQP+Gb3nTMcKNzA==
X-CSE-MsgGUID: W6EtLMoaT+KNYSUoGeRRrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="228160077"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 23:00:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 23:00:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 23:00:19 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 23:00:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaScrYE9c9aFSog1IugXrk2vMzxkLUzeUpoey3LAFdGa+U44OzN80eMa6O2qoDt6KZNbrE3F2rYCOVV9YXBMZ6g0WrsrhWjLCwHBeSJir+W0yDeuKjqywIkOKWgLMHFzfS3vIvfz8WXOOysfeG4A4n2RzRlBEnBHjRCETCb/7WqifNKaEeRTcJnyoqmFrwptjKqE/W20iw7Fdjv4OFXvWDzy50sujBeKqVcHQO6S+bb873sUW6VAhdnp18UBzKDavXlCb3OjbjV1Jh2bqTD17IW2zmZfHhBRqjzkcXD7j8gaZpMedPc7ij8rSaE5O7AtcCVlfdeo8Q7d5POzaFySyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoxutNQkiBGhYTSL1NnDm2ivjVqRCBuVpxa1+jSE0q0=;
 b=fhOLyKzKBb9XQ2++KnVb/Vn+2Vw8B/7BdJK6Sxv7EAWD3aO/eUgynh8GG6LqI6VPIZS0s/BUz4KfTyJtjlvj0yvnZVdUNM03o85zBmAJB+VpQPtwyqYedWALBK5itb4NF1mVKH4lA8I2/BO5auPr3Cx6SI7xX7b1r2+GF0WRDQaVjBPXdFYXmcUj6l2aTPtWCjFIg5vvHQS+4hP3HLtPoETqtaIdF7oL6SsG4UmmF18YgX+CPbvr2TlP0T87Ods48MqzCsYBdsmGeBjsZAqEn7DeN6qaAOXiOohrk+CWo25nVKpowvfkPISNp/HnXtj1KX6tNMbw7/4Fo4v68DJeHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Fri, 10 Apr
 2026 06:00:15 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 06:00:15 +0000
Message-ID: <46b9d351-a1fe-41de-90fa-dc8a6c96540f@intel.com>
Date: Fri, 10 Apr 2026 11:30:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/kms_sharpness_filter: Find mode
 with lowest bw requirement for test
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
 <20260331190412.1907571-5-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260331190412.1907571-5-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::9) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: acb894e0-ae11-428e-4f29-08de96c66f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: A8EjaESMUH23Vx4QHqRZ7N/rM+mtMzOcBMRpwYpP+3j6EFrPTVSlqvBl9hfJUjm9pp8PxZfiw+rwVR5OVIeBBioUQgsm39SpVSnvRenzZWTtSvOuBCNnq8bJNrDRDmvLQgSVAErANxTwEJnM1xxYErxMBG+LKSfG8zWld7DQf04BftX0vdpJKNG2wnmjoSIS1NLBnqYuvz2aAzHKw/fT4k5WguifW9L8QaCC71xInzbA/Wi1MgmbXR8YoykW6BpMn+U3KywLA/KFWs3CruKcxNoRg3daAhQXe79R/P6s0aTr0YtIlYj1e/7Y/K5gPWwQtRbNtMsmvAZZ3QONmuEB0IGo5V6culRxw/EJ+No36YJHTww02VHh90keMs59sQbH8Phj7Vo/VAya/7o4d4pU7vSBf5v7ylcHhz/3cL9mXjnUSgkQLfUEHXn78JG4rMWUK4hjk2jV3GQzrwZU2Hsa1EGPZY1G1l9s4XIn4tbiF4e2GKy6j7RGymQKvRCgUWQOlr5oG2qvYqyhTgB8Lo6Iv+gNU/ela+Id5wYzj9J6Zd8n2m4x/QMcLry/1WsPJkoMJD30xDxWkPNd/O+u1yRfTfIeCHwyFip9TfJlXGGHjCVZTReYFU40b96EVRW7kQPzrLb42OIRPUmjd0cSb8M//8jnjSLbEHVyGyZXjrDoplXEin+G55loG5TmTg/JjhezOMrTIK+kW6Kb1ouwucQAhE9t7ao7dmumRGlx/HVlcko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnozQmE1amlYSElSY25vRGtEbC9EY1NEaUNwVms0TTNvYlArOVdtRG5vMU5w?=
 =?utf-8?B?SHBETXY0N0M3Y2lpVk1yZitaQ1dTd1psU0lZa01vZXBXR2ZvWEN1Rjk0VHAz?=
 =?utf-8?B?V1l0ZFN5YWpnSDI4YU93UXVROHFoOFMvQmhCemJVZWVFaGEvdVRTUHczTGl3?=
 =?utf-8?B?YlpRM2h2K042Yy9UdFM4RHhid0ZQeGFEMWtDQ21qa2lpNHEyUnZMWDhRMHBR?=
 =?utf-8?B?Tzdtdnc0QU0raUJ1cGpmWkxaWVo3dHNyVzJod0NFSjZESXpJUCtaR1RPWnp1?=
 =?utf-8?B?d3hKM2hnbllTTTR0bGQwWDQreGRBYUpmc0lVZmRhUVdlQ2NQV21oZEVKWit6?=
 =?utf-8?B?UDZmZkNXV3dWUXJUdjJzZ2xBUThSa1c2R24yeDg0Ky8ydHhHd2JTSGN1bTZJ?=
 =?utf-8?B?eGliMWl0K3B1Wk5QandHajRrZ1JON0ZNK1Byc3hWV21oQ1FyckRiM2ZUSkx2?=
 =?utf-8?B?bVkvaE1pRFZqMDFmNjFFZUVmbmhuenJDdGtxeTRzTThLQnBCT3ZwRURQUDgr?=
 =?utf-8?B?enp3OTV5YmRWZk10M01tNFRMaTRYdFU3WjNJdk93Z1JkdTg2Sms1T2FMYjUv?=
 =?utf-8?B?TzY2aE9ya2pxeTFPclNTeFVhVW5NQjVPdkVsR1MzWm1LUlBFSk90S0hFc1F0?=
 =?utf-8?B?MmJZSE5wK1ZGOUtwOW1QNUMzSnYvSFoydEJNUFhLNXBhaHBSdHIyQzV6UGRJ?=
 =?utf-8?B?dnVJblhwMkhLczV4S1ZiOW1jVC9vVGZYUGpMUXhFVjg2ZTMzam9uRTFMczI1?=
 =?utf-8?B?M0IzQjBmRDlscFRKOGw2d2lzNmFOS2RkZmU5ZUtHMk9VLzZZaGRPdDJZRitR?=
 =?utf-8?B?RkJqRGNGQUJucktjOURmcEpJSnUvbGV2bE9ZYW14QS9USmdJV3MzYkJmN3Jk?=
 =?utf-8?B?N0ZuTEdIeU1FUFRpVDlQYUhXR3hOYTdzZXJ4ODVhNmJuK2srT1laWDVoTStt?=
 =?utf-8?B?UStYRnVZWlVsNDBpSUU2NjhmUGZaOFM2U1FYY0RkQ0tGYTF4R29xQThaSGE0?=
 =?utf-8?B?Z2RackFtMUhwTWZOYzFOWnovZFdFalBpRXlvUkZIanlxRStWeUttaHJFUGVL?=
 =?utf-8?B?VWFJRGxJcjkvcWZ4RzExRUF3QkNhcE43QndsekwvU2JXREw4TEFzTk1reU9U?=
 =?utf-8?B?TVU3NkE1UGJSZThiWXNjUCtJUUNkOUljaGFDeUlqZVN4M3V5cjNsQWEyUSt6?=
 =?utf-8?B?bEIwWEo2RHpPVE5VQzVVVUpGNHlXQ0d5bkV6UDM1Y3I1MDFFVDFqODRqU1k1?=
 =?utf-8?B?dEhkYitwQnFZL2VmMktub25iVjM5NDZkdmZqNmxna2p2UllEeXhCYzJTbXFM?=
 =?utf-8?B?SkZ4eFVTM1dZakR6U3RWUGdScmo1dWh4ZGRqdUMwN2I1RVR6WXZCcnRsc3l4?=
 =?utf-8?B?ckUwVGNzamVtVW0wUWV4TWhKRVlYeGZILzFERDE3aUNmSjVlRHlrMlR4eDRy?=
 =?utf-8?B?NkJpTENrZUFQVjF2WlVQNjFFVDh3TkllczI2R3BEV2V4QzJJTHZTaGNlZHZO?=
 =?utf-8?B?Y2NiQkZuc2I1dktsNXhPcGN6WTVwR00wODl3WmY0Rm1BT3RrQ0tiSU9BYStG?=
 =?utf-8?B?QkZtZnhhd1R1TEtiRE9yVW1zK3pqVmJEZ3lwZkxwTG5FSjcrcldqTTkrTjZW?=
 =?utf-8?B?Z2JuQ0ttdkFKNmtkVnh5RHE1WkhyZlQvMUMyRnRZOGZSY2VOKzJ4eUIxaDgr?=
 =?utf-8?B?dEtlZTlFV2luSkpHVFBycXRQbE8vSXRreE96U2l3bVo3eE82UnZ6Tkp2R2Rx?=
 =?utf-8?B?RVE5RzRueHdhelIxNDh4Tm9CcitwSjBVOE5SYzVBVjZoZmsvNGhPQjNVRUU5?=
 =?utf-8?B?S2kySjJrMDY1U3QzUWtVUFM3OGg0cDk2MHd4WVUyVGU1dHhlNmRmZlpQSnJV?=
 =?utf-8?B?UHlZckhnYUdNaWNYQ3dxa3NTb21NK2Q1aWQvT2JSeno2bXJTMExsdTdzRkla?=
 =?utf-8?B?S3ViWW9YaytlMnpzY0hZMmd6NGRSUXRBMlduTVFpT1cyKy9OYzdURm5Uc0RS?=
 =?utf-8?B?ci8yTko5bGpuSlhjWVFnTXBhWm5pSHhKaUxhQ1BEdXZpOGlLNUNYbDFHekZp?=
 =?utf-8?B?N1hwUjl3akhsMGhDdlNPeXhZZnBDVFp0N0VxeDlMZ2hXUG9UZGhXVHhaRXFX?=
 =?utf-8?B?YkV4amZHNGt1KzI0bUlKNE5tSTZBQ1AzYmtFK2owdy9INTZxcHpyYVg5bytS?=
 =?utf-8?B?Y205d2dJeURndGZleWk2ZU8yQW5QZEhDdkNyb1M4c0k5bGVITUI2Q0VvOUw5?=
 =?utf-8?B?azdtcjN4c1VUSWFhNGpZdWUzYmU4N1J4TGdHU25VSGt3ZUtTbkErVEl3QnV4?=
 =?utf-8?B?UUhoZlVNMkZzcnhObkVBK2QvM0Fqa1JxRkRjclduOWh3VWJjTW9TQT09?=
X-Exchange-RoutingPolicyChecked: rwvNM1gAmYTVwxjuk3D4ItoiSm5a/QK9/UnMHVi3MxN2j+waUy1T4IT3o2UZuUbkO3oedS9HZ0IGnBRQqNX7qTPcRJ8N9ic2mjnc1X1MImNtg2Qs8Klc/vrENSh+91d+qecwBdUyUInQUhLqiOwp6vLZ1w3+dC21CBnKJ07DyBpygp2Hu4H/5oJcvnP/RpZS5JETfp8A6MUtlM38kVGZ9xBmFUXXy2algFOaQb2MjmQbha5JIPGq9ZIx+TxuJnFNIZ/5qJElrzTN/8/sOZU2x+7RdrrF0v+VXGU/RJNe0mdCC2kwNkBb98S12P/2GJ4/Fzy9DlAfwXFvYmBaCKJiXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: acb894e0-ae11-428e-4f29-08de96c66f85
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 06:00:15.2759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDkm05EjfQ63LSx0WFWluWXXpVB/L9qjtDfvoQp0S5LPGp9Xi6amZVw1ziX94ptBZx5hq+NyE4t6PtZ6sdnVrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
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

Hi JP

On 01-04-2026 12:34 am, Juha-Pekka Heikkila wrote:
> choose mode from connector with lowest bandwidth requirement
> for tests to try to fit tests into bandwidth limitations
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 34 +++++++++++++++++++++++++++++-
>   1 file changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index f08d33d7a..10061b5d9 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -609,6 +609,24 @@ static void build_test_suffix(data_t *data, enum test_type type,
>   	}
>   }
>   
> +static drmModeModeInfo *find_lowest_mode(igt_output_t *output)
We do have igt_output_get_lowres_mode(), check if this can be reused?
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *low = NULL;
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *mode = &connector->modes[i];
> +		int pixels = mode->hdisplay * mode->vdisplay;
> +		int low_pixels = low ? low->hdisplay * low->vdisplay : INT_MAX;
> +
> +		if (pixels < low_pixels ||
> +		    (pixels == low_pixels && mode->vrefresh < low->vrefresh))
> +			low = mode;
> +	}
> +
> +	return low;
> +}
> +
>   static void
>   run_sharpness_filter_test(data_t *data, enum test_type type)
>   {
> @@ -645,7 +663,21 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   					 data->mode->vdisplay,
>   					 data->mode->vrefresh);
>   			} else {
> -				data->mode = igt_output_get_mode(data->output);
> +				if (is_invalid_test(type)) {
> +					data->mode = igt_output_get_mode(data->output);
> +				} else {
> +					data->mode = find_lowest_mode(data->output);
> +					if (!data->mode) {
> +						igt_info("No mode found on output %s\n",
> +							igt_output_name(data->output));
Fix indentation
> +						continue;
> +					}
> +
> +					igt_info("Executing on lowest mode %dx%d@%d\n",
Add output name in igt_info()
> +						data->mode->hdisplay,
> +						data->mode->vdisplay,
> +						data->mode->vrefresh);
Fix indentation
> +				}
>   			}
>   
>   			igt_output_override_mode(data->output, data->mode);
