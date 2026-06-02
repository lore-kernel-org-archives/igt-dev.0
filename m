Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9445CD6E4A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 05:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB28113862;
	Tue,  2 Jun 2026 05:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BtQXCSbU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AA5113862
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 05:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780379305; x=1811915305;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1q6CjYtfSzcSL9KEPMI5/ErG/AiFxpDRhgqNa9JukHs=;
 b=BtQXCSbUcuoxVAvK+u4ZnmaeccPG7O7P37AhsmchZn/fjzCnm67M4JlO
 FGXfpBPUsQGIefar2wJqVw5o/cuvUIWSIDH7CIsOwOAHuwhrVtygHFGqO
 tH8B8V+XvaNlhBjHmZJSiqk6DxsDoFVF1vVZO4H6wJq8WMw+6qQIJX//3
 32OaTj5CeCd4eeBvDomySLlFVoqKsKuwGqew5hO47L1Og51iAabI97JgV
 vWKDnLGw/iDZ+uQ7TCQf3IbfrOl9PnxBu6A4WIvJxuWrIkM52jdDoQQvD
 9rHGB2TmHcwbfqnjwL5EH9OPVT85+xPNo1nLpwSAiMwVs527NaBpA/pwI g==;
X-CSE-ConnectionGUID: H+rnMdYlTc2CoCS9sPv8fg==
X-CSE-MsgGUID: I6VYXss0QkKGgSWpj5+EdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80186893"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="80186893"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 22:48:25 -0700
X-CSE-ConnectionGUID: xx81F/cwTSygy04BXWlY/g==
X-CSE-MsgGUID: j5q+EIiTSPOrZMOe/hqLew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="243909505"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 22:48:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 22:48:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 22:48:24 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 22:48:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcGwa5ZGZpXfcGEqHQo7D/CSaNLSGQkLyYCy9B9GLi8W3hWVsOeDPLyPhtBW1RdC5mvhAfc04aGmxapgOql3V7JEoFO08S79Y7bPhZqmKsloDCLw8+5jDxhwWcdAdRM/eas5A7ObalnjmMkNEYSYq5CmIWWZyG8nU0Wsb/+gw28idOJUvYWUv89UYSTO5ZXsRlW5F9JC8i09vE4vJTipuEZaOhIvWs05cmTVF1y0ynnvx++9ZclZEiCHH0VhrbCJMVMq+SZ3Hsb0d4h03w88IeIYRkWZzqM+mD1I4+LTYfDiIzB5I+8mtiSGOspu1TVEELLHpY/Uo8Hx1zVjv0wcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHsXUxbeOQBC0VBSP0fzEW7TIC4xtYnCRGJRBlci3Ak=;
 b=XdNTV0IVq+OXOc0z5f5y/RQzjaiQG3O21ElHSPE5ag8nRtKbvcYLoMvDG7LZ9YZMxjUjfgtIdO/Nv3btewrcMpIkCtPebmkt5GzJJFjy9pCf0LVkUlAjljxfeczOP47kTLh78ZfapxKgIg8XVoYy91RkApfe6XLjSpxbvNJvBfsc/7L2WioyodGl5ZKE3ND/HhMOHF3bAYvVGQKMovfn0q3G+tJofPTS4nWURfB2GzHY5k+r5T8H8V3kjOe78qqm/o27GheVZBxt1zyZccA6X9C870wIr8iAoHQFy/WJaufGMW/fj2fJ4As43fvDpPd1j0Y3xJrFfEfiXHETAWX4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 05:48:20 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0071.011; Tue, 2 Jun 2026
 05:48:20 +0000
Message-ID: <35051548-7abf-40d1-ba53-092f238fe4c3@intel.com>
Date: Tue, 2 Jun 2026 11:18:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/3] tests/intel/kms_pipe_stress: fix inverted
 condition skipping plane setup
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <ramanaidu.naladala@intel.com>
References: <20260527071940.3285269-1-sowmiya.s@intel.com>
 <20260527071940.3285269-2-sowmiya.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260527071940.3285269-2-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::10) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e1bf14f-2ef4-44cf-18e2-08dec06a8d6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: act9MLe+NbOvbzlpGe9qicVGUaPszPfXV9EAEtSRgk3SoOYAqPEamdH/BaWOX0/V+UwShz5p9YQOuGjxXjoJbizP5FdSbLIHHjkgdaFoTxzwftNLvDnFW9flSqbO6Y+MOKlWSYIyyz6pSzUSm2XpHuO3sb/5f5qZaMzgysU81lJStFiRc4KUnCLWCsysj3cKpfO0NYj208GiO97YR4OQi5xkwWYkoDs3nuRs293T9z5tUG4kA/DCQnC8G6WSwGrBermbk4jG4z9S3l15ifr/hN2k6NsnZPLAcSRu+4Qt6pCh3n3t7UMufAP2Pp9ehm0MZtsbKm+ywyUxVaVaRUveJYLAE7YYPue5OP+3/As6kwIDhgjqGb23AVEjgnE00dRILBOe4WLA/FvXQRamRpWqlfVkpEV5APBrnTw+EhUegCk3cp7J/3GFOiB+pMH5cZfkbgFVJdvU3BOjrnNDSlffxDtiVWMn8F+1Fgvag4DPmD2Pu5KDkuN8lurWPyHCTqhIaH3PlmV7rSeOpqUTMVO6WAS6KRuIJo0E46HoJgKXUUFaam/y+BpJTgMidi07Ln+/2fDWaZ2MK5drTrLBN18YCAf5Tk3v1v5u+/i5Gs+IzelQYzBqUeIkbrgg9iBZET2bDjWu7DkKa4Nc1GrGHb+bXZL2zQitS6nNwvbppeQ0hQ5TrNEmDtpxFifH+u/34Aku
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUdRNy9INXkzMjJ3ZU9yQzI5RGJRSFNTVHZwTGttNmpxR0VxalltUVgybVV1?=
 =?utf-8?B?bjBNa3pkQXJQNVZiVENmZkJJcFhuM1paQTlNVkk1NkZ0d3QrR2djMEhpSzI1?=
 =?utf-8?B?WEMxWnBVY0RXNnJWck1mRkJTdlYwaEZkVEdUNGRTSjhDS1paMzBHcUJBOUFL?=
 =?utf-8?B?cjJ6Zmo0NDdyUVk2SVMyYkpaei96YnE4MW5MbHFBcHJNczlEZm5hcTRaMVhN?=
 =?utf-8?B?dFRRa09qeDFNK011RWZ5d1FBNGg4a3EyY3BqVHhuMmpRQmRHTDBsOEJ2dkdG?=
 =?utf-8?B?bElZelptT0dPSDdUVU03eS9Vbno2TjJFZHJ3UEFWTTkvcGZJR2hBN3ludWpt?=
 =?utf-8?B?L3hBanl5WWpWNEgzcmRsbFhwbEpxZUVWSmpaL3dHK1U4d2oxam1NdnA4Q3Zv?=
 =?utf-8?B?Ulo4dmFoMEdXakVZald4V0dTUmlHUVBZSXREbG5nTnpKaGh4ZEhub09kN09r?=
 =?utf-8?B?V2R1QTJVZkthOUpOcEVCVW5ZdHV3dHFnM0U2UVUydEhsMjdzZVdDZVh4Z0c1?=
 =?utf-8?B?T1djNjdaN3pTZS9wRm1lY3kycEJmMW1LeUhQUnVoMDVJTy9PS1hWTGwzKzJQ?=
 =?utf-8?B?YVQ5elg0TmJIaTc1WDFkZU1lYWFWWU1ETldVRnh1R1lBQ0tWVmh4dmxta2w1?=
 =?utf-8?B?VFViYzJrN0NiVFQwaHZiM3RkdjVrMEpHdVU5c0g0cnpuZW9mVjlUUmZxa0xI?=
 =?utf-8?B?QlZyeElLTytJOFJwOEZ3WUUreDc3V0lBcnFDY09JMTlUQmFxOS8rNW5ucGtw?=
 =?utf-8?B?SWJhKzJJbkRXT1F3cU9HTC9TZ2sxTWRJaWF3TmxSSXo4a01NOVFsMm43c3lT?=
 =?utf-8?B?VGVZTDJKWm5ta2R3YXdVbHF3N1daallVck5PZlYybFpucjdXRjNIcHVzM0Rl?=
 =?utf-8?B?eWtPcUQzQWxkdURWc3daemtWaEN1RDBIZVJrZmk0Y3NlSkpDbmgxMUdFRDZY?=
 =?utf-8?B?UjVVV3ZPREZVV3ZDSmRwUmp3Yy9ET0g5WkJrdzdjdXRxa21PSFRscXlsL1JK?=
 =?utf-8?B?aXZWbDVCbEpITFBsVzZTTG94UnJWbmxxelFvRDlKMmxUQWExMEpNdENSQkND?=
 =?utf-8?B?WjZ6bFd0VDNwSDJLNnlkWnZPbFczT2kzUnpVOERsWllRdGdFVVRZU3hTM3No?=
 =?utf-8?B?OVFTR1NrYXNGN3cyRDk1RFpqZjJhbUw4YlJTSk95aitZM0dXVW9OeU9VVDRP?=
 =?utf-8?B?c0Y0M3VWY2xWc3BuQWVDdFAzQXcyV3hRSmhuQTJ5WWFXQ0ZqeDROc2dXQ2JV?=
 =?utf-8?B?UFhxTDBCc0VkY2lpbzMwSFB4K0djQ1lMOUpwOUxWRVp0RVFIdTZvQm5XRzFm?=
 =?utf-8?B?RVMrMTE2SWdHL2o5U29GMW9uT1VIZzVuSFh6emRXcXZyMWZHMkFzM3BCOXV2?=
 =?utf-8?B?NEVWM0toTXpHTHpIQnVvdFpMb0lRdTRnQTdIMFRoRC9DeHZZWjRWckpsQW1W?=
 =?utf-8?B?WGx5ZlVCczZ2b1lOaStkamdiN2RiUWlqd0dmUGtQcEphSE9PaU5OdHhVWkZo?=
 =?utf-8?B?bklKd0ZUblhCNFNYbnhreWJGWGRDclJwZkFaby9RQ3lBV0VnQlFLVmVvRkIx?=
 =?utf-8?B?QjJTS3Nwek5rNG9aTWlNQm42Q25lRUVSN3UvMUxYKzB4NjljWk1LL0x0dU4z?=
 =?utf-8?B?YmJuOEVQdDNwZVp6akhZV0FPRERHZHBNajB1RTA0NlUzN2sxWlVaSDY0cEJL?=
 =?utf-8?B?c25xd2t4RTJpcGZLREQ2aE05YUZubEdrOVl1VHNZUWZGbVgyUXVVY2RCUFVR?=
 =?utf-8?B?M3RoOXlxM2RqemZoRGdhVHBKV0pFOEN5SWFvamdCaWFxUm1yZENmTGJoV3Jn?=
 =?utf-8?B?Z2F6QU53d1M0RCswMTZtUnlDMU1HVkpVK0s5WTZxTGFYVHFrRVdlSXdhSFhM?=
 =?utf-8?B?T3ViNFF1MkFZdWthaWJuaHhvT3FZc05oSGtUdWU5ZWJPWjBxeWxEZkkwcmVt?=
 =?utf-8?B?eEx4cDNDMGxCT2RmRWxsU3dHZkwvSURPNUVObWpOU2NIaG1HTC9XZ056V2RH?=
 =?utf-8?B?K2dXQTJEc3F4Z3N5ZUcxYlJ5VjRMdHpJa2NtU2VwNkxIWDZ1ZURTTjl3d1VE?=
 =?utf-8?B?VnFLMDZLNHJiYll3bjBXM3l3VGtLYWp4dU9UWkZQdEVkejlMM2xtYkZLUWxL?=
 =?utf-8?B?V2kwc0cwLzBadVV6WDQrYU9VUUJ0TmZVd2lSRExZYkEwYXptdGU3SmxyZ3Np?=
 =?utf-8?B?aEo4QzIraUdQeExVNFVYV3d5NXdxMlhLWldZb3kxTUllTjljc3NlUVpQYkgw?=
 =?utf-8?B?OVRjL0ZQemE4Znh2WHRHSUNOUXhXSTRjYkNVUk9EL1hIVWRwODgrMXg3NFhx?=
 =?utf-8?B?V0U5MnMvM1lKNUdiR0JubENkekF3SmZxSTVnSVIvRlQ1bWxINEFLZz09?=
X-Exchange-RoutingPolicyChecked: eXTnD9+znzcJGc8ZEOeTR7Q/IG/PuDeFVRmCV+YKLRnytrGOgZA+cY2YZcQm6wM4cFzpxcL0FzV1Xh2MNYoyQCgupHMOG09XX3y3KIMmSyFOpn0cw0OjifRYj1AzS9PJZJaEkje0d22L9GOmmPTJm6AkNLwvswwG/2b8yJJyBtgeSJURFGXiMpuVLCoQ3mYtMWTvt206uar+H6CVWj8LYLZppf0JxVivVHFbh/dgi6Xn/1cqEQh9J7OZrPLRUl0L2Cwy7D5nQTraTPJ3ovTvLpH+wpMwyc6YN7zirfKtddPCCznSwcAa64zLfUl5j8sAYoutd0OfQz1wAzUTXo4s+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1bf14f-2ef4-44cf-18e2-08dec06a8d6b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 05:48:20.7164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQTXrBSfGyVNnBrSwcUdmQf+IMA7jHzHD9vD2+VtnFA50RmEZI63RFJjQ4MzkVyyHCn25v4oerSEsO2GbQUuyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
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

Hi Sowmiya

On 27-05-2026 12:49 pm, Sowmiya S wrote:
> The condition after commit_mode() was "if (!ret) return ret;"
> which returned immediately on success, skipping the entire plane
> and cursor setup loop. Fix to "if (ret)" so the loop runs on
> success and returns only on failure.
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   tests/intel/kms_pipe_stress.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 36e3842c6..8724a674c 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -411,7 +411,7 @@ static int crtc_stress(struct data *data, igt_output_t *output,
>   		ret = commit_mode(data, output,
>   				  crtc, mode);
>   
> -		if (!ret)
> +		if (ret)
>   			return ret;
>   
>   		data->last_mode[crtc->pipe] = mode;
